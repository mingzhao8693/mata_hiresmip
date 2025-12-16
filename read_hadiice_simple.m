function v=read_hadiice_simple(fname,latlon,s);
%fname='/archive/Ming.Zhao/backup/sst_dataset/hadisst_186912-201301/hadisst_sst.data.nc';
%latlon=[125 285 -20 20]; t1=12*(1979-1870); t2=12; 
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
f=netcdf(fname,'nowrite'); strcat('FILE OPENED:',fname)
latname='lat'; lonname='lon';
v.lat =f{latname}(:); v.lon=f{lonname}(:); 
v.ys  =min(find(v.lat(:)>=lat1)); v.ye  =max(find(v.lat(:)<= lat2));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat=f{latname}(v.ys:v.ye); v.lon=f{lonname}(v.xs:v.xe);
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;

v.imk_clm=f{'ice_mask'}(:,v.ys:v.ye,v.xs:v.xe);
v.imk_ann=squeeze(mean(v.imk_clm,1));
close(f)

lonx=s.lon; latx =s.lat;
v.ice.clm=interp_grid(v.imk_clm,lonx,latx,v.lon,v.lat,1);
v.ice.ann=interp_grid(v.imk_ann,lonx,latx,v.lon,v.lat,1); size(v.ice.clm)
v.ice.sea=get4season(v.ice.clm); 
v.ice.fn =fname;
return

mean(mean(v.sst_ann(v.sst_ann~=-1e10)))
mean(mean(v.sst.ann(v.sst.ann~=-1e10)))

return

