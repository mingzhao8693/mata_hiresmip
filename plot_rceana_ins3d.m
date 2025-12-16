cd /home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_am4
set tpath = '/archive/Ming.Zhao/ndrce/warsaw_201710/'
set res   = org_z
set ts    = 240
set te    = 365
set zs    = 1
set ze    = 64
set w_th  = 0.5
set qc_th = 0.00001;

matlab -r "rceana_ins3d('$tpath','RCE_H2048x128_L79_R01_295','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H2048x128_L79_R01_300','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H2048x128_L79_R01_305','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H2048x128_L79_R03_295','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H2048x128_L79_R03_300','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H2048x128_L79_R03_305','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H1024x064_L79_R06_295','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H1024x064_L79_R06_300','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H1024x064_L79_R06_305','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H0512x032_L79_R12_295','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H0512x032_L79_R12_300','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H0512x032_L79_R12_305','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H0256x016_L79_R24_295','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H0256x016_L79_R24_300','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H0256x016_L79_R24_305','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H0128x008_L79_R48_295','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H0128x008_L79_R48_300','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H0128x008_L79_R48_305','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"&
matlab -r "rceana_ins3d('$tpath','RCE_H0128x008_L79_R48_conv_295','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"
matlab -r "rceana_ins3d('$tpath','RCE_H0128x008_L79_R48_conv_300','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"
matlab -r "rceana_ins3d('$tpath','RCE_H0128x008_L79_R48_conv_305','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"

tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; 
zs=1; ze=64; qc_th=0.00001; res='org_z'; t1=240; t2=365;
expn='RCE_H0128x008_L79_R48_conv_300';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0128x008_L79_R48_conv_295';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0128x008_L79_R48_conv_305';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);

