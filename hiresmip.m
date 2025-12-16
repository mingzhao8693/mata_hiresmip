%below opt=1 for writing mat file to /work/miz
%below opt=2 for writing mat file to /archive
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
latlon=[0 360 -90 90];region='global';mod='c96';myr=5; opt=2;
%latlon=[0 360  30 90];region='nhextr';mod='c96';myr=5; opt=2; 
%latlon=[0 360 -30 30];region='tropic';mod='c96';myr=5; opt=2; 
%latlon=[150 250 -5 5]; region='equpac'; nyr=5; myr=1; opt=0;
%read in or generate observation data
%o=readobs(latlon,region,'c96'); 
%o=readobs(latlon,region,'c48'); 
fn=strcat('/work/miz/mat_am4p0/obs_',region,'_to_c48.mat'); load(fn);
%fn=strcat('/work/miz/mat_cm4/obs_',region,'_to_c48.mat'); load(fn);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw/'; myr=5;
expn='c192L33_am4p0_cmip6Diag';yr1='1950';yr2='2014';syr=1;nyr=65;mod='c192';%1980-2014period
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c192L33_am4p0_cmip6Diag_hsst_monthly';yr1='1950';yr2='2014';syr=1;nyr=65;mod='c192';%1980-2014period
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c192L33_am4p0_cmip6Diag_hsst';yr1='1950';yr2='2014';syr=1;nyr=65;mod='c192';%1980-2014period
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt); exit


tpath='/archive/Ming.Zhao/awg/warsaw_201710/'; myr=5;
expn='CM4_amip';yr1='1870';yr2='2014';syr=81;nyr=65;mod='c96';%1980-2014period
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c192L33_am4p0_amip_HIRESMIP_H5';yr1='1870';yr2='2014';syr=81;nyr=65;mod='c96';%1980-2014period
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c192L33_am4p0_amip_HIRESMIP_H5';yr1='1950';yr2='2014';syr=1;nyr=65;mod='c192';%1980-2014period
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/awg/warsaw_201710/'; myr=5;
expn='c192L33_am4p0_amip_HIRESMIP_H2';yr1='1950';yr2='2014';syr=1;nyr=65;mod='c192';%1980-2014period
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/awg/warsaw_201710/'; myr=5;
expn='c192L33_am4p0_amip_HIRESMIP_H1';yr1='1950';yr2='2014';syr=1;nyr=65;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);


tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5;
expn='CM4_c192L33_am4p0_1950Control_new';yr1='0051';yr2='0115';syr=1;nyr=65;mod='c192';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5;
expn='CM4_c192L33_am4p0_1950Control_new_hist0';yr1='1950';yr2='2014';syr=1;nyr=65;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);


tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5;
expn='CM4_piControl_C';yr1='0001';yr2='0380';syr=250;nyr=130;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5;
expn='CM4_1pctCO2_C';yr1='0001';yr2='0150';syr=1;nyr=120;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5;
expn='CM4_abrupt4xCO2_C';yr1='0001';yr2='0120';syr=1;nyr=120;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5;
expn='CM4_historical';yr1='1850';yr2='2014';syr=1;nyr=165;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5;
expn='SM2M-C2_abrupt-4xco2_S2';yr1='0001';yr2='0100';syr=1;nyr=100;mod='c48';
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='ESM2M-C2_1pct-co2_4x_U2';yr1='0001';yr2='0100';syr=1;nyr=100;mod='c48';
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L33_sm4p1_2010climo_resSST_speciceF';yr1='0001';yr2='0025';syr=1;nyr=25;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_sm4p1_2010climo_restoreSST';yr1='0001';yr2='0045';syr=1;nyr=25;mod='c96';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);



expn='c192L33_am4p0_cmip6Diag_hsst_monthly';yr1='1950';yr2='2014';syr=30;nyr=35;mod='c96';%1980-2014period
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c192L33_am4p0_cmip6Diag_hsst';yr1='1950';yr2='2014';syr=30;nyr=35;mod='c96';%1980-2014period
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c192L33_am4p0_cmip6Diag';yr1='1950';yr2='2014';syr=30;nyr=35;mod='c96';%1980-2014period
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4.0';yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96';%1980-2014period
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0';yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96';same_as_AM4.0
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_m1';yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_m2';yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_m3';yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_m4';yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_m5';yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4p0';yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96';%1980-2014period
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_initCond2';yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96';%1980-2014period
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/AM2.1/'; myr=1;
expn='AM2.1';yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96';%1980-2014period
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
tpath='/archive/Ming.Zhao/awg/AM3/'; myr=1;
expn='AM3';yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96';%1980-2014period
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Long AMIP analysis for aerosol effects
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
latlon=[0 360 -90 90];region='global';mod='c96';myr=5; opt=2;
fn=strcat('/work/miz/mat_am4p0/obs_',region,'_to_c48.mat'); load(fn);
tpath='/archive/Ming.Zhao/awg/warsaw/'; myr=5;
expn='CM4p0_hist';yr1='1850';yr2='2014';syr=1;nyr=165;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_longamip';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_longamip_m2';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L33_am4p0_longamip_1850rad_novol_m1';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_longamip_m1_aero';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_longamip_m2_aero';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_longamip_m3_aero';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_longAMIP_1850forcing_cmip5_1860aero';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_longAMIP_1850forcing_cmip5_TSaero';
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load previous anlaysis matfiles%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fn=strcat('/work/miz/mat_cm4/obs_global_to_c48.mat'); load(fn);
fn=strcat('/work/miz/mat_am4p0/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat'); 
tpath='/archive/Ming.Zhao/awg/warsaw/';
tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn='c192L33_am4p0_amip_HIRESMIP_H1';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);AM4.v0=v;
tpath='/archive/Ming.Zhao/awg/warsaw/';
expn='c192L33_am4p0_cmip6Diag';              fn=strcat(tpath,expn,pp,expn,dr);load(fn);AM4.v1=v;
expn='c192L33_am4p0_cmip6Diag_hsst';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);AM4.v2=v;
expn='c192L33_am4p0_cmip6Diag_hsst_monthly'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);AM4.v3=v;
%expn='CM4_piControl';               fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm4.v0=v;
expn='AM2.1';                        fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v0=v;
expn='AM3';                          fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v0=v;
expn='c96L33_am4p0';                 fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v0=v;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load previous coupled anlaysis matfiles%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_am4p0/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/mdt/20170118/';
expn='CM2.1U_Control-1860_D4';               fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm21.v0=v;
expn='CM2.1U-D4_1PctTo2X_I1';                fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm21.w0=v;
expn='CM2.1U-D4_1860-2000-AllForc_H1';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm21.h0=v;
expn='CM3Z_Control-1860_D1';                 fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm3.v0=v;
expn='CM3Z_D1_1PctTo4X_I1';                  fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm3.w0=v;
expn='CM3Z_D1_1860-2005_AllForc_H1';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm3.h0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
expn='CM4_piControl_C';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm4.c0=v;
expn='CM4_historical';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm4.h0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
expn='CM4_c192L33_am4p0_1850';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);CM4.c0=v;
expn='CM4_c192L33_am4p0_hist0'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);CM4.h0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw/';
expn='c96L33_am4p0_longamip';                fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.h0=v;
expn='c192L33_am4p0_cmip6Diag';              fn=strcat(tpath,expn,pp,expn,dr);load(fn);AM4.h0=v;
expn='c192L33_am4p0_cmip6Diag_hsst_monthly'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);AM4.ha=v;
expn='c192L33_am4p0_cmip6Diag_hsst';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);AM4.hb=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn='c192L33_am4p0_amip_HIRESMIP_H1';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);AM4.h1=v;
expn='c192L33_am4p0_amip_HIRESMIP_H2';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);AM4.h2=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section I: Analysis of historical runs%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g.gb=readsat_giss_gb(); g.nh=readsat_giss_nh(); g.sh=readsat_giss_sh(); 
yr1=1951; yr2=1980; vname='SAT_1951_1980';
%yr1=1881; yr2=1920; vname='SAT_1881_1920';
%yr1=1920; yr2=1960; vname='SAT_1920_1959';
id=(g.gb.year>=yr1)&(g.gb.year<=yr2); 
g.gb.all=g.gb.all-mean(g.gb.all(id));
g.nh.all=g.nh.all-mean(g.nh.all(id));
g.sh.all=g.sh.all-mean(g.sh.all(id)); tf=273.15; lw=2;
%AMIP
y0=am4.h0.sfc.tref.ts.org_ann; t0=[1870:2014];
Y0=AM4.h0.sfc.tref.ts.org_ann; T0=[1950:2014];
Ya=AM4.ha.sfc.tref.ts.org_ann; Ta=[1950:2014];
Yb=AM4.hb.sfc.tref.ts.org_ann; Tb=[1950:2014];
y1=AM4.h1.sfc.tref.ts.org_ann; t1=[1950:2014];
y2=AM4.h2.sfc.tref.ts.org_ann; t2=[1950:2014];
%z=AM4.ha.sfc.sst.tavg0-am4.h0.sfc.sst.tavg0;
%CMs
tt0=[1:65]; tt1=[1950:2014]; yy0=get_tref_hist(CM4,tt0,tt1,yr1,yr2);
zz0=CM4.c0.sfc.tref.ts.org_ann(1:65); zz1=CM4.h0.sfc.tref.ts.org_ann;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.; fsize=16; x=[5:5:20]-2.5; 
x1=[5:5:140]-2.5; x2=[65:5:140]-2.5; lw=2;
handle=figure('Position',pms,'visible','on'); lw=3;
plot(t0,y0-tf,    'b',   'LineWidth',lw); hold on; 
plot(T0,Y0-tf,    'b--', 'LineWidth',lw); hold on; 
plot(Ta,Ya-tf,    'k',   'LineWidth',lw); hold on; 
plot(Tb,Yb-tf,    'k--', 'LineWidth',lw); hold on; 
%plot(t1,y1-tf,    'g',   'LineWidth',lw); hold on; 
%plot(t2,y2-tf,    'g--',   'LineWidth',lw); hold on; 
plot(t1,yy0.gb-tf,'r',  'LineWidth',lw*2); %plot(t1,zz1-tf,'g'); 
plot(t1,zz0-tf,   'c',  'LineWidth',lw*2);
plot([1850:1979],cm4.h0.sfc.tref.ts.org_ann-tf,       'r--','LineWidth', lw*2);
plot([1850:1979],cm4.c0.sfc.tref.ts.org_ann(1:130)-tf,'c--','LineWidth', lw*2);
legend('c96AM4-AMIP-PCMDI-SST','c192AM4-AMIP-PCMDI-SST',...
       'C192AM4-AMIP-HIRESMIP-SST-monthly','C192AM4-AMIP-HIRESMIP-SST-daily',...
       'C192AM4+1/4MOM6-historical','C192AM4+1/4MOM6-1850control',...
       'CM4-historical','CM4-PI-Control-C',2);
