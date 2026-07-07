%% 1. Load GF Data
fn = '/work/miz/mat_gf/dvar_final_new_20250111.mat'; 
if ~exist(fn, 'file'); error('Data file not found at: %s. Please check your path.', fn); end
load(fn); %k=[1, 2, 3, 4, 5]; %selected vertical levels 850, 700, 500, 300, 200hPa
%extract data and derive seasonal mean, 1=ANN; 2=MAM; 3=JJA; 4=SON; 5=DJF; 6=NDJFM; 7=NDJFM
a=squeeze(vm.tsurf.var(:,:,:,:));     a=get4season_all(a); z.tsfca=a;
a=squeeze(vm.pcp.var(:,:,:,:));       a=get4season_all(a); z.preca=a;
a=squeeze(vm.netrad.var(:,:,:,:));    a=get4season_all(a); z.nrada=a;
a=squeeze(vm.lwcf.var(:,:,:,:));      a=get4season_all(a); z.lwcfa=a;
a=squeeze(vm.swcf.var(:,:,:,:));      a=get4season_all(a); z.swcfa=a;
k=3; a=squeeze(vm.om.var(:,k,:,:,:)); a=get4season_all(a); z.om500=a;
k=3; a=squeeze(vm.za.var(:,k,:,:,:)); a=get4season_all(a); z.za500=a;
k=1; a=squeeze(vm.za.var(:,k,:,:,:)); a=get4season_all(a); z.za850=a;
k=5; a=squeeze(vm.za.var(:,k,:,:,:)); a=get4season_all(a); z.za200=a;
k=3; a=squeeze(vm.ua.var(:,k,:,:,:)); a=get4season_all(a); z.ua500=a;
k=1; a=squeeze(vm.ua.var(:,k,:,:,:)); a=get4season_all(a); z.ua850=a;
k=5; a=squeeze(vm.ua.var(:,k,:,:,:)); a=get4season_all(a); z.ua200=a;
k=3; a=squeeze(vm.va.var(:,k,:,:,:)); a=get4season_all(a); z.va500=a;
k=1; a=squeeze(vm.va.var(:,k,:,:,:)); a=get4season_all(a); z.va850=a;
k=5; a=squeeze(vm.va.var(:,k,:,:,:)); a=get4season_all(a); z.va200=a;
%plotting atmospheric responses to SST perturbation%%%%%%%%%%%%%%%
a=v0.lm0; a(a>=0.5)=1; a(a<0.5)=0; lm=a; x=v0.lon; y=v0.lat; aa=v0.aa0; pat=v0.patch;
isea=4; sea={'ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'}; %1=ANN; 2=MAM; 3=JJA; 4=SON; 5=DJF; 6=NDJFM; 7=MJJAS
color=[0.90 0.85 0.00]; n=4; scale1=1; scale2=2; scale3=3; color='k'; ref=10; x0=0; y0=70; vunit='m/s';
xy=[0 365 -90 90]; msize=10; co='o'; fc='y'; ec='k';
for ipat=1:153; 
  mytitle=sprintf('AM4 simulated atmospheric response to idealized SST perturbations (ipatch=%03d)',ipat);
  p.lat=pat.latc(ipat); p.lon=pat.lonc(ipat);
  single_ssta=squeeze(tsfca(ipat,isea,:,:));
  single_pcpa=squeeze(preca(ipat,isea,:,:));
  single_nrad=squeeze(nrada(ipat,isea,:,:));
  single_lwcf=squeeze(lwcfa(ipat,isea,:,:));
  single_swcf=squeeze(swcfa(ipat,isea,:,:));
  single_o500=squeeze(om500(ipat,isea,:,:));
  single_z850=squeeze(za850(ipat,isea,:,:));
  single_z500=squeeze(za500(ipat,isea,:,:));
  single_z200=squeeze(za200(ipat,isea,:,:));
  single_u850=squeeze(ua850(ipat,isea,:,:));
  single_u500=squeeze(ua500(ipat,isea,:,:));
  single_u200=squeeze(ua200(ipat,isea,:,:));
  single_v850=squeeze(va850(ipat,isea,:,:));
  single_v500=squeeze(va500(ipat,isea,:,:));
  single_v200=squeeze(va200(ipat,isea,:,:));
  pms=[ 0, 0, 2500, 1300]; row=3; col=3; fsize=18; lw=1;
  handle=figure('Position',pms,'visible','on'); sgtitle(strcat(mytitle," ",sea{isea}));
  subplot(row,col,1); a=single_ssta;     a0=nanmean(nanmean(a.*aa)); unit='K';
  pcolor(x,y,a); shading flat; colorbar; hold on; caxis([ -1  1]); axis(xy);
  plot(p.lon,p.lat,co,'MarkerSize',msize,'MarkerFaceColor',fc,'MarkerEdgeColor',ec);
