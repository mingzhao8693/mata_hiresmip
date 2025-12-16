function [v]=addtc_to_AR_mod(tpath,expn,yr1,yr2,opt,Tb_th,use_obs_tc)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/awg/2022.03/'; opt='mod'; Tb_th=-30
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_1951_2020'; ardir='AR_climlmt'; yr1=1979;yr2=1979;
%expn ='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; yr1=1951; yr2=1978; opt='mod';
%expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_2'; yr1=2015;yr2=2015;
%tpath='/archive/Ming.Zhao/backup/ECMWF/'; Tb_th=-30;
%expn ='ERAI_6h_DATA'; yr1=2015; yr2=2015; pct=[99 99.9]; opt='obs';
%tpath='/archive/Ming.Zhao/awg/2022.03/'; Tb_th=-30; use_obs_tc = false;
%expn ='c192L33_am4p0_amip_HIRESMIP_HX'; yr1=1985; yr2=1985; pct=[99 99.9]; opt='mod';
%tpath='/archive/Ming.Zhao/awg/2022.03/'; Tb_th=-30; use_obs_tc = false;
%expn ='c192L33_am4p0_2010climo'; yr1=0002; yr2=0002; pct=[99 99.9]; opt='mod';

if strcmp(opt,'obs')
  epath='/analysis_allstorms/allstorms_wsfc/';
else
  epath='/analysis/';
end
fn=strcat(tpath,expn,epath,expn,'_traj.mat');
%load(fn); v1=plottraj(v,2020,90)

if use_obs_tc; opt='obs'; end;

latbnd=30; wind_th=17; twc_th=2; vort_th=1.6*10^(-4); nday=3; 
[ve,vt,vx,vy]=get_tsyearly(fn,opt,latbnd,wind_th,twc_th,vort_th,nday); %year=1950; id=create_tcid(vx,year)
if (yr1<1000)
  ve.tyear=ve.tyear-1900;
  vt.tyear=vt.tyear-1900;
  vx.tyear=vx.tyear-1900;
  vy.tyear=vy.tyear-1900;
end
%vt.tr=vt.yr(36).ts; plottraj_obs(vt,1985,90,0)

%atmos_dir='/atmos_data_240_480/'; atmos_state_file='atmos_static_240_480.nc';
atmos_dir='/atmos_data/'; atmos_state_file='atmos.static.nc';

fn=strcat(tpath,expn,'/',atmos_state_file); 
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
exd=strcat(atmos_dir,'6hr_avg/');
fn=strcat(tpath,expn,exd,'atmos_cmip.rlut','.climo.nc');disp(fn);
if (exist(fn,'file') == 2)
  a=ncread(fn,'time'); v.nt=length(a); v.nt
  a=ncread(fn,'rlut',[1 1 1],[Inf Inf v.nt]); 
  tf=(a/(5.67*10^(-8))).^(1/4); a=1.228; b=-1.106*10^(-3);
  tb=(-a+sqrt(a^2+4*b.*tf))/(2*b); a=tb; clear tf tb;
  olr_climo=a;
  b=mean(a,1); for i=2:v.nlon; b(i,:,:)=b(1,:,:); end; olr_climo=b;
