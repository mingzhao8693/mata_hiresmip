%below opt=1 for writing mat file to /work/miz
%below opt=2 for writing mat file to /archive
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
latlon=[0 360 -90 90];region='global';mod='c96';myr=5; opt=2;
%latlon=[0 360  30 90];region='nhextr';mod='c96';myr=5; opt=2; 
%latlon=[0 360 -30 30];region='tropic';mod='c96';myr=5; opt=2; 
%latlon=[150 250 -5 5]; region='equpac'; nyr=5; myr=1; opt=0;
%read in or generate observation data
%o=readobs(latlon,region,'c48');
fn=strcat('/work/miz/mat_cm4/obs_',region,'_to_c48.mat'); load(fn);
tpath='/archive/Ming.Zhao/awg/warsaw/'; myr=5;
expn='c96L33_am4p0_2010climo';yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_p2K';yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_eis0';yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_eis0_p2K';yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_cgust_off';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_crh_off';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_crh_off0';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L33_am4p0_2010climo_eis1';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_eis2';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_eis3';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_eis4';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='c96L33_am4p0_2010climo_cfrac0';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_cfrac1';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_cfrac2';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_cfrac3';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_rkm_dp1';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_rkm_dp2';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_rkm_dp3';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_rkm_dp4';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load previous anlaysis matfiles%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
fn=strcat('/work/miz/mat_cm4/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat'); 
tpath='/archive/Ming.Zhao/awg/warsaw/';
%CESS and RFP %%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw/';
expn='c96L33_am4p0_2010climo';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v0=v;
expn='c96L33_am4p0_2010climo_p2K';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w0=v;
expn='c96L33_am4p0_1850climo';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c0=v;
expn='c96L33_am4p0_2010aero';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.a0=v;
expn='c96L33_am4p0_1850climo_novol';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c1=v;
%CESS and RFP %%%%%%%%%%%%%%%%%%%%%%%%
%sensitivity to cgust and crh%%%%%%%%%
expn='c96L33_am4p0_2010climo_crh_off';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c10=v;
expn='c96L33_am4p0_2010climo_cgust_off';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c11=v;
%sensitivity to cgust and crh%%%%%%%%%

%CESS sensitivity %%%%%%%%%%%%%%%%%%%%
expn='c96L33_am4p0_2010climo';        fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c0=v;
expn='c96L33_am4p0_2010climo_p2K';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w0=v;
expn='c96L33_am4p0_2010climo_eis0';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c9=v;
expn='c96L33_am4p0_2010climo_eis0_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w9=v;

%Convection sensitivity test%%%%%%%%%%
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
fn=strcat('/work/miz/mat_cm4/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat'); 
tpath='/archive/Ming.Zhao/awg/warsaw/';
expn='c96L33_am4p0_2010climo';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v0=v;

expn='c96L33_am4p0_2010climo_rkm_dp3';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c1=v;
expn='c96L33_am4p0_2010climo_rkm_dp1';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c2=v;
expn='c96L33_am4p0_2010climo_rkm_dp2';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c3=v;
expn='c96L33_am4p0_2010climo_rkm_dp4';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c4=v;
expn='c96L33_am4p0_2010climo_cfrac0'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c5=v;
expn='c96L33_am4p0_2010climo_cfrac1'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c6=v;
expn='c96L33_am4p0_2010climo_cfrac2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c7=v;
expn='c96L33_am4p0_2010climo_cfrac3'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c8=v;
expn='c96L33_am4p0_2010climo_eis3';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c10=v;
expn='c96L33_am4p0_2010climo_eis1';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c11=v;
expn='c96L33_am4p0_2010climo_eis2';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c12=v;
expn='c96L33_am4p0_2010climo_swrad2h';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c15=v;
expn='c96L33_am4p0_2010climo_swrad3h';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c16=v;
expn='c96L33_am4p0_2010climo_p2K';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w0=v;
expn='c96L33_am4p0_2010climo_eis0';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c9=v;
expn='c96L33_am4p0_2010climo_eis0_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w9=v;
mean(am4l.v0.sfc.tref.ts.org_ann)
mean(am4l.c0.sfc.tref.ts.org_ann)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
am4.c0=am4.v0;
z=am4.c0; s=z.s; latx=z.lat; lonx=z.lon; 
lmx=z.lm0; lmx(lmx<=0.5)=0; lmx(lmx>0.5)=1;
vname='crh'; k=1; lon=s.lon; lat=s.lat;
pdfo=o.om500.trop.lwcf.ompdf; obin=o.om500.trop.obinc;
pdf0=am4.c0.om500.trop.lwcf.ompdf;
pdf1=am4.c10.om500.trop.lwcf.ompdf;
lwcfo=o.om500.trop.lwcf.avg; 
lwcf0=am4.c0.om500.trop.lwcf.avg;
lwcf1=am4.c10.om500.trop.lwcf.avg;
swcfo=o.om500.trop.swcf.avg; 
swcf0=am4.c0.om500.trop.swcf.avg;
swcf1=am4.c10.om500.trop.swcf.avg;
pcpo=squeeze(o.sfc.pcp.sea(k,:,:));
pcp0=squeeze(am4.c0.sfc.pcp.sea(k,:,:));
pcp1=squeeze(am4.c10.sfc.pcp.sea(k,:,:));
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
varn='zmt'; xz=[-90 90 100 1000]; mv=-999; 
v=o;      [zmto zmbo rmso]=vslice(v,s,k,varn,'obs',mv);
v=am4.c0; [zmt0 zmb0 rms0]=vslice(v,s,k,varn,'mod',mv);
v=am4.c10;[zmt1 zmb1 rms1]=vslice(v,s,k,varn,'mod',mv);
pms=[ 0, 0, 1200, 700]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; nn=128; cmap=jet(nn);
subplot(row,col,1); cmin=-5; cmax=5; vbin=[cmin:0.1:cmax];
[C,h]=contourf(lon,lat,pcp0-pcp1,vbin); hold on; shading flat; colorbar;
contour(lonx,latx,lmx,'k'); hold on; shading flat; colorbar; 
caxis([-1 1]); colormap(cmap); %clabel(C,h);
subplot(row,col,2); cmin=-1; cmax=1; vbin=[cmin:0.1:cmax];
[C,h]=contourf(lat,pf,zmt0-zmt1,vbin); shading flat; colorbar;
caxis([-1 1]); colormap(cmap); %clabel(C,h);
set(gca,'FontSize',fsize); axis(xz); set(gca,'yDir','reverse'); 
subplot(row,col,3); 
plot(obin,pdfo,'k'); hold on;
plot(obin,pdf0,'r'); hold on;
plot(obin,pdf1,'b'); hold on;
subplot(row,col,4); 
plot(obin,swcfo,'k'); hold on;
plot(obin,swcf0,'r'); hold on;
plot(obin,swcf1,'b'); hold on;



cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen_crhoff'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=am4.v0; am4.g0=v0; x=am4; am4.d=compute_rfp_all(x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g.gb=readsat_giss_gb(); g.nh=readsat_giss_nh(); g.sh=readsat_giss_sh(); 
xo=g.gb.all(1:end-2); to=g.gb.year(1:end-2);
yr1=1881; yr2=1920; vname='SAT_1881_1920';
id=(to>=yr1)&(to<=yr2); xo=xo-mean(xo(id));
s1='LAMIP';
s2='LAMIP1850RAD';
s3='LAMIP minus LAMIP1850RAD';
pms=[ 0, 0, 1000, 800]*1.3; fsize=12; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; t=[1:145]+1870-1;
subplot(row,col,1); tmin=1870; tmax=2015; 
x0=am4l.v0.sfc.tref.ts.org_ann-286.5;
x1=am4l.c0.sfc.tref.ts.org_ann-286.5;
id=(t>=yr1)&(t<=yr2); x0=x0-mean(x0(id)); x1=x1-mean(x1(id));
plot(to,xo,   'k','LineWidth',lw); hold on;
plot(t, x0,   'b','LineWidth',lw); hold on;
plot(t, x1,   'g','LineWidth',lw); hold on;
plot(t, x0-x1,'r','LineWidth',lw*2); hold on;
xlabel('years','FontSize',fsize); legend('GISS',s1,s2,s3,2);
ylabel('anomalous surface air temperature (K)','FontSize',fsize); 
xy=[tmin tmax -0.3 1.2]; mylabel(xy,1,'(a)',fsize); 
set(gca,'FontSize',fsize); 
subplot(row,col,2); tmin=1870; tmax=2015;
x0=am4l.v0.toa.netrad.ts.org_ann;
x1=am4l.c0.toa.netrad.ts.org_ann;
plot(t, x0,   'b','LineWidth',lw); hold on;
plot(t, x1,   'g','LineWidth',lw); hold on;
plot(t, x0-x1,'r','LineWidth',lw*2); hold on;
xlabel('years','FontSize',fsize); %legend(s1,s2,s3,2);
ylabel('TOA net downward radiative fluxes (W/m2)','FontSize',fsize); 
xy=[tmin tmax -3.5 3.5]; mylabel(xy,1,'(b)',fsize); 
set(gca,'FontSize',fsize); 
subplot(row,col,3);
x0=am4l.v0.toa.lwnet.ts.org_ann-240.;
x1=am4l.c0.toa.lwnet.ts.org_ann-240;
plot(t, x0,   'b','LineWidth',lw); hold on;
plot(t, x1,   'g','LineWidth',lw); hold on;
plot(t, x0-x1,'r','LineWidth',lw*2); hold on;
xlabel('years','FontSize',fsize); %legend(s1,s2,s3,2);
ylabel('TOA net outgoing LW radiative fluxes (W/m2)','FontSize',fsize); 
xy=[tmin tmax -3.5 3.5]; mylabel(xy,1,'(c)',fsize); 
set(gca,'FontSize',fsize); 
subplot(row,col,4);
x0=am4l.v0.toa.swnet.ts.org_ann-240.;
x1=am4l.c0.toa.swnet.ts.org_ann-240;
plot(t, x0,   'b','LineWidth',lw); hold on;
plot(t, x1,   'g','LineWidth',lw); hold on;
plot(t, x0-x1,'r','LineWidth',lw*2); hold on;
xlabel('years','FontSize',fsize); %legend(s1,s2,s3,2);
ylabel('TOA net downward SW radiative fluxes (W/m2)','FontSize',fsize); 
xy=[tmin tmax -3.5 3.5]; mylabel(xy,1,'(d)',fsize); 
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_am4/';  expn='AM4p0_lamip'; vname='netradtoa';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='eis_bony_dcre';
ob=am4.c0.om500.trop.obinc;
x=am4.c0.om500.trop_ocean; 
p1=x.swcf.ompdf; x1=x.lwcf.avg; y1=x.swcf.avg; z1=x.ttcf.avg;
x=am4.w0.om500.trop_ocean; 
p2=x.swcf.ompdf; x2=x.lwcf.avg; y2=x.swcf.avg; z2=x.ttcf.avg;
x=am4.c9.om500.trop_ocean;
p3=x.swcf.ompdf; x3=x.lwcf.avg; y3=x.swcf.avg; z3=x.ttcf.avg;
x=am4.w9.om500.trop_ocean;
p4=x.swcf.ompdf; x4=x.lwcf.avg; y4=x.swcf.avg; z4=x.ttcf.avg;
pms=[ 0, 0, 1200, 800]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-2; cmax=2; vbin=[cmin:0.2:cmax];
subplot(row,col,1); xmin=-130; xmax=90;
plot(ob,p2-p1,'-r*'); hold on; 
plot(ob,p4-p3,'-bs'); hold on; 
legend('AM4.0-C0','AM4.0-C9',2)
xlabel('\omega_{500}','FontSize',fsize); 
ylabel('\Delta PDF(\omega_{500})', 'FontSize',fsize);
xy=[xmin xmax -0.05 0.05]; mylabel(xy,1,'(a)',fsize); 
set(gca,'FontSize',fsize); 
subplot(row,col,2); 
plot(ob,x2-x1,'-r*'); hold on; 
plot(ob,x4-x3,'-bs'); hold on; 
legend('AM4.0-C0','AM4.0-C9',2)
xlabel('\omega_{500}','FontSize',fsize); 
ylabel('LW CRE (\omega_{500})', 'FontSize',fsize);
xy=[xmin xmax -10 10]; mylabel(xy,1,'(b)',fsize); 
set(gca,'FontSize',fsize); 
subplot(row,col,3); 
plot(ob,y2-y1,'-r*'); hold on; 
plot(ob,y4-y3,'-bs'); hold on; 
legend('AM4.0-C0','AM4.0-C9',4)
xlabel('\omega_{500}','FontSize',fsize); 
ylabel('SW CRE (\omega_{500})', 'FontSize',fsize);
xy=[xmin xmax -10 10]; mylabel(xy,1,'(c)',fsize); 
set(gca,'FontSize',fsize); 
subplot(row,col,4); 
plot(ob,z2-z1,'-r*'); hold on; 
plot(ob,z4-z3,'-bs'); hold on; 
legend('AM4.0-C0','AM4.0-C9',2)
xlabel('\omega_{500}','FontSize',fsize); 
ylabel('total CRE (\omega_{500})', 'FontSize',fsize);
xy=[xmin xmax -10 10]; mylabel(xy,1,'(d)',fsize); 
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='eis_bony_cre';
ob=am4.c0.om500.trop.obinc;
x=o.om500.trop_ocean;
po=x.swcf.ompdf; 
xo=x.lwcf.avg; yo=x.swcf.avg; zo=x.ttcf.avg;
dx=x.lwcf.std; dy=x.swcf.std; dz=x.ttcf.std;
x=am4.c0.om500.trop_ocean; 
p1=x.swcf.ompdf; x1=x.lwcf.avg; y1=x.swcf.avg; z1=x.ttcf.avg;
x=am4.c9.om500.trop_ocean;
p2=x.swcf.ompdf; x2=x.lwcf.avg; y2=x.swcf.avg; z2=x.ttcf.avg;
pms=[ 0, 0, 1200, 800]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-2; cmax=2; vbin=[cmin:0.2:cmax];
subplot(row,col,1); xmin=-130; xmax=90;
plot(ob,p1,'-r*'); hold on; 
plot(ob,p2,'-bs'); hold on; 
plot(ob,po,'-ko'); hold on; 
legend('AM4.0-C0','AM4.0-C9','ERA-INTERIM',2)
xlabel('\omega_{500}','FontSize',fsize); 
ylabel('PDF(\omega_{500})', 'FontSize',fsize);
xy=[xmin xmax 0 0.25]; mylabel(xy,1,'(a)',fsize); 
set(gca,'FontSize',fsize); 
subplot(row,col,2); 
plot(ob,x1,'-r*'); hold on; 
plot(ob,x2,'-bs'); hold on; 
plot(ob,xo,'-ko'); hold on; 
for i=1:length(ob)
  plot([ob(i) ob(i)],[xo(i)-dx(i) xo(i)+dx(i)],'-k'); hold on;
end
legend('AM4.0-C0','AM4.0-C9','ERA-INTERIM + CERES',2)
xlabel('\omega_{500}','FontSize',fsize); 
ylabel('LW CRE (\omega_{500})', 'FontSize',fsize);
xy=[xmin xmax 0 130]; mylabel(xy,1,'(b)',fsize); 
set(gca,'FontSize',fsize); 
subplot(row,col,3); 
plot(ob,y1,'-r*'); hold on; 
plot(ob,y2,'-bs'); hold on; 
plot(ob,yo,'-ko'); hold on; 
for i=1:length(ob)
  plot([ob(i) ob(i)],[yo(i)-dy(i) yo(i)+dy(i)],'-k'); hold on;
end
legend('AM4.0-C0','AM4.0-C9','ERA-INTERIM + CERES',4)
xlabel('\omega_{500}','FontSize',fsize); 
ylabel('SW CRE (\omega_{500})', 'FontSize',fsize);
xy=[xmin xmax -140 -10]; mylabel(xy,1,'(c)',fsize); 
set(gca,'FontSize',fsize); 
subplot(row,col,4); 
plot(ob,z1,'-r*'); hold on; 
plot(ob,z2,'-bs'); hold on; 
plot(ob,zo,'-ko'); hold on; 
for i=1:length(ob)
  plot([ob(i) ob(i)],[zo(i)-dz(i) zo(i)+dz(i)],'-k'); hold on;
