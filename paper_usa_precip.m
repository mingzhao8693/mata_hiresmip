%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/backup/ECMWF/'; 
expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=1979;yr2=2020; pct=[99 99.9];
opt='obs'; addtc_to_AR_obs(tpath,expn,yr1,yr2,opt,-30);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/backup/ECMWF/'; diag=0; latlon=[180 340 10 90];
expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=1979;yr2=1979; pct=[99 99.9];
opt='AR'; v=readartcmcs_day_obs_usa(tpath,expn,yr1,yr2,pct,opt,diag,latlon);
expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=1979;yr2=2020; pct=[99 99.9];
for yr = yr1:yr2
  opt='AR'; v=readartcmcs_day_obs_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/backup/ECMWF/'; diag=0; latlon=[180 340 10 90];
%expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=2015;yr2=2015; pct=[99 99.9];
%opt='TC'; v=readartcmcs_day_obs_usa(tpath,expn,yr1,yr2,pct,opt,diag,latlon);
expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=1979;yr2=2020; pct=[99 99.9];
for yr = yr1:yr2
  opt='TC'; v=readartcmcs_day_obs_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/backup/ECMWF/'; diag=0; latlon=[180 340 10 90];
%expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=1985;yr2=1985; pct=[99 99.9];
%opt='MC'; v=readartcmcs_day_obs_usa(tpath,expn,yr1,yr2,pct,opt,diag,latlon);
expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=1985;yr2=2008; pct=[99 99.9];
for yr = yr1:yr2
  opt='MC'; v=readartcmcs_day_obs_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%fn='/home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_hiresmip/ca_precip_annual_mean_ERAI_grid.nc';
%a=ncread(fn,'precip'); a=a'; id_ca=(a>0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%observational analysis of CA precipitation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_hiresmip/obs_global_to_c48.mat'); load(fn); 
g.ts=o.sfc.tsurf.all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OBS SST and precipitation trend analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_hiresmip/obs_global_to_c96.mat'); load(fn);
s.lat=o.lat; s.lon=o.lon; s.lm0=o.lm0; s.aa=o.aa; o.s=s;
o.time=[1916:1950]; o.nyr=length(o.time); o.expn='pcp_gpcc_1916_1950'
i1=47; o.sfc.ts_all  =o.sfc.sst_1870_2020.all(i1:i1+34,:,:,:);
i1=47; o.sfc.ice_all =o.sfc.ice_1870_2020.all(i1:i1+34,:,:,:);
i1=26; o.sfc.pcp_all =o.sfc.pcp_gpcc.all     (i1:i1+34,:,:,:); 
o.sfc.slp_all  = o.sfc.pcp_all;
o.sfc.z500_all = o.sfc.pcp_all;
vo.gpcc_1916_1950=do_trend(o,1916,1950,'obs');

o.time=[1951:1985]; o.nyr=length(o.time); o.expn='pcp_gpcc_1951_1985'
i1=82; o.sfc.ts_all  =o.sfc.sst_1870_2020.all(i1:i1+34,:,:,:);
i1=82; o.sfc.ice_all =o.sfc.ice_1870_2020.all(i1:i1+34,:,:,:);
i1=61; o.sfc.pcp_all =o.sfc.pcp_gpcc.all     (i1:i1+34,:,:,:); 
o.sfc.slp_all  = o.sfc.pcp_all;
o.sfc.z500_all = o.sfc.pcp_all;
vo.gpcc_1951_1985=do_trend(o,1951,1985,'obs');

o.time=[1986:2020]; o.nyr=length(o.time); o.expn='pcp_gpcc_1986_2020'
i1=117; o.sfc.ts_all  =o.sfc.sst_1870_2020.all (i1:i1+34,:,:,:);
i1=117; o.sfc.ice_all =o.sfc.ice_1870_2020.all (i1:i1+34,:,:,:);
i1=96;  o.sfc.pcp_all =o.sfc.pcp_gpcc.all      (i1:i1+34,:,:,:);
i1=28;  o.sfc.slp_all =o.sfc.slp_1959_2021.all (i1:i1+34,:,:,:);
i1=28;  o.sfc.z500_all=o.sfc.z500_1959_2021.all(i1:i1+34,:,:,:);
vo.gpcc_1986_2020=do_trend(o,1986,2020,'obs');

o.time=[1916:2020]; o.nyr=length(o.time); o.expn='pcp_gpcc_1916_2020'
i1=47; o.sfc.ts_all  =o.sfc.sst_1870_2020.all(i1:i1+104,:,:,:);
i1=47; o.sfc.ice_all =o.sfc.ice_1870_2020.all(i1:i1+104,:,:,:);
i1=26; o.sfc.pcp_all =o.sfc.pcp_gpcc.all     (i1:i1+104,:,:,:); 
o.sfc.slp_all  = o.sfc.pcp_all;
o.sfc.z500_all = o.sfc.pcp_all;
vo.gpcc_1916_2020=do_trend(o,1916,2020,'obs');

o.time=[1986:2020]; o.nyr=length(o.time); o.expn='pcp_mswep_1986_2020'
i1=117; o.sfc.ts_all  =o.sfc.sst_1870_2020.all (i1:i1+34,:,:,:);
i1=117; o.sfc.ice_all =o.sfc.sst_1870_2020.all (i1:i1+34,:,:,:);
i1=8;   o.sfc.pcp_all =o.sfc.pcp_mswep.all     (i1:i1+34,:,:,:) ;
i1=28;  o.sfc.slp_all =o.sfc.slp_1959_2021.all (i1:i1+34,:,:,:);
i1=28;  o.sfc.z500_all=o.sfc.z500_1959_2021.all(i1:i1+34,:,:,:);
vo.mswep_1986_2020=do_trend(o,1986,2020,'obs');

