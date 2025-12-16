function [v]=make_sst_pi(varn,opt)
varn='sst'; opt=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_hiresmip/obs_global_to_c96.mat'); load(fn);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw/';
expn ='c96L33_am4p0_2010climo'; pp='/ts_all/'; yr1='0002'; yr2='0031'; t1=1;t2=30;
c=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
%tpath='/archive/Ming.Zhao/awg/2022.03/';
%expn ='c192L33_am4p0_2010climo'; pp='/ts_all/'; yr1='0002'; yr2='0101'; t1=1;t2=100;
%c=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imk=c.ice_climo; lmk=c.lm; aa=c.aa; %opt=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
des='climatological SST pre-industrial based on HadiSST difference between 1981-2014 and 1870-1903';
yrs=[1870:2020];
yr1=1870; yr2=1903; i1=find(yrs==yr1); i2=find(yrs==yr2);
hsst.all_1870_1903=o.sfc.sst_1870_2020.all(i1:i2,:,:,:);
hice.all_1870_1903=o.sfc.ice_1870_2020.all(i1:i2,:,:,:);
yr1=1981; yr2=2014; i1=find(yrs==yr1); i2=find(yrs==yr2);
hsst.all_1981_2014=o.sfc.sst_1870_2020.all(i1:i2,:,:,:);
hice.all_1981_2014=o.sfc.ice_1870_2020.all(i1:i2,:,:,:);
hsst.clm_1870_1903=squeeze(mean(hsst.all_1870_1903,1));
hsst.clm_1981_2014=squeeze(mean(hsst.all_1981_2014,1));
hsst.clm_diff=hsst.clm_1981_2014-hsst.clm_1870_1903;
hice.clm_1870_1903=squeeze(mean(hice.all_1870_1903,1));
hice.clm_1981_2014=squeeze(mean(hice.all_1981_2014,1));
hice.clm_diff=hice.clm_1981_2014-hice.clm_1870_1903;

dsst_clm=permute(hsst.clm_diff,[3 2 1]);
dice_clm=permute(hice.clm_diff,[3 2 1]);
dsst=dsst_clm; a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa); %dsst1=dsst/a.sst_omean_ann;

if opt==0
  dsst_new=-dsst_clm; fnout=strcat(varn,'_1981-2014_climo_minus_diff_between_hadiSST_1981-2014_and_1870-1903.nc');
  sst_climo_new=c.sst_climo+dsst_new; ice_climo_new=c.ice_climo;
  lat=c.lat; lon=c.lon; nlat=c.nlat; nlon=c.nlon;
elseif opt==10 %doing intepolation to different horizontal resolution
  lm=c.lm; lat=c.lat; lon=O.lon; nlat=O.nlat; nlon=O.nlon;
  [xo,yo]=meshgrid(O.lon,O.lat);
  [xi,yi]=meshgrid(c.lon,c.lat);
  for m=1:12
    a=dsst(:,:,m); a=a';
    b(:,:,m)=interp2(xi,yi,a,xo,yo,'linear');
  end
  dsst_new=permute(b,[2 1 3]);
  a=compute_ocean_mean_sst(dsst_new, O.ice_climo,O.lm,O.aa);
  if (a.sst_omean_ann~= 0); dsst_new=dsst_new/a.sst_omean_ann*0.94; end;
else %override certain selected regions
  latlon = [0 360 -30 30]; 
  lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
  ys=min(find(c.lat(:)>=lat1)); ye=max(find(c.lat(:)<= lat2));
  xs=min(find(c.lon(:)>=lon1)); xe=max(find(c.lon(:)<= lon2));
  dsst=dsst1; dsst(xs:xe,ys:ye,:)=dsst2(xs:xe,ys:ye,:);
  fnout=strcat(varn,'_spear_pattern_with_tropical_30ns_obs_normalized_to_0p94K.nc');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%icemk_climo1=icemk_climo;
%figure; pcolor(lon,lat,dsst'); shading flat; colorbar; hold on; contour(lon,lat,lm','w');
%m=1; z1=squeeze(tsurf_climo(:,:,m)); z2=squeeze(tsurf_climo_new(:,:,m));
%figure; pcolor(lon,lat,z1'); shading flat; colorbar; caxis([295 301]);hold on; contour(lon,lat,lm','w');
%figure; pcolor(lon,lat,z2'); shading flat; colorbar; caxis([295 301]);hold on; contour(lon,lat,lm','w');
%figure; pcolor(lon,lat,(z2-z1)'); shading flat; colorbar; hold on; contour(lon,lat,lm','w');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0]=thermconst;
tpath='/archive/Ming.Zhao/backup/sst_dataset/pcmdi_climo_sst_ice/';
fname=strcat(varn,'.climo.1981-2014.data.nc')
fn=strcat(tpath,fname); disp(fn);
v.time=ncread(fn,'time'); v.lat=ncread(fn,'lat'); v.lon=ncread(fn,'lon');
v.yr=ncread(fn,'yr'); v.mo=ncread(fn,'mo'); v.dy=ncread(fn,'dy');
v.average_T1=ncread(fn,'average_T1'); 
v.average_T2=ncread(fn,'average_T2'); 
v.average_DT=ncread(fn,'average_DT'); 
v.nrecords  =ncread(fn,'nrecords'); 
v.climatology_bounds=ncread(fn,'climatology_bounds');
%v.sst = ncread(fn,'sst');
%fname=strcat('ice','.climo.1981-2014.data.nc')
%fn=strcat(tpath,fname); disp(fn);
%v.ice = ncread(fn,'ice');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
exd='./sst_data/'; fnout=strcat(exd,fnout); disp(fnout)
		   %fnout=strcat('./test.nc');
disp(fnout);
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

varn='sst'; make_sst_pi(varn,0);
