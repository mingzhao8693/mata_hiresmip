function varx=get_region_varx(var,lat,lon,latlon,m1,m2)
%var=z500_ano; lat=v.lat; lon=v.lon; latlon=[193 197 43 47];

lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);

xs=min(find(lon(:)>=lon1)); xe=max(find(lon(:)<= lon2));

if (lat(1)>lat2)
  ys=max(find(lat(:)>=lat2)); ye=min(find(lat(:)<=lat1));
else
  ys=min(find(lat(:)>=lat1)); ye=max(find(lat(:)<= lat2));
end

a=var(m1:m2,:,ys:ye,xs:xe);
varx=squeeze(mean(mean(a,4),3));

nyr =length(a(1,:,1,1)); 
nmon=length(a(:,1,1,1));
varx=reshape(varx,nyr*nmon,1);

return
