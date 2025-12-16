function [v]=convert_MSWEP(tpath,expn,yr1,yr2,opt,olr_th)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/awg/warsaw_201803/'; opt='mod'; olr_th=-10
tpath='/archive/Ming.Zhao/backup/MSWEP/';
yr1=1979; yr2=1979; opt='obs';

fn=strcat(tpath,'ERAI_grid/atmos.static.nc'); 
v.lon=ncread(fn,'longitude');  v.lat=ncread(fn,'latitude'); %v.lat=flipud(lat);
a=ncread(fn,'land_mask'); v.lm=a'; %v.lm(v.lm>=0.5)=1; v.lm(v.lm<0.5)=0;

opath='/archive/Ming.Zhao/backup/MSWEP/ERAI_grid/';
cl=8; form='netcdf4';

for t=yr1:yr2
  yr=num2str(t);
  fn=strcat(tpath,yr,'.nc'); 
  time=ncread(fn,'time'); nt  =length(time);
  lon =ncread(fn,'lon');  nlon=length(lon);
  lat =ncread(fn,'lat');  nlat=length(lat);
  pcp =ncread(fn,'precipitation');
  
  fnout=strcat(opath,yr,'_MSWEP_precip_erai_grid.nc');disp(fnout);
  nccreate(fnout,'time','Dimensions',{'time'  nt},'Format',form);
  nccreate(fnout,'lat', 'Dimensions',{'lat' nlat},'Format',form);
  nccreate(fnout,'lon', 'Dimensions',{'lon' nlon},'Format',form);
  nccreate(fnout,'precip','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  ncwrite (fnout,'time',  time);
  ncwrite (fnout,'lat',   lat);
  ncwrite (fnout,'lon',   lon);
  ncwrite (fnout,'precip',pcp);  
 
end


