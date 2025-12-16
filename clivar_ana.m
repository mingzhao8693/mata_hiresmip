function v=clivar_ana(tpath,latlon,region)
%load('/work/miz/mat_hiresmip/obs_clivar_ana_NH.mat'); vo=v;
tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn='c192L33_am4p0_amip_HIRESMIP_H8';
latlon=[0 360 20 90]; region='NH';
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
fn=strcat(tpath,expn,'/atmos.static.nc');
f=netcdf(fn,'nowrite'); 
v.lon=f{'lon'}(:); v.lat=f{'lat'}(:); 
v.ys  =min(find(v.lat(:)>=lat1)); v.ye  =max(find(v.lat(:)<= lat2));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat =v.lat(v.ys:v.ye); v.lon =v.lon(v.xs:v.xe);
v.nlon=length(v.lon); v.nlat=length(v.lat); v.ngrid=v.nlon*v.nlat;
a=f{'land_mask'}(v.ys:v.ye,v.xs:v.xe); v.lm=a; v.glm=f{'land_mask'}(:,:);
a=f{'zsurf'}    (v.ys:v.ye,v.xs:v.xe); v.zs=a; close(f);
%%%%%%%%%%%%%%%%%%%%%%%%%
v.ts=13; v.te=792; v.nt=v.te-v.ts+1; v.nyr=v.nt/12; v.yr1=1; v.yr2=v.nyr;%197901-201512
v.time=[1950+1/24:1/12:2015];
%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,expn,'/ts_all/atmos.194901-201412.t_surf.nc');
f=netcdf(fn,'nowrite'); v.glon=f{'lon'}(:); v.glat=f{'lat'}(:); 
v.nglon=length(v.glon); v.nglat=length(v.glat);
a=f{'t_surf'}(v.ts:v.te,:,:); close(f);
a=reshape(a,12,v.nt/12,v.nglat,v.nglon); ts=a;
v.ts_clm=squeeze(mean(a,2)); v.ts_ann=squeeze(mean(v.ts_clm,1));
a=v.ts_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); ts_ano=ts-a;
%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,expn,'/ts_all/atmos.194901-201412.precip.nc');
f=netcdf(fn,'nowrite'); a=f{'precip'}(v.ts:v.te,:,:); close(f);
a=reshape(a,12,v.nt/12,v.nglat,v.nglon); pr=a;
v.pr_clm=squeeze(mean(a,2)); v.pr_ann=squeeze(mean(v.pr_clm,1));
a=v.pr_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); pr_ano=pr-a;
%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,expn,'/ts_all/atmos.194901-201412.u_ref.nc');
f=netcdf(fn,'nowrite'); a=f{'u_ref'}(v.ts:v.te,:,:); close(f);
a=reshape(a,12,v.nt/12,v.nglat,v.nglon); u10=a;
v.u10_clm=squeeze(mean(a,2)); v.u10_ann=squeeze(mean(v.u10_clm,1));
a=v.u10_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); u10_ano=u10-a;
%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,expn,'/ts_all/atmos.194901-201412.v_ref.nc');
f=netcdf(fn,'nowrite'); a=f{'v_ref'}(v.ts:v.te,:,:); close(f);
a=reshape(a,12,v.nt/12,v.nglat,v.nglon); v10=a;
v.v10_clm=squeeze(mean(a,2)); v.v10_ann=squeeze(mean(v.v10_clm,1));
a=v.v10_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); v10_ano=v10-a;
%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,expn,'/ts_all/atmos.194901-201412.hght.nc');
f=netcdf(fn,'nowrite'); 
k=3; a=f{'hght'}(v.ts:v.te,k,:,:); a(a==-1000)=NaN;
a=reshape(a,12,v.nt/12,v.nglat,v.nglon); z850=a; 
v.z850_clm=squeeze(mean(a,2)); v.z850_ann=squeeze(mean(v.z850_clm,1));
a=v.z850_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); z850_ano=z850-a;
%%%%%%%%%%%%%%%%%%%%%%%%%
latlon=[270 280 -10 0]; v.nino12=get_region_avg(v.glat,v.glon,ts_ano,latlon);
latlon=[210 270 -5 5];  v.nino3 =get_region_avg(v.glat,v.glon,ts_ano,latlon);
latlon=[160 210 -5 5];  v.nino4 =get_region_avg(v.glat,v.glon,ts_ano,latlon);
latlon=[190 240 -5 5];  v.nino34=get_region_avg(v.glat,v.glon,ts_ano,latlon);
latlon=[190 240 -5 5];  v.oni   =get_region_avg(v.glat,v.glon,ts_ano,latlon);
% $$$ %how to plot%%%%%%%%%%%%%%%
% $$$ pms=[ 0, 0, 1200, 800]*0.8; handle = figure('Position', pms,'visible','on');
% $$$ a=v.nino34.ssta_5mon; a(a<0)=0; 
% $$$ b=v.nino34.ssta_5mon; b(b>0)=0; 
% $$$ h=area(v.time,[a b]); h(1).FaceColor = [1 0 0]; h(2).FaceColor = [0 0 1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ENSO EOF analysis:SST & PCP%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
latlon=[120 280 -30 30];
enso=get_region(v.glat,v.glon,ts_ano,pr_ano,u10_ano,v10_ano,latlon,v.glm);
x=enso; m1=1; m2=12; y1=1; y2=v.nyr; nyr=y2-y1+1; nmn=m2-m1+1;
a=x.sstx(m1:m2,y1:y2,:,:);
b=x.pcpx(m1:m2,y1:y2,:,:);
for j=1:x.nlat
  a(:,:,j,:)=a(:,:,j,:)*sqrt(cos(x.lat(j)/180*pi));
  b(:,:,j,:)=b(:,:,j,:)*sqrt(cos(x.lat(j)/180*pi));
end
a=reshape(a,nyr*nmn,x.nlat*x.nlon); 
b=reshape(b,nyr*nmn,x.nlat*x.nlon); c=[a b];
[L, EOFs, EC, error, norms] = EOF(c, 2);
d=squeeze(EOFs(1:30720,1));   d=reshape(d,x.nlat,x.nlon); figure; contourf(d);colormap(jet);colorbar;
d=squeeze(EOFs(30721:end,1)); d=reshape(d,x.nlat,x.nlon); figure; contourf(d);colormap(jet);colorbar;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ENSO EOF analysis%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=enso; m1=1; m2=12; y1=1; y2=v.nyr; nyr=y2-y1+1; nmn=m2-m1+1;
a=x.sstx(m1:m2,y1:y2,:,:);
b=x.pcpx(m1:m2,y1:y2,:,:);
for j=1:x.nlat
  a(:,:,j,:)=a(:,:,j,:)*sqrt(cos(x.lat(j)/180*pi));
  b(:,:,j,:)=b(:,:,j,:)*sqrt(cos(x.lat(j)/180*pi));
end
a=reshape(a,nyr*nmn,x.nlat,x.nlon); a=shiftdim(a,1);
%id=false(x.nlat,x.nlon); id(x.lm==0)=1;
N=2; y=myeof(a,N); v.ENSO_ssta=y; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AMM EOF analysis: SST %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
latlon=[286 375 -21 32]; %latlon=[120 280 -30 30];
amm=get_region(v.glat,v.glon,ts_ano,pr_ano,u10_ano,v10_ano,latlon,v.glm);
x=amm; m1=1; m2=12; y1=1; y2=v.nyr; nyr=y2-y1+1; nmn=m2-m1+1;
a=x.sstx(m1:m2,y1:y2,:,:);
for j=1:x.nlat
  a(:,:,j,:)=a(:,:,j,:)*sqrt(cos(x.lat(j)/180*pi));
end
a=reshape(a,nyr*nmn,x.nlat,x.nlon); a=shiftdim(a,1);
id=false(x.nlat,x.nlon); id(x.lm==0)=1;
N=20; y=myeof(a,N,id); v.AMM_ssta=y; 
%figure; contourf(squeeze(-v.AMM_ssta.eof_maps(:,:,1)));colormap(jet);colorbar;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ENSO EOF regression%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,expn,'/ts_all/atmos.194901-201412.slp.nc');
f=netcdf(fn,'nowrite'); a=f{'slp'}(v.ts:v.te,:,:); close(f);
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
do_regression = false
if (do_regression)
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
% $$$ m1=1; m2=12; y1=1; y2=37; nyr=y2-y1+1; nmn=m2-m1+1;
% $$$ a=ts_ano (m1:m2,y1:y2,:,:);
% $$$ b=psl_ano(m1:m2,y1:y2,:,:);
% $$$ for j=1:v.nlat
% $$$   a(:,:,j,:)=a(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
% $$$   b(:,:,j,:)=b(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
% $$$ end
% $$$ a=reshape(a,nyr*nmn,v.nglat,v.nglon); a=shiftdim(a,1);
% $$$ b=reshape(b,nyr*nmn,v.nglat,v.nglon); b=shiftdim(b,1);
% $$$ N=20;
% $$$ x=myeof(a,N); v.ENSO_ts =x;
% $$$ x=myeof(b,N); v.ENSO_psl=x;
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,expn,'/ts_all/atmos.194901-201412.hght.nc');
f=netcdf(fn,'nowrite'); 
k=1; a=f{'hght'}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a(a==-1000)=NaN;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); z1000=a; 
v.z1000_clm=squeeze(mean(a,2)); v.z1000_ann=squeeze(mean(v.z1000_clm,1));
a=v.z1000_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); z1000_ano=z1000-a;
% $$$ k=3; a=f{'hght'}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a(a==-1000)=NaN;
% $$$ a=reshape(a,12,v.nt/12,v.nlat,v.nlon); z850=a; 
% $$$ v.z850_clm=squeeze(mean(a,2)); v.z850_ann=squeeze(mean(v.z850_clm,1));
% $$$ a=v.z850_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
% $$$ a=permute(a,[2 1 3 4]); z850_ano=z850-a;
k=5; a=f{'hght'}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a(a==-1000)=NaN;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); z700=a; 
v.z700_clm=squeeze(mean(a,2)); v.z700_ann=squeeze(mean(v.z700_clm,1));
a=v.z700_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); z700_ano=z700-a;
k=7; a=f{'hght'}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a(a==-1000)=NaN;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); z500=a; 
v.z500_clm=squeeze(mean(a,2)); v.z500_ann=squeeze(mean(v.z500_clm,1));
a=v.z500_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); z500_ano=z500-a;
close(f);
%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,expn,'/ts_all/atmos.194901-201412.slp.nc');
f=netcdf(fn,'nowrite'); a=f{'slp'}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); slp=a;
v.slp_clm=squeeze(mean(a,2)); v.slp_ann=squeeze(mean(v.slp_clm,1));
a=v.slp_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); slp_ano=slp-a;
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
a=v.lm; b=0.5;   a(a<b)=0; a(a>=b)=1; id_land=a; id_ocean=~id_land;
a=v.zs; b=30000; a(a<b)=0; a(a>=b)=1; id_topo=a; id_eof  =~id_topo;
%figure; contourf(v.lon,v.lat,id_land); colorbar;
%figure; contourf(v.lon,v.lat,id_topo); colorbar;
%figure; contourf(v.lon,v.lat,id_eof);  colorbar;
%%%%%%%%%%%%%%%%%%%%%%%%%
%EOF analysis for AO
%%%%%%%%%%%%%%%%%%%%%%%%%
m1=1; m2=12; y1=1; y2=v.nyr; nyr=y2-y1+1; nmn=m2-m1+1;
a=z1000_ano; b=z700_ano; c=z500_ano; d=slp_ano;
for j=1:v.nlat
  a(:,:,j,:)=a(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
  b(:,:,j,:)=b(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
  c(:,:,j,:)=c(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
  d(:,:,j,:)=d(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
end
a=reshape(a,nyr*nmn,v.nlat,v.nlon); a=shiftdim(a,1);
b=reshape(b,nyr*nmn,v.nlat,v.nlon); b=shiftdim(b,1);
c=reshape(c,nyr*nmn,v.nlat,v.nlon); c=shiftdim(c,1);
d=reshape(d,nyr*nmn,v.nlat,v.nlon); d=shiftdim(d,1);
id=false(v.nlat,v.nlon); id_a=id; id_b=id; id_c=id; id_d=id;
for j=1:v.nlat
  for i=1:v.nlon
    a0=squeeze(a(j,i,:));
    b0=squeeze(b(j,i,:)); 
    c0=squeeze(c(j,i,:));
    d0=squeeze(d(j,i,:));
    if (sum(isnan(a0))==0); id_a(j,i)=true; end;
    if (sum(isnan(b0))==0); id_b(j,i)=true; end;
    if (sum(isnan(c0))==0); id_c(j,i)=true; end;
    if (sum(isnan(d0))==0); id_d(j,i)=true; end;
  end
end
N=20;
x=myeof(a,N,id_a); v.AO_z1000=x; 
x=myeof(b,N,id_b); v.AO_z700 =x;
x=myeof(c,N,id_c); v.AO_z500 =x;
x=myeof(d,N,id_d); v.AO_mslp =x;
%%%%%%%%%%%%%%%%%%%%%%%%%
%EOF analysis for PNA
%%%%%%%%%%%%%%%%%%%%%%%%%
m=3; a=z500_ano; %below do m-month running mean
a=reshape(a,v.nt,v.nlat,v.nlon); a=movmean(a,m,1); a=reshape(a,12,v.nyr,v.nlat,v.nlon);
z500_ano_3mon=a;
m1=1; m2=12; y1=1; y2=nyr; nyr=y2-y1+1; nmn=m2-m1+1;
a=z500_ano_3mon(m1:m2,y1:y2,:,:);
a=z500_ano     (m1:m2,y1:y2,:,:);
for j=1:v.nlat
  a(:,:,j,:)=a(:,:,j,:)*sqrt(cos(v.lat(j)/180*pi));
end
a=reshape(a,nyr*nmn,v.nlat,v.nlon); a=shiftdim(a,1);
id=false(v.nlat,v.nlon); id_a=id;
for j=1:v.nlat
  for i=1:v.nlon
    a0=squeeze(a(j,i,:));
    if (sum(isnan(a0))==0); id_a(j,i)=true; end;
  end
end
N=20; x=myeof(a,N,id_a); v.PNA_z500=x; 
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
latlon=[100 180 10 55]; %v.pji=get_region_avg(v.lat,v.lon,z850_ano,latlon);
pj=get_region(v.glat,v.glon,ts_ano,z850_ano,u10_ano,v10_ano,latlon,v.glm);

x=pj; m1=1; m2=12; y1=1; y2=v.nyr; nyr=y2-y1+1; nmn=m2-m1+1;
a=x.sstx(m1:m2,y1:y2,:,:);
b=x.pcpx(m1:m2,y1:y2,:,:);
for j=1:x.nlat
  a(:,:,j,:)=a(:,:,j,:)*sqrt(cos(x.lat(j)/180*pi));
  b(:,:,j,:)=b(:,:,j,:)*sqrt(cos(x.lat(j)/180*pi));
end
a=reshape(a,nyr*nmn,x.nlat,x.nlon); a=shiftdim(a,1);

id=false(x.nlat,x.nlon); id(x.lm==0)=1;
N=20; y=myeof(a,N,id); v.PJ_ssta=y; 

figure; contourf(x.lon,x.lat,squeeze(v.PJ_ssta.eof_maps(:,:,2)))

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
v.tpath=tpath; v.latlon=latlon;
fn=strcat('/work/miz/mat_hiresmip/',expn,'_clivar_ana_',region,'.mat')
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
