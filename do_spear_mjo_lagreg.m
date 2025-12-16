%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OBS MJO lag regression analysis%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
io_latlon=[75 100 -10 5]; 
tp_latlon=[0  360 -30 30]; 
latlon   =[0  360 -10 10]; lateq=6.5; do_var=1;
%v=obs_mjo_lagreg(io_latlon, tp_latlon, latlon, lateq, do_var);
%to read the observational analysis
fn=strcat('/work/miz/mat_am4p0/obs_mjo_lagreg.mat'); load(fn); o=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4.0 paper model MJO analysis: LAGREGRESSION%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath ='/archive/Ming.Zhao/am4_spear/';
io_latlon=[75 100 -10 5]; 
tp_latlon=[0  360 -30 30]; 
latlon   =[0  360 -10 10]; lateq=6.5; region='gtrop';
expn='AM4_spear_C96_O1_hist1'; yr1='1980'; yr2='2014'; nyr=35;
v=spear_mjo_lagreg(tpath,expn,yr1,yr2,nyr,io_latlon,latlon,lateq,region)
expn='AM4_spear_C96_O1_hist_standard'; yr1='1980'; yr2='2014'; nyr=35;
v=spear_mjo_lagreg(tpath,expn,yr1,yr2,nyr,io_latlon,latlon,lateq,region)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath ='/archive/Ming.Zhao/awg/xanadu/';
io_latlon=[75 100 -10 5]; 
tp_latlon=[0  360 -30 30]; 
latlon   =[0  360 -10 10]; lateq=6.5; region='gtrop';
expn='c96L33_am4p0_spear_sstice'; yr1='1980'; yr2='2014'; nyr=34;
v=spear_mjo_lagreg(tpath,expn,yr1,yr2,nyr,io_latlon,latlon,lateq,region)
expn='c96L33_am4p0_spear_sstice_dailysst'; yr1='1980'; yr2='2014'; nyr=35;
v=spear_mjo_lagreg(tpath,expn,yr1,yr2,nyr,io_latlon,latlon,lateq,region)
%expn='CM4_c96L33_am4p0_2010_base'; yr1='0001'; yr2='0045'; nyr=35;
%v=am4part1_mjo_lagreg(tpath,expn,yr1,yr2,nyr,io_latlon,latlon,lateq,region)
%expn='LOAR4_c96L33_am4p0_2010climo_C15'; yr1='0001'; yr2='0100'; nyr=35;
%v=am4part1_mjo_lagreg(tpath,expn,yr1,yr2,nyr,io_latlon,latlon,lateq,region)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Below load and plot figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I load and plot MJO eastward propogation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_am4p0/mjo_lagreg_obs.mat'); load(fn); o=v;
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath ='/archive/Ming.Zhao/am4_spear/'; region='gtrop';
expn='AM4_spear_C96_O1_hist1'; fn=strcat(tpath,expn,'/',expn,'_',region,'_lagreg.mat'); load(fn);sp4.v0=v;
expn='AM4_spear_C96_O1_hist1'; fn=strcat(tpath,expn,'/',expn,'_',region,'_lagreg.mat'); load(fn);sp4.v0=v;
tpath ='/archive/Ming.Zhao/awg/warsaw/';
expn='CM4_hist';               fn=strcat(tpath,expn,'/',expn,'_',region,'_lagreg.mat'); load(fn);cm4.v1=v;

