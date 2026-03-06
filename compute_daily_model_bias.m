function [v]=compute_daily_model_bias(tpath,expn,yr1,yr2,pct,opt,latlon)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in obs daily data%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/';
expn ='c192_obs'; yr1=1979; yr2=2020; opt=0; fext =strcat('_',num2str(yr1),'_',num2str(yr2));
%fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_obs_all.mat');  disp(fnmat); %load(fnmat); 
fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_obs_climo.mat'); disp(fnmat); load(fnmat); 
o=v; clear v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load model daily data%%%%%%%%%%%%%%%%%
expn ='c192L33_am4p0_2010climo_newctl'; yr1=2; yr2=101; fext =strcat('_',num2str(yr1),'_',num2str(yr2));
%fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_mod_all.mat');  disp(fnmat); %load(fnmat); 
fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_mod_climo.mat'); disp(fnmat); load(fnmat); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute climatological biases%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%c1=-5; c2=5;
%figure; pcolor(squeeze(mean(v.c192am4.pr.bias_gpcp13,1))); shading flat; colorbar; caxis([c1 c2]); cmap=bluewhitered(128); colormap(cmap);title('GPCP1.3');
%figure; pcolor(squeeze(mean(v.c192am4.pr.bias_gpcp32,1))); shading flat; colorbar; caxis([c1 c2]); cmap=bluewhitered(128); colormap(cmap);title('GPCP3.2');
%figure; pcolor(squeeze(mean(v.c192am4.pr.bias_gpm,1)));    shading flat; colorbar; caxis([c1 c2]); cmap=bluewhitered(128); colormap(cmap);title('GPM');
%figure; pcolor(squeeze(mean(v.c192am4.pr.bias_mswep,1)));  shading flat; colorbar; caxis([c1 c2]); cmap=bluewhitered(128); colormap(cmap);title('MSWEP');
%figure; pcolor(squeeze(mean(v.c192am4.pr.bias_era5,1)));   shading flat; colorbar; caxis([c1 c2]); cmap=bluewhitered(128); colormap(cmap);title('ERA5');
clear b
a=v.c192am4.pr.daily_climo    -o.gpcp.pr13.daily_climo;   b.daily.gpcp13=a; b.season.gpcp13=compute_season_from_daily(a); 
a=v.c192am4.pr.daily_climo    -o.gpcp.pr32.daily_climo;   b.daily.gpcp32=a; b.season.gpcp32=compute_season_from_daily(a); 
a=v.c192am4.pr.daily_climo    -o.gpm.pr.daily_climo;      b.daily.gpm   =a; b.season.gpm   =compute_season_from_daily(a);
a=v.c192am4.pr.daily_climo    -o.mswep.pr.daily_climo;    b.daily.mswep =a; b.season.mswep =compute_season_from_daily(a);
a=v.c192am4.pr.daily_climo    -o.era5.pr.daily_climo;     b.daily.era5  =a; b.season.era5  =compute_season_from_daily(a); v.c192am4.pr.bias    =b; clear b;
a=v.c192am4.ps.daily_climo    -o.era5.ps.daily_climo;     b.daily       =a; b.season       =compute_season_from_daily(a); v.c192am4.ps.bias    =b; clear b;
a=v.c192am4.ts.daily_climo    -o.era5.ts.daily_climo;     b.daily       =a; b.season       =compute_season_from_daily(a); v.c192am4.ts.bias    =b; clear b;
a=v.c192am4.tas.daily_climo   -o.era5.tas.daily_climo;    b.daily       =a; b.season       =compute_season_from_daily(a); v.c192am4.tas.bias   =b; clear b;
a=v.c192am4.tasmax.daily_climo-o.era5.tasmax.daily_climo; b.daily       =a; b.season       =compute_season_from_daily(a); v.c192am4.tasmax.bias=b; clear b;
a=v.c192am4.vps.daily_climo   -o.era5.vps.daily_climo;    b.daily       =a; b.season       =compute_season_from_daily(a); v.c192am4.vps.bias   =b; clear b;
a=v.c192am4.vp.daily_climo    -o.era5.vp.daily_climo;     b.daily       =a; b.season       =compute_season_from_daily(a); v.c192am4.vp.bias    =b; clear b;
a=v.c192am4.vpd.daily_climo   -o.era5.vpd.daily_climo;    b.daily       =a; b.season       =compute_season_from_daily(a); v.c192am4.vpd.bias   =b; clear b;
a=v.c192am4.rh.daily_climo    -o.era5.rh.daily_climo;     b.daily       =a; b.season       =compute_season_from_daily(a); v.c192am4.rh.bias    =b; clear b;
a=v.c192am4.qv.daily_climo    -o.era5.qv.daily_climo;     b.daily       =a; b.season       =compute_season_from_daily(a); v.c192am4.qv.bias    =b; clear b;
a=v.c192am4.uas.daily_climo   -o.era5.uas.daily_climo;    b.daily       =a; b.season       =compute_season_from_daily(a); v.c192am4.uas.bias   =b; clear b;
a=v.c192am4.vas.daily_climo   -o.era5.vas.daily_climo;    b.daily       =a; b.season       =compute_season_from_daily(a); v.c192am4.vas.bias   =b; clear b;
a=v.c192am4.wsd.daily_climo   -o.era5.wsd.daily_climo;    b.daily       =a; b.season       =compute_season_from_daily(a); v.c192am4.wsd.bias   =b; clear b;

