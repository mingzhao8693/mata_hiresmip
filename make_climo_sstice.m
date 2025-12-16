function [v]=make_climo_sstice(varn) %varn='sst';
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0]=thermconst;
tpath='/archive/Ming.Zhao/backup/sst_dataset/pcmdi_climo_sst_ice/';
fname=strcat(varn,'.climo.1981-2014.data.nc')
fn=strcat(tpath,fname); disp(fn);
v.time=ncread(fn,'time'); %v.lat=ncread(fn,'lat'); v.lon=ncread(fn,'lon');
v.yr=ncread(fn,'yr'); v.mo=ncread(fn,'mo'); v.dy=ncread(fn,'dy');
v.average_T1=ncread(fn,'average_T1'); 
v.average_T2=ncread(fn,'average_T2'); 
v.average_DT=ncread(fn,'average_DT'); 
v.nrecords  =ncread(fn,'nrecords'); 
v.climatology_bounds=ncread(fn,'climatology_bounds'); 
% $$$ if strcmp(varn,'sst')
% $$$   v.sst=ncread(fn,varn);
% $$$ else
% $$$   v.ice=ncread(fn,varn);
% $$$ end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn ='c192L33_am4p0_2010climo_new'; 
fname='atmos.static.nc';
fn=strcat(tpath,expn,'/',fname); lm=ncread(fn,'land_mask'); 
lat=ncread(fn,'lat'); nlat=length(lat);
lon=ncread(fn,'lon'); nlon=length(lon); 
fname='t_surf.climo.nc'; fn=strcat(tpath,expn,'/',fname); disp(fn);
a=ncread(fn,'t_surf'); n=length(a(1,1,:)); a=reshape(a,nlon,nlat,12,n/12); 
tsurf_climo=mean(a,4);
fname='ice_mask.climo.nc'; fn=strcat(tpath,expn,'/',fname); disp(fn);
a=ncread(fn,'ice_mask'); n=length(a(1,1,:)); a=reshape(a,nlon,nlat,12,n/12); 
icemk_climo=mean(a,4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R0=6371.0e3; dtor=1./180.*pi;
dlat=lat(round(nlat/2))-lat(round(nlat/2)-1);
dlon=lon(round(nlon/2))-lon(round(nlon/2)-1);
for i=1:nlat
  rad=lat(i)*dtor; 
  aa0(i,1:nlon)=(R0*cos(rad)*dlon*dtor) * (R0*dlat*dtor);
  dx (i,1:nlon)=(R0*cos(rad)*dlon*dtor);
  dy (i,1:nlon)=(R0*dlat*dtor);
  f  (i,1:nlon)= 2*pi/86400*sin(rad);
end
amean=mean(mean(aa0)); aa=aa0/amean; aa=aa';
%compute mean SST over oceanic regions (lm==0|im==0)%
for m=1:12
  a=aa; 
  im=icemk_climo(:,:,m);
  id=(lm==0)|(im==0); 
  a=a/mean(a(id)); v.a(:,:,m)=a;
  b=tsurf_climo(:,:,m);
  v.sst_omean(m)=mean(b(id).*a(id));
end
v.sst_omean_ann=mean(v.sst_omean);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn ='c192L33_am4p0_amip_HIRESMIP_future_ssp585';
%tpath='/archive/Ming.Zhao/awg/warsaw_201803/'; 
%expn ='c192L33_am4p0_climo_hiresmip_futureSST_4xCO2'; 
fname='t_surf.climo.nc'; fn=strcat(tpath,expn,'/',fname); disp(fn);
a=ncread(fn,'t_surf'); n=length(a(1,1,:)); a=reshape(a,nlon,nlat,12,n/12); 
tsurf_climo1=squeeze(mean(a,4));
fname='ice_mask.climo.nc'; fn=strcat(tpath,expn,'/',fname); disp(fn);
a=ncread(fn,'ice_mask'); n=length(a(1,1,:)); a=reshape(a,nlon,nlat,12,n/12); 
icemk_climo1=squeeze(mean(a,4));
lat=ncread(fn,'lat'); nlat=length(lat);
lon=ncread(fn,'lon'); nlon=length(lon); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for m=1:12
  a=aa; 
  im=icemk_climo1(:,:,m);
  id=(lm==0)|(im==0); 
  a=a/mean(a(id)); v.a(:,:,m)=a;
  b=tsurf_climo1(:,:,m);
  v.sst_omean1(m)=mean(b(id).*a(id));
end
v.sst_omean1_ann=mean(v.sst_omean1);
v.dsst_omean_ann=v.sst_omean1_ann-v.sst_omean_ann;
v.dsst_omean_add=4.0-v.dsst_omean_ann;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

exd='./'; form='netcdf4_classic'; form='classic'; 
nt=length(v.time); 
fnout=strcat(varn,'_climo.nc');disp(fnout);
nccreate(fnout,'time',      'Dimensions',{'time' Inf},'Datatype','double','Format',form);
nccreate(fnout,'yr',        'Dimensions',{'idim' 12},'Datatype','int32', 'Format',form);
nccreate(fnout,'mo',        'Dimensions',{'idim' 12},'Datatype','int32', 'Format',form);
nccreate(fnout,'dy',        'Dimensions',{'idim' 12},'Datatype','int32', 'Format',form);
nccreate(fnout,'average_T1','Dimensions',{'time' nt},'Datatype','double','Format',form);
nccreate(fnout,'average_T2','Dimensions',{'time' nt},'Datatype','double','Format',form);
nccreate(fnout,'average_DT','Dimensions',{'time' nt},'Datatype','double','Format',form);
nccreate(fnout,'nrecords',  'Datatype','int32', 'Format',form);
nccreate(fnout,'climatology_bounds','Dimensions',{'nv' 2 'time' nt},'Datatype','double','Format',form);
nccreate(fnout,'lat','Dimensions',{'lat' nlat},'Datatype','single','Format',form);
nccreate(fnout,'lon','Dimensions',{'lon' nlon},'Datatype','single','Format',form);
if strcmp(varn,'sst')
  nccreate(fnout,'sst','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form);
else
  nccreate(fnout,'ice','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form);
end
ncwrite(fnout,'time',               v.time);
ncwrite(fnout,'yr',                 v.yr);
ncwrite(fnout,'mo',                 v.mo);
ncwrite(fnout,'dy',                 v.dy);
ncwrite(fnout,'average_T1',         v.average_T1);
ncwrite(fnout,'average_T2',         v.average_T2);
ncwrite(fnout,'average_DT',         v.average_DT);
ncwrite(fnout,'climatology_bounds', v.climatology_bounds);
ncwrite(fnout,'nrecords',           v.nrecords);
ncwrite(fnout,'lat',                lat);
ncwrite(fnout,'lon',                lon);
if strcmp(varn,'sst')
  ncwrite(fnout,'sst', tsurf_climo1+v.dsst_omean_add);
  ncwriteatt(fnout,varn,'long_name','Constructed mid-month Sea Surface Temperature');
  ncwriteatt(fnout,varn,'standard_name','sst');
  ncwriteatt(fnout,varn,'units','degK');
else
  ncwrite(fnout,'ice', icemk_climo1*100);
  ncwriteatt(fnout,varn,'long_name','Constructed mid-month Sea-ice area fraction');
  ncwriteatt(fnout,varn,'standard_name','ice');
  ncwriteatt(fnout,varn,'units','%');
end
ncwriteatt(fnout,varn,'cell_methods',' time: mean over days');
ncwriteatt(fnout,varn,'time_avg_info','average_T1,average_T2,average_DT');

ncwriteatt(fnout,'time','long_name','Time');
ncwriteatt(fnout,'time','standard_name','time');
ncwriteatt(fnout,'time','units','days since 1860-01-01 00:00:00');
ncwriteatt(fnout,'time','calendar',   'gregorian');
ncwriteatt(fnout,'time','climatology','climatology_bounds');
ncwriteatt(fnout,'time','modulo',' ');

ncwriteatt(fnout,'climatology_bounds','long_name','Time bounds');
ncwriteatt(fnout,'climatology_bounds','standard_name','time bounds');
ncwriteatt(fnout,'climatology_bounds','units','days since 1860-01-01 00:00:00');
ncwriteatt(fnout,'climatology_bounds','calendar',   'gregorian');

ncwriteatt(fnout,'lon','long_name','Longitude');
ncwriteatt(fnout,'lon','standard_name','longitude');
ncwriteatt(fnout,'lon','units','degrees_east');

ncwriteatt(fnout,'lat','long_name','Latitude');
ncwriteatt(fnout,'lat','standard_name','latitude');
ncwriteatt(fnout,'lat','units','degrees_north');

ncwriteatt(fnout,'average_T1','long_name','Start time for average period');
ncwriteatt(fnout,'average_T1','units','days since 1860-01-01 00:00:00');
ncwriteatt(fnout,'average_T2','long_name','End time for average period');
ncwriteatt(fnout,'average_T2','units','days since 1860-01-01 00:00:00');
ncwriteatt(fnout,'average_DT','long_name','Length of average period');
ncwriteatt(fnout,'average_DT','units','days');

ncwriteatt(fnout,'nrecords','description','must be equal to size of time dimension');

return

make_climo_sstice('sst')
make_climo_sstice('ice')
