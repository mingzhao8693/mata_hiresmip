function plot_pattern_effect() %CM4,a40)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=a40.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa; opt=1;
d=load_sst_pattern(a40)
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
       "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LATEST ===Fig9===: SST pattern
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a0="AM4-W-"; a1=a0+"CM4P"; a2=a0+"ESM2P";
p.s1=a1+"1";   p.s2=a1+"2"; p.s3=a1+"3";
p.s4=a2+"1";   p.s5=a2+"2"; p.s6=a2+"3";
p.s7=a0+"CESS"; p.s8=a0+"CM4P4"; p.s9=a0+"ESM2ZM"; 
p.s1='AM4-CM4pattern2K-50';   
p.s2='AM4-CM4pattern2K-125';
p.s3='AM4-CM4pattern2K-125minus50';
p.s4='AM4-ESM2Mpattern2K-50';   
p.s5='AM4-ESM2Mpattern2K-125';
p.s6='AM4-ESM2Mpattern2K-125minus50';
p.s7='AM4-uniform2K';
p.s8='AM4-CM4pattern2K-125-modified';
p.tit='\DeltaSST'; p.unit='  K';
p.vname='Fig9'; p.cmin1=-2; p.cmax1=2; p.cmin2=-1; p.cmax2=1;
p.lon=lon; p.lat=lat; p.lm=lm; id=(lm>0 | d.imk>0); p.co='k';
p.dT1=d.sst1; p.dT2=d.sst2; p.dT3=d.sst3; p.dT4=d.sst4; 
p.dT5=d.sst5; p.dT6=d.sst6; p.dT7=d.sst7; p.dT8=d.sst8;
p.v1 =d.ts1; p.v2 =d.ts2; p.v3 =d.ts3; p.v4 =d.ts4; 
p.v5 =d.ts5; p.v6 =d.ts6; p.v7 =d.ts7; p.v8 =d.ts8;
p.v1=p.v1-p.dT1; p.v2=p.v2-p.dT2; p.v3=p.v3-p.dT3; p.v4=p.v4-p.dT4; 
p.v5=p.v5-p.dT5; p.v6=p.v6-p.dT6; p.v7=p.v7-p.dT7; p.v8=p.v8-p.dT8;
p.v1(id)=NaN; p.v2(id)=NaN; p.v3(id)=NaN; p.v4(id)=NaN; 
p.v5(id)=NaN; p.v6(id)=NaN; p.v7(id)=NaN; p.v8(id)=NaN;
p.dT1=2; p.dT2=2; p.dT3=2; p.dT4=2; p.dT5=2; p.dT6=2; p.dT7=2; p.dT8=2;
plot_2d_12panel_new(p); %plot_2d_9panel_new(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a0="AM4-W-"; a1=a0+"CM4P"; a2=a0+"ESM2P";
p.s1=a1+"1";   p.s2=a1+"2"; p.s3=a1+"3";
p.s4=a2+"1";   p.s5=a2+"2"; p.s6=a2+"3";
p.s7=a0+"CESS"; p.s8=a0+"CM4P4"; p.s9=a0+"ESM2ZM"; 
p.s1='AM4-CM4pattern2K-50';   
p.s2='AM4-CM4pattern2K-125';
p.s3='AM4-CM4pattern2K-125minus50';
p.s4='AM4-ESM2Mpattern2K-50';   
p.s5='AM4-ESM2Mpattern2K-125';
p.s6='AM4-ESM2Mpattern2K-125minus50';
p.s7='AM4-uniform2K';
p.s8='AM4-CM4pattern2K-125-modified';
p.tit='\DeltaTs'; p.unit='K';
p.vname='ts_pattern'; p.cmin1=-2; p.cmax1=2; p.cmin2=-1; p.cmax2=1;
p.lon=lon; p.lat=lat; p.lm=lm; id=(lm>0.1); p.co='k';
p.dT1=d.Ts1; p.dT2=d.Ts2; p.dT3=d.Ts3; p.dT4=d.Ts4; p.dT5=d.Ts5; p.dT6=d.Ts6;p.dT7=d.Ts7;p.dT8=d.Ts8;
p.v1 =d.ts1; p.v2 =d.ts2; p.v3 =d.ts3; p.v4 =d.ts4; p.v5 =d.ts5; p.v6 =d.ts6;p.v7 =d.ts7;p.v8 =d.ts8;
p.v1=p.v1-p.dT1; p.v2=p.v2-p.dT2; p.v3=p.v3-p.dT3; p.v4=p.v4-p.dT4; 
p.v5=p.v5-p.dT5; p.v6=p.v6-p.dT6; p.v7=p.v7-p.dT7; p.v8=p.v8-p.dT8;
p.v1(id)=NaN; p.v2(id)=NaN; p.v3(id)=NaN; p.v4(id)=NaN; 
p.v5(id)=NaN; p.v6(id)=NaN; p.v7(id)=NaN; p.v8(id)=NaN;
plot_2d_12panel_new(p); %plot_2d_9panel_new(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a0="AM4-W-"; a1=a0+"CM4P"; a2=a0+"ESM2P";
p.s1=a1+"1";   p.s2=a1+"2"; p.s3=a1+"3";
p.s4=a2+"1";   p.s5=a2+"2"; p.s6=a2+"3";
p.s7=a0+"CESS"; p.s8=a0+"CM4P4"; p.s9=a0+"ESM2ZM"; 
p.tit='\DeltaSAT'; p.unit='K';
p.vname='tas_pattern';  p.cmin1=-2; p.cmax1=2; p.cmin2=-1; p.cmax2=1;
p.lon=lon; p.lat=lat; p.lm=lm; id=(lm>1); p.co='k';
p.dT1=d.Ta1; p.dT2=d.Ta2; p.dT3=d.Ta3; p.dT4=d.Ta4; p.dT5=d.Ta5; p.dT6=d.Ta6;p.dT7=d.Ta7;p.dT8=d.Ta8;
p.v1 =d.ta1; p.v2 =d.ta2; p.v3 =d.ta3; p.v4 =d.ta4; p.v5 =d.ta5; p.v6 =d.ta6;p.v7 =d.ta7;p.v8 =d.ta8;
p.v1=p.v1-1; p.v2=p.v2-1; p.v3=p.v3-1; p.v4=p.v4-1; p.v5=p.v5-1; p.v6=p.v6-1;p.v7=p.v7-1;p.v8=p.v8-1;
plot_2d_12panel_new(p); %plot_2d_9panel_new(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LATEST ===Fig10===: TOA NET FEEDBACK
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a0="AM4-W-"; a1=a0+"CM4P"; a2=a0+"ESM2P";
p.s1=a1+"1";   p.s2=a1+"2"; p.s3=a1+"3";
p.s4=a2+"1";   p.s5=a2+"2"; p.s6=a2+"3";
p.s7=a0+"CESS"; p.s8=a0+"CM4P4"; p.s9=a0+"ESM2ZM"; 
p.s1='AM4-CM4pattern2K-50';   
p.s2='AM4-CM4pattern2K-125';
p.s3='AM4-CM4pattern2K-125minus50';
p.s4='AM4-ESM2Mpattern2K-50';   
p.s5='AM4-ESM2Mpattern2K-125';
p.s6='AM4-ESM2Mpattern2K-125minus50';
p.s7='AM4-uniform2K';
p.s8='AM4-CM4pattern2K-125-modified';
p.tit='\DeltaN';p.unit='W/m2/K';
p.vname='netrad_pattern'; p.vname='Fig10';
p.cmin1=-4; p.cmax1=4; p.cmin2=-4; p.cmax2=4;
p.lon=lon; p.lat=lat; p.lm=lm; id=(lm>1); p.co='k';
p.dT1=d.n1; p.dT2=d.n2; p.dT3=d.n3; p.dT4=d.n4; 
p.dT5=d.n5; p.dT6=d.n6; p.dT7=d.n7; p.dT8=d.n8; 
p.v1=d.netrad1; p.v2=d.netrad2; p.v3=d.netrad3; p.v4=d.netrad4; 
p.v5=d.netrad5; p.v6=d.netrad6; p.v7=d.netrad7; p.v8=d.netrad8; 
plot_2d_12panel_new(p); %plot_2d_9panel_new(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LATEST ===Fig11===: TOA NET CLOUD FEEDBACK
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a0="AM4-W-"; a1=a0+"CM4P"; a2=a0+"ESM2P";
p.s1=a1+"1";   p.s2=a1+"2"; p.s3=a1+"3";
p.s4=a2+"1";   p.s5=a2+"2"; p.s6=a2+"3";
p.s7=a0+"CESS"; p.s8=a0+"CM4P4"; p.s9=a0+"ESM2ZM"; 
p.s1='AM4-CM4pattern2K-50';   
p.s2='AM4-CM4pattern2K-125';
p.s3='AM4-CM4pattern2K-125minus50';
p.s4='AM4-ESM2Mpattern2K-50';   
p.s5='AM4-ESM2Mpattern2K-125';
p.s6='AM4-ESM2Mpattern2K-125minus50';
p.s7='AM4-uniform2K';
p.s8='AM4-CM4pattern2K-125-modified';
p.tit='\DeltaCRE'; p.unit='W/m2/K';
p.vname='cre_pattern'; p.vname='Fig10';
p.cmin1=-4; p.cmax1=4; p.cmin2=-4; p.cmax2=4;
p.lon=lon; p.lat=lat; p.lm=lm; id=(lm>1); p.co='k';
p.dT1=d.TTCF1; p.dT2=d.TTCF2; p.dT3=d.TTCF3; p.dT4=d.TTCF4; 
p.dT5=d.TTCF5; p.dT6=d.TTCF6; p.dT7=d.TTCF7; p.dT8=d.TTCF8; 
p.v1=d.ttcf1; p.v2=d.ttcf2; p.v3=d.ttcf3;  p.v4=d.ttcf4;
p.v5=d.ttcf5; p.v6=d.ttcf6; p.v7=d.ttcf7;  p.v8=d.ttcf8;
plot_2d_12panel_new(p); %plot_2d_9panel_new(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LATEST ===FigS4=== TOA NET CLEAR FEEDBACK
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a0="AM4-W-"; a1=a0+"CM4P"; a2=a0+"ESM2P";
p.s1=a1+"1";   p.s2=a1+"2"; p.s3=a1+"3";
p.s4=a2+"1";   p.s5=a2+"2"; p.s6=a2+"3";
p.s7=a0+"CESS"; p.s8=a0+"CM4P4"; p.s9=a0+"ESM2ZM"; 
p.s1='AM4-CM4pattern2K-50';   
p.s2='AM4-CM4pattern2K-125';
p.s3='AM4-CM4pattern2K-125minus50';
p.s4='AM4-ESM2Mpattern2K-50';   
p.s5='AM4-ESM2Mpattern2K-125';
p.s6='AM4-ESM2Mpattern2K-125minus50';
p.s7='AM4-uniform2K';
p.s8='AM4-CM4pattern2K-125-modified';
p.tit='\DeltaCLR'; p.unit='W/m2/K';
p.vname='clr_pattern'; p.vname='FigS4';
p.cmin1=-4; p.cmax1=4; p.cmin2=-4; p.cmax2=4;
p.lon=lon; p.lat=lat; p.lm=lm; id=(lm>1); p.co='k';
p.dT1=d.cl1; p.dT2=d.cl2; p.dT3=d.cl3; p.dT4=d.cl4; 
p.dT5=d.cl5; p.dT6=d.cl6; p.dT7=d.cl7; p.dT8=d.cl8; 
p.v1=d.netrad_clr1; p.v2=d.netrad_clr2; p.v3=d.netrad_clr3; p.v4=d.netrad_clr4;
p.v5=d.netrad_clr5; p.v6=d.netrad_clr6; p.v7=d.netrad_clr7; p.v8=d.netrad_clr8;
plot_2d_12panel_new(p); %plot_2d_9panel_new(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LATEST ===Fig12=== TOA SWNET CLEAR FEEDBACK
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a0="AM4-W-"; a1=a0+"CM4P"; a2=a0+"ESM2P";
p.s1=a1+"1";   p.s2=a1+"2"; p.s3=a1+"3";
p.s4=a2+"1";   p.s5=a2+"2"; p.s6=a2+"3";
p.s7=a0+"CESS"; p.s8=a0+"CM4P4"; p.s9=a0+"ESM2ZM"; 
p.s1='AM4-CM4pattern2K-50';   
p.s2='AM4-CM4pattern2K-125';
p.s3='AM4-CM4pattern2K-125minus50';
p.s4='AM4-ESM2Mpattern2K-50';   
p.s5='AM4-ESM2Mpattern2K-125';
p.s6='AM4-ESM2Mpattern2K-125minus50';
p.s7='AM4-uniform2K';
p.s8='AM4-CM4pattern2K-125-modified';
p.tit='\DeltaSWCRE'; p.unit='W/m2/K';
p.vname='swcre_pattern'; p.vname='Fig12';
p.cmin1=-4; p.cmax1=4; p.cmin2=-4; p.cmax2=4;
p.lon=lon; p.lat=lat; p.lm=lm; id=(lm>1); p.co='k';
p.dT1=d.SWCF1; p.dT2=d.SWCF2; p.dT3=d.SWCF3; p.dT4=d.SWCF4; 
p.dT5=d.SWCF5; p.dT6=d.SWCF6; p.dT7=d.SWCF7; p.dT8=d.SWCF8; 
p.v1=d.swcf1; p.v2=d.swcf2; p.v3=d.swcf3;  p.v4=d.swcf4;
p.v5=d.swcf5; p.v6=d.swcf6; p.v7=d.swcf7;  p.v8=d.swcf8;
plot_2d_12panel_new(p); %plot_2d_9panel_new(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a0="AM4-W-"; a1=a0+"CM4P"; a2=a0+"ESM2P";
p.s1=a1+"1";   p.s2=a1+"2"; p.s3=a1+"3";
p.s4=a2+"1";   p.s5=a2+"2"; p.s6=a2+"3";
p.s7=a0+"CESS"; p.s8=a0+"CM4P4"; p.s9=a0+"ESM2ZM"; 
p.s1='AM4-CM4pattern2K-50';   
p.s2='AM4-CM4pattern2K-125';
p.s3='AM4-CM4pattern2K-125minus50';
p.s4='AM4-ESM2Mpattern2K-50';   
p.s5='AM4-ESM2Mpattern2K-125';
p.s6='AM4-ESM2Mpattern2K-125minus50';
p.s7='AM4-uniform2K';
p.s8='AM4-CM4pattern2K-125-modified';
p.tit='\DeltaLWCRE';p.unit='W/m2/K';
p.vname='lwcre_pattern';  p.cmin1=-4; p.cmax1=4; p.cmin2=-4; p.cmax2=4;
p.lon=lon; p.lat=lat; p.lm=lm; id=(lm>1); p.co='k';
p.dT1=d.LWCF1; p.dT2=d.LWCF2; p.dT3=d.LWCF3; p.dT4=d.LWCF4; 
p.dT5=d.LWCF5; p.dT6=d.LWCF6; p.dT7=d.LWCF7; p.dT8=d.LWCF8; 
p.v1=d.lwcf1; p.v2=d.lwcf2; p.v3=d.lwcf3;  p.v4=d.lwcf4;
p.v5=d.lwcf5; p.v6=d.lwcf6; p.v7=d.lwcf7;  p.v8=d.lwcf8;
plot_2d_12panel_new(p); %plot_2d_9panel_new(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LATEST ===Fig13=== LOW CLOUD FEEDBACK
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a0="AM4-W-"; a1=a0+"CM4P"; a2=a0+"ESM2P";
p.s1=a1+"1";   p.s2=a1+"2"; p.s3=a1+"3";
p.s4=a2+"1";   p.s5=a2+"2"; p.s6=a2+"3";
p.s7=a0+"CESS"; p.s8=a0+"CM4P4"; p.s9=a0+"ESM2ZM"; 
p.s1='AM4-CM4pattern2K-50';   
p.s2='AM4-CM4pattern2K-125';
p.s3='AM4-CM4pattern2K-125minus50';
p.s4='AM4-ESM2Mpattern2K-50';   
p.s5='AM4-ESM2Mpattern2K-125';
p.s6='AM4-ESM2Mpattern2K-125minus50';
p.s7='AM4-uniform2K';
p.s8='AM4-CM4pattern2K-125-modified';
p.tit='\DeltaLCLD';p.unit='  %';
p.vname='qal_pattern'; p.vname='Fig13';
p.cmin1=-4; p.cmax1=4; p.cmin2=-4; p.cmax2=4;
p.lon=lon; p.lat=lat; p.lm=lm; id=(lm>1); p.co='k';
p.dT1=d.QAL1; p.dT2=d.QAL2; p.dT3=d.QAL3; p.dT4=d.QAL4; 
p.dT5=d.QAL5; p.dT6=d.QAL6; p.dT7=d.QAL7; p.dT8=d.QAL8; 
p.v1=d.qal1; p.v2=d.qal2; p.v3=d.qal3;  p.v4=d.qal4;
p.v5=d.qal5; p.v6=d.qal6; p.v7=d.qal7;  p.v8=d.qal8;
plot_2d_12panel_new(p); %plot_2d_9panel_new(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a0="AM4-W-"; a1=a0+"CM4P"; a2=a0+"ESM2P";
p.s1=a1+"1";   p.s2=a1+"2"; p.s3=a1+"3";
p.s4=a2+"1";   p.s5=a2+"2"; p.s6=a2+"3";
p.s7=a0+"CESS"; p.s8=a0+"CM4P4"; p.s9=a0+"ESM2ZM"; 
p.s1='AM4-CM4pattern2K-50';   
p.s2='AM4-CM4pattern2K-125';
p.s3='AM4-CM4pattern2K-125minus50';
p.s4='AM4-ESM2Mpattern2K-50';   
p.s5='AM4-ESM2Mpattern2K-125';
p.s6='AM4-ESM2Mpattern2K-125minus50';
p.s7='AM4-uniform2K';
p.s8='AM4-CM4pattern2K-125-modified';
p.tit='\DeltaMiddle Cloud Amount';p.unit='%';
p.vname='qam_pattern';  p.cmin1=-4; p.cmax1=4; p.cmin2=-4; p.cmax2=4;
p.lon=lon; p.lat=lat; p.lm=lm; id=(lm>1); p.co='k';
p.dT1=d.QAM1; p.dT2=d.QAM2; p.dT3=d.QAM3; p.dT4=d.QAM4; 
p.dT5=d.QAM5; p.dT6=d.QAM6; p.dT7=d.QAM7; p.dT8=d.QAM8; 
p.v1=d.qam1; p.v2=d.qam2; p.v3=d.qam3;  p.v4=d.qam4;
p.v5=d.qam5; p.v6=d.qam6; p.v7=d.qam7;  p.v8=d.qam8;
plot_2d_12panel_new(p); %plot_2d_9panel_new(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a0="AM4-W-"; a1=a0+"CM4P"; a2=a0+"ESM2P";
p.s1=a1+"1";   p.s2=a1+"2"; p.s3=a1+"3";
p.s4=a2+"1";   p.s5=a2+"2"; p.s6=a2+"3";
p.s7=a0+"CESS"; p.s8=a0+"CM4P4"; p.s9=a0+"ESM2ZM"; 
p.s1='AM4-CM4pattern2K-50';   
p.s2='AM4-CM4pattern2K-125';
p.s3='AM4-CM4pattern2K-125minus50';
p.s4='AM4-ESM2Mpattern2K-50';   
p.s5='AM4-ESM2Mpattern2K-125';
p.s6='AM4-ESM2Mpattern2K-125minus50';
p.s7='AM4-uniform2K';
p.s8='AM4-CM4pattern2K-125-modified';
p.tit='\DeltaHigh Cloud Amount';p.unit='%';
p.vname='qah_pattern';  p.cmin1=-4; p.cmax1=4; p.cmin2=-4; p.cmax2=4;
p.lon=lon; p.lat=lat; p.lm=lm; id=(lm>1); p.co='k';
p.dT1=d.QAH1; p.dT2=d.QAH2; p.dT3=d.QAH3; p.dT4=d.QAH4; 
p.dT5=d.QAH5; p.dT6=d.QAH6; p.dT7=d.QAH7; p.dT8=d.QAH8; 
p.v1=d.qah1; p.v2=d.qah2; p.v3=d.qah3;  p.v4=d.qah4;
p.v5=d.qah5; p.v6=d.qah6; p.v7=d.qah7;  p.v8=d.qah8;
plot_2d_12panel_new(p); %plot_2d_9panel_new(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a0="AM4-W-"; a1=a0+"CM4P"; a2=a0+"ESM2P";
p.s1=a1+"1";   p.s2=a1+"2"; p.s3=a1+"3";
p.s4=a2+"1";   p.s5=a2+"2"; p.s6=a2+"3";
p.s7=a0+"CESS"; p.s8=a0+"CM4P4"; p.s9=a0+"ESM2ZM"; 
p.s1='AM4-CM4pattern2K-50';   
p.s2='AM4-CM4pattern2K-125';
p.s3='AM4-CM4pattern2K-125minus50';
p.s4='AM4-ESM2Mpattern2K-50';   
p.s5='AM4-ESM2Mpattern2K-125';
p.s6='AM4-ESM2Mpattern2K-125minus50';
p.s7='AM4-uniform2K';
p.s8='AM4-CM4pattern2K-125-modified';
p.tit='\DeltaLiquid Water Vapor';p.unit='kg/m2';
p.vname='lwp_pattern';  
p.cmin1=-0.01; p.cmax1=0.01; p.cmin2=-0.01; p.cmax2=0.01;
p.lon=lon; p.lat=lat; p.lm=lm; id=(lm>1); p.co='k';
p.dT1=d.LWP1; p.dT2=d.LWP2; p.dT3=d.LWP3; p.dT4=d.LWP4; 
p.dT5=d.LWP5; p.dT6=d.LWP6; p.dT7=d.LWP7; p.dT8=d.LWP8; 
p.v1=d.lwp1; p.v2=d.lwp2; p.v3=d.lwp3;  p.v4=d.lwp4;
p.v5=d.lwp5; p.v6=d.lwp6; p.v7=d.lwp7;  p.v8=d.lwp8;
plot_2d_12panel_new(p); %plot_2d_9panel_new(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a0="AM4-W-"; a1=a0+"CM4P"; a2=a0+"ESM2P";
p.s1=a1+"1";   p.s2=a1+"2"; p.s3=a1+"3";
p.s4=a2+"1";   p.s5=a2+"2"; p.s6=a2+"3";
p.s7=a0+"CESS"; p.s8=a0+"CM4P4"; p.s9=a0+"ESM2ZM"; 
p.s1='AM4-CM4pattern2K-50';   
p.s2='AM4-CM4pattern2K-125';
p.s3='AM4-CM4pattern2K-125minus50';
p.s4='AM4-ESM2Mpattern2K-50';   
p.s5='AM4-ESM2Mpattern2K-125';
p.s6='AM4-ESM2Mpattern2K-125minus50';
p.s7='AM4-uniform2K';
p.s8='AM4-CM4pattern2K-125-modified';
p.tit='\DeltaIce Water Vapor';p.unit='kg/m2';
p.vname='iwp_pattern';  
p.cmin1=-0.01; p.cmax1=0.01; p.cmin2=-0.01; p.cmax2=0.01;
p.lon=lon; p.lat=lat; p.lm=lm; id=(lm>1); p.co='k';
p.dT1=d.IWP1; p.dT2=d.IWP2; p.dT3=d.IWP3; p.dT4=d.IWP4; 
p.dT5=d.IWP5; p.dT6=d.IWP6; p.dT7=d.IWP7; p.dT8=d.IWP8; 
p.v1=d.iwp1; p.v2=d.iwp2; p.v3=d.iwp3;  p.v4=d.iwp4;
p.v5=d.iwp5; p.v6=d.iwp6; p.v7=d.iwp7;  p.v8=d.iwp8;
plot_2d_12panel_new(p); %plot_2d_9panel_new(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




cmin1=-1; cmax1=2; cmin2=-3; cmax2=3; cmin3=-3; cmax3=3; cmin4=-3; cmax4=3;
pms=[ 0, 0, 1200, 600]*1; fsize=8; row=3; col=3;
handle = figure('Position', pms,'visible','on'); colormap(jet); i=1;
subplot(row,col,i); a=d.tref1; b=d.dT1; sx=let(i)+s1; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.tref2; b=d.dT2; sx=let(i)+s2; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.tref1-d.tref2; b=d.dT1-d.dT2; sx=let(i); i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-0.5 0.5]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (a) minus (b) (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=d.tref3; b=d.dT3; sx=let(i)+s3; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.tref4; b=d.dT4; sx=let(i)+s4; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.tref3-d.tref4; b=d.dT3-d.dT4; sx=let(i); i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-0.5 0.5]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (d) minus (e) (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=d.tref3-d.tref1; b=d.dT3-d.dT1; sx=let(i); i=i+1;a1=a;b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-0.5 0.5]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (d) minus (a) (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.tref4-d.tref2; b=d.dT4-d.dT2; sx=let(i); i=i+1;a2=a;b2=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-0.5 0.5]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (e) minus (b) (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=a1-a2; b=b1-b2; sx=let(i); i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-0.5 0.5]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (g) minus (h) (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


subplot(row,col,i); a=d.netrad1; b=d.n1; sx=let(i)+s1; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaN=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.netrad2; b=d.n2; sx=let(i)+s2; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaN=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.netrad3; b=d.n3; sx=let(i)+s3; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaN=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.netrad4; b=d.n4; sx=let(i)+s4; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaN=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=d.ttcf1; b=d.cf1; sx=let(i)+s1; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin3 cmax3]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaTCRE=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.ttcf2; b=d.cf2; sx=let(i)+s2; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin3 cmax3]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaTCRE=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.ttcf3; b=d.cf3; sx=let(i)+s3; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin3 cmax3]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaTCRE=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.ttcf4; b=d.cf4; sx=let(i)+s4; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin3 cmax3]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaTCRE=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=d.netrad_clr1; b=d.cl1; sx=let(i)+s1; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin4 cmax4]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaRCLR=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.netrad_clr2; b=d.cl2; sx=let(i)+s2; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin4 cmax4]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaRCLR=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.netrad_clr3; b=d.cl3; sx=let(i)+s3; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin4 cmax4]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaRCLR=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.netrad_clr4; b=d.cl4; sx=let(i)+s4; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin4 cmax4]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaRCLR=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
vname='pattern_effect'; opt=0; color='w';
cmin1=-1; cmax1=2; cmin2=-3; cmax2=3; cmin3=-3; cmax3=3; cmin4=-3; cmax4=3;
pms=[ 0, 0, 1600, 1000]*1; fsize=8; row=4; col=4;
handle = figure('Position', pms,'visible','on'); colormap(jet); i=1;
subplot(row,col,i); a=d.tref1; b=d.dT1; sx=let(i)+s1; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.tref2; b=d.dT2; sx=let(i)+s2; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.tref3; b=d.dT3; sx=let(i)+s3; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.tref4; b=d.dT4; sx=let(i)+s4; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=d.netrad1; b=d.n1; sx=let(i)+s1; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaN=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.netrad2; b=d.n2; sx=let(i)+s2; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaN=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.netrad3; b=d.n3; sx=let(i)+s3; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaN=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.netrad4; b=d.n4; sx=let(i)+s4; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaN=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=d.ttcf1; b=d.cf1; sx=let(i)+s1; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin3 cmax3]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaTCRE=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.ttcf2; b=d.cf2; sx=let(i)+s2; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin3 cmax3]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaTCRE=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.ttcf3; b=d.cf3; sx=let(i)+s3; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin3 cmax3]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaTCRE=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.ttcf4; b=d.cf4; sx=let(i)+s4; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin3 cmax3]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaTCRE=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=d.netrad_clr1; b=d.cl1; sx=let(i)+s1; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin4 cmax4]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaRCLR=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.netrad_clr2; b=d.cl2; sx=let(i)+s2; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin4 cmax4]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaRCLR=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.netrad_clr3; b=d.cl3; sx=let(i)+s3; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin4 cmax4]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaRCLR=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=d.netrad_clr4; b=d.cl4; sx=let(i)+s4; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin4 cmax4]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (\\DeltaRCLR=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pattern_effect'; opt=0; color='w';
cmin1=-1; cmax1=2; cmin2=-3; cmax2=3; cmin3=-3; cmax3=3; cmin4=-3; cmax4=3;
pms=[ 0, 0, 1600, 1000]*1; fsize=8; row=4; col=4;
handle = figure('Position', pms,'visible','on'); colormap(jet); i=1;
subplot(row,col,i); i=i+1; a=d.tref1; b=d.dT1; sx=s1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color);
s=sprintf('(a) %s (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); i=i+1; a=d.tref2; b=d.dT2; sx=s2;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color);
s=sprintf('(b) %s (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); i=i+1; a=d.tref3; b=d.dT3; sx=s3;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color);
s=sprintf('(c) %s (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); i=i+1; a=d.tref4; b=d.dT4; sx=s4;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color);
s=sprintf('(d) %s (\\DeltaT=%4.2f K)',sx,b); title(s,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); i=i+1; a=d.netrad1; b=d.n1; sx=s1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,color);
s=sprintf('(e) %s (\\DeltaN=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); i=i+1; a=d.netrad2; b=d.n2; sx=s2;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,color);
s=sprintf('(f) %s (\\DeltaN=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); i=i+1; a=d.netrad3; b=d.n3; sx=s3;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,color);
s=sprintf('(g) %s (\\DeltaN=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); i=i+1; a=d.netrad4; b=d.n4; sx=s4;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,color);
s=sprintf('(h) %s (\\DeltaN=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); i=i+1; a=d.ttcf1; b=d.cf1; sx=s1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin3 cmax3]);
contour(lon,lat,lm,1,color);
s=sprintf('(i) %s (\\DeltaTCRE=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); i=i+1; a=d.ttcf2; b=d.cf2; sx=s2;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin3 cmax3]);
contour(lon,lat,lm,1,color);
s=sprintf('(j) %s (\\DeltaTCRE=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); i=i+1; a=d.ttcf3; b=d.cf3; sx=s3;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin3 cmax3]);
contour(lon,lat,lm,1,color);
s=sprintf('(k) %s (\\DeltaTCRE=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); i=i+1; a=d.ttcf4; b=d.cf4; sx=s4;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin3 cmax3]);
contour(lon,lat,lm,1,color);
s=sprintf('(l) %s (\\DeltaTCRE=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); i=i+1; a=d.netrad_clr1; b=d.cl1; sx=s1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin4 cmax4]);
contour(lon,lat,lm,1,color);
s=sprintf('(m) %s (\\DeltaR-clr=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); i=i+1; a=d.netrad_clr2; b=d.cl2; sx=s2;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin4 cmax4]);
contour(lon,lat,lm,1,color);
s=sprintf('(n) %s (\\DeltaR-clr=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); i=i+1; a=d.netrad_clr3; b=d.cl3; sx=s3;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin4 cmax4]);
contour(lon,lat,lm,1,color);
s=sprintf('(o) %s (\\DeltaR-clr=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
subplot(row,col,i); i=i+1; a=d.netrad_clr4; b=d.cl4; sx=s4;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin4 cmax4]);
contour(lon,lat,lm,1,color);
s=sprintf('(p) %s (\\DeltaR-clr=%4.2f W/m2/K)',sx,b); title(s,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pattern_effect'; opt=0; 
cmin=-1; cmax=2; vbin=[cmin:0.01:cmax]; color='w';
pms=[ 0, 0, 1500, 700]*1; fsize=8; row=4; col=4;
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); a=dTAS.tref1; b=dTAS.g1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(a) %s; (%4.2f K)',s1,b); title(s,'FontSize',fsize);

subplot(row,col,2); a=dTAS.tref2; b=dTAS.g2;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(b) %s; (%4.2f K)',s2,b); title(s,'FontSize',fsize);

subplot(row,col,3); a=dTAS.tref3; b=dTAS.g3;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(c) %s; (%4.2f K)',s3,b); title(s,'FontSize',fsize);

subplot(row,col,4); a=dTAS.tref4; b=dTAS.g4;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(d) %s; (%4.2f K)',s4,b); title(s,'FontSize',fsize);

subplot(row,col,5); a=dTAS.tref5; b=dTAS.g5;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('%s; (%4.2f K)',s5,b); title(s,'FontSize',fsize);

subplot(row,col,6); a=dTAS.tref6; b=dTAS.g6;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('%s; (%4.2f K)',s6,b); title(s,'FontSize',fsize);

subplot(row,col,7); a=dTAS.tref2-dTAS.tref3; b=dTAS.g2-dTAS.g3;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-1 1]);
contour(lon,lat,lm,1,color);
s=sprintf('%s; (%4.2f W/m2/K)',s1,b); title(s,'FontSize',fsize);

subplot(row,col,9); a=dTOA.netrad1; b=dTOA.g1;cmin=-5;cmax=2;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('%s; (%4.2f W/m2/K)',s1,b); title(s,'FontSize',fsize);

subplot(row,col,10); a=dTOA.netrad2; b=dTOA.g2;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('%s; (%4.2f W/m2/K)',s1,b); title(s,'FontSize',fsize);

subplot(row,col,11); a=dTOA.netrad3; b=dTOA.g3;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('%s; (%4.2f W/m2/K)',s1,b); title(s,'FontSize',fsize);

subplot(row,col,12); a=dTOA.netrad4; b=dTOA.g4;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('%s; (%4.2f W/m2/K)',s1,b); title(s,'FontSize',fsize);

subplot(row,col,13); a=dTOA.netrad4-dTOA.netrad1; b=dTOA.g4-dTOA.g1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-1 1]);
contour(lon,lat,lm,1,color);
s=sprintf('%s; (%4.2f W/m2/K)',s1,b); title(s,'FontSize',fsize);

subplot(row,col,14); a=dTAS.tref4-dTAS.tref1; b=dTAS.g4-dTAS.g1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-1 1]);
contour(lon,lat,lm,1,color);
s=sprintf('%s; (%4.2f W/m2/K)',s1,b); title(s,'FontSize',fsize);