xlabel('year','FontSize',fsize); 
ylabel('Surface air temperature anomalies (K)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1850 2017 12.4 14.5]);
visfig='off'; figpath='./fig_am4/'; expn='hiresmip'; vname='tas';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y0=am4.h0.toa.netrad.ann_stat.mmen.all; t0=[1870:5:2014];
Y0=AM4.h0.toa.netrad.ann_stat.mmen.all; T0=[1950:5:2014];
Ya=AM4.ha.toa.netrad.ann_stat.mmen.all; Ta=[1950:5:2014];
Yb=AM4.hb.toa.netrad.ann_stat.mmen.all; Tb=[1950:5:2014];
y1=AM4.h1.toa.netrad.ann_stat.mmen.all; t1=[1950:5:2014];
y2=AM4.h2.toa.netrad.ann_stat.mmen.all; t2=[1950:5:2014];
%z=AM4.ha.toa.sst.tavg0-am4.h0.toa.sst.tavg0;
%CMs
zz1=CM4.c0.toa.netrad.ann_stat.mmen.all(1:13);       tt1=[1950:5:2014];
zz2=CM4.h0.toa.netrad.ann_stat.mmen.all;       tt2=[1950:5:2014];
zz3=cm4.c0.toa.netrad.ann_stat.mmen.all;       tt3=[1850:5:1850+129];
zz4=cm4.h0.toa.netrad.ann_stat.mmen.all;       tt4=[1850:5:1964];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.; fsize=16; x=[5:5:20]-2.5; 
x1=[5:5:140]-2.5; x2=[65:5:140]-2.5; lw=2;
handle=figure('Position',pms,'visible','on'); lw=3;
plot(t0,y0,    'b',   'LineWidth',lw); hold on; 
plot(T0,Y0,    'b--', 'LineWidth',lw); hold on; 
plot(Ta,Ya,    'k',   'LineWidth',lw); hold on; 
plot(Tb,Yb,    'k--', 'LineWidth',lw); hold on; 
%plot(t1,y1,    'g',   'LineWidth',lw); hold on; 
%plot(t2,y2,    'g--',   'LineWidth',lw); hold on; 
plot(tt1,zz1,   'c',  'LineWidth',lw*2);
plot(tt2,zz2,   'r',  'LineWidth',lw*2);
plot(tt3,zz3,   'c--',  'LineWidth',lw*2);
plot(tt4,zz4,   'r--',  'LineWidth',lw*2);
legend('c96AM4-AMIP-PCMDI-SST','c192AM4-AMIP-PCMDI-SST',...
       'C192AM4-AMIP-HIRESMIP-SST-monthly','C192AM4-AMIP-HIRESMIP-SST-daily',...
       'C192AM4+1/4MOM6-historical','C192AM4+1/4MOM6-1850control',...
       'CM4-historical','CM4-PI-Control-C',2);
xlabel('year','FontSize',fsize); 
ylabel('Surface air temperature anomalies (K)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1850 2017 -1 1.5]);
visfig='off'; figpath='./fig_am4/'; expn='hiresmip'; vname='netradtoa';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.; fsize=28; x=[5:5:20]-2.5; 
x1=[5:5:140]-2.5; x2=[65:5:140]-2.5; 
handle=figure('Position',pms,'visible','on'); lw=3;
plot(g.gb.year,g.gb.all,'k',  'LineWidth',lw); hold on; s0='OBS (GISS)';
%plot(tx,   yx.gb,  'g-', 'LineWidth',lw); sx='AM4-longamip';
plot(t2,    y2.gb,  'g-', 'LineWidth',lw); s2='CM2.1';
plot(t3,    y3.gb,  'b-', 'LineWidth',lw); s3='CM3';
plot(t4,    y4.gb,  'r-', 'LineWidth',lw); s4='CM4';
plot([yr1 yr1],[-2 2],'k:'); plot([yr2 yr2],[-2 2],'k:');
plot([1840 2017],[0 0], 'k:');
legend(s0,s2,s3,s4,2); %legend(s0,sx,s1,s4,2);
xlabel('year','FontSize',fsize); 
ylabel('Surface air temperature anomalies (K)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1860 2017 -0.7 1.7]);
visfig='off'; figpath='./fig_am4/'; expn='cm4_hist'; vname='tas_gb';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pms=[ 0, 0, 1200, 800]*1.5;
handle=figure('Position',pms,'visible','on'); lw=2;
plot([1870:2014],am4.h0.sfc.tref.ts.org_ann, 'g-', 'LineWidth',lw); hold on;
plot([1850:2014],cm4.h0.sfc.tref.ts.org_ann, 'r-', 'LineWidth',lw); hold on;
plot([1861:2000],cm21.h0.sfc.tref.ts.org_ann,'k-', 'LineWidth',lw); hold on;
plot([1861:2005],cm3.h0.sfc.tref.ts.org_ann, 'b-', 'LineWidth',lw); hold on;
plot([1850:2014],cm4.v0.sfc.tref.ts.org_ann, 'r--','LineWidth',lw); hold on;
plot([1861:1960],cm21.v0.sfc.tref.ts.org_ann,'k--','LineWidth',lw'); hold on;
plot([1861:1940],cm3.v0.sfc.tref.ts.org_ann, 'b--','LineWidth',lw'); hold on;
legend('AM4','CM4','CM2.1','CM3','CM2.1-CTL','CM3-CTL',2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*1.5;
handle=figure('Position',pms,'visible','on'); lw=2;
plot([1870:2014],am4.h0.sfc.tref.ts.org_ann, 'g-', 'LineWidth',lw); hold on;
plot([1850:2014],cm4.h0.sfc.tref.ts.org_ann, 'r-', 'LineWidth',lw); hold on;
plot([1861:2000],cm21.h0.sfc.tref.ts.org_ann,'k-', 'LineWidth',lw); hold on;
plot([1861:2005],cm3.h0.sfc.tref.ts.org_ann, 'b-', 'LineWidth',lw); hold on;
plot([1850:2014],cm4.v0.sfc.tref.ts.org_ann, 'r--','LineWidth',lw); hold on;
plot([1861:1960],cm21.v0.sfc.tref.ts.org_ann,'k--','LineWidth',lw'); hold on;
plot([1861:1940],cm3.v0.sfc.tref.ts.org_ann, 'b--','LineWidth',lw'); hold on;
legend('AM4','CM4','CM2.1','CM3','CM2.1-CTL','CM3-CTL',2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section I: Analysis of historical runs%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g.gb=readsat_giss_gb(); g.nh=readsat_giss_nh(); g.sh=readsat_giss_sh(); 
%yr1=1951; yr2=1980; vname='SAT_1951_1980';
yr1=1881; yr2=1920; vname='SAT_1881_1920';
%yr1=1920; yr2=1960; vname='SAT_1920_1959';
id=(g.gb.year>=yr1)&(g.gb.year<=yr2); 
g.gb.all=g.gb.all-mean(g.gb.all(id));
g.nh.all=g.nh.all-mean(g.nh.all(id));
g.sh.all=g.sh.all-mean(g.sh.all(id));
%for longamip--------------------
tx=[1871:2015]; id=(tx>=yr1)&(tx<=yr2);
a=am4.h0.sfc.tref.ts.org_ann;    yx.gb=a-mean(a(id));
a=am4.h0.sfc.tref.ts.org_ann_nh; yx.nh=a-mean(a(id));
a=am4.h0.sfc.tref.ts.org_ann_sh; yx.sh=a-mean(a(id));
%for cm2.1-------------------------
t=[1861:1940]; t2=[1861:2000]; y2=get_tref_hist(cm21,t,t2,yr1,yr2);
%for cm3-------------------------
t=[1861:1940]; t3=[1861:2005]; y3=get_tref_hist(cm3, t,t3,yr1,yr2);
%for CM4-----------------------
t=[1850:2014]; t4=[1850:2014]; y4=get_tref_hist(cm4, t,t4,yr1,yr2);
%--------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.; fsize=28; x=[5:5:20]-2.5; 
x1=[5:5:140]-2.5; x2=[65:5:140]-2.5; 
handle=figure('Position',pms,'visible','on'); lw=3;
plot(g.gb.year,g.gb.all,'k',  'LineWidth',lw); hold on; s0='OBS (GISS)';
%plot(tx,   yx.gb,  'g-', 'LineWidth',lw); sx='AM4-longamip';
plot(t2,    y2.gb,  'g-', 'LineWidth',lw); s2='CM2.1';
plot(t3,    y3.gb,  'b-', 'LineWidth',lw); s3='CM3';
plot(t4,    y4.gb,  'r-', 'LineWidth',lw); s4='CM4';
plot([yr1 yr1],[-2 2],'k:'); plot([yr2 yr2],[-2 2],'k:');
plot([1840 2017],[0 0], 'k:');
legend(s0,s2,s3,s4,2); %legend(s0,sx,s1,s4,2);
xlabel('year','FontSize',fsize); 
ylabel('Surface air temperature anomalies (K)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1860 2017 -0.7 1.7]);
visfig='off'; figpath='./fig_am4/'; expn='cm4_hist'; vname='tas_gb';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig 3 SWABS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='swabs'; unit='(W/m2)'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.v1.s; %lat=s.lat; lon=s.lon; xy=[0 360 -90 90]; mv=-999;
v=o;      zo=squeeze(v.toa.swnet.sea(k,:,:)); s.so='CERES';
v=am4.v0; z1=squeeze(v.toa.swnet.sea(k,:,:)); s.s1='AM4p0';
v=am2.v0; z2=squeeze(v.toa.swnet.sea(k,:,:)); s.s2='AM2.1';
v=am3.v0; z3=squeeze(v.toa.swnet.sea(k,:,:)); s.s3='AM3';
b1=z1-zo; b2=z2-zo; b3=z3-zo; 
a=o.aa; v=am4.v0; v.ss=ss; v.varn=varn; v.expn='AM4p0'; 
e=b1; v.rms1=sqrt(mean(mean(e.*e.*a))); v.bias1=mean(mean(e.*a)); v.corr1=corrcoef(z1,zo);
e=b2; v.rms2=sqrt(mean(mean(e.*e.*a))); v.bias2=mean(mean(e.*a)); v.corr2=corrcoef(z2,zo);
e=b3; v.rms3=sqrt(mean(mean(e.*e.*a))); v.bias3=mean(mean(e.*a)); v.corr3=corrcoef(z3,zo);
form='(BIAS=%5.2f; RMSE=%5.2f)'; fm='MEAN=%5.2f';
v.s1=sprintf(fm,mean(mean(z1.*a))); v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},'; ',v.s1,')'];
v.s2=sprintf(fm,mean(mean(zo.*a))); v.s2=['(b) CERES-EBAF-ed2.8 (2001-2015; ',v.ss{k},'; ',v.s2,')'];
v.s3=sprintf(form,v.bias1,v.rms1); v.s3=['(c) AM4.0 minus CERES ',v.s3];
v.s4=sprintf(form,v.bias2,v.rms2); v.s4=['(d) AM2.1 minus CERES ',v.s4];
v.s5=sprintf(form,v.bias3,v.rms3); v.s5=['(e) AM3 minus CERES ',v.s5];
v.c1=25;    v.c2=410;  v.vbino=[v.c1:10:v.c2]; v.unit=unit;
v.cmin=-60; v.cmax=60; v.vbin =[v.cmin:5:v.cmax]; 
plot_5panel_mapp(k,v,s,z1,zo,b1,b2,b3,0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig 5 OLR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=5; varn='olr'; unit='(W/m2)'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.v1.s; 
v=o;      zo=squeeze(v.toa.lwnet.sea(k,:,:)); s.so='CERES';
v=am4.v0; z1=squeeze(v.toa.lwnet.sea(k,:,:)); s.s1='AM4p0';
v=am2.v0; z2=squeeze(v.toa.lwnet.sea(k,:,:)); s.s2='AM2.1';
v=am3.v0; z3=squeeze(v.toa.lwnet.sea(k,:,:)); s.s3='AM3';
b1=z1-zo; b2=z2-zo; b3=z3-zo; 
a=o.aa; v=am4.v0; v.ss=ss; v.varn=varn; v.expn='AM4p0'; 
e=b1; v.rms1=sqrt(mean(mean(e.*e.*a))); v.bias1=mean(mean(e.*a)); v.corr1=corrcoef(z1,zo);
e=b2; v.rms2=sqrt(mean(mean(e.*e.*a))); v.bias2=mean(mean(e.*a)); v.corr2=corrcoef(z2,zo);
e=b3; v.rms3=sqrt(mean(mean(e.*e.*a))); v.bias3=mean(mean(e.*a)); v.corr3=corrcoef(z3,zo);
form='(BIAS=%5.2f; RMSE=%5.2f)'; fm='MEAN=%5.2f';
v.s1=sprintf(fm,mean(mean(z1.*a))); v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},'; ',v.s1,')'];
v.s2=sprintf(fm,mean(mean(zo.*a))); v.s2=['(b) CERES-EBAF-ed2.8 (2001-2015; ',v.ss{k},'; ',v.s2,')'];
v.s3=sprintf(form,v.bias1,v.rms1); v.s3=['(c) AM4.0 minus CERES ',v.s3];
v.s4=sprintf(form,v.bias2,v.rms2); v.s4=['(d) AM2.1 minus CERES ',v.s4];
v.s5=sprintf(form,v.bias3,v.rms3); v.s5=['(e) AM3 minus CERES ',v.s5];
v.c1=120;   v.c2=350;  v.vbino=[v.c1:10:v.c2]; v.unit=unit;
v.cmin=-34; v.cmax=34; v.vbin =[v.cmin:5:v.cmax]; 
plot_5panel_mapp(k,v,s,z1,zo,b1,b2,b3,0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig 6 NETRAD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=5; varn='netrad'; unit='(W/m2)'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.v1.s; 
v=o;      zo=squeeze(v.toa.netrad.sea(k,:,:)); s.so='CERES';
v=am4.v0; z1=squeeze(v.toa.netrad.sea(k,:,:)); s.s1='AM4p0';
v=am2.v0; z2=squeeze(v.toa.netrad.sea(k,:,:)); s.s2='AM2.1';
v=am3.v0; z3=squeeze(v.toa.netrad.sea(k,:,:)); s.s3='AM3';
b1=z1-zo; b2=z2-zo; b3=z3-zo; 
a=o.aa; v=am4.v0; v.ss=ss; v.varn=varn; v.expn='AM4p0'; 
e=b1; v.rms1=sqrt(mean(mean(e.*e.*a))); v.bias1=mean(mean(e.*a)); v.corr1=corrcoef(z1,zo);
e=b2; v.rms2=sqrt(mean(mean(e.*e.*a))); v.bias2=mean(mean(e.*a)); v.corr2=corrcoef(z2,zo);
e=b3; v.rms3=sqrt(mean(mean(e.*e.*a))); v.bias3=mean(mean(e.*a)); v.corr3=corrcoef(z3,zo);
form='(BIAS=%5.2f; RMSE=%5.2f)'; fm='MEAN=%5.2f';
v.s1=sprintf(fm,mean(mean(z1.*a))); v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},'; ',v.s1,')'];
v.s2=sprintf(fm,mean(mean(zo.*a))); v.s2=['(b) CERES-EBAF-ed2.8 (2001-2015; ',v.ss{k},'; ',v.s2,')'];
v.s3=sprintf(form,v.bias1,v.rms1); v.s3=['(c) AM4.0 minus CERES ',v.s3];
v.s4=sprintf(form,v.bias2,v.rms2); v.s4=['(d) AM2.1 minus CERES ',v.s4];
v.s5=sprintf(form,v.bias3,v.rms3); v.s5=['(e) AM3 minus CERES ',v.s5];
v.c1=-180;  v.c2=120;  v.vbino=[v.c1:10:v.c2]; v.unit=unit;
v.cmin=-60; v.cmax=60; v.vbin =[v.cmin:5:v.cmax]; 
plot_5panel_mapp(k,v,s,z1,zo,b1,b2,b3,0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig 10 Precip
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure; contourf(b1,v.vbin); shading flat; colorbar; caxis([-3 3]);
nn=32; cmap=cbrewer('div', 'BrBG', nn); 
cmap1=[cmap(1:nn/2-2,:); cmap(nn/2+2:end,:)];
colormap(cmap1);

k=5; varn='pcp_green'; unit='(mm/day)'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.v0.s; lat=s.lat; lon=s.lon; xy=[0 360 -90 90]; mv=-999;
v=o;      zo=squeeze(v.sfc.pcp.sea(k,:,:)); s.so='CERES';
v=am4.v0; z1=squeeze(v.sfc.pcp.sea(k,:,:)); s.s1='AM4p0';
v=am2.v0; z2=squeeze(v.sfc.pcp.sea(k,:,:)); s.s2='AM2.1';
v=am3.v0; z3=squeeze(v.sfc.pcp.sea(k,:,:)); s.s3='AM3';
b1=z1-zo; b2=z2-zo; b3=z3-zo; 
a=o.aa; v=am4.v0; v.ss=ss; v.varn=varn; v.expn='AM4p0'; 
e=b1; v.rms1=sqrt(mean(mean(e.*e.*a))); v.bias1=mean(mean(e.*a)); v.corr1=corrcoef(z1,zo);
e=b2; v.rms2=sqrt(mean(mean(e.*e.*a))); v.bias2=mean(mean(e.*a)); v.corr2=corrcoef(z2,zo);
e=b3; v.rms3=sqrt(mean(mean(e.*e.*a))); v.bias3=mean(mean(e.*a)); v.corr3=corrcoef(z3,zo);
form='(BIAS=%5.2f; RMSE=%5.2f)'; fm='MEAN=%5.2f';
v.s1=sprintf(fm,mean(mean(z1.*a))); v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},'; ',v.s1,')'];
v.s2=sprintf(fm,mean(mean(zo.*a))); v.s2=['(b) GPCP-v2.3 (1980-2014; ',v.ss{k},'; ',v.s2,')'];
v.s3=sprintf(form,v.bias1,v.rms1); v.s3=['(c) AM4.0 minus GPCP ',v.s3];
v.s4=sprintf(form,v.bias2,v.rms2); v.s4=['(d) AM2.1 minus GPCP ',v.s4];
v.s5=sprintf(form,v.bias3,v.rms3); v.s5=['(e) AM3 minus GPCP ',v.s5];
v.c1=0;  v.c2=12;    v.vbino=[v.c1:0.5:v.c2]; v.unit=unit;
v.cmin=-4; v.cmax=4; v.vbin =[v.cmin:0.5:v.cmax]; 
plot_5panel_mapp(k,v,s,z1,zo,b1,b2,b3,4)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig 13 TAS over land
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='tas_land'; unit='(C)'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.v1.s;
v=o;      zo=squeeze(v.sfc.tas.sea(k,:,:)) -273.15; s.so='CRU';
v=am4.v0; z1=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s1='AM4p0';
v=am2.v0; z2=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s2='AM2.1';
v=am3.v0; z3=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s3='AM3';
id=(zo>10000); zo(id)=NaN; z1(id)=NaN; z2(id)=NaN; z3(id)=NaN;
b1=z1-zo; b2=z2-zo; b3=z3-zo; 
a=o.aa; v=am4.v0; v.ss=ss; v.varn=varn; v.expn='AM4p0'; 
id=~isnan(b1); a(id)=a(id)/mean(a(id)); a=a(id);
e=b1(id); v.rms1=sqrt(mean(e.*e.*a)); v.bias1=mean(mean(e.*a)); v.corr1=corrcoef(z1(id),zo(id));
e=b2(id); v.rms2=sqrt(mean(e.*e.*a)); v.bias2=mean(mean(e.*a)); v.corr2=corrcoef(z2(id),zo(id));
e=b3(id); v.rms3=sqrt(mean(e.*e.*a)); v.bias3=mean(mean(e.*a)); v.corr3=corrcoef(z3(id),zo(id));
form='(BIAS=%5.2f; RMSE=%5.2f)'; fm='MEAN=%5.2f';
v.s1=sprintf(fm,mean(mean(z1(id).*a))); v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},'; ',v.s1,')'];
v.s2=sprintf(fm,mean(mean(zo(id).*a))); v.s2=['(b) CRU-TS-3.22 (1980-2013; ',v.ss{k},'; ',v.s2,')'];
v.s3=sprintf(form,v.bias1,v.rms1); v.s3=['(c) AM4.0 minus CRU ',v.s3];
v.s4=sprintf(form,v.bias2,v.rms2); v.s4=['(d) AM2.1 minus CRU ',v.s4];
v.s5=sprintf(form,v.bias3,v.rms3); v.s5=['(e) AM3 minus CRU ',v.s5];
%id=(s.lm0>0.25); a=NaN; z1(~id)=a; 
v.c1=-30;   v.c2=30;   v.vbino=[v.c1:1:v.c2]; v.unit=unit;
v.cmin=-12; v.cmax=12; v.vbin =[v.cmin:1:v.cmax];
plot_5panel_mapp(k,v,s,z1,zo,b1,b2,b3,2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig 13 TAS over ocean
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='tas_ocean'; unit='(C)'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.v1.s;
v=o;      zo=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.so='ERA-Interim';
v=am4.v0; z1=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s1='AM4p0';
v=am2.v0; z2=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s2='AM2.1';
v=am3.v0; z3=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s3='AM3';
id=(s.lm0>0.25); a=NaN; zo(id)=NaN; z1(id)=NaN; z2(id)=NaN; z3(id)=NaN;
b1=z1-zo; b2=z2-zo; b3=z3-zo;
a=o.aa; v=am4.v0; v.ss=ss; v.varn=varn; v.expn='AM4p0'; 
id=~isnan(b1); a(id)=a(id)/mean(a(id)); a=a(id);
e=b1(id); v.rms1=sqrt(mean(e.*e.*a)); v.bias1=mean(mean(e.*a)); v.corr1=corrcoef(z1(id),zo(id));
e=b2(id); v.rms2=sqrt(mean(e.*e.*a)); v.bias2=mean(mean(e.*a)); v.corr2=corrcoef(z2(id),zo(id));
e=b3(id); v.rms3=sqrt(mean(e.*e.*a)); v.bias3=mean(mean(e.*a)); v.corr3=corrcoef(z3(id),zo(id));
form='(BIAS=%5.2f; RMSE=%5.2f)'; fm='MEAN=%5.2f';
v.s1=sprintf(fm,mean(mean(z1(id).*a))); v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},'; ',v.s1,')'];
v.s2=sprintf(fm,mean(mean(zo(id).*a))); v.s2=['(b) ERA-Interim (1980-2014; ',v.ss{k},'; ',v.s2,')'];
v.s3=sprintf(form,v.bias1,v.rms1); v.s3=['(c) AM4.0 minus ERA ',v.s3];
v.s4=sprintf(form,v.bias2,v.rms2); v.s4=['(d) AM2.1 minus ERA ',v.s4];
v.s5=sprintf(form,v.bias3,v.rms3); v.s5=['(e) AM3 minus ERA ',v.s5];
v.c1=-30;  v.c2=30;  v.vbino=[v.c1:1:v.c2]; v.unit=unit;
v.cmin=-6; v.cmax=6; v.vbin =[v.cmin:0.5:v.cmax];
plot_5panel_mapp(k,v,s,z1,zo,b1,b2,b3,2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I S12: surface air temperature
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='tas_all'; unit='(C)'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.v1.s;
v=o;      zo=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.so='ERA-Interim';
v=am4.v0; z1=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s1='AM4p0';
v=am2.v0; z2=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s2='AM2.1';
v=am3.v0; z3=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s3='AM3';
id=(s.lm0>0.25); %a=NaN; zo(id)=NaN; z1(id)=NaN; z2(id)=NaN; z3(id)=NaN;
b1=z1-zo; b2=z2-zo; b3=z3-zo;
a=o.aa; v=am4.v0; v.ss=ss; v.varn=varn; v.expn='AM4p0'; 
id=~isnan(b1); a(id)=a(id)/mean(a(id)); a=a(id);
e=b1(id); v.rms1=sqrt(mean(e.*e.*a)); v.bias1=mean(mean(e.*a)); v.corr1=corrcoef(z1(id),zo(id));
e=b2(id); v.rms2=sqrt(mean(e.*e.*a)); v.bias2=mean(mean(e.*a)); v.corr2=corrcoef(z2(id),zo(id));
e=b3(id); v.rms3=sqrt(mean(e.*e.*a)); v.bias3=mean(mean(e.*a)); v.corr3=corrcoef(z3(id),zo(id));
form='(BIAS=%5.2f; RMSE=%5.2f)'; fm='MEAN=%5.2f';
v.s1=sprintf(fm,mean(mean(z1(id).*a))); v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},'; ',v.s1,')'];
v.s2=sprintf(fm,mean(mean(zo(id).*a))); v.s2=['(b) ERA-Interim (1980-2014; ',v.ss{k},'; ',v.s2,')'];
v.s3=sprintf(form,v.bias1,v.rms1); v.s3=['(c) AM4.0 minus ERA ',v.s3];
v.s4=sprintf(form,v.bias2,v.rms2); v.s4=['(d) AM2.1 minus ERA ',v.s4];
v.s5=sprintf(form,v.bias3,v.rms3); v.s5=['(e) AM3 minus ERA ',v.s5];
v.c1=-30;  v.c2=30;  v.vbino=[v.c1:1:v.c2]; v.unit=unit;
v.cmin=-6; v.cmax=6; v.vbin =[v.cmin:0.5:v.cmax];
plot_5panel_mapp(k,v,s,z1,zo,b1,b2,b3,2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig20: NH sea level pressure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='slp_nh'; unit='(C)'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.v1.s; load coast; latc=lat; lonc=long; 
v=o;      zo=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.so='ERA-Interim';
v=am4.v0; z1=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s1='AM4p0';
v=am2.v0; z2=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s2='AM2.1';
v=am3.v0; z3=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s3='AM3';
id=(s.lm0>0.25); %a=NaN; zo(id)=NaN; z1(id)=NaN; z2(id)=NaN; z3(id)=NaN;
b1=z1-zo; b2=z2-zo; b3=z3-zo;
a=o.aa; v=am4.v0; v.ss=ss; v.varn=varn; v.expn='AM4p0'; 
id=~isnan(b1); a(id)=a(id)/mean(a(id)); a=a(id);
e=b1(id); v.rms1=sqrt(mean(e.*e.*a)); v.bias1=mean(mean(e.*a)); v.corr1=corrcoef(z1(id),zo(id));
e=b2(id); v.rms2=sqrt(mean(e.*e.*a)); v.bias2=mean(mean(e.*a)); v.corr2=corrcoef(z2(id),zo(id));
e=b3(id); v.rms3=sqrt(mean(e.*e.*a)); v.bias3=mean(mean(e.*a)); v.corr3=corrcoef(z3(id),zo(id));
form='(BIAS=%5.2f; RMSE=%5.2f)'; fm='MEAN=%5.2f';
v.s1=sprintf(fm,mean(mean(z1(id).*a))); v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},'; ',v.s1,')'];
v.s2=sprintf(fm,mean(mean(zo(id).*a))); v.s2=['(b) ERA-Interim (1980-2014; ',v.ss{k},'; ',v.s2,')'];
v.s3=sprintf(form,v.bias1,v.rms1); v.s3=['(c) AM4.0 minus ERA ',v.s3];
v.s4=sprintf(form,v.bias2,v.rms2); v.s4=['(d) AM2.1 minus ERA ',v.s4];
v.s5=sprintf(form,v.bias3,v.rms3); v.s5=['(e) AM3 minus ERA ',v.s5];
v.c1=-30;  v.c2=30;  v.vbino=[v.c1:1:v.c2]; v.unit=unit;
v.cmin=-6; v.cmax=6; v.vbin =[v.cmin:0.5:v.cmax];

