%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/RCEMIP/'; 
t1=8; t2=12; zs=1; res='org'; qc_th=0.00001; do_uwc=1;
expn='rce_am4p0_300_100km_128x64'; v6=rceana_am4(tpath,expn,res,t1,t2,zs,qc_th,1);

expn='RCE_H0128x008_L79_R48_conv_295'; c6=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,1);
expn='RCE_H0128x008_L79_R48_conv_305'; w6=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,1);
expn='RCE_H0128x008_L79_R48_300'; v5=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H0128x008_L79_R48_295'; c5=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H0128x008_L79_R48_305'; w5=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H0256x016_L79_R24_300'; v4=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H0256x016_L79_R24_295'; c4=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H0256x016_L79_R24_305'; w4=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H0512x032_L79_R12_300'; v3=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H0512x032_L79_R12_295'; c3=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H0512x032_L79_R12_305'; w3=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H1024x064_L79_R06_300'; v2=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H1024x064_L79_R06_295'; c2=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H1024x064_L79_R06_305'; w2=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H2048x128_L79_R03_300'; v1=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H2048x128_L79_R03_295'; c1=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H2048x128_L79_R03_305'; w1=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H2048x128_L79_R01_300'; v0=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H2048x128_L79_R01_295'; c0=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H2048x128_L79_R01_305'; w0=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
%expn='RCE_H0128x128_L79_R03';     v1=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
%expn='RCE_H0128x128_L79_R03_295'; v2=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
%expn='RCE_H0128x128_L79_R03_305'; v3=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
%expn='RCE_H0128x128_L79_R01';     v1=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
%expn='RCE_H0128x128_L79_R01_295'; v2=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
%expn='RCE_H0128x128_L79_R01_305'; v3=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='RCE_H0128x008_L79_R48_conv_300'; v1=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H0128x008_L79_R48_conv_295'; v2=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H0128x008_L79_R48_conv_305'; v3=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H0256x016_L79_R24_conv_300'; v1=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H0256x016_L79_R24_conv_295'; v2=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H0256x016_L79_R24_conv_305'; v3=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H0512x032_L79_R12_conv_300'; v1=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H0512x032_L79_R12_conv_295'; v2=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
expn='RCE_H0512x032_L79_R12_conv_305'; v3=rceana_mon(tpath,expn,res,t1,t2,zs,qc_th,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath='/work/miz/mat_rce/'; res='org'; fext=strcat('_',res,'_mon_8_12.mat');
expn='RCE_H2048x128_L79_R01_300';      fn=strcat(tpath,expn,fext); load(fn);v0=v;
expn='RCE_H2048x128_L79_R01_295';      fn=strcat(tpath,expn,fext); load(fn);c0=v;
expn='RCE_H2048x128_L79_R01_305';      fn=strcat(tpath,expn,fext); load(fn);w0=v;
expn='RCE_H2048x128_L79_R03_300';      fn=strcat(tpath,expn,fext); load(fn);v1=v;
expn='RCE_H2048x128_L79_R03_295';      fn=strcat(tpath,expn,fext); load(fn);c1=v;
expn='RCE_H2048x128_L79_R03_305';      fn=strcat(tpath,expn,fext); load(fn);w1=v;
expn='RCE_H1024x064_L79_R06_300';      fn=strcat(tpath,expn,fext); load(fn);v2=v;
expn='RCE_H1024x064_L79_R06_295';      fn=strcat(tpath,expn,fext); load(fn);c2=v;
expn='RCE_H1024x064_L79_R06_305';      fn=strcat(tpath,expn,fext); load(fn);w2=v;
expn='RCE_H0512x032_L79_R12_300';      fn=strcat(tpath,expn,fext); load(fn);v3=v;
expn='RCE_H0512x032_L79_R12_295';      fn=strcat(tpath,expn,fext); load(fn);c3=v;
expn='RCE_H0512x032_L79_R12_305';      fn=strcat(tpath,expn,fext); load(fn);w3=v;
expn='RCE_H0256x016_L79_R24_300';      fn=strcat(tpath,expn,fext); load(fn);v4=v;
expn='RCE_H0256x016_L79_R24_295';      fn=strcat(tpath,expn,fext); load(fn);c4=v;
expn='RCE_H0256x016_L79_R24_305';      fn=strcat(tpath,expn,fext); load(fn);w4=v;
expn='RCE_H0128x008_L79_R48_300';      fn=strcat(tpath,expn,fext); load(fn);v5=v;
expn='RCE_H0128x008_L79_R48_295';      fn=strcat(tpath,expn,fext); load(fn);c5=v;
expn='RCE_H0128x008_L79_R48_305';      fn=strcat(tpath,expn,fext); load(fn);w5=v;
expn='RCE_H0128x008_L79_R48_conv_300'; fn=strcat(tpath,expn,fext); load(fn);v6=v;
expn='RCE_H0128x008_L79_R48_conv_295'; fn=strcat(tpath,expn,fext); load(fn);c6=v;
expn='RCE_H0128x008_L79_R48_conv_305'; fn=strcat(tpath,expn,fext); load(fn);w6=v;
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat');
tpath='/archive/Ming.Zhao/awg/warsaw/';
expn='c96L33_am4p0_2010climo';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v0=v;
expn='c96L33_am4p0_2010climo_p2K';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%Sensitivity of convection
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_avg'; xy=[0 8 -30 90]; opt=4;
a.v0=v0.toa.netrad.all.avg; a.c0=c0.toa.netrad.all.avg; a.w0=w0.toa.netrad.all.avg;
a.v1=v1.toa.netrad.all.avg; a.c1=c1.toa.netrad.all.avg; a.w1=w1.toa.netrad.all.avg;
a.v2=v2.toa.netrad.all.avg; a.c2=c2.toa.netrad.all.avg; a.w2=w2.toa.netrad.all.avg;
a.v3=v3.toa.netrad.all.avg; a.c3=c3.toa.netrad.all.avg; a.w3=w3.toa.netrad.all.avg;
a.v4=v4.toa.netrad.all.avg; a.c4=c4.toa.netrad.all.avg; a.w4=w4.toa.netrad.all.avg;
a.v5=v5.toa.netrad.all.avg; a.c5=c5.toa.netrad.all.avg; a.w5=w5.toa.netrad.all.avg;
a.v6=v6.toa.netrad.all.avg; a.c6=c6.toa.netrad.all.avg; a.w6=w6.toa.netrad.all.avg;
b.v0=v0.toa.netrad.all.std_ts; b.c0=c0.toa.netrad.all.std_ts; b.w0=w0.toa.netrad.all.std_ts; 
b.v1=v1.toa.netrad.all.std_ts; b.c1=c1.toa.netrad.all.std_ts; b.w1=w1.toa.netrad.all.std_ts; 
b.v2=v2.toa.netrad.all.std_ts; b.c2=c2.toa.netrad.all.std_ts; b.w2=w2.toa.netrad.all.std_ts; 
b.v3=v3.toa.netrad.all.std_ts; b.c3=c3.toa.netrad.all.std_ts; b.w3=w3.toa.netrad.all.std_ts; 
b.v4=v4.toa.netrad.all.std_ts; b.c4=c4.toa.netrad.all.std_ts; b.w4=w4.toa.netrad.all.std_ts; 
b.v5=v5.toa.netrad.all.std_ts; b.c5=c5.toa.netrad.all.std_ts; b.w5=w5.toa.netrad.all.std_ts; 
b.v6=v6.toa.netrad.all.std_ts; b.c6=c6.toa.netrad.all.std_ts; b.w6=w6.toa.netrad.all.std_ts; 
yl='TOA net radiative flux (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_clr_avg'; xy=[0 8 0 110]; opt=1;
a.v0=v0.toa.netrad_clr.all.avg; a.c0=c0.toa.netrad_clr.all.avg; a.w0=w0.toa.netrad_clr.all.avg; 
a.v1=v1.toa.netrad_clr.all.avg; a.c1=c1.toa.netrad_clr.all.avg; a.w1=w1.toa.netrad_clr.all.avg; 
a.v2=v2.toa.netrad_clr.all.avg; a.c2=c2.toa.netrad_clr.all.avg; a.w2=w2.toa.netrad_clr.all.avg; 
a.v3=v3.toa.netrad_clr.all.avg; a.c3=c3.toa.netrad_clr.all.avg; a.w3=w3.toa.netrad_clr.all.avg; 
a.v4=v4.toa.netrad_clr.all.avg; a.c4=c4.toa.netrad_clr.all.avg; a.w4=w4.toa.netrad_clr.all.avg; 
a.v5=v5.toa.netrad_clr.all.avg; a.c5=c5.toa.netrad_clr.all.avg; a.w5=w5.toa.netrad_clr.all.avg; 
a.v6=v6.toa.netrad_clr.all.avg; a.c6=c6.toa.netrad_clr.all.avg; a.w6=w6.toa.netrad_clr.all.avg; 
b.v0=v0.toa.netrad_clr.all.std_ts; b.c0=c0.toa.netrad_clr.all.std_ts; b.w0=w0.toa.netrad_clr.all.std_ts; 
b.v1=v1.toa.netrad_clr.all.std_ts; b.c1=c1.toa.netrad_clr.all.std_ts; b.w1=w1.toa.netrad_clr.all.std_ts; 
b.v2=v2.toa.netrad_clr.all.std_ts; b.c2=c2.toa.netrad_clr.all.std_ts; b.w2=w2.toa.netrad_clr.all.std_ts; 
b.v3=v3.toa.netrad_clr.all.std_ts; b.c3=c3.toa.netrad_clr.all.std_ts; b.w3=w3.toa.netrad_clr.all.std_ts; 
b.v4=v4.toa.netrad_clr.all.std_ts; b.c4=c4.toa.netrad_clr.all.std_ts; b.w4=w4.toa.netrad_clr.all.std_ts; 
b.v5=v5.toa.netrad_clr.all.std_ts; b.c5=c5.toa.netrad_clr.all.std_ts; b.w5=w5.toa.netrad_clr.all.std_ts; 
b.v6=v6.toa.netrad_clr.all.std_ts; b.c6=c6.toa.netrad_clr.all.std_ts; b.w6=w6.toa.netrad_clr.all.std_ts; 
yl='TOA clear-sky net radiative flux (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_clr_avg'; xy=[0 8 200 320]; opt=2;
a.v0=v0.toa.lwnet_clr.all.avg; a.c0=c0.toa.lwnet_clr.all.avg; a.w0=w0.toa.lwnet_clr.all.avg; 
a.v1=v1.toa.lwnet_clr.all.avg; a.c1=c1.toa.lwnet_clr.all.avg; a.w1=w1.toa.lwnet_clr.all.avg; 
a.v2=v2.toa.lwnet_clr.all.avg; a.c2=c2.toa.lwnet_clr.all.avg; a.w2=w2.toa.lwnet_clr.all.avg; 
a.v3=v3.toa.lwnet_clr.all.avg; a.c3=c3.toa.lwnet_clr.all.avg; a.w3=w3.toa.lwnet_clr.all.avg; 
a.v4=v4.toa.lwnet_clr.all.avg; a.c4=c4.toa.lwnet_clr.all.avg; a.w4=w4.toa.lwnet_clr.all.avg; 
a.v5=v5.toa.lwnet_clr.all.avg; a.c5=c5.toa.lwnet_clr.all.avg; a.w5=w5.toa.lwnet_clr.all.avg; 
a.v6=v6.toa.lwnet_clr.all.avg; a.c6=c6.toa.lwnet_clr.all.avg; a.w6=w6.toa.lwnet_clr.all.avg; 
b.v0=v0.toa.lwnet_clr.all.std_ts; b.c0=c0.toa.lwnet_clr.all.std_ts; b.w0=w0.toa.lwnet_clr.all.std_ts; 
b.v1=v1.toa.lwnet_clr.all.std_ts; b.c1=c1.toa.lwnet_clr.all.std_ts; b.w1=w1.toa.lwnet_clr.all.std_ts; 
b.v2=v2.toa.lwnet_clr.all.std_ts; b.c2=c2.toa.lwnet_clr.all.std_ts; b.w2=w2.toa.lwnet_clr.all.std_ts; 
b.v3=v3.toa.lwnet_clr.all.std_ts; b.c3=c3.toa.lwnet_clr.all.std_ts; b.w3=w3.toa.lwnet_clr.all.std_ts; 
b.v4=v4.toa.lwnet_clr.all.std_ts; b.c4=c4.toa.lwnet_clr.all.std_ts; b.w4=w4.toa.lwnet_clr.all.std_ts; 
b.v5=v5.toa.lwnet_clr.all.std_ts; b.c5=c5.toa.lwnet_clr.all.std_ts; b.w5=w5.toa.lwnet_clr.all.std_ts; 
b.v6=v6.toa.lwnet_clr.all.std_ts; b.c6=c6.toa.lwnet_clr.all.std_ts; b.w6=w6.toa.lwnet_clr.all.std_ts; 
yl='clear-sky outgoing LW radiation (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet_clr_avg'; xy=[0 8 360 380]; opt=1;
a.v0=v0.toa.swnet_clr.all.avg; a.c0=c0.toa.swnet_clr.all.avg; a.w0=w0.toa.swnet_clr.all.avg; 
a.v1=v1.toa.swnet_clr.all.avg; a.c1=c1.toa.swnet_clr.all.avg; a.w1=w1.toa.swnet_clr.all.avg; 
a.v2=v2.toa.swnet_clr.all.avg; a.c2=c2.toa.swnet_clr.all.avg; a.w2=w2.toa.swnet_clr.all.avg; 
a.v3=v3.toa.swnet_clr.all.avg; a.c3=c3.toa.swnet_clr.all.avg; a.w3=w3.toa.swnet_clr.all.avg; 
a.v4=v4.toa.swnet_clr.all.avg; a.c4=c4.toa.swnet_clr.all.avg; a.w4=w4.toa.swnet_clr.all.avg; 
a.v5=v5.toa.swnet_clr.all.avg; a.c5=c5.toa.swnet_clr.all.avg; a.w5=w5.toa.swnet_clr.all.avg; 
a.v6=v6.toa.swnet_clr.all.avg; a.c6=c6.toa.swnet_clr.all.avg; a.w6=w6.toa.swnet_clr.all.avg; 
b.v0=v0.toa.swnet_clr.all.std_ts; b.c0=c0.toa.swnet_clr.all.std_ts; b.w0=w0.toa.swnet_clr.all.std_ts; 
b.v1=v1.toa.swnet_clr.all.std_ts; b.c1=c1.toa.swnet_clr.all.std_ts; b.w1=w1.toa.swnet_clr.all.std_ts; 
b.v2=v2.toa.swnet_clr.all.std_ts; b.c2=c2.toa.swnet_clr.all.std_ts; b.w2=w2.toa.swnet_clr.all.std_ts; 
b.v3=v3.toa.swnet_clr.all.std_ts; b.c3=c3.toa.swnet_clr.all.std_ts; b.w3=w3.toa.swnet_clr.all.std_ts; 
b.v4=v4.toa.swnet_clr.all.std_ts; b.c4=c4.toa.swnet_clr.all.std_ts; b.w4=w4.toa.swnet_clr.all.std_ts; 
b.v5=v5.toa.swnet_clr.all.std_ts; b.c5=c5.toa.swnet_clr.all.std_ts; b.w5=w5.toa.swnet_clr.all.std_ts; 
b.v6=v6.toa.swnet_clr.all.std_ts; b.c6=c6.toa.swnet_clr.all.std_ts; b.w6=w6.toa.swnet_clr.all.std_ts; 
yl='clear-sky net incoming SW radiation (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcf_avg'; xy=[0 8 15 32]; opt=1;
a.v0=v0.toa.lwcf.all.avg; a.c0=c0.toa.lwcf.all.avg; a.w0=w0.toa.lwcf.all.avg; 
a.v1=v1.toa.lwcf.all.avg; a.c1=c1.toa.lwcf.all.avg; a.w1=w1.toa.lwcf.all.avg; 
a.v2=v2.toa.lwcf.all.avg; a.c2=c2.toa.lwcf.all.avg; a.w2=w2.toa.lwcf.all.avg; 
a.v3=v3.toa.lwcf.all.avg; a.c3=c3.toa.lwcf.all.avg; a.w3=w3.toa.lwcf.all.avg; 
a.v4=v4.toa.lwcf.all.avg; a.c4=c4.toa.lwcf.all.avg; a.w4=w4.toa.lwcf.all.avg; 
a.v5=v5.toa.lwcf.all.avg; a.c5=c5.toa.lwcf.all.avg; a.w5=w5.toa.lwcf.all.avg; 
a.v6=v6.toa.lwcf.all.avg; a.c6=c6.toa.lwcf.all.avg; a.w6=w6.toa.lwcf.all.avg; 
b.v0=v0.toa.lwcf.all.std_ts; b.c0=c0.toa.lwcf.all.std_ts; b.w0=w0.toa.lwcf.all.std_ts; 
b.v1=v1.toa.lwcf.all.std_ts; b.c1=c1.toa.lwcf.all.std_ts; b.w1=w1.toa.lwcf.all.std_ts; 
b.v2=v2.toa.lwcf.all.std_ts; b.c2=c2.toa.lwcf.all.std_ts; b.w2=w2.toa.lwcf.all.std_ts; 
b.v3=v3.toa.lwcf.all.std_ts; b.c3=c3.toa.lwcf.all.std_ts; b.w3=w3.toa.lwcf.all.std_ts; 
b.v4=v4.toa.lwcf.all.std_ts; b.c4=c4.toa.lwcf.all.std_ts; b.w4=w4.toa.lwcf.all.std_ts; 
b.v5=v5.toa.lwcf.all.std_ts; b.c5=c5.toa.lwcf.all.std_ts; b.w5=w5.toa.lwcf.all.std_ts; 
b.v6=v6.toa.lwcf.all.std_ts; b.c6=c6.toa.lwcf.all.std_ts; b.w6=w6.toa.lwcf.all.std_ts; 
yl='TOA LW CRE (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcf_dn_avg'; xy=[0 8 0 65]; opt=1;
a.v0=v0.toa.lwcf.dn.avg; a.c0=c0.toa.lwcf.dn.avg; a.w0=w0.toa.lwcf.dn.avg; 
a.v1=v1.toa.lwcf.dn.avg; a.c1=c1.toa.lwcf.dn.avg; a.w1=w1.toa.lwcf.dn.avg; 
a.v2=v2.toa.lwcf.dn.avg; a.c2=c2.toa.lwcf.dn.avg; a.w2=w2.toa.lwcf.dn.avg; 
a.v3=v3.toa.lwcf.dn.avg; a.c3=c3.toa.lwcf.dn.avg; a.w3=w3.toa.lwcf.dn.avg; 
a.v4=v4.toa.lwcf.dn.avg; a.c4=c4.toa.lwcf.dn.avg; a.w4=w4.toa.lwcf.dn.avg; 
a.v5=v5.toa.lwcf.dn.avg; a.c5=c5.toa.lwcf.dn.avg; a.w5=w5.toa.lwcf.dn.avg; 
a.v6=v6.toa.lwcf.dn.avg; a.c6=c6.toa.lwcf.dn.avg; a.w6=w6.toa.lwcf.dn.avg; 
b.v0=v0.toa.lwcf.dn.std_ts; b.c0=c0.toa.lwcf.dn.std_ts; b.w0=w0.toa.lwcf.dn.std_ts; 
b.v1=v1.toa.lwcf.dn.std_ts; b.c1=c1.toa.lwcf.dn.std_ts; b.w1=w1.toa.lwcf.dn.std_ts; 
b.v2=v2.toa.lwcf.dn.std_ts; b.c2=c2.toa.lwcf.dn.std_ts; b.w2=w2.toa.lwcf.dn.std_ts; 
b.v3=v3.toa.lwcf.dn.std_ts; b.c3=c3.toa.lwcf.dn.std_ts; b.w3=w3.toa.lwcf.dn.std_ts; 
b.v4=v4.toa.lwcf.dn.std_ts; b.c4=c4.toa.lwcf.dn.std_ts; b.w4=w4.toa.lwcf.dn.std_ts; 
b.v5=v5.toa.lwcf.dn.std_ts; b.c5=c5.toa.lwcf.dn.std_ts; b.w5=w5.toa.lwcf.dn.std_ts; 
b.v6=v6.toa.lwcf.dn.std_ts; b.c6=c6.toa.lwcf.dn.std_ts; b.w6=w6.toa.lwcf.dn.std_ts; 
yl='TOA LW CRE in large-scale subsidence region (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcf_up_avg'; xy=[0 8 0 65]; opt=1;
a.v0=v0.toa.lwcf.up.avg; a.c0=c0.toa.lwcf.up.avg; a.w0=w0.toa.lwcf.up.avg; 
a.v1=v1.toa.lwcf.up.avg; a.c1=c1.toa.lwcf.up.avg; a.w1=w1.toa.lwcf.up.avg; 
a.v2=v2.toa.lwcf.up.avg; a.c2=c2.toa.lwcf.up.avg; a.w2=w2.toa.lwcf.up.avg; 
a.v3=v3.toa.lwcf.up.avg; a.c3=c3.toa.lwcf.up.avg; a.w3=w3.toa.lwcf.up.avg; 
a.v4=v4.toa.lwcf.up.avg; a.c4=c4.toa.lwcf.up.avg; a.w4=w4.toa.lwcf.up.avg; 
a.v5=v5.toa.lwcf.up.avg; a.c5=c5.toa.lwcf.up.avg; a.w5=w5.toa.lwcf.up.avg; 
a.v6=v6.toa.lwcf.up.avg; a.c6=c6.toa.lwcf.up.avg; a.w6=w6.toa.lwcf.up.avg; 
b.v0=v0.toa.lwcf.up.std_ts; b.c0=c0.toa.lwcf.up.std_ts; b.w0=w0.toa.lwcf.up.std_ts; 
b.v1=v1.toa.lwcf.up.std_ts; b.c1=c1.toa.lwcf.up.std_ts; b.w1=w1.toa.lwcf.up.std_ts; 
b.v2=v2.toa.lwcf.up.std_ts; b.c2=c2.toa.lwcf.up.std_ts; b.w2=w2.toa.lwcf.up.std_ts; 
b.v3=v3.toa.lwcf.up.std_ts; b.c3=c3.toa.lwcf.up.std_ts; b.w3=w3.toa.lwcf.up.std_ts; 
b.v4=v4.toa.lwcf.up.std_ts; b.c4=c4.toa.lwcf.up.std_ts; b.w4=w4.toa.lwcf.up.std_ts; 
b.v5=v5.toa.lwcf.up.std_ts; b.c5=c5.toa.lwcf.up.std_ts; b.w5=w5.toa.lwcf.up.std_ts; 
b.v6=v6.toa.lwcf.up.std_ts; b.c6=c6.toa.lwcf.up.std_ts; b.w6=w6.toa.lwcf.up.std_ts; 
yl='TOA LW CRE in large-scale ascent region (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcf_up_fav'; xy=[0 8 0 1]; opt=1;
a.v0=v0.toa.lwcf.up.fav; a.c0=c0.toa.lwcf.up.fav; a.w0=w0.toa.lwcf.up.fav; 
a.v1=v1.toa.lwcf.up.fav; a.c1=c1.toa.lwcf.up.fav; a.w1=w1.toa.lwcf.up.fav; 
a.v2=v2.toa.lwcf.up.fav; a.c2=c2.toa.lwcf.up.fav; a.w2=w2.toa.lwcf.up.fav; 
a.v3=v3.toa.lwcf.up.fav; a.c3=c3.toa.lwcf.up.fav; a.w3=w3.toa.lwcf.up.fav; 
a.v4=v4.toa.lwcf.up.fav; a.c4=c4.toa.lwcf.up.fav; a.w4=w4.toa.lwcf.up.fav; 
a.v5=v5.toa.lwcf.up.fav; a.c5=c5.toa.lwcf.up.fav; a.w5=w5.toa.lwcf.up.fav; 
a.v6=v6.toa.lwcf.up.fav; a.c6=c6.toa.lwcf.up.fav; a.w6=w6.toa.lwcf.up.fav; 
b.v0=std(v0.toa.lwcf.up.ts_fa);
b.c0=std(c0.toa.lwcf.up.ts_fa);
b.w0=std(w0.toa.lwcf.up.ts_fa);
b.v1=std(v1.toa.lwcf.up.ts_fa);
b.c1=std(c1.toa.lwcf.up.ts_fa);
b.w1=std(w1.toa.lwcf.up.ts_fa);
b.v2=std(v2.toa.lwcf.up.ts_fa);
b.c2=std(c2.toa.lwcf.up.ts_fa);
b.w2=std(w2.toa.lwcf.up.ts_fa);
b.v3=std(v3.toa.lwcf.up.ts_fa);
b.c3=std(c3.toa.lwcf.up.ts_fa);
b.w3=std(w3.toa.lwcf.up.ts_fa);
b.v4=std(v4.toa.lwcf.up.ts_fa);
b.c4=std(c4.toa.lwcf.up.ts_fa);
b.w4=std(w4.toa.lwcf.up.ts_fa);
b.v5=std(v5.toa.lwcf.up.ts_fa);
b.c5=std(c5.toa.lwcf.up.ts_fa);
b.w5=std(w5.toa.lwcf.up.ts_fa);
b.v6=std(v6.toa.lwcf.up.ts_fa);
b.c6=std(c6.toa.lwcf.up.ts_fa);
b.w6=std(w6.toa.lwcf.up.ts_fa);
yl='fractional area of large-scale subsidence region (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcf_dn_fav'; xy=[0 8 0.6 1]; opt=1;
a.v0=v0.toa.lwcf.dn.fav; a.c0=c0.toa.lwcf.dn.fav; a.w0=w0.toa.lwcf.dn.fav; 
a.v1=v1.toa.lwcf.dn.fav; a.c1=c1.toa.lwcf.dn.fav; a.w1=w1.toa.lwcf.dn.fav; 
a.v2=v2.toa.lwcf.dn.fav; a.c2=c2.toa.lwcf.dn.fav; a.w2=w2.toa.lwcf.dn.fav; 
a.v3=v3.toa.lwcf.dn.fav; a.c3=c3.toa.lwcf.dn.fav; a.w3=w3.toa.lwcf.dn.fav; 
a.v4=v4.toa.lwcf.dn.fav; a.c4=c4.toa.lwcf.dn.fav; a.w4=w4.toa.lwcf.dn.fav; 
a.v5=v5.toa.lwcf.dn.fav; a.c5=c5.toa.lwcf.dn.fav; a.w5=w5.toa.lwcf.dn.fav; 
a.v6=v6.toa.lwcf.dn.fav; a.c6=c6.toa.lwcf.dn.fav; a.w6=w6.toa.lwcf.dn.fav; 
b.v0=std(v0.toa.lwcf.dn.ts_fa); b.c0=std(c0.toa.lwcf.dn.ts_fa); b.w0=std(w0.toa.lwcf.dn.ts_fa);
b.v1=std(v1.toa.lwcf.dn.ts_fa); b.c1=std(c1.toa.lwcf.dn.ts_fa); b.w1=std(w1.toa.lwcf.dn.ts_fa);
b.v2=std(v2.toa.lwcf.dn.ts_fa); b.c2=std(c2.toa.lwcf.dn.ts_fa); b.w2=std(w2.toa.lwcf.dn.ts_fa);
b.v3=std(v3.toa.lwcf.dn.ts_fa); b.c3=std(c3.toa.lwcf.dn.ts_fa); b.w3=std(w3.toa.lwcf.dn.ts_fa);
b.v4=std(v4.toa.lwcf.dn.ts_fa); b.c4=std(c4.toa.lwcf.dn.ts_fa); b.w4=std(w4.toa.lwcf.dn.ts_fa);
b.v5=std(v5.toa.lwcf.dn.ts_fa); b.c5=std(c5.toa.lwcf.dn.ts_fa); b.w5=std(w5.toa.lwcf.dn.ts_fa);
b.v6=std(v6.toa.lwcf.dn.ts_fa); b.c6=std(c6.toa.lwcf.dn.ts_fa); b.w6=std(w6.toa.lwcf.dn.ts_fa);
yl='fractional area of large-scale subsidence region (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcf_dn_AVG1'; xy=[0 8 0 32]; opt=1;
a.v0=v0.toa.lwcf.dn.AVG; a.c0=c0.toa.lwcf.dn.AVG; a.w0=w0.toa.lwcf.dn.AVG; 
a.v1=v1.toa.lwcf.dn.AVG; a.c1=c1.toa.lwcf.dn.AVG; a.w1=w1.toa.lwcf.dn.AVG; 
a.v2=v2.toa.lwcf.dn.AVG; a.c2=c2.toa.lwcf.dn.AVG; a.w2=w2.toa.lwcf.dn.AVG; 
a.v3=v3.toa.lwcf.dn.AVG; a.c3=c3.toa.lwcf.dn.AVG; a.w3=w3.toa.lwcf.dn.AVG; 
a.v4=v4.toa.lwcf.dn.AVG; a.c4=c4.toa.lwcf.dn.AVG; a.w4=w4.toa.lwcf.dn.AVG; 
a.v5=v5.toa.lwcf.dn.AVG; a.c5=c5.toa.lwcf.dn.AVG; a.w5=w5.toa.lwcf.dn.AVG; 
a.v6=v6.toa.lwcf.dn.AVG; a.c6=c6.toa.lwcf.dn.AVG; a.w6=w6.toa.lwcf.dn.AVG; 
b.v0=std(v0.toa.lwcf.dn.ts_fa.*v0.toa.lwcf.dn.ts);
b.c0=std(c0.toa.lwcf.dn.ts_fa.*c0.toa.lwcf.dn.ts);
b.w0=std(w0.toa.lwcf.dn.ts_fa.*w0.toa.lwcf.dn.ts);
b.v1=std(v1.toa.lwcf.dn.ts_fa.*v1.toa.lwcf.dn.ts);
b.c1=std(c1.toa.lwcf.dn.ts_fa.*c1.toa.lwcf.dn.ts);
b.w1=std(w1.toa.lwcf.dn.ts_fa.*w1.toa.lwcf.dn.ts);
b.v2=std(v2.toa.lwcf.dn.ts_fa.*v2.toa.lwcf.dn.ts);
b.c2=std(c2.toa.lwcf.dn.ts_fa.*c2.toa.lwcf.dn.ts);
b.w2=std(w2.toa.lwcf.dn.ts_fa.*w2.toa.lwcf.dn.ts);
b.v3=std(v3.toa.lwcf.dn.ts_fa.*v3.toa.lwcf.dn.ts);
b.c3=std(c3.toa.lwcf.dn.ts_fa.*c3.toa.lwcf.dn.ts);
b.w3=std(w3.toa.lwcf.dn.ts_fa.*w3.toa.lwcf.dn.ts);
b.v4=std(v4.toa.lwcf.dn.ts_fa.*v4.toa.lwcf.dn.ts);
b.c4=std(c4.toa.lwcf.dn.ts_fa.*c4.toa.lwcf.dn.ts);
b.w4=std(w4.toa.lwcf.dn.ts_fa.*w4.toa.lwcf.dn.ts);
b.v5=std(v5.toa.lwcf.dn.ts_fa.*v5.toa.lwcf.dn.ts);
b.c5=std(c5.toa.lwcf.dn.ts_fa.*c5.toa.lwcf.dn.ts);
b.w5=std(w5.toa.lwcf.dn.ts_fa.*w5.toa.lwcf.dn.ts);
b.v6=std(v6.toa.lwcf.dn.ts_fa.*v6.toa.lwcf.dn.ts);
b.c6=std(c6.toa.lwcf.dn.ts_fa.*c6.toa.lwcf.dn.ts);
b.w6=std(w6.toa.lwcf.dn.ts_fa.*w6.toa.lwcf.dn.ts);
yl='TOA LW CRE in large-scale subsidence region (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcf_up_AVG1'; xy=[0 8 0 32]; opt=1;
a.v0=v0.toa.lwcf.up.AVG; a.c0=c0.toa.lwcf.up.AVG; a.w0=w0.toa.lwcf.up.AVG; 
a.v1=v1.toa.lwcf.up.AVG; a.c1=c1.toa.lwcf.up.AVG; a.w1=w1.toa.lwcf.up.AVG; 
a.v2=v2.toa.lwcf.up.AVG; a.c2=c2.toa.lwcf.up.AVG; a.w2=w2.toa.lwcf.up.AVG; 
a.v3=v3.toa.lwcf.up.AVG; a.c3=c3.toa.lwcf.up.AVG; a.w3=w3.toa.lwcf.up.AVG; 
a.v4=v4.toa.lwcf.up.AVG; a.c4=c4.toa.lwcf.up.AVG; a.w4=w4.toa.lwcf.up.AVG; 
a.v5=v5.toa.lwcf.up.AVG; a.c5=c5.toa.lwcf.up.AVG; a.w5=w5.toa.lwcf.up.AVG; 
a.v6=v6.toa.lwcf.up.AVG; a.c6=c6.toa.lwcf.up.AVG; a.w6=w6.toa.lwcf.up.AVG; 
b.v0=std(v0.toa.lwcf.up.ts_fa.*v0.toa.lwcf.up.ts);
b.c0=std(c0.toa.lwcf.up.ts_fa.*c0.toa.lwcf.up.ts);
b.w0=std(w0.toa.lwcf.up.ts_fa.*w0.toa.lwcf.up.ts);
b.v1=std(v1.toa.lwcf.up.ts_fa.*v1.toa.lwcf.up.ts);
b.c1=std(c1.toa.lwcf.up.ts_fa.*c1.toa.lwcf.up.ts);
b.w1=std(w1.toa.lwcf.up.ts_fa.*w1.toa.lwcf.up.ts);
b.v2=std(v2.toa.lwcf.up.ts_fa.*v2.toa.lwcf.up.ts);
b.c2=std(c2.toa.lwcf.up.ts_fa.*c2.toa.lwcf.up.ts);
b.w2=std(w2.toa.lwcf.up.ts_fa.*w2.toa.lwcf.up.ts);
b.v3=std(v3.toa.lwcf.up.ts_fa.*v3.toa.lwcf.up.ts);
b.c3=std(c3.toa.lwcf.up.ts_fa.*c3.toa.lwcf.up.ts);
b.w3=std(w3.toa.lwcf.up.ts_fa.*w3.toa.lwcf.up.ts);
b.v4=std(v4.toa.lwcf.up.ts_fa.*v4.toa.lwcf.up.ts);
b.c4=std(c4.toa.lwcf.up.ts_fa.*c4.toa.lwcf.up.ts);
b.w4=std(w4.toa.lwcf.up.ts_fa.*w4.toa.lwcf.up.ts);
b.v5=std(v5.toa.lwcf.up.ts_fa.*v5.toa.lwcf.up.ts);
b.c5=std(c5.toa.lwcf.up.ts_fa.*c5.toa.lwcf.up.ts);
b.w5=std(w5.toa.lwcf.up.ts_fa.*w5.toa.lwcf.up.ts);
b.v6=std(v6.toa.lwcf.up.ts_fa.*v6.toa.lwcf.up.ts);
b.c6=std(c6.toa.lwcf.up.ts_fa.*c6.toa.lwcf.up.ts);
b.w6=std(w6.toa.lwcf.up.ts_fa.*w6.toa.lwcf.up.ts);
yl='TOA LW CRE in large-scale ascent region (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcf_avg'; xy=[0 8 -120 0]; opt=4;
a.v0=v0.toa.swcf.all.avg; a.c0=c0.toa.swcf.all.avg; a.w0=w0.toa.swcf.all.avg; 
a.v1=v1.toa.swcf.all.avg; a.c1=c1.toa.swcf.all.avg; a.w1=w1.toa.swcf.all.avg; 
a.v2=v2.toa.swcf.all.avg; a.c2=c2.toa.swcf.all.avg; a.w2=w2.toa.swcf.all.avg; 
a.v3=v3.toa.swcf.all.avg; a.c3=c3.toa.swcf.all.avg; a.w3=w3.toa.swcf.all.avg; 
a.v4=v4.toa.swcf.all.avg; a.c4=c4.toa.swcf.all.avg; a.w4=w4.toa.swcf.all.avg; 
a.v5=v5.toa.swcf.all.avg; a.c5=c5.toa.swcf.all.avg; a.w5=w5.toa.swcf.all.avg; 
a.v6=v6.toa.swcf.all.avg; a.c6=c6.toa.swcf.all.avg; a.w6=w6.toa.swcf.all.avg; 
b.v0=v0.toa.swcf.all.std_ts; b.c0=c0.toa.swcf.all.std_ts; b.w0=w0.toa.swcf.all.std_ts; 
b.v1=v1.toa.swcf.all.std_ts; b.c1=c1.toa.swcf.all.std_ts; b.w1=w1.toa.swcf.all.std_ts; 
b.v2=v2.toa.swcf.all.std_ts; b.c2=c2.toa.swcf.all.std_ts; b.w2=w2.toa.swcf.all.std_ts; 
b.v3=v3.toa.swcf.all.std_ts; b.c3=c3.toa.swcf.all.std_ts; b.w3=w3.toa.swcf.all.std_ts; 
b.v4=v4.toa.swcf.all.std_ts; b.c4=c4.toa.swcf.all.std_ts; b.w4=w4.toa.swcf.all.std_ts; 
b.v5=v5.toa.swcf.all.std_ts; b.c5=c5.toa.swcf.all.std_ts; b.w5=w5.toa.swcf.all.std_ts; 
b.v6=v6.toa.swcf.all.std_ts; b.c6=c6.toa.swcf.all.std_ts; b.w6=w6.toa.swcf.all.std_ts; 
yl='TOA SW CRE (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcf_up_avg'; xy=[0 8 -250 0]; opt=4;
a.v0=v0.toa.swcf.up.avg; a.c0=c0.toa.swcf.up.avg; a.w0=w0.toa.swcf.up.avg; 
a.v1=v1.toa.swcf.up.avg; a.c1=c1.toa.swcf.up.avg; a.w1=w1.toa.swcf.up.avg; 
a.v2=v2.toa.swcf.up.avg; a.c2=c2.toa.swcf.up.avg; a.w2=w2.toa.swcf.up.avg; 
a.v3=v3.toa.swcf.up.avg; a.c3=c3.toa.swcf.up.avg; a.w3=w3.toa.swcf.up.avg; 
a.v4=v4.toa.swcf.up.avg; a.c4=c4.toa.swcf.up.avg; a.w4=w4.toa.swcf.up.avg; 
a.v5=v5.toa.swcf.up.avg; a.c5=c5.toa.swcf.up.avg; a.w5=w5.toa.swcf.up.avg; 
a.v6=v6.toa.swcf.up.avg; a.c6=c6.toa.swcf.up.avg; a.w6=w6.toa.swcf.up.avg; 
b.v0=v0.toa.swcf.up.std_ts; b.c0=c0.toa.swcf.up.std_ts; b.w0=w0.toa.swcf.up.std_ts; 
b.v1=v1.toa.swcf.up.std_ts; b.c1=c1.toa.swcf.up.std_ts; b.w1=w1.toa.swcf.up.std_ts; 
b.v2=v2.toa.swcf.up.std_ts; b.c2=c2.toa.swcf.up.std_ts; b.w2=w2.toa.swcf.up.std_ts; 
b.v3=v3.toa.swcf.up.std_ts; b.c3=c3.toa.swcf.up.std_ts; b.w3=w3.toa.swcf.up.std_ts; 
b.v4=v4.toa.swcf.up.std_ts; b.c4=c4.toa.swcf.up.std_ts; b.w4=w4.toa.swcf.up.std_ts; 
b.v5=v5.toa.swcf.up.std_ts; b.c5=c5.toa.swcf.up.std_ts; b.w5=w5.toa.swcf.up.std_ts; 
b.v6=v6.toa.swcf.up.std_ts; b.c6=c6.toa.swcf.up.std_ts; b.w6=w6.toa.swcf.up.std_ts; 
yl='TOA SW CRE in large-scale ascent region (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcf_dn_avg'; xy=[0 8 -125 0]; opt=4;
a.v0=v0.toa.swcf.dn.avg; a.c0=c0.toa.swcf.dn.avg; a.w0=w0.toa.swcf.dn.avg; 
a.v1=v1.toa.swcf.dn.avg; a.c1=c1.toa.swcf.dn.avg; a.w1=w1.toa.swcf.dn.avg; 
a.v2=v2.toa.swcf.dn.avg; a.c2=c2.toa.swcf.dn.avg; a.w2=w2.toa.swcf.dn.avg; 
a.v3=v3.toa.swcf.dn.avg; a.c3=c3.toa.swcf.dn.avg; a.w3=w3.toa.swcf.dn.avg; 
a.v4=v4.toa.swcf.dn.avg; a.c4=c4.toa.swcf.dn.avg; a.w4=w4.toa.swcf.dn.avg; 
a.v5=v5.toa.swcf.dn.avg; a.c5=c5.toa.swcf.dn.avg; a.w5=w5.toa.swcf.dn.avg; 
a.v6=v6.toa.swcf.dn.avg; a.c6=c6.toa.swcf.dn.avg; a.w6=w6.toa.swcf.dn.avg; 
b.v0=v0.toa.swcf.dn.std_ts; b.c0=c0.toa.swcf.dn.std_ts; b.w0=w0.toa.swcf.dn.std_ts; 
b.v1=v1.toa.swcf.dn.std_ts; b.c1=c1.toa.swcf.dn.std_ts; b.w1=w1.toa.swcf.dn.std_ts; 
b.v2=v2.toa.swcf.dn.std_ts; b.c2=c2.toa.swcf.dn.std_ts; b.w2=w2.toa.swcf.dn.std_ts; 
b.v3=v3.toa.swcf.dn.std_ts; b.c3=c3.toa.swcf.dn.std_ts; b.w3=w3.toa.swcf.dn.std_ts; 
b.v4=v4.toa.swcf.dn.std_ts; b.c4=c4.toa.swcf.dn.std_ts; b.w4=w4.toa.swcf.dn.std_ts; 
b.v5=v5.toa.swcf.dn.std_ts; b.c5=c5.toa.swcf.dn.std_ts; b.w5=w5.toa.swcf.dn.std_ts; 
b.v6=v6.toa.swcf.dn.std_ts; b.c6=c6.toa.swcf.dn.std_ts; b.w6=w6.toa.swcf.dn.std_ts; 
yl='TOA SW CRE in large-scale subsidence region (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qal_avg'; xy=[0 8 0 70]; opt=2;
a.v0=v0.qal.all.avg; a.c0=c0.qal.all.avg; a.w0=w0.qal.all.avg; 
a.v1=v1.qal.all.avg; a.c1=c1.qal.all.avg; a.w1=w1.qal.all.avg; 
a.v2=v2.qal.all.avg; a.c2=c2.qal.all.avg; a.w2=w2.qal.all.avg; 
a.v3=v3.qal.all.avg; a.c3=c3.qal.all.avg; a.w3=w3.qal.all.avg; 
a.v4=v4.qal.all.avg; a.c4=c4.qal.all.avg; a.w4=w4.qal.all.avg; 
a.v5=v5.qal.all.avg; a.c5=c5.qal.all.avg; a.w5=w5.qal.all.avg; 
a.v6=v6.qal.all.avg; a.c6=c6.qal.all.avg; a.w6=w6.qal.all.avg; 
b.v0=v0.qal.all.std_ts; b.c0=c0.qal.all.std_ts; b.w0=w0.qal.all.std_ts; 
b.v1=v1.qal.all.std_ts; b.c1=c1.qal.all.std_ts; b.w1=w1.qal.all.std_ts; 
b.v2=v2.qal.all.std_ts; b.c2=c2.qal.all.std_ts; b.w2=w2.qal.all.std_ts; 
b.v3=v3.qal.all.std_ts; b.c3=c3.qal.all.std_ts; b.w3=w3.qal.all.std_ts; 
b.v4=v4.qal.all.std_ts; b.c4=c4.qal.all.std_ts; b.w4=w4.qal.all.std_ts; 
b.v5=v5.qal.all.std_ts; b.c5=c5.qal.all.std_ts; b.w5=w5.qal.all.std_ts; 
b.v6=v6.qal.all.std_ts; b.c6=c6.qal.all.std_ts; b.w6=w6.qal.all.std_ts; 
yl='low cloud amount (%)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qal_up_avg'; xy=[0 8 0 100]; opt=2;
a.v0=v0.qal.up.avg; a.c0=c0.qal.up.avg; a.w0=w0.qal.up.avg; 
a.v1=v1.qal.up.avg; a.c1=c1.qal.up.avg; a.w1=w1.qal.up.avg; 
a.v2=v2.qal.up.avg; a.c2=c2.qal.up.avg; a.w2=w2.qal.up.avg; 
a.v3=v3.qal.up.avg; a.c3=c3.qal.up.avg; a.w3=w3.qal.up.avg; 
a.v4=v4.qal.up.avg; a.c4=c4.qal.up.avg; a.w4=w4.qal.up.avg; 
a.v5=v5.qal.up.avg; a.c5=c5.qal.up.avg; a.w5=w5.qal.up.avg; 
a.v6=v6.qal.up.avg; a.c6=c6.qal.up.avg; a.w6=w6.qal.up.avg; 
b.v0=v0.qal.up.std_ts; b.c0=c0.qal.up.std_ts; b.w0=w0.qal.up.std_ts; 
b.v1=v1.qal.up.std_ts; b.c1=c1.qal.up.std_ts; b.w1=w1.qal.up.std_ts; 
b.v2=v2.qal.up.std_ts; b.c2=c2.qal.up.std_ts; b.w2=w2.qal.up.std_ts; 
b.v3=v3.qal.up.std_ts; b.c3=c3.qal.up.std_ts; b.w3=w3.qal.up.std_ts; 
b.v4=v4.qal.up.std_ts; b.c4=c4.qal.up.std_ts; b.w4=w4.qal.up.std_ts; 
b.v5=v5.qal.up.std_ts; b.c5=c5.qal.up.std_ts; b.w5=w5.qal.up.std_ts; 
b.v6=v6.qal.up.std_ts; b.c6=c6.qal.up.std_ts; b.w6=w6.qal.up.std_ts; 
yl='low cloud amount in large-scale ascent region(%)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qal_dn_avg'; xy=[0 8 0 70]; opt=2;
a.v0=v0.qal.dn.avg; a.c0=c0.qal.dn.avg; a.w0=w0.qal.dn.avg; 
a.v1=v1.qal.dn.avg; a.c1=c1.qal.dn.avg; a.w1=w1.qal.dn.avg; 
a.v2=v2.qal.dn.avg; a.c2=c2.qal.dn.avg; a.w2=w2.qal.dn.avg; 
a.v3=v3.qal.dn.avg; a.c3=c3.qal.dn.avg; a.w3=w3.qal.dn.avg; 
a.v4=v4.qal.dn.avg; a.c4=c4.qal.dn.avg; a.w4=w4.qal.dn.avg; 
a.v5=v5.qal.dn.avg; a.c5=c5.qal.dn.avg; a.w5=w5.qal.dn.avg; 
a.v6=v6.qal.dn.avg; a.c6=c6.qal.dn.avg; a.w6=w6.qal.dn.avg; 
b.v0=v0.qal.dn.std_ts; b.c0=c0.qal.dn.std_ts; b.w0=w0.qal.dn.std_ts; 
b.v1=v1.qal.dn.std_ts; b.c1=c1.qal.dn.std_ts; b.w1=w1.qal.dn.std_ts; 
b.v2=v2.qal.dn.std_ts; b.c2=c2.qal.dn.std_ts; b.w2=w2.qal.dn.std_ts; 
b.v3=v3.qal.dn.std_ts; b.c3=c3.qal.dn.std_ts; b.w3=w3.qal.dn.std_ts; 
b.v4=v4.qal.dn.std_ts; b.c4=c4.qal.dn.std_ts; b.w4=w4.qal.dn.std_ts; 
b.v5=v5.qal.dn.std_ts; b.c5=c5.qal.dn.std_ts; b.w5=w5.qal.dn.std_ts; 
b.v6=v6.qal.dn.std_ts; b.c6=c6.qal.dn.std_ts; b.w6=w6.qal.dn.std_ts; 
yl='low cloud amount in large-scale subsidence region(%)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fav_dn_org_500'; xy=[0 8 0 1]; opt=1;
a.v0=v0.qal.dn.fav; a.c0=c0.qal.dn.fav; a.w0=w0.qal.dn.fav; 
a.v1=v1.qal.dn.fav; a.c1=c1.qal.dn.fav; a.w1=w1.qal.dn.fav; 
a.v2=v2.qal.dn.fav; a.c2=c2.qal.dn.fav; a.w2=w2.qal.dn.fav; 
a.v3=v3.qal.dn.fav; a.c3=c3.qal.dn.fav; a.w3=w3.qal.dn.fav; 
a.v4=v4.qal.dn.fav; a.c4=c4.qal.dn.fav; a.w4=w4.qal.dn.fav; 
a.v5=v5.qal.dn.fav; a.c5=c5.qal.dn.fav; a.w5=w5.qal.dn.fav; 
a.v6=v6.qal.dn.fav; a.c6=c6.qal.dn.fav; a.w6=w6.qal.dn.fav; 
b.v0=std(v0.qal.dn.ts_fa); b.c0=std(c0.qal.dn.ts_fa); b.w0=std(w0.qal.dn.ts_fa);
b.v1=std(v1.qal.dn.ts_fa); b.c1=std(c1.qal.dn.ts_fa); b.w1=std(w1.qal.dn.ts_fa);
b.v2=std(v2.qal.dn.ts_fa); b.c2=std(c2.qal.dn.ts_fa); b.w2=std(w2.qal.dn.ts_fa);
b.v3=std(v3.qal.dn.ts_fa); b.c3=std(c3.qal.dn.ts_fa); b.w3=std(w3.qal.dn.ts_fa);
b.v4=std(v4.qal.dn.ts_fa); b.c4=std(c4.qal.dn.ts_fa); b.w4=std(w4.qal.dn.ts_fa);
b.v5=std(v5.qal.dn.ts_fa); b.c5=std(c5.qal.dn.ts_fa); b.w5=std(w5.qal.dn.ts_fa);
b.v6=std(v6.qal.dn.ts_fa); b.c6=std(c6.qal.dn.ts_fa); b.w6=std(w6.qal.dn.ts_fa);
yl='fractional area of large-scale subsidence'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fav_up_org_500'; xy=[0 8 0 0.5]; opt=2;
a.v0=v0.qal.up.fav; a.c0=c0.qal.up.fav; a.w0=w0.qal.up.fav; 
a.v1=v1.qal.up.fav; a.c1=c1.qal.up.fav; a.w1=w1.qal.up.fav; 
a.v2=v2.qal.up.fav; a.c2=c2.qal.up.fav; a.w2=w2.qal.up.fav; 
a.v3=v3.qal.up.fav; a.c3=c3.qal.up.fav; a.w3=w3.qal.up.fav; 
a.v4=v4.qal.up.fav; a.c4=c4.qal.up.fav; a.w4=w4.qal.up.fav; 
a.v5=v5.qal.up.fav; a.c5=c5.qal.up.fav; a.w5=w5.qal.up.fav; 
a.v6=v6.qal.up.fav; a.c6=c6.qal.up.fav; a.w6=w6.qal.up.fav; 
b.v0=std(v0.qal.up.ts_fa); b.c0=std(c0.qal.up.ts_fa); b.w0=std(w0.qal.up.ts_fa);
b.v1=std(v1.qal.up.ts_fa); b.c1=std(c1.qal.up.ts_fa); b.w1=std(w1.qal.up.ts_fa);
b.v2=std(v2.qal.up.ts_fa); b.c2=std(c2.qal.up.ts_fa); b.w2=std(w2.qal.up.ts_fa);
b.v3=std(v3.qal.up.ts_fa); b.c3=std(c3.qal.up.ts_fa); b.w3=std(w3.qal.up.ts_fa);
b.v4=std(v4.qal.up.ts_fa); b.c4=std(c4.qal.up.ts_fa); b.w4=std(w4.qal.up.ts_fa);
b.v5=std(v5.qal.up.ts_fa); b.c5=std(c5.qal.up.ts_fa); b.w5=std(w5.qal.up.ts_fa);
b.v6=std(v6.qal.up.ts_fa); b.c6=std(c6.qal.up.ts_fa); b.w6=std(w6.qal.up.ts_fa);
yl='fractional area of large-scale ascent'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fav_dn_r96_w500'; xy=[0 8 0 1]; opt=1;
a.v0=v0.wa500_r96.dn.fav; a.c0=c0.wa500_r96.dn.fav; a.w0=w0.wa500_r96.dn.fav;
a.v1=v1.wa500_r96.dn.fav; a.c1=c1.wa500_r96.dn.fav; a.w1=w1.wa500_r96.dn.fav;
a.v2=v2.wa500_r96.dn.fav; a.c2=c2.wa500_r96.dn.fav; a.w2=w2.wa500_r96.dn.fav;
a.v3=v3.wa500_r96.dn.fav; a.c3=c3.wa500_r96.dn.fav; a.w3=w3.wa500_r96.dn.fav;
a.v4=v4.wa500_r96.dn.fav; a.c4=c4.wa500_r96.dn.fav; a.w4=w4.wa500_r96.dn.fav;
a.v5=v5.wa500_r96.dn.fav; a.c5=c5.wa500_r96.dn.fav; a.w5=w5.wa500_r96.dn.fav;
a.v6=v6.wa500_r96.dn.fav; a.c6=c6.wa500_r96.dn.fav; a.w6=w6.wa500_r96.dn.fav;
b.v0=std(v0.wa500_r96.dn.ts_fa); b.c0=std(c0.wa500_r96.dn.ts_fa); b.w0=std(w0.wa500_r96.dn.ts_fa);
b.v1=std(v1.wa500_r96.dn.ts_fa); b.c1=std(c1.wa500_r96.dn.ts_fa); b.w1=std(w1.wa500_r96.dn.ts_fa);
b.v2=std(v2.wa500_r96.dn.ts_fa); b.c2=std(c2.wa500_r96.dn.ts_fa); b.w2=std(w2.wa500_r96.dn.ts_fa);
b.v3=std(v3.wa500_r96.dn.ts_fa); b.c3=std(c3.wa500_r96.dn.ts_fa); b.w3=std(w3.wa500_r96.dn.ts_fa);
b.v4=std(v4.wa500_r96.dn.ts_fa); b.c4=std(c4.wa500_r96.dn.ts_fa); b.w4=std(w4.wa500_r96.dn.ts_fa);
b.v5=std(v5.wa500_r96.dn.ts_fa); b.c5=std(c5.wa500_r96.dn.ts_fa); b.w5=std(w5.wa500_r96.dn.ts_fa);
b.v6=std(v6.wa500_r96.dn.ts_fa); b.c6=std(c6.wa500_r96.dn.ts_fa); b.w6=std(w6.wa500_r96.dn.ts_fa);
yl='fractional area of large-scale subsidence'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fav_up_r96_w500'; xy=[0 8 0 0.5]; opt=2;
a.v0=v0.wa500_r96.up.fav; a.c0=c0.wa500_r96.up.fav; a.w0=w0.wa500_r96.up.fav;
a.v1=v1.wa500_r96.up.fav; a.c1=c1.wa500_r96.up.fav; a.w1=w1.wa500_r96.up.fav;
a.v2=v2.wa500_r96.up.fav; a.c2=c2.wa500_r96.up.fav; a.w2=w2.wa500_r96.up.fav;
a.v3=v3.wa500_r96.up.fav; a.c3=c3.wa500_r96.up.fav; a.w3=w3.wa500_r96.up.fav;
a.v4=v4.wa500_r96.up.fav; a.c4=c4.wa500_r96.up.fav; a.w4=w4.wa500_r96.up.fav;
a.v5=v5.wa500_r96.up.fav; a.c5=c5.wa500_r96.up.fav; a.w5=w5.wa500_r96.up.fav;
a.v6=v6.wa500_r96.up.fav; a.c6=c6.wa500_r96.up.fav; a.w6=w6.wa500_r96.up.fav;
b.v0=std(v0.wa500_r96.up.ts_fa); b.c0=std(c0.wa500_r96.up.ts_fa); b.w0=std(w0.wa500_r96.up.ts_fa);
b.v1=std(v1.wa500_r96.up.ts_fa); b.c1=std(c1.wa500_r96.up.ts_fa); b.w1=std(w1.wa500_r96.up.ts_fa);
b.v2=std(v2.wa500_r96.up.ts_fa); b.c2=std(c2.wa500_r96.up.ts_fa); b.w2=std(w2.wa500_r96.up.ts_fa);
b.v3=std(v3.wa500_r96.up.ts_fa); b.c3=std(c3.wa500_r96.up.ts_fa); b.w3=std(w3.wa500_r96.up.ts_fa);
b.v4=std(v4.wa500_r96.up.ts_fa); b.c4=std(c4.wa500_r96.up.ts_fa); b.w4=std(w4.wa500_r96.up.ts_fa);
b.v5=std(v5.wa500_r96.up.ts_fa); b.c5=std(c5.wa500_r96.up.ts_fa); b.w5=std(w5.wa500_r96.up.ts_fa);
b.v6=std(v6.wa500_r96.up.ts_fa); b.c6=std(c6.wa500_r96.up.ts_fa); b.w6=std(w6.wa500_r96.up.ts_fa);
yl='fractional area of large-scale ascent'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ttcf_avg'; xy=[0 8 -100 0]; opt=4;
a.v0=v0.toa.ttcf.all.avg; a.c0=c0.toa.ttcf.all.avg; a.w0=w0.toa.ttcf.all.avg; 
a.v1=v1.toa.ttcf.all.avg; a.c1=c1.toa.ttcf.all.avg; a.w1=w1.toa.ttcf.all.avg; 
a.v2=v2.toa.ttcf.all.avg; a.c2=c2.toa.ttcf.all.avg; a.w2=w2.toa.ttcf.all.avg; 
a.v3=v3.toa.ttcf.all.avg; a.c3=c3.toa.ttcf.all.avg; a.w3=w3.toa.ttcf.all.avg; 
a.v4=v4.toa.ttcf.all.avg; a.c4=c4.toa.ttcf.all.avg; a.w4=w4.toa.ttcf.all.avg; 
a.v5=v5.toa.ttcf.all.avg; a.c5=c5.toa.ttcf.all.avg; a.w5=w5.toa.ttcf.all.avg; 
a.v6=v6.toa.ttcf.all.avg; a.c6=c6.toa.ttcf.all.avg; a.w6=w6.toa.ttcf.all.avg; 
b.v0=v0.toa.ttcf.all.std_ts; b.c0=c0.toa.ttcf.all.std_ts; b.w0=w0.toa.ttcf.all.std_ts; 
b.v1=v1.toa.ttcf.all.std_ts; b.c1=c1.toa.ttcf.all.std_ts; b.w1=w1.toa.ttcf.all.std_ts; 
b.v2=v2.toa.ttcf.all.std_ts; b.c2=c2.toa.ttcf.all.std_ts; b.w2=w2.toa.ttcf.all.std_ts; 
b.v3=v3.toa.ttcf.all.std_ts; b.c3=c3.toa.ttcf.all.std_ts; b.w3=w3.toa.ttcf.all.std_ts; 
b.v4=v4.toa.ttcf.all.std_ts; b.c4=c4.toa.ttcf.all.std_ts; b.w4=w4.toa.ttcf.all.std_ts; 
b.v5=v5.toa.ttcf.all.std_ts; b.c5=c5.toa.ttcf.all.std_ts; b.w5=w5.toa.ttcf.all.std_ts; 
b.v6=v6.toa.ttcf.all.std_ts; b.c6=c6.toa.ttcf.all.std_ts; b.w6=w6.toa.ttcf.all.std_ts; 
yl='TOA total CRE (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prec_avg'; xy=[0 8 50 150]; opt=1;
a.v0=v0.sfc.pcp.all.avg; a.c0=c0.sfc.pcp.all.avg; a.w0=w0.sfc.pcp.all.avg; 
a.v1=v1.sfc.pcp.all.avg; a.c1=c1.sfc.pcp.all.avg; a.w1=w1.sfc.pcp.all.avg; 
a.v2=v2.sfc.pcp.all.avg; a.c2=c2.sfc.pcp.all.avg; a.w2=w2.sfc.pcp.all.avg; 
a.v3=v3.sfc.pcp.all.avg; a.c3=c3.sfc.pcp.all.avg; a.w3=w3.sfc.pcp.all.avg; 
a.v4=v4.sfc.pcp.all.avg; a.c4=c4.sfc.pcp.all.avg; a.w4=w4.sfc.pcp.all.avg; 
a.v5=v5.sfc.pcp.all.avg; a.c5=c5.sfc.pcp.all.avg; a.w5=w5.sfc.pcp.all.avg; 
a.v6=v6.sfc.pcp.all.avg; a.c6=c6.sfc.pcp.all.avg; a.w6=w6.sfc.pcp.all.avg; 
b.v0=v0.sfc.pcp.all.std_ts; b.c0=c0.sfc.pcp.all.std_ts; b.w0=w0.sfc.pcp.all.std_ts; 
b.v1=v1.sfc.pcp.all.std_ts; b.c1=c1.sfc.pcp.all.std_ts; b.w1=w1.sfc.pcp.all.std_ts; 
b.v2=v2.sfc.pcp.all.std_ts; b.c2=c2.sfc.pcp.all.std_ts; b.w2=w2.sfc.pcp.all.std_ts; 
b.v3=v3.sfc.pcp.all.std_ts; b.c3=c3.sfc.pcp.all.std_ts; b.w3=w3.sfc.pcp.all.std_ts; 
b.v4=v4.sfc.pcp.all.std_ts; b.c4=c4.sfc.pcp.all.std_ts; b.w4=w4.sfc.pcp.all.std_ts; 
b.v5=v5.sfc.pcp.all.std_ts; b.c5=c5.sfc.pcp.all.std_ts; b.w5=w5.sfc.pcp.all.std_ts; 
b.v6=v6.sfc.pcp.all.std_ts; b.c6=c6.sfc.pcp.all.std_ts; b.w6=w6.sfc.pcp.all.std_ts; 
yl='total surface precipitation (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='emp_avg'; xy=[0 9 -5 5];
a.v0=v0.sfc.emp.all.avg; a.c0=c0.sfc.emp.all.avg; a.w0=w0.sfc.emp.all.avg; 
a.v1=v1.sfc.emp.all.avg; a.c1=c1.sfc.emp.all.avg; a.w1=w1.sfc.emp.all.avg; 
a.v2=v2.sfc.emp.all.avg; a.c2=c2.sfc.emp.all.avg; a.w2=w2.sfc.emp.all.avg; 
a.v3=v3.sfc.emp.all.avg; a.c3=c3.sfc.emp.all.avg; a.w3=w3.sfc.emp.all.avg; 
a.v4=v4.sfc.emp.all.avg; a.c4=c4.sfc.emp.all.avg; a.w4=w4.sfc.emp.all.avg; 
a.v5=v5.sfc.emp.all.avg; a.c5=c5.sfc.emp.all.avg; a.w5=w5.sfc.emp.all.avg; 
a.v6=v6.sfc.emp.all.avg; a.c6=c6.sfc.emp.all.avg; a.w6=w6.sfc.emp.all.avg; 
b.v0=v0.sfc.emp.all.std_ts; b.c0=c0.sfc.emp.all.std_ts; b.w0=w0.sfc.emp.all.std_ts; 
b.v1=v1.sfc.emp.all.std_ts; b.c1=c1.sfc.emp.all.std_ts; b.w1=w1.sfc.emp.all.std_ts; 
b.v2=v2.sfc.emp.all.std_ts; b.c2=c2.sfc.emp.all.std_ts; b.w2=w2.sfc.emp.all.std_ts; 
b.v3=v3.sfc.emp.all.std_ts; b.c3=c3.sfc.emp.all.std_ts; b.w3=w3.sfc.emp.all.std_ts; 
b.v4=v4.sfc.emp.all.std_ts; b.c4=c4.sfc.emp.all.std_ts; b.w4=w4.sfc.emp.all.std_ts; 
b.v5=v5.sfc.emp.all.std_ts; b.c5=c5.sfc.emp.all.std_ts; b.w5=w5.sfc.emp.all.std_ts; 
b.v6=v5.sfc.emp.all.std_ts; b.c6=c5.sfc.emp.all.std_ts; b.w6=w6.sfc.emp.all.std_ts; 
yl='evaporation minus precipitation (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradatm_avg'; xy=[0 8 50 150]; opt=1
a.v0=v0.atm.netrad.all.avg; a.c0=c0.atm.netrad.all.avg; a.w0=w0.atm.netrad.all.avg; 
a.v1=v1.atm.netrad.all.avg; a.c1=c1.atm.netrad.all.avg; a.w1=w1.atm.netrad.all.avg; 
a.v2=v2.atm.netrad.all.avg; a.c2=c2.atm.netrad.all.avg; a.w2=w2.atm.netrad.all.avg; 
a.v3=v3.atm.netrad.all.avg; a.c3=c3.atm.netrad.all.avg; a.w3=w3.atm.netrad.all.avg; 
a.v4=v4.atm.netrad.all.avg; a.c4=c4.atm.netrad.all.avg; a.w4=w4.atm.netrad.all.avg; 
a.v5=v5.atm.netrad.all.avg; a.c5=c5.atm.netrad.all.avg; a.w5=w5.atm.netrad.all.avg; 
a.v6=v6.atm.netrad.all.avg; a.c6=c6.atm.netrad.all.avg; a.w6=w6.atm.netrad.all.avg; 
b.v0=v0.atm.netrad.all.std_ts; b.c0=c0.atm.netrad.all.std_ts; b.w0=w0.atm.netrad.all.std_ts; 
b.v1=v1.atm.netrad.all.std_ts; b.c1=c1.atm.netrad.all.std_ts; b.w1=w1.atm.netrad.all.std_ts; 
b.v2=v2.atm.netrad.all.std_ts; b.c2=c2.atm.netrad.all.std_ts; b.w2=w2.atm.netrad.all.std_ts; 
b.v3=v3.atm.netrad.all.std_ts; b.c3=c3.atm.netrad.all.std_ts; b.w3=w3.atm.netrad.all.std_ts; 
b.v4=v4.atm.netrad.all.std_ts; b.c4=c4.atm.netrad.all.std_ts; b.w4=w4.atm.netrad.all.std_ts; 
b.v5=v5.atm.netrad.all.std_ts; b.c5=c5.atm.netrad.all.std_ts; b.w5=w5.atm.netrad.all.std_ts; 
b.v6=v6.atm.netrad.all.std_ts; b.c6=c6.atm.netrad.all.std_ts; b.w6=w6.atm.netrad.all.std_ts; 
yl='net atmospheric radiative cooling rate (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='shflx_avg'; xy=[0 8 6 15]; opt=1;
a.v0=v0.sfc.shflx.all.avg; a.c0=c0.sfc.shflx.all.avg; a.w0=w0.sfc.shflx.all.avg; 
a.v1=v1.sfc.shflx.all.avg; a.c1=c1.sfc.shflx.all.avg; a.w1=w1.sfc.shflx.all.avg; 
a.v2=v2.sfc.shflx.all.avg; a.c2=c2.sfc.shflx.all.avg; a.w2=w2.sfc.shflx.all.avg; 
a.v3=v3.sfc.shflx.all.avg; a.c3=c3.sfc.shflx.all.avg; a.w3=w3.sfc.shflx.all.avg; 
a.v4=v4.sfc.shflx.all.avg; a.c4=c4.sfc.shflx.all.avg; a.w4=w4.sfc.shflx.all.avg; 
a.v5=v5.sfc.shflx.all.avg; a.c5=c5.sfc.shflx.all.avg; a.w5=w5.sfc.shflx.all.avg; 
a.v6=v6.sfc.shflx.all.avg; a.c6=c6.sfc.shflx.all.avg; a.w6=w6.sfc.shflx.all.avg; 
b.v0=v0.sfc.shflx.all.std_ts; b.c0=c0.sfc.shflx.all.std_ts; b.w0=w0.sfc.shflx.all.std_ts; 
b.v1=v1.sfc.shflx.all.std_ts; b.c1=c1.sfc.shflx.all.std_ts; b.w1=w1.sfc.shflx.all.std_ts; 
b.v2=v2.sfc.shflx.all.std_ts; b.c2=c2.sfc.shflx.all.std_ts; b.w2=w2.sfc.shflx.all.std_ts; 
b.v3=v3.sfc.shflx.all.std_ts; b.c3=c3.sfc.shflx.all.std_ts; b.w3=w3.sfc.shflx.all.std_ts; 
b.v4=v4.sfc.shflx.all.std_ts; b.c4=c4.sfc.shflx.all.std_ts; b.w4=w4.sfc.shflx.all.std_ts; 
b.v5=v5.sfc.shflx.all.std_ts; b.c5=c5.sfc.shflx.all.std_ts; b.w5=w5.sfc.shflx.all.std_ts; 
b.v6=v6.sfc.shflx.all.std_ts; b.c6=c6.sfc.shflx.all.std_ts; b.w6=w6.sfc.shflx.all.std_ts; 
yl='surface sensible heat flux (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_avg'; xy=[0 8 0 3]; opt=2;
a.v0=300-v0.sfc.tref.all.avg; a.c0=295-c0.sfc.tref.all.avg; a.w0=305-w0.sfc.tref.all.avg; 
a.v1=300-v1.sfc.tref.all.avg; a.c1=295-c1.sfc.tref.all.avg; a.w1=305-w1.sfc.tref.all.avg; 
a.v2=300-v2.sfc.tref.all.avg; a.c2=295-c2.sfc.tref.all.avg; a.w2=305-w2.sfc.tref.all.avg; 
a.v3=300-v3.sfc.tref.all.avg; a.c3=295-c3.sfc.tref.all.avg; a.w3=305-w3.sfc.tref.all.avg; 
a.v4=300-v4.sfc.tref.all.avg; a.c4=295-c4.sfc.tref.all.avg; a.w4=305-w4.sfc.tref.all.avg; 
a.v5=300-v5.sfc.tref.all.avg; a.c5=295-c5.sfc.tref.all.avg; a.w5=305-w5.sfc.tref.all.avg; 
a.v6=300-v6.sfc.tref.all.avg; a.c6=295-c6.sfc.tref.all.avg; a.w6=305-w6.sfc.tref.all.avg; 
b.v0=v0.sfc.tref.all.std_ts; b.c0=c0.sfc.tref.all.std_ts; b.w0=w0.sfc.tref.all.std_ts; 
b.v1=v1.sfc.tref.all.std_ts; b.c1=c1.sfc.tref.all.std_ts; b.w1=w1.sfc.tref.all.std_ts; 
b.v2=v2.sfc.tref.all.std_ts; b.c2=c2.sfc.tref.all.std_ts; b.w2=w2.sfc.tref.all.std_ts; 
b.v3=v3.sfc.tref.all.std_ts; b.c3=c3.sfc.tref.all.std_ts; b.w3=w3.sfc.tref.all.std_ts; 
b.v4=v4.sfc.tref.all.std_ts; b.c4=c4.sfc.tref.all.std_ts; b.w4=w4.sfc.tref.all.std_ts; 
b.v5=v5.sfc.tref.all.std_ts; b.c5=c5.sfc.tref.all.std_ts; b.w5=w5.sfc.tref.all.std_ts; 
b.v6=v6.sfc.tref.all.std_ts; b.c6=c6.sfc.tref.all.std_ts; b.w6=w6.sfc.tref.all.std_ts; 
yl='T_{2m} minus SST (K)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_up_avg'; xy=[0 8 0 3]; opt=2;
a.v0=300-v0.sfc.tref.up.avg; a.c0=295-c0.sfc.tref.up.avg; a.w0=305-w0.sfc.tref.up.avg; 
a.v1=300-v1.sfc.tref.up.avg; a.c1=295-c1.sfc.tref.up.avg; a.w1=305-w1.sfc.tref.up.avg; 
a.v2=300-v2.sfc.tref.up.avg; a.c2=295-c2.sfc.tref.up.avg; a.w2=305-w2.sfc.tref.up.avg; 
a.v3=300-v3.sfc.tref.up.avg; a.c3=295-c3.sfc.tref.up.avg; a.w3=305-w3.sfc.tref.up.avg; 
a.v4=300-v4.sfc.tref.up.avg; a.c4=295-c4.sfc.tref.up.avg; a.w4=305-w4.sfc.tref.up.avg; 
a.v5=300-v5.sfc.tref.up.avg; a.c5=295-c5.sfc.tref.up.avg; a.w5=305-w5.sfc.tref.up.avg; 
a.v6=300-v6.sfc.tref.up.avg; a.c6=295-c6.sfc.tref.up.avg; a.w6=305-w6.sfc.tref.up.avg; 
b.v0=v0.sfc.tref.up.std_ts; b.c0=c0.sfc.tref.up.std_ts; b.w0=w0.sfc.tref.up.std_ts; 
b.v1=v1.sfc.tref.up.std_ts; b.c1=c1.sfc.tref.up.std_ts; b.w1=w1.sfc.tref.up.std_ts; 
b.v2=v2.sfc.tref.up.std_ts; b.c2=c2.sfc.tref.up.std_ts; b.w2=w2.sfc.tref.up.std_ts; 
b.v3=v3.sfc.tref.up.std_ts; b.c3=c3.sfc.tref.up.std_ts; b.w3=w3.sfc.tref.up.std_ts; 
b.v4=v4.sfc.tref.up.std_ts; b.c4=c4.sfc.tref.up.std_ts; b.w4=w4.sfc.tref.up.std_ts; 
b.v5=v5.sfc.tref.up.std_ts; b.c5=c5.sfc.tref.up.std_ts; b.w5=w5.sfc.tref.up.std_ts; 
b.v6=v6.sfc.tref.up.std_ts; b.c6=c6.sfc.tref.up.std_ts; b.w6=w6.sfc.tref.up.std_ts; 
yl='T_{2m} minus SST over large-scale ascent region (K)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_dn_avg'; xy=[0 8 0 3]; opt=2;
a.v0=300-v0.sfc.tref.dn.avg; a.c0=295-c0.sfc.tref.dn.avg; a.w0=305-w0.sfc.tref.dn.avg; 
a.v1=300-v1.sfc.tref.dn.avg; a.c1=295-c1.sfc.tref.dn.avg; a.w1=305-w1.sfc.tref.dn.avg; 
a.v2=300-v2.sfc.tref.dn.avg; a.c2=295-c2.sfc.tref.dn.avg; a.w2=305-w2.sfc.tref.dn.avg; 
a.v3=300-v3.sfc.tref.dn.avg; a.c3=295-c3.sfc.tref.dn.avg; a.w3=305-w3.sfc.tref.dn.avg; 
a.v4=300-v4.sfc.tref.dn.avg; a.c4=295-c4.sfc.tref.dn.avg; a.w4=305-w4.sfc.tref.dn.avg; 
a.v5=300-v5.sfc.tref.dn.avg; a.c5=295-c5.sfc.tref.dn.avg; a.w5=305-w5.sfc.tref.dn.avg; 
a.v6=300-v6.sfc.tref.dn.avg; a.c6=295-c6.sfc.tref.dn.avg; a.w6=305-w6.sfc.tref.dn.avg; 
b.v0=v0.sfc.tref.dn.std_ts; b.c0=c0.sfc.tref.dn.std_ts; b.w0=w0.sfc.tref.dn.std_ts; 
b.v1=v1.sfc.tref.dn.std_ts; b.c1=c1.sfc.tref.dn.std_ts; b.w1=w1.sfc.tref.dn.std_ts; 
b.v2=v2.sfc.tref.dn.std_ts; b.c2=c2.sfc.tref.dn.std_ts; b.w2=w2.sfc.tref.dn.std_ts; 
b.v3=v3.sfc.tref.dn.std_ts; b.c3=c3.sfc.tref.dn.std_ts; b.w3=w3.sfc.tref.dn.std_ts; 
b.v4=v4.sfc.tref.dn.std_ts; b.c4=c4.sfc.tref.dn.std_ts; b.w4=w4.sfc.tref.dn.std_ts; 
b.v5=v5.sfc.tref.dn.std_ts; b.c5=c5.sfc.tref.dn.std_ts; b.w5=w5.sfc.tref.dn.std_ts; 
b.v6=v6.sfc.tref.dn.std_ts; b.c6=c6.sfc.tref.dn.std_ts; b.w6=w6.sfc.tref.dn.std_ts; 
yl='T_{2m} minus SST over large-scale subsidence region (K)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='evap_avg'; xy=[0 8 50 150]; opt=1;
a.v0=v0.sfc.evp.all.avg; a.c0=c0.sfc.evp.all.avg; a.w0=w0.sfc.evp.all.avg; 
a.v1=v1.sfc.evp.all.avg; a.c1=c1.sfc.evp.all.avg; a.w1=w1.sfc.evp.all.avg; 
a.v2=v2.sfc.evp.all.avg; a.c2=c2.sfc.evp.all.avg; a.w2=w2.sfc.evp.all.avg; 
a.v3=v3.sfc.evp.all.avg; a.c3=c3.sfc.evp.all.avg; a.w3=w3.sfc.evp.all.avg; 
a.v4=v4.sfc.evp.all.avg; a.c4=c4.sfc.evp.all.avg; a.w4=w4.sfc.evp.all.avg; 
a.v5=v5.sfc.evp.all.avg; a.c5=c5.sfc.evp.all.avg; a.w5=w5.sfc.evp.all.avg; 
a.v6=v6.sfc.evp.all.avg; a.c6=c6.sfc.evp.all.avg; a.w6=w6.sfc.evp.all.avg; 
b.v0=v0.sfc.evp.all.std_ts; b.c0=c0.sfc.evp.all.std_ts; b.w0=w0.sfc.evp.all.std_ts; 
b.v1=v1.sfc.evp.all.std_ts; b.c1=c1.sfc.evp.all.std_ts; b.w1=w1.sfc.evp.all.std_ts; 
b.v2=v2.sfc.evp.all.std_ts; b.c2=c2.sfc.evp.all.std_ts; b.w2=w2.sfc.evp.all.std_ts; 
b.v3=v3.sfc.evp.all.std_ts; b.c3=c3.sfc.evp.all.std_ts; b.w3=w3.sfc.evp.all.std_ts; 
b.v4=v4.sfc.evp.all.std_ts; b.c4=c4.sfc.evp.all.std_ts; b.w4=w4.sfc.evp.all.std_ts; 
b.v5=v5.sfc.evp.all.std_ts; b.c5=c5.sfc.evp.all.std_ts; b.w5=w5.sfc.evp.all.std_ts; 
b.v6=v6.sfc.evp.all.std_ts; b.c6=c6.sfc.evp.all.std_ts; b.w6=w6.sfc.evp.all.std_ts; 
yl='surface latent heat flux (W/m2)'; plotbar;
visfig='off'; figpath='./fig_rce/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rhref_avg'; xy=[0 8 0 100]; opt=2;
a.v0=v0.sfc.rhref.all.avg; a.c0=c0.sfc.rhref.all.avg; a.w0=w0.sfc.rhref.all.avg; 
a.v1=v1.sfc.rhref.all.avg; a.c1=c1.sfc.rhref.all.avg; a.w1=w1.sfc.rhref.all.avg; 
a.v2=v2.sfc.rhref.all.avg; a.c2=c2.sfc.rhref.all.avg; a.w2=w2.sfc.rhref.all.avg; 
a.v3=v3.sfc.rhref.all.avg; a.c3=c3.sfc.rhref.all.avg; a.w3=w3.sfc.rhref.all.avg; 
a.v4=v4.sfc.rhref.all.avg; a.c4=c4.sfc.rhref.all.avg; a.w4=w4.sfc.rhref.all.avg; 
a.v5=v5.sfc.rhref.all.avg; a.c5=c5.sfc.rhref.all.avg; a.w5=w5.sfc.rhref.all.avg; 
a.v6=v6.sfc.rhref.all.avg; a.c6=c6.sfc.rhref.all.avg; a.w6=w6.sfc.rhref.all.avg; 
b.v0=v0.sfc.rhref.all.std_ts; b.c0=c0.sfc.rhref.all.std_ts; b.w0=w0.sfc.rhref.all.std_ts; 
b.v1=v1.sfc.rhref.all.std_ts; b.c1=c1.sfc.rhref.all.std_ts; b.w1=w1.sfc.rhref.all.std_ts; 
b.v2=v2.sfc.rhref.all.std_ts; b.c2=c2.sfc.rhref.all.std_ts; b.w2=w2.sfc.rhref.all.std_ts; 
b.v3=v3.sfc.rhref.all.std_ts; b.c3=c3.sfc.rhref.all.std_ts; b.w3=w3.sfc.rhref.all.std_ts; 
b.v4=v4.sfc.rhref.all.std_ts; b.c4=c4.sfc.rhref.all.std_ts; b.w4=w4.sfc.rhref.all.std_ts; 
b.v5=v5.sfc.rhref.all.std_ts; b.c5=c5.sfc.rhref.all.std_ts; b.w5=w5.sfc.rhref.all.std_ts; 
b.v6=v6.sfc.rhref.all.std_ts; b.c6=c6.sfc.rhref.all.std_ts; b.w6=w6.sfc.rhref.all.std_ts; 
yl='2 meter RH (%)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rhref_up_avg'; xy=[0 8 0 105]; opt=2;
a.v0=v0.sfc.rhref.up.avg; a.c0=c0.sfc.rhref.up.avg; a.w0=w0.sfc.rhref.up.avg; 
a.v1=v1.sfc.rhref.up.avg; a.c1=c1.sfc.rhref.up.avg; a.w1=w1.sfc.rhref.up.avg; 
a.v2=v2.sfc.rhref.up.avg; a.c2=c2.sfc.rhref.up.avg; a.w2=w2.sfc.rhref.up.avg; 
a.v3=v3.sfc.rhref.up.avg; a.c3=c3.sfc.rhref.up.avg; a.w3=w3.sfc.rhref.up.avg; 
a.v4=v4.sfc.rhref.up.avg; a.c4=c4.sfc.rhref.up.avg; a.w4=w4.sfc.rhref.up.avg; 
a.v5=v5.sfc.rhref.up.avg; a.c5=c5.sfc.rhref.up.avg; a.w5=w5.sfc.rhref.up.avg; 
a.v6=v6.sfc.rhref.up.avg; a.c6=c6.sfc.rhref.up.avg; a.w6=w6.sfc.rhref.up.avg; 
b.v0=v0.sfc.rhref.up.std_ts; b.c0=c0.sfc.rhref.up.std_ts; b.w0=w0.sfc.rhref.up.std_ts; 
b.v1=v1.sfc.rhref.up.std_ts; b.c1=c1.sfc.rhref.up.std_ts; b.w1=w1.sfc.rhref.up.std_ts; 
b.v2=v2.sfc.rhref.up.std_ts; b.c2=c2.sfc.rhref.up.std_ts; b.w2=w2.sfc.rhref.up.std_ts; 
b.v3=v3.sfc.rhref.up.std_ts; b.c3=c3.sfc.rhref.up.std_ts; b.w3=w3.sfc.rhref.up.std_ts; 
b.v4=v4.sfc.rhref.up.std_ts; b.c4=c4.sfc.rhref.up.std_ts; b.w4=w4.sfc.rhref.up.std_ts; 
b.v5=v5.sfc.rhref.up.std_ts; b.c5=c5.sfc.rhref.up.std_ts; b.w5=w5.sfc.rhref.up.std_ts; 
b.v6=v6.sfc.rhref.up.std_ts; b.c6=c6.sfc.rhref.up.std_ts; b.w6=w6.sfc.rhref.up.std_ts; 
yl='2 meter RH over large-scale ascent region (%)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rhref_dn_avg'; xy=[0 8 0 105]; opt=2;
a.v0=v0.sfc.rhref.dn.avg; a.c0=c0.sfc.rhref.dn.avg; a.w0=w0.sfc.rhref.dn.avg; 
a.v1=v1.sfc.rhref.dn.avg; a.c1=c1.sfc.rhref.dn.avg; a.w1=w1.sfc.rhref.dn.avg; 
a.v2=v2.sfc.rhref.dn.avg; a.c2=c2.sfc.rhref.dn.avg; a.w2=w2.sfc.rhref.dn.avg; 
a.v3=v3.sfc.rhref.dn.avg; a.c3=c3.sfc.rhref.dn.avg; a.w3=w3.sfc.rhref.dn.avg; 
a.v4=v4.sfc.rhref.dn.avg; a.c4=c4.sfc.rhref.dn.avg; a.w4=w4.sfc.rhref.dn.avg; 
a.v5=v5.sfc.rhref.dn.avg; a.c5=c5.sfc.rhref.dn.avg; a.w5=w5.sfc.rhref.dn.avg; 
a.v6=v6.sfc.rhref.dn.avg; a.c6=c6.sfc.rhref.dn.avg; a.w6=w6.sfc.rhref.dn.avg; 
b.v0=v0.sfc.rhref.dn.std_ts; b.c0=c0.sfc.rhref.dn.std_ts; b.w0=w0.sfc.rhref.dn.std_ts; 
b.v1=v1.sfc.rhref.dn.std_ts; b.c1=c1.sfc.rhref.dn.std_ts; b.w1=w1.sfc.rhref.dn.std_ts; 
b.v2=v2.sfc.rhref.dn.std_ts; b.c2=c2.sfc.rhref.dn.std_ts; b.w2=w2.sfc.rhref.dn.std_ts; 
b.v3=v3.sfc.rhref.dn.std_ts; b.c3=c3.sfc.rhref.dn.std_ts; b.w3=w3.sfc.rhref.dn.std_ts; 
b.v4=v4.sfc.rhref.dn.std_ts; b.c4=c4.sfc.rhref.dn.std_ts; b.w4=w4.sfc.rhref.dn.std_ts; 
b.v5=v5.sfc.rhref.dn.std_ts; b.c5=c5.sfc.rhref.dn.std_ts; b.w5=w5.sfc.rhref.dn.std_ts; 
b.v6=v6.sfc.rhref.dn.std_ts; b.c6=c6.sfc.rhref.dn.std_ts; b.w6=w6.sfc.rhref.dn.std_ts; 
yl='2 meter RH over large-scale subsidence region (%)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netengatm_avg'; pf=v2.pf; ph=v2.ph; xy=[0 8 -5 5];
a.v0=v0.atm.neteng.all.avg; a.c0=c0.atm.neteng.all.avg; a.w0=w0.atm.neteng.all.avg; 
a.v1=v1.atm.neteng.all.avg; a.c1=c1.atm.neteng.all.avg; a.w1=w1.atm.neteng.all.avg; 
a.v2=v2.atm.neteng.all.avg; a.c2=c2.atm.neteng.all.avg; a.w2=w2.atm.neteng.all.avg; 
a.v3=v3.atm.neteng.all.avg; a.c3=c3.atm.neteng.all.avg; a.w3=w3.atm.neteng.all.avg; 
a.v4=v4.atm.neteng.all.avg; a.c4=c4.atm.neteng.all.avg; a.w4=w4.atm.neteng.all.avg; 
a.v5=v5.atm.neteng.all.avg; a.c5=c5.atm.neteng.all.avg; a.w5=w5.atm.neteng.all.avg; 
a.v6=v6.atm.neteng.all.avg; a.c6=c6.atm.neteng.all.avg; a.w6=w6.atm.neteng.all.avg; 
b.v0=v0.atm.neteng.all.std_ts; b.c0=c0.atm.neteng.all.std_ts; b.w0=w0.atm.neteng.all.std_ts; 
b.v1=v1.atm.neteng.all.std_ts; b.c1=c1.atm.neteng.all.std_ts; b.w1=w1.atm.neteng.all.std_ts; 
b.v2=v2.atm.neteng.all.std_ts; b.c2=c2.atm.neteng.all.std_ts; b.w2=w2.atm.neteng.all.std_ts; 
b.v3=v3.atm.neteng.all.std_ts; b.c3=c3.atm.neteng.all.std_ts; b.w3=w3.atm.neteng.all.std_ts; 
b.v4=v4.atm.neteng.all.std_ts; b.c4=c4.atm.neteng.all.std_ts; b.w4=w4.atm.neteng.all.std_ts; 
b.v5=v5.atm.neteng.all.std_ts; b.c5=c5.atm.neteng.all.std_ts; b.w5=w5.atm.neteng.all.std_ts; 
b.v6=v6.atm.neteng.all.std_ts; b.c6=c6.atm.neteng.all.std_ts; b.w6=w6.atm.neteng.all.std_ts; 
yl='net energy into atmosphere (W/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwp_avg'; xy=[0 8 0 150]; opt=1; c=1000;
% $$$ a.v0=v0.lwp.all.avg*c; a.c0=c0.lwp.all.avg*c; a.w0=w0.lwp.all.avg*c; 
% $$$ a.v1=v1.lwp.all.avg*c; a.c1=c1.lwp.all.avg*c; a.w1=w1.lwp.all.avg*c; 
% $$$ a.v2=v2.lwp.all.avg*c; a.c2=c2.lwp.all.avg*c; a.w2=w2.lwp.all.avg*c; 
% $$$ a.v3=v3.lwp.all.avg*c; a.c3=c3.lwp.all.avg*c; a.w3=w3.lwp.all.avg*c; 
% $$$ a.v4=v4.lwp.all.avg*c; a.c4=c4.lwp.all.avg*c; a.w4=w4.lwp.all.avg*c; 
% $$$ a.v5=v5.lwp.all.avg*c; a.c5=c5.lwp.all.avg*c; a.w5=w5.lwp.all.avg*c; 
% $$$ a.v6=v6.lwp.all.avg*c; a.c6=c6.lwp.all.avg*c; a.w6=w6.lwp.all.avg*c; 
% $$$ b.v0=v0.lwp.all.std_ts*c; b.c0=c0.lwp.all.std_ts*c; b.w0=w0.lwp.all.std_ts*c; 
% $$$ b.v1=v1.lwp.all.std_ts*c; b.c1=c1.lwp.all.std_ts*c; b.w1=w1.lwp.all.std_ts*c; 
% $$$ b.v2=v2.lwp.all.std_ts*c; b.c2=c2.lwp.all.std_ts*c; b.w2=w2.lwp.all.std_ts*c; 
% $$$ b.v3=v3.lwp.all.std_ts*c; b.c3=c3.lwp.all.std_ts*c; b.w3=w3.lwp.all.std_ts*c; 
% $$$ b.v4=v4.lwp.all.std_ts*c; b.c4=c4.lwp.all.std_ts*c; b.w4=w4.lwp.all.std_ts*c; 
% $$$ b.v5=v5.lwp.all.std_ts*c; b.c5=c5.lwp.all.std_ts*c; b.w5=w5.lwp.all.std_ts*c; 
% $$$ b.v6=v6.lwp.all.std_ts*c; b.c6=c6.lwp.all.std_ts*c; b.w6=w6.lwp.all.std_ts*c; 
% $$$ the above values are the same as below
a.v0=v0.int.ql.all.avg*c; a.c0=c0.int.ql.all.avg*c; a.w0=w0.int.ql.all.avg*c; 
a.v1=v1.int.ql.all.avg*c; a.c1=c1.int.ql.all.avg*c; a.w1=w1.int.ql.all.avg*c; 
a.v2=v2.int.ql.all.avg*c; a.c2=c2.int.ql.all.avg*c; a.w2=w2.int.ql.all.avg*c; 
a.v3=v3.int.ql.all.avg*c; a.c3=c3.int.ql.all.avg*c; a.w3=w3.int.ql.all.avg*c; 
a.v4=v4.int.ql.all.avg*c; a.c4=c4.int.ql.all.avg*c; a.w4=w4.int.ql.all.avg*c; 
a.v5=v5.int.ql.all.avg*c; a.c5=c5.int.ql.all.avg*c; a.w5=w5.int.ql.all.avg*c; 
a.v6=v6.int.ql.all.avg*c; a.c6=c6.int.ql.all.avg*c; a.w6=w6.int.ql.all.avg*c; 
b.v0=v0.int.ql.all.std_ts*c; b.c0=c0.int.ql.all.std_ts*c; b.w0=w0.int.ql.all.std_ts*c; 
b.v1=v1.int.ql.all.std_ts*c; b.c1=c1.int.ql.all.std_ts*c; b.w1=w1.int.ql.all.std_ts*c; 
b.v2=v2.int.ql.all.std_ts*c; b.c2=c2.int.ql.all.std_ts*c; b.w2=w2.int.ql.all.std_ts*c; 
b.v3=v3.int.ql.all.std_ts*c; b.c3=c3.int.ql.all.std_ts*c; b.w3=w3.int.ql.all.std_ts*c; 
b.v4=v4.int.ql.all.std_ts*c; b.c4=c4.int.ql.all.std_ts*c; b.w4=w4.int.ql.all.std_ts*c; 
b.v5=v5.int.ql.all.std_ts*c; b.c5=c5.int.ql.all.std_ts*c; b.w5=w5.int.ql.all.std_ts*c; 
b.v6=v6.int.ql.all.std_ts*c; b.c6=c6.int.ql.all.std_ts*c; b.w6=w6.int.ql.all.std_ts*c; 
yl='liquid water path (g/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='iwp_avg'; xy=[0 8 0 40]; c=1000;
% $$$ a.v0=v0.iwp.all.avg*c; a.c0=c0.iwp.all.avg*c; a.w0=w0.iwp.all.avg*c; 
% $$$ a.v1=v1.iwp.all.avg*c; a.c1=c1.iwp.all.avg*c; a.w1=w1.iwp.all.avg*c; 
% $$$ a.v2=v2.iwp.all.avg*c; a.c2=c2.iwp.all.avg*c; a.w2=w2.iwp.all.avg*c; 
% $$$ a.v3=v3.iwp.all.avg*c; a.c3=c3.iwp.all.avg*c; a.w3=w3.iwp.all.avg*c; 
% $$$ a.v4=v4.iwp.all.avg*c; a.c4=c4.iwp.all.avg*c; a.w4=w4.iwp.all.avg*c; 
% $$$ a.v5=v5.iwp.all.avg*c; a.c5=c5.iwp.all.avg*c; a.w5=w5.iwp.all.avg*c; 
% $$$ a.v6=v6.iwp.all.avg*c; a.c6=c6.iwp.all.avg*c; a.w6=w6.iwp.all.avg*c; 
% $$$ b.v0=v0.iwp.all.std_ts*c; b.c0=c0.iwp.all.std_ts*c; b.w0=w0.iwp.all.std_ts*c; 
% $$$ b.v1=v1.iwp.all.std_ts*c; b.c1=c1.iwp.all.std_ts*c; b.w1=w1.iwp.all.std_ts*c; 
% $$$ b.v2=v2.iwp.all.std_ts*c; b.c2=c2.iwp.all.std_ts*c; b.w2=w2.iwp.all.std_ts*c; 
% $$$ b.v3=v3.iwp.all.std_ts*c; b.c3=c3.iwp.all.std_ts*c; b.w3=w3.iwp.all.std_ts*c; 
% $$$ b.v4=v4.iwp.all.std_ts*c; b.c4=c4.iwp.all.std_ts*c; b.w4=w4.iwp.all.std_ts*c; 
% $$$ b.v5=v5.iwp.all.std_ts*c; b.c5=c5.iwp.all.std_ts*c; b.w5=w5.iwp.all.std_ts*c; 
% $$$ b.v6=v6.iwp.all.std_ts*c; b.c6=c6.iwp.all.std_ts*c; b.w6=w6.iwp.all.std_ts*c; 
% $$$ the above values are the same as below
a.v0=v0.int.qi.all.avg*c; a.c0=c0.int.qi.all.avg*c; a.w0=w0.int.qi.all.avg*c; 
a.v1=v1.int.qi.all.avg*c; a.c1=c1.int.qi.all.avg*c; a.w1=w1.int.qi.all.avg*c; 
a.v2=v2.int.qi.all.avg*c; a.c2=c2.int.qi.all.avg*c; a.w2=w2.int.qi.all.avg*c; 
a.v3=v3.int.qi.all.avg*c; a.c3=c3.int.qi.all.avg*c; a.w3=w3.int.qi.all.avg*c; 
a.v4=v4.int.qi.all.avg*c; a.c4=c4.int.qi.all.avg*c; a.w4=w4.int.qi.all.avg*c; 
a.v5=v5.int.qi.all.avg*c; a.c5=c5.int.qi.all.avg*c; a.w5=w5.int.qi.all.avg*c; 
a.v6=v6.int.qi.all.avg*c; a.c6=c6.int.qi.all.avg*c; a.w6=w6.int.qi.all.avg*c; 
b.v0=v0.int.qi.all.std_ts*c; b.c0=c0.int.qi.all.std_ts*c; b.w0=w0.int.qi.all.std_ts*c; 
b.v1=v1.int.qi.all.std_ts*c; b.c1=c1.int.qi.all.std_ts*c; b.w1=w1.int.qi.all.std_ts*c; 
b.v2=v2.int.qi.all.std_ts*c; b.c2=c2.int.qi.all.std_ts*c; b.w2=w2.int.qi.all.std_ts*c; 
b.v3=v3.int.qi.all.std_ts*c; b.c3=c3.int.qi.all.std_ts*c; b.w3=w3.int.qi.all.std_ts*c; 
b.v4=v4.int.qi.all.std_ts*c; b.c4=c4.int.qi.all.std_ts*c; b.w4=w4.int.qi.all.std_ts*c; 
b.v5=v5.int.qi.all.std_ts*c; b.c5=c5.int.qi.all.std_ts*c; b.w5=w5.int.qi.all.std_ts*c; 
b.v6=v6.int.qi.all.std_ts*c; b.c6=c6.int.qi.all.std_ts*c; b.w6=w6.int.qi.all.std_ts*c; 
yl='ice water path (g/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tcp_avg';  xy=[0 8 0 175]; opt=1; c=1000;
% $$$ a.v0=v0.tcp.all.avg*c; a.c0=c0.tcp.all.avg*c; a.w0=w0.tcp.all.avg*c; 
% $$$ a.v1=v1.tcp.all.avg*c; a.c1=c1.tcp.all.avg*c; a.w1=w1.tcp.all.avg*c; 
% $$$ a.v2=v2.tcp.all.avg*c; a.c2=c2.tcp.all.avg*c; a.w2=w2.tcp.all.avg*c; 
% $$$ a.v3=v3.tcp.all.avg*c; a.c3=c3.tcp.all.avg*c; a.w3=w3.tcp.all.avg*c; 
% $$$ a.v4=v4.tcp.all.avg*c; a.c4=c4.tcp.all.avg*c; a.w4=w4.tcp.all.avg*c; 
% $$$ a.v5=v5.tcp.all.avg*c; a.c5=c5.tcp.all.avg*c; a.w5=w5.tcp.all.avg*c; 
% $$$ a.v6=v6.tcp.all.avg*c; a.c6=c6.tcp.all.avg*c; a.w6=w6.tcp.all.avg*c; 
% $$$ b.v0=v0.tcp.all.std_ts*c; b.c0=c0.tcp.all.std_ts*c; b.w0=w0.tcp.all.std_ts*c; 
% $$$ b.v1=v1.tcp.all.std_ts*c; b.c1=c1.tcp.all.std_ts*c; b.w1=w1.tcp.all.std_ts*c; 
% $$$ b.v2=v2.tcp.all.std_ts*c; b.c2=c2.tcp.all.std_ts*c; b.w2=w2.tcp.all.std_ts*c; 
% $$$ b.v3=v3.tcp.all.std_ts*c; b.c3=c3.tcp.all.std_ts*c; b.w3=w3.tcp.all.std_ts*c; 
% $$$ b.v4=v4.tcp.all.std_ts*c; b.c4=c4.tcp.all.std_ts*c; b.w4=w4.tcp.all.std_ts*c; 
% $$$ b.v5=v5.tcp.all.std_ts*c; b.c5=c5.tcp.all.std_ts*c; b.w5=w5.tcp.all.std_ts*c; 
% $$$ b.v6=v6.tcp.all.std_ts*c; b.c6=c6.tcp.all.std_ts*c; b.w6=w6.tcp.all.std_ts*c; 
% $$$ above values are the same as below
a.v0=v0.int.qc.all.avg*c; a.c0=c0.int.qc.all.avg*c; a.w0=w0.int.qc.all.avg*c; 
a.v1=v1.int.qc.all.avg*c; a.c1=c1.int.qc.all.avg*c; a.w1=w1.int.qc.all.avg*c; 
a.v2=v2.int.qc.all.avg*c; a.c2=c2.int.qc.all.avg*c; a.w2=w2.int.qc.all.avg*c; 
a.v3=v3.int.qc.all.avg*c; a.c3=c3.int.qc.all.avg*c; a.w3=w3.int.qc.all.avg*c; 
a.v4=v4.int.qc.all.avg*c; a.c4=c4.int.qc.all.avg*c; a.w4=w4.int.qc.all.avg*c; 
a.v5=v5.int.qc.all.avg*c; a.c5=c5.int.qc.all.avg*c; a.w5=w5.int.qc.all.avg*c; 
a.v6=v6.int.qc.all.avg*c; a.c6=c6.int.qc.all.avg*c; a.w6=w6.int.qc.all.avg*c; 
b.v0=v0.int.qc.all.std_ts*c; b.c0=c0.int.qc.all.std_ts*c; b.w0=w0.int.qc.all.std_ts*c; 
b.v1=v1.int.qc.all.std_ts*c; b.c1=c1.int.qc.all.std_ts*c; b.w1=w1.int.qc.all.std_ts*c; 
b.v2=v2.int.qc.all.std_ts*c; b.c2=c2.int.qc.all.std_ts*c; b.w2=w2.int.qc.all.std_ts*c; 
b.v3=v3.int.qc.all.std_ts*c; b.c3=c3.int.qc.all.std_ts*c; b.w3=w3.int.qc.all.std_ts*c; 
b.v4=v4.int.qc.all.std_ts*c; b.c4=c4.int.qc.all.std_ts*c; b.w4=w4.int.qc.all.std_ts*c; 
b.v5=v5.int.qc.all.std_ts*c; b.c5=c5.int.qc.all.std_ts*c; b.w5=w5.int.qc.all.std_ts*c; 
b.v6=v6.int.qc.all.std_ts*c; b.c6=c6.int.qc.all.std_ts*c; b.w6=w6.int.qc.all.std_ts*c; 
yl='total condensate path (g/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pwp_avg';  xy=[0 8 0 175]; opt=1; c=1000;
a.v0=v0.int.qp.all.avg*c; a.c0=c0.int.qp.all.avg*c; a.w0=w0.int.qp.all.avg*c; 
a.v1=v1.int.qp.all.avg*c; a.c1=c1.int.qp.all.avg*c; a.w1=w1.int.qp.all.avg*c; 
a.v2=v2.int.qp.all.avg*c; a.c2=c2.int.qp.all.avg*c; a.w2=w2.int.qp.all.avg*c; 
a.v3=v3.int.qp.all.avg*c; a.c3=c3.int.qp.all.avg*c; a.w3=w3.int.qp.all.avg*c; 
a.v4=v4.int.qp.all.avg*c; a.c4=c4.int.qp.all.avg*c; a.w4=w4.int.qp.all.avg*c; 
a.v5=v5.int.qp.all.avg*c; a.c5=c5.int.qp.all.avg*c; a.w5=w5.int.qp.all.avg*c; 
a.v6=v6.int.qp.all.avg*c; a.c6=c6.int.qp.all.avg*c; a.w6=w6.int.qp.all.avg*c; 
b.v0=v0.int.qp.all.std_ts*c; b.c0=c0.int.qp.all.std_ts*c; b.w0=w0.int.qp.all.std_ts*c; 
b.v1=v1.int.qp.all.std_ts*c; b.c1=c1.int.qp.all.std_ts*c; b.w1=w1.int.qp.all.std_ts*c; 
b.v2=v2.int.qp.all.std_ts*c; b.c2=c2.int.qp.all.std_ts*c; b.w2=w2.int.qp.all.std_ts*c; 
b.v3=v3.int.qp.all.std_ts*c; b.c3=c3.int.qp.all.std_ts*c; b.w3=w3.int.qp.all.std_ts*c; 
b.v4=v4.int.qp.all.std_ts*c; b.c4=c4.int.qp.all.std_ts*c; b.w4=w4.int.qp.all.std_ts*c; 
b.v5=v5.int.qp.all.std_ts*c; b.c5=c5.int.qp.all.std_ts*c; b.w5=w5.int.qp.all.std_ts*c; 
b.v6=v6.int.qp.all.std_ts*c; b.c6=c6.int.qp.all.std_ts*c; b.w6=w6.int.qp.all.std_ts*c; 
yl='total precipitating water path (g/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rwp_avg';  xy=[0 8 0 70]; opt=1; c=1000;
a.v0=v0.int.qr.all.avg*c; a.c0=c0.int.qr.all.avg*c; a.w0=w0.int.qr.all.avg*c; 
a.v1=v1.int.qr.all.avg*c; a.c1=c1.int.qr.all.avg*c; a.w1=w1.int.qr.all.avg*c; 
a.v2=v2.int.qr.all.avg*c; a.c2=c2.int.qr.all.avg*c; a.w2=w2.int.qr.all.avg*c; 
a.v3=v3.int.qr.all.avg*c; a.c3=c3.int.qr.all.avg*c; a.w3=w3.int.qr.all.avg*c; 
a.v4=v4.int.qr.all.avg*c; a.c4=c4.int.qr.all.avg*c; a.w4=w4.int.qr.all.avg*c; 
a.v5=v5.int.qr.all.avg*c; a.c5=c5.int.qr.all.avg*c; a.w5=w5.int.qr.all.avg*c; 
a.v6=v6.int.qr.all.avg*c; a.c6=c6.int.qr.all.avg*c; a.w6=w6.int.qr.all.avg*c; 
b.v0=v0.int.qr.all.std_ts*c; b.c0=c0.int.qr.all.std_ts*c; b.w0=w0.int.qr.all.std_ts*c; 
b.v1=v1.int.qr.all.std_ts*c; b.c1=c1.int.qr.all.std_ts*c; b.w1=w1.int.qr.all.std_ts*c; 
b.v2=v2.int.qr.all.std_ts*c; b.c2=c2.int.qr.all.std_ts*c; b.w2=w2.int.qr.all.std_ts*c; 
b.v3=v3.int.qr.all.std_ts*c; b.c3=c3.int.qr.all.std_ts*c; b.w3=w3.int.qr.all.std_ts*c; 
b.v4=v4.int.qr.all.std_ts*c; b.c4=c4.int.qr.all.std_ts*c; b.w4=w4.int.qr.all.std_ts*c; 
b.v5=v5.int.qr.all.std_ts*c; b.c5=c5.int.qr.all.std_ts*c; b.w5=w5.int.qr.all.std_ts*c; 
b.v6=v6.int.qr.all.std_ts*c; b.c6=c6.int.qr.all.std_ts*c; b.w6=w6.int.qr.all.std_ts*c; 
yl='total rain water path (g/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swp_avg';  xy=[0 8 0 50]; opt=1; c=1000;
a.v0=v0.int.qs.all.avg*c; a.c0=c0.int.qs.all.avg*c; a.w0=w0.int.qs.all.avg*c; 
a.v1=v1.int.qs.all.avg*c; a.c1=c1.int.qs.all.avg*c; a.w1=w1.int.qs.all.avg*c; 
a.v2=v2.int.qs.all.avg*c; a.c2=c2.int.qs.all.avg*c; a.w2=w2.int.qs.all.avg*c; 
a.v3=v3.int.qs.all.avg*c; a.c3=c3.int.qs.all.avg*c; a.w3=w3.int.qs.all.avg*c; 
a.v4=v4.int.qs.all.avg*c; a.c4=c4.int.qs.all.avg*c; a.w4=w4.int.qs.all.avg*c; 
a.v5=v5.int.qs.all.avg*c; a.c5=c5.int.qs.all.avg*c; a.w5=w5.int.qs.all.avg*c; 
a.v6=v6.int.qs.all.avg*c; a.c6=c6.int.qs.all.avg*c; a.w6=w6.int.qs.all.avg*c; 
b.v0=v0.int.qs.all.std_ts*c; b.c0=c0.int.qs.all.std_ts*c; b.w0=w0.int.qs.all.std_ts*c; 
b.v1=v1.int.qs.all.std_ts*c; b.c1=c1.int.qs.all.std_ts*c; b.w1=w1.int.qs.all.std_ts*c; 
b.v2=v2.int.qs.all.std_ts*c; b.c2=c2.int.qs.all.std_ts*c; b.w2=w2.int.qs.all.std_ts*c; 
b.v3=v3.int.qs.all.std_ts*c; b.c3=c3.int.qs.all.std_ts*c; b.w3=w3.int.qs.all.std_ts*c; 
b.v4=v4.int.qs.all.std_ts*c; b.c4=c4.int.qs.all.std_ts*c; b.w4=w4.int.qs.all.std_ts*c; 
b.v5=v5.int.qs.all.std_ts*c; b.c5=c5.int.qs.all.std_ts*c; b.w5=w5.int.qs.all.std_ts*c; 
b.v6=v6.int.qs.all.std_ts*c; b.c6=c6.int.qs.all.std_ts*c; b.w6=w6.int.qs.all.std_ts*c; 
yl='total snow water path (g/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='gwp_avg';  xy=[0 8 0 70]; opt=1; c=1000;
a.v0=v0.int.qg.all.avg*c; a.c0=c0.int.qg.all.avg*c; a.w0=w0.int.qg.all.avg*c; 
a.v1=v1.int.qg.all.avg*c; a.c1=c1.int.qg.all.avg*c; a.w1=w1.int.qg.all.avg*c; 
a.v2=v2.int.qg.all.avg*c; a.c2=c2.int.qg.all.avg*c; a.w2=w2.int.qg.all.avg*c; 
a.v3=v3.int.qg.all.avg*c; a.c3=c3.int.qg.all.avg*c; a.w3=w3.int.qg.all.avg*c; 
a.v4=v4.int.qg.all.avg*c; a.c4=c4.int.qg.all.avg*c; a.w4=w4.int.qg.all.avg*c; 
a.v5=v5.int.qg.all.avg*c; a.c5=c5.int.qg.all.avg*c; a.w5=w5.int.qg.all.avg*c; 
a.v6=v6.int.qg.all.avg*c; a.c6=c6.int.qg.all.avg*c; a.w6=w6.int.qg.all.avg*c; 
b.v0=v0.int.qg.all.std_ts*c; b.c0=c0.int.qg.all.std_ts*c; b.w0=w0.int.qg.all.std_ts*c; 
b.v1=v1.int.qg.all.std_ts*c; b.c1=c1.int.qg.all.std_ts*c; b.w1=w1.int.qg.all.std_ts*c; 
b.v2=v2.int.qg.all.std_ts*c; b.c2=c2.int.qg.all.std_ts*c; b.w2=w2.int.qg.all.std_ts*c; 
b.v3=v3.int.qg.all.std_ts*c; b.c3=c3.int.qg.all.std_ts*c; b.w3=w3.int.qg.all.std_ts*c; 
b.v4=v4.int.qg.all.std_ts*c; b.c4=c4.int.qg.all.std_ts*c; b.w4=w4.int.qg.all.std_ts*c; 
b.v5=v5.int.qg.all.std_ts*c; b.c5=c5.int.qg.all.std_ts*c; b.w5=w5.int.qg.all.std_ts*c; 
b.v6=v6.int.qg.all.std_ts*c; b.c6=c6.int.qg.all.std_ts*c; b.w6=w6.int.qg.all.std_ts*c; 
yl='total graupel water path (g/m2)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qam_avg'; xy=[0 8 0 15]; opt=2;
a.v0=v0.qam.all.avg; a.c0=c0.qam.all.avg; a.w0=w0.qam.all.avg; 
a.v1=v1.qam.all.avg; a.c1=c1.qam.all.avg; a.w1=w1.qam.all.avg; 
a.v2=v2.qam.all.avg; a.c2=c2.qam.all.avg; a.w2=w2.qam.all.avg; 
a.v3=v3.qam.all.avg; a.c3=c3.qam.all.avg; a.w3=w3.qam.all.avg; 
a.v4=v4.qam.all.avg; a.c4=c4.qam.all.avg; a.w4=w4.qam.all.avg; 
a.v5=v5.qam.all.avg; a.c5=c5.qam.all.avg; a.w5=w5.qam.all.avg; 
a.v6=v6.qam.all.avg; a.c6=c6.qam.all.avg; a.w6=w6.qam.all.avg; 
b.v0=v0.qam.all.std_ts; b.c0=c0.qam.all.std_ts; b.w0=w0.qam.all.std_ts; 
b.v1=v1.qam.all.std_ts; b.c1=c1.qam.all.std_ts; b.w1=w1.qam.all.std_ts; 
b.v2=v2.qam.all.std_ts; b.c2=c2.qam.all.std_ts; b.w2=w2.qam.all.std_ts; 
b.v3=v3.qam.all.std_ts; b.c3=c3.qam.all.std_ts; b.w3=w3.qam.all.std_ts; 
b.v4=v4.qam.all.std_ts; b.c4=c4.qam.all.std_ts; b.w4=w4.qam.all.std_ts; 
b.v5=v5.qam.all.std_ts; b.c5=c5.qam.all.std_ts; b.w5=w5.qam.all.std_ts; 
b.v6=v6.qam.all.std_ts; b.c6=c6.qam.all.std_ts; b.w6=w6.qam.all.std_ts; 
yl='middle cloud amount (%)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qah_avg'; xy=[0 8 0 70]; opt=2;
a.v0=v0.qah.all.avg; a.c0=c0.qah.all.avg; a.w0=w0.qah.all.avg; 
a.v1=v1.qah.all.avg; a.c1=c1.qah.all.avg; a.w1=w1.qah.all.avg; 
a.v2=v2.qah.all.avg; a.c2=c2.qah.all.avg; a.w2=w2.qah.all.avg; 
a.v3=v3.qah.all.avg; a.c3=c3.qah.all.avg; a.w3=w3.qah.all.avg; 
a.v4=v4.qah.all.avg; a.c4=c4.qah.all.avg; a.w4=w4.qah.all.avg; 
a.v5=v5.qah.all.avg; a.c5=c5.qah.all.avg; a.w5=w5.qah.all.avg; 
a.v6=v6.qah.all.avg; a.c6=c6.qah.all.avg; a.w6=w6.qah.all.avg; 
b.v0=v0.qah.all.std_ts; b.c0=c0.qah.all.std_ts; b.w0=w0.qah.all.std_ts; 
b.v1=v1.qah.all.std_ts; b.c1=c1.qah.all.std_ts; b.w1=w1.qah.all.std_ts; 
b.v2=v2.qah.all.std_ts; b.c2=c2.qah.all.std_ts; b.w2=w2.qah.all.std_ts; 
b.v3=v3.qah.all.std_ts; b.c3=c3.qah.all.std_ts; b.w3=w3.qah.all.std_ts; 
b.v4=v4.qah.all.std_ts; b.c4=c4.qah.all.std_ts; b.w4=w4.qah.all.std_ts; 
b.v5=v5.qah.all.std_ts; b.c5=c5.qah.all.std_ts; b.w5=w5.qah.all.std_ts; 
b.v6=v6.qah.all.std_ts; b.c6=c6.qah.all.std_ts; b.w6=w6.qah.all.std_ts; 
yl='high cloud amount (%)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qah_up_avg'; xy=[0 8 0 100]; opt=1;
a.v0=v0.qah.up.avg; a.c0=c0.qah.up.avg; a.w0=w0.qah.up.avg; 
a.v1=v1.qah.up.avg; a.c1=c1.qah.up.avg; a.w1=w1.qah.up.avg; 
a.v2=v2.qah.up.avg; a.c2=c2.qah.up.avg; a.w2=w2.qah.up.avg; 
a.v3=v3.qah.up.avg; a.c3=c3.qah.up.avg; a.w3=w3.qah.up.avg; 
a.v4=v4.qah.up.avg; a.c4=c4.qah.up.avg; a.w4=w4.qah.up.avg; 
a.v5=v5.qah.up.avg; a.c5=c5.qah.up.avg; a.w5=w5.qah.up.avg; 
a.v6=v6.qah.up.avg; a.c6=c6.qah.up.avg; a.w6=w6.qah.up.avg; 
b.v0=v0.qah.up.std_ts; b.c0=c0.qah.up.std_ts; b.w0=w0.qah.up.std_ts; 
b.v1=v1.qah.up.std_ts; b.c1=c1.qah.up.std_ts; b.w1=w1.qah.up.std_ts; 
b.v2=v2.qah.up.std_ts; b.c2=c2.qah.up.std_ts; b.w2=w2.qah.up.std_ts; 
b.v3=v3.qah.up.std_ts; b.c3=c3.qah.up.std_ts; b.w3=w3.qah.up.std_ts; 
b.v4=v4.qah.up.std_ts; b.c4=c4.qah.up.std_ts; b.w4=w4.qah.up.std_ts; 
b.v5=v5.qah.up.std_ts; b.c5=c5.qah.up.std_ts; b.w5=w5.qah.up.std_ts; 
b.v6=v6.qah.up.std_ts; b.c6=c6.qah.up.std_ts; b.w6=w6.qah.up.std_ts; 
yl='high cloud amount over large-scale ascent region (%)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qah_dn_avg'; xy=[0 8 0 70]; opt=2;
a.v0=v0.qah.dn.avg; a.c0=c0.qah.dn.avg; a.w0=w0.qah.dn.avg; 
a.v1=v1.qah.dn.avg; a.c1=c1.qah.dn.avg; a.w1=w1.qah.dn.avg; 
a.v2=v2.qah.dn.avg; a.c2=c2.qah.dn.avg; a.w2=w2.qah.dn.avg; 
a.v3=v3.qah.dn.avg; a.c3=c3.qah.dn.avg; a.w3=w3.qah.dn.avg; 
a.v4=v4.qah.dn.avg; a.c4=c4.qah.dn.avg; a.w4=w4.qah.dn.avg; 
a.v5=v5.qah.dn.avg; a.c5=c5.qah.dn.avg; a.w5=w5.qah.dn.avg; 
a.v6=v6.qah.dn.avg; a.c6=c6.qah.dn.avg; a.w6=w6.qah.dn.avg; 
b.v0=v0.qah.dn.std_ts; b.c0=c0.qah.dn.std_ts; b.w0=w0.qah.dn.std_ts; 
b.v1=v1.qah.dn.std_ts; b.c1=c1.qah.dn.std_ts; b.w1=w1.qah.dn.std_ts; 
b.v2=v2.qah.dn.std_ts; b.c2=c2.qah.dn.std_ts; b.w2=w2.qah.dn.std_ts; 
b.v3=v3.qah.dn.std_ts; b.c3=c3.qah.dn.std_ts; b.w3=w3.qah.dn.std_ts; 
b.v4=v4.qah.dn.std_ts; b.c4=c4.qah.dn.std_ts; b.w4=w4.qah.dn.std_ts; 
b.v5=v5.qah.dn.std_ts; b.c5=c5.qah.dn.std_ts; b.w5=w5.qah.dn.std_ts; 
b.v6=v6.qah.dn.std_ts; b.c6=c6.qah.dn.std_ts; b.w6=w6.qah.dn.std_ts; 
yl='high cloud amount over large-scale subsidence region (%)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qal1_avg'; xy=[0 8 0 70]; opt=2; c=100;
a.v0=v0.qal1.avg*c; a.c0=c0.qal1.avg*c; a.w0=w0.qal1.avg*c; 
a.v1=v1.qal1.avg*c; a.c1=c1.qal1.avg*c; a.w1=w1.qal1.avg*c; 
a.v2=v2.qal1.avg*c; a.c2=c2.qal1.avg*c; a.w2=w2.qal1.avg*c; 
a.v3=v3.qal1.avg*c; a.c3=c3.qal1.avg*c; a.w3=w3.qal1.avg*c; 
a.v4=v4.qal1.avg*c; a.c4=c4.qal1.avg*c; a.w4=w4.qal1.avg*c; 
a.v5=v5.qal1.avg*c; a.c5=c5.qal1.avg*c; a.w5=w5.qal1.avg*c; 
a.v6=v6.qal1.avg*c; a.c6=c6.qal1.avg*c; a.w6=w6.qal1.avg*c; 
b.v0=v0.qal1.all.std_ts*c; b.c0=c0.qal1.all.std_ts*c; b.w0=w0.qal1.all.std_ts*c; 
b.v1=v1.qal1.all.std_ts*c; b.c1=c1.qal1.all.std_ts*c; b.w1=w1.qal1.all.std_ts*c; 
b.v2=v2.qal1.all.std_ts*c; b.c2=c2.qal1.all.std_ts*c; b.w2=w2.qal1.all.std_ts*c; 
b.v3=v3.qal1.all.std_ts*c; b.c3=c3.qal1.all.std_ts*c; b.w3=w3.qal1.all.std_ts*c; 
b.v4=v4.qal1.all.std_ts*c; b.c4=c4.qal1.all.std_ts*c; b.w4=w4.qal1.all.std_ts*c; 
b.v5=v5.qal1.all.std_ts*c; b.c5=c5.qal1.all.std_ts*c; b.w5=w5.qal1.all.std_ts*c; 
b.v6=v6.qal1.all.std_ts*c; b.c6=c6.qal1.all.std_ts*c; b.w6=w6.qal1.all.std_ts*c; 
yl='low cloud amount (%)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qam1_avg'; xy=[0 8 0 15]; opt=2; c=100;
a.v0=v0.qam1.avg*c; a.c0=c0.qam1.avg*c; a.w0=w0.qam1.avg*c; 
a.v1=v1.qam1.avg*c; a.c1=c1.qam1.avg*c; a.w1=w1.qam1.avg*c; 
a.v2=v2.qam1.avg*c; a.c2=c2.qam1.avg*c; a.w2=w2.qam1.avg*c; 
a.v3=v3.qam1.avg*c; a.c3=c3.qam1.avg*c; a.w3=w3.qam1.avg*c; 
a.v4=v4.qam1.avg*c; a.c4=c4.qam1.avg*c; a.w4=w4.qam1.avg*c; 
a.v5=v5.qam1.avg*c; a.c5=c5.qam1.avg*c; a.w5=w5.qam1.avg*c; 
a.v6=v6.qam1.avg*c; a.c6=c6.qam1.avg*c; a.w6=w6.qam1.avg*c; 
b.v0=v0.qam1.all.std_ts*c; b.c0=c0.qam1.all.std_ts*c; b.w0=w0.qam1.all.std_ts*c; 
b.v1=v1.qam1.all.std_ts*c; b.c1=c1.qam1.all.std_ts*c; b.w1=w1.qam1.all.std_ts*c; 
b.v2=v2.qam1.all.std_ts*c; b.c2=c2.qam1.all.std_ts*c; b.w2=w2.qam1.all.std_ts*c; 
b.v3=v3.qam1.all.std_ts*c; b.c3=c3.qam1.all.std_ts*c; b.w3=w3.qam1.all.std_ts*c; 
b.v4=v4.qam1.all.std_ts*c; b.c4=c4.qam1.all.std_ts*c; b.w4=w4.qam1.all.std_ts*c; 
b.v5=v5.qam1.all.std_ts*c; b.c5=c5.qam1.all.std_ts*c; b.w5=w5.qam1.all.std_ts*c; 
b.v6=v6.qam1.all.std_ts*c; b.c6=c6.qam1.all.std_ts*c; b.w6=w6.qam1.all.std_ts*c; 
yl='middle cloud amount (%)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qah1_avg'; xy=[0 8 0 35]; c=100;
a.v0=v0.qah1.avg*c; a.c0=c0.qah1.avg*c; a.w0=w0.qah1.avg*c; 
a.v1=v1.qah1.avg*c; a.c1=c1.qah1.avg*c; a.w1=w1.qah1.avg*c; 
a.v2=v2.qah1.avg*c; a.c2=c2.qah1.avg*c; a.w2=w2.qah1.avg*c; 
a.v3=v3.qah1.avg*c; a.c3=c3.qah1.avg*c; a.w3=w3.qah1.avg*c; 
a.v4=v4.qah1.avg*c; a.c4=c4.qah1.avg*c; a.w4=w4.qah1.avg*c; 
a.v5=v5.qah1.avg*c; a.c5=c5.qah1.avg*c; a.w5=w5.qah1.avg*c; 
a.v6=v6.qah1.avg*c; a.c6=c6.qah1.avg*c; a.w6=w6.qah1.avg*c; 
b.v0=v0.qah1.all.std_ts*c; b.c0=c0.qah1.all.std_ts*c; b.w0=w0.qah.all.std_ts*c; 
b.v1=v1.qah1.all.std_ts*c; b.c1=c1.qah1.all.std_ts*c; b.w1=w1.qah.all.std_ts*c; 
b.v2=v2.qah1.all.std_ts*c; b.c2=c2.qah1.all.std_ts*c; b.w2=w2.qah.all.std_ts*c; 
b.v3=v3.qah1.all.std_ts*c; b.c3=c3.qah1.all.std_ts*c; b.w3=w3.qah.all.std_ts*c; 
b.v4=v4.qah1.all.std_ts*c; b.c4=c4.qah1.all.std_ts*c; b.w4=w4.qah.all.std_ts*c; 
b.v5=v5.qah1.all.std_ts*c; b.c5=c5.qah1.all.std_ts*c; b.w5=w5.qah.all.std_ts*c; 
b.v6=v6.qah1.all.std_ts*c; b.c6=c6.qah1.all.std_ts*c; b.w6=w6.qah.all.std_ts*c; 
yl='high cloud amount (%)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_mon_avg'; xy=[0 6200 0 50]; c=86400/LV0; opt=1;
a.v0=v0.pcp_mon_avg*c; a.c0=c0.pcp_mon_avg*c; a.w0=w0.pcp_mon_avg*c;
a.v1=v1.pcp_mon_avg*c; a.c1=c1.pcp_mon_avg*c; a.w1=w1.pcp_mon_avg*c;
a.v2=v2.pcp_mon_avg*c; a.c2=c2.pcp_mon_avg*c; a.w2=w2.pcp_mon_avg*c;
a.v3=v3.pcp_mon_avg*c; a.c3=c3.pcp_mon_avg*c; a.w3=w3.pcp_mon_avg*c;
a.v4=v4.pcp_mon_avg*c; a.c4=c4.pcp_mon_avg*c; a.w4=w4.pcp_mon_avg*c;
a.v5=v5.pcp_mon_avg*c; a.c5=c5.pcp_mon_avg*c; a.w5=w5.pcp_mon_avg*c;
a.v6=v6.pcp_mon_avg*c; a.c6=c6.pcp_mon_avg*c; a.w6=w6.pcp_mon_avg*c;
b.v0=v0.x*1.5; b.c0=b.v0; b.w0=b.v0;
b.v1=v1.x*3;   b.c1=b.v1; b.w1=b.v1;
b.v2=v2.x*6;   b.c2=b.v2; b.w2=b.v2;
b.v3=v3.x*12;  b.c3=b.v3; b.w3=b.v3;
b.v4=v4.x*24;  b.c4=b.v4; b.w4=b.v4;
b.v5=v5.x*48;  b.c5=b.v5; b.w5=b.v5;
b.v6=v6.x*48;  b.c6=b.v6; b.w6=b.v6;
pms=[ 0, 0, 1200, 500]*1; fsize=28; lw=2; msize=7;
handle = figure('Position', pms,'visible','on');
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S0; S5=S2;
lw='LineWidth'; d1=2; d2=3; k=5;
plot(b.v0,a.v0(k,:),'m-', lw,d1); hold on;
plot(b.v1,a.v1(k,:),'r-', lw,d1); 
%plot(b.v2,a.v2(k,:),'g-', lw,d1);
%plot(b.v3,a.v3(k,:),'b-', lw,d1);
%plot(b.v4,a.v4(k,:),'c-', lw,d1);
%plot(b.v5,a.v5(k,:),'k-', lw,d1);
%plot(b.v6,a.v6(k,:),'k-', lw,d2);
%legend('R1.5','R03','R06','R12','R24','R48','R48C',1)
legend('R1.5','R03',1)
yl='surface precipitation (mm/day)';    ylabel(yl,'FontSize',fsize);
xl='x (km)'; xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy); 
visfig='off'; figpath='./fig_rce/'; expn='RCE_control';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='omega_upmdn_avg'; xy=[0 8 0 260]; opt=1;
a.v0=v0.wa500_r96.upmdn.avg; a.c0=c0.wa500_r96.upmdn.avg; a.w0=w0.wa500_r96.upmdn.avg;
a.v1=v1.wa500_r96.upmdn.avg; a.c1=c1.wa500_r96.upmdn.avg; a.w1=w1.wa500_r96.upmdn.avg;
a.v2=v2.wa500_r96.upmdn.avg; a.c2=c2.wa500_r96.upmdn.avg; a.w2=w2.wa500_r96.upmdn.avg;
a.v3=v3.wa500_r96.upmdn.avg; a.c3=c3.wa500_r96.upmdn.avg; a.w3=w3.wa500_r96.upmdn.avg;
a.v4=v4.wa500_r96.upmdn.avg; a.c4=c4.wa500_r96.upmdn.avg; a.w4=w4.wa500_r96.upmdn.avg;
a.v5=v5.wa500_r96.upmdn.avg; a.c5=c5.wa500_r96.upmdn.avg; a.w5=w5.wa500_r96.upmdn.avg;
a.v6=v6.wa500_r96.upmdn.avg; a.c6=c6.wa500_r96.upmdn.avg; a.w6=w6.wa500_r96.upmdn.avg;
b.v0=v0.wa500_r96.upmdn.std; b.c0=c0.wa500_r96.upmdn.std; b.w0=w0.wa500_r96.upmdn.std;
b.v1=v1.wa500_r96.upmdn.std; b.c1=c1.wa500_r96.upmdn.std; b.w1=w1.wa500_r96.upmdn.std;
b.v2=v2.wa500_r96.upmdn.std; b.c2=c2.wa500_r96.upmdn.std; b.w2=w2.wa500_r96.upmdn.std;
b.v3=v3.wa500_r96.upmdn.std; b.c3=c3.wa500_r96.upmdn.std; b.w3=w3.wa500_r96.upmdn.std;
b.v4=v4.wa500_r96.upmdn.std; b.c4=c4.wa500_r96.upmdn.std; b.w4=w4.wa500_r96.upmdn.std;
b.v5=v5.wa500_r96.upmdn.std; b.c5=c5.wa500_r96.upmdn.std; b.w5=w5.wa500_r96.upmdn.std;
b.v6=v6.wa500_r96.upmdn.std; b.c6=c6.wa500_r96.upmdn.std; b.w6=w6.wa500_r96.upmdn.std;
yl='circulation strength (hPa/day)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='omega_dn_avg'; xy=[0 8 0 35]; opt=1;
a.v0=-v0.wa500_r96.dn.avg; a.c0=-c0.wa500_r96.dn.avg; a.w0=-w0.wa500_r96.dn.avg;
a.v1=-v1.wa500_r96.dn.avg; a.c1=-c1.wa500_r96.dn.avg; a.w1=-w1.wa500_r96.dn.avg;
a.v2=-v2.wa500_r96.dn.avg; a.c2=-c2.wa500_r96.dn.avg; a.w2=-w2.wa500_r96.dn.avg;
a.v3=-v3.wa500_r96.dn.avg; a.c3=-c3.wa500_r96.dn.avg; a.w3=-w3.wa500_r96.dn.avg;
a.v4=-v4.wa500_r96.dn.avg; a.c4=-c4.wa500_r96.dn.avg; a.w4=-w4.wa500_r96.dn.avg;
a.v5=-v5.wa500_r96.dn.avg; a.c5=-c5.wa500_r96.dn.avg; a.w5=-w5.wa500_r96.dn.avg;
a.v6=-v6.wa500_r96.dn.avg; a.c6=-c6.wa500_r96.dn.avg; a.w6=-w6.wa500_r96.dn.avg;
b.v0=-v0.wa500_r96.dn.std; b.c0=-c0.wa500_r96.dn.std; b.w0=-w0.wa500_r96.dn.std;
b.v1=-v1.wa500_r96.dn.std; b.c1=-c1.wa500_r96.dn.std; b.w1=-w1.wa500_r96.dn.std;
b.v2=-v2.wa500_r96.dn.std; b.c2=-c2.wa500_r96.dn.std; b.w2=-w2.wa500_r96.dn.std;
b.v3=-v3.wa500_r96.dn.std; b.c3=-c3.wa500_r96.dn.std; b.w3=-w3.wa500_r96.dn.std;
b.v4=-v4.wa500_r96.dn.std; b.c4=-c4.wa500_r96.dn.std; b.w4=-w4.wa500_r96.dn.std;
b.v5=-v5.wa500_r96.dn.std; b.c5=-c5.wa500_r96.dn.std; b.w5=-w5.wa500_r96.dn.std;
b.v6=-v6.wa500_r96.dn.std; b.c6=-c6.wa500_r96.dn.std; b.w6=-w6.wa500_r96.dn.std;
yl='large-scale mean subsidence velocity (hPa/day)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='omega_up_avg'; xy=[0 8 0 260]; opt=1;
a.v0=v0.wa500_r96.up.avg; a.c0=c0.wa500_r96.up.avg; a.w0=w0.wa500_r96.up.avg;
a.v1=v1.wa500_r96.up.avg; a.c1=c1.wa500_r96.up.avg; a.w1=w1.wa500_r96.up.avg;
a.v2=v2.wa500_r96.up.avg; a.c2=c2.wa500_r96.up.avg; a.w2=w2.wa500_r96.up.avg;
a.v3=v3.wa500_r96.up.avg; a.c3=c3.wa500_r96.up.avg; a.w3=w3.wa500_r96.up.avg;
a.v4=v4.wa500_r96.up.avg; a.c4=c4.wa500_r96.up.avg; a.w4=w4.wa500_r96.up.avg;
a.v5=v5.wa500_r96.up.avg; a.c5=c5.wa500_r96.up.avg; a.w5=w5.wa500_r96.up.avg;
a.v6=v6.wa500_r96.up.avg; a.c6=c6.wa500_r96.up.avg; a.w6=w6.wa500_r96.up.avg;
b.v0=v0.wa500_r96.up.std; b.c0=c0.wa500_r96.up.std; b.w0=w0.wa500_r96.up.std;
b.v1=v1.wa500_r96.up.std; b.c1=c1.wa500_r96.up.std; b.w1=w1.wa500_r96.up.std;
b.v2=v2.wa500_r96.up.std; b.c2=c2.wa500_r96.up.std; b.w2=w2.wa500_r96.up.std;
b.v3=v3.wa500_r96.up.std; b.c3=c3.wa500_r96.up.std; b.w3=w3.wa500_r96.up.std;
b.v4=v4.wa500_r96.up.std; b.c4=c4.wa500_r96.up.std; b.w4=w4.wa500_r96.up.std;
b.v5=v5.wa500_r96.up.std; b.c5=c5.wa500_r96.up.std; b.w5=w5.wa500_r96.up.std;
b.v6=v6.wa500_r96.up.std; b.c6=c6.wa500_r96.up.std; b.w6=w6.wa500_r96.up.std;
yl='large-scale mean ascent velocity (hPa/day)'; plotbar;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_avg_temp'; k1=15; k2=79; c=100;
a.v0=v0.qa.all.avg(k1:k2)*c; a.c0=c0.qa.all.avg(k1:k2)*c; a.w0=w0.qa.all.avg(k1:k2)*c; 
a.v1=v1.qa.all.avg(k1:k2)*c; a.c1=c1.qa.all.avg(k1:k2)*c; a.w1=w1.qa.all.avg(k1:k2)*c; 
a.v2=v2.qa.all.avg(k1:k2)*c; a.c2=c2.qa.all.avg(k1:k2)*c; a.w2=w2.qa.all.avg(k1:k2)*c; 
a.v3=v3.qa.all.avg(k1:k2)*c; a.c3=c3.qa.all.avg(k1:k2)*c; a.w3=w3.qa.all.avg(k1:k2)*c; 
a.v4=v4.qa.all.avg(k1:k2)*c; a.c4=c4.qa.all.avg(k1:k2)*c; a.w4=w4.qa.all.avg(k1:k2)*c; 
a.v5=v5.qa.all.avg(k1:k2)*c; a.c5=c5.qa.all.avg(k1:k2)*c; a.w5=w5.qa.all.avg(k1:k2)*c; 
a.v6=v6.qa.all.avg(k1:k2)*c; a.c6=c6.qa.all.avg(k1:k2)*c; a.w6=w6.qa.all.avg(k1:k2)*c; 
yl='temperature (K)'; ydir='reverse'; opt=4;
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_avg_temp_high'; xmin=0; xmax=25; ymin=198; ymax=275; 
xy=[xmin xmax ymin ymax]; xy0=[4 18 ymin ymax]; do_ax2=0; 
xl='high cloud amount (%)'; plot_a_b_temp; printit(visfig,figpath,expn,vname);
vname='qa_avg_temp_low'; xmin=0; xmax=35; ymin=265; ymax=305; 
xy=[xmin xmax ymin ymax]; xy0=[0 8 ymin ymax]; opt=1; do_ax2=1; 
xl='low cloud amount (%)'; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_avg_height_high'; xy=[0 25 5 18]; ydir='normal'; 
plot_a_b_height; printit(visfig,figpath,expn,vname);
vname='qa_avg_height_low'; xy=[0 35 0 5]; ydir='normal'; 
plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_dn_avg_temp'; k1=15; k2=79; c=100;
a.v0=v0.qa.dn.avg(k1:k2)*c; a.c0=c0.qa.dn.avg(k1:k2)*c; a.w0=w0.qa.dn.avg(k1:k2)*c; 
a.v1=v1.qa.dn.avg(k1:k2)*c; a.c1=c1.qa.dn.avg(k1:k2)*c; a.w1=w1.qa.dn.avg(k1:k2)*c; 
a.v2=v2.qa.dn.avg(k1:k2)*c; a.c2=c2.qa.dn.avg(k1:k2)*c; a.w2=w2.qa.dn.avg(k1:k2)*c; 
a.v3=v3.qa.dn.avg(k1:k2)*c; a.c3=c3.qa.dn.avg(k1:k2)*c; a.w3=w3.qa.dn.avg(k1:k2)*c; 
a.v4=v4.qa.dn.avg(k1:k2)*c; a.c4=c4.qa.dn.avg(k1:k2)*c; a.w4=w4.qa.dn.avg(k1:k2)*c; 
a.v5=v5.qa.dn.avg(k1:k2)*c; a.c5=c5.qa.dn.avg(k1:k2)*c; a.w5=w5.qa.dn.avg(k1:k2)*c; 
a.v6=v6.qa.dn.avg(k1:k2)*c; a.c6=c6.qa.dn.avg(k1:k2)*c; a.w6=w6.qa.dn.avg(k1:k2)*c; 
ydir='reverse'; opt=4; do_ax2=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_dn_avg_temp_high'; xmin=0; xmax=20; ymin=198; ymax=275; 
xy=[xmin xmax ymin ymax]; xy0=[4 18 ymin ymax]; ydir='reverse';
xl='high cloud amount over large-scale subsidence region(%)'; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_dn_avg_height_high'; xy=[0 32 5 18]; ydir='normal';opt=1;
xl='high cloud amount over large-scale subsidence region (%)'; 
plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_dn_avg_height_low'; xy=[0 32 0 2]; ydir='normal';opt=1;
xl='low cloud amount over large-scale subsidence region (%)'; 
plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_dn_avg_temp_low'; xmin=0; xmax=30; ymin=265; ymax=305; 
xy=[xmin xmax ymin ymax]; xy0=[0 8 ymin ymax]; ydir='reverse'; opt=1;
xl='low cloud amount over large-scale subsidence region (%)'; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_up_avg_temp'; k1=15; k2=79; c=100;
a.v0=v0.qa.up.avg(k1:k2)*c; a.c0=c0.qa.up.avg(k1:k2)*c; a.w0=w0.qa.up.avg(k1:k2)*c; 
a.v1=v1.qa.up.avg(k1:k2)*c; a.c1=c1.qa.up.avg(k1:k2)*c; a.w1=w1.qa.up.avg(k1:k2)*c; 
a.v2=v2.qa.up.avg(k1:k2)*c; a.c2=c2.qa.up.avg(k1:k2)*c; a.w2=w2.qa.up.avg(k1:k2)*c; 
a.v3=v3.qa.up.avg(k1:k2)*c; a.c3=c3.qa.up.avg(k1:k2)*c; a.w3=w3.qa.up.avg(k1:k2)*c; 
a.v4=v4.qa.up.avg(k1:k2)*c; a.c4=c4.qa.up.avg(k1:k2)*c; a.w4=w4.qa.up.avg(k1:k2)*c; 
a.v5=v5.qa.up.avg(k1:k2)*c; a.c5=c5.qa.up.avg(k1:k2)*c; a.w5=w5.qa.up.avg(k1:k2)*c; 
a.v6=v6.qa.up.avg(k1:k2)*c; a.c6=c6.qa.up.avg(k1:k2)*c; a.w6=w6.qa.up.avg(k1:k2)*c; 
yl='temperature (K)'; ydir='reverse'; opt=4; do_ax2=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_up_avg_temp_high'; xmin=0; xmax=50; ymin=198; ymax=275; 
xy=[xmin xmax ymin ymax]; xy0=[4 18 ymin ymax]; 
xl='high cloud amount over large-scale ascent region(%)'; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_up_avg_temp_low'; xmin=0; xmax=70; ymin=265; ymax=305; 
xy=[xmin xmax ymin ymax]; xy0=[0 8 ymin ymax]; opt=1;
xl='low cloud amount over large-scale ascent region (%)'; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
xy=[0 70 0 6]; ydir='normal'; plot_a_b_height; %printit(visfig,figpath,expn,vname);

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_ice_up_avg_temp'; k1=15; k2=79; c=100;
a.v0=v0.qa_ice.up.avg(k1:k2)*c; a.c0=c0.qa_ice.up.avg(k1:k2)*c; a.w0=w0.qa_ice.up.avg(k1:k2)*c; 
a.v1=v1.qa_ice.up.avg(k1:k2)*c; a.c1=c1.qa_ice.up.avg(k1:k2)*c; a.w1=w1.qa_ice.up.avg(k1:k2)*c; 
a.v2=v2.qa_ice.up.avg(k1:k2)*c; a.c2=c2.qa_ice.up.avg(k1:k2)*c; a.w2=w2.qa_ice.up.avg(k1:k2)*c; 
a.v3=v3.qa_ice.up.avg(k1:k2)*c; a.c3=c3.qa_ice.up.avg(k1:k2)*c; a.w3=w3.qa_ice.up.avg(k1:k2)*c; 
a.v4=v4.qa_ice.up.avg(k1:k2)*c; a.c4=c4.qa_ice.up.avg(k1:k2)*c; a.w4=w4.qa_ice.up.avg(k1:k2)*c; 
a.v5=v5.qa_ice.up.avg(k1:k2)*c; a.c5=c5.qa_ice.up.avg(k1:k2)*c; a.w5=w5.qa_ice.up.avg(k1:k2)*c; 
a.v6=v6.qa_ice.up.avg(k1:k2)*c; a.c6=c6.qa_ice.up.avg(k1:k2)*c; a.w6=w6.qa_ice.up.avg(k1:k2)*c; 
yl='temperature (K)'; ydir='reverse'; opt=4; do_ax1_only=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_ice_up_avg_temp_high'; xmin=0; xmax=50; ymin=198; ymax=275; 
xy=[xmin xmax ymin ymax]; xy0=[4 18 ymin ymax]; ydir='reverse'; 
xl='high cloud amount over large-scale ascent region(%)'; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_ice_up_avg_height_high'; xy=[0 50 4 18]; ydir='normal'; 
plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_ice_dn_avg_temp'; k1=15; k2=79; c=100;
a.v0=v0.qa_ice.dn.avg(k1:k2)*c; a.c0=c0.qa_ice.dn.avg(k1:k2)*c; a.w0=w0.qa_ice.dn.avg(k1:k2)*c; 
a.v1=v1.qa_ice.dn.avg(k1:k2)*c; a.c1=c1.qa_ice.dn.avg(k1:k2)*c; a.w1=w1.qa_ice.dn.avg(k1:k2)*c; 
a.v2=v2.qa_ice.dn.avg(k1:k2)*c; a.c2=c2.qa_ice.dn.avg(k1:k2)*c; a.w2=w2.qa_ice.dn.avg(k1:k2)*c; 
a.v3=v3.qa_ice.dn.avg(k1:k2)*c; a.c3=c3.qa_ice.dn.avg(k1:k2)*c; a.w3=w3.qa_ice.dn.avg(k1:k2)*c; 
a.v4=v4.qa_ice.dn.avg(k1:k2)*c; a.c4=c4.qa_ice.dn.avg(k1:k2)*c; a.w4=w4.qa_ice.dn.avg(k1:k2)*c; 
a.v5=v5.qa_ice.dn.avg(k1:k2)*c; a.c5=c5.qa_ice.dn.avg(k1:k2)*c; a.w5=w5.qa_ice.dn.avg(k1:k2)*c; 
a.v6=v6.qa_ice.dn.avg(k1:k2)*c; a.c6=c6.qa_ice.dn.avg(k1:k2)*c; a.w6=w6.qa_ice.dn.avg(k1:k2)*c; 
yl='temperature (K)'; ydir='reverse'; opt=4; do_ax1_only=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_ice_dn_avg_temp_high'; xmin=0; xmax=20; ymin=198; ymax=275; 
xy=[xmin xmax ymin ymax]; xy0=[4 18 ymin ymax]; ydir='reverse'; 
xl='high cloud amount over large-scale subsidence region(%)'; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_ice_dn_avg_height_high'; xy=[0 20 4 18]; ydir='normal'; 
plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_ice_dn_avg_pres_high'; xy=[0 20 70 700];
plot_a_b_pres; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qc_avg_temp'; k1=15; k2=79; c=1000; %c=1E6;for mg/m3
a.v0=v0.qc.all.avg(k1:k2)*c; a.c0=c0.qc.all.avg(k1:k2)*c; a.w0=w0.qc.all.avg(k1:k2)*c; 
a.v1=v1.qc.all.avg(k1:k2)*c; a.c1=c1.qc.all.avg(k1:k2)*c; a.w1=w1.qc.all.avg(k1:k2)*c; 
a.v2=v2.qc.all.avg(k1:k2)*c; a.c2=c2.qc.all.avg(k1:k2)*c; a.w2=w2.qc.all.avg(k1:k2)*c; 
a.v3=v3.qc.all.avg(k1:k2)*c; a.c3=c3.qc.all.avg(k1:k2)*c; a.w3=w3.qc.all.avg(k1:k2)*c; 
a.v4=v4.qc.all.avg(k1:k2)*c; a.c4=c4.qc.all.avg(k1:k2)*c; a.w4=w4.qc.all.avg(k1:k2)*c; 
a.v5=v5.qc.all.avg(k1:k2)*c; a.c5=c5.qc.all.avg(k1:k2)*c; a.w5=w5.qc.all.avg(k1:k2)*c; 
a.v6=v6.qc.all.avg(k1:k2)*c; a.c6=c6.qc.all.avg(k1:k2)*c; a.w6=w6.qc.all.avg(k1:k2)*c; 
xl='mean cloud ice (g/kg)'; yl='temperature (K)'; ydir='reverse'; opt=0;
xmin=0; xmax=0.1; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qc_dn_avg_temp'; k1=15; k2=79; c=1000; %c=1E6;for mg/m3
a.v0=v0.qc.dn.avg(k1:k2)*c; a.c0=c0.qc.dn.avg(k1:k2)*c; a.w0=w0.qc.dn.avg(k1:k2)*c; 
a.v1=v1.qc.dn.avg(k1:k2)*c; a.c1=c1.qc.dn.avg(k1:k2)*c; a.w1=w1.qc.dn.avg(k1:k2)*c; 
a.v2=v2.qc.dn.avg(k1:k2)*c; a.c2=c2.qc.dn.avg(k1:k2)*c; a.w2=w2.qc.dn.avg(k1:k2)*c; 
a.v3=v3.qc.dn.avg(k1:k2)*c; a.c3=c3.qc.dn.avg(k1:k2)*c; a.w3=w3.qc.dn.avg(k1:k2)*c; 
a.v4=v4.qc.dn.avg(k1:k2)*c; a.c4=c4.qc.dn.avg(k1:k2)*c; a.w4=w4.qc.dn.avg(k1:k2)*c; 
a.v5=v5.qc.dn.avg(k1:k2)*c; a.c5=c5.qc.dn.avg(k1:k2)*c; a.w5=w5.qc.dn.avg(k1:k2)*c; 
a.v6=v6.qc.dn.avg(k1:k2)*c; a.c6=c6.qc.dn.avg(k1:k2)*c; a.w6=w6.qc.dn.avg(k1:k2)*c; 
xl='mean cloud ice (g/kg)'; yl='temperature (K)'; ydir='reverse'; opt=0;
xmin=0; xmax=0.1; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qc_cup_avg_temp'; k1=15; k2=79; c=1000; %c=1E6;
a.v0=v0.qc.cup.avg(k1:k2)*c; a.c0=c0.qc.cup.avg(k1:k2)*c; a.w0=w0.qc.cup.avg(k1:k2)*c; 
a.v1=v1.qc.cup.avg(k1:k2)*c; a.c1=c1.qc.cup.avg(k1:k2)*c; a.w1=w1.qc.cup.avg(k1:k2)*c; 
a.v2=v2.qc.cup.avg(k1:k2)*c; a.c2=c2.qc.cup.avg(k1:k2)*c; a.w2=w2.qc.cup.avg(k1:k2)*c; 
a.v3=v3.qc.cup.avg(k1:k2)*c; a.c3=c3.qc.cup.avg(k1:k2)*c; a.w3=w3.qc.cup.avg(k1:k2)*c; 
a.v4=v4.qc.cup.avg(k1:k2)*c; a.c4=c4.qc.cup.avg(k1:k2)*c; a.w4=w4.qc.cup.avg(k1:k2)*c; 
a.v5=v5.qc.cup.avg(k1:k2)*c; a.c5=c5.qc.cup.avg(k1:k2)*c; a.w5=w5.qc.cup.avg(k1:k2)*c; 
a.v6=v6.qc.cup.avg(k1:k2)*c; a.c6=c6.qc.cup.avg(k1:k2)*c; a.w6=w6.qc.cup.avg(k1:k2)*c; 
xl='mean cloud ice (g/kg)'; yl='temperature (K)'; ydir='reverse'; opt=0;
xmin=0; xmax=0.2; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qi_avg_temp'; k1=15; k2=79; c=1000;%1E6;
a.v0=v0.qi.all.avg(k1:k2)*c; a.c0=c0.qi.all.avg(k1:k2)*c; a.w0=w0.qi.all.avg(k1:k2)*c; 
a.v1=v1.qi.all.avg(k1:k2)*c; a.c1=c1.qi.all.avg(k1:k2)*c; a.w1=w1.qi.all.avg(k1:k2)*c; 
a.v2=v2.qi.all.avg(k1:k2)*c; a.c2=c2.qi.all.avg(k1:k2)*c; a.w2=w2.qi.all.avg(k1:k2)*c; 
a.v3=v3.qi.all.avg(k1:k2)*c; a.c3=c3.qi.all.avg(k1:k2)*c; a.w3=w3.qi.all.avg(k1:k2)*c; 
a.v4=v4.qi.all.avg(k1:k2)*c; a.c4=c4.qi.all.avg(k1:k2)*c; a.w4=w4.qi.all.avg(k1:k2)*c; 
a.v5=v5.qi.all.avg(k1:k2)*c; a.c5=c5.qi.all.avg(k1:k2)*c; a.w5=w5.qi.all.avg(k1:k2)*c; 
a.v6=v6.qi.all.avg(k1:k2)*c; a.c6=c6.qi.all.avg(k1:k2)*c; a.w6=w6.qi.all.avg(k1:k2)*c; 
xl='mean cloud ice (g/kg)'; yl='temperature (K)'; ydir='reverse'; opt=4;
xmin=0; xmax=0.02; ymin=198; ymax=275; xy=[xmin xmax ymin ymax]; xy0=[4 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ql_avg_temp'; k1=15; k2=79; c=1000;%1E6;
a.v0=v0.ql.all.avg(k1:k2)*c; a.c0=c0.ql.all.avg(k1:k2)*c; a.w0=w0.ql.all.avg(k1:k2)*c; 
a.v1=v1.ql.all.avg(k1:k2)*c; a.c1=c1.ql.all.avg(k1:k2)*c; a.w1=w1.ql.all.avg(k1:k2)*c; 
a.v2=v2.ql.all.avg(k1:k2)*c; a.c2=c2.ql.all.avg(k1:k2)*c; a.w2=w2.ql.all.avg(k1:k2)*c; 
a.v3=v3.ql.all.avg(k1:k2)*c; a.c3=c3.ql.all.avg(k1:k2)*c; a.w3=w3.ql.all.avg(k1:k2)*c; 
a.v4=v4.ql.all.avg(k1:k2)*c; a.c4=c4.ql.all.avg(k1:k2)*c; a.w4=w4.ql.all.avg(k1:k2)*c; 
a.v5=v5.ql.all.avg(k1:k2)*c; a.c5=c5.ql.all.avg(k1:k2)*c; a.w5=w5.ql.all.avg(k1:k2)*c; 
a.v6=v6.ql.all.avg(k1:k2)*c; a.c6=c6.ql.all.avg(k1:k2)*c; a.w6=w6.ql.all.avg(k1:k2)*c; 
xl='mean cloud liquid (g/kg)'; yl='temperature (K)'; ydir='reverse'; opt=1;
xmin=0; xmax=0.1; ymin=265; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 8 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh_avg_temp'; k1=13; k2=79;
a.v0=v0.rh.all.avg(k1:k2); a.c0=c0.rh.all.avg(k1:k2); a.w0=w0.rh.all.avg(k1:k2); 
a.v1=v1.rh.all.avg(k1:k2); a.c1=c1.rh.all.avg(k1:k2); a.w1=w1.rh.all.avg(k1:k2); 
a.v2=v2.rh.all.avg(k1:k2); a.c2=c2.rh.all.avg(k1:k2); a.w2=w2.rh.all.avg(k1:k2); 
a.v3=v3.rh.all.avg(k1:k2); a.c3=c3.rh.all.avg(k1:k2); a.w3=w3.rh.all.avg(k1:k2); 
a.v4=v4.rh.all.avg(k1:k2); a.c4=c4.rh.all.avg(k1:k2); a.w4=w4.rh.all.avg(k1:k2); 
a.v5=v5.rh.all.avg(k1:k2); a.c5=c5.rh.all.avg(k1:k2); a.w5=w5.rh.all.avg(k1:k2); 
a.v6=v6.rh.all.avg(k1:k2); a.c6=c6.rh.all.avg(k1:k2); a.w6=w6.rh.all.avg(k1:k2); 
xl='RH (%)'; yl='temperature (K)'; ydir='reverse'; opt=0;
xmin=0; xmax=100; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
vname='rh_avg_height'; xy=[0 100 0 20]; ydir='normal'; opt=0;
plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh_dn_avg_temp'; k1=15; k2=79;
a.v0=v0.rh.dn.avg(k1:k2); a.c0=c0.rh.dn.avg(k1:k2); a.w0=w0.rh.dn.avg(k1:k2); 
a.v1=v1.rh.dn.avg(k1:k2); a.c1=c1.rh.dn.avg(k1:k2); a.w1=w1.rh.dn.avg(k1:k2); 
a.v2=v2.rh.dn.avg(k1:k2); a.c2=c2.rh.dn.avg(k1:k2); a.w2=w2.rh.dn.avg(k1:k2); 
a.v3=v3.rh.dn.avg(k1:k2); a.c3=c3.rh.dn.avg(k1:k2); a.w3=w3.rh.dn.avg(k1:k2); 
a.v4=v4.rh.dn.avg(k1:k2); a.c4=c4.rh.dn.avg(k1:k2); a.w4=w4.rh.dn.avg(k1:k2); 
a.v5=v5.rh.dn.avg(k1:k2); a.c5=c5.rh.dn.avg(k1:k2); a.w5=w5.rh.dn.avg(k1:k2); 
a.v6=v6.rh.dn.avg(k1:k2); a.c6=c6.rh.dn.avg(k1:k2); a.w6=w6.rh.dn.avg(k1:k2); 
xl='RH averaged over large-scale subsidence region (%)'; yl='temperature (K)'; ydir='reverse'; opt=1;
xmin=0; xmax=100; ymin=270; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh_up_avg_temp'; k1=15; k2=79;
a.v0=v0.rh.up.avg(k1:k2); a.c0=c0.rh.up.avg(k1:k2); a.w0=w0.rh.up.avg(k1:k2); 
a.v1=v1.rh.up.avg(k1:k2); a.c1=c1.rh.up.avg(k1:k2); a.w1=w1.rh.up.avg(k1:k2); 
a.v2=v2.rh.up.avg(k1:k2); a.c2=c2.rh.up.avg(k1:k2); a.w2=w2.rh.up.avg(k1:k2); 
a.v3=v3.rh.up.avg(k1:k2); a.c3=c3.rh.up.avg(k1:k2); a.w3=w3.rh.up.avg(k1:k2); 
a.v4=v4.rh.up.avg(k1:k2); a.c4=c4.rh.up.avg(k1:k2); a.w4=w4.rh.up.avg(k1:k2); 
a.v5=v5.rh.up.avg(k1:k2); a.c5=c5.rh.up.avg(k1:k2); a.w5=w5.rh.up.avg(k1:k2); 
a.v6=v6.rh.up.avg(k1:k2); a.c6=c6.rh.up.avg(k1:k2); a.w6=w6.rh.up.avg(k1:k2); 
xl='RH averaged over large-scale ascent region (%)'; yl='temperature (K)'; ydir='reverse'; opt=0;
xmin=0; xmax=100; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qr_avg_temp'; k1=18; k2=79; c=1000;
a.v0=v0.qr.all.avg(k1:k2)*c; a.c0=c0.qr.all.avg(k1:k2)*c; a.w0=w0.qr.all.avg(k1:k2)*c; 
a.v1=v1.qr.all.avg(k1:k2)*c; a.c1=c1.qr.all.avg(k1:k2)*c; a.w1=w1.qr.all.avg(k1:k2)*c; 
a.v2=v2.qr.all.avg(k1:k2)*c; a.c2=c2.qr.all.avg(k1:k2)*c; a.w2=w2.qr.all.avg(k1:k2)*c; 
a.v3=v3.qr.all.avg(k1:k2)*c; a.c3=c3.qr.all.avg(k1:k2)*c; a.w3=w3.qr.all.avg(k1:k2)*c; 
a.v4=v4.qr.all.avg(k1:k2)*c; a.c4=c4.qr.all.avg(k1:k2)*c; a.w4=w4.qr.all.avg(k1:k2)*c; 
a.v5=v5.qr.all.avg(k1:k2)*c; a.c5=c5.qr.all.avg(k1:k2)*c; a.w5=w5.qr.all.avg(k1:k2)*c; 
a.v6=v6.qr.all.avg(k1:k2)*c; a.c6=c6.qr.all.avg(k1:k2)*c; a.w6=w6.qr.all.avg(k1:k2)*c; 
xl='rain (g/kg)'; yl='temperature (K)'; ydir='reverse'; opt=4;
xmin=0; xmax=0.015; ymin=265; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 8 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qs_avg_temp'; k1=18; k2=79; c=1000;
a.v0=v0.qs.all.avg(k1:k2)*c; a.c0=c0.qs.all.avg(k1:k2)*c; a.w0=w0.qs.all.avg(k1:k2)*c; 
a.v1=v1.qs.all.avg(k1:k2)*c; a.c1=c1.qs.all.avg(k1:k2)*c; a.w1=w1.qs.all.avg(k1:k2)*c; 
a.v2=v2.qs.all.avg(k1:k2)*c; a.c2=c2.qs.all.avg(k1:k2)*c; a.w2=w2.qs.all.avg(k1:k2)*c; 
a.v3=v3.qs.all.avg(k1:k2)*c; a.c3=c3.qs.all.avg(k1:k2)*c; a.w3=w3.qs.all.avg(k1:k2)*c; 
a.v4=v4.qs.all.avg(k1:k2)*c; a.c4=c4.qs.all.avg(k1:k2)*c; a.w4=w4.qs.all.avg(k1:k2)*c; 
a.v5=v5.qs.all.avg(k1:k2)*c; a.c5=c5.qs.all.avg(k1:k2)*c; a.w5=w5.qs.all.avg(k1:k2)*c; 
a.v6=v6.qs.all.avg(k1:k2)*c; a.c6=c6.qs.all.avg(k1:k2)*c; a.w6=w6.qs.all.avg(k1:k2)*c; 
xl='snow (g/kg)'; yl='temperature (K)'; ydir='reverse'; opt=4;
xmin=0; xmax=0.01; ymin=198; ymax=275; xy=[xmin xmax ymin ymax]; xy0=[4 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qg_avg_temp'; k1=18; k2=79; c=1000;
a.v0=v0.qg.all.avg(k1:k2)*c; a.c0=c0.qg.all.avg(k1:k2)*c; a.w0=w0.qg.all.avg(k1:k2)*c; 
a.v1=v1.qg.all.avg(k1:k2)*c; a.c1=c1.qg.all.avg(k1:k2)*c; a.w1=w1.qg.all.avg(k1:k2)*c; 
a.v2=v2.qg.all.avg(k1:k2)*c; a.c2=c2.qg.all.avg(k1:k2)*c; a.w2=w2.qg.all.avg(k1:k2)*c; 
a.v3=v3.qg.all.avg(k1:k2)*c; a.c3=c3.qg.all.avg(k1:k2)*c; a.w3=w3.qg.all.avg(k1:k2)*c; 
a.v4=v4.qg.all.avg(k1:k2)*c; a.c4=c4.qg.all.avg(k1:k2)*c; a.w4=w4.qg.all.avg(k1:k2)*c; 
a.v5=v5.qg.all.avg(k1:k2)*c; a.c5=c5.qg.all.avg(k1:k2)*c; a.w5=w5.qg.all.avg(k1:k2)*c; 
a.v6=v6.qg.all.avg(k1:k2)*c; a.c6=c6.qg.all.avg(k1:k2)*c; a.w6=w6.qg.all.avg(k1:k2)*c; 
xl='graupel (g/kg)'; yl='temperature (K)'; ydir='reverse'; opt=4;
xmin=0; xmax=0.02; ymin=198; ymax=275; xy=[xmin xmax ymin ymax]; xy0=[4 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mse_avg_temp'; k1=18; k2=79; c=1/CPD;
a.v0=v0.mse.all.avg(k1:k2)*c; a.c0=c0.mse.all.avg(k1:k2)*c; a.w0=w0.mse.all.avg(k1:k2)*c; 
a.v1=v1.mse.all.avg(k1:k2)*c; a.c1=c1.mse.all.avg(k1:k2)*c; a.w1=w1.mse.all.avg(k1:k2)*c; 
a.v2=v2.mse.all.avg(k1:k2)*c; a.c2=c2.mse.all.avg(k1:k2)*c; a.w2=w2.mse.all.avg(k1:k2)*c; 
a.v3=v3.mse.all.avg(k1:k2)*c; a.c3=c3.mse.all.avg(k1:k2)*c; a.w3=w3.mse.all.avg(k1:k2)*c; 
a.v4=v4.mse.all.avg(k1:k2)*c; a.c4=c4.mse.all.avg(k1:k2)*c; a.w4=w4.mse.all.avg(k1:k2)*c; 
a.v5=v5.mse.all.avg(k1:k2)*c; a.c5=c5.mse.all.avg(k1:k2)*c; a.w5=w5.mse.all.avg(k1:k2)*c; 
a.v6=v6.mse.all.avg(k1:k2)*c; a.c6=c6.mse.all.avg(k1:k2)*c; a.w6=w6.mse.all.avg(k1:k2)*c; 
xl='MSE/C_p (K)'; yl='temperature (K)'; ydir='reverse'; opt=4;
xmin=302; xmax=366; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mse_up_avg_temp'; k1=18; k2=79; c=1/CPD;
a.v0=v0.mse.up.avg(k1:k2)*c; a.c0=c0.mse.up.avg(k1:k2)*c; a.w0=w0.mse.up.avg(k1:k2)*c; 
a.v1=v1.mse.up.avg(k1:k2)*c; a.c1=c1.mse.up.avg(k1:k2)*c; a.w1=w1.mse.up.avg(k1:k2)*c; 
a.v2=v2.mse.up.avg(k1:k2)*c; a.c2=c2.mse.up.avg(k1:k2)*c; a.w2=w2.mse.up.avg(k1:k2)*c; 
a.v3=v3.mse.up.avg(k1:k2)*c; a.c3=c3.mse.up.avg(k1:k2)*c; a.w3=w3.mse.up.avg(k1:k2)*c; 
a.v4=v4.mse.up.avg(k1:k2)*c; a.c4=c4.mse.up.avg(k1:k2)*c; a.w4=w4.mse.up.avg(k1:k2)*c; 
a.v5=v5.mse.up.avg(k1:k2)*c; a.c5=c5.mse.up.avg(k1:k2)*c; a.w5=w5.mse.up.avg(k1:k2)*c; 
a.v6=v6.mse.up.avg(k1:k2)*c; a.c6=c6.mse.up.avg(k1:k2)*c; a.w6=w6.mse.up.avg(k1:k2)*c; 
xl='MSE/C_p (K)'; yl='temperature (K)'; ydir='reverse'; opt=2;
xmin=302; xmax=366; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mse_dn_avg_temp'; k1=18; k2=79; c=1/CPD;
a.v0=v0.mse.dn.avg(k1:k2)*c; a.c0=c0.mse.dn.avg(k1:k2)*c; a.w0=w0.mse.dn.avg(k1:k2)*c; 
a.v1=v1.mse.dn.avg(k1:k2)*c; a.c1=c1.mse.dn.avg(k1:k2)*c; a.w1=w1.mse.dn.avg(k1:k2)*c; 
a.v2=v2.mse.dn.avg(k1:k2)*c; a.c2=c2.mse.dn.avg(k1:k2)*c; a.w2=w2.mse.dn.avg(k1:k2)*c; 
a.v3=v3.mse.dn.avg(k1:k2)*c; a.c3=c3.mse.dn.avg(k1:k2)*c; a.w3=w3.mse.dn.avg(k1:k2)*c; 
a.v4=v4.mse.dn.avg(k1:k2)*c; a.c4=c4.mse.dn.avg(k1:k2)*c; a.w4=w4.mse.dn.avg(k1:k2)*c; 
a.v5=v5.mse.dn.avg(k1:k2)*c; a.c5=c5.mse.dn.avg(k1:k2)*c; a.w5=w5.mse.dn.avg(k1:k2)*c; 
a.v6=v6.mse.dn.avg(k1:k2)*c; a.c6=c6.mse.dn.avg(k1:k2)*c; a.w6=w6.mse.dn.avg(k1:k2)*c; 
xl='MSE/C_p (K)'; yl='temperature (K)'; ydir='reverse'; opt=4;
xmin=302; xmax=366; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dse_avg_temp'; k1=18; k2=79; c=1/CPD;
a.v0=v0.dse.all.avg(k1:k2)*c; a.c0=c0.dse.all.avg(k1:k2)*c; a.w0=w0.dse.all.avg(k1:k2)*c; 
a.v1=v1.dse.all.avg(k1:k2)*c; a.c1=c1.dse.all.avg(k1:k2)*c; a.w1=w1.dse.all.avg(k1:k2)*c; 
a.v2=v2.dse.all.avg(k1:k2)*c; a.c2=c2.dse.all.avg(k1:k2)*c; a.w2=w2.dse.all.avg(k1:k2)*c; 
a.v3=v3.dse.all.avg(k1:k2)*c; a.c3=c3.dse.all.avg(k1:k2)*c; a.w3=w3.dse.all.avg(k1:k2)*c; 
a.v4=v4.dse.all.avg(k1:k2)*c; a.c4=c4.dse.all.avg(k1:k2)*c; a.w4=w4.dse.all.avg(k1:k2)*c; 
a.v5=v5.dse.all.avg(k1:k2)*c; a.c5=c5.dse.all.avg(k1:k2)*c; a.w5=w5.dse.all.avg(k1:k2)*c; 
a.v6=v6.dse.all.avg(k1:k2)*c; a.c6=c6.dse.all.avg(k1:k2)*c; a.w6=w6.dse.all.avg(k1:k2)*c; 
xl='DSE/C_p (K)'; yl='temperature (K)'; ydir='reverse'; opt=4;
xmin=290; xmax=365; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dse_up_avg_temp'; k1=18; k2=79; c=1/CPD;
a.v0=v0.dse.up.avg(k1:k2)*c; a.c0=c0.dse.up.avg(k1:k2)*c; a.w0=w0.dse.up.avg(k1:k2)*c; 
a.v1=v1.dse.up.avg(k1:k2)*c; a.c1=c1.dse.up.avg(k1:k2)*c; a.w1=w1.dse.up.avg(k1:k2)*c; 
a.v2=v2.dse.up.avg(k1:k2)*c; a.c2=c2.dse.up.avg(k1:k2)*c; a.w2=w2.dse.up.avg(k1:k2)*c; 
a.v3=v3.dse.up.avg(k1:k2)*c; a.c3=c3.dse.up.avg(k1:k2)*c; a.w3=w3.dse.up.avg(k1:k2)*c; 
a.v4=v4.dse.up.avg(k1:k2)*c; a.c4=c4.dse.up.avg(k1:k2)*c; a.w4=w4.dse.up.avg(k1:k2)*c; 
a.v5=v5.dse.up.avg(k1:k2)*c; a.c5=c5.dse.up.avg(k1:k2)*c; a.w5=w5.dse.up.avg(k1:k2)*c; 
a.v6=v6.dse.up.avg(k1:k2)*c; a.c6=c6.dse.up.avg(k1:k2)*c; a.w6=w6.dse.up.avg(k1:k2)*c; 
xl='DSE/C_p in large-scale acent region (K)'; yl='temperature (K)'; ydir='reverse'; opt=4;
xmin=290; xmax=365; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dse_dn_avg_temp'; k1=18; k2=79; c=1/CPD;
a.v0=v0.dse.dn.avg(k1:k2)*c; a.c0=c0.dse.dn.avg(k1:k2)*c; a.w0=w0.dse.dn.avg(k1:k2)*c; 
a.v1=v1.dse.dn.avg(k1:k2)*c; a.c1=c1.dse.dn.avg(k1:k2)*c; a.w1=w1.dse.dn.avg(k1:k2)*c; 
a.v2=v2.dse.dn.avg(k1:k2)*c; a.c2=c2.dse.dn.avg(k1:k2)*c; a.w2=w2.dse.dn.avg(k1:k2)*c; 
a.v3=v3.dse.dn.avg(k1:k2)*c; a.c3=c3.dse.dn.avg(k1:k2)*c; a.w3=w3.dse.dn.avg(k1:k2)*c; 
a.v4=v4.dse.dn.avg(k1:k2)*c; a.c4=c4.dse.dn.avg(k1:k2)*c; a.w4=w4.dse.dn.avg(k1:k2)*c; 
a.v5=v5.dse.dn.avg(k1:k2)*c; a.c5=c5.dse.dn.avg(k1:k2)*c; a.w5=w5.dse.dn.avg(k1:k2)*c; 
a.v6=v6.dse.dn.avg(k1:k2)*c; a.c6=c6.dse.dn.avg(k1:k2)*c; a.w6=w6.dse.dn.avg(k1:k2)*c; 
xl='DSE/C_p in large-scale subsidence region (K)'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dse_dn_avg_temp'; ydir='reverse'; opt=4; do_ax2=0;
xmin=290; xmax=340; ymin=270; ymax=305; 
xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dse_dn_avg_height_low'; xy=[291 315 0 2]; ydir='normal';opt=4;
plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh_dn_avg_temp'; k1=18; k2=79; c=1;
a.v0=v0.rh.dn.avg(k1:k2)*c; a.c0=c0.rh.dn.avg(k1:k2)*c; a.w0=w0.rh.dn.avg(k1:k2)*c; 
a.v1=v1.rh.dn.avg(k1:k2)*c; a.c1=c1.rh.dn.avg(k1:k2)*c; a.w1=w1.rh.dn.avg(k1:k2)*c; 
a.v2=v2.rh.dn.avg(k1:k2)*c; a.c2=c2.rh.dn.avg(k1:k2)*c; a.w2=w2.rh.dn.avg(k1:k2)*c; 
a.v3=v3.rh.dn.avg(k1:k2)*c; a.c3=c3.rh.dn.avg(k1:k2)*c; a.w3=w3.rh.dn.avg(k1:k2)*c; 
a.v4=v4.rh.dn.avg(k1:k2)*c; a.c4=c4.rh.dn.avg(k1:k2)*c; a.w4=w4.rh.dn.avg(k1:k2)*c; 
a.v5=v5.rh.dn.avg(k1:k2)*c; a.c5=c5.rh.dn.avg(k1:k2)*c; a.w5=w5.rh.dn.avg(k1:k2)*c; 
a.v6=v6.rh.dn.avg(k1:k2)*c; a.c6=c6.rh.dn.avg(k1:k2)*c; a.w6=w6.rh.dn.avg(k1:k2)*c; 
xl='RH in large-scale subsidence region (%)'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh_dn_avg_height_low'; xy=[40 100 0 2]; ydir='normal';opt=1;
plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh_dn_avg_temp'; ydir='reverse'; opt=4; 
xmin=290; xmax=365; ymin=198; ymax=305; 
xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_dn_avg_temp'; k1=18; k2=79; c=8640;
a.v0=v0.wa.dn.avg(k1:k2)*c; a.c0=c0.wa.dn.avg(k1:k2)*c; a.w0=w0.wa.dn.avg(k1:k2)*c; 
a.v1=v1.wa.dn.avg(k1:k2)*c; a.c1=c1.wa.dn.avg(k1:k2)*c; a.w1=w1.wa.dn.avg(k1:k2)*c; 
a.v2=v2.wa.dn.avg(k1:k2)*c; a.c2=c2.wa.dn.avg(k1:k2)*c; a.w2=w2.wa.dn.avg(k1:k2)*c; 
a.v3=v3.wa.dn.avg(k1:k2)*c; a.c3=c3.wa.dn.avg(k1:k2)*c; a.w3=w3.wa.dn.avg(k1:k2)*c; 
a.v4=v4.wa.dn.avg(k1:k2)*c; a.c4=c4.wa.dn.avg(k1:k2)*c; a.w4=w4.wa.dn.avg(k1:k2)*c; 
a.v5=v5.wa.dn.avg(k1:k2)*c; a.c5=c5.wa.dn.avg(k1:k2)*c; a.w5=w5.wa.dn.avg(k1:k2)*c; 
a.v6=v6.wa.dn.avg(k1:k2)*c; a.c6=c6.wa.dn.avg(k1:k2)*c; a.w6=w6.wa.dn.avg(k1:k2)*c; 
%%%%%%%%%%%%%%%%%%%%%%%%%%
xl='Vertical velocity in large-scale subsidence region (%)'; 
vname='wa_dn_avg_temp'; ydir='reverse'; opt=3; 
xmin=-70; xmax=0; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_dn_avg_height'; xy=[-70 0 0 18]; ydir='normal';opt=3;
plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='om_dn_avg_temp'; k1=18; k2=79; c=864;
a.v0=v0.om.dn.avg(k1:k2)*c; a.c0=c0.om.dn.avg(k1:k2)*c; a.w0=w0.om.dn.avg(k1:k2)*c; 
a.v1=v1.om.dn.avg(k1:k2)*c; a.c1=c1.om.dn.avg(k1:k2)*c; a.w1=w1.om.dn.avg(k1:k2)*c; 
a.v2=v2.om.dn.avg(k1:k2)*c; a.c2=c2.om.dn.avg(k1:k2)*c; a.w2=w2.om.dn.avg(k1:k2)*c; 
a.v3=v3.om.dn.avg(k1:k2)*c; a.c3=c3.om.dn.avg(k1:k2)*c; a.w3=w3.om.dn.avg(k1:k2)*c; 
a.v4=v4.om.dn.avg(k1:k2)*c; a.c4=c4.om.dn.avg(k1:k2)*c; a.w4=w4.om.dn.avg(k1:k2)*c; 
a.v5=v5.om.dn.avg(k1:k2)*c; a.c5=c5.om.dn.avg(k1:k2)*c; a.w5=w5.om.dn.avg(k1:k2)*c; 
a.v6=v6.om.dn.avg(k1:k2)*c; a.c6=c6.om.dn.avg(k1:k2)*c; a.w6=w6.om.dn.avg(k1:k2)*c; 
%%%%%%%%%%%%%%%%%%%%%%%%%%
xl='\omega in large-scale subsidence region (hPa/day)'; 
vname='om_dn_avg_temp'; ydir='reverse'; opt=1; 
xmin=0; xmax=60; ymin=270; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='om_dn_avg_height'; xy=[0 70 0 18]; ydir='normal';opt=4;
plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='thv_dn_avg_temp'; k1=18; k2=79; c=1;
a.v0=v0.thv.dn.avg(k1:k2)*c; a.c0=c0.thv.dn.avg(k1:k2)*c; a.w0=w0.thv.dn.avg(k1:k2)*c; 
a.v1=v1.thv.dn.avg(k1:k2)*c; a.c1=c1.thv.dn.avg(k1:k2)*c; a.w1=w1.thv.dn.avg(k1:k2)*c; 
a.v2=v2.thv.dn.avg(k1:k2)*c; a.c2=c2.thv.dn.avg(k1:k2)*c; a.w2=w2.thv.dn.avg(k1:k2)*c; 
a.v3=v3.thv.dn.avg(k1:k2)*c; a.c3=c3.thv.dn.avg(k1:k2)*c; a.w3=w3.thv.dn.avg(k1:k2)*c; 
a.v4=v4.thv.dn.avg(k1:k2)*c; a.c4=c4.thv.dn.avg(k1:k2)*c; a.w4=w4.thv.dn.avg(k1:k2)*c; 
a.v5=v5.thv.dn.avg(k1:k2)*c; a.c5=c5.thv.dn.avg(k1:k2)*c; a.w5=w5.thv.dn.avg(k1:k2)*c; 
a.v6=v6.thv.dn.avg(k1:k2)*c; a.c6=c6.thv.dn.avg(k1:k2)*c; a.w6=w6.thv.dn.avg(k1:k2)*c; 
%%%%%%%%%%%%%%%%%%%%%%%%%%
xl='\theta_v in large-scale subsidence region (%)'; 
vname='thv_dn_avg_temp'; ydir='reverse'; opt=1; 
xmin=300; xmax=200; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='om_dn_avg_height'; xy=[-70 0 0 18]; ydir='normal';opt=3;
plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dom_dn_avg_temp'; k1=18; k2=79; c=864;
a.v0=v0.dom_dp.dn.avg(k1:k2)*c; a.c0=c0.dom_dp.dn.avg(k1:k2)*c; a.w0=w0.dom_dp.dn.avg(k1:k2)*c; 
a.v1=v1.dom_dp.dn.avg(k1:k2)*c; a.c1=c1.dom_dp.dn.avg(k1:k2)*c; a.w1=w1.dom_dp.dn.avg(k1:k2)*c; 
a.v5=v5.dom_dp.dn.avg(k1:k2)*c; a.c5=c5.dom_dp.dn.avg(k1:k2)*c; a.w5=w5.dom_dp.dn.avg(k1:k2)*c; 
a.v6=v6.dom_dp.dn.avg(k1:k2)*c; a.c6=c6.dom_dp.dn.avg(k1:k2)*c; a.w6=w6.dom_dp.dn.avg(k1:k2)*c; 
%%%%%%%%%%%%%%%%%%%%%%%%%%
xl='\omega in large-scale subsidence region (%)'; 
vname='om_dn_avg_temp'; ydir='reverse'; opt=1; 
xmin=0; xmax=70; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='om_dn_avg_height'; xy=[-70 0 0 18]; ydir='normal';opt=3;
plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tdt_lw_dn_avg_temp'; k1=18; k2=79; c=86400;
a.v0=v0.atm.tdt_lw.dn.avg(k1:k2)*c; a.c0=c0.atm.tdt_lw.dn.avg(k1:k2)*c; a.w0=w0.atm.tdt_lw.dn.avg(k1:k2)*c; 
a.v1=v1.atm.tdt_lw.dn.avg(k1:k2)*c; a.c1=c1.atm.tdt_lw.dn.avg(k1:k2)*c; a.w1=w1.atm.tdt_lw.dn.avg(k1:k2)*c; 
a.v2=v2.atm.tdt_lw.dn.avg(k1:k2)*c; a.c2=c2.atm.tdt_lw.dn.avg(k1:k2)*c; a.w2=w2.atm.tdt_lw.dn.avg(k1:k2)*c; 
a.v3=v3.atm.tdt_lw.dn.avg(k1:k2)*c; a.c3=c3.atm.tdt_lw.dn.avg(k1:k2)*c; a.w3=w3.atm.tdt_lw.dn.avg(k1:k2)*c; 
a.v4=v4.atm.tdt_lw.dn.avg(k1:k2)*c; a.c4=c4.atm.tdt_lw.dn.avg(k1:k2)*c; a.w4=w4.atm.tdt_lw.dn.avg(k1:k2)*c; 
a.v5=v5.atm.tdt_lw.dn.avg(k1:k2)*c; a.c5=c5.atm.tdt_lw.dn.avg(k1:k2)*c; a.w5=w5.atm.tdt_lw.dn.avg(k1:k2)*c; 
a.v6=v6.atm.tdt_lw.dn.avg(k1:k2)*c; a.c6=c6.atm.tdt_lw.dn.avg(k1:k2)*c; a.w6=w6.atm.tdt_lw.dn.avg(k1:k2)*c; 
xl='LW radiative cooling in large-scale subsidence region (K/day)'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tdt_lw_dn_avg_temp'; ydir='reverse'; opt=2; 
xmin=-10; xmax=0; ymin=270; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tdt_lw_dn_avg_height_low'; xy=[-10 0 0 2]; ydir='normal';opt=3;
plot_a_b_height; printit(visfig,figpath,expn,vname);
vname='tdt_lw_dn_avg_height_high'; xy=[-10 0 0 18]; ydir='normal';opt=3;
plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tdt_rd_dn_avg_temp'; k1=18; k2=79; c=86400;
a.v0=v0.tdt_rd.dn.avg(k1:k2)*c; a.c0=c0.tdt_rd.dn.avg(k1:k2)*c; a.w0=w0.tdt_rd.dn.avg(k1:k2)*c; 
a.v1=v1.tdt_rd.dn.avg(k1:k2)*c; a.c1=c1.tdt_rd.dn.avg(k1:k2)*c; a.w1=w1.tdt_rd.dn.avg(k1:k2)*c; 
a.v2=v2.tdt_rd.dn.avg(k1:k2)*c; a.c2=c2.tdt_rd.dn.avg(k1:k2)*c; a.w2=w2.tdt_rd.dn.avg(k1:k2)*c; 
a.v3=v3.tdt_rd.dn.avg(k1:k2)*c; a.c3=c3.tdt_rd.dn.avg(k1:k2)*c; a.w3=w3.tdt_rd.dn.avg(k1:k2)*c; 
a.v4=v4.tdt_rd.dn.avg(k1:k2)*c; a.c4=c4.tdt_rd.dn.avg(k1:k2)*c; a.w4=w4.tdt_rd.dn.avg(k1:k2)*c; 
a.v5=v5.tdt_rd.dn.avg(k1:k2)*c; a.c5=c5.tdt_rd.dn.avg(k1:k2)*c; a.w5=w5.tdt_rd.dn.avg(k1:k2)*c; 
a.v6=v6.tdt_rd.dn.avg(k1:k2)*c; a.c6=c6.tdt_rd.dn.avg(k1:k2)*c; a.w6=w6.tdt_rd.dn.avg(k1:k2)*c; 
xl='radiative cooling rate in large-scale subsidence region (K/day)'; 
vname='tdt_rd_dn_avg_temp'; ydir='reverse'; opt=2; 
xmin=-8; xmax=0; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tdt_rd_dn_avg_height_low'; xy=[-8 0 0 2]; ydir='normal';opt=3;
plot_a_b_height; expn='rce_mon'; printit(visfig,figpath,expn,vname);
vname='tdt_rd_dn_avg_height_high'; xy=[-10 0 0 18]; ydir='normal';opt=3;
plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qv_avg_temp'; k1=18; k2=79; c=LV0/CPD;
a.v0=v0.qv.all.avg(k1:k2)*c; a.c0=c0.qv.all.avg(k1:k2)*c; a.w0=w0.qv.all.avg(k1:k2)*c; 
a.v1=v1.qv.all.avg(k1:k2)*c; a.c1=c1.qv.all.avg(k1:k2)*c; a.w1=w1.qv.all.avg(k1:k2)*c; 
a.v2=v2.qv.all.avg(k1:k2)*c; a.c2=c2.qv.all.avg(k1:k2)*c; a.w2=w2.qv.all.avg(k1:k2)*c; 
a.v3=v3.qv.all.avg(k1:k2)*c; a.c3=c3.qv.all.avg(k1:k2)*c; a.w3=w3.qv.all.avg(k1:k2)*c; 
a.v4=v4.qv.all.avg(k1:k2)*c; a.c4=c4.qv.all.avg(k1:k2)*c; a.w4=w4.qv.all.avg(k1:k2)*c; 
a.v5=v5.qv.all.avg(k1:k2)*c; a.c5=c5.qv.all.avg(k1:k2)*c; a.w5=w5.qv.all.avg(k1:k2)*c; 
a.v6=v6.qv.all.avg(k1:k2)*c; a.c6=c6.qv.all.avg(k1:k2)*c; a.w6=w6.qv.all.avg(k1:k2)*c; 
xl='Lq_v / C_p (K)'; yl='temperature (K)'; ydir='reverse'; opt=0;
xmin=0; xmax=50; ymin=240; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 10 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qv_up_avg_temp'; k1=18; k2=79; c=LV0/CPD;
a.v0=v0.qv.up.avg(k1:k2)*c; a.c0=c0.qv.up.avg(k1:k2)*c; a.w0=w0.qv.up.avg(k1:k2)*c; 
a.v1=v1.qv.up.avg(k1:k2)*c; a.c1=c1.qv.up.avg(k1:k2)*c; a.w1=w1.qv.up.avg(k1:k2)*c; 
a.v2=v2.qv.up.avg(k1:k2)*c; a.c2=c2.qv.up.avg(k1:k2)*c; a.w2=w2.qv.up.avg(k1:k2)*c; 
a.v3=v3.qv.up.avg(k1:k2)*c; a.c3=c3.qv.up.avg(k1:k2)*c; a.w3=w3.qv.up.avg(k1:k2)*c; 
a.v4=v4.qv.up.avg(k1:k2)*c; a.c4=c4.qv.up.avg(k1:k2)*c; a.w4=w4.qv.up.avg(k1:k2)*c; 
a.v5=v5.qv.up.avg(k1:k2)*c; a.c5=c5.qv.up.avg(k1:k2)*c; a.w5=w5.qv.up.avg(k1:k2)*c; 
a.v6=v6.qv.up.avg(k1:k2)*c; a.c6=c6.qv.up.avg(k1:k2)*c; a.w6=w6.qv.up.avg(k1:k2)*c; 
xl='Lq_v / C_p (K)'; yl='temperature (K)'; ydir='reverse'; opt=0;
xmin=0; xmax=60; ymin=240; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 10 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qv_dn_avg_temp'; k1=18; k2=79; c=1000; %LV0/CPD;
a.v0=v0.qv.dn.avg(k1:k2)*c; a.c0=c0.qv.dn.avg(k1:k2)*c; a.w0=w0.qv.dn.avg(k1:k2)*c; 
a.v1=v1.qv.dn.avg(k1:k2)*c; a.c1=c1.qv.dn.avg(k1:k2)*c; a.w1=w1.qv.dn.avg(k1:k2)*c; 
a.v2=v2.qv.dn.avg(k1:k2)*c; a.c2=c2.qv.dn.avg(k1:k2)*c; a.w2=w2.qv.dn.avg(k1:k2)*c; 
a.v3=v3.qv.dn.avg(k1:k2)*c; a.c3=c3.qv.dn.avg(k1:k2)*c; a.w3=w3.qv.dn.avg(k1:k2)*c; 
a.v4=v4.qv.dn.avg(k1:k2)*c; a.c4=c4.qv.dn.avg(k1:k2)*c; a.w4=w4.qv.dn.avg(k1:k2)*c; 
a.v5=v5.qv.dn.avg(k1:k2)*c; a.c5=c5.qv.dn.avg(k1:k2)*c; a.w5=w5.qv.dn.avg(k1:k2)*c; 
a.v6=v6.qv.dn.avg(k1:k2)*c; a.c6=c6.qv.dn.avg(k1:k2)*c; a.w6=w6.qv.dn.avg(k1:k2)*c; 
xl='q_v averaged over large-scale subsidence region (g/kg)'; yl='temperature (K)'; ydir='reverse'; opt=0; do_ax2=0;
xmin=0; xmax=20; ymin=270; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 10 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='atm.tdt_lw_dn_avg_temp'; k1=18; k2=79; c=1000; %LV0/CPD;
a.v0=v0.atm.tdt_lw.dn.avg(k1:k2)*c; a.c0=c0.atm.tdt_lw.dn.avg(k1:k2)*c; a.w0=w0.atm.tdt_lw.dn.avg(k1:k2)*c; 
a.v1=v1.atm.tdt_lw.dn.avg(k1:k2)*c; a.c1=c1.atm.tdt_lw.dn.avg(k1:k2)*c; a.w1=w1.atm.tdt_lw.dn.avg(k1:k2)*c; 
a.v2=v2.atm.tdt_lw.dn.avg(k1:k2)*c; a.c2=c2.atm.tdt_lw.dn.avg(k1:k2)*c; a.w2=w2.atm.tdt_lw.dn.avg(k1:k2)*c; 
a.v3=v3.atm.tdt_lw.dn.avg(k1:k2)*c; a.c3=c3.atm.tdt_lw.dn.avg(k1:k2)*c; a.w3=w3.atm.tdt_lw.dn.avg(k1:k2)*c; 
a.v4=v4.atm.tdt_lw.dn.avg(k1:k2)*c; a.c4=c4.atm.tdt_lw.dn.avg(k1:k2)*c; a.w4=w4.atm.tdt_lw.dn.avg(k1:k2)*c; 
a.v5=v5.atm.tdt_lw.dn.avg(k1:k2)*c; a.c5=c5.atm.tdt_lw.dn.avg(k1:k2)*c; a.w5=w5.atm.tdt_lw.dn.avg(k1:k2)*c; 
a.v6=v6.atm.tdt_lw.dn.avg(k1:k2)*c; a.c6=c6.atm.tdt_lw.dn.avg(k1:k2)*c; a.w6=w6.atm.tdt_lw.dn.avg(k1:k2)*c; 
xl='q_v averaged over large-scale subsidence region (g/kg)'; yl='temperature (K)'; ydir='reverse'; opt=0; do_ax2=0;
xmin=0; xmax=20; ymin=270; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 10 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tdt_lw_dn_sst'; k1=18; k2=79; c=1000;
pms=[ 0, 0, 1100, 900]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S0; S5=S2;
lw='LineWidth'; d1=2; d2=4; xy=[0 0.1 0 5]; vx=v0;
plot(v0.atm.tdt_lw.dn.avg*c,v0.zf,'k-', lw,d1); hold on;
plot(v5.atm.tdt_lw.dn.avg*c,v5.zf,'k:', lw,d1);
plot(v6.atm.tdt_lw.dn.avg*c,v6.zf,'k:', lw,d2); 
plot(w0.atm.tdt_lw.dn.avg*c,w0.zf,'r-', lw,d1);
plot(w5.atm.tdt_lw.dn.avg*c,w5.zf,'r:', lw,d1);
plot(w6.atm.tdt_lw.dn.avg*c,w6.zf,'r:', lw,d2);
legend('R1.5', 'R48', 'R48C','R1.5','R48','R48C',1)
yl='height z (km)';    ylabel(yl,'FontSize',fsize);
xl='cloud liquid water (g/kg)'; xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %axis(xy);
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qtdt_lin_dn_sst'; k1=18; k2=79; c=1000;
pms=[ 0, 0, 1100, 900]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S0; S5=S2;
lw='LineWidth'; d1=2; d2=4; xy=[0 0.1 0 5]; vx=v0;
plot(v0.atm.qtdt_lin.dn.avg*c,v0.zf,'k-', lw,d1); hold on;
plot(v5.atm.qtdt_lin.dn.avg*c,v5.zf,'k:', lw,d1);
plot(v6.atm.qtdt_lin.dn.avg*c,v6.zf,'k:', lw,d2); 
plot(w0.atm.qtdt_lin.dn.avg*c,w0.zf,'r-', lw,d1);
plot(w5.atm.qtdt_lin.dn.avg*c,w5.zf,'r:', lw,d1);
plot(w6.atm.qtdt_lin.dn.avg*c,w6.zf,'r:', lw,d2);
legend('R1.5', 'R48', 'R48C','R1.5','R48','R48C',1)
yl='height z (km)';    ylabel(yl,'FontSize',fsize);
xl='cloud liquid water (g/kg)'; xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %axis(xy);
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qtdt_dyn_dn_sst'; k1=18; k2=79; c=1000;
pms=[ 0, 0, 1100, 900]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S0; S5=S2;
lw='LineWidth'; d1=2; d2=4; xy=[0 0.1 0 5]; vx=v0;
plot(v0.atm.qtdt_dyn.dn.avg*c,v0.zf,'k-', lw,d1); hold on;
plot(v5.atm.qtdt_dyn.dn.avg*c,v5.zf,'k:', lw,d1);
plot(v6.atm.qtdt_dyn.dn.avg*c,v6.zf,'k:', lw,d2); 
plot(w0.atm.qtdt_dyn.dn.avg*c,w0.zf,'r-', lw,d1);
plot(w5.atm.qtdt_dyn.dn.avg*c,w5.zf,'r:', lw,d1);
plot(w6.atm.qtdt_dyn.dn.avg*c,w6.zf,'r:', lw,d2);
legend('R1.5', 'R48', 'R48C','R1.5','R48','R48C',1)
yl='height z (km)';    ylabel(yl,'FontSize',fsize);
xl='cloud liquid water (g/kg)'; xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %axis(xy);
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qtflx_dyn_dn_sst'; k1=18; k2=79; c=1000;
pms=[ 0, 0, 1100, 900]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S0; S5=S2;
lw='LineWidth'; d1=2; d2=4; xy=[0 0.1 0 5]; vx=v0;
plot(v0.atm.qtflx_dyn.dn.avg*c,v0.zf,'k-', lw,d1); hold on;
plot(v5.atm.qtflx_dyn.dn.avg*c,v5.zf,'k:', lw,d1);
plot(v6.atm.qtflx_dyn.dn.avg*c,v6.zf,'k:', lw,d2); 
plot(w0.atm.qtflx_dyn.dn.avg*c,w0.zf,'r-', lw,d1);
plot(w5.atm.qtflx_dyn.dn.avg*c,w5.zf,'r:', lw,d1);
plot(w6.atm.qtflx_dyn.dn.avg*c,w6.zf,'r:', lw,d2);
legend('R1.5', 'R48', 'R48C','R1.5','R48','R48C',1)
yl='height z (km)';    ylabel(yl,'FontSize',fsize);
xl='cloud liquid water (g/kg)'; xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qv_dn_sst'; k1=18; k2=79; c=1000;
pms=[ 0, 0, 1100, 900]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S0; S5=S2;
lw='LineWidth'; d1=2; d2=4; xy=[0 0.1 0 5]; vx=v0;
plot(v0.qv.dn.avg*c,v0.zf,'k-', lw,d1); hold on;
plot(v5.qv.dn.avg*c,v5.zf,'k:', lw,d1);
plot(v6.qv.dn.avg*c,v6.zf,'k:', lw,d2); 
plot(w0.qv.dn.avg*c,w0.zf,'r-', lw,d1);
plot(w5.qv.dn.avg*c,w5.zf,'r:', lw,d1);
plot(w6.qv.dn.avg*c,w6.zf,'r:', lw,d2);
legend('R1.5', 'R48', 'R48C','R1.5','R48','R48C',1)
yl='height z (km)';    ylabel(yl,'FontSize',fsize);
xl='specific humidity (g/kg)'; xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ql_dn_sst'; k1=18; k2=79; c=1000;
pms=[ 0, 0, 1100, 900]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S0; S5=S2;
lw='LineWidth'; d1=2; d2=4; xy=[0 0.1 0 5]; vx=v0;
plot(v0.ql.dn.avg*c,v0.zf,'k-', lw,d1); hold on;
plot(v5.ql.dn.avg*c,v5.zf,'k:', lw,d1);
plot(v6.ql.dn.avg*c,v6.zf,'k:', lw,d2); 
plot(w0.ql.dn.avg*c,w0.zf,'r-', lw,d1);
plot(w5.ql.dn.avg*c,w5.zf,'r:', lw,d1);
plot(w6.ql.dn.avg*c,w6.zf,'r:', lw,d2);
legend('R1.5', 'R48', 'R48C','R1.5','R48','R48C',1)
yl='height z (km)';    ylabel(yl,'FontSize',fsize);
xl='cloud liquid water (g/kg)'; xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_dn_sst'; k1=18; k2=79; c=100;
pms=[ 0, 0, 1100, 900]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S0; S5=S2;
lw='LineWidth'; d1=2; d2=4; xy=[0 31 0 5]; vx=v0;
plot(v0.qa.dn.avg*c,v0.zf,'k-', lw,d1); hold on;
plot(v5.qa.dn.avg*c,v5.zf,'k:', lw,d1);
plot(v6.qa.dn.avg*c,v6.zf,'k:', lw,d2); 
plot(w0.qa.dn.avg*c,w0.zf,'r-', lw,d1);
plot(w5.qa.dn.avg*c,w5.zf,'r:', lw,d1);
plot(w6.qa.dn.avg*c,w6.zf,'r:', lw,d2);
legend('R1.5', 'R48', 'R48C','R1.5','R48','R48C',1)
yl='height z (km)';    ylabel(yl,'FontSize',fsize);
xl='cloud amount in large-scale subsidence region (%)'; xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_dn_sst'; k1=18; k2=79; c=1;
pms=[ 0, 0, 1100, 900]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S0; S5=S2;
lw='LineWidth'; d1=2; d2=4; xy=[-0.006 0 0 5]; vx=v0;
plot(v0.wa.dn.avg*c,v0.zf,'k-', lw,d1); hold on;
plot(v5.wa.dn.avg*c,v5.zf,'k:', lw,d1);
plot(v6.wa.dn.avg*c,v6.zf,'k:', lw,d2); 
plot(w0.wa.dn.avg*c,w0.zf,'r-', lw,d1);
plot(w5.wa.dn.avg*c,w5.zf,'r:', lw,d1);
plot(w6.wa.dn.avg*c,w6.zf,'r:', lw,d2);
legend('R1.5', 'R48', 'R48C',...
       'R1.5(305)','R48(305)','R48C(305)',1)
yl='height z (km)';    ylabel(yl,'FontSize',fsize);
xl='vertical velocity (hPa/day)'; xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh_dn_sst'; k1=18; k2=79; c=1;
pms=[ 0, 0, 1100, 900]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S0; S5=S2;
lw='LineWidth'; d1=2; d2=4; xy=[0 100 0 5]; vx=v0;
plot(v0.rh.dn.avg*c,v0.zf,'k-', lw,d1); hold on;
plot(v5.rh.dn.avg*c,v5.zf,'k:', lw,d1);
plot(v6.rh.dn.avg*c,v6.zf,'k:', lw,d2); 
plot(w0.rh.dn.avg*c,w0.zf,'r-', lw,d1);
plot(w5.rh.dn.avg*c,w5.zf,'r:', lw,d1);
plot(w6.rh.dn.avg*c,w6.zf,'r:', lw,d2);
legend('R1.5 (ascent)', 'R48  (ascent)', 'R48C(ascent)',...
       'R1.5 (descent)','R48  (descent)','R48C(descent)',1)
yl='height z (km)';    ylabel(yl,'FontSize',fsize);
xl='RH (%)'; xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh_updn_avg_rx'; k1=18; k2=79; c=1;
pms=[ 0, 0, 1100, 900]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S0; S5=S2;
lw='LineWidth'; d1=2; d2=3; xy=[0 6 0 17];
plot(v0.rh.up.avg*c,v0.zf,'k-', lw,d1); hold on;
plot(v5.rh.up.avg*c,v5.zf,'b-', lw,d1);
plot(v6.rh.up.avg*c,v6.zf,'r-', lw,d1);
plot(v0.rh.dn.avg*c,v0.zf,'k--',lw,d1);
plot(v5.rh.dn.avg*c,v5.zf,'b--',lw,d1); 
plot(v6.rh.dn.avg*c,v6.zf,'r--',lw,d1);
legend('R1.5 (ascent)', 'R48  (ascent)', 'R48C(ascent)',...
       'R1.5 (descent)','R48  (descent)','R48C(descent)',1)
yl='height z (km)';    ylabel(yl,'FontSize',fsize);
xl='RH (%)'; xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_updn_avg_rx'; k1=18; k2=79; c=100;
pms=[ 0, 0, 1100, 900]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S0; S5=S2;
lw='LineWidth'; d1=2; d2=3; xy=[0 61 0 17];
plot(v0.qa.up.avg*c,v0.zf,'k-', lw,d1); hold on;
plot(v5.qa.up.avg*c,v5.zf,'b-', lw,d1);
plot(v6.qa.up.avg*c,v6.zf,'r-', lw,d1);
plot(v0.qa.dn.avg*c,v0.zf,'k--',lw,d1);
plot(v5.qa.dn.avg*c,v5.zf,'b--',lw,d1); 
plot(v6.qa.dn.avg*c,v6.zf,'r--',lw,d1);
legend('R1.5 (ascent)', 'R48  (ascent)', 'R48C(ascent)',...
       'R1.5 (descent)','R48  (descent)','R48C(descent)',1)
yl='height z (km)';    ylabel(yl,'FontSize',fsize);
xl='cloud amount (%)'; xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qv_updn_avg_temp'; k1=18; k2=79; c=1000;
pms=[ 0, 0, 1100, 900]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S0; S5=S2;
lw='LineWidth'; d1=2; d2=3; xy=[0 17 0 10]; vx=v0;
plot(vx.qv.up.avg*c,vx.zf,'k-', lw,d1); hold on;
plot(v5.qv.up.avg*c,v5.zf,'b-', lw,d1);
plot(v6.qv.up.avg*c,v6.zf,'r-', lw,d1);
plot(vx.qv.dn.avg*c,vx.zf,'k--',lw,d1);
plot(v5.qv.dn.avg*c,v5.zf,'b--',lw,d1); 
plot(v6.qv.dn.avg*c,v6.zf,'r--',lw,d1);
legend('R1.5 (ascent)', 'R48  (ascent)', 'R48C(ascent)',...
       'R1.5 (descent)','R48  (descent)','R48C(descent)',1)
yl='height z (km)';    ylabel(yl,'FontSize',fsize);
xl='specific humidity (g/kg)'; xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy); visfig='off';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh_updn_avg_temp'; k1=18; k2=79; c=1;
pms=[ 0, 0, 1100, 900]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S0; S5=S2;
lw='LineWidth'; d1=2; d2=3; xy=[0 130 0 20]; vx=v0;
plot(vx.rh.up.avg*c,vx.zf,'k-', lw,d1); hold on;
plot(v5.rh.up.avg*c,v5.zf,'b-', lw,d1);
plot(v6.rh.up.avg*c,v6.zf,'r-', lw,d1);
plot(vx.rh.dn.avg*c,vx.zf,'k--',lw,d1);
plot(v5.rh.dn.avg*c,v5.zf,'b--',lw,d1); 
plot(v6.rh.dn.avg*c,v6.zf,'r--',lw,d1);
legend('R1.5 (ascent)', 'R48  (ascent)', 'R48C(ascent)',...
       'R1.5 (descent)','R48  (descent)','R48C(descent)',1)
yl='height z (km)';    ylabel(yl,'FontSize',fsize);
xl='RH (%)'; xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ql_avg_hght'; k1=1; k2=79; c=1000; xy=[0 0.05 0 13];
a.v0=v0.ql.all.avg(k1:k2)*c; a.c0=c0.ql.all.avg(k1:k2)*c; a.w0=w0.ql.all.avg(k1:k2)*c; 
a.v1=v1.ql.all.avg(k1:k2)*c; a.c1=c1.ql.all.avg(k1:k2)*c; a.w1=w1.ql.all.avg(k1:k2)*c; 
a.v2=v2.ql.all.avg(k1:k2)*c; a.c2=c2.ql.all.avg(k1:k2)*c; a.w2=w2.ql.all.avg(k1:k2)*c; 
a.v3=v3.ql.all.avg(k1:k2)*c; a.c3=c3.ql.all.avg(k1:k2)*c; a.w3=w3.ql.all.avg(k1:k2)*c; 
a.v4=v4.ql.all.avg(k1:k2)*c; a.c4=c4.ql.all.avg(k1:k2)*c; a.w4=w4.ql.all.avg(k1:k2)*c; 
a.v5=v5.ql.all.avg(k1:k2)*c; a.c5=c5.ql.all.avg(k1:k2)*c; a.w5=w5.ql.all.avg(k1:k2)*c; 
b.v0=v0.zf(k1:k2); b.c0=c0.zf(k1:k2); b.w0=w0.zf(k1:k2); 
b.v1=v1.zf(k1:k2); b.c1=c1.zf(k1:k2); b.w1=w1.zf(k1:k2); 
b.v2=v2.zf(k1:k2); b.c2=c2.zf(k1:k2); b.w2=w2.zf(k1:k2); 
b.v3=v3.zf(k1:k2); b.c3=c3.zf(k1:k2); b.w3=w3.zf(k1:k2); 
b.v4=v4.zf(k1:k2); b.c4=c4.zf(k1:k2); b.w4=w4.zf(k1:k2); 
b.v5=v5.zf(k1:k2); b.c5=c5.zf(k1:k2); b.w5=w5.zf(k1:k2); 
%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 800]*1.5; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
lw='LineWidth'; d=1; d2=d*3;
plot(a.c0,b.c0,'b-', lw,d2);hold on;plot(a.v0,b.v0,'k-', lw,d2);plot(a.w0,b.w0,'r-',lw,d2); 
plot(a.c1,b.c1,'b--',lw,d2);hold on;plot(a.v1,b.v1,'k--',lw,d2);plot(a.w1,b.w1,'r--',lw,d2); 
%plot(a.c2,b.c2,'b-', lw,d); hold on;plot(a.v2,b.v2,'k-', lw,d); plot(a.w2,b.w2,'r-',lw,d); 
%plot(a.c3,b.c3,'b--',lw,d); hold on;plot(a.v3,b.v3,'k--',lw,d); plot(a.w3,b.w3,'r--',lw,d); 
%plot(a.c4,b.c4,'b-.',lw,d); hold on;plot(a.v4,b.v4,'k-.',lw,d); plot(a.w4,b.w4,'r-.',lw,d); 
%plot(a.c5,b.c5,'b:', lw,d); hold on;plot(a.v5,b.v5,'k:', lw,d); plot(a.w5,b.w5,'r:',lw,d); 
set(gca,'FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='cloud liquid water (g/kg)'; xlabel(xl,'FontSize',fsize);
yl='height (m)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rho_avg_hght'; k1=1; k2=79; c=1; xy=[0.2 1.2 0 13];
a.v0=v0.atm.rho.avg(k1:k2)*c; a.c0=c0.atm.rho.avg(k1:k2)*c; a.w0=w0.atm.rho.avg(k1:k2)*c; 
a.v1=v1.atm.rho.avg(k1:k2)*c; a.c1=c1.atm.rho.avg(k1:k2)*c; a.w1=w1.atm.rho.avg(k1:k2)*c; 
a.v2=v2.atm.rho.avg(k1:k2)*c; a.c2=c2.atm.rho.avg(k1:k2)*c; a.w2=w2.atm.rho.avg(k1:k2)*c; 
a.v3=v3.atm.rho.avg(k1:k2)*c; a.c3=c3.atm.rho.avg(k1:k2)*c; a.w3=w3.atm.rho.avg(k1:k2)*c; 
a.v4=v4.atm.rho.avg(k1:k2)*c; a.c4=c4.atm.rho.avg(k1:k2)*c; a.w4=w4.atm.rho.avg(k1:k2)*c; 
a.v5=v5.atm.rho.avg(k1:k2)*c; a.c5=c5.atm.rho.avg(k1:k2)*c; a.w5=w5.atm.rho.avg(k1:k2)*c; 
b.v0=v0.zf(k1:k2); b.c0=c0.zf(k1:k2); b.w0=w0.zf(k1:k2); 
b.v1=v1.zf(k1:k2); b.c1=c1.zf(k1:k2); b.w1=w1.zf(k1:k2); 
b.v2=v2.zf(k1:k2); b.c2=c2.zf(k1:k2); b.w2=w2.zf(k1:k2); 
b.v3=v3.zf(k1:k2); b.c3=c3.zf(k1:k2); b.w3=w3.zf(k1:k2); 
b.v4=v4.zf(k1:k2); b.c4=c4.zf(k1:k2); b.w4=w4.zf(k1:k2); 
b.v5=v5.zf(k1:k2); b.c5=c5.zf(k1:k2); b.w5=w5.zf(k1:k2); 
%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 800]*1.5; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
lw='LineWidth'; d=1; d2=d*3;
plot(a.c0,b.c0,'b-', lw,d2);hold on;plot(a.v0,b.v0,'k-', lw,d2);plot(a.w0,b.w0,'r-',lw,d2); 
plot(a.c1,b.c1,'b--',lw,d2);hold on;plot(a.v1,b.v1,'k--',lw,d2);plot(a.w1,b.w1,'r--',lw,d2); 
%plot(a.c2,b.c2,'b-', lw,d); hold on;plot(a.v2,b.v2,'k-', lw,d); plot(a.w2,b.w2,'r-',lw,d); 
%plot(a.c3,b.c3,'b--',lw,d); hold on;plot(a.v3,b.v3,'k--',lw,d); plot(a.w3,b.w3,'r--',lw,d); 
%plot(a.c4,b.c4,'b-.',lw,d); hold on;plot(a.v4,b.v4,'k-.',lw,d); plot(a.w4,b.w4,'r-.',lw,d); 
%plot(a.c5,b.c5,'b:', lw,d); hold on;plot(a.v5,b.v5,'k:', lw,d); plot(a.w5,b.w5,'r:',lw,d); 
set(gca,'FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='atmospheric density (kg/m3)'; xlabel(xl,'FontSize',fsize);
yl='height (m)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce_mon';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_avg_pres'; pf=v2.pf; ph=v2.ph; xy=[0 0.4 75 1000];
a.v0=v0.qa_tot.avg; a.c0=c0.qa_tot.avg; a.w0=w0.qa_tot.avg; 
a.v1=v1.qa_tot.avg; a.c1=c1.qa_tot.avg; a.w1=w1.qa_tot.avg; 
a.v2=v2.qa_tot.avg; a.c2=c2.qa_tot.avg; a.w2=w2.qa_tot.avg; 
a.v3=v3.qa_tot.avg; a.c3=c3.qa_tot.avg; a.w3=w3.qa_tot.avg; 
a.v4=v4.qa_tot.avg; a.c4=c4.qa_tot.avg; a.w4=w4.qa_tot.avg; 
a.v5=v5.qa_tot.avg; a.c5=c5.qa_tot.avg; a.w5=w5.qa_tot.avg; 
a.v6=v6.qa_tot.avg; a.c6=c6.qa_tot.avg; a.w6=w6.qa_tot.avg; 
%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 800]*1.5; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); y=v0.pf; 
co='Color';     C0='b'; V0='k'; W0='r'; 
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S0; S5=S2;
MK='Marker'; MS='MarkerSize';
lw='LineWidth'; d1=1; d2=d1*3;
line(a.v0,y,co,V0,ls,S0,lw,d2); hold on;
line(a.v1,y,co,V0,ls,S1,lw,d2); line(a.v2,y,co,V0,ls,S2,lw,d1);
line(a.v3,y,co,V0,ls,S3,lw,d1); line(a.v4,y,co,V0,ls,S4,lw,d1);
line(a.v5,y,co,V0,ls,S5,lw,d1); line(a.v6,y,co,V0,ls,S5,lw,d2);
line(a.c0,y,co,C0,ls,S0,lw,d2); 
line(a.c1,y,co,C0,ls,S1,lw,d2); line(a.c2,y,co,C0,ls,S2,lw,d1); 
line(a.c3,y,co,C0,ls,S3,lw,d1); line(a.c4,y,co,C0,ls,S4,lw,d1); 
line(a.c5,y,co,C0,ls,S5,lw,d1); line(a.c6,y,co,C0,ls,S5,lw,d2);
line(a.w0,y,co,W0,ls,S0,lw,d2);
line(a.w1,y,co,W0,ls,S1,lw,d2); line(a.w2,y,co,W0,ls,S2,lw,d1);
line(a.w3,y,co,W0,ls,S3,lw,d1); line(a.w4,y,co,W0,ls,S4,lw,d1);
line(a.w5,y,co,W0,ls,S5,lw,d1); line(a.w6,y,co,W0,ls,S5,lw,d2);
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
legend('R1.5','R03','R06','R12','R24','R48','R48C',opt);
set(gca,'yDir',ydir,'FontSize',fsize); axis(xy);
xl='cloud fraction'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh_avg_hght'; k1=1; k2=79;
a.v0=v0.rh.avg(k1:k2); a.c0=c0.rh.avg(k1:k2); a.w0=w0.rh.avg(k1:k2); 
a.v1=v1.rh.avg(k1:k2); a.c1=c1.rh.avg(k1:k2); a.w1=w1.rh.avg(k1:k2); 
a.v2=v2.rh.avg(k1:k2); a.c2=c2.rh.avg(k1:k2); a.w2=w2.rh.avg(k1:k2); 
a.v3=v3.rh.avg(k1:k2); a.c3=c3.rh.avg(k1:k2); a.w3=w3.rh.avg(k1:k2); 
a.v4=v4.rh.avg(k1:k2); a.c4=c4.rh.avg(k1:k2); a.w4=w4.rh.avg(k1:k2); 
a.v5=v5.rh.avg(k1:k2); a.c5=c5.rh.avg(k1:k2); a.w5=w5.rh.avg(k1:k2); 
b.v0=v0.zf.avg(k1:k2); b.c0=c0.zf.avg(k1:k2); b.w0=w0.zf.avg(k1:k2); 
b.v1=v1.zf.avg(k1:k2); b.c1=c1.zf.avg(k1:k2); b.w1=w1.zf.avg(k1:k2); 
b.v2=v2.zf.avg(k1:k2); b.c2=c2.zf.avg(k1:k2); b.w2=w2.zf.avg(k1:k2); 
b.v3=v3.zf.avg(k1:k2); b.c3=c3.zf.avg(k1:k2); b.w3=w3.zf.avg(k1:k2); 
b.v4=v4.zf.avg(k1:k2); b.c4=c4.zf.avg(k1:k2); b.w4=w4.zf.avg(k1:k2); 
b.v5=v5.zf.avg(k1:k2); b.c5=c5.zf.avg(k1:k2); b.w5=w5.zf.avg(k1:k2); 
%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 800]*1.5; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
lw='LineWidth'; d=1; d2=d*3;
plot(a.c0,b.c0,'b-', lw,d2);hold on;plot(a.v0,b.v0,'k-', lw,d2);plot(a.w0,b.w0,'r-',lw,d2); 
plot(a.c1,b.c1,'b-.',lw,d2);hold on;plot(a.v1,b.v1,'k-.',lw,d2);plot(a.w1,b.w1,'r-.',lw,d2); 
plot(a.c2,b.c2,'b-', lw,d); hold on;plot(a.v2,b.v2,'k-', lw,d); plot(a.w2,b.w2,'r-',lw,d); 
plot(a.c3,b.c3,'b--',lw,d); hold on;plot(a.v3,b.v3,'k--',lw,d); plot(a.w3,b.w3,'r--',lw,d); 
plot(a.c4,b.c4,'b-.',lw,d); hold on;plot(a.v4,b.v4,'k-.',lw,d); plot(a.w4,b.w4,'r-.',lw,d); 
plot(a.c5,b.c5,'b:', lw,d); hold on;plot(a.v5,b.v5,'k:', lw,d); plot(a.w5,b.w5,'r:',lw,d); 
set(gca,'FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='RH (%)'; xlabel(xl,'FontSize',fsize);
yl='height (m)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh_avg_pres'; pf=v2.pf; ph=v2.ph; xy=[0 100 50 1000]; k1=1; k2=79;
a.v0=v0.rh.avg(k1:k2); a.c0=c0.rh.avg(k1:k2); a.w0=w0.rh.avg(k1:k2); 
a.v1=v1.rh.avg(k1:k2); a.c1=c1.rh.avg(k1:k2); a.w1=w1.rh.avg(k1:k2); 
a.v2=v2.rh.avg(k1:k2); a.c2=c2.rh.avg(k1:k2); a.w2=w2.rh.avg(k1:k2); 
a.v3=v3.rh.avg(k1:k2); a.c3=c3.rh.avg(k1:k2); a.w3=w3.rh.avg(k1:k2); 
a.v4=v4.rh.avg(k1:k2); a.c4=c4.rh.avg(k1:k2); a.w4=w4.rh.avg(k1:k2); 
a.v5=v5.rh.avg(k1:k2); a.c5=c5.rh.avg(k1:k2); a.w5=w5.rh.avg(k1:k2); 
pms=[ 0, 0, 1100, 800]*1.5; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
y=v0.pf; lw='LineWidth'; d=1; d2=d*3;
plot(a.c0,y,'b-', lw,d2);hold on;plot(a.v0,y,'k-', lw,d2);plot(a.w0,y,'r-',lw,d2); 
plot(a.c1,y,'b-.',lw,d2);hold on;plot(a.v1,y,'k-.',lw,d2);plot(a.w1,y,'r-.',lw,d2); 
plot(a.c2,y,'b-', lw,d); hold on;plot(a.v2,y,'k-', lw,d); plot(a.w2,y,'r-',lw,d); 
plot(a.c3,y,'b--',lw,d); hold on;plot(a.v3,y,'k--',lw,d); plot(a.w3,y,'r--',lw,d); 
plot(a.c4,y,'b-.',lw,d); hold on;plot(a.v4,y,'k-.',lw,d); plot(a.w4,y,'r-.',lw,d); 
plot(a.c5,y,'b:', lw,d); hold on;plot(a.v5,y,'k:', lw,d); plot(a.w5,y,'r:',lw,d); 
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='RH (%)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
alist={'R1.5','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qr_avg_pres'; pf=v2.pf; ph=v2.ph; xy=[0 0.015 50 1000]; k1=1; k2=79; c=1000;
a.v0=v0.qr.avg(k1:k2)*c; a.c0=c0.qr.avg(k1:k2)*c; a.w0=w0.qr.avg(k1:k2)*c; 
a.v1=v1.qr.avg(k1:k2)*c; a.c1=c1.qr.avg(k1:k2)*c; a.w1=w1.qr.avg(k1:k2)*c; 
a.v2=v2.qr.avg(k1:k2)*c; a.c2=c2.qr.avg(k1:k2)*c; a.w2=w2.qr.avg(k1:k2)*c; 
a.v3=v3.qr.avg(k1:k2)*c; a.c3=c3.qr.avg(k1:k2)*c; a.w3=w3.qr.avg(k1:k2)*c; 
a.v4=v4.qr.avg(k1:k2)*c; a.c4=c4.qr.avg(k1:k2)*c; a.w4=w4.qr.avg(k1:k2)*c; 
a.v5=v5.qr.avg(k1:k2)*c; a.c5=c5.qr.avg(k1:k2)*c; a.w5=w5.qr.avg(k1:k2)*c; 
%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 800]*1.5; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
y=v0.pf; lw='LineWidth'; d=1; d2=d*3;
plot(a.c0,y,'b-', lw,d2);hold on;plot(a.v0,y,'k-', lw,d2);plot(a.w0,y,'r-',lw,d2); 
plot(a.c1,y,'b-.',lw,d2);hold on;plot(a.v1,y,'k-.',lw,d2);plot(a.w1,y,'r-.',lw,d2); 
plot(a.c2,y,'b-', lw,d); hold on;plot(a.v2,y,'k-', lw,d); plot(a.w2,y,'r-',lw,d); 
plot(a.c3,y,'b--',lw,d); hold on;plot(a.v3,y,'k--',lw,d); plot(a.w3,y,'r--',lw,d); 
plot(a.c4,y,'b-.',lw,d); hold on;plot(a.v4,y,'k-.',lw,d); plot(a.w4,y,'r-.',lw,d); 
plot(a.c5,y,'b:', lw,d); hold on;plot(a.v5,y,'k:', lw,d); plot(a.w5,y,'r:',lw,d); 
set(gca,'yDir','reverse','FontSize',fsize); legend('295','300','305',1); axis(xy);
xl='rain (kg/kg)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
alist={'R01','R03','R06','R12','R24','R48'};
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mse_avg_pres'; pf=v2.pf; ph=v2.ph; xy=[305 365 100 1000];
k1=18; k2=79; c=1/CPD; cc=0.01;
a.v0=v0.mse.avg(k1:k2)*c; a.c0=c0.mse.avg(k1:k2)*c; a.w0=w0.mse.avg(k1:k2)*c; 
a.v1=v1.mse.avg(k1:k2)*c; a.c1=c1.mse.avg(k1:k2)*c; a.w1=w1.mse.avg(k1:k2)*c; 
a.v2=v2.mse.avg(k1:k2)*c; a.c2=c2.mse.avg(k1:k2)*c; a.w2=w2.mse.avg(k1:k2)*c; 
a.v3=v3.mse.avg(k1:k2)*c; a.c3=c3.mse.avg(k1:k2)*c; a.w3=w3.mse.avg(k1:k2)*c; 
a.v4=v4.mse.avg(k1:k2)*c; a.c4=c4.mse.avg(k1:k2)*c; a.w4=w4.mse.avg(k1:k2)*c; 
a.v5=v5.mse.avg(k1:k2)*c; a.c5=c5.mse.avg(k1:k2)*c; a.w5=w5.mse.avg(k1:k2)*c; 
b.v0=v0.pf.avg(k1:k2)*cc; b.c0=c0.pf.avg(k1:k2)*cc; b.w0=w0.pf.avg(k1:k2)*cc; 
b.v1=v1.pf.avg(k1:k2)*cc; b.c1=c1.pf.avg(k1:k2)*cc; b.w1=w1.pf.avg(k1:k2)*cc; 
b.v2=v2.pf.avg(k1:k2)*cc; b.c2=c2.pf.avg(k1:k2)*cc; b.w2=w2.pf.avg(k1:k2)*cc; 
b.v3=v3.pf.avg(k1:k2)*cc; b.c3=c3.pf.avg(k1:k2)*cc; b.w3=w3.pf.avg(k1:k2)*cc; 
b.v4=v4.pf.avg(k1:k2)*cc; b.c4=c4.pf.avg(k1:k2)*cc; b.w4=w4.pf.avg(k1:k2)*cc; 
b.v5=v5.pf.avg(k1:k2)*cc; b.c5=c5.pf.avg(k1:k2)*cc; b.w5=w5.pf.avg(k1:k2)*cc; 
%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 800]*1.5; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
co='Color';     C0='b'; V0='k'; W0='r'; 
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S0; S5=S1;
MK='Marker'; MS='MarkerSize'; lw='LineWidth'; d1=1; d2=d1*3;
line(a.v0,b.v0,co,V0,ls,S0,lw,d2); hold on; line(a.v1,b.v1,co,V0,ls,S1,lw,d2);
line(a.v2,b.v2,co,V0,ls,S2,lw,d1);          line(a.v3,b.v3,co,V0,ls,S3,lw,d1);
line(a.v4,b.v4,co,V0,ls,S4,lw,d1);          line(a.v5,b.v5,co,V0,ls,S5,lw,d1);
line(a.c0,b.c0,co,C0,ls,S0,lw,d2);          line(a.c1,b.c1,co,C0,ls,S1,lw,d2);
line(a.c2,b.c2,co,C0,ls,S2,lw,d1);          line(a.c3,b.c3,co,C0,ls,S3,lw,d1);
line(a.c4,b.c4,co,C0,ls,S4,lw,d1);          line(a.c5,b.c5,co,C0,ls,S5,lw,d1);
line(a.w0,b.w0,co,W0,ls,S0,lw,d2);          line(a.w1,b.w1,co,W0,ls,S1,lw,d2);
line(a.w2,b.w2,co,W0,ls,S2,lw,d1);          line(a.w3,b.w3,co,W0,ls,S3,lw,d1);
line(a.w4,b.w4,co,W0,ls,S4,lw,d1);          line(a.w5,b.w5,co,W0,ls,S5,lw,d1);
xl='MSE/C_p (K)';    xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
legend('R1.5','R03','R06','R12','R24','R48',opt);
set(gca,'yDir',ydir,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
