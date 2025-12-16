%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/backup/ECMWF/'; 
expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=2001;yr2=2014; pct=[99 99.9];
opt='obs'; addtc_to_AR_obs_ceres(tpath,expn,yr1,yr2,opt,-20,238);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2022.03/'; 
expn='c192_obs'; ardir='AR_climlmt'; yr1=1959;yr2=2000; pct=[99 99.9];
opt='obs'; addtc_to_AR_obs(tpath,expn,yr1,yr2,opt,-30);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/'; ardir='AR_climlmt';
pct=[99 99.9]; use_obs_tc=0; opt='mod';
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_best_wegradient';
yr1=0009; yr2=0101; addtc_to_AR_mod(tpath,expn,yr1,yr2,opt,-30,use_obs_tc);
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_worst_wegradient';
yr1=0005; yr2=0101; addtc_to_AR_mod(tpath,expn,yr1,yr2,opt,-30,use_obs_tc);
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_2best_wegradient';
yr1=0002; yr2=0101; addtc_to_AR_mod(tpath,expn,yr1,yr2,opt,-30,use_obs_tc);
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_2worst_wegradient';
yr1=0002; yr2=0101; addtc_to_AR_mod(tpath,expn,yr1,yr2,opt,-30,use_obs_tc);
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_middle_wegradient';
yr1=0002; yr2=0101; addtc_to_AR_mod(tpath,expn,yr1,yr2,opt,-30,use_obs_tc);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs';
yr1=0007; yr2=0101; addtc_to_AR_mod(tpath,expn,yr1,yr2,opt,-30,use_obs_tc);
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs';
yr1=0002; yr2=0101; addtc_to_AR_mod(tpath,expn,yr1,yr2,opt,-30,use_obs_tc);
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_so_45_75s_obs';
yr1=0002; yr2=0101; addtc_to_AR_mod(tpath,expn,yr1,yr2,opt,-30,use_obs_tc);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/'; diag=2;
ardir='AR_climlmt';yr1=0002;yr2=0101;pct=[99 99.9]; yr2=0021;
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_best_wegradient';
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_worst_wegradient';
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_2best_wegradient';
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_2worst_wegradient';
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_middle_wegradient';
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs';
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs';
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_so_45_75s_obs';
opt='MC';   v=readartcmcs_day_cre_new_mod(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AR';   v=readartcmcs_day_cre_new_mod(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TC';   v=readartcmcs_day_cre_new_mod(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AL';   v=readartcmcs_day_cre_new_mod(tpath,expn,yr1,yr2,pct,opt,diag);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2022.03/'; 
expn='c192L33_am4p0_2010climo'; ardir='AR_climlmt'; 
expn='c192L33_am4p0_2010climo_trend_1979_2020'; ardir='AR_climlmt'; 
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear'; ardir='AR_climlmt'; 
expn='c192L33_am4p0_2010climo_trend_1979_2020_p05'; ardir='AR_climlmt'; 
expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2'; ardir='AR_climlmt'; 
%expn='c192L33_am4p0_2010climo_old'; ardir='AR_climlmt'; 
%expn='c192L33_am4p0_2010climo_old_p4K'; ardir='AR_climlmt'; 
%expn='c192L33_am4p0_2010climo_old_4xCO2'; ardir='AR_climlmt'; 
yr1=0101; yr2=0101; pct=[99 99.9]; use_obs_tc=0;
opt='mod'; addtc_to_AR_mod(tpath,expn,yr1,yr2,opt,-30,use_obs_tc);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2022.03/'; 
expn='c192L33_am4p0_amip_HIRESMIP_HX7'; ardir='AR_climlmt'; 
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_skip_bot_v6'; ardir='AR_climlmt'; 
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_1951_2020'; ardir='AR_climlmt'; 
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_1day'; ardir='AR_climlmt'; 
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_1day_p2K'; ardir='AR_climlmt'; 
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_ps_1day'; ardir='AR_climlmt'; 
%expn='c192L33_am4p0_amip_HIRESMIP_HX_p2K'; ardir='AR_climlmt'; 
%expn='c192L33_am4p0_amip_HIRESMIP_HX'; ardir='AR_climlmt'; 
yr1=2001; yr2=2020; pct=[99 99.9]; use_obs_tc=0;
opt='mod'; addtc_to_AR_mod(tpath,expn,yr1,yr2,opt,-30,use_obs_tc);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2022.03/'; diag=3; adj_opt=1;
expn='c192_obs'; ardir='AR_climlmt'; pct=[99 99.9];
yr1=2001; yr2=2008;
opt='MC';   v=readartcmcs_day_cre_new(tpath,expn,yr1,yr2,pct,opt,diag,adj_opt);
opt='AL';   v=readartcmcs_day_cre_new(tpath,expn,yr1,yr2,pct,opt,diag,adj_opt);
%opt='PB';   v=readartcmcs_day_cre_new(tpath,expn,yr1,yr2,pct,opt,diag,adj_opt);
%opt='PR01'; v=readartcmcs_day_cre_new(tpath,expn,yr1,yr2,pct,opt,diag,adj_opt);
yr1=2001; yr2=2020;
opt='AR';   v=readartcmcs_day_cre_new(tpath,expn,yr1,yr2,pct,opt,diag,adj_opt);
opt='TC';   v=readartcmcs_day_cre_new(tpath,expn,yr1,yr2,pct,opt,diag,adj_opt);
opt='PR01'; v=readartcmcs_day_cre_new(tpath,expn,yr1,yr2,pct,opt,diag,adj_opt);%P>1mm/day
opt='P02';  v=readartcmcs_day_cre_new(tpath,expn,yr1,yr2,pct,opt,diag,adj_opt);%P>0.2mm/day
opt='PB';   v=readartcmcs_day_cre_new(tpath,expn,yr1,yr2,pct,opt,diag,adj_opt);%wetnonstorm
opt='PC';   v=readartcmcs_day_cre_new(tpath,expn,yr1,yr2,pct,opt,diag,adj_opt);%0.2<P<1mm/day
opt='PD';   v=readartcmcs_day_cre_new(tpath,expn,yr1,yr2,pct,opt,diag,adj_opt);%Non-precip
%opt='P00';  v=readartcmcs_day_cre_new(tpath,expn,yr1,yr2,pct,opt,diag,adj_opt);
%opt='P01';  v=readartcmcs_day_cre_new(tpath,expn,yr1,yr2,pct,opt,diag,adj_opt);
%opt='PA';   v=readartcmcs_day_cre_new(tpath,expn,yr1,yr2,pct,opt,diag,adj_opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2022.03/'; diag=2; 
expn='c192L33_am4p0_2010climo'; ardir='AR_climlmt';yr1=0002;yr2=0101;pct=[99 99.9];
expn='c192L33_am4p0_2010climo_trend_1979_2020'; ardir='AR_climlmt';yr1=0002;yr2=0101;pct=[99 99.9];
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear'; ardir='AR_climlmt';yr1=0002;yr2=0101;pct=[99 99.9];
expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2'; ardir='AR_climlmt';yr1=0002;yr2=0101;pct=[99 99.9];
%expn='c192L33_am4p0_2010climo_trend_1979_2020_p05'; ardir='AR_climlmt'; yr1=0002;yr2=0101;pct=[99 99.9];
%expn='c192L33_am4p0_2010climo_old'; ardir='AR_climlmt';yr1=0032;yr2=0101;pct=[99 99.9];
%expn='c192L33_am4p0_2010climo_old_p4K'; ardir='AR_climlmt';yr1=0032;yr2=0101;pct=[99 99.9];
%expn='c192L33_am4p0_2010climo_old_4xCO2'; ardir='AR_climlmt';yr1=0032;yr2=0101;pct=[99 99.9];
%expn='c192L33_am4p0_amip_HIRESMIP_HX6'; ardir='AR_climlmt';yr1=2001;yr2=2020;pct=[99 99.9];
%expn='c192L33_am4p0_amip_HIRESMIP_HX_p2K'; ardir='AR_climlmt';yr1=1951;yr2=2020;pct=[99 99.9];
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_1day'; ardir='AR_climlmt';yr1=2001;yr2=2020;pct=[99 99.9];
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_1day_p2K'; ardir='AR_climlmt';yr1=2001;yr2=2020;pct=[99 99.9];
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_skip_bot_v6'; ardir='AR_climlmt';yr1=2001;yr2=2020;pct=[99 99.9];
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_1951_2020'; ardir='AR_climlmt'; yr1=2001;yr2=2020;pct=[99 99.9];
opt='MC';   v=readartcmcs_day_cre_new_mod(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AR';   v=readartcmcs_day_cre_new_mod(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TC';   v=readartcmcs_day_cre_new_mod(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AL';   v=readartcmcs_day_cre_new_mod(tpath,expn,yr1,yr2,pct,opt,diag);
opt='PR01'; v=readartcmcs_day_cre_new_mod(tpath,expn,yr1,yr2,pct,opt,diag);

opt='P02';  v=readartcmcs_day_cre_new_mod(tpath,expn,yr1,yr2,pct,opt,diag);
opt='PB';   v=readartcmcs_day_cre_new_mod(tpath,expn,yr1,yr2,pct,opt,diag);
opt='PC';   v=readartcmcs_day_cre_new_mod(tpath,expn,yr1,yr2,pct,opt,diag);
opt='PD';   v=readartcmcs_day_cre_new_mod(tpath,expn,yr1,yr2,pct,opt,diag);
% $$$ opt='P00';  v=readartcmcs_day_cre_new_mod(tpath,expn,yr1,yr2,pct,opt,diag);
% $$$ opt='P01';  v=readartcmcs_day_cre_new_mod(tpath,expn,yr1,yr2,pct,opt,diag);
% $$$ opt='PA';   v=readartcmcs_day_cre_new_mod(tpath,expn,yr1,yr2,pct,opt,diag);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load AR, TC, MCS analysis for SST pattern paper%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre_newer.mat';
expn='c192L33_am4p0_2010climo'; yrs='_2_101_'; diag='_diag1';
fext=strcat(yrs,'MC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.mc=v;
fext=strcat(yrs,'AR',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.ar=v;
fext=strcat(yrs,'TC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.tc=v;
%fext=strcat(yrs,'PR01',diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.pr=v;
%fext=strcat(yrs,'P02', diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.p2=v;
%fext=strcat(yrs,'PB',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.pb=v;
%fext=strcat(yrs,'PC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.pc=v;
%fext=strcat(yrs,'PD',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.pd=v;
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear'; yrs='_2_101_'; diag='_diag1';
fext=strcat(yrs,'MC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w1.mc=v;
fext=strcat(yrs,'AR',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w1.ar=v;
fext=strcat(yrs,'TC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w1.tc=v;
tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre_newer.mat';
expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2'; yrs='_2_101_'; diag='_diag1';
fext=strcat(yrs,'MC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.mc=v;
fext=strcat(yrs,'AR',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.ar=v;
fext=strcat(yrs,'TC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.tc=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load ts_ana%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ph='/archive/Ming.Zhao/awg/2022.03/'; f='_global_opt2.c96tsana_new_1979_2020.mat';
e='c192L33_am4p0_2010climo';                        n=strcat(ph,e,'/',e,f); load(n);z.v0=v;
%e='c192L33_am4p0_2010climo_old_p4K';                n=strcat(ph,e,'/',e,f); load(n);z.w0=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear';  n=strcat(ph,e,'/',e,f); load(n);z.w1=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_times_2';n=strcat(ph,e,'/',e,f); load(n);z.w2=v;
%e='c192L33_am4p0_2010climo_trend_1979_2020';        n=strcat(ph,e,'/',e,f); load(n);z.w3=v;
%e='c192L33_am4p0_2010climo_trend_1979_2020_p05';    n=strcat(ph,e,'/',e,f); load(n);z.w4=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
a1='SPEAR-pattern;'; a2='Observed-pattern;'; a3='Uniform-pattern;';
del='$\Delta$'; s1='SST'; s2='AR days'; s3='TS days'; s4='MCS days';
p.s1 =strcat(a1,del,s1); p.s2 =strcat(a2,del,s1); p.s3 =strcat(a3,del,s1);
a='$(SST_A-\overline{SST_A})/\overline{SST_A}$'; 
p.s1=strcat(a1,a); p.s2=strcat(a2,a); p.s3=strcat(a3,a);
p.s4 =strcat(del,s2); p.s5 =strcat(del,s2); p.s6 =strcat(del,s2);
p.s7 =strcat(del,s3); p.s8 =strcat(del,s3); p.s9 =strcat(del,s3);
p.s10=strcat(del,s4); p.s11=strcat(del,s4); p.s12=strcat(del,s4);
p.tit=''; p.unit0='K'; p.unit='\%/K'; p.unit_bar='K/K (\%/K)'; p.pos1=-0.05;
p.vname='dsst_dfrqday_new';
p.cmin1=-1.5; p.cmax1=1.5; p.cmin2=-3; p.cmax2=3;p.co='k';p.ms=2;
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa; p.do_add=1;p.show='off';
a0=z.v0.sfc.tref.tavg0;
a =z.w1.sfc.tref.tavg0-a0; p.dT1=mean(mean(a.*aa));
a =z.w2.sfc.tref.tavg0-a0; p.dT2=mean(mean(a.*aa));
imk=z.v0.sfc.ice.tavg0; id=~(s.lm>0|imk>0); a=aa(id); aa0=a/mean(a);
a0=z.v0.sfc.tsurf.tavg0; p.v1_add=a0; p.v1_addbin=[280:2:302], p.v1_co='k';
v=z.w1; a=v.sfc.tsurf.tavg0-a0; p.v1=a; p.dv1=mean(mean(a(id).*aa0));p.v1=(a-p.dv1)/p.dv1;
v=z.w2; a=v.sfc.tsurf.tavg0-a0; p.v2=a; p.dv2=mean(mean(a(id).*aa0));p.v2=(a-p.dv2)/p.dv2;
p.v1(~id)=NaN; p.v2(~id)=NaN; p.v3(~id)=NaN; p.v1_add(~id)=NaN;

p.lon=v.lon; p.lat=v.lat; p.lm=v.lm0; aa0=v.aa0; %id=~isnan(aa);
nyr1=100; nyr2=100; mskopt=0; num=30; N=365*100;
v=v0.ar; a0=squeeze(v.frqday); s0=squeeze(std(v.frqday_all,1)); n0=a0*N;
v=w1.ar; a1=squeeze(v.frqday); s1=squeeze(std(v.frqday_all,1)); n1=a1*N;
v=w2.ar; a2=squeeze(v.frqday); s2=squeeze(std(v.frqday_all,1)); n2=a2*N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff*100/p.dT1; p.v4=a; p.dv4=mean(mean(a.*aa0)); p.isig4=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff*100/p.dT2; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig;

v=v0.tc; a0=squeeze(v.frqday); s0=squeeze(std(v.frqday_all,1)); n0=a0*N;
v=w1.tc; a1=squeeze(v.frqday); s1=squeeze(std(v.frqday_all,1)); n1=a1*N;
v=w2.tc; a2=squeeze(v.frqday); s2=squeeze(std(v.frqday_all,1)); n2=a2*N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff*100/p.dT1; p.v7=a; p.dv7=mean(mean(a.*aa0)); p.isig7=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff*100/p.dT2; p.v8=a; p.dv8=mean(mean(a.*aa0)); p.isig8=isig;

v=v0.mc; a0=squeeze(v.frqday); s0=squeeze(std(v.frqday_all,1)); n0=a0*N;
v=w1.mc; a1=squeeze(v.frqday); s1=squeeze(std(v.frqday_all,1)); n1=a1*N;
v=w2.mc; a2=squeeze(v.frqday); s2=squeeze(std(v.frqday_all,1)); n2=a2*N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff*100/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0)); p.isig10=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff*100/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0)); p.isig11=isig;
plot_pattern_effect_Fig2(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
a1='SPEAR-pattern;'; a2='Observed-pattern;'; a3='Uniform-pattern;';
del='$~\Delta$';
s1='precip'; s2='AR precip'; s3='TS precip'; s4='MCS precip';
p.s1 =strcat(a1,del,s1); p.s2 =strcat(a2,del,s1); p.s3 =strcat(a3,del,s1);
p.s4 =strcat(del,s2); p.s5 =strcat(del,s2); p.s6 =strcat(del,s2);
p.s7 =strcat(del,s3); p.s8 =strcat(del,s3); p.s9 =strcat(del,s3);
p.s10=strcat(del,s4); p.s11=strcat(del,s4); p.s12=strcat(del,s4);
p.unit0='mm/day/K'; p.unit='mm/day/K'; p.unit_bar=p.unit; p.pos1=-0.08;
p.vname='pcp'; p.cmin1=-1; p.cmax1=1; p.cmin2=-0.5; p.cmax2=0.5;p.co='k';
p.cmin3=-0.5; p.cmax3=0.5; p.cmin4=-0.5; p.cmax4=0.5;
p.do_add=1; p.show='off';
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa;
a0=z.v0.sfc.tref.tavg0;
a =z.w1.sfc.tref.tavg0-a0; p.dT1=mean(mean(a.*aa));
a =z.w2.sfc.tref.tavg0-a0; p.dT2=mean(mean(a.*aa));
imk=z.v0.sfc.ice.tavg0;  aa0=aa; p.v1_add=a0; p.v1_addbin=[1 5 9], p.v1_co='c';
%a0=z.v0.sfc.pcp.tavg0; 
%a=(z.w1.sfc.pcp.tavg0-a0)/p.dT1; p.v1=a; p.dv1=mean(mean(a.*aa0));
%a=(z.w2.sfc.pcp.tavg0-a0)/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0));

v=v0.ar; p.lm=v.lm; aa0=v.aa; p.lon=v.lon; p.lat=v.lat; 
nyr1=100; nyr2=100; mskopt=0; num=30; N=365*100;
v=v0.ar; a=squeeze(v.prday_av_ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=squeeze(v.frqday)*N;
v=w1.ar; a=squeeze(v.prday_av_ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=squeeze(v.frqday)*N;
v=w2.ar; a=squeeze(v.prday_av_ann); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=squeeze(v.frqday)*N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v1=a; p.dv1=mean(mean(a.*aa0)); p.isig1=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0)); p.isig2=isig;

v=v0.ar; a=squeeze(v.prday_idwei_ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=squeeze(v.frqday)*N;
v=w1.ar; a=squeeze(v.prday_idwei_ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=squeeze(v.frqday)*N;
v=w2.ar; a=squeeze(v.prday_idwei_ann); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=squeeze(v.frqday)*N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v4=a; p.dv4=mean(mean(a.*aa0)); p.isig4=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig;

v=v0.tc; a=squeeze(v.prday_idwei_ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=squeeze(v.frqday)*N;
v=w1.tc; a=squeeze(v.prday_idwei_ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=squeeze(v.frqday)*N;
v=w2.tc; a=squeeze(v.prday_idwei_ann); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=squeeze(v.frqday)*N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v7=a; p.dv7=mean(mean(a.*aa0)); p.isig7=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v8=a; p.dv8=mean(mean(a.*aa0)); p.isig8=isig;

v=v0.mc; a=squeeze(v.prday_idwei_ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=squeeze(v.frqday)*N;
v=w1.mc; a=squeeze(v.prday_idwei_ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=squeeze(v.frqday)*N;
v=w2.mc; a=squeeze(v.prday_idwei_ann); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=squeeze(v.frqday)*N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0)); p.isig10=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0)); p.isig11=isig;
p.vname='Fig3'; plot_pattern_effect_Figs(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig4%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
a1='SPEAR-pattern;'; a2='Observed-pattern;'; a3='Uniform-pattern;';
del=' $\Delta$'; s0='R; net'; s1='R; clear-sky; '; s2='(SW CRE); '; s3='(LW CRE); ';
p.s1 =strcat(a1,del,s0); p.s2 =strcat(a2,del,s0); p.s3 =strcat(a3,del,s0);
p.s4 =strcat(del,s1); p.s5 =strcat(del,s1); p.s6 =strcat(del,s1);
p.s7 =strcat(del,s2); p.s8 =strcat(del,s2); p.s9 =strcat(del,s2);
p.s10=strcat(del,s3); p.s11=strcat(del,s3); p.s12=strcat(del,s3);
p.unit0='W/m2/K'; p.unit='W/m2/K'; p.unit_bar=p.unit; p.pos1=-0.08;
p.vname='toarad'; p.cmin1=-5.5; p.cmax1=5.5; p.cmin2=-5.5; p.cmax2=5.5;p.co='k';
p.cmin3=-5.5; p.cmax3=5.5; p.cmin4=-5.5; p.cmax4=5.5; p.cmin5=-5.5; p.cmax5=5.5; 
p.do_add=0; p.show='off';
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa;
a0=z.v0.sfc.tref.tavg0;
a =z.w1.sfc.tref.tavg0-a0; p.dT1=mean(mean(a.*aa));
a =z.w2.sfc.tref.tavg0-a0; p.dT2=mean(mean(a.*aa));
imk=z.v0.sfc.ice.tavg0;  aa0=aa;

v=v0.ar; p.lm=v.lm; aa0=v.aa; p.lon=v.lon; p.lat=v.lat; 
nyr1=100; nyr2=100; mskopt=0; num=30; N=365*100;
v=v0.ar; a=squeeze(v.netrad_av_ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=squeeze(v.frqday)*N;
v=w1.ar; a=squeeze(v.netrad_av_ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=squeeze(v.frqday)*N;
v=w2.ar; a=squeeze(v.netrad_av_ann); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=squeeze(v.frqday)*N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v1=a; p.dv1=mean(mean(a.*aa0)); p.isig1=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0)); p.isig2=isig;

v=v0.ar; a=squeeze(v.netradclr_av_ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=squeeze(v.frqday)*N;
v=w1.ar; a=squeeze(v.netradclr_av_ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=squeeze(v.frqday)*N;
v=w2.ar; a=squeeze(v.netradclr_av_ann); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=squeeze(v.frqday)*N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v4=a; p.dv4=mean(mean(a.*aa0)); p.isig4=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig;

v=v0.ar; a=squeeze(v.swcf_av_ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=squeeze(v.frqday)*N;
v=w1.ar; a=squeeze(v.swcf_av_ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=squeeze(v.frqday)*N;
v=w2.ar; a=squeeze(v.swcf_av_ann); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=squeeze(v.frqday)*N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v7=a; p.dv7=mean(mean(a.*aa0)); p.isig7=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v8=a; p.dv8=mean(mean(a.*aa0)); p.isig8=isig;

v=v0.ar; a=squeeze(v.lwcf_av_ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=squeeze(v.frqday)*N;
v=w1.ar; a=squeeze(v.lwcf_av_ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=squeeze(v.frqday)*N;
v=w2.ar; a=squeeze(v.lwcf_av_ann); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=squeeze(v.frqday)*N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0)); p.isig10=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0)); p.isig11=isig;
p.vname='Fig4'; plot_pattern_effect_Fig4(p)

v=v0.ar; p.lon0=v.lon; p.lat0=v.lat; p.lm0=v.lm; aa0=v.aa;
v=v0; a0=v.p2.netrad_av;
v=w1; a=squeeze(v.p2.netrad_av-a0)/p.dT1; p.v1=a; p.dv1=mean(mean(a.*aa0));
v=w2; a=squeeze(v.p2.netrad_av-a0)/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0));
v=w0; a=squeeze(v.p2.netrad_av-a0)/p.dT3; p.v3=a; p.dv3=mean(mean(a.*aa0));
v=v0.ar; p.lon=v.lon; p.lat=v.lat; p.lm=v.lm; aa0=v.aa; id=~isnan(aa);
v=v0; a0=v.p2.netradclr_av; 
v=w1; a=squeeze(v.p2.netradclr_av-a0)/p.dT1; p.v4=a; p.dv4=mean(mean(a.*aa0));
v=w2; a=squeeze(v.p2.netradclr_av-a0)/p.dT2; p.v5=a; p.dv5=mean(mean(a.*aa0));
v=w0; a=squeeze(v.p2.netradclr_av-a0)/p.dT3; p.v6=a; p.dv6=mean(mean(a.*aa0));
v=v0; a0=v.p2.swcf_av;
v=w1; a=squeeze(v.p2.swcf_av-a0)/p.dT1; p.v7=a; p.dv7=mean(mean(a.*aa0));
v=w2; a=squeeze(v.p2.swcf_av-a0)/p.dT2; p.v8=a; p.dv8=mean(mean(a.*aa0));
v=w0; a=squeeze(v.p2.swcf_av-a0)/p.dT3; p.v9=a; p.dv9=mean(mean(a.*aa0));
v=v0; a0=v.p2.lwcf_av; 
v=w1; a=squeeze(v.p2.lwcf_av-a0)/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0));
v=w2; a=squeeze(v.p2.lwcf_av-a0)/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0));
v=w0; a=squeeze(v.p2.lwcf_av-a0)/p.dT3; p.v12=a; p.dv12=mean(mean(a.*aa0));
plot_2d_8panel_wp_Fig3(p); %plot_2d_12panel_wp_Fig3(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%wet/non-wet day frequency change and associated clear-sky OLR and SWCF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
a1='SPEAR-pattern;'; a2='Observed-pattern;'; a3='Uniform-pattern;';
del='$~\Delta$'; s1='(wet days)'; s2='(OLR-clr); wet days'; s3='(OLR-clr); wet days'; 
s4='(SW CRE); non-wet days'; s5='(SW CRE); non-wet days';
p.s1 =strcat(a1,del,s1); p.s2 =strcat(a2,del,s1); p.s3 =strcat(a3,del,s1);
p.s4 =strcat(del,s2); p.s5 =strcat(del,s2); p.s6 =strcat(del,s2);
p.s7 =strcat(del,s3); p.s8 =strcat(del,s3); p.s9 =strcat(del,s3);
p.s10=strcat(del,s4); p.s11=strcat(del,s4); p.s12=strcat(del,s4);
p.s13=strcat(del,s4); p.s14=strcat(del,s4); p.s15=strcat(del,s4);
p.tit=''; p.unit0='\%/K'; p.unit='W/m2/K'; p.unit_bar='\%/K (W/m2/K)'; p.pos1=-0.08;
p.vname='dwet'; p.cmin1=-10; p.cmax1=10; p.cmin2=-15; p.cmax2=15;p.co='k';
p.cmin3=-15; p.cmax3=15; p.cmin4=-8; p.cmax4=8; p.cmin5=-8; p.cmax5=8; 
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa;
a0=z.v0.sfc.tref.tavg0;
a =z.w1.sfc.tref.tavg0-a0; p.dT1=mean(mean(a.*aa));
a =z.w2.sfc.tref.tavg0-a0; p.dT2=mean(mean(a.*aa));
a =z.w0.sfc.tref.tavg0-a0; p.dT3=mean(mean(a.*aa));
imk=z.v0.sfc.ice.tavg0; id=~(s.lm>0|imk>0); a=aa(id); aa0=a/mean(a);
v=v0.pr; p.lon0=v.lon; p.lat0=v.lat; p.lm0=v.lm; p.show='off';
a0=squeeze(v.frqday); p.v1_add=a0*100; p.v1_addbin=[25 50 75], p.v1_co='k';
v=v0.pr; p.lon=v.lon; p.lat=v.lat; p.lm=v.lm; aa0=v.aa; id=~isnan(aa);
v=v0; a0=v.pr.frqday;
v=w1; a=squeeze(v.pr.frqday-a0)*100/p.dT1; p.v1=a; p.dv1=mean(mean(a.*aa0));
v=w2; a=squeeze(v.pr.frqday-a0)*100/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0));
v=w0; a=squeeze(v.pr.frqday-a0)*100/p.dT3; p.v3=a; p.dv3=mean(mean(a.*aa0));
v=v0; a0=v.pr.rlutcs_idwei; p.v4_add=squeeze(v.pr.rlutcs_idavg); p.v4_addbin=[250:5:300], p.v4_co='c';
v=w1; a=squeeze(v.pr.rlutcs_idwei-a0)/p.dT1; p.v4=a; p.dv4=mean(mean(a.*aa0));
v=w2; a=squeeze(v.pr.rlutcs_idwei-a0)/p.dT2; p.v5=a; p.dv5=mean(mean(a.*aa0));
v=w0; a=squeeze(v.pr.rlutcs_idwei-a0)/p.dT3; p.v6=a; p.dv6=mean(mean(a.*aa0));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%delta F * CTL RLUTCS intensity for non-Wet days%%%%%%%%%%
a0=p.v4_add; a0(isnan(a0))=0;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=w1; a=a0.*p.v1/100; p.v7=a; p.dv7=mean(mean(a.*aa0));
v=w2; a=a0.*p.v2/100; p.v8=a; p.dv8=mean(mean(a.*aa0));
v=w0; a=a0.*p.v3/100; p.v9=a; p.dv9=mean(mean(a.*aa0));
v=v0; p.v7_addbin=[-70:10:-10], p.v7_co='k';%%%%%%%%%%%%%%
n1=v.pd.frqday; n2=v.pc.frqday;
p.v7_add=squeeze((v.pd.swcf_idavg.*n1+v.pc.swcf_idavg.*n2)./(n1+n2));
v=v0; a0=v.pr.swcf_av-v.pr.swcf_idwei; n1=v.pd.frqday; n2=v.pc.frqday;
v=w1; a=squeeze(v.pr.swcf_av-v.pr.swcf_idwei-a0)/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0));
v=w2; a=squeeze(v.pr.swcf_av-v.pr.swcf_idwei-a0)/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0));
v=w0; a=squeeze(v.pr.swcf_av-v.pr.swcf_idwei-a0)/p.dT3; p.v12=a; p.dv12=mean(mean(a.*aa0));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%delta F * CTL SWCF intensity for non-Wet days (not big term) %%%
%v=v0; n1=v.pd.frqday; n2=v.pc.frqday; 
%a0=squeeze((v.pd.swcf_idavg.*n1+v.pc.swcf_idavg.*n2)./(n1+n2));a0(isnan(a0))=0;
%v=w1; a=a0.*squeeze(v.pd.frqday+v.pc.frqday-n1-n2)/p.dT1; p.v13=a; p.dv13=mean(mean(a.*aa0));
%v=w2; a=a0.*squeeze(v.pd.frqday+v.pc.frqday-n1-n2)/p.dT2; p.v14=a; p.dv14=mean(mean(a.*aa0));
%v=w0; a=a0.*squeeze(v.pd.frqday+v.pc.frqday-n1-n2)/p.dT3; p.v15=a; p.dv15=mean(mean(a.*aa0));
%delta SWCF intensiy * CTL F for non-Wet days (big term)%%%%%%%%%
v=v0; n1=v.pd.frqday; n2=v.pc.frqday; a0=squeeze((v.pd.swcf_idavg.*n1+v.pc.swcf_idavg.*n2)./(n1+n2));
v=w1; n1=v.pd.frqday; n2=v.pc.frqday; a=squeeze((v.pd.swcf_idavg.*n1+v.pc.swcf_idavg.*n2)./(n1+n2))-a0;a=a/p.dT1;p.v13=a; p.dv13=mean(mean(a.*aa0));
v=w2; n1=v.pd.frqday; n2=v.pc.frqday; a=squeeze((v.pd.swcf_idavg.*n1+v.pc.swcf_idavg.*n2)./(n1+n2))-a0;a=a/p.dT2;p.v14=a; p.dv14=mean(mean(a.*aa0));
v=w0; n1=v.pd.frqday; n2=v.pc.frqday; a=squeeze((v.pd.swcf_idavg.*n1+v.pc.swcf_idavg.*n2)./(n1+n2))-a0;a=a/p.dT3;p.v15=a; p.dv15=mean(mean(a.*aa0));
plot_2d_10panel_wp_Fig4(p); %plot_2d_15panel_wp_Fig4(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
a1='SPEAR-pattern;'; a2='Observed-pattern;'; a3='Uniform-pattern;';
del='$\Delta$ '; s1='Storm day freq'; s2='WET day freq'; 
s3='Drizzle day freq'; s4='NonPrecip day freq';
p.s1 =strcat(a1,del,s1); p.s2 =strcat(a2,del,s1); p.s3 =strcat(a3,del,s1);
p.s4 =strcat(del,s2); p.s5 =strcat(del,s2); p.s6 =strcat(del,s2);
p.s7 =strcat(del,s3); p.s8 =strcat(del,s3); p.s9 =strcat(del,s3);
p.s10=strcat(del,s4); p.s11=strcat(del,s4); p.s12=strcat(del,s4);
p.tit=''; p.unit0='\%/K'; p.unit='\%/K'; p.unit_bar='\%/K'; p.pos1=-0.08;
p.vname='ddays'; p.cmin1=-2; p.cmax1=2; p.cmin2=-1; p.cmax2=1;p.co='k';
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa; p.show='off';
a0=z.v0.sfc.tref.tavg0;
a =z.w1.sfc.tref.tavg0-a0; p.dT1=mean(mean(a.*aa));
a =z.w2.sfc.tref.tavg0-a0; p.dT2=mean(mean(a.*aa));
a =z.w0.sfc.tref.tavg0-a0; p.dT3=mean(mean(a.*aa));
imk=z.v0.sfc.ice.tavg0; id=~(s.lm>0|imk>0); a=aa(id); aa0=a/mean(a);
v=v0.al; p.lon0=v.lon; p.lat0=v.lat; p.lm0=v.lm; p.show='off';
a0=squeeze(v.frqday); p.v1_add=a0; p.v1_addbin=[280:2:302], p.v1_co='k';
v=v0.al; p.lon=v.lon; p.lat=v.lat; p.lm=v.lm; aa0=v.aa; id=~isnan(aa);
v=v0; a0=v.al.frqday;
v=w1; a=squeeze(v.al.frqday-a0)*100/p.dT1; p.v1=a; p.dv1=mean(mean(a.*aa0));
v=w2; a=squeeze(v.al.frqday-a0)*100/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0));
v=w0; a=squeeze(v.al.frqday-a0)*100/p.dT3; p.v3=a; p.dv3=mean(mean(a.*aa0));
v=v0; a0=v.pr.frqday;
v=w1; a=squeeze(v.pr.frqday-a0)*100/p.dT1; p.v4=a; p.dv4=mean(mean(a.*aa0));
v=w2; a=squeeze(v.pr.frqday-a0)*100/p.dT2; p.v5=a; p.dv5=mean(mean(a.*aa0));
v=w0; a=squeeze(v.pr.frqday-a0)*100/p.dT3; p.v6=a; p.dv6=mean(mean(a.*aa0));
a0=v0.p2.frqday-v0.pr.frqday;
v=w1; a=squeeze(v.p2.frqday-v.pr.frqday-a0)*100/p.dT1; p.v7=a; p.dv7=mean(mean(a.*aa0));
v=w2; a=squeeze(v.p2.frqday-v.pr.frqday-a0)*100/p.dT2; p.v8=a; p.dv8=mean(mean(a.*aa0));
v=w0; a=squeeze(v.p2.frqday-v.pr.frqday-a0)*100/p.dT3; p.v9=a; p.dv9=mean(mean(a.*aa0));
v=v0; a0=1-v.p2.frqday;
v=w1; a=squeeze(1-v.p2.frqday-a0)*100/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0));
v=w2; a=squeeze(1-v.p2.frqday-a0)*100/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0));
v=w0; a=squeeze(1-v.p2.frqday-a0)*100/p.dT3; p.v12=a; p.dv12=mean(mean(a.*aa0));
plot_2d_12panel_wp(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
a1='SPEAR-pattern;'; a2='Observed-pattern;'; a3='Uniform-pattern;';
del='\Delta'; s0='SWCRE'; del=strcat(del,s0);
s1='Drizzle days; '; s2='Wet days; '; s3='Non-precip days; ';
p.s1 =strcat(a1,del); p.s2 =strcat(a2,del); p.s3 =strcat(a3,del);
p.s4 =strcat(s1,del); p.s5 =strcat(s1,del); p.s6 =strcat(s1,del);
p.s7 =strcat(s2,del); p.s8 =strcat(s2,del); p.s9 =strcat(s2,del);
p.s10=strcat(s3,del); p.s11=strcat(s3,del); p.s12=strcat(s3,del);
p.unit0='W/m2/K'; p.unit='W/m2/K'; p.unit_bar=p.unit; p.pos1=-0.08;
p.vname='swcf'; p.cmin1=-5; p.cmax1=5; p.cmin2=-1; p.cmax2=1;p.co='k';
s =z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa;
a0=z.v0.sfc.tref.tavg0;
a =z.w1.sfc.tref.tavg0-a0; p.dT1=mean(mean(a.*aa));
a =z.w2.sfc.tref.tavg0-a0; p.dT2=mean(mean(a.*aa));
a =z.w0.sfc.tref.tavg0-a0; p.dT3=mean(mean(a.*aa));
imk=z.v0.sfc.ice.tavg0;  aa0=aa;
a0=z.v0.toa.swcf.tavg0; p.v1_add=a0; p.v1_addbin=[-60:20:-20]; p.v1_co='c';
a=(z.w1.toa.swcf.tavg0-a0)/p.dT1; p.v1=a; p.dv1=mean(mean(a.*aa0));
a=(z.w2.toa.swcf.tavg0-a0)/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0));
a=(z.w0.toa.swcf.tavg0-a0)/p.dT3; p.v3=a; p.dv3=mean(mean(a.*aa0));
v=v0.ar; p.lon=v.lon; p.lat=v.lat; p.lm=v.lm; aa0=v.aa; id=~isnan(aa);
v=v0; a0=v.p2.swcf_idwei-v.pr.swcf_idwei; %drizzle days
v=w1; a=squeeze(v.p2.swcf_idwei-v.pr.swcf_idwei-a0)/p.dT1; p.v4=a; p.dv4=mean(mean(a.*aa0));
v=w2; a=squeeze(v.p2.swcf_idwei-v.pr.swcf_idwei-a0)/p.dT2; p.v5=a; p.dv5=mean(mean(a.*aa0));
v=w0; a=squeeze(v.p2.swcf_idwei-v.pr.swcf_idwei-a0)/p.dT3; p.v6=a; p.dv6=mean(mean(a.*aa0));
v=v0; a0=v.pr.swcf_idwei; %wet days
v=w1; a=squeeze(v.pr.swcf_idwei-a0)/p.dT1; p.v7=a; p.dv7=mean(mean(a.*aa0));
v=w2; a=squeeze(v.pr.swcf_idwei-a0)/p.dT2; p.v8=a; p.dv8=mean(mean(a.*aa0));
v=w0; a=squeeze(v.pr.swcf_idwei-a0)/p.dT3; p.v9=a; p.dv9=mean(mean(a.*aa0));
v=v0; a0=v.al.swcf_idwei; %storm days
v=w1; a=squeeze(v.al.swcf_idwei-a0)/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0));
v=w2; a=squeeze(v.al.swcf_idwei-a0)/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0));
v=w0; a=squeeze(v.al.swcf_idwei-a0)/p.dT3; p.v12=a; p.dv12=mean(mean(a.*aa0));
v=v0; a0=v.p2.swcf_av-v.p2.swcf_idwei; %non-precip days
v=w1; a=squeeze(v.p2.swcf_av-v.p2.swcf_idwei-a0)/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0));
v=w2; a=squeeze(v.p2.swcf_av-v.p2.swcf_idwei-a0)/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0));
v=w0; a=squeeze(v.p2.swcf_av-v.p2.swcf_idwei-a0)/p.dT3; p.v12=a; p.dv12=mean(mean(a.*aa0));
plot_2d_12panel_wp(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
a1='SPEAR-pattern;'; a2='Observed-pattern;'; a3='Uniform-pattern;';
del='\Delta'; s0='LWCRE'; del=strcat(del,s0);
s1='Drizzle days; '; s2='Wet days; '; s3='Non-precip days; ';
p.s1 =strcat(a1,del); p.s2 =strcat(a2,del); p.s3 =strcat(a3,del);
p.s4 =strcat(s1,del); p.s5 =strcat(s1,del); p.s6 =strcat(s1,del);
p.s7 =strcat(s2,del); p.s8 =strcat(s2,del); p.s9 =strcat(s2,del);
p.s10=strcat(s3,del); p.s11=strcat(s3,del); p.s12=strcat(s3,del);
p.unit0='W/m2/K'; p.unit='W/m2/K'; p.unit_bar=p.unit; p.pos1=-0.08;
p.vname='lwcf'; p.cmin1=-5; p.cmax1=5; p.cmin2=-1; p.cmax2=1;p.co='k';
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa;
a0=z.v0.sfc.tref.tavg0;
a =z.w1.sfc.tref.tavg0-a0; p.dT1=mean(mean(a.*aa));
a =z.w2.sfc.tref.tavg0-a0; p.dT2=mean(mean(a.*aa));
a =z.w0.sfc.tref.tavg0-a0; p.dT3=mean(mean(a.*aa));
imk=z.v0.sfc.ice.tavg0;  aa0=aa;
a0=z.v0.toa.lwcf.tavg0; p.v1_add=a0; p.v1_addbin=[10:20:50]; p.v1_co='c';
a=(z.w1.toa.lwcf.tavg0-a0)/p.dT1; p.v1=a; p.dv1=mean(mean(a.*aa0));
a=(z.w2.toa.lwcf.tavg0-a0)/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0));
a=(z.w0.toa.lwcf.tavg0-a0)/p.dT3; p.v3=a; p.dv3=mean(mean(a.*aa0));
v=v0.ar; p.lon=v.lon; p.lat=v.lat; p.lm=v.lm; aa0=v.aa; id=~isnan(aa);
v=v0; a0=v.p2.lwcf_idwei-v.pr.lwcf_idwei; %drizzle days
v=w1; a=squeeze(v.p2.lwcf_idwei-v.pr.lwcf_idwei-a0)/p.dT1; p.v4=a; p.dv4=mean(mean(a.*aa0));
v=w2; a=squeeze(v.p2.lwcf_idwei-v.pr.lwcf_idwei-a0)/p.dT2; p.v5=a; p.dv5=mean(mean(a.*aa0));
v=w0; a=squeeze(v.p2.lwcf_idwei-v.pr.lwcf_idwei-a0)/p.dT3; p.v6=a; p.dv6=mean(mean(a.*aa0));
v=v0; a0=v.pr.lwcf_idwei; %wet days
v=w1; a=squeeze(v.pr.lwcf_idwei-a0)/p.dT1; p.v7=a; p.dv7=mean(mean(a.*aa0));
v=w2; a=squeeze(v.pr.lwcf_idwei-a0)/p.dT2; p.v8=a; p.dv8=mean(mean(a.*aa0));
v=w0; a=squeeze(v.pr.lwcf_idwei-a0)/p.dT3; p.v9=a; p.dv9=mean(mean(a.*aa0));
v=v0; a0=v.al.lwcf_idwei; %storm days
v=w1; a=squeeze(v.al.lwcf_idwei-a0)/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0));
v=w2; a=squeeze(v.al.lwcf_idwei-a0)/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0));
v=w0; a=squeeze(v.al.lwcf_idwei-a0)/p.dT3; p.v12=a; p.dv12=mean(mean(a.*aa0));
v=v0; a0=v.p2.lwcf_av-v.p2.lwcf_idwei; %non-precip days
v=w1; a=squeeze(v.p2.lwcf_av-v.p2.lwcf_idwei-a0)/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0));
v=w2; a=squeeze(v.p2.lwcf_av-v.p2.lwcf_idwei-a0)/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0));
v=w0; a=squeeze(v.p2.lwcf_av-v.p2.lwcf_idwei-a0)/p.dT3; p.v12=a; p.dv12=mean(mean(a.*aa0));
plot_2d_12panel_wp(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
a1='SPEAR-pattern;'; a2='Observed-pattern;'; a3='Uniform-pattern;';
del='\Delta'; s0='CLRRAD'; del=strcat(del,s0);
s1='Drizzle days; '; s2='Wet days; '; s3='Non-precip days; ';
p.s1 =strcat(a1,del); p.s2 =strcat(a2,del); p.s3 =strcat(a3,del);
p.s4 =strcat(s1,del); p.s5 =strcat(s1,del); p.s6 =strcat(s1,del);
p.s7 =strcat(s2,del); p.s8 =strcat(s2,del); p.s9 =strcat(s2,del);
p.s10=strcat(s3,del); p.s11=strcat(s3,del); p.s12=strcat(s3,del);
p.unit0='W/m2/K'; p.unit='W/m2/K'; p.unit_bar=p.unit; p.pos1=-0.08;
p.vname='netradclr'; p.cmin1=-5; p.cmax1=5; p.cmin2=-1; p.cmax2=1;p.co='k';
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa;
a0=z.v0.sfc.tref.tavg0;
a =z.w1.sfc.tref.tavg0-a0; p.dT1=mean(mean(a.*aa));
a =z.w2.sfc.tref.tavg0-a0; p.dT2=mean(mean(a.*aa));
a =z.w0.sfc.tref.tavg0-a0; p.dT3=mean(mean(a.*aa));
imk=z.v0.sfc.ice.tavg0;  aa0=aa;
a0=z.v0.toa.netrad_clr.tavg0; p.v1_add=a0; p.v1_addbin=[50:10:100]; p.v1_co='c';p.show='on';
a=(z.w1.toa.netrad_clr.tavg0-a0)/p.dT1; p.v1=a; p.dv1=mean(mean(a.*aa0));
a=(z.w2.toa.netrad_clr.tavg0-a0)/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0));
a=(z.w0.toa.netrad_clr.tavg0-a0)/p.dT3; p.v3=a; p.dv3=mean(mean(a.*aa0));
v=v0.ar; p.lon=v.lon; p.lat=v.lat; p.lm=v.lm; aa0=v.aa; id=~isnan(aa);
v=v0; a0=v.p2.netradclr_idwei-v.pr.netradclr_idwei; %drizzle days
v=w1; a=squeeze(v.p2.netradclr_idwei-v.pr.netradclr_idwei-a0)/p.dT1; p.v4=a; p.dv4=mean(mean(a.*aa0));
v=w2; a=squeeze(v.p2.netradclr_idwei-v.pr.netradclr_idwei-a0)/p.dT2; p.v5=a; p.dv5=mean(mean(a.*aa0));
v=w0; a=squeeze(v.p2.netradclr_idwei-v.pr.netradclr_idwei-a0)/p.dT3; p.v6=a; p.dv6=mean(mean(a.*aa0));
v=v0; a0=v.pr.netradclr_idwei; %wet days
v=w1; a=squeeze(v.pr.netradclr_idwei-a0)/p.dT1; p.v7=a; p.dv7=mean(mean(a.*aa0));
v=w2; a=squeeze(v.pr.netradclr_idwei-a0)/p.dT2; p.v8=a; p.dv8=mean(mean(a.*aa0));
v=w0; a=squeeze(v.pr.netradclr_idwei-a0)/p.dT3; p.v9=a; p.dv9=mean(mean(a.*aa0));
v=v0; a0=v.al.netradclr_idwei; %storm days
v=w1; a=squeeze(v.al.netradclr_idwei-a0)/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0));
v=w2; a=squeeze(v.al.netradclr_idwei-a0)/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0));
v=w0; a=squeeze(v.al.netradclr_idwei-a0)/p.dT3; p.v12=a; p.dv12=mean(mean(a.*aa0));
v=v0; a0=v.p2.netradclr_av-v.p2.netradclr_idwei; %non-precip days
v=w1; a=squeeze(v.p2.netradclr_av-v.p2.netradclr_idwei-a0)/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0));
v=w2; a=squeeze(v.p2.netradclr_av-v.p2.netradclr_idwei-a0)/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0));
v=w0; a=squeeze(v.p2.netradclr_av-v.p2.netradclr_idwei-a0)/p.dT3; p.v12=a; p.dv12=mean(mean(a.*aa0));
plot_2d_12panel_wp(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
a1='SPEAR-pattern;'; a2='Observed-pattern;'; a3='Uniform-pattern;';
del='\Delta'; s0='NETRAD'; del=strcat(del,s0);
s1='Drizzle days; '; s2='Wet days; '; s3='Non-precip days; ';
p.s1 =strcat(a1,del); p.s2 =strcat(a2,del); p.s3 =strcat(a3,del);
p.s4 =strcat(s1,del); p.s5 =strcat(s1,del); p.s6 =strcat(s1,del);
p.s7 =strcat(s2,del); p.s8 =strcat(s2,del); p.s9 =strcat(s2,del);
p.s10=strcat(s3,del); p.s11=strcat(s3,del); p.s12=strcat(s3,del);
p.unit0='W/m2/K'; p.unit='W/m2/K'; p.unit_bar=p.unit; p.pos1=-0.08;
p.vname='netrad'; p.cmin1=-5; p.cmax1=5; p.cmin2=-1; p.cmax2=1;p.co='k';
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa;
a0=z.v0.sfc.tref.tavg0;
a =z.w1.sfc.tref.tavg0-a0; p.dT1=mean(mean(a.*aa));
a =z.w2.sfc.tref.tavg0-a0; p.dT2=mean(mean(a.*aa));
a =z.w0.sfc.tref.tavg0-a0; p.dT3=mean(mean(a.*aa));
imk=z.v0.sfc.ice.tavg0;  aa0=aa;
a0=z.v0.toa.netrad.tavg0;
a=(z.w1.toa.netrad.tavg0-a0)/p.dT1; p.v1=a; p.dv1=mean(mean(a.*aa0));
a=(z.w2.toa.netrad.tavg0-a0)/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0));
a=(z.w0.toa.netrad.tavg0-a0)/p.dT3; p.v3=a; p.dv3=mean(mean(a.*aa0));
v=v0.ar; p.lon=v.lon; p.lat=v.lat; p.lm=v.lm; aa0=v.aa; id=~isnan(aa);
v=v0; a0=v.p2.netrad_idwei-v.pr.netrad_idwei; %drizzle days
v=w1; a=squeeze(v.p2.netrad_idwei-v.pr.netrad_idwei-a0)/p.dT1; p.v4=a; p.dv4=mean(mean(a.*aa0));
v=w2; a=squeeze(v.p2.netrad_idwei-v.pr.netrad_idwei-a0)/p.dT2; p.v5=a; p.dv5=mean(mean(a.*aa0));
v=w0; a=squeeze(v.p2.netrad_idwei-v.pr.netrad_idwei-a0)/p.dT3; p.v6=a; p.dv6=mean(mean(a.*aa0));
v=v0; a0=v.pr.netrad_idwei; %wet days
v=w1; a=squeeze(v.pr.netrad_idwei-a0)/p.dT1; p.v7=a; p.dv7=mean(mean(a.*aa0));
v=w2; a=squeeze(v.pr.netrad_idwei-a0)/p.dT2; p.v8=a; p.dv8=mean(mean(a.*aa0));
v=w0; a=squeeze(v.pr.netrad_idwei-a0)/p.dT3; p.v9=a; p.dv9=mean(mean(a.*aa0));
v=v0; a0=v.al.netrad_idwei; %storm days
v=w1; a=squeeze(v.al.netrad_idwei-a0)/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0));
v=w2; a=squeeze(v.al.netrad_idwei-a0)/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0));
v=w0; a=squeeze(v.al.netrad_idwei-a0)/p.dT3; p.v12=a; p.dv12=mean(mean(a.*aa0));
v=v0; a0=v.p2.netrad_av-v.p2.netrad_idwei; %non-precip days
v=w1; a=squeeze(v.p2.netrad_av-v.p2.netrad_idwei-a0)/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0));
v=w2; a=squeeze(v.p2.netrad_av-v.p2.netrad_idwei-a0)/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0));
v=w0; a=squeeze(v.p2.netrad_av-v.p2.netrad_idwei-a0)/p.dT3; p.v12=a; p.dv12=mean(mean(a.*aa0));
plot_2d_12panel_wp(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
a1='SPEAR-pattern;'; a2='Observed-pattern;'; a3='Uniform-pattern;';
del='\Delta'; s0='freq'; del=strcat(del,s0);
s1='Drizzle days; '; s2='Wet days; '; s3='Non-precip days; ';
p.s1 =strcat(a1,del); p.s2 =strcat(a2,del); p.s3 =strcat(a3,del);
p.s4 =strcat(s1,del); p.s5 =strcat(s1,del); p.s6 =strcat(s1,del);
p.s7 =strcat(s2,del); p.s8 =strcat(s2,del); p.s9 =strcat(s2,del);
p.s10=strcat(s3,del); p.s11=strcat(s3,del); p.s12=strcat(s3,del);
p.unit0='W/m2/K'; p.unit='%'; p.unit_bar=p.unit; p.pos1=-0.08;
p.vname='netrad-frqday'; p.cmin1=-5; p.cmax1=5; p.cmin2=-1; p.cmax2=1;p.co='k';
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa;
a0=z.v0.sfc.tref.tavg0;
a =z.w1.sfc.tref.tavg0-a0; p.dT1=mean(mean(a.*aa));
a =z.w2.sfc.tref.tavg0-a0; p.dT2=mean(mean(a.*aa));
a =z.w0.sfc.tref.tavg0-a0; p.dT3=mean(mean(a.*aa));
imk=z.v0.sfc.ice.tavg0;  aa0=aa;
a0=z.v0.toa.netrad.tavg0;
a=(z.w1.toa.netrad.tavg0-a0)/p.dT1; p.v1=a; p.dv1=mean(mean(a.*aa0));
a=(z.w2.toa.netrad.tavg0-a0)/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0));
a=(z.w0.toa.netrad.tavg0-a0)/p.dT3; p.v3=a; p.dv3=mean(mean(a.*aa0));
v=v0.ar; p.lon=v.lon; p.lat=v.lat; p.lm=v.lm; aa0=v.aa; id=~isnan(aa);
v=v0; a0=v.p2.frqday-v.pr.frqday; %drizzle days
v=w1; a=squeeze(v.p2.frqday-v.pr.frqday-a0)*100/p.dT1; p.v4=a; p.dv4=mean(mean(a.*aa0));
v=w2; a=squeeze(v.p2.frqday-v.pr.frqday-a0)*100/p.dT2; p.v5=a; p.dv5=mean(mean(a.*aa0));
v=w0; a=squeeze(v.p2.frqday-v.pr.frqday-a0)*100/p.dT3; p.v6=a; p.dv6=mean(mean(a.*aa0));
v=v0; a0=v.pr.frqday; %wet days
v=w1; a=squeeze(v.pr.frqday-a0)*100/p.dT1; p.v7=a; p.dv7=mean(mean(a.*aa0));
v=w2; a=squeeze(v.pr.frqday-a0)*100/p.dT2; p.v8=a; p.dv8=mean(mean(a.*aa0));
v=w0; a=squeeze(v.pr.frqday-a0)*100/p.dT3; p.v9=a; p.dv9=mean(mean(a.*aa0));
v=v0; a0=v.al.frqday; %storm days
v=w1; a=squeeze(v.al.frqday-a0)*100/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0));
v=w2; a=squeeze(v.al.frqday-a0)*100/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0));
v=w0; a=squeeze(v.al.frqday-a0)*100/p.dT3; p.v12=a; p.dv12=mean(mean(a.*aa0));
v=v0; a0=1-v.p2.frqday; %non-precip days
v=w1; a=squeeze(1-v.p2.frqday-a0)*100/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0));
v=w2; a=squeeze(1-v.p2.frqday-a0)*100/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0));
v=w0; a=squeeze(1-v.p2.frqday-a0)*100/p.dT3; p.v12=a; p.dv12=mean(mean(a.*aa0));
plot_2d_12panel_wp(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
a1='SPEAR-pattern;'; a2='Observed-pattern;'; a3='Uniform-pattern;';
del='$\Delta$'; s1=strcat(del,'NETRAD');
s2=strcat(del,'SWCRE'); s3=strcat(del,'LWCRE');s4=strcat(del,'CLRRAD');
p.s1 =strcat(a1, s1); p.s2 =strcat(a2, s1); p.s3 =strcat(a3, s1);
p.s4 =strcat(s2); p.s5 =strcat(s2); p.s6 =strcat(s2);
p.s7 =strcat(s3); p.s8 =strcat(s3); p.s9 =strcat(s3);
p.s10=strcat(s4); p.s11=strcat(s4); p.s12=strcat(s4);
p.unit0='W/m2/K'; p.unit='W/m2/K'; p.unit_bar=p.unit; p.pos1=-0.08;
p.vname='toarad'; p.cmin1=-5; p.cmax1=5; p.cmin2=-1; p.cmax2=1;p.co='k';
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa;
a0=z.v0.sfc.tref.tavg0;
a =z.w1.sfc.tref.tavg0-a0; p.dT1=mean(mean(a.*aa));
a =z.w2.sfc.tref.tavg0-a0; p.dT2=mean(mean(a.*aa));
a =z.w0.sfc.tref.tavg0-a0; p.dT3=mean(mean(a.*aa));
imk=z.v0.sfc.ice.tavg0;  aa0=aa;
a0=z.v0.toa.netrad.tavg0; p.do_add=0;
a=(z.w1.toa.netrad.tavg0-a0)/p.dT1; p.v1=a; p.dv1=mean(mean(a.*aa0));
a=(z.w2.toa.netrad.tavg0-a0)/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0));
a=(z.w0.toa.netrad.tavg0-a0)/p.dT3; p.v3=a; p.dv3=mean(mean(a.*aa0));
v=s; p.lon=v.lon; p.lat=v.lat; p.lm=v.lm; aa0=v.aa; id=~isnan(aa);
a0=z.v0.toa.swcf.tavg0;
a=(z.w1.toa.swcf.tavg0-a0)/p.dT1; p.v4=a; p.dv4=mean(mean(a.*aa0));
a=(z.w2.toa.swcf.tavg0-a0)/p.dT2; p.v5=a; p.dv5=mean(mean(a.*aa0));
a=(z.w0.toa.swcf.tavg0-a0)/p.dT3; p.v6=a; p.dv6=mean(mean(a.*aa0));
a0=z.v0.toa.lwcf.tavg0;
a=(z.w1.toa.lwcf.tavg0-a0)/p.dT1; p.v7=a; p.dv7=mean(mean(a.*aa0));
a=(z.w2.toa.lwcf.tavg0-a0)/p.dT2; p.v8=a; p.dv8=mean(mean(a.*aa0));
a=(z.w0.toa.lwcf.tavg0-a0)/p.dT3; p.v9=a; p.dv9=mean(mean(a.*aa0));
a0=z.v0.toa.netrad_clr.tavg0;
a=(z.w1.toa.netrad_clr.tavg0-a0)/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0));
a=(z.w2.toa.netrad_clr.tavg0-a0)/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0));
a=(z.w0.toa.netrad_clr.tavg0-a0)/p.dT3; p.v12=a; p.dv12=mean(mean(a.*aa0));
%a0=z.v0.toa.lwnet_clr.tavg0;
%a=(z.w1.toa.lwnet_clr.tavg0-a0)/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0));
%a=(z.w2.toa.lwnet_clr.tavg0-a0)/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0));
%a=(z.w0.toa.lwnet_clr.tavg0-a0)/p.dT3; p.v12=a; p.dv12=mean(mean(a.*aa0));
plot_2d_12panel_wp(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load observations%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip_cre/'; d=2; s='_readartcmcs_day_cre_new.mat';
expn='c192_obs'; diag='_diag3_adj1'; %diag1='_diag1_adj1';
yrs='_2001_2008_';
fext=strcat(yrs,'MC',  diag, s); fn=strcat(tpath,expn,fext); load(fn);ob.mc=v;
fext=strcat(yrs,'AL',  diag, s); fn=strcat(tpath,expn,fext); load(fn);ob.al=v;
%fext=strcat(yrs,'PB',  diag, s); fn=strcat(tpath,expn,fext); load(fn);ob.pb=v;
%fext=strcat(yrs,'PR01',diag, s); fn=strcat(tpath,expn,fext); load(fn);ob.pr=v;
yrs='_2001_2020_'; 
fext=strcat(yrs,'AR',  diag, s); fn=strcat(tpath,expn,fext); load(fn);ob.ar=v;
fext=strcat(yrs,'TC',  diag, s); fn=strcat(tpath,expn,fext); load(fn);ob.tc=v;
fext=strcat(yrs,'PR01',diag, s); fn=strcat(tpath,expn,fext); load(fn);ob.pr=v;
fext=strcat(yrs,'P02', diag, s); fn=strcat(tpath,expn,fext); load(fn);ob.p2=v;
fext=strcat(yrs,'PB',  diag, s); fn=strcat(tpath,expn,fext); load(fn);ob.pb=v;
fext=strcat(yrs,'PC',  diag, s); fn=strcat(tpath,expn,fext); load(fn);ob.pc=v;
fext=strcat(yrs,'PD',  diag, s); fn=strcat(tpath,expn,fext); load(fn);ob.pd=v;
%fext=strcat(yrs,'P01', diag, s); fn=strcat(tpath,expn,fext); load(fn);ob.p1=v;
%fext=strcat(yrs,'P00', diag, s); fn=strcat(tpath,expn,fext); load(fn);ob.p0=v;
%fext=strcat(yrs,'PA',  diag, s); fn=strcat(tpath,expn,fext); load(fn);ob.pa=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre_newer.mat';
expn='c192L33_am4p0_2010climo'; yrs='_2_101_'; diag='_diag1';
fext=strcat(yrs,'MC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.mc=v;
fext=strcat(yrs,'AR',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.ar=v;
fext=strcat(yrs,'TC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.tc=v;
fext=strcat(yrs,'AL',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.al=v;
fext=strcat(yrs,'PR01',diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.pr=v;
fext=strcat(yrs,'P02', diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.p2=v;
fext=strcat(yrs,'PB',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.pb=v;
fext=strcat(yrs,'PC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.pc=v;
fext=strcat(yrs,'PD',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.pd=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre_new.mat';
expn='c192L33_am4p0_2010climo_old_p4K'; yrs='_32_101_'; diag='_diag2';
fext=strcat(yrs,'MC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w0.mc=v;
fext=strcat(yrs,'AR',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w0.ar=v;
fext=strcat(yrs,'TC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w0.tc=v;
fext=strcat(yrs,'AL',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w0.al=v;
fext=strcat(yrs,'PR01',diag,s); fn=strcat(tpath,expn,fext); load(fn);w0.pr=v;
fext=strcat(yrs,'P02', diag,s); fn=strcat(tpath,expn,fext); load(fn);w0.p2=v;
fext=strcat(yrs,'PB',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w0.pb=v;
fext=strcat(yrs,'PC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w0.pc=v;
fext=strcat(yrs,'PD',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w0.pd=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre_newer.mat';
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear'; yrs='_2_101_'; diag='_diag1';
fext=strcat(yrs,'MC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w1.mc=v;
fext=strcat(yrs,'AR',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w1.ar=v;
fext=strcat(yrs,'TC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w1.tc=v;
fext=strcat(yrs,'AL',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w1.al=v;
fext=strcat(yrs,'PR01',diag,s); fn=strcat(tpath,expn,fext); load(fn);w1.pr=v;
fext=strcat(yrs,'P02', diag,s); fn=strcat(tpath,expn,fext); load(fn);w1.p2=v;
fext=strcat(yrs,'PB',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w1.pb=v;
fext=strcat(yrs,'PC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w1.pc=v;
fext=strcat(yrs,'PD',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w1.pd=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre_newer.mat';
expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2'; yrs='_2_101_'; diag='_diag1';
fext=strcat(yrs,'MC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.mc=v;
fext=strcat(yrs,'AR',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.ar=v;
fext=strcat(yrs,'TC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.tc=v;
fext=strcat(yrs,'AL',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.al=v;
fext=strcat(yrs,'PR01',diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.pr=v;
fext=strcat(yrs,'P02', diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.p2=v;
fext=strcat(yrs,'PB',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.pb=v;
fext=strcat(yrs,'PC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.pc=v;
fext=strcat(yrs,'PD',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.pd=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre_new.mat';
expn='c192L33_am4p0_2010climo_trend_1979_2020'; yrs='_2_101_'; diag='_diag1';
fext=strcat(yrs,'MC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w3.mc=v;
fext=strcat(yrs,'AL',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w3.al=v;
fext=strcat(yrs,'AR',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w3.ar=v;
fext=strcat(yrs,'TC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w3.tc=v;
fext=strcat(yrs,'PR01',diag,s); fn=strcat(tpath,expn,fext); load(fn);w3.pr=v;
fext=strcat(yrs,'P02', diag,s); fn=strcat(tpath,expn,fext); load(fn);w3.p2=v;
fext=strcat(yrs,'PB',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w3.pb=v;
fext=strcat(yrs,'PC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w3.pc=v;
fext=strcat(yrs,'PD',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w3.pd=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre_new.mat';
expn='c192L33_am4p0_2010climo_trend_1979_2020_p05'; yrs='_2_101_'; diag='_diag1';
fext=strcat(yrs,'MC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w4.mc=v;
fext=strcat(yrs,'AL',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w4.al=v;
fext=strcat(yrs,'AR',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w4.ar=v;
fext=strcat(yrs,'TC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w4.tc=v;
fext=strcat(yrs,'PR01',diag,s); fn=strcat(tpath,expn,fext); load(fn);w4.pr=v;
fext=strcat(yrs,'P02', diag,s); fn=strcat(tpath,expn,fext); load(fn);w4.p2=v;
fext=strcat(yrs,'PB',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w4.pb=v;
fext=strcat(yrs,'PC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w4.pc=v;
fext=strcat(yrs,'PD',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w4.pd=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre_new.mat';
expn='c192L33_am4p0_2010climo'; yrs='_2_101_'; diag='_diag1';
fext=strcat(yrs,'MC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.mc=v;
fext=strcat(yrs,'AL',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.al=v;
fext=strcat(yrs,'AR',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.ar=v;
fext=strcat(yrs,'TC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.tc=v;
fext=strcat(yrs,'PR01',diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.pr=v;
fext=strcat(yrs,'P02', diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.p2=v;
fext=strcat(yrs,'PB',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.pb=v;
fext=strcat(yrs,'PC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.pc=v;
fext=strcat(yrs,'PD',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v0.pd=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre_new.mat';
expn='c192L33_am4p0_2010climo_old'; yrs='_32_101_'; diag='_diag2';
fext=strcat(yrs,'MC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);c0.mc=v;
fext=strcat(yrs,'AL',  diag,s); fn=strcat(tpath,expn,fext); load(fn);c0.al=v;
fext=strcat(yrs,'AR',  diag,s); fn=strcat(tpath,expn,fext); load(fn);c0.ar=v;
fext=strcat(yrs,'TC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);c0.tc=v;
fext=strcat(yrs,'PR01',diag,s); fn=strcat(tpath,expn,fext); load(fn);c0.pr=v;
fext=strcat(yrs,'P02', diag,s); fn=strcat(tpath,expn,fext); load(fn);c0.p2=v;
fext=strcat(yrs,'PB',  diag,s); fn=strcat(tpath,expn,fext); load(fn);c0.pb=v;
fext=strcat(yrs,'PC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);c0.pc=v;
fext=strcat(yrs,'PD',  diag,s); fn=strcat(tpath,expn,fext); load(fn);c0.pd=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre_new.mat';
expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_1day'; yrs='_2001_2019_'; diag='_diag3';
fext=strcat(yrs,'MC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v2.mc=v;
fext=strcat(yrs,'AL',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v2.al=v;
fext=strcat(yrs,'AR',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v2.ar=v;
fext=strcat(yrs,'TC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v2.tc=v;
fext=strcat(yrs,'PR01',diag,s); fn=strcat(tpath,expn,fext); load(fn);v2.pr=v;
fext=strcat(yrs,'P02', diag,s); fn=strcat(tpath,expn,fext); load(fn);v2.p2=v;
fext=strcat(yrs,'PB',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v2.pb=v;
fext=strcat(yrs,'PC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v2.pc=v;
fext=strcat(yrs,'PD',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v2.pd=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre_new.mat';
expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_1day_p2K'; yrs='_2001_2019_'; diag='_diag3';
fext=strcat(yrs,'MC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.mc=v;
fext=strcat(yrs,'AL',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.al=v;
fext=strcat(yrs,'AR',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.ar=v;
fext=strcat(yrs,'TC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.tc=v;
fext=strcat(yrs,'PR01',diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.pr=v;
fext=strcat(yrs,'P02', diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.p2=v;
fext=strcat(yrs,'PB',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.pb=v;
fext=strcat(yrs,'PC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.pc=v;
fext=strcat(yrs,'PD',  diag,s); fn=strcat(tpath,expn,fext); load(fn);w2.pd=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre_new.mat';
expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_skip_bot_v6'; yrs='_2001_2019_'; diag='_diag3';
fext=strcat(yrs,'MC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v3.mc=v;
fext=strcat(yrs,'AL',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v3.al=v;
fext=strcat(yrs,'AR',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v3.ar=v;
fext=strcat(yrs,'TC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v3.tc=v;
fext=strcat(yrs,'PR01',diag,s); fn=strcat(tpath,expn,fext); load(fn);v3.pr=v;
fext=strcat(yrs,'P02', diag,s); fn=strcat(tpath,expn,fext); load(fn);v3.p2=v;
fext=strcat(yrs,'PB',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v3.pb=v;
fext=strcat(yrs,'PC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v3.pc=v;
fext=strcat(yrs,'PD',  diag,s); fn=strcat(tpath,expn,fext); load(fn);v3.pd=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v=v0; p.vn='clm_frqday';
p.z1=squeeze(v.p2.frqday)*100;   
p.z3=squeeze(v.pr.frqday)*100; 
p.z4=squeeze(v.ar.frqday)*100;
p.z5=squeeze(v.tc.frqday)*100;    
p.z6=squeeze(v.mc.frqday)*100;    
p.z7=squeeze(v.al.frqday)*100;    
p.z2=p.z1-p.z3;
p.z8=p.z3-p.z7;                          %global area weighted mean=26.999
%p.z8=squeeze(v.pb.frqday)*100;           %global area weighted mean=29.510
%ob.pb.frqday=ob.pb.frqday*0.26999/0.2951; %this difference is due to different run length for MC
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) frequency of precipitation days'; 
p.s2='(b) frequency of drizzle days'; 
p.s3='(c) frequency of wet days'; 
p.s4='(d) frequency of AR days'; 
p.s5='(e) frequency of TS days';
p.s6='(f) frequency of MCS days'; 
p.s7='(g) frequency of storm (AR+TS+MCS) days'; 
p.s8='(h) frequency of wet non-storm days';
a=[0 100]; p.c1=a; p.un='\%'; p.fsize=8; p.optit=4; p.opt=1;p.nn=256;
a=[0 100]; p.c2=a; p.c3=a;
a=[0 40];  p.c4=a; p.c5=a; p.c6=a; p.c7=[0 60]; p.c8=p.c7;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.dtas=2.27; %dTAS between c192L33_am4p0_amip_HIRESMIP_HX_p2K and c192L33_am4p0_amip_HIRESMIP_HX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===FigA0===: annual frequency of P-days %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_frqday'; vm=v0;
%vx=w0; p.vn='wp0_m_clm_frqday'; p.dtas=4.32;  c1=-5; c2=5; c3=-1; c4=1;
vx=w1; p.vn='wp1_m_clm_frqday'; p.dtas=1.161;  c1=-5; c2=5; c3=-2; c4=2;
vx=w2; p.vn='wp2_m_clm_frqday'; p.dtas=1.185;  c1=-5; c2=5; c3=-2; c4=2;
%vx=w3; p.vn='wp3_m_clm_frqday'; p.dtas=1.185;  c1=-5; c2=5; c3=-2; c4=2;
%vx=w4; p.vn='wp4_m_clm_frqday'; p.dtas=1.066;  c1=-5; c2=5; c3=-2; c4=2;%p.dtas=1;
p.z1=squeeze(vx.p2.frqday-v.p2.frqday)*100/p.dtas;
p.z3=squeeze(vx.pr.frqday-v.pr.frqday)*100/p.dtas;
p.z4=squeeze(vx.ar.frqday-v.ar.frqday)*100/p.dtas;
p.z5=squeeze(vx.tc.frqday-v.tc.frqday)*100/p.dtas;
p.z6=squeeze(vx.mc.frqday-v.mc.frqday)*100/p.dtas;
p.z7=squeeze(vx.al.frqday-v.al.frqday)*100/p.dtas;
p.z2=p.z1-p.z3;
%p.z8=p.z3-p.z7;
p.z8=squeeze(vx.pb.frqday-v.pb.frqday)*100/p.dtas;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) frequency of precipitation days'; 
p.s2='(b) frequency of drizzle days'; 
p.s3='(c) frequency of wet days'; 
p.s4='(d) frequency of AR days'; 
p.s5='(e) frequency of TS days';
p.s6='(f) frequency of MCS days'; 
p.s7='(g) frequency of storm (AR+TS+MCS) days'; 
p.s8='(h) frequency of wet non-storm days';
a=[c1 c2]; p.c1=a; p.un='\%/K'; p.fsize=8; p.optit=4; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a;
a=[c3 c4]; p.c4=a; p.c5=a; p.c6=a; p.c7=[c1 c2]; p.c8=p.c7;
plot_2d_8panel(p)
%plot_2d_6panel_frqday(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===FigA2===: annual precipitation from P-days %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_prday_idwei'; vm=v;
%vx=w0; p.vn='wp0_m_clm_prday_idwei'; p.dtas=4.320;c1=-1;c2=1;c3=-0.2;c4=0.2;p.un='mm/day/K';
%vx=w1; p.vn='wp1_m_clm_prday_idwei'; p.dtas=1.161;c1=-1;c2=1;c3=-0.5;c4=0.5;p.un='mm/day/K';
vx=w2; p.vn='wp2_m_clm_prday_idwei'; p.dtas=1.185;c1=-1;c2=1;c3=-0.5;c4=0.5;p.un='mm/day/K';
%vx=w4; p.vn='wp4_m_clm_prday_idwei'; p.dtas=1.066;c1=-1;c2=1;c3=-0.5;c4=0.5;p.un='mm/day/K';
p.z1=squeeze(vx.ar.prday_av   -v.ar.prday_av)   /p.dtas;   
p.z2=squeeze(vx.p2.prday_idwei-v.p2.prday_idwei)/p.dtas;   
p.z3=squeeze(vx.pr.prday_idwei-v.pr.prday_idwei)/p.dtas; 
p.z4=squeeze(vx.ar.prday_idwei-v.ar.prday_idwei)/p.dtas;
p.z5=squeeze(vx.tc.prday_idwei-v.tc.prday_idwei)/p.dtas;    
p.z6=squeeze(vx.mc.prday_idwei-v.mc.prday_idwei)/p.dtas;    
p.z7=squeeze(vx.al.prday_idwei-v.al.prday_idwei)/p.dtas;    
%p.z8=p.z3-p.z7;
p.z8=squeeze(vx.pb.prday_idwei-v.pb.prday_idwei)/p.dtas;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean Pr';
p.s2='(b) annual mean Pr from precip days'; 
p.s3='(c) annual mean Pr from wet days'; 
p.s4='(d) annual mean Pr from AR days'; 
p.s5='(e) annual mean Pr from TS days';
p.s6='(f) annual mean Pr from MCS days'; 
p.s7='(g) annual mean Pr from storm (AR+TS+MCS) days';
p.s8='(h) annual mean Pr from wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=8; p.optit=4; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c3 c4]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===FigA3===: PR averaged over various P-days %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; p.expn='c192'; %all time mean prday from each weather type
p.vname='prday_idavg'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_prday_idavg'; vm=v;
vx=w0; p.vn='wp0_m_clm_prday_idavg'; p.dtas=4.320;c1=-1;c2=1;c3=-1;c4=1;p.un='mm/day/K';
%vx=w1; p.vn='wp1_m_clm_prday_idavg'; p.dtas=0.528;c1=-1;c2=1;c3=-1;c4=1;p.un='mm/day/K';
%vx=w2; p.vn='wp2_m_clm_prday_idavg'; p.dtas=1.170;c1=-1;c2=1;c3=-1;c4=1;p.un='mm/day/K';
nyr=vx.ar.nyr; aa=p.aa; dtas=p.dtas; mskopt=1; no=30;
v=vm.pd; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum);
v=vx.pd; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z1=zx/dtas; p.Z1=pd/dtas; p.z1_avg=(a2av-a1av)/dtas; p.Z1_avg=p.z1_avg/a1av*100;
v=vm.pc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum);
v=vx.pc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z2=zx/dtas; p.Z2=pd/dtas; p.z2_avg=(a2av-a1av)/dtas; p.Z2_avg=p.z2_avg/a1av*100;
v=vm.pr; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum);
v=vx.pr; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z3=zx/dtas; p.Z3=pd/dtas; p.z3_avg=(a2av-a1av)/dtas; p.Z3_avg=p.z3_avg/a1av*100;
v=vm.ar; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum);
v=vx.ar; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z4=zx/dtas; p.Z4=pd/dtas; p.z4_avg=(a2av-a1av)/dtas; p.Z4_avg=p.z4_avg/a1av*100;
v=vm.tc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum);
v=vx.tc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z5=zx/dtas; p.Z5=pd/dtas; p.z5_avg=(a2av-a1av)/dtas; p.Z5_avg=p.z5_avg/a1av*100;
v=vm.mc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum);
v=vx.mc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z6=zx/dtas; p.Z6=pd/dtas; p.z6_avg=(a2av-a1av)/dtas; p.Z6_avg=p.z6_avg/a1av*100;
v=vm.al; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum);
v=vx.al; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z7=zx/dtas; p.Z7=pd/dtas; p.z7_avg=(a2av-a1av)/dtas; p.Z7_avg=p.z7_avg/a1av*100;
v=vm.pb; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum);
v=vx.pb; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z8=zx/dtas; p.Z8=pd/dtas; p.z8_avg=(a2av-a1av)/dtas; p.Z8_avg=p.z8_avg/a1av*100;
do_per_change=false; do_per_change=true; 
if do_per_change
  c1=-8; c2=8; c3=-8; c4=8; p.un='\%/K'; p.vn=strcat(p.vn,'_per');
  p.z1=p.Z1;  p.z2=p.Z2;  p.z3=p.Z3;  p.z4=p.Z4;
  p.z5=p.Z5;  p.z6=p.Z6;  p.z7=p.Z7;  p.z8=p.Z8;
  p.z1_avg=p.Z1_avg;  p.z2_avg=p.Z2_avg;  p.z3_avg=p.Z3_avg;  p.z4_avg=p.Z4_avg;
  p.z5_avg=p.Z5_avg;  p.z6_avg=p.Z6_avg;  p.z7_avg=p.Z7_avg;  p.z8_avg=p.Z8_avg;
end
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) Pr avg, non-precip days';
p.s2='(b) Pr avg, drizzle days'; 
p.s3='(c) Pr avg, all wet days';
p.s4='(d) Pr avg, AR days'; 
p.s5='(e) Pr avg, TS days';
p.s6='(f) Pr avg, MCS days'; 
p.s7='(g) Pr avg, storm (AR+TS+MCS) days';
p.s8='(h) Pr avg, wet non-storm days'; 
a=[c1 c2]; p.c1=a; p.c2=a; p.fsize=8; p.optit=9; p.opt=2; p.nn=256;
a=[c3 c4]; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a; 
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===FigA4===: fraction of convective precipitation from P-days %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='obs_fprc_idwei';
vx=w1; p.vn='wp1_m_clm_fprc_idwei'; p.dtas=0.528;c1=-2;c2=2;c3=-2;c4=2;p.un='\%/K';
%vx=w2; p.vn='wp2_m_clm_fprc_idwei'; p.dtas=1.170;c1=-2;c2=2;c3=-2;c4=2;p.un='\%/K';
p.z1=squeeze(vx.ar.fprc_av   -v.ar.fprc_av)   /p.dtas*100;   
p.z2=squeeze(vx.p2.fprc_idwei-v.p2.fprc_idwei)/p.dtas*100;   
p.z3=squeeze(vx.pr.fprc_idwei-v.pr.fprc_idwei)/p.dtas*100; 
p.z4=squeeze(vx.ar.fprc_idwei-v.ar.fprc_idwei)/p.dtas*100;
p.z5=squeeze(vx.tc.fprc_idwei-v.tc.fprc_idwei)/p.dtas*100;    
p.z6=squeeze(vx.mc.fprc_idwei-v.mc.fprc_idwei)/p.dtas*100;    
p.z7=squeeze(vx.al.fprc_idwei-v.al.fprc_idwei)/p.dtas*100;    
p.z8=p.z3-p.z7;
%p.z8=squeeze(vx.pd.fprc_idwei-v.pd.fprc_idwei)/p.dtas;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean CPF';
p.s2='(b) annual mean CPF from precip days'; 
p.s3='(c) annual mean CPF from wet days'; 
p.s4='(d) annual mean CPF from AR days'; 
p.s5='(e) annual mean CPF from TS days';
p.s6='(f) annual mean CPF from MCS days'; 
p.s7='(g) annual mean CPF from storm (AR+TS+MCS) days';
p.s8='(h) annual mean CPF from wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=8; p.optit=4; p.opt=5;p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c3 c4]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===FigA4===: fraction of convective precip averaged over various P-days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; p.expn='c192'; %all time mean fprc from each weather type
p.vname='fprc_idavg'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_fprc_idavg'; vm=v;
vx=w1; p.vn='wp1_m_clm_fprc_idavg'; p.dtas=0.528;c1=-2;c2=2;c3=-2;c4=2;p.un='\%/K';
vx=w2; p.vn='wp2_m_clm_fprc_idavg'; p.dtas=1.170;c1=-2;c2=2;c3=-2;c4=2;p.un='\%/K';
nyr=vx.ar.nyr; aa=p.aa; dtas=p.dtas; mskopt=1;
v=vm.pd; a1=squeeze(v.fprc_idavg); s1=squeeze(v.fprc_idstd); n1=squeeze(v.id_sum);
v=vx.pd; a2=squeeze(v.fprc_idavg); s2=squeeze(v.fprc_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z1=zx/dtas; p.Z1=pd/dtas; p.z1_avg=(a2av-a1av)/dtas; p.Z1_avg=p.z1_avg/a1av*100;
v=vm.pc; a1=squeeze(v.fprc_idavg); s1=squeeze(v.fprc_idstd); n1=squeeze(v.id_sum);
v=vx.pc; a2=squeeze(v.fprc_idavg); s2=squeeze(v.fprc_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z2=zx/dtas; p.Z2=pd/dtas; p.z2_avg=(a2av-a1av)/dtas; p.Z2_avg=p.z2_avg/a1av*100;
v=vm.pr; a1=squeeze(v.fprc_idavg); s1=squeeze(v.fprc_idstd); n1=squeeze(v.id_sum);
v=vx.pr; a2=squeeze(v.fprc_idavg); s2=squeeze(v.fprc_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z3=zx/dtas; p.Z3=pd/dtas; p.z3_avg=(a2av-a1av)/dtas; p.Z3_avg=p.z3_avg/a1av*100;
v=vm.ar; a1=squeeze(v.fprc_idavg); s1=squeeze(v.fprc_idstd); n1=squeeze(v.id_sum);
v=vx.ar; a2=squeeze(v.fprc_idavg); s2=squeeze(v.fprc_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z4=zx/dtas; p.Z4=pd/dtas; p.z4_avg=(a2av-a1av)/dtas; p.Z4_avg=p.z4_avg/a1av*100;
v=vm.tc; a1=squeeze(v.fprc_idavg); s1=squeeze(v.fprc_idstd); n1=squeeze(v.id_sum);
v=vx.tc; a2=squeeze(v.fprc_idavg); s2=squeeze(v.fprc_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z5=zx/dtas; p.Z5=pd/dtas; p.z5_avg=(a2av-a1av)/dtas; p.Z5_avg=p.z5_avg/a1av*100;
v=vm.mc; a1=squeeze(v.fprc_idavg); s1=squeeze(v.fprc_idstd); n1=squeeze(v.id_sum);
v=vx.mc; a2=squeeze(v.fprc_idavg); s2=squeeze(v.fprc_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z6=zx/dtas; p.Z6=pd/dtas; p.z6_avg=(a2av-a1av)/dtas; p.Z6_avg=p.z6_avg/a1av*100;
v=vm.al; a1=squeeze(v.fprc_idavg); s1=squeeze(v.fprc_idstd); n1=squeeze(v.id_sum);
v=vx.al; a2=squeeze(v.fprc_idavg); s2=squeeze(v.fprc_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z7=zx/dtas; p.Z7=pd/dtas; p.z7_avg=(a2av-a1av)/dtas; p.Z7_avg=p.z7_avg/a1av*100;
v=vm.pb; a1=squeeze(v.fprc_idavg); s1=squeeze(v.fprc_idstd); n1=squeeze(v.id_sum);
v=vx.pb; a2=squeeze(v.fprc_idavg); s2=squeeze(v.fprc_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z8=zx/dtas; p.Z8=pd/dtas; p.z8_avg=(a2av-a1av)/dtas; p.Z8_avg=p.z8_avg/a1av*100;
do_per_change=false; %do_per_change=true; 
p.z1=p.z1*100;p.z2=p.z2*100;p.z3=p.z3*100;p.z4=p.z4*100;
p.z5=p.z5*100;p.z6=p.z6*100;p.z7=p.z7*100;p.z8=p.z8*100;
p.z1_avg=p.z1_avg*100;p.z2_avg=p.z2_avg*100;p.z3_avg=p.z3_avg*100;p.z4_avg=p.z4_avg*100;
p.z5_avg=p.z5_avg*100;p.z6_avg=p.z6_avg*100;p.z7_avg=p.z7_avg*100;p.z8_avg=p.z8_avg*100;
if do_per_change
  c1=-8; c2=8; p.un='/K'; p.vn='p2k_m_ctl_fprc_idavg_per'
  p.z1=p.Z1;  p.z2=p.Z2;  p.z3=p.Z3;  p.z4=p.Z4;
  p.z5=p.Z5;  p.z6=p.Z6;  p.z7=p.Z7;  p.z8=p.Z8;
  p.z1_avg=p.Z1_avg;  p.z2_avg=p.Z2_avg;  p.z3_avg=p.Z3_avg;  p.z4_avg=p.Z4_avg;
  p.z5_avg=p.Z5_avg;  p.z6_avg=p.Z6_avg;  p.z7_avg=p.Z7_avg;  p.z8_avg=p.Z8_avg;
end
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) CPF avg, non-precip days';
p.s2='(b) CPF avg, drizzle days'; 
p.s3='(c) CPF avg, all wet days)';
p.s4='(d) CPF avg, AR days'; 
p.s5='(e) CPF avg, TS days';
p.s6='(f) CPF avg, MCS days'; 
p.s7='(g) CPF avg, storm (AR+TS+MCS) days';
p.s8='(h) CPF avg, wet non-storm days'; 
a=[c1 c2];
p.c1=a; p.c2=a; p.fsize=8; p.optit=9; p.opt=2;p.nn=128;
p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a; 
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===FigA4===: annual PRW from P-days %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; %all time mean prw from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_prw_idwei'; vm=v;
vx=w0; p.vn='wp0_m_clm_prw_idwei'; p.dtas=4.32;c1=-4;c2=4;c3=-2;c4=2;p.un='kg/m2/K';
%vx=w1; p.vn='wp1_m_clm_prw_idwei'; p.dtas=1.161;c1=-4;c2=4;c3=-2;c4=2;p.un='kg/m2/K';
%vx=w2; p.vn='wp2_m_clm_prw_idwei'; p.dtas=1.185;c1=-4;c2=4;c3=-2;c4=2;p.un='kg/m2/K';
p.z1=squeeze(vx.ar.prw_av   -v.ar.prw_av)   /p.dtas;
p.z2=squeeze(vx.p2.prw_idwei-v.p2.prw_idwei)/p.dtas;
p.z3=squeeze(vx.pr.prw_idwei-v.pr.prw_idwei)/p.dtas;
p.z4=squeeze(vx.ar.prw_idwei-v.ar.prw_idwei)/p.dtas;
p.z5=squeeze(vx.tc.prw_idwei-v.tc.prw_idwei)/p.dtas;
p.z6=squeeze(vx.mc.prw_idwei-v.mc.prw_idwei)/p.dtas;
p.z7=squeeze(vx.al.prw_idwei-v.al.prw_idwei)/p.dtas;
p.z8=p.z3-p.z7;
%p.z8=squeeze(vx.pd.prw_idwei-v.pd.prw_idwei)/p.dtas;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean PRW';
p.s2='(b) annual mean PRW from precip days'; 
p.s3='(c) annual mean PRW from wet days'; 
p.s4='(d) annual mean PRW from AR days'; 
p.s5='(e) annual mean PRW from TS days';
p.s6='(f) annual mean PRW from MCS days'; 
p.s7='(g) annual mean PRW from storm (AR+TS+MCS) days';
p.s8='(h) annual mean PRW from wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=8; p.optit=4; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c3 c4]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===FigA5===: PRW averaged over various P-days %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=ob.ar; p.expn='c192'; %all time mean prday from each weather type
p.vname='prw_idavg'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =ob; p.vn='obs_prw_idavg'; vm=v;
vx=v0; p.vn='mod_m_obs_prw_idavg'; v=vx; p.dtas=1;c1=-5;c2=5;c3=-5;c4=5;p.un='kg/m2';
vx=w1; p.vn='p2k_m_ctl_prw_idavg'; vm=v1; p.dtas=2.27;c1=-5;c2=5;c3=-5;c4=5;p.un='kg/m2/K';
nyr=vx.ar.nyr; aa=p.aa; dtas=p.dtas; mskopt=1;
v=vm.pd; a1=squeeze(v.prw_idavg); s1=squeeze(v.prw_idstd); n1=squeeze(v.id_sum);
v=vx.pd; a2=squeeze(v.prw_idavg); s2=squeeze(v.prw_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z1=zx/dtas; p.Z1=pd/dtas; p.z1_avg=(a2av-a1av)/dtas; p.Z1_avg=p.z1_avg/a1av*100;
v=vm.pc; a1=squeeze(v.prw_idavg); s1=squeeze(v.prw_idstd); n1=squeeze(v.id_sum);
v=vx.pc; a2=squeeze(v.prw_idavg); s2=squeeze(v.prw_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z2=zx/dtas; p.Z2=pd/dtas; p.z2_avg=(a2av-a1av)/dtas; p.Z2_avg=p.z2_avg/a1av*100;
v=vm.pr; a1=squeeze(v.prw_idavg); s1=squeeze(v.prw_idstd); n1=squeeze(v.id_sum);
v=vx.pr; a2=squeeze(v.prw_idavg); s2=squeeze(v.prw_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z3=zx/dtas; p.Z3=pd/dtas; p.z3_avg=(a2av-a1av)/dtas; p.Z3_avg=p.z3_avg/a1av*100;
v=vm.ar; a1=squeeze(v.prw_idavg); s1=squeeze(v.prw_idstd); n1=squeeze(v.id_sum);
v=vx.ar; a2=squeeze(v.prw_idavg); s2=squeeze(v.prw_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z4=zx/dtas; p.Z4=pd/dtas; p.z4_avg=(a2av-a1av)/dtas; p.Z4_avg=p.z4_avg/a1av*100;
v=vm.tc; a1=squeeze(v.prw_idavg); s1=squeeze(v.prw_idstd); n1=squeeze(v.id_sum);
v=vx.tc; a2=squeeze(v.prw_idavg); s2=squeeze(v.prw_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z5=zx/dtas; p.Z5=pd/dtas; p.z5_avg=(a2av-a1av)/dtas; p.Z5_avg=p.z5_avg/a1av*100;
v=vm.mc; a1=squeeze(v.prw_idavg); s1=squeeze(v.prw_idstd); n1=squeeze(v.id_sum);
v=vx.mc; a2=squeeze(v.prw_idavg); s2=squeeze(v.prw_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z6=zx/dtas; p.Z6=pd/dtas; p.z6_avg=(a2av-a1av)/dtas; p.Z6_avg=p.z6_avg/a1av*100;
v=vm.al; a1=squeeze(v.prw_idavg); s1=squeeze(v.prw_idstd); n1=squeeze(v.id_sum);
v=vx.al; a2=squeeze(v.prw_idavg); s2=squeeze(v.prw_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z7=zx/dtas; p.Z7=pd/dtas; p.z7_avg=(a2av-a1av)/dtas; p.Z7_avg=p.z7_avg/a1av*100;
v=vm.pb; a1=squeeze(v.prw_idavg); s1=squeeze(v.prw_idstd); n1=squeeze(v.id_sum);
v=vx.pb; a2=squeeze(v.prw_idavg); s2=squeeze(v.prw_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z8=zx/dtas; p.Z8=pd/dtas; p.z8_avg=(a2av-a1av)/dtas; p.Z8_avg=p.z8_avg/a1av*100;
do_per_change=false; do_per_change=true; 
if do_per_change
  c1=-12; c2=12; p.un='\%/K'; p.vn='p2k_m_ctl_prw_idavg_per'
  p.z1=p.Z1;  p.z2=p.Z2;  p.z3=p.Z3;  p.z4=p.Z4;
  p.z5=p.Z5;  p.z6=p.Z6;  p.z7=p.Z7;  p.z8=p.Z8;
  p.z1_avg=p.Z1_avg;  p.z2_avg=p.Z2_avg;  p.z3_avg=p.Z3_avg;  p.z4_avg=p.Z4_avg;
  p.z5_avg=p.Z5_avg;  p.z6_avg=p.Z6_avg;  p.z7_avg=p.Z7_avg;  p.z8_avg=p.Z8_avg;
end
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) PRW avg, non-precip days';
p.s2='(b) PRW avg, drizzle days'; 
p.s3='(c) PRW avg, all wet days)';
p.s4='(d) PRW avg, AR days'; 
p.s5='(e) PRW avg, TS days';
p.s6='(f) PRW avg, MCS days'; 
p.s7='(g) PRW avg, storm (AR+TS+MCS) days';
p.s8='(h) PRW avg, wet non-storm days'; 
a=[c1 c2]; %a=[-30 30]; 
p.c1=a; p.c2=a; p.fsize=8; p.optit=9; p.opt=5; p.nn=256;
p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a; 
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===Fig1===: annual mean LWCF contributed from AR/TS/MSC %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_lwcf_idwei'; vm=v0;
%vx=w0; p.vn='wp0_m_clm_lwcf_idwei'; p.dtas=4.320;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
%vx=w1; p.vn='wp1_m_clm_lwcf_idwei'; p.dtas=1.161;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
 vx=w2; p.vn='wp2_m_clm_lwcf_idwei'; p.dtas=1.185;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
%vx=w3; p.vn='wp3_m_clm_lwcf_idwei'; p.dtas=1.185;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
%vx=w4; p.vn='wp4_m_clm_lwcf_idwei'; p.dtas=1.066;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
p.z1=squeeze(vx.ar.lwcf_av   -v.ar.lwcf_av)   /p.dtas;
p.z2=squeeze(vx.p2.lwcf_idwei-v.p2.lwcf_idwei)/p.dtas;
p.z3=squeeze(vx.pr.lwcf_idwei-v.pr.lwcf_idwei)/p.dtas;
p.z4=squeeze(vx.ar.lwcf_idwei-v.ar.lwcf_idwei)/p.dtas;
p.z5=squeeze(vx.tc.lwcf_idwei-v.tc.lwcf_idwei)/p.dtas;
p.z6=squeeze(vx.mc.lwcf_idwei-v.mc.lwcf_idwei)/p.dtas;
p.z7=squeeze(vx.al.lwcf_idwei-v.al.lwcf_idwei)/p.dtas;    
%p.z8=p.z3-p.z7;
p.z8=squeeze(vx.pb.lwcf_idwei-v.pb.lwcf_idwei)/p.dtas;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean LW CRE';
p.s2='(b) LW CRE from precip days'; 
p.s3='(c) LW CRE from wet days'; 
p.s4='(d) LW CRE from AR days'; 
p.s5='(e) LW CRE from TS days';
p.s6='(f) LW CRE from MCS days'; 
p.s7='(g) LW CRE from storm (AR+TS+MCS) days';
p.s8='(h) LW CRE from wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=8; p.optit=4; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c3 c4]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===Fig2===: LWCF averaged over storm days %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; p.expn='c192'; %all time mean prday from each weather type
p.vname='lwcf_idavg'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_lwcf_idavg'; vm=v;
vx=w0; p.vn='wp0_m_clm_lwcf_idavg'; p.dtas=4.320;c1=-4;c2=4;c3=-4;c4=4;p.un='W/m2/K';
%vx=w1; p.vn='wp1_m_clm_lwcf_idavg'; p.dtas=0.528;c1=-4;c2=4;c3=-4;c4=4;p.un='W/m2/K';
%vx=w2; p.vn='wp2_m_clm_lwcf_idavg'; p.dtas=1.170;c1=-4;c2=4;c3=-4;c4=4;p.un='W/m2/K';
nyr=vx.ar.nyr; aa=p.aa; dtas=p.dtas; mskopt=1;
v=vm.pd; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum);
v=vx.pd; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z1=zx/dtas; p.Z1=pd/dtas; p.z1_avg=(a2av-a1av)/dtas; p.Z1_avg=p.z1_avg/a1av*100;
v=vm.pc; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum);
v=vx.pc; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z2=zx/dtas; p.Z2=pd/dtas; p.z2_avg=(a2av-a1av)/dtas; p.Z2_avg=p.z2_avg/a1av*100;
v=vm.pr; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum);
v=vx.pr; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z3=zx/dtas; p.Z3=pd/dtas; p.z3_avg=(a2av-a1av)/dtas; p.Z3_avg=p.z3_avg/a1av*100;
v=vm.ar; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum);
v=vx.ar; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z4=zx/dtas; p.Z4=pd/dtas; p.z4_avg=(a2av-a1av)/dtas; p.Z4_avg=p.z4_avg/a1av*100;
v=vm.tc; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum);
v=vx.tc; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z5=zx/dtas; p.Z5=pd/dtas; p.z5_avg=(a2av-a1av)/dtas; p.Z5_avg=p.z5_avg/a1av*100;
v=vm.mc; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum);
v=vx.mc; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z6=zx/dtas; p.Z6=pd/dtas; p.z6_avg=(a2av-a1av)/dtas; p.Z6_avg=p.z6_avg/a1av*100;
v=vm.al; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum);
v=vx.al; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z7=zx/dtas; p.Z7=pd/dtas; p.z7_avg=(a2av-a1av)/dtas; p.Z7_avg=p.z7_avg/a1av*100;
v=vm.pb; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum);
v=vx.pb; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z8=zx/dtas; p.Z8=pd/dtas; p.z8_avg=(a2av-a1av)/dtas; p.Z8_avg=p.z8_avg/a1av*100;
do_per_change=false; %do_per_change=true; 
if do_per_change
  c1=-10; c2=10; p.un='\%/K'; p.vn='p2k_m_ctl_lwcf_idavg_per'
  p.z1=p.Z1;  p.z2=p.Z2;  p.z3=p.Z3;  p.z4=p.Z4;
  p.z5=p.Z5;  p.z6=p.Z6;  p.z7=p.Z7;  p.z8=p.Z8;
  p.z1_avg=p.Z1_avg;  p.z2_avg=p.Z2_avg;  p.z3_avg=p.Z3_avg;  p.z4_avg=p.Z4_avg;
  p.z5_avg=p.Z5_avg;  p.z6_avg=p.Z6_avg;  p.z7_avg=p.Z7_avg;  p.z8_avg=p.Z8_avg;
end
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) LW CRE avg, non-precip days';
p.s2='(b) LW CRE avg, drizzle days'; 
p.s3='(c) LW CRE avg, all wet days)';
p.s4='(d) LW CRE avg, AR days'; 
p.s5='(e) LW CRE avg, TS days';
p.s6='(f) LW CRE avg, MCS days'; 
p.s7='(g) LW CRE avg, storm (AR+TS+MCS) days';
p.s8='(h) LW CRE avg, wet non-storm days'; 
a=[c1 c2];
p.c1=a; p.c2=a; p.un='W/m2'; p.fsize=8; p.optit=9; p.opt=5; p.nn=256;
p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a; 
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===Fig3===: annual mean SWCF contributed from AR/TS/MSC %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; p.expn='c192'; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_swcf_idwei';
%vx=w0; p.vn='wp0_m_clm_swcf_idwei';p.dtas=4.320;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
%vx=w1; p.vn='wp1_m_clm_swcf_idwei';p.dtas=1.161;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
vx=w2; p.vn='wp2_m_clm_swcf_idwei';p.dtas=1.185;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
%vx=w3; p.vn='wp3_m_clm_swcf_idwei';p.dtas=1.185;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
%vx=w4; p.vn='wp4_m_clm_swcf_idwei';p.dtas=1.066;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
p.z1=squeeze(vx.ar.swcf_av   -v.ar.swcf_av)   /p.dtas;
p.z2=squeeze(vx.p2.swcf_idwei-v.p2.swcf_idwei)/p.dtas;   
p.z3=squeeze(vx.pr.swcf_idwei-v.pr.swcf_idwei)/p.dtas; 
p.z4=squeeze(vx.ar.swcf_idwei-v.ar.swcf_idwei)/p.dtas;
p.z5=squeeze(vx.tc.swcf_idwei-v.tc.swcf_idwei)/p.dtas;    
p.z6=squeeze(vx.mc.swcf_idwei-v.mc.swcf_idwei)/p.dtas;    
p.z7=squeeze(vx.al.swcf_idwei-v.al.swcf_idwei)/p.dtas;    
p.z2=p.z2-p.z3; %p.z8=p.z3-p.z7; 
p.z8=squeeze(vx.pb.swcf_idwei-v.pb.swcf_idwei)/p.dtas;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean SW CRE';
p.s2='(b) SW CRE from drizzle days'; 
p.s3='(c) SW CRE from wet days'; 
p.s4='(d) SW CRE from AR days;'; 
p.s5='(e) SW CRE from TS days;';
p.s6='(f) SW CRE from MCS days;'; 
p.s7='(g) SW CRE from storm (AR+TS+MCS) days;';
p.s8='(h) SW CRE from wet non-storm days;';
a=[c1 c2]; p.c1=a; p.fsize=8; p.optit=4; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c3 c4]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===Fig4===: SWCF averaged over storm days %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; p.expn='c192'; %all time mean prday from each weather type
p.vname='swcf_idavg'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_swcf_idavg'; vm=v;
vx=w1; p.vn='wp1_m_clm_swcf_idavg'; p.dtas=0.528;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
%vx=w2; p.vn='wp2_m_clm_swcf_idavg'; p.dtas=1.170;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
nyr=vx.ar.nyr; aa=p.aa; dtas=p.dtas; mskopt=1;
v=vm.pd; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum);
v=vx.pd; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z1=zx/dtas; p.Z1=pd/dtas; p.z1_avg=(a2av-a1av)/dtas; p.Z1_avg=p.z1_avg/a1av*100;
v=vm.pc; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum);
v=vx.pc; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z2=zx/dtas; p.Z2=pd/dtas; p.z2_avg=(a2av-a1av)/dtas; p.Z2_avg=p.z2_avg/a1av*100;
v=vm.pr; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum);
v=vx.pr; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z3=zx/dtas; p.Z3=pd/dtas; p.z3_avg=(a2av-a1av)/dtas; p.Z3_avg=p.z3_avg/a1av*100;
v=vm.ar; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum);
v=vx.ar; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z4=zx/dtas; p.Z4=pd/dtas; p.z4_avg=(a2av-a1av)/dtas; p.Z4_avg=p.z4_avg/a1av*100;
v=vm.tc; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum);
v=vx.tc; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z5=zx/dtas; p.Z5=pd/dtas; p.z5_avg=(a2av-a1av)/dtas; p.Z5_avg=p.z5_avg/a1av*100;
v=vm.mc; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum);
v=vx.mc; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z6=zx/dtas; p.Z6=pd/dtas; p.z6_avg=(a2av-a1av)/dtas; p.Z6_avg=p.z6_avg/a1av*100;
v=vm.al; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum);
v=vx.al; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z7=zx/dtas; p.Z7=pd/dtas; p.z7_avg=(a2av-a1av)/dtas; p.Z7_avg=p.z7_avg/a1av*100;
v=vm.pb; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum);
v=vx.pb; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z8=zx/dtas; p.Z8=pd/dtas; p.z8_avg=(a2av-a1av)/dtas; p.Z8_avg=p.z8_avg/a1av*100;
do_per_change=false; %do_per_change=true; 
if do_per_change
  c1=-10; c2=10; p.un='\%/K'; p.vn=strcat(p.vn,'_per');
  p.z1=p.Z1;  p.z2=p.Z2;  p.z3=p.Z3;  p.z4=p.Z4;
  p.z5=p.Z5;  p.z6=p.Z6;  p.z7=p.Z7;  p.z8=p.Z8;
  p.z1_avg=p.Z1_avg;  p.z2_avg=p.Z2_avg;  p.z3_avg=p.Z3_avg;  p.z4_avg=p.Z4_avg;
  p.z5_avg=p.Z5_avg;  p.z6_avg=p.Z6_avg;  p.z7_avg=p.Z7_avg;  p.z8_avg=p.Z8_avg;
end
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) SW CRE avg, non-precip days';
p.s2='(b) SW CRE avg, drizzle days'; 
p.s3='(c) SW CRE avg, all wet days';
p.s4='(d) SW CRE avg, AR days'; 
p.s5='(e) SW CRE avg, TS days';
p.s6='(f) SW CRE avg, MCS days'; 
p.s7='(g) SW CRE avg, storm (AR+TS+MCS) days';
p.s8='(h) SW CRE avg, wet non-storm days'; 
a=[c1 c2]; p.c1=a; p.un='W/m2'; p.fsize=8; p.optit=9; p.opt=5; p.nn=256;
a=[c3 c4]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===Fig5===: annual mean total CRE contributed from AR/TS/MSC %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; p.expn='c192'; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_ttcf_idwei';
vx=w1; p.vn='wp1_m_clm_ttcf_idwei';p.dtas=1.161;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
vx=w2; p.vn='wp2_m_clm_ttcf_idwei';p.dtas=1.185;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
p.z1=squeeze(vx.ar.ttcf_av   -v.ar.ttcf_av)   /p.dtas;   
p.z2=squeeze(vx.p2.ttcf_idwei-v.p2.ttcf_idwei)/p.dtas;   
p.z3=squeeze(vx.pr.ttcf_idwei-v.pr.ttcf_idwei)/p.dtas; 
p.z4=squeeze(vx.ar.ttcf_idwei-v.ar.ttcf_idwei)/p.dtas;
p.z5=squeeze(vx.tc.ttcf_idwei-v.tc.ttcf_idwei)/p.dtas;    
p.z6=squeeze(vx.mc.ttcf_idwei-v.mc.ttcf_idwei)/p.dtas;    
p.z7=squeeze(vx.al.ttcf_idwei-v.al.ttcf_idwei)/p.dtas;    
p.z8=p.z3-p.z7;
%p.z8=squeeze(vx.pd.ttcf_idwei-v.pd.ttcf_idwei)/p.dtas;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean total CRE';
p.s2='(b) total CRE from precip days'; 
p.s3='(c) total CRE from wet days'; 
p.s4='(d) total CRE from AR days;'; 
p.s5='(e) total CRE from TS days;';
p.s6='(f) total CRE from MCS days;'; 
p.s7='(g) total CRE from storm (AR+TS+MCS) days;';
p.s8='(h) total CRE from wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=8; p.optit=4; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c3 c4]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===Fig6===: total CRE averaged over storm days %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; p.expn='c192'; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_ttcf_idavg'; vm=v;
vx=w1; p.vn='wp1_m_clm_ttcf_idavg'; p.dtas=0.528;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
%vx=w2; p.vn='wp2_m_clm_ttcf_idavg'; p.dtas=1.170;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
nyr=vx.ar.nyr; aa=p.aa; dtas=p.dtas; mskopt=1;
v=vm.pd; a1=squeeze(v.ttcf_idavg); s1=squeeze(v.ttcf_idstd); n1=squeeze(v.id_sum);
v=vx.pd; a2=squeeze(v.ttcf_idavg); s2=squeeze(v.ttcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z1=zx/dtas; p.Z1=pd/dtas; p.z1_avg=(a2av-a1av)/dtas; p.Z1_avg=p.z1_avg/a1av*100;
v=vm.pc; a1=squeeze(v.ttcf_idavg); s1=squeeze(v.ttcf_idstd); n1=squeeze(v.id_sum);
v=vx.pc; a2=squeeze(v.ttcf_idavg); s2=squeeze(v.ttcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z2=zx/dtas; p.Z2=pd/dtas; p.z2_avg=(a2av-a1av)/dtas; p.Z2_avg=p.z2_avg/a1av*100;
v=vm.pr; a1=squeeze(v.ttcf_idavg); s1=squeeze(v.ttcf_idstd); n1=squeeze(v.id_sum);
v=vx.pr; a2=squeeze(v.ttcf_idavg); s2=squeeze(v.ttcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z3=zx/dtas; p.Z3=pd/dtas; p.z3_avg=(a2av-a1av)/dtas; p.Z3_avg=p.z3_avg/a1av*100;
v=vm.ar; a1=squeeze(v.ttcf_idavg); s1=squeeze(v.ttcf_idstd); n1=squeeze(v.id_sum);
v=vx.ar; a2=squeeze(v.ttcf_idavg); s2=squeeze(v.ttcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z4=zx/dtas; p.Z4=pd/dtas; p.z4_avg=(a2av-a1av)/dtas; p.Z4_avg=p.z4_avg/a1av*100;
v=vm.tc; a1=squeeze(v.ttcf_idavg); s1=squeeze(v.ttcf_idstd); n1=squeeze(v.id_sum);
v=vx.tc; a2=squeeze(v.ttcf_idavg); s2=squeeze(v.ttcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z5=zx/dtas; p.Z5=pd/dtas; p.z5_avg=(a2av-a1av)/dtas; p.Z5_avg=p.z5_avg/a1av*100;
v=vm.mc; a1=squeeze(v.ttcf_idavg); s1=squeeze(v.ttcf_idstd); n1=squeeze(v.id_sum);
v=vx.mc; a2=squeeze(v.ttcf_idavg); s2=squeeze(v.ttcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z6=zx/dtas; p.Z6=pd/dtas; p.z6_avg=(a2av-a1av)/dtas; p.Z6_avg=p.z6_avg/a1av*100;
v=vm.al; a1=squeeze(v.ttcf_idavg); s1=squeeze(v.ttcf_idstd); n1=squeeze(v.id_sum);
v=vx.al; a2=squeeze(v.ttcf_idavg); s2=squeeze(v.ttcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z7=zx/dtas; p.Z7=pd/dtas; p.z7_avg=(a2av-a1av)/dtas; p.Z7_avg=p.z7_avg/a1av*100;
v=vm.pb; a1=squeeze(v.ttcf_idavg); s1=squeeze(v.ttcf_idstd); n1=squeeze(v.id_sum);
v=vx.pb; a2=squeeze(v.ttcf_idavg); s2=squeeze(v.ttcf_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z8=zx/dtas; p.Z8=pd/dtas; p.z8_avg=(a2av-a1av)/dtas; p.Z8_avg=p.z8_avg/a1av*100;
do_per_change=false; %do_per_change=true; 
if do_per_change
  c1=-10; c2=10; p.un='\%/K'; p.vn=strcat(p.vn,'_per');
  p.z1=p.Z1;  p.z2=p.Z2;  p.z3=p.Z3;  p.z4=p.Z4;
  p.z5=p.Z5;  p.z6=p.Z6;  p.z7=p.Z7;  p.z8=p.Z8;
  p.z1_avg=p.Z1_avg;  p.z2_avg=p.Z2_avg;  p.z3_avg=p.Z3_avg;  p.z4_avg=p.Z4_avg;
  p.z5_avg=p.Z5_avg;  p.z6_avg=p.Z6_avg;  p.z7_avg=p.Z7_avg;  p.z8_avg=p.Z8_avg;
end
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) total CRE avg, non-precip days';
p.s2='(b) total CRE avg, drizzle days'; 
p.s3='(c) total CRE avg, all wet days';
p.s4='(d) total CRE avg, AR days'; 
p.s5='(e) total CRE avg, TS days';
p.s6='(f) total CRE avg, MCS days'; 
p.s7='(g) total CRE avg, storm (AR+TS+MCS) days';
p.s8='(h) total CRE avg, wet non-storm days'; 
a=[c1 c2];  p.c1=a; p.fsize=8; p.optit=9; p.opt=5; p.nn=256;
a=[c3 c4]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig7: annual mean OLR contributed from AR/TS/MSC %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar;  %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_rlut_idwei';
vx=w1; p.vn='wp1_m_clm_rlut_idwei';p.dtas=1.161;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
vx=w2; p.vn='wp2_m_clm_rlut_idwei';p.dtas=1.185;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
p.z1=squeeze(vx.ar.rlut_av   -v.ar.rlut_av)   /p.dtas;   
p.z2=squeeze(vx.p2.rlut_idwei-v.p2.rlut_idwei)/p.dtas;   
p.z3=squeeze(vx.pr.rlut_idwei-v.pr.rlut_idwei)/p.dtas; 
p.z4=squeeze(vx.ar.rlut_idwei-v.ar.rlut_idwei)/p.dtas;
p.z5=squeeze(vx.tc.rlut_idwei-v.tc.rlut_idwei)/p.dtas;    
p.z6=squeeze(vx.mc.rlut_idwei-v.mc.rlut_idwei)/p.dtas;    
p.z7=squeeze(vx.al.rlut_idwei-v.al.rlut_idwei)/p.dtas;    
p.z8=p.z3-p.z7;
%p.z8=squeeze(vx.pd.rlut_idwei-v.pd.rlut_idwei)/p.dtas;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean OLR';
p.s2='(b) OLR from precip days'; 
p.s3='(c) OLR from wet days'; 
p.s4='(d) OLR from AR days;'; 
p.s5='(e) OLR from TS days;';
p.s6='(f) OLR from MCS days;'; 
p.s7='(g) OLR from storm (AR+TS+MCS) days;';
p.s8='(h) OLR from wet non-storm days';
a=[c1 c2]; p.c1=a; p.un='W/m2'; p.fsize=7; p.optit=4; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c3 c4]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig8: OLR averaged from all AR/TS/MSC days %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =ob; p.vn='obs_rlut_idavg'; vm=v;
vx=v0; p.vn='mod_m_obs_rlut_idavg'; v=vx; p.dtas=1;c1=-20;c2=20;c3=-20;c4=20;p.un='W/m2';
vx=w1; p.vn='p2k_m_ctl_rlut_idavg'; vm=v1; p.dtas=2.27;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
nyr=vx.ar.nyr; aa=p.aa; dtas=p.dtas; mskopt=1;
v=vm.pd; a1=squeeze(v.rlut_idavg); s1=squeeze(v.rlut_idstd); n1=squeeze(v.id_sum);
v=vx.pd; a2=squeeze(v.rlut_idavg); s2=squeeze(v.rlut_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z1=zx/dtas; p.Z1=pd/dtas; p.z1_avg=(a2av-a1av)/dtas; p.Z1_avg=p.z1_avg/a1av*100;
v=vm.pc; a1=squeeze(v.rlut_idavg); s1=squeeze(v.rlut_idstd); n1=squeeze(v.id_sum);
v=vx.pc; a2=squeeze(v.rlut_idavg); s2=squeeze(v.rlut_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z2=zx/dtas; p.Z2=pd/dtas; p.z2_avg=(a2av-a1av)/dtas; p.Z2_avg=p.z2_avg/a1av*100;
v=vm.pr; a1=squeeze(v.rlut_idavg); s1=squeeze(v.rlut_idstd); n1=squeeze(v.id_sum);
v=vx.pr; a2=squeeze(v.rlut_idavg); s2=squeeze(v.rlut_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z3=zx/dtas; p.Z3=pd/dtas; p.z3_avg=(a2av-a1av)/dtas; p.Z3_avg=p.z3_avg/a1av*100;
v=vm.ar; a1=squeeze(v.rlut_idavg); s1=squeeze(v.rlut_idstd); n1=squeeze(v.id_sum);
v=vx.ar; a2=squeeze(v.rlut_idavg); s2=squeeze(v.rlut_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z4=zx/dtas; p.Z4=pd/dtas; p.z4_avg=(a2av-a1av)/dtas; p.Z4_avg=p.z4_avg/a1av*100;
v=vm.tc; a1=squeeze(v.rlut_idavg); s1=squeeze(v.rlut_idstd); n1=squeeze(v.id_sum);
v=vx.tc; a2=squeeze(v.rlut_idavg); s2=squeeze(v.rlut_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z5=zx/dtas; p.Z5=pd/dtas; p.z5_avg=(a2av-a1av)/dtas; p.Z5_avg=p.z5_avg/a1av*100;
v=vm.mc; a1=squeeze(v.rlut_idavg); s1=squeeze(v.rlut_idstd); n1=squeeze(v.id_sum);
v=vx.mc; a2=squeeze(v.rlut_idavg); s2=squeeze(v.rlut_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z6=zx/dtas; p.Z6=pd/dtas; p.z6_avg=(a2av-a1av)/dtas; p.Z6_avg=p.z6_avg/a1av*100;
v=vm.al; a1=squeeze(v.rlut_idavg); s1=squeeze(v.rlut_idstd); n1=squeeze(v.id_sum);
v=vx.al; a2=squeeze(v.rlut_idavg); s2=squeeze(v.rlut_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z7=zx/dtas; p.Z7=pd/dtas; p.z7_avg=(a2av-a1av)/dtas; p.Z7_avg=p.z7_avg/a1av*100;
v=vm.pb; a1=squeeze(v.rlut_idavg); s1=squeeze(v.rlut_idstd); n1=squeeze(v.id_sum);
v=vx.pb; a2=squeeze(v.rlut_idavg); s2=squeeze(v.rlut_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z8=zx/dtas; p.Z8=pd/dtas; p.z8_avg=(a2av-a1av)/dtas; p.Z8_avg=p.z8_avg/a1av*100;
do_per_change=false; %do_per_change=true; 
if do_per_change
  c1=-10; c2=10; p.un='\%/K'; p.vn='p2k_m_ctl_rlut_idavg_per'
  p.z1=p.Z1;  p.z2=p.Z2;  p.z3=p.Z3;  p.z4=p.Z4;
  p.z5=p.Z5;  p.z6=p.Z6;  p.z7=p.Z7;  p.z8=p.Z8;
  p.z1_avg=p.Z1_avg;  p.z2_avg=p.Z2_avg;  p.z3_avg=p.Z3_avg;  p.z4_avg=p.Z4_avg;
  p.z5_avg=p.Z5_avg;  p.z6_avg=p.Z6_avg;  p.z7_avg=p.Z7_avg;  p.z8_avg=p.Z8_avg;
end
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) OLR avg, non-precip days';
p.s2='(b) OLR avg, drizzle days'; 
p.s3='(c) OLR avg, all wet days'; 
p.s4='(d) OLR avg, AR days;'; 
p.s5='(e) OLR avg, TS days;';
p.s6='(f) OLR avg, MCS days;'; 
p.s7='(g) OLR avg, storm (AR+TS+MCS) days;';
p.s8='(h) OLR avg, wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=7; p.optit=9; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c1 c2]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig9: annual mean clear-sky OLR contributed from AR/TS/MSC %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; p.expn='c192'; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='obs_rlutcs_idwei';
%vx=w0; p.vn='p2k_m_clm_rlutcs_idwei'; p.dtas=4.320;c1=-10;c2=10;c3=-2;c4=2;p.un='W/m2/K';
%vx=w1; p.vn='wp1_m_clm_rlutcs_idwei'; p.dtas=1.161;c1=-10;c2=10;c3=-2;c4=2;p.un='W/m2/K';
vx=w2; p.vn='wp2_m_clm_rlutcs_idwei'; p.dtas=1.185;c1=-10;c2=10;c3=-2;c4=2;p.un='W/m2/K';
p.z1=squeeze(vx.ar.rlutcs_av   -v.ar.rlutcs_av)   /p.dtas;   
p.z2=squeeze(vx.p2.rlutcs_idwei-v.p2.rlutcs_idwei)/p.dtas;   
p.z3=squeeze(vx.pr.rlutcs_idwei-v.pr.rlutcs_idwei)/p.dtas; 
p.z4=squeeze(vx.ar.rlutcs_idwei-v.ar.rlutcs_idwei)/p.dtas;
p.z5=squeeze(vx.tc.rlutcs_idwei-v.tc.rlutcs_idwei)/p.dtas;    
p.z6=squeeze(vx.mc.rlutcs_idwei-v.mc.rlutcs_idwei)/p.dtas;    
p.z7=squeeze(vx.al.rlutcs_idwei-v.al.rlutcs_idwei)/p.dtas;    
p.z8=p.z3-p.z7;
%p.z8=squeeze(vx.pb.rlutcs_idwei-v.pb.rlutcs_idwei)/p.dtas;    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean clear-sky OLR';
p.s2='(b) clear-sky OLR from precip days'; 
p.s3='(c) clear-sky OLR from wet days'; 
p.s4='(d) clear-sky OLR from AR days;'; 
p.s5='(e) clear-sky OLR from TS days;';
p.s6='(f) clear-sky OLR from MCS days;'; 
p.s7='(g) clear-sky OLR from storm (AR+TS+MCS) days;';
p.s8='(h) clear-sky OLR from wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=7; p.optit=4; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c1 c2]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig10: clear-sky OLR averaged from all AR/TS/MSC days %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='obs_rlutcs_idavg'; vm=v;
%vx=w0; p.vn='wp1_m_obs_rlutcs_idavg'; p.dtas=4.320;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
vx=w1; p.vn='wp1_m_clm_rlutcs_idavg'; p.dtas=1.161;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
%vx=w2; p.vn='wp2_m_clm_rlutcs_idavg'; p.dtas=1.185;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
nyr1=v.ar.nyr; nyr2=vx.ar.nyr; aa=p.aa; dtas=p.dtas; mskopt=1; no=30
v=vm.pd; a1=squeeze(v.rlutcs_idavg); s1=squeeze(v.rlutcs_idstd); n1=squeeze(v.id_sum);
v=vx.pd; a2=squeeze(v.rlutcs_idavg); s2=squeeze(v.rlutcs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z1=zx/dtas; p.Z1=pd/dtas; p.z1_avg=(a2av-a1av)/dtas; p.Z1_avg=p.z1_avg/a1av*100;
v=vm.pc; a1=squeeze(v.rlutcs_idavg); s1=squeeze(v.rlutcs_idstd); n1=squeeze(v.id_sum);
v=vx.pc; a2=squeeze(v.rlutcs_idavg); s2=squeeze(v.rlutcs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z2=zx/dtas; p.Z2=pd/dtas; p.z2_avg=(a2av-a1av)/dtas; p.Z2_avg=p.z2_avg/a1av*100;
v=vm.pr; a1=squeeze(v.rlutcs_idavg); s1=squeeze(v.rlutcs_idstd); n1=squeeze(v.id_sum);
v=vx.pr; a2=squeeze(v.rlutcs_idavg); s2=squeeze(v.rlutcs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z3=zx/dtas; p.Z3=pd/dtas; p.z3_avg=(a2av-a1av)/dtas; p.Z3_avg=p.z3_avg/a1av*100;
v=vm.ar; a1=squeeze(v.rlutcs_idavg); s1=squeeze(v.rlutcs_idstd); n1=squeeze(v.id_sum);
v=vx.ar; a2=squeeze(v.rlutcs_idavg); s2=squeeze(v.rlutcs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z4=zx/dtas; p.Z4=pd/dtas; p.z4_avg=(a2av-a1av)/dtas; p.Z4_avg=p.z4_avg/a1av*100;
v=vm.tc; a1=squeeze(v.rlutcs_idavg); s1=squeeze(v.rlutcs_idstd); n1=squeeze(v.id_sum);
v=vx.tc; a2=squeeze(v.rlutcs_idavg); s2=squeeze(v.rlutcs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z5=zx/dtas; p.Z5=pd/dtas; p.z5_avg=(a2av-a1av)/dtas; p.Z5_avg=p.z5_avg/a1av*100;
v=vm.mc; a1=squeeze(v.rlutcs_idavg); s1=squeeze(v.rlutcs_idstd); n1=squeeze(v.id_sum);
v=vx.mc; a2=squeeze(v.rlutcs_idavg); s2=squeeze(v.rlutcs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z6=zx/dtas; p.Z6=pd/dtas; p.z6_avg=(a2av-a1av)/dtas; p.Z6_avg=p.z6_avg/a1av*100;
v=vm.al; a1=squeeze(v.rlutcs_idavg); s1=squeeze(v.rlutcs_idstd); n1=squeeze(v.id_sum);
v=vx.al; a2=squeeze(v.rlutcs_idavg); s2=squeeze(v.rlutcs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z7=zx/dtas; p.Z7=pd/dtas; p.z7_avg=(a2av-a1av)/dtas; p.Z7_avg=p.z7_avg/a1av*100;
v=vm.pb; a1=squeeze(v.rlutcs_idavg); s1=squeeze(v.rlutcs_idstd); n1=squeeze(v.id_sum);
v=vx.pb; a2=squeeze(v.rlutcs_idavg); s2=squeeze(v.rlutcs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z8=zx/dtas; p.Z8=pd/dtas; p.z8_avg=(a2av-a1av)/dtas; p.Z8_avg=p.z8_avg/a1av*100;
do_per_change=false; %do_per_change=true; 
if do_per_change
  c1=-10; c2=10; p.un='\%/K'; p.vn='p2k_m_ctl_rlutcs_idavg_per'
  p.z1=p.Z1;  p.z2=p.Z2;  p.z3=p.Z3;  p.z4=p.Z4;
  p.z5=p.Z5;  p.z6=p.Z6;  p.z7=p.Z7;  p.z8=p.Z8;
  p.z1_avg=p.Z1_avg;  p.z2_avg=p.Z2_avg;  p.z3_avg=p.Z3_avg;  p.z4_avg=p.Z4_avg;
  p.z5_avg=p.Z5_avg;  p.z6_avg=p.Z6_avg;  p.z7_avg=p.Z7_avg;  p.z8_avg=p.Z8_avg;
end
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) clear-sky OLR avg, non-precip days';
p.s2='(b) clear-sky OLR avg, drizzle days'; 
p.s3='(c) clear-sky OLR avg, all wet days'; 
p.s4='(d) clear-sky OLR avg, AR days;'; 
p.s5='(e) clear-sky OLR avg, TS days;';
p.s6='(f) clear-sky OLR avg, MCS days;'; 
p.s7='(g) clear-sky OLR avg, storm (AR+TS+MCS) days;';
p.s8='(h) clear-sky OLR avg, wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=7; p.optit=9; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c1 c2]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig9: annual mean clear-sky OLR contributed from AR/TS/MSC %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; p.expn='c192'; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='obs_rsutcs_idwei';
vx=w0; p.vn='wp0_m_clm_rsutcs_idwei'; p.dtas=4.320;c1=-20;c2=20;c3=-20;c4=20;p.un='W/m2/K';
%vx=w1; p.vn='wp1_m_clm_rsutcs_idwei'; p.dtas=1.161;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
vx=w2; p.vn='wp2_m_clm_rsutcs_idwei'; p.dtas=1.185;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
p.z1=squeeze(vx.ar.rsutcs_av   -v.ar.rsutcs_av)   /p.dtas;   
p.z2=squeeze(vx.p2.rsutcs_idwei-v.p2.rsutcs_idwei)/p.dtas;   
p.z3=squeeze(vx.pr.rsutcs_idwei-v.pr.rsutcs_idwei)/p.dtas; 
p.z4=squeeze(vx.ar.rsutcs_idwei-v.ar.rsutcs_idwei)/p.dtas;
p.z5=squeeze(vx.tc.rsutcs_idwei-v.tc.rsutcs_idwei)/p.dtas;    
p.z6=squeeze(vx.mc.rsutcs_idwei-v.mc.rsutcs_idwei)/p.dtas;    
p.z7=squeeze(vx.al.rsutcs_idwei-v.al.rsutcs_idwei)/p.dtas;    
p.z8=p.z3-p.z7;
%p.z8=squeeze(vx.pd.rsutcs_idwei-v.pd.rsutcs_idwei)/p.dtas;    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean clear-sky SW upward';
p.s2='(b) clear-sky SW upward from precip days'; 
p.s3='(c) clear-sky SW upward from wet days'; 
p.s4='(d) clear-sky SW upward from AR days;'; 
p.s5='(e) clear-sky SW upward from TS days;';
p.s6='(f) clear-sky SW upward from MCS days;'; 
p.s7='(g) clear-sky SW upward from storm (AR+TS+MCS) days;';
p.s8='(h) clear-sky SW upward from wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=7; p.optit=4; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c1 c2]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig10: clear-sky OLR averaged from all AR/TS/MSC days %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='obs_rsutcs_idavg'; vm=v;
vx=v0; p.vn='mod_m_obs_rsutcs_idavg'; p.dtas=4.320;c1=-20;c2=20;c3=-20;c4=20;p.un='W/m2';
vx=w1; p.vn='wp1_m_clm_rsutcs_idavg'; p.dtas=1.161;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
vx=w2; p.vn='wp2_m_clm_rsutcs_idavg'; p.dtas=1.185;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
nyr1=v.ar.nyr; nyr2=vx.ar.nyr; aa=p.aa; dtas=p.dtas; mskopt=1;
v=vm.pd; a1=squeeze(v.rsutcs_idavg); s1=squeeze(v.rsutcs_idstd); n1=squeeze(v.id_sum);
v=vx.pd; a2=squeeze(v.rsutcs_idavg); s2=squeeze(v.rsutcs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z1=zx/dtas; p.Z1=pd/dtas; p.z1_avg=(a2av-a1av)/dtas; p.Z1_avg=p.z1_avg/a1av*100;
v=vm.pc; a1=squeeze(v.rsutcs_idavg); s1=squeeze(v.rsutcs_idstd); n1=squeeze(v.id_sum);
v=vx.pc; a2=squeeze(v.rsutcs_idavg); s2=squeeze(v.rsutcs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z2=zx/dtas; p.Z2=pd/dtas; p.z2_avg=(a2av-a1av)/dtas; p.Z2_avg=p.z2_avg/a1av*100;
v=vm.pr; a1=squeeze(v.rsutcs_idavg); s1=squeeze(v.rsutcs_idstd); n1=squeeze(v.id_sum);
v=vx.pr; a2=squeeze(v.rsutcs_idavg); s2=squeeze(v.rsutcs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z3=zx/dtas; p.Z3=pd/dtas; p.z3_avg=(a2av-a1av)/dtas; p.Z3_avg=p.z3_avg/a1av*100;
v=vm.ar; a1=squeeze(v.rsutcs_idavg); s1=squeeze(v.rsutcs_idstd); n1=squeeze(v.id_sum);
v=vx.ar; a2=squeeze(v.rsutcs_idavg); s2=squeeze(v.rsutcs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z4=zx/dtas; p.Z4=pd/dtas; p.z4_avg=(a2av-a1av)/dtas; p.Z4_avg=p.z4_avg/a1av*100;
v=vm.tc; a1=squeeze(v.rsutcs_idavg); s1=squeeze(v.rsutcs_idstd); n1=squeeze(v.id_sum);
v=vx.tc; a2=squeeze(v.rsutcs_idavg); s2=squeeze(v.rsutcs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z5=zx/dtas; p.Z5=pd/dtas; p.z5_avg=(a2av-a1av)/dtas; p.Z5_avg=p.z5_avg/a1av*100;
v=vm.mc; a1=squeeze(v.rsutcs_idavg); s1=squeeze(v.rsutcs_idstd); n1=squeeze(v.id_sum);
v=vx.mc; a2=squeeze(v.rsutcs_idavg); s2=squeeze(v.rsutcs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z6=zx/dtas; p.Z6=pd/dtas; p.z6_avg=(a2av-a1av)/dtas; p.Z6_avg=p.z6_avg/a1av*100;
v=vm.al; a1=squeeze(v.rsutcs_idavg); s1=squeeze(v.rsutcs_idstd); n1=squeeze(v.id_sum);
v=vx.al; a2=squeeze(v.rsutcs_idavg); s2=squeeze(v.rsutcs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z7=zx/dtas; p.Z7=pd/dtas; p.z7_avg=(a2av-a1av)/dtas; p.Z7_avg=p.z7_avg/a1av*100;
v=vm.pb; a1=squeeze(v.rsutcs_idavg); s1=squeeze(v.rsutcs_idstd); n1=squeeze(v.id_sum);
v=vx.pb; a2=squeeze(v.rsutcs_idavg); s2=squeeze(v.rsutcs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z8=zx/dtas; p.Z8=pd/dtas; p.z8_avg=(a2av-a1av)/dtas; p.Z8_avg=p.z8_avg/a1av*100;
do_per_change=false; %do_per_change=true; 
if do_per_change
  c1=-10; c2=10; p.un='\%/K'; p.vn='p2k_m_ctl_rsutcs_idavg_per'
  p.z1=p.Z1;  p.z2=p.Z2;  p.z3=p.Z3;  p.z4=p.Z4;
  p.z5=p.Z5;  p.z6=p.Z6;  p.z7=p.Z7;  p.z8=p.Z8;
  p.z1_avg=p.Z1_avg;  p.z2_avg=p.Z2_avg;  p.z3_avg=p.Z3_avg;  p.z4_avg=p.Z4_avg;
  p.z5_avg=p.Z5_avg;  p.z6_avg=p.Z6_avg;  p.z7_avg=p.Z7_avg;  p.z8_avg=p.Z8_avg;
end
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) clear-sky SW upward avg, non-precip days';
p.s2='(b) clear-sky SW upward avg, drizzle days'; 
p.s3='(c) clear-sky SW upward avg, all wet days'; 
p.s4='(d) clear-sky SW upward avg, AR days;'; 
p.s5='(e) clear-sky SW upward avg, TS days;';
p.s6='(f) clear-sky SW upward avg, MCS days;'; 
p.s7='(g) clear-sky SW upward avg, storm (AR+TS+MCS) days;';
p.s8='(h) clear-sky SW upward avg, wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=7; p.optit=9; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c1 c2]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig11: annual mean SWABS contributed from AR/TS/MSC %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_swabs_idwei';
%vx=w0; p.vn='wp0_m_clm_swabs_idwei'; p.dtas=4.320;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
vx=w1; p.vn='wp1_m_clm_swabs_idwei'; p.dtas=1.161;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
vx=w2; p.vn='wp2_m_clm_swabs_idwei'; p.dtas=1.185;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
p.z1=squeeze(vx.ar.swabs_av   -v.ar.swabs_av)   /p.dtas;   
p.z2=squeeze(vx.p2.swabs_idwei-v.p2.swabs_idwei)/p.dtas;   
p.z3=squeeze(vx.pr.swabs_idwei-v.pr.swabs_idwei)/p.dtas; 
p.z4=squeeze(vx.ar.swabs_idwei-v.ar.swabs_idwei)/p.dtas;
p.z5=squeeze(vx.tc.swabs_idwei-v.tc.swabs_idwei)/p.dtas;    
p.z6=squeeze(vx.mc.swabs_idwei-v.mc.swabs_idwei)/p.dtas;    
p.z7=squeeze(vx.al.swabs_idwei-v.al.swabs_idwei)/p.dtas;    
p.z8=p.z3-p.z7;
%p.z8=squeeze(vx.pd.swabs_idwei-v.pd.swabs_idwei)/p.dtas;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean SWABS';
p.s2='(b) SWABS from precip days'; 
p.s3='(c) SWABS from wet days'; 
p.s4='(d) SWABS from AR days;'; 
p.s5='(e) SWABS from TS days;';
p.s6='(f) SWABS from MCS days;'; 
p.s7='(g) SWABS from storm (AR+TS+MCS) days;';
p.s8='(h) SWABS from wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=7; p.optit=4; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c1 c2]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig12: annual mean SWABS contributed from AR/TS/MSC %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =ob; p.vn='obs_swabs_idavg'; vm=v;
vx=v0; p.vn='mod_m_obs_swabs_idavg'; v=vx; p.dtas=1;c1=-20;c2=20;c3=-20;c4=20;p.un='W/m2';
vx=w1; p.vn='p2k_m_ctl_swabs_idavg'; vm=v1; p.dtas=2.27;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
nyr=vx.ar.nyr; aa=p.aa; dtas=p.dtas; mskopt=1;
v=vm.pd; a1=squeeze(v.swabs_idavg); s1=squeeze(v.swabs_idstd); n1=squeeze(v.id_sum);
v=vx.pd; a2=squeeze(v.swabs_idavg); s2=squeeze(v.swabs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z1=zx/dtas; p.Z1=pd/dtas; p.z1_avg=(a2av-a1av)/dtas; p.Z1_avg=p.z1_avg/a1av*100;
v=vm.pc; a1=squeeze(v.swabs_idavg); s1=squeeze(v.swabs_idstd); n1=squeeze(v.id_sum);
v=vx.pc; a2=squeeze(v.swabs_idavg); s2=squeeze(v.swabs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z2=zx/dtas; p.Z2=pd/dtas; p.z2_avg=(a2av-a1av)/dtas; p.Z2_avg=p.z2_avg/a1av*100;
v=vm.pr; a1=squeeze(v.swabs_idavg); s1=squeeze(v.swabs_idstd); n1=squeeze(v.id_sum);
v=vx.pr; a2=squeeze(v.swabs_idavg); s2=squeeze(v.swabs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z3=zx/dtas; p.Z3=pd/dtas; p.z3_avg=(a2av-a1av)/dtas; p.Z3_avg=p.z3_avg/a1av*100;
v=vm.ar; a1=squeeze(v.swabs_idavg); s1=squeeze(v.swabs_idstd); n1=squeeze(v.id_sum);
v=vx.ar; a2=squeeze(v.swabs_idavg); s2=squeeze(v.swabs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z4=zx/dtas; p.Z4=pd/dtas; p.z4_avg=(a2av-a1av)/dtas; p.Z4_avg=p.z4_avg/a1av*100;
v=vm.tc; a1=squeeze(v.swabs_idavg); s1=squeeze(v.swabs_idstd); n1=squeeze(v.id_sum);
v=vx.tc; a2=squeeze(v.swabs_idavg); s2=squeeze(v.swabs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z5=zx/dtas; p.Z5=pd/dtas; p.z5_avg=(a2av-a1av)/dtas; p.Z5_avg=p.z5_avg/a1av*100;
v=vm.mc; a1=squeeze(v.swabs_idavg); s1=squeeze(v.swabs_idstd); n1=squeeze(v.id_sum);
v=vx.mc; a2=squeeze(v.swabs_idavg); s2=squeeze(v.swabs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z6=zx/dtas; p.Z6=pd/dtas; p.z6_avg=(a2av-a1av)/dtas; p.Z6_avg=p.z6_avg/a1av*100;
v=vm.al; a1=squeeze(v.swabs_idavg); s1=squeeze(v.swabs_idstd); n1=squeeze(v.id_sum);
v=vx.al; a2=squeeze(v.swabs_idavg); s2=squeeze(v.swabs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z7=zx/dtas; p.Z7=pd/dtas; p.z7_avg=(a2av-a1av)/dtas; p.Z7_avg=p.z7_avg/a1av*100;
v=vm.pb; a1=squeeze(v.swabs_idavg); s1=squeeze(v.swabs_idstd); n1=squeeze(v.id_sum);
v=vx.pb; a2=squeeze(v.swabs_idavg); s2=squeeze(v.swabs_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z8=zx/dtas; p.Z8=pd/dtas; p.z8_avg=(a2av-a1av)/dtas; p.Z8_avg=p.z8_avg/a1av*100;
do_per_change=false; %do_per_change=true; 
if do_per_change
  c1=-10; c2=10; p.un='\%/K'; p.vn='p2k_m_ctl_swabs_idavg_per'
  p.z1=p.Z1;  p.z2=p.Z2;  p.z3=p.Z3;  p.z4=p.Z4;
  p.z5=p.Z5;  p.z6=p.Z6;  p.z7=p.Z7;  p.z8=p.Z8;
  p.z1_avg=p.Z1_avg;  p.z2_avg=p.Z2_avg;  p.z3_avg=p.Z3_avg;  p.z4_avg=p.Z4_avg;
  p.z5_avg=p.Z5_avg;  p.z6_avg=p.Z6_avg;  p.z7_avg=p.Z7_avg;  p.z8_avg=p.Z8_avg;
end
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) SWABS avg, non-precip days';
p.s2='(b) SWABS avg, drizzle days'; 
p.s3='(c) SWABS avg, all wet days'; 
p.s4='(d) SWABS avg, AR days;'; 
p.s5='(e) SWABS avg, TS days;';
p.s6='(f) SWABS avg, MCS days;'; 
p.s7='(g) SWABS avg, storm (AR+TS+MCS) days;';
p.s8='(h) SWABS avg, wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=7; p.optit=9; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c1 c2]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig13: annual mean TOA SW relection contributed from AR/TS/MSC %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='obs_rsut_idwei';
%vx=w0; p.vn='wp0_m_clm_rsut_idwei'; p.dtas=4.320;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
%vx=w1; p.vn='wp1_m_clm_rsut_idwei'; p.dtas=1.161;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
vx=w2; p.vn='wp2_m_clm_rsut_idwei'; p.dtas=1.185;c1=-4;c2=4;c3=-2;c4=2;p.un='W/m2/K';
p.z1=squeeze(vx.ar.rsut_av   -v.ar.rsut_av)   /p.dtas;   
p.z2=squeeze(vx.p2.rsut_idwei-v.p2.rsut_idwei)/p.dtas;   
p.z3=squeeze(vx.pr.rsut_idwei-v.pr.rsut_idwei)/p.dtas; 
p.z4=squeeze(vx.ar.rsut_idwei-v.ar.rsut_idwei)/p.dtas;
p.z5=squeeze(vx.tc.rsut_idwei-v.tc.rsut_idwei)/p.dtas;    
p.z6=squeeze(vx.mc.rsut_idwei-v.mc.rsut_idwei)/p.dtas;    
p.z7=squeeze(vx.al.rsut_idwei-v.al.rsut_idwei)/p.dtas;    
p.z8=p.z3-p.z7;
%p.z8=squeeze(vx.pd.rsut_idwei-v.pd.rsut_idwei)/p.dtas;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean SW relection';
p.s2='(b) SW relection from precip days'; 
p.s3='(c) SW relection from wet days'; 
p.s4='(d) SW relection from AR days;'; 
p.s5='(e) SW relection from TS days;';
p.s6='(f) SW relection from MCS days;'; 
p.s7='(g) SW relection from storm (AR+TS+MCS) days;';
p.s8='(h) SW relection from wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=7; p.optit=4; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c1 c2]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig14: annual mean TOA SW relection averaged from AR/TS/MSC %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=ob.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =ob; p.vn='obs_rsut_idavg'; vm=v;
vx=v0; p.vn='mod_m_obs_rsut_idavg'; v=vx; p.dtas=1;c1=-20;c2=20;c3=-20;c4=20;p.un='W/m2';
vx=w1; p.vn='p2k_m_ctl_rsut_idavg'; vm=v1; p.dtas=2.27;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
nyr=vx.ar.nyr; aa=p.aa; dtas=p.dtas; mskopt=1;
v=vm.pd; a1=squeeze(v.rsut_idavg); s1=squeeze(v.rsut_idstd); n1=squeeze(v.id_sum);
v=vx.pd; a2=squeeze(v.rsut_idavg); s2=squeeze(v.rsut_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z1=zx/dtas; p.Z1=pd/dtas; p.z1_avg=(a2av-a1av)/dtas; p.Z1_avg=p.z1_avg/a1av*100;
v=vm.pc; a1=squeeze(v.rsut_idavg); s1=squeeze(v.rsut_idstd); n1=squeeze(v.id_sum);
v=vx.pc; a2=squeeze(v.rsut_idavg); s2=squeeze(v.rsut_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z2=zx/dtas; p.Z2=pd/dtas; p.z2_avg=(a2av-a1av)/dtas; p.Z2_avg=p.z2_avg/a1av*100;
v=vm.pr; a1=squeeze(v.rsut_idavg); s1=squeeze(v.rsut_idstd); n1=squeeze(v.id_sum);
v=vx.pr; a2=squeeze(v.rsut_idavg); s2=squeeze(v.rsut_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z3=zx/dtas; p.Z3=pd/dtas; p.z3_avg=(a2av-a1av)/dtas; p.Z3_avg=p.z3_avg/a1av*100;
v=vm.ar; a1=squeeze(v.rsut_idavg); s1=squeeze(v.rsut_idstd); n1=squeeze(v.id_sum);
v=vx.ar; a2=squeeze(v.rsut_idavg); s2=squeeze(v.rsut_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z4=zx/dtas; p.Z4=pd/dtas; p.z4_avg=(a2av-a1av)/dtas; p.Z4_avg=p.z4_avg/a1av*100;
v=vm.tc; a1=squeeze(v.rsut_idavg); s1=squeeze(v.rsut_idstd); n1=squeeze(v.id_sum);
v=vx.tc; a2=squeeze(v.rsut_idavg); s2=squeeze(v.rsut_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z5=zx/dtas; p.Z5=pd/dtas; p.z5_avg=(a2av-a1av)/dtas; p.Z5_avg=p.z5_avg/a1av*100;
v=vm.mc; a1=squeeze(v.rsut_idavg); s1=squeeze(v.rsut_idstd); n1=squeeze(v.id_sum);
v=vx.mc; a2=squeeze(v.rsut_idavg); s2=squeeze(v.rsut_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z6=zx/dtas; p.Z6=pd/dtas; p.z6_avg=(a2av-a1av)/dtas; p.Z6_avg=p.z6_avg/a1av*100;
v=vm.al; a1=squeeze(v.rsut_idavg); s1=squeeze(v.rsut_idstd); n1=squeeze(v.id_sum);
v=vx.al; a2=squeeze(v.rsut_idavg); s2=squeeze(v.rsut_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z7=zx/dtas; p.Z7=pd/dtas; p.z7_avg=(a2av-a1av)/dtas; p.Z7_avg=p.z7_avg/a1av*100;
v=vm.pb; a1=squeeze(v.rsut_idavg); s1=squeeze(v.rsut_idstd); n1=squeeze(v.id_sum);
v=vx.pb; a2=squeeze(v.rsut_idavg); s2=squeeze(v.rsut_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z8=zx/dtas; p.Z8=pd/dtas; p.z8_avg=(a2av-a1av)/dtas; p.Z8_avg=p.z8_avg/a1av*100;
do_per_change=false; %do_per_change=true; 
if do_per_change
  c1=-10; c2=10; p.un='\%/K'; p.vn='p2k_m_ctl_rsut_idavg_per'
  p.z1=p.Z1;  p.z2=p.Z2;  p.z3=p.Z3;  p.z4=p.Z4;
  p.z5=p.Z5;  p.z6=p.Z6;  p.z7=p.Z7;  p.z8=p.Z8;
  p.z1_avg=p.Z1_avg;  p.z2_avg=p.Z2_avg;  p.z3_avg=p.Z3_avg;  p.z4_avg=p.Z4_avg;
  p.z5_avg=p.Z5_avg;  p.z6_avg=p.Z6_avg;  p.z7_avg=p.Z7_avg;  p.z8_avg=p.Z8_avg;
end
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) SW relection avg, non-precip days';
p.s2='(b) SW relection avg, drizzle days'; 
p.s3='(c) SW relection avg, all wet days'; 
p.s4='(d) SW relection avg, AR days;'; 
p.s5='(e) SW relection avg, TS days;';
p.s6='(f) SW relection avg, MCS days;'; 
p.s7='(g) SW relection avg, storm (AR+TS+MCS) days;';
p.s8='(h) SW relection avg, wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=7; p.optit=9; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c1 c2]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig15: annual mean NETRAD contributed from AR/TS/MSC %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_netrad_idwei';
%vx=w1; p.vn='wp1_m_clm_netrad_idwei';vm=vx;p.dtas=1.161;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
vx=w2; p.vn='wp2_m_clm_netrad_idwei';vm=vx;p.dtas=1.185;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
p.z1=squeeze(vx.ar.netrad_av   -v.ar.netrad_av)   /p.dtas;   
p.z2=squeeze(vx.p2.netrad_idwei-v.p2.netrad_idwei)/p.dtas;   
p.z3=squeeze(vx.pr.netrad_idwei-v.pr.netrad_idwei)/p.dtas; 
p.z4=squeeze(vx.ar.netrad_idwei-v.ar.netrad_idwei)/p.dtas;
p.z5=squeeze(vx.tc.netrad_idwei-v.tc.netrad_idwei)/p.dtas;    
p.z6=squeeze(vx.mc.netrad_idwei-v.mc.netrad_idwei)/p.dtas;    
p.z7=squeeze(vx.al.netrad_idwei-v.al.netrad_idwei)/p.dtas;    
p.z8=p.z3-p.z7;
%p.z8=squeeze(vx.pd.netrad_idwei-v.pd.netrad_idwei)/p.dtas;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean NETRAD';
p.s2='(b) NETRAD from precip days'; 
p.s3='(c) NETRAD from wet days'; 
p.s4='(d) NETRAD from AR days;'; 
p.s5='(e) NETRAD from TS days;';
p.s6='(f) NETRAD from MCS days;'; 
p.s7='(g) NETRAD from storm (AR+TS+MCS) days;';
p.s8='(h) NETRAD from wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=7; p.optit=4; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c3 c4]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=p.c7;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig16: annual mean TOA net radiation contributed from AR/TS/MSC%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_netrad_idavg'; vm=v;
vx=w1; p.vn='wp1_m_clm_netrad_idavg'; p.dtas=0.528;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
%vx=w2; p.vn='wp2_m_clm_netrad_idavg'; p.dtas=1.170;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
nyr=vx.ar.nyr; aa=p.aa; dtas=p.dtas; mskopt=1;
v=vm.pd; a1=squeeze(v.netrad_idavg); s1=squeeze(v.netrad_idstd); n1=squeeze(v.id_sum);
v=vx.pd; a2=squeeze(v.netrad_idavg); s2=squeeze(v.netrad_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z1=zx/dtas; p.Z1=pd/dtas; p.z1_avg=(a2av-a1av)/dtas; p.Z1_avg=p.z1_avg/a1av*100;
v=vm.pc; a1=squeeze(v.netrad_idavg); s1=squeeze(v.netrad_idstd); n1=squeeze(v.id_sum);
v=vx.pc; a2=squeeze(v.netrad_idavg); s2=squeeze(v.netrad_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z2=zx/dtas; p.Z2=pd/dtas; p.z2_avg=(a2av-a1av)/dtas; p.Z2_avg=p.z2_avg/a1av*100;
v=vm.pr; a1=squeeze(v.netrad_idavg); s1=squeeze(v.netrad_idstd); n1=squeeze(v.id_sum);
v=vx.pr; a2=squeeze(v.netrad_idavg); s2=squeeze(v.netrad_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z3=zx/dtas; p.Z3=pd/dtas; p.z3_avg=(a2av-a1av)/dtas; p.Z3_avg=p.z3_avg/a1av*100;
v=vm.ar; a1=squeeze(v.netrad_idavg); s1=squeeze(v.netrad_idstd); n1=squeeze(v.id_sum);
v=vx.ar; a2=squeeze(v.netrad_idavg); s2=squeeze(v.netrad_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z4=zx/dtas; p.Z4=pd/dtas; p.z4_avg=(a2av-a1av)/dtas; p.Z4_avg=p.z4_avg/a1av*100;
v=vm.tc; a1=squeeze(v.netrad_idavg); s1=squeeze(v.netrad_idstd); n1=squeeze(v.id_sum);
v=vx.tc; a2=squeeze(v.netrad_idavg); s2=squeeze(v.netrad_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z5=zx/dtas; p.Z5=pd/dtas; p.z5_avg=(a2av-a1av)/dtas; p.Z5_avg=p.z5_avg/a1av*100;
v=vm.mc; a1=squeeze(v.netrad_idavg); s1=squeeze(v.netrad_idstd); n1=squeeze(v.id_sum);
v=vx.mc; a2=squeeze(v.netrad_idavg); s2=squeeze(v.netrad_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z6=zx/dtas; p.Z6=pd/dtas; p.z6_avg=(a2av-a1av)/dtas; p.Z6_avg=p.z6_avg/a1av*100;
v=vm.al; a1=squeeze(v.netrad_idavg); s1=squeeze(v.netrad_idstd); n1=squeeze(v.id_sum);
v=vx.al; a2=squeeze(v.netrad_idavg); s2=squeeze(v.netrad_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z7=zx/dtas; p.Z7=pd/dtas; p.z7_avg=(a2av-a1av)/dtas; p.Z7_avg=p.z7_avg/a1av*100;
v=vm.pb; a1=squeeze(v.netrad_idavg); s1=squeeze(v.netrad_idstd); n1=squeeze(v.id_sum);
v=vx.pb; a2=squeeze(v.netrad_idavg); s2=squeeze(v.netrad_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr,aa,mskopt);
p.z8=zx/dtas; p.Z8=pd/dtas; p.z8_avg=(a2av-a1av)/dtas; p.Z8_avg=p.z8_avg/a1av*100;
do_per_change=false; %do_per_change=true; 
if do_per_change
  c1=-10; c2=10; p.un='\%/K'; p.vn=strcat(p.vn,'_per');
  p.z1=p.Z1;  p.z2=p.Z2;  p.z3=p.Z3;  p.z4=p.Z4;
  p.z5=p.Z5;  p.z6=p.Z6;  p.z7=p.Z7;  p.z8=p.Z8;
  p.z1_avg=p.Z1_avg;  p.z2_avg=p.Z2_avg;  p.z3_avg=p.Z3_avg;  p.z4_avg=p.Z4_avg;
  p.z5_avg=p.Z5_avg;  p.z6_avg=p.Z6_avg;  p.z7_avg=p.Z7_avg;  p.z8_avg=p.Z8_avg;
end
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) NETRAD avg, non-precip days';
p.s2='(b) NETRAD avg, drizzle days'; 
p.s3='(c) NETRAD avg, all wet days'; 
p.s4='(d) NETRAD avg, AR days;'; 
p.s5='(e) NETRAD avg, TS days;';
p.s6='(f) NETRAD avg, MCS days;'; 
p.s7='(g) NETRAD avg, storm (AR+TS+MCS) days;';
p.s8='(h) NETRAD avg, wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=7; p.optit=9; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c1 c2]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig15: annual mean NETRAD contributed from AR/TS/MSC %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_netradclr_idwei';
vx=w0; p.vn='wp0_m_clm_netradclr_idwei';vm=vx;p.dtas=4.320;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
vx=w1; p.vn='wp1_m_clm_netradclr_idwei';vm=vx;p.dtas=1.161;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
vx=w2; p.vn='wp2_m_clm_netradclr_idwei';vm=vx;p.dtas=1.185;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
p.z1=squeeze(vx.ar.netradclr_av   -v.ar.netradclr_av)   /p.dtas;   
p.z2=squeeze(vx.p2.netradclr_idwei-v.p2.netradclr_idwei)/p.dtas;   
p.z3=squeeze(vx.pr.netradclr_idwei-v.pr.netradclr_idwei)/p.dtas; 
p.z4=squeeze(vx.ar.netradclr_idwei-v.ar.netradclr_idwei)/p.dtas;
p.z5=squeeze(vx.tc.netradclr_idwei-v.tc.netradclr_idwei)/p.dtas;    
p.z6=squeeze(vx.mc.netradclr_idwei-v.mc.netradclr_idwei)/p.dtas;    
p.z7=squeeze(vx.al.netradclr_idwei-v.al.netradclr_idwei)/p.dtas;    
p.z8=p.z3-p.z7;
%p.z8=squeeze(vx.pb.netradclr_idwei-v.pb.netradclr_idwei)/p.dtas;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean clear-sky NETRAD';
p.s2='(b) clear-sky NETRAD from precip days'; 
p.s3='(c) clear-sky NETRAD from wet days'; 
p.s4='(d) clear-sky NETRAD from AR days;'; 
p.s5='(e) clear-sky NETRAD from TS days;';
p.s6='(f) clear-sky NETRAD from MCS days;'; 
p.s7='(g) clear-sky NETRAD from storm (AR+TS+MCS) days;';
p.s8='(h) clear-sky NETRAD from wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=7; p.optit=4; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c3 c4]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=p.c7;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig16: annual mean TOA net radiation contributed from AR/TS/MSC%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='c192';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k'; p.rescale=false;
v =v0; p.vn='clm_netradclr_idavg'; vm=v;
vx=w1; p.vn='wp1_m_clm_netradclr_idavg'; p.dtas=1.161;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
%vx=w2; p.vn='wp2_m_clm_netradclr_idavg'; p.dtas=1.185;c1=-5;c2=5;c3=-5;c4=5;p.un='W/m2/K';
nyr1=v.ar.nyr; nyr2=vx.ar.nyr; aa=p.aa; dtas=p.dtas; mskopt=1; no=30;
v=vm.pd; a1=squeeze(v.netradclr_idavg); s1=squeeze(v.netradclr_idstd); n1=squeeze(v.id_sum);
v=vx.pd; a2=squeeze(v.netradclr_idavg); s2=squeeze(v.netradclr_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z1=zx/dtas; p.Z1=pd/dtas; p.z1_avg=(a2av-a1av)/dtas; p.Z1_avg=p.z1_avg/a1av*100;
v=vm.pc; a1=squeeze(v.netradclr_idavg); s1=squeeze(v.netradclr_idstd); n1=squeeze(v.id_sum);
v=vx.pc; a2=squeeze(v.netradclr_idavg); s2=squeeze(v.netradclr_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z2=zx/dtas; p.Z2=pd/dtas; p.z2_avg=(a2av-a1av)/dtas; p.Z2_avg=p.z2_avg/a1av*100;
v=vm.pr; a1=squeeze(v.netradclr_idavg); s1=squeeze(v.netradclr_idstd); n1=squeeze(v.id_sum);
v=vx.pr; a2=squeeze(v.netradclr_idavg); s2=squeeze(v.netradclr_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z3=zx/dtas; p.Z3=pd/dtas; p.z3_avg=(a2av-a1av)/dtas; p.Z3_avg=p.z3_avg/a1av*100;
v=vm.ar; a1=squeeze(v.netradclr_idavg); s1=squeeze(v.netradclr_idstd); n1=squeeze(v.id_sum);
v=vx.ar; a2=squeeze(v.netradclr_idavg); s2=squeeze(v.netradclr_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z4=zx/dtas; p.Z4=pd/dtas; p.z4_avg=(a2av-a1av)/dtas; p.Z4_avg=p.z4_avg/a1av*100;
v=vm.tc; a1=squeeze(v.netradclr_idavg); s1=squeeze(v.netradclr_idstd); n1=squeeze(v.id_sum);
v=vx.tc; a2=squeeze(v.netradclr_idavg); s2=squeeze(v.netradclr_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z5=zx/dtas; p.Z5=pd/dtas; p.z5_avg=(a2av-a1av)/dtas; p.Z5_avg=p.z5_avg/a1av*100;
v=vm.mc; a1=squeeze(v.netradclr_idavg); s1=squeeze(v.netradclr_idstd); n1=squeeze(v.id_sum);
v=vx.mc; a2=squeeze(v.netradclr_idavg); s2=squeeze(v.netradclr_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z6=zx/dtas; p.Z6=pd/dtas; p.z6_avg=(a2av-a1av)/dtas; p.Z6_avg=p.z6_avg/a1av*100;
v=vm.al; a1=squeeze(v.netradclr_idavg); s1=squeeze(v.netradclr_idstd); n1=squeeze(v.id_sum);
v=vx.al; a2=squeeze(v.netradclr_idavg); s2=squeeze(v.netradclr_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z7=zx/dtas; p.Z7=pd/dtas; p.z7_avg=(a2av-a1av)/dtas; p.Z7_avg=p.z7_avg/a1av*100;
v=vm.pb; a1=squeeze(v.netradclr_idavg); s1=squeeze(v.netradclr_idstd); n1=squeeze(v.id_sum);
v=vx.pb; a2=squeeze(v.netradclr_idavg); s2=squeeze(v.netradclr_idstd); n2=squeeze(v.id_sum);
[zx,ex,pd,a1av,a2av]=compute_diff(a1,s1,n1,a2,s2,n2,no,nyr1,nyr2,aa,mskopt);
p.z8=zx/dtas; p.Z8=pd/dtas; p.z8_avg=(a2av-a1av)/dtas; p.Z8_avg=p.z8_avg/a1av*100;
do_per_change=false; %do_per_change=true; 
if do_per_change
  c1=-10; c2=10; p.un='\%/K'; p.vn=strcat(p.vn,'_per');
  p.z1=p.Z1;  p.z2=p.Z2;  p.z3=p.Z3;  p.z4=p.Z4;
  p.z5=p.Z5;  p.z6=p.Z6;  p.z7=p.Z7;  p.z8=p.Z8;
  p.z1_avg=p.Z1_avg;  p.z2_avg=p.Z2_avg;  p.z3_avg=p.Z3_avg;  p.z4_avg=p.Z4_avg;
  p.z5_avg=p.Z5_avg;  p.z6_avg=p.Z6_avg;  p.z7_avg=p.Z7_avg;  p.z8_avg=p.Z8_avg;
end
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) clear-sky NETRAD avg, non-precip days';
p.s2='(b) clear-sky NETRAD avg, drizzle days'; 
p.s3='(c) clear-sky NETRAD avg, all wet days'; 
p.s4='(d) clear-sky NETRAD avg, AR days;'; 
p.s5='(e) clear-sky NETRAD avg, TS days;';
p.s6='(f) clear-sky NETRAD avg, MCS days;'; 
p.s7='(g) clear-sky NETRAD avg, storm (AR+TS+MCS) days;';
p.s8='(h) clear-sky NETRAD avg, wet non-storm days';
a=[c1 c2]; p.c1=a; p.fsize=7; p.optit=9; p.opt=5; p.nn=256;
a=[c1 c2]; p.c2=a; p.c3=a; 
a=[c1 c2]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%Below are model versus observations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig1: annual mean OLR contributed from AR/TS/MSC %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
p.vname='obs_mod_olr_idwei';
p.z1=squeeze(ob.ar.rlut_idwei);
p.z2=squeeze(vm.ar.rlut_idwei);    
p.z3=p.z2-p.z1;
p.z4=squeeze(ob.tc.rlut_idwei);
p.z5=squeeze(vm.tc.rlut_idwei);    
p.z6=p.z5-p.z4;
p.z7=squeeze(ob.mc.rlut_idwei);
p.z8=squeeze(vm.mc.rlut_idwei);    
p.z9=p.z8-p.z7;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) OLR; AR (OBS)';
p.s2='(b) OLR; AR (MOD)'; 
p.s3='(c) OLR; AR (MOD minus OBS)'; 
p.s4='(d) OLR; TS (OBS)'; 
p.s5='(e) OLR; TS (MOD)';
p.s6='(f) OLR; TS (MOD minus OBS)'; 
p.s7='(g) OLR; MCS (OBS)';
p.s8='(h) OLR; MCS (MOD)';
p.s9='(i) OLR; MCS (MOD minus OBS)';
a=[0 50]; da=[-15 15]; p.un='W/m2'; p.fsize=7; p.optit=1; p.opt=4;p.nn=128;p.th=1;
p.c1=a; p.c2=a; p.c4=a; p.c5=a; p.c7=a; p.c8=a; p.c3=da; p.c6=da; p.c9=da;
plot_2d_9panel_obs_mod_diff(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2: OLR averaged from AR/TS/MSC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
p.vname='obs_mod_olr_idavg';
p.z1=squeeze(ob.ar.rlut_idavg);
p.z2=squeeze(vm.ar.rlut_idavg);    
p.z3=p.z2-p.z1;
p.z4=squeeze(ob.tc.rlut_idavg);
p.z5=squeeze(vm.tc.rlut_idavg);    
p.z6=p.z5-p.z4;
p.z7=squeeze(ob.mc.rlut_idavg);
p.z8=squeeze(vm.mc.rlut_idavg);    
p.z9=p.z8-p.z7;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) OLR; AR (OBS)';
p.s2='(b) OLR; AR (MOD)'; 
p.s3='(c) OLR; AR (MOD minus OBS)'; 
p.s4='(d) OLR; TS (OBS)'; 
p.s5='(e) OLR; TS (MOD)';
p.s6='(f) OLR; TS (MOD minus OBS)'; 
p.s7='(g) OLR; MCS (OBS)';
p.s8='(h) OLR; MCS (MOD)';
p.s9='(i) OLR; MCS (MOD minus OBS)';
a=[100 300]; da=[-50 50]; p.un='W/m2'; p.fsize=7; p.optit=1; p.opt=4;p.nn=128;p.th=0.1;
p.c1=a; p.c2=a; p.c4=a; p.c5=a; p.c7=a; p.c8=a; p.c3=da; p.c6=da; p.c9=da;
plot_2d_9panel_obs_mod_diff(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2: OLR-CLR averaged from AR/TS/MSC %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
p.vname='obs_mod_olr_idavg';
p.z1=squeeze(ob.ar.rlutcs_idavg);
p.z2=squeeze(vm.ar.rlutcs_idavg);    
p.z3=p.z2-p.z1;
p.z4=squeeze(ob.tc.rlutcs_idavg);
p.z5=squeeze(vm.tc.rlutcs_idavg);    
p.z6=p.z5-p.z4;
p.z7=squeeze(ob.mc.rlutcs_idavg);
p.z8=squeeze(vm.mc.rlutcs_idavg);    
p.z9=p.z8-p.z7;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) clearsky OLR; AR (OBS)';
p.s2='(b) clearsky OLR; AR (MOD)'; 
p.s3='(c) clearsky OLR; AR (MOD minus OBS)'; 
p.s4='(d) clearsky OLR; TS (OBS)'; 
p.s5='(e) clearsky OLR; TS (MOD)';
p.s6='(f) clearsky OLR; TS (MOD minus OBS)'; 
p.s7='(g) clearsky OLR; MCS (OBS)';
p.s8='(h) clearsky OLR; MCS (MOD)';
p.s9='(i) clearsky OLR; MCS (MOD minus OBS)';
a=[100 300]; da=[-50 50]; p.un='W/m2'; p.fsize=7; p.optit=1; p.opt=4;p.nn=128;p.th=0.1;
p.c1=a; p.c2=a; p.c4=a; p.c5=a; p.c7=a; p.c8=a; p.c3=da; p.c6=da; p.c9=da;
plot_2d_9panel_obs_mod_diff(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig3: annual mean SWABS contributed from AR/TS/MSC %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
p.vname='obs_mod_swabs_idwei';
p.z1=squeeze(ob.ar.swabs_idwei);
p.z2=squeeze(vm.ar.swabs_idwei);    
p.z3=p.z2-p.z1;
p.z4=squeeze(ob.tc.swabs_idwei);
p.z5=squeeze(vm.tc.swabs_idwei);    
p.z6=p.z5-p.z4;
p.z7=squeeze(ob.mc.swabs_idwei);
p.z8=squeeze(vm.mc.swabs_idwei);    
p.z9=p.z8-p.z7;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) SWABS; AR (OBS)';
p.s2='(b) SWABS; AR (MOD)'; 
p.s3='(c) SWABS; AR (MOD minus OBS)'; 
p.s4='(d) SWABS; TS (OBS)'; 
p.s5='(e) SWABS; TS (MOD)';
p.s6='(f) SWABS; TS (MOD minus OBS)'; 
p.s7='(g) SWABS; MCS (OBS)';
p.s8='(h) SWABS; MCS (MOD)';
p.s9='(i) SWABS; MCS (MOD minus OBS)';
a=[0 60]; da=[-30 30]; p.un='W/m2'; p.fsize=7; p.optit=1; p.opt=4;p.nn=128;p.th=1;
p.c1=a; p.c2=a; p.c4=a; p.c5=a; p.c7=a; p.c8=a; p.c3=da; p.c6=da; p.c9=da;
plot_2d_9panel_obs_mod_diff(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig4: SWABS averaged from AR/TS/MSC %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
p.vname='obs_mod_swabs_idavg';
p.z1=squeeze(ob.ar.swabs_idavg);
p.z2=squeeze(vm.ar.swabs_idavg);    
p.z3=p.z2-p.z1;
p.z4=squeeze(ob.tc.swabs_idavg);
p.z5=squeeze(vm.tc.swabs_idavg);    
p.z6=p.z5-p.z4;
p.z7=squeeze(ob.mc.swabs_idavg);
p.z8=squeeze(vm.mc.swabs_idavg);    
p.z9=p.z8-p.z7;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) SWABS; AR (OBS)';
p.s2='(b) SWABS; AR (MOD)'; 
p.s3='(c) SWABS; AR (MOD minus OBS)'; 
p.s4='(d) SWABS; TS (OBS)'; 
p.s5='(e) SWABS; TS (MOD)';
p.s6='(f) SWABS; TS (MOD minus OBS)'; 
p.s7='(g) SWABS; MCS (OBS)';
p.s8='(h) SWABS; MCS (MOD)';
p.s9='(i) SWABS; MCS (MOD minus OBS)';
a=[50 300]; da=[-100 100]; p.un='W/m2'; p.fsize=7; p.optit=1; p.opt=4;p.nn=128;p.th=0.01;
p.c1=a; p.c2=a; p.c4=a; p.c5=a; p.c7=a; p.c8=a; p.c3=da; p.c6=da; p.c9=da;
plot_2d_9panel_obs_mod_diff(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5: annual mean LWCRE contributed from AR/TS/MSC %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k';
p.vname='obs_mod_lwcf_idwei';
p.z1=squeeze(ob.ar.lwcf_idwei);
p.z2=squeeze(vm.ar.lwcf_idwei);    
p.z3=p.z2-p.z1;
p.z4=squeeze(ob.tc.lwcf_idwei);
p.z5=squeeze(vm.tc.lwcf_idwei);    
p.z6=p.z5-p.z4;
p.z7=squeeze(ob.mc.lwcf_idwei);
p.z8=squeeze(vm.mc.lwcf_idwei);    
p.z9=p.z8-p.z7;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) LWCRE; AR (OBS)';
p.s2='(b) LWCRE; AR (MOD)'; 
p.s3='(c) LWCRE; AR (MOD minus OBS)'; 
p.s4='(d) LWCRE; TS (OBS)'; 
p.s5='(e) LWCRE; TS (MOD)';
p.s6='(f) LWCRE; TS (MOD minus OBS)'; 
p.s7='(g) LWCRE; MCS (OBS)';
p.s8='(h) LWCRE; MCS (MOD)';
p.s9='(i) LWCRE; MCS (MOD minus OBS)';
a=[0 20]; da=[-10 10]; p.un='W/m2'; p.fsize=7; p.optit=1; p.opt=4;p.nn=256;p.th=1;
p.c1=a; p.c2=a; p.c4=a; p.c5=a; p.c7=a; p.c8=a; p.c3=da; p.c6=da; p.c9=da;
plot_2d_9panel_obs_mod_diff(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig4: LWCRE averaged from AR/TS/MCS %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k';
p.vname='obs_mod_lwcf_idavg';
p.z1=squeeze(ob.ar.lwcf_idavg);
p.z2=squeeze(vm.ar.lwcf_idavg);    
p.z3=p.z2-p.z1;
p.z4=squeeze(ob.tc.lwcf_idavg);
p.z5=squeeze(vm.tc.lwcf_idavg);    
p.z6=p.z5-p.z4;
p.z7=squeeze(ob.mc.lwcf_idavg);
p.z8=squeeze(vm.mc.lwcf_idavg);    
p.z9=p.z8-p.z7;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) LWCRE; AR (OBS)';
p.s2='(b) LWCRE; AR (MOD)'; 
p.s3='(c) LWCRE; AR (MOD minus OBS)'; 
p.s4='(d) LWCRE; TS (OBS)'; 
p.s5='(e) LWCRE; TS (MOD)';
p.s6='(f) LWCRE; TS (MOD minus OBS)'; 
p.s7='(g) LWCRE; MCS (OBS)';
p.s8='(h) LWCRE; MCS (MOD)';
p.s9='(i) LWCRE; MCS (MOD minus OBS)';
a=[0 100]; da=[-30 30]; p.un='W/m2'; p.fsize=7; p.optit=1; p.opt=4;p.nn=256;p.th=0.01;
p.c1=a; p.c2=a; p.c4=a; p.c5=a; p.c7=a; p.c8=a; p.c3=da; p.c6=da; p.c9=da;
plot_2d_9panel_obs_mod_diff(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig4: LWCRE heaviest 25% Precip AR/TS/MCS %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k';
p.vname='obs_mod_lwcf_h25_avg'; i=4; no=30;
p.z1=squeeze(ob.ar.lwcf_idx_avg(1,i,:,:));
p.z2=squeeze(vm.ar.lwcf_idx_avg(1,i,:,:));
p.z3=p.z2-p.z1;
p.z4=squeeze(ob.tc.lwcf_idx_avg(1,i,:,:));
p.z5=squeeze(vm.tc.lwcf_idx_avg(1,i,:,:));    
p.z6=p.z5-p.z4;
p.z7=squeeze(ob.mc.lwcf_idx_avg(1,i,:,:));
p.z8=squeeze(vm.mc.lwcf_idx_avg(1,i,:,:));    
p.z9=p.z8-p.z7;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) LWCRE; AR (OBS)';
p.s2='(b) LWCRE; AR (MOD)'; 
p.s3='(c) LWCRE; AR (MOD minus OBS)'; 
p.s4='(d) LWCRE; TS (OBS)'; 
p.s5='(e) LWCRE; TS (MOD)';
p.s6='(f) LWCRE; TS (MOD minus OBS)'; 
p.s7='(g) LWCRE; MCS (OBS)';
p.s8='(h) LWCRE; MCS (MOD)';
p.s9='(i) LWCRE; MCS (MOD minus OBS)';
a=[0 100]; da=[-30 30]; p.un='W/m2'; p.fsize=7; p.optit=1; p.opt=4;p.nn=256;p.th=0.1;
p.c1=a; p.c2=a; p.c4=a; p.c5=a; p.c7=a; p.c8=a; p.c3=da; p.c6=da; p.c9=da;
plot_2d_9panel_obs_mod_diff(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5: annual mean SWCRE contributed from AR/TS/MSC %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k';
p.vname='obs_mod_swcf_idwei';
p.z1=squeeze(ob.ar.swcf_idwei);
p.z2=squeeze(vm.ar.swcf_idwei);    
p.z3=p.z2-p.z1;
p.z4=squeeze(ob.tc.swcf_idwei);
p.z5=squeeze(vm.tc.swcf_idwei);    
p.z6=p.z5-p.z4;
p.z7=squeeze(ob.mc.swcf_idwei);
p.z8=squeeze(vm.mc.swcf_idwei);    
p.z9=p.z8-p.z7;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) SWCRE; AR (OBS)';
p.s2='(b) SWCRE; AR (MOD)'; 
p.s3='(c) SWCRE; AR (MOD minus OBS)'; 
p.s4='(d) SWCRE; TS (OBS)'; 
p.s5='(e) SWCRE; TS (MOD)';
p.s6='(f) SWCRE; TS (MOD minus OBS)'; 
p.s7='(g) SWCRE; MCS (OBS)';
p.s8='(h) SWCRE; MCS (MOD)';
p.s9='(i) SWCRE; MCS (MOD minus OBS)';
a=[-30 0]; da=[-10 10]; p.un='W/m2'; p.fsize=7; p.optit=1; p.opt=3;p.nn=256;p.th=1;
p.c1=a; p.c2=a; p.c4=a; p.c5=a; p.c7=a; p.c8=a; p.c3=da; p.c6=da; p.c9=da;
plot_2d_9panel_obs_mod_diff(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig4: SWCRE averaged from AR/TS/MCS %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k';
p.vname='obs_mod_swcf_idavg';
p.z1=squeeze(ob.ar.swcf_idavg);
p.z2=squeeze(vm.ar.swcf_idavg);    
p.z3=p.z2-p.z1;
p.z4=squeeze(ob.tc.swcf_idavg);
p.z5=squeeze(vm.tc.swcf_idavg);    
p.z6=p.z5-p.z4;
p.z7=squeeze(ob.mc.swcf_idavg);
p.z8=squeeze(vm.mc.swcf_idavg);    
p.z9=p.z8-p.z7;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) SWCRE; AR (OBS)';
p.s2='(b) SWCRE; AR (MOD)'; 
p.s3='(c) SWCRE; AR (MOD minus OBS)'; 
p.s4='(d) SWCRE; TS (OBS)'; 
p.s5='(e) SWCRE; TS (MOD)';
p.s6='(f) SWCRE; TS (MOD minus OBS)'; 
p.s7='(g) SWCRE; MCS (OBS)';
p.s8='(h) SWCRE; MCS (MOD)';
p.s9='(i) SWCRE; MCS (MOD minus OBS)';
a=[-150 0]; da=[-50 50]; p.un='W/m2'; p.fsize=7; p.optit=1; p.opt=3;p.nn=256;p.th=0.01;
p.c1=a; p.c2=a; p.c4=a; p.c5=a; p.c7=a; p.c8=a; p.c3=da; p.c6=da; p.c9=da;
plot_2d_9panel_obs_mod_diff(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig4: SWCRE heaviest 25% Precip AR/TS/MCS %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k';
p.vname='obs_mod_swcf_h25_avg'; i=4; no=30;
p.z1=squeeze(ob.ar.swcf_idx_avg(1,i,:,:));
p.z2=squeeze(vm.ar.swcf_idx_avg(1,i,:,:));
p.z3=p.z2-p.z1;
p.z4=squeeze(ob.tc.swcf_idx_avg(1,i,:,:));
p.z5=squeeze(vm.tc.swcf_idx_avg(1,i,:,:));    
p.z6=p.z5-p.z4;
p.z7=squeeze(ob.mc.swcf_idx_avg(1,i,:,:));
p.z8=squeeze(vm.mc.swcf_idx_avg(1,i,:,:));    
p.z9=p.z8-p.z7;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) SWCRE; AR (OBS)';
p.s2='(b) SWCRE; AR (MOD)'; 
p.s3='(c) SWCRE; AR (MOD minus OBS)'; 
p.s4='(d) SWCRE; TS (OBS)'; 
p.s5='(e) SWCRE; TS (MOD)';
p.s6='(f) SWCRE; TS (MOD minus OBS)'; 
p.s7='(g) SWCRE; MCS (OBS)';
p.s8='(h) SWCRE; MCS (MOD)';
p.s9='(i) SWCRE; MCS (MOD minus OBS)';
a=[-150 0]; da=[-50 50]; p.un='W/m2'; p.fsize=7; p.optit=1; p.opt=3;p.nn=256;p.th=0.01;
p.c1=a; p.c2=a; p.c4=a; p.c5=a; p.c7=a; p.c8=a; p.c3=da; p.c6=da; p.c9=da;
plot_2d_9panel_obs_mod_diff(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5: annual mean PRDAY contributed from AR/TS/MSC %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k';
p.vname='obs_mod_prday_idwei';
p.z1=squeeze(ob.ar.prday_idwei);
p.z2=squeeze(vm.ar.prday_idwei);    
p.z3=p.z2-p.z1;
p.z4=squeeze(ob.tc.prday_idwei);
p.z5=squeeze(vm.tc.prday_idwei);    
p.z6=p.z5-p.z4;
p.z7=squeeze(ob.mc.prday_idwei);
p.z8=squeeze(vm.mc.prday_idwei);    
p.z9=p.z8-p.z7;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) P-daily; AR (OBS)';
p.s2='(b) P-daily; AR (MOD)'; 
p.s3='(c) P-daily; AR (MOD minus OBS)'; 
p.s4='(d) P-daily; TS (OBS)'; 
p.s5='(e) P-daily; TS (MOD)';
p.s6='(f) P-daily; TS (MOD minus OBS)'; 
p.s7='(g) P-daily; MCS (OBS)';
p.s8='(h) P-daily; MCS (MOD)';
p.s9='(i) P-daily; MCS (MOD minus OBS)';
a=[0 3]; da=[-1 1]; p.un='mm/day'; p.fsize=7; p.optit=1; p.opt=4;p.nn=256;p.th=0.01;
p.c1=a; p.c2=a; p.c4=a; p.c5=a; p.c7=a; p.c8=a; p.c3=da; p.c6=da; p.c9=da;
plot_2d_9panel_obs_mod_diff(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig4: PRDAY averaged from AR/TS/MCS %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.c='k';
p.vname='obs_mod_prday_idavg';
p.z1=squeeze(ob.ar.prday_idavg);
p.z2=squeeze(vm.ar.prday_idavg);    
p.z3=p.z2-p.z1;
p.z4=squeeze(ob.tc.prday_idavg);
p.z5=squeeze(vm.tc.prday_idavg);    
p.z6=p.z5-p.z4;
p.z7=squeeze(ob.mc.prday_idavg);
p.z8=squeeze(vm.mc.prday_idavg);    
p.z9=p.z8-p.z7;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) P-daily; AR (OBS)';
p.s2='(b) P-daily; AR (MOD)'; 
p.s3='(c) P-daily; AR (MOD minus OBS)'; 
p.s4='(d) P-daily; TS (OBS)'; 
p.s5='(e) P-daily; TS (MOD)';
p.s6='(f) P-daily; TS (MOD minus OBS)'; 
p.s7='(g) P-daily; MCS (OBS)';
p.s8='(h) P-daily; MCS (MOD)';
p.s9='(i) P-daily; MCS (MOD minus OBS)';
a=[0 25]; da=[-10 10]; p.un='mm/day'; p.fsize=7; p.optit=1; p.opt=1;p.nn=128;p.th=0.1;
p.c1=a; p.c2=a; p.c4=a; p.c5=a; p.c7=a; p.c8=a; p.c3=da; p.c6=da; p.c9=da;
plot_2d_9panel_obs_mod_diff(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%











%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig1: AR/TS/MSC days (frequency)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %occurrence frequency: fraction of all days
p.vname='Fig1'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(ob.mc.prday_fqwet(1,:,:,2))*100;
p.z2=squeeze(v0.mc.prday_fqwet(1,:,:,2))*100;
p.z3=squeeze(ob.ar.frqday)*100;
p.z4=squeeze(v0.ar.frqday)*100; %p.z4=p.z4-p.z3;   
p.z5=squeeze(ob.tc.frqday)*100;
p.z6=squeeze(v0.tc.frqday)*100;
p.z7=squeeze(ob.mc.frqday)*100;    
p.z8=squeeze(v0.mc.frqday)*100; %p.z8=p.z8-p.z7;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) frequency of wet days; OBS';
p.s2='(e) frequency of wet days; MOD';
p.s3='(b) frequency of AR days; OBS';
p.s4='(f) frequency of AR days; MOD'; 
p.s5='(c) frequency of TS days; OBS'; 
p.s6='(g) frequency of TS days; MOD'; 
p.s7='(d) frequency of MCS days; OBS';
p.s8='(h) frequency of MCS days; MOD';
a=[0 100]; p.c1=a; p.c2=a; p.optit=0;
a=[0 40];  p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a; p.c4=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2: annual mean precip contributed from AR/TS/MSC %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %all time mean prday from each weather type
p.vname='Fig2'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(ob.ar.prday_av);   
p.z2=squeeze(v0.ar.prday_av);   
p.z3=squeeze(ob.ar.prday_idwei); 
p.z4=squeeze(v0.ar.prday_idwei);
p.z5=squeeze(ob.tc.prday_idwei);    
p.z6=squeeze(v0.tc.prday_idwei);    
p.z7=squeeze(ob.mc.prday_idwei);    
p.z8=squeeze(v0.mc.prday_idwei);    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean Pr; OBS';
p.s2='(e) annual mean Pr; MOD'; 
p.s3='(b) annual mean Pr from AR; OBS'; 
p.s4='(f) annual mean Pr from AR; MOD'; 
p.s5='(c) annual mean Pr from TS; OBS';
p.s6='(g) annual mean Pr from TS; MOD'; 
p.s7='(d) annual mean Pr from MCS; OBS';
p.s8='(h) annual mean Pr from MCS; MOD';
a=[1 10]; p.c1=a; p.c2=a; p.optit=1;
a=[0 3 ]; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RadFig: annual mean LWCF contributed from AR/TS/MSC %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %all time mean prday from each weather type
p.vname='lwcf'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
p.z1=squeeze(ob.ar.lwcf_av);   
p.z2=squeeze(v0.ar.lwcf_av);   
p.z3=squeeze(ob.ar.lwcf_idwei); 
p.z4=squeeze(v0.ar.lwcf_idwei);
p.z5=squeeze(ob.tc.lwcf_idwei);    
p.z6=squeeze(v0.tc.lwcf_idwei);    
p.z7=squeeze(ob.mc.lwcf_idwei);    
p.z8=squeeze(v0.mc.lwcf_idwei);    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual LWCRE; OBS';
p.s2='(e) annual LWCRE; MOD'; 
p.s3='(b) annual LWCRE from AR; OBS'; 
p.s4='(f) annual LWCRE from AR; MOD'; 
p.s5='(c) annual LWCRE from TS; OBS';
p.s6='(g) annual LWCRE from TS; MOD'; 
p.s7='(d) annual LWCRE from MCS; OBS';
p.s8='(h) annual LWCRE from MCS; MOD';
a=[0 80]; p.c1=a; p.c2=a; p.optit=1; p.un='W/m2';
a=[-20 20 ]; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RadFig: storm LWCF contributed from AR/TS/MSC days %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %all time mean prday from each weather type
p.vname='lwcf_idavg'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0)); no=20;
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
v=ob.ar; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum); 
[p.z1]=compute_se(a1,s1,n1,no);
v=v0.ar; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum); 
[p.z2]=compute_se(a1,s1,n1,no);
v=ob.tc; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum); 
[p.z3]=compute_se(a1,s1,n1,no);
v=v0.tc; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum); 
[p.z4]=compute_se(a1,s1,n1,no);
v=ob.mc; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum); 
[p.z5]=compute_se(a1,s1,n1,no);
v=v0.mc; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum); 
[p.z6]=compute_se(a1,s1,n1,no);
p.s1='(a) LWCRE from AR; OBS'; 
p.s2='(b) LWCRE from AR; MOD'; 
p.s3='(c) LWCRE from TS; OBS';
p.s4='(d) LWCRE from TS; MOD'; 
p.s5='(e) LWCRE from MCS; OBS';
p.s6='(f) LWCRE from MCS; MOD';
p.c1=[0 90]; a=[0 90]; p.c2=a; p.c3=a; p.c4=a; 
a=[0 120]; p.c5=a; p.c6=a; p.un='W/m2';
plot_2d_6panel_storm_cre(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RadFig: annual mean RLUT contributed from AR/TS/MSC %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %all time mean prday from each weather type
p.vname='rlut'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
p.z1=squeeze(ob.ar.rlut_av);   
p.z2=squeeze(v0.ar.rlut_av);   
p.z3=squeeze(ob.ar.rlut_idwei); 
p.z4=squeeze(v0.ar.rlut_idwei);
p.z5=squeeze(ob.tc.rlut_idwei);    
p.z6=squeeze(v0.tc.rlut_idwei);    
p.z7=squeeze(ob.mc.rlut_idwei);    
p.z8=squeeze(v0.mc.rlut_idwei);    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual OLR; OBS';
p.s2='(e) annual OLR; MOD'; 
p.s3='(b) annual OLR from AR; OBS'; 
p.s4='(f) annual OLR from AR; MOD'; 
p.s5='(c) annual OLR from TS; OBS';
p.s6='(g) annual OLR from TS; MOD'; 
p.s7='(d) annual OLR from MCS; OBS';
p.s8='(h) annual OLR from MCS; MOD';
a=[150 280]; p.c1=a; p.c2=a; p.optit=1; p.un='W/m2'; p.fsize=7;
a=[-60   60 ]; p.c3=a; p.c4=a; p.c5=a/2; p.c6=a/2; p.c7=a/2; p.c8=a/2;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RadFig: annual mean RLUT contributed from AR/TS/MSC %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %all time mean prday from each weather type
p.vname='rlutcs'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
p.z1=squeeze(ob.ar.rlutcs_av);   
p.z2=squeeze(v0.ar.rlutcs_av);   
p.z3=squeeze(ob.ar.rlutcs_idwei); 
p.z4=squeeze(v0.ar.rlutcs_idwei);
p.z5=squeeze(ob.tc.rlutcs_idwei);    
p.z6=squeeze(v0.tc.rlutcs_idwei);    
p.z7=squeeze(ob.mc.rlutcs_idwei);    
p.z8=squeeze(v0.mc.rlutcs_idwei);    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual clear-sky OLR; OBS';
p.s2='(e) annual clear-sky OLR; MOD'; 
p.s3='(b) annual clear-sky OLR from AR; OBS'; 
p.s4='(f) annual clear-sky OLR from AR; MOD'; 
p.s5='(c) annual clear-sky OLR from TS; OBS';
p.s6='(g) annual clear-sky OLR from TS; MOD'; 
p.s7='(d) annual clear-sky OLR from MCS; OBS';
p.s8='(h) annual clear-sky OLR from MCS; MOD';
a=[150 280]; p.c1=a; p.c2=a; p.optit=1; p.un='W/m2';
a=[-60   60 ]; p.c3=a; p.c4=a; p.c5=a/2; p.c6=a/2; p.c7=a/2; p.c8=a/2;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RadFig: annual mean SWCF contributed from AR/TS/MSC %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %all time mean prday from each weather type
p.vname='swcf'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
p.z1=squeeze(ob.ar.swcf_av);   
p.z2=squeeze(v0.ar.swcf_av);   
p.z3=squeeze(ob.ar.swcf_idwei); 
p.z4=squeeze(v0.ar.swcf_idwei);
p.z5=squeeze(ob.tc.swcf_idwei);    
p.z6=squeeze(v0.tc.swcf_idwei);    
p.z7=squeeze(ob.mc.swcf_idwei);    
p.z8=squeeze(v0.mc.swcf_idwei);    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual SWCRE; OBS';
p.s2='(e) annual SWCRE; MOD'; 
p.s3='(b) annual SWCRE from AR; OBS'; 
p.s4='(f) annual SWCRE from AR; MOD'; 
p.s5='(c) annual SWCRE from TS; OBS';
p.s6='(g) annual SWCRE from TS; MOD'; 
p.s7='(d) annual SWCRE from MCS; OBS';
p.s8='(h) annual SWCRE from MCS; MOD';
a=[-80 0];   p.c1=a; p.c2=a; p.optit=1; p.un='W/m2';
a=[-20 20 ]; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RadFig: storm SWCF contributed from AR/TS/MSC days %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %all time mean prday from each weather type
p.vname='swcf_idavg'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0)); no=20;
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
v=ob.ar; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
[p.z1]=compute_se(a1,s1,n1,no);
v=v0.ar; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
[p.z2]=compute_se(a1,s1,n1,no);
v=ob.tc; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
[p.z3]=compute_se(a1,s1,n1,no);
v=v0.tc; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
[p.z4]=compute_se(a1,s1,n1,no);
v=ob.mc; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
[p.z5]=compute_se(a1,s1,n1,no);
v=v0.mc; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
[p.z6]=compute_se(a1,s1,n1,no);
p.s1='(a) SWCRE from AR; OBS'; 
p.s2='(b) SWCRE from AR; MOD'; 
p.s3='(c) SWCRE from TS; OBS';
p.s4='(d) SWCRE from TS; MOD'; 
p.s5='(e) SWCRE from MCS; OBS';
p.s6='(f) SWCRE from MCS; MOD';
a=[-150 0]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; 
a=[-150 0]; p.c5=a; p.c6=a; p.un='W/m2';
plot_2d_6panel_storm_cre(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RadFig: annual mean RSUT contributed from AR/TS/MSC %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %all time mean prday from each weather type
p.vname='rsut'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
p.z1=squeeze(ob.ar.rsut_av);   
p.z2=squeeze(v0.ar.rsut_av);   
p.z3=squeeze(ob.ar.rsut_idwei); 
p.z4=squeeze(v0.ar.rsut_idwei);
p.z5=squeeze(ob.tc.rsut_idwei);    
p.z6=squeeze(v0.tc.rsut_idwei);    
p.z7=squeeze(ob.mc.rsut_idwei);    
p.z8=squeeze(v0.mc.rsut_idwei);    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual reflected SW radiation; OBS';
p.s2='(e) annual reflected SW radiation; MOD'; 
p.s3='(b) reflected SW radiation from AR; OBS'; 
p.s4='(f) reflected SW radiation from AR; MOD'; 
p.s5='(c) reflected SW radiation from TS; OBS';
p.s6='(g) reflected SW radiation from TS; MOD'; 
p.s7='(d) reflected SW radiation from MCS; OBS';
p.s8='(h) reflected SW radiation from MCS; MOD';
a=[50   150];  p.c1=a; p.c2=a; p.optit=1; p.un='W/m2'; p.fsize=7;
a=[-60   60 ]; p.c3=a; p.c4=a; p.c5=a/2; p.c6=a/2; p.c7=a/2; p.c8=a/2;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RadFig: storm SWCF contributed from AR/TS/MSC days %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %all time mean prday from each weather type
p.vname='rsut_idavg'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0)); no=20;
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
v=ob.ar; a1=squeeze(v.rsut_idavg); s1=squeeze(v.rsut_idstd); n1=squeeze(v.id_sum); 
[p.z1]=compute_se(a1,s1,n1,no);
v=v0.ar; a1=squeeze(v.rsut_idavg); s1=squeeze(v.rsut_idstd); n1=squeeze(v.id_sum); 
[p.z2]=compute_se(a1,s1,n1,no);
v=ob.tc; a1=squeeze(v.rsut_idavg); s1=squeeze(v.rsut_idstd); n1=squeeze(v.id_sum); 
[p.z3]=compute_se(a1,s1,n1,no);
v=v0.tc; a1=squeeze(v.rsut_idavg); s1=squeeze(v.rsut_idstd); n1=squeeze(v.id_sum); 
[p.z4]=compute_se(a1,s1,n1,no);
v=ob.mc; a1=squeeze(v.rsut_idavg); s1=squeeze(v.rsut_idstd); n1=squeeze(v.id_sum); 
[p.z5]=compute_se(a1,s1,n1,no);
v=v0.mc; a1=squeeze(v.rsut_idavg); s1=squeeze(v.rsut_idstd); n1=squeeze(v.id_sum); 
[p.z6]=compute_se(a1,s1,n1,no);
p.s1='(a) reflected SW radiation from AR; OBS';
p.s2='(d) reflected SW radiation from AR; MOD'; 
p.s3='(b) reflected SW radiation from TS; OBS'; 
p.s4='(e) reflected SW radiation from TS; MOD'; 
p.s5='(c) reflected SW radiation from MCS; OBS';
p.s6='(f) reflected SW radiation from MCS; MOD'; 
a=[0 200]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; 
a=[0 200]; p.c5=a; p.c6=a; p.un='W/m2'; p.fsize=7;
plot_2d_6panel_storm_cre(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RadFig: annual mean RSUT contributed from AR/TS/MSC %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %all time mean prday from each weather type
p.vname='rsutcs'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
p.z1=squeeze(ob.ar.rsutcs_av);   
p.z2=squeeze(v0.ar.rsutcs_av);   
p.z3=squeeze(ob.ar.rsutcs_idwei); 
p.z4=squeeze(v0.ar.rsutcs_idwei);
p.z5=squeeze(ob.tc.rsutcs_idwei);    
p.z6=squeeze(v0.tc.rsutcs_idwei);    
p.z7=squeeze(ob.mc.rsutcs_idwei);    
p.z8=squeeze(v0.mc.rsutcs_idwei);    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) clear-sky reflected SW radiation; OBS';
p.s2='(e) clear-sky reflected SW radiation; MOD'; 
p.s3='(b) clear-sky reflected SW radiation; OBS'; 
p.s4='(f) clear-sky reflected SW radiation; MOD'; 
p.s5='(c) clear-sky reflected SW radiation; OBS';
p.s6='(g) clear-sky reflected SW radiation; MOD'; 
p.s7='(d) clear-sky reflected SW radiation; OBS';
p.s8='(h) clear-sky reflected SW radiation; MOD';
a=[50 150];  p.c1=a; p.c2=a; p.optit=1; p.un='W/m2';
a=[-20 20 ]; p.c3=a; p.c4=a; p.c5=a/2; p.c6=a/2; p.c7=a/2; p.c8=a/2;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2a: annual mean precip contributed from U25 of AR/TS/MSC days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %all time mean prday from each weather type
p.vname='Fig2a_U25'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
i=4; p.vname='Fig2a_U25';
p.z1=squeeze(ob.ar.prday_av);   
p.z2=squeeze(v0.ar.prday_av);   
p.z3=squeeze(ob.ar.prday_idpct_wei(:,i,:,:));
p.z4=squeeze(v0.ar.prday_idpct_wei(:,i,:,:));
p.z5=squeeze(ob.tc.prday_idpct_wei(:,i,:,:));
p.z6=squeeze(v0.tc.prday_idpct_wei(:,i,:,:));
p.z7=squeeze(ob.mc.prday_idpct_wei(:,i,:,:));
p.z8=squeeze(v0.mc.prday_idpct_wei(:,i,:,:));
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean Pr; OBS';
p.s2='(e) annual mean Pr; MOD'; 
p.s3='(b) annual mean Pr from AR; OBS'; 
p.s4='(f) annual mean Pr from AR; MOD'; 
p.s5='(c) annual mean Pr from TS; OBS';
p.s6='(g) annual mean Pr from TS; MOD'; 
p.s7='(d) annual mean Pr from MCS; OBS';
p.s8='(h) annual mean Pr from MCS; MOD';
a=[1 10]; p.c1=a; p.c2=a; 
a=[0 3 ]; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2b: annual mean precip contributed from U50 of AR/TS/MSC days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %all time mean prday from each weather type
p.vname='Fig2b_U50'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
i=3; p.vname='Fig2b_U50';
p.z1=squeeze(ob.ar.prday_av);   
p.z2=squeeze(v0.ar.prday_av);   
p.z3=squeeze(ob.ar.prday_idpct_wei(:,i,:,:));
p.z4=squeeze(v0.ar.prday_idpct_wei(:,i,:,:));
p.z5=squeeze(ob.tc.prday_idpct_wei(:,i,:,:));
p.z6=squeeze(v0.tc.prday_idpct_wei(:,i,:,:));
p.z7=squeeze(ob.mc.prday_idpct_wei(:,i,:,:));
p.z8=squeeze(v0.mc.prday_idpct_wei(:,i,:,:));
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean Pr; OBS';
p.s2='(e) annual mean Pr; MOD'; 
p.s3='(b) annual mean Pr from AR; OBS'; 
p.s4='(f) annual mean Pr from AR; MOD'; 
p.s5='(c) annual mean Pr from TS; OBS';
p.s6='(g) annual mean Pr from TS; MOD'; 
p.s7='(d) annual mean Pr from MCS; OBS';
p.s8='(h) annual mean Pr from MCS; MOD';
a=[1 10]; p.c1=a; p.c2=a; 
a=[0 3 ]; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig3: annual mean precip contributed from AR/TS/MSC %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; p.optit=2; 
p.vname='Fig3'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; aa=p.aa;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
obs=squeeze(ob.ar.prday_av); o_avg=mean(mean(obs.*aa));
mod=squeeze(v0.ar.prday_av); m_avg=mean(mean(mod.*aa)); 
a=squeeze(ob.ar.prday_idwei); p.z1=a./obs*100; p.z1_avg=mean(mean(a.*aa))/o_avg*100;
a=squeeze(v0.ar.prday_idwei); p.z2=a./mod*100; p.z2_avg=mean(mean(a.*aa))/m_avg*100;
a=squeeze(ob.tc.prday_idwei); p.z3=a./obs*100; p.z3_avg=mean(mean(a.*aa))/o_avg*100;    
a=squeeze(v0.tc.prday_idwei); p.z4=a./mod*100; p.z4_avg=mean(mean(a.*aa))/m_avg*100;   
a=squeeze(ob.mc.prday_idwei); p.z5=a./obs*100; p.z5_avg=mean(mean(a.*aa))/o_avg*100;   
a=squeeze(v0.mc.prday_idwei); p.z6=a./mod*100; p.z6_avg=mean(mean(a.*aa))/m_avg*100;   
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) percent of annual Pr from AR; OBS'; 
p.s2='(d) percent of annual Pr from AR; MOD'; 
p.s3='(b) percent of annual Pr from TS; OBS';
p.s4='(e) percent of annual Pr from TS; MOD'; 
p.s5='(c) percent of annual Pr from MCS; OBS';
p.s6='(f) percent of annual Pr from MCS; MOD';
a=[0 80 ]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.optit=1;
plot_2d_6panel_new(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig3: annual mean LWCF contributed from AR/TS/MSC %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; p.optit=2; 
p.vname='lwcf'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; aa=p.aa;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
obs=squeeze(ob.ar.lwcf_av); o_avg=mean(mean(obs.*aa));
mod=squeeze(v0.ar.lwcf_av); m_avg=mean(mean(mod.*aa)); 
a=squeeze(ob.ar.lwcf_idwei); p.z1=a./obs*100; p.z1_avg=mean(mean(a.*aa))/o_avg*100;
a=squeeze(v0.ar.lwcf_idwei); p.z2=a./mod*100; p.z2_avg=mean(mean(a.*aa))/m_avg*100;
a=squeeze(ob.tc.lwcf_idwei); p.z3=a./obs*100; p.z3_avg=mean(mean(a.*aa))/o_avg*100;    
a=squeeze(v0.tc.lwcf_idwei); p.z4=a./mod*100; p.z4_avg=mean(mean(a.*aa))/m_avg*100;   
a=squeeze(ob.mc.lwcf_idwei); p.z5=a./obs*100; p.z5_avg=mean(mean(a.*aa))/o_avg*100;   
a=squeeze(v0.mc.lwcf_idwei); p.z6=a./mod*100; p.z6_avg=mean(mean(a.*aa))/m_avg*100;   
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) percent of LWCF from AR; OBS'; 
p.s2='(d) percent of LWCF from AR; MOD'; 
p.s3='(b) percent of LWCF from TS; OBS';
p.s4='(e) percent of LWCF from TS; MOD'; 
p.s5='(c) percent of LWCF from MCS; OBS';
p.s6='(f) percent of LWCF from MCS; MOD';
a=[0 80 ]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.optit=1;
plot_2d_6panel_new(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig4: global mean daily Pr variability%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='Fig4'; ms=3; fsize=10; lw=0.1; ws=1;
a=squeeze(ob.al.prday_idwei_ts_day); xo  =getclim(a);
a=squeeze(ob.al.prday_nonid_ts_day); yo  =getclim(a);
a=squeeze(ob.al.prday_av_ts_day);    zo  =getclim(a);
a=squeeze(ob.ar.prday_idwei_ts_day); xoar=getclim(a);
a=squeeze(ob.tc.prday_idwei_ts_day); xotc=getclim(a);
a=squeeze(ob.mc.prday_idwei_ts_day); xomc=getclim(a);
a=squeeze(vm.al.prday_idwei_ts_day); xm  =getclim(a);
a=squeeze(vm.al.prday_nonid_ts_day); ym  =getclim(a);
a=squeeze(vm.al.prday_av_ts_day);    zm  =getclim(a);
a=squeeze(vm.ar.prday_idwei_ts_day); xmar=getclim(a);
a=squeeze(vm.tc.prday_idwei_ts_day); xmtc=getclim(a);
a=squeeze(vm.mc.prday_idwei_ts_day); xmmc=getclim(a);
pms=[ 0, 0, 950, 800]*1.1; row=2; col=2;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); t=[1:365]; xy=[1 365 -0.25 0.15]; lb='(a)';
x1=xo.ano_clim;   y1=yo.ano_clim;   z1=zo.ano_clim; 
xa=xoar.ano_clim; xb=xotc.ano_clim; xc=xomc.ano_clim; 
a=mizsmooth(z1,ws); plot(t,a,'-k','LineWidth',lw); sz=corrslop(y1,x1); hold on;
a=mizsmooth(x1,ws); plot(t,a,'-r','LineWidth',lw); sx=corrslop(x1,z1); 
a=mizsmooth(y1,ws); plot(t,a,'-b','LineWidth',lw); sy=corrslop(y1,z1); 
%a=mizsmooth(xa,ws); plot(t,a,'-m','LineWidth',lw); sa=corrslop(xa,z1); 
%a=mizsmooth(xb,ws); plot(t,a,'-c','LineWidth',lw); sb=corrslop(xb,z1); 
%a=mizsmooth(xc,ws); plot(t,a,'-g','LineWidth',lw); sc=corrslop(xc,z1); 
%plot(t,x1+y1,'.g','MarkerSize',ms); 
s1=sprintf('all days (mean=%5.2f)',mean(zo.clim));
s2=sprintf('storm days (mean=%5.2f; corr=%5.2f)',mean(xo.clim),sx.r(1));
s3=sprintf('non-storm days (mean=%5.2f; corr=%5.2f)',mean(yo.clim),sy.r(1));
legend(s1,s2,s3,'location','southwest'); grid on;
xl='day of year'; yl='global mean daily Pr (mm/day)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); ; axis(xy);
title('(a) OBS','FontSize',fsize); %mylabel(xy,1,lb,fsize);
subplot(row,col,2); t=[1:365]; xy=[1 365 -0.25 0.15]; lb='(a)';
x1=xm.ano_clim;  y1=ym.ano_clim;  z1=zm.ano_clim;
xa=xmar.ano_clim; xb=xmtc.ano_clim; xc=xmmc.ano_clim; 
a=mizsmooth(z1,ws); plot(t,a,'-k','LineWidth',lw); sz=corrslop(y1,x1); hold on;
a=mizsmooth(x1,ws); plot(t,a,'-r','LineWidth',lw); sx=corrslop(x1,z1); 
a=mizsmooth(y1,ws); plot(t,a,'-b','LineWidth',lw); sy=corrslop(y1,z1); 
%a=mizsmooth(xa,ws); plot(t,a,'-m','LineWidth',lw); sa=corrslop(xa,z1); 
%a=mizsmooth(xb,ws); plot(t,a,'-c','LineWidth',lw); sb=corrslop(xb,z1); 
%a=mizsmooth(xc,ws); plot(t,a,'-g','LineWidth',lw); sc=corrslop(xc,z1); 
%plot(t,x1+y1,'.g','MarkerSize',ms); 
s1=sprintf('all days (mean=%5.2f)',mean(zm.clim));
s2=sprintf('storm days (mean=%5.2f; corr=%5.2f)',mean(xm.clim),sx.r(1));
s3=sprintf('non-storm days (mean=%5.2f; corr=%5.2f)',mean(ym.clim),sy.r(1));
legend(s1,s2,s3,'location','southwest'); grid on;
xl='day of year'; yl='global mean daily Pr (mm/day)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); ; axis(xy);
title('(c) MOD','FontSize',fsize); %mylabel(xy,1,lb,fsize);
subplot(row,col,3); a=0.7; x0=[-a:0.01:a]; xy=[-a a -a a];
x1=xo.ano_day; y1=yo.ano_day; z1=zo.ano_day;
plot(x1,z1,'r.','MarkerSize',ms); sx=corrslop(x1,z1); hold on;
plot(y1,z1,'b.','MarkerSize',ms); sy=corrslop(y1,z1); sz=corrslop(y1,x1);
%plot(x1+y1,z1,'g.','MarkerSize',ms); sz=corrslop(y1,x1);
p=sx; plot(x0,p.s(1)*x0+p.s(2),'r-','LineWidth',lw);
p=sy; plot(x0,p.s(1)*x0+p.s(2),'b-','LineWidth',lw);
s1=sprintf('storm days (corr=%5.2f)',sx.r(1));
s2=sprintf('non-storm days (corr=%5.2f)',sy.r(1));
legend(s1,s2,'location','southwest'); grid on;
xl='{          }anomalous Pr from storm/non-storm days (mm/day)';
yl='{      }anomalous global mean daily Pr (mm/day)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); ; axis(xy);
title('(b) OBS','FontSize',fsize); %mylabel(xy,1,lb,fsize);
subplot(row,col,4); a=0.7; x0=[-a:0.01:a]; xy=[-a a -a a];
x1=xm.ano_day; y1=ym.ano_day; z1=zm.ano_day;
plot(x1,z1,'r.','MarkerSize',ms); sx=corrslop(x1,z1); hold on;
plot(y1,z1,'b.','MarkerSize',ms); sy=corrslop(y1,z1); sz=corrslop(y1,x1);
%plot(x1+y1,z1,'g.','MarkerSize',ms); sz=corrslop(y1,x1);
p=sx; plot(x0,p.s(1)*x0+p.s(2),'r-','LineWidth',lw);
p=sy; plot(x0,p.s(1)*x0+p.s(2),'b-','LineWidth',lw);
s1=sprintf('storm days (corr=%5.2f)',sx.r(1));
s2=sprintf('non-storm days (corr=%5.2f)',sy.r(1));
legend(s1,s2,'location','southwest'); grid on;
xl='{          }anomalous Pr from storm/non-storm days (mm/day)';
yl='{      }anomalous global mean daily Pr (mm/day)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); ; axis(xy);
title('(d) MOD','FontSize',fsize); %mylabel(xy,1,lb,fsize);
visfig='off'; figpath='./fig_cre/'; expn='ctl'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5: fraction of extreme precip from AR/TS/TD/MSC days%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %fraction of P>P99 from each weather type
p.vname='Fig5'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(ob.mc.prday_pct(:,1,:,:));
p.z2=squeeze(v0.ar.prday_pct(:,1,:,:));
p.z3=squeeze(ob.ar.prday_fp99_from_id)*100;   
p.z4=squeeze(v0.ar.prday_fp99_from_id)*100;   
p.z5=squeeze(ob.tc.prday_fp99_from_id)*100;
p.z6=squeeze(v0.tc.prday_fp99_from_id)*100;
p.z7=squeeze(ob.mc.prday_fp99_from_id)*100;
p.z8=squeeze(v0.mc.prday_fp99_from_id)*100;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) 99 percentile of daily Pr; OBS';
p.s2='(e) 99 percentile of daily Pr; MOD';
p.s3='(b) fraction from AR; OBS';
p.s4='(f) fraction from AR; MOD'; 
p.s5='(c) fraction from TS; OBS'; 
p.s6='(g) fraction from TS; MOD'; 
p.s7='(d) fraction from MCS; OBS';
p.s8='(h) fraction from MCS; MOD';
a=[1 80]; p.c1=a; p.c2=a; p.optit=2;
a=[0 100 ]; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5a: fraction of extreme precip from AR/TS/TD/MSC days%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='obs'; %fraction of P>P99 from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='prday_fp99_from_id'; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(ob.ar.prday_pct(:,1,:,:));
p.z2=squeeze(v1.ar.prday_fp99_from_id);   
p.z3=squeeze(ob.tc.prday_fp99_from_id);
p.z4=squeeze(v1.mc.prday_fp99_from_id);
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) 99 percentile of daily precipitation';
p.s2='(b) fraction from AR'; 
p.s3='(c) fraction from TS'; 
p.s4='(d) fraction from MCS'; 
p.c1=[0 100]; a=[0 1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_4panel_obs(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig6: Precipitation averaged over all AR/TS/TD/MSC days%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; no=30; p.vname='prday_idavg';
p.vname='Fig6'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; aa=p.aa;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=128; p.c='k';
v=ob.ar; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z1]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z1_avg=mean(a(id).*b);
v=v0.ar; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z2]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z2_avg=mean(a(id).*b);
v=ob.tc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z3]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z3_avg=mean(a(id).*b);
v=v0.tc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z4]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z4_avg=mean(a(id).*b);
v=ob.mc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z5]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z5_avg=mean(a(id).*b);
v=v0.mc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z6]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z6_avg=mean(a(id).*b);
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) Pr averaged over all AR days; OBS';
p.s2='(d) Pr averaged over all AR days; MOD'; 
p.s3='(b) Pr averaged over all TS days; OBS'; 
p.s4='(e) Pr averaged over all TS days; MOD'; 
p.s5='(c) Pr averaged over all MCS days; OBS';
p.s6='(f) Pr averaged over all MCS days; MOD';
a=[1 25]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.optit=0
plot_2d_6panel_new(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig7: Precipitation averaged over certain AR/TS/TD/MCS days%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %p.vname='prday_idavg_U25';
p.vname='Fig7'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=128; p.c='k';
i=4; no=30;
v=ob.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z1]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z1_avg=mean(a(id).*b);
v=v0.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z2]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z2_avg=mean(a(id).*b);
v=ob.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z3]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z3_avg=mean(a(id).*b);
v=v0.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z4]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z4_avg=mean(a(id).*b);
v=ob.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z5]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z5_avg=mean(a(id).*b);
v=v0.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z6]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z6_avg=mean(a(id).*b);
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) Pr averaged over 25% heaviest-Pr AR days; OBS';
p.s2='(d) Pr averaged over 25% heaviest-Pr AR days; MOD'; 
p.s3='(b) Pr averaged over 25% heaviest-Pr TS days; OBS'; 
p.s4='(e) Pr averaged over 25% heaviest-Pr TS days; MOD'; 
p.s5='(c) Pr averaged over 25% heaviest-Pr MCS days; OBS';
p.s6='(f) Pr averaged over 25% heaviest-Pr MCS days; MOD';
a=[1 50]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.optit=0;
plot_2d_6panel_new(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig7a: Precipitation averaged over certain AR/TS/TD/MCS days%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %weather type mean prday
p.vname='Fig7a_prday_idpct_U50'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=128; p.c='k';
i=3; no=30;
v=ob.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z1]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z1_avg=mean(a(id).*b);
v=v0.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z2]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z2_avg=mean(a(id).*b);
v=ob.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z3]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z3_avg=mean(a(id).*b);
v=v0.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z4]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z4_avg=mean(a(id).*b);
v=ob.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z5]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z5_avg=mean(a(id).*b);
v=v0.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z6]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z6_avg=mean(a(id).*b);
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) Pr averaged over 50% heaviest-Pr AR days; OBS';
p.s2='(d) Pr averaged over 50% heaviest-Pr AR days; MOD'; 
p.s3='(b) Pr averaged over 50% heaviest-Pr TS days; OBS'; 
p.s4='(e) Pr averaged over 50% heaviest-Pr TS days; MOD'; 
p.s5='(c) Pr averaged over 50% heaviest-Pr MCS days; OBS';
p.s6='(f) Pr averaged over 50% heaviest-Pr MCS days; MOD';
a=[1 40]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.optit=0;
plot_2d_6panel_new(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig7b: Precipitation averaged over certain AR/TS/TD/MCS days%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %p.vname='prday_idavg_U10';
p.vname='Fig7b_prday_idpct_U10'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=128; p.c='k';
i=5; no=30;
v=ob.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z1]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z1_avg=mean(a(id).*b);
v=v0.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z2]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z2_avg=mean(a(id).*b);
v=ob.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z3]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z3_avg=mean(a(id).*b);
v=v0.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z4]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z4_avg=mean(a(id).*b);
v=ob.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z5]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z5_avg=mean(a(id).*b);
v=v0.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z6]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z6_avg=mean(a(id).*b);
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) Pr averaged over 10% heaviest-Pr AR days; OBS';
p.s2='(d) Pr averaged over 10% heaviest-Pr AR days; MOD'; 
p.s3='(b) Pr averaged over 10% heaviest-Pr TS days; OBS'; 
p.s4='(e) Pr averaged over 10% heaviest-Pr TS days; MOD'; 
p.s5='(c) Pr averaged over 10% heaviest-Pr MCS days; OBS';
p.s6='(f) Pr averaged over 10% heaviest-Pr MCS days; MOD';
a=[1 80]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.optit=0;
plot_2d_6panel_new(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig8: Precipitation averaged over certain AR/TS/TD/MCS days%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %p.vname='prday_idavg_L25';
p.vname='Fig8'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=128; p.c='k';
i=1; no=30;
v=ob.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z1]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z1_avg=mean(a(id).*b);
v=v0.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z2]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z2_avg=mean(a(id).*b);
v=ob.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z3]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z3_avg=mean(a(id).*b);
v=v0.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z4]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z4_avg=mean(a(id).*b);
v=ob.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z5]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z5_avg=mean(a(id).*b);
v=v0.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z6]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z6_avg=mean(a(id).*b);
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) Pr averaged over 25% lightest-Pr AR days; OBS';
p.s2='(d) Pr averaged over 25% lightest-Pr AR days; MOD'; 
p.s3='(b) Pr averaged over 25% lightest-Pr TS days; OBS'; 
p.s4='(e) Pr averaged over 25% lightest-Pr TS days; MOD'; 
p.s5='(c) Pr averaged over 25% lightest-Pr MCS days; OBS';
p.s6='(f) Pr averaged over 25% lightest-Pr MCS days; MOD';
a=[1 25]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; 
plot_2d_6panel_new(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig8a: Precipitation averaged over certain AR/TS/TD/MCS days%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %weather type mean prday
p.vname='Fig8a_prday_idpct_L50'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=128; p.c='k';
i=2; no=30;
v=ob.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z1]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z1_avg=mean(a(id).*b);
v=v0.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z2]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z2_avg=mean(a(id).*b);
v=ob.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z3]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z3_avg=mean(a(id).*b);
v=v0.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z4]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z4_avg=mean(a(id).*b);
v=ob.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z5]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z5_avg=mean(a(id).*b);
v=v0.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z6]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z6_avg=mean(a(id).*b);
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) Pr averaged over 50% lightest-Pr AR days; OBS';
p.s2='(d) Pr averaged over 50% lightest-Pr AR days; MOD'; 
p.s3='(b) Pr averaged over 50% lightest-Pr TS days; OBS'; 
p.s4='(e) Pr averaged over 50% lightest-Pr TS days; MOD'; 
p.s5='(c) Pr averaged over 50% lightest-Pr MCS days; OBS';
p.s6='(f) Pr averaged over 50% lightest-Pr MCS days; MOD';
a=[1 25]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; 
plot_2d_6panel_new(p);

