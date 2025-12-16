tpath='/archive/Ming.Zhao/backup/ECMWF/';
expn='ERAI_6h_DATA'; yr1=1979;yr2=2014;
opt='obs'; v=readarmap_mon(tpath,expn,yr1,yr2,opt);

opt='obs'; v=readarmap (tpath,expn,yr1,yr2,opt);
opt=1;     v=readar_all(tpath,expn,yr1,yr2,opt);

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn='c192L33_am4p0_amip_HIRESMIP_H8'; yr1=1979;yr2=1979;
opt='mod'; v=readarmap_mon(tpath,expn,yr1,yr2,opt);
opt='mod'; v=readarmap (tpath,expn,yr1,yr2,opt);
opt=1;     v=readar_all(tpath,expn,yr1,yr2,opt);

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn='c192L33_am4p0_amip_HIRESMIP_H8'; yr1=1979;yr2=2014;
opt='mod'; v=readarmap_mon(tpath,expn,yr1,yr2,opt);
opt='mod'; v=readarmap (tpath,expn,yr1,yr2,opt);
opt=1;     v=readar_all(tpath,expn,yr1,yr2,opt);

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_2'; yr1=2015;yr2=2050;
opt='mod'; v=readarmap_mon(tpath,expn,yr1,yr2,opt);
opt='mod'; v=readarmap (tpath,expn,yr1,yr2,opt);
opt=1;     v=readar_all(tpath,expn,yr1,yr2,opt);

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn='c192L33_am4p0_2010climo_new'; yr1=2;yr2=31;
opt='mod'; v=readarmap_mon(tpath,expn,yr1,yr2,opt);
opt='mod'; v=readarmap (tpath,expn,yr1,yr2,opt);
opt=1;     v=readar_all(tpath,expn,yr1,yr2,opt); 

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn='c192L33_am4p0_2010climo_new_p4K';  yr1=2;yr2=31;
opt='mod'; v=readarmap_mon(tpath,expn,yr1,yr2,opt);
opt='mod'; v=readarmap (tpath,expn,yr1,yr2,opt);
opt=1;     v=readar_all(tpath,expn,yr1,yr2,opt); 

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn='c192L33_am4p0_2010climo_new_4xCO2';yr1=2;yr2=31;
opt='mod'; v=readarmap (tpath,expn,yr1,yr2,opt);
opt=1;     v=readar_all(tpath,expn,yr1,yr2,opt); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/';
expn='ERAI_6h_DATA'; 
%fext='_1979_1979_readarmap.mat';    fn=strcat(tpath,expn,fext); load(fn);vo=v;
fext='_1979_2014_readarmap_mon.mat'; fn=strcat(tpath,expn,fext); load(fn);vo=v;
fext='_AR_1979_2016_saveopt1.mat';   fn=strcat(tpath,expn,fext); load(fn);vo.ar=v.ar;

expn='c192L33_am4p0_amip_HIRESMIP_H8';
%fext='_1979_2014_readarmap.mat';    fn=strcat(tpath,expn,fext); load(fn);vm=v;
fext='_1979_2014_readarmap_mon.mat'; fn=strcat(tpath,expn,fext); load(fn);vm=v;
fext='_AR_1950_2014_saveopt1.mat';   fn=strcat(tpath,expn,fext); load(fn);vm.ar=v.ar;

expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_2';
%fext='_readarmap_2015_2050.mat';    fn=strcat(tpath,expn,fext); load(fn);wm=v;
fext='_2015_2050_readarmap_mon.mat'; fn=strcat(tpath,expn,fext); load(fn);wm=v;
fext='_AR_2015_2050_saveopt1.mat';   fn=strcat(tpath,expn,fext); load(fn);wm.ar=v.ar;

expn='c192L33_am4p0_2010climo_new';
fext='_2_31_readarmap_mon.mat';      fn=strcat(tpath,expn,fext); load(fn);v1=v;
fext='_AR_2_31_saveopt1.mat';        fn=strcat(tpath,expn,fext); load(fn);v1.ar=v.ar;