k=5;
z1=squeeze(am4.v0.sfc.slp.sea(k,:,:));
zo=squeeze(o.sfc.slp.sea(k,:,:));
id=(z1<950); zo(id)=NaN; zo=zo-1013.25; z1=z1-1013.25;
lon(1)=0; lon(end)=360; lonx(1)=0; lonx(end)=360;
figure; vbino=[-10:1:10];
axesm('stereo','Origin',[90 -90],'MapLatLimit',[20 90])
contourfm(lat,lon,z1,vbino); hold on;  gridm on; colorbar;
contourm(latx,lonx,lm,'k','LineWidth',1); 

mlabel on; %plabel on;
setm(gca,'MLabelParallel',-20)

figure; pcolor(lon,lat,z1); shading flat; colorbar;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=am4.v0; latx=v0.lat; lonx=v0.lon; lm=am4.v0.lm0;
k=3; ss={'ANN','MAM','JJA','SON','DJF'};
lat=o.lat; lon=o.lon; cmin=-3; cmax=3; row=3; col=2;
pms=[ 0, 0, 1000, 800]*1; fsize=16; lw=2; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on'); 
y1=am4.v0.sfc.sst.ts.org_ann;
y2=an4.v0.sfc.sst.ts.org_ann;
plot(y1,'b'); hold on; plot(y2,'r');

