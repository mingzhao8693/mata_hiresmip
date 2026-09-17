%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ph='/archive/Ming.Zhao/awg/2023.04/'; f='_global_opt2.c96_tsana_hiresmip_new_2_101.mat';
ph='/archive/Ming.Zhao/awg/2023.04/'; f='_global_opt2.c48_tsana_hiresmip_new_ivt_1-100_0002-0101_do_3d_atm_2_do_trend_0.mat';
e='c192L33_am4p0_2010climo_newctl';                                          n=strcat(ph,e,'/',e,f); load(n); Z.v0=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear';                           n=strcat(ph,e,'/',e,f); load(n); Z.w1=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_times_2';                         n=strcat(ph,e,'/',e,f); load(n); Z.w2=v;

e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs';          n=strcat(ph,e,'/',e,f); load(n); Z.w1a=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_20ns_obs';          n=strcat(ph,e,'/',e,f); load(n); Z.w1b=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_30ns_obs';          n=strcat(ph,e,'/',e,f); load(n); Z.w1c=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_tropical_30ns_obs';         n=strcat(ph,e,'/',e,f); load(n); Z.w1d=v;

e='c192L33_am4p0_2010climo_trend_1979_2020_spear_tropical_20ns_obs';         n=strcat(ph,e,'/',e,f); load(n); Z.w1e=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_10n_70n_obs'; n=strcat(ph,e,'/',e,f); load(n); Z.w1f=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_25n_70n_obs'; n=strcat(ph,e,'/',e,f); load(n); Z.w1g=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_south_pacific_10s_45s_obs'; n=strcat(ph,e,'/',e,f); load(n); Z.w1h=v;

e='c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs';             n=strcat(ph,e,'/',e,f); load(n); Z.w1i=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_atlantic_mdr_obs';          n=strcat(ph,e,'/',e,f); load(n); Z.w1j=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_so_45_75s_obs';             n=strcat(ph,e,'/',e,f); load(n); Z.w1k=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_zonal';                     n=strcat(ph,e,'/',e,f); load(n); Z.w1l=v;

e='c192L33_am4p0_2010climo_trend_1979_2020_spear_best_wegradient';           n=strcat(ph,e,'/',e,f); load(n); Z.w1A=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_2best_wegradient';          n=strcat(ph,e,'/',e,f); load(n); Z.w1B=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_2worst_wegradient';         n=strcat(ph,e,'/',e,f); load(n); Z.w1C=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_worst_wegradient';          n=strcat(ph,e,'/',e,f); load(n); Z.w1D=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_middle_wegradient';         n=strcat(ph,e,'/',e,f); load(n); Z.w1E=v;

e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m3';                n=strcat(ph,e,'/',e,f); load(n); Z.w1F=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m16';               n=strcat(ph,e,'/',e,f); load(n); Z.w1G=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m17';               n=strcat(ph,e,'/',e,f); load(n); Z.w1H=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m26';               n=strcat(ph,e,'/',e,f); load(n); Z.w1I=v;

v=Z.v0;  v.T=mean(v.sfc.tref.ann_stat.mmen.all); Z.v0 =v;    a=v.T;
v=Z.w1;  v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1 =v;
v=Z.w2;  v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w2 =v;
v=Z.w1a; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1a=v;
v=Z.w1b; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1b=v;
v=Z.w1c; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1c=v;
v=Z.w1d; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1d=v;
v=Z.w1e; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1e=v;
v=Z.w1f; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1f=v;
v=Z.w1g; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1g=v;
v=Z.w1h; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1h=v;
v=Z.w1i; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1i=v;
v=Z.w1j; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1j=v;
v=Z.w1k; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1k=v;
v=Z.w1l; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1l=v;

v=Z.w1A; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1A=v;
v=Z.w1B; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1B=v;
v=Z.w1C; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1C=v;
v=Z.w1D; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1D=v;
v=Z.w1E; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1E=v;

v=Z.w1F; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1F=v;
v=Z.w1G; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1G=v;
v=Z.w1H; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1H=v;
v=Z.w1I; v.T=mean(v.sfc.tref.ann_stat.mmen.all); v.dT=v.T-a; Z.w1I=v;

[Z.w1.dT Z.w2.dT Z.w1A.dT Z.w1B.dT Z.w1C.dT Z.w1D.dT Z.w1E.dT Z.w1F.dT Z.w1G.dT Z.w1H.dT Z.w1I.dT]
[Z.w1.dT Z.w2.dT Z.w1a.dT Z.w1b.dT Z.w1c.dT Z.w1d.dT Z.w1e.dT Z.w1f.dT Z.w1g.dT Z.w1h.dT Z.w1i.dT Z.w1j.dT Z.w1k.dT Z.w1l.dT]
%ans = 1.2201    1.2431    1.2951    1.2504    1.2527    1.2391    1.2159    1.3184    1.3696    1.3028    1.3331
%ans = 1.2201    1.2431    1.2294    1.2992    1.2953    1.2558    1.2658    1.2190    1.1855    1.1807    1.2069    1.2065    1.2373    1.1824
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigSE3a comparing SPEAR pattern a, b, c, d with M for atmospheric circulation changes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'}; isea=3; %1-7=ANN,MAM,JJA,SON,DJF,NDJFM,MJJA
a1='OP minus SP-M'; a2='SPM-P10obs minus SP-M'; a3='SPM-P20obs minus SP-M '; a4='SPM-P30obs minus SP-M'; a5='SPM-T30obs minus SP-M'; p.flipcmap=0;
p.vname='atm_500_200_850_pme_a_b_c_d'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea}; 
p.dT=[Z.w1.dT Z.w2.dT Z.w1a.dT Z.w1b.dT Z.w1c.dT Z.w1d.dT]; p.dT(1)=1.22; p.dT(2)=1.24;
del=' $\Delta$'; s1='Z500'';'; s2='Z200''; '; s3='Z850''; '; s4='PME; ';
p.s1 =strcat(a1,del,s1); p.s2 =strcat(a2,del,s1); p.s3 =strcat(a3,del,s1); p.s4 =strcat(a4,del,s1); p.s5 =strcat(a5,del,s1);
p.s6 =strcat(a1,del,s2); p.s7 =strcat(a2,del,s2); p.s8 =strcat(a3,del,s2); p.s9 =strcat(a4,del,s2); p.s10=strcat(a5,del,s2);
p.s11=strcat(a1,del,s3); p.s12=strcat(a2,del,s3); p.s13=strcat(a3,del,s3); p.s14=strcat(a4,del,s3); p.s15=strcat(a5,del,s3);
p.s16=strcat(a1,del,s4); p.s17=strcat(a2,del,s4); p.s18=strcat(a3,del,s4); p.s19=strcat(a4,del,s4); p.s20=strcat(a5,del,s4);
p.unit0 ='GPM';                p.unit0_bar =p.unit0;
p.unit1 ='GPM K^{-1}';         p.unit1_bar =p.unit1;
p.unit3 ='GPM';                p.unit3_bar =p.unit3;
p.unit4 ='GPM K^{-1}';         p.unit4_bar =p.unit4;
p.unit6 ='GPM';                p.unit6_bar =p.unit6;
p.unit7 ='GPM K^{-1}';         p.unit7_bar =p.unit7;
p.unit9 ='mm day^{-1}';        p.unit9_bar =p.unit9;
p.unit10='mm day^{-1} K^{-1}'; p.unit10_bar=p.unit10;
p.cmin1 =-15;  p.cmax1=15.;
p.cmin2 =-20;  p.cmax2=20;
p.cmin3 =-10;  p.cmax3=10;
p.cmin4= -2;   p.cmax4=2;

