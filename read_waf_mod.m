function v=read_waf_mod(tpath,expn,fn)
%% [CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%% p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c96'; p.myr=1; p.opt=0;
%% tpath='/work/miz/rws_waf_ray_monthly/';
%% expn='era5'; fn=strcat(tpath,expn,'/rws_ERA5.nc');
varn='lat';                 a=ncread(fn,varn,[1],[Inf]); v.lat=a;
varn='lon';                 a=ncread(fn,varn,[1],[Inf]); v.lon=a;
varn='waf_x_ctl_JJA';       a=ncread(fn,varn,[1 1],  [Inf Inf]);      a=permute(a,[2 1]);   v.ctl.waf_x_JJA  =a;
varn='waf_y_ctl_JJA';       a=ncread(fn,varn,[1 1],  [Inf Inf]);      a=permute(a,[2 1]);   v.ctl.waf_y_JJA  =a;
varn='zprime_ctl_JJA';      a=ncread(fn,varn,[1 1],  [Inf Inf]);      a=permute(a,[2 1]);   v.ctl.zprime_JJA =a;
varn='waf_x_ctl_clim';      a=ncread(fn,varn,[1 1 1],[Inf Inf Inf]);  a=permute(a,[3 2 1]); v.ctl.waf_x_clim =a;
varn='waf_y_ctl_clim';      a=ncread(fn,varn,[1 1 1],[Inf Inf Inf]);  a=permute(a,[3 2 1]); v.ctl.waf_y_clim =a;
varn='zprime_ctl_clim';     a=ncread(fn,varn,[1 1 1],[Inf Inf Inf]);  a=permute(a,[3 2 1]); v.ctl.zprime_clim=a;
varn='waf_x_exp_JJA';       a=ncread(fn,varn,[1 1],  [Inf Inf]);      a=permute(a,[2 1]);   v.exp.waf_x_JJA  =a;
varn='waf_y_exp_JJA';       a=ncread(fn,varn,[1 1],  [Inf Inf]);      a=permute(a,[2 1]);   v.exp.waf_y_JJA  =a;
varn='zprime_exp_JJA';      a=ncread(fn,varn,[1 1],  [Inf Inf]);      a=permute(a,[2 1]);   v.exp.zprime_JJA =a;
varn='waf_x_exp_clim';      a=ncread(fn,varn,[1 1 1],[Inf Inf Inf]);  a=permute(a,[3 2 1]); v.exp.waf_x_clim =a;
varn='waf_y_exp_clim';      a=ncread(fn,varn,[1 1 1],[Inf Inf Inf]);  a=permute(a,[3 2 1]); v.exp.waf_y_clim =a;
varn='zprime_exp_clim';     a=ncread(fn,varn,[1 1 1],[Inf Inf Inf]);  a=permute(a,[3 2 1]); v.exp.zprime_clim=a;
varn='waf_x_diff_JJA';      a=ncread(fn,varn,[1 1],  [Inf Inf]);      a=permute(a,[2 1]);   v.dif.waf_x_JJA  =a;
varn='waf_y_diff_JJA';      a=ncread(fn,varn,[1 1],  [Inf Inf]);      a=permute(a,[2 1]);   v.dif.waf_y_JJA  =a;
varn='waf_x_response_JJA';  a=ncread(fn,varn,[1 1],  [Inf Inf]);      a=permute(a,[2 1]);   v.res.waf_x_JJA  =a;
varn='waf_y_response_JJA';  a=ncread(fn,varn,[1 1],  [Inf Inf]);      a=permute(a,[2 1]);   v.res.waf_y_JJA  =a;
varn='zprime_response_JJA'; a=ncread(fn,varn,[1 1],  [Inf Inf]);      a=permute(a,[2 1]);   v.res.zprime_JJA =a;
varn='waf_x_diff_clim';     a=ncread(fn,varn,[1 1 1],[Inf Inf Inf]);  a=permute(a,[3 2 1]); v.dif.waf_x_clim =a;
varn='waf_y_diff_clim';     a=ncread(fn,varn,[1 1 1],[Inf Inf Inf]);  a=permute(a,[3 2 1]); v.dif.waf_y_clim =a;
varn='waf_x_response_clim'; a=ncread(fn,varn,[1 1 1],[Inf Inf Inf]);  a=permute(a,[3 2 1]); v.res.waf_x_clim =a;
varn='waf_y_response_clim'; a=ncread(fn,varn,[1 1 1],[Inf Inf Inf]);  a=permute(a,[3 2 1]); v.res.waf_y_clim =a;
varn='zprime_response_clim';a=ncread(fn,varn,[1 1 1],[Inf Inf Inf]);  a=permute(a,[3 2 1]); v.res.zprime_clim=a;

return
