function v=read_era_msl(fname,latlon,t1,t2,s,varn);
%fname='/archive/Ming.Zhao/backup/sst_dataset/hadisst_186912-201301/hadisst_sst.data.nc';
%latlon=[125 285 -20 20]; 
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
f=netcdf(fname,'nowrite'); strcat('FILE OPENED:',fname)
latname='lat'; lonname='lon';
v.lat =f{latname}(:); v.lon=f{lonname}(:); 
v.ys  =min(find(v.lat(:)>=lat1)); v.ye  =max(find(v.lat(:)<= lat2));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat=f{latname}(v.ys:v.ye); v.lon=f{lonname}(v.xs:v.xe);
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
lonx=s.lon; latx =s.lat;

a=f{varn}(t1:t2,v.ys:v.ye,v.xs:v.xe);%1979JAN-2012DEC;34yr
v.time=[1:length(a(:,1,1))]; v.nt=length(v.time); v.ts=1; v.te=v.nt;
tmp=reshape(a,12,v.nt/12,v.nlat,v.nlon);

if strcmp(varn,'msl')
  v.slp_clm=squeeze(mean(tmp,2));
  v.slp_ann=squeeze(mean(v.slp_clm,1));
  v.slp.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  v.slp.al0=getts(v.slp.all,s)
  close(f)
  lonx=s.lon; latx =s.lat;
  v.slp.clm=interp_grid(v.slp_clm,lonx,latx,v.lon,v.lat,1);
  v.slp.ann=interp_grid(v.slp_ann,lonx,latx,v.lon,v.lat,1); size(v.slp.clm)
  v.slp.sea=get4season(v.slp.clm); 
  v.slp.fn =fname;
elseif strcmp(varn,'ice')
  v.ice_clm=squeeze(mean(tmp,2));
  v.ice_ann=squeeze(mean(v.ice_clm,1));
  v.ice.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  v.ice.al0=getts(v.ice.all,s)
  close(f)
  lonx=s.lon; latx =s.lat;
  v.ice.clm=interp_grid(v.ice_clm,lonx,latx,v.lon,v.lat,1);
  v.ice.ann=interp_grid(v.ice_ann,lonx,latx,v.lon,v.lat,1); size(v.ice.clm)
  v.ice.sea=get4season(v.ice.clm); 
  v.ice.fn =fname;
end

return

mean(mean(v.slp_ann(v.slp_ann~=-1e10)))
mean(mean(v.slp.ann(v.slp.ann~=-1e10)))

return

