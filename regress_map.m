function r=regress_map(y,x)
%x=squeeze(mean(CM4.c0.sfc.tref.all,2));
%y=CM4.c0.toa.netrad.ts.org_ann';
nlon=length(x(1,1,:)); nlat=length(x(1,:,1));
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

