%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Simplified version
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('data_for_Fig1.mat'); p.vname='Fig1'; plot_fig123(p);
load('data_for_Fig2.mat'); p.vname='Fig2'; plot_fig123(p);
load('data_for_Fig3.mat'); p.vname='Fig3'; plot_fig123(p);
load('data_for_Fig4.mat'); p.vname='Fig4'; plot_fig4  (p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Below is the Full version
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load results and plot figures for studing pattern effects
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/'; opt=0; diag=0; f='_2_101_opt0_diag0_read_daily_namerica.mat';
e='c192L33_am4p0_2010climo_newctl';                 n=strcat(tpath,e,'/',e,f); load(n);z.v0=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear';  n=strcat(tpath,e,'/',e,f); load(n);z.w1=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_times_2';n=strcat(tpath,e,'/',e,f); load(n);z.w2=v;
e='c192_obs'; f='_1979_2014_opt0_diag0_read_daily_namerica.mat'; n=strcat(tpath,e,'/',e,f); load(n);z.vo=v;
%e='c192_obs'; f='_1979_2020_opt0_diag0_read_daily_namerica.mat'; n=strcat(tpath,e,'/',e,f); load(n);z.vo=v;
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
%Fig1: percentile changes in TAS, VPD, TWB, and RH at 2m%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea;
ipct=9;  iipct=3; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %95th 5th
%ipct=10; iipct=2; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; %99th 1th
A0='ERA5'; a0='Control'; a1='SPEAR-pattern M;~'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='tas_vpd_twb_rh'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
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

v=z.v0; 
pct_th=v.pct; spct=sprintf( '%4.2fth',pct_th(ipct));  ispct=sprintf( '%4.2fth',pct_th(iipct));
p.S0=strcat(p.S0,'~',spct);p.S3=strcat(p.S3,'~',spct);p.S6=strcat(p.S6,'~',spct);p.S9=strcat(p.S9,'~',ispct);
p.s0=strcat(p.s0,'~',spct);p.s3=strcat(p.s3,'~',spct);p.s6=strcat(p.s6,'~',spct);p.s9=strcat(p.s9,'~',ispct);
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%tasday
v=z.vo.tasday; A0=squeeze(v.pct(m,ipct,:,:));
v=z.v0.tasday; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.tasday; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.tasday; a2=squeeze(v.pct(m,ipct,:,:));
a=A0; p.V0=a; p.dV0=mean(a(id).*aa);
a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v0=a; p.dv0=mean(a(id).*aa); p.cmin0= p.cmin1; p.cmax0=p.cmax1; end;
a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);

%vpdday
v=z.vo.vpdday; A0=squeeze(v.pct(m,ipct,:,:));
v=z.v0.vpdday; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.vpdday; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.vpdday; a2=squeeze(v.pct(m,ipct,:,:));
a=A0; p.V3=a; p.dV3=mean(a(id).*aa);
a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
if (p.do_bias);  a=a0-A0; p.v3=a; p.dv3=mean(a(id).*aa); p.cmin3= p.cmin4; p.cmax3=p.cmax4; end;
a=(a1-a0)/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa);

%twbday
v=z.vo.twbday; A0=squeeze(v.pct(m,ipct,:,:));
v=z.v0.twbday; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.twbday; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.twbday; a2=squeeze(v.pct(m,ipct,:,:));
a=A0; p.V6=a; p.dV6=mean(a(id).*aa);
a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v6=a; p.dv6=mean(a(id).*aa); p.cmin6= p.cmin7; p.cmax6=p.cmax7; end;
a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);

