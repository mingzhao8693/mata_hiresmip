function v=getaregion(fname,latlon,latname,lonname,ts,te,varn)
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
f=netcdf(fname,'nowrite'); strcat('FILE OPENED:',fname)
v.lat =f{latname}(:); v.lon=f{lonname}(:); v.fname=fname;
v.ys  =min(find(v.lat(:)>=lat1)); v.ye  =max(find(v.lat(:)<= lat2));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat=f{latname}(v.ys:v.ye); v.lon=f{lonname}(v.xs:v.xe);
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
v.ts=ts; v.te=te; v.nt=v.te-v.ts+1;
varb=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
v.varb=varb; 
return
