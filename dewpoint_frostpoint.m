function [Tdp, Tfp] = dewpoint_frostpoint(T, RH)
% Compute dew-point (Tdp) and frost-point (Tfp) temperatures in °C
% T  ... dry-bulb temperature (°C)
% RH ... relative humidity (0–1)
% Both inputs may be scalars or arrays of identical size.

% ---- Saturation vapor pressure over water (Magnus–Tetens) ----
esw = @(T) 0.61078 .* exp(17.27 .* T ./ (T + 237.3));   % kPa

% ---- Actual vapor pressure ----
e = RH .* esw(T);

% ---- Dew Point (inversion of Magnus–Tetens) ----
a = 17.27;
b = 237.3;
alpha = log(e ./ 0.61078);   % using e = 0.61078*exp(...)
Tdp = (b .* alpha) ./ (a - alpha);

% ---- Saturation vapor pressure over ice (Murphy & Koop 2005) ----
% Accurate from -100°C to 0°C
esi = @(T) exp( 9.550426 - 5723.265 ./ (T + 273.15) ...
                + 3.53068 .* log(T + 273.15) - 0.00728332 .* (T + 273.15) );
% esi returns vapor pressure in Pa → convert to kPa
esi_kPa = @(T) esi(T) ./ 1000;

% ---- Frost Point (solve e = es_ice(Tfp)) ----
% Inverse Murphy–Koop:
log_e = log(e * 1000); % convert kPa to Pa for correct inversion

Tfp = -5733.265 ./ (log_e - 9.550426 - 3.53068.*log(1) + 0.00728332.*(273.15)) ...
      - 273.15;

% The inversion above is an approximation; use iteration for high accuracy:
% (Optional robust solution below)
Tfp0 = Tfp;
for k = 1:10
    f = esi_kPa(Tfp) - e;
    dfdT = (esi_kPa(Tfp + 0.001) - esi_kPa(Tfp)) / 0.001;
    Tfp = Tfp - f ./ dfdT;
end

return
