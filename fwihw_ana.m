function [v]=fwihw_ana(tpath,expn,yr1,yr2,pct,latlon,opt)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/awg/2023.04/';
%expn ='c192L33_am4p0_2010climo_newctl'; yr1=2; yr2=3; opt=1;
%pct  =[90 95]; latlon=[180 340 10 90]; latlon=[190 304 16 75]; diag=0;

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

m=0; %read annual data all together; m=1-12 read monthly data one at a time

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%daily surface air temperature
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='tas'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); var(k).a=var(k).a-273.15; end; %og.tasday=var; %unit:C
thresh=[30 35 40]; 
v.tasday=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%daily surface precipitation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='pr'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); var(k).a=var(k).a*86400; end; %og.prday=var; %unit:mm/day
thresh=[0.2 1 5 10 50 100 200 400 500];
v.prday=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%daily surface relative humidity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='hurs'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %
for k=1:length(var); id=var(k).a>=100; var(k).a(id)=100; end;
for k=1:length(var); id=var(k).a<=0;   var(k).a(id)=0;   end; %og.rhday=var; %unit:%
thresh=[5 10 20 30 40]; v.rhday=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%daily surface wind speed
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='sfcWind'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %og.wsdday=var; %unit:m/s
thresh=[10 20 30]; v.wsdday=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% daily maximum surface temperature relative humidity wind speed, and mininum relative humidity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='tasmax'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); var(k).a=var(k).a-273.15; end; %og.tasmaxday=var; %unit:C
thresh=[30 35 40]; v.tasmaxday=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%varn='hursmax'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
%exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
%var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
%for k=1:length(var); id=var(k).a>=100; var(k).a(id)=100; end;
%for k=1:length(var); id=var(k).a<=0;   var(k).a(id)=0;   end; %og.rhmaxday=var;
%thresh=[20 30 40]; v.rhmaxday=extremes_ana(var,pct,thresh,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='hursmin'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); id=var(k).a>=100; var(k).a(id)=100; end;
for k=1:length(var); id=var(k).a<=0;   var(k).a(id)=0;   end; %og.rhminday=var;
thresh=[20 30 40]; v.rhminday=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='sfcWindmax'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %og.wsdmax=var; %unit:m/s
thresh=[10 20 30]; v.wsdmaxday=extremes_ana(var,pct,thresh,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute Canadian FWI along with FFMC, DMC, DC, ISI, BUI, FWI and DSR
%using daily mean TAS Pr RH and wind speed and stored in fwiday structure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lat2d=repmat(v.lat,[1 v.nlon]); %latitude of the data
for k=1:length(v.prday.var)
  mn=v.prday.var (k).mofy;         %month of the day
  pr=v.prday.var (k).a;            %daily mean precip,            unit: mm per day
  ta=v.tasday.var(k).a;            %daily mean temperature,       unit: C
  rh=v.rhday.var (k).a;            %daily mean relative humidity, unit: %
  wm=v.wsdday.var(k).a*0.001*3600; %daily mean wind, unit changed from m/s to km/h
  a=fwi2D_vectorized(mn,ta,rh,pr,wm,lat2d,{'FFMC','DMC','DC','ISI','BUI','FWI','DSR'});
  var1(k).a=a;
end
n=length(var1);
for k=1:n; var(k).a=var1(k).a.FFMC; end; v.fwiday.ffmc=extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.DMC;  end; v.fwiday.dmc =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.DC;   end; v.fwiday.dc  =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.ISI;  end; v.fwiday.isi =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.BUI;  end; v.fwiday.bui =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.FWI;  end; v.fwiday.fwi =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.DSR;  end; v.fwiday.dsr =extremes_ana(var,pct,thresh,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute Canadian FWI along with FFMC, DMC, DC, ISI, BUI, FWI and DSR
%using daily maximum TAS and wind speed, and daily mininum RH and stored in fwidaymax
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lat2d=repmat(v.lat,[1 v.nlon]); %latitude of the data
for k=1:length(v.prday.var)
  mn=v.prday.var(k).mofy;          %month of the day
  pr=v.prday.var(k).a;             %daily mean precip,               unit: mm per day
  ta=v.tasmaxday.var(k).a;         %daily maximum temperature,       unit: C
  rh=v.rhminday.var(k).a;          %daily minimum relative humidity, unit: %
  wm=v.wsdmaxday.var(k).a*0.001*3600; %daily maximum windspeed, unit changed from m/s to km/h
  a=fwi2D_vectorized(mn,ta,rh,pr,wm,lat2d,{'FFMC','DMC','DC','ISI','BUI','FWI','DSR'});
  var1(k).a=a;
end
n=length(var);
for k=1:n; var(k).a=var1(k).a.FFMC; end; v.fwidaymax.ffmc=extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.DMC;  end; v.fwidaymax.dmc =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.DC;   end; v.fwidaymax.dc  =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.ISI;  end; v.fwidaymax.isi =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.BUI;  end; v.fwidaymax.bui =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.FWI;  end; v.fwidaymax.fwi =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.DSR;  end; v.fwidaymax.dsr =extremes_ana(var,pct,thresh,opt);

return