expn='RCE_H0128x008_L79_R48_300';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0128x008_L79_R48_295';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0128x008_L79_R48_305';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0256x016_L79_R24_300';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0256x016_L79_R24_295';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0256x016_L79_R24_305';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0512x032_L79_R12_300';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0512x032_L79_R12_295';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0512x032_L79_R12_305';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H1024x064_L79_R06_300';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H1024x064_L79_R06_295';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H1024x064_L79_R06_305';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H2048x128_L79_R03_300';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H2048x128_L79_R03_295';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H2048x128_L79_R03_305';v1=rceana_ins3d(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath='/work/miz/mat_rce/'; fext=strcat('_','rceana_ins3d_240_365.mat');
expn='RCE_H2048x128_L79_R01_300'; fn=strcat(tpath,expn,fext); load(fn);v0=v;
expn='RCE_H2048x128_L79_R03_300'; fn=strcat(tpath,expn,fext); load(fn);v1=v;
expn='RCE_H1024x064_L79_R06_300'; fn=strcat(tpath,expn,fext); load(fn);v2=v;
expn='RCE_H0512x032_L79_R12_300'; fn=strcat(tpath,expn,fext); load(fn);v3=v;
expn='RCE_H0256x016_L79_R24_300'; fn=strcat(tpath,expn,fext); load(fn);v4=v;
expn='RCE_H0128x008_L79_R48_300'; fn=strcat(tpath,expn,fext); load(fn);v5=v;
expn='RCE_H0128x008_L79_R48_conv_300'; fn=strcat(tpath,expn,fext); load(fn);v6=v;

expn='RCE_H2048x128_L79_R01_305'; fn=strcat(tpath,expn,fext); load(fn);w0=v;
expn='RCE_H2048x128_L79_R03_305'; fn=strcat(tpath,expn,fext); load(fn);w1=v;
expn='RCE_H1024x064_L79_R06_305'; fn=strcat(tpath,expn,fext); load(fn);w2=v;
expn='RCE_H0512x032_L79_R12_305'; fn=strcat(tpath,expn,fext); load(fn);w3=v;
expn='RCE_H0256x016_L79_R24_305'; fn=strcat(tpath,expn,fext); load(fn);w4=v;
expn='RCE_H0128x008_L79_R48_305'; fn=strcat(tpath,expn,fext); load(fn);w5=v;
expn='RCE_H0128x008_L79_R48_conv_305'; fn=strcat(tpath,expn,fext); load(fn);w6=v;

expn='RCE_H2048x128_L79_R01_295'; fn=strcat(tpath,expn,fext); load(fn);c0=v;
expn='RCE_H2048x128_L79_R03_295'; fn=strcat(tpath,expn,fext); load(fn);c1=v;
expn='RCE_H1024x064_L79_R06_295'; fn=strcat(tpath,expn,fext); load(fn);c2=v;
expn='RCE_H0512x032_L79_R12_295'; fn=strcat(tpath,expn,fext); load(fn);c3=v;
expn='RCE_H0256x016_L79_R24_295'; fn=strcat(tpath,expn,fext); load(fn);c4=v;
expn='RCE_H0128x008_L79_R48_295'; fn=strcat(tpath,expn,fext); load(fn);c5=v;
expn='RCE_H0128x008_L79_R48_conv_295'; fn=strcat(tpath,expn,fext); load(fn);c6=v;
v0.zf=v0.zf0; c0.zf=c0.zf0; w0.zf=w0.zf0;
v1.zf=v1.zf0; c1.zf=c1.zf0; w1.zf=w1.zf0;
v2.zf=v2.zf0; c2.zf=c2.zf0; w2.zf=w2.zf0;
v3.zf=v3.zf0; c3.zf=c3.zf0; w3.zf=w3.zf0;
v4.zf=v4.zf0; c4.zf=c4.zf0; w4.zf=w4.zf0;
v5.zf=v5.zf0; c5.zf=c5.zf0; w5.zf=w5.zf0;
v6.zf=v6.zf0; c6.zf=c6.zf0; w6.zf=w6.zf0;

V0='m-'; V1='r-'; V2='g-'; V3='b-'; V4='c-'; V5='k-'; V6='k-'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_ptile_temp'; k1=1; k2=64; c=1; opt=4; 
vx=v0; cx=c0; wx=w0; xy=[0 5 270 305]; expn='R1.5';
%vx=v1; cx=c1; wx=w1; xy=[0 9 200 305]; expn='R03';
%vx=v5; cx=c5; wx=w5; xy=[0 5 270 305]; expn='R48';
%vx=v6; cx=c6; wx=w6; xy=[0 5 270 305]; expn='R48C';
i=1; a.v0=vx.wa.cup.vptile(k1:k2,i)*c; a.c0=cx.wa.cup.vptile(k1:k2,i)*c; a.w0=wx.wa.cup.vptile(k1:k2,i)*c; 
i=2; a.v1=vx.wa.cup.vptile(k1:k2,i)*c; a.c1=cx.wa.cup.vptile(k1:k2,i)*c; a.w1=wx.wa.cup.vptile(k1:k2,i)*c; 
i=3; a.v2=vx.wa.cup.vptile(k1:k2,i)*c; a.c2=cx.wa.cup.vptile(k1:k2,i)*c; a.w2=wx.wa.cup.vptile(k1:k2,i)*c; 
i=4; a.v3=vx.wa.cup.vptile(k1:k2,i)*c; a.c3=cx.wa.cup.vptile(k1:k2,i)*c; a.w3=wx.wa.cup.vptile(k1:k2,i)*c; 
i=5; a.v4=vx.wa.cup.vptile(k1:k2,i)*c; a.c4=cx.wa.cup.vptile(k1:k2,i)*c; a.w4=wx.wa.cup.vptile(k1:k2,i)*c; 
i=6; a.v5=vx.wa.cup.vptile(k1:k2,i)*c; a.c5=cx.wa.cup.vptile(k1:k2,i)*c; a.w5=wx.wa.cup.vptile(k1:k2,i)*c; 
i=7; a.v6=vx.wa.cup.vptile(k1:k2,i)*c; a.c6=cx.wa.cup.vptile(k1:k2,i)*c; a.w6=wx.wa.cup.vptile(k1:k2,i)*c; 
b.v0=vx.ta.all.avg(k1:k2);             b.c0=cx.ta.all.avg(k1:k2);        b.w0=wx.ta.all.avg(k1:k2); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_ptile_height';
pms=[ 0, 0, 1000, 800]*0.5; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
lw='LineWidth'; d1=2; d2=4; ydir='reverse'; y1=v0.zf0;
plot(a.c0,y1,'b-', lw,d1); hold on; 
plot(a.c1,y1,'b--',lw,d1); plot(a.c2,y1,'b:',lw,d1);
plot(a.v0,y1,'k-', lw,d1); plot(a.w0,y1,'r-',lw,d1);
plot(a.v1,y1,'k--',lw,d1); plot(a.w1,y1,'r--',lw,d1);
plot(a.v2,y1,'k:', lw,d1); plot(a.w2,y1,'r:',lw,d1);
%plot(a.c3,y1,'b-.',lw,d1); hold on; plot(a.v3,y1,'k-.',lw,d1); plot(a.w3,y1,'r-.',lw,d1);
%x1=[a.v0 a.v1 a.v2 a.v3 a.v4]; y1=[v0.zf0];
%x2=[a.c0 a.c1 a.c2 a.c3 a.c4]; y2=[v0.zf0];
%x3=[a.w0 a.w1 a.w2 a.w3 a.w4]; y3=[v0.zf0];
%plot(x1,y1,'-', lw,d1); hold on; 
%plot(x2,y2,':', lw,d1); hold on; 
%plot(x3,y3,'--',lw,d1); hold on; 
%legend('50%','75%','90%','95%','99%',1); ydir='normal'; xy=[0 1 0 2];
legend('50%','75%','90%',4); ydir='normal'; xy=[0 0.6 0 2];
set(gca,'yDir',ydir,'FontSize',fsize); axis(xy);
xl='cloud updraft vertical velocity (m/s)'; xlabel(xl,'FontSize',fsize);
yl='height z (km)'; ylabel(yl,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
lw='LineWidth'; d1=2; d2=4; ydir='reverse';
x1=[a.v0 a.v1 a.v2 a.v3 a.v4]; y1=[b.v0];
x2=[a.c0 a.c1 a.c2 a.c3 a.c4]; y2=[b.c0];
x3=[a.w0 a.w1 a.w2 a.w3 a.w4]; y3=[b.w0];
plot(x1,y1,'-', lw,d1); hold on; 
plot(x2,y2,':', lw,d1); hold on; 
plot(x3,y3,'--',lw,d1); hold on; 
set(gca,'yDir',ydir,'FontSize',fsize); axis(xy);
legend('50%','75%','90%','95%','99%',4);
xl='cloud updraft vertical velocity (m/s)'; xlabel(xl,'FontSize',fsize);
yl='temperature (K)'; ylabel(yl,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_cup_avg_temp'; k1=1; k2=64; c=1; opt=1; expn='rce_ins3d';
a.v0=v0.wa.cup.avg(k1:k2)*c; a.c0=c0.wa.cup.avg(k1:k2)*c; a.w0=w0.wa.cup.avg(k1:k2)*c; 
a.v1=v1.wa.cup.avg(k1:k2)*c; a.c1=c1.wa.cup.avg(k1:k2)*c; a.w1=w1.wa.cup.avg(k1:k2)*c; 
a.v2=v2.wa.cup.avg(k1:k2)*c; a.c2=c2.wa.cup.avg(k1:k2)*c; a.w2=w2.wa.cup.avg(k1:k2)*c; 
a.v3=v3.wa.cup.avg(k1:k2)*c; a.c3=c3.wa.cup.avg(k1:k2)*c; a.w3=w3.wa.cup.avg(k1:k2)*c; 
a.v4=v4.wa.cup.avg(k1:k2)*c; a.c4=c4.wa.cup.avg(k1:k2)*c; a.w4=w4.wa.cup.avg(k1:k2)*c; 
a.v5=v5.wa.cup.avg(k1:k2)*c; a.c5=c5.wa.cup.avg(k1:k2)*c; a.w5=w5.wa.cup.avg(k1:k2)*c; 
a.v6=v6.wa.cup.avg(k1:k2)*c; a.c6=c6.wa.cup.avg(k1:k2)*c; a.w6=w6.wa.cup.avg(k1:k2)*c; 
xl='mean vertical velocity of cloud updraft (m/s)'; ydir='reverse'; 
xmin=0; xmax=1.2; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_cup_avg_height'; ydir='normal'; opt=1; 
xl='mean vertical velocity of cloud updraft (m/s)';
xy=[xmin xmax 0 18]; plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_up_avg_temp'; k1=1; k2=64; c=1; opt=1; expn='rce_ins3d';
a.v0=v0.wa.up.avg(k1:k2)*c; a.c0=c0.wa.up.avg(k1:k2)*c; a.w0=w0.wa.up.avg(k1:k2)*c; 
a.v1=v1.wa.up.avg(k1:k2)*c; a.c1=c1.wa.up.avg(k1:k2)*c; a.w1=w1.wa.up.avg(k1:k2)*c; 
a.v2=v2.wa.up.avg(k1:k2)*c; a.c2=c2.wa.up.avg(k1:k2)*c; a.w2=w2.wa.up.avg(k1:k2)*c; 
a.v3=v3.wa.up.avg(k1:k2)*c; a.c3=c3.wa.up.avg(k1:k2)*c; a.w3=w3.wa.up.avg(k1:k2)*c; 
a.v4=v4.wa.up.avg(k1:k2)*c; a.c4=c4.wa.up.avg(k1:k2)*c; a.w4=w4.wa.up.avg(k1:k2)*c; 
a.v5=v5.wa.up.avg(k1:k2)*c; a.c5=c5.wa.up.avg(k1:k2)*c; a.w5=w5.wa.up.avg(k1:k2)*c; 
a.v6=v6.wa.up.avg(k1:k2)*c; a.c6=c6.wa.up.avg(k1:k2)*c; a.w6=w6.wa.up.avg(k1:k2)*c; 
xl='mean vertical velocity of cloud updraft (m/s)'; ydir='reverse'; 
xmin=0; xmax=1.2; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_cup_avg_height'; ydir='normal'; opt=1; 
xl='mean vertical velocity of cloud updraft (m/s)';
xy=[xmin xmax 0 18]; plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fav_cup_avg_temp'; k1=1; k2=64; c=1; opt=1; expn='rce_ins3d';
a.v0=v0.wa.cup.fav(k1:k2)*c; a.c0=c0.wa.cup.fav(k1:k2)*c; a.w0=w0.wa.cup.fav(k1:k2)*c; 
a.v1=v1.wa.cup.fav(k1:k2)*c; a.c1=c1.wa.cup.fav(k1:k2)*c; a.w1=w1.wa.cup.fav(k1:k2)*c; 
a.v2=v2.wa.cup.fav(k1:k2)*c; a.c2=c2.wa.cup.fav(k1:k2)*c; a.w2=w2.wa.cup.fav(k1:k2)*c; 
a.v3=v3.wa.cup.fav(k1:k2)*c; a.c3=c3.wa.cup.fav(k1:k2)*c; a.w3=w3.wa.cup.fav(k1:k2)*c; 
a.v4=v4.wa.cup.fav(k1:k2)*c; a.c4=c4.wa.cup.fav(k1:k2)*c; a.w4=w4.wa.cup.fav(k1:k2)*c; 
a.v5=v5.wa.cup.fav(k1:k2)*c; a.c5=c5.wa.cup.fav(k1:k2)*c; a.w5=w5.wa.cup.fav(k1:k2)*c; 
a.v6=v6.wa.cup.fav(k1:k2)*c; a.c6=c6.wa.cup.fav(k1:k2)*c; a.w6=w6.wa.cup.fav(k1:k2)*c; 
xl='cloud updraft fraction'; ydir='reverse'; 
xmin=0; xmax=0.22; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fav_cup_avg_height'; opt=1; xl='cloud updraft fraction'; ydir='normal'; 
xy=[xmin xmax 0 18]; plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='AVG_cup_avg_temp'; k1=1; k2=64; c=1; opt=4; expn='rce_ins3d';
a.v0=v0.wa.cup.AVG(k1:k2)*c; a.c0=c0.wa.cup.AVG(k1:k2)*c; a.w0=w0.wa.cup.AVG(k1:k2)*c; 
a.v1=v1.wa.cup.AVG(k1:k2)*c; a.c1=c1.wa.cup.AVG(k1:k2)*c; a.w1=w1.wa.cup.AVG(k1:k2)*c; 
a.v2=v2.wa.cup.AVG(k1:k2)*c; a.c2=c2.wa.cup.AVG(k1:k2)*c; a.w2=w2.wa.cup.AVG(k1:k2)*c; 
a.v3=v3.wa.cup.AVG(k1:k2)*c; a.c3=c3.wa.cup.AVG(k1:k2)*c; a.w3=w3.wa.cup.AVG(k1:k2)*c; 
a.v4=v4.wa.cup.AVG(k1:k2)*c; a.c4=c4.wa.cup.AVG(k1:k2)*c; a.w4=w4.wa.cup.AVG(k1:k2)*c; 
a.v5=v5.wa.cup.AVG(k1:k2)*c; a.c5=c5.wa.cup.AVG(k1:k2)*c; a.w5=w5.wa.cup.AVG(k1:k2)*c; 
a.v6=v6.wa.cup.AVG(k1:k2)*c; a.c6=c6.wa.cup.AVG(k1:k2)*c; a.w6=w6.wa.cup.AVG(k1:k2)*c; 
xl='cloud updraft velocity x updraft fractional area (m/s)'; ydir='reverse'; 
xmin=0; xmax=0.022; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='AVG_cup_avg_height'; opt=4; ydir='normal'; 
xy=[xmin xmax 0 18]; plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rho_avg_temp'; k1=1; k2=64; c=1; expn='rce_ins3d';
a.v0=v0.rho.avg(k1:k2)*c; a.c0=c0.rho.avg(k1:k2)*c; a.w0=w0.rho.avg(k1:k2)*c; 
a.v1=v1.rho.avg(k1:k2)*c; a.c1=c1.rho.avg(k1:k2)*c; a.w1=w1.rho.avg(k1:k2)*c; 
a.v2=v2.rho.avg(k1:k2)*c; a.c2=c2.rho.avg(k1:k2)*c; a.w2=w2.rho.avg(k1:k2)*c; 
a.v3=v3.rho.avg(k1:k2)*c; a.c3=c3.rho.avg(k1:k2)*c; a.w3=w3.rho.avg(k1:k2)*c; 
a.v4=v4.rho.avg(k1:k2)*c; a.c4=c4.rho.avg(k1:k2)*c; a.w4=w4.rho.avg(k1:k2)*c; 
a.v5=v5.rho.avg(k1:k2)*c; a.c5=c5.rho.avg(k1:k2)*c; a.w5=w5.rho.avg(k1:k2)*c; 
a.v6=v6.rho.avg(k1:k2)*c; a.c6=c6.rho.avg(k1:k2)*c; a.w6=w6.rho.avg(k1:k2)*c; 
xl='air density (kg/m3)'; ydir='reverse'; opt=1;
xmin=0; xmax=1.2; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rho_avg_height'; opt=1; ydir='normal'; 
xy=[xmin xmax 0 18]; plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_cdn_avg_temp'; k1=1; k2=64; c=1; opt=3;
a.v0=v0.wa.cdn.avg(k1:k2)*c; a.c0=c0.wa.cdn.avg(k1:k2)*c; a.w0=w0.wa.cdn.avg(k1:k2)*c; 
a.v1=v1.wa.cdn.avg(k1:k2)*c; a.c1=c1.wa.cdn.avg(k1:k2)*c; a.w1=w1.wa.cdn.avg(k1:k2)*c; 
a.v2=v2.wa.cdn.avg(k1:k2)*c; a.c2=c2.wa.cdn.avg(k1:k2)*c; a.w2=w2.wa.cdn.avg(k1:k2)*c; 
a.v3=v3.wa.cdn.avg(k1:k2)*c; a.c3=c3.wa.cdn.avg(k1:k2)*c; a.w3=w3.wa.cdn.avg(k1:k2)*c; 
a.v4=v4.wa.cdn.avg(k1:k2)*c; a.c4=c4.wa.cdn.avg(k1:k2)*c; a.w4=w4.wa.cdn.avg(k1:k2)*c; 
a.v5=v5.wa.cdn.avg(k1:k2)*c; a.c5=c5.wa.cdn.avg(k1:k2)*c; a.w5=w5.wa.cdn.avg(k1:k2)*c; 
a.v6=v6.wa.cdn.avg(k1:k2)*c; a.c6=c6.wa.cdn.avg(k1:k2)*c; a.w6=w6.wa.cdn.avg(k1:k2)*c; 
xl='mean vertical velocity of cloud downdraft (m/s)'; ydir='reverse'; 
xmin=-1.2; xmax=0; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_cdn_avg_height'; ydir='normal'; opt=3; 
xy=[xmin xmax 0 18]; plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fav_cdn_avg_temp'; k1=1; k2=64; c=1; opt=1; expn='rce_ins3d';
a.v0=v0.wa.cdn.fav(k1:k2)*c; a.c0=c0.wa.cdn.fav(k1:k2)*c; a.w0=w0.wa.cdn.fav(k1:k2)*c; 
a.v1=v1.wa.cdn.fav(k1:k2)*c; a.c1=c1.wa.cdn.fav(k1:k2)*c; a.w1=w1.wa.cdn.fav(k1:k2)*c; 
a.v2=v2.wa.cdn.fav(k1:k2)*c; a.c2=c2.wa.cdn.fav(k1:k2)*c; a.w2=w2.wa.cdn.fav(k1:k2)*c; 
a.v3=v3.wa.cdn.fav(k1:k2)*c; a.c3=c3.wa.cdn.fav(k1:k2)*c; a.w3=w3.wa.cdn.fav(k1:k2)*c; 
a.v4=v4.wa.cdn.fav(k1:k2)*c; a.c4=c4.wa.cdn.fav(k1:k2)*c; a.w4=w4.wa.cdn.fav(k1:k2)*c; 
a.v5=v5.wa.cdn.fav(k1:k2)*c; a.c5=c5.wa.cdn.fav(k1:k2)*c; a.w5=w5.wa.cdn.fav(k1:k2)*c; 
a.v6=v6.wa.cdn.fav(k1:k2)*c; a.c6=c6.wa.cdn.fav(k1:k2)*c; a.w6=w6.wa.cdn.fav(k1:k2)*c; 
xl='cloud downdraft fraction'; ydir='reverse'; 
xmin=0; xmax=0.22; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fav_cdn_avg_height'; opt=1; ydir='normal'; 
xy=[xmin xmax 0 18]; plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='AVG_cdn_avg_temp'; k1=1; k2=64; c=1; opt=3; expn='rce_ins3d';
a.v0=v0.wa.cdn.AVG(k1:k2)*c; a.c0=c0.wa.cdn.AVG(k1:k2)*c; a.w0=w0.wa.cdn.AVG(k1:k2)*c; 
a.v1=v1.wa.cdn.AVG(k1:k2)*c; a.c1=c1.wa.cdn.AVG(k1:k2)*c; a.w1=w1.wa.cdn.AVG(k1:k2)*c; 
a.v2=v2.wa.cdn.AVG(k1:k2)*c; a.c2=c2.wa.cdn.AVG(k1:k2)*c; a.w2=w2.wa.cdn.AVG(k1:k2)*c; 
a.v3=v3.wa.cdn.AVG(k1:k2)*c; a.c3=c3.wa.cdn.AVG(k1:k2)*c; a.w3=w3.wa.cdn.AVG(k1:k2)*c; 
a.v4=v4.wa.cdn.AVG(k1:k2)*c; a.c4=c4.wa.cdn.AVG(k1:k2)*c; a.w4=w4.wa.cdn.AVG(k1:k2)*c; 
a.v5=v5.wa.cdn.AVG(k1:k2)*c; a.c5=c5.wa.cdn.AVG(k1:k2)*c; a.w5=w5.wa.cdn.AVG(k1:k2)*c; 
a.v6=v6.wa.cdn.AVG(k1:k2)*c; a.c6=c6.wa.cdn.AVG(k1:k2)*c; a.w6=w6.wa.cdn.AVG(k1:k2)*c; 
xl='cloud downdraft velocity x updraft fractional area (m/s)'; ydir='reverse'; 
xmin=-0.022; xmax=0; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='AVG_cdn_avg_height'; opt=3; ydir='normal'; 
xy=[xmin xmax 0 18]; plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_cld_avg_temp'; k1=1; k2=64; c=1; opt=1;
a.v0=v0.wa.cld.avg(k1:k2)*c; a.c0=c0.wa.cld.avg(k1:k2)*c; a.w0=w0.wa.cld.avg(k1:k2)*c; 
a.v1=v1.wa.cld.avg(k1:k2)*c; a.c1=c1.wa.cld.avg(k1:k2)*c; a.w1=w1.wa.cld.avg(k1:k2)*c; 
a.v2=v2.wa.cld.avg(k1:k2)*c; a.c2=c2.wa.cld.avg(k1:k2)*c; a.w2=w2.wa.cld.avg(k1:k2)*c; 
a.v3=v3.wa.cld.avg(k1:k2)*c; a.c3=c3.wa.cld.avg(k1:k2)*c; a.w3=w3.wa.cld.avg(k1:k2)*c; 
a.v4=v4.wa.cld.avg(k1:k2)*c; a.c4=c4.wa.cld.avg(k1:k2)*c; a.w4=w4.wa.cld.avg(k1:k2)*c; 
a.v5=v5.wa.cld.avg(k1:k2)*c; a.c5=c5.wa.cld.avg(k1:k2)*c; a.w5=w5.wa.cld.avg(k1:k2)*c; 
a.v6=v6.wa.cld.avg(k1:k2)*c; a.c6=c6.wa.cld.avg(k1:k2)*c; a.w6=w6.wa.cld.avg(k1:k2)*c; 
xl='cloud mean vertical velocity (m/s)'; ydir='reverse'; 
xmin=-0.6; xmax=0.6; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; grid on; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_cld_avg_height'; ydir='normal'; opt=1; 
xy=[xmin xmax 0 18]; plot_a_b_height; grid on; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fav_cld_avg_temp'; k1=1; k2=64; c=1; opt=1; expn='rce_ins3d';
a.v0=v0.wa.cld.fav(k1:k2)*c; a.c0=c0.wa.cld.fav(k1:k2)*c; a.w0=w0.wa.cld.fav(k1:k2)*c; 
a.v1=v1.wa.cld.fav(k1:k2)*c; a.c1=c1.wa.cld.fav(k1:k2)*c; a.w1=w1.wa.cld.fav(k1:k2)*c; 
a.v2=v2.wa.cld.fav(k1:k2)*c; a.c2=c2.wa.cld.fav(k1:k2)*c; a.w2=w2.wa.cld.fav(k1:k2)*c; 
a.v3=v3.wa.cld.fav(k1:k2)*c; a.c3=c3.wa.cld.fav(k1:k2)*c; a.w3=w3.wa.cld.fav(k1:k2)*c; 
a.v4=v4.wa.cld.fav(k1:k2)*c; a.c4=c4.wa.cld.fav(k1:k2)*c; a.w4=w4.wa.cld.fav(k1:k2)*c; 
a.v5=v5.wa.cld.fav(k1:k2)*c; a.c5=c5.wa.cld.fav(k1:k2)*c; a.w5=w5.wa.cld.fav(k1:k2)*c; 
a.v6=v6.wa.cld.fav(k1:k2)*c; a.c6=c6.wa.cld.fav(k1:k2)*c; a.w6=w6.wa.cld.fav(k1:k2)*c; 
xl='cloud fraction'; ydir='reverse'; 
xmin=0; xmax=0.22; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fav_cld_avg_height'; opt=1; ydir='normal'; 
xy=[xmin xmax 0 18]; plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='AVG_cld_avg_temp'; k1=1; k2=64; c=1; opt=4; expn='rce_ins3d';
a.v0=v0.wa.cld.AVG(k1:k2)*c; a.c0=c0.wa.cld.AVG(k1:k2)*c; a.w0=w0.wa.cld.AVG(k1:k2)*c; 
a.v1=v1.wa.cld.AVG(k1:k2)*c; a.c1=c1.wa.cld.AVG(k1:k2)*c; a.w1=w1.wa.cld.AVG(k1:k2)*c; 
a.v2=v2.wa.cld.AVG(k1:k2)*c; a.c2=c2.wa.cld.AVG(k1:k2)*c; a.w2=w2.wa.cld.AVG(k1:k2)*c; 
a.v3=v3.wa.cld.AVG(k1:k2)*c; a.c3=c3.wa.cld.AVG(k1:k2)*c; a.w3=w3.wa.cld.AVG(k1:k2)*c; 
a.v4=v4.wa.cld.AVG(k1:k2)*c; a.c4=c4.wa.cld.AVG(k1:k2)*c; a.w4=w4.wa.cld.AVG(k1:k2)*c; 
a.v5=v5.wa.cld.AVG(k1:k2)*c; a.c5=c5.wa.cld.AVG(k1:k2)*c; a.w5=w5.wa.cld.AVG(k1:k2)*c; 
a.v6=v6.wa.cld.AVG(k1:k2)*c; a.c6=c6.wa.cld.AVG(k1:k2)*c; a.w6=w6.wa.cld.AVG(k1:k2)*c; 
xl='cloud velocity x updraft fractional area (m/s)'; ydir='reverse'; 
xmin=0; xmax=0.01; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='AVG_cld_avg_height'; opt=4; ydir='normal'; 
xy=[xmin xmax 0 18]; plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mf_cld_avg_temp'; k1=1; k2=64; c=1; opt=1; expn='rce_ins3d';
a.v0=v0.wa.cld.AVG(k1:k2).*v0.rho.avg(k1:k2)*c; 
a.c0=c0.wa.cld.AVG(k1:k2).*c0.rho.avg(k1:k2)*c; 
a.w0=w0.wa.cld.AVG(k1:k2).*w0.rho.avg(k1:k2)*c; 
a.v1=v1.wa.cld.AVG(k1:k2).*v1.rho.avg(k1:k2)*c; 
a.c1=c1.wa.cld.AVG(k1:k2).*c1.rho.avg(k1:k2)*c; 
a.w1=w1.wa.cld.AVG(k1:k2).*w1.rho.avg(k1:k2)*c; 
a.v2=v2.wa.cld.AVG(k1:k2).*v2.rho.avg(k1:k2)*c; 
a.c2=c2.wa.cld.AVG(k1:k2).*c2.rho.avg(k1:k2)*c; 
a.w2=w2.wa.cld.AVG(k1:k2).*w2.rho.avg(k1:k2)*c; 
a.v3=v3.wa.cld.AVG(k1:k2).*v3.rho.avg(k1:k2)*c; 
a.c3=c3.wa.cld.AVG(k1:k2).*c3.rho.avg(k1:k2)*c; 
a.w3=w3.wa.cld.AVG(k1:k2).*w3.rho.avg(k1:k2)*c; 
a.v4=v4.wa.cld.AVG(k1:k2).*v4.rho.avg(k1:k2)*c; 
a.c4=c4.wa.cld.AVG(k1:k2).*c4.rho.avg(k1:k2)*c; 
a.w4=w4.wa.cld.AVG(k1:k2).*w4.rho.avg(k1:k2)*c; 
a.v5=v5.wa.cld.AVG(k1:k2).*v5.rho.avg(k1:k2)*c; 
a.c5=c5.wa.cld.AVG(k1:k2).*c5.rho.avg(k1:k2)*c; 
a.w5=w5.wa.cld.AVG(k1:k2).*w5.rho.avg(k1:k2)*c; 
a.v6=v6.wa.cld.AVG(k1:k2).*v6.rho.avg(k1:k2)*c; 
a.c6=c6.wa.cld.AVG(k1:k2).*c6.rho.avg(k1:k2)*c; 
a.w6=w6.wa.cld.AVG(k1:k2).*w6.rho.avg(k1:k2)*c; 
xl='cloud vertical mass flux (kg/m2/s)'; ydir='reverse'; 
xmin=0; xmax=0.009; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mf_cld_avg_height'; opt=1; ydir='normal'; 
xy=[xmin xmax 0 18]; plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wrho_cld_AVG_temp'; k1=1; k2=64; c=1; opt=1; expn='rce_ins3d';
a.v0=v0.wrho.cld.AVG(k1:k2)*c; a.c0=c0.wrho.cld.AVG(k1:k2)*c; a.w0=w0.wrho.cld.AVG(k1:k2)*c; 
a.v1=v1.wrho.cld.AVG(k1:k2)*c; a.c1=c1.wrho.cld.AVG(k1:k2)*c; a.w1=w1.wrho.cld.AVG(k1:k2)*c; 
a.v2=v2.wrho.cld.AVG(k1:k2)*c; a.c2=c2.wrho.cld.AVG(k1:k2)*c; a.w2=w2.wrho.cld.AVG(k1:k2)*c; 
a.v3=v3.wrho.cld.AVG(k1:k2)*c; a.c3=c3.wrho.cld.AVG(k1:k2)*c; a.w3=w3.wrho.cld.AVG(k1:k2)*c; 
a.v4=v4.wrho.cld.AVG(k1:k2)*c; a.c4=c4.wrho.cld.AVG(k1:k2)*c; a.w4=w4.wrho.cld.AVG(k1:k2)*c; 
a.v5=v5.wrho.cld.AVG(k1:k2)*c; a.c5=c5.wrho.cld.AVG(k1:k2)*c; a.w5=w5.wrho.cld.AVG(k1:k2)*c; 
a.v6=v6.wrho.cld.AVG(k1:k2)*c; a.c6=c6.wrho.cld.AVG(k1:k2)*c; a.w6=w6.wrho.cld.AVG(k1:k2)*c; 
xl='mass transport by cloud updraft (kg/m2/s)'; ydir='reverse'; 
xmin=0; xmax=0.009; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wrho_cld_avg_height'; ydir='normal'; opt=1; 
xl='mean vertical velocity of cloud updraft (m/s)';
xy=[xmin xmax 0 18]; plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='buo_cup_avg_temp'; k1=1; k2=64; c=1; opt=1; expn='rce_ins3d';
a.v0=v0.buo.cup.avg(k1:k2)*c; a.c0=c0.buo.cup.avg(k1:k2)*c; a.w0=w0.buo.cup.avg(k1:k2)*c; 
a.v1=v1.buo.cup.avg(k1:k2)*c; a.c1=c1.buo.cup.avg(k1:k2)*c; a.w1=w1.buo.cup.avg(k1:k2)*c; 
a.v2=v2.buo.cup.avg(k1:k2)*c; a.c2=c2.buo.cup.avg(k1:k2)*c; a.w2=w2.buo.cup.avg(k1:k2)*c; 
a.v3=v3.buo.cup.avg(k1:k2)*c; a.c3=c3.buo.cup.avg(k1:k2)*c; a.w3=w3.buo.cup.avg(k1:k2)*c; 
a.v4=v4.buo.cup.avg(k1:k2)*c; a.c4=c4.buo.cup.avg(k1:k2)*c; a.w4=w4.buo.cup.avg(k1:k2)*c; 
a.v5=v5.buo.cup.avg(k1:k2)*c; a.c5=c5.buo.cup.avg(k1:k2)*c; a.w5=w5.buo.cup.avg(k1:k2)*c; 
a.v6=v6.buo.cup.avg(k1:k2)*c; a.c6=c6.buo.cup.avg(k1:k2)*c; a.w6=w6.buo.cup.avg(k1:k2)*c; 
xl='cloud updraft buoyancy (m/s2)'; ydir='reverse'; 
xmin=-0.1; xmax=0.1; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_all_avg_height'; ydir='normal'; opt=1; 
xl='mean vertical velocity of cloud updraft (m/s)';
xy=[xmin xmax 0 18]; plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='thvp_cup_avg_temp'; k1=1; k2=64; c=1; opt=1; expn='rce_ins3d';
a.v0=v0.thvp.cup.avg(k1:k2)*c; a.c0=c0.thvp.cup.avg(k1:k2)*c; a.w0=w0.thvp.cup.avg(k1:k2)*c; 
a.v1=v1.thvp.cup.avg(k1:k2)*c; a.c1=c1.thvp.cup.avg(k1:k2)*c; a.w1=w1.thvp.cup.avg(k1:k2)*c; 
a.v2=v2.thvp.cup.avg(k1:k2)*c; a.c2=c2.thvp.cup.avg(k1:k2)*c; a.w2=w2.thvp.cup.avg(k1:k2)*c; 
a.v3=v3.thvp.cup.avg(k1:k2)*c; a.c3=c3.thvp.cup.avg(k1:k2)*c; a.w3=w3.thvp.cup.avg(k1:k2)*c; 
a.v4=v4.thvp.cup.avg(k1:k2)*c; a.c4=c4.thvp.cup.avg(k1:k2)*c; a.w4=w4.thvp.cup.avg(k1:k2)*c; 
a.v5=v5.thvp.cup.avg(k1:k2)*c; a.c5=c5.thvp.cup.avg(k1:k2)*c; a.w5=w5.thvp.cup.avg(k1:k2)*c; 
a.v6=v6.thvp.cup.avg(k1:k2)*c; a.c6=c6.thvp.cup.avg(k1:k2)*c; a.w6=w6.thvp.cup.avg(k1:k2)*c; 
xl='cloud updraft \theta_v (K)'; ydir='reverse'; 
xmin=-2; xmax=2; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_all_avg_height'; ydir='normal'; opt=1; 
xl='mean vertical velocity of cloud updraft (m/s)';
xy=[xmin xmax 0 18]; plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wqt_cup_avg_temp'; k1=1; k2=64; c=1; opt=1; expn='rce_ins3d';
a.v0=v0.wqt.cup.avg(k1:k2)*c; a.c0=c0.wqt.cup.avg(k1:k2)*c; a.w0=w0.wqt.cup.avg(k1:k2)*c; 
a.v1=v1.wqt.cup.avg(k1:k2)*c; a.c1=c1.wqt.cup.avg(k1:k2)*c; a.w1=w1.wqt.cup.avg(k1:k2)*c; 
a.v2=v2.wqt.cup.avg(k1:k2)*c; a.c2=c2.wqt.cup.avg(k1:k2)*c; a.w2=w2.wqt.cup.avg(k1:k2)*c; 
a.v3=v3.wqt.cup.avg(k1:k2)*c; a.c3=c3.wqt.cup.avg(k1:k2)*c; a.w3=w3.wqt.cup.avg(k1:k2)*c; 
a.v4=v4.wqt.cup.avg(k1:k2)*c; a.c4=c4.wqt.cup.avg(k1:k2)*c; a.w4=w4.wqt.cup.avg(k1:k2)*c; 
a.v5=v5.wqt.cup.avg(k1:k2)*c; a.c5=c5.wqt.cup.avg(k1:k2)*c; a.w5=w5.wqt.cup.avg(k1:k2)*c; 
a.v6=v6.wqt.cup.avg(k1:k2)*c; a.c6=c6.wqt.cup.avg(k1:k2)*c; a.w6=w6.wqt.cup.avg(k1:k2)*c; 
xl='cloud updraft total water flux (kg/m2/s)'; ydir='reverse'; 
xmin=0; xmax=0.008; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_all_avg_height'; ydir='normal'; opt=1; 
xl='total water flux (kg/m2/s)';
xy=[xmin xmax 0 18]; plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wqt_clr_avg_temp'; k1=1; k2=64; c=1; opt=1; expn='rce_ins3d';
a.v0=v0.wqt.clr.avg(k1:k2)*c; a.c0=c0.wqt.clr.avg(k1:k2)*c; a.w0=w0.wqt.clr.avg(k1:k2)*c; 
a.v1=v1.wqt.clr.avg(k1:k2)*c; a.c1=c1.wqt.clr.avg(k1:k2)*c; a.w1=w1.wqt.clr.avg(k1:k2)*c; 
a.v2=v2.wqt.clr.avg(k1:k2)*c; a.c2=c2.wqt.clr.avg(k1:k2)*c; a.w2=w2.wqt.clr.avg(k1:k2)*c; 
a.v3=v3.wqt.clr.avg(k1:k2)*c; a.c3=c3.wqt.clr.avg(k1:k2)*c; a.w3=w3.wqt.clr.avg(k1:k2)*c; 
a.v4=v4.wqt.clr.avg(k1:k2)*c; a.c4=c4.wqt.clr.avg(k1:k2)*c; a.w4=w4.wqt.clr.avg(k1:k2)*c; 
a.v5=v5.wqt.clr.avg(k1:k2)*c; a.c5=c5.wqt.clr.avg(k1:k2)*c; a.w5=w5.wqt.clr.avg(k1:k2)*c; 
a.v6=v6.wqt.clr.avg(k1:k2)*c; a.c6=c6.wqt.clr.avg(k1:k2)*c; a.w6=w6.wqt.clr.avg(k1:k2)*c; 
xl='cloud updraft total water flux (kg/m2/s)'; ydir='reverse'; 
xmin=0; xmax=0.008; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax2=0; plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa_all_avg_height'; ydir='normal'; opt=1; 
xl='total water flux (kg/m2/s)';
xy=[xmin xmax 0 18]; plot_a_b_height; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fav_cdn_avg_temp'; k1=1; k2=64; c=1; opt=1;
a.v0=v0.wa.cdn.fav(k1:k2)*c; a.c0=c0.wa.cdn.fav(k1:k2)*c; a.w0=w0.wa.cdn.fav(k1:k2)*c; 
a.v1=v1.wa.cdn.fav(k1:k2)*c; a.c1=c1.wa.cdn.fav(k1:k2)*c; a.w1=w1.wa.cdn.fav(k1:k2)*c; 
a.v2=v2.wa.cdn.fav(k1:k2)*c; a.c2=c2.wa.cdn.fav(k1:k2)*c; a.w2=w2.wa.cdn.fav(k1:k2)*c; 
a.v3=v3.wa.cdn.fav(k1:k2)*c; a.c3=c3.wa.cdn.fav(k1:k2)*c; a.w3=w3.wa.cdn.fav(k1:k2)*c; 
a.v4=v4.wa.cdn.fav(k1:k2)*c; a.c4=c4.wa.cdn.fav(k1:k2)*c; a.w4=w4.wa.cdn.fav(k1:k2)*c; 
a.v5=v5.wa.cdn.fav(k1:k2)*c; a.c5=c5.wa.cdn.fav(k1:k2)*c; a.w5=w5.wa.cdn.fav(k1:k2)*c; 
a.v6=v6.wa.cdn.fav(k1:k2)*c; a.c6=c6.wa.cdn.fav(k1:k2)*c; a.w6=w6.wa.cdn.fav(k1:k2)*c; 
xl='fractional area of cloud downdraft'; yl='temperature (K)'; ydir='reverse'; 
xmin=0; xmax=0.1; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='AVG_cup_avg_temp'; k1=1; k2=64; c=1; opt=1;
a.v0=v0.wa.cup.AVG(k1:k2)*c; a.c0=c0.wa.cup.AVG(k1:k2)*c; a.w0=w0.wa.cup.AVG(k1:k2)*c; 
a.v1=v1.wa.cup.AVG(k1:k2)*c; a.c1=c1.wa.cup.AVG(k1:k2)*c; a.w1=w1.wa.cup.AVG(k1:k2)*c; 
a.v2=v2.wa.cup.AVG(k1:k2)*c; a.c2=c2.wa.cup.AVG(k1:k2)*c; a.w2=w2.wa.cup.AVG(k1:k2)*c; 
a.v3=v3.wa.cup.AVG(k1:k2)*c; a.c3=c3.wa.cup.AVG(k1:k2)*c; a.w3=w3.wa.cup.AVG(k1:k2)*c; 
a.v4=v4.wa.cup.AVG(k1:k2)*c; a.c4=c4.wa.cup.AVG(k1:k2)*c; a.w4=w4.wa.cup.AVG(k1:k2)*c; 
a.v5=v5.wa.cup.AVG(k1:k2)*c; a.c5=c5.wa.cup.AVG(k1:k2)*c; a.w5=w5.wa.cup.AVG(k1:k2)*c; 
a.v6=v6.wa.cup.AVG(k1:k2)*c; a.c6=c6.wa.cup.AVG(k1:k2)*c; a.w6=w6.wa.cup.AVG(k1:k2)*c; 
xl='mass flux of cloud updrafts'; yl='temperature (K)'; ydir='reverse'; 
xmin=0; xmax=0.012; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='AVG_cdn_avg_temp'; k1=1; k2=64; c=1; opt=1;
a.v0=v0.wa.cdn.AVG(k1:k2)*c; a.c0=c0.wa.cdn.AVG(k1:k2)*c; a.w0=w0.wa.cdn.AVG(k1:k2)*c; 
a.v1=v1.wa.cdn.AVG(k1:k2)*c; a.c1=c1.wa.cdn.AVG(k1:k2)*c; a.w1=w1.wa.cdn.AVG(k1:k2)*c; 
a.v2=v2.wa.cdn.AVG(k1:k2)*c; a.c2=c2.wa.cdn.AVG(k1:k2)*c; a.w2=w2.wa.cdn.AVG(k1:k2)*c; 
a.v3=v3.wa.cdn.AVG(k1:k2)*c; a.c3=c3.wa.cdn.AVG(k1:k2)*c; a.w3=w3.wa.cdn.AVG(k1:k2)*c; 
a.v4=v4.wa.cdn.AVG(k1:k2)*c; a.c4=c4.wa.cdn.AVG(k1:k2)*c; a.w4=w4.wa.cdn.AVG(k1:k2)*c; 
a.v5=v5.wa.cdn.AVG(k1:k2)*c; a.c5=c5.wa.cdn.AVG(k1:k2)*c; a.w5=w5.wa.cdn.AVG(k1:k2)*c; 
a.v6=v6.wa.cdn.AVG(k1:k2)*c; a.c6=c6.wa.cdn.AVG(k1:k2)*c; a.w6=w6.wa.cdn.AVG(k1:k2)*c; 
xl='fractional area of cloud downdraft'; yl='temperature (K)'; ydir='reverse'; 
xmin=0; xmax=0.1; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qc_all_avg_temp'; k1=1; k2=64; c=1000; opt=1;
a.v0=v0.qc.all.avg(k1:k2)*c; a.c0=c0.qc.all.avg(k1:k2)*c; a.w0=w0.qc.all.avg(k1:k2)*c; 
a.v1=v1.qc.all.avg(k1:k2)*c; a.c1=c1.qc.all.avg(k1:k2)*c; a.w1=w1.qc.all.avg(k1:k2)*c; 
a.v2=v2.qc.all.avg(k1:k2)*c; a.c2=c2.qc.all.avg(k1:k2)*c; a.w2=w2.qc.all.avg(k1:k2)*c; 
a.v3=v3.qc.all.avg(k1:k2)*c; a.c3=c3.qc.all.avg(k1:k2)*c; a.w3=w3.qc.all.avg(k1:k2)*c; 
a.v4=v4.qc.all.avg(k1:k2)*c; a.c4=c4.qc.all.avg(k1:k2)*c; a.w4=w4.qc.all.avg(k1:k2)*c; 
a.v5=v5.qc.all.avg(k1:k2)*c; a.c5=c5.qc.all.avg(k1:k2)*c; a.w5=w5.qc.all.avg(k1:k2)*c; 
a.v6=v6.qc.all.avg(k1:k2)*c; a.c6=c6.qc.all.avg(k1:k2)*c; a.w6=w6.qc.all.avg(k1:k2)*c; 
xl='mean cloud condensate (g/kg)'; yl='temperature (K)'; ydir='reverse'; 
xmin=0; xmax=0.1; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax1_only=1; plot_a_b_temp; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qc_cup_avg_temp'; k1=1; k2=64; c=1000; opt=4;
a.v0=v0.qc.cup.avg(k1:k2)*c; a.c0=c0.qc.cup.avg(k1:k2)*c; a.w0=w0.qc.cup.avg(k1:k2)*c; 
a.v1=v1.qc.cup.avg(k1:k2)*c; a.c1=c1.qc.cup.avg(k1:k2)*c; a.w1=w1.qc.cup.avg(k1:k2)*c; 
a.v2=v2.qc.cup.avg(k1:k2)*c; a.c2=c2.qc.cup.avg(k1:k2)*c; a.w2=w2.qc.cup.avg(k1:k2)*c; 
a.v3=v3.qc.cup.avg(k1:k2)*c; a.c3=c3.qc.cup.avg(k1:k2)*c; a.w3=w3.qc.cup.avg(k1:k2)*c; 
a.v4=v4.qc.cup.avg(k1:k2)*c; a.c4=c4.qc.cup.avg(k1:k2)*c; a.w4=w4.qc.cup.avg(k1:k2)*c; 
a.v5=v5.qc.cup.avg(k1:k2)*c; a.c5=c5.qc.cup.avg(k1:k2)*c; a.w5=w5.qc.cup.avg(k1:k2)*c; 
a.v6=v6.qc.cup.avg(k1:k2)*c; a.c6=c6.qc.cup.avg(k1:k2)*c; a.w6=w6.qc.cup.avg(k1:k2)*c; 
xl='mean condensate for cloud updraft (g/kg)'; yl='temperature (K)'; ydir='reverse'; 
xmin=0; xmax=0.8; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
do_ax1_only=1; plot_a_b_temp; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qc_cdn_avg_temp'; k1=1; k2=64; c=1000; opt=4;
a.v0=v0.qc.cdn.avg(k1:k2)*c; a.c0=c0.qc.cdn.avg(k1:k2)*c; a.w0=w0.qc.cdn.avg(k1:k2)*c; 
a.v1=v1.qc.cdn.avg(k1:k2)*c; a.c1=c1.qc.cdn.avg(k1:k2)*c; a.w1=w1.qc.cdn.avg(k1:k2)*c; 
a.v2=v2.qc.cdn.avg(k1:k2)*c; a.c2=c2.qc.cdn.avg(k1:k2)*c; a.w2=w2.qc.cdn.avg(k1:k2)*c; 
a.v3=v3.qc.cdn.avg(k1:k2)*c; a.c3=c3.qc.cdn.avg(k1:k2)*c; a.w3=w3.qc.cdn.avg(k1:k2)*c; 
a.v4=v4.qc.cdn.avg(k1:k2)*c; a.c4=c4.qc.cdn.avg(k1:k2)*c; a.w4=w4.qc.cdn.avg(k1:k2)*c; 
a.v5=v5.qc.cdn.avg(k1:k2)*c; a.c5=c5.qc.cdn.avg(k1:k2)*c; a.w5=w5.qc.cdn.avg(k1:k2)*c; 
a.v6=v6.qc.cdn.avg(k1:k2)*c; a.c6=c6.qc.cdn.avg(k1:k2)*c; a.w6=w6.qc.cdn.avg(k1:k2)*c; 
xl='mean condensate for cloud downdraft (g/kg)'; yl='temperature (K)'; ydir='reverse'; 
xmin=0; xmax=0.8; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp;  expn='rce_ins3d'; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qc_dn_avg_temp'; k1=1; k2=64; c=1000; opt=4;
a.v0=v0.qc.dn.avg(k1:k2)*c; a.c0=c0.qc.dn.avg(k1:k2)*c; a.w0=w0.qc.dn.avg(k1:k2)*c; 
a.v1=v1.qc.dn.avg(k1:k2)*c; a.c1=c1.qc.dn.avg(k1:k2)*c; a.w1=w1.qc.dn.avg(k1:k2)*c; 
a.v2=v2.qc.dn.avg(k1:k2)*c; a.c2=c2.qc.dn.avg(k1:k2)*c; a.w2=w2.qc.dn.avg(k1:k2)*c; 
a.v3=v3.qc.dn.avg(k1:k2)*c; a.c3=c3.qc.dn.avg(k1:k2)*c; a.w3=w3.qc.dn.avg(k1:k2)*c; 
a.v4=v4.qc.dn.avg(k1:k2)*c; a.c4=c4.qc.dn.avg(k1:k2)*c; a.w4=w4.qc.dn.avg(k1:k2)*c; 
a.v5=v5.qc.dn.avg(k1:k2)*c; a.c5=c5.qc.dn.avg(k1:k2)*c; a.w5=w5.qc.dn.avg(k1:k2)*c; 
a.v6=v6.qc.dn.avg(k1:k2)*c; a.c6=c6.qc.dn.avg(k1:k2)*c; a.w6=w6.qc.dn.avg(k1:k2)*c; 
xl='mean condensate for cloud downdraft (g/kg)'; yl='temperature (K)'; ydir='reverse'; 
xmin=0; xmax=0.1; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp;  expn='rce_ins3d'; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qc_dn_avg_temp'; k1=1; k2=64; c=1000; opt=4;
a.v0=v0.qc.dn.avg(k1:k2)*c; a.c0=c0.qc.dn.avg(k1:k2)*c; a.w0=w0.qc.dn.avg(k1:k2)*c; 
a.v1=v1.qc.dn.avg(k1:k2)*c; a.c1=c1.qc.dn.avg(k1:k2)*c; a.w1=w1.qc.dn.avg(k1:k2)*c; 
a.v2=v2.qc.dn.avg(k1:k2)*c; a.c2=c2.qc.dn.avg(k1:k2)*c; a.w2=w2.qc.dn.avg(k1:k2)*c; 
a.v3=v3.qc.dn.avg(k1:k2)*c; a.c3=c3.qc.dn.avg(k1:k2)*c; a.w3=w3.qc.dn.avg(k1:k2)*c; 
a.v4=v4.qc.dn.avg(k1:k2)*c; a.c4=c4.qc.dn.avg(k1:k2)*c; a.w4=w4.qc.dn.avg(k1:k2)*c; 
a.v5=v5.qc.dn.avg(k1:k2)*c; a.c5=c5.qc.dn.avg(k1:k2)*c; a.w5=w5.qc.dn.avg(k1:k2)*c; 
a.v6=v6.qc.dn.avg(k1:k2)*c; a.c6=c6.qc.dn.avg(k1:k2)*c; a.w6=w6.qc.dn.avg(k1:k2)*c; 
xl='mean condensate for cloud downdraft (g/kg)'; yl='temperature (K)'; ydir='reverse'; 
xmin=0; xmax=0.1; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp;  expn='rce_ins3d'; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ta_cup_m_cdn_avg_temp'; k1=1; k2=64; c=1; opt=4;
a.v0=v0.ta.cup.avg(k1:k2)-v0.ta.cdn.avg(k1:k2);
a.c0=c0.ta.cup.avg(k1:k2)-c0.ta.cdn.avg(k1:k2);
a.w0=w0.ta.cup.avg(k1:k2)-w0.ta.cdn.avg(k1:k2);
a.v1=v1.ta.cup.avg(k1:k2)-v1.ta.cdn.avg(k1:k2);
a.c1=c1.ta.cup.avg(k1:k2)-c1.ta.cdn.avg(k1:k2);
a.w1=w1.ta.cup.avg(k1:k2)-w1.ta.cdn.avg(k1:k2);
xl='mean temperature for cloud updraft (g/kg)'; ydir='reverse'; 
xmin=-5; xmax=5; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xl='mean temperature for cloud updraft (g/kg)'; ydir='normal'; 
xmin=-5; xmax=5; ymin=0; ymax=18; xy=[xmin xmax ymin ymax]; plot_a_b_height;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ta_cup_m_all_avg_temp'; k1=1; k2=64; c=1; opt=4;
a.v0=v0.ta.cup.avg(k1:k2)-v0.ta.all.avg(k1:k2);
a.c0=c0.ta.cup.avg(k1:k2)-c0.ta.all.avg(k1:k2);
a.w0=w0.ta.cup.avg(k1:k2)-w0.ta.all.avg(k1:k2);
a.v1=v1.ta.cup.avg(k1:k2)-v1.ta.all.avg(k1:k2);
a.c1=c1.ta.cup.avg(k1:k2)-c1.ta.all.avg(k1:k2);
a.w1=w1.ta.cup.avg(k1:k2)-w1.ta.all.avg(k1:k2);
xl='mean temperature for cloud updraft (g/kg)'; ydir='reverse'; 
xmin=-5; xmax=5; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xl='mean temperature for cloud updraft (g/kg)'; ydir='normal'; 
xmin=-5; xmax=5; ymin=0; ymax=18; xy=[xmin xmax ymin ymax]; plot_a_b_height;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tv_cup_m_cdn_avg_temp'; k1=1; k2=64; c=1; opt=4;
a.v0=v0.tv.cup.avg(k1:k2)-v0.tv.cdn.avg(k1:k2);
a.c0=c0.tv.cup.avg(k1:k2)-c0.tv.cdn.avg(k1:k2);
a.w0=w0.tv.cup.avg(k1:k2)-w0.tv.cdn.avg(k1:k2);
a.v1=v1.tv.cup.avg(k1:k2)-v1.tv.cdn.avg(k1:k2);
a.c1=c1.tv.cup.avg(k1:k2)-c1.tv.cdn.avg(k1:k2);
a.w1=w1.tv.cup.avg(k1:k2)-w1.tv.cdn.avg(k1:k2);
xl='mean temperature for cloud updraft (g/kg)'; ydir='reverse'; 
xmin=-5; xmax=5; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xl='mean temperature for cloud updraft (g/kg)'; ydir='normal'; 
xmin=-5; xmax=5; ymin=0; ymax=18; xy=[xmin xmax ymin ymax]; plot_a_b_height;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tv_cup_m_all_avg_temp'; k1=1; k2=64; c=1; opt=4;
a.v0=v0.tv.cup.avg(k1:k2)-v0.tv.all.avg(k1:k2);
a.c0=c0.tv.cup.avg(k1:k2)-c0.tv.all.avg(k1:k2);
a.w0=w0.tv.cup.avg(k1:k2)-w0.tv.all.avg(k1:k2);
a.v1=v1.tv.cup.avg(k1:k2)-v1.tv.all.avg(k1:k2);
a.c1=c1.tv.cup.avg(k1:k2)-c1.tv.all.avg(k1:k2);
a.w1=w1.tv.cup.avg(k1:k2)-w1.tv.all.avg(k1:k2);
xl='mean temperature for cloud updraft (g/kg)'; ydir='reverse'; 
xmin=-5; xmax=5; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xl='mean temperature for cloud updraft (g/kg)'; ydir='normal'; 
xmin=-5; xmax=5; ymin=0; ymax=18; xy=[xmin xmax ymin ymax]; plot_a_b_height;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='thv_cup_m_cdn_avg_temp'; k1=1; k2=64; c=1; opt=4;
a.v0=v0.thv.cup.avg(k1:k2)-v0.thv.cdn.avg(k1:k2);
a.c0=c0.thv.cup.avg(k1:k2)-c0.thv.cdn.avg(k1:k2);
a.w0=w0.thv.cup.avg(k1:k2)-w0.thv.cdn.avg(k1:k2);
a.v1=v1.thv.cup.avg(k1:k2)-v1.thv.cdn.avg(k1:k2);
a.c1=c1.thv.cup.avg(k1:k2)-c1.thv.cdn.avg(k1:k2);
a.w1=w1.thv.cup.avg(k1:k2)-w1.thv.cdn.avg(k1:k2);
xl='mean temperature for cloud updraft (g/kg)'; ydir='reverse'; 
xmin=-5; xmax=5; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xl='mean temperature for cloud updraft (g/kg)'; ydir='normal'; 
xmin=-5; xmax=5; ymin=0; ymax=18; xy=[xmin xmax ymin ymax]; plot_a_b_height;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='thv_cup_m_all_avg_temp'; k1=1; k2=64; c=1; opt=4;
a.v0=v0.thv.cup.avg(k1:k2)-v0.thv.all.avg(k1:k2);
a.c0=c0.thv.cup.avg(k1:k2)-c0.thv.all.avg(k1:k2);
a.w0=w0.thv.cup.avg(k1:k2)-w0.thv.all.avg(k1:k2);
a.v1=v1.thv.cup.avg(k1:k2)-v1.thv.all.avg(k1:k2);
a.c1=c1.thv.cup.avg(k1:k2)-c1.thv.all.avg(k1:k2);
a.w1=w1.thv.cup.avg(k1:k2)-w1.thv.all.avg(k1:k2);
xl='mean temperature for cloud updraft (g/kg)'; ydir='reverse'; 
xmin=-5; xmax=5; ymin=198; ymax=305; xy=[xmin xmax ymin ymax]; xy0=[0 18 ymin ymax]; 
plot_a_b_temp; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xl='mean temperature for cloud updraft (g/kg)'; ydir='normal'; 
xmin=-5; xmax=5; ymin=0; ymax=18; xy=[xmin xmax ymin ymax]; plot_a_b_height;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





vname='w500_pdf_org'; xy=[-3 12 1E-6 10];
a=v0.w500_org.all; binc=a.binc; bins=a.bins; 
a.v0=v0.w500_org.all.pdf./bins; a.v1=v1.w500_org.all.pdf./bins; 
a.v2=v2.w500_org.all.pdf./bins; a.v3=v3.w500_org.all.pdf./bins; 
a.v4=v4.w500_org.all.pdf./bins; a.v5=v5.w500_org.all.pdf./bins; 
a.v6=v6.w500_org.all.pdf./bins; 
pms=[ 0, 0, 1200, 800]*0.8; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
lw='LineWidth'; d1=2; d2=3;
semilogy(binc,a.v0,V0,lw,d1); hold on; 
semilogy(binc,a.v1,V1,lw,d1); semilogy(binc,a.v2,V2,lw,d1);
semilogy(binc,a.v3,V3,lw,d1); semilogy(binc,a.v4,V4,lw,d1);
semilogy(binc,a.v5,V5,lw,d1); semilogy(binc,a.v6,V6,lw,d2);
legend('R1.5','R03','R06','R12','R24','R48','R48C',1); 
xl='500hPa instantaneous vertical velocity (m/s)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (m/s)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w500_pdf_R96_10day'; xy=[-100 100 0 0.02];
a=v0.w500_r96_10day.all; binc=a.binc; bins=a.bins; 
a.v0=v0.w500_r96_10day.all.pdf./bins; a.v1=v1.w500_r96_10day.all.pdf./bins; 
a.v2=v2.w500_r96_10day.all.pdf./bins; a.v3=v3.w500_r96_10day.all.pdf./bins; 
a.v4=v4.w500_r96_10day.all.pdf./bins; a.v5=v5.w500_r96_10day.all.pdf./bins; 
a.v6=v6.w500_r96_10day.all.pdf./bins; 
pms=[ 0, 0, 1200, 800]*0.8; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
lw='LineWidth'; d1=2; d2=3;
plot(binc,a.v0,V0,lw,d1); hold on; 
plot(binc,a.v1,V1,lw,d1); plot(binc,a.v2,V2,lw,d1);
plot(binc,a.v3,V3,lw,d1); plot(binc,a.v4,V4,lw,d1);
plot(binc,a.v5,V5,lw,d1); plot(binc,a.v6,V6,lw,d2);
legend('R1.5','R03','R06','R12','R24','R48','R48C',1); 
xl='500hPa large-scale vertical velocity (hPa/day)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (hPa/day)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w500_pdf_R96_5day'; xy=[-100 100 0 0.016];
a=v0.w500_r96_5day.all; binc=a.binc; bins=a.bins; 
a.v0=v0.w500_r96_5day.all.pdf./bins; a.v1=v1.w500_r96_5day.all.pdf./bins; 
a.v2=v2.w500_r96_5day.all.pdf./bins; a.v3=v3.w500_r96_5day.all.pdf./bins; 
a.v4=v4.w500_r96_5day.all.pdf./bins; a.v5=v5.w500_r96_5day.all.pdf./bins; 
a.v6=v6.w500_r96_5day.all.pdf./bins; 
pms=[ 0, 0, 1200, 800]*0.8; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
lw='LineWidth'; d1=2; d2=3;
plot(binc,a.v0,V0,lw,d1); hold on; 
plot(binc,a.v1,V1,lw,d1); plot(binc,a.v2,V2,lw,d1);
plot(binc,a.v3,V3,lw,d1); plot(binc,a.v4,V4,lw,d1);
plot(binc,a.v5,V5,lw,d1); plot(binc,a.v6,V6,lw,d2);
legend('R1.5','R03','R06','R12','R24','R48','R48C',1); 
xl='500hPa large-scale vertical velocity (hPa/day)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (hPa/day)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w500_pdf_R96_30day'; xy=[-100 100 0 0.03];
a=v0.w500_r96_30day.all; binc=a.binc; bins=a.bins; 
a.v0=v0.w500_r96_30day.all.pdf./bins; a.v1=v1.w500_r96_30day.all.pdf./bins; 
a.v2=v2.w500_r96_30day.all.pdf./bins; a.v3=v3.w500_r96_30day.all.pdf./bins; 
a.v4=v4.w500_r96_30day.all.pdf./bins; a.v5=v5.w500_r96_30day.all.pdf./bins; 
a.v6=v6.w500_r96_30day.all.pdf./bins; 
pms=[ 0, 0, 1200, 800]*0.8; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
lw='LineWidth'; d1=2; d2=3;
plot(binc,a.v0,V0,lw,d1); hold on; 
plot(binc,a.v1,V1,lw,d1); plot(binc,a.v2,V2,lw,d1);
plot(binc,a.v3,V3,lw,d1); plot(binc,a.v4,V4,lw,d1);
plot(binc,a.v5,V5,lw,d1); plot(binc,a.v6,V6,lw,d2);
legend('R1.5','R03','R06','R12','R24','R48','R48C',1); 
xl='500hPa large-scale vertical velocity (hPa/day)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (hPa/day)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w_fa_cup_cdn_org';
a.v0=v0.w500_org.cup.avg; a.c0=c0.w500_org.cup.avg; a.w0=w0.w500_org.cup.avg;
a.v1=v1.w500_org.cup.avg; a.c1=c1.w500_org.cup.avg; a.w1=w1.w500_org.cup.avg;
a.v2=v2.w500_org.cup.avg; a.c2=c2.w500_org.cup.avg; a.w2=w2.w500_org.cup.avg;
a.v3=v3.w500_org.cup.avg; a.c3=c3.w500_org.cup.avg; a.w3=w3.w500_org.cup.avg;
a.v4=v4.w500_org.cup.avg; a.c4=c4.w500_org.cup.avg; a.w4=w4.w500_org.cup.avg;
a.v5=v5.w500_org.cup.avg; a.c5=c5.w500_org.cup.avg; a.w5=w5.w500_org.cup.avg;
a.v6=v6.w500_org.cup.avg; a.c6=c6.w500_org.cup.avg; a.w6=w6.w500_org.cup.avg;
b.v0=v0.w500_org.cdn.avg; b.c0=c0.w500_org.cdn.avg; b.w0=w0.w500_org.cdn.avg;
b.v1=v1.w500_org.cdn.avg; b.c1=c1.w500_org.cdn.avg; b.w1=w1.w500_org.cdn.avg;
b.v2=v2.w500_org.cdn.avg; b.c2=c2.w500_org.cdn.avg; b.w2=w2.w500_org.cdn.avg;
b.v3=v3.w500_org.cdn.avg; b.c3=c3.w500_org.cdn.avg; b.w3=w3.w500_org.cdn.avg;
b.v4=v4.w500_org.cdn.avg; b.c4=c4.w500_org.cdn.avg; b.w4=w4.w500_org.cdn.avg;
b.v5=v5.w500_org.cdn.avg; b.c5=c5.w500_org.cdn.avg; b.w5=w5.w500_org.cdn.avg;
b.v6=v6.w500_org.cdn.avg; b.c6=c6.w500_org.cdn.avg; b.w6=w6.w500_org.cdn.avg;
c.v0=v0.w500_org.cup.fav; c.c0=c0.w500_org.cup.fav; c.w0=w0.w500_org.cup.fav;
c.v1=v1.w500_org.cup.fav; c.c1=c1.w500_org.cup.fav; c.w1=w1.w500_org.cup.fav;
c.v2=v2.w500_org.cup.fav; c.c2=c2.w500_org.cup.fav; c.w2=w2.w500_org.cup.fav;
c.v3=v3.w500_org.cup.fav; c.c3=c3.w500_org.cup.fav; c.w3=w3.w500_org.cup.fav;
c.v4=v4.w500_org.cup.fav; c.c4=c4.w500_org.cup.fav; c.w4=w4.w500_org.cup.fav;
c.v5=v5.w500_org.cup.fav; c.c5=c5.w500_org.cup.fav; c.w5=w5.w500_org.cup.fav;
c.v6=v6.w500_org.cup.fav; c.c6=c6.w500_org.cup.fav; c.w6=w6.w500_org.cup.fav;
d.v0=v0.w500_org.cdn.fav; d.c0=c0.w500_org.cdn.fav; d.w0=w0.w500_org.cdn.fav;
d.v1=v1.w500_org.cdn.fav; d.c1=c1.w500_org.cdn.fav; d.w1=w1.w500_org.cdn.fav;
d.v2=v2.w500_org.cdn.fav; d.c2=c2.w500_org.cdn.fav; d.w2=w2.w500_org.cdn.fav;
d.v3=v3.w500_org.cdn.fav; d.c3=c3.w500_org.cdn.fav; d.w3=w3.w500_org.cdn.fav;
d.v4=v4.w500_org.cdn.fav; d.c4=c4.w500_org.cdn.fav; d.w4=w4.w500_org.cdn.fav;
d.v5=v5.w500_org.cdn.fav; d.c5=c5.w500_org.cdn.fav; d.w5=w5.w500_org.cdn.fav;
d.v6=v6.w500_org.cdn.fav; d.c6=c6.w500_org.cdn.fav; d.w6=w6.w500_org.cdn.fav;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=[1:7]; xy1=[0.5 7.5 -0.5 1.5]; xdir='normal';
yup=[a.v0 a.v1 a.v2 a.v3 a.v4 a.v5 a.v6]; %cup avg
ydn=[b.v0 b.v1 b.v2 b.v3 b.v4 b.v5 b.v6]; %cdn avg
xy2=[0.5 7.5 0 3];
zup=[c.v0 c.v1 c.v2 c.v3 c.v4 c.v5 c.v6]; %cup fav
zdn=[d.v0 d.v1 d.v2 d.v3 d.v4 d.v5 d.v6]; %cdn fav
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
CO='Color';  LS='LineStyle'; s1='-'; s2='--'; s3='-.'; s4=':';
MK='Marker'; LW='LineWidth'; d1=1; d2=d1*3;
MS='MarkerSize';
line(x, yup, CO,'k', LS,s1, MK,'^', MS,8, LW,d2); hold on;
line(x, ydn, CO,'k', LS,s1, MK,'v', MS,8, LW,d2); hold on;
%line(x, y3,  CO,'k', LS,s1, MK,'^', MS,8, LW,d1); hold on;
%line(x, yy3, CO,'k', LS,s1, MK,'v', MS,8, LW,d1); hold on;
xlist={'R1.5','R03','R06','R12','R24','R48','R48C'}; axis(xy1);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
set(gca,'xDir',xdir,'FontSize',fsize);
yl='cloud updraft/downdraft velocity (m/s)'; ylabel(yl,'FontSize',fsize);
xl='horizontal resolution (km)'; xlabel(xl,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
ax1 = gca; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ax2=axes('Position',get(ax1,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','b','YColor','b');
line(x, zup*100, CO,'b', LS,s1, MK,'^', MS,8, LW,d2);hold on;
line(x, zdn*100, CO,'b', LS,s1, MK,'v', MS,8, LW,d2);hold on;
%line(x, z3 *100, CO,'b', LS,s1, MK,'^', MS,8, LW,d1);hold on;
%line(x, zz3*100, CO,'b', LS,s1, MK,'v', MS,8, LW,d1);hold on;
set(gca,'xDir',xdir,'FontSize',fsize); 
yl='cloud updraft/downdraft area (%)'; ylabel(yl,'FontSize',fsize);
xlist={'R1.5','R03','R06','R12','R24','R48','R48C'}; axis(xy2);
set(gca,'xticklabel',xlist,'FontSize',fsize);
set(gca,'xDir',xdir,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w_fa_cup_cdn_r96'; c=1/(0.65*G*864)
a.v0=v0.w500_r96_ins.cup.avg*c; a.c0=c0.w500_r96_ins.cup.avg*c; a.w0=w0.w500_r96_ins.cup.avg*c;
a.v1=v1.w500_r96_ins.cup.avg*c; a.c1=c1.w500_r96_ins.cup.avg*c; a.w1=w1.w500_r96_ins.cup.avg*c;
a.v2=v2.w500_r96_ins.cup.avg*c; a.c2=c2.w500_r96_ins.cup.avg*c; a.w2=w2.w500_r96_ins.cup.avg*c;
a.v3=v3.w500_r96_ins.cup.avg*c; a.c3=c3.w500_r96_ins.cup.avg*c; a.w3=w3.w500_r96_ins.cup.avg*c;
a.v4=v4.w500_r96_ins.cup.avg*c; a.c4=c4.w500_r96_ins.cup.avg*c; a.w4=w4.w500_r96_ins.cup.avg*c;
a.v5=v5.w500_r96_ins.cup.avg*c; a.c5=c5.w500_r96_ins.cup.avg*c; a.w5=w5.w500_r96_ins.cup.avg*c;
a.v6=v6.w500_r96_ins.cup.avg*c; a.c6=c6.w500_r96_ins.cup.avg*c; a.w6=w6.w500_r96_ins.cup.avg*c;
b.v0=v0.w500_r96_ins.cdn.avg*c; b.c0=c0.w500_r96_ins.cdn.avg*c; b.w0=w0.w500_r96_ins.cdn.avg*c;
b.v1=v1.w500_r96_ins.cdn.avg*c; b.c1=c1.w500_r96_ins.cdn.avg*c; b.w1=w1.w500_r96_ins.cdn.avg*c;
b.v2=v2.w500_r96_ins.cdn.avg*c; b.c2=c2.w500_r96_ins.cdn.avg*c; b.w2=w2.w500_r96_ins.cdn.avg*c;
b.v3=v3.w500_r96_ins.cdn.avg*c; b.c3=c3.w500_r96_ins.cdn.avg*c; b.w3=w3.w500_r96_ins.cdn.avg*c;
b.v4=v4.w500_r96_ins.cdn.avg*c; b.c4=c4.w500_r96_ins.cdn.avg*c; b.w4=w4.w500_r96_ins.cdn.avg*c;
b.v5=v5.w500_r96_ins.cdn.avg*c; b.c5=c5.w500_r96_ins.cdn.avg*c; b.w5=w5.w500_r96_ins.cdn.avg*c;
b.v6=v6.w500_r96_ins.cdn.avg*c; b.c6=c6.w500_r96_ins.cdn.avg*c; b.w6=w6.w500_r96_ins.cdn.avg*c;
c.v0=v0.w500_r96_ins.cup.fav; c.c0=c0.w500_r96_ins.cup.fav; c.w0=w0.w500_r96_ins.cup.fav;
c.v1=v1.w500_r96_ins.cup.fav; c.c1=c1.w500_r96_ins.cup.fav; c.w1=w1.w500_r96_ins.cup.fav;
c.v2=v2.w500_r96_ins.cup.fav; c.c2=c2.w500_r96_ins.cup.fav; c.w2=w2.w500_r96_ins.cup.fav;
c.v3=v3.w500_r96_ins.cup.fav; c.c3=c3.w500_r96_ins.cup.fav; c.w3=w3.w500_r96_ins.cup.fav;
c.v4=v4.w500_r96_ins.cup.fav; c.c4=c4.w500_r96_ins.cup.fav; c.w4=w4.w500_r96_ins.cup.fav;
c.v5=v5.w500_r96_ins.cup.fav; c.c5=c5.w500_r96_ins.cup.fav; c.w5=w5.w500_r96_ins.cup.fav;
c.v6=v6.w500_r96_ins.cup.fav; c.c6=c6.w500_r96_ins.cup.fav; c.w6=w6.w500_r96_ins.cup.fav;
d.v0=v0.w500_r96_ins.cdn.fav; d.c0=c0.w500_r96_ins.cdn.fav; d.w0=w0.w500_r96_ins.cdn.fav;
d.v1=v1.w500_r96_ins.cdn.fav; d.c1=c1.w500_r96_ins.cdn.fav; d.w1=w1.w500_r96_ins.cdn.fav;
d.v2=v2.w500_r96_ins.cdn.fav; d.c2=c2.w500_r96_ins.cdn.fav; d.w2=w2.w500_r96_ins.cdn.fav;
d.v3=v3.w500_r96_ins.cdn.fav; d.c3=c3.w500_r96_ins.cdn.fav; d.w3=w3.w500_r96_ins.cdn.fav;
d.v4=v4.w500_r96_ins.cdn.fav; d.c4=c4.w500_r96_ins.cdn.fav; d.w4=w4.w500_r96_ins.cdn.fav;
d.v5=v5.w500_r96_ins.cdn.fav; d.c5=c5.w500_r96_ins.cdn.fav; d.w5=w5.w500_r96_ins.cdn.fav;
d.v6=v6.w500_r96_ins.cdn.fav; d.c6=c6.w500_r96_ins.cdn.fav; d.w6=w6.w500_r96_ins.cdn.fav;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=[1:7]; xy1=[0.5 7.5 -0.05 0.3]; xdir='reverse';
yup=[a.v0 a.v1 a.v2 a.v3 a.v4 a.v5 a.v6]; %cup avg
ydn=[b.v0 b.v1 b.v2 b.v3 b.v4 b.v5 b.v6]; %cdn avg
xy2=[0.5 7.5 0 3];
zup=[c.v0 c.v1 c.v2 c.v3 c.v4 c.v5 c.v6]; %cup fav
zdn=[d.v0 d.v1 d.v2 d.v3 d.v4 d.v5 d.v6]; %cdn fav
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
CO='Color';  LS='LineStyle'; s1='-'; s2='--'; s3='-.'; s4=':';
MK='Marker'; LW='LineWidth'; d1=1; d2=d1*3;
MS='MarkerSize';
line(x, yup, CO,'k', LS,s1, MK,'^', MS,8, LW,d2); hold on;
line(x, ydn, CO,'k', LS,s1, MK,'v', MS,8, LW,d2); hold on;
%line(x, y3,  CO,'k', LS,s1, MK,'^', MS,8, LW,d1); hold on;
%line(x, yy3, CO,'k', LS,s1, MK,'v', MS,8, LW,d1); hold on;
xlist={'R1.5','R03','R06','R12','R24','R48','R48C'}; axis(xy1);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
set(gca,'xDir',xdir,'FontSize',fsize);
yl='cloud updraft/downdraft velocity (m/s)'; ylabel(yl,'FontSize',fsize);
xl='horizontal resolution (km)'; xlabel(xl,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
ax1 = gca; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ax2=axes('Position',get(ax1,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','b','YColor','b');
line(x, zup*100, CO,'b', LS,s1, MK,'^', MS,8, LW,d2);hold on;
line(x, zdn*100, CO,'b', LS,s1, MK,'v', MS,8, LW,d2);hold on;
%line(x, z3 *100, CO,'b', LS,s1, MK,'^', MS,8, LW,d1);hold on;
%line(x, zz3*100, CO,'b', LS,s1, MK,'v', MS,8, LW,d1);hold on;
set(gca,'xDir',xdir,'FontSize',fsize); 
yl='cloud updraft/downdraft area (%)'; ylabel(yl,'FontSize',fsize);
xlist={'R1.5','R03','R06','R12','R24','R48','R48C'}; axis(xy2);
set(gca,'xticklabel',xlist,'FontSize',fsize);
set(gca,'xDir',xdir,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='precip_ts'; xmin=80; xmax=365; ymin=0; ymax=6;
xy=[xmin xmax ymin ymax]; opt=4; c=1; 
a.v0=v0.w500_org.all.pcp_stat.ts*c; 
a.v1=v1.w500_org.all.pcp_stat.ts*c; 
a.v2=v2.w500_org.all.pcp_stat.ts*c; 
a.v3=v3.w500_org.all.pcp_stat.ts*c; 
a.v4=v4.w500_org.all.pcp_stat.ts*c; 
a.v5=v5.w500_org.all.pcp_stat.ts*c; 
a.v6=v6.w500_org.all.pcp_stat.ts*c; 
b.v0=v0.t; b.v1=v1.t; b.v2=v2.t; 
b.v3=v3.t; b.v4=v4.t; b.v5=v5.t; b.v6=v6.t; 
yl='surface precipitation (mm/day)'; xl='time (day)'; wsize=20;
plot_a_b_ts;
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
