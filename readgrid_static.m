function v=readgrid_static(fname, latlon)
%fname='/archive/miz2/GCM/omsk/c180_hv1_amip1/ts_all/t_surf.atmos.1981-2008.all.nc'
%latlon=[280 340 10 25];

[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%lat1=-90; lat2=90; lon1=1.25; lon2=358.75; %global
%lat1=-31; lat2=31; lon1=1.25; lon2=358.75; %global tropical
%lat1=-25; lat2=10; lon1=275;  lon2=330;    %amazon
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);

f=netcdf(fname,'nowrite'); strcat('FILE OPENED:',fname)
latname='lat'; lonname='lon';
v.lat =f{latname}(:); v.lon=f{lonname}(:); 
v.ys  =min(find(v.lat(:)>=lat1)); v.ye  =max(find(v.lat(:)<= lat2));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat=f{latname}(v.ys:v.ye); v.lon=f{lonname}(v.xs:v.xe);
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
%v.pf=f{'pfull'}(:); v.nz=min(find(v.pf<70));
%v.zs=1; v.ze=v.nz;
v.lm0=f{'land_mask'}(v.ys:v.ye,v.xs:v.xe);
%v.im0=f{'ice_mask'} (v.ys:v.ye,v.xs:v.xe);
close(f); v.latlon=latlon; v.f=0;

v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
R0=6371.0e3; dtor=1./180.*pi;
for i=1:v.nlat
  rad=v.lat(i)*dtor;
  dlat=v.lat(round(v.nlat/2))-v.lat(round(v.nlat/2)-1);
  dlon=v.lon(round(v.nlon/2))-v.lon(round(v.nlon/2)-1);
  v.aa0(i,1:v.nlon)=(R0*cos(rad)*dlon*dtor) * (R0*dlat*dtor);
  v.dx (i,1:v.nlon)=(R0*cos(rad)*dlon*dtor);
  v.dy (i,1:v.nlon)=(R0*dlat*dtor);
  v.f  (i,1:v.nlon)= 2*pi/86400*sin(rad);
end;
amean=mean(mean(v.aa0));
v.aa = v.aa0/amean;
v.fn_grid = fname;
return

fname=strcat(tpath,expn,'/ts_all/atmos.static.nc')
fname='./atmos.static.nc'
f=netcdf(fname,'nowrite'); 
v.lm0=f{'land_mask'}(v.ys:v.ye,v.xs:v.xe);

return
