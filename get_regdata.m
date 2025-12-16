function [b,lon,lat]=get_regdata(a, lat, lon, latlon)
%latlon=[0 360 -10  10]; lon=s.lon; lat=s.lat; 
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
ys=min(find(lat(:)>=lat1)); ye=max(find(lat(:)<= lat2));
xs=min(find(lon(:)>=lon1)); xe=max(find(lon(:)<= lon2));

if (length(size(a))==2)
  b=a(ys:ye,xs:xe);
elseif (length(size(a))==3)
  b=a(:,ys:ye,xs:xe);
end

lon=lon(xs:xe);
lat=lat(ys:ye);
return
       
  
  
