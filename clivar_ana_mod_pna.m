function v=clivar_ana_mod_pna(tpath,expn,latlon,region,yr1,yr2,syr,nyr)
%load('/work/miz/mat_hiresmip/obs_clivar_ana_NH.mat'); vo=v;
%tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
%expn='c192L33_am4p0_amip_HIRESMIP_H8'; 
%latlon=[0 360 10 90]; region='NH'; yr1='1949';yr2='2014';syr=31;nyr=36;

[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
fn=strcat(tpath,expn,'/atmos.static.nc'); f=netcdf(fn,'nowrite'); 
v.glon=f{'lon'}(:); v.glat=f{'lat'}(:); v.latlon=latlon;
v.ys  =min(find(v.glat(:)>=lat1)); v.ye  =max(find(v.glat(:)<= lat2));
v.xs  =min(find(v.glon(:)>=lon1)); v.xe  =max(find(v.glon(:)<= lon2));
v.lat =v.glat(v.ys:v.ye); v.lon =v.glon(v.xs:v.xe);
v.nlon=length(v.lon); v.nlat=length(v.lat); v.ngrid=v.nlon*v.nlat;
a=f{'land_mask'}(v.ys:v.ye,v.xs:v.xe); v.lm=a; v.glm=f{'land_mask'}(:,:);
a=f{'zsurf'}    (v.ys:v.ye,v.xs:v.xe); v.zs=a; v.gzs=f{'zsurf'}(:,:);close(f);
%%% time period for analysis%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v.yr_beg=str2num(yr1)+syr-1; v.yr_end=v.yr_beg+nyr; v.time=[v.yr_beg+1/24:1/12:v.yr_end];
v.ts=(syr-1)*12+1; v.te=v.ts+nyr*12-1; v.nt=v.te-v.ts+1; 
v.nyr=v.nt/12; v.yr1=1; v.yr2=v.nyr; v.expn=expn; do_sample_plot=0;v

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in regional data for analysis of Modes of Variability;[0 360 20 90]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pp='/ts_all/'; fext =strcat('atmos.',yr1,'01-',yr2,'12.');
varn='hght'; fn=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fn,'nowrite');
k=1; %1000hPa
a=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a(a==-1000)=NaN;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); z1000=a; 
v.z1000_clm=squeeze(mean(a,2)); v.z1000_ann=squeeze(mean(v.z1000_clm,1));
a=v.z1000_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); z1000_ano=z1000-a;
k=3; %850hPa
a=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a(a==-1000)=NaN;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); z850=a; 
v.z850_clm=squeeze(mean(a,2)); v.z850_ann=squeeze(mean(v.z850_clm,1));
a=v.z850_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); z850_ano=z850-a;
k=5; %700hPa
a=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a(a==-1000)=NaN;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); z700=a; 
v.z700_clm=squeeze(mean(a,2)); v.z700_ann=squeeze(mean(v.z700_clm,1));
a=v.z700_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); z700_ano=z700-a;
k=7; %500hPa
a=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a(a==-1000)=NaN;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); z500=a; 
v.z500_clm=squeeze(mean(a,2)); v.z500_ann=squeeze(mean(v.z500_clm,1));
a=v.z500_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); z500_ano=z500-a;
close(f);
%================================================================
varn='slp'; fn=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fn,'nowrite');
a=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); slp=a;
v.slp_clm=squeeze(mean(a,2)); v.slp_ann=squeeze(mean(v.slp_clm,1));
a=v.slp_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); slp_ano=slp-a;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%end of read in regional data for analysis of Modes of Variability
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%prepare data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=v.lm; b=0.5;  a(a<b)=0; a(a>=b)=1; id_land=a; id_ocean=~id_land;
a=v.zs; b=3000; a(a<b)=0; a(a>=b)=1; id_topo=a; id_eof  =~id_topo;
%figure; contourf(v.lon,v.lat,id_land); colorbar;
%figure; contourf(v.lon,v.lat,id_topo); colorbar;
%figure; contourf(v.lon,v.lat,id_eof);  colorbar;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EOF analysis for PNA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=3; a=z500_ano; %below do m-month running mean
a=reshape(a,v.nt,v.nlat,v.nlon); a=movmean(a,m,1); a=reshape(a,12,v.nyr,v.nlat,v.nlon);
z500_ano_3mon=a;
%%%chose months and years for analysis%%%%%%%%%%%
m1=1; m2=12; y1=1; y2=nyr; nyr=y2-y1+1; nmn=m2-m1+1;
a=z500_ano     (m1:m2,y1:y2,:,:);
b=z500_ano_3mon(m1:m2,y1:y2,:,:);
for j=1:v.nlat
  a(:,:,j,:)=a(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
  b(:,:,j,:)=b(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
end
a=reshape(a,nyr*nmn,v.nlat,v.nlon); a=shiftdim(a,1);
b=reshape(b,nyr*nmn,v.nlat,v.nlon); b=shiftdim(b,1);
id=false(v.nlat,v.nlon); id_a=id; id_b=id;
for j=1:v.nlat
  for i=1:v.nlon
    a0=squeeze(a(j,i,:));
    b0=squeeze(b(j,i,:));
    if (sum(isnan(a0))==0); id_a(j,i)=true; end;
    if (sum(isnan(b0))==0); id_b(j,i)=true; end;
  end
end
N=20; 
x=myeof(a,N,id_a); v.PNA_z500=x; 
x=myeof(b,N,id_b); v.PNA_z500_3mon=x; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%sample plots for PNA pattern
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (do_sample_plot)
  x=v.PNA_z500_3mon; lat=v.lat; lon=v.lon; i=1; z=squeeze(x.eof_maps(:,:,i));
  pms=[0,0,1200,800]*1.5; h=figure('Position',pms,'visible','on');
  cmax=80; nbin=20; vbino=[-cmax:cmax/nbin:cmax]; %vbino=20; 
  axesm('stereo','Origin',[90 -90],'MapLatLimit',[10 90])
  contourfm(lat,lon,z,vbino); hold on; shading flat; colorbar; 
  caxis([-cmax cmax]); colormap(jet); gridm on;
  nn=64; cmap=bluewhitered(nn); cmap(nn/2:nn/2+1,:)=1; colormap(cmap); 
  contourm(v.lat,v.lon,v.lm,1,'k','LineWidth',1);
  figure; plot(v.PNA_z500.index1,'r'); hold on; plot(v.PNA_z500_3mon.index1,'g');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v.tpath=tpath; v.latlon=latlon;
fn=strcat('/work/miz/mat_AR/',expn,'_clivar_ana_aopna_',region,'.mat')
save(fn,'v','-v7.3'); %save(fn,'v');

return



load('/work/miz/mat_hiresmip/obs_clivar_ana_NH.mat'); vo=v;

x=v;
pms=[ 0, 0, 1200, 800]*0.8; handle = figure('Position', pms,'visible','on');
a=x.nino34.ssta_3mon; a(a<0)=0; 
b=x.nino34.ssta_3mon; b(b>0)=0; 
h=area(x.time,[a b]); h(1).FaceColor = [1 0 0]; h(2).FaceColor = [0 0 1];

%test and plotting:
tpath='/archive/Ming.Zhao/obs_for_am4p0_paper/';
latlon=[0 360  20 90]; region='NH'; v0=cvana(tpath,latlon,region)
latlon=[0 360 -70 70]; region='TR'; v1=cvana(tpath,latlon,region)
%%%%%%%%%%%%%%%%%%%%%%%%%
x=v; lat=x.lat; lon=x.lon; lm=x.lm; i=2;
z=-squeeze(x.PNA_z500.eof_maps(:,:,i));
figure; cmax=80; nbin=20; vbino=[-cmax:cmax/nbin:cmax]; %vbino=20; 
axesm('stereo','Origin',[90 -90],'MapLatLimit',[20 90])
contourfm(lat,lon,z,vbino); hold on; shading flat; colorbar; 
caxis([-cmax cmax]); colormap(jet); gridm on;
nn=64; cmap=bluewhitered(nn); cmap(nn/2:nn/2+1,:)=1; colormap(cmap); 
contourm (lat,lon,lm,1,'k','LineWidth',1); 
%%%%%%%%%%%%%%%%%%%%%%%%%
pnai=pnaindex(); 
t_obs=[1950+1/12:1/12:2019+5/12]; pnai_obs=squeeze(pnai(:,3));
%t1=349; t2=792; t_obs=t_obs(t1:t2); pnai_obs=pnai_obs(t1:t2);
t_mod=x.time; pnai_mod=-squeeze(x.PNA_z500.pc(i,:));
figure; plot(t_obs,pnai_obs,'k*-'); hold on; plot(t_mod,pnai_mod,'rs-');
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%
x=vo; lat=x.lat; lon=x.lon; i=1; 
z=-squeeze(x.AO_z700.eof_maps(:,:,i));
figure; cmax=50; vbino=[-cmax:cmax/20:cmax]; %vbino=20; 
axesm('stereo','Origin',[90 0],'MapLatLimit',[20 90])
contourfm(lat,lon,z,vbino); hold on; shading flat; colorbar; 
caxis([-cmax cmax]); colormap(jet); gridm on;
nn=64; cmap=bluewhitered(nn); cmap(nn/2:nn/2+1,:)=1; colormap(cmap); 
contourm (v.lat,v.lon,v.lm,1,'k','LineWidth',1); 
%%%%%%%%%%%%%%%%%%%%%%%%%
aoi=aoindex(); t_obs=[1950+1/12:1/12:2019+5/12]; aoi_obs=squeeze(aoi(:,3));
t1=349; t2=792; t_obs=t_obs(t1:t2); aoi_obs=aoi_obs(t1:t2);
t_mod=v.time;
x=v.AO_z1000; aoi_mod_z1000=-squeeze(x.pc(i,:));
x=v.AO_z700;  aoi_mod_z700 =-squeeze(x.pc(i,:));
x=v.AO_z500;  aoi_mod_z500 =-squeeze(x.pc(i,:));
x=v.AO_mslp;  aoi_mod_mslp =-squeeze(x.pc(i,:));
figure; %plot(t_obs,aoi_obs,'mp-'); hold on; 
plot(t_mod,-aoi_mod_z1000,'rs-'); hold on;
plot(t_mod,aoi_mod_z700, 'go-');
plot(t_mod,aoi_mod_z500, 'bd-');
plot(t_mod,aoi_mod_mslp, 'k*-');
plot([1979+1/24:1/12:2015],aoi_test(:,3),'yp-');
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
