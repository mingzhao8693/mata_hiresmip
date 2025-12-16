function plot_4panel_zmean(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,icmap)
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
s.s1=sprintf('%s (%s)',s.s1,upper(sea));
s.s2=sprintf('%s (%s)',s.s2,upper(sea));
s.s3=sprintf('%s (%s)',s.s3,upper(sea));
s.s4=sprintf('%s (%s)',s.s4,upper(sea));

lat=s.lat; pf=s.pf; xy=s.xy; 
pms=[ 0, 0, 1300, 1100]*0.8; fsize=10; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=0.08; y0=0.7; wx=0.35; wy=0.20; dx=0.05+0.0; dy=0.05;
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
  cmap=cbrewer('div', 'BrBG', nn);
else
  cmap=jet(nn); %cmap(nn/2:nn/2+1,:)=1;
end
%pos1=[0.25-0.025 0.69-0.05 0.42 0.015];%[left bottom width height];
%pos2=[0.25-0.025 0.39-0.07 0.42 0.015];%[left bottom width height];

subplot('Position',p1); z1(z1<cmin)=cmin; z1(z1>cmax)=cmax;
[C,h]=contourf(lat,pf,z1,vbin); shading flat; clabel(C,h,s.vlab,'Rotation',0); 
axis(xy); set(gca,'yDir','reverse'); caxis([cmin cmax]); colormap(cmap);
%xlabel('longitude','FontSize',fsize); 
ylabel('pressure (hPa)','FontSize',fsize); 
title(s.s1,'FontSize',fsize); set(gca,'FontSize',fsize); box on;

subplot('Position',p2); z2(z2<cmin)=cmin; z2(z2>cmax)=cmax;
[C,h]=contourf(lat,pf,z2,vbin); shading flat; clabel(C,h,s.vlab,'Rotation',0); 
axis(xy); set(gca,'yDir','reverse'); caxis([cmin cmax]); colormap(cmap);
%xlabel('longitude','FontSize',fsize); %ylabel('pressure (hPa)','FontSize',fsize); 
title(s.s2,'FontSize',fsize); set(gca,'FontSize',fsize); box on;

subplot('Position',p3); z3(z3<cmin)=cmin; z3(z3>cmax)=cmax;
[C,h]=contourf(lat,pf,z3,vbin); shading flat; clabel(C,h,s.vlab,'Rotation',0); 
axis(xy); set(gca,'yDir','reverse'); caxis([cmin cmax]); colormap(cmap);
xlabel('longitude','FontSize',fsize); ylabel('pressure (hPa)','FontSize',fsize); 
title(s.s3,'FontSize',fsize); box on;

subplot('Position',p4); z4(z4<cmin)=cmin; z4(z4>cmax)=cmax;
[C,h]=contourf(lat,pf,z4,vbin); shading flat; clabel(C,h,s.vlab,'Rotation',0); 
axis(xy); set(gca,'yDir','reverse'); caxis([cmin cmax]); colormap(cmap);
xlabel('longitude','FontSize',fsize); %ylabel('pressure (hPa)','FontSize',fsize); 
title(s.s4,'FontSize',fsize); box on; colorbar;

pos=[0.255 0.38 0.4 0.015];%[left bottom width height];
h=colorbar('Location','southoutside','Position',pos); 
%cbunits(h,s.unit); %colorbar('YTick',[-10,-5,5,10],'YTickLabels',{'-10','-5','5','10'});

visfig='off'; vname=strcat(vname,'_zmean');
printit(visfig,fpath,expn,vname);

return
