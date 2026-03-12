function [v]=read_daily_obs(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/awg/2023.04/'; expn ='c192_obs'; opt=0;
%yr1=1979; yr2=1979; do_trend=0; %yr1=1950; yr2=2020; 
%pct=[0.1 1 5 10 25 50 75 90 95 99 99.9];
%latlon=[0 360 -90 90]; %latlon=[180 340 10 90]; latlon=[190 304 16 75];

atmos_data_dir='atmos_data';
if strcmp(atmos_data_dir,'atmos_data_240_480')
  fn=strcat(tpath,expn,'/atmos_static_240_480.nc'); 
else
  fn=strcat(tpath,expn,'/atmos.static.nc');
end
disp(fn);

v=readts_grid_2d(tpath,expn,fn,latlon,'c192'); v.latlon=latlon;
a=ncread(fn,'land_mask'); v.lm_org=a';
a=a(v.xs:v.xe,v.ys:v.ye); a=a';  %figure; pcolor(a); shading flat; colorbar;
v.lm=a; v.lm(v.lm>=0.5)=1; v.lm(v.lm<0.5)=0; 
amean=mean(mean(v.aa0)); v.aa = v.aa0/amean;

v.tpath=tpath; v.expn=expn; v.yr1=yr1; v.yr2=yr2; v.nyr=yr2-yr1+1; v.tyr=[yr1:yr2]';
v.pct=pct; v.opt=opt;

yea=[365];                                 ddd=cumsum(yea); d.beg_yea=[0 ddd(1:end-1)]+1; d.end_yea=ddd;
hyr=[90 183 92];                           ddd=cumsum(hyr); d.beg_hyr=[0 ddd(1:end-1)]+1; d.end_hyr=ddd;
sea=[59 92 92 91 31];                      ddd=cumsum(sea); d.beg_sea=[0 ddd(1:end-1)]+1; d.end_sea=ddd;
mon=[31 28 31 30 31 30 31 31 30 31 30 31]; ddd=cumsum(mon); d.beg_mon=[0 ddd(1:end-1)]+1; d.end_mon=ddd;

v.do_yea=1; v.do_hyr=0; v.do_sea=0; v.do_mon=0;
if v.do_mon
  v.d_beg=d.beg_mon; v.d_end=d.end_mon; v.mon=mon;
elseif v.do_sea
  v.d_beg=d.beg_sea; v.d_end=d.end_sea; v.sea=sea;
elseif v.do_hyr
  v.d_beg=d.beg_hyr; v.d_end=d.end_hyr; v.hyr=hyr;
else
  v.d_beg=d.beg_yea; v.d_end=d.end_yea; v.yea=yea;
end
m=0; %read annual data all together; m=1-12 read monthly data one at a time
nbin=[]; v.do_trend=do_trend;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 surface skin temperature
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='skt'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5_remapcon/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:K
thresh=[]; v.era5.ts=extremes_ana(var,pct,thresh,nbin,do_trend,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 2m maximum temperature
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='t2mmax'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5_remapcon/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:K
thresh=[]; v.era5.tasmax=extremes_ana(var,pct,thresh,nbin,do_trend,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 surface pressure%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='sp'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5_remapcon/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:K
for k=1:length(var); var(k).a=var(k).a*0.01; end; %unit:hPa
thresh=[]; v.era5.ps=extremes_ana(var,pct,thresh,nbin,do_trend,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 temperature at 2m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='t2m'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5_remapcon/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:K
thresh=[]; v.era5.tas=extremes_ana(var,pct,thresh,nbin,do_trend,1)
%compute ERA5 saturation vapor pressure (hPa) at TAS (K)
for k=1:length(var); var(k).a=es_t_array(var(k).a); end;
thresh=[]; v.era5.vps=extremes_ana(var,pct,thresh,nbin,do_trend,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 dewpoint temperature at 2m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='d2m'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5_remapcon/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:K
thresh=[]; v.era5.tdp=extremes_ana(var,pct,thresh,nbin,do_trend,opt)
%compute ERA5 2m vapor pressure (hPa), which is the saturation vapor
%pressure at dewpoint because the dew point temperature (k) is the
%temperature to which air must cooled at constant pressure and
%water-vapor content for it to become saturated
for k=1:length(var); var(k).a=es_t_array(var(k).a); end;
thresh=[]; v.era5.vp=extremes_ana(var,pct,thresh,nbin,do_trend,1)
%compute ERA5 2 m vapor pressure deficit vpd = vps -vp
for k=1:length(var); var(k).a=v.era5.vps.var(k).a-v.era5.vp.var(k).a; end;
for k=1:length(var); id=var(k).a<=0; var(k).a(id)=0;  end;
thresh=[]; v.era5.vpd=extremes_ana(var,pct,thresh,nbin,do_trend,opt)
%compute ERA5 2 m relative humidity = vp / vps *100
for k=1:length(var); var(k).a=v.era5.vp.var(k).a./v.era5.vps.var(k).a*100; end; 
for k=1:length(var); id=var(k).a>=100; var(k).a(id)=100; end;
for k=1:length(var); id=var(k).a<=0;   var(k).a(id)=0;   end; 
thresh=[]; v.era5.rh=extremes_ana(var,pct,thresh,nbin,do_trend,opt)
%compute ERA5 specific humididy at 2m (kg/kg)
for k=1:length(var);
  e=v.era5.vp.var(k).a; ps=v.era5.ps.var(k).a;
  var(k).a = 0.622.*e./(ps - 0.378.*e)
end; 
thresh=[]; v.era5.qv=extremes_ana(var,pct,thresh,nbin,do_trend,opt); clear e ps;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 U at 10m (m/s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='u10'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5_remapcon/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:m/s
thresh=[]; v.era5.uas=extremes_ana(var,pct,thresh,nbin,do_trend,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 V at 10m (m/s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='v10'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5_remapcon/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:m/s
thresh=[]; v.era5.vas=extremes_ana(var,pct,thresh,nbin,do_trend,1)
%compute wind speed at 10m%%%%%
for k=1:length(var); var(k).a=sqrt(v.era5.uas.var(k).a.^2+v.era5.vas.var(k).a.^2); end;
thresh=[]; v.era5.wsd=extremes_ana(var,pct,thresh,nbin,do_trend,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 U at 10m (m/s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%varn='u_ref'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5/');
%exf1='ERA5.'; exf2='0101-'; exf3='1231.';
%var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:K
%thresh=[]; v.era5.uas=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 V at 10m (m/s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%varn='v_ref'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5/');
%exf1='ERA5.'; exf2='0101-'; exf3='1231.';
%var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:K
%thresh=[]; v.era5.vas=extremes_ana(var,pct,thresh,1)
%compute wind speed %%%%%%%%%%%
%for k=1:length(var); var(k).a=sqrt(v.era5.uas.var(k).a.^2+v.era5.vas.var(k).a.^2); end;
%thresh=[]; v.era5.wsd=extremes_ana(var,pct,thresh,nbin,do_trend,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 surface precipitation%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='tp'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5_remapcon/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff);
for k=1:length(var); var(k).a=var(k).a*1000; end; %unit:mm/day
thresh=[]; v.era5.pr=extremes_ana(var,pct,thresh,nbin,do_trend,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%other precipitation data %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MSWEP precipitation original res: 0.1x0.1, remapped conservatively to c192_grid(0.625x0.5)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v.expn ='c192_obs'; varn='precipitation'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_mswep_remapcon/');
exf1='mswep.'; exf2='0101-'; exf3='1231.';
if v.nyr==1;
  v.yr1=2020; v.yr2=2020; v.nyr=v.yr2-v.yr1+1; 
else
  v.yr1=1979; v.yr2=2020; v.nyr=v.yr2-v.yr1+1; 
end;
v.tyr=[v.yr1:v.yr2]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:mm/day
thresh=[0.2 1 5 10 50 100 200 400 500];
v.mswep.pr=extremes_ana(var,pct,thresh,nbin,do_trend,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GPCP precip original res: 1x1, remapped conservatively to c192_grid(0.625x0.5)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v.expn ='c192_obs'; varn='precip'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_gpcpday13_remapcon/');
exf1='GPCP_daily.'; exf2='0101-'; exf3='1231.';
if v.nyr==1;
  v.yr1=2020; v.yr2=2020; v.nyr=v.yr2-v.yr1+1;
else
  v.yr1=1997; v.yr2=2020; v.nyr=v.yr2-v.yr1+1;
end;
v.tyr=[v.yr1:v.yr2]';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:mm/day
for k=1:length(var); b=var(k).a; var(k).a(b<0 | isnan(b))=0; end; %set missing value to 0
thresh=[0.2 1 5 10 50 100 200 400 500];
v.gpcp.pr13=extremes_ana(var,pct,thresh,nbin,do_trend,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GPCPDAY3.2 precip: original res: 0.5x0.5, remapped conservatively to c192_grid(0.625x0.5)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v.expn ='c192_obs'; varn='precip'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_gpcpday32_remapcon/');
exf1='GPCPDAY_L3.'; exf2='0101-'; exf3='1231.';
if v.nyr==1;
  v.yr1=2020; v.yr2=2020; v.nyr=v.yr2-v.yr1+1;
else
  v.yr1=2001; v.yr2=2020; v.nyr=v.yr2-v.yr1+1;
end;
v.tyr=[v.yr1:v.yr2]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:mm/day
for k=1:length(var); b=var(k).a; var(k).a(b<0 | isnan(b))=0; end; %set missing value to 0
thresh=[0.2 1 5 10 50 100 200 400 500];
v.gpcp.pr32=extremes_ana(var,pct,thresh,nbin,do_trend,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GPM-IMERG precip: original res:0.1x0.1, remapped conservatively to c192_grid(0.625x0.5) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v.expn ='c192_obs'; varn='precip'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_gpm_imerg_remapcon/');
exf1='GPM_IMERG_Daily.'; exf2='0101-'; exf3='1231.';
if v.nyr==1;
  v.yr1=2020; v.yr2=2020; v.nyr=v.yr2-v.yr1+1;
else
  v.yr1=2000; v.yr2=2020; v.nyr=v.yr2-v.yr1+1;
end;
v.tyr=[v.yr1:v.yr2]';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:mm/day
for k=1:length(var); b=var(k).a; var(k).a(b<0 | isnan(b))=0; end; %set missing value to 0
thresh=[0.2 1 5 10 50 100 200 400 500];
v.gpm.pr=extremes_ana(var,pct,thresh,nbin,do_trend,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%save all obs datat to .mat file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_obs_all.mat')
save(fnmat,'v','-v7.3'); %load(fnmat); 
varlist={'tp','tasmaxday','twbday','vpdday'}; v.era5=clearvar(v.era5,0,varlist);
fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_obs_climo.mat')
save(fnmat,'v','-v7.3'); %load(fnmat); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%write results to netcdf file%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/';
fnout=strcat(tpath,expn,'/',expn,fext,'_daily_climo_obs_climo.nc')

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

ncwrite(fnout,'time', time(:));
ncwrite(fnout,'lat',  lat);
ncwrite(fnout,'lon',  lon);
ncwrite(fnout,'pr_gpcp13',        permute(v.gpcp.pr13.daily_climo.daily,      [3 2 1]))
ncwrite(fnout,'pr_gpcp32',        permute(v.gpcp.pr32.daily_climo.daily,      [3 2 1]))
ncwrite(fnout,'pr_gpm',           permute(v.gpm.pr.daily_climo.daily,         [3 2 1]))
ncwrite(fnout,'pr_mswep',         permute(v.mswep.pr.daily_climo.daily,       [3 2 1]))
ncwrite(fnout,'pr_era5',          permute(v.era5.pr.daily_climo.daily,        [3 2 1]))
ncwrite(fnout,'ps_era5',          permute(v.era5.ps.daily_climo.daily,        [3 2 1]))
ncwrite(fnout,'tas_era5',         permute(v.era5.tas.daily_climo.daily,       [3 2 1]))
ncwrite(fnout,'ts_era5',          permute(v.era5.ts.daily_climo.daily,        [3 2 1]))
ncwrite(fnout,'tasmax_era5',      permute(v.era5.tasmax.daily_climo.daily,    [3 2 1]))
ncwrite(fnout,'vps_era5',         permute(v.era5.vps.daily_climo.daily,       [3 2 1]))
ncwrite(fnout,'vp_era5',          permute(v.era5.vp.daily_climo.daily,        [3 2 1]))
ncwrite(fnout,'vpd_era5',         permute(v.era5.vpd.daily_climo.daily,       [3 2 1]))
ncwrite(fnout,'rh_era5',          permute(v.era5.rh.daily_climo.daily,        [3 2 1]))
ncwrite(fnout,'qv_era5',          permute(v.era5.qv.daily_climo.daily,        [3 2 1]))
ncwrite(fnout,'uas_era5',         permute(v.era5.uas.daily_climo.daily,       [3 2 1]))
ncwrite(fnout,'vas_era5',         permute(v.era5.vas.daily_climo.daily,       [3 2 1]))
ncwrite(fnout,'wsd_era5',         permute(v.era5.wsd.daily_climo.daily,       [3 2 1]))

str=strcat('days since 1979-01-01 00:00:00'); 
ncwriteatt(fnout,'time','units',str);

