function Tw = wetbulb_vec(Td, RH, P)
% wetbulb_vec  Vectorized wet-bulb temperature calculation using bisection.
% Td ... dry-bulb temperature (°C)   (scalar or array)
% RH ... relative humidity (0–1)     (same size as Td or scalar)
% P  ... pressure (kPa), optional     (same size or scalar)

if nargin < 3
    P = 101.325;
end

% Expand scalars to match size
Td = Td .* ones(size(Td));
RH = RH .* ones(size(Td));
P  = P  .* ones(size(Td));

% Saturation vapor pressure (Tetens)
es = @(T) 0.61078 .* exp(17.27 .* T ./ (T + 237.3));

% Actual vapor pressure
e = RH .* es(Td);

% Psychrometric constant
A = 0.00066;

% Psychrometric equation residual
f = @(Tw) e - ( es(Tw) - A .* P .* (Td - Tw) );

% ---- Bisection bounds ----
Tlow  = Td - 50;      % guaranteed safe lower bound
Thigh = Td;           % upper bound is dry-bulb temperature

flow  = f(Tlow);
fhigh = f(Thigh);

% Initialize Tw
Tw = (Tlow + Thigh) / 2;

% ---- Vectorized Bisection Loop ----
for iter = 1:200
    Tw  = (Tlow + Thigh) / 2;
    fmid = f(Tw);

    % Boolean mask: where the root is on the low side
    left_mask  = (flow .* fmid < 0);

    % Update intervals
    Thigh(left_mask) = Tw(left_mask);
    fhigh(left_mask) = fmid(left_mask);

    Tlow(~left_mask) = Tw(~left_mask);
    flow(~left_mask) = fmid(~left_mask);

    % Convergence check (vectorized)
    if all(abs(Thigh - Tlow) < 1e-6)
        break;
    end
end
