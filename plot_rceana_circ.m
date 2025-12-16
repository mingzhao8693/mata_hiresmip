cd /home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_am4
set tpath = '/archive/Ming.Zhao/ndrce/warsaw_201710/'
set res   = org_z
set ts    = 240
set te    = 365
set zs    = 1
set ze    = 64
set w_th  = 0.5
set qc_th = 0.00001;

matlab -r "rceana_circ('$tpath','RCE_H2048x128_L79_R01_295','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_circ('$tpath','RCE_H2048x128_L79_R01_300','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_circ('$tpath','RCE_H2048x128_L79_R01_305','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_circ('$tpath','RCE_H2048x128_L79_R03_295','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_circ('$tpath','RCE_H2048x128_L79_R03_300','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_circ('$tpath','RCE_H2048x128_L79_R03_305','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_circ('$tpath','RCE_H1024x064_L79_R06_295','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_circ('$tpath','RCE_H1024x064_L79_R06_300','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_circ('$tpath','RCE_H1024x064_L79_R06_305','$res',$ts,$te,$zs,$ze,0.5,$qc_th);exit"&
matlab -r "rceana_circ('$tpath','RCE_H0512x032_L79_R12_295','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"
matlab -r "rceana_circ('$tpath','RCE_H0512x032_L79_R12_300','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"
matlab -r "rceana_circ('$tpath','RCE_H0512x032_L79_R12_305','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"
matlab -r "rceana_circ('$tpath','RCE_H0256x016_L79_R24_295','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"
matlab -r "rceana_circ('$tpath','RCE_H0256x016_L79_R24_300','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"
matlab -r "rceana_circ('$tpath','RCE_H0256x016_L79_R24_305','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"
matlab -r "rceana_circ('$tpath','RCE_H0128x008_L79_R48_295','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"
matlab -r "rceana_circ('$tpath','RCE_H0128x008_L79_R48_300','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"
matlab -r "rceana_circ('$tpath','RCE_H0128x008_L79_R48_305','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"
matlab -r "rceana_circ('$tpath','RCE_H0128x008_L79_R48_conv_295','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"
matlab -r "rceana_circ('$tpath','RCE_H0128x008_L79_R48_conv_300','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"
matlab -r "rceana_circ('$tpath','RCE_H0128x008_L79_R48_conv_305','$res',$ts,$te,$zs,$ze,0.1,$qc_th);exit"


tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; 
zs=1; ze=64; qc_th=0.00001; res='org_z'; t1=240; t2=365;
expn='RCE_H0128x008_L79_R48_conv_300';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0128x008_L79_R48_conv_295';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0128x008_L79_R48_conv_305';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);

expn='RCE_H0128x008_L79_R48_300';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0128x008_L79_R48_295';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0128x008_L79_R48_305';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0256x016_L79_R24_300';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0256x016_L79_R24_295';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0256x016_L79_R24_305';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0512x032_L79_R12_300';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0512x032_L79_R12_295';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H0512x032_L79_R12_305';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.1,qc_th);
expn='RCE_H1024x064_L79_R06_300';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H1024x064_L79_R06_295';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H1024x064_L79_R06_305';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H2048x128_L79_R03_300';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H2048x128_L79_R03_295';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);
expn='RCE_H2048x128_L79_R03_305';v1=rceana_circ(tpath,expn,res,t1,t2,zs,ze,0.5,qc_th);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/work/miz/mat_rce/'; fext=strcat('_','rceana_circ_60_365.mat');
tpath='/work/miz/mat_rce/'; fext=strcat('_','rceana_circ_240_365.mat');
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

