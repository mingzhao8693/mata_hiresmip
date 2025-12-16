function [sfc toa atm]=read_erainterim_new(fname,latlon,t1,t2,s);
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%fname='/archive/Ming.Zhao/backup/readobs_data/era_interim_monthly_197901_201512.nc';
%latlon=[120 290 -5 5]; t1=265; t2=444; %region='tropequ'; dlo='do_all'; wsize=5;

lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
f=netcdf(fname,'nowrite'); 'FILE OPENED...'
latname='latitude'; lonname='longitude';
v.lat =f{latname}(:); v.lon=f{lonname}(:); v.latlon=latlon;
v.ys  =min(find(v.lat(:)>=lat1)); v.ye  =max(find(v.lat(:)<= lat2));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat=f{latname}(v.ys:v.ye); v.lon=f{lonname}(v.xs:v.xe);v
v.time=f{'time'}(t1:t2); v.nt=length(v.time); v.ts=1; v.te=v.nt;
%v.pf=f{'LEVELIST'}(:); v.nz=length(v.pf); v
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
lonx=s.lon; latx =s.lat;

%SFC
tmp=f{'t_skin'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon)+273.15;
v.tsurf_clm=squeeze(mean(tmp,2));
v.tsurf_ann=squeeze(mean(v.tsurf_clm,1));
v.tsurf_sea=get4season(v.tsurf_clm);
sfc.tsurf.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.tsurf.al0=getts(sfc.tsurf.all,s)

tmp=f{'t2m'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon)+273.15;
v.tref_clm=squeeze(mean(tmp,2));
v.tref_ann=squeeze(mean(v.tref_clm,1));
v.tref_sea=get4season(v.tref_clm);
sfc.tref.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.tref.al0=getts(sfc.tref.all,s);

tmp=f{'rh2m'}(t1:t2,v.ys:v.ye,v.xs:v.xe)*100;
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.rhref_clm=squeeze(mean(tmp,2));
v.rhref_ann=squeeze(mean(v.rhref_clm,1));
v.rhref_sea=get4season(v.rhref_clm);
sfc.rhref.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.rhref.al0=getts(sfc.rhref.all,s);

