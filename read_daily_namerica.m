function [v]=read_daily_namerica(tpath,expn,yr1,yr2,pct,opt,diag,latlon)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath='/archive/Ming.Zhao/awg/2023.04/';
expn ='c192L33_am4p0_2010climo_newctl'; yr1=2; yr2=5; opt='RO';
pct  =[25 50 75 90 95 99 99.9 99.99]; latlon=[180 340 10 90]; latlon=[190 304 16 75]; diag=0;

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
% $$$ v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
% $$$ R0=6371.0e3; dtor=1./180.*pi;
% $$$ dlat=v.lat(round(v.nlat/2))-v.lat(round(v.nlat/2)-1);
% $$$ dlon=v.lon(round(v.nlon/2))-v.lon(round(v.nlon/2)-1);
% $$$ for i=1:v.nlat
% $$$   rad=v.lat(i)*dtor; %rad1=(v.lat(i)-0.5*dlat)*dtor;
% $$$   v.aa0(i,1:v.nlon)=(R0*cos(rad)*dlon*dtor) * (R0*dlat*dtor);
% $$$   v.dx (i,1:v.nlon)=(R0*cos(rad)*dlon*dtor);
% $$$   v.dy (i,1:v.nlon)=(R0*dlat*dtor);
% $$$   v.f  (i,1:v.nlon)= 2*pi/86400*sin(rad);
% $$$ end
% $$$ %i=v.nlat; rad1=(v.lat(i)+0.5*dlat)*dtor; v.dx1(i+1,1:v.nlon)=(R0*cos(rad1)*dlon*dtor);
amean=mean(mean(v.aa0));
v.aa = v.aa0/amean;
%fn='/home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_hiresmip/ca_precip_annual_mean_ERAI_grid.nc';
%a=ncread(fn,'precip'); a=a'; v.id_ca_org=a; a=a(v.ys:v.ye,v.xs:v.xe); v.id_ca=(a>0);

v.tpath=tpath; v.expn=expn; v.yr1=yr1; v.yr2=yr2; v.nyr=yr2-yr1+1;

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
%surface pressure ps in unit of hPa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='ps'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff);
for k=1:length(var); var(k).a=var(k).a*0.01; end; og.psday=var; %unit:hPa
thresh=[800 900 1000];
v.psday=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='pr'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); var(k).a=var(k).a*86400; end; og.prday=var; %unit:mm/day
thresh=[0.2 1 5 10 50 100 200 400 500];
v.prday=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='tas'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); var(k).a=var(k).a-273.15; end; og.tasday=var; %unit:C
thresh=[30 35 40]; 
v.tasday=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute surface saturation vapor pressure vps in unit of hPa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:length(var); var(k).a=es_t_array(var(k).a+273.15); end;
%for k=1:length(var); var2(k).a=es_t_array_tetens(var(k).a+273.15); end;
%for k=1:length(var); var3(k).a=es_t_array_ardenbuck(var(k).a+273.15); end;
%for k=1:length(var); var3(k).a=es_t_array_goffgratch(var(k).a+273.15); end;
og.vpsday=var;
thresh=[30 35 40]; v.vpsday=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%surface humidity kg/kg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='huss'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); og.qvday=var; %unit:kg/kg
thresh=[1 2 3]; v.qvday=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute surface vapor pressure vp (hPa) from surface specific humidity huss
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:length(var); var(k).a=e_qp_array(var(k).a,og.psday(k).a); end; og.vpday=var;
thresh=[20 30 40];
v.vpday=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute surface vapor pressure vp in unit of hPa from surface specific humidity huss
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:length(var); var(k).a=og.vpsday(k).a-og.vpday(k).a; end;
for k=1:length(var); id=var(k).a<=0; var(k).a(id)=0;  end; og.vpdday=var;
thresh=[5 10 20 30 40]; v.vpdday=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute surface relative humidity based on vapor pressure and saturation vapor pressure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:length(var); var(k).a=og.vpday(k).a./og.vpsday(k).a*100; end; 
for k=1:length(var); id=var(k).a>=100; var(k).a(id)=100; end;
for k=1:length(var); id=var(k).a<=0;   var(k).a(id)=0;   end; og.rhxday=var; %unit:%
thresh=[5 10 20 30 40]; v.rhxday=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in surface relative humidity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='hurs'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %
for k=1:length(var); id=var(k).a>=100; var(k).a(id)=100; end;
for k=1:length(var); id=var(k).a<=0;   var(k).a(id)=0;   end;
og.rhday=var; %unit:%
thresh=[5 10 20 30 40]; v.rhday=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute dewpoint and wet bulb temperatures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:length(var)
  tas  =og.tasday(k).a;    %unit: C
  rhday=og.rhday(k).a*0.01;%change unit from %(0-100) to fraction(0-1)
  psday=og.psday(k).a*0.1; %change unit from hPa to kPa
  var(k).a=dewpoint_frostpoint(tas,rhday); og.tdpday(k)=var(k);
  var(k).a=wetbulb_vec(tas,rhday,psday);   og.twbday(k)=var(k);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='sfcWind'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); og.wsdday=var; %unit:m/s
