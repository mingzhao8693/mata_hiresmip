function FWI = estimate_fwi_stat(T, RH, W, P)
    % Estimate Fire Weather Index (FWI) using a linear regression model
    % T  = daily mean temperature (°C)
    % RH = daily mean relative humidity (%)
    % W  = daily mean wind speed (km/h at 10 m)
    % P  = daily total precipitation (mm)

    % Example regression coefficients (from hypothetical or literature-based fit)
    a0 = -1.0;   % intercept
    a1 = 0.25;   % temperature
    a2 = -0.2;   % relative humidity
    a3 = 0.35;   % wind speed
    a4 = -0.15;  % precipitation

    % Linear regression formula
    FWI_raw = a0 + a1 * T + a2 * RH + a3 * W + a4 * P;

    % Post-process to ensure non-negative output
    FWI = max(FWI_raw, 0);
end
