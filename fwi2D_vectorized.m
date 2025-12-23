function vars = fwi2D_vectorized(months, Tm, H, r, W, lat_array, what, init_pars, spin_up)
%FWI2D_VECTORIZED Canadian Fire Weather Index for 2D Spatial Grid
%
%   out = FWI2D_VECTORIZED(months, Tm, H, r, W, lat_array, what, init_pars, spin_up)
%   computes the FWI system simultaneously across an M x L latitude-longitude grid.
%
%   INPUTS: (All are N x M x L arrays unless noted)
%       months     : N x M x L array, month of each record (or N x 1 if constant across grid)
%       Tm         : N x M x L array, temperature (°C)
%       H          : N x M x L array, relative humidity (%)
%       r          : N x M x L array, 24-hr precipitation (mm)
%       W          : N x M x L array, wind speed (km/h)
%       lat_array  : M x L array, latitude in degrees for each grid cell.
%       ... (other optional inputs remain)

%% ---------------------- INPUT & DIMENSION SETUP ------------------------

% Assuming inputs are N x M x L.
[N, M, L] = size(Tm);
grid_size = [M, L];
n = N; % Total days for original output size

% --- Default and Validation (Simplified for focus on vectorization) ---
if nargin < 6 || isempty(lat_array), lat_array = repmat(46, grid_size); end
if nargin < 7 || isempty(what), what = "FWI"; end
if nargin < 8 || isempty(init_pars), init_pars = [85 6 15]; end
if nargin < 9 || isempty(spin_up), spin_up = 0; end

% --- Missing Data Handling is skipped for simplicity but must be handled carefully in 3D ---

% --- Physical Correction (Element-wise applied to the 3D arrays) ---
H(H > 100) = 100;
H(H < 0) = 0;
r(r < 0) = 0;
W(W < 0) = 0;

%% ---------------------- LATITUDE FACTORS (2D Grid) ---------------------

% Both factors are essential for accurately modeling the seasonal variation in drying intensity across
% different latitudes in Canada, ensuring that the codes reflect the reality that summer days have a much
% greater drying power than winter days, even if the noon temperature is the same.
% Feature	   Le (DMC Daylength Factor)	                Lf (DC Daylength Factor)
% Component	   Duff Moisture Code (DMC)                     Drought Code (DC)
% Layer Time Lag   Medium (≈12 days)	                        Long (≈52 days)
% Formula Use	   Multiplies the drying constant (K).          Adds to the drying factor (V).
% Input Dependence Scales drying driven by Temperature and RH	Scales drying driven primarily by Temperature

% NOTE: The original code used a scalar 'lat' and 'findInterval'.
% For a 2D grid, you must iterate over the grid or use matrix indexing to
% assign the correct Le and dlf based on lat_array.

% Map the M x L latitude array to M x L arrays of Le_index and Dlf_index (1 to 5)
ref_lats=[-90 -30 -10 10 30 90]; size(lat_array)
loc_array = findInterval_2D(lat_array, ref_lats); % (Assumed helper function)

% Define the monthly factor tables (as in the original code)
Le_table = [11.5 10.5 9.2 7.9 6.8 6.2 6.5 7.4 8.7 10.0 11.2 11.8; ...
            10.1 9.6 9.1 8.5 8.1 7.8 7.9 8.3 8.9 9.4 9.9 10.2; ...
            repmat(9,1,12); ...
            7.9 8.4 8.9 9.5 9.9 10.2 10.1 9.7 9.1 8.6 8.1 7.8; ...
            6.5 7.5 9.0 12.8 13.9 13.9 12.4 10.9 9.4 8.0 7.0 6.0];
        
Dlf_table = [6.4 5.0 2.4 0.4 -1.6 -1.6 -1.6 -1.6 -1.6 0.9 3.8 5.8; ...
             6.4 5.0 2.4 0.4 -1.6 -1.6 -1.6 -1.6 -1.6 0.9 3.8 5.8; ...
             repmat(1.4,1,12); ...
             -1.6 -1.6 -1.6 0.9 3.8 5.8 6.4 5.0 2.4 0.4 -1.6 -1.6; ...
             -1.6 -1.6 -1.6 0.9 3.8 5.8 6.4 5.0 2.4 0.4 -1.6 -1.6];

