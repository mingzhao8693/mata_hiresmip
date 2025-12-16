function v=readmjo(tpath,expn)
fn1='mod.mjo.region_mavg.nc';
fname=strcat(tpath,expn,'/atmos_data/',fn1);
f=netcdf(fname,'nowrite'); 
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
v.lon=f{'lon'}(:);  v.time=f{'time'}(:); 
v.olr   =f{'olr'}   (:,:);
v.precip=f{'precip'}(:,:);
v.u250  =f{'u250'}  (:,:);
v.u850  =f{'u850'}  (:,:); 
close(f)
fn1='20091101.atmos_month.nc';
fname=strcat(tpath,expn,'/atmos_data/',fn1); fname
f=netcdf(fname,'nowrite'); 
v.lon_g=f{'lon'}(:);  v.lat_g=f{'lat'}(:); 
v.pcp_g=f{'precip'}(:,:);
return

%obs-----------------------------
tpath='/archive/Ming.Zhao/ncrc/hiram_siena_c2/siena/'
expn='c180l47_hv1_nudge_20091101'
fname=strcat(tpath,expn,'/atmos_data/obs.olr.region_mavg.nc');
f=netcdf(fname,'nowrite'); 
v0.lon=f{'lon'}(:); v0.time=f{'time'}(:); v0.olr=f{'olr'}(:,:);
v0.time=(v0.time-v0.time(1))/24;
%3h
expn='c180l47_hv1_nudge_20091101'
v1=readmjo(tpath,expn);
%12h
expn='c180l47_hv1_nudge_20091101_12h'
v2=readmjo(tpath,expn);
%1d
expn='c180l47_hv1_nudge_20091101_24h'
v3=readmjo(tpath,expn);
%2d
expn='c180l47_hv1_nudge_20091101_2d'
v4=readmjo(tpath,expn);
%4d
expn='c180l47_hv1_nudge_20091101_4d'
v5=readmjo(tpath,expn);
%4d upper level wind
expn='c180l47_hv1_nudge_20091101_4d_15l'
v6=readmjo(tpath,expn);

pms=[ 0, 0, 1500, 500]; warning off all; fsize=16;
handle = figure('Position', pms,'visible','on'); 
row=2; col=3; 
subplot(row,col,1); cmin=0; cmax=20;
contourf(v1.lon_g,v1.lat_g,v1.pcp_g*86400); shading flat; colorbar; 
title ('\tau=3hour'); axis([0 180 -15 15]); caxis([cmin cmax]);
subplot(row,col,2); cmin=0; cmax=20;
contourf(v1.lon_g,v1.lat_g,v2.pcp_g*86400); shading flat; colorbar; 
title ('\tau=12hour');; axis([0 180 -15 15]); caxis([cmin cmax]);
subplot(row,col,3); cmin=0; cmax=20;
contourf(v1.lon_g,v1.lat_g,v3.pcp_g*86400); shading flat; colorbar; 
title ('\tau=1day'); axis([0 180 -15 15]); caxis([cmin cmax]);
subplot(row,col,4); cmin=0; cmax=20;
contourf(v1.lon_g,v1.lat_g,v4.pcp_g*86400); shading flat; colorbar; 
title ('\tau=2day'); axis([0 180 -15 15]); caxis([cmin cmax]);
subplot(row,col,5); cmin=0; cmax=20;
contourf(v1.lon_g,v1.lat_g,v5.pcp_g*86400); shading flat; colorbar; 
title ('\tau=4day'); axis([0 180 -15 15]); caxis([cmin cmax]);
subplot(row,col,6); cmin=0; cmax=20;
contourf(v1.lon_g,v1.lat_g,v6.pcp_g*86400); shading flat; colorbar; 
title ('\tau=4day, upper wind only'); axis([0 180 -15 15]); caxis([cmin cmax]);
visfig='off'; figpath='./figures/'; expn='mjo'; vname='precip_avg';
printit(visfig,figpath,expn,vname);


pms=[ 0, 0, 1500, 1500]; warning off all; fsize=16;
handle = figure('Position', pms,'visible','on'); 
row=7; col=3; 
subplot(row,col,1); cmin=200; cmax=280;
pcolor(v0.lon,v0.time,v0.olr); shading flat; colorbar; 
title ('OLR'); caxis([cmin cmax]);
subplot(row,col,4); 
pcolor(v1.lon,v1.time,v1.olr); shading flat; colorbar; 
caxis([cmin cmax]);
subplot(row,col,7); 
pcolor(v2.lon,v2.time,v2.olr); shading flat; colorbar; 
caxis([cmin cmax]);
subplot(row,col,10); 
pcolor(v3.lon,v3.time,v3.olr); shading flat; colorbar; 
caxis([cmin cmax]);
subplot(row,col,13); 
pcolor(v4.lon,v4.time,v4.olr); shading flat; colorbar; 
caxis([cmin cmax]);
subplot(row,col,16); 
pcolor(v5.lon,v5.time,v5.olr); shading flat; colorbar; 
caxis([cmin cmax]);
subplot(row,col,19); 
pcolor(v6.lon,v6.time,v6.olr); shading flat; colorbar; 
caxis([cmin cmax]);

subplot(row,col,2); cmin=-10; cmax=10;
%pcolor(v0.lon,v0.time,v0.u250); shading flat; colorbar; 
title('U200')
subplot(row,col,5); 
pcolor(v1.lon,v1.time,v1.u250); shading flat; colorbar; 
caxis([cmin cmax]);
subplot(row,col,8); 
pcolor(v2.lon,v2.time,v2.u250); shading flat; colorbar; 
caxis([cmin cmax]);
subplot(row,col,11); 
pcolor(v3.lon,v3.time,v3.u250); shading flat; colorbar; 
caxis([cmin cmax]);
subplot(row,col,14); 
pcolor(v4.lon,v4.time,v4.u250); shading flat; colorbar; 
caxis([cmin cmax]);
subplot(row,col,17); 
pcolor(v5.lon,v5.time,v5.u250); shading flat; colorbar; 
caxis([cmin cmax]);
subplot(row,col,20); 
pcolor(v6.lon,v6.time,v6.u250); shading flat; colorbar; 
caxis([cmin cmax]);

subplot(row,col,3); cmin=-8; cmax=8;
%pcolor(v0.lon,v0.time,v0.u850); shading flat; colorbar; 
title('U850')
subplot(row,col,6); 
pcolor(v1.lon,v1.time,v1.u850); shading flat; colorbar; 
caxis([cmin cmax]);
subplot(row,col,9); 
pcolor(v2.lon,v2.time,v2.u850); shading flat; colorbar; 
caxis([cmin cmax]);
subplot(row,col,12); 
pcolor(v3.lon,v3.time,v3.u850); shading flat; colorbar; 
caxis([cmin cmax]);
subplot(row,col,15); 
pcolor(v4.lon,v4.time,v4.u850); shading flat; colorbar; 
caxis([cmin cmax]);
subplot(row,col,18); 
pcolor(v5.lon,v5.time,v5.u850); shading flat; colorbar; 
caxis([cmin cmax]);
subplot(row,col,21); 
pcolor(v6.lon,v6.time,v6.u850); shading flat; colorbar; 
caxis([cmin cmax]);
visfig='off'; figpath='./figures/'; expn='mjo'; vname='hm';
printit(visfig,figpath,expn,vname);
