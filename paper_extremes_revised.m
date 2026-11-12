o=load('/archive/Ming.Zhao/awg/2023.04/c192_obs/fwihw/c192_obs_1979_2020.hw_thresh_original_and_correct.mat'); o=o.v;
v=load('/archive/Ming.Zhao/awg/2023.04/c192L33_am4p0_2010climo_newctl/fwihw/c192L33_am4p0_2010climo_newctl_2_101.hw_thresh_original_and_correction.mat'); v=v.v;
xs=z.v0.xs; xe=z.v0.xe; ys=z.v0.ys; ye=z.v0.ye;
for i=1:length(v.thresh(1,:,1,1))
  a=squeeze(v.thresh  (:,2,ys:ye,xs:xe)); cntl.th(i)=compute_season_from_daily(a);
  a=squeeze(v.thresh_c(:,2,ys:ye,xs:xe)); ctlc.th(i)=compute_season_from_daily(a);
  a=squeeze(o.thresh  (:,2,ys:ye,xs:xe)); era5.th(i)=compute_season_from_daily(a);
end
hw.cntl.th(1,:,:)=cntl.th(2).djf;
hw.cntl.th(2,:,:)=cntl.th(2).mam; 
hw.cntl.th(3,:,:)=cntl.th(2).jja;
hw.cntl.th(4,:,:)=cntl.th(2).son; 
hw.ctlc.th(1,:,:)=ctlc.th(2).djf;
hw.ctlc.th(2,:,:)=ctlc.th(2).mam; 
hw.ctlc.th(3,:,:)=ctlc.th(2).jja;
hw.ctlc.th(4,:,:)=ctlc.th(2).son; 
hw.era5.th(1,:,:)=era5.th(2).djf;
hw.era5.th(2,:,:)=era5.th(2).mam; 
hw.era5.th(3,:,:)=era5.th(2).jja;
hw.era5.th(4,:,:)=era5.th(2).son; 

%dmget data
set tpath = /archive/Ming.Zhao/awg/2023.04/
set expn  = c192L33_am4p0_2010climo_newctl
set expn  = c192L33_am4p0_2010climo_newctl_p1K
set expn  = c192L33_am4p0_2010climo_newctl_p4K
set expn  = c192L33_am4p0_2010climo_newctl_4xCO2
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_times_2
set expn  = c192L33_am4p0_2010climo_p4K
set expn  = c192L33_am4p0_2010climo_old
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_atlantic_mdr_obs
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_so_45_75s_obs

set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_obs
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_10n_70n_obs
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_south_pacific_10s_45s_obs
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_tropical_30ns_obs
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_zonal

set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_best_wegradient
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_2best_wegradient
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_middle_wegradient
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_2worst_wegradient
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_worst_wegradient


set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m3
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m16
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m17
set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m26

