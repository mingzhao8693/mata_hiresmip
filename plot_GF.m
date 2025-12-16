function plot_GF(s,gf,lat0,lon0,opt)
lat0=10; lon0=140; lat=s.lat; lon=s.lon; gf=s.gf.tas;
ys=min(find(lat(:)>=lat0)); xs=min(find(lon(:)>=lon0));
opt=0;
if (opt==0)
  g0=squeeze(gf(:,xs*ys,:)); g0=reshape(g0,12,144,90);
else
  g0=squeeze(gf(:,:,xs*ys)); g0=reshape(g0,12,144,90);
end

p.xsize=1800; p.ysize=800;
pms=[0, 0, p.xsize, p.ysize]*0.8; fsize=6; 
handle=figure('Position',pms,'visible','on'); 
a=squeeze(mean(g0,1)); a=a';
pcolor(lon,lat,a); hold on; shading flat; caxis([-0.01 0.01]);
colorbar; colormap(jet); set(gca,'FontSize',fsize); 
contour(lon,lat,lm,1,'k');


subplot(row, col, 1); a=squeeze(mean(g0,1)); a=a';
pcolor(lon,lat,a); hold on; shading flat; %caxis([-0.01 0.01]);
colorbar; colormap(jet); set(gca,'FontSize',fsize); 
contour(lon,lat,lm,1,'k');


row=4; col=4; lm=s.lm0; %a=s.lm0; a(a>=0.5)=1; a(a<0.5)=0; lm=a;
for m = 1:12
  subplot(row, col, m); a=squeeze(g0(m,:,:)); a=a';
  pcolor(lon,lat,a); hold on; shading flat; %caxis([-0.01 0.01]);
  colorbar; colormap(jet); set(gca,'FontSize',fsize); 
  contour(lon,lat,lm,1,'k');
  %axis([p.x1 p.x2 p.y1 p.y2]);
  %title(strcat(o.shared_list(i),' (',o.month(m),')'),'FontSize',fsize);
end


