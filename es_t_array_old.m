function [es]=es_t_array(t)
%   saturation vapor pressure (Pa)
%   from temperature t (K)

[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0]=thermconst;
ttmp=t-T0;
es = 6.112*exp(17.67*ttmp./(ttmp+243.5));
%rs = EPS*es/(p-es); qs = rs/(1.+rs);



