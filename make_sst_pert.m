function [v]=make_sst_pert(varn,A,opt)
%varn='sst'; A=0; opt=0
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw/';
expn ='c96L33_am4p0_2010climo'; pp='/ts_all/'; yr1='0002'; yr2='0031'; t1=1;t2=30;
o=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
lm=o.lm; lat=o.lat; lon=o.lon; nlat=o.nlat; nlon=o.nlon;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
expn='CM4_piControl_C'; pp='/ts_all/'; yr1='0001'; yr2='0650'; t1=151;t2=250;
c=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
%lm=c.lm; lat=c.lat; lon=c.lon; nlat=c.nlat; nlon=c.nlon;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
expn='CM4_abrupt4xCO2_C'; pp='/ts_all/'; yr1='0001'; yr2='0150'; t1=101;t2=150;
w=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%below creat patch of SST anomaly%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lat_p=-5; lon_p=240; lat_w=15; lon_w=40;
for j=1:nlat
  for i=1:nlon
    if (lat(j)>=lat_p-lat_w & lat(j)<=lat_p+lat_w & ...
	lon(i)>=lon_p-lon_w & lon(i)<=lon_p+lon_w)
      dsst(i,j,1:12)=A*(cos(pi/2*(lat(j)-lat_p)/lat_w))^2 ...
 		      *(cos(pi/2*(lon(i)-lon_p)/lon_w))^2;
    else
      dsst(i,j,1:12)=0.;
    end
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (opt==0);     
  des='observed climatological SST';
  sst_climo_new=o.sst_climo; 
  ice_climo_new=o.ice_climo; 
  fnout=strcat(varn,'_climo_obs.nc');
elseif (opt==1); 
  des='coupled model control SST';
  sst_climo_new=c.sst_climo; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_ctl.nc');
elseif (opt==2)  
  des='coupled model warming SST';
  sst_climo_new=w.sst_climo; 
  ice_climo_new=w.ice_climo; 
  fnout=strcat(varn,'_climo_warm.nc');
elseif (opt==3)  
  des='coupled model control SST plus SSTA pattern normalized to 2K';
  dsst=(w.sst_climo-c.sst_climo)/(w.sst_omean0-c.sst_omean0)*2;
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=w.ice_climo; 
  fnout=strcat(varn,'_climo_ctl_add_2K_pattern.nc');
elseif (opt==4) 
  des='observed climatological SST plus SSTA pattern normalized to 2K';
  dsst=(w.sst_climo-c.sst_climo)/(w.sst_omean0-c.sst_omean0)*2;
  sst_climo_new=o.sst_climo+dsst; 
  ice_climo_new=o.ice_climo; 
  fnout=strcat(varn,'_climo_obs_add_2K_pattern.nc');
elseif (opt==5) 
  des='observed climatological SST plus SST patch of perturbation';
  sst_climo_new=o.sst_climo+dsst; 
  ice_climo_new=o.ice_climo; 
  fnout=strcat(varn,'_climo_obs_add_SST_patch.nc');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%icemk_climo1=icemk_climo;
%figure; pcolor(lon,lat,dsst'); shading flat; colorbar; hold on; contour(lon,lat,lm','w');
%m=1; z1=squeeze(tsurf_climo(:,:,m)); z2=squeeze(tsurf_climo_new(:,:,m));
%figure; pcolor(lon,lat,z1'); shading flat; colorbar; caxis([295 301]);hold on; contour(lon,lat,lm','w');
%figure; pcolor(lon,lat,z2'); shading flat; colorbar; caxis([295 301]);hold on; contour(lon,lat,lm','w');
%figure; pcolor(lon,lat,(z2-z1)'); shading flat; colorbar; hold on; contour(lon,lat,lm','w');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

exd='./sst_data/'; fnout=strcat(exd,fnout); disp(fnout)
%fnout=strcat(varn,'_pert',num2str(A),'_climo.nc');disp(fnout);
form='netcdf4_classic'; form='classic'; nt=length(v.time); 
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
  des0='Constructed mid-month Sea Surface Temperature'; 
else
  nccreate(fnout,'ice','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form);
  des0='Constructed mid-month Sea-ice area fraction'; 
end
des=strcat(des0,';',des); des

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
  ncwrite(fnout,'sst', sst_climo_new);
  ncwriteatt(fnout,varn,'long_name',des);
  ncwriteatt(fnout,varn,'standard_name','sst');
  ncwriteatt(fnout,varn,'units','degK');
else
  ncwrite(fnout,'ice', ice_climo_new*100);
  ncwriteatt(fnout,varn,'long_name',des);
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
varn='sst'; varn='ice';
make_sst_pert(varn,0,0)
make_sst_pert(varn,0,1)
make_sst_pert(varn,0,2)
make_sst_pert(varn,0,3)

