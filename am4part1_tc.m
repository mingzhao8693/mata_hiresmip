%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.23-25: TC statistics, preprocess
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/miz/awg/warsaw/';
epath='/analysis/tropical_storms_wsfc/';
expn ='c96L33_am4p0'; fn=strcat(tpath,expn,epath,expn,'_traj.mat');
vm0=regionstat_ibtracs(fn,'mod');
expn ='c96L33_am4p0_m1'; fn=strcat(tpath,expn,epath,expn,'_traj.mat');
vm1=regionstat_ibtracs(fn,'mod');
expn ='c96L33_am4p0_m2'; fn=strcat(tpath,expn,epath,expn,'_traj.mat');
vm2=regionstat_ibtracs(fn,'mod');
expn ='c96L33_am4p0_m3'; fn=strcat(tpath,expn,epath,expn,'_traj.mat');
vm3=regionstat_ibtracs(fn,'mod');
expn ='c96L33_am4p0_m4'; fn=strcat(tpath,expn,epath,expn,'_traj.mat');
vm4=regionstat_ibtracs(fn,'mod');
expn ='c96L33_am4p0_m5'; fn=strcat(tpath,expn,epath,expn,'_traj.mat');
vm5=regionstat_ibtracs(fn,'mod');
expn ='AM4p0'; fn=strcat(tpath,expn,epath,expn,'_traj.mat'); load(fn)
vm6=regionstat_ibtracs(fn,'mod'); vo=regionstat_ibtracs(fn,'obs');
expn ='c96L33_am4p0_initCond2'; fn=strcat(tpath,expn,epath,expn,'_traj.mat');
vm7=regionstat_ibtracs(fn,'mod');
v.vo=vo; v.vm0=vm0; v.vm1=vm1; v.vm2=vm2;
v.vm3=vm3; v.vm4=vm4; v.vm5=vm5; v.vm6=vm6; v.vm7=vm7;
fn=strcat('/work/miz/mat_am4p0/tstorm_ana.mat'); save(fn,'v');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.23-25: load preprocessed mat file and plotting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_am4p0/tstorm_ana.mat'); load(fn,'v');
vo=v.vo; vm0=v.vm0; vm1=v.vm1; vm2=v.vm2;
vm3=v.vm3; vm4=v.vm4; vm5=v.vm5; vm6=v.vm6; vm7=v.vm7;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.23: TC genesis frequency
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vo.gs_stm_ann =squeeze(mean(vo.gs_stm,1));  vo.gs_stm_ann0 =sum(sum(vo.gs_stm_ann));
vo.fq_stm_ann =squeeze(mean(vo.fq_stm,1));  vo.fq_stm_ann0 =sum(sum(vo.fq_stm_ann));
vm0.gs_stm_ann=squeeze(mean(vm0.gs_stm,1)); vm0.gs_stm_ann0=sum(sum(vm0.gs_stm_ann));
vm0.fq_stm_ann=squeeze(mean(vm0.fq_stm,1)); vm0.fq_stm_ann0=sum(sum(vm0.fq_stm_ann));
vm1.gs_stm_ann=squeeze(mean(vm1.gs_stm,1)); vm1.gs_stm_ann0=sum(sum(vm1.gs_stm_ann));
vm1.fq_stm_ann=squeeze(mean(vm1.fq_stm,1)); vm1.fq_stm_ann0=sum(sum(vm1.fq_stm_ann));
vm2.gs_stm_ann=squeeze(mean(vm2.gs_stm,1)); vm2.gs_stm_ann0=sum(sum(vm2.gs_stm_ann));
vm2.fq_stm_ann=squeeze(mean(vm2.fq_stm,1)); vm2.fq_stm_ann0=sum(sum(vm2.fq_stm_ann));
vm3.gs_stm_ann=squeeze(mean(vm3.gs_stm,1)); vm3.gs_stm_ann0=sum(sum(vm3.gs_stm_ann));
vm3.fq_stm_ann=squeeze(mean(vm3.fq_stm,1)); vm3.fq_stm_ann0=sum(sum(vm3.fq_stm_ann));
vm4.gs_stm_ann=squeeze(mean(vm4.gs_stm,1)); vm4.gs_stm_ann0=sum(sum(vm4.gs_stm_ann));
vm4.fq_stm_ann=squeeze(mean(vm4.fq_stm,1)); vm4.fq_stm_ann0=sum(sum(vm4.fq_stm_ann));
vm5.gs_stm_ann=squeeze(mean(vm5.gs_stm,1)); vm5.gs_stm_ann0=sum(sum(vm5.gs_stm_ann));
vm5.fq_stm_ann=squeeze(mean(vm5.fq_stm,1)); vm5.fq_stm_ann0=sum(sum(vm5.fq_stm_ann));
vm6.gs_stm_ann=squeeze(mean(vm6.gs_stm,1)); vm6.gs_stm_ann0=sum(sum(vm6.gs_stm_ann));
vm6.fq_stm_ann=squeeze(mean(vm6.fq_stm,1)); vm6.fq_stm_ann0=sum(sum(vm6.fq_stm_ann));
vm7.gs_stm_ann=squeeze(mean(vm7.gs_stm,1)); vm7.gs_stm_ann0=sum(sum(vm7.gs_stm_ann));
vm7.fq_stm_ann=squeeze(mean(vm7.fq_stm,1)); vm7.fq_stm_ann0=sum(sum(vm7.fq_stm_ann));
vm.fq_stm_ann =...
    (vm0.fq_stm_ann+vm1.fq_stm_ann+vm2.fq_stm_ann+vm3.fq_stm_ann+...
     vm4.fq_stm_ann+vm5.fq_stm_ann+vm6.fq_stm_ann+vm7.fq_stm_ann)/8;
