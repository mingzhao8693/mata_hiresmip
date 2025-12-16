function plot_4panel_mapp(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,icmap);
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
a1=mean(mean(z1.*aa)); s.s1=sprintf('%s (%s)',s.s1,upper(sea));
a2=mean(mean(z2.*aa)); s.s2=sprintf('%s (%s)',s.s2,upper(sea));
a3=mean(mean(z3.*aa)); s.s3=sprintf('%s (%s)',s.s3,upper(sea));
a4=mean(mean(z4.*aa)); s.s4=sprintf('%s (%s)',s.s4,upper(sea));
%z1=z1-a1; z2=z2-a2; z3=z3-a3; z4=z4-a4;
%a1=mean(mean(z1.*aa)); s.s1=sprintf('%s (MEAN=%5.2f;',s.s1,a1);
%a2=mean(mean(z2.*aa)); s.s2=sprintf('%s (MEAN=%5.2f;',s.s2,a2);
%a3=mean(mean(z3.*aa)); s.s3=sprintf('%s (MEAN=%5.2f;',s.s3,a3);
%a4=mean(mean(z4.*aa)); s.s4=sprintf('%s (MEAN=%5.2f;',s.s4,a4);
%a=sqrt(mean(mean(z1.^2.*aa))); s.s1=sprintf('%s RMSE=%5.2f)',s.s1,a);
%a=sqrt(mean(mean(z2.^2.*aa))); s.s2=sprintf('%s RMSE=%5.2f)',s.s2,a);
%a=sqrt(mean(mean(z3.^2.*aa))); s.s3=sprintf('%s RMSE=%5.2f)',s.s3,a);
%a=sqrt(mean(mean(z4.^2.*aa))); s.s4=sprintf('%s RMSE=%5.2f)',s.s4,a);
lat=s.lat; lon=s.lon; xy=[0 360 -90 90];
latx=s.latx; lonx=s.lonx; lm=s.lmx; lm(lm<=0.5)=0; lm(lm>0.5)=1; 
xmin=s.latlon(1); xmax=s.latlon(2); ymin=s.latlon(3); ymax=s.latlon(4);
domap='noprojection'; domap='hammer'; domap='robinson'; %domap='eckert4'; 

pms=[ 0, 0, 1300, 900]*1.; fsize=10; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=0.08; y0=0.7; wx=0.3; wy=0.25; dx=0.0; dy=0.0;
p1= [x0,          y0,         wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,         wx, wy];%position of first subplot
p3= [x0,          y0-(wy+dy), wx, wy];%position of first subplot
p4= [x0+wx+dx,    y0-(wy+dy), wx, wy];%position of first subplot

nn=32; caxis([cmin cmax]); 
if (icmap==0)
  cmap=fabien_colormap(nn);
elseif (icmap==1) 
  cmap=bluewhitered(nn);
elseif (icmap==2)
  cmap=bluewhitered(nn); cmap=flipud(cmap);
elseif (icmap==3)
  cmap=cbrewer('seq', 'BuGn', nn);
  cmap=cbrewer('div', 'BrBG', nn);
elseif (icmap==4)
  nn=64; caxis([cmin cmax]);
  cmap=cbrewer('div', 'BrBG', nn);
  cmap1=[cmap(1:nn/2-2,:); cmap(nn/2+2:end,:)];
  cmap=cmap1;
else
  cmap=jet(nn); %cmap(nn/2:nn/2+1,:)=1;
end

subplot('Position',p1); z1(z1<cmin)=cmin; z1(z1>cmax)=cmax;
do_mapproj(lat,lon,z1,vbin,latx,lonx,lm,domap,xy); %clabel(C,h); 
caxis([cmin cmax]); colormap(cmap);
title(s.s1,'FontSize',fsize);

subplot('Position',p2); z2(z2<cmin)=cmin; z2(z2>cmax)=cmax;
do_mapproj(lat,lon,z2,vbin,latx,lonx,lm,domap,xy); 
caxis([cmin cmax]); colormap(cmap);
title(s.s2,'FontSize',fsize);

subplot('Position',p3); z3(z3<cmin)=cmin; z3(z3>cmax)=cmax;
do_mapproj(lat,lon,z3,vbin,latx,lonx,lm,domap,xy);
caxis([cmin cmax]); colormap(cmap);
title(s.s3,'FontSize',fsize);

subplot('Position',p4); z4(z4<cmin)=cmin; z4(z4>cmax)=cmax;
do_mapproj(lat,lon,z4,vbin,latx,lonx,lm,domap,xy);
caxis([cmin cmax]); colormap(cmap); 
title(s.s4,'FontSize',fsize);

pos=[0.2 0.45 0.35 0.015];%[left bottom width height];
h=colorbar('Location','southoutside','Position',pos);
cbunits(h,s.unit);%colorbar('YTick',[-10,-5,5,10],'YTickLabels',{'-10','-5','5','10'});

visfig='off'; vname=strcat(vname,'_',domap);
printit(visfig,fpath,expn,vname);

return
