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
#ex: python fno_training_amip.py z500 JJA  dataset  val_split_pct use_memory(0) sub_ens_size(5) num_draws (8) lat_min(15.0) lat_max(75.0)
#ex: python fno_training_amip.py z500 JJA  0        0             0             5               8             15.0          75.0         
    varn   = sys.argv[1]
    season = sys.argv[2]
    # Read the 3rd arguments for dataset choice
    dataset = int(sys.argv[3]) if len(sys.argv) > 3 else 0
    # Read the 4th argument for percentage for splitting data into training vs verfication set
    val_split_pct = float(sys.argv[4])  # This parameter is bypassed when val_split_pct = 0
    
    # Read the 5th argument: 0 for Single Season, 1 for Multi-Season Memory (defaults to 0 if omitted)
    use_memory = int(sys.argv[5]) if len(sys.argv) > 5 else 0

    # Read the 6th argument: Size of sub-ensemble groups to average (defaults to 1 = individual members)
    sub_ens_size = int(sys.argv[6]) if len(sys.argv) > 6 else 1

    # Read the 7th argument: Number of unique random combinations to draw per year (defaults to 1)
    num_draws = int(sys.argv[7]) if len(sys.argv) > 7 else 1

    # Read the 8th and 9th arguments for dynamic latitude band focusing (defaults to full global grid)
    lat_min = float(sys.argv[8]) if len(sys.argv) > 8 else -90.0
    lat_max = float(sys.argv[9]) if len(sys.argv) > 9 else 90.0
    
    
    # Determine if a targeted sub-region configuration is requested
    metrics_lat_band = 1 if ((lat_min > -90.0) or (lat_max < 90.0)) else 0

    #varn ='z500'; season='JJA'; val_split_pct=0; 
    sea = ['ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'] 
    isea = sea.index(season)

    print(f"--> Variable={varn}, Season={season}, isea={isea}, val_split_pct={val_split_pct},"
          f" use_memory={use_memory}, sub_ens_size={sub_ens_size}, num_draws={num_draws},"
          f" lat_min={lat_min}, lat_max={lat_max}")

    if dataset == 0:
        # 25 member ensemble C192L33_CM4X_amip_en simulations, each from 1950 to 2020 inclusive
        n_members = 25; n_years = 71;  yearlst=np.arange(1950, 2021); fn='/work/miz/mat_ml/c192L33_CM4X_amip_en.mat'
    elif dataset == 1:
        # 11 member ensemble of c96L33_am4p0_longamip_en simulations from 1870 to 2014 inclusive
        n_members = 11; n_years = 145; yearlst=np.arange(1870, 2015); fn='/work/miz/mat_ml/c96L33_am4p0_longamip_en.mat'
    elif dataset == 2:
        # 153 member ensemble of c96L33_am4p0_2010climo_GF_en simulations from 1 to 30 inclusive
        n_members = 30; n_years = 153; yearlst=np.arange(1, 31);      fn='/work/miz/mat_ml/c96L33_am4p0_2010climo_GF_en_rot.mat'
    elif dataset == 3:
        # 100 member ensemble of c192L33_am4p0_2010climo_trend_en simulations from 1 to 30 inclusive
        n_members = 100; n_years = 12; yearlst=np.arange(1, 100);     fn='/work/miz/mat_ml/c192L33_am4p0_2010climo_trend_en.mat'
    
    f = h5py.File(fn, 'r')
    z = f['zx']

    print(f"--> Loading and analyzing file = {fn}")
    lat   = get_array(z, 'lat')
    lon   = get_array(z, 'lon')
    lm    = get_array(z, 'lm')
    im    = get_array(z, 'im')
    tsurf = get_array(z, 'tsurf')
    ice   = get_array(z, 'ice')
    varna = get_array(z, varn)

    print(f"--> Multi-Member Ensemble training for {varn} {season} season; Data: n_members={n_members}; n_years={n_years};")
    print(f"--> n_members={n_members}; n_years={n_years}; year_start={yearlst[0]}; year_end={yearlst[-1]}")

    im_2d = np.squeeze(im[isea, :, :])

    # =====================================================================
    #   1. EXTRACT AMIP RAW SLICES (EXCLUDING GFMIP PATCHES)
    # =====================================================================
    # GFMIP Patches are 0:153. AMIP indices are 153:297.
    # We slice strictly the AMIP run timeline.
    
    # --- DYNAMIC MEMORY TOGGLE CONFIGURATION ---
    if use_memory == 1:
        # Establish dynamic preceding season memory based on the current season
        if isea == 2:    # JJA -> stack MAM (1) and JJA (2)
            input_seasons = [1, 2]
        elif isea == 4:  # DJF -> stack SON (3) and DJF (4)
            input_seasons = [3, 4]
        elif isea == 3:  # SON -> stack JJA (2) and SON (3)
            input_seasons = [2, 3]
        elif isea == 1:  # MAM -> stack DJF (4) and MAM (1)
            input_seasons = [4, 1]
        else:
            input_seasons = [isea] # Fallback to single channel
        print(f"--> [MEMORY MODE] Multi-time-lag activated. Input channels: {[sea[idx] for idx in input_seasons]}")
    else:
        # Standard Single Season mode
        input_seasons = [isea]
        print(f"--> [SINGLE-SEASON MODE] Activated. Input channel: {[sea[idx] for idx in input_seasons]}")

    num_ch = len(input_seasons)

    a = tsurf[:, input_seasons, :, :]  
    ssta_all = np.transpose(a, (2, 3, 1, 0))   # (90, 144, num_ch, 355)
    
    a = ice[:, input_seasons, :, :]  
    ice_all = np.transpose(a, (2, 3, 1, 0))    # (90, 144, num_ch, 355)

    # Let's reshape this to: (lat, lon, n_members, n_years) e.g., (90, 144, 25, 71)
    
    amip_ssta_slice = ssta_all[:, :, :, :]
    amip_icem_slice = ice_all[:, :, :, :]
    amip_vara_slice = np.transpose(varna[:, isea, :, :], (1, 2, 0))[:, :, :]

    # Verify if indices need exact reshaping
    # Reshape array to handle the 4D member-year split plus multi-channel SST
    amip_ssta = amip_ssta_slice.reshape(90, 144, num_ch, n_members, n_years)
    amip_icem = amip_icem_slice.reshape(90, 144, num_ch, n_members, n_years)
    amip_vara = amip_vara_slice.reshape(90, 144, n_members, n_years)
    
    print(f"--> Extracted AMIP dataset containing {n_members} members across {n_years} historical years.")

    # =====================================================================
    #   2. PHYSICALLY CORRECT ENSEMBLE DETRENDING
    # =====================================================================
    print("--> Calculating forced climate trend from",n_members,"member Ensemble Mean...")
    # Calculate the ensemble mean across members (axis 3 for SST, axis 2 for VARA) to extract the forced trend
    ssta_ens_mean = np.mean(amip_ssta, axis=3)  # (90, 144, num_ch, 71)
    vara_ens_mean = np.mean(amip_vara, axis=2)  # (90, 144, 71)

    # Calculate trend lines using linear detrending along the temporal axis
    ssta_trend = ssta_ens_mean - detrend(ssta_ens_mean, axis=-1)
    vara_trend = vara_ens_mean - detrend(vara_ens_mean, axis=-1)

    # Subtract the unified forced trend from each individual member
    print("--> Subtracting forced trend line from each individual member...")
    ssta_detrended = np.zeros_like(amip_ssta)
    vara_detrended = np.zeros_like(amip_vara)
    
    for m in range(n_members):
        ssta_detrended[:, :, :, m, :] = amip_ssta[:, :, :, m, :] - ssta_trend
        vara_detrended[:, :, m, :] = amip_vara[:, :, m, :] - vara_trend

    # Mask land values post-detrending to clean numerical anomalies
    land_mask = (lm > 0)
    lnd_mask = land_mask[:, :, None, None, None]
    ice_mask = amip_icem > 0
    combined_mask = lnd_mask | ice_mask
    mask_option = 1
    if mask_option == 1:
        print(f"--> Mask both land and ice covered regions")
        ssta_detrended = np.where(combined_mask, 0.0, ssta_detrended)
    elif mask_option == 2:
        print(f"--> Mask land region only")
        ssta_detrended = np.where(lnd_mask, 0.0, ssta_detrended)
    elif mask_option == 3:
        print(f"--> Mask ice covered region only")
        ssta_detrended = np.where(ice_mask, 0.0, ssta_detrended)
    else:
        print(f"--> No masking is performed for surface temperature")

    # =====================================================================
    #   2b. OPTIONAL SUB-ENSEMBLE AVERAGING / NOISE REDUCTION / COMBINATORIAL AUGMENTATION
    # =====================================================================
    if sub_ens_size > 1:
        if num_draws == 1:
            # Mode 1: Standard, non-overlapping partitions
            if n_members % sub_ens_size != 0:
                raise ValueError(f"Ensemble size ({n_members}) must be perfectly divisible by sub_ens_size ({sub_ens_size}) for non-overlapping partitions!")
            
            n_sub_groups = n_members // sub_ens_size
            print(f"--> [SUB-ENSEMBLE MODE] Grouping {n_members} members into {n_sub_groups} sub-ensembles of size {sub_ens_size}...")
            
            # Reshape and average SSTA along the sub-ensemble grouping dimension
            ssta_grouped = ssta_detrended.reshape(90, 144, num_ch, n_sub_groups, sub_ens_size, n_years)
            ssta_detrended = np.mean(ssta_grouped, axis=4)  # New shape: (90, 144, num_ch, n_sub_groups, n_years)
            
            # Reshape and average VARA along the sub-ensemble grouping dimension
            vara_grouped = vara_detrended.reshape(90, 144, n_sub_groups, sub_ens_size, n_years)
            vara_detrended = np.mean(vara_grouped, axis=3)  # New shape: (90, 144, n_sub_groups, n_years)
            
            n_members = n_sub_groups
        else:
            # Mode 2: Combinatorial / Bootstrap Data Augmentation
            import itertools
            import random
            
            # Calculate total unique combinations possible mathematically
            all_combos = list(itertools.combinations(range(n_members), sub_ens_size))
            if num_draws > len(all_combos):
                raise ValueError(f"Requested {num_draws} draws, but only {len(all_combos)} unique combinations are mathematically possible from choosing {sub_ens_size} out of {n_members} members!")
            
            print(f"--> [COMBINATORIAL AUGMENTATION] Generating {num_draws} unique combinations of size {sub_ens_size} out of {n_members} members per year...")
            
            # Use fixed random seed to guarantee reproducibility of the draws
            random.seed(42)
            selected_combos = random.sample(all_combos, num_draws)
            
            # Initialize augmented arrays of shape: (90, 144, num_ch, num_draws, n_years)
            ssta_aug = np.zeros((90, 144, num_ch, num_draws, n_years), dtype=ssta_detrended.dtype)
            vara_aug = np.zeros((90, 144, num_draws, n_years), dtype=vara_detrended.dtype)
            
            for d, combo in enumerate(selected_combos):
                # Take the mean over the randomized combo pool
                ssta_aug[:, :, :, d, :] = np.mean(ssta_detrended[:, :, :, combo, :], axis=3)
                vara_aug[:, :, d, :] = np.mean(vara_detrended[:, :, combo, :], axis=2)
                
            ssta_detrended = ssta_aug
            vara_detrended = vara_aug
            n_members = num_draws  # Seamlessly update downstream dimension variables

    # =====================================================================
    #   3. CHRONOLOGICAL SPLIT (Years 1950-2005 vs 2006-2020)
    # =====================================================================
    # 1950 to 2005 is 56 years. Remaining 15 years are used for out-of-sample validation.
    train_year_cutoff = int(0.85 * n_years)
    val_year_count = n_years - train_year_cutoff  # 15 years
    
    print(f"--> Splitting chronological blocks:" 
          f" Training: (1-{train_year_cutoff} yrs = {yearlst[0]}-{yearlst[train_year_cutoff-1]});"
          f" Validation: ({train_year_cutoff+1}-{n_years} yrs = {yearlst[train_year_cutoff]}-{yearlst[-1]})")
    
    ssta_train_block = ssta_detrended[:, :, :, :, :train_year_cutoff]  # (90, 144, num_ch, n_members, 56)
    ssta_val_block   = ssta_detrended[:, :, :, :, train_year_cutoff:]  # (90, 144, num_ch, n_members, 15)
    
    vara_train_block = vara_detrended[:, :, :, :train_year_cutoff]  # (90, 144, n_members, 56)
    vara_val_block   = vara_detrended[:, :, :, train_year_cutoff:]  # (90, 144, n_members, 15)

    # =====================================================================
    #   4. FLAT-STACK MEMBERS AND YEARS INTO "SAMPLES"
    # =====================================================================
    train_samples = n_members * train_year_cutoff               # e.g., n_sub_groups/num_draws * 56
    val_samples   = n_members * val_year_count                  # e.g., n_sub_groups/num_draws * 15
    
    ssta_train = ssta_train_block.reshape(90, 144, num_ch, train_samples)
    ssta_val   = ssta_val_block.reshape(90, 144, num_ch, val_samples)
    
    vara_train = vara_train_block.reshape(90, 144, train_samples)
    vara_val   = vara_val_block.reshape(90, 144, val_samples)

    # Combine back together for the standard 1D sample loading expected by FNO wrapper
    ssta = np.concatenate([ssta_train, ssta_val], axis=-1)  # (90, 144, num_ch, total_samples)
    vara = np.concatenate([vara_train, vara_val], axis=-1)  # (90, 144, total_samples)

    print(f"--> Dataset shapes structured for FNO:")
    print(f"--> SSTA: {ssta.shape} | VARA: {vara.shape}")

    # =====================================================================
    #   5. ESTABLISH EXPLICIT BOUNDARY INDICES & LOSS PROFILE MASK GENERATION
    # =====================================================================
    train_idx_list = np.arange(0, train_samples)
    val_idx_list   = np.arange(train_samples, train_samples + val_samples)

    print(f"--> Custom training samples count: {len(train_idx_list)}")
    print(f"--> Custom verification samples count: {len(val_idx_list)}")

    opt_pat = True
    print(f"--> opt_pat = {opt_pat}")

    # Dynamically generate 2D spatial weight mask to restrict backpropagation based on user inputs
    loss_weight_mask = None
    if metrics_lat_band == 1:
        # Resolve target grid row indicators matching bounds parameters
        print(f"--> Latitude band = {lat_min} - {lat_max}");
        target_lat_indices = np.where((lat >= lat_min) & (lat <= lat_max))[0]
        loss_weight_mask = np.zeros((90, 144), dtype=np.float32)
        loss_weight_mask[target_lat_indices, :] = 1.0
        
    # Define foundation weight file path
    # Construct a fully unique foundation checkpoint path encoding variable, season, years, and latitude domain
    #foundation_ckpt_path = f"/work/miz/mat_hiresmip/fno_gf/fno_pretrained_{n_years}yr_{varn}_{season}_lat{int(lat_min)}to{int(lat_max)}.pt"
    foundation_ckpt_path = f"/work/miz/mat_hiresmip/fno_gf/fno_pretrained_145yr_{varn}_{season}_lat{int(lat_min)}to{int(lat_max)}.pt"

    # --- WARM START / COLD START TOGGLE ---
    # Automatically warm start if pre-trained weights exist and we are training on a sub-dataset (e.g., dataset 0)
    ckpt_to_load = foundation_ckpt_path if (dataset != 1 and os.path.exists(foundation_ckpt_path)) else None

    # Execute FNO training using the custom signature parameters setup
    model = run_toolbox_fno(ssta, vara, lat, lon, varn, season, val_split_pct=0.0,
                            val_idx_list=val_idx_list, train_idx_list=train_idx_list,
                            optimize_for_pattern=opt_pat, checkpoint_path=ckpt_to_load,
                            loss_weight_mask=loss_weight_mask, epochs=10)
    
    # Save foundation weights specifically when running on the 145-year dataset (dataset == 1)
    if dataset == 1:
        torch.save(model.to('cpu').state_dict(), foundation_ckpt_path)
        print(f"--> [FOUNDATION MODEL] Saved {n_years}-year pre-trained weights to: {foundation_ckpt_path}")
        
    # =====================================================================
    #   6. DUAL-MODE VERIFICATION AND VISUALIZATION BLOCK
    # =====================================================================
    print("\n=====================================================================")
    print("    RUNNING DETAILED OUT-OF-SAMPLE VERIFICATION (yearlst[val_year_count]-yearlst[-1])")
    print("=====================================================================")
        
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model.to(device)
    model.eval()

    lon_grid, lat_grid = np.meshgrid(lon, lat)
    lat_norm = 2 * (lat_grid - lat_grid.min()) / (lat_grid.max() - lat_grid.min()) - 1
    lon_norm = 2 * (lon_grid - lon_grid.min()) / (lon_grid.max() - lon_grid.min()) - 1

    # Standard scale targets strictly on training bounds parameters
    vara_mean = vara_train.mean()
    vara_std = vara_train.std() + 1e-8

    # Calculate standard deviation of the training ensemble mean (for proper ensemble-mean scaling)
    vara_train_ens_std = np.mean(vara_train_block, axis=2).std() + 1e-8

    # Configure lat band index filters if option is activated
    if metrics_lat_band == 1:
        target_lat_indices = np.where((lat >= lat_min) & (lat <= lat_max))[0]
        print(f"--> [LATITUDE BAND FILTER] Verification metrics calculated strictly on: {lat[target_lat_indices].min():.1f}°N - {lat[target_lat_indices].max():.1f}°N")

    # -----------------------------------------------------------------
    #   MODE A: INDIVIDUAL MEMBER VERIFICATION (All individual samples)
    # -----------------------------------------------------------------
    ind_accs = []
    ind_rmses = []

    for i in range(val_samples):
        # Index in the global concatenated 'ssta'/'vara' arrays
        exp_idx = train_samples + i  
        
        # Prepare inputs including the dynamic stacked preceding memory channels
        X_single = np.zeros((1, ssta.shape[0], ssta.shape[1], num_ch + 2), dtype=np.float32)
        X_single[0, :, :, :num_ch] = ssta[:, :, :, exp_idx]
        X_single[0, :, :, num_ch] = lat_norm
        X_single[0, :, :, num_ch + 1] = lon_norm
        X_tensor_single = torch.from_numpy(X_single).to(device)

        with torch.no_grad():
            pred_tensor_std = model(X_tensor_single, target_std=vara_std)
            vara_ml_pred_std = pred_tensor_std.cpu().numpy()[0, :, :, 0]
            vara_ml_pred = (vara_ml_pred_std * vara_std) + vara_mean
            vara_true_original = vara[:, :, exp_idx]

        # Conditionally restrict metrics vectors to specified latitude band
        if metrics_lat_band == 1:
            v_true = vara_true_original[target_lat_indices, :].ravel()
            v_pred = vara_ml_pred[target_lat_indices, :].ravel()
        else:
            v_true = vara_true_original.ravel()
            v_pred = vara_ml_pred.ravel()

        rmse = np.sqrt(np.mean((v_true - v_pred) ** 2))
        correlation = np.corrcoef(v_true, v_pred)[0, 1]
        
        ind_accs.append(correlation)
        ind_rmses.append(rmse)

    mean_ind_acc = np.mean(ind_accs)
    mean_ind_rmse = np.mean(ind_rmses)

    # -----------------------------------------------------------------
    #   MODE B: ENSEMBLE MEAN VERIFICATION (Averaged by Year)
    # -----------------------------------------------------------------
    # Reconstruct 4D blocks to easily average across members (axis 3)
    val_ssta_4d = ssta_val_block  # (90, 144, num_ch, n_members, val_year_count)
    val_vara_4d = vara_val_block  # (90, 144, n_members, val_year_count)

    # Compute Ensemble Mean for each validation year -> axis 3 for SST, axis 2 for VARA
    val_ssta_ens_mean = np.mean(val_ssta_4d, axis=3)  # (90, 144, num_ch, val_year_count)
    val_vara_ens_mean = np.mean(val_vara_4d, axis=2)  # (90, 144, val_year_count)

    ens_mean_accs = []
    ens_mean_rmses = []

    for year_idx in range(val_year_count):
        sst_anomaly_slice = val_ssta_ens_mean[:, :, :, year_idx]
        vara_true_original = val_vara_ens_mean[:, :, year_idx]

        X_single = np.zeros((1, ssta.shape[0], ssta.shape[1], num_ch + 2), dtype=np.float32)
        X_single[0, :, :, :num_ch] = sst_anomaly_slice
        X_single[0, :, :, num_ch] = lat_norm
        X_single[0, :, :, num_ch + 1] = lon_norm
        X_tensor_single = torch.from_numpy(X_single).to(device)

        with torch.no_grad():
            pred_tensor_std = model(X_tensor_single, target_std=vara_train_ens_std)
            vara_ml_pred_std = pred_tensor_std.cpu().numpy()[0, :, :, 0]
            vara_ml_pred = (vara_ml_pred_std * vara_train_ens_std) + vara_mean

        # Conditionally restrict metrics vectors to specified latitude band
        if metrics_lat_band == 1:
            v_true = vara_true_original[target_lat_indices, :].ravel()
            v_pred = vara_ml_pred[target_lat_indices, :].ravel()
        else:
            v_true = vara_true_original.ravel()
            v_pred = vara_ml_pred.ravel()

        rmse = np.sqrt(np.mean((v_true - v_pred) ** 2))
        correlation = np.corrcoef(v_true, v_pred)[0, 1]
        
        ens_mean_accs.append(correlation)
        ens_mean_rmses.append(rmse)

    mean_ens_acc = np.mean(ens_mean_accs)
    mean_ens_rmse = np.mean(ens_mean_rmses)

    # -----------------------------------------------------------------
    #   PRINT RESULTS TO TERMINAL
    # -----------------------------------------------------------------
    print("\n================ VERIFICATION PERFORMANCE SUMMARY ================")
    print(f"Variable: {varn} | Season: {season}")
    print(f"Validation Period: {val_year_count} Years)")
    if sub_ens_size > 1 and num_draws > 1:
        print(f"Ensemble Configuration: Combinatorial Augmentation ({num_draws} Draws of size {sub_ens_size} per year)")
    else:
        print(f"Ensemble Members: {n_members if sub_ens_size == 1 else n_members * sub_ens_size} (Sub-Averaged Group Size: {sub_ens_size})")
    if metrics_lat_band == 1:
        print(f"Domain Constraints: Loss & Metrics strictly focused over Latitude Band ({lat[target_lat_indices].min():.1f}°N - {lat[target_lat_indices].max():.1f}°N)")
    print("------------------------------------------------------------------")
    print(f"1. INDIVIDUAL MEMBER VERIFICATION (Total Samples: {val_samples}):")
    print(f"   --> Mean Spatial Correlation (ACC): {mean_ind_acc:.4f}")
    print(f"   --> Mean Absolute Error (RMSE):    {mean_ind_rmse:.4f}")
    print("------------------------------------------------------------------")
    print(f"2. ENSEMBLE MEAN VERIFICATION (Total Years: {val_year_count}):")
    print(f"   --> Mean Spatial Correlation (ACC): {mean_ens_acc:.4f}")
    print(f"   --> Mean Absolute Error (RMSE):    {mean_ens_rmse:.4f}")
    print("==================================================================\n")

    # =====================================================================
    #   7. NEW: CHRONOLOGICAL YEAR-BY-YEAR ACC & RMSE TABLE FOR ALL 71 YEARS
    # =====================================================================
    print("\n====================================================================================================")
    print("    CHRONOLOGICAL ENSEMBLE MEAN EVALUATION (1950 - 2020) WITH AMIP SUB-ENSEMBLE BASELINE")
    print("====================================================================================================")
    print(f" {'YEAR':<6} | {'PERIOD':<12} | {'ML ACC (r)':<12} | {'ML RMSE':<10} | {'SUB-ENS ACC (r)':<15} | {'SUB-ENS RMSE':<12}")
    print("-" * 88)

    full_ssta_4d = ssta_detrended  # (90, 144, num_ch, n_members, 71)
    full_vara_4d = vara_detrended  # (90, 144, n_members, 71)

    # Compute full ensemble mean across all members to serve as the ground truth target
    full_ssta_ens_mean = np.mean(full_ssta_4d, axis=3)  # (90, 144, num_ch, 71)
    full_vara_ens_mean = np.mean(full_vara_4d, axis=2)  # (90, 144, 71)

    for year_idx in range(n_years):
        calendar_year = yearlst[0] + year_idx
        period_label = "Training" if calendar_year <= yearlst[train_year_cutoff-1] else "Verification"

        sst_anomaly_slice = full_ssta_ens_mean[:, :, :, year_idx]
        vara_true_original = full_vara_ens_mean[:, :, year_idx]

        # Format input tensor for ML model
        X_single = np.zeros((1, ssta.shape[0], ssta.shape[1], num_ch + 2), dtype=np.float32)
        X_single[0, :, :, :num_ch] = sst_anomaly_slice
        X_single[0, :, :, num_ch] = lat_norm
        X_single[0, :, :, num_ch + 1] = lon_norm
        X_tensor_single = torch.from_numpy(X_single).to(device)

        with torch.no_grad():
            pred_tensor_std = model(X_tensor_single, target_std=vara_train_ens_std)
            vara_ml_pred_std = pred_tensor_std.cpu().numpy()[0, :, :, 0]
            vara_ml_pred = (vara_ml_pred_std * vara_train_ens_std) + vara_mean

        # --- COMPUTE EACH DRAWN SUB-ENSEMBLE'S SKILL AGAINST THE FULL ENSEMBLE TARGET ---
        sub_acc_list = []
        sub_rmse_list = []

        for m_idx in range(n_members):  # Iterate through every drawn sub-ensemble slice for this year
            sub_vara_slice = full_vara_4d[:, :, m_idx, year_idx]

            if metrics_lat_band == 1:
                v_true_sub = vara_true_original[target_lat_indices, :].ravel()
                v_sub = sub_vara_slice[target_lat_indices, :].ravel()
            else:
                v_true_sub = vara_true_original.ravel()
                v_sub = sub_vara_slice.ravel()

            s_rmse = np.sqrt(np.mean((v_true_sub - v_sub) ** 2))
            s_acc  = np.corrcoef(v_true_sub, v_sub)[0, 1]

            sub_acc_list.append(s_acc)
            sub_rmse_list.append(s_rmse)

        # Average the skill scores across all drawn sub-ensembles for this year
        sub_acc = np.mean(sub_acc_list)
        sub_rmse = np.mean(sub_rmse_list)

        # Crop ML output vectors if a lat band focus is requested
        if metrics_lat_band == 1:
            v_true = vara_true_original[target_lat_indices, :].ravel()
            v_pred = vara_ml_pred[target_lat_indices, :].ravel()
        else:
            v_true = vara_true_original.ravel()
            v_pred = vara_ml_pred.ravel()

        # ML model skill
        y_rmse = np.sqrt(np.mean((v_true - v_pred) ** 2))
        y_acc = np.corrcoef(v_true, v_pred)[0, 1]

        # Highlight separation between periods visually
        if calendar_year == yearlst[train_year_cutoff]:
            print("-" * 88)

        print(f" {calendar_year:<6} | {period_label:<12} | {y_acc:<12.4f} | {y_rmse:<10.4f} | {sub_acc:<15.4f} | {sub_rmse:<12.4f}")

    print("====================================================================================================\n")

    # -----------------------------------------------------------------
    #   PLOT ENSEMBLE MEAN FOR 1 TRAINING YEAR & 2 VALIDATION YEARS
    # -----------------------------------------------------------------
    # Select 1 strong training year (e.g., year index train_year_cutoff - 10) 
    # plus the first & last out-of-sample verification years
    train_sample_yr_idx = max(0, train_year_cutoff - 10) # Representative training year
    
    # Global 4D ensemble mean arrays across the entire dataset timeline
    full_ssta_4d = ssta_detrended
    full_vara_4d = vara_detrended
    full_ssta_ens_mean = np.mean(full_ssta_4d, axis=3) # (90, 144, num_ch, n_years)
    full_vara_ens_mean = np.mean(full_vara_4d, axis=2) # (90, 144, n_years)

    # Define indices in the full timeline: [Training Year, First Val Year, Last Val Year]
    target_year_indices = [train_sample_yr_idx, train_year_cutoff, n_years - 1]
    actual_calendar_years = [yearlst[idx] for idx in target_year_indices]
    period_types = ["Training", "Verification (Start)", "Verification (End)"]
    
    print(f"--> Target Plotting Year Indices: {target_year_indices}")
    print(f"--> Target Plotting Calendar Years: {actual_calendar_years}")
    
    # Expand canvas from 2x3 to 3x3 layout to accommodate the training year row
    fig, axes = plt.subplots(3, 3, figsize=(22, 14), sharex=True, sharey=True)

    for row_idx, global_year_idx in enumerate(target_year_indices):
        calendar_year = actual_calendar_years[row_idx]
        period_label = period_types[row_idx]

        sst_anomaly_slice = full_ssta_ens_mean[:, :, :, global_year_idx]
        vara_true_original = full_vara_ens_mean[:, :, global_year_idx]

        X_single = np.zeros((1, ssta.shape[0], ssta.shape[1], num_ch + 2), dtype=np.float32)
        X_single[0, :, :, :num_ch] = sst_anomaly_slice
        X_single[0, :, :, num_ch] = lat_norm
        X_single[0, :, :, num_ch + 1] = lon_norm
        X_tensor_single = torch.from_numpy(X_single).to(device)

        with torch.no_grad():
            pred_tensor_std = model(X_tensor_single, target_std=vara_train_ens_std)
            vara_ml_pred_std = pred_tensor_std.cpu().numpy()[0, :, :, 0]
            vara_ml_pred = (vara_ml_pred_std * vara_train_ens_std) + vara_mean

        # Match panel text metrics to targeted latitude band choice
        if metrics_lat_band == 1:
            p_true = vara_true_original[target_lat_indices, :]
            p_pred = vara_ml_pred[target_lat_indices, :]
            rmse_plot = np.sqrt(np.mean((p_true - p_pred) ** 2))
            correlation_plot = np.corrcoef(p_true.ravel(), p_pred.ravel())[0, 1]
        else:
            rmse_plot = np.sqrt(np.mean((vara_true_original - vara_ml_pred) ** 2))
            correlation_plot = np.corrcoef(vara_true_original.ravel(), vara_ml_pred.ravel())[0, 1]

        # Extract the target season SST slice (last channel index) for plotting
        sst_plot_slice = sst_anomaly_slice[:, :, num_ch - 1]

        vmax_sst = max(abs(np.min(sst_plot_slice)), abs(np.max(sst_plot_slice)))
        vmin_sst = -vmax_sst if vmax_sst > 0 else -1.0
        vmax_sst = vmax_sst if vmax_sst > 0 else 1.0

        vmin_target, vmax_target = np.min(vara_true_original), np.max(vara_true_original)

        # Panel 1: Input SST Anomaly Forcing
        im1 = axes[row_idx, 0].pcolormesh(lon, lat, sst_plot_slice, cmap='RdBu_r', vmin=vmin_sst, vmax=vmax_sst, shading='auto')
        axes[row_idx, 0].set_title(f"[{period_label}] Year {calendar_year}: SST Anomaly", fontsize=11, fontweight='bold')
        axes[row_idx, 0].set_ylabel("Latitude", fontsize=10)
        if row_idx == 2: axes[row_idx, 0].set_xlabel("Longitude", fontsize=10)
        axes[row_idx, 0].grid(True, linestyle='--', alpha=0.5)
        cbar1 = fig.colorbar(im1, ax=axes[row_idx, 0], orientation='horizontal', pad=0.12, shrink=0.75)
        cbar1.set_label("SST Anomaly (°C)", fontsize=9)

        # Panel 2: Ground Truth Physical Response
        im2 = axes[row_idx, 1].pcolormesh(lon, lat, vara_true_original, cmap='RdBu_r', vmin=vmin_target, vmax=vmax_target, shading='auto')
        axes[row_idx, 1].set_title(f"Year {calendar_year}: True Response ({varn})", fontsize=11, fontweight='bold')
        if row_idx == 2: axes[row_idx, 1].set_xlabel("Longitude", fontsize=10)
        axes[row_idx, 1].grid(True, linestyle='--', alpha=0.5)
        cbar2 = fig.colorbar(im2, ax=axes[row_idx, 1], orientation='horizontal', pad=0.12, shrink=0.75)
        cbar2.set_label("Physical Units", fontsize=9)

        # Panel 3: Model Spatial Prediction
        im3 = axes[row_idx, 2].pcolormesh(lon, lat, vara_ml_pred, cmap='RdBu_r', vmin=vmin_target, vmax=vmax_target, shading='auto')
        axes[row_idx, 2].set_title(f"RMSE: {rmse_plot:.3f} | ACC (r): {correlation_plot:.3f}", fontsize=11, fontweight='bold', color='darkred')
        if row_idx == 2: axes[row_idx, 2].set_xlabel("Longitude", fontsize=10)
        axes[row_idx, 2].grid(True, linestyle='--', alpha=0.5)
        cbar3 = fig.colorbar(im3, ax=axes[row_idx, 2], orientation='horizontal', pad=0.12, shrink=0.75)
        cbar3.set_label("Physical Units", fontsize=9)

    plt.suptitle(f"Global {varn} Response: In-Sample Training vs Out-of-Sample Verification ({season}); FNO", fontsize=15, y=0.99, fontweight='bold')

    output_png = f"fno_verification_comparison_9panel_train_val_{season}.png"
    plt.savefig(output_png, dpi=300, bbox_inches='tight')
    print(f"--> Training vs. Validation ensemble-mean plot saved to: {output_png}")
    plt.show()
