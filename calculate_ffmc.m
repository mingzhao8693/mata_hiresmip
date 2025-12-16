function FFMC_current = calculate_ffmc(FFMC_prev, T, H, W, R)
% CALCULATE_FFMC - Computes the Fine Fuel Moisture Code (FFMC)
%
% This function is based on the official equations from the CFFWI System.
%
% INPUTS:
%   FFMC_prev (double): FFMC value from the previous day.
%   T (double): Temperature at noon (°C).
%   H (double): Relative Humidity at noon (%).
%   W (double): Wind Speed at noon (km/h).
%   R (double): 24-hour Rainfall (mm).
%
% OUTPUT:
%   FFMC_current (double): Calculated FFMC for the current day.

    % 1. CONVERT FFMC TO MOISTURE CONTENT (M)
    % M is the moisture content (in %) corresponding to the previous FFMC.
    if FFMC_prev < 101
        M_prev = 147.2 * (101.0 - FFMC_prev) / (59.5 + FFMC_prev);
    else
        M_prev = 0.0; % Should not happen if FFMC is constrained
    end
    
    % 2. EFFECT OF RAINFALL (Rainfall Reduction Factor)
    
    % Only rainfall exceeding 0.5 mm is considered effective.
    if R > 0.5
        R_eff = R - 0.5;
        
        % Rain addition factor
        b = 100.0 * R_eff * exp(-0.5 * M_prev / 42.5);
        
        % New moisture content after rain (M_r)
        M_r = M_prev + b;
        
        % Constrain M_r (cannot exceed 250% moisture)
        M_r = min(M_r, 250.0);
        
        % Convert M_r back to a temporary FFMC (FFMC_r)
        FFMC_r = 101.0 - (59.5 * M_r) / (147.2 + M_r);
        
    else
        % If R <= 0.5 mm, no change due to rain
        M_r = M_prev;
        FFMC_r = FFMC_prev;
    end
    
    % Ensure FFMC_r is constrained for next steps
    FFMC_r = max(0.0, FFMC_r);
    FFMC_r = min(100.0, FFMC_r); % Should only happen if input FFMC_prev was > 100
    
    
    % 3. DRYING AND WETTING CALCULATIONS
    
    % Check if the air is drier or wetter than the fuel (FFMC_r)
    
    % Calculate the equivalent moisture content for the temporary FFMC_r
    if FFMC_r < 101
        m_r = 147.2 * (101.0 - FFMC_r) / (59.5 + FFMC_r);
    else
        m_r = 0.0; 
    end

    % Calculate the Equilibrium Moisture Content (E) based on T and H
    
    % E_dry (for drying conditions)
    if T < -10.0
        T = -10.0; % Constraint for official CFFWI equations
    end
    
    if H < 100.0
        E_dry = 0.942 * H^0.679 + 11.0 * exp((H - 100.0) / 10.0) + 0.187 * (21.1 - T) * (1.0 - 1.0/exp(0.115 * T));
    else
        E_dry = 0.942 * H^0.679 + 11.0 * exp((H - 100.0) / 10.0) + 0.187 * (21.1 - T) * (1.0 - 1.0/exp(0.115 * T));
    end

    % E_wet (for wetting conditions)
    if H > 100.0
        H = 100.0; % Constraint for official CFFWI equations
    end
    E_wet = 0.618 * H^0.753 + 10.0 * exp((H - 100.0) / 10.0) + 0.187 * (21.1 - T) * (1.0 - 1.0/exp(0.115 * T));


    % Determine if drying or wetting (A is the hourly rate factor)
    if m_r > E_dry && T > -1.1 % Drying condition
        % Calculate the drying factor (k0)
        k0 = 0.424 * (1.0 - ((100.0 - H) / 100.0)^1.7) + 0.0694 * sqrt(W) * (1.0 - ((100.0 - H) / 100.0)^8);
        A = k0 * 8.52 * exp(-0.115 * T);
        
        % Calculate new moisture content (m_new)
        m_new = E_dry + (m_r - E_dry) * 10^(-A);
        
    elseif m_r < E_wet % Wetting condition
        % Calculate the wetting factor (k0)
        k0 = 0.424 * (1.0 - (H / 100.0)^1.7) + 0.0694 * sqrt(W) * (1.0 - (H / 100.0)^8);
        A = k0 * 8.52 * exp(-0.115 * T);
        
        % Calculate new moisture content (m_new)
        m_new = E_wet - (E_wet - m_r) * 10^(-A);
        
    else % Neutral condition (m_r is between E_dry and E_wet or T <= -1.1)
        m_new = m_r;
    end
    
    % 4. CONVERT FINAL MOISTURE CONTENT BACK TO FFMC
    
    % Ensure moisture content is non-negative
    m_new = max(0.0, m_new); 
    
    FFMC_current = 101.0 - (59.5 * m_new) / (147.2 + m_new);
    
    % Constraint the final FFMC value
    FFMC_current = min(100.0, FFMC_current);
    FFMC_current = max(0.0, FFMC_current);
    
end
