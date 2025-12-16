
% === Full example for statistical FWI estimation using ERA5 ===

% --- 1. Load ERA5 data (NetCDF files) ---
% Modify these paths to your downloaded ERA5 files

nc_temp = 'ERA5_daily_2m_temperature.nc';        % Kelvin
nc_spfh = 'ERA5_daily_2m_specific_humidity.nc';  % kg/kg
nc_pres = 'ERA5_daily_surface_pressure.nc';      % Pa
nc_wind = 'ERA5_daily_10m_wind_speed.nc';        % m/s
nc_precip = 'ERA5_daily_total_precipitation.nc'; % meters (total daily)
nc_fwi = 'ERA5_daily_FWI.nc';                     % ERA5 FWI variable (dimension must match)

% --- 2. Read variables ---
T_K = ncread(nc_temp, 't2m');          % [Kelvin]
q = ncread(nc_spfh, 'q');              % specific humidity [kg/kg]
p = ncread(nc_pres, 'sp');             % surface pressure [Pa]
W_ms = ncread(nc_wind, 'u10');         % 10m wind speed [m/s] (use u and v if available for speed)
precip_m = ncread(nc_precip, 'tp');   % total precipitation [meters]
FWI_obs = ncread(nc_fwi, 'fwi');      % observed FWI from ERA5 (if available)

% --- 3. Convert units and calculate RH ---
T = T_K - 273.15;                     % °C
W = W_ms * 3.6;                       % km/h (m/s to km/h)
P = precip_m * 1000;                  % mm

% Saturation vapor pressure (Tetens formula, in hPa)
es = 6.112 * exp(17.67 * T ./ (T + 243.5));

% Actual vapor pressure (hPa)
e = (q .* p) / 0.622 / 100;  % convert Pa to hPa by dividing by 100

RH = 100 * (e ./ es);
RH(RH > 100) = 100;  % constrain to 100%
RH(RH < 0) = 0;

% --- 4. Prepare data vectors ---
% Flatten variables if multi-dimensions (e.g., time x lat x lon)
% Here we assume time dimension only, modify if needed
T_vec = double(T(:));
RH_vec = double(RH(:));
W_vec = double(W(:));
P_vec = double(P(:));
FWI_vec = double(FWI_obs(:));

% Remove NaNs or missing values
valid = ~isnan(T_vec) & ~isnan(RH_vec) & ~isnan(W_vec) & ~isnan(P_vec) & ~isnan(FWI_vec);
T_vec = T_vec(valid);
RH_vec = RH_vec(valid);
W_vec = W_vec(valid);
P_vec = P_vec(valid);
FWI_vec = FWI_vec(valid);

% --- 5. Fit linear regression model ---
X = [T_vec, RH_vec, W_vec, P_vec];
mdl = fitlm(X, FWI_vec);

% Display coefficients
disp('Regression Coefficients:');
disp(mdl.Coefficients);

% --- 6. Predict FWI and plot ---
FWI_pred = predict(mdl, X);

figure;
scatter(FWI_vec, FWI_pred, 10, 'filled');
xlabel('Observed FWI (ERA5)');
ylabel('Predicted FWI (Regression)');
title('Observed vs. Predicted FWI from ERA5');
grid on;
refline(1,0);

% --- 7. Model evaluation ---
R2 = mdl.Rsquared.Ordinary;
fprintf('R^2 of the regression model: %.3f\n', R2);

% --- End of script ---
