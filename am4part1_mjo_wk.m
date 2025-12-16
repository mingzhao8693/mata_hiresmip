o=read_wkobs;
tpath ='/archive/Ming.Zhao/backup/';
expn='ERA_interim';
latlon=[0 360 -15 15]; region='gtrop';
varn='u200'; yr1='1980'; yr2='2014'; yrs='1981'; cald='JULIAN';
v=wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,varn,cald)
varn='u850'; yr1='1980'; yr2='2014'; yrs='1981'; cald='JULIAN';
v=wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,varn,cald)

tpath ='/archive/Ming.Zhao/backup/precip_obs/';
expn='gpcp_V1DD_V1p2_daily';
latlon=[0 360 -15 15]; region='gtrop';
varn='precip'; yr1='1997'; yr2='2014'; yrs='1997'; cald='JULIAN';
v=wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,varn,cald)

tpath ='/archive/Ming.Zhao/backup/';
expn='NOAA_OLR';
latlon=[0 360 -15 15]; region='gtrop';
varn='olr'; yr1='1979'; yr2='2011'; yrs='1979'; cald='JULIAN';
v=wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,varn,cald)

tpath='/archive/Ming.Zhao/awg/warsaw/';
latlon=[0 360 -15 15]; region='gtrop';
expn='AM4p0'; yr1='1980'; yr2='2014'; yrs='1981'; cald='JULIAN'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);
expn='c96L33_am4p0'; yr1='1980'; yr2='2014'; yrs='1981'; cald='JULIAN'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);
expn='c96L33_am4p0_m1'; yr1='1980'; yr2='2014'; yrs='1981'; cald='JULIAN'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);
expn='c96L33_am4p0_m2'; yr1='1980'; yr2='2014'; yrs='1981'; cald='JULIAN'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);
%coupled simulations
expn='CM4p0_hist'; yr1='1980'; yr2='2014'; yrs='1981'; cald='NOLEAP'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);
expn='CM4p0_2010'; yr1='0061'; yr2='0100'; yrs='0061'; cald='NOLEAP'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);

expn='CM4_hist'; yr1='1981'; yr2='2014'; yrs='1981'; cald='NOLEAP'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);
expn='AM3'; yr1='1980'; yr2='2007'; yrs='1981'; cald='JULIAN'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);

tpath='/archive/Ming.Zhao/awg/warsaw/';
latlon=[0 360 -15 15]; region='gtrop';
expn='c96L33_am4p0_2010climo'; yr1='0002'; yr2='0031'; yrs='0002'; cald='NOLEAP'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);
expn='c96L33_am4p0_2010climo_rkm_dp1'; yr1='0002'; yr2='0011'; yrs='0002'; cald='NOLEAP'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);
expn='c96L33_am4p0_2010climo_rkm_dp2'; yr1='0002'; yr2='0011'; yrs='0002'; cald='NOLEAP'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);
expn='c96L33_am4p0_2010climo_rkm_dp3'; yr1='0002'; yr2='0011'; yrs='0002'; cald='NOLEAP'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);
expn='c96L33_am4p0_2010climo_rkm_dp4'; yr1='0002'; yr2='0011'; yrs='0002'; cald='NOLEAP'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);

expn='c96L33_am4p0_2010climo_cfrac0'; yr1='0002'; yr2='0011'; yrs='0002'; cald='NOLEAP'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);
expn='c96L33_am4p0_2010climo_cfrac1'; yr1='0002'; yr2='0011'; yrs='0002'; cald='NOLEAP'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);
expn='c96L33_am4p0_2010climo_cfrac2'; yr1='0002'; yr2='0011'; yrs='0002'; cald='NOLEAP'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);
expn='c96L33_am4p0_2010climo_cfrac3'; yr1='0002'; yr2='0011'; yrs='0002'; cald='NOLEAP'
v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,cald);


tpath='/archive/Ming.Zhao/awg/verona/';
latlon=[0 360 -15 15]; region='gtrop';
expn='c96L33_am4g12r20'; yr1='1980'; yr2='2014'; yrs='1981'; cald='JULIAN'
varn='olr'; wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,varn,cald);
expn='AM4.0'; yr1='1981'; yr2='2014'; yrs='1981'; cald='JULIAN'
varn='olr'; wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,varn,cald);
expn='c48l24_am2p14_C0'; yr1='1981'; yr2='1990'; yrs='1981'; cald='NOLEAP'
varn='olr'; wk_specana(tpath,expn,yr1,yr2,yrs,latlon,region,varn,cald);


