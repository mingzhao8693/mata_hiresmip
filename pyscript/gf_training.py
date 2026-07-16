import sys
import os
import torch
import numpy as np
import h5py
import matplotlib.pyplot as plt
from scipy.signal import detrend
from get_array import get_array
from fno_model import run_toolbox_fno  # Clean import of the original FNO pipeline

if __name__ == "__main__":
    varn   = sys.argv[1]
    season = sys.argv[2]
    val_split_pct = float(sys.argv[3])  # This parameter is bypassed when val_split_pct = 0

    sea = ['ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'] 
    isea = sea.index(season)

    print('Variable=', varn, 'Season=', season, 'isea=', isea)

    fn = '/work/miz/mat_gf/gf_data_new.mat'
    f = h5py.File(fn, 'r')
    z = f['z']

    print("Loading file...", fn)
    lat   = get_array(z, 'lat')
    lon   = get_array(z, 'lon')
    lm    = get_array(z, 'lm')
    im    = get_array(z, 'im')
    tsfca = get_array(z, 'tsfca')
    varna = get_array(z, varn)

    print(f"\nDo AMIP Multi-Member Ensemble training using FNO for {varn} {season} season")

    im_2d = np.squeeze(im[isea, :, :])
    mask2d = (lm > 0.01) | (im_2d > 0.01)

    # =====================================================================
    #   1. EXTRACT AMIP RAW SLICES (EXCLUDING GFMIP PATCHES)
    # =====================================================================
    # GFMIP Patches are 0:153. AMIP indices are 153:297.
    # We slice strictly the AMIP run timeline.
    a = tsfca[:, isea:isea+1, :, :]  
    ssta_all = np.transpose(a, (2, 3, 1, 0))  
    ssta_all = np.squeeze(ssta_all, axis=2)    # (90, 144, 300)
    
    # Isolate the AMIP section strictly (Indices 153 to 297, which contains 144 slices)
    # Let's reshape this to: (lat, lon, members, years) -> (90, 144, 20, 71)
    # We know 20 members * 71 years = 1420 slices. Let's make sure the array dimensions match.
    n_members = 20
    n_years = 71  # 1950 to 2020 inclusive
    
    amip_ssta_slice = ssta_all[:, :, 153:297]
    amip_vara_slice = np.transpose(varna[:, isea, :, :], (1, 2, 0))[:, :, 153:297]

    # Verify if indices need exact reshaping
    # Reshape array to handle the 4D member-year split
    amip_ssta = amip_ssta_slice.reshape(90, 144, n_members, n_years)
    amip_vara = amip_vara_slice.reshape(90, 144, n_members, n_years)
    
    print(f"--> Extracted AMIP dataset containing {n_members} members across {n_years} historical years.")

    # =====================================================================
    #   2. PHYSICALLY CORRECT ENSEMBLE DETRENDING
    # =====================================================================
    print("--> Calculating forced climate trend from the 20-member Ensemble Mean...")
    # Calculate the ensemble mean across members (axis 2) to extract the forced trend
    ssta_ens_mean = np.mean(amip_ssta, axis=2)  # (90, 144, 71)
    vara_ens_mean = np.mean(amip_vara, axis=2)  # (90, 144, 71)

    # Calculate trend lines using linear detrending along the temporal axis
    ssta_trend = ssta_ens_mean - detrend(ssta_ens_mean, axis=-1)
    vara_trend = vara_ens_mean - detrend(vara_ens_mean, axis=-1)

    # Subtract the unified forced trend from each individual member
    print("--> Subtracting forced trend line from each individual member...")
    ssta_detrended = np.zeros_like(amip_ssta)
    vara_detrended = np.zeros_like(amip_vara)
    
    for m in range(n_members):
        ssta_detrended[:, :, m, :] = amip_ssta[:, :, m, :] - ssta_trend
        vara_detrended[:, :, m, :] = amip_vara[:, :, m, :] - vara_trend

    # Mask land values post-detrending to clean numerical anomalies
    ssta_detrended = np.where(mask2d[:, :, None, None], 0.0, ssta_detrended)

    # =====================================================================
    #   3. CHRONOLOGICAL SPLIT (Years 1950-2005 vs 2006-2020)
    # =====================================================================
    # 1950 to 2005 is 56 years. Remaining 15 years are used for out-of-sample validation.
    train_year_cutoff = 56 
    val_year_count = n_years - train_year_cutoff  # 15 years
    
    print(f"--> Splitting chronological blocks: Training (1-{train_year_cutoff} yrs) | Validation ({train_year_cutoff+1}-{n_years} yrs)")
    
    ssta_train_block = ssta_detrended[:, :, :, :train_year_cutoff]  # (90, 144, 20, 56)
    ssta_val_block   = ssta_detrended[:, :, :, train_year_cutoff:]  # (90, 144, 20, 15)
    
    vara_train_block = vara_detrended[:, :, :, :train_year_cutoff]  # (90, 144, 20, 56)
    vara_val_block   = vara_detrended[:, :, :, train_year_cutoff:]  # (90, 144, 20, 15)

    # =====================================================================
    #   4. FLAT-STACK MEMBERS AND YEARS INTO "SAMPLES"
    # =====================================================================
    train_samples = n_members * train_year_cutoff               # 1120
    val_samples   = n_members * val_year_count                  # 300
    
    ssta_train = ssta_train_block.reshape(90, 144, 1, train_samples)
    ssta_val   = ssta_val_block.reshape(90, 144, 1, val_samples)
    
    vara_train = vara_train_block.reshape(90, 144, train_samples)
    vara_val   = vara_val_block.reshape(90, 144, val_samples)

    # Combine back together for the standard 1D sample loading expected by FNO wrapper
    ssta = np.concatenate([ssta_train, ssta_val], axis=-1)  # (90, 144, 1, 1420)
    vara = np.concatenate([vara_train, vara_val], axis=-1)  # (90, 144, 1420)

    print(f"--> Dataset shapes structured for FNO:")
    print(f"    SSTA: {ssta.shape} | VARA: {vara.shape}")

    # =====================================================================
    #   5. ESTABLISH EXPLICIT BOUNDARY INDICES
    # =====================================================================
    train_idx_list = np.arange(0, train_samples)
    val_idx_list   = np.arange(train_samples, train_samples + val_samples)

    print(f"--> Custom training samples count: {len(train_idx_list)}")
    print(f"--> Custom verification samples count: {len(val_idx_list)}")

    opt_pat = False

    # Execute FNO training using the clean cold-start configuration (checkpoint_path = None)
    # Pre-training is completely bypassed to focus on the large-scale AMIP dataset
    model = run_toolbox_fno(ssta, vara, lat, lon, varn, season, val_split_pct=0.0,
                            val_idx_list=val_idx_list, train_idx_list=train_idx_list,
                            optimize_for_pattern=opt_pat, checkpoint_path=None)

    # =====================================================================
    #   6. VISUALIZATION BLOCK: OUT-OF-SAMPLE VALIDATION COMPARISON
    # =====================================================================
    print("\n--- Visualizing Out-of-Sample Ensemble Validation Members ---")
        
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model.to(device)
    model.eval()

    # Select two distinct validation indexes (e.g., first and last indices of validation pool)
    verify_experiments = [train_samples, train_samples + val_samples - 1]
    fig, axes = plt.subplots(2, 3, figsize=(22, 10), sharex=True, sharey=True)

    lon_grid, lat_grid = np.meshgrid(lon, lat)
    lat_norm = 2 * (lat_grid - lat_grid.min()) / (lat_grid.max() - lat_grid.min()) - 1
    lon_norm = 2 * (lon_grid - lon_grid.min()) / (lon_grid.max() - lon_grid.min()) - 1

    # Standard scale targets strictly on training bounds parameters
    vara_mean = vara_train.mean()
    vara_std = vara_train.std() + 1e-8

    for row_idx, exp_idx in enumerate(verify_experiments):
        X_single = np.zeros((1, ssta.shape[0], ssta.shape[1], 3), dtype=np.float32)
        X_single[0, :, :, 0] = ssta[:, :, 0, exp_idx]
        X_single[0, :, :, 1] = lat_norm
        X_single[0, :, :, 2] = lon_norm
        X_tensor_single = torch.from_numpy(X_single).to(device)

        with torch.no_grad():
            pred_tensor_std = model(X_tensor_single, target_std=vara_std)
            vara_ml_pred_std = pred_tensor_std.cpu().numpy()[0, :, :, 0]
            vara_ml_pred = (vara_ml_pred_std * vara_std) + vara_mean

            vara_true_original = vara[:, :, exp_idx]
            sst_anomaly_slice = ssta[:, :, 0, exp_idx]

        rmse = np.sqrt(np.mean((vara_true_original - vara_ml_pred) ** 2))
        correlation = np.corrcoef(vara_true_original.ravel(), vara_ml_pred.ravel())[0, 1]

        vmax_sst = max(abs(np.min(sst_anomaly_slice)), abs(np.max(sst_anomaly_slice)))
        vmin_sst = -vmax_sst if vmax_sst > 0 else -1.0
        vmax_sst = vmax_sst if vmax_sst > 0 else 1.0

        vmin_target, vmax_target = np.min(vara_true_original), np.max(vara_true_original)

        # Panel 1: Input SST Anomaly Forcing
        im1 = axes[row_idx, 0].pcolormesh(lon, lat, sst_anomaly_slice, cmap='RdBu_r', vmin=vmin_sst, vmax=vmax_sst, shading='auto')
        axes[row_idx, 0].set_title(f"Val Exp {exp_idx}: Input SST Anomaly", fontsize=11, fontweight='bold')
        axes[row_idx, 0].set_ylabel("Latitude", fontsize=10)
        if row_idx == 1: axes[row_idx, 0].set_xlabel("Longitude", fontsize=10)
        axes[row_idx, 0].grid(True, linestyle='--', alpha=0.5)
        cbar1 = fig.colorbar(im1, ax=axes[row_idx, 0], orientation='horizontal', pad=0.12, shrink=0.75)
        cbar1.set_label("SST Anomaly (°C)", fontsize=9)

        # Panel 2: Ground Truth Physical Response
        im2 = axes[row_idx, 1].pcolormesh(lon, lat, vara_true_original, cmap='RdBu_r', vmin=vmin_target, vmax=vmax_target, shading='auto')
        axes[row_idx, 1].set_title(f"Val Exp {exp_idx}: True response ({varn})", fontsize=11, fontweight='bold')
        if row_idx == 1: axes[row_idx, 1].set_xlabel("Longitude", fontsize=10)
        axes[row_idx, 1].grid(True, linestyle='--', alpha=0.5)
        cbar2 = fig.colorbar(im2, ax=axes[row_idx, 1], orientation='horizontal', pad=0.12, shrink=0.75)
        cbar2.set_label("Physical Units", fontsize=9)

        # Panel 3: Model Spatial Prediction Output with metrics
        im3 = axes[row_idx, 2].pcolormesh(lon, lat, vara_ml_pred, cmap='RdBu_r', vmin=vmin_target, vmax=vmax_target, shading='auto')
        axes[row_idx, 2].set_title(f"RMSE: {rmse:.3f} | Spatial Corr (r): {correlation:.3f}", fontsize=11, fontweight='bold', color='darkblue')
        if row_idx == 1: axes[row_idx, 2].set_xlabel("Longitude", fontsize=10)
        axes[row_idx, 2].grid(True, linestyle='--', alpha=0.5)
        cbar3 = fig.colorbar(im3, ax=axes[row_idx, 2], orientation='horizontal', pad=0.12, shrink=0.75)
        cbar3.set_label("Physical Units", fontsize=9)

    plt.suptitle(f"Global {varn} Response Out-of-Sample Ensemble Verification ({season} Season)", fontsize=15, y=0.98, fontweight='bold')

    output_png = f"fno_verification_comparison_6panel_ensemble_{season}.png"
    plt.savefig(output_png, dpi=300, bbox_inches='tight')
    print(f"--> Multi-member ensemble FNO verification comparison plot saved to: {output_png}")
    plt.show()