fday=30; 
a=v.c192am4.pr.bias.daily.gpcp13; v.c192am4.pr.bias.daily.gpcp13_f=movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.pr.bias.daily.gpcp32; v.c192am4.pr.bias.daily.gpcp32_f=movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.pr.bias.daily.gpm;    v.c192am4.pr.bias.daily.gpm_f   =movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.pr.bias.daily.mswep;  v.c192am4.pr.bias.daily.mswep_f =movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.pr.bias.daily.era5;   v.c192am4.pr.bias.daily.era5_f  =movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.ps.bias.daily;        v.c192am4.ps.bias.daily_f       =movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.ts.bias.daily;        v.c192am4.ts.bias.daily_f       =movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.tas.bias.daily;       v.c192am4.tas.bias.daily_f      =movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.tasmax.bias.daily;    v.c192am4.tasmax.bias.daily_f   =movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.vps.bias.daily;       v.c192am4.vps.bias.daily_f      =movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.vp.bias.daily;        v.c192am4.vp.bias.daily_f       =movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.vpd.bias.daily;       v.c192am4.vpd.bias.daily_f      =movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.rh.bias.daily;        v.c192am4.rh.bias.daily_f       =movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.qv.bias.daily;        v.c192am4.qv.bias.daily_f       =movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.uas.bias.daily;       v.c192am4.uas.bias.daily_f      =movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.vas.bias.daily;       v.c192am4.vas.bias.daily_f      =movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.wsd.bias.daily;       v.c192am4.wsd.bias.daily_f      =movmean(a,fday,1,'omitnan', 'Endpoints', 'fill');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Save model daily climatological bias to mat file
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_mod_bias_f30.mat')
save(fnmat,'v','-v7.3'); %save(fnmat,'v');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%write results to netcdf file%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/';
fnout=strcat(tpath,expn,'/',expn,'_daily_climo_mod_bias_f30.nc')
%fnout=strcat('/work/miz/mat_hiresmip/',expn,'daily_climo_bias.nc');

