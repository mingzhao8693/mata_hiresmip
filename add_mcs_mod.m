function [v]=add_mcs_mod(tpath,expn,yr1,yr2,opt,Tb_th,use_obs_tc)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%expn ='ERAI_6h_DATA'; yr1=2015; yr2=2015; pct=[99 99.9]; opt='obs';
%tpath='/archive/Ming.Zhao/am5/'; Tb_th=-30; use_obs_tc = false;
%expn ='c384L65_am5f11d10r0_amip'; yr1=1980; yr2=1980; pct=[99 99.9]; opt='mod';

atmos_dir='/atmos_data/'; atmos_state_file='atmos.static.nc';

fn=strcat(tpath,expn,'/',atmos_state_file)
v.lon=ncread(fn,'lon'); v.lat=ncread(fn,'lat'); lon=v.lon; lat=v.lat;
a=ncread(fn,'land_mask'); v.lm=a';

v.lm(v.lm>=0.5)=1; v.lm(v.lm<0.5)=0;
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
v.tpath=tpath; v.expn=expn; v.yr1=yr1; v.yr2=yr2; nyr=yr2-yr1+1; 
nlon=v.nlon; nlat=v.nlat;

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
  olr_climo(1:nlon,1:nlat)=0; v.nt=1460; return
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
    time=ncread(fn,'time');
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
  
  varn='pr';
  fn=strcat(tpath,expn,exd,'atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc'); disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 1],[Inf Inf v.nt]); pr=a*86400; size(pr)
  else
    disp(strcat(fn,'does not exist!!!'));
    nt=1460; pr(1:nlon,1:nlat,1:nt)=0;
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
  
  a=a_tb;
  nt=length(a(1,1,:)); nlat=length(a(1,:,1)); nlon=length(a(:,1,1));size(a)
  id=(a>0); a(id)=1; a(~id)=0; time=time(1:v.nt);
  a_TB=a_tb; a_TB(pr<10)=0; 

  %write 4-hourly data
  exd='/AR_allstorms_Tb_th_30/'; cl=8; form='netcdf4';
  fnout=strcat(tpath,expn,exd,expn,'_',yr,'.shape.nc');disp(fnout);
  nccreate(fnout,'time','Dimensions',{'time'  nt},'Format',form);
  nccreate(fnout,'lat', 'Dimensions',{'lat' nlat},'Format',form);
  nccreate(fnout,'lon', 'Dimensions',{'lon' nlon},'Format',form);
  nccreate(fnout,'shape_TBB','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'shape_TB', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'TBB_233',  'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'TBB',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'rlut',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  ncwrite(fnout,'time', time);
  ncwrite(fnout,'lat',  lat);
  ncwrite(fnout,'lon',  lon);
  ncwrite(fnout,'shape_TBB',a_tb);
  ncwrite(fnout,'shape_TB', a_TB);
  ncwrite(fnout,'TBB_233',  tbb_233);
  ncwrite(fnout,'TBB',      tbb);
  ncwrite(fnout,'rlut',     rlut);
  str=strcat('hours since:',yr,'-01-01 00'); str(str==':')=' ';
  ncwriteatt(fnout,'time','units',str);
  ncwriteatt(fnout,'shape_TBB','units','none');
  ncwriteatt(fnout,'shape_TBB','Tb threshold used',strcat(num2str(Tb_th),'K'));
  
  %write daily data
  nt=floor(length(a_TB(1,1,:))/4); size(time)
  for k=1:nt
    n=(k-1)*4+1; time_day(k)=time(n);
    a_tb_day(:,:,k)=a_tb(:,:,n)+a_tb(:,:,n+1)+a_tb(:,:,n+2)+a_tb(:,:,n+3);
    a_TB_day(:,:,k)=a_TB(:,:,n)+a_TB(:,:,n+1)+a_TB(:,:,n+2)+a_TB(:,:,n+3);
    tbb_day (:,:,k)=(tbb (:,:,n)+tbb (:,:,n+1)+tbb (:,:,n+2)+tbb(:,:,n+3))/4.;
    tbb_233_day(:,:,k)=(tbb_233(:,:,n)+tbb_233(:,:,n+1)+tbb_233(:,:,n+2)+tbb_233(:,:,n+3))/4.;
  end
  cl=8; form='netcdf4';
  fnout=strcat(tpath,expn,exd,expn,'_',yr,'.shape.day.nc');disp(fnout);
  nccreate(fnout,'time','Dimensions',{'time' nt}, 'Format',form);
  nccreate(fnout,'lat', 'Dimensions',{'lat' nlat},'Format',form);
  nccreate(fnout,'lon', 'Dimensions',{'lon' nlon},'Format',form);
  nccreate(fnout,'shape_TBB','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',  form,'DeflateLevel',cl);
  nccreate(fnout,'shape_TB', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8','Format',  form,'DeflateLevel',cl);
  nccreate(fnout,'TBB_233',  'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'TBB',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'rlut',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'pcp',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  ncwrite(fnout,'time', time_day);
  ncwrite(fnout,'lat',  lat);
  ncwrite(fnout,'lon',  lon);
  ncwrite(fnout,'shape_TBB',a_tb_day);
  ncwrite(fnout,'shape_TB', a_TB_day);
  ncwrite(fnout,'TBB_233',  tbb_233_day);
  ncwrite(fnout,'TBB',      tbb_day);
  ncwrite(fnout,'rlut',     rlut_day);
  ncwrite(fnout,'pcp',      pcp_day);
  str=strcat('hours since:',yr,'-01-01 00'); str(str==':')=' ';
  ncwriteatt(fnout,'time','units',str);
  ncwriteatt(fnout,'shape_TBB','units','none');
  ncwriteatt(fnout,'shape_TBB','Tb threshold used',strcat(num2str(Tb_th),'K'));
  
end

return
