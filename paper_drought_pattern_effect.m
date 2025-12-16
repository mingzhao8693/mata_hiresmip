%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
latlon=[0 360 -90 90];region='global';
%latlon=[180 360 0 90];region='nameri';
%o=readobs(latlon,region,'c192',false);
%o=readobs(latlon,region,'c96',true);
%o=readobs(latlon,region,'c48',false);
%fn=strcat('/work/miz/mat_hiresmip/obs_',region,'_to_c48.mat'); load(fn); o.mod='c48';
fn=strcat('/work/miz/mat_hiresmip/obs_',region,'_to_c96.mat'); load(fn); o.mod='c96';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c96';
p.do_trend=1; p.do_scalar=0; p.myr=1; p.opt=2; p.do_3d_atm=1; 
p.yr1='1950'; p.yr2='2020'; p.syr= 31;p.nyr=41; p.y1=1980; p.y2=2020;
tpath='/archive/Ming.Zhao/awg/2023.04/';
p.expn='c192L33_am4p0_amip_HIRESMIP_HX_4xCO2_p2K'; v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_p2K'; v=tsana_hiresmip_new(o,tpath,p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c96';
p.do_trend=0; p.do_scalar=0; p.myr=1; p.opt=2; p.do_3d_atm=0; 
p.yr1='0002'; p.yr2='0031'; p.syr=1; p.nyr=30; p.y1=0002; p.y2=0031; 
tpath='/archive/Ming.Zhao/awg/2023.04/'; 
p.expn='c192L33_CM4X_2010climo';            v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_1850climo';            v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_2010aero';             v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_2010climo_p2K';        v=tsana_hiresmip_new(o,tpath,p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c96';
p.do_trend=0; p.do_scalar=0; p.myr=1; p.opt=2; p.do_3d_atm=0; 
p.yr1='0002'; p.yr2='0101'; p.syr=1; p.nyr=100; p.y1=0002; p.y2=0101; 
tpath='/archive/Ming.Zhao/awg/2023.04/'; 
%p.yr1='0002'; p.yr2='0101'; p.syr=1; p.nyr=30; p.y1=0002; p.y2=0031; p.opt=0;
p.expn='c192L33_am4p0_2010climo_old';              v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_4xCO2';            v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_piCO2';            v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_2xCO2';            v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_p4K';              v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_p1K';              v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_4xCO2_p4K';        v=tsana_hiresmip_new(o,tpath,p);
%p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear';   v=tsana_hiresmip_new(o,tpath,p);
%p.expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2'; v=tsana_hiresmip_new(o,tpath,p);
%p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs'; v=tsana_hiresmip_new(o,tpath,p);
%p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs';    v=tsana_hiresmip_new(o,tpath,p);
%p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_so_45_75s_obs';    v=tsana_hiresmip_new(o,tpath,p);
%p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_atlantic_mdr_obs'; v=tsana_hiresmip_new(o,tpath,p);
%p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_best_wegradient';  v=tsana_hiresmip_new(o,tpath,p);
%p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_worst_wegradient'; v=tsana_hiresmip_new(o,tpath,p);
%p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_2best_wegradient'; v=tsana_hiresmip_new(o,tpath,p);
%p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_2worst_wegradient';v=tsana_hiresmip_new(o,tpath,p);
%p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_middle_wegradient';v=tsana_hiresmip_new(o,tpath,p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load ts_ana%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ph='/archive/Ming.Zhao/awg/2023.04/'; f='_global_opt2.c96_tsana_hiresmip_new_2_101.mat';
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_best_wegradient';  n=strcat(ph,e,'/',e,f);load(n);z.w1a=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_2best_wegradient'; n=strcat(ph,e,'/',e,f);load(n);z.w1b=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_middle_wegradient';n=strcat(ph,e,'/',e,f);load(n);z.w1c=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_2worst_wegradient';n=strcat(ph,e,'/',e,f);load(n);z.w1d=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_worst_wegradient'; n=strcat(ph,e,'/',e,f);load(n);z.w1e=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs'; n=strcat(ph,e,'/',e,f);load(n);z.w1A=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs';    n=strcat(ph,e,'/',e,f);load(n);z.w1B=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_so_45_75s_obs';    n=strcat(ph,e,'/',e,f);load(n);z.w1C=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_atlantic_mdr_obs'; n=strcat(ph,e,'/',e,f);load(n);z.w1D=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ph='/archive/Ming.Zhao/awg/2023.04/'; f='_global_opt2.c96_tsana_hiresmip_new_2_101.mat';
e='c192L33_am4p0_2010climo_old';                    n=strcat(ph,e,'/',e,f); load(n);z.v0=v;
e='c192L33_am4p0_2010climo_piCO2';                  n=strcat(ph,e,'/',e,f); load(n);z.g0=v;
e='c192L33_am4p0_2010climo_2xCO2';                  n=strcat(ph,e,'/',e,f); load(n);z.g2=v;
e='c192L33_am4p0_2010climo_4xCO2';                  n=strcat(ph,e,'/',e,f); load(n);z.g4=v;
e='c192L33_am4p0_2010climo_p1K';                    n=strcat(ph,e,'/',e,f); load(n);z.u1=v;
e='c192L33_am4p0_2010climo_p4K';                    n=strcat(ph,e,'/',e,f); load(n);z.u4=v;
e='c192L33_am4p0_2010climo_4xCO2_p4K';              n=strcat(ph,e,'/',e,f); load(n);z.gu=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear';  n=strcat(ph,e,'/',e,f); load(n);z.p1=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_times_2';n=strcat(ph,e,'/',e,f); load(n);z.p2=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs'; n=strcat(ph,e,'/',e,f);load(n);z.w1A=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs';    n=strcat(ph,e,'/',e,f);load(n);z.w1B=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_so_45_75s_obs';    n=strcat(ph,e,'/',e,f);load(n);z.w1C=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_atlantic_mdr_obs'; n=strcat(ph,e,'/',e,f);load(n);z.w1D=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ph='/archive/Ming.Zhao/awg/2023.04/'; f='_global_opt2.c96_tsana_hiresmip_new_2_101.mat';
e='c192L33_am4p0_2010climo_old';                    n=strcat(ph,e,'/',e,f); load(n);z.v0=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear';  n=strcat(ph,e,'/',e,f); load(n);z.w1=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_times_2';n=strcat(ph,e,'/',e,f); load(n);z.w2=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute changes in global mean SAT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.dco2_1=284/387; p.dco2_2=2; p.dco2_3=4;
s=z.v0.s; p.lon=s.lon; p.lat=s.lat; p.lm=s.lm; aa=s.aa; p.aa=aa;
a0=z.v0.sfc.tref.tavg0;
a =z.g0.sfc.tref.tavg0-a0;  p.dT1 =mean(mean(a.*aa));
a =z.g2.sfc.tref.tavg0-a0;  p.dT2 =mean(mean(a.*aa));
a =z.g4.sfc.tref.tavg0-a0;  p.dT3 =mean(mean(a.*aa));
a =z.u1.sfc.tref.tavg0-a0;  p.dT4 =mean(mean(a.*aa));
a =z.u4.sfc.tref.tavg0-a0;  p.dT5 =mean(mean(a.*aa));
a =z.gu.sfc.tref.tavg0-a0;  p.dT6 =mean(mean(a.*aa));
a =z.p1.sfc.tref.tavg0-a0;  p.dT7 =mean(mean(a.*aa));
a =z.p2.sfc.tref.tavg0-a0;  p.dT8 =mean(mean(a.*aa));
a =z.w1A.sfc.tref.tavg0-a0; p.dT9 =mean(mean(a.*aa));
a =z.w1B.sfc.tref.tavg0-a0; p.dT10=mean(mean(a.*aa));
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
       "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
