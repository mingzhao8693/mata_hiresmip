function [v]=make_sst_pattern_trend(varn,opt)
%varn='sst'; opt=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_hiresmip/obs_global_to_c96.mat'); load(fn); O=o;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw/';
expn ='c96L33_am4p0_2010climo'; pp='/ts_all/'; yr1='0002'; yr2='0031'; t1=1;t2=30;
o=readsstice(tpath,expn,pp,yr1,yr2,t1,t2); clear s;
s.lm=o.lm'; s.lm0=s.lm; s.aa=o.aa'; s.lat=o.lat; s.lon=o.lon;
lm=o.lm; lat=o.lat; lon=o.lon; nlat=o.nlat; nlon=o.nlon;
o.sst_1870_2020 = O.sfc.sst_1870_2020;
o.ice_1870_2020 = O.sfc.ice_1870_2020;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i1=1870; i2=2021; Y=[i1:i2]'; m1=1; m2=12; alpha=0.8; %total data length;
y1=1979; y2=2020; i1=find(Y==y1); i2=find(Y==y2); xt_obs=Y(i1:i2);
vobs=o.sst_1870_2020.all(i1:i2,m1:m2,:,:);
imsk=o.ice_1870_2020.all(i1:i2,m1:m2,:,:);
ts=compute_gocean_sst_mon(vobs,imsk,s.lm,s.aa);
a=squeeze(mean(vobs,2)); 
v.sst_obs_1979_2020=get_trend_TSR(s,a,xt_obs,alpha);
v.sst_obs_1979_2020.ts=ts;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ i1=1870; i2=2021; Y=[i1:i2]'; m1=1; m2=12; alpha=0.8; %total data length;
% $$$ y1=1979; y2=2014; i1=find(Y==y1); i2=find(Y==y2); xt_obs=Y(i1:i2);
% $$$ vobs=o.sst_1870_2020.all(i1:i2,m1:m2,:,:);
% $$$ imsk=o.ice_1870_2020.all(i1:i2,m1:m2,:,:);
% $$$ ts=compute_gocean_sst_mon(vobs,imsk,s.lm,s.aa);
% $$$ a=squeeze(mean(vobs,2)); 
% $$$ v.sst_obs_1979_2014=get_trend_TSR(s,a,xt_obs,alpha);
% $$$ v.sst_obs_1979_2014.ts=ts;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ do_compute_sst_trend = true;
% $$$ if do_compute_sst_trend
% $$$   a=squeeze(mean(vobs,2)); x=xt_obs;
% $$$   for j=1:nlat
% $$$     for i=1:nlon
% $$$       y=squeeze(a(:,j,i));
% $$$       s=polyfit(x,y,1);
% $$$       sst_trend(j,i)=s(1)*10; %K/decade
% $$$     end
% $$$   end
% $$$ end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
opt=2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (opt==0);     
  des='observed climatological SST';
  sst_climo_new=o.sst_climo; 
  ice_climo_new=o.ice_climo; 
  fnout=strcat(varn,'_obs_climo_1981_2014.nc');
elseif (opt==1) 
  ts=v.sst_obs_1979_2020.ts;
  a=v.sst_obs_1979_2020.trend; dsst=a';
  imk=o.ice_climo; lmk=o.lm; aa=o.aa; m=1;
  for m=1:12
    im=squeeze(imk(:,:,m));
    id=~((lmk>0)|(im>0));
    a=aa/mean(aa(id)); 
    dsst_omean(m)=mean(dsst(id).*a(id));
  end
  des='observed climo SST plus 2K SSTA derived from recent decades';
