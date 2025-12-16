function [x]=get_diff(x)
%note all runs except CESS use the present-day SST
x.rfp_tot = x.v - x.c;           %2000climo - 1860climo
x.rfp_aer = x.a - x.c;           %2000aero  - 1860aero; both use 1860GHG
x.rfp_ghg = x.g - x.c;           %GHG RFP dervied from the difference
x.rfp_res = x.rfp_tot-x.rfp_aer-x.rfp_ghg; %residue: volcanoes 

x.rfp_co2 = x.x - x.v;           %2xCO2 RFP 2xCO2 minus control
x.rfp_p2k = x.w - x.v;           %p2K  - control
x.rfp_sum = x.rfp_co2+x.rfp_p2k; %sum of 2xCO2 and p2K
x.rfp_ces = (x.w - x.v)/2;       %difference between p2K and control normalized
x.csen    = -1.0/x.rfp_ces;
%differences due to total, aerosol, GHG, and 2K SST warming
x.rfp=[x.rfp_tot x.rfp_aer x.rfp_ghg x.rfp_res x.rfp_p2k x.rfp_co2];
%x.rfp=[x.rfp_tot x.rfp_aer x.rfp_ghg x.rfp_res x.rfp_p2k];
return
