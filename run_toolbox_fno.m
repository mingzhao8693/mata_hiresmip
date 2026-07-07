%% =====================================================================
%   run_toolbox_fno.m
%   Fourier Neural Operator (FNO) - Optimized Multi-Batch Training Loop
%% =====================================================================
function param = run_toolbox_fno(ssta, z500, lat, lon, sea)
    rng(42);

    nlat       = size(ssta, 1);
    nlon       = size(ssta, 2);
    numSamples = size(ssta, 4);

    %% 1. Format Geometry & Vectorize Input Pipeline
    [LatGrid, LonGrid] = ndgrid(lat, lon);
    LatGrid_norm = 2 * (LatGrid - min(LatGrid(:))) / (max(LatGrid(:)) - min(LatGrid(:))) - 1;
    LonGrid_norm = 2 * (LonGrid - min(LonGrid(:))) / (max(LonGrid(:)) - min(LonGrid(:))) - 1;

    X_data = zeros(nlat, nlon, 3, numSamples, 'single');
    X_data(:,:,1,:) = single(ssta); 
    X_data(:,:,2,:) = repmat(single(LatGrid_norm), [1, 1, 1, numSamples]); 
    X_data(:,:,3,:) = repmat(single(LonGrid_norm), [1, 1, 1, numSamples]); 

    X_dl = dlarray(X_data); 
    Y_dl = dlarray(reshape(single(z500), [nlat, nlon, 1, numSamples]));

    % Check for GPU acceleration
    try
        canUseGPU = (gpuDeviceCount > 0);
    catch
        canUseGPU = false;
    end

    if canUseGPU
        X_dl = gpuArray(X_dl);
        Y_dl = gpuArray(Y_dl);
        fprintf('--> GPU Acceleration Enabled.\n');
    else
        fprintf('--> Running on CPU. Mini-batch execution proceeding.\n');
    end

    %% 2. Initialize Model Parameters (HIGH-CAPACITY SPECTRAL RESOLUTION)
    width = 64;   % Internal channels
    modes = 24;   % Frequency modes
    scale = 1 / width;
    
    param = struct(...
        'lifting_w',     dlarray(scale * randn(width, 3, 'single')), ...
        'proj_w',        dlarray(scale * randn(1, width, 'single')), ...
        'w_skip',        dlarray(scale * randn(width, width, 'single')), ...
        'weights1_real', dlarray(scale * randn(modes, modes, width, width, 'single')), ...
        'weights1_imag', dlarray(scale * randn(modes, modes, width, width, 'single')), ...
        'weights2_real', dlarray(scale * randn(modes, modes, width, width, 'single')), ...
        'weights2_imag', dlarray(scale * randn(modes, modes, width, width, 'single')) ...
    );

    if canUseGPU
        fields = fieldnames(param);
        for f = 1:numel(fields)
            param.(fields{f}) = gpuArray(param.(fields{f}));
        end
    end

    %% 3. Setup ADAM Optimizer Parameters (Optimized for 150 Epochs)
    lr = 0.01;       
    epochs = 150;    
    batchSize = 16;  
    numBatches = ceil(numSamples / batchSize);
    iteration = 0;

    trailingAvg = struct(); trailingAvgSq = struct();
    fields = fieldnames(param);
    for f = 1:numel(fields)
        trailingAvg.(fields{f}) = []; trailingAvgSq.(fields{f}) = [];
    end

    %% 4. Mini-Batch Optimization Loop
    fprintf('Training FNO on %d samples with %d batches per epoch...\n', numSamples, numBatches);
    
    for epoch = 1:epochs
        idx = randperm(numSamples);
        X_shuffled = X_dl(:,:,:,idx);
        Y_shuffled = Y_dl(:,:,:,idx);
        
        epochLoss = 0;
        
        for b = 1:numBatches
            iteration = iteration + 1;
            
            startIdx = (b-1)*batchSize + 1;
            endIdx   = min(b*batchSize, numSamples);
            
            X_batch = X_shuffled(:,:,:,startIdx:endIdx);
            Y_batch = Y_shuffled(:,:,:,startIdx:endIdx);
            
            [batchLoss, g_param] = dlfeval(@fnoClimateLoss, X_batch, Y_batch, param, lat);
            epochLoss = epochLoss + extractdata(batchLoss);
            
            for f = 1:numel(fields)
                name = fields{f};
                [param.(name), trailingAvg.(name), trailingAvgSq.(name)] = adamupdate(...
                    param.(name), g_param.(name), trailingAvg.(name), trailingAvgSq.(name), iteration, lr);
            end
        end
        
        % --- Fixed Scheduling Decay (ep changed to epoch) ---
        if epoch == 30 || epoch == 60 || epoch == 90 || epoch == 120
            lr = lr * 0.5;
            fprintf('--> Learning rate decayed to: %g\n', lr);
        end
        
        fprintf('Epoch %d/%d - Avg True Relative L2 Loss: %.4f\n', epoch, epochs, epochLoss / numBatches);
    end

    %% 5. Export and Save Model Weights
    fn = sprintf('fno_toolbox_weights_%s.mat', sea); 
    if canUseGPU
        fields = fieldnames(param);
        for f = 1:numel(fields)
            param.(fields{f}) = gather(param.(fields{f}));
        end
    end
    save(fn, 'param'); 
    fprintf('Weights saved successfully to %s\nTraining complete!\n', fn);
