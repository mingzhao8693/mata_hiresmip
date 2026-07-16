import sys
import os
import torch
import numpy as np
import h5py
import matplotlib.pyplot as plt
from scipy.signal import detrend
from get_array import get_array
from unet_model import run_toolbox_fno  # Clean drop-in import of the U-Net engine

if __name__ == "__main__":
    varn   = sys.argv[1]
    season = sys.argv[2]
    val_split_pct = float(sys.argv[3])

    #varn ='za500'; season='JJA'; val_split_pct=0; 
    sea = ['ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'] #isea=2; season = sea[isea];
    isea = sea.index(season)

    print('Variable=',varn,'Season=',season,'isea=',isea,'val_split_pct',val_split_pct)

    #fn='/work/miz/mat_gf/gf_data.mat';      f=loadmat(fn);       z = f['z'];
    fn='/work/miz/mat_gf/gf_data_new.mat'; f=h5py.File(fn, 'r'); z = f['z']

    print("load...",fn)
    lat   = get_array(z,'lat')
    lon   = get_array(z,'lon')
    lm    = get_array(z,'lm')
    im    = get_array(z,'im')
    tsfca = get_array(z,'tsfca')
    varna = get_array(z,varn)

    #varn = varn.upper()
    print("\nDo GF training using Geospatial U-Net for", varn, season,"season");

    im_2d = np.squeeze(im[isea, :, :])

    # =====================================================================
    #   1. SSTA PREPROCESSING + SPECIFIED RANGE AMIP DETRENDING
    # =====================================================================
    a = tsfca[:, isea:isea+1, :, :]
    ssta_raw = np.transpose(a, (2, 3, 1, 0))
    mask2d = (lm > 0.01) | (im_2d > 0.01)
    ssta_raw = np.where(mask2d[:, :, None, None], 0.0, ssta_raw)

    # Define boundaries of the historical AMIP run contaminated by climate drift
    detrend_start = 153  
    detrend_end = 297    

    print(f"--> Slicing and detrending SSTA strictly over AMIP index range [{detrend_start}:{detrend_end}]...")
    ssta_pre   = ssta_raw[:, :, :, :detrend_start]
    ssta_target = ssta_raw[:, :, :, detrend_start:detrend_end]
    ssta_post  = ssta_raw[:, :, :, detrend_end:]

    # Detrend only the selected AMIP target slice
    ssta_detrended_slice = detrend(ssta_target, axis=-1)

    # Stitch back together (Keeping patches 0-152 structurally untouched)
    ssta = np.concatenate([ssta_pre, ssta_detrended_slice, ssta_post], axis=-1)
    ssta = np.where(mask2d[:, :, None, None], 0.0, ssta)  # Clean numerical detrend leakage

    # =====================================================================
    #   2. TARGET (vara) PREPROCESSING + SPECIFIED RANGE AMIP DETRENDING
    # =====================================================================
    a_za = varna[:, isea, :, :] 
    vara_raw = np.transpose(a_za, (1, 2, 0))

    print(f"--> Slicing and detrending target variables strictly over AMIP index range [{detrend_start}:{detrend_end}]...")
    vara_pre   = vara_raw[:, :, :detrend_start]
    vara_target = vara_raw[:, :, detrend_start:detrend_end]
    vara_post  = vara_raw[:, :, detrend_end:]

    # Detrend only the selected AMIP target slice
    vara_detrended_slice = detrend(vara_target, axis=-1)

    # Stitch back together
    vara = np.concatenate([vara_pre, vara_detrended_slice, vara_post], axis=-1)

    # Extract statistical moments over the consistent hybrid space
    vara_mean = vara.mean()
    vara_std = vara.std() + 1e-8

    #opt_pat = True
    opt_pat = False

    print("ssta:",ssta.shape,"vara:",vara.shape)
    print("lat:", lat.shape)
    print("lon:", lon.shape)
    print("lm:",  lm.shape)
    print('val_split_pct=',val_split_pct)
    print('optmize for pattern = ',opt_pat)

    # =====================================================================
    #   3. EXECUTION CONTROL POOL (STAGE 1 PRE-TRAIN VS STAGE 2 FINE-TUNE)
    # =====================================================================
    if val_split_pct != 0:
        # Standard fallback if user explicitly requests random percentage shuffle
        model = run_toolbox_fno(ssta, vara, lat, lon, varn, season, val_split_pct)
    else:
        # Define distinct paths to store Stage 1 pre-trained spatial weights
        pretrain_weight_path = f"/work/miz/mat_hiresmip/fno_gf/unet_pretrain_patches_{varn}_{season}.pt"
        
        # -----------------------------------------------------------------
        # STAGE 1: Pre-train exclusively on fundamental physical patches
        # -----------------------------------------------------------------
        if not os.path.exists(pretrain_weight_path):
            print("\n=== STAGE 1: Pre-training Spatial U-Net Core on Idealized Ocean Patches [0 to 152] ===")
            patch_train_idx = np.arange(0, 153)
            
            # Train a core model to learn local physical wave response structures
            model_pretrained = run_toolbox_fno(ssta, vara, lat, lon, varn, season, val_split_pct=0.0,
                                               val_idx_list=None, train_idx_list=patch_train_idx, 
                                               optimize_for_pattern=opt_pat, checkpoint_path=None)
            
            # Save these fundamental physical filters specifically for fine-tuning initialization
            os.makedirs(os.path.dirname(pretrain_weight_path), exist_ok=True)
            torch.save(model_pretrained.state_dict(), pretrain_weight_path)
            print(f"--> Stage 1 spatial weights exported to: {pretrain_weight_path}")
        else:
            print(f"\n--> Found existing Stage 1 U-Net weights at {pretrain_weight_path}. Skipping pre-training phase.")

        # -----------------------------------------------------------------
        # STAGE 2: Fine-tune warm-started model strictly on historical AMIP
        # -----------------------------------------------------------------
        print("\n=== STAGE 2: Fine-tuning Warm-Started U-Net on AMIP Timeline ===")
        tra_exp = np.arange(153, 274)  # AMIP training block
        val_exp = np.arange(274, 297)  # AMIP verification block
        
        print('Training experiments:', tra_exp)
        print('Validation experiments=', val_exp)
        
        # Invoke our training pipeline while routing the Stage 1 weights for warm-start initialization
        model = run_toolbox_fno(ssta, vara, lat, lon, varn, season, val_split_pct=0.0,
                                val_idx_list=val_exp, train_idx_list=tra_exp, 
                                optimize_for_pattern=opt_pat, checkpoint_path=pretrain_weight_path)


    #print("Finished."); sys.exit()

    # =====================================================================
    #   6. VISUALIZATION BLOCK: 6-PANEL (2 ROWS X 3 COLUMNS) PLOT
    # =====================================================================
    print("\n--- Visualizing Multi-Experiment Model Prediction vs. Ground Truth ---")
        
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model.to(device)
    model.eval()

    verify_experiments = [296, 297]
    fig, axes = plt.subplots(2, 3, figsize=(22, 10), sharex=True, sharey=True)

    lon_grid, lat_grid = np.meshgrid(lon, lat)
    lat_norm = 2 * (lat_grid - lat_grid.min()) / (lat_grid.max() - lat_grid.min()) - 1
    lon_norm = 2 * (lon_grid - lon_grid.min()) / (lon_grid.max() - lon_grid.min()) - 1

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
        axes[row_idx, 0].set_title(f"Exp {exp_idx}: Input SST Anomaly", fontsize=11, fontweight='bold')
        axes[row_idx, 0].set_ylabel("Latitude", fontsize=10)
        if row_idx == 1: axes[row_idx, 0].set_xlabel("Longitude", fontsize=10)
        axes[row_idx, 0].grid(True, linestyle='--', alpha=0.5)
        cbar1 = fig.colorbar(im1, ax=axes[row_idx, 0], orientation='horizontal', pad=0.12, shrink=0.75)
        cbar1.set_label("SST Anomaly (°C)", fontsize=9)

        # Panel 2: Ground Truth Physical Response
        im2 = axes[row_idx, 1].pcolormesh(lon, lat, vara_true_original, cmap='RdBu_r', vmin=vmin_target, vmax=vmax_target, shading='auto')
        axes[row_idx, 1].set_title(f"Exp {exp_idx}: True response ({varn})", fontsize=11, fontweight='bold')
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

    plt.suptitle(f"Global {varn} Response Verification (Stage-2 UNet Hybrid, {season} Season)", fontsize=15, y=0.98, fontweight='bold')

    output_png = f"unet_verification_comparison_6panel_{season}.png"
    plt.savefig(output_png, dpi=300, bbox_inches='tight')
    print(f"--> Sequential 2-Stage UNet 6-panel verification comparison plot saved to: {output_png}")
    plt.show()
