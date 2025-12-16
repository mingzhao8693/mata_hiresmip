function zs=get_zonal_scale(id)
%id(time,lat,lon)

a=squeeze(mean(id,3)); %a(time,lat)
a(a==0)=NaN;
zs=nanmean(a,1);

return
