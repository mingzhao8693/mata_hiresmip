% Example MATLAB Code to Compute Canadian Fire Weather Index (FWI)
% Ensure you have temperature (T), relative humidity (RH), wind speed (WS), and precipitation (P) data
% Downloaded from ERA5.

% Assuming ERA5 data is loaded into variables: T (Temperature in Celsius),
% RH (Relative Humidity in %), WS (Wind Speed in km/h), and P (Precipitation in mm)

% Sample input data for demonstration (replace with ERA5 data)
T = 25;        % Temperature in Celsius
RH = 40;       % Relative Humidity in percentage
WS = 15;       % Wind Speed in km/h
P = 0.5;       % Precipitation in mm

% Constants for FWI calculation
alpha = 0.1;   % A constant for fuel moisture model (can vary)
beta = 0.5;    % Wind factor in ISI
gamma = 0.5;   % Temperature and humidity factor in BUI

% Step 1: Calculate the Initial Spread Index (ISI)
% ISI = Wind * (e^(0.035 * Temperature)) * (1 - RH/100)
% Adjust based on specific FWI equations

ISI = WS * exp(0.035 * T) * (1 - RH / 100);

% Step 2: Calculate the Build-Up Index (BUI)
% BUI = (0.1 * Temperature + 0.4 * RH) * exp(-0.002 * P)
% Again, this may vary slightly based on your specific needs

BUI = (0.1 * T + 0.4 * RH) * exp(-0.002 * P);

% Step 3: Calculate Fire Weather Index (FWI)
% FWI = ISI * BUI * alpha + beta

FWI = ISI * BUI * alpha + beta;

% Display the computed FWI
disp(['The computed Fire Weather Index (FWI) is: ', num2str(FWI)])

% Visualization (Optional)
figure;
bar(FWI);
title('Fire Weather Index (FWI)');
ylabel('FWI');
xlabel('Time Period');
