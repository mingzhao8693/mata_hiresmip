import os
import torch
import torch.nn as nn
import torch.optim as optim
import numpy as np

# Import the differentiable Spherical Harmonic Transform primitives
import torch_harmonics as th

# =====================================================================
#    1. SFNO SPHERICAL HARMONIC MULTIPLICATION LAYER
# =====================================================================
class SphericalSpectralConv2d(nn.Module):
    def __init__(self, in_channels, out_channels, nlat, nlon, max_modes=None):
        super(SphericalSpectralConv2d, self).__init__()
        self.in_channels = in_channels
        self.out_channels = out_channels
        
        # Define the forward and inverse spherical transforms natively
        # By default, lmax and mmax are safely inferred from nlat/nlon grid sizing
        self.sht = th.RealSHT(nlat, nlon)
        self.isht = th.InverseRealSHT(nlat, nlon)
        
        # Spherical coefficients are stored in a triangular truncation format (lmax, mmax)
        self.lmax = self.sht.lmax if max_modes is None else min(max_modes, self.sht.lmax)
        self.mmax = self.sht.mmax if max_modes is None else min(max_modes, self.sht.mmax)

        scale = 1.0 / (in_channels * out_channels)
        # Learnable complex weights for spectral filtering on the sphere
        self.weights = nn.Parameter(
            scale * torch.randn(in_channels, out_channels, self.lmax, self.mmax, dtype=torch.complex64)
        )

    def forward(self, x):
        batchsize = x.shape[0]
        
        # 1. Transform spatial grid to Spherical Harmonic coefficients
        # Input shape expected by torch_harmonics: [Batch, Channels, Lat, Lon]
        x_sht = self.sht(x)

        # 2. Initialize output spectrum array matching full SHT dimensions
        out_sht = torch.zeros(
            batchsize, self.out_channels, self.sht.lmax, self.sht.mmax, 
            dtype=torch.complex64, device=x.device
        )
        
        # 3. Perform global contraction (einsum) on the truncated low-frequency modes
        out_sht[:, :, :self.lmax, :self.mmax] = torch.einsum(
            "bixy,ioxy->boxy", x_sht[:, :, :self.lmax, :self.mmax], self.weights
        )

        # 4. Invert filtered coefficients back to physical Lat-Lon coordinates
        x = self.isht(out_sht)
        return x


# =====================================================================
#    2. DEEP SPHERICAL FOURIER NEURAL OPERATOR (SFNO) NET
# =====================================================================
class SFNOClimate2d(nn.Module):
    def __init__(self, nlat, nlon, max_modes, width, in_channels=3): 
        super(SFNOClimate2d, self).__init__()
        self.width = width

        self.lifting = nn.Linear(in_channels, self.width) 
        
        # CRITICAL FIX: No spatial padding is required anymore. 
        # Spherical transforms inherently wrap mathematically around poles and borders.
        self.conv0 = SphericalSpectralConv2d(self.width, self.width, nlat, nlon, max_modes=max_modes)
        self.conv1 = SphericalSpectralConv2d(self.width, self.width, nlat, nlon, max_modes=max_modes)
        self.conv2 = SphericalSpectralConv2d(self.width, self.width, nlat, nlon, max_modes=max_modes)
        self.conv3 = SphericalSpectralConv2d(self.width, self.width, nlat, nlon, max_modes=max_modes)
        
        self.w0 = nn.Conv2d(self.width, self.width, 1)
        self.w1 = nn.Conv2d(self.width, self.width, 1)
        self.w2 = nn.Conv2d(self.width, self.width, 1)
        self.w3 = nn.Conv2d(self.width, self.width, 1)
        
        self.gelu = nn.GELU()
        self.dropout = nn.Dropout2d(p=0.1)
        self.projection = nn.Linear(self.width, 1)

    def forward(self, x, target_std=1.0):
        # Save raw SSTA physical baseline dimension prior to channel mapping
        ssta_channels = x.shape[-1] - 2
        input_residual = x[:, :, :, (ssta_channels - 1):ssta_channels].clone() / target_std 
        
        x = self.lifting(x) 
        x = x.permute(0, 3, 1, 2)  # Shape becomes [Batch, Width, Lat, Lon]
        
        # Spatial processing via clean, equivariant Spherical Layers
        x = self.dropout(self.gelu(self.conv0(x) + self.w0(x)))
        x = self.dropout(self.gelu(self.conv1(x) + self.w1(x)))
        x = self.dropout(self.gelu(self.conv2(x) + self.w2(x)))
        x = self.dropout(self.gelu(self.conv3(x) + self.w3(x)))

        x = x.permute(0, 2, 3, 1) 

        # Map back down to predictable anomaly target spaces plus physical scale context
        x = self.projection(x)  # Let the learned projection layer handle the physical unit transformation
        # Force spatial zero-mean anomaly to prevent global mean height drift
        x = x - torch.mean(x, dim=(1, 2), keepdim=True)
        return x


