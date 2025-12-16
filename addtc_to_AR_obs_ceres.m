function [v]=addtc_to_AR_obs_ceres(tpath,expn,yr1,yr2,opt,Tb_th,Tbb_th)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/awg/warsaw_201803/'; opt='mod'; Tb_th=-30
%expn='c192L33_am4p0_2010climo_new_newpp'; ardir='AR_climlmt'; yr1=2;yr2=101;
%expn ='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; yr1=1951; yr2=1978; opt='mod';
%expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_2'; yr1=2015;yr2=2015;
%tpath='/archive/Ming.Zhao/backup/ECMWF/'; Tb_th=-30;
%expn ='ERAI_6h_DATA'; yr1=2001; yr2=2001; pct=[99 99.9]; opt='obs';

epath='/analysis_allstorms/allstorms_wsfc/';
fn=strcat(tpath,expn,epath,expn,'_traj.mat');
%load(fn); v1=plottraj_obs(v,2001,90,1)

latbnd=30; wind_th=17; twc_th=2; vort_th=1.6*10^(-4); nday=3;
[ve,vt,vx,vy]=get_tsyearly(fn,opt,latbnd,wind_th,twc_th,vort_th,nday); %year=1950; id=create_tcid(vx,year)
if (yr1<1000)
  ve.tyear=ve.tyear-1980;
  vt.tyear=vt.tyear-1980;
  vx.tyear=vx.tyear-1980;
  vy.tyear=vy.tyear-1980;
end
%vt.tr=vt.yr(36).ts; plottraj_obs(vt,1985,90,0)
 
fn=strcat(tpath,expn,'/atmos_static_240_480.nc'); 
v.lon=ncread(fn,'lon'); v.lat=ncread(fn,'lat'); lon=v.lon; lat=v.lat;
a=ncread(fn,'land_mask'); v.lm=a';
%if strcmp(opt,'obs')
%  lat=ncread(fn,'lat'); lat=flipud(lat); v.lat=lat;
%  a=ncread(fn,'land_mask'); a=a'; v.lm=flipud(a);
%else
%  v.lat=ncread(fn,'lat'); a=ncread(fn,'land_mask'); v.lm=a';
%end
v.lm(v.lm>=0.5)=1; v.lm(v.lm<0.5)=0;
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
v.tpath=tpath; v.expn=expn; v.yr1=yr1; v.yr2=yr2; nyr=yr2-yr1+1; 
nlon=v.nlon; nlat=v.nlat;
ve.lon=v.lon; ve.lat=v.lat; 
vt.lon=v.lon; vt.lat=v.lat; 
vx.lon=v.lon; vx.lat=v.lat; 
vy.lon=v.lon; vy.lat=v.lat; 
vz.lon=v.lon; vz.lat=v.lat; 

lat1=-45; lat2=45; ys=min(find(v.lat(:)>=lat1)); ye=max(find(v.lat(:)<=lat2));
exd='/atmos_data_240_480/ceres_6hr_avg/';
fn=strcat(tpath,expn,exd,'ceres.20010101-20161231','.toa_lw_all.climo.nc');disp(fn);
if (exist(fn,'file') == 2)
  a=ncread(fn,'time'); v.nt=length(a); v.nt
  a=ncread(fn,'toa_lw_all',[1 1 1],[Inf Inf v.nt]); a(a<0)=0; 
  tf=(a/(5.67*10^(-8))).^(1/4); a=1.228; b=-1.106*10^(-3);
  tb=(-a+sqrt(a^2+4*b.*tf))/(2*b); a=tb; clear tf tb;
  olr_climo=a;
  b=mean(a,1); for i=2:v.nlon; b(i,:,:)=b(1,:,:); end; 
  olr_climo=b; clear b;
else
  olr_climo(1:nlon,1:nlat)=0;
end

