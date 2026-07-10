import os
import torch
import torch.nn as nn
import torch.optim as optim
import numpy as np
from scipy.io import loadmat
import matplotlib.pyplot as plt  # New import for plotting

# =====================================================================
#   1. FNO COMPLEX SPECTRAL MULTIPLICATION LAYER
# =====================================================================
class SpectralConv2d(nn.Module):
    def __init__(self, in_channels, out_channels, modes1, modes2):
        super(SpectralConv2d, self).__init__()
        self.in_channels = in_channels
        self.out_channels = out_channels
        self.modes1 = modes1
        self.modes2 = modes2

        scale = 1.0 / (in_channels * out_channels)
        self.weights1 = nn.Parameter(scale * torch.randn(in_channels, out_channels, self.modes1, self.modes2, dtype=torch.complex64))
        self.weights2 = nn.Parameter(scale * torch.randn(in_channels, out_channels, self.modes1, self.modes2, dtype=torch.complex64))

    def forward(self, x):
        batchsize = x.shape[0]
        x_ft = torch.fft.rfft2(x)

        out_ft = torch.zeros(batchsize, self.out_channels, x.size(-2), x.size(-1)//2 + 1, dtype=torch.complex64, device=x.device)
        
        out_ft[:, :, :self.modes1, :self.modes2] = torch.einsum(
            "bixy,ioxy->boxy", x_ft[:, :, :self.modes1, :self.modes2], self.weights1
        )
        out_ft[:, :, -self.modes1:, :self.modes2] = torch.einsum(
            "bixy,ioxy->boxy", x_ft[:, :, -self.modes1:, :self.modes2], self.weights2
        )

        x = torch.fft.irfft2(out_ft, s=(x.size(-2), x.size(-1)))
        return x


# =====================================================================
#   2. DEEP FOURIER NEURAL OPERATOR (FNO) WITH SPHERICAL PADDING
# =====================================================================
class FNOClimate2d(nn.Module):
    def __init__(self, modes1, modes2, width):
        super(FNOClimate2d, self).__init__()
        self.modes1 = modes1
        self.modes2 = modes2
        self.width = width
        self.padding = 4

        self.lifting = nn.Linear(3, self.width)
        
        self.conv0 = SpectralConv2d(self.width, self.width, self.modes1, self.modes2)
        self.conv1 = SpectralConv2d(self.width, self.width, self.modes1, self.modes2)
        self.conv2 = SpectralConv2d(self.width, self.width, self.modes1, self.modes2)
        self.conv3 = SpectralConv2d(self.width, self.width, self.modes1, self.modes2)
        
        self.w0 = nn.Conv2d(self.width, self.width, 1)
        self.w1 = nn.Conv2d(self.width, self.width, 1)
        self.w2 = nn.Conv2d(self.width, self.width, 1)
        self.w3 = nn.Conv2d(self.width, self.width, 1)
        
        self.gelu = nn.GELU()
        self.projection = nn.Linear(self.width, 1)

    def forward(self, x):
        x = self.lifting(x) 
        x = x.permute(0, 3, 1, 2)  # [Batch, Width, Lat, Lon]
        
        x = nn.functional.pad(x, [self.padding, self.padding, 0, 0], mode='circular')
        x = nn.functional.pad(x, [0, 0, self.padding, self.padding], mode='replicate')

        x = self.gelu(self.conv0(x) + self.w0(x))
        x = self.gelu(self.conv1(x) + self.w1(x))
        x = self.gelu(self.conv2(x) + self.w2(x))
        x = self.gelu(self.conv3(x) + self.w3(x))

        x = x[:, :, self.padding:-self.padding, self.padding:-self.padding]
        
        x = x.permute(0, 2, 3, 1) 
        x = self.projection(x)    
        return x


# =====================================================================
#   3. AREA-WEIGHTED LOSS FUNCTION (STABILIZED FOR ANOMALIES)
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
#   4. MAIN OPTIMIZED TRAINING WRAPPER ROUTINE
# =====================================================================
def run_toolbox_fno(ssta, z500, lat, lon, sea):
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

    Y_data = np.moveaxis(z500, -1, 0)[:, :, :, np.newaxis].astype(np.float32)

    X_tensor = torch.from_numpy(X_data)
    Y_tensor = torch.from_numpy(Y_data)

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"--> Execution Pipeline Configured on Device Target: {device}")

    width = 64
    modes = 24
    model = FNOClimate2d(modes1=modes, modes2=modes, width=width).to(device)

    lr = 0.01
    epochs = 150
    batch_size = 16
    
    optimizer = optim.Adam(model.parameters(), lr=lr)
    scheduler = optim.lr_scheduler.StepLR(optimizer, step_size=30, gamma=0.5)
    criterion = AreaWeightedRelativeL2Loss(lat, eps=1e-3)

    dataset = torch.utils.data.TensorDataset(X_tensor, Y_tensor)
    dataloader = torch.utils.data.DataLoader(dataset, batch_size=batch_size, shuffle=True)

    print(f"Training FNO on {num_samples} samples with {len(dataloader)} batches per epoch...")
