function [v]=make_sst_pattern_trend_newer(varn,opt)
%varn='sst'; opt=14;
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
des='SPEAR pattern with zonal mean observed pattern normalized to 0.94K';

a=squeeze(mean(w1.sst_climo-c.sst_climo,3));
dsst=repmat(a,[1 1 12]); a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
dsst1=dsst/a.sst_omean_ann;
  
a=squeeze(mean(w2.sst_climo-c.sst_climo,3));
dsst=repmat(a,[1 1 12]); a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
dsst2=dsst/a.sst_omean_ann;

lm_th=0; im_th=0;
for m=1:12;
  im=c.ice_climo(:,:,m); lm=c.lm;
  id(:,:,m)=~(lm>lm_th | im>im_th);
  for j=1:c.nlat
    a=0; idx=id(:,j,m); n=sum(idx);
    if (n>0)
      a=-mean(dsst1(idx,j,m))+mean(dsst2(idx,j,m));%OBS-SPEAR zonal mean diff
    end
    for i=1:c.nlon
      if (idx(i)==1)
	dsst3(i,j,m)=dsst1(i,j,m)+a; %SPEAR + (OBS-SPEAR zonal mean diff)
	dsst4(i,j,m)=dsst2(i,j,m)-a; %OBS   - (OBS-SPEAR zonal mean diff)
      else
	dsst3(i,j,m)=dsst1(i,j,m);
	dsst4(i,j,m)=dsst2(i,j,m);
      end
    end
  end
end
a=compute_ocean_mean_sst(dsst3,c.ice_climo,c.lm,c.aa);
dsst3=dsst3/a.sst_omean_ann*0.94; a=compute_ocean_mean_sst(dsst3,c.ice_climo,c.lm,c.aa);%check again
a=compute_ocean_mean_sst(dsst4,c.ice_climo,c.lm,c.aa);
dsst4=dsst4/a.sst_omean_ann*0.94; a=compute_ocean_mean_sst(dsst4,c.ice_climo,c.lm,c.aa);%check again

%varn='sst'; opt=15;
if opt==0
  dsst=dsst1; dsst(:,:,:)=0; %observed control SST
  fnout=strcat(varn,'_control_hadisst_1981_2014_avg.nc');
elseif opt==1
  dsst=dsst1;
  fnout=strcat(varn,'_spear_pattern_normalized_to_0p94K.nc');
elseif opt==2
  dsst=dsst2;
  fnout=strcat(varn,'_obs_pattern_normalized_to_0p94K.nc');
elseif opt==3
  dsst=dsst3;
  fnout=strcat(varn,'_spear_pattern_with_zonal_mean_obs_normalized_to_0p94K.nc');
elseif opt==4
  dsst=dsst4;
  fnout=strcat(varn,'_obs_pattern_with_zonal_mean_spear_normalized_to_0p94K.nc');
elseif opt==5
  latlon = [0 360 -10 10]; 
  lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
  ys=min(find(c.lat(:)>=lat1)); ye=max(find(c.lat(:)<= lat2));
  xs=min(find(c.lon(:)>=lon1)); xe=max(find(c.lon(:)<= lon2));
  dsst=dsst1; dsst(xs:xe,ys:ye,:)=dsst2(xs:xe,ys:ye,:);
  fnout=strcat(varn,'_spear_pattern_with_tropical_10ns_obs_normalized_to_0p94K.nc');
elseif opt==6
  latlon = [0 360 -20 20]; 
  lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
  ys=min(find(c.lat(:)>=lat1)); ye=max(find(c.lat(:)<= lat2));
  xs=min(find(c.lon(:)>=lon1)); xe=max(find(c.lon(:)<= lon2));
  dsst=dsst1; dsst(xs:xe,ys:ye,:)=dsst2(xs:xe,ys:ye,:);
  fnout=strcat(varn,'_spear_pattern_with_tropical_20ns_obs_normalized_to_0p94K.nc');
elseif opt==7
  latlon = [0 360 -30 30]; 
  lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
  ys=min(find(c.lat(:)>=lat1)); ye=max(find(c.lat(:)<= lat2));
  xs=min(find(c.lon(:)>=lon1)); xe=max(find(c.lon(:)<= lon2));
  dsst=dsst1; dsst(xs:xe,ys:ye,:)=dsst2(xs:xe,ys:ye,:);
  fnout=strcat(varn,'_spear_pattern_with_tropical_30ns_obs_normalized_to_0p94K.nc');