tmp=f{'u10'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.uref_clm=squeeze(mean(tmp,2));
v.uref_ann=squeeze(mean(v.uref_clm,1));
v.uref_sea=get4season(v.uref_clm);
sfc.uref.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.uref.al0=getts(sfc.uref.all,s);

tmp=f{'v10'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.vref_clm=squeeze(mean(tmp,2));
v.vref_ann=squeeze(mean(v.vref_clm,1));
v.vref_sea=get4season(v.vref_clm);
sfc.vref.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.vref.al0=getts(sfc.vref.all,s);

tmp=f{'wspd10'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.wref_clm=squeeze(mean(tmp,2));
v.wref_ann=squeeze(mean(v.wref_clm,1));
v.wref_sea=get4season(v.wref_clm);
sfc.wref.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.wref.al0=getts(sfc.wref.all,s);

tmp=f{'p_msl'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.slp_clm=squeeze(mean(tmp,2));
v.slp_ann=squeeze(mean(v.slp_clm,1));
v.slp_sea=get4season(v.slp_clm);
sfc.slp.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.slp.al0=getts(sfc.slp.all,s);

tmp=f{'p_sfc'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.ps_clm=squeeze(mean(tmp,2));
v.ps_ann=squeeze(mean(v.ps_clm,1));
v.ps_sea=get4season(v.ps_clm);
sfc.ps.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.ps.al0=getts(sfc.ps.all,s);

tmp=f{'lwflx'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.lwnetsfc_clm=squeeze(mean(tmp,2));
v.lwnetsfc_ann=squeeze(mean(v.lwnetsfc_clm,1));
v.lwnetsfc_sea=get4season(v.lwnetsfc_clm);
sfc.lwnet.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.lwnet.al0=getts(sfc.lwnet.all,s);

tmp=f{'lwflx_clr'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.lwnetsfc_clr_clm=squeeze(mean(tmp,2));
v.lwnetsfc_clr_ann=squeeze(mean(v.lwnetsfc_clr_clm,1));
v.lwnetsfc_clr_sea=get4season(v.lwnetsfc_clr_clm);
sfc.lwnet_clr.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.lwnet_clr.al0=getts(sfc.lwnet_clr.all,s);

tmp=f{'lwflx_dn'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.lwdnsfc_clm=squeeze(mean(tmp,2));
v.lwdnsfc_ann=squeeze(mean(v.lwdnsfc_clm,1));
v.lwdnsfc_sea=get4season(v.lwdnsfc_clm);
sfc.lwdn.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.lwdn.al0=getts(sfc.lwdn.all,s);

tmp=f{'swflx'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.swnetsfc_clm=squeeze(mean(tmp,2));
v.swnetsfc_ann=squeeze(mean(v.swnetsfc_clm,1));
v.swnetsfc_sea=get4season(v.swnetsfc_clm);
sfc.swnet.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.swnet.al0=getts(sfc.swnet.all,s);

tmp=f{'swflx_clr'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.swnetsfc_clr_clm=squeeze(mean(tmp,2));
v.swnetsfc_clr_ann=squeeze(mean(v.swnetsfc_clr_clm,1));
v.swnetsfc_clr_sea=get4season(v.swnetsfc_clr_clm);
sfc.swnet_clr.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.swnet_clr.al0=getts(sfc.swnet_clr.all,s);

tmp=f{'netflx'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.netflxsfc_clm=squeeze(mean(tmp,2));
v.netflxsfc_ann=squeeze(mean(v.netflxsfc_clm,1));
v.netflxsfc_sea=get4season(v.netflxsfc_clm);
sfc.netflx.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.netflx.al0=getts(sfc.netflx.all,s);

tmp=f{'evap'}(t1:t2,v.ys:v.ye,v.xs:v.xe); tmp=tmp/86400*LV0;
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.evap_clm=squeeze(mean(tmp,2));
v.evap_ann=squeeze(mean(v.evap_clm,1));
v.evap_sea=get4season(v.evap_clm);
sfc.evap.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.evap.al0=getts(sfc.evap.all,s);

tmp=f{'shflx'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.shflx_clm=squeeze(mean(-tmp,2));
v.shflx_ann=squeeze(mean(v.shflx_clm,1));
v.shflx_sea=get4season(v.shflx_clm);
sfc.shflx.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.shflx.al0=getts(sfc.shflx.all,s);

tmp=f{'tau_x'}(t1:t2,v.ys:v.ye,v.xs:v.xe)*0.1;
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.taux_clm=squeeze(mean(tmp,2));
v.taux_ann=squeeze(mean(v.taux_clm,1));
v.taux_sea=get4season(v.taux_clm);
sfc.taux.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.taux.al0=getts(sfc.taux.all,s);

tmp=f{'tau_y'}(t1:t2,v.ys:v.ye,v.xs:v.xe)*0.1;
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.tauy_clm=squeeze(mean(tmp,2));
v.tauy_ann=squeeze(mean(v.tauy_clm,1));
v.tauy_sea=get4season(v.tauy_clm);
sfc.tauy.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.tauy.al0=getts(sfc.tauy.all,s);

tmp=f{'albedo_sfc'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.albs_clm=squeeze(mean(tmp,2));
v.albs_ann=squeeze(mean(v.albs_clm,1));
v.albs_sea=get4season(v.albs_clm);
sfc.albs.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.albs.al0=getts(sfc.albs.all,s);

tmp=f{'precip'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.pcp_clm=squeeze(mean(tmp,2));
v.pcp_ann=squeeze(mean(v.pcp_clm,1));
v.pcp_sea=get4season(v.pcp_clm);
sfc.pcp.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.pcp.al0=getts(sfc.pcp.all,s);

tmp=f{'precip_conv'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.prec_cv_clm=squeeze(mean(tmp,2));
v.prec_cv_ann=squeeze(mean(v.prec_cv_clm,1));
v.prec_cv_sea=get4season(v.prec_cv_clm);
sfc.prec_cv.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.prec_cv.al0=getts(sfc.prec_cv.all,s);

tmp=f{'precip_ls'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.prec_ls_clm=squeeze(mean(tmp,2));
v.prec_ls_ann=squeeze(mean(v.prec_ls_clm,1));
v.prec_ls_sea=get4season(v.prec_ls_clm);
sfc.prec_ls.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
sfc.prec_ls.al0=getts(sfc.prec_ls.all,s);

tmp=f{'netflx_toa'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.netradtoa_clm=squeeze(mean(tmp,2));
v.netradtoa_ann=squeeze(mean(v.netradtoa_clm,1));
v.netradtoa_sea=get4season(v.netradtoa_clm);
toa.netrad.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
toa.netrad.al0=getts(toa.netrad.all,s);

%TOA
tmp=f{'lwflx_toa'}(t1:t2,v.ys:v.ye,v.xs:v.xe); tmp=-tmp;
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.lwnettoa_clm=squeeze(mean(tmp,2));
v.lwnettoa_ann=squeeze(mean(v.lwnettoa_clm,1));
v.lwnettoa_sea=get4season(v.lwnettoa_clm);
toa.lwnet.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
toa.lwnet.al0=getts(toa.lwnet.all,s);

tmp=f{'swflx_toa'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.swnettoa_clm=squeeze(mean(tmp,2));
v.swnettoa_ann=squeeze(mean(v.swnettoa_clm,1));
v.swnettoa_sea=get4season(v.swnettoa_clm);
toa.swnet.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
toa.swnet.al0=getts(toa.swnet.all,s);

tmp=f{'lwflx_toa_clr'}(t1:t2,v.ys:v.ye,v.xs:v.xe); tmp=-tmp;
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.lwnettoa_clr_clm=squeeze(mean(tmp,2));
v.lwnettoa_clr_ann=squeeze(mean(v.lwnettoa_clr_clm,1));
v.lwnettoa_clr_sea=get4season(v.lwnettoa_clr_clm);
toa.lwnet_clr.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
toa.lwnet_clr.al0=getts(toa.lwnet_clr.all,s);

tmp=f{'swflx_toa_clr'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.swnettoa_clr_clm=squeeze(mean(tmp,2));
v.swnettoa_clr_ann=squeeze(mean(v.swnettoa_clr_clm,1));
v.swnettoa_clr_sea=get4season(v.swnettoa_clr_clm);
toa.swnet_clr.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
toa.swnet_clr.al0=getts(toa.swnet_clr.all,s);

%ATM
tmp=f{'cape'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.cape_clm=squeeze(mean(tmp,2));
v.cape_ann=squeeze(mean(v.cape_clm,1));
v.cape_sea=get4season(v.cape_clm);
atm.cape.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
atm.cape.al0=getts(atm.cape.all,s);

tmp=f{'tclw'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.lwp_clm=squeeze(mean(tmp,2));
v.lwp_ann=squeeze(mean(v.lwp_clm,1));
v.lwp_sea=get4season(v.lwp_clm);
atm.lwp.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
atm.lwp.al0=getts(atm.lwp.all,s);

tmp=f{'tciw'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.iwp_clm=squeeze(mean(tmp,2));
v.iwp_ann=squeeze(mean(v.iwp_clm,1));
v.iwp_sea=get4season(v.iwp_clm);
atm.iwp.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
atm.iwp.al0=getts(atm.iwp.all,s);

tmp=f{'tcwv'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.wvp_clm=squeeze(mean(tmp,2));
v.wvp_ann=squeeze(mean(v.wvp_clm,1));
v.wvp_sea=get4season(v.wvp_clm);
atm.wvp.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
atm.wvp.al0=getts(atm.wvp.all,s);

tmp=f{'lo_cld'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.qal_clm=squeeze(mean(tmp,2));
v.qal_ann=squeeze(mean(v.qal_clm,1));
v.qal_sea=get4season(v.qal_clm);
atm.qal.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
atm.qal.al0=getts(atm.qal.all,s);

tmp=f{'mid_cld'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.qam_clm=squeeze(mean(tmp,2));
v.qam_ann=squeeze(mean(v.qam_clm,1));
v.qam_sea=get4season(v.qam_clm);
atm.qam.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
atm.qam.al0=getts(atm.qam.all,s);

tmp=f{'hi_cld'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.qah_clm=squeeze(mean(tmp,2));
v.qah_ann=squeeze(mean(v.qah_clm,1));
v.qah_sea=get4season(v.qah_clm);
atm.qah.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
atm.qah.al0=getts(atm.qah.all,s);

lonx=s.lon; latx =s.lat;
sfc.tref.clm     =interp_grid(v.tref_clm,     lonx,latx,v.lon,v.lat,1);
sfc.tref.ann     =interp_grid(v.tref_ann,     lonx,latx,v.lon,v.lat,1);
sfc.tref.sea     =interp_grid(v.tref_sea,     lonx,latx,v.lon,v.lat,1);
sfc.tsurf.clm    =interp_grid(v.tsurf_clm,    lonx,latx,v.lon,v.lat,1);
sfc.tsurf.ann    =interp_grid(v.tsurf_ann,    lonx,latx,v.lon,v.lat,1);
sfc.tsurf.sea    =interp_grid(v.tsurf_sea,    lonx,latx,v.lon,v.lat,1);
sfc.rhref.clm    =interp_grid(v.rhref_clm,    lonx,latx,v.lon,v.lat,1);
sfc.rhref.ann    =interp_grid(v.rhref_ann,    lonx,latx,v.lon,v.lat,1);
sfc.rhref.sea    =interp_grid(v.rhref_sea,    lonx,latx,v.lon,v.lat,1);
sfc.uref.clm     =interp_grid(v.uref_clm,     lonx,latx,v.lon,v.lat,1);
sfc.uref.ann     =interp_grid(v.uref_ann,     lonx,latx,v.lon,v.lat,1);
sfc.uref.sea     =interp_grid(v.uref_sea,     lonx,latx,v.lon,v.lat,1);
sfc.vref.clm     =interp_grid(v.vref_clm,     lonx,latx,v.lon,v.lat,1);
sfc.vref.ann     =interp_grid(v.vref_ann,     lonx,latx,v.lon,v.lat,1);
sfc.vref.sea     =interp_grid(v.vref_sea,     lonx,latx,v.lon,v.lat,1);
sfc.wref.clm     =interp_grid(v.wref_clm,     lonx,latx,v.lon,v.lat,1);
sfc.wref.ann     =interp_grid(v.wref_ann,     lonx,latx,v.lon,v.lat,1);
sfc.wref.sea     =interp_grid(v.wref_sea,     lonx,latx,v.lon,v.lat,1);
sfc.slp.clm      =interp_grid(v.slp_clm,      lonx,latx,v.lon,v.lat,1);
sfc.slp.ann      =interp_grid(v.slp_ann,      lonx,latx,v.lon,v.lat,1);
sfc.slp.sea      =interp_grid(v.slp_sea,      lonx,latx,v.lon,v.lat,1);
sfc.ps.clm       =interp_grid(v.ps_clm,       lonx,latx,v.lon,v.lat,1);
sfc.ps.ann       =interp_grid(v.ps_ann,       lonx,latx,v.lon,v.lat,1);
sfc.ps.sea       =interp_grid(v.ps_sea,       lonx,latx,v.lon,v.lat,1);
sfc.evap.clm     =interp_grid(v.evap_clm,     lonx,latx,v.lon,v.lat,1);
sfc.evap.ann     =interp_grid(v.evap_ann,     lonx,latx,v.lon,v.lat,1);
sfc.evap.sea     =interp_grid(v.evap_sea,     lonx,latx,v.lon,v.lat,1);
sfc.shflx.clm    =interp_grid(v.shflx_clm,    lonx,latx,v.lon,v.lat,1);
sfc.shflx.ann    =interp_grid(v.shflx_ann,    lonx,latx,v.lon,v.lat,1);
sfc.shflx.sea    =interp_grid(v.shflx_sea,    lonx,latx,v.lon,v.lat,1);
sfc.taux.clm     =interp_grid(v.taux_clm,     lonx,latx,v.lon,v.lat,1);
sfc.taux.ann     =interp_grid(v.taux_ann,     lonx,latx,v.lon,v.lat,1);
sfc.taux.sea     =interp_grid(v.taux_sea,     lonx,latx,v.lon,v.lat,1);
sfc.tauy.clm     =interp_grid(v.tauy_clm,     lonx,latx,v.lon,v.lat,1);
sfc.tauy.ann     =interp_grid(v.tauy_ann,     lonx,latx,v.lon,v.lat,1);
sfc.tauy.sea     =interp_grid(v.tauy_sea,     lonx,latx,v.lon,v.lat,1);
sfc.netflx.clm   =interp_grid(v.netflxsfc_clm,lonx,latx,v.lon,v.lat,1);
sfc.netflx.ann   =interp_grid(v.netflxsfc_ann,lonx,latx,v.lon,v.lat,1);
sfc.netflx.sea   =interp_grid(v.netflxsfc_sea,lonx,latx,v.lon,v.lat,1);
sfc.lwnet.clm    =interp_grid(v.lwnetsfc_clm, lonx,latx,v.lon,v.lat,1);
sfc.lwnet.ann    =interp_grid(v.lwnetsfc_ann, lonx,latx,v.lon,v.lat,1);
sfc.lwnet.sea    =interp_grid(v.lwnetsfc_sea, lonx,latx,v.lon,v.lat,1);
sfc.swnet.clm    =interp_grid(v.swnetsfc_clm, lonx,latx,v.lon,v.lat,1);
sfc.swnet.ann    =interp_grid(v.swnetsfc_ann, lonx,latx,v.lon,v.lat,1);
sfc.swnet.sea    =interp_grid(v.swnetsfc_sea, lonx,latx,v.lon,v.lat,1);
sfc.lwnet_clr.clm=interp_grid(v.lwnetsfc_clr_clm, lonx,latx,v.lon,v.lat,1);
sfc.lwnet_clr.ann=interp_grid(v.lwnetsfc_clr_ann, lonx,latx,v.lon,v.lat,1);
sfc.lwnet_clr.sea=interp_grid(v.lwnetsfc_clr_sea, lonx,latx,v.lon,v.lat,1);
sfc.swnet_clr.clm=interp_grid(v.swnetsfc_clr_clm, lonx,latx,v.lon,v.lat,1);
sfc.swnet_clr.ann=interp_grid(v.swnetsfc_clr_ann, lonx,latx,v.lon,v.lat,1);
sfc.swnet_clr.sea=interp_grid(v.swnetsfc_clr_sea, lonx,latx,v.lon,v.lat,1);
sfc.lwdn.clm     =interp_grid(v.lwdnsfc_clm,      lonx,latx,v.lon,v.lat,1);
sfc.lwdn.ann     =interp_grid(v.lwdnsfc_ann,      lonx,latx,v.lon,v.lat,1);
sfc.lwdn.sea     =interp_grid(v.lwdnsfc_sea,      lonx,latx,v.lon,v.lat,1);
sfc.albs.clm     =interp_grid(v.albs_clm,    lonx,latx,v.lon,v.lat,1);
sfc.albs.ann     =interp_grid(v.albs_ann,    lonx,latx,v.lon,v.lat,1);
sfc.albs.sea     =interp_grid(v.albs_sea,    lonx,latx,v.lon,v.lat,1);
sfc.pcp.clm      =interp_grid(v.pcp_clm,     lonx,latx,v.lon,v.lat,1);
sfc.pcp.ann      =interp_grid(v.pcp_ann,     lonx,latx,v.lon,v.lat,1);
sfc.pcp.sea      =interp_grid(v.pcp_sea,     lonx,latx,v.lon,v.lat,1);
sfc.prec_cv.clm  =interp_grid(v.prec_cv_clm, lonx,latx,v.lon,v.lat,1);
sfc.prec_cv.ann  =interp_grid(v.prec_cv_ann, lonx,latx,v.lon,v.lat,1);
sfc.prec_cv.sea  =interp_grid(v.prec_cv_sea, lonx,latx,v.lon,v.lat,1);
sfc.prec_ls.clm  =interp_grid(v.prec_ls_clm, lonx,latx,v.lon,v.lat,1);
sfc.prec_ls.ann  =interp_grid(v.prec_ls_ann, lonx,latx,v.lon,v.lat,1);
sfc.prec_ls.sea  =interp_grid(v.prec_ls_sea, lonx,latx,v.lon,v.lat,1);

sfc.netrad.clm   = sfc.lwnet.clm +sfc.swnet.clm;
sfc.netrad.ann   = sfc.lwnet.ann +sfc.swnet.ann;
sfc.netrad.sea   = sfc.lwnet.sea +sfc.swnet.sea;
sfc.tshflx.clm   =-(sfc.netflx.clm-sfc.netrad.clm);%postive flux into ATM
sfc.tshflx.ann   =-(sfc.netflx.ann-sfc.netrad.ann);
sfc.tshflx.sea   =-(sfc.netflx.sea-sfc.netrad.sea);

toa.lwnet.clm    =interp_grid(v.lwnettoa_clm, lonx,latx,v.lon,v.lat,1);
toa.lwnet.ann    =interp_grid(v.lwnettoa_ann, lonx,latx,v.lon,v.lat,1);
toa.lwnet.sea    =interp_grid(v.lwnettoa_sea, lonx,latx,v.lon,v.lat,1);
toa.swnet.clm    =interp_grid(v.swnettoa_clm, lonx,latx,v.lon,v.lat,1);
toa.swnet.ann    =interp_grid(v.swnettoa_ann, lonx,latx,v.lon,v.lat,1);
toa.swnet.sea    =interp_grid(v.swnettoa_sea, lonx,latx,v.lon,v.lat,1);
toa.netrad.clm   =interp_grid(v.netradtoa_clm,lonx,latx,v.lon,v.lat,1);
toa.netrad.ann   =interp_grid(v.netradtoa_ann,lonx,latx,v.lon,v.lat,1);
toa.netrad.sea   =interp_grid(v.netradtoa_sea,lonx,latx,v.lon,v.lat,1);
toa.lwnet_clr.clm=interp_grid(v.lwnettoa_clr_clm, lonx,latx,v.lon,v.lat,1);
toa.lwnet_clr.ann=interp_grid(v.lwnettoa_clr_ann, lonx,latx,v.lon,v.lat,1);
toa.lwnet_clr.sea=interp_grid(v.lwnettoa_clr_sea, lonx,latx,v.lon,v.lat,1);
toa.swnet_clr.clm=interp_grid(v.swnettoa_clr_clm, lonx,latx,v.lon,v.lat,1);
toa.swnet_clr.ann=interp_grid(v.swnettoa_clr_ann, lonx,latx,v.lon,v.lat,1);
toa.swnet_clr.sea=interp_grid(v.swnettoa_clr_sea, lonx,latx,v.lon,v.lat,1);

atm.netrad.clm = toa.netrad.clm-sfc.netrad.clm;
atm.netrad.ann = toa.netrad.ann-sfc.netrad.ann;
atm.netrad.sea = toa.netrad.sea-sfc.netrad.sea;
atm.lwnet.clm  = toa.lwnet.clm -sfc.lwnet.clm;
atm.lwnet.ann  = toa.lwnet.ann -sfc.lwnet.ann;
atm.lwnet.sea  = toa.lwnet.sea -sfc.lwnet.sea;
atm.swnet.clm  = toa.swnet.clm -sfc.swnet.clm;
atm.swnet.ann  = toa.swnet.ann -sfc.swnet.ann;
atm.swnet.sea  = toa.swnet.sea -sfc.swnet.sea;

atm.cape.clm   =interp_grid(v.cape_clm,lonx,latx,v.lon,v.lat,1);
atm.cape.ann   =interp_grid(v.cape_ann,lonx,latx,v.lon,v.lat,1);
atm.cape.sea   =interp_grid(v.cape_sea,lonx,latx,v.lon,v.lat,1);
atm.qal.clm    =interp_grid(v.qal_clm, lonx,latx,v.lon,v.lat,1);
atm.qal.ann    =interp_grid(v.qal_ann, lonx,latx,v.lon,v.lat,1);
atm.qal.sea    =interp_grid(v.qal_sea, lonx,latx,v.lon,v.lat,1);
atm.qam.clm    =interp_grid(v.qam_clm, lonx,latx,v.lon,v.lat,1);
atm.qam.ann    =interp_grid(v.qam_ann, lonx,latx,v.lon,v.lat,1);
atm.qam.sea    =interp_grid(v.qam_sea, lonx,latx,v.lon,v.lat,1);
atm.qah.clm    =interp_grid(v.qah_clm, lonx,latx,v.lon,v.lat,1);
atm.qah.ann    =interp_grid(v.qah_ann, lonx,latx,v.lon,v.lat,1);
atm.qah.sea    =interp_grid(v.qah_sea, lonx,latx,v.lon,v.lat,1);
atm.lwp.clm    =interp_grid(v.lwp_clm, lonx,latx,v.lon,v.lat,1);
atm.lwp.ann    =interp_grid(v.lwp_ann, lonx,latx,v.lon,v.lat,1);
atm.lwp.sea    =interp_grid(v.lwp_sea, lonx,latx,v.lon,v.lat,1);
atm.iwp.clm    =interp_grid(v.iwp_clm, lonx,latx,v.lon,v.lat,1);
atm.iwp.ann    =interp_grid(v.iwp_ann, lonx,latx,v.lon,v.lat,1);
atm.iwp.sea    =interp_grid(v.iwp_sea, lonx,latx,v.lon,v.lat,1);
atm.wvp.clm    =interp_grid(v.wvp_clm, lonx,latx,v.lon,v.lat,1);
atm.wvp.ann    =interp_grid(v.wvp_ann, lonx,latx,v.lon,v.lat,1);
atm.wvp.sea    =interp_grid(v.wvp_sea, lonx,latx,v.lon,v.lat,1);

%zonal average
sfc.netrad.latdis.sea    = squeeze(mean(sfc.netrad.sea,3));
sfc.lwnet.latdis.sea     = squeeze(mean(sfc.lwnet.sea,3));
sfc.swnet.latdis.sea     = squeeze(mean(sfc.swnet.sea,3));
sfc.lwnet_clr.latdis.sea = squeeze(mean(sfc.lwnet_clr.sea,3));
sfc.swnet_clr.latdis.sea = squeeze(mean(sfc.swnet_clr.sea,3));
sfc.lwdn.latdis.sea      = squeeze(mean(sfc.lwdn.sea,3));
sfc.tref.latdis.sea      = squeeze(mean(sfc.tref.sea,3));
sfc.tsurf.latdis.sea     = squeeze(mean(sfc.tsurf.sea,3));
sfc.rhref.latdis.sea     = squeeze(mean(sfc.rhref.sea,3));
sfc.uref.latdis.sea      = squeeze(mean(sfc.uref.sea,3));
sfc.vref.latdis.sea      = squeeze(mean(sfc.vref.sea,3));
sfc.wref.latdis.sea      = squeeze(mean(sfc.wref.sea,3));
sfc.taux.latdis.sea      = squeeze(mean(sfc.taux.sea,3));
sfc.tauy.latdis.sea      = squeeze(mean(sfc.tauy.sea,3));
sfc.evap.latdis.sea      = squeeze(mean(sfc.evap.sea,3));
sfc.shflx.latdis.sea     = squeeze(mean(sfc.shflx.sea,3));
sfc.slp.latdis.sea       = squeeze(mean(sfc.slp.sea,3));
sfc.ps.latdis.sea        = squeeze(mean(sfc.ps.sea,3));
sfc.albs.latdis.sea      = squeeze(mean(sfc.albs.sea,3));
sfc.pcp.latdis.sea       = squeeze(mean(sfc.pcp.sea,3));
sfc.prec_ls.latdis.sea   = squeeze(mean(sfc.prec_ls.sea,3));
sfc.prec_cv.latdis.sea   = squeeze(mean(sfc.prec_cv.sea,3));
sfc.tshflx.latdis.sea    = squeeze(mean(sfc.tshflx.sea,3));

toa.netrad.latdis.sea    = squeeze(mean(toa.netrad.sea,3));
toa.lwnet.latdis.sea     = squeeze(mean(toa.lwnet.sea,3));
toa.swnet.latdis.sea     = squeeze(mean(toa.swnet.sea,3));
toa.lwnet_clr.latdis.sea = squeeze(mean(toa.lwnet_clr.sea,3));
toa.swnet_clr.latdis.sea = squeeze(mean(toa.swnet_clr.sea,3));

atm.cape.latdis.sea      = squeeze(mean(atm.cape.sea,3));
atm.netrad.latdis.sea    = squeeze(mean(atm.netrad.sea,3));
atm.lwnet.latdis.sea     = squeeze(mean(atm.lwnet.sea,3));
atm.swnet.latdis.sea     = squeeze(mean(atm.swnet.sea,3));
atm.lwp.latdis.sea       = squeeze(mean(atm.lwp.sea,3));
atm.iwp.latdis.sea       = squeeze(mean(atm.iwp.sea,3));
atm.wvp.latdis.sea       = squeeze(mean(atm.wvp.sea,3));
atm.qal.latdis.sea       = squeeze(mean(atm.qal.sea,3));
atm.qam.latdis.sea       = squeeze(mean(atm.qam.sea,3));
atm.qah.latdis.sea       = squeeze(mean(atm.qah.sea,3));

sfc.fn=fname;
toa.fn=fname;
atm.fn=fname;

return


for t=1:v.nt
  for j=1:v.nlat
    for i=1:v.nlon
      tmp(t,j,i)=qs_tp(tref(t,j,i),ps(t,j,i))*rhref(t,j,i)*0.01;
    end
  end
end
v.qref=mycvp2d(tmp,v,wsize);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=squeeze(mean(tmp,2));
[tmp,vx.lon,vx.lat]=intp_to_model(tmp,v.lon,v.lat,latlon);