# Inside run_toolbox_fno right before the epoch loop:
    patience = 15  # Number of epochs to wait for an improvement before stopping
    patience_counter = 0
    best_loss = float('inf')
    best_model_weights = None

    print(f"Training FNO on {num_samples} samples...")
    
    for epoch in range(1, epochs + 1):
        model.train()
        epoch_loss = 0.0
        
        for X_batch, Y_batch in dataloader:
            X_batch, Y_batch = X_batch.to(device), Y_batch.to(device)
            optimizer.zero_grad()
            output = model(X_batch)
            loss = criterion(output, Y_batch)
            loss.backward()
            optimizer.step()
            epoch_loss += loss.item()
        
        avg_loss = epoch_loss / len(dataloader)
        print(f"Epoch {epoch}/{epochs} - Avg True Relative L2 Loss: {avg_loss:.4f}")

        # --- Early Stopping & Best Weights Tracking Logic ---
        if avg_loss < best_loss:
            best_loss = avg_loss
            # Save a deep copy of the best weights so far
            best_model_weights = {k: v.cpu().clone() for k, v in model.state_dict().items()}
            patience_counter = 0  # Reset counter since we improved
        else:
            patience_counter += 1

        current_lr = optimizer.param_groups[0]['lr']
        scheduler.step()
        if optimizer.param_groups[0]['lr'] < current_lr:
            print(f"--> Learning rate decayed to: {optimizer.param_groups[0]['lr']}")

        # Trigger early stop if model plateaus
        if patience_counter >= patience:
            print(f"--> Early stopping triggered at epoch {epoch}! Loss hasn't improved for {patience} epochs.")
            break

    # Restore the best performing weights before saving to disk
    if best_model_weights is not None:
        model.load_state_dict(best_model_weights)

    fn = f"fno_toolbox_weights_{sea}.pt"
    torch.save(model.to('cpu').state_dict(), fn)
    print(f"Best weights (Loss: {best_loss:.4f}) saved successfully to {fn}\nTraining complete!")    
    
    return model