else
  disp(strcat(fn,'does not exist!!!'));
  olr_climo(1:nlon,1:nlat)=0; v.nt=1460;
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
  exd=strcat(atmos_dir,'6hr_avg/');
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'010100-',yr,'123123.rlut.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,'rlut',[1 1 1],[Inf Inf v.nt]); rlut=a;
    tf=(a/(5.67*10^(-8))).^(1/4); a=1.228; b=-1.106*10^(-3);
    tb=(-a+sqrt(a^2+4*b.*tf))/(2*b); a=tb; clear tf tb; tbb=a;
    %lat=ncread(fn,'lat'); lon=ncread(fn,'lon'); %id=(a<148); 
    id=(a<=233); tbb_233=a; tbb_233(id)=1; tbb_233(~id)=0;
    a=a-olr_climo; idx=(a<Tb_th); %mid-to-high latitudes
    id = id & idx; %tropical plus extra-tropical
    a(id)=1; a(~id)=0; a_tb=a;
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=1460; a_tb(1:nlon,1:nlat,1:nt)=0; tbb_233=a_tb; tbb=a_tb;
  end
  
  exd=strcat(atmos_dir,'daily/'); varn='pr';
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 1],[Inf Inf 365]); pcp_day=a; size(pcp_day)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; pcp_day(1:nlon,1:nlat,1:nt)=0;
  end
  
  exd=strcat(atmos_dir,'daily/'); varn='rlut';
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 1],[Inf Inf 365]); rlut_day=a; size(a)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; rlut_day(1:nlon,1:nlat,1:nt)=0;
  end
  
  exd=strcat(atmos_dir,'daily/'); varn='rlutcs';
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 1],[Inf Inf 365]); rlutcs_day=a; size(a)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; rlutcs_day(1:nlon,1:nlat,1:nt)=0;
  end

  exd=strcat(atmos_dir,'daily/'); varn='rsut';
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 1],[Inf Inf 365]); rsut_day=a; size(a)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; rsut_day(1:nlon,1:nlat,1:nt)=0;
  end
  
  exd=strcat(atmos_dir,'daily/'); varn='rsdt';
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 1],[Inf Inf 365]); rsdt_day=a; size(a)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; rsdt_day(1:nlon,1:nlat,1:nt)=0;
  end
  swabs_day=rsdt_day-rsut_day;
  
  exd=strcat(atmos_dir,'daily/'); varn='rsutcs';
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 1],[Inf Inf 365]); rsutcs_day=a; size(a)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; rsutcs_day(1:nlon,1:nlat,1:nt)=0;
  end
  swabs_clr_day=rsdt_day-rsutcs_day;
  
  exd=strcat(atmos_dir,'daily/'); varn='psl';
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 1],[Inf Inf 365]); psl_day=a; size(a)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; psl_day(1:nlon,1:nlat,1:nt)=0;
  end
  
  exd=strcat(atmos_dir,'daily/'); varn='wap500';
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 1],[Inf Inf 365]); o500_day=squeeze(a); size(o500_day)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; o500_day(1:nlon,1:nlat,1:nt)=0;
  end
  
  exd=strcat(atmos_dir,'daily/'); varn='zg_plev19'; k=6;
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 k 1],[Inf Inf 1 365]); z500_day=squeeze(a); size(z500_day)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; z500_day(1:nlon,1:nlat,1:nt)=0;
  end

  exd=strcat(atmos_dir,'daily/'); varn='ua_unmsk'; k=3;
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 k 1],[Inf Inf 1 365]); u850_day=squeeze(a); size(u850_day)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; u850_day(1:nlon,1:nlat,1:nt)=0;
  end
  
  exd=strcat(atmos_dir,'daily/'); varn='va_unmsk'; k=3;
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 k 1],[Inf Inf 1 365]); v850_day=squeeze(a); size(v850_day)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; v850_day(1:nlon,1:nlat,1:nt)=0;
  end
  
  exd=strcat(atmos_dir,'daily/'); varn='ua_unmsk'; k=10;
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 k 1],[Inf Inf 1 365]); u200_day=squeeze(a); size(u200_day)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; u200_day(1:nlon,1:nlat,1:nt)=0;
  end
  
  exd=strcat(atmos_dir,'daily/'); varn='va_unmsk'; k=10;
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 k 1],[Inf Inf 1 365]); v200_day=squeeze(a); size(v200_day)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; v200_day(1:nlon,1:nlat,1:nt)=0;
  end
  
  exd=strcat(atmos_dir,'daily/'); varn='tas';
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 1],[Inf Inf 365]); tas_day=squeeze(a); size(tas_day)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; tas_day(1:nlon,1:nlat,1:nt)=0;
  end
  
  exd=strcat(atmos_dir,'daily/'); varn='hurs';
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 1],[Inf Inf 365]); hurs_day=squeeze(a); size(hurs_day)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; hurs_day(1:nlon,1:nlat,1:nt)=0;
  end
  
  exd=strcat(atmos_dir,'daily/'); varn='tasmax';
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 1],[Inf Inf 365]); tasmax_day=squeeze(a); size(tasmax_day)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; tasmax_day(1:nlon,1:nlat,1:nt)=0;
  end
  
  exd=strcat(atmos_dir,'daily/'); varn='hursmax';
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 1],[Inf Inf 365]); hursmax_day=squeeze(a); size(hursmax_day)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=365; hursmax_day(1:nlon,1:nlat,1:nt)=0;
  end

