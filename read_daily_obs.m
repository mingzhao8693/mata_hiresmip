function [v]=read_daily_obs(tpath,expn,yr1,yr2,pct,opt,diag,latlon)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath='/archive/Ming.Zhao/awg/2023.04/';
expn ='c192_obs'; yr1=1979; yr2=2020; opt=0; 
pct=[1 5 10 25 50 75 90 95 99 99.9 99.99 99.999]; latlon=[180 340 10 90]; latlon=[190 304 16 75]; diag=0;
latlon=[0 360 -90 90];

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

v.tpath=tpath; v.expn=expn; v.yr1=yr1; v.yr2=yr2; v.nyr=yr2-yr1+1;
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 surface precipitation%%%%
expn ='c192_obs'; v.yr1=1950; v.yr2=2007; v.nyr=v.yr2-v.yr1+1;  opt=0; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='skt'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:K
thresh=[]; v.era5.tsmax=extremes_ana(var,pct,thresh,0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 surface precipitation%%%%
expn ='c192_obs'; v.yr1=1979; v.yr2=2020; v.nyr=v.yr2-v.yr1+1;  opt=0; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='t2mmax'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:K
thresh=[]; v.era5.tasmax=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='tp'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff);
for k=1:length(var); var(k).a=var(k).a*1000; end; %unit:mm/day
thresh=[]; v.era5.pr=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 surface pressure%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='sp'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:K
for k=1:length(var); var(k).a=var(k).a*0.01; end; %unit:hPa
thresh=[]; v.era5.ps=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 temperature at 2m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='t2m'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:K
thresh=[]; v.era5.tas=extremes_ana(var,pct,thresh,1)
%compute ERA5 saturation vapor pressure (hPa) at TAS (K)
for k=1:length(var); var(k).a=es_t_array(var(k).a); end;
thresh=[]; v.era5.vps=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 dewpoint temperature at 2m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='d2m'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:K
thresh=[]; v.era5.tdp=extremes_ana(var,pct,thresh,1)
%compute ERA5 2m vapor pressure (hPa), which is the saturation vapor
%pressure at dewpoint because the dew point temperature (k) is the
%temperature to which air must cooled at constant pressure and
%water-vapor content for it to become saturated
for k=1:length(var); var(k).a=es_t_array(var(k).a); end;
thresh=[]; v.era5.vp=extremes_ana(var,pct,thresh,1)
%compute ERA5 2 m vapor pressure deficit vpd = vps -vp
for k=1:length(var); var(k).a=v.era5.vps.var(k).a-v.era5.vp.var(k).a; end;
for k=1:length(var); id=var(k).a<=0; var(k).a(id)=0;  end;
thresh=[]; v.era5.vpd=extremes_ana(var,pct,thresh,opt)
%compute ERA5 2 m relative humidity = vp / vps *100
for k=1:length(var); var(k).a=v.era5.vp.var(k).a./v.era5.vps.var(k).a*100; end; 
for k=1:length(var); id=var(k).a>=100; var(k).a(id)=100; end;
for k=1:length(var); id=var(k).a<=0;   var(k).a(id)=0;   end; 
thresh=[]; v.era5.rh=extremes_ana(var,pct,thresh,opt)
%compute ERA5 specific humididy at 2m (kg/kg)
for k=1:length(var);
  e=v.era5.vp.var(k).a; ps=v.era5.ps.var(k).a;
  var(k).a = 0.622.*e./(ps - 0.378.*e)