# =====================================================================
#    3a. AREA-WEIGHTED LOSS FUNCTION (STABILIZED FOR ANOMALIES)
# =====================================================================
class AreaWeightedRelativeL2Loss(object):
    def __init__(self, lat_coordinates, eps=1e-3):
        w_lat = np.cos(np.radians(lat_coordinates))
        self.w_grid = torch.from_numpy(w_lat).float() 
        self.eps = eps 

    def __call__(self, y_pred, y_true, loss_mask=None):
        w_expanded = self.w_grid.to(y_pred.device).view(1, -1, 1, 1)
        if loss_mask is not None:
            w_expanded = w_expanded * loss_mask.to(y_pred.device).view(1, y_pred.shape[1], y_pred.shape[2], 1)

        diff_sq = (y_pred - y_true) ** 2 * w_expanded
        true_sq = y_true ** 2 * w_expanded
        
        diff_norm = torch.sqrt(torch.sum(diff_sq, dim=(1, 2, 3)))
        true_norm = torch.sqrt(torch.sum(true_sq, dim=(1, 2, 3)))
        
        return torch.mean(diff_norm / (true_norm + self.eps))


# =====================================================================
#    3b. AREA-WEIGHTED SPATIAL PATTERN CORRELATION METRIC
# =====================================================================
class AreaWeightedPatternCorrelation(object):
    def __init__(self, lat_coordinates):
        w_lat = np.cos(np.radians(lat_coordinates))
        self.w_grid = torch.from_numpy(w_lat).float()

    def __call__(self, y_pred, y_true, loss_mask=None):
        device = y_pred.device
        w = self.w_grid.to(device).view(1, -1, 1, 1)
        if loss_mask is not None:
            w = w * loss_mask.to(device).view(1, y_pred.shape[1], y_pred.shape[2], 1)

        p = y_pred.reshape(y_pred.shape[0], -1)
        t = y_true.reshape(y_true.shape[0], -1)
        w_flat = torch.broadcast_to(w, y_pred.shape).reshape(y_pred.shape[0], -1)
        
        mean_p = torch.sum(p * w_flat, dim=1, keepdim=True) / (torch.sum(w_flat, dim=1, keepdim=True) + 1e-8)
        mean_t = torch.sum(t * w_flat, dim=1, keepdim=True) / (torch.sum(w_flat, dim=1, keepdim=True) + 1e-8)
        
        p_ano = p - mean_p
        t_ano = t - mean_t
        
        cov = torch.sum(p_ano * t_ano * w_flat, dim=1)
        var_p = torch.sum(p_ano ** 2 * w_flat, dim=1)
        var_t = torch.sum(t_ano ** 2 * w_flat, dim=1)
        
        corr = cov / (torch.sqrt(var_p * var_t) + 1e-8)
        return torch.mean(corr)


