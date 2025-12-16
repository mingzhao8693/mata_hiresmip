function out = fwi1D(months, Tm, H, r, W, lat, what, init_pars, spin_up)
%FWI1D Canadian Fire Weather Index for 1-D Time Series
%
%   out = FWI1D(months, Tm, H, r, W)
%   computes the Fire Weather Index (FWI) system using daily meteorological
%   inputs. By default, only the FWI component is returned.
%
%   out = FWI1D(months, Tm, H, r, W, lat, what, init_pars, spin_up)
%
%   INPUTS
%       months      : Nx1 integer vector (1–12), month of each record
%       Tm          : Nx1 vector, temperature (°C)
%       H           : Nx1 vector, relative humidity (%)
%       r           : Nx1 vector, 24-hr precipitation (mm)
%       W           : Nx1 vector, wind speed (km/h)
%
%   OPTIONAL INPUTS
%       lat         : Latitude in degrees (default = 46)
%       what        : Components to return. Any subset of:
%                       {"FFMC","DMC","DC","ISI","BUI","FWI","DSR"}
%                     default = "FWI"
%       init_pars   : 1x3 vector of initial [FFMC DMC DC] values
%                     default = [85 6 15]
%       spin_up     : Integer number of leading days set to NaN
%                     default = 0
%
%   OUTPUT
%       out         : NxK numeric matrix
%                     rows   = time (days)
%                     cols   = requested components (in order of "what")
%
%   REFERENCES
%       Van Wagner (1987), Lawson & Armitage (2008),
%       Van Wagner & Pickett (1985)
%
%   AUTHOR
%       MATLAB translation based on J. Bedia's R implementation
%
%references
%Lawson, B.D. & Armitage, O.B., 2008.
%Weather guide for the Canadian Forest Fire Danger Rating System. Northern Forestry Centre, Edmonton (Canada).
%van Wagner, C.E., 1987.
%Development and structure of the Canadian Forest Fire Weather Index (Forestry Tech. Rep. No. 35). Canadian Forestry Service, Ottawa, Canada.
%van Wagner, C.E., Pickett, T.L., 1985.
%Equations and FORTRAN program for the Canadian forest fire weather index system (Forestry Tech. Rep. No. 33). Canadian Forestry Service, Ottawa, Canada.
%author J. Bedia, partially based on the original FORTRAN code by van Wagner and Pickett (1985)
% ---------------------- INPUT VALIDATION -------------------------------

% Check required inputs
if nargin < 5
    error('At least five inputs (months, Tm, H, r, W) are required.');
end

% Validate vector shapes
inputs = {months, Tm, H, r, W};
names  = {'months','Tm','H','r','W'};
n = length(months);

for k = 1:5
    if ~isvector(inputs{k})
        error('Input "%s" must be a vector.', names{k});
    end
    if length(inputs{k}) ~= n
        error('All input vectors must have the same length.');
    end
end

% Set defaults
if nargin < 6 || isempty(lat),       lat = 46;      end
if nargin < 7 || isempty(what),      what = "FWI";  end
if nargin < 8 || isempty(init_pars), init_pars = [85 6 15]; end
if nargin < 9 || isempty(spin_up),   spin_up = 0;   end

% Validate latitude
if ~isscalar(lat) || ~isnumeric(lat) || lat < -90 || lat > 90
    error('Latitude must be a numeric scalar in [-90, 90].');
end

% Validate init_pars
if ~isnumeric(init_pars) || length(init_pars) ~= 3
    error('"init_pars" must be a numeric vector of length 3.');
end

% Validate spin_up
if ~isscalar(spin_up) || spin_up < 0 || mod(spin_up,1) ~= 0
    error('"spin_up" must be a non-negative integer.');
end

% Validate "what"
validChoices = ["FFMC","DMC","DC","ISI","BUI","FWI","DSR"];
what = string(what);
if ~all(ismember(what, validChoices))
    error('"what" contains invalid component names.');
end

%% ---------------------- MISSING DATA HANDLING --------------------------

isGood = isfinite(Tm) & isfinite(H) & isfinite(r) & isfinite(W);
if ~all(isGood)
    warning('Missing values detected. These records will be removed.');
    months = months(isGood);
    Tm     = Tm(isGood);
    H      = H(isGood);
    r      = r(isGood);
    W      = W(isGood);
end

n2  = length(months);
out = NaN(n, length(what)); % final output (full length)

%% ---------------------- PHYSICAL CORRECTION ----------------------------

H(H > 100) = 100;
H(H <   0) = 0;
r(r <   0) = 0;
W(W <   0) = 0;

%% ---------------------- LATITUDE FACTORS -------------------------------

% Both factors are essential for accurately modeling the seasonal variation in drying intensity across
% different latitudes in Canada, ensuring that the codes reflect the reality that summer days have a much
% greater drying power than winter days, even if the noon temperature is the same.
% Feature	   Le (DMC Daylength Factor)	                Lf (DC Daylength Factor)
% Component	   Duff Moisture Code (DMC)                     Drought Code (DC)
% Layer Time Lag   Medium (≈12 days)	                        Long (≈52 days)
% Formula Use	   Multiplies the drying constant (K).          Adds to the drying factor (V).
% Input Dependence Scales drying driven by Temperature and RH	Scales drying driven primarily by Temperature