vm.gs_stm_ann =...
    (vm0.gs_stm_ann+vm1.gs_stm_ann+vm2.gs_stm_ann+vm3.gs_stm_ann+...
     vm4.gs_stm_ann+vm5.gs_stm_ann+vm6.gs_stm_ann+vm7.gs_stm_ann)/8;
vm.gs_stm_no =[vm0.gs_stm_ann0 vm1.gs_stm_ann0 vm2.gs_stm_ann0 vm3.gs_stm_ann0 ...
	      vm4.gs_stm_ann0 vm5.gs_stm_ann0 vm6.gs_stm_ann0 vm7.gs_stm_ann0];
vm.gs_stm_ann0=mean(vm.gs_stm_no);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
latx=vm0.lat; lonx=vm0.lon; lm=vm0.lm; xy=[0 360 -90 90];
lon=vo.lonfq; lat=vo.latfq; fsize=12; lw=1; 
lat(1)=-60; lat(end)=60; lon(1)=0; lon(end)=360;
c1  =-0.8; c2  =0.8; vbino=[c1:(c2-c1)/50:c2]; unit=''; icmap=1;
cmin=-0.8; cmax=0.8; vbin =[cmin:(cmax-cmin)/50:cmax]; varn='SGS';
pms=[ 0, 0, 800, 1100]*0.8; fsize=10; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on'); domap='noprojection'; 
x0=0.08; y0=0.7; wx=0.8; wy=0.25-0.08; dy=0.06;
p1= [x0,y0,           wx, wy];%position of first subplot
p2= [x0,y0-wy-dy,     wx, wy];%position of first subplot
p3= [x0,y0-2*(wy+dy), wx, wy];%position of first subplot
nn=64; caxis([cmin cmax]); cmap1=bluewhitered(nn);
caxis([c1 c2]);
if (icmap==0)
  cmap=fabien_colormap(nn);
elseif (icmap==1) 
  cmap=bluewhitered(nn);
elseif (icmap==2)
  cmap =cbrewer('seq', 'BuGn', nn);
  cmap1=cbrewer('div', 'BrBG', nn); cmap=cmap1;
else
  cmap=jet(nn); %cmap(nn/2:nn/2+1,:)=1;
end
pos1=[0.85 0.23 0.02 0.6];%[left bottom width height];
pos2=[0.85 0.11 0.02 0.22];%[left bottom width height];

row=3; col=1; domap='noprojection'; domap='robinson'; 
subplot('Position',p1); a=vm.gs_stm_ann;%pcolor(lon,lat,a); shading flat; colorbar; caxis([c1 c2])
do_mapproj(lat,lon,a,vbin,latx,lonx,lm,domap,xy); 
caxis([c1 c2]); colormap(cmap1); %freezeColors; 
%h=colorbar('Location','eastoutside','Position',pos1); %cbfreeze(h,cmap);
s=sprintf('(a) annual TC genesis frequency (AM4.0, MEAN=%3.1f/yr)',vm.gs_stm_ann0);
title(s,'FontSize',fsize); 
  
