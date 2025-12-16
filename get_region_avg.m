function v=get_region_avg(lat,lon,var,latlon)
%latlon=[210 270 -5 5]; %NINO3
%lat=v.glat; lon=v.glon; var=ts_ano;

lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
nyr=length(var(1,:,1,1)); nt=12*nyr;
nlon=length(lon); nlat=length(lat);
ys=min(find(lat(:)>=lat1)); ye=max(find(lat(:)<= lat2));
xs=min(find(lon(:)>=lon1)); xe=max(find(lon(:)<= lon2));
var=reshape(var,nt,nlat,nlon);

zz=var(:,ys:ye,xs:xe);
x=get_earth_area(lat,lon); a=x.aa(ys:ye,xs:xe); a=a/mean(mean(a));
x=repmat(a,[1 1 nt]); aa=shiftdim(x,2); 

zz=zz.*aa; v.latlon=latlon;

ssta=mean(mean(zz,3),2);

ssta_detrend=detrend(ssta,'linear'); %detrend ssta

v.ssta = ssta_detrend;
v.ssta_3mon=movmean(v.ssta,3);
v.ssta_5mon=movmean(v.ssta,5);

v.ssta_2d     =reshape(v.ssta,     12,nyr);
v.ssta_3mon_2d=reshape(v.ssta_3mon,12,nyr);
v.ssta_5mon_2d=reshape(v.ssta_5mon,12,nyr);

return