% Create N x M x L arrays of Le and dlf, indexed by month (months(i,j,k)) and loc (loc_array(j,k))
% This is the most complex step, often done using matrix expansion or interpolation.
% Simplification: Assume 'months' is N x 1, constant across the grid, and we extract one M x L slice per day.

% Pre-calculate Le_full and Dlf_full (N x M x L) using the month and location index
Le_full = NaN(N, M, L);
Dlf_full = NaN(N, M, L);
for i = 1:N
    % Get the month for the current day
    current_month = months(i, 1);
    
    for j = 1:M
        for k = 1:L
            lat_loc = loc_array(j, k);
            Le_full(i, j, k) = Le_table(lat_loc, current_month);
            Dlf_full(i, j, k) = Dlf_table(lat_loc, current_month);
        end
    end
end
n2 = N; % Renamed N to n2 for consistency

%% ---------------------- INITIALIZATION (3D) --------------------------

% FWI components are N+1 x M x L to store initial conditions (index 1)
f0 = NaN(N + 1, M, L);
p0 = NaN(N + 1, M, L);
d0 = NaN(N + 1, M, L);

% Initial values replicated across the M x L grid (Day 0)
f0(1, :, :) = repmat(init_pars(1), grid_size);
p0(1, :, :) = repmat(init_pars(2), grid_size);
d0(1, :, :) = repmat(init_pars(3), grid_size);

% Indices (N x M x L)
ISI = NaN(N, M, L);
BUI = NaN(N, M, L);
FWI = NaN(N, M, L);

%% ---------------------- MAIN TIME LOOP (Spatial Vectorization) ---------------------

for i = 1:n2

% ----- FFMC (Fine Fuel Moisture Code) Moisture Model -----
%f0 is FFMC, m0 is fuel moisture content;
%High FFMC (e.g., 90-100): Corresponds to very low moisture content (M≈2−7%).
%Physically, this means the fuels are nearly "oven dry."
%Low FFMC (e.g., below 80): Corresponds to high moisture content (M>10%).
%Physically, the fuels are damp and resist combustion.
%The FFMC has a short time lag (memory) of about one day because fine fuels
%quickly respond to changes in temperature, relative humidity, and wind.
%Physical Process: Unlike the Drought Code (DC), which tracks deep soil moisture
%over weeks, the FFMC tracks surface fuels that can dry out rapidly in just a few
%hours of sunshine and low humidity, or become damp again overnight.
%Daily Interpretation: The FFMC value calculated for today reflects the cumulative
%effect of the last 24 hours of weather on the top layer of fuel.     

% Extract current day's data (M x L matrices)
    Tm_i = squeeze(Tm(i, :, :));
    H_i  = squeeze(H(i, :, :));
    r_i  = squeeze(r(i, :, :));
    W_i  = squeeze(W(i, :, :));
    Le_i = squeeze(Le_full(i, :, :));
    Dlf_i = squeeze(Dlf_full(i, :, :));
    
    f0_i = squeeze(f0(i, :, :));
    p0_i = squeeze(p0(i, :, :));
    d0_i = squeeze(d0(i, :, :));

% ----- FFMC (Fine Fuel Moisture Code) Vectorized -----

    m0 = (147.2 .* (101 - f0_i)) ./ (59.5 + f0_i);
    
    % Rain effect using logical indexing over the M x L grid
    idx_rain = r_i > 0.5;
    if any(idx_rain(:)) % Check if rain occurred anywhere
        rA = r_i(idx_rain) - 0.5;
        m0_rain = m0(idx_rain);
        
        % Vectorized conditional calculation for m0 <= 150 vs m0 > 150
        idx_low_m = m0_rain <= 150;
        
        exp_term = exp(-100 ./ (251 - m0_rain)) .* (1 - exp(-6.93 ./ rA));
        mr = m0_rain + 42.5 .* rA .* exp_term;
        
        % Add extra term for points where m0 > 150
        mr(~idx_low_m) = mr(~idx_low_m) + (0.0015 .* (m0_rain(~idx_low_m) - 150).^2 .* sqrt(rA(~idx_low_m)));

        m0(idx_rain) = miz_setmax(mr, 250);
    end
    