p.showus=false; p.showavg=false; p.do_bias=0; p.co='k'; p.xy=[100 360 -10 90];
v=Z.v0.s;  aa=v.aa; imk=Z.v0.sfc.ice.tavg0;  aa0=aa; 
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lm; p.aa=v.aa; p.aa0=aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<0.5)=0; id(id>=0.5)=1; p.id_lm=(id==1);
lat1= -10; lat2=90; lon1=100; lon2=360; p.xy=[100 360  -10 90];
%lat1=-90; lat2=90; lon1=0;   lon2=360; p.xy=[0   360 -90 90];
p.xy=[lon1 lon2 lat1 lat2];
p.ys=min(find(s.lat(:)>=lat1)); p.ye=max(find(s.lat(:)<=lat2));
p.xs=min(find(s.lon(:)>=lon1)); p.xe=max(find(s.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=a; %id=id.*a; 
id=(id==1); aa=aa0(id); aa=aa/mean(aa); nlon=length(p.lon); p.id=id; %figure; pcolor(id); shading flat; colorbar;

k=3; %850hPa, 700hPa, 500hPa, 300hPa, 200hPa;
v=Z.v0.atm.za(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=Z.w1.atm.za(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=Z.w2.atm.za(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
v=Z.w1a.atm.za(k); a=v.sea; a3=squeeze(a(isea,:,:)); a3=get_zonala(a3);
v=Z.w1b.atm.za(k); a=v.sea; a4=squeeze(a(isea,:,:)); a4=get_zonala(a4);
v=Z.w1c.atm.za(k); a=v.sea; a5=squeeze(a(isea,:,:)); a5=get_zonala(a5);
v=Z.w1d.atm.za(k); a=v.sea; a6=squeeze(a(isea,:,:)); a6=get_zonala(a6);
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v2=a; p.dv2=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v3=a; p.dv3=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v5=a; p.dv5=mean(a(id).*aa);
k=5; %850hPa, 700hPa, 500hPa, 300hPa, 200hPa;
v=Z.v0.atm.za(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=Z.w1.atm.za(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=Z.w2.atm.za(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
v=Z.w1a.atm.za(k); a=v.sea; a3=squeeze(a(isea,:,:)); a3=get_zonala(a3);
v=Z.w1b.atm.za(k); a=v.sea; a4=squeeze(a(isea,:,:)); a4=get_zonala(a4);
v=Z.w1c.atm.za(k); a=v.sea; a5=squeeze(a(isea,:,:)); a5=get_zonala(a5);
v=Z.w1d.atm.za(k); a=v.sea; a6=squeeze(a(isea,:,:)); a6=get_zonala(a6);
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v6 =a; p.dv6 =mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v7 =a; p.dv7 =mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v8 =a; p.dv8 =mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v9 =a; p.dv9 =mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v10=a; p.dv10=mean(a(id).*aa);
k=1; %850hPa, 700hPa, 500hPa, 300hPa, 200hPa;
v=Z.v0.atm.za(k);  a=v.sea; a0=squeeze(a(isea,:,:)); %a0=get_zonala(a0);
v=Z.w1.atm.za(k);  a=v.sea; a1=squeeze(a(isea,:,:)); %a1=get_zonala(a1);
v=Z.w2.atm.za(k);  a=v.sea; a2=squeeze(a(isea,:,:)); %a2=get_zonala(a2);
v=Z.w1a.atm.za(k); a=v.sea; a3=squeeze(a(isea,:,:)); %a3=get_zonala(a3);
v=Z.w1b.atm.za(k); a=v.sea; a4=squeeze(a(isea,:,:)); %a4=get_zonala(a4);
v=Z.w1c.atm.za(k); a=v.sea; a5=squeeze(a(isea,:,:)); %a5=get_zonala(a5);
v=Z.w1d.atm.za(k); a=v.sea; a6=squeeze(a(isea,:,:)); %a6=get_zonala(a6);
i=isnan(a0) | isnan(a1) | isnan(a2) | isnan(a3) | isnan(a4) | isnan(a5) | isnan(a6);
a0(i)=NaN; a1(i)=NaN; a2(i)=NaN; a3(i)=NaN; a4(i)=NaN; a5(i)=NaN; a6(i)=NaN;
a0=get_zonala(a0); a1=get_zonala(a1); a2=get_zonala(a2); a3=get_zonala(a3);
a4=get_zonala(a4); a5=get_zonala(a5); a6=get_zonala(a6);
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v11=a; p.dv11=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v12=a; p.dv12=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v13=a; p.dv13=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v14=a; p.dv14=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v15=a; p.dv15=mean(a(id).*aa);
c=86400/LV0; %plotting PME in mm/day/K
v=Z.v0.sfc.pcp.sea -Z.v0.sfc.evap.sea *c;  a=v; a0=squeeze(a(isea,:,:)); 
v=Z.w1.sfc.pcp.sea -Z.w1.sfc.evap.sea *c;  a=v; a1=squeeze(a(isea,:,:)); 
v=Z.w2.sfc.pcp.sea -Z.w2.sfc.evap.sea *c;  a=v; a2=squeeze(a(isea,:,:)); 
v=Z.w1a.sfc.pcp.sea-Z.w1a.sfc.evap.sea*c;  a=v; a3=squeeze(a(isea,:,:)); 
v=Z.w1b.sfc.pcp.sea-Z.w1b.sfc.evap.sea*c;  a=v; a4=squeeze(a(isea,:,:)); 
v=Z.w1c.sfc.pcp.sea-Z.w1c.sfc.evap.sea*c;  a=v; a5=squeeze(a(isea,:,:)); 
v=Z.w1d.sfc.pcp.sea-Z.w1d.sfc.evap.sea*c;  a=v; a6=squeeze(a(isea,:,:)); 
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v16=a; p.dv16=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v17=a; p.dv17=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v18=a; p.dv18=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v19=a; p.dv19=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v20=a; p.dv20=mean(a(id).*aa);

p.fmt='eps'; plot_extreme_extended(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigSE3b comparing SPEAR pattern A, B, C, D with M for atmospheric circulation changes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'}; isea=3; %1-7=ANN,MAM,JJA,SON,DJF,NDJFM,MJJA
a1='OP minus SP-M'; a2='SP-A minus SP-M'; a3='SP-B minus SP-M '; a4='SP-C minus SP-M'; a5='SP-D minus SP-M'; p.flipcmap=0;
p.vname='atm_500_200_850_pme_A_B_C_D'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea}; 
p.dT=[Z.w1.dT Z.w2.dT Z.w1A.dT Z.w1B.dT Z.w1C.dT Z.w1D.dT]; p.dT(1)=1.22; p.dT(2)=1.24;
del=' $\Delta$'; s1='Z500'';'; s2='Z200''; '; s3='Z850''; '; s4='PME; ';
p.s1 =strcat(a1,del,s1); p.s2 =strcat(a2,del,s1); p.s3 =strcat(a3,del,s1); p.s4 =strcat(a4,del,s1); p.s5 =strcat(a5,del,s1);
p.s6 =strcat(a1,del,s2); p.s7 =strcat(a2,del,s2); p.s8 =strcat(a3,del,s2); p.s9 =strcat(a4,del,s2); p.s10=strcat(a5,del,s2);
p.s11=strcat(a1,del,s3); p.s12=strcat(a2,del,s3); p.s13=strcat(a3,del,s3); p.s14=strcat(a4,del,s3); p.s15=strcat(a5,del,s3);
p.s16=strcat(a1,del,s4); p.s17=strcat(a2,del,s4); p.s18=strcat(a3,del,s4); p.s19=strcat(a4,del,s4); p.s20=strcat(a5,del,s4);
p.unit0 ='GPM';                p.unit0_bar =p.unit0;
p.unit1 ='GPM K^{-1}';         p.unit1_bar =p.unit1;
p.unit3 ='GPM';                p.unit3_bar =p.unit3;
p.unit4 ='GPM K^{-1}';         p.unit4_bar =p.unit4;
p.unit6 ='GPM';                p.unit6_bar =p.unit6;
p.unit7 ='GPM K^{-1}';         p.unit7_bar =p.unit7;
p.unit9 ='mm day^{-1}';        p.unit9_bar =p.unit9;
p.unit10='mm day^{-1} K^{-1}'; p.unit10_bar=p.unit10;
p.cmin1 =-15;  p.cmax1=15.;
p.cmin2 =-20;  p.cmax2=20;
p.cmin3 =-10;  p.cmax3=10;
p.cmin4= -2;   p.cmax4=2;

p.showus=false; p.showavg=false; p.do_bias=0; p.co='k'; p.xy=[100 360 -10 90];
v=Z.v0.s;  aa=v.aa; imk=Z.v0.sfc.ice.tavg0;  aa0=aa; 
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lm; p.aa=v.aa; p.aa0=aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<0.5)=0; id(id>=0.5)=1; p.id_lm=(id==1);
lat1= -10; lat2=90; lon1=100; lon2=360; p.xy=[100 360  -10 90];
%lat1=-90; lat2=90; lon1=0;   lon2=360; p.xy=[0   360 -90 90];
p.xy=[lon1 lon2 lat1 lat2];
p.ys=min(find(s.lat(:)>=lat1)); p.ye=max(find(s.lat(:)<=lat2));
p.xs=min(find(s.lon(:)>=lon1)); p.xe=max(find(s.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=a; %id=id.*a; 
id=(id==1); aa=aa0(id); aa=aa/mean(aa); nlon=length(p.lon); p.id=id; %figure; pcolor(id); shading flat; colorbar;

k=3; %850hPa, 700hPa, 500hPa, 300hPa, 200hPa;
v=Z.v0.atm.za(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=Z.w1.atm.za(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=Z.w2.atm.za(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
v=Z.w1A.atm.za(k); a=v.sea; a3=squeeze(a(isea,:,:)); a3=get_zonala(a3);
v=Z.w1B.atm.za(k); a=v.sea; a4=squeeze(a(isea,:,:)); a4=get_zonala(a4);
v=Z.w1C.atm.za(k); a=v.sea; a5=squeeze(a(isea,:,:)); a5=get_zonala(a5);
v=Z.w1D.atm.za(k); a=v.sea; a6=squeeze(a(isea,:,:)); a6=get_zonala(a6);
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v2=a; p.dv2=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v3=a; p.dv3=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v5=a; p.dv5=mean(a(id).*aa);
k=5; %850hPa, 700hPa, 500hPa, 300hPa, 200hPa;
v=Z.v0.atm.za(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=Z.w1.atm.za(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=Z.w2.atm.za(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
v=Z.w1A.atm.za(k); a=v.sea; a3=squeeze(a(isea,:,:)); a3=get_zonala(a3);
v=Z.w1B.atm.za(k); a=v.sea; a4=squeeze(a(isea,:,:)); a4=get_zonala(a4);
v=Z.w1C.atm.za(k); a=v.sea; a5=squeeze(a(isea,:,:)); a5=get_zonala(a5);
v=Z.w1D.atm.za(k); a=v.sea; a6=squeeze(a(isea,:,:)); a6=get_zonala(a6);
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v6 =a; p.dv6 =mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v7 =a; p.dv7 =mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v8 =a; p.dv8 =mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v9 =a; p.dv9 =mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v10=a; p.dv10=mean(a(id).*aa);
k=1; %850hPa, 700hPa, 500hPa, 300hPa, 200hPa;
v=Z.v0.atm.za(k);  a=v.sea; a0=squeeze(a(isea,:,:)); %a0=get_zonala(a0);
v=Z.w1.atm.za(k);  a=v.sea; a1=squeeze(a(isea,:,:)); %a1=get_zonala(a1);
v=Z.w2.atm.za(k);  a=v.sea; a2=squeeze(a(isea,:,:)); %a2=get_zonala(a2);
v=Z.w1A.atm.za(k); a=v.sea; a3=squeeze(a(isea,:,:)); %a3=get_zonala(a3);
v=Z.w1B.atm.za(k); a=v.sea; a4=squeeze(a(isea,:,:)); %a4=get_zonala(a4);
v=Z.w1C.atm.za(k); a=v.sea; a5=squeeze(a(isea,:,:)); %a5=get_zonala(a5);
v=Z.w1D.atm.za(k); a=v.sea; a6=squeeze(a(isea,:,:)); %a6=get_zonala(a6);
i=isnan(a0) | isnan(a1) | isnan(a2) | isnan(a3) | isnan(a4) | isnan(a5) | isnan(a6);
a0(i)=NaN; a1(i)=NaN; a2(i)=NaN; a3(i)=NaN; a4(i)=NaN; a5(i)=NaN; a6(i)=NaN;
a0=get_zonala(a0); a1=get_zonala(a1); a2=get_zonala(a2); a3=get_zonala(a3);
a4=get_zonala(a4); a5=get_zonala(a5); a6=get_zonala(a6);
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v11=a; p.dv11=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v12=a; p.dv12=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v13=a; p.dv13=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v14=a; p.dv14=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v15=a; p.dv15=mean(a(id).*aa);
c=86400/LV0; %plotting PME in mm/day/K
v=Z.v0.sfc.pcp.sea -Z.v0.sfc.evap.sea *c;  a=v; a0=squeeze(a(isea,:,:)); 
v=Z.w1.sfc.pcp.sea -Z.w1.sfc.evap.sea *c;  a=v; a1=squeeze(a(isea,:,:)); 
v=Z.w2.sfc.pcp.sea -Z.w2.sfc.evap.sea *c;  a=v; a2=squeeze(a(isea,:,:)); 
v=Z.w1A.sfc.pcp.sea-Z.w1A.sfc.evap.sea*c;  a=v; a3=squeeze(a(isea,:,:)); 
v=Z.w1B.sfc.pcp.sea-Z.w1B.sfc.evap.sea*c;  a=v; a4=squeeze(a(isea,:,:)); 
v=Z.w1C.sfc.pcp.sea-Z.w1C.sfc.evap.sea*c;  a=v; a5=squeeze(a(isea,:,:)); 
v=Z.w1D.sfc.pcp.sea-Z.w1D.sfc.evap.sea*c;  a=v; a6=squeeze(a(isea,:,:)); 
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v16=a; p.dv16=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v17=a; p.dv17=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v18=a; p.dv18=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v19=a; p.dv19=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v20=a; p.dv20=mean(a(id).*aa);

p.fmt='eps'; plot_extreme_extended(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigSE3c comparing SPEAR pattern m3, m16, m17, m26 with M for atmospheric circulation changes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'}; isea=3; %1-7=ANN,MAM,JJA,SON,DJF,NDJFM,MJJA
a1='OP minus SPM'; a2='SP-m3 minus SP-M'; a3='SP-m16 minus SP-M '; a4='SP-m17 minus SP-M'; a5='SP-m26 minus SP-M'; p.flipcmap=0;
p.vname='atm_500_200_850_pme_m3_m16_m17_m26'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea}; 
p.dT=[Z.w1.dT Z.w2.dT Z.w1F.dT Z.w1G.dT Z.w1H.dT Z.w1I.dT]; p.dT(1)=1.22; p.dT(2)=1.24;
del=' $\Delta$'; s1='Z500'';'; s2='Z200''; '; s3='Z850''; '; s4='PME; ';
p.s1 =strcat(a1,del,s1); p.s2 =strcat(a2,del,s1); p.s3 =strcat(a3,del,s1); p.s4 =strcat(a4,del,s1); p.s5 =strcat(a5,del,s1);
p.s6 =strcat(a1,del,s2); p.s7 =strcat(a2,del,s2); p.s8 =strcat(a3,del,s2); p.s9 =strcat(a4,del,s2); p.s10=strcat(a5,del,s2);
p.s11=strcat(a1,del,s3); p.s12=strcat(a2,del,s3); p.s13=strcat(a3,del,s3); p.s14=strcat(a4,del,s3); p.s15=strcat(a5,del,s3);
p.s16=strcat(a1,del,s4); p.s17=strcat(a2,del,s4); p.s18=strcat(a3,del,s4); p.s19=strcat(a4,del,s4); p.s20=strcat(a5,del,s4);
p.unit0 ='GPM';                p.unit0_bar =p.unit0;
p.unit1 ='GPM K^{-1}';         p.unit1_bar =p.unit1;
p.unit3 ='GPM';                p.unit3_bar =p.unit3;
p.unit4 ='GPM K^{-1}';         p.unit4_bar =p.unit4;
p.unit6 ='GPM';                p.unit6_bar =p.unit6;
p.unit7 ='GPM K^{-1}';         p.unit7_bar =p.unit7;
p.unit9 ='mm day^{-1}';        p.unit9_bar =p.unit9;
p.unit10='mm day^{-1} K^{-1}'; p.unit10_bar=p.unit10;
p.cmin1 =-15;  p.cmax1=15.;
p.cmin2 =-20;  p.cmax2=20;
p.cmin3 =-10;  p.cmax3=10;
p.cmin4= -2;   p.cmax4=2;

p.showus=false; p.showavg=false; p.do_bias=0; p.co='k'; p.xy=[100 360 -10 90];
v=Z.v0.s;  aa=v.aa; imk=Z.v0.sfc.ice.tavg0;  aa0=aa; 
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lm; p.aa=v.aa; p.aa0=aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<0.5)=0; id(id>=0.5)=1; p.id_lm=(id==1);
lat1= -10; lat2=90; lon1=100; lon2=360; p.xy=[100 360  -10 90];
%lat1=-90; lat2=90; lon1=0;   lon2=360; p.xy=[0   360 -90 90];
p.xy=[lon1 lon2 lat1 lat2];
p.ys=min(find(s.lat(:)>=lat1)); p.ye=max(find(s.lat(:)<=lat2));
p.xs=min(find(s.lon(:)>=lon1)); p.xe=max(find(s.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=a; %id=id.*a; 
id=(id==1); aa=aa0(id); aa=aa/mean(aa); nlon=length(p.lon); p.id=id; %figure; pcolor(id); shading flat; colorbar;

k=3; %850hPa, 700hPa, 500hPa, 300hPa, 200hPa;
v=Z.v0.atm.za(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=Z.w1.atm.za(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=Z.w2.atm.za(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
v=Z.w1F.atm.za(k); a=v.sea; a3=squeeze(a(isea,:,:)); a3=get_zonala(a3);
v=Z.w1G.atm.za(k); a=v.sea; a4=squeeze(a(isea,:,:)); a4=get_zonala(a4);
v=Z.w1H.atm.za(k); a=v.sea; a5=squeeze(a(isea,:,:)); a5=get_zonala(a5);
v=Z.w1I.atm.za(k); a=v.sea; a6=squeeze(a(isea,:,:)); a6=get_zonala(a6);
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v2=a; p.dv2=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v3=a; p.dv3=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v5=a; p.dv5=mean(a(id).*aa);
k=5; %850hPa, 700hPa, 500hPa, 300hPa, 200hPa;
v=Z.v0.atm.za(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=Z.w1.atm.za(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=Z.w2.atm.za(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
v=Z.w1F.atm.za(k); a=v.sea; a3=squeeze(a(isea,:,:)); a3=get_zonala(a3);
v=Z.w1G.atm.za(k); a=v.sea; a4=squeeze(a(isea,:,:)); a4=get_zonala(a4);
v=Z.w1H.atm.za(k); a=v.sea; a5=squeeze(a(isea,:,:)); a5=get_zonala(a5);
v=Z.w1I.atm.za(k); a=v.sea; a6=squeeze(a(isea,:,:)); a6=get_zonala(a6);
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v6 =a; p.dv6 =mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v7 =a; p.dv7 =mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v8 =a; p.dv8 =mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v9 =a; p.dv9 =mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v10=a; p.dv10=mean(a(id).*aa);
k=1; %850hPa, 700hPa, 500hPa, 300hPa, 200hPa;
v=Z.v0.atm.za(k);  a=v.sea; a0=squeeze(a(isea,:,:)); %a0=get_zonala(a0);
v=Z.w1.atm.za(k);  a=v.sea; a1=squeeze(a(isea,:,:)); %a1=get_zonala(a1);
v=Z.w2.atm.za(k);  a=v.sea; a2=squeeze(a(isea,:,:)); %a2=get_zonala(a2);
v=Z.w1F.atm.za(k); a=v.sea; a3=squeeze(a(isea,:,:)); %a3=get_zonala(a3);
v=Z.w1G.atm.za(k); a=v.sea; a4=squeeze(a(isea,:,:)); %a4=get_zonala(a4);
v=Z.w1H.atm.za(k); a=v.sea; a5=squeeze(a(isea,:,:)); %a5=get_zonala(a5);
v=Z.w1I.atm.za(k); a=v.sea; a6=squeeze(a(isea,:,:)); %a6=get_zonala(a6);
i=isnan(a0) | isnan(a1) | isnan(a2) | isnan(a3) | isnan(a4) | isnan(a5) | isnan(a6);
a0(i)=NaN; a1(i)=NaN; a2(i)=NaN; a3(i)=NaN; a4(i)=NaN; a5(i)=NaN; a6(i)=NaN;
a0=get_zonala(a0); a1=get_zonala(a1); a2=get_zonala(a2); a3=get_zonala(a3);
a4=get_zonala(a4); a5=get_zonala(a5); a6=get_zonala(a6);
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v11=a; p.dv11=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v12=a; p.dv12=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v13=a; p.dv13=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v14=a; p.dv14=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v15=a; p.dv15=mean(a(id).*aa);
c=86400/LV0; %plotting PME in mm/day/K
v=Z.v0.sfc.pcp.sea -Z.v0.sfc.evap.sea *c;  a=v; a0=squeeze(a(isea,:,:)); 
v=Z.w1.sfc.pcp.sea -Z.w1.sfc.evap.sea *c;  a=v; a1=squeeze(a(isea,:,:)); 
v=Z.w2.sfc.pcp.sea -Z.w2.sfc.evap.sea *c;  a=v; a2=squeeze(a(isea,:,:)); 
v=Z.w1F.sfc.pcp.sea-Z.w1F.sfc.evap.sea*c;  a=v; a3=squeeze(a(isea,:,:)); 
v=Z.w1G.sfc.pcp.sea-Z.w1G.sfc.evap.sea*c;  a=v; a4=squeeze(a(isea,:,:)); 
v=Z.w1H.sfc.pcp.sea-Z.w1H.sfc.evap.sea*c;  a=v; a5=squeeze(a(isea,:,:)); 
v=Z.w1I.sfc.pcp.sea-Z.w1I.sfc.evap.sea*c;  a=v; a6=squeeze(a(isea,:,:)); 
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v16=a; p.dv16=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v17=a; p.dv17=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v18=a; p.dv18=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v19=a; p.dv19=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v20=a; p.dv20=mean(a(id).*aa);

p.fmt='eps'; plot_extreme_extended(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Below is for extremes loading and plotting%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load results and plot figures for studing pattern effects
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/'; opt=0; diag=0; f='_2_101_opt0_diag0_read_daily_namerica.mat';
e='c192L33_am4p0_2010climo_newctl';                                          n=strcat(tpath,e,'/',e,f); load(n);z.v0=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear';                           n=strcat(tpath,e,'/',e,f); load(n);z.w1=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_times_2';                         n=strcat(tpath,e,'/',e,f); load(n);z.w2=v;

e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs';          n=strcat(tpath,e,'/',e,f); load(n);z.w1a=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_20ns_obs';          n=strcat(tpath,e,'/',e,f); load(n);z.w1b=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_30ns_obs';          n=strcat(tpath,e,'/',e,f); load(n);z.w1c=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_tropical_30ns_obs';         n=strcat(tpath,e,'/',e,f); load(n);z.w1d=v;

e='c192L33_am4p0_2010climo_trend_1979_2020_spear_tropical_20ns_obs';         n=strcat(tpath,e,'/',e,f); load(n);z.w1e=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_10n_70n_obs'; n=strcat(tpath,e,'/',e,f); load(n);z.w1f=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_25n_70n_obs'; n=strcat(tpath,e,'/',e,f); load(n);z.w1g=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_south_pacific_10s_45s_obs'; n=strcat(tpath,e,'/',e,f); load(n);z.w1h=v;

e='c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs';             n=strcat(tpath,e,'/',e,f); load(n);z.w1i=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_atlantic_mdr_obs';          n=strcat(tpath,e,'/',e,f); load(n);z.w1j=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_so_45_75s_obs';             n=strcat(tpath,e,'/',e,f); load(n);z.w1k=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_zonal';                     n=strcat(tpath,e,'/',e,f); load(n);z.w1l=v;

e='c192L33_am4p0_2010climo_trend_1979_2020_spear_best_wegradient';           n=strcat(tpath,e,'/',e,f); load(n);z.w1A=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_2best_wegradient';          n=strcat(tpath,e,'/',e,f); load(n);z.w1B=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_2worst_wegradient';         n=strcat(tpath,e,'/',e,f); load(n);z.w1C=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_worst_wegradient';          n=strcat(tpath,e,'/',e,f); load(n);z.w1D=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_middle_wegradient';         n=strcat(tpath,e,'/',e,f); load(n);z.w1E=v;

e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m3';                n=strcat(tpath,e,'/',e,f); load(n);z.w1F=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m16';               n=strcat(tpath,e,'/',e,f); load(n);z.w1G=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m17';               n=strcat(tpath,e,'/',e,f); load(n);z.w1H=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m26';               n=strcat(tpath,e,'/',e,f); load(n);z.w1I=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig SE1a: comparing SPEAR pattern a, b, c, d with M for percentile changes in TAS, VPD, TWB, and RH at 2m%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea;
ipct=9;  iipct=3; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %95th 5th
%ipct=10; iipct=2; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %99th 1th
a1='OP minus SP-M'; a2='SPM-P10obs minus SP-M'; a3='SPM-P20obs minus SP-M '; a4='SPM-P30obs minus SP-M'; a5='SPM-T30obs minus SP-M'; p.flipcmap=0;
p.vname='tas_vpd_twb_rh_ext_a_b_c_d'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
p.dT=[Z.w1.dT Z.w2.dT Z.w1a.dT Z.w1b.dT Z.w1c.dT Z.w1d.dT]; p.dT(1)=1.22; p.dT(2)=1.24;
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

v=z.v0; p.showus=true; p.showavg=true; 
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
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%tasday
v=z.v0.tasday;  a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.tasday;  a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.tasday;  a2=squeeze(v.pct(m,ipct,:,:));
v=z.w1a.tasday; a3=squeeze(v.pct(m,ipct,:,:));
v=z.w1b.tasday; a4=squeeze(v.pct(m,ipct,:,:));
v=z.w1c.tasday; a5=squeeze(v.pct(m,ipct,:,:));
v=z.w1d.tasday; a6=squeeze(v.pct(m,ipct,:,:));
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa);
a=(a2-a0)/p.dT(2)-tmp; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v2=a; p.dv2=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v3=a; p.dv3=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v5=a; p.dv5=mean(a(id).*aa);
%vpdday
v=z.v0.vpdday;  a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.vpdday;  a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.vpdday;  a2=squeeze(v.pct(m,ipct,:,:));
v=z.w1a.vpdday; a3=squeeze(v.pct(m,ipct,:,:));
v=z.w1b.vpdday; a4=squeeze(v.pct(m,ipct,:,:));
v=z.w1c.vpdday; a5=squeeze(v.pct(m,ipct,:,:));
v=z.w1d.vpdday; a6=squeeze(v.pct(m,ipct,:,:));
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa);
a=(a2-a0)/p.dT(2)-tmp; p.v6 =a; p.dv6 =mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v7 =a; p.dv7 =mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v8 =a; p.dv8 =mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v9 =a; p.dv9 =mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v10=a; p.dv10=mean(a(id).*aa);
%twbday
v=z.v0.twbday;  a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.twbday;  a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.twbday;  a2=squeeze(v.pct(m,ipct,:,:));
v=z.w1a.twbday; a3=squeeze(v.pct(m,ipct,:,:));
v=z.w1b.twbday; a4=squeeze(v.pct(m,ipct,:,:));
v=z.w1c.twbday; a5=squeeze(v.pct(m,ipct,:,:));
v=z.w1d.twbday; a6=squeeze(v.pct(m,ipct,:,:));
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); 
a=(a2-a0)/p.dT(2)-tmp; p.v11=a; p.dv11=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v12=a; p.dv12=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v13=a; p.dv13=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v14=a; p.dv14=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v15=a; p.dv15=mean(a(id).*aa);
%RHday
v=z.v0.rhday;  a0=squeeze(v.pct(m,iipct,:,:));
v=z.w1.rhday;  a1=squeeze(v.pct(m,iipct,:,:));
v=z.w2.rhday;  a2=squeeze(v.pct(m,iipct,:,:));
v=z.w1a.rhday; a3=squeeze(v.pct(m,iipct,:,:));
v=z.w1b.rhday; a4=squeeze(v.pct(m,iipct,:,:));
v=z.w1c.rhday; a5=squeeze(v.pct(m,iipct,:,:));
v=z.w1d.rhday; a6=squeeze(v.pct(m,iipct,:,:));
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); 
a=(a2-a0)/p.dT(2)-tmp; p.v16=a; p.dv16=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v17=a; p.dv17=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v18=a; p.dv18=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v19=a; p.dv19=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v20=a; p.dv20=mean(a(id).*aa);

p.fmt='eps'; plot_extreme_extended(p); %plot_pattern_effect_Fig_extremes(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig SE1b: comparing SPEAR pattern A, B, C, D with M for percentile changes in TAS, VPD, TWB, and RH at 2m%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea;
ipct=9;  iipct=3; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %95th 5th
%ipct=10; iipct=2; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %99th 1th
a1='OP minus SP-M'; a2='SP-A minus SP-M'; a3='SP-B minus SP-M '; a4='SP-C minus SP-M'; a5='SP-D minus SP-M'; p.flipcmap=0;
p.vname='tas_vpd_twb_rh_ext_A_B_D_E'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
p.dT=[Z.w1.dT Z.w2.dT Z.w1A.dT Z.w1B.dT Z.w1C.dT Z.w1D.dT]; p.dT(1)=1.22; p.dT(2)=1.24;
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

v=z.v0; p.showus=true; p.showavg=true; 
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
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%tasday
v=z.v0.tasday;  a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.tasday;  a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.tasday;  a2=squeeze(v.pct(m,ipct,:,:));
v=z.w1A.tasday; a3=squeeze(v.pct(m,ipct,:,:));
v=z.w1B.tasday; a4=squeeze(v.pct(m,ipct,:,:));
v=z.w1C.tasday; a5=squeeze(v.pct(m,ipct,:,:));
v=z.w1D.tasday; a6=squeeze(v.pct(m,ipct,:,:));
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v2=a; p.dv2=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v3=a; p.dv3=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v5=a; p.dv5=mean(a(id).*aa);
%vpdday
v=z.v0.vpdday;  a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.vpdday;  a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.vpdday;  a2=squeeze(v.pct(m,ipct,:,:));
v=z.w1A.vpdday; a3=squeeze(v.pct(m,ipct,:,:));
v=z.w1B.vpdday; a4=squeeze(v.pct(m,ipct,:,:));
v=z.w1C.vpdday; a5=squeeze(v.pct(m,ipct,:,:));
v=z.w1D.vpdday; a6=squeeze(v.pct(m,ipct,:,:));
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v6 =a; p.dv6 =mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v7 =a; p.dv7 =mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v8 =a; p.dv8 =mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v9 =a; p.dv9 =mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v10=a; p.dv10=mean(a(id).*aa);
%twbday
v=z.v0.twbday;  a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.twbday;  a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.twbday;  a2=squeeze(v.pct(m,ipct,:,:));
v=z.w1A.twbday; a3=squeeze(v.pct(m,ipct,:,:));
v=z.w1B.twbday; a4=squeeze(v.pct(m,ipct,:,:));
v=z.w1C.twbday; a5=squeeze(v.pct(m,ipct,:,:));
v=z.w1D.twbday; a6=squeeze(v.pct(m,ipct,:,:));
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v11=a; p.dv11=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v12=a; p.dv12=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v13=a; p.dv13=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v14=a; p.dv14=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v15=a; p.dv15=mean(a(id).*aa);
%RHday
v=z.v0.rhday;  a0=squeeze(v.pct(m,iipct,:,:));
v=z.w1.rhday;  a1=squeeze(v.pct(m,iipct,:,:));
v=z.w2.rhday;  a2=squeeze(v.pct(m,iipct,:,:));
v=z.w1A.rhday; a3=squeeze(v.pct(m,iipct,:,:));
v=z.w1B.rhday; a4=squeeze(v.pct(m,iipct,:,:));
v=z.w1C.rhday; a5=squeeze(v.pct(m,iipct,:,:));
v=z.w1D.rhday; a6=squeeze(v.pct(m,iipct,:,:));
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v16=a; p.dv16=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v17=a; p.dv17=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v18=a; p.dv18=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v19=a; p.dv19=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v20=a; p.dv20=mean(a(id).*aa);

p.fmt='eps'; plot_extreme_extended(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig SE1c: comparing SPEAR pattern m3, m16, m17, m26 with M for percentile changes in TAS, VPD, TWB, and RH at 2m%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea;
ipct=9;  iipct=3; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %95th 5th
%ipct=10; iipct=2; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %99th 1th
a1='OP minus SPM'; a2='SP-m3 minus SP-M'; a3='SP-m16 minus SP-M '; a4='SP-m17 minus SP-M'; a5='SP-m26 minus SP-M'; p.flipcmap=0;
p.vname='tas_vpd_twb_rh_ext_m3_m16_m17_m26'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
p.dT=[Z.w1.dT Z.w2.dT Z.w1F.dT Z.w1G.dT Z.w1H.dT Z.w1I.dT]; p.dT(1)=1.22; p.dT(2)=1.24;
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

v=z.v0; p.showus=true; p.showavg=true; 
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
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%tasday
v=z.v0.tasday;  a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.tasday;  a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.tasday;  a2=squeeze(v.pct(m,ipct,:,:));
v=z.w1F.tasday; a3=squeeze(v.pct(m,ipct,:,:));
v=z.w1G.tasday; a4=squeeze(v.pct(m,ipct,:,:));
v=z.w1H.tasday; a5=squeeze(v.pct(m,ipct,:,:));
v=z.w1I.tasday; a6=squeeze(v.pct(m,ipct,:,:));
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v2=a; p.dv2=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v3=a; p.dv3=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v5=a; p.dv5=mean(a(id).*aa);
%vpdday
v=z.v0.vpdday;  a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.vpdday;  a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.vpdday;  a2=squeeze(v.pct(m,ipct,:,:));
v=z.w1F.vpdday; a3=squeeze(v.pct(m,ipct,:,:));
v=z.w1G.vpdday; a4=squeeze(v.pct(m,ipct,:,:));
v=z.w1H.vpdday; a5=squeeze(v.pct(m,ipct,:,:));
v=z.w1I.vpdday; a6=squeeze(v.pct(m,ipct,:,:));
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v6 =a; p.dv6 =mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v7 =a; p.dv7 =mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v8 =a; p.dv8 =mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v9 =a; p.dv9 =mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v10=a; p.dv10=mean(a(id).*aa);
%twbday
v=z.v0.twbday;  a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.twbday;  a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.twbday;  a2=squeeze(v.pct(m,ipct,:,:));
v=z.w1F.twbday; a3=squeeze(v.pct(m,ipct,:,:));
v=z.w1G.twbday; a4=squeeze(v.pct(m,ipct,:,:));
v=z.w1H.twbday; a5=squeeze(v.pct(m,ipct,:,:));
v=z.w1I.twbday; a6=squeeze(v.pct(m,ipct,:,:));
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v11=a; p.dv11=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v12=a; p.dv12=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v13=a; p.dv13=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v14=a; p.dv14=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v15=a; p.dv15=mean(a(id).*aa);
%RHday
v=z.v0.rhday;  a0=squeeze(v.pct(m,iipct,:,:));
v=z.w1.rhday;  a1=squeeze(v.pct(m,iipct,:,:));
v=z.w2.rhday;  a2=squeeze(v.pct(m,iipct,:,:));
v=z.w1F.rhday; a3=squeeze(v.pct(m,iipct,:,:));
v=z.w1G.rhday; a4=squeeze(v.pct(m,iipct,:,:));
v=z.w1H.rhday; a5=squeeze(v.pct(m,iipct,:,:));
v=z.w1I.rhday; a6=squeeze(v.pct(m,iipct,:,:));
tmp=(a1-a0)/p.dT(1); a=tmp; a=mean(a(id).*aa); %tmp=0
a=(a2-a0)/p.dT(2)-tmp; p.v16=a; p.dv16=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v17=a; p.dv17=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v18=a; p.dv18=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v19=a; p.dv19=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v20=a; p.dv20=mean(a(id).*aa);

p.fmt='eps'; plot_extreme_extended(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute hw.cltc.th from the control run%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigSE2a: comparing SPEAR pattern a, b, c, d with M for HWF, HWI, FWI, and DSR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea; ipct=9; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9];
ipct=9;  iipct=3; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %95th 5th
%ipct=10; iipct=2; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %99th 1th
a1='OP minus SPM'; a2='SP-P10obs minus SP-M'; a3='SP-P20obs minus SP-M '; a4='SP-P30obs minus SP-M'; a5='SP-T30obs minus SP-M'; p.flipcmap=0;
p.vname='hwf_hwi_fwi_dsr_ext_a_b_c_d'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
p.dT=[Z.w1.dT Z.w2.dT Z.w1a.dT Z.w1b.dT Z.w1c.dT Z.w1d.dT]; p.dT(1)=1.22; p.dT(2)=1.24;
del=' $\Delta$'; s1='HWFc'; s2='HWIc; '; s3='FWIc '; s4='DSR; ';
p.s1 =strcat(a1,del,s1); p.s2 =strcat(a2,del,s1); p.s3 =strcat(a3,del,s1); p.s4 =strcat(a4,del,s1); p.s5 =strcat(a5,del,s1);
p.s6 =strcat(a1,del,s2); p.s7 =strcat(a2,del,s2); p.s8 =strcat(a3,del,s2); p.s9 =strcat(a4,del,s2); p.s10=strcat(a5,del,s2);
p.s11=strcat(a1,del,s3); p.s12=strcat(a2,del,s3); p.s13=strcat(a3,del,s3); p.s14=strcat(a4,del,s3); p.s15=strcat(a5,del,s3);
p.s16=strcat(a1,del,s4); p.s17=strcat(a2,del,s4); p.s18=strcat(a3,del,s4); p.s19=strcat(a4,del,s4); p.s20=strcat(a5,del,s4);

%p.unit0 ='$\rm{^{\circ}C}$';    p.unit0_bar ='\rm{^{\circ}C}';
p.unit0 ='$\rm{\%}$';           p.unit0_bar ='\rm{%}';
p.unit1 ='$\rm{\%K^{-1}}$';     p.unit1_bar ='\rm{%K^{-1}}';
p.unit3 ='$\rm{K}$';            p.unit3_bar ='\rm{K}'; 
p.unit4 ='$\rm{KK^{-1}}$';      p.unit4_bar ='\rm{KK^{-1}}'; 
p.unit6 ='$\rm{}$';             p.unit6_bar ='\rm{K^{-1}}';
p.unit7 ='$\rm{K^{-1}}$';       p.unit7_bar ='\rm{K^{-1}}';
p.unit9 ='$\rm{}$';             p.unit9_bar ='\rm{}'; 
p.unit10='$\rm{K^{-1}}$';       p.unit10_bar='\rm{K^{-1}}';
p.cmin1 =-20;   p.cmax1 = 20;
p.cmin2 =-2.;   p.cmax2 = 2.;
p.cmin3 =-15.0; p.cmax3 = 15.0;
p.cmin4 =-10.;  p.cmax4 = 10.;
p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;

v=z.v0; p.showus=true; p.showavg=true; 
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 
pct_th=v.pct; spct=sprintf( '%4.2fth',pct_th(ipct));
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%HWday2_c
v=z.v0.hwday2;  a0=squeeze(v.av(m,:,:))*100;
v=z.w1.hwday2;  a1=squeeze(v.av(m,:,:))*100;
v=z.w2.hwday2;  a2=squeeze(v.av(m,:,:))*100;
v=z.w1a.hwday2; a3=squeeze(v.av(m,:,:))*100;
v=z.w1b.hwday2; a4=squeeze(v.av(m,:,:))*100;
v=z.w1c.hwday2; a5=squeeze(v.av(m,:,:))*100;
v=z.w1d.hwday2; a6=squeeze(v.av(m,:,:))*100;
tmp=(a1-a0)/p.dT(1);
a=(a2-a0)/p.dT(2)-tmp; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v2=a; p.dv2=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v3=a; p.dv3=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v5=a; p.dv5=mean(a(id).*aa);
%HWtmx_c
v=z.v0;  i=v.hwtmx2.av; f=v.hwday2.av;  a0=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w1;  i=v.hwtmx2.av; f=v.hwday2.av;  a1=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w2;  i=v.hwtmx2.av; f=v.hwday2.av;  a2=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w1a; i=v.hwtmx2.av; f=v.hwday2.av;  a3=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w1b; i=v.hwtmx2.av; f=v.hwday2.av;  a4=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w1c; i=v.hwtmx2.av; f=v.hwday2.av;  a5=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w1d; i=v.hwtmx2.av; f=v.hwday2.av;  a6=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
tmp=(a1-a0)/p.dT(1);
a=(a2-a0)/p.dT(2)-tmp; p.v6 =a; p.dv6 =mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v7 =a; p.dv7 =mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v8 =a; p.dv8 =mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v9 =a; p.dv9 =mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v10=a; p.dv10=mean(a(id).*aa);
%FWI
v=z.v0.fwiday_c.fwi;  a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday_c.fwi;  a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday_c.fwi;  a2=squeeze(v.pct(m,ipct,:,:));
v=z.w1a.fwiday_c.fwi; a3=squeeze(v.pct(m,ipct,:,:));
v=z.w1b.fwiday_c.fwi; a4=squeeze(v.pct(m,ipct,:,:));
v=z.w1c.fwiday_c.fwi; a5=squeeze(v.pct(m,ipct,:,:));
v=z.w1d.fwiday_c.fwi; a6=squeeze(v.pct(m,ipct,:,:));
tmp=(a1-a0)/p.dT(1);
a=(a2-a0)/p.dT(2)-tmp; p.v11=a; p.dv11=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v12=a; p.dv12=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v13=a; p.dv13=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v14=a; p.dv14=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v15=a; p.dv15=mean(a(id).*aa);
%DSR
v=z.v0.fwiday_c.dsr;  a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday_c.dsr;  a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday_c.dsr;  a2=squeeze(v.pct(m,ipct,:,:));
v=z.w1a.fwiday_c.dsr; a3=squeeze(v.pct(m,ipct,:,:));
v=z.w1b.fwiday_c.dsr; a4=squeeze(v.pct(m,ipct,:,:));
v=z.w1c.fwiday_c.dsr; a5=squeeze(v.pct(m,ipct,:,:));
v=z.w1d.fwiday_c.dsr; a6=squeeze(v.pct(m,ipct,:,:));
tmp=(a1-a0)/p.dT(1);
a=(a2-a0)/p.dT(2)-tmp; p.v16=a; p.dv16=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v17=a; p.dv17=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v18=a; p.dv18=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v19=a; p.dv19=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v20=a; p.dv20=mean(a(id).*aa);

p.fmt='eps'; plot_extreme_extended(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigSE2b: comparing SPEAR pattern A, B, C, D with M for HWF, HWI, FWI, and DSR 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea; ipct=9; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9];
ipct=9;  iipct=3; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %95th 5th
%ipct=10; iipct=2; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %99th 1th
a1='OP minus SPM'; a2='SP-A minus SP-M'; a3='SP-B minus SP-M '; a4='SP-C minus SP-M'; a5='SP-D minus SP-M'; p.flipcmap=0;
p.vname='hwf_hwi_fwi_dsr_ext_A_B_C_D'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
p.dT=[Z.w1.dT Z.w2.dT Z.w1A.dT Z.w1B.dT Z.w1C.dT Z.w1D.dT]; p.dT(1)=1.22; p.dT(2)=1.24;
del=' $\Delta$'; s1='HWFc'; s2='HWIc; '; s3='FWIc '; s4='DSR; ';
p.s1 =strcat(a1,del,s1); p.s2 =strcat(a2,del,s1); p.s3 =strcat(a3,del,s1); p.s4 =strcat(a4,del,s1); p.s5 =strcat(a5,del,s1);
p.s6 =strcat(a1,del,s2); p.s7 =strcat(a2,del,s2); p.s8 =strcat(a3,del,s2); p.s9 =strcat(a4,del,s2); p.s10=strcat(a5,del,s2);
p.s11=strcat(a1,del,s3); p.s12=strcat(a2,del,s3); p.s13=strcat(a3,del,s3); p.s14=strcat(a4,del,s3); p.s15=strcat(a5,del,s3);
p.s16=strcat(a1,del,s4); p.s17=strcat(a2,del,s4); p.s18=strcat(a3,del,s4); p.s19=strcat(a4,del,s4); p.s20=strcat(a5,del,s4);

p.unit0 ='$\rm{\%}$';           p.unit0_bar ='\rm{%}';
p.unit1 ='$\rm{\%K^{-1}}$';     p.unit1_bar ='\rm{%K^{-1}}';
p.unit3 ='$\rm{K}$';            p.unit3_bar ='\rm{K}'; 
p.unit4 ='$\rm{KK^{-1}}$';      p.unit4_bar ='\rm{KK^{-1}}'; 
p.unit6 ='$\rm{}$';             p.unit6_bar ='\rm{K^{-1}}';
p.unit7 ='$\rm{K^{-1}}$';       p.unit7_bar ='\rm{K^{-1}}';
p.unit9 ='$\rm{}$';             p.unit9_bar ='\rm{}'; 
p.unit10='$\rm{K^{-1}}$';       p.unit10_bar='\rm{K^{-1}}';
p.cmin1 =-20;   p.cmax1 = 20;
p.cmin2 =-2.;   p.cmax2 = 2.;
p.cmin3 =-15.0; p.cmax3 = 15.0;
p.cmin4 =-10.;  p.cmax4 = 10.;
p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;

v=z.v0; p.showus=true; p.showavg=true; 
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 
pct_th=v.pct; spct=sprintf( '%4.2fth',pct_th(ipct));
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%HWday2_c
v=z.v0.hwday2;  a0=squeeze(v.av(m,:,:))*100;
v=z.w1.hwday2;  a1=squeeze(v.av(m,:,:))*100;
v=z.w2.hwday2;  a2=squeeze(v.av(m,:,:))*100;
v=z.w1A.hwday2; a3=squeeze(v.av(m,:,:))*100;
v=z.w1B.hwday2; a4=squeeze(v.av(m,:,:))*100;
v=z.w1C.hwday2; a5=squeeze(v.av(m,:,:))*100;
v=z.w1D.hwday2; a6=squeeze(v.av(m,:,:))*100;
tmp=(a1-a0)/p.dT(1);
a=(a2-a0)/p.dT(2)-tmp; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v2=a; p.dv2=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v3=a; p.dv3=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v5=a; p.dv5=mean(a(id).*aa);
%HWtmx_c
v=z.v0;  i=v.hwtmx2.av; f=v.hwday2.av;  a0=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w1;  i=v.hwtmx2.av; f=v.hwday2.av;  a1=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w2;  i=v.hwtmx2.av; f=v.hwday2.av;  a2=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w1A; i=v.hwtmx2.av; f=v.hwday2.av;  a3=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w1B; i=v.hwtmx2.av; f=v.hwday2.av;  a4=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w1C; i=v.hwtmx2.av; f=v.hwday2.av;  a5=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w1D; i=v.hwtmx2.av; f=v.hwday2.av;  a6=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
tmp=(a1-a0)/p.dT(1);
a=(a2-a0)/p.dT(2)-tmp; p.v6 =a; p.dv6 =mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v7 =a; p.dv7 =mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v8 =a; p.dv8 =mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v9 =a; p.dv9 =mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v10=a; p.dv10=mean(a(id).*aa);
%FWI
v=z.v0.fwiday_c.fwi;  a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday_c.fwi;  a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday_c.fwi;  a2=squeeze(v.pct(m,ipct,:,:));
v=z.w1A.fwiday_c.fwi; a3=squeeze(v.pct(m,ipct,:,:));
v=z.w1B.fwiday_c.fwi; a4=squeeze(v.pct(m,ipct,:,:));
v=z.w1C.fwiday_c.fwi; a5=squeeze(v.pct(m,ipct,:,:));
v=z.w1D.fwiday_c.fwi; a6=squeeze(v.pct(m,ipct,:,:));
tmp=(a1-a0)/p.dT(1);
a=(a2-a0)/p.dT(2)-tmp; p.v11=a; p.dv11=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v12=a; p.dv12=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v13=a; p.dv13=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v14=a; p.dv14=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v15=a; p.dv15=mean(a(id).*aa);
%DSR
v=z.v0.fwiday_c.dsr;  a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday_c.dsr;  a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday_c.dsr;  a2=squeeze(v.pct(m,ipct,:,:));
v=z.w1A.fwiday_c.dsr; a3=squeeze(v.pct(m,ipct,:,:));
v=z.w1B.fwiday_c.dsr; a4=squeeze(v.pct(m,ipct,:,:));
v=z.w1C.fwiday_c.dsr; a5=squeeze(v.pct(m,ipct,:,:));
v=z.w1D.fwiday_c.dsr; a6=squeeze(v.pct(m,ipct,:,:));
tmp=(a1-a0)/p.dT(1);
a=(a2-a0)/p.dT(2)-tmp; p.v16=a; p.dv16=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v17=a; p.dv17=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v18=a; p.dv18=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v19=a; p.dv19=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v20=a; p.dv20=mean(a(id).*aa);

p.fmt='eps'; plot_extreme_extended(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigSE2c: comparing SPEAR pattern m3, m16, m17, m26 with M for HWF, HWI, FWI, and DSR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea; ipct=9; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9];
ipct=9;  iipct=3; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %95th 5th
%ipct=10; iipct=2; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %99th 1th
a1='OP minus SPM'; a2='SP-m3 minus SP-M'; a3='SP-m16 minus SP-M '; a4='SP-m17 minus SP-M'; a5='SP-m26 minus SP-M'; p.flipcmap=0;
p.vname='hwf_hwi_fwi_dsr_ext_m3_m16_m17_m26'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
p.dT=[Z.w1.dT Z.w2.dT Z.w1F.dT Z.w1G.dT Z.w1H.dT Z.w1I.dT]; p.dT(1)=1.22; p.dT(2)=1.24;
del=' $\Delta$'; s1='HWFc'; s2='HWIc; '; s3='FWIc '; s4='DSR; ';
p.s1 =strcat(a1,del,s1); p.s2 =strcat(a2,del,s1); p.s3 =strcat(a3,del,s1); p.s4 =strcat(a4,del,s1); p.s5 =strcat(a5,del,s1);
p.s6 =strcat(a1,del,s2); p.s7 =strcat(a2,del,s2); p.s8 =strcat(a3,del,s2); p.s9 =strcat(a4,del,s2); p.s10=strcat(a5,del,s2);
p.s11=strcat(a1,del,s3); p.s12=strcat(a2,del,s3); p.s13=strcat(a3,del,s3); p.s14=strcat(a4,del,s3); p.s15=strcat(a5,del,s3);
p.s16=strcat(a1,del,s4); p.s17=strcat(a2,del,s4); p.s18=strcat(a3,del,s4); p.s19=strcat(a4,del,s4); p.s20=strcat(a5,del,s4);

p.unit0 ='$\rm{\%}$';           p.unit0_bar ='\rm{%}';
p.unit1 ='$\rm{\%K^{-1}}$';     p.unit1_bar ='\rm{%K^{-1}}';
p.unit3 ='$\rm{K}$';            p.unit3_bar ='\rm{K}'; 
p.unit4 ='$\rm{KK^{-1}}$';      p.unit4_bar ='\rm{KK^{-1}}'; 
p.unit6 ='$\rm{}$';             p.unit6_bar ='\rm{K^{-1}}';
p.unit7 ='$\rm{K^{-1}}$';       p.unit7_bar ='\rm{K^{-1}}';
p.unit9 ='$\rm{}$';             p.unit9_bar ='\rm{}'; 
p.unit10='$\rm{K^{-1}}$';       p.unit10_bar='\rm{K^{-1}}';
p.cmin1 =-20;   p.cmax1 = 20;
p.cmin2 =-2.;   p.cmax2 = 2.;
p.cmin3 =-15.0; p.cmax3 = 15.0;
p.cmin4 =-10.;  p.cmax4 = 10.;
p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=0;

v=z.v0; p.showus=true; p.showavg=true; 
p.lon0=v.lon; p.lat0=v.lat; p.lmg=v.lmg; p.aa=v.aa; p.aa0=v.aa0;
p.lm=v.lm; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<1)=0; id(id>=1)=1; %figure; pcolor(p.lon,p.lat,p.lm); shading flat; colorbar;

lat1=16; lat2=75; lon1=190; lon2=304; p.xy=[lon1 lon2 lat1 lat2];%NAmerica
%lat1=25; lat2=50; lon1=235; lon2=295; p.xy=[lon1 lon2 lat1 lat2];%USA
p.ys=min(find(v.lat(:)>=lat1)); p.ye=max(find(v.lat(:)<=lat2));
p.xs=min(find(v.lon(:)>=lon1)); p.xe=max(find(v.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=id.*a; 
id=(id==1); aa=p.aa(id); aa=aa/mean(aa); p.id=id; 
pct_th=v.pct; spct=sprintf( '%4.2fth',pct_th(ipct));
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%HWday2_c
v=z.v0.hwday2;  a0=squeeze(v.av(m,:,:))*100;
v=z.w1.hwday2;  a1=squeeze(v.av(m,:,:))*100;
v=z.w2.hwday2;  a2=squeeze(v.av(m,:,:))*100;
v=z.w1F.hwday2; a3=squeeze(v.av(m,:,:))*100;
v=z.w1G.hwday2; a4=squeeze(v.av(m,:,:))*100;
v=z.w1H.hwday2; a5=squeeze(v.av(m,:,:))*100;
v=z.w1I.hwday2; a6=squeeze(v.av(m,:,:))*100;
tmp=(a1-a0)/p.dT(1);
a=(a2-a0)/p.dT(2)-tmp; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v2=a; p.dv2=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v3=a; p.dv3=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v5=a; p.dv5=mean(a(id).*aa);
%HWtmx_c
v=z.v0;  i=v.hwtmx2.av; f=v.hwday2.av;  a0=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w1;  i=v.hwtmx2.av; f=v.hwday2.av;  a1=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w2;  i=v.hwtmx2.av; f=v.hwday2.av;  a2=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w1F; i=v.hwtmx2.av; f=v.hwday2.av;  a3=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w1G; i=v.hwtmx2.av; f=v.hwday2.av;  a4=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w1H; i=v.hwtmx2.av; f=v.hwday2.av;  a5=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
v=z.w1I; i=v.hwtmx2.av; f=v.hwday2.av;  a6=squeeze(i(m,:,:)./f(m,:,:))+squeeze(hw.ctlc.th(m,:,:));
tmp=(a1-a0)/p.dT(1);
a=(a2-a0)/p.dT(2)-tmp; p.v6 =a; p.dv6 =nanmean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v7 =a; p.dv7 =nanmean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v8 =a; p.dv8 =nanmean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v9 =a; p.dv9 =nanmean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v10=a; p.dv10=nanmean(a(id).*aa);
%FWI
v=z.v0.fwiday_c.fwi;  a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday_c.fwi;  a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday_c.fwi;  a2=squeeze(v.pct(m,ipct,:,:));
v=z.w1F.fwiday_c.fwi; a3=squeeze(v.pct(m,ipct,:,:));
v=z.w1G.fwiday_c.fwi; a4=squeeze(v.pct(m,ipct,:,:));
v=z.w1H.fwiday_c.fwi; a5=squeeze(v.pct(m,ipct,:,:));
v=z.w1I.fwiday_c.fwi; a6=squeeze(v.pct(m,ipct,:,:));
tmp=(a1-a0)/p.dT(1);
a=(a2-a0)/p.dT(2)-tmp; p.v11=a; p.dv11=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v12=a; p.dv12=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v13=a; p.dv13=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v14=a; p.dv14=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v15=a; p.dv15=mean(a(id).*aa);
%DSR
v=z.v0.fwiday_c.dsr;  a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.fwiday_c.dsr;  a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.fwiday_c.dsr;  a2=squeeze(v.pct(m,ipct,:,:));
v=z.w1F.fwiday_c.dsr; a3=squeeze(v.pct(m,ipct,:,:));
v=z.w1G.fwiday_c.dsr; a4=squeeze(v.pct(m,ipct,:,:));
v=z.w1H.fwiday_c.dsr; a5=squeeze(v.pct(m,ipct,:,:));
v=z.w1I.fwiday_c.dsr; a6=squeeze(v.pct(m,ipct,:,:));
tmp=(a1-a0)/p.dT(1);
a=(a2-a0)/p.dT(2)-tmp; p.v16=a; p.dv16=mean(a(id).*aa);
a=(a3-a0)/p.dT(3)-tmp; p.v17=a; p.dv17=mean(a(id).*aa);
a=(a4-a0)/p.dT(4)-tmp; p.v18=a; p.dv18=mean(a(id).*aa);
a=(a5-a0)/p.dT(5)-tmp; p.v19=a; p.dv19=mean(a(id).*aa);
a=(a6-a0)/p.dT(6)-tmp; p.v20=a; p.dv20=mean(a(id).*aa);

p.fmt='eps'; plot_extreme_extended(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