subplot('Position',p2); a=vo.gs_stm_ann;
do_mapproj(lat,lon,a,vbin,latx,lonx,lm,domap,xy); %clabel(C,h); 
caxis([c1 c2]); colormap(cmap1); %freezeColors; 
%h=colorbar('Location','eastoutside','Position',pos1); %cbfreeze(h,cmap);
s=sprintf('(b) annual TC genesis frequency (IBTRAC, MEAN=%3.1f/yr)',vo.gs_stm_ann0);
title(s,'FontSize',fsize);

subplot('Position',p3); a=vm.gs_stm_ann-vo.gs_stm_ann; a(a<cmin)=cmin;
do_mapproj(lat,lon,a,vbin,latx,lonx,lm,domap,xy); %clabel(C,h); 
caxis([cmin cmax]); colormap(cmap1); %freezeColors; 
%h=colorbar('Location','eastoutside','Position',pos2); %cbfreeze(h,cmap);
s=sprintf('(c) AM4.0 minus IBTRAC (MEAN=%4.2f/yr)',vm.gs_stm_ann0-vo.gs_stm_ann0);
title(s,'FontSize',fsize); colormap(bluewhitered(nn));
pos1=[0.22 0.21 0.52 0.015];%[left bottom width height];
h=colorbar('Location','southoutside','Position',pos1); %cbfreeze(h,cmap);