thresh=[10 20 30];
v.wsdday=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% daily max and min
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='tasmax'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); var(k).a=var(k).a-273.15; end; og.tasmaxday=var; %unit:C
thresh=[30 35 40]; 
v.tasmaxday=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='hursmax'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); id=var(k).a>=100; var(k).a(id)=100; end;
for k=1:length(var); id=var(k).a<=0;   var(k).a(id)=0;   end;
og.rhmaxday=var; thresh=[20 30 40];
v.rhmaxday=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='hursmin'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); id=var(k).a>=100; var(k).a(id)=100; end;
for k=1:length(var); id=var(k).a<=0;   var(k).a(id)=0;   end;
og.rhminday=var; thresh=[20 30 40];
v.rhminday=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='sfcWindmax'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); og.wsdmax=var; %unit:m/s
thresh=[10 20 30];
v.wsdmax=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute Canadian FWI along with FFMC, DMC, DC, ISI, BUI, FWI and DSR
%using daily mean TAS and wind speed
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lat2d=repmat(v.lat,[1 v.nlon]); %latitude of the data
for k=1:length(og.prday)
  mn=og.prday (k).mmon;    %month of the day
  pr=og.prday (k).a;       %precip,            unit: mm per day
  ta=og.tasday(k).a;       %temperature,       unit: C
  rh=og.rhday (k).a;       %relative humidity, unit: %
  wm=og.wsdday(k).a*0.001*3600; %change unit from m/s to km/h
  a=fwi2D_vectorized(mn,ta,rh,pr,wm,lat2d,{'FFMC','DMC','DC','ISI','BUI','FWI','DSR'});
  var1(k).a=a;
end
n=length(var);
for k=1:n; var(k).a=var1(k).a.FFMC; end; og.fwiday.ffmc=var; v.fwiday.ffmc=extremes_ana(var,pct,thresh);
for k=1:n; var(k).a=var1(k).a.DMC;  end; og.fwiday.dmc =var; v.fwiday.dmc =extremes_ana(var,pct,thresh);
for k=1:n; var(k).a=var1(k).a.DC;   end; og.fwiday.dc  =var; v.fwiday.dc  =extremes_ana(var,pct,thresh);
for k=1:n; var(k).a=var1(k).a.ISI;  end; og.fwiday.isi =var; v.fwiday.isi =extremes_ana(var,pct,thresh);
for k=1:n; var(k).a=var1(k).a.BUI;  end; og.fwiday.bui =var; v.fwiday.bui =extremes_ana(var,pct,thresh);
for k=1:n; var(k).a=var1(k).a.FWI;  end; og.fwiday.fwi =var; v.fwiday.fwi =extremes_ana(var,pct,thresh);
for k=1:n; var(k).a=var1(k).a.DSR;  end; og.fwiday.dsr =var; v.fwiday.dsr =extremes_ana(var,pct,thresh);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute Canadian FWI along with FFMC, DMC, DC, ISI, BUI, FWI and DSR
%using daily max TAS and wind speed, and min RH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lat2d=repmat(v.lat,[1 v.nlon]); %latitude of the data
for k=1:length(og.prday)
  mn=(og.prday(k).mmon)';    %month of the day
  pr=og.prday(k).a;          %precip,            unit: mm per day
  ta=og.tasmaxday(k).a;      %temperature,       unit: C
  rh=og.rhminday(k).a;       %relative humidity, unit: %
  wm=og.windmaxday(k).a*0.001*3600; %change unit from m/s to km/h
  a=fwi2D_vectorized(mn,ta,rh,pr,wm,lat2d,{'FFMC','DMC','DC','ISI','BUI','FWI','DSR'});
  var1(k).a=a;
