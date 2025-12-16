function FWI = estimate_fwi_regression(T, RH, W, P)
% Estimate Fire Weather Index (FWI) using a statistical log-linear regression model
% Inputs:
%   T  - Temperature in °C (any size array)
%   RH - Relative humidity in % (same size as T)
%   W  - Wind speed at 10m in km/h (same size as T)
%   P  - Precipitation in mm (same size as T)
%
% Output:
%   FWI - Estimated Fire Weather Index (same size as input)

    % Ensure inputs are the same size
    if ~isequal(size(T), size(RH), size(W), size(P))
        error('All input arrays (T, RH, W, P) must have the same size.');
    end

    % Apply transformations
    logW   = log(W + 1);       % log wind
    sqrtP  = sqrt(P + 1);      % sqrt precipitation

    % Example regression coefficients (adjust as needed)
    b0 = -0.8;
    b1 = 0.12;
    b2 = -0.03;
    b3 = 0.7;
    b4 = -0.1;

    % Calculate log(FWI + 1)
    log_FWI = b0 + b1 .* T + b2 .* RH + b3 .* logW + b4 .* sqrtP;

    % Back-transform to FWI
    FWI = exp(log_FWI) - 1;

    % Ensure non-negative FWI
    FWI(FWI < 0) = 0;
end
