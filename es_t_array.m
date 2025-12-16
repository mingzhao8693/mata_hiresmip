function [es, des]=es_t_array(t)
%   saturation vapor pressure (hPa)
%   from temperature t (K)

[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0]=thermconst;
% t can be a scalar or an array, es compuatation over liquid and ice
% es over ice verify well with Arden Buck over ice es_t_array_ardenbuck_ice

% Preallocate coefficient arrays with same size as t
a0 = zeros(size(t)); a1 = a0; a2 = a0; a3 = a0; a4 = a0;
a5 = a0; a6 = a0; a7 = a0; a8 = a0;

% Logical mask for temperatures >= 273.16
warm = t >= 273.16;
cold = ~warm;

% Assign warm-region coefficients
a0(warm) = 6.105851;      a1(warm) = 0.4440316;       a2(warm) = 0.1430341e-1;
a3(warm) = 0.2641412e-3;  a4(warm) = 0.2995057e-5;    a5(warm) = 0.2031998e-7;
a6(warm) = 0.6936113e-10; a7(warm) = 0.2564861e-13;   a8(warm) = -0.3704404e-15;

% Assign cold-region coefficients
a0(cold) = 6.11147274;      a1(cold) = 0.503160820;      a2(cold) = 0.188439774e-1;
a3(cold) = 0.420895665e-3;  a4(cold) = 0.615021634e-5;    a5(cold) = 0.602588177e-7;
a6(cold) = 0.385852041e-9;  a7(cold) = 0.146898966e-11;   a8(cold) = 0.252751365e-14;

% dt with lower bound -80
dt = t - 273.16;
dt(dt < -80) = -80;

% Saturation vapor pressure polynomial (vectorized)

es = a0 + dt.*(a1+dt.*(a2+dt.*(a3+dt.*(a4+dt.*(a5+dt.*(a6+dt.*(a7+a8.*dt)))))));

des= a1 + dt.*(2.*a2 + dt.*(3.*a3 + dt.*(4.*a4 ...
	+ dt.*(5.*a5 + dt.*(6.*a6 + dt.*(7.*a7 + dt.*8.*a8))))));
