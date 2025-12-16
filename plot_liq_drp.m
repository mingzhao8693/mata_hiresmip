fn=strcat('/work/miz/mat_am4p0/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat'); 
tpath='/archive/Ming.Zhao/awg/warsaw/';
expn='c96L33_am4p0'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v0=v;

lm=am4.v0.lm0; lm(lm>=0.5)=1; lm(lm<0.5)=0;
latx=am4.v0.lat; lonx=am4.v0.lon; domap='robinson'; 
fn='/work/miz/mat_am4p0/liq_drp_1000_850.nc';
f=netcdf(fn,'nowrite'); lat=f{'lat'}(:); lon=f{'lon'}(:);
varn='CDNC_AM4'; z1=f{varn}(:,:);
varn='CDNC_obs'; zo=f{varn}(:,:); close(f); varn='liq_drp';

varn='liq_drp'; unit='(1/cm3)'; 
idl=(lm==1); ido=~idl; a=am4.v0.aa0; 
z1avg.globe=mean(mean(z1.*a));
id=ido; a(id)=a(id)/mean(a(id)); z1avg.ocean=mean(z1(id).*a(id));
id=idl; a(id)=a(id)/mean(a(id)); z1avg.land =mean(z1(id).*a(id));

zo(zo>10000)=NaN; zo(lm==1)=NaN; id=~isnan(zo);
a(id)=a(id)/mean(a(id)); 
zoavg.ocean=mean(zo(id).*a(id));
z1avg_ocean=mean(z1(id).*a(id));

c1=0; c2=250;      vbino=[c1:10:c2]; icmap=0;
cmin=-80; cmax=80; vbin =[cmin:10:cmax]; xy=[0 360 -90 90];
pms=[ 0, 0, 800, 1100]*0.8; fsize=10; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on'); domap='noprojection'; 
x0=0.08; y0=0.7; wx=0.8; wy=0.25; dy=0.05; 
p1= [x0,y0,           wx, wy];%position of first subplot
p2= [x0,y0-wy-dy,     wx, wy];%position of first subplot
p3= [x0,y0-2*(wy+dy), wx, wy];%position of first subplot
nn=32; caxis([cmin cmax]); cmap1=bluewhitered(nn);
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
pos1=[0.85 0.48 0.02 0.42];%[left bottom width height];
pos2=[0.85 0.11 0.02 0.22];%[left bottom width height];

row=3; col=1; domap='noprojection'; domap='robinson'; 
subplot('Position',p1); a=z1;
do_mapproj(lat,lon,a,vbino,latx,lonx,lm,domap,xy); %clabel(C,h); 
caxis([c1 c2]); colormap(cmap); freezeColors; 
h=colorbar('Location','eastoutside','Position',pos1); 
cbfreeze(h,cmap); %cbunits(h,unit);
s1=sprintf('(global=%5.1f; ocean=%5.1f; land=%5.1f)',z1avg.globe,z1avg.ocean,z1avg.land);
s1=['(a) AM4.0 (1980-2014); ' s1];
title(s1,'FontSize',fsize);
  
subplot('Position',p2); a=zo; id=isnan(a); a(id)=0;
do_mapproj(lat,lon,a,vbino,latx,lonx,lm,domap,xy); %clabel(C,h); 
caxis([c1 c2]); colormap(cmap); freezeColors; 
h=colorbar('Location','eastoutside','Position',pos1); 
cbfreeze(h,cmap); %cbunits(h,unit);
s2=sprintf('(ocean=%5.1f)',zoavg.ocean);
s2=['(b) MODIS retrieval (2003-2015); ' s2];
title(s2,'FontSize',fsize);

subplot('Position',p3); a=z1-zo; id=isnan(a); a(id)=0;
a(a<cmin)=cmin; a(a>cmax)=cmax;
do_mapproj(lat,lon,a,vbin,latx,lonx,lm,domap,xy); %clabel(C,h); 
caxis([cmin cmax]); colormap(cmap1); %freezeColors; 
h=colorbar('Location','eastoutside','Position',pos2); %cbfreeze(h,cmap);
%cbunits(h,unit);
title('(c) AM4.0 minus MODIS','FontSize',fsize);

warning('off','all'); varn='liq_wat'; expn='AM4p0';
visfig='off'; figpath='./fig_am4/'; 
vname=strcat(varn,'_',domap);
printit(visfig,figpath,expn,vname);

