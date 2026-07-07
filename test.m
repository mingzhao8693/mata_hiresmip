function Y_pred = fno_forward_centered(X, lifting_w, proj_w, w_skip, ...
                                      weights1_real, weights1_imag, weights2_real, weights2_imag)
% FNO_FORWARD_CENTERED Executes the vectorized FNO forward pass.
% Enforces 2D conjugate symmetry to completely eliminate phase-scrambling bugs.

    [lat, lon, ~, numSamples] = size(X);
    width = size(lifting_w, 1);
    
    %% 1. Lifting Layer
    X_flat = reshape(permute(X, [3, 1, 2, 4]), [3, lat * lon * numSamples]);
    H_flat = lifting_w * X_flat; 
    
    H = reshape(H_flat, [width, lat, lon, numSamples]);
    H = permute(H, [2, 3, 1, 4]); % Layout: [Lat, Lon, Width, Batch]
    
    %% 2. Fourier Block with Boundary Protection
    pad_lat = 4; 
    H_padded = padarray(H, [pad_lat, 0, 0, 0], 'replicate', 'both');
    lat_pad = size(H_padded, 1);
    
    % 2D FFT
    H_ft = fft(fft(H_padded, [], 1), [], 2); 
    
    modes1 = size(weights1_real, 1);
    modes2 = size(weights1_real, 2);
    
    W1 = permute(complex(weights1_real, weights1_imag), [1, 2, 3, 4, 5]); 
    W2 = permute(complex(weights2_real, weights2_imag), [1, 2, 3, 4, 5]); 
    
    % Extract corners
    H_slice1 = permute(H_ft(1:modes1, 1:modes2, :, :), [1, 2, 3, 5, 4]); 
    Z_tl = permute(sum(H_slice1 .* W1, 3), [1, 2, 4, 5, 3]); 

    H_slice2 = permute(H_ft(end-modes1+1:end, 1:modes2, :, :), [1, 2, 3, 5, 4]);
    Z_bl = permute(sum(H_slice2 .* W2, 3), [1, 2, 4, 5, 3]); 
    
    % Assemble left half
    Middle_Zeros = dlarray(complex(zeros(lat_pad - 2*modes1, modes2, width, numSamples, 'single')));
    Left_Column  = cat(1, Z_tl, Middle_Zeros, Z_bl);
    
    Right_Zeros  = dlarray(complex(zeros(lat_pad, lon - modes2, width, numSamples, 'single')));
    Z_ft         = cat(2, Left_Column, Right_Zeros);
    
    % --- CRITICAL CLIMATE FIX: Mathematical Conjugate Symmetrization ---
    % Mathematically mirrors the left column across the center to remove the imaginary phase leak
    ref_lat = [1, lat_pad:-1:2];
    ref_lon = [1, lon:-1:2];
    Z_ft = 0.5 * (Z_ft + conj(Z_ft(ref_lat, ref_lon, :, :)));
    
    % 2D IFFT (Guaranteed real-valued output now)
    Z_spectral_padded = real(ifft(ifft(Z_ft, [], 1), [], 2)); 
    Z_spectral = Z_spectral_padded(pad_lat+1:end-pad_lat, :, :, :);
    
    %% 3. Vectorized Local Skip Path
    H_perm = reshape(permute(H, [3, 1, 2, 4]), [width, lat * lon * numSamples]);
    Z_skip_flat = w_skip * H_perm;
    Z_skip = reshape(Z_skip_flat, [width, lat, lon, numSamples]);
    Z_skip = permute(Z_skip, [2, 3, 1, 4]);
    
    %% 4. Activation & Projection Layers
    Combined = Z_spectral + Z_skip;
    H_lat = 0.5 * Combined .* (1 + tanh(sqrt(2/pi) * (Combined + 0.044715 * Combined.^3)));

    H_lat_flat = reshape(permute(H_lat, [3, 1, 2, 4]), [width, lat * lon * numSamples]);
    Y_flat = proj_w * H_lat_flat; 
    
    Y_pred = reshape(Y_flat, [lat, lon, 1, numSamples]);
end
