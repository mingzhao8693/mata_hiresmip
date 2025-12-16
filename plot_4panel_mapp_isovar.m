function plot_4panel_mapp_isovar(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,icmap);
aa=s.aa; lat=s.lat; lon=s.lon; xy=[0 360 -30 30];
latx=s.latx; lonx=s.lonx; lm=s.lmx; lm(lm<=0.5)=0; lm(lm>0.5)=1; 
xmin=s.latlon(1); xmax=s.latlon(2); ymin=s.latlon(3); ymax=s.latlon(4);
domap='noprojection'; domap='hammer'; domap='robinson'; %domap='eckert4'; 

pms=[ 0, 0, 1300, 800]*0.8; fsize=10; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=0.08; y0=0.7; wx=0.3; wy=0.25; dx=0.05; dy=0.1;
p1= [x0,          y0,         wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,         wx, wy];%position of first subplot
p3= [x0,          y0-(wy+dy), wx, wy];%position of first subplot
p4= [x0+wx+dx,    y0-(wy+dy), wx, wy];%position of first subplot

nn=32; caxis([cmin cmax]); icmap=1;
if (icmap==0)
  cmap=fabien_colormap(nn);
elseif (icmap==1) 
  cmap=bluewhitered(nn);
elseif (icmap==2)
  cmap=cbrewer('seq', 'BuGn', nn);
  cmap=cbrewer('div', 'BrBG', nn);
else
  cmap=jet(nn); %cmap(nn/2:nn/2+1,:)=1;
end
xl='longitude'; yl='latitude';

subplot('Position',p1); a=z1; a(a<cmin)=cmin; a(a>cmax)=cmax;
contourf(lon,lat,a,vbin); hold on; shading flat; 
contour(lonx,latx,lm,0.5,'k'); axis(xy); ylabel(yl,'FontSize',fsize);
%axesm('MapProjection',domap,'origin',[0,180],'MapLatLimit',[-30 30]);
%contourfm(lat,lon,a,vbin); hold on; framem;
%contourm(lat,lon,lm,'k','LineWidth',1); box off; axis off;
caxis([cmin cmax]); colormap(cmap); title(s.s1,'FontSize',fsize);

subplot('Position',p2); a=z2; a(a<cmin)=cmin; a(a>cmax)=cmax;
contourf(lon,lat,a,vbin); hold on; shading flat; 
contour(lonx,latx,lm,0.5,'k'); axis(xy);
%axesm('MapProjection',domap,'origin',[0,180],'MapLatLimit',[-30 30]);
%contourfm(lat,lon,a,vbin); hold on; framem;
%contourm(latx,lonx,lm,'k','LineWidth',1); box off; axis off;
caxis([cmin cmax]); colormap(cmap); title(s.s2,'FontSize',fsize);

subplot('Position',p3); a=z3; a(a<cmin)=cmin; a(a>cmax)=cmax;
contourf(lon,lat,a,vbin); hold on; shading flat; 
contour(lonx,latx,lm,0.5,'k'); axis(xy); ylabel(yl,'FontSize',fsize);
xlabel(xl,'FontSize',fsize);
%axesm('MapProjection',domap,'origin',[0,180],'MapLatLimit',[-30 30]);
%contourfm(lat,lon,a,vbin); hold on; framem;
%contourm(latx,lonx,lm,'k','LineWidth',1); box off; axis off;
caxis([cmin cmax]); colormap(cmap); title(s.s3,'FontSize',fsize);

subplot('Position',p4); a=z4; a(a<cmin)=cmin; a(a>cmax)=cmax;
contourf(lon,lat,a,vbin); hold on; shading flat; 
contour(lonx,latx,lm,0.5,'k'); axis(xy); xlabel(xl,'FontSize',fsize);
%axesm('MapProjection',domap,'origin',[0,180],'MapLatLimit',[-30 30]);
%contourfm(lat,lon,a,vbin); hold on; framem;
%contourm(latx,lonx,lm,'k','LineWidth',1); box off; axis off;
caxis([cmin cmax]); colormap(cmap); title(s.s4,'FontSize',fsize);

pos=[0.2 0.27 0.4 0.015];%[left bottom width height];
h=colorbar('Location','southoutside','Position',pos);
%cbunits(h,s.unit);%colorbar('YTick',[-10,-5,5,10],'YTickLabels',{'-10','-5','5','10'});

visfig='off'; printit(visfig,fpath,expn,vname);

return
