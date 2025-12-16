function o=compute_ceres_glob_mean_ts()%(tpath,fn1,fn2,latlon,t1,t2,s);
tpath='/archive/Ming.Zhao/backup/readobs_data/';
fn1=strcat(tpath,'CERES_EBAF-TOA_Ed2.8_Subset_200003-201607.nc')
fn2=strcat(tpath,'CERES_EBAF-Surface_Ed2.8_Subset_200003-201602.nc')
latlon=[0 360 -90 90]; region='global'; wsize=1; 
t1=1; t2=192; %for 2000Mar-201602
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
f=netcdf(fn1,'nowrite'); latname='lat'; lonname='lon';

v.lat =f{latname}(:); v.lon=f{lonname}(:); 
v.ys  =min(find(v.lat(:)>=lat1)); v.ye  =max(find(v.lat(:)<= lat2));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat=f{latname}(v.ys:v.ye); v.lon=f{lonname}(v.xs:v.xe);
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
v.time=f{'time'}(t1:t2); v.nt=length(v.time); v.ts=1; v.te=v.nt;
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
for i=1: t2-t1+1
  a(i,:,:)=v.aa;
end

tmp=f{'toa_cre_sw_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe); %2001Jan-2012Dec
o.toa.swcf.ts=mean(mean(tmp.*a,3),2);

tmp=f{'toa_cre_lw_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
o.toa.lwcf.ts=mean(mean(tmp.*a,3),2);

tmp=f{'toa_cre_net_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
o.toa.ttcf.ts=mean(mean(tmp.*a,3),2);

tmp=f{'toa_lw_all_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
o.toa.lwnet.ts=mean(mean(tmp.*a,3),2);

tmp=f{'toa_lw_clr_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
o.toa.lwnet_clr.ts=mean(mean(tmp.*a,3),2);

tmp=f{'solar_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe); swdn_toa=tmp;
o.toa.swdn.ts=mean(mean(tmp.*a,3),2);

tmp=f{'toa_sw_clr_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe); tmp=swdn_toa-tmp;
o.toa.swnet_clr.ts=mean(mean(tmp.*a,3),2);

tmp=f{'toa_sw_all_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe); tmp=swdn_toa-tmp;
o.toa.swnet.ts=mean(mean(tmp.*a,3),2);

tmp=f{'toa_net_all_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
o.toa.netrad.ts=mean(mean(tmp.*a,3),2);

tmp=f{'toa_net_clr_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
o.toa.netrad_clr.ts=mean(mean(tmp.*a,3),2);

close(f);

f=netcdf(fn2,'nowrite'); 

tmp=f{'sfc_sw_down_all_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe); %2001Jan-2012Dec
v.swdnsfc.ts=mean(mean(tmp.*a,3),2);

tmp=f{'sfc_sw_up_all_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
v.swupsfc.ts=mean(mean(tmp.*a,3),2);

tmp=f{'sfc_lw_down_all_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
v.lwdnsfc.ts=mean(mean(tmp.*a,3),2);

tmp=f{'sfc_lw_up_all_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
v.lwupsfc.ts=mean(mean(tmp.*a,3),2);

tmp=f{'sfc_net_sw_all_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
v.swnetsfc.ts=mean(mean(tmp.*a,3),2);

tmp=f{'sfc_net_sw_clr_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
v.swclrsfc.ts=mean(mean(tmp.*a,3),2);

tmp=f{'sfc_net_lw_all_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
v.lwnetsfc.ts=mean(mean(tmp.*a,3),2);

tmp=f{'sfc_net_lw_clr_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
v.lwclrsfc.ts=mean(mean(tmp.*a,3),2);

tmp=f{'sfc_net_tot_all_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
v.netradsfc.ts=mean(mean(tmp.*a,3),2);

tmp=f{'sfc_net_tot_clr_mon'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
v.netradsfc.ts=mean(mean(tmp.*a,3),2);

close(f);

o.fn_toa=fn1;
o.fn_sfc=fn2;

tpath='/work/miz/mat_cm4/'; expn='ceres_ts';
fn=strcat(tpath,expn,'_',region,'.mat');
save(fn,'o');


return
