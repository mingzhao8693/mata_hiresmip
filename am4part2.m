%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II Figs.2-8, S1-6 (convecion sensitivity)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%below opt=1 for writing mat file to /work/miz
%below opt=2 for writing mat file to /archive
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
latlon=[0 360 -90 90];region='global';mod='c96';myr=5; opt=2;
%latlon=[0 360  30 90];region='nhextr';mod='c96';myr=5; opt=2; 
%latlon=[0 360 -30 30];region='tropic';mod='c96';myr=5; opt=2; 
%latlon=[150 250 -5 5]; region='equpac'; nyr=5; myr=1; opt=0;
%read in or generate observation data
%o=readobs(latlon,region,'c48');
fn=strcat('/work/miz/mat_am4p0/obs_',region,'_to_c48.mat'); load(fn);
tpath='/archive/Ming.Zhao/awg/warsaw/'; myr=5;
expn='c96L33_am4p0_2010climo';yr1='0002';yr2='0031';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_swradhh';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_rkm_dp1';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_rkm_dp2';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_rkm_dp3';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_rkm_dp4';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_cfrac0';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_cfrac1';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_cfrac2';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_cfrac3';yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load previous anlaysis matfiles%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_cm4/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat'); 
tpath='/archive/Ming.Zhao/awg/warsaw/';
%Sensitivity test%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='AM4.0';                          fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v0=v;
expn='c96L33_am4p0_2010climo_10yr';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.C0=v;
expn='c96L33_am4p0_2010climo';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c0=v;
expn='c96L33_am4p0_2010climo_p2K';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w0=v;
expn='c96L33_am4p0_2010climo_rkm_dp3'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c1=v;
expn='c96L33_am4p0_2010climo_rkm_dp1'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c2=v;
expn='c96L33_am4p0_2010climo_rkm_dp2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c3=v;
expn='c96L33_am4p0_2010climo_rkm_dp4'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c4=v;
expn='c96L33_am4p0_2010climo_cfrac0';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c5=v;
expn='c96L33_am4p0_2010climo_cfrac1';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c6=v;
expn='c96L33_am4p0_2010climo_cfrac2';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c7=v;
expn='c96L33_am4p0_2010climo_cfrac3';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c8=v;
expn='c96L33_am4p0_2010climo_eis0';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c9=v;
expn='c96L33_am4p0_2010climo_eis0_p2K';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w9=v;

expn='c96L33_am4p0_2010climo_swradhh'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c10=v;
expn='c96L33_am4p0_2010climo_swrad2h'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c11=v;
expn='c96L33_am4p0_2010climo_swrad3h'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c12=v;

expn='AM2.1';                          fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v0=v;
expn='AM3';                            fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v0=v;
expn='c180_hiram_H1';                  fn=strcat(tpath,expn,pp,expn,dr);load(fn);hiram.v0=v;