elseif opt==8
  latlon = [0 360 -45 -30]; 
  lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
  ys=min(find(c.lat(:)>=lat1)); ye=max(find(c.lat(:)<= lat2));
  xs=min(find(c.lon(:)>=lon1)); xe=max(find(c.lon(:)<= lon2));
  dsst=dsst1; dsst(xs:xe,ys:ye,:)=dsst2(xs:xe,ys:ye,:);
  fnout=strcat(varn,'_spear_pattern_with_30_45s_obs_normalized_to_0p94K.nc');
elseif opt==9
  latlon = [0 360 -75 -45]; 
  lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
  ys=min(find(c.lat(:)>=lat1)); ye=max(find(c.lat(:)<= lat2));
  xs=min(find(c.lon(:)>=lon1)); xe=max(find(c.lon(:)<= lon2));
  dsst=dsst1; dsst(xs:xe,ys:ye,:)=dsst2(xs:xe,ys:ye,:);
  fnout=strcat(varn,'_spear_pattern_with_so_45_75s_obs_normalized_to_0p94K.nc');
elseif opt==10
  latlon = [0 360 30 60]; 
  lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
  ys=min(find(c.lat(:)>=lat1)); ye=max(find(c.lat(:)<= lat2));
  xs=min(find(c.lon(:)>=lon1)); xe=max(find(c.lon(:)<= lon2));
  dsst=dsst1; dsst(xs:xe,ys:ye,:)=dsst2(xs:xe,ys:ye,:);
  fnout=strcat(varn,'_spear_pattern_with_30_60n_obs_normalized_to_0p94K.nc');
elseif opt==11
  latlon = [110 280 -10 10]; 
  lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
  ys=min(find(c.lat(:)>=lat1)); ye=max(find(c.lat(:)<= lat2));
  xs=min(find(c.lon(:)>=lon1)); xe=max(find(c.lon(:)<= lon2));
  dsst=dsst1; dsst(xs:xe,ys:ye,:)=dsst2(xs:xe,ys:ye,:);
  fnout=strcat(varn,'_spear_pattern_with_pacific_10ns_obs_normalized_to_0p94K.nc');
elseif opt==12
  latlon = [50 180 -30 30]; 
  lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
  ys=min(find(c.lat(:)>=lat1)); ye=max(find(c.lat(:)<= lat2));
  xs=min(find(c.lon(:)>=lon1)); xe=max(find(c.lon(:)<= lon2));
  dsst=dsst1; dsst(xs:xe,ys:ye,:)=dsst2(xs:xe,ys:ye,:);
  fnout=strcat(varn,'_spear_pattern_with_ipwp_30ns_obs_normalized_to_0p94K.nc');
elseif opt==13
  latlon = [275 340 10 25]; 
  lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
  ys=min(find(c.lat(:)>=lat1)); ye=max(find(c.lat(:)<= lat2));
  xs=min(find(c.lon(:)>=lon1)); xe=max(find(c.lon(:)<= lon2));
  dsst=dsst1; dsst(xs:xe,ys:ye,:)=dsst2(xs:xe,ys:ye,:);
  fnout=strcat(varn,'_spear_pattern_with_atlantic_mdr_obs_normalized_to_0p94K.nc');
elseif opt==14
  latlon = [120 260 25 70]; 
  lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
  ys=min(find(c.lat(:)>=lat1)); ye=max(find(c.lat(:)<= lat2));
  xs=min(find(c.lon(:)>=lon1)); xe=max(find(c.lon(:)<= lon2));
  dsst=dsst1; dsst(xs:xe,ys:ye,:)=dsst2(xs:xe,ys:ye,:);
  fnout=strcat(varn,'_spear_pattern_with_north_pacific_obs_normalized_to_0p94K.nc');
elseif opt==15
  latlon = [150 290 -45 -10]; 
  lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
  ys=min(find(c.lat(:)>=lat1)); ye=max(find(c.lat(:)<= lat2));
  xs=min(find(c.lon(:)>=lon1)); xe=max(find(c.lon(:)<= lon2));
  dsst=dsst1; dsst(xs:xe,ys:ye,:)=dsst2(xs:xe,ys:ye,:);
  fnout=strcat(varn,'_spear_pattern_with_south_pacific_10s_45s_obs_normalized_to_0p94K.nc');
elseif opt==16
  latlon = [120 260 10 70]; 
  lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
  ys=min(find(c.lat(:)>=lat1)); ye=max(find(c.lat(:)<= lat2));
  xs=min(find(c.lon(:)>=lon1)); xe=max(find(c.lon(:)<= lon2));
  dsst=dsst1; dsst(xs:xe,ys:ye,:)=dsst2(xs:xe,ys:ye,:);
  fnout=strcat(varn,'_spear_pattern_with_north_pacific_10n_70n_obs_normalized_to_0p94K.nc');