%  text(p.lon,p.lat,'+','HorizontalAlignment','center', 'VerticalAlignment','middle','FontSize',fsize);%testing 
  nn=256; cmap=bluewhitered_miz(nn); colormap(cmap); 
  contour(x,y,lm,1,'k','LineWidth',lw); s='SSTA';     s=sprintf('%s (%6.3f %s)',s,a0,unit); title(s);
  subplot(row,col,2); a=single_pcpa;     a0=nanmean(nanmean(a.*aa)); unit='mm/day';
  pcolor(x,y,a); shading flat; colorbar; hold on; caxis([ -5  5]); axis(xy);
  plot(p.lon,p.lat,co,'MarkerSize',msize,'MarkerFaceColor',fc,'MarkerEdgeColor',ec);
  contour(x,y,lm,1,'k','LineWidth',lw); s='PREC';     s=sprintf('%s (%6.3f %s)',s,a0,unit); title(s);
  subplot(row,col,3); a=single_o500*864; a0=nanmean(nanmean(a.*aa));
  pcolor(x,y,a); shading flat; colorbar; hold on; caxis([-50 50]); axis(xy);
  plot(p.lon,p.lat,co,'MarkerSize',msize,'MarkerFaceColor',fc,'MarkerEdgeColor',ec);
  contour(x,y,lm,1,'k','LineWidth',lw); s='OMEGA500'; s=sprintf('%s (%6.3f %s)',s,a0,unit); title(s);
  subplot(row,col,4); a=single_z850;     a0=nanmean(nanmean(a.*aa)); unit='GPM'; u=single_u850; v=single_v850; scale=scale3;
  pcolor(x,y,a); shading flat; colorbar; hold on; caxis([-30 30]); axis(xy);
  quiver(x(1:n:end),y(1:n:end),u(1:n:end,1:n:end)*scale,v(1:n:end,1:n:end)*scale,0,'Color',color);
  plot(p.lon,p.lat,co,'MarkerSize',msize,'MarkerFaceColor',fc,'MarkerEdgeColor',ec);
  contour(x,y,lm,1,'k','LineWidth',lw); s='Z850';     s=sprintf('%s (%6.3f %s)',s,a0,unit); title(s);
  text(x0-1,y0+10,strcat(num2str(ref),vunit),'FontSize',fsize,'Color',color,'BackgroundColor','w')
  quiver(x0,y0,ref*scale,0,0,'Color','w',  'LineWidth',3,'MaxHeadSize',2)
  quiver(x0,y0,ref*scale,0,0,'Color',color,'LineWidth',1,'MaxHeadSize',2)
  subplot(row,col,5); a=single_z500;     a0=nanmean(nanmean(a.*aa)); unit='GPM'; u=single_u500; v=single_v500; scale=scale2;
  pcolor(x,y,a); shading flat; colorbar; hold on; caxis([-40 40]); axis(xy);
  quiver(x(1:n:end),y(1:n:end),u(1:n:end,1:n:end)*scale,v(1:n:end,1:n:end)*scale,0,'Color',color);
  plot(p.lon,p.lat,co,'MarkerSize',msize,'MarkerFaceColor',fc,'MarkerEdgeColor',ec);
  contour(x,y,lm,1,'k','LineWidth',lw); s='Z500';     s=sprintf('%s (%6.3f %s)',s,a0,unit); title(s);
  text(x0-1,y0+10,strcat(num2str(ref),vunit),'FontSize',fsize,'Color',color,'BackgroundColor','w')
  quiver(x0,y0,ref*scale,0,0,'Color','w',  'LineWidth',3,'MaxHeadSize',2)
  quiver(x0,y0,ref*scale,0,0,'Color',color,'LineWidth',1,'MaxHeadSize',2)
  subplot(row,col,6); a=single_z200;     a0=nanmean(nanmean(a.*aa)); unit='GPM'; u=single_u200; v=single_v200; scale=scale1;
  pcolor(x,y,a); shading flat; colorbar; hold on; caxis([-50 50]); axis(xy);
  quiver(x(1:n:end),y(1:n:end),u(1:n:end,1:n:end)*scale,v(1:n:end,1:n:end)*scale,0,'Color',color);
  plot(p.lon,p.lat,co,'MarkerSize',msize,'MarkerFaceColor',fc,'MarkerEdgeColor',ec);
  contour(x,y,lm,1,'k','LineWidth',lw); s='Z200';     s=sprintf('%s (%6.3f %s)',s,a0,unit); title(s);
  text(x0-1,y0+10,strcat(num2str(ref),vunit),'FontSize',fsize,'Color',color,'BackgroundColor','w')
  quiver(x0,y0,ref*scale,0,0,'Color','w',  'LineWidth',3,'MaxHeadSize',2)
  quiver(x0,y0,ref*scale,0,0,'Color',color,'LineWidth',1,'MaxHeadSize',2)
  subplot(row,col,7); a=single_nrad;     a0=nanmean(nanmean(a.*aa)); unit='W/m2';
  pcolor(x,y,a); shading flat; colorbar; hold on; caxis([-10 10]); axis(xy);
  plot(p.lon,p.lat,co,'MarkerSize',msize,'MarkerFaceColor',fc,'MarkerEdgeColor',ec);
  contour(x,y,lm,1,'k','LineWidth',lw); s='NETRAD';   s=sprintf('%s (%6.3f %s)',s,a0,unit); title(s);
  subplot(row,col,8); a=single_lwcf;     a0=nanmean(nanmean(a.*aa)); unit='W/m2';
  pcolor(x,y,a); shading flat; colorbar; hold on; caxis([-20 20]); axis(xy);
  plot(p.lon,p.lat,co,'MarkerSize',msize,'MarkerFaceColor',fc,'MarkerEdgeColor',ec);
  contour(x,y,lm,1,'k','LineWidth',lw); s='LWCRE';    s=sprintf('%s (%6.3f %s)',s,a0,unit); title(s);
  subplot(row,col,9); a=single_swcf;     a0=nanmean(nanmean(a.*aa)); unit='W/m2';
  pcolor(x,y,a); shading flat; colorbar; hold on; caxis([-20 20]); axis(xy);
  plot(p.lon,p.lat,co,'MarkerSize',msize,'MarkerFaceColor',fc,'MarkerEdgeColor',ec);
  contour(x,y,lm,1,'k','LineWidth',lw); s='SWCRE';    s=sprintf('%s (%6.3f %s)',s,a0,unit); title(s);
  
  expn='am4_response'; visfig='off'; figpath='./fig_gf/'; fmt='png';
  vname=sprintf('%s_ipatch_%03d',sea{isea},ipat);
  printnew(visfig,figpath,expn,vname,fmt); close(handle);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Point MATLAB to your active 'dev' environment Python executable
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pyenv('Version', '/nbhome/ogrp/python/envs/dev/bin/python');