v=am4.c9.toa;
[mean(v.lwnet.ann_stat.mmen.all)  mean(v.swnet.ann_stat.mmen.all) ...
 mean(v.netrad.ann_stat.mmen.all) mean(v.lwcf.ann_stat.mmen.all)  ...
 mean(v.swcf.ann_stat.mmen.all)   mean(v.ttcf.ann_stat.mmen.all)]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II Fig.1: Bruce Wyman grid imprint
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II Fig.2: precipitation sensitivity to rkm_dp
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
vname='pcp_blue'; k=1; s.unit='mm/day';
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.sfc.pcp.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c1.sfc.pcp.sea(k,:,:)); s.s1='(a) C1 minus C0';
x2=squeeze(am4.c2.sfc.pcp.sea(k,:,:)); s.s2='(b) C2 minus C0';
x3=squeeze(am4.c3.sfc.pcp.sea(k,:,:)); s.s3='(c) C3 minus C0';
x4=squeeze(am4.c4.sfc.pcp.sea(k,:,:)); s.s4='(d) C4 minus C0';
z1=x1-x0; z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-1.5; cmax=1.5; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='am4sen_rkmdp'; f=1; 
plot_4panel_mapp(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,2);
%plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II Fig.2: precipitation sensitivity to rkm_dp
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
vname='pcp_green'; k=1; s.unit='mm/day';
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.sfc.pcp.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c1.sfc.pcp.sea(k,:,:)); s.s1='(a) C1 minus C0';
x2=squeeze(am4.c2.sfc.pcp.sea(k,:,:)); s.s2='(b) C2 minus C0';
x3=squeeze(am4.c3.sfc.pcp.sea(k,:,:)); s.s3='(c) C3 minus C0';
x4=squeeze(am4.c4.sfc.pcp.sea(k,:,:)); s.s4='(d) C4 minus C0';
z1=x1-x0; z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-1.5; cmax=1.5; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='am4sen_rkmdp'; f=1; 
plot_4panel_mapp(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,4);
%plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
vname='q700'; k=1; a=1000;
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.atm.q700.sea(k,:,:))*a; s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c1.atm.q700.sea(k,:,:))*a; s.s1='(a) C1 minus C0';
x2=squeeze(am4.c2.atm.q700.sea(k,:,:))*a; s.s2='(b) C2 minus C0';
x3=squeeze(am4.c3.atm.q700.sea(k,:,:))*a; s.s3='(c) C3 minus C0';
x4=squeeze(am4.c4.atm.q700.sea(k,:,:))*a; s.s4='(d) C4 minus C0';
z1=x1-x0; z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='am4sen_rkmdp'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II Fig.3: sensitivity of zonal mean temperature to rkm_dp
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmt'; vname=varn;
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4.c0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=am4.c0; [z0 b0 rms0]=vslice(v,s,k,varn,'obs',mv); s.s0='AM4.0-C0 (ANN)';
v=am4.c1; [z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv); s.s1='(a) C1 minus C0';
v=am4.c2; [z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv); s.s2='(b) C2 minus C0';
v=am4.c3; [z3 b3 rms3]=vslice(v,s,k,varn,'mod',mv); s.s3='(c) C3 minus C0';
v=am4.c4; [z4 b4 rms4]=vslice(v,s,k,varn,'mod',mv); s.s4='(d) C4 minus C0';
id=isnan(z1); zo(id)=NaN; b1(id)=NaN; %b2(id)=NaN; b3(id)=NaN;
z1=z1-z0; z2=z2-z0; z3=z3-z0; z4=z4-z0; s.vlab=[-1:0.2:1];
s.lat=lat; s.pf=pf; s.xy=[-90 90 100 1000]; s.unit='(C)';
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/10:cmax];
fpath='./fig_am4/'; expn='am4sen_rkmdp'; f=1;
plot_4panel_zmean(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(AM4 paper Part II Fig.3x: alternative figures for Part II Fig.3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmt'; ss={'ANN','MAM','JJA','SON','DJF'};
vname=strcat('rkmdp_',varn,'_bias_',(ss{k}));
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4.c0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=am4.c0; [z0 bo rms0]=vslice(v,s,k,varn,'obs',mv);
v=am4.c0; [z0 b0 rms0]=vslice(v,s,k,varn,'mod',mv);
v=am4.c1; [z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv);
v=am4.c2; [z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv);
v=am4.c3; [z3 b3 rms3]=vslice(v,s,k,varn,'mod',mv);
v=am4.c4; [z4 b4 rms4]=vslice(v,s,k,varn,'mod',mv);
id=isnan(z1); zo(id)=NaN; b1(id)=NaN; %b2(id)=NaN; b3(id)=NaN;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1300, 1100]*0.8; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
c1=-6; c2=6; vbin=[c1:0.5:c2];
x0=0.08; y0=0.7; wx=0.38; wy=0.25; dx=0.1; dy=0.05;
p1= [x0,          y0,           wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,           wx, wy];%position of first subplot
p3= [x0+(wx+dx)/2,y0-wy-dy,     wx, wy];%position of first subplot
p4= [x0,          y0-2*(wy+dy), wx, wy];%position of first subplot
p5= [x0+wx+dx,    y0-2*(wy+dy), wx, wy];%position of first subplot
nn=64; cmap=jet(nn); colormap(cmap); %cmap(nn/2:nn/2+1,:)=1;
subplot('Position',p1);
[C,h]=contourf(lat,pf,b1,vbin); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h); 
s=sprintf('(a) C1 (RMSE=%5.2f)',rms1); title(s,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy); set(gca,'yDir','reverse'); 
subplot('Position',p2);
[C,h]=contourf(lat,pf,b2,vbin); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h); 
s=sprintf('(b) C2 (RMSE=%5.2f)',rms2); title(s,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy); set(gca,'yDir','reverse'); 
subplot('Position',p3); 
[C,h]=contourf(lat,pf,b0,vbin); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h); 
s=sprintf('(c) C0 (RMSE=%5.2f)',rms0); title(s,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy); set(gca,'yDir','reverse'); 
subplot('Position',p4); 
[C,h]=contourf(lat,pf,b3,vbin); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h); 
s=sprintf('(d) C3 (RMSE=%5.2f)',rms3); title(s,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy); set(gca,'yDir','reverse'); 
subplot('Position',p5); 
[C,h]=contourf(lat,pf,b4,vbin); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h); 
s=sprintf('(e) C4 (RMSE=%5.2f)',rms4); title(s,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy); set(gca,'yDir','reverse'); 
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II Fig.4: sensitivity of U200 bias to rkm_dp
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=2; varn='u200'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.c0.s; lon=s.lon; lat=s.lat; xy=[0 360 -90 90]; mv=-999;
x=o.atm.u200;      ob=squeeze(x.sea(k,:,:)); 
x=am4.v0.atm.u200; ba=squeeze(x.sea_bias(k,:,:)); rmsa=x.sea_stat.rmse.all(k);
x=am4.c0.atm.u200; b0=squeeze(x.sea_bias(k,:,:)); rms0=x.sea_stat.rmse.all(k);
x=am4.c1.atm.u200; b1=squeeze(x.sea_bias(k,:,:)); rms1=x.sea_stat.rmse.all(k);
x=am4.c2.atm.u200; b2=squeeze(x.sea_bias(k,:,:)); rms2=x.sea_stat.rmse.all(k);
x=am4.c3.atm.u200; b3=squeeze(x.sea_bias(k,:,:)); rms3=x.sea_stat.rmse.all(k);
x=am4.c4.atm.u200; b4=squeeze(x.sea_bias(k,:,:)); rms4=x.sea_stat.rmse.all(k);
x=am4.c0; s.lmx=x.lm0; s.lonx=x.lon; s.latx=x.lat;
z1=ob; z2=b0; z3=b1; s.unit='(m/s)';
s.s1='(a) U200; ERA-interim;';
s.s2='(b) C0 minus ERA'; 
s.s3='(c) C1 minus ERA';
s.c1=-60;   s.c2=60;   s.vbino=[s.c1:5:s.c2];
s.cmin=-12; s.cmax=12; s.vbin =[s.cmin:2:s.cmax];
fpath='./fig_am4/'; expn='am4sen_rkmdp'; f=1; icmap=1;
plot_3panel_mapp(s,z1,z2,z3,varn,fpath,expn,f,k,icmap);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(AM4 paper Part II Fig.4x: alternative figure for part II Fig.4)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=5; varn='u200'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.c0.s; lon=s.lon; lat=s.lat; xy=[0 360 -90 90]; mv=-999;
x=o.atm.u200;      b1=squeeze(x.sea(k,:,:)); 
x=am4.c0.atm.u200; b3=squeeze(x.sea_bias(k,:,:)); rms3=x.sea_stat.rmse.all(k);
x=am4.c1.atm.u200; b5=squeeze(x.sea_bias(k,:,:)); rms5=x.sea_stat.rmse.all(k);
k=2; varn='u200'; ss={'ANN','MAM','JJA','SON','DJF'};
x=o.atm.u200;      b2=squeeze(x.sea(k,:,:)); 
x=am4.c0.atm.u200; b4=squeeze(x.sea_bias(k,:,:)); rms4=x.sea_stat.rmse.all(k);
x=am4.c1.atm.u200; b6=squeeze(x.sea_bias(k,:,:)); rms6=x.sea_stat.rmse.all(k);
x=am4.c0; lmx=x.lm0; lmx(lmx>=0.5)=1; lmx(lmx<0.5)=0;
lonx=x.lon; latx=x.lat; s.unit='(m/s)';
s.s1='(a) U200; ERA-interim; DJF';
s.s3='(b) C0 minus ERA'; 
s.s5='(c) C1 minus ERA';
s.s2='(d) U200; ERA-interim; MAM';
s.s4='(e) C0 minus ERA'; 
s.s6='(f) C1 minus ERA';
c1=-60;   c2=60;   vbino=[c1:5:c2];
cmin=-12; cmax=12; vbin =[cmin:2:cmax];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1300, 1100]*0.8; fsize=10; lw=1; msize=8; domap='robinson'; 
handle = figure('Position', pms,'visible','on');
x0=0.08; y0=0.7; wx=0.35; wy=0.25-0.05; dx=0.0; dy=0.08;
p1= [x0,          y0,           wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,           wx, wy];%position of first subplot
p3= [x0,          y0-wy-dy,     wx, wy];%position of first subplot
p4= [x0+wx+dx,    y0-wy-dy,     wx, wy];%position of first subplot
p5= [x0,          y0-2*(wy+dy), wx, wy];%position of first subplot
p6= [x0+wx+dx,    y0-2*(wy+dy), wx, wy];%position of first subplot
nn=32; caxis([cmin cmax]); cmap1=bluewhitered(nn); icmap=3; %caxis([c1 c2]);
caxis([c1 c2]);
if (icmap==0)
  cmap=fabien_colormap(nn);
