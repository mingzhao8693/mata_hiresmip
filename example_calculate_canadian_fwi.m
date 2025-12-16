% --- 1. Define Constants ---
% Latitude constant (e.g., 45 degrees N for spring/summer calculation)
% Adjust based on season/location for DMC/DC calculation
LATITUDE = 45; 
HOURLY_TEMP_ADJ = 0; % Adjustment for daily average temperature to noon
% Initial values (start after a long-duration rain event, or use standard defaults)
FFMC_prev = 85.0; % Fine Fuel Moisture Code (previous day)
DMC_prev = 6.0;   % Duff Moisture Code (previous day)
DC_prev = 15.0;   % Drought Code (previous day)

% --- 2. Input Data (Example Daily Data) ---
% Columns: [Day, Temp (°C), RH (%), Wind (km/h), Rain (mm)]
% Use a 2D array or load from a file
WeatherData = [
    1, 20.0, 50, 15, 0.0; 
    2, 22.0, 40, 20, 0.0; 
    3, 25.0, 30, 25, 5.0; % Day with rain
    4, 18.0, 60, 10, 0.0;
];

% --- 3. Output Initialization ---
% Pre-allocate arrays for results
numDays = size(WeatherData, 1);
FFMC_out = zeros(numDays, 1);
DMC_out = zeros(numDays, 1);
DC_out = zeros(numDays, 1);
ISI_out = zeros(numDays, 1);
BUI_out = zeros(numDays, 1);
FWI_out = zeros(numDays, 1);

for i = 1:numDays
    T = WeatherData(i, 2);  % Temperature
    H = WeatherData(i, 3);  % Relative Humidity
    W = WeatherData(i, 4);  % Wind Speed
    R = WeatherData(i, 5);  % Rainfall

    % --- A. Moisture Codes (The 'Memory' Components) ---
    FFMC_current = calculate_ffmc(FFMC_prev, T, H, W, R);
    DMC_current = calculate_dmc(DMC_prev, T, H, R, LATITUDE);
    DC_current = calculate_dc(DC_prev, T, R, LATITUDE);

    % --- B. Derived Indices ---
    BUI_current = calculate_bui(DMC_current, DC_current);
    ISI_current = calculate_isi(FFMC_current, W);

    % --- C. Final Index ---
    FWI_current = calculate_fwi(ISI_current, BUI_current);

    % --- D. Store and Update ---
    FFMC_out(i) = FFMC_current;
    DMC_out(i) = DMC_current;
    DC_out(i) = DC_current;
    ISI_out(i) = ISI_current;
    BUI_out(i) = BUI_current;
    FWI_out(i) = FWI_current;

    % Update previous values for the next day's calculation
    FFMC_prev = FFMC_current;
    DMC_prev = DMC_current;
    DC_prev = DC_current;
end
