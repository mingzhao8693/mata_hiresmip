%dmget data
set tpath = /archive/Ming.Zhao/awg/2023.04/
set expn  = c192L33_am4p0_2010climo_newctl
set expn  = c192L33_am4p0_2010climo_newctl_p1K
set expn  = c192L33_am4p0_2010climo_newctl_p4K
set expn  = c192L33_am4p0_2010climo_newctl_4xCO2
#set expn  = c192L33_am4p0_2010climo_trend_1979_2020_spear
#set expn  = c192L33_am4p0_2010climo_trend_1979_2020_times_2
set expn  = c192L33_am4p0_2010climo_p4K
set expn  = c192L33_am4p0_2010climo_old

set epath = $tpath/$expn
cd $epath/atmos_data/daily
dmget *pr.nc *tas.nc *sfcWind.nc *hurs.nc
cd $epath/atmos_data/3hr
dmget *pr.nc
cd $epath/atmos_data/daily_river
dmget *rv_o_h2o.nc 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/'; opt='extremes'; diag=0;
pct=[25 50 75 90 95 99 99.9 99.99 99.999]; latlon=[190 304 16 75]; yr1=2; yr2=101; 
expn='c192L33_am4p0_2010climo_p4K';                     v=read_daily_namerica(tpath,expn,yr1,yr2,pct,opt,diag,latlon)
expn='c192L33_am4p0_2010climo_old';                     v=read_daily_namerica(tpath,expn,yr1,yr2,pct,opt,diag,latlon)
expn='c192L33_am4p0_2010climo_newctl';                  v=read_daily_namerica(tpath,expn,yr1,yr2,pct,opt,diag,latlon)
expn='c192L33_am4p0_2010climo_newctl_p1K';              v=read_daily_namerica(tpath,expn,yr1,yr2,pct,opt,diag,latlon)
expn='c192L33_am4p0_2010climo_newctl_4xCO2';            v=read_daily_namerica(tpath,expn,yr1,yr2,pct,opt,diag,latlon)
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear';   v=read_daily_namerica(tpath,expn,yr1,yr2,pct,opt,diag,latlon)
expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2'; v=read_daily_namerica(tpath,expn,yr1,yr2,pct,opt,diag,latlon)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load results%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ph='/work/miz/mat_hiresmip/land/'; f='_2_101_RO_diag0_read_daily_namerica_new.mat';
ph='/work/miz/mat_hiresmip/land/'; f='_2_101_extremes_diag0_read_daily_namerica_new.mat';
e='c192L33_am4p0_2010climo_newctl';                 n=strcat(ph,e,f); load(n);z.v0=v;
e='c192L33_am4p0_2010climo_newctl_p1K';             n=strcat(ph,e,f); load(n);z.w0=v; 
e='c192L33_am4p0_2010climo_newctl_4xCO2';           n=strcat(ph,e,f); load(n);z.g0=v; 
e='c192L33_am4p0_2010climo_trend_1979_2020_spear';  n=strcat(ph,e,f); load(n);z.w1=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_times_2';n=strcat(ph,e,f); load(n);z.w2=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Extreme temperature and precipitation%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; %1-7=ANN,MAM,JJA,SON,DJF,NDJFM,MJJA
a0='Present-day'; a1='SPEAR-pattern M'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='extreme_heat'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
del=' $\Delta$'; s0='TASDAY;'; s1='TASMAXDAY; '; s2='PrDay; '; s3='Pr3hr; ';
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

p.cmin0= 0.0; p.cmax0=25;  p.cmin1 =-3.0;  p.cmax1 =3.0;
p.cmin3= 0.0; p.cmax3=25;  p.cmin4 =-3.0;  p.cmax4 =3.0;
p.cmin6= 0.0; p.cmax6=50;  p.cmin7 =-5.0;  p.cmax7 =5.0;
p.cmin9= 0.0; p.cmax9=50;  p.cmin10=-50.0;  p.cmax10=50.0;
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

%tasday
v=z.v0.tasday; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.tasday; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.tasday; a2=squeeze(v.pct(m,ipct,:,:));
a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
if (p.do_bias); p.v0=p.v0; p.cmin0= -5.0; p.cmax0=5; end;
a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);

%tasmaxday
v=z.v0.tasmaxday; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.tasmaxday; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.tasmaxday; a2=squeeze(v.pct(m,ipct,:,:));
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

%pr3hr
v=z.v0.pr3hr; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.pr3hr; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.pr3hr; a2=squeeze(v.pct(m,ipct,:,:));
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







