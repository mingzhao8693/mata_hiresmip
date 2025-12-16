%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; zs=1; res='R48A';
res='R48A'; t1=300; t2=330; expn='RCE_H2048x128_L79_R03_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
res='R24A'; t1=200; t2=330; expn='RCE_H2048x128_L79_R03_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
res='R12A'; t1=200; t2=330; expn='RCE_H2048x128_L79_R03_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
res='R06A'; t1=200; t2=330; expn='RCE_H2048x128_L79_R03_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
res='org';  t1=200; t2=330; expn='RCE_H2048x128_L79_R03_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; zs=1; res='R48A';
res='R48A'; t1=200; t2=300; expn='RCE_H2048x128_L79_R01_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
res='R24A'; t1=200; t2=300; expn='RCE_H2048x128_L79_R01_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
res='R12A'; t1=200; t2=300; expn='RCE_H2048x128_L79_R01_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
res='R06A'; t1=200; t2=300; expn='RCE_H2048x128_L79_R01_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
res='org';  t1=200; t2=300; expn='RCE_H2048x128_L79_R01_300'; v1=rceana_ins(tpath,expn,res,t1,t2,zs);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath='/work/miz/mat_rce/'; fext='_ins_300_330fast2.mat';
res='org'; expn='RCE_H2048x128_L79_R03_300'; fn=strcat(tpath,expn,'_',res,fext); load(fn);v1=v;
res='R06A';expn='RCE_H2048x128_L79_R03_300'; fn=strcat(tpath,expn,'_',res,fext); load(fn);v2=v;
res='R12A';expn='RCE_H2048x128_L79_R03_300'; fn=strcat(tpath,expn,'_',res,fext); load(fn);v3=v;
res='R24A';expn='RCE_H2048x128_L79_R03_300'; fn=strcat(tpath,expn,'_',res,fext); load(fn);v4=v;
res='R48A';expn='RCE_H2048x128_L79_R03_300'; fn=strcat(tpath,expn,'_',res,fext); load(fn);v5=v;
C1='r-';  C2='g-';  C3='b-';  C4='k-';  C5='c-';
V1='r--'; V2='g--'; V3='b--'; V4='k--'; V5='c--';
W1='r:';  W2='g:';  W3='b:';  W4='k:';  W5='c:';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mf_cld_AVG_R03A'; xy=[-0.006 0.011 50 1000];
pms=[ 0, 0, 1200, 800]*1.2; fsize=24; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
s1='R03 (org)'; s2='R06A'; s3='R12A'; s4='R24A'; s5='R48A';
lw='LineWidth'; d1=1; d2=2; pf=v1.pf0;
x1=v1.mf_cup.AVG; x2=v2.mf_cup.AVG; x3=v3.mf_cup.AVG; 
x4=v4.mf_cup.AVG; x5=v5.mf_cup.AVG; 
y1=v1.mf_cdn.AVG; y2=v2.mf_cdn.AVG; y3=v3.mf_cdn.AVG; 
y4=v4.mf_cdn.AVG; y5=v5.mf_cdn.AVG; 
plot(x1+y1,pf,C1,lw,d2); hold on; plot(x2+y2,pf,C2,lw,d2); 
plot(x3+y3,pf,C3,lw,d2); plot(x4+y4,pf,C4,lw,d2); plot(x5+y5,pf,C5,lw,d2);
plot(x1,pf,V1,lw,d2); hold on; plot(x2,pf,V2,lw,d2); 
plot(x3,pf,V3,lw,d2); plot(x4,pf,V4,lw,d2); plot(x5,pf,V5,lw,d2);
plot(y1,pf,W1,lw,d2); hold on; plot(y2,pf,W2,lw,d2);
plot(y3,pf,W3,lw,d2); plot(y4,pf,W4,lw,d2); plot(y5,pf,W5,lw,d2);
set(gca,'yDir','reverse','FontSize',fsize); 
legend(s1,s2,s3,s4,s5,1); axis(xy); grid on;
xl='cloud vertical mass flux (kg/m2/s)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mf_cld_avg_R03A'; xy=[-0.25 0.8 50 1000];
pms=[ 0, 0, 1200, 800]*1.2; fsize=24; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
s1='R03 (org)'; s2='R06A'; s3='R12A'; s4='R24A'; s5='R48A';
lw='LineWidth'; d1=1; d2=2;
x1=v1.mf_cup.avg; x2=v2.mf_cup.avg; x3=v3.mf_cup.avg; x4=v4.mf_cup.avg; x5=v5.mf_cup.avg; 
y1=v1.mf_cdn.avg; y2=v2.mf_cdn.avg; y3=v3.mf_cdn.avg; y4=v4.mf_cdn.avg; y5=v5.mf_cdn.avg; 
z1=v1.mf_cld.avg; z2=v2.mf_cld.avg; z3=v3.mf_cld.avg; z4=v4.mf_cld.avg; z5=v5.mf_cld.avg; 
plot(z1,pf,C1,lw,d2); hold on;
plot(z2,pf,C2,lw,d2); plot(z3,pf,C3,lw,d2); plot(z4,pf,C4,lw,d2); plot(z5,pf,C5,lw,d2);
plot(x1,pf,V1,lw,d2);
plot(x2,pf,V2,lw,d2); plot(x3,pf,V3,lw,d2); plot(x4,pf,V4,lw,d2); plot(x5,pf,V5,lw,d2);
plot(y1,pf,W1,lw,d2); 
plot(y2,pf,W2,lw,d2); plot(y3,pf,W3,lw,d2); plot(y4,pf,W4,lw,d2); plot(y5,pf,W5,lw,d2);
set(gca,'yDir','reverse','FontSize',fsize); 
legend(s1,s2,s3,s4,s5,1); axis(xy); grid on;
xl='vertical mass flux averaged over cloud region (kg/m2/s)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mf_cup_fav_R03A'; xy=[0 0.3 50 1000];
pms=[ 0, 0, 1200, 800]*1.2; fsize=24; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
s1='R03 (org)'; s2='R06A'; s3='R12A'; s4='R24A'; s5='R48A';
lw='LineWidth'; d1=1; d2=2;
x1=v1.mf_cup.fav; x2=v2.mf_cup.fav; x3=v3.mf_cup.fav; x4=v4.mf_cup.fav; x5=v5.mf_cup.fav; 
y1=v1.mf_cdn.fav; y2=v2.mf_cdn.fav; y3=v3.mf_cdn.fav; y4=v4.mf_cdn.fav; y5=v5.mf_cdn.fav; 
%plot(x1+y1,pf,C1,lw,d2); hold on; plot(x2+y2,pf,C2,lw,d2); 
%plot(x3+y3,pf,C3,lw,d2); plot(x4+y4,pf,C4,lw,d2); plot(x5+y5,pf,C5,lw,d2);
plot(x1,pf,V1,lw,d2); hold on;
plot(x2,pf,V2,lw,d2); plot(x3,pf,V3,lw,d2); plot(x4,pf,V4,lw,d2); plot(x5,pf,V5,lw,d2);
plot(y1,pf,W1,lw,d2); 
plot(y2,pf,W2,lw,d2); plot(y3,pf,W3,lw,d2); plot(y4,pf,W4,lw,d2); plot(y5,pf,W5,lw,d2);
set(gca,'yDir','reverse','FontSize',fsize); 
legend(s1,s2,s3,s4,s5,1); axis(xy);
xl='fractional area of cloud updrafts and downdrafts'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wqt_cld_AVG_R03A'; xy=[-0.08 0.16 50 1000];
pms=[ 0, 0, 1200, 800]*1.2; fsize=24; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
s1='R03 (org)'; s2='R06A'; s3='R12A'; s4='R24A'; s5='R48A';
lw='LineWidth'; d1=1; d2=2; pf=v1.pf0; a=1000;
x1=v1.wqt_cup.AVG*a; x2=v2.wqt_cup.AVG*a; x3=v3.wqt_cup.AVG*a; x4=v4.wqt_cup.AVG*a; x5=v5.wqt_cup.AVG*a; 
y1=v1.wqt_cdn.AVG*a; y2=v2.wqt_cdn.AVG*a; y3=v3.wqt_cdn.AVG*a; y4=v4.wqt_cdn.AVG*a; y5=v5.wqt_cdn.AVG*a; 
z1=v1.wqt.AVG*a;     z2=v2.wqt.AVG*a;     z3=v3.wqt.AVG*a;     z4=v4.wqt.AVG*a;     z5=v5.wqt.AVG*a; 
plot(z1,pf,C1,lw,d2); hold on; 
plot(z2,pf,C2,lw,d2); plot(z3,pf,C3,lw,d2); plot(z4,pf,C4,lw,d2); plot(z5,pf,C5,lw,d2);
%plot(x1+y1,pf,C1,lw,d2); hold on; plot(x2+y2,pf,C2,lw,d2); 
%plot(x3+y3,pf,C3,lw,d2); plot(x4+y4,pf,C4,lw,d2); plot(x5+y5,pf,C5,lw,d2);
plot(x1,pf,V1,lw,d2); hold on; plot(x2,pf,V2,lw,d2); 
plot(x3,pf,V3,lw,d2); plot(x4,pf,V4,lw,d2); plot(x5,pf,V5,lw,d2);
plot(y1,pf,W1,lw,d2); hold on; plot(y2,pf,W2,lw,d2);
plot(y3,pf,W3,lw,d2); plot(y4,pf,W4,lw,d2); plot(y5,pf,W5,lw,d2);
set(gca,'yDir','reverse','FontSize',fsize); 
legend(s1,s2,s3,s4,s5,1); axis(xy); grid on;
xl='cloud vertical mass flux (kg/m2/s)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%







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
