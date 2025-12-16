%below opt=1 for writing mat file to /work/miz
%below opt=2 for writing mat file to /archive
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
latlon=[0 360 -90 90];region='global';mod='c96';myr=5; opt=2;
%latlon=[0 360  30 90];region='nhextr';mod='c96';myr=5; opt=2; 
%latlon=[0 360 -30 30];region='tropic';mod='c96';myr=5; opt=2; 
%latlon=[150 250 -5 5]; region='equpac'; nyr=5; myr=1; opt=0;
%read in or generate observation data
%o=readobs(latlon,region,'c48');
%fn=strcat('/work/miz/mat_cm4/obs_',region,'_to_c48.mat'); load(fn);
fn=strcat('/work/miz/mat_am4p0/obs_',region,'_to_c48.mat'); load(fn);

tpath='/archive/Ming.Zhao/awg/warsaw/';
expn='CM4_cntl_run814';yr1='0601';yr2='0650';syr=1;nyr=50;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='CM4_hist_run789';yr1='1850';yr2='2014';syr=1;nyr=165;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_cntl_run759';yr1='0001';yr2='0360';syr=141;nyr=165;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='CM2.1U-D4_1860-2000-AllForc_H1';yr1='1861';yr2='2000';syr=1;nyr=140;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM2.1U_Control-1860_D4';yr1='0001';yr2='0100';syr=1;nyr=100;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM2.1U-D4_1PctTo2X_I1';yr1='0001';yr2='0100';syr=1;nyr=80;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='CM3Z_D1_1860-2005_AllForc_H1';yr1='1860';yr2='2005';syr=2;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM3Z_Control-1860_D1';yr1='0001';yr2='0200';syr=1;nyr=80;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM3Z_D1_1PctTo4X_I1';yr1='0001';yr2='0140';syr=1;nyr=80;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
latlon=[0 360 -90 90];region='global';mod='c96';myr=5; opt=2;
fn=strcat('/work/miz/mat_am4p0/obs_',region,'_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat'); 
tpath='/archive/Ming.Zhao/awg/warsaw/'; myr=5;
expn='c96L33_am4p0_longamip';                fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.h0=v;
expn='c96L33_am4p0_longamip_1850rad';        fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c0=v;
expn='CM4_cntl_run759';                      fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm4.v0=v;
expn='CM4_hist_run789';                      fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm4.h0=v;

expn='CM4_cntl_run814';                      fn=strcat(tpath,expn,pp,expn,dr);load(fn);v0=v;

tpath='/archive/Ming.Zhao/mdt/20170118/';
expn='CM2.1U_Control-1860_D4';               fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm21.v0=v;
expn='CM2.1U-D4_1PctTo2X_I1';                fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm21.w0=v;
expn='CM2.1U-D4_1860-2000-AllForc_H1';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm21.h0=v;
expn='CM3Z_Control-1860_D1';                 fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm3.v0=v;
expn='CM3Z_D1_1PctTo4X_I1';                  fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm3.w0=v;
expn='CM3Z_D1_1860-2005_AllForc_H1';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm3.h0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

z1=squeeze(mean(v0.sfc.tref.ann(1:5, :,:),1));
z2=squeeze(mean(v0.sfc.tref.ann(8:10,:,:),1));
figure; contourf(z2-z1); colorbar;


lon=v0.s.lon; lat=v0.s.lat; lm=v0.s.lm0;
z1=squeeze(mean(v0.sfc.ice.ann(1:5, :,:),1));
z2=squeeze(mean(v0.sfc.ice.ann(8:10,:,:),1));
figure; contourf(lon,lat,z1,[-1:0.01:1]); shading flat; colorbar;
caxis([-1 1]);
    
figure; vmin=-0.5; vmax=0.5; vbin=[vmin:0.01:vmax];
contourf(lon,lat,z2-z1); colorbar; caxis([vmin vmax]); hold on;
contour (lon,lat,lm,[1],'k')


lon=v0.s.lon; lat=v0.s.lat; lm=v0.s.lm0;
z1=squeeze(mean(v0.sfc.tref.ann(1:5, :,:),1));
z2=squeeze(mean(v0.sfc.tref.ann(8:10,:,:),1));
figure; contourf(lon,lat,z1); colorbar; hold on;
figure;
contourf(lon,lat,z2-z1); colorbar; caxis([-8 8]); hold on;
contour (lon,lat,lm,[1],'k')

lon=v0.s.lon; lat=v0.s.lat; lm=v0.s.lm0;
z1=squeeze(mean(v0.toa.swnet.ann(1:5, :,:),1));
z2=squeeze(mean(v0.toa.swnet.ann(8:10,:,:),1));
figure; contourf(lon,lat,z1); colorbar; hold on;
contourf(lon,lat,z2-z1); colorbar; hold on;
contour (lon,lat,lm,[1],'k')

lon=v0.s.lon; lat=v0.s.lat; lm=v0.s.lm0;
z1=squeeze(mean(v0.toa.swcf.ann(1:5, :,:),1));
z2=squeeze(mean(v0.toa.swcf.ann(8:10,:,:),1));
figure; contourf(lon,lat,z1); colorbar; grid on;
figure;
contourf(lon,lat,z2-z1); colorbar; caxis([-8 8]); hold on;
contour (lon,lat,lm,[1],'k'); grid on;

lon=v0.s.lon; lat=v0.s.lat; lm=v0.s.lm0;
z1=squeeze(mean(v0.toa.lwcf.ann(1:5, :,:),1));
z2=squeeze(mean(v0.toa.lwcf.ann(8:10,:,:),1));
figure; contourf(lon,lat,z1); colorbar; hold on;
contourf(lon,lat,z2-z1); colorbar; caxis([-8 8]); hold on;
contour (lon,lat,lm,[1],'k')

z1=squeeze(mean(v0.toa.lwnet.ann(1:5, :,:),1));
z2=squeeze(mean(v0.toa.lwnet.ann(8:10,:,:),1));
contourf(lon,lat,z2-z1); colorbar; caxis([-8 8]); hold on;
contour (lon,lat,lm,[1],'k')


z1=squeeze(mean(v0.atm.lwp.ann(1:5, :,:),1));
z2=squeeze(mean(v0.atm.lwp.ann(8:10,:,:),1));
figure;
contourf(lon,lat,(z2-z1)*1000); colorbar; caxis([-8 8]); hold on;
contour (lon,lat,lm,[1],'k')


z1=squeeze(mean(v0.atm.qal.ann(1:5, :,:),1));
z2=squeeze(mean(v0.atm.qal.ann(8:10,:,:),1));
figure; contourf(lon,lat,z1); colorbar; grid on;
figure;
contourf(lon,lat,z2-z1); colorbar; caxis([-8 8]); hold on;
contour (lon,lat,lm,[1],'k'); grid on;



z1=squeeze(mean(v0.atm.qal.all(1:25, :,:,:))); 
z2=squeeze(mean(v0.atm.qal.all(36:50,:,:,:))); 
m1=11; m2=12;
z1=squeeze(mean(z1(m1:m2,:,:),1));
z2=squeeze(mean(z2(m1:m2,:,:),1));
figure;
contourf(lon,lat,z2-z1); colorbar; caxis([-8 8]); hold on;
contour (lon,lat,lm,[1],'k'); grid on;


z1=squeeze(mean(v0.atm.lwp.all(1:25, :,:,:))); 
z2=squeeze(mean(v0.atm.lwp.all(36:50,:,:,:))); 
m1=1; m2=12;
z1=squeeze(mean(z1(m1:m2,:,:),1));
z2=squeeze(mean(z2(m1:m2,:,:),1));
figure;
contourf(lon,lat,(z2-z1)*1000.); colorbar; caxis([-8 8]); hold on;
contour (lon,lat,lm,[1],'k'); grid on;


z1=squeeze(mean(v0.toa.swcf.all(1:25, :,:,:),1)); 
z2=squeeze(mean(v0.toa.swcf.all(36:50,:,:,:),1)); 
m1=9; m2=10;
z1=squeeze(mean(z1(m1:m2,:,:),1));
z2=squeeze(mean(z2(m1:m2,:,:),1));
figure; contourf(lon,lat,z1); colorbar; grid on;
figure; contourf(lon,lat,z2); colorbar; grid on;
figure; vmin=-40; vmax=40; vbin=[vmin:1:vmax];
contourf(lon,lat,(z2-z1),vbin); shading flat; colorbar; 
caxis([vmin vmax]); hold on;
contour (lon,lat,lm,[1],'k'); grid on;

z1=squeeze(mean(v0.toa.swcf.all(1:25, :,:,:),1)); 
z2=squeeze(mean(v0.toa.swcf.all(36:50,:,:,:),1)); 
m1=9; m2=10;
z1=squeeze(mean(z1(m1:m2,:,:),1));
z2=squeeze(mean(z2(m1:m2,:,:),1));
figure; contourf(lon,lat,z1); colorbar; grid on;
figure; contourf(lon,lat,z2); colorbar; grid on;
figure; vmin=-40; vmax=40; vbin=[vmin:1:vmax];
contourf(lon,lat,(z2-z1),vbin); shading flat; colorbar; 
caxis([vmin vmax]); hold on;
contour (lon,lat,lm,[1],'k'); grid on;



for t=1:45;
  a=squeeze(var(t,:,:,:))-clm;
  ava(t,:,:,:)=a;
end
var_zavg=squeeze(mean(var,4));
ava_zavg=squeeze(mean(ava,4));

m=3; t=[1:45]; lat=v0.s.lat';
zz=squeeze(ava_zavg(:,m,:)); zz=zz';
pms=[ 0, 0, 1200, 800]*1.5; vbin=[-2:0.1:2];
handle=figure('Position',pms,'visible','on'); lw=2;
contourf(t,lat,zz,vbin); caxis([-2 2]);

var=v0.sfc.tref.all; clm=v0.sfc.tref.clm;

for t=1:45;
  a=squeeze(var(t,:,:,:))-clm;
  ava(t,:,:,:)=a;
end
var_zavg=squeeze(mean(var,4));
ava_zavg=squeeze(mean(ava,4));

m=3; t=[1:45]; lat=v0.s.lat';
zz=squeeze(ava_zavg(:,m,:)); zz=zz';
pms=[ 0, 0, 1200, 800]*1.5; vbin=[-2:0.1:2];
handle=figure('Position',pms,'visible','on'); lw=2;
contourf(t,lat,zz,vbin); caxis([-2 2]);

aa0=squeeze(mean(v0.s.aa,2));
for t=1:45
  for m=1:12
    z1=squeeze(ava_zavg(t,m,:)).*aa0;
    z(t,m,:)=z1;
  end
end

m=12; id=(lat<-30); 
for t=1:45
  for m=1:12
    z2(t,m)=mean(z(t,m,id));
  end
end
  
pms=[ 0, 0, 1200, 800]*1.5; vbin=[-2:0.1:2];
handle=figure('Position',pms,'visible','on'); lw=2;
plot(z2(:,12),'r'); hold on;
figure; plot(v0.sfc.tref.ts.org_ann);
figure; plot(v0.sfc.tref.ts.org_ann_sh);

y0=v0.sfc.tref.ts.org_ann;    y0=y0-mean(y0);
y1=v0.sfc.tref.ts.org_ann_sh; y1=y1-mean(y1);
y2=v0.sfc.tref.ts.org_ann_nh; y2=y2-mean(y2);
y3=v0.sfc.tref.ts.org_ann_tr; y3=y3-mean(y3);
pms=[ 0, 0, 1200, 800]*1.8; vbin=[-2:0.1:2];
handle=figure('Position',pms,'visible','on'); lw=2;
row=2; col=2; t=[601:650]; fsize=18
subplot(row,col,1)
%plot(t,y0,'k','LineWidth',lw); hold on; 
plot(t,y1,'r','LineWidth',lw); hold on; 
%plot(t,y2,'g','LineWidth',lw); hold on; 
%plot(t,y3,'b','LineWidth',lw); hold on; 
ylabel('Surface air temperature anomaly (K)')
legend('SH (30S-90S) surface air temperature anomaly',2);
set(gca,'FontSize',fsize);
subplot(row,col,2); 
y0=v0.toa.swnet.ts.org_ann_sh;     y0=y0-mean(y0);
y1=v0.toa.swnet_clr.ts.org_ann_sh; y1=y1-mean(y1);
y2=v0.toa.swcf.ts.org_ann_sh;      y2=y2-mean(y2);
plot(t,y0,'k','LineWidth',lw); hold on; 
plot(t,y1,'r','LineWidth',lw); hold on; 
plot(t,y2,'g','LineWidth',lw); 
legend('SH (30S-90S) TOA net SW','SH (30S-90S) clear-sky TOA net SW','SH (30S-90S) TOA SW CRE',2);
ylabel('TOA radiative flux (W/m2)')
set(gca,'FontSize',fsize);
subplot(row,col,3); vmin=-15; vmax=15; vbin=[vmin:1:vmax];
lon=v0.s.lon; lat=v0.s.lat; lm=v0.s.lm0;
z1=squeeze(mean(v0.toa.swnet_clr.ann(1:6, :,:),1));
z2=squeeze(mean(v0.toa.swnet_clr.ann(9:10,:,:),1));
contourf(lon,lat,(z2-z1),vbin); shading flat; colorbar; 
caxis([vmin vmax]); hold on;
contour (lon,lat,lm,[1],'k'); grid on;
title('change in clear-sky TOA SW radiation (last 10yr minus first 30yr: W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize);
subplot(row,col,4); 
lon=v0.s.lon; lat=v0.s.lat; lm=v0.s.lm0;
z1=squeeze(mean(v0.toa.swcf.ann(1:6, :,:),1));
z2=squeeze(mean(v0.toa.swcf.ann(9:10,:,:),1));
contourf(lon,lat,(z2-z1),vbin); shading flat; colorbar; 
caxis([vmin vmax]); hold on;
contour (lon,lat,lm,[1],'k'); grid on;
title('change in TOA SW CRE (last 10yr minus first 30yr: W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='cm4'; vname='rad';
printit(visfig,figpath,expn,vname);


plot(y0,'k'); hold on; plot(y1,'b'); hold on; plot(y2,'r')


y0=v0.sfc.swnet.ts.org_ann_sh;     y0=y0-mean(y0);
y1=v0.sfc.swnet_clr.ts.org_ann_sh; y1=y1-mean(y1);
y2=v0.sfc.swcf.ts.org_ann_sh;      y2=y2-mean(y2);
figure; 
plot(y0,'k'); hold on; plot(y1,'b'); hold on; plot(y2,'r')


y0=v0.toa.lwnet.ts.org_ann_sh;     y0=y0-mean(y0);
y1=v0.toa.lwnet_clr.ts.org_ann_sh; y1=y1-mean(y1);
y2=v0.toa.lwcf.ts.org_ann_sh;      y2=y2-mean(y2);
figure; 
plot(y0,'k'); hold on; plot(y1,'b'); hold on; plot(y2,'r')



y0=v0.toa.swnet.ts.org_ann_nh;     y0=y0-mean(y0);
y1=v0.toa.swnet_clr.ts.org_ann_nh; y1=y1-mean(y1);
y2=v0.toa.swcf.ts.org_ann_nh;      y2=y2-mean(y2);
figure; 
plot(y0,'k'); hold on; plot(y1,'b'); hold on; plot(y2,'r')



size(a)
a_zavg=mean(a,4);
mon=12; 
m_zavg=squeeze(a_zavg(:,mon,:)); x=m_zavg;
m_tzavg=mean(m_zavg,1); 
for t=1:45;
  x(t,:)=m_tzavg;
end
m_zavg=m_zavg-x; 


pms=[ 0, 0, 1200, 800]*1.5; vbin=[-2:0.1:2];
handle=figure('Position',pms,'visible','on'); lw=2;
contourf([1:45],v0.s.lat,m_zavg',vbin); caxis([-2 2]); colorbar;

figure; plot(mzavg(

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*1.5;
handle=figure('Position',pms,'visible','on'); lw=2;
plot([1870:2014],am4.h0.sfc.tref.ts.org_ann, 'g-', 'LineWidth',lw); hold on;
plot([1850:2014],cm4.h0.sfc.tref.ts.org_ann, 'r-', 'LineWidth',lw); hold on;
plot([1861:2000],cm21.h0.sfc.tref.ts.org_ann,'k-', 'LineWidth',lw); hold on;
plot([1861:2005],cm3.h0.sfc.tref.ts.org_ann, 'b-', 'LineWidth',lw); hold on;
plot([1850:2014],cm4.v0.sfc.tref.ts.org_ann, 'r--','LineWidth',lw); hold on;
plot([1861:1960],cm21.v0.sfc.tref.ts.org_ann,'k--','LineWidth',lw'); hold on;
plot([1861:1940],cm3.v0.sfc.tref.ts.org_ann, 'b--','LineWidth',lw'); hold on;
legend('AM4','CM4','CM2.1','CM3','CM2.1-CTL','CM3-CTL',2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section I: Analysis of historical runs%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g.gb=readsat_giss_gb(); g.nh=readsat_giss_nh(); g.sh=readsat_giss_sh(); 
%yr1=1951; yr2=1980; vname='SAT_1951_1980';
yr1=1881; yr2=1920; vname='SAT_1881_1920';
%yr1=1920; yr2=1960; vname='SAT_1920_1959';
id=(g.gb.year>=yr1)&(g.gb.year<=yr2); 
g.gb.all=g.gb.all-mean(g.gb.all(id));
g.nh.all=g.nh.all-mean(g.nh.all(id));
g.sh.all=g.sh.all-mean(g.sh.all(id));
%for longamip--------------------
tx=[1871:2015]; id=(tx>=yr1)&(tx<=yr2);
a=am4.h0.sfc.tref.ts.org_ann;    yx.gb=a-mean(a(id));
a=am4.h0.sfc.tref.ts.org_ann_nh; yx.nh=a-mean(a(id));
a=am4.h0.sfc.tref.ts.org_ann_sh; yx.sh=a-mean(a(id));
%for cm2.1-------------------------
t=[1861:1940]; t2=[1861:2000]; y2=get_tref_hist(cm21,t,t2,yr1,yr2);
%for cm3-------------------------
t=[1861:1940]; t3=[1861:2005]; y3=get_tref_hist(cm3, t,t3,yr1,yr2);
%for CM4-----------------------
t=[1850:2014]; t4=[1850:2014]; y4=get_tref_hist(cm4, t,t4,yr1,yr2);
%--------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.; fsize=28; x=[5:5:20]-2.5; 
x1=[5:5:140]-2.5; x2=[65:5:140]-2.5; 
handle=figure('Position',pms,'visible','on'); lw=3;
plot(g.gb.year,g.gb.all,'k',  'LineWidth',lw); hold on; s0='OBS (GISS)';
%plot(tx,   yx.gb,  'g-', 'LineWidth',lw); sx='AM4-longamip';
plot(t2,    y2.gb,  'g-', 'LineWidth',lw); s2='CM2.1';
plot(t3,    y3.gb,  'b-', 'LineWidth',lw); s3='CM3';
plot(t4,    y4.gb,  'r-', 'LineWidth',lw); s4='CM4';
plot([yr1 yr1],[-2 2],'k:'); plot([yr2 yr2],[-2 2],'k:');
plot([1840 2017],[0 0], 'k:');
legend(s0,s2,s3,s4,2); %legend(s0,sx,s1,s4,2);
xlabel('year','FontSize',fsize); 
ylabel('Surface air temperature anomalies (K)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1860 2017 -0.7 1.7]);
visfig='off'; figpath='./fig_am4/'; expn='cm4_hist'; vname='tas_gb';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.; fsize=28; x=[5:5:20]-2.5; 
x1=[5:5:140]-2.5; x2=[65:5:140]-2.5; 
handle=figure('Position',pms,'visible','on'); lw=3;
plot(g.gb.year,g.nh.all,'k',  'LineWidth',lw); hold on; s0='OBS (GISS)';
%plot(tx,    yx.nh,  'k--','LineWidth',lw); sx='AM4-longamip';
plot(ta,    ya.nh,  'c', 'LineWidth',lw); sa='CM2.1';
plot(tb,    yb.nh,  'b', 'LineWidth',lw); sb='CM3';
%plot(t0,   y0.nh,  'c-', 'LineWidth',lw); s0='CML-AM4g6';
plot(t1,    y1.nh,  'm-', 'LineWidth',lw); s1='CM4g12r04';
plot(t2,    y2.nh,  'g-', 'LineWidth',lw); s2='CM4g12r16';
plot(t3,    y3.nh,  'r-', 'LineWidth',lw); s3='CM4g12r17';
%plot(t4,    y4.nh,  'b-', 'LineWidth',lw); s4='CM4-AM4g12r18';
plot([yr1 yr1],[-2 2],'k:'); plot([yr2 yr2],[-2 2],'k:');
plot([1860 2017],[0 0], 'k:'); 
legend(s0,sa,sb,s1,s2,s3,2); %legend(s0,sx,s1,s4,2);
xlabel('year','FontSize',fsize); 
ylabel('NH surface air temperature anomalies (K)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1860 2017 -0.7 1.7]);
visfig='off'; figpath='./fig_cm4/'; expn='cm4'; vname='tas_nh';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.; fsize=28; x=[5:5:20]-2.5; 
x1=[5:5:140]-2.5; x2=[65:5:140]-2.5; 
handle=figure('Position',pms,'visible','on'); lw=3;
plot(g.gb.year,g.sh.all,'k',  'LineWidth',lw); hold on; s0='OBS (GISS)';
%plot(tx,    yx.sh,  'k--','LineWidth',lw); sx='AM4g10r8-longamip';
plot(ta,    ya.sh,  'c-', 'LineWidth',lw); sa='CM2.1';
plot(tb,    yb.sh,  'b-', 'LineWidth',lw); sb='CM3';
%plot(t0,   y0.sh,  'c-', 'LineWidth',lw); s0='CML-AM4g6';
plot(t1,    y1.sh,  'm-', 'LineWidth',lw); s1='CM4g12r04';
plot(t2,    y2.sh,  'g-', 'LineWidth',lw); s2='CM4g12r16';
plot(t3,    y3.sh,  'r-', 'LineWidth',lw); s3='CM4g12r17';
%plot(t4,    y4.sh,  'b-', 'LineWidth',lw); s4='CM4-AM4g12r18';
plot([yr1 yr1],[-2 2],'k:'); plot([yr2 yr2],[-2 2],'k:');
plot([1860 2017],[0 0], 'k:'); 
legend(s0,sa,sb,s1,s2,s3,2); %legend(s0,sx,s1,s4,2);
xlabel('year','FontSize',fsize); 
ylabel('SH Surface air temperature anomalies (K)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1860 2017 -0.7 1.7]);
visfig='off'; figpath='./fig_cm4/'; expn='cm4'; vname='tas_sh';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=cm3.h0;       y1=v.lwp.ts.org_ann;     y1=y1-mean(y1);  
v=cmlg6.h0;     y2=v.atm.lwp.ts.org_ann; y2=y2-mean(y2);   
v=cm4g12r04.h0; y3=v.atm.lwp.ts.org_ann; y3=y3-mean(y3); 
v=cm4g12r13.h0; y4=v.atm.lwp.ts.org_ann; y4=y4-mean(y4); 
pms=[ 0, 0, 1200, 700]*1; fsize=18; x=[5:5:20]-2.5; 
x1=[5:5:140]-2.5; x2=[65:5:140]-2.5; 
handle=figure('Position',pms,'visible','on'); lw=3;
t1=[1860:2005]; t2=[1861:2010]; t3=[1861:2010]; t4=[1920:1979]; 
plot(t1,    y1,  'b-', 'LineWidth',lw); s1='CM3'; hold on;
plot(t2,    y2,  'g-', 'LineWidth',lw); s2='CML-AM4g6';
plot(t3,    y3,  'r-', 'LineWidth',lw); s3='CM4-AM4g12r04';
plot(t4,    y4,  'm-', 'LineWidth',lw); s3='CM4-AM4g12r13';
plot([1860 2010],[0 0], 'k:');
legend(s0,s1,s2,s3,s4,2);
xlabel('year','FontSize',fsize); 
ylabel('LWP (kg/kg)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1860 2015 0.03 0.06]);
visfig='off'; figpath='./fig_cm4/'; expn='cm4'; vname='tas';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=cm3.h0;       y1=v.toa.swcf.ts.org_ann; %y1=y1-mean(y1);  
v=cmlg6.h0;     y2=v.toa.swcf.ts.org_ann; %y2=y2-mean(y2);   
v=cm4g12r04.h0; y3=v.toa.swcf.ts.org_ann; %y3=y3-mean(y3); 
v=cm4g12r13.h0; y4=v.toa.swcf.ts.org_ann; $y4=y4-mean(y4); 
pms=[ 0, 0, 1200, 700]*1; fsize=18; x=[5:5:20]-2.5; 
x1=[5:5:140]-2.5; x2=[65:5:140]-2.5; 
handle=figure('Position',pms,'visible','on'); lw=3;
t1=[1860:2005]; t2=[1861:2010]; t3=[1861:2010]; t4=[1920:1979]; 
plot(t1,    y1,  'b-', 'LineWidth',lw); s1='CM3'; hold on;
plot(t2,    y2,  'g-', 'LineWidth',lw); s2='CML-AM4g6';
plot(t3,    y3,  'r-', 'LineWidth',lw); s3='CM4-AM4g12r04';
plot(t4,    y4,  'm-', 'LineWidth',lw); s3='CM4-AM4g12r13';
plot([1860 2010],[0 0], 'k:');
legend(s0,s1,s2,s3,s4,2);
xlabel('year','FontSize',fsize); 
ylabel('SWCF (kg/kg)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1860 2015 0.03 0.06]);
visfig='off'; figpath='./fig_cm4/'; expn='cm4'; vname='tas';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section II: Analysis of 1PCT runs%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=cm21.v0;       ya=v.sfc.tref.ann_stat.mmen.all;  za=v.toa.netrad.ann_stat.mmen.all;
v=cm21.w0;       yb=v.sfc.tref.ann_stat.mmen.all;  zb=v.toa.netrad.ann_stat.mmen.all;
v=cm4g11r11.v0;  y1=v.sfc.tref.ann_stat.mmen.all;  z1=v.toa.netrad.ann_stat.mmen.all;
v=cm4g11r11.w0;  y2=v.sfc.tref.ann_stat.mmen.all;  z2=v.toa.netrad.ann_stat.mmen.all;
v=cm4g12r04.v0;  y3=v.sfc.tref.ann_stat.mmen.all;  z3=v.toa.netrad.ann_stat.mmen.all;
v=cm4g12r04.w0;  y4=v.sfc.tref.ann_stat.mmen.all;  z4=v.toa.netrad.ann_stat.mmen.all;
v=cm4g12r16.v0;  y5=v.sfc.tref.ann_stat.mmen.all;  z5=v.toa.netrad.ann_stat.mmen.all;
v=cm4g12r16.w0;  y6=v.sfc.tref.ann_stat.mmen.all;  z6=v.toa.netrad.ann_stat.mmen.all;
v=cm4g12r17.v0;  y7=v.sfc.tref.ann_stat.mmen.all;  z7=v.toa.netrad.ann_stat.mmen.all;
v=cm4g12r17.w0;  y8=v.sfc.tref.ann_stat.mmen.all;  z8=v.toa.netrad.ann_stat.mmen.all;
t=[65:5:60+80]-2.5; y=y1 (13:end); c=polyfit(t,y,1); y=t*c(1)+c(2); y2=y2-y; 
t=[65:5:60+80]-2.5; y=y3 (13:end); c=polyfit(t,y,1); y=t*c(1)+c(2); y4=y4-y; 
t=[65:5:60+80]-2.5; y=y5 (13:end); c=polyfit(t,y,1); y=t*c(1)+c(2); y6=y6-y; 
t=[65:5:60+80]-2.5; y=y7 (13:end); c=polyfit(t,y,1); y=t*c(1)+c(2); y8=y8-y; 
%t=[65:5:60+80]-2.5; y=y9 (13:end); c=polyfit(t,y,1); y=t*c(1)+c(2); y10=y10-y; 
%t=[65:5:60+80]-2.5; y=y11(13:end); c=polyfit(t,y,1); y=t*c(1)+c(2); y12=y12-y; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.8; fsize=16; x=[5:5:20]-2.5; 
x1=[5:5:140]-2.5; x2=[65:5:140]-2.5; 
handle=figure('Position',pms,'visible','on'); lw=2;
plot(t,y2, 'r-', 'LineWidth',lw); s1='CM4g11r11';hold on;
plot(t,y4, 'g-', 'LineWidth',lw); s2='CM4g12r04';hold on;
plot(t,y6, 'b-', 'LineWidth',lw); s3='CM4g12r13';
plot(t,y8, 'c-', 'LineWidth',lw); s4='CM4g12r14';
%plot(t1,y10,'m-','LineWidth',lw); s5='CM4g12r15';
%plot(t2,y12,'y-','LineWidth',lw); s6='CM4g12r13C';
legend(s1,s2,s3,s4,s5,s6,4); 
xlabel('year','FontSize',fsize); 
ylabel('\Delta surface air temperature (K)','FontSize',fsize);
title('4xCO2 minus control','FontSize',fsize);
set(gca,'FontSize',fsize); axis([0 60 2 5.2]); grid on;
visfig='off'; figpath='./fig_cm4/'; expn='cm4_1pct'; vname='dtref';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%zonal mean difference: tref%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=3;
v=cm21.v0;      ya=v.sfc.tref.txavg_ann; ya=squeeze(mean(ya(end-n:end,:),1));
v=cm21.w0;      yb=v.sfc.tref.txavg_ann; yb=squeeze(mean(yb(end-3:end,:),1));
v=cm3.v0;       yc=v.sfc.tref.txavg_ann; yc=squeeze(mean(yc(end-n:end,:),1));
v=cm3.w0;       yd=v.sfc.tref.txavg_ann; yd=squeeze(mean(yd(end-3:end,:),1));
v=cm4g11r11.v0; y1=v.sfc.tref.txavg_ann; y1=squeeze(mean(y1(end-n:end,:),1));
v=cm4g11r11.w0; y2=v.sfc.tref.txavg_ann; y2=squeeze(mean(y2(end-3:end,:),1));
v=cm4g12r04.v0; y3=v.sfc.tref.txavg_ann; y3=squeeze(mean(y3(end-n:end,:),1));
v=cm4g12r04.w0; y4=v.sfc.tref.txavg_ann; y4=squeeze(mean(y4(end-3:end,:),1));
v=cm4g12r16.v0; y5=v.sfc.tref.txavg_ann; y5=squeeze(mean(y5(end-n:end,:),1));
v=cm4g12r16.w0; y6=v.sfc.tref.txavg_ann; y6=squeeze(mean(y6(end-3:end,:),1));
v=cm4g12r17.v0; y7=v.sfc.tref.txavg_ann; y7=squeeze(mean(y7(end-n:end,:),1));
v=cm4g12r17.w0; y8=v.sfc.tref.txavg_ann; y8=squeeze(mean(y8(end-3:end,:),1));
%v=cm4g12r18.v0; y9=v.sfc.tref.txavg_ann; y9=squeeze(mean(y9(end-3:end,:),1));
%v=cm4g12r18.w0; y10=v.sfc.tref.txavg_ann; y10=squeeze(mean(y10(end-3:end,:),1));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.8; fsize=16; x=[5:5:20]-2.5; 
x=v.s.lat; a0=squeeze(mean(v.s.aa,2)); 
sa=mean((yb -ya).*a0'); sa=sprintf('global mean=%5.2f',sa);
sb=mean((yd -yc).*a0'); sb=sprintf('global mean=%5.2f',sb);
s1=mean((y2 -y1).*a0'); s1=sprintf('global mean=%5.2f',s1);
s2=mean((y4 -y3).*a0'); s2=sprintf('global mean=%5.2f',s2);
s3=mean((y6 -y5).*a0'); s3=sprintf('global mean=%5.2f',s3);
s4=mean((y8 -y7).*a0'); s4=sprintf('global mean=%5.2f',s4);
%s5=mean((y10-y9).*a0'); s5=sprintf('global mean=%5.2f',s5);
handle=figure('Position',pms,'visible','on'); lw=2;
plot(x,yb -ya,'c-','LineWidth',lw); sa=strcat('CM2.1     (',sa,')');hold on;
plot(x,yd -yc,'r-','LineWidth',lw); sb=strcat('CM3       (',sb,')');hold on;
%plot(x,y2 -y1,'r-', 'LineWidth',lw); s1=strcat('CM4g11r11 (',s1,')');hold on;
plot(x,y4 -y3,'g-', 'LineWidth',lw); s2=strcat('CM4g12r04 (',s2,')');
plot(x,y6 -y5,'k-', 'LineWidth',lw); s3=strcat('CM4g12r16 (',s3,')');
plot(x,y8 -y7,'b-', 'LineWidth',lw); s4=strcat('CM4g12r17 (',s4,')');
%plot(x,y10-y9,'c-', 'LineWidth',lw); s5=strcat('CM4g12r18 (',s5,')');
legend(sa,sb,s2,s3,s4,2); 
xlabel('year','FontSize',fsize); 
ylabel('\Delta surface air temperature (K)','FontSize',fsize);
title('1PCT minus control (last 20 year average)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([-90 90 0.2 6.5]); grid on;
visfig='off'; figpath='./fig_cm4/'; expn='cm4_1pct'; vname='dtref';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%zonal mean difference: lwp%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=cm21.v0;      ya=v.atm.lwp.txavg_ann; ya=squeeze(mean(ya(end-3:end,:),1));
v=cm21.w0;      yb=v.atm.lwp.txavg_ann; yb=squeeze(mean(yb(end-3:end,:),1));
v=cm3.v0;       yc=v.atm.lwp.txavg_ann; yc=squeeze(mean(yc(end-3:end,:),1));
v=cm3.w0;       yd=v.atm.lwp.txavg_ann; yd=squeeze(mean(yd(end-3:end,:),1));
v=cm4g11r11.v0; y1=v.atm.lwp.txavg_ann; y1=squeeze(mean(y1(end-3:end,:),1));
v=cm4g11r11.w0; y2=v.atm.lwp.txavg_ann; y2=squeeze(mean(y2(end-3:end,:),1));
v=cm4g12r04.v0; y3=v.atm.lwp.txavg_ann; y3=squeeze(mean(y3(end-3:end,:),1));
v=cm4g12r04.w0; y4=v.atm.lwp.txavg_ann; y4=squeeze(mean(y4(end-3:end,:),1));
v=cm4g12r16.v0; y5=v.atm.lwp.txavg_ann; y5=squeeze(mean(y5(end-3:end,:),1));
v=cm4g12r16.w0; y6=v.atm.lwp.txavg_ann; y6=squeeze(mean(y6(end-3:end,:),1));
v=cm4g12r17.v0; y7=v.atm.lwp.txavg_ann; y7=squeeze(mean(y7(end-3:end,:),1));
v=cm4g12r17.w0; y8=v.atm.lwp.txavg_ann; y8=squeeze(mean(y8(end-3:end,:),1));
v=cm4g12r18.v0; y9=v.atm.lwp.txavg_ann; y9=squeeze(mean(y9(end-3:end,:),1));
v=cm4g12r18.w0; y10=v.atm.lwp.txavg_ann; y10=squeeze(mean(y10(end-3:end,:),1));
ya(:)=0; yc(:)=0; y1(:)=0; y3(:)=0; y5(:)=0; y7(:)=0; y9(:)=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.8; fsize=16; x=[5:5:20]-2.5; 
x=v.s.lat; a0=squeeze(mean(v.s.aa,2)); 
sa=mean((yb -ya).*a0'); sa=sprintf('global mean=%5.4f',sa);
sb=mean((yd -yc).*a0'); sb=sprintf('global mean=%5.4f',sb);
s1=mean((y2 -y1).*a0'); s1=sprintf('global mean=%5.4f',s1);
s2=mean((y4 -y3).*a0'); s2=sprintf('global mean=%5.4f',s2);
s3=mean((y6 -y5).*a0'); s3=sprintf('global mean=%5.4f',s3);
s4=mean((y8 -y7).*a0'); s4=sprintf('global mean=%5.4f',s4);
s5=mean((y10-y9).*a0'); s5=sprintf('global mean=%5.4f',s5);
handle=figure('Position',pms,'visible','on'); lw=2;
plot(x,yb -ya,'k--','LineWidth',lw); sa=strcat('CM2.1     (',sa,')');hold on;
plot(x,yd -yc,'r--','LineWidth',lw); sb=strcat('CM3       (',sb,')');hold on;
plot(x,y2 -y1,'r-', 'LineWidth',lw); s1=strcat('CM4g11r11 (',s1,')');hold on;
plot(x,y4 -y3,'g-', 'LineWidth',lw); s2=strcat('CM4g12r04 (',s2,')');
plot(x,y6 -y5,'b-', 'LineWidth',lw); s3=strcat('CM4g12r16 (',s3,')');
plot(x,y8 -y7,'k-', 'LineWidth',lw); s4=strcat('CM4g12r17 (',s4,')');
plot(x,y10-y9,'c-', 'LineWidth',lw); s5=strcat('CM4g12r18 (',s5,')');
legend(sa,sb,s1,s2,s3,s4,s5,2); 
xlabel('year','FontSize',fsize); 
ylabel('\Delta liquid water path (kg/m2)','FontSize',fsize);
title('1PCT minus control (last 20 year average)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([-90 90 -0.003 0.02]); grid on;
visfig='off'; figpath='./fig_cm4/'; expn='cm4_1pct'; vname='dlwp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%zonal mean difference: iwp%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=cm21.v0;      ya=v.atm.iwp.txavg_ann; ya=squeeze(mean(ya(end-3:end,:),1));
v=cm21.w0;      yb=v.atm.iwp.txavg_ann; yb=squeeze(mean(yb(end-3:end,:),1));
v=cm3.v0;       yc=v.atm.iwp.txavg_ann; yc=squeeze(mean(yc(end-3:end,:),1));
v=cm3.w0;       yd=v.atm.iwp.txavg_ann; yd=squeeze(mean(yd(end-3:end,:),1));
v=cm4g11r11.v0; y1=v.atm.iwp.txavg_ann; y1=squeeze(mean(y1(end-3:end,:),1));
v=cm4g11r11.w0; y2=v.atm.iwp.txavg_ann; y2=squeeze(mean(y2(end-3:end,:),1));
v=cm4g12r04.v0; y3=v.atm.iwp.txavg_ann; y3=squeeze(mean(y3(end-3:end,:),1));
v=cm4g12r04.w0; y4=v.atm.iwp.txavg_ann; y4=squeeze(mean(y4(end-3:end,:),1));
v=cm4g12r16.v0; y5=v.atm.iwp.txavg_ann; y5=squeeze(mean(y5(end-3:end,:),1));
v=cm4g12r16.w0; y6=v.atm.iwp.txavg_ann; y6=squeeze(mean(y6(end-3:end,:),1));
v=cm4g12r17.v0; y7=v.atm.iwp.txavg_ann; y7=squeeze(mean(y7(end-3:end,:),1));
v=cm4g12r17.w0; y8=v.atm.iwp.txavg_ann; y8=squeeze(mean(y8(end-3:end,:),1));
v=cm4g12r18.v0; y9=v.atm.iwp.txavg_ann; y9=squeeze(mean(y9(end-3:end,:),1));
v=cm4g12r18.w0; y10=v.atm.iwp.txavg_ann; y10=squeeze(mean(y10(end-3:end,:),1));
ya(:)=0; yc(:)=0; y1(:)=0; y3(:)=0; y5(:)=0; y7(:)=0; y9(:)=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.8; fsize=16; x=[5:5:20]-2.5; 
x=v.s.lat; a0=squeeze(mean(v.s.aa,2)); 
sa=mean((yb -ya).*a0'); sa=sprintf('global mean=%5.4f',sa);
sb=mean((yd -yc).*a0'); sb=sprintf('global mean=%5.4f',sb);
s1=mean((y2 -y1).*a0'); s1=sprintf('global mean=%5.4f',s1);
s2=mean((y4 -y3).*a0'); s2=sprintf('global mean=%5.4f',s2);
s3=mean((y6 -y5).*a0'); s3=sprintf('global mean=%5.4f',s3);
s4=mean((y8 -y7).*a0'); s4=sprintf('global mean=%5.4f',s4);
s5=mean((y10-y9).*a0'); s5=sprintf('global mean=%5.4f',s5);
handle=figure('Position',pms,'visible','on'); lw=2;
plot(x,yb -ya,'k--','LineWidth',lw); sa=strcat('CM2.1     (',sa,')');hold on;
plot(x,yd -yc,'r--','LineWidth',lw); sb=strcat('CM3       (',sb,')');hold on;
plot(x,y2 -y1,'r-', 'LineWidth',lw); s1=strcat('CM4g11r11 (',s1,')');hold on;
plot(x,y4 -y3,'g-', 'LineWidth',lw); s2=strcat('CM4g12r04 (',s2,')');
plot(x,y6 -y5,'b-', 'LineWidth',lw); s3=strcat('CM4g12r16 (',s3,')');
plot(x,y8 -y7,'k-', 'LineWidth',lw); s4=strcat('CM4g12r17 (',s4,')');
plot(x,y10-y9,'c-', 'LineWidth',lw); s5=strcat('CM4g12r18 (',s5,')');
legend(sa,sb,s1,s2,s3,s4,s5,2); 
xlabel('year','FontSize',fsize); 
ylabel('\Delta ice water path (kg/m2)','FontSize',fsize);
title('1PCT minus control (last 20 year average)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([-90 90 -0.003 0.02]); grid on;
visfig='off'; figpath='./fig_cm4/'; expn='cm4_1pct'; vname='diwp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%zonal mean difference: qal%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=cm21.v0;      ya=v.atm.qal.txavg_ann; ya=squeeze(mean(ya(end-3:end,:),1));
v=cm21.w0;      yb=v.atm.qal.txavg_ann; yb=squeeze(mean(yb(end-3:end,:),1));
v=cm3.v0;       yc=v.atm.qal.txavg_ann; yc=squeeze(mean(yc(end-3:end,:),1));
v=cm3.w0;       yd=v.atm.qal.txavg_ann; yd=squeeze(mean(yd(end-3:end,:),1));
v=cm4g11r11.v0; y1=v.atm.qal.txavg_ann; y1=squeeze(mean(y1(end-3:end,:),1));
v=cm4g11r11.w0; y2=v.atm.qal.txavg_ann; y2=squeeze(mean(y2(end-3:end,:),1));
v=cm4g12r04.v0; y3=v.atm.qal.txavg_ann; y3=squeeze(mean(y3(end-3:end,:),1));
v=cm4g12r04.w0; y4=v.atm.qal.txavg_ann; y4=squeeze(mean(y4(end-3:end,:),1));
v=cm4g12r16.v0; y5=v.atm.qal.txavg_ann; y5=squeeze(mean(y5(end-3:end,:),1));
v=cm4g12r16.w0; y6=v.atm.qal.txavg_ann; y6=squeeze(mean(y6(end-3:end,:),1));
v=cm4g12r17.v0; y7=v.atm.qal.txavg_ann; y7=squeeze(mean(y7(end-3:end,:),1));
v=cm4g12r17.w0; y8=v.atm.qal.txavg_ann; y8=squeeze(mean(y8(end-3:end,:),1));
v=cm4g12r18.v0; y9=v.atm.qal.txavg_ann; y9=squeeze(mean(y9(end-3:end,:),1));
v=cm4g12r18.w0; y10=v.atm.qal.txavg_ann; y10=squeeze(mean(y10(end-3:end,:),1));
ya(:)=0; yc(:)=0; y1(:)=0; y3(:)=0; y5(:)=0; y7(:)=0; y9(:)=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.8; fsize=16; x=[5:5:20]-2.5; 
x=v.s.lat; a0=squeeze(mean(v.s.aa,2)); 
sa=mean((yb -ya).*a0'); sa=sprintf('global mean=%5.4f',sa);
sb=mean((yd -yc).*a0'); sb=sprintf('global mean=%5.4f',sb);
s1=mean((y2 -y1).*a0'); s1=sprintf('global mean=%5.4f',s1);
s2=mean((y4 -y3).*a0'); s2=sprintf('global mean=%5.4f',s2);
s3=mean((y6 -y5).*a0'); s3=sprintf('global mean=%5.4f',s3);
s4=mean((y8 -y7).*a0'); s4=sprintf('global mean=%5.4f',s4);
s5=mean((y10-y9).*a0'); s5=sprintf('global mean=%5.4f',s5);
handle=figure('Position',pms,'visible','on'); lw=2;
plot(x,yb -ya,'k--','LineWidth',lw); sa=strcat('CM2.1     (',sa,')');hold on;
plot(x,yd -yc,'r--','LineWidth',lw); sb=strcat('CM3       (',sb,')');hold on;
plot(x,y2 -y1,'r-', 'LineWidth',lw); s1=strcat('CM4g11r11 (',s1,')');hold on;
plot(x,y4 -y3,'g-', 'LineWidth',lw); s2=strcat('CM4g12r04 (',s2,')');
plot(x,y6 -y5,'b-', 'LineWidth',lw); s3=strcat('CM4g12r16 (',s3,')');
plot(x,y8 -y7,'k-', 'LineWidth',lw); s4=strcat('CM4g12r17 (',s4,')');
plot(x,y10-y9,'c-', 'LineWidth',lw); s5=strcat('CM4g12r18 (',s5,')');
legend(sa,sb,s1,s2,s3,s4,s5,3); 
xlabel('year','FontSize',fsize); 
ylabel('\Delta low cloud amount (%)','FontSize',fsize);
title('1PCT minus control (last 20 year average)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([-90 90 -4 2]); grid on;
visfig='off'; figpath='./fig_cm4/'; expn='cm4_1pct'; vname='dqal';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%zonal mean difference: qam%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=cm21.v0;      ya=v.atm.qam.txavg_ann; ya=squeeze(mean(ya(end-3:end,:),1));
v=cm21.w0;      yb=v.atm.qam.txavg_ann; yb=squeeze(mean(yb(end-3:end,:),1));
v=cm3.v0;       yc=v.atm.qam.txavg_ann; yc=squeeze(mean(yc(end-3:end,:),1));
v=cm3.w0;       yd=v.atm.qam.txavg_ann; yd=squeeze(mean(yd(end-3:end,:),1));
v=cm4g11r11.v0; y1=v.atm.qam.txavg_ann; y1=squeeze(mean(y1(end-3:end,:),1));
v=cm4g11r11.w0; y2=v.atm.qam.txavg_ann; y2=squeeze(mean(y2(end-3:end,:),1));
v=cm4g12r04.v0; y3=v.atm.qam.txavg_ann; y3=squeeze(mean(y3(end-3:end,:),1));
v=cm4g12r04.w0; y4=v.atm.qam.txavg_ann; y4=squeeze(mean(y4(end-3:end,:),1));
v=cm4g12r16.v0; y5=v.atm.qam.txavg_ann; y5=squeeze(mean(y5(end-3:end,:),1));
v=cm4g12r16.w0; y6=v.atm.qam.txavg_ann; y6=squeeze(mean(y6(end-3:end,:),1));
v=cm4g12r17.v0; y7=v.atm.qam.txavg_ann; y7=squeeze(mean(y7(end-3:end,:),1));
v=cm4g12r17.w0; y8=v.atm.qam.txavg_ann; y8=squeeze(mean(y8(end-3:end,:),1));
v=cm4g12r18.v0; y9=v.atm.qam.txavg_ann; y9=squeeze(mean(y9(end-3:end,:),1));
v=cm4g12r18.w0; y10=v.atm.qam.txavg_ann; y10=squeeze(mean(y10(end-3:end,:),1));
ya(:)=0; yc(:)=0; y1(:)=0; y3(:)=0; y5(:)=0; y7(:)=0; y9(:)=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.8; fsize=16; x=[5:5:20]-2.5; 
x=v.s.lat; a0=squeeze(mean(v.s.aa,2)); 
sa=mean((yb -ya).*a0'); sa=sprintf('global mean=%5.4f',sa);
sb=mean((yd -yc).*a0'); sb=sprintf('global mean=%5.4f',sb);
s1=mean((y2 -y1).*a0'); s1=sprintf('global mean=%5.4f',s1);
s2=mean((y4 -y3).*a0'); s2=sprintf('global mean=%5.4f',s2);
s3=mean((y6 -y5).*a0'); s3=sprintf('global mean=%5.4f',s3);
s4=mean((y8 -y7).*a0'); s4=sprintf('global mean=%5.4f',s4);
s5=mean((y10-y9).*a0'); s5=sprintf('global mean=%5.4f',s5);
handle=figure('Position',pms,'visible','on'); lw=2;
plot(x,yb -ya,'k--','LineWidth',lw); sa=strcat('CM2.1     (',sa,')');hold on;
plot(x,yd -yc,'r--','LineWidth',lw); sb=strcat('CM3       (',sb,')');hold on;
plot(x,y2 -y1,'r-', 'LineWidth',lw); s1=strcat('CM4g11r11 (',s1,')');hold on;
plot(x,y4 -y3,'g-', 'LineWidth',lw); s2=strcat('CM4g12r04 (',s2,')');
plot(x,y6 -y5,'b-', 'LineWidth',lw); s3=strcat('CM4g12r16 (',s3,')');
plot(x,y8 -y7,'k-', 'LineWidth',lw); s4=strcat('CM4g12r17 (',s4,')');
plot(x,y10-y9,'c-', 'LineWidth',lw); s5=strcat('CM4g12r18 (',s5,')');
legend(sa,sb,s1,s2,s3,s4,s5,1); 
xlabel('year','FontSize',fsize); 
ylabel('\Delta middle cloud amount (%)','FontSize',fsize);
title('1PCT minus control (last 20 year average)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([-90 90 -4 2]); grid on;
visfig='off'; figpath='./fig_cm4/'; expn='cm4_1pct'; vname='dqam';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%zonal mean difference: qah%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=cm21.v0;      ya=v.atm.qah.txavg_ann; ya=squeeze(mean(ya(end-3:end,:),1));
v=cm21.w0;      yb=v.atm.qah.txavg_ann; yb=squeeze(mean(yb(end-3:end,:),1));
v=cm3.v0;       yc=v.atm.qah.txavg_ann; yc=squeeze(mean(yc(end-3:end,:),1));
v=cm3.w0;       yd=v.atm.qah.txavg_ann; yd=squeeze(mean(yd(end-3:end,:),1));
v=cm4g11r11.v0; y1=v.atm.qah.txavg_ann; y1=squeeze(mean(y1(end-3:end,:),1));
v=cm4g11r11.w0; y2=v.atm.qah.txavg_ann; y2=squeeze(mean(y2(end-3:end,:),1));
v=cm4g12r04.v0; y3=v.atm.qah.txavg_ann; y3=squeeze(mean(y3(end-3:end,:),1));
v=cm4g12r04.w0; y4=v.atm.qah.txavg_ann; y4=squeeze(mean(y4(end-3:end,:),1));
v=cm4g12r16.v0; y5=v.atm.qah.txavg_ann; y5=squeeze(mean(y5(end-3:end,:),1));
v=cm4g12r16.w0; y6=v.atm.qah.txavg_ann; y6=squeeze(mean(y6(end-3:end,:),1));
v=cm4g12r17.v0; y7=v.atm.qah.txavg_ann; y7=squeeze(mean(y7(end-3:end,:),1));
v=cm4g12r17.w0; y8=v.atm.qah.txavg_ann; y8=squeeze(mean(y8(end-3:end,:),1));
v=cm4g12r18.v0; y9=v.atm.qah.txavg_ann; y9=squeeze(mean(y9(end-3:end,:),1));
v=cm4g12r18.w0; y10=v.atm.qah.txavg_ann; y10=squeeze(mean(y10(end-3:end,:),1));
ya(:)=0; yc(:)=0; y1(:)=0; y3(:)=0; y5(:)=0; y7(:)=0; y9(:)=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.8; fsize=16; x=[5:5:20]-2.5; 
x=v.s.lat; a0=squeeze(mean(v.s.aa,2)); 
sa=mean((yb -ya).*a0'); sa=sprintf('global mean=%5.4f',sa);
sb=mean((yd -yc).*a0'); sb=sprintf('global mean=%5.4f',sb);
s1=mean((y2 -y1).*a0'); s1=sprintf('global mean=%5.4f',s1);
s2=mean((y4 -y3).*a0'); s2=sprintf('global mean=%5.4f',s2);
s3=mean((y6 -y5).*a0'); s3=sprintf('global mean=%5.4f',s3);
s4=mean((y8 -y7).*a0'); s4=sprintf('global mean=%5.4f',s4);
s5=mean((y10-y9).*a0'); s5=sprintf('global mean=%5.4f',s5);
handle=figure('Position',pms,'visible','on'); lw=2;
plot(x,yb -ya,'k--','LineWidth',lw); sa=strcat('CM2.1     (',sa,')');hold on;
plot(x,yd -yc,'r--','LineWidth',lw); sb=strcat('CM3       (',sb,')');hold on;
plot(x,y2 -y1,'r-', 'LineWidth',lw); s1=strcat('CM4g11r11 (',s1,')');hold on;
plot(x,y4 -y3,'g-', 'LineWidth',lw); s2=strcat('CM4g12r04 (',s2,')');
plot(x,y6 -y5,'b-', 'LineWidth',lw); s3=strcat('CM4g12r16 (',s3,')');
plot(x,y8 -y7,'k-', 'LineWidth',lw); s4=strcat('CM4g12r17 (',s4,')');
plot(x,y10-y9,'c-', 'LineWidth',lw); s5=strcat('CM4g12r18 (',s5,')');
legend(sa,sb,s1,s2,s3,s4,s5,1); 
xlabel('year','FontSize',fsize); 
ylabel('\Delta high cloud amount (%)','FontSize',fsize);
title('1PCT minus control (last 20 year average)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([-90 90 -4 2]); grid on;
visfig='off'; figpath='./fig_cm4/'; expn='cm4_1pct'; vname='dqah';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_map'; s=cm4g11r11.v0.s; k1=1; k2=16;
v=cm21.v0;         za=squeeze(mean(v.sfc.tref.ann_bias(end-3:end,:,:),1));
v=cm21.w0;         zb=squeeze(mean(v.sfc.tref.ann_bias(end-3:end,:,:),1));
v=cm3.v0;          zc=squeeze(mean(v.sfc.tref.ann_bias(end-3:end,:,:),1));
v=cm3.w0;          zd=squeeze(mean(v.sfc.tref.ann_bias(end-3:end,:,:),1));
v=cm4g11r11.v0;    z1=squeeze(mean(v.sfc.tref.ann_bias(end-3:end,:,:),1));
v=cm4g11r11.w0;    z2=squeeze(mean(v.sfc.tref.ann_bias(end-3:end,:,:),1));
v=cm4g12r16.v0;    z3=squeeze(mean(v.sfc.tref.ann_bias(end-3:end,:,:),1));
v=cm4g12r16.w0;    z4=squeeze(mean(v.sfc.tref.ann_bias(end-3:end,:,:),1));
v=cm4g12r17.v0;    z5=squeeze(mean(v.sfc.tref.ann_bias(end-3:end,:,:),1));
v=cm4g12r17.w0;    z6=squeeze(mean(v.sfc.tref.ann_bias(end-3:end,:,:),1));
v=cm4g12r18.v0;    z7=squeeze(mean(v.sfc.tref.ann_bias(end-3:end,:,:),1));
v=cm4g12r18.w0;    z8=squeeze(mean(v.sfc.tref.ann_bias(end-3:end,:,:),1));
zz1=zb -za;  s.s1='(a) CM2.1     (1PCT minus CNTL)';
zz2=zd -zc;  s.s2='(b) CM3       (1PCT minus CNTL)';
zz3=z2 -z1;  s.s3='(c) CM4g11r11 (1PCT minus CNTL)';
zz4=z4 -z3;  s.s4='(d) CM4g12r16 (1PCT minus CNTL)';
zz5=z6 -z5;  s.s5='(e) CM4g12r17 (1PCT minus CNTL)';
zz6=z8 -z7;  s.s6='(f) CM4g12r18 (1PCT minus CNTL)'; %zz6=zz5-zz4;
cmin=-3; cmax=3; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_cm4/'; expn='cm4'; f=1;
plot_6panel_cm4(s,zz1,zz2,zz3,zz4,zz5,zz6,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qn850_map'; s=cm4am4g11r11.v0.s; k1=1; k2=12; a=1000000; k=1;
v=cm4am4g11r11.v0;    f1=squeeze(mean(v.atm.al850.ann_bias(k1:k2,:,:),1));y1=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r11.w0;    f2=squeeze(mean(v.atm.al850.ann_bias(k1:k2,:,:),1));y2=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13.v0;    f3=squeeze(mean(v.atm.al850.ann_bias(k1:k2,:,:),1));y3=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13.w0;    f4=squeeze(mean(v.atm.al850.ann_bias(k1:k2,:,:),1));y4=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13a.v0;   f5=squeeze(mean(v.atm.al850.ann_bias(k1:k2,:,:),1));y5=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13a.w0;   f6=squeeze(mean(v.atm.al850.ann_bias(k1:k2,:,:),1));y6=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13fn1.v0; f7=squeeze(mean(v.atm.al850.ann_bias(k1:k2,:,:),1));y7=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13fn1.w0; f8=squeeze(mean(v.atm.al850.ann_bias(k1:k2,:,:),1));y8=mean(v.sfc.tref.sea_stat.mmen.all);

v=cm4am4g11r11.v0;    z1=squeeze(mean(v.atm.qn850.ann_bias(k1:k2,:,:),1))/a;
v=cm4am4g11r11.w0;    z2=squeeze(mean(v.atm.qn850.ann_bias(k1:k2,:,:),1))/a;
v=cm4am4g11r13.v0;    z3=squeeze(mean(v.atm.qn850.ann_bias(k1:k2,:,:),1))/a;
v=cm4am4g11r13.w0;    z4=squeeze(mean(v.atm.qn850.ann_bias(k1:k2,:,:),1))/a;
v=cm4am4g11r13a.v0;   z5=squeeze(mean(v.atm.qn850.ann_bias(k1:k2,:,:),1))/a;
v=cm4am4g11r13a.w0;   z6=squeeze(mean(v.atm.qn850.ann_bias(k1:k2,:,:),1))/a;

v=am4g11r11.v0;       f11=squeeze(mean(v.atm.al850.ann_bias(k1:k2,:,:),1));
v=am4g11r13.v0;       f13=squeeze(mean(v.atm.al850.ann_bias(k1:k2,:,:),1));
v=am4g11r13a.v0;      f15=squeeze(mean(v.atm.al850.ann_bias(k1:k2,:,:),1));
v=am4g11r13fn1.v0;    f17=squeeze(mean(v.atm.al850.ann_bias(k1:k2,:,:),1));
v=am4g11r11.v0;       z11=squeeze(mean(v.atm.qn850.ann_bias(k1:k2,:,:),1))/a;
v=am4g11r13.v0;       z13=squeeze(mean(v.atm.qn850.ann_bias(k1:k2,:,:),1))/a;
v=am4g11r13a.v0;      z15=squeeze(mean(v.atm.qn850.ann_bias(k1:k2,:,:),1))/a;
v=am4g11r13fn1.v0;    z17=squeeze(mean(v.atm.qn850.ann_bias(k1:k2,:,:),1))/a;

z=f1; z(z<0)=0; f1=z;  n1=z1./f1; %figure; pcolor(f1); shading flat; caxis([0 1]);colorbar;
z=f2; z(z<0)=0; f2=z;  n2=z2./f2; %figure; pcolor(n1); shading flat; caxis([20 100]);colorbar;
z=f3; z(z<0)=0; f3=z;  n3=z3./f3; %figure; pcolor(f3); shading flat; caxis([0 1]);colorbar;
z=f4; z(z<0)=0; f4=z;  n4=z4./f4; %figure; pcolor(n3); shading flat; caxis([20 100]);colorbar;
z=f5; z(z<0)=0; f5=z;  n5=z5./f5; %figure; pcolor(f5); shading flat; caxis([0 1]);colorbar;
z=f6; z(z<0)=0; f6=z;  n6=z6./f6; %figure; pcolor(n5); shading flat; caxis([20 100]);colorbar;
z=f7; z(z<0)=0; f7=z;  n7=n5; n7(:,:)=60; %figure; pcolor(f7); shading flat; caxis([0 1]);colorbar;
z=f8; z(z<0)=0; f8=z;  n7(s.lm0==1)=180;  %figure; pcolor(n7); shading flat; caxis([20 100]);colorbar;         
n8=n7; z7=f7.*n7; z8=f8.*n8;
z=f11; z(z<0)=0; f11=z;  n11=z11./f11;
z=f13; z(z<0)=0; f13=z;  n13=z13./f13;
z=f15; z(z<0)=0; f15=z;  n15=z15./f15;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
zz1=n1; s.s1='CM4-ePBLh-AM4g11r11-control (A)';
zz2=n3; s.s2='CM4-ePBLh-AM4g11r13-varlimit-0.7 (B)';
zz3=n5; s.s3='CM4-ePBLh-AM4g11r13a-varlimit-1.0 (C)';
zz4=n7; s.s4='CM4-ePBLh-AM4g11r13a-fixedN-180-60 (D)';
cmin=10; cmax=90; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1;
plot_4panel_cm4(s,zz1,zz2,zz3,zz4,vbin,cmin,cmax,vname,fpath,expn,f,0);
cmin=-30; cmax=30; vbin=[cmin:(cmax-cmin)/20:cmax]; 
vname=strcat(vname,'_diff');
s.s2='B minus A';
s.s3='C minus B';
s.s4='D minus C';
plot_4panel_cm4(s,zz1,zz2-zz1,zz3-zz2,zz4-zz3,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%
cmin=10; cmax=90; vbin=[cmin:(cmax-cmin)/20:cmax]; 
expn='amip'; vname='qn850';
plot_4panel_cm4(s,n11,n13,n15,n7,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%
vname='dqn850';
zz1=(n2-n1)./n1/(y2-y1)*100; s.s1='CM4-ePBLh-AM4g11r11-control (A)';
zz2=(n4-n3)./n3/(y4-y3)*100; s.s2='CM4-ePBLh-AM4g11r13-varlimit-0.7(B)';
zz3=(n6-n5)./n5/(y6-y5)*100; s.s3='CM4-ePBLh-AM4g11r13a-varlimit-1.0(C)';
zz4=(n8-n7)./n7/(y8-y7)*100; s.s4='CM4-ePBLh-AM4g11r13a-fixedN-180-60(D)';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,zz1,zz2,zz3,zz4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%
vname='dN850';
zz1=(z2-z1)/(y2-y1); s.s1='CM4-ePBLh-AM4g11r11-control (A)';
zz2=(z4-z3)/(y4-y3); s.s2='CM4-ePBLh-AM4g11r13-varlimit-0.7 (B)';
zz3=(z6-z5)/(y6-y5); s.s3='CM4-ePBLh-AM4g11r13a-varlimit-1.0 (C)';
zz4=(z8-z7)/(y8-y7); s.s4='CM4-ePBLh-AM4g11r13a-fixedN-180-60 (D)';
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1;
plot_4panel_cm4(s,zz1,zz2,zz3,zz4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%
vname='dliqf850';
zz1=(f2-f1)/(y2-y1)*100;  s.s1='CM4-ePBLh-AM4g11r11-control (A)';
zz2=(f4-f3)/(y4-y3)*100;  s.s2='CM4-ePBLh-AM4g11r13-varlimit-0.7 (B)';
zz3=(f6-f5)/(y6-y5)*100;  s.s3='CM4-ePBLh-AM4g11r13a-varlimit-1.0 (C)';
zz4=(f8-f7)/(y8-y7)*100;  s.s4='CM4-ePBLh-AM4g11r13a-fixedN-180-60 (D)';
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,zz1,zz2,zz3,zz4,vbin,cmin,cmax,vname,fpath,expn,f,0);
cmin=-0.5; cmax=0.5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1;
plot_4panel_cm4(s,zz1,zz2-zz1,zz3-zz2,zz4-zz3,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwp_map'; s=cm4am4g11r11.v0.s; k1=1; k2=12;
%k=1; sea='_ann'; vname=strcat(vname,sea);
%k=2; sea='_mam'; vname=strcat(vname,sea);
%k=3; sea='_jja'; vname=strcat(vname,sea);
%k=4; sea='_son'; vname=strcat(vname,sea);
v=cm4am4g11r11.v0;    z1=squeeze(mean(v.atm.lwp.ann_bias(k1:k2,:,:),1));y1=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r11.w0;    z2=squeeze(mean(v.atm.lwp.ann_bias(k1:k2,:,:),1));y2=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13.v0;    z3=squeeze(mean(v.atm.lwp.ann_bias(k1:k2,:,:),1));y3=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13.w0;    z4=squeeze(mean(v.atm.lwp.ann_bias(k1:k2,:,:),1));y4=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13a.v0;   z5=squeeze(mean(v.atm.lwp.ann_bias(k1:k2,:,:),1));y5=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13a.w0;   z6=squeeze(mean(v.atm.lwp.ann_bias(k1:k2,:,:),1));y6=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13fn1.v0; z7=squeeze(mean(v.atm.lwp.ann_bias(k1:k2,:,:),1));y7=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13fn1.w0; z8=squeeze(mean(v.atm.lwp.ann_bias(k1:k2,:,:),1));y8=mean(v.sfc.tref.sea_stat.mmen.all);
v=am4g11r11.v0;    z11=squeeze(mean(v.atm.lwp.ann_bias(1:2,:,:),1));y11=mean(v.sfc.tref.sea_stat.mmen.all);
v=am4g11r11.w0;    z12=squeeze(mean(v.atm.lwp.ann_bias(1:2,:,:),1));y12=mean(v.sfc.tref.sea_stat.mmen.all);
v=am4g11r13a.v0;   z13=squeeze(mean(v.atm.lwp.ann_bias(1:2,:,:),1));y13=mean(v.sfc.tref.sea_stat.mmen.all);
v=am4g11r13a.w0;   z14=squeeze(mean(v.atm.lwp.ann_bias(1:2,:,:),1));y14=mean(v.sfc.tref.sea_stat.mmen.all);
v=am4g11r13fn1.v0; z15=squeeze(mean(v.atm.lwp.ann_bias(1:2,:,:),1));y15=mean(v.sfc.tref.sea_stat.mmen.all);
v=am4g11r13fn1.w0; z16=squeeze(mean(v.atm.lwp.ann_bias(1:2,:,:),1));y16=mean(v.sfc.tref.sea_stat.mmen.all);
%%%%%%%%%%%%%%%%%%%%%%%
zz1=(z2-z1)/(y2-y1); s.s1='CM4-ePBLh-AM4g11r11-control (A)';
zz2=(z4-z3)/(y4-y3); s.s2='CM4-ePBLh-AM4g11r13-varlimit-0.7 (B)';
zz3=(z6-z5)/(y6-y5); s.s3='CM4-ePBLh-AM4g11r13a-varlimit-1.0 (C)';
zz4=(z8-z7)/(y8-y7); s.s4='CM4-ePBLh-AM4g11r13a-fixedN-180-60 (D)';
cmin=-0.01; cmax=0.01; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1;
plot_4panel_cm4(s,zz1,zz2,zz3,zz4,vbin,cmin,cmax,vname,fpath,expn,f,0);
cmin=-0.005; cmax=0.005; vbin=[cmin:(cmax-cmin)/20:cmax]; 
vname=strcat(vname,'_diff');
s.s2='B minus A';
s.s3='C minus B';
s.s4='D minus C';
plot_4panel_cm4(s,zz1,zz2-zz1,zz3-zz2,zz4-zz3,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
zz1=z1; s.s1='CM4-ePBLh-AM4g11r11-control (A)';
zz2=z3; s.s2='CM4-ePBLh-AM4g11r13-varlimit-0.7 (B)';
zz3=z5; s.s3='CM4-ePBLh-AM4g11r13a-varlimit-1.0 (C)';
zz4=z7; s.s4='CM4-ePBLh-AM4g11r13a-fixedN-180-60 (D)';
cmin=0; cmax=0.1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1;
plot_4panel_cm4(s,zz1,zz2,zz3,zz4,vbin,cmin,cmax,vname,fpath,expn,f,0);
cmin=-0.05; cmax=0.05; vbin=[cmin:(cmax-cmin)/20:cmax]; 
vname=strcat(vname,'_diff');
s.s2='B minus A';
s.s3='C minus B';
s.s4='D minus C';
plot_4panel_cm4(s,zz1,zz2-zz1,zz3-zz2,zz4-zz3,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ttcf_map'; s=cm4am4g11r11.v0.s; 
k=1; vname=strcat(vname,'_ann');
%k=2; vname=strcat(vname,'_mam');
%k=3; vname=strcat(vname,'_jja');
v=cm4am4g11r11.v0;    z1=squeeze(mean(v.toa.ttcf.sea(k,:,:),1));y1=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r11.w0;    z2=squeeze(mean(v.toa.ttcf.sea(k,:,:),1));y2=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13.v0;    z3=squeeze(mean(v.toa.ttcf.sea(k,:,:),1));y3=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13.w0;    z4=squeeze(mean(v.toa.ttcf.sea(k,:,:),1));y4=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13a.v0;   z5=squeeze(mean(v.toa.ttcf.sea(k,:,:),1));y5=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13a.w0;   z6=squeeze(mean(v.toa.ttcf.sea(k,:,:),1));y6=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13fn1.v0; z7=squeeze(mean(v.toa.ttcf.sea(k,:,:),1));y7=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13fn1.w0; z8=squeeze(mean(v.toa.ttcf.sea(k,:,:),1));y8=mean(v.sfc.tref.sea_stat.mmen.all);
zz1=(z2-z1)/(y2-y1); s.s1='CM4-ePBLh-AM4g11r11-control (A)';
zz2=(z4-z3)/(y4-y3); s.s2='CM4-ePBLh-AM4g11r13-varlimit-0.7 (B)';
zz3=(z6-z5)/(y6-y5); s.s3='CM4-ePBLh-AM4g11r13a-varlimit-1.0 (C)';
zz4=(z8-z7)/(y8-y7); s.s4='CM4-ePBLh-AM4g11r13a-fixedN-180-60 (D)';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1;
plot_4panel_cm4(s,zz1,zz2,zz3,zz4,vbin,cmin,cmax,vname,fpath,expn,f,0);
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
vname=strcat(vname,'_diff');
s.s2='B minus A';
s.s3='C minus B';
s.s4='D minus C';
plot_4panel_cm4(s,zz1,zz2-zz1,zz3-zz2,zz4-zz3,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcf_map'; s=cm4am4g11r11.v0.s; k1=1; k2=12;
%k=1; sea='_ann'; vname=strcat(vname,sea);
%k=2; sea='_mam'; vname=strcat(vname,sea);
%k=3; sea='_jja'; vname=strcat(vname,sea);
%k=4; sea='_son'; vname=strcat(vname,sea);
v=cm4am4g11r11.v0;    z1=squeeze(mean(v.toa.swcf.ann_bias(k1:k2,:,:),1));y1=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r11.w0;    z2=squeeze(mean(v.toa.swcf.ann_bias(k1:k2,:,:),1));y2=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13.v0;    z3=squeeze(mean(v.toa.swcf.ann_bias(k1:k2,:,:),1));y3=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13.w0;    z4=squeeze(mean(v.toa.swcf.ann_bias(k1:k2,:,:),1));y4=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13a.v0;   z5=squeeze(mean(v.toa.swcf.ann_bias(k1:k2,:,:),1));y5=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13a.w0;   z6=squeeze(mean(v.toa.swcf.ann_bias(k1:k2,:,:),1));y6=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13fn1.v0; z7=squeeze(mean(v.toa.swcf.ann_bias(k1:k2,:,:),1));y7=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13fn1.w0; z8=squeeze(mean(v.toa.swcf.ann_bias(k1:k2,:,:),1));y8=mean(v.sfc.tref.sea_stat.mmen.all);
v=am4g11r11.v0;    z11=squeeze(mean(v.toa.swcf.ann_bias(1:2,:,:),1));y11=mean(v.sfc.tref.sea_stat.mmen.all);
v=am4g11r11.w0;    z12=squeeze(mean(v.toa.swcf.ann_bias(1:2,:,:),1));y12=mean(v.sfc.tref.sea_stat.mmen.all);
v=am4g11r13a.v0;   z13=squeeze(mean(v.toa.swcf.ann_bias(1:2,:,:),1));y13=mean(v.sfc.tref.sea_stat.mmen.all);
v=am4g11r13a.w0;   z14=squeeze(mean(v.toa.swcf.ann_bias(1:2,:,:),1));y14=mean(v.sfc.tref.sea_stat.mmen.all);
v=am4g11r13fn1.v0; z15=squeeze(mean(v.toa.swcf.ann_bias(1:2,:,:),1));y15=mean(v.sfc.tref.sea_stat.mmen.all);
v=am4g11r13fn1.w0; z16=squeeze(mean(v.toa.swcf.ann_bias(1:2,:,:),1));y16=mean(v.sfc.tref.sea_stat.mmen.all);
zz1=(z2-z1)/(y2-y1); s.s1='CM4-ePBLh-AM4g11r11-control (A)';
zz2=(z4-z3)/(y4-y3); s.s2='CM4-ePBLh-AM4g11r13-varlimit-0.7 (B)';
zz3=(z6-z5)/(y6-y5); s.s3='CM4-ePBLh-AM4g11r13a-varlimit-1.0 (C)';
zz4=(z8-z7)/(y8-y7); s.s4='CM4-ePBLh-AM4g11r13a-fixedN-180-60 (D)';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1;
plot_4panel_cm4(s,zz1,zz2,zz3,zz4,vbin,cmin,cmax,vname,fpath,expn,f,0);
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
vname=strcat(vname,'_diff');
s.s2='B minus A';
s.s3='C minus B';
s.s4='D minus C';
plot_4panel_cm4(s,zz1,zz2-zz1,zz3-zz2,zz4-zz3,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcf'; vname=strcat(vname,sea);
zz1=(z12-z11)/(y12-y11); s.s1='AM4g11r11  (A)';
zz2=zz1;                 s.s2='AM4g11r13  (B)';
zz3=(z14-z13)/(y14-y13); s.s2='AM4g11r13a (C)';
zz4=(z16-z15)/(y16-y15); s.s4='AM4g11r13a-fixed-N-186-60 (D)';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4'; f=1;
plot_4panel_cm4(s,zz1,zz2-zz1,zz3-zz1,zz4-zz1,vbin,cmin,cmax,vname,fpath,expn,f,0);
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
vname=strcat(vname,'_diff');
s.s2='B minus A';
s.s3='C minus A';
s.s4='D minus A';
plot_4panel_cm4(s,zz1,zz2-zz1,zz3-zz1,zz4-zz1,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qal_map'; s=cm4am4g11r11.v0.s; k1=1; k2=12;
v=cm4am4g11r11.v0;    z1=squeeze(mean(v.atm.qal.ann_bias(k1:k2,:,:),1));y1=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r11.w0;    z2=squeeze(mean(v.atm.qal.ann_bias(k1:k2,:,:),1));y2=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13.v0;    z3=squeeze(mean(v.atm.qal.ann_bias(k1:k2,:,:),1));y3=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13.w0;    z4=squeeze(mean(v.atm.qal.ann_bias(k1:k2,:,:),1));y4=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13a.v0;   z5=squeeze(mean(v.atm.qal.ann_bias(k1:k2,:,:),1));y5=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13a.w0;   z6=squeeze(mean(v.atm.qal.ann_bias(k1:k2,:,:),1));y6=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13fn1.v0; z7=squeeze(mean(v.atm.qal.ann_bias(k1:k2,:,:),1));y7=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4am4g11r13fn1.w0; z8=squeeze(mean(v.atm.qal.ann_bias(k1:k2,:,:),1));y8=mean(v.sfc.tref.sea_stat.mmen.all);
zz1=(z2-z1)/(y2-y1); s.s1='CM4-ePBLh-AM4g11r11-control (A)';
zz2=(z4-z3)/(y4-y3); s.s2='CM4-ePBLh-AM4g11r13-varlimit-0.7 (B)';
zz3=(z6-z5)/(y6-y5); s.s3='CM4-ePBLh-AM4g11r13a-varlimit-1.0 (C)';
zz4=(z8-z7)/(y8-y7); s.s4='CM4-ePBLh-AM4g11r13a-fixedN-180-60 (D)';
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1;
plot_4panel_cm4(s,zz1,zz2,zz3,zz4,vbin,cmin,cmax,vname,fpath,expn,f,0);
cmin=-0.1; cmax=0.1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
vname=strcat(vname,'_diff');
s.s2='B minus A';
s.s3='C minus B';
s.s4='D minus C';
plot_4panel_cm4(s,zz1,zz2-zz1,zz3-zz2,zz4-zz3,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ttcf_map'; s=cmlam2.v0.s; 
v=cmlam2.v0;        z1=squeeze(mean(v.toa.ttcf.ann_bias(1:4,:,:),1)); y1=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam2.w0;        z2=squeeze(mean(v.toa.ttcf.ann_bias(1:4,:,:),1)); y2=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g10r14.v0;  z3=squeeze(mean(v.toa.ttcf.ann_bias(1:4,:,:),1)); y3=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g10r14.w0;  z4=squeeze(mean(v.toa.ttcf.ann_bias(1:4,:,:),1)); y4=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r8.v0;   z5=squeeze(mean(v.toa.ttcf.ann_bias(1:4,:,:),1)); y5=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r8.w0;   z6=squeeze(mean(v.toa.ttcf.ann_bias(1:4,:,:),1)); y6=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r11.v0;  z7=squeeze(mean(v.toa.ttcf.ann_bias(1:4,:,:),1)); y7=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r11.w0;  z8=squeeze(mean(v.toa.ttcf.ann_bias(1:4,:,:),1)); y8=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11rfn.v0;  z9=squeeze(mean(v.toa.ttcf.ann_bias(1:4,:,:),1)); y9=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11rfn.w0;  z10=squeeze(mean(v.toa.ttcf.ann_bias(1:4,:,:),1)); y10=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r11c.v0; z11=squeeze(mean(v.toa.ttcf.ann_bias(1:4,:,:),1)); y11=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r11c.w0; z12=squeeze(mean(v.toa.ttcf.ann_bias(1:4,:,:),1)); y12=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4.v0;           z13=squeeze(mean(v.toa.ttcf.ann_bias(1:4,:,:),1)); y13=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4.w0;           z14=squeeze(mean(v.toa.ttcf.ann_bias(1:4,:,:),1)); y14=mean(v.sfc.tref.sea_stat.mmen.all);
zz1=(z2 -z1) /(y2-y1);   s.s1='CML-AM2like';
zz2=(z8 -z7) /(y8-y7);   s.s2='CML-AM4g11r11'; 
zz3=(z12-z11)/(y12-y11); s.s3='CML-AM4g11r11c';
zz4=(z14-z13)/(y14-y13); s.s4='CM4-AM4g11r11c';
%zz5=(z12-z11)/(y12-y11); s.s4='CML-AM4g11r11-Fixed-N';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,zz1,zz2,zz3,zz4,vbin,cmin,cmax,vname,fpath,expn,f,0);
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
s.s3='CML-AM4g11r11c minus CML-AM4g11r11'; 
s.s4='CM4-AM4g11r11c minus CML-AM4g11r11c'; vname=strcat(vname,'_diff');
plot_4panel_cm4(s,zz1,zz3-zz1,zz3,zz4-zz3,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcf_map'; s=cmlam2.v0.s; 
v=cmlam2.v0;       z1=squeeze(mean(v.toa.swcf.ann_bias(1:4,:,:),1)); y1=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam2.w0;       z2=squeeze(mean(v.toa.swcf.ann_bias(1:4,:,:),1)); y2=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g10r14.v0; z3=squeeze(mean(v.toa.swcf.ann_bias(1:4,:,:),1)); y3=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g10r14.w0; z4=squeeze(mean(v.toa.swcf.ann_bias(1:4,:,:),1)); y4=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r8.v0;  z5=squeeze(mean(v.toa.swcf.ann_bias(1:4,:,:),1)); y5=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r8.w0;  z6=squeeze(mean(v.toa.swcf.ann_bias(1:4,:,:),1)); y6=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r11.v0; z7=squeeze(mean(v.toa.swcf.ann_bias(1:4,:,:),1)); y7=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r11.w0; z8=squeeze(mean(v.toa.swcf.ann_bias(1:4,:,:),1)); y8=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11rfn.v0; z9=squeeze(mean(v.toa.swcf.ann_bias(1:4,:,:),1)); y9=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11rfn.w0; z10=squeeze(mean(v.toa.swcf.ann_bias(1:4,:,:),1)); y10=mean(v.sfc.tref.sea_stat.mmen.all);
zz1=(z2 -z1)/(y2-y1);  s.s1='CML-AM2like';
zz2=(z4 -z3)/(y4-y3);  s.s2='CML-AM4g10r14'; 
zz3=(z8 -z7)/(y8-y7);  s.s3='CML-AM4g11r11';
zz4=(z10-z9)/(y10-y9); s.s4='CML-AM4g11r11-Fixed-N';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,zz1,zz2,zz3,zz4,vbin,cmin,cmax,vname,fpath,expn,f,0);
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
s.s2='CML-AM4g11r11 minus CML-AM2like'; 
s.s4='CML-AM4g11r11-Fixed-N minus CML-AM4g11r11'; vname=strcat(vname,'_diff');
plot_4panel_cm4(s,zz1,zz3-zz1,zz3,zz4-zz3,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcf_map'; s=cmlam2.v0.s; 
v=cmlam2.v0;       z1=squeeze(mean(v.toa.lwcf.ann_bias(1:4,:,:),1)); y1=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam2.w0;       z2=squeeze(mean(v.toa.lwcf.ann_bias(1:4,:,:),1)); y2=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g10r14.v0; z3=squeeze(mean(v.toa.lwcf.ann_bias(1:4,:,:),1)); y3=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g10r14.w0; z4=squeeze(mean(v.toa.lwcf.ann_bias(1:4,:,:),1)); y4=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r8.v0;  z5=squeeze(mean(v.toa.lwcf.ann_bias(1:4,:,:),1)); y5=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r8.w0;  z6=squeeze(mean(v.toa.lwcf.ann_bias(1:4,:,:),1)); y6=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r11.v0; z7=squeeze(mean(v.toa.lwcf.ann_bias(1:4,:,:),1)); y7=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r11.w0; z8=squeeze(mean(v.toa.lwcf.ann_bias(1:4,:,:),1)); y8=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11rfn.v0; z9=squeeze(mean(v.toa.lwcf.ann_bias(1:4,:,:),1)); y9=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11rfn.w0; z10=squeeze(mean(v.toa.lwcf.ann_bias(1:4,:,:),1)); y10=mean(v.sfc.tref.sea_stat.mmen.all);
zz1=(z2 -z1)/(y2-y1);  s.s1='CML-AM2like';
zz2=(z4 -z3)/(y4-y3);  s.s2='CML-AM4g10r14'; 
zz3=(z8 -z7)/(y8-y7);  s.s3='CML-AM4g11r11';
zz4=(z10-z9)/(y10-y9); s.s4='CML-AM4g11r11-Fixed-N';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,zz1,zz2,zz3,zz4,vbin,cmin,cmax,vname,fpath,expn,f,0);
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
s.s2='CML-AM4g11r11 minus CML-AM2like'; 
s.s4='CML-AM4g11r11-Fixed-N minus CML-AM4g11r11'; vname=strcat(vname,'_diff');
plot_4panel_cm4(s,zz1,zz3-zz1,zz3,zz4-zz3,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwp_map'; s=cmlam2.v0.s; 
v=cmlam2.v0;       z1=squeeze(mean(v.atm.lwp.ann_bias(1:4,:,:),1)); y1=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam2.w0;       z2=squeeze(mean(v.atm.lwp.ann_bias(1:4,:,:),1)); y2=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g10r14.v0; z3=squeeze(mean(v.atm.lwp.ann_bias(1:4,:,:),1)); y3=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g10r14.w0; z4=squeeze(mean(v.atm.lwp.ann_bias(1:4,:,:),1)); y4=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r8.v0;  z5=squeeze(mean(v.atm.lwp.ann_bias(1:4,:,:),1)); y5=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r8.w0;  z6=squeeze(mean(v.atm.lwp.ann_bias(1:4,:,:),1)); y6=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r11.v0; z7=squeeze(mean(v.atm.lwp.ann_bias(1:4,:,:),1)); y7=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r11.w0; z8=squeeze(mean(v.atm.lwp.ann_bias(1:4,:,:),1)); y8=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11rfn.v0; z9=squeeze(mean(v.atm.lwp.ann_bias(1:4,:,:),1)); y9=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11rfn.w0; z10=squeeze(mean(v.atm.lwp.ann_bias(1:4,:,:),1)); y10=mean(v.sfc.tref.sea_stat.mmen.all);
zz1=(z2 -z1)/(y2-y1) *1000; s.s1='CML-AM2like';
zz2=(z4 -z3)/(y4-y3) *1000; s.s2='CML-AM4g10r14'; 
zz3=(z8 -z7)/(y8-y7) *1000; s.s3='CML-AM4g11r11';
zz4=(z10-z9)/(y10-y9)*1000; s.s4='CML-AM4g11r11-Fixed-N';
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,zz1,zz2,zz3,zz4,vbin,cmin,cmax,vname,fpath,expn,f,0);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax]; 
s.s2='CML-AM4g11r11 minus CML-AM2like'; 
s.s4='CML-AM4g11r11-Fixed-N minus CML-AM4g11r11'; vname=strcat(vname,'_diff');
plot_4panel_cm4(s,zz1,zz3-zz1,zz3,zz4-zz3,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qn850'; s=cmlam2.v0.s; a=1000000;
v=cmlam4g10r14.v0; z3=squeeze(mean(v.atm.qn850.ann_bias(1:4,:,:),1)); y3=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g10r14.w0; z4=squeeze(mean(v.atm.qn850.ann_bias(1:4,:,:),1)); y4=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r8.v0;  z5=squeeze(mean(v.atm.qn850.ann_bias(1:4,:,:),1)); y5=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r8.w0;  z6=squeeze(mean(v.atm.qn850.ann_bias(1:4,:,:),1)); y6=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r11.v0; z7=squeeze(mean(v.atm.qn850.ann_bias(1:4,:,:),1)); y7=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r11.w0; z8=squeeze(mean(v.atm.qn850.ann_bias(1:4,:,:),1)); y8=mean(v.sfc.tref.sea_stat.mmen.all);
%v=cmlam4g11rfn.v0; z9=squeeze(mean(v.atm.qn850.ann_bias(1:4,:,:),1)); y9=mean(v.sfc.tref.sea_stat.mmen.all);
%v=cmlam4g11rfn.w0; z10=squeeze(mean(v.atm.qn850.ann_bias(1:4,:,:),1)); y10=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r11c.v0;z11=squeeze(mean(v.atm.qn850.ann_bias(1:4,:,:),1)); y11=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g11r11c.w0;z12=squeeze(mean(v.atm.qn850.ann_bias(1:4,:,:),1)); y12=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4.v0;          z13=squeeze(mean(v.atm.qn850.ann_bias(1:4,:,:),1)); y13=mean(v.sfc.tref.sea_stat.mmen.all);
v=cm4.w0;          z14=squeeze(mean(v.atm.qn850.ann_bias(1:4,:,:),1)); y14=mean(v.sfc.tref.sea_stat.mmen.all);
%vname='al850';
%v=cmlam2.v0;       f1=squeeze(mean(v.atm.al850.ann_bias(1:4,:,:),1)); y1=mean(v.sfc.tref.sea_stat.mmen.all);
%v=cmlam2.w0;       f2=squeeze(mean(v.atm.al850.ann_bias(1:4,:,:),1)); y2=mean(v.sfc.tref.sea_stat.mmen.all);
v=cmlam4g10r14.v0;  f3=squeeze(mean(v.atm.al850.ann_bias(1:4,:,:),1));
v=cmlam4g10r14.w0;  f4=squeeze(mean(v.atm.al850.ann_bias(1:4,:,:),1));
v=cmlam4g11r8.v0;   f5=squeeze(mean(v.atm.al850.ann_bias(1:4,:,:),1));
v=cmlam4g11r8.w0;   f6=squeeze(mean(v.atm.al850.ann_bias(1:4,:,:),1));
v=cmlam4g11r11.v0;  f7=squeeze(mean(v.atm.al850.ann_bias(1:4,:,:),1));
v=cmlam4g11r11.w0;  f8=squeeze(mean(v.atm.al850.ann_bias(1:4,:,:),1));
%v=cmlam4g11rfn.v0;  f9=squeeze(mean(v.atm.al850.ann_bias(1:4,:,:),1));
%v=cmlam4g11rfn.w0;  f10=squeeze(mean(v.atm.al850.ann_bias(1:4,:,:),1));
v=cmlam4g11r11c.v0; f11=squeeze(mean(v.atm.al850.ann_bias(1:4,:,:),1));
v=cmlam4g11r11c.w0; f12=squeeze(mean(v.atm.al850.ann_bias(1:4,:,:),1));
v=cm4.v0;           f13=squeeze(mean(v.atm.al850.ann_bias(1:4,:,:),1));
v=cm4.w0;           f14=squeeze(mean(v.atm.al850.ann_bias(1:4,:,:),1));
%z=f1; z(z<0)=0; f1=z;              
%z=f2; z(z<0)=0; f2=z;    caxis([10 70]);
z=f3; z(z<0)=0; f3=z;  n3=z3/a./f3;    %figure; pcolor(n3); shading flat; colorbar;caxis([10 70]);
z=f4; z(z<0)=0; f4=z;  n4=z4/a./f4;    %figure; pcolor(n4); shading flat; colorbar;caxis([10 70]);
z=f5; z(z<0)=0; f5=z;  n5=z5/a./f5;    figure; pcolor(n5); shading flat; colorbar;caxis([10 70]);
z=f6; z(z<0)=0; f6=z;  n6=z6/a./f6;    %figure; pcolor(n6); shading flat; colorbar;
z=f7; z(z<0)=0; f7=z;  n7=z7/a./f7;    figure; pcolor(n7); shading flat; colorbar;caxis([10 70]);
z=f8; z(z<0)=0; f8=z;  n8=z8/a./f8;    %figure; pcolor(n8); shading flat; colorbar;
%z=f9; z(z<0)=0; f9=z;  n9 =z9 /a./f9;  figure; pcolor(n9); shading flat; colorbar;caxis([10 70]);
%z=f10;z(z<0)=0; f10=z; n10=z10/a./f10; %figure; pcolor(n8); shading flat; colorbar;
z=f11;z(z<0)=0; f11=z; n11=z11/a./f11; figure; pcolor(n11); shading flat; colorbar;caxis([10 70]);
z=f12;z(z<0)=0; f12=z; n12=z12/a./f12; %figure; pcolor(n8); shading flat; colorbar;
z=f13;z(z<0)=0; f13=z; n13=z13/a./f13; figure; pcolor(n13); shading flat; colorbar;caxis([10 70]);
z=f14;z(z<0)=0; f14=z; n14=z14/a./f14; %figure; pcolor(n8); shading flat; colorbar;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
zz1=(f4 -f3) /(y4 -y3) *100;  s.s1='CML-AM4g10r14';
zz2=(f8 -f7) /(y8 -y7) *100;  s.s3='CML-AM4g11r11';
zz3=(f12-f11)/(y12-y11)*100;  s.s4='CML-AM4g11r11c';
zz4=(f14-f13)/(y14-y13)*100;  s.s4='CM4-AM4g11r11c';
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,zz1,zz2,zz3,zz4,vbin,cmin,cmax,vname,fpath,expn,f,0);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax]; 
s.s2='CML-AM4g11r11 minus CML-AM2like'; 
s.s4='CML-AM4g11r11-Fixed-N minus CML-AM4g11r11'; vname=strcat(vname,'_diff');
plot_4panel_cm4(s,zz1,zz3-zz1,zz3,zz4-zz3,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
zz1=(n4 -n3);  s.s1='CML-AM4g10r14';  %zz1=n3;
zz2=(n8 -n7);  s.s2='CML-AM4g11r11';  %zz2=n7;
zz3=(n12-n11); s.s3='CML-AM4g11r11c'; %zz3=n11;
zz4=(n14-n13); s.s4='CM4-AM4g11r11c'; %zz4=n13;
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,zz1,zz2,zz3,zz4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



vname='tref_mean';  s=cmlg11a.v0.s;
v=cmlg6.v0;   x1=v.sfc.tref.ann.mmen.all; 
v=cmlg7.v0;   x2=v.sfc.tref.ann.mmen.all;
v=cmlg9.v0;   x3=v.sfc.tref.ann.mmen.all;
v=cmlg11c.v0; x4=v.sfc.tref.ann_stat.mmen.all-273.15;
v=cmlg11c.w0; x5=v.sfc.tref.ann_stat.mmen.all-273.15;
v=cmlg11c.v0; y4=v.toa.netrad.ann_stat.mmen.all;
v=cmlg11c.w0; y5=v.toa.netrad.ann_stat.mmen.all;
figure; plot(x5-x4,y5-y4,'s');

figure; 
plot(y1,'r'); hold on; plot(y2,'g'); plot(y3,'b'); 
plot(y4,'k'); hold on; plot(y5,'m'); 



vname='tref_rmse';  s=cmlg11a.v0.s;
v=cmlg6.v0;   y1=v.sfc.tref.ann.rmse.all;
v=cmlg9.v0;   y2=v.sfc.tref.ann.rmse.all;
v=cmlg11a.v0; y3=v.sfc.tref.ann_stat.rmse.all;
v=cmlg11b.v0; y4=v.sfc.tref.ann_stat.rmse.all;
figure; plot(y1,'r'); hold on; plot(y2,'g'); plot(y3,'b'); plot(y4,'k'); 
vname='netradtoa_mean';  s=cmlg11a.v0.s;
v=cmlg6.v0;   y1=v.toa.netrad.ann.rmse.all;
v=cmlg9.v0;   y2=v.toa.netrad.ann.rmse.all;
v=cmlg11a.v0; y3=v.toa.netrad.ann_stat.rmse.all;
v=cmlg11b.v0; y4=v.toa.netrad.ann_stat.rmse.all;
figure; plot(y1,'r'); hold on; plot(y2,'g'); plot(y3,'b'); plot(y4,'k'); 
vname='pcp_rmse';  s=cmlg11a.v0.s;
v=cmlg6.v0;   y1=v.sfc.prec_tt.ann.rmse.all;
v=cmlg9.v0;   y2=v.sfc.prec_tt.ann.rmse.all;
v=cmlg11a.v0; y3=v.sfc.pcp.ann_stat.rmse.all;
v=cmlg11b.v0; y4=v.sfc.pcp.ann_stat.rmse.all;
figure; plot(y1,'r'); hold on; plot(y2,'g'); plot(y3,'b'); plot(y4,'k'); 

vname='tref_map'; s=cmlg11a.v0.s; 
v=cmlg6.v0;   z1=squeeze(mean(v.sfc.tref.dif_ann(1:4,:,:),1));    s.s1='CM4g6 minus INTERIM';
v=cmlg9.v0;   z2=squeeze(mean(v.sfc.tref.dif_ann(1:4,:,:),1));    s.s2='CM4g9 minus INTERIM';
v=cmlg11a.v0; z3=squeeze(mean(v.sfc.tref.ann_bias(1:4,:,:),1));   s.s3='CM4g11a minus INTERIM';
v=cmlg11b.v0; z4=squeeze(mean(v.sfc.tref.ann_bias(1:4,:,:),1));   s.s4='CM4g11b minus INTERIM';
z4=z4-z3;
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);

vname='netradtoa_map'; s=cmlg11a.v0.s; 
v=cmlg6.v0;   z1=squeeze(mean(v.toa.netrad.dif_ann(1:4,:,:),1));    s.s1='CM4g6 minus INTERIM';
v=cmlg9.v0;   z2=squeeze(mean(v.toa.netrad.dif_ann(1:4,:,:),1));    s.s2='CM4g9 minus INTERIM';
v=cmlg11a.v0; z3=squeeze(mean(v.toa.netrad.ann_bias(1:4,:,:),1));   s.s3='CM4g11a minus INTERIM';
v=cmlg11b.v0; z4=squeeze(mean(v.toa.netrad.ann_bias(1:4,:,:),1));   s.s4='CM4g11b minus INTERIM';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);

expn='c96L32_aref0_2000climo';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);aref0.v0=v;
expn='c96L32_aref0_2000climo_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);aref0.w0=v;
expn='c96L32_aref0_1860climo';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);aref0.c0=v;
expn='c96L32_aref0_2000aero';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);aref0.a0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_cm4/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat'); 
tpath='/archive/Ming.Zhao/awg/verona/';
expn='c96L32_am4g11r8_2010climo_aref0'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);aref0.v0=v;
expn='c96L32_am4g11r8_2010climo_aref0_p2K';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);aref0.w0=v;
expn='c96L32_am4g11r8_2010climo_aref0_2xCO2';fn=strcat(tpath,expn,pp,expn,dr);load(fn);aref0.g0=v;

expn='c96L32_am4g10r8_2000climo';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g10r8.v0=v;
expn='c96L32_am4g10r8_2000climo_p2K';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g10r8.w0=v;
expn='c96L32_am4g10r8_2000climo_p2K';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g10r8.g0=v;

expn='c96L32_am4g10r14_2000climo';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g10r14.v0=v;
expn='c96L32_am4g10r14_2000climo_p2K';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g10r14.w0=v;
expn='c96L32_am4g10r14_2000climo_p2K';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g10r14.g0=v;

expn='c96L32_am4g11r7_2000climo';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r7.v0=v;
expn='c96L32_am4g11r7_2000climo_p2K';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r7.w0=v;
expn='c96L32_am4g11r7_2000climo_p2K';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r7.g0=v;

expn='c96L32_am4g11r8_2010climo_3'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r8.v0=v;
expn='c96L32_am4g11r8_2010climo_3_p2K';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r8.w0=v;
expn='c96L32_am4g11r8_2010climo_3_2xCO2';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r8.g0=v;

expn='c96L32_am4g11r10_2010climo_C0'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r9.v0=v;
expn='c96L32_am4g11r10_2010climo_C0_p2K';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r9.w0=v;
expn='c96L32_am4g11r10_2010climo_C0_2xCO2';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r9.g0=v;

expn='c96L32_am4g11r10_2010climo_D0'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r10.v0=v;
expn='c96L32_am4g11r10_2010climo_D0_p2K';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r10.w0=v;
expn='c96L32_am4g11r10_2010climo_D0_2xCO2';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r10.g0=v;

expn='c96L32_am4g11r8_2010climo_B0'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r11.v0=v;
expn='c96L32_am4g11r8_2010climo_B0_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r11.w0=v;
expn='c96L32_am4g11r8_2010climo_B0_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r11.g0=v;

expn='c96L32_am4g11r8_2010climo_B8'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r12.v0=v;
expn='c96L32_am4g11r8_2010climo_B8_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r12.w0=v;
expn='c96L32_am4g11r8_2010climo_B8_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r12.g0=v;

expn='c96L32_am4g11r8_2010climo_C0'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r8c0.v0=v;
expn='c96L32_am4g11r8_2010climo_C0_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r8c0.w0=v;
expn='c96L32_am4g11r8_2010climo_C0_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r8c0.g0=v;

expn='c96L32_am4g11r8_2010climo_C1'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r8c1.v0=v;
expn='c96L32_am4g11r8_2010climo_C1_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r8c1.w0=v;
expn='c96L32_am4g11r8_2010climo_C1_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r8c1.g0=v;

expn='c96L32_am4g11r8_2010climo_C2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r8c2.v0=v;
expn='c96L32_am4g11r8_2010climo_C2_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r8c2.w0=v;
expn='c96L32_am4g11r8_2010climo_C2_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r8c2.g0=v;

%expn='c96L32_am4g11r10_2010climo_E2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r15.v0=v;
%expn='c96L32_am4g11r10_2010climo_E2_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r15.w0=v;
%expn='c96L32_am4g11r10_2010climo_E2_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r15.g0=v;
%expn='c96L32_am4g11r10_2010climo_E3'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r16.v0=v;
%expn='c96L32_am4g11r10_2010climo_E3_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r16.w0=v;
%expn='c96L32_am4g11r10_2010climo_E3_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r16.g0=v;
%expn='c96L32_am4g11r8_2010climo_B1'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r17.v0=v;
%expn='c96L32_am4g11r8_2010climo_B1_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r17.w0=v;
%expn='c96L32_am4g11r8_2010climo_B1_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11r17.g0=v;

x=aref0;      aref0.d     =compute_rfp_cess_2co2(x);
x=am4g10r8;   am4g10r8.d  =compute_rfp_cess_2co2(x);
x=am4g10r14;  am4g10r14.d =compute_rfp_cess_2co2(x);
x=am4g11r7;   am4g11r7.d  =compute_rfp_cess_2co2(x);

x=am4g11r8;   am4g11r8.d  =compute_rfp_cess_2co2(x);
x=am4g11r9;   am4g11r9.d  =compute_rfp_cess_2co2(x);
x=am4g11r10;  am4g11r10.d =compute_rfp_cess_2co2(x);
x=am4g11r11;  am4g11r11.d =compute_rfp_cess_2co2(x);
x=am4g11r12;  am4g11r12.d =compute_rfp_cess_2co2(x);
x=am4g11r8c0; am4g11r8c0.d=compute_rfp_cess_2co2(x);
x=am4g11r8c1; am4g11r8c1.d=compute_rfp_cess_2co2(x);
x=am4g11r8c2; am4g11r8c2.d=compute_rfp_cess_2co2(x);
d0=aref0.d;        d0.s ='AM2like';
d1=am4g10r8.d;     d1.s ='AM4g10r8';
d2=am4g10r14.d;    d2.s ='AM4g10r14';
d3=am4g11r7.d;     d3.s ='AM4g11r7';
d4=am4g11r8.d;     d4.s ='AM4g11r8';
d5=am4g11r9.d;     d5.s ='AM4g11r9';
d6=am4g11r10.d;    d6.s ='AM4g11r10';
d7=am4g11r11.d;    d7.s ='AM4g11r11';
d8=am4g11r12.d;    d8.s ='AM4g11r12';
d9=am4g11r8c0.d;   d9.s ='AM4g11r8-C0';
d10=am4g11r8c1.d;  d10.s='AM4g11r8-C1';
d11=am4g11r8c2.d;  d11.s='AM4g11r8-C2';
plot_crf_sen(d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,'glob');
plot_crf_sen(d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,'trop');
plot_crf_sen(d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,'nhet');
plot_crf_sen(d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,'shet');

plot_cld_sen(d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,'glob');
plot_cld_sen(d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,'trop');
plot_cld_sen(d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,'nhet');
plot_cld_sen(d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,'shet');

plot_wat_sen(d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,'glob');
plot_wat_sen(d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,'trop');
plot_wat_sen(d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,'nhet');
plot_wat_sen(d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,'shet');

plot_cess_sen;


%expn='CM4_c96L32_am4g7_2000_OMp5_DR_H3_MEKE';fn=strcat(tpath,expn,pp,expn,dr);load(fn);cmmg7.v0=v;

y1=cm4g10r14a.sfc.tref.ts.org_ann-273.15; 
y2=cm4g10r14.v0.sfc.tref.ts.org_ann-273.15; 
y3=cm4g11r5.v0.sfc.tref.ts.org_ann-273.15; 
pms=[ 0, 0, 1200, 800]*1; fsize=16; x=[1:100];
handle=figure('Position',pms,'visible','on'); lw=2;
plot([1:80], y1,'g-', 'LineWidth',lw); hold on; 
plot([1:100],y2,'g--','LineWidth',lw); hold on; 
plot([1:10], y3,'b-', 'LineWidth',lw); hold on; 
set(gca,'FontSize',fsize); axis([0 100 12 15]); 
xlabel('year','FontSize',fsize); ylabel('surface air temperature (K)');
%legend(s1,s2,s3,s4,3);
legend(s1,s2,s3,s4,s5,s6,3);
visfig='off'; figpath='./fig_cm4/'; expn='cm4g10r8'; vname='tref';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tsurf_bias'; k=1; k1=1; k2=2; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(cm4g10r14a.sfc.tsurf.ann_bias  (k1:k2,:,:),1)); 
x2=squeeze(mean(cm4g10r14.v0.sfc.tsurf.ann_bias(k1:k2,:,:),1)); 
x3=squeeze(mean(cm4g11r5.v0.sfc.tsurf.ann_bias (k1:k2,:,:),1)); 
z1=x1;    s.s1='CM4g10r14a minus INTERIM';
z2=x2;    s.s2='CM4g10r14 minus INTERIM';
z3=x3;    s.s3='CM4g11r5 minus INTERIM';
z4=x3-x2; s.s4='CM4g11r5 minus CM4g10r14';
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_bias'; k=1; k1=1; k2=2; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(cm4g10r14a.sfc.pcp.ann_bias  (k1:k2,:,:),1)); 
x2=squeeze(mean(cm4g10r14.v0.sfc.pcp.ann_bias(k1:k2,:,:),1)); 
x3=squeeze(mean(cm4g11r5.v0.sfc.pcp.ann_bias (k1:k2,:,:),1)); 
z1=x1;    s.s1='CM4g10r14a minus INTERIM';
z2=x2;    s.s2='CM4g10r14 minus INTERIM';
z3=x3;    s.s3='CM4g11r5 minus INTERIM';
z4=x3-x2; s.s4='CM4g11r5 minus CM4g10r14';
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qal'; k=1; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(aref0.v0.atm.qal.sea_bias  (k,:,:),1));
y1=squeeze(mean(aref0.w0.atm.qal.sea_bias  (k,:,:),1));
x2=squeeze(mean(am4g10a.v0.atm.qal.sea_bias (k,:,:),1));
y2=squeeze(mean(am4g10a.w0.atm.qal.sea_bias (k,:,:),1));
x3=squeeze(mean(am4g10b.v0.atm.qal.sea_bias (k,:,:),1));
y3=squeeze(mean(am4g10b.w0.atm.qal.sea_bias (k,:,:),1));
x4=squeeze(mean(am4g11.v0.atm.qal.sea_bias(k,:,:),1));
y4=squeeze(mean(am4g11.w0.atm.qal.sea_bias(k,:,:),1));
z1=y1-x1; s.s1='AM2       (p2K-cntl)'; %z1=x1;
z2=y2-x2; s.s2='AM4g10r8  (p2K-cntl)'; %z2=x2;
z3=y3-x3; s.s3='AM4g10r14 (p2K-cntl)'; %z3=x3; 
z4=y4-x4; s.s4='AM4g11    (p2K-cntl)'; %z4=x4;
z5=z4-z1; s.s5='AM4g11 - AM2';         %z5=x3-x1;
z6=z4-z3; s.s6='AM4g11 - AM4g10r14';   %z6=x4-x1;
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g11'; f=1; 
plot_6panel_cm4(s,z1,z2,z3,z4,z5,z6,vbin,cmin,cmax,vname,fpath,expn,f,k);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qam'; k=1; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(aref0.v0.atm.qam.sea_bias  (k,:,:),1));
y1=squeeze(mean(aref0.w0.atm.qam.sea_bias  (k,:,:),1));
x2=squeeze(mean(am4g10a.v0.atm.qam.sea_bias (k,:,:),1));
y2=squeeze(mean(am4g10a.w0.atm.qam.sea_bias (k,:,:),1));
x3=squeeze(mean(am4g10b.v0.atm.qam.sea_bias (k,:,:),1));
y3=squeeze(mean(am4g10b.w0.atm.qam.sea_bias (k,:,:),1));
x4=squeeze(mean(am4g11.v0.atm.qam.sea_bias(k,:,:),1));
y4=squeeze(mean(am4g11.w0.atm.qam.sea_bias(k,:,:),1));
z1=y1-x1; s.s1='AM2      (p2K-cntl)'; %z1=x1;
z2=y2-x2; s.s2='AM4g10r8 (p2K-cntl)'; %z2=x2;
z3=y3-x3; s.s3='AM4g10r14(p2K-cntl)'; %z3=x3; 
z4=y4-x4; s.s4='AM4g11   (p2K-cntl)'; %z4=x4;
z5=z4-z1; s.s5='AM4g11 - AM2';        %z5=x3-x1;
z6=z4-z3; s.s6='AM4g11 - AM4g11';     %z6=x4-x1;
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g11'; f=1; 
plot_6panel_cm4(s,z1,z2,z3,z4,z5,z6,vbin,cmin,cmax,vname,fpath,expn,f,k);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qah'; k=1; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(aref0.v0.atm.qah.sea_bias  (k,:,:),1));
y1=squeeze(mean(aref0.w0.atm.qah.sea_bias  (k,:,:),1));
x2=squeeze(mean(am4g10a.v0.atm.qah.sea_bias (k,:,:),1));
y2=squeeze(mean(am4g10a.w0.atm.qah.sea_bias (k,:,:),1));
x3=squeeze(mean(am4g10b.v0.atm.qah.sea_bias (k,:,:),1));
y3=squeeze(mean(am4g10b.w0.atm.qah.sea_bias (k,:,:),1));
x4=squeeze(mean(am4g11.v0.atm.qah.sea_bias(k,:,:),1));
y4=squeeze(mean(am4g11.w0.atm.qah.sea_bias(k,:,:),1));
z1=y1-x1; s.s1='AM2      (p2K-cntl)'; %z1=x1;
z2=y2-x2; s.s2='AM4g10r8 (p2K-cntl)'; %z2=x2;
z3=y3-x3; s.s3='AM4g10r14(p2K-cntl)'; %z3=x3; 
z4=y4-x4; s.s4='AM4g11   (p2K-cntl)'; %z4=x4;
z5=z4-z1; s.s5='AM4g11 - AM2';        %z5=x3-x1;
z6=z4-z3; s.s6='AM4g11 - AM4g11';     %z5=x4-x1;
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g11'; f=1; 
plot_6panel_cm4(s,z1,z2,z3,z4,z5,z6,vbin,cmin,cmax,vname,fpath,expn,f,k);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcf'; k=1; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(aref0.v0.toa.swcf.sea_bias  (k,:,:),1));
y1=squeeze(mean(aref0.w0.toa.swcf.sea_bias  (k,:,:),1));
x2=squeeze(mean(am4g10a.v0.toa.swcf.sea_bias(k,:,:),1));
y2=squeeze(mean(am4g10a.w0.toa.swcf.sea_bias(k,:,:),1));
x3=squeeze(mean(am4g10b.v0.toa.swcf.sea_bias(k,:,:),1));
y3=squeeze(mean(am4g10b.w0.toa.swcf.sea_bias(k,:,:),1));
x4=squeeze(mean(am4g11.v0.toa.swcf.sea_bias (k,:,:),1));
y4=squeeze(mean(am4g11.w0.toa.swcf.sea_bias (k,:,:),1));
z1=y1-x1; s.s1='AM2       (p2K-cntl)';
z2=y2-x2; s.s2='AM4g10r8  (p2K-cntl)';
z3=y3-x3; s.s3='AM4g10r14 (p2K-cntl)';
z4=y4-x4; s.s4='AM4g11    (p2K-cntl)';
z5=z4-z1; s.s5='AM4g11 - AM2';
z6=z4-z3; s.s6='AM4g11 - AM4g10r14';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g11'; f=1; 
plot_6panel_cm4(s,z1,z2,z3,z4,z5,z6,vbin,cmin,cmax,vname,fpath,expn,f,k);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ttcf'; k=1; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(aref0.v0.toa.ttcf.sea_bias(k,:,:),1)); 
y1=squeeze(mean(aref0.w0.toa.ttcf.sea_bias(k,:,:),1)); 
x2=squeeze(mean(am4g10a.v0.toa.ttcf.sea_bias(k,:,:),1)); 
y2=squeeze(mean(am4g10a.w0.toa.ttcf.sea_bias(k,:,:),1)); 
x3=squeeze(mean(am4g10b.v0.toa.ttcf.sea_bias(k,:,:),1)); 
y3=squeeze(mean(am4g10b.w0.toa.ttcf.sea_bias(k,:,:),1)); 
x4=squeeze(mean(am4g11.v0.toa.ttcf.sea_bias (k,:,:),1)); 
y4=squeeze(mean(am4g11.w0.toa.ttcf.sea_bias (k,:,:),1)); 
z1=y1-x1; s.s1='AM2      (p2K-cntl)';
z2=y2-x2; s.s2='AM4g10r8 (p2K-cntl)';
z3=y3-x3; s.s3='AM4g10r14(p2K-cntl)';
z4=y4-x4; s.s4='AM4g11  (p2K-cntl)';
z5=z4-z1; s.s5='AM4g11 - AM2';
z6=z4-z3; s.s6='AM4g11 - AM4g10r14';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g11'; f=1; 
plot_6panel_cm4(s,z1,z2,z3,z4,z5,z6,vbin,cmin,cmax,vname,fpath,expn,f,k);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcf'; k=1; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(aref0.v0.toa.lwcf.sea_bias(k,:,:),1)); 
y1=squeeze(mean(aref0.w0.toa.lwcf.sea_bias(k,:,:),1)); 
x2=squeeze(mean(am4g10a.v0.toa.lwcf.sea_bias(k,:,:),1)); 
y2=squeeze(mean(am4g10a.w0.toa.lwcf.sea_bias(k,:,:),1)); 
x3=squeeze(mean(am4g10b.v0.toa.lwcf.sea_bias(k,:,:),1)); 
y3=squeeze(mean(am4g10b.w0.toa.lwcf.sea_bias(k,:,:),1)); 
x4=squeeze(mean(am4g11.v0.toa.lwcf.sea_bias (k,:,:),1)); 
y4=squeeze(mean(am4g11.w0.toa.lwcf.sea_bias (k,:,:),1)); 
z1=y1-x1; s.s1='AM2      (p2K-cntl)';
z2=y2-x2; s.s2='AM4g10r8 (p2K-cntl)';
z3=y3-x3; s.s3='AM4g10r14(p2K-cntl)';
z4=y4-x4; s.s4='AM4g11   (p2K-cntl)';
z5=z4-z1; s.s5='AM4g11 - AM2';
z6=z4-z3; s.s6='AM4g11 - AM4g10r14';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g11'; f=1; 
plot_6panel_cm4(s,z1,z2,z3,z4,z5,z6,vbin,cmin,cmax,vname,fpath,expn,f,k);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g10.v0.toa.netrad.sea_bias(k,:,:),1)); 
x2=squeeze(mean(am4g11.v0.toa.netrad.sea_bias(k,:,:),1)); 
x3=squeeze(mean(am4g11b.v0.toa.netrad.sea_bias(k,:,:),1)); 
y1=squeeze(mean(am4g10.w0.toa.netrad.sea_bias(k,:,:),1)); 
y2=squeeze(mean(am4g11.w0.toa.netrad.sea_bias(k,:,:),1)); 
y3=squeeze(mean(am4g11b.w0.toa.netrad.sea_bias(k,:,:),1)); 
z1=y1-x1; s.s1='AM4g10  (p2K-cntl)';
z2=y2-x2; s.s2='AM4g11  (p2K-cntl)';
z3=y3-x3; s.s3='AM4g11b (p2K-cntl)';
z4=z3-z2; s.s4='AM4g11b - AM4g11';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%plot Bony analysis and break down%%%%%%%%%%%%%%%%%
opt=1;
plot_om700_cess(o,aref0, 'AM2',opt);
plot_om700_cess(o,am4g6, 'AM4g6',opt);
plot_om700_cess(o,am4g7, 'AM4g7',opt);
plot_om700_cess(o,am4g9, 'AM4g9',opt);
plot_om700_cess(o,am4gA, 'AM4g10r3',opt);
plot_om700_cess(o,am4gA1,'AM4g10r8',opt);
plot_om500_cess(o,aref0, 'AM2',opt);
plot_om500_cess(o,am4g6, 'AM4g6',opt);
plot_om500_cess(o,am4g7, 'AM4g7',opt);
plot_om500_cess(o,am4g9, 'AM4g9',opt);
plot_om500_cess(o,am4gA, 'AM4g10r3',opt);
plot_om500_cess(o,am4gA1,'AM4g10r8',opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y1=cm4g9.v0.sfc.tref.ts.org_ann-273.15;  
y2=cm4g9.a0.sfc.tref.ts.org_ann-273.15;  
y3=cm4gA.v0.sfc.tref.ts.org_ann-273.15;  
y4=cm4gA.a0.sfc.tref.ts.org_ann-273.15;  
y5=cm4gA1.v0.sfc.tref.ts.org_ann-273.15; 
y6=cm4gA1.a0.sfc.tref.ts.org_ann-273.15; 
k1=51; k2=100;
y1a=mean(y1(k1:k2)); s1=sprintf('g9    (2000): %5.2fC',y1a)
y2a=mean(y2(k1:k2)); s2=sprintf('g9    (1860): %5.2fC',y2a)
y3a=mean(y3(k1:k2)); s3=sprintf('g10r3 (2000): %5.2fC',y3a)
y4a=mean(y4(k1:k2)); s4=sprintf('g10r3 (1860): %5.2fC',y4a)
y5a=mean(y5(k1:k2)); s5=sprintf('g10r8 (2000): %5.2fC',y5a)
y6a=mean(y6(k1:k2)); s6=sprintf('g10r8 (1860): %5.2fC',y6a)
pms=[ 0, 0, 1200, 800]*1; fsize=16; x=[1:100];
handle=figure('Position',pms,'visible','on'); lw=2;
plot(x,y1,'g-', 'LineWidth',lw); hold on; 
plot(x,y2,'g--','LineWidth',lw); hold on; 
plot(x,y3,'b-', 'LineWidth',lw); hold on; 
plot(x,y4,'b--','LineWidth',lw);
plot(x,y5,'r-', 'LineWidth',lw); 
plot(x,y6,'r--','LineWidth',lw); 
set(gca,'FontSize',fsize); axis([0 100 12 15]); 
xlabel('year','FontSize',fsize); ylabel('surface air temperature (K)');
%legend(s1,s2,s3,s4,3);
legend(s1,s2,s3,s4,s5,s6,3);
visfig='off'; figpath='./fig_cm4/'; expn='cm4g10r8'; vname='tref';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
y1=cm4g9.v0.toa.netrad.ann_stat.mmen.all;  
y2=cm4g9.a0.toa.netrad.ann_stat.mmen.all;  
y3=cm4gA.v0.toa.netrad.ann_stat.mmen.all;  
y4=cm4gA.a0.toa.netrad.ann_stat.mmen.all;  
y5=cm4gA1.v0.toa.netrad.ann_stat.mmen.all; 
y6=cm4gA1.a0.toa.netrad.ann_stat.mmen.all; 
k1=11; k2=20;
y1a=mean(y1(k1:k2)); s1=sprintf('g9    (2000): %5.2fW/m2',y1a);
y2a=mean(y2(k1:k2)); s2=sprintf('g9    (1860): %5.2fW/m2',y2a);
y3a=mean(y3(k1:k2)); s3=sprintf('g10r3 (2000): %5.2fW/m2',y3a);
y4a=mean(y4(k1:k2)); s4=sprintf('g10r3 (1860): %5.2fW/m2',y4a);
y5a=mean(y5(k1:k2)); s5=sprintf('g10r8 (2000): %5.2fW/m2',y5a);
y6a=mean(y6(k1:k2)); s6=sprintf('g10r8 (1860): %5.2fW/m2',y6a);
y1b=mean(am4g9.v0.toa.netrad.ann_stat.mmen.all);
y2b=mean(am4g9.a0.toa.netrad.ann_stat.mmen.all);
y3b=mean(am4gA.v0.toa.netrad.ann_stat.mmen.all);
y4b=mean(am4gA.a0.toa.netrad.ann_stat.mmen.all);
y5b=mean(am4gA1.v0.toa.netrad.ann_stat.mmen.all);
y6b=mean(am4gA1.a0.toa.netrad.ann_stat.mmen.all);
pms=[ 0, 0, 1200, 800]*1; fsize=16; x=[2.5:5:100];
handle=figure('Position',pms,'visible','on'); lw=2; msize=16;
plot(x,y1,'g-', 'LineWidth',lw); hold on; 
plot(x,y2,'g--','LineWidth',lw); hold on; 
plot(x,y3,'b-', 'LineWidth',lw); hold on; 
plot(x,y4,'b--','LineWidth',lw);
plot(x,y5,'r-', 'LineWidth',lw); 
plot(x,y6,'r--','LineWidth',lw); 
plot(2.5,y1b,'og','MarkerSize',msize,'MarkerFaceColor','g');
plot(2.5,y2b,'og','MarkerSize',msize,'MarkerFaceColor','w');
plot(2.5,y3b,'sb','MarkerSize',msize,'MarkerFaceColor','b');
plot(2.5,y4b,'sb','MarkerSize',msize,'MarkerFaceColor','w');
plot(2.5,y5b,'pr','MarkerSize',msize,'MarkerFaceColor','r');
plot(2.5,y6b,'pr','MarkerSize',msize,'MarkerFaceColor','w');
plot(2.5,0.405,'og','MarkerSize',msize+2,'MarkerFaceColor','g');
plot(2.5,0.628,'sb','MarkerSize',msize+2,'MarkerFaceColor','b');
plot(2.5,0.499,'pr','MarkerSize',msize+2,'MarkerFaceColor','r');

set(gca,'FontSize',fsize); axis([0 100 -2 2]); 
xlabel('year','FontSize',fsize); ylabel('net TOA radiative flux (W/m2)');
legend(s1,s2,s3,s4,s5,s6,4);
visfig='off'; figpath='./fig_cm4/'; expn='cm4g10r8'; vname='netradtoa';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tsurf_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(cm4g9.v0.sfc.tsurf.sea_bias(k,:,:),1)); 
x2=squeeze(mean(cm4gA.v0.sfc.tsurf.sea_bias(k,:,:),1)); 
x3=squeeze(mean(cm4gA1.v0.sfc.tsurf.sea_bias(k,:,:),1)); 
z1=x1;    s.s1='CM4g9 minus INTERIM';
z2=x2;    s.s2='CM4g10r3 minus INTERIM';
z3=x3;    s.s3='CM4g10r8 minus INTERIM';
z4=x3-x2; s.s4='CM4g10r8 minus CM4g10r3';
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(cm4g9.v0.sfc.tref.sea_bias(k,:,:),1)); 
x2=squeeze(mean(cm4gA.v0.sfc.tref.sea_bias(k,:,:),1)); 
x3=squeeze(mean(cm4gA1.v0.sfc.tref.sea_bias(k,:,:),1)); 
z1=x1;    s.s1='CM4g9 minus INTERIM';
z2=x2;    s.s2='CM4g10r3 minus INTERIM';
z3=x3;    s.s3='CM4g10r8 minus INTERIM';
z4=x3-x2; s.s4='CM4g10r8 minus CM4g10r3';
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
y1=cm4g9.v0.sfc.tref.ann_stat.mmen.all;  y1_avg=mean(y1);
y2=cm4g9.a0.sfc.tref.ann_stat.mmen.all;  y2_avg=mean(y2);
y3=cm4gA.v0.sfc.tref.ann_stat.mmen.all;  y3_avg=mean(y3);
y4=cm4gA.a0.sfc.tref.ann_stat.mmen.all;  y4_avg=mean(y4);
y5=cm4gA1.v0.sfc.tref.ann_stat.mmen.all; y5_avg=mean(y5);
y6=cm4gA1.a0.sfc.tref.ann_stat.mmen.all; y6_avg=mean(y6);
pms=[ 0, 0, 1200, 800]*0.8; fsize=20; x=[2.5:5:80];
handle=figure('Position',pms,'visible','on'); lw=2;
x=[1:5:100];
plot(x,y2-y1,'b','LineWidth',lw); hold on; 
plot(x,y4-y3,'g','LineWidth',lw); hold on; 
plot(x,y6-y5,'r','LineWidth',lw); hold on; 
axis([0 100 -2 -0.5]);
%%%%%%%%%%%%%%%%%%%%%%%%%
y1=cm4g9.v0.sfc.tref.ann_stat.rmse.all;  y1_avg=mean(y1);
y2=cm4gA.v0.sfc.tref.ann_stat.rmse.all;  y3_avg=mean(y3);
y3=cm4gA1.v0.sfc.tref.ann_stat.rmse.all; y5_avg=mean(y5);
pms=[ 0, 0, 1200, 800]*0.8; fsize=20; x=[2.5:5:80];
handle=figure('Position',pms,'visible','on'); lw=2;
x=[1:5:100];
plot(x,y1,'g','LineWidth',lw); hold on; 
plot(x,y2,'b','LineWidth',lw); hold on; 
plot(x,y3,'r','LineWidth',lw); hold on; 
set(gca,'FontSize',fsize); axis([0 100 1 1.5]); 
xlabel('year','FontSize',fsize); 
ylabel('RMSE of surface air temperature (K)');
legend('CM4g9 (2000)','CM4g10r3 (2000)','CM4g10r8 (2000)',2);
visfig='off'; figpath='./fig_cm4/'; expn='cm4g10r8'; vname='tref_ts';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
y1=cm4g9.v0.sfc.pcp.ann_stat.rmse.all;  y1_avg=mean(y1);
y2=cm4gA.v0.sfc.pcp.ann_stat.rmse.all;  y3_avg=mean(y3);
y3=cm4gA1.v0.sfc.pcp.ann_stat.rmse.all; y5_avg=mean(y5);
pms=[ 0, 0, 1200, 800]*0.8; fsize=20; x=[2.5:5:80];
handle=figure('Position',pms,'visible','on'); lw=2;
x=[1:5:100];
plot(x,y1,'g','LineWidth',lw); hold on; 
plot(x,y2,'b','LineWidth',lw); hold on; 
plot(x,y3,'r','LineWidth',lw); hold on; 
set(gca,'FontSize',fsize); axis([0 100 1 1.4]); 
xlabel('year','FontSize',fsize); 
ylabel('RMSE of precipitation (mm/day)');
legend('CM4g9 (2000)','CM4g10r3 (2000)','CM4g10r8 (2000)',2);
visfig='off'; figpath='./fig_cm4/'; expn='cm4g10r8'; vname='pcp_ts';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
y1=cm4g9.v0.toa.netrad.ann_stat.rmse.all;  y1_avg=mean(y1);
y2=cm4gA.v0.toa.netrad.ann_stat.rmse.all;  y3_avg=mean(y3);
y3=cm4gA1.v0.toa.netrad.ann_stat.rmse.all; y5_avg=mean(y5);
pms=[ 0, 0, 1200, 800]*0.8; fsize=20; x=[2.5:5:80];
handle=figure('Position',pms,'visible','on'); lw=2;
x=[1:5:100];
plot(x,y1,'g','LineWidth',lw); hold on; 
plot(x,y2,'b','LineWidth',lw); hold on; 
plot(x,y3,'r','LineWidth',lw); hold on; 
set(gca,'FontSize',fsize); axis([0 100 6.5 8]); 
xlabel('year','FontSize',fsize); 
ylabel('RMSE of TOA net radiation (W/m2)');
legend('CM4g9 (2000)','CM4g10r3 (2000)','CM4g10r8 (2000)',2);
visfig='off'; figpath='./fig_cm4/'; expn='cm4g10r8'; vname='netradtoa_ts';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
y1=cm4g9.v0.toa.swnet.ann_stat.rmse.all;  y1_avg=mean(y1);
y2=cm4gA.v0.toa.swnet.ann_stat.rmse.all;  y2_avg=mean(y2);
y3=cm4gA1.v0.toa.swnet.ann_stat.rmse.all; y3_avg=mean(y3);
pms=[ 0, 0, 1200, 800]*0.8; fsize=20; x=[2.5:5:80];
handle=figure('Position',pms,'visible','on'); lw=2;
x=[1:5:100];
plot(x,y1,'g','LineWidth',lw); hold on; 
plot(x,y2,'b','LineWidth',lw); hold on; 
plot(x,y3,'r','LineWidth',lw); hold on; 
set(gca,'FontSize',fsize); axis([0 100 6.5 8]); 
xlabel('year','FontSize',fsize); 
ylabel('RMSE of TOA net radiation (W/m2)');
legend('CM4g9 (2000)','CM4g10r3 (2000)','CM4g10r8 (2000)',2);
visfig='off'; figpath='./fig_cm4/'; expn='cm4g10r8'; vname='netradtoa_ts';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%

vname='netrad'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.netrad.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4gA.v0.toa.netrad.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4gA2.v0.toa.netrad.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9';
z2=x2;    s.s2='AM4g10r3';
z3=x3;    s.s3='AM4g10r8';
z4=z3-z2; s.s4='AM4g10r8-AM4g10r3';
cmin=-20; cmax=20; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.swnet.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4gA.v0.toa.swnet.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4gA2.v0.toa.swnet.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9';
z2=x2;    s.s2='AM4g10r3';
z3=x3;    s.s3='AM4g10r8';
z4=z3-z2; s.s4='AM4g10r8-AM4g10r3';
cmin=-20; cmax=20; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.lwnet.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4gA.v0.toa.lwnet.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4gA2.v0.toa.lwnet.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9';
z2=x2;    s.s2='AM4g10r3';
z3=x3;    s.s3='AM4g10r8';
z4=z3-z2; s.s4='AM4g10r8-AM4g10r3';
cmin=-20; cmax=20; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetradtoa'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(aref0.v0.toa.netrad.avg_sea(k,:,:),1)); 
y1=squeeze(mean(aref0.w0.toa.netrad.avg_sea(k,:,:),1)); 
x2=squeeze(mean(am4g6.v0.toa.netrad.avg_sea(k,:,:),1)); 
y2=squeeze(mean(am4g6.w0.toa.netrad.avg_sea(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.netrad.avg_sea(k,:,:),1)); 
y3=squeeze(mean(am4g9.w0.toa.netrad.avg_sea(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.toa.netrad.avg_sea(k,:,:),1)); 
y4=squeeze(mean(am4gA.w0.toa.netrad.avg_sea(k,:,:),1));   s.s4='AM4gA0';
x5=squeeze(mean(am4gA1.v0.toa.netrad.avg_sea(k,:,:),1)); 
y5=squeeze(mean(am4gA1.w0.toa.netrad.avg_sea(k,:,:),1)); s.s4='AM4gA1';
%x5=squeeze(mean(am4gA2.v0.toa.netrad.avg_sea(k,:,:),1)); 
%y5=squeeze(mean(am4gA2.w0.toa.netrad.avg_sea(k,:,:),1)); s.s4='AM4gA2';
z1=(y1-x1)/2; s.s1='AREF0';
z2=(y2-x2)/2; s.s2='AM4g6';
z3=(y3-x3)/2; s.s3='AM4g9';
z4=(y4-x4)/2; s.s4='AM4g10r3'; 
z5=(y5-x5)/2; s.s5='AM4g10r8'; 
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z3,z4,z5,z5-z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dttcf'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(aref0.v0.toa.ttcf.avg_sea(k,:,:),1)); 
y1=squeeze(mean(aref0.w0.toa.ttcf.avg_sea(k,:,:),1)); 
x2=squeeze(mean(am4g6.v0.toa.ttcf.avg_sea(k,:,:),1)); 
y2=squeeze(mean(am4g6.w0.toa.ttcf.avg_sea(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.ttcf.avg_sea(k,:,:),1)); 
y3=squeeze(mean(am4g9.w0.toa.ttcf.avg_sea(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.toa.ttcf.avg_sea(k,:,:),1)); 
y4=squeeze(mean(am4gA.w0.toa.ttcf.avg_sea(k,:,:),1));   s.s4='AM4gA0';
%x5=squeeze(mean(am4gA1.v0.toa.ttcf.avg_sea(k,:,:),1)); 
%y5=squeeze(mean(am4gA1.w0.toa.ttcf.avg_sea(k,:,:),1)); s.s4='AM4gA1';
x5=squeeze(mean(am4gA2.v0.toa.ttcf.avg_sea(k,:,:),1)); 
y5=squeeze(mean(am4gA2.w0.toa.ttcf.avg_sea(k,:,:),1)); s.s4='AM4gA2';
z1=(y1-x1)/2; s.s1='AREF0';
z2=(y2-x2)/2; s.s2='AM4g6';
z3=(y3-x3)/2; s.s3='AM4g9';
z4=(y4-x4)/2; s.s4='AM4g10r3'; 
z5=(y5-x5)/2; s.s5='AM4g10r8'; 
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g10'; f=1; 
s.s1='AM4g9'; s.s2='AM4g10r3'; s.s3='AM4g10r8'; 
s.s4='AM4g10r8 minus AM4g10r3';
plot_4panel_cm4(s,z3,z4,z5,z5-z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dswcf'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(aref0.v0.toa.swcf.avg_sea(k,:,:),1)); 
y1=squeeze(mean(aref0.w0.toa.swcf.avg_sea(k,:,:),1)); 
x2=squeeze(mean(am4g6.v0.toa.swcf.avg_sea(k,:,:),1)); 
y2=squeeze(mean(am4g6.w0.toa.swcf.avg_sea(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.swcf.avg_sea(k,:,:),1)); 
y3=squeeze(mean(am4g9.w0.toa.swcf.avg_sea(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.toa.swcf.avg_sea(k,:,:),1)); 
y4=squeeze(mean(am4gA.w0.toa.swcf.avg_sea(k,:,:),1));   s.s4='AM4gA0';
%x5=squeeze(mean(am4gA1.v0.toa.swcf.avg_sea(k,:,:),1)); 
%y5=squeeze(mean(am4gA1.w0.toa.swcf.avg_sea(k,:,:),1)); s.s4='AM4gA1';
x5=squeeze(mean(am4gA2.v0.toa.swcf.avg_sea(k,:,:),1)); 
y5=squeeze(mean(am4gA2.w0.toa.swcf.avg_sea(k,:,:),1)); s.s4='AM4gA2';
z1=(y1-x1)/2; s.s1='AREF0';
z2=(y2-x2)/2; s.s2='AM4g6';
z3=(y3-x3)/2; s.s3='AM4g9';
z4=(y4-x4)/2; s.s4='AM4g10r3'; 
z5=(y5-x5)/2; s.s5='AM4g10r8'; 
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g10'; f=1; 
s.s1='AM4g9'; s.s2='AM4g10r3'; s.s3='AM4g10r8'; 
s.s4='AM4g10r8 minus AM4g10r3';
plot_4panel_cm4(s,z3,z4,z5,z5-z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dttcf'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(aref0.v0.toa.ttcf.avg_sea(k,:,:),1)); 
y1=squeeze(mean(aref0.w0.toa.ttcf.avg_sea(k,:,:),1)); 
x2=squeeze(mean(am4g6.v0.toa.ttcf.avg_sea(k,:,:),1)); 
y2=squeeze(mean(am4g6.w0.toa.ttcf.avg_sea(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.ttcf.avg_sea(k,:,:),1)); 
y3=squeeze(mean(am4g9.w0.toa.ttcf.avg_sea(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.toa.ttcf.avg_sea(k,:,:),1)); 
y4=squeeze(mean(am4gA.w0.toa.ttcf.avg_sea(k,:,:),1));   s.s4='AM4gA0';
x4=squeeze(mean(am4gA1.v0.toa.ttcf.avg_sea(k,:,:),1)); 
y4=squeeze(mean(am4gA1.w0.toa.ttcf.avg_sea(k,:,:),1)); s.s4='AM4gA1';
x4=squeeze(mean(am4gA2.v0.toa.ttcf.avg_sea(k,:,:),1)); 
y4=squeeze(mean(am4gA2.w0.toa.ttcf.avg_sea(k,:,:),1)); s.s4='AM4gA2';
z1=(y1-x1)/2; s.s1='AREF0';
z2=(y2-x2)/2; s.s2='AM4g6';
z3=(y3-x3)/2; s.s3='AM4g9';
z4=(y4-x4)/2; s.s4='AM4gA2-AREF0'; z4=x4-x1;
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dswcf'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(aref0.v0.toa.swcf.avg_sea(k,:,:),1)); 
y1=squeeze(mean(aref0.w0.toa.swcf.avg_sea(k,:,:),1)); 
x2=squeeze(mean(am4g6.v0.toa.swcf.avg_sea(k,:,:),1)); 
y2=squeeze(mean(am4g6.w0.toa.swcf.avg_sea(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.swcf.avg_sea(k,:,:),1)); 
y3=squeeze(mean(am4g9.w0.toa.swcf.avg_sea(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.toa.swcf.avg_sea(k,:,:),1)); 
y4=squeeze(mean(am4gA.w0.toa.swcf.avg_sea(k,:,:),1));  s.s4='AM4gA0'
%x4=squeeze(mean(am4gA1.v0.toa.swcf.avg_sea(k,:,:),1)); 
%y4=squeeze(mean(am4gA1.w0.toa.swcf.avg_sea(k,:,:),1)); s.s4='AM4gA1'
%x4=squeeze(mean(am4gA2.v0.toa.swcf.avg_sea(k,:,:),1)); 
%y4=squeeze(mean(am4gA2.w0.toa.swcf.avg_sea(k,:,:),1)); s.s4='AM4gA2'
z1=(y1-x1)/2; s.s1='AREF0';
z2=(y2-x2)/2; s.s2='AM4g6';
z3=(y3-x3)/2; s.s3='AM4g9';
z4=(y4-x4)/2; %s.s4='AM4gA'; %z4=z4-z3;
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dlwcf'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(aref0.v0.toa.lwcf.avg_sea(k,:,:),1)); 
y1=squeeze(mean(aref0.w0.toa.lwcf.avg_sea(k,:,:),1)); 
x2=squeeze(mean(am4g6.v0.toa.lwcf.avg_sea(k,:,:),1)); 
y2=squeeze(mean(am4g6.w0.toa.lwcf.avg_sea(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.lwcf.avg_sea(k,:,:),1)); 
y3=squeeze(mean(am4g9.w0.toa.lwcf.avg_sea(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.toa.lwcf.avg_sea(k,:,:),1)); 
y4=squeeze(mean(am4gA.w0.toa.lwcf.avg_sea(k,:,:),1));  s.s4='AM4gA0'
x4=squeeze(mean(am4gA1.v0.toa.lwcf.avg_sea(k,:,:),1)); 
y4=squeeze(mean(am4gA1.w0.toa.lwcf.avg_sea(k,:,:),1)); s.s4='AM4gA1'
x4=squeeze(mean(am4gA2.v0.toa.lwcf.avg_sea(k,:,:),1)); 
y4=squeeze(mean(am4gA2.w0.toa.lwcf.avg_sea(k,:,:),1)); s.s4='AM4gA2'
z1=y1-x1; s.s1='AREF0';
z2=y2-x2; s.s2='AM4g6';
z3=y3-x3; s.s3='AM4g9';
z4=y4-x4; %s.s4='AM4gA'; z4=z4-z3;
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dlwp'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(aref0.v0.atm.lwp.avg_sea(k,:,:),1)); 
y1=squeeze(mean(aref0.w0.atm.lwp.avg_sea(k,:,:),1)); 
x2=squeeze(mean(am4g6.v0.atm.lwp.avg_sea(k,:,:),1)); 
y2=squeeze(mean(am4g6.w0.atm.lwp.avg_sea(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.atm.lwp.avg_sea(k,:,:),1)); 
y3=squeeze(mean(am4g9.w0.atm.lwp.avg_sea(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.atm.lwp.avg_sea(k,:,:),1)); 
y4=squeeze(mean(am4gA.w0.atm.lwp.avg_sea(k,:,:),1)); 
%x4=squeeze(mean(am4g7.v0.atm.lwp.avg_sea(k,:,:),1)); 
%y4=squeeze(mean(am4g7.w0.atm.lwp.avg_sea(k,:,:),1)); 
z1=y1-x1; s.s1='AREF0';
z2=y2-x2; s.s2='AM4g6';
z3=y3-x3; s.s3='AM4g9';
z4=y4-x4; s.s4='AM4gA-AM4g9'; z4=z4-z3;
cmin=-0.001; cmax=0.001; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qal_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(cm4g9.v0.atm.qal.dif_clm(k,:,:),1)); 
x2=squeeze(mean(cm4g9.f0.atm.qal.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cm4g9.f1.atm.qal.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='CM4g9fastaero minus INTERIM';
z2=x2-x1; s.s2='CM4g9fullaero minus CM4g9fastaero';
z3=x3-x1; s.s3='CM4g9newaero  minus CM4g9fastaero';
z4=x3-x2; s.s4='CM4g9newaero  minus CM4g9fullaero';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tsurf_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(cm4g9.v0.sfc.tsurf.dif_clm(k,:,:),1)); 
x2=squeeze(mean(cm4g9.f0.sfc.tsurf.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cm4g9.f1.sfc.tsurf.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='CM4g9fastaero minus INTERIM';
z2=x2-x1; s.s2='CM4g9fullaero minus CM4g9fastaero';
z3=x3-x1; s.s3='CM4g9newaero  minus CM4g9fastaero';
z4=x3-x2; s.s4='CM4g9newaero  minus CM4g9fullaero';
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='sfcnetflx_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
x2=squeeze(mean(am4g9.f0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
x3=squeeze(mean(am4g9.f1.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
z1=x1;    s.s1='AM4g9fastaero minus CERES+INTERIM';
z2=x2-x1; s.s2='AM4g9fullaero minus AM4g9fastaero';
z3=x3-x1; s.s3='AM4g9newaero  minus AM4g9fastaero';
z4=x3-x2; s.s4='AM4g9newaero  minus AM4g9fullaero';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='toanetrad_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.netrad.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.f0.toa.netrad.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.f1.toa.netrad.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9fastaero minus CERES';
z2=x2-x1; s.s2='AM4g9fullaero minus AM4g9fastaero';
z3=x3-x1; s.s3='AM4g9newaero  minus AM4g9fastaero';
z4=x3-x2; s.s4='AM4g9newaero  minus AM4g9fullaero';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='toanetradclr_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.netrad_clr.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.f0.toa.netrad_clr.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.f1.toa.netrad_clr.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9fastaero minus CERES';
z2=x2-x1; s.s2='AM4g9fullaero minus AM4g9fastaero';
z3=x3-x1; s.s3='AM4g9newaero  minus AM4g9fastaero';
z4=x3-x2; s.s4='AM4g9newaero  minus AM4g9fullaero';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='toaswnetclr_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.swnet_clr.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.f0.toa.swnet_clr.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.f1.toa.swnet_clr.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9fastaero minus CERES';
z2=x2-x1; s.s2='AM4g9fullaero minus AM4g9fastaero';
z3=x3-x1; s.s3='AM4g9newaero  minus AM4g9fastaero';
z4=x3-x2; s.s4='AM4g9newaero  minus AM4g9fullaero';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='toaswcf_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.swcf.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.f0.toa.swcf.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.f1.toa.swcf.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9fastaero minus CERES';
z2=x2-x1; s.s2='AM4g9fullaero minus AM4g9fastaero';
z3=x3-x1; s.s3='AM4g9newaero  minus AM4g9fastaero';
z4=x3-x2; s.s4='AM4g9newaero  minus AM4g9fullaero';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x3=squeeze(mean(cmlg9.v0.sfc.tref.dif_clm(k,:,:),1)); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.toa.netrad.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.toa.netrad.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.netrad.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.toa.netrad.dif_clm(k,:,:),1)); 
z1=x1; s.s1='AM4g6 minus CERES';
z2=x2; s.s2='AM4g7 minus CERES';
z3=x3; s.s3='AM4g9 minus CERES';
z4=x4; s.s4='AM4gA minus CERES';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='toaswnet_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.toa.swnet.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.toa.swnet.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.swnet.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4g9.f0.toa.swnet.dif_clm(k,:,:),1)); 
x5=squeeze(mean(am4gA.v0.toa.swnet.dif_clm(k,:,:),1)); 
x6=squeeze(mean(am4gA.v1.toa.swnet.dif_clm(k,:,:),1)); 
z1=x6; s.s1='AM4g6 minus CERES';
z2=x2; s.s2='AM4g7 minus CERES';
z3=x3; s.s3='AM4g9 minus CERES';
z4=x4; s.s4='AM4g9f minus CERES';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='toalwnet_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.toa.lwnet.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.toa.lwnet.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.lwnet.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.toa.lwnet.dif_clm(k,:,:),1)); 
z1=x1; s.s1='AM4g6 minus CERES';
z2=x2; s.s2='AM4g7 minus CERES';
z3=x3; s.s3='AM4g9 minus CERES';
z4=x4; s.s4='AM4gA minus CERES';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='toaswnetclr_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.toa.swnet_clr.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.toa.swnet_clr.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.swnet_clr.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4g9.f0.toa.swnet_clr.dif_clm(k,:,:),1)); 
x5=squeeze(mean(am4gA.v0.toa.swnet_clr.dif_clm(k,:,:),1)); 
x6=squeeze(mean(am4gA.v1.toa.swnet_clr.dif_clm(k,:,:),1)); 
z1=x6; s.s1='AM4g6 minus CERES';
z2=x2; s.s2='AM4g7 minus CERES';
z3=x3; s.s3='AM4g9 minus CERES';
z4=x4; s.s4='AM4gA minus CERES';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='toalwnetclr_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.toa.lwnet_clr.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.toa.lwnet_clr.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.lwnet_clr.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.toa.lwnet_clr.dif_clm(k,:,:),1)); 
z1=x1; s.s1='AM4g6 minus CERES';
z2=x2; s.s2='AM4g7 minus CERES';
z3=x3; s.s3='AM4g9 minus CERES';
z4=x4; s.s4='AM4gA minus CERES';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netflxsfc_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
x2=squeeze(mean(am4g7.v0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
x3=squeeze(mean(am4g9.v0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
x4=squeeze(mean(am4gA.v0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
%x4=squeeze(mean(am4gB.v0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
z1=x1; s.s1='AM4g6 minus CERES+INTERIM';
z2=x2; s.s2='AM4g7 minus CERES+INTERIM';
z3=x3; s.s3='AM4g9 minus CERES+INTERIM';
z4=x4; s.s4='AM4gA minus CERES+INTERIM';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tsurf_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.sfc.tsurf.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.sfc.tsurf.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.sfc.tsurf.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.sfc.tsurf.dif_clm(k,:,:),1)); 
z1=x1;   s.s1='AM4g6 minus INTERIM';
z2=x2;   s.s2='AM4g7 minus INTERIM';
z3=x3;   s.s3='AM4g9 minus INTERIM';
z4=x4;   s.s4='AM4gA minus INTERIM';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.sfc.tref.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.sfc.tref.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.sfc.tref.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.sfc.tref.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v1.sfc.tref.dif_clm(k,:,:),1)); 
z1=x1;   s.s1='AM4g6 minus INTERIM';
z2=x2;   s.s2='AM4g7 minus INTERIM';
z3=x3;   s.s3='AM4g9 minus INTERIM';
z4=x4;   s.s4='AM4gA minus INTERIM';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rhref_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.sfc.rhref.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.sfc.rhref.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.sfc.rhref.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.sfc.rhref.dif_clm(k,:,:),1)); 
%x4=squeeze(mean(am4gA.v1.sfc.rhref.dif_clm(k,:,:),1)); 
x4=squeeze(mean(aref0.v0.sfc.rhref.dif_clm(k,:,:),1)); 
z1=x1;   s.s1='AM4g6 minus INTERIM';
z2=x2;   s.s2='AM4g7 minus INTERIM';
z3=x3;   s.s3='AM4g9 minus INTERIM';
z4=x4;   s.s4='AM4gA minus INTERIM';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t200_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.atm.t200.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.atm.t200.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.atm.t200.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.atm.t200.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v1.atm.t200.dif_clm(k,:,:),1)); 
%x4=squeeze(mean(aref0.v0.atm.t200.dif_clm(k,:,:),1)); 
z1=x1;   s.s1='AM4g6 minus INTERIM';
z2=x2;   s.s2='AM4g7 minus INTERIM';
z3=x3;   s.s3='AM4g9 minus INTERIM';
z4=x4;   s.s4='AM4gA minus INTERIM';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t300_bias'; k=5; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.atm.t300.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.atm.t300.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.atm.t300.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.atm.t300.dif_clm(k,:,:),1)); 
z1=x1;   s.s1='AM4g6 minus INTERIM';
z2=x2;   s.s2='AM4g7 minus INTERIM';
z3=x3;   s.s3='AM4g9 minus INTERIM';
z4=x4;   s.s4='AM4gA minus INTERIM';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prec_tt_bias'; k=5; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.sfc.prec_tt.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.sfc.prec_tt.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.sfc.prec_tt.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.sfc.prec_tt.dif_clm(k,:,:),1)); 
x4=squeeze(mean(aref0.v0.sfc.prec_tt.dif_clm(k,:,:),1)); 
z1=x1;   s.s1='AM4g6 minus INTERIM';
z2=x2;   s.s2='AM4g7 minus INTERIM';
z3=x3;   s.s3='AM4g9 minus INTERIM';
z4=x4;   s.s4='AM4gA minus INTERIM';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh200_bias'; k=5; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.atm.rh200.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.atm.rh200.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.atm.rh200.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.atm.rh200.dif_clm(k,:,:),1)); 
x4=squeeze(mean(aref0.v0.atm.rh200.dif_clm(k,:,:),1)); 
z1=x1;   s.s1='AM4g6 minus INTERIM';
z2=x2;   s.s2='AM4g7 minus INTERIM';
z3=x3;   s.s3='AM4g9 minus INTERIM';
z4=x4;   s.s4='AM4gA minus INTERIM';
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh300_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.atm.rh300.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.atm.rh300.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.atm.rh300.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.atm.rh300.dif_clm(k,:,:),1)); 
x4=squeeze(mean(aref0.v0.atm.rh300.dif_clm(k,:,:),1)); 
z1=x1;   s.s1='AM4g6 minus INTERIM';
z2=x2;   s.s2='AM4g7 minus INTERIM';
z3=x3;   s.s3='AM4g9 minus INTERIM';
z4=x4;   s.s4='AM4gA minus INTERIM';
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh850_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.atm.rh850.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.atm.rh850.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.atm.rh850.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.atm.rh850.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v1.atm.rh850.dif_clm(k,:,:),1)); 
%x4=squeeze(mean(aref0.v0.atm.rh850.dif_clm(k,:,:),1)); 
z1=x1;   s.s1='AM4g6 minus INTERIM';
z2=x2;   s.s2='AM4g7 minus INTERIM';
z3=x3;   s.s3='AM4g9 minus INTERIM';
z4=x4;   s.s4='AM4gA minus INTERIM';
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t300_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.atm.t300.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.atm.t300.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.atm.t300.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.atm.t300.dif_clm(k,:,:),1)); 
z1=x1;   s.s1='AM4g6 minus INTERIM';
z2=x2;   s.s2='AM4g7 minus INTERIM';
z3=x3;   s.s3='AM4g9 minus INTERIM';
z4=x4;   s.s4='AM4gA minus INTERIM';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(cmlg6.v0.sfc.tref.dif_clm(k,:,:),1)); 
x2=squeeze(mean(cmlg7.v0.sfc.tref.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.sfc.tref.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlgA.v0.sfc.tref.dif_clm(k,:,:),1)); 
z1=x1;   s.s1='CMLg6 minus INTERIM';
z2=x2;   s.s2='CMLg7 minus AM4g6';
z3=x3;   s.s3='CMLg9 minus AM4g6';
z4=x4;   s.s4='CMLgA minus AM4g6';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%













%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.toa.swnet.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.toa.swnet.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.swnet.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.toa.swnet.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gB.v0.toa.swnet.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g6 minus CERES';
z2=x2-x1; s.s2='AM4g7 minus AM4g6';
z3=x3-x1; s.s3='AM4g9 minus AM4g6';
z4=x4; s.s4='AM4gA minus AM4g6';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.toa.lwnet.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.toa.lwnet.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.lwnet.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.toa.lwnet.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gB.v0.toa.lwnet.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g6 minus CERES';
z2=x2-x1; s.s2='AM4g7 minus AM4g6';
z3=x3-x1; s.s3='AM4g9 minus AM4g6';
z4=x4; s.s4='AM4gA minus AM4g6';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnetclr_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.toa.swnet_clr.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.toa.swnet_clr.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.swnet_clr.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.toa.swnet_clr.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gB.v0.toa.swnet_clr.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g6 minus CERES';
z2=x2-x1; s.s2='AM4g7 minus AM4g6';
z3=x3-x1; s.s3='AM4g9 minus AM4g6';
z4=x4; s.s4='AM4gA minus AM4g6';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.toa.lwnet.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.toa.lwnet.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.lwnet.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.toa.lwnet.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gB.v0.toa.lwnet.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g6 minus CERES';
z2=x2-x1; s.s2='AM4g7 minus AM4g6';
z3=x3-x1; s.s3='AM4g9 minus AM4g6';
z4=x4; s.s4='AM4gA minus AM4g6';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoaclr_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.toa.netrad_clr.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.toa.netrad_clr.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.netrad_clr.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.toa.netrad_clr.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g6 minus CERES';
z2=x2-x1; s.s2='AM4g7 minus AM4g6';
z3=x3-x1; s.s3='AM4g9 minus AM4g6';
z4=x4-x1; s.s4='AM4gA minus AM4g6';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnetclr_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.toa.swnet_clr.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.toa.swnet_clr.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.swnet_clr.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.toa.swnet_clr.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g6 minus CERES';
z2=x2-x1; s.s2='AM4g7 minus AM4g6';
z3=x3-x1; s.s3='AM4g9 minus AM4g6';
z4=x4-x1; s.s4='AM4gA minus AM4g6';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='albedo_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.sfc.albedo.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g7.v0.sfc.albedo.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.sfc.albedo.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.sfc.albedo.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g6 minus CERES';
z2=x2-x1; s.s2='AM4g7 minus AM4g6';
z3=x3-x1; s.s3='AM4g9 minus AM4g6';
z4=x4-x1; s.s4='AM4gA minus AM4g6';
cmin=-0.05; cmax=0.05; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%fullaerosol
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.tref.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.f0.sfc.tref.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cm4g9.v0.sfc.tref.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cm4g9.f0.sfc.tref.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='CM4g9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9fullaero minus AM4g9';
z4=x4-x3; s.s4='CM4g9fullaero minus CM4g9';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/50:cmax]; 
fpath='./fig_cml/'; expn='cm4g9'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='energy_flux'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.netrad.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4gA.v0.toa.netrad.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.netrad_clr.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v0.toa.netrad_clr.dif_clm(k,:,:),1)); 
x5=squeeze(mean(am4g9.v0.sfc.netrad.dif_clm(k,:,:),1)); 
x6=squeeze(mean(am4gA.v0.sfc.netrad.dif_clm(k,:,:),1)); 
x7=squeeze(mean(am4g9.v0.sfc.netflx.dif_clm(k,:,:),1)); 
x8=squeeze(mean(am4gA.v0.sfc.netflx.dif_clm(k,:,:),1)); 
z1=x2-x1; s.s1='TOA net radiative flux (am4g9fullaero minus am4g9)';
z2=x4-x3; s.s2='TOA clearsky net radiative flux (am4g9fullaero minus am4g9)';
z3=x6-x5; s.s3='SFC net radiative flux (am4g9fullaero minus am4g9)';
z4=x8-x7; s.s4='SFC net energy flux (am4g9fullaero minus am4g9)';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='energy_flux'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.netrad.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4gA.v1.toa.netrad.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.netrad_clr.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.v1.toa.netrad_clr.dif_clm(k,:,:),1)); 
x5=squeeze(mean(am4g9.v0.sfc.netrad.dif_clm(k,:,:),1)); 
x6=squeeze(mean(am4gA.v1.sfc.netrad.dif_clm(k,:,:),1)); 
x7=squeeze(mean(am4g9.v0.sfc.netflx.dif_clm(k,:,:),1)); 
x8=squeeze(mean(am4gA.v1.sfc.netflx.dif_clm(k,:,:),1)); 
z1=x2-x1; s.s1='TOA net radiative flux (am4g9fullaero minus am4g9)';
z2=x4-x3; s.s2='TOA clearsky net radiative flux (am4g9fullaero minus am4g9)';
z3=x6-x5; s.s3='SFC net radiative flux (am4g9fullaero minus am4g9)';
z4=x8-x7; s.s4='SFC net energy flux (am4g9fullaero minus am4g9)';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='energy_flux'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.netrad.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.f0.toa.netrad.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.toa.netrad_clr.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4g9.f0.toa.netrad_clr.dif_clm(k,:,:),1)); 
x5=squeeze(mean(am4g9.v0.sfc.netrad.dif_clm(k,:,:),1)); 
x6=squeeze(mean(am4g9.f0.sfc.netrad.dif_clm(k,:,:),1)); 
x7=squeeze(mean(am4g9.v0.sfc.netflx.dif_clm(k,:,:),1)); 
x8=squeeze(mean(am4g9.f0.sfc.netflx.dif_clm(k,:,:),1)); 
z1=x2-x1; s.s1='TOA net radiative flux (W/m2;am4g9fullaero minus am4g9)';
z2=x4-x3; s.s2='TOA clearsky net radiative flux (W/m2;am4g9fullaero minus am4g9)';
z3=x6-x5; s.s3='SFC net radiative flux (W/m2;am4g9fullaero minus am4g9)';
z4=x8-x7; s.s4='SFC net energy flux (W/m2;am4g9fullaero minus am4g9)';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g9'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netflx_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.netflx.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.f0.sfc.netflx.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cm4g9.v0.sfc.netflx.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cm4g9.f0.sfc.netflx.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='CM4g9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9fullaero minus AM4g9';
z4=x4-x3; s.s4='CM4g9fullaero minus CM4g9';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netrad_bias'; k=1; k1=1; k2=24; f=1; s=am4g9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.netrad.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.f0.sfc.netrad.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cm4g9.v0.sfc.netrad.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cm4g9.f0.sfc.netrad.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='CM4g9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9fullaero minus AM4g9';
z4=x4-x3; s.s4='CM4g9fullaero minus CM4g9';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netflxsfc_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(cm4g9.v0.sfc.tref.dif_clm (k,:,:),1)); 
x2=squeeze(mean(cm4g9f.v0.sfc.tref.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9.v0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
x4=squeeze(mean(am4g9f.v0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
z1=x1;    s.s1='CM4g9 minus INTERIM';
z2=x3;    s.s2='AM4g9 minus CERES+INTERIM';
z3=x2-x1; s.s3='Cm4g9fullaero minus CM4g9';
z4=x4-x3; s.s4='AM4g9fullaero minus AM4g9';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='cm4g9fullaero'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netflxsfc_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
x2=squeeze(mean(cm4g9.v0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
x3=squeeze(mean(am4g9f.v0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
x4=squeeze(mean(cm4g9f.v0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='CM4g9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9fullaero minus AM4g9';
z4=x4-x3; s.s4='CM4g9fullaero minus CM4g9';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='cm4g9fullaero'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_ann_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.tref.dif_clm (k,:,:),1)); 
x2=squeeze(mean(cm4g9.v0.sfc.tref.dif_clm (k,:,:),1)); 
x3=squeeze(mean(am4g9f.v0.sfc.tref.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cm4g9f.v0.sfc.tref.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x2;    s.s2='CM4g9 minus INTERIM';
z3=x3-x1; s.s3='AM4g9fullaero minus AM4g9';
z4=x4-x2; s.s4='CM4g9fullaero minus CM4g9';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='cm4g9fullaero'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.netrad.dif_clm(k,:,:),1)); 
x2=squeeze(mean(cm4g9.v0.toa.netrad.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g9f.v0.toa.netrad.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cm4g9f.v0.toa.netrad.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='CM4g9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9fullaero minus AM4g9';
z4=x4-x3; s.s4='CM4g9fullaero minus CM4g9';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='cm4g9fullaero'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netflxsfc_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
x2=squeeze(mean(cm4g9.v0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
x3=squeeze(mean(am4g9f.v0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
x4=squeeze(mean(cm4g9f.v0.sfc.netflx.dif_clm(k,:,:),1))+7.5; 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='CM4g9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9fullaero minus AM4g9';
z4=x4-x3; s.s4='CM4g9fullaero minus CM4g9';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='cm4g9fullaero'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y1=cmlg6.v0.sfc.tsurf.ann.mmen.all;  %y1_avg=mean(y1); 
y2=cmlg7.v0.sfc.tsurf.ann.mmen.all;  %y2_avg=mean(y2); 
y3=cmlg9.v0.sfc.tsurf.ann.mmen.all;  %y3_avg=mean(y3); 
y4=cmlg10.v0.sfc.tsurf.ann.mmen.all; %y3_avg=mean(y3); 
pms=[ 0, 0, 1200, 800]*0.8; fsize=20; x=[2.5:5:80];
handle=figure('Position',pms,'visible','on'); lw=2;
x1=[1:28]*5; x2=[1:23]*5; x3=[1:28]*5; x4=[1:22]*5;
plot(x1,y1,'b','LineWidth',lw); hold on; 
plot(x2,y2,'g','LineWidth',lw);
plot(x3,y3,'r','LineWidth',lw); 
plot(x4,y4,'k','LineWidth',lw); 
set(gca,'FontSize',fsize); axis([0 140 13.2 14.5]); 
xlabel('year','FontSize',fsize); ylabel('surface air temperature (K)');
legend('AM4OM2F-g6 (2000CNTL)','AM4OM2F-g7 (2000CNTL)','AM4OM2F-g9 (2000CNTL)',4);
visfig='off'; figpath='./fig_cml/'; expn='am4om2f-g9'; vname='sfc-tref-mmen';
printit(visfig,figpath,expn,vname);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_ann_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.tref.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4gA.v0.sfc.tref.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.sfc.tref.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlgA.v0.sfc.tref.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2; s.s3='AM4g10 minus AM4g9';
z4=x4; s.s4='AM4OM2Fg10 minus AM4OM2Fg9';
cmin=-3.5; cmax=3.5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netflxsfc_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.netflx.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4gA.v0.sfc.netflx.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.f0.sfc.netflx.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.sfc.netflx.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlgA.v0.sfc.netflx.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4gA minus AM4g9';
z4=x4-x3; s.s4='AM4OM2FgA minus AM4OM2Fg9';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradsfc_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.netrad.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4gA.v0.sfc.netrad.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.sfc.netrad.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlgA.v0.sfc.netrad.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4gA minus AM4g9';
z4=x4-x3; s.s4='AM4OM2FgA minus AM4OM2Fg9';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4gA'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netshflx_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.shflx.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4gA.v0.sfc.shflx.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.sfc.shflx.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlgA.v0.sfc.shflx.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4gA minus AM4g9';
z4=x4-x3; s.s4='AM4OM2FgA minus AM4OM2Fg9';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netevap_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.evap.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4gA.v0.sfc.evap.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.sfc.evap.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlgA.v0.sfc.evap.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4gA minus AM4g9';
z4=x4-x3; s.s4='AM4OM2FgA minus AM4OM2Fg9';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t850_ann_bias'; k=1; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.t850.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4gA.v0.atm.t850.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.atm.t850.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlgA.v0.atm.t850.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4gA minus AM4g9';
z4=x4-x3; s.s4='AM4OM2FgA minus AM4OM2Fg9';
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4gA'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lhflx_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.evap.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4gA.v0.sfc.evap.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.sfc.evap.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlgA.v0.sfc.evap.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4gA minus AM4g9';
z4=x4-x3; s.s4='AM4OM2FgA minus AM4OM2Fg9';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wref_ann_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.wref.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4gA.v0.sfc.wref.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.sfc.wref.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlgA.v0.sfc.wref.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4gA minus AM4g9';
z4=x4-x3; s.s4='AM4OM2FgA minus AM4OM2Fg9';
cmin=-0.5; cmax=0.5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='uref_ann_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.uref.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4gA.v0.sfc.uref.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.sfc.uref.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlgA.v0.sfc.uref.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4gA minus AM4g9';
z4=x4-x3; s.s4='AM4OM2FgA minus AM4OM2Fg9';
cmin=-0.5; cmax=0.5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rhref_ann_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.rhref.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4gA.v0.sfc.rhref.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.sfc.rhref.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlgA.v0.sfc.rhref.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4gA minus AM4g9';
z4=x4-x3; s.s4='AM4OM2FgA minus AM4OM2Fg9';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_bias'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.netrad.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4gA.v0.toa.netrad.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.toa.netrad.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlgA.v0.toa.netrad.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4gA minus AM4g9';
z4=x4-x3; s.s4='AM4OM2FgA minus AM4OM2Fg9';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%
y1=cmlg6.v0.sfc.tref.ts.org_ann;  y1_avg=mean(y1); 
y2=cmlg7.v0.sfc.tref.ts.org_ann;  y2_avg=mean(y2); 
y3=cmlg9.v0.sfc.tref.ts.org_ann;  y3_avg=mean(y3); 
y4=cmlg9.v1.sfc.tref.ts.org_ann;  y3_avg=mean(y4); 
pms=[ 0, 0, 1200, 800]*0.8; fsize=20; x=[2.5:5:80];
handle=figure('Position',pms,'visible','on'); lw=2;
x1=[1:115]; x2=[1:115]; x3=[1:120]; x4=[1:120];
plot(x1,y1,'b','LineWidth',lw); hold on; 
plot(x2,y2,'g','LineWidth',lw);
plot(x3,y3,'r','LineWidth',lw); 
plot(x4,y4,'k','LineWidth',lw); 
set(gca,'FontSize',fsize); axis([0 140 13 14.5]); 
xlabel('year','FontSize',fsize); ylabel('surface air temperature (K)');
legend('AM4OM2F-g6 (2000CNTL)','AM4OM2F-g7 (2000CNTL)',...
       'AM4OM2F-g9 (2000CNTL)','AM4OM2F-g9-newtopo (2000CNTL)',4);
visfig='off'; figpath='./fig_cml/'; expn='am4om2f-g9'; vname='tref-mmen';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4g9.v0.s; a0=mean(s.aa,2); a0=a0';
vname='sthflx_djf_lat'; k=5; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.shflx.avg_sea(k,:,:),3)); 
x2=squeeze(mean(am4g9.v1.sfc.shflx.avg_sea(k,:,:),3)); 
x3=squeeze(mean(cmlg9.v0.sfc.shflx.avg_sea(k,:,:),3)); 
x4=squeeze(mean(cmlg9.v1.sfc.shflx.avg_sea(k,:,:),3)); 
x5=squeeze(mean(o.sfc.shflx.sea(k,:,:),3)); 
y1=squeeze(mean(am4g9.v0.sfc.evap.avg_sea(k,:,:),3)); 
y2=squeeze(mean(am4g9.v1.sfc.evap.avg_sea(k,:,:),3)); 
y3=squeeze(mean(cmlg9.v0.sfc.evap.avg_sea(k,:,:),3)); 
y4=squeeze(mean(cmlg9.v1.sfc.evap.avg_sea(k,:,:),3)); 
y5=squeeze(mean(o.sfc.evap.sea (k,:,:),3));
z1=x1+y1; s.s1='AM4g9';
z2=x2+y2; s.s2='AM4g9-topo';
z3=x3+y3; s.s3='AM4OM2Fg9';
z4=x4+y4; s.s4='AM4OM2Fg9-topo';
%z5=x5+y5; s.s5='INTERIM';
pms=[ 0, 0, 1200, 800]*0.8; fsize=20;
handle=figure('Position',pms,'visible','on'); lw=2;
plot(s.lat,z1,'r','LineWidth',lw); hold on; 
plot(s.lat,z2,'g','LineWidth',lw); grid on;
plot(s.lat,z3,'b','LineWidth',lw); grid on;
plot(s.lat,z4,'k','LineWidth',lw); grid on;
%plot(s.lat,z5,'c','LineWidth',lw); grid on;
set(gca,'FontSize',fsize); axis([-90 90 -30 180]); 
xlabel('latitude','FontSize',fsize); 
ylabel('surface sensible+latent heat flux (W/m2)');
legend(s.s1,s.s2,s.s3,s.s4,1);
visfig='off'; figpath='./fig_cml/'; expn='AM4g9topo'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4g9.v0.s; a0=mean(s.aa,2); a0=a0';
vname='diff_sthflx_djf_lat'; k=5; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.shflx.avg_sea(k,:,:),3)); 
x2=squeeze(mean(am4g9.v1.sfc.shflx.avg_sea(k,:,:),3)); 
x3=squeeze(mean(cmlg9.v0.sfc.shflx.avg_sea(k,:,:),3)); 
x4=squeeze(mean(cmlg9.v1.sfc.shflx.avg_sea(k,:,:),3)); 
y1=squeeze(mean(am4g9.v0.sfc.evap.avg_sea(k,:,:),3)); 
y2=squeeze(mean(am4g9.v1.sfc.evap.avg_sea(k,:,:),3)); 
y3=squeeze(mean(cmlg9.v0.sfc.evap.avg_sea(k,:,:),3)); 
y4=squeeze(mean(cmlg9.v1.sfc.evap.avg_sea(k,:,:),3)); 
z1=x1+y1; s.s1='AM4g9';
z2=x2+y2; s.s2='AM4g9-topo';
z3=x3+y3; s.s3='AM4OM2Fg9';
z4=x4+y4; s.s4='AM4OM2Fg9-topo';
pms=[ 0, 0, 1200, 800]*0.8; fsize=20;
handle=figure('Position',pms,'visible','on'); lw=2;
plot(s.lat,z2-z1,'r','LineWidth',lw); hold on; 
plot(s.lat,z4-z3,'b','LineWidth',lw); grid on;
set(gca,'FontSize',fsize); axis([-90 90 -7 7]); 
xlabel('latitude','FontSize',fsize); 
ylabel('difference in surface sensible+latent heat flux (W/m2)');
legend('AM4g9-topo minus AM4g9','AM4OM2Fg9-topo minus AM4OM2Fg9',2);
visfig='off'; figpath='./fig_cml/'; expn='AM4g9topo'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4g9.v0.s; a0=mean(s.aa,2); a0=a0';
vname='netradatm_djf_lat'; k=5; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.netrad.avg_sea(k,:,:),3)); 
x2=squeeze(mean(am4g9.v1.atm.netrad.avg_sea(k,:,:),3)); 
x3=squeeze(mean(cmlg9.v0.atm.netrad.avg_sea(k,:,:),3)); 
x4=squeeze(mean(cmlg9.v1.atm.netrad.avg_sea(k,:,:),3)); 
x5=squeeze(mean(o.atm.netrad.sea(k,:,:),3)); 
z1=x1; s.s1='AM4g9';
z2=x2; s.s2='AM4g9-topo';
z3=x3; s.s3='AM4OM2Fg9';
z4=x4; s.s4='AM4OM2Fg9-topo';
%z5=x5; s.s5='CERES';
pms=[ 0, 0, 1200, 800]*0.8; fsize=20;
handle=figure('Position',pms,'visible','on'); lw=2;
plot(s.lat,z1,'r','LineWidth',lw); hold on; 
plot(s.lat,z2,'g','LineWidth',lw); grid on;
plot(s.lat,z3,'b','LineWidth',lw); grid on;
plot(s.lat,z4,'k','LineWidth',lw); grid on;
%plot(s.lat,z5,'c','LineWidth',lw); grid on;
set(gca,'FontSize',fsize); axis([-90 90 -140 -50]); 
xlabel('latitude','FontSize',fsize); 
ylabel('atmospheric radiatve heating rate (W/m2)');
legend(s.s1,s.s2,s.s3,s.s4,1);
visfig='off'; figpath='./fig_cml/'; expn='AM4g9topo'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4g9.v0.s; a0=mean(s.aa,2); a0=a0';
vname='diff_netradatm_djf_lat'; k=5; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.netrad.avg_sea(k,:,:),3)); 
x2=squeeze(mean(am4g9.v1.atm.netrad.avg_sea(k,:,:),3)); 
x3=squeeze(mean(cmlg9.v0.atm.netrad.avg_sea(k,:,:),3)); 
x4=squeeze(mean(cmlg9.v1.atm.netrad.avg_sea(k,:,:),3)); 
x5=squeeze(mean(o.atm.netrad.sea(k,:,:),3)); 
z1=x1; s.s1='AM4g9';
z2=x2; s.s2='AM4g9-topo';
z3=x3; s.s3='AM4OM2Fg9';
z4=x4; s.s4='AM4OM2Fg9-topo';
pms=[ 0, 0, 1200, 800]*0.8; fsize=20;
handle=figure('Position',pms,'visible','on'); lw=2;
plot(s.lat,z2-z1,'r','LineWidth',lw); hold on; 
plot(s.lat,z4-z3,'g','LineWidth',lw); grid on;
set(gca,'FontSize',fsize); axis([-90 90 -7 7]); 
xlabel('latitude','FontSize',fsize); 
ylabel('difference in atmospheric radiatve heating rate (W/m2)');
legend('AM4g9-topo minus AM4g9','AM4OM2Fg9-topo minus AM4OM2Fg9',2);
visfig='off'; figpath='./fig_cml/'; expn='AM4g9topo'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a0=mean(s.aa,2); a0=a0';
vname='etransport_djf_lat'; k=5; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.netrad.avg_sea(k,:,:),3)); 
x2=squeeze(mean(am4g9.v1.toa.netrad.avg_sea(k,:,:),3)); 
x3=squeeze(mean(cmlg9.v0.toa.netrad.avg_sea(k,:,:),3)); 
x4=squeeze(mean(cmlg9.v1.toa.netrad.avg_sea(k,:,:),3)); 
y1=squeeze(mean(am4g9.v0.sfc.netflx.avg_sea(k,:,:),3)); 
y2=squeeze(mean(am4g9.v1.sfc.netflx.avg_sea(k,:,:),3)); 
y3=squeeze(mean(cmlg9.v0.sfc.netflx.avg_sea(k,:,:),3)); 
y4=squeeze(mean(cmlg9.v1.sfc.netflx.avg_sea(k,:,:),3)); 
z1=y1-x1; s.s1='AM4g9';
z2=y2-x2; s.s2='AM4g9-topo';
z3=y3-x3; s.s3='AM4OM2Fg9';
z4=y4-x4; s.s4='AM4OM2Fg9-topo';
pms=[ 0, 0, 1200, 800]*0.8; fsize=20;
handle=figure('Position',pms,'visible','on'); lw=2;
plot(s.lat,z1,'r','LineWidth',lw); hold on; 
plot(s.lat,z2,'g','LineWidth',lw); grid on;
plot(s.lat,z3,'b','LineWidth',lw); grid on;
plot(s.lat,z4,'k','LineWidth',lw); grid on;
set(gca,'FontSize',fsize); axis([-90 90 -100 150]); 
xlabel('latitude','FontSize',fsize); 
ylabel('atmospheric energy transport (W/m2)');
legend(s.s1,s.s2,s.s3,s.s4,4);
visfig='off'; figpath='./fig_cml/'; expn='AM4g9topo'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4g9.v0.s; a0=mean(s.aa,2); a0=a0';
vname='diff_etransport_djf_lat'; k=5; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.netrad.avg_sea(k,:,:),3)); 
x2=squeeze(mean(am4g9.v1.toa.netrad.avg_sea(k,:,:),3)); 
x3=squeeze(mean(cmlg9.v0.toa.netrad.avg_sea(k,:,:),3)); 
x4=squeeze(mean(cmlg9.v1.toa.netrad.avg_sea(k,:,:),3)); 
y1=squeeze(mean(am4g9.v0.sfc.netflx.avg_sea(k,:,:),3)); 
y2=squeeze(mean(am4g9.v1.sfc.netflx.avg_sea(k,:,:),3)); 
y3=squeeze(mean(cmlg9.v0.sfc.netflx.avg_sea(k,:,:),3)); 
y4=squeeze(mean(cmlg9.v1.sfc.netflx.avg_sea(k,:,:),3)); 
z1=y1-x1; s.s1='AM4g9';
z2=y2-x2; s.s2='AM4g9-topo';
z3=y3-x3; s.s3='AM4OM2Fg9';
z4=y4-x4; s.s4='AM4OM2Fg9-topo';
pms=[ 0, 0, 1200, 800]*0.8; fsize=20;
handle=figure('Position',pms,'visible','on'); lw=2;
plot(s.lat,z2-z1,'r','LineWidth',lw); hold on; 
plot(s.lat,z4-z3,'b','LineWidth',lw); grid on;
set(gca,'FontSize',fsize); axis([-90 90 -7 7]); 
xlabel('latitude','FontSize',fsize); 
ylabel('difference in atmospheric energy transport (W/m2)');
legend('AM4g9-topo minus AM4g9','AM4OM2Fg9-topo minus AM4OM2Fg9',3);
visfig='off'; figpath='./fig_cml/'; expn='AM4g9topo'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='u850_djf_bias'; k=5; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.u850.avg_sea(k,:,:),3)); 
x2=squeeze(mean(am4g9.v1.atm.u850.avg_sea(k,:,:),3)); 
x3=squeeze(mean(cmlg9.v0.atm.u850.avg_sea(k,:,:),3)); 
x4=squeeze(mean(cmlg9.v1.atm.u850.avg_sea(k,:,:),3)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9-topo minus AM4g9';
z4=x4-x3; s.s4='AM4OM2Fg9-topo minus AM4OM2Fg9';
pms=[ 0, 0, 1200, 800]*0.8; fsize=20;
handle=figure('Position',pms,'visible','on'); lw=2;
plot(s.lat,x1,'r','LineWidth',lw); hold on; 
plot(s.lat,x2,'g','LineWidth',lw); grid on;
plot(s.lat,z3,'b','LineWidth',lw); grid on;
plot(s.lat,z4,'k','LineWidth',lw); grid on;
set(gca,'FontSize',fsize); axis([-90 90 -100 150]); 
xlabel('latitude','FontSize',fsize); 
ylabel('atmospheric energy transport (W/m2)');
legend('AM4g9','AM4g9-topo','AM4OM2Fg6','AM4OM2Fg6-topo',2);
visfig='off'; figpath='./fig_cml/'; expn='AM4g9topo'; 
printit(visfig,figpath,expn,vname);

cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g9'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure; 
plot(s.lat,z2-z1,'r'); hold on; %plot(s.lat,z2,'g');
plot(s.lat,z4-z3,'b'); hold on; %plot(s.lat,z4,'k');

cmin=-80; cmax=80; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='AM4g9topo'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='etransport_ann'; k=1; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.netrad.avg_sea(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.toa.netrad.avg_sea(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.toa.netrad.avg_sea(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.toa.netrad.avg_sea(k,:,:),1)); 
y1=squeeze(mean(am4g9.v0.sfc.netflx.avg_sea(k,:,:),1)); 
y2=squeeze(mean(am4g9.v1.sfc.netflx.avg_sea(k,:,:),1)); 
y3=squeeze(mean(cmlg9.v0.sfc.netflx.avg_sea(k,:,:),1)); 
y4=squeeze(mean(cmlg9.v1.sfc.netflx.avg_sea(k,:,:),1)); 
z1=y1-x1; s.s1='AM4g9';
z2=y2-x2; s.s2='AM4g9-topo';
z3=y3-x3; s.s3='AM4OM2Fg9';
z4=y4-x4; s.s4='AM4OM2Fg9-topo';
cmin=-80; cmax=80; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='AM4g9topo'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='etransport_djf_diff'; k=5; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.netrad.avg_sea(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.toa.netrad.avg_sea(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.toa.netrad.avg_sea(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.toa.netrad.avg_sea(k,:,:),1)); 
y1=squeeze(mean(am4g9.v0.sfc.netflx.avg_sea(k,:,:),1)); 
y2=squeeze(mean(am4g9.v1.sfc.netflx.avg_sea(k,:,:),1)); 
y3=squeeze(mean(cmlg9.v0.sfc.netflx.avg_sea(k,:,:),1)); 
y4=squeeze(mean(cmlg9.v1.sfc.netflx.avg_sea(k,:,:),1)); 
z1=y1-x1;           s.s1='AM4g9';
z2=y2-x2;           s.s2='AM4g9-topo';
z3=z2-z1;           s.s3='AM4g9-topo minus AM4g9';
z4=(y4-x4)-(y3-x3); s.s4='AM4OM2Fg9-topo minus AM4OM2Fg9';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='AM4g9topo'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='radcool_djf_diff'; k=5; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.netrad.avg_sea(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.toa.netrad.avg_sea(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.toa.netrad.avg_sea(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.toa.netrad.avg_sea(k,:,:),1)); 
y1=squeeze(mean(am4g9.v0.sfc.netrad.avg_sea(k,:,:),1)); 
y2=squeeze(mean(am4g9.v1.sfc.netrad.avg_sea(k,:,:),1)); 
y3=squeeze(mean(cmlg9.v0.sfc.netrad.avg_sea(k,:,:),1)); 
y4=squeeze(mean(cmlg9.v1.sfc.netrad.avg_sea(k,:,:),1)); 
z1=y1-x1;           s.s1='AM4g9';
z2=y2-x2;           s.s2='AM4g9-topo';
z3=z2-z1;           s.s3='AM4g9-topo minus AM4g9';
z4=(y4-x4)-(y3-x3); s.s4='AM4OM2Fg9-topo minus AM4OM2Fg9';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='AM4g9topo'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcfatm_ann_diff'; k=1; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.lwcf.avg_sea(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.toa.lwcf.avg_sea(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.toa.lwcf.avg_sea(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.toa.lwcf.avg_sea(k,:,:),1)); 
y1=squeeze(mean(am4g9.v0.sfc.lwcf.avg_sea(k,:,:),1)); 
y2=squeeze(mean(am4g9.v1.sfc.lwcf.avg_sea(k,:,:),1)); 
y3=squeeze(mean(cmlg9.v0.sfc.lwcf.avg_sea(k,:,:),1)); 
y4=squeeze(mean(cmlg9.v1.sfc.lwcf.avg_sea(k,:,:),1)); 
z1=x1-y1;           s.s1='AM4g9';
z2=x2-y2;           s.s2='AM4g9-topo';
z3=z2-z1;           s.s3='AM4g9-topo minus AM4g9';
z4=(x4-y4)-(x3-y3); s.s4='AM4OM2Fg9-topo minus AM4OM2Fg9';
cmin=-35; cmax=35; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='AM4g9topo'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcfatm_ann_diff'; k=1; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.swcf.avg_sea(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.toa.swcf.avg_sea(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.toa.swcf.avg_sea(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.toa.swcf.avg_sea(k,:,:),1)); 
y1=squeeze(mean(am4g9.v0.sfc.swcf.avg_sea(k,:,:),1)); 
y2=squeeze(mean(am4g9.v1.sfc.swcf.avg_sea(k,:,:),1)); 
y3=squeeze(mean(cmlg9.v0.sfc.swcf.avg_sea(k,:,:),1)); 
y4=squeeze(mean(cmlg9.v1.sfc.swcf.avg_sea(k,:,:),1)); 
z1=x1-y1;           s.s1='AM4g9';
z2=x2-y2;           s.s2='AM4g9-topo';
z3=z2-z1;           s.s3='AM4g9-topo minus AM4g9';
z4=(x4-y4)-(x3-y3); s.s4='AM4OM2Fg9-topo minus AM4OM2Fg9';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='AM4g9topo'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='etransport_bias'; k=1; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.netrad.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.toa.netrad.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.toa.netrad.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.toa.netrad.dif_clm(k,:,:),1)); 
y1=squeeze(mean(am4g9.v0.sfc.netflx.dif_clm(k,:,:),1)); 
y2=squeeze(mean(am4g9.v1.sfc.netflx.dif_clm(k,:,:),1)); 
y3=squeeze(mean(cmlg9.v0.sfc.netflx.dif_clm(k,:,:),1)); 
y4=squeeze(mean(cmlg9.v1.sfc.netflx.dif_clm(k,:,:),1)); 
z1=y1-x1;           s.s1='AM4g9';
z2=y2-x2;           s.s2='AM4g9topo';
z3=z2-z1;           s.s3='AM4g9topo minus AM4g9';
z4=(y4-x4)-(y3-x3); s.s4='AM4OM2Fg9topo minus AM4OM2Fg9';
cmin=-40; cmax=40; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='g9topo'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netrad_bias'; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.netrad.dif_clm(1:2,:,:),1)); s.s0='AM4g9 minus INTERIM';
x2=squeeze(mean(am4g9.v1.toa.netrad.dif_ann(1:2,:,:),1)); s.s1='AM4g9topo minus INTERIM';
x3=squeeze(mean(cmlg9.v0.toa.netrad.dif_ann(k1:k2,:,:),1)); s.s2='AM4OM2F-g9 minus INTERIM';
x4=squeeze(mean(cmlg9.v1.toa.netrad.dif_ann(k1:k2,:,:),1)); s.s3='AM4OM2F-g9top minus INTERIM';
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x2;    s.s2='AM4g9topo minus INTERIM';
z3=x2-x1; s.s3='AM4g9topo minus AM4g9';
z4=x4-x3; s.s4='AM4OM2Fg9topo minus AM4OM2Fg9';
cmin=-20; cmax=20; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='g9topo'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


vname='tref_djf_bias'; k=5; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.sfc.tref.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.sfc.tref.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.sfc.tref.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.sfc.tref.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9-topo minus AM4g9';
z4=x4-x3; s.s4='AM4OM2Fg9-topo minus AM4OM2Fg9';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g9'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t850_djf_bias'; k=5; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.t850.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.atm.t850.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.atm.t850.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.atm.t850.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9-topo minus AM4g9';
z4=x4-x3; s.s4='AM4OM2Fg9-topo minus AM4OM2Fg9';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g9'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t700_djf_bias'; k=5; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.t700.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.atm.t700.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.atm.t700.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.atm.t700.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9-topo minus AM4g9';
z4=x4-x3; s.s4='AM4OM2Fg9-topo minus AM4OM2Fg9';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g9'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t500_djf_bias'; k=5; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.t500.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.atm.t500.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.atm.t500.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.atm.t500.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9-topo minus AM4g9';
z4=x4-x3; s.s4='AM4OM2Fg9-topo minus AM4OM2Fg9';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g9'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t300_djf_bias'; k=5; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.t300.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.atm.t300.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.atm.t300.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.atm.t300.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9-topo minus AM4g9';
z4=x4-x3; s.s4='AM4OM2Fg9-topo minus AM4OM2Fg9';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g9'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t200_djf_bias'; k=1; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.t200.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.atm.t200.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.atm.t200.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.atm.t200.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9-topo minus AM4g9';
z4=x4-x3; s.s4='AM4OM2Fg9-topo minus AM4OM2Fg9';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g9'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='u850_djf_bias'; k=5; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.u850.avg_sea(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.atm.u850.avg_sea(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.atm.u850.avg_sea(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.atm.u850.avg_sea(k,:,:),1)); 
z1=x1;    s.s1='AM4g9';
z2=x3;    s.s2='AM4OM2Fg9';
z3=x2-x1; s.s3='AM4g9-topo minus AM4g9';
z4=x4-x3; s.s4='AM4OM2Fg9-topo minus AM4OM2Fg9';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g9'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='u850_djf_bias'; k=5; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.u850.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.atm.u850.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.atm.u850.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.atm.u850.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9';
z2=x3;    s.s2='AM4OM2Fg9';
z3=x2-x1; s.s3='AM4g9-topo minus AM4g9';
z4=x4-x3; s.s4='AM4OM2Fg9-topo minus AM4OM2Fg9';
cmin=-2.5; cmax=2.5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g9'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='z850_djf_bias'; k=5; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.z850.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.atm.z850.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.atm.z850.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.atm.z850.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9';
z2=x3;    s.s2='AM4OM2Fg9';
z3=x2-x1; s.s3='AM4g9-topo minus AM4g9';
z4=x4-x3; s.s4='AM4OM2Fg9-topo minus AM4OM2Fg9';
cmin=-2.5; cmax=2.5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g9'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='u700_djf_bias'; k=5; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.u700.avg_sea(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.atm.u700.avg_sea(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.atm.u700.avg_sea(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.atm.u700.avg_sea(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9-topo minus AM4g9';
z4=x4-x3; s.s4='AM4OM2Fg9-topo minus AM4OM2Fg9';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g9'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t700_bias'; k=1; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.t700.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.atm.t700.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.atm.t700.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.atm.t700.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9topo minus AM4g9';
z4=x4-x3; s.s4='AM4OM2Fg9topo minus AM4OM2Fg9';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='g9topp'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t500_bias'; k=1; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.t500.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.atm.t500.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.atm.t500.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.atm.t500.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9topo minus AM4g9';
z4=x4-x3; s.s4='AM4OM2Fg9topo minus AM4OM2Fg9';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='g9topp'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t300_bias'; k=1; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.t300.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.atm.t300.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.atm.t300.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.atm.t300.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9topo minus AM4g9';
z4=x4-x3; s.s4='AM4OM2Fg9topo minus AM4OM2Fg9';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='g9topp'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t200_bias'; k=1; k1=1; k2=24; f=1; s=cmlg7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.atm.t200.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.v1.atm.t200.dif_clm(k,:,:),1)); 
x3=squeeze(mean(cmlg9.v0.atm.t200.dif_clm(k,:,:),1)); 
x4=squeeze(mean(cmlg9.v1.atm.t200.dif_clm(k,:,:),1)); 
z1=x1;    s.s1='AM4g9 minus INTERIM';
z2=x3;    s.s2='AM4OM2Fg9 minus INTERIM';
z3=x2-x1; s.s3='AM4g9topo minus AM4g9';
z4=x4-x3; s.s4='AM4OM2Fg9topo minus AM4OM2Fg9';
cmin=-4; cmax=4; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='g9topp'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_bias'; k1=1; k2=12; f=1; s=cm4g7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(cmlg6.v0.sfc.tref.dif_ann(k1:k2,:,:),1)); s.s0='AM4OM2F-g6 minus INTERIM';
x2=squeeze(mean(cmlg7.v0.sfc.tref.dif_ann(k1:k2,:,:),1)); s.s1='AM4OM2F-g7 minus INTERIM';
x3=squeeze(mean(cmlg9.v0.sfc.tref.dif_ann(k1:k2,:,:),1)); s.s2='AM4OM2F-g9 minus INTERIM';
y1=squeeze(mean(cm4g6.v0.sfc.tref.dif_ann(k1:k2,:,:),1)); s.s0='AM4OM2F-g6 minus INTERIM';
y2=squeeze(mean(cm4g7.v0.sfc.tref.dif_ann(k1:k2,:,:),1)); s.s1='AM4OM2F-g7 minus INTERIM';
z1=x2;    s.s1='AM4OM2Fg7 minus INTERIM';
z2=y2;    s.s2='CM4g7 minus INTERIM';
z3=x1-x2; s.s3='AM4OM2Fg6 minus AM4OM2Fg7';
z4=y1-y2; s.s4='CM4g6 minus CM4g7';

z5=x3-x2; s.s5='AM4OM2Fg9 minus AM4OM2Fg7';


cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='cm4g9'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,z5,vbin,cmin,cmax,vname,fpath,expn,f,0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot RFP%%%%%%%%%%%%%%%%%%%%%%%%%
[aref0.d] =compute_rfp_cess(aref0);
[am4g6.d] =compute_rfp_cess(am4g6);
[am4g7.d] =compute_rfp_cess(am4g7);
[am4g9.d] =compute_rfp_cess(am4g9);[am4g9f.d] =compute_rfp_cess(am4g9f);
[am4gA.d] =compute_rfp_cess(am4gA);
[am4gA1.d]=compute_rfp_cess(am4gA1);
[am4gA2.d]=compute_rfp_cess(am4gA2);
am2.d.swnet.rfp=[0 0 0 0];
am2.d.lwnet.rfp=[0 0 0 0]; am2=aref0;
am2.d.netradtoa.rfp=[2.17 -0.7 2.87 -3.70];
am3.d.swnet.rfp=[0 0 0 0];
am3.d.lwnet.rfp=[0 0 0 0]; am3=aref0;
am3.d.netradtoa.rfp=[0.99 -1.6  2.59 -2.99];
y=[am2.d.netradtoa.rfp;   am3.d.netradtoa.rfp; ...
   am4g6.d.netradtoa.rfp; am4g7.d.netradtoa.rfp; ...
   am4g9.d.netradtoa.rfp; am4g9f.d.netradtoa.rfp;...
   am4gA.d.netradtoa.rfp; am4gA2.d.netradtoa.rfp]; 
mytitle='NETRADTOA';
%Plot total RFP%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=18; lw=3; 
handle=figure('Position',pms,'visible','on'); 
x=[1:4]; bar(x,y'); hold on; grid on;
set(gca,'xtick',x); axis([0.5 4.5 -4 3]);
alist={'Total','Aerosol','GHG','P2K'};
set(gca,'xticklabel',alist); 
set(gca,'FontSize',fsize); title(mytitle);
ylabel('RFP (W/m2)','FontSize',fsize);
legend('AM2','AM3','AM4g6','AM4g7','AM4g9','AM4g9F',...
       'AM4g10r3','AM4g10r8',3)
visfig='off'; figpath='./fig_cm4/';  expn='AM4g10'; vname='rfp';
printit(visfig,figpath,expn,vname);
%Plot SW RFP%%%%%%%%%%%%%%%%%%%%%%%%%
y=[am2.d.swnet.rfp;   am3.d.swnet.rfp; ...
   am4g6.d.swnet.rfp; am4g7.d.swnet.rfp; ...
   am4g9.d.swnet.rfp; am4g9f.d.swnet.rfp;...
   am4gA.d.swnet.rfp; am4gA1.d.swnet.rfp;...
   am4gA2.d.swnet.rfp]; vname='SWNET';
pms=[ 0, 0, 1200, 800]*0.8; fsize=18; lw=3; 
handle=figure('Position',pms,'visible','on'); 
x=[1:4]; bar(x,y'); hold on; grid on;
set(gca,'xtick',x); axis([0.5 4.5 -4 3]);
alist={'Total','Aerosol','GHG','P2K'};
set(gca,'xticklabel',alist); 
set(gca,'FontSize',fsize); 
ylabel(vname,'FontSize',fsize); title(vname);
legend('AM2','AM3','AM4g6','AM4g7','AM4g9','AM4g9F',...
       'AM4g10','AM4g10r6','AM4g10r7',3)
visfig='off'; figpath='./fig_cm4/';  expn='AM4g10';
printit(visfig,figpath,expn,vname);
%Plot LW RFP%%%%%%%%%%%%%%%%%%%%%%%%%
y=[am2.d.lwnet.rfp;   am3.d.lwnet.rfp; ...
   am4g6.d.lwnet.rfp; am4g7.d.lwnet.rfp; ...
   am4g9.d.lwnet.rfp; am4g9f.d.lwnet.rfp;...
   am4gA.d.lwnet.rfp; am4gA1.d.lwnet.rfp;...
   am4gA2.d.lwnet.rfp]; y=-y; vname='LWNET';
pms=[ 0, 0, 1200, 800]*0.8; fsize=18; lw=3; 
handle=figure('Position',pms,'visible','on'); 
x=[1:4]; bar(x,y'); hold on; grid on;
set(gca,'xtick',x); axis([0.5 4.5 -6 6]);
alist={'Total','Aerosol','GHG','P2K'};
set(gca,'xticklabel',alist); 
set(gca,'FontSize',fsize); title(mytitle);
ylabel(vname,'FontSize',fsize); title(vname);
legend('AM2','AM3','AM4g6','AM4g7','AM4g9','AM4g9F',...
       'AM4g10','AM4g10r6','AM4g10r7',3)
visfig='off'; figpath='./fig_cm4/';  expn='AM4g10'; 
printit(visfig,figpath,expn,vname);
%Plot LW RFP%%%%%%%%%%%%%%%%%%%%%%%%%
y=[am2.d.lwcf.rfp;   am3.d.lwcf.rfp; ...
   am4g6.d.lwcf.rfp; am4g7.d.lwcf.rfp; ...
   am4g9.d.lwcf.rfp; am4g9f.d.lwcf.rfp;...
   am4gA.d.lwcf.rfp; am4gA1.d.lwcf.rfp;...
   am4gA2.d.lwcf.rfp]; vname='LWCF';
pms=[ 0, 0, 1200, 800]*0.8; fsize=18; lw=3; 
handle=figure('Position',pms,'visible','on'); 
x=[1:4]; bar(x,y'); hold on; grid on;
set(gca,'xtick',x); axis([0.5 4.5 -6 6]);
alist={'Total','Aerosol','GHG','P2K'};
set(gca,'xticklabel',alist); 
set(gca,'FontSize',fsize); title(mytitle);
ylabel(vname,'FontSize',fsize); title(vname);
legend('AM2','AM3','AM4g6','AM4g7','AM4g9','AM4g9F',...
       'AM4g10','AM4g10r6','AM4g10r7',3)
visfig='off'; figpath='./fig_cm4/';  expn='AM4g10'; 
printit(visfig,figpath,expn,vname);
%Plot SW RFP%%%%%%%%%%%%%%%%%%%%%%%%%
y=[am2.d.swcf.rfp;   am3.d.swcf.rfp; ...
   am4g6.d.swcf.rfp; am4g7.d.swcf.rfp; ...
   am4g9.d.swcf.rfp; am4g9f.d.swcf.rfp;...
   am4gA.d.swcf.rfp; am4gA1.d.swcf.rfp;...
   am4gA2.d.swcf.rfp]; vname='SWCF';
pms=[ 0, 0, 1200, 800]*0.8; fsize=18; lw=3; 
handle=figure('Position',pms,'visible','on'); 
x=[1:4]; bar(x,y'); hold on; grid on;
set(gca,'xtick',x); axis([0.5 4.5 -6 6]);
alist={'Total','Aerosol','GHG','P2K'};
set(gca,'xticklabel',alist); 
set(gca,'FontSize',fsize); title(mytitle);
ylabel(vname,'FontSize',fsize); title(vname);
legend('AM2','AM3','AM4g6','AM4g7','AM4g9','AM4g9F',...
       'AM4g10','AM4g10r6','AM4g10r7',3)
visfig='off'; figpath='./fig_cm4/';  expn='AM4g10';
printit(visfig,figpath,expn,vname);
%Plot SW RFP%%%%%%%%%%%%%%%%%%%%%%%%%
y=[am2.d.swnet_clr.rfp;   am3.d.swnet_clr.rfp; ...
   am4g6.d.swnet_clr.rfp; am4g7.d.swnet_clr.rfp; ...
   am4g9.d.swnet_clr.rfp; am4g9f.d.swnet_clr.rfp;...
   am4gA.d.swnet_clr.rfp; am4gA1.d.swnet_clr.rfp;...
   am4gA2.d.swnet_clr.rfp]; vname='SWNET_CLR';
pms=[ 0, 0, 1200, 800]*0.8; fsize=18; lw=3; 
handle=figure('Position',pms,'visible','on'); 
x=[1:4]; bar(x,y'); hold on; grid on;
set(gca,'xtick',x); axis([0.5 4.5 -6 6]);
alist={'Total','Aerosol','GHG','P2K'};
set(gca,'xticklabel',alist); 
set(gca,'FontSize',fsize); title(mytitle);
ylabel(vname,'FontSize',fsize); title(vname);
legend('AM2','AM3','AM4g6','AM4g7','AM4g9','AM4g9F',...
       'AM4g10','AM4g10r6','AM4g10r7',3)
visfig='off'; figpath='./fig_cm4/';  expn='AM4g10';
printit(visfig,figpath,expn,vname);
%Plot LW RFP%%%%%%%%%%%%%%%%%%%%%%%%%
y=[am2.d.lwnet_clr.rfp;   am3.d.lwnet_clr.rfp; ...
   am4g6.d.lwnet_clr.rfp; am4g7.d.lwnet_clr.rfp; ...
   am4g9.d.lwnet_clr.rfp; am4g9f.d.lwnet_clr.rfp;...
   am4gA.d.lwnet_clr.rfp; am4gA1.d.lwnet_clr.rfp;...
   am4gA2.d.lwnet_clr.rfp]; vname='LWNET_CLR';
pms=[ 0, 0, 1200, 800]*0.8; fsize=18; lw=3; 
handle=figure('Position',pms,'visible','on'); 
x=[1:4]; bar(x,y'); hold on; grid on;
set(gca,'xtick',x); axis([0.5 4.5 -6 6]);
alist={'Total','Aerosol','GHG','P2K'};
set(gca,'xticklabel',alist); 
set(gca,'FontSize',fsize); title(mytitle);
ylabel(vname,'FontSize',fsize); title(vname);
legend('AM2','AM3','AM4g6','AM4g7','AM4g9','AM4g9F',...
       'AM4g10','AM4g10r6','AM4g10r7',3)
visfig='off'; figpath='./fig_cm4/';  expn='AM4g10';
printit(visfig,figpath,expn,vname);



y1=cmlg6.v0.sfc.tref.ts.org_ann; y1_avg=mean(y1); 
y2=cmlg7.v0.sfc.tref.ts.org_ann; y2_avg=mean(y2); 
y3=cmlg9.v0.sfc.tref.ts.org_ann; y3_avg=mean(y3); 

y1=cmlg6.v0.sfc.tref.ann.mmen.all(1:16); y1_avg=mean(y1); 
y2=cmlg7.v0.sfc.tref.ann.mmen.all;       y2_avg=mean(y2); 
y3=cmlg9.v0.sfc.tref.ann.mmen.all;       y3_avg=mean(y3); 

z1=cmlg6.c0.toa.netrad.ann.mmen.all; z1_avg=mean(z1); %y1=y1-y1_avg;
z2=cmlg6.h0.toa.netrad.ann.mmen.all; z2_avg=mean(z2); %y2=y2-y1_avg;
z3=cmlg7.c0.toa.netrad.ann.mmen.all; z3_avg=mean(z3); %y3=y3-y3_avg;
z4=cmlg7.h0.toa.netrad.ann.mmen.all; z4_avg=mean(z4); %y4=y4-y3_avg;
w1=cmlg6.c0.sfc.netflx.ann.mmen.all; w1_avg=mean(w1); %y1=y1-y1_avg;
w2=cmlg6.h0.sfc.netflx.ann.mmen.all; w2_avg=mean(w2); %y2=y2-y1_avg;
w3=cmlg7.c0.sfc.netflx.ann.mmen.all; w3_avg=mean(w3); %y3=y3-y3_avg;
w4=cmlg7.h0.sfc.netflx.ann.mmen.all; w4_avg=mean(w4); %y4=y4-y3_avg;

%%%%%%%%%%%%%%%%%%%%%%%%%
y1=cmlg6.v0.sfc.tref.ann.mmen.all; y1_avg=mean(y1); 
y2=cmlg7.v0.sfc.tref.ann.mmen.all; y2_avg=mean(y2); 
y3=cmlg9.v0.sfc.tref.ann.mmen.all; y3_avg=mean(y3); 
pms=[ 0, 0, 1200, 800]*0.8; fsize=20; x=[2.5:5:80];
handle=figure('Position',pms,'visible','on'); lw=2;
x1=[1:28]*5; x2=[1:23]*5; x3=[1:16]*5;
plot(x1,y1,'b','LineWidth',lw); hold on; 
plot(x2,y2,'g','LineWidth',lw);
plot(x3,y3,'r','LineWidth',lw); 
set(gca,'FontSize',fsize); axis([0 140 13.2 14.5]); 
xlabel('year','FontSize',fsize); ylabel('surface air temperature (K)');
legend('AM4OM2F-g6 (2000CNTL)','AM4OM2F-g7 (2000CNTL)','AM4OM2F-g9 (2000CNTL)',4);
visfig='off'; figpath='./fig_cml/'; expn='am4om2f-g9'; vname='sfc-tref-mmen';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
y1=cmlg6.v0.toa.netrad.ann.mmen.all; y1_amp=mean(am4g6.v0.toa.netrad.ann.mmen.all);
y2=cmlg7.v0.toa.netrad.ann.mmen.all; y2_amp=mean(am4g7.v0.toa.netrad.ann.mmen.all);
y3=cmlg9.v0.toa.netrad.ann.mmen.all; y3_amp=mean(am4g9.v0.toa.netrad.ann.mmen.all);
pms=[ 0, 0, 1200, 800]*0.8; fsize=20; x=[2.5:5:80];
handle=figure('Position',pms,'visible','on'); lw=2;
x1=[1:28]*5; x2=[1:23]*5; x3=[1:16]*5;
plot(x1,y1,'b','LineWidth',lw); hold on; 
plot(x2,y2,'g','LineWidth',lw);
plot(x3,y3,'r','LineWidth',lw); 
plot(1,y1_amp,'bp','MarkerFaceColor','b','MarkerSize',fsize);
plot(1,y2_amp,'gp','MarkerFaceColor','g','MarkerSize',fsize);
plot(1,y3_amp,'rp','MarkerFaceColor','r','MarkerSize',fsize);
set(gca,'FontSize',fsize); axis([0 140 0.8 2]);
xlabel('year','FontSize',fsize); ylabel('TOA net radiative flux (W/m2)');
legend('AM4OM2F-g6 (2000CNTL)','AM4OM2F-g7 (2000CNTL)','AM4OM2F-g9 (2000CNTL)',...
       'AMIP-g6 (2000CLIMO)','AMIP-g7 (2000CLIMO)','AMIP-g9 (2000CLIMO)',1);
visfig='off'; figpath='./fig_cml/'; expn='am4om2f-g9'; vname='toa-netrad-mmen';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%
y1=cmlg6.v0.sfc.tref.ann.rmse.all; y1_amp=mean(am4g6.v0.sfc.tref.ann.rmse.all);
y2=cmlg7.v0.sfc.tref.ann.rmse.all; y2_amp=mean(am4g7.v0.sfc.tref.ann.rmse.all);
y3=cmlg9.v0.sfc.tref.ann.rmse.all; y3_amp=mean(am4g9.v0.sfc.tref.ann.rmse.all);
pms=[ 0, 0, 1200, 800]*0.8; fsize=20; x=[2.5:5:80];
handle=figure('Position',pms,'visible','on'); lw=2;
x1=[1:28]*5; x2=[1:23]*5; x3=[1:16]*5;
plot(x1,y1,'b','LineWidth',lw); hold on; 
plot(x2,y2,'g','LineWidth',lw);
plot(x3,y3,'r','LineWidth',lw); 
%plot(1,y1_amp,'bp','MarkerFaceColor','b','MarkerSize',fsize);
%plot(1,y2_amp,'gp','MarkerFaceColor','g','MarkerSize',fsize);
%plot(1,y3_amp,'rp','MarkerFaceColor','r','MarkerSize',fsize);
set(gca,'FontSize',fsize); axis([0 140 1.25 1.65]); 
xlabel('year','FontSize',fsize); ylabel('RMSE of surface air temperature (K)');
legend('AM4OM2F-g6 (2000CNTL)','AM4OM2F-g7 (2000CNTL)','AM4OM2F-g9 (2000CNTL)',1)
visfig='off'; figpath='./fig_cml/'; expn='am4om2f-g9'; vname='sfc-tref-rmse';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%
y1=cmlg6.v0.sfc.prec_tt.ann.rmse.all; y1_amp=mean(am4g6.v0.sfc.prec_tt.ann.rmse.all);
y2=cmlg7.v0.sfc.prec_tt.ann.rmse.all; y2_amp=mean(am4g7.v0.sfc.prec_tt.ann.rmse.all);
y3=cmlg9.v0.sfc.prec_tt.ann.rmse.all; y3_amp=mean(am4g9.v0.sfc.prec_tt.ann.rmse.all);
pms=[ 0, 0, 1200, 800]*0.8; fsize=20; x=[2.5:5:80];
handle=figure('Position',pms,'visible','on'); lw=2;
x1=[1:28]*5; x2=[1:23]*5; x3=[1:16]*5;
plot(x1,y1,'b','LineWidth',lw); hold on; 
plot(x2,y2,'g','LineWidth',lw);
plot(x3,y3,'r','LineWidth',lw); 
plot(1,y1_amp,'bp','MarkerFaceColor','b','MarkerSize',fsize);
plot(1,y2_amp,'gp','MarkerFaceColor','g','MarkerSize',fsize);
plot(1,y3_amp,'rp','MarkerFaceColor','r','MarkerSize',fsize);
set(gca,'FontSize',fsize); axis([0 140 0.9 1.3]); 
xlabel('year','FontSize',fsize); ylabel('RMSE of surface precipitation (mm/day)');
legend('AM4OM2F-g6 (2000CNTL)','AM4OM2F-g7 (2000CNTL)','AM4OM2F-g9 (2000CNTL)',...
       'AMIP-g6 (2000CLIMO)','AMIP-g7 (2000CLIMO)','AMIP-g9 (2000CLIMO)',4);
visfig='off'; figpath='./fig_cml/'; expn='am4om2f-g9'; vname='sfc-prec-rmse';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
y1=cmlg6.v0.toa.lwnet.ann.rmse.all; y1_amp=mean(am4g6.v0.toa.lwnet.ann.rmse.all);
y2=cmlg7.v0.toa.lwnet.ann.rmse.all; y2_amp=mean(am4g7.v0.toa.lwnet.ann.rmse.all);
y3=cmlg9.v0.toa.lwnet.ann.rmse.all; y3_amp=mean(am4g9.v0.toa.lwnet.ann.rmse.all); 
pms=[ 0, 0, 1200, 800]*0.8; fsize=20; x=[2.5:5:80];
handle=figure('Position',pms,'visible','on'); lw=2;
x1=[1:28]*5; x2=[1:23]*5; x3=[1:16]*5;
plot(x1,y1,'b','LineWidth',lw); hold on; 
plot(x2,y2,'g','LineWidth',lw);
plot(x3,y3,'r','LineWidth',lw); 
plot(1,y1_amp,'bp','MarkerFaceColor','b','MarkerSize',fsize);
plot(1,y2_amp,'gp','MarkerFaceColor','g','MarkerSize',fsize);
plot(1,y3_amp,'rp','MarkerFaceColor','r','MarkerSize',fsize);
set(gca,'FontSize',fsize); axis([0 140 5.5 9]); 
xlabel('year','FontSize',fsize); ylabel('RMSE of OLR (W/m2)');
legend('AM4OM2F-g6 (2000CNTL)','AM4OM2F-g7 (2000CNTL)','AM4OM2F-g9 (2000CNTL)',...
       'AMIP-g6 (2000CLIMO)','AMIP-g7 (2000CLIMO)','AMIP-g9 (2000CLIMO)',4);
visfig='off'; figpath='./fig_cml/'; expn='am4om2f-g9'; vname='toa-lwnet-rmse';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
y1=cmlg6.v0.toa.swnet.ann.rmse.all; y1_amp=mean(am4g6.v0.toa.swnet.ann.rmse.all); 
y2=cmlg7.v0.toa.swnet.ann.rmse.all; y2_amp=mean(am4g7.v0.toa.swnet.ann.rmse.all);
y3=cmlg9.v0.toa.swnet.ann.rmse.all; y3_amp=mean(am4g9.v0.toa.swnet.ann.rmse.all);
pms=[ 0, 0, 1200, 800]*0.8; fsize=20; x=[2.5:5:80];
handle=figure('Position',pms,'visible','on'); lw=2;
x1=[1:28]*5; x2=[1:23]*5; x3=[1:16]*5;
plot(x1,y1,'b','LineWidth',lw); hold on; 
plot(x2,y2,'g','LineWidth',lw);
plot(x3,y3,'r','LineWidth',lw); 
plot(1,y1_amp,'bp','MarkerFaceColor','b','MarkerSize',fsize);
plot(1,y2_amp,'gp','MarkerFaceColor','g','MarkerSize',fsize);
plot(1,y3_amp,'rp','MarkerFaceColor','r','MarkerSize',fsize);
set(gca,'FontSize',fsize); axis([0 140 9.5 11.5]); 
xlabel('year','FontSize',fsize); ylabel('RMSE of TOA net SW radiation (W/m2)');
legend('AM4OM2F-g6 (2000CNTL)','AM4OM2F-g7 (2000CNTL)','AM4OM2F-g9 (2000CNTL)',...
       'AMIP-g6 (2000CLIMO)','AMIP-g7 (2000CLIMO)','AMIP-g9 (2000CLIMO)',4);
visfig='off'; figpath='./fig_cml/'; expn='am4om2f-g9'; vname='toa-swnet-rmse';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotting fields%%%%%%%%%%
vname='tref_bias'; k1=1; k2=16; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
z0=squeeze(mean(cmlg6.v0.sfc.tref.dif_ann(k1:k2,:,:),1)); s.s0='AM4OM2F-g6 minus INTERIM';
z1=squeeze(mean(cmlg7.v0.sfc.tref.dif_ann(k1:k2,:,:),1)); s.s1='AM4OM2F-g7 minus INTERIM';
z2=squeeze(mean(cmlg9.v0.sfc.tref.dif_ann(k1:k2,:,:),1)); s.s2='AM4OM2F-g9 minus INTERIM';
z3=z0-z1; s.s3='AM4OM2F-g6 minus AM4OM2F-g7';
z4=z2-z1; s.s4='AM4OM2F-g9 minus AM4OM2F-g7';
%k=3;
%x1=squeeze(cmlg7.v0.sfc.tref.dif_clm(k,:,:)); 
%x2=squeeze(cmlg9.v0.sfc.tref.dif_clm(k,:,:)); z4=x2-x1;
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='cmlg9'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotting fields%%%%%%%%%%
vname='prec_bias'; k1=1; k2=16; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
z0=squeeze(mean(cmlg6.v0.sfc.prec_tt.dif_ann(k1:k2,:,:),1)); s.s0='AM4OM2F-g6 minus GPCPv2';
z1=squeeze(mean(cmlg7.v0.sfc.prec_tt.dif_ann(k1:k2,:,:),1)); s.s1='AM4OM2F-g7 minus GPCPv2';
z2=squeeze(mean(cmlg9.v0.sfc.prec_tt.dif_ann(k1:k2,:,:),1)); s.s2='AM4OM2F-g9 minus GPCPv2';
z3=z0-z1; s.s3='AM4OM2F-g6 minus AM4OM2F-g7';
z4=z2-z1; s.s4='AM4OM2F-g9 minus AM4OM2F-g7';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='cmlg9'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%


%Plotting fields%%%%%%%%%%
vname='netrad_bias'; k1=1; k2=2; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.toa.netrad.dif_ann(k1:k2,:,:),1)); s.s0='AM4g6 minus HadiSST';
x2=squeeze(mean(am4g7.v0.toa.netrad.dif_ann(k1:k2,:,:),1)); s.s0='AM4g6 minus HadiSST';
x3=squeeze(mean(am4g9.v0.toa.netrad.dif_ann(k1:k2,:,:),1)); s.s0='AM4g7 minus HadiSST';
y1=squeeze(mean(am4g6.v0.sfc.netrad.dif_ann(k1:k2,:,:),1)); s.s0='AM4g9 minus HadiSST';
y2=squeeze(mean(am4g7.v0.sfc.netrad.dif_ann(k1:k2,:,:),1)); s.s0='AM4g9 minus HadiSST';
y3=squeeze(mean(am4g9.v0.sfc.netrad.dif_ann(k1:k2,:,:),1)); s.s0='AM4g9 minus HadiSST';
z1=x1-x2; s.s1='AM4g6 minus AM4g7 (TOA NETRAD)';
z2=x3-x2; s.s2='AM4g9 minus AM4g7 (TOA NETRAD)';
z3=y1-y2; s.s3='AM4g6 minus AM4g7 (SFC NETRAD)';
z4=y3-y2; s.s4='AM4g9 minus AM4g7 (SFC NETRAD)';
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='amip'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotting fields%%%%%%%%%%
vname='netradclr_bias'; k1=1; k2=2; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.toa.netrad_clr.dif_ann(k1:k2,:,:),1)); s.s0='AM4g6 minus HadiSST';
x2=squeeze(mean(am4g7.v0.toa.netrad_clr.dif_ann(k1:k2,:,:),1)); s.s0='AM4g6 minus HadiSST';
x3=squeeze(mean(am4g9.v0.toa.netrad_clr.dif_ann(k1:k2,:,:),1)); s.s0='AM4g7 minus HadiSST';
y1=squeeze(mean(am4g6.v0.sfc.netrad_clr.dif_ann(k1:k2,:,:),1)); s.s0='AM4g9 minus HadiSST';
y2=squeeze(mean(am4g7.v0.sfc.netrad_clr.dif_ann(k1:k2,:,:),1)); s.s0='AM4g9 minus HadiSST';
y3=squeeze(mean(am4g9.v0.sfc.netrad_clr.dif_ann(k1:k2,:,:),1)); s.s0='AM4g9 minus HadiSST';
z1=x1-x2; s.s1='AM4g6 minus AM4g7 (TOA clearsky NETRAD)';
z2=x3-x2; s.s2='AM4g9 minus AM4g7 (TOA clearsky NETRAD)';
z3=y1-y2; s.s3='AM4g6 minus AM4g7 (SFC clearsky NETRAD)';
z4=y3-y2; s.s4='AM4g9 minus AM4g7 (SFC clearsky NETRAD)';
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='amip'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotting fields%%%%%%%%%%
vname='swcf_bias'; k1=1; k2=2; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.toa.swcf.dif_ann(k1:k2,:,:),1)); s.s0='AM4g6 minus HadiSST';
x2=squeeze(mean(am4g7.v0.toa.swcf.dif_ann(k1:k2,:,:),1)); s.s0='AM4g6 minus HadiSST';
x3=squeeze(mean(am4g9.v0.toa.swcf.dif_ann(k1:k2,:,:),1)); s.s0='AM4g7 minus HadiSST';
y1=squeeze(mean(am4g6.v0.sfc.swcf.dif_ann(k1:k2,:,:),1)); s.s0='AM4g9 minus HadiSST';
y2=squeeze(mean(am4g7.v0.sfc.swcf.dif_ann(k1:k2,:,:),1)); s.s0='AM4g9 minus HadiSST';
y3=squeeze(mean(am4g9.v0.sfc.swcf.dif_ann(k1:k2,:,:),1)); s.s0='AM4g9 minus HadiSST';
z1=x1-x2; s.s1='AM4g6 minus AM4g7 (TOA NETRAD)';
z2=x3-x2; s.s2='AM4g9 minus AM4g7 (TOA NETRAD)';
z3=y1-y2; s.s3='AM4g6 minus AM4g7 (SFC NETRAD)';
z4=y3-y2; s.s4='AM4g9 minus AM4g7 (SFC NETRAD)';
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='amip'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%

%Plotting fields%%%%%%%%%%
vname='dswcf'; k=1; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.toa.swcf.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g6.w0.toa.swcf.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4g7.v0.toa.swcf.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4g7.w0.toa.swcf.dif_clm(k,:,:),1)); 
x5=squeeze(mean(am4g9.v0.toa.swcf.dif_clm(k,:,:),1)); 
x6=squeeze(mean(am4g9.w0.toa.swcf.dif_clm(k,:,:),1)); 
x7=squeeze(mean(aref0.v0.toa.swcf.dif_clm(k,:,:),1)); 
x8=squeeze(mean(aref0.w0.toa.swcf.dif_clm(k,:,:),1)); 
z1=x2-x1; s.s1='AM4g6 (dSWCF)';
z2=x4-x3; s.s2='AM4g7 (dSWCF)';
z3=x6-x5; s.s3='AM4g9 (dSWCF)';
z4=x8-x7; s.s4='AREF0 (dSWCF)';
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='cess'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%

%Plotting fields%%%%%%%%%%
vname='dprec'; k1=1; k2=2; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g6.v0.sfc.prec_tt.dif_ann(k1:k2,:,:),1)); 
x2=squeeze(mean(am4g6.w0.sfc.prec_tt.dif_ann(k1:k2,:,:),1)); 
x3=squeeze(mean(am4g7.v0.sfc.prec_tt.dif_ann(k1:k2,:,:),1)); 
x4=squeeze(mean(am4g7.w0.sfc.prec_tt.dif_ann(k1:k2,:,:),1)); 
x5=squeeze(mean(am4g9.v0.sfc.prec_tt.dif_ann(k1:k2,:,:),1)); 
x6=squeeze(mean(am4g9.w0.sfc.prec_tt.dif_ann(k1:k2,:,:),1)); 
x7=squeeze(mean(aref0.v0.sfc.prec_tt.dif_ann(k1:k2,:,:),1)); 
x8=squeeze(mean(aref0.w0.sfc.prec_tt.dif_ann(k1:k2,:,:),1)); 
z1=x2-x1; s.s1='AM4g6 (dPrec)';
z2=x4-x3; s.s2='AM4g7 (dPrec)';
z3=x6-x5; s.s3='AM4g9 (dPrec)';
z4=x8-x7; s.s4='AREF0 (dPrec)';
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='cess'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%


%Plotting fields%%%%%%%%%%
vname='tsurf_bias'; k1=1; k2=6; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
z1=squeeze(mean(cm4g6.v0.sfc.tsurf.dif_ann,1))+273.15; s.s1='CM4g6 minus HadiSST';
z2=squeeze(mean(cm4g7.v0.sfc.tsurf.dif_ann,1))+273.15; s.s2='CM4g7 minus HadiSST';
z3=z2-z1; s.s3='CM4g7 minus CM4g6';
z4=z3; s.s4='CM4g7 minus CM4g6';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_bias'; k1=1; k2=6; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
z1=squeeze(mean(cm4g6.v0.sfc.tref.dif_ann,1)); s.s1='CM4g6';
z2=squeeze(mean(cm4g7.v0.sfc.tref.dif_ann,1)); s.s2='CM4g7';
z3=z2-z1; s.s3='CM4g7 minus CM4g6';
z4=z3; s.s4='CM4g7 minus CM4g6';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prec_bias'; k1=1; k2=6; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
z1=squeeze(mean(cm4g6.v0.sfc.prec_tt.dif_ann,1)); s.s1='CM4g6 minus GPCPv2';
z2=squeeze(mean(cm4g7.v0.sfc.prec_tt.dif_ann,1)); s.s2='CM4g7 minus GPCPv2';
z3=z2-z1; s.s3='CM4g7 minus CM4g6';
z4=z2-z1; s.s4='CM4g7 minus CM4g6';
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);

%Plotting fields%%%%%%%%%%
vname='sst_bias'; k1=1; k2=6; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
z1=squeeze(mean(am4g7.v0.sfc.tsurf.dif_ann,1))+273.15; s.s1='AMIP-AM4g7';
z2=squeeze(mean(cmlg7.v0.sfc.tsurf.dif_ann,1))+273.15; s.s2='AM4OM2F-AM4g7';
z3=squeeze(mean(cmmg7.v0.sfc.tsurf.dif_ann,1))+273.15; s.s3='CM4HALF-AM4g7';
z4=squeeze(mean(cm4g7.v0.sfc.tsurf.dif_ann,1))+273.15; s.s4='CM4QUAR-AM4g7';
%s.s1=sprintf('%s',(RMSE=%5.2f)',s.s1,mean(am4g7.v0.sfc.tref.rmse(k1:k2)));
%s.s2=sprintf('CM4-c192L48-AM4a (RMSE=%5.2f)',mean(x.v1.sst.rmse(k1:k2)));
%s.s3=sprintf('AM25like-MOM6-TouchStone (RMSE=%5.2f)',mean(cm25t.sst.rmse(k1:k2)));
%s.s4=sprintf('CM25 (RMSE=%5.2f)',mean(cm25.sst.rmse(k1:k2)));
cmin=-3; cmax=3; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_bias'; k1=1; k2=6; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
z1=squeeze(mean(am4g7.v0.sfc.tref.dif_ann,1)); s.s1='AMIP-AM4g7';
z2=squeeze(mean(cmlg7.v0.sfc.tref.dif_ann,1)); s.s2='AM4OM2F-AM4g7';
z3=squeeze(mean(cmmg7.v0.sfc.tref.dif_ann,1)); s.s3='CM4HALF-AM4g7';
z4=squeeze(mean(cm4g7.v0.sfc.tref.dif_ann,1)); s.s4='CM4QUAR-AM4g7';
%s.s1=sprintf('%s',(RMSE=%5.2f)',s.s1,mean(am4g7.v0.sfc.tref.rmse(k1:k2)));
%s.s2=sprintf('CM4-c192L48-AM4a (RMSE=%5.2f)',mean(x.v1.sst.rmse(k1:k2)));
%s.s3=sprintf('AM25like-MOM6-TouchStone (RMSE=%5.2f)',mean(cm25t.sst.rmse(k1:k2)));
%s.s4=sprintf('CM25 (RMSE=%5.2f)',mean(cm25.sst.rmse(k1:k2)));
cmin=-4.5; cmax=4.5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_bias'; k1=1; k2=6; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
z1=squeeze(mean(am4g7.v0.sfc.prec_tt.dif_ann,1)); s.s1='AMIP-AM4g7';
z2=squeeze(mean(cmlg7.v0.sfc.prec_tt.dif_ann,1)); s.s2='AM4OM2F-AM4g7';
z3=squeeze(mean(cmmg7.v0.sfc.prec_tt.dif_ann,1)); s.s3='CM4HALF-AM4g7';
z4=squeeze(mean(cm4g7.v0.sfc.prec_tt.dif_ann,1)); s.s4='CM4QUAR-AM4g7';
%s.s1=sprintf('%s',(RMSE=%5.2f)',s.s1,mean(am4g7.v0.sfc.tref.rmse(k1:k2)));
%s.s2=sprintf('CM4-c192L48-AM4a (RMSE=%5.2f)',mean(x.v1.sst.rmse(k1:k2)));
%s.s3=sprintf('AM25like-MOM6-TouchStone (RMSE=%5.2f)',mean(cm25t.sst.rmse(k1:k2)));
%s.s4=sprintf('CM25 (RMSE=%5.2f)',mean(cm25.sst.rmse(k1:k2)));
cmin=-4.5; cmax=4.5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_bias1'; k1=1; k2=6; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
z1=squeeze(mean(am4g6.v0.toa.netrad.dif_ann,1)); s.s1='AM4g6 minus CERES';
z2=squeeze(mean(am4g7.v0.toa.netrad.dif_ann,1)); s.s2='AM4g7 minus CERES';
z3=squeeze(mean(am4g9.v0.toa.netrad.dif_ann,1)); s.s3='AM4g9 minus CERES';
z4=z2-z1; s.s4='AM4g7 minus AM4g6';
cmin=-20; cmax=20; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; exp='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,exp,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_bias2'; k1=1; k2=6; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
z1=squeeze(mean(am4g6.v0.toa.netrad.dif_ann,1)); s.s1='AM4g6 minus CERES';
z2=squeeze(mean(am4g7.v0.toa.netrad.dif_ann,1)); s.s2='AM4g7 minus CERES';
z3=squeeze(mean(am4g9.v0.toa.netrad.dif_ann,1)); s.s3='AM4g9 minus CERES';
z4=z3-z1; s.s4='AM4g9 minus AM4g6';
cmin=-20; cmax=20; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; exp='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,exp,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swabs_bias1'; k1=1; k2=6; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
z1=squeeze(mean(am4g6.v0.toa.swnet.dif_ann,1)); s.s1='AM4g6 minus CERES';
z2=squeeze(mean(am4g7.v0.toa.swnet.dif_ann,1)); s.s2='AM4g7 minus CERES';
z3=squeeze(mean(am4g9.v0.toa.swnet.dif_ann,1)); s.s3='AM4g9 minus CERES';
z4=z2-z1; s.s4='AM4g7 minus AM4g6';
cmin=-20; cmax=20; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; exp='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,exp,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swabs_bias2'; k1=1; k2=6; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
z1=squeeze(mean(am4g6.v0.toa.swnet.dif_ann,1)); s.s1='AM4g6 minus CERES';
z2=squeeze(mean(am4g7.v0.toa.swnet.dif_ann,1)); s.s2='AM4g7 minus CERES';
z3=squeeze(mean(am4g9.v0.toa.swnet.dif_ann,1)); s.s3='AM4g9 minus CERES';
z4=z3-z1; s.s4='AM4g9 minus AM4g6';
cmin=-20; cmax=20; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; exp='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,exp,f,0);

%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prec_bias1'; k1=1; k2=6; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
z1=squeeze(mean(am4g6.v0.sfc.prec_tt.dif_ann,1)); s.s1='AM4g6 minus CERES';
z2=squeeze(mean(am4g7.v0.sfc.prec_tt.dif_ann,1)); s.s2='AM4g7 minus CERES';
z3=squeeze(mean(am4g9.v0.sfc.prec_tt.dif_ann,1)); s.s3='AM4g9 minus CERES';
z4=z2-z1; s.s4='AM4g7 minus AM4g6';
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; exp='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,exp,f,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%



vname='rad_bias'; k1=1; k2=6; f=1; s=am4g7.v0.s; s0=expn; s0(s0=='_')='-';
z1=squeeze(mean(am4g7.v0.toa.netrad.dif_ann,1)); s.s1='TOA NETRAD';
z2=squeeze(mean(am4g7.v0.toa.swnet.dif_ann,1));  s.s2='TOA SWABS';
z3=squeeze(mean(am4g7.v0.sfc.netrad.dif_ann,1)); s.s3='SFC NETRAD';
z4=squeeze(mean(am4g7.v0.sfc.swnet.dif_ann,1));  s.s4='SFC SWNET';
cmin=-20; cmax=20; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; exp='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,exp,f,0);


vname='pcp_bias'; k1=1; k2=6; f=1; s=x.v1.s; s0=expn; s0(s0=='_')='-';
z1=squeeze(mean(x.v2.pcp.dif_myr (k1:k2,:,:),1));s.s1='CM4-c96L48-AM4a';
z2=squeeze(mean(x.v1.pcp.dif_myr (k1:k2,:,:),1));s.s2='CM4-c192L48-AM4a';
z3=squeeze(mean(cm25t.pcp.dif_myr(k1:k2,:,:),1));s.s3='AM25like-MOM6-TouchStone';
z4=squeeze(mean(cm25.pcp.dif_myr (k1:k2,:,:),1));s.s4='CM25';
s.s1=sprintf('CM4-c96L48-AM4a (RMSE=%5.2f)',mean(x.v2.pcp.rmse(k1:k2)));
s.s2=sprintf('CM4-c192L48-AM4a (RMSE=%5.2f)',mean(x.v1.pcp.rmse(k1:k2)));
s.s3=sprintf('AM25like-MOM6-TouchStone (RMSE=%5.2f)',mean(cm25t.pcp.rmse(k1:k2)));
s.s4=sprintf('CM25 (RMSE=%5.2f)',mean(cm25.pcp.rmse(k1:k2)));
cmin=-7; cmax=7; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,exp,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%



m=1;
y1=squeeze(am4g6.v0.toa.ttcf.avg_sea (m,:,:));
y2=squeeze(am4g6.w0.toa.ttcf.avg_sea (m,:,:));
y3=squeeze(am4g6.v0.toa.swcf.avg_sea(m,:,:));
y4=squeeze(am4g6.w0.toa.swcf.avg_sea(m,:,:));
y5=squeeze(am4g6.v0.toa.lwcf.avg_sea(m,:,:));
y6=squeeze(am4g6.w0.toa.lwcf.avg_sea(m,:,:));
y7=squeeze(am4g6.v0.toa.lwcf.avg_sea(m,:,:));
y8=squeeze(am4g6.w0.toa.lwcf.avg_sea(m,:,:));

z1=squeeze(am4g7.v0.toa.ttcf.avg_sea (m,:,:));
z2=squeeze(am4g7.w0.toa.ttcf.avg_sea (m,:,:));
z3=squeeze(am4g7.v0.toa.swcf.avg_sea(m,:,:));
z4=squeeze(am4g7.w0.toa.swcf.avg_sea(m,:,:));
z5=squeeze(am4g7.v0.toa.lwcf.avg_sea(m,:,:));
z6=squeeze(am4g7.w0.toa.lwcf.avg_sea(m,:,:));
pms=[ 0, 0, 1600, 600]*1.2; fsize=16; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
lon=am4g6.v0.s.lon; lat=am4g6.v0.s.lat; lm=am4g6.v0.s.lm0;
row=2; col=3;
subplot(row,col,1);
pcolor(lon,lat,y2-y1); shading flat; colorbar; caxis([-5 5]); hold on;
contour(lon,lat,lm,0.5,'k'); title('TTCF (g6;p2K-CNTL)','FontSize',fsize);
xlabel('longitude','FontSize',fsize); ylabel('latitude','FontSize',fsize);
set(gca,'FontSize',fsize);
subplot(row,col,2);
pcolor(lon,lat,y4-y3); shading flat; colorbar; caxis([-5 5]); hold on;
contour(lon,lat,lm,0.5,'k'); title('SWCF (g6;p2K-CNTL)','FontSize',fsize);
xlabel('longitude','FontSize',fsize); ylabel('latitude','FontSize',fsize);
set(gca,'FontSize',fsize);
subplot(row,col,3);
pcolor(lon,lat,y6-y5); shading flat; colorbar; caxis([-5 5]); hold on;
contour(lon,lat,lm,0.5,'k'); title('LWCF (g6;p2K-CNTL)','FontSize',fsize);
xlabel('longitude','FontSize',fsize); ylabel('latitude','FontSize',fsize);
set(gca,'FontSize',fsize);
subplot(row,col,4);
pcolor(lon,lat,z2-z1); shading flat; colorbar; caxis([-5 5]); hold on;
contour(lon,lat,lm,0.5,'k'); title('TTCF (g7;p2K-CNTL)','FontSize',fsize);
xlabel('longitude','FontSize',fsize); ylabel('latitude','FontSize',fsize); 
set(gca,'FontSize',fsize);
subplot(row,col,5);
pcolor(lon,lat,z4-z3); shading flat; colorbar; caxis([-5 5]); hold on;
contour(lon,lat,lm,0.5,'k'); title('SWCF (g7;p2K-CNTL)','FontSize',fsize);
xlabel('longitude','FontSize',fsize); ylabel('latitude','FontSize',fsize); 
set(gca,'FontSize',fsize);
subplot(row,col,6);
pcolor(lon,lat,z6-z5); shading flat; colorbar; caxis([-5 5]); hold on;
contour(lon,lat,lm,0.5,'k'); title('LWCF (g7;p2K-CNTL)','FontSize',fsize);
xlabel('longitude','FontSize',fsize); ylabel('latitude','FontSize',fsize); 
set(gca,'FontSize',fsize);

visfig='off'; figpath='./fig_cml/'; expn='compg6g7'; vname='toa';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


y0=squeeze(mean(cmlf5a.c0.sfc.tref.ann.latdis.mod,1));
for j=1:90
  y1(:,j)=cmlf5a.h0.sfc.tref.ann.latdis.mod(:,j)-y0(j);
end
figure; pcolor(y1'); shading flat; colorbar; caxis([-1 1]);

y0=squeeze(mean(cmlg6.c0.sfc.tref.ann.latdis.mod,1));
for j=1:90
  y2(:,j)=cmlg6.h0.sfc.tref.ann.latdis.mod(:,j)-y0(j);
end
figure; pcolor(y2'); shading flat; colorbar; caxis([-1 1]);


y1=cmlg6.h0.sfc.tref.clm.latdis_all-cmlg6.c0.sfc.tref.clm.latdis_all; y1=y1';
figure; pcolor(y1); shading flat; colorbar; caxis([-1 1]);

y1=cmlf5a.h0.sfc.tref.clm.latdis_all-cmlf5a.c0.sfc.tref.clm.latdis_all; y1=y1';
figure; pcolor(y1); shading flat; colorbar; caxis([-1 1]);


figure; y1=cmlf5a.h0.sfc.tref.clm.latdis_all; y1=y1';
pcolor(y1-mean(mean(y1))); shading flat; colorbar;

figure; pcolor(cmlf5a.h0.sfc.tref.clm.latdis_all); shading flat; colorbar;

figure;
y1=cmlg6.c0.sfc.tref.clm.mmen.all; y1=y1-mean(y1);
y2=cmlf5a.c0.sfc.tref.clm.mmen.all;y2=y2-mean(y2);
plot(y1,'b'); hold on; plot(y2,'r');

figure; plot(y2-y1,'b');

figure; m=11;
y1=cmlg6.h0.sfc.tref.ts.mon.all(m,:); y1=y1-mean(y1);
y2=cmlf5a.h0.sfc.tref.ts.mon.all(m,:);y2=y2-mean(y2);
plot(y1,'b'); hold on; plot(y2,'r');


expn='AM4OM2F_c96l32_am4g7r3_2000climo';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);v0=v;
expn='AM4OM2F_c96l32_am4g8r1_2000climo';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);v1=v;
expn='AM4OM2F_c96l32_am4g8r1_2000climo_alb';fn=strcat(tpath,expn,pp,expn,dr);load(fn);v2=v;
pms=[ 0, 0, 1200, 800]; fsize=20;
handle=figure('Position',pms,'visible','on'); lw=2;
plot(v0.sfc.tref.ts.org_ann,'r','LineWidth',lw); hold on; 
plot(v1.sfc.tref.ts.org_ann,'g','LineWidth',lw);
plot(v2.sfc.tref.ts.org_ann,'b','LineWidth',lw);

pms=[ 0, 0, 1200, 800]; fsize=20;
handle=figure('Position',pms,'visible','on'); m=1;
plot(v0.sfc.tref.sea.latdis_all(m,:),'r'); hold on;
plot(v1.sfc.tref.sea.latdis_all(m,:),'g'); hold on;
plot(v2.sfc.tref.sea.latdis_all(m,:),'b');

figure;
y1=v0.sfc.tref.sea.latdis_all(m,:)
plot(v1.sfc.tref.sea.latdis_all(m,:)-y1,'g'); hold on;
plot(v2.sfc.tref.sea.latdis_all(m,:)-y1,'b');


y1=cmlg6.c0.toa.netrad.ann.mmen.all;  %y1_avg=mean(y1); %y1=y1-y1_avg;
y2=cmlg6.h0.toa.netrad.ann.mmen.all;  %y2_avg=mean(y2); %y2=y2-y1_avg;
y3=cmlf5a.c0.toa.netrad.ann.mmen.all; %y3_avg=mean(y3); %y3=y3-y3_avg;
y4=cmlf5a.h0.toa.netrad.ann.mmen.all; %y4_avg=mean(y4); %y4=y4-y3_avg;
pms=[ 0, 0, 1200, 800]; fsize=20;
handle=figure('Position',pms,'visible','on'); lw=2;
plot([1801:5:1940],    y1,'b','LineWidth',lw); hold on; 
plot([1861:5:1860+150],y2,'m','LineWidth',lw);
plot([1801:5:1955],    y3,'k','LineWidth',lw); hold on; 
plot([1861:5:1860+145],y4,'r','LineWidth',lw);

y1=cmlg6.c0.sfc.tref.ts.org_ann;  %y1_avg=mean(y1); y1=y1-y1_avg;
y2=cmlg6.h0.sfc.tref.ts.org_ann;  %y2_avg=mean(y2); y2=y2-y1_avg;
y3=cmlf5a.c0.sfc.tref.ts.org_ann; %y3_avg=mean(y3); y3=y3-y3_avg;
y4=cmlf5a.h0.sfc.tref.ts.org_ann; %y4_avg=mean(y4); y4=y4-y3_avg;
pms=[ 0, 0, 1200, 800]; fsize=20;
handle=figure('Position',pms,'visible','on'); lw=2;
plot([1801:1:1940],    y1,'b','LineWidth',lw); hold on; 
plot([1861:1:1860+150],y2,'m','LineWidth',lw);
plot([1801:1:1955],    y3,'k','LineWidth',lw); hold on; 
plot([1861:1:1860+145],y4,'r','LineWidth',lw);
legend('AM4g6+1degOcean (1860CNTL)','AM4g6+1degOcean (Historical)',...
       'F05+1degOcean (1860CNTL)','F05+1degOcean (Historical)',2);
%plot([1801:1:1920],    cmlf5.c0.sfc.tref.ts.org_ann,'c'); hold on; 
%plot([1861:1:1860+60], cmlf5.h0.sfc.tref.ts.org_ann,'y');
xlabel('year','FontSize',fsize); 
ylabel('surface air temperature (K)','FontSize',fsize); vname='Tref';
ylabel('surface air temperature anomaly (K)','FontSize',fsize); vname='Tref_anomaly';
set(gca,'FontSize',fsize); 
axis([1800 2010 12 14.3]); axis([1800 2010 -0.8 1.3]); 
visfig='off'; figpath='./fig_cml/';  expn='cml'; 
printit(visfig,figpath,expn,vname);

y1=cmlg6.c0.sfc.tref.ts.org_ann;     y1_avg=mean(y1); %y1=y1-y1_avg;
y2=cmlg6.h0.sfc.tref.ts.org_ann;     y2_avg=mean(y2); %y2=y2-y1_avg;
y3=cmlg7.c0.sfc.tref.ts.org_ann;     y3_avg=mean(y3); %y3=y3-y3_avg;
y4=cmlg7.h0.sfc.tref.ts.org_ann;     y4_avg=mean(y4); %y4=y4-y3_avg;
z1=cmlg6.c0.toa.netrad.ann.mmen.all; z1_avg=mean(z1); %y1=y1-y1_avg;
z2=cmlg6.h0.toa.netrad.ann.mmen.all; z2_avg=mean(z2); %y2=y2-y1_avg;
z3=cmlg7.c0.toa.netrad.ann.mmen.all; z3_avg=mean(z3); %y3=y3-y3_avg;
z4=cmlg7.h0.toa.netrad.ann.mmen.all; z4_avg=mean(z4); %y4=y4-y3_avg;
w1=cmlg6.c0.sfc.netflx.ann.mmen.all; w1_avg=mean(w1); %y1=y1-y1_avg;
w2=cmlg6.h0.sfc.netflx.ann.mmen.all; w2_avg=mean(w2); %y2=y2-y1_avg;
w3=cmlg7.c0.sfc.netflx.ann.mmen.all; w3_avg=mean(w3); %y3=y3-y3_avg;
w4=cmlg7.h0.sfc.netflx.ann.mmen.all; w4_avg=mean(w4); %y4=y4-y3_avg;
pms=[ 0, 0, 1200, 800]*2; fsize=20;
handle=figure('Position',pms,'visible','on'); lw=2;
row=2; col=2;
subplot(row,col,1);
plot([1801:1:1940],    y1,'b','LineWidth',lw); hold on; 
plot([1861:1:1860+150],y2,'m','LineWidth',lw);
plot([1801:1:1940],    y3,'k','LineWidth',lw); hold on; 
plot([1861:1:1860+145],y4,'r','LineWidth',lw);
axis([1800 2010 12 14.3]); ylabel('surface air temperature (K)');
legend('AM4g6+1degOcean (1860CNTL)','AM4g6+1degOcean (Historical)',...
       'AM4g7+1degOcean (1860CNTL)','AM4g7+1degOcean (Historical)',2);
subplot(row,col,2);
plot([1801:1:1940],    y1-y1_avg,'b','LineWidth',lw); hold on; 
plot([1861:1:1860+150],y2-y1_avg,'m','LineWidth',lw);
plot([1801:1:1940],    y3-y3_avg,'k','LineWidth',lw); hold on; 
plot([1861:1:1860+145],y4-y3_avg,'r','LineWidth',lw);
axis([1800 2010 -0.8 1.3]); ylabel('surface air temperature anomaly (K)');
%legend('AM4g6+1degOcean (1860CNTL)','AM4g6+1degOcean (Historical)',...
%       'AM4g7+1degOcean (1860CNTL)','AM4g7+1degOcean (Historical)',2);
subplot(row,col,3);
plot([1801:5:1940],    z1,'b','LineWidth',lw); hold on; 
plot([1861:5:1860+150],z2,'m','LineWidth',lw);
plot([1801:5:1940],    z3,'k','LineWidth',lw); hold on; 
plot([1861:5:1860+145],z4,'r','LineWidth',lw);
axis([1800 2010 -0.2 1.6]); ylabel('TOA net radiative flux (W/m2)');
%legend('AM4g6+1degOcean (1860CNTL)','AM4g6+1degOcean (Historical)',...
%       'AM4g7+1degOcean (1860CNTL)','AM4g7+1degOcean (Historical)',2);
subplot(row,col,4);
plot([1801:5:1940],    w1,'b','LineWidth',lw); hold on; 
plot([1861:5:1860+150],w2,'m','LineWidth',lw);
plot([1801:5:1940],    w3,'k','LineWidth',lw); hold on; 
plot([1861:5:1860+145],w4,'r','LineWidth',lw);
axis([1800 2010 -0.2 1.6]); ylabel('Surface net energy flux (W/m2)');
%legend('AM4g6+1degOcean (1860CNTL)','AM4g6+1degOcean (Historical)',...
%       'AM4g7+1degOcean (1860CNTL)','AM4g7+1degOcean (Historical)',2);
visfig='off'; figpath='./fig_cml/';  expn='cml'; vname='g7';
printit(visfig,figpath,expn,vname);

figure; 
plot([1801:1:1940],    cmlg6.c0.toa.netrad.ts.org_ann_f,'k'); hold on; 
plot([1861:1:1860+150],cmlg6.h0.toa.netrad.ts.org_ann_f,'r');
plot([1801:1:1940],    cmlg7.c0.toa.netrad.ts.org_ann_f,'b'); hold on; 
plot([1861:1:1860+95], cmlg7.h0.toa.netrad.ts.org_ann_f,'m');
plot([1801:1:1920],    cmlf5.c0.toa.netrad.ts.org_ann_f,'c'); hold on; 
plot([1861:1:1860+60], cmlf5.h0.toa.netrad.ts.org_ann_f,'y');

plot([1861:1:1860+85], cmlg7.h0.toa.netrad.ts.org_ann_f,'m');


x=am4g7.v0.s.lat; a=(mean(am4g7.v0.s.aa,2))'; 
m=1; expn='amip'; vname='lwnetsfc'; y.opt=3;
y.var0=am4g7.v0.toa.lwnet.sea.latdis_all(m,:); y.c0='k';   y.s0='am4g7';
y.var1=am4g7.x0.toa.lwnet.sea.latdis_all(m,:); y.c1='k--'; y.s1='am4g7-p2K';
y.var2=g7f05.v0.toa.lwnet.sea.latdis_all(m,:); y.c2='r';   y.s2='am4g7f05';
y.var3=g7f05.x0.toa.lwnet.sea.latdis_all(m,:); y.c3='r--'; y.s3='am4g7f05-p2K';
y.var1=y.var1-y.var0; y.var0(:)=0; 
y.var3=y.var3-y.var2; y.var2(:)=0; 
y.xl='latitude'; y.yl='DJF low cloud amount (%)'; y.xy=[-90 90 5 90];
plot_latdis1(x,y,expn,vname);

x=am4g7.v0.s.lat; a=(mean(am4g7.v0.s.aa,2))'; 
m=1; expn='amip'; vname='lwnetsfc'; y.opt=3;
y.var0=am4g7.v0.sfc.lwnet.sea.latdis_all(m,:); y.c0='k';   y.s0='am4g7';
y.var1=am4g7.x0.sfc.lwnet.sea.latdis_all(m,:); y.c1='k--'; y.s1='am4g7-p2K';
y.var2=g7f05.v0.sfc.lwnet.sea.latdis_all(m,:); y.c2='r';   y.s2='am4g7f05';
y.var3=g7f05.x0.sfc.lwnet.sea.latdis_all(m,:); y.c3='r--'; y.s3='am4g7f05-p2K';
y.var1=y.var1-y.var0; y.var0(:)=0; 
y.var3=y.var3-y.var2; y.var2(:)=0; 
y.xl='latitude'; y.yl='DJF low cloud amount (%)'; y.xy=[-90 90 5 90];
plot_latdis1(x,y,expn,vname);

figure; 
plot(am4g7.v0.tref.ts.org,'b'); hold on;
plot(am4g7.x0.tref.ts.org,'r');
figure; 
plot(cmlg7.c0.toa.netrad.ann.mmen.all,'b'); hold on;
plot(cmlg7.v0.toa.netrad.ann.mmen.all,'r');

[mean(y.var2.*a) mean(y.var3.*a)]

lat=am4g7.v0.s.lat; lon=am4g7.v0.s.lon; m=1;
y1=squeeze(am4g7.v0.tref.avg_sea(m,:,:));
z1=squeeze(am4g7.x0.tref.avg_sea(m,:,:));
y2=squeeze(g7f05.v0.tref.avg_sea(m,:,:));
z2=squeeze(g7f05.x0.tref.avg_sea(m,:,:));

pms=[ 0, 0, 1200, 500]*1.5; row=2; col=2; fsize=16;
handle=figure('Position',pms,'visible','on'); cmin=-2; cmax=2;
subplot(row,col,1);
pcolor(lon,lat,z1-y1); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,2);
pcolor(lon,lat,z2-y2); shading flat; colorbar; caxis([cmin cmax]);

subplot(row,col,3);
pcolor(lon,lat,z3-y3); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,4);
pcolor(lon,lat,z4-y4); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,5);
pcolor(lon,lat,z5-y5); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,6);
pcolor(lon,lat,z6-y6); shading flat; colorbar; caxis([cmin cmax]);



x=am4g7.v0.s.lat; a=(mean(am4g7.v0.s.aa,2))'; 
m=5; expn='amip'; vname='lwnetsfc'; y.opt=3;
y.var0=am4g7.v0.tref.sea.latdis_all(m,:); y.c0='k';   y.s0='am4g7';
y.var1=am4g7.w0.tref.sea.latdis_all(m,:); y.c1='k--'; y.s1='am4g7-p2K';
y.var2=g7f05.v0.tref.sea.latdis_all(m,:); y.c2='r';   y.s2='am4g7f05';
y.var3=g7f05.w0.tref.sea.latdis_all(m,:); y.c3='r--'; y.s3='am4g7f05-p2K';
y.xl='latitude'; y.yl='DJF low cloud amount (%)'; y.xy=[-90 90 5 90];
plot_latdis1(x,y,expn,vname);

x=am4g7.v0.s.lat; a=(mean(am4g7.v0.s.aa,2))'; 
m=5; expn='amip'; vname='lwnetsfc'; y.opt=3;
y.var0=am4g7.v0.sfc.lwnet.sea.latdis_all(m,:); y.c0='k';   y.s0='am4g7';
y.var1=am4g7.x0.sfc.lwnet.sea.latdis_all(m,:); y.c1='k--'; y.s1='am4g7-p2K';
y.var2=g7f05.v0.sfc.lwnet.sea.latdis_all(m,:); y.c2='r';   y.s2='am4g7f05';
y.var3=g7f05.x0.sfc.lwnet.sea.latdis_all(m,:); y.c3='r--'; y.s3='am4g7f05-p2K';
y.xl='latitude'; y.yl='DJF low cloud amount (%)'; y.xy=[-90 90 5 90];
plot_latdis1(x,y,expn,vname);


x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
expn='amip'; vname='qal_djf'; m=5; y.opt=4;
y.var0=am4g6.v0.qal.sea.latdis_all(m,:); y.c0='b'; y.s0='AM4g6';
y.var1=am4g7.v0.qal.sea.latdis_all(m,:); y.c1='r'; y.s1='AM4g7';
y.var2=am4x7.v0.qal.sea.latdis_all(m,:); y.c2='k'; y.s2='AM4g7-f05';
y.var3=am4x7.v0.qal.sea.latdis_all(m,:); y.c3='c'; y.s3='AM4g7-f05';
y.xl='latitude'; y.yl='DJF low cloud amount (%)'; y.xy=[-90 90 5 90];
plot_latdis1(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
expn='amip'; vname='qah_ann'; m=1; y.opt=4;
y.var0=am4g6.v0.qah.sea.latdis_all(m,:); y.c0='b'; y.s0='AM4g6';
y.var1=am4g7.v0.qah.sea.latdis_all(m,:); y.c1='r'; y.s1='AM4g7';
y.var2=am4g8.v0.qah.sea.latdis_all(m,:); y.c2='k'; y.s1='AM4g8';
y.xl='latitude'; y.yl='high cloud amount (%)'; y.xy=[-90 90 20 70];
plot_latdis1(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
expn='amip'; vname='lwp_ann'; m=1; y.opt=4;
y.var0=am4g6.v0.lwp.sea.latdis_all(m,:)*1000; y.c0='b'; y.s0='AM4g6';
y.var1=am4g7.v0.lwp.sea.latdis_all(m,:)*1000; y.c1='r'; y.s1='AM4g7';
y.var2=am4g8.v0.lwp.sea.latdis_all(m,:)*1000; y.c2='k'; y.s2='AM4g8';
y.xl='latitude'; y.yl='liquid water path (g/kg)'; y.xy=[-90 90 0 100];
plot_latdis1(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
expn='amip'; vname='iwp_ann'; m=1; y.opt=4;
y.var0=am4g6.v0.iwp.sea.latdis_all(m,:)*1000; y.c0='b'; y.s0='AM4g6';
y.var1=am4g7.v0.iwp.sea.latdis_all(m,:)*1000; y.c1='r'; y.s1='AM4g7';
y.var2=am4g8.v0.iwp.sea.latdis_all(m,:)*1000; y.c2='k'; y.s2='AM4g8';
y.xl='latitude'; y.yl='ice water path (g/kg)'; y.xy=[-90 90 0 100];
plot_latdis1(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
expn='amip'; vname='taux_djf'; m=5; y.opt=4;
y.var1=am4g6.v0.taux.sea.latdis_all(m,:); y.c1='b'; y.s1='AM4g6';
y.var2=am4g7.v0.taux.sea.latdis_all(m,:); y.c2='r'; y.s2='AM4g7';
y.var3=am4g8.v0.taux.sea.latdis_all(m,:); y.c3='k'; y.s3='AM4g8';
y.var0=o.taux.latdis.sea(m,:);            y.c0='c'; y.s0='ECMWF-INTERIM';
y.xl='latitude'; y.yl='\tau_x (N/m2, DJF)'; y.xy=[-90 90 -0.15 0.2];
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
expn='amip'; vname='uref_djf'; m=5; y.opt=1;
y.var1=am4g6.v0.uref.sea.latdis_all(m,:); y.c1='b'; y.s1='AM4g6';
y.var2=am4g7.v0.uref.sea.latdis_all(m,:); y.c2='r'; y.s2='AM4g7';
y.var3=am4g8.v0.uref.sea.latdis_all(m,:); y.c3='k'; y.s3='AM4g8';
y.var0=o.uref.latdis.sea(m,:);            y.c0='c'; y.s0='ECMWF-INTERIM';
y.xl='latitude'; y.yl='U at 10m (m/s, DJF)'; y.xy=[-90 90 -6 8];
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
expn='amip'; vname='wref_djf'; m=5; y.opt=1;
y.var1=am4g6.v0.wref.sea.latdis_all(m,:); y.c1='b'; y.s1='AM4g6';
y.var2=am4g7.v0.wref.sea.latdis_all(m,:); y.c2='r'; y.s2='AM4g7';
y.var3=am4g8.v0.wref.sea.latdis_all(m,:); y.c3='k'; y.s3='AM4g8';
y.var0=o.wref.latdis.sea(m,:);            y.c0='c'; y.s0='ECMWF-INTERIM';
y.xl='latitude'; y.yl='wind speed at 10m (m/s, DJF)'; y.xy=[-90 90 2 11];
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
expn='amip'; vname='evap_djf'; m=1; y.opt=1;
y.var1=am4g6.v0.evap.sea.latdis_all(m,:); y.c1='b'; y.s1='AM4g6';
y.var2=am4g7.v0.evap.sea.latdis_all(m,:); y.c2='r'; y.s2='AM4g7';
y.var3=am4g8.v0.evap.sea.latdis_all(m,:); y.c3='k'; y.s3='AM4g8';
y.var0=o.evap.latdis.sea(m,:);            y.c0='c'; y.s0='ECMWF-INTERIM';
y.xl='latitude'; y.yl='evaporation (N/m2)'; y.xy=[-90 90 0 200];
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
expn='amip'; vname='rhref_djf'; m=5; y.opt=0;
y.var1=am4g6.v0.rhref.sea.latdis_all(m,:); y.c1='b'; y.s1='AM4g6';
y.var2=am4g7.v0.rhref.sea.latdis_all(m,:); y.c2='r'; y.s2='AM4g7';
y.var3=am4g8.v0.rhref.sea.latdis_all(m,:); y.c3='k'; y.s3='AM4g8';
y.var0=o.rhref.latdis.sea(m,:);            y.c0='c'; y.s0='ECMWF-INTERIM';
y.xl='latitude'; y.yl='RH-ref (W/m2)'; y.xy=[-90 90 60 100];
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
m=1; expn='amip'; vname='lwcf'; y.opt=3;
y.var0=o.toa.lwcf.latdis.sea(m,:);            y.c0='k'; y.s3='obs';
y.var1=aref0.v0.toa.lwcf.sea.latdis_all(m,:); y.c1='r'; y.s1='aref0';
y.var2=am4g6.v0.toa.lwcf.sea.latdis_all(m,:); y.c2='g'; y.s2='am4g6';
y.var3=am4g7.v0.toa.lwcf.sea.latdis_all(m,:); y.c3='b'; y.s3='am4g7';
y.var1=y.var1-y.var0; y.var2=y.var2-y.var0; y.var3=y.var3-y.var0; y.var0=y.var0-y.var0;
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
m=1; expn='amip'; vname='swcf'; y.opt=3;
y.var0=o.toa.swcf.latdis.sea(m,:);            y.c0='k'; y.s3='obs';
y.var1=aref0.v0.toa.swcf.sea.latdis_all(m,:); y.c1='r'; y.s1='aref0';
y.var2=am4g6.v0.toa.swcf.sea.latdis_all(m,:); y.c2='g'; y.s2='am4g6';
y.var3=am4g7.v0.toa.swcf.sea.latdis_all(m,:); y.c3='b'; y.s3='am4g7';
y.var1=y.var1-y.var0; y.var2=y.var2-y.var0; y.var3=y.var3-y.var0; y.var0=y.var0-y.var0;
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
m=1; expn='amip'; vname='ttcf'; y.opt=3;
y.var0=o.toa.ttcf.latdis.sea(m,:);            y.c0='k'; y.s3='obs';
y.var1=aref0.v0.toa.ttcf.sea.latdis_all(m,:); y.c1='r'; y.s1='aref0';
y.var2=am4g6.v0.toa.ttcf.sea.latdis_all(m,:); y.c2='g'; y.s2='am4g6';
y.var3=am4g7.v0.toa.ttcf.sea.latdis_all(m,:); y.c3='b'; y.s3='am4g7';
y.var1=y.var1-y.var0; y.var2=y.var2-y.var0; y.var3=y.var3-y.var0; y.var0=y.var0-y.var0;
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
m=1; expn='amip'; vname='ttcf'; y.opt=3;
y.var0=o.toa.netrad.latdis.sea(m,:);            y.c0='k'; y.s3='obs';
y.var1=aref0.v0.toa.netrad.sea.latdis_all(m,:); y.c1='r'; y.s1='aref0';
y.var2=am4g6.v0.toa.netrad.sea.latdis_all(m,:); y.c2='g'; y.s2='am4g6';
y.var3=am4g7.v0.toa.netrad.sea.latdis_all(m,:); y.c3='b'; y.s3='am4g7';
y.var1=y.var1-y.var0; y.var2=y.var2-y.var0; y.var3=y.var3-y.var0; y.var0=y.var0-y.var0;
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
m=1; expn='amip'; vname='ttcf'; y.opt=3;
y.var0=o.sfc.netrad.latdis.sea(m,:);            y.c0='k'; y.s3='obs';
y.var1=aref0.v0.sfc.netrad.sea.latdis_all(m,:); y.c1='r'; y.s1='aref0';
y.var2=am4g6.v0.sfc.netrad.sea.latdis_all(m,:); y.c2='g'; y.s2='am4g6';
y.var3=am4g7.v0.sfc.netrad.sea.latdis_all(m,:); y.c3='b'; y.s3='am4g7';
y.var1=y.var1-y.var0; y.var2=y.var2-y.var0; y.var3=y.var3-y.var0; 
y.var0=y.var0-y.var0;
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
m=1; expn='amip'; vname='ttcf'; y.opt=3;
y.var0=o.sfc.netflx.latdis.sea(m,:);            y.c0='k'; y.s0='obs';
y.var1=aref0.v0.sfc.netflx.sea.latdis_all(m,:); y.c1='r'; y.s1='aref0';
y.var2=am4g6.v0.sfc.netflx.sea.latdis_all(m,:); y.c2='g'; y.s2='am4g6';
y.var3=am4g7.v0.sfc.netflx.sea.latdis_all(m,:); y.c3='b'; y.s3='am4g7';
%y.var1=y.var1-y.var0; y.var2=y.var2-y.var0; y.var3=y.var3-y.var0; y.var0=y.var0-y.var0;
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
m=1; expn='amip'; vname='netradtoa'; y.opt=3;
y.var0=o.toa.netrad.latdis.sea(m,:);            y.c0='k'; y.s0='obs';
y.var1=am4x7.v0.toa.netrad.sea.latdis_all(m,:); y.c1='r'; y.s1='am4x7';
y.var2=am4g6.v0.toa.netrad.sea.latdis_all(m,:); y.c2='g'; y.s2='am4g6';
y.var3=am4g7.v0.toa.netrad.sea.latdis_all(m,:); y.c3='b'; y.s3='am4g7';
y.var1=y.var1-y.var0; y.var2=y.var2-y.var0; y.var3=y.var3-y.var0; y.var0=y.var0-y.var0;
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
m=5; expn='amip'; vname='netradsfc'; y.opt=3;
y.var0=o.sfc.netrad.latdis.sea(m,:);            y.c0='k'; y.s0='obs';
y.var1=am4x7.v0.sfc.netrad.sea.latdis_all(m,:); y.c1='r'; y.s1='am4x7';
y.var2=am4g6.v0.sfc.netrad.sea.latdis_all(m,:); y.c2='g'; y.s2='am4g6';
y.var3=am4g7.v0.sfc.netrad.sea.latdis_all(m,:); y.c3='b'; y.s3='am4g7';
y.var1=y.var1-y.var0; y.var2=y.var2-y.var0; y.var3=y.var3-y.var0; y.var0=y.var0-y.var0;
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
m=1; expn='amip'; vname='lwnetsfc'; y.opt=3;
y.var0=o.sfc.lwnet.latdis.sea(m,:);            y.c0='k'; y.s0='obs';
y.var1=am4x7.v0.sfc.lwnet.sea.latdis_all(m,:); y.c1='r'; y.s1='am4x7';
y.var2=am4g6.v0.sfc.lwnet.sea.latdis_all(m,:); y.c2='g'; y.s2='am4g6';
y.var3=am4g7.v0.sfc.lwnet.sea.latdis_all(m,:); y.c3='b'; y.s3='am4g7';
%y.var1=y.var1-y.var0; y.var2=y.var2-y.var0; y.var3=y.var3-y.var0; y.var0=y.var0-y.var0;
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
m=1; expn='amip'; vname='lwnetsfc'; y.opt=3;
y.var0=o.sfc.lwnet.latdis.sea(m,:);            y.c0='k'; y.s0='obs';
y.var1=am4x7.w0.sfc.lwnet.sea.latdis_all(m,:)-am4x7.v0.sfc.lwnet.sea.latdis_all(m,:); y.c1='r'; y.s1='am4x7';
y.var2=am4g6.w0.sfc.lwnet.sea.latdis_all(m,:)-am4g6.v0.sfc.lwnet.sea.latdis_all(m,:); y.c2='g'; y.s2='am4g6';
y.var3=am4g7.w0.sfc.lwnet.sea.latdis_all(m,:)-am4g7.v0.sfc.lwnet.sea.latdis_all(m,:); y.c3='b'; y.s3='am4g7';
%y.var1=y.var1-y.var0; y.var2=y.var2-y.var0; y.var3=y.var3-y.var0; y.var0=y.var0-y.var0;
y.var0(:)=0;
plot_latdis(x,y,expn,vname);


x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
m=1; expn='amip'; vname='lwcf'; y.opt=3;
y.var0=o.sfc.lwcf.latdis.sea(m,:);            y.c0='k'; y.s3='obs';
y.var1=aref0.v0.sfc.lwcf.sea.latdis_all(m,:); y.c1='r'; y.s1='aref0';
y.var2=am4g6.v0.sfc.lwcf.sea.latdis_all(m,:); y.c2='g'; y.s2='am4g6';
y.var3=am4g7.v0.sfc.lwcf.sea.latdis_all(m,:); y.c3='b'; y.s3='am4g7';
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
m=1; expn='amip'; vname='netrad'; y.opt=3;
y.var1=aref0.v0.toa.lwcf.sea.latdis_all(m,:); y.c1='r'; y.s1='aref0';
y.var2=am4g6.v0.toa.lwcf.sea.latdis_all(m,:); y.c2='g'; y.s2='am4g6';
y.var3=am4g7.v0.toa.lwcf.sea.latdis_all(m,:); y.c3='b'; y.s3='am4g7';
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
m=5; expn='amip'; vname='netrad'; y.opt=3;
y.var1=aref0.v0.sfc.netrad.sea.latdis_all(m,:); y.c1='r'; y.s1='aref0';
y.var2=am4g6.v0.sfc.netrad.sea.latdis_all(m,:); y.c2='g'; y.s2='am4g6';
y.var3=am4g7.v0.sfc.netrad.sea.latdis_all(m,:); y.c3='b'; y.s3='am4g7';
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
m=1; expn='amip'; vname='netrad'; y.opt=3;
y.var1=aref0.v0.sfc.lwnet.sea.latdis_all(m,:); y.c1='r'; y.s1='aref0';
y.var2=am4g6.v0.sfc.lwnet.sea.latdis_all(m,:); y.c2='g'; y.s2='am4g6';
y.var3=am4g7.v0.sfc.lwnet.sea.latdis_all(m,:); y.c3='b'; y.s3='am4g7';
plot_latdis(x,y,expn,vname);

x=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; 
m=1; expn='amip'; vname='netrad'; y.opt=3;
y.var1=aref0.v0.toa.netrad.sea.latdis_all(m,:); y.c1='r'; y.s1='aref0';
y.var2=am4g6.v0.toa.netrad.sea.latdis_all(m,:); y.c2='g'; y.s2='am4g6';
y.var3=am4g7.v0.toa.netrad.sea.latdis_all(m,:); y.c3='b'; y.s3='am4g7';
plot_latdis(x,y,expn,vname);

-am4g6.v0.toa.netrad.sea.latdis_all;
y2=am4g6.w0.sfc.netflx.sea.latdis_all-am4g6.v0.sfc.netflx.sea.latdis_all;
y3=y2-y1;
z1=am4g7.w0.toa.netrad.sea.latdis_all-am4g7.v0.toa.netrad.sea.latdis_all;
z2=am4g7.w0.sfc.netflx.sea.latdis_all-am4g7.v0.sfc.netflx.sea.latdis_all;
z3=z2-z1;
y1=squeeze(y1(m,:)); y2=squeeze(y2(m,:)); y3=squeeze(y3(m,:));
z1=squeeze(z1(m,:)); z2=squeeze(z2(m,:)); z3=squeeze(z3(m,:));

lat=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; m=5;
y1=am4g6.w0.toa.netrad.sea.latdis_all-am4g6.v0.toa.netrad.sea.latdis_all;
y2=am4g6.w0.sfc.netflx.sea.latdis_all-am4g6.v0.sfc.netflx.sea.latdis_all;
y3=y2-y1;
z1=am4g7.w0.toa.netrad.sea.latdis_all-am4g7.v0.toa.netrad.sea.latdis_all;
z2=am4g7.w0.sfc.netflx.sea.latdis_all-am4g7.v0.sfc.netflx.sea.latdis_all;
z3=z2-z1;
y1=squeeze(y1(m,:)); y2=squeeze(y2(m,:)); y3=squeeze(y3(m,:));
z1=squeeze(z1(m,:)); z2=squeeze(z2(m,:)); z3=squeeze(z3(m,:));

figure; 
plot(lat,y1,'r'); hold on; plot(lat,y2,'g'); plot(lat,y3,'b'); 
plot(lat,z1,'r--'); hold on; plot(lat,z2,'g--'); plot(lat,z3,'b--'); 
legend('TOA','SFC','TOA-SFC',3); grid on;

lat=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; m=5;
y1=am4g6.w0.toa.lwcf.sea.latdis_all-am4g6.v0.toa.lwcf.sea.latdis_all;
y2=am4g6.w0.toa.swcf.sea.latdis_all-am4g6.v0.toa.swcf.sea.latdis_all;
y3=y2+y1;
z1=am4g7.w0.toa.lwcf.sea.latdis_all-am4g7.v0.toa.lwcf.sea.latdis_all;
z2=am4g7.w0.toa.swcf.sea.latdis_all-am4g7.v0.toa.swcf.sea.latdis_all;
z3=z2+z1;
y1=squeeze(y1(m,:)); y2=squeeze(y2(m,:)); y3=squeeze(y3(m,:));
z1=squeeze(z1(m,:)); z2=squeeze(z2(m,:)); z3=squeeze(z3(m,:));

figure; 
plot(lat,y1,'r'); hold on; plot(lat,y2,'g'); plot(lat,y3,'b'); 
plot(lat,z1,'r--'); hold on; plot(lat,z2,'g--'); plot(lat,z3,'b--'); 
legend('LWCF','SWCF','TTCF',3); grid on;


lat=am4g6.v0.s.lat; a=(mean(am4g6.v0.s.aa,2))'; m=5;
y1=am4g6.w0.sfc.lwnet.sea.latdis_all-am4g6.v0.sfc.lwnet.sea.latdis_all;
y2=am4g6.w0.sfc.swnet.sea.latdis_all-am4g6.v0.sfc.swnet.sea.latdis_all;
y3=y2+y1;
z1=am4g7.w0.sfc.lwnet.sea.latdis_all-am4g7.v0.sfc.lwnet.sea.latdis_all;
z2=am4g7.w0.sfc.swnet.sea.latdis_all-am4g7.v0.sfc.swnet.sea.latdis_all;
z3=z2+z1;
y1=squeeze(y1(m,:)); y2=squeeze(y2(m,:)); y3=squeeze(y3(m,:));
z1=squeeze(z1(m,:)); z2=squeeze(z2(m,:)); z3=squeeze(z3(m,:));

figure; 
plot(lat,y1,'r'); hold on; plot(lat,y2,'g'); plot(lat,y3,'b'); 
plot(lat,z1,'r--'); hold on; plot(lat,z2,'g--'); plot(lat,z3,'b--'); 
legend('LWCF','SWCF','TTCF',3); grid on;


lat=am4g6.v0.s.lat; lon=am4g6.v0.s.lon; 
m=1; y1=squeeze(am4g6.v0.toa.netrad.avg_sea(m,:,:));
m=3; y2=squeeze(am4g6.v0.toa.netrad.avg_sea(m,:,:));
m=5; y3=squeeze(am4g6.v0.toa.netrad.avg_sea(m,:,:));
m=1; z1=squeeze(am4g6.w0.toa.netrad.avg_sea(m,:,:));
m=3; z2=squeeze(am4g6.w0.toa.netrad.avg_sea(m,:,:));
m=5; z3=squeeze(am4g6.w0.toa.netrad.avg_sea(m,:,:));
m=1; y4=squeeze(am4g7.v0.toa.netrad.avg_sea(m,:,:));
m=3; y5=squeeze(am4g7.v0.toa.netrad.avg_sea(m,:,:));
m=5; y6=squeeze(am4g7.v0.toa.netrad.avg_sea(m,:,:));
m=1; z4=squeeze(am4g7.w0.toa.netrad.avg_sea(m,:,:));
m=3; z5=squeeze(am4g7.w0.toa.netrad.avg_sea(m,:,:));
m=5; z6=squeeze(am4g7.w0.toa.netrad.avg_sea(m,:,:));

pms=[ 0, 0, 1200, 500]*1.5; row=2; col=3; fsize=16;
handle=figure('Position',pms,'visible','on'); cmin=-8; cmax=8;
subplot(row,col,1);
pcolor(lon,lat,z1-y1); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,2);
pcolor(lon,lat,z2-y2); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,3);
pcolor(lon,lat,z3-y3); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,4);
pcolor(lon,lat,z4-y4); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,5);
pcolor(lon,lat,z5-y5); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,6);
pcolor(lon,lat,z6-y6); shading flat; colorbar; caxis([cmin cmax]);

lat=am4g6.v0.s.lat; lon=am4g6.v0.s.lon; 
m=1; y1=squeeze(am4g6.v0.sfc.netrad.avg_sea(m,:,:));
m=3; y2=squeeze(am4g6.v0.sfc.netrad.avg_sea(m,:,:));
m=5; y3=squeeze(am4g6.v0.sfc.netrad.avg_sea(m,:,:));
m=1; z1=squeeze(am4g6.w0.sfc.netrad.avg_sea(m,:,:));
m=3; z2=squeeze(am4g6.w0.sfc.netrad.avg_sea(m,:,:));
m=5; z3=squeeze(am4g6.w0.sfc.netrad.avg_sea(m,:,:));
m=1; y4=squeeze(am4g7.v0.sfc.netrad.avg_sea(m,:,:));
m=3; y5=squeeze(am4g7.v0.sfc.netrad.avg_sea(m,:,:));
m=5; y6=squeeze(am4g7.v0.sfc.netrad.avg_sea(m,:,:));
m=1; z4=squeeze(am4g7.w0.sfc.netrad.avg_sea(m,:,:));
m=3; z5=squeeze(am4g7.w0.sfc.netrad.avg_sea(m,:,:));
m=5; z6=squeeze(am4g7.w0.sfc.netrad.avg_sea(m,:,:));

pms=[ 0, 0, 1200, 500]*1.5; row=2; col=3; fsize=16;
handle=figure('Position',pms,'visible','on'); cmin=-4; cmax=4;
subplot(row,col,1);
pcolor(lon,lat,z1-y1); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,2);
pcolor(lon,lat,z2-y2); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,3);
pcolor(lon,lat,z3-y3); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,4);
pcolor(lon,lat,z4-y4); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,5);
pcolor(lon,lat,z5-y5); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,6);
pcolor(lon,lat,z6-y6); shading flat; colorbar; caxis([cmin cmax]);

lat=am4g6.v0.s.lat; lon=am4g6.v0.s.lon; 
m=1; y1=squeeze(am4g6.v0.sfc.netflx.avg_sea(m,:,:));
m=3; y2=squeeze(am4g6.v0.sfc.netflx.avg_sea(m,:,:));
m=5; y3=squeeze(am4g6.v0.sfc.netflx.avg_sea(m,:,:));
m=1; z1=squeeze(am4g6.w0.sfc.netflx.avg_sea(m,:,:));
m=3; z2=squeeze(am4g6.w0.sfc.netflx.avg_sea(m,:,:));
m=5; z3=squeeze(am4g6.w0.sfc.netflx.avg_sea(m,:,:));
m=1; y4=squeeze(am4g7.v0.sfc.netflx.avg_sea(m,:,:));
m=3; y5=squeeze(am4g7.v0.sfc.netflx.avg_sea(m,:,:));
m=5; y6=squeeze(am4g7.v0.sfc.netflx.avg_sea(m,:,:));
m=1; z4=squeeze(am4g7.w0.sfc.netflx.avg_sea(m,:,:));
m=3; z5=squeeze(am4g7.w0.sfc.netflx.avg_sea(m,:,:));
m=5; z6=squeeze(am4g7.w0.sfc.netflx.avg_sea(m,:,:));

pms=[ 0, 0, 1200, 500]*1.5; row=2; col=3; fsize=16;
handle=figure('Position',pms,'visible','on'); cmin=-4; cmax=4;
subplot(row,col,1);
pcolor(lon,lat,z1-y1); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,2);
pcolor(lon,lat,z2-y2); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,3);
pcolor(lon,lat,z3-y3); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,4);
pcolor(lon,lat,z4-y4); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,5);
pcolor(lon,lat,z5-y5); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,6);
pcolor(lon,lat,z6-y6); shading flat; colorbar; caxis([cmin cmax]);

lat=am4g6.v0.s.lat; lon=am4g6.v0.s.lon; 
m=1; y1=squeeze(am4g6.v0.pcp.avg_sea(m,:,:));
m=3; y2=squeeze(am4g6.v0.pcp.avg_sea(m,:,:));
m=5; y3=squeeze(am4g6.v0.pcp.avg_sea(m,:,:));
m=1; z1=squeeze(am4g6.w0.pcp.avg_sea(m,:,:));
m=3; z2=squeeze(am4g6.w0.pcp.avg_sea(m,:,:));
m=5; z3=squeeze(am4g6.w0.pcp.avg_sea(m,:,:));
m=1; y4=squeeze(am4g7.v0.pcp.avg_sea(m,:,:));
m=3; y5=squeeze(am4g7.v0.pcp.avg_sea(m,:,:));
m=5; y6=squeeze(am4g7.v0.pcp.avg_sea(m,:,:));
m=1; z4=squeeze(am4g7.w0.pcp.avg_sea(m,:,:));
m=3; z5=squeeze(am4g7.w0.pcp.avg_sea(m,:,:));
m=5; z6=squeeze(am4g7.w0.pcp.avg_sea(m,:,:));
pms=[ 0, 0, 1200, 500]*1.5; row=2; col=3; fsize=16;
handle=figure('Position',pms,'visible','on'); cmin=-1; cmax=1;
subplot(row,col,1);
pcolor(lon,lat,z1-y1); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,2);
pcolor(lon,lat,z2-y2); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,3);
pcolor(lon,lat,z3-y3); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,4);
pcolor(lon,lat,z4-y4); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,5);
pcolor(lon,lat,z5-y5); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,6);
pcolor(lon,lat,z6-y6); shading flat; colorbar; caxis([cmin cmax]);

lat=am4g6.v0.s.lat; lon=am4g6.v0.s.lon; 
m=1; y1=squeeze(am4g6.v0.atm.netrad.avg_sea(m,:,:));
m=3; y2=squeeze(am4g6.v0.atm.netrad.avg_sea(m,:,:));
m=5; y3=squeeze(am4g6.v0.atm.netrad.avg_sea(m,:,:));
m=1; z1=squeeze(am4g6.w0.atm.netrad.avg_sea(m,:,:));
m=3; z2=squeeze(am4g6.w0.atm.netrad.avg_sea(m,:,:));
m=5; z3=squeeze(am4g6.w0.atm.netrad.avg_sea(m,:,:));
m=1; y4=squeeze(am4g7.v0.atm.netrad.avg_sea(m,:,:));
m=3; y5=squeeze(am4g7.v0.atm.netrad.avg_sea(m,:,:));
m=5; y6=squeeze(am4g7.v0.atm.netrad.avg_sea(m,:,:));
m=1; z4=squeeze(am4g7.w0.atm.netrad.avg_sea(m,:,:));
m=3; z5=squeeze(am4g7.w0.atm.netrad.avg_sea(m,:,:));
m=5; z6=squeeze(am4g7.w0.atm.netrad.avg_sea(m,:,:));
pms=[ 0, 0, 1200, 500]*1.5; row=2; col=3; fsize=16;
handle=figure('Position',pms,'visible','on'); cmin=-10; cmax=10;
subplot(row,col,1);
pcolor(lon,lat,z1-y1); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,2);
pcolor(lon,lat,z2-y2); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,3);
pcolor(lon,lat,z3-y3); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,4);
pcolor(lon,lat,z4-y4); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,5);
pcolor(lon,lat,z5-y5); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,6);
pcolor(lon,lat,z6-y6); shading flat; colorbar; caxis([cmin cmax]);


pms=[ 0, 0, 1200, 800]*1.; row=2; col=2; fsize=14;
handle=figure('Position',pms,'visible','on'); cmin=-10; cmax=10;
subplot(row,col,1); x1=[5:5:140]; x2=[5:5:100]; 
plot(x1,cmlg6.v0.tsurf.ann.mmen.all,'r'); hold on;
plot(x2,cmlg7.v0.tsurf.ann.mmen.all,'b'); legend('g6','g7',4);
xlabel('year'); ylabel('surface temperature (K)');
set(gca,'FontSize',fsize);
subplot(row,col,2)
plot(x1,cmlg6.v0.toa.netrad.ann.mmen.all,'r'); hold on;
plot(x2,cmlg7.v0.toa.netrad.ann.mmen.all,'b'); hold on;
xlabel('year'); ylabel('NETRADTOA (W/m2)');
set(gca,'FontSize',fsize);
subplot(row,col,3)
plot(x1,cmlg6.v0.tsurf.ann.rmse.all,'r'); hold on;
plot(x2,cmlg7.v0.tsurf.ann.rmse.all,'b'); 
xlabel('year'); ylabel('RMSE of surface temperature (K)');
set(gca,'FontSize',fsize);
subplot(row,col,4)
plot(x1,cmlg6.v0.pcp.ann.rmse.all,'r'); hold on;
plot(x2,cmlg7.v0.pcp.ann.rmse.all,'b'); 
xlabel('year'); ylabel('RMSE of precipitation (mm/day)');
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_cml/';  expn='cml'; vname='tsurf';
printit(visfig,figpath,expn,vname);

figure; 
plot(cmlg6.v0.sfc.netrad.ann.mmen.all,'r'); hold on;
plot(cmlg7.v0.sfc.netrad.ann.mmen.all,'b'); hold on;

figure; 
plot(cmlg6.v0.sfc.netflx.ann.mmen.all,'r'); hold on;
plot(cmlg7.v0.sfc.netflx.ann.mmen.all,'b'); hold on;

figure; 
plot(cmlg6.v0.toa.lwnet.ann.mmen.all,'r'); hold on;
plot(cmlg7.v0.toa.lwnet.ann.mmen.all,'b'); hold on;

figure; 
plot(cmlg6.v0.pcp.ann.mmen.all,'r'); hold on;
plot(cmlg7.v0.pcp.ann.mmen.all,'b'); hold on;



%Plot cloud forcing, m=1(ANN),2(MAM),3(JJA),4(SON),5(DJF)
lat=am4g6.v0.s.lat; lon=am4g6.v0.s.lon; 
m=1; y1=squeeze(am4g6.v0.qal.avg_sea(m,:,:));
m=3; y2=squeeze(am4g6.v0.qal.avg_sea(m,:,:));
m=5; y3=squeeze(am4g6.v0.qal.avg_sea(m,:,:));
m=1; z1=squeeze(am4g7.v0.qal.avg_sea(m,:,:));
m=3; z2=squeeze(am4g7.v0.qal.avg_sea(m,:,:));
m=5; z3=squeeze(am4g7.v0.qal.avg_sea(m,:,:));
pms=[ 0, 0, 1200, 500]*1.5; row=2; col=3; fsize=16;
handle=figure('Position',pms,'visible','on');cmin=-10;cmax=10;
subplot(row,col,1);
pcolor(lon,lat,y1); shading flat; colorbar; caxis([0 100]);
subplot(row,col,2);
pcolor(lon,lat,y2); shading flat; colorbar; caxis([0 100]);
subplot(row,col,3);
pcolor(lon,lat,y3); shading flat; colorbar; caxis([0 100]);
subplot(row,col,4);
pcolor(lon,lat,z1-y1); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,5);
pcolor(lon,lat,z2-y2); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,6);
pcolor(lon,lat,z3-y3); shading flat; colorbar; caxis([cmin cmax]);


%Plot cloud forcing, m=1(ANN),2(MAM),3(JJA),4(SON),5(DJF)
lat=am4g6.v0.s.lat; lon=am4g6.v0.s.lon; 
m=1; y1=-squeeze(am4g6.v0.sfc.lwnet.avg_sea(m,:,:));
m=3; y2=-squeeze(am4g6.v0.sfc.lwnet.avg_sea(m,:,:));
m=5; y3=-squeeze(am4g6.v0.sfc.lwnet.avg_sea(m,:,:));
m=1; z1=-squeeze(am4g7.v0.sfc.lwnet.avg_sea(m,:,:));
m=3; z2=-squeeze(am4g7.v0.sfc.lwnet.avg_sea(m,:,:));
m=5; z3=-squeeze(am4g7.v0.sfc.lwnet.avg_sea(m,:,:));
pms=[ 0, 0, 1200, 500]*1.5; row=2; col=3; fsize=16;
handle=figure('Position',pms,'visible','on'); cmin=-4; cmax=4;
subplot(row,col,1);
pcolor(lon,lat,y1); shading flat; colorbar; caxis([20 140]);
subplot(row,col,2);
pcolor(lon,lat,y2); shading flat; colorbar; caxis([20 140]);
subplot(row,col,3);
pcolor(lon,lat,y3); shading flat; colorbar; caxis([20 140]);
subplot(row,col,4);
pcolor(lon,lat,z1-y1); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,5);
pcolor(lon,lat,z2-y2); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,6);
pcolor(lon,lat,z3-y3); shading flat; colorbar; caxis([cmin cmax]);


lat=am4g6.v0.s.lat; lon=am4g6.v0.s.lon; 
m=1; y1=squeeze(am4g6.v0.sfc.swnet.avg_sea(m,:,:));
m=3; y2=squeeze(am4g6.v0.sfc.swnet.avg_sea(m,:,:));
m=5; y3=squeeze(am4g6.v0.sfc.swnet.avg_sea(m,:,:));
m=1; z1=squeeze(am4g7.v0.sfc.swnet.avg_sea(m,:,:));
m=3; z2=squeeze(am4g7.v0.sfc.swnet.avg_sea(m,:,:));
m=5; z3=squeeze(am4g7.v0.sfc.swnet.avg_sea(m,:,:));
pms=[ 0, 0, 1200, 500]*1.5; row=2; col=3; fsize=16;
handle=figure('Position',pms,'visible','on'); cmin=-4; cmax=4;
subplot(row,col,1);
pcolor(lon,lat,y1); shading flat; colorbar; caxis([20 250]);
subplot(row,col,2);
pcolor(lon,lat,y2); shading flat; colorbar; caxis([20 250]);
subplot(row,col,3);
pcolor(lon,lat,y3); shading flat; colorbar; caxis([20 250]);
subplot(row,col,4);
pcolor(lon,lat,z1-y1); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,5);
pcolor(lon,lat,z2-y2); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,6);
pcolor(lon,lat,z3-y3); shading flat; colorbar; caxis([cmin cmax]);

lat=am4g6.v0.s.lat; lon=am4g6.v0.s.lon; 
m=1; y1=squeeze(am4g6.v0.sfc.netrad.avg_sea(m,:,:));
m=3; y2=squeeze(am4g6.v0.sfc.netrad.avg_sea(m,:,:));
m=5; y3=squeeze(am4g6.v0.sfc.netrad.avg_sea(m,:,:));
m=1; z1=squeeze(am4g7.v0.sfc.netrad.avg_sea(m,:,:));
m=3; z2=squeeze(am4g7.v0.sfc.netrad.avg_sea(m,:,:));
m=5; z3=squeeze(am4g7.v0.sfc.netrad.avg_sea(m,:,:));
pms=[ 0, 0, 1200, 500]*1.5; row=2; col=3; fsize=16;
handle=figure('Position',pms,'visible','on'); cmin=-2; cmax=2;
subplot(row,col,1);
pcolor(lon,lat,y1); shading flat; colorbar; caxis([-20 200]);
subplot(row,col,2);
pcolor(lon,lat,y2); shading flat; colorbar; caxis([-20 200]);
subplot(row,col,3);
pcolor(lon,lat,y3); shading flat; colorbar; caxis([-20 200]);
subplot(row,col,4);
pcolor(lon,lat,z1-y1); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,5);
pcolor(lon,lat,z2-y2); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,6);
pcolor(lon,lat,z3-y3); shading flat; colorbar; caxis([cmin cmax]);

lat=am4g6.v0.s.lat; lon=am4g6.v0.s.lon; 
m=1; y1=squeeze(am4g6.v0.sfc.netflx.avg_sea(m,:,:));
m=3; y2=squeeze(am4g6.v0.sfc.netflx.avg_sea(m,:,:));
m=5; y3=squeeze(am4g6.v0.sfc.netflx.avg_sea(m,:,:));
m=1; z1=squeeze(am4g7.v0.sfc.netflx.avg_sea(m,:,:));
m=3; z2=squeeze(am4g7.v0.sfc.netflx.avg_sea(m,:,:));
m=5; z3=squeeze(am4g7.v0.sfc.netflx.avg_sea(m,:,:));
pms=[ 0, 0, 1200, 500]*1.5; row=2; col=3; fsize=16;
handle=figure('Position',pms,'visible','on'); cmin=-2; cmax=2;
subplot(row,col,1);
pcolor(lon,lat,y1); shading flat; colorbar; caxis([-100 100]);
subplot(row,col,2);
pcolor(lon,lat,y2); shading flat; colorbar; caxis([-100 100]);
subplot(row,col,3);
pcolor(lon,lat,y3); shading flat; colorbar; caxis([-100 100]);
subplot(row,col,4);
pcolor(lon,lat,z1-y1); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,5);
pcolor(lon,lat,z2-y2); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,6);
pcolor(lon,lat,z3-y3); shading flat; colorbar; caxis([cmin cmax]);

lat=am4g6.v0.s.lat; lon=am4g6.v0.s.lon; 
m=1; y1=squeeze(am4g6.v0.toa.netrad.avg_sea(m,:,:));
m=3; y2=squeeze(am4g6.v0.toa.netrad.avg_sea(m,:,:));
m=5; y3=squeeze(am4g6.v0.toa.netrad.avg_sea(m,:,:));
m=1; z1=squeeze(am4g7.v0.toa.netrad.avg_sea(m,:,:));
m=3; z2=squeeze(am4g7.v0.toa.netrad.avg_sea(m,:,:));
m=5; z3=squeeze(am4g7.v0.toa.netrad.avg_sea(m,:,:));
pms=[ 0, 0, 1200, 500]*1.5; row=2; col=3; fsize=16;
handle=figure('Position',pms,'visible','on'); cmin=-2; cmax=2;
subplot(row,col,1);
pcolor(lon,lat,y1); shading flat; colorbar; caxis([-100 100]);
subplot(row,col,2);
pcolor(lon,lat,y2); shading flat; colorbar; caxis([-100 100]);
subplot(row,col,3);
pcolor(lon,lat,y3); shading flat; colorbar; caxis([-100 100]);
subplot(row,col,4);
pcolor(lon,lat,z1-y1); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,5);
pcolor(lon,lat,z2-y2); shading flat; colorbar; caxis([cmin cmax]);
subplot(row,col,6);
pcolor(lon,lat,z3-y3); shading flat; colorbar; caxis([cmin cmax]);


axis([1875 2005 -90 90]); set(gca,'FontSize',fsize);
title('coupled simulation','FontSize',fsize); 
ylabel('latitude','FontSize',fsize);
subplot(row,col,2);
pcolor(t4,lat,tref_cm3_h0); shading flat; colorbar; caxis([-2 3]);
axis([1875 2005 -90 90]); set(gca,'FontSize',fsize);
subplot(row,col,3);
pcolor(t5,lat,tref_am4); shading flat; colorbar; caxis([-2 3]);
axis([1875 2005 -90 90]); set(gca,'FontSize',fsize);
xlabel('years','FontSize',fsize);
title('AMIP','FontSize',fsize);
ylabel('latitude','FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);

z2=am4.w0.sfc.lwnet.sea.latdis_all(k,:); s.s1='AM4g6';
z3=am4.v1.sfc.lwnet.sea.latdis_all(k,:);
z4=am4.w1.sfc.lwnet.sea.latdis_all(k,:); s.s2='AM4g7';
pms=[ 0, 0, 1000, 800]; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(lat, z1, 'k',  'LineWidth',lw); hold on; 
plot(lat, z2, 'r',  'LineWidth',lw);
plot(lat, z3, 'k--','LineWidth',lw); hold on; 
plot(lat, z4, 'r--','LineWidth',lw);

lat=am4.v0.s.lat; k=5;
z1=am4.v0.sfc.lwnet.sea.latdis_all(k,:)
z2=am4.w0.sfc.lwnet.sea.latdis_all(k,:); s.s1='AM4g6';
z3=am4.v1.sfc.lwnet.sea.latdis_all(k,:);
z4=am4.w1.sfc.lwnet.sea.latdis_all(k,:); s.s2='AM4g7';
pms=[ 0, 0, 1000, 800]; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(lat, z1, 'k',  'LineWidth',lw); hold on; 
plot(lat, z2, 'r',  'LineWidth',lw);
plot(lat, z3, 'k--','LineWidth',lw); hold on; 
plot(lat, z4, 'r--','LineWidth',lw);

lat=am4.v0.s.lat; k=5;
z1=am4.v0.sfc.swnet.sea.latdis_all(k,:)
z2=am4.w0.sfc.swnet.sea.latdis_all(k,:); s.s1='AM4g6';
z3=am4.v1.sfc.swnet.sea.latdis_all(k,:);
z4=am4.w1.sfc.swnet.sea.latdis_all(k,:); s.s2='AM4g7';
pms=[ 0, 0, 1000, 800]; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(lat, z1, 'k',  'LineWidth',lw); hold on; 
plot(lat, z2, 'r',  'LineWidth',lw);
plot(lat, z3, 'k--','LineWidth',lw); hold on; 
plot(lat, z4, 'r--','LineWidth',lw);

lat=am4.v0.s.lat; k=5;
z1=am4.v0.qal.sea.latdis_all(k,:)
z2=am4.w0.qal.sea.latdis_all(k,:); s.s1='AM4g6';
z3=am4.v1.qal.sea.latdis_all(k,:);
z4=am4.w1.qal.sea.latdis_all(k,:); s.s2='AM4g7';
pms=[ 0, 0, 1000, 800]; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(lat, z1, 'k',  'LineWidth',lw); hold on; 
plot(lat, z2, 'r',  'LineWidth',lw);
plot(lat, z3, 'k--','LineWidth',lw); hold on; 
plot(lat, z4, 'r--','LineWidth',lw);



expn='CM4_c96L32_am4g6_2000_sis2_lowmix';yr1='0001';yr2='0040';syr=1;nyr=40;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='CM4_c96L32_am4g6_2000_sis2_scatter_MSTAR1.2_KHTR300';yr1='0001';yr2='0050';syr=1;nyr=50;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);


expn='AM4OM2F_c96l32_am4g7r3_2000climo';yr1='0001';yr2='0090';syr=1;nyr=90;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='AM4OM2F_c96l32_am4g6_1860climo';yr1='0001';yr2='0140';syr=1;nyr=140;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4OM2F_c96l32_am4g6_2000climo';yr1='0001';yr2='0140';syr=1;nyr=140;mod='c96'
v1=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4OM2F_c96l32_am4g6_1860climo_hist0';yr1='1861';yr2='2010';syr=1;nyr=150;mod='c96'
v2=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L32_am4g6_longamip';yr1='1871';yr2='2010';syr=1;nyr=140;mod='c96'
v3=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L32_am4g6_longamip_1860rad';yr1='1871';yr2='2010';syr=1;nyr=140;mod='c96'
v4=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L32_am4g5r5_1860climo';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L32_am4g5r5_2000aero'; yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v1=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='CM3Z_D1_1860-2005_AllForc_H1';yr1='1860';yr2='2005';syr=1;nyr=146;mod='c48'
v=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM3Z_Control-1860_D1';yr1='0001';yr2='0100';syr=1;nyr=100;
v=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c48L48_am3p9_1860_ext';yr1='1870';yr2='2005';syr=1;nyr=136;mod='c48';
v1=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c48L48_am3p9_ext';yr1='1870';yr2='2005';syr=1;nyr=136;mod='c48';
v1=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
mod='c96';
expn='AM4OM2F_c96l32_am4g5r11_1860climo';yr1='0001';yr2='0230';syr=1;nyr=230;
v1=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4OM2F_c96l32_am4g5r11_2000climo';yr1='0001';yr2='0140';syr=1;nyr=140;
v1=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='AM4OM2F_c96l32_am4g5r11_1860climo_hist0'; yr1='1861';yr2='2015';syr=1;nyr=150;
v2=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4OM2F_c96l32_am4g5r11_1860climo_hist';  yr1='1861';yr2='2010';syr=1;nyr=150;
v2=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4OM2F_c96l32_am4g5r11_1860climo_hist2'; yr1='1861';yr2='2010';syr=1;nyr=150;
v2=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4OM2F_c96l32_am4g5r11_1860climo_hist3'; yr1='1861';yr2='2010';syr=1;nyr=150;
v2=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L32_am4g5r2_1860rad';yr1='1871';yr2='2010';syr=1;nyr=140;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L32_am4g5r2';        yr1='1871';yr2='2010';syr=1;nyr=140;
v1=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%x=-v0.toa.netrad.ts.org_ann; y=v0.tref.ts.org_ann; x=x-mean(x); y=y-mean(y);
%figure; plot(x, y,'b*'); hold on; x0=[-2:0.1:2]; c=polyfit(x,y,1); y0=x0*c(1)+c(2); plot(x0,y0); 
%figure;plot(y, x,'b*'); hold on; x0=[-2:0.1:2];c=polyfit(y,x,1); y0=x0*c(1)+c(2); plot(x0,y0);
expn='CM4_c96L32_am4g5_2000_sis2_low_mixing3';yr1='0001';yr2='0100';syr=1;nyr=100;
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_c96L32_am4g5r2_2000_sis2_low_mixing3b';yr1='0001';yr2='0100';syr=1;nyr=100;
v1=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_c96L32_am4g5r2_1860_sis2_low_mixing3b';yr1='0001';yr2='0060';syr=1;nyr=60;
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_c96L32_am4g5r2_abrupt2XCO2_sis2_low_mixing3b_vs2';yr1='0001';yr2='0060';syr=1;nyr=60;
v1=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='AM4OM2F_c96l32_am4g5r11_1860climo_hist'; yr1='1861';yr2='2010';syr=1;nyr=150;
v1=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4OM2F_c96l32_am4g5r11_1860climo_hist2';yr1='1861';yr2='2010';syr=1;nyr=150;
v2=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4OM2F_c96l32_am4g5r11_1860climo_hist3';yr1='1861';yr2='2010';syr=1;nyr=150;
v3=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='AM4OM2F_c96l32_am4g5r11_2000climo';yr1='0001';yr2='0140';syr=1;nyr=140;
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4OM2F_c96l32_am4g5r11_2000climo_1pct';yr1='0061';yr2='0140';syr=1;nyr=80;
v1=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4OM2F_c96l32_am4g5r11_1860climo';yr1='0001';yr2='0140';syr=1;nyr=140;
v2=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4OM2F_c96l32_am4g5r11_1860climo_4xCO2';yr1='0061';yr2='0150';syr=1;nyr=90;
v3=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='AM4OM2F_c96l32_am4g5_1860climo';yr1='0001';yr2='0140';syr=1;nyr=140;
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4OM2F_c96l32_am4g5_1860climo_1pct';yr1='0061';yr2='0140';syr=1;nyr=80;
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='AM4OM2F_c96l32_am4g5_1860climo_4xCO2';yr1='0061';yr2='0150';syr=1;nyr=90;
v1=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4OM2F_c96l32_am4g5_2000climo';yr1='0001';yr2='0140';syr=1;nyr=140;
v2=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4OM2F_c96l32_am4g5_2000climo_1pct';yr1='0061';yr2='0140';syr=1;nyr=80;
v3=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L32_am4g5r2_1860climo';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L32_am4g5r2_2000aero'; yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L32_am4g5r2_2000climo';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L32_am4g5r2_2000climo_p2K';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/awg/ulm/'; opt=2
expn='CM2.5_A_Control-1990_C03';yr1='0001';yr2='0100';syr=1;nyr=100;mod='c180'
v=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);


%%%start analysis%%%================
%load CM2.5FLOR and previous analysis matlab
pp='/'; region='global'; %region='nhextr';
dr=strcat('_',region,'_tsana.mat'); 
tpath='/archive/Ming.Zhao/awgom2/ulm_201505/';
expn='AM4OM2F_c96l32_am4g6_1860climo';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.v0=v;
expn='AM4OM2F_c96l32_am4g7r0_1860climo';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.v1=v;

figure; 
plot(cml.v0.tref.ann.mmen.all,'r'); hold on;
plot(cml.v1.tref.ann.mmen.all,'b'); hold on;

figure; 
plot(cml.v0.toa.netrad.ann.mmen.all,'r'); hold on;
plot(cml.v1.toa.netrad.ann.mmen.all,'b'); hold on;

expn='AM4OM2F_c96l32_am4g6_1860climo_hist0';fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.h0=v;
expn='c96L32_am4g6_longamip';               fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.h0=v;
expn='c96L32_am4g6_longamip_1860rad';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v0=v;
tpath='/archive/Ming.Zhao/awglg/ulm/';
expn='CM3Z_Control-1860_D1';              fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm3.v0=v;
expn='CM3Z_D1_1860-2005_AllForc_H1';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm3.h0=v;
expn='c48L48_am3p9_ext';                  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.h0=v;
expn='c48L48_am3p9_1860_ext';             fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v0=v;

expn='AM4OM2F_c96l32_am4g5r11_1860climo'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);old.v0=v;
expn='AM4OM2F_c96l32_am4g5r11_2000climo'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);old.w0=v;
expn='AM4OM2F_c96l32_am4g5r11_1860climo_hist0';fn=strcat(tpath,expn,pp,expn,dr);load(fn);old.h0=v;
expn='AM4OM2F_c96l32_am4g5r11_1860climo_hist3';fn=strcat(tpath,expn,pp,expn,dr);load(fn);old.h1=v;
expn='c96L32_am4g5r2';               fn=strcat(tpath,expn,pp,expn,dr);load(fn);old.ah0=v;
expn='c96L32_am4g5r2_1860rad';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);old.av0=v;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 800]*1.5; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot([1:140]+1800, cml.w0.tref.ts.org_ann,'r','LineWidth',lw); hold on;
plot([1:140]+1800, cml.v0.tref.ts.org_ann,'b','LineWidth',lw); hold on;
plot([1:150]+1860, cml.h0.tref.ts.org_ann,'k','LineWidth',lw); hold on;
plot([1:140]+1870, am4.h0.tref.ts.org_ann,'m','LineWidth',lw); hold on;
plot([1:140]+1870, am4.v0.tref.ts.org_ann,'c','LineWidth',lw); hold on;
plot([1:140]+1800, old.w0.tref.ts.org_ann,'r--'); hold on;
plot([1:230]+1800, old.v0.tref.ts.org_ann,'b--'); hold on;
plot([1:150]+1860, old.h0.tref.ts.org_ann,'k--'); hold on;
plot([1:140]+1870, old.ah0.tref.ts.org_ann,'m--'); hold on;
plot([1:140]+1870, old.av0.tref.ts.org_ann,'c--'); hold on;
xlabel('years','FontSize',fsize+6); 
ylabel('surface air temperature (C)','FontSize',fsize+6); 
axis([1800 2010 12 14.5]); set(gca,'FontSize',fsize); 
legend('AM4OM2F-g6-2000','AM4OM2F-g6-1860','AM4OM2F-g6-historical',...
       'AM4g6-AMIP','AM4g6-AMIP(1860F)',...
       'AM4OM2F-g5r2-2000','AM4OM2F-g5r2-1860','AM4OM2F-g5r2-historical',...
       'AM4g5r2-AMIP','AM4g5r2-AMIP(1860F)',4);
visfig='off'; figpath='./fig_cml/';  expn='AM4OM2F-g6'; vname='tref';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 800]*1.5; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot([1:140]+1800, cml.w0.tref.ts.org_ann_f,'r','LineWidth',lw); hold on;
plot([1:140]+1800, cml.v0.tref.ts.org_ann_f,'b','LineWidth',lw); hold on;
plot([1:150]+1860, cml.h0.tref.ts.org_ann_f,'k','LineWidth',lw); hold on;
plot([1:140]+1870, am4.h0.tref.ts.org_ann_f,'m','LineWidth',lw); hold on;
plot([1:140]+1870, am4.v0.tref.ts.org_ann_f,'c','LineWidth',lw); hold on;
plot([1:140]+1800, old.w0.tref.ts.org_ann_f,'r--'); hold on;
plot([1:230]+1800, old.v0.tref.ts.org_ann_f,'b--'); hold on;
plot([1:150]+1860, old.h0.tref.ts.org_ann_f,'k--'); hold on;
plot([1:140]+1870, old.ah0.tref.ts.org_ann_f,'m--'); hold on;
plot([1:140]+1870, old.av0.tref.ts.org_ann_f,'c--'); hold on;
xlabel('years','FontSize',fsize+6); 
ylabel('surface air temperature (C)','FontSize',fsize+6);
axis([1800 2010 12 14.5]); set(gca,'FontSize',fsize); 
legend('AM4OM2F-g6-2000','AM4OM2F-g6-1860','AM4OM2F-g6-historical',...
       'AM4g6-AMIP','AM4g6-AMIP(1860F)',...
       'AM4OM2F-g5r2-2000','AM4OM2F-g5r2-1860','AM4OM2F-g5r2-historical',...
       'AM4g5r2-AMIP','AM4g5r2-AMIP(1860F)',4);
visfig='off'; figpath='./fig_cml/';  expn='AM4OM2F-g6'; vname='tref_f';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 800]*1.5; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot([1:140]+1800, cml.w0.toa.netrad.ts.org_ann,'r','LineWidth',lw); hold on;
plot([1:140]+1800, cml.v0.toa.netrad.ts.org_ann,'b','LineWidth',lw); hold on;
plot([1:150]+1860, cml.h0.toa.netrad.ts.org_ann,'k','LineWidth',lw); hold on;
plot([1:140]+1870, am4.h0.toa.netrad.ts.org_ann,'m','LineWidth',lw); hold on;
plot([1:140]+1870, am4.v0.toa.netrad.ts.org_ann,'c','LineWidth',lw); hold on;
plot([1:140]+1800, old.w0.toa.netrad.ts.org_ann,'r--'); hold on;
plot([1:230]+1800, old.v0.toa.netrad.ts.org_ann,'b--'); hold on;
plot([1:150]+1860, old.h0.toa.netrad.ts.org_ann,'k--'); hold on;
plot([1:140]+1870, old.ah0.toa.netrad.ts.org_ann,'m--'); hold on;
plot([1:140]+1870, old.av0.toa.netrad.ts.org_ann,'c--'); hold on;
xlabel('years','FontSize',fsize+6); 
ylabel('TOA net radiative flux','FontSize',fsize+6);
axis([1800 2010 -3 2.5]); set(gca,'FontSize',fsize); 
legend('AM4OM2F-g6-2000','AM4OM2F-g6-1860','AM4OM2F-g6-historical',...
       'AM4g6-AMIP','AM4g6-AMIP(1860F)',...
       'AM4OM2F-g5r2-2000','AM4OM2F-g5r2-1860','AM4OM2F-g5r2-historical',...
       'AM4g5r2-AMIP','AM4g5r2-AMIP(1860F)',3);
visfig='off'; figpath='./fig_cml/';  exp='cml'; vname='netradtoa';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 800]*1.5; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot([1:140]+1800, cml.w0.toa.netrad.ts.org_ann_f,'r','LineWidth',lw); hold on;
plot([1:140]+1800, cml.v0.toa.netrad.ts.org_ann_f,'b','LineWidth',lw); hold on;
plot([1:150]+1860, cml.h0.toa.netrad.ts.org_ann_f,'k','LineWidth',lw); hold on;
plot([1:140]+1870, am4.h0.toa.netrad.ts.org_ann_f,'m','LineWidth',lw); hold on;
plot([1:140]+1870, am4.v0.toa.netrad.ts.org_ann_f,'c','LineWidth',lw); hold on;
plot([1:140]+1800, old.w0.toa.netrad.ts.org_ann_f,'r--'); hold on;
plot([1:230]+1800, old.v0.toa.netrad.ts.org_ann_f,'b--'); hold on;
plot([1:150]+1860, old.h0.toa.netrad.ts.org_ann_f,'k--'); hold on;
plot([1:140]+1870, old.ah0.toa.netrad.ts.org_ann_f,'m--'); hold on;
plot([1:140]+1870, old.av0.toa.netrad.ts.org_ann_f,'c--'); hold on;
xlabel('years','FontSize',fsize+6); 
ylabel('TOA net radiative flux','FontSize',fsize+6);
axis([1800 2010 -1.8 2.2]); set(gca,'FontSize',fsize); 
legend('AM4OM2F-g6-2000','AM4OM2F-g6-1860','AM4OM2F-g6-historical',...
       'AM4g6-AMIP','AM4g6-AMIP(1860F)',...
       'AM4OM2F-g5r2-2000','AM4OM2F-g5r2-1860','AM4OM2F-g5r2-historical',...
       'AM4g5r2-AMIP','AM4g5r2-AMIP(1860F)',3);
visfig='off'; figpath='./fig_cml/';  exp='cml'; vname='netradtoa_f';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g=readsat_giss(); 
%yr1=1951; yr2=1980; vname='SAT_1951_1980';
yr1=1881; yr2=1920; vname='SAT_1881_1920';
id=(g.year>=yr1)&(g.year<=yr2); g.gb=g.gb-mean(g.gb(id));
expn='cmlo'; s=cml.v0.s; s.xl='year';
s.s0='OBS(GISS)';               s.c0='r-';
s.s1='AM4OM2F-g6-historical';   s.c1='k-';
s.s2='AM4OM2F-g5r2-historical'; s.c2='k--';
s.s3='CM3';                     s.c3='b-';
s.s4='AM4-AMIP';                s.c4='c-';
t0=[1861:1860+80]; t1=[1861:2010]; t2=[1861:2010];%for am4om2f
x0=cml.v0.tref.ts.org_ann(61:end); c=polyfit(t0,x0,1); 
y00=t1*c(1)+c(2); y1=cml.h0.tref.ts.org_ann-y00;
x0=cml.v0.tref.ts.org_ann(61:140); c=polyfit(t0,x0,1); 
y00=t2*c(1)+c(2); y2=old.h0.tref.ts.org_ann-y00;
t0=[1860:1959]; t3=[1860:2005]; %for cm3
x0=cm3.v0.tref.ts.org_ann; c=polyfit(t0,x0,1);
y00=t3*c(1)+c(2); y3=cm3.h0.tref.ts.org_ann-y00;
t4=[1871:2010];   y4=am4.h0.tref.ts.org_ann;  %am4
id=(t1>=yr1)&(t1<=yr2); y1=y1-mean(y1(id)); 
id=(t2>=yr1)&(t2<=yr2); y2=y2-mean(y2(id));
id=(t3>=yr1)&(t3<=yr2); y3=y3-mean(y3(id));
id=(t4>=yr1)&(t4<=yr2); y4=y4-mean(y4(id));
pms=[ 0, 0, 1100, 800]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t1,y1,s.c1,'LineWidth',lw); hold on;
plot(t2,y2,s.c2,'LineWidth',lw/2);
plot(t3,y3,s.c3,'LineWidth',lw);
plot(t4,y4,s.c4,'LineWidth',lw);
plot(g.year,g.gb,s.c0,'LineWidth',lw);
plot([yr1 yr1],[-2 2],'k:'); plot([yr2 yr2],[-2 2],'k:');
plot([1860 2010],[0 0], 'k:');
xlabel('years','FontSize',fsize); 
ylabel('surface air temperature (C)','FontSize',fsize);
axis([1870 2010 -1 1.5]); set(gca,'FontSize',fsize);
legend(s.s1,s.s2,s.s3,s.s4,s.s0,2); 
title('Surface air temperature from historical simulations')
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g=readsat_giss(); 
wsize=5; b=ones(1,wsize)/wsize; a_f=filter(b,1,g.gb);
a_f(1:wsize)=g.gb(1:wsize); g.gb_f=a_f;
%yr1=1951; yr2=1980; vname='SAT_1951_1980';
yr1=1881; yr2=1920; vname='SAT_1881_1920_f';
id=(g.year>=yr1)&(g.year<=yr2); g.gb_f=g.gb_f-mean(g.gb_f(id));
expn='cmlo'; s=cml.v0.s; s.xl='year';
s.s0='OBS(GISS)';               s.c0='r-';
s.s1='AM4OM2F-g6-historical';   s.c1='k-';
s.s2='AM4OM2F-g5r2-historical'; s.c2='k--';
s.s3='CM3';                     s.c3='b-';
s.s4='AM4-AMIP';                s.c4='c-';
t0=[1861:1860+80]; t1=[1861:2010]; t2=[1861:2010];%for am4om2f
x0=cml.v0.tref.ts.org_ann_f(61:end); c=polyfit(t0,x0,1); 
y00=t1*c(1)+c(2); y1=cml.h0.tref.ts.org_ann_f-y00;
x0=cml.v0.tref.ts.org_ann_f(61:140); c=polyfit(t0,x0,1); 
y00=t2*c(1)+c(2); y2=old.h0.tref.ts.org_ann_f-y00;
t0=[1860:1959]; t3=[1860:2005]; %for cm3
x0=cm3.v0.tref.ts.org_ann_f; c=polyfit(t0,x0,1);
y00=t3*c(1)+c(2); y3=cm3.h0.tref.ts.org_ann_f-y00;
t4=[1871:2010];   y4=am4.h0.tref.ts.org_ann_f;  %am4
id=(t1>=yr1)&(t1<=yr2); y1=y1-mean(y1(id)); 
id=(t2>=yr1)&(t2<=yr2); y2=y2-mean(y2(id));
id=(t3>=yr1)&(t3<=yr2); y3=y3-mean(y3(id));
id=(t4>=yr1)&(t4<=yr2); y4=y4-mean(y4(id));
pms=[ 0, 0, 1100, 800]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t1,y1,s.c1,'LineWidth',lw); hold on;
plot(t2,y2,s.c2,'LineWidth',lw/2);
plot(t3,y3,s.c3,'LineWidth',lw);
plot(t4,y4,s.c4,'LineWidth',lw);
plot(g.year,g.gb_f,s.c0,'LineWidth',lw);
plot([yr1 yr1],[-2 2],'k:'); plot([yr2 yr2],[-2 2],'k:');
plot([1860 2010],[0 0], 'k:');
xlabel('years','FontSize',fsize); 
ylabel('surface air temperature (C)','FontSize',fsize);
axis([1870 2010 -1 1.5]); set(gca,'FontSize',fsize);
legend(s.s1,s.s2,s.s3,s.s4,s.s0,2); 
title('Surface air temperature from historical simulations')
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='amip'; s=amp.v0.s; s.xl='year';
s.s1='AM4g6 net (PD-PI)';  s.c1='k-';
s.s2='AM4g6 LW (PD-PI)';   s.c2='r-';
s.s3='AM4g6 SW (PD-PI)';   s.c3='b-';
s.s4='AM3 net (PD-PI)'; s.c4='k--';
s.s5='AM3 LW (PD-PI)';  s.c5='r--';
s.s6='AM3 SW (PD-PI)';  s.c6='b--';
vname='radtoa'; t0=[1871:2010]; t1=[1870:2005];
y0=am4.h0.toa.netrad.ts.org_ann  -am4.v0.toa.netrad.ts.org_ann;
y1=am4.h0.toa.lwnet.ts.org_ann   -am4.v0.toa.lwnet.ts.org_ann;
y2=am4.h0.toa.swnet.ts.org_ann   -am4.v0.toa.swnet.ts.org_ann;
z0=am3.h0.toa.netrad.ts.org_ann  -am3.v0.toa.netrad.ts.org_ann;
z1=am3.h0.toa.lwnet.ts.org_ann   -am3.v0.toa.lwnet.ts.org_ann;
z2=am3.h0.toa.swnet.ts.org_ann   -am3.v0.toa.swnet.ts.org_ann;
%z0=old.a0.toa.netrad.ts.org_ann  -old.a1.toa.netrad.ts.org_ann;
%z1=old.a0.toa.lwnet.ts.org_ann   -old.a1.toa.lwnet.ts.org_ann;
%z2=old.a0.toa.swnet.ts.org_ann   -old.a1.toa.swnet.ts.org_ann;
pms=[ 0, 0, 1100, 800]*1.2; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0, y0,s.c1, 'LineWidth',lw); hold on; 
plot(t0,-y1,s.c2, 'LineWidth',lw); hold on; 
plot(t0, y2,s.c3, 'LineWidth',lw); hold on; 
plot(t1, z0,s.c4, 'LineWidth',lw); hold on; 
plot(t1,-z1,s.c5, 'LineWidth',lw); hold on; 
plot(t1, z2,s.c6, 'LineWidth',lw); hold on; 
axis([1870 2010 -5 3]); set(gca,'FontSize',fsize);
legend(s.s1,s.s2,s.s3,s.s4,s.s5,s.s6,0)
title('TOA radiative flux difference between AMIP and AMIP with fixed 1860 radiation')
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='amip'; s=amp.v0.s; s.xl='year';
s.s1='AM4g6 net (PD-PI)';  s.c1='k-';
s.s2='AM4g6 LW (PD-PI)';   s.c2='r-';
s.s3='AM4g6 SW (PD-PI)';   s.c3='b-';
s.s4='AM3 net (PD-PI)';    s.c4='k--';
s.s5='AM3 LW (PD-PI)';     s.c5='r--';
s.s6='AM3 SW (PD-PI)';     s.c6='b--';
vname='radtoa_f'; t0=[1871:2010]; t1=[1870:2005];
y0=am4.h0.toa.netrad.ts.org_ann_f  -am4.v0.toa.netrad.ts.org_ann_f;
y1=am4.h0.toa.lwnet.ts.org_ann_f   -am4.v0.toa.lwnet.ts.org_ann_f;
y2=am4.h0.toa.swnet.ts.org_ann_f   -am4.v0.toa.swnet.ts.org_ann_f;
z0=am3.h0.toa.netrad.ts.org_ann_f  -am3.v0.toa.netrad.ts.org_ann_f;
z1=am3.h0.toa.lwnet.ts.org_ann_f   -am3.v0.toa.lwnet.ts.org_ann_f;
z2=am3.h0.toa.swnet.ts.org_ann_f   -am3.v0.toa.swnet.ts.org_ann_f;
%z0=old.a0.toa.netrad.ts.org_ann_f  -old.a1.toa.netrad.ts.org_ann_f;
%z1=old.a0.toa.lwnet.ts.org_ann_f   -old.a1.toa.lwnet.ts.org_ann_f;
%z2=old.a0.toa.swnet.ts.org_ann_f   -old.a1.toa.swnet.ts.org_ann_f;
pms=[ 0, 0, 1100, 800]*1.2; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0, y0,s.c1, 'LineWidth',lw); hold on; 
plot(t0,-y1,s.c2, 'LineWidth',lw); hold on; 
plot(t0, y2,s.c3, 'LineWidth',lw); hold on; 
plot(t1, z0,s.c4, 'LineWidth',lw); hold on; 
plot(t1,-z1,s.c5, 'LineWidth',lw); hold on; 
plot(t1, z2,s.c6, 'LineWidth',lw); hold on; 
axis([1870 2010 -5 3]); set(gca,'FontSize',fsize);
legend(s.s1,s.s2,s.s3,s.s4,s.s5,s.s6,0)
title('TOA radiative flux difference between AMIP and AMIP with fixed 1860 radiation')
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot([1:65], cml.v1.toa.netrad.ts.org_ann,'b'); hold on;
plot([1:55], cml.w1.toa.netrad.ts.org_ann,'r'); hold on;
plot([1:230],cml.v0.toa.netrad.ts.org_ann,'c--'); hold on;
plot([1:140],cml.w0.toa.netrad.ts.org_ann,'m--'); hold on;
xlabel('years'); ylabel('NETRADTOA (W/m2)');
legend('AM4OM2F-g6-2000',  'AM4OM2F-g6-1860',...
       'AM4OM2F-g5r2-2000','AM4OM2F-g5r2-1860');
visfig='off'; figpath='./fig_cml/';  exp='cml'; vname='netradtoa';
printit(visfig,figpath,expn,vname);


tpath='/archive/Ming.Zhao/awglg/ulm/';
expn='c48L48_am3p9_1860_ext';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v0=v;
expn='c48L48_am3p9_ext';            fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v1=v;
expn='c96L32_am4g5r2_1860rad';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v0=v;
expn='c96L32_am4g5r2';              fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v1=v;
expn='c96L32_am4g5r2_1860rad_tvary_aero';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v2=v;
expn='c96L32_am4g5r2_1860climo';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c0=v;
expn='c96L32_am4g5r2_2000aero';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c1=v;
expn='c96L32_am4g5r2_2000climo';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c2=v;
expn='c96L32_am4g5r2_2000climo_p2K';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c3=v;
expn='AM4OM2F_c96l32_am4g5r11_1860climo';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.v0=v;
expn='AM4OM2F_c96l32_am4g5r11_1860climo_hist0'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.h0=v;
expn='AM4OM2F_c96l32_am4g5r11_1860climo_hist';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.h1=v;
expn='AM4OM2F_c96l32_am4g5r11_1860climo_hist2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.h2=v;
expn='AM4OM2F_c96l32_am4g5r11_1860climo_hist3'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.h3=v;
expn='CM3Z_Control-1860_D1';        fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm3.v0=v;
expn='CM3Z_D1_1860-2005_AllForc_H1';fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm3.h0=v;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g=readsat_giss(); 
%yr1=1951; yr2=1980; vname='SAT_1951_1980';
yr1=1881; yr2=1920; vname='SAT_1881_1920';
id=(g.year>=yr1)&(g.year<=yr2); g.gb=g.gb-mean(g.gb(id));
expn='cmlo'; s=cml.v0.s; s.xl='year';
s.s0='OBS(GISS)';      s.c0='b-';
s.s1='AM4OM2-c96g5r2'; s.c1='k-';
s.s2='CM3';            s.c2='r-';
s.s3='AM4-AMIP';       s.c3='g-';
t0=[1861:2010]; t1=[1860:2005]; t2=[1871:2010];
y0=cml.v0.tref.ts.org_ann(61:61+149);
c=polyfit(t0,y0,1); y00=t0*c(1)+c(2);
y1=cml.h0.tref.ts.org_ann-y00;
id=(t0>=yr1)&(t0<=yr2); y1=y1-mean(y1(id));
z0=cm3.v0.tref.ts.org_ann; c=polyfit([1860:1959],z0,1); z00=t1*c(1)+c(2);
z1=cm3.h0.tref.ts.org_ann-z00; 
id=(t1>=yr1)&(t1<=yr2); z1=z1-mean(z1(id));
x1=am4.v1.tref.ts.org_ann; id=(t2>=yr1)&(t2<=yr2); x1=x1-mean(x1(id));
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0,y1,s.c1,'LineWidth',lw); hold on;
plot(t1,z1,s.c2,'LineWidth',lw);
plot(t2,x1,s.c3,'LineWidth',lw);
plot(g.year,g.gb,s.c0,'LineWidth',lw);
plot([yr1 yr1],[-2 2],'k:'); plot([yr2 yr2],[-2 2],'k:');
plot([1860 2010],[0 0], 'k:');
axis([1870 2010 -1 1.5]); set(gca,'FontSize',fsize);
legend(s.s1,s.s2,s.s3,s.s0,2); 
title('Surface air temperature from historical simulations')
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lat=am4.v1.s.lat; vname='sat_lat'; yr1=1881; yr2=1920; 
t1=[1865:5:2010]; tref_cm4_v0=(cml.v0.tref.ann.latdis.mod(13:42,:))'; 
t2=[1865:5:2010]; tref_cm4_h0=(cml.h0.tref.ann.latdis.mod)'; 
t3=[1865:5:1960]; tref_cm3_v0=(cm3.v0.tref.ann.latdis.mod)'; 
t4=[1865:5:2005]; tref_cm3_h0=(cm3.h0.tref.ann.latdis.mod)'; 
t5=[1875:5:2010]; tref_am4   =(am4.v1.tref.ann.latdis.mod)'; 
for j=1:90
%  y0=tref_cm4_v0(j,:); c=polyfit(t1,y0,1); y00=t2*c(1)+c(2);
%  tref_cm4_h0(j,:)=tref_cm4_h0(j,:)-y00;
%  y0=tref_cm3_v0(j,:); c=polyfit(t3,y0,1); y00=t4*c(1)+c(2);
%  tref_cm3_h0(j,:)=tref_cm3_h0(j,:)-y00;
  tref_cm4_h0(j,:)=tref_cm4_h0(j,:)-mean(tref_cm4_h0(j,:));
  tref_cm3_h0(j,:)=tref_cm3_h0(j,:)-mean(tref_cm3_h0(j,:));
  tref_am4   (j,:)=tref_am4   (j,:)-mean(tref_am4   (j,:));
end
pms=[ 0, 0, 1100, 800]*1.2; row=3; col=1; fsize=16;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1);
pcolor(t2,lat,tref_cm4_h0); shading flat; colorbar; caxis([-2 3]);
axis([1875 2005 -90 90]); set(gca,'FontSize',fsize);
title('coupled simulation','FontSize',fsize); 
ylabel('latitude','FontSize',fsize);
subplot(row,col,2);
pcolor(t4,lat,tref_cm3_h0); shading flat; colorbar; caxis([-2 3]);
axis([1875 2005 -90 90]); set(gca,'FontSize',fsize);
subplot(row,col,3);
pcolor(t5,lat,tref_am4); shading flat; colorbar; caxis([-2 3]);
axis([1875 2005 -90 90]); set(gca,'FontSize',fsize);
xlabel('years','FontSize',fsize);
title('AMIP','FontSize',fsize);
ylabel('latitude','FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='cmlo'; s=cml.v0.s; s.xl='year'; yr1=1980;yr2=2005;
s.s1='AM4OM2-c96g5r2'; s.c1='k-';
s.s2='CM3';            s.c2='r-';
s.s3='AM4-AMIP';       s.c3='g-';
t0=[1865:5:2010]; t1=[1865:5:2005]; t2=[1875:5:2010];
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0,cml.h0.tref.ann.rmse.all,s.c1,'LineWidth',lw); hold on;
plot(t1,cm3.h0.tref.ann.rmse.all,s.c2,'LineWidth',lw);
plot(t2,am4.v1.tref.ann.rmse.all,s.c3,'LineWidth',lw);
plot([yr1 yr1],[-15 15],'k:'); plot([yr2 yr2],[-15 15],'k:');
axis([1860 2010 0.5 3]); set(gca,'FontSize',fsize);
ylabel('RMSE (K)'); legend(s.s1,s.s2,s.s3,2); 
title('surface air temperature','FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='tref';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='cmlo'; s=cml.v0.s; s.xl='year'; yr1=1980;yr2=2005;
s.s1='AM4OM2-c96g5r2'; s.c1='k-';
s.s2='CM3';            s.c2='r-';
s.s3='AM4-AMIP';       s.c3='g-';
t0=[1865:5:2010]; t1=[1865:5:2005]; t2=[1875:5:2010];
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0,cml.h0.pcp.ann.rmse.all,s.c1,'LineWidth',lw); hold on;
plot(t1,cm3.h0.pcp.ann.rmse.all,s.c2,'LineWidth',lw);
plot(t2,am4.v1.pcp.ann.rmse.all,s.c3,'LineWidth',lw);
plot([yr1 yr1],[-15 15],'k:'); plot([yr2 yr2],[-15 15],'k:');
axis([1860 2010 0.8 1.8]); set(gca,'FontSize',fsize);
ylabel('RMSE (mm/day)'); legend(s.s1,s.s2,s.s3,2); 
title('precipitation','FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='pcp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='cmlo'; s=cml.v0.s; s.xl='year'; yr1=1980;yr2=2005;
s.s1='AM4OM2-c96g5r2'; s.c1='k-';
s.s2='CM3';            s.c2='r-';
s.s3='AM4-AMIP';       s.c3='g-';
t0=[1865:5:2010]; t1=[1865:5:2005]; t2=[1875:5:2010];
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0,cml.h0.toa.netrad.ann.rmse.all,s.c1,'LineWidth',lw); hold on;
plot(t1,cm3.h0.toa.netrad.ann.rmse.all,s.c2,'LineWidth',lw);
plot(t2,am4.v1.toa.netrad.ann.rmse.all,s.c3,'LineWidth',lw);
plot([yr1 yr1],[-15 15],'k:'); plot([yr2 yr2],[-15 15],'k:');
axis([1860 2010 6.8 10.5]); set(gca,'FontSize',fsize);
ylabel('RMSE (W/m2)'); legend(s.s1,s.s2,s.s3,2); 
title('TOA net radiative flux','FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='netradtoa';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='cmlo'; s=cml.v0.s; s.xl='year'; yr1=1980;yr2=2005;
s.s1='AM4OM2-c96g5r2'; s.c1='k-';
s.s2='CM3';            s.c2='r-';
s.s3='AM4-AMIP';       s.c3='g-';
t0=[1865:5:2010]; t1=[1865:5:2005]; t2=[1875:5:2010];
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0,cml.h0.toa.lwcf.ann.rmse.all,s.c1,'LineWidth',lw); hold on;
plot(t1,cm3.h0.toa.lwcf.ann.rmse.all,s.c2,'LineWidth',lw);
plot(t2,am4.v1.toa.lwcf.ann.rmse.all,s.c3,'LineWidth',lw);
plot([yr1 yr1],[-15 15],'k:'); plot([yr2 yr2],[-15 15],'k:');
axis([1860 2010 5 10]); set(gca,'FontSize',fsize);
ylabel('RMSE (W/m2)'); legend(s.s1,s.s2,s.s3,2); 
title('LW cloud radiative effect','FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='lwcf';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='cmlo'; s=cml.v0.s; s.xl='year'; yr1=1980;yr2=2005;
s.s1='AM4OM2-c96g5r2'; s.c1='k-';
s.s2='CM3';            s.c2='r-';
s.s3='AM4-AMIP';       s.c3='g-';
t0=[1865:5:2010]; t1=[1865:5:2005]; t2=[1875:5:2010];
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0,cml.h0.toa.swcf.ann.rmse.all,s.c1,'LineWidth',lw); hold on;
plot(t1,cm3.h0.toa.swcf.ann.rmse.all,s.c2,'LineWidth',lw);
plot(t2,am4.v1.toa.swcf.ann.rmse.all,s.c3,'LineWidth',lw);
plot([yr1 yr1],[-15 15],'k:'); plot([yr2 yr2],[-15 15],'k:');
axis([1860 2010 8.5 12.5]); set(gca,'FontSize',fsize);
ylabel('RMSE (W/m2)'); legend(s.s1,s.s2,s.s3,2); 
title('SW cloud radiative effect','FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='swcf';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='cmlo'; s=cml.v0.s; s.xl='year'; yr1=1980;yr2=2005;
s.s1='AM4OM2-c96g5r2'; s.c1='k-';
s.s2='CM3';            s.c2='r-';
s.s3='AM4-AMIP';       s.c3='g-';
t0=[1865:5:2010]; t1=[1865:5:2005]; t2=[1875:5:2010];
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0,cml.h0.toa.ttcf.ann.rmse.all,s.c1,'LineWidth',lw); hold on;
plot(t1,cm3.h0.toa.ttcf.ann.rmse.all,s.c2,'LineWidth',lw);
plot(t2,am4.v1.toa.ttcf.ann.rmse.all,s.c3,'LineWidth',lw);
plot([yr1 yr1],[-15 15],'k:'); plot([yr2 yr2],[-15 15],'k:');
axis([1860 2010 6.5 10]); set(gca,'FontSize',fsize);
ylabel('RMSE (W/m2)'); legend(s.s1,s.s2,s.s3,2); 
title('total cloud radiative effect','FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='ttcf';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='cmlo'; s=cml.v0.s; s.xl='year'; yr1=1980;yr2=2005;
s.s1='AM4OM2-c96g5r2'; s.c1='k-';
s.s2='CM3';            s.c2='r-';
s.s3='AM4-AMIP';       s.c3='g-';
t0=[1865:5:2010]; t1=[1865:5:2005]; t2=[1875:5:2010];
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0,cml.h0.toa.ttcf.ann.rmse.all,s.c1,'LineWidth',lw); hold on;
plot(t1,cm3.h0.toa.ttcf.ann.rmse.all,s.c2,'LineWidth',lw);
plot(t2,am4.v1.toa.ttcf.ann.rmse.all,s.c3,'LineWidth',lw);
plot([yr1 yr1],[-15 15],'k:'); plot([yr2 yr2],[-15 15],'k:');
axis([1860 2010 6.5 10]); set(gca,'FontSize',fsize);
ylabel('RMSE (W/m2)'); legend(s.s1,s.s2,s.s3,2); 
title('total cloud radiative effect','FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='ttcf';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='cmlo'; s=cml.v0.s; s.xl='year'; yr1=1980;yr2=2005;
s.s1='AM4OM2-c96g5r2'; s.c1='k-';
s.s2='CM3';            s.c2='r-';
s.s3='AM4-AMIP';       s.c3='g-';
t0=[1865:5:2010]; t1=[1865:5:2005]; t2=[1875:5:2010];
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0,cml.h0.toa.swnet.ann.mmen.all,s.c1,'LineWidth',lw); hold on;
plot(t1,cm3.h0.toa.swnet.ann.mmen.all,s.c2,'LineWidth',lw);
plot(t2,am4.v1.toa.swnet.ann.mmen.all,s.c3,'LineWidth',lw);
plot([yr1 yr1],[-15 15],'k:'); plot([yr2 yr2],[-15 15],'k:');
axis([1860 2010 6.8 10.5]); set(gca,'FontSize',fsize);
ylabel('RMSE (W/m2)'); legend(s.s1,s.s2,s.s3,2); 
title('TOA net radiative flux','FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='netradtoa';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='cmlo'; s=cml.v0.s; s.xl='year'; yr1=1980;yr2=2005;
s.s1='AM4OM2-c96g5r2'; s.c1='k-';
s.s2='CM3';            s.c2='r-';
s.s3='AM4-AMIP';       s.c3='g-';
t0=[1865:5:2010]; t1=[1865:5:2005]; t2=[1875:5:2010];
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0,cml.h0.toa.lwnet.ann.mmen.all,s.c1,'LineWidth',lw); hold on;
plot(t1,cm3.h0.toa.lwnet.ann.mmen.all,s.c2,'LineWidth',lw);
plot(t2,am4.v1.toa.lwnet.ann.mmen.all,s.c3,'LineWidth',lw);
plot([yr1 yr1],[-15 15],'k:'); plot([yr2 yr2],[-15 15],'k:');
axis([1860 2010 6.8 10.5]); set(gca,'FontSize',fsize);
ylabel('RMSE (W/m2)'); legend(s.s1,s.s2,s.s3,2); 
title('TOA net radiative flux','FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='netradtoa';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='amip'; s=am4.v0.s; s.xl='year';
s.s1='net (PDall-PI)';  s.c1='k-';
s.s2='LW (PDall-PI)';   s.c2='r-';
s.s3='SW (PDall-PI)';   s.c3='b-';
s.s4='net (PDaero-PI)'; s.c4='k--';
s.s5='LW (PDaero-PI)';  s.c5='r--';
s.s6='SW (PDaero-PI)';  s.c6='b--';
vname='radtoa'; t0=[1871:2010]; t1=[1871:2010];
y0=am4.v1.toa.netrad.ts.org_ann  -am4.v0.toa.netrad.ts.org_ann;
y1=am4.v1.toa.lwnet.ts.org_ann   -am4.v0.toa.lwnet.ts.org_ann;
y2=am4.v1.toa.swnet.ts.org_ann   -am4.v0.toa.swnet.ts.org_ann;
z0=am4.v2.toa.netrad.ts.org_ann  -am4.v0.toa.netrad.ts.org_ann;
z1=am4.v2.toa.lwnet.ts.org_ann   -am4.v0.toa.lwnet.ts.org_ann;
z2=am4.v2.toa.swnet.ts.org_ann   -am4.v0.toa.swnet.ts.org_ann;
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0, y0,s.c1, 'LineWidth',lw); hold on; 
plot(t0,-y1,s.c2, 'LineWidth',lw); hold on; 
plot(t0, y2,s.c3, 'LineWidth',lw); hold on; 
plot(t1, z0,s.c4, 'LineWidth',lw); hold on; 
plot(t1,-z1,s.c5, 'LineWidth',lw); hold on; 
plot(t1, z2,s.c6, 'LineWidth',lw); hold on; 
axis([1870 2010 -5 3]); set(gca,'FontSize',fsize);
legend(s.s1,s.s2,s.s3,s.s4,s.s5,s.s6,0)
title('TOA radiative flux difference between AMIP and AMIP with fixed 1860 radiation')
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='amip'; s=cml.v0.s; s.xl='year';
s.s1='net (AM4g5r2)'; s.c1='k-';
s.s2='LW (AM4g5r2)';  s.c2='r-';
s.s3='SW (AM4g5r2)';  s.c3='b-';
s.s4='net (AM3)';     s.c4='k--';
s.s5='LW (AM3)';      s.c5='r--';
s.s6='SW (AM3)';      s.c6='b--';
vname='radtoa'; t0=[1871:2010]; t1=[1870:2005];
y0=am4.v1.toa.netrad.ts.org_ann  -am4.v0.toa.netrad.ts.org_ann;
y1=am4.v1.toa.lwnet.ts.org_ann   -am4.v0.toa.lwnet.ts.org_ann;
y2=am4.v1.toa.swnet.ts.org_ann   -am4.v0.toa.swnet.ts.org_ann;
%y3=am4.v1.toa.netrad.ts.org_ann -am4.v0.toa.netrad_clr.ts.org_ann;
z0=am3.v1.toa.netrad.ts.org_ann  -am3.v0.toa.netrad.ts.org_ann;
z1=am3.v1.toa.lwnet.ts.org_ann   -am3.v0.toa.lwnet.ts.org_ann;
z2=am3.v1.toa.swnet.ts.org_ann   -am3.v0.toa.swnet.ts.org_ann;
%z3=am3.v1.toa.netrad.ts.org_ann -am3.v0.toa.netrad_clr.ts.org_ann;
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0, y0,s.c1, 'LineWidth',lw); hold on; 
plot(t0,-y1,s.c2, 'LineWidth',lw); hold on; 
plot(t0, y2,s.c3, 'LineWidth',lw); hold on; 
plot(t1, z0,s.c4, 'LineWidth',lw); hold on; 
plot(t1,-z1,s.c5, 'LineWidth',lw); hold on; 
plot(t1, z2,s.c6, 'LineWidth',lw); hold on; 
axis([1870 2010 -5 3]); set(gca,'FontSize',fsize);
legend(s.s1,s.s2,s.s3,s.s4,s.s5,s.s6,0)
title('TOA radiative flux difference between AMIP and AMIP with fixed 1860 radiation')
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='amip'; s=cml.v0.s; s.xl='year';
s.s1='net (AM4g5r2)'; s.c1='k-';
s.s2='LW (AM4g5r2)';  s.c2='r-';
s.s3='SW (AM4g5r2)';  s.c3='b-';
s.s4='net (AM3)';     s.c4='k--';
s.s5='LW (AM3)';      s.c5='r--';
s.s6='SW (AM3)';      s.c6='b--';
vname='radtoa_clr'; t0=[1871:2010]; t1=[1870:2005];
y0=am4.v1.toa.netrad_clr.ts.org_ann  -am4.v0.toa.netrad_clr.ts.org_ann;
y1=am4.v1.toa.lwnet_clr.ts.org_ann   -am4.v0.toa.lwnet_clr.ts.org_ann;
y2=am4.v1.toa.swnet_clr.ts.org_ann   -am4.v0.toa.swnet_clr.ts.org_ann;
%y3=am4.v1.toa.netrad_clr.ts.org_ann -am4.v0.toa.netrad_clr.ts.org_ann;
z0=am3.v1.toa.netrad_clr.ts.org_ann  -am3.v0.toa.netrad_clr.ts.org_ann;
z1=am3.v1.toa.lwnet_clr.ts.org_ann   -am3.v0.toa.lwnet_clr.ts.org_ann;
z2=am3.v1.toa.swnet_clr.ts.org_ann   -am3.v0.toa.swnet_clr.ts.org_ann;
%z3=am3.v1.toa.netrad.ts.org_ann -am3.v0.toa.netrad_clr.ts.org_ann;
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0, y0,s.c1, 'LineWidth',lw); hold on; 
plot(t0,-y1,s.c2, 'LineWidth',lw); hold on; 
plot(t0, y2,s.c3, 'LineWidth',lw); hold on; 
plot(t1, z0,s.c4, 'LineWidth',lw); hold on; 
plot(t1,-z1,s.c5, 'LineWidth',lw); hold on; 
plot(t1, z2,s.c6, 'LineWidth',lw); hold on; 
axis([1870 2010 -6 4]); set(gca,'FontSize',fsize);
legend(s.s1,s.s2,s.s3,s.s4,s.s5,s.s6,0)
title('TOA clear-sky radiative flux difference between AMIP and AMIP with fixed 1860 radiation')
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='amip'; s=cml.v0.s; s.xl='year';
s.s1='net (AM4g5r2)'; s.c1='k-';
s.s2='LW (AM4g5r2)';  s.c2='r-';
s.s3='SW (AM4g5r2)';  s.c3='b-';
s.s4='net (AM3)';     s.c4='k--';
s.s5='LW (AM3)';      s.c5='r--';
s.s6='SW (AM3)';      s.c6='b--';
vname='radtoa_clr'; t0=[1871:2010]; t1=[1870:2005];
y0=am4.v1.toa.ttcf.ts.org_ann  -am4.v0.toa.ttcf.ts.org_ann;
y1=am4.v1.toa.lwcf.ts.org_ann  -am4.v0.toa.lwcf.ts.org_ann;
y2=am4.v1.toa.swcf.ts.org_ann  -am4.v0.toa.swcf.ts.org_ann;
z0=am3.v1.toa.ttcf.ts.org_ann  -am3.v0.toa.ttcf.ts.org_ann;
z1=am3.v1.toa.lwcf.ts.org_ann  -am3.v0.toa.lwcf.ts.org_ann;
z2=am3.v1.toa.swcf.ts.org_ann  -am3.v0.toa.swcf.ts.org_ann;
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0, y0,s.c1, 'LineWidth',lw); hold on; 
plot(t0, y1,s.c2, 'LineWidth',lw); hold on; 
plot(t0, y2,s.c3, 'LineWidth',lw); hold on; 
plot(t1, z0,s.c4, 'LineWidth',lw); hold on; 
plot(t1, z1,s.c5, 'LineWidth',lw); hold on; 
plot(t1, z2,s.c6, 'LineWidth',lw); hold on; 
axis([1870 2010 -6 4]); set(gca,'FontSize',fsize);
legend(s.s1,s.s2,s.s3,s.s4,s.s5,s.s6,0)
title('TOA radiative flux difference between AMIP and AMIP with fixed 1860 radiation')
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='amip'; s=cml.v0.s; s.xl='year';
s.s1='net (AM4g5r2)'; s.c1='k-';
s.s2='LW (AM4g5r2)';  s.c2='r-';
s.s3='SW (AM4g5r2)';  s.c3='b-';
s.s4='net (AM3)';     s.c4='k--';
s.s5='LW (AM3)';      s.c5='r--';
s.s6='SW (AM3)';      s.c6='b--';
vname='radtoa_clr'; t0=[1871:5:2010]; t1=[1870:5:2004];
y0=am4.v0.toa.ttcf.ann.mmen.all; y0=y0-mean(y0);
y1=am4.v0.toa.lwcf.ann.mmen.all; y1=y1-mean(y1);
y2=am4.v0.toa.swcf.ann.mmen.all; y2=y2-mean(y2);
z0=am3.v0.toa.ttcf.ann.mmen.all; z0=z0-mean(z0);
z1=am3.v0.toa.lwcf.ann.mmen.all; z1=z1-mean(z1);
z2=am3.v0.toa.swcf.ann.mmen.all; z2=z2-mean(z2);
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0, y0,s.c1, 'LineWidth',lw); hold on; 
plot(t0, y1,s.c2, 'LineWidth',lw); hold on; 
plot(t0, y2,s.c3, 'LineWidth',lw); hold on; 
plot(t1, z0,s.c4, 'LineWidth',lw); hold on; 
plot(t1, z1,s.c5, 'LineWidth',lw); hold on; 
plot(t1, z2,s.c6, 'LineWidth',lw); hold on; 
axis([1870 2010 -6 4]); set(gca,'FontSize',fsize);
legend(s.s1,s.s2,s.s3,s.s4,s.s5,s.s6,0)
title('TOA radiative flux difference between AMIP and AMIP with fixed 1860 radiation')
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lat=am4.v1.s.lat; vname='sat_lat';
t0=[1865:5:2010]; y0=(cml.v0.toa.netrad.ann.latdis.mod(13:42,:))'; 
t1=[1865:5:2010]; y1=(cml.h0.toa.netrad.ann.latdis.mod)'; 
t2=[1875:5:2010]; y2=(am4.v1.toa.netrad.ann.latdis.mod)'; 
for j=1:90
  x0=y0(j,:); c=polyfit(t0,x0,1); x00=t0*c(1)+c(2);
  y1(j,:)=y1(j,:)-x00;
  y1(j,:)=y1(j,:)-mean(y1(j,:));
  y2(j,:)=y2(j,:)-mean(y2(j,:));
end
pms=[ 0, 0, 1100, 800]*1.2; row=2; col=1;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1);
pcolor(t1,lat,y1); shading flat; colorbar; caxis([-2 3]);
axis([1875 2005 -90 90]); set(gca,'FontSize',fsize);
title('coupled simulation','FontSize',fsize); 
ylabel('latitude','FontSize',fsize);
subplot(row,col,2);
pcolor(t2,lat,y2); shading flat; colorbar; caxis([-2 3]);
axis([1875 2005 -90 90]); set(gca,'FontSize',fsize);
xlabel('years','FontSize',fsize);
title('AMIP','FontSize',fsize);
ylabel('latitude','FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lat=am4.v1.s.lat; vname='sat_lat';
t1=[1875:5:2010]; y1=(cml.h0.toa.netrad_clr.ann.latdis.mod(3:end,:))'; 
t2=[1875:5:2010]; y2=(am4.v1.toa.netrad_clr.ann.latdis.mod)'; 
pms=[ 0, 0, 1100, 800]*1.2; row=2; col=1;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1);
pcolor(t1,lat,y1-y2); shading flat; colorbar; caxis([-2 3]);

axis([1875 2005 -90 90]); set(gca,'FontSize',fsize);
title('coupled simulation','FontSize',fsize); 
ylabel('latitude','FontSize',fsize);
subplot(row,col,2);
pcolor(t2,lat,y2); shading flat; colorbar; caxis([-2 3]);
axis([1875 2005 -90 90]); set(gca,'FontSize',fsize);
xlabel('years','FontSize',fsize);
title('AMIP','FontSize',fsize);
ylabel('latitude','FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='cmlo'; s=cml.v0.s; s.xl='year'; yr1=1980;yr2=2005;
s.s1='AM4OM2-c96g5r2'; s.c1='k-';
s.s2='CM3';            s.c2='r-';
s.s3='AM4-AMIP';       s.c3='g-';
t0=[1865:5:2010]; t1=[1865:5:2005]; t2=[1875:5:2010];
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0,cml.h0.toa.netrad.ann.mmen.all,s.c1,'LineWidth',lw); hold on;
plot(t1,cm3.h0.toa.netrad.ann.mmen.all,s.c2,'LineWidth',lw);
plot(t2,am4.v1.toa.netrad.ann.mmen.all,s.c3,'LineWidth',lw);
%plot([yr1 yr1],[-15 15],'k:'); plot([yr2 yr2],[-15 15],'k:');
axis([1860 2010 -1.5 2]); set(gca,'FontSize',fsize);
ylabel('NETRADTOA (W/m2)'); legend(s.s1,s.s2,s.s3,2); 
title('TOA net radiative flux','FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='netradtoa';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='cmlo'; s=cml.v0.s; s.xl='year'; yr1=1980;yr2=2005;
s.s1='AM4OM2-c96g5r2'; s.c1='k-';
s.s2='CM3';            s.c2='r-';
s.s3='AM4-AMIP';       s.c3='g-';
t0=[1865:5:2010]; t1=[1865:5:2005]; t2=[1875:5:2010];
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0,cml.h0.toa.netrad_clr.ann.mmen.all,s.c1,'LineWidth',lw); hold on;
plot(t1,cm3.h0.toa.netrad_clr.ann.mmen.all,s.c2,'LineWidth',lw);
plot(t2,am4.v1.toa.netrad_clr.ann.mmen.all,s.c3,'LineWidth',lw);
%axis([1860 2010 -1.5 2]); set(gca,'FontSize',fsize);
ylabel('clear-sky NETRADTOA (W/m2)'); legend(s.s1,s.s2,s.s3,2); 
title('TOA net radiative flux','FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='netradtoa';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='cmlo'; s=cml.v0.s; s.xl='year'; yr1=1980;yr2=2005;
s.s1='AM4OM2-c96g5r2'; s.c1='k-';
s.s2='CM3';            s.c2='r-';
s.s3='AM4-AMIP';       s.c3='g-';
t0=[1865:5:2010]; t1=[1865:5:2005]; t2=[1875:5:2010];
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(t0,cml.h0.toa.ttcf.ann.mmen.all,s.c1,'LineWidth',lw); hold on;
plot(t1,cm3.h0.toa.ttcf.ann.mmen.all,s.c2,'LineWidth',lw);
plot(t2,am4.v1.toa.ttcf.ann.mmen.all,s.c3,'LineWidth',lw);
%axis([1860 2010 -1.5 2]); set(gca,'FontSize',fsize);
ylabel('clear-sky NETRADTOA (W/m2)'); legend(s.s1,s.s2,s.s3,2); 
title('TOA net radiative flux','FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='netradtoa';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


swcf=(am4.v0.toa.swcf.ann.latdis.mod)';
for j=1:90
  swcf(j,:)=swcf(j,:)-mean(swcf(j,:));
end
figure; pcolor(swcf); shading flat; colorbar;

z=am4.v0.tref.ann.latdis.mod;
for j=1:90
  y(:,j)=z(:,j)-mean(z(:,j));
end
figure; pcolor(y'); shading flat; colorbar;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
t0=[1871:2010]; t1=[1870:2005];
y0=am4.v1.toa.ttcf.ts.org_ann  -am4.v0.toa.ttcf.ts.org_ann;
y1=am4.v1.toa.lwcf.ts.org_ann  -am4.v0.toa.lwcf.ts.org_ann;
y2=am4.v1.toa.swcf.ts.org_ann  -am4.v0.toa.swcf.ts.org_ann;
z0=am3.v1.toa.ttcf.ts.org_ann  -am3.v0.toa.ttcf.ts.org_ann;
z1=am3.v1.toa.lwcf.ts.org_ann  -am3.v0.toa.lwcf.ts.org_ann;
z2=am3.v1.toa.swcf.ts.org_ann  -am3.v0.toa.swcf.ts.org_ann;
plot(t0,y0,'k'); hold on; plot(t0,-y1,'r'); plot(t0,y2,'b');% plot(t0,y2-y1,'k*'); 
plot(t1,z0,'k--');      plot(t1,-z1,'r--'); plot(t1,z2,'b--');% plot(t0,y2-y1,'k*'); 
axis([1870 2010 -5 3]);
legend('net (AM4g5r2)','LW (AM4g5r2)','SW (AM4g5r2)','net (AM3)','LW (AM3)','SW (AM3)',2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



t=[1:80]+60; a=cml.v0.tref.ts.org_ann(61:end);
c=polyfit(t,a,1); z=t*c(1)+c(2); %figure; plot(t,a); hold on; plot(t,y,'r');
t=[1861:1:2015]; id=(t>=1950)&(t<=1980); x.time1=t;
a=cml.h0.tref.ts.org_ann-c(1)*t; a=a-mean(a(id)); y.var1=a;
a=cml.h0.tref.ts.org_ann-c(1)*t; a=a-mean(a(id)); y.var2=a;
a=cml.h0.tref.ts.org_ann-c(1)*t; a=a-mean(a(id)); y.var3=a;
expn='cml'; s=cml.v0.s; s.xl='year';
s.s0='GISS';              s.c0='k-';
s.s1='AM4OM2-g5r2-HIST1'; s.c1='r-';
s.s2='AM4OM2-g5r2-HIST2'; s.c2='g-';
s.s3='AM4OM2-g5r2-HIST3'; s.c3='b-';
vname='sat_ann'; s.xy=[1860 2015 -0.8 1.2]; s.opt=2;
s.yl='surface air temperature anomaly from 1951-1980 mean (C^\circ)';
plot_ts_hist(x,y,s,expn,vname);

figure; plot(am4.v0.tref.ts.org_ann, am4.v0.toa.lwcf.ts.org_ann,'s');
figure; plot(am4.v0.tref.ts.org_ann, am4.v0.toa.swcf.ts.org_ann,'s');
figure; plot(am4.v0.tref.ts.org_ann, am4.v0.toa.ttcf.ts.org_ann,'s');

figure; plot(am4.v0.tref.ann.mmen.all(1:28), am4.v0.toa.swcf.ann.mmen.all(1:28),'s-');
figure; plot(am4.v0.tref.ann.mmen.all(1:28), am4.v0.toa.lwcf.ann.mmen.all(1:28),'s-');

[...
    mean(am4.v0.toa.netrad.ts.org_ann)
    mean(am4.v1.toa.netrad.ts.org_ann)
    mean(am4.c0.toa.netrad.ts.org_ann)
    mean(am4.c1.toa.netrad.ts.org_ann)
    mean(am4.c2.toa.netrad.ts.org_ann)
    mean(am4.c3.toa.netrad.ts.org_ann)
]
[...
    mean(am4.c0.toa.netrad_clr.ts.org_ann)
    mean(am4.c1.toa.netrad_clr.ts.org_ann)
    mean(am4.c2.toa.netrad_clr.ts.org_ann)
    mean(am4.c3.toa.netrad_clr.ts.org_ann)
]
[...
    mean(am4.c0.toa.ttcf.ts.org_ann)
    mean(am4.c1.toa.ttcf.ts.org_ann)
    mean(am4.c2.toa.ttcf.ts.org_ann)
    mean(am4.c3.toa.ttcf.ts.org_ann)
]
[...
    mean(am4.c0.toa.swcf.ts.org_ann)
    mean(am4.c1.toa.swcf.ts.org_ann)
    mean(am4.c2.toa.swcf.ts.org_ann)
    mean(am4.c3.toa.swcf.ts.org_ann)
]


expn='AM4OM2F_c96l32_am4g5r11_1860climo_4xCO2';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.w0=v;
expn='AM4OM2F_c96l32_am4g5r11_2000climo';        fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.v0p=v;
expn='AM4OM2F_c96l32_am4g5r11_2000climo_1pct';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.w0p=v;

expn='CM4_c96L32_am4g5r2_2000_sis2_low_mixing3b';fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm4.v0p=v;
expn='CM4_c96L32_am4g5r2_1860_sis2_low_mixing3b';fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm4.v0=v;
expn='CM4_c96L32_am4g5r2_abrupt2XCO2_sis2_low_mixing3b_vs2';fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm4.w0=v

expn='AM4OM2F_c96l32_am4g5r11_1860climo_hist';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.h1=v;
expn='AM4OM2F_c96l32_am4g5r11_1860climo_hist2';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.h2=v;
expn='AM4OM2F_c96l32_am4g5r11_1860climo_hist3';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.h3=v;
%expn='AM4OM2F_c96l32_am4h5_1860climo_1';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.v1=v;
%expn='AM4OM2F_c96l32_am4h5_1860climo_1_4xCO2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.w1=v;
%expn='AM4OM2F_c96l32_am4h5_2000climo';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.v1p=v;
%expn='AM4OM2F_c96l32_am4h5_2000climo_1pct';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);cml.w1p=v;

expn='c96L32_am4g5r11_2000climo';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v0p=v;
expn='c96L32_am4g5r11_2000climo_p2K';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w0p=v;
expn='c96L32_am4g5_2000climo';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v1p=v;
expn='c96L32_am4g5_2000climo_p2K';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w1p=v;

tpath='/archive/Ming.Zhao/awg/ulm/';
expn='CM2.5_A_Control-1990_C03'; fn=strcat(tpath,expn,pp,expn,dr); load(fn); cm25=v;

dn=12;
v0=cml.v0;  w0=cml.w0;  cml.v0 =compute_diff(v0,w0,dn);
v0=cml.v0p; w0=cml.w0p; cml.v0p=compute_diff(v0,w0,dn);
dn=16; cml.v0p.dT_new=w0.tref.ann.mmen.all-v0.tref.ann.mmen.all(end-dn+1:end);
dn=12;
v0=cm4.v0;  w0=cm4.w0;  cm4.v0 =compute_diff(v0,w0,dn);
%v0=cm4.v0p; w0=cm4.w0p; cm4.v0p=compute_diff(v0,w0,dn);

plot_regression_cmp(cml.v0,cm4.v0,'comp');

dn=2;
v0=am4.v0p; w0=am4.w0p; am4.v0p=compute_diff(v0,w0,dn);
v0=am4.v1p; w0=am4.w1p; am4.v1p=compute_diff(v0,w0,dn);

plot_regression1a(cml.v0,cml.v1,'N_dT_g5r2')
plot_regression (cml.v0,'M_dT_g5r2')
plot_regression2(cml.v0p.dT_new,cml.v1p.dT_new,'TCR')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=[1871:2010]; x1=[65:5:150]; x2=[5 :5:60];  x3=[5 :5:100];  
y1=am4.v1.toa.netrad.ts.org_ann-am4.v0.toa.netrad.ts.org_ann;
y2=am4.v1.toa.swnet.ts.org_ann -am4.v0.toa.swnet.ts.org_ann;
y3=am4.v1.toa.lwnet.ts.org_ann -am4.v0.toa.lwnet.ts.org_ann;
plot(x0, y1,   'k-'); hold on;
plot(x0, y2,   'r-'); hold on;
plot(x0,-y3,   'b-'); hold on; %plot(x0,-y3+y2,'m*-'); hold on;


plot(am4.v1.toa.netrad.ts.org_ann,'r'); hold on;
figure;
plot(v1.toa.netrad.ts.org_ann-v0.toa.netrad.ts.org_ann,'r'); hold on;
plot(-(v1.toa.lwnet.ts.org_ann-v0.toa.lwnet.ts.org_ann),'b'); hold on;
plot(v0.toa.netrad_clr.ts.org_ann,'b--'); hold on;
plot(v1.toa.netrad_clr.ts.org_ann,'r--'); hold on;
figure; 
plot(v0.toa.swnet_clr.ts.org_ann,'b'); hold on;
plot(v1.toa.swnet_clr.ts.org_ann,'r'); hold on;
plot(v0.toa.swnet.ts.org_ann,'b--'); hold on;
plot(v1.toa.swnet.ts.org_ann,'r--'); hold on;
figure; 
plot(v0.toa.lwnet_clr.ts.org_ann,'b'); hold on;
plot(v1.toa.lwnet_clr.ts.org_ann,'r'); hold on;
plot(v0.toa.lwnet_clr.ts.org_ann,'b--'); hold on;
plot(v1.toa.lwnet_clr.ts.org_ann,'r--'); hold on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=[5 :5:140]; x1=[65:5:150]; x2=[5 :5:60];  x3=[5 :5:100];  
plot(x0,cml.v0.tref.ann.mmen.all, 'b--'); hold on; 
plot(x1,cml.w0.tref.ann.mmen.all, 'r--'); hold on; 
plot(x0,cml.v0p.tref.ann.mmen.all,'m--'); hold on; 
plot(x2,cm4.v0.tref.ann.mmen.all, 'b'); hold on; 
plot(x2,cm4.w0.tref.ann.mmen.all, 'r'); hold on; 
plot(x3,cm4.v0p.tref.ann.mmen.all,'m'); hold on; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=[5 :5:140]; x1=[65:5:150]; x2=[5 :5:60];  x3=[5 :5:100];  
plot(x0,cml.v0.toa.netrad.ann.mmen.all, 'b--'); hold on; 
plot(x1,cml.w0.toa.netrad.ann.mmen.all, 'r--'); hold on; 
plot(x0,cml.v0p.toa.netrad.ann.mmen.all,'m--'); hold on; 
plot(x2,cm4.v0.toa.netrad.ann.mmen.all, 'b'); hold on; 
plot(x2,cm4.w0.toa.netrad.ann.mmen.all, 'r'); hold on; 
plot(x3,cm4.v0p.toa.netrad.ann.mmen.all,'m'); hold on; 
legend('CML-1860CNTL','CML-1860CNTL(2xCO2)','CML-2000CNTL',...
       'CM4-1860CNTL','CM4-1860CNTL(2xCO2)','CM4-2000CNTL');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0=cml.w0.tref.ann.mmen.all      -mean(cml.v0.tref.ann.mmen.all(end-12+1:end));
y0=cml.w0.toa.netrad.ann.mmen.all-mean(cml.v0.toa.netrad.ann.mmen.all(end-12+1:end));
x1=cm4.w0.tref.ann.mmen.all      -cm4.v0.tref.ann.mmen.all;
y1=cm4.w0.toa.netrad.ann.mmen.all-cm4.v0.toa.netrad.ann.mmen.all;
pms=[ 0, 0, 800, 600]*1.2; fsize=18; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(x0/2,y0/2,'bs-'); hold on; plot(x1,y1,'rs-'); grid on;
c=polyfit(x0/2,y0/2,1); x=[-5:0.5:5]; y=c(1)*x+c(2);plot(x,y,'b--');
c=polyfit(x1,y1,1);     x=[-5:0.5:5]; y=c(1)*x+c(2);plot(x,y,'r--');
xlabel('tref'); hold on; ylabel('netradtoa');
axis([-0.5 4 -0.5 3]);



figure; 
plot(cm4.v0.toa.netrad.ts.org_ann,'b'); hold on; 
plot(cm4.w0.toa.netrad.ts.org_ann,'r'); hold on; 

t1=21; t2=40;
w.netrad=cm4.w0.toa.netrad.ts.org_ann(t1:t2);
v.netrad=cm4.v0.toa.netrad.ts.org_ann(t1:t2); %dohu=w-v; dohu=dohu-mean(dohu);
w.netsfc=cm4.w0.sfc.netflx.ts.org_ann(t1:t2);
v.netsfc=cm4.v0.sfc.netflx.ts.org_ann(t1:t2); %dohu=w-v; dohu=dohu-mean(dohu);

w.tref  =cm4.w0.tref.ts.org_ann(t1:t2);
v.tref  =cm4.v0.tref.ts.org_ann(t1:t2); %dT=w-v; dT=dT-mean(dT);


figure; plot(dohu,'r'); hold on;
figure; plot(dT,'r'); hold on;
figure; plot(dohu,dT,'-*'); hold on;
c=polyfit(dohu,dT,1); x=[-5:0.2:5]; y=c(1)*x+c(2);plot(x,y);


saf=getdalbdt(cml.v0); cml.v0p.saf=saf;

a=getdalbdt(am4.v0p);

x=cml.v0.lat
y0=cml.v0.tref.ann.latdis.mod(1,:)
y1=cml.h1.tref.ann.latdis.mod(1,:)
y2=cml.h2.tref.ann.latdis.mod(1,:)
y3=cml.h3.tref.ann.latdis.mod(1,:)
figure; plot(x,y0,'b'); hold on; 
plot(x,y1,'r');plot(x,y2,'r');plot(x,y3,'r');

[...
    cml.v0.tref.ann.mmen.all(13)
    cml.h1.tref.ann.mmen.all(1)
    cml.h2.tref.ann.mmen.all(1)
    cml.h3.tref.ann.mmen.all(1)]

x=cml.v0.lat; 
y0=cml.v0.tref.ann.latdis.all(13,:); mean(y0)
y1=cml.h1.tref.ann.latdis.all(1,:);  mean(y1)
y2=cml.h2.tref.ann.latdis.all(1,:);  mean(y2)
y3=cml.h3.tref.ann.latdis.all(1,:);  mean(y3)
figure; plot(x,y0,'b'); hold on; 
plot(x,y1,'r');plot(x,y2,'r');plot(x,y3,'r');


figure; 
plot([1:140],   cml.v0.toa.ttcf.ts.org_ann,'b'); hold on; 
plot([1:150]+60,cml.h1.toa.ttcf.ts.org_ann,'r');
plot([1:150]+60,cml.h2.toa.ttcf.ts.org_ann,'r');
plot([1:150]+60,cml.h3.toa.ttcf.ts.org_ann,'r');

figure; 
plot([1:140],   cml.v0.toa.lwnet_clr.ts.org_ann,'b'); hold on; 
plot([1:150]+60,cml.h1.toa.lwnet_clr.ts.org_ann,'r');
plot([1:150]+60,cml.h2.toa.lwnet_clr.ts.org_ann,'r');
plot([1:150]+60,cml.h3.toa.lwnet_clr.ts.org_ann,'r');

figure; 
plot([1:140],   cml.v0.toa.lwnet_clr.ts.org_ann,'b'); hold on; 
plot([1:150]+60,cml.h1.toa.lwnet_clr.ts.org_ann,'r');
plot([1:150]+60,cml.h2.toa.lwnet_clr.ts.org_ann,'r');
plot([1:150]+60,cml.h3.toa.lwnet_clr.ts.org_ann,'r');

figure; 
plot([1:140],   cml.v0.toa.swnet_clr.ts.org_ann,'b'); hold on; 
plot([1:150]+60,cml.h1.toa.swnet_clr.ts.org_ann,'r');
plot([1:150]+60,cml.h2.toa.swnet_clr.ts.org_ann,'r');
plot([1:150]+60,cml.h3.toa.swnet_clr.ts.org_ann,'r');

figure; 
plot([1:140],   cml.v0.pcp.ts.org_ann,'b'); hold on; 
plot([1:150]+60,cml.h1.pcp.ts.org_ann,'r');
plot([1:150]+60,cml.h2.pcp.ts.org_ann,'r');
plot([1:150]+60,cml.h3.pcp.ts.org_ann,'r');

figure; 
plot([1:140],   cml.v0.atm.netrad.ts.org_ann,'b'); hold on; 
plot([1:150]+60,cml.h1.atm.netrad.ts.org_ann,'r');
plot([1:150]+60,cml.h2.atm.netrad.ts.org_ann,'r');
plot([1:150]+60,cml.h3.atm.netrad.ts.org_ann,'r');

figure; 
plot([1:140],   cml.v0.sfc.albedo.ts.org_ann,'b'); hold on; 
plot([1:150]+60,cml.h1.sfc.albedo.ts.org_ann,'r');
plot([1:150]+60,cml.h2.sfc.albedo.ts.org_ann,'r');
plot([1:150]+60,cml.h3.sfc.albedo.ts.org_ann,'r');

figure; 
plot([1:140],   cml.v0.evap.ts.org_ann,'b'); hold on; 
plot([1:150]+60,cml.h1.evap.ts.org_ann,'r');
plot([1:150]+60,cml.h2.evap.ts.org_ann,'r');
plot([1:150]+60,cml.h3.evap.ts.org_ann,'r');

figure; 
plot([1:140],   cml.v0.evap.ts.org_ann,'b'); hold on; 
plot([1:150]+60,cml.h1.evap.ts.org_ann,'r');
plot([1:150]+60,cml.h2.evap.ts.org_ann,'r');
plot([1:150]+60,cml.h3.evap.ts.org_ann,'r');

figure; 
plot([1:140],   cml.v0.tref.ts.org_ann,'b'); hold on; 
plot([1:150]+60,cml.h1.tref.ts.org_ann,'r');
plot([1:150]+60,cml.h2.tref.ts.org_ann,'r');
plot([1:150]+60,cml.h3.tref.ts.org_ann,'r');
plot([1:35] +60,cml.h0.tref.ts.org_ann,'g');


figure; 
plot([1:140],   cml.v0.tref.ts.mon.all(1,:),'b'); hold on; 
plot([1:150]+60,cml.h1.tref.ts.mon.all(1,:),'r');
plot([1:150]+60,cml.h2.tref.ts.mon.all(1,:),'r');
plot([1:150]+60,cml.h3.tref.ts.mon.all(1,:),'r');

figure; m=1;
plot([1:140],   cml.v0.tref.ts.mon.land(m,:),'b'); hold on; 
plot([1:150]+60,cml.h1.tref.ts.mon.land(m,:),'r');
plot([1:150]+60,cml.h2.tref.ts.mon.land(m,:),'r');
plot([1:150]+60,cml.h3.tref.ts.mon.land(m,:),'r');

figure; m=1;
plot([1:140],   cml.v0.tref.ts.mon.ocean(m,:),'b'); hold on; 
plot([1:150]+60,cml.h1.tref.ts.mon.ocean(m,:),'r');
plot([1:150]+60,cml.h2.tref.ts.mon.ocean(m,:),'r');
plot([1:150]+60,cml.h3.tref.ts.mon.ocean(m,:),'r');

figure; m=1;
plot([1:140],   cml.v0.toa.swcf.ts.mon.land(m,:),'b'); hold on; 
plot([1:150]+60,cml.h1.toa.swcf.ts.mon.land(m,:),'r');
plot([1:150]+60,cml.h2.toa.swcf.ts.mon.land(m,:),'r');
plot([1:150]+60,cml.h3.toa.swcf.ts.mon.land(m,:),'r');
axis([50 80 -32 -25])
figure; m=1;
plot([1:140],   cml.v0.toa.swcf.ts.mon.ocean(m,:),'b'); hold on; 
plot([1:150]+60,cml.h1.toa.swcf.ts.mon.ocean(m,:),'r');
plot([1:150]+60,cml.h2.toa.swcf.ts.mon.ocean(m,:),'r');
plot([1:150]+60,cml.h3.toa.swcf.ts.mon.ocean(m,:),'r');
axis([50 80 -70 -63])

figure; m=1;
plot([1:140],   cml.v0.toa.swcf.ts.mon.land(m,:),'b'); hold on; 
plot([1:150]+60,cml.h1.toa.swcf.ts.mon.land(m,:),'r');
plot([1:150]+60,cml.h2.toa.swcf.ts.mon.land(m,:),'r');
plot([1:150]+60,cml.h3.toa.swcf.ts.mon.land(m,:),'r');
axis([50 80 -32 -25])
figure; m=1;
plot([1:140],   cml.v0.toa.swcf.ts.mon.ocean(m,:),'b'); hold on; 
plot([1:150]+60,cml.h1.toa.swcf.ts.mon.ocean(m,:),'r');
plot([1:150]+60,cml.h2.toa.swcf.ts.mon.ocean(m,:),'r');
plot([1:150]+60,cml.h3.toa.swcf.ts.mon.ocean(m,:),'r');
axis([50 80 -70 -63])

%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure; m=1; y0=cml.v0.toa.swnet_clr.ts.mon.land(:,61);
plot([1:12],cml.h1.toa.swnet_clr.ts.mon.land(:,1)-y0,'r');hold on;
plot([1:12],cml.h2.toa.swnet_clr.ts.mon.land(:,1)-y0,'r');
plot([1:12],cml.h3.toa.swnet_clr.ts.mon.land(:,1)-y0,'r');title('land');
figure; m=1; y0=cml.v0.toa.swnet_clr.ts.mon.ocean(:,61);
plot([1:12],cml.h1.toa.swnet_clr.ts.mon.ocean(:,1)-y0,'r')-y0;hold on;
plot([1:12],cml.h2.toa.swnet_clr.ts.mon.ocean(:,1)-y0,'r')-y0;
plot([1:12],cml.h3.toa.swnet_clr.ts.mon.ocean(:,1)-y0,'r')-y0;title('ocean');

figure; m=1; y0=cml.v0.toa.lwnet_clr.ts.mon.land(:,61);
plot([1:12],cml.h1.toa.lwnet_clr.ts.mon.land(:,1)-y0,'r');hold on;
plot([1:12],cml.h2.toa.lwnet_clr.ts.mon.land(:,1)-y0,'r');
plot([1:12],cml.h3.toa.lwnet_clr.ts.mon.land(:,1)-y0,'r');title('land');
figure; m=1; y0=cml.v0.toa.lwnet_clr.ts.mon.ocean(:,61);
plot([1:12],cml.h1.toa.lwnet_clr.ts.mon.ocean(:,1)-y0,'r')-y0;hold on;
plot([1:12],cml.h2.toa.lwnet_clr.ts.mon.ocean(:,1)-y0,'r')-y0;
plot([1:12],cml.h3.toa.lwnet_clr.ts.mon.ocean(:,1)-y0,'r')-y0;title('ocean');

figure; m=1; y0=cml.v0.sfc.albedo.ts.mon.land(:,61);
plot([1:12],cml.h1.sfc.albedo.ts.mon.land(:,1)-y0,'r');hold on;
plot([1:12],cml.h2.sfc.albedo.ts.mon.land(:,1)-y0,'r');
plot([1:12],cml.h3.sfc.albedo.ts.mon.land(:,1)-y0,'r');title('land');
figure; m=1; y0=cml.v0.sfc.albedo.ts.mon.ocean(:,61);
plot([1:12],cml.h1.sfc.albedo.ts.mon.ocean(:,1)-y0,'r')-y0;hold on;
plot([1:12],cml.h2.sfc.albedo.ts.mon.ocean(:,1)-y0,'r')-y0;
plot([1:12],cml.h3.sfc.albedo.ts.mon.ocean(:,1)-y0,'r')-y0;title('ocean');


figure; m=1;
plot([1:12],cml.v0.toa.swcf.ts.mon.land(:,61),'b'); hold on; 
plot([1:12],cml.h1.toa.swcf.ts.mon.land(:,1),'r');
plot([1:12],cml.h2.toa.swcf.ts.mon.land(:,1),'r');
plot([1:12],cml.h3.toa.swcf.ts.mon.land(:,1),'r');title('land');
figure; m=1;
plot([1:12],cml.v0.toa.swcf.ts.mon.ocean(:,61),'b'); hold on; 
plot([1:12],cml.h1.toa.swcf.ts.mon.ocean(:,1),'r');
plot([1:12],cml.h2.toa.swcf.ts.mon.ocean(:,1),'r');
plot([1:12],cml.h3.toa.swcf.ts.mon.ocean(:,1),'r');title('ocean');


figure; m=1;
plot([1:12],cml.v0.tref.ts.mon.land(:,61),'b'); hold on; 
plot([1:12],cml.h1.tref.ts.mon.land(:,1),'r');
plot([1:12],cml.h2.tref.ts.mon.land(:,1),'r');
plot([1:12],cml.h3.tref.ts.mon.land(:,1),'r');title('land');
figure; m=1;
plot([1:12],cml.v0.tref.ts.mon.ocean(:,61),'b'); hold on; 
plot([1:12],cml.h1.tref.ts.mon.ocean(:,1),'r');
plot([1:12],cml.h2.tref.ts.mon.ocean(:,1),'r');
plot([1:12],cml.h3.tref.ts.mon.ocean(:,1),'r');title('ocean');


figure; m=1;
plot([1:12],cml.v0.pcp.ts.mon.land(:,61),'b'); hold on; 
plot([1:12],cml.h1.pcp.ts.mon.land(:,1),'r');
plot([1:12],cml.h2.pcp.ts.mon.land(:,1),'r');
plot([1:12],cml.h3.pcp.ts.mon.land(:,1),'r');title('land');
figure; m=1;
plot([1:12],cml.v0.pcp.ts.mon.ocean(:,61),'b'); hold on; 
plot([1:12],cml.h1.pcp.ts.mon.ocean(:,1),'r');
plot([1:12],cml.h2.pcp.ts.mon.ocean(:,1),'r');
plot([1:12],cml.h3.pcp.ts.mon.ocean(:,1),'r');title('ocean');




plot(v2.tref.ts.org_ann_nh,'r'); hold on; 
plot(v3.tref.ts.org_ann_nh,'r'); hold on; 
plot(v1.tref.ts.org_ann_sh,'b');
plot(v2.tref.ts.org_ann_sh,'b');
plot(v3.tref.ts.org_ann_sh,'b');


v=readsat_giss(); x.time0=v.year; y.sat_nh=v.nh; y.sat_sh=v.sh;
figure; plot(x.time0,y.sat_nh,'r'); hold on; plot(x.time0,y.sat_sh,'b');

a=read_global_ann_sat_giss(); x.time0=a(:,1); y.var0=a(:,2);

t=[1:80]+60; a=cml.v0.tref.ts.org_ann(61:end);
c=polyfit(t,a,1); z=t*c(1)+c(2); %figure; plot(t,a); hold on; plot(t,y,'r');
t=[1861:1:2010]; id=(t>=1950)&(t<=1980); x.time1=t;
a=cml.h1.tref.ts.org_ann-c(1)*t; a=a-mean(a(id)); y.var1=a;
a=cml.h2.tref.ts.org_ann-c(1)*t; a=a-mean(a(id)); y.var2=a;
a=cml.h3.tref.ts.org_ann-c(1)*t; a=a-mean(a(id)); y.var3=a;
expn='cml'; s=cml.v0.s; s.xl='year';
s.s0='GISS';              s.c0='k-';
s.s1='AM4OM2-g5r2-HIST1'; s.c1='r-';
s.s2='AM4OM2-g5r2-HIST2'; s.c2='g-';
s.s3='AM4OM2-g5r2-HIST3'; s.c3='b-';
vname='sat_ann'; s.xy=[1860 2015 -0.8 1.2]; s.opt=2;
s.yl='surface air temperature anomaly from 1951-1980 mean (C^\circ)';
plot_ts_hist(x,y,s,expn,vname);


pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(x.time0, x.sat, s.c0, 'LineWidth',lw*3); hold on;
a=cml.h1.tref.ts.org_ann-c(1)*t;a=a-mean(a(id));plot(t,a,s.c1,'LineWidth',lw*2);
a=cml.h2.tref.ts.org_ann-c(1)*t;a=a-mean(a(id));plot(t,a,s.c2,'LineWidth',lw*2);
a=cml.h3.tref.ts.org_ann-c(1)*t;a=a-mean(a(id));plot(t,a,s.c3,'LineWidth',lw*2);
legend(s.s0,s.s1,s.s2,s.s3,s.opt);
xlabel(s.xl,'FontSize',fsize); 
ylabel(s.yl,'FontSize',fsize); grid on;
axis(s.xy); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);

 plot_ts_hist(x,y,s,expn,vname);

a=read_global_ann_sat_giss();
x.time0=a(:,1); x.sat=a(:,2); %figure; plot(x.time0,x.sat);
t=[1861:1:2010]; id=(t>=1950)&(t<=1980); 
expn='cml'; s=cml.v0.s; s.xl='year';
s.s0='AM4OM2-g5r2-1860CNTL'; s.c0='k-';
s.s1='AM4OM2-g5r2-HIST1'; s.c1='r-';
s.s2='AM4OM2-g5r2-HIST2'; s.c2='g-';
s.s3='AM4OM2-g5r2-HIST3'; s.c3='b-';
vname='sat_ann'; s.xy=[1860 2010 12 15]; s.opt=2;
s.yl='surface air temperature anomaly from 1951-1980 mean (C^\circ)';
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
a=cml.v0.tref.ts.org_ann(61:end); t1=[1861:1:1860+80]; 
plot(t1,a,s.c0,'LineWidth',lw*2); hold on;
a=cml.h1.tref.ts.org_ann;plot(t,a,s.c1,'LineWidth',lw*2);
a=cml.h2.tref.ts.org_ann;plot(t,a,s.c2,'LineWidth',lw*2);
a=cml.h3.tref.ts.org_ann;plot(t,a,s.c3,'LineWidth',lw*2);
legend(s.s0,s.s1,s.s2,s.s3,s.opt);
xlabel(s.xl,'FontSize',fsize); 
ylabel(s.yl,'FontSize',fsize); grid on;
%axis(s.xy); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);





a=read_global_ann_sat_giss();
x.time0=a(:,1); x.sat=a(:,3); %figure; plot(x.time0,x.sat);
t=[1865:5:2010]; t=t-2.5; id=(t>=1955)&(t<=1980); 
expn='cml'; s=cml.v0.s; s.xl='year';
s.s0='OBS';               s.c0='k-';
s.s1='AM4OM2-g5r2-HIST1'; s.c1='r-';
s.s2='AM4OM2-g5r2-HIST2'; s.c2='g-';
s.s3='AM4OM2-g5r2-HIST3'; s.c3='b-';
vname='sat'; s.xy=[1860 2010 -0.8 1.2]; s.opt=2;
s.yl='surface air temperature anomaly from 1951-1980 mean (C^\circ)';
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(x.time0, x.sat, s.c0, 'LineWidth',lw*3); hold on;
b=mean(cml.v0.tref.ann.mmen.all(12:end));

a=cml.h1.tref.ann.mmen.all-b;a=a-mean(a(id));plot(t,a,s.c1,'LineWidth',lw*2);
a=cml.h2.tref.ann.mmen.all-b;a=a-mean(a(id));plot(t,a,s.c2,'LineWidth',lw*2);
a=cml.h3.tref.ann.mmen.all-b;a=a-mean(a(id));plot(t,a,s.c3,'LineWidth',lw*2);
legend(s.s0,s.s1,s.s2,s.s3,s.opt);
xlabel(s.xl,'FontSize',fsize); 
ylabel(s.yl,'FontSize',fsize); grid on;
axis(s.xy); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);

a=read_global_ann_sat_giss();
x.time0=a(:,1); x.sat=a(:,2); %figure; plot(x.time0,x.sat);
t=[1865:5:2010]; t=t-2.5; id=(t>=1955)&(t<=1980); 
expn='cml'; s=cml.v0.s; s.xl='year';
pms=[ 0, 0, 1100, 600]*1.2; fsize=18; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
a=cml.v0.tref.ann.mmen.all;plot(t,a,s.c1,'LineWidth',lw*2);hold on;
a=cml.h1.tref.ann.mmen.all;plot(t,a,s.c1,'LineWidth',lw*2);hold on;
a=cml.h2.tref.ann.mmen.all;plot(t,a,s.c2,'LineWidth',lw*2);
a=cml.h3.tref.ann.mmen.all;plot(t,a,s.c3,'LineWidth',lw*2);
legend(s.s1,s.s2,s.s3,s.opt);
xlabel(s.xl,'FontSize',fsize); 
ylabel(s.yl,'FontSize',fsize); grid on;
s.xy=[1860 2010 12.5 14.5]; vname='sat';
axis(s.xy); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);

pms=[ 0, 0, 1100, 600]*1.; fsize=18; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
tmp=squeeze(mean(cml.v0p.tref.dif_ann,1))-squeeze(mean(cml.v1p.tref.dif_ann,1));
lon=cml.v0p.lon; lat=cml.v0p.lat;
pcolor(lon,lat,tmp); shading flat; colorbar; caxis([-2 2]);
xlabel('longitude','FontSize',fsize); 
ylabel('latitude','FontSize',fsize); grid on;
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='diff_sat';
printit(visfig,figpath,expn,vname);


pms=[ 0, 0, 1100, 600]*1.; fsize=18; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
tmp=squeeze(mean(cml.v0p.tref.dif_ann,1));
lon=cml.v0p.lon; lat=cml.v0p.lat;
pcolor(lon,lat,tmp); shading flat; colorbar; caxis([-8 8]);
xlabel('longitude','FontSize',fsize); 
ylabel('latitude','FontSize',fsize); grid on;
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='g5r2_sat';
printit(visfig,figpath,expn,vname);

pms=[ 0, 0, 1100, 600]*1.; fsize=18; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
tmp=squeeze(mean(cml.v1p.tref.dif_ann,1));
lon=cml.v0p.lon; lat=cml.v0p.lat;
pcolor(lon,lat,tmp); shading flat; colorbar; caxis([-8 8]);
xlabel('longitude','FontSize',fsize); 
ylabel('latitude','FontSize',fsize); grid on;
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='g5r1_sat';
printit(visfig,figpath,expn,vname);

pms=[ 0, 0, 1100, 600]*1.; fsize=18; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
tmp=squeeze(mean(cml.v0p.pcp.dif_ann,1));
lon=cml.v0p.lon; lat=cml.v0p.lat;
pcolor(lon,lat,tmp); shading flat; colorbar; caxis([-8 8]);
xlabel('longitude','FontSize',fsize); 
ylabel('latitude','FontSize',fsize); grid on;
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='g5r2_pcp';
printit(visfig,figpath,expn,vname);

pms=[ 0, 0, 1100, 600]*1.; fsize=18; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
tmp=squeeze(mean(cml.v1p.pcp.dif_ann,1));
lon=cml.v0p.lon; lat=cml.v0p.lat;
pcolor(lon,lat,tmp); shading flat; colorbar; caxis([-8 8]);
xlabel('longitude','FontSize',fsize); 
ylabel('latitude','FontSize',fsize); grid on;
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; vname='g5r1_pcp';
printit(visfig,figpath,expn,vname);



%Time series plots%%%%%%%%%%%%%%%
%Time series plots%%%%%%%%%%%%%%%
%Time series plots%%%%%%%%%%%%%%%
expn='cml'; s=cml.v0.s; s.xl='year';
x.time1 =[5:5:140];   s.s1 ='AM4g5r2+OM2F-1860CNTL';      s.c1 ='*b--';
x.time2 =[5:5:90]+60; s.s2 ='AM4g5r2+OM2F-1860CNTL-4xCO2';s.c2 ='*r--';
x.time3 =[5:5:140];   s.s3 ='AM4g5r2+OM2F-2000CNTL';      s.c3 ='*b-';
x.time4 =[5:5:80]+60; s.s4 ='AM4g5r2+OM2F-2000CNTL-1%CO2';s.c4 ='*r-';
x.time5 =[5:5:100];   s.s5 ='CM2.5-1990CNTL';             s.c5 ='*c-';
%x.time5 =[5:5:140];   s.s5 ='AM4g5r2+OM2F-2000CNTL';    s.c5 ='*r-';

%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_ts_r1r2'; s.xy=[0 150 12 18]; s.opt=2;
s.yl='surface air temperature (C^\circ)';
pms=[ 0, 0, 1100, 600]*1.; fsize=18; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(x.time1, cml.v0p.tref.ann.mmen.all, s.c3,  'LineWidth',lw*3); hold on; 
plot(x.time2, cml.v1p.tref.ann.mmen.all, s.c5,  'LineWidth',lw*3);
legend(s.s3,s.s5,s.opt);
xlabel(s.xl,'FontSize',fsize); 
ylabel(s.yl,'FontSize',fsize); grid on;
axis(s.xy); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_ts_r1r2'; s.xy=[0 150 -0.5 6]; s.opt=2;
s.yl='NETRADTOA (W/m2)'; 
pms=[ 0, 0, 1100, 600]*1.; fsize=18; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
plot(x.time1, cml.v0p.toa.netrad.ann.mmen.all, s.c3,  'LineWidth',lw*3); hold on; 
plot(x.time2, cml.v1p.toa.netrad.ann.mmen.all, s.c5,  'LineWidth',lw*3);
legend(s.s3,s.s5,s.opt);
xlabel(s.xl,'FontSize',fsize); 
ylabel(s.yl,'FontSize',fsize); grid on;
axis(s.xy); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_cml/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_ts'; s.xy=[0 150 12 18]; s.opt=2;
s.yl='surface air temperature (C^\circ)';
y.var1 =cml.v0.tref.ann.mmen.all; 
y.var2 =cml.w0.tref.ann.mmen.all; %y.var2 =cml.ww.tref.ann.mmen.all;
y.var3 =cml.v0p.tref.ann.mmen.all;
y.var4 =cml.w0p.tref.ann.mmen.all; 
y.var5 =cm25.tref.ann.mmen.all;
plot_ts_cml(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_ts'; s.xy=[0 150 -0.5 6]; s.opt=2;
s.yl='NETRADTOA (W/m2)'; 
y.var1 =cml.v0.toa.netrad.ann.mmen.all; 
y.var2 =cml.w0.toa.netrad.ann.mmen.all; %y.var2 =cml.ww.toa.netrad.ann.mmen.all;
y.var3 =cml.v0p.toa.netrad.ann.mmen.all;
y.var4 =cml.w0p.toa.netrad.ann.mmen.all;%y.var6 =cm25.toa.netrad.ann.mmen.all;
plot_ts_cml1(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcf_ts'; s.xy=[0 150 24.5 27.5]; s.opt=2;
s.yl='LW CRE (W/m2)'; 
y.var1 =cml.v0.toa.lwcf.ann.mmen.all; 
y.var2 =cml.w0.toa.lwcf.ann.mmen.all; %y.var3 =cml.ww.toa.lwcf.ann.mmen.all;
y.var3 =cml.v0p.toa.lwcf.ann.mmen.all;
y.var4 =cml.w0p.toa.lwcf.ann.mmen.all;%y.var6 =cm25.toa.lwcf.ann.mmen.all;
plot_ts_cml1(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcf_ts'; s.xy=[0 150 -51.5 -48.5]; s.opt=3;
s.yl='SW CRE (W/m2)'; 
y.var1 =cml.v0.toa.swcf.ann.mmen.all; 
y.var2 =cml.w0.toa.swcf.ann.mmen.all; %y.var3 =cml.ww.toa.swcf.ann.mmen.all;
y.var3 =cml.v0p.toa.swcf.ann.mmen.all;
y.var4 =cml.w0p.toa.swcf.ann.mmen.all;%y.var6 =cm25.toa.swcf.ann.mmen.all;
plot_ts_cml1(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ttcf_ts'; s.xy=[0 150 -26 -23]; s.opt=3;
s.yl='total CRE (W/m2)'; 
y.var1 =cml.v0.toa.ttcf.ann.mmen.all; 
y.var2 =cml.w0.toa.ttcf.ann.mmen.all; %y.var3 =cml.ww.toa.ttcf.ann.mmen.all;
y.var3 =cml.v0p.toa.ttcf.ann.mmen.all;
y.var4 =cml.w0p.toa.ttcf.ann.mmen.all; y.var6 =cm25.toa.ttcf.ann.mmen.all;
plot_ts_cml1(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_clr_ts'; s.xy=[0 150 258 266]; s.opt=4;
s.yl='LW CLR (W/m2)'; 
y.var1 =cml.v0.toa.lwnet_clr.ann.mmen.all; 
y.var2 =cml.w0.toa.lwnet_clr.ann.mmen.all; %y.var2 =cml.ww.toa.lwnet_clr.ann.mmen.all;
y.var3 =cml.v0p.toa.lwnet_clr.ann.mmen.all;
y.var4 =cml.w0p.toa.lwnet_clr.ann.mmen.all;%y.var6 =cm25.toa.lwnet_clr.ann.mmen.all;
plot_ts_cml1(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet_clr_ts'; s.xy=[0 150 286 294]; s.opt=2;
s.yl='SW CLR (W/m2)'; 
y.var1 =cml.v0.toa.swnet_clr.ann.mmen.all; 
y.var2 =cml.w0.toa.swnet_clr.ann.mmen.all; 
y.var3 =cml.v0p.toa.swnet_clr.ann.mmen.all;
y.var4 =cml.w0p.toa.swnet_clr.ann.mmen.all; %y.var5 =cm25.toa.swnet_clr.ann.mmen.all;
plot_ts_cml1(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_ts'; s.xy=[0 150 233.5 239.5]; s.opt=4;
s.yl='TOA net LW (W/m2)'; 
y.var1 =cml.v0.toa.lwnet.ann.mmen.all; 
y.var2 =cml.w0.toa.lwnet.ann.mmen.all;
y.var3 =cml.v0p.toa.lwnet.ann.mmen.all;
y.var4 =cml.w0p.toa.lwnet.ann.mmen.all; %y.var5 =cm25.toa.lwnet.ann.mmen.all;
plot_ts_cml1(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet_ts'; s.xy=[0 150 236 242]; s.opt=2;
s.yl='TOA net SW (W/m2)'; 
y.var1 =cml.v0.toa.swnet.ann.mmen.all; 
y.var2 =cml.w0.toa.swnet.ann.mmen.all;
y.var3 =cml.v0p.toa.swnet.ann.mmen.all;
y.var4 =cml.w0p.toa.swnet.ann.mmen.all;
y.var5 =cm25.toa.swnet.ann.mmen.all;
plot_ts_cml1(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_sfc_ts'; s.xy=[0 150 -61 -52]; s.opt=2;
s.yl='surface net LW (W/m2)'; 
y.var1 =cml.v0.sfc.lwnet.ann.mmen.all; 
y.var2 =cml.w0.sfc.lwnet.ann.mmen.all;
y.var3 =cml.v0p.sfc.lwnet.ann.mmen.all;
y.var4 =cml.w0p.sfc.lwnet.ann.mmen.all;
y.var5 =cm25.sfc.lwnet.ann.mmen.all;
plot_ts_cml1(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet_sfc_ts'; s.xy=[0 150 159 165]; s.opt=3;
s.yl='surface net SW (W/m2)'; 
y.var1 =cml.v0.sfc.swnet.ann.mmen.all; 
y.var2 =cml.w0.sfc.swnet.ann.mmen.all;
y.var3 =cml.v0p.sfc.swnet.ann.mmen.all;
y.var4 =cml.w0p.sfc.swnet.ann.mmen.all;
y.var5 =cm25.sfc.swnet.ann.mmen.all;
plot_ts_cml1(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_ts'; s.xy=[0 150 2.8 3.1]; s.opt=2;
s.yl='Precipitation (mm/day)'; 
y.var1 =cml.v0.pcp.ann.mmen.all; 
y.var2 =cml.w0.pcp.ann.mmen.all;
y.var3 =cml.v0p.pcp.ann.mmen.all;
y.var4 =cml.w0p.pcp.ann.mmen.all;
y.var5 =cm25.pcp.ann.mmen.all;
plot_ts_cml(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_ts_rmse'; s.xy=[0 150 1.3 2]; s.opt=2;
s.yl='surface air temperature (C^\circ)';
y.var3 =cml.v0p.tref.ann.rmse.all;
y.var5 =cm25.tref.ann.rmse.all;
y.var5 =cml.v1p.tref.ann.rmse.all;
plot_ts_rmse(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_ts_rmse'; s.xy=[0 150 7 10]; s.opt=2;
s.yl='NETRADTOA (W/m2)';
y.var3 =cml.v0p.toa.netrad.ann.rmse.all;
y.var5 =cm25.toa.netrad.ann.rmse.all;
y.var5 =cml.v1p.toa.netrad.ann.rmse.all;
plot_ts_rmse(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='olr_ts_rmse'; s.xy=[0 150 6 9]; s.opt=3;
s.yl='OLR (W/m2)';
y.var3 =cml.v0p.toa.lwnet.ann.rmse.all;
y.var5 =cm25.toa.lwnet.ann.rmse.all;
y.var5 =cml.v1p.toa.lwnet.ann.rmse.all;
plot_ts_rmse(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swabs_ts_rmse'; s.xy=[0 150 10 13]; s.opt=2;
s.yl='SWABS (W/m2)';
y.var3 =cml.v0p.toa.swnet.ann.rmse.all;
y.var5 =cm25.toa.swnet.ann.rmse.all;
y.var5 =cml.v1p.toa.swnet.ann.rmse.all;
plot_ts_rmse(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcf_ts_rmse'; s.xy=[0 150 5 8]; s.opt=2;
s.yl='LW CRE (W/m2)';
y.var3 =cml.v0p.toa.lwcf.ann.rmse.all;
y.var5 =cm25.toa.lwcf.ann.rmse.all;
y.var5 =cml.v1p.toa.lwcf.ann.rmse.all;
plot_ts_rmse(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcf_ts_rmse'; s.xy=[0 150 9 12]; s.opt=2;
s.yl='SW CRE (W/m2)';
y.var3 =cml.v0p.toa.swcf.ann.rmse.all;
y.var5 =cm25.toa.swcf.ann.rmse.all;
y.var5 =cml.v1p.toa.swcf.ann.rmse.all;
plot_ts_rmse(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ttcf_ts_rmse'; s.xy=[0 150 7 10]; s.opt=4;
s.yl='total CRE (W/m2)';
y.var3 =cml.v0p.toa.ttcf.ann.rmse.all;
y.var5 =cm25.toa.ttcf.ann.rmse.all;
y.var5 =cml.v1p.toa.ttcf.ann.rmse.all;
plot_ts_rmse(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_ts_rmse'; s.xy=[0 150 1 1.5]; s.opt=2;
s.yl='Precipitation (mm/day)';
y.var3 =cml.v0p.pcp.ann.rmse.all;
y.var5 =cm25.pcp.ann.rmse.all;
y.var5 =cml.v1p.pcp.ann.rmse.all;
plot_ts_rmse(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_ts_rmse'; s.xy=[0 150 1 1.5]; s.opt=2;
s.yl='Precipitation (mm/day)';
y.var3 =cml.v0p.pcp.ann.rmse.all;
y.var5 =cm25.pcp.ann.rmse.all;
y.var5 =cml.v1p.pcp.ann.rmse.all;
plot_ts_rmse(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
%Latitudinal plots%%%%%%%%%%%%%%%
%Latitudinal plots%%%%%%%%%%%%%%%
%Latitudinal plots%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_latdis'; f=1; x.lat=s.lat;
z6 =cml.w0.tref.ann.latdis.all-cml.v1.tref.ann.latdis.all;
z7 =cml.w0.tref.ann.latdis.all-cml.v0.tref.ann.latdis.all;
z8 =cml.w1.tref.ann.latdis.all-cml.v1.tref.ann.latdis.all;
z9 =cml.w2.tref.ann.latdis.all-cml.v2.tref.ann.latdis.all;
z10=cml.w3.tref.ann.latdis.all-cml.v3.tref.ann.latdis.all;
dk=4; tmp=z9; n=length(tmp(:,1)); k1=n-dk+1; k2=n;
y.var1 =squeeze(mean(z1(1:dk,:),1));  y.var2 =squeeze(mean(z1(k1:k2,:),1));
y.var3 =squeeze(mean(z2(1:dk,:),1));  y.var4 =squeeze(mean(z2(k1:k2,:),1));
y.var5 =squeeze(mean(z3(1:dk,:),1));  y.var6 =squeeze(mean(z3(k1:k2,:),1));
y.var7 =squeeze(mean(z4(1:dk,:),1));  y.var8 =squeeze(mean(z4(k1:k2,:),1));
y.var9 =squeeze(mean(z5(1:dk-1,:),1));y.var10=squeeze(mean(z5(k1:k2-1,:),1));
y.var11=squeeze(mean(z6(1:dk,:),1));  y.var12=squeeze(mean(z6(k1:k2,:),1));
y.var13=squeeze(mean(z7(1:dk,:),1));  y.var14=squeeze(mean(z7(k1:k2,:),1));
y.var15=squeeze(mean(z8(1:dk,:),1));  y.var16=squeeze(mean(z8(k1:k2,:),1));
y.var17=squeeze(mean(z9(1:dk,:),1));  y.var18=squeeze(mean(z9(k1:k2,:),1));
y.var19=squeeze(mean(z10(1:dk,:),1)); y.var20=squeeze(mean(z10(k1:k2,:),1));
s.xl='latitude'; s.yl='change in surface air temperature (C)'; 
s.xy0=[-90 90 -2 8]; s.xy=[-90 90 0 8]; s.opt=2; 
plot_latdis_cm4(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_diff'; f=1; s=cml.v0.s; dn=6; 
z1=squeeze(mean(cml.v0.tref.dif_ann(end-dn+1:end,:,:),1));
z2=squeeze(mean(cm25.tref.dif_ann  (end-dn+1:end,:,:),1));
cmin=-11; cmax=11; vbin=[cmin:(cmax-cmin)/100:cmax]; 
lat=s.lat; lon=s.lon; lm=s.lm0; lm(lm>0.5)=1; 
xmin=s.latlon(1); xmax=s.latlon(2); ymin=s.latlon(3); ymax=s.latlon(4);
pms=[ 0, 0, 600, 600]; warning off all; fac=20; fsize=16;
handle = figure('Position', pms,'visible','on'); 
row=2; col=1; id=(lm==1);
subplot(row,col,1); 
contourf(lon,lat,z1,vbin); hold on; shading flat; colorbar; contour(lon,lat,lm,'k');
caxis([cmin cmax]); axis([xmin xmax ymin ymax]); 
%title(s.s1,'FontSize',fsize);
subplot(row,col,2);
contourf(lon,lat,z2,vbin); hold on; shading flat; colorbar; contour(lon,lat,lm,'k');
caxis([cmin cmax]); axis([xmin xmax ymin ymax]);
%title(s.s2,'FontSize',fsize);
visfig='off'; printit(visfig,fpath,expn,vname);

figure; pcolor(z1); shading flat; colorbar

z1=squeeze(mean(z1(k1:k2,:,:),1));
z2=squeeze(mean(z2(k1:k2,:,:),1));
z3=squeeze(mean(z3(k1:k2,:,:),1));
z4=squeeze(mean(z4(k1:k2,:,:),1));
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/100:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ttcftoa_diff'; f=1; s=cm4.v1.s; k1=13;k2=15; k1=1;k2=4;
z1=cm2.w0.ttcftoa.dif_myr-cm2.v0.ttcftoa.dif_myr; s.s1='CM2.1';
z2=cm3.w0.ttcftoa.dif_myr-cm3.v0.ttcftoa.dif_myr; s.s2='CM3';
z3=cm4.w0.ttcftoa.dif_myr-cm4.v0.ttcftoa.dif_myr(end-15:end,:,:); s.s3='CM4c3';
z4=cm4.w1.ttcftoa.dif_myr-cm4.v1.ttcftoa.dif_myr(end-15:end,:,:); s.s4='CM4a3';
%z4=cm4.w2.ttcftoa.dif_myr-cm4.v2.ttcftoa.dif_myr(end-3:end,:,:); s.s4='CM4f3';
z1=squeeze(mean(z1(k1:k2,:,:),1));
z2=squeeze(mean(z2(k1:k2,:,:),1));
z3=squeeze(mean(z3(k1:k2,:,:),1));
z4=squeeze(mean(z4(k1:k2,:,:),1));
cmin=-2; cmax=2; vbin=[cmin:(cmax-cmin)/100:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ttcf_diff'; f=1; s=am4.v1.s;
z1=am4.w1.ttcftoa.avg_sea-am4.v1.ttcftoa.avg_sea; z1=squeeze(z1(1,:,:));s.s1='AM4a3';
z2=am4.w2.ttcftoa.avg_sea-am4.v2.ttcftoa.avg_sea; z2=squeeze(z2(1,:,:));s.s2='AM4f3';
dk=4; k1=12; k2=16; %dk=12; 1%CO2 run averaged for year 60-80
z3=cm4.w1.ttcftoa.dif_myr(k1:k2,:,:)-cm4.v1.ttcftoa.dif_myr(k1+dk:k2+dk,:,:);
z3=squeeze(mean(z3,1));s.s3='CM4-AM4a3';
dk=12; k1=12; k2=16; dk=12; %1%CO2 run averaged for year 60-80
z4=cm4.w0.ttcftoa.dif_myr(k1:k2,:,:)-cm4.v0.ttcftoa.dif_myr(k1+dk:k2+dk,:,:);
z4=squeeze(mean(z4,1));s.s4='CM4-AM4c3';
cmin=-8; cmax=8; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,3);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_diff'; f=1; s=am4.v1.s;
z1=am4.w1.tref.avg_sea-am4.v1.tref.avg_sea; z1=squeeze(z1(1,:,:));s.s1='AM4a3';
z2=am4.w2.tref.avg_sea-am4.v2.tref.avg_sea; z2=squeeze(z2(1,:,:));s.s2='AM4f3';
dk=4; k1=12; k2=16; %dk=12; 1%CO2 run averaged for year 60-80
z3=cm4.w1.tref.dif_myr(k1:k2,:,:)-cm4.v1.tref.dif_myr(k1+dk:k2+dk,:,:);
z3=squeeze(mean(z3,1));s.s3='CM4-AM4a3';
dk=12; k1=12; k2=16; dk=12; %1%CO2 run averaged for year 60-80
z4=cm4.w0.tref.dif_myr(k1:k2,:,:)-cm4.v0.tref.dif_myr(k1+dk:k2+dk,:,:);
z4=squeeze(mean(z4,1));s.s4='CM4-AM4c3';
cmin=0; cmax=5; vbin=[cmin:(cmax-cmin)/100:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tas_diff'; k1=12; k2=16; dk=4; f=1; s=z.v1.s; s0=expn; s0(s0=='_')='-';
z1=z.w1.tref.dif_myr(k1:k2,:,:)-z.v1.tref.dif_myr(k1+dk:k2+dk,:,:);
z1=squeeze(mean(z1,1));s.s1='CM4-c96L48-AM4a3';
%z2=z.w2.tref.dif_myr(k1:k2,:,:)-z.v2.tref.dif_myr(k1+dk:k2+dk,:,:);
%z2=squeeze(mean(z2,1));s.s1='CM4-c96L48-AM4f3';
z3=a01w.tref.dif_myr(k1:k2,:,:)-a01c.tref.dif_myr(k1+dk:k2+dk,:,:);
z3=squeeze(mean(z3,1));s.s1='CM4-c96L48-AM4c3';
z4=z3; z2=z1;
s.s1=sprintf('CM4-c96L48-AM4a3');
s.s2=sprintf('CM4-c96L48-AM4a3');
s.s3=sprintf('CM4-c96L48-AM4c3');
s.s4=sprintf('CM4-c96L48-AM4f3');
cmin=-4.5; cmax=4.5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,3);
%%%%%%%%%%%%%%%%%%%%%%%%%%




%Plot time series%%%%%%%%%
expn='cm4'; s.xl='year'; 
x.time0=[2.5:5:100];   s.s0='OBS'; 
x.time1=[2.5:5:100];   s.s1='CM2.5';
x.time2=[2.5:5:100];   s.s2='CM2.5-Touchstone';
x.time3=[2.5:5:90];    s.s3='CM4-C192L48-AM4a3';    %z.v0
x.time4=[2.5:5:90];    s.s4='CM4-C96L48-AM4a3';     %z.v1
x.time5=[2.5:5:45];    s.s5='CM4-C96L48-AM4f3';     %z.v2
x.time6=[2.5:5:50]+60; s.s6='CM4-C96L48-AM4a3-1PCT';%z.v3
x.time7=[2.5:5:15];    s.s7='CM4-C96L48-AM4e3';     %z.v4
%SST%%%%%%%%%%%%%%%%%%%%%%
vname='sst_mean'; s.xy=[1 120 18 22]; s.opt=2; s.yl='SST (C^\circ)'; 
y.var0=cm25.sst.omen -273.15; 
y.var1=cm25.sst.mmen -273.15; y.var2=cm2t.sst.mmen -273.15;
y.var3=z.v0.sst.mmen -273.15;
y.var4=z.v1.sst.mmen -273.15;
y.var5=z.v2.sst.mmen -273.15;
y.var6=z.v4.sst.mmen -273.15;
plot_ts_cm4(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='sst_bias'; s.xy=[1 100 0 1.8]; s.opt=4; s.yl='SST RMSE (C^\circ)'; 
y.var0=cm25.sst.rmse; y.var1=cm25.sst.rmse; y.var2=cm2t.sst.rmse;
y.var3=z.v0.sst.rmse;
y.var4=z.v1.sst.rmse;
y.var5=z.v2.sst.rmse;
y.var6=z.v4.sst.rmse;
plot_ts_cm4(x,y,s,expn,vname);
%NETRADTOA%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_mean'; s.xy=[1 100 -2 2]; s.opt=4; s.yl='NETRADTOA (W/m2)';
x.time0=[2.5:5:100]; y.var0=cm25.netradtoa.omen;
x.time1=[2.5:5:100]; y.var1=cm25.netradtoa.mmen;
x.time2=[2.5:5:100]; y.var2=cm2t.netradtoa.mmen;
x.time3=[2.5:5:60];  y.var3=z.v0.netradtoa.mmen;
x.time4=[2.5:5:80];  y.var4=z.v1.netradtoa.mmen;
x.time5=[2.5:5:30];  y.var5=z.v2.netradtoa.mmen;
x.time6=[2.5:5:15];  y.var6=z.v3.netradtoa.mmen;
plot_ts_cm4(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_rmse'; s.yl='NETRADTOA RMSE (W/m2)'; s.xl='year'; 
s.xy=[1 100 8 12]; expn='cm4';
s.s0='OBS'; s.s1='CM2.5'; s.s2='CM2.5-Touchstone'; s.s3='CM4-C192A1'; 
s.s4='CM4-C96A1'; s.s5='CM4-C96F3';  s.s6='CM4-C96E3'; s.opt=0;
x.time0=[2.5:5:100]; y.var0=cm25.netradtoa.rmse;
x.time1=[2.5:5:100]; y.var1=cm25.netradtoa.rmse;
x.time2=[2.5:5:100]; y.var2=cm2t.netradtoa.rmse;
x.time3=[2.5:5:60];  y.var3=z.v0.netradtoa.rmse;
x.time4=[2.5:5:80];  y.var4=z.v1.netradtoa.rmse;
x.time5=[2.5:5:30];  y.var5=z.v2.netradtoa.rmse;
x.time6=[2.5:5:15];  y.var6=z.v3.netradtoa.rmse;
plot_ts_cm4(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%OLR%%%%%%%%%%%%%%%%%%%%%%
vname='olr_mean'; s.yl='OLR (W/m2)'; s.xl='year'; 
s.xy=[1 100 234 240]; expn='cm4';
s.s0='OBS'; s.s1='CM2.5'; s.s2='CM2.5-Touchstone'; s.s3='CM4-C192A1'; 
s.s4='CM4-C96A1'; s.s5='CM4-C96F3'; s.s6='CM4-C96E3'; s.opt=4;
x.time0=[2.5:5:100]; y.var0=cm25.olr.omen;
x.time1=[2.5:5:100]; y.var1=cm25.olr.mmen;
x.time2=[2.5:5:100]; y.var2=cm2t.olr.mmen;
x.time3=[2.5:5:60];  y.var3=z.v0.olr.mmen;
x.time4=[2.5:5:80];  y.var4=z.v1.olr.mmen;
x.time5=[2.5:5:30];  y.var5=z.v2.olr.mmen;
x.time6=[2.5:5:15];  y.var6=z.v3.olr.mmen;
plot_ts_cm4(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='olr_rmse'; s.yl='OLR RMSE (W/m2)'; s.xl='year'; 
s.xy=[1 100 4 10]; expn='cm4';
s.s0='OBS'; s.s1='CM2.5'; s.s2='CM2.5-Touchstone'; s.s3='CM4-C192A1'; 
s.s4='CM4-C96A1'; s.s5='CM4-C96F3';  s.s6='CM4-C96E3'; s.opt=0;
x.time0=[2.5:5:100]; y.var0=cm25.olr.rmse;
x.time1=[2.5:5:100]; y.var1=cm25.olr.rmse;
x.time2=[2.5:5:100]; y.var2=cm2t.olr.rmse;
x.time3=[2.5:5:60];  y.var3=z.v0.olr.rmse;
x.time4=[2.5:5:80];  y.var4=z.v1.olr.rmse;
x.time5=[2.5:5:30];  y.var5=z.v2.olr.rmse;
x.time6=[2.5:5:15];  y.var6=z.v3.olr.rmse;
plot_ts_cm4(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%SWABS%%%%%%%%%%%%%%%%%%%%
vname='swabs_mean'; s.yl='SWABS (W/m2)'; s.xl='year'; 
s.xy=[1 100 235 241]; expn='cm4';
s.s0='OBS'; s.s1='CM2.5'; s.s2='CM2.5-Touchstone'; s.s3='CM4-C192A1'; 
s.s4='CM4-C96A1'; s.s5='CM4-C96F3'; s.s6='CM4-C96E3'; s.opt=4;
x.time0=[2.5:5:100]; y.var0=cm25.swabs.omen;
x.time1=[2.5:5:100]; y.var1=cm25.swabs.mmen;
x.time2=[2.5:5:100]; y.var2=cm2t.swabs.mmen;
x.time3=[2.5:5:60];  y.var3=z.v0.swabs.mmen;
x.time4=[2.5:5:80];  y.var4=z.v1.swabs.mmen;
x.time5=[2.5:5:30];  y.var5=z.v2.swabs.mmen;
x.time6=[2.5:5:15];  y.var6=z.v3.swabs.mmen;
plot_ts_cm4(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swabs_rmse'; s.yl='SWABS RMSE (W/m2)'; s.xl='year'; 
s.xy=[1 100 7 13.5]; expn='cm4';
s.s0='OBS'; s.s1='CM2.5'; s.s2='CM2.5-Touchstone'; s.s3='CM4-C192A1'; 
s.s4='CM4-C96A1'; s.s5='CM4-C96F3';  s.s6='CM4-C96E3'; s.opt=0;
x.time0=[2.5:5:100]; y.var0=cm25.swabs.rmse;
x.time1=[2.5:5:100]; y.var1=cm25.swabs.rmse;
x.time2=[2.5:5:100]; y.var2=cm2t.swabs.rmse;
x.time3=[2.5:5:60];  y.var3=z.v0.swabs.rmse;
x.time4=[2.5:5:80];  y.var4=z.v1.swabs.rmse;
x.time5=[2.5:5:30];  y.var5=z.v2.swabs.rmse;
x.time6=[2.5:5:15];  y.var6=z.v3.swabs.rmse;
plot_ts_cm4(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%NETFLXSFC%%%%%%%%%%%%%%%%
vname='netflxsfc_mean'; s.yl='NETFLXSFC (W/m2)'; s.xl='year'; 
s.xy=[1 100 -2 2]; expn='cm4';
s.s0='OBS'; s.s1='CM2.5'; s.s2='CM2.5-Touchstone'; s.s3='CM4-C192A1'; 
s.s4='CM4-C96A1'; s.s5='CM4-C96F3'; s.s6='CM4-C96E3'; s.opt=4;
x.time0=[2.5:5:100]; y.var0=cm25.netflxsfc.omen;
x.time1=[2.5:5:100]; y.var1=cm25.netflxsfc.mmen;
x.time2=[2.5:5:100]; y.var2=cm2t.netflxsfc.mmen;
x.time3=[2.5:5:60];  y.var3=z.v0.netflxsfc.mmen;
x.time4=[2.5:5:80];  y.var4=z.v1.netflxsfc.mmen;
x.time5=[2.5:5:30];  y.var5=z.v2.netflxsfc.mmen;
x.time6=[2.5:5:15];  y.var6=z.v3.netflxsfc.mmen;
plot_ts_cm4(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netflxsfc_rmse'; s.yl='NETFLXSFC RMSE (W/m2)'; s.xl='year'; 
s.xy=[1 100 15 19]; expn='cm4';
s.s0='OBS'; s.s1='CM2.5'; s.s2='CM2.5-Touchstone'; s.s3='CM4-C192A1'; 
s.s4='CM4-C96A1'; s.s5='CM4-C96F3';  s.s6='CM4-C96E3'; s.opt=0;
x.time0=[2.5:5:100]; y.var0=cm25.netflxsfc.rmse;
x.time1=[2.5:5:100]; y.var1=cm25.netflxsfc.rmse;
x.time2=[2.5:5:100]; y.var2=cm2t.netflxsfc.rmse;
x.time3=[2.5:5:60];  y.var3=z.v0.netflxsfc.rmse;
x.time4=[2.5:5:80];  y.var4=z.v1.netflxsfc.rmse;
x.time5=[2.5:5:30];  y.var5=z.v2.netflxsfc.rmse;
x.time6=[2.5:5:15];  y.var6=z.v3.netflxsfc.rmse;
plot_ts_cm4(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%NETRADSFC%%%%%%%%%%%%%%%%%%%%%%
vname='netradsfc_mean'; s.yl='NETRADSFC (W/m2)'; s.xl='year'; 
s.xy=[1 100 95 110]; expn='cm4';
s.s0='OBS'; s.s1='CM2.5'; s.s2='CM2.5-Touchstone'; s.s3='CM4-C192A1'; 
s.s4='CM4-C96A1'; s.s5='CM4-C96F3'; s.s6='CM4-C96E3'; s.opt=4;
x.time0=[2.5:5:100]; y.var0=cm25.netradsfc.omen;
x.time1=[2.5:5:100]; y.var1=cm25.netradsfc.mmen;
x.time2=[2.5:5:100]; y.var2=cm2t.netradsfc.mmen;
x.time3=[2.5:5:60];  y.var3=z.v0.netradsfc.mmen;
x.time4=[2.5:5:80];  y.var4=z.v1.netradsfc.mmen;
x.time5=[2.5:5:30];  y.var5=z.v2.netradsfc.mmen;
x.time6=[2.5:5:15];  y.var6=z.v3.netradsfc.mmen;
plot_ts_cm4(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradsfc_rmse'; s.yl='NETRADSFC RMSE (W/m2)'; s.xl='year'; 
s.xy=[1 100 8 13.5]; expn='cm4';
s.s0='OBS'; s.s1='CM2.5'; s.s2='CM2.5-Touchstone'; s.s3='CM4-C192A1'; 
s.s4='CM4-C96A1'; s.s5='CM4-C96F3';  s.s6='CM4-C96E3'; s.opt=0;
x.time0=[2.5:5:100]; y.var0=cm25.netradsfc.rmse;
x.time1=[2.5:5:100]; y.var1=cm25.netradsfc.rmse;
x.time2=[2.5:5:100]; y.var2=cm2t.netradsfc.rmse;
x.time3=[2.5:5:60];  y.var3=z.v0.netradsfc.rmse;
x.time4=[2.5:5:80];  y.var4=z.v1.netradsfc.rmse;
x.time5=[2.5:5:30];  y.var5=z.v2.netradsfc.rmse;
x.time6=[2.5:5:15];  y.var6=z.v3.netradsfc.rmse;
plot_ts_cm4(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%NETFLXSFC%%%%%%%%%%%%%%%%
vname='evap_mean'; s.yl='surface latent heat flux (W/m2)'; s.xl='year'; 
s.xy=[1 100 77 90]; expn='cm4';
s.s0='OBS'; s.s1='CM2.5'; s.s2='CM2.5-Touchstone'; s.s3='CM4-C192A1'; 
s.s4='CM4-C96A1'; s.s5='CM4-C96F3'; s.s6='CM4-C96E3'; s.opt=4;
x.time0=[2.5:5:100]; y.var0=cm25.evap.omen;
x.time1=[2.5:5:100]; y.var1=cm25.evap.mmen;
x.time2=[2.5:5:100]; y.var2=cm2t.evap.mmen;
x.time3=[2.5:5:60];  y.var3=z.v0.evap.mmen;
x.time4=[2.5:5:80];  y.var4=z.v1.evap.mmen;
x.time5=[2.5:5:30];  y.var5=z.v2.evap.mmen;
x.time6=[2.5:5:15];  y.var6=z.v3.evap.mmen;
plot_ts_cm4(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='evap_rmse'; s.yl='surface latent heat flux RMSE (W/m2)'; s.xl='year'; 
s.xy=[1 100 15 19]; expn='cm4';
s.s0='OBS'; s.s1='CM2.5'; s.s2='CM2.5-Touchstone'; s.s3='CM4-C192A1'; 
s.s4='CM4-C96A1'; s.s5='CM4-C96F3';  s.s6='CM4-C96E3'; s.opt=0;
x.time0=[2.5:5:100]; y.var0=cm25.evap.rmse;
x.time1=[2.5:5:100]; y.var1=cm25.evap.rmse;
x.time2=[2.5:5:100]; y.var2=cm2t.evap.rmse;
x.time3=[2.5:5:60];  y.var3=z.v0.evap.rmse;
x.time4=[2.5:5:80];  y.var4=z.v1.evap.rmse;
x.time5=[2.5:5:30];  y.var5=z.v2.evap.rmse;
x.time6=[2.5:5:15];  y.var6=z.v3.evap.rmse;
plot_ts_cm4(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%

%PCP%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_mean'; s.yl='precipitation (mm/day)'; s.xl='year'; 
s.xy=[1 100 2.6 3.1]; expn='cm4';
s.s0='OBS'; s.s1='CM2.5'; s.s2='CM2.5-Touchstone'; s.s3='CM4-C192A1'; 
s.s4='CM4-C96A1'; s.s5='CM4-C96F3'; s.s6='CM4-C96E3'; s.opt=4;
x.time0=[2.5:5:100]; y.var0=cm25.pcp.omen;
x.time1=[2.5:5:100]; y.var1=cm25.pcp.mmen;
x.time2=[2.5:5:100]; y.var2=cm2t.pcp.mmen;
x.time3=[2.5:5:60];  y.var3=z.v0.pcp.mmen;
x.time4=[2.5:5:80];  y.var4=z.v1.pcp.mmen;
x.time5=[2.5:5:30];  y.var5=z.v2.pcp.mmen;
x.time6=[2.5:5:15];  y.var6=z.v3.pcp.mmen;
plot_ts_cm4(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_rmse'; s.yl='PCP RMSE (W/m2)'; s.xl='year'; 
s.xy=[1 100 0.9 1.25]; expn='cm4';
s.s0='OBS'; s.s1='CM2.5'; s.s2='CM2.5-Touchstone'; s.s3='CM4-C192A1'; 
s.s4='CM4-C96A1'; s.s5='CM4-C96F3';  s.s6='CM4-C96E3'; s.opt=0;
x.time0=[2.5:5:100]; y.var0=cm25.pcp.rmse;
x.time1=[2.5:5:100]; y.var1=cm25.pcp.rmse;
x.time2=[2.5:5:100]; y.var2=cm2t.pcp.rmse;
x.time3=[2.5:5:60];  y.var3=z.v0.pcp.rmse;
x.time4=[2.5:5:80];  y.var4=z.v1.pcp.rmse;
x.time5=[2.5:5:30];  y.var5=z.v2.pcp.rmse;
x.time6=[2.5:5:15];  y.var6=z.v3.pcp.rmse;
plot_ts_cm4(x,y,s,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%



%Plotting fields%%%%%%%%%%
pms=[ 0, 0, 1000, 600]*1.; warning off all; fac=20;
handle = figure('Position', pms,'visible','on'); 
plot([2.5:5:100],cm25.netradtoa.omen-273.15, 'k:'); hold on; 
plot([2.5:5:100],cm25.netradtoa.mmen-273.15, 'k'); hold on; 
plot([2.5:5:100],cm25t.sst.mmen-273.15,'k--');
plot([2.5:5:60], x.v0.sst.mmen-273.15, 'b');
plot([2.5:5:80], x.v1.sst.mmen-273.15, 'g','LineWidth',2);
plot([2.5:5:30], x.v2.sst.mmen-273.15, 'r','LineWidth',2); hold on; 
plot([2.5:5:20], x.v3.sst.mmen-273.15, 'c','LineWidth',2); hold on; 


%Plotting fields%%%%%%%%%%
vname='sst_bias'; k1=1; k2=6; f=1; s=x.v1.s; s0=expn; s0(s0=='_')='-';
z1=squeeze(mean(x.v2.sst.dif_myr (k1:k2,:,:),1));s.s1='CM4-c96L48-AM4a1';
z2=squeeze(mean(x.v1.sst.dif_myr (k1:k2,:,:),1));s.s2='CM4-c192L48-AM4a1';
z3=squeeze(mean(cm25t.sst.dif_myr(k1:k2,:,:),1));s.s3='AM25like-MOM6-TouchStone';
z4=squeeze(mean(cm25.sst.dif_myr (k1:k2,:,:),1));s.s4='CM25';
s.s1=sprintf('CM4-c96L48-AM4a (RMSE=%5.2f)',mean(x.v2.sst.rmse(k1:k2)));
s.s2=sprintf('CM4-c192L48-AM4a (RMSE=%5.2f)',mean(x.v1.sst.rmse(k1:k2)));
s.s3=sprintf('AM25like-MOM6-TouchStone (RMSE=%5.2f)',mean(cm25t.sst.rmse(k1:k2)));
s.s4=sprintf('CM25 (RMSE=%5.2f)',mean(cm25.sst.rmse(k1:k2)));
cmin=-4.5; cmax=4.5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,exp,f,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_bias'; k1=1; k2=6; f=1; s=x.v1.s; s0=expn; s0(s0=='_')='-';
z1=squeeze(mean(x.v2.pcp.dif_myr (k1:k2,:,:),1));s.s1='CM4-c96L48-AM4a';
z2=squeeze(mean(x.v1.pcp.dif_myr (k1:k2,:,:),1));s.s2='CM4-c192L48-AM4a';
z3=squeeze(mean(cm25t.pcp.dif_myr(k1:k2,:,:),1));s.s3='AM25like-MOM6-TouchStone';
z4=squeeze(mean(cm25.pcp.dif_myr (k1:k2,:,:),1));s.s4='CM25';
s.s1=sprintf('CM4-c96L48-AM4a (RMSE=%5.2f)',mean(x.v2.pcp.rmse(k1:k2)));
s.s2=sprintf('CM4-c192L48-AM4a (RMSE=%5.2f)',mean(x.v1.pcp.rmse(k1:k2)));
s.s3=sprintf('AM25like-MOM6-TouchStone (RMSE=%5.2f)',mean(cm25t.pcp.rmse(k1:k2)));
s.s4=sprintf('CM25 (RMSE=%5.2f)',mean(cm25.pcp.rmse(k1:k2)));
cmin=-7; cmax=7; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cm4/'; expn='cm4'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,exp,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%





t=1; z1=squeeze(mean(cm25.sst.dif_myr k1:k2,:,:),1));s.s1=strcat('CM2.5-year-',num2str(t));
t=2; z3=squeeze(mean(cm25.sst.dif_myr (k1:k2,:,:),1));s.s3=strcat('CM2.5-year-',num2str(t));
t=3; z5=squeeze(mean(cm25.sst.dif_myr (k1:k2,:,:),1));s.s5=strcat('CM2.5-year-',num2str(t));
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath=strcat(tpath,expn,pp,'figs/'); exp='cm'; %fpath='./fig_cm4'; exp='cm4';
plot_6panel_cm4(s,z1,z2,z3,z4,z5,z6,vbin,cmin,cmax,vname,fpath,exp,f);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_bias'; k1=1; k2=1; s=x.s; f=1; s0=expn; s0(s0=='_')='-';
t=1; z1=squeeze(mean(cm25f.pcp.dif_myr (t,:,:),1));s.s1=strcat('CM2.5F-year-',num2str(t));
t=2; z3=squeeze(mean(cm25f.pcp.dif_myr (t,:,:),1));s.s3=strcat('CM2.5F-year-',num2str(t));
t=3; z5=squeeze(mean(cm25f.pcp.dif_myr (t,:,:),1));s.s5=strcat('CM2.5F-year-',num2str(t));
t=1; z2=squeeze(mean(x.pcp.dif_myr (t,:,:),1));s.s2=strcat(s0,'-year-',num2str(t));
t=2; z4=squeeze(mean(x.pcp.dif_myr (t,:,:),1));s.s4=strcat(s0,'-year-',num2str(t));
t=3; z6=squeeze(mean(x.pcp.dif_myr (t,:,:),1));s.s6=strcat(s0,'-year-',num2str(t));
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath=strcat(tpath,expn,pp,'figs/'); exp='cm'; %fpath='./fig_cm4'; exp='cm4';
plot_6panel_cm4(s,z1,z2,z3,z4,z5,z6,vbin,cmin,cmax,vname,fpath,exp,f);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradsfc_bias'; k1=1; k2=1; s=x.s; f=1; s0=expn; s0(s0=='_')='-';
t=1; z1=squeeze(mean(cm25f.netradsfc.dif_myr (t,:,:),1));s.s1=strcat('CM2.5F-year-',num2str(t));
t=2; z3=squeeze(mean(cm25f.netradsfc.dif_myr (t,:,:),1));s.s3=strcat('CM2.5F-year-',num2str(t));
t=3; z5=squeeze(mean(cm25f.netradsfc.dif_myr (t,:,:),1));s.s5=strcat('CM2.5F-year-',num2str(t));
t=1; z2=squeeze(mean(x.netradsfc.dif_myr (t,:,:),1));s.s2=strcat(s0,'-year-',num2str(t));
t=2; z4=squeeze(mean(x.netradsfc.dif_myr (t,:,:),1));s.s4=strcat(s0,'-year-',num2str(t));
t=3; z6=squeeze(mean(x.netradsfc.dif_myr (t,:,:),1));s.s6=strcat(s0,'-year-',num2str(t));
cmin=-20; cmax=20; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath=strcat(tpath,expn,pp,'figs/'); exp='cm'; %fpath='./fig_cm4'; exp='cm4';
plot_6panel_cm4(s,z1,z2,z3,z4,z5,z6,vbin,cmin,cmax,vname,fpath,exp,f);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='evap_bias'; k1=1; k2=1; s=x.s; f=1; s0=expn; s0(s0=='_')='-';
t=1; z1=squeeze(mean(cm25f.evap.dif_myr (t,:,:),1));s.s1=strcat('CM2.5F-year-',num2str(t));
t=2; z3=squeeze(mean(cm25f.evap.dif_myr (t,:,:),1));s.s3=strcat('CM2.5F-year-',num2str(t));
t=3; z5=squeeze(mean(cm25f.evap.dif_myr (t,:,:),1));s.s5=strcat('CM2.5F-year-',num2str(t));
t=1; z2=squeeze(mean(x.evap.dif_myr (t,:,:),1));s.s2=strcat(s0,'-year-',num2str(t));
t=2; z4=squeeze(mean(x.evap.dif_myr (t,:,:),1));s.s4=strcat(s0,'-year-',num2str(t));
t=3; z6=squeeze(mean(x.evap.dif_myr (t,:,:),1));s.s6=strcat(s0,'-year-',num2str(t));
cmin=-20; cmax=20; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath=strcat(tpath,expn,pp,'figs/'); exp='cm'; %fpath='./fig_cm4'; exp='cm4';
plot_6panel_cm4(s,z1,z2,z3,z4,z5,z6,vbin,cmin,cmax,vname,fpath,exp,f);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netflxsfc_bias'; k1=1; k2=1; s=x.s; f=1; s0=expn; s0(s0=='_')='-';
t=1; z1=squeeze(mean(cm25f.netflxsfc.dif_myr (t,:,:),1));s.s1=strcat('CM2.5F-year-',num2str(t));
t=2; z3=squeeze(mean(cm25f.netflxsfc.dif_myr (t,:,:),1));s.s3=strcat('CM2.5F-year-',num2str(t));
t=3; z5=squeeze(mean(cm25f.netflxsfc.dif_myr (t,:,:),1));s.s5=strcat('CM2.5F-year-',num2str(t));
t=1; z2=squeeze(mean(x.netflxsfc.dif_myr (t,:,:),1));s.s2=strcat(s0,'-year-',num2str(t));
t=2; z4=squeeze(mean(x.netflxsfc.dif_myr (t,:,:),1));s.s4=strcat(s0,'-year-',num2str(t));
t=3; z6=squeeze(mean(x.netflxsfc.dif_myr (t,:,:),1));s.s6=strcat(s0,'-year-',num2str(t));
cmin=-20; cmax=20; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath=strcat(tpath,expn,pp,'figs/'); exp='cm'; %fpath='./fig_cm4'; exp='cm4';
plot_6panel_cm4(s,z1,z2,z3,z4,z5,z6,vbin,cmin,cmax,vname,fpath,exp,f);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_bias'; k1=1; k2=1; s=x.s; f=1; s0=expn; s0(s0=='_')='-';
t=1; z1=squeeze(mean(cm25f.netradtoa.dif_myr (t,:,:),1));s.s1=strcat('CM2.5F-year-',num2str(t));
t=2; z3=squeeze(mean(cm25f.netradtoa.dif_myr (t,:,:),1));s.s3=strcat('CM2.5F-year-',num2str(t));
t=3; z5=squeeze(mean(cm25f.netradtoa.dif_myr (t,:,:),1));s.s5=strcat('CM2.5F-year-',num2str(t));
t=1; z2=squeeze(mean(x.netradtoa.dif_myr (t,:,:),1));s.s2=strcat(s0,'-year-',num2str(t));
t=2; z4=squeeze(mean(x.netradtoa.dif_myr (t,:,:),1));s.s4=strcat(s0,'-year-',num2str(t));
t=3; z6=squeeze(mean(x.netradtoa.dif_myr (t,:,:),1));s.s6=strcat(s0,'-year-',num2str(t));
cmin=-20; cmax=20; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath=strcat(tpath,expn,pp,'figs/'); exp='cm'; %fpath='./fig_cm4'; exp='cm4';
plot_6panel_cm4(s,z1,z2,z3,z4,z5,z6,vbin,cmin,cmax,vname,fpath,exp,f);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwp_bias'; k1=1; k2=1; s=x.s; f=1; s0=expn; s0(s0=='_')='-';
t=1; z1=squeeze(mean(cm25f.lwp.dif_myr (t,:,:),1));s.s1=strcat('CM2.5F-year-',num2str(t));
t=2; z3=squeeze(mean(cm25f.lwp.dif_myr (t,:,:),1));s.s3=strcat('CM2.5F-year-',num2str(t));
t=3; z5=squeeze(mean(cm25f.lwp.dif_myr (t,:,:),1));s.s5=strcat('CM2.5F-year-',num2str(t));
t=1; z2=squeeze(mean(x.lwp.dif_myr (t,:,:),1));s.s2=strcat(s0,'-year-',num2str(t));
t=2; z4=squeeze(mean(x.lwp.dif_myr (t,:,:),1));s.s4=strcat(s0,'-year-',num2str(t));
t=3; z6=squeeze(mean(x.lwp.dif_myr (t,:,:),1));s.s6=strcat(s0,'-year-',num2str(t));
cmin=0; cmax=0.1; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath=strcat(tpath,expn,pp,'figs/'); exp='cm'; %fpath='./fig_cm4'; exp='cm4';
plot_6panel_cm4(s,z1,z2,z3,z4,z5,z6,vbin,cmin,cmax,vname,fpath,exp,f);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swflxsfc_bias'; k1=1; k2=1; s=x.s; f=1; s0=expn; s0(s0=='_')='-';
t=1; z1=squeeze(mean(cm25f.swflxsfc.dif_myr (t,:,:),1));s.s1=strcat('CM2.5F-year-',num2str(t));
t=2; z3=squeeze(mean(cm25f.swflxsfc.dif_myr (t,:,:),1));s.s3=strcat('CM2.5F-year-',num2str(t));
t=3; z5=squeeze(mean(cm25f.swflxsfc.dif_myr (t,:,:),1));s.s5=strcat('CM2.5F-year-',num2str(t));
t=1; z2=squeeze(mean(x.swflxsfc.dif_myr (t,:,:),1));s.s2=strcat(s0,'-year-',num2str(t));
t=2; z4=squeeze(mean(x.swflxsfc.dif_myr (t,:,:),1));s.s4=strcat(s0,'-year-',num2str(t));
t=3; z6=squeeze(mean(x.swflxsfc.dif_myr (t,:,:),1));s.s6=strcat(s0,'-year-',num2str(t));
cmin=-20; cmax=20; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath=strcat(tpath,expn,pp,'figs/'); exp='cm'; %fpath='./fig_cm4'; exp='cm4';
plot_6panel_cm4(s,z1,z2,z3,z4,z5,z6,vbin,cmin,cmax,vname,fpath,exp,f);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcftoa_bias'; k1=1; k2=1; s=x.s; f=1; s0=expn; s0(s0=='_')='-';
t=1; z1=squeeze(mean(cm25f.swcftoa.dif_myr (t,:,:),1));s.s1=strcat('CM2.5F-year-',num2str(t));
t=2; z3=squeeze(mean(cm25f.swcftoa.dif_myr (t,:,:),1));s.s3=strcat('CM2.5F-year-',num2str(t));
t=3; z5=squeeze(mean(cm25f.swcftoa.dif_myr (t,:,:),1));s.s5=strcat('CM2.5F-year-',num2str(t));
t=1; z2=squeeze(mean(x.swcftoa.dif_myr (t,:,:),1));s.s2=strcat(s0,'-year-',num2str(t));
t=2; z4=squeeze(mean(x.swcftoa.dif_myr (t,:,:),1));s.s4=strcat(s0,'-year-',num2str(t));
t=3; z6=squeeze(mean(x.swcftoa.dif_myr (t,:,:),1));s.s6=strcat(s0,'-year-',num2str(t));
cmin=-20; cmax=20; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath=strcat(tpath,expn,pp,'figs/'); exp='cm'; %fpath='./fig_cm4'; exp='cm4';
plot_6panel_cm4(s,z1,z2,z3,z4,z5,z6,vbin,cmin,cmax,vname,fpath,exp,f);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='cess_ttcf'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.ttcf.dif_clm(k,:,:),1)); 
x2=squeeze(mean(am4g9.w0.toa.ttcf.dif_clm(k,:,:),1)); 
x3=squeeze(mean(am4gA.v0.toa.ttcf.dif_clm(k,:,:),1)); 
x4=squeeze(mean(am4gA.w0.toa.ttcf.dif_clm(k,:,:),1)); 
x5=squeeze(mean(aref0.v0.toa.ttcf.dif_clm(k,:,:),1)); 
x6=squeeze(mean(aref0.w0.toa.ttcf.dif_clm(k,:,:),1)); 
z1=x2-x1; s.s1='AM4g9';
z2=x4-x3; s.s2='AM4gA';
z3=x6-x5; s.s3='AREF0';
z4=z3-z1; s.s4='AREF0 minus AM4g9';
cmin=-6; cmax=6; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='cess_ttcf'; k=1; k1=1; k2=24; f=1; s=cmlg9.v0.s; s0=expn; s0(s0=='_')='-';
x1=squeeze(mean(am4g9.v0.toa.ttcf.avg_sea(k,:,:),1)); 
x2=squeeze(mean(am4g9.w0.toa.ttcf.avg_sea(k,:,:),1)); 
x3=squeeze(mean(am4gA.v0.toa.ttcf.avg_sea(k,:,:),1)); 
x4=squeeze(mean(am4gA.w0.toa.ttcf.avg_sea(k,:,:),1)); 
x5=squeeze(mean(aref0.v0.toa.ttcf.avg_sea(k,:,:),1)); 
x6=squeeze(mean(aref0.w0.toa.ttcf.avg_sea(k,:,:),1)); 
z1=x1; s.s1='AM4g9';
z2=x3; s.s2='AM4gA';
z3=x5; s.s3='AREF0';
z4=z3-z1; s.s4='AREF0 minus AM4g9';
cmin=-120; cmax=0; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath='./fig_cml/'; expn='am4g10'; f=1; 
plot_4panel_cm4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