end

%% =====================================================================
%   LOCAL FUNCTION: Clean, Robust Forward Pass 
%% =====================================================================
function Y_pred = fno_forward_centered(X, lifting_w, proj_w, w_skip, ...
                                      weights1_real, weights1_imag, weights2_real, weights2_imag)
    [lat, lon, ~, numSamples] = size(X);
    width = size(lifting_w, 1);
    
    %% 1. Lifting Layer
    X_flat = reshape(permute(X, [3, 1, 2, 4]), [3, lat * lon * numSamples]);
    H_flat = lifting_w * X_flat; 
    H = reshape(H_flat, [width, lat, lon, numSamples]);
    H = permute(H, [2, 3, 1, 4]); % [lat, lon, width, numSamples]
    
    %% 2. Fourier Block (Clean Filtering & Mode Multiplications)
    pad_lat = 4; 
    H_padded = padarray(H, [pad_lat, 0, 0, 0], 'replicate', 'both');
    lat_pad = size(H_padded, 1);
    
    % 2D FFT across spatial dimensions
    H_ft = fft(fft(H_padded, [], 1), [], 2); 
    
    modes1 = size(weights1_real, 1);
    modes2 = size(weights1_real, 2);
    
    % Reconstruct Complex weights
    W1 = complex(weights1_real, weights1_imag); 
    W2 = complex(weights2_real, weights2_imag); 
    
    % Allocates complex zeros matching H's underlying execution environment (CPU/GPU)
    raw_zeros = complex(zeros(lat_pad, lon, width, numSamples, 'like', extractdata(H)));
    Z_ft = dlarray(raw_zeros);
    
    % Loop across modes for channel transformations
    % Top-left corner
    for m1 = 1:modes1
        for m2 = 1:modes2
            h_slice = squeeze(H_ft(m1, m2, :, :));
            w1_slice = squeeze(W1(m1, m2, :, :)); 
            Z_ft(m1, m2, :, :) = reshape(w1_slice * h_slice, [1, 1, width, numSamples]);
        end
    end
    
    % Bottom-left corner
    for m1 = 1:modes1
        for m2 = 1:modes2
            h_slice = squeeze(H_ft(end-m1+1, m2, :, :));
            w2_slice = squeeze(W2(m1, m2, :, :));
            Z_ft(end-m1+1, m2, :, :) = reshape(w2_slice * h_slice, [1, 1, width, numSamples]);
        end
    end
    
    % 2D IFFT
    Z_spectral_padded = real(ifft(ifft(Z_ft, [], 1), [], 2)); 
    Z_spectral = Z_spectral_padded(pad_lat+1:end-pad_lat, :, :, :);
    
    %% 3. Vectorized Local Skip Path
    H_perm = reshape(permute(H, [3, 1, 2, 4]), [width, lat * lon * numSamples]);
    Z_skip_flat = w_skip * H_perm;
    Z_skip = reshape(Z_skip_flat, [width, lat, lon, numSamples]);
    Z_skip = permute(Z_skip, [2, 3, 1, 4]);
    
    %% 4. Activation & Projection Layers
    Combined = Z_spectral + Z_skip;
    
    % FIXED: Strips complex metadata completely so gelu accepts the tensor
    Combined = real(Combined); 
    H_lat = gelu(Combined); 

    H_lat_flat = reshape(permute(H_lat, [3, 1, 2, 4]), [width, lat * lon * numSamples]);
    Y_flat = proj_w * H_lat_flat; 
    
    Y_pred = real(reshape(Y_flat, [lat, lon, 1, numSamples]));
end

%% =====================================================================
%   LOCAL FUNCTION: Loss Function
%% =====================================================================
function [loss, g_param] = fnoClimateLoss(X, Y_true, param, lat_coordinates)
    Y_pred = fno_forward_centered(X, param.lifting_w, param.proj_w, param.w_skip, ...
        param.weights1_real, param.weights1_imag, param.weights2_real, param.weights2_imag);
    
    Y_true = reshape(Y_true, size(Y_pred));
    [lat, lon, ~, batchSize] = size(Y_pred);
    
    % Generate Area Weighting Matrix (Crucial for Climate grids)
    W_lat = cosd(lat_coordinates(:)); 
    W_grid = repmat(W_lat, [1, lon]);   
    
    Y_pred_flat = reshape(Y_pred, [lat * lon, batchSize]);
    Y_true_flat = reshape(Y_true, [lat * lon, batchSize]);
    W_flat      = reshape(single(W_grid), [lat * lon, 1]); 
    
    % Calculate True Area-Weighted Relative L2 Loss
    diff_sq = (Y_pred_flat - Y_true_flat).^2 .* W_flat;
    true_sq = Y_true_flat.^2 .* W_flat;
    
    diff_norm = sqrt(sum(diff_sq, 1)); 
    true_norm = sqrt(sum(true_sq, 1)); 
    
    loss = mean(diff_norm ./ (true_norm + 1e-7));
    
    [g.lifting_w, g.proj_w, g.w_skip, g.weights1_real, g.weights1_imag, g.weights2_real, g.weights2_imag] = ...
        dlgradient(loss, param.lifting_w, param.proj_w, param.w_skip, ...
        param.weights1_real, param.weights1_imag, param.weights2_real, param.weights2_imag);
    g_param = g;
end
