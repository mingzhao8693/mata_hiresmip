function v=read_gpcp_simple(fname,latlon,t1,t2,s);
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
f=netcdf(fname,'nowrite'); strcat('FILE OPENED:',fname)
latname='LAT'; lonname='LON';
v.lat =f{latname}(:); v.lon=f{lonname}(:); 
v.ys  =min(find(v.lat(:)>=lat1)); v.ye  =max(find(v.lat(:)<= lat2));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat=f{latname}(v.ys:v.ye); v.lon=f{lonname}(v.xs:v.xe);
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
lonx=s.lon; latx =s.lat;

pcp  =f{'precip'}(t1:t2,v.ys:v.ye,v.xs:v.xe); %mm/day
v.time=[1:length(pcp(:,1,1))]; v.nt=length(v.time); v.ts=1; v.te=v.nt;
tmp=reshape(pcp,12,v.nt/12,v.nlat,v.nlon);
v.pcp_clm=squeeze(mean(tmp,2));
v.pcp_ann=squeeze(mean(v.pcp_clm,1));
v.pcp.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.pcp.al0=getts(v.pcp.all,s)
close(f)

lonx=s.lon; latx =s.lat;
v.pcp.clm=interp_grid(v.pcp_clm,lonx,latx,v.lon,v.lat,1);
v.pcp.ann=interp_grid(v.pcp_ann,lonx,latx,v.lon,v.lat,1); size(v.pcp.clm)
v.pcp.sea=get4season(v.pcp.clm); 
v.pcp.latdis.sea=squeeze(mean(v.pcp.sea,3));

v.pcp.fn =fname;
return

