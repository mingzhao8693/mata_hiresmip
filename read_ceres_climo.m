function o=read_ceres_climo(tpath,fn1,fn2,latlon,t1,t2,s);
%latlon=[0 360 -90 90]; region='global'; wsize=1; 
%t1=11; t2=178; %for 2001Jan-2014Dec period
%tpath='/archive/Ming.Zhao/backup/radiation_obs/CERES_EBAF_Ed2.7/'
%fn1=strcat(tpath,'CERES_EBAF-TOA_Ed2.7_Subset_200003-201304.nc');
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
f=netcdf(fn1,'nowrite'); latname='lat'; lonname='lon';fn1

v.lat =f{latname}(:); v.lon=f{lonname}(:); 
v.ys  =min(find(v.lat(:)>=lat1)); v.ye  =max(find(v.lat(:)<= lat2));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat=f{latname}(v.ys:v.ye); v.lon=f{lonname}(v.xs:v.xe);
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
v.time=f{'ctime'}(t1:t2); v.nt=length(v.time); v.ts=1; v.te=v.nt;
lonx=s.lon; latx =s.lat;

tmp=f{'toa_cre_sw_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); size(tmp)%2001Jan-2012Dec
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); size(tmp)
v.swcftoa_clm=squeeze(mean(tmp,2));
v.swcftoa_ann=squeeze(mean(v.swcftoa_clm,1));
v.swcftoa_sea=get4season(v.swcftoa_clm);
o.toa.swcf.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
%o.toa.swcf.al0=getts(o.toa.swcf.all,s)
[o.toa.swcf.al0 o.toa.swcf.ts.ann]=getts0(o.toa.swcf.all,s)

