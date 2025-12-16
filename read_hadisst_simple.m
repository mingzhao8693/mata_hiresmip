function v=read_hadisst_simple(fname,latlon,t1,t2,s);
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

sst  =f{'sst'}(t1:t2,v.ys:v.ye,v.xs:v.xe);%1979JAN-2012DEC;34yr
v.time=[1:length(sst(:,1,1))]; v.nt=length(v.time); v.ts=1; v.te=v.nt;
tmp=reshape(sst,12,v.nt/12,v.nlat,v.nlon);
v.sst_clm=squeeze(mean(tmp,2));
v.sst_ann=squeeze(mean(v.sst_clm,1));
v.sst.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.sst.al0=getts(v.sst.all,s)
close(f)

lonx=s.lon; latx =s.lat;
v.sst.clm=interp_grid(v.sst_clm,lonx,latx,v.lon,v.lat,1);
v.sst.ann=interp_grid(v.sst_ann,lonx,latx,v.lon,v.lat,1); size(v.sst.clm)
v.sst.sea=get4season(v.sst.clm); 
v.sst.fn =fname;

return

mean(mean(v.sst_ann(v.sst_ann~=-1e10)))
mean(mean(v.sst.ann(v.sst.ann~=-1e10)))

return

