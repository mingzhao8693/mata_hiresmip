function [v]=make_sst_pattern(varn,A,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw/';
expn ='c96L33_am4p0_2010climo'; pp='/ts_all/'; yr1='0002'; yr2='0031'; t1=1;t2=30;
o=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
lm=o.lm; lat=o.lat; lon=o.lon; nlat=o.nlat; nlon=o.nlon;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in CM4 SST/sea-ice data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
expn='CM4_piControl_C'; pp='/ts_all/'; yr1='0001'; yr2='0650'; t1=151;t2=250;
cm4.c=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
%lm=c.lm; lat=c.lat; lon=c.lon; nlat=c.nlat; nlon=c.nlon;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
expn='CM4_abrupt4xCO2_C'; pp='/ts_all/'; yr1='0001'; yr2='0150'; t1=101;t2=150;
cm4.w=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
cm4.dsst_climo=(cm4.w.sst_climo-cm4.c.sst_climo);%/(cm4.w.sst_omean0-cm4.c.sst_omean0);
cm4.dsst_ann=squeeze(mean(cm4.dsst_climo,3));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
expn='CM4_abrupt4xCO2_C'; pp='/ts_all/'; yr1='0001'; yr2='0150'; t1=26;t2=75;
cm4.w1=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
cm4.dsst_climo1=(cm4.w1.sst_climo-cm4.c.sst_climo);%/(cm4.w1.sst_omean0-cm4.c.sst_omean0);
cm4.dsst_ann1=squeeze(mean(cm4.dsst_climo1,3));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in ESM2 SST/sea-ice data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/CM2/';
expn='ESM2M_piControl'; pp='/ts_all/'; yr1='0001'; yr2='0100'; t1=1;t2=100;
esm2.c=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/CM2/';
expn='ESM2M_abrupt-4xCO2'; pp='/ts_all/'; yr1='0001'; yr2='0300'; t1=101;t2=150;
esm2.w=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=(esm2.w.sst_climo-esm2.c.sst_climo);%/(esm2.w.sst_omean0-esm2.c.sst_omean0);
a=permute(a,[3 2 1]); a=interp_grid(a,cm4.c.lon,cm4.c.lat,esm2.c.lon,esm2.c.lat,1);
esm2.dsst_climo=permute(a,[3 2 1]); %ems2.dsst_climo(lon,lat,mon)
a=(esm2.w.sst_ann-esm2.c.sst_ann);%/(esm2.w.sst_omean0-esm2.c.sst_omean0);
a=interp_grid(a',cm4.c.lon,cm4.c.lat,esm2.c.lon,esm2.c.lat,1);
esm2.dsst_ann=a';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/CM2/';
expn='ESM2M_abrupt-4xCO2'; pp='/ts_all/'; yr1='0001'; yr2='0300'; t1=26;t2=75;
esm2.w1=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=(esm2.w1.sst_climo-esm2.c.sst_climo);%/(esm2.w1.sst_omean0-esm2.c.sst_omean0);
a=permute(a,[3 2 1]); a=interp_grid(a,cm4.c.lon,cm4.c.lat,esm2.c.lon,esm2.c.lat,1);
esm2.dsst_climo1=permute(a,[3 2 1]); %ems2.dsst_climo(lon,lat,mon)
a=(esm2.w1.sst_ann-esm2.c.sst_ann);%/(esm2.w1.sst_omean0-esm2.c.sst_omean0);
a=interp_grid(a',cm4.c.lon,cm4.c.lat,esm2.c.lon,esm2.c.lat,1);
esm2.dsst_ann1=a';
%figure; pcolor(esm2.dsst_ann-esm2.dsst_ann1); shading flat; colorbar;caxis([-1 1]); colormap(jet);
%figure; pcolor(esm2.dsst_ann); shading flat; colorbar;caxis([0 4]); colormap(jet);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure; plot(esm2.c.sst_omean_glob_ann); hold on; plot(esm2.w.sst_omean_glob_ann,'r');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in CM2 SST data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ tpath='/archive/Ming.Zhao/CM2/';
% $$$ expn='CM2.1U_Control-1860_D4'; pp='/ts_all/'; yr1='0001'; yr2='0100'; t1=1;t2=100;
% $$$ cm2.c=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
% $$$ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ tpath='/archive/Ming.Zhao/CM2/';
% $$$ expn='CM2.1U-D4_1PctTo2X_I1'; pp='/ts_all/'; yr1='0101'; yr2='0200'; t1=1;t2=100;
% $$$ cm2.w=readsstice(tpath,expn,pp,yr1,yr2,t1,t2);
% $$$ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ %a=(cm2.w.sst_ann-cm2.c.sst_ann)'; x=cm2.c.lon; y=cm2.w.lat;
% $$$ %figure; pcolor(x,y,a); shading flat; colorbar;
% $$$ a=(cm2.w.sst_ann-cm2.c.sst_ann)'/(cm2.w.sst_omean0-cm2.c.sst_omean0)*2;
% $$$ dsst_cm2=interp_grid(a,c.lon,c.lat,cm2.c.lon,cm2.c.lat,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in SST observations, but use AM4/CM4 reoslution (180x288)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%varn='sst'; %A=0; opt=10
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
%read in SST/sea-ice data from obs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fname=strcat(varn,'.amip.1869-2016.data.nc')
fn=strcat(tpath,fname); disp(fn);
v.lat=ncread(fn,'lat'); v.lon=ncread(fn,'lon');
if strcmp(varn,'sst')
   a=ncread(fn,varn);
else
   a=ncread(fn,varn);
end
nlat=length(v.lat); nlon=length(v.lon); 
a=shiftdim(a,2); nyr=length(a(:,1,1))/12;
v.sst=reshape(a,12,nyr,nlon,nlat); 
v.sst_ann=squeeze(mean(v.sst,1));
do_compute_sst_trend = 0; %compute SST trend
if do_compute_sst_trend
  t2=nyr-2; t1=t2-34;
  for j=1:nlat
    for i=1:nlon
      a=squeeze(v.sst_ann(t1:t2,i,j)); 
      n=length(a); x=[1:n]'; s=polyfit(x,a,1);
      v.sst_trend(i,j)=s(1)*n;
    end
  end
  %figure; pcolor(v.lon,v.lat,v.sst_trend'); shading flat; colorbar;
  %interpolate observed SST data to AM4/CM4 horizontal resolution (180x288)
  a=interp_grid(v.sst_trend',o.lon,o.lat,v.lon,v.lat,1);
  id=(o.lm'>0); a(id)=0; 
  %figure; pcolor(o.lon,o.lat,a); caxis([-1 1]); shading flat; colorbar; colormap(jet);
  v.sst_trend_regrid=a'; 
  %figure; pcolor(o.lon,o.lat,v.sst_trend_regrid'); caxis([-1 1]); shading flat; colorbar; colormap(jet);
  clear a; for i=1:12; a(:,:,i)=v.sst_trend_regrid; end;
  v.omn=compute_ocean_mean_sst(a,cm4.c.ice_climo,cm4.c.lm,cm4.c.aa);
  %omn1=compute_ocean_mean_sst(omn.dsst,c.ice_climo,c.lm,c.aa);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lm=o.lm; lat=o.lat; lon=o.lon; nlat=o.nlat; nlon=o.nlon;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ %below creat patch of SST anomaly%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ lat_p=-5; lon_p=240; lat_w=15; lon_w=40;
% $$$ for j=1:nlat
% $$$   for i=1:nlon
% $$$     if (lat(j)>=lat_p-lat_w & lat(j)<=lat_p+lat_w & ...
% $$$ 	lon(i)>=lon_p-lon_w & lon(i)<=lon_p+lon_w)
% $$$       dsst(i,j,1:12)=A*(cos(pi/2*(lat(j)-lat_p)/lat_w))^2 ...
% $$$  		      *(cos(pi/2*(lon(i)-lon_p)/lon_w))^2;
% $$$     else
% $$$       dsst(i,j,1:12)=0.;
% $$$     end
% $$$   end
% $$$ end
% $$$ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Below provide different choice of SST data%%%%%%%%%%%%%%%%%%%%%
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
  des='CM4.0 4xCO2 SST averaged from yr1-50';
  sst_climo_new=cm4.w1.sst_climo; 
  ice_climo_new=cm4.w1.ice_climo; 
  fnout=strcat(varn,'_CM4_4xCO2_SST_yr1-50.nc');
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
elseif (opt==6)
  dsst=omn.dsst; 
  des='CM4 piControl plus SSTA derived from 1980-2014 annual trend';
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  dsst=dsst/a.sst_omean_ann*2;
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_ctl_add_2K_1980_2014_annual_trend_pattern.nc');
elseif (opt==7)
  dsst=omn.dsst; 
  des='observed control SST plus SSTA derived from recent decades';
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  dsst=dsst/a.sst_omean_ann*2; size(dsst)
  sst_climo_new=o.sst_climo+dsst; 
  ice_climo_new=o.ice_climo; 
  fnout=strcat(varn,'_climo_obs_add_2K_1980_2014_annual_trend_pattern.nc');
elseif (opt==8)
  des='coupled model control SST plus SSTA pattern normalized to 2K';
  %a=compute_ocean_mean_sst(w.sst_climo, c.ice_climo,c.lm,c.aa);sst2=a.sst_omean_ann;
  %a=compute_ocean_mean_sst(w1.sst_climo,c.ice_climo,c.lm,c.aa);sst1=a.sst_omean_ann;
  %dsst=(w.sst_climo-w1.sst_climo)/(sst2-sst1)*2; dsst0=squeeze(mean(dsst,3));
  dsst0=squeeze(mean(w.sst_climo-c.sst_climo,3));
  clear a; for i=1:12; a(:,:,i)=dsst0; end; dsst=a; 
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  dsst=dsst/a.sst_omean_ann*2; size(dsst)
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_ctl_add_2K_CM4_pattern_new.nc');
elseif (opt==9)
  des='coupled model control SST plus SSTA pattern normalized to 2K';
  dsst0=squeeze(mean(w1.sst_climo-c.sst_climo,3));
  clear a; for i=1:12; a(:,:,i)=dsst0; end; dsst=a; 
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  dsst=dsst/a.sst_omean_ann*2; size(dsst)
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_ctl_add_2K_CM4_pattern_1-50yr.nc');
elseif (opt==10)
  des='coupled model control SST plus SSTA pattern from CM2 normalized to 2K';
  clear a; for i=1:12; a(i,:,:)=dsst_cm2; end; 
  dsst=permute(a,[3 2 1]); 
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  dsst=dsst/a.sst_omean_ann*2;
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_ctl_add_2K_CM2_pattern_yr_101_200.nc');
elseif (opt==11)
  des='CM4.0 control SST plus L50yr minus yr 26-75 SSTA pattern normalized to 2K';
  dsst=(cm4.w.sst_climo-cm4.w1.sst_climo); dsst0=squeeze(mean(dsst,3));
  clear a; for i=1:12; a(:,:,i)=dsst0; end; dsst=a; c=cm4.c;
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  dsst=dsst/a.sst_omean_ann*2; 
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_ctl_p2K_CM4_L50_minus_26-75_pattern.nc');
elseif (opt==12)
  des='coupled model control SST plus SSTA pattern from ESM2 normalized to 2K';
  dsst0=squeeze(mean(w.sst_climo-c.sst_climo,3));
  clear a; for i=1:12; a(:,:,i)=dsst0; end; dsst=a; 
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  dsst_cm4=dsst/a.sst_omean_ann*2;
  
  clear a; for i=1:12; a(i,:,:)=dsst_esm2; end; 
  dsst=permute(a,[3 2 1]); 
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  dsst_esm2=dsst/a.sst_omean_ann*2;
  clear a; 
  for m=1:12; 
    for j=1:c.nlat
      id=squeeze(c.lm(:,j)==0);
      if (sum(id)>0)
	dsst(:,j,m)=dsst_cm4(:,j,m)-mean(dsst_cm4(id,j,m))+mean(dsst_esm2(id,j,m));
      else
	dsst(:,j,m)=dsst_cm4(:,j,m);
      end
    end
  end
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  dsst=dsst/a.sst_omean_ann*2;
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_ctl_add_2K_CM4_zonal_ESM2_meridional_pattern.nc');
elseif (opt==13)
  des='CM4 piControl SST plus SSTA pattern from ESM2_4xCO2_yrs_101-151 normalized to 2K';
  clear a; for i=1:12; a(i,:,:)=esm2.dsst_ann; end; 
  dsst=permute(a,[3 2 1]); 
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  dsst=dsst/a.sst_omean_ann*2;
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_ctl_add_2K_ESM2_4xCO2_pattern_yrs_101_151.nc');
elseif (opt==14)
  des='CM4 piControl SST plus SSTA pattern from ESM2_4xCO2_yrs_26-75 normalized to 2K';
  clear a; for i=1:12; a(i,:,:)=esm2.dsst_ann1; end; 
  dsst=permute(a,[3 2 1]); c=cm4.c;
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  dsst=dsst/a.sst_omean_ann*2;
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_ctl_p2K_ESM2_4xCO2_pattern_yrs_26_75.nc');
elseif (opt==15)
  des='CM4 piControl SST plus 2K SSTA with ESM2-4xCO2 zonally mean pattern';esm2
  clear a; for i=1:12; a(:,:,i)=esm2.dsst_ann; end; c=cm4.c;
  b=compute_ocean_mean_sst(a,c.ice_climo,c.lm,c.aa);
  dsst_tmp=a/b.sst_omean_ann*2; dsst=dsst_tmp; 
  for m=1:12; 
    for j=1:c.nlat
      id=squeeze(c.lm(:,j)==0);
      if (sum(id)>0)
	dsst(:,j,m)=mean(dsst_tmp(id,j,m));
      else
	dsst(:,j,m)=mean(dsst_tmp(:, j,m));
      end
    end
  end
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  dsst=dsst/a.sst_omean_ann*2; %a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_piControl_p2K_with_ESM2_zonal_mean_SSTA.nc');
elseif (opt==16)
  des='CM4 piControl SST plus 2K SSTA with CM4-4xCO2 zonally mean pattern';
  clear a; for i=1:12; a(:,:,i)=cm4.dsst_ann; end; c=cm4.c;
  b=compute_ocean_mean_sst(a,c.ice_climo,c.lm,c.aa);
  dsst_tmp=a/b.sst_omean_ann*2; dsst=dsst_tmp; 
  for m=1:12; 
    for j=1:c.nlat
      id=squeeze(c.lm(:,j)==0);
      if (sum(id)>0)
	dsst(:,j,m)=mean(dsst_tmp(id,j,m));
      else
	dsst(:,j,m)=mean(dsst_tmp(:, j,m));
      end
    end
  end
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  dsst=dsst/a.sst_omean_ann*2; %a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_piControl_p2K_with_CM4_zonal_mean_SSTA.nc');
elseif (opt==17)
  des='CM4.0 4xCO2 ICE averaged from yr26-75';
  sst_climo_new=cm4.w1.sst_climo; 
  ice_climo_new=cm4.w1.ice_climo; 
  fnout=strcat(varn,'_CM4_4xCO2_ICE_yr26-75.nc');
elseif (opt==18)
  des='CM4 piControl SST plus SSTA pattern from ESM2_4xCO2_last50yr_minus_yr_26_75 normalized to 2K';
  clear a; for i=1:12; a(i,:,:)=esm2.dsst_ann-esm2.dsst_ann1; end; size(a)
  dsst=permute(a,[3 2 1]); c=cm4.c;
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  dsst=dsst/a.sst_omean_ann*2;
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_ctl_p2K_ESM2_4xCO2_pattern_last_50yr_minus_yr_26_75.nc');
elseif (opt==19)
  des='CM4 piControl SST plus SSTA pattern from CM4_4xCO2_yrs_26-75 normalized to 2K';
  clear a; for i=1:12; a(:,:,i)=cm4.dsst_ann1; end; 
  dsst=a; c=cm4.c;
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  dsst=dsst/a.sst_omean_ann*2;
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_ctl_p2K_CM4_4xCO2_pattern_yrs_26_75.nc');
elseif (opt==20)
  des='CM4 piControl SST plus SSTP from ESM2M_4xCO2_yr_26-75 avg normalized to 2K';
  clear a; for i=1:12; a(i,:,:)=esm2.dsst_ann1; end; size(a)
  dsst=permute(a,[3 2 1]); c=cm4.c;
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  dsst=(dsst-a.sst_omean_ann)+2;
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_ctl_p2K_ESM2M_4xCO2_SSTP_yr26_75_avg.nc');
elseif (opt==21)
  des='CM4 piControl SST plus SSTP from CM4_4xCO2_yr_26-75 avg normalized to 2K';
  clear a; for i=1:12; a(:,:,i)=cm4.dsst_ann1; end; 
  dsst=a; c=cm4.c;
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  dsst=(dsst-a.sst_omean_ann)+2;
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_ctl_p2K_CM4_4xCO2_SSTP_yr26_75_avg.nc');
elseif (opt==22)
  des='CM4 piControl SST plus SSTP from ESM2M_4xCO2_yr_101-150 avg normalized to 2K';
  clear a; for i=1:12; a(i,:,:)=esm2.dsst_ann; end; size(a)
  dsst=permute(a,[3 2 1]); c=cm4.c;
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  dsst=(dsst-a.sst_omean_ann)+2;
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_ctl_p2K_ESM2M_4xCO2_SSTP_yr101_150_avg.nc');
elseif (opt==23)
  des='CM4 piControl SST plus SSTP from CM4_4xCO2_yr_101-150 avg normalized to 2K';
  clear a; for i=1:12; a(:,:,i)=cm4.dsst_ann; end; 
  dsst=a; c=cm4.c;
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  dsst=(dsst-a.sst_omean_ann)+2;
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_ctl_p2K_CM4_4xCO2_SSTP_yr101_150_avg.nc');
elseif (opt==24)
  des='CM4 piControl SST plus SSTP from ESM2M_4xCO2_yr_101-150 minus yr_26-75 normalized to 2K';
  clear a; for i=1:12; a(i,:,:)=esm2.dsst_ann-esm2.dsst_ann1; end; size(a)
  dsst=permute(a,[3 2 1]); c=cm4.c;
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  dsst=(dsst-a.sst_omean_ann)+2;
  a=compute_ocean_mean_sst(dsst, c.ice_climo,c.lm,c.aa);
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_ctl_p2K_ESM2M_4xCO2_SSTP_yr101_150_minus_yr_26_75.nc');
elseif (opt==25)
  des='CM4 piControl SST plus SSTP from CM4_4xCO2_yr_101-150 minus yr_26_75 normalized to 2K';
  clear a; for i=1:12; a(:,:,i)=cm4.dsst_ann-cm4.dsst_ann1; end; 
  dsst=a; c=cm4.c;
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  dsst=(dsst-a.sst_omean_ann)+2;
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_ctl_p2K_CM4_4xCO2_SSTP_yr101_150_minus_yr_26_75.nc');
elseif (opt==26)
  des='CM4 piControl SST plus SSTP from CM4_4xCO2_yr_101-150 minus yr_26_75 zonal_mean_normalized to 2K';
  clear a; for i=1:12; a(:,:,i)=cm4.dsst_ann-cm4.dsst_ann1; end; c=cm4.c;
  for m=1:12; 
    for j=1:c.nlat
      id=squeeze(c.lm(:,j)==0);
      if (sum(id)>0)
	dsst(1:c.nlon,j,m)=mean(a(id,j,m));
      else
	dsst(1:c.nlon,j,m)=mean(a(:, j,m));
      end
    end
  end
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  dsst=dsst/a.sst_omean_ann*2;
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_ctl_p2K_CM4_4xCO2_SSTP_yr101_150_minus_yr26_75_ZM.nc');
elseif (opt==27)
  des='CM4 piControl SST plus SSTP from ESM2M_4xCO2_yr_101-150 minus yr_26_75 zonal_mean_normalized to 2K';
  clear a; for i=1:12; a(:,:,i)=esm2.dsst_ann-esm2.dsst_ann1; end; c=cm4.c;
  for m=1:12; 
    for j=1:c.nlat
      id=squeeze(c.lm(:,j)==0);
      if (sum(id)>0)
	dsst(1:c.nlon,j,m)=mean(a(id,j,m));
      else
	dsst(1:c.nlon,j,m)=mean(a(:, j,m));
      end
    end
  end
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  dsst=dsst/a.sst_omean_ann*2;
  a=compute_ocean_mean_sst(dsst,c.ice_climo,c.lm,c.aa);
  sst_climo_new=c.sst_climo+dsst; 
  ice_climo_new=c.ice_climo; 
  fnout=strcat(varn,'_climo_CM4_ctl_p2K_ESM2M_4xCO2_SSTP_yr101_150_minus_yr26_75_ZM.nc');
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