V0='m-'; V1='r-'; V2='g-'; V3='b-'; V4='c-'; V5='k-'; V6='k-'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 920, 520]*1.5; nx=64; ny=64; row=2; col=3;
handle = figure('Position', pms,'visible','on');
a=squeeze(v0.r(1).wqt3km.wbar(1,1:64,65:128)); lw=2;
subplot(row,col,1)
pcolor(a); shading flat; caxis([-4 4]); hold on; %colorbar; hold on;
n=1; [x,y] = meshgrid(0:1:nx, 0:1:ny);
plot(x,y,'k'); hold on; plot(y,x,'k'); hold on; axis([0 nx 0 ny]);
n=2; [x,y] = meshgrid(0:n:nx, 0:n:ny);
plot(x,y,'b','LineWidth',lw); hold on; plot(y,x,'g','LineWidth',lw);
subplot(row,col,2)
pcolor(a); shading flat; caxis([-4 4]); hold on; %colorbar; hold on;
n=1; [x,y] = meshgrid(0:1:nx, 0:1:ny);
plot(x,y,'k'); hold on; plot(y,x,'k'); hold on; axis([0 nx 0 ny]);
n=4; [x,y] = meshgrid(0:n:nx, 0:n:ny);
plot(x,y,'g','LineWidth',lw); hold on; plot(y,x,'g','LineWidth',lw);
subplot(row,col,3)
pcolor(a); shading flat; caxis([-4 4]); hold on; %colorbar; hold on;
n=1; [x,y] = meshgrid(0:1:nx, 0:1:ny);
plot(x,y,'k'); hold on; plot(y,x,'k'); hold on; axis([0 nx 0 ny]);
n=8; [x,y] = meshgrid(0:n:nx, 0:n:ny);
plot(x,y,'g','LineWidth',lw); hold on; plot(y,x,'g','LineWidth',lw);
subplot(row,col,4)
pcolor(a); shading flat; caxis([-4 4]); hold on;%colorbar; hold on;
n=1; [x,y] = meshgrid(0:1:nx, 0:1:ny);
plot(x,y,'k'); hold on; plot(y,x,'k'); hold on; axis([0 nx 0 ny]);
n=16; [x,y] = meshgrid(0:n:nx, 0:n:ny);
plot(x,y,'g','LineWidth',lw); hold on; plot(y,x,'g','LineWidth',lw);
subplot(row,col,5)
pcolor(a); shading flat; caxis([-4 4]); hold on; %colorbar; hold on;
n=1; [x,y] = meshgrid(0:1:nx, 0:1:ny);
plot(x,y,'k'); hold on; plot(y,x,'k'); axis([0 nx 0 ny]);box on;
n=32; [x,y] = meshgrid(0:n:nx, 0:n:ny);
plot(x,y,'g','LineWidth',lw); hold on; plot(y,x,'g','LineWidth',lw);
subplot(row,col,6)
pcolor(a); shading flat; caxis([-4 4]); hold on;%  colorbar; hold on;
n=1; [x,y] = meshgrid(0:1:nx, 0:1:ny);
plot(x,y,'k'); hold on; plot(y,x,'k');  axis([0 nx 0 ny]);
n=64; [x,y] = meshgrid(0:n:nx, 0:n:ny);
plot(x,y,'g','LineWidth',lw*4); hold on; plot(y,x,'g','LineWidth',lw*4);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ';
vname=strcat('grid'); printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fractional area of updraft dependence on subdomain size%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=[1:8]; xx0=x(1:8); xx1=(2:8); xx2=[3:8];
%varn='wmse500'; mytl='height = 5.8km';
%varn='wmse3km'; mytl='height = 3km';
varn='wqt3km'; mytl='height = 3km';
vx=v0; x=getflx(vx,8,varn); sigma0=x.fa_wup; sigsd0=x.fa_std;
vx=v1; x=getflx(vx,7,varn); sigma1=x.fa_wup; sigsd1=x.fa_std;
vx=v2; x=getflx(vx,6,varn); sigma2=x.fa_wup; sigsd2=x.fa_std;
vname='sigma_vs_d'; xy=[0.5 8.5 -0.1 1];
pms=[ 0, 0, 800, 650]*1; row=1; col=1; msize=8; fsize=14;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); x=[1:8]; yl='height z (km)'; lw=2;
errorbar(xx0,sigma0,sigsd0,'r-*','LineWidth',lw,'MarkerSize',msize);hold on;
errorbar(xx1,sigma1,sigsd1,'g-s','LineWidth',lw,'MarkerSize',msize);hold on;
errorbar(xx2,sigma2,sigsd2,'b-d','LineWidth',lw,'MarkerSize',msize);hold on;
axis(xy); legend('R1.5km','R03km','R06km',2);
xlist={'1.5','3','6','12','24','48','96','192'}; set(gca,'xDir','reverse');
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
yl='fractional area of updrafts (\sigma)'; ylabel(yl,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
title(mytl,'FontSize',fsize); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; expn='rce_circ';
vname=strcat(vname,'_',varn); printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%mass flux and partitions, dependence on subdomain size%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='wqt3km';  yl='mass flux at 3km (mm/day)';
vname=strcat('mfx_vs_d_',varn);  do_1km=1; do_3km=0;
if (do_1km==1)%BASED on 1.5km RUN
  nn=8; vx=v0; xlist={'1.5','3','6','12','24','48','96','192'};
elseif (do_3km==1);
  nn=7; vx=v1; xlist={'3','6','12','24','48','96','192'};
end
x0=getflx(vx,nn,varn); xx0=[1:nn]; expn=vx.expn;
xy1=[0.5 nn+0.5 -0.05 1.15]; xy2=[0.5 nn+0.5 0 1.];
%=========================================
pms=[ 0, 0, 800, 650]*1; row=1; col=1; msize=8; fsize=14;
handle = figure('Position', pms,'visible','on');
MK='Marker'; MS='MarkerSize'; LS='LineStyle'; LW='LineWidth';
mc=x0.mf_cup; me=x0.mf_env; a=x0.fa_wup; %pt=pc.*a+pe.*(1-a);
y1=mc.*a; y2=me.*(1-a); y3=y1+y2;
line(xx0,mc,'Color','r',LS,'--',MK,'^',MS,msize+2,LW,2);hold on;
line(xx0,me,'Color','b',LS,'--',MK,'s',MS,msize+2,LW,2); 
line(xx0,y1,'Color','r',LS,'-', MK,'^',MS,msize-2,LW,2);hold on;
line(xx0,y2,'Color','b',LS,'-', MK,'s',MS,msize-2,LW,2); 
line(xx0,y3,'Color','k',LS,'-', MK,'o',MS,msize-2,LW,2); 
set(gca,'xDir','reverse'); axis(xy1); 
legend('updrafts','environment','updrafts (area-weighted)',...
'environment (area-weighted)','updrafts+environment (area-weighted)',0);
set(gca,'xtick',xx0); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)';        xlabel(xl,'FontSize',fsize); 
yl='vertical mass flux at 3km (kg/m2/s)'; ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize);
ax1 = gca; %legend boxoff; 
ax2=axes('Position',get(ax1,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','m','YColor','m');
MK='Marker'; MS='MarkerSize'; LS='LineStyle'; LW='LineWidth';
line(xx0,a,'Color','m',LS,'-',MK,'^',MS,msize,LW,3); 
set(gca,'xDir','reverse'); axis(xy2); 
set(gca,'xtick',xx0); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
yl='fractional area of updrafts'; ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%mass flux NEW partitions, dependence on subdomain size%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='wqt3km';  yl='mass flux at 3km (mm/day)';
vname=strcat('mfx_new_vs_d_',varn);  do_1km=1; do_3km=0;
if (do_1km==1)%BASED on 1.5km RUN
  nn=8; vx=v0; xlist={'1.5','3','6','12','24','48','96','192'};
elseif (do_3km==1);
  nn=7; vx=v1; xlist={'3','6','12','24','48','96','192'};
end
x0=getflx(vx,nn,varn); xx0=[1:nn]; expn=vx.expn;
xy1=[0.5 nn+0.5 -0.05 1.15]; xy2=[0.5 nn+0.5 0 1];
%=========================================
pms=[ 0, 0, 800, 650]*1; row=1; col=1; msize=8; fsize=14;
handle = figure('Position', pms,'visible','on');
MK='Marker'; MS='MarkerSize'; LS='LineStyle'; LW='LineWidth';
mc=x0.mf_cup; me=x0.mf_env; a=x0.fa_wup; %pt=pc.*a+pe.*(1-a);
y1=a.*(1-a).*(mc-me); y3=a.*mc+(1-a).*me; y2=y3-y1;
line(xx0,mc,'Color','r',LS,'--',MK,'^',MS,msize+2,LW,2);hold on;
line(xx0,me,'Color','b',LS,'--',MK,'s',MS,msize+2,LW,2); 
line(xx0,y1,'Color','r',LS,'-', MK,'^',MS,msize-2,LW,2);hold on;
line(xx0,y2,'Color','b',LS,'-', MK,'s',MS,msize-2,LW,2); 
line(xx0,y3,'Color','k',LS,'-', MK,'o',MS,msize-2,LW,2); 
set(gca,'xDir','reverse'); axis(xy1); 
legend('updrafts','environment','updrafts (area-weighted)',...
'total minus updraft','total',2);
%legend('updraft eddy (area-weighted)','grid-scale (area-weighted)','total',0);
set(gca,'xtick',xx0); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)';        xlabel(xl,'FontSize',fsize); 
yl='vertical mass flux at 3km (kg/m2/s)'; ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
ax1 = gca; %legend boxoff; 
ax2=axes('Position',get(ax1,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','m','YColor','m');
MK='Marker'; MS='MarkerSize'; LS='LineStyle'; LW='LineWidth';
line(xx0,a,'Color','m',LS,'-',MK,'^',MS,msize,LW,3); 
set(gca,'xDir','reverse'); axis(xy2); 
set(gca,'xtick',xx0); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
yl='fractional area of updrafts'; ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%mass flux NEW partitions, dependence on subdomain size%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='wqt3km';  yl='mass flux at 3km (mm/day)';
vname=strcat('frac_mfx_new_vs_d_',varn);  do_1km=1; do_3km=0;
if (do_1km==1)%BASED on 1.5km RUN
  nn=8; vx=v0; xlist={'1.5','3','6','12','24','48','96','192'};
elseif (do_3km==1);
  nn=7; vx=v1; xlist={'3','6','12','24','48','96','192'};
end
x0=getflx(vx,nn,varn); xx0=[1:nn]; expn=vx.expn;
xy1=[0.5 nn+0.5 -0.05 1.15]; xy2=[0.5 nn+0.5 -1.25 2.5];
%=========================================
pms=[ 0, 0, 800, 650]*1; row=1; col=1; msize=8; fsize=14;
handle = figure('Position', pms,'visible','on');
MK='Marker'; MS='MarkerSize'; LS='LineStyle'; LW='LineWidth';
mc=x0.mf_cup; me=x0.mf_env; a=x0.fa_wup; %pt=pc.*a+pe.*(1-a);
y1=a.*(1-a).*(mc-me); y3=a.*mc+(1-a).*me; y2=y3-y1;
%line(xx0,mc,'Color','r',LS,'--',MK,'^',MS,msize+2,LW,2);hold on;
%line(xx0,me,'Color','b',LS,'--',MK,'s',MS,msize+2,LW,2); 
line(xx0,y1,'Color','r',LS,'-', MK,'^',MS,msize-2,LW,2);hold on;
line(xx0,y2,'Color','b',LS,'-', MK,'s',MS,msize-2,LW,2); 
line(xx0,y3,'Color','k',LS,'-', MK,'o',MS,msize-2,LW,2); 
set(gca,'xDir','reverse'); axis(xy1); 
legend('updraft eddy (area-weighted)','grid-scale (area-weighted)','total',0);
set(gca,'xtick',xx0); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)';        xlabel(xl,'FontSize',fsize); 
yl='vertical mass flux at 3km (kg/m2/s)'; ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
ax1 = gca; %legend boxoff; 
ax2=axes('Position',get(ax1,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','m','YColor','m');
MK='Marker'; MS='MarkerSize'; LS='LineStyle'; LW='LineWidth';
line(xx0,y1./y3,'Color','m',LS,'-',MK,'^',MS,msize,LW,3);hold on;
line(xx0,y2./y3,'Color','m',LS,'-',MK,'s',MS,msize,LW,3); 
set(gca,'xDir','reverse'); axis(xy2); 
set(gca,'xtick',xx0); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
yl='fraction of total mass flux'; ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Precip, partitions, and dependence on subdomain size%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='wqt3km';  yl='precipitation flux at 3km (mm/day)';
varn='wmse3km'; yl='surface precipitation flux (mm/day)';
vname=strcat('pcp_sfc_vs_d_',varn);  do_1km=1; do_3km=0;
if (do_1km==1)%BASED on 1.5km RUN
  nn=8; vx=v0; xlist={'1.5','3','6','12','24','48','96','192'};
elseif (do_3km==1);
  nn=7; vx=v1; xlist={'3','6','12','24','48','96','192'};
end
x0=getflx(vx,nn,varn); xx0=[1:nn]; expn=vx.expn;
xy1=[0.5 nn+0.5 0 350]; xy2=[0.5 nn+0.5 0 1];
%=========================================
pms=[ 0, 0, 800, 650]*1; row=1; col=1; msize=8; fsize=24;
handle = figure('Position', pms,'visible','on');
MK='Marker'; MS='MarkerSize'; LS='LineStyle'; LW='LineWidth';
pc=x0.pr_cup; pe=x0.pr_env; a=x0.fa_wup; pt=pc.*a+pe.*(1-a);
y1=pc.*a; y2=pe.*(1-a); y3=y1+y2;  y4=x0.pr_tot;
line(xx0,pc,'Color','r',LS,'--',MK,'^',MS,msize+2,LW,2);hold on;
line(xx0,pe,'Color','b',LS,'--',MK,'s',MS,msize+2,LW,2); 
line(xx0,y1,'Color','r',LS,'-', MK,'^',MS,msize-2,LW,2);hold on;
line(xx0,y2,'Color','b',LS,'-', MK,'s',MS,msize-2,LW,2); 
line(xx0,y3,'Color','k',LS,'-', MK,'o',MS,msize-2,LW,2); 
set(gca,'xDir','reverse'); axis(xy1); 
lgnd=legend('updrafts','environment','updrafts (area-weighted)',...
'environment (area-weighted)','updrafts+environment (area-weighted)',2);
set(lgnd,'FontSize',14);
set(gca,'xtick',xx0); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize); 
ax1 = gca; legend boxoff;
ax2=axes('Position',get(ax1,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','m','YColor','m');
z1=x0.pr_cup; z2=x0.pr_env;
MK='Marker'; MS='MarkerSize'; LS='LineStyle'; 
line(xx0,y1./y3,'Color','m',LS,'-',MK,'^',MS,msize,LW,3);hold on;
line(xx0,y2./y3,'Color','m',LS,'-',MK,'s',MS,msize,LW,3); 
set(gca,'xDir','reverse'); axis(xy2); 
set(gca,'xtick',xx0); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
yl='fraction of total precipitation'; ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Precip NEW partitions, and dependence on subdomain size%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='wqt3km';  yl='precipitation flux at 3km (mm/day)';
varn='wqt3km_a'; yl='precipitation flux at 3km (mm/day)';
%varn='wmse3km'; yl='surface precipitation flux (mm/day)';
vname=strcat('pcp_sfc_new_vs_d_',varn);  do_1km=1; do_3km=0;
if (do_1km==1)%BASED on 1.5km RUN
  nn=8; vx=v0; xlist={'1.5','3','6','12','24','48','96','192'};
elseif (do_3km==1);
  nn=7; vx=v1; xlist={'3','6','12','24','48','96','192'};
end
x0=getflx(vx,nn,varn); xx0=[1:nn]; expn=vx.expn;
xy1=[0.5 nn+0.5 0 350]; xy2=[0.5 nn+0.5 0 1];
%=========================================
pms=[ 0, 0, 800, 650]*1; row=1; col=1; msize=8; fsize=24;
handle = figure('Position', pms,'visible','on');
MK='Marker'; MS='MarkerSize'; LS='LineStyle'; LW='LineWidth';
pc=x0.pr_cup; pe=x0.pr_env; a=x0.fa_wup; pt=pc.*a+pe.*(1-a);
y1=a.*(1-a).*(pc-pe); y3=a.*pc+(1-a).*pe; y2=y3-y1;  y4=x0.pr_tot;
line(xx0,pc,'Color','r',LS,'--',MK,'^',MS,msize+2,LW,2);hold on;
line(xx0,pe,'Color','b',LS,'--',MK,'s',MS,msize+2,LW,2); 
line(xx0,y1,'Color','r',LS,'-', MK,'^',MS,msize-2,LW,2);hold on;
line(xx0,y2,'Color','b',LS,'-', MK,'s',MS,msize-2,LW,2); 
line(xx0,y3,'Color','k',LS,'-', MK,'o',MS,msize-2,LW,2); 
set(gca,'xDir','reverse'); axis(xy1); 
lgnd=legend('updrafts','environment','updrafts (area-weighted)',...
'total minus updrafts','total',2);
set(lgnd,'FontSize',14);
%legend('updrafts (area-weighted)','environment (area-weighted)',...
%       'updrafts+environment (area-weighted)',2);
set(gca,'xtick',xx0); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize); 
ax1 = gca; legend boxoff; 
ax2=axes('Position',get(ax1,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','m','YColor','m');
z1=x0.pr_cup; z2=x0.pr_env;
MK='Marker'; MS='MarkerSize'; LS='LineStyle'; 
line(xx0,y1./y3,'Color','m',LS,'-',MK,'^',MS,msize,LW,3);hold on;
line(xx0,y2./y3,'Color','m',LS,'-',MK,'s',MS,msize,LW,3); 
set(gca,'xDir','reverse'); axis(xy2); 
set(gca,'xtick',xx0); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
yl='fraction of total precipitation'; ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE precipitation efficiency dependence on subdomain size%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='wqt3km';  ymin=0; ymax=3000; yl='total water and precipitation flux at 3km (mm/day)';
vname=strcat('pcpwqt_pe_vs_d_',varn);  do_1km=1; do_3km=0;
if (do_1km==1)%BASED on 1.5km RUN
  nn=8; vx=v0; xlist={'1.5','3','6','12','24','48','96','192'};
elseif (do_3km==1);
  nn=7; vx=v1; xlist={'3','6','12','24','48','96','192'};
end
x0=getflx(vx,nn,varn); xx0=[1:nn]; expn=vx.expn;
xy1=[0.5 nn+0.5 0 1200]; xy2=[0.5 nn+0.5 0 1];
%=========================================
pms=[ 0, 0, 800, 650]*1; row=1; col=1; msize=8; fsize=24;
handle = figure('Position', pms,'visible','on');
MK='Marker'; MS='MarkerSize'; LS='LineStyle'; LW='LineWidth';
pc=x0.pr_cup; pe=x0.pr_env; a=x0.fa_wup; pt=pc.*a+pe.*(1-a); pt1=x0.pr_tot;
fc=x0.mfvx_cup; fc_edd=x0.fx_edd; fe=x0.fx_GRD; ft=x0.fx_TOT;
y1=a.*(1-a).*(pc-pe); y2=pt-y1;     y3=pt; y4=x0.pr_tot;
z1=x0.fx_edd;         z2=x0.fx_GRD; z3=z1+z2; z4=x0.fx_TOT;
semilogy(xx0,fc,'Color','r',LS,'-',  MK,'^',MS,msize,LW,2);hold on;
semilogy(xx0,ft,'Color','k',LS,'-',  MK,'^',MS,msize,LW,2);
semilogy(xx0,pc,'Color','r',LS,'--', MK,'v',MS,msize,LW,2);
semilogy(xx0,pt,'Color','k',LS,'--', MK,'v',MS,msize,LW,2);
set(gca,'xDir','reverse'); axis(xy1); 
lgnd=legend('wq (updrafts)','wq (total)','precip (updrafts)','precip (total)',4);
set(lgnd,'FontSize',14);
set(gca,'xtick',xx0); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize); 
ax1 = gca; legend boxoff;
ax2=axes('Position',get(ax1,'Position'),...
            'XAxisLocation','top',...
            'YAxisLocation','right',...
            'Color','none',...
            'XColor','m','YColor','m');
MK='Marker'; MS='MarkerSize'; LS='LineStyle'; LW='LineWidth';
line(xx0,pc./fc,'Color','m',LS,'-',MK,'v',MS,msize,LW,3); 
line(xx0,pt./ft,'Color','m',LS,'-',MK,'o',MS,msize,LW,3); 
set(gca,'xDir','reverse'); axis(xy2); 
set(gca,'xtick',xx0); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
yl='precipitation efficiency'; ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%transport, partitions, and dependence on subdomain size%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%varn='wqt500';  ymin=0; ymax=3000; yl='precipitation & total water flux at 3km (mm/day)';
varn='wqt3km';  ymin=0; ymax=3000; yl='precipitation & total water flux at 3km (mm/day)';
vname=strcat('pcpwqt_vs_d_',varn);  do_1km=1; do_3km=0;
if (do_1km==1)%BASED on 1.5km RUN
  nn=8; vx=v0; xlist={'1.5','3','6','12','24','48','96','192'};
elseif (do_3km==1);
  nn=7; vx=v1; xlist={'3','6','12','24','48','96','192'};
end
x0=getflx(vx,nn,varn); xx0=[1:nn]; expn=vx.expn;
xy1=[0.5 nn+0.5 0 1200]; xy2=[0.5 nn+0.5 0 1.4];
%=========================================
pms=[ 0, 0, 800, 650]*1; row=1; col=1; msize=8; fsize=24;
handle = figure('Position', pms,'visible','on');
MK='Marker'; MS='MarkerSize'; LS='LineStyle'; 
pc=x0.pr_cup; pe=x0.pr_env; a=x0.fa_wup; pt=pc.*a+pe.*(1-a);
y1=a.*(1-a).*(pc-pe); y2=pt-y1;     y3=pt; y4=x0.pr_tot;
z1=x0.fx_edd;         z2=x0.fx_GRD; z3=z1+z2; z4=x0.fx_TOT;
semilogy(xx0,y1,'Color','r',LS,'-', MK,'^',MS,msize,LW,3);hold on;
semilogy(xx0,y2,'Color','b',LS,'-', MK,'s',MS,msize,LW,3); 
semilogy(xx0,y3,'Color','k',LS,'-', MK,'o',MS,msize,LW,3); 
semilogy(xx0,z1,'Color','r',LS,'--',MK,'^',MS,msize,LW,2);hold on;
semilogy(xx0,z2,'Color','b',LS,'--',MK,'s',MS,msize,LW,2); 
semilogy(xx0,z3,'Color','k',LS,'--',MK,'o',MS,msize,LW,2); 
set(gca,'xDir','reverse'); axis(xy1); 
lgnd=legend('precip (updraft eddy)', 'precip (grid-scale)','precip (total)',...
       'wq (updraft eddy)','wq (grid-scale)','wq (total)',2);
set(lgnd,'FontSize',14);
set(gca,'xtick',xx0); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize); 
ax1 = gca; legend boxoff;
ax2=axes('Position',get(ax1,'Position'),...
            'XAxisLocation','top',...
            'YAxisLocation','right',...
            'Color','none',...
            'XColor','m','YColor','m');
MK='Marker'; MS='MarkerSize'; LS='LineStyle'; LW='LineWidth';
line(xx0,y1./z1,'Color','m',LS,'--',MK,'^',MS,msize,LW,3); 
line(xx0,y2./z2,'Color','m',LS,'--',MK,'s',MS,msize,LW,3); 
line(xx0,y3./z3,'Color','m',LS,'--',MK,'o',MS,msize,LW,3);hold on;
set(gca,'xDir','reverse'); axis(xy2); 
set(gca,'xtick',xx0); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
yl='precipitation efficiency'; ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='wqt3km';  ymin=0; ymax=3000; yl='precipitation & total water flux at 3km (mm/day)';
vname=strcat('pcpwqt_vs_d_',varn);  do_1km=1; do_3km=0;
if (do_1km==1)%BASED on 1.5km RUN
  nn=8; vx=v0; xlist={'1.5','3','6','12','24','48','96','192'};
elseif (do_3km==1);
  nn=7; vx=v1; xlist={'3','6','12','24','48','96','192'};
end
x0=getflx(vx,nn,varn); xx0=[1:nn]; expn=vx.expn;
xy1=[0.5 nn+0.5 0 1]; xy2=[0.5 nn+0.5 0 1];
%=========================================
pms=[ 0, 0, 800, 650]*1; row=1; col=1; msize=8; fsize=24;
handle = figure('Position', pms,'visible','on');
MK='Marker'; MS='MarkerSize'; LS='LineStyle'; 
pc=x0.pr_cup; pe=x0.pr_env; a=x0.fa_wup; pt=pc.*a+pe.*(1-a);
y1=a.*(1-a).*(pc-pe); y2=pt-y1;     y3=pt; y4=x0.pr_tot;
z1=x0.fx_edd;         z2=x0.fx_GRD; z3=z1+z2; z4=x0.fx_TOT;
line(xx0,y1./y3,'Color','r',LS,'-', MK,'^',MS,msize,LW,3);hold on;
line(xx0,y2./y3,'Color','b',LS,'-', MK,'s',MS,msize,LW,3); 
line(xx0,z1./z3,'Color','r',LS,'--',MK,'^',MS,msize,LW,2);hold on;
line(xx0,z2./z3,'Color','b',LS,'--',MK,'s',MS,msize,LW,2); 
set(gca,'xDir','reverse'); axis(xy1); 
legend('precip (updraft eddy)', 'precip (grid-scale)',...
       'wq (updraft eddy)','wq (grid-scale)',0);
legend boxoff;
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize); 
% $$$ ax1 = gca;
% $$$ ax2=axes('Position',get(ax1,'Position'),...
% $$$            'XAxisLocation','top',...
% $$$            'YAxisLocation','right',...
% $$$            'Color','none',...
% $$$            'XColor','b','YColor','b');
% $$$ MK='Marker'; MS='MarkerSize'; LS='LineStyle'; 
% $$$ line(xx0,y1./z3,'Color','b',LS,'--',MK,'^',MS,msize,LW,4);hold on;
% $$$ line(xx0,z1./z3,'Color','b',LS,'--',MK,'o',MS,msize,LW,4); 
% $$$ set(gca,'xDir','reverse'); axis(xy2); 
% $$$ set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
% $$$ xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
% $$$ ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; printit(visfig,figpath,expn,vname);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%varn='wmse500'; yl='vertical transpoort of MSE at 5.8km';
%varn='wmse3km'; c=1; ymin=0; ymax=5000; yl='vertical transport of MSE at 3km (W/m2)';
varn='wqt3km';c=1; ymin=0; ymax=130; yl='vertical transport of total water at 3km (mm/day)';
%varn='wqt2km';c=1; ymin=0; ymax=130; yl='vertical transport of total water at 2km (mm/day)'; 
vname=strcat('flx_vs_d_',varn);  do_1km=1; do_3km=0;
if (do_1km==1)%BASED on 1.5km RUN
  nn=8; vx=v0; xlist={'1.5','3','6','12','24','48','96','192'};
elseif (do_3km==1);
  nn=7; vx=v1; xlist={'3','6','12','24','48','96','192'};
end
x0=getflx(vx,nn,varn); xx0=[1:nn]; xy=[0.5 nn+0.5 ymin ymax]; expn=vx.expn;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 800, 650]*0.8; row=1; col=1; msize=8; fsize=24;
handle = figure('Position', pms,'visible','on');
LW='LineWidth'; d1=2; d2=3; ms='MarkerSize'; x=[1:8];
%plot(xx0,x0.fx_tot *c,'k-+', LW,d1,ms,msize);hold on;
%plot(xx0,x0.fx_grd *c,'k-v', LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_TOT *c,'k-p', LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_GRD *c,'k-o', LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_edd *c,'k-d',LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_ed1 *c,'r--*',LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_ed2 *c,'b--s',LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_ed1a*c,'m--*',LW,d2,ms,msize);hold on;
plot(xx0,x0.fx_ed2a*c,'c--s',LW,d2,ms,msize);hold on;
axis(xy); set(gca,'xDir','reverse');
legend('total','grid-scale','eddy','unified','conventional',...
       'unified-err','conventional-err',2); legend boxoff;
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%varn='wmse500'; yl='vertical transpoort of MSE at 5.8km';
%varn='wmse3km'; yl='fraction of total transport of MSE at 3km';
%varn='wqt500'; yl='vertical transport of total water at 5.8km';
varn='wqt3km'; yl='vertical transport of total water at 3km';
%varn='wqt2km'; yl='vertical transport of total water at 2km';
vname=strcat('flx_ratio_vs_d_',varn);
if (do_1km==1)%BASED on 1.5km RUN
  nn=8; vx=v0; xlist={'1.5','3','6','12','24','48','96','192'};
elseif (do_3km==1);
  nn=7; vx=v1; xlist={'3','6','12','24','48','96','192'};
end
x0=getflx(vx,nn,varn); xx0=[1:nn]; xy=[0.5 nn+0.5 0 1]; expn=vx.expn;
%==========================================
pms=[ 0, 0, 800, 650]*0.8; row=1; col=1; msize=8; fsize=20;
handle = figure('Position', pms,'visible','on');
LW='LineWidth'; d1=2; d2=3; ms='MarkerSize'; x=[1:8]; c=x0.fx_TOT;
plot(xx0,x0.fx_GRD ./c,'k-o', LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_edd ./c,'k-d',LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_ed1 ./c,'r--*',LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_ed2 ./c,'b--s',LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_ed1a./c,'m--*',LW,d2,ms,msize);hold on;
plot(xx0,x0.fx_ed2a./c,'c--s',LW,d2,ms,msize);hold on;
axis(xy); set(gca,'xDir','reverse');
legend('grid-scale','eddy','unified','conventional',...
       'unified-err','conventional-err',0); legend boxoff;
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%varn='wmse500'; yl='vertical transpoort of MSE at 5.8km';
%varn='wmse3km'; yl='fraction of total transport of MSE at 3km';
varn='wqt3km'; yl='vertical transport of total water at 3km';
%varn='whli3km';yl='vertical transport of liquid water static energy at 3km';
vname=strcat('flx_ratio_vs_d_',varn);
if (do_1km==1)%BASED on 1.5km RUN
  nn=8; vx=v0; xlist={'1.5','3','6','12','24','48','96','192'};
elseif (do_3km==1);
  nn=7; vx=v1; xlist={'3','6','12','24','48','96','192'};
end
x0=getflx(vx,nn,varn); xx0=[1:nn]; xy=[0.5 nn+0.5 0 1]; expn=vx.expn;
%==========================================
pms=[ 0, 0, 800, 650]*1; row=1; col=1; msize=8; fsize=20;
handle = figure('Position', pms,'visible','on');
LW='LineWidth'; d1=2; d2=3; ms='MarkerSize'; x=[1:8]; c=x0.fx_TOT;
plot(xx0,x0.fx_GRD ./c,'k-o', LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_edd ./c,'k-d',LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_ed1 ./c,'r--*',LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_ed2 ./c,'b--s',LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_ed1a./c,'m--*',LW,d2,ms,msize);hold on;
plot(xx0,x0.fx_ed2a./c,'c--s',LW,d2,ms,msize);hold on;
axis(xy); set(gca,'xDir','reverse');
legend('grid-scale','eddy','unified','traditional',...
       'unified-err','traditional-err',0);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%varn='wmse500'; yl='vertical transpoort of MSE at 5.8km';
%varn='wmse3km'; yl='fraction of total transport of MSE at 3km';
varn='wqt3km'; yl='vertical transport of total water at 3km';
varn='wqt2km'; yl='vertical transport of total water at 2km';
%varn='whli3km';yl='vertical transport of liquid water static energy at 3km';
vname=strcat('flx_ratio_vs_d_',varn);
if (do_1km==1)%BASED on 1.5km RUN
  nn=8; vx=v0; xlist={'1.5','3','6','12','24','48','96','192'};
elseif (do_3km==1);
  nn=7; vx=v1; xlist={'3','6','12','24','48','96','192'};
end
x0=getflx(vx,nn,varn); xx0=[1:nn]; xy=[0.5 nn+0.5 0 1]; expn=vx.expn;
%==========================================
pms=[ 0, 0, 800, 650]*1; row=1; col=1; msize=8; fsize=20;
handle = figure('Position', pms,'visible','on');
LW='LineWidth'; d1=2; d2=3; ms='MarkerSize'; x=[1:8]; c=x0.fx_TOT;
plot(xx0,x0.fx_GRD ./c,'k-o', LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_edd ./c,'k-d',LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_ed1 ./c,'r--*',LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_ed2 ./c,'b--s',LW,d1,ms,msize);hold on;
plot(xx0,x0.fx_ed1a./c,'m--*',LW,d2,ms,msize);hold on;
plot(xx0,x0.fx_ed2a./c,'c--s',LW,d2,ms,msize);hold on;
axis(xy); set(gca,'xDir','reverse');
legend('grid-scale','eddy','unified','traditional',...
       'unified-err','traditional-err',0);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
xl='subdomain size d (km)'; xlabel(xl,'FontSize',fsize); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2D distribution of the ratio of eddy to total flux of MSE...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%varn='wqt500';  myt='ratio of eddy to total flux of total water at z=5.8km';
varn='wqt3km';  myt='ratio of eddy to total flux of total water at z=3km';
%varn='wqt2km';  myt='ratio of eddy to total flux of total water at z=2km';
%varn='wmse3km'; myt='ratio of eddy to total flux of MSE at z=3km';
vname=strcat('rat2d_',varn); do_1km=1; %do_3km=1;
if (do_1km==1)%BASED on 1.5km RUN
  nn=8; vx=v0; xlist={'1.5','3','6','12','24','48','96','192'};
elseif (do_3km==1);
  nn=7; vx=v1; xlist={'3','6','12','24','48','96','192'};
end
x=getfx_sig(vx,nn,varn); xx=[1:1:nn+1]; xc=xx+0.5; expn=vx.expn;
binc=x.binc; sbin=x.sbin; y=sbin; yc=binc;
A=(x.flx_edd'./x.flx_tot')*100; B=A; 
B(end+1,:)=B(end,:); B(:,end+1)=B(:,end); 
%====================================
pms=[ 0, 0, 800, 650]*0.8; row=1; col=1; fsize=24;
handle = figure('Position', pms,'visible','on');
pcolor(xx,y,B); colormap summer;
for j=1:10
  for i=1:nn
    str= num2str(A(j,i),2);
    if ~strcmp(str,'NaN')
      text(xc(i)+0.1,yc(j),str,'FontSize',fsize);
    end
  end
end
xl='subdomain size (km)'; xlabel(xl,'FontSize',fsize); 
yl='fractional area of updrafts'; ylabel(yl,'FontSize',fsize); 
set(gca,'xDir','reverse'); title(myt,'FontSize',fsize);
set(gca,'xtick',xc); set(gca,'xticklabel',xlist,'FontSize',fsize);
set(gca,'FontSize',fsize); visfig='off'; figpath='./fig_rce/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w500_pdf_org'; xy=[-5 15 1E-8 2E1]; %xy=[-3 12 1E-6 10];
a=v0.w500_org.all; binc=a.binc; bins=a.bins; 
a.v0=v0.w500_org.all.pdf./bins; a.v1=v1.w500_org.all.pdf./bins; 
a.v2=v2.w500_org.all.pdf./bins; a.v3=v3.w500_org.all.pdf./bins; 
a.v4=v4.w500_org.all.pdf./bins; a.v5=v5.w500_org.all.pdf./bins; 
a.v6=v6.w500_org.all.pdf./bins; 
pms=[ 0, 0, 1200, 800]*0.7; fsize=24; LW=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=3;
semilogy(binc,a.v0,V0,LW,d1); hold on; 
semilogy(binc,a.v1,V1,LW,d1); semilogy(binc,a.v2,V2,LW,d1);
semilogy(binc,a.v3,V3,LW,d1); semilogy(binc,a.v4,V4,LW,d1);
semilogy(binc,a.v5,V5,LW,d1); semilogy(binc,a.v6,V6,LW,d2);
legend('R1.5','R03','R06','R12','R24','R48','R48C',1); 
xl='vertical velocity at ~500hPa (m/s)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (m/s)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w500_pdf_r48_5day'; xy=[-120 120 0 0.016];
a=v0.w500_r48_5day.all; binc=a.binc; bins=a.bins; 
a.v0=v0.w500_r48_5day.all.pdf./bins; a.v1=v1.w500_r48_5day.all.pdf./bins; 
a.v2=v2.w500_r48_5day.all.pdf./bins; a.v3=v3.w500_r48_5day.all.pdf./bins; 
a.v4=v4.w500_r48_5day.all.pdf./bins; a.v5=v5.w500_r48_5day.all.pdf./bins; 
a.v6=v6.w500_r48_5day.all.pdf./bins; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=3;
plot(binc,a.v0,V0,LW,d1); hold on; 
plot(binc,a.v1,V1,LW,d1); plot(binc,a.v2,V2,LW,d1);
plot(binc,a.v3,V3,LW,d1); plot(binc,a.v4,V4,LW,d1);
plot(binc,a.v5,V5,LW,d1); plot(binc,a.v6,V6,LW,d2);
legend('R1.5','R03','R06','R12','R24','R48','R48C',1); 
xl='large-scale vertical velocity at ~500hPa (hPa/day)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (hPa/day)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w500_pdf_R96_5day'; xy=[-120 120 0 0.016];
a=v0.w500_r96_5day.all; binc=a.binc; bins=a.bins; 
a.v0=v0.w500_r96_5day.all.pdf./bins; a.v1=v1.w500_r96_5day.all.pdf./bins; 
a.v2=v2.w500_r96_5day.all.pdf./bins; a.v3=v3.w500_r96_5day.all.pdf./bins; 
a.v4=v4.w500_r96_5day.all.pdf./bins; a.v5=v5.w500_r96_5day.all.pdf./bins; 
a.v6=v6.w500_r96_5day.all.pdf./bins; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=3;
plot(binc,a.v0,V0,LW,d1); hold on; 
plot(binc,a.v1,V1,LW,d1); plot(binc,a.v2,V2,LW,d1);
plot(binc,a.v3,V3,LW,d1); plot(binc,a.v4,V4,LW,d1);
plot(binc,a.v5,V5,LW,d1); plot(binc,a.v6,V6,LW,d2);
legend('R1.5','R03','R06','R12','R24','R48','R48C',1); 
xl='large-scale vertical velocity at ~500hPa (hPa/day)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (hPa/day)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_pdf_org'; xy=[3 10000 1E-8 2E-2];
a=v0.w500_org.all.pcp_stat; binc=a.binc; bins=a.bins; 
a.v0=v0.w500_org.all.pcp_stat.pdf./bins; a.v1=v1.w500_org.all.pcp_stat.pdf./bins; 
a.v2=v2.w500_org.all.pcp_stat.pdf./bins; a.v3=v3.w500_org.all.pcp_stat.pdf./bins; 
a.v4=v4.w500_org.all.pcp_stat.pdf./bins; a.v5=v5.w500_org.all.pcp_stat.pdf./bins; 
a.v6=v6.w500_org.all.pcp_stat.pdf./bins; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=3;
loglog(binc,a.v0,V0,LW,d1); hold on; 
loglog(binc,a.v1,V1,LW,d1); loglog(binc,a.v2,V2,LW,d1);
loglog(binc,a.v3,V3,LW,d1); loglog(binc,a.v4,V4,LW,d1);
loglog(binc,a.v5,V5,LW,d1); loglog(binc,a.v6,V6,LW,d2);
legend('R1.5','R03','R06','R12','R24','R48','R48C',1); 
xl='surface precipitation (mm/day)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (mm/day)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_pdf_r48'; xy=[3 10000 1E-8 2E-2];
a=v0.w500_org.all.pcp_stat; binc=a.binc; bins=a.bins; 
a.v0=v0.w500_r48_ins.all.pcp_stat.pdf./bins; a.v1=v1.w500_r48_ins.all.pcp_stat.pdf./bins; 
a.v2=v2.w500_r48_ins.all.pcp_stat.pdf./bins; a.v3=v3.w500_r48_ins.all.pcp_stat.pdf./bins; 
a.v4=v4.w500_r48_ins.all.pcp_stat.pdf./bins; a.v5=v5.w500_r48_ins.all.pcp_stat.pdf./bins; 
a.v6=v6.w500_r48_ins.all.pcp_stat.pdf./bins; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=3;
loglog(binc,a.v0,V0,LW,d1); hold on; 
loglog(binc,a.v1,V1,LW,d1); loglog(binc,a.v2,V2,LW,d1);
loglog(binc,a.v3,V3,LW,d1); loglog(binc,a.v4,V4,LW,d1);
loglog(binc,a.v5,V5,LW,d1); loglog(binc,a.v6,V6,LW,d2);
legend('R1.5','R03','R06','R12','R24','R48','R48C',1); 
xl='surface precipitation (mm/day)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (mm/day)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_pdf_r96'; xy=[3 1000 1E-7 2E-2];
a=v0.w500_r96_ins.all.pcp_stat; binc=a.binc; bins=a.bins; 
a.v0=v0.w500_r96_ins.all.pcp_stat.pdf./bins; a.v1=v1.w500_r96_ins.all.pcp_stat.pdf./bins; 
a.v2=v2.w500_r96_ins.all.pcp_stat.pdf./bins; a.v3=v3.w500_r96_ins.all.pcp_stat.pdf./bins; 
a.v4=v4.w500_r96_ins.all.pcp_stat.pdf./bins; a.v5=v5.w500_r96_ins.all.pcp_stat.pdf./bins; 
a.v6=v6.w500_r96_ins.all.pcp_stat.pdf./bins; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=3;
loglog(binc,a.v0,V0,LW,d1); hold on; 
loglog(binc,a.v1,V1,LW,d1); loglog(binc,a.v2,V2,LW,d1);
loglog(binc,a.v3,V3,LW,d1); loglog(binc,a.v4,V4,LW,d1);
loglog(binc,a.v5,V5,LW,d1); loglog(binc,a.v6,V6,LW,d2);
legend('R1.5','R03','R06','R12','R24','R48','R48C',1); 
xl='surface precipitation (mm/day)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (mm/day)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_pdf_org_sst';  xy=[3 10000 1E-8 2E-2];
a=v0.w500_org.all.pcp_stat; binc=a.binc; bins=a.bins; 
a.v0=v0.w500_org.all.pcp_stat.pdf./bins; 
a.w0=w0.w500_org.all.pcp_stat.pdf./bins; a.c0=c0.w500_org.all.pcp_stat.pdf./bins; 
a.v1=v1.w500_org.all.pcp_stat.pdf./bins; 
a.w1=w1.w500_org.all.pcp_stat.pdf./bins; a.c1=c1.w500_org.all.pcp_stat.pdf./bins; 
a.v5=v5.w500_org.all.pcp_stat.pdf./bins; 
a.w5=w5.w500_org.all.pcp_stat.pdf./bins; a.c5=c5.w500_org.all.pcp_stat.pdf./bins; 
a.v6=v6.w500_org.all.pcp_stat.pdf./bins; 
a.w6=w6.w500_org.all.pcp_stat.pdf./bins; a.c6=c6.w500_org.all.pcp_stat.pdf./bins; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=4;
loglog(binc,a.c0,'b-', LW,d1); hold on; loglog(binc,a.c1,'b--',LW,d1); 
loglog(binc,a.c5,'b:', LW,d1); hold on; loglog(binc,a.c6,'b:', LW,d2);
loglog(binc,a.v0,'k-', LW,d1); hold on; loglog(binc,a.v1,'k--',LW,d1);
loglog(binc,a.v5,'k:', LW,d1); hold on; loglog(binc,a.v6,'k:', LW,d2);
loglog(binc,a.w0,'r-', LW,d1); hold on; loglog(binc,a.w1,'r--',LW,d1);
loglog(binc,a.w5,'r:', LW,d1); hold on; loglog(binc,a.w6,'r:', LW,d2);
legend('R1.5','R03','R48','R48C',1); 
xl='surface precipitation (mm/day)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (mm/day)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qi_pdf_org_sst'; c=1000;  xy=[0 4 1E-6 1E1];
a=v0.cld.qi_stat; bins=a.bins*c; binc=a.binc*c;
a.v0=v0.cld.qi_stat.pdf./bins; a.c0=c0.cld.qi_stat.pdf./bins; a.w0=w0.cld.qi_stat.pdf./bins;
a.v1=v1.cld.qi_stat.pdf./bins; a.c1=c1.cld.qi_stat.pdf./bins; a.w1=w1.cld.qi_stat.pdf./bins;
a.v2=v2.cld.qi_stat.pdf./bins; a.c2=c2.cld.qi_stat.pdf./bins; a.w2=w2.cld.qi_stat.pdf./bins;
a.v3=v3.cld.qi_stat.pdf./bins; a.c3=c3.cld.qi_stat.pdf./bins; a.w3=w3.cld.qi_stat.pdf./bins;
a.v4=v4.cld.qi_stat.pdf./bins; a.c4=c4.cld.qi_stat.pdf./bins; a.w4=w4.cld.qi_stat.pdf./bins;
a.v5=v5.cld.qi_stat.pdf./bins; a.c5=c5.cld.qi_stat.pdf./bins; a.w5=w5.cld.qi_stat.pdf./bins;
a.v6=v6.cld.qi_stat.pdf./bins; a.c6=c6.cld.qi_stat.pdf./bins; a.w6=w6.cld.qi_stat.pdf./bins;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=4;
semilogy(binc,a.c0,'b-', LW,d1); hold on; semilogy(binc,a.c1,'b--',LW,d1); 
semilogy(binc,a.c5,'b:', LW,d1); semilogy(binc,a.c6,'b:', LW,d2); 
semilogy(binc,a.v0,'k-', LW,d1); semilogy(binc,a.v1,'k--',LW,d1); 
semilogy(binc,a.v5,'k:', LW,d1); semilogy(binc,a.v6,'k:', LW,d2); 
semilogy(binc,a.w0,'r-', LW,d1); semilogy(binc,a.w1,'r--',LW,d1); 
semilogy(binc,a.w5,'r:', LW,d1); semilogy(binc,a.w6,'r:', LW,d2);
legend('R1.5','R03','R48','R48C',1); 
xl='cloud ice water (g/kg)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (mm/day)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ql_pdf_org_sst'; c=1000;  xy=[0 1.5 1E-6 1E1];
a=v0.cld.ql_stat; bins=a.bins*c; binc=a.binc*c;
a.v0=v0.cld.ql_stat.pdf./bins; a.c0=c0.cld.ql_stat.pdf./bins; a.w0=w0.cld.ql_stat.pdf./bins;
a.v1=v1.cld.ql_stat.pdf./bins; a.c1=c1.cld.ql_stat.pdf./bins; a.w1=w1.cld.ql_stat.pdf./bins;
a.v2=v2.cld.ql_stat.pdf./bins; a.c2=c2.cld.ql_stat.pdf./bins; a.w2=w2.cld.ql_stat.pdf./bins;
a.v3=v3.cld.ql_stat.pdf./bins; a.c3=c3.cld.ql_stat.pdf./bins; a.w3=w3.cld.ql_stat.pdf./bins;
a.v4=v4.cld.ql_stat.pdf./bins; a.c4=c4.cld.ql_stat.pdf./bins; a.w4=w4.cld.ql_stat.pdf./bins;
a.v5=v5.cld.ql_stat.pdf./bins; a.c5=c5.cld.ql_stat.pdf./bins; a.w5=w5.cld.ql_stat.pdf./bins;
a.v6=v6.cld.ql_stat.pdf./bins; a.c6=c6.cld.ql_stat.pdf./bins; a.w6=w6.cld.ql_stat.pdf./bins;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=4;
semilogy(binc,a.c0,'b-', LW,d1); hold on; semilogy(binc,a.c1,'b--',LW,d1); 
semilogy(binc,a.c5,'b:', LW,d1); semilogy(binc,a.c6,'b:', LW,d2); 
semilogy(binc,a.v0,'k-', LW,d1); semilogy(binc,a.v1,'k--',LW,d1); 
semilogy(binc,a.v5,'k:', LW,d1); semilogy(binc,a.v6,'k:', LW,d2); 
semilogy(binc,a.w0,'r-', LW,d1); semilogy(binc,a.w1,'r--',LW,d1); 
semilogy(binc,a.w5,'r:', LW,d1); semilogy(binc,a.w6,'r:', LW,d2);
legend('R1.5','R03','R48','R48C',1); 
xl='cloud liquid water (g/kg)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (mm/day)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh1_pdf_org_sst'; c=1;  xy=[0 110 1E-8 1E0];
a=v0.cld.rh1_stat; bins=a.bins*c; binc=a.binc*c;
a.v0=v0.cld.rh1_stat.pdf./bins; a.c0=c0.cld.rh1_stat.pdf./bins; a.w0=w0.cld.rh1_stat.pdf./bins;
a.v1=v1.cld.rh1_stat.pdf./bins; a.c1=c1.cld.rh1_stat.pdf./bins; a.w1=w1.cld.rh1_stat.pdf./bins;
a.v2=v2.cld.rh1_stat.pdf./bins; a.c2=c2.cld.rh1_stat.pdf./bins; a.w2=w2.cld.rh1_stat.pdf./bins;
a.v3=v3.cld.rh1_stat.pdf./bins; a.c3=c3.cld.rh1_stat.pdf./bins; a.w3=w3.cld.rh1_stat.pdf./bins;
a.v4=v4.cld.rh1_stat.pdf./bins; a.c4=c4.cld.rh1_stat.pdf./bins; a.w4=w4.cld.rh1_stat.pdf./bins;
a.v5=v5.cld.rh1_stat.pdf./bins; a.c5=c5.cld.rh1_stat.pdf./bins; a.w5=w5.cld.rh1_stat.pdf./bins;
a.v6=v6.cld.rh1_stat.pdf./bins; a.c6=c6.cld.rh1_stat.pdf./bins; a.w6=w6.cld.rh1_stat.pdf./bins;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.7; fsize=24; LW=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=4;
semilogy(binc,a.c0,'b-', LW,d1); hold on; semilogy(binc,a.c1,'b--',LW,d1); 
semilogy(binc,a.c5,'b:', LW,d1); semilogy(binc,a.c6,'b:', LW,d2); 
semilogy(binc,a.v0,'k-', LW,d1); semilogy(binc,a.v1,'k--',LW,d1); 
semilogy(binc,a.v5,'k:', LW,d1); semilogy(binc,a.v6,'k:', LW,d2); 
semilogy(binc,a.w0,'r-', LW,d1); semilogy(binc,a.w1,'r--',LW,d1); 
semilogy(binc,a.w5,'r:', LW,d1); semilogy(binc,a.w6,'r:', LW,d2);
legend('R1.5','R03','R48','R48C',2); 
xl='RH (%)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (mm/day)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh2_all_pdf_sst'; c=1;  xy=[0 150 1E-8 1E0];
a=v0.all.rh2_stat; bins=a.bins*c; binc=a.binc*c;
a.v0=v0.all.rh2_stat.pdf./bins; a.c0=c0.all.rh2_stat.pdf./bins; a.w0=w0.all.rh2_stat.pdf./bins;
a.v1=v1.all.rh2_stat.pdf./bins; a.c1=c1.all.rh2_stat.pdf./bins; a.w1=w1.all.rh2_stat.pdf./bins;
a.v2=v2.all.rh2_stat.pdf./bins; a.c2=c2.all.rh2_stat.pdf./bins; a.w2=w2.all.rh2_stat.pdf./bins;
a.v3=v3.all.rh2_stat.pdf./bins; a.c3=c3.all.rh2_stat.pdf./bins; a.w3=w3.all.rh2_stat.pdf./bins;
a.v4=v4.all.rh2_stat.pdf./bins; a.c4=c4.all.rh2_stat.pdf./bins; a.w4=w4.all.rh2_stat.pdf./bins;
a.v5=v5.all.rh2_stat.pdf./bins; a.c5=c5.all.rh2_stat.pdf./bins; a.w5=w5.all.rh2_stat.pdf./bins;
a.v6=v6.all.rh2_stat.pdf./bins; a.c6=c6.all.rh2_stat.pdf./bins; a.w6=w6.all.rh2_stat.pdf./bins;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=4;
semilogy(binc,a.c0,'b-', LW,d1); hold on; semilogy(binc,a.c1,'b--',LW,d1); 
semilogy(binc,a.c5,'b:', LW,d1); semilogy(binc,a.c6,'b:', LW,d2); 
semilogy(binc,a.v0,'k-', LW,d1); semilogy(binc,a.v1,'k--',LW,d1); 
semilogy(binc,a.v5,'k:', LW,d1); semilogy(binc,a.v6,'k:', LW,d2); 
semilogy(binc,a.w0,'r-', LW,d1); semilogy(binc,a.w1,'r--',LW,d1); 
semilogy(binc,a.w5,'r:', LW,d1); semilogy(binc,a.w6,'r:', LW,d2);
legend('R1.5','R03','R48','R48C',2); 
xl='RH (%)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (mm/day)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa1_pdf_org_sst'; c=1;  xy=[-1 1 1E-6 1E2];
a=v0.cld.wa1_stat; bins=a.bins*c; binc=a.binc*c;
a.v0=v0.cld.wa1_stat.pdf./bins; a.c0=c0.cld.wa1_stat.pdf./bins; a.w0=w0.cld.wa1_stat.pdf./bins;
a.v1=v1.cld.wa1_stat.pdf./bins; a.c1=c1.cld.wa1_stat.pdf./bins; a.w1=w1.cld.wa1_stat.pdf./bins;
a.v2=v2.cld.wa1_stat.pdf./bins; a.c2=c2.cld.wa1_stat.pdf./bins; a.w2=w2.cld.wa1_stat.pdf./bins;
a.v3=v3.cld.wa1_stat.pdf./bins; a.c3=c3.cld.wa1_stat.pdf./bins; a.w3=w3.cld.wa1_stat.pdf./bins;
a.v4=v4.cld.wa1_stat.pdf./bins; a.c4=c4.cld.wa1_stat.pdf./bins; a.w4=w4.cld.wa1_stat.pdf./bins;
a.v5=v5.cld.wa1_stat.pdf./bins; a.c5=c5.cld.wa1_stat.pdf./bins; a.w5=w5.cld.wa1_stat.pdf./bins;
a.v6=v6.cld.wa1_stat.pdf./bins; a.c6=c6.cld.wa1_stat.pdf./bins; a.w6=w6.cld.wa1_stat.pdf./bins;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=4;
semilogy(binc,a.c0,'b-', LW,d1); hold on; semilogy(binc,a.c1,'b--',LW,d1); 
semilogy(binc,a.c5,'b:', LW,d1); semilogy(binc,a.c6,'b:', LW,d2); 
semilogy(binc,a.v0,'k-', LW,d1); semilogy(binc,a.v1,'k--',LW,d1); 
semilogy(binc,a.v5,'k:', LW,d1); semilogy(binc,a.v6,'k:', LW,d2); 
semilogy(binc,a.w0,'r-', LW,d1); semilogy(binc,a.w1,'r--',LW,d1); 
semilogy(binc,a.w5,'r:', LW,d1); semilogy(binc,a.w6,'r:', LW,d2);
legend('R1.5','R03','R48','R48C',2); 
xl='vertical velocity (m/s)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (m/s)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa2_pdf_org_sst'; c=1;  xy=[-1 1 1E-3 1E1];
a=v0.cld.wa2_stat; bins=a.bins*c; binc=a.binc*c;
a.v0=v0.cld.wa2_stat.pdf./bins; a.c0=c0.cld.wa2_stat.pdf./bins; a.w0=w0.cld.wa2_stat.pdf./bins;
a.v1=v1.cld.wa2_stat.pdf./bins; a.c1=c1.cld.wa2_stat.pdf./bins; a.w1=w1.cld.wa2_stat.pdf./bins;
a.v2=v2.cld.wa2_stat.pdf./bins; a.c2=c2.cld.wa2_stat.pdf./bins; a.w2=w2.cld.wa2_stat.pdf./bins;
a.v3=v3.cld.wa2_stat.pdf./bins; a.c3=c3.cld.wa2_stat.pdf./bins; a.w3=w3.cld.wa2_stat.pdf./bins;
a.v4=v4.cld.wa2_stat.pdf./bins; a.c4=c4.cld.wa2_stat.pdf./bins; a.w4=w4.cld.wa2_stat.pdf./bins;
a.v5=v5.cld.wa2_stat.pdf./bins; a.c5=c5.cld.wa2_stat.pdf./bins; a.w5=w5.cld.wa2_stat.pdf./bins;
a.v6=v6.cld.wa2_stat.pdf./bins; a.c6=c6.cld.wa2_stat.pdf./bins; a.w6=w6.cld.wa2_stat.pdf./bins;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=4;
semilogy(binc,a.c0,'b-', LW,d1); hold on; semilogy(binc,a.c1,'b--',LW,d1); 
semilogy(binc,a.c5,'b:', LW,d1); semilogy(binc,a.c6,'b:', LW,d2); 
semilogy(binc,a.v0,'k-', LW,d1); semilogy(binc,a.v1,'k--',LW,d1); 
semilogy(binc,a.v5,'k:', LW,d1); semilogy(binc,a.v6,'k:', LW,d2); 
semilogy(binc,a.w0,'r-', LW,d1); semilogy(binc,a.w1,'r--',LW,d1); 
semilogy(binc,a.w5,'r:', LW,d1); semilogy(binc,a.w6,'r:', LW,d2);
legend('R1.5','R03','R48','R48C',2); 
xl='vertical velocity (m/s)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (m/s)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh1_clr_pdf_org_sst'; c=1;  xy=[0 110 1E-8 1E0];
a=v0.clr.rh1_stat; bins=a.bins*c; binc=a.binc*c;
a.v0=v0.clr.rh1_stat.pdf./bins; a.c0=c0.clr.rh1_stat.pdf./bins; a.w0=w0.clr.rh1_stat.pdf./bins;
a.v1=v1.clr.rh1_stat.pdf./bins; a.c1=c1.clr.rh1_stat.pdf./bins; a.w1=w1.clr.rh1_stat.pdf./bins;
a.v2=v2.clr.rh1_stat.pdf./bins; a.c2=c2.clr.rh1_stat.pdf./bins; a.w2=w2.clr.rh1_stat.pdf./bins;
a.v3=v3.clr.rh1_stat.pdf./bins; a.c3=c3.clr.rh1_stat.pdf./bins; a.w3=w3.clr.rh1_stat.pdf./bins;
a.v4=v4.clr.rh1_stat.pdf./bins; a.c4=c4.clr.rh1_stat.pdf./bins; a.w4=w4.clr.rh1_stat.pdf./bins;
a.v5=v5.clr.rh1_stat.pdf./bins; a.c5=c5.clr.rh1_stat.pdf./bins; a.w5=w5.clr.rh1_stat.pdf./bins;
a.v6=v6.clr.rh1_stat.pdf./bins; a.c6=c6.clr.rh1_stat.pdf./bins; a.w6=w6.clr.rh1_stat.pdf./bins;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=4;
semilogy(binc,a.c0,'b-', LW,d1); hold on; semilogy(binc,a.c1,'b--',LW,d1); 
semilogy(binc,a.c5,'b:', LW,d1); semilogy(binc,a.c6,'b:', LW,d2); 
semilogy(binc,a.v0,'k-', LW,d1); semilogy(binc,a.v1,'k--',LW,d1); 
semilogy(binc,a.v5,'k:', LW,d1); semilogy(binc,a.v6,'k:', LW,d2); 
semilogy(binc,a.w0,'r-', LW,d1); semilogy(binc,a.w1,'r--',LW,d1); 
semilogy(binc,a.w5,'r:', LW,d1); semilogy(binc,a.w6,'r:', LW,d2);
legend('R1.5','R03','R48','R48C',4); 
xl='RH over clear region (%)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (mm/day)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh2_clr_pdf_org_sst'; c=1;  xy=[0 150 1E-8 1E0];
a=v0.clr.rh2_stat; bins=a.bins*c; binc=a.binc*c;
a.v0=v0.clr.rh2_stat.pdf./bins; a.c0=c0.clr.rh2_stat.pdf./bins; a.w0=w0.clr.rh2_stat.pdf./bins;
a.v1=v1.clr.rh2_stat.pdf./bins; a.c1=c1.clr.rh2_stat.pdf./bins; a.w1=w1.clr.rh2_stat.pdf./bins;
a.v2=v2.clr.rh2_stat.pdf./bins; a.c2=c2.clr.rh2_stat.pdf./bins; a.w2=w2.clr.rh2_stat.pdf./bins;
a.v3=v3.clr.rh2_stat.pdf./bins; a.c3=c3.clr.rh2_stat.pdf./bins; a.w3=w3.clr.rh2_stat.pdf./bins;
a.v4=v4.clr.rh2_stat.pdf./bins; a.c4=c4.clr.rh2_stat.pdf./bins; a.w4=w4.clr.rh2_stat.pdf./bins;
a.v5=v5.clr.rh2_stat.pdf./bins; a.c5=c5.clr.rh2_stat.pdf./bins; a.w5=w5.clr.rh2_stat.pdf./bins;
a.v6=v6.clr.rh2_stat.pdf./bins; a.c6=c6.clr.rh2_stat.pdf./bins; a.w6=w6.clr.rh2_stat.pdf./bins;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=4;
semilogy(binc,a.c0,'b-', LW,d1); hold on; semilogy(binc,a.c1,'b--',LW,d1); 
semilogy(binc,a.c5,'b:', LW,d1); semilogy(binc,a.c6,'b:', LW,d2); 
semilogy(binc,a.v0,'k-', LW,d1); semilogy(binc,a.v1,'k--',LW,d1); 
semilogy(binc,a.v5,'k:', LW,d1); semilogy(binc,a.v6,'k:', LW,d2); 
semilogy(binc,a.w0,'r-', LW,d1); semilogy(binc,a.w1,'r--',LW,d1); 
semilogy(binc,a.w5,'r:', LW,d1); semilogy(binc,a.w6,'r:', LW,d2);
legend('R1.5','R03','R48','R48C',3); 
xl='RH over clear region (%)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (mm/day)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w3km_pdf_org_sst'; c=1;  xy=[-5 15 1E-8 2E1];
a=v0.w3km_org.all; bins=a.bins*c; binc=a.binc*c;
a.v0=v0.w3km_org.all.pdf./bins; a.c0=c0.w3km_org.all.pdf./bins; a.w0=w0.w3km_org.all.pdf./bins;
a.v1=v1.w3km_org.all.pdf./bins; a.c1=c1.w3km_org.all.pdf./bins; a.w1=w1.w3km_org.all.pdf./bins;
a.v2=v2.w3km_org.all.pdf./bins; a.c2=c2.w3km_org.all.pdf./bins; a.w2=w2.w3km_org.all.pdf./bins;
a.v3=v3.w3km_org.all.pdf./bins; a.c3=c3.w3km_org.all.pdf./bins; a.w3=w3.w3km_org.all.pdf./bins;
a.v4=v4.w3km_org.all.pdf./bins; a.c4=c4.w3km_org.all.pdf./bins; a.w4=w4.w3km_org.all.pdf./bins;
a.v5=v5.w3km_org.all.pdf./bins; a.c5=c5.w3km_org.all.pdf./bins; a.w5=w5.w3km_org.all.pdf./bins;
a.v6=v6.w3km_org.all.pdf./bins; a.c6=c6.w3km_org.all.pdf./bins; a.w6=w6.w3km_org.all.pdf./bins;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=4;
semilogy(binc,a.c0,'b-', LW,d1); hold on; semilogy(binc,a.c1,'b--',LW,d1); 
semilogy(binc,a.c5,'b:', LW,d1); semilogy(binc,a.c6,'b:', LW,d2); 
semilogy(binc,a.v0,'k-', LW,d1); semilogy(binc,a.v1,'k--',LW,d1); 
semilogy(binc,a.v5,'k:', LW,d1); semilogy(binc,a.v6,'k:', LW,d2); 
semilogy(binc,a.w0,'r-', LW,d1); semilogy(binc,a.w1,'r--',LW,d1); 
semilogy(binc,a.w5,'r:', LW,d1); semilogy(binc,a.w6,'r:', LW,d2);
legend('R1.5','R03','R48','R48C',1); 
xl='vertical velocity at 3km (m/s)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (m/s)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w500_pdf_org_sst'; c=1;  xy=[-5 15 1E-8 2E1];
a=v0.w500_org.all; bins=a.bins*c; binc=a.binc*c;
a.v0=v0.w500_org.all.pdf./bins; a.c0=c0.w500_org.all.pdf./bins; a.w0=w0.w500_org.all.pdf./bins;
a.v1=v1.w500_org.all.pdf./bins; a.c1=c1.w500_org.all.pdf./bins; a.w1=w1.w500_org.all.pdf./bins;
a.v2=v2.w500_org.all.pdf./bins; a.c2=c2.w500_org.all.pdf./bins; a.w2=w2.w500_org.all.pdf./bins;
a.v3=v3.w500_org.all.pdf./bins; a.c3=c3.w500_org.all.pdf./bins; a.w3=w3.w500_org.all.pdf./bins;
a.v4=v4.w500_org.all.pdf./bins; a.c4=c4.w500_org.all.pdf./bins; a.w4=w4.w500_org.all.pdf./bins;
a.v5=v5.w500_org.all.pdf./bins; a.c5=c5.w500_org.all.pdf./bins; a.w5=w5.w500_org.all.pdf./bins;
a.v6=v6.w500_org.all.pdf./bins; a.c6=c6.w500_org.all.pdf./bins; a.w6=w6.w500_org.all.pdf./bins;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); 
LW='LineWidth'; d1=2; d2=4;
semilogy(binc,a.c0,'b-', LW,d1); hold on; semilogy(binc,a.c1,'b--',LW,d1); 
semilogy(binc,a.c5,'b:', LW,d1); semilogy(binc,a.c6,'b:', LW,d2); 
semilogy(binc,a.v0,'k-', LW,d1); semilogy(binc,a.v1,'k--',LW,d1); 
semilogy(binc,a.v5,'k:', LW,d1); semilogy(binc,a.v6,'k:', LW,d2); 
semilogy(binc,a.w0,'r-', LW,d1); semilogy(binc,a.w1,'r--',LW,d1); 
semilogy(binc,a.w5,'r:', LW,d1); semilogy(binc,a.w6,'r:', LW,d2);
legend('R1.5','R03','R48','R48C',1); 
xl='vertical velocity at ~500hPa (m/s)'; xlabel(xl,'FontSize',fsize);
yl='Probability Density Function (m/s)^{-1}'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/'; expn='rce_circ_240_365';
printit(visfig,figpath,expn,vname);
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
vname='precip_ts'; xmin=80; xmax=365; ymin=0; ymax=5;
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
visfig='off'; figpath='./fig_rce/'; expn='rce_circ';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
