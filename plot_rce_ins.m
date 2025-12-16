%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; zs=1; res='R48A';
res='R48A'; t1=300; t2=330; expn='RCE_H2048x128_L79_R03_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
res='R24A'; t1=300; t2=330; expn='RCE_H2048x128_L79_R03_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
res='R12A'; t1=300; t2=330; expn='RCE_H2048x128_L79_R03_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
res='R06A'; t1=300; t2=330; expn='RCE_H2048x128_L79_R03_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
res='org';  t1=300; t2=330; expn='RCE_H2048x128_L79_R03_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
res='R48A'; t1=260; t2=360; expn='RCE_H2048x128_L79_R03_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
res='R24A'; t1=260; t2=360; expn='RCE_H2048x128_L79_R03_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
res='R12A'; t1=260; t2=360; expn='RCE_H2048x128_L79_R03_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
res='R06A'; t1=260; t2=360; expn='RCE_H2048x128_L79_R03_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
res='org';  t1=260; t2=360; expn='RCE_H1024x064_L79_R06_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; zs=1; res='R48A';
t1=260; t2=360; expn='RCE_H0128x008_L79_R48_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
t1=260; t2=360; expn='RCE_H0128x008_L79_R48_295'; v2=rceana_ins(tpath,expn,res,t1,t2,zs);
t1=260; t2=360; expn='RCE_H0128x008_L79_R48_305'; v3=rceana_ins(tpath,expn,res,t1,t2,zs);
%res='org';
t1=260; t2=360; expn='RCE_H0256x016_L79_R24_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
t1=260; t2=360; expn='RCE_H0256x016_L79_R24_295'; v2=rceana_ins(tpath,expn,res,t1,t2,zs);
t1=260; t2=360; expn='RCE_H0256x016_L79_R24_305'; v3=rceana_ins(tpath,expn,res,t1,t2,zs);
%res='org';
t1=260; t2=360; expn='RCE_H0512x032_L79_R12_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
t1=260; t2=360; expn='RCE_H0512x032_L79_R12_295'; v2=rceana_ins(tpath,expn,res,t1,t2,zs);
t1=260; t2=360; expn='RCE_H0512x032_L79_R12_305'; v3=rceana_ins(tpath,expn,res,t1,t2,zs);
%res='org';
t1=260; t2=360; expn='RCE_H1024x064_L79_R06_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
t1=260; t2=360; expn='RCE_H1024x064_L79_R06_295'; v2=rceana_ins(tpath,expn,res,t1,t2,zs);
t1=260; t2=360; expn='RCE_H1024x064_L79_R06_305'; v3=rceana_ins(tpath,expn,res,t1,t2,zs);
%res='org';
t1=260; t2=360; expn='RCE_H2048x128_L79_R03_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
t1=260; t2=360; expn='RCE_H2048x128_L79_R03_295'; v2=rceana_ins(tpath,expn,res,t1,t2,zs);
t1=260; t2=360; expn='RCE_H2048x128_L79_R03_305'; v3=rceana_ins(tpath,expn,res,t1,t2,zs);
res='org';
t1=60; t2=360; expn='RCE_H0128x128_L79_R03_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
t1=60; t2=360; expn='RCE_H0128x128_L79_R03_295'; v2=rceana_ins(tpath,expn,res,t1,t2,zs);
t1=60; t2=360; expn='RCE_H0128x128_L79_R03_305'; v3=rceana_ins(tpath,expn,res,t1,t2,zs);
t1=60; t2=360; expn='RCE_H0128x128_L79_R01_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
t1=60; t2=360; expn='RCE_H0128x128_L79_R01_295'; v2=rceana_ins(tpath,expn,res,t1,t2,zs);
t1=60; t2=360; expn='RCE_H0128x128_L79_R01_305'; v3=rceana_ins(tpath,expn,res,t1,t2,zs);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath='/work/miz/mat_rce/'; 
res='R48'; fext=strcat('_',res,'_ins_60_360.mat');
expn='RCE_H1024x064_L79_R06';     fn=strcat(tpath,expn,fext); load(fn);v2=v;
expn='RCE_H0512x032_L79_R12';     fn=strcat(tpath,expn,fext); load(fn);v3=v;
expn='RCE_H0256x016_L79_R24';     fn=strcat(tpath,expn,fext); load(fn);v4=v;
expn='RCE_H0128x008_L79_R48';     fn=strcat(tpath,expn,fext); load(fn);v5=v;

figure; 
plot(v2.wqt.avg,v2.pf,'r'); hold on;
plot(v3.wqt.avg,v3.pf,'g')
plot(v4.wqt.avg,v4.pf,'b')
plot(v5.wqt.avg,v5.pf,'k')
set(gca,'yDir','reverse');

figure;
plot(v2.state_allt.up.mf,v2.pf,'r'); hold on;
plot(v3.state_allt.up.mf,v3.pf,'g'); hold on;
plot(v4.state_allt.up.mf,v4.pf,'b'); hold on;
plot(v5.state_allt.up.mf,v5.pf,'k'); hold on;

figure;
plot(v2.flux_allt.up.wqt,v2.pf,'r'); hold on;
plot(v3.flux_allt.up.wqt,v3.pf,'g'); hold on;
plot(v4.flux_allt.up.wqt,v4.pf,'b'); hold on;
plot(v5.flux_allt.up.wqt,v5.pf,'k'); hold on;


figure; wbin=v2.w500.bin;
semilogy(wbin,v2.w500.pdf,'r'); hold on;
semilogy(wbin,v3.w500.pdf,'g'); hold on;
semilogy(wbin,v4.w500.pdf,'b'); hold on;
semilogy(wbin,v5.w500.pdf,'k'); hold on;

figure; pbin=v2.sfc.pcp.bin;
semilogy(pbin,v2.sfc.pcp.pdf,'r'); hold on;
semilogy(pbin,v3.sfc.pcp.pdf,'g'); hold on;
semilogy(pbin,v4.sfc.pcp.pdf,'b'); hold on;
semilogy(pbin,v5.sfc.pcp.pdf,'k'); hold on;

figure; pctile=v2.sfc.pcp.pctile;
loglog(pctile,v2.sfc.pcp.vptile,'r'); hold on;
loglog(pctile,v3.sfc.pcp.vptile,'g'); hold on;
loglog(pctile,v4.sfc.pcp.vptile,'b'); hold on;
loglog(pctile,v5.sfc.pcp.vptile,'k'); hold on;