tmp=f{'toa_cre_lw_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.lwcftoa_clm=squeeze(mean(tmp,2));
v.lwcftoa_ann=squeeze(mean(v.lwcftoa_clm,1));
v.lwcftoa_sea=get4season(v.lwcftoa_clm);
o.toa.lwcf.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
%o.toa.lwcf.al0=getts(o.toa.lwcf.all,s)
[o.toa.lwcf.al0 o.toa.lwcf.ts.ann]=getts0(o.toa.lwcf.all,s)

tmp=f{'toa_cre_net_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.ttcftoa_clm=squeeze(mean(tmp,2));
v.ttcftoa_ann=squeeze(mean(v.ttcftoa_clm,1));
v.ttcftoa_sea=get4season(v.ttcftoa_clm);
o.toa.ttcf.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
%o.toa.ttcf.al0=getts(o.toa.ttcf.all,s)
[o.toa.ttcf.al0 o.toa.ttcf.ts.ann]=getts0(o.toa.ttcf.all,s)

tmp=f{'toa_lw_all_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.olr_clm=squeeze(mean(tmp,2));
v.olr_ann=squeeze(mean(v.olr_clm,1));
v.olr_sea=get4season(v.olr_clm);
o.toa.lwnet.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
%o.toa.lwnet.al0=getts(o.toa.lwnet.all,s)
[o.toa.lwnet.al0 o.toa.lwnet.ts.ann]=getts0(o.toa.lwnet.all,s)

tmp=f{'toa_lw_clr_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.lwclrtoa_clm=squeeze(mean(tmp,2));
v.lwclrtoa_ann=squeeze(mean(v.lwclrtoa_clm,1));
v.lwclrtoa_sea=get4season(v.lwclrtoa_clm);
o.toa.lwnet_clr.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
[o.toa.lwnet_clr.al0 o.toa.lwnet_clr.ts.ann]=getts0(o.toa.lwnet_clr.all,s)

swdn_toa=f{'solar_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
tmp=reshape(swdn_toa,12,v.nt/12,v.nlat,v.nlon);
v.swdntoa0_clm=squeeze(mean(tmp,2));
v.swdntoa0_ann=squeeze(mean(v.swdntoa0_clm,1));
v.swdntoa0_sea=get4season(v.swdntoa0_clm);

tmp=f{'toa_sw_clr_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); tmp=swdn_toa-tmp;
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.swclrtoa_clm=squeeze(mean(tmp,2));
v.swclrtoa_ann=squeeze(mean(v.swclrtoa_clm,1));
v.swclrtoa_sea=get4season(v.swclrtoa_clm);
o.toa.swnet_clr.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
[o.toa.swnet_clr.al0 o.toa.swnet_clr.ts.ann]=getts0(o.toa.swnet_clr.all,s)

tmp=f{'toa_sw_all_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); tmp=swdn_toa-tmp;
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.swabs_clm=squeeze(mean(tmp,2));
v.swabs_ann=squeeze(mean(v.swabs_clm,1));
v.swabs_sea=get4season(v.swabs_clm);
o.toa.swnet.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
%o.toa.swnet.al0=getts(o.toa.swnet.all,s)
[o.toa.swnet.al0 o.toa.swnet.ts.ann]=getts0(o.toa.swnet.all,s)

tmp=f{'toa_net_all_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.netradtoa_clm=squeeze(mean(tmp,2));
v.netradtoa_ann=squeeze(mean(v.netradtoa_clm,1));
v.netradtoa_sea=get4season(v.netradtoa_clm);
o.toa.netrad.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
%o.toa.netrad.al0=getts(o.toa.netrad.all,s)
[o.toa.netrad.al0 o.toa.netrad.ts.ann]=getts0(o.toa.netrad.all,s)

tmp=f{'toa_net_clr_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.netradtoa_clr_clm=squeeze(mean(tmp,2));
v.netradtoa_clr_ann=squeeze(mean(v.netradtoa_clr_clm,1));
v.netradtoa_clr_sea=get4season(v.netradtoa_clr_clm);
o.toa.netrad_clr.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
%o.toa.netrad_clr.al0=getts(o.toa.netrad_clr.all,s)
[o.toa.netrad_clr.al0 o.toa.netrad_clr.ts.ann]=getts0(o.toa.netrad_clr.all,s)


close(f);

%read surface radiation data
%tpath='/archive/Ming.Zhao/backup/radiation_obs/CERES_EBAF_Ed2.7/'
%fn2=strcat(tpath,'CERES_EBAF-Surface_Ed2.7_Subset_200003-201209.nc');
f=netcdf(fn2,'nowrite'); 
% $$$ latname='lat'; lonname='lon';
% $$$ lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
% $$$ v.lat =f{latname}(:); v.lon=f{lonname}(:); 
% $$$ v.ys  =min(find(v.lat(:)>=lat1)); v.ye  =max(find(v.lat(:)<= lat2));
% $$$ v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
% $$$ v.lat=f{latname}(v.ys:v.ye); v.lon=f{lonname}(v.xs:v.xe);
% $$$ v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
% $$$ v.time=f{'time'}(t1:t2); v.nt=length(v.time); v.ts=1; v.te=v.nt;

tmp=f{'sfc_sw_down_all_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); %2001Jan-2012Dec
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.swdnsfc_clm=squeeze(mean(tmp,2));
v.swdnsfc_ann=squeeze(mean(v.swdnsfc_clm,1));
v.swdnsfc_sea=get4season(v.swdnsfc_clm);

tmp=f{'sfc_sw_up_all_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.swupsfc_clm=squeeze(mean(tmp,2));
v.swupsfc_ann=squeeze(mean(v.swupsfc_clm,1));
v.swupsfc_sea=get4season(v.swupsfc_clm);

tmp=f{'sfc_lw_down_all_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.lwdnsfc_clm=squeeze(mean(tmp,2));
v.lwdnsfc_ann=squeeze(mean(v.lwdnsfc_clm,1));
v.lwdnsfc_sea=get4season(v.lwdnsfc_clm);

tmp=f{'sfc_lw_up_all_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.lwupsfc_clm=squeeze(mean(tmp,2));
v.lwupsfc_ann=squeeze(mean(v.lwupsfc_clm,1));
v.lwupsfc_sea=get4season(v.lwupsfc_clm);

tmp=f{'sfc_net_sw_all_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.swnetsfc_clm=squeeze(mean(tmp,2));
v.swnetsfc_ann=squeeze(mean(v.swnetsfc_clm,1));
v.swnetsfc_sea=get4season(v.swnetsfc_clm);

tmp=f{'sfc_net_sw_clr_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.swclrsfc_clm=squeeze(mean(tmp,2));
v.swclrsfc_ann=squeeze(mean(v.swclrsfc_clm,1));
v.swclrsfc_sea=get4season(v.swclrsfc_clm);

tmp=f{'sfc_net_lw_all_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.lwnetsfc_clm=squeeze(mean(tmp,2));
v.lwnetsfc_ann=squeeze(mean(v.lwnetsfc_clm,1));
v.lwnetsfc_sea=get4season(v.lwnetsfc_clm);

tmp=f{'sfc_net_lw_clr_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.lwclrsfc_clm=squeeze(mean(tmp,2));
v.lwclrsfc_ann=squeeze(mean(v.lwclrsfc_clm,1));
v.lwclrsfc_sea=get4season(v.lwclrsfc_clm);

tmp=f{'sfc_net_tot_all_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.netradsfc_clm=squeeze(mean(tmp,2));
v.netradsfc_ann=squeeze(mean(v.netradsfc_clm,1));
v.netradsfc_sea=get4season(v.netradsfc_clm);

tmp=f{'sfc_net_tot_clr_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.netradsfc_clr_clm=squeeze(mean(tmp,2));
v.netradsfc_clr_ann=squeeze(mean(v.netradsfc_clr_clm,1));
v.netradsfc_clr_sea=get4season(v.netradsfc_clr_clm);

v.lwcfsfc_clm=v.lwnetsfc_clm-v.lwclrsfc_clm;
v.lwcfsfc_ann=v.lwnetsfc_ann-v.lwclrsfc_ann;
v.lwcfsfc_sea=v.lwnetsfc_sea-v.lwclrsfc_sea;
v.swcfsfc_clm=v.swnetsfc_clm-v.swclrsfc_clm;
v.swcfsfc_ann=v.swnetsfc_ann-v.swclrsfc_ann;
v.swcfsfc_sea=v.swnetsfc_sea-v.swclrsfc_sea;
v.ttcfsfc_clm=v.lwcfsfc_clm +v.swcfsfc_clm;
v.ttcfsfc_ann=v.lwcfsfc_ann +v.swcfsfc_ann;
v.ttcfsfc_sea=v.lwcfsfc_sea +v.swcfsfc_sea;

close(f);

lonx=s.lon; latx =s.lat;
o.sfc.swdn.clm  =interp_grid(v.swdnsfc_clm,  lonx,latx,v.lon,v.lat,1);
o.sfc.swdn.ann  =interp_grid(v.swdnsfc_ann,  lonx,latx,v.lon,v.lat,1);
o.sfc.swdn.sea  =interp_grid(v.swdnsfc_sea,  lonx,latx,v.lon,v.lat,1);
o.sfc.swup.clm  =interp_grid(v.swupsfc_clm,  lonx,latx,v.lon,v.lat,1);
o.sfc.swup.ann  =interp_grid(v.swupsfc_ann,  lonx,latx,v.lon,v.lat,1);
o.sfc.swup.sea  =interp_grid(v.swupsfc_sea,  lonx,latx,v.lon,v.lat,1);
o.sfc.lwdn.clm  =interp_grid(v.lwdnsfc_clm,  lonx,latx,v.lon,v.lat,1);
o.sfc.lwdn.ann  =interp_grid(v.lwdnsfc_ann,  lonx,latx,v.lon,v.lat,1);
o.sfc.lwdn.sea  =interp_grid(v.lwdnsfc_sea,  lonx,latx,v.lon,v.lat,1);
o.sfc.lwup.clm  =interp_grid(v.lwupsfc_clm,  lonx,latx,v.lon,v.lat,1);
o.sfc.lwup.ann  =interp_grid(v.lwupsfc_ann,  lonx,latx,v.lon,v.lat,1);
o.sfc.lwup.sea  =interp_grid(v.lwupsfc_sea,  lonx,latx,v.lon,v.lat,1);
o.sfc.swnet.clm =interp_grid(v.swnetsfc_clm, lonx,latx,v.lon,v.lat,1);
o.sfc.swnet.ann =interp_grid(v.swnetsfc_ann, lonx,latx,v.lon,v.lat,1);
o.sfc.swnet.sea =interp_grid(v.swnetsfc_sea, lonx,latx,v.lon,v.lat,1);
o.sfc.lwnet.clm =interp_grid(v.lwnetsfc_clm, lonx,latx,v.lon,v.lat,1);
o.sfc.lwnet.ann =interp_grid(v.lwnetsfc_ann, lonx,latx,v.lon,v.lat,1);
o.sfc.lwnet.sea =interp_grid(v.lwnetsfc_sea, lonx,latx,v.lon,v.lat,1);
o.sfc.netrad.clm=interp_grid(v.netradsfc_clm,lonx,latx,v.lon,v.lat,1);
o.sfc.netrad.ann=interp_grid(v.netradsfc_ann,lonx,latx,v.lon,v.lat,1);
o.sfc.netrad.sea=interp_grid(v.netradsfc_sea,lonx,latx,v.lon,v.lat,1);
o.sfc.lwnet_clr.clm =interp_grid(v.lwclrsfc_clm, lonx,latx,v.lon,v.lat,1);
o.sfc.lwnet_clr.ann =interp_grid(v.lwclrsfc_ann, lonx,latx,v.lon,v.lat,1);
o.sfc.lwnet_clr.sea =interp_grid(v.lwclrsfc_sea, lonx,latx,v.lon,v.lat,1);
o.sfc.swnet_clr.clm =interp_grid(v.swclrsfc_clm, lonx,latx,v.lon,v.lat,1);
o.sfc.swnet_clr.ann =interp_grid(v.swclrsfc_ann, lonx,latx,v.lon,v.lat,1);
o.sfc.swnet_clr.sea =interp_grid(v.swclrsfc_sea, lonx,latx,v.lon,v.lat,1);
o.sfc.lwcf.clm      =interp_grid(v.lwcfsfc_clm,  lonx,latx,v.lon,v.lat,1);
o.sfc.lwcf.ann      =interp_grid(v.lwcfsfc_ann,  lonx,latx,v.lon,v.lat,1);
o.sfc.lwcf.sea      =interp_grid(v.lwcfsfc_sea,  lonx,latx,v.lon,v.lat,1);
o.sfc.swcf.clm      =interp_grid(v.swcfsfc_clm,  lonx,latx,v.lon,v.lat,1);
o.sfc.swcf.ann      =interp_grid(v.swcfsfc_ann,  lonx,latx,v.lon,v.lat,1);
o.sfc.swcf.sea      =interp_grid(v.swcfsfc_sea,  lonx,latx,v.lon,v.lat,1);
o.sfc.ttcf.clm      =interp_grid(v.ttcfsfc_clm,  lonx,latx,v.lon,v.lat,1);
o.sfc.ttcf.ann      =interp_grid(v.ttcfsfc_ann,  lonx,latx,v.lon,v.lat,1);
o.sfc.ttcf.sea      =interp_grid(v.ttcfsfc_sea,  lonx,latx,v.lon,v.lat,1);
o.sfc.netrad_clr.clm=interp_grid(v.netradsfc_clr_clm,lonx,latx,v.lon,v.lat,1);
o.sfc.netrad_clr.ann=interp_grid(v.netradsfc_clr_ann,lonx,latx,v.lon,v.lat,1);
o.sfc.netrad_clr.sea=interp_grid(v.netradsfc_clr_sea,lonx,latx,v.lon,v.lat,1);
tmp=v.swupsfc_clm./v.swdnsfc_clm; tmp(v.swdnsfc_clm<0.5)=0; tmp(tmp>1)=1;
o.sfc.albedo.clm=interp_grid(tmp, lonx,latx,v.lon,v.lat,1);
tmp=v.swupsfc_ann./v.swdnsfc_ann; tmp(v.swdnsfc_ann<0.5)=0; tmp(tmp>1)=1;
o.sfc.albedo.ann=interp_grid(tmp, lonx,latx,v.lon,v.lat,1);
tmp=v.swupsfc_sea./v.swdnsfc_sea; tmp(v.swdnsfc_sea<0.5)=0; tmp(tmp>1)=1;
o.sfc.albedo.sea=interp_grid(tmp, lonx,latx,v.lon,v.lat,1);

o.toa.swcf.clm  =interp_grid(v.swcftoa_clm,  lonx,latx,v.lon,v.lat,1);
o.toa.swcf.ann  =interp_grid(v.swcftoa_ann,  lonx,latx,v.lon,v.lat,1);
o.toa.swcf.sea  =interp_grid(v.swcftoa_sea,  lonx,latx,v.lon,v.lat,1);
o.toa.lwcf.clm  =interp_grid(v.lwcftoa_clm,  lonx,latx,v.lon,v.lat,1);
o.toa.lwcf.ann  =interp_grid(v.lwcftoa_ann,  lonx,latx,v.lon,v.lat,1);
o.toa.lwcf.sea  =interp_grid(v.lwcftoa_sea,  lonx,latx,v.lon,v.lat,1);
o.toa.ttcf.clm  =interp_grid(v.ttcftoa_clm,  lonx,latx,v.lon,v.lat,1);
o.toa.ttcf.ann  =interp_grid(v.ttcftoa_ann,  lonx,latx,v.lon,v.lat,1);
o.toa.ttcf.sea  =interp_grid(v.ttcftoa_sea,  lonx,latx,v.lon,v.lat,1);
o.toa.lwnet.clm =interp_grid(v.olr_clm,      lonx,latx,v.lon,v.lat,1);
o.toa.lwnet.ann =interp_grid(v.olr_ann,      lonx,latx,v.lon,v.lat,1);
o.toa.lwnet.sea =interp_grid(v.olr_sea,      lonx,latx,v.lon,v.lat,1);
o.toa.swnet.clm =interp_grid(v.swabs_clm,    lonx,latx,v.lon,v.lat,1);
o.toa.swnet.ann =interp_grid(v.swabs_ann,    lonx,latx,v.lon,v.lat,1);
o.toa.swnet.sea =interp_grid(v.swabs_sea,    lonx,latx,v.lon,v.lat,1);
o.toa.netrad.clm=interp_grid(v.netradtoa_clm,lonx,latx,v.lon,v.lat,1);
o.toa.netrad.ann=interp_grid(v.netradtoa_ann,lonx,latx,v.lon,v.lat,1);
o.toa.netrad.sea=interp_grid(v.netradtoa_sea,lonx,latx,v.lon,v.lat,1);
o.toa.lwnet_clr.clm =interp_grid(v.lwclrtoa_clm, lonx,latx,v.lon,v.lat,1);
o.toa.lwnet_clr.ann =interp_grid(v.lwclrtoa_ann, lonx,latx,v.lon,v.lat,1);
o.toa.lwnet_clr.sea =interp_grid(v.lwclrtoa_sea, lonx,latx,v.lon,v.lat,1);
o.toa.swnet_clr.clm =interp_grid(v.swclrtoa_clm, lonx,latx,v.lon,v.lat,1);
o.toa.swnet_clr.ann =interp_grid(v.swclrtoa_ann, lonx,latx,v.lon,v.lat,1);
o.toa.swnet_clr.sea =interp_grid(v.swclrtoa_sea, lonx,latx,v.lon,v.lat,1);
o.toa.netrad_clr.clm=interp_grid(v.netradtoa_clr_clm,lonx,latx,v.lon,v.lat,1);
o.toa.netrad_clr.ann=interp_grid(v.netradtoa_clr_ann,lonx,latx,v.lon,v.lat,1);
o.toa.netrad_clr.sea=interp_grid(v.netradtoa_clr_sea,lonx,latx,v.lon,v.lat,1);

o.atm.netrad.clm=o.toa.netrad.clm -o.sfc.netrad.clm;
o.atm.netrad.ann=o.toa.netrad.ann -o.sfc.netrad.ann;
o.atm.netrad.sea=o.toa.netrad.sea -o.sfc.netrad.sea;
o.atm.lwnet.clm =-(o.toa.lwnet.clm+o.sfc.lwnet.clm);
o.atm.lwnet.ann =-(o.toa.lwnet.ann+o.sfc.lwnet.ann);
o.atm.lwnet.sea =-(o.toa.lwnet.sea+o.sfc.lwnet.sea);
o.atm.swnet.clm =+(o.toa.swnet.clm-o.sfc.swnet.clm);
o.atm.swnet.ann =+(o.toa.swnet.ann-o.sfc.swnet.ann);
o.atm.swnet.sea =+(o.toa.swnet.sea-o.sfc.swnet.sea);
o.atm.lwnet_clr.clm=-(o.toa.lwnet_clr.clm+o.sfc.lwnet_clr.clm);
o.atm.lwnet_clr.ann=-(o.toa.lwnet_clr.ann+o.sfc.lwnet_clr.ann);
o.atm.lwnet_clr.sea=-(o.toa.lwnet_clr.sea+o.sfc.lwnet_clr.sea);
o.atm.swnet_clr.clm= (o.toa.swnet_clr.clm-o.sfc.swnet_clr.clm);
o.atm.swnet_clr.ann= (o.toa.swnet_clr.ann-o.sfc.swnet_clr.ann);
o.atm.swnet_clr.sea= (o.toa.swnet_clr.sea-o.sfc.swnet_clr.sea);
o.atm.netrad_clr.clm=o.toa.netrad_clr.clm -o.sfc.netrad_clr.clm;
o.atm.netrad_clr.ann=o.toa.netrad_clr.ann -o.sfc.netrad_clr.ann;
o.atm.netrad_clr.sea=o.toa.netrad_clr.sea -o.sfc.netrad_clr.sea;
o.atm.lwcf.clm=o.toa.lwcf.clm -o.sfc.lwcf.clm;
o.atm.lwcf.ann=o.toa.lwcf.ann -o.sfc.lwcf.ann;
o.atm.lwcf.sea=o.toa.lwcf.sea -o.sfc.lwcf.sea;
o.atm.swcf.clm=o.toa.swcf.clm -o.sfc.swcf.clm;
o.atm.swcf.ann=o.toa.swcf.ann -o.sfc.swcf.ann;
o.atm.swcf.sea=o.toa.swcf.sea -o.sfc.swcf.sea;
o.atm.ttcf.clm=o.atm.lwcf.clm +o.atm.swcf.clm;
o.atm.ttcf.ann=o.atm.lwcf.ann +o.atm.swcf.ann;
o.atm.ttcf.sea=o.atm.lwcf.sea +o.atm.swcf.sea;

o.atm.lwcf.latdis.sea      = squeeze(mean(o.atm.lwcf.sea,3));
o.atm.swcf.latdis.sea      = squeeze(mean(o.atm.swcf.sea,3));
o.atm.ttcf.latdis.sea      = squeeze(mean(o.atm.ttcf.sea,3));
o.atm.lwnet.latdis.sea     = squeeze(mean(o.atm.lwnet.sea,3));
o.atm.swnet.latdis.sea     = squeeze(mean(o.atm.swnet.sea,3));
o.atm.netrad.latdis.sea    = squeeze(mean(o.atm.netrad.sea,3));
o.atm.lwnet_clr.latdis.sea = squeeze(mean(o.atm.lwnet_clr.sea,3));
o.atm.swnet_clr.latdis.sea = squeeze(mean(o.atm.swnet_clr.sea,3));
o.atm.netrad_clr.latdis.sea= squeeze(mean(o.atm.netrad_clr.sea,3));

o.toa.lwcf.latdis.sea      = squeeze(mean(o.toa.lwcf.sea,3));
o.toa.swcf.latdis.sea      = squeeze(mean(o.toa.swcf.sea,3));
o.toa.ttcf.latdis.sea      = squeeze(mean(o.toa.ttcf.sea,3));
o.toa.lwnet.latdis.sea     = squeeze(mean(o.toa.lwnet.sea,3));
o.toa.swnet.latdis.sea     = squeeze(mean(o.toa.swnet.sea,3));
o.toa.netrad.latdis.sea    = squeeze(mean(o.toa.netrad.sea,3));
o.toa.lwnet_clr.latdis.sea = squeeze(mean(o.toa.lwnet_clr.sea,3));
o.toa.swnet_clr.latdis.sea = squeeze(mean(o.toa.swnet_clr.sea,3));
o.toa.netrad_clr.latdis.sea= squeeze(mean(o.toa.netrad_clr.sea,3));

o.sfc.lwcf.latdis.sea      = squeeze(mean(o.sfc.lwcf.sea,3));
o.sfc.swcf.latdis.sea      = squeeze(mean(o.sfc.swcf.sea,3));
o.sfc.ttcf.latdis.sea      = squeeze(mean(o.sfc.ttcf.sea,3));
o.sfc.lwnet.latdis.sea     = squeeze(mean(o.sfc.lwnet.sea,3));
o.sfc.swnet.latdis.sea     = squeeze(mean(o.sfc.swnet.sea,3));
o.sfc.netrad.latdis.sea    = squeeze(mean(o.sfc.netrad.sea,3));
o.sfc.lwnet_clr.latdis.sea = squeeze(mean(o.sfc.lwnet_clr.sea,3));
o.sfc.swnet_clr.latdis.sea = squeeze(mean(o.sfc.swnet_clr.sea,3));
o.sfc.netrad_clr.latdis.sea= squeeze(mean(o.sfc.netrad_clr.sea,3));
o.sfc.lwdn.latdis.sea      = squeeze(mean(o.sfc.lwdn.sea,3));
o.sfc.lwup.latdis.sea      = squeeze(mean(o.sfc.lwup.sea,3));
o.sfc.swdn.latdis.sea      = squeeze(mean(o.sfc.swdn.sea,3));
o.sfc.swup.latdis.sea      = squeeze(mean(o.sfc.swup.sea,3));
o.sfc.albedo.latdis.sea    = squeeze(mean(o.sfc.albedo.sea,3));

o.fn_toa=fn1;
o.fn_sfc=fn2;
return
