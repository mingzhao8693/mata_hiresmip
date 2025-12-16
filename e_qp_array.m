function [e]=e_qp_array(q,p)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0]=thermconst;

% q = specific humidity (kg/kg)
% p = pressure (Pa or hPa)

e = (q .* p) ./ (0.622 + 0.378 .* q);

return
