function v=read_rws_era5(tpath,expn,fn)
%% [CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%% p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c96'; p.myr=1; p.opt=0;
%% tpath='/work/miz/rws_waf_ray_monthly/';
%% expn='era5'; fn=strcat(tpath,expn,'/rws_ERA5.nc');
varn='lat';            a=ncread(fn,varn,[1],[Inf]); v.lat=flipud(a);
varn='lon';            a=ncread(fn,varn,[1],[Inf]); v.lon=a;
varn='rws_JJA';        a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.rws_JJA=a;
varn='rws_stretch_JJA';a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.rws_stretch_JJA=a;
varn='rws_advect_JJA'; a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.rws_advect_JJA=a;
varn='uchi_JJA';       a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.uchi_JJA=a;
varn='vchi_JJA';       a=ncread(fn,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]); a=flipud(a); v.vchi_JJA=a;

return

if (opt>2)
  save_matfile(v,mpath,expn,region,mext,opt); return
else
  fn=strcat(tpath,expn,'/',expn,'_',region,'_tsana_new.mat'); %save(fn,'v');
  save(fn,'v','-v7.3'); %save very large files
  %save -v7.3 '/work/miz/tmp.mat' 'v'; 
  return
end

return