%Plotting
o=read_wkobs;
tpath='/archive/Ming.Zhao/awg/warsaw/'; region='gtrop';
varn='olr'; fext=strcat('_',region,'_',varn,'_WK.mat');
expn='AM4.0';fn=strcat(tpath,expn,'/',expn,fext); load(fn);        am4a=v;
expn='AM4_test0';fn=strcat(tpath,expn,'/',expn,fext); load(fn);    am4b=v;
expn='c96L33_am4g12r22';fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4c=v;

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotting the W-K diagram
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
o=read_wkobs;
tpath='/archive/Ming.Zhao/awg/warsaw/'; region='gtrop';
fext=strcat('_',region,'_WK.mat');
expn='c96L33_am4p0_2010climo';fn=strcat(tpath,expn,'/',expn,fext); load(fn); am4.c0=v;
expn='c96L33_am4p0_2010climo_rkm_dp3';fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4.c1=v;
expn='c96L33_am4p0_2010climo_rkm_dp1';fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4.c2=v;
expn='c96L33_am4p0_2010climo_rkm_dp2';fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4.c3=v;
expn='c96L33_am4p0_2010climo_rkm_dp4';fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4.c4=v;
expn='c96L33_am4p0_2010climo_cfrac0'; fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4.c5=v;
expn='c96L33_am4p0_2010climo_cfrac1'; fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4.c6=v;
expn='c96L33_am4p0_2010climo_cfrac2'; fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4.c7=v;
expn='c96L33_am4p0_2010climo_cfrac3'; fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4.c8=v;
expn='AM4p0';                 fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4a=v;
expn='c96L33_am4p0';          fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4b=v;
expn='c96L33_am4p0_m1';       fn=strcat(tpath,expn,'/',expn,fext);load(fn); am4c=v;
expn='CM4p0_hist';            fn=strcat(tpath,expn,'/',expn,fext);load(fn); cm4a=v;
expn='CM4p0_2010';            fn=strcat(tpath,expn,'/',expn,fext);load(fn); cm4b=v;
expn='CM4_hist';              fn=strcat(tpath,expn,'/',expn,fext);load(fn); cm4=v;
expn='AM3';                   fn=strcat(tpath,expn,'/',expn,fext);load(fn); am3=v;
expn='c48l24_am2p14_C0';fn=strcat(tpath,expn,'/',expn,fext); load(fn); am2=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%test plots for obs OLR%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=0.5; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5]; d=o.d;
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
figure; 
vo=o.olr; x=vo.x; y=vo.y; z=vo.var_sym_filt';
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
%U200+OLR WK diagram: Fig in AM4.0 paper%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=0.5; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5]; d=o.d; wsize_x=1; wsize_y=3;
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
pms=[ 0, 0, 1000, 900]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=3; col=2; warning off all;
subplot(row,col,1); v=am4b.u200; 
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(a) U200 (AM4.0 AMIP)','FontSize',fsize);
subplot(row,col,3); v=cm4b.u200;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(b) U200 (AM4.0 Coupled)','FontSize',fsize);
subplot(row,col,5); vo=o.u200; 
x=vo.x; y=vo.y; z=vo.var_sym_filt'; %pcolor(x,y,z); 
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(c) U200 (ERA-INTERIM)','FontSize',fsize);
subplot(row,col,2); v=am4b.olr; d=o.d;
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(d) OLR (AM4.0 AMIP)','FontSize',fsize);
subplot(row,col,4); v=cm4b.olr;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(e) OLR (AM4.0 Coupled)','FontSize',fsize);
subplot(row,col,6); vo=o.olr;
x=vo.x; y=vo.y; z=vo.var_sym_filt'; %pcolor(x,y,z); 
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(f) OLR (NOAA AVHHR)','FontSize',fsize);
figpath='./fig_am4/'; visfig='off'; expn='AM4p0'; vname='WK_olr_u200'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%U850+PCP WK diagram%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=0.5; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5]; d=o.d; wsize_x=1; wsize_y=3;
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
pms=[ 0, 0, 1000, 900]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=3; col=2; warning off all;
subplot(row,col,1); v=am4b.u850; 
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(a) U850 (AM4.0 AMIP)','FontSize',fsize);
subplot(row,col,3); v=cm4a.u850;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(b) U850 (AM4.0 Coupled)','FontSize',fsize);
subplot(row,col,5); vo=o.u850; 
x=vo.x; y=vo.y; z=vo.var_sym_filt'; %pcolor(x,y,z); 
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(c) U850 (ERA-INTERIM)','FontSize',fsize);
subplot(row,col,2); v=am4b.pcp; d=o.d;
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(d) Precipitation (AM4.0 AMIP)','FontSize',fsize);
subplot(row,col,4); v=cm4a.pcp;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(e) Precipitation (AM4.0 Coupled)','FontSize',fsize);
subplot(row,col,6); vo=o.pcp;
x=vo.x; y=vo.y; z=vo.var_sym_filt'; %pcolor(x,y,z); 
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(f) Precipitation (GPCP)','FontSize',fsize);
figpath='./fig_am4/'; visfig='off'; expn='AM4p0'; vname='WK_pcp_u850'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II - Suppl Fig.S1: OLR W-K sensitivity to rkm_dp
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=0.5; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5]; d=o.d; wsize_x=1; wsize_y=3;
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
pms=[ 0, 0, 1300, 1100]*0.8; fsize=10; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=0.08; y0=0.7; wx=0.3; wy=0.25; dx=0.05; dy=0.08;
p1= [x0,          y0,         wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,         wx, wy];%position of first subplot
p3= [x0,          y0-(wy+dy), wx, wy];%position of first subplot
p4= [x0+wx+dx,    y0-(wy+dy), wx, wy];%position of first subplot
nn=32; caxis([cmin cmax]); icmap=3;
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
subplot('Position',p1); v=am4.c1.olr;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; %colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
title('(a) OLR (C1)','FontSize',fsize);
subplot('Position',p2); v=am4.c2.olr;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; %colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
title('(b) OLR (C2)','FontSize',fsize);
subplot('Position',p3); v=am4.c3.olr;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; %colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
title('(c) OLR (C3)','FontSize',fsize);
subplot('Position',p4); v=am4.c4.olr;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; %colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
title('(d) OLR (C4)','FontSize',fsize);
pos=[0.2 0.3 0.4 0.015];%[left bottom width height];
h=colorbar('Location','southoutside','Position',pos); 
figpath='./fig_am4/'; visfig='off'; expn='am4sen_rkmdp'; vname='WK_olr'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%rkm_dp U200 sensitivity Fig in AM4.0 paper
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=0.5; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5]; d=o.d; wsize_x=1; wsize_y=3;
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
pms=[ 0, 0, 1000, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; warning off all;
subplot(row,col,1); v=am4.c1.u200;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(a) OLR (AM4.0-C1)','FontSize',fsize);
subplot(row,col,2); v=am4.c2.u200;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(b) OLR (AM4.0-C2)','FontSize',fsize);
subplot(row,col,3); v=am4.c3.u200;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(c) OLR (AM4.0-C3)','FontSize',fsize);
subplot(row,col,4); v=am4.c4.u200;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(d) OLR (AM4.0-C4)','FontSize',fsize);
figpath='./fig_am4/'; visfig='off'; expn='AM4sen_rkmdp'; vname='WK_u200'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%rkm_dp U850 sensitivity Fig in AM4.0 paper
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=0.5; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5]; d=o.d; wsize_x=1; wsize_y=3;
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
pms=[ 0, 0, 1000, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; warning off all;
subplot(row,col,1); v=am4.c1.u850;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(a) OLR (AM4.0-C1)','FontSize',fsize);
subplot(row,col,2); v=am4.c2.u850;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(b) OLR (AM4.0-C2)','FontSize',fsize);
subplot(row,col,3); v=am4.c3.u850;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(c) OLR (AM4.0-C3)','FontSize',fsize);
subplot(row,col,4); v=am4.c4.u850;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(d) OLR (AM4.0-C4)','FontSize',fsize);
figpath='./fig_am4/'; visfig='off'; expn='AM4sen_rkmdp'; vname='WK_u850'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II - Suppl Fig.S4: OLR W-K sensitivity to cfrac
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=0.5; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5]; d=o.d; wsize_x=1; wsize_y=3;
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
pms=[ 0, 0, 1300, 1100]*0.8; fsize=10; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=0.08; y0=0.7; wx=0.3; wy=0.25; dx=0.05; dy=0.08;
p1= [x0,          y0,         wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,         wx, wy];%position of first subplot
p3= [x0,          y0-(wy+dy), wx, wy];%position of first subplot
p4= [x0+wx+dx,    y0-(wy+dy), wx, wy];%position of first subplot
nn=32; caxis([cmin cmax]); icmap=3;
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
subplot('Position',p1); v=am4.c5.olr;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; %colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
title('(a) OLR (C5)','FontSize',fsize);
subplot('Position',p2); v=am4.c6.olr;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; %colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
title('(b) OLR (C6)','FontSize',fsize);
subplot('Position',p3); v=am4.c7.olr;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; %colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
title('(c) OLR (C7)','FontSize',fsize);
subplot('Position',p4); v=am4.c8.olr;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; %colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
title('(d) OLR (C8)','FontSize',fsize);
pos=[0.2 0.3 0.4 0.015];%[left bottom width height];
h=colorbar('Location','southoutside','Position',pos); 
figpath='./fig_am4/'; visfig='off'; expn='am4sen_cfrac'; vname='WK_olr'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%cfrac U200 sensitivity Fig in AM4.0 paper%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=0.5; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5]; d=o.d; wsize_x=1; wsize_y=3;
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
pms=[ 0, 0, 1000, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; warning off all;
subplot(row,col,1); v=am4.c5.u200;
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(a) OLR (AM4.0-C5)','FontSize',fsize);
subplot(row,col,2); v=am4.c6.u200;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(b) OLR (AM4.0-C6)','FontSize',fsize);
subplot(row,col,3); v=am4.c7.u200;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(c) OLR (AM4.0-C7)','FontSize',fsize);
subplot(row,col,4); v=am4.c8.u200;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(d) OLR (AM4.0-C8)','FontSize',fsize);
figpath='./fig_am4/'; visfig='off'; expn='AM4sen_cfrac'; vname='WK_u200'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%cfrac U850 sensitivity Fig in AM4.0 paper%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=0.5; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5]; d=o.d; wsize_x=1; wsize_y=3;
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
pms=[ 0, 0, 1000, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; warning off all;
subplot(row,col,1); v=am4.c5.u850;
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(a) OLR (AM4.0-C5)','FontSize',fsize);
subplot(row,col,2); v=am4.c6.u850;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(b) OLR (AM4.0-C6)','FontSize',fsize);
subplot(row,col,3); v=am4.c7.u850;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(c) OLR (AM4.0-C7)','FontSize',fsize);
subplot(row,col,4); v=am4.c8.u850;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
[x,y,z]=smoothwk(x,y,z,wsize_x,wsize_y);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(d) OLR (AM4.0-C8)','FontSize',fsize);
figpath='./fig_am4/'; visfig='off'; expn='AM4sen_cfrac'; vname='WK_u850'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OLR WK diagram%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=0.5; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5];
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
pms=[ 0, 0, 1000, 700]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; warning off all;
subplot(row,col,1); vo=o.olr; d=o.d;
x=vo.x; y=vo.y; z=vo.var_sym_filt; %pcolor(x,y,z); 
contourf(x,y,z',zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(a) NOAA Observed OLR','FontSize',fsize);
subplot(row,col,3); v=cm4.olr;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(b) CM4 (Coupled)','FontSize',fsize);
subplot(row,col,2); v=am4b.olr; 
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(c) AM4b (AMIP)','FontSize',fsize);
subplot(row,col,4); v=am3.olr; 
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(c) AM4c (AMIP)','FontSize',fsize);
figpath='./fig_am4/'; visfig='off'; expn='AM4p0'; vname='WK_olr'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Precip WK diagram%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=0.5; cmax=1.5; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5];
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
pms=[ 0, 0, 1000, 700]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; warning off all;
subplot(row,col,1); vo=o.pcp; d=o.d;
x=vo.x; y=vo.y; z=vo.var_sym_filt; %pcolor(x,y,z); 
contourf(x,y,z',zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(a) GPCP daily precipitation','FontSize',fsize);
subplot(row,col,3); v=cm4.pcp;  
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(b) AM4a (AMIP)','FontSize',fsize);
subplot(row,col,2); v=am4b.pcp; 
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(c) AM4b (AMIP)','FontSize',fsize);
subplot(row,col,4); v=am3.pcp; 
x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(c) AM4c (AMIP)','FontSize',fsize);
figpath='./fig_am4/'; visfig='off'; expn='AM4p0'; vname='WK_pcp'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Precip U200 diagram%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=1.0; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5];
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
pms=[ 0, 0, 1000, 700]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; warning off all;
subplot(row,col,1); vo=o.pcp; d=o.d;
x=vo.x; y=vo.y; z=vo.var_sym_filt; %pcolor(x,y,z); 
contourf(x,y,z',zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(a) NOAA Observed OLR','FontSize',fsize);
subplot(row,col,3); v=am4a.u200;  
x=v.x; y=v.y; z=v.var_sym_filt; z(z<1)=0; %pcolor(x,y,z);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(b) AM4a (AMIP)','FontSize',fsize);
subplot(row,col,2); v=am4b.u200; 
x=v.x; y=v.y; z=v.var_sym_filt; z(z<1)=0; %pcolor(x,y,z);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(c) AM4b (AMIP)','FontSize',fsize);
subplot(row,col,4); v=am3.u200; 
x=v.x; y=v.y; z=v.var_sym_filt; z(z<1)=0; %pcolor(x,y,z);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(c) AM4c (AMIP)','FontSize',fsize);
figpath='./fig_am4/'; visfig='off'; expn='AM4p0'; vname='WK_pcp'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Precip U850 diagram%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=1.0; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5];
nn=32; cmap=jet(nn); cmap(1:nn/2-2,:)=1; 
pms=[ 0, 0, 1000, 700]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; warning off all;
subplot(row,col,1); vo=o.pcp; d=o.d;
x=vo.x; y=vo.y; z=vo.var_sym_filt; %pcolor(x,y,z); 
contourf(x,y,z',zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(a) NOAA Observed OLR','FontSize',fsize);
subplot(row,col,3); v=am4a.u850;  
x=v.x; y=v.y; z=v.var_sym_filt; z(z<1)=0; %pcolor(x,y,z);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5));
plot(d.xx,d.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(b) AM4a (AMIP)','FontSize',fsize);
subplot(row,col,2); v=am4b.u850; 
x=v.x; y=v.y; z=v.var_sym_filt; z(z<1)=0; %pcolor(x,y,z);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(c) AM4b (AMIP)','FontSize',fsize);
subplot(row,col,4); v=am3.u850; 
x=v.x; y=v.y; z=v.var_sym_filt; z(z<1)=0; %pcolor(x,y,z);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(d.xx,d.AfreqKelvinRossby(:,1:5))
plot(d.xx,d.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(c) AM4c (AMIP)','FontSize',fsize);
figpath='./fig_am4/'; visfig='off'; expn='AM4p0'; vname='WK_pcp'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=0.5; cmax=1.6; zbin=[cmin:(cmax-cmin)/10:cmax]; 
xy=[-15 15 0 0.5];
nn=32; cmap=jet(nn); %cmap(nn/2:nn/2+1,:)=1; 
pms=[ 0, 0, 1000, 700]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2;
subplot(row,col,1)
v=am4;  x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
v=am41; x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(o.xx,o.AfreqKelvinRossby(:,1:5));
plot(o.xx,o.AfreqIG_n1(:,1:5));
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(a) AM4.0 (AMIP)','FontSize',fsize);
subplot(row,col,2)
v=cm4; x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(o.xx,o.AfreqKelvinRossby(:,1:5))
plot(o.xx,o.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(b) AM4.0 (coupled)','FontSize',fsize);
subplot(row,col,3)
v=am3; x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z);
contourf(x,y,z,zbin); hold on; shading flat; colorbar;
plot(o.xx,o.AfreqKelvinRossby(:,1:5))
plot(o.xx,o.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(c) AM3 (AMIP)','FontSize',fsize);
subplot(row,col,4)
v=o; x=v.x; y=v.y; z=v.var_sym_filt; %pcolor(x,y,z); 
contourf(x,y,z',zbin); hold on; shading flat; colorbar;
plot(o.xx,o.AfreqKelvinRossby(:,1:5))
plot(o.xx,o.AfreqIG_n1(:,1:5))
axis(xy); caxis([cmin cmax]); colormap(cmap);
title('(d) NOAA Observed OLR','FontSize',fsize);
figpath='./fig_am4/'; visfig='off'; expn='AM4p0'; vname='WK'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
