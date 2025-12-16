function plot_3panel_mapp_lowcld(s,z1,z2,z3,vname,fpath,expn,f,k,icmap);
aa=s.aa;
if (k==1)
  sea='ANN';
elseif(k==2)
  sea='MAM';
elseif(k==3)
  sea='JJA';
elseif(k==4)
  sea='SON';
elseif(k==5)
  sea='DJF';
end
vname=strcat(vname,'_',sea);
a1=mean(mean(z1.*aa)); s.s1=sprintf('%s %s (MEAN=%5.2f)',s.s1,sea,a1);
a2=mean(mean(z2.*aa)); s.s2=sprintf('%s %s (MEAN=%5.2f)',s.s2,sea,a2);
a3=mean(mean(z3.*aa)); s.s3=sprintf('%s %s (MEAN=%5.2f)',s.s3,sea,a3);
lat=s.lat; lon=s.lon; xy=[0 360 -90 90];
latx=s.latx; lonx=s.lonx; lm=s.lmx; lm(lm<=0.5)=0; lm(lm>0.5)=1;
domap='noprojection'; domap='hammer'; domap='robinson'; %domap='eckert4'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 800, 1100]*0.8; fsize=10; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=0.08; y0=0.7; wx=0.8; wy=0.25; dy=0.05; %icmap=5;
p1= [x0,y0,           wx, wy];%position of first subplot
p2= [x0,y0-wy-dy,     wx, wy];%position of first subplot
p3= [x0,y0-2*(wy+dy), wx, wy];%position of first subplot
nn=32; caxis([s.cmin s.cmax]); cmap1=bluewhitered(nn);
caxis([s.c1 s.c2]);
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
pos1=[0.85 0.48 0.02 0.40];%[left bottom width height];
pos2=[0.85 0.11 0.02 0.22];%[left bottom width height];
reg1=[-155  15 40 20];
reg2=[-110 -30 40 20];
reg3=[-55   10 40 20];
reg4=[-25  -27 40 20];
reg5=[75   -38 40 20]; 

row=3; col=1; domap='noprojection'; domap='robinson'; 
subplot('Position',p1); a=z1;
axesm('MapProjection',domap,'origin',[0,0]); framem;
contourfm(lat,lon,a,s.vbino); hold on;
contourm(latx,lonx,lm,'k','LineWidth',1); box off; axis off;
rectanglem(reg1); rectanglem(reg2); rectanglem(reg3); rectanglem(reg4);rectanglem(reg5);
caxis([s.c1 s.c2]); colormap(cmap); freezeColors; 
title(s.s1,'FontSize',fsize);
h=colorbar('Location','eastoutside','Position',pos1); cbfreeze(h,cmap);%cbunits(h,s.unit); 

subplot('Position',p2); a=z2;
axesm('MapProjection',domap,'origin',[0,0]); framem;
contourfm(lat,lon,a,s.vbino); hold on; 
contourm(latx,lonx,lm,'k','LineWidth',1); box off; axis off;
rectanglem(reg1); rectanglem(reg2); rectanglem(reg3); rectanglem(reg4);rectanglem(reg5);
caxis([s.c1 s.c2]); colormap(cmap); freezeColors; 
title(s.s2,'FontSize',fsize);
h=colorbar('Location','eastoutside','Position',pos1); cbfreeze(h,cmap);%cbunits(h,s.unit); 

subplot('Position',p3); a=z3;
axesm('MapProjection',domap,'origin',[0,0]); framem;
contourfm(lat,lon,a,s.vbin); hold on; 
contourm(latx,lonx,lm,'k','LineWidth',1); box off; axis off;
rectanglem(reg1); rectanglem(reg2); rectanglem(reg3); rectanglem(reg4);rectanglem(reg5);
caxis([s.cmin s.cmax]); colormap(cmap1); %freezeColors; 
h=colorbar('Location','eastoutside','Position',pos2); %cbfreeze(h,cmap);
cbunits(h,s.unit);
title(s.s3,'FontSize',fsize);

visfig='off'; vname=strcat(vname,'_',domap);
printit(visfig,fpath,expn,vname);

