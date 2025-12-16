function v=read_woa05_simple(fname,latlon,s);
%fn=strcat('./atmos.static_','c96','.nc');
%s=readgrid_static(fn,latlon);
%fname='/archive/miz/backup/sst_dataset/WOA05_pottemp_salt.nc';
%latlon=[0 360 -90 90]; 
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
f=netcdf(fname,'nowrite'); strcat('FILE OPENED:',fname)
latname='LAT'; lonname='LON';
v.lat =f{latname}(:); v.lon=f{lonname}(:); 
v.ys  =min(find(v.lat(:)>=lat1)); v.ye  =max(find(v.lat(:)<= lat2));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat=f{latname}(v.ys:v.ye); v.lon=f{lonname}(v.xs:v.xe);
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;

sst=f{'PTEMP'}(:,1,v.ys:v.ye,v.xs:v.xe); sst=squeeze(sst);
v.time=[1:length(sst(:,1,1))]; v.nt=length(v.time); v.ts=1; v.te=v.nt;
tmp=reshape(sst,12,v.nt/12,v.nlat,v.nlon);
v.sst_clm=squeeze(mean(tmp,2));
v.sst_ann=squeeze(mean(v.sst_clm,1));
close(f)
lonx=s.lon; latx =s.lat;
v.sst.clm=interp_grid(v.sst_clm,lonx,latx,v.lon,v.lat,1);
v.sst.ann=interp_grid(v.sst_ann,lonx,latx,v.lon,v.lat,1); size(v.sst.clm)
v.sst.sea=get4season(v.sst.clm); 
v.sst.fn =fname;

id=(v.sst.ann<=-1e2); size(id)
v.sst.ann(id)=NaN;
for i=1:12; 
  a=squeeze(v.sst.clm(i,:,:));
  a(id)=NaN;
  v.sst.clm(i,:,:)=a;
end
for i=1:5;  
  a=squeeze(v.sst.sea(i,:,:));
  a(id)=NaN;
  v.sst.sea(i,:,:)=a; 
end
v.sst.ann=v.sst.ann+273.15;
v.sst.clm=v.sst.clm+273.15;
v.sst.sea=v.sst.sea+273.15;

return

id=(v.sst.ann<=-1e10); v.sst.ann(id)=0;
figure; contourf(s.lon,s.lat,v.sst.ann,20);