% 2. Append your custom target package path and script directories 
py.importlib.import_module('sys');
py.sys.path.append('/work/miz/python_packages');
py.sys.path.append('/work/miz/your_script_directory/'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Training FNO with Deep Learning Toolbox using Fourier Neural Operator (FNO)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1. Load GF Data
fn = '/work/miz/mat_gf/dvar_final_new_20250111.mat'; 
if ~exist(fn, 'file'); error('Data file not found at: %s. Please check your path.', fn); end
load(fn); 
a=squeeze(vm.tsurf.var (:,:,:,:));    a=get4season_all(a); z.tsfca=a;
a=squeeze(vm.pcp.var   (:,:,:,:));    a=get4season_all(a); z.preca=a;
a=squeeze(vm.netrad.var(:,:,:,:));    a=get4season_all(a); z.nrada=a;
a=squeeze(vm.lwcf.var(:,:,:,:));      a=get4season_all(a); z.lwcfa=a;
a=squeeze(vm.swcf.var(:,:,:,:));      a=get4season_all(a); z.swcfa=a;
k=3; a=squeeze(vm.om.var(:,k,:,:,:)); a=get4season_all(a); z.om500=a;
k=3; a=squeeze(vm.za.var(:,k,:,:,:)); a=get4season_all(a); z.za500=a;
k=1; a=squeeze(vm.za.var(:,k,:,:,:)); a=get4season_all(a); z.za850=a;
k=5; a=squeeze(vm.za.var(:,k,:,:,:)); a=get4season_all(a); z.za200=a;
k=3; a=squeeze(vm.ua.var(:,k,:,:,:)); a=get4season_all(a); z.ua500=a;
k=1; a=squeeze(vm.ua.var(:,k,:,:,:)); a=get4season_all(a); z.ua850=a;
k=5; a=squeeze(vm.ua.var(:,k,:,:,:)); a=get4season_all(a); z.ua200=a;
k=3; a=squeeze(vm.va.var(:,k,:,:,:)); a=get4season_all(a); z.va500=a;
k=1; a=squeeze(vm.va.var(:,k,:,:,:)); a=get4season_all(a); z.va850=a;
k=5; a=squeeze(vm.va.var(:,k,:,:,:)); a=get4season_all(a); z.va200=a;
z.lat=v0.lat; z.lon=v0.lon; z.nlat=v0.nlat; z.nlon=v0.nlon; z.lm=v0.lm0; z.im=get4season_all(v0.imk_clm);z
fn='/work/miz/mat_gf/gf_data.mat'; save(fn,'z');

fn='/work/miz/mat_gf/gf_data.mat'; load(fn);

sea={'ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'}; lm=z.lm;
isea=3; season=sea{isea};   %1=ANN; 2=MAM; 3=JJA; 4=SON; 5=DJF; 6=NDJFM; 7=MJJAS
im=squeeze(z.im(isea,:,:)); %figure; pcolor(im); shading flat;
im4d=repmat(im, [1, 1, 1, 153]);
lm4d=repmat(lm, [1, 1, 1, 153]);
a=z.tsfca(:,isea,:,:); ssta=permute(a,[3,4,2,1]); ssta(lm4d>0.01 | im4d>0.01)=0;
a=z.za500(:,isea,:,:); z500=permute(a,[3,4,2,1]);

param = run_toolbox_fno(ssta,z500,z.lat,z.lon,season)

%% 1. Load Trained Parameters
%load('fno_toolbox_weights.mat'); % Loads the 'param' structure

%% 2. Prepare Your New SST Patch Input Data (X_new)
ipat=23; %choose one patch as a test
single_ssta=squeeze(ssta(:,:,1,ipat));  single_ssta(lm>0.01 | im>0.01)=0; %remove value of land and sea ice
single_z500=squeeze(z500(:,:,1,ipat));

% Build grids
[LatGrid, LonGrid] = ndgrid(z.lat, z.lon);
LatGrid_norm = 2 * (LatGrid - min(LatGrid(:))) / (max(LatGrid(:)) - min(LatGrid(:))) - 1;
LonGrid_norm = 2 * (LonGrid - min(LonGrid(:))) / (max(LonGrid(:)) - min(LonGrid(:))) - 1;

% Initialize X_new explicitly with 3 channels and 1 sample
X_new = zeros(z.nlat, z.nlon, 3, 1);
% CRITICAL FIX: Assign the NORMALIZED channels carefully to match training
X_new(:,:,1,1) = single_ssta;  % Channel 1: SST
X_new(:,:,2,1) = LatGrid_norm; % Channel 2: Normalized Lat grid
X_new(:,:,3,1) = LonGrid_norm; % Channel 3: Normalized Lon grid

% CRITICAL FIX: Convert input to dlarray single precision
X_new_dl = dlarray(single(X_new));

%% 3. Forward Pass Prediction
Y_pred_dl = fno_forward_centered(X_new_dl, param.lifting_w, param.proj_w, param.w_skip, ...
            param.weights1_real, param.weights1_imag, param.weights2_real, param.weights2_imag);

%% 4. Extract and Visualize 
% CRITICAL FIX: Strip tracking properties and squeeze into 2D for plotting
Y_pred_plot = real(double(extractdata(squeeze(Y_pred_dl))));

pms=[ 0, 0, 2400, 800]; row=1; col=2; fsize=18; lw=1; c1=-15; c2=15;
handle=figure('Position',pms,'visible','on'); 
subplot(row,col,1)
pcolor(z.lon, z.lat, Y_pred_plot);  hold on; shading flat; colorbar; caxis([c1 c2]);
contour(z.lon,z.lat,lm,1,'k','LineWidth',lw); title('Z500');
title(sprintf('FNO Z500 Prediction (Patch %d)', ipat));
xlabel('Longitude'); ylabel('Latitude');
subplot(row,col,2)
pcolor(z.lon, z.lat, single_z500);  hold on; shading flat; colorbar; caxis([c1 c2]);
contour(z.lon,z.lat,lm,1,'k','LineWidth',lw); title('Z500');
title(sprintf('orignal from simulation (Patch %d)', ipat));
xlabel('Longitude'); ylabel('Latitude');