[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath='/work/miz/mat_rce/'; 
res='R48A'; fext=strcat('_',res,'_ins_60_360.mat');
expn='RCE_H2048x128_L79_R03_300'; fn=strcat(tpath,expn,fext); load(fn);v1=v;
expn='RCE_H2048x128_L79_R03_295'; fn=strcat(tpath,expn,fext); load(fn);c1=v;
expn='RCE_H2048x128_L79_R03_305'; fn=strcat(tpath,expn,fext); load(fn);w1=v;
expn='RCE_H1024x064_L79_R06_300'; fn=strcat(tpath,expn,fext); load(fn);v2=v;
expn='RCE_H1024x064_L79_R06_295'; fn=strcat(tpath,expn,fext); load(fn);c2=v;
expn='RCE_H1024x064_L79_R06_305'; fn=strcat(tpath,expn,fext); load(fn);w2=v;
expn='RCE_H0512x032_L79_R12_300'; fn=strcat(tpath,expn,fext); load(fn);v3=v;
expn='RCE_H0512x032_L79_R12_295'; fn=strcat(tpath,expn,fext); load(fn);c3=v;
expn='RCE_H0512x032_L79_R12_305'; fn=strcat(tpath,expn,fext); load(fn);w3=v;
expn='RCE_H0256x016_L79_R24_300'; fn=strcat(tpath,expn,fext); load(fn);v4=v;
expn='RCE_H0256x016_L79_R24_295'; fn=strcat(tpath,expn,fext); load(fn);c4=v;
expn='RCE_H0256x016_L79_R24_305'; fn=strcat(tpath,expn,fext); load(fn);w4=v;
expn='RCE_H0128x008_L79_R48_300'; fn=strcat(tpath,expn,fext); load(fn);v5=v;
expn='RCE_H0128x008_L79_R48_295'; fn=strcat(tpath,expn,fext); load(fn);c5=v;
expn='RCE_H0128x008_L79_R48_305'; fn=strcat(tpath,expn,fext); load(fn);w5=v;
res='R48A'; fext=strcat('_',res,'_ins_260_360.mat');
expn='RCE_H2048x128_L79_R03_300'; fn=strcat(tpath,expn,fext); load(fn);v1s=v;
expn='RCE_H2048x128_L79_R03_295'; fn=strcat(tpath,expn,fext); load(fn);c1s=v;
expn='RCE_H2048x128_L79_R03_305'; fn=strcat(tpath,expn,fext); load(fn);w1s=v;
expn='RCE_H1024x064_L79_R06_300'; fn=strcat(tpath,expn,fext); load(fn);v2s=v;
expn='RCE_H1024x064_L79_R06_295'; fn=strcat(tpath,expn,fext); load(fn);c2s=v;
expn='RCE_H1024x064_L79_R06_305'; fn=strcat(tpath,expn,fext); load(fn);w2s=v;
expn='RCE_H0512x032_L79_R12_300'; fn=strcat(tpath,expn,fext); load(fn);v3s=v;
expn='RCE_H0512x032_L79_R12_295'; fn=strcat(tpath,expn,fext); load(fn);c3s=v;
expn='RCE_H0512x032_L79_R12_305'; fn=strcat(tpath,expn,fext); load(fn);w3s=v;
expn='RCE_H0256x016_L79_R24_300'; fn=strcat(tpath,expn,fext); load(fn);v4s=v;
expn='RCE_H0256x016_L79_R24_295'; fn=strcat(tpath,expn,fext); load(fn);c4s=v;
expn='RCE_H0256x016_L79_R24_305'; fn=strcat(tpath,expn,fext); load(fn);w4s=v;
expn='RCE_H0128x008_L79_R48_300'; fn=strcat(tpath,expn,fext); load(fn);v5s=v;
expn='RCE_H0128x008_L79_R48_295'; fn=strcat(tpath,expn,fext); load(fn);c5s=v;
expn='RCE_H0128x008_L79_R48_305'; fn=strcat(tpath,expn,fext); load(fn);w5s=v;
res='org'; fext=strcat('_',res,'_ins_60_360.mat');
%expn='RCE_H2048x128_L79_R03_300'; fn=strcat(tpath,expn,fext); load(fn);v1o=v;
%expn='RCE_H2048x128_L79_R03_295'; fn=strcat(tpath,expn,fext); load(fn);c1o=v;
%expn='RCE_H2048x128_L79_R03_305'; fn=strcat(tpath,expn,fext); load(fn);w1o=v;
%expn='RCE_H1024x064_L79_R06_300'; fn=strcat(tpath,expn,fext); load(fn);v2o=v;
%expn='RCE_H1024x064_L79_R06_295'; fn=strcat(tpath,expn,fext); load(fn);c2o=v;
%expn='RCE_H1024x064_L79_R06_305'; fn=strcat(tpath,expn,fext); load(fn);w2o=v;
expn='RCE_H0512x032_L79_R12_300'; fn=strcat(tpath,expn,fext); load(fn);v3o=v;
expn='RCE_H0512x032_L79_R12_295'; fn=strcat(tpath,expn,fext); load(fn);c3o=v;
expn='RCE_H0512x032_L79_R12_305'; fn=strcat(tpath,expn,fext); load(fn);w3o=v;
expn='RCE_H0256x016_L79_R24_300'; fn=strcat(tpath,expn,fext); load(fn);v4o=v;
expn='RCE_H0256x016_L79_R24_295'; fn=strcat(tpath,expn,fext); load(fn);c4o=v;
expn='RCE_H0256x016_L79_R24_305'; fn=strcat(tpath,expn,fext); load(fn);w4o=v;
%expn='RCE_H0128x128_L79_R01_295'; fn=strcat(tpath,expn,fext); load(fn);cao=v;
%expn='RCE_H0128x128_L79_R01_300'; fn=strcat(tpath,expn,fext); load(fn);vao=v;
%expn='RCE_H0128x128_L79_R01_305'; fn=strcat(tpath,expn,fext); load(fn);wao=v;
%expn='RCE_H0128x128_L79_R03_295'; fn=strcat(tpath,expn,fext); load(fn);cbo=v;
%expn='RCE_H0128x128_L79_R03_300'; fn=strcat(tpath,expn,fext); load(fn);vbo=v;
%expn='RCE_H0128x128_L79_R03_305'; fn=strcat(tpath,expn,fext); load(fn);wbo=v;
ca=c1s; va=v1s; wa=w1s;
cb=c2s; vb=v2s; wb=w2s;
cc=c3s; vc=v3s; wc=w3s;
cd=c4s; vd=v4s; wd=w4s;
C1='b-'; C2='b--'; C3='b-.'; C4='b:'; C5='b-s';
V1='k-'; V2='k--'; V3='k-.'; V4='k:'; V5='k-s';
W1='r-'; W2='r--'; W3='r-.'; W4='r:'; W5='r-s';
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%Sensitivity of convection
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w500_pdf'; binc=v1.w500.binc; xy=[-2 12 10E-7 10];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1; 
a.ca=ca.w500.pdf./ca.w500.bins; a.va=va.w500.pdf./va.w500.bins; a.wa=wa.w500.pdf./wa.w500.bins;
a.cb=cb.w500.pdf./cb.w500.bins; a.vb=vb.w500.pdf./vb.w500.bins; a.wb=wb.w500.pdf./wb.w500.bins;
a.cc=cc.w500.pdf./cc.w500.bins; a.vc=vc.w500.pdf./vc.w500.bins; a.wc=wc.w500.pdf./wc.w500.bins;
a.cd=cd.w500.pdf./cd.w500.bins; a.vd=vd.w500.pdf./vd.w500.bins; a.wd=wd.w500.pdf./wd.w500.bins;
a.c1=c1.w500.pdf./c1.w500.bins; a.v1=v1.w500.pdf./v1.w500.bins; a.w1=w1.w500.pdf./v1.w500.bins;
a.c2=c2.w500.pdf./c2.w500.bins; a.v2=v2.w500.pdf./v2.w500.bins; a.w2=w2.w500.pdf./v2.w500.bins;
a.c3=c3.w500.pdf./c3.w500.bins; a.v3=v3.w500.pdf./v3.w500.bins; a.w3=w3.w500.pdf./v3.w500.bins;
a.c4=c4.w500.pdf./c4.w500.bins; a.v4=v4.w500.pdf./v4.w500.bins; a.w4=w4.w500.pdf./v4.w500.bins;
a.c5=c5.w500.pdf./c5.w500.bins; a.v5=v5.w500.pdf./v5.w500.bins; a.w5=w5.w500.pdf./v5.w500.bins;
lw='LineWidth'; d1=1; d2=d1*3;
semilogy(binc,a.ca,C1,lw,d2);hold on;semilogy(binc,a.va,V1,lw,d2);semilogy(binc,a.wa,W1,lw,d2);
semilogy(binc,a.cb,C2,lw,d2);hold on;semilogy(binc,a.vb,V2,lw,d2);semilogy(binc,a.wb,W2,lw,d2);
semilogy(binc,a.cc,C3,lw,d2);hold on;semilogy(binc,a.vc,V3,lw,d2);semilogy(binc,a.wc,W3,lw,d2);
semilogy(binc,a.cd,C4,lw,d2);hold on;semilogy(binc,a.vd,V4,lw,d2);semilogy(binc,a.wd,W4,lw,d2);
semilogy(binc,a.c1,C1,lw,d1);hold on;semilogy(binc,a.v1,V1,lw,d1);semilogy(binc,a.w1,W1,lw,d1);
semilogy(binc,a.c2,C2,lw,d1);hold on;semilogy(binc,a.v2,V2,lw,d1);semilogy(binc,a.w2,W2,lw,d1);
semilogy(binc,a.c3,C3,lw,d1);hold on;semilogy(binc,a.v3,V3,lw,d1);semilogy(binc,a.w3,W3,lw,d1);
semilogy(binc,a.c4,C4,lw,d1);hold on;semilogy(binc,a.v4,V4,lw,d1);semilogy(binc,a.w4,W4,lw,d1);
semilogy(binc,a.c5,C5,lw,d1);hold on;semilogy(binc,a.v5,V5,lw,d1);semilogy(binc,a.w5,W5,lw,d1);
legend('295','300','305',1); axis(xy);
xl='500hPa vertical velocity (m/s)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (m/s)^{-1}'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='precip_pdf'; binc=v1.precip.binc; binc(1)=0.1; xy=[4 5500 10E-10 0.02];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1; 
a.ca=ca.precip.pdf./ca.precip.bins; a.va=va.precip.pdf./va.precip.bins; a.wa=wa.precip.pdf./wa.precip.bins;
a.cb=cb.precip.pdf./cb.precip.bins; a.vb=vb.precip.pdf./vb.precip.bins; a.wb=wb.precip.pdf./wb.precip.bins;
a.cc=cc.precip.pdf./cc.precip.bins; a.vc=vc.precip.pdf./vc.precip.bins; a.wc=wc.precip.pdf./wc.precip.bins;
a.cd=cd.precip.pdf./cd.precip.bins; a.vd=vd.precip.pdf./vd.precip.bins; a.wd=wd.precip.pdf./wd.precip.bins;
a.c1=c1.precip.pdf./c1.precip.bins; a.v1=v1.precip.pdf./v1.precip.bins; a.w1=w1.precip.pdf./v1.precip.bins;
a.c2=c2.precip.pdf./c2.precip.bins; a.v2=v2.precip.pdf./v2.precip.bins; a.w2=w2.precip.pdf./v2.precip.bins;
a.c3=c3.precip.pdf./c3.precip.bins; a.v3=v3.precip.pdf./v3.precip.bins; a.w3=w3.precip.pdf./v3.precip.bins;
a.c4=c4.precip.pdf./c4.precip.bins; a.v4=v4.precip.pdf./v4.precip.bins; a.w4=w4.precip.pdf./v4.precip.bins;
a.c5=c5.precip.pdf./c5.precip.bins; a.v5=v5.precip.pdf./v5.precip.bins; a.w5=w5.precip.pdf./v5.precip.bins;
lw='LineWidth'; d1=1; d2=d1*3;
loglog(binc,a.ca,C1,lw,d2);hold on;loglog(binc,a.va,V1,lw,d2);loglog(binc,a.wa,W1,lw,d2);
loglog(binc,a.cb,C2,lw,d2);hold on;loglog(binc,a.vb,V2,lw,d2);loglog(binc,a.wb,W2,lw,d2);
loglog(binc,a.cc,C3,lw,d2);hold on;loglog(binc,a.vc,V3,lw,d2);loglog(binc,a.wc,W3,lw,d2);
loglog(binc,a.cd,C4,lw,d2);hold on;loglog(binc,a.vd,V4,lw,d2);loglog(binc,a.wd,W4,lw,d2);
loglog(binc,a.c1,C1,lw,d1);hold on;loglog(binc,a.v1,V1,lw,d1);loglog(binc,a.w1,W1,lw,d1);
loglog(binc,a.c2,C2,lw,d1);hold on;loglog(binc,a.v2,V2,lw,d1);loglog(binc,a.w2,W2,lw,d1);
loglog(binc,a.c3,C3,lw,d1);hold on;loglog(binc,a.v3,V3,lw,d1);loglog(binc,a.w3,W3,lw,d1);
loglog(binc,a.c4,C4,lw,d1);hold on;loglog(binc,a.v4,V4,lw,d1);loglog(binc,a.w4,W4,lw,d1);
loglog(binc,a.c5,C5,lw,d1);hold on;loglog(binc,a.v5,V5,lw,d1);loglog(binc,a.w5,W5,lw,d1);
legend('295','300','305',1); axis(xy);
xl='surface precipitation (mm/day)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (mm/day)^{-1}'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fa_up'; xy=[0 1 195 305];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); n=1; k1=15; k2=79;
a.ca=ca.state_allt.up.fa(k1:k2,n); a.va=va.state_allt.up.fa(k1:k2,n); a.wa=wa.state_allt.up.fa(k1:k2,n);
a.cb=cb.state_allt.up.fa(k1:k2,n); a.vb=vb.state_allt.up.fa(k1:k2,n); a.wb=wb.state_allt.up.fa(k1:k2,n);
a.cc=cc.state_allt.up.fa(k1:k2,n); a.vc=vc.state_allt.up.fa(k1:k2,n); a.wc=wc.state_allt.up.fa(k1:k2,n);
a.cd=cd.state_allt.up.fa(k1:k2,n); a.vd=vd.state_allt.up.fa(k1:k2,n); a.wd=wd.state_allt.up.fa(k1:k2,n);
a.c1=c1.state_allt.up.fa(k1:k2,n); a.v1=v1.state_allt.up.fa(k1:k2,n); a.w1=w1.state_allt.up.fa(k1:k2,n); 
a.c2=c2.state_allt.up.fa(k1:k2,n); a.v2=v2.state_allt.up.fa(k1:k2,n); a.w2=w2.state_allt.up.fa(k1:k2,n); 
a.c3=c3.state_allt.up.fa(k1:k2,n); a.v3=v3.state_allt.up.fa(k1:k2,n); a.w3=w3.state_allt.up.fa(k1:k2,n); 
a.c4=c4.state_allt.up.fa(k1:k2,n); a.v4=v4.state_allt.up.fa(k1:k2,n); a.w4=w4.state_allt.up.fa(k1:k2,n); 
a.c5=c5.state_allt.up.fa(k1:k2,n); a.v5=v5.state_allt.up.fa(k1:k2,n); a.w5=w5.state_allt.up.fa(k1:k2,n); 
e.ca=ca.state_allt.en.fa(k1:k2,n); e.va=va.state_allt.en.fa(k1:k2,n); e.wa=wa.state_allt.en.fa(k1:k2,n);
e.cb=cb.state_allt.en.fa(k1:k2,n); e.vb=vb.state_allt.en.fa(k1:k2,n); e.wb=wb.state_allt.en.fa(k1:k2,n);
e.cc=cc.state_allt.en.fa(k1:k2,n); e.vc=vc.state_allt.en.fa(k1:k2,n); e.wc=wc.state_allt.en.fa(k1:k2,n);
e.cd=cd.state_allt.en.fa(k1:k2,n); e.vd=vd.state_allt.en.fa(k1:k2,n); e.wd=wd.state_allt.en.fa(k1:k2,n);
e.c1=c1.state_allt.en.fa(k1:k2,n); e.v1=v1.state_allt.en.fa(k1:k2,n); e.w1=w1.state_allt.en.fa(k1:k2,n); 
e.c2=c2.state_allt.en.fa(k1:k2,n); e.v2=v2.state_allt.en.fa(k1:k2,n); e.w2=w2.state_allt.en.fa(k1:k2,n); 
e.c3=c3.state_allt.en.fa(k1:k2,n); e.v3=v3.state_allt.en.fa(k1:k2,n); e.w3=w3.state_allt.en.fa(k1:k2,n); 
e.c4=c4.state_allt.en.fa(k1:k2,n); e.v4=v4.state_allt.en.fa(k1:k2,n); e.w4=w4.state_allt.en.fa(k1:k2,n); 
e.c5=c5.state_allt.en.fa(k1:k2,n); e.v5=v5.state_allt.en.fa(k1:k2,n); e.w5=w5.state_allt.en.fa(k1:k2,n); 
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'temp');
plot_a_b; plot_e_b;
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='fractional area of updraft'; xlabel(xl,'FontSize',fsize);
yl='temperature (K)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wpt_up_ta'; xy=[0 2.5 195 305];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); n=5; k1=15; k2=79;
a.ca=ca.state_allt.up.wpt(k1:k2,n); a.va=va.state_allt.up.wpt(k1:k2,n); a.wa=wa.state_allt.up.wpt(k1:k2,n); 
a.cb=cb.state_allt.up.wpt(k1:k2,n); a.vb=vb.state_allt.up.wpt(k1:k2,n); a.wb=wb.state_allt.up.wpt(k1:k2,n); 
a.cc=cc.state_allt.up.wpt(k1:k2,n); a.vc=vc.state_allt.up.wpt(k1:k2,n); a.wc=wc.state_allt.up.wpt(k1:k2,n); 
a.cd=cd.state_allt.up.wpt(k1:k2,n); a.vd=vd.state_allt.up.wpt(k1:k2,n); a.wd=wd.state_allt.up.wpt(k1:k2,n); 
a.c1=c1.state_allt.up.wpt(k1:k2,n); a.v1=v1.state_allt.up.wpt(k1:k2,n); a.w1=w1.state_allt.up.wpt(k1:k2,n); 
a.c2=c2.state_allt.up.wpt(k1:k2,n); a.v2=v2.state_allt.up.wpt(k1:k2,n); a.w2=w2.state_allt.up.wpt(k1:k2,n); 
a.c3=c3.state_allt.up.wpt(k1:k2,n); a.v3=v3.state_allt.up.wpt(k1:k2,n); a.w3=w3.state_allt.up.wpt(k1:k2,n); 
a.c4=c4.state_allt.up.wpt(k1:k2,n); a.v4=v4.state_allt.up.wpt(k1:k2,n); a.w4=w4.state_allt.up.wpt(k1:k2,n); 
a.c5=c5.state_allt.up.wpt(k1:k2,n); a.v5=v5.state_allt.up.wpt(k1:k2,n); a.w5=w5.state_allt.up.wpt(k1:k2,n); 
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'temp');
plot_a_b;
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='updraft velocity for an updraft percentile (m/s)'; xlabel(xl,'FontSize',fsize);
yl='temperature (K)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wpt_up_pf'; xy=[0 2.5 100 1000];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); c=0.01; n=5; k1=15; k2=79;
a.ca=ca.state_allt.up.wpt(k1:k2,n); a.va=va.state_allt.up.wpt(k1:k2,n); a.wa=wa.state_allt.up.wpt(k1:k2,n); 
a.cb=cb.state_allt.up.wpt(k1:k2,n); a.vb=vb.state_allt.up.wpt(k1:k2,n); a.wb=wb.state_allt.up.wpt(k1:k2,n); 
a.c1=c1.state_allt.up.wpt(k1:k2,n); a.v1=v1.state_allt.up.wpt(k1:k2,n); a.w1=w1.state_allt.up.wpt(k1:k2,n); 
a.c2=c2.state_allt.up.wpt(k1:k2,n); a.v2=v2.state_allt.up.wpt(k1:k2,n); a.w2=w2.state_allt.up.wpt(k1:k2,n); 
a.c3=c3.state_allt.up.wpt(k1:k2,n); a.v3=v3.state_allt.up.wpt(k1:k2,n); a.w3=w3.state_allt.up.wpt(k1:k2,n); 
a.c4=c4.state_allt.up.wpt(k1:k2,n); a.v4=v4.state_allt.up.wpt(k1:k2,n); a.w4=w4.state_allt.up.wpt(k1:k2,n); 
a.c5=c5.state_allt.up.wpt(k1:k2,n); a.v5=v5.state_allt.up.wpt(k1:k2,n); a.w5=w5.state_allt.up.wpt(k1:k2,n); 
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'pfull');
plot_a_b;
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='updraft velocity for an updraft percentile (m/s)'; xlabel(xl,'FontSize',fsize);
yl='temperature (K)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mf_up'; xy=[0 0.5 195 305];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); n=1; k1=15; k2=79;
a.ca=ca.state_allt.up.mf(k1:k2,n); a.va=va.state_allt.up.mf(k1:k2,n); a.wa=wa.state_allt.up.mf(k1:k2,n); 
a.cb=cb.state_allt.up.mf(k1:k2,n); a.vb=vb.state_allt.up.mf(k1:k2,n); a.wb=wb.state_allt.up.mf(k1:k2,n); 
a.cc=cc.state_allt.up.mf(k1:k2,n); a.vc=vc.state_allt.up.mf(k1:k2,n); a.wc=wc.state_allt.up.mf(k1:k2,n); 
a.cd=cd.state_allt.up.mf(k1:k2,n); a.vd=vd.state_allt.up.mf(k1:k2,n); a.wd=wd.state_allt.up.mf(k1:k2,n); 
a.c1=c1.state_allt.up.mf(k1:k2,n); a.v1=v1.state_allt.up.mf(k1:k2,n); a.w1=w1.state_allt.up.mf(k1:k2,n); 
a.c2=c2.state_allt.up.mf(k1:k2,n); a.v2=v2.state_allt.up.mf(k1:k2,n); a.w2=w2.state_allt.up.mf(k1:k2,n); 
a.c3=c3.state_allt.up.mf(k1:k2,n); a.v3=v3.state_allt.up.mf(k1:k2,n); a.w3=w3.state_allt.up.mf(k1:k2,n); 
a.c4=c4.state_allt.up.mf(k1:k2,n); a.v4=v4.state_allt.up.mf(k1:k2,n); a.w4=w4.state_allt.up.mf(k1:k2,n); 
a.c5=c5.state_allt.up.mf(k1:k2,n); a.v5=v5.state_allt.up.mf(k1:k2,n); a.w5=w5.state_allt.up.mf(k1:k2,n); 
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'temp');
plot_a_b;
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='averaged updraft mass flux exceeding a given updraft percentile (kg/m2/s)'; xlabel(xl,'FontSize',fsize);
yl='temperature (K)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mff_up'; xy=[0 0.022 195 305];
pms=[ 0, 0, 1200, 800]*1.2; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); n=1; k1=15; k2=79;
a.ca=ca.state_allt.up.mff(k1:k2,n); a.va=va.state_allt.up.mff(k1:k2,n); a.wa=wa.state_allt.up.mff(k1:k2,n); 
a.cb=cb.state_allt.up.mff(k1:k2,n); a.vb=vb.state_allt.up.mff(k1:k2,n); a.wb=wb.state_allt.up.mff(k1:k2,n); 
a.cc=cc.state_allt.up.mff(k1:k2,n); a.vc=vc.state_allt.up.mff(k1:k2,n); a.wc=wc.state_allt.up.mff(k1:k2,n); 
a.cd=cd.state_allt.up.mff(k1:k2,n); a.vd=vd.state_allt.up.mff(k1:k2,n); a.wd=wd.state_allt.up.mff(k1:k2,n); 
a.c1=c1.state_allt.up.mff(k1:k2,n); a.v1=v1.state_allt.up.mff(k1:k2,n); a.w1=w1.state_allt.up.mff(k1:k2,n); 
a.c2=c2.state_allt.up.mff(k1:k2,n); a.v2=v2.state_allt.up.mff(k1:k2,n); a.w2=w2.state_allt.up.mff(k1:k2,n); 
a.c3=c3.state_allt.up.mff(k1:k2,n); a.v3=v3.state_allt.up.mff(k1:k2,n); a.w3=w3.state_allt.up.mff(k1:k2,n); 
a.c4=c4.state_allt.up.mff(k1:k2,n); a.v4=v4.state_allt.up.mff(k1:k2,n); a.w4=w4.state_allt.up.mff(k1:k2,n); 
a.c5=c5.state_allt.up.mff(k1:k2,n); a.v5=v5.state_allt.up.mff(k1:k2,n); a.w5=w5.state_allt.up.mff(k1:k2,n); 
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'temp');
plot_a_b;
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='total updraft mass flux for a given updraft percentile(kg/m2/s)'; xlabel(xl,'FontSize',fsize);
yl='temperature (K)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_up'; xy=[0 5 195 305];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); n=5; k1=15; k2=79;
a.ca=ca.state_allt.up.wa(k1:k2,n); a.va=va.state_allt.up.wa(k1:k2,n); a.wa=wa.state_allt.up.wa(k1:k2,n); 
a.cb=cb.state_allt.up.wa(k1:k2,n); a.vb=vb.state_allt.up.wa(k1:k2,n); a.wb=wb.state_allt.up.wa(k1:k2,n); 
a.cc=cc.state_allt.up.wa(k1:k2,n); a.vc=vc.state_allt.up.wa(k1:k2,n); a.wc=wc.state_allt.up.wa(k1:k2,n); 
a.cd=cd.state_allt.up.wa(k1:k2,n); a.vd=vd.state_allt.up.wa(k1:k2,n); a.wd=wd.state_allt.up.wa(k1:k2,n); 
a.c1=c1.state_allt.up.wa(k1:k2,n); a.v1=v1.state_allt.up.wa(k1:k2,n); a.w1=w1.state_allt.up.wa(k1:k2,n);
a.c2=c2.state_allt.up.wa(k1:k2,n); a.v2=v2.state_allt.up.wa(k1:k2,n); a.w2=w2.state_allt.up.wa(k1:k2,n);
a.c3=c3.state_allt.up.wa(k1:k2,n); a.v3=v3.state_allt.up.wa(k1:k2,n); a.w3=w3.state_allt.up.wa(k1:k2,n);
a.c4=c4.state_allt.up.wa(k1:k2,n); a.v4=v4.state_allt.up.wa(k1:k2,n); a.w4=w4.state_allt.up.wa(k1:k2,n);
a.c5=c5.state_allt.up.wa(k1:k2,n); a.v5=v5.state_allt.up.wa(k1:k2,n); a.w5=w5.state_allt.up.wa(k1:k2,n);
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'temp');
plot_a_b;
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='averaged updraft velocity exceeding a given updraft percentile (m/s)'; xlabel(xl,'FontSize',fsize);
yl='temperature (K)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rho_up'; xy=[0 1 195 305];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); n=1; k1=15; k2=79;
a.ca=ca.state_allt.up.rho(k1:k2,n); a.va=va.state_allt.up.rho(k1:k2,n); a.wa=wa.state_allt.up.rho(k1:k2,n); 
a.cb=cb.state_allt.up.rho(k1:k2,n); a.vb=vb.state_allt.up.rho(k1:k2,n); a.wb=wb.state_allt.up.rho(k1:k2,n); 
a.cc=cc.state_allt.up.rho(k1:k2,n); a.vc=vc.state_allt.up.rho(k1:k2,n); a.wc=wc.state_allt.up.rho(k1:k2,n); 
a.cd=cd.state_allt.up.rho(k1:k2,n); a.vd=vd.state_allt.up.rho(k1:k2,n); a.wd=wd.state_allt.up.rho(k1:k2,n); 
a.c1=c1.state_allt.up.rho(k1:k2,n); a.v1=v1.state_allt.up.rho(k1:k2,n); a.w1=w1.state_allt.up.rho(k1:k2,n);
a.c2=c2.state_allt.up.rho(k1:k2,n); a.v2=v2.state_allt.up.rho(k1:k2,n); a.w2=w2.state_allt.up.rho(k1:k2,n);
a.c3=c3.state_allt.up.rho(k1:k2,n); a.v3=v3.state_allt.up.rho(k1:k2,n); a.w3=w3.state_allt.up.rho(k1:k2,n);
a.c4=c4.state_allt.up.rho(k1:k2,n); a.v4=v4.state_allt.up.rho(k1:k2,n); a.w4=w4.state_allt.up.rho(k1:k2,n);
a.c5=c5.state_allt.up.rho(k1:k2,n); a.v5=v5.state_allt.up.rho(k1:k2,n); a.w5=w5.state_allt.up.rho(k1:k2,n);
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'temp');
plot_a_b;
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='updraft velocity for a given updraft percentile (kg/m2/s)'; xlabel(xl,'FontSize',fsize);
yl='temperature (K)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='buo_up'; xy=[-8 9 195 305];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); n=5; k1=15; k2=79;
a.ca=ca.state_allt.up.buo(k1:k2,n); a.va=va.state_allt.up.buo(k1:k2,n); a.wa=wa.state_allt.up.buo(k1:k2,n); 
a.cb=cb.state_allt.up.buo(k1:k2,n); a.vb=vb.state_allt.up.buo(k1:k2,n); a.wb=wb.state_allt.up.buo(k1:k2,n); 
a.cc=cc.state_allt.up.buo(k1:k2,n); a.vc=vc.state_allt.up.buo(k1:k2,n); a.wc=wc.state_allt.up.buo(k1:k2,n); 
a.cd=cd.state_allt.up.buo(k1:k2,n); a.vd=vd.state_allt.up.buo(k1:k2,n); a.wd=wd.state_allt.up.buo(k1:k2,n); 
a.c1=c1.state_allt.up.buo(k1:k2,n); a.v1=v1.state_allt.up.buo(k1:k2,n); a.w1=w1.state_allt.up.buo(k1:k2,n);
a.c2=c2.state_allt.up.buo(k1:k2,n); a.v2=v2.state_allt.up.buo(k1:k2,n); a.w2=w2.state_allt.up.buo(k1:k2,n);
a.c3=c3.state_allt.up.buo(k1:k2,n); a.v3=v3.state_allt.up.buo(k1:k2,n); a.w3=w3.state_allt.up.buo(k1:k2,n);
a.c4=c4.state_allt.up.buo(k1:k2,n); a.v4=v4.state_allt.up.buo(k1:k2,n); a.w4=w4.state_allt.up.buo(k1:k2,n);
a.c5=c5.state_allt.up.buo(k1:k2,n); a.v5=v5.state_allt.up.buo(k1:k2,n); a.w5=w5.state_allt.up.buo(k1:k2,n);
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'temp');
plot_a_b;
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='updraft buoyancb for a given updraft percentile (K)'; xlabel(xl,'FontSize',fsize);
yl='temperature (K)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='buo_up_pf'; xy=[-8 8 100 1000];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); n=5; k1=15; k2=79;
a.ca=ca.state_allt.up.buo(k1:k2,n); a.va=va.state_allt.up.buo(k1:k2,n); a.wa=wa.state_allt.up.buo(k1:k2,n); 
a.cb=cb.state_allt.up.buo(k1:k2,n); a.vb=vb.state_allt.up.buo(k1:k2,n); a.wb=wb.state_allt.up.buo(k1:k2,n); 
a.cc=cc.state_allt.up.buo(k1:k2,n); a.vc=vc.state_allt.up.buo(k1:k2,n); a.wc=wc.state_allt.up.buo(k1:k2,n); 
a.cd=cd.state_allt.up.buo(k1:k2,n); a.vd=vd.state_allt.up.buo(k1:k2,n); a.wd=wd.state_allt.up.buo(k1:k2,n); 
a.c1=c1.state_allt.up.buo(k1:k2,n); a.v1=v1.state_allt.up.buo(k1:k2,n); a.w1=w1.state_allt.up.buo(k1:k2,n);
a.c2=c2.state_allt.up.buo(k1:k2,n); a.v2=v2.state_allt.up.buo(k1:k2,n); a.w2=w2.state_allt.up.buo(k1:k2,n);
a.c3=c3.state_allt.up.buo(k1:k2,n); a.v3=v3.state_allt.up.buo(k1:k2,n); a.w3=w3.state_allt.up.buo(k1:k2,n);
a.c4=c4.state_allt.up.buo(k1:k2,n); a.v4=v4.state_allt.up.buo(k1:k2,n); a.w4=w4.state_allt.up.buo(k1:k2,n);
a.c5=c5.state_allt.up.buo(k1:k2,n); a.v5=v5.state_allt.up.buo(k1:k2,n); a.w5=w5.state_allt.up.buo(k1:k2,n);
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'pfull');
plot_a_b;
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='updraft buoyance for a given updraft percentile (K)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dpdz_up_pf'; xy=[-8 8 100 1000];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); n=5; k1=15; k2=79;
a.ca=ca.state_allt.up.dpdz(k1:k2,n); a.va=va.state_allt.up.dpdz(k1:k2,n); a.wa=wa.state_allt.up.dpdz(k1:k2,n); 
a.cb=cb.state_allt.up.dpdz(k1:k2,n); a.vb=vb.state_allt.up.dpdz(k1:k2,n); a.wb=wb.state_allt.up.dpdz(k1:k2,n); 
a.cc=cc.state_allt.up.dpdz(k1:k2,n); a.vc=vc.state_allt.up.dpdz(k1:k2,n); a.wc=wc.state_allt.up.dpdz(k1:k2,n); 
a.cd=cd.state_allt.up.dpdz(k1:k2,n); a.vd=vd.state_allt.up.dpdz(k1:k2,n); a.wd=wd.state_allt.up.dpdz(k1:k2,n); 
a.c1=c1.state_allt.up.dpdz(k1:k2,n); a.v1=v1.state_allt.up.dpdz(k1:k2,n); a.w1=w1.state_allt.up.dpdz(k1:k2,n);
a.c2=c2.state_allt.up.dpdz(k1:k2,n); a.v2=v2.state_allt.up.dpdz(k1:k2,n); a.w2=w2.state_allt.up.dpdz(k1:k2,n);
a.c3=c3.state_allt.up.dpdz(k1:k2,n); a.v3=v3.state_allt.up.dpdz(k1:k2,n); a.w3=w3.state_allt.up.dpdz(k1:k2,n);
a.c4=c4.state_allt.up.dpdz(k1:k2,n); a.v4=v4.state_allt.up.dpdz(k1:k2,n); a.w4=w4.state_allt.up.dpdz(k1:k2,n);
a.c5=c5.state_allt.up.dpdz(k1:k2,n); a.v5=v5.state_allt.up.dpdz(k1:k2,n); a.w5=w5.state_allt.up.dpdz(k1:k2,n);
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'pfull');
plot_a_b;
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='updraft temperature anomalies from horizontal mean for a given updraft percentile (K)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh_up_pf'; xy=[0 100 100 1000];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); n=1; k1=15; k2=79;
a.ca=ca.state_allt.up.rh(k1:k2,n); a.va=va.state_allt.up.rh(k1:k2,n); a.wa=wa.state_allt.up.rh(k1:k2,n); 
a.cb=cb.state_allt.up.rh(k1:k2,n); a.vb=vb.state_allt.up.rh(k1:k2,n); a.wb=wb.state_allt.up.rh(k1:k2,n); 
a.cc=cc.state_allt.up.rh(k1:k2,n); a.vc=vc.state_allt.up.rh(k1:k2,n); a.wc=wc.state_allt.up.rh(k1:k2,n); 
a.cd=cd.state_allt.up.rh(k1:k2,n); a.vd=vd.state_allt.up.rh(k1:k2,n); a.wd=wd.state_allt.up.rh(k1:k2,n); 
a.c1=c1.state_allt.up.rh(k1:k2,n); a.v1=v1.state_allt.up.rh(k1:k2,n); a.w1=w1.state_allt.up.rh(k1:k2,n);
a.c2=c2.state_allt.up.rh(k1:k2,n); a.v2=v2.state_allt.up.rh(k1:k2,n); a.w2=w2.state_allt.up.rh(k1:k2,n);
a.c3=c3.state_allt.up.rh(k1:k2,n); a.v3=v3.state_allt.up.rh(k1:k2,n); a.w3=w3.state_allt.up.rh(k1:k2,n);
a.c4=c4.state_allt.up.rh(k1:k2,n); a.v4=v4.state_allt.up.rh(k1:k2,n); a.w4=w4.state_allt.up.rh(k1:k2,n);
a.c5=c5.state_allt.up.rh(k1:k2,n); a.v5=v5.state_allt.up.rh(k1:k2,n); a.w5=w5.state_allt.up.rh(k1:k2,n);
e.ca=ca.state_allt.en.rh(k1:k2,n); e.va=va.state_allt.en.rh(k1:k2,n); e.wa=wa.state_allt.en.rh(k1:k2,n); 
e.cb=cb.state_allt.en.rh(k1:k2,n); e.vb=vb.state_allt.en.rh(k1:k2,n); e.wb=wb.state_allt.en.rh(k1:k2,n); 
e.cc=cc.state_allt.en.rh(k1:k2,n); e.vc=vc.state_allt.en.rh(k1:k2,n); e.wc=wc.state_allt.en.rh(k1:k2,n); 
e.cd=cd.state_allt.en.rh(k1:k2,n); e.vd=vd.state_allt.en.rh(k1:k2,n); e.wd=wd.state_allt.en.rh(k1:k2,n); 
e.c1=c1.state_allt.en.rh(k1:k2,n); e.v1=v1.state_allt.en.rh(k1:k2,n); e.w1=w1.state_allt.en.rh(k1:k2,n);
e.c2=c2.state_allt.en.rh(k1:k2,n); e.v2=v2.state_allt.en.rh(k1:k2,n); e.w2=w2.state_allt.en.rh(k1:k2,n);
e.c3=c3.state_allt.en.rh(k1:k2,n); e.v3=v3.state_allt.en.rh(k1:k2,n); e.w3=w3.state_allt.en.rh(k1:k2,n);
e.c4=c4.state_allt.en.rh(k1:k2,n); e.v4=v4.state_allt.en.rh(k1:k2,n); e.w4=w4.state_allt.en.rh(k1:k2,n);
e.c5=c5.state_allt.en.rh(k1:k2,n); e.v5=v5.state_allt.en.rh(k1:k2,n); e.w5=w5.state_allt.en.rh(k1:k2,n);
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'pfull');
plot_a_b; plot_e_b;
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',3); axis(xy);
xl='updraft RH for a given updraft percentile (%)'; xlabel(xl,'FontSize',fsize);
yl='temperature (K)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mse_up_pf'; xy=[300 380 100 1000];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); c=1/CPD; n=1; k1=10; k2=79;
a.ca=ca.state_allt.up.mse(k1:k2,n)*c; a.va=va.state_allt.up.mse(k1:k2,n)*c; a.wa=wa.state_allt.up.mse(k1:k2,n)*c; 
a.cb=cb.state_allt.up.mse(k1:k2,n)*c; a.vb=vb.state_allt.up.mse(k1:k2,n)*c; a.wb=wb.state_allt.up.mse(k1:k2,n)*c; 
a.cc=cc.state_allt.up.mse(k1:k2,n)*c; a.vc=vc.state_allt.up.mse(k1:k2,n)*c; a.wc=wc.state_allt.up.mse(k1:k2,n)*c; 
a.cd=cd.state_allt.up.mse(k1:k2,n)*c; a.vd=vd.state_allt.up.mse(k1:k2,n)*c; a.wd=wd.state_allt.up.mse(k1:k2,n)*c; 
a.c1=c1.state_allt.up.mse(k1:k2,n)*c; a.v1=v1.state_allt.up.mse(k1:k2,n)*c; a.w1=w1.state_allt.up.mse(k1:k2,n)*c;
a.c2=c2.state_allt.up.mse(k1:k2,n)*c; a.v2=v2.state_allt.up.mse(k1:k2,n)*c; a.w2=w2.state_allt.up.mse(k1:k2,n)*c;
a.c3=c3.state_allt.up.mse(k1:k2,n)*c; a.v3=v3.state_allt.up.mse(k1:k2,n)*c; a.w3=w3.state_allt.up.mse(k1:k2,n)*c;
a.c4=c4.state_allt.up.mse(k1:k2,n)*c; a.v4=v4.state_allt.up.mse(k1:k2,n)*c; a.w4=w4.state_allt.up.mse(k1:k2,n)*c;
a.c5=c5.state_allt.up.mse(k1:k2,n)*c; a.v5=v5.state_allt.up.mse(k1:k2,n)*c; a.w5=w5.state_allt.up.mse(k1:k2,n)*c;
e.ca=ca.state_allt.en.mse(k1:k2,n)*c; e.va=va.state_allt.en.mse(k1:k2,n)*c; e.wa=wa.state_allt.en.mse(k1:k2,n)*c;
e.cb=cb.state_allt.en.mse(k1:k2,n)*c; e.vb=vb.state_allt.en.mse(k1:k2,n)*c; e.wb=wb.state_allt.en.mse(k1:k2,n)*c;
e.cc=cc.state_allt.en.mse(k1:k2,n)*c; e.vc=vc.state_allt.en.mse(k1:k2,n)*c; e.wc=wc.state_allt.en.mse(k1:k2,n)*c;
e.cd=cd.state_allt.en.mse(k1:k2,n)*c; e.vd=vd.state_allt.en.mse(k1:k2,n)*c; e.wd=wd.state_allt.en.mse(k1:k2,n)*c;
e.c1=c1.state_allt.en.mse(k1:k2,n)*c; e.v1=v1.state_allt.en.mse(k1:k2,n)*c; e.w1=w1.state_allt.en.mse(k1:k2,n)*c;
e.c2=c2.state_allt.en.mse(k1:k2,n)*c; e.v2=v2.state_allt.en.mse(k1:k2,n)*c; e.w2=w2.state_allt.en.mse(k1:k2,n)*c;
e.c3=c3.state_allt.en.mse(k1:k2,n)*c; e.v3=v3.state_allt.en.mse(k1:k2,n)*c; e.w3=w3.state_allt.en.mse(k1:k2,n)*c;
e.c4=c4.state_allt.en.mse(k1:k2,n)*c; e.v4=v4.state_allt.en.mse(k1:k2,n)*c; e.w4=w4.state_allt.en.mse(k1:k2,n)*c;
e.c5=c5.state_allt.en.mse(k1:k2,n)*c; e.v5=v5.state_allt.en.mse(k1:k2,n)*c; e.w5=w5.state_allt.en.mse(k1:k2,n)*c;
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'pfull');
plot_a_b; plot_e_b;
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',4); axis(xy);
xl='moist static energy / C_p (K)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qt_up_pf'; xy=[0 22 100 1000];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); c=1000; n=1; k1=10; k2=79;
a.ca=ca.state_allt.up.qt(k1:k2,n)*c; a.va=va.state_allt.up.qt(k1:k2,n)*c; a.wa=wa.state_allt.up.qt(k1:k2,n)*c;
a.cb=cb.state_allt.up.qt(k1:k2,n)*c; a.vb=vb.state_allt.up.qt(k1:k2,n)*c; a.wb=wb.state_allt.up.qt(k1:k2,n)*c;
a.cc=cc.state_allt.up.qt(k1:k2,n)*c; a.vc=vc.state_allt.up.qt(k1:k2,n)*c; a.wc=wc.state_allt.up.qt(k1:k2,n)*c;
a.cd=cd.state_allt.up.qt(k1:k2,n)*c; a.vd=vd.state_allt.up.qt(k1:k2,n)*c; a.wd=wd.state_allt.up.qt(k1:k2,n)*c;
a.c1=c1.state_allt.up.qt(k1:k2,n)*c; a.v1=v1.state_allt.up.qt(k1:k2,n)*c; a.w1=w1.state_allt.up.qt(k1:k2,n)*c;
a.c2=c2.state_allt.up.qt(k1:k2,n)*c; a.v2=v2.state_allt.up.qt(k1:k2,n)*c; a.w2=w2.state_allt.up.qt(k1:k2,n)*c;
a.c3=c3.state_allt.up.qt(k1:k2,n)*c; a.v3=v3.state_allt.up.qt(k1:k2,n)*c; a.w3=w3.state_allt.up.qt(k1:k2,n)*c;
a.c4=c4.state_allt.up.qt(k1:k2,n)*c; a.v4=v4.state_allt.up.qt(k1:k2,n)*c; a.w4=w4.state_allt.up.qt(k1:k2,n)*c;
a.c5=c5.state_allt.up.qt(k1:k2,n)*c; a.v5=v5.state_allt.up.qt(k1:k2,n)*c; a.w5=w5.state_allt.up.qt(k1:k2,n)*c;
e.ca=ca.state_allt.en.qt(k1:k2,n)*c; e.va=va.state_allt.en.qt(k1:k2,n)*c; e.wa=wa.state_allt.en.qt(k1:k2,n)*c;
e.cb=cb.state_allt.en.qt(k1:k2,n)*c; e.vb=vb.state_allt.en.qt(k1:k2,n)*c; e.wb=wb.state_allt.en.qt(k1:k2,n)*c;
e.cc=cc.state_allt.en.qt(k1:k2,n)*c; e.vc=vc.state_allt.en.qt(k1:k2,n)*c; e.wc=wc.state_allt.en.qt(k1:k2,n)*c;
e.cd=cd.state_allt.en.qt(k1:k2,n)*c; e.vd=vd.state_allt.en.qt(k1:k2,n)*c; e.wd=wd.state_allt.en.qt(k1:k2,n)*c;
e.c1=c1.state_allt.en.qt(k1:k2,n)*c; e.v1=v1.state_allt.en.qt(k1:k2,n)*c; e.w1=w1.state_allt.en.qt(k1:k2,n)*c;
e.c2=c2.state_allt.en.qt(k1:k2,n)*c; e.v2=v2.state_allt.en.qt(k1:k2,n)*c; e.w2=w2.state_allt.en.qt(k1:k2,n)*c;
e.c3=c3.state_allt.en.qt(k1:k2,n)*c; e.v3=v3.state_allt.en.qt(k1:k2,n)*c; e.w3=w3.state_allt.en.qt(k1:k2,n)*c;
e.c4=c4.state_allt.en.qt(k1:k2,n)*c; e.v4=v4.state_allt.en.qt(k1:k2,n)*c; e.w4=w4.state_allt.en.qt(k1:k2,n)*c;
e.c5=c5.state_allt.en.qt(k1:k2,n)*c; e.v5=v5.state_allt.en.qt(k1:k2,n)*c; e.w5=w5.state_allt.en.qt(k1:k2,n)*c;
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'pfull');
plot_a_b; plot_e_b; 
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='total water content (g/kg)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qv_up_pf'; xy=[0 22 100 1000];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); c=1000; n=1; k1=10; k2=79;
a.ca=ca.state_allt.up.qv(k1:k2,n)*c; a.va=va.state_allt.up.qv(k1:k2,n)*c; a.wa=wa.state_allt.up.qv(k1:k2,n)*c;
a.cb=cb.state_allt.up.qv(k1:k2,n)*c; a.vb=vb.state_allt.up.qv(k1:k2,n)*c; a.wb=wb.state_allt.up.qv(k1:k2,n)*c;
a.cc=cc.state_allt.up.qv(k1:k2,n)*c; a.vc=vc.state_allt.up.qv(k1:k2,n)*c; a.wc=wc.state_allt.up.qv(k1:k2,n)*c;
a.cd=cd.state_allt.up.qv(k1:k2,n)*c; a.vd=vd.state_allt.up.qv(k1:k2,n)*c; a.wd=wd.state_allt.up.qv(k1:k2,n)*c;
a.c1=c1.state_allt.up.qv(k1:k2,n)*c; a.v1=v1.state_allt.up.qv(k1:k2,n)*c; a.w1=w1.state_allt.up.qv(k1:k2,n)*c;
a.c2=c2.state_allt.up.qv(k1:k2,n)*c; a.v2=v2.state_allt.up.qv(k1:k2,n)*c; a.w2=w2.state_allt.up.qv(k1:k2,n)*c;
a.c3=c3.state_allt.up.qv(k1:k2,n)*c; a.v3=v3.state_allt.up.qv(k1:k2,n)*c; a.w3=w3.state_allt.up.qv(k1:k2,n)*c;
a.c4=c4.state_allt.up.qv(k1:k2,n)*c; a.v4=v4.state_allt.up.qv(k1:k2,n)*c; a.w4=w4.state_allt.up.qv(k1:k2,n)*c;
a.c5=c5.state_allt.up.qv(k1:k2,n)*c; a.v5=v5.state_allt.up.qv(k1:k2,n)*c; a.w5=w5.state_allt.up.qv(k1:k2,n)*c;
e.ca=ca.state_allt.en.qv(k1:k2,n)*c; e.va=va.state_allt.en.qv(k1:k2,n)*c; e.wa=wa.state_allt.en.qv(k1:k2,n)*c;
e.cb=cb.state_allt.en.qv(k1:k2,n)*c; e.vb=vb.state_allt.en.qv(k1:k2,n)*c; e.wb=wb.state_allt.en.qv(k1:k2,n)*c;
e.cc=cc.state_allt.en.qv(k1:k2,n)*c; e.vc=vc.state_allt.en.qv(k1:k2,n)*c; e.wc=wc.state_allt.en.qv(k1:k2,n)*c;
e.cd=cd.state_allt.en.qv(k1:k2,n)*c; e.vd=vd.state_allt.en.qv(k1:k2,n)*c; e.wd=wd.state_allt.en.qv(k1:k2,n)*c;
e.c1=c1.state_allt.en.qv(k1:k2,n)*c; e.v1=v1.state_allt.en.qv(k1:k2,n)*c; e.w1=w1.state_allt.en.qv(k1:k2,n)*c;
e.c2=c2.state_allt.en.qv(k1:k2,n)*c; e.v2=v2.state_allt.en.qv(k1:k2,n)*c; e.w2=w2.state_allt.en.qv(k1:k2,n)*c;
e.c3=c3.state_allt.en.qv(k1:k2,n)*c; e.v3=v3.state_allt.en.qv(k1:k2,n)*c; e.w3=w3.state_allt.en.qv(k1:k2,n)*c;
e.c4=c4.state_allt.en.qv(k1:k2,n)*c; e.v4=v4.state_allt.en.qv(k1:k2,n)*c; e.w4=w4.state_allt.en.qv(k1:k2,n)*c;
e.c5=c5.state_allt.en.qv(k1:k2,n)*c; e.v5=v5.state_allt.en.qv(k1:k2,n)*c; e.w5=w5.state_allt.en.qv(k1:k2,n)*c;
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'pfull');
plot_a_b; plot_e_b; 
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='specific humidity (g/kg)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wqt_up'; xy=[0 0.0025 195 305];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); n=1; k1=15; k2=79;
a.ca=ca.flux_allt.up.wqt(k1:k2,n); a.va=va.flux_allt.up.wqt(k1:k2,n); a.wa=wa.flux_allt.up.wqt(k1:k2,n); 
a.cb=cb.flux_allt.up.wqt(k1:k2,n); a.vb=vb.flux_allt.up.wqt(k1:k2,n); a.wb=wb.flux_allt.up.wqt(k1:k2,n); 
a.cc=cc.flux_allt.up.wqt(k1:k2,n); a.vc=vc.flux_allt.up.wqt(k1:k2,n); a.wc=wc.flux_allt.up.wqt(k1:k2,n); 
a.cd=cd.flux_allt.up.wqt(k1:k2,n); a.vd=vd.flux_allt.up.wqt(k1:k2,n); a.wd=wd.flux_allt.up.wqt(k1:k2,n); 
a.c1=c1.flux_allt.up.wqt(k1:k2,n); a.v1=v1.flux_allt.up.wqt(k1:k2,n); a.w1=w1.flux_allt.up.wqt(k1:k2,n); 
a.c2=c2.flux_allt.up.wqt(k1:k2,n); a.v2=v2.flux_allt.up.wqt(k1:k2,n); a.w2=w2.flux_allt.up.wqt(k1:k2,n); 
a.c3=c3.flux_allt.up.wqt(k1:k2,n); a.v3=v3.flux_allt.up.wqt(k1:k2,n); a.w3=w3.flux_allt.up.wqt(k1:k2,n); 
a.c4=c4.flux_allt.up.wqt(k1:k2,n); a.v4=v4.flux_allt.up.wqt(k1:k2,n); a.w4=w4.flux_allt.up.wqt(k1:k2,n); 
a.c5=c5.flux_allt.up.wqt(k1:k2,n); a.v5=v5.flux_allt.up.wqt(k1:k2,n); a.w5=w5.flux_allt.up.wqt(k1:k2,n); 
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'temp');
plot_a_b;
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='total water flux wqt (kg/m2/s)'; xlabel(xl,'FontSize',fsize);
yl='temperature (K)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='buo_dn'; xy=[0 1 195 305];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); n=3; k1=15; k2=79;
a.ca=ca.state_allt.dn.buo(k1:k2,n); a.va=va.state_allt.dn.buo(k1:k2,n); a.wa=wa.state_allt.dn.buo(k1:k2,n);
a.cb=cb.state_allt.dn.buo(k1:k2,n); a.vb=vb.state_allt.dn.buo(k1:k2,n); a.wb=wb.state_allt.dn.buo(k1:k2,n);
a.cc=cc.state_allt.dn.buo(k1:k2,n); a.vc=vc.state_allt.dn.buo(k1:k2,n); a.wc=wc.state_allt.dn.buo(k1:k2,n);
a.cd=cd.state_allt.dn.buo(k1:k2,n); a.vd=vd.state_allt.dn.buo(k1:k2,n); a.wd=wd.state_allt.dn.buo(k1:k2,n);
a.c1=c1.state_allt.dn.buo(k1:k2,n); a.v1=v1.state_allt.dn.buo(k1:k2,n); a.w1=w1.state_allt.dn.buo(k1:k2,n);
a.c2=c2.state_allt.dn.buo(k1:k2,n); a.v2=v2.state_allt.dn.buo(k1:k2,n); a.w2=w2.state_allt.dn.buo(k1:k2,n);
a.c3=c3.state_allt.dn.buo(k1:k2,n); a.v3=v3.state_allt.dn.buo(k1:k2,n); a.w3=w3.state_allt.dn.buo(k1:k2,n);
a.c4=c4.state_allt.dn.buo(k1:k2,n); a.v4=v4.state_allt.dn.buo(k1:k2,n); a.w4=w4.state_allt.dn.buo(k1:k2,n);
a.c5=c5.state_allt.dn.buo(k1:k2,n); a.v5=v5.state_allt.dn.buo(k1:k2,n); a.w5=w5.state_allt.dn.buo(k1:k2,n);
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'temp');
plot_a_b;
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='averaged downdraft vertical velocity exceeding a given updraft percentile (kg/m2/s)'; xlabel(xl,'FontSize',fsize);
yl='temperature (K)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mse_dn_pf'; xy=[300 380 100 1000];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); c=1/CPD; n=1; k1=10; k2=79;
a.ca=ca.state_allt.dn.mse(k1:k2,n)*c; a.va=va.state_allt.dn.mse(k1:k2,n)*c; a.wa=wa.state_allt.dn.mse(k1:k2,n)*c;
a.cb=cb.state_allt.dn.mse(k1:k2,n)*c; a.vb=vb.state_allt.dn.mse(k1:k2,n)*c; a.wb=wb.state_allt.dn.mse(k1:k2,n)*c;
a.cc=cc.state_allt.dn.mse(k1:k2,n)*c; a.vc=vc.state_allt.dn.mse(k1:k2,n)*c; a.wc=wc.state_allt.dn.mse(k1:k2,n)*c;
a.cd=cd.state_allt.dn.mse(k1:k2,n)*c; a.vd=vd.state_allt.dn.mse(k1:k2,n)*c; a.wd=wd.state_allt.dn.mse(k1:k2,n)*c;
a.c1=c1.state_allt.dn.mse(k1:k2,n)*c; a.v1=v1.state_allt.dn.mse(k1:k2,n)*c; a.w1=w1.state_allt.dn.mse(k1:k2,n)*c;
a.c2=c2.state_allt.dn.mse(k1:k2,n)*c; a.v2=v2.state_allt.dn.mse(k1:k2,n)*c; a.w2=w2.state_allt.dn.mse(k1:k2,n)*c;
a.c3=c3.state_allt.dn.mse(k1:k2,n)*c; a.v3=v3.state_allt.dn.mse(k1:k2,n)*c; a.w3=w3.state_allt.dn.mse(k1:k2,n)*c;
a.c4=c4.state_allt.dn.mse(k1:k2,n)*c; a.v4=v4.state_allt.dn.mse(k1:k2,n)*c; a.w4=w4.state_allt.dn.mse(k1:k2,n)*c;
a.c5=c5.state_allt.dn.mse(k1:k2,n)*c; a.v5=v5.state_allt.dn.mse(k1:k2,n)*c; a.w5=w5.state_allt.dn.mse(k1:k2,n)*c;
e.ca=ca.state_allt.en.mse(k1:k2,n)*c; e.va=va.state_allt.en.mse(k1:k2,n)*c; e.wa=wa.state_allt.en.mse(k1:k2,n)*c;
e.cb=cb.state_allt.en.mse(k1:k2,n)*c; e.vb=vb.state_allt.en.mse(k1:k2,n)*c; e.wb=wb.state_allt.en.mse(k1:k2,n)*c;
e.cc=cc.state_allt.en.mse(k1:k2,n)*c; e.vc=vc.state_allt.en.mse(k1:k2,n)*c; e.wc=wc.state_allt.en.mse(k1:k2,n)*c;
e.cd=cd.state_allt.en.mse(k1:k2,n)*c; e.vd=vd.state_allt.en.mse(k1:k2,n)*c; e.wd=wd.state_allt.en.mse(k1:k2,n)*c;
e.c1=c1.state_allt.en.mse(k1:k2,n)*c; e.v1=v1.state_allt.en.mse(k1:k2,n)*c; e.w1=w1.state_allt.en.mse(k1:k2,n)*c;
e.c2=c2.state_allt.en.mse(k1:k2,n)*c; e.v2=v2.state_allt.en.mse(k1:k2,n)*c; e.w2=w2.state_allt.en.mse(k1:k2,n)*c;
e.c3=c3.state_allt.en.mse(k1:k2,n)*c; e.v3=v3.state_allt.en.mse(k1:k2,n)*c; e.w3=w3.state_allt.en.mse(k1:k2,n)*c;
e.c4=c4.state_allt.en.mse(k1:k2,n)*c; e.v4=v4.state_allt.en.mse(k1:k2,n)*c; e.w4=w4.state_allt.en.mse(k1:k2,n)*c;
e.c5=c5.state_allt.en.mse(k1:k2,n)*c; e.v5=v5.state_allt.en.mse(k1:k2,n)*c; e.w5=w5.state_allt.en.mse(k1:k2,n)*c;
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'pfull');
plot_a_b; plot_e_b;
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',4); axis(xy);
xl='moist static energy / C_p (K)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='buo_en'; xy=[-1 1 195 305];
pms=[ 0, 0, 1200, 800]*1.; fsize=24; lw=2; msize=8; pf=v1.pf;
handle = figure('Position', pms,'visible','on'); n=1; k1=15; k2=79;
a.ca=ca.state_allt.en.buo(k1:k2,n); a.va=va.state_allt.dn.buo(k1:k2,n); a.wa=wa.state_allt.dn.buo(k1:k2,n);
a.cb=cb.state_allt.en.buo(k1:k2,n); a.vb=vb.state_allt.dn.buo(k1:k2,n); a.wb=wb.state_allt.dn.buo(k1:k2,n);
a.cc=cc.state_allt.en.buo(k1:k2,n); a.vc=vc.state_allt.dn.buo(k1:k2,n); a.wc=wc.state_allt.dn.buo(k1:k2,n);
a.cd=cd.state_allt.en.buo(k1:k2,n); a.vd=vd.state_allt.dn.buo(k1:k2,n); a.wd=wd.state_allt.dn.buo(k1:k2,n);
a.c1=c1.state_allt.en.buo(k1:k2,n); a.v1=v1.state_allt.dn.buo(k1:k2,n); a.w1=w1.state_allt.dn.buo(k1:k2,n);
a.c2=c2.state_allt.en.buo(k1:k2,n); a.v2=v2.state_allt.dn.buo(k1:k2,n); a.w2=w2.state_allt.dn.buo(k1:k2,n);
a.c3=c3.state_allt.en.buo(k1:k2,n); a.v3=v3.state_allt.dn.buo(k1:k2,n); a.w3=w3.state_allt.dn.buo(k1:k2,n);
a.c4=c4.state_allt.en.buo(k1:k2,n); a.v4=v4.state_allt.dn.buo(k1:k2,n); a.w4=w4.state_allt.dn.buo(k1:k2,n);
a.c5=c5.state_allt.en.buo(k1:k2,n); a.v5=v5.state_allt.dn.buo(k1:k2,n); a.w5=w5.state_allt.dn.buo(k1:k2,n);
b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,va,vb,vc,vd,v1,v2,v3,v4,v5,wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,'temp');
plot_a_b;
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='averaged downdraft vertical velocity exceeding a given updraft percentile (kg/m2/s)'; xlabel(xl,'FontSize',fsize);
yl='temperature (K)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
