%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2022.03/'; 
expn='c192_obs'; ardir='AR_climlmt'; yr1=2001;yr2=2020; pct=[99 99.9];
opt='obs'; addtc_to_AR_obs(tpath,expn,yr1,yr2,opt,-30);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2022.03/'; 
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_1951_2020'; ardir='AR_climlmt'; 
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_1day'; ardir='AR_climlmt'; 
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_ps_1day'; ardir='AR_climlmt'; 
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_ps_1day'; ardir='AR_climlmt'; 
expn='c192L33_am4p0_amip_HIRESMIP_HX'; ardir='AR_climlmt'; 
yr1=1970; yr2=1980; pct=[99 99.9];
opt='mod'; addtc_to_AR_mod(tpath,expn,yr1,yr2,opt,-30);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2022.03/'; diag=0; latlon=[180 340 10 90];pct=[99 99.9];
expn='c192_obs'; yr1=1985;yr2=2008;
opt='AR'; v=readartcmcs_day_obs_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);

expn='c192_obs'; yr1=1985;yr2=2008;
for yr = yr1:yr2
  opt='MC'; v=readartcmcs_day_obs_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
end
yr1=1959;yr2=2020; 
for yr = yr1:yr2
  opt='AR'; v=readartcmcs_day_obs_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
  opt='TC'; v=readartcmcs_day_obs_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
  opt='AL'; v=readartcmcs_day_obs_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2022.03/'; diag=0; latlon=[180 340 10 90];pct=[99 99.9];
expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_1951_2020'; yr1=1979;yr2=2020;
for yr = yr1:yr2
  opt='AR'; v=readartcmcs_day_mod_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
  %opt='TC'; v=readartcmcs_day_mod_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
  %opt='AL'; v=readartcmcs_day_mod_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
  %opt='MC'; v=readartcmcs_day_mod_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/usa/'; yr1=1979; yr2=2020;
expn='c192_era5'; v=do_AR_precip_usa_obs(tpath,expn,yr1,yr2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/usa/'; yr1=1979; yr2=2020;
expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_1951_2020';
v=do_AR_precip_usa_obs(tpath,expn,yr1,yr2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