nt=365; nlat=v.nlat; nlon=v.nlon; lat=v.lat; lon=v.lon;
cl=8; form='netcdf4'; time=[1:1:nt];
nccreate(fnout,'time','Dimensions',{'time' Inf},'Format',form);
nccreate(fnout,'lat', 'Dimensions',{'lat' nlat},'Format',form);
nccreate(fnout,'lon', 'Dimensions',{'lon' nlon},'Format',form);
nccreate(fnout,'pr_gpcp13',        'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_gpcp32',        'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_gpm',           'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_mswep',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_era5',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

nccreate(fnout,'ps_era5',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'ts_era5',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tas_era5',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tasmax_era5',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vps_era5',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vp_era5',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vpd_era5',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'rh_era5',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'qv_era5',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'uas_era5',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vas_era5',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'wsd_era5',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

nccreate(fnout,'pr_c192am4',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'ps_c192am4',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'ts_c192am4',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tas_c192am4',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tasmax_c192am4',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vps_c192am4',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vp_c192am4',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vpd_c192am4',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'rh_c192am4',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'qv_c192am4',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'uas_c192am4',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vas_c192am4',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'wsd_c192am4',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

nccreate(fnout,'pr_bias_gpcp13',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias_gpcp13_f', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

nccreate(fnout,'pr_bias_gpcp32',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias_gpcp32_f', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

nccreate(fnout,'pr_bias_gpm',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias_gpm_f',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

nccreate(fnout,'pr_bias_mswep',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias_mswep_f',  'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

nccreate(fnout,'pr_bias_era5',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias_era5_f',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

nccreate(fnout,'ps_bias',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'ps_bias_f',        'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'ts_bias',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'ts_bias_f',        'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tas_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tas_bias_f',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tasmax_bias',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tasmax_bias_f',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vps_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vps_bias_f',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vp_bias',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vp_bias_f',        'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vpd_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vpd_bias_f',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'rh_bias',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'rh_bias_f',        'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'qv_bias',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'qv_bias_f',        'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'uas_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'uas_bias_f',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vas_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vas_bias_f',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'wsd_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'wsd_bias_f',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

ncwrite(fnout,'time', time(:));
ncwrite(fnout,'lat',  lat);
ncwrite(fnout,'lon',  lon); x=v.c192am4;;
ncwrite(fnout,'pr_gpcp13',          permute(o.gpcp.pr13.daily_climo,      [3 2 1]))
ncwrite(fnout,'pr_gpcp32',          permute(o.gpcp.pr32.daily_climo,      [3 2 1]))
ncwrite(fnout,'pr_gpm',             permute(o.gpm.pr.daily_climo,         [3 2 1]))
ncwrite(fnout,'pr_mswep',           permute(o.mswep.pr.daily_climo,       [3 2 1]))
ncwrite(fnout,'pr_era5',            permute(o.era5.pr.daily_climo,        [3 2 1]))
ncwrite(fnout,'ps_era5',            permute(o.era5.ps.daily_climo,        [3 2 1]))
ncwrite(fnout,'tas_era5',           permute(o.era5.tas.daily_climo,       [3 2 1]))
ncwrite(fnout,'ts_era5',            permute(o.era5.ts.daily_climo,        [3 2 1]))
ncwrite(fnout,'tasmax_era5',        permute(o.era5.tasmax.daily_climo,    [3 2 1]))
ncwrite(fnout,'vps_era5',           permute(o.era5.vps.daily_climo,       [3 2 1]))
ncwrite(fnout,'vp_era5',            permute(o.era5.vp.daily_climo,        [3 2 1]))
ncwrite(fnout,'vpd_era5',           permute(o.era5.vpd.daily_climo,       [3 2 1]))
ncwrite(fnout,'rh_era5',            permute(o.era5.rh.daily_climo,        [3 2 1]))
ncwrite(fnout,'qv_era5',            permute(o.era5.qv.daily_climo,        [3 2 1]))
ncwrite(fnout,'uas_era5',           permute(o.era5.uas.daily_climo,       [3 2 1]))
ncwrite(fnout,'vas_era5',           permute(o.era5.vas.daily_climo,       [3 2 1]))
ncwrite(fnout,'wsd_era5',           permute(o.era5.wsd.daily_climo,       [3 2 1]))

ncwrite(fnout,'pr_c192am4',         permute(v.c192am4.pr.daily_climo,     [3 2 1]))
ncwrite(fnout,'ps_c192am4',         permute(v.c192am4.ps.daily_climo,     [3 2 1]))
ncwrite(fnout,'ts_c192am4',         permute(v.c192am4.ts.daily_climo,     [3 2 1]))
ncwrite(fnout,'tas_c192am4',        permute(v.c192am4.tas.daily_climo,    [3 2 1]))
ncwrite(fnout,'tasmax_c192am4',     permute(v.c192am4.tasmax.daily_climo, [3 2 1]))
ncwrite(fnout,'vps_c192am4',        permute(v.c192am4.vps.daily_climo,    [3 2 1]))
ncwrite(fnout,'vp_c192am4',         permute(v.c192am4.vp.daily_climo,     [3 2 1]))
ncwrite(fnout,'vpd_c192am4',        permute(v.c192am4.vpd.daily_climo,    [3 2 1]))
ncwrite(fnout,'rh_c192am4',         permute(v.c192am4.rh.daily_climo,     [3 2 1]))
ncwrite(fnout,'qv_c192am4',         permute(v.c192am4.qv.daily_climo,     [3 2 1]))
ncwrite(fnout,'uas_c192am4',        permute(v.c192am4.uas.daily_climo,    [3 2 1]))
ncwrite(fnout,'vas_c192am4',        permute(v.c192am4.vas.daily_climo,    [3 2 1]))
ncwrite(fnout,'wsd_c192am4',        permute(v.c192am4.wsd.daily_climo,    [3 2 1]))

ncwrite(fnout,'pr_bias_gpcp13',     permute(v.c192am4.pr.bias.daily.gpcp13,     [3 2 1]))
ncwrite(fnout,'pr_bias_gpcp13_f',   permute(v.c192am4.pr.bias.daily.gpcp13_f,   [3 2 1]))
ncwrite(fnout,'pr_bias_gpcp32',     permute(v.c192am4.pr.bias.daily.gpcp32,     [3 2 1]))
ncwrite(fnout,'pr_bias_gpcp32_f',   permute(v.c192am4.pr.bias.daily.gpcp32_f,   [3 2 1]))
ncwrite(fnout,'pr_bias_gpm',        permute(v.c192am4.pr.bias.daily.gpm,        [3 2 1]))
ncwrite(fnout,'pr_bias_gpm_f',      permute(v.c192am4.pr.bias.daily.gpm_f,      [3 2 1]))
ncwrite(fnout,'pr_bias_mswep',      permute(v.c192am4.pr.bias.daily.mswep,      [3 2 1]))
ncwrite(fnout,'pr_bias_mswep_f',    permute(v.c192am4.pr.bias.daily.mswep_f,    [3 2 1]))
ncwrite(fnout,'pr_bias_era5',       permute(v.c192am4.pr.bias.daily.era5,       [3 2 1]))
ncwrite(fnout,'pr_bias_era5_f',     permute(v.c192am4.pr.bias.daily.era5_f,     [3 2 1]))

ncwrite(fnout,'ps_bias',            permute(v.c192am4.ps.bias.daily,            [3 2 1]))
ncwrite(fnout,'ps_bias_f',          permute(v.c192am4.ps.bias.daily_f,          [3 2 1]))
ncwrite(fnout,'ts_bias',            permute(v.c192am4.ts.bias.daily,            [3 2 1]))
ncwrite(fnout,'ts_bias_f',          permute(v.c192am4.ts.bias.daily_f,          [3 2 1]))
ncwrite(fnout,'tas_bias',           permute(v.c192am4.tas.bias.daily,           [3 2 1]))
ncwrite(fnout,'tas_bias_f',         permute(v.c192am4.tas.bias.daily_f,         [3 2 1]))
ncwrite(fnout,'tasmax_bias',        permute(v.c192am4.tasmax.bias.daily,        [3 2 1]))
ncwrite(fnout,'tasmax_bias_f',      permute(v.c192am4.tasmax.bias.daily_f,      [3 2 1]))
ncwrite(fnout,'vps_bias',           permute(v.c192am4.vps.bias.daily,           [3 2 1]))
ncwrite(fnout,'vps_bias_f',         permute(v.c192am4.vps.bias.daily_f,         [3 2 1]))
ncwrite(fnout,'vp_bias',            permute(v.c192am4.vp.bias.daily,            [3 2 1]))
ncwrite(fnout,'vp_bias_f',          permute(v.c192am4.vp.bias.daily_f,          [3 2 1]))
ncwrite(fnout,'vpd_bias',           permute(v.c192am4.vpd.bias.daily,           [3 2 1]))
ncwrite(fnout,'vpd_bias_f',         permute(v.c192am4.vpd.bias.daily_f,         [3 2 1]))
ncwrite(fnout,'rh_bias',            permute(v.c192am4.rh.bias.daily,            [3 2 1]))
ncwrite(fnout,'rh_bias_f',          permute(v.c192am4.rh.bias.daily_f,          [3 2 1]))
ncwrite(fnout,'qv_bias',            permute(v.c192am4.qv.bias.daily,            [3 2 1]))
ncwrite(fnout,'qv_bias_f',          permute(v.c192am4.qv.bias.daily_f,          [3 2 1]))
ncwrite(fnout,'uas_bias',           permute(v.c192am4.uas.bias.daily,           [3 2 1]))
ncwrite(fnout,'uas_bias_f',         permute(v.c192am4.uas.bias.daily_f,         [3 2 1]))
ncwrite(fnout,'vas_bias',           permute(v.c192am4.vas.bias.daily,           [3 2 1]))
ncwrite(fnout,'vas_bias_f',         permute(v.c192am4.vas.bias.daily_f,         [3 2 1]))
ncwrite(fnout,'wsd_bias',           permute(v.c192am4.wsd.bias.daily,           [3 2 1]))
ncwrite(fnout,'wsd_bias_f',         permute(v.c192am4.wsd.bias.daily_f,         [3 2 1]))
str=strcat('days since 1979-01-01 00:00:00'); 
ncwriteatt(fnout,'time','units',str);

return

%Save full data 
%epath=strcat('/work/miz/mat_hiresmip/land/');
%fext =strcat('_',num2str(yr1),'_',num2str(yr2));
%fnmat=strcat(epath,expn,fext,'_c192am4_bias_read_daily_obs_all.mat')
%save(fnmat,'v','-v7.3'); %save(fnmat,'v');
%Save climo data only
%v.prday_mswep=0; v.prday_c192am4=0;
%fnmat=strcat(tpath,expn,'/',expn,fext,'_read_daily_obs_climo_only.mat')
%save(fnmat,'v','-v7.3'); %save(fnmat,'v');

%Save only a few climo bias data
x=v.c192am4;

B.pr_mswep.bias     =x.pr.bias.daily.mswep;       %compare to ERA5
B.pr_mswep.bias_f30 =x.pr.bias.daily.mswep_f;     %compare to MSWEP
B.pr.bias           =x.pr.bias.daily.era5;        %compare to ERA5
B.pr.bias_f30       =x.pr.bias.daily.era5_f;      %compare to ERA5
B.tas.bias          =x.tas.bias.daily;
B.tas.bias_f30      =x.tas.bias.daily_f;
B.tasmax.bias       =x.tasmax.bias.daily;
B.tasmax.bias_f30   =x.tasmax.bias.daily_f;
B.rh.bias           =x.rh.bias.daily;
B.rh.bias_f30       =x.rh.bias_daily_f;
B.wsd.bias          =x.wsd.bias.daily;
B.wsd.bias_f30      =x.wsd.bias.daily_f;

fnmat=strcat(tpath,expn,'/',expn,fext,'_read_daily_obs_bias_only.mat')
save(fnmat,'B','-v7.3'); %save(fnmat,'v');

%  B.rh.bias_f30 =x.rh.bias_f30;  
%  B.wsd.bias_f30=x.wsd.bias_f30;