%  dsst0=mean(dsst_omean); dsst=dsst/dsst0*2; 
  dsst=dsst.*5;%figure;pcolor(dsst');shading flat;colorbar;colormap(jet);caxis([-2 2]);
  dsst=repmat(dsst,[1 1 12]);
  sst_climo_new=o.sst_climo+dsst; 
  ice_climo_new=o.ice_climo; 
  fnout=strcat(varn,'_obs_climo_1981_2014_plus_annual_trend_pattern_1979_2020.nc');
elseif (opt==2) 
  ts=v.sst_obs_1979_2020.ts;
  a=v.sst_obs_1979_2020.trend; dsst=a';
  imk=o.ice_climo; lmk=o.lm; aa=o.aa; m=1;
  for m=1:12
    im=squeeze(imk(:,:,m));
    id=~((lmk>0)|(im>0));
    a=aa/mean(aa(id)); 
    dsst_omean(m)=mean(dsst(id).*a(id));
  end
  des='observed climo SST plus 2K SSTA derived from recent decades';
%  dsst0=mean(dsst_omean); dsst=dsst/dsst0*2; 
  dsst=dsst.*5*(0.923/0.443);%figure;pcolor(dsst');shading flat;colorbar;colormap(jet);caxis([-2 2]);
  dsst=repmat(dsst,[1 1 12]);
  sst_climo_new=o.sst_climo+dsst; 
  ice_climo_new=o.ice_climo; 
  fnout=strcat(varn,'_obs_climo_1981_2014_plus_annual_trend_pattern_1979_2020_times_2.nc');
elseif (opt==3) 
  load('./spearle_sst_trend.mat');
  a=v.sst_mod_1979_2020.trend; dsst=a';
  imk=o.ice_climo; lmk=o.lm; aa=o.aa; m=1;
  for m=1:12
    im=squeeze(imk(:,:,m));
    id=~((lmk>0)|(im>0));
    a=aa/mean(aa(id)); 
    dsst_omean(m)=mean(dsst(id).*a(id));
  end
  des='observed climo SST plus 2K SSTA derived from SPEAR-LE';
%  dsst0=mean(dsst_omean); dsst=dsst/dsst0*2; 
  dsst=dsst.*5;%figure;pcolor(dsst');shading flat;colorbar;colormap(jet);caxis([-2 2]);
  dsst=repmat(dsst,[1 1 12]);
  sst_climo_new=o.sst_climo+dsst; 
  ice_climo_new=o.ice_climo; 
  fnout=strcat(varn,'_obs_climo_1981_2014_plus_annual_trend_pattern_1979_2020_SPEAR.nc');
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
v.time=ncread(fn,'time'); %v.lat=ncread(fn,'lat'); v.lon=ncread(fn,'lon');
v.yr=ncread(fn,'yr'); v.mo=ncread(fn,'mo'); v.dy=ncread(fn,'dy');
v.average_T1=ncread(fn,'average_T1'); 
v.average_T2=ncread(fn,'average_T2'); 
v.average_DT=ncread(fn,'average_DT'); 
v.nrecords  =ncread(fn,'nrecords'); 
v.climatology_bounds=ncread(fn,'climatology_bounds'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

varn='sst'; make_sst_pattern_trend(varn,0);

varn='sst'; make_sst_pattern_trend(varn,1);


varn='sst'; make_sst_pattern(varn,0,20)

varn='sst'; make_sst_pattern(varn,0,21)

varn='sst'; make_sst_pattern(varn,0,22)

varn='sst'; make_sst_pattern(varn,0,23)

varn='sst'; make_sst_pattern(varn,0,24)

varn='sst'; make_sst_pattern(varn,0,25)

varn='sst'; make_sst_pattern(varn,0,26)

varn='sst'; make_sst_pattern(varn,0,27)

varn='sst'; make_sst_pattern(varn,0,14)

varn='sst'; make_sst_pattern(varn,0,19)

varn='sst'; make_sst_pattern(varn,0,18)

varn='ice'; make_sst_pattern(varn,0,17)

varn='sst'; make_sst_pattern(varn,0,8)

varn='sst'; make_sst_pattern(varn,0,9)

varn='sst'; make_sst_pattern(varn,0,13);%CM4Ctl+ESM2pattern

varn='sst'; make_sst_pattern(varn,0,6);%CM4-C+histpattern

varn='sst'; make_sst_pattern(varn,0,13);%CM4Ctl+ESM2pattern

varn='sst'; make_sst_pattern(varn,0,12);%CM4Ctl+ESM2pattern

varn='sst'; make_sst_pattern(varn,0,15);%CM4Ctl+ESM2pattern

varn='sst'; make_sst_pattern(varn,0,16);%CM4Ctl+CM4zonalmeanSSTA