end; 
thresh=[]; v.era5.qv=extremes_ana(var,pct,thresh,opt); clear e ps;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 U at 2m (m/s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='u_ref'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5/');
exf1='ERA5.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:K
thresh=[]; v.era5.uas=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 V at 2m (m/s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='v_ref'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5/');
exf1='ERA5.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:K
thresh=[]; v.era5.vas=extremes_ana(var,pct,thresh,1)
%compute wind speed %%%%%%%%%%%
for k=1:length(var); var(k).a=sqrt(v.era5.uas.var(k).a.^2+v.era5.vas.var(k).a.^2); end;
thresh=[]; v.era5.wsd=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MSWEP precipitation
%v.expn ='c192_obs'; v.yr1=1979; v.yr2=1984; v.nyr=v.yr2-v.yr1+1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='precipitation'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_mswep/');
exf1='mswep.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:mm/day
thresh=[0.2 1 5 10 50 100 200 400 500];
v.mswep.pr=extremes_ana(var,pct,thresh,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%save ERA5 and other OBS data %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_obs_all.mat')
%save(fnmat,'v','-v7.3'); 
load(fnmat); 
v.era5=clearvar(v.era5,0);
fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_obs_climo.mat')
%save(fnmat,'v','-v7.3');
load(fnmat); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Model evaluations: dmget *.ps.nc *.tas.nc *huss.nc *hurs.nc *pr.nc *uas.nc *vas.nc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read C192AM4 daily data%%%%%%%
v.expn ='c192L33_am4p0_2010climo_newctl'; v.yr1=2; v.yr2=101; v.nyr=v.yr2-v.yr1+1;
%v.expn ='c192L33_am4p0_amip_HIRESMIP_nudge_wind_30min'; v.yr1=1979; v.yr2=2020; v.nyr=v.yr2-v.yr1+1;
%v.expn ='c192L33_CM4X_amip_15'; v.yr1=1979; v.yr2=2020; v.nyr=v.yr2-v.yr1+1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%surface pressure ps in unit of hPa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='ps'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff);
for k=1:length(var); var(k).a=var(k).a*0.01; end; %og.psday=var; %unit:hPa
thresh=[]; v.c192am4.ps=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TASMAX in unit of K
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='tasmax'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff);
thresh=[]; v.c192am4.tasmax=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TS in unit of K
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='ts'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff);
thresh=[]; v.c192am4.ts=extremes_ana(var,pct,thresh,0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TAS in unit of K
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='tas'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff);
thresh=[]; v.c192am4.tas=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute surface saturation vapor pressure vps in unit of hPa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:length(var); var(k).a=es_t_array(var(k).a); end;
%for k=1:length(var); var2(k).a=es_t_array_tetens(var(k).a); end;
%for k=1:length(var); var3(k).a=es_t_array_ardenbuck(var(k).a); end;
%for k=1:length(var); var3(k).a=es_t_array_goffgratch(var(k).a); end;
thresh=[]; v.c192am4.vps=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%surface humidity kg/kg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='huss'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:kg/kg
thresh=[]; v.c192am4.qv=extremes_ana(var,pct,thresh,opt) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute surface vapor pressure vp (hPa) from surface specific humidity huss
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:length(var); var(k).a=e_qp_array(var(k).a,v.c192am4.ps.var(k).a); end; 
thresh=[]; v.c192am4.vp=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute surface vapor pressure vp in unit of hPa from surface specific humidity huss
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:length(var); var(k).a=v.c192am4.vps.var(k).a-v.c192am4.vp.var(k).a; end;
for k=1:length(var); id=var(k).a<=0; var(k).a(id)=0;  end; %og.vpdday=var;
thresh=[]; v.c192am4.vpd=extremes_ana(var,pct,thresh,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in surface relative humidity (%)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='hurs'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); id=var(k).a>=100; var(k).a(id)=100; end;
for k=1:length(var); id=var(k).a<=0;   var(k).a(id)=0;   end; %og.rhday=var; %unit:%
thresh=[10:10:90]; v.c192am4.rh=extremes_ana(var,pct,thresh,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='pr'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); var(k).a=var(k).a*86400; end; %unit:mm/day
thresh=[0.2 1 5 10 50 100 200 400 500];
v.c192am4.pr=extremes_ana(var,pct,thresh,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='uas'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
thresh=[]; v.c192am4.uas=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='vas'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
thresh=[]; v.c192am4.vas=extremes_ana(var,pct,thresh,1)
%compute wind speed %%%%%%%%%%%
for k=1:length(var); var(k).a=sqrt(v.c192am4.uas.var(k).a.^2+v.c192am4.vas.var(k).a.^2); end;
thresh=[]; v.c192am4.wsd=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%v.c192am4=clearvar(v.c192am4,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute precipitation daily climatological biases
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v.c192am4.pr_mswep.bias=v.c192am4.pr.daily_climo    -v.mswep.pr.daily_climo;
v.c192am4.pr.bias      =v.c192am4.pr.daily_climo    -v.era5.pr.daily_climo;
v.c192am4.ps.bias      =v.c192am4.ps.daily_climo    -v.era5.ps.daily_climo;
v.c192am4.tas.bias     =v.c192am4.tas.daily_climo   -v.era5.tas.daily_climo;
v.c192am4.tasmax.bias  =v.c192am4.tasmax.daily_climo-v.era5.tasmax.daily_climo;
v.c192am4.vps.bias     =v.c192am4.vps.daily_climo   -v.era5.vps.daily_climo;
v.c192am4.vp.bias      =v.c192am4.vp.daily_climo    -v.era5.vp.daily_climo;
v.c192am4.vpd.bias     =v.c192am4.vpd.daily_climo   -v.era5.vpd.daily_climo;
v.c192am4.rh.bias      =v.c192am4.rh.daily_climo    -v.era5.rh.daily_climo;
v.c192am4.qv.bias      =v.c192am4.qv.daily_climo    -v.era5.qv.daily_climo;
v.c192am4.uas.bias     =v.c192am4.uas.daily_climo   -v.era5.uas.daily_climo;
v.c192am4.vas.bias     =v.c192am4.vas.daily_climo   -v.era5.vas.daily_climo;
v.c192am4.wsd.bias     =v.c192am4.wsd.daily_climo   -v.era5.wsd.daily_climo;

a=v.c192am4.pr_mswep.bias; v.c192am4.pr_mswep.bias_f15 =movmean(a,15,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.pr_mswep.bias; v.c192am4.pr_mswep.bias_f30 =movmean(a,30,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.pr.bias;       v.c192am4.pr.bias_f15       =movmean(a,15,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.pr.bias;       v.c192am4.pr.bias_f30       =movmean(a,30,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.ps.bias;       v.c192am4.ps.bias_f15       =movmean(a,15,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.ps.bias;       v.c192am4.ps.bias_f30       =movmean(a,30,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.tas.bias;      v.c192am4.tas.bias_f15      =movmean(a,15,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.tas.bias;      v.c192am4.tas.bias_f30      =movmean(a,30,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.tasmax.bias;   v.c192am4.tasmax.bias_f15   =movmean(a,15,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.tasmax.bias;   v.c192am4.tasmax.bias_f30   =movmean(a,30,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.vps.bias;      v.c192am4.vps.bias_f15      =movmean(a,15,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.vps.bias;      v.c192am4.vps.bias_f30      =movmean(a,30,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.vp.bias;       v.c192am4.vp.bias_f15       =movmean(a,15,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.vp.bias;       v.c192am4.vp.bias_f30       =movmean(a,30,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.vpd.bias;      v.c192am4.vpd.bias_f15      =movmean(a,15,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.vpd.bias;      v.c192am4.vpd.bias_f30      =movmean(a,30,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.rh.bias;       v.c192am4.rh.bias_f15       =movmean(a,15,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.rh.bias;       v.c192am4.rh.bias_f30       =movmean(a,30,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.qv.bias;       v.c192am4.qv.bias_f15       =movmean(a,15,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.qv.bias;       v.c192am4.qv.bias_f30       =movmean(a,30,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.uas.bias;      v.c192am4.uas.bias_f15      =movmean(a,15,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.uas.bias;      v.c192am4.uas.bias_f30      =movmean(a,30,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.vas.bias;      v.c192am4.vas.bias_f15      =movmean(a,15,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.vas.bias;      v.c192am4.vas.bias_f30      =movmean(a,30,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.wsd.bias;      v.c192am4.wsd.bias_f15      =movmean(a,15,1,'omitnan', 'Endpoints', 'fill');
a=v.c192am4.wsd.bias;      v.c192am4.wsd.bias_f30      =movmean(a,30,1,'omitnan', 'Endpoints', 'fill');

%Save full data
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_all.mat')
save(fnmat,'v','-v7.3'); %save(fnmat,'v');

%Save climo data only
v.c192am4=clearvar(v.c192am4,0)
v.era5   =clearvar(v.era5,   0)

fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_only.mat')
save(fnmat,'v','-v7.3'); %save(fnmat,'v');


%save(fnmat,'v','-v7.3'); %save(fnmat,'v');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%write results to netcdf file%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/';
fnout=strcat(tpath,expn,'/',expn,'_daily_climo_new1.nc')
%fnout=strcat('/work/miz/mat_hiresmip/',expn,'daily_climo_bias.nc');

nt=365; nlat=v.nlat; nlon=v.nlon; lat=v.lat; lon=v.lon;
cl=8; form='netcdf4'; time=[1:1:nt];
nccreate(fnout,'time','Dimensions',{'time' Inf},'Format',form);
nccreate(fnout,'lat', 'Dimensions',{'lat' nlat},'Format',form);
nccreate(fnout,'lon', 'Dimensions',{'lon' nlon},'Format',form);
nccreate(fnout,'pr_mswep',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_era5',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'ps_era5',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
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

nccreate(fnout,'pr_bias_mswep',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
%nccreate(fnout,'pr_bias_mswep_f15','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias_mswep_f30','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
%nccreate(fnout,'pr_bias_f15',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias_f30',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'ps_bias',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
%nccreate(fnout,'ps_bias_f15',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'ps_bias_f30',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tas_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
%nccreate(fnout,'tas_bias_f15',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tas_bias_f30',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tasmax_bias',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
%nccreate(fnout,'tasmax_bias_f15',  'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tasmax_bias_f30',  'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vps_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
%nccreate(fnout,'vps_bias_f15',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vps_bias_f30',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vp_bias',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
%nccreate(fnout,'vp_bias_f15',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vp_bias_f30',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vpd_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
%nccreate(fnout,'vpd_bias_f15',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vpd_bias_f30',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'rh_bias',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
%nccreate(fnout,'rh_bias_f15',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'rh_bias_f30',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'qv_bias',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
%nccreate(fnout,'qv_bias_f15',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'qv_bias_f30',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'uas_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
%nccreate(fnout,'uas_bias_f15',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'uas_bias_f30',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vas_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
%nccreate(fnout,'vas_bias_f15',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vas_bias_f30',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'wsd_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
%nccreate(fnout,'wsd_bias_f15',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'wsd_bias_f30',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

ncwrite(fnout,'time', time(:));
ncwrite(fnout,'lat',  lat);
ncwrite(fnout,'lon',  lon); x=v.c192am4;;
ncwrite(fnout,'pr_mswep',         permute(v.mswep.pr.daily_climo,       [3 2 1]))
ncwrite(fnout,'pr_era5',          permute(v.era5.pr.daily_climo,        [3 2 1]))
ncwrite(fnout,'ps_era5',          permute(v.era5.ps.daily_climo,        [3 2 1]))
ncwrite(fnout,'tas_era5',         permute(v.era5.tas.daily_climo,       [3 2 1]))
ncwrite(fnout,'tasmax_era5',      permute(v.era5.tasmax.daily_climo,    [3 2 1]))
ncwrite(fnout,'vps_era5',         permute(v.era5.vps.daily_climo,       [3 2 1]))
ncwrite(fnout,'vp_era5',          permute(v.era5.vp.daily_climo,        [3 2 1]))
ncwrite(fnout,'vpd_era5',         permute(v.era5.vpd.daily_climo,       [3 2 1]))
ncwrite(fnout,'rh_era5',          permute(v.era5.rh.daily_climo,        [3 2 1]))
ncwrite(fnout,'qv_era5',          permute(v.era5.qv.daily_climo,        [3 2 1]))
ncwrite(fnout,'uas_era5',         permute(v.era5.uas.daily_climo,       [3 2 1]))
ncwrite(fnout,'vas_era5',         permute(v.era5.vas.daily_climo,       [3 2 1]))
ncwrite(fnout,'wsd_era5',         permute(v.era5.wsd.daily_climo,       [3 2 1]))

ncwrite(fnout,'pr_c192am4',       permute(v.c192am4.pr.daily_climo,     [3 2 1]))
ncwrite(fnout,'ps_c192am4',       permute(v.c192am4.ps.daily_climo,     [3 2 1]))
ncwrite(fnout,'tas_c192am4',      permute(v.c192am4.tas.daily_climo,    [3 2 1]))
ncwrite(fnout,'tasmax_c192am4',   permute(v.c192am4.tasmax.daily_climo, [3 2 1]))
ncwrite(fnout,'vps_c192am4',      permute(v.c192am4.vps.daily_climo,    [3 2 1]))
ncwrite(fnout,'vp_c192am4',       permute(v.c192am4.vp.daily_climo,     [3 2 1]))
ncwrite(fnout,'vpd_c192am4',      permute(v.c192am4.vpd.daily_climo,    [3 2 1]))
ncwrite(fnout,'rh_c192am4',       permute(v.c192am4.rh.daily_climo,     [3 2 1]))
ncwrite(fnout,'qv_c192am4',       permute(v.c192am4.qv.daily_climo,     [3 2 1]))
ncwrite(fnout,'uas_c192am4',      permute(v.c192am4.uas.daily_climo,    [3 2 1]))
ncwrite(fnout,'vas_c192am4',      permute(v.c192am4.vas.daily_climo,    [3 2 1]))
ncwrite(fnout,'wsd_c192am4',      permute(v.c192am4.wsd.daily_climo,    [3 2 1]))

ncwrite(fnout,'pr_bias_mswep',     permute(v.c192am4.pr_mswep.bias,     [3 2 1]))
%ncwrite(fnout,'pr_bias_mswep_f15', permute(v.c192am4.pr_mswep.bias_f15, [3 2 1]))
ncwrite(fnout,'pr_bias_mswep_f30', permute(v.c192am4.pr_mswep.bias_f30, [3 2 1]))
ncwrite(fnout,'pr_bias',           permute(v.c192am4.pr.bias,           [3 2 1]))
%ncwrite(fnout,'pr_bias_f15',       permute(v.c192am4.pr.bias_f15,       [3 2 1]))
ncwrite(fnout,'pr_bias_f30',       permute(v.c192am4.pr.bias_f30,       [3 2 1]))
ncwrite(fnout,'ps_bias',           permute(v.c192am4.ps.bias,           [3 2 1]))
%ncwrite(fnout,'ps_bias_f15',       permute(v.c192am4.ps.bias_f15,       [3 2 1]))
ncwrite(fnout,'ps_bias_f30',       permute(v.c192am4.ps.bias_f30,       [3 2 1]))
ncwrite(fnout,'tas_bias',          permute(v.c192am4.tas.bias,          [3 2 1]))
%ncwrite(fnout,'tas_bias_f15',      permute(v.c192am4.tas.bias_f15,      [3 2 1]))
ncwrite(fnout,'tas_bias_f30',      permute(v.c192am4.tas.bias_f30,      [3 2 1]))
ncwrite(fnout,'tasmax_bias',       permute(v.c192am4.tasmax.bias,       [3 2 1]))
%ncwrite(fnout,'tasmax_bias_f15',   permute(v.c192am4.tasmax.bias_f15,   [3 2 1]))
ncwrite(fnout,'tasmax_bias_f30',   permute(v.c192am4.tasmax.bias_f30,   [3 2 1]))
ncwrite(fnout,'vps_bias',          permute(v.c192am4.vps.bias,          [3 2 1]))
%ncwrite(fnout,'vps_bias_f15',      permute(v.c192am4.vps.bias_f15,      [3 2 1]))
ncwrite(fnout,'vps_bias_f30',      permute(v.c192am4.vps.bias_f30,      [3 2 1]))
ncwrite(fnout,'vp_bias',           permute(v.c192am4.vp.bias,           [3 2 1]))
%ncwrite(fnout,'vp_bias_f15',       permute(v.c192am4.vp.bias_f15,       [3 2 1]))
ncwrite(fnout,'vp_bias_f30',       permute(v.c192am4.vp.bias_f30,       [3 2 1]))
ncwrite(fnout,'vpd_bias',          permute(v.c192am4.vpd.bias,          [3 2 1]))
%ncwrite(fnout,'vpd_bias_f15',      permute(v.c192am4.vpd.bias_f15,      [3 2 1]))
ncwrite(fnout,'vpd_bias_f30',      permute(v.c192am4.vpd.bias_f30,      [3 2 1]))
ncwrite(fnout,'rh_bias',           permute(v.c192am4.rh.bias,           [3 2 1]))
%ncwrite(fnout,'rh_bias_f15',       permute(v.c192am4.rh.bias_f15,       [3 2 1]))
ncwrite(fnout,'rh_bias_f30',       permute(v.c192am4.rh.bias_f30,       [3 2 1]))
ncwrite(fnout,'qv_bias',           permute(v.c192am4.qv.bias,           [3 2 1]))
%ncwrite(fnout,'qv_bias_f15',       permute(v.c192am4.qv.bias_f15,       [3 2 1]))
ncwrite(fnout,'qv_bias_f30',       permute(v.c192am4.qv.bias_f30,       [3 2 1]))
ncwrite(fnout,'uas_bias',          permute(v.c192am4.uas.bias,          [3 2 1]))
%ncwrite(fnout,'uas_bias_f15',      permute(v.c192am4.uas.bias_f15,      [3 2 1]))
ncwrite(fnout,'uas_bias_f30',      permute(v.c192am4.uas.bias_f30,      [3 2 1]))
ncwrite(fnout,'vas_bias',          permute(v.c192am4.vas.bias,          [3 2 1]))
%ncwrite(fnout,'vas_bias_f15',      permute(v.c192am4.vas.bias_f15,      [3 2 1]))
ncwrite(fnout,'vas_bias_f30',      permute(v.c192am4.vas.bias_f30,      [3 2 1]))
ncwrite(fnout,'wsd_bias',          permute(v.c192am4.wsd.bias,          [3 2 1]))
%ncwrite(fnout,'wsd_bias_f15',      permute(v.c192am4.wsd.bias_f15,      [3 2 1]))
ncwrite(fnout,'wsd_bias_f30',      permute(v.c192am4.wsd.bias_f30,      [3 2 1]))
str=strcat('days since 1979-01-01 00:00:00'); 
ncwriteatt(fnout,'time','units',str);

%Save full data 
epath=strcat('/work/miz/mat_hiresmip/land/');
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(epath,expn,fext,'_c192am4_bias_read_daily_obs_all.mat')
save(fnmat,'v','-v7.3'); %save(fnmat,'v');

%Save climo data only
v.prday_mswep=0; v.prday_c192am4=0;
fnmat=strcat(tpath,expn,'/',expn,fext,'_read_daily_obs_climo_only.mat')
save(fnmat,'v','-v7.3'); %save(fnmat,'v');


%Save only climo bias only
x=v.c192am4;

B.pr_mswep.bias     =x.pr_mswep.bias;      %compare to ERA5
B.pr_mswep.bias_f30 =x.pr_mswep.bias_f30;  %compare to MSWEP
B.pr.bias           =x.pr.bias;            %compare to ERA5
B.pr.bias_f30       =x.pr.bias_f30;        %compare to ERA5
B.tas.bias          =x.tas.bias;
B.tas.bias_f30      =x.tas.bias_f30;
B.tasmax.bias       =x.tasmax.bias;
B.tasmax.bias_f30   =x.tasmax.bias_f30;
B.rh.bias           =x.rh.bias;
B.rh.bias_f30       =x.rh.bias_f30;
B.wsd.bias          =x.wsd.bias;
B.wsd.bias_f30      =x.wsd.bias_f30;

fnmat=strcat(tpath,expn,'/',expn,fext,'_read_daily_obs_bias_only.mat')
save(fnmat,'B','-v7.3'); %save(fnmat,'v');

%  B.rh.bias_f30 =x.rh.bias_f30;  
%  B.wsd.bias_f30=x.wsd.bias_f30;