end
legend('AM4.0-C0','AM4.0-C9','ERA-INTERIM + CERES',2)
xlabel('\omega_{500}','FontSize',fsize); 
ylabel('total CRE (\omega_{500})', 'FontSize',fsize);
xy=[xmin xmax -70 60]; mylabel(xy,1,'(d)',fsize); 
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



ombin=am4.c0.om500.trop.obinc;
yo=o.om500.trop_ocean.swcf.avg;      zo=am4.c0.om500.trop_ocean.swcf.std; 
y1=am4.c0.om500.trop_ocean.swcf.avg; z1=am4.c0.om500.trop_ocean.swcf.std; 
y3=am4.c9.om500.trop_ocean.swcf.avg;
figure; 
plot(ombin,yo,'-r*'); hold on;
for i=1:length(ombin)
  plot([ombin(i) ombin(i)],[yo(i)-zo(i) yo(i)+zo(i)],'-r'); hold on;
end
plot(ombin,y1,'-gs'); hold on; 
plot(ombin,y3,'-bo'); hold on; 
plot(ombin,y0,'-kd'); hold on; 

ombin=am4.c0.om500.trop.obinc;
yo=o.om500.trop_ocean.lwcf.avg;
y1=am4.c0.om500.trop_ocean.lwcf.avg;
y3=am4.c9.om500.trop_ocean.lwcf.avg;
figure; 
plot(ombin,yo,'-r*'); hold on; 
plot(ombin,y1,'-gs'); hold on; 
plot(ombin,y3,'-bo'); hold on; 

ombin=am4.c0.om500.trop.obinc;
yo=o.om500.trop_ocean.ttcf.avg;
y1=am4.c0.om500.trop_ocean.ttcf.avg;
y3=am4.c9.om500.trop_ocean.ttcf.avg;
figure; 
plot(ombin,yo,'-r*'); hold on; 
plot(ombin,y1,'-gs'); hold on; 
plot(ombin,y3,'-bo'); hold on; 

figure; 
plot(ombin,p2-p1,'-b'); hold on; 
plot(ombin,p4-p3,'-r'); grid on;
figure; 
plot(ombin,p1,'-b');  hold on; plot(ombin,p2,'-r'); 
plot(ombin,p3,'--b'); hold on; plot(ombin,p4,'--r'); 

x1=am4.c0.om500.trop_ocean.swcf.avg; 
x2=am4.w0.om500.trop_ocean.swcf.avg;
x3=am4.c9.om500.trop_ocean.swcf.avg; 
x4=am4.w9.om500.trop_ocean.swcf.avg;

figure; 
plot(ombin,x1,'-b');  hold on; plot(ombin,x3,'-r')
plot(ombin,x2,'--b'); hold on; plot(ombin,x4,'--r')
figure; 
plot(ombin,x2-x1,'-b*'); hold on;
plot(ombin,x4-x3,'-r*'); hold on;

figure; plot(ombin,x1-x0,'-b*');

[mean(am4.c0.toa.ttcf.ann_stat.mmen.all) ...
 mean(am4.c1.toa.ttcf.ann_stat.mmen.all) ...
 mean(am4.c2.toa.ttcf.ann_stat.mmen.all) ...
 mean(am4.c3.toa.ttcf.ann_stat.mmen.all) ...

[mean(am4.c0.toa.ttcf.ann_stat.mmen.all) ...
 mean(am4.c1.toa.ttcf.ann_stat.mmen.all) ...
 mean(am4.c2.toa.ttcf.ann_stat.mmen.all) ...
 mean(am4.c3.toa.ttcf.ann_stat.mmen.all) ...
 mean(am4.c4.toa.ttcf.ann_stat.mmen.all) ...
 mean(am4.c5.toa.ttcf.ann_stat.mmen.all) ...
 mean(am4.c6.toa.ttcf.ann_stat.mmen.all) ...
 mean(am4.c7.toa.ttcf.ann_stat.mmen.all) ...
 mean(am4.c8.toa.ttcf.ann_stat.mmen.all) ...
 mean(am4.c9.toa.ttcf.ann_stat.mmen.all)]

[mean(am4.c0.toa.swcf.ann_stat.mmen.all) ...
 mean(am4.c1.toa.swcf.ann_stat.mmen.all) ...
 mean(am4.c2.toa.swcf.ann_stat.mmen.all) ...
 mean(am4.c3.toa.swcf.ann_stat.mmen.all) ...
 mean(am4.c4.toa.swcf.ann_stat.mmen.all) ...
 mean(am4.c5.toa.swcf.ann_stat.mmen.all) ...
 mean(am4.c6.toa.swcf.ann_stat.mmen.all) ...
 mean(am4.c7.toa.swcf.ann_stat.mmen.all) ...
 mean(am4.c8.toa.swcf.ann_stat.mmen.all) ...
 mean(am4.c9.toa.swcf.ann_stat.mmen.all)]

[mean(am4.c0.toa.lwcf.ann_stat.mmen.all) ...
 mean(am4.c1.toa.lwcf.ann_stat.mmen.all) ...
 mean(am4.c2.toa.lwcf.ann_stat.mmen.all) ...
 mean(am4.c3.toa.lwcf.ann_stat.mmen.all) ...
 mean(am4.c4.toa.lwcf.ann_stat.mmen.all) ...
 mean(am4.c5.toa.lwcf.ann_stat.mmen.all) ...
 mean(am4.c6.toa.lwcf.ann_stat.mmen.all) ...
 mean(am4.c7.toa.lwcf.ann_stat.mmen.all) ...
 mean(am4.c8.toa.lwcf.ann_stat.mmen.all) ...
 mean(am4.c9.toa.lwcf.ann_stat.mmen.all)]

[mean(am4.c0.toa.lwnet.ann_stat.mmen.all) ...
 mean(am4.c1.toa.lwnet.ann_stat.mmen.all) ...
 mean(am4.c2.toa.lwnet.ann_stat.mmen.all) ...
 mean(am4.c3.toa.lwnet.ann_stat.mmen.all) ...
 mean(am4.c4.toa.lwnet.ann_stat.mmen.all) ...
 mean(am4.c5.toa.lwnet.ann_stat.mmen.all) ...
 mean(am4.c6.toa.lwnet.ann_stat.mmen.all) ...
 mean(am4.c7.toa.lwnet.ann_stat.mmen.all) ...
 mean(am4.c8.toa.lwnet.ann_stat.mmen.all) ...
 mean(am4.c9.toa.lwnet.ann_stat.mmen.all)]

[mean(am4.c0.toa.swnet.ann_stat.mmen.all) ...
 mean(am4.c1.toa.swnet.ann_stat.mmen.all) ...
 mean(am4.c2.toa.swnet.ann_stat.mmen.all) ...
 mean(am4.c3.toa.swnet.ann_stat.mmen.all) ...
 mean(am4.c4.toa.swnet.ann_stat.mmen.all) ...
 mean(am4.c5.toa.swnet.ann_stat.mmen.all) ...
 mean(am4.c6.toa.swnet.ann_stat.mmen.all) ...
 mean(am4.c7.toa.swnet.ann_stat.mmen.all) ...
 mean(am4.c8.toa.swnet.ann_stat.mmen.all) ...
 mean(am4.c9.toa.swnet.ann_stat.mmen.all)]

[mean(am4.c0.toa.netrad.ann_stat.mmen.all) ...
 mean(am4.c1.toa.netrad.ann_stat.mmen.all) ...
 mean(am4.c2.toa.netrad.ann_stat.mmen.all) ...
 mean(am4.c3.toa.netrad.ann_stat.mmen.all) ...
 mean(am4.c4.toa.netrad.ann_stat.mmen.all) ...
 mean(am4.c5.toa.netrad.ann_stat.mmen.all) ...
 mean(am4.c6.toa.netrad.ann_stat.mmen.all) ...
 mean(am4.c7.toa.netrad.ann_stat.mmen.all) ...
 mean(am4.c8.toa.netrad.ann_stat.mmen.all) ...
 mean(am4.c9.toa.netrad.ann_stat.mmen.all)]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0; s.nlon=z.nlon
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dqal'; k=1; vname=strcat('eis_',vname);
xo=squeeze(o.atm.qal.sea(k,:,:))*100.;
x1=squeeze(am4.c0.atm.qal.sea(k,:,:)); 
x2=squeeze(am4.w0.atm.qal.sea(k,:,:)); s.s1='(a) AM4.0-C0 (P2K-CNTL)';
x3=squeeze(am4.c9.atm.qal.sea(k,:,:)); s.s2='(b) AM4.0-C9 (P2K-CNTL)';
x4=squeeze(am4.w9.atm.qal.sea(k,:,:)); s.s3='(c) (a) minus (b)';
z1=x2-x1; z2=x4-x3; z3=z1-z2;
s.lonx=s.lonx-180; s.lmx=circshift(s.lmx,[0 s.nlon/2]);
s.lon=s.lon-180; nx=length(z1(1,:))/2;
z1=circshift(z1,[0 nx]); z2=circshift(z2,[0 nx]); z3=circshift(z3,[0 nx]);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen'; f=0.5; ncolor=64
plot_3panel_am4(s,z1,z2,z3,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0; s.nlon=z.nlon
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dswcf'; k=1; vname=strcat('eis_',vname);
xo=squeeze(o.toa.swcf.sea(k,:,:))*100.;
x1=squeeze(am4.c0.toa.swcf.sea(k,:,:)); 
x2=squeeze(am4.w0.toa.swcf.sea(k,:,:)); s.s1='(a) AM4.0-C0 (P2K-CNTL)';
x3=squeeze(am4.c9.toa.swcf.sea(k,:,:)); s.s2='(b) AM4.0-C9 (P2K-CNTL)';
x4=squeeze(am4.w9.toa.swcf.sea(k,:,:)); s.s3='(c) (a) minus (b)';
z1=x2-x1; z2=x4-x3; z3=z1-z2;
s.lonx=s.lonx-180; s.lmx=circshift(s.lmx,[0 s.nlon/2]);
s.lon=s.lon-180; nx=length(z1(1,:))/2;
z1=circshift(z1,[0 nx]); z2=circshift(z2,[0 nx]); z3=circshift(z3,[0 nx]);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen'; f=0.5; ncolor=64
plot_3panel_am4(s,z1,z2,z3,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0; s.nlon=z.nlon
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qal'; k=1; vname=strcat('eis_',vname);
xo=squeeze(o.atm.qal.sea(k,:,:))*100.;
x0=squeeze(am4.c0.atm.qal.sea(k,:,:));  s.s1='(a) AM4.0-C0 (ANN)';
x1=squeeze(am4.c9.atm.qal.sea(k,:,:));  s.s2='(b) AM4.0-C9 (ANN)';
z1=x0; z2=x1; z3=x0-x1;                 s.s3='(c) AM4.0-C0 minus AM4.0-C9';
s.lonx=s.lonx-180; s.lmx=circshift(s.lmx,[0 s.nlon/2]);
s.lon=s.lon-180; nx=length(z1(1,:))/2;
z1=circshift(z1,[0 nx]); z2=circshift(z2,[0 nx]); z3=circshift(z3,[0 nx]);
cmin=-100; cmax=100; vbin=[cmin:(cmax-cmin)/200:cmax];
fpath='./fig_am4/'; expn='AM4sen'; f=0.1; ncolor=64
plot_3panel_am4(s,z1,z2,z3,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0; s.nlon=z.nlon
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcf'; k=1; vname=strcat('eis_',vname);
xo=squeeze(o.toa.swcf.sea(k,:,:));
x0=squeeze(am4.c0.toa.swcf.sea(k,:,:));  s.s1='(a) AM4.0-C0 (ANN)';
x1=squeeze(am4.c9.toa.swcf.sea(k,:,:));  s.s2='(b) AM4.0-C9 (ANN)';
z1=x0; z2=x1; z3=x0-x1;                 s.s3='(c) AM4.0-C0 minus AM4.0-C9';
s.lonx=s.lonx-180; s.lmx=circshift(s.lmx,[0 s.nlon/2]);
s.lon=s.lon-180; nx=length(z1(1,:))/2;
z1=circshift(z1,[0 nx]); z2=circshift(z2,[0 nx]); z3=circshift(z3,[0 nx]);
cmin=-100; cmax=100; vbin=[cmin:(cmax-cmin)/200:cmax];
fpath='./fig_am4/'; expn='AM4sen'; f=0.1; ncolor=64
plot_3panel_am4(s,z1,z2,z3,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qal'; k=1; vname=strcat('eis_',vname);
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.atm.qal.sea(k,:,:));  s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c9.atm.qal.sea(k,:,:));  s.s1='(a) AM4.0-C9  minus AM4.0-C0';
x2=squeeze(am4.c10.atm.qal.sea(k,:,:)); s.s2='(b) AM4.0-C10 minus AM4.0-C0';
x3=squeeze(am4.c11.atm.qal.sea(k,:,:)); s.s3='(c) AM4.0-C11 minus AM4.0-C0';
x4=squeeze(am4.c11.atm.qal.sea(k,:,:)); s.s4='(d) AM4.0-C12 minus AM4.0-C0';
%z1=x0; z2=x1; z3=x2; z4=x4;  
z1=x0; z2=x1-x0; z3=x2-x0; z4=x3-x0;  
cmin=-70; cmax=70; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen'; f=0.2; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcf'; k=1;
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.toa.swcf.sea_bias(k,:,:));  s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c9.toa.swcf.sea_bias(k,:,:));  s.s1='(a) AM4.0-C9  minus AM4.0-C0';
x2=squeeze(am4.c10.toa.swcf.sea_bias(k,:,:)); s.s2='(b) AM4.0-C10 minus AM4.0-C0';
x3=squeeze(am4.c11.toa.swcf.sea_bias(k,:,:)); s.s3='(c) AM4.0-C11 minus AM4.0-C0';
x4=squeeze(am4.c11.toa.swcf.sea_bias(k,:,:)); s.s4='(d) AM4.0-C12 minus AM4.0-C0';
%z1=x0; z2=x1; z3=x2; z4=x4;  
z1=x1-x0; z2=x2-x0; z3=x3-x0; z4=x3-x0;  
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='AM4sen_rkmdp'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swabs'; k=1;
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.toa.swnet.sea_bias(k,:,:));  s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c9.toa.swnet.sea_bias(k,:,:));  s.s1='(a) AM4.0-C9  minus AM4.0-C0';
x2=squeeze(am4.c10.toa.swnet.sea_bias(k,:,:)); s.s2='(b) AM4.0-C10 minus AM4.0-C0';
x3=squeeze(am4.c11.toa.swnet.sea_bias(k,:,:)); s.s3='(c) AM4.0-C11 minus AM4.0-C0';
x4=squeeze(am4.c11.toa.swnet.sea_bias(k,:,:)); s.s4='(d) AM4.0-C12 minus AM4.0-C0';
%z1=x0; z2=x1; z3=x2; z4=x4;  
z1=x1-x0; z2=x2-x0; z3=x3-x0; z4=x3-x0;  
cmin=-20; cmax=20; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='AM4sen_rkmdp'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=[am4.c0.sfc.pcp.ann_stat.mmen.trop(1) am4.c1.sfc.pcp.ann_stat.mmen.trop(1)...
   am4.c2.sfc.pcp.ann_stat.mmen.trop(1) am4.c3.sfc.pcp.ann_stat.mmen.trop(1)...
   am4.c4.sfc.pcp.ann_stat.mmen.trop(1)]
x=[am4.c0.sfc.pcp.ann_stat.mmen.all(1) am4.c1.sfc.pcp.ann_stat.mmen.all(1)...
   am4.c2.sfc.pcp.ann_stat.mmen.all(1) am4.c3.sfc.pcp.ann_stat.mmen.all(1)...
   am4.c4.sfc.pcp.ann_stat.mmen.all(1)]
1-max(x)/mean(x)
1-min(x)/mean(x)

