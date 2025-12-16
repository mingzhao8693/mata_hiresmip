function plot_4panel_mapp_cm4(k,v,s,z1,zo,b1,b2,icmap)
id=(s.lm0>0); a=NaN; %z1(id)=NaN; zo(id)=a; b1(id)=a; b2(id)=a; b3(id)=a;
lat=s.lat; lon=s.lon; xy=[0 360 -90 90]; mv=-999;
latx=v.lat; lonx=v.lon; lm=v.lm0; lm(lm>=0.5)=1; lm(lm<0.5)=0;  
domap='noprojection'; domap='hammer'; domap='robinson'; %domap='eckert4'; 
c1=v.c1;     c2=v.c2;     vbino=v.vbino; expn=v.expn;
cmin=v.cmin; cmax=v.cmax; vbin=v.vbin; 

%pms=[ 0, 0, 1300, 900]*1.; fsize=10; lw=2; msize=8; 
%handle = figure('Position', pms,'visible','on');
%x0=0.08; y0=0.7; wx=0.3; wy=0.25; dx=0.0; dy=0.0;
%p1= [x0,          y0,         wx, wy];%position of first subplot
%p2= [x0+wx+dx,    y0,         wx, wy];%position of first subplot
%p3= [x0,          y0-(wy+dy), wx, wy];%position of first subplot
%p4= [x0+wx+dx,    y0-(wy+dy), wx, wy];%position of first subplot

pms=[ 0, 0, 1300, 1100]*0.8; fsize=9; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=0.08; y0=0.7; wx=0.38; wy=0.25; dx=0.1-0.1; dy=0.05;
p1= [x0,          y0,           wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,           wx, wy];%position of first subplot
p3= [x0,          y0-wy-dy,     wx, wy];%position of first subplot
p4= [x0+wx+dx,    y0-wy-dy,     wx, wy];%position of first subplot

nn=64; caxis([cmin cmax]); cmap1=bluewhitered(nn);
caxis([c1 c2]);
if (icmap==0)
  cmap=fabien_colormap(nn);
elseif (icmap==1) 
  cmap=bluewhitered(nn);
elseif (icmap==2)
  cmap1=flipud(cmap1); cmap=cmap1(nn/2+3:end,:);
elseif (icmap==3)
  cmap =cbrewer('seq', 'BuGn', nn);
  cmap1=cbrewer('div', 'BrBG', nn);
elseif (icmap==4)
  nn=64; caxis([cmin cmax]);
  cmap=cbrewer('div', 'BrBG', nn);
  cmap1=[cmap(1:nn/2-2,:); cmap(nn/2+2:end,:)];
  cmap=cmap(nn/2+2:end,:);
else
  cmap=jet(nn); %cmap(nn/2:nn/2+1,:)=1;
end

subplot('Position',p1); z1(z1<c1)=c1; z1(z1>c2)=c2;
do_mapproj(lat,lon,z1,vbino,latx,lonx,lm,domap,xy); %clabel(C,h); 
caxis([c1 c2]); colormap(cmap); freezeColors; 
pos=[0.25 0.69 0.42 0.015];%[left bottom width height];
h=colorbar('Location','southoutside','Position',pos); cbfreeze(h,cmap);
title(v.s1,'FontSize',fsize);

subplot('Position',p2); zo(zo<c1)=c1; zo(zo>c2)=c2;
do_mapproj(lat,lon,zo,vbino,latx,lonx,lm,domap,xy); 
caxis([c1 c2]); colormap(cmap); freezeColors;
h=colorbar('Location','southoutside','Position',pos); 
cbunits(h,v.unit); cbfreeze(h,cmap);
title(v.s2,'FontSize',fsize);

subplot('Position',p3); b1(b1<cmin)=cmin; b1(b1>cmax)=cmax;
do_mapproj(lat,lon,b1,vbin,latx,lonx,lm,domap,xy);
caxis([cmin cmax]); colormap(cmap1);
pos=[0.25 0.39 0.42 0.015];%[left bottom width height];
h=colorbar('Location','southoutside','Position',pos);
cbunits(h,v.unit); cbfreeze(h,cmap1);
title(v.s3,'FontSize',fsize);

subplot('Position',p4); b2(b2<cmin)=cmin; b2(b2>cmax)=cmax;
do_mapproj(lat,lon,b2,vbin,latx,lonx,lm,domap,xy);
caxis([cmin cmax]); colormap(cmap1); 
h=colorbar('Location','southoutside','Position',pos);
cbunits(h,v.unit); cbfreeze(h,cmap1);
title(v.s4,'FontSize',fsize);

warning('off','all');
visfig='off'; figpath='./fig_cm4_new/'; 
vname=strcat(v.varn,'_',(v.ss{k}),'_',domap);
printit(visfig,figpath,expn,vname);

return
