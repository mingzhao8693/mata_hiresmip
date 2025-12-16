function [id]=get_reg_id(a,lat,lon,sname)
%a=v.lm; lat=v.lat; lon=v.lon; sname='California';
nlat=length(lat); nlon=length(lon);
[latx,lonx]=mizborders(sname);
lonx=360+lonx; id=a; id(:,:)=0;
for j=1:nlat
  for i=1:nlon
%    in = inpolygon(lon(i),lat(j),lonx(1:end-1),latx(1:end-1));
    in = inpolygon(lon(i),lat(j), lonx(1:end), latx(1:end));
    if (in)
      id(j,i)=1;
    end
  end
end
return

