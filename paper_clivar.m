tpath='/archive/Ming.Zhao/obs_for_am4p0_paper/';
expn='ERA_interim'; latlon=[0 360 10 90]; region='NH';
v=clivar_ana_obs_aopna(tpath,expn,latlon,region)

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn='c192L33_am4p0_amip_HIRESMIP_H8';
latlon=[0 360 10 90]; region='NH';
yr1='1949';yr2='2014';syr=31;nyr=36;
v=clivar_ana_mod_aopna(tpath,expn,latlon,region,yr1,yr2,syr,nyr)


%test and plotting:
tpath='/archive/Ming.Zhao/obs_for_am4p0_paper/';
latlon=[0 360  20 90]; region='NH'; v0=clivar_ana_obs(tpath,latlon,region)
latlon=[0 360 -90 90]; region='TR'; v1=clivar_ana_obs(tpath,latlon,region)
%%%%%%%%%%%%%%%%%%%%%%%%%
v.PNA=x; i=2;
z=-squeeze(x.eof_maps(:,:,i)); vbino=[-40:1:40];
figure; vbino=20;
cmin=-40; cmax=40; nn=64; caxis([cmin cmax]); 
cmap=bluewhitered(nn); cmap(nn/2:nn/2+1,:)=1;
axesm('stereo','Origin',[90 -90],'MapLatLimit',[20 90])
contourfm(v.lat,v.lon,z,vbino); hold on; shading flat; 
gridm on; colorbar; colormap(cmap); freezeColors;
contourm (v.lat,v.lon,v.lm,1,'k','LineWidth',1); 
%%%%%%%%%%%%%%%%%%%%%%%%%
pnai=pnaindex(); t_obs=[1950+1/12:1/12:2019+5/12]; pnai_obs=squeeze(pnai(:,3));
t1=349; t2=792; t_obs=t_obs(t1:t2); pnai_obs=pnai_obs(t1:t2);
t_mod=[1979+1/12:1/12:2016]; pnai_mod=-squeeze(x.pc(i,:));
figure; plot(t_obs,pnai_obs,'k*-'); hold on; plot(t_mod,pnai_mod,'s-');
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%
x=v.AO_z700; i=1; 
z=-squeeze(x.eof_maps(:,:,i)); vbino=[-40:1:40];
figure; vbino=20;
cmin=-40; cmax=40; nn=64; caxis([cmin cmax]); 
cmap=bluewhitered(nn); cmap(nn/2:nn/2+1,:)=1;
axesm('stereo','Origin',[90 0],'MapLatLimit',[20 90])
contourfm(v.lat,v.lon,z,vbino); hold on; shading flat; 
gridm on; colorbar; colormap(cmap); freezeColors;
contourm (v.lat,v.lon,v.lm,1,'k','LineWidth',1); 
%%%%%%%%%%%%%%%%%%%%%%%%%
aoi=aoindex(); t_obs=[1950+1/12:1/12:2019+5/12]; aoi_obs=squeeze(aoi(:,3));
t1=349; t2=792; t_obs=t_obs(t1:t2); aoi_obs=aoi_obs(t1:t2);
t_mod=[1979+1/12:1/12:2016]; 
x=v.AO_z1000; aoi_mod_z1000=-squeeze(x.pc(i,:));
x=v.AO_z700;  aoi_mod_z700 =-squeeze(x.pc(i,:));
x=v.AO_z500;  aoi_mod_z500 =-squeeze(x.pc(i,:));
figure; plot(t_obs,aoi_obs,'k*-'); hold on; 
plot(t_mod,aoi_mod_z1000,'rs-');
plot(t_mod,aoi_mod_z700, 'go-');
plot(t_mod,aoi_mod_z500, 'bd-');
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1; i=1;
x=v1.ENSO_ts;  z1=squeeze(x.eof_maps(:,:,i));vbin_z1=20;
x=v1.ENSO_psl; z2=squeeze(x.eof_maps(:,:,i));vbin_z2=20;
pms=[ 0, 0, 1200, 800]*0.8; 
handle = figure('Position', pms,'visible','on');
cmin=-40; cmax=40; nn=64; caxis([cmin cmax]); 
cmap=bluewhitered(nn); cmap(nn/2:nn/2+1,:)=1;
pcolor(v.lon,-v.lat,z1); hold on; shading flat;
grid on; colorbar; colormap(cmap); caxis([-1 1]); %freezeColors;
contour(v.lon,-v.lat, z2, vbin_z2,'k');
contour(v.lon,v.lat,v.lm,1,'k','LineWidth',1); 
%%%%%%%%%%%%%%%%%%%%%%%%%
aoi=ensoindex(); t_obs=[1950+1/12:1/12:2019+5/12]; aoi_obs=squeeze(aoi(:,3));
t1=349; t2=792; t_obs=t_obs(t1:t2); aoi_obs=aoi_obs(t1:t2);
t_mod=[1979+1/12:1/12:2016]; 
x=v.AO_z1000; aoi_mod_z1000=-squeeze(x.pc(i,:));
x=v.AO_z700;  aoi_mod_z700 =-squeeze(x.pc(i,:));
x=v.AO_z500;  aoi_mod_z500 =-squeeze(x.pc(i,:));
figure; plot(t_obs,aoi_obs,'k*-'); hold on; 
plot(t_mod,aoi_mod_z1000,'rs-');
plot(t_mod,aoi_mod_z700, 'go-');
plot(t_mod,aoi_mod_z500, 'bd-');
%%%%%%%%%%%%%%%%%%%%%%%%%
