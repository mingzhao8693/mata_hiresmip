function [es]=es_t_array_ardenbuck(t)
%   saturation vapor pressure (Pa)
%   from temperature t (K)

[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0]=thermconst;
ttmp=t-T0;
es = 6.1121*exp((18.678-ttmp./234.5).*ttmp./(257.14+ttmp));
%rs = EPS*es/(p-es); qs = rs/(1.+rs);



