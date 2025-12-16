function [s]=getltrend(CM4,t1,t2)
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa0=s.aa; 
nlon=length(lon); nlat=length(lat); nt=60; 
for m=1:12; aa(m,:,:)=aa0; end;

t2=145; t1=t2-nt+1; %yr1=1870; yr2=2014;
a=CM4.h0.sfc.tsurf.all(t1:t2,:,:,:);
a=reshape(a,nt,12*nlat*nlon); a=trend(a); a=reshape(a,12,nlat,nlon)*10;
b.mon=a; b.mon0=mean(mean(a.*aa,3),2);
b.ann=squeeze(mean(a,1)); b.ann0=mean(mean(b.ann.*aa0)); 
CM4.h0.sfc.tsurf.ltrend_1980_2014=b;

t2=165; t1=t2-nt+1; %yr1=1850; yr2=2014;

a=CM4.h1.sfc.tsurf.all(t1:t2,:,:,:);
a=reshape(a,nt,12*nlat*nlon); a=trend(a); a=reshape(a,12,nlat,nlon)*10;
b.mon=a; b.mon0=mean(mean(a.*aa,3),2);
b.ann=squeeze(mean(a,1)); b.ann0=mean(mean(b.ann.*aa0)); 
CM4.h1.sfc.tsurf.ltrend_1980_2014=b;

a=CM4.h2.sfc.tsurf.all(t1:t2,:,:,:);
a=reshape(a,nt,12*nlat*nlon); a=trend(a); a=reshape(a,12,nlat,nlon)*10;
b.mon=a; b.mon0=mean(mean(a.*aa,3),2);
b.ann=squeeze(mean(a,1)); b.ann0=mean(mean(b.ann.*aa0)); 
CM4.h2.sfc.tsurf.ltrend_1980_2014=b;

a=CM4.h3.sfc.tsurf.all(t1:t2,:,:,:);
a=reshape(a,nt,12*nlat*nlon); a=trend(a); a=reshape(a,12,nlat,nlon)*10;
b.mon=a; b.mon0=mean(mean(a.*aa,3),2);
b.ann=squeeze(mean(a,1)); b.ann0=mean(mean(b.ann.*aa0)); 
CM4.h3.sfc.tsurf.ltrend_1980_2014=b;

nt=85; t2=85; t1=t2-nt+1; %yr1=2015; yr2=2099;

a=CM4.s1.sfc.tsurf.all(t1:t2,:,:,:);
a=reshape(a,nt,12*nlat*nlon); a=trend(a); a=reshape(a,12,nlat,nlon)*10;
b.mon=a; b.mon0=mean(mean(a.*aa,3),2);
b.ann=squeeze(mean(a,1)); b.ann0=mean(mean(b.ann.*aa0)); 
CM4.s1.sfc.tsurf.ltrend_2015_2099=b;

a=CM4.s2.sfc.tsurf.all(t1:t2,:,:,:);
a=reshape(a,nt,12*nlat*nlon); a=trend(a); a=reshape(a,12,nlat,nlon)*10;
b.mon=a; b.mon0=mean(mean(a.*aa,3),2);
b.ann=squeeze(mean(a,1)); b.ann0=mean(mean(b.ann.*aa0)); 
CM4.s2.sfc.tsurf.ltrend_2015_2099=b;

pms=[ 0, 0, 2300, 700]*0.7; fsize=10; row=2; col=3;
handle = figure('Position', pms,'visible','on'); colormap(jet(256));
subplot(row,col,1); a=CM4.h0.sfc.tsurf.ltrend_1980_2014; 
pcolor(lon,lat,a.ann); shading flat; colorbar; caxis([-0.8 0.8]); hold on;
contour(lon,lat,lm,1,'k'); colormap(bluewhitered(128));
s=sprintf('(a) CM4.0-AMIP (%4.2fK/decade)',a.ann0); title(s,'FontSize',fsize);

subplot(row,col,2); a=CM4.h1.sfc.tsurf.ltrend_1980_2014; 
pcolor(lon,lat,a.ann); shading flat; colorbar; caxis([-0.8 0.8]); hold on;
contour(lon,lat,lm,1,'k'); colormap(bluewhitered(128));
s=sprintf('(b) CM4.0-H1 (%4.2fK/decade)',a.ann0); title(s,'FontSize',fsize);

subplot(row,col,3); a=CM4.h2.sfc.tsurf.ltrend_1980_2014; 
pcolor(lon,lat,a.ann); shading flat; colorbar; caxis([-0.8 0.8]); hold on;
contour(lon,lat,lm,1,'k'); colormap(bluewhitered(128));
s=sprintf('(c) CM4.0-H2 (%4.2fK/decade)',a.ann0); title(s,'FontSize',fsize);

subplot(row,col,4); a=CM4.h3.sfc.tsurf.ltrend_1980_2014; 
pcolor(lon,lat,a.ann); shading flat; colorbar; caxis([-0.8 0.8]); hold on;
contour(lon,lat,lm,1,'k'); colormap(bluewhitered(128));
s=sprintf('(d) CM4.0-H3 (%4.2fK/decade)',a.ann0); title(s,'FontSize',fsize);

subplot(row,col,5); a=CM4.s1.sfc.tsurf.ltrend_2015_2099; 
pcolor(lon,lat,a.ann); shading flat; colorbar; caxis([-0.8 0.8]); hold on;
contour(lon,lat,lm,1,'k'); colormap(bluewhitered(128));
s=sprintf('(e) CM4.0-SSP245 (%4.2fK/decade)',a.ann0); title(s,'FontSize',fsize);

subplot(row,col,6); a=CM4.s2.sfc.tsurf.ltrend_2015_2099; 
pcolor(lon,lat,a.ann); shading flat; colorbar; caxis([-0.8 0.8]); hold on;
contour(lon,lat,lm,1,'k'); colormap(bluewhitered(128));
s=sprintf('(f) CM4.0-SSP585 (%4.2fK/decade)',a.ann0); title(s,'FontSize',fsize);

expn='cm4'; vname='tsurf_map_60'; visfig='off'; figpath='./fig_TC/';
printit(visfig,figpath,expn,vname);

