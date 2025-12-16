function v=get_earth_area(lat,lon)
v.nlat=length(lat); v.nlon=length(lon); v.ngrid=v.nlat*v.nlon;
R0=6371.0e3; dtor=1./180.*pi;
for i=1:v.nlat
  rad =lat(i)*dtor;
  dlat=lat(round(v.nlat/2))-lat(round(v.nlat/2)-1);
  dlon=lon(round(v.nlon/2))-lon(round(v.nlon/2)-1);
  v.aa0(i,1:v.nlon)=(R0*cos(rad)*dlon*dtor) * (R0*dlat*dtor);
  v.dx (i,1:v.nlon)=(R0*cos(rad)*dlon*dtor);
  v.dy (i,1:v.nlon)=(R0*dlat*dtor);
  v.f  (i,1:v.nlon)= 2*pi/86400*sin(rad);
end;
amean=mean(mean(v.aa0));
v.aa = v.aa0/amean;