ref_lats = [-90 -30 -10 10 30 90];
loc = findInterval(lat, ref_lats);

switch loc
    case 1
        Le  = [11.5 10.5 9.2 7.9 6.8 6.2 6.5 7.4 8.7 10.0 11.2 11.8];%day length factor for DMC
        dlf = [6.4 5.0 2.4 0.4 -1.6 -1.6 -1.6 -1.6 -1.6 0.9 3.8 5.8];%day length factor for DC
    case 2
        Le  = [10.1 9.6 9.1 8.5 8.1 7.8 7.9 8.3 8.9 9.4 9.9 10.2];
        dlf = [6.4 5.0 2.4 0.4 -1.6 -1.6 -1.6 -1.6 -1.6 0.9 3.8 5.8];
    case 3
        Le  = repmat(9,1,12);
        dlf = repmat(1.4,1,12);
    case 4
        Le  = [7.9 8.4 8.9 9.5 9.9 10.2 10.1 9.7 9.1 8.6 8.1 7.8];
        dlf = [-1.6 -1.6 -1.6 0.9 3.8 5.8 6.4 5.0 2.4 0.4 -1.6 -1.6];
    case 5
        Le  = [6.5 7.5 9.0 12.8 13.9 13.9 12.4 10.9 9.4 8.0 7.0 6.0];
        dlf = [-1.6 -1.6 -1.6 0.9 3.8 5.8 6.4 5.0 2.4 0.4 -1.6 -1.6];
    otherwise
        error('Latitude out of bounds.');
end

    % Defaults
    if nargin < 6 || isempty(lat), lat = 46; end
    if nargin < 7 || isempty(what), what = "FWI"; end
    if nargin < 8 || isempty(init_pars), init_pars = [85, 6, 15]; end
    if nargin < 9 || isempty(spin_up), spin_up = 0; end

    % Check vector lengths
    n = length(months);
    if any([length(Tm), length(H), length(r), length(W)] ~= n)
        error('Input vector lengths differ');
    end

    % Allowed components
    choices = ["FFMC","DMC","DC","ISI","BUI","FWI","DSR"];
    if ischar(what) || isstring(what)
        what = string(what);
    end
    if ~all(ismember(what,choices))
        error('Invalid entry in "what" argument');
    end

    % Initialize output
    out = NaN(n, length(what));
    colnames = what;
    
    % Remove missing values
    rm_ind = find(~(isfinite(Tm) & isfinite(H) & isfinite(r) & isfinite(W)));
    non_na_ind = setdiff(1:n, rm_ind);

    if ~isempty(rm_ind)
        warning('Missing values were removed from the time series before computation');
        months(rm_ind) = [];
        Tm(rm_ind) = [];
        H(rm_ind) = [];
        r(rm_ind) = [];
        W(rm_ind) = [];
    end

    mes = months;
    n2 = length(mes);

    % Latitude tables (Lawson & Armitage)
    ref_lats = [-90 -30 -10 10 30 90];
    loc = findInterval(lat, ref_lats);

    switch loc
        case 1
            Le  = [11.5 10.5 9.2 7.9 6.8 6.2 6.5 7.4 8.7 10.0 11.2 11.8];
            dlf = [6.4 5.0 2.4 0.4 -1.6 -1.6 -1.6 -1.6 -1.6 0.9 3.8 5.8];
        case 2
            Le  = [10.1 9.6 9.1 8.5 8.1 7.8 7.9 8.3 8.9 9.4 9.9 10.2];
            dlf = [6.4 5.0 2.4 0.4 -1.6 -1.6 -1.6 -1.6 -1.6 0.9 3.8 5.8];
        case 3
            Le  = repmat(9,1,12);
            dlf = repmat(1.4,1,12);
        case 4
            Le  = [7.9 8.4 8.9 9.5 9.9 10.2 10.1 9.7 9.1 8.6 8.1 7.8];
            dlf = [-1.6 -1.6 -1.6 0.9 3.8 5.8 6.4 5.0 2.4 0.4 -1.6 -1.6];
        case 5
            Le  = [6.5 7.5 9.0 12.8 13.9 13.9 12.4 10.9 9.4 8.0 7.0 6.0];
            dlf = [-1.6 -1.6 -1.6 0.9 3.8 5.8 6.4 5.0 2.4 0.4 -1.6 -1.6];
        otherwise
            error('Latitude out of bounds');
    end

    % Corrections
    H(H > 100) = 100;
    H(H < 0) = 0;
    r(r < 0) = 0;
    W(W < 0) = 0;

    % Initialization
    f0  = [init_pars(1) NaN(1,n2)];
    p0  = [init_pars(2) NaN(1,n2)];
    d0  = [init_pars(3) NaN(1,n2)];

    ISI = NaN(1,n2);
    BUI = NaN(1,n2);
    FWI = NaN(1,n2);

    % MAIN LOOP
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
        m0 = (147.2 * (101 - f0(i))) / (59.5 + f0(i)); %m0:moisture content

        if r(i) > 0.5
            rA = r(i) - 0.5;
            if m0 <= 150
                mr = m0 + 42.5 * rA * exp(-100/(251 - m0)) * (1 - exp(-6.93/rA));
            else
                mr = m0 + 42.5 * rA * exp(-100/(251 - m0)) * (1 - exp(-6.93/rA)) + (0.0015 * (m0 - 150)^2 * sqrt(rA));
            end
            mr = min(mr,250);
            m0 = mr;
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

        Ed = 0.942*H(i)^0.679 + 11*exp((H(i)-100)/10) + 0.18*(21.1-Tm(i))*(1 - exp(-0.115*H(i)));
        Ew = 0.618*H(i)^0.753 + 10*exp((H(i)-100)/10) + 0.18*(21.1-Tm(i))*(1 - exp(-0.115*H(i)));

        if m0 > Ed
            k0 = 0.424*(1 - (H(i)/100)^1.7) + 0.0694*sqrt(W(i))*(1 - (H(i)/100)^8);
            kd = k0 * 0.581 * exp(0.0365*Tm(i));
            m  = Ed + (m0 - Ed) * 10^(-kd);
        elseif m0 < Ew
            k1 = 0.424*(1 - ((100-H(i))/100)^1.7) + 0.0694*sqrt(W(i))*(1 - ((100-H(i))/100)^8);
            kw = k1 * 0.581 * exp(0.0365*Tm(i));
            m  = Ew - (Ew - m0) * 10^(-kw);
        else
            m = m0;
        end

        m = max(m,0);
        f0(i+1) = 59.5*(250 - m) / (147.2 + m); %change from moisture content to FFMC