elseif (icmap==1) 
  cmap=bluewhitered(nn);
elseif (icmap==2)
  cmap=cbrewer('div', 'BrBG', nn);
else
  cmap=jet(nn);
end
pos1=[0.22 0.68 0.42 0.01];%[left bottom width height];
pos2=[0.22 0.40 0.42 0.01];%[left bottom width height];
subplot('Position',p1); unit='(m/s)';
do_mapproj(lat,lon,b1,vbino,latx,lonx,lmx,domap,xy); %clabel(C,h); 
caxis([c1 c2]); colormap(cmap); freezeColors; 
h=colorbar('Location','southoutside','Position',pos1); %cbfreeze(h,cmap);
title(s.s1,'FontSize',fsize);
subplot('Position',p2); 
do_mapproj(lat,lon,b2,vbino,latx,lonx,lmx,domap,xy); %clabel(C,h); 
caxis([c1 c2]); colormap(cmap); freezeColors; 
h=colorbar('Location','southoutside','Position',pos1); 
cbfreeze(h,cmap); %cbunits(h,unit); 
title(s.s2,'FontSize',fsize);
subplot('Position',p3);
do_mapproj(lat,lon,b3,vbin,latx,lonx,lmx,domap,xy); %clabel(C,h); 
caxis([cmin cmax]); colormap(cmap1); %freezeColors; 
s.s3=sprintf('%s (RMSE=%5.2f)',s.s3,rms3);
title(s.s3,'FontSize',fsize);
subplot('Position',p4); 
do_mapproj(lat,lon,b4,vbin,latx,lonx,lmx,domap,xy); %clabel(C,h); 
caxis([cmin cmax]); colormap(cmap1); freezeColors; 
s.s4=sprintf('%s (RMSE=%5.2f)',s.s4,rms4);
title(s.s4,'FontSize',fsize);
subplot('Position',p5); 
do_mapproj(lat,lon,b5,vbin,latx,lonx,lmx,domap,xy); %clabel(C,h); 
caxis([cmin cmax]); colormap(cmap1); freezeColors; 
s.s5=sprintf('%s (RMSE=%5.2f)',s.s5,rms5);
title(s.s5,'FontSize',fsize);
subplot('Position',p6); 
do_mapproj(lat,lon,b6,vbin,latx,lonx,lmx,domap,xy); %clabel(C,h); 
caxis([cmin cmax]); colormap(cmap1); freezeColors; 
s.s6=sprintf('%s (RMSE=%5.2f)',s.s6,rms6);
title(s.s6,'FontSize',fsize);
h=colorbar('Location','southoutside','Position',pos2); 
cbfreeze(h,cmap1); %cbunits(h,unit); 
visfig='off'; fpath='./fig_am4/'; expn='am4sen_rkmdp'; vname='u200';
printit(visfig,fpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=4; varn='zmu'; ss={'ANN','MAM','JJA','SON','DJF'};
vname=strcat('rkmdp_',varn,'_bias_',(ss{k}));
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4.c0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=am4.c0; [z0 bo rms0]=vslice(v,s,k,varn,'obs',mv);
v=am4.c0; [z0 b0 rms0]=vslice(v,s,k,varn,'mod',mv);
v=am4.c1; [z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv);
v=am4.c2; [z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv);
v=am4.c3; [z3 b3 rms3]=vslice(v,s,k,varn,'mod',mv);
v=am4.c4; [z4 b4 rms4]=vslice(v,s,k,varn,'mod',mv);
id=isnan(z1); zo(id)=NaN; b1(id)=NaN; %b2(id)=NaN; b3(id)=NaN;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1300, 1100]*0.8; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
c1=-10; c2=10; vbin=[c1:1:c2];
x0=0.08; y0=0.7; wx=0.38; wy=0.25; dx=0.1; dy=0.05;
p1= [x0,          y0,           wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,           wx, wy];%position of first subplot
p3= [x0+(wx+dx)/2,y0-wy-dy,     wx, wy];%position of first subplot
p4= [x0,          y0-2*(wy+dy), wx, wy];%position of first subplot
p5= [x0+wx+dx,    y0-2*(wy+dy), wx, wy];%position of first subplot
nn=64; cmap=jet(nn); colormap(cmap); %cmap(nn/2:nn/2+1,:)=1;
subplot('Position',p1);
[C,h]=contourf(lat,pf,b1,vbin); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h); 
s=sprintf('(a) C1 (RMSE=%5.2f)',rms1); title(s,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy); set(gca,'yDir','reverse'); 
subplot('Position',p2);
[C,h]=contourf(lat,pf,b2,vbin); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h); 
s=sprintf('(b) C2 (RMSE=%5.2f)',rms2); title(s,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy); set(gca,'yDir','reverse'); 
subplot('Position',p3); 
[C,h]=contourf(lat,pf,b0,vbin); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h); 
s=sprintf('(c) C0 (RMSE=%5.2f)',rms0); title(s,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy); set(gca,'yDir','reverse'); 
subplot('Position',p4); 
[C,h]=contourf(lat,pf,b3,vbin); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h); 
s=sprintf('(d) C3 (RMSE=%5.2f)',rms3); title(s,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy); set(gca,'yDir','reverse'); 
subplot('Position',p5); 
[C,h]=contourf(lat,pf,b4,vbin); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h); 
s=sprintf('(e) C4 (RMSE=%5.2f)',rms4); title(s,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy); set(gca,'yDir','reverse'); 
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II Fig.5: sensitivity of frac_ls to rkm_dp
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.c0.s; a0=mean(s.aa,2); a0=a0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rkmdp_fls'; yl='fraction of large-scale precipiation'; climo=1;
k=1; z=o.sfc; yo=squeeze(z.prec_ls.latdis.sea(k,:))./squeeze(z.pcp.latdis.sea(k,:));
%z=am4.c0; x=mean(z.sfc.prec_ls.txavg0.*a0); y=mean(z.sfc.pcp.txavg0.*a0);
z=am4.c0;   y1=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s1='C0';
z=am4.c1;   y2=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s2='C1';
z=am4.c2;   y3=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s3='C2';
z=am4.c3;   y4=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s4='C3';
z=am4.c4;   y5=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s5='C4';
z=am2.v0;   y6=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s6='AM2';
z=am3.v0;   y7=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s7='AM3';
z=hiram.v0; y8=z.sfc.prec_ls.txavg0./z.sfc.pcp.txavg0;   s8='HiRAM';
y.xy=[-90 90 0 1]; y.yl=yl; y.climo=climo;
y.so='ERA-INTERIM'; y.co='m'; y.varo=yo;
y.var1=y1; y.var2=y2; y.var3=y3; y.var4=y4; y.var5=y5; y.var6=y6; y.var7=y7; y.var8=y8;
y.s1=s1;   y.s2=s2;   y.s3=s3;   y.s4=s4;   y.s5=s5;   y.s6=s6;   y.s7=s7;   y.s8=s8;
y.c1='k-'; y.c2='k--'; y.c3='k:'; y.c4='k-.'; y.c5='k-'; y.c6='r'; y.c7='g-'; y.c8='b';
expn='am4sen'; x=s.lat; y.opt=4; y.xl='latitude';
plot_latdis_am4amip(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II Fig 6: sensitivity of intraseasonal variance to rkm_dp
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_cm4/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat'); 
tpath='/archive/Ming.Zhao/awg/warsaw/';
expn='c96L33_am4p0_2010climo'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v0=v;
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='precip_all_iso'; vname=strcat('rkmdp_',varn); expn='am4sen';
v=am4.c0; lat=v.lat; lon=v.lon; lm=v.lm0; 
z0=am4.c0.precip.all.var_iso; z0=z0.^2; 
z=am4.v0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s.lat=lat; s.lon=lon; 
z1=am4.c1.precip.all.var_iso; z1=z1.^2; s.s1='(a) C1 minus C0';
z2=am4.c2.precip.all.var_iso; z2=z2.^2; s.s2='(b) C2 minus C0';
z3=am4.c3.precip.all.var_iso; z3=z3.^2; s.s3='(c) C3 minus C0';
z4=am4.c4.precip.all.var_iso; z4=z4.^2; s.s4='(d) C4 minus C0';
z1=z1-z0; z2=z2-z0; z3=z3-z0; z4=z4-z0;
%z1=z1./z0*100;z2=z2./z0;z3=z3./z0;z4=z4./z0;
wsize_x=5; wsize_y=5; ;
z1=smoothdata(z1,wsize_x,wsize_y);
z2=smoothdata(z2,wsize_x,wsize_y);
z3=smoothdata(z3,wsize_x,wsize_y);
z4=smoothdata(z4,wsize_x,wsize_y);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax];
s.lat=lat; s.lon=lon;
fpath='./fig_am4/'; f=1; k=1;
plot_4panel_mapp_isovar(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pms=[ 0, 0, 1000, 400]*1.2; fsize=16; lw=1; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-10; cmax=10; vbin=[cmin:1:cmax];
subplot(row,col,1);  xy=[0 360 -30 30]; %z1(z1<-10)=-10;
contourf(lon,lat,z1,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]); 
contour(lon,lat,lm,0.5,'k'); 
axis(xy); s=sprintf('(a) C1 minus C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
contourf(lon,lat,z2,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]); 
contour(lon,lat,lm,0.5,'k'); 
axis(xy); s=sprintf('(b) C2 minus C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,3); 
contourf(lon,lat,z3,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,0.5,'k'); 
axis(xy); s=sprintf('(c) C3 minus C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
contourf(lon,lat,z4,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]); 
contour(lon,lat,lm,0.5,'k'); 
axis(xy); s=sprintf('(d) C4 minus C0');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II Fig.7: sensivity of low cloud amount to EIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0; s.nlon=z.nlon
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qal'; k=1; vname=strcat('eis_',vname); expn='AM4sen';
xo=squeeze(o.atm.qal.sea(k,:,:))*100.;  
x0=squeeze(am4.c0.atm.qal.sea(k,:,:));  s.s1='(a) C0;';
x1=squeeze(am4.c9.atm.qal.sea(k,:,:));  s.s2='(b) C9;';
z1=x0; z2=x1; z3=x0-x1;                 s.s3='(c) C0 minus C9;';
s.lon(1)=0; s.lon(end)=360; s.lat(1)=-90; s.lat(end)=90;
s.unit='(%)'; 
s.c1=-100;  s.c2=100;  s.vbino=[s.c1:2:s.c2];
s.cmin=-10; s.cmax=10; s.vbin =[s.cmin:1:s.cmax];
fpath='./fig_am4/';  f=0.1; icmap=5;
plot_3panel_mapp_lowcld(s,z1,z2,z3,vname,fpath,expn,f,k,icmap);
%s.lonx=s.lonx-180; s.lmx=circshift(s.lmx,[0 s.nlon/2]);
%s.lon=s.lon-180; nx=length(z1(1,:))/2;
%z1=circshift(z1,[0 nx]); z2=circshift(z2,[0 nx]); z3=circshift(z3,[0 nx]);
plot_3panel_am4(s,z1,z2,z3,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II Fig.8: sensitivity to EIS Bony plot
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
pms=[ 0, 0, 1200, 800]*0.8; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-2; cmax=2; vbin=[cmin:0.2:cmax];
subplot(row,col,1); xmin=-130; xmax=90;
plot(ob,p1,'-r*'); hold on; 
plot(ob,p2,'-bs'); hold on; 
plot(ob,po,'-ko'); hold on; 
legend('C0','C9','ERA-interim',2); legend boxoff;
xlabel('\omega_{500} (hPa/day)','FontSize',fsize); 
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
legend('C0','C9','ERA-interim + CERES-EBAF-ed2.8',2); legend boxoff;
xlabel('\omega_{500} (hPa/day)','FontSize',fsize); 
ylabel('LW CRE (W/m^2)', 'FontSize',fsize);
xy=[xmin xmax 0 130]; mylabel(xy,1,'(b)',fsize); 
set(gca,'FontSize',fsize); 
subplot(row,col,3);
plot(ob,y1,'-r*'); hold on; 
plot(ob,y2,'-bs'); hold on; 
plot(ob,yo,'-ko'); hold on; 
for i=1:length(ob)
  plot([ob(i) ob(i)],[yo(i)-dy(i) yo(i)+dy(i)],'-k'); hold on;
end
%legend('C0','C9','ERA-interim + CERES',4)
xlabel('\omega_{500} (hPa/day)','FontSize',fsize); 
ylabel('SW CRE (W/m^2)', 'FontSize',fsize);
xy=[xmin xmax -140 -10]; mylabel(xy,1,'(c)',fsize); 
set(gca,'FontSize',fsize); 
subplot(row,col,4); 
plot(ob,z1,'-r*'); hold on; 
plot(ob,z2,'-bs'); hold on; 
plot(ob,zo,'-ko'); hold on; 
for i=1:length(ob)
  plot([ob(i) ob(i)],[zo(i)-dz(i) zo(i)+dz(i)],'-k'); hold on;
end
%legend('C0','C9','ERA-interim + CERES',2)
xlabel('\omega_{500} (hPa/day)','FontSize',fsize); 
ylabel('total CRE (W/m^2)', 'FontSize',fsize);
xy=[xmin xmax -60 20]; mylabel(xy,1,'(d)',fsize); 
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II Fig.9-12: Baoqiang Xiang plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II Fig.13: Isaac plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II Fig.14: precip boxplot plot comparison with CMIP5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II Fig.15: SWABS boxplot plot comparison with CMIP5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II Fig.16: OLR boxplot plot comparison with CMIP5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Start of AM4 paper Part II - Figures in Supplementary Maaterial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II - Suppl Fig.S1: W-K sensitivity plot in xx.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II - Suppl Fig.S2: precipitation sensitivity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
vname='pcp_blue'; k=1; s.unit='mm/day';
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.sfc.pcp.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c5.sfc.pcp.sea(k,:,:)); s.s1='(a) C5 minus C0';
x2=squeeze(am4.c6.sfc.pcp.sea(k,:,:)); s.s2='(b) C6 minus C0';
x3=squeeze(am4.c7.sfc.pcp.sea(k,:,:)); s.s3='(c) C7 minus C0';
x4=squeeze(am4.c8.sfc.pcp.sea(k,:,:)); s.s4='(d) C8 minus C0';
z1=x1-x0; z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-1.5; cmax=1.5; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='am4sen_cfrac'; f=1; 
plot_4panel_mapp(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,2);
%plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II - Suppl Fig.S2: precipitation sensitivity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
s0=expn; s0(s0=='_')='-';
vname='pcp_green'; k=1; s.unit='mm/day';
xo=squeeze(o.sfc.pcp.sea(k,:,:));
x0=squeeze(am4.c0.sfc.pcp.sea(k,:,:)); s.s0='AM4.0-C0 (ANN)';
x1=squeeze(am4.c5.sfc.pcp.sea(k,:,:)); s.s1='(a) C5 minus C0';
x2=squeeze(am4.c6.sfc.pcp.sea(k,:,:)); s.s2='(b) C6 minus C0';
x3=squeeze(am4.c7.sfc.pcp.sea(k,:,:)); s.s3='(c) C7 minus C0';
x4=squeeze(am4.c8.sfc.pcp.sea(k,:,:)); s.s4='(d) C8 minus C0';
z1=x1-x0; z2=x2-x0; z3=x3-x0; z4=x4-x0;
cmin=-1.5; cmax=1.5; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='am4sen_cfrac'; f=1; 
plot_4panel_mapp(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,4);
%plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II - Suppl Fig.S3: sensitivity of ZMT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmt'; vname=varn; expn='am4sen_cfrac';
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4.c0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=am4.C0; [z0 b0 rms0]=vslice(v,s,k,varn,'obs',mv); s.s0='AM4.0-C0 (ANN)';
v=am4.c5; [z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv); s.s1='(a) C5 minus C0';
v=am4.c6; [z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv); s.s2='(b) C6 minus C0';
v=am4.c7; [z3 b3 rms3]=vslice(v,s,k,varn,'mod',mv); s.s3='(c) C7 minus C0';
v=am4.c8; [z4 b4 rms4]=vslice(v,s,k,varn,'mod',mv); s.s4='(d) C8 minus C0';
id=isnan(z1); zo(id)=NaN; b1(id)=NaN; %b2(id)=NaN; b3(id)=NaN;
z1=z1-z0; z2=z2-z0; z3=z3-z0; z4=z4-z0; s.vlab=[-1:0.2:1];
s.lat=lat; s.pf=pf; s.xy=[-90 90 100 1000]; s.unit='(C)';
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/10:cmax];
fpath='./fig_am4/'; f=1;
plot_4panel_zmean(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; c1=-1; c2=1; vbin=[c1:0.2:c2];
subplot(row,col,1); z1(z1<-1)=-1;
[C,h]=contourf(lat,pf,z1,vbin); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h); 
nn=64; cmap=jet(nn); colormap(cmap);
mt=strcat('(a) C5 minus C0'); title(mt,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy); set(gca,'yDir','reverse'); 
subplot(row,col,2); 
[C,h]=contourf(lat,pf,z2,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
s=sprintf('(b) C6 minus C0'); title(s,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy); set(gca,'yDir','reverse');
subplot(row,col,3); 
[C,h]=contourf(lat,pf,z3,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
s=sprintf('(c) C7 minus C0'); title(s,'FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy); set(gca,'yDir','reverse');
subplot(row,col,4); 
[C,h]=contourf(lat,pf,z4,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
s=sprintf('(d) C8 minus C0'); title(s,'FontSize',fsize); 
set(gca,'FontSize',fsize); axis(xy); set(gca,'yDir','reverse');
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II suppl Fig.S4: sensitivity of WK to cfrac (am4part1_mjo_wk.m)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II suppl Fig.S5: change in low cloud amount
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=am4.c0; s=z.s; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0; s.nlon=z.nlon
s0=expn; s0(s0=='_')='-';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dqal'; k=1; vname=strcat('eis_',vname); expn='AM4sen';
xo=squeeze(o.atm.qal.sea(k,:,:))*100.;
x1=squeeze(am4.c0.atm.qal.sea(k,:,:)); 
x2=squeeze(am4.w0.atm.qal.sea(k,:,:)); s.s1='(a) C0 (P2K-CNTL)';
x3=squeeze(am4.c9.atm.qal.sea(k,:,:)); s.s2='(b) C9 (P2K-CNTL)';
x4=squeeze(am4.w9.atm.qal.sea(k,:,:)); s.s3='(c) (a) minus (b)';
z1=x2-x1; z2=x4-x3; z3=z1-z2;
s.lon(1)=0; s.lon(end)=360; s.lat(1)=-90; s.lat(end)=90;
s.unit='(%)'; 
s.c1=-10;  s.c2=10;  s.vbino=[s.c1:1:s.c2];
s.cmin=-5; s.cmax=5; s.vbin =[s.cmin:1:s.cmax];
fpath='./fig_am4/'; f=0.1; icmap=1;
plot_3panel_mapp_lowcld(s,z1,z2,z3,vname,fpath,expn,f,k,icmap);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s.lonx=s.lonx-180; s.lmx=circshift(s.lmx,[0 s.nlon/2]);
s.lon=s.lon-180; nx=length(z1(1,:))/2;
z1=circshift(z1,[0 nx]); z2=circshift(z2,[0 nx]); z3=circshift(z3,[0 nx]);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='am4sen'; f=0.5; ncolor=64
plot_3panel_am4(s,z1,z2,z3,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II suppl Fig.S6: change in CRE Bony plot
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
pms=[ 0, 0, 1200, 800]*0.8; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-2; cmax=2; vbin=[cmin:0.2:cmax];
subplot(row,col,1); xmin=-130; xmax=90;
plot(ob,p2-p1,'-r*'); hold on; 
plot(ob,p4-p3,'-bs'); hold on; 
legend('C0','C9',2); legend boxoff; %grid on;
xlabel('\omega_{500} (hPa/day)','FontSize',fsize); 
ylabel('\Delta PDF(\omega_{500})', 'FontSize',fsize);
xy=[xmin xmax -0.04 0.04]; mylabel(xy,1,'(a)',fsize); 
set(gca,'FontSize',fsize); 
subplot(row,col,2); 
plot(ob,x2-x1,'-r*'); hold on; 
plot(ob,x4-x3,'-bs'); hold on; 
%legend('C0','C9',3); grid on;
xlabel('\omega_{500} (hPa/day)','FontSize',fsize); 
ylabel('LW CRE (W/m2)', 'FontSize',fsize);
xy=[xmin xmax -10 5]; mylabel(xy,1,'(b)',fsize); 
set(gca,'FontSize',fsize); 
subplot(row,col,3);
plot(ob,y2-y1,'-r*'); hold on; 
plot(ob,y4-y3,'-bs'); hold on; 
%legend('C0','C9',2); grid on;
xlabel('\omega_{500} (hPa/day)','FontSize',fsize); 
ylabel('SW CRE (W/m2)', 'FontSize',fsize);
xy=[xmin xmax -10 5]; mylabel(xy,1,'(c)',fsize); 
set(gca,'FontSize',fsize); 
subplot(row,col,4); 
plot(ob,z2-z1,'-r*'); hold on; 
plot(ob,z4-z3,'-bs'); hold on; 
%legend('C0','C9',2); grid on;
xlabel('\omega_{500} (hPa/day)','FontSize',fsize); 
ylabel('total CRE (W/m2)', 'FontSize',fsize);
xy=[xmin xmax -10 5]; mylabel(xy,1,'(d)',fsize); 
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_am4/'; expn='am4sen'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper Part II suppl Fig.S7-9: Baoqiang Xiang
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
