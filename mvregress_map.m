function r=mvregress_map(y,x)
y=CM4.c0.toa.netrad.ts.org_ann';
x=squeeze(mean(CM4.c0.sfc.tref.all,2));
[nyr,nlat,nlon]=size(x); %xx=x(1:500,:,:);
lon=CM4.c0.s.lon;   lat=CM4.c0.s.lat; 
lonx=lon(1:4:nlon); latx=lat(1:4:nlat);

x_new=interp_grid(x,lonx,latx,lon,lat,3);
[nyr,nlatx,nlonx]=size(x_new);

%figure; pcolor(squeeze(xx    (1,:,:))); shading flat; colorbar;
%figure; pcolor(squeeze(xx_new(1,:,:))); shading flat; colorbar;
ngrid=nlonx*nlatx;
x=reshape(x_new,nyr,ngrid,1);
xavg=squeeze(mean(x,1));
for t=1:nyr
  x(t,:)=x(t,:)-xavg;
end
y=y-mean(y);

for i=1:ngrid
  %z1d(i)=regress(y,x(:,i));
  c=corrcoef(y,x(:,i)); c1d(i)=c(1,2);
end
z2d=reshape(z1d,nlatx,nlonx);
c2d=reshape(c1d,nlatx,nlonx);
figure; pcolor(lonx,latx,z2d); shading flat; colorbar; caxis([-1 1]);
figure; pcolor(lonx,latx,c2d); shading flat; colorbar; caxis([-1 1]);
figure; [C,h]=contour(lonx,latx,c2d,[-1:0.1:1]); clabel(C,h);

w1d=mvregress(y,x,'algorithm','cwls'); 

w1d=mvregress(y,x); 

w2d=reshape(w1d,nlatx,nlonx);
figure; pcolor(lonx,latx,w2d); shading flat; colorbar;








y0=y-mean(y); xavg=squeeze(mean(x,1));
for i=1:nlon
  for j=1:nlat 
    x0=x(:,j,i)-xavg(j,i);
    a=corrcoef (x0,y0);   r.corr (i,j)=a(1,2);
    a=polyfit  (x0,y0,1); r.slop (i,j)=a(1);
    a=mvregress(x0,y0);   r.slop1(i,j)=a;
  end
end

return

v=CM4.c0; x=squeeze(mean(v.sfc.tref.all,2)); 
y=v.toa.netrad.ts.org_ann';
y=v.toa.ttcf.ts.org_ann'; k1=150; k2=250;
r=regress_map(y(k1:k2),x(k1:k2,:,:))
figure; pcolor(r.slop'); shading flat; colorbar; caxis([-1 1]);

v=SP4.c0; x=squeeze(mean(v.sfc.tref.all,2)); 
y=v.toa.netrad.ts.org_ann';
y=v.toa.ttcf.ts.org_ann';
r=regress_map(y,x)
figure; pcolor(r.slop'); shading flat; colorbar; caxis([-0.3 0.3]);

v=ESM4.c0; x=squeeze(mean(v.sfc.tref.all,2)); 
y=v.toa.netrad.ts.org_ann';
y=v.toa.ttcf.ts.org_ann';
r=regress_map(y,x)
figure; pcolor(r.slop'); shading flat; colorbar; caxis([-0.3 0.3]);