end
n=length(var);
for k=1:n; var(k).a=var1(k).a.FFMC; end; og.fwidaymax.ffmc=var; v.fwidaymax.ffmc=extremes_ana(var,pct,thresh);
for k=1:n; var(k).a=var1(k).a.DMC;  end; og.fwidaymax.dmc =var; v.fwidaymax.dmc =extremes_ana(var,pct,thresh);
for k=1:n; var(k).a=var1(k).a.DC;   end; og.fwidaymax.dc  =var; v.fwidaymax.dc  =extremes_ana(var,pct,thresh);
for k=1:n; var(k).a=var1(k).a.ISI;  end; og.fwidaymax.isi =var; v.fwidaymax.isi =extremes_ana(var,pct,thresh);
for k=1:n; var(k).a=var1(k).a.BUI;  end; og.fwidaymax.bui =var; v.fwidaymax.bui =extremes_ana(var,pct,thresh);
for k=1:n; var(k).a=var1(k).a.FWI;  end; og.fwidaymax.fwi =var; v.fwidaymax.fwi =extremes_ana(var,pct,thresh);
for k=1:n; var(k).a=var1(k).a.DSR;  end; og.fwidaymax.dsr =var; v.fwidaymax.dsr =extremes_ana(var,pct,thresh);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%test plotting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=1; k=5; vx=v.fwiday;
a=squeeze(vx.ffmc.pct(m,k,:,:)); figure; pcolor(a); shading flat; colorbar; caxis([0 110]); colormap(jet);
a=squeeze(vx.dmc.pct (m,k,:,:)); figure; pcolor(a); shading flat; colorbar; caxis([0 200]); colormap(jet);
a=squeeze(vx.dc.pct  (m,k,:,:)); figure; pcolor(a); shading flat; colorbar; caxis([0 1000]);colormap(jet);
a=squeeze(vx.isi.pct (m,k,:,:)); figure; pcolor(a); shading flat; colorbar; caxis([0 20]);  colormap(jet);
a=squeeze(vx.bui.pct (m,k,:,:)); figure; pcolor(a); shading flat; colorbar; caxis([0 200]); colormap(jet);
a=squeeze(vx.fwi.pct (m,k,:,:)); figure; pcolor(a); shading flat; colorbar; caxis([0 70]);  colormap(jet);
a=squeeze(vx.dsr.pct (m,k,:,:)); figure; pcolor(a); shading flat; colorbar; caxis([0 50]);  colormap(jet);

m=3; vx=v.fwiday_max;
a=squeeze(vx.fwi.av(m,:,:)); figure; pcolor(a); shading flat; colorbar; caxis([0 10]); colormap(jet);
a=squeeze(vx.dmc.pct (m,k,:,:)); figure; pcolor(a); shading flat; colorbar; caxis([0 20]);  colormap(jet);
a=squeeze(vx.dc.pct  (m,k,:,:)); figure; pcolor(a); shading flat; colorbar; caxis([0 20]);  colormap(jet);
a=squeeze(vx.isi.pct (m,k,:,:)); figure; pcolor(a); shading flat; colorbar; caxis([0 100]); colormap(jet);
a=squeeze(vx.bui.pct (m,k,:,:)); figure; pcolor(a); shading flat; colorbar; caxis([0 20]);  colormap(jet);
a=squeeze(vx.fwi.pct (m,k,:,:)); figure; pcolor(a); shading flat; colorbar; caxis([0 50]);  colormap(jet);
a=squeeze(vx.dsr.pct (m,k,:,:)); figure; pcolor(a); shading flat; colorbar; caxis([0 20]);  colormap(jet);