# =====================================================================
#   5. DATA MANAGEMENT PIPELINE AND PROGRAM ENTRYPOINT
# =====================================================================
if __name__ == "__main__":
    mat = loadmat('/work/miz/mat_gf/gf_data.mat')
    z = mat['z']

    lat   = z['lat'][0, 0].squeeze()
    lon   = z['lon'][0, 0].squeeze()
    lm    = z['lm'] [0, 0]
    im    = z['im'] [0, 0]
    tsfca = z['tsfca'][0, 0]
    za500 = z['za500'][0, 0]

    sea = ['ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS']
    isea = 4  # Selects JJA (Summer)
    season = sea[isea]

    im_2d = np.squeeze(im[isea, :, :])

    # Process SSTA
    a = tsfca[:, isea:isea+1, :, :]
    ssta = np.transpose(a, (2, 3, 1, 0))
    mask2d = (lm > 0.01) | (im_2d > 0.01)
    ssta = np.where(mask2d[:, :, None, None], 0.0, ssta)

    # Process Z500 Anomalies
    a_za = za500[:, isea, :, :]
    z500 = np.transpose(a_za, (1, 2, 0))

    # Run Model Training Pipeline
    model = run_toolbox_fno(ssta, z500, lat, lon, season)

    # =====================================================================
    #   6. VISUALIZATION BLOCK: SIDE-BY-SIDE VERIFICATION PLOT
    # =====================================================================
    print("\n--- Visualizing Model Prediction vs. Original Experiment ---")
    
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model.to(device)
    model.eval()

    # Select exactly 1 experiment index out of your 153 runs to verify (e.g., experiment index 0)
    exp_idx = 0 
    
    # Re-build normalized mesh coordinates
    lon_grid, lat_grid = np.meshgrid(lon, lat)
    lat_norm = 2 * (lat_grid - lat_grid.min()) / (lat_grid.max() - lat_grid.min()) - 1
    lon_norm = 2 * (lon_grid - lon_grid.min()) / (lon_grid.max() - lon_grid.min()) - 1

    # Format the single experiment data as an input tensor [Batch=1, Lat, Lon, Channels=3]
    X_single = np.zeros((1, ssta.shape[0], ssta.shape[1], 3), dtype=np.float32)
    X_single[0, :, :, 0] = ssta[:, :, 0, exp_idx]
    X_single[0, :, :, 1] = lat_norm
    X_single[0, :, :, 2] = lon_norm
    X_tensor_single = torch.from_numpy(X_single).to(device)

    # Generate ML prediction
    with torch.no_grad():
        pred_tensor = model(X_tensor_single)
        # Squeeze out batch and channel dimensions to get a 2D spatial grid [Lat, Lon]
        z500_ml_pred = pred_tensor.cpu().numpy()[0, :, :, 0]

    # Extract the original true experiment target [Lat, Lon]
    z500_true_original = z500[:, :, exp_idx]

    # Initialize a 1-row, 2-column side-by-side subplot canvas
    fig, axes = plt.subplots(1, 2, figsize=(15, 6), sharex=True, sharey=True)

    # Determine common dynamic contour limits based on true experiment bounds
    vmin, vmax = np.min(z500_true_original), np.max(z500_true_original)

    # Plot 1: Original Simulation Ground Truth
    im1 = axes[0].pcolormesh(lon, lat, z500_true_original, cmap='RdBu_r', vmin=vmin, vmax=vmax, shading='auto')
    axes[0].set_title(f"Original Perturbation Experiment (Index {exp_idx})", fontsize=12, fontweight='bold')
    axes[0].set_ylabel("Latitude", fontsize=10)
    axes[0].set_xlabel("Longitude", fontsize=10)
    axes[0].grid(True, linestyle='--', alpha=0.5)

    # Plot 2: Trained FNO Model Forecast
    im2 = axes[1].pcolormesh(lon, lat, z500_ml_pred, cmap='RdBu_r', vmin=vmin, vmax=vmax, shading='auto')
    axes[1].set_title("Machine Learning (FNO) Prediction", fontsize=12, fontweight='bold')
    axes[1].set_xlabel("Longitude", fontsize=10)
    axes[1].grid(True, linestyle='--', alpha=0.5)

    # Append a unified vertical colorbar scale to the right side of the layout
    cbar = fig.colorbar(im2, ax=axes.ravel().tolist(), orientation='vertical', pad=0.03, shrink=0.8)
    cbar.set_label("Z500 Anomalies (m)", fontsize=11)

    plt.suptitle(f"Global Z500 Response Comparison ({season} Season)", fontsize=14, y=0.98, fontweight='bold')
    
    # Save the output figure directly to disk
    output_png = f"fno_verification_comparison_{season}.png"
    plt.savefig(output_png, dpi=300, bbox_inches='tight')
    print(f"--> Side-by-side plot comparison successfully rendered to: {output_png}")
    plt.show()