% ----- DMC & DC -----
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

        Ti = max(Tm(i), -1.1);
        K = 1.894 * (Ti + 1.1) * (100 - H(i)) * Le(mes(i)) * 1e-06;

        if r(i) > 1.5
            re = 0.92*r(i) - 1.27;
            M0 = 20 + exp(5.6348 - p0(i)/43.43);

            if p0(i) <= 33
                b = 100 / (0.5 + 0.3*p0(i));
            elseif p0(i) > 65
                b = 6.2*log(p0(i)) - 17.2;
            else
                b = 14 - 1.3*log(p0(i));
            end

            Mr = M0 + (1000*re)/(48.77 + b*re);
            pr = 244.72 - 43.43*log(Mr - 20);
            pr = max(pr,0);
            p0(i+1) = pr + 100*K;
        else
            p0(i+1) = p0(i) + 100*K;
        end

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

	Ti2 = max(Tm(i), -2.8);
        v = 0.36*(Ti2 + 2.8) + dlf(mes(i));
        v = max(v,0);

        if r(i) > 2.8
            rd = 0.83*r(i) - 1.27;
            q0 = 800*exp(-d0(i)/400);
            qr = q0 + 3.937*rd;
            dr = 400*log(800/qr);
            dr = max(dr,0);
            d0(i+1) = dr + 0.5*v;
        else
            d0(i+1) = d0(i) + 0.5*v;
        end

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

        fW = exp(0.05039*W(i));
        fF = 91.9*exp(-0.1386*m)*(1 + (m^5.31)/(4.93e7));
        ISI(i) = 0.208 * fW * fF;
	
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
	
	if p0(i+1) <= 0.4 * d0(i+1)
            BUI(i) = (0.8*p0(i+1)*d0(i+1)) / (p0(i+1) + 0.4*d0(i+1));
        else
            BUI(i) = p0(i+1) - (1 - (0.8*d0(i+1))/(p0(i+1) + 0.4*d0(i+1))) * ...
                     (0.92 + (0.0114*p0(i+1))^1.7);
        end

        if ~isfinite(BUI(i)) || BUI(i) < 0
            BUI(i) = 0;
        end

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

        if BUI(i) > 80
            fD = 1000/(25 + 108.64*exp(-0.023*BUI(i)));
        else
            fD = 0.626*BUI(i)^0.809 + 2;
        end

        B = 0.1 * ISI(i) * fD;

        if B > 1
            Slog = 2.72*(0.434*log(B))^0.647;
            FWI(i) = exp(Slog);
        else
            FWI(i) = B;
        end
    end

    % Final components
    FFMC = f0(2:end);
    DMC  = p0(2:end);
    DC   = d0(2:end);
    DSR  = 0.0272 * FWI.^1.77;


% Assemble output from selected components
vars = struct('FFMC',FFMC,'DMC',DMC,'DC',DC,'ISI',ISI,'BUI',BUI,'FWI',FWI,'DSR',DSR);
temp = zeros(n2, length(what));
for k = 1:length(what)
    temp(:,k) = vars.(what(k));
end

% Place back into full-length matrix
out(isGood, :) = temp;

% Apply spin-up
if spin_up > 0
    out(1:spin_up,:) = NaN;
end

end
