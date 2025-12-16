function PET = pet_penman_monteith(T, RH, u2, Rn, G, elev)
% T    - air temperature (°C)
% RH   - relative humidity (%)
% u2   - wind speed at 2 m (m/s)
% Rn   - net radiation (MJ/m²/day)
% G    - soil heat flux (MJ/m²/day)
% elev - elevation (m)
% Penman–Monteith Potential Evapo-Transpiration (PET) (mm/day)
% PET/86400*LV0 gives the value in unit of W/m2
  
% Saturation vapor pressure (kPa)
es = 0.6108 * exp(17.27 * T ./ (T + 237.3));

% Actual vapor pressure (kPa)
ea = es .* (RH/100);

% Slope of vapor pressure curve (kPa/°C)
Delta = 4098 * es ./ (T + 237.3).^2;

% Psychrometric constant (kPa/°C)
P = 101.3 * ((293 - 0.0065 * elev) / 293).^5.26;   % air pressure
gamma = 0.000665 * P; gamma=0;

% Penman–Monteith ET0 (mm/day)
PET = (0.408 * Delta .* (Rn - G) + ...
      gamma .* (900./(T + 273)) .* u2 .* (es - ea)) ./ ...
      (Delta + gamma .* (1 + 0.34 .* u2));

return

%a=86400/1000000; %change unit from J/m2/s to MJ/m2/day
%T=30; RH=50; u2=10; elev=10;
%Rn=200*a;
%G =0  *a;
%PET = pet_penman_monteith(T, RH, u2, Rn, G, elev)
%PET = PET/86400*LV0

%PET = 0.408 .* (Rn - G)
%PET = PET/86400*LV0
