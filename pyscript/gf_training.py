import sys
import os
import torch
import torch.nn as nn
import torch.optim as optim
import numpy as np
from scipy.io import loadmat
import h5py
import matplotlib.pyplot as plt  # New import for plotting
from fno_model import run_toolbox_fno
from get_array import get_array

varn   = sys.argv[1]
season = sys.argv[2]
val_split_pct = float(sys.argv[3])

varn ='za500'; season='JJA'
sea = ['ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'] #isea=2; season = sea[isea];
isea = sea.index(season)

print('Variable=',varn,'Season=',season,'isea=',isea,'val_split_pct',val_split_pct)

#fn='/work/miz/mat_gf/gf_data.mat';      f = loadmat(fn);        z = f['z']
fn='/work/miz/mat_gf/gf_data_more.mat'; f = h5py.File(fn, 'r'); z = f['z']

lat   = get_array(z,'lat')
lon   = get_array(z,'lon')
lm    = get_array(z,'lm')
im    = get_array(z,'im')
tsfca = get_array(z,'tsfca')
varna = get_array(z,varn)

#varn = varn.upper()
print("\nDo GF training using FNO for", varn, season,"season");

im_2d = np.squeeze(im[isea, :, :])

# Process SSTA
a = tsfca[:, isea:isea+1, :, :]
ssta = np.transpose(a, (2, 3, 1, 0))
mask2d = (lm > 0.01) | (im_2d > 0.01)
ssta = np.where(mask2d[:, :, None, None], 0.0, ssta)

# Process Variable Anomalies
a_za = varna[:, isea, :, :]; 

vara = np.transpose(a_za, (1, 2, 0))

# Run Model Training Pipeline
print('val_split_pct=',val_split_pct)
if val_split_pct == 0:
    val_exp = np.arange(273,297)
    print('Validation experiments=',val_exp)
    model = run_toolbox_fno(ssta, vara, lat, lon, varn, season, val_split_pct=0.0, val_idx_list=val_exp)
else:
    model = run_toolbox_fno(ssta, vara, lat, lon, varn, season, val_split_pct)

#print("Finished."); sys.exit()

##############################################################
# Below is for verfication purpose only#######################
##############################################################

# =====================================================================
#   6. VISUALIZATION BLOCK: SIDE-BY-SIDE VERIFICATION PLOT
# =====================================================================
print("\n--- Visualizing Model Prediction vs. Original Experiment ---")
    
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
model.to(device)
model.eval()

# Select exactly 1 experiment index out of your 153 runs to verify (e.g., experiment index 0)
exp_idx = 39 
    
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
    vara_ml_pred = pred_tensor.cpu().numpy()[0, :, :, 0]

    # Extract the original true experiment target [Lat, Lon]
    vara_true_original = vara[:, :, exp_idx]

    # Initialize a 1-row, 2-column side-by-side subplot canvas
    fig, axes = plt.subplots(1, 2, figsize=(15, 6), sharex=True, sharey=True)

    # Determine common dynamic contour limits based on true experiment bounds
    vmin, vmax = np.min(vara_true_original), np.max(vara_true_original)

    # Plot 1: Original Simulation Ground Truth
    im1 = axes[0].pcolormesh(lon, lat, vara_true_original, cmap='RdBu_r', vmin=vmin, vmax=vmax, shading='auto')
    axes[0].set_title(f"Original Perturbation Experiment (Patch {exp_idx})", fontsize=12, fontweight='bold')
    axes[0].set_ylabel("Latitude", fontsize=10)
    axes[0].set_xlabel("Longitude", fontsize=10)
    axes[0].grid(True, linestyle='--', alpha=0.5)

    # Plot 2: Trained FNO Model Forecast
    im2 = axes[1].pcolormesh(lon, lat, vara_ml_pred, cmap='RdBu_r', vmin=vmin, vmax=vmax, shading='auto')
    axes[1].set_title("Machine Learning (FNO) Prediction", fontsize=12, fontweight='bold')
    axes[1].set_xlabel("Longitude", fontsize=10)
    axes[1].grid(True, linestyle='--', alpha=0.5)

    # Append a unified vertical colorbar scale to the right side of the layout
    cbar = fig.colorbar(im2, ax=axes.ravel().tolist(), orientation='vertical', pad=0.03, shrink=0.8)
    cbar.set_label("Anomalies", fontsize=11)

    plt.suptitle(f"Global {varn} Response Comparison ({season} Season)", fontsize=14, y=0.98, fontweight='bold')
    
    # Save the output figure directly to disk
    output_png = f"fno_verification_comparison_{season}.png"
    plt.savefig(output_png, dpi=300, bbox_inches='tight')
    print(f"--> Side-by-side plot comparison successfully rendered to: {output_png}")
    plt.show()
