function [v]=fwihw_ana_obs(tpath,expn,yr1,yr2,pct,latlon,opt,init_fwiday)
%[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/awg/2023.04/';
%expn ='c192_obs'; yr1=1979; yr2=1979; opt=1;
%pct=[90 95 99]; latlon=[180 340 10 90]; latlon=[190 304 16 75]; latlon=[0 360 -90 90]; diag=0;
%init_fwiday=[];

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

v.lm=single(v.lm); v.lm_org=single(v.lm_org); v.aa=single(v.aa); v.aa0=single(v.aa0);

v.tpath=tpath; v.expn=expn; v.yr1=yr1; v.yr2=yr2; v.nyr=yr2-yr1+1;

yea=[365]; ddd=cumsum(yea); d.beg_yea=[0 ddd(1:end-1)]+1; d.end_yea=ddd;

v.do_yea=1; v.d_beg=d.beg_yea; v.d_end=d.end_yea; v.yea=yea;

m=0; pct=[0.01 0.1 99.9]; nbin=[]; %read annual data all together; m=1-12 read monthly data one at a time

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%daily surface precipitation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='tp'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5_remapcon/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); var(k).a=var(k).a*1000; end; %unit:mm/day
thresh=[]; v.prday=extremes_ana(var,pct,thresh,nbin,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 surface pressure%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='sp'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5_remapcon/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:K
for k=1:length(var); var(k).a=var(k).a*0.01; end; %unit:hPa
thresh=[]; v.psday=extremes_ana(var,pct,thresh,nbin,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%daily surface air temperature
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='t2m'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5_remapcon/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff);  %unit:K
for k=1:length(var); var(k).a=var(k).a-273.15; end; %change unit to C
thresh=[]; v.tasday=extremes_ana(var,pct,thresh,nbin,1);
%compute ERA5 saturation vapor pressure (hPa) at TAS (K)
for k=1:length(var); var(k).a=es_t_array(var(k).a+273.15); end;
thresh=[]; v.vpsday=extremes_ana(var,pct,thresh,nbin,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 dewpoint temperature at 2m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='d2m'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5_remapcon/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:K
thresh=[]; v.tdpday=extremes_ana(var,pct,thresh,nbin,opt)
%compute ERA5 2m vapor pressure (hPa), which is the saturation vapor
%pressure at dewpoint because the dew point temperature (k) is the
%temperature to which air must cooled at constant pressure and
%water-vapor content for it to become saturated
for k=1:length(var); var(k).a=es_t_array(var(k).a); end;
thresh=[]; v.vpday=extremes_ana(var,pct,thresh,nbin,1)
%compute ERA5 2 m vapor pressure deficit vpd = vps -vp
for k=1:length(var); var(k).a=v.vpsday.var(k).a-v.vpday.var(k).a; end;
for k=1:length(var); id=var(k).a<=0; var(k).a(id)=0;  end;
thresh=[]; v.vpdday=extremes_ana(var,pct,thresh,nbin,opt)
%compute ERA5 2 m relative humidity = vp / vps *100
for k=1:length(var); var(k).a=v.vpday.var(k).a./v.vpsday.var(k).a*100; end; 
for k=1:length(var); id=var(k).a>=100; var(k).a(id)=100; end;
for k=1:length(var); id=var(k).a<=0;   var(k).a(id)=0;   end; 
thresh=[]; v.rhday=extremes_ana(var,pct,thresh,nbin,opt)
%compute ERA5 specific humididy at 2m (kg/kg)
for k=1:length(var);
  e=v.vpday.var(k).a; ps=v.psday.var(k).a;
  var(k).a = 0.622.*e./(ps - 0.378.*e)
end; 
thresh=[]; v.qvday=extremes_ana(var,pct,thresh,nbin,opt); clear e ps;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 U at 10m (m/s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='u10'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5_remapcon/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:m/s
thresh=[]; v.uasday=extremes_ana(var,pct,thresh,nbin,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA5 V at 10m (m/s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='v10'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_era5_remapcon/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:m/s
thresh=[]; v.vasday=extremes_ana(var,pct,thresh,nbin,1)
%compute wind speed at 10m%%%%%
for k=1:length(var); var(k).a=sqrt(v.uasday.var(k).a.^2+v.vasday.var(k).a.^2); end;
thresh=[]; v.wsdday=extremes_ana(var,pct,thresh,nbin,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% daily maximum surface temperature
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='t2mmax'; ff='day';exd=strcat('/',atmos_data_dir,'/daily_era5_remapcon/');
exf1='ERA5_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); var(k).a=var(k).a-273.15; end; 
thresh=[30 35 40]; v.tasmaxday=extremes_ana(var,pct,thresh,nbin,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute Canadian FWI along with FFMC, DMC, DC, ISI, BUI, FWI and DSR
%using daily mean TAS Pr RH and wind speed and stored in fwiday structure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'computing FWI...'
lat2d=repmat(v.lat,[1 v.nlon]); %latitude of the data
for k=1:length(v.prday.var)
  mn=v.prday.var (k).mofy;         %month of the day
  pr=v.prday.var (k).a;            %daily mean precip,            unit: mm per day
  ta=v.tasday.var(k).a;            %daily mean temperature,       unit: C
  rh=v.rhday.var (k).a;            %daily mean relative humidity, unit: %
  wm=v.wsdday.var(k).a*0.001*3600; %daily mean wind, unit changed from m/s to km/h
  a=fwi2D_vectorized(mn,ta,rh,pr,wm,lat2d,{'FFMC','DMC','DC','ISI','BUI','FWI','DSR'},init_fwiday);
  var1(k).a=a;
end
n=length(var1);
for k=1:n; var(k).a=var1(k).a.FFMC; end; v.fwiday.ffmc=extremes_ana(var,pct,thresh,nbin,opt);
for k=1:n; var(k).a=var1(k).a.DMC;  end; v.fwiday.dmc =extremes_ana(var,pct,thresh,nbin,opt);
for k=1:n; var(k).a=var1(k).a.DC;   end; v.fwiday.dc  =extremes_ana(var,pct,thresh,nbin,opt);
for k=1:n; var(k).a=var1(k).a.ISI;  end; v.fwiday.isi =extremes_ana(var,pct,thresh,nbin,opt);
for k=1:n; var(k).a=var1(k).a.BUI;  end; v.fwiday.bui =extremes_ana(var,pct,thresh,nbin,opt);
for k=1:n; var(k).a=var1(k).a.FWI;  end; v.fwiday.fwi =extremes_ana(var,pct,thresh,nbin,opt);
for k=1:n; var(k).a=var1(k).a.DSR;  end; v.fwiday.dsr =extremes_ana(var,pct,thresh,nbin,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%save initial condition for FFMC, DMC and DC for fwiday calculation%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=v.fwiday; v.init_fwiday=[a.ffmc.var.a(end,:,:); a.dmc.var.a(end,:,:); a.dc.var.a(end,:,:)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

return