a=squeeze(v.windmaxday.pct (m,k,:,:)); figure; pcolor(a); shading flat; colorbar; caxis([0 20]); colormap(jet);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute FWI using a statistical log-linear regression model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:length(og.prday)
  pr=og.prday(k).a;  %unit: mm/day
  ta=og.tasday(k).a; %unit: C
  rh=og.rhday(k).a;  %unit: %
  wm=og.windday(k).a*0.001*3600; %change unit from m/s to km/h
  a=estimate_fwi_regression(ta,rh,wm,pr); var(k).a=a;
end
thresh=[1 10 20 30]; og.fwiday_stat=var;
v.fwiday_stat=extremes_ana(var,pct,thresh);
%compute FWIMAXDAY%%%%%%%%%%%%%
for k=1:length(og.prday)
  pr=og.prday(k).a;                 %daily precipitation
  ta=og.tasmaxday(k).a;             %daily maximum SAT
  rh=og.rhmaxday(k).a;              %daily maximum RH
  wm=og.windmaxday(k).a*0.001*3600; %daily maximum 10m wind speed
  a=estimate_fwi_regression(ta,rh,wm,pr); var(k).a=a;
end
thresh=[1 10 20 30]; og.fwimaxday_stat=var;
v.fwimaxday_stat=extremes_ana(var,pct,thresh);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Other variables%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='pr'; ff='3hr'; exd=strcat('/',atmos_data_dir,'/3hr/');
exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); var(k).a=var(k).a*86400; end; %unit:mm/day
thresh=[0.2 1 5 10 50 100 200 400 500];
v.pr3hr=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%River flow%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='rv_o_h2o'; ff='day'; exd='/atmos_data/daily_river/'; exf1='river.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); var(k).a=var(k).a*86400; end; og.rvfday=var; %kg/m2/s
thresh=[0.2 1 5 10 50 100 200 400 500];
v.rvfday=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Land total runoff%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='runf_soil'; ff='day'; exd='/atmos_data/daily_land/'; exf1='land.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); var(k).a=var(k).a*86400; end; og.runfday=var; %kg/m2/s
thresh=[0.2 1 5 10 50 100 200 400 500];
v.runfday=extremes_ana(var,pct,thresh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v.og=og;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
epath=strcat('/work/miz/mat_hiresmip/land/');
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(epath,expn,fext,'_',opt,'_diag',num2str(diag),'_read_daily_namerica_new.mat')

save(fnmat,'v','-v7.3'); %save(fnmat,'v');

return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%the following plotting and comparing fwi1D and fwi2D_vectorized
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lat=v.lat; lon=v.lon; t1=1; t2=1000; j=80; i=42;
tas=og.tasday.a  (t1:t2,i,j);
twb=og.twbday.a  (t1:t2,i,j);
tdp=og.tdpday.a  (t1:t2,i,j);
vps=og.vpsday.a  (t1:t2,i,j);
vp =og.vpday.a   (t1:t2,i,j);
vpd=og.vpdday.a  (t1:t2,i,j);
rhd=og.rhday.a   (t1:t2,i,j);
rhx=og.rhxday.a  (t1:t2,i,j);
rmx=og.rhmaxday.a(t1:t2,i,j);
rmn=og.rhminday.a(t1:t2,i,j);
prd=og.prday.a   (t1:t2,i,j);
psd=og.psday.a   (t1:t2,i,j);
wsd=og.wsdday.a  (t1:t2,i,j);%*0.001*3600;
wmx=og.wsdmax.a  (t1:t2,i,j);%*0.001*3600;
z=og.fwiday.ffmc.a; z1=z(t1:t2,i,j);
z=og.fwiday.dmc.a;  z2=z(t1:t2,i,j);
z=og.fwiday.dc.a;   z3=z(t1:t2,i,j);
z=og.fwiday.isi.a;  z4=z(t1:t2,i,j);
z=og.fwiday.bui.a;  z5=z(t1:t2,i,j);
z=og.fwiday.fwi.a;  z6=z(t1:t2,i,j);
z=og.fwiday.dsr.a;  z7=z(t1:t2,i,j);

figure; i=1; row=6; col=1; t=[t1:t2]; %t=t./30;
subplot(row,col,i); i=i+1; plot(t,tas,'r'); hold on; plot(t,twb,'g'); plot(t,tdp,'b'); ylabel('TA, TWB, TDP');
subplot(row,col,i); i=i+1; plot(t,vps,'r'); hold on; plot(t,vp, 'g'); plot(t,vpd,'b'); ylabel('VPS, VP, VPD');
subplot(row,col,i); i=i+1; plot(t,rhd,'r'); hold on; plot(t,rhx,'g'); plot(t,rmn,'b'); plot(t,rmx,'k'); ylabel('RHD, RHX,RMX,RMN');
subplot(row,col,i); i=i+1; plot(t,prd); ylabel('Pr');
subplot(row,col,i); i=i+1; plot(t,psd); ylabel('Ps');
subplot(row,col,i); i=i+1; plot(t,wsd,'r'); hold on; plot(t,wmx,'g'); ylabel('WSD');

figure; i=1; row=7; col=1;
subplot(row,col,i); i=i+1; plot(t,z1); ylabel('FFMC');
subplot(row,col,i); i=i+1; plot(t,z2); ylabel('DMC');
subplot(row,col,i); i=i+1; plot(t,z3); ylabel('DC');
subplot(row,col,i); i=i+1; plot(t,z4); ylabel('ISI');
subplot(row,col,i); i=i+1; plot(t,z5); ylabel('BUI');
subplot(row,col,i); i=i+1; plot(t,z6); ylabel('FWI');
subplot(row,col,i); i=i+1; plot(t,z7); ylabel('DSR');

t=100;
z=og.fwiday.ffmc.a; z1=squeeze(z(t,:,:));
z=og.fwiday.dmc.a;  z2=squeeze(z(t,:,:));
z=og.fwiday.dc.a;   z3=squeeze(z(t,:,:));
z=og.fwiday.isi.a;  z4=squeeze(z(t,:,:));
z=og.fwiday.bui.a;  z5=squeeze(z(t,:,:));
z=og.fwiday.fwi.a;  z6=squeeze(z(t,:,:));
z=og.fwiday.dsr.a;  z7=squeeze(z(t,:,:));

pms=[ 0, 0, 2000, 800]*1.2; fsize=12; row=2; col=4; j=80; i=42;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1);
pcolor(lon,lat,z1); shading flat; colorbar; hold on; colormap(jet);
contour(lon,lat,v.lm,'w'); hold on; plot(lon(j),lat(i),'wp'); 


