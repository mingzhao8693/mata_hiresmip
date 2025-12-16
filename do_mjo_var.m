[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath ='/archive/Ming.Zhao/backup/precip_obs/GPCP/';
expn='gpcp_V1DD_V1p2_daily_19961001_20151031.nc';
fname=strcat(tpath,expn); latname='LAT'; lonname='LON'; 
latlon_trop=[0 360 -30 30]; ts=93; te=6662; varn='prcp';
s=getaregion(fname,latlon_trop,latname,lonname,ts,te,varn)
s.nday=365; s.nyr=s.nt/s.nday;
s.varb=reshape(s.varb,s.nday,s.nyr,s.nlat,s.nlon);
o.precip=varana(s.varb,s); s.varb=0;

tpath ='/archive/Ming.Zhao/awg/warsaw/';
latlon=[0 360 -30 30]; region='tropics';
yr1='0002'; yr2='0031'; nyr=30;
expn='c96L33_am4p0_2010climo'; v=mjo_var(tpath,expn,yr1,yr2,nyr,latlon,region)
yr1='0002'; yr2='0011'; nyr=10;
expn='c96L33_am4p0_2010climo_rkm_dp1'; v=mjo_var(tpath,expn,yr1,yr2,nyr,latlon,region)
expn='c96L33_am4p0_2010climo_rkm_dp2'; v=mjo_var(tpath,expn,yr1,yr2,nyr,latlon,region)
expn='c96L33_am4p0_2010climo_rkm_dp3'; v=mjo_var(tpath,expn,yr1,yr2,nyr,latlon,region)
expn='c96L33_am4p0_2010climo_rkm_dp4'; v=mjo_var(tpath,expn,yr1,yr2,nyr,latlon,region)
expn='c96L33_am4p0_2010climo_cfrac0';  v=mjo_var(tpath,expn,yr1,yr2,nyr,latlon,region)
expn='c96L33_am4p0_2010climo_cfrac1';  v=mjo_var(tpath,expn,yr1,yr2,nyr,latlon,region)
expn='c96L33_am4p0_2010climo_cfrac2';  v=mjo_var(tpath,expn,yr1,yr2,nyr,latlon,region)
expn='c96L33_am4p0_2010climo_cfrac3';  v=mjo_var(tpath,expn,yr1,yr2,nyr,latlon,region)


tpath ='/archive/Ming.Zhao/awg/verona/';
latlon=[0 360 -30 30]; region='tropics';
expn='AM4.0'; yr1='1980'; yr2='2014'; nyr=35;
v=mjo_var(tpath,expn,yr1,yr2,nyr,latlon,region)
expn='AM3'; yr1='1980'; yr2='2007'; nyr=28;
v=mjo_var(tpath,expn,yr1,yr2,nyr,latlon,region)
expn='c48l24_am2p14_C0'; yr1='1981'; yr2='1990'; nyr=10;
v=mjo_var(tpath,expn,yr1,yr2,nyr,latlon,region)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw/'; 
fext='_tropics_varana.mat';
expn='c96L33_am4p0_2010climo'; fn=strcat(tpath,expn,'/',expn,fext); load(fn);am4.c0=v;
expn='c96L33_am4p0_2010climo_rkm_dp3'; fn=strcat(tpath,expn,'/',expn,fext); load(fn);am4.c1=v;
expn='c96L33_am4p0_2010climo_rkm_dp1'; fn=strcat(tpath,expn,'/',expn,fext); load(fn);am4.c2=v;
expn='c96L33_am4p0_2010climo_rkm_dp2'; fn=strcat(tpath,expn,'/',expn,fext); load(fn);am4.c3=v;
expn='c96L33_am4p0_2010climo_rkm_dp4'; fn=strcat(tpath,expn,'/',expn,fext); load(fn);am4.c4=v;
expn='c96L33_am4p0_2010climo_cfrac0';  fn=strcat(tpath,expn,'/',expn,fext); load(fn);am4.c5=v;
expn='c96L33_am4p0_2010climo_cfrac1';  fn=strcat(tpath,expn,'/',expn,fext); load(fn);am4.c6=v;
expn='c96L33_am4p0_2010climo_cfrac2';  fn=strcat(tpath,expn,'/',expn,fext); load(fn);am4.c7=v;
expn='c96L33_am4p0_2010climo_cfrac3';  fn=strcat(tpath,expn,'/',expn,fext); load(fn);am4.c8=v;

expn='AM4.0'; fn=strcat(tpath,expn,'/',expn,'_tropics_varana.mat'); load(fn);am4=v;
expn='AM3'; fn=strcat(tpath,expn,'/',expn,'_tropics_varana.mat'); load(fn);am3=v;
expn='c48l24_am2p14_C0'; fn=strcat(tpath,expn,'/',expn,'_tropics_varana.mat'); load(fn);am2=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Intra-seasonal variance of precip Fig in AM4.0 paper
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='precip_all_iso'; vname=strcat('rkmdp_',varn);
v=am4.c0; lat=v.lat; lon=v.lon; lm=v.lm0;
z0=am4.c0.precip.all.var_iso; z0=z0.^2;
z1=am4.c1.precip.all.var_iso; z1=z1.^2; 
z2=am4.c2.precip.all.var_iso; z2=z2.^2; 
z3=am4.c3.precip.all.var_iso; z3=z3.^2; 
z4=am4.c4.precip.all.var_iso; z4=z4.^2; 
z1=z1-z0; z2=z2-z0; z3=z3-z0; z4=z4-z0;
z1=z1./z0*100;z2=z2./z0;z3=z3./z0;z4=z4./z0;
wsize_x=5; wsize_y=5;
z1=smoothdata(z1,wsize_x,wsize_y);
z2=smoothdata(z2,wsize_x,wsize_y);
z3=smoothdata(z3,wsize_x,wsize_y);
z4=smoothdata(z4,wsize_x,wsize_y);
pms=[ 0, 0, 1000, 400]*1.2; fsize=16; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-50; cmax=50; vbin=[cmin:1:cmax];
subplot(row,col,1);  xy=[0 360 -30 30]; %z1(z1<-10)=-10;
contourf(lon,lat,z1,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]); 
contour(lon,lat,lm,0.5,'k'); 
axis(xy); s=sprintf('(a) AM4.0-C1 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
contourf(lon,lat,z2,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]); 
contour(lon,lat,lm,0.5,'k'); 
axis(xy); s=sprintf('(b) AM4.0-C2 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,3); 
contourf(lon,lat,z3,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,0.5,'k'); 
axis(xy); s=sprintf('(c) AM4.0-C3 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
contourf(lon,lat,z4,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]); 
contour(lon,lat,lm,0.5,'k'); 
axis(xy); s=sprintf('(d) AM4.0-C4 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%intra-seasonal variance of precip Fig in AM4.0 paper
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='precip_all_iso'; vname=strcat('cfrac_',varn);
v=am4.c0; lat=v.lat; lon=v.lon; lm=v.lm0;
z0=am4.c0.precip.all.var_iso; z0=z0.^2;
z1=am4.c5.precip.all.var_iso; z1=z1.^2; 
z2=am4.c6.precip.all.var_iso; z2=z2.^2; 
z3=am4.c7.precip.all.var_iso; z3=z3.^2; 
z4=am4.c8.precip.all.var_iso; z4=z4.^2; 
z1=z1-z0; z2=z2-z0; z3=z3-z0; z4=z4-z0;
wsize_x=5; wsize_y=5;
z1=smoothdata(z1,wsize_x,wsize_y);
z2=smoothdata(z2,wsize_x,wsize_y);
z3=smoothdata(z3,wsize_x,wsize_y);
z4=smoothdata(z4,wsize_x,wsize_y);
%figure; plot(z1(1,:),'-r*'); hold on; plot(z2(1,:),'-bs');
pms=[ 0, 0, 1000, 400]*1.2; fsize=16; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-10; cmax=10; vbin=[cmin:1:cmax];
subplot(row,col,1); xy=[0 360 -30 30]; %z1(z1<-10)=-10;
contourf(lon,lat,z1,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]); 
contour(lon,lat,lm,0.5,'k'); 
axis(xy); s=sprintf('(a) AM4.0-C5 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
contourf(lon,lat,z2,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]); 
contour(lon,lat,lm,0.5,'k'); 
axis(xy); s=sprintf('(b) AM4.0-C6 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,3);
contourf(lon,lat,z3,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,0.5,'k'); 
axis(xy); s=sprintf('(c) AM4.0-C7 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4);
contourf(lon,lat,z4,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]); 
contour(lon,lat,lm,0.5,'k'); 
axis(xy); s=sprintf('(d) AM4.0-C8 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);