% The Role of Equilibrium Moisture Content (E) and FFMC calculation
% In the FFMC calculation, there are actually two separate calculated values for E Ewet and E_dry
% E_wet (Wetting Equilibrium): This is the higher moisture content limit the fuel will reach under wetting conditions (high H)
% E_dry (Drying  Equilibrium): This is the lower  moisture content limit the fuel will reach under drying conditions  (low H)
% This distinction is based on the phenomenon of hysteresis, which means that fuels do not absorb and release moisture at
% exactly the same rate or equilibrium point.
% Determining the Condition:The FFMC calculation determines the condition by comparing the current fuel moisture (m0)
% against these two calculated equilibrium points: E_dry > E_wet
% Drying  m0 > E_dry FFMC decrease towards this larger value (E_dry)
% Wetting m0 < E_wet FFMC increase towards this smaller value (E_wet)
% Neutral E_dry <= m0 <= E_wet FFMC remains mostly unchanged (very slow change)
% Drying/Wetting (All M x L points calculated simultaneously)

    Ed = 0.942 .* H_i.^0.679 + 11 .* exp((H_i - 100) ./ 10) + 0.18 .* (21.1 - Tm_i) .* (1 - exp(-0.115 .* H_i));
    Ew = 0.618 .* H_i.^0.753 + 10 .* exp((H_i - 100) ./ 10) + 0.18 .* (21.1 - Tm_i) .* (1 - exp(-0.115 .* H_i));
    
    m = m0; % Start with m0
    
    % Drying (m0 > Ed)
    idx_dry = m0 > Ed;
    k0 = 0.424.*(1 - (H_i(idx_dry)./100).^1.7) + 0.0694.*sqrt(W_i(idx_dry)).*(1 - (H_i(idx_dry)./100).^8);
    kd = k0 .* 0.581 .* exp(0.0365 .* Tm_i(idx_dry));
    m(idx_dry) = Ed(idx_dry) + (m0(idx_dry) - Ed(idx_dry)) .* 10.^(-kd);

    % Wetting (m0 < Ew)
    idx_wet = m0 < Ew;
    k1 = 0.424.*(1 - ((100-H_i(idx_wet))./100).^1.7) + 0.0694.*sqrt(W_i(idx_wet)).*(1 - ((100-H_i(idx_wet))./100).^8);
    kw = k1 .* 0.581 .* exp(0.0365 .* Tm_i(idx_wet));
    m(idx_wet) = Ew(idx_wet) - (Ew(idx_wet) - m0(idx_wet)) .* 10.^(-kw);

    m = miz_setmin(m, 0);
    f0(i+1, :, :) = 59.5 .* (250 - m) ./ (147.2 + m);

