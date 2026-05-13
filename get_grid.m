function v=get_grid(fn,latlon)

lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
v.lon=ncread(fn,'lon'); v.lat=ncread(fn,'lat'); v.lm=ncread(fn,'land_mask');
v.ys  =min(find(v.lat(:)>=lat1)); v.ye  =max(find(v.lat(:)<= lat2));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat=v.lat(v.ys:v.ye); v.lon=v.lon(v.xs:v.xe); v.fn=fn;
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;

R0=6371.0e3; dtor=1./180.*pi;
for i=1:v.nlat
  rad=v.lat(i)*dtor;
  dlat=v.lat(round(v.nlat/2))-v.lat(round(v.nlat/2)-1);
  dlon=v.lon(round(v.nlon/2))-v.lon(round(v.nlon/2)-1);
  v.aa0(i,1:v.nlon)=(R0*cos(rad)*dlon*dtor) * (R0*dlat*dtor);
  v.dx (i,1:v.nlon)=(R0*cos(rad)*dlon*dtor);
  v.dy (i,1:v.nlon)=(R0*dlat*dtor);
  v.f  (i,1:v.nlon)= 2*pi/86400*sin(rad);
end;

amean=mean(mean(v.aa0));
v.aa = v.aa0/amean;

v.lonx=v.lon; v.latx=v.lat;

return


g.lon=ncread(fn,'lon'); g.lat=ncread(fn,'lat'); g.lm=ncread(fn,'land_mask');
g.nlat=length(g.lat); g.nlon=length(g.lon); g.ngrid=g.nlat*g.nlon;
R0=6371.0e3; dtor=1./180.*pi;
for i=1:g.nlat
  rad=g.lat(i)*dtor;
  dlat=g.lat(round(g.nlat/2))-g.lat(round(g.nlat/2)-1);
  dlon=g.lon(round(g.nlon/2))-g.lon(round(g.nlon/2)-1);
  g.aa0(i,1:g.nlon)=(R0*cos(rad)*dlon*dtor) * (R0*dlat*dtor);
  g.dx (i,1:g.nlon)=(R0*cos(rad)*dlon*dtor);
  g.dy (i,1:g.nlon)=(R0*dlat*dtor);
  g.f  (i,1:g.nlon)= 2*pi/86400*sin(rad);
end;
amean=mean(mean(g.aa0));
g.aa = g.aa0/amean;

g.opt=opt;
