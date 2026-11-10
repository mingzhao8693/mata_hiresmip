function v=read_waf_era5(tpath,expn,fn)
%% [CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%% p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c96'; p.myr=1; p.opt=0;
%% tpath='/work/miz/rws_waf_ray_monthly/';
%% expn='era5'; fn=strcat(tpath,expn,'/rws_ERA5.nc');
varn='lat';        a=ncread(fn,varn,[1],[Inf]); v.lat=a;
varn='lon';        a=ncread(fn,varn,[1],[Inf]); v.lon=a;
varn='waf_x_JJA';  a=ncread(fn,varn,[1 1],  [Inf Inf]);     a=permute(a,[2 1]);   v.waf_x_JJA  =a;
varn='waf_y_JJA';  a=ncread(fn,varn,[1 1],  [Inf Inf]);     a=permute(a,[2 1]);   v.waf_y_JJA  =a;
varn='zprime_JJA'; a=ncread(fn,varn,[1 1],  [Inf Inf]);     a=permute(a,[2 1]);   v.zprime_JJA =a;
varn='waf_x_clim'; a=ncread(fn,varn,[1 1 1],[Inf Inf Inf]); a=permute(a,[3 2 1]); v.waf_x_clim =a;
varn='waf_y_clim'; a=ncread(fn,varn,[1 1 1],[Inf Inf Inf]); a=permute(a,[3 2 1]); v.waf_y_clim =a;
varn='zprime_clim';a=ncread(fn,varn,[1 1 1],[Inf Inf Inf]); a=permute(a,[3 2 1]); v.zprime_clim=a;

return