s1='4xCO2'; s2='uniform SST warming'; s3='SPEAR-pattern M'; s4='Observed-pattern';
s5='SPEAR-pattern M EPAC-obs'; s6='SPEAR-pattern M IPWP-obs';
p.s1 =strcat(s1); p.s2 =strcat(s2); p.s3 =strcat(s3); p.s4 =strcat(s4); p.s5 =strcat(s5); p.s6 =strcat(s6); 
p.xmin =0;  p.xmax =360; p.ymin=-90; p.ymax=90; p.xy=[p.xmin p.xmax p.ymin p.ymax]; 
p.co='k'; p.co_add='c'; p.do_add=1; p.show='off';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig0a: Tsurf absolute%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='tsurf_abs'; del=' $\Delta$'; p.varn=strcat(del,'Ts');
p.unit0='$\rm{KK^{-1}}$'; p.unit='$\rm{K}$'; p.unit_bar='K or KK^{-1}'; p.pos1=-0.08;
a=2; p.cmin1=-a; p.cmax1=a; p.cmin2=-a; p.cmax2=a;
imk=z.v0.sfc.ice.tavg0;  p.id=(s.lm>=1|s.lm<1); aa0=p.aa;
nyr1=100; nyr2=100; mskopt=0; num=30; N=365*100;
v=z.v0.sfc; a=squeeze(v.tsurf.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.g0.sfc; a=squeeze(v.tsurf.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff;       p.v1=a; p.dv1=mean(mean(a.*aa0)); p.isig1=isig; p.v1_add=a0; p.v1_addbin=[1 5 9],
v=z.w0.sfc; a=squeeze(v.tsurf.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0)); p.isig2=isig;
v=z.w1.sfc; a=squeeze(v.tsurf.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT3; p.v3=a; p.dv3=mean(mean(a.*aa0)); p.isig3=isig;
v=z.w2.sfc; a=squeeze(v.tsurf.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT4; p.v4=a; p.dv4=mean(mean(a.*aa0)); p.isig4=isig;
%v=z.w4.sfc; a=squeeze(v.tsurf.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
%[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
%a=diff/p.dT2a; p.v2a=a; p.dv2a=mean(mean(a.*aa0)); p.isig2a=isig; %p.v4=p.v5;
v=z.w1A.sfc; a=squeeze(v.tsurf.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT5; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig;
v=z.w1B.sfc; a=squeeze(v.tsurf.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT6; p.v6=a; p.dv6=mean(mean(a.*aa0)); p.isig6=isig; %p.v4=p.v5;
p.v7=p.v5-p.v3; p.dv7=p.dv5-p.dv3; p.isig7=p.isig3;
p.v8=p.v6-p.v3; p.dv8=p.dv6-p.dv3; p.isig8=p.isig3;
plot_2d_8panel_drought(p); %plot_2d_4panel_drought(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig0b: Tref absolute%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='tref_abs'; del=' $\Delta$'; p.varn=strcat(del,'TAS');
p.unit0='$\rm{KK^{-1}}$'; p.unit='$\rm{K}$'; p.unit_bar='K or KK^{-1}'; p.pos1=-0.08;
a=2; p.cmin1=-a; p.cmax1=a; p.cmin2=-a; p.cmax2=a;
imk=z.v0.sfc.ice.tavg0;  p.id=(s.lm>=1|s.lm<1); aa0=p.aa;
nyr1=100; nyr2=100; mskopt=0; num=30; N=365*100;
v=z.v0.sfc; a=squeeze(v.tref.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.g0.sfc; a=squeeze(v.tref.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff;       p.v1=a; p.dv1=mean(mean(a.*aa0)); p.isig1=isig; p.v1_add=a0; p.v1_addbin=[1 5 9],
v=z.w0.sfc; a=squeeze(v.tref.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0)); p.isig2=isig;
v=z.w1.sfc; a=squeeze(v.tref.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT3; p.v3=a; p.dv3=mean(mean(a.*aa0)); p.isig3=isig;
v=z.w2.sfc; a=squeeze(v.tref.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT4; p.v4=a; p.dv4=mean(mean(a.*aa0)); p.isig4=isig;
%v=z.w4.sfc; a=squeeze(v.tref.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
%[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
%a=diff/p.dT2a; p.v2a=a; p.dv2a=mean(mean(a.*aa0)); p.isig2a=isig; %p.v4=p.v5;
v=z.w1A.sfc; a=squeeze(v.tref.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT5; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig;
v=z.w1B.sfc; a=squeeze(v.tref.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT6; p.v6=a; p.dv6=mean(mean(a.*aa0)); p.isig6=isig;
plot_2d_6panel_drought(p); %plot_2d_4panel_drought(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig1a: precip absolute%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='precip_abs'; del=' $\Delta$'; p.varn=strcat(del,'P');
p.unit0='$\rm{mmday^{-1}K^{-1}}$'; p.unit='$\rm{mmday^{-1}}$'; p.unit_bar='mmday^{-1} or mmday^{-1}K^{-1}'; p.pos1=-0.08;
a=1; p.cmin1=-a; p.cmax1=a; p.cmin2=-a; p.cmax2=a;
imk=z.v0.sfc.ice.tavg0;  p.id=(s.lm>=1|s.lm<1); aa0=p.aa;
nyr1=100; nyr2=100; mskopt=0; num=30; N=365*100;
v=z.v0.sfc; a=squeeze(v.pcp.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.g0.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff;       p.v1=a; p.dv1=mean(mean(a.*aa0)); p.isig1=isig; p.v1_add=a0; p.v1_addbin=[1 5 9],
v=z.w0.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0)); p.isig2=isig;
v=z.w1.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT3; p.v3=a; p.dv3=mean(mean(a.*aa0)); p.isig3=isig;
v=z.w2.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT4; p.v4=a; p.dv4=mean(mean(a.*aa0)); p.isig4=isig;
%v=z.w4.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
%[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
%a=diff/p.dT5; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig; %p.v4=p.v5;
v=z.w1A.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT5; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig;
v=z.w1B.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT6; p.v6=a; p.dv6=mean(mean(a.*aa0)); p.isig6=isig;
p.v7=p.v5-p.v3; p.dv7=p.dv5-p.dv3; p.isig7=p.isig3;
p.v8=p.v6-p.v3; p.dv8=p.dv6-p.dv3; p.isig8=p.isig3;
plot_2d_8panel_drought(p); %plot_2d_4panel_drought(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig1b: precip relative change%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='precip_rel'; del='; $\Delta$'; p.varn=strcat(del,'P');
p.unit0='$\rm{\%K^{-1}}$'; p.unit='$\rm{\%}$'; p.unit_bar='% or %K^{-1}'; p.pos1=-0.08;
p.xmin=0; p.xmax=360; p.ymin=-90; p.ymax=90; p.do_add=1; p.show='off'; a=40;
p.cmin1=-a; p.cmax1=a; p.cmin2=-a; p.cmax2=a; p.co='k'; p.co_add='c';
p.cmin3=-a; p.cmax3=a; p.cmin4=-a; p.cmax4=a; 
imk=z.v0.sfc.ice.tavg0;  p.id=(s.lm>=1|s.lm<1); aa0=p.aa;
nyr1=100; nyr2=100; mskopt=0; num=30; N=365*100;
v=z.v0.sfc; a=squeeze(v.pcp.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.g0.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=pdiff;       p.v1=a; p.dv1=(a1_avg-a0_avg)/a0_avg*100; p.isig1=isig; p.v1_add=a0; p.v1_addbin=[1 5 9],
v=z.w0.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=pdiff/p.dT2; p.v2=a; p.dv2=(a1_avg-a0_avg)/a0_avg/p.dT2*100; p.isig2=isig;
v=z.w1.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=pdiff/p.dT3; p.v3=a; p.dv3=(a1_avg-a0_avg)/a0_avg/p.dT3*100; p.isig3=isig;
v=z.w2.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=pdiff/p.dT4; p.v4=a; p.dv4=(a1_avg-a0_avg)/a0_avg/p.dT4*100; p.isig4=isig;
v=z.w4.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=pdiff/p.dT5; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig; %p.v4=p.v5;
p.xmin=0; p.xmax=360; p.ymin=-90; p.ymax=90; p.xy=[p.xmin p.xmax p.ymin p.ymax];
plot_2d_6panel_drought(p); %plot_2d_4panel_drought(p)
plot_2d_4panel_drought(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2a: prec_land absolute%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='prec_land_abs'; del=' $\Delta$'; p.varn=strcat(del,'P');
p.unit0='$\rm{mmday^{-1}K^{-1}}$'; p.unit='$\rm{mmday^{-1}}$'; p.unit_bar='mmday^{-1} or mmday^{-1}K^{-1}'; p.pos1=-0.08;
p.xmin =0;  p.xmax =360; p.ymin=-90; p.ymax=90; p.do_add=1; p.show='off'; a=1;
p.cmin1=-a; p.cmax1=a; p.cmin2=-a; p.cmax2=a; p.co='k'; p.co_add='c';
p.cmin3=-a; p.cmax3=a; p.cmin4=-a; p.cmax4=a; 
imk=z.v0.sfc.ice.tavg0;  id=(s.lm>=1); aa0=p.aa;
nyr1=100; nyr2=100; mskopt=0; num=30; N=365*100;
v=z.v0.sfc; a=squeeze(v.prec_land.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.g0.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff;       p.v1=a; p.dv1=mean(mean(a(id).*aa0(id))); p.isig1=isig; p.v1_add=a0; p.v1_addbin=[1 5 9],
v=z.w0.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v2=a; p.dv2=mean(mean(a(id).*aa0(id))); p.isig2=isig;
v=z.w1.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT3; p.v3=a; p.dv3=mean(mean(a(id).*aa0(id))); p.isig3=isig;
v=z.w2.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT4; p.v4=a; p.dv4=mean(mean(a(id).*aa0(id))); p.isig4=isig;
v=z.w4.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT5; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig; %p.v4=p.v5;
p.xmin=0; p.xmax=360; p.ymin=-90; p.ymax=90; p.xy=[p.xmin p.xmax p.ymin p.ymax];
plot_2d_6panel_drought(p); %plot_2d_4panel_drought(p)
plot_2d_4panel_drought(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2b: precip relative change%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='precip_rel'; del='; $\Delta$'; p.varn=strcat(del,'P');
p.unit0='$\rm{\%K^{-1}}$'; p.unit='$\rm{\%}$'; p.unit_bar='% or %K^{-1}'; p.pos1=-0.08;
p.xmin=0; p.xmax=360; p.ymin=-90; p.ymax=90; p.do_add=1; p.show='off'; a=40;
p.cmin1=-a; p.cmax1=a; p.cmin2=-a; p.cmax2=a; p.co='k'; p.co_add='c';
p.cmin3=-a; p.cmax3=a; p.cmin4=-a; p.cmax4=a; 
imk=z.v0.sfc.ice.tavg0;  p.id=(s.lm>=1|s.lm<1); aa0=p.aa;
nyr1=100; nyr2=100; mskopt=0; num=30; N=365*100;
v=z.v0.sfc; a=squeeze(v.prec_land.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.g0.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=pdiff;       p.v1=a; p.dv1=(a1_avg-a0_avg)/a0_avg*100; p.isig1=isig; p.v1_add=a0; p.v1_addbin=[1 5 9],
v=z.w0.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=pdiff/p.dT2; p.v2=a; p.dv2=(a1_avg-a0_avg)/a0_avg/p.dT2*100; p.isig2=isig;
v=z.w1.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=pdiff/p.dT3; p.v3=a; p.dv3=(a1_avg-a0_avg)/a0_avg/p.dT3*100; p.isig3=isig;
v=z.w2.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=pdiff/p.dT4; p.v4=a; p.dv4=(a1_avg-a0_avg)/a0_avg/p.dT4*100; p.isig4=isig;
v=z.w4.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=pdiff/p.dT5; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig; %p.v4=p.v5;
p.xmin=0; p.xmax=360; p.ymin=-90; p.ymax=90; p.xy=[p.xmin p.xmax p.ymin p.ymax];
plot_2d_6panel_drought(p); %plot_2d_4panel_drought(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
a1='SPEAR-pattern M;'; a2='Observed-pattern;'; a3='Uniform-pattern;';
del=' $\Delta$'; s1='4xCO2'; s2='p1K'; s3='SPEAR-pattern M'; s4='Observed-pattern';
varn='prec-land (kg/m2/s; land precip)';
p.s1 =strcat(s1); p.s2 =strcat(s2); p.s3 =strcat(s3); p.s4 =strcat(s4); 
p.unit0='$\rm{kgm^{-2}s^{-1}K^{-1}}$'; p.unit='\rm{kgm^{-2}s^{-1}K^{-1}}'; p.unit_bar=p.unit; p.pos1=-0.08;
p.vname='prec-land'; p.cmin1=-1; p.cmax1=1; p.cmin2=-1; p.cmax2=1;p.co='k';
p.cmin3=-5.5; p.cmax3=5.5; p.cmin4=-5.5; p.cmax4=5.5; p.cmin5=-5.5; p.cmax5=5.5; 
p.xmin=0; p.xmax=360; p.ymin=-90; p.ymax=90; 
p.do_add=0; p.show='off';
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa;
a0=z.v0.sfc.tref.tavg0;
a =z.g0.sfc.tref.tavg0-a0; p.dT1=mean(mean(a.*aa));
a =z.w0.sfc.tref.tavg0-a0; p.dT2=mean(mean(a.*aa));
a =z.w1.sfc.tref.tavg0-a0; p.dT3=mean(mean(a.*aa));
a =z.w2.sfc.tref.tavg0-a0; p.dT4=mean(mean(a.*aa));
a =z.w4.sfc.tref.tavg0-a0; p.dT5=mean(mean(a.*aa));
imk=z.v0.sfc.ice.tavg0;  aa0=aa;
v=z.v0.s; p.lm=v.lm; p.aa=v.aa; p.lon=v.lon; p.lat=v.lat; p.id=(s.lm>=1);
nyr1=100; nyr2=100; mskopt=0; num=30; N=365*100;
v=z.v0.sfc; a=squeeze(v.prec_land.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.g0.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v1=a; p.dv1=mean(mean(a.*aa0)); p.isig1=isig;
v=z.w0.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0)); p.isig2=isig;
v=z.w1.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT3; p.v3=a; p.dv3=mean(mean(a.*aa0)); p.isig3=isig;
v=z.w2.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT4; p.v4=a; p.dv4=mean(mean(a.*aa0)); p.isig4=isig;
v=z.w4.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT5; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig; %p.v4=p.v5;
p.xmin=0; p.xmax=360; p.ymin=-90; p.ymax=90; p.xy=[p.xmin p.xmax p.ymin p.ymax];
a=[-2 2]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c='k'; p.optit=1; p.expn='sst_pattern';
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.nn=64; p.opt=2;
plot_2d_4panel_drought(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2: prec_land relative change%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
a1='SPEAR-pattern M;'; a2='Observed-pattern;'; a3='Uniform-pattern;';
del=' $\Delta$'; s1='4xCO2'; s2='p1K'; s3='SPEAR-pattern M'; s4='Observed-pattern';
varn='prec-land (kg/m2/s; land precip)';
p.s1 =strcat(s1); p.s2 =strcat(s2); p.s3 =strcat(s3); p.s4 =strcat(s4); 
p.unit0='$\rm{kgm^{-2}s^{-1}K^{-1}}$'; p.unit='\rm{kgm^{-2}s^{-1}K^{-1}}'; p.unit_bar=p.unit; p.pos1=-0.08;
p.vname='rv-o-h2o'; p.cmin1=-1; p.cmax1=1; p.cmin2=-1; p.cmax2=1;p.co='k';
p.cmin3=-5.5; p.cmax3=5.5; p.cmin4=-5.5; p.cmax4=5.5; p.cmin5=-5.5; p.cmax5=5.5; 
p.xmin=0; p.xmax=360; p.ymin=-90; p.ymax=90; 
p.do_add=0; p.show='off';
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa;
a0=z.v0.sfc.tref.tavg0;
a =z.g0.sfc.tref.tavg0-a0; p.dT1=mean(mean(a.*aa));
a =z.w0.sfc.tref.tavg0-a0; p.dT2=mean(mean(a.*aa));
a =z.w1.sfc.tref.tavg0-a0; p.dT3=mean(mean(a.*aa));
a =z.w2.sfc.tref.tavg0-a0; p.dT4=mean(mean(a.*aa));
a =z.w4.sfc.tref.tavg0-a0; p.dT5=mean(mean(a.*aa));
imk=z.v0.sfc.ice.tavg0;  aa0=aa;
v=z.v0.s; p.lm=v.lm; p.aa=v.aa; p.lon=v.lon; p.lat=v.lat; p.id=(s.lm>=1);
nyr1=100; nyr2=100; mskopt=0; num=30; N=365*100;
v=z.v0.sfc; a=squeeze(v.prec_land.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.g0.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=pdiff/p.dT1; p.v1=a; p.dv1=mean(mean(a.*aa0)); p.isig1=isig;
v=z.w0.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=pdiff/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0)); p.isig2=isig;
v=z.w1.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=pdiff/p.dT3; p.v3=a; p.dv3=mean(mean(a.*aa0)); p.isig3=isig;
v=z.w2.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=pdiff/p.dT4; p.v4=a; p.dv4=mean(mean(a.*aa0)); p.isig4=isig;
v=z.w4.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=pdiff/p.dT5; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig; %p.v4=p.v5;
p.xmin=0; p.xmax=360; p.ymin=-90; p.ymax=90; p.xy=[p.xmin p.xmax p.ymin p.ymax];
a=[-2 2]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c='k'; p.optit=1; p.expn='sst_pattern';
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.nn=64; p.opt=2;
plot_2d_4panel_drought(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2: rv_o_h2o%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
a1='SPEAR-pattern M;'; a2='Observed-pattern;'; a3='Uniform-pattern;';
del=' $\Delta$'; s1='4xCO2'; s2='p1K'; s3='SPEAR-pattern M'; s4='Observed-pattern';
varn='rv-o-h2o (kg/m2/s; river outflow)';
p.s1 =strcat(s1); p.s2 =strcat(s2); p.s3 =strcat(s3); p.s4 =strcat(s4); 
p.unit0='$\rm{kgm^{-2}s^{-1}K^{-1}}$'; p.unit='\rm{kgm^{-2}s^{-1}K^{-1}}'; p.unit_bar=p.unit; p.pos1=-0.08;
p.vname='rv-o-h2o'; p.cmin1=-1; p.cmax1=1; p.cmin2=-1; p.cmax2=1;p.co='k';
p.cmin3=-5.5; p.cmax3=5.5; p.cmin4=-5.5; p.cmax4=5.5; p.cmin5=-5.5; p.cmax5=5.5; 
p.xmin=0; p.xmax=360; p.ymin=-90; p.ymax=90; 
p.do_add=0; p.show='off';
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa;
a0=z.v0.sfc.tref.tavg0;
a =z.g0.sfc.tref.tavg0-a0; p.dT1=mean(mean(a.*aa));
a =z.w0.sfc.tref.tavg0-a0; p.dT2=mean(mean(a.*aa));
a =z.w1.sfc.tref.tavg0-a0; p.dT3=mean(mean(a.*aa));
a =z.w2.sfc.tref.tavg0-a0; p.dT4=mean(mean(a.*aa));
a =z.w4.sfc.tref.tavg0-a0; p.dT5=mean(mean(a.*aa));
imk=z.v0.sfc.ice.tavg0;  aa0=aa;

v=z.v0.s; p.lm=v.lm; p.aa=v.aa; p.lon=v.lon; p.lat=v.lat; p.id=(s.lm>=1);
nyr1=100; nyr2=100; mskopt=0; num=30; N=365*100;
v=z.v0.sfc; a=squeeze(v.rv_o_h2o.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.g0.sfc; a=squeeze(v.rv_o_h2o.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v1=a; p.dv1=mean(mean(a.*aa0)); p.isig1=isig;
v=z.w0.sfc; a=squeeze(v.rv_o_h2o.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0)); p.isig2=isig;
v=z.w1.sfc; a=squeeze(v.rv_o_h2o.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT3; p.v3=a; p.dv3=mean(mean(a.*aa0)); p.isig3=isig;
v=z.w2.sfc; a=squeeze(v.rv_o_h2o.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT4; p.v4=a; p.dv4=mean(mean(a.*aa0)); p.isig4=isig;
v=z.w4.sfc; a=squeeze(v.rv_o_h2o.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT5; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig; %p.v4=p.v5;

p.xmin=0; p.xmax=360; p.ymin=-90; p.ymax=90; p.xy=[p.xmin p.xmax p.ymin p.ymax];
a=[-20 20]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c='k'; p.optit=1; p.expn='sst_pattern';
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.nn=64; p.opt=2;
plot_2d_4panel_drought(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%end of Fig4%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig4%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
a1='SPEAR-pattern M;'; a2='Observed-pattern;'; a3='Uniform-pattern;';
del=' $\Delta$';
s0='prec-land (kg/m2/s; land precip)';
s1='mrros (kg/m2/s; surface runoff)';
s2='rv-o-h2o (kg/m2/s; river outflow)';
s3='mrsos (kg/m2; upper layer soil moisture)';
p.s1 =strcat(a1,del,s0); p.s2 =strcat(a2,del,s0); p.s3 =strcat(a3,del,s0);
p.s4 =strcat(del,s1); p.s5 =strcat(del,s1); p.s6 =strcat(del,s1);
p.s7 =strcat(del,s2); p.s8 =strcat(del,s2); p.s9 =strcat(del,s2);
p.s10=strcat(del,s3); p.s11=strcat(del,s3); p.s12=strcat(del,s3);
p.unit0='$\rm{kgm^{-2}s^{-1}K^{-1}}$'; p.unit='\rm{kgm^{-2}s^{-1}K^{-1}}'; p.unit_bar=p.unit; p.pos1=-0.08;
p.vname='land'; p.cmin1=-1; p.cmax1=1; p.cmin2=-1; p.cmax2=1;p.co='k';
p.cmin3=-5.5; p.cmax3=5.5; p.cmin4=-5.5; p.cmax4=5.5; p.cmin5=-5.5; p.cmax5=5.5; 
p.xmin=0; p.xmax=360; p.ymin=-90; p.ymax=90; 
p.do_add=0; p.show='off';
s=z.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa;
a0=z.v0.sfc.tref.tavg0;
a =z.w1.sfc.tref.tavg0-a0; p.dT1=mean(mean(a.*aa));
a =z.w2.sfc.tref.tavg0-a0; p.dT2=mean(mean(a.*aa));
imk=z.v0.sfc.ice.tavg0;  aa0=aa;

v=z.v0.s; p.lm=v.lm; aa0=v.aa; p.lon=v.lon; p.lat=v.lat; 
nyr1=100; nyr2=100; mskopt=0; num=30; N=365*100;

v=z.v0.sfc; a=squeeze(v.prec_land.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.w1.sfc; a=squeeze(v.prec_land.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
v=z.w2.sfc; a=squeeze(v.prec_land.ann); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v1=a; p.dv1=mean(mean(a.*aa0)); p.isig1=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v2=a; p.dv2=mean(mean(a.*aa0)); p.isig2=isig;

v=z.v0.sfc; a=squeeze(v.mrros.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.w1.sfc; a=squeeze(v.mrros.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
v=z.w2.sfc; a=squeeze(v.mrros.ann); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v4=a; p.dv4=mean(mean(a.*aa0)); p.isig4=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig;

v=z.v0.sfc; a=squeeze(v.rv_o_h2o.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.w1.sfc; a=squeeze(v.rv_o_h2o.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
v=z.w2.sfc; a=squeeze(v.rv_o_h2o.ann); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v7=a; p.dv7=mean(mean(a.*aa0)); p.isig7=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v8=a; p.dv8=mean(mean(a.*aa0)); p.isig8=isig;

v=z.v0.sfc; a=squeeze(v.mrsos.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.w1.sfc; a=squeeze(v.mrsos.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
v=z.w2.sfc; a=squeeze(v.mrsos.ann); a2=squeeze(mean(a,1)); s2=squeeze(std(a,1)); n2=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT1; p.v10=a; p.dv10=mean(mean(a.*aa0)); p.isig10=isig;
[diff,me,pdiff,a0_avg,a2_avg,isig]=compute_diff(a0,s0,n0,a2,s2,n2,num,nyr1,nyr2,aa0,mskopt);
a=diff/p.dT2; p.v11=a; p.dv11=mean(mean(a.*aa0)); p.isig11=isig;
p.xmin=190; p.xmax=310; p.ymin=0; p.ymax=90; 
plot_pattern_effect_test(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%end of Fig4%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
