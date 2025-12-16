function plot_4panel_zmean_cm4(k,v,s,z1,zo,b1,b2,icmap)
id=(s.lm0>0); a=NaN; %z1(id)=NaN; zo(id)=a; b1(id)=a; b2(id)=a; b3(id)=a;
lat=s.lat; lon=s.lon; pf=v.pf; xy=v.xy; vlab0=v.vlab0; vlab=v.vlab;
latx=v.lat; lonx=v.lon; lm=v.lm0; lm(lm>=0.5)=1; lm(lm<0.5)=0;  
domap='noprojection'; domap='hammer'; domap='robinson'; %domap='eckert4'; 
c1=v.c1;     c2=v.c2;     vbino=v.vbino; expn=v.expn;
cmin=v.cmin; cmax=v.cmax; vbin=v.vbin; 
lat(1)=-90; lat(end)=90;
if isfield(v,'pftic')
  pf=log10(pf); xy=[-90 90 min(pf) max(pf)];
end

pms=[ 0, 0, 1300, 1100]*0.8; fsize=10; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=0.08; y0=0.7; wx=0.38-0.07; wy=0.25-0.05; dx=0.05+0.04; dy=0.05+0.07;
p1= [x0,          y0,           wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,           wx, wy];%position of first subplot
p3= [x0,          y0-wy-dy,     wx, wy];%position of first subplot
p4= [x0+wx+dx,    y0-wy-dy,     wx, wy];%position of first subplot


nn=32; caxis([cmin cmax]); cmap1=bluewhitered(nn);
caxis([c1 c2]);
if (icmap==0)
  cmap=fabien_colormap(nn);
elseif (icmap==1) 
  cmap=bluewhitered(nn);
elseif (icmap==2)
  cmap=cbrewer('div', 'BrBG', nn);
else
  cmap=jet(nn); %cmap(nn/2:nn/2+1,:)=1;
end
pos1=[0.25-0.025 0.69-0.05 0.42 0.015];%[left bottom width height];
pos2=[0.25-0.025 0.39-0.07 0.42 0.015];%[left bottom width height];

subplot('Position',p1); z1(z1<c1)=c1; z1(z1>c2)=c2;
[C,h]=contourf(lat,pf,z1,vbino); shading flat; 
clabel(C,h,vlab0,'Rotation',0); axis(xy); set(gca,'yDir','reverse');
caxis([c1 c2]); colormap(cmap); freezeColors; 
h=colorbar('Location','southoutside','Position',pos1); 
cbunits(h,v.unit); cbfreeze(h,cmap);
if isfield(v,'pftic')
  set(gca,'ytick',v.pftic); set(gca,'yticklabel',v.pflis);
end
xlabel('longitude','FontSize',fsize); ylabel('pressure (hPa)','FontSize',fsize); 
title(v.s1,'FontSize',fsize); set(gca,'FontSize',fsize); box on;


subplot('Position',p2); zo(zo<c1)=c1; zo(zo>c2)=c2;
[C,h]=contourf(lat,pf,zo,vbino); shading flat; 
clabel(C,h,vlab0,'Rotation',0); axis(xy); set(gca,'yDir','reverse');
caxis([c1 c2]); colormap(cmap); freezeColors; 
h=colorbar('Location','southoutside','Position',pos1);
cbunits(h,v.unit); cbfreeze(h,cmap);
if isfield(v,'pftic')
  set(gca,'ytick',v.pftic); set(gca,'yticklabel',v.pflis);
end
xlabel('longitude','FontSize',fsize); ylabel('pressure (hPa)','FontSize',fsize); 
title(v.s2,'FontSize',fsize); set(gca,'FontSize',fsize); box on;

subplot('Position',p3); b1(b1<cmin)=cmin; b1(b1>cmax)=cmax;
[C,h]=contourf(lat,pf,b1,vbin); shading flat;
clabel(C,h,vlab,'Rotation',0); axis(xy); set(gca,'yDir','reverse');
caxis([cmin cmax]); colormap(cmap1); freezeColors;
h=colorbar('Location','southoutside','Position',pos2);
cbunits(h,v.unit); cbfreeze(h,cmap1);
if isfield(v,'pftic')
  set(gca,'ytick',v.pftic); set(gca,'yticklabel',v.pflis);
end
xlabel('longitude','FontSize',fsize); ylabel('pressure (hPa)','FontSize',fsize); 
title(v.s3,'FontSize',fsize); box on;
%colorbar('YTick',[-10,-5,5,10],'YTickLabels',{'-10','-5','5','10'});

subplot('Position',p4); b2(b2<cmin)=cmin; b2(b2>cmax)=cmax;
[C,h]=contourf(lat,pf,b2,vbin); shading flat;
clabel(C,h,vlab,'Rotation',0); axis(xy); set(gca,'yDir','reverse');
caxis([cmin cmax]); 
if isfield(v,'pftic')
  set(gca,'ytick',v.pftic); set(gca,'yticklabel',v.pflis);
end
xlabel('longitude','FontSize',fsize); ylabel('pressure (hPa)','FontSize',fsize); 
title(v.s4,'FontSize',fsize); box on;

warning('off','all');
visfig='off'; figpath='./fig_cm4_new/';
vname=strcat(v.varn,'_',(v.ss{k}),'_zmean');
printit(visfig,figpath,expn,vname);

return