%test%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=am4.v0; latx=v0.lat; lonx=v0.lon; lm=am4.v0.lm0;
k=1; ss={'ANN','MAM','JJA','SON','DJF'};
lat=o.lat; lon=o.lon; cmin=-0.5; cmax=0.5; row=2; col=2;
pms=[ 0, 0, 1000, 800]*1.5; fsize=16; lw=2; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on'); 
zo=squeeze(o.sfc.sst.sea(k,:,:))  -273.15;
z0=squeeze(o.sfc.tsurf.sea(k,:,:))-273.15;
z1=squeeze(am4.v0.sfc.tsurf.sea(k,:,:))-273.15;
z2=squeeze(an4.v0.sfc.tsurf.sea(k,:,:))-273.15;
z3=squeeze(bn4.v0.sfc.tsurf.sea(k,:,:))-273.15;
subplot(row,col,1); 
pcolor(lon,lat,z0-zo); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title(strcat('INTERIM minus HadiSST (',ss{k},')'));
subplot(row,col,2); 
pcolor(lon,lat,z1-zo); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title('AM4 minus HadiSST');
subplot(row,col,3); 
pcolor(lon,lat,z2-zo); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title('c192AM4H minus HadiSST');
subplot(row,col,4); 
pcolor(lon,lat,z3-zo); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title('c192AM4 minus c96AM4');