% ----- DMC (Duff Moisture Code) Vectorized -----
% The Duff Moisture Code (DMC) is the second of the three moisture codes in the Canadian Forest Fire Weather
% Index (FWI) System. It is a numeric rating of the average moisture content of loosely compacted organic
% layers of moderate depth (the duff layer, typically 5-10 cm deep).
% The computation for the DMC is a two-stage, daily bookkeeping process that involves complex non-linear
% equations for both a wetting phase (when it rains) and a drying phase (when it doesn't). It requires the
% following daily inputs taken at Noon local standard time (LST), plus the DMC value from the previous day
% (DMC(t−1), Temperature (T in C), Relative Humidity (RH in %), and 24-hour Accumulated Precipitation (P in mm).
% Daylength Factor (Le), which varies by month and latitude.
% The DMC has a time lag of about 12 days, meaning it responds more slowly to weather changes than the
% Fine Fuel Moisture Code (FFMC), but much faster than the long-term Drought Code (DC).
% Below K is drying Constant (Note: If T<−1.1C, T is set to −1.1C to prevent a negative drying constant,
% as drying is minimal at very cold temperatures.
% The DMC is a unitless index, but its calculation requires converting the previous day's index DMC(t−1) back
% into an equivalent gravimetric Duff Moisture Content M(t−1) in %, i.e., M(t−1)=20+e^(5.6348−DMC(t-1))/43.43
% The new moisture content after rainfall (M(t) is determined by adding the effective rainfall to the previous
% moisture content, adjusting for the Duff's saturation properties using an intermediate variable, b (a slope
% factor that accounts for non-linear absorption), formulation of b depend of DMC value
% Below p0(1) is the inital DMC and M0 is the inital equivalent gravimetric Duff Moisture Content
% Mr is the current equivalent gravimetric Duff Moisture Content: M(t)=M(t-1)+1000*Re/(48.77+b*re)
% the calculaiton is only performed if r>1.5mm, the effective rainfall re=0.92*r-1.27
% If rain occurred, the new moisture content is converted back into an index value DMC(t)=244.72−43.43*ln(M(t)−20)
% If no rain occurred, the value from previous time-step is used i.e., DMC(t)=DMC(t−1)
% The final step for computing DMC is to apply Drying Effect, The drying effect, which represents moisture loss
% due to temperature and relative humidity, is applied to the index value. The change in the DMC due to drying (ΔDMC)
% is calculated using the noon observations and the daylength factor (Le), which adjusts the drying rate for seasonal
% variations in solar radiation.
% the Final DMC for the Day DMC(t) is calculated by adding the drying effect (converted back to an index change) to
% the value from the wetting phase

    Ti = miz_setmin(Tm_i, -1.1);
    K = 1.894 .* (Ti + 1.1) .* (100 - H_i) .* Le_i .* 1e-06;
    
    p0_new = p0_i + 100 .* K; % Default (no rain) or part of rain calcs

    idx_rain_dmc = r_i > 1.5;
    if any(idx_rain_dmc(:))
        p0_rain = p0_i(idx_rain_dmc);
        r_rain = r_i(idx_rain_dmc);
        K_rain = K(idx_rain_dmc);

        re = 0.92 .* r_rain - 1.27;
        M0 = 20 + exp(5.6348 - p0_rain ./ 43.43);

        % Vectorized conditional calculation for 'b' (slope factor)
        b = zeros(size(p0_rain));
        
        idx_b1 = p0_rain <= 33;
        idx_b2 = p0_rain > 65;
        idx_b3 = ~(idx_b1 | idx_b2); % The middle case
        
        b(idx_b1) = 100 ./ (0.5 + 0.3 .* p0_rain(idx_b1));
        b(idx_b2) = 6.2 .* log(p0_rain(idx_b2)) - 17.2;
        b(idx_b3) = 14 - 1.3 .* log(p0_rain(idx_b3));

        Mr = M0 + (1000 .* re) ./ (48.77 + b .* re);
        pr = 244.72 - 43.43 .* log(Mr - 20);
        pr = miz_setmin(pr, 0);
        
        p0_new(idx_rain_dmc) = pr + 100 .* K_rain;
    end
    p0(i+1, :, :) = p0_new;

% ----- DC (Drought Code) Vectorized -----
% Calculation of Drought Code: %he Drought Code (DC) is the third and final fuel moisture code in the Canadian Forest
% Fire Weather Index (FWI) System. It is a numeric rating of the average moisture content of deep, compact organic
% layers (like peat or thick duff, 10-20 cm deep).￼
% The DC has a long time lag (approximately 52 days), making it an indicator of seasonal drought effects and the
% potential for deep smoldering in heavy fuels and large logs. Unlike the other codes, its calculation is based on a
% simplified water balance model, where a conceptual soil layer of 200 mm water capacity dries at a rate proportional
% to its current moisture content and the atmospheric demand.
% Below d0 is DC code
% Daily Calculation of the Drought Code: The DC is a daily bookkeeping system that tracks water loss due to evaporation
% and water gain due to effective rainfall. It uses daily observations of noon temperature (T in C) and 24-hour accumulated
% precipitation (P in mm), along with the previous day's DC value DC(t−1).
%The calculation proceeds in two main phases:￼
% Phase 1: The first step is to calculate the potential moisture loss (evaporation) from the conceptual soil column.	
% Calculate the Temperature-Dependent Drying Factor: The drying rate is proportional to the noon temperature, adjusted
% by a daylength factor (Lf) that varies by month and latitude to account for the seasonal influence of solar radiation.
% V=0.36(T+2.8)+Lf and ΔDCdry= =0.5⋅V
% Phase 2: Wetting Calculation (Rainfall), This phase determines the net effect of any precipitation.
% Check for Effective Rainfall (Pd): Rainfall less than 2.8 mm is considered ineffective, as it is assumed to be
% intercepted or absorbed by the layers above the deep duff.￼If the total 24-hour precipitation (P) is greater than 2.8 mm,
% the effective rainfall (Pd) is calculated: Pd =0.83⋅P−1.27 for P>2.8 mm If P≤2.8 mm, then Pd=0.
% Convert Previous DC to Moisture Equivalent Q(t−1):
% The DC index is first converted into its equivalent Moisture Content (Q), which represents the remaining water storage
% depth in the conceptual 200 mm soil column (expressed in units of 0.01 inches for the original formula, or 0.254 mm):
% Q(t−1)=800⋅exp(−(DC(t−1)/400))
% Calculate New Moisture Equivalent After Rain, the effective rainfall is added to the previous moisture equivalent.
% The factor 3.937 converts the effective rainfall from mm to the Q units:￼Q(t)=Q(t−1)+3.937⋅Pd
% Convert Moisture Equivalent Back to DC Index DC(t)=400*ln(800/Q(t))
% The final daily DC value DC(t) is obtained by applying the drying factor to the value resulting from the wetting
% calculation (if rain occurred) or the previous day's value (if no rain occurred):
% DC(t)=DC(t-1)+ΔDC_dry or, combining all terms:
% DC(t)=DC(t)  +0.5V if P> 2.8mm
% DC(t)=DC(t-1)+0.5V if P<=2.8mm 
% The DC starts its seasonal calculation when snow cover has left the area, typically with a default initial value of 15.

    %Ti2 = max(Tm_i, -2.8);
    Ti2 = miz_setmin(Tm_i, -2.8);
    v = 0.36 .* (Ti2 + 2.8) + Dlf_i; 
    %v = max(v, 0);
    v = miz_setmin(v, 0);
    
    d0_new = d0_i + 0.5 .* v; % Default (no rain)

    idx_rain_dc = r_i > 2.8;
    if any(idx_rain_dc(:))
        d0_rain = d0_i(idx_rain_dc);
        r_rain = r_i(idx_rain_dc);
        v_rain = v(idx_rain_dc);
        
        rd = 0.83 .* r_rain - 1.27;
        q0 = 800 .* exp(-d0_rain ./ 400);
        qr = q0 + 3.937 .* rd;
        dr = 400 .* log(800 ./ qr);
        dr = miz_setmin(dr, 0);
        
        d0_new(idx_rain_dc) = dr + 0.5 .* v_rain;
    end
    d0(i+1, :, :) = d0_new;

% --- Fire Behavior Indices (Fully Vectorized across M x L grid) ---

% ----- ISI -----
% The Initial Spread Index (ISI) is the first of the three fire behavior indices in the Canadian Forest Fire Weather Index (FWI)
% System. It is a numeric rating of the expected rate of fire spread without the influence of the amount of fuel available.￼
% The calculation of the ISI is a multiplication of two distinct functions that account for the two primary drivers of initial
% fire spread: fine fuel flammability and wind speed.￼ISI=0.208⋅f(W)⋅f(F) Where f(W) is the Wind Function. f(F) is the Fine Fuel
% Moisture Function.￼The value 0.208 is a scaling constant used to calibrate the ISI with actual fire spread rates in a
% standardized pine fuel type.
% The Fine Fuel Moisture Function f(m), is then calculated using the moisture content (m), not FFMC:￼
% f(F)=91.9⋅exp (−0.1386*m)*(1 + m^5.31/(4.93*10^7))
% This function is a non-linear expression that drops rapidly as the moisture content (m) increases (i.e., as FFMC decreases).
% This captures the fact that a small increase in moisture in already dry fine fuels significantly reduces the rate of spread.
% Calculate the Wind Function f(W). This function relates the 10-meter wind speed W to the rate of spread f(W) = e^{(0.05039 W)
% This is an exponential function, reflecting that the rate of fire spread increases very rapidly, or exponentially, as wind
% speed increases. Even small increases in wind speed can dramatically boost the ISI.
% ISI Values and Fire Danger Classes
% The ISI values rise as the potential for rapid fire spread increases. While the ISI itself is unitless, it is a key component
% in determining the final Fire Weather Index (FWI) and the overall danger rating.

% Fire Danger Class	ISI Range	Interpretation
% Low           	0 to 1.9	Very slow spread, fires unlikely to ignite and sustain.
% Moderate      	2.0 to 4.9	Moderate spread possible, particularly in open, dry fuels on windy days.
% High	                5.0 to 8.9	Fires spread easily and rapidly; control may be difficult unless fires are attacked while small.
% Very High     	9.0 to 17.9	Fires start easily, spread very rapidly, and quickly increase in intensity. 10 is a critical threshold.
% Extreme	        ≥18.0	        Fires spread furiously and burn intensely. Direct attack is rarely possible.
% Wind speed Details used:
% Height: 10 meters (10 m)
% Measurement: 10-minute average
% Time of Day: Noon LST
% Units: Typically input in kilometers per hour (km/h) for the FWI calculation (though sometimes converted to m/s for other fire models).
% ISI
    fW = exp(0.05039 .* W_i);
    fF = 91.9 .* exp(-0.1386 .* m) .* (1 + (m.^5.31) ./ 4.93e7);
    ISI(i, :, :) = 0.208 .* fW .* fF;
	
% ----- BUI -----
% The Buildup Index (BUI) is the second of the three fire behavior indices in the Canadian Forest Fire Weather Index (FWI) System.
% It is a numeric rating that estimates the total amount of fuel available for combustion (the potential fuel consumption).
% The BUI is a combination of the two deep moisture codes: the Duff Moisture Code (DMC) and the Drought Code (DC). It acts as a
% transitional index, linking the moisture status of the deep fuels (DMC and DC) to the final estimate of fire intensity (FWI).
% Input Components The BUI calculation is straightforward and requires no direct weather inputs; it is entirely derived from the
% two preceding moisture codes: Duff Moisture Code (DMC) and Drought Code (DC)
% The BUI is calculated using a single, non-linear formula that combines the DMC and the DC. The calculation is sensitive to the
% relative values of the two codes, ensuring that the BUI rises rapidly when both are high, but it is limited by the DC when the DMC
% is low, and vice versa.
% Standard Formula The formula for the Buildup Index (BUI) is BUI=(MC+0.6⋅DC)/1.6              if DMC <=0.4*DC
% Standard Formula The formula for the Buildup Index (BUI) is BUI=DMC-1.0+exp(0.36*DMC-0.01DC) if DMC>0.4*DC
% Interpretation of the Formula's Two Cases
% The formula transitions between two functions based on the relationship between DMC and DC. This accounts for the fact that the
% total fuel available is limited by the drier of the two layers:
% Case 1: Shallow Fuels are Drier (DMC≤0.4⋅DC)
% This occurs when the DMC (medium-depth duff) is relatively low compared to the DC (deep duff/drought).
% In this situation, the overall fuel available is constrained by the DMC, meaning the fire will not burn deeply into the soil
% despite the long-term drought conditions (DC).
% The formula averages the two codes, giving slightly more weight to the DC.
% Case 2: Deep Fuels are Drier (DMC>0.4⋅DC)
% This is the more common scenario during active fire seasons, especially after a period of prolonged drying.
% Here, the BUI rises exponentially as both DMC and DC values increase. This rapid rise reflects the availability of a significantly
% greater total fuel volume as the fire can consume both the mid-depth duff and the deep organic layers.
% Physical Interpretation
% The BUI is conceptually related to the total fuel loading available for consumption.
% A low BUI means only surface fuels and light duff are available to burn, leading to relatively low total heat output.
% A high BUI means both the surface, mid-depth, and deep organic layers are dry and available, leading to the potential for high fuel
% consumption and persistent, high-intensity fires that are difficult to extinguish, especially due to smoldering deep in the ground
% BUI
    DMC_i = squeeze(p0(i+1, :, :));
    DC_i  = squeeze(d0(i+1, :, :));
    
    idx_BUI_case1 = DMC_i <= 0.4 .* DC_i;
    idx_BUI_case2 = ~idx_BUI_case1;
    idx_BUI_case3 = DMC_i == 0 & DC_i == 0;
    
    BUI_i = zeros(grid_size);
    
    % Case 1
    BUI_i(idx_BUI_case1) = (0.8 .* DMC_i(idx_BUI_case1) .* DC_i(idx_BUI_case1)) ./ (DMC_i(idx_BUI_case1) + 0.4 .* DC_i(idx_BUI_case1));
    % Case 2 (Note: Uses the complex, original-code BUI formula)
    BUI_i(idx_BUI_case2) = DMC_i(idx_BUI_case2) - (1 - (0.8 .* DC_i(idx_BUI_case2)) ./ (DMC_i(idx_BUI_case2) + 0.4 .* DC_i(idx_BUI_case2))) .* ...
                            (0.92 + (0.0114 .* DMC_i(idx_BUI_case2)).^1.7);
    % Case 3 if DMC=0 and DC=0 %added by MZhao
    BUI_i(idx_BUI_case3) = 0;
    
    BUI_i = miz_setmin(BUI_i, 0);
    BUI(i, :, :) = BUI_i;

% ----- FWI -----
% The Fire Weather Index (FWI) is the final and most comprehensive component of the Canadian FWI System.
% It is a single, unitless numeric rating of the potential frontal fire intensity (or rate of energy output per unit length of fire front).
% The FWI computation combines the two main fire behavior indices that were calculated previously: the Initial Spread Index (ISI) and the
% Buildup Index (BUI).
% FWI Computation Steps The calculation proceeds in two sequential steps:
% Step 1: Calculate the Intermediate Fire Intensity Term (ISC)
% This step combines the BUI (the amount of fuel available) with the ISI (the rate of spread). The result is an intermediate term, often
% referred to as the Initial Spread Component (ISC) or Intermediate FWI, which is proportional to the overall intensity of the fire.
% The formula is: ISC=BUI^0.8*( 1000/(325+BUI)*0.25*ISI
% Physical Interpretation of the ISC Term:
% 1) Fuel Consumption Factor (R): The term BUI^0.8*1000/(325+BUI) represents the expected rate of fuel consumption. It ensures that the
% consumption rate increases with the BUI, but the increase is limited by the physical constraints of the fuel bed.
% 2) Combination: The ISC is essentially a product of the rate of spread (ISI) and the rate of fuel consumption (R), which mathematically
% relates to fire intensity.
% Step 2: Convert ISC to the Final Fire Weather Index (FWI)
% The final step converts the ISC into the final FWI index using a power function. This step is a scaling operation designed to map the ISC
% value onto a convenient numerical scale that ranges from 0 to over 100, aligning it with the operational fire danger classes.
% The formula is: FWI=0.244⋅ISC^0.969 if ISC>1.0
% 	          FWI=0.244⋅ISC       if ISC<=1.0​
% For practical purposes, when ISC is large, FWI≈0.244⋅ISC.
% Final Interpretationz: The Fire Weather Index (FWI) is an overall indicator of fire danger. It increases as conditions become more favorable
% for high-intensity, fast-spreading fires.
% A Low FWI      (e.g., 1-5) suggests low-intensity surface fires that are easy to control.
% A High FWI     (e.g., 15-25) suggests a significant fire threat with high intensity and challenging control efforts.
% An Extreme FWI (e.g., >30) suggests explosive growth and behavior, where fires are highly resistant to control.
% FWI
    fD = zeros(grid_size);
    ISI_i = squeeze(ISI(i, :, :));
    
    idx_BUI_gt_80 = BUI_i > 80;
    
    fD(idx_BUI_gt_80) = 1000 ./ (25 + 108.64 .* exp(-0.023 .* BUI_i(idx_BUI_gt_80)));
    fD(~idx_BUI_gt_80) = 0.626 .* BUI_i(~idx_BUI_gt_80).^0.809 + 2;

    B = 0.1 .* ISI_i .* fD;
    
    idx_B_gt_1 = B > 1;
    
    FWI_i = B;
    Slog = 2.72 .* (0.434 .* log(B(idx_B_gt_1))).^0.647;
    FWI_i(idx_B_gt_1) = exp(Slog);
    FWI(i, :, :) = FWI_i;

end

% --- Final Output Components (N x M x L) ---

FFMC = f0(2:N+1, :, :);
DMC  = p0(2:N+1, :, :);
DC   = d0(2:N+1, :, :);
DSR  = 0.0272 .* FWI .^ 1.77;

% --- Final Assembly (Select components and reshape to N x M*L if needed for storage) ---

% This section requires knowing the desired final output shape (N x K, where K = M*L).
% For simplicity here, we return the 3D arrays and rely on the user to select the components.
vars = struct('FFMC',single(FFMC),...
	      'DMC', single(DMC), ...
	      'DC',  single(DC),  ...
	      'ISI', single(ISI), ...
	      'BUI', single(BUI), ...
	      'FWI', single(FWI), ...
	      'DSR', single(DSR));

out_cols = length(what);
out = zeros(N, M, L, out_cols, 'single'); % Example: Time x (Lat*Lon) x Components
size(out)
vars
for k = 1:out_cols
    % Reshape the component (N x M x L) to (N x M*L) before inserting
    component_3D = vars.(char(what(k))); %size(component_3D)
%    component_2D = reshape(component_3D, N, M*L);
    out(:, :, :, k) = component_3D;
end

% Note: Handling spin_up and non-finite values across a 3D array requires careful
% consideration of spatial continuity, but the core calculation is vectorized.

%end