elseif opt==17
  latlon = [180 260 10 45]; 
  lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
  ys=min(find(c.lat(:)>=lat1)); ye=max(find(c.lat(:)<= lat2));
  xs=min(find(c.lon(:)>=lon1)); xe=max(find(c.lon(:)<= lon2));
  dsst=dsst1; dsst(xs:xe,ys:ye,:)=dsst2(xs:xe,ys:ye,:);
  fnout=strcat(varn,'_spear_pattern_with_southeast_pacific_obs_normalized_to_0p94K.nc');
end
if (opt>=5)
  for k=1:5
    for i=1:xs:xe
      for m=1:12
	for j=ys-2:ys+2
	  dsst(i,j,m)=mean(dsst(i,j-1:j+1,m));
	end
	for j=ye-2:ye+2
	  dsst(i,j,m)=mean(dsst(i,j-1:j+1,m));
	end
      end
    end
  end
end
if (opt>=11)
  for k=1:5
    for j=ys:ye
      for m=1:12
	for i=xs-2:xs+2
	  dsst(i,j,m)=mean(dsst(i-1:i+1,j,m));
	end
	for i=xe-2:xe+2
	  dsst(i,j,m)=mean(dsst(i-1:i+1,j,m));
	end
      end
    end
  end
end



fn=strcat('/work/miz/mat_hiresmip/spearle_sst_trend_vm.mat'); load(fn);
opt=128
if opt==21 %best
  %fn=strcat('/work/miz/mat_hiresmip/spearle_sst_trend_vm.mat'); load(fn);
  xt=[1979:2020]'; alpha=0.8;
  a=(vm(3).tsurf+vm(26).tsurf+vm(25).tsurf+vm(11).tsurf+vm(18).tsurf+vm(16).tsurf)/6;
  x=get_trend_TSR(o,a,xt,alpha); a=repmat(x.trend,[1 1 12]); dsst=permute(a*5,[2,1,3]);
  c.lon=o.lon; c.lat=o.lat;
  fnout=strcat(varn,'_spear_pattern_best_wegradient_normalized_to_0p94K.nc');
elseif opt==22 %worst
  %fn=strcat('/work/miz/mat_hiresmip/spearle_sst_trend_vm.mat'); load(fn);
  xt=[1979:2020]'; alpha=0.8;
  a=(vm(12).tsurf+vm(8).tsurf+vm(2).tsurf+vm(15).tsurf+vm(7).tsurf+vm(13).tsurf)/6;
  x=get_trend_TSR(o,a,xt,alpha); a=repmat(x.trend,[1 1 12]); dsst=permute(a*5,[2,1,3]);
  c.lon=o.lon; c.lat=o.lat;
  fnout=strcat(varn,'_spear_pattern_worst_wegradient_normalized_to_0p94K.nc');
elseif opt==23 %2best
  %fn=strcat('/work/miz/mat_hiresmip/spearle_sst_trend_vm.mat'); load(fn);
  xt=[1979:2020]'; alpha=0.8;
  a=(vm(1).tsurf+vm(6).tsurf+vm(19).tsurf+vm(30).tsurf+vm(27).tsurf+vm(28).tsurf)/6;
  x=get_trend_TSR(o,a,xt,alpha); a=repmat(x.trend,[1 1 12]); dsst=permute(a*5,[2,1,3]);
  c.lon=o.lon; c.lat=o.lat;
  fnout=strcat(varn,'_spear_pattern_2best_wegradient_normalized_to_0p94K.nc');
elseif opt==24 %2worst
  %fn=strcat('/work/miz/mat_hiresmip/spearle_sst_trend_vm.mat'); load(fn);
  xt=[1979:2020]'; alpha=0.8;
  a=(vm(21).tsurf+vm(29).tsurf+vm(14).tsurf+vm(5).tsurf+vm(22).tsurf+vm(20).tsurf)/6;
  x=get_trend_TSR(o,a,xt,alpha); a=repmat(x.trend,[1 1 12]); dsst=permute(a*5,[2,1,3]);
  c.lon=o.lon; c.lat=o.lat;
  fnout=strcat(varn,'_spear_pattern_2worst_wegradient_normalized_to_0p94K.nc');