# =====================================================================
#    4. MAIN OPTIMIZED TRAINING WRAPPER ROUTINE
# =====================================================================
def run_toolbox_sfno(ssta, vara, lat, lon, varn, sea, val_split_pct=0.15, 
                      val_idx_list=None, train_idx_list=None, optimize_for_pattern=False, 
                      checkpoint_path=None, loss_weight_mask=None, epochs=10):  # <-- Added dynamic epochs argument
    torch.manual_seed(42)
    np.random.seed(42)

    nlat, nlon, ssta_channels, num_samples = ssta.shape 

    lon_grid, lat_grid = np.meshgrid(lon, lat)
    lat_norm = 2 * (lat_grid - lat_grid.min()) / (lat_grid.max() - lat_grid.min()) - 1
    lon_norm = 2 * (lon_grid - lon_grid.min()) / (lon_grid.max() - lon_grid.min()) - 1

    X_data = np.zeros((num_samples, nlat, nlon, ssta_channels + 2), dtype=np.float32)
    X_data[:, :, :, :ssta_channels] = np.moveaxis(ssta, -1, 0)
    X_data[:, :, :, ssta_channels] = np.repeat(lat_norm[np.newaxis, :, :], num_samples, axis=0)
    X_data[:, :, :, ssta_channels + 1] = np.repeat(lon_norm[np.newaxis, :, :], num_samples, axis=0)

    Y_data = np.moveaxis(vara, -1, 0)[:, :, :, np.newaxis].astype(np.float32)

    y_mean = Y_data.mean()
    y_std = Y_data.std() + 1e-8
    Y_data = (Y_data - y_mean) / y_std
    print(f"--> Target variables standardized: Mean={y_mean:.4f}, Std={y_std:.4f}")

    X_tensor = torch.from_numpy(X_data)
    Y_tensor = torch.from_numpy(Y_data)

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"--> Execution Pipeline Configured on Device Target: {device}")

    width = 64      #32 
    max_modes = 24  #12  # Handled as triangular truncation limit across the sphere
    
    loss_mask_tensor = torch.from_numpy(loss_weight_mask).float().to(device) if loss_weight_mask is not None else None

    # CRITICAL INVOCATION CHANGE: Pass grid layout configurations (nlat, nlon) explicitly to the network
    model = SFNOClimate2d(nlat=nlat, nlon=nlon, max_modes=max_modes, width=width, in_channels=ssta_channels + 2).to(device)
    
    if checkpoint_path is not None and os.path.exists(checkpoint_path):
        print(f"--> [WARM START] Successfully loaded pre-trained model weights from: {checkpoint_path}")
        model.load_state_dict(torch.load(checkpoint_path, map_location=device))
        lr = 0.0002   
    else:
        print("--> [COLD START] Initializing network weights with normal distribution.")
        lr = 0.001   
        
    batch_size = 16
    
    #optimizer = optim.Adam(model.parameters(), lr=lr, weight_decay=1e-5)
    optimizer = optim.Adam(model.parameters(), lr=lr, weight_decay=1e-3)
    scheduler = optim.lr_scheduler.StepLR(optimizer, step_size=30, gamma=0.5)
    criterion_l2 = AreaWeightedRelativeL2Loss(lat, eps=1e-3)
    corr_metric = AreaWeightedPatternCorrelation(lat)
    #criterion = (lambda pred, true: criterion_l2(pred, true, loss_mask=loss_mask_tensor)) if not optimize_for_pattern else (lambda pred, true: 1.0 - corr_metric(pred, true, loss_mask=loss_mask_tensor))
    if optimize_for_pattern:    
        alpha = 2
        criterion = lambda pred, true: (1.0 - corr_metric(pred, true, loss_mask=loss_mask_tensor)) + \
            alpha * criterion_l2(pred, true, loss_mask=loss_mask_tensor)
    else:
        # Pure Relative L2 Loss
        criterion = lambda pred, true: criterion_l2(pred, true, loss_mask=loss_mask_tensor)
     
    full_dataset = torch.utils.data.TensorDataset(X_tensor, Y_tensor)
    
    if train_idx_list is not None and len(train_idx_list) > 0:
        train_indices = list(train_idx_list)
        if val_idx_list is not None and len(val_idx_list) > 0:
            val_indices = list(val_idx_list)
        else:
            val_indices = [i for i in range(num_samples) if i not in train_indices]
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
    elif val_split_pct > 0.0:
        num_val = int(num_samples * val_split_pct)
        num_train = num_samples - num_val
        train_dataset, val_dataset = torch.utils.data.random_split(
            full_dataset, [num_train, num_val], 
            generator=torch.Generator().manual_seed(42)
        )
        train_indices = train_dataset.indices
        val_indices = val_dataset.indices
    else:
        num_val = 0
        num_train = num_samples

    if num_val > 0:
        log_dir = "/work/miz/mat_hiresmip/fno_gf/"
        os.makedirs(log_dir, exist_ok=True)
        train_log_path = os.path.join(log_dir, f"sfno_indices_train_{varn}_{sea}.txt")
        val_log_path = os.path.join(log_dir, f"sfno_indices_val_{varn}_{sea}.txt")
        np.savetxt(train_log_path, train_indices, fmt='%d', delimiter=',')
        np.savetxt(val_log_path, val_indices, fmt='%d', delimiter=',')
        
        train_loader = torch.utils.data.DataLoader(train_dataset, batch_size=batch_size, shuffle=True)
        val_loader = torch.utils.data.DataLoader(val_dataset, batch_size=batch_size, shuffle=False)
    else:
        target_dataset = train_dataset if (train_idx_list is not None) else full_dataset
        train_loader = torch.utils.data.DataLoader(target_dataset, batch_size=batch_size, shuffle=True)

    best_target_loss = float('inf')
    best_model_weights = None
    
    for epoch in range(1, epochs + 1):
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

        model.eval()
        if num_val > 0 and val_dataset is not None:
            epoch_val_loss = 0.0
            epoch_val_corr = 0.0
            with torch.no_grad():
                for X_batch, Y_batch in val_loader:
                    X_batch, Y_batch = X_batch.to(device), Y_batch.to(device)
                    output = model(X_batch, target_std=y_std)
                    val_loss = criterion_l2(output, Y_batch, loss_mask=loss_mask_tensor)
                    val_corr = corr_metric(output, Y_batch, loss_mask=loss_mask_tensor)
                    epoch_val_loss += val_loss.item()
                    epoch_val_corr += val_corr.item()
            
            avg_val_loss = epoch_val_loss / len(val_loader)
            avg_val_corr = epoch_val_corr / len(val_loader)
            
            # Track validation loss to save the best generalizing model state
            current_target_loss = avg_val_loss
            print(f"Epoch {epoch:03d}/{epochs} | Train Loss: {avg_train_loss:.4f} | Verification L2 Loss: {avg_val_loss:.4f} | Spatial Correlation (ACC): {avg_val_corr:.4f}")
        else:
            current_target_loss = avg_train_loss
            print(f"Epoch {epoch:03d}/{epochs} | Train Loss: {avg_train_loss:.4f}")

        if current_target_loss < best_target_loss:
            best_target_loss = current_target_loss
            best_model_weights = {k: v.cpu().clone() for k, v in model.state_dict().items()}

        scheduler.step()

    if best_model_weights is not None:
        model.load_state_dict(best_model_weights)
        
    valpct = str(val_split_pct)
    fn = f"/work/miz/mat_hiresmip/fno_gf/sfno_toolbox_weights_{varn}_{sea}_{valpct}.pt"
    torch.save(model.to('cpu').state_dict(), fn)
    print(f"\nBest model weights (Loss: {best_target_loss:.4f}) saved successfully to {fn}")
    
    return model
