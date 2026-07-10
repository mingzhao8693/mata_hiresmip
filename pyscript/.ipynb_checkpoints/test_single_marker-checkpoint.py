# %% [markdown]
# # FNO Climate Model Verification Pipeline
# This script loads a pre-trained Fourier Neural Operator (FNO) model and evaluates 
# its performance against a selected standalone perturbation experiment.

# %% [1] INITIAL IMPORTS & ARCHITECTURE SETUP
import os
import torch
import torch.nn as nn
import numpy as np
from scipy.io import loadmat
import matplotlib.pyplot as plt

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
        x = x.permute(0, 3, 1, 2)
        
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

# %% [2] DATALOADING & PROCESSING PIPELINE
MAT_PATH = '/work/miz/mat_gf/gf_data.mat'
sea = ['ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS']
isea = 2  # 'JJA' (Summer)
season = sea[isea]

print(f"Loading data elements from {MAT_PATH}...")
mat = loadmat(MAT_PATH)
z = mat['z']

lat   = z['lat'][0, 0].squeeze()
lon   = z['lon'][0, 0].squeeze()
lm    = z['lm'] [0, 0]
im    = z['im'] [0, 0]
tsfca = z['tsfca'][0, 0]
za500 = z['za500'][0, 0]

im_2d = np.squeeze(im[isea, :, :])

# Preprocess SSTA Matrix
a = tsfca[:, isea:isea+1, :, :]
ssta = np.transpose(a, (2, 3, 1, 0))
mask2d = (lm > 0.01) | (im_2d > 0.01)
ssta = np.where(mask2d[:, :, None, None], 0.0, ssta)

# Preprocess True Z500 Anomalies
a_za = za500[:, isea, :, :]
z500 = np.transpose(a_za, (1, 2, 0))

# Build grid mapping features
lon_grid, lat_grid = np.meshgrid(lon, lat)
lat_norm = 2 * (lat_grid - lat_grid.min()) / (lat_grid.max() - lat_grid.min()) - 1
lon_norm = 2 * (lon_grid - lon_grid.min()) / (lon_grid.max() - lon_grid.min()) - 1

# %% [3] LOAD MODEL PARAMETERS
WEIGHTS_PATH = f"fno_toolbox_weights_{season}.pt"
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

print(f"Loading model architecture onto: {device}")
model = FNOClimate2d(modes1=24, modes2=24, width=64).to(device)
model.load_state_dict(torch.load(WEIGHTS_PATH, map_location=device))
model.eval()
print("Weights loaded successfully!")

# %% [4] EXPERIMENT SELECTION & INFERENCE IN INTERACTIVE CELL
# You can change this index to any of your 153 experiments and re-run just this cell!
EXPERIMENT_INDEX = 0 

# Format input tensor slice
X_single = np.zeros((1, ssta.shape[0], ssta.shape[1], 3), dtype=np.float32)
X_single[0, :, :, 0] = ssta[:, :, 0, EXPERIMENT_INDEX]
X_single[0, :, :, 1] = lat_norm
X_single[0, :, :, 2] = lon_norm
X_tensor_single = torch.from_numpy(X_single).to(device)

# Model Prediction Pass
with torch.no_grad():
    pred_tensor = model(X_tensor_single)
    z500_ml_pred = pred_tensor.cpu().numpy()[0, :, :, 0]

z500_true_original = z500[:, :, EXPERIMENT_INDEX]

# Render Side-by-Side Spatial Comparisons
fig, axes = plt.subplots(1, 2, figsize=(15, 6), sharex=True, sharey=True)
vmin, vmax = np.min(z500_true_original), np.max(z500_true_original)

# Ground Truth Contour plot
im1 = axes[0].pcolormesh(lon, lat, z500_true_original, cmap='RdBu_r', vmin=vmin, vmax=vmax, shading='auto')
axes[0].set_title(f"Original Perturbation Experiment (Index {EXPERIMENT_INDEX})", fontsize=12, fontweight='bold')
axes[0].set_ylabel("Latitude", fontsize=10)
axes[0].set_xlabel("Longitude", fontsize=10)
axes[0].grid(True, linestyle='--', alpha=0.5)

# ML Prediction Contour plot
im2 = axes[1].pcolormesh(lon, lat, z500_ml_pred, cmap='RdBu_r', vmin=vmin, vmax=vmax, shading='auto')
axes[1].set_title("Machine Learning (FNO) Prediction", fontsize=12, fontweight='bold')
axes[1].set_xlabel("Longitude", fontsize=10)
axes[1].grid(True, linestyle='--', alpha=0.5)

# Shared Colorbar Settings
cbar = fig.colorbar(im2, ax=axes.ravel().tolist(), orientation='vertical', pad=0.03, shrink=0.8)
cbar.set_label("Z500 Anomalies (m)", fontsize=11)

plt.suptitle(f"Global Z500 Response Comparison ({season} Season)", fontsize=14, y=0.98, fontweight='bold')

output_png = f"fno_verification_comparison_idx{EXPERIMENT_INDEX}_{season}.png"
plt.savefig(output_png, dpi=300, bbox_inches='tight')
print(f"Verification graphic saved to workspace as: {output_png}")
plt.show()