n=length(ta); mo=zeros(n,1); mo(:)=og.prday(k).mmon(t1:t2);
out=fwi1D(mo,ta,rh,pr,wd,45,{'FFMC','DMC','DC','ISI','BUI','FWI','DSR'})
%%%%%%%%%%%%%%%%%%%%%%%%
ta=og.tasday.a; rh=og.rhday.a; pr=og.prday.a; wd=og.windday.a*0.001*3600;
lat2d=repmat(v.lat,[1 v.nlon]); mn=(og.prday(k).mmon); 
o2d=fwi2D_vectorized(mn,ta,rh,pr,wd,lat2d,{'FFMC','DMC','DC','ISI','BUI','FWI','DSR'})
figure; plot(t,out(:,1),'r*'); hold on; plot(t,o2d.FFMC(t1:t2,i,j),'-bs')
figure; plot(t,out(:,2),'r*'); hold on; plot(t,o2d.DMC (t1:t2,i,j),'-bs')
figure; plot(t,out(:,3),'r*'); hold on; plot(t,o2d.DC  (t1:t2,i,j),'-bs')
figure; plot(t,out(:,4),'r*'); hold on; plot(t,o2d.ISI (t1:t2,i,j),'-bs')
figure; plot(t,out(:,5),'r*'); hold on; plot(t,o2d.BUI (t1:t2,i,j),'-bs')
figure; plot(t,out(:,6),'r*'); hold on; plot(t,o2d.FWI (t1:t2,i,j),'-bs')
figure; plot(t,out(:,7),'r*'); hold on; plot(t,o2d.DSR (t1:t2,i,j),'-bs')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%end of the test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