expn='c192L33_am4p0_2010climo_new_p4K';
fext='_2_31_readarmap_mon';          fn=strcat(tpath,expn,fext); load(fn);w1=v;
fext='_AR_2_31_saveopt1.mat';        fn=strcat(tpath,expn,fext); load(fn);w1.ar=v.ar;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%test
tas678=squeeze(mean(vm.tasmax_av(6:8,end-35:end,:,:),1))-273.15;
tasmax=squeeze(mean(tas678,1)); lat=vm.lat; lon=vm.lon;
pms=[ 0, 0, 1500, 800]*1.0; fsize=16; lw=1; msize=4;
handle = figure('Position', pms,'visible','on'); m=7; 
contourf(lon,lat,tasmax,[0:0.5:45]); hold on; 
shading flat; colorbar; caxis([0 45]);
s={'JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','NOV','DEC'};
title('JJA seasonal mean daily maximum of TAS (1979-2014)','FontSize',fsize); %contourf(vm.lon,vm.lat,vm.lm,'w'); 
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; vname='tasmax-jja-mean';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%test
tas678=squeeze(max(vm.tasmax_av(6:8,:,:,:),[],1))-273.15;
tasmax=squeeze(max(tas678,[],1)); lat=vm.lat; lon=vm.lon;
pms=[ 0, 0, 1200, 800]*1.0; fsize=16; lw=1; msize=4;
handle = figure('Position', pms,'visible','on'); m=7; 
contourf(lon,lat,tasmax,[0:0.5:45]); hold on; 
shading flat; colorbar; caxis([0 45]);
s={'JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','NOV','DEC'};
title('JJA TAS MAX','FontSize',fsize); %contourf(vm.lon,vm.lat,vm.lm,'w'); 
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; vname='tasmax-jja';
printit(visfig,figpath,expn,vname);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim';      s2='C192AM4-Present';      s3='C192AM4-Future';
vname='tas_av_ann'; xmin=-90; xmax=90; xy=[xmin xmax 220 310]; xy1=[xmin xmax 0 5]; 
%y0=vo.tas_av_clm.ann; y0=mean(y0,2); x0=vo.lat;
y1=vm.tas_av_clm.ann; y1_g=mean(mean(y1.*vm.aa)); y1=mean(y1,2); x1=vm.lat;
y2=wm.tas_av_clm.ann; y2_g=mean(mean(y2.*vm.aa)); y2=mean(y2,2); x2=wm.lat;dtas_av=y2-y1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=1; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca;
%line(x0,y0, 'LineStyle','--','Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,y1, 'LineStyle','-','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,y2, 'LineStyle','-','Color','m','MarkerSize',msize,'LineWidth',lw); 
line([-90 90],[0 0], 'Color','k','MarkerSize',msize,'LineWidth',1); 
legend(s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude (degree)'; yl='surface air temperature (K)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy=(y2-y1);
line(x1,dy, 'LineStyle','-','Color','r','MarkerSize',msize,'LineWidth',lw);
s=sprintf('Future - Present (%4.2fK)',y2_g-y1_g); legend(s,1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fraction of AR frequency and AR associated precip
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim';      s2='C192AM4-Present';      s3='C192AM4-Future';
s4='ERA-Interim (AR)'; s5='C192AM4-Present (AR)'; s6='C192AM4-Future (AR)';
vname='arf_pr_frac'; xmin=-90; xmax=90; xy=[xmin xmax 0 0.15]; xy1=[xmin xmax 0 0.7];
a=vo.arfq;      y0=squeeze(nanmean(nanmean(a,1),3)); x0=vo.lat;
a=vm.arfq;      y1=squeeze(nanmean(nanmean(a,1),3)); x1=vm.lat;
a=wm.arfq;      y2=squeeze(nanmean(nanmean(a,1),3)); x2=wm.lat;
a=vo.prav6h_ar; y3=squeeze(nanmean(nanmean(a,1),3));
a=vm.prav6h_ar; y4=squeeze(nanmean(nanmean(a,1),3));
a=wm.prav6h_ar; y5=squeeze(nanmean(nanmean(a,1),3));
a=vo.prav6h_av; y6=squeeze(nanmean(nanmean(a,1),3));
a=vm.prav6h_av; y7=squeeze(nanmean(nanmean(a,1),3));
a=wm.prav6h_av; y8=squeeze(nanmean(nanmean(a,1),3));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=1; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca; lat0=0; 
id=(x0>-lat0 & x0<lat0); y0(id)=NaN; 
id=(x1>-lat0 & x1<lat0); y1(id)=NaN; y2(id)=NaN;
line(x0,y0, 'LineStyle','-','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,y1, 'LineStyle','-','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,y2, 'LineStyle','-','Color','m','MarkerSize',msize,'LineWidth',lw); 
line([-90 90],[0 0], 'Color','k','MarkerSize',msize,'LineWidth',1); 
lg=legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude (degree)'; yl='AR frequency of occurrence';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
lat0=10; id = (x1>-lat0 & x1<lat0);
line(x0,y3./y6, 'LineStyle','--','Color','k','MarkerSize',msize,'LineWidth',lw);
line(x1,y4./y7, 'LineStyle','--','Color','b','MarkerSize',msize,'LineWidth',lw);
line(x2,y5./y8, 'LineStyle','--','Color','m','MarkerSize',msize,'LineWidth',lw);
%line(x0,y6, 'LineStyle','--','Color','k','MarkerSize',msize,'LineWidth',lw);
%line(x1,y7, 'LineStyle','--','Color','b','MarkerSize',msize,'LineWidth',lw);
%line(x2,y8, 'LineStyle','--','Color','m','MarkerSize',msize,'LineWidth',lw);
legend(s1,s2,s3,1); axis(xy1); 
yl='fraction of precipitation from AR'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%latitudinal distribution of precipitation 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pr_ar_pctile'; xmin=-90; xmax=90; xy=[xmin xmax 0 250];
a=vm.prav6h_aravg;                y1=get_sea_mean(a);
a=wm.prav6h_aravg;                y2=get_sea_mean(a);
i=5; a=squeeze(vm.prav6h_arpct(:,i,:,:)); y1=get_sea_mean(a);
i=5; a=squeeze(wm.prav6h_arpct(:,i,:,:)); y2=get_sea_mean(a);
i=5; a=squeeze(vm.prav6h_pct(:,i,:,:)); y1=get_sea_mean(a);
i=5; a=squeeze(wm.prav6h_pct(:,i,:,:)); y2=get_sea_mean(a);
i=5; a=squeeze(vm.prav6h_f(:,i,:,:)); y1=get_sea_mean(a);
i=5; a=squeeze(wm.prav6h_f(:,i,:,:)); y2=get_sea_mean(a);

i=6; a=squeeze(vm.prav6h_pct  (:,i,:,:)); y1=squeeze(nanmean(nanmean(a,1),3));
i=6; a=squeeze(wm.prav6h_pct  (:,i,:,:)); y2=squeeze(nanmean(nanmean(a,1),3));

i=5; a=squeeze(vm.prav6h_arpct(:,i,:,:)); y1=squeeze(nanmean(nanmean(a,1),3));
i=5; a=squeeze(wm.prav6h_arpct(:,i,:,:)); y2=squeeze(nanmean(nanmean(a,1),3));
figure; plot(y2-y1); grid on

a=vm.prav6h_aravg;                        y2=squeeze(nanmean(nanmean(a,1),3));
i=4; a=squeeze(vm.prav6h_pct  (:,i,:,:)); y3=squeeze(nanmean(nanmean(a,1),3));
i=4; a=squeeze(vm.prav6h_arpct(:,i,:,:)); y4=squeeze(nanmean(nanmean(a,1),3));
i=5; a=squeeze(vm.prav6h_pct  (:,i,:,:)); y5=squeeze(nanmean(nanmean(a,1),3));
i=5; a=squeeze(vm.prav6h_arpct(:,i,:,:)); y6=squeeze(nanmean(nanmean(a,1),3));
i=6; a=squeeze(vm.prav6h_pct  (:,i,:,:)); y7=squeeze(nanmean(nanmean(a,1),3));
i=6; a=squeeze(vm.prav6h_arpct(:,i,:,:)); y8=squeeze(nanmean(nanmean(a,1),3));
a=squeeze(vm.prav6h_armax     (:,i,:,:)); y9=squeeze(nanmean(nanmean(a,1),3));
s1='annual mean'; s2='AR mean'; 
s3='90th percentile of all precip';   s4='90th percentile of AR precip';
s5='99th percentile of all precip';   s6='99th percentile of AR precip';
s7='99.9th percentile of all precip'; s8='99.9th percentile of AR precip';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=1; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca; lat0=0; x=vm.lat; id = (x>-lat0 & x<lat0);
plot(x, y1, 'k-', 'MarkerSize',msize,'LineWidth',lw); hold on;
plot(x, y2, 'k-', 'MarkerSize',msize,'LineWidth',lw*2);
plot(x, y3, 'b-', 'MarkerSize',msize,'LineWidth',lw);
plot(x, y4, 'b-', 'MarkerSize',msize,'LineWidth',lw*2);
plot(x, y5, 'r-', 'MarkerSize',msize,'LineWidth',lw);
plot(x, y6, 'r-', 'MarkerSize',msize,'LineWidth',lw*2);
plot(x, y7, 'm-', 'MarkerSize',msize,'LineWidth',lw);
plot(x, y8, 'm-', 'MarkerSize',msize,'LineWidth',lw*2);
plot(x, y9, 'y-', 'MarkerSize',msize,'LineWidth',lw*2);
legend(s1,s2,s3,s4,s5,s6,s7,s8,1); axis(xy); 
yl='precipitation (mm/day)'; ylabel(yl,'FontSize',fsize);
xl='latitude (degree)'; xlabel(xl,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%latitudinal distribution of precipitation 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pr_ar_pctile'; xmin=-90; xmax=90; xy=[xmin xmax 0 250];
a=vm.prav6h_av;                           y1=squeeze(nanmean(nanmean(a,1),3));
i=5; a=squeeze(vm.prav6h_pct  (:,i,:,:)); y2=squeeze(nanmean(nanmean(a,1),3));
i=6; a=squeeze(vm.prav6h_pct  (:,i,:,:)); y3=squeeze(nanmean(nanmean(a,1),3));
a=vm.prav6h_aravg;                        y4=squeeze(nanmean(nanmean(a,1),3));
i=5; a=squeeze(vm.prav6h_arpct(:,i,:,:)); y5=squeeze(nanmean(nanmean(a,1),3));
i=6; a=squeeze(vm.prav6h_arpct(:,i,:,:)); y6=squeeze(nanmean(nanmean(a,1),3));
s1='annual mean of all P'; s2='99th percentile of all P'; s3='99.9th percentile of all P';
s4='AR mean P'; s5='99th percentile of all AR P'; s6='99.9th percentile of all AR P';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=1; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca; lat0=0; x=vm.lat; id = (x>-lat0 & x<lat0);
plot(x, y1, 'b-', 'MarkerSize',msize,'LineWidth',lw); hold on;
plot(x, y2, 'b--','MarkerSize',msize,'LineWidth',lw);
plot(x, y3, 'b-.','MarkerSize',msize,'LineWidth',lw);
plot(x, y4, 'r-', 'MarkerSize',msize,'LineWidth',lw);
plot(x, y5, 'r--','MarkerSize',msize,'LineWidth',lw);
plot(x, y6, 'r-.','MarkerSize',msize,'LineWidth',lw);
legend(s1,s2,s3,s4,s5,s6,1); axis(xy); 
yl='precipitation (mm/day)'; ylabel(yl,'FontSize',fsize);
xl='latitude (degree)'; xlabel(xl,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%latitudinal distribution of precipitation 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='del_pr_ar'; xmin=-90; xmax=90; xy=[xmin xmax -10 15];
v=v1;
a=v.prav6h_av;                           y1=squeeze(nanmean(nanmean(a,1),3));
i=5; a=squeeze(v.prav6h_pct  (:,i,:,:)); y2=squeeze(nanmean(nanmean(a,1),3));
i=6; a=squeeze(v.prav6h_pct  (:,i,:,:)); y3=squeeze(nanmean(nanmean(a,1),3));
a=v.prav6h_aravg;                        y4=squeeze(nanmean(nanmean(a,1),3));
i=5; a=squeeze(v.prav6h_arpct(:,i,:,:)); y5=squeeze(nanmean(nanmean(a,1),3));
i=6; a=squeeze(v.prav6h_arpct(:,i,:,:)); y6=squeeze(nanmean(nanmean(a,1),3));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=w1;
a=v.prav6h_av;                           yy1=squeeze(nanmean(nanmean(a,1),3));
i=5; a=squeeze(v.prav6h_pct  (:,i,:,:)); yy2=squeeze(nanmean(nanmean(a,1),3));
i=6; a=squeeze(v.prav6h_pct  (:,i,:,:)); yy3=squeeze(nanmean(nanmean(a,1),3));
a=v.prav6h_aravg;                        yy4=squeeze(nanmean(nanmean(a,1),3));
i=5; a=squeeze(v.prav6h_arpct(:,i,:,:)); yy5=squeeze(nanmean(nanmean(a,1),3));
i=6; a=squeeze(v.prav6h_arpct(:,i,:,:)); yy6=squeeze(nanmean(nanmean(a,1),3));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lat0=0; x=vm.lat'; id = (x>-lat0 & x<lat0); n=10;
a=(yy1-y1)./y1*100; y1=mizsmooth(a,n); y1(id)=NaN;
a=(yy2-y2)./y2*100; y2=mizsmooth(a,n); y2(id)=NaN;
a=(yy3-y3)./y3*100; y3=mizsmooth(a,n); y3(id)=NaN;
a=(yy4-y4)./y4*100; y4=mizsmooth(a,n); y4(id)=NaN;
a=(yy5-y5)./y5*100; y5=mizsmooth(a,n); y5(id)=NaN;
a=(yy6-y6)./y6*100; y6=mizsmooth(a,n); y6(id)=NaN;
s1='annual mean of all P'; s2='99th percentile of all P'; s3='99.9th percentile of all P';
s4='AR mean P'; s5='99th percentile of all AR P'; s6='99.9th percentile of all AR P';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*1; fsize=16; lw=1; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca; lat0=0; x=vm.lat; id = (x>-lat0 & x<lat0);
plot(x, y1, 'b-', 'MarkerSize',msize,'LineWidth',lw); hold on;
plot(x, y2, 'b--','MarkerSize',msize,'LineWidth',lw);
plot(x, y3, 'b-.','MarkerSize',msize,'LineWidth',lw);
plot(x, y4, 'r-', 'MarkerSize',msize,'LineWidth',lw);
plot(x, y5, 'r--','MarkerSize',msize,'LineWidth',lw);
plot(x, y6, 'r-.','MarkerSize',msize,'LineWidth',lw);
legend(s1,s2,s3,s4,s5,s6,4); axis(xy); grid on;
yl='precipitation (mm/day)'; ylabel(yl,'FontSize',fsize);
xl='latitude (degree)'; xlabel(xl,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%percentage change of AR frequency and various measures of precip
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim';      s2='C192AM4-Present';      s3='C192AM4-Future';
s4='ERA-Interim (AR)'; s5='C192AM4-Present (AR)'; s6='C192AM4-Future (AR)';
vname='arf_pr_change'; xmin=-90; xmax=90; xy=[xmin xmax -12 20]; 
a=vm.freq_ar_clm.ann;    y1=nanmean(a,2); x=vm.lat;
a=wm.freq_ar_clm.ann;    y2=nanmean(a,2); 
a=vm.prav6h_ar_clm.ann;  y3=mean(a,2); 
a=wm.prav6h_ar_clm.ann;  y4=mean(a,2);
a=vm.prav6h_999_clm.ann; y5=mean(a,2);
a=wm.prav6h_999_clm.ann; y6=mean(a,2);
a=vm.prav6h_av_clm.ann;  y7=mean(a,2);
a=wm.prav6h_av_clm.ann;  y8=mean(a,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=1; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca; lat0=0; id = (x>-lat0 & x<lat0);
a=(y2-y1)./y1*100; z1=mizsmooth(a,3); z1(id)=NaN;
a=(y4-y3)./y3*100; z2=mizsmooth(a,3); z2(id)=NaN;
a=(y6-y5)./y5*100; z3=mizsmooth(a,3); z3(id)=NaN;
a=(y8-y7)./y7*100; z4=mizsmooth(a,3); z4(id)=NaN;
line(x, z1, 'LineStyle','-','Color','k','MarkerSize',msize,'LineWidth',lw);
line(x, z2, 'LineStyle','-','Color','r','MarkerSize',msize,'LineWidth',lw);
line(x, z3, 'LineStyle','-','Color','m','MarkerSize',msize,'LineWidth',lw);
line(x, z4, 'LineStyle','-','Color','g','MarkerSize',msize,'LineWidth',lw);
line([-90 90],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
S1='AR frequency';
S2='AR mean precipitation'; 
S3='99.9th percentile of 6hr precipitation';
S4='total mean precipitation';
legend(S1,S2,S3,S4,4); axis(xy); 
yl='percent change (Future minus Present, %)'; ylabel(yl,'FontSize',fsize);
xl='latitude (degree)'; xlabel(xl,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim';      s2='C192AM4-Present';      s3='C192AM4-Future';
s4='ERA-Interim (AR)'; s5='C192AM4-Present (AR)'; s6='C192AM4-Future (AR)';
vname='ar_freq_ann'; xmin=-90; xmax=90; xy=[xmin xmax 0 0.15]; xy1=[xmin xmax -10 30]; 
y0=vo.freq_ar_clm.ann; y0=nanmean(y0,2); x0=vo.lat; 
y1=vm.freq_ar_clm.ann; y1=nanmean(y1,2); x1=vm.lat;
y2=wm.freq_ar_clm.ann; y2=nanmean(y2,2); x2=wm.lat;
Y1=vm.prav6h_ar_clm.ann;   Y1=mean(Y1,2);
Y2=wm.prav6h_ar_clm.ann;   Y2=mean(Y2,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=1; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca; lat0=0; 
id=(x0>-lat0 & x0<lat0); y0(id)=NaN; 
id=(x1>-lat0 & x1<lat0); y1(id)=NaN; y2(id)=NaN;
line(x0,y0, 'LineStyle','-','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,y1, 'LineStyle','-','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,y2, 'LineStyle','-','Color','m','MarkerSize',msize,'LineWidth',lw); 
line([-90 90],[0 0], 'Color','k','MarkerSize',msize,'LineWidth',1); 
lg=legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude (degree)'; yl='AR frequency of occurrence';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
lat0=10; id = (x1>-lat0 & x1<lat0);
dy1=(y2-y1)./y1*100; dy=mizsmooth(dy1,3); dy(1:27)=NaN; dy(id)=NaN;
dY1=(Y2-Y1)./Y1*100; dY=mizsmooth(dY1,3); dY(1:27)=NaN; dY(id)=NaN;
line(x1,dy, 'LineStyle','-','Color','r','MarkerSize',msize,'LineWidth',lw);
line(x1,dY, 'LineStyle','--','Color','r','MarkerSize',msize,'LineWidth',lw);
line([-90 90],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
S1='Future minus Present (AR frequency)';
S2='Future minus Present (AR precipitation)'; legend(S1,S2,1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim';      s2='C192AM4-Present';      s3='C192AM4-Future';
s4='ERA-Interim (AR)'; s5='C192AM4-Present (AR)'; s6='C192AM4-Future (AR)';
vname='dprw_ar_ann'; xmin=-90; xmax=90; xy=[xmin xmax 0 70]; xy1=[xmin xmax 0 30]; 
Y0=vo.prw_av_clm.ann; Y0=mean(Y0,2);
Y1=vm.prw_av_clm.ann; Y1=mean(Y1,2);
Y2=wm.prw_av_clm.ann; Y2=mean(Y2,2);
y0=vo.prw_ar_clm.ann; y0=mean(y0,2); x0=vo.lat; 
y1=vm.prw_ar_clm.ann; y1=mean(y1,2); x1=vm.lat;
y2=wm.prw_ar_clm.ann; y2=mean(y2,2); x2=wm.lat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=1; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca; lat0=10; 
id=(x0>-lat0 & x0<lat0); y0(id)=NaN; 
id=(x1>-lat0 & x1<lat0); y1(id)=NaN; y2(id)=NaN;
line(x0,Y0, 'LineStyle','-', 'Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,Y1, 'LineStyle','-', 'Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,Y2, 'LineStyle','-', 'Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
line(x0,y0, 'LineStyle','--','Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,y1, 'LineStyle','--','Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,y2, 'LineStyle','--','Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
line([-90 90],[0 0], 'Color','k','MarkerSize',msize,'LineWidth',1); 
lg=legend(s1,s2,s3,s4,s5,s6,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude (degree)'; yl='precipitable water (kg m^{-2})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
lat0=10; id = (x1>-lat0 & x1<lat0);
dY1=(Y2-Y1)./Y1*100; dY=mizsmooth(dY1,1); %dY(id)=NaN; dY(1:28)=NaN;
dy1=(y2-y1)./y1*100; dy=mizsmooth(dy1,1); %dy(id)=NaN; dy(1:28)=NaN;
line(x1,dY, 'LineStyle','-',  'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,dy, 'LineStyle','--', 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw);
line([-90 90],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('Future minus Present','Future minus Present (AR)',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim';      s2='C192AM4-Present';      s3='C192AM4-Future';
s4='ERA-Interim (AR)'; s5='C192AM4-Present (AR)'; s6='C192AM4-Future (AR)';
vname='prw_ar_ann'; xmin=-90; xmax=90; xy=[xmin xmax 0 70]; xy1=[xmin xmax 0 30]; 
Y0=vo.prw_clm.ann; Y0=mean(Y0,2);
Y1=vm.prw_clm.ann; Y1=mean(Y1,2);
Y2=wm.prw_clm.ann; Y2=mean(Y2,2);
y0=vo.prw_ar_clm.ann./vo.freq_ar_clm.ann; y0=mean(y0,2); x0=vo.lat; 
y1=vm.prw_ar_clm.ann./vm.freq_ar_clm.ann; y1=mean(y1,2); x1=vm.lat;
y2=wm.prw_ar_clm.ann./wm.freq_ar_clm.ann; y2=mean(y2,2); x2=wm.lat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=1; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca; lat0=10; 
id=(x0>-lat0 & x0<lat0); y0(id)=NaN; 
id=(x1>-lat0 & x1<lat0); y1(id)=NaN; y2(id)=NaN;
line(x0,Y0, 'LineStyle','-', 'Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,Y1, 'LineStyle','-', 'Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,Y2, 'LineStyle','-', 'Color','m','MarkerSize',msize,'LineWidth',lw); 
line(x0,y0, 'LineStyle','--','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,y1, 'LineStyle','--','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,y2, 'LineStyle','--','Color','m','MarkerSize',msize,'LineWidth',lw); 
line([-90 90],[0 0], 'Color','k','MarkerSize',msize,'LineWidth',1); 
lg=legend(s1,s2,s3,s4,s5,s6,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude (degree)'; yl='precipitable water (kg m^{-2})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
lat0=10; id = (x1>-lat0 & x1<lat0); 
dY1=(Y2-Y1)./Y1*100; dY=mizsmooth(dY1,1); %dY(id)=NaN; dY(1:28)=NaN;
dy1=(y2-y1)./y1*100; dy=mizsmooth(dy1,1); %dy(id)=NaN; dy(1:28)=NaN;
line(x1,dY, 'LineStyle','-', 'Color','r','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,dy, 'LineStyle','--','Color','r','MarkerSize',msize,'LineWidth',lw);
line(x1,dtas*7, 'LineStyle',':','Color','r','MarkerSize',msize,'LineWidth',lw*2);
line([-90 90],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('Future minus Present','Future minus Present (AR)','CC scaling (\DeltaTAS*7%)',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim';      s2='C192AM4-Present';      s3='C192AM4-Future';
s4='ERA-Interim (AR)'; s5='C192AM4-Present (AR)'; s6='C192AM4-Future (AR)';
vname='tcrh_ar_ann'; xmin=-90; xmax=90; xy=[xmin xmax 0.2 1]; xy1=[xmin xmax -5 5]; 
Y0=vm.tcrh_clm.ann; Y0=mean(Y0,2);
Y1=vm.tcrh_clm.ann; Y1=mean(Y1,2);
Y2=wm.tcrh_clm.ann; Y2=mean(Y2,2);
y0=vm.tcrh_ar_clm.ann./vm.freq_ar_clm.ann; y0=mean(y0,2); x0=vm.lat; 
y1=vm.tcrh_ar_clm.ann./vm.freq_ar_clm.ann; y1=mean(y1,2); x1=vm.lat;
y2=wm.tcrh_ar_clm.ann./wm.freq_ar_clm.ann; y2=mean(y2,2); x2=wm.lat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=1; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca; lat0=10; 
id=(x0>-lat0 & x0<lat0); y0(id)=NaN; 
id=(x1>-lat0 & x1<lat0); y1(id)=NaN; y2(id)=NaN;
line(x0,Y0, 'LineStyle','-', 'Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,Y1, 'LineStyle','-', 'Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,Y2, 'LineStyle','-', 'Color','m','MarkerSize',msize,'LineWidth',lw); 
line(x0,y0, 'LineStyle','--','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,y1, 'LineStyle','--','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,y2, 'LineStyle','--','Color','m','MarkerSize',msize,'LineWidth',lw); 
line([-90 90],[0 0], 'Color','k','MarkerSize',msize,'LineWidth',1); 
lg=legend(s1,s2,s3,s4,s5,s6,3); axis(xy); set(gca,'FontSize',fsize);
xl='latitude (degree)'; yl='precipitable water (kg m^{-2})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
lat0=10; id = (x1>-lat0 & x1<lat0); 
dY1=(Y2-Y1)./Y1*100; dY=mizsmooth(dY1,1); %dY(id)=NaN; dY(1:28)=NaN;
dy1=(y2-y1)./y1*100; dy=mizsmooth(dy1,1); %dy(id)=NaN; dy(1:28)=NaN;
line(x1,dY, 'LineStyle','-', 'Color','r','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,dy, 'LineStyle','--','Color','r','MarkerSize',msize,'LineWidth',lw);
line([-90 90],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('Future minus Present','Future minus Present (AR)',4); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim (AR precipitation)';s2='C192AM4-Present (AR precipitation)';s3='C192AM4-Future (AR precipitation)';
s4='ERA-Interim (AR moistening)';   s5='C192AM4-Present (AR moistening)'; s6='C192AM4-Future (AR moistening)';
vname='pcp_ar_ann'; xmin=-90; xmax=90; xy=[xmin xmax -0.5 2]; xy1=[xmin xmax -10 40]; 
y0=vo.divt_ar_clm.ann; y0=mean(y0,2); x0=vo.lat; 
y1=vm.divt_ar_clm.ann; y1=mean(y1,2); x1=vm.lat;
y2=wm.divt_ar_clm.ann; y2=mean(y2,2); x2=wm.lat;
Y0=vo.pcp_ar_clm.ann;    Y0=mean(Y0,2);
Y1=vm.pr_ar_clm.ann;     Y1=mean(Y1,2);
Y2=wm.pr_ar_clm.ann;     Y2=mean(Y2,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x0,Y0, 'LineStyle','-', 'Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,Y1, 'LineStyle','-', 'Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,Y2, 'LineStyle','-', 'Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
line(x0,y0, 'LineStyle','--','Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,y1, 'LineStyle','--','Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,y2, 'LineStyle','--','Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
line([-90 90],[0 0], 'Color','k','MarkerSize',msize,'LineWidth',1); 
lg=legend(s1,s2,s3,s4,s5,s6,2); %ch=findall(lg,'type','axes');
%ah=annotation('rectangle',get(ch,'position')); set(ah,'facecolor','w','facealpha',0.5);
axis(xy); set(gca,'FontSize',fsize);
xl='latitude (degree)'; 
yl='AR associated precipitation and atmospheric moistening (mm day^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
lat0=40; id = (x1>-lat0 & x1<lat0);
dY1=(Y2-Y1)./Y1*100; dY=mizsmooth(dY1,5); dY(id)=NaN; dY(1:28)=NaN;
dy1=(y2-y1)./y1*100; dy=mizsmooth(dy1,5); dy(id)=NaN; dy(1:28)=NaN;
line(x1,dY, 'LineStyle','-',  'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,dy, 'LineStyle','--', 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw);
line([-90 90],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('Future minus Present','Future minus Present (AR)',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim';      s2='C192AM4-Present';      s3='C192AM4-Future';
s4='ERA-Interim (AR)'; s5='C192AM4-PRESENT (AR)'; s6='C192AM4-WARMING (AR)';
vname='pcp_ar_ann'; xmin=-90; xmax=90; xy=[xmin xmax 0 10]; xy1=[xmin xmax -10 30]; 
y0=vo.divt_ar_clm.ann; y0=mean(y0,2); x0=vo.lat; 
y1=vm.divt_ar_clm.ann; y1=mean(y1,2); x1=vm.lat;
y2=wm.divt_ar_clm.ann; y2=mean(y2,2); x2=wm.lat;
Y0=vo.pcp_ar_clm.ann;                    Y0=mean(Y0,2);
Y1=vm.pr_av_clm.ann-vm.ev_av_clm.ann;    Y1=mean(Y1,2);
Y2=wm.pr_av_clm.ann-wm.ev_av_clm.ann;    Y2=mean(Y2,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x0,Y0, 'LineStyle','-', 'Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,Y1, 'LineStyle','-', 'Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,Y2, 'LineStyle','-', 'Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
line(x0,y0, 'LineStyle','--','Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,y1, 'LineStyle','--','Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,y2, 'LineStyle','--','Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
line([-90 90],[0 0], 'Color','k','MarkerSize',msize,'LineWidth',1); 
lg=legend(s1,s2,s3,s4,s5,s6,2); %ch=findall(lg,'type','axes');
%ah=annotation('rectangle',get(ch,'position')); set(ah,'facecolor','w','facealpha',0.5);
axis(xy); set(gca,'FontSize',fsize);
xl='latitude (degree)'; yl='meridional total water transport (kg/m/s)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
lat0=25; id = (x1>-lat0 & x1<lat0);
dY1=(Y2-Y1)./Y1*100; dY=mizsmooth(dY1,10); dY(id)=NaN;
dy1=(y2-y1)./y1*100; dy=mizsmooth(dy1,10); dy(id)=NaN; dy(1:30)=NaN;
line(x1,dY, 'LineStyle','-',  'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,dy, 'LineStyle','--', 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw);
line([-90 90],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('WARMING - PRESENT','WARMING - PRESENT (AR)',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim';      s2='C192AM4-Present';      s3='C192AM4-Future';
s4='ERA-Interim (AR)'; s5='C192AM4-Present (AR)'; s6='C192AM4-Future (AR)';
vname='pcp_ar_ann'; xmin=-90; xmax=90; xy=[xmin xmax 0 8]; xy1=[xmin xmax -10 30]; 
Y0=vo.pcp_clm.ann;    Y0=mean(Y0,2);
Y1=vm.pcp_clm.ann;    Y1=mean(Y1,2);
Y2=wm.pcp_clm.ann;    Y2=mean(Y2,2);
y0=vo.pcp_ar_clm.ann; y0=mean(y0,2); x0=vo.lat; 
y1=vm.pcp_ar_clm.ann; y1=mean(y1,2); x1=vm.lat;
y2=wm.pcp_ar_clm.ann; y2=mean(y2,2); x2=wm.lat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=1; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x0,Y0, 'LineStyle','-', 'Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,Y1, 'LineStyle','-', 'Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,Y2, 'LineStyle','-', 'Color','m','MarkerSize',msize,'LineWidth',lw); 
line(x0,y0, 'LineStyle','--','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,y1, 'LineStyle','--','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,y2, 'LineStyle','--','Color','m','MarkerSize',msize,'LineWidth',lw); 
line([-90 90],[0 0], 'Color','k','MarkerSize',msize,'LineWidth',1); 
lg=legend(s1,s2,s3,s4,s5,s6,2); %ch=findall(lg,'type','axes');
%ah=annotation('rectangle',get(ch,'position')); set(ah,'facecolor','w','facealpha',0.5);
axis(xy); set(gca,'FontSize',fsize);
xl='latitude (degree)'; yl='surface precipitation rate (mm day^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
lat0=25; id = (x1>-lat0 & x1<lat0);
dY1=(Y2-Y1)./Y1*100; dY=mizsmooth(dY1,10); dY(id)=NaN;
dy1=(y2-y1)./y1*100; dy=mizsmooth(dy1,10); dy(id)=NaN; dy(1:30)=NaN;
line(x1,dY, 'LineStyle','-',  'Color','r','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,dy, 'LineStyle','--', 'Color','r','MarkerSize',msize,'LineWidth',lw);
line([-90 90],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('Future minus Present','Future minus Present (AR)',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim';      s2='C192AM4-Present';      s3='C192AM4-Future';
s4='ERA-Interim (AR)'; s5='C192AM4-Present (AR)'; s6='C192AM4-Future (AR)';
vname='ivty_ar_ann'; xmin=-90; xmax=90; xy=[xmin xmax -40 40]; xy1=[xmin xmax -40 40]; 
y0=vo.ivty_ar_clm.ann; y0=mean(y0,2); x0=vo.lat; 
y1=vm.ivty_ar_clm.ann; y1=mean(y1,2); x1=vm.lat;
y2=wm.ivty_ar_clm.ann; y2=mean(y2,2); x2=wm.lat;
Y0=vo.ivty_clm.ann;    Y0=mean(Y0,2); Y0(end)=0;
Y1=vm.ivty_clm.ann;    Y1=mean(Y1,2);
Y2=wm.ivty_clm.ann;    Y2=mean(Y2,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=1; msize=4;
handle = figure('Position', pms,'visible','on'); ax1=gca;
line(x0,Y0, 'LineStyle','-', 'Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,Y1, 'LineStyle','-', 'Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,Y2, 'LineStyle','-', 'Color','m','MarkerSize',msize,'LineWidth',lw); 
line(x0,y0, 'LineStyle','--','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,y1, 'LineStyle','--','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,y2, 'LineStyle','--','Color','m','MarkerSize',msize,'LineWidth',lw); 
line([-90 90],[0 0], 'Color','k','MarkerSize',msize,'LineWidth',1); 
legend(s1,s2,s3,s4,s5,s6,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude (degree)'; yl='meridional total water transport (kg m^{-1}s^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
lat0=25; id = (x1>-lat0 & x1<lat0);
dY1=(Y2-Y1)./Y1*100; dY=mizsmooth(dY1,3); dY(id)=NaN;
dy1=(y2-y1)./y1*100; dy=mizsmooth(dy1,3); dy(id)=NaN; dy(1:32)=NaN;
line(x1,dY, 'LineStyle','-', 'Color','r','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,dy, 'LineStyle','--','Color','r','MarkerSize',msize,'LineWidth',lw);
line([-90 90],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('Future minus Present','Future minus Present (AR)',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PRESENT'; s3='C192AM4-WARMING';
vname='pcp_ar_ann'; xmin=-90; xmax=90; xy=[xmin xmax 0 1.5]; xy1=[xmin xmax -20 50]; 
y0=vo.pcp99_clm.ann; y0=mean(y0,2); x0=vo.lat;
y1=vm.pcp99_clm.ann; y1=mean(y1,2); x1=vm.lat;
y2=wm.pcp99_clm.ann; y2=mean(y2,2); x2=wm.lat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x0,y0, 'Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,y1, 'Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,y2, 'Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude (degree)'; yl='AR associated precipitation (mm/day)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy1=(y2-y1)./y1*100; dy=mizsmooth(dy1,10);
line(x1,dy, 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); hold on;
line([-90 90],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('WARMING - PRESENT',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PRESENT'; s3='C192AM4-WARMING';
vname='pcp_ar_ann'; xmin=-90; xmax=90; xy=[xmin xmax 0 1.5]; xy1=[xmin xmax -20 50]; 
y0=vo.pcp_ar_clm.ann; y0=mean(y0,2); x0=vo.lat;
y1=vm.pcp_ar_clm.ann; y1=mean(y1,2); x1=vm.lat;
y2=wm.pcp_ar_clm.ann; y2=mean(y2,2); x2=wm.lat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x0,y0, 'Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,y1, 'Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,y2, 'Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude (degree)'; yl='AR associated precipitation (mm/day)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy1=(y2-y1)./y1*100; dy=mizsmooth(dy1,10);
line(x1,dy, 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); hold on;
line([-90 90],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('WARMING - PRESENT',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PRESENT'; s3='C192AM4-WARMING';
vname='pcp_ar_djf'; xmin=-90; xmax=90; xy=[xmin xmax 0 1.5]; xy1=[xmin xmax -20 50]; 
y0=vo.pcp_ar_clm.djf; y0=mean(y0,2); x0=vo.lat;
y1=vm.pcp_ar_clm.djf; y1=mean(y1,2); x1=vm.lat;
y2=wm.pcp_ar_clm.djf; y2=mean(y2,2); x2=wm.lat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x0,y0, 'Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,y1, 'Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,y2, 'Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude (degree)'; yl='AR associated precipitation (mm/day)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy1=(y2-y1)./y1*100; dy=mizsmooth(dy1,10);
line(x1,dy, 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); hold on;
line([-90 90],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('WARMING - PRESENT',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PRESENT'; s3='C192AM4-WARMING';
vname='pcp_ar_ann_frac'; xmin=-90; xmax=90; xy=[xmin xmax 0 0.6]; xy1=[xmin xmax -20 50]; 
y0=vo.pcp_ar_clm.ann./vo.pcp_clm.ann; y0=mean(y0,2); x0=vo.lat;
y1=vm.pcp_ar_clm.ann./vm.pcp_clm.ann; y1=mean(y1,2); x1=vm.lat;
y2=wm.pcp_ar_clm.ann./wm.pcp_clm.ann; y2=mean(y2,2); x2=wm.lat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x0,y0, 'Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,y1, 'Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,y2, 'Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude (degree)'; yl='fraction of AR associated precipitation';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy1=(y2-y1)./y1*100; dy=mizsmooth(dy1,10);
line(x1,dy, 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); hold on;
line([-90 90],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('WARMING - PRESENT',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PRESENT'; s3='C192AM4-WARMING';
vname='pcp_ar_djf_frac'; xmin=-90; xmax=90; xy=[xmin xmax 0 0.6]; xy1=[xmin xmax -20 50];
y0=vo.pcp_ar_clm.djf./vo.pcp_clm.djf; y0=mean(y0,2); x0=vo.lat;
y1=vm.pcp_ar_clm.djf./vm.pcp_clm.djf; y1=mean(y1,2); x1=vm.lat;
y2=wm.pcp_ar_clm.djf./wm.pcp_clm.djf; y2=mean(y2,2); x2=wm.lat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x0,y0, 'Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,y1, 'Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,y2, 'Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude (degree)'; yl='fraction of AR associated precipitation';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy1=(y2-y1)./y1*100; dy=mizsmooth(dy1,10);
line(x1,dy, 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); hold on;
line([-90 90],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('WARMING - PRESENT',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PRESENT'; s3='C192AM4-WARMING';
vname='pcp_ar_jja_frac'; xmin=-90; xmax=90; xy=[xmin xmax 0 0.5]; xy1=[xmin xmax -10 30]; 
y0=vo.pcp_ar_clm.jja./vo.pcp_clm.jja; y0=mean(y0,2); x0=vo.lat;
y1=vm.pcp_ar_clm.jja./vm.pcp_clm.jja; y1=mean(y1,2); x1=vm.lat;
y2=wm.pcp_ar_clm.jja./wm.pcp_clm.jja; y2=mean(y2,2); x2=wm.lat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x0,y0, 'Marker','*','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x1,y1, 'Marker','o','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x2,y2, 'Marker','s','Color','m','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude (degree)'; yl='AR associated precipitation (mm/day)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
line(x1,(y2-y1)./y1*100, 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); 
line([-90 90],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('WARMING - PRESENT',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure; 
plot(vm.lat,mean(vm.ivty_ar_ann,2)./mean(vm.ivty_ann,2)); hold on; 
plot(vo.lat,mean(vo.ivty_ar_ann,2)./mean(vo.ivty_ann,2),'r');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Figures for AR paper%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-Present'; s3='C192AM4-Future';
bins=10; bin=[0 :bins:800 800+bins:10*bins:1250]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
x=sqrt(vo.ar.ivtz.^2+vo.ar.ivtm.^2); vo.ivt=findpdf(x,bin); vo.ar_no=length(x)/vo.nyr;
x=sqrt(vm.ar.ivtz.^2+vm.ar.ivtm.^2); vm.ivt=findpdf(x,bin); vm.ar_no=length(x)/vm.nyr;
x=sqrt(wm.ar.ivtz.^2+wm.ar.ivtm.^2); wm.ivt=findpdf(x,bin); wm.ar_no=length(x)/wm.nyr;
s1=sprintf('%s (%5.f)',s1,vo.ar_no);
s2=sprintf('%s (%5.f)',s2,vm.ar_no);
s3=sprintf('%s (%5.f)',s3,wm.ar_no);
vname='ivt_ar_pdf'; xmin=50; xmax=1250; xy=[xmin xmax 0 0.0032];  xy1=[xmin xmax -50 360];
x =vo.ivt.binc; y0=vo.ivt.pdf; y1=vm.ivt.pdf; y2=wm.ivt.pdf; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x,y0, 'Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x,y1, 'Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x,y2, 'Color','m','MarkerSize',msize,'LineWidth',lw); 
xx=[50 250 500 750 1000 1250]; xlist={'50','250','500','750','1000','1250'};
set(gca,'xtick',xx); set(gca,'xticklabel',xlist,'FontSize',fsize);
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize); %grid minor;
xl='Integrated Water Vapor Transport (kg m^{-1}s^{-1})';
yl='Probability Density (ms kg^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy=(y2-y1)./y1*100; dy=mizsmooth(dy',3);
line(x,dy, 'Color','r','MarkerSize',msize,'LineWidth',lw); hold on;
line([0    250], [0 0], 'Color','k','LineWidth',5);  
line([250  500], [0 0], 'Color','g','LineWidth',5); text(320,-10,'Cat 0-2','FontSize',fsize);
line([500  750], [0 0], 'Color','b','LineWidth',5); text(570,-10,'Cat 1-3','FontSize',fsize);
line([750  1000],[0 0], 'Color','y','LineWidth',5); text(820,-10,'Cat 2-4','FontSize',fsize);
line([1000 1250],[0 0], 'Color','r','LineWidth',5); text(1070,-10,'Cat 3-5','FontSize',fsize);
xx=[50 250 500 750 1000 1250]; xlist={'50','250','500','750','1000','1250'};
set(gca,'xtick',xx); set(gca,'xticklabel',xlist,'FontSize',fsize);
legend('Future minus Present',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PRESENT'; s3='C192AM4-WARMING';
bins=20; bin=[-1000:5*bins:0 0+bins:bins:700 700+bins:5*bins:1200]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
x=vo.ar.ivtz; vo.ivtz=findpdf(x,bin);
x=vm.ar.ivtz; vm.ivtz=findpdf(x,bin);
x=wm.ar.ivtz; wm.ivtz=findpdf(x,bin);
vname='ivtz_pdf'; xmin=-800; xmax=1000; xy=[xmin xmax 0 0.003];  xy1=[xmin xmax -50 200];
x =vo.ivtz.binc; y0=vo.ivtz.pdf; y1=vm.ivtz.pdf; y2=wm.ivtz.pdf; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x,y0, 'Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x,y1, 'Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x,y2, 'Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize); %grid minor
xl='zonal IVT (kg/m/s)'; yl='probability density (ms/kg)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy=(y2-y1)./y1*100; dy=mizsmooth(dy',3);
line(x,dy, 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); hold on;
line([xmin xmax],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('WARMING - PRESENT',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PRESENT'; s3='C192AM4-WARMING';
bins=20; bin=[-1200:100:-700 -700+bins:bins:700-bins 700:100:1200]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
x=vo.ar.ivtm; vo.ivtm=findpdf(x,bin);
x=vm.ar.ivtm; vm.ivtm=findpdf(x,bin);
x=wm.ar.ivtm; wm.ivtm=findpdf(x,bin);
vname='ivtm_pdf'; xmin=-700; xmax=700; xy=[xmin xmax 0 0.003];  xy1=[xmin xmax -50 100];
x =vo.ivtm.binc; y0=vo.ivtm.pdf; y1=vm.ivtm.pdf; y2=wm.ivtm.pdf; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x,y0, 'Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x,y1, 'Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x,y2, 'Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize); %grid minor
xl='meridional IVT (kg/m/s)'; yl='probability density (ms/kg)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy1=(y2-y1)./y1*100; dy=mizsmooth(dy1,3); id=isnan(dy); dy(id)=dy1(id);
line(x,dy, 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); hold on;
line([xmin xmax],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('WARMING - PRESENT',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-Present'; s3='C192AM4-Future';
bins=450; bin=[2000:bins:8000 8000+bins:3*bins:50000];
x=vo.ar.leng; vo.len=findpdf(x,bin); vo.ar_no=length(x)/vo.nyr;%s1=sprintf('%s (%7.1f)',s1,vo.ar_no);
x=vm.ar.leng; vm.len=findpdf(x,bin); vm.ar_no=length(x)/vm.nyr;%s2=sprintf('%s (%7.1f)',s2,vm.ar_no);
x=wm.ar.leng; wm.len=findpdf(x,bin); wm.ar_no=length(x)/wm.nyr;%s3=sprintf('%s (%7.1f)',s3,wm.ar_no);
vname='len_pdf'; xmin=2000; xmax=16000; xy=[xmin xmax 0 0.0004]; xy1=[xmin xmax -20 50]; 
x =vo.len.binc; y0=vo.len.pdf; y1=vm.len.pdf; y2=wm.len.pdf; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=1; msize=8;
handle = figure('Position', pms,'visible','on');
ax1=gca; 
line(x,y0,'Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x,y1,'Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x,y2,'Color','m','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='length (km)'; yl='probability density (km^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy=(y2-y1)./y1*100; dy=mizsmooth(dy,3);
line(x,dy,'Color','r','MarkerSize',msize,'LineWidth',lw); hold on;
line([xmin xmax],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('Future minus Present',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-Present'; s3='C192AM4-Future';
bins=50; bin=[100:bins:800 800+bins:3*bins:5000];
x=vo.ar.widt; vo.wid=findpdf(x,bin);
x=vm.ar.widt; vm.wid=findpdf(x,bin);
x=wm.ar.widt; wm.wid=findpdf(x,bin);
vname='wid_pdf'; xmin=100; xmax=2000; xy=[xmin xmax 0 0.0025];  xy1=[xmin xmax -20 80]; 
x =vo.wid.binc; y0=vo.wid.pdf; y1=vm.wid.pdf; y2=wm.wid.pdf; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=1; msize=8;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x,y0,'Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x,y1,'Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x,y2,'Color','m','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='width (km)'; yl='probability density (km^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy=(y2-y1)./y1*100; dy=mizsmooth(dy,3);
line(x,dy,'Color','r','MarkerSize',msize,'LineWidth',lw); hold on;
line([xmin xmax],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('Future minus Present',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PRESENT'; s3='C192AM4-WARMING';
bins=1; bin=[2:bins:20 20+bins:4*bins:50]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;
x=vo.ar.leng./vo.ar.widt; vo.rat=findpdf(x,bin);
x=vm.ar.leng./vm.ar.widt; vm.rat=findpdf(x,bin);
x=wm.ar.leng./wm.ar.widt; wm.rat=findpdf(x,bin);
vname='rat_pdf'; xmin=2; xmax=30; xy=[xmin xmax 0 0.17];  xy1=[xmin xmax -20 30]; 
x =vo.rat.binc; y0=vo.rat.pdf; y1=vm.rat.pdf; y2=wm.rat.pdf; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x,y0, 'Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x,y1, 'Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x,y2, 'Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='length-width ratio'; yl='probability density';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy=(y2-y1)./y1*100; dy=mizsmooth(dy',3);
line(x,dy, 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); hold on;
line([xmin xmax],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('WARMING - PRESENT',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PRESENT'; s3='C192AM4-WARMING';
bins=2; bin=[-90 -82 :2*bins:-60 -60+bins:bins:-20 -15 -5 5 15 20:bins:60 60+bins:2*bins:82 90];
x=vo.ar.clat; vo.clat=findpdf(x,bin);
x=vm.ar.clat; vm.clat=findpdf(x,bin);
x=wm.ar.clat; wm.clat=findpdf(x,bin);
vname='clat_pdf'; xmin=-90; xmax=90; xy=[xmin xmax 0 0.025];  xy1=[xmin xmax -10 20];
x =vo.clat.binc; y0=vo.clat.pdf; y1=vm.clat.pdf; y2=wm.clat.pdf; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x,y0, 'Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x,y1, 'Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x,y2, 'Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude'; yl='probability density (latitude^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy=(y2-y1)./y1*100; dy=mizsmooth(dy,3); %id=isnan(dy); dy(id)=dy1(id);
line(x,dy, 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); hold on;
line([xmin xmax],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('WARMING - PRESENT',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PRESENT'; s3='C192AM4-WARMING';
bins=4; bin=[-90 -82 :2*bins:-60 -60+bins:bins:-20 -15 -5 5 15 20:bins:60 60+bins:2*bins:82 90];
x=vo.ar.elat; vo.elat=findpdf(x,bin);
x=vm.ar.elat; vm.elat=findpdf(x,bin);
x=wm.ar.elat; wm.elat=findpdf(x,bin);
vname='elat_pdf'; xmin=-90; xmax=90; xy=[xmin xmax 0 0.025];  xy1=[xmin xmax -10 20];
x =vo.elat.binc; y0=vo.elat.pdf; y1=vm.elat.pdf; y2=wm.elat.pdf; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x,y0, 'Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x,y1, 'Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x,y2, 'Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude'; yl='probability density (latitude^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy=(y2-y1)./y1*100; dy=mizsmooth(dy,3); %id=isnan(dy); dy(id)=dy1(id);
line(x,dy, 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); hold on;
line([xmin xmax],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('WARMING - PRESENT',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PRESENT'; s3='C192AM4-WARMING';
bins=4; bin=[-90 -82 :2*bins:-60 -60+bins:bins:-20 -15 -5 5 15 20:bins:60 60+bins:2*bins:82 90];
x=vo.ar.plat; vo.plat=findpdf(x,bin);
x=vm.ar.plat; vm.plat=findpdf(x,bin);
x=wm.ar.plat; wm.plat=findpdf(x,bin);
vname='plat_pdf'; xmin=-90; xmax=90; xy=[xmin xmax 0 0.025];  xy1=[xmin xmax -10 20];
x =vo.plat.binc; y0=vo.plat.pdf; y1=vm.plat.pdf; y2=wm.plat.pdf; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x,y0, 'Marker','.','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x,y1, 'Marker','.','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x,y2, 'Marker','.','Color','m','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude'; yl='probability density (latitude^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy=(y2-y1)./y1*100; dy=mizsmooth(dy,5); %id=isnan(dy); dy(id)=dy1(id);
line(x,dy, 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); hold on;
line([xmin xmax],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('WARMING - PRESENT',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PRESENT'; s3='C192AM4-WARMING';
bins=4; bin=[-90 :bins: 90];
x=-vo.ar.llat; vo.llat=findpdf(x,bin);
x=vm.ar.llat;  vm.llat=findpdf(x,bin);
x=wm.ar.llat;  wm.llat=findpdf(x,bin);
vname='llat_pdf'; xmin=-90; xmax=90; xy=[xmin xmax 0 0.025];  xy1=[xmin xmax -15 15];
x =vo.llat.binc; y0=vo.llat.pdf; y1=vm.llat.pdf; y2=wm.llat.pdf; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x,y0, 'Marker','*','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x,y1, 'Marker','o','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x,y2, 'Marker','s','Color','m','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude'; yl='probability density (latitude^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy1=(y2-y1)./y1*100; dy=mizsmooth(dy1,5); %id=isnan(dy); dy(id)=dy1(id);
line(x,dy, 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); hold on;
line([xmin xmax],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('WARMING - PRESENT',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PRESENT'; s3='C192AM4-WARMING';
bins=2.5; bin=[-90 :bins: 90]; 
r.x1=190; r.x2=260; r.y1=18;  r.y2=80;  r1=r; %westcoast of North America
r.x1=220; r.x2=260; r.y1=30;  r.y2=50;  r2=r; %westcoast of California
r.x1=260; r.x2=292; r.y1=-60; r.y2=18;  r3=r; %westcoast of South America
figure; contour(vm.lon,vm.lat,vm.lm,'k'); hold on; 
r=r1; rectangle('Position',[r.x1,r.y1,r.x2-r.x1,r.y2-r.y1]);
r=r3; rectangle('Position',[r.x1,r.y1,r.x2-r.x1,r.y2-r.y1]);

y=-vo.ar.llat; x=vo.ar.llon; id=(x>lon1 & x<lon2 & y>lat1 & y<lat2); x=y(id); vo.llat=findpdf(x,bin);
y= vm.ar.llat; x=vm.ar.llon; id=(x>lon1 & x<lon2 & y>lat1 & y<lat2); x=y(id); vm.llat=findpdf(x,bin);
y= wm.ar.llat; x=wm.ar.llon; id=(x>lon1 & x<lon2 & y>lat1 & y<lat2); x=y(id); wm.llat=findpdf(x,bin);
vname='llat_pdf'; xmin=-90; xmax=90; xy=[xmin xmax 0 0.1];  xy1=[xmin xmax -15 15];
x =vo.llat.binc; y0=vo.llat.pdf; y1=vm.llat.pdf; y2=wm.llat.pdf; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); ax1=gca;
line(x,y0, 'Marker','*','Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x,y1, 'Marker','o','Color','b','MarkerSize',msize,'LineWidth',lw); 
line(x,y2, 'Marker','s','Color','m','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,s3,2); axis(xy); set(gca,'FontSize',fsize);
xl='latitude'; yl='probability density (latitude^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy=(y2-y1)./y1*100; line(x,dy, 'Marker','.','Color','r','MarkerSize',msize,'LineWidth',lw); 
line([-90 90],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('WARMING - PRESENT',1); axis(xy1); 
yl='percent change (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




z=v0.f.fq_ar; %z=v0.f.fq_ar_lf;
%x=vi.nino34.ssta_2d; 
%x=squeeze(vi.AO_z700.pc (1,:));
x=-squeeze(vi.PNA_z500.pc(2,:));
lat=v0.f.lat; lon=v0.f.lon; nlat=length(lat); nlon=length(lon);
z=reshape(z,12*65,nlat,nlon); x=reshape(x,12*65,1);
for j=1:nlat
  for i=1:nlon
    [r0,p0]=corrcoef(x,z(:,j,i)); r(j,i)=r0(1,2); p(j,i)=p0(1,2);
  end
end
figure; 
pcolor(lon,lat,r); hold on; caxis([-0.3 0.3]);shading flat; colorbar; colormap(jet);
contour(v0.lon,v0.lat,v0.lm0,1,'k-'); 

figure; 
pcolor(lon,lat,p); hold on; caxis([-0.3 0.3]);shading flat; colorbar; colormap(jet);
contour(v0.lon,v0.lat,v0.lm0,1,'k-'); 

figure; 
pcolor(lon,lat,squeeze(mean(z,1))); hold on; caxis([0 1.5]);
shading flat; colorbar; colormap(jet);
contour(v0.lon,v0.lat,v0.lm0,1,'w-'); 


x=vi; lat=x.lat; lon=x.lon; lm=x.lm; i=2;
z=squeeze(x.PNA_z500.eof_maps(:,:,i));
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




vo.fq=get_ar_fq(vo,1);

vo.num.gg=length(vo.ar.leng)/vo.nyr;
v1.num.gg=length(v1.ar.leng)/v1.nyr;
w1.num.gg=length(w1.ar.leng)/w1.nyr;
g1.num.gg=length(g1.ar.leng)/g1.nyr;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim (Guan)';     s2='C192AM4 (Guan)';
s3='ERA-Interim (Mundhenk)'; s4='C192AM4 (Mundhenk)';
bins=200; bin=[0 2000:bins:15000 50000]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;
x=vo.ar.leng; x=x(1:14000); n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; len.pdf=n;len.med=median(x);vo.len=len;
x=v1.ar.leng; x=x(1:14000); n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; len.pdf=n;len.med=median(x);v1.len=len;
x=v0.ar.leng; x=x(1:14000); n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; len.pdf=n;len.med=median(x);v0.len=len;
x=va.ar.leng; x=x(1:14000); n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; len.pdf=n;len.med=median(x);va.len=len;
vo.len.binc=binc;
vname='len_pdf'; xy=[2000 15000 0 0.00042]; opt=1;
x=vo.len.binc(2:end); 
yo=vo.len.pdf(2:end); y1=v1.len.pdf(2:end);
y2=v0.len.pdf(2:end); y3=va.len.pdf(2:end);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
plot(x,yo,'k-*'); hold on;
plot(x,y1,'b-o'); hold on;
plot(x,y2,'r-s'); hold on; %figure; plot(x,y2-y1,'r'); hold on; plot(x,y3-y1,'g');
plot(x,y3,'g-s'); hold on; 
legend(s1,s2,s3,s4,opt); axis(xy); 
xl='length (km)'; yl='probability density (km^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bins=20; bin=[0 100:bins:2000 5000]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;
x=vo.ar.widt; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; wid.pdf=n;wid.med=median(x);vo.wid=wid;
x=v1.ar.widt; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; wid.pdf=n;wid.med=median(x);v1.wid=wid;
%x=v0.ar.widt; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; wid.pdf=n;wid.med=median(x);v0.wid=wid;
%x=va.ar.widt; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; wid.pdf=n;wid.med=median(x);va.wid=wid;
vo.wid.binc=binc;
vname='wid_pdf'; xy=[100 1500 0 0.0025]; opt=1;
x =vo.wid.binc(2:end); 
yo=vo.wid.pdf(2:end); y1=v1.wid.pdf(2:end);  
%y2=v0.wid.pdf(2:end); y3=va.wid.pdf(2:end);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
plot(x,yo,'k-*'); hold on;
plot(x,y1,'b-o'); hold on;
%plot(x,y2,'r-s'); hold on; %figure; plot(x,y2-y1,'r'); hold on; plot(x,y3-y1,'g');
%plot(x,y3,'g-s'); hold on; 
legend(s1,s2,s3,s4,opt); axis(xy); 

xl='width (km)'; yl='probability density (km^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bins=1; bin=[0 1:bins:30 50]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;
x=vo.ar.leng./vo.ar.widt; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; rat.pdf=n;rat.med=median(x);vo.rat=rat;
x=v1.ar.leng./v1.ar.widt; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; rat.pdf=n;rat.med=median(x);v1.rat=rat;
x=v0.ar.leng./v0.ar.widt; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; rat.pdf=n;rat.med=median(x);v0.rat=rat;
x=va.ar.leng./va.ar.widt; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; rat.pdf=n;rat.med=median(x);va.rat=rat;
vo.rat.binc=binc;
vname='rat_pdf'; xy=[1 30 0 0.3]; opt=1;
x=vo.rat.binc(2:end); 
yo=vo.rat.pdf(2:end); y1=v1.rat.pdf(2:end);
y2=v0.rat.pdf(2:end); y3=va.rat.pdf(2:end);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
plot(x,yo,'b-*'); hold on;
plot(x,y1,'r-s'); hold on;
plot(x,y2,'r-s'); hold on;
plot(x,y3,'g-s'); hold on; 
legend(s1,s2,s3,s4,opt); axis(xy); 
legend('ERA-Interim','C192AM4',opt); axis(xy);
xl='length/width ratio'; yl='probability density (km^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bins=0.01; bin=[0 0.005:bins:1.005]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;dbin=1;
x=vo.ar.coh; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; coh.pdf=n;coh.med=median(x);vo.coh=coh;
x=v1.ar.coh; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; coh.pdf=n;coh.med=median(x);v1.coh=coh;
vo.coh.binc=binc;
vname='coh_pdf'; xy=[0.5 1.05 0 0.35]; opt=2;
x=vo.coh.binc(2:end); yo=vo.coh.pdf(2:end); y1=v1.coh.pdf(2:end);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
plot(x,yo,'b-*'); hold on;
plot(x,y1,'r-s'); hold on;
legend('ERA-Interim','C192AM4',opt); axis(xy);
xl='coherence of IVT direction'; yl='probability density (km^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bins=2; bin=[-90 :bins:90]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
x=vo.ar.clat; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; clat.pdf=n;clat.med=median(x);vo.clat=clat;
x=v1.ar.clat; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; clat.pdf=n;clat.med=median(x);v1.clat=clat;
x=w1.ar.clat; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; clat.pdf=n;clat.med=median(x);w1.clat=clat;
vo.clat.binc=binc;
vname='clat_pdf'; xy=[-90 90 0 0.02]; opt=2;
x =vo.clat.binc(2:end); yo=vo.clat.pdf(2:end); 
y1=v1.clat.pdf(2:end);  y2=w1.clat.pdf(2:end);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
plot(x,yo,'k-*'); hold on;
plot(x,y1,'b-o'); hold on;
plot(x,y2,'r-s'); hold on;
legend('ERA-Interim','C192AM4',opt); axis(xy);
xl='mean latitude'; yl='probability density (km^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bins=3; bin=[-90 :bins:90]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
x=vo.ar.elat; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; elat.pdf=n;elat.med=median(x);vo.elat=elat;
x=v1.ar.elat; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; elat.pdf=n;elat.med=median(x);v1.elat=elat;
vo.elat.binc=binc;
vname='elat_pdf'; xy=[-90 90 0 0.02]; opt=2;
x=vo.elat.binc(2:end); yo=vo.elat.pdf(2:end); y1=v1.elat.pdf(2:end);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
plot(x,yo,'b-*'); hold on;
plot(x,y1,'r-s'); hold on;
legend('ERA-Interim','C192AM4',opt); axis(xy);
xl='lowest latitude'; yl='probability density (km^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bins=3; bin=[-90 :bins:90]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
x=vo.ar.plat; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; plat.pdf=n;plat.med=median(x);vo.plat=plat;
x=v1.ar.plat; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; plat.pdf=n;plat.med=median(x);v1.plat=plat;
vo.plat.binc=binc;
vname='plat_pdf'; xy=[-90 90 0 0.02]; opt=2;
x=vo.plat.binc(2:end); yo=vo.plat.pdf(2:end); y1=v1.plat.pdf(2:end);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
plot(x,yo,'b-*'); hold on;
plot(x,y1,'r-s'); hold on;
legend('ERA-Interim','C192AM4',opt); axis(xy);
xl='highest latitude'; yl='probability density (km^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);  
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
saveas(gcf,'test.eps')

printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bins=10; bin=[0 :bins:1200]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
x=sqrt(vo.ar.ivtz.^2+vo.ar.ivtm.^2); n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; ivt.pdf=n;ivt.med=median(x);vo.ivt=ivt;
x=sqrt(v1.ar.ivtz.^2+v1.ar.ivtm.^2); n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; ivt.pdf=n;ivt.med=median(x);v1.ivt=ivt;
vo.ivt.binc=binc;
vname='ivt_pdf'; xy=[0 1200 0 0.003]; opt=2;
x=vo.ivt.binc(2:end); yo=vo.ivt.pdf(2:end); y1=v1.ivt.pdf(2:end);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
plot(x,yo,'b-*'); hold on;
plot(x,y1,'r-s'); hold on;
legend('ERA-Interim','C192AM4',opt); axis(xy);
xl='magnitude of mean IVT (kg/m/s)'; yl='probability density (ms/kg)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); %saveas(gcf,'test','epsc');print(gcf, 'depsc', 'test')

visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bins=1; bin=[0 :bins:360]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
x=vo.ar.ivtd; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; ivt.pdf=n;ivt.med=median(x);vo.ivt=ivt;
x=v1.ar.ivtd; n=histc(x,bin);n=n(1:end-1); n=n/sum(n)./dbin; ivt.pdf=n;ivt.med=median(x);v1.ivt=ivt;
vo.ivt.binc=binc;
vname='ivt_pdf'; xy=[0 360 0 0.015]; opt=2;
x=vo.ivt.binc(2:end); yo=vo.ivt.pdf(2:end); y1=v1.ivt.pdf(2:end);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
plot(x,yo,'b-*'); hold on;
plot(x,y1,'r-s'); hold on;
legend('ERA-Interim','C192AM4',opt); axis(xy);
xl='magnitude of mean IVT (kg/m/s)'; yl='probability density (km^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 


printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








%frequency of occurrence for tracks and genesis==================
%below is for 5x4 degree resolution 8-point average [-50 50]
%latc=[-89:2:89]; lonc=[1:2:359];
latc=[-88:4:88]; lonc=[2:4:358];
latb=(latc(1:end-1)+latc(2:end))/2; dlatb=(latb(2)-latb(1));
latb(2:end+1)=latb; latb(1)=latb(2)-dlatb; latb(end+1)=latb(end)+dlatb;
lonb=(lonc(1:end-1)+lonc(2:end))/2; dlonb=(lonb(2)-lonb(1));
lonb(2:end+1)=lonb; lonb(1)=lonb(2)-dlonb; lonb(end+1)=lonb(end)+dlonb;

v.latfq=latc; v.lonfq=lonc;
nlat=length(latc); nlon=length(lonc);

fq_ar(1:12,1:v.nyr,1:nlat,1:nlon)=0;
for t=1:v.nyr
  artmp=v.yr(t).ar;
  for n=1:length(artmp)
    ar=artmp(n); id_in=0; disp(n)
    for j=1:nlat
      for i=1:nlon
	id_in=0;
	if (ar.clon>lonb(i) & ar.clon<=lonb(i+1) & ...
	    ar.clat>latb(j) & ar.clat<=latb(j+1))
	  id_in=1;
	  for m=1:12
	    if (ar.mmm==m)
	      fq_ar(m,t,j,i)=fq_ar(m,t,j,i)+1; break;
	    end
	  end
	end
      end
    end
  end
end

fq_ar_clm=squeeze(mean(fq_ar,2));
fq_ar_ann=squeeze(sum(fq_ar_clm,1));

v.

figure; 
contourf(v.lonfq,v.latfq,v.fq_ar_ann,20); caxis([0 15]);
shading flat; colorbar; hold on;
contour(v.lon,v.lat,v.lm0,'k');


return
%%%%%%%%%%%%%%%%%%%%%
