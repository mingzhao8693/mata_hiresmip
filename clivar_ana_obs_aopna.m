function v=clivar_ana_obs_aopna(tpath,expn,latlon,region)
%tpath='/archive/Ming.Zhao/obs_for_am4p0_paper/'; 
%expn='ERA_interim'; latlon=[0 360 10 90]; region='NH';
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
fn=strcat(tpath,expn,'/monthly/land_mask.nc'); do_sample_plot=0;
f=netcdf(fn,'nowrite'); 
v.lon=f{'lon'}(:); v.lat=f{'lat'}(:); 
v.ys  =min(find(v.lat(:)<=lat2)); v.ye  =max(find(v.lat(:)>= lat1));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat =v.lat(v.ys:v.ye); v.lon =v.lon(v.xs:v.xe);
v.nlon=length(v.lon); v.nlat=length(v.lat); v.ngrid=v.nlon*v.nlat;
a=f{'land_mask'}(:,v.ys:v.ye,v.xs:v.xe);
v.lm=a*1.52594875864068e-05+0.499992370256207; close(f);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,expn,'/monthly/z_sfc.nc');
f=netcdf(fn,'nowrite'); a=f{'z'}(:,v.ys:v.ye,v.xs:v.xe); 
v.zs=a*0.825278867135642+26007.6759836133; v.zs=v.zs/G; close(f); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v.yr_beg=1979; v.yr_end=2014; v.time=[v.yr_beg+1/24:1/12:v.yr_end+1];
v.ts=1; v.te=432; v.nt=v.te-v.ts+1; v.nyr=v.nt/12; v.yr1=1; v.yr2=v.nyr;%197901-201412
%v.ts=1; v.te=444; v.nt=v.te-v.ts+1; v.nyr=v.nt/12; v.yr1=1; v.yr2=v.nyr;%197901-201512
%v.ts=1; v.te=264; v.nt=v.te-v.ts+1; v.nyr=v.nt/12; v.yr1=1; v.yr2=v.nyr %197901-200012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in regional data for analysis of Modes of Variability;[0 360 20 90]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='z'; fn=strcat(tpath,expn,'/monthly/',varn,'.197901-201512.nc'); 
f=netcdf(fn,'nowrite'); 
k=37; %1000hPa
a=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a=squeeze(a)/G;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); z1000=a; 
v.z1000_clm=squeeze(mean(a,2)); v.z1000_ann=squeeze(mean(v.z1000_clm,1));
a=v.z1000_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); z1000_ano=z1000-a;
k=31; %850hPa
a=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a=squeeze(a)/G;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); z850=a;
v.z850_clm=squeeze(mean(a,2)); v.z850_ann=squeeze(mean(v.z850_clm,1));
a=v.z850_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3);
a=permute(a,[2 1 3 4]); z850_ano=z850-a;
k=26; %700hPa
a=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a=squeeze(a)/G;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); z700=a; 
v.z700_clm=squeeze(mean(a,2)); v.z700_ann=squeeze(mean(v.z700_clm,1));
a=v.z700_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); z700_ano=z700-a;
k=22; %500hPa
a=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a=squeeze(a)/G;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); z500=a; 
v.z500_clm=squeeze(mean(a,2)); v.z500_ann=squeeze(mean(v.z500_clm,1));
a=v.z500_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); z500_ano=z500-a;
close(f);
%================================================================
varn='msl'; fn=strcat(tpath,expn,'/monthly/',varn,'.197901-201512.nc'); 
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
%EOF analysis for Arctic Oscillation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m1=1; m2=12; y1=1; y2=v.nyr; nyr=y2-y1+1; nmn=m2-m1+1;
a=z1000_ano; b=z850_ano; c=z700_ano; d=z500_ano; e=slp_ano;
for j=1:v.nlat
  a(:,:,j,:)=a(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
  b(:,:,j,:)=b(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
  c(:,:,j,:)=c(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
  d(:,:,j,:)=d(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
  e(:,:,j,:)=e(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
end
a=reshape(a,nyr*nmn,v.nlat,v.nlon); a=shiftdim(a,1);
b=reshape(b,nyr*nmn,v.nlat,v.nlon); b=shiftdim(b,1);
c=reshape(c,nyr*nmn,v.nlat,v.nlon); c=shiftdim(c,1);
d=reshape(d,nyr*nmn,v.nlat,v.nlon); d=shiftdim(d,1);
e=reshape(e,nyr*nmn,v.nlat,v.nlon); e=shiftdim(e,1);
N=20;
x=myeof(a,N); v.AO_z1000=x; 
x=myeof(b,N); v.AO_z850 =x;
x=myeof(c,N); v.AO_z700 =x;
x=myeof(d,N); v.AO_z500 =x;
x=myeof(e,N); v.AO_slp  =x;
%additional verification by read in external AO index data
x=read_aoindex(1979,2014,0.5); v.AO_external=x;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%sample plots for EOFs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (do_sample_plot)
  x=v.AO_z1000; lat=v.lat; lon=v.lon;
  i=1; z=-squeeze(x.eof_maps(:,:,i)); %1st EOF corresponds to negative AO
  pms=[0,0,1200,800]*1.5; h=figure('Position',pms,'visible','on');
  cmax=50; vbino=[-cmax:cmax/20:cmax]; %vbino=20; 
  axesm('stereo','Origin',[90 0],'MapLatLimit',[10 90])
  contourfm(lat,lon,z,vbino); hold on; shading flat; colorbar; 
  caxis([-cmax cmax]); colormap(jet); gridm on;
  nn=64; cmap=bluewhitered(nn); cmap(nn/2:nn/2+1,:)=1; colormap(cmap); 
  contourm(v.lat,v.lon,v.lm,1,'k','LineWidth',1);
  %==============================================================
  r=corrcoef(v.AO_external.aoi,-v.AO_z1000.index1); x=v.time; disp(r);
  pms=[0,0,1200,800]*1.5; h=figure('Position',pms,'visible','on');
  plot(x,-v.AO_z1000.index1,'r'); hold on; plot(x,v.AO_external.aoi,'m');
  plot(x,-v.AO_z850.index1, 'g'); plot(x,-v.AO_z700.index1, 'b'); 
  plot(x,-v.AO_z500.index1, 'k'); plot(x,-v.AO_slp.index1, 'c');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EOF analysis for PNA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=z500_ano; lat=v.lat; lon=v.lon; m1=1; m2=12;%Wallace & Gutzler method
latlon=[198 202 18 22]; z1=get_region_varx(a,lat,lon,latlon,m1,m2);%20N,160W(200E)
latlon=[193 197 43 47]; z2=get_region_varx(a,lat,lon,latlon,m1,m2);%45N,165W(195E)
latlon=[243 247 53 57]; z3=get_region_varx(a,lat,lon,latlon,m1,m2);%55N,115W(245E)
latlon=[273 277 28 32]; z4=get_region_varx(a,lat,lon,latlon,m1,m2);%30N,85W(275E)
a=0.25*(z1-z2+z3-z4); a=a./std(a); v.pna_index_WG=a;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=3; a=z500_ano; %below do m-month running mean
a=reshape(a,v.nt,v.nlat,v.nlon); a=movmean(a,m,1); a=reshape(a,12,v.nyr,v.nlat,v.nlon);
z500_ano_3mon=a;
%%%chose months and years for analysis%%%%%%%%%%%
m1=1; m2=12; y1=1; y2=v.nyr; nyr=y2-y1+1; nmn=m2-m1+1;
a=z500_ano     (m1:m2,y1:y2,:,:);
b=z500_ano_3mon(m1:m2,y1:y2,:,:);
for j=1:v.nlat
  a(:,:,j,:)=a(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
  b(:,:,j,:)=b(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
end
a=reshape(a,nyr*nmn,v.nlat,v.nlon); a=shiftdim(a,1);
b=reshape(b,nyr*nmn,v.nlat,v.nlon); b=shiftdim(b,1);
N=20;
x=myeof(a,N); v.PNA_z500=x; 
x=myeof(b,N); v.PNA_z500_3mon=x;
%additional verification by read in external AO index data
x=read_pnaindex(1979,2014,0.5); v.PNA_external=x;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%sample plots for PNA pattern
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (do_sample_plot)
  x=v.PNA_z500; lat=v.lat; lon=v.lon; 
  i=2; z=-squeeze(x.eof_maps(:,:,i)); %2nd EOF correspond to negative PNA
  pms=[0,0,1200,800]*1.5; h=figure('Position',pms,'visible','on');
  cmax=80; nbin=20; vbino=[-cmax:cmax/nbin:cmax]; %vbino=20; 
  axesm('stereo','Origin',[90 -90],'MapLatLimit',[10 90])
  contourfm(lat,lon,z,vbino); hold on; shading flat; colorbar; 
  caxis([-cmax cmax]); colormap(jet); gridm on;
  nn=64; cmap=bluewhitered(nn); cmap(nn/2:nn/2+1,:)=1; colormap(cmap); 
  contourm(v.lat,v.lon,v.lm,1,'k','LineWidth',1);
  %==============================================================  
  r=corrcoef(v.PNA_external.pnai,-v.PNA_z500.index2); disp(r);
  pms=[0,0,1200,800]*1.5; h=figure('Position',pms,'visible','on');
  plot(v.PNA_z500.index2,'r'); hold on; plot(-v.PNA_external.pnai,'m');
  plot(v.PNA_z500_3mon.index2,'g');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
v.tpath=tpath; v.latlon=latlon;
fn=strcat('/work/miz/mat_AR/',expn,'_clivar_ana_obs_aopna','_',region,'.mat')
save(fn,'v','-v7.3'); %save(fn,'v');

return


%test and plotting:
tpath='/archive/Ming.Zhao/obs_for_am4p0_paper/';
latlon=[0 360  20 90]; region='NH'; v0=cvana(tpath,latlon,region)
latlon=[0 360 -70 70]; region='TR'; v1=cvana(tpath,latlon,region)
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