visfig='off'; figpath='./fig_am4/'; expn='AM4p0';
vname=strcat(varn,'_',domap);
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
latx=vm0.lat; lonx=vm0.lon; lm=vm0.lm; xy=[0 360 -90 90];
lon=vo.lonfq; lat=vo.latfq; fsize=12; lw=1; 
lat(1)=-60; lat(end)=60; lon(1)=0; lon(end)=360;
pms=[ 0, 0, 700,  1000]; visfig='on';
handle = figure('Position', pms,'visible',visfig);
nn=64; cmap=jet(nn); cmap(nn/2:nn/2+1,:)=1; colormap(cmap);
xl='longitude'; yl='latitude'; xy=[0 360 -60 60];
lon=vo.lonfq; lat=vo.latfq; fsize=12; lw=1; 
cmin=-1; cmax=1; vbin=[cmin:(cmax-cmin)/10:cmax]; varn='SGS';
row=3; col=1;
subplot(row,col,1)
pcolor(lon,lat,vm.gs_stm_ann); hold on; shading flat; colorbar;
contour (lonx,latx,lm,1,'-k','LineWidth',lw); colorbar;
caxis([cmin cmax]); axis(xy); set (gca,'FontSize',fsize);
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
s=sprintf('(a) annual TC genesis frequency (AM4.0, MEAN=%3.1f/yr)',vm.gs_stm_ann0);
title(s,'FontSize',fsize);
subplot(row,col,2)
pcolor(lon,lat,vo.gs_stm_ann); hold on; shading flat; colorbar;
contour (lonx,latx,lm,1,'-k','LineWidth',lw); colorbar;
caxis([cmin cmax]); axis(xy); set (gca,'FontSize',fsize);
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
s=sprintf('(b) annual TC genesis frequency (IBTRAC, MEAN=%3.1f/yr)',vo.gs_stm_ann0);
title(s,'FontSize',fsize);
subplot(row,col,3)
pcolor(lon,lat,vm.gs_stm_ann-vo.gs_stm_ann); hold on; shading flat; colorbar;
contour (lonx,latx,lm,1,'-k','LineWidth',lw); colorbar;
caxis([cmin cmax]); axis(xy); set (gca,'FontSize',fsize);
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
s=sprintf('(c) AM4.0 minus IBTRAC (MEAN=%4.2f/yr)',vm.gs_stm_ann0-vo.gs_stm_ann0);
title(s,'FontSize',fsize); %colormap(bluewhitered(nn));
figpath='./fig_am4/'; visfig='off'; expn='AM4p0'; vname='tc_gsfq'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.24: TC seasonal cycle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 800, 900]; fsize=12; lw=2; 
handle = figure('Position', pms,'visible','on'); msize=6;
row=3; col=2; x=[1:12]; xy=[1 12 0 0.4]; 
subplot(row,col,1); m=2; yo=vo.cat0sea(m,:);
y0=vm0.cat0sea(m,:); y1=vm1.cat0sea(m,:); y2=vm2.cat0sea(m,:); y3=vm3.cat0sea(m,:); 
y4=vm4.cat0sea(m,:); y5=vm5.cat0sea(m,:); y6=vm6.cat0sea(m,:); y7=vm7.cat0sea(m,:); 
var=[y0; y1; y2; y3; y4; y5; y6; y7]'; ym=get_meanmaxmin(var,x); a=sum(ym.mean);
plot (x,ym.mean/a,'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,yo/sum(yo),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
shadedplot(x,ym.min/a, ym.max/a,[0.7 0.7 0.7],'k');  hold on;
plot (x,ym.mean/a,'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,yo/sum(yo),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
legend('AM4.0','IBTRACS',2);
axis(xy); ylabel('normalized TC frequency','FontSize',fsize); 
set(gca,'FontSize',fsize); title('North Atlantic','FontSize',fsize);
subplot(row,col,3); m=5; yo=vo.cat0sea(m,:); 
y0=vm0.cat0sea(m,:); y1=vm1.cat0sea(m,:); y2=vm2.cat0sea(m,:); y3=vm3.cat0sea(m,:); 
y4=vm4.cat0sea(m,:); y5=vm5.cat0sea(m,:); y6=vm6.cat0sea(m,:); y7=vm7.cat0sea(m,:); 
var=[y0; y1; y2; y3; y4; y5; y6; y7]'; ym=get_meanmaxmin(var,x); a=sum(ym.mean);
plot (x,ym.mean/a,'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,yo/sum(yo),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
shadedplot(x,ym.min/a, ym.max/a,[0.7 0.7 0.7],'k');  hold on;
plot (x,ym.mean/a,'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,yo/sum(yo),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
axis(xy); ylabel('normalized TC frequency','FontSize',fsize); 
set(gca,'FontSize',fsize); title('East Pacific','FontSize',fsize);
subplot(row,col,5); m=4; yo=vo.cat0sea(m,:);
y0=vm0.cat0sea(m,:); y1=vm1.cat0sea(m,:); y2=vm2.cat0sea(m,:); y3=vm3.cat0sea(m,:); 
y4=vm4.cat0sea(m,:); y5=vm5.cat0sea(m,:); y6=vm6.cat0sea(m,:); y7=vm7.cat0sea(m,:); 
var=[y0; y1; y2; y3; y4; y5; y6; y7]'; ym=get_meanmaxmin(var,x); a=sum(ym.mean);
plot (x,ym.mean/a,'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,yo/sum(yo),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
shadedplot(x,ym.min/a, ym.max/a,[0.7 0.7 0.7],'k');  hold on;
plot (x,ym.mean/a,'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,yo/sum(yo),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
axis(xy); ylabel('normalized TC frequency','FontSize',fsize); 
set(gca,'FontSize',fsize); title('West Pacific','FontSize',fsize);
subplot(row,col,2); m=6; yo=vo.cat0sea(m,:);
y0=vm0.cat0sea(m,:); y1=vm1.cat0sea(m,:); y2=vm2.cat0sea(m,:); y3=vm3.cat0sea(m,:); 
y4=vm4.cat0sea(m,:); y5=vm5.cat0sea(m,:); y6=vm6.cat0sea(m,:); y7=vm7.cat0sea(m,:); 
var=[y0; y1; y2; y3; y4; y5; y6; y7]'; ym=get_meanmaxmin(var,x); a=sum(ym.mean);
plot (x,ym.mean/a,'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,yo/sum(yo),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
shadedplot(x,ym.min/a, ym.max/a,[0.7 0.7 0.7],'k');  hold on;
plot (x,ym.mean/a,'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,yo/sum(yo),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
axis(xy); ylabel('normalized TC frequency','FontSize',fsize); 
set(gca,'FontSize',fsize); title('North Indian','FontSize',fsize);
subplot(row,col,4); m=7; yo=vo.cat0sea(m,:);
y0=vm0.cat0sea(m,:); y1=vm1.cat0sea(m,:); y2=vm2.cat0sea(m,:); y3=vm3.cat0sea(m,:); 
y4=vm4.cat0sea(m,:); y5=vm5.cat0sea(m,:); y6=vm6.cat0sea(m,:); y7=vm7.cat0sea(m,:); 
var=[y0; y1; y2; y3; y4; y5; y6; y7]'; ym=get_meanmaxmin(var,x); a=sum(ym.mean);
plot (x,ym.mean/a,'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,yo/sum(yo),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
shadedplot(x,ym.min/a, ym.max/a,[0.7 0.7 0.7],'k');  hold on;
plot (x,ym.mean/a,'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,yo/sum(yo),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
axis(xy); ylabel('normalized TC frequency','FontSize',fsize); 
set(gca,'FontSize',fsize); title('South Indian','FontSize',fsize);
subplot(row,col,6); m=8; yo=vo.cat0sea(m,:);
y0=vm0.cat0sea(m,:); y1=vm1.cat0sea(m,:); y2=vm2.cat0sea(m,:); y3=vm3.cat0sea(m,:); 
y4=vm4.cat0sea(m,:); y5=vm5.cat0sea(m,:); y6=vm6.cat0sea(m,:); y7=vm7.cat0sea(m,:); 
var=[y0; y1; y2; y3; y4; y5; y6; y7]'; ym=get_meanmaxmin(var,x); a=sum(ym.mean);
plot (x,ym.mean/a,'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,yo/sum(yo),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
shadedplot(x,ym.min/a, ym.max/a,[0.7 0.7 0.7],'k');  hold on;
plot (x,ym.mean/a,'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,yo/sum(yo),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
axis(xy); ylabel('normalized TC frequency','FontSize',fsize); 
set(gca,'FontSize',fsize); title('South Pacific','FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='AM4p0',vname='tc_sea_cycle';
printit(visfig,figpath,expn,vname)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.24: TC interannual variability
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yr=[1980:2014]; %normalization to observation
for m=1:vm0.nbox
  yo=vo.cat0num(m,:);
  y0=vm0.cat0num(m,:); 
  y1=vm1.cat0num(m,:); 
  y2=vm2.cat0num(m,:); 
  y3=vm3.cat0num(m,:);
  y4=vm4.cat0num(m,:); 
  y5=vm5.cat0num(m,:); 
  y6=vm6.cat0num(m,:); 
  y7=vm7.cat0num(m,:);
  var=[y0; y1; y2; y3; y4; y5; y6; y7]'; 
  ym=get_meanmaxmin(var,yr);
  b(m)=sum(yo)/sum(ym.mean);
  vm.cat0num(m,:)  =ym.mean; 
  vm.cat0min(m,:)  =ym.min;
  vm.cat0max(m,:)  =ym.max;
  vm.cat0norm(m,:) =ym.mean*b(m);
  vm.catnmin(m,:)  =ym.min *b(m);
  vm.catnmax(m,:)  =ym.max *b(m);
  vm0.cat0norm(m,:)=y0*b(m);
  vm1.cat0norm(m,:)=y1*b(m);
  vm2.cat0norm(m,:)=y2*b(m);
  vm3.cat0norm(m,:)=y3*b(m);
  vm4.cat0norm(m,:)=y4*b(m);
  vm5.cat0norm(m,:)=y5*b(m);
  vm6.cat0norm(m,:)=y6*b(m);
  vm7.cat0norm(m,:)=y7*b(m);
end
m=2; corrcoef(vm.cat0num(m,:),vo.cat0num(m,:))
m=5; corrcoef(vm.cat0num(m,:),vo.cat0num(m,:))
m=4; corrcoef(vm.cat0num(m,:),vo.cat0num(m,:))
vx=vm7;
m=2; corrcoef(vx.cat0num(m,:),vo.cat0num(m,:))
m=5; corrcoef(vx.cat0num(m,:),vo.cat0num(m,:))
m=4; corrcoef(vx.cat0num(m,:),vo.cat0num(m,:))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t1=1; t2=35; %NA normalized%
na=[11 12 6 4 13 11 6 7 12 11 14 8 7 8 7 19 13 8 14 12 15 15 12 16 15 28 10 15 16 9 19 19 19 14 8]
pms=[ 0, 0, 600, 1500]; fsize=10; lw=1; x=vm0.tyear(t1:t2);
handle = figure('Position', pms,'visible','on'); msize=5;
row=3; col=1;
subplot(row,col,1); m=2;
plot (x,vm.cat0norm(m,t1:t2),'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,vo.cat0num (m,t1:t2),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
shadedplot(x,vm.catnmin(m,:),vm.catnmax(m,:),[0.7 0.7 0.7],'k');  hold on;
plot (x,vm.cat0norm(m,t1:t2),'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,vo.cat0num (m,t1:t2),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
c1=corrcoef(vm.cat0num(m,t1:t2),vo.cat0num(m,t1:t2));
b1=mean(vm.cat0num(m,t1:t2)-vo.cat0num(m,t1:t2));
e1=vm.cat0norm(m,t1:t2)-vo.cat0num(m,t1:t2); rms1=sqrt(mean(e1.*e1))
s1=sprintf('AM4.0 (corr=%4.2f; rmse=%4.2f)',c1(1,2),rms1); legend(s1,'IBTRACS',2); 
axis([1980 2014 0 40]); xlabel('year','FontSize',fsize);
ylabel('annual number of tropical cyclones','FontSize',fsize); 
set(gca,'FontSize',fsize); title('(a) North Atlantic');
subplot(row,col,2); m=5;
plot (x,vm.cat0norm(m,t1:t2),'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,vo.cat0num (m,t1:t2),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
shadedplot(x,vm.catnmin(m,:),vm.catnmax(m,:),[0.7 0.7 0.7],'k');  hold on;
plot (x,vm.cat0norm(m,t1:t2),'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,vo.cat0num (m,t1:t2),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
c1=corrcoef(vm.cat0num(m,t1:t2),vo.cat0num(m,t1:t2));
b1=mean(vm.cat0num(m,t1:t2)-vo.cat0num(m,t1:t2));
e1=vm.cat0norm(m,t1:t2)-vo.cat0num(m,t1:t2); rms1=sqrt(mean(e1.*e1))
s1=sprintf('AM4.0 (corr=%4.2f; rmse=%4.2f)',c1(1,2),rms1); legend(s1,'IBTRACS',2); 
axis([1980 2014 0 50]); xlabel('year','FontSize',fsize);
ylabel('annual number of tropical cyclones','FontSize',fsize); 
set(gca,'FontSize',fsize); title('(b) East Pacific');
subplot(row,col,3); m=4;
plot (x,vm.cat0norm(m,t1:t2),'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,vo.cat0num (m,t1:t2),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
shadedplot(x,vm.catnmin(m,:),vm.catnmax(m,:),[0.7 0.7 0.7],'k');  hold on;
plot (x,vm.cat0norm(m,t1:t2),'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,vo.cat0num (m,t1:t2),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
c1=corrcoef(vm.cat0num(m,t1:t2),vo.cat0num(m,t1:t2));
b1=mean(vm.cat0num(m,t1:t2)-vo.cat0num(m,t1:t2));
e1=vm.cat0norm(m,t1:t2)-vo.cat0num(m,t1:t2); rms1=sqrt(mean(e1.*e1))
s1=sprintf('AM4.0 (corr=%4.2f; rmse=%4.2f)',c1(1,2),rms1); legend(s1,'IBTRACS',2); 
axis([1980 2014 0 50]); xlabel('year','FontSize',fsize);
ylabel('annual number of tropical cyclones','FontSize',fsize); 
set(gca,'FontSize',fsize); title('(c) West Pacific'); 
visfig='off'; figpath='./fig_am4/'; expn='AM4p0_tc'; vname='ts'
printit(visfig,figpath,expn,vname)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=2; vname=vm0.box(m).name(1,:); t1=1; t2=35; %NA normalized%
na=[11 12 6 4 13 11 6 7 12 11 14 8 7 8 7 19 13 8 14 12 15 15 12 16 15 28 10 15 16 9 19 19 19 14 8]
pms=[ 0, 0, 1000, 500]; fsize=12; lw=1; x=vm0.tyear(t1:t2);
handle = figure('Position', pms,'visible','on'); msize=10;
plot (x,vm.cat0norm(m,t1:t2),'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,vo.cat0num (m,t1:t2),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
shadedplot(x,vm.catnmin(m,:),vm.catnmax(m,:),[0.7 0.7 0.7],'k');  hold on;
plot (x,vm.cat0norm(m,t1:t2),'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,vo.cat0num (m,t1:t2),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
c1=corrcoef(vm.cat0num(m,t1:t2),vo.cat0num(m,t1:t2));
b1=mean(vm.cat0num(m,t1:t2)-vo.cat0num(m,t1:t2));
e1=vm.cat0norm(m,t1:t2)-vo.cat0num(m,t1:t2); rms1=sqrt(mean(e1.*e1))
s1=sprintf('AM4.0 (corr=%4.2f; rmse=%4.2f)',c1(1,2),rms1); legend(s1,'IBTRACS',2); 
axis([1980 2014 0 35]); xlabel('year','FontSize',fsize);
ylabel('annual number of tropical cyclones','FontSize',fsize); 
set(gca,'FontSize',fsize); title('North Atlantic');
visfig='off'; figpath='./fig_am4/'; expn='AM4p0_tc';
printit(visfig,figpath,expn,vname)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=5; vname=vm0.box(m).name(1,:); t1=1; t2=35; %EP normalized
pms=[ 0, 0, 1000, 500]; fsize=12; lw=1; x=vm0.tyear(t1:t2);
handle = figure('Position', pms,'visible','on'); msize=10;
plot (x,vm.cat0norm(m,t1:t2),'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,vo.cat0num (m,t1:t2),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
shadedplot(x,vm.catnmin(m,:),vm.catnmax(m,:),[0.7 0.7 0.7],'k');  hold on;
plot (x,vm.cat0norm(m,t1:t2),'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,vo.cat0num (m,t1:t2),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
c1=corrcoef(vm.cat0num(m,t1:t2),vo.cat0num(m,t1:t2));
b1=mean(vm.cat0num(m,t1:t2)-vo.cat0num(m,t1:t2));
e1=vm.cat0norm(m,t1:t2)-vo.cat0num(m,t1:t2); rms1=sqrt(mean(e1.*e1))
s1=sprintf('AM4.0 (corr=%4.2f; rmse=%4.2f)',c1(1,2),rms1); legend(s1,'IBTRACS',2); 
axis([1980 2014 0 50]); xlabel('year','FontSize',fsize); 
ylabel('annual number of tropical cyclones','FontSize',fsize); 
set(gca,'FontSize',fsize); 
title(vm0.box(m).name(1,:)); title('East Pacific');
visfig='off'; figpath='./fig_am4/'; expn='AM4p0_tc';
printit(visfig,figpath,expn,vname)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=4; vname=vm0.box(m).name(1,:); t1=1; t2=35; %WP
pms=[ 0, 0, 1000, 500]; fsize=12; lw=1; x=vm0.tyear(t1:t2);
handle = figure('Position', pms,'visible','on'); msize=10;
plot (x,vm.cat0norm(m,t1:t2),'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,vo.cat0num (m,t1:t2),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
shadedplot(x,vm.catnmin(m,:),vm.catnmax(m,:),[0.7 0.7 0.7],'k');  hold on;
plot (x,vm.cat0norm(m,t1:t2),'k*-','LineWidth',lw,'MarkerSize',msize); hold on;
plot (x,vo.cat0num (m,t1:t2),'rs-','LineWidth',lw,'MarkerSize',msize); hold on;
c1=corrcoef(vm.cat0num(m,t1:t2),vo.cat0num(m,t1:t2));
b1=mean(vm.cat0num(m,t1:t2)-vo.cat0num(m,t1:t2));
e1=vm.cat0norm(m,t1:t2)-vo.cat0num(m,t1:t2); rms1=sqrt(mean(e1.*e1))
s1=sprintf('AM4.0 (corr=%4.2f; rmse=%4.2f)',c1(1,2),rms1); legend(s1,'IBTRACS',2); 
axis([1980 2014 0 50]); xlabel('year','FontSize',fsize);
ylabel('annual number of tropical cyclones','FontSize',fsize); 
set(gca,'FontSize',fsize); title('West Pacific');
visfig='off'; figpath='./fig_am4/'; expn='AM4p0_tc';
printit(visfig,figpath,expn,vname)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

