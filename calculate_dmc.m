function DMC_current = calculate_dmc(DMC_prev, T, H, R, LATITUDE)
    % 1. Rain Effect
    % If there is rain (R > 1.5mm), the rain must be adjusted by the previous DMC.
    if R > 1.5 
        % Effective Rain (Re) calculation
        R = R - 1.5; % Only rain above 1.5mm is considered effective
        
        % Formula for a0, the effective duff moisture content
        % based on the previous DMC (P_prev)
        a0 = 244.72 + 101.4 * exp(-0.021 * DMC_prev);
        
        % Rain reduction based on a0
        a = R / a0;
        
        % Current moisture content (M) before drying
        M_prev = 20.0 + exp(5.6348 - DMC_prev / 43.43); 
        
        % New moisture content after rain (M_r)
        M_r = M_prev + 4.8 * exp(-0.0065 * M_prev) * (1.0 - exp(-0.02 * R));
        
        % New DMC (P_r) based on M_r
        DMC_current = 244.72 - 43.43 * log(M_r - 20.0);
        
    else % No effective rain
        DMC_current = DMC_prev;
    end
    
    % 2. Season/Day Length Adjustment (L)
    % Adjustment factor based on LATITUDE and month (which must be passed in). 
    % L is typically 1.6 for Jan-Apr, 0.9 for May, etc.
    % Assuming a generic summer day length factor for this conceptual example:
    L = day_length_factor(LATITUDE, 7); % 7 for July (or substitute your month)
    
    % 3. Drying Rate (K)
    % The drying potential K is based on the temperature (T) and the day length factor (L).
    K = 1.894 * (T + 1.1) * (100.0 - H) * L * 0.0001;
    
    % 4. Final DMC Calculation
    % This is the final iterative step:
    DMC_current = DMC_current + K;
    
    % Ensure DMC is not negative
    DMC_current = max(0, DMC_current);

end