%RHday
v=z.vo.rhday; A0=squeeze(v.pct(m,iipct,:,:));
v=z.v0.rhday; a0=squeeze(v.pct(m,iipct,:,:));
v=z.w1.rhday; a1=squeeze(v.pct(m,iipct,:,:));
v=z.w2.rhday; a2=squeeze(v.pct(m,iipct,:,:));
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
%Fig2: HeatWave statistics: HWF and HWI Intensity%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig3: changes in 95th-percentiles for FWI, BUI, ISI, and DSR with bias correction
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
%FigS2: changes in 95th-percentiles for FWI, BUI, ISI, and DSR without bias correction
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
%Other HeatWave statistics%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'DJF','MAM','JJA','SON'}; isea=3; m=isea; ipct=9; %pct=[0.1 1 5 10 25 50 75 90 95 99 99.9];
A0='ERA5'; a0='Control'; a1='SPEAR-pattern M;~'; a2='Observed-pattern'; a3='Uniform-pattern'; p.flipcmap=0;
p.vname='tasmax2_tasmax2c_hwf_hwfc'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
del=' $\Delta$'; s0='TASMAX; '; s1='TASMAXc; '; s2='HWF;'; s3='HWFc; ';
A0=strcat(A0,'~(',p.sea,');~'); a0=strcat(a0,'~(',p.sea,');~');;
p.S0 =strcat(A0,s0); p.s0 =strcat(a0,s0); p.s1 =strcat(a1,del,s0); p.s2 =strcat(a2,del,s0); 
p.S3 =strcat(A0,s1); p.s3 =strcat(a0,s1); p.s4 =strcat(a1,del,s1); p.s5 =strcat(a2,del,s1); 
p.S6 =strcat(A0,s2); p.s6 =strcat(a0,s2); p.s7 =strcat(a1,del,s2); p.s8 =strcat(a2,del,s2); 
p.S9 =strcat(A0,s3); p.s9 =strcat(a0,s3); p.s10=strcat(a1,del,s3); p.s11=strcat(a2,del,s3);
p.unit0 ='$\rm{^{\circ}C}$';    p.unit0_bar ='\rm{^{\circ}C}';
p.unit1 ='$\rm{KK^{-1}}$';      p.unit1_bar ='\rm{KK^{-1}}';
p.unit3 ='$\rm{^{\circ}C}$';    p.unit3_bar ='\rm{^{\circ}C}';
p.unit4 ='$\rm{KK^{-1}}$';      p.unit4_bar ='\rm{KK^{-1}}';
p.unit6 ='$\rm{\%}$';           p.unit6_bar ='\rm{%}';
p.unit7 ='$\rm{\%K^{-1}}$';     p.unit7_bar ='\rm{%K^{-1}}';
p.unit9 ='$\rm{\%}$';           p.unit9_bar ='\rm{%}'; 
p.unit10='$\rm{\%K^{-1}}$';     p.unit10_bar='\rm{%K^{-1}}'; 

p.cmin0= 0.0; p.cmax0=40;  p.cmin1 =-4;  p.cmax1 =4;
p.cmin3= 0.0; p.cmax3=40;  p.cmin4 =-4;  p.cmax4 =4;
p.cmin6= 0.0; p.cmax6=4;   p.cmin7 =-20; p.cmax7 =20;
p.cmin9= 0.0; p.cmax9=4;   p.cmin10=-20; p.cmax10=20;
p.do_add=0; p.show='off'; p.co='k'; p.xy=[190 304 16 75]; p.do_bias=1;
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
p.S0=strcat(p.S0,'~',spct);p.S3=strcat(p.S3,'~',spct);p.S6=strcat(p.S6);p.S9=strcat(p.S9);
p.s0=strcat(p.s0,'~',spct);p.s3=strcat(p.s3,'~',spct);p.s6=strcat(p.s6);p.s9=strcat(p.s9);
p.vname=strcat(p.vname,'_ipct_',num2str(ipct))

%taxmaxday
v=z.vo.tasmaxday; A0=squeeze(v.pct(m,ipct,:,:));
v=z.v0.tasmaxday; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.tasmaxday; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.tasmaxday; a2=squeeze(v.pct(m,ipct,:,:));
a=A0; p.V0=a; p.dV0=mean(a(id).*aa);
a=a0; p.v0=a; p.dv0=mean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v0=a; p.dv0=mean(a(id).*aa); p.cmin0= p.cmin1; p.cmax0=p.cmax1; end;
a=(a1-a0)/p.dT1; p.v1=a; p.dv1=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v2=a; p.dv2=mean(a(id).*aa);

