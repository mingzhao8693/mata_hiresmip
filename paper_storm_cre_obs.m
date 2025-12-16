%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/backup/ECMWF/'; 
expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=2001;yr2=2014; pct=[99 99.9];
opt='obs'; addtc_to_AR_obs_ceres(tpath,expn,yr1,yr2,opt,-20,238);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/backup/ECMWF/'; diag=1;
expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=2001;yr2=2008; pct=[99 99.9];
opt='MC'; v=readartcmcs_day_cre_obs(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AL'; v=readartcmcs_day_cre_obs(tpath,expn,yr1,yr2,pct,opt,diag);
tpath='/archive/Ming.Zhao/backup/ECMWF/'; diag=1;
expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=2001;yr2=2014; pct=[99 99.9];
opt='PA';  v=readartcmcs_day_cre_obs(tpath,expn,yr1,yr2,pct,opt,diag);
opt='PB';  v=readartcmcs_day_cre_obs(tpath,expn,yr1,yr2,pct,opt,diag);
opt='PC';  v=readartcmcs_day_cre_obs(tpath,expn,yr1,yr2,pct,opt,diag);
opt='PD';  v=readartcmcs_day_cre_obs(tpath,expn,yr1,yr2,pct,opt,diag);

opt='P00'; v=readartcmcs_day_cre_obs(tpath,expn,yr1,yr2,pct,opt,diag);
opt='P01'; v=readartcmcs_day_cre_obs(tpath,expn,yr1,yr2,pct,opt,diag);
opt='P02'; v=readartcmcs_day_cre_obs(tpath,expn,yr1,yr2,pct,opt,diag);
opt='PR01'; v=readartcmcs_day_cre_obs(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AR'; v=readartcmcs_day_cre_obs(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TC'; v=readartcmcs_day_cre_obs(tpath,expn,yr1,yr2,pct,opt,diag);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; ardir='AR_climlmt';yr1=2001;yr2=2014;diag=1;
%opt='mod'; addtc_to_AR(tpath,expn,yr1,yr2,opt,-30)
opt='PA';   v=readartcmcs_day_cre(tpath,expn,yr1,yr2,pct,opt,diag);
opt='PB';   v=readartcmcs_day_cre(tpath,expn,yr1,yr2,pct,opt,diag);
opt='P00';  v=readartcmcs_day_cre(tpath,expn,yr1,yr2,pct,opt,diag);
opt='P01';  v=readartcmcs_day_cre(tpath,expn,yr1,yr2,pct,opt,diag);
opt='PR01'; v=readartcmcs_day_cre(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AL';   v.al=readartcmcs_day_cre(tpath,expn,yr1,yr2,pct,opt,diag);
opt='MC';   v.mc=readartcmcs_day_cre(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AR';   v.ar=readartcmcs_day_cre(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TC';   v.tc=readartcmcs_day_cre(tpath,expn,yr1,yr2,pct,opt,diag);
%opt='mod'; v=readarmap_allday(tpath,expn,yr1,yr2,pct,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load observations%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip_cre/'; d=2; s='_readartcmcs_day_cre.mat';
expn='ERAI_6h_DATA'; yrs='_2001_2014_';ardir='AR_climlmt'
fext=strcat(yrs,'AR_diag1',  s); fn=strcat(tpath,expn,fext); load(fn);ob.ar=v;
fext=strcat(yrs,'TC_diag1',  s); fn=strcat(tpath,expn,fext); load(fn);ob.tc=v;
fext=strcat(yrs,'PR01_diag1',s); fn=strcat(tpath,expn,fext); load(fn);ob.pr=v;
fext=strcat(yrs,'P01_diag1', s); fn=strcat(tpath,expn,fext); load(fn);ob.p1=v;
fext=strcat(yrs,'P02_diag1', s); fn=strcat(tpath,expn,fext); load(fn);ob.p2=v;
fext=strcat(yrs,'P00_diag1', s); fn=strcat(tpath,expn,fext); load(fn);ob.p0=v;
fext=strcat(yrs,'PA_diag1',  s); fn=strcat(tpath,expn,fext); load(fn);ob.pa=v;
fext=strcat(yrs,'PB_diag1',  s); fn=strcat(tpath,expn,fext); load(fn);ob.pb=v;
fext=strcat(yrs,'PC_diag1',  s); fn=strcat(tpath,expn,fext); load(fn);ob.pc=v;
fext=strcat(yrs,'PD_diag1',  s); fn=strcat(tpath,expn,fext); load(fn);ob.pd=v;
fext=strcat('_2001_2008_MC_diag1',s); fn=strcat(tpath,expn,fext); load(fn);ob.mc=v;
fext=strcat('_2001_2008_AL_diag1',s); fn=strcat(tpath,expn,fext); load(fn);ob.al=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre.mat';
expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; yrs='_2001_2014_';ardir='AR_climlmt'
fext=strcat(yrs,'AR_diag1',  s); fn=strcat(tpath,expn,fext); load(fn);vm.ar=v;
fext=strcat(yrs,'TC_diag1',  s); fn=strcat(tpath,expn,fext); load(fn);vm.tc=v;
fext=strcat(yrs,'PR01_diag1',s); fn=strcat(tpath,expn,fext); load(fn);vm.pr=v;
fext=strcat(yrs,'P01_diag1', s); fn=strcat(tpath,expn,fext); load(fn);vm.p1=v;
fext=strcat(yrs,'P00_diag1', s); fn=strcat(tpath,expn,fext); load(fn);vm.p0=v;
fext=strcat(yrs,'PA_diag1',  s); fn=strcat(tpath,expn,fext); load(fn);vm.pa=v;
fext=strcat(yrs,'PB_diag1',  s); fn=strcat(tpath,expn,fext); load(fn);vm.pb=v;
fext=strcat(yrs,'MC_diag1',  s); fn=strcat(tpath,expn,fext); load(fn);vm.mc=v;
fext=strcat(yrs,'AL_diag1',  s); fn=strcat(tpath,expn,fext); load(fn);vm.al=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===FigS1===: annual frequency of xx days %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
v=ob; p.vname='obs_frqday';
p.z1=squeeze(v.p2.frqday)*100;   
p.z2=squeeze(v.pr.frqday)*100; 
p.z3=squeeze(v.ar.frqday)*100;
p.z4=squeeze(v.tc.frqday)*100;    
p.z5=squeeze(v.mc.frqday)*100;    
p.z6=squeeze(v.al.frqday)*100;    
p.z7=p.z1-p.z2; p.z8=p.z2-p.z6;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) frequency of precipitation days'; 
p.s2='(b) frequency of wet days'; 
p.s3='(c) frequency of AR days'; 
p.s4='(d) frequency of TS days';
p.s5='(e) frequency of MCS days'; 
p.s6='(f) frequency of AR+TS+MCS days'; 
p.s7='(g) (a) minus (b)'; 
p.s8='(h) (b) minus (f)';
a=[0 100]; p.c1=a; p.un='\%'; p.fsize=8; p.optit=1; p.opt=4;p.nn=128;
a=[0 100]; p.c2=a;
a=[0 20];  p.c3=a; p.c4=a; p.c5=a; p.c6=[0 40]; p.c7=p.c6; p.c8=p.c6;
plot_2d_8panel(p)
plot_2d_6panel_frqday(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===Fig1===: annual mean LWCF contributed from AR/TS/MSC %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
v=ob; p.vname='obs_lwcf_idwei';
%v=vm; p.vname='mod_lwcf_idwei';
p.z1=squeeze(v.ar.lwcf_av);   
p.z2=squeeze(v.p2.lwcf_idwei);   
p.z3=squeeze(v.pr.lwcf_idwei); 
p.z4=squeeze(v.ar.lwcf_idwei);
p.z5=squeeze(v.tc.lwcf_idwei);    
p.z6=squeeze(v.mc.lwcf_idwei);    
p.z7=squeeze(v.al.lwcf_idwei);    
p.z8=squeeze(v.al.lwcf_idwei./v.ar.lwcf_av)*100;    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean LW CRE';
p.s2='(b) LW CRE from precip days'; 
p.s3='(c) LW CRE from wet days'; 
p.s4='(d) LW CRE from AR days'; 
p.s5='(e) LW CRE from TS days';
p.s6='(f) LW CRE from MCS days'; 
p.s7='(g) LW CRE from AR+TS+MCS days';
p.s8='(h) percentage of LW CRE from AR+TS+MCS days';
a=[0 80];   p.c1=a; p.un='W/m2'; p.fsize=8; p.optit=1; p.opt=4;p.nn=128;
a=[0 80 ];  p.c2=a; p.c3=a; 
a=[0 20]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=[0 50];
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===Fig2===: LWCF averaged over storm days %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='obs'; %all time mean prday from each weather type
p.vname='lwcf_idavg'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
v=ob; p.vname='obs_lwcf_idavg';
%v=vm; p.vname='mod_lwcf_idavg';
p.z1=squeeze(v.pd.lwcf_idavg);   
p.z2=squeeze(v.pc.lwcf_idavg); %p.z2=p.z2-p.z1*2;
p.z3=squeeze(v.pr.lwcf_idavg);
p.z4=squeeze(v.ar.lwcf_idavg);    
p.z5=squeeze(v.tc.lwcf_idavg);    
p.z6=squeeze(v.mc.lwcf_idavg);    
p.z7=squeeze(v.al.lwcf_idavg);    
p.z8=squeeze(v.pb.lwcf_idavg); 
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) LW CRE avg. non-precip days';
p.s2='(b) LW CRE avg. precip but non-wet days'; 
p.s3='(c) LW CRE avg. all wet days)';
p.s4='(d) LW CRE avg. AR days'; 
p.s5='(e) LW CRE avg. TS days';
p.s6='(f) LW CRE avg. MCS days'; 
p.s7='(g) LW CRE avg. AR+TS+MCS days';
p.s8='(h) LW CRE avg. wet but non-(AR+TS+MCS) days'; 
a=[0 120]; %a=[-30 30]; 
p.c1=a; p.c2=a; p.un='W/m2'; p.fsize=8; p.optit=4; p.opt=4;p.nn=128;
p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a; 
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===Fig3===: annual mean SWCF contributed from AR/TS/MSC %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='obs'; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
v=ob; p.vname='obs_swcf_idwei';
%v=vm; p.vname='mod_swcf_idwei';
p.z1=squeeze(v.ar.swcf_av);   
p.z2=squeeze(v.p2.swcf_idwei);   
p.z3=squeeze(v.pr.swcf_idwei); 
p.z4=squeeze(v.ar.swcf_idwei);
p.z5=squeeze(v.tc.swcf_idwei);    
p.z6=squeeze(v.mc.swcf_idwei);    
p.z7=squeeze(v.al.swcf_idwei);    
p.z8=squeeze(v.al.swcf_idwei./v.ar.swcf_av)*100;    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean SW CRE';
p.s2='(b) SW CRE from precip days'; 
p.s3='(c) SW CRE from wet days'; 
p.s4='(d) SW CRE from AR days;'; 
p.s5='(e) SW CRE from TS days;';
p.s6='(f) SW CRE from MCS days;'; 
p.s7='(g) SW CRE from AR+TS+MCS days;';
p.s8='(h) percentage of SW CRE from AR+TS+MCS days';
a=[-100 0]; p.c1=a; p.un='W/m2'; p.fsize=8; p.optit=1; p.opt=3;p.nn=128
a=[-100 0]; p.c2=a; p.c3=a; 
a=[-30  0]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=[0 60];
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===Fig4===: SWCF averaged over storm days %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='obs'; %all time mean prday from each weather type
p.vname='swcf_idavg'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
v=ob; p.vname='obs_swcf_idavg';
%v=vm; p.vname='mod_swcf_idavg';
p.z1=squeeze(v.pd.swcf_idavg);   
p.z2=squeeze(v.pc.swcf_idavg);   
p.z3=squeeze(v.pr.swcf_idavg);
p.z4=squeeze(v.ar.swcf_idavg);    
p.z5=squeeze(v.tc.swcf_idavg);    
p.z6=squeeze(v.mc.swcf_idavg);    
p.z7=squeeze(v.al.swcf_idavg);    
p.z8=squeeze(v.pb.swcf_idavg); 
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) SW CRE avg. non-precip days';
p.s2='(b) SW CRE avg. precip but non-wet days'; 
p.s3='(c) SW CRE avg. all wet days';
p.s4='(d) SW CRE avg. AR days'; 
p.s5='(e) SW CRE avg. TS days';
p.s6='(f) SW CRE avg. MCS days'; 
p.s7='(g) SW CRE avg. AR+TS+MCS days';
p.s8='(h) SW CRE avg. wet but non-(AR+TS+MCS) days'; 
a=[-120 0];  p.c1=a; p.un='W/m2'; p.fsize=8; p.optit=4; p.opt=3;p.nn=128;
a=[-120 0]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===Fig5===: annual mean total CRE contributed from AR/TS/MSC %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='obs'; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
v=ob; p.vname='obs_ttcf_idwei';
%v=vm; p.vname='mod_ttcf_idwei';
p.z1=squeeze(v.ar.ttcf_av);   
p.z2=squeeze(v.p2.ttcf_idwei);   
p.z3=squeeze(v.pr.ttcf_idwei); 
p.z4=squeeze(v.ar.ttcf_idwei);
p.z5=squeeze(v.tc.ttcf_idwei);    
p.z6=squeeze(v.mc.ttcf_idwei);    
p.z7=squeeze(v.al.ttcf_idwei);    
p.z8=squeeze(v.al.ttcf_idwei./v.ar.ttcf_av)*100;    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean total CRE';
p.s2='(b) total CRE from precip days'; 
p.s3='(c) total CRE from wet days'; 
p.s4='(d) total CRE from AR days;'; 
p.s5='(e) total CRE from TS days;';
p.s6='(f) total CRE from MCS days;'; 
p.s7='(g) total CRE from AR+TS+MCS days;';
p.s8='(h) percentage of total CRE from AR+TS+MCS days';
a=[-60 0]; p.c1=a; p.un='W/m2'; p.fsize=8; p.optit=1; p.opt=3;p.nn=128
a=[-60 0]; p.c2=a; p.c3=a; 
a=[-10 0]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=[0 100];
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%===Fig6===: total CRE averaged over storm days %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='obs'; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
v=ob; p.vname='obs_ttcf_idavg';
%v=vm; p.vname='mod_ttcf_idavg';
p.z1=squeeze(v.pd.ttcf_idavg);   
p.z2=squeeze(v.pc.ttcf_idavg);   
p.z3=squeeze(v.pr.ttcf_idavg);
p.z4=squeeze(v.ar.ttcf_idavg);    
p.z5=squeeze(v.tc.ttcf_idavg);    
p.z6=squeeze(v.mc.ttcf_idavg);    
p.z7=squeeze(v.al.ttcf_idavg);    
p.z8=squeeze(v.pb.ttcf_idavg); 
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) total CRE avg. non-precip days';
p.s2='(b) total CRE avg. precip but non-wet days'; 
p.s3='(c) total CRE avg. all wet days';
p.s4='(d) total CRE from AR days'; 
p.s5='(e) total CRE from TS days';
p.s6='(f) total CRE from MCS days'; 
p.s7='(g) total CRE from AR+TS+MCS days';
p.s8='(h) total CRE avg. wet but non-(AR+TS+MCS) days'; 
a=[-50 0];  p.c1=a; p.un='W/m2'; p.fsize=8; p.optit=4; p.opt=3;p.nn=128;
a=[-50 0]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig7: annual mean OLR contributed from AR/TS/MSC %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='obs'; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
v=ob; p.vname='obs_olr_idwei';
%v=vm; p.vname='mod_olr_idwei';
p.z1=squeeze(v.ar.rlut_av);   
p.z2=squeeze(v.p2.rlut_idwei);   
p.z3=squeeze(v.pr.rlut_idwei); 
p.z4=squeeze(v.ar.rlut_idwei);
p.z5=squeeze(v.tc.rlut_idwei);    
p.z6=squeeze(v.mc.rlut_idwei);    
p.z7=squeeze(v.al.rlut_idwei);    
p.z8=squeeze(v.al.rlut_idwei./v.ar.rlut_av)*100;    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean OLR';
p.s2='(b) OLR from precip days'; 
p.s3='(c) OLR from wet days'; 
p.s4='(d) OLR from AR days;'; 
p.s5='(e) OLR from TS days;';
p.s6='(f) OLR from MCS days;'; 
p.s7='(g) OLR from AR+TS+MCS days;';
p.s8='(h) percentage of OLR from AR+TS+MCS days';
a=[00 300]; p.c1=a; p.un='W/m2'; p.fsize=7; p.optit=1; p.opt=4;p.nn=128;
a=[0 300]; p.c2=a; p.c3=a; 
a=[0 50];    p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=[0 50];
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig8: OLR averaged from all AR/TS/MSC days %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
v=ob; p.vname='obs_olr_idavg';
%v=vm; p.vname='mod_olr_idavg';
p.z1=squeeze(v.pd.rlut_idavg);   
p.z2=squeeze(v.pc.rlut_idavg);   
p.z3=squeeze(v.pr.rlut_idavg); 
p.z4=squeeze(v.ar.rlut_idavg);
p.z5=squeeze(v.tc.rlut_idavg);    
p.z6=squeeze(v.mc.rlut_idavg);    
p.z7=squeeze(v.al.rlut_idavg);    
p.z8=squeeze(v.pb.rlut_idavg); 
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) OLR avg. non-precip days';
p.s2='(b) OLR avg precip but non-wet days'; 
p.s3='(c) OLR avg. all wet days'; 
p.s4='(d) OLR from AR days;'; 
p.s5='(e) OLR from TS days;';
p.s6='(f) OLR from MCS days;'; 
p.s7='(g) OLR from AR+TS+MCS days;';
p.s8='(h) OLR avg. wet but non-(AR+TS+MCS) days';
a=[100 300]; p.c1=a; p.un='W/m2'; p.fsize=7; p.optit=4; p.opt=4;p.nn=128;
a=[100 300]; p.c2=a; p.c3=a; 
a=[100 300]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig9: annual mean clear-sky OLR contributed from AR/TS/MSC %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='obs'; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
v=ob; p.vname='obs_olr_clr_idwei';
%v=vm; p.vname='mod_olr_clr_idwei';
p.z1=squeeze(v.ar.rlutcs_av);   
p.z2=squeeze(v.p2.rlutcs_idwei);   
p.z3=squeeze(v.pr.rlutcs_idwei); 
p.z4=squeeze(v.ar.rlutcs_idwei);
p.z5=squeeze(v.tc.rlutcs_idwei);    
p.z6=squeeze(v.mc.rlutcs_idwei);    
p.z7=squeeze(v.al.rlutcs_idwei);    
p.z8=squeeze(v.al.rlutcs_idwei./v.ar.rlutcs_av)*100;    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean clear-sky OLR';
p.s2='(b) clear-sky OLR from precip days'; 
p.s3='(c) clear-sky OLR from wet days'; 
p.s4='(d) clear-sky OLR from AR days;'; 
p.s5='(e) clear-sky OLR from TS days;';
p.s6='(f) clear-sky OLR from MCS days;'; 
p.s7='(g) clear-sky OLR from AR+TS+MCS days;';
p.s8='(h) percentage of clear-sky OLR from AR+TS+MCS days';
a=[00 300]; p.c1=a; p.un='W/m2'; p.fsize=7; p.optit=1; p.opt=4;p.nn=128;
a=[0 300]; p.c2=a; p.c3=a; 
a=[0 50];    p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=[0 50];
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig8: clear-sky OLR averaged from all AR/TS/MSC days %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
v=ob; p.vname='obs_olr_clr_idavg';
%v=vm; p.vname='mod_olr_idavg';
p.z1=squeeze(v.pd.rlutcs_idavg);   
p.z2=squeeze(v.pc.rlutcs_idavg);   
p.z3=squeeze(v.pr.rlutcs_idavg); 
p.z4=squeeze(v.ar.rlutcs_idavg);
p.z5=squeeze(v.tc.rlutcs_idavg);    
p.z6=squeeze(v.mc.rlutcs_idavg);    
p.z7=squeeze(v.al.rlutcs_idavg);    
p.z8=squeeze(v.pb.rlutcs_idavg); 
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) clear-sky OLR avg. non-precip days';
p.s2='(b) clear-sky OLR avg precip but non-wet days'; 
p.s3='(c) clear-sky OLR avg. all wet days'; 
p.s4='(d) clear-sky OLR from AR days;'; 
p.s5='(e) clear-sky OLR from TS days;';
p.s6='(f) clear-sky OLR from MCS days;'; 
p.s7='(g) clear-sky OLR from AR+TS+MCS days;';
p.s8='(h) clear-sky OLR avg. wet but non-(AR+TS+MCS) days';
a=[100 300]; p.c1=a; p.un='W/m2'; p.fsize=7; p.optit=4; p.opt=4;p.nn=128;
a=[100 300]; p.c2=a; p.c3=a; 
a=[100 300]; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig9: annual mean LWCF contributed from AR/TS/MSC %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];p.expn='cre';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=64; p.c='k';
v=ob; p.vname='obs_rlut_idwei';
%v=vm; p.vname='mod_lwcf_idwei';
p.z1=squeeze(v.ar.rlut_av);   
p.z2=squeeze(v.p1.rlut_idwei);   
p.z3=squeeze(v.pr.rlut_idwei); 
p.z4=squeeze(v.ar.rlut_idwei);
p.z5=squeeze(v.tc.rlut_idwei);    
p.z6=squeeze(v.mc.rlut_idwei);    
p.z7=squeeze(v.al.rlut_idwei);    
p.z8=squeeze(v.al.rlut_idwei./v.ar.rlut_av)*100;    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean LWCRE';
p.s2='(b) OLR from P>=0.1mm/day'; 
p.s3='(c) OLR from P>=1 mm/day'; 
p.s4='(d) OLR from AR'; 
p.s5='(e) OLR from TS';
p.s6='(f) OLR from MCS'; 
p.s7='(g) OLR from AR+TS+MCS';
p.s8='(h) percentage of LWCRE from AR+TS+MCS';
a=[200 300]; p.c1=a; p.un='W/m2'; p.fsize=7; p.optit=1; p.opt=4;p.nn=128;
a=[100 300]; p.c2=a; p.c3=a; 
a=[0 50];    p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=[0 50];
plot_2d_8panel(p)
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