tpath='/archive/Ming.Zhao/awg/2023.04/'; opt='extremes'; diag=0;
pct=[25 50 75 90 95 99 99.9 99.99 99.999]; latlon=[190 304 16 75]; yr1=2; yr2=101; 
expn='c192L33_am4p0_2010climo_newctl';                  v=read_daily_namerica(tpath,expn,yr1,yr2,pct,opt,diag,latlon)
expn='c192L33_am4p0_2010climo_newctl_p1K';              v=read_daily_namerica(tpath,expn,yr1,yr2,pct,opt,diag,latlon)
expn='c192L33_am4p0_2010climo_newctl_4xCO2';            v=read_daily_namerica(tpath,expn,yr1,yr2,pct,opt,diag,latlon)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear';   v=read_daily_namerica(tpath,expn,yr1,yr2,pct,opt,diag,latlon)
expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2'; v=read_daily_namerica(tpath,expn,yr1,yr2,pct,opt,diag,latlon)

%load results%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ph='/work/miz/mat_hiresmip/land/'; f='_2_101_RO_diag0_read_daily_namerica_new.mat';
e='c192L33_am4p0_2010climo_newctl';                 n=strcat(ph,e,f); load(n);z.v0=v;
e='c192L33_am4p0_2010climo_newctl_p1K';             n=strcat(ph,e,f); load(n);z.w0=v; 
%e='c192L33_am4p0_2010climo_newctl_4xCO2';           n=strcat(ph,e,f); load(n);z.g0=v; 
e='c192L33_am4p0_2010climo_trend_1979_2020_spear';  n=strcat(ph,e,f); load(n);z.w1=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_times_2';n=strcat(ph,e,f); load(n);z.w2=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'}; isea=7; %1-7=ANN,MAM,JJA,SON,DJF,NDJFM,MJJA
a0='Present-day'; a1='SPEAR-pattern M'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='land_heat'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
del=' $\Delta$'; s0='TAS;'; s1='RHS; '; s2='PET; '; s3='(PET/P); ';
p.s0 =strcat(a0,'~(',p.sea,');~',s0); p.s1 =strcat(a1,';~',del,s0); p.s2 =strcat(a2,';~',del,s0); 
p.s3 =strcat(s1); p.s4 =strcat(del,s1); p.s5 =strcat(del,s1); 
p.s6 =strcat(s2); p.s7 =strcat(del,s2); p.s8 =strcat(del,s2); 
p.s9 =strcat(s3); p.s10=strcat(del,s3); p.s11=strcat(del,s3);
p.unit0 ='$\rm{^{\circ}C}$';    p.unit0_bar ='\rm{^{\circ}C}';
p.unit1 ='$\rm{KK^{-1}}$';      p.unit1_bar ='\rm{KK^{-1}}';
p.unit3 ='$\rm{\%}$';           p.unit3_bar ='\rm{%}'; 
p.unit4 ='$\rm{\% K^{-1}}$';    p.unit4_bar ='\rm{% K^{-1}}'; 
p.unit6 ='$\rm{mm day^{-1}}$';  p.unit6_bar ='\rm{mm day^{-1}}';
p.unit7 ='$\rm{mm day^{-1}K^{-1}}$';  p.unit7_bar ='\rm{mm day^{-1} K^{-1}}';
p.unit9 ='$\rm{}$';             p.unit9_bar ='\rm{}'; 
p.unit10='$\rm{K^{-1}}$';       p.unit10_bar='\rm{K^{-1}}'; 

p.cmin0= 0.0; p.cmax0=25;  p.cmin1 =-3.0;  p.cmax1=3.0;
p.cmin3= 0.0; p.cmax3=100; p.cmin4 =-10.0; p.cmax4 =10.0;
p.cmin6= 0.0; p.cmax6=5.;  p.cmin7 =-0.2;  p.cmax7 =0.2;
p.cmin9= 0.0; p.cmax9=2.;  p.cmin10=-1.0;  p.cmax10=1.0;

v=z.v0; p.lm=v.lm; aa=v.aa; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
p.dT1=1; p.dT2=1;  aa=aa/mean(mean(aa)); 

id=p.lm; id(id<0.5)=false; id(id>=0.5)=true; isig=id; ipct=7;

m=1;
a0=squeeze(z.v0.roday.pct(m,ipct,:,:));  
a1=squeeze(z.w1.roday.pct(m,ipct,:,:));
a2=squeeze(z.w2.roday.pct(m,ipct,:,:));
a=a0;            p.v0=a; p.dv1=mean(a(id==1).*aa(id==1)); p.isig1=isig;
a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id==1).*aa(id==1)); p.isig1=isig;
a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id==1).*aa(id==1)); p.isig2=isig;