o.time=[1979:2020]; o.nyr=length(o.time); o.expn='pcp_mswep_1979_2020'
i1=110; o.sfc.ts_all  =o.sfc.sst_1870_2020.all (i1:i1+41,:,:,:);
i1=110; o.sfc.ice_all =o.sfc.sst_1870_2020.all (i1:i1+41,:,:,:);
i1=1;   o.sfc.pcp_all =o.sfc.pcp_mswep.all     (i1:i1+41,:,:,:) ;
i1=21;  o.sfc.slp_all =o.sfc.slp_1959_2021.all (i1:i1+41,:,:,:);
i1=21;  o.sfc.z500_all=o.sfc.z500_1959_2021.all(i1:i1+41,:,:,:);
vo.mswep_1979_2020=do_trend(o,1979,2020,'obs');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Model SST and precipitation trend analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/'; yr1=1949; yr2=2020; mod='mod';
expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; ext='_global_opt0.tsana_new.mat';
load(strcat(tpath,expn,'/',expn, ext)); v1=do_trend(v,yr1,yr2,mod);
expn='c192L33_am4p0_amip_HIRESMIP_H9_newpp';
load(strcat(tpath,expn,'/',expn, ext)); v2=do_trend(v,yr1,yr2,mod);
expn='c192L33_am4p0_amip_HIRESMIP_H10_newpp';
load(strcat(tpath,expn,'/',expn, ext)); v3=do_trend(v,yr1,yr2,mod);
expn='c192L33_am4p0_amip_HIRESMIP_H7_newpp';
load(strcat(tpath,expn,'/',expn, ext)); v4=do_trend(v,yr1,yr2,mod);
expn='c192L33_am4p0_amip_HIRESMIP_H5_newpp';
load(strcat(tpath,expn,'/',expn, ext)); v5=do_trend(v,yr1,yr2,mod);
expn='c192L33_am4p0_amip_HIRESMIP_H3_newpp';
load(strcat(tpath,expn,'/',expn, ext)); v6=do_trend(v,yr1,yr2,mod);
expn='c192L33_am4p0_amip_HIRESMIP_H2_newpp';
load(strcat(tpath,expn,'/',expn, ext)); v7=do_trend(v,yr1,yr2,mod);
expn='c192L33_am4p0_amip_HIRESMIP_H1_newpp';
load(strcat(tpath,expn,'/',expn, ext)); v8=do_trend(v,yr1,yr2,mod);
expn='c192L33_am4p0_EXT_resolution1_newpp';
load(strcat(tpath,expn,'/',expn, ext)); v9=do_trend(v,yr1,yr2,mod);
expn='c192L33_am4p0_EXT_resolution2_newpp';
load(strcat(tpath,expn,'/',expn, ext)); v10=do_trend(v,yr1,yr2,mod);
expn='c192L33_am4p0_EXT_resolution3_newpp';
load(strcat(tpath,expn,'/',expn, ext)); v11=do_trend(v,yr1,yr2,mod);
expn='c192L33_am4p0_EXT_resolution4_newpp';
load(strcat(tpath,expn,'/',expn, ext)); v12=do_trend(v,yr1,yr2,mod);
expn='c192L33_am4p0_EXT_resolution5_newpp';
load(strcat(tpath,expn,'/',expn, ext)); v13=do_trend(v,yr1,yr2,mod);
expn='c192L33_am4p0_EXT_resolution6_newpp';
load(strcat(tpath,expn,'/',expn, ext)); v14=do_trend(v,yr1,yr2,mod);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear v; v.vo=vo; 
v.v1=v1; v.v2=v2; v.v3=v3; v.v4=v4; v.v5=v5; v.v6=v6; v.v7=v7; v.v8=v8;
v.v9=v9; v.v10=v10; v.v11=v11; v.v12=v12; v.v13=v13; v.v14=v14;
epath='/work/miz/mat_hiresmip/';
fnmat=strcat(epath,'trend_sst_precip.mat'); disp(fnmat); %save(fnmat,'v'); 
save(fnmat,'v','-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1949-2020 Annual Precipitation Trend
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_pcp/obs/'; ext='_do_trend.mat';
expn='pcp_gpcc_1916_1950';   fn=strcat(tpath,expn, ext); load(fn); vo1=v;
expn='pcp_gpcc_1951_1985';   fn=strcat(tpath,expn, ext); load(fn); vo2=v;
expn='pcp_gpcc_1986_2020';   fn=strcat(tpath,expn, ext); load(fn); vo3=v;
expn='pcp_gpcc_1916_2020';   fn=strcat(tpath,expn, ext); load(fn); vo4=v;
expn='pcp_mswep_1986_2020';  fn=strcat(tpath,expn, ext); load(fn); vo5=v;
expn='pcp_mswep_1979_2020';  fn=strcat(tpath,expn, ext); load(fn); vo6=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.expn='obs_usa'; p.vname='pcp_gpcc_scyc';  plot_usa_reg_pcp_scyc(p,vo1,vo2,vo3);
p.expn='obs_usa'; p.vname='pcp_gpcc_ts';    plot_usa_reg_pcp_ts(p,vo4)
p.expn='obs_usa'; p.vname='pcp_mswep_ts';   plot_usa_reg_pcp_ts(p,vo6)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
opt='AR'; yr1=1979; yr2=2020; v1=do_storm_precip_usa_obs(opt,yr1,yr2);
opt='TC'; yr1=1979; yr2=2020; v2=do_storm_precip_usa_obs(opt,yr1,yr2);
opt='MC'; yr1=1985; yr2=2008; v3=do_storm_precip_usa_obs(opt,yr1,yr2);

opt='AR'; yr1=1985; yr2=2008; v1=do_storm_precip_usa_obs(opt,yr1,yr2);
opt='TC'; yr1=1985; yr2=2008; v2=do_storm_precip_usa_obs(opt,yr1,yr2);
opt='MC'; yr1=1985; yr2=2008; v3=do_storm_precip_usa_obs(opt,yr1,yr2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/'; d=2; s0='_readartcmcs_day_usa.mat';
expn='ERAI_6h_DATA'; %expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp';
ardir='AR_climlmt'; 
%yr=1980; yr=num2str(1980); yrs=strcat('_',yr,'_',yr,'_');
%fext=strcat(yrs,'AR_diag0',s0); fn=strcat(tpath,expn,fext); load(fn);v0=v;
for t=1:42; %year=197901-202012
  year(t)=1979+t-1; a=num2str(year(t)); yrs=strcat('_',a,'_',a,'_');
  fext=strcat(yrs,'AR_diag0',s0); fn=strcat(tpath,expn,fext); fn
  load(fn); 
  frqday     (t,:,:,:) = v.frqday;
  prday_av   (t,:,:,:) = v.prday_av; 
  prday_idwei(t,:,:,:) = v.prday_idwei;
  prday_idavg(t,:,:,:) = v.prday_idavg;
  prday_idstd(t,:,:,:) = v.prday_idstd;
  prday_idmax(t,:,:,:) = v.prday_idmax;
end
x.yr=year; x.nyr=length(x.yr); x.v=v;
for t=1:x.nyr-1; %year=197911-201912;
  a=frqday;      a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.frqday(t,:,:,:)=get7season(a,1);
  a=prday_av;    a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.prday_av(t,:,:,:)=get7season(a,1);
  a=prday_idwei; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.prday_idwei(t,:,:,:)=get7season(a,1);
  a=prday_idavg; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.prday_idavg(t,:,:,:)=get7season(a,1);
  a=prday_idstd; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.prday_idstd(t,:,:,:)=get7season(a,1);
  a=prday_idmax; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.prday_idmax(t,:,:,:)=get7season(a,1);
end
t=x.nyr;
a=frqday;      a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
x.frqday(t,:,:,:)=get7season(a,1);
a=prday_av;    a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
x.prday_av(t,:,:,:)=get7season(a,1);
a=prday_idwei; a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
x.prday_idwei(t,:,:,:)=get7season(a,1);
a=prday_idavg; a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
x.prday_idavg(t,:,:,:)=get7season(a,1);
a=prday_idstd; a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
x.prday_idstd(t,:,:,:)=get7season(a,1);
a=prday_idmax; a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
x.prday_idmax(t,:,:,:)=get7season(a,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s.lat=v.lat; s.lon=v.lon; s.lm0=v.lm; s.aa=v.aa; x.s=s;
x.nseason=length(x.frqday(1,:,1,1)); x.season=[1:x.nseason];
sname='NWR';    [x.nwr.frqday x.id_nwr]=get_var_state(x,sname,x.frqday);
sname='NWR';    [x.nwr.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='NWR';    [x.nwr.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='NWR';    [x.nwr.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='NWR';    [x.nwr.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='UMW';    [x.umw.frqday x.id_umw]=get_var_state(x,sname,x.frqday);
sname='UMW';    [x.umw.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='UMW';    [x.umw.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='UMW';    [x.umw.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='UMW';    [x.umw.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='NER';    [x.ner.frqday x.id_ner]=get_var_state(x,sname,x.frqday);
sname='NER';    [x.ner.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='NER';    [x.ner.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='NER';    [x.ner.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='NER';    [x.ner.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='WWR';    [x.wwr.frqday x.id_wwr]=get_var_state(x,sname,x.frqday);
sname='WWR';    [x.wwr.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='WWR';    [x.wwr.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='WWR';    [x.wwr.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='WWR';    [x.wwr.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='NRP';    [x.nrp.frqday x.id_nrp]=get_var_state(x,sname,x.frqday);
sname='NRP';    [x.nrp.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='NRP';    [x.nrp.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='NRP';    [x.nrp.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='NRP';    [x.nrp.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='OVR';    [x.ovr.frqday x.id_ovr]=get_var_state(x,sname,x.frqday);
sname='OVR';    [x.ovr.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='OVR';    [x.ovr.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='OVR';    [x.ovr.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='OVR';    [x.ovr.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='SWR';    [x.swr.frqday x.id_swr]=get_var_state(x,sname,x.frqday);
sname='SWR';    [x.swr.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='SWR';    [x.swr.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='SWR';    [x.swr.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='SWR';    [x.swr.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='SSR';    [x.ssr.frqday x.id_ssr]=get_var_state(x,sname,x.frqday);
sname='SSR';    [x.ssr.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='SSR';    [x.ssr.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='SSR';    [x.ssr.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='SSR';    [x.ssr.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='SER';    [x.ser.frqday x.id_ser]=get_var_state(x,sname,x.frqday);
sname='SER';    [x.ser.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='SER';    [x.ser.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='SER';    [x.ser.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='SER';    [x.ser.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='Canada'; [x.can.frqday x.id_can]=get_var_state(x,sname,x.frqday);
sname='Canada'; [x.can.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='Canada'; [x.can.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='Canada'; [x.can.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='Canada'; [x.can.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='Mexico'; [x.mex.frqday x.id_mex]=get_var_state(x,sname,x.frqday);
sname='Mexico'; [x.mex.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='Mexico'; [x.mex.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='Mexico'; [x.mex.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='Mexico'; [x.mex.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

epath='/work/miz/mat_pcp/obs/'; v=x;
fnmat=strcat(epath,'obs_AR_precip.mat'); disp(fnmat); %save(fnmat,'v'); 
save(fnmat,'v','-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('/work/miz/mat_pcp/obs/obs_AR_precip.mat');
lon=s.lon; lat=s.lat; lm=s.lm0; mon=[1:12]; n=10000;
s1='prday-av'; s2='prday-idwei'; s3='prday-idavg'; loc='northwest';
x1=0.5; x2=12.5; y1=0; y2=5; xy=[x1 x2 y1 y2];

pms=[ 0, 0, 1800, 1500]*1.5; row=3; col=3; fs=12;
handle=figure('Position',pms,'visible','on');
subplot(row,col,1); m1=8; m2=19; tit='NorthWest';
a=x.nwr.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.nwr.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.nwr.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location','north','FontSize',fs); title(tit,'FontSize',fs);
y1=0; y2=3.5; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,2); m1=8; m2=19; tit='Upper Midwest';
a=x.umw.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.umw.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.umw.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
y1=0.5; y2=4; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,3); m1=8; m2=19; tit='Northeast';
a=x.ner.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.ner.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.ner.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
y1=2.2; y2=3.8; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,4); m1=8; m2=19; tit='West';
a=x.wwr.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.wwr.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.wwr.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location','north','FontSize',fs); title(tit,'FontSize',fs);
y1=0; y2=2.5; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,5); m1=8; m2=19; tit='Northern Rockies and Plains';
a=x.nrp.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.nrp.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.nrp.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
y1=0; y2=3; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,6); m1=8; m2=19; tit='Ohio Valley';
a=x.ovr.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.ovr.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.ovr.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
y1=2; y2=4.5; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,7); m1=8; m2=19; tit='SouthWest';
a=x.swr.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.swr.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.swr.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location','north','FontSize',fs); title(tit,'FontSize',fs);
y1=0.4; y2=1.8; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,8); m1=8; m2=19; tit='South';
a=x.ssr.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.ssr.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.ssr.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
y1=1.5; y2=3.5; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,9); m1=8; m2=19; tit='Southeast';
a=x.ser.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.ser.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.ser.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
y1=2; y2=5.5; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

visfig='off'; figpath='./fig_USA/'; 
printnew(visfig,figpath,p.expn,p.vname);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_pcp/';  ext='_do_trend.mat';
expn='pcp_mswep';  fn=strcat(tpath,expn, ext); load(fn); vo.tr1=v1;
expn='pcp_gpcc';   fn=strcat(tpath,expn, ext); load(fn); vo.tr2=v1;
expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp';  fn=strcat(tpath,expn, ext); load(fn); v0=v1;
expn='c192L33_am4p0_amip_HIRESMIP_H9_newpp';  fn=strcat(tpath,expn, ext); load(fn); v2=v1;
expn='c192L33_am4p0_amip_HIRESMIP_H10_newpp'; fn=strcat(tpath,expn, ext); load(fn); v3=v1;
expn='c192L33_am4p0_amip_HIRESMIP_H7_newpp';  fn=strcat(tpath,expn, ext); load(fn); v4=v1;
expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp';  fn=strcat(tpath,expn, ext); load(fn); v5=v1;
expn='c192L33_am4p0_amip_HIRESMIP_H3_newpp';  fn=strcat(tpath,expn, ext); load(fn); v6=v1;
expn='c192L33_am4p0_amip_HIRESMIP_H2_newpp';  fn=strcat(tpath,expn, ext); load(fn); v7=v1;
expn='c192L33_am4p0_amip_HIRESMIP_H1_newpp';  fn=strcat(tpath,expn, ext); load(fn); v8=v1;
expn='c192L33_am4p0_EXT_resolution1_newpp';   fn=strcat(tpath,expn, ext); load(fn); v9=v1;
expn='c192L33_am4p0_EXT_resolution2_newpp';   fn=strcat(tpath,expn, ext); load(fn); v10=v1;
expn='c192L33_am4p0_EXT_resolution3_newpp';   fn=strcat(tpath,expn, ext); load(fn); v11=v1;
expn='c192L33_am4p0_EXT_resolution4_newpp';   fn=strcat(tpath,expn, ext); load(fn); v12=v1;
expn='c192L33_am4p0_EXT_resolution5_newpp';   fn=strcat(tpath,expn, ext); load(fn); v13=v1;
expn='c192L33_am4p0_EXT_resolution6_newpp';   fn=strcat(tpath,expn, ext); load(fn); v14=v1;v1=v0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('/work/miz/mat_hiresmip/trend_sst_precip.mat');
vo=v.vo; 
v1=v.v1; v2=v.v2; v3=v.v3; v4=v.v4; v5=v.v5; v6=v.v6; v7=v.v7; v8=v.v8; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=v1.trend_1950_2020.sst_ann; id0=(a.ice_clim>0.1)|(v1.s.lm0>0.5); clear p;
v=v1;     a=v.trend_1950_2020.sst_ann; id=a.signif; t1=a.trend; p.id.t1=id&~id0;t1(id0)=0;
v=vo.tr2; a=v.trend_1950_2020.sst_ann; id=a.signif; t2=a.trend; p.id.t2=id&~id0;t2(id0)=0;
v=vo.tr2; a=v.trend_1950_2020.pcp_ann; id=a.signif; ax=a.trend; p.id.ax=id;
v=vo.tr2; a=v.trend_1950_2020.pcp_ann; id=a.signif; ay=a.trend; p.id.ay=id;
a1=v1.trend_1950_2020.pcp_ann; id=a1.signif; a1=a1.trend; p.id.a1=id;
a2=v2.trend_1950_2020.pcp_ann; id=a2.signif; a2=a2.trend; p.id.a2=id;
a3=v3.trend_1950_2020.pcp_ann; id=a3.signif; a3=a3.trend; p.id.a3=id;
a4=v4.trend_1950_2020.pcp_ann; id=a4.signif; a4=a4.trend; p.id.a4=id;
a5=v5.trend_1950_2020.pcp_ann; id=a5.signif; a5=a5.trend; p.id.a5=id;
a6=v6.trend_1950_2020.pcp_ann; id=a6.signif; a6=a6.trend; p.id.a6=id;
a7=v7.trend_1950_2020.pcp_ann; id=a7.signif; a7=a7.trend; p.id.a7=id;
a8=v8.trend_1950_2020.pcp_ann; id=a8.signif; a8=a8.trend; p.id.a8=id;
av=(a1+a2+a3+a4+a5+a6+a7+a8)/8; 
id=p.id.a1+p.id.a2+p.id.a3+p.id.a4+p.id.a5+p.id.a6+p.id.a7+p.id.a8;
p.s=v1.s; p.t1=t1; p.t2=t2; p.ax=ax; p.ay=ay; p.av=av; p.id.av=id>5;
p.a1=a1; p.a2=a2; p.a3=a3; p.a4=a4; p.a5=a5; p.a6=a6; p.a7=a7; p.a8=a8;
p.expn='C192AM4_AMIP'; p.reg='usa'; p.cmin=-0.2; p.cmax=0.2;
pp='1950-2020'; sea='ANN'; ss=strcat(';',pp,';',sea); 
p.vname=strcat('precip_trend','_',pp,'_',sea,'_',p.reg) ;
p.st=strcat('SST trend',ss);
p.sx=strcat('OB1: precipitation trend',ss);
p.sy=strcat('OB2: precipitation trend',ss);
p.sv=strcat('MAV: precipitation trend',ss);
p.s1=strcat('EN1: precipitation trend',ss);
p.s2=strcat('EN2: precipitation trend',ss);
p.s3=strcat('EN3: precipitation trend',ss);
p.s4=strcat('EN4: precipitation trend',ss);
p.s5=strcat('EN5: precipitation trend',ss);
p.s6=strcat('EN6: precipitation trend',ss);
p.s7=strcat('EN7: precipitation trend',ss);
p.s8=strcat('EN8: precipitation trend',ss);
plot_trend_12panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1949-2020 Annual Precipitation Trend
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=v1.trend_1950_2020.sst_ann; id0=(a.ice_clim>0.1)|(v1.s.lm0>0.5); clear p;
v=v1;     a=v.trend_1950_2020.sst_ann; id=a.signif; t1=a.trend; p.id.t1=id&~id0;t1(id0)=0;
v=vo.tr2; a=v.trend_1950_2020.sst_ann; id=a.signif; t2=a.trend; p.id.t2=id&~id0;t2(id0)=0;
v=vo.tr2; a=v.trend_1950_2020.pcp_ann; id=a.signif; ax=a.trend; p.id.ax=id;
v=vo.tr2; a=v.trend_1950_2020.pcp_ann; id=a.signif; ay=a.trend; p.id.ay=id;
a1=v1.trend_1950_2020.pcp_ann; id=a1.signif; a1=a1.trend; p.id.a1=id;
a2=v2.trend_1950_2020.pcp_ann; id=a2.signif; a2=a2.trend; p.id.a2=id;
a3=v3.trend_1950_2020.pcp_ann; id=a3.signif; a3=a3.trend; p.id.a3=id;
a4=v4.trend_1950_2020.pcp_ann; id=a4.signif; a4=a4.trend; p.id.a4=id;
a5=v5.trend_1950_2020.pcp_ann; id=a5.signif; a5=a5.trend; p.id.a5=id;
a6=v6.trend_1950_2020.pcp_ann; id=a6.signif; a6=a6.trend; p.id.a6=id;
a7=v7.trend_1950_2020.pcp_ann; id=a7.signif; a7=a7.trend; p.id.a7=id;
a8=v8.trend_1950_2020.pcp_ann; id=a8.signif; a8=a8.trend; p.id.a8=id;
av=(a1+a2+a3+a4+a5+a6+a7+a8)/8; 
id=p.id.a1+p.id.a2+p.id.a3+p.id.a4+p.id.a5+p.id.a6+p.id.a7+p.id.a8;
p.s=v1.s; p.t1=t1; p.t2=t2; p.ax=ax; p.ay=ay; p.av=av; p.id.av=id>5;
p.a1=a1; p.a2=a2; p.a3=a3; p.a4=a4; p.a5=a5; p.a6=a6; p.a7=a7; p.a8=a8;
p.expn='C192AM4_AMIP'; p.reg='usa'; p.cmin=-0.2; p.cmax=0.2;
pp='1950-2020'; sea='ANN'; ss=strcat(';',pp,';',sea); 
p.vname=strcat('precip_trend','_',pp,'_',sea,'_',p.reg) ;
p.st=strcat('SST trend',ss);
p.sx=strcat('OB1: precipitation trend',ss);
p.sy=strcat('OB2: precipitation trend',ss);
p.sv=strcat('MAV: precipitation trend',ss);
p.s1=strcat('EN1: precipitation trend',ss);
p.s2=strcat('EN2: precipitation trend',ss);
p.s3=strcat('EN3: precipitation trend',ss);
p.s4=strcat('EN4: precipitation trend',ss);
p.s5=strcat('EN5: precipitation trend',ss);
p.s6=strcat('EN6: precipitation trend',ss);
p.s7=strcat('EN7: precipitation trend',ss);
p.s8=strcat('EN8: precipitation trend',ss);
plot_trend_12panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1979-2020 Annual Precipitation Trend
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=v1.trend_1979_2020.sst_ann; id0=(a.ice_clim>0.1)|(v1.s.lm0>0.5); clear p;
v=v1;     a=v.trend_1979_2020.sst_ann; id=a.signif; t1=a.trend; p.id.t1=id&~id0;t1(id0)=0;
v=vo.tr2; a=v.trend_1979_2020.sst_ann; id=a.signif; t2=a.trend; p.id.t2=id&~id0;t2(id0)=0;
v=vo.tr2; a=v.trend_1979_2020.pcp_ann; id=a.signif; ax=a.trend; p.id.ax=id;
v=vo.tr1; a=v.trend_1979_2020.pcp_ann; id=a.signif; ay=a.trend; p.id.ay=id;
a1=v1.trend_1979_2020.pcp_ann; id=a1.signif; a1=a1.trend; p.id.a1=id;
a2=v2.trend_1979_2020.pcp_ann; id=a2.signif; a2=a2.trend; p.id.a2=id;
a3=v3.trend_1979_2020.pcp_ann; id=a3.signif; a3=a3.trend; p.id.a3=id;
a4=v4.trend_1979_2020.pcp_ann; id=a4.signif; a4=a4.trend; p.id.a4=id;
a5=v5.trend_1979_2020.pcp_ann; id=a5.signif; a5=a5.trend; p.id.a5=id;
a6=v6.trend_1979_2020.pcp_ann; id=a6.signif; a6=a6.trend; p.id.a6=id;
a7=v7.trend_1979_2020.pcp_ann; id=a7.signif; a7=a7.trend; p.id.a7=id;
a8=v8.trend_1979_2020.pcp_ann; id=a8.signif; a8=a8.trend; p.id.a8=id;
av=(a1+a2+a3+a4+a5+a6+a7+a8)/8; 
id=p.id.a1+p.id.a2+p.id.a3+p.id.a4+p.id.a5+p.id.a6+p.id.a7+p.id.a8;
p.s=v1.s; p.t1=t1; p.t2=t2; p.ax=ax; p.ay=ay; p.av=av; p.id.av=id>5;
p.a1=a1; p.a2=a2; p.a3=a3; p.a4=a4; p.a5=a5; p.a6=a6; p.a7=a7; p.a8=a8;
p.expn='C192AM4_AMIP'; p.reg='glb';
pp='1979-2020'; sea='ANN'; ss=strcat(';',pp,';',sea); 
p.vname=strcat('precip_trend','_',pp,'_',sea,'_',p.reg) ;
p.st=strcat('SST trend',ss);
p.sx=strcat('OB1: precipitation trend',ss);
p.sy=strcat('OB2: precipitation trend',ss);
p.sv=strcat('MAV: precipitation trend',ss);
p.s1=strcat('EN1: precipitation trend',ss);
p.s2=strcat('EN2: precipitation trend',ss);
p.s3=strcat('EN3: precipitation trend',ss);
p.s4=strcat('EN4: precipitation trend',ss);
p.s5=strcat('EN5: precipitation trend',ss);
p.s6=strcat('EN6: precipitation trend',ss);
p.s7=strcat('EN7: precipitation trend',ss);
p.s8=strcat('EN8: precipitation trend',ss);
plot_trend_12panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1979-2020 DJF Precipitation Trend
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
to=v1.trend_1979_2020.sst_djf; id0=to.ice_clim>0.1|v1.s.lm0>0.5; clear p;
to=v1.trend_1979_2020.sst_djf; id=to.signif; to=to.trend; p.id.to=id&~id0;to(id0)=0;
ax=vo.trend_1979_2020.pcp_djf; id=ax.signif; ax=ax.trend; p.id.ax=id;
ay=vo.trend_1979_2020.sst_djf; id=ay.signif; ay=ay.trend; p.id.ay=id;
a1=v1.trend_1979_2020.pcp_djf; id=a1.signif; a1=a1.trend; p.id.a1=id;
a2=v2.trend_1979_2020.pcp_djf; id=a2.signif; a2=a2.trend; p.id.a2=id;
a3=v3.trend_1979_2020.pcp_djf; id=a3.signif; a3=a3.trend; p.id.a3=id;
a4=v4.trend_1979_2020.pcp_djf; id=a4.signif; a4=a4.trend; p.id.a4=id;
a5=v5.trend_1979_2020.pcp_djf; id=a5.signif; a5=a5.trend; p.id.a5=id;
av=(a1+a2+a3+a4+a5)/5; p.id.av=p.id.a1;
p.s=v1.s; p.to=to; p.ax=ax; p.ay=ay; 
p.a1=a1; p.a2=a2; p.a3=a3; p.a4=a4; p.a5=a5; p.av=av;
p.expn='C192AM4_AMIP'; p.reg='usa';
pp='1979-2020'; sea='DJF'; ss=strcat(';',pp,';',sea); 
p.vname=strcat('precip_trend','_',pp,'_',sea,'_',p.reg) ;
p.st=strcat('SST trend',ss);
p.sx=strcat('OB1: precipitation trend',ss);
p.sy=strcat('OB2: precipitation trend',ss);
p.sv=strcat('MOD: precipitation trend',ss);
p.s1=strcat('EN1: precipitation trend',ss);
p.s2=strcat('EN2: precipitation trend',ss);
p.s3=strcat('EN3: precipitation trend',ss);
p.s4=strcat('EN4: precipitation trend',ss);
p.s5=strcat('EN5: precipitation trend',ss);
plot_trend_9panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1979-2020 JJA Precipitation Trend
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
to=v1.trend_1979_2020.sst_jja; id0=to.ice_clim>0.1|v1.s.lm0>0.5; clear p;
to=v1.trend_1979_2020.sst_jja; id=to.signif; to=to.trend; p.id.to=id&~id0;to(id0)=0;
ax=vo.trend_1979_2020.pcp_jja; id=ax.signif; ax=ax.trend; p.id.ax=id;
ay=vo.trend_1979_2020.sst_jja; id=ay.signif; ay=ay.trend; p.id.ay=id;
a1=v1.trend_1979_2020.pcp_jja; id=a1.signif; a1=a1.trend; p.id.a1=id;
a2=v2.trend_1979_2020.pcp_jja; id=a2.signif; a2=a2.trend; p.id.a2=id;
a3=v3.trend_1979_2020.pcp_jja; id=a3.signif; a3=a3.trend; p.id.a3=id;
a4=v4.trend_1979_2020.pcp_jja; id=a4.signif; a4=a4.trend; p.id.a4=id;
a5=v5.trend_1979_2020.pcp_jja; id=a5.signif; a5=a5.trend; p.id.a5=id;
av=(a1+a2+a3+a4+a5)/5; p.id.av=p.id.a1;
p.s=v1.s; p.to=to; p.ax=ax; p.ay=ay; 
p.a1=a1; p.a2=a2; p.a3=a3; p.a4=a4; p.a5=a5; p.av=av;
p.expn='C192AM4_AMIP'; p.reg='glb';
pp='1979-2020'; sea='JJA'; ss=strcat(';',pp,';',sea); 
p.vname=strcat('precip_trend','_',pp,'_',sea,'_',p.reg) ;
p.st=strcat('SST trend',ss);
p.sx=strcat('OB1: precipitation trend',ss);
p.sy=strcat('OB2: precipitation trend',ss);
p.sv=strcat('MOD: precipitation trend',ss);
p.s1=strcat('EN1: precipitation trend',ss);
p.s2=strcat('EN2: precipitation trend',ss);
p.s3=strcat('EN3: precipitation trend',ss);
p.s4=strcat('EN4: precipitation trend',ss);
p.s5=strcat('EN5: precipitation trend',ss);
plot_trend_9panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1950-2020 Annual Precipitation Trend
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
to=v1.trend_1950_2020.sst_ann; id0=to.ice_clim>0.1|v1.s.lm0>0.5; clear p;
to=v1.trend_1950_2020.sst_ann; id=to.signif; to=to.trend; p.id.to=id&~id0;to(id0)=0;
ax=vo.trend_1950_2020.pcp_ann; id=ax.signif; ax=ax.trend; p.id.ax=id;
ay=vo.trend_1950_2020.sst_ann; id=ay.signif; ay=ay.trend; p.id.ay=id;
a1=v1.trend_1950_2020.pcp_ann; id=a1.signif; a1=a1.trend; p.id.a1=id;
a2=v2.trend_1950_2020.pcp_ann; id=a2.signif; a2=a2.trend; p.id.a2=id;
a3=v3.trend_1950_2020.pcp_ann; id=a3.signif; a3=a3.trend; p.id.a3=id;
a4=v4.trend_1950_2020.pcp_ann; id=a4.signif; a4=a4.trend; p.id.a4=id;
a5=v5.trend_1950_2020.pcp_ann; id=a5.signif; a5=a5.trend; p.id.a5=id;
av=(a1+a2+a3+a4+a5)/5; p.id.av=p.id.a1;
p.s=v1.s; p.to=to; p.ax=ax; p.ay=ay; 
p.a1=a1; p.a2=a2; p.a3=a3; p.a4=a4; p.a5=a5; p.av=av;
p.expn='C192AM4_AMIP'; p.reg='usa';
pp='1950-2020'; sea='ANN'; ss=strcat(';',pp,';',sea); 
p.vname=strcat('precip_trend','_',pp,'_',sea,'_',p.reg) ;
p.st=strcat('SST trend',ss);
p.sx=strcat('OB1: precipitation trend',ss);
p.sy=strcat('OB2: precipitation trend',ss);
p.sv=strcat('MOD: precipitation trend',ss);
p.s1=strcat('EN1: precipitation trend',ss);
p.s2=strcat('EN2: precipitation trend',ss);
p.s3=strcat('EN3: precipitation trend',ss);
p.s4=strcat('EN4: precipitation trend',ss);
p.s5=strcat('EN5: precipitation trend',ss);
plot_trend_9panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/c192L33_am4p0_amip_HIRESMIP_H8_newpp/';
load(strcat(tpath,'c192L33_am4p0_amip_HIRESMIP_H8_newpp_global_opt0.tsana_new.mat'));
g.s=v.s; g.time=v.time; g.yr=[1950:2020]; i1=30; i2=71;
g.ts =v.sfc.tsurf.all(i1:i2,:,:,:); g.ts_all =v.sfc.tsurf.all;
g.ice=v.sfc.ice.all  (i1:i2,:,:,:); g.ice_all=v.sfc.ice.all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/'; d=2; s='_readartcmcs_day_usa.mat';
expn='ERAI_6h_DATA'; %expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp';
ardir='AR_climlmt'; yr=1980; yr=num2str(1980); yrs=strcat('_',yr,'_',yr,'_');
fext=strcat(yrs,'AR_diag0',s); fn=strcat(tpath,expn,fext); load(fn);v0=v;
a=v.lm; sname='Washington'; id_wa=get_reg_id(a,v.lat,v.lon,sname);
a=v.lm; sname='Oregon';     id_or=get_reg_id(a,v.lat,v.lon,sname);
a=v.lm; sname='Idaho';      id_id=get_reg_id(a,v.lat,v.lon,sname);
a=v.lm; sname='Montana';    id_mt=get_reg_id(a,v.lat,v.lon,sname);
a=v.lm; sname='Wyoming';    id_wy=get_reg_id(a,v.lat,v.lon,sname);
a=v.lm; sname='California'; id_ca=get_reg_id(a,v.lat,v.lon,sname);
a=v.lm; sname='Nevada';     id_nv=get_reg_id(a,v.lat,v.lon,sname);
a=v.lm; sname='Arizona';    id_az=get_reg_id(a,v.lat,v.lon,sname);
a=v.lm; sname='New Mexico'; id_nm=get_reg_id(a,v.lat,v.lon,sname);
a=v.lm; sname='Texas';      id_tx=get_reg_id(a,v.lat,v.lon,sname);
a=v.lm; sname='Utah';       id_ut=get_reg_id(a,v.lat,v.lon,sname);
a=v.lm; sname='Colorado';   id_co=get_reg_id(a,v.lat,v.lon,sname);
id_nw0=id_wa|id_or|id_id; %figure; pcolor(id_nw0); shading flat;
id_nw1=id_wa|id_or|id_id|id_mt|id_wy; %figure; pcolor(id_nw1); shading flat;
id_sw0=id_ca|id_nv|id_az|id_nm|id_ut|id_co; %figure; pcolor(id_sw0); shading flat;
id_sw1=id_ca|id_nv|id_az|id_nm|id_tx|id_ut|id_co; %figure; pcolor(id_sw1); shading flat;
for t=1:42; %year=197901-201512
  year(t)=1979+t-1; a=num2str(year(t)); yrs=strcat('_',a,'_',a,'_');
  fext=strcat(yrs,'AR_diag0',s); fn=strcat(tpath,expn,fext); fn
  load(fn); 
  d=getregavg(v,id_wa, v.aa); wa(t)=d;
  d=getregavg(v,id_or, v.aa); or(t)=d;
  d=getregavg(v,id_id, v.aa); id(t)=d;
  d=getregavg(v,id_mt, v.aa); mt(t)=d;
  d=getregavg(v,id_wy, v.aa); wy(t)=d;
  d=getregavg(v,id_ca, v.aa); ca(t)=d;
  d=getregavg(v,id_nv, v.aa); nv(t)=d;
  d=getregavg(v,id_az, v.aa); az(t)=d;
  d=getregavg(v,id_nm, v.aa); nm(t)=d;
  d=getregavg(v,id_tx, v.aa); tx(t)=d;
  d=getregavg(v,id_ut, v.aa); ut(t)=d;
  d=getregavg(v,id_co, v.aa); co(t)=d;
  d=getregavg(v,id_nw0,v.aa); nw0(t)=d;
  d=getregavg(v,id_sw0,v.aa); sw0(t)=d;
  frqday     (t,:,:,:) = v.frqday;
  prday_av   (t,:,:,:) = v.prday_av; 
  prday_idwei(t,:,:,:) = v.prday_idwei;
  prday_idavg(t,:,:,:) = v.prday_idavg;
  prday_idstd(t,:,:,:) = v.prday_idstd;
  prday_idmax(t,:,:,:) = v.prday_idmax;
end
x.yr=year(1:end-1); x.nyr=length(x.yr); x.v=v;
x.wa =get7season_all(wa);
x.or =get7season_all(or);
x.id =get7season_all(id);
x.mt =get7season_all(mt);
x.wy =get7season_all(wy);
x.ca =get7season_all(ca);
x.nv =get7season_all(nv);
x.az =get7season_all(az);
x.nm =get7season_all(nm);
x.tx =get7season_all(tx);
x.ut =get7season_all(ut);
x.co =get7season_all(co);
x.nw0=get7season_all(nw0);
x.sw0=get7season_all(sw0);
for t=1:x.nyr; %year=197911-202012; 1980-2020
  a=frqday;      a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.frqday(t,:,:,:)=get7season(a,1);
  a=prday_av;    a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.prday_av(t,:,:,:)=get7season(a,1);
  a=prday_idwei; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.prday_idwei(t,:,:,:)=get7season(a,1);
  a=prday_idavg; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.prday_idavg(t,:,:,:)=get7season(a,1);
  a=prday_idstd; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.prday_idstd(t,:,:,:)=get7season(a,1);
  a=prday_idmax; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.prday_idmax(t,:,:,:)=get7season(a,1);
  a=g.ts;  a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.ts (t,:,:,:)=get7season(a,1);
  a=g.ice; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.ice(t,:,:,:)=get7season(a,1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%tpath='/archive/Ming.Zhao/obs_for_am4p0_paper/';
%expn='ERA_interim'; latlon=[0 360 10 90]; v=clivar_ana_obs_new()
fn=strcat('/work/miz/mat_hiresmip/clivar_ana_obs_new.mat'); load(fn);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=v.nino12.ssta;     n=length(a); a=reshape(a,12,n/12); nino12=a';
a=v.nino3.ssta;      n=length(a); a=reshape(a,12,n/12); nino3=a';
a=v.nino34.ssta;     n=length(a); a=reshape(a,12,n/12); nino34=a';
a=v.nino4.ssta;      n=length(a); a=reshape(a,12,n/12); nino4=a';
a=v.oni.ssta;        n=length(a); a=reshape(a,12,n/12); oni=a';
a=v.PNA_z500.index2; n=length(a); a=reshape(a,12,n/12); pna500=a';
a=v.NAM_mslp.index1; n=length(a); a=reshape(a,12,n/12); namslp=a';
a=v.PNA_z500.index2; n=length(a); a=reshape(a,12,n/12); pna502=a';
a=v.pna_wg;          n=length(a); a=reshape(a,12,n/12); pna_wg=a';
a=v.pna_e0.pnai;     n=length(a); a=reshape(a,12,n/12); pna_e0=a';
a=v.pj_index;        n=length(a); a=reshape(a,12,n/12); pj_idx=a';
a=v.easj_index;      n=length(a); a=reshape(a,12,n/12); easj_i=a';
for t=1:length(nino12(:,1))-1; %year=197911-201512; 1980-2015
  a=[nino12(t,11:12) nino12(t+1,:)]; x.nino12(t,:)=get7season(a,0);
  a=[nino3(t,11:12)  nino3(t+1,:)];  x.nino3 (t,:)=get7season(a,0);
  a=[nino34(t,11:12) nino34(t+1,:)]; x.nino34(t,:)=get7season(a,0);
  a=[nino4(t,11:12)  nino4(t+1,:)];  x.nino4 (t,:)=get7season(a,0);
  a=[oni(t,11:12)    oni(t+1,:)];    x.oni   (t,:)=get7season(a,0);
  a=[pna502(t,11:12) pna502(t+1,:)]; x.pna502(t,:)=get7season(a,0);
  a=[pna_wg(t,11:12) pna_wg(t+1,:)]; x.pna_wg(t,:)=get7season(a,0);
  a=[pna_e0(t,11:12) pna_e0(t+1,:)]; x.pna_e0(t,:)=get7season(a,0);
  a=[pj_idx(t,11:12) pj_idx(t+1,:)]; x.pj_idx(t,:)=get7season(a,0);
  a=[easj_i(t,11:12) easj_i(t+1,:)]; x.easj_i(t,:)=get7season(a,0);
  a=[namslp(t,11:12) namslp(t+1,:)]; x.namslp(t,:)=get7season(a,0);
end

for t=1:length(g.yr)-1 %year=195011-202012; 1950-2020
  a=g.ts_all;  a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.ts_all(t,:,:,:)=get7season(a,1);
  a=g.ice_all; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.ice_all(t,:,:,:)=get7season(a,1);
end
s=g.s; g.lm=s.lm0; g.lat=s.lat; g.lon=s.lon; 
g.ts=0; g.ts_all=0; g.ice=0; g.ice_all=0;
g.nlat=length(s.lat); g.nlon=length(s.lon); x.g=g;
v=x.v; x.lon=v.lon; x.lat=v.lat; x.nlon=v.nlon; x.nlat=v.nlat; x.lm=v.lm;
epath='/work/miz/mat_hiresmip/';
fnmat=strcat(epath,'paper_ca_precip.mat'); disp(fnmat); %save(fnmat,'x'); 
save(fnmat,'x','-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('/work/miz/mat_hiresmip/paper_ca_precip.mat');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot CA precipitatio characteristics%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m1=8; m2=19; m3=7; 
c=x.ca; ca=get_sth(c,m1,m2,m3);
c=x.nv; nv=get_sth(c,m1,m2,m3);
c=x.az; az=get_sth(c,m1,m2,m3);
c=x.nm; nm=get_sth(c,m1,m2,m3);
c=x.wa; wa=get_sth(c,m1,m2,m3);
c=x.or; or=get_sth(c,m1,m2,m3);
plot_ca_precip(ca,or,wa,nv)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=x.v; m=1; xt=[1979:2019]'; yr1=1980; yr2=2014;
t1=find(xt==yr1); t2=find(xt==yr2); xt=xt(t1:t2);
a=x.frqday(t1:t2,m,:,:); a=squeeze(a); %b=trend(a);
for j=1:v.nlat
  for i=1:v.nlon
    y=squeeze(a(:,j,i)); 
    AR_trend(j,i)=Theil_Sen_Regress(xt,y)*100*10; % %/decade
    %c=polyfit(xt,y,1); slope1(j,i)=c(1);
  end
end
%Global SST trend analysis%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%note Y/xt/x in Theil_Sen_Regress in get_trend_TSR must be column vector
%otherwise it returns NaN, this is why Y cannot be [1950:2019];
alpha=0.8; Y=[1950:2019]'; m=7;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yr1=1980; yr2=2014; t1=find(Y==yr1); t2=find(Y==yr2); xt=Y(t1:t2);
a=x.ts_all(t1:t2,m,:,:); a=squeeze(a);
v=get_trend_TSR(x.g,a,xt,alpha);
v.ice_clim=squeeze(mean(x.ice_all(t1:t2,m,:,:),1));
sst_1980_2014=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yr1=1980; yr2=2019; t1=find(Y==yr1); t2=find(Y==yr2); xt=Y(t1:t2);
a=x.ts_all(t1:t2,m,:,:); a=squeeze(a);
v=get_trend_TSR(x.g,a,xt,alpha);
v.ice_clim=squeeze(mean(x.ice_all(t1:t2,m,:,:),1));
sst_1980_2019=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yr1=1950; yr2=2014; t1=find(Y==yr1); t2=find(Y==yr2); xt=Y(t1:t2);
a=x.ts_all(t1:t2,m,:,:); a=squeeze(a);
v=get_trend_TSR(x.g,a,xt,alpha);
v.ice_clim=squeeze(mean(x.ice_all(t1:t2,m,:,:),1));
sst_1950_2014=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yr1=1950; yr2=2019; t1=find(Y==yr1); t2=find(Y==yr2); xt=Y(t1:t2);
a=x.ts_all(t1:t2,m,:,:); a=squeeze(a);
v=get_trend_TSR(x.g,a,xt,alpha);
v.ice_clim=squeeze(mean(x.ice_all(t1:t2,m,:,:),1));
sst_1950_2019=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yr1=1951; yr2=2010; t1=find(Y==yr1); t2=find(Y==yr2); xt=Y(t1:t2);
a=x.ts_all(t1:t2,m,:,:); a=squeeze(a);
v=get_trend_TSR(x.g,a,xt,alpha);
v.ice_clim=squeeze(mean(x.ice_all(t1:t2,m,:,:),1));
sst_1951_2010=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g=x.g; lon=g.lon; lat=g.lat; lm=g.lm; cmin=-0.5; cmax=0.5; 
xmin=0; xmax=360; ymin=-90; ymax=90; nn=256;
pms=[ 0, 0, 1800, 600]*0.8; row=2; col=3;
handle=figure('Position',pms,'visible','on');
subplot(row,col,1); v=sst_1980_2014; 
id=~v.signif|(lm>0.5|v.ice_clim>0.01); a=v.trend; a(id)=0;
pcolor(lon,lat,a); shading flat; colorbar; hold on;
contour(lon,lat,lm,[0 0.5],'k');
a=[190 -5 50 10]; rectangle('Position',a); %latlon=[190 240 -5 5]; NINO3.4
%[latx,lonx]=borders('United States','k'); hold on; plot((lonx+360),latx,'k');
%[latx,lonx]=borders('Canada','k'); hold on; plot((lonx+360)',latx','k');
%[latx,lonx]=borders('Mexico','k'); hold on; plot((lonx+360)',latx','k');
axis([xmin xmax ymin ymax]); caxis([cmin cmax]); 
cmap=bluewhitered(nn); colormap(cmap); title('1980-2014 SST trend');
subplot(row,col,2); v=sst_1980_2019;
id=~v.signif|(lm>0.5); a=v.trend; a(id)=0;
pcolor(lon,lat,a); shading flat; colorbar; hold on;
contour(lon,lat,lm,[0 0.5],'k');
axis([xmin xmax ymin ymax]); caxis([cmin cmax]);
cmap=bluewhitered(nn); colormap(cmap); title('1980-2020 SST trend');
subplot(row,col,3); v=sst_1950_2014;
id=~v.signif|(lm>0.5); a=v.trend; a(id)=0;
pcolor(lon,lat,a); shading flat; colorbar; hold on;
contour(lon,lat,lm,[0 0.5],'k');
axis([xmin xmax ymin ymax]); caxis([cmin cmax]);
cmap=bluewhitered(nn); colormap(cmap); title('1950-2014 SST trend');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure; pcolor(v.lon,v.lat,slope1); shading flat; colorbar; colormap(jet); 
caxis([-2 2]); hold on;
contour(v.lon,v.lat,v.lm,'k','LineWidth',0.1);
 
figure; pcolor(v.lon,v.lat,b*1000); 
shading flat; colorbar; colormap(jet); caxis([-2 2]); hold on;
contour(v.lon,v.lat,v.lm,'k','LineWidth',0.1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%correlation analysis for SST and regional precipitation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=5;
p.wa=x.wa.prday_av (:,m);
p.or=x.or.prday_av (:,m);
p.ca=x.ca.prday_av (:,m);
% $$$ p_ca=x.id.prday_av (:,m); p_ca=x.mt.prday_av (:,m); p_ca=x.wy.prday_av (:,m); 
% $$$ p_ca=x.nv.prday_av (:,m); p_ca=x.az.prday_av (:,m); p_ca=x.nm.prday_av (:,m); 
% $$$ p_ca=x.tx.prday_av (:,m); p_ca=x.ut.prday_av (:,m); p_ca=x.co.prday_av (:,m);
% $$$ p_ca=x.nw0.prday_av(:,m); p_ca=x.sw0.prday_av(:,m);
s=x.g.s; nlat=length(s.lat); nlon=length(s.lon); 
for j=1:nlat
  for i=1:nlon
    a=squeeze(x.ts(:,m,j,i));
    c=corrcoef(a,p.ca); r.ca(j,i)=c(1,2);
    c=corrcoef(a,p.or); r.or(j,i)=c(1,2);
    c=corrcoef(a,p.wa); r.wa(j,i)=c(1,2);
  end
end
lon=s.lon; lat=s.lat; lm=s.lm0;
pms=[ 0, 0, 1400, 800]*1.5; 
handle=figure('Position',pms,'visible','on'); row=2; col=2;
subplot(row,col,1)
pcolor(lon,lat,r.ca); shading flat; colorbar; caxis([-0.5 0.5]); hold on;
contour(lon,lat,lm,[0 0.5],'k'); colormap(jet);
subplot(row,col,2)
pcolor(lon,lat,r.or); shading flat; colorbar; caxis([-0.5 0.5]); hold on;
contour(lon,lat,lm,[0 0.5],'k');
subplot(row,col,3)
pcolor(lon,lat,r.wa); shading flat; colorbar; caxis([-0.5 0.5]); hold on;
contour(lon,lat,lm,[0 0.5],'k');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=5; x0=[1980:2015];
a=x.or; a0=a.prday_av(:,m); a1=a.frqday(:,m); a2=a.prday_idwei(:,m);
b1=x.nino12(:,m); b2=x.nino3 (:,m); b3=x.nino34(:,m); b4=x.nino4(:,m);b5=x.oni(:,m);
d1=x.pna502(:,m); d2=x.pna_e0(:,m); d3=x.pna_wg(:,m);
e1=x.pj_idx(:,m); e2=x.easj_i(:,m); e3=x.namslp(:,m);
figure; 
plot(x0,a0-mean(a0),'r'); hold on; 
plot(x0,b1-mean(b1),'g'); %plot(x0,d2-mean(d2),'b'); plot(x0,e1-mean(e1),'c');

zz=a1; xx=b1; yy=d2; %yy=b2;
X=[ones(size(xx)) xx yy]; 
[s,~,~,~,stats]=regress(zz,X); 
zp=s(1)+s(2)*xx+s(3)*yy;; corrcoef(zp,zz)
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=5; a0=c.prday_av(:,m); a1=c.frqday(:,m); a2=c.prday_idwei(:,m);
b1=c.nino12(:,m); b2=c.nino3 (:,m); b3=c.nino34(:,m); b4=c.nino4(:,m);b5=c.oni(:,m);
d1=c.pna502(:,m); d2=c.pna_e0(:,m); d3=c.pna_wg(:,m);
e1=c.pj_idx(:,m); e2=c.easj_i(:,m); e3=c.namslp(:,m);
figure; plot(a0-mean(a0),'r'); hold on; 
plot(b1-mean(b1),'g'); plot(d2-mean(d2),'b'); plot(e1-mean(e1),'c');
zz=a1; xx=b1; yy=d2; %yy=b2;
X=[ones(size(xx)) xx yy]; 
[s,~,~,~,stats]=regress(zz,X); 
zp=s(1)+s(2)*xx+s(3)*yy;; corrcoef(zp,zz)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%tpath='/archive/Ming.Zhao/obs_for_am4p0_paper/';
%expn='ERA_interim'; latlon=[0 360 10 90]; region='NH';
%v=clivar_ana_obs_new()
fn=strcat('/work/miz/mat_hiresmip/clivar_ana_obs_new_NH.mat')
load(fn); 
m1=5; m2=5; a=c.prday_av(:,m1:m2); b=reshape(v.nino12.ssta(1:432),36,12);
m=2; corrcoef(a(:,m),b(:,m))

































%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];latlon=[180 340 10 90];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; ardir='AR_climlmt';yr1=1980;yr2=2014;diag=0;
for yr=yr1:yr2
   opt='AR';  v.ar=readartcmcs_day_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];diag=0;
expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp'; ardir='AR_climlmt';yr1=2015;yr2=2050;
%opt='mod'; addtc_to_AR(tpath,expn,yr1,yr2,opt,-30)
opt='AL';  v.al=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='MC';  v.mc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AR';  v.ar=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TC';  v.tc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%opt='mod'; v=readarmap_allday(tpath,expn,yr1,yr2,pct,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_2010climo_new_newpp'; ardir='AR_climlmt'; yr1=2;yr2=101;diag=0;
opt='AR';  v.ar=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_2010climo_new_p4K_newpp'; ardir='AR_climlmt';yr1=2;yr2=101;diag=0;
opt='AR';  v.ar=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%opt='mod'; v=readarmap_allday(tpath,expn,yr1,yr2,pct,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_2010climo_new_p4K_4xCO2_newpp'; ardir='AR_climlmt';yr1=2;yr2=101;diag=1;
opt='AR';  v.ar=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%opt='mod'; v=readarmap_allday(tpath,expn,yr1,yr2,pct,opt,diag);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_2010climo_new_4xCO2_newpp'; ardir='AR_climlmt';yr1=2;yr2=101;diag=1;
opt='AR';  v.ar=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%opt='mod'; v=readarmap_allday(tpath,expn,yr1,yr2,pct,opt,diag);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_climo_hiresmip_futureSST_4xCO2_newpp'; ardir='AR_climlmt';yr1=2;yr2=101;diag=1;
%v=readar_limit_new(tpath,expn,yr1,yr2,ardir);
%opt='mod'; addtc_to_AR(tpath,expn,yr1,yr2,opt,-50)
opt='AL';  v.al=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AR';  v.ar=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TC';  v.tc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TD';  v.td=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='MC';  v.mc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%v=readar_limit_new(tpath,expn,yr1,yr2,ardir);
%opt='mod'; v=readarmap_allday(tpath,expn,yr1,yr2,pct,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
