function var_mean=get_regmean(var,latlon,o,do_ocean_only,do_land_only)
lat=o.lat; lon=o.lon; N=length(var(:,1,1)); 
lm=o.lm0>=o.land_th; im=o.imk>=o.ice_th;

lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
ys=min(find(lat(:)>=lat1)); ye=max(find(lat(:)<= lat2));
xs=min(find(lon(:)>=lon1)); xe=max(find(lon(:)<= lon2));

if (do_ocean_only)
  a=lm(ys:ye,xs:xe)|im(ys:ye,xs:xe); ocn=~a; %(a==0);
  a0=o.aa(ys:ye,xs:xe).*ocn;
elseif (do_land_only)
  a=lm(ys:ye,xs:xe); lnd=a;
  a0=o.aa(ys:ye,xs:xe).*lnd;
else
  a0=o.aa(ys:ye,xs:xe); 
end
a0=a0./mean(mean(a0)); %normalize
if length(size(var))==3
  for i=1:N
    a=squeeze(var(i,ys:ye,xs:xe)); id=~isnan(a); a(~id)=0;
    b=a0.*id; b=b./mean(mean(b));
    a=a.*b; var_mean(i)=mean(mean(a));
  end
else
  a=var(ys:ye,xs:xe); size(a)
  id=~isnan(a); a(~id)=0;size(a)
  b=a0.*id; b=b./mean(mean(b));  
  a=a.*b; var_mean=mean(mean(a));
end

return
