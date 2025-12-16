cd /home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_am4
set ts = 160
set te = 365

matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H2048x128_L79_R01_295','org_z',$ts,$te,1,64,0.5,0.00001);exit"&
matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H2048x128_L79_R01_300','org_z',$ts,$te,1,64,0.5,0.00001);exit"&
matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H2048x128_L79_R01_305','org_z',$ts,$te,1,64,0.5,0.00001);exit"&

matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H2048x128_L79_R03_295','org_z',$ts,$te,1,64,0.5,0.00001);exit"&
matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H2048x128_L79_R03_300','org_z',$ts,$te,1,64,0.5,0.00001);exit"&
matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H2048x128_L79_R03_305','org_z',$ts,$te,1,64,0.5,0.00001);exit"&

matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H1024x064_L79_R06_295','org_z',$ts,$te,1,64,0.5,0.00001);exit"&
matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H1024x064_L79_R06_300','org_z',$ts,$te,1,64,0.5,0.00001);exit"&
matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H1024x064_L79_R06_305','org_z',$ts,$te,1,64,0.5,0.00001);exit"&

matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H0512x032_L79_R12_295','org_z',$ts,$te,1,64,0.1,0.00001);exit"
matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H0512x032_L79_R12_300','org_z',$ts,$te,1,64,0.1,0.00001);exit"
matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H0512x032_L79_R12_305','org_z',$ts,$te,1,64,0.1,0.00001);exit"

matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H0256x016_L79_R24_295','org_z',$ts,$te,1,64,0.1,0.00001);exit"
matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H0256x016_L79_R24_300','org_z',$ts,$te,1,64,0.1,0.00001);exit"
matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H0256x016_L79_R24_305','org_z',$ts,$te,1,64,0.1,0.00001);exit"

matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H0128x008_L79_R48_295','org_z',$ts,$te,1,64,0.1,0.00001);exit"
matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H0128x008_L79_R48_300','org_z',$ts,$te,1,64,0.1,0.00001);exit"
matlab -r "rceana_ins_scale('/archive/Ming.Zhao/ndrce/warsaw_201710/','RCE_H0128x008_L79_R48_305','org_z',$ts,$te,1,64,0.1,0.00001);exit"


tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; res='org_z';
zs=1; ze=64; qc_th=0.00001; t1=240; t2=365;
expn='RCE_H0128x008_L79_R48_conv_295';v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0128x008_L79_R48_conv_300';v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0128x008_L79_R48_conv_305';v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0128x008_L79_R48_300';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0128x008_L79_R48_295';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0128x008_L79_R48_305';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0256x016_L79_R24_300';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0256x016_L79_R24_295';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0256x016_L79_R24_305';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0512x032_L79_R12_300';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0512x032_L79_R12_295';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0512x032_L79_R12_305';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H1024x064_L79_R06_300';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H1024x064_L79_R06_295';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H1024x064_L79_R06_305';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
t1=240; t2=365;
expn='RCE_H2048x128_L79_R03_300';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H2048x128_L79_R03_295';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H2048x128_L79_R03_305';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H2048x128_L79_R01_300';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H2048x128_L79_R01_295';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H2048x128_L79_R01_305';     v1=rceana_ins_scale(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%analysis plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath='/work/miz/mat_rce/'; res='org_z';
fext=strcat('_',res,'_ins_scale240_365fast0.mat');
expn='RCE_H1024x064_L79_R06_300';      fn=strcat(tpath,expn,fext); load(fn);v2=v;
expn='RCE_H0512x032_L79_R12_300';      fn=strcat(tpath,expn,fext); load(fn);v3=v;
expn='RCE_H0256x016_L79_R24_300';      fn=strcat(tpath,expn,fext); load(fn);v4=v;
expn='RCE_H0128x008_L79_R48_300';      fn=strcat(tpath,expn,fext); load(fn);v5=v;
expn='RCE_H0128x008_L79_R48_conv_300'; fn=strcat(tpath,expn,fext); load(fn);v6=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='RCE_H1024x064_L79_R06_305';      fn=strcat(tpath,expn,fext); load(fn);w2=v;
expn='RCE_H0512x032_L79_R12_305';      fn=strcat(tpath,expn,fext); load(fn);w3=v;
expn='RCE_H0256x016_L79_R24_305';      fn=strcat(tpath,expn,fext); load(fn);w4=v;
expn='RCE_H0128x008_L79_R48_305';      fn=strcat(tpath,expn,fext); load(fn);w5=v;
expn='RCE_H0128x008_L79_R48_conv_305'; fn=strcat(tpath,expn,fext); load(fn);w6=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='RCE_H1024x064_L79_R06_295';      fn=strcat(tpath,expn,fext); load(fn);c2=v;
expn='RCE_H0512x032_L79_R12_295';      fn=strcat(tpath,expn,fext); load(fn);c3=v;
expn='RCE_H0256x016_L79_R24_295';      fn=strcat(tpath,expn,fext); load(fn);c4=v;
expn='RCE_H0128x008_L79_R48_295';      fn=strcat(tpath,expn,fext); load(fn);c5=v;
expn='RCE_H0128x008_L79_R48_conv_295'; fn=strcat(tpath,expn,fext); load(fn);c6=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fext=strcat('_',res,'_ins_scale240_365fast0.mat');
expn='RCE_H2048x128_L79_R01_300';      fn=strcat(tpath,expn,fext); load(fn);v0=v;
expn='RCE_H2048x128_L79_R03_300';      fn=strcat(tpath,expn,fext); load(fn);v1=v;
expn='RCE_H2048x128_L79_R01_305';      fn=strcat(tpath,expn,fext); load(fn);w0=v;
expn='RCE_H2048x128_L79_R03_305';      fn=strcat(tpath,expn,fext); load(fn);w1=v;
expn='RCE_H2048x128_L79_R01_295';      fn=strcat(tpath,expn,fext); load(fn);c0=v;
expn='RCE_H2048x128_L79_R03_295';      fn=strcat(tpath,expn,fext); load(fn);c1=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c0=v0; %c1=v0; c2=v0; %c3=v0; c4=v4; c5=v5;
w0=v0; %w1=v0; w2=v0; %w3=v0; w4=v4; w5=v5;
C0='b-'; C1='b--'; C2='b-.'; C3='b:'; C4='b-'; C5='b--'; 
V0='k-'; V1='k--'; V2='k-.'; V3='k:'; V4='k-'; V5='k--'; 
W0='r-'; W1='r--'; W2='r-.'; W3='r:'; W4='r-'; W5='r--'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wbin_up=[0.1 0.25:0.25:2 3:2:25]; wbin_dn=[-25:2:-3 -2:0.25:-0.25 -0.1];
pctile=[50 75 90 95 99 99.9 99.99]; wbin=[wbin_dn wbin_up];
i=1; ti=10;  qc_th=0.00001; aa=0.65*G*864; %(m/s->hPa/day)
wbin=[-100:5:100];
v=v0; wx=v.r(i).w500.vbar*aa; qx=v.r(i).qc500.vbar; xi=64; yi=64;%res=64x1.5km
v0.p=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=v1; wx=v.r(i).w500.vbar*aa; qx=v.r(i).qc500.vbar; xi=32; yi=32;%res=32x3km
v1.p=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=v2; wx=v.r(1).w500.vbar*aa; qx=v.r(1).qc500.vbar; xi=16; yi=16;%res=16x6km
v2.p=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=v3; wx=v.r(1).w500.vbar*aa; qx=v.r(1).qc500.vbar; xi=8; yi=8; %res=8x12km
v3.p=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=v4; wx=v.r(1).w500.vbar*aa; qx=v.r(1).qc500.vbar; xi=4; yi=4; %res=4x24km
v4.p=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=v5; wx=v.r(1).w500.vbar*aa; qx=v.r(1).qc500.vbar; xi=2; yi=2; %res=2x48km
v5.p=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);

v=c0; wx=v.r(i).w500.vbar*aa; qx=v.r(i).qc500.vbar; xi=64; yi=64;%res=64x1.5km
c0.p=onelev_txyavg(v,wx,qx,1,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=c1; wx=v.r(i).w500.vbar*aa; qx=v.r(i).qc500.vbar; xi=32; yi=32;%res=32x3km
c1.p=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=c2; wx=v.r(1).w500.vbar*aa; qx=v.r(1).qc500.vbar; xi=16; yi=16;%res=16x6km
c2.p=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=c3; wx=v.r(1).w500.vbar*aa; qx=v.r(1).qc500.vbar; xi=8; yi=8; %res=8x12km
c3.p=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=c4; wx=v.r(1).w500.vbar*aa; qx=v.r(1).qc500.vbar; xi=4; yi=4; %res=4x24km
c4.p=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=c5; wx=v.r(1).w500.vbar*aa; qx=v.r(1).qc500.vbar; xi=2; yi=2; %res=2x48km
c5.p=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);

