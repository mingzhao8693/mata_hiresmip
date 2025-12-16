function Tdp = dewpoint(T, RH)
% T ... dry-bulb temperature (°C)
% RH ... relative humidity (0–1)

a = 17.27;
b = 237.3;

alpha = log(RH) + (a .* T) ./ (T + b);
Tdp = (b .* alpha) ./ (a - alpha);