a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
if (p.do_bias); p.v3=squeeze(z.v0.sfc.rhref.sea_bias(isea,:,:)); p.cmin3= -20.0; p.cmax3=20; end;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa); p.isig4=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa); p.isig5=isig;
%PET: Potential Evapotranspiration
%v=z.v0.sfc; a=get4season_all(v.evap.all/LV0*86400); a=squeeze(a(:,isea,:,:)); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
%v=z.w1.sfc; a=get4season_all(v.evap.all/LV0*86400); a=squeeze(a(:,isea,:,:)); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
%v=z.w2.sfc; a=get4season_all(v.evap.all/LV0*86400); a=squeeze(a(:,isea,:,:)); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=N;
%v=z.v0.sfc; a=get4season_all(v.shflx.all); a=squeeze(a(:,isea,:,:)); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
%v=z.w1.sfc; a=get4season_all(v.shflx.all); a=squeeze(a(:,isea,:,:)); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
%v=z.w2.sfc; a=get4season_all(v.shflx.all); a=squeeze(a(:,isea,:,:)); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=N;
v=z.v0.sfc; a=get4season_all(v.netrad.all/LV0*86400); a=squeeze(a(:,isea,:,:)); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.w1.sfc; a=get4season_all(v.netrad.all/LV0*86400); a=squeeze(a(:,isea,:,:)); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
v=z.w2.sfc; a=get4season_all(v.netrad.all/LV0*86400); a=squeeze(a(:,isea,:,:)); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=N;
a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
if (p.do_bias); p.v6=squeeze(z.v0.sfc.evap.sea_bias(isea,:,:))/LV0*86400; p.cmin6= -0.5; p.cmax6=0.5; end;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa); p.isig7=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa); p.isig8=isig;
%PET/P: aridity index
%v=z.v0.sfc; a=get4season_all(v.netrad.all/LV0*86400); x=0; a(a<x)=x; a=get4season_all(v.pcp.all)./a; a=squeeze(a(:,isea,:,:)); a(a>100)=100; a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
%v=z.w1.sfc; a=get4season_all(v.netrad.all/LV0*86400); x=0; a(a<x)=x; a=get4season_all(v.pcp.all)./a; a=squeeze(a(:,isea,:,:)); a(a>100)=100; a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
%v=z.w2.sfc; a=get4season_all(v.netrad.all/LV0*86400); x=0; a(a<x)=x; a=get4season_all(v.pcp.all)./a; a=squeeze(a(:,isea,:,:)); a(a>100)=100; a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=N;
v=z.v0.sfc; a=get4season_all(v.netrad.all/LV0*86400); x=0; a(a<x)=x; a=a./get4season_all(v.pcp.all); a=squeeze(a(:,isea,:,:)); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.w1.sfc; a=get4season_all(v.netrad.all/LV0*86400); x=0; a(a<x)=x; a=a./get4season_all(v.pcp.all); a=squeeze(a(:,isea,:,:)); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
v=z.w2.sfc; a=get4season_all(v.netrad.all/LV0*86400); x=0; a(a<x)=x; a=a./get4season_all(v.pcp.all); a=squeeze(a(:,isea,:,:)); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=N;
%MRSOS: surface moisture
%v=z.v0.sfc; a=get4season_all(v.mrsos.all); a=squeeze(a(:,isea,:,:)); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
%v=z.w1.sfc; a=get4season_all(v.mrsos.all); a=squeeze(a(:,isea,:,:)); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
%v=z.w2.sfc; a=get4season_all(v.mrsos.all); a=squeeze(a(:,isea,:,:)); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=N;
a=a0; p.v9=a; p.dv9=mean(a(id).*aa);
if (p.do_bias); p.v9=squeeze(z.v0.sfc.netrad.sea_bias(isea,:,:))/LV0*86400; p.cmin9= -0.5; p.cmax9=0.5; end;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v10=a; p.dv10=mean(a(id).*aa); p.isig10=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v11=a; p.dv11=mean(a(id).*aa); p.isig11=isig;
plot_pattern_effect_Fig_land_16panel(p)
%lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];
%plot_pattern_effect_Fig_land_16panel(p);