z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='cfrac_h700'; k=1;
v=am4.c0.atm; x0=squeeze(v.h700.sea(k,:,:)-v.h925.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
v=am4.c1.atm; x1=squeeze(v.h700.sea(k,:,:)-v.h925.sea(k,:,:)); s.s1='AM4.0-C0 (ANN)';
v=am4.c2.atm; x2=squeeze(v.h700.sea(k,:,:)-v.h925.sea(k,:,:)); s.s2='AM4.0-C0 (ANN)';
v=am4.c3.atm; x3=squeeze(v.h700.sea(k,:,:)-v.h925.sea(k,:,:)); s.s3='AM4.0-C0 (ANN)';
v=am4.c4.atm; x4=squeeze(v.h700.sea(k,:,:)-v.h925.sea(k,:,:)); s.s4='AM4.0-C0 (ANN)';
z1=(x1-x0); z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-2000; cmax=2000; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen_rkmdp'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4sen_rkmdp_zmh%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmh'; ss={'ANN','MAM','JJA','SON','DJF'};
vname=strcat('rkmdp_',varn,(ss{k}));
vname=strcat(varn,(ss{k}));
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4.c0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=am4.c0; [z0]=vslice_mod(v,s,k,varn,'obs',mv);
v=am4.c1; [z1]=vslice_mod(v,s,k,varn,'mod',mv);
v=am4.c2; [z2]=vslice_mod(v,s,k,varn,'mod',mv);
v=am4.c3; [z3]=vslice_mod(v,s,k,varn,'mod',mv);
v=am4.c4; [z4]=vslice_mod(v,s,k,varn,'mod',mv);
z1=(z1-z0)/CPD; z2=(z2-z0)/CPD; z3=(z3-z0)/CPD; z4=(z4-z0)/CPD; 
d=isnan(z1);
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-2; cmax=2; vbin=[cmin:0.2:cmax];
subplot(row,col,1); 
[C,h]=contourf(lat,pf,z1,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
nn=64; cmap=jet(nn); colormap(cmap);
mt=strcat('(a) AM4.0-C1 minus AM4.0-C0');
title(mt,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
axis(xy); set(gca,'yDir','reverse'); 
subplot(row,col,2); 
[C,h]=contourf(lat,pf,z2,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(b) AM4.0-C2 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,3); 
[C,h]=contourf(lat,pf,z3,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(c) AM4.0-C3 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lat,pf,z4,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(d) AM4.0-C4 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4sen_cfrac_zmh%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmh'; ss={'ANN','MAM','JJA','SON','DJF'};
vname=strcat('rkmdp_',varn,(ss{k}));
vname=strcat(varn,(ss{k}));
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4.c0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=am4.c0; [z0]=vslice_mod(v,s,k,varn,'obs',mv);
v=am4.c5; [z1]=vslice_mod(v,s,k,varn,'mod',mv);
v=am4.c6; [z2]=vslice_mod(v,s,k,varn,'mod',mv);
v=am4.c7; [z3]=vslice_mod(v,s,k,varn,'mod',mv);
v=am4.c8; [z4]=vslice_mod(v,s,k,varn,'mod',mv);
z1=(z1-z0)/CPD; z2=(z2-z0)/CPD; z3=(z3-z0)/CPD; z4=(z4-z0)/CPD; 
d=isnan(z1);
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-2; cmax=2; vbin=[cmin:0.2:cmax];
subplot(row,col,1); 
[C,h]=contourf(lat,pf,z1,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
nn=64; cmap=jet(nn); colormap(cmap);
mt=strcat('(a) AM4.0-C5 minus AM4.0-C0');
title(mt,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
axis(xy); set(gca,'yDir','reverse'); 
subplot(row,col,2); 
[C,h]=contourf(lat,pf,z2,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(b) AM4.0-C6 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,3); 
[C,h]=contourf(lat,pf,z3,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(c) AM4.0-C7 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lat,pf,z4,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(d) AM4.0-C8 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4sen_rkmdp_zmrh%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmrh'; ss={'ANN','MAM','JJA','SON','DJF'};
vname=strcat('rkmdp_',varn,(ss{k}));
vname=strcat(varn,(ss{k}));
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4.c0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=am4.c0; [z0]=vslice_mod(v,s,k,varn,'obs',mv);
v=am4.c1; [z1]=vslice_mod(v,s,k,varn,'mod',mv);
v=am4.c2; [z2]=vslice_mod(v,s,k,varn,'mod',mv);
v=am4.c3; [z3]=vslice_mod(v,s,k,varn,'mod',mv);
v=am4.c4; [z4]=vslice_mod(v,s,k,varn,'mod',mv);
z1=z1-z0; z2=z2-z0; z3=z3-z0; z4=z4-z0; 
d=isnan(z1);
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-5; cmax=5; vbin=[cmin:0.5:cmax];
subplot(row,col,1); 
[C,h]=contourf(lat,pf,z1,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
nn=64; cmap=jet(nn); colormap(cmap);
mt=strcat('(a) AM4.0-C1 minus AM4.0-C0');
title(mt,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
axis(xy); set(gca,'yDir','reverse'); 
subplot(row,col,2); 
[C,h]=contourf(lat,pf,z2,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(b) AM4.0-C2 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,3); 
[C,h]=contourf(lat,pf,z3,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(c) AM4.0-C3 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lat,pf,z4,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(d) AM4.0-C4 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4sen_rkmdp_zmrh%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmrh'; ss={'ANN','MAM','JJA','SON','DJF'};
vname=strcat('cfrac_',varn,(ss{k}));
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4.c0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=am4.c0; [z0]=vslice_mod(v,s,k,varn,'obs',mv);
v=am4.c5; [z1]=vslice_mod(v,s,k,varn,'mod',mv);
v=am4.c6; [z2]=vslice_mod(v,s,k,varn,'mod',mv);
v=am4.c7; [z3]=vslice_mod(v,s,k,varn,'mod',mv);
v=am4.c8; [z4]=vslice_mod(v,s,k,varn,'mod',mv);
z1=z1-z0; z2=z2-z0; z3=z3-z0; z4=z4-z0; 
d=isnan(z1);
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-5; cmax=5; vbin=[cmin:0.5:cmax];
subplot(row,col,1); 
[C,h]=contourf(lat,pf,z1,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
nn=64; cmap=jet(nn); colormap(cmap);
mt=strcat('(a) AM4.0-C5 minus AM4.0-C0');
title(mt,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
axis(xy); set(gca,'yDir','reverse'); 
subplot(row,col,2); 
[C,h]=contourf(lat,pf,z2,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(b) AM4.0-C6 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,3); 
[C,h]=contourf(lat,pf,z3,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(c) AM4.0-C7 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lat,pf,z4,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(d) AM4.0-C8 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4sen_rkmdp_zmu%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmu'; ss={'ANN','MAM','JJA','SON','DJF'};
vname=strcat('rkmdp_',varn,(ss{k}));
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4.c0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=am4.c0; [z0 b0 rms0]=vslice(v,s,k,varn,'obs',mv);
v=am4.c1; [z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv);
v=am4.c2; [z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv);
v=am4.c3; [z3 b3 rms3]=vslice(v,s,k,varn,'mod',mv);
v=am4.c4; [z4 b4 rms4]=vslice(v,s,k,varn,'mod',mv);
z1=z1-z0; z2=z2-z0; z3=z3-z0; z4=z4-z0; 
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-2; cmax=2; vbin=[cmin:0.5:cmax];
subplot(row,col,1); 
[C,h]=contourf(lat,pf,z1,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
nn=64; cmap=jet(nn); colormap(cmap);
mt=strcat('(a) AM4.0-C1 minus AM4.0-C0');
title(mt,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
axis(xy); set(gca,'yDir','reverse'); 
subplot(row,col,2); 
[C,h]=contourf(lat,pf,z2,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(b) AM4.0-C2 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,3); 
[C,h]=contourf(lat,pf,z3,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(c) AM4.0-C3 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lat,pf,z4,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(d) AM4.0-C4 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4sen_rkmdp_zmt%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=3; varn='zmt'; ss={'ANN','MAM','JJA','SON','DJF'};
vname=strcat('rkmdp_',varn,(ss{k}));
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4.c0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=am4.c0; [z0 b0 rms0]=vslice(v,s,k,varn,'obs',mv);
v=am4.c1; [z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv);
v=am4.c2; [z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv);
v=am4.c3; [z3 b3 rms3]=vslice(v,s,k,varn,'mod',mv);
v=am4.c4; [z4 b4 rms4]=vslice(v,s,k,varn,'mod',mv);
id=isnan(z1); zo(id)=NaN; b1(id)=NaN; %b2(id)=NaN; b3(id)=NaN;
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-1; cmax=1; vbin=[cmin:0.2:cmax];
subplot(row,col,1); c1=-1; c2=1; vbino=[c1:10:c2];
[C,h]=contourf(lat,pf,z1-z0,vbin); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h); 
nn=64; cmap=jet(nn); colormap(cmap);
mt=strcat('(a) AM4.0-C1 minus AM4.0-C0');
title(mt,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
axis(xy); set(gca,'yDir','reverse'); 
subplot(row,col,2); 
[C,h]=contourf(lat,pf,z2-z0,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(b) AM4.0-C2 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,3); 
[C,h]=contourf(lat,pf,z3-z0,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(c) AM4.0-C3 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lat,pf,z4-z0,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(d) AM4.0-C4 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4sen_cfrac_zmt%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmt'; ss={'ANN','MAM','JJA','SON','DJF'};
vname=strcat('cfrac_',varn,(ss{k}));
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4.c0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=am4.c0; [z0 b0 rms0]=vslice(v,s,k,varn,'obs',mv);
v=am4.c5; [z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv);
v=am4.c6; [z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv);
v=am4.c7; [z3 b3 rms3]=vslice(v,s,k,varn,'mod',mv);
v=am4.c8; [z4 b4 rms4]=vslice(v,s,k,varn,'mod',mv);
z1=z1-z0; z2=z2-z0; z3=z3-z0; z4=z4-z0; 
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-1.; cmax=1.; vbin=[cmin:0.1:cmax];
subplot(row,col,1); z1(z1<-1)=-1;
[C,h]=contourf(lat,pf,z1,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
nn=64; cmap=jet(nn); colormap(cmap);
mt=strcat('(a) AM4.0-C5 minus AM4.0-C0');
title(mt,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
axis(xy); set(gca,'yDir','reverse'); 
subplot(row,col,2); 
[C,h]=contourf(lat,pf,z2,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(b) AM4.0-C6 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,3); 
[C,h]=contourf(lat,pf,z3,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(c) AM4.0-C7 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lat,pf,z4,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(d) AM4.0-C8 minus AM4.0-C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rkmdp_h925'; k=1;
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.atm.h925.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c1.atm.h925.sea(k,:,:)); s.s1='(a) AM4.0-C1 minus AM4.0-C0';
x2=squeeze(am4.c2.atm.h925.sea(k,:,:)); s.s2='(b) AM4.0-C2 minus AM4.0-C0';
x3=squeeze(am4.c3.atm.h925.sea(k,:,:)); s.s3='(c) AM4.0-C3 minus AM4.0-C0';
x4=squeeze(am4.c4.atm.h925.sea(k,:,:)); s.s4='(d) AM4.0-C4 minus AM4.0-C0';
z1=x1-x0; z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-1000; cmax=1000; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen_rkmdp'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rkmdp_h700'; k=1;
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.atm.h700.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c1.atm.h700.sea(k,:,:)); s.s1='(a) AM4.0-C5 minus AM4.0-C0';
x2=squeeze(am4.c2.atm.h700.sea(k,:,:)); s.s2='(b) AM4.0-C6 minus AM4.0-C0';
x3=squeeze(am4.c3.atm.h700.sea(k,:,:)); s.s3='(c) AM4.0-C7 minus AM4.0-C0';
x4=squeeze(am4.c4.atm.h700.sea(k,:,:)); s.s4='(d) AM4.0-C8 minus AM4.0-C0';
z1=(x1-x0); z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-2000; cmax=2000; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen_rkmdp'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='cfrac_h700'; k=1;
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.atm.h700.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c5.atm.h700.sea(k,:,:)); s.s1='(a) AM4.0-C5 minus AM4.0-C0';
x2=squeeze(am4.c6.atm.h700.sea(k,:,:)); s.s2='(b) AM4.0-C6 minus AM4.0-C0';
x3=squeeze(am4.c7.atm.h700.sea(k,:,:)); s.s3='(c) AM4.0-C7 minus AM4.0-C0';
x4=squeeze(am4.c8.atm.h700.sea(k,:,:)); s.s4='(d) AM4.0-C8 minus AM4.0-C0';
z1=(x1-x0); z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-2000; cmax=2000; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen_rkmdp'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='cfrac_h925'; k=1;
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.atm.h925.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c5.atm.h925.sea(k,:,:)); s.s1='(a) AM4.0-C5 minus AM4.0-C0';
x2=squeeze(am4.c6.atm.h925.sea(k,:,:)); s.s2='(b) AM4.0-C6 minus AM4.0-C0';
x3=squeeze(am4.c7.atm.h925.sea(k,:,:)); s.s3='(c) AM4.0-C7 minus AM4.0-C0';
x4=squeeze(am4.c8.atm.h925.sea(k,:,:)); s.s4='(d) AM4.0-C8 minus AM4.0-C0';
z1=x1-x0; z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-1000; cmax=1000; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen_rkmdp'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rkmdp_rh700'; k=1;
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.atm.rh700.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c1.atm.rh700.sea(k,:,:)); s.s1='(a) AM4.0-C1 minus AM4.0-C0';
x2=squeeze(am4.c2.atm.rh700.sea(k,:,:)); s.s2='(b) AM4.0-C2 minus AM4.0-C0';
x3=squeeze(am4.c3.atm.rh700.sea(k,:,:)); s.s3='(c) AM4.0-C3 minus AM4.0-C0';
x4=squeeze(am4.c4.atm.rh700.sea(k,:,:)); s.s4='(d) AM4.0-C4 minus AM4.0-C0';
z1=x1-x0; z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='AM4sen'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='cfrac_rh925'; k=1;
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.atm.rh925.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c5.atm.rh925.sea(k,:,:)); s.s1='(a) AM4.0-C5 minus AM4.0-C0';
x2=squeeze(am4.c6.atm.rh925.sea(k,:,:)); s.s2='(b) AM4.0-C6 minus AM4.0-C0';
x3=squeeze(am4.c7.atm.rh925.sea(k,:,:)); s.s3='(c) AM4.0-C7 minus AM4.0-C0';
x4=squeeze(am4.c8.atm.rh925.sea(k,:,:)); s.s4='(d) AM4.0-C8 minus AM4.0-C0';
z1=x1-x0; z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='AM4sen'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='h200'; k=1;
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.atm.h200.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c1.atm.h200.sea(k,:,:)); s.s1='(a) AM4.0-C1 minus AM4.0-C0';
x2=squeeze(am4.c2.atm.h200.sea(k,:,:)); s.s2='(b) AM4.0-C2 minus AM4.0-C0';
x3=squeeze(am4.c3.atm.h200.sea(k,:,:)); s.s3='(c) AM4.0-C3 minus AM4.0-C0';
x4=squeeze(am4.c4.atm.h200.sea(k,:,:)); s.s4='(d) AM4.0-C4 minus AM4.0-C0';
z1=x1-x0; z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-1000; cmax=1000; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen_rkmdp'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='u200'; k=4;
xo=squeeze(o.atm.u200.sea(k,:,:));
x0=squeeze(am4.c0.atm.u200.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c1.atm.u200.sea(k,:,:)); s.s1='(a) AM4.0-C1 minus AM4.0-C0';
x2=squeeze(am4.c2.atm.u200.sea(k,:,:)); s.s2='(b) AM4.0-C2 minus AM4.0-C0';
x3=squeeze(am4.c3.atm.u200.sea(k,:,:)); s.s3='(c) AM4.0-C3 minus AM4.0-C0';
x4=squeeze(am4.c4.atm.u200.sea(k,:,:)); s.s4='(d) AM4.0-C4 minus AM4.0-C0';
z1=x1-xo; z2=x2-xo; z3=x3-xo; z4=x0-xo;
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen_rkmdp'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prec_ls'; k=1;
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.sfc.prec_ls.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c1.sfc.prec_ls.sea(k,:,:)); s.s1='(a) AM4.0-C1 minus AM4.0-C0';
x2=squeeze(am4.c2.sfc.prec_ls.sea(k,:,:)); s.s2='(b) AM4.0-C2 minus AM4.0-C0';
x3=squeeze(am4.c3.sfc.prec_ls.sea(k,:,:)); s.s3='(c) AM4.0-C3 minus AM4.0-C0';
x4=squeeze(am4.c4.sfc.prec_ls.sea(k,:,:)); s.s4='(d) AM4.0-C4 minus AM4.0-C0';
z1=x1-x0; z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen_rkmdp'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prec_cv'; k=1;
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.sfc.prec_cv.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c1.sfc.prec_cv.sea(k,:,:)); s.s1='(a) AM4.0-C1 minus AM4.0-C0';
x2=squeeze(am4.c2.sfc.prec_cv.sea(k,:,:)); s.s2='(b) AM4.0-C2 minus AM4.0-C0';
x3=squeeze(am4.c3.sfc.prec_cv.sea(k,:,:)); s.s3='(c) AM4.0-C3 minus AM4.0-C0';
x4=squeeze(am4.c4.sfc.prec_cv.sea(k,:,:)); s.s4='(d) AM4.0-C4 minus AM4.0-C0';
z1=x1-x0; z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen_rkmdp'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp'; k=1;
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.atm.h850.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c1.sfc.pcp.sea(k,:,:)); s.s1='(a) AM4.0-C1 minus AM4.0-C0';
x2=squeeze(am4.c2.sfc.pcp.sea(k,:,:)); s.s2='(b) AM4.0-C2 minus AM4.0-C0';
x3=squeeze(am4.c3.sfc.pcp.sea(k,:,:)); s.s3='(c) AM4.0-C3 minus AM4.0-C0';
x4=squeeze(am4.c4.sfc.pcp.sea(k,:,:)); s.s4='(d) AM4.0-C4 minus AM4.0-C0';
z1=x0; z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen_rkmdp'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp'; k=1;
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.sfc.pcp.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c1.sfc.pcp.sea(k,:,:)); s.s1='(a) AM4.0-C1 minus AM4.0-C0';
x2=squeeze(am4.c2.sfc.pcp.sea(k,:,:)); s.s2='(b) AM4.0-C2 minus AM4.0-C0';
x3=squeeze(am4.c3.sfc.pcp.sea(k,:,:)); s.s3='(c) AM4.0-C3 minus AM4.0-C0';
x4=squeeze(am4.c4.sfc.pcp.sea(k,:,:)); s.s4='(d) AM4.0-C4 minus AM4.0-C0';
z1=x1-x0; z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen_rkmdp'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp'; k=1;
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.sfc.pcp.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c5.sfc.pcp.sea(k,:,:)); s.s1='(a) AM4.0-C5 minus AM4.0-C0';
x2=squeeze(am4.c6.sfc.pcp.sea(k,:,:)); s.s2='(b) AM4.0-C6 minus AM4.0-C0';
x3=squeeze(am4.c7.sfc.pcp.sea(k,:,:)); s.s3='(c) AM4.0-C7 minus AM4.0-C0';
x4=squeeze(am4.c8.sfc.pcp.sea(k,:,:)); s.s4='(d) AM4.0-C8 minus AM4.0-C0';
z1=x1-x0; z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen_cfrac'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section 2: latitudional plots%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.c0.s; a0=mean(s.aa,2); a0=a0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rkmdp_fls'; yl='fraction of large-scale precipiation'; climo=1;
k=1; z=o.sfc; yo=squeeze(z.prec_ls.latdis.sea(k,:))./squeeze(z.pcp.latdis.sea(k,:));
%z=am4.c0; x=mean(z.sfc.prec_ls.txavg0.*a0); y=mean(z.sfc.pcp.txavg0.*a0);
z=am4.c0;   y1=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s1='AM4p0-C0';
z=am4.c1;   y2=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s2='AM4p0-C1';
z=am4.c2;   y3=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s3='AM4p0-C2';
z=am4.c3;   y4=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s4='AM4p0-C3';
z=am4.c4;   y5=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s5='AM4p0-C4';
z=am2.v0;   y6=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s6='AM2';
z=am3.v0;   y7=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s7='AM3';
z=hiram.v0; y8=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s8='HiRAM';
y.xy=[-90 90 0 1]; y.yl=yl; y.climo=climo;
y.so='ERA-INTERIM'; y.co='m'; y.varo=yo;
y.var1=y1; y.var2=y2; y.var3=y3; y.var4=y4; y.var5=y5; y.var6=y6; y.var7=y7; y.var8=y8;
y.s1=s1;   y.s2=s2;   y.s3=s3;   y.s4=s4;   y.s5=s5;   y.s6=s6;   y.s7=s7;   y.s8=s8;
y.c1='k-'; y.c2='k--'; y.c3='k:'; y.c4='k-.'; y.c5='k-'; y.c6='r'; y.c7='g-'; y.c8='b';
expn='AM4sen'; x=s.lat; y.opt=4; y.xl='latitude';
plot_latdis_am4amip(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='cfrac_fls'; yl='fraction of large-scale precipiation'; climo=1;
k=1; z=o.sfc; yo=squeeze(z.prec_ls.latdis.sea(k,:))./squeeze(z.pcp.latdis.sea(k,:));
%z=am4.c0; x=mean(z.sfc.prec_ls.txavg0.*a0); y=mean(z.sfc.pcp.txavg0.*a0);
z=am4.c0;   y1=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s1='AM4p0-C0';
z=am4.c5;   y2=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s2='AM4p0-C5';
z=am4.c6;   y3=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s3='AM4p0-C6';
z=am4.c7;   y4=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s4='AM4p0-C7';
z=am4.c8;   y5=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s5='AM4p0-C8';
z=am2.v0;   y6=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s6='AM2';
z=am3.v0;   y7=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s7='AM3';
z=hiram.v0; y8=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s8='HiRAM';
y.xy=[-90 90 0 1]; y.yl=yl; y.climo=climo;
y.so='ERA-INTERIM'; y.co='m'; y.varo=yo;
y.var1=y1; y.var2=y2; y.var3=y3; y.var4=y4; y.var5=y5; y.var6=y6; y.var7=y7; y.var8=y8;
y.s1=s1;   y.s2=s2;   y.s3=s3;   y.s4=s4;   y.s5=s5;   y.s6=s6;   y.s7=s7;   y.s8=s8;
y.c1='k-'; y.c2='k--'; y.c3='k:'; y.c4='k-.'; y.c5='k-'; y.c6='r'; y.c7='g-'; y.c8='b';
expn='AM4sen'; x=s.lat; y.opt=4; y.xl='latitude';
plot_latdis_am4amip(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 zonal mean temperature%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmt'; ss={'ANN','MAM','JJA','SON','DJF'};
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4c.v0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=o;      [zo bo rmso]=vslice(v,s,k,varn,'obs',mv);
v=am4c.v0;[z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv);
v=am2.v0; [z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv);
v=am3.v0; [z3 b3 rms3]=vslice(v,s,k,varn,'mod',mv);
id=isnan(z1); zo(id)=NaN; b1(id)=NaN; %b2(id)=NaN; b3(id)=NaN;
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-6; cmax=6; vbin=[cmin:0.5:cmax];
subplot(row,col,1); c1=-90; c2=20; vbino=[c1:10:c2];
[C,h]=contourf(lat,pf,zo-273.15,vbino); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h); 
nn=32; cmap=jet(nn); colormap(cmap);
mt=strcat('(a) INTERIM (1980-2014;',ss{k},')');
title(mt,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
axis(xy); set(gca,'yDir','reverse'); 
subplot(row,col,3); 
[C,h]=contourf(lat,pf,b1,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(b) AM4 minus INTERIM (RMSE=%5.2f)',rms1);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
[C,h]=contourf(lat,pf,b2,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(c) AM2 minus INTERIM (RMSE=%5.2f)',rms2);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lat,pf,b3,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(d) AM3 minus INTERIM (RMSE=%5.2f)',rms3);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4p0'; vname=strcat(varn,(ss{k}));
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 zonal mean zonal wind%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=5; varn='zmu'; ss={'ANN','MAM','JJA','SON','DJF'};
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4c.v0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=o;      [zo bo rmso]=vslice(v,s,k,varn,'obs',mv);
v=am4c.v0;[z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv);
v=am2.v0; [z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv);
v=am3.v0; [z3 b3 rms3]=vslice(v,s,k,varn,'mod',mv);
id=isnan(z1); zo(id)=NaN; b1(id)=NaN; %b2(id)=NaN; b3(id)=NaN;
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-10; cmax=10; vbin=[cmin:1:cmax];
subplot(row,col,1); c1=-30; c2=30; vbino=[c1:4:c2];
[C,h]=contourf(lat,pf,zo,vbino); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h); 
nn=32; cmap=jet(nn); colormap(cmap);
mt=strcat('(a) INTERIM (1980-2014;',ss{k},')');
title(mt,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
axis(xy); set(gca,'yDir','reverse'); 
subplot(row,col,3); 
[C,h]=contourf(lat,pf,b1,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(b) AM4.0 minus INTERIM (RMSE=%5.2f)',rms1);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
[C,h]=contourf(lat,pf,b2,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(c) AM2 minus INTERIM (RMSE=%5.2f)',rms2);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lat,pf,b3,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(d) AM3 minus INTERIM (RMSE=%5.2f)',rms3);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4p0'; vname=strcat(varn,(ss{k}));
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pf =[1000 925 850 775 700 600 500 400 300 250 200 150 100 70];
pf1=[1000 925 850 700 600 500 400 300 250 200 150 100 70];
k=1; s=am4b.v0.s; lat=s.lat; xy=[-90 90 70 1000]; mv=-999;
v=o;       [zo bo rmso]=vslice(v,s,k,'obs',mv);
v=am4c.v0; [z1 b1 rms1]=vslice(v,s,k,'am4',mv);
v=am4a.v0; [z2 b2 rms2]=vslice(v,s,k,'am4',mv);
v=am4b.v0; [z3 b3 rms3]=vslice(v,s,k,'am4',mv);
id=isnan(z1); zo(id)=NaN; b1(id)=NaN; b2(id)=NaN; b3(id)=NaN;
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-5; cmax=5; vbin=[cmin:0.5:cmax];
subplot(row,col,1); c1=-90; c2=20; vbino=[c1:10:c2];
[C,h]=contourf(lat,pf,zo-273.15,vbino); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h); 
nn=32; cmap=jet(nn); colormap(cmap);
title('INTERIM (1980-2014)','FontSize',fsize);
set(gca,'FontSize',fsize); 
axis(xy); set(gca,'yDir','reverse'); 
subplot(row,col,3); 
[C,h]=contourf(lat,pf,b1,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('AM4c minus INTERIM (RMSE=%5.2f)',rms1);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
[C,h]=contourf(lat,pf,b2,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('AM4a minus INTERIM (RMSE=%5.2f)',rms2);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lat,pf,b3,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('AM4b minus INTERIM (RMSE=%5.2f)',rms3);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4'; vname='zmtemp_ann';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 zonal mean temperature%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


pf =[1000 925 850 775 700 600 500 400 300 250 200 150 100 70];
pf1=[1000 925 850 700 600 500 400 300 250 200 150 100 70];
k=1; s=am4b.v0.s; lat=s.lat; xy=[-90 90 70 1000]; mv=-999;
v=o;       [zo bo rmso]=vslice(v,s,k,'obs',mv);
v=am4c.v0; [z1 b1 rms1]=vslice(v,s,k,'am4',mv);
v=am4a.v0; [z2 b2 rms2]=vslice(v,s,k,'am4',mv);
v=am4b.v0; [z3 b3 rms3]=vslice(v,s,k,'am4',mv);
id=isnan(z1); zo(id)=NaN; b1(id)=NaN; b2(id)=NaN; b3(id)=NaN;
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-5; cmax=5; vbin=[cmin:0.5:cmax];
subplot(row,col,1); c1=-90; c2=20; vbino=[c1:10:c2];
[C,h]=contourf(lat,pf,zo-273.15,vbino); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h); 
nn=32; cmap=jet(nn); colormap(cmap);
title('INTERIM (1980-2014)','FontSize',fsize);
set(gca,'FontSize',fsize); 
axis(xy); set(gca,'yDir','reverse'); 
subplot(row,col,3); 
[C,h]=contourf(lat,pf,b1,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('AM4c minus INTERIM (RMSE=%5.2f)',rms1);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
[C,h]=contourf(lat,pf,b2,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('AM4a minus INTERIM (RMSE=%5.2f)',rms2);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lat,pf,b3,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('AM4b minus INTERIM (RMSE=%5.2f)',rms3);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4'; vname='zmtemp_ann';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4p0 zonal mean temperature%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure; 
plot(am4.v0.toa.netrad.ts.org_ann,'r'); hold on; 
plot(am4.c0.toa.netrad.ts.org_ann,'b');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%radiation time series%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_ts'; expn='AM4p0'; 
yl='TOA net radiation (W/m2)'; xy=[2000 2015 -0.8 0.8];
%CERES
g=o.ceres_ts_global.toa.netrad.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4a.v0.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yb=am4b.v0.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yc=am4c.v0.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yd=am4d.v0.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
ye=am4e.v0.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
ym.anom=(ya.anom+yb.anom+yc.anom+yd.anom+ye.anom)/5.;
ym.time=ya.time;
for t=1:length(ym.time)
  ym.min(t)=min([ya.anom(t) yb.anom(t) yc.anom(t) yd.anom(t) ye.anom(t)]);
  ym.max(t)=max([ya.anom(t) yb.anom(t) yc.anom(t) yd.anom(t) ye.anom(t)]);
end
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
%plot(ya.time,ya.anom,'b','LineWidth',lw); hold on;
%plot(yb.time,yb.anom,'g','LineWidth',lw); hold on;
%plot(yc.time,yc.anom,'c','LineWidth',lw); hold on;
%plot(yd.time,yd.anom,'k','LineWidth',lw); hold on;
%plot(ye.time,ye.anom,'m','LineWidth',lw); hold on;
c=corrcoef(ym.anom,yo.anom); 
s1=sprintf('AM4.1 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-v2.8',3); mylabel(xy,1,'(a)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_ts'; expn='AM4p0'; 
yl='OLR (W/m2)'; xy=[2000 2015 -0.8 0.8];
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
%CERES
g=o.ceres_ts_global.toa.lwnet.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4a.v0.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yb=am4b.v0.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yc=am4c.v0.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yd=am4d.v0.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
ye=am4e.v0.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
ym.anom=(ya.anom+yb.anom+yc.anom+yd.anom+ye.anom)/5.;
ym.time=ya.time;
for t=1:length(ym.time)
  ym.min(t)=min([ya.anom(t) yb.anom(t) yc.anom(t) yd.anom(t) ye.anom(t)]);
  ym.max(t)=max([ya.anom(t) yb.anom(t) yc.anom(t) yd.anom(t) ye.anom(t)]);
end
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.anom,yo.anom); 
s1=sprintf('AM4.1 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-v2.8',3); mylabel(xy,1,'(b)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet_ts'; expn='AM4p0'; 
yl='TOA SW radiation (W/m2)'; xy=[2000 2015 -0.8 0.8];
%CERES
g=o.ceres_ts_global.toa.swnet.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4a.v0.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yb=am4b.v0.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yc=am4c.v0.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yd=am4d.v0.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
ye=am4e.v0.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
ym.anom=(ya.anom+yb.anom+yc.anom+yd.anom+ye.anom)/5.;
ym.time=ya.time;
for t=1:length(ym.time)
  ym.min(t)=min([ya.anom(t) yb.anom(t) yc.anom(t) yd.anom(t) ye.anom(t)]);
  ym.max(t)=max([ya.anom(t) yb.anom(t) yc.anom(t) yd.anom(t) ye.anom(t)]);
end
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.anom,yo.anom); 
s1=sprintf('AM4.1 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-v2.8',3); mylabel(xy,1,'(c)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_clr_ts'; expn='AM4p0'; 
yl='clear-sky OLR (W/m2)'; xy=[2000 2015 -0.8 0.8];
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
%CERES
g=o.ceres_ts_global.toa.lwnet_clr.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4a.v0.toa.lwnet_clr.al0(end-14:end,:); %01/2000-12/2014
yb=am4b.v0.toa.lwnet_clr.al0(end-14:end,:); %01/2000-12/2014
yc=am4c.v0.toa.lwnet_clr.al0(end-14:end,:); %01/2000-12/2014
yd=am4d.v0.toa.lwnet_clr.al0(end-14:end,:); %01/2000-12/2014
ye=am4e.v0.toa.lwnet_clr.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
ym.anom=(ya.anom+yb.anom+yc.anom+yd.anom+ye.anom)/5.;
ym.time=ya.time;
for t=1:length(ym.time)
  ym.min(t)=min([ya.anom(t) yb.anom(t) yc.anom(t) yd.anom(t) ye.anom(t)]);
  ym.max(t)=max([ya.anom(t) yb.anom(t) yc.anom(t) yd.anom(t) ye.anom(t)]);
end
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.anom,yo.anom); 
s1=sprintf('AM4.1 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-v2.8',3); mylabel(xy,1,'(c)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet_clr_ts'; expn='AM4p0'; 
yl='clear-sky SW absorption (W/m2)'; xy=[2000 2015 -0.8 0.8];
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
%CERES
g=o.ceres_ts_global.toa.swnet_clr.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4a.v0.toa.swnet_clr.al0(end-14:end,:); %01/2000-12/2014
yb=am4b.v0.toa.swnet_clr.al0(end-14:end,:); %01/2000-12/2014
yc=am4c.v0.toa.swnet_clr.al0(end-14:end,:); %01/2000-12/2014
yd=am4d.v0.toa.swnet_clr.al0(end-14:end,:); %01/2000-12/2014
ye=am4e.v0.toa.swnet_clr.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
ym.anom=(ya.anom+yb.anom+yc.anom+yd.anom+ye.anom)/5.;
ym.time=ya.time;
for t=1:length(ym.time)
  ym.min(t)=min([ya.anom(t) yb.anom(t) yc.anom(t) yd.anom(t) ye.anom(t)]);
  ym.max(t)=max([ya.anom(t) yb.anom(t) yc.anom(t) yd.anom(t) ye.anom(t)]);
end
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.anom,yo.anom); 
s1=sprintf('AM4.1 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-v2.8',3); mylabel(xy,1,'(c)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcf_ts'; expn='AM4p0'; 
yl='LW CRE (W/m2)'; xy=[2000 2015 -0.8 0.8];
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
%CERES
g=o.ceres_ts_global.toa.lwcf.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4a.v0.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
yb=am4b.v0.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
yc=am4c.v0.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
yd=am4d.v0.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
ye=am4e.v0.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
ym.anom=(ya.anom+yb.anom+yc.anom+yd.anom+ye.anom)/5.;
ym.time=ya.time;
for t=1:length(ym.time)
  ym.min(t)=min([ya.anom(t) yb.anom(t) yc.anom(t) yd.anom(t) ye.anom(t)]);
  ym.max(t)=max([ya.anom(t) yb.anom(t) yc.anom(t) yd.anom(t) ye.anom(t)]);
end
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.anom,yo.anom); 
s1=sprintf('AM4.1 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-v2.8',3); mylabel(xy,1,'(c)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcf_ts'; expn='AM4p0'; 
yl='SW CRE (W/m2)'; xy=[2000 2015 -0.8 0.8];
%CERES
g=o.ceres_ts_global.toa.swcf.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4a.v0.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yb=am4b.v0.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yc=am4c.v0.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yd=am4d.v0.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
ye=am4e.v0.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
ym.anom=(ya.anom+yb.anom+yc.anom+yd.anom+ye.anom)/5.;
ym.time=ya.time;
for t=1:length(ym.time)
  ym.min(t)=min([ya.anom(t) yb.anom(t) yc.anom(t) yd.anom(t) ye.anom(t)]);
  ym.max(t)=max([ya.anom(t) yb.anom(t) yc.anom(t) yd.anom(t) ye.anom(t)]);
end
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.anom,yo.anom); 
s1=sprintf('AM4.1 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-v2.8',3); mylabel(xy,1,'(d)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ttcf_ts'; expn='AM4p0'; 
yl='total CRE (W/m2)'; xy=[2000 2015 -0.8 0.8];
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
x=am4.v0.toa.ttcf.al0(end-14:end,:); %01/2000-12/2014
nyr=length(x(:,1)); 
x=reshape(x',12*nyr,1); x=x(3:end); %03/2000-12/2014;
wsize=12; y1=deseason(x,wsize);
%CERES
g=o.ceres_ts_global.toa.ttcf.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
wsize=12; yo=deseason(g,wsize);
plot(y1.time,y1.anom,'b','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'r','LineWidth',lw); hold on; 
c=corrcoef(y1.anom,yo.anom); 
s1=sprintf('AM4.1 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-v2.8',3); mylabel(xy,1,'(d)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Seasonal cycle of TOA Raditive flux%%%%%%%%%%%%%%
vname='netradtoa_scyc'; expn='AM4p0'; 
yl='TOA radiative flux anomalies (W/m2)';
pms=[ 0, 0, 800, 600]*0.8; fsize=16; lw=2; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on');
toa=am4b.v0.toa; xy=[1 12 -13.5 13.5]; 
xo=toa.netrad.clm_stat.omen.all; xo=xo-mean(xo);
yo=toa.lwnet.clm_stat.omen.all;  yo=yo-mean(yo);
zo=toa.swnet.clm_stat.omen.all;  zo=zo-mean(zo);
x1=toa.netrad.clm_stat.mmen.all; x1=x1-mean(x1);
y1=toa.lwnet.clm_stat.mmen.all;  y1=y1-mean(y1);
z1=toa.swnet.clm_stat.mmen.all;  z1=z1-mean(z1);
plot(t,x1,'k',  'LineWidth',lw); hold on; corrcoef(x1,xo)
plot(t,y1,'r',  'LineWidth',lw); hold on; corrcoef(y1,yo)
plot(t,z1,'b',  'LineWidth',lw); hold on; corrcoef(z1,zo)
plot(t,xo,'k--','LineWidth',lw); hold on;
plot(t,yo,'r--','LineWidth',lw); hold on;
plot(t,zo,'b--','LineWidth',lw); hold on;
legend('net','LW','SW',0); mylabel(xy,1,'(a)',fsize);
xlabel('month','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Seasonal cycle of TOA clear-sky Raditive flux
vname='radtoa_clr_scyc'; expn='AM4p0'; 
yl='TOA clear-sky radiative flux anomalies (W/m2)';
pms=[ 0, 0, 800, 600]*0.8; fsize=16; lw=2; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on');
toa=am4b.v0.toa; xy=[1 12 -13.5 13.5]; 
xo=toa.netrad_clr.clm_stat.omen.all; xo=xo-mean(xo);
yo=toa.lwnet_clr.clm_stat.omen.all;  yo=yo-mean(yo);
zo=toa.swnet_clr.clm_stat.omen.all;  zo=zo-mean(zo);
x1=toa.netrad_clr.clm_stat.mmen.all; x1=x1-mean(x1);
y1=toa.lwnet_clr.clm_stat.mmen.all;  y1=y1-mean(y1);
z1=toa.swnet_clr.clm_stat.mmen.all;  z1=z1-mean(z1);
plot(t,x1,'k',  'LineWidth',lw); hold on;
plot(t,y1,'r',  'LineWidth',lw); hold on;
plot(t,z1,'b',  'LineWidth',lw); hold on;
plot(t,xo,'k--','LineWidth',lw); hold on;
plot(t,yo,'r--','LineWidth',lw); hold on;
plot(t,zo,'b--','LineWidth',lw); hold on;
legend('net','LW','SW',0); mylabel(xy,1,'(b)',fsize);
xlabel('month','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Seasonal cycle of TOA CRE%%%%%%%%%%%%%%%%%%%%
vname='cre_scyc'; expn='AM4p0'; 
yl='TOA clear-sky radiative flux anomalies (W/m2)';
pms=[ 0, 0, 800, 600]*0.8; fsize=16; lw=2; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on');
toa=am4b.v0.toa; xy=[1 12 -13.5 13.5]; 
xo=toa.ttcf.clm_stat.omen.all;  xo=xo-mean(xo);%xo=repmat(xo,1,2);
yo=toa.lwcf.clm_stat.omen.all;  yo=yo-mean(yo);%yo=repmat(yo,1,2);
zo=toa.swcf.clm_stat.omen.all;  zo=zo-mean(zo);%zo=repmat(zo,1,2);
x1=toa.ttcf.clm_stat.mmen.all;  x1=x1-mean(x1);%x1=repmat(x1,1,2);
y1=toa.lwcf.clm_stat.mmen.all;  y1=y1-mean(y1);%y1=repmat(y1,1,2);
z1=toa.swcf.clm_stat.mmen.all;  z1=z1-mean(z1);%z1=repmat(z1,1,2);
plot(t,x1,'k',  'LineWidth',lw); hold on;corrcoef(x1,xo)
plot(t,y1,'r',  'LineWidth',lw); hold on;corrcoef(y1,yo)
plot(t,z1,'b',  'LineWidth',lw); hold on;corrcoef(z1,zo)
plot(t,xo,'k--','LineWidth',lw); hold on;
plot(t,yo,'r--','LineWidth',lw); hold on;
plot(t,zo,'b--','LineWidth',lw); hold on;
legend('net','LW','SW',0); mylabel(xy,1,'(c)',fsize); 
xlabel('month','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%NETRADTOA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_scyc'; yl='TOA net radiation (W/m2)';
pms=[ 0, 0, 800, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
yo=toa1.netrad.clm_stat.omen.all; t=[1:12];
y1=toa1.netrad.clm_stat.mmen.all;
y2=toa2.netrad.clm_stat.mmen.all;
y3=toa3.netrad.clm_stat.mmen.all;
yo_avg=mean(yo); so=sprintf('CERES (mean=%5.2f)',yo_avg);
y1_avg=mean(y1); s1=sprintf('AM4.0 (mean=%5.2f)',y1_avg);
y2_avg=mean(y2); s2=sprintf('AM3   (mean=%5.2f)',y2_avg);
y3_avg=mean(y3); s3=sprintf('AM2.1 (mean=%5.2f)',y3_avg);
plot(t,yo-yo_avg,'-sk','LineWidth',lw*2); hold on;
plot(t,y1-y1_avg,'r', 'LineWidth',lw); hold on;
plot(t,y2-y2_avg,'b', 'LineWidth',lw); hold on;
plot(t,y3-y3_avg,'g', 'LineWidth',lw); hold on;
legend(so,s1,s2,s3,0); axis([1 12 -12 12]); 
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4amip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnettoa_scyc'; yl='LW net radiation (W/m2)';
pms=[ 0, 0, 800, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
yo=toa1.lwnet.clm_stat.omen.all; t=[1:12];
y1=toa1.lwnet.clm_stat.mmen.all;
y2=toa2.lwnet.clm_stat.mmen.all;
y3=toa3.lwnet.clm_stat.mmen.all;
yo_avg=mean(yo); so=sprintf('CERES (mean=%5.2f)',yo_avg);
y1_avg=mean(y1); s1=sprintf('AM4.0 (mean=%5.2f)',y1_avg);
y2_avg=mean(y2); s2=sprintf('AM3   (mean=%5.2f)',y2_avg);
y3_avg=mean(y3); s3=sprintf('AM2.1 (mean=%5.2f)',y3_avg);
plot(t,yo-yo_avg,'-sk','LineWidth',lw*2); hold on;
plot(t,y1-y1_avg,'r', 'LineWidth',lw); hold on;
plot(t,y2-y2_avg,'b', 'LineWidth',lw); hold on;
plot(t,y3-y3_avg,'g', 'LineWidth',lw); hold on;
legend(so,s1,s2,s3,0);axis([1 12 -12 12]); 
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4amip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnettoa_scyc'; yl='SW net radiation (W/m2)';
pms=[ 0, 0, 800, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
yo=toa1.swnet.clm_stat.omen.all; t=[1:12];
y1=toa1.swnet.clm_stat.mmen.all;
y2=toa2.swnet.clm_stat.mmen.all;
y3=toa3.swnet.clm_stat.mmen.all;
yo_avg=mean(yo); so=sprintf('CERES (mean=%5.2f)',yo_avg);
y1_avg=mean(y1); s1=sprintf('AM4.0 (mean=%5.2f)',y1_avg);
y2_avg=mean(y2); s2=sprintf('AM3   (mean=%5.2f)',y2_avg);
y3_avg=mean(y3); s3=sprintf('AM2.1 (mean=%5.2f)',y3_avg);
plot(t,yo-yo_avg,'-sk','LineWidth',lw*2); hold on;
plot(t,y1-y1_avg,'r', 'LineWidth',lw); hold on;
plot(t,y2-y2_avg,'b', 'LineWidth',lw); hold on;
plot(t,y3-y3_avg,'g', 'LineWidth',lw); hold on;
legend(so,s1,s2,s3,0);axis([1 12 -12 12]); 
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4amip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 surface air temperature%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; s=am4c.v0.s; lat=s.lat; lon=s.lon; xy=[0 360 -90 90]; mv=-999;
vname='Tref-ann'; expn='am4'; yl='200hPa T (K)'; k=1; aa=s.aa; lm=s.lm0;
v=o;       zo=squeeze(v.sfc.tref.sea(k,:,:))-273.15;
v=am4c.v0; z1=squeeze(v.sfc.tref.sea(k,:,:))-273.15;
v=am4a.v0;  z2=squeeze(v.sfc.tref.sea(k,:,:))-273.15;
v=am4b.v0;  z3=squeeze(v.sfc.tref.sea(k,:,:))-273.15;
a=(zo.*aa); zo_avg=mean(mean(a)); 
a=(z1.*aa); z1_avg=mean(mean(a)); bias1=z1_avg-zo_avg;
a=(z2.*aa); z2_avg=mean(mean(a)); bias2=z2_avg-zo_avg;
a=(z3.*aa); z3_avg=mean(mean(a)); bias3=z3_avg-zo_avg;
a=(z1-zo).*aa; rms1=sqrt(mean(mean(a.*a)));
a=(z2-zo).*aa; rms2=sqrt(mean(mean(a.*a)));
a=(z3-zo).*aa; rms3=sqrt(mean(mean(a.*a)));
id=(lm>0.5); %zo(id)=NaN; z1(id)=NaN; z2(id)=NaN; z3(id)=NaN;
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-2; cmax=2; vbin=[-5 cmin:0.2:cmax];
subplot(row,col,1); c1=-60; c2=40; vbino=[c1:2:c2];
[C,h]=contourf(lon,lat,zo,vbino); shading flat; 
colorbar; caxis([c1 c2]); %clabel(C,h); 
nn=32; cmap=jet(nn); colormap(cmap);
title(strcat('INTERIM (1980-2014);',vname),'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
subplot(row,col,3); 
[C,h]=contourf(lon,lat,z1-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); %clabel(C,h); axis(xy); 
s=sprintf('AM4c minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias1,rms1);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
[C,h]=contourf(lon,lat,z2-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); %clabel(C,h); axis(xy); 
s=sprintf('AM4a minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias2,rms2);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lon,lat,z3-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); %clabel(C,h); axis(xy); 
s=sprintf('AM4b minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias3,rms3);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4p0 surface air temperature%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; s=am4c.v0.s; lat=s.lat; lon=s.lon; xy=[0 360 -90 90]; mv=-999;
vname='Tref-ann'; expn='am4p0'; yl='200hPa T (K)'; k=1; aa=s.aa; lm=s.lm0;
v=o;       zo=squeeze(v.sfc.tref.sea(k,:,:))-273.15;
v=am4c.v0; z1=squeeze(v.sfc.tref.sea(k,:,:))-273.15;
v=am2.v0;  z2=squeeze(v.sfc.tref.sea(k,:,:))-273.15;
v=am3.v0;  z3=squeeze(v.sfc.tref.sea(k,:,:))-273.15;
a=(zo.*aa); zo_avg=mean(mean(a)); 
a=(z1.*aa); z1_avg=mean(mean(a)); bias1=z1_avg-zo_avg;
a=(z2.*aa); z2_avg=mean(mean(a)); bias2=z2_avg-zo_avg;
a=(z3.*aa); z3_avg=mean(mean(a)); bias3=z3_avg-zo_avg;
a=(z1-zo).*aa; rms1=sqrt(mean(mean(a.*a)));
a=(z2-zo).*aa; rms2=sqrt(mean(mean(a.*a)));
a=(z3-zo).*aa; rms3=sqrt(mean(mean(a.*a)));
id=(lm>0.5); %zo(id)=NaN; z1(id)=NaN; z2(id)=NaN; z3(id)=NaN;
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-2; cmax=2; vbin=[-5 cmin:0.2:cmax];
subplot(row,col,1); c1=-60; c2=40; vbino=[c1:2:c2];
[C,h]=contourf(lon,lat,zo,vbino); shading flat; 
colorbar; caxis([c1 c2]); %clabel(C,h); 
nn=32; cmap=jet(nn); colormap(cmap);
title(strcat('INTERIM (1980-2014);',vname),'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
subplot(row,col,3); 
[C,h]=contourf(lon,lat,z1-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); %clabel(C,h); axis(xy); 
s=sprintf('AM4c minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias1,rms1);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
[C,h]=contourf(lon,lat,z2-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); %clabel(C,h); axis(xy); 
s=sprintf('AM2 minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias2,rms2);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lon,lat,z3-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); %clabel(C,h); axis(xy); 
s=sprintf('AM3 minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias3,rms3);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 T200%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; s=am4c.v0.s; lat=s.lat; lon=s.lon; xy=[0 360 -90 90]; mv=-999;
vname='T200-ann'; expn='am4'; yl='200hPa T (K)'; k=1; aa=s.aa;
v=o;       zo=squeeze(v.atm.t200.sea(k,:,:))-273.15;
v=am4c.v0; z1=squeeze(v.atm.t200.sea(k,:,:))-273.15;
v=am4a.v0; z2=squeeze(v.atm.t200.sea(k,:,:))-273.15;
v=am4b.v0; z3=squeeze(v.atm.t200.sea(k,:,:))-273.15;
a=(zo.*aa); zo_avg=mean(mean(a)); %zo=zo-zo_avg;
a=(z1.*aa); z1_avg=mean(mean(a)); bias1=z1_avg-zo_avg; %z1=z1-z1_avg;
a=(z2.*aa); z2_avg=mean(mean(a)); bias2=z2_avg-zo_avg; %z2=z2-z2_avg;
a=(z3.*aa); z3_avg=mean(mean(a)); bias3=z3_avg-zo_avg; %z3=z3-z3_avg;
a=(z1-zo).*aa; rms1=sqrt(mean(mean(a.*a)));
a=(z2-zo).*aa; rms2=sqrt(mean(mean(a.*a)));
a=(z3-zo).*aa; rms3=sqrt(mean(mean(a.*a)));
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-4; cmax=4; vbin=[cmin:0.5:cmax];
subplot(row,col,1); c1=-65; c2=-50; vbino=[c1:1:c2];
[C,h]=contourf(lon,lat,zo,vbino); shading flat; 
colorbar; caxis([c1 c2]); %clabel(C,h);
nn=32; cmap=jet(nn); colormap(cmap);
title(strcat('INTERIM (1980-2014);',vname),'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
subplot(row,col,3); 
[C,h]=contourf(lon,lat,z1-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h);
s=sprintf('AM4c minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias1,rms1);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
[C,h]=contourf(lon,lat,z2-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h); 
s=sprintf('AM4a minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias2,rms2);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lon,lat,z3-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h); 
s=sprintf('AM4b minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias3,rms3);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4p0 T200%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; s=am4c.v0.s; lat=s.lat; lon=s.lon; xy=[0 360 -90 90]; mv=-999;
vname='T200-ann'; expn='am4p0'; yl='200hPa T (K)'; k=1; aa=s.aa;
v=o;       zo=squeeze(v.atm.t200.sea(k,:,:))-273.15;
v=am4c.v0; z1=squeeze(v.atm.t200.sea(k,:,:))-273.15;
v=am2.v0;  z2=squeeze(v.atm.t200.sea(k,:,:))-273.15;
v=am3.v0;  z3=squeeze(v.atm.t200.sea(k,:,:))-273.15;
a=(zo.*aa); zo_avg=mean(mean(a)); %zo=zo-zo_avg;
a=(z1.*aa); z1_avg=mean(mean(a)); bias1=z1_avg-zo_avg; %z1=z1-z1_avg;
a=(z2.*aa); z2_avg=mean(mean(a)); bias2=z2_avg-zo_avg; %z2=z2-z2_avg;
a=(z3.*aa); z3_avg=mean(mean(a)); bias3=z3_avg-zo_avg; %z3=z3-z3_avg;
a=(z1-zo).*aa; rms1=sqrt(mean(mean(a.*a)));
a=(z2-zo).*aa; rms2=sqrt(mean(mean(a.*a)));
a=(z3-zo).*aa; rms3=sqrt(mean(mean(a.*a)));
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-4; cmax=4; vbin=[-5 cmin:0.5:cmax];
subplot(row,col,1); c1=-65; c2=-50; vbino=[c1:1:c2];
[C,h]=contourf(lon,lat,zo,vbino); shading flat; 
colorbar; caxis([c1 c2]); %clabel(C,h);
nn=32; cmap=jet(nn); colormap(cmap);
title(strcat('INTERIM (1980-2014);',vname),'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
subplot(row,col,3); 
[C,h]=contourf(lon,lat,z1-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h);
s=sprintf('AM4c minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias1,rms1);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
[C,h]=contourf(lon,lat,z2-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h); 
s=sprintf('AM2 minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias2,rms2);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lon,lat,z3-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h); 
s=sprintf('AM3 minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias3,rms3);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4p0 T200 remove mean%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; s=am4c.v0.s; lat=s.lat; lon=s.lon; xy=[0 360 -90 90]; mv=-999;
vname='T200p-ann'; expn='am4p0'; yl='200hPa T (K)'; k=1; aa=s.aa;
v=o;       zo=squeeze(v.atm.t200.sea(k,:,:))-273.15;
v=am4c.v0; z1=squeeze(v.atm.t200.sea(k,:,:))-273.15;
v=am2.v0;  z2=squeeze(v.atm.t200.sea(k,:,:))-273.15;
v=am3.v0;  z3=squeeze(v.atm.t200.sea(k,:,:))-273.15;
a=(zo.*aa); zo_avg=mean(mean(a)); zo=zo-zo_avg;
a=(z1.*aa); z1_avg=mean(mean(a)); bias1=z1_avg-zo_avg; z1=z1-z1_avg;
a=(z2.*aa); z2_avg=mean(mean(a)); bias2=z2_avg-zo_avg; z2=z2-z2_avg;
a=(z3.*aa); z3_avg=mean(mean(a)); bias3=z3_avg-zo_avg; z3=z3-z3_avg;
a=(z1-zo).*aa; rms1=sqrt(mean(mean(a.*a)));
a=(z2-zo).*aa; rms2=sqrt(mean(mean(a.*a)));
a=(z3-zo).*aa; rms3=sqrt(mean(mean(a.*a)));
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-4; cmax=4; vbin=[-10 cmin:0.5:cmax];
subplot(row,col,1); c1=-65; c2=-50; vbino=[c1:1:c2];
[C,h]=contourf(lon,lat,zo,vbin); shading flat; 
colorbar; caxis([cmin cmax]); %clabel(C,h);
nn=32; cmap=jet(nn); colormap(cmap);
title(strcat('INTERIM (1980-2014);',vname),'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
subplot(row,col,3); 
[C,h]=contourf(lon,lat,z1-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h);
s=sprintf('AM4c minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias1,rms1);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
[C,h]=contourf(lon,lat,z2-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h); 
s=sprintf('AM2 minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias2,rms2);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lon,lat,z3-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h); 
s=sprintf('AM3 minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias3,rms3);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 T500%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; s=am4c.v0.s; lat=s.lat; lon=s.lon; xy=[0 360 -90 90]; mv=-999;
vname='T500-ann'; expn='am4'; yl='500hPa T (K)'; k=1; aa=s.aa;
v=o;       zo=squeeze(v.atm.t500.sea(k,:,:))-273.15;
v=am4c.v0; z1=squeeze(v.atm.t500.sea(k,:,:))-273.15;
v=am4a.v0; z2=squeeze(v.atm.t500.sea(k,:,:))-273.15;
v=am4b.v0; z3=squeeze(v.atm.t500.sea(k,:,:))-273.15;
a=(zo.*aa); zo_avg=mean(mean(a)); %zo=zo-zo_avg;
a=(z1.*aa); z1_avg=mean(mean(a)); bias1=z1_avg-zo_avg; %z1=z1-z1_avg;
a=(z2.*aa); z2_avg=mean(mean(a)); bias2=z2_avg-zo_avg; %z2=z2-z2_avg;
a=(z3.*aa); z3_avg=mean(mean(a)); bias3=z3_avg-zo_avg; %z3=z3-z3_avg;
a=(z1-zo).*aa; rms1=sqrt(mean(mean(a.*a)));
a=(z2-zo).*aa; rms2=sqrt(mean(mean(a.*a)));
a=(z3-zo).*aa; rms3=sqrt(mean(mean(a.*a)));
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-4; cmax=4; vbin=[-5 cmin:0.5:cmax];
subplot(row,col,1); c1=-50; c2=0; vbino=[c1:1:c2];
[C,h]=contourf(lon,lat,zo,vbino); shading flat; 
colorbar; caxis([c1 c2]); %clabel(C,h);
nn=32; cmap=jet(nn); colormap(cmap);
title(strcat('INTERIM (1980-2014);',vname),'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
subplot(row,col,3); 
[C,h]=contourf(lon,lat,z1-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h);
s=sprintf('AM4c minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias1,rms1);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
[C,h]=contourf(lon,lat,z2-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h); 
s=sprintf('AM4a minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias2,rms2);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lon,lat,z3-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h); 
s=sprintf('AM4b minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias3,rms3);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4p0 T500%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; s=am4c.v0.s; lat=s.lat; lon=s.lon; xy=[0 360 -90 90]; mv=-999;
vname='T500-ann'; expn='am4p0'; yl='500hPa T (K)'; k=1; aa=s.aa;
v=o;       zo=squeeze(v.atm.t500.sea(k,:,:))-273.15;
v=am4c.v0; z1=squeeze(v.atm.t500.sea(k,:,:))-273.15;
v=am2.v0;  z2=squeeze(v.atm.t500.sea(k,:,:))-273.15;
v=am3.v0;  z3=squeeze(v.atm.t500.sea(k,:,:))-273.15;
a=(zo.*aa); zo_avg=mean(mean(a)); %zo=zo-zo_avg;
a=(z1.*aa); z1_avg=mean(mean(a)); bias1=z1_avg-zo_avg; %z1=z1-z1_avg;
a=(z2.*aa); z2_avg=mean(mean(a)); bias2=z2_avg-zo_avg; %z2=z2-z2_avg;
a=(z3.*aa); z3_avg=mean(mean(a)); bias3=z3_avg-zo_avg; %z3=z3-z3_avg;
a=(z1-zo).*aa; rms1=sqrt(mean(mean(a.*a)));
a=(z2-zo).*aa; rms2=sqrt(mean(mean(a.*a)));
a=(z3-zo).*aa; rms3=sqrt(mean(mean(a.*a)));
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-4; cmax=4; vbin=[-5 cmin:0.5:cmax];
subplot(row,col,1); c1=-50; c2=0; vbino=[c1:1:c2];
[C,h]=contourf(lon,lat,zo,vbino); shading flat; 
colorbar; caxis([c1 c2]); %clabel(C,h);
nn=32; cmap=jet(nn); colormap(cmap);
title(strcat('INTERIM (1980-2014);',vname),'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
subplot(row,col,3); 
[C,h]=contourf(lon,lat,z1-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h);
s=sprintf('AM4c minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias1,rms1);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
[C,h]=contourf(lon,lat,z2-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h); 
s=sprintf('AM2 minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias2,rms2);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lon,lat,z3-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h); 
s=sprintf('AM3 minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias3,rms3);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4p0 T500 remove mean%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; s=am4c.v0.s; lat=s.lat; lon=s.lon; xy=[0 360 -90 90]; mv=-999;
vname='T500p-ann'; expn='am4p0'; yl='500hPa T (K)'; k=1; aa=s.aa;
v=o;       zo=squeeze(v.atm.t500.sea(k,:,:))-273.15;
v=am4c.v0; z1=squeeze(v.atm.t500.sea(k,:,:))-273.15;
v=am2.v0;  z2=squeeze(v.atm.t500.sea(k,:,:))-273.15;
v=am3.v0;  z3=squeeze(v.atm.t500.sea(k,:,:))-273.15;
a=(zo.*aa); zo_avg=mean(mean(a)); zo=zo-zo_avg;
a=(z1.*aa); z1_avg=mean(mean(a)); bias1=z1_avg-zo_avg; z1=z1-z1_avg;
a=(z2.*aa); z2_avg=mean(mean(a)); bias2=z2_avg-zo_avg; z2=z2-z2_avg;
a=(z3.*aa); z3_avg=mean(mean(a)); bias3=z3_avg-zo_avg; z3=z3-z3_avg;
a=(z1-zo).*aa; rms1=sqrt(mean(mean(a.*a)));
a=(z2-zo).*aa; rms2=sqrt(mean(mean(a.*a)));
a=(z3-zo).*aa; rms3=sqrt(mean(mean(a.*a)));
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-4; cmax=4; vbin=[-10 cmin:0.5:cmax];
subplot(row,col,1); c1=-28; c2=28; vbino=[c1:1:c2];
[C,h]=contourf(lon,lat,zo,vbino); shading flat; 
colorbar; caxis([c1 c2]); %clabel(C,h);
nn=32; cmap=jet(nn); colormap(cmap);
title(strcat('INTERIM (1980-2014);',vname),'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
subplot(row,col,3); 
[C,h]=contourf(lon,lat,z1-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h);
s=sprintf('AM4c minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias1,rms1);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
[C,h]=contourf(lon,lat,z2-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h); 
s=sprintf('AM2 minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias2,rms2);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lon,lat,z3-zo,vbin); shading flat;
colorbar; caxis([cmin cmax]); axis(xy); %clabel(C,h); 
s=sprintf('AM3 minus INTERIM (BIAS=%5.2f; RMSE=%5.2f)',bias3,rms3);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t850'; yl='850hPa T (K)'; k=1;
v=am4.v0; y1=squeeze(v.atm.t850.sea(k,:,:)); id1=(y1>-999);
v=am3.v0; y2=squeeze(v.atm.t850.sea(k,:,:)); id2=(y2>-999);
v=am2.v0; y3=squeeze(v.atm.t850.sea(k,:,:)); id3=(y3>-999);
id=id1&id2&id3;
y1=zmeanwithmask(y1,id);
y2=zmeanwithmask(y2,id);
y3=zmeanwithmask(y3,id);
figure; plot(y1,'r'); hold on; plot(y2,'g'); plot(y3,'b')
pms=[ 0, 0, 1600, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
yo=o.toa.netrad.ts.ann; to=[2001:2015];
y1=toa1.netrad.ann_stat.mmen.all; 
y2=toa2.netrad.ann_stat.mmen.all; 
y3=toa3.netrad.ann_stat.mmen.all; 
yo_avg=mean(yo(1:14));      so=sprintf('CERES (2001-2014avg=%5.2f)',yo_avg);
y1_avg=mean(y1(end-14:end));s1=sprintf('AM4.0 (2001-2014avg=%5.2f)',y1_avg);
y2_avg=mean(y2(end-7:end)); s2=sprintf('AM3   (2001-2007avg=%5.2f)',y2_avg);
y3_avg=mean(y3(:));         s3=sprintf('AM2.1');
plot(to,yo,'-sk','LineWidth',lw*2); hold on;
plot(t1,y1,'r', 'LineWidth',lw); hold on;
plot(t2,y2,'b', 'LineWidth',lw); hold on;
plot(t3,y3,'g', 'LineWidth',lw); hold on;
legend(so,s1,s2,s3,4);axis([1981 2015 -2.2 2.2]); 
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4amip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=am4a.v0;   toa1=v0.toa; t1=v0.time(1:end-1); s=v0.s;
v0=am4b.v0;   toa2=v0.toa; t2=v0.time(1:end-1);
v0=am4c.v0;   toa3=v0.toa; t3=v0.time(1:end-1);
v0=am3.v0;    toa4=v0.toa; t4=v0.time(1:end-1); 
v0=am2.v0;    toa5=v0.toa; t5=v0.time(1:end-1); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NETRADTOA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_ts'; yl='TOA net radiation (W/m2)';
pms=[ 0, 0, 1600, 700]*0.8; fsize=24; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
yo=o.toa.netrad.ts.ann; to=[2001:2014];
y1=toa1.netrad.ann_stat.mmen.all; 
y2=toa2.netrad.ann_stat.mmen.all; 
y3=toa3.netrad.ann_stat.mmen.all; 
y4=toa4.netrad.ann_stat.mmen.all; 
y5=toa5.netrad.ann_stat.mmen.all; 
yo_avg=mean(yo(1:14));      so=sprintf('CERES (2001-2014avg=%5.2f)',yo_avg);
y1_avg=mean(y1(end-14:end));s1=sprintf('AM4a  (2001-2014avg=%5.2f)',y1_avg);
y2_avg=mean(y2(end-14:end));s2=sprintf('AM4b  (2001-2014avg=%5.2f)',y2_avg);
y3_avg=mean(y3(end-14:end));s3=sprintf('AM4c  (2001-2014avg=%5.2f)',y3_avg);
y4_avg=mean(y4(end-7:end)); s4=sprintf('AM3   (2001-2007avg=%5.2f)',y4_avg);
y5_avg=mean(y5(:));         s5=sprintf('AM2.1');
plot(to,yo,'-sk','LineWidth',lw*2); hold on;
plot(t1,y1,'r', 'LineWidth',lw); hold on;
plot(t2,y2,'g', 'LineWidth',lw); hold on;
plot(t3,y3,'b', 'LineWidth',lw); hold on;
plot(t4,y4,'c', 'LineWidth',lw); hold on;
plot(t5,y5,'m', 'LineWidth',lw); hold on;
legend(so,s1,s2,s3,s4,s5,4);axis([1981 2015 -2.2 2.2]); 
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4amip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OLR%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnettoa_ts'; yl='TOA net radiation (W/m2)';
pms=[ 0, 0, 1600, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
yo=o.toa.lwnet.ts.ann; to=[2001:2015];
y1=toa1.lwnet.ann_stat.mmen.all; 
y2=toa2.lwnet.ann_stat.mmen.all; 
y3=toa3.lwnet.ann_stat.mmen.all; 
yo_avg=mean(yo(1:14));      so=sprintf('CERES (2001-2014avg=%5.2f)',yo_avg);
y1_avg=mean(y1(end-14:end));s1=sprintf('AM4.0 (2001-2014avg=%5.2f)',y1_avg);
y2_avg=mean(y2(end-7:end)); s2=sprintf('AM3   (2001-2007avg=%5.2f)',y2_avg);
y3_avg=mean(y3(:));         s3=sprintf('AM2.1');
plot(to,yo,'-sk','LineWidth',lw*2); hold on;
plot(t1,y1,'r', 'LineWidth',lw); hold on;
plot(t2,y2,'b', 'LineWidth',lw); hold on;
plot(t3,y3,'g', 'LineWidth',lw); hold on;
legend(so,s1,s2,s3,0); axis([1981 2015 233 242]); 
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4amip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SWABS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnettoa_ts'; yl='TOA net radiation (W/m2)';
pms=[ 0, 0, 1600, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
yo=o.toa.swnet.ts.ann; to=[2001:2015];
y1=toa1.swnet.ann_stat.mmen.all; 
y2=toa2.swnet.ann_stat.mmen.all; 
y3=toa3.swnet.ann_stat.mmen.all; 
yo_avg=mean(yo(1:14));      so=sprintf('CERES (2001-2014avg=%5.2f)',yo_avg);
y1_avg=mean(y1(end-14:end));s1=sprintf('AM4.0 (2001-2014avg=%5.2f)',y1_avg);
y2_avg=mean(y2(end-7:end)); s2=sprintf('AM3   (2001-2007avg=%5.2f)',y2_avg);
y3_avg=mean(y3(:));         s3=sprintf('AM2.1');
plot(to,yo,'-sk','LineWidth',lw*2); hold on;
plot(t1,y1,'r', 'LineWidth',lw); hold on;
plot(t2,y2,'b', 'LineWidth',lw); hold on;
plot(t3,y3,'g', 'LineWidth',lw); hold on;
legend(so,s1,s2,s3,4); axis([1981 2015 233 242]); 
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4amip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section 2: latitudional plots%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4g12r17.v0.s; a0=mean(s.aa,2); a0=a0';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fls'; yl='fraction of large-scale precipiation'; climo=1;
y1 =am2.v0.sfc.prec_ls.txavg0./am2.v0.sfc.pcp.txavg0;   s1='AM2';
y2 =am3.v0.sfc.prec_ls.txavg0./am3.v0.sfc.pcp.txavg0;   s2='AM3';
y3 =hiram.v0.sfc.prec_ls.txavg0./hiram.v0.sfc.pcp.txavg0; s3='HIRAM';
y4 =am4g11r11.v0.sfc.prec_ls.txavg0./am4g11r11.v0.sfc.pcp.txavg0; s4='AM4g11r11';
y5 =am4g12r16.v0.sfc.prec_ls.txavg0./am4g12r16.v0.sfc.pcp.txavg0; s5='AM4g12r16';
y6 =am4g12r17.v0.sfc.prec_ls.txavg0./am4g12r17.v0.sfc.pcp.txavg0; s6='AM4g12r17';
k=1; yo=squeeze(o.sfc.prec_ls.latdis.sea(k,:))./squeeze(o.sfc.pcp.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -1 1]; y.yl=yl; y.climo=climo;
y.so='ERA-INTERIM'; y.co='m';
y.varo=yo; y.var1=y1; y.var2=y2;
y.var3=y3; y.var4=y4; y.var5=y5; y.var6=y6;
y.s1=s1; y.s2=s2; y.s3=s3; y.s4=s4; y.s5=s5; y.s6=s6;
y.c1='k-'; y.c2='c-'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='m';
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4amip(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='iwp'; yl='ice water path (kg/m2)'; climo=1;
y1 =am2.v0.atm.iwp.txavg0;       s1='AM2';
y2 =am3.v0.atm.iwp.txavg0;       s2='AM3';
y3 =hiram.v0.atm.iwp.txavg0;     s3='HIRAM';
y4 =am4g11r11.v0.atm.iwp.txavg0; s4='AM4g11r11';
y5 =am4g12r16.v0.atm.iwp.txavg0; s5='AM4g12r16';
y6 =am4g12r17.v0.atm.iwp.txavg0; s6='AM4g12r17';
k=1; yo=squeeze(o.atm.iwp.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 0 0.1]; y.yl=yl; y.climo=climo;
y.so='ERA-INTERIM'; y.co='m';
y.varo=yo; y.var1=y1; y.var2=y2;
y.var3=y3; y.var4=y4; y.var5=y5; y.var6=y6;
y.s1=s1; y.s2=s2; y.s3=s3; y.s4=s4; y.s5=s5; y.s6=s6;
y.c1='k-'; y.c2='c-'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='m';
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4amip(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwp'; yl='Liquid water path (kg/m2)'; climo=1;
y1 =am2.v0.atm.lwp.txavg0;       s1='AM2';
y2 =am3.v0.atm.lwp.txavg0;       s2='AM3';
y3 =am4g11r11.v0.atm.lwp.txavg0; s3='AM4g11r11';
y4 =am4g12r16.v0.atm.lwp.txavg0; s4='AM4g12r16';
y5 =am4g12r17.v0.atm.lwp.txavg0; s5='AM4g12r17';
k=1; yo=squeeze(o.atm.lwp.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 0 0.1]; y.yl=yl; y.climo=climo;
y.so='ERA-INTERIM'; y.co='m';
y.varo=yo; y.var1=y1; y.var2=y2;
y.var3=y3; y.var4=y4; y.var5=y5; 
y.s1=s1;    y.s2=s2;    y.s3=s3;   y.s4=s4;   y.s5=s5;
y.c1='k-'; y.c2='c-'; y.c3='r-'; y.c4='g-'; y.c5='b-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4amip(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp'; yl='changes in surface precipitation (mm/day)'; climo=1;
y1 =am2.v0.sfc.pcp.txavg0;       s1='AM2';
y2 =am3.v0.sfc.pcp.txavg0;       s2='AM3';
y3 =am4g11r11.v0.sfc.pcp.txavg0; s3='AM4g11r11';
y4 =am4g12r16.v0.sfc.pcp.txavg0; s4='AM4g12r16';
y5 =am4g12r17.v0.sfc.pcp.txavg0; s5='AM4g12r17';
k=1; yo=squeeze(o.sfc.pcp.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
y.so='ERA-INTERIM'; y.co='m';
y.varo=yo; y.var1=y1; y.var2=y2;
y.var3=y3; y.var4=y4; y.var5=y5; 
y.s1=s1;    y.s2=s2;    y.s3=s3;   y.s4=s4;   y.s5=s5;
y.c1='k-'; y.c2='c-'; y.c3='r-'; y.c4='g-'; y.c5='b-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4amip(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dprec_cv'; yl='changes in convective precipitation (mm/day)'; climo=1;
ya =aref0.v0.sfc.prec_cv.txavg0;     sa='AM2like';
yb =aref0.w0.sfc.prec_cv.txavg0; 
yc =am3.v0.sfc.prec_cv.txavg0;       sb='AM3';
yd =am3.w0.sfc.prec_cv.txavg0; 
y1 =am4g11r11.v0.sfc.prec_cv.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.sfc.prec_cv.txavg0; 
y3 =am4g12r04.v0.sfc.prec_cv.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.sfc.prec_cv.txavg0;
y5 =am4g12r16.v0.sfc.prec_cv.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.sfc.prec_cv.txavg0;
y7 =am4g12r17.v0.sfc.prec_cv.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.sfc.prec_cv.txavg0; y8a =am4g12r17.u0.sfc.prec_cv.txavg0;
y9 =am4g12r18.v0.sfc.prec_cv.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.sfc.prec_cv.txavg0;
y11=am4g12r16c.v0.sfc.prec_cv.txavg0;
y12=am4g12r16c.w0.sfc.prec_cv.txavg0;
k=1; yo=squeeze(o.sfc.prec_cv.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='ERA-INTERIM'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9;
%y.var7=y12-y11;%y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dprec_ls'; yl='changes in large-scale precipitation (mm/day)'; climo=1;
ya =aref0.v0.sfc.prec_ls.txavg0;     sa='AM2like';
yb =aref0.w0.sfc.prec_ls.txavg0; 
yc =am3.v0.sfc.prec_ls.txavg0;       sb='AM3';
yd =am3.w0.sfc.prec_ls.txavg0; 
y1 =am4g11r11.v0.sfc.prec_ls.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.sfc.prec_ls.txavg0; 
y3 =am4g12r04.v0.sfc.prec_ls.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.sfc.prec_ls.txavg0;
y5 =am4g12r16.v0.sfc.prec_ls.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.sfc.prec_ls.txavg0;
y7 =am4g12r17.v0.sfc.prec_ls.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.sfc.prec_ls.txavg0; y8a =am4g12r17.u0.sfc.prec_ls.txavg0;
y9 =am4g12r18.v0.sfc.prec_ls.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.sfc.prec_ls.txavg0;
y11=am4g12r16c.v0.sfc.prec_ls.txavg0;
y12=am4g12r16c.w0.sfc.prec_ls.txavg0;
k=1; yo=squeeze(o.sfc.prec_ls.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='ERA-INTERIM'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9;
%y.var7=y12-y11;%y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetrad'; yl='changes in TOA net radiation (W/m2)'; climo=0;
ya =aref0.v0.toa.netrad.txavg0;     sa='AM2like';
yb =aref0.w0.toa.netrad.txavg0; 
yc =am3.v0.toa.netrad.txavg0;       sb='AM3';
yd =am3.w0.toa.netrad.txavg0; 
y1 =am4g11r11.v0.toa.netrad.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.toa.netrad.txavg0; 
y3 =am4g12r04.v0.toa.netrad.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.toa.netrad.txavg0;
y5 =am4g12r16.v0.toa.netrad.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.toa.netrad.txavg0;
y7 =am4g12r17.v0.toa.netrad.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.toa.netrad.txavg0; y8a =am4g12r17.u0.toa.netrad.txavg0;
y9 =am4g12r18.v0.toa.netrad.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.toa.netrad.txavg0;
y11=am4g12r16c.v0.toa.netrad.txavg0;
y12=am4g12r16c.w0.toa.netrad.txavg0;
k=1; yo=squeeze(o.toa.netrad.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='CERES'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9;
y.var7=y12-y11;%y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dswnet'; yl='changes in TOA SW radiation (W/m2)'; climo=0;
ya =aref0.v0.toa.swnet.txavg0;     sa='AM2like';
yb =aref0.w0.toa.swnet.txavg0; 
yc =am3.v0.toa.swnet.txavg0;       sb='AM3';
yd =am3.w0.toa.swnet.txavg0; 
y1 =am4g11r11.v0.toa.swnet.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.toa.swnet.txavg0; 
y3 =am4g12r04.v0.toa.swnet.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.toa.swnet.txavg0;
y5 =am4g12r16.v0.toa.swnet.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.toa.swnet.txavg0;
y7 =am4g12r17.v0.toa.swnet.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.toa.swnet.txavg0; y8a =am4g12r17.u0.toa.swnet.txavg0;
y9 =am4g12r18.v0.toa.swnet.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.toa.swnet.txavg0;
y11=am4g12r16c.v0.toa.swnet.txavg0;
y12=am4g12r16c.w0.toa.swnet.txavg0;
k=1; yo=squeeze(o.toa.swnet.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='CERES'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9;
y.var7=y12-y11;%y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dlwnet'; yl='changes in TOA LW radiation (W/m2)'; climo=0;
ya =aref0.v0.toa.lwnet.txavg0;     sa='AM2like';
yb =aref0.w0.toa.lwnet.txavg0; 
yc =am3.v0.toa.lwnet.txavg0;       sb='AM3';
yd =am3.w0.toa.lwnet.txavg0; 
y1 =am4g11r11.v0.toa.lwnet.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.toa.lwnet.txavg0; 
y3 =am4g12r04.v0.toa.lwnet.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.toa.lwnet.txavg0;
y5 =am4g12r16.v0.toa.lwnet.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.toa.lwnet.txavg0;
y7 =am4g12r17.v0.toa.lwnet.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.toa.lwnet.txavg0; y8a =am4g12r17.u0.toa.lwnet.txavg0;
y9 =am4g12r18.v0.toa.lwnet.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.toa.lwnet.txavg0;
y11=am4g12r16c.v0.toa.lwnet.txavg0;
y12=am4g12r16c.w0.toa.lwnet.txavg0;
k=1; yo=squeeze(o.toa.lwnet.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='CERES'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9;
y.var7=y12-y11;%y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dttcf'; yl='changes in TOA net CRE (W/m2)'; climo=0;
ya =aref0.v0.toa.ttcf.txavg0;     sa='AM2like';
yb =aref0.w0.toa.ttcf.txavg0; 
yc =am3.v0.toa.ttcf.txavg0;       sb='AM3';
yd =am3.w0.toa.ttcf.txavg0; 
y1 =am4g11r11.v0.toa.ttcf.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.toa.ttcf.txavg0; 
y3 =am4g12r04.v0.toa.ttcf.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.toa.ttcf.txavg0;
y5 =am4g12r16.v0.toa.ttcf.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.toa.ttcf.txavg0;
y7 =am4g12r17.v0.toa.ttcf.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.toa.ttcf.txavg0; y8a =am4g12r17.u0.toa.ttcf.txavg0;
y9 =am4g12r18.v0.toa.ttcf.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.toa.ttcf.txavg0;
y11=am4g12r16c.v0.toa.ttcf.txavg0;
y12=am4g12r16c.w0.toa.ttcf.txavg0;
k=1; yo=squeeze(o.toa.ttcf.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='CERES'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9;
y.var7=y12-y11;%y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dswcf'; yl='changes in TOA SW CRE (W/m2)'; climo=0;
ya =aref0.v0.toa.swcf.txavg0;     sa='AM2like';
yb =aref0.w0.toa.swcf.txavg0; 
yc =am3.v0.toa.swcf.txavg0;       sb='AM3';
yd =am3.w0.toa.swcf.txavg0; 
y1 =am4g11r11.v0.toa.swcf.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.toa.swcf.txavg0; 
y3 =am4g12r04.v0.toa.swcf.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.toa.swcf.txavg0;
y5 =am4g12r16.v0.toa.swcf.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.toa.swcf.txavg0;
y7 =am4g12r17.v0.toa.swcf.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.toa.swcf.txavg0; y8a =am4g12r17.u0.toa.swcf.txavg0;
y9 =am4g12r18.v0.toa.swcf.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.toa.swcf.txavg0;
y11=am4g12r16c.v0.toa.swcf.txavg0;
y12=am4g12r16c.w0.toa.swcf.txavg0;
k=1; yo=squeeze(o.toa.swcf.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='CERES'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9;
y.var7=y12-y11;%y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dlwcf'; yl='changes in TOA LW CRE (W/m2)'; climo=0;
ya =aref0.v0.toa.lwcf.txavg0;     sa='AM2like';
yb =aref0.w0.toa.lwcf.txavg0; 
yc =am3.v0.toa.lwcf.txavg0;       sb='AM3';
yd =am3.w0.toa.lwcf.txavg0; 
y1 =am4g11r11.v0.toa.lwcf.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.toa.lwcf.txavg0; 
y3 =am4g12r04.v0.toa.lwcf.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.toa.lwcf.txavg0;
y5 =am4g12r16.v0.toa.lwcf.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.toa.lwcf.txavg0;
y7 =am4g12r17.v0.toa.lwcf.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.toa.lwcf.txavg0; y8a =am4g12r17.u0.toa.lwcf.txavg0;
y9 =am4g12r18.v0.toa.lwcf.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.toa.lwcf.txavg0;
y11=am4g12r16c.v0.toa.lwcf.txavg0;
y12=am4g12r16c.w0.toa.lwcf.txavg0;
k=1; yo=squeeze(o.toa.lwcf.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='CERES'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9;
y.var7=y12-y11;%y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dlwp'; yl='changes in LWP (kg/m2)'; climo=0;
ya =aref0.v0.atm.lwp.txavg0;     sa='AM2like';
yb =aref0.w0.atm.lwp.txavg0; 
yc =am3.v0.atm.lwp.txavg0;       sb='AM3';
yd =am3.w0.atm.lwp.txavg0; 
y1 =am4g11r11.v0.atm.lwp.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.atm.lwp.txavg0; 
y3 =am4g12r04.v0.atm.lwp.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.atm.lwp.txavg0;
y5 =am4g12r16.v0.atm.lwp.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.atm.lwp.txavg0;
y7 =am4g12r17.v0.atm.lwp.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.atm.lwp.txavg0; y8a =am4g12r17.u0.atm.lwp.txavg0;
y9 =am4g12r18.v0.atm.lwp.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.atm.lwp.txavg0;
y11=am4g12r16c.v0.atm.lwp.txavg0;
y12=am4g12r16c.w0.atm.lwp.txavg0;
k=1; yo=squeeze(o.atm.lwp.latdis.sea(k,:)); y.varo=yo; 
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='ERA-INTERM'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9;
y.var7=y12-y11;%y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='diwp'; yl='changes in IWP (kg/m2)'; climo=0;
ya =aref0.v0.atm.iwp.txavg0;     sa='AM2like';
yb =aref0.w0.atm.iwp.txavg0; 
yc =am3.v0.atm.iwp.txavg0;       sb='AM3';
yd =am3.w0.atm.iwp.txavg0; 
y1 =am4g11r11.v0.atm.iwp.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.atm.iwp.txavg0; 
y3 =am4g12r04.v0.atm.iwp.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.atm.iwp.txavg0;
y5 =am4g12r16.v0.atm.iwp.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.atm.iwp.txavg0;
y7 =am4g12r17.v0.atm.iwp.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.atm.iwp.txavg0; y8a =am4g12r17.u0.atm.iwp.txavg0;
y9 =am4g12r18.v0.atm.iwp.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.atm.iwp.txavg0;
y11=am4g12r16c.v0.atm.iwp.txavg0;
y12=am4g12r16c.w0.atm.iwp.txavg0;
k=1; yo=squeeze(o.atm.iwp.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='CERES'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9;
y.var7=y12-y11;%y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dqal'; yl='changes in low cloud amount (%)'; climo=0;
ya =aref0.v0.atm.qal.txavg0;     sa='AM2like';
yb =aref0.w0.atm.qal.txavg0; 
yc =am3.v0.atm.qal.txavg0;       sb='AM3';
yd =am3.w0.atm.qal.txavg0; 
y1 =am4g11r11.v0.atm.qal.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.atm.qal.txavg0; 
y3 =am4g12r04.v0.atm.qal.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.atm.qal.txavg0;
y5 =am4g12r16.v0.atm.qal.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.atm.qal.txavg0;
y7 =am4g12r17.v0.atm.qal.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.atm.qal.txavg0; y8a =am4g12r17.u0.atm.qal.txavg0;
y9 =am4g12r18.v0.atm.qal.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.atm.qal.txavg0;
y11=am4g12r16c.v0.atm.qal.txavg0;
y12=am4g12r16c.w0.atm.qal.txavg0;
k=1; yo=squeeze(o.atm.qal.latdis.sea(k,:))*100; y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='ERA-INTERIM'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9; 
y.var7=y12-y11;%y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dqam'; yl='changes in middle cloud amount (%)'; climo=0;
ya =aref0.v0.atm.qam.txavg0;     sa='AM2like';
yb =aref0.w0.atm.qam.txavg0; 
yc =am3.v0.atm.qam.txavg0;       sb='AM3';
yd =am3.w0.atm.qam.txavg0; 
y1 =am4g11r11.v0.atm.qam.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.atm.qam.txavg0; 
y3 =am4g12r04.v0.atm.qam.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.atm.qam.txavg0;
y5 =am4g12r16.v0.atm.qam.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.atm.qam.txavg0;
y7 =am4g12r17.v0.atm.qam.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.atm.qam.txavg0; y8a =am4g12r17.u0.atm.qam.txavg0;
y9 =am4g12r18.v0.atm.qam.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.atm.qam.txavg0;
y11=am4g12r16c.v0.atm.qam.txavg0;
y12=am4g12r16c.w0.atm.qam.txavg0;
k=1; yo=squeeze(o.atm.qam.latdis.sea(k,:))*100; y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='ERA-INTERIM'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9; 
y.var7=y12-y11;%y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dqah'; yl='changes in high cloud amount (%)'; climo=0;
ya =aref0.v0.atm.qah.txavg0;     sa='AM2like';
yb =aref0.w0.atm.qah.txavg0; 
yc =am3.v0.atm.qah.txavg0;       sb='AM3';
yd =am3.w0.atm.qah.txavg0; 
y1 =am4g11r11.v0.atm.qah.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.atm.qah.txavg0; 
y3 =am4g12r04.v0.atm.qah.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.atm.qah.txavg0;
y5 =am4g12r16.v0.atm.qah.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.atm.qah.txavg0;
y7 =am4g12r17.v0.atm.qah.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.atm.qah.txavg0; y8a =am4g12r17.u0.atm.qah.txavg0;
y9 =am4g12r18.v0.atm.qah.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.atm.qah.txavg0;
y11=am4g12r16c.v0.atm.qah.txavg0;
y12=am4g12r16c.w0.atm.qah.txavg0;
k=1; yo=squeeze(o.atm.qah.latdis.sea(k,:))*100; y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='ERA-INTERIM'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9;
y.var7=y12-y11;%y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtsurf'; yl='changes in surface temperature (K)'; climo=1;
ya =aref0.v0.sfc.tsurf.txavg0;     sa='AM2like';
yb =aref0.w0.sfc.tsurf.txavg0; 
yc =am3.v0.sfc.tsurf.txavg0;       sb='AM3';
yd =am3.w0.sfc.tsurf.txavg0; 
y1 =am4g11r11.v0.sfc.tsurf.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.sfc.tsurf.txavg0; 
y3 =am4g12r04.v0.sfc.tsurf.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.sfc.tsurf.txavg0;
y5 =am4g12r16.v0.sfc.tsurf.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.sfc.tsurf.txavg0;
y7 =am4g12r17.v0.sfc.tsurf.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.sfc.tsurf.txavg0; y8a =am4g12r17.u0.sfc.tsurf.txavg0;
y9 =am4g12r18.v0.sfc.tsurf.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.sfc.tsurf.txavg0;
y11=am4g12r16c.v0.sfc.tsurf.txavg0;
y12=am4g12r16c.w0.sfc.tsurf.txavg0;
%k=1; yo=squeeze(o.sfc.tsurf.latdis.sea(k,:)); yo=yo'; y.varo=yo;
k=1; yo=squeeze(mean(o.sfc.tsurf.sea(k,:,:),3)); yo=yo'; y.varo=yo; 
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  y.var1=ya-yo; y.var2=yc-yo;
  y.var3=y1-yo; y.var4=y3-yo; y.var5=y5-yo; y.var6=y7-yo; y.var7=y9-yo;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='ERA-INTERIM'; y.co='m'; y.varo(:)=0;
else
  y.var1=yb-ya; y.var2=yd-yc;
  y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9;
  %y.var7=y12-y11;%y.var7=y7-y8a;
end
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref'; yl='changes in surface air temperature (K)'; climo=1;
ya =aref0.v0.sfc.tref.txavg0;     sa='AM2like';
yb =aref0.w0.sfc.tref.txavg0; 
yc =am3.v0.sfc.tref.txavg0;       sb='AM3';
yd =am3.w0.sfc.tref.txavg0; 
y1 =am4g11r11.v0.sfc.tref.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.sfc.tref.txavg0; 
y3 =am4g12r04.v0.sfc.tref.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.sfc.tref.txavg0;
y5 =am4g12r16.v0.sfc.tref.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.sfc.tref.txavg0;
y7 =am4g12r17.v0.sfc.tref.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.sfc.tref.txavg0; y8a =am4g12r17.u0.sfc.tref.txavg0;
y9 =am4g12r18.v0.sfc.tref.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.sfc.tref.txavg0;
y11=am4g12r16c.v0.sfc.tref.txavg0;
y12=am4g12r16c.w0.sfc.tref.txavg0;
k=1; yo=squeeze(o.sfc.tref.latdis.sea(k,:)); yo=yo'; y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  y.var1=ya-yo; y.var2=yc-yo;
  y.var3=y1-yo; y.var4=y3-yo; y.var5=y5-yo; y.var6=y7-yo; y.var7=y9-yo;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='ERA-INTERIM'; y.co='m'; y.varo(:)=0;
else
  y.var1=yb-ya; y.var2=yd-yc;
  y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9;
  %y.var7=y12-y11;%y.var7=y7-y8a;
end
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dt1000'; yl='changes in temperature at 1000hPa (K)'; climo=1;
ya =aref0.v0.atm.t1000.txavg0;     sa='AM2like';
yb =aref0.w0.atm.t1000.txavg0; 
yc =am3.v0.atm.t1000.txavg0;       sb='AM3';
yd =am3.w0.atm.t1000.txavg0; 
y1 =am4g11r11.v0.atm.t1000.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.atm.t1000.txavg0; 
y3 =am4g12r04.v0.atm.t1000.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.atm.t1000.txavg0;
y5 =am4g12r16.v0.atm.t1000.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.atm.t1000.txavg0;
y7 =am4g12r17.v0.atm.t1000.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.atm.t1000.txavg0; y8a =am4g12r17.u0.atm.t1000.txavg0;
y9 =am4g12r18.v0.atm.t1000.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.atm.t1000.txavg0;
y11=am4g12r16c.v0.atm.t1000.txavg0;
y12=am4g12r16c.w0.atm.t1000.txavg0;
k=1; yo=squeeze(o.atm.t1000.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='ERA-INTERIM'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9;
%y.var7=y12-y11;%y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtaux'; yl='changes in large-scale precipitation (mm/day)'; climo=1;
ya =aref0.v0.sfc.taux.txavg0;     sa='AM2like';
yb =aref0.w0.sfc.taux.txavg0; 
yc =am3.v0.sfc.taux.txavg0;       sb='AM3';
yd =am3.w0.sfc.taux.txavg0; 
y1 =am4g11r11.v0.sfc.taux.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.sfc.taux.txavg0; 
y3 =am4g12r04.v0.sfc.taux.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.sfc.taux.txavg0;
y5 =am4g12r16.v0.sfc.taux.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.sfc.taux.txavg0;
y7 =am4g12r17.v0.sfc.taux.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.sfc.taux.txavg0; y8a =am4g12r17.u0.sfc.taux.txavg0;
y9 =am4g12r18.v0.sfc.taux.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.sfc.taux.txavg0;
y11=am4g12r16c.v0.sfc.taux.txavg0;
y12=am4g12r16c.w0.sfc.taux.txavg0;
k=1; yo=squeeze(o.sfc.taux.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='ERA-INTERIM'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9;
%y.var7=y12-y11;%y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0; s.nlon=z.nlon
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcf'; k=1; vname=strcat('eis_p2K',vname);
xo=squeeze(o.toa.swcf.sea(k,:,:))*100.;
x0=squeeze(am4.c0.toa.swcf.sea(k,:,:)); 
x1=squeeze(am4.w0.toa.swcf.sea(k,:,:)); s.s1='(a) AM4.0-C0 (P2K-CNTL)';
x2=squeeze(am4.c9.toa.swcf.sea(k,:,:)); s.s2='(b) AM4.0-C9 (P2K-CNTL)';
x3=squeeze(am4.w9.toa.swcf.sea(k,:,:)); s.s3='(c) (a) minus (b)';
z1=x1-x0; z2=x3-x2; z3=z1-z2;
s.lonx=s.lonx-180; s.lmx=circshift(s.lmx,[0 s.nlon/2]);
s.lon=s.lon-180; nx=length(z1(1,:))/2;
z1=circshift(z1,[0 nx]); z2=circshift(z2,[0 nx]); z3=circshift(z3,[0 nx]);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen'; f=0.5; ncolor=64
plot_3panel_am4(s,z1,z2,z3,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcf'; k=1; vname=strcat('eis_p2K',vname);
xo=squeeze(o.toa.swcf.sea(k,:,:))*100.;
x0=squeeze(am4.c0.toa.swcf.sea(k,:,:)); 
x1=squeeze(am4.w0.toa.swcf.sea(k,:,:)); s.s1='(a) AM4.0-C0 (P2K-CNTL)';
x2=squeeze(am4.c9.toa.swcf.sea(k,:,:)); s.s2='(b) AM4.0-C9 (P2K-CNTL)';
x3=squeeze(am4.w9.toa.swcf.sea(k,:,:)); s.s3='(c) (a) minus (b)';
z1=x1-x0; z2=x3-x2; z3=z1-z2;
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='AM4sen'; f=0.5; ncolor=64
plot_3panel_am4(s,z1,z2,z3,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