tpath ='/archive/Ming.Zhao/awg/warsaw/';
expn='CM4_hist';               fn=strcat(tpath,expn,'/',expn,'_',region,'_lagreg.mat'); load(fn);cm4.v1=v;
%expn='CM4_c96L33_am4p0_2010_base'; fn=strcat(tpath,expn,'/',expn,'_',region,'_lagreg.mat'); load(fn);cm4.v0=v;
%expn='LOAR4_c96L33_am4p0_2010climo_C15';fn=strcat(tpath,expn,'/',expn,'_',region,'_lagreg.mat'); load(fn);loar4.v0=v;
%expn='AM3';                   fn=strcat(tpath,expn,'/',expn,'_',region,'_lagreg.mat'); load(fn);am3=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig MJO eastward propogation based on OLR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='olr'; expn='MJO'; 
v=sp4.v0.olr; x=v.lon; y=v.lgd; xy=[0 360 -25 25];
xl='longitude'; yl='lagged time (day)';
zbin=[-0.6:0.05:0.6]; %zbin=[-2.4:0.05:2.4];
cminmax=[min(zbin) max(zbin)];
uu=5*86400/111000; xx=20+uu*(y+18); %speed=longitude/day
pms=[ 0, 0, 1200, 600]; warning off all
handle = figure('Position', pms,'visible','on');
row=2; col=2; lw=1; fsize=8;
nn=32; cmap=jet(nn); cmap(nn/2:nn/2+1,:)=1; colormap(cmap);
subplot(row,col,1);  s='(a) OLR (NOAA AVHRR)';
v=o.olr.lga; xo=v.lon; yo=v.lgd; zo=v.lagcorr.iso_avg';
contourf(xo,yo,zo,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([87.5 87.5],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); colormap(bluewhitered(nn));
subplot(row,col,2); s='(b) OLR (SPEAR)';
v=sp4.v0.olr; z=v.lagcorr.iso_avg'; 
contourf(x,y,z,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([87.5 87.5],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
subplot(row,col,3); s='(c) OLR (CM4.0)';
v=cm4.v1.olr; z=v.lagcorr.iso_avg'; 
contourf(x,y,z,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([87.5 87.5],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 

visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);

%AM4 paper part I Fig.27: MJO eastward propogation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.27a-c MJO eastward propogation based on U200 and OLR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
am4.vx=am4.v0; cm4.vx=cm4.v0; vo=o;
vname='u200'; expn='AM4p0_lgc'; v=am4.v0.u200;
x=v.lon; y=v.lgd; xy=[0 360 -25 25];
xl='longitude'; yl='lagged time (day)';
cmin=-0.6; cmax=0.6; zbin=[cmin:0.05:cmax]; %zbin=[-2.4:0.05:2.4];
cminmax=[cmin cmax];
uu=5*86400/111000; xx=20+uu*(y+18); %speed=longitude/day
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1300, 1100]*0.8; fsize=10; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=0.08; y0=0.7; wx=0.38-0.07; wy=0.25-0.05; dx=0.05+0.0; dy=0.05;
p1= [x0,          y0,           wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,           wx, wy];%position of first subplot
p3= [x0,          y0-wy-dy,     wx, wy];%position of first subplot
p4= [x0+wx+dx,    y0-wy-dy,     wx, wy];%position of first subplot
p5= [x0,          y0-2*(wy+dy), wx, wy];%position of first subplot
p6= [x0+wx+dx,    y0-2*(wy+dy), wx, wy];%position of first subplot
nn=64; caxis([cmin cmax]); cmap1=bluewhitered(nn); icmap=1; %caxis([c1 c2]);
if (icmap==0)
  cmap=fabien_colormap(nn);
elseif (icmap==1) 
  cmap=bluewhitered(nn);
elseif (icmap==2)
  cmap=cbrewer('div', 'BrBG', nn);
else
  cmap=jet(nn); %cmap(nn/2:nn/2+1,:)=1;
end
pos=[0.25-0.025 0.13 0.42 0.015];%[left bottom width height];

subplot('Position',p1); s='(a) U200 (AM4.0 AMIP)';
z=am4.vx.u200.lagcorr.iso_avg'; %z=am4.v0.u200.lagslop.iso_avg';
contourf(x,y,z,zbin); hold on; shading flat; caxis(cminmax); %colorbar;
plot([87.5 87.5],[-30 30],'k-','LineWidth',lw); colormap(cmap);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
subplot('Position',p3); s='(b) U200 (AM4.0 Coupled)';
z=cm4.vx.u200.lagcorr.iso_avg'; %z=cm4.v0.u200.lagslop.iso_avg';
contourf(x,y,z,zbin); hold on; shading flat; caxis(cminmax); %colorbar;
plot([87.5 87.5],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
subplot('Position',p5); v=vo.u200.lga; s='(c) U200 (ERA-interim)';
xo=v.lon; yo=v.lgd; zo=o.u200.lga.lagcorr.iso_avg';
contourf(xo,yo,zo,zbin); hold on; shading flat; caxis(cminmax); %colorbar;
plot([87.5 87.5],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); colormap(bluewhitered(nn));
subplot('Position',p2); s='(d) OLR (AM4.0 AMIP)';
v=am4.vx.olr; z=v.lagcorr.iso_avg'; 
contourf(x,y,z,zbin); hold on; shading flat; caxis(cminmax); %colorbar;
plot([87.5 87.5],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
%ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
subplot('Position',p4); s='(e) OLR (AM4.0 Coupled)';
v=cm4.vx.olr; z=v.lagcorr.iso_avg'; 
contourf(x,y,z,zbin); hold on; shading flat; caxis(cminmax); %colorbar;
plot([87.5 87.5],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
%ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
subplot('Position',p6);  s='(f) OLR (NOAA AVHRR)';
v=vo.olr.lga; xo=v.lon; yo=v.lgd; zo=v.lagcorr.iso_avg';
contourf(xo,yo,zo,zbin); hold on; shading flat; caxis(cminmax); %colorbar;
plot([87.5 87.5],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
%ylabel(yl,'FontSize',fsize); 
xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); colormap(bluewhitered(nn));
h=colorbar('Location','southoutside','Position',pos); %cbfreeze(h,cmap);
visfig='off'; figpath='./fig_am4/'; vname='u200_olr';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
am4.vx=am4.v0; cm4.vx=cm4.v0; vo=o;
vname='u200'; expn='AM4p0_lgc'; v=am4.v0.u200;
x=v.lon; y=v.lgd; xy=[0 360 -25 25];
xl='longitude'; yl='lagged time (day)';
zbin=[-0.6:0.05:0.6]; %zbin=[-2.4:0.05:2.4];
cminmax=[min(zbin) max(zbin)];
uu=5*86400/111000; xx=20+uu*(y+18); %speed=longitude/day
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 500, 800]; warning off all
handle = figure('Position', pms,'visible','on');
row=3; col=1; lw=1; fsize=12;
nn=32; cmap=jet(nn); cmap(nn/2:nn/2+1,:)=1; colormap(cmap);
subplot(row,col,1); s='(a) U200 (AM4.0 AMIP)';
z=am4.vx.u200.lagcorr.iso_avg'; %z=am4.v0.u200.lagslop.iso_avg';
contourf(x,y,z,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([87.5 87.5],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
subplot(row,col,2); s='(b) U200 (AM4.0 Coupled)';
z=cm4.vx.u200.lagcorr.iso_avg'; %z=cm4.v0.u200.lagslop.iso_avg';
contourf(x,y,z,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([87.5 87.5],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
subplot(row,col,3); v=vo.u200.lga; s='(c) U200 (ERA-I)';
xo=v.lon; yo=v.lgd; zo=o.u200.lga.lagcorr.iso_avg';
contourf(xo,yo,zo,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([87.5 87.5],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); colormap(bluewhitered(nn));
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.27d-f MJO eastward propogation based on OLR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
am4.vx=am4.v0; cm4.vx=cm4.v0; vo=o;
vname='olr'; expn='AM4p0_lgc'; 
v=am4.vx.olr; x=v.lon; y=v.lgd; xy=[0 360 -25 25];
xl='longitude'; yl='lagged time (day)';
zbin=[-0.6:0.05:0.6]; %zbin=[-2.4:0.05:2.4];
cminmax=[min(zbin) max(zbin)];
uu=5*86400/111000; xx=20+uu*(y+18); %speed=longitude/day
pms=[ 0, 0, 500, 800]; warning off all
handle = figure('Position', pms,'visible','on');
row=3; col=1; lw=1; fsize=12;
nn=32; cmap=jet(nn); cmap(nn/2:nn/2+1,:)=1; colormap(cmap);
subplot(row,col,1); s='(d) OLR (AM4.0 AMIP)';
v=am4.vx.olr; z=v.lagcorr.iso_avg'; 
contourf(x,y,z,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([87.5 87.5],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
subplot(row,col,2); s='(e) OLR (AM4.0 Coupled)';
v=cm4.vx.olr; z=v.lagcorr.iso_avg'; 
contourf(x,y,z,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([87.5 87.5],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
subplot(row,col,3);  s='(f) OLR (NOAA AVHRR)';
v=vo.olr.lga; xo=v.lon; yo=v.lgd; zo=v.lagcorr.iso_avg';
contourf(xo,yo,zo,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([87.5 87.5],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); colormap(bluewhitered(nn));
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.26 (load and plot MJO W-K figures)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%o1=read_wkobs;
fn=strcat('/work/miz/mat_am4p0/obs_mjo_wk.mat'); load(fn); o=v;
tpath='/archive/Ming.Zhao/awg/warsaw/'; region='gtrop';
fext=strcat('_',region,'_wk.mat');
expn='AM4.0';                 fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4.v0=v;
expn='c96L33_am4p0_m1';       fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4.v1=v;
expn='c96L33_am4p0_m2';       fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4.v2=v;
expn='c96L33_am4p0_m3';       fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4.v3=v;
expn='c96L33_am4p0_m4';       fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4.v4=v;
expn='c96L33_am4p0_m5';       fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4.v5=v;
expn='AM4p0';                 fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4.v6=v;
expn='c96L33_am4p0_initCond2';fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4.v7=v;
expn='cm4p0_2010';            fn=strcat(tpath,expn,'/',expn,fext);load(fn); cm4.v0=v;
expn='cm4p0_hist';            fn=strcat(tpath,expn,'/',expn,fext);load(fn); cm4.v1=v;
expn='CM4_c96L33_am4p0_2010_base'; fn=strcat(tpath,expn,'/',expn,fext);load(fn); cm4.v2=v;
expn='LOAR4_c96L33_am4p0_2010climo_C15';fn=strcat(tpath,expn,'/',expn,fext);load(fn); cm4.v3=v;
expn='AM3';                   fn=strcat(tpath,expn,'/',expn,fext);load(fn); am3=v;
expn='AM2.1';                 fn=strcat(tpath,expn,'/',expn,fext);load(fn); am2=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4.0 paper Part I Fig.26: MJO WK diagram
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
am4.vx=am4.v0; cm4.vx=cm4.v0; vo=o;
cmin=0.5; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5]; d=o.d; wsize_x=1; wsize_y=3;
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
pms=[ 0, 0, 1300, 1100]*0.8; fsize=10; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=0.08; y0=0.7; wx=0.38-0.07; wy=0.25-0.05; dx=0.05+0.0; dy=0.05;
p1= [x0,          y0,           wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,           wx, wy];%position of first subplot
p3= [x0,          y0-wy-dy,     wx, wy];%position of first subplot
p4= [x0+wx+dx,    y0-wy-dy,     wx, wy];%position of first subplot
p5= [x0,          y0-2*(wy+dy), wx, wy];%position of first subplot
p6= [x0+wx+dx,    y0-2*(wy+dy), wx, wy];%position of first subplot
nn=32; caxis([cmin cmax]); cmap1=bluewhitered(nn); icmap=3; %caxis([c1 c2]);
if (icmap==0)
  cmap=fabien_colormap(nn);
elseif (icmap==1) 
  cmap=bluewhitered(nn);
elseif (icmap==2)
  cmap=cbrewer('div', 'BrBG', nn);
else
  cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
end
xl='WESTWARD    Zonal Wavenumber    EASTWARD';
yl='Frequency (days^{-1})';
subplot('Position',p1); s='(a) U200 (AM4.0 AMIP)';
v=am4.vx.u200; d=o.d; 
x=v.x; y=v.y; z=am4.vx.u200.var_sym_filt;
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; %colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize); 
title('(a) U200 (AM4.0 AMIP)','FontSize',fsize);
subplot('Position',p3); v=cm4.vx.u200;
x=v.x; y=v.y; z=v.var_sym_filt;
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; %colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize); 
title('(b) U200 (AM4.0 Coupled)','FontSize',fsize);
subplot('Position',p5); v=vo.u200;
x=v.x; y=v.y; z=v.var_sym_filt;
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; %colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
ylabel(yl,'FontSize',fsize); xlabel(xl,'FontSize',fsize); 
title('(c) U200 (ERA-interim)','FontSize',fsize);
subplot('Position',p2); v=am4.vx.olr; d=o.d; 
x=v.x; y=v.y; z=v.var_sym_filt;
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; %colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(d) OLR (AM4.0 AMIP)','FontSize',fsize);
subplot('Position',p4); v=cm4.vx.olr;
x=v.x; y=v.y; z=v.var_sym_filt;
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; %colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(e) OLR (AM4.0 Coupled)','FontSize',fsize);
subplot('Position',p6); v=vo.olr;
x=v.x; y=v.y; z=v.var_sym_filt;
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; %colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
%ylabel(yl,'FontSize',fsize); 
xlabel(xl,'FontSize',fsize); 
title('(f) OLR (NOAA AVHHR)','FontSize',fsize);
pos=[0.205 0.13 0.42 0.015];%[left bottom width height];
h=colorbar('Location','southoutside','Position',pos); %cbfreeze(h,cmap);
figpath='./fig_am4/'; visfig='off'; expn='AM4p0'; vname='WK_olr_u200'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%U850+PCP WK diagram%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
am4.vx=am4.v0; cm4.vx=cm4.v0; vo=o;
cmin=0.5; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5]; d=o.d; wsize_x=1; wsize_y=3;
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
pms=[ 0, 0, 1000, 900]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=3; col=2; warning off all;
subplot(row,col,1); v=am4.vx.u850; d=o.d; 
x=v.x; y=v.y; z=v.var_sym_filt;
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(a) U850 (AM4.0 AMIP)','FontSize',fsize);
subplot(row,col,3); v=cm4.vx.u850;
x=v.x; y=v.y; z=v.var_sym_filt;
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(b) U850 (AM4.0 Coupled)','FontSize',fsize);
subplot(row,col,5); v=vo.u850;
x=v.x; y=v.y; z=v.var_sym_filt;
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(c) U850 (ERA-INTERIM)','FontSize',fsize);
subplot(row,col,2); v=am4.vx.pcp; d=o.d; 
x=v.x; y=v.y; z=v.var_sym_filt;
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(d) PCP (AM4.0 AMIP)','FontSize',fsize);
subplot(row,col,4); v=cm4.vx.pcp;
x=v.x; y=v.y; z=v.var_sym_filt;
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(e) PCP (AM4.0 Coupled)','FontSize',fsize);
subplot(row,col,6); v=vo.pcp;
x=v.x; y=v.y; z=v.var_sym_filt;
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(f) PCP (NOAA AVHHR)','FontSize',fsize);
figpath='./fig_am4/'; visfig='off'; expn='AM4p0'; vname='WK_pcp_u850'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%test plots for obs OLR%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=0.5; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5]; d=o.d;
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
figure; v=o.olr; x=v.x; y=v.y; z=v.var_sym_filt;
wsize_x=1; wsize_y=3;
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
figpath='./fig_am4/'; visfig='off'; expn='obs'; vname='WK_olr'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=0.5; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5]; d=o1.d;
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
figure; v=o1.olr_new; x=v.x; y=v.y; z=v.var_sym_filt';
wsize_x=1; wsize_y=3;
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
figpath='./fig_am4/'; visfig='off'; expn='obs'; vname='WK_olr'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
