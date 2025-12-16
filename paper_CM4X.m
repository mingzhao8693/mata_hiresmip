%below opt=1 for writing mat file to /work/miz 
%below opt=2 for writing mat file to /archive
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
latlon=[0 360 -90 90];region='global';mod='c96';myr=5; opt=1;
%latlon=[0 360 30 90];region='nhextr';mod='c96';myr=5; opt=2;
%latlon=[0 360 -30 30];region='tropic';mod='c96';myr=5; opt=2;
%latlon=[150 250 -5 5]; region='equpac'; nyr=5; myr=1; opt=0; 
%read in or generate observation data:
%o=readobs(latlon,region,'c96',true);
%o=readobs(latlon,region,'c48',false);
%fn=strcat('/work/miz/mat_hiresmip/obs_',region,'_to_c48.mat'); load(fn); o.mod='c48';
fn=strcat('/work/miz/mat_hiresmip/obs_',region,'_to_c96.mat'); load(fn); o.mod='c96';
%CM4X analysis%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c48';
p.do_trend=0; p.do_scalar=0; p.myr=1; p.opt=2; p.do_3d_atm=0; 
p.yr1='0001'; p.yr2='0350'; p.syr=1; p.nyr=350; p.y1=0001; p.y2=0350; 
tpath='/archive/Ming.Zhao/CM4/CM4X/'; 
p.expn='CM4_piControl_c192_OM4p25_v7'; v=tsana_hiresmip_new(o,tpath,p);
p.yr1='0101'; p.yr2='0445'; p.syr=1; p.nyr=260; p.y1=0101; p.y2=0360;
p.expn='CM4_piControl_c192_OM4p125_v8'; v=tsana_hiresmip_new(o,tpath,p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c96';
p.do_trend=0; p.do_scalar=0; p.myr=1; p.opt=2; p.do_3d_atm=1; 
p.yr1='0002'; p.yr2='0031'; p.syr=1; p.nyr=15; p.y1=0002; p.y2=0031; 
tpath='/archive/Ming.Zhao/awg/2023.04/'; 
p.expn='c96L33_CM40_2010climo';      v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_CM40_1850climo';      v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_CM40_2010aero';       v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_CM40_2010climo_p2K';  v=tsana_hiresmip_new(o,tpath,p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c96';
p.do_trend=0; p.do_scalar=0; p.myr=1; p.opt=2; p.do_3d_atm=0; 
p.yr1='0002'; p.yr2='0101'; p.syr=1; p.nyr=100; p.y1=0002; p.y2=0101; 
tpath='/archive/Ming.Zhao/awg/2023.04/'; 
p.expn='c192L33_CM4X_1850climo_pisst_obs';     v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_1850climo_pisst_uniform'; v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_1850climo';               v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_2010GHG';                 v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_2010GHG_Photo';           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_2010aero';                v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_2010climo';               v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_2010VolOzone';            v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_2010climo_p2K';           v=tsana_hiresmip_new(o,tpath,p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c96';
p.do_trend=1; p.do_scalar=0; p.myr=1; p.opt=2; p.do_3d_atm=1; 
p.yr1='1950'; p.yr2='2020'; p.syr=31; p.nyr=41; p.y1=1980; p.y2=2020; %for c192L33_am4p0_amip_m01-05
tpath='/archive/Ming.Zhao/awg/2023.04/';
p.expn='c192L33_CM4X_amip';     v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_02';  v=tsana_hiresmip_new(o,tpath,p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/'; ext='_global_opt2.c96_tsana_hiresmip_new_2-31_0002-0031.mat';
expn='c96L33_CM40_2010climo';     fn=strcat(tpath,expn,'/',expn,ext); load(fn); vm0.pd=v;
expn='c96L33_CM40_2010aero';      fn=strcat(tpath,expn,'/',expn,ext); load(fn); vm0.ae=v;
expn='c96L33_CM40_2010climo_p2K'; fn=strcat(tpath,expn,'/',expn,ext); load(fn); vm0.p2=v;
expn='c96L33_CM40_1850climo';     fn=strcat(tpath,expn,'/',expn,ext); load(fn); vm0.pi=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calculation for CM4X
tpath='/archive/Ming.Zhao/awg/2023.04/'; ext='_global_opt2.c96_tsana_hiresmip_new_2-101_0002-0101.mat';
expn='c192L33_CM4X_1850climo_pisst_obs';     fn=strcat(tpath,expn,'/',expn,ext); load(fn); vm.c0=v;
expn='c192L33_CM4X_1850climo_pisst_uniform'; fn=strcat(tpath,expn,'/',expn,ext); load(fn); vm.u0=v;
expn='c192L33_CM4X_1850climo';               fn=strcat(tpath,expn,'/',expn,ext); load(fn); vm.p0=v;
expn='c192L33_CM4X_2010GHG';                 fn=strcat(tpath,expn,'/',expn,ext); load(fn); vm.g0=v;
expn='c192L33_CM4X_2010GHG_Photo';           fn=strcat(tpath,expn,'/',expn,ext); load(fn); vm.g1=v;
expn='c192L33_CM4X_2010aero';                fn=strcat(tpath,expn,'/',expn,ext); load(fn); vm.a0=v;
expn='c192L33_CM4X_2010climo';               fn=strcat(tpath,expn,'/',expn,ext); load(fn); vm.v0=v;
expn='c192L33_CM4X_2010VolOzone';            fn=strcat(tpath,expn,'/',expn,ext); load(fn); vm.vz=v;
expn='c192L33_CM4X_2010climo_p2K';           fn=strcat(tpath,expn,'/',expn,ext); load(fn); vm.w0=v;
ext='_global_opt2.c96_tsana_hiresmip_new_1980-2020_1950-2020.mat';
expn='c192L33_CM4X_amip';                    fn=strcat(tpath,expn,'/',expn,ext); load(fn); vm.m0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute changes in global mean SAT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%vm.u0=vm.p0; vm.c0=vm.p0;
z=vm;
s=z.v0.s; p.lon=s.lon; p.lat=s.lat; p.lm=s.lm; aa=s.aa; p.aa=aa;
a0=z.c0.sfc.tref.tavg0; %1850all including SSTs, radiative gases and aerosol emssions, and volcanos
a1=z.p0.sfc.tref.tavg0;  a=a1-a0; p.dT1 =mean(mean(a.*aa)); %1850allbutSST  minus 1850all (effect of SST change)
a2=z.u0.sfc.tref.tavg0;  a=a1-a2; p.dT2 =mean(mean(a.*aa)); %1850all+uniform warming minus 1850all (effect of uniform SST change)
a3=z.g0.sfc.tref.tavg0;  a=a3-a1; p.dT3 =mean(mean(a.*aa)); %2010GHG minus 1850allbutSST (effect of GHG only, not including CO2 photosynthesis)
a4=z.g1.sfc.tref.tavg0;  a=a4-a1; p.dT4 =mean(mean(a.*aa)); %2010GHG minus 1850allbutSST (effect of GHG only, including CO2 photosynthesis)
a5=z.a0.sfc.tref.tavg0;  a=a5-a1; p.dT5 =mean(mean(a.*aa)); %2010AERO minus 1850allbutSST (effect of AERO)
a6=z.v0.sfc.tref.tavg0;  a=a6-a1; p.dT6 =mean(mean(a.*aa)); %2010CLIM minus 1850allbutSST (effect of all rad. gaes, aerosol, volcano and Ozone)
a7=z.vz.sfc.tref.tavg0;  a=a7-a1; p.dT7 =mean(mean(a.*aa)); %2010VolOzone minus 1850allbutSST (effect of volcano and ozone)
a8=z.w0.sfc.tref.tavg0;  a=a8-a6; p.dT8 =mean(mean(a.*aa)); %2010CLIMO2K minus 2010CLIM (effect of 2K uniform warming)
p.let=["(a) ","(d) ","(b) ","(e) ","(c) ","(f) ","(g) ","(h) ","(i) ","(j) "...
       "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
s1='ALL'; s2='GHG'; s3='Uniform SST warming'; s4='Aerosol'; s5='SST pattern'; s6='Residual';
p.s1 =strcat(s1); p.s2 =strcat(s2); p.s3 =strcat(s3); p.s4 =strcat(s4); p.s5 =strcat(s5); p.s6 =strcat(s6); 
p.xmin =0;  p.xmax =360; p.ymin=-90; p.ymax=90; p.xy=[p.xmin p.xmax p.ymin p.ymax]; 
p.co='k'; p.co_add='c'; p.do_add=1; p.show='off'; p.do_sig=true;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig0a: Tsurf absolute%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='tsurf_abs'; del=' $\Delta$'; p.varn=strcat(del,'Ts');
p.unit0='$\rm{KK^{-1}}$'; p.unit='$\rm{K}$'; p.unit_bar='K or KK^{-1}'; p.pos1=-0.08;
a=3; p.cmin1=-a; p.cmax1=a; p.cmin2=-a; p.cmax2=a;
imk=z.v0.sfc.ice.tavg0;  p.id=(s.lm>=1|s.lm<1); aa0=p.aa;
nyr1=30; nyr2=30; mskopt=0; num=0; N=30;
v=z.c0.sfc; a=squeeze(v.tsurf.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.v0.sfc; a=squeeze(v.tsurf.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v1=a; p.dv1=mean(mean(a.*aa0)); p.isig1=isig; p.v1_add=a0; p.v1_addbin=[1 5 9],

v=z.p0.sfc; a=squeeze(v.tsurf.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.g0.sfc; a=squeeze(v.tsurf.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v2=a; p.dv2=mean(mean(a.*aa0)); p.isig2=isig;

v=z.u0.sfc; a=squeeze(v.tsurf.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.p0.sfc; a=squeeze(v.tsurf.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v3=a; p.dv3=mean(mean(a.*aa0)); p.isig3=isig;

v=z.p0.sfc; a=squeeze(v.tsurf.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.a0.sfc; a=squeeze(v.tsurf.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v4=a; p.dv4=mean(mean(a.*aa0)); p.isig4=isig;

v=z.c0.sfc; a=squeeze(v.tsurf.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.p0.sfc; a=squeeze(v.tsurf.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig;
p.v5=p.v5-p.v3; p.dv5=p.dv5-p.dv3;

v=z.g0.sfc; a=squeeze(v.tsurf.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.g1.sfc; a=squeeze(v.tsurf.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v6=a; p.dv6=mean(mean(a.*aa0)); p.isig6=isig;

p.v6=p.v1-(p.v2+p.v3+p.v4+p.v5); p.dv6=p.dv1-(p.dv2+p.dv3+p.dv4+p.dv5);
plot_2d_6panel_CM4X(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig0b: Tref absolute%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='tref_abs'; del=' $\Delta$'; p.varn=strcat(del,'TAS');
p.unit0='$\rm{KK^{-1}}$'; p.unit='$\rm{K}$'; p.unit_bar='K or KK^{-1}'; p.pos1=-0.08;
a=2; p.cmin1=-a; p.cmax1=a; p.cmin2=-a; p.cmax2=a;
imk=z.v0.sfc.ice.tavg0;  p.id=(s.lm>=1|s.lm<1); aa0=p.aa;
nyr1=30; nyr2=30; mskopt=0; num=0; N=30;
v=z.c0.sfc; a=squeeze(v.tref.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.v0.sfc; a=squeeze(v.tref.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v1=a; p.dv1=mean(mean(a.*aa0)); p.isig1=isig; p.v1_add=a0; p.v1_addbin=[1 5 9],

v=z.p0.sfc; a=squeeze(v.tref.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.g0.sfc; a=squeeze(v.tref.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v2=a; p.dv2=mean(mean(a.*aa0)); p.isig2=isig;

v=z.u0.sfc; a=squeeze(v.tref.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.p0.sfc; a=squeeze(v.tref.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v3=a; p.dv3=mean(mean(a.*aa0)); p.isig3=isig;

v=z.p0.sfc; a=squeeze(v.tref.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.a0.sfc; a=squeeze(v.tref.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v4=a; p.dv4=mean(mean(a.*aa0)); p.isig4=isig;

v=z.c0.sfc; a=squeeze(v.tref.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.p0.sfc; a=squeeze(v.tref.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig;
p.v5=p.v5-p.v3; p.dv5=p.dv5-p.dv3;

v=z.g0.sfc; a=squeeze(v.tref.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.g1.sfc; a=squeeze(v.tref.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v6=a; p.dv6=mean(mean(a.*aa0)); p.isig6=isig;

p.v6=p.v1-(p.v2+p.v3+p.v4+p.v5); p.dv6=p.dv1-(p.dv2+p.dv3+p.dv4+p.dv5);
plot_2d_6panel_CM4X(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig1a: precip absolute%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='precip_abs'; del=' $\Delta$'; p.varn=strcat(del,'P');
p.unit0='$\rm{mmday^{-1}K^{-1}}$'; p.unit='$\rm{mmday^{-1}}$'; p.unit_bar='mmday^{-1} or mmday^{-1}K^{-1}'; p.pos1=-0.08;
a=1; p.cmin1=-a; p.cmax1=a; p.cmin2=-a; p.cmax2=a;
imk=z.v0.sfc.ice.tavg0;  p.id=(s.lm>=1|s.lm<1); aa0=p.aa;
nyr1=30; nyr2=30; mskopt=0; num=0; N=30;
v=z.c0.sfc; a=squeeze(v.pcp.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.v0.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v1=a; p.dv1=mean(mean(a.*aa0)); p.isig1=isig; p.v1_add=a0; p.v1_addbin=[1 5 9],

v=z.p0.sfc; a=squeeze(v.pcp.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.g0.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v2=a; p.dv2=mean(mean(a.*aa0)); p.isig2=isig;

v=z.u0.sfc; a=squeeze(v.pcp.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.p0.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v3=a; p.dv3=mean(mean(a.*aa0)); p.isig3=isig;

v=z.p0.sfc; a=squeeze(v.pcp.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.a0.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v4=a; p.dv4=mean(mean(a.*aa0)); p.isig4=isig;

v=z.c0.sfc; a=squeeze(v.pcp.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.p0.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v5=a; p.dv5=mean(mean(a.*aa0)); p.isig5=isig;
p.v5=p.v5-p.v3; p.dv5=p.dv5-p.dv3;

v=z.g0.sfc; a=squeeze(v.pcp.ann); a0=squeeze(mean(a,1)); s0=squeeze(std(a,1)); n0=N;
v=z.g1.sfc; a=squeeze(v.pcp.ann); a1=squeeze(mean(a,1)); s1=squeeze(std(a,1)); n1=N;
[diff,me,pdiff,a0_avg,a1_avg,isig]=compute_diff(a0,s0,n0,a1,s1,n1,num,nyr1,nyr2,aa0,mskopt);
a=diff; p.v6=a; p.dv6=mean(mean(a.*aa0)); p.isig6=isig;

p.v6=p.v1-(p.v2+p.v3+p.v4+p.v5); p.dv6=p.dv1-(p.dv2+p.dv3+p.dv4+p.dv5);
plot_2d_6panel_CM4X(p); 
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




a=vm0.pd.toa;
mean(a.netrad.ann_stat.mmen.all)
mean(a.lwnet.ann_stat.mmen.all)
mean(a.swnet.ann_stat.mmen.all)
a=vm0.pd.toa; b=vm0.pi.toa;
mean(a.netrad.ann_stat.mmen.all)-mean(b.netrad.ann_stat.mmen.all)
a=vm0.ae.toa; b=vm0.pi.toa;
mean(a.netrad.ann_stat.mmen.all)-mean(b.netrad.ann_stat.mmen.all)

a=vm.pd.toa;
mean(a.netrad.ann_stat.mmen.all)
mean(a.lwnet.ann_stat.mmen.all)
mean(a.swnet.ann_stat.mmen.all)
a=vm.pd.toa; b=vm.pi.toa;
mean(a.netrad.ann_stat.mmen.all)-mean(b.netrad.ann_stat.mmen.all)
a=vm.ar.toa; b=vm.pi.toa;
mean(a.netrad.ann_stat.mmen.all)-mean(b.netrad.ann_stat.mmen.all)


y=a0.toa.netrad.ts.org_ann; x=[a0.t1:a0.t2-1]; figure; plot(x,y,'s-');
%i1=24; i2=35;  x=x(i1:i2); y=y(i1:i2); figure; plot(x,y,'s-');
i1=27; i2=39;  x=x(i1:i2); y=y(i1:i2); figure; plot(x,y,'s-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%calculation for CM4X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