set tpath = /archive/Ming.Zhao/awg/2023.04
dmget $tpath/$expn/ts_all/*.nc &


set epath = $tpath/$expn/atmos_data
cd $epath/daily
dmget *ps.nc *pr.nc *tas*.nc *sfcWind*.nc *hurs*.nc *ts.nc *uas.nc *vas.nc *huss.nc &
cd $epath
dmget $epath/3hr/*pr.nc &
dmget $epath/daily_river/*rv_o_h2o.nc &
dmget $epath/daily_land_cmip/*mrsos*.nc &
dmget $epath/daily_land/*runf_soil.nc &
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%step 1: compute model daily climo and climo biases
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/'; opt=0;
pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; latlon=[0 360 -90 90]; yr1=1979; yr2=2014; do_trend=1;
pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; latlon=[0 360 -90 90]; yr1=1950; yr2=2020; do_trend=1;
expn='c192_obs';             read_daily_obs  (tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip';    read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_02'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_03'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_04'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_05'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_06'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_07'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_08'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_09'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_10'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_11'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_12'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_13'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_14'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_15'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_16'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_17'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_18'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_19'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_20'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_21'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_22'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_23'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_24'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_25'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_26'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
expn='c192L33_CM4X_amip_27'; read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%step 2: compute heatwave threshold used for HW analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/'; pct=[90 95 99]; latlon=[0 360 -90 90]; yr1=1950; yr2=2020;
expn='c192_obs';              v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,0)
expn='c192L33_CM4X_amip_01';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_02';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_03';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_04';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_05';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_06';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_07';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_08';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_09';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_10';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_11';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_12';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_13';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_14';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_15';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_16';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_17';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_18';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_19';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_20';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_21';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_22';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_23';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_24';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_25';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_26';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
expn='c192L33_CM4X_amip_27';  v=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%step 3: compute HW analysis and FWI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/'; do_trend=0;  yr1=1950; yr2=2020;
expn='c192_obs';              v=do_fwihw_global_era5(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_01';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_02';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_03';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_04';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_05';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_06';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_07';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_08';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_09';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_10';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_11';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_12';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_13';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_14';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_15';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_16';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_17';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_18';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_19';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_20';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_21';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_22';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_23';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_24';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_25';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_26';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
expn='c192L33_CM4X_amip_27';  v=do_fwihw_global     (tpath,expn,yr1,yr2,do_trend)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/'; do_trend=0;  yr1=2; yr2=101;
expn='c192L33_am4p0_2010climo_newctl';                                  v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2';                 v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear';                   v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_best_wegradient';   v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_worst_wegradient';  v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_2best_wegradient';  v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_2worst_wegradient'; v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_middle_wegradient'; v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)

expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs';          v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs';             v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_atlantic_mdr_obs';          v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_so_45_75s_obs';             v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_obs';         v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_10n_70n_obs'; v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_south_pacific_10s_45s_obs'; v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_tropical_30ns_obs';         v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_tropical_20ns_obs';         v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_30ns_obs';          v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_20ns_obs';          v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_zonal';                     v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)

expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m3';        v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m16';       v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m17';       v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m26';       v=do_fwihw_global_ctlthresh(tpath,expn,yr1,yr2,do_trend)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%step 4: US extremes analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/'; opt=0; diag=0; do_trend=0; do_part=3;%1:do_yea=1; 2:do_hyr=1; 3:do_sea=1; 4:do_mon=1;
pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; latlon=[190 304 16 75]; yr1=1950; yr2=2020; %latlon=[0 360 -90 90];
%yr1=2; yr2=101; %yr1=2001; yr2=2020;
%expn='c192_obs'; yr1=1979; yr2=2014; opt=0;            v=read_daily_namerica_obs(tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192_obs'; yr1=1979; yr2=2020; opt=0;             v=read_daily_namerica_obs(tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192_obs';                                        v=read_daily_namerica_obs(tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_01';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_02';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_03';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_04';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_05';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_06';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_07';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_08';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_09';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_10';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_11';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_12';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_13';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_14';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_15';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_16';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_17';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_18';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_19';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_20';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_21';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_22';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_23';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_24';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_25';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_26';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_CM4X_amip_27';                            v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%step 4: US extremes analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/'; opt=0; diag=0; do_trend=0; do_part=3;%1:do_yea=1; 2:do_hyr=1; 3:do_sea=1; 4:do_mon=1;
pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; latlon=[190 304 16 75]; %latlon=[0 360 -90 90];
yr1=2; yr2=101;
expn='c192L33_am4p0_2010climo_p4K';                                    v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_old';                                    v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_newctl';                                 v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_newctl_p1K';                             v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_newctl_4xCO2';                           v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear';                  v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2';                v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs'; v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs';    v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_atlantic_mdr_obs'; v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_so_45_75s_obs';    v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)

expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_obs';         v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_10n_70n_obs'; v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_south_pacific_10s_45s_obs'; v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_tropical_30ns_obs';         v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_zonal';                     v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_tropical_20ns_obs';         v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_20ns_obs';          v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_30ns_obs';          v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)

expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_best_wegradient';  v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_2best_wegradient'; v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_middle_wegradient';v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_2worst_wegradient';v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_worst_wegradient'; v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)

expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m17';      v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m16';      v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m26';      v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m3';       v=read_daily_namerica    (tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read daily extremes analsyis for AR, TS, MCS trend and interannual varibility
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/'; opt=0; diag=0; do_trend=1; do_part=1;%1:do_yea=1; 2:do_hyr=1; 3:do_sea=1; 4:do_mon=1;
pct=[1 5 10 25 50 75 90 95 99]; latlon=[0 360 -90 90]; yr1=1950; yr2=2020; %latlon=[0 360 -90 90];
%yr1=2; yr2=101; %yr1=2001; yr2=2020;
%expn='c192_obs';            v=read_daily_namerica_obs(tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
%yr1=1950; yr2=1951; do_trend=0;
for i=21:27
  mm=sprintf('%02d',i);
  expn=strcat('c192L33_CM4X_amip_',mm)
  v=read_daily_extremes(tpath,expn,yr1,yr2,pct,opt,diag,latlon,do_trend,do_part)
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load results and plot figures%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ph='/work/miz/mat_hiresmip/land/'; f='_2_101_RO_diag0_read_daily_namerica_new.mat';
ph='/work/miz/mat_hiresmip/land/'; f='_2_101_opt0_diag0_read_daily_namerica_year.mat';
ph='/work/miz/mat_hiresmip/land/'; f='_2_101_opt0_diag0_read_daily_namerica_sea.mat';
e='c192L33_am4p0_2010climo_newctl';                 n=strcat(ph,e,f); load(n);z.v0=v;
e='c192L33_am4p0_2010climo_newctl_p1K';             n=strcat(ph,e,f); load(n);z.w0=v; 
e='c192L33_am4p0_2010climo_newctl_4xCO2';           n=strcat(ph,e,f); load(n);z.g0=v; 
e='c192L33_am4p0_2010climo_trend_1979_2020_spear';  n=strcat(ph,e,f); load(n);z.w1=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_times_2';n=strcat(ph,e,f); load(n);z.w2=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load results and plot figures for studing pattern effects
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/'; opt=0; diag=0; f='_2_101_opt0_diag0_read_daily_namerica_new.mat';
%e='c192L33_CM4X_amip'; f='_1979_2020_opt0_diag0_read_daily_namerica.mat'; n=strcat(tpath,e,'/',e,f); load(n);z.vx=v;
%e='c192_obs'; f='_1979_2014_opt0_diag0_read_daily_namerica.mat';     n=strcat(tpath,e,'/',e,f); load(n);z.vo=v;
e='c192_obs'; f='_1979_2020_opt0_diag0_read_daily_namerica_obs_new.mat'; n=strcat(tpath,e,'/',e,f); load(n);z.vo=v;
tpath='/archive/Ming.Zhao/awg/2023.04/'; opt=0; diag=0; f='_2_101_opt0_diag0_read_daily_namerica_new.mat';
e='c192L33_am4p0_2010climo_newctl';                                  n=strcat(tpath,e,'/',e,f); load(n);z.v0=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear';                   n=strcat(tpath,e,'/',e,f); load(n);z.w1=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_times_2';                 n=strcat(tpath,e,'/',e,f); load(n);z.w2=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs';  n=strcat(tpath,e,'/',e,f); load(n);z.w1a=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_20ns_obs';  n=strcat(tpath,e,'/',e,f); load(n);z.w1b=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_30ns_obs';  n=strcat(tpath,e,'/',e,f); load(n);z.w1c=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_tropical_30ns_obs'; n=strcat(tpath,e,'/',e,f); load(n);z.w1d=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs';  n=strcat(tpath,e,'/',e,f); load(n);z.w1a=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs';     n=strcat(tpath,e,'/',e,f); load(n);z.w1b=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_atlantic_mdr_obs';  n=strcat(tpath,e,'/',e,f); load(n);z.w1c=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_so_45_75s_obs';     n=strcat(tpath,e,'/',e,f); load(n);z.w1d=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_best_wegradient';   n=strcat(tpath,e,'/',e,f); load(n);z.w1A=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_2best_wegradient';  n=strcat(tpath,e,'/',e,f); load(n);z.w1B=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_2worst_wegradient'; n=strcat(tpath,e,'/',e,f); load(n);z.w1C=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_worst_wegradient';  n=strcat(tpath,e,'/',e,f); load(n);z.w1D=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn='/work/miz/mat_hiresmip/sst_patterns_extremes_z_new.mat'; save(fn,'z','-v7.3');
fn='/work/miz/mat_hiresmip/sst_patterns_extremes_z_new.mat'; load(fn);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigR1: percentile changes in TAS, VPD, TWB, and RH at 2m%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea;
ipct=9;  iipct=3; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %95th 5th
%ipct=10; iipct=2; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %99th 1th
A0='ERA5'; a0='Control'; a1='SPEAR-pattern M;~'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='tas_vpd_twb_rh'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
p.vname='FigR1'; sopt=1; slev=90; sopt=2; slev=95; %sopt=1:z-test; 2 Welch's two-sample t-test; slev=95; 95% confidence
del=' $\Delta$'; s0='TAS;'; s1='VPD; '; s2='TWB; '; s3='RH; ';
A0=strcat(A0,'~(',p.sea,');~'); a0=strcat(a0,'~(',p.sea,');~');;
p.S0 =strcat(A0,s0); p.s0 =strcat(a0,s0); p.s1 =strcat(a1,del,s0); p.s2 =strcat(a2,del,s0); 
p.S3 =strcat(A0,s1); p.s3 =strcat(a0,s1); p.s4 =strcat(a1,del,s1); p.s5 =strcat(a2,del,s1); 
p.S6 =strcat(A0,s2); p.s6 =strcat(a0,s2); p.s7 =strcat(a1,del,s2); p.s8 =strcat(a2,del,s2); 
p.S9 =strcat(A0,s3); p.s9 =strcat(a0,s3); p.s10=strcat(a1,del,s3); p.s11=strcat(a2,del,s3);
p.unit0 ='$\rm{^{\circ}C}$';    p.unit0_bar ='\rm{^{\circ}C}';
p.unit1 ='$\rm{KK^{-1}}$';      p.unit1_bar ='\rm{KK^{-1}}';
p.unit3 ='$\rm{hPa}$';          p.unit3_bar ='\rm{hPa}'; 
p.unit4 ='$\rm{hPaK^{-1}}$';    p.unit4_bar ='\rm{hPaK^{-1}}'; 
p.unit6 ='$\rm{^{\circ}C}$';    p.unit6_bar ='\rm{^{\circ}C}';
p.unit7 ='$\rm{KK^{-1}}$';      p.unit7_bar ='\rm{KK^{-1}}';
p.unit9 ='$\rm{\%}$';           p.unit9_bar ='\rm{%}'; 
p.unit10='$\rm{\%K^{-1}}$';     p.unit10_bar='\rm{%K^{-1}}';

p.cmin0= 0.0; p.cmax0=40;  p.cmin1 =-5.0;  p.cmax1 =5.0;
p.cmin3= 0.0; p.cmax3=50;  p.cmin4 =-10.;  p.cmax4 =10.;
p.cmin6= 0.0; p.cmax6=35;  p.cmin7 =-3.0;  p.cmax7 =3.0;
p.cmin9= 0.0; p.cmax9=100; p.cmin10=-10.;  p.cmax10=10.;
p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;
p.dT1=1.22; p.dT2=1.24;

v=z.v0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

v=z.v0; nb=20; no=14; num=1; mskopt=0;
pct_th=v.pct; spct=sprintf( '%4.2fth',pct_th(ipct));  ispct=sprintf( '%4.2fth',pct_th(iipct));
p.S0=strcat(p.S0,'~',spct);p.S3=strcat(p.S3,'~',spct);p.S6=strcat(p.S6,'~',spct);p.S9=strcat(p.S9,'~',ispct);
p.s0=strcat(p.s0,'~',spct);p.s3=strcat(p.s3,'~',spct);p.s6=strcat(p.s6,'~',spct);p.s9=strcat(p.s9,'~',ispct);
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%tasday
v=z.vo.tasday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.tasday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.tasday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.tasday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V0=d.a1_avg; p.dV0=d.avg.a1_avg;
p.v0=d.a2_avg; p.dv0=d.avg.a2_avg; p.isig0=d.idx; p.isig0_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v1=d.diff/dT; p.dv1=d.avg.diff/dT; p.isig1=d.idx; p.isig1_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v2=d.diff/dT; p.dv2=d.avg.diff/dT; p.isig2=d.idx; p.isig2_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig2m1=d.idx; p.isig2m1_av=d.avg.idx; pp=p;
%% v=z.vo.tasday; A0=squeeze(v.pct(m,ipct,:,:));
%% v=z.v0.tasday; a0=squeeze(v.pct(m,ipct,:,:));
%% v=z.w1.tasday; a1=squeeze(v.pct(m,ipct,:,:));
%% v=z.w2.tasday; a2=squeeze(v.pct(m,ipct,:,:));
%% a=A0; p.V0=a; p.dV0=mean(a(id).*aa);
%% a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
%% if (p.do_bias); a=a0-A0; p.v0=a; p.dv0=mean(a(id).*aa); p.cmin0= p.cmin1; p.cmax0=p.cmax1; end;
%% a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);

%vpdday
v=z.vo.vpdday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.vpdday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.vpdday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.vpdday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V3=d.a1_avg; p.dV3=d.avg.a1_avg;
p.v3=d.a2_avg; p.dv3=d.avg.a2_avg; p.isig3=d.idx; p.isig3_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v4=d.diff/dT; p.dv4=d.avg.diff/dT; p.isig4=d.idx; p.isig4_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v5=d.diff/dT; p.dv5=d.avg.diff/dT; p.isig5=d.idx; p.isig5_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig5m4=d.idx; p.isig5m4_av=d.avg.idx; pp=p;

%% v=z.vo.vpdday; A0=squeeze(v.pct(m,ipct,:,:));
%% v=z.v0.vpdday; a0=squeeze(v.pct(m,ipct,:,:));
%% v=z.w1.vpdday; a1=squeeze(v.pct(m,ipct,:,:));
%% v=z.w2.vpdday; a2=squeeze(v.pct(m,ipct,:,:));
%% a=A0; p.V3=a; p.dV3=mean(a(id).*aa);
%% a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
%% if (p.do_bias);  a=a0-A0; p.v3=a; p.dv3=mean(a(id).*aa); p.cmin3= p.cmin4; p.cmax3=p.cmax4; end;
%% a=(a1-a0)/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa);

%twbday
v=z.vo.twbday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.twbday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.twbday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.twbday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V6=d.a1_avg; p.dV6=d.avg.a1_avg;
p.v6=d.a2_avg; p.dv6=d.avg.a2_avg; p.isig6=d.idx; p.isig6_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v7=d.diff/dT; p.dv7=d.avg.diff/dT; p.isig7=d.idx; p.isig7_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v8=d.diff/dT; p.dv8=d.avg.diff/dT; p.isig8=d.idx; p.isig8_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig8m7=d.idx; p.isig8m7_av=d.avg.idx;pp=p;

%% v=z.vo.twbday; A0=squeeze(v.pct(m,ipct,:,:));
%% v=z.v0.twbday; a0=squeeze(v.pct(m,ipct,:,:));
%% v=z.w1.twbday; a1=squeeze(v.pct(m,ipct,:,:));
%% v=z.w2.twbday; a2=squeeze(v.pct(m,ipct,:,:));
%% a=A0; p.V6=a; p.dV6=mean(a(id).*aa);
%% a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
%% if (p.do_bias); a=a0-A0; p.v6=a; p.dv6=mean(a(id).*aa); p.cmin6= p.cmin7; p.cmax6=p.cmax7; end;
%% a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);

%RHday
v=z.vo.rhday; a=squeeze(v.yr_pct(m,:,iipct,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.rhday; a=squeeze(v.yr_pct(m,:,iipct,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.rhday; a=squeeze(v.yr_pct(m,:,iipct,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.rhday; a=squeeze(v.yr_pct(m,:,iipct,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V9=d.a1_avg; p.dV9=d.avg.a1_avg;
p.v9=d.a2_avg; p.dv9=d.avg.a2_avg; p.isig9=d.idx; p.isig9_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v10=d.diff/dT; p.dv10=d.avg.diff/dT; p.isig10=d.idx; p.isig10_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v11=d.diff/dT; p.dv11=d.avg.diff/dT; p.isig11=d.idx; p.isig11_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig11m10=d.idx; p.isig11m10_av=d.avg.idx;pp=p;

%% v=z.vo.rhday; A0=squeeze(v.pct(m,iipct,:,:));
%% v=z.v0.rhday; a0=squeeze(v.pct(m,iipct,:,:));
%% v=z.w1.rhday; a1=squeeze(v.pct(m,iipct,:,:));
%% v=z.w2.rhday; a2=squeeze(v.pct(m,iipct,:,:));
%% a=A0; p.V9=a; p.dV9=nanmean(a(id).*aa);
%% a=a0; p.v9=a; p.dv9=nanmean(a(id).*aa);
%% if (p.do_bias); a=a0-A0; p.v9=a; p.dv9=mean(a(id).*aa); p.cmin9= p.cmin10; p.cmax9=p.cmax10; end;
%% a=(a1-a0)/p.dT1; p.v10=a; p.dv10=nanmean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v11=a; p.dv11=nanmean(a(id).*aa);

p.fmt='eps'; plot_pattern_effect_Fig_extremes_20panel_Transposed(p); %plot_pattern_effect_Fig_extremes(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigR2: HeatWave statistics: HWF and HWI Intensity%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea; ipct=9; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9];
A0='ERA5'; a0='Control'; a1='SPEAR-pattern M;~'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='hwf2_hwf2c_hwi2_hwi2c'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
p.vname='FigR2'; sopt=1; slev=90; sopt=2; slev=95; %sopt=1:z-test; 2 Welch's two-sample t-test; slev=95; 95% confidence
del=' $\Delta$'; s0='HWF;'; s1='HWFc; '; s2='HWI; '; s3='HWIc; ';
A0=strcat(A0,'~(',p.sea,');~'); a0=strcat(a0,'~(',p.sea,');~');;
p.S0 =strcat(A0,s0); p.s0 =strcat(a0,s0); p.s1 =strcat(a1,del,s0); p.s2 =strcat(a2,del,s0); 
p.S3 =strcat(A0,s0); p.s3 =strcat(a0,s1); p.s4 =strcat(a1,del,s1); p.s5 =strcat(a2,del,s1); 
p.S6 =strcat(A0,s2); p.s6 =strcat(a0,s2); p.s7 =strcat(a1,del,s2); p.s8 =strcat(a2,del,s2); 
p.S9 =strcat(A0,s2); p.s9 =strcat(a0,s3); p.s10=strcat(a1,del,s3); p.s11=strcat(a2,del,s3);
p.unit0 ='$\rm{\%}$';           p.unit0_bar ='\rm{%}';
p.unit1 ='$\rm{\%K^{-1}}$';     p.unit1_bar ='\rm{%K^{-1}}';
p.unit3 ='$\rm{\%}$';           p.unit3_bar ='\rm{%}'; 
p.unit4 ='$\rm{\%K^{-1}}$';     p.unit4_bar ='\rm{%K^{-1}}'; 
p.unit6 ='$\rm{^{\circ}C}$';    p.unit6_bar ='\rm{^{\circ}C}';
p.unit7 ='$\rm{KK^{-1}}$';      p.unit7_bar ='\rm{KK^{-1}}';
p.unit9 ='$\rm{^{\circ}C}$';    p.unit9_bar ='\rm{^{\circ}C}';
p.unit10='$\rm{KK^{-1}}$';      p.unit10_bar='\rm{KK^{-1}}';

p.cmin0= 0.0; p.cmax0=4;  p.cmin1 =-20;  p.cmax1 =20;
p.cmin3= 0.0; p.cmax3=4;  p.cmin4 =-20;  p.cmax4 =20;
p.cmin6= 0.0; p.cmax6=40; p.cmin7 =-2;   p.cmax7 =2;
p.cmin9= 0.0; p.cmax9=40; p.cmin10=-2;   p.cmax10=2;
p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;
p.dT1=1.22; p.dT2=1.24;

v=z.v0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

v=z.v0; nb=20; no=14; num=1; mskopt=0;
pct_th=v.pct; spct=sprintf( '%4.2fth',pct_th(ipct));
p.S0=strcat(p.S0);p.S3=strcat(p.S3);p.S6=strcat(p.S6);p.S9=strcat(p.S9);
p.s0=strcat(p.s0);p.s3=strcat(p.s3);p.s6=strcat(p.s6);p.s9=strcat(p.s9);
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%HWday2
v=z.vo.hwday2; a=squeeze(v.yr_av(m,:,:,:))*100; A0=a; S0=squeeze(std(a,1,1));
v=z.v0.hwday1; a=squeeze(v.yr_av(m,:,:,:))*100; a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.hwday1; a=squeeze(v.yr_av(m,:,:,:))*100; a1=a; s1=squeeze(std(a,1,1));
v=z.w2.hwday1; a=squeeze(v.yr_av(m,:,:,:))*100; a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V0=d.a1_avg; p.dV0=d.avg.a1_avg;
p.v0=d.a2_avg; p.dv0=d.avg.a2_avg; p.isig0=d.idx; p.isig0_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v1=d.diff/dT; p.dv1=d.avg.diff/dT; p.isig1=d.idx; p.isig1_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v2=d.diff/dT; p.dv2=d.avg.diff/dT; p.isig2=d.idx; p.isig2_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig2m1=d.idx; p.isig2m1_av=d.avg.idx;pp=p;

v=z.vo.hwday2; A0=squeeze(v.av(m,:,:))*100;
v=z.v0.hwday1; a0=squeeze(v.av(m,:,:))*100; %note hwday1 contain HW days defined using pct=95 threshold
v=z.w1.hwday1; a1=squeeze(v.av(m,:,:))*100;
v=z.w2.hwday1; a2=squeeze(v.av(m,:,:))*100;
a=A0; p.V0=a; p.dV0=mean(a(id).*aa);
a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v0=a; p.dv0=mean(a(id).*aa); p.cmin0= p.cmin1; p.cmax0=p.cmax1; end;
a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);

%HWday2_c
v=z.vo.hwday2; a=squeeze(v.yr_av(m,:,:,:))*100; A0=a; S0=squeeze(std(a,1,1));
v=z.v0.hwday2; a=squeeze(v.yr_av(m,:,:,:))*100; a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.hwday2; a=squeeze(v.yr_av(m,:,:,:))*100; a1=a; s1=squeeze(std(a,1,1));
v=z.w2.hwday2; a=squeeze(v.yr_av(m,:,:,:))*100; a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V3=d.a1_avg; p.dV3=d.avg.a1_avg;
p.v3=d.a2_avg; p.dv3=d.avg.a2_avg; p.isig3=d.idx; p.isig3_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v4=d.diff/dT; p.dv4=d.avg.diff/dT; p.isig4=d.idx; p.isig4_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v5=d.diff/dT; p.dv5=d.avg.diff/dT; p.isig5=d.idx; p.isig5_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig5m4=d.idx; p.isig5m4_av=d.avg.idx;pp=p;

%% v=z.vo.hwday2; A0=squeeze(v.av(m,:,:))*100;
%% v=z.v0.hwday2; a0=squeeze(v.av(m,:,:))*100;
%% v=z.w1.hwday2; a1=squeeze(v.av(m,:,:))*100;
%% v=z.w2.hwday2; a2=squeeze(v.av(m,:,:))*100;
%% a=A0; p.V3=a; p.dV3=mean(a(id).*aa);
%% a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
%% if (p.do_bias); a=a0-A0; p.v3=a; p.dv3=mean(a(id).*aa); p.cmin3= p.cmin1; p.cmax3=p.cmax1; end;
%% a=(a1-a0)/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa);

%HWtmx
n=length(z.vo.hwtmx2.yr_av(1,:,1,1)); a=hw.era5.th(m,:,:); hw_era5_th=repmat(a,[n,1,1]);
n=length(z.v0.hwtmx1.yr_av(1,:,1,1)); a=hw.cntl.th(m,:,:); hw_cntl_th=repmat(a,[n,1,1]);
v=z.vo.hwtmx2; a=squeeze(v.yr_av(m,:,:,:)./z.vo.hwday2.yr_av(m,:,:,:))+hw_era5_th; A0=a; S0=squeeze(std(a,1,1));
v=z.v0.hwtmx1; a=squeeze(v.yr_av(m,:,:,:)./z.v0.hwday1.yr_av(m,:,:,:))+hw_cntl_th; a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.hwtmx1; a=squeeze(v.yr_av(m,:,:,:)./z.w1.hwday1.yr_av(m,:,:,:))+hw_cntl_th; a1=a; s1=squeeze(std(a,1,1));
v=z.w2.hwtmx1; a=squeeze(v.yr_av(m,:,:,:)./z.w2.hwday1.yr_av(m,:,:,:))+hw_cntl_th; a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V6=d.a1_avg; p.dV6=d.avg.a1_avg;
p.v6=d.a2_avg; p.dv6=d.avg.a2_avg; p.isig6=d.idx; p.isig6_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v7=d.diff/dT; p.dv7=d.avg.diff/dT; p.isig7=d.idx; p.isig7_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v8=d.diff/dT; p.dv8=d.avg.diff/dT; p.isig8=d.idx; p.isig8_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig8m7=d.idx; p.isig8m7_av=d.avg.idx; pp=p;

%% v=z.vo.hwtmx2; A0=squeeze(v.av(m,:,:)./z.vo.hwday2.av(m,:,:))+squeeze(hw.era5.th(m,:,:));
%% v=z.v0.hwtmx1; a0=squeeze(v.av(m,:,:)./z.v0.hwday1.av(m,:,:))+squeeze(hw.cntl.th(m,:,:));
%% v=z.w1.hwtmx1; a1=squeeze(v.av(m,:,:)./z.w1.hwday1.av(m,:,:))+squeeze(hw.cntl.th(m,:,:));
%% v=z.w2.hwtmx1; a2=squeeze(v.av(m,:,:)./z.w2.hwday1.av(m,:,:))+squeeze(hw.cntl.th(m,:,:));
%% a=A0; p.V6=a; p.dV6=mean(a(id).*aa);
%% a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
%% if (p.do_bias); a=a0-A0; p.v6=a; p.dv6=mean(a(id).*aa); p.cmin6= p.cmin7; p.cmax6=p.cmax7; end;
%% a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);

%HWtmx_c
n=length(z.vo.hwtmx2.yr_av(1,:,1,1)); a=hw.era5.th(m,:,:); hw_era5_th=repmat(a,[n,1,1]);
n=length(z.v0.hwtmx1.yr_av(1,:,1,1)); a=hw.ctlc.th(m,:,:); hw_ctlc_th=repmat(a,[n,1,1]);
v=z.vo.hwtmx2; a=squeeze(v.yr_av(m,:,:,:)./z.vo.hwday2.yr_av(m,:,:,:))+hw_era5_th; A0=a; S0=squeeze(std(a,1,1));
v=z.v0.hwtmx2; a=squeeze(v.yr_av(m,:,:,:)./z.v0.hwday2.yr_av(m,:,:,:))+hw_ctlc_th; a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.hwtmx2; a=squeeze(v.yr_av(m,:,:,:)./z.w1.hwday2.yr_av(m,:,:,:))+hw_ctlc_th; a1=a; s1=squeeze(std(a,1,1));
v=z.w2.hwtmx2; a=squeeze(v.yr_av(m,:,:,:)./z.w2.hwday2.yr_av(m,:,:,:))+hw_ctlc_th; a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V9=d.a1_avg; p.dV9=d.avg.a1_avg;
p.v9=d.a2_avg; p.dv9=d.avg.a2_avg; p.isig9=d.idx; p.isig9_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v10=d.diff/dT; p.dv10=d.avg.diff/dT; p.isig10=d.idx; p.isig10_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v11=d.diff/dT; p.dv11=d.avg.diff/dT; p.isig11=d.idx; p.isig11_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig11m10=d.idx; p.isig11m10_av=d.avg.idx;pp=p;

%% v=z.vo.hwtmx2; A0=squeeze(v.av(m,:,:)./z.vo.hwday2.av(m,:,:))+squeeze(hw.era5.th(m,:,:));
%% v=z.v0.hwtmx2; a0=squeeze(v.av(m,:,:)./z.v0.hwday2.av(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
%% v=z.w1.hwtmx2; a1=squeeze(v.av(m,:,:)./z.w1.hwday2.av(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
%% v=z.w2.hwtmx2; a2=squeeze(v.av(m,:,:)./z.w2.hwday2.av(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
%% a=A0; p.V9=a; p.dV9=mean(a(id).*aa);
%% a=a0; p.v9=a; p.dv9=mean(a(id).*aa);
%% if (p.do_bias); a=a0-A0; p.v9=a; p.dv9=mean(a(id).*aa); p.cmin9= p.cmin10; p.cmax9=p.cmax10; end;
%% a=(a1-a0)/p.dT1; p.v10=a; p.dv10=mean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v11=a; p.dv11=mean(a(id).*aa);

p.fmt='eps'; plot_pattern_effect_Fig_extremes_20panel_Transposed(p)
%plot_pattern_effect_Fig_extremes(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigR3: changes in percentiles for bias-corrected FWI, BUI, ISI, and DSR%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea; ipct=9; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9];
A0='ERA5'; a0='Control'; a1='SPEAR-pattern M;~'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
%a0='Present-day'; a1='SPEAR-pattern M'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='fwi_bui_isi_dsr_corrected'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
p.vname='FigR3'; sopt=1; slev=90; sopt=2; slev=95; %sopt=1:z-test; 2:Welch's two-sample t-test; slev=95; 95% confidence
del=' $\Delta$'; s0='FWIc;'; s1='BUIc; '; s2='ISIc; '; s3='DSRc; '; s0e='FWI;'; s1e='BUI; '; s2e='ISI; '; s3e='DSR; ';
A0=strcat(A0,'~(',p.sea,');~'); a0=strcat(a0,'~(',p.sea,');~');;
p.S0 =strcat(A0,s0e); p.s0 =strcat(a0,s0); p.s1 =strcat(a1,del,s0); p.s2 =strcat(a2,del,s0); 
p.S3 =strcat(A0,s1e); p.s3 =strcat(a0,s1); p.s4 =strcat(a1,del,s1); p.s5 =strcat(a2,del,s1); 
p.S6 =strcat(A0,s2e); p.s6 =strcat(a0,s2); p.s7 =strcat(a1,del,s2); p.s8 =strcat(a2,del,s2); 
p.S9 =strcat(A0,s3e); p.s9 =strcat(a0,s3); p.s10=strcat(a1,del,s3); p.s11=strcat(a2,del,s3);
%p.s0 =strcat(a0,'~(',p.sea,');~',s0); p.s1 =strcat(a1,';~',del,s0); p.s2 =strcat(a2,';~',del,s0); 
%p.s3 =strcat(s1); p.s4 =strcat(del,s1); p.s5 =strcat(del,s1); 
%p.s6 =strcat(s2); p.s7 =strcat(del,s2); p.s8 =strcat(del,s2); 
%p.s9 =strcat(s3); p.s10=strcat(del,s3); p.s11=strcat(del,s3);
p.unit0 ='$\rm{}$';          p.unit0_bar ='\rm{}';
p.unit1 ='$\rm{K^{-1}}$';    p.unit1_bar ='\rm{K^{-1}}';
p.unit3 ='$\rm{}$';          p.unit3_bar ='\rm{}'; 
p.unit4 ='$\rm{K^{-1}}$';    p.unit4_bar ='\rm{K^{-1}}'; 
p.unit6 ='$\rm{}$';          p.unit6_bar ='\rm{}';
p.unit7 ='$\rm{K^{-1}}$';    p.unit7_bar ='\rm{K^{-1}}';
p.unit9 ='$\rm{}$';          p.unit9_bar ='\rm{}'; 
p.unit10='$\rm{K^{-1}}$';    p.unit10_bar='\rm{K^{-1}}';

p.cmin0= 0.0; p.cmax0=80;    p.cmin1 =-16;   p.cmax1 =16;
p.cmin3= 0.0; p.cmax3=500;   p.cmin4 =-100;  p.cmax4 =100;
p.cmin6= 0.0; p.cmax6=40;    p.cmin7 =-8;    p.cmax7 =8;
p.cmin9= 0.0; p.cmax9=50;    p.cmin10=-10;   p.cmax10=10;

p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;
p.dT1=1.22; p.dT2=1.24; 

v=z.v0; nb=20; no=14; num=1; mskopt=0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

v=z.v0; 
pct_th=v.prday.pct_th; spct=sprintf( '%4.2fth',pct_th(ipct));
pct_th=v.pct; spct=sprintf( '%4.2fth',pct_th(ipct));
p.S0=strcat(p.S0,'~',spct);p.S3=strcat(p.S3,'~',spct);p.S6=strcat(p.S6,'~',spct);p.S9=strcat(p.S9,'~',spct);
p.s0=strcat(p.s0,'~',spct);p.s3=strcat(p.s3,'~',spct);p.s6=strcat(p.s6,'~',spct);p.s9=strcat(p.s9,'~',spct);
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))
%p.s0=strcat(p.s0,'~',spct); p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%FWI
v=z.vo.fwiday.fwi;   a=squeeze(v.yr_pct(m,:,ipct,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.fwiday_c.fwi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.fwiday_c.fwi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.fwiday_c.fwi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V0=d.a1_avg; p.dV0=d.avg.a1_avg;
p.v0=d.a2_avg; p.dv0=d.avg.a2_avg; p.isig0=d.idx; p.isig0_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v1=d.diff/dT; p.dv1=d.avg.diff/dT; p.isig1=d.idx; p.isig1_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v2=d.diff/dT; p.dv2=d.avg.diff/dT; p.isig2=d.idx; p.isig2_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig2m1=d.idx; p.isig2m1_av=d.avg.idx;pp=p;

%% v=z.vo.fwiday.fwi;   A0=squeeze(v.pct(m,ipct,:,:));
%% v=z.v0.fwiday_c.fwi; a0=squeeze(v.pct(m,ipct,:,:));
%% v=z.w1.fwiday_c.fwi; a1=squeeze(v.pct(m,ipct,:,:));
%% v=z.w2.fwiday_c.fwi; a2=squeeze(v.pct(m,ipct,:,:));
%% a=A0; p.V0=a; p.dV0=mean(a(id).*aa);
%% a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
%% if (p.do_bias); a=a0-A0; p.v0=a; p.dv0=mean(a(id).*aa); p.cmin0= p.cmin1; p.cmax0=p.cmax1; end;
%% a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);

%BUI
v=z.vo.fwiday.bui;   a=squeeze(v.yr_pct(m,:,ipct,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.fwiday_c.bui; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.fwiday_c.bui; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.fwiday_c.bui; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V3=d.a1_avg; p.dV3=d.avg.a1_avg;
p.v3=d.a2_avg; p.dv3=d.avg.a2_avg; p.isig3=d.idx; p.isig3_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v4=d.diff/dT; p.dv4=d.avg.diff/dT; p.isig4=d.idx; p.isig4_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v5=d.diff/dT; p.dv5=d.avg.diff/dT; p.isig5=d.idx; p.isig5_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig5m4=d.idx; p.isig5m4_av=d.avg.idx;pp=p;

%% v=z.vo.fwiday.bui;   A0=squeeze(v.pct(m,ipct,:,:));
%% v=z.v0.fwiday_c.bui; a0=squeeze(v.pct(m,ipct,:,:));
%% v=z.w1.fwiday_c.bui; a1=squeeze(v.pct(m,ipct,:,:));
%% v=z.w2.fwiday_c.bui; a2=squeeze(v.pct(m,ipct,:,:));
%% a=A0; p.V3=a; p.dV3=mean(a(id).*aa);
%% a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
%% if (p.do_bias);  a=a0-A0; p.v3=a; p.dv3=mean(a(id).*aa); p.cmin3= p.cmin4; p.cmax3=p.cmax4; end;
%% a=(a1-a0)/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa);

%ISI
v=z.vo.fwiday.isi;   a=squeeze(v.yr_pct(m,:,ipct,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.fwiday_c.isi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.fwiday_c.isi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.fwiday_c.isi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V6=d.a1_avg; p.dV6=d.avg.a1_avg;
p.v6=d.a2_avg; p.dv6=d.avg.a2_avg; p.isig6=d.idx; p.isig6_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v7=d.diff/dT; p.dv7=d.avg.diff/dT; p.isig7=d.idx; p.isig7_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v8=d.diff/dT; p.dv8=d.avg.diff/dT; p.isig8=d.idx; p.isig8_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig8m7=d.idx; p.isig8m7_av=d.avg.idx;pp=p;

%% v=z.vo.fwiday.isi;   A0=squeeze(v.pct(m,ipct,:,:));
%% v=z.v0.fwiday_c.isi; a0=squeeze(v.pct(m,ipct,:,:));
%% v=z.w1.fwiday_c.isi; a1=squeeze(v.pct(m,ipct,:,:));
%% v=z.w2.fwiday_c.isi; a2=squeeze(v.pct(m,ipct,:,:));
%% a=A0; p.V6=a; p.dV6=mean(a(id).*aa);
%% a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
%% if (p.do_bias); a=a0-A0; p.v6=a; p.dv6=mean(a(id).*aa); p.cmin6= p.cmin7; p.cmax6=p.cmax7; end;
%% a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);

%DSR
v=z.vo.fwiday.dsr;   a=squeeze(v.yr_pct(m,:,ipct,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.fwiday_c.dsr; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.fwiday_c.dsr; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.fwiday_c.dsr; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V9=d.a1_avg; p.dV9=d.avg.a1_avg;
p.v9=d.a2_avg; p.dv9=d.avg.a2_avg; p.isig9=d.idx; p.isig9_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v10=d.diff/dT; p.dv10=d.avg.diff/dT; p.isig10=d.idx; p.isig10_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v11=d.diff/dT; p.dv11=d.avg.diff/dT; p.isig11=d.idx; p.isig11_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig11m10=d.idx; p.isig11m10_av=d.avg.idx;pp=p;

%% v=z.vo.fwiday.dsr;   A0=squeeze(v.pct(m,ipct,:,:));
%% v=z.v0.fwiday_c.dsr; a0=squeeze(v.pct(m,ipct,:,:));
%% v=z.w1.fwiday_c.dsr; a1=squeeze(v.pct(m,ipct,:,:));
%% v=z.w2.fwiday_c.dsr; a2=squeeze(v.pct(m,ipct,:,:));
%% a=A0; p.V9=a; p.dV9=nanmean(a(id).*aa);
%% a=a0; p.v9=a; p.dv9=nanmean(a(id).*aa);
%% if (p.do_bias); a=a0-A0; p.v9=a; p.dv9=mean(a(id).*aa); p.cmin9= p.cmin10; p.cmax9=p.cmax10; end;
%% a=(a1-a0)/p.dT1; p.v10=a; p.dv10=nanmean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v11=a; p.dv11=nanmean(a(id).*aa);

p.fmt='eps'; plot_pattern_effect_Fig_extremes_20panel_Transposed(p); %plot_pattern_effect_Fig_extremes_16panel_Transposed(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigRS02: percentile changes in TAS, VPD, TWB, and RH at 2m%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea;
ipct=10;  iipct=2; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %95th 5th
%ipct=10; iipct=2; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %99th 1th
A0='ERA5'; a0='Control'; a1='SPEAR-pattern M;~'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='tas_vpd_twb_rh'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
p.vname='FigRS02'; sopt=1; slev=90; sopt=2; slev=95; %sopt=1:z-test; 2 Welch's two-sample t-test; slev=95; 95% confidence
del=' $\Delta$'; s0='TAS;'; s1='VPD; '; s2='TWB; '; s3='RH; ';
A0=strcat(A0,'~(',p.sea,');~'); a0=strcat(a0,'~(',p.sea,');~');;
p.S0 =strcat(A0,s0); p.s0 =strcat(a0,s0); p.s1 =strcat(a1,del,s0); p.s2 =strcat(a2,del,s0); 
p.S3 =strcat(A0,s1); p.s3 =strcat(a0,s1); p.s4 =strcat(a1,del,s1); p.s5 =strcat(a2,del,s1); 
p.S6 =strcat(A0,s2); p.s6 =strcat(a0,s2); p.s7 =strcat(a1,del,s2); p.s8 =strcat(a2,del,s2); 
p.S9 =strcat(A0,s3); p.s9 =strcat(a0,s3); p.s10=strcat(a1,del,s3); p.s11=strcat(a2,del,s3);
p.unit0 ='$\rm{^{\circ}C}$';    p.unit0_bar ='\rm{^{\circ}C}';
p.unit1 ='$\rm{KK^{-1}}$';      p.unit1_bar ='\rm{KK^{-1}}';
p.unit3 ='$\rm{hPa}$';          p.unit3_bar ='\rm{hPa}'; 
p.unit4 ='$\rm{hPaK^{-1}}$';    p.unit4_bar ='\rm{hPaK^{-1}}'; 
p.unit6 ='$\rm{^{\circ}C}$';    p.unit6_bar ='\rm{^{\circ}C}';
p.unit7 ='$\rm{KK^{-1}}$';      p.unit7_bar ='\rm{KK^{-1}}';
p.unit9 ='$\rm{\%}$';           p.unit9_bar ='\rm{%}'; 
p.unit10='$\rm{\%K^{-1}}$';     p.unit10_bar='\rm{%K^{-1}}';

p.cmin0= 0.0; p.cmax0=40;  p.cmin1 =-5.0;  p.cmax1 =5.0;
p.cmin3= 0.0; p.cmax3=50;  p.cmin4 =-10.;  p.cmax4 =10.;
p.cmin6= 0.0; p.cmax6=35;  p.cmin7 =-3.0;  p.cmax7 =3.0;
p.cmin9= 0.0; p.cmax9=100; p.cmin10=-10.;  p.cmax10=10.;
p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;
p.dT1=1.22; p.dT2=1.24;

v=z.v0; nb=20; no=14; num=1; mskopt=0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

pct_th=v.pct; spct=sprintf( '%4.2fth',pct_th(ipct));  ispct=sprintf( '%4.2fth',pct_th(iipct));
p.S0=strcat(p.S0,'~',spct);p.S3=strcat(p.S3,'~',spct);p.S6=strcat(p.S6,'~',spct);p.S9=strcat(p.S9,'~',ispct);
p.s0=strcat(p.s0,'~',spct);p.s3=strcat(p.s3,'~',spct);p.s6=strcat(p.s6,'~',spct);p.s9=strcat(p.s9,'~',ispct);
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%tasday
v=z.vo.tasday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.tasday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.tasday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.tasday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V0=d.a1_avg; p.dV0=d.avg.a1_avg;
p.v0=d.a2_avg; p.dv0=d.avg.a2_avg; p.isig0=d.idx; p.isig0_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v1=d.diff/dT; p.dv1=d.avg.diff/dT; p.isig1=d.idx; p.isig1_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v2=d.diff/dT; p.dv2=d.avg.diff/dT; p.isig2=d.idx; p.isig2_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig2m1=d.idx; p.isig2m1_av=d.avg.idx;pp=p;
%% v=z.vo.tasday; A0=squeeze(v.pct(m,ipct,:,:));
%% v=z.v0.tasday; a0=squeeze(v.pct(m,ipct,:,:));
%% v=z.w1.tasday; a1=squeeze(v.pct(m,ipct,:,:));
%% v=z.w2.tasday; a2=squeeze(v.pct(m,ipct,:,:));
%% a=A0; p.V0=a; p.dV0=mean(a(id).*aa);
%% a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
%% if (p.do_bias); a=a0-A0; p.v0=a; p.dv0=mean(a(id).*aa); p.cmin0= p.cmin1; p.cmax0=p.cmax1; end;
%% a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);

%vpdday
v=z.vo.vpdday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.vpdday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.vpdday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.vpdday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V3=d.a1_avg; p.dV3=d.avg.a1_avg;
p.v3=d.a2_avg; p.dv3=d.avg.a2_avg; p.isig3=d.idx;p.isig3_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v4=d.diff/dT; p.dv4=d.avg.diff/dT; p.isig4=d.idx;p.isig4_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v5=d.diff/dT; p.dv5=d.avg.diff/dT; p.isig5=d.idx;p.isig5_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig5m4=d.idx; p.isig5m4_av=d.avg.idx;pp=p;

%% v=z.vo.vpdday; A0=squeeze(v.pct(m,ipct,:,:));
%% v=z.v0.vpdday; a0=squeeze(v.pct(m,ipct,:,:));
%% v=z.w1.vpdday; a1=squeeze(v.pct(m,ipct,:,:));
%% v=z.w2.vpdday; a2=squeeze(v.pct(m,ipct,:,:));
%% a=A0; p.V3=a; p.dV3=mean(a(id).*aa);
%% a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
%% if (p.do_bias);  a=a0-A0; p.v3=a; p.dv3=mean(a(id).*aa); p.cmin3= p.cmin4; p.cmax3=p.cmax4; end;
%% a=(a1-a0)/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa);

%twbday
v=z.vo.twbday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.twbday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.twbday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.twbday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V6=d.a1_avg; p.dV6=d.avg.a1_avg;
p.v6=d.a2_avg; p.dv6=d.avg.a2_avg; p.isig6=d.idx; p.isig6_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v7=d.diff/dT; p.dv7=d.avg.diff/dT; p.isig7=d.idx; p.isig7_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v8=d.diff/dT; p.dv8=d.avg.diff/dT; p.isig8=d.idx; p.isig8_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig8m7=d.idx; p.isig8m7_av=d.avg.idx; pp=p;

%% v=z.vo.twbday; A0=squeeze(v.pct(m,ipct,:,:));
%% v=z.v0.twbday; a0=squeeze(v.pct(m,ipct,:,:));
%% v=z.w1.twbday; a1=squeeze(v.pct(m,ipct,:,:));
%% v=z.w2.twbday; a2=squeeze(v.pct(m,ipct,:,:));
%% a=A0; p.V6=a; p.dV6=mean(a(id).*aa);
%% a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
%% if (p.do_bias); a=a0-A0; p.v6=a; p.dv6=mean(a(id).*aa); p.cmin6= p.cmin7; p.cmax6=p.cmax7; end;
%% a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);

%RHday
v=z.vo.rhday; a=squeeze(v.yr_pct(m,:,iipct,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.rhday; a=squeeze(v.yr_pct(m,:,iipct,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.rhday; a=squeeze(v.yr_pct(m,:,iipct,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.rhday; a=squeeze(v.yr_pct(m,:,iipct,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V9=d.a1_avg; p.dV9=d.avg.a1_avg;
p.v9=d.a2_avg; p.dv9=d.avg.a2_avg; p.isig9=d.idx; p.isig9_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v10=d.diff/dT; p.dv10=d.avg.diff/dT; p.isig10=d.idx; p.isig10_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v11=d.diff/dT; p.dv11=d.avg.diff/dT; p.isig11=d.idx; p.isig11_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig11m10=d.idx; p.isig11m10_av=d.avg.idx;pp=p;

%% v=z.vo.rhday; A0=squeeze(v.pct(m,iipct,:,:));
%% v=z.v0.rhday; a0=squeeze(v.pct(m,iipct,:,:));
%% v=z.w1.rhday; a1=squeeze(v.pct(m,iipct,:,:));
%% v=z.w2.rhday; a2=squeeze(v.pct(m,iipct,:,:));
%% a=A0; p.V9=a; p.dV9=nanmean(a(id).*aa);
%% a=a0; p.v9=a; p.dv9=nanmean(a(id).*aa);
%% if (p.do_bias); a=a0-A0; p.v9=a; p.dv9=mean(a(id).*aa); p.cmin9= p.cmin10; p.cmax9=p.cmax10; end;
%% a=(a1-a0)/p.dT1; p.v10=a; p.dv10=nanmean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v11=a; p.dv11=nanmean(a(id).*aa);

p.fmt='eps'; plot_pattern_effect_Fig_extremes_20panel_Transposed(p); %plot_pattern_effect_Fig_extremes(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigRS03: Alternative HeatWave Intensity metrics using TASMAX percentiles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea;
ipct8=8; ipct9=9; ipct10=10; ipct11=11; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %95th 5th
A0='ERA5'; a0='Control'; a1='SPEAR-pattern M;~'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='tasmax_hwintensity'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
p.vname='FigRS03'; sopt=1; slev=90; sopt=2; slev=95; %sopt=1:z-test; 2 Welch's two-sample t-test; slev=95; 95% confidence
del=' $\Delta$'; s0='TASMAX;'; s1='TASMAX; '; s2='TASMAX; '; s3='TASMAX; ';
A0=strcat(A0,'~(',p.sea,');~'); a0=strcat(a0,'~(',p.sea,');~');;
p.S0 =strcat(A0,s0); p.s0 =strcat(a0,s0); p.s1 =strcat(a1,del,s0); p.s2 =strcat(a2,del,s0); 
p.S3 =strcat(A0,s1); p.s3 =strcat(a0,s1); p.s4 =strcat(a1,del,s1); p.s5 =strcat(a2,del,s1); 
p.S6 =strcat(A0,s2); p.s6 =strcat(a0,s2); p.s7 =strcat(a1,del,s2); p.s8 =strcat(a2,del,s2); 
p.S9 =strcat(A0,s3); p.s9 =strcat(a0,s3); p.s10=strcat(a1,del,s3); p.s11=strcat(a2,del,s3);
p.unit0 ='$\rm{^{\circ}C}$';   p.unit0_bar ='\rm{^{\circ}C}';
p.unit1 ='$\rm{KK^{-1}}$';     p.unit1_bar ='\rm{KK^{-1}}';
p.unit3 ='$\rm{^{\circ}C}$';   p.unit3_bar ='\rm{^{\circ}C}'; 
p.unit4 ='$\rm{KK^{-1}}$';     p.unit4_bar ='\rm{KK^{-1}}'; 
p.unit6 ='$\rm{^{\circ}C}$';   p.unit6_bar ='\rm{^{\circ}C}';
p.unit7 ='$\rm{KK^{-1}}$';     p.unit7_bar ='\rm{KK^{-1}}';
p.unit9 ='$\rm{^{\circ}C}$';   p.unit9_bar ='\rm{^{\circ}C}'; 
p.unit10='$\rm{KK^{-1}}$';     p.unit10_bar='\rm{KK^{-1}}';

p.cmin0= 0.0; p.cmax0=40;  p.cmin1 =-5.0;  p.cmax1 =5.0;
p.cmin3= 0.0; p.cmax3=40;  p.cmin4 =-5.0;  p.cmax4 =5.0;
p.cmin6= 0.0; p.cmax6=40;  p.cmin7 =-5.0;  p.cmax7 =5.0;
p.cmin9= 0.0; p.cmax9=40;  p.cmin10=-5.0;  p.cmax10=5.0;
p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;
p.dT1=1.22; p.dT2=1.24;

v=z.v0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

v=z.v0; nb=20; no=14; num=1; mskopt=0;
pct_th=v.pct;
spct8 =sprintf( '%4.2fth',pct_th(ipct8));   spct9 =sprintf( '%4.2fth',pct_th(ipct9));
spct10=sprintf( '%4.2fth',pct_th(ipct10));  spct11=sprintf( '%4.2fth',pct_th(ipct11));
p.S0=strcat(p.S0,'~',spct8);p.S3=strcat(p.S3,'~',spct9);p.S6=strcat(p.S6,'~',spct10);p.S9=strcat(p.S9,'~',spct11);
p.s0=strcat(p.s0,'~',spct8);p.s3=strcat(p.s3,'~',spct9);p.s6=strcat(p.s6,'~',spct10);p.s9=strcat(p.s9,'~',spct11);

%tasday 90th percentile ipct=8;
v=z.vo.tasmaxday; a=squeeze(v.yr_pct(m,:,ipct8,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.tasmaxday; a=squeeze(v.yr_pct(m,:,ipct8,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.tasmaxday; a=squeeze(v.yr_pct(m,:,ipct8,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.tasmaxday; a=squeeze(v.yr_pct(m,:,ipct8,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V0=d.a1_avg; p.dV0=d.avg.a1_avg;
p.v0=d.a2_avg; p.dv0=d.avg.a2_avg; p.isig0=d.idx; p.isig0_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v1=d.diff/dT; p.dv1=d.avg.diff/dT; p.isig1=d.idx; p.isig1_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v2=d.diff/dT; p.dv2=d.avg.diff/dT; p.isig2=d.idx; p.isig2_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig2m1=d.idx; p.isig2m1_av=d.avg.idx; pp=p;

%tasday 95th percentile ipct9=9;
v=z.vo.tasmaxday; a=squeeze(v.yr_pct(m,:,ipct9,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.tasmaxday; a=squeeze(v.yr_pct(m,:,ipct9,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.tasmaxday; a=squeeze(v.yr_pct(m,:,ipct9,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.tasmaxday; a=squeeze(v.yr_pct(m,:,ipct9,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V3=d.a1_avg; p.dV3=d.avg.a1_avg;
p.v3=d.a2_avg; p.dv3=d.avg.a2_avg; p.isig3=d.idx; p.isig3_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v4=d.diff/dT; p.dv4=d.avg.diff/dT; p.isig4=d.idx; p.isig4_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v5=d.diff/dT; p.dv5=d.avg.diff/dT; p.isig5=d.idx; p.isig5_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig5m4=d.idx; p.isig5m4_av=d.avg.idx; pp=p;

%tasday 99th percentile ipct10=10;
v=z.vo.tasmaxday; a=squeeze(v.yr_pct(m,:,ipct10,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.tasmaxday; a=squeeze(v.yr_pct(m,:,ipct10,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.tasmaxday; a=squeeze(v.yr_pct(m,:,ipct10,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.tasmaxday; a=squeeze(v.yr_pct(m,:,ipct10,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V6=d.a1_avg; p.dV6=d.avg.a1_avg;
p.v6=d.a2_avg; p.dv6=d.avg.a2_avg; p.isig6=d.idx; p.isig6_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v7=d.diff/dT; p.dv7=d.avg.diff/dT; p.isig7=d.idx; p.isig7_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v8=d.diff/dT; p.dv8=d.avg.diff/dT; p.isig8=d.idx; p.isig8_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig8m7=d.idx; p.isig8m7_av=d.avg.idx; pp=p;

%tasday 99.9th percentile ipct11=11;
v=z.vo.tasmaxday; a=squeeze(v.yr_pct(m,:,ipct11,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.tasmaxday; a=squeeze(v.yr_pct(m,:,ipct11,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.tasmaxday; a=squeeze(v.yr_pct(m,:,ipct11,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.tasmaxday; a=squeeze(v.yr_pct(m,:,ipct11,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V9=d.a1_avg; p.dV9=d.avg.a1_avg;
p.v9=d.a2_avg; p.dv9=d.avg.a2_avg; p.isig9=d.idx; p.isig9_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v10=d.diff/dT; p.dv10=d.avg.diff/dT; p.isig10=d.idx; p.isig10_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v11=d.diff/dT; p.dv11=d.avg.diff/dT; p.isig11=d.idx; p.isig11_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig11m10=d.idx; p.isig11m10_av=d.avg.idx;pp=p;

p.fmt='eps'; plot_pattern_effect_Fig_extremes_20panel_Transposed(p); %plot_pattern_effect_Fig_extremes(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigRS04: changes in percentiles for original FWI, BUI, ISI, and DSR%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea; ipct=9; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9];
A0='ERA5'; a0='Control'; a1='SPEAR-pattern M;~'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
%a0='Present-day'; a1='SPEAR-pattern M'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='fwi_bui_isi_dsr_corrected'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
p.vname='FigRS04'; sopt=1; slev=90; sopt=2; slev=95; %sopt=1:z-test; 2:Welch's two-sample t-test; slev=95; 95% confidence
del=' $\Delta$'; s0='FWI;'; s1='BUI; '; s2='ISI; '; s3='DSR; ';
A0=strcat(A0,'~(',p.sea,');~'); a0=strcat(a0,'~(',p.sea,');~');;
p.S0 =strcat(A0,s0); p.s0 =strcat(a0,s0); p.s1 =strcat(a1,del,s0); p.s2 =strcat(a2,del,s0); 
p.S3 =strcat(A0,s1); p.s3 =strcat(a0,s1); p.s4 =strcat(a1,del,s1); p.s5 =strcat(a2,del,s1); 
p.S6 =strcat(A0,s2); p.s6 =strcat(a0,s2); p.s7 =strcat(a1,del,s2); p.s8 =strcat(a2,del,s2); 
p.S9 =strcat(A0,s3); p.s9 =strcat(a0,s3); p.s10=strcat(a1,del,s3); p.s11=strcat(a2,del,s3);
%p.s0 =strcat(a0,'~(',p.sea,');~',s0); p.s1 =strcat(a1,';~',del,s0); p.s2 =strcat(a2,';~',del,s0); 
%p.s3 =strcat(s1); p.s4 =strcat(del,s1); p.s5 =strcat(del,s1); 
%p.s6 =strcat(s2); p.s7 =strcat(del,s2); p.s8 =strcat(del,s2); 
%p.s9 =strcat(s3); p.s10=strcat(del,s3); p.s11=strcat(del,s3);
p.unit0 ='$\rm{}$';          p.unit0_bar ='\rm{}';
p.unit1 ='$\rm{K^{-1}}$';    p.unit1_bar ='\rm{K^{-1}}';
p.unit3 ='$\rm{}$';          p.unit3_bar ='\rm{}'; 
p.unit4 ='$\rm{K^{-1}}$';    p.unit4_bar ='\rm{K^{-1}}'; 
p.unit6 ='$\rm{}$';          p.unit6_bar ='\rm{}';
p.unit7 ='$\rm{K^{-1}}$';    p.unit7_bar ='\rm{K^{-1}}';
p.unit9 ='$\rm{}$';          p.unit9_bar ='\rm{}'; 
p.unit10='$\rm{K^{-1}}$';    p.unit10_bar='\rm{K^{-1}}';

p.cmin0= 0.0; p.cmax0=80;    p.cmin1 =-16;   p.cmax1 =16;
p.cmin3= 0.0; p.cmax3=500;   p.cmin4 =-100;  p.cmax4 =100;
p.cmin6= 0.0; p.cmax6=40;    p.cmin7 =-8;    p.cmax7 =8;
p.cmin9= 0.0; p.cmax9=50;    p.cmin10=-10;   p.cmax10=10;

p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;
p.dT1=1.22; p.dT2=1.24; 

v=z.v0; nb=20; no=14; num=1; mskopt=0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

pct_th=v.prday.pct_th; spct=sprintf( '%4.2fth',pct_th(ipct));
pct_th=v.pct; spct=sprintf( '%4.2fth',pct_th(ipct));
p.S0=strcat(p.S0,'~',spct);p.S3=strcat(p.S3,'~',spct);p.S6=strcat(p.S6,'~',spct);p.S9=strcat(p.S9,'~',spct);
p.s0=strcat(p.s0,'~',spct);p.s3=strcat(p.s3,'~',spct);p.s6=strcat(p.s6,'~',spct);p.s9=strcat(p.s9,'~',spct);
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))
%p.s0=strcat(p.s0,'~',spct); p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%FWI
v=z.vo.fwiday.fwi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.fwiday.fwi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.fwiday.fwi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.fwiday.fwi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V0=d.a1_avg; p.dV0=d.avg.a1_avg;
p.v0=d.a2_avg; p.dv0=d.avg.a2_avg; p.isig0=d.idx; p.isig0_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v1=d.diff/dT; p.dv1=d.avg.diff/dT; p.isig1=d.idx; p.isig1_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v2=d.diff/dT; p.dv2=d.avg.diff/dT; p.isig2=d.idx; p.isig2_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig2m1=d.idx; p.isig2m1_av=d.avg.idx;pp=p;

%% v=z.vo.fwiday.fwi; A0=squeeze(v.pct(m,ipct,:,:));
%% v=z.v0.fwiday.fwi; a0=squeeze(v.pct(m,ipct,:,:));
%% v=z.w1.fwiday.fwi; a1=squeeze(v.pct(m,ipct,:,:));
%% v=z.w2.fwiday.fwi; a2=squeeze(v.pct(m,ipct,:,:));
%% a=A0; p.V0=a; p.dV0=mean(a(id).*aa);
%% a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
%% if (p.do_bias); a=a0-A0; p.v0=a; p.dv0=mean(a(id).*aa); p.cmin0= p.cmin1; p.cmax0=p.cmax1; end;
%% a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);

%BUI
v=z.vo.fwiday.bui; a=squeeze(v.yr_pct(m,:,ipct,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.fwiday.bui; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.fwiday.bui; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.fwiday.bui; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V3=d.a1_avg; p.dV3=d.avg.a1_avg;
p.v3=d.a2_avg; p.dv3=d.avg.a2_avg; p.isig3=d.idx; p.isig3_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v4=d.diff/dT; p.dv4=d.avg.diff/dT; p.isig4=d.idx; p.isig4_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v5=d.diff/dT; p.dv5=d.avg.diff/dT; p.isig5=d.idx; p.isig5_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig5m4=d.idx; p.isig5m4_av=d.avg.idx;pp=p;

%% v=z.vo.fwiday.bui;   A0=squeeze(v.pct(m,ipct,:,:));
%% v=z.v0.fwiday.bui; a0=squeeze(v.pct(m,ipct,:,:));
%% v=z.w1.fwiday.bui; a1=squeeze(v.pct(m,ipct,:,:));
%% v=z.w2.fwiday.bui; a2=squeeze(v.pct(m,ipct,:,:));
%% a=A0; p.V3=a; p.dV3=mean(a(id).*aa);
%% a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
%% if (p.do_bias);  a=a0-A0; p.v3=a; p.dv3=mean(a(id).*aa); p.cmin3= p.cmin4; p.cmax3=p.cmax4; end;
%% a=(a1-a0)/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa);

%ISI
v=z.vo.fwiday.isi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.fwiday.isi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.fwiday.isi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.fwiday.isi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V6=d.a1_avg; p.dV6=d.avg.a1_avg;
p.v6=d.a2_avg; p.dv6=d.avg.a2_avg; p.isig6=d.idx; p.isig6_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v7=d.diff/dT; p.dv7=d.avg.diff/dT; p.isig7=d.idx; p.isig7_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v8=d.diff/dT; p.dv8=d.avg.diff/dT; p.isig8=d.idx; p.isig8_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig8m7=d.idx; p.isig8m7_av=d.avg.idx;pp=p;

%% v=z.vo.fwiday.isi;   A0=squeeze(v.pct(m,ipct,:,:));
%% v=z.v0.fwiday.isi; a0=squeeze(v.pct(m,ipct,:,:));
%% v=z.w1.fwiday.isi; a1=squeeze(v.pct(m,ipct,:,:));
%% v=z.w2.fwiday.isi; a2=squeeze(v.pct(m,ipct,:,:));
%% a=A0; p.V6=a; p.dV6=mean(a(id).*aa);
%% a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
%% if (p.do_bias); a=a0-A0; p.v6=a; p.dv6=mean(a(id).*aa); p.cmin6= p.cmin7; p.cmax6=p.cmax7; end;
%% a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);

%DSR
v=z.vo.fwiday.dsr; a=squeeze(v.yr_pct(m,:,ipct,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.fwiday.dsr; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a; s0=squeeze(std(a,1,1)); 
v=z.w1.fwiday.dsr; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.fwiday.dsr; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.V9=d.a1_avg; p.dV9=d.avg.a1_avg;
p.v9=d.a2_avg; p.dv9=d.avg.a2_avg; p.isig9=d.idx; p.isig9_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.v10=d.diff/dT; p.dv10=d.avg.diff/dT; p.isig10=d.idx; p.isig10_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.v11=d.diff/dT; p.dv11=d.avg.diff/dT; p.isig11=d.idx; p.isig11_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig11m10=d.idx; p.isig11m10_av=d.avg.idx;pp=p;

%% v=z.vo.fwiday.dsr;   A0=squeeze(v.pct(m,ipct,:,:));
%% v=z.v0.fwiday.dsr; a0=squeeze(v.pct(m,ipct,:,:));
%% v=z.w1.fwiday.dsr; a1=squeeze(v.pct(m,ipct,:,:));
%% v=z.w2.fwiday.dsr; a2=squeeze(v.pct(m,ipct,:,:));
%% a=A0; p.V9=a; p.dV9=nanmean(a(id).*aa);
%% a=a0; p.v9=a; p.dv9=nanmean(a(id).*aa);
%% if (p.do_bias); a=a0-A0; p.v9=a; p.dv9=mean(a(id).*aa); p.cmin9= p.cmin10; p.cmax9=p.cmax10; end;
%% a=(a1-a0)/p.dT1; p.v10=a; p.dv10=nanmean(a(id).*aa);
%% a=(a2-a0)/p.dT2; p.v11=a; p.dv11=nanmean(a(id).*aa);

p.fmt='eps'; plot_pattern_effect_Fig_extremes_20panel_Transposed(p); %plot_pattern_effect_Fig_extremes_16panel_Transposed(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigRS07: HWFc, HWIc, FWIc, DSRc from SPM-Pxxobs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea;
ipct=9;  iipct=3; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %95th 5th
%ipct=10; iipct=2; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %99th 1th
a1='Observed-pattern minus SPM'; a2='SPM-P10obs minus SPM'; a3='SPM-P20obs minus SPM '; a4='SPM-P30obs minus SPM'; a5='SPM-T30obs minus SPM'; p.flipcmap=0;
p.sea=nsea{isea};
p.vname='FigRS07'; sopt=1; slev=90; sopt=2; slev=95; %sopt=1:z-test; 2 Welch's two-sample t-test; slev=95; 95% confidence
del=' $\Delta$'; s1='HWFc;'; s2='HWIc; '; s3='FWIc; '; s4='DSRc; ';
p.s1 =strcat(a1,del,s1); p.s2 =strcat(a2,del,s1); p.s3 =strcat(a3,del,s1); p.s4 =strcat(a4,del,s1); p.s5 =strcat(a5,del,s1);
p.s6 =strcat(a1,del,s2); p.s7 =strcat(a2,del,s2); p.s8 =strcat(a3,del,s2); p.s9 =strcat(a4,del,s2); p.s10=strcat(a5,del,s2);
p.s11=strcat(a1,del,s3); p.s12=strcat(a2,del,s3); p.s13=strcat(a3,del,s3); p.s14=strcat(a4,del,s3); p.s15=strcat(a5,del,s3);
p.s16=strcat(a1,del,s4); p.s17=strcat(a2,del,s4); p.s18=strcat(a3,del,s4); p.s19=strcat(a4,del,s4); p.s20=strcat(a5,del,s4);

p.unit0 ='$\rm{\%}$';           p.unit0_bar ='\rm{%}';
p.unit1 ='$\rm{\%K^{-1}}$';     p.unit1_bar ='\rm{%K^{-1}}';
p.unit3 ='$\rm{\%}$';           p.unit3_bar ='\rm{%}'; 
p.unit4 ='$\rm{KK^{-1}}$';      p.unit4_bar ='\rm{KK^{-1}}'; 
p.unit6 ='$\rm{KK^{-1}}$';      p.unit6_bar ='\rm{KK^{-1}}';
p.unit7 ='$\rm{K^{-1}}$';       p.unit7_bar ='\rm{K^{-1}}';
p.unit9 ='$\rm{K^{-1}}$';       p.unit9_bar ='\rm{K^{-1}}';
p.unit10='$\rm{K^{-1}}$';       p.unit10_bar='\rm{K^{-1}}';

p.cmin1 =-20;  p.cmax1 = 20;
p.cmin2 =-2.;  p.cmax2 = 2.;
p.cmin3 =-15;  p.cmax3 = 15;
p.cmin4 =-10.; p.cmax4 = 10.;
p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;

v=z.v0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

v=z.v0; nb=20; no=14; num=1; mskopt=0;
p.dT=[1.220000000000000   1.240000000000000  ...
      1.228980456119189   1.298864778538075   1.294701559300108   1.255725808265311];

%%hwday2: corrected HWF
v=z.v0.hwday2;  a=squeeze(v.yr_av(m,:,:,:))*100; a0=a;              s0=squeeze(std(a, 1,1));
v=z.w1.hwday2;  a=squeeze(v.yr_av(m,:,:,:))*100; a1=(a-a0)/p.dT(1); s1=squeeze(std(a1,1,1)); %SPM        minus CTL
v=z.w2.hwday2;  a=squeeze(v.yr_av(m,:,:,:))*100; a2=(a-a0)/p.dT(2); s2=squeeze(std(a2,1,1)); %OP         minus CTL
v=z.w1a.hwday2; a=squeeze(v.yr_av(m,:,:,:))*100; a3=(a-a0)/p.dT(3); s3=squeeze(std(a3,1,1)); %SPM-P10obs minus CTL
v=z.w1b.hwday2; a=squeeze(v.yr_av(m,:,:,:))*100; a4=(a-a0)/p.dT(4); s4=squeeze(std(a4,1,1)); %SPM-P20obs minus CTL
v=z.w1c.hwday2; a=squeeze(v.yr_av(m,:,:,:))*100; a5=(a-a0)/p.dT(5); s5=squeeze(std(a5,1,1)); %SPM-P30obs minus CTL
v=z.w1d.hwday2; a=squeeze(v.yr_av(m,:,:,:))*100; a6=(a-a0)/p.dT(6); s6=squeeze(std(a6,1,1)); %SPM-T30obs minus CTL
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); %a2 minus a1
p.v1=d.diff; p.dv1=d.avg.diff; p.isig1=d.idx; p.isig1_av=d.avg.idx; %OP minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a3,s3,nb,num,p.id,p.aa,mskopt,sopt,slev); %a3 minus a1
p.v2=d.diff; p.dv2=d.avg.diff; p.isig2=d.idx; p.isig2_av=d.avg.idx; %SPM-P10obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a4,s4,nb,num,p.id,p.aa,mskopt,sopt,slev); %a4 minus a1
p.v3=d.diff; p.dv3=d.avg.diff; p.isig3=d.idx; p.isig3_av=d.avg.idx; %SPM-P20obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a5,s5,nb,num,p.id,p.aa,mskopt,sopt,slev); %a5 minus a1
p.v4=d.diff; p.dv4=d.avg.diff; p.isig4=d.idx; p.isig4_av=d.avg.idx; %SPM-P30obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a6,s6,nb,num,p.id,p.aa,mskopt,sopt,slev); %a6 minus a1
p.v5=d.diff; p.dv5=d.avg.diff; p.isig5=d.idx; p.isig5_av=d.avg.idx; %SPM-T30obs minus SPM in response

%Hwtmx2: corrected HWI
v=z.v0.hwtmx2;  a=squeeze(v.yr_av(m,:,:,:)./z.v0.hwday2.yr_av (m,:,:,:)); a0=a;              s0=squeeze(std(a, 1,1));
v=z.w1.hwtmx2;  a=squeeze(v.yr_av(m,:,:,:)./z.w1.hwday2.yr_av (m,:,:,:)); a1=(a-a0)/p.dT(1); s1=squeeze(std(a1,1,1)); %SPM        minus CTL
v=z.w2.hwtmx2;  a=squeeze(v.yr_av(m,:,:,:)./z.w2.hwday2.yr_av (m,:,:,:)); a2=(a-a0)/p.dT(2); s2=squeeze(std(a2,1,1)); %OP         minus CTL
v=z.w1a.hwtmx2; a=squeeze(v.yr_av(m,:,:,:)./z.w1a.hwday2.yr_av(m,:,:,:)); a3=(a-a0)/p.dT(3); s3=squeeze(std(a3,1,1)); %SPM-P10obs minus CTL
v=z.w1b.hwtmx2; a=squeeze(v.yr_av(m,:,:,:)./z.w1b.hwday2.yr_av(m,:,:,:)); a4=(a-a0)/p.dT(4); s4=squeeze(std(a4,1,1)); %SPM-P20obs minus CTL
v=z.w1c.hwtmx2; a=squeeze(v.yr_av(m,:,:,:)./z.w1c.hwday2.yr_av(m,:,:,:)); a5=(a-a0)/p.dT(5); s5=squeeze(std(a5,1,1)); %SPM-P30obs minus CTL
v=z.w1d.hwtmx2; a=squeeze(v.yr_av(m,:,:,:)./z.w1d.hwday2.yr_av(m,:,:,:)); a6=(a-a0)/p.dT(6); s6=squeeze(std(a6,1,1)); %SPM-T30obs minus CTL
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); %a2 minus a1
p.v6=d.diff; p.dv6=d.avg.diff; p.isig6=d.idx; p.isig6_av=d.avg.idx; %OP minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a3,s3,nb,num,p.id,p.aa,mskopt,sopt,slev); %a3 minus a1
p.v7=d.diff; p.dv7=d.avg.diff; p.isig7=d.idx; p.isig7_av=d.avg.idx; %SPM-P10obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a4,s4,nb,num,p.id,p.aa,mskopt,sopt,slev); %a4 minus a1
p.v8=d.diff; p.dv8=d.avg.diff; p.isig8=d.idx; p.isig8_av=d.avg.idx; %SPM-P20obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a5,s5,nb,num,p.id,p.aa,mskopt,sopt,slev); %a5 minus a1
p.v9=d.diff; p.dv9=d.avg.diff; p.isig9=d.idx; p.isig9_av=d.avg.idx; %SPM-P30obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a6,s6,nb,num,p.id,p.aa,mskopt,sopt,slev); %a6 minus a1
p.v10=d.diff; p.dv10=d.avg.diff; p.isig10=d.idx; p.isig10_av=d.avg.idx; %SPM-T30obs minus SPM in response

%FWIc: corrected FWI
v=z.v0.fwiday_c.fwi;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a;              s0=squeeze(std(a, 1,1));
v=z.w1.fwiday_c.fwi;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=(a-a0)/p.dT(1); s1=squeeze(std(a1,1,1)); %SPM        minus CTL
v=z.w2.fwiday_c.fwi;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=(a-a0)/p.dT(2); s2=squeeze(std(a2,1,1)); %OP         minus CTL
v=z.w1a.fwiday_c.fwi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a3=(a-a0)/p.dT(3); s3=squeeze(std(a3,1,1)); %SPM-P10obs minus CTL
v=z.w1b.fwiday_c.fwi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a4=(a-a0)/p.dT(4); s4=squeeze(std(a4,1,1)); %SPM-P20obs minus CTL
v=z.w1c.fwiday_c.fwi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a5=(a-a0)/p.dT(5); s5=squeeze(std(a5,1,1)); %SPM-P30obs minus CTL
v=z.w1d.fwiday_c.fwi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a6=(a-a0)/p.dT(6); s6=squeeze(std(a6,1,1)); %SPM-T30obs minus CTL
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); %a2 minus a1
p.v11=d.diff; p.dv11=d.avg.diff; p.isig11=d.idx; p.isig11_av=d.avg.idx; %OP minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a3,s3,nb,num,p.id,p.aa,mskopt,sopt,slev); %a3 minus a1
p.v12=d.diff; p.dv12=d.avg.diff; p.isig12=d.idx; p.isig12_av=d.avg.idx; %SPM-P10obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a4,s4,nb,num,p.id,p.aa,mskopt,sopt,slev); %a4 minus a1
p.v13=d.diff; p.dv13=d.avg.diff; p.isig13=d.idx; p.isig13_av=d.avg.idx; %SPM-P20obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a5,s5,nb,num,p.id,p.aa,mskopt,sopt,slev); %a5 minus a1
p.v14=d.diff; p.dv14=d.avg.diff; p.isig14=d.idx; p.isig14_av=d.avg.idx; %SPM-P30obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a6,s6,nb,num,p.id,p.aa,mskopt,sopt,slev); %a6 minus a1
p.v15=d.diff; p.dv15=d.avg.diff; p.isig15=d.idx; p.isig15_av=d.avg.idx; %SPM-T30obs minus SPM in response

%DSRc: corrected DSR
v=z.v0.fwiday_c.dsr;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a;              s0=squeeze(std(a, 1,1));
v=z.w1.fwiday_c.dsr;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=(a-a0)/p.dT(1); s1=squeeze(std(a1,1,1)); %SPM        minus CTL
v=z.w2.fwiday_c.dsr;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=(a-a0)/p.dT(2); s2=squeeze(std(a2,1,1)); %OP         minus CTL
v=z.w1a.fwiday_c.dsr; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a3=(a-a0)/p.dT(3); s3=squeeze(std(a3,1,1)); %SPM-P10obs minus CTL
v=z.w1b.fwiday_c.dsr; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a4=(a-a0)/p.dT(4); s4=squeeze(std(a4,1,1)); %SPM-P20obs minus CTL
v=z.w1c.fwiday_c.dsr; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a5=(a-a0)/p.dT(5); s5=squeeze(std(a5,1,1)); %SPM-P30obs minus CTL
v=z.w1d.fwiday_c.dsr; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a6=(a-a0)/p.dT(6); s6=squeeze(std(a6,1,1)); %SPM-T30obs minus CTL
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); %a2 minus a1
p.v16=d.diff; p.dv16=d.avg.diff; p.isig16=d.idx; p.isig16_av=d.avg.idx; %OP minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a3,s3,nb,num,p.id,p.aa,mskopt,sopt,slev); %a3 minus a1
p.v17=d.diff; p.dv17=d.avg.diff; p.isig17=d.idx; p.isig17_av=d.avg.idx; %SPM-P10obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a4,s4,nb,num,p.id,p.aa,mskopt,sopt,slev); %a4 minus a1
p.v18=d.diff; p.dv18=d.avg.diff; p.isig18=d.idx; p.isig18_av=d.avg.idx; %SPM-P20obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a5,s5,nb,num,p.id,p.aa,mskopt,sopt,slev); %a5 minus a1
p.v19=d.diff; p.dv19=d.avg.diff; p.isig19=d.idx; p.isig19_av=d.avg.idx; %SPM-P30obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a6,s6,nb,num,p.id,p.aa,mskopt,sopt,slev); %a6 minus a1
p.v20=d.diff; p.dv20=d.avg.diff; p.isig20=d.idx; p.isig20_av=d.avg.idx; %SPM-T30obs minus SPM in response

p.showus=true; p.showavg=true;
p.fmt='eps'; plot_extreme_extended(p); %plot_pattern_effect_Fig_extremes(p)
%p.fmt='eps'; plot_pattern_effect_Fig_extremes_20panel_Transposed(p); %plot_pattern_effect_Fig_extremes(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigRS07b: percentile changes in TAS, VPD, TWB, and RH at 2m from SPM-Pobs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea;
ipct=9;  iipct=3; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %95th 5th
%ipct=10; iipct=2; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %99th 1th
a1='Observed-pattern minus SPM'; a2='SPM-P10obs minus SPM'; a3='SPM-P20obs minus SPM '; a4='SPM-P30obs minus SPM'; a5='SPM-T30obs minus SPM'; p.flipcmap=0;
p.vname='tas_vpd_twb_rh'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
p.vname='FigRS07b'; sopt=1; slev=90; sopt=2; slev=95; %sopt=1:z-test; 2 Welch's two-sample t-test; slev=95; 95% confidence
del=' $\Delta$'; s1='TAS;'; s2='VPD; '; s3='TWB; '; s4='RH; ';
p.s1 =strcat(a1,del,s1); p.s2 =strcat(a2,del,s1); p.s3 =strcat(a3,del,s1); p.s4 =strcat(a4,del,s1); p.s5 =strcat(a5,del,s1);
p.s6 =strcat(a1,del,s2); p.s7 =strcat(a2,del,s2); p.s8 =strcat(a3,del,s2); p.s9 =strcat(a4,del,s2); p.s10=strcat(a5,del,s2);
p.s11=strcat(a1,del,s3); p.s12=strcat(a2,del,s3); p.s13=strcat(a3,del,s3); p.s14=strcat(a4,del,s3); p.s15=strcat(a5,del,s3);
p.s16=strcat(a1,del,s4); p.s17=strcat(a2,del,s4); p.s18=strcat(a3,del,s4); p.s19=strcat(a4,del,s4); p.s20=strcat(a5,del,s4);

p.unit0 ='$\rm{^{\circ}C}$';    p.unit0_bar ='\rm{^{\circ}C}';
p.unit1 ='$\rm{KK^{-1}}$';      p.unit1_bar ='\rm{KK^{-1}}';
p.unit3 ='$\rm{hPa}$';          p.unit3_bar ='\rm{hPa}'; 
p.unit4 ='$\rm{hPaK^{-1}}$';    p.unit4_bar ='\rm{hPaK^{-1}}'; 
p.unit6 ='$\rm{^{\circ}C}$';    p.unit6_bar ='\rm{^{\circ}C}';
p.unit7 ='$\rm{KK^{-1}}$';      p.unit7_bar ='\rm{KK^{-1}}';
p.unit9 ='$\rm{\%}$';           p.unit9_bar ='\rm{%}'; 
p.unit10='$\rm{\%K^{-1}}$';     p.unit10_bar='\rm{%K^{-1}}';

p.cmin1 =-5.0;  p.cmax1 = 5.0;
p.cmin2 =-10.;  p.cmax2 = 10.;
p.cmin3 =-3.0;  p.cmax3 = 3.0;
p.cmin4 =-10.;  p.cmax4 = 10.;
p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;

v=z.v0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

v=z.v0; nb=20; no=14; num=1; mskopt=0;
p.dT=[1.220000000000000   1.240000000000000  ...
      1.228980456119189   1.298864778538075   1.294701559300108   1.255725808265311];

%tasday
v=z.v0.tasday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a;              s0=squeeze(std(a, 1,1));
v=z.w1.tasday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=(a-a0)/p.dT(1); s1=squeeze(std(a1,1,1)); %SPM        minus CTL
v=z.w2.tasday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=(a-a0)/p.dT(2); s2=squeeze(std(a2,1,1)); %OP         minus CTL
v=z.w1a.tasday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a3=(a-a0)/p.dT(3); s3=squeeze(std(a3,1,1)); %SPM-P10obs minus CTL
v=z.w1b.tasday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a4=(a-a0)/p.dT(4); s4=squeeze(std(a4,1,1)); %SPM-P20obs minus CTL
v=z.w1c.tasday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a5=(a-a0)/p.dT(5); s5=squeeze(std(a5,1,1)); %SPM-P30obs minus CTL
v=z.w1d.tasday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a6=(a-a0)/p.dT(6); s6=squeeze(std(a6,1,1)); %SPM-T30obs minus CTL
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); %a2 minus a1
p.v1=d.diff; p.dv1=d.avg.diff; p.isig1=d.idx; p.isig1_av=d.avg.idx; %OP minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a3,s3,nb,num,p.id,p.aa,mskopt,sopt,slev); %a3 minus a1
p.v2=d.diff; p.dv2=d.avg.diff; p.isig2=d.idx; p.isig2_av=d.avg.idx; %SPM-P10obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a4,s4,nb,num,p.id,p.aa,mskopt,sopt,slev); %a4 minus a1
p.v3=d.diff; p.dv3=d.avg.diff; p.isig3=d.idx; p.isig3_av=d.avg.idx; %SPM-P20obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a5,s5,nb,num,p.id,p.aa,mskopt,sopt,slev); %a5 minus a1
p.v4=d.diff; p.dv4=d.avg.diff; p.isig4=d.idx; p.isig4_av=d.avg.idx; %SPM-P30obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a6,s6,nb,num,p.id,p.aa,mskopt,sopt,slev); %a6 minus a1
p.v5=d.diff; p.dv5=d.avg.diff; p.isig5=d.idx; p.isig5_av=d.avg.idx; %SPM-T30obs minus SPM in response

%vpdday
v=z.v0.vpdday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a;            s0=squeeze(std(a, 1,1));
v=z.w1.vpdday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=(a-a0)/p.dT(1); s1=squeeze(std(a1,1,1)); %SPM        minus CTL
v=z.w2.vpdday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=(a-a0)/p.dT(2); s2=squeeze(std(a2,1,1)); %OP         minus CTL
v=z.w1a.vpdday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a3=(a-a0)/p.dT(3); s3=squeeze(std(a3,1,1)); %SPM-P10obs minus CTL
v=z.w1b.vpdday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a4=(a-a0)/p.dT(4); s4=squeeze(std(a4,1,1)); %SPM-P20obs minus CTL
v=z.w1c.vpdday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a5=(a-a0)/p.dT(5); s5=squeeze(std(a5,1,1)); %SPM-P30obs minus CTL
v=z.w1d.vpdday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a6=(a-a0)/p.dT(6); s6=squeeze(std(a6,1,1)); %SPM-T30obs minus CTL
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); %a2 minus a1
p.v6=d.diff; p.dv6=d.avg.diff; p.isig6=d.idx; p.isig6_av=d.avg.idx; %OP minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a3,s3,nb,num,p.id,p.aa,mskopt,sopt,slev); %a3 minus a1
p.v7=d.diff; p.dv7=d.avg.diff; p.isig7=d.idx; p.isig7_av=d.avg.idx; %SPM-P10obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a4,s4,nb,num,p.id,p.aa,mskopt,sopt,slev); %a4 minus a1
p.v8=d.diff; p.dv8=d.avg.diff; p.isig8=d.idx; p.isig8_av=d.avg.idx; %SPM-P20obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a5,s5,nb,num,p.id,p.aa,mskopt,sopt,slev); %a5 minus a1
p.v9=d.diff; p.dv9=d.avg.diff; p.isig9=d.idx; p.isig9_av=d.avg.idx; %SPM-P30obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a6,s6,nb,num,p.id,p.aa,mskopt,sopt,slev); %a6 minus a1
p.v10=d.diff; p.dv10=d.avg.diff; p.isig10=d.idx; p.isig10_av=d.avg.idx; %SPM-T30obs minus SPM in response

%twbday
v=z.v0.twbday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a;            s0=squeeze(std(a, 1,1));
v=z.w1.twbday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=(a-a0)/p.dT(1); s1=squeeze(std(a1,1,1)); %SPM        minus CTL
v=z.w2.twbday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=(a-a0)/p.dT(2); s2=squeeze(std(a2,1,1)); %OP         minus CTL
v=z.w1a.twbday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a3=(a-a0)/p.dT(3); s3=squeeze(std(a3,1,1)); %SPM-P10obs minus CTL
v=z.w1b.twbday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a4=(a-a0)/p.dT(4); s4=squeeze(std(a4,1,1)); %SPM-P20obs minus CTL
v=z.w1c.twbday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a5=(a-a0)/p.dT(5); s5=squeeze(std(a5,1,1)); %SPM-P30obs minus CTL
v=z.w1d.twbday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a6=(a-a0)/p.dT(6); s6=squeeze(std(a6,1,1)); %SPM-T30obs minus CTL
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); %a2 minus a1
p.v11=d.diff; p.dv11=d.avg.diff; p.isig11=d.idx; p.isig11_av=d.avg.idx; %OP minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a3,s3,nb,num,p.id,p.aa,mskopt,sopt,slev); %a3 minus a1
p.v12=d.diff; p.dv12=d.avg.diff; p.isig12=d.idx; p.isig12_av=d.avg.idx; %SPM-P10obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a4,s4,nb,num,p.id,p.aa,mskopt,sopt,slev); %a4 minus a1
p.v13=d.diff; p.dv13=d.avg.diff; p.isig13=d.idx; p.isig13_av=d.avg.idx; %SPM-P20obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a5,s5,nb,num,p.id,p.aa,mskopt,sopt,slev); %a5 minus a1
p.v14=d.diff; p.dv14=d.avg.diff; p.isig14=d.idx; p.isig14_av=d.avg.idx; %SPM-P30obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a6,s6,nb,num,p.id,p.aa,mskopt,sopt,slev); %a6 minus a1
p.v15=d.diff; p.dv15=d.avg.diff; p.isig15=d.idx; p.isig15_av=d.avg.idx; %SPM-T30obs minus SPM in response

%RHday
v=z.v0.rhday;  a=squeeze(v.yr_pct(m,:,iipct,:,:)); a0=a;            s0=squeeze(std(a, 1,1));
v=z.w1.rhday;  a=squeeze(v.yr_pct(m,:,iipct,:,:)); a1=(a-a0)/p.dT(1); s1=squeeze(std(a1,1,1)); %SPM        minus CTL
v=z.w2.rhday;  a=squeeze(v.yr_pct(m,:,iipct,:,:)); a2=(a-a0)/p.dT(2); s2=squeeze(std(a2,1,1)); %OP         minus CTL
v=z.w1a.rhday; a=squeeze(v.yr_pct(m,:,iipct,:,:)); a3=(a-a0)/p.dT(3); s3=squeeze(std(a3,1,1)); %SPM-P10obs minus CTL
v=z.w1b.rhday; a=squeeze(v.yr_pct(m,:,iipct,:,:)); a4=(a-a0)/p.dT(4); s4=squeeze(std(a4,1,1)); %SPM-P20obs minus CTL
v=z.w1c.rhday; a=squeeze(v.yr_pct(m,:,iipct,:,:)); a5=(a-a0)/p.dT(5); s5=squeeze(std(a5,1,1)); %SPM-P30obs minus CTL
v=z.w1d.rhday; a=squeeze(v.yr_pct(m,:,iipct,:,:)); a6=(a-a0)/p.dT(6); s6=squeeze(std(a6,1,1)); %SPM-T30obs minus CTL
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); %a2 minus a1
p.v16=d.diff; p.dv16=d.avg.diff; p.isig16=d.idx; p.isig16_av=d.avg.idx; %OP minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a3,s3,nb,num,p.id,p.aa,mskopt,sopt,slev); %a3 minus a1
p.v17=d.diff; p.dv17=d.avg.diff; p.isig17=d.idx; p.isig17_av=d.avg.idx; %SPM-P10obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a4,s4,nb,num,p.id,p.aa,mskopt,sopt,slev); %a4 minus a1
p.v18=d.diff; p.dv18=d.avg.diff; p.isig18=d.idx; p.isig18_av=d.avg.idx; %SPM-P20obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a5,s5,nb,num,p.id,p.aa,mskopt,sopt,slev); %a5 minus a1
p.v19=d.diff; p.dv19=d.avg.diff; p.isig19=d.idx; p.isig19_av=d.avg.idx; %SPM-P30obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a6,s6,nb,num,p.id,p.aa,mskopt,sopt,slev); %a6 minus a1
p.v20=d.diff; p.dv20=d.avg.diff; p.isig20=d.idx; p.isig20_av=d.avg.idx; %SPM-T30obs minus SPM in response

p.showus=true; p.showavg=true;
p.fmt='eps'; plot_extreme_extended(p); %plot_pattern_effect_Fig_extremes(p)
%p.fmt='eps'; plot_pattern_effect_Fig_extremes_20panel_Transposed(p); %plot_pattern_effect_Fig_extremes(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigRS08: HWFc, HWIc, FWIc, DSRc from SP-EPbest to SP-EPworst
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea;
ipct=9;  iipct=3; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %95th 5th
%ipct=10; iipct=2; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %99th 1th
a1='Observed-pattern minus SPM'; a2='SP-EPbest minus SPM'; a3='SP-EPbest2 minus SPM '; a4='SP-EPworst2 minus SPM'; a5='SP-EPworst minus SPM'; p.flipcmap=0;
p.sea=nsea{isea};
p.vname='FigRS08'; sopt=1; slev=90; sopt=2; slev=95; %sopt=1:z-test; 2 Welch's two-sample t-test; slev=95; 95% confidence
del=' $\Delta$'; s1='HWFc;'; s2='HWIc; '; s3='FWIc; '; s4='DSRc; ';
p.s1 =strcat(a1,del,s1); p.s2 =strcat(a2,del,s1); p.s3 =strcat(a3,del,s1); p.s4 =strcat(a4,del,s1); p.s5 =strcat(a5,del,s1);
p.s6 =strcat(a1,del,s2); p.s7 =strcat(a2,del,s2); p.s8 =strcat(a3,del,s2); p.s9 =strcat(a4,del,s2); p.s10=strcat(a5,del,s2);
p.s11=strcat(a1,del,s3); p.s12=strcat(a2,del,s3); p.s13=strcat(a3,del,s3); p.s14=strcat(a4,del,s3); p.s15=strcat(a5,del,s3);
p.s16=strcat(a1,del,s4); p.s17=strcat(a2,del,s4); p.s18=strcat(a3,del,s4); p.s19=strcat(a4,del,s4); p.s20=strcat(a5,del,s4);

p.unit0 ='$\rm{\%}$';           p.unit0_bar ='\rm{%}';
p.unit1 ='$\rm{\%K^{-1}}$';     p.unit1_bar ='\rm{%K^{-1}}';
p.unit3 ='$\rm{\%}$';           p.unit3_bar ='\rm{%}'; 
p.unit4 ='$\rm{KK^{-1}}$';      p.unit4_bar ='\rm{KK^{-1}}'; 
p.unit6 ='$\rm{KK^{-1}}$';      p.unit6_bar ='\rm{KK^{-1}}';
p.unit7 ='$\rm{K^{-1}}$';       p.unit7_bar ='\rm{K^{-1}}';
p.unit9 ='$\rm{K^{-1}}$';       p.unit9_bar ='\rm{K^{-1}}';
p.unit10='$\rm{K^{-1}}$';       p.unit10_bar='\rm{K^{-1}}';

p.cmin1 =-20;  p.cmax1 = 20;
p.cmin2 =-2.;  p.cmax2 = 2.;
p.cmin3 =-15;  p.cmax3 = 15;
p.cmin4 =-10.; p.cmax4 = 10.;
p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;

v=z.v0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

v=z.v0; nb=20; no=14; num=1; mskopt=0;
p.dT=[1.220000000000000   1.240000000000000  ...
      1.228980456119189   1.298864778538075   1.294701559300108   1.255725808265311];

%%hwday2: corrected HWF
v=z.v0.hwday2;  a=squeeze(v.yr_av(m,:,:,:))*100; a0=a;              s0=squeeze(std(a, 1,1));
v=z.w1.hwday2;  a=squeeze(v.yr_av(m,:,:,:))*100; a1=(a-a0)/p.dT(1); s1=squeeze(std(a1,1,1)); %SPM        minus CTL
v=z.w2.hwday2;  a=squeeze(v.yr_av(m,:,:,:))*100; a2=(a-a0)/p.dT(2); s2=squeeze(std(a2,1,1)); %OP         minus CTL
v=z.w1A.hwday2; a=squeeze(v.yr_av(m,:,:,:))*100; a3=(a-a0)/p.dT(3); s3=squeeze(std(a3,1,1)); %SPM-P10obs minus CTL
v=z.w1B.hwday2; a=squeeze(v.yr_av(m,:,:,:))*100; a4=(a-a0)/p.dT(4); s4=squeeze(std(a4,1,1)); %SPM-P20obs minus CTL
v=z.w1C.hwday2; a=squeeze(v.yr_av(m,:,:,:))*100; a5=(a-a0)/p.dT(5); s5=squeeze(std(a5,1,1)); %SPM-P30obs minus CTL
v=z.w1D.hwday2; a=squeeze(v.yr_av(m,:,:,:))*100; a6=(a-a0)/p.dT(6); s6=squeeze(std(a6,1,1)); %SPM-T30obs minus CTL
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); %a2 minus a1
p.v1=d.diff; p.dv1=d.avg.diff; p.isig1=d.idx; p.isig1_av=d.avg.idx; %OP minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a3,s3,nb,num,p.id,p.aa,mskopt,sopt,slev); %a3 minus a1
p.v2=d.diff; p.dv2=d.avg.diff; p.isig2=d.idx; p.isig2_av=d.avg.idx; %SPM-P10obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a4,s4,nb,num,p.id,p.aa,mskopt,sopt,slev); %a4 minus a1
p.v3=d.diff; p.dv3=d.avg.diff; p.isig3=d.idx; p.isig3_av=d.avg.idx; %SPM-P20obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a5,s5,nb,num,p.id,p.aa,mskopt,sopt,slev); %a5 minus a1
p.v4=d.diff; p.dv4=d.avg.diff; p.isig4=d.idx; p.isig4_av=d.avg.idx; %SPM-P30obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a6,s6,nb,num,p.id,p.aa,mskopt,sopt,slev); %a6 minus a1
p.v5=d.diff; p.dv5=d.avg.diff; p.isig5=d.idx; p.isig5_av=d.avg.idx; %SPM-T30obs minus SPM in response

%Hwtmx2: corrected HWI
v=z.v0.hwtmx2;  a=squeeze(v.yr_av(m,:,:,:)./z.v0.hwday2.yr_av (m,:,:,:)); a0=a;              s0=squeeze(std(a, 1,1));
v=z.w1.hwtmx2;  a=squeeze(v.yr_av(m,:,:,:)./z.w1.hwday2.yr_av (m,:,:,:)); a1=(a-a0)/p.dT(1); s1=squeeze(std(a1,1,1)); %SPM        minus CTL
v=z.w2.hwtmx2;  a=squeeze(v.yr_av(m,:,:,:)./z.w2.hwday2.yr_av (m,:,:,:)); a2=(a-a0)/p.dT(2); s2=squeeze(std(a2,1,1)); %OP         minus CTL
v=z.w1A.hwtmx2; a=squeeze(v.yr_av(m,:,:,:)./z.w1A.hwday2.yr_av(m,:,:,:)); a3=(a-a0)/p.dT(3); s3=squeeze(std(a3,1,1)); %SPM-P10obs minus CTL
v=z.w1B.hwtmx2; a=squeeze(v.yr_av(m,:,:,:)./z.w1B.hwday2.yr_av(m,:,:,:)); a4=(a-a0)/p.dT(4); s4=squeeze(std(a4,1,1)); %SPM-P20obs minus CTL
v=z.w1C.hwtmx2; a=squeeze(v.yr_av(m,:,:,:)./z.w1C.hwday2.yr_av(m,:,:,:)); a5=(a-a0)/p.dT(5); s5=squeeze(std(a5,1,1)); %SPM-P30obs minus CTL
v=z.w1D.hwtmx2; a=squeeze(v.yr_av(m,:,:,:)./z.w1D.hwday2.yr_av(m,:,:,:)); a6=(a-a0)/p.dT(6); s6=squeeze(std(a6,1,1)); %SPM-T30obs minus CTL
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); %a2 minus a1
p.v6=d.diff; p.dv6=d.avg.diff; p.isig6=d.idx; p.isig6_av=d.avg.idx; %OP minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a3,s3,nb,num,p.id,p.aa,mskopt,sopt,slev); %a3 minus a1
p.v7=d.diff; p.dv7=d.avg.diff; p.isig7=d.idx; p.isig7_av=d.avg.idx; %SPM-P10obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a4,s4,nb,num,p.id,p.aa,mskopt,sopt,slev); %a4 minus a1
p.v8=d.diff; p.dv8=d.avg.diff; p.isig8=d.idx; p.isig8_av=d.avg.idx; %SPM-P20obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a5,s5,nb,num,p.id,p.aa,mskopt,sopt,slev); %a5 minus a1
p.v9=d.diff; p.dv9=d.avg.diff; p.isig9=d.idx; p.isig9_av=d.avg.idx; %SPM-P30obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a6,s6,nb,num,p.id,p.aa,mskopt,sopt,slev); %a6 minus a1
p.v10=d.diff; p.dv10=d.avg.diff; p.isig10=d.idx; p.isig10_av=d.avg.idx; %SPM-T30obs minus SPM in response

%FWIc: corrected FWI
v=z.v0.fwiday_c.fwi;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a;              s0=squeeze(std(a, 1,1));
v=z.w1.fwiday_c.fwi;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=(a-a0)/p.dT(1); s1=squeeze(std(a1,1,1)); %SPM        minus CTL
v=z.w2.fwiday_c.fwi;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=(a-a0)/p.dT(2); s2=squeeze(std(a2,1,1)); %OP         minus CTL
v=z.w1A.fwiday_c.fwi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a3=(a-a0)/p.dT(3); s3=squeeze(std(a3,1,1)); %SPM-P10obs minus CTL
v=z.w1B.fwiday_c.fwi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a4=(a-a0)/p.dT(4); s4=squeeze(std(a4,1,1)); %SPM-P20obs minus CTL
v=z.w1C.fwiday_c.fwi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a5=(a-a0)/p.dT(5); s5=squeeze(std(a5,1,1)); %SPM-P30obs minus CTL
v=z.w1D.fwiday_c.fwi; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a6=(a-a0)/p.dT(6); s6=squeeze(std(a6,1,1)); %SPM-T30obs minus CTL
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); %a2 minus a1
p.v11=d.diff; p.dv11=d.avg.diff; p.isig11=d.idx; p.isig11_av=d.avg.idx; %OP minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a3,s3,nb,num,p.id,p.aa,mskopt,sopt,slev); %a3 minus a1
p.v12=d.diff; p.dv12=d.avg.diff; p.isig12=d.idx; p.isig12_av=d.avg.idx; %SPM-P10obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a4,s4,nb,num,p.id,p.aa,mskopt,sopt,slev); %a4 minus a1
p.v13=d.diff; p.dv13=d.avg.diff; p.isig13=d.idx; p.isig13_av=d.avg.idx; %SPM-P20obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a5,s5,nb,num,p.id,p.aa,mskopt,sopt,slev); %a5 minus a1
p.v14=d.diff; p.dv14=d.avg.diff; p.isig14=d.idx; p.isig14_av=d.avg.idx; %SPM-P30obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a6,s6,nb,num,p.id,p.aa,mskopt,sopt,slev); %a6 minus a1
p.v15=d.diff; p.dv15=d.avg.diff; p.isig15=d.idx; p.isig15_av=d.avg.idx; %SPM-T30obs minus SPM in response

%DSRc: corrected DSR
v=z.v0.fwiday_c.dsr;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a;              s0=squeeze(std(a, 1,1));
v=z.w1.fwiday_c.dsr;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=(a-a0)/p.dT(1); s1=squeeze(std(a1,1,1)); %SPM        minus CTL
v=z.w2.fwiday_c.dsr;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=(a-a0)/p.dT(2); s2=squeeze(std(a2,1,1)); %OP         minus CTL
v=z.w1A.fwiday_c.dsr; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a3=(a-a0)/p.dT(3); s3=squeeze(std(a3,1,1)); %SPM-P10obs minus CTL
v=z.w1B.fwiday_c.dsr; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a4=(a-a0)/p.dT(4); s4=squeeze(std(a4,1,1)); %SPM-P20obs minus CTL
v=z.w1C.fwiday_c.dsr; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a5=(a-a0)/p.dT(5); s5=squeeze(std(a5,1,1)); %SPM-P30obs minus CTL
v=z.w1D.fwiday_c.dsr; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a6=(a-a0)/p.dT(6); s6=squeeze(std(a6,1,1)); %SPM-T30obs minus CTL
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); %a2 minus a1
p.v16=d.diff; p.dv16=d.avg.diff; p.isig16=d.idx; p.isig16_av=d.avg.idx; %OP minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a3,s3,nb,num,p.id,p.aa,mskopt,sopt,slev); %a3 minus a1
p.v17=d.diff; p.dv17=d.avg.diff; p.isig17=d.idx; p.isig17_av=d.avg.idx; %SPM-P10obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a4,s4,nb,num,p.id,p.aa,mskopt,sopt,slev); %a4 minus a1
p.v18=d.diff; p.dv18=d.avg.diff; p.isig18=d.idx; p.isig18_av=d.avg.idx; %SPM-P20obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a5,s5,nb,num,p.id,p.aa,mskopt,sopt,slev); %a5 minus a1
p.v19=d.diff; p.dv19=d.avg.diff; p.isig19=d.idx; p.isig19_av=d.avg.idx; %SPM-P30obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a6,s6,nb,num,p.id,p.aa,mskopt,sopt,slev); %a6 minus a1
p.v20=d.diff; p.dv20=d.avg.diff; p.isig20=d.idx; p.isig20_av=d.avg.idx; %SPM-T30obs minus SPM in response

p.showus=true; p.showavg=true;
p.fmt='eps'; plot_extreme_extended(p); %plot_pattern_effect_Fig_extremes(p)
%p.fmt='eps'; plot_pattern_effect_Fig_extremes_20panel_Transposed(p); %plot_pattern_effect_Fig_extremes(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigRS08b: percentile changes in TAS, VPD, TWB, and RH at 2m from SP-EPbest to SP-EPworst
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea;
ipct=9;  iipct=3; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %95th 5th
%ipct=10; iipct=2; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %99th 1th
a1='Observed-pattern minus SPM'; a2='SP-EPbest minus SPM'; a3='SP-EPbest2 minus SPM '; a4='SP-EPworst2 minus SPM'; a5='SP-EPworst minus SPM'; p.flipcmap=0;
p.vname='tas_vpd_twb_rh'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
p.vname='FigRS08b'; sopt=1; slev=90; sopt=2; slev=95; %sopt=1:z-test; 2 Welch's two-sample t-test; slev=95; 95% confidence
del=' $\Delta$'; s1='TAS;'; s2='VPD; '; s3='TWB; '; s4='RH; ';
p.s1 =strcat(a1,del,s1); p.s2 =strcat(a2,del,s1); p.s3 =strcat(a3,del,s1); p.s4 =strcat(a4,del,s1); p.s5 =strcat(a5,del,s1);
p.s6 =strcat(a1,del,s2); p.s7 =strcat(a2,del,s2); p.s8 =strcat(a3,del,s2); p.s9 =strcat(a4,del,s2); p.s10=strcat(a5,del,s2);
p.s11=strcat(a1,del,s3); p.s12=strcat(a2,del,s3); p.s13=strcat(a3,del,s3); p.s14=strcat(a4,del,s3); p.s15=strcat(a5,del,s3);
p.s16=strcat(a1,del,s4); p.s17=strcat(a2,del,s4); p.s18=strcat(a3,del,s4); p.s19=strcat(a4,del,s4); p.s20=strcat(a5,del,s4);

p.unit0 ='$\rm{^{\circ}C}$';    p.unit0_bar ='\rm{^{\circ}C}';
p.unit1 ='$\rm{KK^{-1}}$';      p.unit1_bar ='\rm{KK^{-1}}';
p.unit3 ='$\rm{hPa}$';          p.unit3_bar ='\rm{hPa}'; 
p.unit4 ='$\rm{hPaK^{-1}}$';    p.unit4_bar ='\rm{hPaK^{-1}}'; 
p.unit6 ='$\rm{^{\circ}C}$';    p.unit6_bar ='\rm{^{\circ}C}';
p.unit7 ='$\rm{KK^{-1}}$';      p.unit7_bar ='\rm{KK^{-1}}';
p.unit9 ='$\rm{\%}$';           p.unit9_bar ='\rm{%}'; 
p.unit10='$\rm{\%K^{-1}}$';     p.unit10_bar='\rm{%K^{-1}}';

p.cmin1 =-5.0;  p.cmax1 = 5.0;
p.cmin2 =-10.;  p.cmax2 = 10.;
p.cmin3 =-3.0;  p.cmax3 = 3.0;
p.cmin4 =-10.;  p.cmax4 = 10.;
p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;

v=z.v0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

v=z.v0; nb=20; no=14; num=1; mskopt=0;
p.dT=[1.220000000000000   1.240000000000000  ...
     1.294860038632294   1.250127504189322   1.238975152416572   1.215640398897563];

%tasday
v=z.v0.tasday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a;              s0=squeeze(std(a, 1,1));
v=z.w1.tasday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=(a-a0)/p.dT(1); s1=squeeze(std(a1,1,1)); %SPM        minus CTL
v=z.w2.tasday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=(a-a0)/p.dT(2); s2=squeeze(std(a2,1,1)); %OP         minus CTL
v=z.w1A.tasday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a3=(a-a0)/p.dT(3); s3=squeeze(std(a3,1,1)); %SPM-P10obs minus CTL
v=z.w1B.tasday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a4=(a-a0)/p.dT(4); s4=squeeze(std(a4,1,1)); %SPM-P20obs minus CTL
v=z.w1D.tasday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a5=(a-a0)/p.dT(5); s5=squeeze(std(a5,1,1)); %SPM-P30obs minus CTL
v=z.w1E.tasday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a6=(a-a0)/p.dT(6); s6=squeeze(std(a6,1,1)); %SPM-T30obs minus CTL
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); %a2 minus a1
p.v1=d.diff; p.dv1=d.avg.diff; p.isig1=d.idx; p.isig1_av=d.avg.idx; %OP minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a3,s3,nb,num,p.id,p.aa,mskopt,sopt,slev); %a3 minus a1
p.v2=d.diff; p.dv2=d.avg.diff; p.isig2=d.idx; p.isig2_av=d.avg.idx; %SPM-P10obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a4,s4,nb,num,p.id,p.aa,mskopt,sopt,slev); %a4 minus a1
p.v3=d.diff; p.dv3=d.avg.diff; p.isig3=d.idx; p.isig3_av=d.avg.idx; %SPM-P20obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a5,s5,nb,num,p.id,p.aa,mskopt,sopt,slev); %a5 minus a1
p.v4=d.diff; p.dv4=d.avg.diff; p.isig4=d.idx; p.isig4_av=d.avg.idx; %SPM-P30obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a6,s6,nb,num,p.id,p.aa,mskopt,sopt,slev); %a6 minus a1
p.v5=d.diff; p.dv5=d.avg.diff; p.isig5=d.idx; p.isig5_av=d.avg.idx; %SPM-T30obs minus SPM in response

%vpdday
v=z.v0.vpdday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a;            s0=squeeze(std(a, 1,1));
v=z.w1.vpdday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=(a-a0)/p.dT(1); s1=squeeze(std(a1,1,1)); %SPM        minus CTL
v=z.w2.vpdday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=(a-a0)/p.dT(2); s2=squeeze(std(a2,1,1)); %OP         minus CTL
v=z.w1A.vpdday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a3=(a-a0)/p.dT(3); s3=squeeze(std(a3,1,1)); %SPM-P10obs minus CTL
v=z.w1B.vpdday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a4=(a-a0)/p.dT(4); s4=squeeze(std(a4,1,1)); %SPM-P20obs minus CTL
v=z.w1D.vpdday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a5=(a-a0)/p.dT(5); s5=squeeze(std(a5,1,1)); %SPM-P30obs minus CTL
v=z.w1E.vpdday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a6=(a-a0)/p.dT(6); s6=squeeze(std(a6,1,1)); %SPM-T30obs minus CTL
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); %a2 minus a1
p.v6=d.diff; p.dv6=d.avg.diff; p.isig6=d.idx; p.isig6_av=d.avg.idx; %OP minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a3,s3,nb,num,p.id,p.aa,mskopt,sopt,slev); %a3 minus a1
p.v7=d.diff; p.dv7=d.avg.diff; p.isig7=d.idx; p.isig7_av=d.avg.idx; %SPM-P10obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a4,s4,nb,num,p.id,p.aa,mskopt,sopt,slev); %a4 minus a1
p.v8=d.diff; p.dv8=d.avg.diff; p.isig8=d.idx; p.isig8_av=d.avg.idx; %SPM-P20obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a5,s5,nb,num,p.id,p.aa,mskopt,sopt,slev); %a5 minus a1
p.v9=d.diff; p.dv9=d.avg.diff; p.isig9=d.idx; p.isig9_av=d.avg.idx; %SPM-P30obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a6,s6,nb,num,p.id,p.aa,mskopt,sopt,slev); %a6 minus a1
p.v10=d.diff; p.dv10=d.avg.diff; p.isig10=d.idx; p.isig10_av=d.avg.idx; %SPM-T30obs minus SPM in response

%twbday
v=z.v0.twbday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a0=a;            s0=squeeze(std(a, 1,1));
v=z.w1.twbday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a1=(a-a0)/p.dT(1); s1=squeeze(std(a1,1,1)); %SPM        minus CTL
v=z.w2.twbday;  a=squeeze(v.yr_pct(m,:,ipct,:,:)); a2=(a-a0)/p.dT(2); s2=squeeze(std(a2,1,1)); %OP         minus CTL
v=z.w1A.twbday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a3=(a-a0)/p.dT(3); s3=squeeze(std(a3,1,1)); %SPM-P10obs minus CTL
v=z.w1B.twbday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a4=(a-a0)/p.dT(4); s4=squeeze(std(a4,1,1)); %SPM-P20obs minus CTL
v=z.w1D.twbday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a5=(a-a0)/p.dT(5); s5=squeeze(std(a5,1,1)); %SPM-P30obs minus CTL
v=z.w1E.twbday; a=squeeze(v.yr_pct(m,:,ipct,:,:)); a6=(a-a0)/p.dT(6); s6=squeeze(std(a6,1,1)); %SPM-T30obs minus CTL
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); %a2 minus a1
p.v11=d.diff; p.dv11=d.avg.diff; p.isig11=d.idx; p.isig11_av=d.avg.idx; %OP minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a3,s3,nb,num,p.id,p.aa,mskopt,sopt,slev); %a3 minus a1
p.v12=d.diff; p.dv12=d.avg.diff; p.isig12=d.idx; p.isig12_av=d.avg.idx; %SPM-P10obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a4,s4,nb,num,p.id,p.aa,mskopt,sopt,slev); %a4 minus a1
p.v13=d.diff; p.dv13=d.avg.diff; p.isig13=d.idx; p.isig13_av=d.avg.idx; %SPM-P20obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a5,s5,nb,num,p.id,p.aa,mskopt,sopt,slev); %a5 minus a1
p.v14=d.diff; p.dv14=d.avg.diff; p.isig14=d.idx; p.isig14_av=d.avg.idx; %SPM-P30obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a6,s6,nb,num,p.id,p.aa,mskopt,sopt,slev); %a6 minus a1
p.v15=d.diff; p.dv15=d.avg.diff; p.isig15=d.idx; p.isig15_av=d.avg.idx; %SPM-T30obs minus SPM in response

%RHday
v=z.v0.rhday;  a=squeeze(v.yr_pct(m,:,iipct,:,:)); a0=a;            s0=squeeze(std(a, 1,1));
v=z.w1.rhday;  a=squeeze(v.yr_pct(m,:,iipct,:,:)); a1=(a-a0)/p.dT(1); s1=squeeze(std(a1,1,1)); %SPM        minus CTL
v=z.w2.rhday;  a=squeeze(v.yr_pct(m,:,iipct,:,:)); a2=(a-a0)/p.dT(2); s2=squeeze(std(a2,1,1)); %OP         minus CTL
v=z.w1A.rhday; a=squeeze(v.yr_pct(m,:,iipct,:,:)); a3=(a-a0)/p.dT(3); s3=squeeze(std(a3,1,1)); %SPM-P10obs minus CTL
v=z.w1B.rhday; a=squeeze(v.yr_pct(m,:,iipct,:,:)); a4=(a-a0)/p.dT(4); s4=squeeze(std(a4,1,1)); %SPM-P20obs minus CTL
v=z.w1D.rhday; a=squeeze(v.yr_pct(m,:,iipct,:,:)); a5=(a-a0)/p.dT(5); s5=squeeze(std(a5,1,1)); %SPM-P30obs minus CTL
v=z.w1E.rhday; a=squeeze(v.yr_pct(m,:,iipct,:,:)); a6=(a-a0)/p.dT(6); s6=squeeze(std(a6,1,1)); %SPM-T30obs minus CTL
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); %a2 minus a1
p.v16=d.diff; p.dv16=d.avg.diff; p.isig16=d.idx; p.isig16_av=d.avg.idx; %OP minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a3,s3,nb,num,p.id,p.aa,mskopt,sopt,slev); %a3 minus a1
p.v17=d.diff; p.dv17=d.avg.diff; p.isig17=d.idx; p.isig17_av=d.avg.idx; %SPM-P10obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a4,s4,nb,num,p.id,p.aa,mskopt,sopt,slev); %a4 minus a1
p.v18=d.diff; p.dv18=d.avg.diff; p.isig18=d.idx; p.isig18_av=d.avg.idx; %SPM-P20obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a5,s5,nb,num,p.id,p.aa,mskopt,sopt,slev); %a5 minus a1
p.v19=d.diff; p.dv19=d.avg.diff; p.isig19=d.idx; p.isig19_av=d.avg.idx; %SPM-P30obs minus SPM in response
d=compute_diff_sigtest(a1,s1,nb,a6,s6,nb,num,p.id,p.aa,mskopt,sopt,slev); %a6 minus a1
p.v20=d.diff; p.dv20=d.avg.diff; p.isig20=d.idx; p.isig20_av=d.avg.idx; %SPM-T30obs minus SPM in response

p.showus=true; p.showavg=true;
p.fmt='eps'; plot_extreme_extended(p); %plot_pattern_effect_Fig_extremes(p)
%p.fmt='eps'; plot_pattern_effect_Fig_extremes_20panel_Transposed(p); %plot_pattern_effect_Fig_extremes(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
latlon=[0 360 -90 90];region='global';
%o=readobs_new(latlon,region,'c48', 'era5');
% o=readobs_new(latlon,region,'c96', 'era5');
%o=readobs_new(latlon,region,'c192','era5');
%fn=strcat('/work/miz/mat_hiresmip/obs_',region,'_to_c48_era5.mat'); load(fn); o.mod='c48';
fn=strcat('/work/miz/mat_hiresmip/obs_',region,'_to_c96_era5.mat'); load(fn); o.mod='c96'; 
%fn=strcat('/work/miz/mat_hiresmip/obs_',region,'_to_c192_era5.mat');load(fn); o.mod='c192';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c96';
p.do_trend=0; p.do_trend_obs=0; p.do_scalar=0; p.myr=1; p.opt=2; p.do_3d_atm=2; p.do_all=1
p.yr1='0002'; p.yr2='0101'; p.syr=1; p.nyr=100; p.y1=0002; p.y2=0101; 
tpath='/archive/Ming.Zhao/awg/2023.04/'; 
p.expn='c192L33_am4p0_2010climo_newctl';                                          v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear';                           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2';                         v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs';          v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_20ns_obs';          v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_30ns_obs';          v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_tropical_30ns_obs';         v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_tropical_20ns_obs';         v=tsana_hiresmip_new(o,tpath,p);

p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs';             v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_atlantic_mdr_obs';          v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_so_45_75s_obs';             v=tsana_hiresmip_new(o,tpath,p);

p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_best_wegradient';           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_worst_wegradient';          v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_2best_wegradient';          v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_2worst_wegradient';         v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_middle_wegradient';         v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_10n_70n_obs'; v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_25n_70n_obs'; v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_south_pacific_10s_45s_obs'; v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_zonal';                     v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m3';                v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m16';               v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m17';               v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m26';               v=tsana_hiresmip_new(o,tpath,p);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load monthly tsana_hiresmip_new data for atmospheric circulation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_hiresmip/obs_global','_to_c96_era5.mat'); load(fn); o.mod='c96'; z.V0=o;
%fn=strcat('/work/miz/mat_hiresmip/obs_global','_to_c96.mat'); load(fn); o.mod='c96'; z.V0=o;
%ph='/archive/Ming.Zhao/awg/2023.04/'; f='_global_opt2.c96_tsana_hiresmip_new_2-101_0002-0101_do_3d_atm_1_do_all_1.mat';
ph='/archive/Ming.Zhao/awg/2023.04/'; f='_global_opt2.c96_tsana_hiresmip_new_ivt_2-101_0002-0101_do_3d_atm_2_do_trend_0.mat';
%ph='/archive/Ming.Zhao/awg/2023.04/'; f='_global_opt2.c192_tsana_hiresmip_new_2-101_0002-0101_do_3d_atm_0_do_all_1.mat';
%e='c192L33_am4p0_2010climo_old';                    n=strcat(ph,e,'/',e,f); load(n);z.v0a=v; 
e='c192L33_am4p0_2010climo_newctl';                                  n=strcat(ph,e,'/',e,f); load(n);z.v0 =v; %z.v0=z.v0b;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear';                   n=strcat(ph,e,'/',e,f); load(n);z.w1 =v;
e='c192L33_am4p0_2010climo_trend_1979_2020_times_2';                 n=strcat(ph,e,'/',e,f); load(n);z.w2 =v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs';  n=strcat(ph,e,'/',e,f); load(n);z.w1a=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_20ns_obs';  n=strcat(ph,e,'/',e,f); load(n);z.w1b=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_30ns_obs';  n=strcat(ph,e,'/',e,f); load(n);z.w1c=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_tropical_30ns_obs'; n=strcat(ph,e,'/',e,f); load(n);z.w1d=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_best_wegradient';   n=strcat(ph,e,'/',e,f); load(n);z.w1A=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_2best_wegradient';  n=strcat(ph,e,'/',e,f); load(n);z.w1B=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_2worst_wegradient'; n=strcat(ph,e,'/',e,f); load(n);z.w1C=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_worst_wegradient';  n=strcat(ph,e,'/',e,f); load(n);z.w1D=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn='/work/miz/mat_hiresmip/sst_patterns_atm_z_new.mat'; save(fn,'z','-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs';  n=strcat(ph,e,'/',e,f);load(n);z.w2a=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs';     n=strcat(ph,e,'/',e,f);load(n);z.w2b=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_atlantic_mdr_obs';  n=strcat(ph,e,'/',e,f);load(n);z.w2c=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_so_45_75s_obs';     n=strcat(ph,e,'/',e,f);load(n);z.w2d=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_tropical_30ns_obs'; n=strcat(ph,e,'/',e,f);load(n);z.w2e=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_obs'; n=strcat(ph,e,'/',e,f);load(n);z.w2g=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_10n_70n_obs'; n=strcat(ph,e,'/',e,f);load(n);z.w2e=v;
%% ph='/archive/Ming.Zhao/awg/2023.04/'; f='_global_opt2.c96_tsana_hiresmip_new_2_101.mat';
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_best_wegradient';  n=strcat(ph,e,'/',e,f);load(n);z.w1a=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_2best_wegradient'; n=strcat(ph,e,'/',e,f);load(n);z.w1b=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_middle_wegradient';n=strcat(ph,e,'/',e,f);load(n);z.w1c=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_2worst_wegradient';n=strcat(ph,e,'/',e,f);load(n);z.w1d=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_worst_wegradient'; n=strcat(ph,e,'/',e,f);load(n);z.w1e=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs'; n=strcat(ph,e,'/',e,f);load(n);z.w1A=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs';    n=strcat(ph,e,'/',e,f);load(n);z.w1B=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_atlantic_mdr_obs'; n=strcat(ph,e,'/',e,f);load(n);z.w1C=v;
%% e='c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_obs';n=strcat(ph,e,'/',e,f);load(n);z.w1D=v;
v=z.v0;  v.dis='OBS CLIMO SST'; v.T=mean(v.sfc.tref.ann_stat.mmen.all);  z.v0 =v;    a=v.T;
v=z.w1;  v.dis='SP-M';          v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; v.dT=1.22; z.w1 =v;
v=z.w2;  v.dis='OP';            v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; v.dT=1.24; z.w2 =v;
v=z.w1a; v.dis='SPM-Pobs10';    v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; z.w1a=v;
v=z.w1b; v.dis='SPM-Pobs20';    v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; z.w1b=v;
v=z.w1c; v.dis='SPM-Pobs30';    v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; z.w1c=v;
v=z.w1d; v.dis='SPM-Tobs30';    v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; z.w1d=v;
v=z.w1A; v.dis='SP-EPbest';     v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; z.w1A=v;
v=z.w1B; v.dis='SP-EPbest2';    v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; z.w1B=v;
v=z.w1C; v.dis='SP-EPworst2';   v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; z.w1C=v;
v=z.w1D; v.dis='SP-EPworst';    v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; z.w1D=v;
a=[z.w1.dT z.w2.dT z.w1a.dT z.w1b.dT z.w1c.dT z.w1d.dT z.w1A.dT z.w1B.dT z.w1C.dT z.w1D.dT]; p.dT=a
p.dT=[1.220000000000000   1.240000000000000  ...
      1.228980456119189   1.298864778538075   1.294701559300108   1.255725808265311 ...
      1.294860038632294   1.250127504189322   1.238975152416572   1.215640398897563];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigR4: atmospheric circulation changes across various season%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
A0='ERA5; '; a0='Control; '; a1='SPEAR-pattern M; '; a2='Observed-pattern; '; a3='Uniform';
nsea={'ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'}; isea=3; %1-7=ANN,MAM,JJA,SON,DJF,NDJFM,MJJA
p.vname='atm_500_200_850_ivt'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea}; p.u200_bin=[15 20];
p.vname='FigR4'; sopt=1; slev=90; %sopt=2; slev=95; %sopt=1:z-test; 2:Welch's two-sample t-test; slev=95; 95% confidence
del=' $\Delta$'; s0='Z500'''; s1='Z200'''; s2='Z850'''; s3='IWTCON'; p.flipcmap=0; p.do_bias=0;
p.S0=strcat(A0,'~(',p.sea,')~',s0);
p.s0=strcat(a0,'~(',p.sea,')~',s0);
p.s1 =strcat(a1,'~',del,s0);
p.s2 =strcat(a2,'~',del,s0); 
%p.s0=strcat(a0,'~(',nsea{isea},');',s0);
%p.s1=strcat(a1,'~(',nsea{isea},');',del,s0);
%p.s2=strcat(a2,'~(',nsea{isea},');',del,s0);
p.S3=strcat(A0,'~(',p.sea,')~',s1); p.s3=strcat(a0,'~(',p.sea,')~',s1); p.s4 =strcat(a1,del,s1); p.s5 =strcat(a2,del,s1); 
p.S6=strcat(A0,'~(',p.sea,')~',s2); p.s6=strcat(a0,'~(',p.sea,')~',s2); p.s7 =strcat(a1,del,s2); p.s8 =strcat(a2,del,s2); 
p.S9=strcat(A0,'~(',p.sea,')~',s3); p.s9=strcat(a0,'~(',p.sea,')~',s3); p.s10=strcat(a1,del,s3); p.s11=strcat(a2,del,s3); 
p.unit0 ='GPM';                 p.unit0_bar =p.unit0;
p.unit1 ='GPM K^{-1}';          p.unit1_bar =p.unit1;
p.unit3 ='GPM';                 p.unit3_bar =p.unit3;
p.unit4 ='GPM K^{-1}';          p.unit4_bar =p.unit4;
p.unit6 ='GPM';                 p.unit6_bar =p.unit6;
p.unit7 ='GPM K^{-1}';          p.unit7_bar =p.unit7;
p.unit9 ='mm day^{-1}';         p.unit9_bar =p.unit9;
p.unit10='mm day^{-1} K^{-1}';  p.unit10_bar=p.unit10;

p.cmin0= -100.0; p.cmax0=100;  p.cmin1 =-15;  p.cmax1 =15.;
p.cmin3= -150.0; p.cmax3=150;  p.cmin4 =-20;  p.cmax4 =20;
p.cmin6= -100.0; p.cmax6=100.; p.cmin7 =-10.; p.cmax7 =10.;
p.cmin9=  -15.0; p.cmax9=15;   p.cmin10=-2;   p.cmax10=2;
p.do_add=1; p.show='off'; p.z1_co='c'; p.co='k'; p.xy=[280 360 0 90];
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa;
a0=z.v0.sfc.tref.tavg0;
a =z.w1.sfc.tref.tavg0-a0;  p.dT1=mean(mean(a.*aa)); p.tas1=a;
a =z.w2.sfc.tref.tavg0-a0;  p.dT2=mean(mean(a.*aa)); p.tas2=a;
imk=z.v0.sfc.ice.tavg0;  aa0=aa; nb=100; no=42; num=1; mskopt=0;

v=z.v0.s; p.lm=v.lm; aa0=v.aa; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<0.5)=0; id(id>=0.5)=1; p.id_lm=(id==1);
lat1= 15; lat2=85; lon1=190; lon2=344; p.xy=[280 360  0 90];
lat1=-90; lat2=90; lon1=0;   lon2=360; p.xy=[0   360 -90 90];
p.xy=[lon1 lon2 lat1 lat2];
p.ys=min(find(s.lat(:)>=lat1)); p.ye=max(find(s.lat(:)<=lat2));
p.xs=min(find(s.lon(:)>=lon1)); p.xe=max(find(s.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=a; %id=id.*a; 
id=(id==1); aa=aa0(id); aa=aa/mean(aa); p.id=id; p.aa=v.aa; nlon=length(p.lon); %figure; pcolor(id); shading flat; colorbar;

k=3; %500hPa: Z500', U500, V500; 0:CNTL, 1:ModPattern minus CNTL; 2:ObsPattern minus CNTL
v=z.V0.atm.za(3);  a=permute(v.all,[2,1,3,4]); a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a=get_zonala(a); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.atm.za(k);  a=v.all;                    a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a=get_zonala(a); a0=a; s0=squeeze(std(a,1,1));
v=z.w1.atm.za(k);  a=v.all;                    a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a=get_zonala(a); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.atm.za(k);  a=v.all;                    a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a=get_zonala(a); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.Z0=d.a1_avg; p.dZ0=d.avg.a1_avg;
p.z0=d.a2_avg; p.dz0=d.avg.a2_avg; p.z0_bin=[0:50:150];
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.z1=d.diff/dT; p.dz1=d.avg.diff/dT; p.isig1=d.idx; p.isig1_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.z2=d.diff/dT; p.dz2=d.avg.diff/dT; p.isig2=d.idx; p.isig2_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig2m1=d.idx; p.isig2m1_av=d.avg.idx; pp=p;
%% k=3; %500hPa: Z500', U500, V500; 0:CNTL, 1:ModPattern minus CNTL; 2:ObsPattern minus CNTL
%% v=z.V0.atm.za(3);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0);
%% v=z.v0.atm.za(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
%% v=z.w1.atm.za(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
%% v=z.w2.atm.za(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
%% a=A0;            p.Z0=a; p.dZ0=mean(a(id).*aa);
%% a=a0;            p.z0=a; p.dz0=mean(a(id).*aa); p.z0_bin=[0:50:150];
%% a=(a1-a0)/p.dT1; p.z1=a; p.dz1=mean(a(id).*aa); 
%% a=(a2-a0)/p.dT2; p.z2=a; p.dz2=mean(a(id).*aa); 

v=z.V0.atm.ua(3);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0); 
v=z.v0.atm.ua(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0); 
v=z.w1.atm.ua(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1); 
v=z.w2.atm.ua(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2); 
a=A0;            p.U0 =a; p.dU0 =mean(a(id).*aa); 
a=a0;            p.u0 =a; p.du0 =mean(a(id).*aa); p.u0_bin=[10:5:50];
a=(a1-a0)/p.dT1; p.u1 =a; p.du1 =mean(a(id).*aa); 
a=(a2-a0)/p.dT2; p.u2 =a; p.du2 =mean(a(id).*aa); 

v=z.V0.atm.va(3);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0);
v=z.v0.atm.va(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=z.w1.atm.va(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=z.w2.atm.va(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
a=A0;            p.V0 =a; p.dV0 =mean(a(id).*aa);
a=a0;            p.v0 =a; p.dv0 =mean(a(id).*aa); p.v0_bin=[0:5:50];
a=(a1-a0)/p.dT1; p.v1 =a; p.dv1 =mean(a(id).*aa); 
a=(a2-a0)/p.dT2; p.v2 =a; p.dv2 =mean(a(id).*aa); 

k=5; %200hPa: Z200', U200, V200; 3:CNTL, 4:ModPattern minus CNTL; 5:ObsPattern minus CNTL
v=z.V0.atm.za(5);  a=permute(v.all,[2,1,3,4]); a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a=get_zonala(a); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.atm.za(k);  a=v.all;                    a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a=get_zonala(a); a0=a; s0=squeeze(std(a,1,1));
v=z.w1.atm.za(k);  a=v.all;                    a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a=get_zonala(a); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.atm.za(k);  a=v.all;                    a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a=get_zonala(a); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.Z3=d.a1_avg; p.dZ3=d.avg.a1_avg;
p.z3=d.a2_avg; p.dz3=d.avg.a2_avg; p.z3_bin=[0:50:150];
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.z4=d.diff/dT; p.dz4=d.avg.diff/dT; p.isig4=d.idx; p.isig4_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.z5=d.diff/dT; p.dz5=d.avg.diff/dT; p.isig5=d.idx; p.isig5_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig5m4=d.idx; p.isig5m4_av=d.avg.idx;pp=p;
%% v=z.V0.atm.za(5);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0);
%% v=z.v0.atm.za(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
%% v=z.w1.atm.za(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
%% v=z.w2.atm.za(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
%% a=A0;            p.Z3 =a; p.dZ3 =mean(a(id).*aa); 
%% a=a0;            p.z3 =a; p.dz3 =mean(a(id).*aa); p.z3_bin=[0:50:150];
%% a=(a1-a0)/p.dT1; p.z4 =a; p.dz4 =mean(a(id).*aa); 
%% a=(a2-a0)/p.dT2; p.z5 =a; p.dz5 =mean(a(id).*aa); 

v=z.V0.atm.ua(5);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0); p.u200_era=squeeze(a(isea,:,:));
v=z.v0.atm.ua(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0); p.u200_mod=squeeze(a(isea,:,:));
v=z.w1.atm.ua(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1); p.u200_spp=squeeze(a(isea,:,:));
v=z.w2.atm.ua(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2); p.u200_obp=squeeze(a(isea,:,:));
a=A0;            p.U3 =a; p.dU3 =mean(a(id).*aa); 
a=a0;            p.u3 =a; p.du3 =mean(a(id).*aa); p.u3_bin=[15:5:50];
a=(a1-a0)/p.dT1; p.u4 =a; p.du4 =mean(a(id).*aa); 
a=(a2-a0)/p.dT2; p.u5 =a; p.du5 =mean(a(id).*aa); 

v=z.V0.atm.va(5);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0);
v=z.v0.atm.va(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=z.w1.atm.va(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=z.w2.atm.va(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
a=A0;            p.V3 =a; p.dV3 =mean(a(id).*aa);
a=a0;            p.v3 =a; p.dv3 =mean(a(id).*aa); p.v3_bin=[0:5:50];
a=(a1-a0)/p.dT1; p.v4 =a; p.dv4 =mean(a(id).*aa); 
a=(a2-a0)/p.dT2; p.v5 =a; p.dv5 =mean(a(id).*aa); 

k=1; %850hPa: Z850', U850, V850; 6:CNTL, 7:ModPattern minus CNTL; 8:ObsPattern minus CNTL
v=z.V0.atm.za(1);  a=permute(v.all,[2,1,3,4]); a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a=get_zonala(a); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.atm.za(k);  a=v.all;                    a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a=get_zonala(a); a0=a; s0=squeeze(std(a,1,1));
v=z.w1.atm.za(k);  a=v.all;                    a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a=get_zonala(a); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.atm.za(k);  a=v.all;                    a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a=get_zonala(a); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.Z6=d.a1_avg; p.dZ6=d.avg.a1_avg;
p.z6=d.a2_avg; p.dz6=d.avg.a2_avg; p.z6_bin=[0:10:150];
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.z7=d.diff/dT; p.dz7=d.avg.diff/dT; p.isig7=d.idx; p.isig7_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.z8=d.diff/dT; p.dz8=d.avg.diff/dT; p.isig8=d.idx; p.isig8_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig8m7=d.idx; p.isig8m7_av=d.avg.idx;pp=p;
%% v=z.V0.atm.za(1);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0);
%% v=z.v0.atm.za(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
%% v=z.w1.atm.za(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
%% v=z.w2.atm.za(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
%% a=A0;            p.Z6=a; p.dZ6=mean(a(id).*aa); 
%% a=a0;            p.z6=a; p.dz6=mean(a(id).*aa); p.z6_bin=[0:10:150];
%% a=(a1-a0)/p.dT1; p.z7=a; p.dz7=mean(a(id).*aa); 
%% a=(a2-a0)/p.dT2; p.z8=a; p.dz8=mean(a(id).*aa); 

v=z.V0.atm.ua(k);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0);
v=z.v0.atm.ua(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=z.w1.atm.ua(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=z.w2.atm.ua(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
a=A0;            p.U6=a; p.dU6=mean(a(id).*aa); 
a=a0;            p.u6=a; p.du6=mean(a(id).*aa); p.u6_bin=[5:5:30];
a=(a1-a0)/p.dT1; p.u7=a; p.du7=mean(a(id).*aa); 
a=(a2-a0)/p.dT2; p.u8=a; p.du8=mean(a(id).*aa); 

v=z.V0.atm.va(k);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0);
v=z.v0.atm.va(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=z.w1.atm.va(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=z.w2.atm.va(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
a=A0;            p.V6=a; p.dV6=mean(a(id).*aa);
a=a0;            p.v6=a; p.dv6=mean(a(id).*aa); p.v6_bin=[0:5:20];
a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);

%%IVTDIV, IVTX, IVTY; 9:CNTL, 10:ModPattern minus CNTL; 11:ObsPattern minus CNTL
%% %v=z.V0.sfc.pcp.sea;  a=v; A0=squeeze(a(isea,:,:)); 
%% %v=z.v0.sfc.pcp.sea;  a=v; a0=squeeze(a(isea,:,:)); 
%% %v=z.w1.sfc.pcp.sea;  a=v; a1=squeeze(a(isea,:,:)); 
%% %v=z.w2.sfc.pcp.sea;  a=v; a2=squeeze(a(isea,:,:)); 
%% %v=z.V0.sfc.evap.sea/LV0*86400;  a=v; A0=squeeze(a(isea,:,:)); 
%% %v=z.v0.sfc.evap.sea/LV0*86400;  a=v; a0=squeeze(a(isea,:,:)); 
%% %v=z.w1.sfc.evap.sea/LV0*86400;  a=v; a1=squeeze(a(isea,:,:)); 
%% %v=z.w2.sfc.evap.sea/LV0*86400;  a=v; a2=squeeze(a(isea,:,:)); 
%% %v=z.V0.sfc.pcp.sea-z.V0.sfc.evap.sea/LV0*86400;  a=v; A0=squeeze(a(isea,:,:)); 
%% %v=z.v0.sfc.pcp.sea-z.v0.sfc.evap.sea/LV0*86400;  a=v; a0=squeeze(a(isea,:,:)); 
%% %v=z.w1.sfc.pcp.sea-z.w1.sfc.evap.sea/LV0*86400;  a=v; a1=squeeze(a(isea,:,:)); 
%% %v=z.w2.sfc.pcp.sea-z.w2.sfc.evap.sea/LV0*86400;  a=v; a2=squeeze(a(isea,:,:));
b=-86400.;
v=z.V0.atm.ivtdiv; a=v.all; a=get4season_all(a); a=squeeze(a(:,isea,:,:))*b; A0=a; S0=squeeze(std(a,1,1));
v=z.v0.atm.ivtdiv; a=v.all; a=get4season_all(a); a=squeeze(a(:,isea,:,:))*b; a0=a; s0=squeeze(std(a,1,1));
v=z.w1.atm.ivtdiv; a=v.all; a=get4season_all(a); a=squeeze(a(:,isea,:,:))*b; a1=a; s1=squeeze(std(a,1,1));
v=z.w2.atm.ivtdiv; a=v.all; a=get4season_all(a); a=squeeze(a(:,isea,:,:))*b; a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.Z9=d.a1_avg; p.dZ9=d.avg.a1_avg;
p.z9=d.a2_avg; p.dz9=d.avg.a2_avg; p.z9_bin=[980:5:1020];
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.z10=d.diff/dT; p.dz10=d.avg.diff/dT; p.isig10=d.idx; p.isig10_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.z11=d.diff/dT; p.dz11=d.avg.diff/dT; p.isig11=d.idx; p.isig11_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig11m10=d.idx; p.isig11m10_av=d.avg.idx; pp=p;
%% v=z.V0.atm.ivtdiv;  a=v.sea; A0=-squeeze(a(isea,:,:))*86400; 
%% v=z.v0.atm.ivtdiv;  a=v.sea; a0=-squeeze(a(isea,:,:))*86400; 
%% v=z.w1.atm.ivtdiv;  a=v.sea; a1=-squeeze(a(isea,:,:))*86400; 
%% v=z.w2.atm.ivtdiv;  a=v.sea; a2=-squeeze(a(isea,:,:))*86400; 
%% a=A0;            p.Z9 =a; p.dZ9 =mean(a(id).*aa); 
%% a=a0;            p.z9 =a; p.dz9 =mean(a(id).*aa); p.z9_bin=[980:5:1020];
%% a=(a1-a0)/p.dT1; p.z10=a; p.dz10=mean(a(id).*aa); 
%% a=(a2-a0)/p.dT2; p.z11=a; p.dz11=mean(a(id).*aa); 

scale=1;
v=z.V0.atm.ivtx;  a=v.sea; A0=squeeze(a(isea,:,:))*scale; %a0=get_zonala(a0);
v=z.v0.atm.ivtx;  a=v.sea; a0=squeeze(a(isea,:,:))*scale; %a0=get_zonala(a0);
v=z.w1.atm.ivtx;  a=v.sea; a1=squeeze(a(isea,:,:))*scale; %a1=get_zonala(a1);
v=z.w2.atm.ivtx;  a=v.sea; a2=squeeze(a(isea,:,:))*scale; %a2=get_zonala(a2);
a=A0;            p.U9  =a; p.dU9  =mean(a(id).*aa);
a=a0;            p.u9  =a; p.du9  =mean(a(id).*aa); p.u9_bin=[5:5:30];
a=(a1-a0)/p.dT1; p.u10 =a; p.du10 =mean(a(id).*aa); 
a=(a2-a0)/p.dT2; p.u11 =a; p.du11 =mean(a(id).*aa); 

v=z.V0.atm.ivty;  a=v.sea; A0=squeeze(a(isea,:,:))*scale; %a0=get_zonala(a0);
v=z.v0.atm.ivty;  a=v.sea; a0=squeeze(a(isea,:,:))*scale; %a0=get_zonala(a0);
v=z.w1.atm.ivty;  a=v.sea; a1=squeeze(a(isea,:,:))*scale; %a1=get_zonala(a1);
v=z.w2.atm.ivty;  a=v.sea; a2=squeeze(a(isea,:,:))*scale; %a2=get_zonala(a2);
a=A0;            p.V9  =a; p.dV9  =mean(a(id).*aa);
a=a0;            p.v9  =a; p.dv9  =mean(a(id).*aa); p.v9_bin=[0:5:10];
a=(a1-a0)/p.dT1; p.v10 =a; p.dv10 =mean(a(id).*aa); 
a=(a2-a0)/p.dT2; p.v11 =a; p.dv11 =mean(a(id).*aa); 
p.cfact=2; p.phi_bin=[0:50:300]; p.phi_co='r';

p.fmt='eps'; p.xy=[100 360 -10 90];  plot_pattern_effect_Fig_atm_20panel_transposed_new(p)
%p.fmt='eps'; p.vname=strcat(p.vname,'_glb');p.xy=[0 360 -10 90];  plot_pattern_effect_Fig_atm_20panel_transposed_new(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigRS01: SST warming patterns%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=z.v0;  v.dis='OBS CLIMO SST'; v.T=mean(v.sfc.tref.ann_stat.mmen.all);  z.v0 =v;    a=v.T;
v=z.w1;  v.dis='SPM';           v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; v.dT=1.22; z.w1 =v;
v=z.w2;  v.dis='OP';            v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; v.dT=1.24; z.w2 =v;
v=z.w1A; v.dis='SPM-EPbest';    v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; z.w1A=v;
v=z.w1B; v.dis='SPM-EPbest2';   v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; z.w1B=v;
v=z.w1C; v.dis='SPM-EPworst2';  v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; z.w1C=v;
v=z.w1D; v.dis='SPM-EPworst';   v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; z.w1D=v;
v=z.w1a; v.dis='SPM-Pobs10';    v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; z.w1a=v;
v=z.w1b; v.dis='SPM-Pobs20';    v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; z.w1b=v;
v=z.w1c; v.dis='SPM-Pobs30';    v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; z.w1c=v;
v=z.w1d; v.dis='SPM-Tobs30';    v.T=mean(v.sfc.tref.ann_stat.mmen.all);  v.dT=v.T-a; z.w1d=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=z.v0; lm=v.s.lm; im=v.sfc.ice.tavg0; 
lm_th=0.1; im_th=0.1; id_lm=(lm>lm_th); id_im=(im>im_th); id = id_lm | id_im; id=~id; %id(:,:)=1;
aa=v.s.aa; aa=aa(id); aa=aa/mean(aa);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nsea={'ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'}; isea=1; %1-7=ANN,MAM,JJA,SON,DJF,NDJFM,MJJA
v=z.v0;  a=v.sfc.tsurf.sea; a0=squeeze(a(isea,:,:)); i=1;
v=z.w1;  a=v.sfc.tsurf.sea; a =squeeze(a(isea,:,:)); a=(a-a0); p.dv(i)=mean(a(id).*aa); p.v(:,:,i)=a; p.s{i}=v.dis; i=i+1;
v=z.w2;  a=v.sfc.tsurf.sea; a =squeeze(a(isea,:,:)); a=(a-a0); p.dv(i)=mean(a(id).*aa); p.v(:,:,i)=a; p.s{i}=v.dis; i=i+1;
v=z.w1A; a=v.sfc.tsurf.sea; a =squeeze(a(isea,:,:)); a=(a-a0); p.dv(i)=mean(a(id).*aa); p.v(:,:,i)=a; p.s{i}=v.dis; i=i+1;
v=z.w1B; a=v.sfc.tsurf.sea; a =squeeze(a(isea,:,:)); a=(a-a0); p.dv(i)=mean(a(id).*aa); p.v(:,:,i)=a; p.s{i}=v.dis; i=i+1;
v=z.w1C; a=v.sfc.tsurf.sea; a =squeeze(a(isea,:,:)); a=(a-a0); p.dv(i)=mean(a(id).*aa); p.v(:,:,i)=a; p.s{i}=v.dis; i=i+1;
v=z.w1D; a=v.sfc.tsurf.sea; a =squeeze(a(isea,:,:)); a=(a-a0); p.dv(i)=mean(a(id).*aa); p.v(:,:,i)=a; p.s{i}=v.dis; i=i+1;
v=z.w1a; a=v.sfc.tsurf.sea; a =squeeze(a(isea,:,:)); a=(a-a0); p.dv(i)=mean(a(id).*aa); p.v(:,:,i)=a; p.s{i}=v.dis; i=i+1;
v=z.w1b; a=v.sfc.tsurf.sea; a =squeeze(a(isea,:,:)); a=(a-a0); p.dv(i)=mean(a(id).*aa); p.v(:,:,i)=a; p.s{i}=v.dis; i=i+1;
v=z.w1c; a=v.sfc.tsurf.sea; a =squeeze(a(isea,:,:)); a=(a-a0); p.dv(i)=mean(a(id).*aa); p.v(:,:,i)=a; p.s{i}=v.dis; i=i+1;
v=z.w1d; a=v.sfc.tsurf.sea; a =squeeze(a(isea,:,:)); a=(a-a0); p.dv(i)=mean(a(id).*aa); p.v(:,:,i)=a; p.s{i}=v.dis; i=i+1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
v=z.v0.s;
p.lon=v.lon; p.lat=v.lat; p.lm=v.lm; p.aa=v.aa; p.xy=[0 360 -90 90]; p.id=id; 
p.xsize=1200; p.ysize=750; 
pms=[ 0, 0, p.xsize, p.ysize]*1.2; fsize=10; 
handle=figure('Position',pms,'visible','on'); 
row=3; col=4; cmap=bluewhitered_miz(256); co='k';
p.unit='\rm{KK^{-1}}'; cmin=-2; cmax=2; p.vname='SST_patterns'; 
i=1; a0=p.v(:,:,i)/p.dv(i); mean(a0(id).*aa)
for i = 3:10
  a=p.v(:,:,i)/p.dv(i); p.dv_norm(i)=mean(a(id).*aa);
  a=a-a0;
  subplot(row, col, i+2); colormap(cmap); a(~id)=NaN;
  pcolor(p.lon,p.lat,a); hold on; shading flat; caxis([cmin, cmax]);
  contour(p.lon,p.lat,p.lm,1,co);
  set(gca,'FontSize',fsize); axis([p.xy]);
  s=strcat(p.let(i+1),[p.s{i} ' minus ' 'SPM']);
  title(s,'FontSize',fsize);
end
i=1; a=p.v(:,:,i)/p.dv(i); a1=a; p.dv_norm(i)=mean(a(id).*aa); %mean(a(id).*aa)
subplot(row, col, i); colormap(cmap); a(~id)=NaN; 
pcolor(p.lon,p.lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(p.lon,p.lat,p.lm,1,co);
set(gca,'FontSize',fsize); axis([p.xy]);
s=['(a) SPEAR-Pattern M (' p.s{i}, ')'];
title(s,'FontSize',fsize);
i=2; a=p.v(:,:,i)/p.dv(i); a2=a; p.dv_norm(i)=mean(a(id).*aa); %mean(a(id).*aa)
subplot(row, col, i); colormap(cmap); a(~id)=NaN;
pcolor(p.lon,p.lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(p.lon,p.lat,p.lm,1,co);
set(gca,'FontSize',fsize); axis([p.xy]);
s=['(b) Observed-Pattern (' p.s{i}, ')'];
title(s,'FontSize',fsize);
i=3; a=a2-a1; mean(a(id).*aa)
subplot(row, col, i); colormap(cmap); a(~id)=NaN;
pcolor(p.lon,p.lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(p.lon,p.lat,p.lm,1,co);
set(gca,'FontSize',fsize); axis([p.xy]);
title(['(c) ' p.s{2} ' minus ' 'SPM'],'FontSize',fsize);
%sgtitle('SST warming patterns','FontSize',fsize+2);

cb = colorbar('FontSize',fsize,'Location','southoutside');
set(cb, 'Position', [.165 .04 .7 .02]); caxis([cmin, cmax+0.001]); 
colormap(cmap); 
cb.Label.String = p.unit; pos=get(cb,'Position')
cb.Label.Position = [pos(1)-0.14 pos(2)+1.9]; 
cb.Label.Rotation = 0;
visfig='off'; figpath='./fig_land/'; mod_name='FigRS01'; p.fmt='eps';
printnew(visfig,figpath,mod_name,p.vname,p.fmt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigRS05 surface precipitation evaporation PME and soil moisture%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
A0='ERA5; '; a0='Control; '; a1='SPEAR-pattern M; '; a2='Observed-pattern; '; a3='Uniform';
nsea={'ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'}; isea=3; %1-7=ANN,MAM,JJA,SON,DJF,NDJFM,MJJA
p.vname='atm_pcp_evap_pme_mrsos'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
p.vname='FigRS05'; 
del=' $\Delta$'; s0='PREC'; s1='EVAP'; s2='PME'; s3='MRSOS'; p.flipcmap=0; p.do_bias=0;
p.S0=strcat(A0,'~(',p.sea,')~',s0);
p.s0=strcat(a0,'~(',p.sea,')~',s0);
p.s1 =strcat(a1,'~',del,s0);
p.s2 =strcat(a2,'~',del,s0); 
%p.s0=strcat(a0,'~(',nsea{isea},');',s0);
%p.s1=strcat(a1,'~(',nsea{isea},');',del,s0);
%p.s2=strcat(a2,'~(',nsea{isea},');',del,s0);
p.S3=strcat(A0,'~(',p.sea,')~',s1); p.s3=strcat(a0,'~(',p.sea,')~',s1); p.s4 =strcat(a1,del,s1); p.s5 =strcat(a2,del,s1); 
p.S6=strcat(A0,'~(',p.sea,')~',s2); p.s6=strcat(a0,'~(',p.sea,')~',s2); p.s7 =strcat(a1,del,s2); p.s8 =strcat(a2,del,s2); 
p.S9=strcat(A0,'~(',p.sea,')~',s3); p.s9=strcat(a0,'~(',p.sea,')~',s3); p.s10=strcat(a1,del,s3); p.s11=strcat(a2,del,s3); 
p.unit0 ='$\rm{mm day^{-1}}$';          p.unit0_bar ='mm day^{-1}';
p.unit1 ='$\rm{mm day^{-1} K^{-1}}$';   p.unit1_bar ='mm day^{-1} K^{-1}';
p.unit3 ='$\rm{mm day^{-1}}$';          p.unit3_bar ='mm day^{-1}';
p.unit4 ='$\rm{mm day^{-1} K^{-1}}$';   p.unit4_bar ='mm day^{-1} K^{-1}';
p.unit6 ='$\rm{mm day^{-1}}$';          p.unit6_bar ='mm day^{-1}';
p.unit7 ='$\rm{mm day^{-1} K^{-1}}$';   p.unit7_bar ='mm day^{-1} K^{-1}';
p.unit9 ='$\rm{kg m^{-2}}$';            p.unit9_bar ='kg m^{-2}';
p.unit10='$\rm{kg m^{-2} K^{-1}}$';     p.unit10_bar='kg m^{-2} K^{-1}';

p.cmin0=    0.0; p.cmax0=15;  p.cmin1 =-2;  p.cmax1 =2;
p.cmin3=    0.0; p.cmax3=10;  p.cmin4 =-2;  p.cmax4 =2;
p.cmin6=   -15.; p.cmax6=15;  p.cmin7 =-2;  p.cmax7 =2;
p.cmin9=     0.; p.cmax9=50;  p.cmin10=-5;  p.cmax10=5;
p.do_add=0; p.show='off'; p.z1_co='c'; p.co='k'; p.xy=[280 360 0 90];
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa;
a0=z.v0.sfc.tref.tavg0;
a =z.w1.sfc.tref.tavg0-a0;  p.dT1=mean(mean(a.*aa)); p.tas1=a;
a =z.w2.sfc.tref.tavg0-a0;  p.dT2=mean(mean(a.*aa)); p.tas2=a;
imk=z.v0.sfc.ice.tavg0;  aa0=aa; 

v=z.v0.s; p.lm=v.lm; aa0=v.aa; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<0.5)=0; id(id>=0.5)=1; p.id_lm=(id==1);
lat1= 15; lat2=85; lon1=190; lon2=344; p.xy=[280 360  0 90];
lat1=-90; lat2=90; lon1=0;   lon2=360; p.xy=[0   360 -90 90];
p.xy=[lon1 lon2 lat1 lat2];
p.ys=min(find(s.lat(:)>=lat1)); p.ye=max(find(s.lat(:)<=lat2));
p.xs=min(find(s.lon(:)>=lon1)); p.xe=max(find(s.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=a; %id=id.*a; 
id=(id==1); aa=aa0(id); aa=aa/mean(aa); p.aa=aa0; p.id=id; %figure; pcolor(id); shading flat; colorbar;
nb=100; no=42; num=1; mskopt=0; sopt=2; slev=95; b=86400;
%colume 1: precipitation
a=z.V0.sfc.pcp_ec.all; a=get4season_all(a)*b; a=squeeze(a(:,isea,:,:)); A0=a; S0=squeeze(std(a,1,1));
a=z.v0.sfc.pcp.all;    a=get4season_all(a);   a=squeeze(a(:,isea,:,:)); a0=a; s0=squeeze(std(a,1,1));
a=z.w1.sfc.pcp.all;    a=get4season_all(a);   a=squeeze(a(:,isea,:,:)); a1=a; s1=squeeze(std(a,1,1));
a=z.w2.sfc.pcp.all;    a=get4season_all(a);   a=squeeze(a(:,isea,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.Z0=d.a1_avg; p.dZ0=d.avg.a1_avg;
p.z0=d.a2_avg; p.dz0=d.avg.a2_avg; p.isig0=d.idx; p.isig0_av=d.avg.idx; p.z0_bin=[0:50:150];
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.z1=d.diff/dT; p.dz1=d.avg.diff/dT; p.isig1=d.idx; p.isig1_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.z2=d.diff/dT; p.dz2=d.avg.diff/dT; p.isig2=d.idx; p.isig2_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig2m1=d.idx; p.isig2m1_av=d.avg.idx; pp=p;

%colume 2: evaporation
b=86400; 
a=z.V0.sfc.evap.all/LV0*b; a=get4season_all(a); a=squeeze(a(:,isea,:,:)); A0=a; S0=squeeze(std(a,1,1));
a=z.v0.sfc.evap.all/LV0*b; a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a0=a; s0=squeeze(std(a,1,1));
a=z.w1.sfc.evap.all/LV0*b; a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a1=a; s1=squeeze(std(a,1,1));
a=z.w2.sfc.evap.all/LV0*b; a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.Z3=d.a1_avg; p.dZ3=d.avg.a1_avg;
p.z3=d.a2_avg; p.dz3=d.avg.a2_avg; p.isig3=d.idx; p.isig3_av=d.avg.idx; p.z3_bin=[0:50:150];
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.z4=d.diff/dT; p.dz4=d.avg.diff/dT; p.isig4=d.idx; p.isig4_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.z5=d.diff/dT; p.dz5=d.avg.diff/dT; p.isig5=d.idx; p.isig5_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig5m4=d.idx; p.isig5m4_av=d.avg.idx;pp=p;

%column 3: PME (P minus E)
b=86400;
v=z.V0.sfc; a=(v.pcp_ec.all-v.evap.all/LV0)*b; a=get4season_all(a); a=squeeze(a(:,isea,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.sfc; a= v.pcp.all-v.evap.all/LV0*b;     a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a0=a; s0=squeeze(std(a,1,1));
v=z.w1.sfc; a= v.pcp.all-v.evap.all/LV0*b;     a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.sfc; a= v.pcp.all-v.evap.all/LV0*b;     a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.Z6=d.a1_avg; p.dZ6=d.avg.a1_avg;
p.z6=d.a2_avg; p.dz6=d.avg.a2_avg; p.isig6=d.idx; p.isig6_av=d.avg.idx; p.z6_bin=[0:10:150];
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.z7=d.diff/dT; p.dz7=d.avg.diff/dT; p.isig7=d.idx; p.isig7_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.z8=d.diff/dT; p.dz8=d.avg.diff/dT; p.isig8=d.idx; p.isig8_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig8m7=d.idx; p.isig8m7_av=d.avg.idx;pp=p;

%column 4: upper level soil moisture; convert ERA5 unit from m3/m3 to kg/m2 to compare with model
a=z.V0.sfc.mrsos.all*0.10*1000; a=get4season_all(a); a=squeeze(a(:,isea,:,:)); A0=a; S0=squeeze(std(a,1,1));
a=z.v0.sfc.mrsos.all;           a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a0=a; s0=squeeze(std(a,1,1));
a=z.w1.sfc.mrsos.all;           a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a1=a; s1=squeeze(std(a,1,1));
a=z.w2.sfc.mrsos.all;           a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a2=a; s2=squeeze(std(a,1,1));

d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.Z9=d.a1_avg; p.dZ9=d.avg.a1_avg;
p.z9=d.a2_avg; p.dz9=d.avg.a2_avg; p.isig9=d.idx; p.isig9_av=d.avg.idx; p.z9_bin=[980:5:1020];
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.z10=d.diff/dT; p.dz10=d.avg.diff/dT; p.isig10=d.idx; p.isig10_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.z11=d.diff/dT; p.dz11=d.avg.diff/dT; p.isig11=d.idx; p.isig11_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig11m10=d.idx; p.isig11m10_av=d.avg.idx; pp=p;

p.cfact=2; p.phi_bin=[0:50:300]; p.phi_co='r'; a=id; a(:,:)=0; p.isig_null=a;
p.fmt='eps'; p.xy=[100 360 -10 90];  plot_pattern_effect_Fig_atm_20panel_transposed_scalar(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigRS05b surface precipitation evaporation PME and check PME and IVTDIV
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
A0='ERA5; '; a0='Control; '; a1='SPEAR-pattern M; '; a2='Observed-pattern; '; a3='Uniform';
nsea={'ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'}; isea=3; %1-7=ANN,MAM,JJA,SON,DJF,NDJFM,MJJA
p.vname='atm_pcp_evap_pme_mrsos'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
p.vname='FigRS05b';
del=' $\Delta$'; s0='PREC'; s1='EVAP'; s2='PME'; s3='IWTCON'; p.flipcmap=0; p.do_bias=0;
p.S0=strcat(A0,'~(',p.sea,')~',s0);
p.s0=strcat(a0,'~(',p.sea,')~',s0);
p.s1 =strcat(a1,'~',del,s0);
p.s2 =strcat(a2,'~',del,s0); 
%p.s0=strcat(a0,'~(',nsea{isea},');',s0);
%p.s1=strcat(a1,'~(',nsea{isea},');',del,s0);
%p.s2=strcat(a2,'~(',nsea{isea},');',del,s0);
p.S3=strcat(A0,'~(',p.sea,')~',s1); p.s3=strcat(a0,'~(',p.sea,')~',s1); p.s4 =strcat(a1,del,s1); p.s5 =strcat(a2,del,s1); 
p.S6=strcat(A0,'~(',p.sea,')~',s2); p.s6=strcat(a0,'~(',p.sea,')~',s2); p.s7 =strcat(a1,del,s2); p.s8 =strcat(a2,del,s2); 
p.S9=strcat(A0,'~(',p.sea,')~',s3); p.s9=strcat(a0,'~(',p.sea,')~',s3); p.s10=strcat(a1,del,s3); p.s11=strcat(a2,del,s3); 
p.unit0 ='$\rm{mm day^{-1}}$';          p.unit0_bar ='mm day^{-1}';
p.unit1 ='$\rm{mm day^{-1} K^{-1}}$';   p.unit1_bar ='mm day^{-1} K^{-1}';
p.unit3 ='$\rm{mm day^{-1}}$';          p.unit3_bar ='mm day^{-1}';
p.unit4 ='$\rm{mm day^{-1} K^{-1}}$';   p.unit4_bar ='mm day^{-1} K^{-1}';
p.unit6 ='$\rm{mm day^{-1}}$';          p.unit6_bar ='mm day^{-1}';
p.unit7 ='$\rm{mm day^{-1} K^{-1}}$';   p.unit7_bar ='mm day^{-1} K^{-1}';
p.unit9 ='$\rm{kg m^{-2}}$';            p.unit9_bar ='kg m^{-2}';
p.unit10='$\rm{kg m^{-2} K^{-1}}$';     p.unit10_bar='kg m^{-2} K^{-1}';

p.cmin0=    0.0; p.cmax0=15;  p.cmin1 =-2;  p.cmax1 =2;
p.cmin3=    0.0; p.cmax3=10;  p.cmin4 =-2;  p.cmax4 =2;
p.cmin6=   -15.; p.cmax6=15;  p.cmin7 =-2;  p.cmax7 =2;
p.cmin9=   -15.; p.cmax9=15;  p.cmin10=-2;  p.cmax10=2;
p.do_add=0; p.show='off'; p.z1_co='c'; p.co='k'; p.xy=[280 360 0 90];
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa;
a0=z.v0.sfc.tref.tavg0;
a =z.w1.sfc.tref.tavg0-a0;  p.dT1=mean(mean(a.*aa)); p.tas1=a;
a =z.w2.sfc.tref.tavg0-a0;  p.dT2=mean(mean(a.*aa)); p.tas2=a;
imk=z.v0.sfc.ice.tavg0;  aa0=aa; 

v=z.v0.s; p.lm=v.lm; aa0=v.aa; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<0.5)=0; id(id>=0.5)=1; p.id_lm=(id==1);
lat1= 15; lat2=85; lon1=190; lon2=344; p.xy=[280 360  0 90];
lat1=-90; lat2=90; lon1=0;   lon2=360; p.xy=[0   360 -90 90];
p.xy=[lon1 lon2 lat1 lat2];
p.ys=min(find(s.lat(:)>=lat1)); p.ye=max(find(s.lat(:)<=lat2));
p.xs=min(find(s.lon(:)>=lon1)); p.xe=max(find(s.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=a; %id=id.*a; 
id=(id==1); aa=aa0(id); aa=aa/mean(aa); p.aa=aa0; p.id=id; %figure; pcolor(id); shading flat; colorbar;
nb=100; no=42; num=1; mskopt=0; sopt=2; slev=95; b=86400;
%colume 1: precipitation
a=z.V0.sfc.pcp_ec.all; a=get4season_all(a)*b; a=squeeze(a(:,isea,:,:)); A0=a; S0=squeeze(std(a,1,1));
a=z.v0.sfc.pcp.all;    a=get4season_all(a);   a=squeeze(a(:,isea,:,:)); a0=a; s0=squeeze(std(a,1,1));
a=z.w1.sfc.pcp.all;    a=get4season_all(a);   a=squeeze(a(:,isea,:,:)); a1=a; s1=squeeze(std(a,1,1));
a=z.w2.sfc.pcp.all;    a=get4season_all(a);   a=squeeze(a(:,isea,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.Z0=d.a1_avg; p.dZ0=d.avg.a1_avg;
p.z0=d.a2_avg; p.dz0=d.avg.a2_avg; p.isig0=d.idx; p.isig0_av=d.avg.idx; p.z0_bin=[0:50:150];
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.z1=d.diff/dT; p.dz1=d.avg.diff/dT; p.isig1=d.idx; p.isig1_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.z2=d.diff/dT; p.dz2=d.avg.diff/dT; p.isig2=d.idx; p.isig2_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig2m1=d.idx; p.isig2m1_av=d.avg.idx; pp=p;

%colume 2: evaporation
b=86400; 
a=z.V0.sfc.evap.all/LV0*b; a=get4season_all(a); a=squeeze(a(:,isea,:,:)); A0=a; S0=squeeze(std(a,1,1));
a=z.v0.sfc.evap.all/LV0*b; a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a0=a; s0=squeeze(std(a,1,1));
a=z.w1.sfc.evap.all/LV0*b; a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a1=a; s1=squeeze(std(a,1,1));
a=z.w2.sfc.evap.all/LV0*b; a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.Z3=d.a1_avg; p.dZ3=d.avg.a1_avg;
p.z3=d.a2_avg; p.dz3=d.avg.a2_avg; p.isig3=d.idx; p.isig3_av=d.avg.idx; p.z3_bin=[0:50:150];
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.z4=d.diff/dT; p.dz4=d.avg.diff/dT; p.isig4=d.idx; p.isig4_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.z5=d.diff/dT; p.dz5=d.avg.diff/dT; p.isig5=d.idx; p.isig5_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig5m4=d.idx; p.isig5m4_av=d.avg.idx;pp=p;

%column 3: PME (P minus E)
b=86400;
v=z.V0.sfc; a=(v.pcp_ec.all-v.evap.all/LV0)*b; a=get4season_all(a); a=squeeze(a(:,isea,:,:)); A0=a; S0=squeeze(std(a,1,1));
v=z.v0.sfc; a= v.pcp.all-v.evap.all/LV0*b;     a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a0=a; s0=squeeze(std(a,1,1));
v=z.w1.sfc; a= v.pcp.all-v.evap.all/LV0*b;     a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a1=a; s1=squeeze(std(a,1,1));
v=z.w2.sfc; a= v.pcp.all-v.evap.all/LV0*b;     a=get4season_all(a); a=squeeze(a(:,isea,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.Z6=d.a1_avg; p.dZ6=d.avg.a1_avg;
p.z6=d.a2_avg; p.dz6=d.avg.a2_avg; p.isig6=d.idx; p.isig6_av=d.avg.idx; p.z6_bin=[0:10:150];
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.z7=d.diff/dT; p.dz7=d.avg.diff/dT; p.isig7=d.idx; p.isig7_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.z8=d.diff/dT; p.dz8=d.avg.diff/dT; p.isig8=d.idx; p.isig8_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig8m7=d.idx; p.isig8m7_av=d.avg.idx;pp=p;

%column 4: upper level soil moisture; convert ERA5 unit from m3/m3 to kg/m2 to compare with model
b=86400;
a=z.V0.atm.ivtdiv.all; a=-get4season_all(a)*b; a=squeeze(a(:,isea,:,:)); A0=a; S0=squeeze(std(a,1,1));
a=z.v0.atm.ivtdiv.all; a=-get4season_all(a)*b; a=squeeze(a(:,isea,:,:)); a0=a; s0=squeeze(std(a,1,1));
a=z.w1.atm.ivtdiv.all; a=-get4season_all(a)*b; a=squeeze(a(:,isea,:,:)); a1=a; s1=squeeze(std(a,1,1));
a=z.w2.atm.ivtdiv.all; a=-get4season_all(a)*b; a=squeeze(a(:,isea,:,:)); a2=a; s2=squeeze(std(a,1,1));
d=compute_diff_sigtest(A0,S0,no,a0,s0,nb,num,p.id,p.aa,mskopt,sopt,slev);
p.Z9=d.a1_avg; p.dZ9=d.avg.a1_avg;
p.z9=d.a2_avg; p.dz9=d.avg.a2_avg; p.isig9=d.idx; p.isig9_av=d.avg.idx; p.z9_bin=[980:5:1020];
d=compute_diff_sigtest(a0,s0,nb,a1,s1,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT1; p.z10=d.diff/dT; p.dz10=d.avg.diff/dT; p.isig10=d.idx; p.isig10_av=d.avg.idx;
d=compute_diff_sigtest(a0,s0,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev);
dT=p.dT2; p.z11=d.diff/dT; p.dz11=d.avg.diff/dT; p.isig11=d.idx; p.isig11_av=d.avg.idx;
d=compute_diff_sigtest(a1,s1,nb,a2,s2,nb,num,p.id,p.aa,mskopt,sopt,slev); p.isig11m10=d.idx; p.isig11m10_av=d.avg.idx; pp=p;

p.cfact=2; p.phi_bin=[0:50:300]; p.phi_co='r'; a=id; a(:,:)=0; p.isig_null=a;
p.fmt='eps'; p.xy=[100 360 -10 90];  plot_pattern_effect_Fig_atm_20panel_transposed_scalar(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn='./atmos.static_c96.nc';
varn='lat';       a=ncread(fn,varn,[1],[Inf]);       v.lat=a;
varn='lon';       a=ncread(fn,varn,[1],[Inf]);       v.lon=a;
varn='land_mask'; a=ncread(fn,varn,[1 1],[Inf Inf]); v.lm =permute(a,[2 1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/rws_waf_ray_monthly/'; plev='200hPa';
expn='era5';
fn=strcat(tpath,expn,'/',plev,'/rws_ERA5.nc'); v.era5.rws=read_rws_era5(tpath,expn,fn);
fn=strcat(tpath,expn,'/',plev,'/waf_ERA5.nc'); v.era5.waf=read_waf_era5(tpath,expn,fn);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='ob_pattern';
fn=strcat(tpath,expn,'/',plev,'/rws.nc'); v.op.rws=read_rws_mod(tpath,expn,fn);
fn=strcat(tpath,expn,'/',plev,'/waf.nc'); v.op.waf=read_waf_mod(tpath,expn,fn);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='sp_pattern';
fn=strcat(tpath,expn,'/',plev,'/rws.nc'); v.sp.rws=read_rws_mod(tpath,expn,fn);
fn=strcat(tpath,expn,'/',plev,'/waf.nc'); v.sp.waf=read_waf_mod(tpath,expn,fn);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigRSxxx RWS and WAF analysis figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
p.xsize=1200; p.ysize=600; isea=3; pbin=[5 10]; dpbin1=[1 2]; dpbin2=[-1 -0.5]; co=[0 0 0]; co1=[0.5 0.5 0.5];
pms=[ 0, 0, p.xsize, p.ysize]*1.5; fsize=10; row=4; col=2; 
p.xy=[100 310  10 70]; p.xy=[120 300  15 65]; p.xy=[100 300 -10 65];
p.xy=[100 360 -10 90]; p.xy=[100 360 -10 65];
handle=figure('Position',pms,'visible','on');
del=' $\Delta$'; s0='RWS'; s1='Vd (JJA)'; s2='Z200'''; s3='WAF (JJA)';
a='ERA5;~';             p.s(1)=strcat(a,s0," and ",s1);         p.s(2)=strcat(a,s2," and ",s3);
a='Control;~';          p.s(3)=strcat(a,s0," and ",s1);         p.s(4)=strcat(a,s2," and ",s3);
a='SPEAR-pattern M;~';  p.s(5)=strcat(a,del,s0," and ",del,s1); p.s(6)=strcat(a,del,s2," and ",del,s3);
a='Observed-pattern;~'; p.s(7)=strcat(a,del,s0," and ",del,s1); p.s(8)=strcat(a,del,s2," and ",del,s3);
x0=102.5; y0=53; ref0=10; dref0=1; vunit0='m/s';     color=[0.2 0.2 0.2]; %reference vector for uchi
x1=102.5; y1=53; ref1=10; dref1=1; vunit1='m^2/s^2'; color=[0.2 0.2 0.2]; %reference vector for waf
x=v.lon; y=v.lat; lm=v.lm; n=5; scale=1; scale_a=10; color_a=[0.90 0.85 0.00]; cmin=-200; cmax=200; i=1;
%ERA5
subplot(row,col,i); a=v.era5.rws; rws=a.rws_JJA; uchi=a.uchi_JJA; vchi=a.vchi_JJA;
pcolor(x,y,rws); shading flat; cb=colorbar; cb.Label.String=vunit0; cb.Title.FontSize = fsize; caxis([-4E-10 4E-10]); hold on;
quiver(x(1:n:end),y(1:n:end),uchi(1:n:end,1:n:end)*scale,vchi(1:n:end,1:n:end)*scale,0,'Color',color);
text(x0-1,y0+6,strcat(num2str(ref0),vunit0),'FontSize',fsize,'Color',color,'BackgroundColor','w')
quiver(x0,y0,ref0*scale,0,0,'Color',color,'LineWidth',3,'MaxHeadSize',2); hold on;
a=squeeze(z.V0.sfc.pcp.sea(isea,:,:)); contour(x,y,a,pbin,'Color',co,'LineStyle','-');
contour(x,y,lm,[0.5 0.5],'Color',co1,'LineWidth',1); axis(p.xy); nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);
s=let(i)+p.s(i); title(s,'FontSize',fsize,'Interpreter','latex'); i=i+1;
subplot(row,col,i); a=v.era5.waf; wafx=a.waf_x_JJA; wafy=a.waf_y_JJA; zp=a.zprime_JJA; 
pcolor(x,y,zp); shading flat; caxis([cmin cmax]); cb=colorbar; cb.Label.String=vunit1; cb.Title.FontSize = fsize; hold on;
quiver(x(1:n:end),y(1:n:end),wafx(1:n:end,1:n:end)*scale,wafy(1:n:end,1:n:end)*scale,0,'Color',color);
text(x1-1,y1+6,strcat(num2str(ref1),vunit1),'FontSize',fsize,'Color',color,'BackgroundColor','w')
quiver(x1,y1,ref1*scale,0,0,'Color',color,'LineWidth',3,'MaxHeadSize',2); hold on;
contour(x,y,lm,[0.5 0.5],'Color',co1,'LineWidth',1); axis(p.xy);
s=let(i)+p.s(i); title(s,'FontSize',fsize,'Interpreter','latex'); i=i+1;
%Control
subplot(row,col,i); a=v.op.rws.ctl; rws=a.rws_JJA; uchi=a.uchi_JJA; vchi=a.vchi_JJA;
pcolor(x,y,rws); shading flat; cb=colorbar; cb.Label.String=vunit0; cb.Title.FontSize = fsize; caxis([-4E-10 4E-10]); hold on;
quiver(x(1:n:end),y(1:n:end),uchi(1:n:end,1:n:end)*scale,vchi(1:n:end,1:n:end)*scale,0,'Color',color);
text(x0-1,y0+6,strcat(num2str(ref0),vunit0),'FontSize',fsize,'Color',color,'BackgroundColor','w')
quiver(x0,y0,ref0*scale,0,0,'Color',color,'LineWidth',3,'MaxHeadSize',2); hold on;
a=squeeze(z.v0.sfc.pcp.sea(isea,:,:)); contour(x,y,a,pbin,'Color',co,'LineStyle','-');
contour(x,y,lm,[0.5 0.5],'Color',co1,'LineWidth',1); axis(p.xy);
s=let(i)+p.s(i); title(s,'FontSize',fsize,'Interpreter','latex'); i=i+1;
subplot(row,col,i); a=v.op.waf.ctl; wafx=a.waf_x_JJA; wafy=a.waf_y_JJA; zp=a.zprime_JJA;
pcolor(x,y,zp); shading flat; caxis([cmin cmax]); cb=colorbar; cb.Label.String=vunit1; cb.Title.FontSize = fsize; hold on;
quiver(x(1:n:end),y(1:n:end),wafx(1:n:end,1:n:end)*scale,wafy(1:n:end,1:n:end)*scale,0,'Color',color);
text(x1-1,y1+6,strcat(num2str(ref1),vunit1),'FontSize',fsize,'Color',color,'BackgroundColor','w')
quiver(x1,y1,ref1*scale,0,0,'Color',color,'LineWidth',3,'MaxHeadSize',2); hold on;
contour(x,y,lm,[0.5 0.5],'Color',co1,'LineWidth',1); axis(p.xy);
s=let(i)+p.s(i); title(s,'FontSize',fsize,'Interpreter','latex'); i=i+1;
%SPEAR-pattern
subplot(row,col,i); a=v.sp.rws.dif; rws=a.rws_JJA; uchi=a.uchi_JJA; vchi=a.vchi_JJA;
pcolor(x,y,rws); shading flat; cb=colorbar; cb.Label.String=vunit0; cb.Title.FontSize = fsize; caxis([-4E-10 4E-10]*0.2); hold on;
quiver(x(1:n:end),y(1:n:end),uchi(1:n:end,1:n:end)*scale_a,vchi(1:n:end,1:n:end)*scale_a,0,'Color',color_a);
text(x0-1,y0+6,strcat(num2str(dref0),vunit0),'FontSize',fsize,'Color',color_a,'BackgroundColor','w')
quiver(x0,y0,dref0*scale_a,0,0,'Color',color_a,'LineWidth',3,'MaxHeadSize',2); hold on;
a=squeeze(z.w1.sfc.pcp.sea(isea,:,:)-z.v0.sfc.pcp.sea(isea,:,:));
contour(x,y,a,dpbin1,'Color',co,'LineStyle','-'); contour(x,y,a,dpbin2,'Color',co,'LineStyle','--');
contour(x,y,lm,[0.5 0.5],'Color',co1,'LineWidth',1); axis(p.xy);
s=let(i)+p.s(i); title(s,'FontSize',fsize,'Interpreter','latex'); i=i+1;
subplot(row,col,i); a=v.sp.waf.res; wafx=a.waf_x_JJA; wafy=a.waf_y_JJA; zp=a.zprime_JJA;
pcolor(x,y,zp); shading flat; caxis([cmin cmax]*0.1); cb=colorbar; cb.Label.String=vunit1; cb.Title.FontSize = fsize; hold on;
quiver(x(1:n:end),y(1:n:end),wafx(1:n:end,1:n:end)*scale_a,wafy(1:n:end,1:n:end)*scale_a,0,'Color',color_a);
text(x1-1,y1+6,strcat(num2str(dref1),vunit1),'FontSize',fsize,'Color',color_a,'BackgroundColor','w')
quiver(x1,y1,dref1*scale_a,0,0,'Color',color_a,'LineWidth',3,'MaxHeadSize',2); hold on;
contour(x,y,lm,[0.5 0.5],'Color',co1,'LineWidth',1); axis(p.xy);
s=let(i)+p.s(i); title(s,'FontSize',fsize,'Interpreter','latex'); i=i+1;
%Observed-pattern
subplot(row,col,i); a=v.op.rws.dif; rws=a.rws_JJA; uchi=a.uchi_JJA; vchi=a.vchi_JJA;
pcolor(x,y,rws); shading flat; cb=colorbar; cb.Label.String=vunit0; cb.Title.FontSize = fsize; caxis([-4E-10 4E-10]*0.2); hold on;
quiver(x(1:n:end),y(1:n:end),uchi(1:n:end,1:n:end)*scale_a,vchi(1:n:end,1:n:end)*scale_a,0,'Color',color_a);
text(x0-1,y0+6,strcat(num2str(dref0),vunit0),'FontSize',fsize,'Color',color_a,'BackgroundColor','w')
quiver(x0,y0,dref0*scale_a,0,0,'Color',color_a,'LineWidth',3,'MaxHeadSize',2); hold on;
a=squeeze(z.w2.sfc.pcp.sea(isea,:,:)-z.v0.sfc.pcp.sea(isea,:,:)); 
contour(x,y,a,dpbin1,'Color',co,'LineStyle','-'); contour(x,y,a,dpbin2,'Color',co,'LineStyle','--');
contour(x,y,lm,[0.5 0.5],'Color',co1,'LineWidth',1); axis(p.xy);
s=let(i)+p.s(i); title(s,'FontSize',fsize,'Interpreter','latex'); i=i+1;
subplot(row,col,i); a=v.op.waf.res; wafx=a.waf_x_JJA; wafy=a.waf_y_JJA; zp=a.zprime_JJA;
pcolor(x,y,zp); shading flat; caxis([cmin cmax]*0.1); cb=colorbar; cb.Label.String=vunit1; cb.Title.FontSize = fsize; hold on;
quiver(x(1:n:end),y(1:n:end),wafx(1:n:end,1:n:end)*scale_a,wafy(1:n:end,1:n:end)*scale_a,0,'Color',color_a);
text(x1-1,y1+6,strcat(num2str(dref1),vunit1),'FontSize',fsize,'Color',color_a,'BackgroundColor','w')
quiver(x1,y1,dref1*scale_a,0,0,'Color',color_a,'LineWidth',3,'MaxHeadSize',2); hold on;
contour(x,y,lm,[0.5 0.5],'Color',co1,'LineWidth',1); axis(p.xy);
s=let(i)+p.s(i); title(s,'FontSize',fsize,'Interpreter','latex');

visfig='off'; figpath='~/'; mod_name='FigS06'; vname='rws_waf_jja'; p.fmt='eps';
printnew(visfig,figpath,mod_name,vname,p.fmt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2: HeatWave statistics: HWF and HWI Intensity%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea; ipct=9; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9];
A0='ERA5'; a0='Control'; a1='SPEAR-pattern M;~'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='hwf2_hwf2c_hwi2_hwi2c'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
del=' $\Delta$'; s0='HWF;'; s1='HWFc; '; s2='HWI; '; s3='HWIc; ';
A0=strcat(A0,'~(',p.sea,');~'); a0=strcat(a0,'~(',p.sea,');~');;
p.S0 =strcat(A0,s0); p.s0 =strcat(a0,s0); p.s1 =strcat(a1,del,s0); p.s2 =strcat(a2,del,s0); 
p.S3 =strcat(A0,s1); p.s3 =strcat(a0,s1); p.s4 =strcat(a1,del,s1); p.s5 =strcat(a2,del,s1); 
p.S6 =strcat(A0,s2); p.s6 =strcat(a0,s2); p.s7 =strcat(a1,del,s2); p.s8 =strcat(a2,del,s2); 
p.S9 =strcat(A0,s3); p.s9 =strcat(a0,s3); p.s10=strcat(a1,del,s3); p.s11=strcat(a2,del,s3);
p.unit0 ='$\rm{\%}$';           p.unit0_bar ='\rm{%}';
p.unit1 ='$\rm{\%K^{-1}}$';     p.unit1_bar ='\rm{%K^{-1}}';
p.unit3 ='$\rm{\%}$';           p.unit3_bar ='\rm{%}'; 
p.unit4 ='$\rm{\%K^{-1}}$';     p.unit4_bar ='\rm{%K^{-1}}'; 
p.unit6 ='$\rm{^{\circ}C}$';    p.unit6_bar ='\rm{^{\circ}C}';
p.unit7 ='$\rm{KK^{-1}}$';      p.unit7_bar ='\rm{KK^{-1}}';
p.unit9 ='$\rm{^{\circ}C}$';    p.unit9_bar ='\rm{^{\circ}C}';
p.unit10='$\rm{KK^{-1}}$';      p.unit10_bar='\rm{KK^{-1}}';

p.cmin0= 0.0; p.cmax0=4;  p.cmin1 =-20;  p.cmax1 =20;
p.cmin3= 0.0; p.cmax3=4;  p.cmin4 =-20;  p.cmax4 =20;
p.cmin6= 0.0; p.cmax6=40; p.cmin7 =-2;   p.cmax7 =2;
p.cmin9= 0.0; p.cmax9=40; p.cmin10=-2;   p.cmax10=2;
p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;
p.dT1=1.22; p.dT2=1.24;

v=z.v0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

v=z.v0; 
pct_th=v.pct; spct=sprintf( '%4.2fth',pct_th(ipct));
p.S0=strcat(p.S0);p.S3=strcat(p.S3);p.S6=strcat(p.S6);p.S9=strcat(p.S9);
p.s0=strcat(p.s0);p.s3=strcat(p.s3);p.s6=strcat(p.s6);p.s9=strcat(p.s9);
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%HWday2
v=z.vo.hwday2; A0=squeeze(v.av(m,:,:))*100;
v=z.v0.hwday1; a0=squeeze(v.av(m,:,:))*100; %note hwday1 contain HW days defined using pct=95 threshold
v=z.w1.hwday1; a1=squeeze(v.av(m,:,:))*100;
v=z.w2.hwday1; a2=squeeze(v.av(m,:,:))*100;
a=A0; p.V0=a; p.dV0=mean(a(id).*aa);
a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v0=a; p.dv0=mean(a(id).*aa); p.cmin0= p.cmin1; p.cmax0=p.cmax1; end;
a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);

%HWday2_c
v=z.vo.hwday2; A0=squeeze(v.av(m,:,:))*100;
v=z.v0.hwday2; a0=squeeze(v.av(m,:,:))*100;
v=z.w1.hwday2; a1=squeeze(v.av(m,:,:))*100;
v=z.w2.hwday2; a2=squeeze(v.av(m,:,:))*100;
a=A0; p.V3=a; p.dV3=mean(a(id).*aa);
a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v3=a; p.dv3=mean(a(id).*aa); p.cmin3= p.cmin1; p.cmax3=p.cmax1; end;
a=(a1-a0)/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa);

%HWtmx
v=z.vo.hwtmx2; A0=squeeze(v.av(m,:,:)./z.vo.hwday2.av(m,:,:))+squeeze(hw.era5.th(m,:,:));
v=z.v0.hwtmx1; a0=squeeze(v.av(m,:,:)./z.v0.hwday1.av(m,:,:))+squeeze(hw.cntl.th(m,:,:));
v=z.w1.hwtmx1; a1=squeeze(v.av(m,:,:)./z.w1.hwday1.av(m,:,:))+squeeze(hw.cntl.th(m,:,:));
v=z.w2.hwtmx1; a2=squeeze(v.av(m,:,:)./z.w2.hwday1.av(m,:,:))+squeeze(hw.cntl.th(m,:,:));
a=A0; p.V6=a; p.dV6=mean(a(id).*aa);
a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v6=a; p.dv6=mean(a(id).*aa); p.cmin6= p.cmin7; p.cmax6=p.cmax7; end;
a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);

%HWtmx_c
v=z.vo.hwtmx2; A0=squeeze(v.av(m,:,:)./z.vo.hwday2.av(m,:,:))+squeeze(hw.era5.th(m,:,:));
v=z.v0.hwtmx2; a0=squeeze(v.av(m,:,:)./z.v0.hwday2.av(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w1.hwtmx2; a1=squeeze(v.av(m,:,:)./z.w1.hwday2.av(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w2.hwtmx2; a2=squeeze(v.av(m,:,:)./z.w2.hwday2.av(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
a=A0; p.V9=a; p.dV9=mean(a(id).*aa);
a=a0; p.v9=a; p.dv9=mean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v9=a; p.dv9=mean(a(id).*aa); p.cmin9= p.cmin10; p.cmax9=p.cmax10; end;
a=(a1-a0)/p.dT1; p.v10=a; p.dv10=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v11=a; p.dv11=mean(a(id).*aa);

a=id; a(:,:)=0;
p.isig1=a; p.isig2=a; p.isig4 =a; p.isig5 =a; 
p.isig7=a; p.isig8=a; p.isig10=a; p.isig11=a;

p.fmt='eps'; plot_pattern_effect_Fig_extremes_20panel_Transposed(p)
%plot_pattern_effect_Fig_extremes(p)

%FigS2: changes in percentiles for FWI, BUI, ISI, and DSR%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea; ipct=9; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9];
A0='ERA5'; a0='Control'; a1='SPEAR-pattern M;~'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
%a0='Present-day'; a1='SPEAR-pattern M'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='fwi_bui_isi_dsr'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
del=' $\Delta$'; s0='FWI;'; s1='BUI; '; s2='ISI; '; s3='DSR; ';
A0=strcat(A0,'~(',p.sea,');~'); a0=strcat(a0,'~(',p.sea,');~');;
p.S0 =strcat(A0,s0); p.s0 =strcat(a0,s0); p.s1 =strcat(a1,del,s0); p.s2 =strcat(a2,del,s0); 
p.S3 =strcat(A0,s1); p.s3 =strcat(a0,s1); p.s4 =strcat(a1,del,s1); p.s5 =strcat(a2,del,s1); 
p.S6 =strcat(A0,s2); p.s6 =strcat(a0,s2); p.s7 =strcat(a1,del,s2); p.s8 =strcat(a2,del,s2); 
p.S9 =strcat(A0,s3); p.s9 =strcat(a0,s3); p.s10=strcat(a1,del,s3); p.s11=strcat(a2,del,s3);
%p.s0 =strcat(a0,'~(',p.sea,');~',s0); p.s1 =strcat(a1,';~',del,s0); p.s2 =strcat(a2,';~',del,s0); 
%p.s3 =strcat(s1); p.s4 =strcat(del,s1); p.s5 =strcat(del,s1); 
%p.s6 =strcat(s2); p.s7 =strcat(del,s2); p.s8 =strcat(del,s2); 
%p.s9 =strcat(s3); p.s10=strcat(del,s3); p.s11=strcat(del,s3);
p.unit0 ='$\rm{}$';          p.unit0_bar ='\rm{}';
p.unit1 ='$\rm{}$';          p.unit1_bar ='\rm{K^{-1}}';
p.unit3 ='$\rm{}$';          p.unit3_bar ='\rm{}'; 
p.unit4 ='$\rm{K^{-1}}$';    p.unit4_bar ='\rm{K^{-1}}'; 
p.unit6 ='$\rm{}$';          p.unit6_bar ='\rm{}';
p.unit7 ='$\rm{K^{-1}}$';    p.unit7_bar ='\rm{K^{-1}}';
p.unit9 ='$\rm{}$';          p.unit9_bar ='\rm{}'; 
p.unit10='$\rm{K^{-1}}$';    p.unit10_bar='\rm{K^{-1}}';

p.cmin0= 0.0; p.cmax0=80;    p.cmin1 =-8;    p.cmax1 =8;
p.cmin3= 0.0; p.cmax3=500;   p.cmin4 =-50;   p.cmax4 =50;
p.cmin6= 0.0; p.cmax6=40;    p.cmin7 =-4;    p.cmax7 =4;
p.cmin9= 0.0; p.cmax9=50;    p.cmin10=-5;    p.cmax10=5;

p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;
p.dT1=1.22; p.dT2=1.24; 

v=z.v0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

v=z.v0; 
pct_th=v.prday.pct_th; spct=sprintf( '%4.2fth',pct_th(ipct));
p.s0=strcat(p.s0,'~',spct); p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%FWI
v=z.vo.fwiday.fwi; A0=squeeze(v.pct(m,ipct,:,:));
v=z.v0.fwiday.fwi; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday.fwi; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday.fwi; a2=squeeze(v.pct(m,ipct,:,:));
a=A0; p.V0=a; p.dV0=mean(a(id).*aa);
a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v0=a; p.dv0=mean(a(id).*aa); p.cmin0= p.cmin1; p.cmax0=p.cmax1; end;
a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);

%BUI
v=z.vo.fwiday.bui; A0=squeeze(v.pct(m,ipct,:,:));
v=z.v0.fwiday.bui; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday.bui; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday.bui; a2=squeeze(v.pct(m,ipct,:,:));
a=A0; p.V3=a; p.dV3=mean(a(id).*aa);
a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
if (p.do_bias);  a=a0-A0; p.v3=a; p.dv3=mean(a(id).*aa); p.cmin3= p.cmin4; p.cmax3=p.cmax4; end;
a=(a1-a0)/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa);

%ISI
v=z.vo.fwiday.isi; A0=squeeze(v.pct(m,ipct,:,:));
v=z.v0.fwiday.isi; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday.isi; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday.isi; a2=squeeze(v.pct(m,ipct,:,:));
a=A0; p.V6=a; p.dV6=mean(a(id).*aa);
a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v6=a; p.dv6=mean(a(id).*aa); p.cmin6= p.cmin7; p.cmax6=p.cmax7; end;
a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);

%DSR
v=z.vo.fwiday.dsr; A0=squeeze(v.pct(m,ipct,:,:));
v=z.v0.fwiday.dsr; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday.dsr; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday.dsr; a2=squeeze(v.pct(m,ipct,:,:));
a=A0; p.V9=a; p.dV9=nanmean(a(id).*aa);
a=a0; p.v9=a; p.dv9=nanmean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v9=a; p.dv9=mean(a(id).*aa); p.cmin9= p.cmin10; p.cmax9=p.cmax10; end;
a=(a1-a0)/p.dT1; p.v10=a; p.dv10=nanmean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v11=a; p.dv11=nanmean(a(id).*aa);

a=id; a(:,:)=0;
p.isig1=a; p.isig2=a; p.isig4 =a; p.isig5 =a; 
p.isig7=a; p.isig8=a; p.isig10=a; p.isig11=a;

p.fmt='eps'; plot_pattern_effect_Fig_extremes_20panel_Transposed(p); %plot_pattern_effect_Fig_extremes(p)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig3: changes in percentiles for bias-corrected FWI, BUI, ISI, and DSR%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea; ipct=9; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9];
A0='ERA5'; a0='Control'; a1='SPEAR-pattern M;~'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
%a0='Present-day'; a1='SPEAR-pattern M'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='fwi_bui_isi_dsr_corrected'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
del=' $\Delta$'; s0='FWIc;'; s1='BUIc; '; s2='ISIc; '; s3='DSRc; ';
A0=strcat(A0,'~(',p.sea,');~'); a0=strcat(a0,'~(',p.sea,');~');;
p.S0 =strcat(A0,s0); p.s0 =strcat(a0,s0); p.s1 =strcat(a1,del,s0); p.s2 =strcat(a2,del,s0); 
p.S3 =strcat(A0,s1); p.s3 =strcat(a0,s1); p.s4 =strcat(a1,del,s1); p.s5 =strcat(a2,del,s1); 
p.S6 =strcat(A0,s2); p.s6 =strcat(a0,s2); p.s7 =strcat(a1,del,s2); p.s8 =strcat(a2,del,s2); 
p.S9 =strcat(A0,s3); p.s9 =strcat(a0,s3); p.s10=strcat(a1,del,s3); p.s11=strcat(a2,del,s3);
%p.s0 =strcat(a0,'~(',p.sea,');~',s0); p.s1 =strcat(a1,';~',del,s0); p.s2 =strcat(a2,';~',del,s0); 
%p.s3 =strcat(s1); p.s4 =strcat(del,s1); p.s5 =strcat(del,s1); 
%p.s6 =strcat(s2); p.s7 =strcat(del,s2); p.s8 =strcat(del,s2); 
%p.s9 =strcat(s3); p.s10=strcat(del,s3); p.s11=strcat(del,s3);
p.unit0 ='$\rm{}$';          p.unit0_bar ='\rm{}';
p.unit1 ='$\rm{K^{-1}}$';    p.unit1_bar ='\rm{K^{-1}}';
p.unit3 ='$\rm{}$';          p.unit3_bar ='\rm{}'; 
p.unit4 ='$\rm{K^{-1}}$';    p.unit4_bar ='\rm{K^{-1}}'; 
p.unit6 ='$\rm{}$';          p.unit6_bar ='\rm{}';
p.unit7 ='$\rm{K^{-1}}$';    p.unit7_bar ='\rm{K^{-1}}';
p.unit9 ='$\rm{}$';          p.unit9_bar ='\rm{}'; 
p.unit10='$\rm{K^{-1}}$';    p.unit10_bar='\rm{K^{-1}}';

p.cmin0= 0.0; p.cmax0=80;    p.cmin1 =-16;   p.cmax1 =16;
p.cmin3= 0.0; p.cmax3=500;   p.cmin4 =-100;  p.cmax4 =100;
p.cmin6= 0.0; p.cmax6=40;    p.cmin7 =-8;    p.cmax7 =8;
p.cmin9= 0.0; p.cmax9=50;    p.cmin10=-10;   p.cmax10=10;

p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;
p.dT1=1.22; p.dT2=1.24; 

v=z.v0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

v=z.v0; 
pct_th=v.prday.pct_th; spct=sprintf( '%4.2fth',pct_th(ipct));
pct_th=v.pct; spct=sprintf( '%4.2fth',pct_th(ipct));
p.S0=strcat(p.S0,'~',spct);p.S3=strcat(p.S3,'~',spct);p.S6=strcat(p.S6,'~',spct);p.S9=strcat(p.S9,'~',spct);
p.s0=strcat(p.s0,'~',spct);p.s3=strcat(p.s3,'~',spct);p.s6=strcat(p.s6,'~',spct);p.s9=strcat(p.s9,'~',spct);
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))
%p.s0=strcat(p.s0,'~',spct); p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%FWI
v=z.vo.fwiday.fwi;   A0=squeeze(v.pct(m,ipct,:,:));
v=z.v0.fwiday_c.fwi; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday_c.fwi; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday_c.fwi; a2=squeeze(v.pct(m,ipct,:,:));
a=A0; p.V0=a; p.dV0=mean(a(id).*aa);
a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v0=a; p.dv0=mean(a(id).*aa); p.cmin0= p.cmin1; p.cmax0=p.cmax1; end;
a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);

%BUI
v=z.vo.fwiday.bui;   A0=squeeze(v.pct(m,ipct,:,:));
v=z.v0.fwiday_c.bui; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday_c.bui; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday_c.bui; a2=squeeze(v.pct(m,ipct,:,:));
a=A0; p.V3=a; p.dV3=mean(a(id).*aa);
a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
if (p.do_bias);  a=a0-A0; p.v3=a; p.dv3=mean(a(id).*aa); p.cmin3= p.cmin4; p.cmax3=p.cmax4; end;
a=(a1-a0)/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa);

%ISI
v=z.vo.fwiday.isi;   A0=squeeze(v.pct(m,ipct,:,:));
v=z.v0.fwiday_c.isi; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday_c.isi; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday_c.isi; a2=squeeze(v.pct(m,ipct,:,:));
a=A0; p.V6=a; p.dV6=mean(a(id).*aa);
a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v6=a; p.dv6=mean(a(id).*aa); p.cmin6= p.cmin7; p.cmax6=p.cmax7; end;
a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);

%DSR
v=z.vo.fwiday.dsr;   A0=squeeze(v.pct(m,ipct,:,:));
v=z.v0.fwiday_c.dsr; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday_c.dsr; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday_c.dsr; a2=squeeze(v.pct(m,ipct,:,:));
a=A0; p.V9=a; p.dV9=nanmean(a(id).*aa);
a=a0; p.v9=a; p.dv9=nanmean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v9=a; p.dv9=mean(a(id).*aa); p.cmin9= p.cmin10; p.cmax9=p.cmax10; end;
a=(a1-a0)/p.dT1; p.v10=a; p.dv10=nanmean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v11=a; p.dv11=nanmean(a(id).*aa);

a=id; a(:,:)=0;
p.isig1=a; p.isig2=a; p.isig4 =a; p.isig5 =a; 
p.isig7=a; p.isig8=a; p.isig10=a; p.isig11=a;

p.fmt='eps'; plot_pattern_effect_Fig_extremes_20panel_Transposed(p); %plot_pattern_effect_Fig_extremes_16panel_Transposed(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%percentile changes in FWI and associated variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=2; 
a0='Present-day'; a1='SPEAR-pattern M'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='fwi_ffmc_dmc_dc'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
del=' $\Delta$'; s0='FWI;'; s1='FFMC; '; s2='DMC; '; s3='DC; ';
p.s0 =strcat(a0,'~(',p.sea,');~',s0); p.s1 =strcat(a1,';~',del,s0); p.s2 =strcat(a2,';~',del,s0); 
p.s3 =strcat(s1); p.s4 =strcat(del,s1); p.s5 =strcat(del,s1); 
p.s6 =strcat(s2); p.s7 =strcat(del,s2); p.s8 =strcat(del,s2); 
p.s9 =strcat(s3); p.s10=strcat(del,s3); p.s11=strcat(del,s3);
p.unit0 ='$\rm{}$';          p.unit0_bar ='\rm{}';
p.unit1 ='$\rm{}$';          p.unit1_bar ='\rm{K^{-1}}';
p.unit3 ='$\rm{}$';          p.unit3_bar ='\rm{}'; 
p.unit4 ='$\rm{K^{-1}}$';    p.unit4_bar ='\rm{K^{-1}}'; 
p.unit6 ='$\rm{}$';          p.unit6_bar ='\rm{}';
p.unit7 ='$\rm{K^{-1}}$';    p.unit7_bar ='\rm{K^{-1}}';
p.unit9 ='$\rm{}$';          p.unit9_bar ='\rm{}'; 
p.unit10='$\rm{K^{-1}}$';    p.unit10_bar='\rm{K^{-1}}';

p.cmin0= 0.0; p.cmax0=80;    p.cmin1 =-8;    p.cmax1   =8;
p.cmin3= 50;  p.cmax3=100;   p.cmin4 =-5;    p.cmax4  =5;
p.cmin6= 0.0; p.cmax6=500;   p.cmin7 =-50;   p.cmax7 =50;
p.cmin9= 0.0; p.cmax9=1000;  p.cmin10=-100;  p.cmax10=100;

p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;
p.dT1=1.22; p.dT2=1.24; 

v=z.v0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

v=z.v0; m=isea; ipct=8; %pct=[1 5 10 25 50 75 90 95 99 99.9 99.99 99.999];
pct_th=v.prday.pct_th; spct=sprintf( '%4.2fth',pct_th(ipct));
p.s0=strcat(p.s0,'~',spct); p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%FWI
v=z.v0.fwiday.fwi; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday.fwi; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday.fwi; a2=squeeze(v.pct(m,ipct,:,:));
a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
if (p.do_bias); p.v0=p.v0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);

%FFMC
v=z.v0.fwiday.ffmc; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday.ffmc; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday.ffmc; a2=squeeze(v.pct(m,ipct,:,:));
a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
if (p.do_bias); p.v3=a0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa);

%DMC
v=z.v0.fwiday.dmc; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday.dmc; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday.dmc; a2=squeeze(v.pct(m,ipct,:,:));
a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
if (p.do_bias); p.v6=a0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);

%DC
v=z.v0.fwiday.dc; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday.dc; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday.dc; a2=squeeze(v.pct(m,ipct,:,:));
a=a0; p.v9=a; p.dv9=nanmean(a(id).*aa);
if (p.do_bias); p.v9=a0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v10=a; p.dv10=nanmean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v11=a; p.dv11=nanmean(a(id).*aa);

a=id; a(:,:)=0;
p.isig1=a; p.isig2=a; p.isig4 =a; p.isig5 =a; 
p.isig7=a; p.isig8=a; p.isig10=a; p.isig11=a;

plot_pattern_effect_Fig_extremes(p)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%changes in surface mean TAS, VPD, Pr, and Runoff %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=4; 
a0='Present-day'; a1='SPEAR-pattern M'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='tas_vpd_pr_runf'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
del=' $\Delta$'; s0='TASDAY;'; s1='VPDDAY; '; s2='PrDay; '; s3='RunfDay; ';
p.s0 =strcat(a0,'~(',p.sea,');~',s0); p.s1 =strcat(a1,';~',del,s0); p.s2 =strcat(a2,';~',del,s0); 
p.s3 =strcat(s1); p.s4 =strcat(del,s1); p.s5 =strcat(del,s1); 
p.s6 =strcat(s2); p.s7 =strcat(del,s2); p.s8 =strcat(del,s2); 
p.s9 =strcat(s3); p.s10=strcat(del,s3); p.s11=strcat(del,s3);
p.unit0 ='$\rm{^{\circ}C}$';    p.unit0_bar ='\rm{^{\circ}C}';
p.unit1 ='$\rm{KK^{-1}}$';      p.unit1_bar ='\rm{KK^{-1}}';
p.unit3 ='$\rm{hPa}$';          p.unit3_bar ='\rm{hPa}'; 
p.unit4 ='$\rm{hPaK^{-1}}$';    p.unit4_bar ='\rm{hPaK^{-1}}'; 
p.unit6 ='$\rm{mm day^{-1}}$';  p.unit6_bar ='\rm{mm day^{-1}}';
p.unit7 ='$\rm{mm day^{-1}K^{-1}}$';  p.unit7_bar ='\rm{mm day^{-1} K^{-1}}';
p.unit9 ='$\rm{mm day^{-1}}$';        p.unit9_bar ='\rm{mm day^{-1}}'; 
p.unit10='$\rm{mm day^{-1}K^{-1}}$';  p.unit10_bar='\rm{mm day^{-1}K^{-1}}';

p.cmin0= 0.0; p.cmax0=30;  p.cmin1 =-3.0;  p.cmax1 =3.0;
p.cmin3= 0.0; p.cmax3=10;  p.cmin4 =-1.0;  p.cmax4 =1.0;
p.cmin6= 0.0; p.cmax6=5;   p.cmin7 =-0.5;  p.cmax7 =0.5;
p.cmin9= 0.0; p.cmax9=5;   p.cmin10=-0.5;  p.cmax10=0.5;
p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;
p.dT1=1.22; p.dT2=1.24; 

v=z.v0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

v=z.v0; m=isea; ipct=6; %pct=[25 50 75 90 95 99 99.9 99.99 99.999];
pct_th=v.prday.pct_th; spct='avg';
p.s0=strcat(p.s0,'~',spct); p.vname=strcat(p.vname,'_avg')

%tasday
v=z.v0.tasday; a0=squeeze(v.av(m,:,:));
v=z.w1.tasday; a1=squeeze(v.av(m,:,:));
v=z.w2.tasday; a2=squeeze(v.av(m,:,:));
a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
if (p.do_bias); p.v0=p.v0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);

%vpdday
v=z.v0.vpdday; a0=squeeze(v.av(m,:,:));
v=z.w1.vpdday; a1=squeeze(v.av(m,:,:));
v=z.w2.vpdday; a2=squeeze(v.av(m,:,:));
a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
if (p.do_bias); p.v3=a0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa);

%prday
v=z.v0.prday; a0=squeeze(v.av(m,:,:));
v=z.w1.prday; a1=squeeze(v.av(m,:,:));
v=z.w2.prday; a2=squeeze(v.av(m,:,:));
a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
if (p.do_bias); p.v6=a0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);

%runfday
v=z.v0.runfday; a0=squeeze(v.av(m,:,:));
v=z.w1.runfday; a1=squeeze(v.av(m,:,:));
v=z.w2.runfday; a2=squeeze(v.av(m,:,:));
a=a0; p.v9=a; p.dv9=nanmean(a(id).*aa);
if (p.do_bias); p.v9=a0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v10=a; p.dv10=nanmean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v11=a; p.dv11=nanmean(a(id).*aa);

a=id;
p.isig1=a; p.isig2=a; p.isig4 =a; p.isig5 =a; 
p.isig7=a; p.isig8=a; p.isig10=a; p.isig11=a;

plot_pattern_effect_Fig_extremes(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%changes in extreme surface TAS, VPD, Pr, and Runoff
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=4; 
a0='Present-day'; a1='SPEAR-pattern M'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='extreme_heat'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
del=' $\Delta$'; s0='TASDAY;'; s1='VPDDAY; '; s2='PrDay; '; s3='RunfDay; ';
p.s0 =strcat(a0,'~(',p.sea,');~',s0); p.s1 =strcat(a1,';~',del,s0); p.s2 =strcat(a2,';~',del,s0); 
p.s3 =strcat(s1); p.s4 =strcat(del,s1); p.s5 =strcat(del,s1); 
p.s6 =strcat(s2); p.s7 =strcat(del,s2); p.s8 =strcat(del,s2); 
p.s9 =strcat(s3); p.s10=strcat(del,s3); p.s11=strcat(del,s3);
p.unit0 ='$\rm{^{\circ}C}$';    p.unit0_bar ='\rm{^{\circ}C}';
p.unit1 ='$\rm{KK^{-1}}$';      p.unit1_bar ='\rm{KK^{-1}}';
p.unit3 ='$\rm{hPa}$';          p.unit3_bar ='\rm{hPa}'; 
p.unit4 ='$\rm{hPaK^{-1}}$';    p.unit4_bar ='\rm{hPaK^{-1}}'; 
p.unit6 ='$\rm{mm day^{-1}}$';  p.unit6_bar ='\rm{mm day^{-1}}';
p.unit7 ='$\rm{mm day^{-1}K^{-1}}$';  p.unit7_bar ='\rm{mm day^{-1} K^{-1}}';
p.unit9 ='$\rm{mm day^{-1}}$';        p.unit9_bar ='\rm{mm day^{-1}}'; 
p.unit10='$\rm{mm day^{-1}K^{-1}}$';  p.unit10_bar='\rm{mm day^{-1}K^{-1}}';

p.cmin0= 0.0; p.cmax0=30;  p.cmin1 =-3.0;  p.cmax1 =3.0;
p.cmin3= 0.0; p.cmax3=30;  p.cmin4 =-3.0;  p.cmax4 =3.0;
p.cmin6= 0.0; p.cmax6=50;  p.cmin7 =-5.0;  p.cmax7 =5.0;
p.cmin9= 0.0; p.cmax9=20;  p.cmin10=-2.0;  p.cmax10=2.0;
p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;
p.dT1=1.22; p.dT2=1.24; 

v=z.v0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

v=z.v0; m=isea; ipct=5; %pct=[25 50 75 90 95 99 99.9 99.99 99.999];
pct_th=v.prday.pct_th; spct=sprintf( '%4.2fth',pct_th(ipct));
p.s0=strcat(p.s0,'~',spct); p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%tasday
v=z.v0.tasday; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.tasday; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.tasday; a2=squeeze(v.pct(m,ipct,:,:));
a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
if (p.do_bias); p.v0=p.v0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);

%vpdday
v=z.v0.vpdday; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.vpdday; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.vpdday; a2=squeeze(v.pct(m,ipct,:,:));
a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
if (p.do_bias); p.v3=a0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa);

%prday
v=z.v0.prday; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.prday; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.prday; a2=squeeze(v.pct(m,ipct,:,:));
a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
if (p.do_bias); p.v6=a0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);

%runfday
v=z.v0.runfday; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.runfday; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.runfday; a2=squeeze(v.pct(m,ipct,:,:));
a=a0; p.v9=a; p.dv9=nanmean(a(id).*aa);
if (p.do_bias); p.v9=a0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v10=a; p.dv10=nanmean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v11=a; p.dv11=nanmean(a(id).*aa);
%pr3hr
%v=z.v0.pr3hr; a0=squeeze(v.pct(m,ipct,:,:));
%v=z.w1.pr3hr; a1=squeeze(v.pct(m,ipct,:,:));
%v=z.w2.pr3hr; a2=squeeze(v.pct(m,ipct,:,:));
%a=a0; p.v9=a; p.dv9=mean(a(id).*aa);
%if (p.do_bias); p.v9=a0; p.cmin0= -5.0; p.cmax0=5; end;
%a=(a1-a0)./a0*100/p.dT1; p.v10=a; p.dv10=mean(a(id).*aa);
%a=(a2-a0)./a0*100/p.dT2; p.v11=a; p.dv11=mean(a(id).*aa);

a=id;
p.isig1=a; p.isig2=a; p.isig4 =a; p.isig5 =a; 
p.isig7=a; p.isig8=a; p.isig10=a; p.isig11=a;

plot_pattern_effect_Fig_extremes(p)

%verifications: R=P-E%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=z.v0.prday;   a0=squeeze(v.av(m,:,:)); 
v=z.v0.evapday; a1=squeeze(v.av(m,:,:))/LV0*86400; 
v=z.v0.runfday; a2=squeeze(v.av(m,:,:));

v=z.v0.prday;   a0=squeeze(mean(v.av,1)); 
v=z.v0.evapday; a1=squeeze(mean(v.av,1))/LV0*86400; 
v=z.v0.runfday; a2=squeeze(mean(v.av,1));
figure; pcolor(a0); shading flat; colorbar; colormap(jet); caxis([0 10]);
figure; pcolor(a1); shading flat; colorbar; colormap(jet); caxis([0 10]);
figure; pcolor(a2); shading flat; colorbar; colormap(jet); caxis([0 10]);
figure; pcolor(a0-a1); shading flat; colorbar; colormap(jet); caxis([0 10]);
figure; pcolor(a0-a1-a0); shading flat; colorbar; colormap(jet); caxis([0 10]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Extreme relative humidity and surface wind%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=1; %1-7=ANN,MAM,JJA,SON,DJF,NDJFM,MJJA
a0='Present-day'; a1='SPEAR-pattern M'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='extreme_wind'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
del=' $\Delta$'; s0='RHDAY;'; s1='RHMAXDAY; '; s2='WINDDAY; '; s3='WINDMAXDAY; ';
p.s0 =strcat(a0,'~(',p.sea,');~',s0); p.s1 =strcat(a1,';~',del,s0); p.s2 =strcat(a2,';~',del,s0); 
p.s3 =strcat(s1); p.s4 =strcat(del,s1); p.s5 =strcat(del,s1); 
p.s6 =strcat(s2); p.s7 =strcat(del,s2); p.s8 =strcat(del,s2); 
p.s9 =strcat(s3); p.s10=strcat(del,s3); p.s11=strcat(del,s3);
p.unit0 ='$\rm{^{\circ}C}$';    p.unit0_bar ='\rm{^{\circ}C}';
p.unit1 ='$\rm{KK^{-1}}$';      p.unit1_bar ='\rm{KK^{-1}}';
p.unit3 ='$\rm{^{\circ}C}$';    p.unit3_bar ='\rm{^{\circ}C}'; 
p.unit4 ='$\rm{KK^{-1}}$';      p.unit4_bar ='\rm{KK^{-1}}'; 
p.unit6 ='$\rm{mm day^{-1}}$';  p.unit6_bar ='\rm{mm day^{-1}}';
p.unit7 ='$\rm{mm day^{-1}K^{-1}}$';  p.unit7_bar ='\rm{mm day^{-1} K^{-1}}';
p.unit9 ='$\rm{mm day^{-1}}$';        p.unit9_bar ='\rm{mm day^{-1}}'; 
p.unit10='$\rm{mm day^{-1}K^{-1}}$';  p.unit10_bar='\rm{mm day^{-1}K^{-1}}';

p.cmin0= 0.0; p.cmax0=100; p.cmin1 =-3.0;  p.cmax1 =3.0;
p.cmin3= 0.0; p.cmax3=100; p.cmin4 =-3.0;  p.cmax4 =3.0;
p.cmin6= 0.0; p.cmax6=10;  p.cmin7 =-2.0;  p.cmax7 =5.0;
p.cmin9= 0.0; p.cmax9=10;  p.cmin10=-2.0;  p.cmax10=2.0;
p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;
p.dT1=1; p.dT2=1;

v=z.v0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<0.5)=0; id(id>=0.5)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

v=z.v0; m=isea; ipct=7; %pct=[25 50 75 90 95 99 99.9 99.99 99.999];
pct_th=v.prday.pct_th; spct=sprintf( '%4.2fth',pct_th(ipct));
p.s0=strcat(p.s0,'~',spct); p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%hursday
v=z.v0.rhday; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.rhday; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.rhday; a2=squeeze(v.pct(m,ipct,:,:));
a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
if (p.do_bias); p.v0=p.v0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);

%hursmaxday
v=z.v0.rhmaxday; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.rhmaxday; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.rhmaxday; a2=squeeze(v.pct(m,ipct,:,:));
a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
if (p.do_bias); p.v3=a0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa);

%sfcWind
v=z.v0.windday; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.windday; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.windday; a2=squeeze(v.pct(m,ipct,:,:));
a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
if (p.do_bias); p.v6=a0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);

%sfcwindmax
v=z.v0.windmaxday; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.windmaxday; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.windmaxday; a2=squeeze(v.pct(m,ipct,:,:));
a=a0; p.v9=a; p.dv9=mean(a(id).*aa);
if (p.do_bias); p.v9=a0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)./a0*100/p.dT1; p.v10=a; p.dv10=mean(a(id).*aa);
a=(a2-a0)./a0*100/p.dT2; p.v11=a; p.dv11=mean(a(id).*aa);

a=id;
p.isig1=a; p.isig2=a; p.isig4 =a; p.isig5 =a; 
p.isig7=a; p.isig8=a; p.isig10=a; p.isig11=a;

plot_pattern_effect_Fig_extremes(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Extreme daily river flow for each season%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=1; p.sea=nsea{isea}; %1-4=DJF,MAM,JJA,SON
pcttile={'25','50','75','90','95','99','99.9','99.99','99.999'};
pct=[25 50 75 90 95 99 99.9 99.99 99.999]; ipct=2; %choice of percentile
pctt=strcat(pcttile{ipct},'th percentile'); 
a0='Present-day'; a1='SPEAR-pattern M'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='extreme_roday'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); 
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

del=' $\Delta$'; s0='DJF;'; s1='MAM; '; s2='JJA; '; s3='SON; ';
p.s0 =strcat(a0,'~(',p.sea,');',pctt); p.s1 =strcat(a1,';~',del,s0); p.s2 =strcat(a2,';~',del,s0); 
p.s3 =strcat(s1); p.s4 =strcat(del,s1); p.s5 =strcat(del,s1); 
p.s6 =strcat(s2); p.s7 =strcat(del,s2); p.s8 =strcat(del,s2); 
p.s9 =strcat(s3); p.s10=strcat(del,s3); p.s11=strcat(del,s3);
a0='\rm{mm day^{-1}}';        a1='$\rm{mm day^{-1}}$';
a2='\rm{mm day^{-1} K^{-1}}'; a3='$\rm{mm day^{-1} K^{-1}}$';
p.unit0 =a1; p.unit0_bar =a0;
p.unit1 =a3; p.unit1_bar =a2;
p.unit3 =a1; p.unit3_bar =a0;
p.unit4 =a3; p.unit4_bar =a2;
p.unit6 =a1; p.unit6_bar =a0;
p.unit7 =a3; p.unit7_bar =a2;
p.unit9 =a1; p.unit9_bar =a0;
p.unit10=a3; p.unit10_bar=a2;

a1=-100; a2=100; a3=-30; a4=30;
p.cmin0=a1; p.cmax0=a2; p.cmin1 =a3;  p.cmax1 =a4;
p.cmin3=a1; p.cmax3=a2; p.cmin4 =a3;  p.cmax4 =a4;
p.cmin6=a1; p.cmax6=a2; p.cmin7 =a3;  p.cmax7 =a4;
p.cmin9=a1; p.cmax9=a2; p.cmin10=a3;  p.cmax10=a4;

p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;
p.dT1=1; p.dT2=1;

v=z.v0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<0.5)=0; id(id>=0.5)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

isea=1; %DJF
v=z.v0.roday; a0=squeeze(v.pct(isea,ipct,:,:));
v=z.w1.roday; a1=squeeze(v.pct(isea,ipct,:,:));
v=z.w2.roday; a2=squeeze(v.pct(isea,ipct,:,:));
a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
if (p.do_bias); p.v0=p.v0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);
isea=2; %MAM
v=z.v0.roday; a0=squeeze(v.pct(isea,ipct,:,:));
v=z.w1.roday; a1=squeeze(v.pct(isea,ipct,:,:));
v=z.w2.roday; a2=squeeze(v.pct(isea,ipct,:,:));
a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
if (p.do_bias); p.v3=p.v0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa);
isea=3; %JJA
v=z.v0.roday; a0=squeeze(v.pct(isea,ipct,:,:));
v=z.w1.roday; a1=squeeze(v.pct(isea,ipct,:,:));
v=z.w2.roday; a2=squeeze(v.pct(isea,ipct,:,:));
a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
if (p.do_bias); p.v6=p.v0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);
isea=4; %SON
v=z.v0.roday; a0=squeeze(v.pct(isea,ipct,:,:));
v=z.w1.roday; a1=squeeze(v.pct(isea,ipct,:,:));
v=z.w2.roday; a2=squeeze(v.pct(isea,ipct,:,:));
a=a0; p.v9=a; p.dv9=mean(a(id).*aa);
if (p.do_bias); p.v9=p.v0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v10=a; p.dv10=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v11=a; p.dv11=mean(a(id).*aa);
a=id;
p.isig1=a; p.isig2=a; p.isig4 =a; p.isig5 =a; 
p.isig7=a; p.isig8=a; p.isig10=a; p.isig11=a;
plot_pattern_effect_Fig_extremes(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Extreme daily fire index for each season%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=1; p.sea=nsea{isea}; %1-4=DJF,MAM,JJA,SON
pcttile={'25','50','75','90','95','99','99.9','99.99','99.999'};
pct=[25 50 75 90 95 99 99.9 99.99 99.999]; ipct=2; %choice of percentile
pctt=strcat(pcttile{ipct},'th percentile'); 
a0='Present-day'; a1='SPEAR-pattern M'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='extreme_fwiday'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); 
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

del=' $\Delta$'; s0='DJF;'; s1='MAM; '; s2='JJA; '; s3='SON; ';
p.s0 =strcat(a0,'~(',p.sea,');',pctt); p.s1 =strcat(a1,';~',del,s0); p.s2 =strcat(a2,';~',del,s0); 
p.s3 =strcat(s1); p.s4 =strcat(del,s1); p.s5 =strcat(del,s1); 
p.s6 =strcat(s2); p.s7 =strcat(del,s2); p.s8 =strcat(del,s2); 
p.s9 =strcat(s3); p.s10=strcat(del,s3); p.s11=strcat(del,s3);
a0='\rm{mm day^{-1}}';        a1='$\rm{mm day^{-1}}$';
a2='\rm{mm day^{-1} K^{-1}}'; a3='$\rm{mm day^{-1} K^{-1}}$';
p.unit0 =a1; p.unit0_bar =a0;
p.unit1 =a3; p.unit1_bar =a2;
p.unit3 =a1; p.unit3_bar =a0;
p.unit4 =a3; p.unit4_bar =a2;
p.unit6 =a1; p.unit6_bar =a0;
p.unit7 =a3; p.unit7_bar =a2;
p.unit9 =a1; p.unit9_bar =a0;
p.unit10=a3; p.unit10_bar=a2;

a1=-2; a2=2; a3=-2; a4=2;
p.cmin0=a1; p.cmax0=a2; p.cmin1 =a3;  p.cmax1 =a4;
p.cmin3=a1; p.cmax3=a2; p.cmin4 =a3;  p.cmax4 =a4;
p.cmin6=a1; p.cmax6=a2; p.cmin7 =a3;  p.cmax7 =a4;
p.cmin9=a1; p.cmax9=a2; p.cmin10=a3;  p.cmax10=a4;

p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;
p.dT1=1; p.dT2=1;

v=z.v0;
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<0.5)=0; id(id>=0.5)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 

isea=1; %DJF
v=z.v0.fwiday; a0=squeeze(v.pct(isea,ipct,:,:));
v=z.w1.fwiday; a1=squeeze(v.pct(isea,ipct,:,:));
v=z.w2.fwiday; a2=squeeze(v.pct(isea,ipct,:,:));
a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
if (p.do_bias); p.v0=p.v0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);
isea=2; %MAM
v=z.v0.fwiday; a0=squeeze(v.pct(isea,ipct,:,:));
v=z.w1.fwiday; a1=squeeze(v.pct(isea,ipct,:,:));
v=z.w2.fwiday; a2=squeeze(v.pct(isea,ipct,:,:));
a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
if (p.do_bias); p.v3=p.v0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa);
isea=3; %JJA
v=z.v0.fwiday; a0=squeeze(v.pct(isea,ipct,:,:));
v=z.w1.fwiday; a1=squeeze(v.pct(isea,ipct,:,:));
v=z.w2.fwiday; a2=squeeze(v.pct(isea,ipct,:,:));
a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
if (p.do_bias); p.v6=p.v0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);
isea=4; %SON
v=z.v0.fwiday; a0=squeeze(v.pct(isea,ipct,:,:));
v=z.w1.fwiday; a1=squeeze(v.pct(isea,ipct,:,:));
v=z.w2.fwiday; a2=squeeze(v.pct(isea,ipct,:,:));
a=a0; p.v9=a; p.dv9=mean(a(id).*aa);
if (p.do_bias); p.v9=p.v0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v10=a; p.dv10=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v11=a; p.dv11=mean(a(id).*aa);
a=id;
p.isig1=a; p.isig2=a; p.isig4 =a; p.isig5 =a; 
p.isig7=a; p.isig8=a; p.isig10=a; p.isig11=a;
plot_pattern_effect_Fig_extremes(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Extreme daily river flow%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON','NDJFM','MJJAS'}; lm=z.v0.lm; co='k';
[lat,lon]=borders('continental us'); us.lat=lat; us.lon=lon; us.co='k-'; lw=0.1;
for k=1:length(lon); us.lon{k}=us.lon{k}+360; end;
pms=[ 0, 0, 1400, 1000]*1; fsize=10; row=4; col=4; minus=char(8212);
handle = figure('Position', pms,'visible','on'); 
nn=256;  cmap=bluewhitered_miz(nn); colormap(cmap); %colormap(jet); 

x=z.v0.lon; y=z.v0.lat; lat1=16; lat2=75; lon1=190; lon2=304; xy=[lon1 lon2 lat1 lat2];
s0='Present-day'; s1='SPEAR-pattern M'; s2='Observed-pattern'; s2='Observed-pattern';
unit0='$\rm{kg m^{-2} day^{-1} K^{-1}}$'; unit1='\%';

nsea={'DJF','MAM','JJA','SON'}; isea=1; %1-4=DJF,MAM,JJA,SON
pcttile={'25','50','75','90','95','99','99.9','99.99','99.999'};
pct=[25 50 75 90 95 99 99.9 99.99 99.999]; ipct=9; %choice of percentile
pctt=strcat(pcttile{ipct},'th percentile');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.cmin0= -100; p.cmax0=100;  p.cmin1 =-100;  p.cmax1=100;
len=0.16; wid=0.02; p.unit0_bar ='\rm{mm day^{-1}}'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=1; 
subplot(row,col,i); sx=let(i)+s0; i=i+1; 
a0=squeeze(z.v0.roday.pct(isea,ipct,:,:)); %figure; pcolor(a0); shading flat; colorbar;
a1=squeeze(z.w1.roday.pct(isea,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =a0;
pcolor(x,y,a); shading flat; colorbar; caxis([p.cmin0, p.cmax0]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{isea}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.08 0.765 wid len]); caxis([p.cmin0, p.cmax0]);
set(get(cb0,'title'),'string',p.unit0_bar,'Rotation',0.0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); sx=let(i)+s1; i=i+1;
a0=squeeze(z.v0.roday.pct(isea,ipct,:,:)); %figure; pcolor(a0); shading flat; colorbar;
a1=squeeze(z.w1.roday.pct(isea,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =(a1-a0)./a0*100;
pcolor(x,y,a); shading flat; caxis([p.cmin1, p.cmax1]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{isea}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); sx=let(i)+s2; i=i+1;
a2=squeeze(z.w2.roday.pct(isea,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =(a2-a0)./a0*100;
pcolor(x,y,a); shading flat; colorbar; caxis([p.cmin1, p.cmax1]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{isea}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=a2-a1; b=b2-b1; a(~p.id)=NaN; sx=let(i)+'(c) minus (b)'; i=i+1; 
pcolor(p.lon,p.lat,a); hold on; shading flat;  caxis([p.cmin1 p.cmax1]);
%if p.do_add; contour(p.lon0,p.lat0,p.v1_add,p.v1_addbin,p.v1_co,'showtext',p.show);end;
contour(p.lon,p.lat,p.lm,1,co); axis(p.xy); %plot(us.lon,us.lat,us.co);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end; 
[xx,yy] = meshgrid(lon,lat);
%stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit1); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.08 0.765 wid len]); caxis([p.cmin0, p.cmax0]);
set(get(cb0,'title'),'string',p.unit0_bar,'Rotation',0.0);
%cb0.Label.String = p.unit0_bar; pos=get(cb0,'Position'); pos
%cb0.Label.Position = [pos(1)-0.3 pos(2)+a]; 
%cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); sx=let(i); i=i+1;  m=2; 
a0=squeeze(z.v0.roday.pct(isea,ipct,:,:)); %figure; pcolor(a0); shading flat; colorbar;
a1=squeeze(z.w1.roday.pct(isea,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =a0;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{isea}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,i); sx=let(i); i=i+1;  
a0=squeeze(z.v0.roday.pct(isea,ipct,:,:)); %figure; pcolor(a0); shading flat; colorbar;
a1=squeeze(z.w1.roday.pct(isea,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =(a1-a0)./a0*100;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{isea}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,i); sx=let(i); i=i+1;
a1=squeeze(z.w2.roday.pct(isea,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =(a1-a0)./a0*100;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{isea}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); sx=let(i); i=i+1; m=3; %JJA
a0=squeeze(z.v0.roday.pct(isea,ipct,:,:)); %figure; pcolor(a0); shading flat; colorbar;
a1=squeeze(z.w1.roday.pct(isea,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =a0;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{isea}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,i); sx=let(i); i=i+1; 
a0=squeeze(z.v0.roday.pct(isea,ipct,:,:)); %figure; pcolor(a0); shading flat; colorbar;
a1=squeeze(z.w1.roday.pct(isea,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =(a1-a0)./a0*100;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{isea}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,i); sx=let(i); i=i+1;
a1=squeeze(z.w2.roday.pct(isea,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =(a1-a0)./a0*100;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{isea}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); sx=let(i); i=i+1; m=4; %SON
a0=squeeze(z.v0.roday.pct(isea,ipct,:,:)); %figure; pcolor(a0); shading flat; colorbar;
a1=squeeze(z.w1.roday.pct(isea,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =a0;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{isea}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,i); sx=let(i); i=i+1;
a0=squeeze(z.v0.roday.pct(isea,ipct,:,:)); %figure; pcolor(a0); shading flat; colorbar;
a1=squeeze(z.w1.roday.pct(isea,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =(a1-a0)./a0*100;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{isea}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,i); sx=let(i); i=i+1;
a1=squeeze(z.w2.roday.pct(isea,ipct,:,:)); %figure; pcolor(a1); shading flat; colorbar;
a =(a1-a0)./a0*100;
pcolor(x,y,a); shading flat; colorbar; caxis([-100 100]); hold on;
contour(x,y,lm,1,co); axis(xy);
for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
s=sprintf('%s (%s, %s)',sx,pctt, nsea{isea}); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

expn='pattern_effect_extremes'; visfig='off'; figpath='./fig_land/'; %figpath='./fig_spearhi8/'; 
vname=strcat(p.vname,'_',num2str(p.do_bias));
printnew(visfig,figpath,expn,vname);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Extreme Daily River Flow%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'}; isea=7; %1-7=ANN,MAM,JJA,SON,DJF,NDJFM,MJJA
a0='Present-day'; a1='SPEAR-pattern M'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='land_heat'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
del=' $\Delta$'; s0='TAS;'; s1='RHS; '; s2='PET; '; s3='(PET/P); ';
p.s0 =strcat(a0,'~(',p.sea,');~',s0); p.s1 =strcat(a1,';~',del,s0); p.s2 =strcat(a2,';~',del,s0); 
p.s3 =strcat(s1); p.s4 =strcat(del,s1); p.s5 =strcat(del,s1); 
p.s6 =strcat(s2); p.s7 =strcat(del,s2); p.s8 =strcat(del,s2); 
p.s9 =strcat(s3); p.s10=strcat(del,s3); p.s11=strcat(del,s3);
p.unit0 ='$\rm{^{\circ}C}$';    p.unit0_bar ='\rm{^{\circ}C}';
p.unit1 ='$\rm{KK^{-1}}$';      p.unit1_bar ='\rm{KK^{-1}}';
p.unit3 ='$\rm{\%}$';           p.unit3_bar ='\rm{%}'; 
p.unit4 ='$\rm{\% K^{-1}}$';    p.unit4_bar ='\rm{% K^{-1}}'; 
p.unit6 ='$\rm{mm day^{-1}}$';  p.unit6_bar ='\rm{mm day^{-1}}';
p.unit7 ='$\rm{mm day^{-1}K^{-1}}$';  p.unit7_bar ='\rm{mm day^{-1} K^{-1}}';
p.unit9 ='$\rm{}$';             p.unit9_bar ='\rm{}'; 
p.unit10='$\rm{K^{-1}}$';       p.unit10_bar='\rm{K^{-1}}'; 

p.cmin0= 0.0; p.cmax0=25;  p.cmin1 =-3.0;  p.cmax1=3.0;
p.cmin3= 0.0; p.cmax3=100; p.cmin4 =-10.0; p.cmax4 =10.0;
p.cmin6= 0.0; p.cmax6=5.;  p.cmin7 =-0.2;  p.cmax7 =0.2;
p.cmin9= 0.0; p.cmax9=2.;  p.cmin10=-1.0;  p.cmax10=1.0;

v=z.v0; p.lm=v.lm; aa=v.aa; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
p.dT1=1; p.dT2=1;  aa=aa/mean(mean(aa)); 

id=p.lm; id(id<0.5)=false; id(id>=0.5)=true; isig=id; ipct=7;

m=1;
a0=squeeze(z.v0.roday.pct(m,ipct,:,:));  
a1=squeeze(z.w1.roday.pct(m,ipct,:,:));
a2=squeeze(z.w2.roday.pct(m,ipct,:,:));
a=a0;            p.v0=a; p.dv1=mean(a(id==1).*aa(id==1)); p.isig1=isig;
a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id==1).*aa(id==1)); p.isig1=isig;
a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id==1).*aa(id==1)); p.isig2=isig;


a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
if (p.do_bias); p.v3=squeeze(z.v0.sfc.rhref.sea_bias(isea,:,:)); p.cmin3= -20.0; p.cmax3=20; end;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa); p.isig4=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa); p.isig5=isig;
%PET: Potential Evapotranspiration
%v=z.v0.sfc; a=get4season_all(v.evap.all/LV0*86400); a=squeeze(a(:,isea,:,:)); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
%v=z.w1.sfc; a=get4season_all(v.evap.all/LV0*86400); a=squeeze(a(:,isea,:,:)); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
%v=z.w2.sfc; a=get4season_all(v.evap.all/LV0*86400); a=squeeze(a(:,isea,:,:)); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=N;
%v=z.v0.sfc; a=get4season_all(v.shflx.all); a=squeeze(a(:,isea,:,:)); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
%v=z.w1.sfc; a=get4season_all(v.shflx.all); a=squeeze(a(:,isea,:,:)); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
%v=z.w2.sfc; a=get4season_all(v.shflx.all); a=squeeze(a(:,isea,:,:)); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=N;
v=z.v0.sfc; a=get4season_all(v.netrad.all/LV0*86400); a=squeeze(a(:,isea,:,:)); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.w1.sfc; a=get4season_all(v.netrad.all/LV0*86400); a=squeeze(a(:,isea,:,:)); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
v=z.w2.sfc; a=get4season_all(v.netrad.all/LV0*86400); a=squeeze(a(:,isea,:,:)); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=N;
a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
if (p.do_bias); p.v6=squeeze(z.v0.sfc.evap.sea_bias(isea,:,:))/LV0*86400; p.cmin6= -0.5; p.cmax6=0.5; end;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa); p.isig7=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa); p.isig8=isig;
%PET/P: aridity index
%v=z.v0.sfc; a=get4season_all(v.netrad.all/LV0*86400); x=0; a(a<x)=x; a=get4season_all(v.pcp.all)./a; a=squeeze(a(:,isea,:,:)); a(a>100)=100; a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
%v=z.w1.sfc; a=get4season_all(v.netrad.all/LV0*86400); x=0; a(a<x)=x; a=get4season_all(v.pcp.all)./a; a=squeeze(a(:,isea,:,:)); a(a>100)=100; a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
%v=z.w2.sfc; a=get4season_all(v.netrad.all/LV0*86400); x=0; a(a<x)=x; a=get4season_all(v.pcp.all)./a; a=squeeze(a(:,isea,:,:)); a(a>100)=100; a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=N;
v=z.v0.sfc; a=get4season_all(v.netrad.all/LV0*86400); x=0; a(a<x)=x; a=a./get4season_all(v.pcp.all); a=squeeze(a(:,isea,:,:)); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.w1.sfc; a=get4season_all(v.netrad.all/LV0*86400); x=0; a(a<x)=x; a=a./get4season_all(v.pcp.all); a=squeeze(a(:,isea,:,:)); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
v=z.w2.sfc; a=get4season_all(v.netrad.all/LV0*86400); x=0; a(a<x)=x; a=a./get4season_all(v.pcp.all); a=squeeze(a(:,isea,:,:)); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=N;
%MRSOS: surface moisture
%v=z.v0.sfc; a=get4season_all(v.mrsos.all); a=squeeze(a(:,isea,:,:)); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
%v=z.w1.sfc; a=get4season_all(v.mrsos.all); a=squeeze(a(:,isea,:,:)); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
%v=z.w2.sfc; a=get4season_all(v.mrsos.all); a=squeeze(a(:,isea,:,:)); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=N;
a=a0; p.v9=a; p.dv9=mean(a(id).*aa);
if (p.do_bias); p.v9=squeeze(z.v0.sfc.netrad.sea_bias(isea,:,:))/LV0*86400; p.cmin9= -0.5; p.cmax9=0.5; end;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v10=a; p.dv10=mean(a(id).*aa); p.isig10=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v11=a; p.dv11=mean(a(id).*aa); p.isig11=isig;
plot_pattern_effect_Fig_land_16panel(p)
%lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];
%plot_pattern_effect_Fig_land_16panel(p);