t=1;
for t=1:nyr
  yrt=yr1+t-1; 
  if (yrt<10)
    yr=strcat('000',num2str(yrt));
  elseif (yrt<100)
    yr=strcat('00',num2str(yrt));
  elseif (yrt<1000)
    yr=strcat('0',num2str(yrt));
  else
    yr=num2str(yrt);
  end
  exd='/atmos_data_240_480/ceres_6hr_avg/';
  fn=strcat(tpath,expn,exd,'ceres.',yr,'0101-',yr,'1231','.toa_lw_all.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,'toa_lw_all',[1 1 1],[Inf Inf v.nt]); a(a<0)=0; 
    tf=(a/(5.67*10^(-8))).^(1/4); a=1.228; b=-1.106*10^(-3);
    tb=(-a+sqrt(a^2+4*b.*tf))/(2*b); a=tb; clear tf tb; tbb=a;
    lat=ncread(fn,'lat'); lon=ncread(fn,'lon');
    id=(a<=Tbb_th); tbb_233=a; tbb_233(id)=1; tbb_233(~id)=0;
    a=a-olr_climo; idx=(a<Tb_th); %mid-to-high latitudes
    id = id & idx; %tropical plus extra-tropical
    a(id)=1; a(~id)=0; a_tb=a;
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=1460; a_tb(1:nlon,1:nlat,1:nt)=0; tbb_233=a_tb; tbb=a_tb;
  end
  
  exd='atmos_data_240_480/AR_climlmt/'; varn='AR';
  varn1=strcat('_','AR','_');
  fn=strcat(tpath,expn,'/',exd,expn,varn1,yr,'.nc');disp(fn);
  a=ncread(fn,'shape',[1 1 1],[Inf Inf v.nt]); 
  time=ncread(fn,'time');
  nt=length(a(1,1,:)); nlat=length(a(1,:,1)); nlon=length(a(:,1,1));size(a)
  id=(a>0); a(id)=1; a(~id)=0;
  a_ar=a; a_et=a; a_tc=a; a_td=a; a_tl=a;
  id=create_id(ve,str2num(yr),nt);      id=(id==1); a_et(id)=1;a_et(~id)=0;
  id=create_id(vt,str2num(yr),nt);      id=(id==1); a_tc(id)=1;a_tc(~id)=0;
  id=create_id(vx,str2num(yr),nt,a_tb); id=(id==1); a_td(id)=1;a_td(~id)=0;
  id=create_id(vy,str2num(yr),nt,a_tb); id=(id==1); a_tl(id)=1;a_tl(~id)=0;
  id=a_ar|a_et|a_tc|a_td|a_tl|a_tb; a(id)=1; a(~id)=0;

  %write 4-hourly data
  exd='/AR_allstorms_CERES/'; cl=8; form='netcdf4';
  fnout=strcat(tpath,expn,exd,expn,'_',yr,'.shape.nc');disp(fnout);
  nccreate(fnout,'time','Dimensions',{'time'  nt},'Format',form);
  nccreate(fnout,'lat', 'Dimensions',{'lat' nlat},'Format',form);
  nccreate(fnout,'lon', 'Dimensions',{'lon' nlon},'Format',form);
  nccreate(fnout,'shape_all','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_ar', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_et', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_tc', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_td', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_tl', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_TBB','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'TBB_233',  'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'TBB',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  ncwrite(fnout,'time', time);
  ncwrite(fnout,'lat',  lat);
  ncwrite(fnout,'lon',  lon);
  ncwrite(fnout,'shape_all',a);  
  ncwrite(fnout,'shape_ar', a_ar);
  ncwrite(fnout,'shape_et', a_et);  
  ncwrite(fnout,'shape_tc', a_tc);  
  ncwrite(fnout,'shape_td', a_td);
  ncwrite(fnout,'shape_tl', a_tl);
  ncwrite(fnout,'shape_TBB',a_tb);
  ncwrite(fnout,'TBB_233',  tbb_233);
  ncwrite(fnout,'TBB',      tbb);
  str=strcat('hours since:',yr,'-01-01 00'); str(str==':')=' ';
  ncwriteatt(fnout,'time','units',str);
  ncwriteatt(fnout,'shape_TBB','units','none');
  ncwriteatt(fnout,'shape_TBB','Tb threshold used',strcat(num2str(Tb_th),'K'));
  
  %write daily data
  nt=floor(length(a(1,1,:))/4)
  size(time)
  size(a)
  for k=1:nt
    n=(k-1)*4+1; time_day(k)=time(n);
    a_day   (:,:,k)=a   (:,:,n)+a   (:,:,n+1)+a   (:,:,n+2)+a   (:,:,n+3);
    a_ar_day(:,:,k)=a_ar(:,:,n)+a_ar(:,:,n+1)+a_ar(:,:,n+2)+a_ar(:,:,n+3);
    a_et_day(:,:,k)=a_et(:,:,n)+a_et(:,:,n+1)+a_et(:,:,n+2)+a_et(:,:,n+3);
    a_tc_day(:,:,k)=a_tc(:,:,n)+a_tc(:,:,n+1)+a_tc(:,:,n+2)+a_tc(:,:,n+3);
    a_td_day(:,:,k)=a_td(:,:,n)+a_td(:,:,n+1)+a_td(:,:,n+2)+a_td(:,:,n+3);
    a_tl_day(:,:,k)=a_tl(:,:,n)+a_tl(:,:,n+1)+a_tl(:,:,n+2)+a_tl(:,:,n+3);
    a_tb_day(:,:,k)=a_tb(:,:,n)+a_tb(:,:,n+1)+a_tb(:,:,n+2)+a_tb(:,:,n+3);
    tbb_day (:,:,k)=(tbb (:,:,n)+tbb (:,:,n+1)+tbb (:,:,n+2)+tbb(:,:,n+3))/4.;
    tbb_233_day(:,:,k)=(tbb_233(:,:,n)+tbb_233(:,:,n+1)+tbb_233(:,:,n+2)+tbb_233(:,:,n+3))/4.;
  end
  cl=8; form='netcdf4';
  fnout=strcat(tpath,expn,exd,expn,'_',yr,'.shape.day.nc');disp(fnout);
  nccreate(fnout,'time','Dimensions',{'time' nt}, 'Format',form);
  nccreate(fnout,'lat', 'Dimensions',{'lat' nlat},'Format',form);
  nccreate(fnout,'lon', 'Dimensions',{'lon' nlon},'Format',form);
  nccreate(fnout,'shape_all','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_ar', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_et', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_tc', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_td', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_tl', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_TBB','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'TBB_233',  'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'TBB','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  ncwrite(fnout,'time', time_day);
  ncwrite(fnout,'lat',  lat);
  ncwrite(fnout,'lon',  lon);
  ncwrite(fnout,'shape_all',a_day);  
  ncwrite(fnout,'shape_ar', a_ar_day);
  ncwrite(fnout,'shape_et', a_et_day);  
  ncwrite(fnout,'shape_tc', a_tc_day);  
  ncwrite(fnout,'shape_td', a_td_day);
  ncwrite(fnout,'shape_tl', a_tl_day);
  ncwrite(fnout,'shape_TBB',a_tb_day);
  ncwrite(fnout,'TBB_233',  tbb_233_day);
  ncwrite(fnout,'TBB',      tbb_day);
  str=strcat('hours since:',yr,'-01-01 00'); str(str==':')=' ';
  ncwriteatt(fnout,'time','units',str);
  ncwriteatt(fnout,'shape_TBB','units','none');
  ncwriteatt(fnout,'shape_TBB','Tb threshold used',strcat(num2str(Tb_th),'K'));
  
end

return
