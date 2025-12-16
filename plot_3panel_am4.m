function plot_3panel_am4(s,z1,z2,z3,vbin,cmin,cmax,vname,fpath,expn,f,k,nn);
aa=s.aa;
a=mean(mean(z1.*aa)); s.s1=sprintf('%s (MEAN=%5.2f',s.s1,a);
a=mean(mean(z2.*aa)); s.s2=sprintf('%s (MEAN=%5.2f',s.s2,a);
a=mean(mean(z3.*aa)); s.s3=sprintf('%s (MEAN=%5.2f',s.s3,a);
%a=sqrt(mean(mean(z1.^2.*aa))); s.s1=sprintf('%s; RMSE=%5.2f)',s.s1,a);
%a=sqrt(mean(mean(z2.^2.*aa))); s.s2=sprintf('%s; RMSE=%5.2f)',s.s2,a);
a=sqrt(mean(mean(z1.^2.*aa))); s.s1=sprintf('%s)',s.s1);
a=sqrt(mean(mean(z2.^2.*aa))); s.s2=sprintf('%s)',s.s2);
a=sqrt(mean(mean(z3.^2.*aa))); s.s3=sprintf('%s)',s.s3);
if (k==1)
  vname=strcat(vname,'-ann');
elseif(k==2)
  vname=strcat(vname,'-mam');
elseif(k==3)
  vname=strcat(vname,'-jja');
elseif(k==4)
  vname=strcat(vname,'-son');
elseif(k==5)
  vname=strcat(vname,'-djf');
end
lat=s.lat; lon=s.lon; 
latx=s.latx; lonx=s.lonx; lm=s.lmx; lm(lm<=0.5)=0; lm(lm>0.5)=1; 
xmin=min(lonx); xmax=max(lonx); 
ymin=min(latx); ymax=max(latx);
cmap=jet(nn); cmap(nn/2:nn/2+1,:)=1; 
reg1=[-155  15 40 20];
reg2=[-110 -30 40 20];
reg3=[-55   10 40 20];
reg4=[-25  -27 40 20];
reg5=[75   -38 40 20]; 

pms=[ 0, 0, 400, 800]*1.2; warning off all; fac=20; fsize=12;
handle = figure('Position', pms,'visible','on'); 
row=3; col=1; a=strcat('(',vname,')'); a(a=='_')='-';a='';
subplot(row,col,1); 
contourf(lon,lat,z1,vbin); hold on; colormap(cmap);
contour(lonx,latx,lm,'k'); hold on; shading flat; colorbar; 
caxis([cmin cmax]); axis([xmin xmax ymin ymax]); 
title(strcat(s.s1,a),'FontSize',fsize);
rectangle('Position',reg1);
rectangle('Position',reg2);
rectangle('Position',reg3);
rectangle('Position',reg4);
rectangle('Position',reg5);
subplot(row,col,2); 
contourf(lon,lat,z2,vbin); hold on;
contour(lonx,latx,lm,'k'); hold on; shading flat; colorbar; 
caxis([cmin cmax]); axis([xmin xmax ymin ymax]); 
title(s.s2,'FontSize',fsize);
rectangle('Position',reg1);
rectangle('Position',reg2);
rectangle('Position',reg3);
rectangle('Position',reg4);
rectangle('Position',reg5);
subplot(row,col,3); 
contourf(lon,lat,z3,vbin); hold on;
contour(lonx,latx,lm,'k'); hold on; shading flat; colorbar; 
caxis([cmin cmax]*f); axis([xmin xmax ymin ymax]); 
title(s.s3,'FontSize',fsize);
rectangle('Position',reg1)
rectangle('Position',reg2)
rectangle('Position',reg3)
rectangle('Position',reg4)
rectangle('Position',reg5)

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