let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON','NDJFM','MJJAS'}; lm=z.v0.lm; co='k';
[lat,lon]=borders('continental us'); us.lat=lat; us.lon=lon; us.co='k-'; lw=0.1;
for k=1:length(lon); us.lon{k}=us.lon{k}+360; end;
pms=[ 0, 0, 1500, 1500]*1; fsize=10; row=4; col=3; minus=char(8212);
handle = figure('Position', pms,'visible','on'); 
nn=256;  cmap=bluewhitered_miz(nn); colormap(cmap); %colormap(jet); 

x=z.v0.lon; y=z.v0.lat; lat1=16; lat2=75; lon1=190; lon2=304; xy=[lon1 lon2 lat1 lat2];
s0='Present-day'; s1='SPEAR-pattern M'; s2='Observed-pattern';
unit0='$\rm{kg m^{-2} day^{-1} K^{-1}}$'; unit1='\%';

ipct=9; pct=[25 50 75 90 95 99 99.9 99.99 99.999]; i=1;
pcttile={'25','50','75','90','95','99','99.9','99.99','99.999'};
pctt=strcat(pcttile{ipct},'th percentile');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); sx=let(i)+s0; i=i+1; m=1;
a0=squeeze(z.v0.roday.pct(m,ipct,:,:)); %figure; pcolor(a0); shading flat; colorbar;
a1=squeeze(z.w1.roday.pct(m,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =a0;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{m}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,i); sx=let(i)+s1; i=i+1;
a0=squeeze(z.v0.roday.pct(m,ipct,:,:)); %figure; pcolor(a0); shading flat; colorbar;
a1=squeeze(z.w1.roday.pct(m,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =(a1-a0)./a0*100;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{m}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,i); sx=let(i)+s2; i=i+1;
a1=squeeze(z.w2.roday.pct(m,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =(a1-a0)./a0*100;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{m}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); sx=let(i); i=i+1;  m=2; 
a0=squeeze(z.v0.roday.pct(m,ipct,:,:)); %figure; pcolor(a0); shading flat; colorbar;
a1=squeeze(z.w1.roday.pct(m,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =a0;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{m}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,i); sx=let(i); i=i+1;  
a0=squeeze(z.v0.roday.pct(m,ipct,:,:)); %figure; pcolor(a0); shading flat; colorbar;
a1=squeeze(z.w1.roday.pct(m,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =(a1-a0)./a0*100;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{m}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,i); sx=let(i); i=i+1;
a1=squeeze(z.w2.roday.pct(m,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =(a1-a0)./a0*100;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{m}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); sx=let(i); i=i+1; m=3; %JJA
a0=squeeze(z.v0.roday.pct(m,ipct,:,:)); %figure; pcolor(a0); shading flat; colorbar;
a1=squeeze(z.w1.roday.pct(m,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =a0;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{m}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,i); sx=let(i); i=i+1; 
a0=squeeze(z.v0.roday.pct(m,ipct,:,:)); %figure; pcolor(a0); shading flat; colorbar;
a1=squeeze(z.w1.roday.pct(m,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =(a1-a0)./a0*100;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{m}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,i); sx=let(i); i=i+1;
a1=squeeze(z.w2.roday.pct(m,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =(a1-a0)./a0*100;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{m}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); sx=let(i); i=i+1; m=4; %SON
a0=squeeze(z.v0.roday.pct(m,ipct,:,:)); %figure; pcolor(a0); shading flat; colorbar;
a1=squeeze(z.w1.roday.pct(m,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =a0;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{m}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,i); sx=let(i); i=i+1;
a0=squeeze(z.v0.roday.pct(m,ipct,:,:)); %figure; pcolor(a0); shading flat; colorbar;
a1=squeeze(z.w1.roday.pct(m,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =(a1-a0)./a0*100;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{m}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,i); sx=let(i); i=i+1;
a1=squeeze(z.w2.roday.pct(m,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =(a1-a0)./a0*100;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{m}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

expn='pattern_effect_extremes'; visfig='off'; figpath='./fig_land/'; %figpath='./fig_spearhi8/'; 
vname=strcat(p.vname,'_',num2str(p.do_bias));
printnew(visfig,figpath,expn,vname);



