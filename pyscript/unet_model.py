import os
import torch
import torch.nn as nn
import torch.optim as optim
import numpy as np

# =====================================================================
#   1. GEOSPATIAL 2D CONVOLUTION BLOCK WITH SPHERICAL BOUNDARIES
# =====================================================================
class SphericalConvBlock(nn.Module):
    def __init__(self, in_channels, out_channels):
        super(SphericalConvBlock, self).__init__()
        self.padding_lon = 1  # East-West (Circular)
        self.padding_lat = 1  # North-South (Replicate)
        
        self.conv = nn.Conv2d(in_channels, out_channels, kernel_size=3, stride=1, padding=0)
        self.bn = nn.BatchNorm2d(out_channels)
        self.gelu = nn.GELU()

    def forward(self, x):
        # 1. Apply circular padding to Longitude (dim -1) so waves wrap around the Earth smoothly
        x = nn.functional.pad(x, [self.padding_lon, self.padding_lon, 0, 0], mode='circular')
        # 2. Apply replicate padding to Latitude (dim -2) to safely handle polar boundaries
        x = nn.functional.pad(x, [0, 0, self.padding_lat, self.padding_lat], mode='replicate')
        
        x = self.conv(x)
        x = self.bn(x)
        return self.gelu(x)


# =====================================================================
#   2. GEOSPATIAL CLIMATE U-NET ARCHITECTURE
# =====================================================================
class UNetClimate2d(nn.Module):
    def __init__(self, in_channels=3, out_channels=1, features=[32, 64, 128]):
        super(UNetClimate2d, self).__init__()
        self.downs = nn.ModuleList()
        self.ups = nn.ModuleList()
        self.pool = nn.MaxPool2d(kernel_size=2, stride=2)

        # --- ENCODER (Downsampling) ---
        curr_channels = in_channels
        for feat in features:
            self.downs.append(
                nn.Sequential(
                    SphericalConvBlock(curr_channels, feat),
                    SphericalConvBlock(feat, feat)
                )
            )
            curr_channels = feat

        # --- BOTTLENECK ---
        self.bottleneck = nn.Sequential(
            SphericalConvBlock(features[-1], features[-1]*2),
            SphericalConvBlock(features[-1]*2, features[-1]*2)
        )

        # --- DECODER (Upsampling) ---
        for feat in reversed(features):
            self.ups.append(
                nn.ConvTranspose2d(feat*2, feat, kernel_size=2, stride=2)
            )
            self.ups.append(
                nn.Sequential(
                    SphericalConvBlock(feat*2, feat),
                    SphericalConvBlock(feat, feat)
                )
            )

        self.final_projection = nn.Conv2d(features[0], out_channels, kernel_size=1)
        self.dropout = nn.Dropout2d(p=0.1)

    def forward(self, x, target_std=1.0):
        # Transpose input to match PyTorch CNN standard layout: [Batch, Channels, Lat, Lon]
        x = x.permute(0, 3, 1, 2)
        
        # Save SSTA raw anomalies as a physical baseline reference scale-matched
        input_residual = x[:, 0:1, :, :].clone() / target_std 

        skip_connections = []

        # Encoder forward pass
        for down in self.downs:
            x = down(x)
            skip_connections.append(x)
            x = self.pool(x)

        x = self.bottleneck(x)
        skip_connections = skip_connections[::-1] # Reverse the order for the decoder joins

        # Decoder forward pass with spatial scale checks
        for idx in range(0, len(self.ups), 2):
            x = self.ups[idx](x)
            skip_connection = skip_connections[idx//2]

            # Adjust dimensions if odd-numbered grid dimensions caused rounding down mismatch during pooling
            if x.shape != skip_connection.shape:
                x = nn.functional.interpolate(x, size=skip_connection.shape[2:], mode='bilinear', align_corners=True)

            concat_x = torch.cat((skip_connection, x), dim=1)
            x = self.ups[idx+1](concat_x)
            x = self.dropout(x)

        x = self.final_projection(x) + input_residual
        
        # Permute back to your pipeline layout standard: [Batch, Lat, Lon, Channels]
        x = x.permute(0, 2, 3, 1)
        return x


# =====================================================================
#   3a. AREA-WEIGHTED LOSS FUNCTION (STABILIZED FOR ANOMALIES)
# =====================================================================
class AreaWeightedRelativeL2Loss(object):
    def __init__(self, lat_coordinates, eps=1e-3):
        w_lat = np.cos(np.radians(lat_coordinates))
        self.w_grid = torch.from_numpy(w_lat).float() 
        self.eps = eps 

    def __call__(self, y_pred, y_true):
        w_expanded = self.w_grid.to(y_pred.device).view(1, -1, 1, 1)
        
        diff_sq = (y_pred - y_true) ** 2 * w_expanded
        true_sq = y_true ** 2 * w_expanded
        
        diff_norm = torch.sqrt(torch.sum(diff_sq, dim=(1, 2, 3)))
        true_norm = torch.sqrt(torch.sum(true_sq, dim=(1, 2, 3)))
        
        return torch.mean(diff_norm / (true_norm + self.eps))


# =====================================================================
#   3b. AREA-WEIGHTED SPATIAL PATTERN CORRELATION METRIC
# =====================================================================
class AreaWeightedPatternCorrelation(object):
    def __init__(self, lat_coordinates):
        w_lat = np.cos(np.radians(lat_coordinates))
        self.w_grid = torch.from_numpy(w_lat).float()

    def __call__(self, y_pred, y_true):
        device = y_pred.device
        w = self.w_grid.to(device).view(1, -1, 1, 1)
        
        p = y_pred.reshape(y_pred.shape[0], -1)
        t = y_true.reshape(y_true.shape[0], -1)
        w_flat = torch.broadcast_to(w, y_pred.shape).reshape(y_pred.shape[0], -1)
        
        mean_p = torch.sum(p * w_flat, dim=1, keepdim=True) / torch.sum(w_flat, dim=1, keepdim=True)
        mean_t = torch.sum(t * w_flat, dim=1, keepdim=True) / torch.sum(w_flat, dim=1, keepdim=True)
        
        p_ano = p - mean_p
        t_ano = t - mean_t
        
        cov = torch.sum(p_ano * t_ano * w_flat, dim=1)
        var_p = torch.sum(p_ano ** 2 * w_flat, dim=1)
        var_t = torch.sum(t_ano ** 2 * w_flat, dim=1)
        
        corr = cov / (torch.sqrt(var_p * var_t) + 1e-8)
        return torch.mean(corr)


# =====================================================================
#   4. MAIN OPTIMIZED TRAINING WRAPPER ROUTINE (WITH DYNAMIC SPLIT)
# =====================================================================
def run_toolbox_fno(ssta, vara, lat, lon, varn, sea, val_split_pct=0.15, 
                    val_idx_list=None, train_idx_list=None, optimize_for_pattern=False,
                    checkpoint_path=None):
    torch.manual_seed(42)
    np.random.seed(42)

    nlat, nlon, _, num_samples = ssta.shape

    lon_grid, lat_grid = np.meshgrid(lon, lat)
    lat_norm = 2 * (lat_grid - lat_grid.min()) / (lat_grid.max() - lat_grid.min()) - 1
    lon_norm = 2 * (lon_grid - lon_grid.min()) / (lon_grid.max() - lon_grid.min()) - 1

    X_data = np.zeros((num_samples, nlat, nlon, 3), dtype=np.float32)
    X_data[:, :, :, 0] = np.moveaxis(ssta, -1, 0).squeeze(-1)
    X_data[:, :, :, 1] = np.repeat(lat_norm[np.newaxis, :, :], num_samples, axis=0)
    X_data[:, :, :, 2] = np.repeat(lon_norm[np.newaxis, :, :], num_samples, axis=0)

    Y_data = np.moveaxis(vara, -1, 0)[:, :, :, np.newaxis].astype(np.float32)

    # --- TARGET DATA STANDARDIZATION ---
    y_mean = Y_data.mean()
    y_std = Y_data.std() + 1e-8
    Y_data = (Y_data - y_mean) / y_std
    print(f"--> Target variables standardized: Mean={y_mean:.4f}, Std={y_std:.4f}")

    X_tensor = torch.from_numpy(X_data)
    Y_tensor = torch.from_numpy(Y_data)

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"--> Execution Pipeline Configured on Device Target: {device}")

    # Build U-Net Architecture
    model = UNetClimate2d(in_channels=3, out_channels=1).to(device)

    # --- TRANSFER LEARNING LOAD OPTION ---
    if checkpoint_path is not None and os.path.exists(checkpoint_path):
        print(f"--> [WARM START] Successfully loaded pre-trained Stage 1 spatial weights from: {checkpoint_path}")
        model.load_state_dict(torch.load(checkpoint_path, map_location=device))
        lr = 0.0002   # Lower learning rate to tune existing features safely
    else:
        print("--> [COLD START] Initializing spatial ConvFilters randomly.")
        lr = 0.001

    epochs = 100
    batch_size = 16
    
    optimizer = optim.Adam(model.parameters(), lr=lr, weight_decay=1e-5)
    scheduler = optim.lr_scheduler.StepLR(optimizer, step_size=30, gamma=0.5)
    criterion_l2 = AreaWeightedRelativeL2Loss(lat, eps=1e-3)
    corr_metric = AreaWeightedPatternCorrelation(lat)
    criterion = criterion_l2 if not optimize_for_pattern else lambda pred, true: 1.0 - corr_metric(pred, true)
    
    # =====================================================================
    #    FLEXIBLE TRAIN / VERIFICATION DATA SPLIT IMPLEMENTATION
    # =====================================================================
    full_dataset = torch.utils.data.TensorDataset(X_tensor, Y_tensor)
    
    if train_idx_list is not None and len(train_idx_list) > 0:
        train_indices = list(train_idx_list)
        print(f"--> Using CUSTOM hand-picked training index list (Count: {len(train_indices)})")
        
        if val_idx_list is not None and len(val_idx_list) > 0:
            val_indices = list(val_idx_list)
            print(f"--> Using CUSTOM hand-picked verification index list alongside training set (Count: {len(val_indices)})")
        else:
            val_indices = [i for i in range(num_samples) if i not in train_indices]
            print(f"--> Auto-assigning remaining samples to verification set (Count: {len(val_indices)})")
            
        train_dataset = torch.utils.data.Subset(full_dataset, train_indices)
        val_dataset = torch.utils.data.Subset(full_dataset, val_indices) if len(val_indices) > 0 else None
        num_train = len(train_indices)
        num_val = len(val_indices)

    elif val_idx_list is not None and len(val_idx_list) > 0:
        val_indices = list(val_idx_list)
        train_indices = [i for i in range(num_samples) if i not in val_indices]
        
        train_dataset = torch.utils.data.Subset(full_dataset, train_indices)
        val_dataset = torch.utils.data.Subset(full_dataset, val_indices)
        num_val = len(val_indices)
        num_train = len(train_indices)
        print(f"--> Using CUSTOM hand-picked verification index list (Count: {num_val})")

    elif val_split_pct > 0.0:
        num_val = int(num_samples * val_split_pct)
        num_train = num_samples - num_val
        
        train_dataset, val_dataset = torch.utils.data.random_split(
            full_dataset, [num_train, num_val], 
            generator=torch.Generator().manual_seed(42)
        )
        train_indices = train_dataset.indices
        val_indices = val_dataset.indices
        print(f"--> Using AUTOMATIC random split with {val_split_pct*100}% validation allocation")

    else:
        num_val = 0
        num_train = num_samples
        print(f"Running on FULL dataset: {num_train} Training samples | 0 Validation samples")

    if num_val > 0:
        log_dir = "/work/miz/mat_hiresmip/fno_gf/"
        os.makedirs(log_dir, exist_ok=True)
        
        train_log_path = os.path.join(log_dir, f"fno_indices_train_{varn}_{sea}.txt")
        val_log_path = os.path.join(log_dir, f"fno_indices_val_{varn}_{sea}.txt")
        
        np.savetxt(train_log_path, train_indices, fmt='%d', delimiter=',')
        np.savetxt(val_log_path, val_indices, fmt='%d', delimiter=',')
        print(f"--> Saved experiment tracking indices to: {log_dir}")
        
        train_loader = torch.utils.data.DataLoader(train_dataset, batch_size=batch_size, shuffle=True)
        val_loader = torch.utils.data.DataLoader(val_dataset, batch_size=batch_size, shuffle=False)
    else:
        target_dataset = train_dataset if (train_idx_list is not None) else full_dataset
        train_loader = torch.utils.data.DataLoader(target_dataset, batch_size=batch_size, shuffle=True)

    best_target_loss = float('inf')
    best_model_weights = None
    
    for epoch in range(1, epochs + 1):
        # --- 1. TRAINING LOOP PHASE ---
        model.train()
        epoch_train_loss = 0.0
        
        for X_batch, Y_batch in train_loader:
            X_batch, Y_batch = X_batch.to(device), Y_batch.to(device)
            optimizer.zero_grad()
            output = model(X_batch, target_std=y_std)  
            loss = criterion(output, Y_batch)
            loss.backward()
            optimizer.step()
            epoch_train_loss += loss.item()
        
        avg_train_loss = epoch_train_loss / len(train_loader)

        # --- 2. VERIFICATION LOOP PHASE ---
        model.eval()
        if num_val > 0 and val_dataset is not None:
            epoch_val_loss = 0.0
            epoch_val_corr = 0.0
            with torch.no_grad():
                for X_batch, Y_batch in val_loader:
                    X_batch, Y_batch = X_batch.to(device), Y_batch.to(device)
                    output = model(X_batch, target_std=y_std)  
                    
                    val_loss = criterion_l2(output, Y_batch)
                    val_corr = corr_metric(output, Y_batch)
                    
                    epoch_val_loss += val_loss.item()
                    epoch_val_corr += val_corr.item()
                    
            avg_val_loss = epoch_val_loss / len(val_loader)
            avg_val_corr = epoch_val_corr / len(val_loader)
            
            current_target_loss = avg_train_loss
            print(f"Epoch {epoch:03d}/{epochs} | Train Loss: {avg_train_loss:.4f} | Verification L2 Loss: {avg_val_loss:.4f} | Spatial Correlation (ACC): {avg_val_corr:.4f}")
        else:
            current_target_loss = avg_train_loss
            print(f"Epoch {epoch:03d}/{epochs} | Train Loss: {avg_train_loss:.4f}")

        # --- 3. COMPACT MAX-DURATION OPTIMIZATION CHECKTRACK ---
        if current_target_loss < best_target_loss:
            best_target_loss = current_target_loss
            best_model_weights = {k: v.cpu().clone() for k, v in model.state_dict().items()}

        current_lr = optimizer.param_groups[0]['lr']
        scheduler.step()
        if optimizer.param_groups[0]['lr'] < current_lr:
            print(f"--> Learning rate decayed to: {optimizer.param_groups[0]['lr']}")

    if best_model_weights is not None:
        model.load_state_dict(best_model_weights)
        
    valpct = str(val_split_pct)
    
    fn = f"/work/miz/mat_hiresmip/fno_gf/fno_toolbox_weights_{varn}_{sea}_{valpct}.pt"
    torch.save(model.to('cpu').state_dict(), fn)
    print(f"\nBest model weights (Loss: {best_target_loss:.4f}) saved successfully to {fn}")
    
    return model