%taxmaxday_c
v=z.vo.tasmaxday;   A0=squeeze(v.pct(m,ipct,:,:));
v=z.v0.tasmaxday_c; a0=squeeze(v.pct(m,ipct,:,:));
v=z.w1.tasmaxday_c; a1=squeeze(v.pct(m,ipct,:,:));
v=z.w2.tasmaxday_c; a2=squeeze(v.pct(m,ipct,:,:));
a=A0; p.V3=a; p.dV3=mean(a(id).*aa);
a=a0; p.v3=a; p.dv3=mean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v3=a; p.dv3=mean(a(id).*aa); p.cmin3= p.cmin4; p.cmax3=p.cmax4; end;
a=(a1-a0)/p.dT1; p.v4=a; p.dv4=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v5=a; p.dv5=mean(a(id).*aa);

%HWday2
v=z.vo.hwday2; A0=squeeze(v.av(m,:,:))*100;
v=z.v0.hwday1; a0=squeeze(v.av(m,:,:))*100; %note hwday1 contain HW days defined using pct=95 threshold
v=z.w1.hwday1; a1=squeeze(v.av(m,:,:))*100;
v=z.w2.hwday1; a2=squeeze(v.av(m,:,:))*100;
a=A0; p.V6=a; p.dV6=mean(a(id).*aa);
a=a0; p.v6=a; p.dv6=mean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v6=a; p.dv6=mean(a(id).*aa); p.cmin6= p.cmin7; p.cmax6=p.cmax7; end;
a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);

%HWday2_c
v=z.vo.hwday2; A0=squeeze(v.av(m,:,:))*100;
v=z.v0.hwday2; a0=squeeze(v.av(m,:,:))*100;
v=z.w1.hwday2; a1=squeeze(v.av(m,:,:))*100;
v=z.w2.hwday2; a2=squeeze(v.av(m,:,:))*100;
a=A0; p.V9=a; p.dV9=mean(a(id).*aa);
a=a0; p.v9=a; p.dv9=mean(a(id).*aa);
if (p.do_bias); a=a0-A0; p.v9=a; p.dv9=mean(a(id).*aa); p.cmin9= p.cmin10; p.cmax9=p.cmax10; end;
a=(a1-a0)/p.dT1; p.v10=a; p.dv10=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v11=a; p.dv11=mean(a(id).*aa);

a=id; a(:,:)=0;
p.isig1=a; p.isig2=a; p.isig4 =a; p.isig5 =a; 
p.isig7=a; p.isig8=a; p.isig10=a; p.isig11=a;

p.fmt='png'; plot_pattern_effect_Fig_extremes_20panel_Transposed(p)
plot_pattern_effect_Fig_extremes(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load new data for atmospheric circulation analysis for Fig4 %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ph='/archive/Ming.Zhao/awg/2023.04/'; f='_global_opt2.c96_tsana_hiresmip_new_2-101_0002-0101_do_3d_atm_1_do_all_1.mat';
ph='/archive/Ming.Zhao/awg/2023.04/'; f='_global_opt2.c96_tsana_hiresmip_new_ivt_2-101_0002-0101_do_3d_atm_1_do_trend_0.mat';
e='c192L33_am4p0_2010climo_newctl';                 n=strcat(ph,e,'/',e,f); load(n);z.v0=v; %z.v0=z.v0b;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear';  n=strcat(ph,e,'/',e,f); load(n);z.w1=v;
e='c192L33_am4p0_2010climo_trend_1979_2020_times_2';n=strcat(ph,e,'/',e,f); load(n);z.w2=v;
fn=strcat('/work/miz/mat_hiresmip/obs_global','_to_c96_era5.mat'); load(fn); o.mod='c96'; z.V0=o;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig4 for atmospheric circulation changes across various season%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
A0='ERA5; '; a0='Control; '; a1='SPEAR-pattern M; '; a2='Observed-pattern; '; a3='Uniform';
nsea={'ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'}; isea=3; %1-7=ANN,MAM,JJA,SON,DJF,NDJFM,MJJA
p.vname='atm_500_200_850_ivt'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea}; p.u200_bin=[15 20];
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
imk=z.v0.sfc.ice.tavg0;  aa0=aa; 