subplot(row,col,5); 
pcolor(lon,lat,z2-zo); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title('AM2 minus GPCP');
subplot(row,col,6);
pcolor(lon,lat,z3-zo); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title('AM3 minus GPCP');
expn='pcp'; vname=ss{k};
visfig='off'; figpath='./fig_am4/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%test%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=am4.v0; latx=v0.lat; lonx=v0.lon; lm=am4.v0.lm0;
k=3; ss={'ANN','MAM','JJA','SON','DJF'};
lat=o.lat; lon=o.lon; cmin=0; cmax=1; row=2; col=2;
pms=[ 0, 0, 1000, 500]*1.5; fsize=16; lw=2; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on'); 
zo=squeeze(o.sfc.pcp.sea(k,:,:));
ze=squeeze(o.sfc.pcp_era.sea(k,:,:));
z0=squeeze(cm4.v0.sfc.pcp.sea(k,:,:));
z1=squeeze(am4.v0.sfc.pcp.sea(k,:,:));
z2=squeeze(am2.v0.sfc.pcp.sea(k,:,:));
z3=squeeze(am3.v0.sfc.pcp.sea(k,:,:));
y0=squeeze(cm4.v0.sfc.prec_ls.sea(k,:,:));
y1=squeeze(am4.v0.sfc.prec_ls.sea(k,:,:));
y2=squeeze(am2.v0.sfc.prec_ls.sea(k,:,:));
y3=squeeze(am3.v0.sfc.prec_ls.sea(k,:,:));
subplot(row,col,1); 
pcolor(lon,lat,y0./z0); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); 
title(strcat('CM4 (fraction of largescale P, ',ss{k},')'));
subplot(row,col,2); 
pcolor(lon,lat,y1./z1); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title('AM4 (fraction of largescale P)');
subplot(row,col,3); 
pcolor(lon,lat,y2./z2); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title('AM2 (fraction of largescale P)');
subplot(row,col,4);
pcolor(lon,lat,y3./z3); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title('AM3 (fraction of largescale P)');
expn='fl'; vname=ss{k};
visfig='off'; figpath='./fig_am4/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.7: seaonal cycle of TOA radiation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.7a seaonal cycle of TOA Raditive flux%%%%
pms=[ 0, 0, 600, 1800]*0.8; fsize=12; lw=1; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on');
row=3; col=1;
subplot(row,col,1);
toa=am4.v0.toa; xy=[1 12 -13.5 13.5]; 
xo=toa.netrad.clm_stat.omen.all; xo=xo-mean(xo);
yo=toa.lwnet.clm_stat.omen.all;  yo=yo-mean(yo);
zo=toa.swnet.clm_stat.omen.all;  zo=zo-mean(zo);
x1=toa.netrad.clm_stat.mmen.all; x1=x1-mean(x1);
y1=toa.lwnet.clm_stat.mmen.all;  y1=y1-mean(y1);
z1=toa.swnet.clm_stat.mmen.all;  z1=z1-mean(z1);
plot(t,x1,'k',  'LineWidth',lw); hold on; corrcoef(x1,xo)
plot(t,y1,'r',  'LineWidth',lw); hold on; corrcoef(y1,yo)
plot(t,z1,'b',  'LineWidth',lw); hold on; corrcoef(z1,zo)
plot(t,xo,'k--','LineWidth',lw); hold on;
plot(t,yo,'r--','LineWidth',lw); hold on;
plot(t,zo,'b--','LineWidth',lw); hold on;
vname='netradtoa_scyc'; expn='AM4p0';
yl='TOA radiative flux anomalies (W/m^2)';
legend('net','LW','SW',0); mylabel(xy,1,'(a)',fsize);
xlabel('month','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
subplot(row,col,2);
toa=am4.v0.toa; xy=[1 12 -13.5 13.5]; 
xo=toa.netrad_clr.clm_stat.omen.all; xo=xo-mean(xo);
yo=toa.lwnet_clr.clm_stat.omen.all;  yo=yo-mean(yo);
zo=toa.swnet_clr.clm_stat.omen.all;  zo=zo-mean(zo);
x1=toa.netrad_clr.clm_stat.mmen.all; x1=x1-mean(x1);
y1=toa.lwnet_clr.clm_stat.mmen.all;  y1=y1-mean(y1);
z1=toa.swnet_clr.clm_stat.mmen.all;  z1=z1-mean(z1);
plot(t,x1,'k',  'LineWidth',lw); hold on;
plot(t,y1,'r',  'LineWidth',lw); hold on;
plot(t,z1,'b',  'LineWidth',lw); hold on;
plot(t,xo,'k--','LineWidth',lw); hold on;
plot(t,yo,'r--','LineWidth',lw); hold on;
plot(t,zo,'b--','LineWidth',lw); hold on;
vname='radtoa_clr_scyc'; expn='AM4p0';
yl='TOA clear-sky radiative flux anomalies (W/m^2)';
%legend('net','LW','SW',0); 
mylabel(xy,1,'(b)',fsize);
xlabel('month','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
subplot(row,col,3);
toa=am4.v0.toa; xy=[1 12 -13.5 13.5]; 
xo=toa.ttcf.clm_stat.omen.all;  xo=xo-mean(xo);%xo=repmat(xo,1,2);
yo=toa.lwcf.clm_stat.omen.all;  yo=yo-mean(yo);%yo=repmat(yo,1,2);
zo=toa.swcf.clm_stat.omen.all;  zo=zo-mean(zo);%zo=repmat(zo,1,2);
x1=toa.ttcf.clm_stat.mmen.all;  x1=x1-mean(x1);%x1=repmat(x1,1,2);
y1=toa.lwcf.clm_stat.mmen.all;  y1=y1-mean(y1);%y1=repmat(y1,1,2);
z1=toa.swcf.clm_stat.mmen.all;  z1=z1-mean(z1);%z1=repmat(z1,1,2);
plot(t,x1,'k',  'LineWidth',lw); hold on;corrcoef(x1,xo)
plot(t,y1,'r',  'LineWidth',lw); hold on;corrcoef(y1,yo)
plot(t,z1,'b',  'LineWidth',lw); hold on;corrcoef(z1,zo)
plot(t,xo,'k--','LineWidth',lw); hold on;
plot(t,yo,'r--','LineWidth',lw); hold on;
plot(t,zo,'b--','LineWidth',lw); hold on;
vname='cre_scyc'; expn='AM4p0'; 
yl='TOA cloud radiative effect anomalies (W/m^2)';
%legend('net','LW','SW',0); 
mylabel(xy,1,'(c)',fsize); 
xlabel('month','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); vname='toa_flux';
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.7: seaonal cycle of TOA radiation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.7a seaonal cycle of TOA Raditive flux%%%%
vname='netradtoa_scyc'; expn='AM4p0';
yl='TOA radiative flux anomalies (W/m2)';
pms=[ 0, 0, 800, 600]*0.8; fsize=16; lw=2; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on');
toa=am4.v0.toa; xy=[1 12 -13.5 13.5]; 
xo=toa.netrad.clm_stat.omen.all; xo=xo-mean(xo);
yo=toa.lwnet.clm_stat.omen.all;  yo=yo-mean(yo);
zo=toa.swnet.clm_stat.omen.all;  zo=zo-mean(zo);
x1=toa.netrad.clm_stat.mmen.all; x1=x1-mean(x1);
y1=toa.lwnet.clm_stat.mmen.all;  y1=y1-mean(y1);
z1=toa.swnet.clm_stat.mmen.all;  z1=z1-mean(z1);
plot(t,x1,'k',  'LineWidth',lw); hold on; corrcoef(x1,xo)
plot(t,y1,'r',  'LineWidth',lw); hold on; corrcoef(y1,yo)
plot(t,z1,'b',  'LineWidth',lw); hold on; corrcoef(z1,zo)
plot(t,xo,'k--','LineWidth',lw); hold on;
plot(t,yo,'r--','LineWidth',lw); hold on;
plot(t,zo,'b--','LineWidth',lw); hold on;
legend('net','LW','SW',0); mylabel(xy,1,'(a)',fsize);
xlabel('month','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.7b seasonal cycle of TOA clear-sky Raditive flux
vname='radtoa_clr_scyc'; expn='AM4p0';
yl='TOA clear-sky radiative flux anomalies (W/m^2)';
pms=[ 0, 0, 800, 600]*0.8; fsize=16; lw=2; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on');
toa=am4.v0.toa; xy=[1 12 -13.5 13.5]; 
xo=toa.netrad_clr.clm_stat.omen.all; xo=xo-mean(xo);
yo=toa.lwnet_clr.clm_stat.omen.all;  yo=yo-mean(yo);
zo=toa.swnet_clr.clm_stat.omen.all;  zo=zo-mean(zo);
x1=toa.netrad_clr.clm_stat.mmen.all; x1=x1-mean(x1);
y1=toa.lwnet_clr.clm_stat.mmen.all;  y1=y1-mean(y1);
z1=toa.swnet_clr.clm_stat.mmen.all;  z1=z1-mean(z1);
plot(t,x1,'k',  'LineWidth',lw); hold on;
plot(t,y1,'r',  'LineWidth',lw); hold on;
plot(t,z1,'b',  'LineWidth',lw); hold on;
plot(t,xo,'k--','LineWidth',lw); hold on;
plot(t,yo,'r--','LineWidth',lw); hold on;
plot(t,zo,'b--','LineWidth',lw); hold on;
legend('net','LW','SW',0); mylabel(xy,1,'(b)',fsize);
xlabel('month','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.7c seasonal cycle of TOA CRE%%%%%%%%%%%%%
vname='cre_scyc'; expn='AM4p0'; 
yl='TOA cloud radiative effect anomalies (W/m2)';
pms=[ 0, 0, 800, 600]*0.8; fsize=16; lw=2; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on');
toa=am4.v0.toa; xy=[1 12 -13.5 13.5]; 
xo=toa.ttcf.clm_stat.omen.all;  xo=xo-mean(xo);%xo=repmat(xo,1,2);
yo=toa.lwcf.clm_stat.omen.all;  yo=yo-mean(yo);%yo=repmat(yo,1,2);
zo=toa.swcf.clm_stat.omen.all;  zo=zo-mean(zo);%zo=repmat(zo,1,2);
x1=toa.ttcf.clm_stat.mmen.all;  x1=x1-mean(x1);%x1=repmat(x1,1,2);
y1=toa.lwcf.clm_stat.mmen.all;  y1=y1-mean(y1);%y1=repmat(y1,1,2);
z1=toa.swcf.clm_stat.mmen.all;  z1=z1-mean(z1);%z1=repmat(z1,1,2);
plot(t,x1,'k',  'LineWidth',lw); hold on;corrcoef(x1,xo)
plot(t,y1,'r',  'LineWidth',lw); hold on;corrcoef(y1,yo)
plot(t,z1,'b',  'LineWidth',lw); hold on;corrcoef(z1,zo)
plot(t,xo,'k--','LineWidth',lw); hold on;
plot(t,yo,'r--','LineWidth',lw); hold on;
plot(t,zo,'b--','LineWidth',lw); hold on;
legend('net','LW','SW',0); mylabel(xy,1,'(c)',fsize); 
xlabel('month','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.8: time series of TOA radiation anomalies
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.8: time series of TOA net radation%%%%%%
pms=[ 0, 0, 1400, 1000]*0.8; fsize=11; lw=2; msize=6; 
handle = figure('Position', pms,'visible','on');
row=2; col=2;
subplot(row,col,1); vname='netradtoa_ts'; expn='AM4p0'; 
yl='TOA net radiation (W/m^2)'; xy=[2000 2015 -0.8 0.8];
g=o.ceres_ts_global.toa.netrad.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4.v0.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.mean,yo.anom); 
s1=sprintf('AM4.0 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-ed2.8',2); mylabel(xy,1,'(a)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
subplot(row,col,2); vname='lwnet_ts'; expn='AM4p0'; 
yl='OLR (W/m^2)'; xy=[2000 2015 -0.8 0.8];
g=o.ceres_ts_global.toa.lwnet.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4.v0.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.mean,yo.anom); 
s1=sprintf('AM4.0 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-ed2.8',3); mylabel(xy,1,'(b)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
subplot(row,col,3); vname='swnet_ts'; expn='AM4p0'; 
yl='TOA SW radiation (W/m^2)'; xy=[2000 2015 -0.8 0.8];
g=o.ceres_ts_global.toa.swnet.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4.v0.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.mean,yo.anom); 
s1=sprintf('AM4.0 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-ed2.8',3); mylabel(xy,1,'(c)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
subplot(row,col,4); vname='swcf_ts'; expn='AM4p0'; 
yl='SW CRE (W/m^2)'; xy=[2000 2015 -0.8 0.8];
g=o.ceres_ts_global.toa.swcf.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4.v0.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.mean,yo.anom); 
s1=sprintf('AM4.0 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-ed2.8',3); mylabel(xy,1,'(d)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; vname='toa_flux_ts';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.8: time series of TOA radiation anomalies
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.8a: time series of TOA net radation%%%%%%
vname='netradtoa_ts'; expn='AM4p0'; 
yl='TOA net radiation (W/m2)'; xy=[2000 2015 -0.8 0.8];
g=o.ceres_ts_global.toa.netrad.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4.v0.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.mean,yo.anom); 
s1=sprintf('AM4.0 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-ed2.8',2); mylabel(xy,1,'(a)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.8b: time series of OLR %%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_ts'; expn='AM4p0'; 
yl='OLR (W/m2)'; xy=[2000 2015 -0.8 0.8];
g=o.ceres_ts_global.toa.lwnet.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4.v0.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.mean,yo.anom); 
s1=sprintf('AM4.0 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-ed2.8',3); mylabel(xy,1,'(b)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.8c: time series of TOA SW net radiation%%%%%%
vname='swnet_ts'; expn='AM4p0'; 
yl='TOA SW radiation (W/m2)'; xy=[2000 2015 -0.8 0.8];
g=o.ceres_ts_global.toa.swnet.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4.v0.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.mean,yo.anom); 
s1=sprintf('AM4.0 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-ed2.8',3); mylabel(xy,1,'(c)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.8d: time series of TOA SW CRE%%%%%%%%%%%%%%%%
vname='swcf_ts'; expn='AM4p0'; 
yl='SW CRE (W/m2)'; xy=[2000 2015 -0.8 0.8];
g=o.ceres_ts_global.toa.swcf.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4.v0.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.mean,yo.anom); 
s1=sprintf('AM4.0 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-ed2.8',3); mylabel(xy,1,'(d)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcf_ts'; expn='AM4p0'; 
yl='LW CRE (W/m2)'; xy=[2000 2015 -0.8 0.8];
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
g=o.ceres_ts_global.toa.lwcf.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                  %03/2000-12/2014; 178 months
ya=am4.v0.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.anom,yo.anom); 
s1=sprintf('AM4.1 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-v2.8',3); mylabel(xy,1,'(c)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_clr_ts'; expn='AM4p0'; 
yl='clear-sky OLR (W/m2)'; xy=[2000 2015 -0.8 0.8];
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
g=o.ceres_ts_global.toa.lwnet_clr.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4a.v0.toa.lwnet_clr.al0(end-14:end,:); %01/2000-12/2014
yb=am4b.v0.toa.lwnet_clr.al0(end-14:end,:); %01/2000-12/2014
yc=am4c.v0.toa.lwnet_clr.al0(end-14:end,:); %01/2000-12/2014
yd=am4d.v0.toa.lwnet_clr.al0(end-14:end,:); %01/2000-12/2014
ye=am4e.v0.toa.lwnet_clr.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.anom,yo.anom); 
s1=sprintf('AM4.1 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-v2.8',3); mylabel(xy,1,'(c)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet_clr_ts'; expn='AM4p0'; 
yl='clear-sky SW absorption (W/m2)'; xy=[2000 2015 -0.8 0.8];
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
g=o.ceres_ts_global.toa.swnet_clr.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4a.v0.toa.swnet_clr.al0(end-14:end,:); %01/2000-12/2014
yb=am4b.v0.toa.swnet_clr.al0(end-14:end,:); %01/2000-12/2014
yc=am4c.v0.toa.swnet_clr.al0(end-14:end,:); %01/2000-12/2014
yd=am4d.v0.toa.swnet_clr.al0(end-14:end,:); %01/2000-12/2014
ye=am4e.v0.toa.swnet_clr.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.anom,yo.anom); 
s1=sprintf('AM4.1 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-v2.8',3); mylabel(xy,1,'(c)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.15-16 and S13: zonal mean temperature
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmt'; unit='(C)';  ss={'ANN','MAM','JJA','SON','DJF'};
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4.v1.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=o;      [zo bo rmso]=vslice(v,s,k,varn,'obs',mv);
v=am4.v0; [z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv);
v=am2.v0; [z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv);
v=am3.v0; [z3 b3 rms3]=vslice(v,s,k,varn,'mod',mv);
v=am4.v0; v.ss=ss; v.pf=pf; v.xy=xy; v.varn=varn; v.expn='AM4p0'; 
v.rms1=rms1; v.rms2=rms2; v.rms3=rms3;
z1(1,80:end)=NaN; id=isnan(z1); zo(id)=NaN; b1(id)=NaN; b2(id)=NaN; b3(id)=NaN;
form='(RMSE=%5.2f)'; a=273.15; z1=z1-a; zo=zo-a;
v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},')'];
v.s2=['(b) ERA-interim (1980-2014; ',v.ss{k},')'];
v.s3=sprintf(form,v.rms1); v.s3=['(c) AM4.0 minus ERA ',v.s3];
v.s4=sprintf(form,v.rms2); v.s4=['(d) AM2.1 minus ERA ',v.s4];
v.s5=sprintf(form,v.rms3); v.s5=['(e) AM3 minus ERA ',v.s5];
v.c1=-90;  v.c2=20;  v.vbino=[v.c1:10:v.c2]; v.unit=unit;
v.cmin=-6; v.cmax=6; v.vbin =[v.cmin:0.5:v.cmax]; 
v.vlab0=[-70:10:20]; pt=7; v.vlab=[-5 -4 -3 -2 -1 0 1 2 3 4 5];
plot_5panel_zmean(k,v,s,z1,zo,b1,b2,b3,3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.17-18 and S14: zonal mean zonal wind
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmu'; unit='(m/s)'; ss={'ANN','MAM','JJA','SON','DJF'};
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4.v5.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=o;      [zo bo rmso]=vslice(v,s,k,varn,'obs',mv);
v=am4.v0; [z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv);
v=am2.v0; [z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv);
v=am3.v0; [z3 b3 rms3]=vslice(v,s,k,varn,'mod',mv);
v=am4.v0; v.ss=ss; v.pf=pf; v.xy=xy; v.varn=varn; v.expn='AM4p0'; 
v.rms1=rms1; v.rms2=rms2; v.rms3=rms3;
z1(1,80:end)=NaN; id=isnan(z1); zo(id)=NaN; b1(id)=NaN; b2(id)=NaN; b3(id)=NaN;
form='(RMSE=%5.2f)';
v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},')'];
v.s2=['(b) ERA-interim (1980-2014; ',v.ss{k},')'];
v.s3=sprintf(form,v.rms1); v.s3=['(c) AM4.0 minus ERA ',v.s3];
v.s4=sprintf(form,v.rms2); v.s4=['(d) AM2.1 minus ERA ',v.s4];
v.s5=sprintf(form,v.rms3); v.s5=['(e) AM3 minus ERA ',v.s5];
v.c1=-30;  v.c2=30;  v.vbino=[v.c1:4:v.c2]; v.unit=unit;
v.cmin=-10; v.cmax=10; v.vbin =[v.cmin:1:v.cmax]; 
v.vlab0=[-30:4:30]; v.vlab=[-10:1:10];
plot_5panel_zmean(k,v,s,z1,zo,b1,b2,b3,3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I S15-S18: stratospheric winds(DJF-JJA-MAM-SON)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmu_strat'; unit='(m/s)'; ss={'ANN','MAM','JJA','SON','DJF'};
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50 30 20 10];
s=am4.v1.s; lat=s.lat; mv=-1e10; xy=[-90 90 10 1000]; 
lpf=log10(pf); xy=[-90 90 min(lpf) max(lpf)];
pftic=log10([10 20 30 50 70 100 200 300 500 700 925]);
pflis={'10','20','30','50','70','100','200','300','500','700','925'}
v=o;      [zo bo rmso]=vslice_s(v,s,k,varn,'obs',mv);
v=am4.v0; [z1 b1 rms1]=vslice_s(v,s,k,varn,'mod',mv);
v=am2.v0; [z2 b2 rms2]=vslice_s(v,s,k,varn,'mod',mv);
v=am3.v0; [z3 b3 rms3]=vslice_s(v,s,k,varn,'mod',mv);
v=am4.v0; v.ss=ss; v.pf=pf; v.xy=xy; v.varn=varn; v.expn='AM4p0'; 
v.rms1=rms1; v.rms2=rms2; v.rms3=rms3; v.pftic=pftic; v.pflis=pflis;
z1(1,80:end)=NaN; id=isnan(z1); zo(id)=NaN; b1(id)=NaN; b2(id)=NaN; b3(id)=NaN;
form='(RMSE=%5.2f)';
v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},')'];
v.s2=['(b) ERA-interim (1980-2014; ',v.ss{k},')'];
v.s3=sprintf(form,v.rms1); v.s3=['(c) AM4.0 minus ERA ',v.s3];
v.s4=sprintf(form,v.rms2); v.s4=['(d) AM2.1 minus ERA ',v.s4];
v.s5=sprintf(form,v.rms3); v.s5=['(e) AM3 minus ERA ',v.s5];
v.c1=-30;  v.c2=30;  v.vbino=[v.c1:5:v.c2]; v.unit=unit;
v.cmin=-12; v.cmax=12; v.vbin =[v.cmin:2:v.cmax]; 
v.vlab0=[-30:5:30]; v.vlab=[-10:5:10];
plot_5panel_zmean(k,v,s,z1,zo,b1,b2,b3,3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I S19-S22: stratospheric zonal mean temperature(DJF-JJA-MAM-SON)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=4; varn='zmt_strat'; unit='(C)'; ss={'ANN','MAM','JJA','SON','DJF'};
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50 30 20 10];
s=am4.v1.s; lat=s.lat; mv=-1e10; xy=[-90 90 10 1000]; 
lpf=log10(pf); xy=[-90 90 min(lpf) max(lpf)];
pftic=log10([10 20 30 50 70 100 200 300 500 700 925]);
pflis={'10','20','30','50','70','100','200','300','500','700','925'}
v=o;      [zo bo rmso]=vslice_s(v,s,k,varn,'obs',mv);
v=am4.v0; [z1 b1 rms1]=vslice_s(v,s,k,varn,'mod',mv);
v=am2.v0; [z2 b2 rms2]=vslice_s(v,s,k,varn,'mod',mv);
v=am3.v0; [z3 b3 rms3]=vslice_s(v,s,k,varn,'mod',mv);
v=am4.v0; v.ss=ss; v.pf=pf; v.xy=xy; v.varn=varn; v.expn='AM4p0'; 
v.rms1=rms1; v.rms2=rms2; v.rms3=rms3; v.pftic=pftic; v.pflis=pflis;
z1(1,80:end)=NaN; id=isnan(z1); zo(id)=NaN; b1(id)=NaN; b2(id)=NaN; b3(id)=NaN;
form='(RMSE=%5.2f)'; a=273.15; z1=z1-a; zo=zo-a;
v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},')'];
v.s2=['(b) ERA-interim (1980-2014; ',v.ss{k},')'];
v.s3=sprintf(form,v.rms1); v.s3=['(c) AM4.0 minus ERA ',v.s3];
v.s4=sprintf(form,v.rms2); v.s4=['(d) AM2.1 minus ERA ',v.s4];
v.s5=sprintf(form,v.rms3); v.s5=['(e) AM3 minus ERA ',v.s5];
v.c1=-90;  v.c2=20;  v.vbino=[v.c1:10:v.c2]; v.unit=unit;
v.cmin=-10; v.cmax=10; v.vbin =[v.cmin:1:v.cmax]; 
v.vlab0=[-30:5:30]; v.vlab=[-10:5:10];
plot_5panel_zmean(k,v,s,z1,zo,b1,b2,b3,3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


z1(1,80:end)=NaN; %figure; contourf(z1);
id=isnan(z1); zo(id)=NaN; b1(id)=NaN; b2(id)=NaN; b3(id)=NaN;
pms=[ 0, 0, 1300, 1100]*0.8; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
cmin=-10; cmax=10; vbin=[cmin:1:cmax];
x0=0.08; y0=0.7; wx=0.38; wy=0.25; dx=0.1; dy=0.05;
p1= [x0,          y0,           wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,           wx, wy];%position of first subplot
p3= [x0+(wx+dx)/2,y0-wy-dy,     wx, wy];%position of first subplot
p4= [x0,          y0-2*(wy+dy), wx, wy];%position of first subplot
p5= [x0+wx+dx,    y0-2*(wy+dy), wx, wy];%position of first subplot
nn=32; cmap=jet(nn); %cmap(nn/2:nn/2+1,:)=1;
subplot('Position',p1); c1=-90; c2=20; vbino=[c1:10:c2]; vlab0=[-90:10:20]
[C,h]=contourf(lat,lpf,z1-273.15,vbino); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h,vlab0,'Rotation',0); colormap(cmap);
set(gca,'ytick',pftic); set(gca,'yticklabel',pflis); 
mt=['(a) AM4.0 (1980-2014; ',ss{k},')'];
title(mt,'FontSize',fsize); set(gca,'FontSize',fsize); 
axis(xy); set(gca,'yDir','reverse'); 
subplot('Position',p2);
[C,h]=contourf(lat,lpf,zo-273.15,vbino); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h,vlab0,'Rotation',0); colormap(cmap);
set(gca,'ytick',pftic); set(gca,'yticklabel',pflis); 
mt=['(b) ERA-I (1980-2014; ',ss{k},')'];
title(mt,'FontSize',fsize); set(gca,'FontSize',fsize); 
axis(xy); set(gca,'yDir','reverse'); 
subplot('Position',p3); vlab1=[-10:2:10]
[C,h]=contourf(lat,lpf,b1,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h,vlab1,'Rotation',0);  colormap(bluewhitered(nn));
set(gca,'ytick',pftic); set(gca,'yticklabel',pflis); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(c) AM4.0 minus ERA-I (RMSE=%5.2f)',rms1);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot('Position',p4);
[C,h]=contourf(lat,lpf,b2,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h,vlab1,'Rotation',0); 
set(gca,'ytick',pftic); set(gca,'yticklabel',pflis); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(d) AM2.1 minus ERA-I (RMSE=%5.2f)',rms2);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot('Position',p5); 
[C,h]=contourf(lat,lpf,b3,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h,vlab1,'Rotation',0); 
set(gca,'ytick',pftic); set(gca,'yticklabel',pflis); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(e) AM3 minus ERA-I (RMSE=%5.2f)',rms3);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/';
vname=strcat(varn,(ss{k}),'_strato');
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.38 long amip aerosol effect
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_am4p0/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat'); 
tpath='/archive/Ming.Zhao/awg/warsaw/';
expn='c96L33_am4p0_longamip';                 fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v1=getfields(v);
%expn='c96L33_am4p0_longamip_m1';              fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v2=getfields(v);
%expn='c96L33_am4p0_longamip_m2';              fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v3=getfields(v);
expn='c96L33_am4p0_longamip_m1_aero';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.a1=getfields(v);
expn='c96L33_am4p0_longamip_m2_aero';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.a2=getfields(v);
expn='c96L33_am4p0_longamip_m3_aero';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.a3=getfields(v);
expn='c96L33_am4p0_longamip_m1_GHG';          fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.g1=getfields(v);
expn='c96L33_am4p0_longamip_m2_GHG';          fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.g2=getfields(v);
expn='c96L33_am4p0_longamip_m3_GHG';          fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.g3=getfields(v);
expn='c96L33_am4p0_longamip_1850rad_novol_m1';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c1=getfields(v);
%expn='c96L33_am4p0_longamip_1850rad';        fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c1=getfields(v);
%expn='c96L33_am4p0_longAMIP_1850forcing_cmip5_1860aero';fn=strcat(tpath,expn,pp,expn,dr);load(fn);amx.c1=getfields(v);
%expn='c96L33_am4p0_longAMIP_1850forcing_cmip5_TSaero';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);amx.a1=getfields(v);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/AM3/';
expn='c48L48_am3p11_allforcr_A1'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v1=getfields(v);
expn='c48L48_am3p11_allforcr_A2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v2=getfields(v);
expn='c48L48_am3p11_allforcr_A3'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v3=getfields(v);
expn='c48L48_am3p11_allforcr_A4'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v4=getfields(v);
expn='c48L48_am3p11_allforcr_A5'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v5=getfields(v);
expn='c48L48_am3p11_aeroOnly_A1'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a1=getfields(v);
expn='c48L48_am3p11_aeroOnly_A2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a2=getfields(v);
expn='c48L48_am3p11_aeroOnly_A3'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a3=getfields(v);
expn='c48L48_am3p11_aeroOnly_A4'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a4=getfields(v);
expn='c48L48_am3p11_aeroOnly_A5'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a5=getfields(v);
expn='c48L48_am3p11_WMGGOnly_A1'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g1=getfields(v);
expn='c48L48_am3p11_WMGGOnly_A2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g2=getfields(v);
expn='c48L48_am3p11_WMGGOnly_A3'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g3=getfields(v);
expn='c48L48_am3p11_WMGGOnly_A4'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g4=getfields(v);
expn='c48L48_am3p11_WMGGOnly_A5'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g5=getfields(v);
expn='c48L48_am3p11_1860_A1';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c1=getfields(v);
expn='c48L48_am3p11_1860_A2';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c2=getfields(v);
expn='c48L48_am3p11_1860_A3';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c3=getfields(v);
expn='c48L48_am3p11_1860_A4';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c4=getfields(v);
expn='c48L48_am3p11_1860_A5';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c5=getfields(v);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/AM2.1/';
expn='AM2.1RC3_allforc_A1';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v1=getfields(v);
expn='AM2.1RC3_allforc_A2';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v2=getfields(v);
expn='AM2.1RC3_allforc_A3';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v3=getfields(v);
expn='AM2.1RC3_aeroOnly_A1';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.a1=getfields(v); 
expn='AM2.1RC3_aeroOnly_A2';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.a2=getfields(v);
expn='AM2.1RC3_aeroOnly_A3';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.a3=getfields(v);
expn='AM2.1RC3_WMGGOnly_A1';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.g1=getfields(v);
expn='AM2.1RC3_WMGGOnly_A2';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.g2=getfields(v);
expn='AM2.1RC3_WMGGOnly_A3';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.g3=getfields(v);
expn='AM2.1RC3_1860_A1';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.c1=getfields(v);
expn='AM2.1RC3_1860_A2';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.c2=getfields(v);
expn='AM2.1RC3_1860_A3';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.c3=getfields(v);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
am2=compute_rfp_lamip(am2,'am2');
am3=compute_rfp_lamip(am3,'am3');
am4=compute_rfp_lamip(am4,'am4');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.38 long amip aerosol effect
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=14; lw=3; 
handle=figure('Position',pms,'visible','on'); 
t=[1870:5:2014]+2.5; xy=[1870 2015 -2.0 0.5];
lw=2; a=3; k1=1; k2=22;
x=am3.toa.rfp.aer; y=am4.toa.rfp.aer; 
r=corrcoef(x(k1:k2),y(k1:k2)); c=polyfit(x(k1:k2),y(k1:k2),1);
y1=c(1)*x+c(2); hold on; 
plot(t,x, 'b','LineWidth',lw); hold on;
plot(t,y, 'r','LineWidth',lw); hold on;
plot(t,y1,'k','LineWidth',lw); hold on;
%plot(t,amx.toa.rfp.aer,'c','LineWidth',lw); hold on;
plot([1870 2015],[0 0],'k-'); box on;
xlabel('year','FontSize',fsize); axis(xy);
ylabel('Aerosol RFP at TOA (W/m^2)','FontSize',fsize);
set(gca,'FontSize',fsize); box on;
legend('AM3','AM4','AM4 (predicted from regression)',3);
visfig='off'; figpath='./fig_am4/'; expn='longamip'; vname='aero_rfp_cmip5';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.38x include everything (all RFP+allmodels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.8; fsize=14; lw=3; 
handle=figure('Position',pms,'visible','on'); 
t=[1870:5:2014]+2.5; xy=[1870 2015 -1.8 3.2];
lw=2; a=3; k1=1; k2=22;
tot4=am4.toa.rfp.tot; aer4=am4.toa.rfp.aer; ghg4=am4.toa.rfp.ghg;
tot3=am3.toa.rfp.tot; aer3=am3.toa.rfp.aer; ghg3=am3.toa.rfp.ghg;
tot2=am2.toa.rfp.tot; aer2=am2.toa.rfp.aer; ghg2=am2.toa.rfp.ghg;
plot(t,ghg4, 'r--','LineWidth',lw+2); hold on;
plot(t,ghg3, 'b--','LineWidth',lw); hold on;
plot(t,ghg2, 'g--','LineWidth',lw); hold on;
plot(t,aer4, 'r-.', 'LineWidth',lw+2); hold on;
plot(t,aer3, 'b-.', 'LineWidth',lw); hold on;
plot(t,aer2, 'g-.', 'LineWidth',lw); hold on;
plot(t,ghg4+aer4,'r-','LineWidth',lw+2); hold on;
plot(t,ghg3+aer3,'b-','LineWidth',lw); hold on;
plot(t,ghg2+aer2,'g-','LineWidth',lw); hold on;
plot(t,tot4,     'r:','LineWidth',lw*2); hold on;
plot(t,tot3,     'b:','LineWidth',lw*2); hold on;
plot(t,tot2,     'g:','LineWidth',lw*2); hold on;
plot([1870 2015],[0 0],'k-'); box on; grid on;
xlabel('year','FontSize',fsize); axis(xy);
ylabel('RFP at TOA (W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize); box on;
legend('AM4(WMGG+O3)',     'AM3(WMGG)',     'AM2(WMGG)',...
       'AM4(AERO)',        'AM3(AERO)',     'AM2(AERO)',...
       'AM4(WMGG+O3+AERO)','AM3(WMGG+AERO)','AM2(WMGG+AERO)',...
       'AM4(Total)',       'AM3(Total)',    'AM2(Total)',  2);
visfig='off'; figpath='./fig_am4/'; expn='longamip'; vname='rfp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


