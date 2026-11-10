function v=read_rws_mod(tpath,expn,fn)
%% [CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%% p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c96'; p.myr=1; p.opt=0;
%tpath='/work/miz/rws_waf_ray_monthly/';
%expn='ob_pattern'; fn=strcat(tpath,expn,'/rws.nc');
varn='lat';                 a=ncread(fn,varn,[1],[Inf]); v.lat=flipud(a);
varn='lon';                 a=ncread(fn,varn,[1],[Inf]); v.lon=a;
varn='rws_ctl_JJA';         a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.ctl.rws_JJA=a;
varn='rws_stretch_ctl_JJA'; a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.ctl.rws_stretch_JJA=a;
varn='rws_advect_ctl_JJA';  a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.ctl.rws_advect_JJA=a;
varn='rws_exp_JJA';         a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.exp.rws_JJA=a;
varn='rws_stretch_exp_JJA'; a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.exp.rws_stretch_JJA=a;
varn='rws_advect_exp_JJA';  a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.exp.rws_advect_JJA=a;
varn='rws_diff_JJA';        a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.dif.rws_JJA=a;
varn='rws_stretch_diff_JJA';a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.dif.rws_stretch_JJA=a;
varn='rws_advect_diff_JJA'; a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.dif.rws_advect_JJA=a;

varn='uchi_ctl_JJA';        a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.ctl.uchi_JJA=a;
varn='vchi_ctl_JJA';        a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.ctl.vchi_JJA=a;
varn='uchi_exp_JJA';        a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.exp.uchi_JJA=a;
varn='vchi_exp_JJA';        a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.exp.vchi_JJA=a;
varn='uchi_diff_JJA';       a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.dif.uchi_JJA=a;
varn='vchi_diff_JJA';       a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.dif.vchi_JJA=a;

return