v=z.v0.s; p.lm=v.lm; aa0=v.aa; p.lon=v.lon; p.lat=v.lat; LV0=2.5E6;
id=p.lm; id(id<0.5)=0; id(id>=0.5)=1; p.id_lm=(id==1);
lat1= 15; lat2=85; lon1=190; lon2=344; p.xy=[280 360  0 90];
lat1=-90; lat2=90; lon1=0;   lon2=360; p.xy=[0   360 -90 90];
p.xy=[lon1 lon2 lat1 lat2];
p.ys=min(find(s.lat(:)>=lat1)); p.ye=max(find(s.lat(:)<=lat2));
p.xs=min(find(s.lon(:)>=lon1)); p.xe=max(find(s.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=a; %id=id.*a; 
id=(id==1); aa=aa0(id); aa=aa/mean(aa); nlon=length(p.lon); %figure; pcolor(id); shading flat; colorbar;

k=7; %500hPa: Z500', U500, V500; 0:CNTL, 1:ModPattern minus CNTL; 2:ObsPattern minus CNTL
v=z.V0.atm.za(5);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0);
v=z.v0.atm.za(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=z.w1.atm.za(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=z.w2.atm.za(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
a=A0;            p.Z0=a; p.dZ0=mean(a(id).*aa);
a=a0;            p.z0=a; p.dz0=mean(a(id).*aa); p.z0_bin=[0:50:150];
a=(a1-a0)/p.dT1; p.z1=a; p.dz1=mean(a(id).*aa); p.isig1=id; 
a=(a2-a0)/p.dT2; p.z2=a; p.dz2=mean(a(id).*aa); p.isig2=id;

v=z.V0.atm.ua(5);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0); 
v=z.v0.atm.ua(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0); 
v=z.w1.atm.ua(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1); 
v=z.w2.atm.ua(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2); 
a=A0;            p.U0 =a; p.dU0 =mean(a(id).*aa); 
a=a0;            p.u0 =a; p.du0 =mean(a(id).*aa); p.u0_bin=[10:5:50];
a=(a1-a0)/p.dT1; p.u1 =a; p.du1 =mean(a(id).*aa); 
a=(a2-a0)/p.dT2; p.u2 =a; p.du2 =mean(a(id).*aa); 

v=z.V0.atm.va(5);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0);
v=z.v0.atm.va(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=z.w1.atm.va(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=z.w2.atm.va(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
a=A0;            p.V0 =a; p.dV0 =mean(a(id).*aa);
a=a0;            p.v0 =a; p.dv0 =mean(a(id).*aa); p.v0_bin=[0:5:50];
a=(a1-a0)/p.dT1; p.v1 =a; p.dv1 =mean(a(id).*aa); 
a=(a2-a0)/p.dT2; p.v2 =a; p.dv2 =mean(a(id).*aa); 

k=11; %200hPa: Z200', U200, V200; 3:CNTL, 4:ModPattern minus CNTL; 5:ObsPattern minus CNTL
v=z.V0.atm.za(7);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0);
v=z.v0.atm.za(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=z.w1.atm.za(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=z.w2.atm.za(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
a=A0;            p.Z3 =a; p.dZ3 =mean(a(id).*aa); 
a=a0;            p.z3 =a; p.dz3 =mean(a(id).*aa); p.z3_bin=[0:50:150];
a=(a1-a0)/p.dT1; p.z4 =a; p.dz4 =mean(a(id).*aa); 
a=(a2-a0)/p.dT2; p.z5 =a; p.dz5 =mean(a(id).*aa); 

v=z.V0.atm.ua(7);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0); p.u200_era=squeeze(a(isea,:,:));
v=z.v0.atm.ua(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0); p.u200_mod=squeeze(a(isea,:,:));
v=z.w1.atm.ua(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1); p.u200_spp=squeeze(a(isea,:,:));
v=z.w2.atm.ua(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2); p.u200_obp=squeeze(a(isea,:,:));
a=A0;            p.U3 =a; p.dU3 =mean(a(id).*aa); 
a=a0;            p.u3 =a; p.du3 =mean(a(id).*aa); p.u3_bin=[15:5:50];
a=(a1-a0)/p.dT1; p.u4 =a; p.du4 =mean(a(id).*aa); p.isig4 =id;
a=(a2-a0)/p.dT2; p.u5 =a; p.du5 =mean(a(id).*aa); p.isig5 =id;

v=z.V0.atm.va(7);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0);
v=z.v0.atm.va(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=z.w1.atm.va(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=z.w2.atm.va(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
a=A0;            p.V3 =a; p.dV3 =mean(a(id).*aa);
a=a0;            p.v3 =a; p.dv3 =mean(a(id).*aa); p.v3_bin=[0:5:50];
a=(a1-a0)/p.dT1; p.v4 =a; p.dv4 =mean(a(id).*aa); 
a=(a2-a0)/p.dT2; p.v5 =a; p.dv5 =mean(a(id).*aa); 

k=3; %850hPa: Z850', U850, V850; 6:CNTL, 7:ModPattern minus CNTL; 8:ObsPattern minus CNTL
v=z.V0.atm.za(3);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0);
v=z.v0.atm.za(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=z.w1.atm.za(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=z.w2.atm.za(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
a=A0;            p.Z6=a; p.dZ6=mean(a(id).*aa); 
a=a0;            p.z6=a; p.dz6=mean(a(id).*aa); p.z6_bin=[0:10:150];
a=(a1-a0)/p.dT1; p.z7=a; p.dz7=mean(a(id).*aa); 
a=(a2-a0)/p.dT2; p.z8=a; p.dz8=mean(a(id).*aa); 

v=z.V0.atm.ua(k);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0);
v=z.v0.atm.ua(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=z.w1.atm.ua(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=z.w2.atm.ua(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
a=A0;            p.U6=a; p.dU6=mean(a(id).*aa); 
a=a0;            p.u6=a; p.du6=mean(a(id).*aa); p.u6_bin=[5:5:30];
a=(a1-a0)/p.dT1; p.u7=a; p.du7=mean(a(id).*aa); p.isig7=id;
a=(a2-a0)/p.dT2; p.u8=a; p.du8=mean(a(id).*aa); p.isig8=id;

v=z.V0.atm.va(k);  a=v.sea; A0=squeeze(a(isea,:,:)); A0=get_zonala(A0);
v=z.v0.atm.va(k);  a=v.sea; a0=squeeze(a(isea,:,:)); a0=get_zonala(a0);
v=z.w1.atm.va(k);  a=v.sea; a1=squeeze(a(isea,:,:)); a1=get_zonala(a1);
v=z.w2.atm.va(k);  a=v.sea; a2=squeeze(a(isea,:,:)); a2=get_zonala(a2);
a=A0;            p.V6=a; p.dV6=mean(a(id).*aa);
a=a0;            p.v6=a; p.dv6=mean(a(id).*aa); p.v6_bin=[0:5:20];
a=(a1-a0)/p.dT1; p.v7=a; p.dv7=mean(a(id).*aa);
a=(a2-a0)/p.dT2; p.v8=a; p.dv8=mean(a(id).*aa);

%%IVTDIV, IVTX, IVTY; 9:CNTL, 10:ModPattern minus CNTL; 11:ObsPattern minus CNTL
%v=z.V0.sfc.pcp.sea;  a=v; A0=squeeze(a(isea,:,:)); 
%v=z.v0.sfc.pcp.sea;  a=v; a0=squeeze(a(isea,:,:)); 
%v=z.w1.sfc.pcp.sea;  a=v; a1=squeeze(a(isea,:,:)); 
%v=z.w2.sfc.pcp.sea;  a=v; a2=squeeze(a(isea,:,:)); 
%v=z.V0.sfc.evap.sea/LV0*86400;  a=v; A0=squeeze(a(isea,:,:)); 
%v=z.v0.sfc.evap.sea/LV0*86400;  a=v; a0=squeeze(a(isea,:,:)); 
%v=z.w1.sfc.evap.sea/LV0*86400;  a=v; a1=squeeze(a(isea,:,:)); 
%v=z.w2.sfc.evap.sea/LV0*86400;  a=v; a2=squeeze(a(isea,:,:)); 
%v=z.V0.sfc.pcp.sea-z.V0.sfc.evap.sea/LV0*86400;  a=v; A0=squeeze(a(isea,:,:)); 
%v=z.v0.sfc.pcp.sea-z.v0.sfc.evap.sea/LV0*86400;  a=v; a0=squeeze(a(isea,:,:)); 
%v=z.w1.sfc.pcp.sea-z.w1.sfc.evap.sea/LV0*86400;  a=v; a1=squeeze(a(isea,:,:)); 
%v=z.w2.sfc.pcp.sea-z.w2.sfc.evap.sea/LV0*86400;  a=v; a2=squeeze(a(isea,:,:)); 
v=z.V0.atm.ivtdiv;  a=v.sea; A0=-squeeze(a(isea,:,:))*86400; 
v=z.v0.atm.ivtdiv;  a=v.sea; a0=-squeeze(a(isea,:,:))*86400; 
v=z.w1.atm.ivtdiv;  a=v.sea; a1=-squeeze(a(isea,:,:))*86400; 
v=z.w2.atm.ivtdiv;  a=v.sea; a2=-squeeze(a(isea,:,:))*86400; 
a=A0;            p.Z9 =a; p.dZ9 =mean(a(id).*aa); 
a=a0;            p.z9 =a; p.dz9 =mean(a(id).*aa); p.z9_bin=[980:5:1020];
a=(a1-a0)/p.dT1; p.z10=a; p.dz10=mean(a(id).*aa); p.isig10=id;
a=(a2-a0)/p.dT2; p.z11=a; p.dz11=mean(a(id).*aa); p.isig11=id;

scale=1; %0.05; %k=2; %950hPa, U and V
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FigS3 for precip, evap, PME, and MRSOS%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
A0='ERA5; '; a0='Control; '; a1='SPEAR-pattern M; '; a2='Observed-pattern; '; a3='Uniform';
nsea={'ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'}; isea=3; %1-7=ANN,MAM,JJA,SON,DJF,NDJFM,MJJA
p.vname='atm_pcp_evap_pme_mrsos'; p.vname=strcat('Fig_',p.vname,'_',nsea{isea}); p.sea=nsea{isea};
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
p.unit0 ='mm day^{-1}';          p.unit0_bar =p.unit0;
p.unit1 ='mm day^{-1} K^{-1}';   p.unit1_bar =p.unit1;
p.unit3 ='mm day^{-1}';          p.unit3_bar =p.unit3;
p.unit4 ='mm day^{-1} K^{-1}';   p.unit4_bar =p.unit4;
p.unit6 ='mm day^{-1}';          p.unit6_bar =p.unit6;
p.unit7 ='mm day^{-1} K^{-1}';   p.unit7_bar =p.unit7;
p.unit9 ='kg m^{-2}';            p.unit9_bar =p.unit9;
p.unit10='kg m^{-2} K^{-1}';     p.unit10_bar=p.unit10;

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
id=(id==1); aa=aa0(id); aa=aa/mean(aa); nlon=length(p.lon); %figure; pcolor(id); shading flat; colorbar;
%colume 1
v=z.V0.sfc.pcp_ec.sea;  a=v; A0=squeeze(a(isea,:,:))*86400; 
v=z.v0.sfc.pcp.sea;  a=v; a0=squeeze(a(isea,:,:)); 
v=z.w1.sfc.pcp.sea;  a=v; a1=squeeze(a(isea,:,:)); 
v=z.w2.sfc.pcp.sea;  a=v; a2=squeeze(a(isea,:,:)); 
a=A0;            p.Z0=a; p.dZ0=mean(a(id).*aa);
a=a0;            p.z0=a; p.dz0=mean(a(id).*aa); p.z0_bin=[0:50:150];
a=(a1-a0)/p.dT1; p.z1=a; p.dz1=mean(a(id).*aa); p.isig1=id; 
a=(a2-a0)/p.dT2; p.z2=a; p.dz2=mean(a(id).*aa); p.isig2=id;
%colume 2
v=z.V0.sfc.evap.sea/LV0*86400;  a=v; A0=squeeze(a(isea,:,:)); 
v=z.v0.sfc.evap.sea/LV0*86400;  a=v; a0=squeeze(a(isea,:,:)); 
v=z.w1.sfc.evap.sea/LV0*86400;  a=v; a1=squeeze(a(isea,:,:)); 
v=z.w2.sfc.evap.sea/LV0*86400;  a=v; a2=squeeze(a(isea,:,:)); 
a=A0;            p.Z3 =a; p.dZ3 =mean(a(id).*aa); 
a=a0;            p.z3 =a; p.dz3 =mean(a(id).*aa); p.z3_bin=[0:50:150];
a=(a1-a0)/p.dT1; p.z4 =a; p.dz4 =mean(a(id).*aa); 
a=(a2-a0)/p.dT2; p.z5 =a; p.dz5 =mean(a(id).*aa);
%column 3
v=z.V0.sfc.pcp_ec.sea*86400-z.V0.sfc.evap.sea/LV0*86400; a=v; A0=squeeze(a(isea,:,:)); 
v=z.v0.sfc.pcp.sea-z.v0.sfc.evap.sea/LV0*86400;  a=v; a0=squeeze(a(isea,:,:)); 
v=z.w1.sfc.pcp.sea-z.w1.sfc.evap.sea/LV0*86400;  a=v; a1=squeeze(a(isea,:,:)); 
v=z.w2.sfc.pcp.sea-z.w2.sfc.evap.sea/LV0*86400;  a=v; a2=squeeze(a(isea,:,:)); 
a=A0;            p.Z6=a; p.dZ6=mean(a(id).*aa); 
a=a0;            p.z6=a; p.dz6=mean(a(id).*aa); p.z6_bin=[0:10:150];
a=(a1-a0)/p.dT1; p.z7=a; p.dz7=mean(a(id).*aa); 
a=(a2-a0)/p.dT2; p.z8=a; p.dz8=mean(a(id).*aa);
%column 4
k=11; k1=7; s3='OM200'; %200hPa omega
%k=7;  k1=5; s3='OM500'; %500hPa omega
%v=z.V0.atm.om(k1); a=v.sea; A0=squeeze(a(isea,:,:)); 
%v=z.v0.atm.om(k);  a=v.sea; a0=squeeze(a(isea,:,:))*864; 
%v=z.w1.atm.om(k);  a=v.sea; a1=squeeze(a(isea,:,:))*864; 
%v=z.w2.atm.om(k);  a=v.sea; a2=squeeze(a(isea,:,:))*864;
%a=z.V0.atm.twp.sea;                           A0=squeeze(a(isea,:,:)); 
%v=z.v0.atm; a=v.wvp.sea+v.lwp.sea+v.iwp.sea;  a0=squeeze(a(isea,:,:)); 
%v=z.w1.atm; a=v.wvp.sea+v.lwp.sea+v.iwp.sea;  a1=squeeze(a(isea,:,:)); 
%v=z.w2.atm; a=v.wvp.sea+v.lwp.sea+v.iwp.sea;  a2=squeeze(a(isea,:,:)); 
%v=z.V0.atm.twp.sea;   a=v; A0=squeeze(a(isea,:,:)); 
v=z.V0.sfc.mrsos.sea; a=v; A0=squeeze(a(isea,:,:))*0.10*1000; %convert unit from m3/m3 to kg/m2
v=z.v0.sfc.mrsos.sea; a=v; a0=squeeze(a(isea,:,:));           %kg/m2
v=z.w1.sfc.mrsos.sea; a=v; a1=squeeze(a(isea,:,:)); 
v=z.w2.sfc.mrsos.sea; a=v; a2=squeeze(a(isea,:,:)); 
a=A0;            p.Z9 =a; p.dZ9 =mean(a(id).*aa); 
a=a0;            p.z9 =a; p.dz9 =mean(a(id).*aa); p.z9_bin=[980:5:1020];
a=(a1-a0)/p.dT1; p.z10=a; p.dz10=mean(a(id).*aa); p.isig10=id;
a=(a2-a0)/p.dT2; p.z11=a; p.dz11=mean(a(id).*aa); p.isig11=id;
p.cfact=2; p.phi_bin=[0:50:300]; p.phi_co='r';

p.fmt='eps'; %p.fmt='png';
p.xy=[100 360 -10 90];  plot_pattern_effect_Fig_atm_20panel_transposed_scalar(p)
