%do mjo_ana%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath ='/archive/Ming.Zhao/awg/warsaw/';
latlon=[38.75 181.25 -21.5 21.5]; region='iowpac';
latlon=[0     360    -10   10];   region='gtrop';
expn='c96L33_am4p0_m1';yr1='1980'; yr2='2014'; nyr=34;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)
expn='c96L33_am4p0_m2';yr1='1980'; yr2='2014'; nyr=34;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

expn='c96L33_am4p0_initCond2';yr1='1980'; yr2='2014'; nyr=34;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)
expn='c96L33_am4p0';yr1='1980'; yr2='2014'; nyr=34;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)
expn='AM4p0';yr1='1980'; yr2='2014'; nyr=34;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)
expn='CM4p0_2010';yr1='0041'; yr2='0070'; nyr=30;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

expn='c96L33_am4g12r22';yr1='1980'; yr2='2014'; nyr=35;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)
expn='AM4_test0';yr1='1980'; yr2='2014'; nyr=35;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)
expn='CM4g12r20';yr1='0001'; yr2='0100'; nyr=100;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

expn='AM4.0';yr1='1981'; yr2='2014'; nyr=34;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)
expn='CM4_hist';yr1='1981'; yr2='2014'; nyr=34;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)
expn='AM3';yr1='1981'; yr2='2007'; nyr=27;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)
expn='AM2.1';yr1='1981'; yr2='2007'; nyr=27;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot MJO eastward proporgation%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_mjo/mjo_lagreg_obs.mat'); load(fn); o=v;
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath ='/archive/Ming.Zhao/awg/warsaw/'; region='gtrop';
expn='AM4p0';                 fn=strcat(tpath,expn,'/',expn,'_',region,'_mjo.mat'); load(fn);am4a=v;
expn='c96L33_am4p0';          fn=strcat(tpath,expn,'/',expn,'_',region,'_mjo.mat'); load(fn);am4b=v;
expn='c96L33_am4p0_m1';       fn=strcat(tpath,expn,'/',expn,'_',region,'_mjo.mat'); load(fn);am4c=v;
expn='c96L33_am4p0_m2';       fn=strcat(tpath,expn,'/',expn,'_',region,'_mjo.mat'); load(fn);am4d=v;
expn='c96L33_am4p0_longamip'; fn=strcat(tpath,expn,'/',expn,'_',region,'_mjo.mat'); load(fn);am4e=v;
expn='CM4p0_2010';            fn=strcat(tpath,expn,'/',expn,'_',region,'_mjo.mat'); load(fn);cm4a=v;
expn='CM4_hist';              fn=strcat(tpath,expn,'/',expn,'_',region,'_mjo.mat'); load(fn);cm4b=v;
%expn='AM4.0';                 fn=strcat(tpath,expn,'/',expn,'_',region,'_mjo.mat'); load(fn);am4x=v;
expn='AM3';                   fn=strcat(tpath,expn,'/',expn,'_',region,'_mjo.mat'); load(fn);am3=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 1a%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp'; expn='AM4p0_lgc'; 
v=am4a.pcp; x=v.lon; y=v.lgd; xy=[0 360 -25 25];
xl='longitude'; yl='lagged time (day)';
uu=5*86400/111000; xx=20+uu*(y+20);%speed=longitude/day
pms=[ 0, 0, 500, 800]; warning off all
handle = figure('Position', pms,'visible','on');
row=3; col=1; lw=1; fsize=12;
nn=32; cmap=jet(nn); cmap(nn/2:nn/2+1,:)=1; colormap(cmap);
subplot(row,col,1); v=am4c.pcp; s='(a) precipitation (AM4.0 AMIP)';
%z=v.lagslop.iso_avg'; zbin=[-2.4:0.05:2.4]; cminmax=[min(zbin) max(zbin)];
z=v.lagcorr.iso_avg'; zbin=[-0.6:0.05:0.6]; cminmax=[min(zbin) max(zbin)];
contourf(x,y,z,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([80 80],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
subplot(row,col,2); v=cm4a.pcp; s='(b) precipitation (AM4.0 Coupled)';
%z=v.lagslop.iso_avg'; zbin=[-2.4:0.05:2.4]; cminmax=[min(zbin) max(zbin)];
z=v.lagcorr.iso_avg'; zbin=[-0.6:0.05:0.6]; cminmax=[min(zbin) max(zbin)];
contourf(x,y,z,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([80 80],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
subplot(row,col,3); v=o.pcp.lga; xo=v.lon; yo=v.lgd;
%z=v.lagslop.iso_avg'; zbin=[-2.4:0.05:2.4]; cminmax=[min(zbin) max(zbin)];
zo=v.lagcorr.iso_avg'; zbin=[-0.6:0.05:0.6]; cminmax=[min(zbin) max(zbin)];
contourf(xo,yo,zo,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([80 80],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title('(c) precipitation (GPCP)','FontSize',fsize);
ylabel(yl,'FontSize',fsize); xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='olr'; expn='AM4p0_lgc'; 
v=am4a.olr; x=v.lon; y=v.lgd; xy=[0 360 -25 25];
xl='longitude'; yl='lagged time (day)';
uu=5*86400/111000; xx=20+uu*(y+20); %speed=longitude/day
pms=[ 0, 0, 500, 800]; warning off all
handle = figure('Position', pms,'visible','on');
row=3; col=1; lw=1; fsize=12;
nn=32; cmap=jet(nn); cmap(nn/2:nn/2+1,:)=1; colormap(cmap);
subplot(row,col,1); v=am4c.olr; s='(d) OLR (AM4.0 AMIP)';
%z=v.lagslop.iso_avg'; zbin=[-2.4:0.05:2.4]; cminmax=[min(zbin) max(zbin)];
z=v.lagcorr.iso_avg'; zbin=[-0.6:0.05:0.6]; cminmax=[min(zbin) max(zbin)];
contourf(x,y,z,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([80 80],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
subplot(row,col,2); v=cm4a.olr; s='(e) OLR (AM4.0 Coupled)';
%z=v.lagslop.iso_avg'; zbin=[-2.4:0.05:2.4]; cminmax=[min(zbin) max(zbin)];
z=v.lagcorr.iso_avg'; zbin=[-0.6:0.05:0.6]; cminmax=[min(zbin) max(zbin)];
contourf(x,y,z,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([80 80],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
subplot(row,col,3); v=o.olr.lga; xo=v.lon; yo=v.lgd;
%z=v.lagslop.iso_avg'; zbin=[-2.4:0.05:2.4]; cminmax=[min(zbin) max(zbin)];
zo=v.lagcorr.iso_avg'; zbin=[-0.6:0.05:0.6]; cminmax=[min(zbin) max(zbin)];
contourf(xo,yo,zo,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([80 80],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title('(f) OLR (NOAA AVHRR)','FontSize',fsize);
ylabel(yl,'FontSize',fsize); xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='u200'; expn='AM4p0_lgc'; 
v=am4a.u200; x=v.lon; y=v.lgd; xy=[0 360 -25 25];
xl='longitude'; yl='lagged time (day)';
uu=5*86400/111000; xx=20+uu*(y+20); %speed=longitude/day
pms=[ 0, 0, 500, 800]; warning off all
handle = figure('Position', pms,'visible','on');
row=3; col=1; lw=1; fsize=12;
nn=32; cmap=jet(nn); cmap(nn/2:nn/2+1,:)=1; colormap(cmap);
subplot(row,col,1); v=am4c.u200; s='(a) U200 (AM4.0 AMIP)';
%z=v.lagslop.iso_avg'; zbin=[-2.4:0.05:2.4]; cminmax=[min(zbin) max(zbin)];
z=v.lagcorr.iso_avg'; zbin=[-0.6:0.05:0.6]; cminmax=[min(zbin) max(zbin)];
contourf(x,y,z,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([80 80],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
subplot(row,col,2); v=cm4a.u200; s='(b) U200 (AM4.0 Coupled)';
%z=v.lagslop.iso_avg'; zbin=[-2.4:0.05:2.4]; cminmax=[min(zbin) max(zbin)];
z=v.lagcorr.iso_avg'; zbin=[-0.6:0.05:0.6]; cminmax=[min(zbin) max(zbin)];
contourf(x,y,z,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([80 80],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title(s,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); %xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
subplot(row,col,3); v=o.u200.lga; xo=v.lon; yo=v.lgd;
%z=v.lagslop.iso_avg'; zbin=[-2.4:0.05:2.4]; cminmax=[min(zbin) max(zbin)];
zo=v.lagcorr.iso_avg'; zbin=[-0.6:0.05:0.6]; cminmax=[min(zbin) max(zbin)];
contourf(xo,yo,zo,zbin); hold on; shading flat; caxis(cminmax); colorbar;
plot([80 80],[-30 30],'k-','LineWidth',lw);
plot(xx,y,'k-.','LineWidth',lw*2); title('(c) U200 (ERA-INTERIM)','FontSize',fsize);
ylabel(yl,'FontSize',fsize); xlabel(xl,'FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%









%do mjo_ana%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath ='/archive/Ming.Zhao/awg/verona/';
latlon=[38.75 181.25 -21.5 21.5]; region='iowpac';
expn='c96L32_am4g11r11_SOAv2_lres_pp';yr1='1981'; yr2='2010'; nyr=30;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

tpath ='/archive/Ming.Zhao/mdt/20161108/';
latlon=[38.75 181.25 -21.5 21.5]; region='iowpac';
expn='CM4_c96L32_am4g10r8_2010_OMp5_ePBL2_mjo_mse3_4xCO2';yr1='0001'; yr2='0026'; nyr=26;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)
exit
%do mjo_ana%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath ='/archive/Ming.Zhao/mdt/20161108/';
latlon=[38.75 181.25 -21.5 21.5]; region='iowpac';
expn='CM4_c96L32_am4g10r8_2010_OMp5_ePBL2_mjo_mse3';yr1='0001'; yr2='0020'; nyr=20;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

tpath ='/archive/Ming.Zhao/awg/verona/';
latlon=[38.75 181.25 -21.5 21.5]; region='iowpac';
expn='c96L32_am4g10r8_2010climo_mse3';yr1='0001'; yr2='0020'; nyr=20;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)
expn='c96L32_am4g10r8_2010climo_mse3_lwcrfoff0';yr1='0001'; yr2='0020'; nyr=20;
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

% $$$ tpath ='/archive/Ming.Zhao/mdt/20161028/';
% $$$ latlon=[38.75 181.25 -21.5 21.5]; region='iowpac';
% $$$ expn='CM4_c96L32_am4g10r8_2010_OMp5_ePBL2_mjo_mse1';yr1='0001'; yr2='0020'; nyr=20;
% $$$ v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)
% $$$ tpath ='/archive/Ming.Zhao/mdt/20161026/';
% $$$ latlon=[38.75 181.25 -21.5 21.5]; region='iowpac';
% $$$ expn='CM4_c96L32_am4g10r8_2010_OMp5_mse';yr1='0002'; yr2='0019'; nyr=18;
% $$$ v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)
% $$$ %load and plot%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ tpath ='/archive/Ming.Zhao/mdt/20161026/'; region='iowpac';
% $$$ expn='CM4_c96L32_am4g10r8_2010_OMp5_mse';
% $$$ fn=strcat(tpath,expn,'/',expn,'_',region,'_mjo.mat'); load(fn);v=v;
% $$$ %load and plot%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ tpath ='/archive/Ming.Zhao/mdt/20161028/'; region='iowpac';
% $$$ expn='CM4_c96L32_am4g10r8_2010_OMp5_ePBL2_mjo_mse1';
% $$$ fn=strcat(tpath,expn,'/',expn,'_',region,'_mjo.mat'); load(fn);v=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t%do mjo_ana%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load and plot%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath ='/archive/Ming.Zhao/awg/verona/'; region='iowpac';
expn='c96L32_am4g10r8_2010climo_mse3';
fn=strcat(tpath,expn,'/',expn,'_',region,'_mjo.mat'); load(fn);v0=v;
%expn='CM4_c96L32_am4g10r8_2010_OMp5_ePBL2_mjo_mse3_4xCO2';
%fn=strcat(tpath,expn,'/',expn,'_',region,'_mjo.mat'); load(fn);v3=v;
tpath ='/archive/Ming.Zhao/mdt/20161108/'; region='iowpac';
expn='CM4_c96L32_am4g10r8_2010_OMp5_ePBL2_mjo_mse3';
fn=strcat(tpath,expn,'/',expn,'_',region,'_mjo.mat'); load(fn);v=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g1=compute_grate(v1); g2=compute_grate(v2); g3=compute_grate(v3); 
g=[g1.rate; g2.rate; g3.rate]; 
figure; plot(g1.hf); hold on; plot(g2.hf,'r'); plot(g3.hf,'g');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g=compute_grate(v);
pms=[ 0, 0, 1200, 800]*0.7; warning off all
handle = figure('Position', pms,'visible','on');
x=[1:6]; bar(x,g.rate); fsize=18;
set(gca,'xtick',x);
s1='total'; s2='rad';  s3='sfc'; 
s4='vadv';  s5='hadv'; s6='mass';
set(gca,'xticklabel',{s1,s2,s3,s4,s5,s6});
set(gca,'FontSize',fsize);
ylabel('<MSE> variance growth rate (day^{-1})','FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse2_io_iso_growthrate';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 1a%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.lon; y=v.lgd; z1=v.pcp.lagslop.iso_avg'; lw=1;
%z2=v.hfint0.lagslop.org_avg'; z2=z2/10^6; fsize=18;
z2=v.hfint0.lagslop.iso_avg'; z2=z2/10^6; fsize=18;
contourf(x,y,z1,[-2.4:0.2:2.4]); hold on; shading flat; caxis([-2 2]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[0 0],   'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[-25 25],'k-','LineWidth',lw);
uu=5*86400/111000 %speed=longitude/day
xx=40+uu*(y+20); plot(xx,y,'k-.','LineWidth',lw*2)
ylabel('lagged time (day)','FontSize',fsize); 
xlabel('longitude','FontSize',fsize);
axis([40 180 -20 20]); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_mjo/'; vname='pcp_mse_iso_lagregress';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 1b%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%x=v.io.pcp.comp_iso_avg; y=v.io.tdt_rad_int0.comp_iso_avg; figure; plot(x,y,'s'); hold on;
%c=polyfit(x,y,1); yy=x*c(1)+c(2); plot(x,yy,'k--','LineWidth',lw); 
pms=[ 0, 0, 1200, 900]*0.7; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; lw=2; fsize=16;
%plot(lgd,mean(event.var,1),'k'); hold on;
plot(x, v.io.pcp.comp_iso_avg_n*20,'k-','LineWidth',lw*2); hold on; sx='precip';
plot(x,  v.io.hfint0.comp_iso_avg_n*20,'k--','LineWidth',lw*2); sy='<MSE>';
%plot(x, v.io.hfintn0.comp_iso_avg_n*10,'r-'); 
%plot(x, v.io.hf_beg.comp_iso_avg,'r-');%plot(x, v.io.hf_end.comp_iso_avg_n,'r*:');
%plot(x, v.io.dhf.comp_iso_avg,'b-*'); sy='(dm/dt)-total'
%y0=v.io.hdt_sum_int0.comp_iso_avg; plot(x,y0,'g--');
y0=v.io.hdt_tot_int.comp_iso_avg;   plot(x,y0,'k:*','LineWidth',lw);s0='<dMSE/dt>-total';
y1=v.io.tdt_rad_int0.comp_iso_avg;  plot(x,y1,'r-','LineWidth',lw); s1='<dMSE/dt>-rad';
y2a=v.io.tdt_dif_int0.comp_iso_avg; %plot(x,y2a,'g--'); s2a='sensible';
y2b=v.io.qvdt_dif_int0.comp_iso_avg;%plot(x,y2b,'c:');  s2b='latent heat';
y2 =y2a+y2b;                        plot(x,y2,'g-','LineWidth',lw); s2='<dMSE/dt>-shflx';
y3 =v.io.hdt_vadv_int0.comp_iso_avg;plot(x,y3,'c-', 'LineWidth',lw);s3='<dMSE/dt>-vadv';
y4a=v.io.hdt_hadv_int0.comp_iso_avg;
y4b=v.io.hdt_dgz_int0.comp_iso_avg; %figure; plot(x,y4a,'r'); hold on; plot(x,y4b,'b');
y4 =y4a+y4b;                        plot(x,y4,'b-','LineWidth',lw);s4='<dMSE/dt>-hadv';
y5a=v.io.hdp_dyn_int0.comp_iso_avg; 
y5b=v.io.hdt_ddp_int0.comp_iso_avg; 
y5c=v.io.hdt_adj_int0.comp_iso_avg; 
y5 =y5a+y5b+y5c;                    plot(x,y5,'m-','LineWidth',lw);s5='<dMSE/dt>-mass';
y6 =y3+y4+y5;                       %plot(x,y6,'c-','LineWidth',lw); s6='<dMSE/dt>-dyn';
y7 =y1+y2+y6;                       plot(x,y7,'ks','MarkerSize',12);s7='sum=rad+shflx+vadv+hadv';
y8=v.io.hdt_dgz_adj.comp_iso_avg;%figure;plot(y8,'-r*');hold on;plot(y5b+y5c+y4b,'bs-');
%y9=y1+y2+y3+y4a+y5a+y8;            plot(x,y9,'ko','MarkerSize',12);s4='sum=rad+sfc+dyn';
legend(sx,sy,s0,s1,s2,s3,s4,s5,s7,3,'boxoff'); grid on;
xlabel('lagged time (day)','FontSize',fsize); 
ylabel('MSE budget (W/m2)','FontSize',fsize);
axis([-20 20 -55 40]); set(gca,'FontSize',fsize-4); 
visfig='off'; figpath='./fig_mjo/'; vname='dmse_io_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Fig2a:composite advection%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=12; cx=0.006; lw=1;
z1=(v.io.hdt_hadv_int.comp_iso_avg+v.io.hdt_dgz_int.comp_iso_avg); 
z2=(v.io.hdt_vadv_int.comp_iso_avg);%zx=v.io.dpint.comp_clm_avg;figure;plot(sum(zx.*z2,1));
contourf(x,y,z1,[-cx:0.001:cx]);hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,z2,[0   :0.001:cx],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-0.1:0.001:0], 'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[0 0],          'k-', 'LineWidth',lw*2); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize); 
title('(a) MSE tendencies due to horizontal and vertical advection');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_adv_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2b:composite radiation%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=12; cx=0.006; lw=1;
z1=v.io.tdt_rad_int.comp_iso_avg;%zx=v.io.dpint.comp_clm_avg;figure;plot(sum(zx.*z1,1));
z2=v.io.omg.comp_iso_avg*864; 
contourf(x,y,z1,[-cx:0.001:cx]);hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,z2,[0   :10:100],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-100:10:0],  'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[0 0],        'k-', 'LineWidth',lw*2); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
title('(b) MSE tendencies due to radiation');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_rad_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2c:composite turbulence diffusion%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=12; cx=0.006; lw=1;
z1a=v.io.tdt_dif_int.comp_iso_avg;
z1b=v.io.qvdt_dif_int.comp_iso_avg; z1=z1a+z1b; z1(z1<-cx)=-cx;
z2=(v.io.hfint.comp_iso_avg); %z2=z2/10^6;
%zx=v.io.dpint.comp_clm_avg;figure;plot(sum(zx.*z2,1));
contourf(x,y,z1,[-cx:0.001:cx]);hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,z2,[0    :500:2000],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-2000:500:0],  'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[0 0],         'k-', 'LineWidth',lw*2); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
title('(c) MSE tendencies due to vertical turbulent diffusion');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_turb_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2x: composite mass%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=12; cx=0.001; lw=1;
z1a=v.io.hdp_dyn_int.comp_iso_avg;
z1b=v.io.hdt_ddp_int.comp_iso_avg;
z1c=v.io.hdt_adj_int.comp_iso_avg; z1=z1a+z1b+z1c;
z2a=v.io.ddp_phy_int.comp_iso_avg; 
z2b=v.io.ddp_dyn_int.comp_iso_avg; z2=z2a+z2b;
%zx=v.io.dpint.comp_clm_avg;figure;plot(sum(zx.*z2,1)); hold on;
%plot(v.io.ddp_dyn_int0.comp_iso_avg+v.io.ddp_phy_int0.comp_iso_avg,'r');
contourf(x,y,z1,[-cx:0.0001:cx]);hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,z2,[0 :0.05:1]*10^(-7),'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-1:0.05:0]*10^(-7),'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[0 0],              'k-', 'LineWidth',lw*2); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
title('MSE tendencies due to mass change');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_mass_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2d: composite convection%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=12; cx=0.006; lw=1;
z1a=v.io.tdt_conv_int.comp_iso_avg; 
z1b=v.io.qdt_conv_int.comp_iso_avg; z1=z1a+z1b; z1(z1<-cx)=-cx;
z2a=v.io.tdt_conv_int.comp_clm_avg;
z2b=v.io.qdt_conv_int.comp_clm_avg; z2=z2a+z2b;
%zx=v.io.dpint.comp_clm_avg;figure;plot(sum(zx.*z2,1)); hold on;
contourf(x,y,z1,[-cx:0.001:cx]);hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,z2,[0   :0.002:0.02],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-0.02:0.002:0] , 'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[0 0],            'k-', 'LineWidth',lw*2); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
title('(d) MSE tendencies due to convection');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_conv_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 3 regression total MSE tendency%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.lon; y=v.lat; z1=v.hdt_tot_int.slop.iso_avg'; fsize=18;
z2=v.hfint0.slop.iso_avg'; z2=z2/10^6; cx=8; lw=1;
contourf(x,y,z1,[-cx:0.5:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-','LineWidth',1); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',1); clabel(C,h)
[C,h]=contour(x,y,z2,[0 0],   'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[-25 25],'k-','LineWidth',lw);
ylabel('latitude','FontSize',fsize); 
xlabel('longitude','FontSize',fsize);
axis([40 180 -20 20]); set(gca,'FontSize',fsize); 
title('total MSE tendency');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_tot_iso_regress';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 3x regression net MSE tendency%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.lon; y=v.lat; z1=v.hdt_net_int.slop.iso_avg'; fsize=18;
z2=v.hfint0.slop.iso_avg'; z2=z2/10^6; cx=8; lw=1;
contourf(x,y,z1,[-cx:0.5:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[0 0],   'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[-25 25],'k-','LineWidth',lw);
ylabel('latitude','FontSize',fsize); 
xlabel('longitude','FontSize',fsize);
axis([40 180 -20 20]); set(gca,'FontSize',fsize); 
title('net MSE tendency');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_net_iso_regress';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 3a regression hadv MSE tendency%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.lon; y=v.lat; fsize=18;
z1=v.hdt_hadv_int0.slop.iso_avg'+v.hdt_dgz_int0.slop.iso_avg';
z2=v.hfint0.slop.iso_avg'; z2=z2/10^6; cx=8; lw=1;
contourf(x,y,z1,[-cx:0.5:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[0 0],   'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[-25 25],'k-','LineWidth',lw);
ylabel('latitude','FontSize',fsize); 
xlabel('longitude','FontSize',fsize);
axis([40 180 -20 20]); set(gca,'FontSize',fsize); 
title('(a) MSE tendency due to horizontal advection');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_hadv_iso_regress';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 3b regression vadv MSE tendency%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.lon; y=v.lat; z1=v.hdt_vadv_int0.slop.iso_avg'; fsize=18;
z2=v.hfint0.slop.iso_avg'; z2=z2/10^6; cx=8; lw=1; z1(z1<-cx)=-cx;
contourf(x,y,z1,[-cx:0.5:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[0 0],   'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[-25 25],'k-','LineWidth',lw);
ylabel('latitude','FontSize',fsize); 
xlabel('longitude','FontSize',fsize);
axis([40 180 -20 20]); set(gca,'FontSize',fsize); 
title('(b) MSE tendency due to vertical advection');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_vadv_iso_regress';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 3c regression radiation MSE tendency%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.lon; y=v.lat; fsize=18;
z1=v.tdt_rad_int0.slop.iso_avg'; cx=8; lw=1; z1(z1<-cx)=-cx;
z2=v.hfint0.slop.iso_avg'; z2=z2/10^6;
contourf(x,y,z1,[-cx:0.5:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[0 0],   'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[-25 25],'k-','LineWidth',lw);
ylabel('latitude','FontSize',fsize); 
xlabel('longitude','FontSize',fsize);
axis([40 180 -20 20]); set(gca,'FontSize',fsize); 
title('(c) MSE tendency due to radiation');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_rad_iso_regress';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 3d regression sfc heat flux MSE tendency%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.lon; y=v.lat; fsize=18; cx=8; lw=1; z1(z1<-cx)=-cx;
z1=v.tdt_dif_int0.slop.iso_avg'+v.qvdt_dif_int0.slop.iso_avg';
z2=v.hfint0.slop.iso_avg'; z2=z2/10^6;
contourf(x,y,z1,[-cx:0.5:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[0 0],   'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[-25 25],'k-','LineWidth',lw);
ylabel('latitude','FontSize',fsize); 
xlabel('longitude','FontSize',fsize);
axis([40 180 -20 20]); set(gca,'FontSize',fsize); 
title('(d) MSE tendency due to surface heat fluxes');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_slhflx_iso_regress';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 3e regression mass MSE tendency%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.lon; y=v.lat; fsize=18;
z1a=v.hdp_dyn_int0.slop.iso_avg';
z1b=v.hdt_ddp_int0.slop.iso_avg';
z1c=v.hdt_adj_int0.slop.iso_avg'; z1=z1a+z1b+z1c; cx=8; lw=1; z1(z1<-cx)=-cx;
z2=v.hfint0.slop.iso_avg'; z2=z2/10^6;
contourf(x,y,z1,[-cx:0.5:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[0 0],   'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[-25 25],'k-','LineWidth',lw);
ylabel('latitude','FontSize',fsize); 
xlabel('longitude','FontSize',fsize);
axis([40 180 -20 20]); set(gca,'FontSize',fsize); 
title('(e) MSE tendency due to mass change');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_hdp_iso_regress';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 4 regression vertical total MSE tendency %
z1  =v.hdt_hadv_int.slop.iso_avg; 
z2  =v.hdt_vadv_int.slop.iso_avg;
z3  =v.tdt_rad_int.slop.iso_avg;
z4a =v.tdt_dif_int.slop.iso_avg;
z4b =v.qvdt_dif_int.slop.iso_avg; z4=z4a+z4b;
z5a =v.hdp_dyn_int.slop.iso_avg;
z5b =v.hdt_ddp_int.slop.iso_avg;
z5c =v.hdt_adj_int.slop.iso_avg; z5=z5a+z5b+z5c;
z6a =v.tdt_conv_int.slop.iso_avg;
z6b =v.qdt_conv_int.slop.iso_avg; z6=z6a+z6b;
znet=z1+z2+z3+z4+z5;
vmse=v.hfint.slop.iso_avg; %vmse1=v.hf.slop.iso_avg;
omga=v.omg.slop.iso_avg*864; %hPa/day
%Fig 4%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on'); fsize=18;
x=v.lon; y=v.pf; cx=0.002; znet(znet<-cx)=-cx; lw=1;
%zx=v.dpint.clm; figure; plot(sum(zx.*znet,1));
%zx=v.dpint.clm; figure; plot(sum(zx.*vmse1,1));
%zx=v.dpint.clm; figure; plot(sum(zx,1));
%hold on; figure; plot(mean(v.hfint0.slop.iso_avg,2));
contourf(x,y,znet,[-cx:0.0001:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,vmse,[100 :50:600],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[-500:50:0],  'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[0 0],         'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[0 1000],'k-','LineWidth',lw);
set(gca,'yDir','reverse'); axis([40 180 100 1000]);
xlabel('longitude','FontSize',fsize);
ylabel('pressure (hPa)','FontSize',fsize); 
set(gca,'FontSize',fsize); title('total MSE tendency');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_tot_iso_regress_vert';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 4a hadv vertical%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on'); fsize=18;
x=v.lon; y=v.pf; cx=0.002; lw=1;
contourf(x,y,z1,[-cx:0.0001:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,vmse,[100 :50:600],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[-500:50:0],  'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[0 0],         'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[0 1000],'k-','LineWidth',lw);
set(gca,'yDir','reverse'); axis([40 180 100 1000]);
xlabel('longitude','FontSize',fsize);
ylabel('pressure (hPa)','FontSize',fsize); 
set(gca,'FontSize',fsize); title('MSE tendency due to horizontal advection');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_hadv_iso_regress_vert';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 4b vadv vertical%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on'); fsize=18;
x=v.lon; y=v.pf; cx=0.002; lw=1;
contourf(x,y,z2,[-cx:0.0001:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,vmse,[100 :50:600],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[-500:50:0],  'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[0 0],         'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[0 1000],'k-','LineWidth',lw);
set(gca,'yDir','reverse'); axis([40 180 100 1000]);
xlabel('longitude','FontSize',fsize);
ylabel('pressure (hPa)','FontSize',fsize); 
set(gca,'FontSize',fsize); title('MSE tendency due to vertical advection');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_vadv_iso_regress_vert';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 4c radiation vertical%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on'); fsize=18;
x=v.lon; y=v.pf; cx=0.002;
contourf(x,y,z3,[-cx:0.0001:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,vmse,[100 :50:600],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[-500:50:0],  'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[0 0],         'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[0 1000],'k-','LineWidth',lw);
set(gca,'yDir','reverse'); axis([40 180 100 1000]);
xlabel('longitude','FontSize',fsize);
ylabel('pressure (hPa)','FontSize',fsize); 
set(gca,'FontSize',fsize); title('MSE tendency due to radiation');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_rad_iso_regress_vert';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 4d vdif vertical%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on'); fsize=18;
x=v.lon; y=v.pf; cx=0.002; z4(z4<-cx)=-cx; lw=1;
contourf(x,y,z4,[-cx:0.0001:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,vmse,[100 :50:600],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[-500:50:0],  'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[0 0],         'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[0 1000],'k-','LineWidth',lw);
set(gca,'yDir','reverse'); axis([40 180 100 1000]);
xlabel('longitude','FontSize',fsize);
ylabel('pressure (hPa)','FontSize',fsize); 
set(gca,'FontSize',fsize); title('MSE tendency due to vertical diffusion');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_vdif_iso_regress_vert';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 4e mass vertical%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on'); fsize=18;
x=v.lon; y=v.pf; cx=0.002; lw=1;
contourf(x,y,z5,[-cx:0.0001:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,vmse,[100 :100:600],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[-500:100:0],  'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[0 0],         'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[0 1000],'k-','LineWidth',lw);
set(gca,'yDir','reverse'); axis([40 180 100 1000]);
xlabel('longitude','FontSize',fsize);
ylabel('pressure (hPa)','FontSize',fsize); 
set(gca,'FontSize',fsize); title('MSE tendency due to mass change');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_mass_iso_regress_vert';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 4f convective MSE tendency vertical%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on'); fsize=18;
x=v.lon; y=v.pf; cx=0.002; lw=1;
z6a =v.tdt_conv_int.slop.iso_avg;
z6b =v.qdt_conv_int.slop.iso_avg; z6=z6a+z6b; z1(z1<-cx)=-cx;
contourf(x,y,z6,[-cx:0.0001:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,vmse,[100 :50:600],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[-500:50:0],  'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[0 0],         'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[0 1000],'k-','LineWidth',lw);
set(gca,'yDir','reverse'); axis([40 180 100 1000]);
xlabel('longitude','FontSize',fsize);
ylabel('pressure (hPa)','FontSize',fsize); 
set(gca,'FontSize',fsize); title('MSE tendency due to convection');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_conv_iso_regress_vert';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 4f convective heating vertical%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on'); fsize=18;
x=v.lon; y=v.pf; cx=0.002; lw=1;
z6a =v.tdt_conv_int.slop.iso_avg;
z6b =v.qdt_conv_int.slop.iso_avg; zx=z6a; zx(zx<-cx)=-cx;
contourf(x,y,zx,[-cx:0.0001:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,vmse,[100 :50:600],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[-500:50:0],  'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[0 0],         'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[0 1000],'k-','LineWidth',lw);
set(gca,'yDir','reverse'); axis([40 180 100 1000]);
xlabel('longitude','FontSize',fsize);
ylabel('pressure (hPa)','FontSize',fsize); 
set(gca,'FontSize',fsize); title('convective MSE tendency due to heating');
visfig='off'; figpath='./fig_mjo/'; vname='dt_conv_iso_regress_vert';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 4f convective drying vertical%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on'); fsize=18;
x=v.lon; y=v.pf; cx=0.002; lw=1;
z6a =v.tdt_conv_int.slop.iso_avg;
z6b =v.qdt_conv_int.slop.iso_avg; zx=z6b; zx(zx<-cx)=-cx;
contourf(x,y,zx,[-cx:0.0001:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,vmse,[100 :50:600],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[-500:50:0],  'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[0 0],         'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[0 1000],'k-','LineWidth',lw);
set(gca,'yDir','reverse'); axis([40 180 100 1000]);
xlabel('longitude','FontSize',fsize);
ylabel('pressure (hPa)','FontSize',fsize); 
set(gca,'FontSize',fsize); title('convective MSE tendency due to drying');
visfig='off'; figpath='./fig_mjo/'; vname='dq_conv_iso_regress_vert';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 4a regressed omega vertical%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on'); fsize=18;
x=v.lon; y=v.pf; cx=4; lw=1; zx=omga; 
contourf(x,y,zx,[-cx:0.2:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,vmse,[100 :100:600],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[-500:100:0],  'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[0 0],         'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[0 1000],'k-','LineWidth',lw);
set(gca,'yDir','reverse'); axis([40 180 100 1000]);
xlabel('longitude','FontSize',fsize);
ylabel('pressure (hPa)','FontSize',fsize); 
set(gca,'FontSize',fsize); title('vertical pressure velocity');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_omg_iso_regress_vert';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 4x regressed diabatic heating due to radiation,diffusion,convection%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on'); fsize=18;
x=v.lon; y=v.pf; cx=0.2; lw=1;
zx=(z3+z4a+z6a)/CPD*86400;
contourf(x,y,zx,[-cx:0.01:cx]); hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,vmse,[100 :100:600],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[-500:100:0],  'k--','LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,vmse,[0 0],         'k-', 'LineWidth',lw*2); clabel(C,h)
plot([80 80],[0 1000],'k-','LineWidth',lw);
set(gca,'yDir','reverse'); axis([40 180 100 1000]);
xlabel('longitude','FontSize',fsize);
ylabel('pressure (hPa)','FontSize',fsize); 
set(gca,'FontSize',fsize); title('diabatic heating');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_diaheating_iso_regress_vert';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Fig 4x regressed diabatic heating due to radiation,diffusion,convection%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on'); fsize=18;
x=v.lon; y=v.lat; lw=1; cfact=2; k=2;
zu=v.u700.slop.iso_avg'; zu=zu(1:k:end,1:k:end);
zv=v.v700.slop.iso_avg'; zv=zv(1:k:end,1:k:end);
zz=v.qv700.clm_win*1000;
contourf(x,y,zz,[1:0.2:8]); hold on; shading flat; caxis([1 8]); colorbar;
quiver(x(1:k:end),y(1:k:end),zu,zv,cfact,'k')
plot([80 80],[-30 30],'k-','LineWidth',lw);
xlabel('longitude','FontSize',fsize);
ylabel('latitude','FontSize',fsize); 
set(gca,'FontSize',fsize); title('600-700 hPa specific humidity and winds');
visfig='off'; figpath='./fig_mjo/'; vname='dmse_wind_iso_regress';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%











%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y0=v.io.hfint0.comp_iso';
y1=v.io.tdt_rad_int0.comp_iso';
y1=v.io.hdt_vadv_int0.comp_iso';
y1=v.io.hdt_hadv_int0.comp_iso';
y1=v.io.tdt_dif_int0.comp_iso'+v.io.qvdt_dif_int0.comp_iso';
z1=mean(y0.*y1,2); %figure; plot(mean(z1,2));
z2=mean(y0,2).*mean(y1,2); 
figure; plot(z2,'r'); hold on; plot(z1,'b')
figure; plot(y0); 
figure; plot(y1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=18;
z1a=v.io.hdp_dyn_int.comp_iso_avg; 
z1b=v.io.hdt_ddp_int.comp_iso_avg;
z1c=v.io.hdt_adj_int.comp_iso_avg; z1=z1a+z1b+z1c;
z2a=v.io.ddp_phy_int.comp_iso_avg; 
z2b=v.io.ddp_dyn_int.comp_iso_avg; z2=z2a+z2b;
contourf(x,y,z1,[-0.5:0.05:0.5]);hold on; shading flat; caxis([-0.3 0.3]); colorbar;
[C,h]=contour(x,y,z2,[0 :0.4:1]*10^(-5),'k-', 'LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-1:0.4:0]*10^(-5),'k--','LineWidth',2); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse_mass_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; z1=v.io.dpint.comp_iso_avg; fsize=18;
z2=v.io.omg.comp_iso_avg; z2=z2*864; a=diff(z2,1,1); z2(2:32,:)=a;
contourf(x,y,z1,[-0.5:0.01:0.5]);hold on; shading flat; caxis([-0.5 0.5]); colorbar;
[C,h]=contour(x,y,z2,[0  :1:8],'k-', 'LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-8:1:0 ],'k--','LineWidth',2); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse_hdp_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; z1=v.io.hdp_dyn_int.comp_iso_avg; fsize=18;
z2=v.io.omg.comp_iso_avg; z2=z2*864; 
contourf(x,y,z1,[-2.5:0.1:2.5]);hold on; shading flat; caxis([-2.5 2.5]); colorbar;
[C,h]=contour(x,y,z2,[0  :10:80],'k-', 'LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-80:10:80],'k--','LineWidth',2); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse_hdp_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=18;
z1=v.io.hf.comp_clm_avg; z1=z1/10^3;
z2=v.io.omg.comp_iso_avg; z2=z2*864;
contourf(x,y,z1,[320:350]);hold on; shading flat; caxis([330 350]); colorbar;
[C,h]=contour(x,y,z2,[0  :10:80],'k-', 'LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-80:10:0 ],'k--','LineWidth',2); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='mseclm_omg_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=18;
z1=v.io.hf.comp_iso_avg; %z1=z1/10^3;
z2=v.io.omg.comp_iso_avg; z2=z2*864; %a=diff(z2,1,1); z2(2:32,:)=a;
contourf(x,y,z1,20);hold on; shading flat; caxis([-2000 2000]); colorbar;
%contourf(x,y,z1,[320:350]);hold on; shading flat; caxis([330 350]); colorbar;
[C,h]=contour(x,y,z2,[0  :10:80],'k-', 'LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-80:10:0 ],'k--','LineWidth',2); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='mse_omg_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Fig0a%%%%%%%%%%%%%%%%%%%%%%%%%
k1=1200; k2=1400; x=[k1:k2]; lw=1; msize=12; fsize=14;
y1=v.io.hdt_tot_int.ano_org0(k1:k2);
y2=v.io.hdt_net_int.ano_org0(k1:k2);
y3=v.io.hdt_tot_int.ano_iso0(k1:k2);
y4=v.io.hdt_net_int.ano_iso0(k1:k2);
y5=v.io.hdt_hadv_int.org(k1:k2,:);
y6=
pms=[ 0, 0, 1200, 800]*0.8; warning off all
handle = figure('Position', pms,'visible','on');
plot(x,y1,'-r*','LineWidth',lw,'MarkerSize',msize-2); hold on; 
plot(x,y2,'-bs','LineWidth',lw,'MarkerSize',msize);
xlabel('day','FontSize',fsize); 
ylabel('MSE tendency','FontSize',fsize);
legend('\Delta <MSE>/\Delta t','\Sigma <\partial MSE/\partial t>')
axis([1200 1400 -250 250]); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_mjo/'; vname='dmse_org_budget';
printit(visfig,figpath,expn,vname);
%Fig0b%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; warning off all
handle = figure('Position', pms,'visible','on');
plot(x,y3,'-r*','LineWidth',lw,'MarkerSize',msize-2); hold on; 
plot(x,y4,'-bs','LineWidth',lw,'MarkerSize',msize);
xlabel('day','FontSize',fsize); 
ylabel('20-100 day band-pass-filtered MSE tendency','FontSize',fsize);
legend('\Delta <MSE>/\Delta t','\Sigma <\partial MSE/\partial t>')
axis([1200 1400 -50 50]); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_mjo/'; vname='dmse_iso_budget';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig0c%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; warning off all
handle = figure('Position', pms,'visible','on');
plot(x,y3,'-r*','LineWidth',lw,'MarkerSize',msize-2); hold on; 
plot(x,y4,'-bs','LineWidth',lw,'MarkerSize',msize);
xlabel('day','FontSize',fsize); 
ylabel('20-100 day band-pass-filtered MSE tendency','FontSize',fsize);
legend('\Delta <MSE>/\Delta t','\Sigma <\partial MSE/\partial t>')
axis([1200 1400 -50 50]); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_mjo/'; vname='dmse_iso_budget';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plotting....
pms=[ 0, 0, 1200, 900]*0.7; warning off all
handle = figure('Position', pms,'visible','on');
hf= v.io.hfint0.comp_iso_avg; a=86400; x=[1:6]; fsize=16
id=(hf>0); hf0=sum(hf(id).*hf(id));
z0=y0.*hf*a; Z0=sum(z0(id))/hf0; s0='total';
z1=y1.*hf*a; Z1=sum(z1(id))/hf0; s1='rad';
z2=y2.*hf*a; Z2=sum(z2(id))/hf0; s2='shflx';
z3=y3.*hf*a; Z3=sum(z3(id))/hf0; s3='vadv';
z4=y4.*hf*a; Z4=sum(z4(id))/hf0; s4='hadv';
z5=y5.*hf*a; Z5=sum(z5(id))/hf0; s5='mass';
Z=[Z0 Z1 Z2 Z3 Z4 Z5]; bar(x,Z); 
set(gca,'xtick',x);
set(gca,'xticklabel',{s0,s1,s2,s3,s4,s5});
set(gca,'FontSize',fsize);
ylabel('Growth rate (day^{-1})','FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse2_io_iso_growthrate';
printit(visfig,figpath,expn,vname);

%composite vertical section advection%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=12;
z1=v.io.dpint.comp_iso_avg; 
z2=v.io.hdt_vadv_int.comp_iso_avg; 
contourf(x,y,z1,[-0.4:0.01:0.4]);hold on; shading flat; caxis([-0.4 0.4]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-', 'LineWidth',1); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',1); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse_adv_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%composite vertical section advection%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=12;
z1=v.io.hdt_hadv_int.comp_iso_avg+v.io.hdt_dgz_int.comp_iso_avg; 
z2=v.io.hdt_vadv_int.comp_iso_avg; 
contourf(x,y,z1,[-3:0.1:3]);hold on; shading flat; caxis([-3 3]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-', 'LineWidth',1); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',1); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse_adv_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%composite vertical section radiation%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=18; lw=1;
z1=v.io.tdt_rad_int.comp_iso_avg; 
z2=v.io.hfint.comp_iso_avg; z2=z2/10^6;
contourf(x,y,z1,[-3:0.1:3]);hold on; shading flat; caxis([-3 3]); colorbar;
[C,h]=contour(x,y,z2,[0 :0.4:2],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-2:0.4:0],'k--','LineWidth',lw); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse_rad_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%composite vertical section turbulence diffusion
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=18;
z1a=v.io.tdt_dif_int.comp_iso_avg;
z1b=v.io.qvdt_dif_int.comp_iso_avg; z1=z1a+z1b;
z2=v.io.hfint.comp_iso_avg; z2=z2/10^6;
contourf(x,y,z1,[-3:0.1:3]);hold on; shading flat; caxis([-3 3]); colorbar;
[C,h]=contour(x,y,z2,[0 :0.4:2],'k-', 'LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-2:0.4:0],'k--','LineWidth',2); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse_turb_iso_comp';
printit(visfig,figpath,expn,vname);
%%composite vertical section %%%%%%%%%%%%%%%%%%
%convection%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=18;
z1a=v.io.tdt_conv_int.comp_iso_avg; 
z1b=v.io.qdt_conv_int.comp_iso_avg; z1=z1a+z1b;
z2a=v.io.tdt_conv_int.comp_clm_avg;
z2b=v.io.qdt_conv_int.comp_clm_avg; z2=z2a+z2b;
contourf(x,y,z1,[-4:0.1:4]);hold on; shading flat; caxis([-3 3]); colorbar;
[C,h]=contour(x,y,z2,[0  :5:20],'k-', 'LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-20:5:0], 'k--','LineWidth',2); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse_conv_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%composite vertical section %%%%%%%%%%%%%%%%%%
%convection tdt_conv%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=18;
z1a=v.io.tdt_conv_int.comp_iso_avg; 
z1b=v.io.qdt_conv_int.comp_iso_avg; z1=z1a+z1b;
z2a=v.io.tdt_conv_int.comp_clm_avg;
z2b=v.io.qdt_conv_int.comp_clm_avg; z2=z2a+z2b;
contourf(x,y,z1,[-5:1:5]);hold on; shading flat; caxis([-5 5]); colorbar;
[C,h]=contour(x,y,z2,[0  :5:20],'k-', 'LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-20:5:0], 'k--','LineWidth',2); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse_tdtconv_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%composite vertical section %%%%%%%%%%%%%%%%%%
%convection qdt_conv%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=18;
z1a=v.io.tdt_conv_int.comp_iso_avg; 
z1b=v.io.qdt_conv_int.comp_iso_avg; z1=z1b;
z2a=v.io.tdt_conv_int.comp_clm_avg;
z2b=v.io.qdt_conv_int.comp_clm_avg; z2=z2b;
contourf(x,y,z1,[-15:1:15]);hold on; shading flat; caxis([-15 15]); colorbar;
[C,h]=contour(x,y,z2,[0  :5:20],'k-', 'LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-20:5:0], 'k--','LineWidth',2); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse_qdtconv_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; lw=3; fsize=14;
%plot(lgd,mean(event.var,1),'k'); hold on;
plot(x, v.io.pcp.comp_org_avg_n*30,'k--','LineWidth',lw*2); hold on; sx='precip';
%plot(x, v.io.u850.comp_org_avg,  'k--'); grid on;
%plot(x, v.io.u200.comp_org_avg,  'k-.'); 
%plot(x, v.io.olr.comp_org_avg,   'k:');
plot(x,  v.io.hfint0.comp_org_avg_n*30,'r--','LineWidth',lw*2); sy='<MSE>';
%plot(x, v.io.hfintn0.comp_org_avg_n*10,'r-'); 
%plot(x, v.io.hf_beg.comp_org_avg,'r-'); 
%plot(x, v.io.hf_end.comp_org_avg_n,'r*:');
%plot(x, v.io.dhf.comp_org_avg,'b-*'); sy='(dm/dt)-total'
%y0=v.io.hdt_sum_int0.comp_org_avg; plot(x,y0,'g--');
y0=v.io.hdt_tot_int.comp_org_avg;   plot(x,y0,'r-*','LineWidth',lw);s0='<dMSE/dt>-total';
y1=v.io.tdt_rad_int0.comp_org_avg;  plot(x,y1,'g-','LineWidth',lw); s1='radiation';
y2a=v.io.tdt_dif_int0.comp_org_avg; %plot(x,y2a,'g--'); s2a='sensible';
y2b=v.io.qvdt_dif_int0.comp_org_avg;%plot(x,y2b,'c:');  s2b='latent heat';
y2=y2a+y2b;                         plot(x,y2,'c-','LineWidth',lw); s2='surface heat flux';
y3=v.io.hdt_dgz_adj.comp_org_avg;   plot(x,y3,'k-','LineWidth',lw); s3='hdt-dgz-phy';
y4a=v.io.hdt_hadv_int0.comp_org_avg;%plot(x,y4a,'m:');  s4a='hdt-hadv-int';
y4b=v.io.hdt_vadv_int0.comp_org_avg;%plot(x,y4b,'m--'); s4b='hdt-vadv-int';
y4c=v.io.hdp_dyn_int0.comp_org_avg; %plot(x,y4c,'m-.'); s4c='hdp-dyn-int';
y4=y4a+y4b+y4c;                     plot(x,y4,'b-','LineWidth',lw); s4='<dMSE/dt>-dyn';
y5=y1+y2+y3+y4;                     plot(x,y5,'r-s');  s5='sum';
y6=y4a;                             plot(x,y6,'b*--'); s6='hadv';
y7=y4b;                             plot(x,y7,'bo-.'); s7='vadv';
y8=y4c;                             plot(x,y8,'b+:');  s8='hdp-dyn';
y9=y4a+y4b;                         plot(x,y9,'bp-');  s9='adv';
legend(sx,sy,s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,4,'boxoff'); grid on;
xlabel('lagged time (day)','FontSize',fsize); 
ylabel('MSE budget (W/m2)','FontSize',fsize);
axis([-20 20 -150 60]); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_mjo/'; vname='dmse_io_org_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







tpath ='/archive/Ming.Zhao/awg/verona/';
latlon=[0 360 -10 5]; region='global'; yr1='1981'; yr2='2015'; nyr=35;
expn='c96L32_am4g10r8';
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

tpath ='/archive/Ming.Zhao/awg/verona/';
latlon=[0 360 -10 5]; region='global'; yr1='1981'; yr2='2010'; nyr=30;
expn='c96L32_am4g11r11';
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

tpath ='/archive/Ming.Zhao/awg/verona/';
latlon=[0 360 -10 5]; region='global'; yr1='0002'; yr2='0011'; nyr=10;
expn='c96L32_am4g10r8_2000climo';
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

tpath ='/archive/Ming.Zhao/awg/verona/';
latlon=[0 360 -10 5]; region='global'; yr1='0002'; yr2='0011'; nyr=10;
expn='c96L32_am4g11r11_2010climo';
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

tpath ='/archive/Ming.Zhao/awg/verona/';
latlon=[0 360 -10 5]; region='global'; yr1='0002'; yr2='0011'; nyr=11;
expn='CM4_c96L32_am4g11r14c_1860_OMp5_H5_ndiff_meke_MLE30d_ePBLn';
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

tpath ='/archive/Ming.Zhao/mdt/20161028/';
latlon=[0 360 -10 5]; region='global'; yr1='0001'; yr2='0020'; nyr=20;
expn='CM4_c96L32_am4g11r14c_1860_OMp5_H5_ndiff_meke_MLE30d_ePBLn';
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

tpath ='/archive/Ming.Zhao/mdt/20161001/';
latlon=[0 360 -10 5]; region='global'; yr1='0001'; yr2='0020'; nyr=20;
expn='CM4_c96L32_am4g11r11_1860_OMp5_H5_ndiff_meke_MLE30d_ePBLh';
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

expn='CM4_c96L32_am4g11r11_2010_OMp5_H5_ndiff_meke_MLE30d_ePBLh';
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

tpath ='/archive/Ming.Zhao/mdt/20161001/';
latlon=[0 360 -10 5]; region='global'; yr1='0001'; yr2='0020'; nyr=20;
expn='CM4_c96L32_am4g11r14c_1860_OMp5_H5_ndiff_meke_MLE30d_ePBLh';
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

tpath ='/archive/Ming.Zhao/mdt/20160322/';
latlon=[0 360 -10 5]; region='global'; yr1='0001'; yr2='0020'; nyr=20;
expn='CM4_c96L32_am4g10r11_1860_OMp5_lmix_H5_nmle_ndiff_meke_KHTH200';
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

%load and plot%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load and plot%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load and plot%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath ='/archive/Ming.Zhao/mdt/20161026/'; region='global';
expn='CM4_c96L32_am4g10r8_2010_OMp5_mse';
fn=strcat(tpath,expn,'/',expn,'_',region,'_mjo.mat'); load(fn);v=v;


%plotting....
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1500, 1000]*0.8; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; 
%plot(lgd,mean(event.var,1),'k'); hold on;
plot(x, v.io.pcp.comp_iso_avg_n*10,   'k-*'); hold on; grid on; sx='precip'
%plot(x, v.io.u850.comp_iso_avg,  'k--'); grid on;
%plot(x, v.io.u200.comp_iso_avg,  'k-.'); 
%plot(x, v.io.olr.comp_iso_avg,   'k:');
%plot(x, v.io.hf_beg.comp_iso_avg,'r-'); %plot(x,v.io.hf_end.comp_iso_avg_n,'r*:');
%plot(x, v.io.dhf.comp_iso_avg,'b-*'); sy='(dm/dt)-total'
plot(x,v.io.hfint0.comp_iso_avg_n*10, 'k-o'); sy='<MSE> (W/m2)'
plot(x,v.io.hfintn0.comp_iso_avg_n*10,'k-s'); sy='<MSE> (W/m2)'
plot(x,v.io.hdt_tot_int.comp_iso_avg,'b-*'); sy='(dm/dt)-total'
%y1=v.io.hdt_sum_int0.comp_iso_avg; plot(x,y1,'g--');
y0=v.io.hdt_dgz_adj.comp_iso_avg;   plot(x,y0,'r-.'); s0='hdt-dgz-adj';
y1=v.io.tdt_rad_int0.comp_iso_avg;  plot(x,y1,'g-.'); s1='tdt-rad-int';
y2=v.io.tdt_dif_int0.comp_iso_avg;  plot(x,y2,'b-.'); s2='tdt-dif-int';
y3=v.io.qvdt_dif_int0.comp_iso_avg; plot(x,y3,'k-.'); s3='qvdt-dif-int';
y4=v.io.hdt_hadv_int0.comp_iso_avg; plot(x,y4,'c-.'); s4='hdt-hadv-int';
y5=v.io.hdt_vadv_int0.comp_iso_avg; plot(x,y5,'m-.'); s5='hdt-vadv-int';
y6=v.io.hdp_dyn_int0.comp_iso_avg;  plot(x,y6,'y-.'); s6='hdp-dyn-int';
z0=y0+y1+y2+y3+y4+y5+y6;            plot(x,z0,'b-s'); s7='sum';
z1=y4+y5;                           plot(x,z1,'r-d'); s8='adv';
z2=z1+y6;                           plot(x,z2,'g-d'); s9='dyn';
z3=z2+y1+y2+y3;                     plot(x,z3,'c-d'); s10='sum0';
z4=z3+y0;                           plot(x,z4,'k-d'); s11='total';
legend(sx,sy,s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


tpath ='/archive/Ming.Zhao/mdt/20161001/'; region='global';
expn='CM4_c96L32_am4g11r11_2000_OMp5_H5_ndiff_meke_MLE30d_ePBLh';
fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat'); load(fn);v0=v;

tpath ='/archive/Ming.Zhao/mdt/20160322/'; region='equat';
expn='CM4_c96L32_am4g10r8_2000_OMp5_lmix_H5_nmle_ndiff_meke_KHTH200';
fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat'); load(fn);v1=v;

expn='CM4_c96L32_am4g10r14_2000_OMp5_lmix_H5_nmle_ndiff_meke_KHTH200';
fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat'); load(fn);v2=v;

tpath ='/archive/Ming.Zhao/awgom2/ulm_201505/';
expn='AM4OM2F_c96L32_am4g10_2000climo';
fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat'); load(fn);v2=v;

tpath ='/archive/Ming.Zhao/awgom2/ulm_201505/';
expn='AM4OM2F_c96L32_am4g10r8_2000climo'; region='equat';
fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat'); load(fn);v0=v;

tpath ='/archive/Ming.Zhao/mdt/20160322/'; region='equat';
expn='CM4_c96L32_am4g10r8_2000_OMp5_lmix_H5_nmle_ndiff_meke_KHTH200';
fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat'); load(fn);v1=v;

tpath ='/archive/Ming.Zhao/mdt/20160322/'; region='equat';
expn='CM4_c96L32_am4g10r14_2000_OMp5_lmix_H5_nmle_ndiff_meke_KHTH200';
fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat'); load(fn);v2=v;

tpath ='/archive/Ming.Zhao/mdt/20160322/'; region='equat';
expn='CM4_c96L32_am4g10r14_2000_OMp5_lmix_H5_nmle_ndiff_meke_KHTH200';
fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat'); load(fn);v2=v;

tpath ='/archive/Ming.Zhao/mdt/20160629/'; region='equat';
expn='CM4_c96L32_am4g11r5_2000_OMp5_H5_ndiff_meke_MLE30d_ePBLe';
fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat'); load(fn);v3=v;

s=v.io.pcp; vbin=[-0.8:0.1:0.8];
y0=s.lagcorr.org_avg; y1=s.lagcorr.iso_avg;
figure; pcolor(s.lon,s.lgd,y0');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)
figure; pcolor(s.lon,s.lgd,y1');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)

s=v1.io.pcp; vbin=[-0.8:0.1:0.8];
y0=s.lagcorr.org_avg; y1=s.lagcorr.iso_avg;
figure; pcolor(s.lon,s.lgd,y0');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)
figure; pcolor(s.lon,s.lgd,y1');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)

s=v2.io.pcp; vbin=[-0.8:0.1:0.8];
y0=s.lagcorr.org_avg; y1=s.lagcorr.iso_avg;
figure; pcolor(s.lon,s.lgd,y0');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)
figure; pcolor(s.lon,s.lgd,y1');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)

s=v2.io.pcp; vbin=[-0.8:0.1:0.8];
y0=s.lagcorr.org_avg; y1=s.lagcorr.iso_avg;
figure; pcolor(s.lon,s.lgd,y0');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)
figure; pcolor(s.lon,s.lgd,y1');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)

s=v3.io.pcp; vbin=[-0.5:0.1:0.5];
y0=s.lagcorr.org_avg; y1=s.lagcorr.iso_avg;
figure; pcolor(s.lon,s.lgd,y0');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)
figure; pcolor(s.lon,s.lgd,y1');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)
