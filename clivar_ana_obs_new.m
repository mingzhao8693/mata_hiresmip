function v=clivar_ana_obs_new() %tpath,latlon,region)
tpath='/archive/Ming.Zhao/obs_for_am4p0_paper/';
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v.ts=1; v.te=444; v.nt=v.te-v.ts+1; v.nyr=v.nt/12; v.yr1=1; v.yr2=v.nyr;%197901-201512
%v.ts=1; v.te=264; v.nt=v.te-v.ts+1; v.nyr=v.nt/12; v.yr1=1; v.yr2=v.nyr %197901-200012
v.time=[1979+1/24:1/12:2016];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,'/ERA_interim/monthly/t_skin.197901-201512.nc');
f=netcdf(fn,'nowrite'); v.glon=f{'longitude'}(:); v.glat=f{'latitude'}(:); 
v.nglon=length(v.glon); v.nglat=length(v.glat);
a=f{'t_skin'}(v.ts:v.te,:,:); close(f);
a=reshape(a,12,v.nt/12,v.nglat,v.nglon); ts=a;
v.ts_clm=squeeze(mean(a,2)); v.ts_ann=squeeze(mean(v.ts_clm,1));
a=v.ts_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); ts_ano=ts-a;
latlon=[270 280 -10 0]; v.nino12=get_region_avg(v.glat,v.glon,ts_ano,latlon);
latlon=[210 270 -5 5];  v.nino3 =get_region_avg(v.glat,v.glon,ts_ano,latlon);
latlon=[160 210 -5 5];  v.nino4 =get_region_avg(v.glat,v.glon,ts_ano,latlon);
latlon=[190 240 -5 5];  v.nino34=get_region_avg(v.glat,v.glon,ts_ano,latlon);
latlon=[190 240 -5 5];  v.oni   =get_region_avg(v.glat,v.glon,ts_ano,latlon);
%How to plot ENSO index%%
%pms=[ 0, 0, 1200, 800]*0.8; handle = figure('Position', pms,'visible','on');
%a=v.nino34.ssta_5mon; a(a<0)=0; 
%b=v.nino34.ssta_5mon; b(b>0)=0; 
%h=area(v.time,[a b]); h(1).FaceColor = [1 0 0]; h(2).FaceColor = [0 0 1];
%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,'ERA_interim/monthly/msl.197901-201512.nc');
f=netcdf(fn,'nowrite'); a=f{'msl'}(v.ts:v.te,:,:); close(f);
a=reshape(a,12,v.nt/12,v.nglat,v.nglon); psl=a;
v.psl_clm=squeeze(mean(a,2)); v.psl_ann=squeeze(mean(v.psl_clm,1));
a=v.psl_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); psl_ano=psl-a;
%%%%%%%%%%%%%%%%%%%%%%%%%
%ENSO regression
%%%%%%%%%%%%%%%%%%%%%%%%%
m=3; a=ts_ano; %below do m-month running mean
a=reshape(a,v.nt,v.nglat,v.nglon); a=movmean(a,m,1); a=reshape(a,12,v.nyr,v.nglat,v.nglon);
ts_ano_3mon=a;
m=3; a=psl_ano;%below do m-month running mean
a=reshape(a,v.nt,v.nglat,v.nglon); a=movmean(a,m,1); a=reshape(a,12,v.nyr,v.nglat,v.nglon);
psl_ano_3mon=a;
%%%%%%%%%%%%%%%%%%%%%%%%%
do_enso_regression = false
if (do_enso_regression)
  m1=1; m=3; m2=12; y1=1; y2=37; nyr=y2-y1+1; nmn=m2-m1+1;
  a =ts_ano_3mon (m1:m:m2,y1:y2,:,:);
  b =psl_ano_3mon(m1:m:m2,y1:y2,:,:);
  for m=1:length(a(:,1,1,1));
    x0=squeeze(v.nino34.ssta_3mon_2d(m,:));
    for j=1:v.nglat
      disp(v.glat(j));
      for i=1:v.nglon
	a0=squeeze(a(m,:,j,i)); a0=detrend(a0,'linear');
	b0=squeeze(b(m,:,j,i)); b0=detrend(b0,'linear');
	%c=corrcoef(x0,a0);   v.ssta.corr.nino34(m,j,i)=c(1,2);
	%c=polyfit (x0,a0,1); v.ssta.slop.nino34(m,j,i)=c(1);
	c=corrcoef(x0,b0);   v.psla.corr.nino34(m,j,i)=c(1,2);
	c=polyfit (x0,b0,1); v.psla.slop.nino34(m,j,i)=c(1);
      end
    end
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%
%EOF analysis for ENSO
%%%%%%%%%%%%%%%%%%%%%%%%%
do_enso_eof_analysis = false
if (do_enso_eof_analysis)
  m1=1; m2=12; y1=1; y2=37; nyr=y2-y1+1; nmn=m2-m1+1;
  a=ts_ano (m1:m2,y1:y2,:,:);
  b=psl_ano(m1:m2,y1:y2,:,:);
  for j=1:v.nlat
    a(:,:,j,:)=a(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
    b(:,:,j,:)=b(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
  end
  a=reshape(a,nyr*nmn,v.nglat,v.nglon); a=shiftdim(a,1);
  b=reshape(b,nyr*nmn,v.nglat,v.nglon); b=shiftdim(b,1);
  N=20;
  x=myeof(a,N); v.ENSO_ts =x;
  x=myeof(b,N); v.ENSO_psl=x;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
latlon=[0 360 20 90]; region='NAM'; 
p=read_erai_region(tpath,latlon,region,v.ts,v.te);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=p.lm; b=0.5;   a(a<b)=0; a(a>=b)=1; id_land=a; id_ocean=~id_land;
a=p.zs; b=30000; a(a<b)=0; a(a>=b)=1; id_topo=a; id_eof  =~id_topo;
%figure; contourf(p.lon,p.lat,id_land); colorbar;
%figure; contourf(p.lon,p.lat,id_topo); colorbar;
%figure; contourf(p.lon,p.lat,id_eof);  colorbar;
%%%%%%%%%%%%%%%%%%%%%%%%%
%EOF analysis for NAM
%%%%%%%%%%%%%%%%%%%%%%%%%
m1=1; m2=12; y1=1; y2=37; nyr=y2-y1+1; nmn=m2-m1+1;
a=p.z1000_ano; b=p.z700_ano; c=p.z500_ano; d=p.msl_ano;
for j=1:p.nlat
  a(:,:,j,:)=a(:,:,j,:)*sqrt(cos(p.lat(j)/180*pi));
  b(:,:,j,:)=b(:,:,j,:)*sqrt(cos(p.lat(j)/180*pi));
  c(:,:,j,:)=c(:,:,j,:)*sqrt(cos(p.lat(j)/180*pi));
  d(:,:,j,:)=d(:,:,j,:)*sqrt(cos(p.lat(j)/180*pi));
end
a=reshape(a,nyr*nmn,p.nlat,p.nlon); a=shiftdim(a,1);
b=reshape(b,nyr*nmn,p.nlat,p.nlon); b=shiftdim(b,1);
c=reshape(c,nyr*nmn,p.nlat,p.nlon); c=shiftdim(c,1);
d=reshape(d,nyr*nmn,p.nlat,p.nlon); d=shiftdim(d,1);
N=20;
x=myeof(a,N); v.NAM_z1000=x; 
x=myeof(b,N); v.NAM_z700 =x;
x=myeof(c,N); v.NAM_z500 =x;
x=myeof(c,N); v.NAM_mslp =x;
v.p_nam=p;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
latlon=[120 360 0 90]; region='PNA'; v.pna_time=[1979+1/24:1/12:2016];
p=read_erai_region(tpath,latlon,region,v.ts,v.te);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%reading PNA index directly
fn='pnaindex_ncep_mon.txt'; x=read_pnaindex(fn,1979,2015,0.5); v.pna_e0=x;
fn='pnaindex_ncep.txt';     x=read_pnaindex(fn,1979,2015,0.5); v.pna_e1=x;
fn='pnaindex.txt';          x=read_pnaindex(fn,1979,2015,0.5); v.pna_e2=x;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ a=p.z500_ano; lat=p.lat; lon=p.lon; m1=1; m2=12;%Wallace & Gutzler method
% $$$ latlon=[198 202 18 22]; z1=get_region_varx(a,lat,lon,latlon,m1,m2);%20N,160W(200E)
% $$$ latlon=[193 197 43 47]; z2=get_region_varx(a,lat,lon,latlon,m1,m2);%45N,165W(195E)
% $$$ latlon=[243 247 53 57]; z3=get_region_varx(a,lat,lon,latlon,m1,m2);%55N,115W(245E)
% $$$ latlon=[273 277 28 32]; z4=get_region_varx(a,lat,lon,latlon,m1,m2);%30N,85W(275E)
% $$$ a=0.25*(z1-z2+z3-z4); a=a./std(a); v.pna_index_WG1=a;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=p.z500_ano; lat=p.lat; lon=p.lon; m1=1; m2=12;%Wallace & Gutzler method
latlon=[180 220 15 25]; z1=get_region_varx(a,lat,lon,latlon,m1,m2);%20N,160W(200E)
latlon=[180 220 40 50]; z2=get_region_varx(a,lat,lon,latlon,m1,m2);%45N,165W(195E)
latlon=[235 255 45 60]; z3=get_region_varx(a,lat,lon,latlon,m1,m2);%55N,115W(245E)
latlon=[270 290 25 35]; z4=get_region_varx(a,lat,lon,latlon,m1,m2);%30N,85W(275E)
a=0.25*(z1-z2+z3-z4); a=a./std(a); v.pna_wg=a; %close to PNA_e0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=p.lm; b=0.5;   a(a<b)=0; a(a>=b)=1; id_land=a; id_ocean=~id_land;
a=p.zs; b=30000; a(a<b)=0; a(a>=b)=1; id_topo=a; id_eof  =~id_topo;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%EOF analysis for PNA
%%%%%%%%%%%%%%%%%%%%%%%%%
m=3; a=p.z500_ano; %below do m-month running mean
a=reshape(a,p.nt,p.nlat,p.nlon); a=movmean(a,m,1); a=reshape(a,12,p.nyr,p.nlat,p.nlon);
p.z500_ano_3mon=a;
%chose months and years for analysis%%%%%%%%%%%
m1=1; m2=12; y1=1; y2=v.nyr; nyr=y2-y1+1; nmn=m2-m1+1;
a=p.z500_ano     (m1:m2,y1:y2,:,:);
b=p.z500_ano_3mon(m1:m2,y1:y2,:,:);
for j=1:p.nlat
  a(:,:,j,:)=a(:,:,j,:)*sqrt(cos(p.lat(j)/180*pi));
  b(:,:,j,:)=b(:,:,j,:)*sqrt(cos(p.lat(j)/180*pi));
end
a=reshape(a,nyr*nmn,p.nlat,p.nlon); a=shiftdim(a,1);
b=reshape(b,nyr*nmn,p.nlat,p.nlon); b=shiftdim(b,1);
N=4;
x=myeof(a,N); v.PNA_z500=x; x=myeof(b,N); v.PNA_z500_3mon=x;
v.p_pna=p;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%test how to rotate eof
%eof_maps=x.eof_maps; pc=x.pc;
%[y rotmax]=varimax(x.pc);
%eof_maps_rot=x.eof_maps*rotmax;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%sample plots for PNA pattern
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
do_sample_plot = false
if (do_sample_plot)
  x=v.PNA_z500; %2nd EOF correspond to negative PNA 
  i=2; z1=-squeeze(x.eof(:,:,i)); lat=p.lat; lon=p.lon; lm=p.lm;
  %i=2; z2= squeeze(w.eof(:,:,i)); z2=z2'; lat=double(w.lat); lon=double(w.lon);
  pms=[0,0,1200,800]*0.8; h=figure('Position',pms,'visible','on');
  cmax=80; nbin=20; vbino=[-cmax:cmax/nbin:cmax]; %vbino=20; 
  axesm('stereo','Origin',[90 -90],'MapLatLimit',[10 90])
  contourfm(lat,lon,z1,vbino); hold on; shading flat; colorbar; 
  caxis([-cmax cmax]); colormap(jet); gridm on;
  nn=64; cmap=bluewhitered(nn); cmap(nn/2:nn/2+1,:)=1; colormap(cmap); 
  contourm(lat,lon,lm,1,'k','LineWidth',1);
  %==============================================================  
  r=corrcoef(v.PNA_external.pnai,-v.PNA_z500.index2); disp(r);
  pms=[0,0,1200,800]*1.5; h=figure('Position',pms,'visible','on');
  plot(v.PNA_z500.index2,'-rs'); hold on; plot(-v.PNA_external.pnai,'-b.');
%  plot(-w.eof_ts(:,2),'-g*');
end
% $$$ m1=1; m2=12; y1=1; y2=37; nyr=y2-y1+1; nmn=m2-m1+1;
% $$$ a=z500_ano(m1:m2,y1:y2,:,:);
% $$$ for j=1:v.nlat
% $$$   a(:,:,j,:)=a(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
% $$$ end
% $$$ a=reshape(a,nyr*nmn,v.nlat,v.nlon); a=shiftdim(a,1);
% $$$ N=20; x=myeof(a,N); v.PNA_z500=x; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute PJ index and EASJ index%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
latlon=[110 170 10 50]; region='EA'; v.pna_time=[1979+1/24:1/12:2016];
p=read_erai_region(tpath,latlon,region,v.ts,v.te);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=p.z850_ano; lat=p.lat; lon=p.lon; m1=1; m2=12;%Wallace & Gutzler method
latlon=[120 130 20 25]; z1=get_region_varx(a,lat,lon,latlon,m1,m2);%20N,160W(200E)
latlon=[150 160 30 40]; z2=get_region_varx(a,lat,lon,latlon,m1,m2);%45N,165W(195E)
a=(z2-z1)/2; a=(a-mean(a))./std(a); v.pj_index=a;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=p.u200_ano;
latlon=[130 160 30 35]; z1=get_region_varx(a,lat,lon,latlon,m1,m2);%20N,160W(200E)
a=z1; a=(a-mean(a))./std(a); v.easj_index=a;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
v.tpath=tpath; v.p_nam=0; v.p_pna=0; %reduce data
fn=strcat('/work/miz/mat_hiresmip/clivar_ana_obs_new.mat')
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
