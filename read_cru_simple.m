function o=read_cru_simple(fname,latlon,t1,t2,s)
%fname='/archive/Ming.Zhao/obs_for_am4p0_paper/CRU/monthly/cru_ts_322.1901-2013.tmp.nc';
latlon=[0 360 -90 90]; t1=949; t2=1356; 
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);

f=netcdf(fname,'nowrite'); latname='lat'; lonname='lon'; tname='time';
v.lat=f{latname}(:); v.lon=f{lonname}(:); 
v.lat=f{latname}(:); v.lon=f{lonname}(:);
v.nlat=length(v.lat); v.nlon=length(v.lon); 
v.time=f{tname}(t1:t2); v.time=v.time-v.time(1); v.nt=length(v.time);

varname='tmp'; tmp =f{varname}(t1:t2,:,:); close(f);
%figure;pcolor(squeeze(tmp(1,:,:)));colorbar;colormap;shading flat;caxis([200 302]);
for t=1:v.nt
  for j=1:v.nlat
    tmp(t,j,:)=circshift(squeeze(tmp(t,j,:)),v.nlon/2);
  end
end
%figure;pcolor(squeeze(tmp(1,:,:)));colorbar;colormap;shading flat;caxis([200 300]);
lon=circshift(v.lon,v.nlon/2);
for i=1:v.nlon
  if (lon(i)<0)
    lon(i)=360+lon(i);
  end
end
v.lon=lon;

v.ys=min(find(v.lat(:)>=lat1)); v.ye=max(find(v.lat(:)<= lat2));
v.xs=min(find(v.lon(:)>=lon1)); v.xe=max(find(v.lon(:)<= lon2));
v.lon=v.lon(v.xs:v.xe); v.lat=v.lat(v.ys:v.ye);
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
lonx=s.lon; latx =s.lat;

tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); size(tmp)
v.tas_clm=squeeze(mean(tmp,2));
v.tas_ann=squeeze(mean(v.tas_clm,1));
v.tas_sea=get4season(v.tas_clm);
o.sfc.tas.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
[o.sfc.tas.al0 o.sfc.tas.ts.ann]=getts0(o.sfc.tas.all,s)

o.sfc.tas.clm=interp_grid(v.tas_clm,lonx,latx,v.lon,v.lat,1);
o.sfc.tas.ann=interp_grid(v.tas_ann,lonx,latx,v.lon,v.lat,1);
o.sfc.tas.sea=interp_grid(v.tas_sea,lonx,latx,v.lon,v.lat,1);

o.sfc.tas.fn =fname;

return