%6hourly data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  exd=strcat(atmos_dir,'./'); varn='vort850';
  fn=strcat(tpath,expn,exd,'atmos.',yr,'010100-',yr,'123123.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 1],[Inf Inf v.nt]); vt850=a; 
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=1460; vt850(1:nlon,1:nlat,1:nt)=0;
  end
  
  exd=strcat(atmos_dir,'6hr/');
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'010100-',yr,'123123.u_ref.nc'); disp(fn);
  if (exist(fn,'file') == 2)
     a=ncread(fn,'u_ref',[1 1 1],[Inf Inf v.nt]); u_ref=a; 
  else
     disp(strcat(fn,'does not exist!!!'));
     nt=1460; u_ref(1:nlon,1:nlat,1:nt)=0;
  end
  exd=strcat(atmos_dir,'6hr/');
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'010100-',yr,'123123.v_ref.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,'v_ref',[1 1 1],[Inf Inf v.nt]); v_ref=a; 
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=1460; v_ref(1:nlon,1:nlat,1:nt)=0;
  end
  
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'010100-',yr,'123123.ivtx.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,'ivtx',[1 1 1],[Inf Inf v.nt]); ivtx=a; 
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=1460; ivtx(1:nlon,1:nlat,1:nt)=0;
  end
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'010100-',yr,'123123.ivty.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,'ivty',[1 1 1],[Inf Inf v.nt]); ivty=a; 
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=1460; ivty(1:nlon,1:nlat,1:nt)=0;
  end
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'010100-',yr,'123123.prw.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,'prw',[1 1 1],[Inf Inf v.nt]); prw=a; 
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=1460; prw(1:nlon,1:nlat,1:nt)=0;
  end

  exd='AR_climlmt/'; varn='AR';
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

  %making mutually exclusive with a priority of TC>AR>MCS
  a_AR=a_ar; a_AR(a_tc>0)=0; 
  a_TB=a_tb; a_TB(a_tc>0 | a_AR>0)=0; 
  
  id=a_ar|a_et|a_tc|a_td|a_tl|a_tb; a(id)=1; a(~id)=0;

  
  %write 4-hourly data
  exd='/AR_allstorms_Tb_th_30/'; cl=8; form='netcdf4';
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
  nccreate(fnout,'rlut',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'vt850',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'u_ref',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'v_ref',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'wind_ref', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'ivtx',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'ivty',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'prw',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_AR', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_TB', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
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
  ncwrite(fnout,'rlut',     rlut);
  ncwrite(fnout,'vt850',    vt850);
  ncwrite(fnout,'u_ref',    u_ref);
  ncwrite(fnout,'v_ref',    v_ref);
  ncwrite(fnout,'wind_ref', sqrt(u_ref.^2+v_ref.^2));
  ncwrite(fnout,'ivtx',     ivtx);
  ncwrite(fnout,'ivty',     ivty);
  ncwrite(fnout,'prw',      prw);
  ncwrite(fnout,'shape_AR', a_AR);
  ncwrite(fnout,'shape_TB', a_TB);
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
    a_AR_day(:,:,k)=a_AR(:,:,n)+a_AR(:,:,n+1)+a_AR(:,:,n+2)+a_AR(:,:,n+3);
    a_TB_day(:,:,k)=a_TB(:,:,n)+a_TB(:,:,n+1)+a_TB(:,:,n+2)+a_TB(:,:,n+3);
    tbb_day (:,:,k)=(tbb (:,:,n)+tbb (:,:,n+1)+tbb (:,:,n+2)+tbb(:,:,n+3))/4.;
    tbb_233_day(:,:,k)=(tbb_233(:,:,n)+tbb_233(:,:,n+1)+tbb_233(:,:,n+2)+tbb_233(:,:,n+3))/4.;
    vt850_day(:,:,k)=(vt850(:,:,n)+vt850 (:,:,n+1)+vt850 (:,:,n+2)+vt850(:,:,n+3))/4.;
    u_ref_day(:,:,k)=(u_ref(:,:,n)+u_ref (:,:,n+1)+u_ref (:,:,n+2)+u_ref(:,:,n+3))/4.;
    v_ref_day(:,:,k)=(v_ref(:,:,n)+v_ref (:,:,n+1)+v_ref (:,:,n+2)+v_ref(:,:,n+3))/4.;
    ivtx_day (:,:,k)=(ivtx (:,:,n)+ivtx  (:,:,n+1)+ivtx  (:,:,n+2)+ivtx (:,:,n+3))/4.;
    ivty_day (:,:,k)=(ivty (:,:,n)+ivty  (:,:,n+1)+ivty  (:,:,n+2)+ivty (:,:,n+3))/4.;
    prw_day  (:,:,k)=(prw  (:,:,n)+prw   (:,:,n+1)+prw   (:,:,n+2)+prw  (:,:,n+3))/4.;
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
  nccreate(fnout,'pcp','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'rlut',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'rlutcs',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'swabs',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'swabs_clr','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'u_ref','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'v_ref','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'wind_ref','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'ivtx', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'ivty', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'prw',  'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'psl',  'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'o500', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'z500', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'vt850','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'u850', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'v850', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'u200', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'v200', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'tas',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'tasmax',  'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'hurs',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'hursmax', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
% $$$   nccreate(fnout,'pr', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_AR', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_TB', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
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
  ncwrite(fnout,'pcp',      pcp_day);
  ncwrite(fnout,'rlut',     rlut_day);
  ncwrite(fnout,'rlutcs',   rlutcs_day);
  ncwrite(fnout,'swabs',    swabs_day);
  ncwrite(fnout,'swabs_clr',swabs_clr_day);
  ncwrite(fnout,'u_ref',    u_ref_day);
  ncwrite(fnout,'v_ref',    v_ref_day);
  ncwrite(fnout,'wind_ref', sqrt(u_ref_day.^2+v_ref_day.^2));
  ncwrite(fnout,'ivtx',     ivtx_day);
  ncwrite(fnout,'ivty',     ivty_day);
  ncwrite(fnout,'prw',      prw_day);
  ncwrite(fnout,'psl',      psl_day);
  ncwrite(fnout,'o500',     o500_day);
  ncwrite(fnout,'z500',     z500_day);
  ncwrite(fnout,'vt850',    vt850_day);
  ncwrite(fnout,'u850',     u850_day);
  ncwrite(fnout,'v850',     v850_day);
  ncwrite(fnout,'u200',     u200_day);
  ncwrite(fnout,'v200',     v200_day);
  ncwrite(fnout,'tas',      tas_day);
  ncwrite(fnout,'tasmax',   tasmax_day);
  ncwrite(fnout,'hurs',     hurs_day);
  ncwrite(fnout,'hursmax',  hursmax_day);
% $$$   ncwrite(fnout,'pr',       pr_day);
  ncwrite(fnout,'shape_AR', a_AR_day);
  ncwrite(fnout,'shape_TB', a_TB_day);
  str=strcat('hours since:',yr,'-01-01 00'); str(str==':')=' ';
  ncwriteatt(fnout,'time','units',str);
  ncwriteatt(fnout,'shape_TBB','units','none');
  ncwriteatt(fnout,'shape_TBB','Tb threshold used',strcat(num2str(Tb_th),'K'));
  
end

return