v=w0; wx=v.r(i).w500.vbar*aa; qx=v.r(i).qc500.vbar; xi=64; yi=64;%res=64x1.5km
w0.p=onelev_txyavg(v,wx,qx,1,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=w1; wx=v.r(i).w500.vbar*aa; qx=v.r(i).qc500.vbar; xi=32; yi=32;%res=32x3km
w1.p=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=w2; wx=v.r(1).w500.vbar*aa; qx=v.r(1).qc500.vbar; xi=16; yi=16;%res=16x6km
w2.p=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=w3; wx=v.r(1).w500.vbar*aa; qx=v.r(1).qc500.vbar; xi=8; yi=8; %res=8x12km
w3.p=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=w4; wx=v.r(1).w500.vbar*aa; qx=v.r(1).qc500.vbar; xi=4; yi=4; %res=4x24km
w4.p=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=w5; wx=v.r(1).w500.vbar*aa; qx=v.r(1).qc500.vbar; xi=2; yi=2; %res=2x48km
w5.p=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fa_cld_avg'; xmin=0; xmax=1; ymin=265; ymax=305;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; xy0=[0 5 ymin ymax]; opt=4;
a.v0=v0.w500.cup.avg;      a.c0=c0.w500.cup.avg;      a.w0=w0.w500.cup.avg;
b.v0=mean(v0.w500.cup.ts_fa); b.c0=mean(c0.w500.cup.ts_fa); b.w0=mean(w0.w500.cup.ts_fa);
i=1; nday=1; id='cup'; %[a.v0 b.v0]=get_fa(v0,i,nday,id);
[a.v1 b.v1]=get_fa(v1,i,nday,id); [a.v2 b.v2]=get_fa(v2,i,nday,id);
[a.v3 b.v3]=get_fa(v3,i,nday,id); [a.v4 b.v4]=get_fa(v4,i,nday,id);
[a.v5 b.v5]=get_fa(v5,i,nday,id);
[a.w1 b.w1]=get_fa(v1,i,nday,id); [a.w2 b.w2]=get_fa(v2,i,nday,id);
[a.w3 b.w3]=get_fa(v3,i,nday,id); [a.w4 b.w4]=get_fa(v4,i,nday,id);
[a.w5 b.w5]=get_fa(v5,i,nday,id);

c.v0=v0.w500.cdn.avg;      c.c0=c0.w500.cdn.avg;      c.w0=w0.w500.cdn.avg;
d.v0=mean(v0.w500.cdn.ts_fa); d.c0=mean(c0.w500.cdn.ts_fa); d.w0=mean(w0.w500.cdn.ts_fa);
i=1; nday=1; id='cdn'; %[c.v0 d.v0]=get_fa(v0,i,nday,id);
[c.v1 d.v1]=get_fa(v1,i,nday,id); [c.v2 d.v2]=get_fa(v2,i,nday,id);
[c.v3 d.v3]=get_fa(v3,i,nday,id); [c.v4 d.v4]=get_fa(v4,i,nday,id);
[c.v5 d.v5]=get_fa(v5,i,nday,id);
[c.w1 d.w1]=get_fa(v1,i,nday,id); [c.w2 d.w2]=get_fa(v2,i,nday,id);
[c.w3 d.w3]=get_fa(v3,i,nday,id); [c.w4 d.w4]=get_fa(v4,i,nday,id);
[c.w5 d.w5]=get_fa(v5,i,nday,id);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=[1:6]; xy1=[0.5 6.5 -0.5 1.25]; xdir='reverse';
y2 =[a.v0 a.v1 a.v2 a.v3 a.v4 a.v5]; %cup avg
yy2=[c.v0 c.v1 c.v2 c.v3 c.v4 c.v5]; %cdn avg
xy2=[0.5 6.5 0 3];
z2 =[b.v0 b.v1 b.v2 b.v3 b.v4 b.v5]; %cup fav
zz2=[d.v0 d.v1 d.v2 d.v3 d.v4 d.v5]; %cdn fav
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
CO='Color';  LS='LineStyle'; s1='-'; s2='--'; s3='-.'; s4=':';
MK='Marker'; LW='LineWidth'; d1=1; d2=d1*3;
MS='MarkerSize';
line(x, y2,  CO,'k', LS,s1, MK,'^', MS,8, LW,d2); hold on;
line(x, yy2, CO,'k', LS,s1, MK,'v', MS,8, LW,d2); hold on;
%line(x, y3,  CO,'k', LS,s1, MK,'^', MS,8, LW,d1); hold on;
%line(x, yy3, CO,'k', LS,s1, MK,'v', MS,8, LW,d1); hold on;
xlist={'R1.5','R03','R06','R12','R24','R48'}; axis(xy1);
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
line(x, z2 *100, CO,'b', LS,s1, MK,'^', MS,8, LW,d2);hold on;
line(x, zz2*100, CO,'b', LS,s1, MK,'v', MS,8, LW,d2);hold on;
%line(x, z3 *100, CO,'b', LS,s1, MK,'^', MS,8, LW,d1);hold on;
%line(x, zz3*100, CO,'b', LS,s1, MK,'v', MS,8, LW,d1);hold on;
set(gca,'xDir',xdir,'FontSize',fsize); 
yl='cloud updraft/downdraft area (%)'; ylabel(yl,'FontSize',fsize);
xlist={'R1.5','R03','R06','R12','R24','R48'}; axis(xy2);
set(gca,'xticklabel',xlist,'FontSize',fsize);
set(gca,'xDir',xdir,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fa_dn_avg'; xmin=0; xmax=1; ymin=265; ymax=305;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; xy0=[0 5 ymin ymax]; opt=4; 
i=1; nday=2; id='dn'; c0=v0; c1=v1;
a.v0=v0.p.dn.avg; a.v1=v1.p.dn.avg; a.v2=v2.p.dn.avg; 
a.v3=v3.p.dn.avg; a.v4=v4.p.dn.avg; a.v5=v5.p.dn.avg;  
a.c0=c0.p.dn.avg; a.c1=c1.p.dn.avg; a.c2=c2.p.dn.avg; 
a.c3=c3.p.dn.avg; a.c4=c4.p.dn.avg; a.c5=c5.p.dn.avg;  
a.w0=w0.p.dn.avg; a.w1=w1.p.dn.avg; a.w2=w2.p.dn.avg; 
a.w3=w3.p.dn.avg; a.w4=w4.p.dn.avg; a.w5=w5.p.dn.avg;  

b.v0=v0.p.dn.fav; b.v1=v1.p.dn.fav; b.v2=v2.p.dn.fav; 
b.v3=v3.p.dn.fav; b.v4=v4.p.dn.fav; b.v5=v5.p.dn.fav;  
b.c0=c0.p.dn.fav; b.c1=c1.p.dn.fav; b.c2=c2.p.dn.fav; 
b.c3=c3.p.dn.fav; b.c4=c4.p.dn.fav; b.c5=c5.p.dn.fav;  
b.w0=w0.p.dn.fav; b.w1=w1.p.dn.fav; b.w2=w2.p.dn.fav; 
b.w3=w3.p.dn.fav; b.w4=w4.p.dn.fav; b.w5=w5.p.dn.fav;  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=[1:6]; xy1=[0.5 6.5 -50 -20]; xdir='reverse';
%y1=[a.c0 a.c1 a.c2 a.c3 a.c4 a.c5];
y2=[a.v0 a.v1 a.v2 a.v3 a.v4 a.v5];
y3=[a.w0 a.w1 a.w2 a.w3 a.w4 a.w5];
xy2=[0.5 6.5 50 80];
%z1=[b.c0 b.c1 b.c2 b.c3 b.c4 b.c5];
z2=[b.v0 b.v1 b.v2 b.v3 b.v4 b.v5];
z3=[b.w0 b.w1 b.w2 b.w3 b.w4 b.w5];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
CO='Color';  LS='LineStyle'; s1='-'; s2='--'; s3='-.'; s4=':';
MK='Marker'; LW='LineWidth'; d1=1; d2=d1*3;
MS='MarkerSize';
line(x, y2, CO,'k', LS,s1, MK,'v', MS,8, LW,d2); hold on;
line(x, y3, CO,'k', LS,s1, MK,'v', MS,8, LW,d1); hold on;
xlist={'R1.5','R03','R06','R12','R24','R48'}; axis(xy1);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
set(gca,'xDir',xdir,'FontSize',fsize);
yl='mean subsidence velocity (m/s)'; ylabel(yl,'FontSize',fsize);
xl='horizontal resolution (km)'; xlabel(xl,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
ax1 = gca;
ax2=axes('Position',get(ax1,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','b','YColor','b');
line(x, z2*100, CO,'b', LS,s1, MK,'v', MS,8, LW,d2);hold on;
line(x, z3*100, CO,'b', LS,s1, MK,'v', MS,8, LW,d1);hold on;
set(gca,'xDir',xdir,'FontSize',fsize); 
yl='subsidence fraction (%)'; ylabel(yl,'FontSize',fsize);
xlist={'R1.5','R03','R06','R12','R24','R48'}; %axis(xy2);
set(gca,'xticklabel',xlist,'FontSize',fsize);
set(gca,'xDir',xdir,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wbin_up=[0.1 0.25:0.25:2 3:2:25]; wbin_dn=[-25:2:-3 -2:0.25:-0.25 -0.1];
pctile=[50 75 90 95 99 99.9 99.99]; wbin=[wbin_dn wbin_up];
i=1; ti=10;  qc_th=0.00001; a=0.65*G*864; %(m/s->hPa/day)
wbin=[-100:5:100];

v=v1; wx=v.r(i).w500.vbar*a; qx=v.r(i).qc500.vbar; xi=4; yi=4;%res=32x3km
p0=onelev_txyavg(v,wx,qx,1,xi,yi,wbin,wbin,wbin,pctile,qc_th);

v=v1; wx=v.r(i).w500.vbar*a; qx=v.r(i).qc500.vbar; xi=32; yi=32;%res=32x3km
p1=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=v2; wx=v.r(1).w500.vbar*a; qx=v.r(1).qc500.vbar; xi=16; yi=16;%res=16x6km
p2=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=v3; wx=v.r(1).w500.vbar*a; qx=v.r(1).qc500.vbar; xi=8; yi=8; %res=8x12km
p3=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=v4; wx=v.r(1).w500.vbar*a; qx=v.r(1).qc500.vbar; xi=4; yi=4; %res=4x24km
p4=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
v=v5; wx=v.r(1).w500.vbar*a; qx=v.r(1).qc500.vbar; xi=2; yi=2; %res=2x48km
p5=onelev_txyavg(v,wx,qx,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
x =v0.p.all.binc; xdir='reverse';
y0=v0.p.all.pdf./a; y1=v1.p.all.pdf./a; y2=v2.p.all.pdf./a;
y3=v3.p.all.pdf./a; y4=v4.p.all.pdf./a; y5=v5.p.all.pdf./a;
plot(x,y0,'m'); hold on;
plot(x,y1,'r'); hold on;
plot(x,y2,'g'); hold on;
plot(x,y3,'b'); hold on;
plot(x,y4,'k'); hold on;
plot(x,y5,'c'); hold on;
set(gca,'xDir',xdir,'FontSize',fsize);
yl='PDF'; ylabel(yl,'FontSize',fsize);
xl='large-scale vertical velocity (hPa/day)'; xlabel(xl,'FontSize',fsize); 
set(gca,'FontSize',fsize); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='precip_ts'; xmin=250; xmax=365; ymin=0; ymax=6;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; opt=4; c=1; 
a.v0=v0.precip.ts*c; a.c0=c0.precip.ts*c; a.w0=w0.precip.ts*c; 
a.v1=v1.precip.ts*c; a.c1=c1.precip.ts*c; a.w1=w1.precip.ts*c; 
a.v2=v2.precip.ts*c; a.c2=c2.precip.ts*c; a.w2=w2.precip.ts*c; 
a.v3=v3.precip.ts*c; a.c3=c3.precip.ts*c; a.w3=w3.precip.ts*c; 
a.v4=v4.precip.ts*c; a.c4=c4.precip.ts*c; a.w4=w4.precip.ts*c; 
a.v5=v5.precip.ts*c; a.c5=c5.precip.ts*c; a.w5=w5.precip.ts*c; 
b.v0=v0.t; b.c0=c0.t; b.w0=w0.t; 
b.v1=v1.t; b.c1=c1.t; b.w1=w1.t; 
b.v2=v2.t; b.c2=c2.t; b.w2=w2.t; 
b.v3=v3.t; b.c3=c3.t; b.w3=w3.t; 
b.v4=v4.t; b.c4=c4.t; b.w4=w4.t; 
b.v5=v5.t; b.c5=c5.t; b.w5=w5.t; 
yl='surface precipitation (mm/day)'; xl='time (day)'; wsize=5;
plot_a_b_ts;
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='evap_ts'; xxmin=250; xmax=365; ymin=0; ymax=160;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; opt=4; c=1;
a.v0=v0.evp.ts*c; a.c0=c0.evp.ts*c; a.w0=w0.evp.ts*c;
a.v1=v1.evp.ts*c; a.c1=c1.evp.ts*c; a.w1=w1.evp.ts*c; 
a.v2=v2.evp.ts*c; a.c2=c2.evp.ts*c; a.w2=w2.evp.ts*c; 
a.v3=v3.evp.ts*c; a.c3=c3.evp.ts*c; a.w3=w3.evp.ts*c; 
a.v4=v4.evp.ts*c; a.c4=c4.evp.ts*c; a.w4=w4.evp.ts*c; 
a.v5=v5.evp.ts*c; a.c5=c5.evp.ts*c; a.w5=w5.evp.ts*c; 
b.v0=v0.t; b.c0=c0.t; b.w0=w0.t; 
b.v1=v1.t; b.c1=c1.t; b.w1=w1.t; 
b.v2=v2.t; b.c2=c2.t; b.w2=w2.t; 
b.v3=v3.t; b.c3=c3.t; b.w3=w3.t; 
b.v4=v4.t; b.c4=c4.t; b.w4=w4.t; 
b.v5=v5.t; b.c5=c5.t; b.w5=w5.t; 
yl='surface evaporation (mm/day)';  xl='time (day)'; wsize=5;
plot_a_b_ts;
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tdt_rad_ts'; xxmin=250; xmax=365; ymin=-160; ymax=0;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; opt=1; c=CPD;
a.v0=v0.int.tdt_rd.ts*c; a.c0=c0.int.tdt_rd.ts*c; a.w0=w0.int.tdt_rd.ts*c;
a.v1=v1.int.tdt_rd.ts*c; a.c1=c1.int.tdt_rd.ts*c; a.w1=w1.int.tdt_rd.ts*c; 
a.v2=v2.int.tdt_rd.ts*c; a.c2=c2.int.tdt_rd.ts*c; a.w2=w2.int.tdt_rd.ts*c; 
a.v3=v3.int.tdt_rd.ts*c; a.c3=c3.int.tdt_rd.ts*c; a.w3=w3.int.tdt_rd.ts*c; 
a.v4=v4.int.tdt_rd.ts*c; a.c4=c4.int.tdt_rd.ts*c; a.w4=w4.int.tdt_rd.ts*c; 
a.v5=v5.int.tdt_rd.ts*c; a.c5=c5.int.tdt_rd.ts*c; a.w5=w5.int.tdt_rd.ts*c; 
b.v0=v0.t; b.c0=c0.t; b.w0=w0.t; 
b.v1=v1.t; b.c1=c1.t; b.w1=w1.t; 
b.v2=v2.t; b.c2=c2.t; b.w2=w2.t; 
b.v3=v3.t; b.c3=c3.t; b.w3=w3.t; 
b.v4=v4.t; b.c4=c4.t; b.w4=w4.t; 
b.v5=v5.t; b.c5=c5.t; b.w5=w5.t; 
yl='atmospheric radiative cooling rate (W/m2)';  xl='time (day)'; wsize=5;
plot_a_b_ts;
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fa_dn_ts'; xmin=0; xmax=1; ymin=265; ymax=305;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; xy0=[0 5 ymin ymax]; opt=4;
a.v0=v0.w500.dn.ts_fa; a.c0=c0.w500.dn.ts_fa; a.w0=w0.w500.dn.ts_fa; 
a.v1=v1.w500.dn.ts_fa; a.c1=c1.w500.dn.ts_fa; a.w1=w1.w500.dn.ts_fa; 
a.v2=v2.w500.dn.ts_fa; a.c2=c2.w500.dn.ts_fa; a.w2=w2.w500.dn.ts_fa; 
a.v3=v3.w500.dn.ts_fa; a.c3=c3.w500.dn.ts_fa; a.w3=w3.w500.dn.ts_fa; 
a.v4=v4.w500.dn.ts_fa; a.c4=c4.w500.dn.ts_fa; a.w4=w4.w500.dn.ts_fa; 
a.v5=v5.w500.dn.ts_fa; a.c5=c5.w500.dn.ts_fa; a.w5=w5.w500.dn.ts_fa; 
b.v0=v0.t; b.c0=c0.t; b.w0=w0.t; 
b.v1=v1.t; b.c1=c1.t; b.w1=w1.t; 
b.v2=v2.t; b.c2=c2.t; b.w2=w2.t; 
b.v3=v3.t; b.c3=c3.t; b.w3=w3.t; 
b.v4=v4.t; b.c4=c4.t; b.w4=w4.t; 
b.v5=v5.t; b.c5=c5.t; b.w5=w5.t; 
yl='subsidence fraction'; xl='time (day)'; wsize=5;
plot_a_b_ts;
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fa_cup_ts'; xmin=0; xmax=1; ymin=265; ymax=305;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; xy0=[0 5 ymin ymax]; opt=1;
a.v0=v0.w500.cup.ts_fa; a.c0=c0.w500.cup.ts_fa; a.w0=w0.w500.cup.ts_fa; 
a.v1=v1.w500.cup.ts_fa; a.c1=c1.w500.cup.ts_fa; a.w1=w1.w500.cup.ts_fa; 
a.v2=v2.w500.cup.ts_fa; a.c2=c2.w500.cup.ts_fa; a.w2=w2.w500.cup.ts_fa; 
a.v3=v3.w500.cup.ts_fa; a.c3=c3.w500.cup.ts_fa; a.w3=w3.w500.cup.ts_fa; 
a.v4=v4.w500.cup.ts_fa; a.c4=c4.w500.cup.ts_fa; a.w4=w4.w500.cup.ts_fa; 
a.v5=v5.w500.cup.ts_fa; a.c5=c5.w500.cup.ts_fa; a.w5=w5.w500.cup.ts_fa; 
b.v0=v0.t; b.c0=c0.t; b.w0=w0.t; 
b.v1=v1.t; b.c1=c1.t; b.w1=w1.t; 
b.v2=v2.t; b.c2=c2.t; b.w2=w2.t; 
b.v3=v3.t; b.c3=c3.t; b.w3=w3.t; 
b.v4=v4.t; b.c4=c4.t; b.w4=w4.t; 
b.v5=v5.t; b.c5=c5.t; b.w5=w5.t; 
yl='cloud updraft fraction'; xl='time (day)'; wsize=5;
plot_a_b_ts;
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='up_ts'; xmin=0; xmax=1; ymin=265; ymax=305;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; xy0=[0 5 ymin ymax]; opt=4;
a.v0=v0.w500.cup.ts; a.c0=c0.w500.cup.ts; a.w0=w0.w500.cup.ts; 
a.v1=v1.w500.cup.ts; a.c1=c1.w500.cup.ts; a.w1=w1.w500.cup.ts; 
a.v2=v2.w500.cup.ts; a.c2=c2.w500.cup.ts; a.w2=w2.w500.cup.ts; 
a.v3=v3.w500.cup.ts; a.c3=c3.w500.cup.ts; a.w3=w3.w500.cup.ts; 
a.v4=v4.w500.cup.ts; a.c4=c4.w500.cup.ts; a.w4=w4.w500.cup.ts; 
a.v5=v5.w500.cup.ts; a.c5=c5.w500.cup.ts; a.w5=w5.w500.cup.ts; 
b.v0=v0.t; b.c0=c0.t; b.w0=w0.t; 
b.v1=v1.t; b.c1=c1.t; b.w1=w1.t; 
b.v2=v2.t; b.c2=c2.t; b.w2=w2.t; 
b.v3=v3.t; b.c3=c3.t; b.w3=w3.t; 
b.v4=v4.t; b.c4=c4.t; b.w4=w4.t; 
b.v5=v5.t; b.c5=c5.t; b.w5=w5.t; 
yl='mean cloud updraft velocity (m/s)'; xl='time (day)'; wsize=5;
plot_a_b_ts;
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='upmdn_ts'; xmin=0; xmax=1; ymin=265; ymax=305;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; xy0=[0 5 ymin ymax]; opt=4; c=1; 
a.v0=v0.w500.upmdn.ts*c; a.c0=c0.w500.upmdn.ts*c; a.w0=w0.w500.upmdn.ts*c; 
a.v1=v1.w500.upmdn.ts*c; a.c1=c1.w500.upmdn.ts*c; a.w1=w1.w500.upmdn.ts*c; 
a.v2=v2.w500.upmdn.ts*c; a.c2=c2.w500.upmdn.ts*c; a.w2=w2.w500.upmdn.ts*c; 
a.v3=v3.w500.upmdn.ts*c; a.c3=c3.w500.upmdn.ts*c; a.w3=w3.w500.upmdn.ts*c; 
a.v4=v4.w500.upmdn.ts*c; a.c4=c4.w500.upmdn.ts*c; a.w4=w4.w500.upmdn.ts*c; 
a.v5=v5.w500.upmdn.ts*c; a.c5=c5.w500.upmdn.ts*c; a.w5=w5.w500.upmdn.ts*c; 
b.v0=v0.t; b.c0=c0.t; b.w0=w0.t; 
b.v1=v1.t; b.c1=c1.t; b.w1=w1.t; 
b.v2=v2.t; b.c2=c2.t; b.w2=w2.t; 
b.v3=v3.t; b.c3=c3.t; b.w3=w3.t; 
b.v4=v4.t; b.c4=c4.t; b.w4=w4.t; 
b.v5=v5.t; b.c5=c5.t; b.w5=w5.t; 
yl='circulation strength'; xl='time (day)'; wsize=5;
plot_a_b_ts;
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fa_cld_avg'; xmin=0; xmax=1; ymin=265; ymax=305;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; xy0=[0 5 ymin ymax]; opt=4;
a.v0=v0.w500.cup.avg;      a.c0=c0.w500.cup.avg;      a.w0=w0.w500.cup.avg;
b.v0=mean(v0.w500.cup.ts_fa); b.c0=mean(c0.w500.cup.ts_fa); b.w0=mean(w0.w500.cup.ts_fa);
i=1; nday=1; id='cup'; %[a.v0 b.v0]=get_fa(v0,i,nday,id);
[a.v1 b.v1]=get_fa(v1,i,nday,id); [a.v2 b.v2]=get_fa(v2,i,nday,id);
[a.v3 b.v3]=get_fa(v3,i,nday,id); [a.v4 b.v4]=get_fa(v4,i,nday,id);
[a.v5 b.v5]=get_fa(v5,i,nday,id);
[a.w1 b.w1]=get_fa(v1,i,nday,id); [a.w2 b.w2]=get_fa(v2,i,nday,id);
[a.w3 b.w3]=get_fa(v3,i,nday,id); [a.w4 b.w4]=get_fa(v4,i,nday,id);
[a.w5 b.w5]=get_fa(v5,i,nday,id);

c.v0=v0.w500.cdn.avg;      c.c0=c0.w500.cdn.avg;      c.w0=w0.w500.cdn.avg;
d.v0=mean(v0.w500.cdn.ts_fa); d.c0=mean(c0.w500.cdn.ts_fa); d.w0=mean(w0.w500.cdn.ts_fa);
i=1; nday=1; id='cdn'; %[c.v0 d.v0]=get_fa(v0,i,nday,id);
[c.v1 d.v1]=get_fa(v1,i,nday,id); [c.v2 d.v2]=get_fa(v2,i,nday,id);
[c.v3 d.v3]=get_fa(v3,i,nday,id); [c.v4 d.v4]=get_fa(v4,i,nday,id);
[c.v5 d.v5]=get_fa(v5,i,nday,id);
[c.w1 d.w1]=get_fa(v1,i,nday,id); [c.w2 d.w2]=get_fa(v2,i,nday,id);
[c.w3 d.w3]=get_fa(v3,i,nday,id); [c.w4 d.w4]=get_fa(v4,i,nday,id);
[c.w5 d.w5]=get_fa(v5,i,nday,id);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=[1:6]; xy1=[0.5 6.5 -0.5 1.25]; xdir='reverse';
y2 =[a.v0 a.v1 a.v2 a.v3 a.v4 a.v5]; %cup avg
yy2=[c.v0 c.v1 c.v2 c.v3 c.v4 c.v5]; %cdn avg
xy2=[0.5 6.5 0 3];
z2 =[b.v0 b.v1 b.v2 b.v3 b.v4 b.v5]; %cup fav
zz2=[d.v0 d.v1 d.v2 d.v3 d.v4 d.v5]; %cdn fav
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
CO='Color';  LS='LineStyle'; s1='-'; s2='--'; s3='-.'; s4=':';
MK='Marker'; LW='LineWidth'; d1=1; d2=d1*3;
MS='MarkerSize';
line(x, y2,  CO,'k', LS,s1, MK,'^', MS,8, LW,d2); hold on;
line(x, yy2, CO,'k', LS,s1, MK,'v', MS,8, LW,d2); hold on;
%line(x, y3,  CO,'k', LS,s1, MK,'^', MS,8, LW,d1); hold on;
%line(x, yy3, CO,'k', LS,s1, MK,'v', MS,8, LW,d1); hold on;
xlist={'R1.5','R03','R06','R12','R24','R48'}; axis(xy1);
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
line(x, z2 *100, CO,'b', LS,s1, MK,'^', MS,8, LW,d2);hold on;
line(x, zz2*100, CO,'b', LS,s1, MK,'v', MS,8, LW,d2);hold on;
%line(x, z3 *100, CO,'b', LS,s1, MK,'^', MS,8, LW,d1);hold on;
%line(x, zz3*100, CO,'b', LS,s1, MK,'v', MS,8, LW,d1);hold on;
set(gca,'xDir',xdir,'FontSize',fsize); 
yl='cloud updraft/downdraft area (%)'; ylabel(yl,'FontSize',fsize);
xlist={'R1.5','R03','R06','R12','R24','R48'}; axis(xy2);
set(gca,'xticklabel',xlist,'FontSize',fsize);
set(gca,'xDir',xdir,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fa_dn_avg'; xmin=0; xmax=1; ymin=265; ymax=305;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; xy0=[0 5 ymin ymax]; opt=4; 
i=1; nday=2; id='dn';
%[a.v0 b.v0]=get_fa(v0,i,nday,id);
%[a.v1 b.v1]=get_fa(v1,i,nday,id);
[a.v2 b.v2]=get_fa(v2,i,nday,id);
[a.v3 b.v3]=get_fa(v3,i,nday,id);
[a.v4 b.v4]=get_fa(v4,i,nday,id);
[a.v5 b.v5]=get_fa(v5,i,nday,id);
%[a.c0 b.c0]=get_fa(c0,i,nday,id);
%[a.c1 b.c1]=get_fa(c1,i,nday,id);
[a.c2 b.c2]=get_fa(c2,i,nday,id);
[a.c3 b.c3]=get_fa(c3,i,nday,id);
[a.c4 b.c4]=get_fa(c4,i,nday,id);
[a.c5 b.c5]=get_fa(c5,i,nday,id);
%[a.w0 b.w0]=get_fa(w0,i,nday,id);
%[a.w1 b.w1]=get_fa(w1,i,nday,id);
[a.w2 b.w2]=get_fa(w2,i,nday,id);
[a.w3 b.w3]=get_fa(w3,i,nday,id);
[a.w4 b.w4]=get_fa(w4,i,nday,id);
[a.w5 b.w5]=get_fa(w5,i,nday,id);
a.v0=v0.w500.dn.avg;         a.c0=c0.w500.dn.avg;      a.w0=w0.w500.dn.avg;
b.v0=mean(v0.w500.dn.ts_fa); b.c0=mean(c0.w500.dn.ts_fa); b.w0=mean(w0.w500.dn.ts_fa);
b.c1=b.c0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=[1:6]; xy1=[0.5 6.5 -0.05 0]; xdir='reverse';
%y1=[a.c0 a.c1 a.c2 a.c3 a.c4 a.c5];
y2=[a.v0 a.v1 a.v2 a.v3 a.v4 a.v5];
y3=[a.w0 a.w1 a.w2 a.w3 a.w4 a.w5];
xy2=[0.5 6.5 54 80];
%z1=[b.c0 b.c1 b.c2 b.c3 b.c4 b.c5];
z2=[b.v0 b.v1 b.v2 b.v3 b.v4 b.v5];
z3=[b.w0 b.w1 b.w2 b.w3 b.w4 b.w5];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
CO='Color';  LS='LineStyle'; s1='-'; s2='--'; s3='-.'; s4=':';
MK='Marker'; LW='LineWidth'; d1=1; d2=d1*3;
MS='MarkerSize';
line(x, y2, CO,'k', LS,s1, MK,'v', MS,8, LW,d2); hold on;
line(x, y3, CO,'k', LS,s1, MK,'v', MS,8, LW,d1); hold on;
xlist={'R1.5','R03','R06','R12','R24','R48'}; axis(xy1);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
set(gca,'xDir',xdir,'FontSize',fsize);
yl='mean subsidence velocity (m/s)'; ylabel(yl,'FontSize',fsize);
xl='horizontal resolution (km)'; xlabel(xl,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
ax1 = gca;
ax2=axes('Position',get(ax1,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','b','YColor','b');
line(x, z2*100, CO,'b', LS,s1, MK,'v', MS,8, LW,d2);hold on;
line(x, z3*100, CO,'b', LS,s1, MK,'v', MS,8, LW,d1);hold on;
set(gca,'xDir',xdir,'FontSize',fsize); 
yl='subsidence fraction (%)'; ylabel(yl,'FontSize',fsize);
xlist={'R1.5','R03','R06','R12','R24','R48'}; axis(xy2);
set(gca,'xticklabel',xlist,'FontSize',fsize);
set(gca,'xDir',xdir,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fa_dn_avg'; xmin=0; xmax=1; ymin=265; ymax=305;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; xy0=[0 5 ymin ymax]; opt=4;
a.v0=mean(v0.w500.dn.ts_fa); a.c0=mean(c0.w500.dn.ts_fa); a.w0=mean(w0.w500.dn.ts_fa);
a.v1=mean(v1.w500.dn.ts_fa); a.c1=mean(c1.w500.dn.ts_fa); a.w1=mean(w1.w500.dn.ts_fa);
a.v2=mean(v2.w500.dn.ts_fa); a.c2=mean(c2.w500.dn.ts_fa); a.w2=mean(w2.w500.dn.ts_fa);
a.v3=mean(v3.w500.dn.ts_fa); a.c3=mean(c3.w500.dn.ts_fa); a.w3=mean(w3.w500.dn.ts_fa);
a.v4=mean(v4.w500.dn.ts_fa); a.c4=mean(c4.w500.dn.ts_fa); a.w4=mean(w4.w500.dn.ts_fa);
a.v5=mean(v5.w500.dn.ts_fa); a.c5=mean(c5.w500.dn.ts_fa); a.w5=mean(w5.w500.dn.ts_fa);

x=[295 300 305]; x=[1:6]; xy=[0.5 6.5 0.5 0.7];
y=[a.c0 a.v0 a.w0; a.c1 a.v1 a.w1; a.c2 a.v2 a.w2; a.c3 a.v3 a.w3; a.c4 a.v4 a.w4; a.c5 a.v5 a.w5];
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
lw='LineWidth'; d1=1; d2=d1*2;
plot(x,y(:,1),'b-s',lw,d2); hold on;
plot(x,y(:,2),'k-o',lw,d2); hold on;
plot(x,y(:,3),'r-d',lw,d2); hold on;
xlist={'R1.5','R03','R06','R12','R24','R48'}; axis(xy);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
yl='subsidence fraction'; ylabel(yl,'FontSize',fsize);
xl='horizontal resolution (km)'; xlabel(xl,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
plot_a_b_ts;
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='upmdn_avg'; xmin=0; xmax=1; ymin=265; ymax=305;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; xy0=[0 5 ymin ymax]; opt=4;
c=1; %G*864; 
a.v0=v0.w500.upmdn.avg*c; a.c0=c0.w500.upmdn.avg*c; a.w0=w0.w500.upmdn.avg*c; 
a.v1=v1.w500.upmdn.avg*c; a.c1=c1.w500.upmdn.avg*c; a.w1=w1.w500.upmdn.avg*c; 
a.v2=v2.w500.upmdn.avg*c; a.c2=c2.w500.upmdn.avg*c; a.w2=w2.w500.upmdn.avg*c; 
a.v3=v3.w500.upmdn.avg*c; a.c3=c3.w500.upmdn.avg*c; a.w3=w3.w500.upmdn.avg*c; 
a.v4=v4.w500.upmdn.avg*c; a.c4=c4.w500.upmdn.avg*c; a.w4=w4.w500.upmdn.avg*c; 
a.v5=v5.w500.upmdn.avg*c; a.c5=c5.w500.upmdn.avg*c; a.w5=w5.w500.upmdn.avg*c; 
x=[295 300 305]; x=[1:6]; xy=[0.5 6.5 0.02 0.11];
y=[a.c0 a.v0 a.w0; a.c1 a.v1 a.w1; a.c2 a.v2 a.w2; a.c3 a.v3 a.w3; a.c4 a.v4 a.w4; a.c5 a.v5 a.w5];
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
lw='LineWidth'; d1=1; d2=d1*2;
plot(x,y(:,1),'b-s',lw,d2); hold on;
plot(x,y(:,2),'k-o',lw,d2); hold on;
plot(x,y(:,3),'r-d',lw,d2); hold on;

xlist={'R1.5','R03','R06','R12','R24','R48'}; axis(xy);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
yl='circulation strength (m/s)'; ylabel(yl,'FontSize',fsize);
xl='horizontal resolution (km)'; xlabel(xl,'FontSize',fsize); 
set(gca,'FontSize',fsize); 

yl='circulation strength'; xl='time (day)'; wsize=5;
plot_a_b_ts;
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ql_avg_temp'; xmin=0; xmax=0.1; ymin=265; ymax=305;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; xy0=[0 5 ymin ymax]; opt=4;
c=1000; %kg/kg->g/kg; c=1E6; %kg->mg
a.v0=v0.ql.avg*c; a.c0=c0.ql.avg*c; a.w0=w0.ql.avg*c; 
a.v1=v1.ql.avg*c; a.c1=c1.ql.avg*c; a.w1=w1.ql.avg*c; 
a.v2=v2.ql.avg*c; a.c2=c2.ql.avg*c; a.w2=w2.ql.avg*c; 
a.v3=v3.ql.avg*c; a.c3=c3.ql.avg*c; a.w3=w3.ql.avg*c; 
a.v4=v4.ql.avg*c; a.c4=c4.ql.avg*c; a.w4=w4.ql.avg*c; 
a.v5=v5.ql.avg*c; a.c5=c5.ql.avg*c; a.w5=w5.ql.avg*c; 
b.v0=v0.ta.avg; b.c0=c0.ta.avg; b.w0=w0.ta.avg; 
b.v1=v1.ta.avg; b.c1=c1.ta.avg; b.w1=w1.ta.avg; 
b.v2=v2.ta.avg; b.c2=c2.ta.avg; b.w2=w2.ta.avg; 
b.v3=v3.ta.avg; b.c3=c3.ta.avg; b.w3=w3.ta.avg; 
b.v4=v4.ta.avg; b.c4=c4.ta.avg; b.w4=w4.ta.avg; 
b.v5=v5.ta.avg; b.c5=c5.ta.avg; b.w5=w5.ta.avg; 
xl='cloud liquid water (g/kg)'; yl='temperature (K)'; 
plot_a_b_new; 
visfig='off'; figpath='./fig_rce/'; expn='rceinsins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qi_avg_temp'; xmin=0; xmax=0.015; ymin=200; ymax=280;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; xy0=[3 15 ymin ymax]; opt=4;
c=1000; %kg/kg->g/kg; c=1E6; %kg->mg
a.v0=v0.qi.avg*c; a.c0=c0.qi.avg*c; a.w0=w0.qi.avg*c; 
a.v1=v1.qi.avg*c; a.c1=c1.qi.avg*c; a.w1=w1.qi.avg*c; 
a.v2=v2.qi.avg*c; a.c2=c2.qi.avg*c; a.w2=w2.qi.avg*c; 
a.v3=v3.qi.avg*c; a.c3=c3.qi.avg*c; a.w3=w3.qi.avg*c; 
a.v4=v4.qi.avg*c; a.c4=c4.qi.avg*c; a.w4=w4.qi.avg*c; 
a.v5=v5.qi.avg*c; a.c5=c5.qi.avg*c; a.w5=w5.qi.avg*c; 
b.v0=v0.ta.avg; b.c0=c0.ta.avg; b.w0=w0.ta.avg; 
b.v1=v1.ta.avg; b.c1=c1.ta.avg; b.w1=w1.ta.avg; 
b.v2=v2.ta.avg; b.c2=c2.ta.avg; b.w2=w2.ta.avg; 
b.v3=v3.ta.avg; b.c3=c3.ta.avg; b.w3=w3.ta.avg; 
b.v4=v4.ta.avg; b.c4=c4.ta.avg; b.w4=w4.ta.avg; 
b.v5=v5.ta.avg; b.c5=c5.ta.avg; b.w5=w5.ta.avg; 
xl='cloud ice water (g/kg)'; yl='temperature (K)'; 
plot_a_b_new; 
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa_avg_temp'; xmin=0; xmax=50; ymin=200; ymax=305;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; xy0=[0 15 ymin ymax]; opt=0;
c=100; 
a.v0=v0.qa_qc.avg*c; a.c0=c0.qa_qc.avg*c; a.w0=w0.qa_qc.avg*c; 
a.v1=v1.qa_qc.avg*c; a.c1=c1.qa_qc.avg*c; a.w1=w1.qa_qc.avg*c; 
a.v2=v2.qa_qc.avg*c; a.c2=c2.qa_qc.avg*c; a.w2=w2.qa_qc.avg*c; 
a.v3=v3.qa_qc.avg*c; a.c3=c3.qa_qc.avg*c; a.w3=w3.qa_qc.avg*c; 
a.v4=v4.qa_qc.avg*c; a.c4=c4.qa_qc.avg*c; a.w4=w4.qa_qc.avg*c; 
a.v5=v5.qa_qc.avg*c; a.c5=c5.qa_qc.avg*c; a.w5=w5.qa_qc.avg*c; 
b.v0=v0.ta.avg; b.c0=c0.ta.avg; b.w0=w0.ta.avg; 
b.v1=v1.ta.avg; b.c1=c1.ta.avg; b.w1=w1.ta.avg; 
b.v2=v2.ta.avg; b.c2=c2.ta.avg; b.w2=w2.ta.avg; 
b.v3=v3.ta.avg; b.c3=c3.ta.avg; b.w3=w3.ta.avg; 
b.v4=v4.ta.avg; b.c4=c4.ta.avg; b.w4=w4.ta.avg; 
b.v5=v5.ta.avg; b.c5=c5.ta.avg; b.w5=w5.ta.avg; 
xl='cloud amount (%)'; yl='temperature (K)'; 
plot_a_b_new; 
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='cup_area_temp'; xmin=0; xmax=30; ymin=200; ymax=305;ymin=0; ymax=18;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; xy0=[0 15 ymin ymax];
c=100; opt=4; ydir='reverse'; ydir='normal';
a.v0=v0.wbuo.cup.fav*c; a.c0=c0.wbuo.cup.fav*c; a.w0=w0.wbuo.cup.fav*c; 
a.v1=v1.wbuo.cup.fav*c; a.c1=c1.wbuo.cup.fav*c; a.w1=w1.wbuo.cup.fav*c; 
a.v2=v2.wbuo.cup.fav*c; a.c2=c2.wbuo.cup.fav*c; a.w2=w2.wbuo.cup.fav*c; 
a.v3=v3.wbuo.cup.fav*c; a.c3=c3.wbuo.cup.fav*c; a.w3=w3.wbuo.cup.fav*c; 
a.v4=v4.wbuo.cup.fav*c; a.c4=c4.wbuo.cup.fav*c; a.w4=w4.wbuo.cup.fav*c; 
a.v5=v5.wbuo.cup.fav*c; a.c5=c5.wbuo.cup.fav*c; a.w5=w5.wbuo.cup.fav*c; 
b.v0=v0.ta.avg; b.c0=c0.ta.avg; b.w0=w0.ta.avg; 
b.v1=v1.ta.avg; b.c1=c1.ta.avg; b.w1=w1.ta.avg; 
b.v2=v2.ta.avg; b.c2=c2.ta.avg; b.w2=w2.ta.avg; 
b.v3=v3.ta.avg; b.c3=c3.ta.avg; b.w3=w3.ta.avg; 
b.v4=v4.ta.avg; b.c4=c4.ta.avg; b.w4=w4.ta.avg; 
b.v5=v5.ta.avg; b.c5=c5.ta.avg; b.w5=w5.ta.avg; 

b.v0=v0.zf0; b.c0=c0.zf0; b.w0=w0.zf0; 
b.v1=v1.zf0; b.c1=c1.zf0; b.w1=w1.zf0; 
b.v2=v2.zf0; b.c2=c2.zf0; b.w2=w2.zf0; 
b.v3=v3.zf0; b.c3=c3.zf0; b.w3=w3.zf0; 
b.v4=v4.zf0; b.c4=c4.zf0; b.w4=w4.zf0; 
b.v5=v5.zf0; b.c5=c5.zf0; b.w5=w5.zf0;
xl='cloud updraft fraction'; yl='temperature (K)'; 
plot_a_b_new; 
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='cdn_area_temp'; xmin=0; xmax=0.3; ymin=200; ymax=305;
zf0=v0.zf0; xy=[xmin xmax ymin ymax]; xy0=[0 15 ymin ymax]; opt=4;
c=1; 
a.v0=v0.wbuo.cdn.fav; a.c0=c0.wbuo.cdn.fav; a.w0=w0.wbuo.cdn.fav; 
a.v1=v1.wbuo.cdn.fav; a.c1=c1.wbuo.cdn.fav; a.w1=w1.wbuo.cdn.fav; 
a.v2=v2.wbuo.cdn.fav; a.c2=c2.wbuo.cdn.fav; a.w2=w2.wbuo.cdn.fav; 
a.v3=v3.wbuo.cdn.fav; a.c3=c3.wbuo.cdn.fav; a.w3=w3.wbuo.cdn.fav; 
a.v4=v4.wbuo.cdn.fav; a.c4=c4.wbuo.cdn.fav; a.w4=w4.wbuo.cdn.fav; 
a.v5=v5.wbuo.cdn.fav; a.c5=c5.wbuo.cdn.fav; a.w5=w5.wbuo.cdn.fav; 
b.v0=v0.ta.avg; b.c0=c0.ta.avg; b.w0=w0.ta.avg; 
b.v1=v1.ta.avg; b.c1=c1.ta.avg; b.w1=w1.ta.avg; 
b.v2=v2.ta.avg; b.c2=c2.ta.avg; b.w2=w2.ta.avg; 
b.v3=v3.ta.avg; b.c3=c3.ta.avg; b.w3=w3.ta.avg; 
b.v4=v4.ta.avg; b.c4=c4.ta.avg; b.w4=w4.ta.avg; 
b.v5=v5.ta.avg; b.c5=c5.ta.avg; b.w5=w5.ta.avg; 
% $$$ b.v0=v0.zf0; b.c0=c0.zf0; b.w0=w0.zf0; 
% $$$ b.v1=v1.zf0; b.c1=c1.zf0; b.w1=w1.zf0; 
% $$$ b.v2=v2.zf0; b.c2=c2.zf0; b.w2=w2.zf0; 
% $$$ b.v3=v3.zf0; b.c3=c3.zf0; b.w3=w3.zf0; 
% $$$ b.v4=v4.zf0; b.c4=c4.zf0; b.w4=w4.zf0; 
% $$$ b.v5=v5.zf0; b.c5=c5.zf0; b.w5=w5.zf0;
xl='cloud updraft fraction'; yl='temperature (K)'; 
plot_a_b_new; 
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v.nz=v0.nz; v.nt=v0.nt;
wbin=[-25:2:-3 -2:0.25:-0.25 -0.1 0.1 0.25:0.25:2 3:2:25];
i=1; w500_r01_r01=v0.w500.all;
i=2; v.ngrid=1024*64; a=v0.r(i).w500.vbar; w500_r03_r01=getavar_smart(a,v,'2d',wbin);
i=3; v.ngrid=512*32;  a=v0.r(i).w500.vbar; w500_r06_r01=getavar_smart(a,v,'2d',wbin);
i=4; v.ngrid=256*16;  a=v0.r(i).w500.vbar; w500_r12_r01=getavar_smart(a,v,'2d',wbin);
i=5; v.ngrid=128*8;   a=v0.r(i).w500.vbar; w500_r24_r01=getavar_smart(a,v,'2d',wbin);
i=6; v.ngrid=64*4;    a=v0.r(i).w500.vbar; w500_r48_r01=getavar_smart(a,v,'2d',wbin);
i=1; w500_r03_r03=v1.w500.all; v.nt=v1.nt;
i=2; v.ngrid=1024*64; a=v1.r(i).w500.vbar; w500_r06_r03=getavar_smart(a,v,'2d',wbin);
i=3; v.ngrid=512*32;  a=v1.r(i).w500.vbar; w500_r12_r03=getavar_smart(a,v,'2d',wbin);
i=4; v.ngrid=256*16;  a=v1.r(i).w500.vbar; w500_r24_r03=getavar_smart(a,v,'2d',wbin);
i=5; v.ngrid=128*8;   a=v1.r(i).w500.vbar; w500_r48_r03=getavar_smart(a,v,'2d',wbin);
i=1; w500_r06_r06=v2.w500.all; v.nt=v2.nt;
i=2; v.ngrid=512*32;  a=v2.r(i).w500.vbar; w500_r12_r06=getavar_smart(a,v,'2d',wbin);
i=3; v.ngrid=256*16;  a=v2.r(i).w500.vbar; w500_r24_r06=getavar_smart(a,v,'2d',wbin);
i=4; v.ngrid=128*8;   a=v2.r(i).w500.vbar; w500_r48_r06=getavar_smart(a,v,'2d',wbin);
i=1; w500_r12_r12=v3.w500.all; v.nt=v3.nt;
i=2; v.ngrid=256*16;  a=v3.r(i).w500.vbar; w500_r24_r12=getavar_smart(a,v,'2d',wbin);
i=3; v.ngrid=128*8;   a=v3.r(i).w500.vbar; w500_r48_r12=getavar_smart(a,v,'2d',wbin);
i=1; w500_r24_r24=v4.w500.all; v.nt=v4.nt;
i=2; v.ngrid=128*8;   a=v4.r(i).w500.vbar; w500_r48_r24=getavar_smart(a,v,'2d',wbin);
i=1; w500_r48_r48=v5.w500.all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pbin=[-1 1 10:10:100 200:100:1000 10000]; %pbin=[1:100:1000];
i=1; pcp_r01_r01=v0.precip;v.nt=v0.nt;
i=2; v.ngrid=1024*64; a=squeeze(v0.r(i).pcp.vbar); pcp_r03_r01=getavar_smart(a,v,'2d',pbin);
i=3; v.ngrid=512*32;  a=squeeze(v0.r(i).pcp.vbar); pcp_r06_r01=getavar_smart(a,v,'2d',pbin);
i=4; v.ngrid=256*16;  a=squeeze(v0.r(i).pcp.vbar); pcp_r12_r01=getavar_smart(a,v,'2d',pbin);
i=5; v.ngrid=128*8;   a=squeeze(v0.r(i).pcp.vbar); pcp_r24_r01=getavar_smart(a,v,'2d',pbin);
i=6; v.ngrid=64*4;    a=squeeze(v0.r(i).pcp.vbar); pcp_r48_r01=getavar_smart(a,v,'2d',pbin);
i=1; pcp_r03_r03=v1.precip;v.nt=v1.nt;
i=2; v.ngrid=1024*64; a=squeeze(v1.r(i).pcp.vbar); pcp_r06_r03=getavar_smart(a,v,'2d',pbin);
i=3; v.ngrid=512*32;  a=squeeze(v1.r(i).pcp.vbar); pcp_r12_r03=getavar_smart(a,v,'2d',pbin);
i=4; v.ngrid=256*16;  a=squeeze(v1.r(i).pcp.vbar); pcp_r24_r03=getavar_smart(a,v,'2d',pbin);
i=5; v.ngrid=128*8;   a=squeeze(v1.r(i).pcp.vbar); pcp_r48_r03=getavar_smart(a,v,'2d',pbin);
i=1; pcp_r06_r06=v2.precip;v.nt=v2.nt;
i=2; v.ngrid=512*32;  a=squeeze(v2.r(i).pcp.vbar); pcp_r12_r06=getavar_smart(a,v,'2d',pbin);
i=3; v.ngrid=256*16;  a=squeeze(v2.r(i).pcp.vbar); pcp_r24_r06=getavar_smart(a,v,'2d',pbin);
i=4; v.ngrid=128*8;   a=squeeze(v2.r(i).pcp.vbar); pcp_r48_r06=getavar_smart(a,v,'2d',pbin);
i=1; pcp_r12_r12=v3.precip;v.nt=v3.nt;
i=2; v.ngrid=256*16;  a=squeeze(v3.r(i).pcp.vbar); pcp_r24_r12=getavar_smart(a,v,'2d',pbin);
i=3; v.ngrid=128*8;   a=squeeze(v3.r(i).pcp.vbar); pcp_r48_r12=getavar_smart(a,v,'2d',pbin);
i=1; pcp_r24_r24=v4.precip;v.nt=v4.nt;
i=2; v.ngrid=128*8;   a=squeeze(v4.r(i).pcp.vbar); pcp_r48_r24=getavar_smart(a,v,'2d',pbin);
i=1; pcp_r48_r48=v5.precip;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
V0='m-'; V1='r-'; V2='g-'; V3='b-'; V4='k-'; V5='c-'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fractional area of updraft dependence on subdomain size%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=[1:8]; xx0=x(1:8); xx1=(2:8); xx2=[3:8];
varn='wmse500'; 
vx=v0; x=getflx(vx,8,varn); sigma0=x.fa_wup; sigsd0=x.fa_std;
vx=v1; x=getflx(vx,7,varn); sigma1=x.fa_wup; sigsd1=x.fa_std;
vx=v2; x=getflx(vx,6,varn); sigma2=x.fa_wup; sigsd2=x.fa_std;
vname='sigma_vs_d'; xy=[0.5 8.5 -0.1 1];
pms=[ 0, 0, 800, 650]*1; row=1; col=1; msize=8; fsize=20;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); x=[1:8]; yl='height z (km)'; lw=2;
errorbar(xx0,sigma0,sigsd0,'r-*','LineWidth',lw,'MarkerSize',msize);hold on;
errorbar(xx1,sigma1,sigsd1,'g-s','LineWidth',lw,'MarkerSize',msize);hold on;
errorbar(xx2,sigma2,sigsd2,'b-d','LineWidth',lw,'MarkerSize',msize);hold on;
axis(xy); legend('R1.5km','R03km','R06km',2);
xlist={'1.5','3','6','12','24','48','96','192'}; set(gca,'xDir','reverse');
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
yl='fractional area of updraft (\sigma)'; ylabel(yl,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
title('height = 5.8km (pressure \approx 500hPa)','FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%transport, partitions, and dependence on subdomain size%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=[1:8]; xx0=x(1:8); xx1=(2:8); xx2=[3:8];
varn='wmse500'; varn='wmse3km'; %varn='wqt3km'; %varn='whli3km';
vname=strcat('flx_vs_d_',varn);
vx=v0; x0=getflx(vx,8,varn);
vx=v1; x1=getflx(vx,7,varn);
vx=v2; x2=getflx(vx,6,varn);
xy=[0.5 8.5 10 18000]; xy=[0.5 8.5 0 2500];
pms=[ 0, 0, 800, 650]*1; row=1; col=1; msize=8; fsize=20;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); x=[1:8]; yl='height z (km)'; lw=2;
lw='LineWidth'; d1=2; d2=d1*3; ms='MarkerSize';
% $$$ semilogy(xx0,x0.fx_tot,'r-*', lw,d1,ms,msize);hold on;
% $$$ semilogy(xx1,x1.fx_tot,'k-*', lw,d1,ms,msize);hold on;
% $$$ semilogy(xx2,x2.fx_tot,'b-*', lw,d1,ms,msize);hold on;
% $$$ semilogy(xx0,x0.fx_grd,'r:o', lw,d1,ms,msize);hold on;
% $$$ semilogy(xx1,x1.fx_grd,'k:o', lw,d1,ms,msize);hold on;
% $$$ semilogy(xx2,x2.fx_grd,'b:o', lw,d1,ms,msize);hold on;
% $$$ semilogy(xx0,x0.fx_edd,'r--s',lw,d1,ms,msize);hold on;
% $$$ semilogy(xx1,x1.fx_edd,'k--s',lw,d1,ms,msize);hold on;
% $$$ semilogy(xx2,x2.fx_edd,'b--s',lw,d1,ms,msize);hold on;
% $$$ axis(xy); legend('R1.5km','R03km','R06km',2);
plot(xx0,x0.fx_tot,'r-*', lw,d1,ms,msize);hold on;
plot(xx0,x0.fx_grd,'r:o', lw,d1,ms,msize);hold on;
plot(xx0,x0.fx_edd,'r--s',lw,d1,ms,msize);hold on;
plot(xx0,x0.fx_ed1,'b--p',lw,d1,ms,msize);hold on;
plot(xx0,x0.fx_ed2,'k--d',lw,d1,ms,msize);hold on;
axis(xy); legend('total','grid-scale','eddy','model1','model2',2);
xlist={'1.5','3','6','12','24','48','96','192'}; set(gca,'xDir','reverse');
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
yl='vertical transport of MSE (W/m2)'; ylabel(yl,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
%title('height = 3 km','FontSize',fsize);
%title('height = 5.8km (pressure \approx 500hPa)','FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='wmse500'; varn='wmse3km'; %varn='wqt3km'; %varn='whli3km';
vname=strcat('flx_ratio_vs_d_',varn);
vx=v0; x0=getflx(vx,8,varn); 
vx=v1; x1=getflx(vx,7,varn);
vx=v2; x2=getflx(vx,6,varn); xy=[0.5 8.5 0 1];
pms=[ 0, 0, 800, 650]*1; row=1; col=1; msize=8; fsize=20;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); x=[1:8]; yl='height z (km)'; lw=2;
plot(xx0,x0.fx_grd./x0.fx_tot,'r:o', 'LineWidth',lw,'MarkerSize',msize);hold on;
plot(xx0,x0.fx_edd./x0.fx_tot,'r-s', 'LineWidth',lw,'MarkerSize',msize);hold on;
plot(xx0,x0.fx_ed1./x0.fx_tot,'b-p', 'LineWidth',lw,'MarkerSize',msize);hold on;
plot(xx0,x0.fx_ed2./x0.fx_tot,'k-d', 'LineWidth',lw,'MarkerSize',msize);hold on;
axis(xy); legend('grid-scale','eddy','model1','model2',2);
% $$$ plot(xx1,x1.fx_edd./x1.fx_tot,'k-s', 'LineWidth',lw,'MarkerSize',msize);hold on;
% $$$ plot(xx2,x2.fx_edd./x2.fx_tot,'b-s', 'LineWidth',lw,'MarkerSize',msize);hold on;
% $$$ plot(xx1,x1.fx_grd./x1.fx_tot,'k:o', 'LineWidth',lw,'MarkerSize',msize);hold on;
% $$$ plot(xx2,x2.fx_grd./x2.fx_tot,'b:o', 'LineWidth',lw,'MarkerSize',msize);hold on;
% $$$ plot(xx1,x1.fx_ed1./x1.fx_tot,'k-p', 'LineWidth',lw,'MarkerSize',msize);hold on;
% $$$ plot(xx2,x2.fx_ed1./x2.fx_tot,'b-p', 'LineWidth',lw,'MarkerSize',msize);hold on;
% $$$ plot(xx1,x1.fx_ed2./x1.fx_tot,'k-d', 'LineWidth',lw,'MarkerSize',msize);hold on;
% $$$ plot(xx2,x2.fx_ed2./x2.fx_tot,'b-d', 'LineWidth',lw,'MarkerSize',msize);hold on;
% $$$ axis(xy); legend('R1.5km','R03km','R06km',0);
xlist={'1.5','3','6','12','24','48','96','192'}; set(gca,'xDir','reverse');
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
yl='fraction of total transport of MSE'; ylabel(yl,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
%title('height = 5.8km (pressure \approx 500hPa)','FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2D distribution of the ratio of eddy to total MSE flux based on 1.5kmrun
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='wmse500'; varn='wmse3km'; vname=strcat('rat2d_',varn);
vx=v0; x=getfx_sig(vx,8,varn); %BASED on 1.5km RUN
binc=x.binc; sbin=x.sbin;
A=(x.flx_edd'./x.flx_tot')*100; B=A; 
B(end+1,:)=B(end,:); B(:,end+1)=B(:,end); 
x =[1:1:9]; y=sbin; xc=x+0.5;   yc=binc; 
pms=[ 0, 0, 800, 650]*1; row=1; col=1; fsize=20;
handle = figure('Position', pms,'visible','on');
pcolor(x,y,B); colormap summer;
for j=1:10
  for i=1:8
    str= num2str(A(j,i),2);
    if ~strcmp(str,'NaN')
      text(xc(i)+0.1,yc(j),str,'FontSize',fsize);
    end
  end
end
xlist={'1.5','3','6','12','24','48','96','192'}; set(gca,'xDir','reverse');
set(gca,'xtick',xc); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size (km)'; xlabel(xl,'FontSize',fsize); 
yl='fractional area of updrafts'; ylabel(yl,'FontSize',fsize); 
title('ratio of eddy to total flux of MSE'); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn=v1.expn;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2D distribution of the ratio of eddy to total MSE flux based on 3km run
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='wmse500'; vx=v1; x=getfx_sig(vx,7,varn); %BASED on 3km RUN
binc=x.binc; sbin=x.sbin;
A=(x.flx_edd'./x.flx_tot')*100; B=A; 
B(end+1,:)=B(end,:); B(:,end+1)=B(:,end); 
x =[1:1:8]; y=sbin; xc=x+0.5;   yc=binc; 
pms=[ 0, 0, 800, 650]*1; row=1; col=1; fsize=20;
handle = figure('Position', pms,'visible','on');
pcolor(x,y,B); colormap summer;
for j=1:10
  for i=1:7
    str= num2str(A(j,i),2);
    if ~strcmp(str,'NaN')
      text(xc(i)+0.1,yc(j),str,'FontSize',fsize);
    end
  end
end
xlist={'3','6','12','24','48','96','192'}; set(gca,'xDir','reverse');
set(gca,'xtick',xc); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size (km)'; xlabel(xl,'FontSize',fsize); 
yl='fractional area of updrafts'; ylabel(yl,'FontSize',fsize); 
title('ratio of eddy to total flux of MSE'); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_rceins/'; expn=v1.expn;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PDF of sigma%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='wmse500'; varn='wmse3km'; vname=strcat('pdf_2d_',varn);
vx=v0; x=getfx_sig(vx,8,varn); binc=x.binc; sbin=x.sbin;
A=x.pdf_sig'*100; B=A; 
B(end+1,:)=B(end,:); B(:,end+1)=B(:,end); 
x =[1:1:9]; y=sbin; xc=x+0.5;   yc=binc; 
pms=[ 0, 0, 800, 650]*1; row=1; col=1; fsize=20;
handle = figure('Position', pms,'visible','on');
pcolor(x,y,B); colormap summer;
for j=1:10
  for i=1:8
    if (A(j,i)>1)
      str= num2str(A(j,i),3);
    elseif (A(j,i)>0.1)
      str= sprintf('%2.1f',A(j,i));
    elseif (A(j,i)>0.01)
      str= sprintf('%2.2f',A(j,i));
    else
      str= num2str(A(j,i),2);
    end
    if ~strcmp(str,'NaN')
      text(xc(i)+0.25,yc(j),str,'FontSize',fsize);
    end
  end
end
xlist={'1.5','3','6','12','24','48','96','192'}; set(gca,'xDir','reverse');
set(gca,'xtick',xc); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
yl='fractional area of updrafts'; ylabel(yl,'FontSize',fsize); 
title('probability distribution of updrafts containing subdomain (%)');
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn=v1.expn;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PDF of sigma 2D distribution%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='wmse500'; varn='wmse3km'; vname=strcat('pdf_2d_',varn);
vx=v1; x=getfx_sig(vx,7,varn); binc=x.binc; sbin=x.sbin;
A=x.pdf_sig'*100; B=A; 
B(end+1,:)=B(end,:); B(:,end+1)=B(:,end); 
x =[1:1:8]; y=sbin; xc=x+0.5;   yc=binc; 
pms=[ 0, 0, 800, 650]*1; row=1; col=1; fsize=20;
handle = figure('Position', pms,'visible','on');
pcolor(x,y,B); colormap summer;
for j=1:10
  for i=1:7
    if (A(j,i)>1)
      str= num2str(A(j,i),3);
    elseif (A(j,i)>0.1)
      str= sprintf('%2.1f',A(j,i));
    elseif (A(j,i)>0.01)
      str= sprintf('%2.2f',A(j,i));
    else
      str= num2str(A(j,i),2);
    end
    if ~strcmp(str,'NaN')
      text(xc(i)+0.25,yc(j),str,'FontSize',fsize);
    end
  end
end
xlist={'3','6','12','24','48','96','192'}; set(gca,'xDir','reverse');
set(gca,'xtick',xc); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
yl='fractional area of updrafts'; ylabel(yl,'FontSize',fsize); 
title('probability distribution of updrafts containing subdomain (%)');
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_rceins/'; expn=v1.expn;
printit(visfig,figpath,expn,vname);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PDF of sigma 1D distribution%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='wmse500'; varn='wmse3km'; vname=strcat('sigma_',varn);
vx=v0; x=getfx_sig(vx,8,varn); binc=x.binc; sbin=x.sbin;
a=v0.r(4).wmse500; x=get_fx_sigma(a);

%i=3; d=06km derived from 1.5km run
%i=4; d=12km derived from 1.5km run
%i=4; d=24km derived from 1.5km run
pms=[ 0, 0, 800, 650]*1; row=1; col=1; fsize=20;
handle = figure('Position', pms,'visible','on');
lw='LineWidth'; d1=2; d2=d1*3;
i=3; plot(binc,x.flx_edd(i,:),'b-s',lw,d1); hold on; 
i=4; plot(binc,x.flx_edd(i,:),'r-*',lw,d1);
figure;
i=3; plot(binc,x.pdf_sig(i,:),'b-s',lw,d1); hold on; 
i=4; plot(binc,x.pdf_sig(i,:),'r-*',lw,d1);

xl='\sigma'; xlabel(xl,'FontSize',fsize); 
yl='PDF'; ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn=v1.expn;
printit(visfig,figpath,expn,vname);

vx=v0;
fa    =vx.r(3).wmse500.fa_wup;
fx_edd=vx.r(3).wmse500.fx_edd;
fx_grd=vx.r(3).wmse500.fx_grd;
fx_tot=vx.r(3).wmse500.fx_tot;
id=(fa>0); figure; plot(fa(id),fx_edd(id),'.');

pms=[ 0, 0, 800, 650]*1; row=1; col=1; fsize=20;
handle = figure('Position', pms,'visible','on');
errorbar(sigma,y1,dy1,'r'); hold on;
errorbar(sigma,y2,dy2,'g'); hold on;
errorbar(sigma,y3,dy3,'b'); hold on;
xl='\sigma'; xlabel(xl,'FontSize',fsize); 
yl='vertical MSE transport (W/m2)'; ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rceins/'; expn=v1.expn;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fx_vs_sigma'; xy=[0 1 -1000 28000]
sigma=fx_sig4.binc; psig=fx_sig4.pdf_sigma;
y1=fx_sig4.fx_edd_avg; dy1=fx_sig4.fx_edd_std;
y2=fx_sig4.fx_grd_avg; dy2=fx_sig4.fx_grd_std;
y3=fx_sig4.fx_tot_avg; dy3=fx_sig4.fx_tot_std;
%figure; plot(x,y1.*p); hold on; plot(x,y2.*p,'r'); plot(x,y3.*p,'k');figure; plot(x,p);

pms=[ 0, 0, 800, 650]*1; row=1; col=1; fsize=20;
handle = figure('Position', pms,'visible','on');
errorbar(sigma,y1,dy1,'r'); hold on;
errorbar(sigma,y2,dy2,'g'); hold on;
errorbar(sigma,y3,dy3,'b'); hold on;
xl='\sigma'; xlabel(xl,'FontSize',fsize); 
yl='vertical MSE transport (W/m2)'; ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn=v1.expn;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pfx_vs_sigma'; xy=[0 1 0 450];
sigma=fx_sig4.binc; psig=fx_sig4.pdf_sigma;
y1=fx_sig4.fx_edd_avg; dy1=fx_sig4.fx_edd_std;
y2=fx_sig4.fx_grd_avg; dy2=fx_sig4.fx_grd_std;
y3=fx_sig4.fx_tot_avg; dy3=fx_sig4.fx_tot_std;
pms=[ 0, 0, 800, 650]*1; row=1; col=1; fsize=20;
handle = figure('Position', pms,'visible','on');
lw='LineWidth'; d1=2; d2=d1*3;
plot(sigma,y1.*psig,'r',lw,d1); hold on;
plot(sigma,y2.*psig,'k',lw,d1); hold on;
plot(sigma,y3.*psig,'b',lw,d1); hold on;
legend('eddy','grid-scale','total',1);
xl='\sigma'; xlabel(xl,'FontSize',fsize); 
yl='PDF weighted vertical MSE transport (W/m2)'; ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rceins/'; expn=v1.expn;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




V0='m-'; V1='r-'; V2='g-'; V3='b-'; V4='k-'; V5='c-'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%precip and w PDF analysis%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_pdf_rx'; xy=[1 10000 10E-10 0.02];
a=v2.precip; binc=a.binc; bins=a.bins; fsize=24; msize=8;
pms=[ 0, 0, 1200, 800]*0.7; 
handle = figure('Position', pms,'visible','on'); n=1; 
a.v0=pcp_r01_r01.pdf./bins; a.v1=pcp_r03_r03.pdf./bins; 
a.v2=pcp_r06_r06.pdf./bins; a.v3=pcp_r12_r12.pdf./bins; 
a.v4=pcp_r24_r24.pdf./bins; a.v5=pcp_r48_r48.pdf./bins; 
lw='LineWidth'; d1=2; d2=d1*3;
loglog(binc,a.v0,V0,lw,d1); hold on; loglog(binc,a.v1,V1,lw,d1); 
loglog(binc,a.v2,V2,lw,d1); loglog(binc,a.v3,V3,lw,d1);
loglog(binc,a.v4,V4,lw,d1); loglog(binc,a.v5,V5,lw,d1);
legend('R1.5','R03','R06','R12','R24','R48',3); axis(xy);
xl='surface precipitation (mm/day)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (m/s)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_pdf_Rx_r03'; xy=[1 10000 10E-10 0.02];
a=v2.precip; binc=a.binc; bins=a.bins; fsize=24; msize=8;
pms=[ 0, 0, 1200, 800]*0.7; 
handle = figure('Position', pms,'visible','on'); n=1; 
a.v0=pcp_r03_r03.pdf./bins; a.v1=pcp_r06_r03.pdf./bins; 
a.v2=pcp_r12_r03.pdf./bins; a.v3=pcp_r24_r03.pdf./bins; 
a.v4=pcp_r48_r03.pdf./bins; a.v5=pcp_r24_r24.pdf./bins; a.v6=pcp_r48_r48.pdf./bins;
lw='LineWidth'; d1=1; d2=d1*2;
loglog(binc,a.v0,V0,lw,d1); hold on; loglog(binc,a.v1,V1,lw,d1); 
loglog(binc,a.v2,V2,lw,d1); loglog(binc,a.v3,V3,lw,d1);
loglog(binc,a.v4,V4,lw,d1); loglog(binc,a.v5,V3,lw,d2); loglog(binc,a.v6,V4,lw,d2); 
legend('R03(org)','R06-from-R03','R12-from-R03','R24-from-R03','R48-from-R03','R24(org)','R48(org)',3);
xl='surface precipitation (mm/day)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (m/s)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_pdf_R48_rx'; xy=[1 10000 10E-10 0.02];
a=v2.precip; binc=a.binc; bins=a.bins; fsize=24; msize=8;
pms=[ 0, 0, 1200, 800]*0.7; 
handle = figure('Position', pms,'visible','on'); n=1; 
a.v0=pcp_r48_r01.pdf./bins; a.v1=pcp_r48_r03.pdf./bins; 
a.v2=pcp_r48_r06.pdf./bins; a.v3=pcp_r48_r12.pdf./bins; 
a.v4=pcp_r48_r24.pdf./bins; a.v5=pcp_r48_r48.pdf./bins;
lw='LineWidth'; d1=2; d2=d1*3;
loglog(binc,a.v0,V0,lw,d1); hold on; loglog(binc,a.v1,V1,lw,d1); 
loglog(binc,a.v2,V2,lw,d1); loglog(binc,a.v3,V3,lw,d1);
loglog(binc,a.v4,V4,lw,d1); loglog(binc,a.v5,V5,lw,d1);
legend('R48-from-R1.5','R48-from-R03','R48-from-R06','R48-from-R12','R48-from-R24','R48(org)',3); 
xl='surface precipitation (mm/day)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (m/s)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_pdf_R24_rx'; xy=[1 10000 10E-10 0.02];
a=v2.precip; binc=a.binc; bins=a.bins; fsize=24; msize=8;
pms=[ 0, 0, 1200, 800]*0.7; 
handle = figure('Position', pms,'visible','on'); n=1; 
a.v0=pcp_r24_r01.pdf./bins; a.v1=pcp_r24_r03.pdf./bins; 
a.v2=pcp_r24_r06.pdf./bins; a.v3=pcp_r24_r12.pdf./bins; 
a.v4=pcp_r24_r24.pdf./bins; 
lw='LineWidth'; d1=2; d2=d1*3;
loglog(binc,a.v0,V0,lw,d1); hold on; loglog(binc,a.v1,V1,lw,d1); 
loglog(binc,a.v2,V2,lw,d1); loglog(binc,a.v3,V3,lw,d1);
loglog(binc,a.v4,V4,lw,d1); 
legend('R24-from-R1.5','R24-from-R03','R24-from-R06','R24-from-R12','R24(org)',3);
xl='surface precipitation (mm/day)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (m/s)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w500_pdf_rx'; xy=[-4 15 1E-7 10];
a=v1.w500.all; binc=a.binc; bins=a.bins; 
pms=[ 0, 0, 1200, 800]*0.8; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1; 
a.v0=w500_r01_r01.pdf./bins; a.v1=w500_r03_r03.pdf./bins; 
a.v2=w500_r06_r06.pdf./bins; a.v3=w500_r12_r12.pdf./bins;
a.v4=w500_r24_r24.pdf./bins; a.v5=w500_r48_r48.pdf./bins; a.v5=v6.w500.all.pdf./bins;
lw='LineWidth'; d1=2; d2=d1*3;
semilogy(binc,a.v0,V0,lw,d1); hold on; semilogy(binc,a.v1,V1,lw,d1); 
semilogy(binc,a.v2,V2,lw,d1); semilogy(binc,a.v3,V3,lw,d1);
semilogy(binc,a.v4,V4,lw,d1); semilogy(binc,a.v5,V5,lw,d1);
legend('R1.5','R03','R06','R12','R24','R48',1); 
xl='500hPa vertical velocity (m/s)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (m/s)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w500_pdf_R48_rx'; xy=[-0.5 2.5 10E-7 10];
a=v1.w500.all; binc=a.binc; bins=a.bins; fsize=24; lw=2; msize=8;
pms=[ 0, 0, 1200, 800]*0.8; 
handle = figure('Position', pms,'visible','on'); n=1; 
a.v0=w500_r48_r01.pdf./bins; a.v1=w500_r48_r03.pdf./bins; 
a.v2=w500_r48_r06.pdf./bins; a.v3=w500_r48_r12.pdf./bins;
a.v4=w500_r48_r24.pdf./bins; a.v5=w500_r48_r48.pdf./bins;
lw='LineWidth'; d1=2; d2=d1*3;
semilogy(binc,a.v0,V0,lw,d1); hold on; semilogy(binc,a.v1,V1,lw,d1); 
semilogy(binc,a.v2,V2,lw,d1); semilogy(binc,a.v3,V3,lw,d1);
semilogy(binc,a.v4,V4,lw,d1); semilogy(binc,a.v5,V5,lw,d1);
legend('R48-from-R1.5','R48-from-R03','R48-from-R06','R48-from-R12','R48-from-R24','R48(org)',1); 
xl='500hPa vertical velocity (m/s)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (m/s)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w500_pdf_R24_rx'; xy=[-1 5 10E-7 10];
a=v1.w500.all; binc=a.binc; bins=a.bins; fsize=24; lw=2; msize=8;
pms=[ 0, 0, 1200, 800]*0.8; 
handle = figure('Position', pms,'visible','on'); n=1; 
a.v0=w500_r24_r01.pdf./bins; a.v1=w500_r24_r03.pdf./bins; 
a.v2=w500_r24_r06.pdf./bins; a.v3=w500_r24_r12.pdf./bins; a.v4=w500_r24_r24.pdf./bins;
lw='LineWidth'; d1=2; d2=d1*3;
semilogy(binc,a.v0,V0,lw,d1); hold on; semilogy(binc,a.v1,V1,lw,d1); 
semilogy(binc,a.v2,V2,lw,d1); semilogy(binc,a.v3,V3,lw,d1);
semilogy(binc,a.v4,V4,lw,d1); %semilogy(binc,a.v5,V5,lw,d1);
legend('R24-from-R1.5','R24-from-R03','R24-from-R06','R24-from-R12','R24(org)',1);
xl='500hPa vertical velocity (m/s)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (m/s)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rceins';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




V0='m-'; V1='r-'; V2='g-'; V3='b-'; V4='k-'; V5='c-'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tdt_rd'; xy=[0 100 0 15]; zf0=v1.zf0/1000;
pms=[ 0, 0, 1200, 800]*0.8; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1; k1=15; k2=79;
lw='LineWidth'; d1=2; d2=d1*3; a=86400;
x=v0.qc.avg*a; plot(x,zf0,V0,lw,d1); hold on;
x=v1.qc.avg*a; plot(x,zf0,V1,lw,d1); hold on;
x=v2.qc.avg*a; plot(x,zf0,V2,lw,d1); hold on;
x=v3.qc.avg*a; plot(x,zf0,V3,lw,d1); hold on;
x=v4.qc.avg*a; plot(x,zf0,V4,lw,d1); hold on;
x=v5.qc.avg*a; plot(x,zf0,V5,lw,d1); hold on;
legend('R1.5','R03','R06','R12','R24','R48',2); %axis(xy);
xl='vertical flux of moist static energy (W/m2)'; xlabel(xl,'FontSize',fsize);
yl='height z (km)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tdt_rd'; xy=[0 100 0 15]; zf0=v1.zf0/1000;
pms=[ 0, 0, 1200, 800]*0.8; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1; k1=15; k2=79;
lw='LineWidth'; d1=2; d2=d1*3; a=86400;
x=v0.tdt_rd.avg*a; plot(x,zf0,V0,lw,d1); hold on;
x=v1.tdt_rd.avg*a; plot(x,zf0,V1,lw,d1); hold on;
x=v2.tdt_rd.avg*a; plot(x,zf0,V2,lw,d1); hold on;
x=v3.tdt_rd.avg*a; plot(x,zf0,V3,lw,d1); hold on;
x=v4.tdt_rd.avg*a; plot(x,zf0,V4,lw,d1); hold on;
x=v5.tdt_rd.avg*a; plot(x,zf0,V5,lw,d1); hold on;
legend('R1.5','R03','R06','R12','R24','R48',2); %axis(xy);
xl='vertical flux of moist static energy (W/m2)'; xlabel(xl,'FontSize',fsize);
yl='height z (km)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_rceins/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wmse'; xy=[0 100 0 15]; zf0=v1.zf0/1000;
pms=[ 0, 0, 1200, 800]*0.8; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1; k1=15; k2=79;
lw='LineWidth'; d1=2; d2=d1*3; 
x=v0.wmse_all.avg; plot(x,zf0,V0,lw,d1); hold on;
x=v1.wmse_all.avg; plot(x,zf0,V1,lw,d1); hold on;
x=v2.wmse_all.avg; plot(x,zf0,V2,lw,d1); hold on;
x=v3.wmse_all.avg; plot(x,zf0,V3,lw,d1); hold on;
x=v4.wmse_all.avg; plot(x,zf0,V4,lw,d1); hold on;
x=v5.wmse_all.avg; plot(x,zf0,V5,lw,d1); hold on;
legend('R1.5','R03','R06','R12','R24','R48',1); %axis(xy);
xl='vertical flux of moist static energy (W/m2)'; xlabel(xl,'FontSize',fsize);
yl='height z (km)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wdse'; xy=[-20 20 0 15]; zf0=v1.zf0/1000;
pms=[ 0, 0, 1200, 800]*0.8; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1; k1=15; k2=79;
lw='LineWidth'; d1=2; d2=d1*3; 
x=v0.wdse_all.avg; plot(x,zf0,V0,lw,d1); hold on;
x=v1.wdse_all.avg; plot(x,zf0,V1,lw,d1); hold on;
x=v2.wdse_all.avg; plot(x,zf0,V2,lw,d1); hold on;
x=v3.wdse_all.avg; plot(x,zf0,V3,lw,d1); hold on;
x=v4.wdse_all.avg; plot(x,zf0,V4,lw,d1); hold on;
x=v5.wdse_all.avg; plot(x,zf0,V5,lw,d1); hold on;
legend('R1.5','R03','R06','R12','R24','R48',1); axis(xy);
xl='vertical flux of dry static energy (W/m2)'; xlabel(xl,'FontSize',fsize);
yl='height z (km)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='whli'; xy=[-20 20 0 15]; zf0=v1.zf0/1000;
pms=[ 0, 0, 1200, 800]*0.8; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1; k1=15; k2=79;
lw='LineWidth'; d1=2; d2=d1*3; 
plot(v0.whli.avg,zf0,V0,lw,d1); hold on;
plot(v1.whli.avg,zf0,V1,lw,d1); hold on;
plot(v2.whli.avg,zf0,V2,lw,d1); hold on;
plot(v3.whli.avg,zf0,V3,lw,d1); hold on;
plot(v4.whli.avg,zf0,V4,lw,d1); hold on;
plot(v5.whli.avg,zf0,V5,lw,d1); hold on;
legend('R1.5','R03','R06','R12','R24','R48',1); axis(xy);
xl='vertical flux of liquid water static energy (W/m2)'; xlabel(xl,'FontSize',fsize);
yl='height z (km)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wthvp'; xy=[-0.005 0.02 0 15]; zf0=v1.zf0/1000;
pms=[ 0, 0, 1200, 800]*0.8; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1; k1=15; k2=79;
lw='LineWidth'; d1=2; d2=d1*3; 
plot(v0.wthvp.avg,zf0,V0,lw,d1); hold on;
plot(v1.wthvp.avg,zf0,V1,lw,d1); hold on;
plot(v2.wthvp.avg,zf0,V2,lw,d1); hold on;
plot(v3.wthvp.avg,zf0,V3,lw,d1); hold on;
plot(v4.wthvp.avg,zf0,V4,lw,d1); hold on;
plot(v5.wthvp.avg,zf0,V5,lw,d1); hold on;
legend('R1.5','R03','R06','R12','R24','R48',1); axis(xy);
xl='vertical flux of virtual potential temperature (K m/s)'; xlabel(xl,'FontSize',fsize);
yl='height z (km)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%




[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath='/work/miz/mat_rce/'; 
res='org_z'; fext=strcat('_',res,'_ins_scale200_230fast1.mat');
expn='RCE_H2048x128_L79_R01_300'; fn=strcat(tpath,expn,fext); load(fn);v0=v;
expn='RCE_H2048x128_L79_R03_300'; fn=strcat(tpath,expn,fext); load(fn);v1=v;

v1.r192.mse.fa_w_sg_std=get_std(v1.r192.mse.fa_w_sg);
v1.r96.mse.fa_w_sg_std =get_std(v1.r96.mse.fa_w_sg);
v1.r48.mse.fa_w_sg_std =get_std(v1.r48.mse.fa_w_sg);
v1.r24.mse.fa_w_sg_std =get_std(v1.r24.mse.fa_w_sg);
v1.r12.mse.fa_w_sg_std =get_std(v1.r12.mse.fa_w_sg);
v1.r06.mse.fa_w_sg_std =get_std(v1.r06.mse.fa_w_sg);
v1.r03.mse.fa_w_sg_std =get_std(v1.r03.mse.fa_w_sg);

a=v1.r(2).wmse;  v1.r(2).flx_sigma=get_flx_sigma (a.fa_w_sg, a.flx_edd, a.flx_grd, a.flx_tot);
a=v1.r12.mse;  v1.r12.flx_sigma=get_flx_sigma (a.fa_w_sg, a.flx_edd, a.flx_grd, a.flx_tot);
a=v1.r24.mse;  v1.r24.flx_sigma=get_flx_sigma (a.fa_w_sg, a.flx_edd, a.flx_grd, a.flx_tot);
a=v1.r48.mse;  v1.r48.flx_sigma=get_flx_sigma (a.fa_w_sg, a.flx_edd, a.flx_grd, a.flx_tot);
a=v1.r96.mse;  v1.r96.flx_sigma=get_flx_sigma (a.fa_w_sg, a.flx_edd, a.flx_grd, a.flx_tot);
a=v1.r192.mse; v1.r192.flx_sigma=get_flx_sigma(a.fa_w_sg, a.flx_edd, a.flx_grd, a.flx_tot);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=25; vname='raito_2d';
a=v1.r03.flx_sigma.flx_edd_sigma (k,:); a1=a';
a=v1.r06.flx_sigma.flx_edd_sigma (k,:); a2=a';
a=v1.r12.flx_sigma.flx_edd_sigma (k,:); a3=a';
a=v1.r24.flx_sigma.flx_edd_sigma (k,:); a4=a';
a=v1.r48.flx_sigma.flx_edd_sigma (k,:); a5=a';
a=v1.r96.flx_sigma.flx_edd_sigma (k,:); a6=a';
a=v1.r192.flx_sigma.flx_edd_sigma(k,:); a7=a';
flx_edd=[a1 a2 a3 a4 a5 a6 a7]; 
a=v1.r03.flx_sigma.flx_tot_sigma (k,:); a1=a';
a=v1.r06.flx_sigma.flx_tot_sigma (k,:); a2=a';
a=v1.r12.flx_sigma.flx_tot_sigma (k,:); a3=a';
a=v1.r24.flx_sigma.flx_tot_sigma (k,:); a4=a';
a=v1.r48.flx_sigma.flx_tot_sigma (k,:); a5=a';
a=v1.r96.flx_sigma.flx_tot_sigma (k,:); a6=a';
a=v1.r192.flx_sigma.flx_tot_sigma(k,:); a7=a';
flx_tot=[a1 a2 a3 a4 a5 a6 a7]; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
binc=v1.r12.flx_sigma.binc; sbin=v1.r12.flx_sigma.sbin;
A=(flx_edd./flx_tot)*100; B=A; 
B(end+1,:)=B(end,:); B(:,end+1)=B(:,end); 
x =[1:1:8]; y=sbin; xc=x+0.5;   yc=binc; 
pms=[ 0, 0, 800, 650]*1; row=1; col=1; fsize=20;
handle = figure('Position', pms,'visible','on');
pcolor(x,y,B); colormap summer;
for j=1:10
  for i=1:7
    str= num2str(A(j,i),2);
    if ~strcmp(str,'NaN')
      text(xc(i)+0.1,yc(j),str,'FontSize',fsize);
    end
  end
end
xlist={'3','6','12','24','48','96','192'}; set(gca,'xDir','reverse');
set(gca,'xtick',xc); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='coarsen grid size (km)'; xlabel(xl,'FontSize',fsize); 
yl='fractional area of updrafts'; ylabel(yl,'FontSize',fsize); 
title('ratio of eddy flux to total flux'); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn=v1.expn;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1600, 1300]*1; row=2; col=2; fsize=16;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); yl='height z (km)'; 
x=v1.r12.flx_sigma.binc; k=25; 
y1=v1.r12.flx_sigma.flx_edd_sigma (k,:);
y2=v1.r24.flx_sigma.flx_edd_sigma (k,:);
plot(x,y1,'bs-','LineWidth',lw); hold on;
plot(x,y2,'r*-','LineWidth',lw); hold on;
subplot(row,col,2);
z1=v1.r12.flx_sigma.flx_tot_sigma (k,:);
z2=v1.r24.flx_sigma.flx_tot_sigma (k,:);
plot(x,z1,'bs-','LineWidth',lw); hold on;
plot(x,z2,'r*-','LineWidth',lw); hold on;
subplot(row,col,3);
plot(x,y1./z1,'bs-','LineWidth',lw); hold on;
plot(x,y2./z2,'r*-','LineWidth',lw); hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='updraft_area'; xl='coarsen grid size (km)'; xy=[1 7 0 15];
x=[1:7]; z=v.zf0/1000.; xlist={'3','6','12','24','48','96','192'};
a=v1.r03.mse.fa_w_sg_avg;  a1=mean(a,1)';
a=v1.r06.mse.fa_w_sg_avg;  a2=mean(a,1)';
a=v1.r12.mse.fa_w_sg_avg;  a3=mean(a,1)';
a=v1.r24.mse.fa_w_sg_avg;  a4=mean(a,1)';
a=v1.r48.mse.fa_w_sg_avg;  a5=mean(a,1)';
a=v1.r96.mse.fa_w_sg_avg;  a6=mean(a,1)';
a=v1.r192.mse.fa_w_sg_avg; a7=mean(a,1)';
fa_w_sg_avg=[a1 a2 a3 a4 a5 a6 a7]; 
a=v1.r03.mse.fa_w_sg_std;  a1=mean(a,1)';
a=v1.r06.mse.fa_w_sg_std;  a2=mean(a,1)';
a=v1.r12.mse.fa_w_sg_std;  a3=mean(a,1)';
a=v1.r24.mse.fa_w_sg_std;  a4=mean(a,1)';
a=v1.r48.mse.fa_w_sg_std;  a5=mean(a,1)';
a=v1.r96.mse.fa_w_sg_std;  a6=mean(a,1)';
a=v1.r192.mse.fa_w_sg_std; a7=mean(a,1)';
fa_w_sg_std=[a1 a2 a3 a4 a5 a6 a7]; 
a=v1.r03.mse.FA_w_sg_avg;  a1=mean(a,1)';
a=v1.r06.mse.FA_w_sg_avg;  a2=mean(a,1)';
a=v1.r12.mse.FA_w_sg_avg;  a3=mean(a,1)';
a=v1.r24.mse.FA_w_sg_avg;  a4=mean(a,1)';
a=v1.r48.mse.FA_w_sg_avg;  a5=mean(a,1)';
a=v1.r96.mse.FA_w_sg_avg;  a6=mean(a,1)';
a=v1.r192.mse.FA_w_sg_avg; a7=mean(a,1)';
FA_w_sg_avg=[a1 a2 a3 a4 a5 a6 a7]; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1600, 650]*1; row=1; col=2; fsize=20;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); vmin=0.05; vmax=1; yl='height z (km)'; 
vbin=[vmin:0.05:vmax]; vlab=[vmin+0.05:0.1:vmax];
[C,h]=contour(x,z,fa_w_sg_avg,vbin); hold on; axis(xy);
%shading flat; colorbar; caxis([0 1]); 
clabel(C,h,vlab,'Rotation',0);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
title('mean fractional area of updraft'); set(gca,'xDir','reverse');
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
subplot(row,col,2); lw=2; msize=8; yl='fractional area of updraft';
k=25; y1=fa_w_sg_avg(k,:); dy1=fa_w_sg_std(k,:);
k=33; y2=fa_w_sg_avg(k,:); dy2=fa_w_sg_std(k,:);
k=43; y3=fa_w_sg_avg(k,:); dy3=fa_w_sg_std(k,:);
errorbar(x,y1,dy1,'r-s','LineWidth',lw,'MarkerSize',msize);hold on;
errorbar(x,y2,dy2,'g-d','LineWidth',lw,'MarkerSize',msize);
errorbar(x,y3,dy3,'b-d','LineWidth',lw,'MarkerSize',msize);
legend('3km','5km','8km',2);
axis([0.9 7.1 0 1]);set(gca,'xDir','reverse');
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
%title('fractional area of updraft');
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);

subplot(row,col,2); lw=2; msize=8; yl='fractional area of updraft';
figure
k=25; y1=FA_w_sg_avg(k,:).*fa_w_sg_avg(k,:); 
k=33; y2=FA_w_sg_avg(k,:).*fa_w_sg_avg(k,:); 
k=43; y3=FA_w_sg_avg(k,:).*fa_w_sg_avg(k,:); 
plot(x,y1,'r-s','LineWidth',lw,'MarkerSize',msize);hold on;
plot(x,y2,'g-d','LineWidth',lw,'MarkerSize',msize);
plot(x,y3,'b-d','LineWidth',lw,'MarkerSize',msize);
legend('3km','5km','8km',2);
axis([0.9 7.1 0 1]);set(gca,'xDir','reverse');
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
%title('fractional area of updraft');
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);

visfig='off'; figpath='./fig_rce/'; expn=v1.expn;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='flx'; rho_s=v.rho.avg(25);
x=[1:7]; z=v.zf0/1000.; xlist={'3','6','12','24','48','96','192'};
a=v1.r03.mse.flx_edd_avg;  a1=mean(a,1)';
a=v1.r06.mse.flx_edd_avg;  a2=mean(a,1)';
a=v1.r12.mse.flx_edd_avg;  a3=mean(a,1)';
a=v1.r24.mse.flx_edd_avg;  a4=mean(a,1)';
a=v1.r48.mse.flx_edd_avg;  a5=mean(a,1)';
a=v1.r96.mse.flx_edd_avg;  a6=mean(a,1)';
a=v1.r192.mse.flx_edd_avg; a7=mean(a,1)';
mseflx_edd=[a1 a2 a3 a4 a5 a6 a7]/CPD/rho_s; 
a=v1.r03.mse.flx_tot_avg;  a1=mean(a,1)';
a=v1.r06.mse.flx_tot_avg;  a2=mean(a,1)';
a=v1.r12.mse.flx_tot_avg;  a3=mean(a,1)';
a=v1.r24.mse.flx_tot_avg;  a4=mean(a,1)';
a=v1.r48.mse.flx_tot_avg;  a5=mean(a,1)';
a=v1.r96.mse.flx_tot_avg;  a6=mean(a,1)';
a=v1.r192.mse.flx_tot_avg; a7=mean(a,1)';
mseflx_tot=[a1 a2 a3 a4 a5 a6 a7]/CPD/rho_s; 
a=v1.r03.mse.flx_grd_avg;  a1=mean(a,1)';
a=v1.r06.mse.flx_grd_avg;  a2=mean(a,1)';
a=v1.r12.mse.flx_grd_avg;  a3=mean(a,1)';
a=v1.r24.mse.flx_grd_avg;  a4=mean(a,1)';
a=v1.r48.mse.flx_grd_avg;  a5=mean(a,1)';
a=v1.r96.mse.flx_grd_avg;  a6=mean(a,1)';
a=v1.r192.mse.flx_grd_avg; a7=mean(a,1)';
mseflx_grd=[a1 a2 a3 a4 a5 a6 a7]/CPD/rho_s; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yl='z (km)'; xl='resolution (m)'; xy=[1 7 0 15]; co=[-2 2];
pms=[ 0, 0, 1600, 1300]*1; row=2; col=2;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); vmin=-2; vmax=2; vbin=[vmin:0.2:vmax]; vlab=vbin;
[C,h]=contourf(x,z,mseflx_edd,vbin); hold on;
shading flat; colorbar; caxis([vmin vmax]); axis(xy);
%clabel(C,h,vlab,'Rotation',0);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
title('eddy vertical MSE transport (K m/s)'); set(gca,'xDir','reverse');
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
subplot(row,col,2); vmin=-20; vmax=20; vbin=[vmin:1:vmax]; vlab=vbin;
[C,h]=contourf(x,z,mseflx_tot,vbin); hold on;
shading flat; colorbar; caxis([vmin vmax]); axis(xy);
%clabel(C,h,vlab,'Rotation',0);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
title('total vertical MSE transport (K m/s)'); set(gca,'xDir','reverse');
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
subplot(row,col,3); k=25; lw=2;
y1=mseflx_edd(k,:); y2=mseflx_grd(k,:); y3=mseflx_tot(k,:); 
semilogy(x,y1,'b-s','LineWidth',lw); hold on; 
semilogy(x,y2,'r-*','LineWidth',lw); %axis([1 7 0 3.5]);
semilogy(x,y3,'k-d','LineWidth',lw); legend('eddy','resolved','total',2);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
yl='vertical transport of MSE(K m/s)'; ylabel(yl,'FontSize',fsize);
xlabel(xl,'FontSize',fsize); set(gca,'xDir','reverse');
title('vertical level = 3km','FontSize',fsize);
set(gca,'FontSize',fsize);
subplot(row,col,4); k=25; lw=2;
y1=mseflx_edd(k,:); y2=mseflx_grd(k,:); y3=mseflx_tot(k,:); 
plot(x,y1./y3,'b-s','LineWidth',lw); hold on; 
plot(x,y2./y3,'r-*','LineWidth',lw); axis([1 7 0 1]);
legend('eddy','resolved',2);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
yl='ratio of individual component to total transport (K m/s)'; ylabel(yl,'FontSize',fsize);
xlabel(xl,'FontSize',fsize); set(gca,'xDir','reverse');
title('vertical level = 3km','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn=v1.expn 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot snapshot of vertical velocity and coarse grids%%%%%%
%k=25 (z=3013m); k=33 (z=4957m);
xi=16;yi=16;dx=3.0;dy=3.0;dd=xi*dx; t=1; k=25; y_e=128*dy;%key choice of the snapshot
xi=16;yi=16;dx=1.5;dy=1.5;dd=xi*dx; t=1; k=25; y_e=128*dy;%key choice of the snapshot
y_s=0; yt=[dd:dd:y_e]; yl='z (m)';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname=strcat('w','-snapshot');  var=wa;      var_th=0.5;
%vname=strcat('ql','-snapshot'); var=ql*1000; var_th=0.1;
id=(var>-var_th & var<var_th); var(id)=NaN; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 800, 1000]*1.5; row=4; col=1; fsize=14; co=[-2 2];
handle = figure('Position', pms,'visible','on');
ni=512; i1=0*ni+1; i2=1*ni+1; i3=2*ni+1; i4=3*ni+1; y=[1:v.ny]*dy; 
w1=squeeze(var(t,k,:,i1:i1+ni-1)); x1=[i1:i1+ni-1]*dx;
w2=squeeze(var(t,k,:,i2:i2+ni-1)); x2=[i2:i2+ni-1]*dx;
w3=squeeze(var(t,k,:,i3:i3+ni-1)); x3=[i3:i3+ni-1]*dx;
w4=squeeze(var(t,k,:,i4:i4+ni-1)); x4=[i4:i4+ni-1]*dx;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,1); x=x1; wn=w1; ibeg=i1; iend=i1+ni-1;
pcolor(x, y, wn); hold on; colorbar; shading flat;  caxis(co); title(vname);
x_s=(ibeg-1)*dx; x_e=iend*dx; axis([x_s x_e y_s y_e]);
for j=0/xi       :v.ny/yi; yy=j*yi*dx; plot([x_s x_e], [yy yy],'g--'); end
for i=(ibeg-1)/xi:iend/xi; xx=i*xi*dx; plot([xx xx], [y_s y_e],'g--'); end
xt=[0:5*dd:x_e]; set(gca,'xtick',xt,'ytick',yt,'FontSize',fsize); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);

subplot(row,col,2); x=x2; wn=w2; ibeg=i2; iend=i2+ni-1;
pcolor(x, y, wn); hold on; colorbar; shading flat;  caxis(co);
x_s=(ibeg-1)*dx; x_e=iend*dx; axis([x_s x_e y_s y_e]);
for j=0/xi       :v.ny/yi; yy=j*yi*dx; plot([x_s x_e], [yy yy],'g--'); end
for i=(ibeg-1)/xi:iend/xi; xx=i*xi*dx; plot([xx xx], [y_s y_e],'g--'); end
xt=[0:5*dd:x_e]; set(gca,'xtick',xt,'ytick',yt,'FontSize',fsize); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);

subplot(row,col,3); x=x3; wn=w3; ibeg=i3; iend=i3+ni-1;
pcolor(x, y, wn); hold on; colorbar; shading flat;  caxis(co);
x_s=(ibeg-1)*dx; x_e=iend*dx; axis([x_s x_e y_s y_e]);
for j=0/xi       :v.ny/yi; yy=j*yi*dx; plot([x_s x_e], [yy yy],'g--'); end
for i=(ibeg-1)/xi:iend/xi; xx=i*xi*dx; plot([xx xx], [y_s y_e],'g--'); end
xt=[0:5*dd:x_e]; set(gca,'xtick',xt,'ytick',yt,'FontSize',fsize); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);

subplot(row,col,4); x=x4; wn=w4; ibeg=i4; iend=i4+ni-1;
pcolor(x, y, wn); hold on; colorbar; shading flat;  caxis(co);
x_s=(ibeg-1)*dx; x_e=iend*dx; axis([x_s x_e y_s y_e]);
for j=0/xi       :v.ny/yi; yy=j*yi*dx; plot([x_s x_e], [yy yy],'g--'); end
for i=(ibeg-1)/xi:iend/xi; xx=i*xi*dx; plot([xx xx], [y_s y_e],'g--'); end
xt=[0:5*dd:x_e]; set(gca,'xtick',xt,'ytick',yt,'FontSize',fsize); 
xl='x (km)'; xlabel(xl,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/'; expn=v.expn;
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