elseif opt==25 %middle
  %fn=strcat('/work/miz/mat_hiresmip/spearle_sst_trend_vm.mat'); load(fn);
  xt=[1979:2020]'; alpha=0.8;
  a=(vm(17).tsurf+vm(10).tsurf+vm(23).tsurf+vm(9).tsurf+vm(24).tsurf+vm(5).tsurf)/6;
  x=get_trend_TSR(o,a,xt,alpha); a=repmat(x.trend,[1 1 12]); dsst=permute(a*5,[2,1,3]);
  c.lon=o.lon; c.lat=o.lat;
  fnout=strcat(varn,'_spear_pattern_middle_wegradient_normalized_to_0p94K.nc');
elseif opt==103 %SPEAR member 3
  %fn=strcat('/work/miz/mat_hiresmip/spearle_sst_trend_vm.mat'); load(fn);
  xt=[1979:2020]'; alpha=0.8;
  a=vm(3).tsurf;
  x=get_trend_TSR(o,a,xt,alpha); a=repmat(x.trend,[1 1 12]); dsst=permute(a*5,[2,1,3]);
  c.lon=o.lon; c.lat=o.lat;
  fnout=strcat(varn,'_spear_pattern_m3_normalized_to_0p94K.nc');
elseif opt==116 %SPEAR member 16
  %fn=strcat('/work/miz/mat_hiresmip/spearle_sst_trend_vm.mat'); load(fn);
  xt=[1979:2020]'; alpha=0.8;
  a=vm(16).tsurf;
  x=get_trend_TSR(o,a,xt,alpha); a=repmat(x.trend,[1 1 12]); dsst=permute(a*5,[2,1,3]);
  c.lon=o.lon; c.lat=o.lat;
  fnout=strcat(varn,'_spear_pattern_m16_normalized_to_0p94K.nc');
elseif opt==117 %SPEAR member 17
  %fn=strcat('/work/miz/mat_hiresmip/spearle_sst_trend_vm.mat'); load(fn);
  xt=[1979:2020]'; alpha=0.8;
  a=vm(17).tsurf;
  x=get_trend_TSR(o,a,xt,alpha); a=repmat(x.trend,[1 1 12]); dsst=permute(a*5,[2,1,3]);
  c.lon=o.lon; c.lat=o.lat;
  fnout=strcat(varn,'_spear_pattern_m17_normalized_to_0p94K.nc');
elseif opt==118 %SPEAR member 18
  %fn=strcat('/work/miz/mat_hiresmip/spearle_sst_trend_vm.mat'); load(fn);
  xt=[1979:2020]'; alpha=0.8;
  a=vm(18).tsurf;
  x=get_trend_TSR(o,a,xt,alpha); a=repmat(x.trend,[1 1 12]); dsst=permute(a*5,[2,1,3]);
  c.lon=o.lon; c.lat=o.lat;
  fnout=strcat(varn,'_spear_pattern_m18_normalized_to_0p94K.nc');
elseif opt==126 %SPEAR member 26
  %fn=strcat('/work/miz/mat_hiresmip/spearle_sst_trend_vm.mat'); load(fn);
  xt=[1979:2020]'; alpha=0.8;
  a=vm(26).tsurf;
  x=get_trend_TSR(o,a,xt,alpha); a=repmat(x.trend,[1 1 12]); dsst=permute(a*5,[2,1,3]);
  c.lon=o.lon; c.lat=o.lat;
  fnout=strcat(varn,'_spear_pattern_m26_normalized_to_0p94K.nc');
end



tpath='/archive/Ming.Zhao/awg/warsaw/';
expn ='c96L33_am4p0_2010climo'; pp='/ts_all/'; yr1='0002'; yr2='0031'; t1=1;t2=30;
O=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
lm=O.lm; lat=O.lat; lon=O.lon; nlat=O.nlat; nlon=O.nlon;
[xo,yo]=meshgrid(O.lon,O.lat);
[xi,yi]=meshgrid(c.lon,c.lat);
for m=1:12
  a=dsst(:,:,m); a=a';
  b(:,:,m)=interp2(xi,yi,a,xo,yo,'linear');
end
dsst_new=permute(b,[2 1 3]);
a=compute_ocean_mean_sst(dsst_new, O.ice_climo,O.lm,O.aa);
if (a.sst_omean_ann~= 0); dsst_new=dsst_new/a.sst_omean_ann*0.94; end;
sst_climo_new=O.sst_climo+dsst_new; 
ice_climo_new=O.ice_climo; 
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
exd='./sst_data/'; %fnout=strcat(exd,fnout); disp(fnout)
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

varn='sst'; opt=15; make_sst_pattern_trend_newer(varn,opt);

varn='sst'; opt=16; make_sst_pattern_trend_newer(varn,opt);

varn='sst'; opt=16; make_sst_pattern_trend_newer(varn,opt);
