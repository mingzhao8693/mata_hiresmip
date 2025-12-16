function [Le, Lf] = day_length_factor(month, latitude)
% DAY_LENGTH_FACTOR - Returns the Day Length Factors for DMC (Le) and DC (Lf).
%
% This function applies the empirical monthly factors based on the Canadian 
% Forest Fire Weather Index (CFFWI) System manual. Note that the standard 
% factors provided are for specific latitude ranges.
%
% INPUTS:
%   month (int): Current month (1 = Jan, 12 = Dec).
%   latitude (double): Latitude in degrees (e.g., 45). Not used for standard 
%                      factors, but can be used for more detailed calculation.
%
% OUTPUTS:
%   Le (double): Effective day length factor for the Duff Moisture Code (DMC).
%   Lf (double): Day length factor for the Drought Code (DC).

    % --- 1. Duff Moisture Code (DMC) Day Length Factor (Le) ---
    % Standard factors (Le) for mid-latitude (e.g., 46°N)
    % Represents the effective number of daylight hours.
    DMC_Le_Factors = [
        6.5, 7.5, 9.0, 12.8, 13.9, 13.9, 12.4, 10.9, 9.4, 8.0, 7.0, 6.0
    ];
    
    % NOTE on latitude: The standard Le values above are based on 
    % ~46°N latitude. The FWI documentation provides three sets of factors 
    % for different latitude bands (e.g., Northern, Mid-Latitudes, Southern).
    % A more robust model would select the array based on the 'latitude' input.
    % We will use the standard array for this example.

    % --- 2. Drought Code (DC) Day Length Factor (Lf) ---
    % Standard factors (Lf) for mid-latitude (e.g., 46°N)
    % Represents the adjustment factor in the DC's potential evapotranspiration.
    DC_Lf_Factors = [
        -1.6, -1.6, -1.6, 0.9, 3.8, 5.8, 6.4, 5.0, 2.4, 0.4, -1.6, -1.6
    ];

    % --- 3. Return Values ---
    % Check for valid month input
    if month < 1 || month > 12
        error('Month input must be an integer between 1 and 12.');
    end
    
    % MATLAB arrays are 1-indexed, so the month directly corresponds to the index.
    Le = DMC_Le_Factors(month);
    Lf = DC_Lf_Factors(month);
    
end
