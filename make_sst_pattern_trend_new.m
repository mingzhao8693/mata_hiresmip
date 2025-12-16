function [v]=make_sst_pattern_trend_new(varn,opt)
%varn='sst'; opt=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_hiresmip/obs_global_to_c96.mat'); load(fn); O=o;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2022.03/';
expn ='c192L33_am4p0_2010climo'; pp='/ts_all/'; yr1='0002'; yr2='0101'; t1=1;t2=100;
c=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
expn ='c192L33_am4p0_2010climo_trend_1979_2020_spear';
w1=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
expn ='c192L33_am4p0_2010climo_trend_1979_2020_times_2';
w2=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imk=c.ice_climo; lmk=c.lm; aa=c.aa; %opt=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (opt==0);
  des='SPEAR pattern with zonal mean observed pattern normalized to 0.94K';
  dsst=squeeze(mean(w1.sst_climo-c.sst_climo,3));
  clear a; for i=1:12; a(:,:,i)=dsst; end; dsst=a;
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  dsst1=dsst/a.sst_omean_ann;
  
  dsst=squeeze(mean(w2.sst_climo-c.sst_climo,3));
  clear a; for i=1:12; a(:,:,i)=dsst; end; dsst=a;
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  dsst2=dsst/a.sst_omean_ann;
  
  lm_th=0; im_th=0;
  for m=1:12;
    im=c.ice_climo(:,:,m); lm=c.lm;
    id(:,:,m)=~(lm>lm_th | im>im_th);
    for j=1:c.nlat
      a=0; idx=id(:,j,m); n=sum(idx);
      if (n>0)
	a=-mean(dsst1(idx,j,m))+mean(dsst2(idx,j,m));
      end
      for i=1:c.nlon
	if (idx(i)==1)
	  dsst(i,j,m)=dsst1(i,j,m)+a;
	else
	  dsst(i,j,m)=dsst1(i,j,m);
	end
      end
    end
  end
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  dsst=dsst/a.sst_omean_ann*0.94;
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  %sst_climo_new=c.sst_climo+dsst; 
  %ice_climo_new=c.ice_climo; 
  %fn=strcat('/work/miz/mat_hiresmip/obs_global_to_c96.mat'); load(fn); O=o;
  tpath='/archive/Ming.Zhao/awg/warsaw/';
  expn ='c96L33_am4p0_2010climo'; pp='/ts_all/'; yr1='0002'; yr2='0031'; t1=1;t2=30;
  o=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
  %clear s; s.lm=o.lm'; s.lm0=s.lm; s.aa=o.aa'; s.lat=o.lat; s.lon=o.lon;
  lm=o.lm; lat=o.lat; lon=o.lon; nlat=o.nlat; nlon=o.nlon;
  [xo,yo]=meshgrid(o.lon,o.lat);
  [xi,yi]=meshgrid(c.lon,c.lat);
  for m=1:12
    a=dsst(:,:,m); a=a';
    dsst_new(:,:,m)=interp2(xi,yi,a,xo,yo,'linear');
  end
  %a=interp2(xi,yi,c.lm',xo,yo,'linear'); v.lm=a'
  a=dsst_new; dsst_new=permute(a,[2 1 3]);
  a=compute_ocean_mean_sst(dsst_new, o.ice_climo,o.lm,o.aa);
  dsst_new=dsst_new/a.sst_omean_ann*0.94;
  sst_climo_new=o.sst_climo+dsst_new; 
  ice_climo_new=o.ice_climo; 
  fnout=strcat(varn,'_SST_pattern_with_zonal_mean_obs_pattern_normalized_to_0p94K.nc');
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
v.sst = ncread(fn,'sst');
fname=strcat('ice','.climo.1981-2014.data.nc')
fn=strcat(tpath,fname); disp(fn);
v.ice = ncread(fn,'ice');
%R0=6371.0e3; dtor=1./180.*pi;
%lat=v.lat; lon=v.lon; nlat=length(lat); nlon=length(lon);
%dlat=lat(round(nlat/2))-lat(round(nlat/2)-1);
%dlon=lon(round(nlon/2))-lon(round(nlon/2)-1);
%for i=1:nlat
%  rad=lat(i)*dtor; 
%  aa0(i,1:nlon)=(R0*cos(rad)*dlon*dtor) * (R0*dlat*dtor);
%  dx (i,1:nlon)=(R0*cos(rad)*dlon*dtor);
%  dy (i,1:nlon)=(R0*dlat*dtor);
%  f  (i,1:nlon)= 2*pi/86400*sin(rad);
%end
%amean=mean(mean(aa0)); aa=aa0/amean; v.aa=aa';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%[xo,yo]=meshgrid(v.lon,v.lat);
%[xi,yi]=meshgrid(c.lon,c.lat);
%for m=1:12
%  a=dsst(:,:,m); a=a';
%  dsst_new(:,:,m)=interp2(xi,yi,a,xo,yo,'linear');
%end
%a=interp2(xi,yi,c.lm',xo,yo,'linear'); v.lm=a'
%a=dsst_new; dsst_new=permute(a,[2 1 3]);
%a=compute_ocean_mean_sst(dsst_new, v.ice,v.lm,v.aa);
%dsst_new=dsst_new/a.sst_omean_ann*0.94;
%sst_climo_new=v.sst+dsst_new; 
%ice_climo_new=v.ice; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
exd='./sst_data/'; %fnout=strcat(exd,fnout); disp(fnout)
fnout=strcat('./test.nc'); disp(fnout);
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

varn='sst'; make_sst_pattern_trend_new(varn,0);

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
