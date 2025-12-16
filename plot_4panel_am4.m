function plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,nn);
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

lat=s.lat; lon=s.lon; 
latx=s.latx; lonx=s.lonx; lm=s.lmx; lm(lm<=0.5)=0; lm(lm>0.5)=1; 
xmin=s.latlon(1); xmax=s.latlon(2); ymin=s.latlon(3); ymax=s.latlon(4);
cmap=jet(nn); cmap(nn/2:nn/2+1,:)=1; 
pms=[ 0, 0, 1000, 500]*1.3; warning off all; fac=20; fsize=16;
handle = figure('Position', pms,'visible','on'); 
row=2; col=2; a=strcat('(',vname,')'); a(a=='_')='-';a='';
subplot(row,col,1); 
contourf(lon,lat,z1,vbin); hold on; colormap(cmap);
contour(lonx,latx,lm,'k'); hold on; shading flat; colorbar; 
caxis([cmin cmax]); axis([xmin xmax ymin ymax]); 
title(strcat(s.s1,a),'FontSize',fsize);
subplot(row,col,2); 
contourf(lon,lat,z2,vbin); hold on;
contour(lonx,latx,lm,'k'); hold on; shading flat; colorbar; 
caxis([cmin cmax]*f); axis([xmin xmax ymin ymax]); 
title(s.s2,'FontSize',fsize);
subplot(row,col,3); 
contourf(lon,lat,z3,vbin); hold on;
contour(lonx,latx,lm,'k'); hold on; shading flat; colorbar; 
caxis([cmin cmax]*f); axis([xmin xmax ymin ymax]); 
title(s.s3,'FontSize',fsize);
subplot(row,col,4); 
contourf(lon,lat,z4,vbin); hold on;
contour(lonx,latx,lm,'k'); hold on; shading flat; colorbar; 
caxis([cmin cmax]*f); axis([xmin xmax ymin ymax]); 
title(s.s4,'FontSize',fsize);

visfig='off'; 
printit(visfig,fpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

return

subplot(row,col,1); 
pcolor(vs.lonfq,vs.latfq,yo); hold on;
contour(vs.lon,vs.lat,vs.lm,'w'); hold on; %drawna('all');
shading flat; colorbar; caxis([cmin cmax]*fac); axis([0 360 -40 40]);
s=sprintf('OBS'); title(s);
subplot(row,col,2); 
pcolor(vs.lonfq,vs.latfq,y0); hold on;
contour(vs.lon,vs.lat,vs.lm,'w'); hold on; %drawna('all');
shading flat; colorbar; caxis([cmin cmax]*fac); axis([0 360 -40 40]);
s=sprintf('CNTL'); title(s);
subplot(row,col,3); 
pcolor(vs.lonfq,vs.latfq,(y1-y0)); hold on;
contour(vs.lon,vs.lat,vs.lm,'w'); hold on; %drawna('all');
shading flat; colorbar; caxis([cmin cmax]); axis([0 360 -40 40]);
s=sprintf('P2K-CNTL'); title(s);
subplot(row,col,4); 
pcolor(vs.lonfq,vs.latfq,(y2-y0)); hold on;
contour(vs.lon,vs.lat,vs.lm,'w'); hold on; %drawna('all');
shading flat; colorbar; caxis([cmin cmax]); axis([0 360 -40 40]);
s=sprintf('2xCO2-CNTL'); title(s);
subplot(row,col,5); 
pcolor(vs.lonfq,vs.latfq,(y3-y0)); hold on;
contour(vs.lon,vs.lat,vs.lm,'w'); hold on; %drawna('all');
shading flat; colorbar; caxis([cmin cmax]); axis([0 360 -40 40]);
s=sprintf('P2K&2xCO2-CNTL'); title(s);
subplot(row,col,6); 
pcolor(vs.lonfq,vs.latfq,(y1-y0+y2-y0)/2); hold on;
contour(vs.lon,vs.lat,vs.lm,'w'); hold on; %drawna('all');
shading flat; colorbar; caxis([cmin cmax]); axis([0 360 -40 40]);
s=sprintf('(P2K+2xCO2)/2-CNTL'); title(s);

visfig='off'; figpath='./fig_cm4/'; expn='2d'; %vname='sgs';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
