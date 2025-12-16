function d=load_sst_pattern(a40)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ts: surface skin T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=a40.c0; d.Ts0=mean(v.sfc.tsurf.ann_stat.mmen.all); a=d.Ts0;
v=a40.A0; d.Ts1=mean(v.sfc.tsurf.ann_stat.mmen.all)-a;
v=a40.B0; d.Ts2=mean(v.sfc.tsurf.ann_stat.mmen.all)-a;
v=a40.C0; d.Ts3=mean(v.sfc.tsurf.ann_stat.mmen.all)-a;
v=a40.D0; d.Ts4=mean(v.sfc.tsurf.ann_stat.mmen.all)-a;
v=a40.E0; d.Ts5=mean(v.sfc.tsurf.ann_stat.mmen.all)-a;
v=a40.F0; d.Ts6=mean(v.sfc.tsurf.ann_stat.mmen.all)-a;
v=a40.P0; d.Ts7=mean(v.sfc.tsurf.ann_stat.mmen.all)-a;
v=a40.P1; d.Ts8=mean(v.sfc.tsurf.ann_stat.mmen.all)-a;
v=a40.c0; d.ts0= v.sfc.tsurf.tavg0; a=d.ts0;
v=a40.A0; d.ts1=(v.sfc.tsurf.tavg0-a);%/d.Ts1;
v=a40.B0; d.ts2=(v.sfc.tsurf.tavg0-a);%/d.Ts2;
v=a40.C0; d.ts3=(v.sfc.tsurf.tavg0-a);%/d.Ts3;
v=a40.D0; d.ts4=(v.sfc.tsurf.tavg0-a);%/d.Ts4;
v=a40.E0; d.ts5=(v.sfc.tsurf.tavg0-a);%/d.Ts5;
v=a40.F0; d.ts6=(v.sfc.tsurf.tavg0-a);%/d.Ts6;
v=a40.P0; d.ts7=(v.sfc.tsurf.tavg0-a);%/d.Ts7;
v=a40.P1; d.ts8=(v.sfc.tsurf.tavg0-a);%/d.Ts8;

s=a40.c0.s; lm=s.lm0; aa=s.aa; imk=a40.c0.sfc.ice.clm; d.imk=squeeze(mean(imk,1));
v=a40.c0; a=v.sfc.tsurf.clm; d.sst0=compute_gocean_sst(a,imk,lm,aa);
v=a40.A0; a=v.sfc.tsurf.clm; d.sst1=compute_gocean_sst(a,imk,lm,aa);d.sst1=d.sst1-d.sst0;
v=a40.B0; a=v.sfc.tsurf.clm; d.sst2=compute_gocean_sst(a,imk,lm,aa);d.sst2=d.sst2-d.sst0;
v=a40.C0; a=v.sfc.tsurf.clm; d.sst3=compute_gocean_sst(a,imk,lm,aa);d.sst3=d.sst3-d.sst0;
v=a40.D0; a=v.sfc.tsurf.clm; d.sst4=compute_gocean_sst(a,imk,lm,aa);d.sst4=d.sst4-d.sst0;
v=a40.E0; a=v.sfc.tsurf.clm; d.sst5=compute_gocean_sst(a,imk,lm,aa);d.sst5=d.sst5-d.sst0;
v=a40.F0; a=v.sfc.tsurf.clm; d.sst6=compute_gocean_sst(a,imk,lm,aa);d.sst6=d.sst6-d.sst0;
v=a40.P0; a=v.sfc.tsurf.clm; d.sst7=compute_gocean_sst(a,imk,lm,aa);d.sst7=d.sst7-d.sst0;
v=a40.P1; a=v.sfc.tsurf.clm; d.sst8=compute_gocean_sst(a,imk,lm,aa);d.sst8=d.sst8-d.sst0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ta: surface air T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=a40.c0; d.Ta0=mean(v.sfc.tref.ann_stat.mmen.all); a=d.Ta0;
v=a40.A0; d.Ta1=mean(v.sfc.tref.ann_stat.mmen.all)-a;
v=a40.B0; d.Ta2=mean(v.sfc.tref.ann_stat.mmen.all)-a;
v=a40.C0; d.Ta3=mean(v.sfc.tref.ann_stat.mmen.all)-a;
v=a40.D0; d.Ta4=mean(v.sfc.tref.ann_stat.mmen.all)-a;
v=a40.E0; d.Ta5=mean(v.sfc.tref.ann_stat.mmen.all)-a;
v=a40.F0; d.Ta6=mean(v.sfc.tref.ann_stat.mmen.all)-a;
v=a40.P0; d.Ta7=mean(v.sfc.tref.ann_stat.mmen.all)-a;
v=a40.P1; d.Ta8=mean(v.sfc.tref.ann_stat.mmen.all)-a;
v=a40.c0; d.ta0= v.sfc.tref.tavg0; a=d.ta0;
v=a40.A0; d.ta1=(v.sfc.tref.tavg0-a)/d.Ta1;
v=a40.B0; d.ta2=(v.sfc.tref.tavg0-a)/d.Ta2;
v=a40.C0; d.ta3=(v.sfc.tref.tavg0-a)/d.Ta3;
v=a40.D0; d.ta4=(v.sfc.tref.tavg0-a)/d.Ta4;
v=a40.E0; d.ta5=(v.sfc.tref.tavg0-a)/d.Ta5;
v=a40.F0; d.ta6=(v.sfc.tref.tavg0-a)/d.Ta6;
v=a40.P0; d.ta7=(v.sfc.tref.tavg0-a)/d.Ta7;
v=a40.P1; d.ta8=(v.sfc.tref.tavg0-a)/d.Ta8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%N: TOA netrad
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=a40.c0; d.N0=mean(v.toa.netrad.ann_stat.mmen.all); a=d.N0;
v=a40.A0; d.N1=mean(v.toa.netrad.ann_stat.mmen.all)-a; d.n1=d.N1/d.Ta1;
v=a40.B0; d.N2=mean(v.toa.netrad.ann_stat.mmen.all)-a; d.n2=d.N2/d.Ta2;
v=a40.C0; d.N3=mean(v.toa.netrad.ann_stat.mmen.all)-a; d.n3=d.N3/d.Ta3;
v=a40.D0; d.N4=mean(v.toa.netrad.ann_stat.mmen.all)-a; d.n4=d.N4/d.Ta4;;
v=a40.E0; d.N5=mean(v.toa.netrad.ann_stat.mmen.all)-a; d.n5=d.N5/d.Ta5;
v=a40.F0; d.N6=mean(v.toa.netrad.ann_stat.mmen.all)-a; d.n6=d.N6/d.Ta6;;
v=a40.P0; d.N7=mean(v.toa.netrad.ann_stat.mmen.all)-a; d.n7=d.N7/d.Ta7;;
v=a40.P1; d.N8=mean(v.toa.netrad.ann_stat.mmen.all)-a; d.n8=d.N8/d.Ta8;;
v=a40.c0; d.netrad0= v.toa.netrad.tavg0; a=d.netrad0;
v=a40.A0; d.netrad1=(v.toa.netrad.tavg0-a)/d.Ta1;
v=a40.B0; d.netrad2=(v.toa.netrad.tavg0-a)/d.Ta2;
v=a40.C0; d.netrad3=(v.toa.netrad.tavg0-a)/d.Ta3;
v=a40.D0; d.netrad4=(v.toa.netrad.tavg0-a)/d.Ta4;
v=a40.E0; d.netrad5=(v.toa.netrad.tavg0-a)/d.Ta5;
v=a40.F0; d.netrad6=(v.toa.netrad.tavg0-a)/d.Ta6;
v=a40.P0; d.netrad7=(v.toa.netrad.tavg0-a)/d.Ta7;
v=a40.P1; d.netrad8=(v.toa.netrad.tavg0-a)/d.Ta8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE: TOA net CRE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=a40.c0; d.TTCF0=mean(v.toa.ttcf.ann_stat.mmen.all); a=d.TTCF0;
v=a40.A0; d.TTCF1=mean(v.toa.ttcf.ann_stat.mmen.all)-a; d.TTCF1=d.TTCF1/d.Ta1;
v=a40.B0; d.TTCF2=mean(v.toa.ttcf.ann_stat.mmen.all)-a; d.TTCF2=d.TTCF2/d.Ta2;
v=a40.C0; d.TTCF3=mean(v.toa.ttcf.ann_stat.mmen.all)-a; d.TTCF3=d.TTCF3/d.Ta3;
v=a40.D0; d.TTCF4=mean(v.toa.ttcf.ann_stat.mmen.all)-a; d.TTCF4=d.TTCF4/d.Ta4;;
v=a40.E0; d.TTCF5=mean(v.toa.ttcf.ann_stat.mmen.all)-a; d.TTCF5=d.TTCF5/d.Ta5;
v=a40.F0; d.TTCF6=mean(v.toa.ttcf.ann_stat.mmen.all)-a; d.TTCF6=d.TTCF6/d.Ta6;;
v=a40.P0; d.TTCF7=mean(v.toa.ttcf.ann_stat.mmen.all)-a; d.TTCF7=d.TTCF7/d.Ta7;;
v=a40.P1; d.TTCF8=mean(v.toa.ttcf.ann_stat.mmen.all)-a; d.TTCF8=d.TTCF8/d.Ta8;;
v=a40.c0; d.ttcf0= v.toa.ttcf.tavg0; a=d.ttcf0;
v=a40.A0; d.ttcf1=(v.toa.ttcf.tavg0-a)/d.Ta1;
v=a40.B0; d.ttcf2=(v.toa.ttcf.tavg0-a)/d.Ta2;
v=a40.C0; d.ttcf3=(v.toa.ttcf.tavg0-a)/d.Ta3;
v=a40.D0; d.ttcf4=(v.toa.ttcf.tavg0-a)/d.Ta4;
v=a40.E0; d.ttcf5=(v.toa.ttcf.tavg0-a)/d.Ta5;
v=a40.F0; d.ttcf6=(v.toa.ttcf.tavg0-a)/d.Ta6;
v=a40.P0; d.ttcf7=(v.toa.ttcf.tavg0-a)/d.Ta7;
v=a40.P1; d.ttcf8=(v.toa.ttcf.tavg0-a)/d.Ta8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CL: TOA net clear-sky
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=a40.c0; d.CL0=mean(v.toa.netrad_clr.ann_stat.mmen.all); a=d.CL0;
v=a40.A0; d.CL1=mean(v.toa.netrad_clr.ann_stat.mmen.all)-a; d.cl1=d.CL1/d.Ta1;
v=a40.B0; d.CL2=mean(v.toa.netrad_clr.ann_stat.mmen.all)-a; d.cl2=d.CL2/d.Ta2;
v=a40.C0; d.CL3=mean(v.toa.netrad_clr.ann_stat.mmen.all)-a; d.cl3=d.CL3/d.Ta3;
v=a40.D0; d.CL4=mean(v.toa.netrad_clr.ann_stat.mmen.all)-a; d.cl4=d.CL4/d.Ta4;;
v=a40.E0; d.CL5=mean(v.toa.netrad_clr.ann_stat.mmen.all)-a; d.cl5=d.CL5/d.Ta5;
v=a40.F0; d.CL6=mean(v.toa.netrad_clr.ann_stat.mmen.all)-a; d.cl6=d.CL6/d.Ta6;;
v=a40.P0; d.CL7=mean(v.toa.netrad_clr.ann_stat.mmen.all)-a; d.cl7=d.CL7/d.Ta7;;
v=a40.P1; d.CL8=mean(v.toa.netrad_clr.ann_stat.mmen.all)-a; d.cl8=d.CL8/d.Ta8;;
v=a40.c0; d.netrad_clr0= v.toa.netrad_clr.tavg0; a=d.netrad_clr0;
v=a40.A0; d.netrad_clr1=(v.toa.netrad_clr.tavg0-a)/d.Ta1;
v=a40.B0; d.netrad_clr2=(v.toa.netrad_clr.tavg0-a)/d.Ta2;
v=a40.C0; d.netrad_clr3=(v.toa.netrad_clr.tavg0-a)/d.Ta3;
v=a40.D0; d.netrad_clr4=(v.toa.netrad_clr.tavg0-a)/d.Ta4;
v=a40.E0; d.netrad_clr5=(v.toa.netrad_clr.tavg0-a)/d.Ta5;
v=a40.F0; d.netrad_clr6=(v.toa.netrad_clr.tavg0-a)/d.Ta6;
v=a40.P0; d.netrad_clr7=(v.toa.netrad_clr.tavg0-a)/d.Ta7;
v=a40.P1; d.netrad_clr8=(v.toa.netrad_clr.tavg0-a)/d.Ta8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SWCRE: TOA net SW CRE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=a40.c0; d.SWCF0=mean(v.toa.swcf.ann_stat.mmen.all); a=d.SWCF0;
v=a40.A0; d.SWCF1=mean(v.toa.swcf.ann_stat.mmen.all)-a; d.SWCF1=d.SWCF1/d.Ta1;
v=a40.B0; d.SWCF2=mean(v.toa.swcf.ann_stat.mmen.all)-a; d.SWCF2=d.SWCF2/d.Ta2;
v=a40.C0; d.SWCF3=mean(v.toa.swcf.ann_stat.mmen.all)-a; d.SWCF3=d.SWCF3/d.Ta3;
v=a40.D0; d.SWCF4=mean(v.toa.swcf.ann_stat.mmen.all)-a; d.SWCF4=d.SWCF4/d.Ta4;;
v=a40.E0; d.SWCF5=mean(v.toa.swcf.ann_stat.mmen.all)-a; d.SWCF5=d.SWCF5/d.Ta5;
v=a40.F0; d.SWCF6=mean(v.toa.swcf.ann_stat.mmen.all)-a; d.SWCF6=d.SWCF6/d.Ta6;;
v=a40.P0; d.SWCF7=mean(v.toa.swcf.ann_stat.mmen.all)-a; d.SWCF7=d.SWCF7/d.Ta7;;
v=a40.P1; d.SWCF8=mean(v.toa.swcf.ann_stat.mmen.all)-a; d.SWCF8=d.SWCF8/d.Ta8;;
v=a40.c0; d.swcf0= v.toa.swcf.tavg0; a=d.swcf0;
v=a40.A0; d.swcf1=(v.toa.swcf.tavg0-a)/d.Ta1;
v=a40.B0; d.swcf2=(v.toa.swcf.tavg0-a)/d.Ta2;
v=a40.C0; d.swcf3=(v.toa.swcf.tavg0-a)/d.Ta3;
v=a40.D0; d.swcf4=(v.toa.swcf.tavg0-a)/d.Ta4;
v=a40.E0; d.swcf5=(v.toa.swcf.tavg0-a)/d.Ta5;
v=a40.F0; d.swcf6=(v.toa.swcf.tavg0-a)/d.Ta6;
v=a40.P0; d.swcf7=(v.toa.swcf.tavg0-a)/d.Ta7;
v=a40.P1; d.swcf8=(v.toa.swcf.tavg0-a)/d.Ta8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LWCRE: TOA net LW CRE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=a40.c0; d.LWCF0=mean(v.toa.lwcf.ann_stat.mmen.all); a=d.LWCF0;
v=a40.A0; d.LWCF1=mean(v.toa.lwcf.ann_stat.mmen.all)-a; d.LWCF1=d.LWCF1/d.Ta1;
v=a40.B0; d.LWCF2=mean(v.toa.lwcf.ann_stat.mmen.all)-a; d.LWCF2=d.LWCF2/d.Ta2;
v=a40.C0; d.LWCF3=mean(v.toa.lwcf.ann_stat.mmen.all)-a; d.LWCF3=d.LWCF3/d.Ta3;
v=a40.D0; d.LWCF4=mean(v.toa.lwcf.ann_stat.mmen.all)-a; d.LWCF4=d.LWCF4/d.Ta4;;
v=a40.E0; d.LWCF5=mean(v.toa.lwcf.ann_stat.mmen.all)-a; d.LWCF5=d.LWCF5/d.Ta5;
v=a40.F0; d.LWCF6=mean(v.toa.lwcf.ann_stat.mmen.all)-a; d.LWCF6=d.LWCF6/d.Ta6;;
v=a40.P0; d.LWCF7=mean(v.toa.lwcf.ann_stat.mmen.all)-a; d.LWCF7=d.LWCF7/d.Ta7;;
v=a40.P1; d.LWCF8=mean(v.toa.lwcf.ann_stat.mmen.all)-a; d.LWCF8=d.LWCF8/d.Ta8;;
v=a40.c0; d.lwcf0= v.toa.lwcf.tavg0; a=d.lwcf0;
v=a40.A0; d.lwcf1=(v.toa.lwcf.tavg0-a)/d.Ta1;
v=a40.B0; d.lwcf2=(v.toa.lwcf.tavg0-a)/d.Ta2;
v=a40.C0; d.lwcf3=(v.toa.lwcf.tavg0-a)/d.Ta3;
v=a40.D0; d.lwcf4=(v.toa.lwcf.tavg0-a)/d.Ta4;
v=a40.E0; d.lwcf5=(v.toa.lwcf.tavg0-a)/d.Ta5;
v=a40.F0; d.lwcf6=(v.toa.lwcf.tavg0-a)/d.Ta6;
v=a40.P0; d.lwcf7=(v.toa.lwcf.tavg0-a)/d.Ta7;
v=a40.P1; d.lwcf8=(v.toa.lwcf.tavg0-a)/d.Ta8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%QAL: Low cloud amount
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=a40.c0; d.QAL0=mean(v.atm.qal.ann_stat.mmen.all); a=d.QAL0;
v=a40.A0; d.QAL1=mean(v.atm.qal.ann_stat.mmen.all)-a; d.QAL1=d.QAL1/d.Ta1;
v=a40.B0; d.QAL2=mean(v.atm.qal.ann_stat.mmen.all)-a; d.QAL2=d.QAL2/d.Ta2;
v=a40.C0; d.QAL3=mean(v.atm.qal.ann_stat.mmen.all)-a; d.QAL3=d.QAL3/d.Ta3;
v=a40.D0; d.QAL4=mean(v.atm.qal.ann_stat.mmen.all)-a; d.QAL4=d.QAL4/d.Ta4;;
v=a40.E0; d.QAL5=mean(v.atm.qal.ann_stat.mmen.all)-a; d.QAL5=d.QAL5/d.Ta5;
v=a40.F0; d.QAL6=mean(v.atm.qal.ann_stat.mmen.all)-a; d.QAL6=d.QAL6/d.Ta6;;
v=a40.P0; d.QAL7=mean(v.atm.qal.ann_stat.mmen.all)-a; d.QAL7=d.QAL7/d.Ta7;;
v=a40.P1; d.QAL8=mean(v.atm.qal.ann_stat.mmen.all)-a; d.QAL8=d.QAL8/d.Ta8;;
v=a40.c0; d.qal0= v.atm.qal.tavg0; a=d.qal0;
v=a40.A0; d.qal1=(v.atm.qal.tavg0-a)/d.Ta1;
v=a40.B0; d.qal2=(v.atm.qal.tavg0-a)/d.Ta2;
v=a40.C0; d.qal3=(v.atm.qal.tavg0-a)/d.Ta3;
v=a40.D0; d.qal4=(v.atm.qal.tavg0-a)/d.Ta4;
v=a40.E0; d.qal5=(v.atm.qal.tavg0-a)/d.Ta5;
v=a40.F0; d.qal6=(v.atm.qal.tavg0-a)/d.Ta6;
v=a40.P0; d.qal7=(v.atm.qal.tavg0-a)/d.Ta7;
v=a40.P1; d.qal8=(v.atm.qal.tavg0-a)/d.Ta8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%QAL: middle cloud amount
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=a40.c0; d.QAM0=mean(v.atm.qam.ann_stat.mmen.all); a=d.QAM0;
v=a40.A0; d.QAM1=mean(v.atm.qam.ann_stat.mmen.all)-a; d.QAM1=d.QAM1/d.Ta1;
v=a40.B0; d.QAM2=mean(v.atm.qam.ann_stat.mmen.all)-a; d.QAM2=d.QAM2/d.Ta2;
v=a40.C0; d.QAM3=mean(v.atm.qam.ann_stat.mmen.all)-a; d.QAM3=d.QAM3/d.Ta3;
v=a40.D0; d.QAM4=mean(v.atm.qam.ann_stat.mmen.all)-a; d.QAM4=d.QAM4/d.Ta4;;
v=a40.E0; d.QAM5=mean(v.atm.qam.ann_stat.mmen.all)-a; d.QAM5=d.QAM5/d.Ta5;
v=a40.F0; d.QAM6=mean(v.atm.qam.ann_stat.mmen.all)-a; d.QAM6=d.QAM6/d.Ta6;;
v=a40.P0; d.QAM7=mean(v.atm.qam.ann_stat.mmen.all)-a; d.QAM7=d.QAM7/d.Ta7;;
v=a40.P1; d.QAM8=mean(v.atm.qam.ann_stat.mmen.all)-a; d.QAM8=d.QAM8/d.Ta8;;
v=a40.c0; d.qam0= v.atm.qam.tavg0; a=d.qam0;
v=a40.A0; d.qam1=(v.atm.qam.tavg0-a)/d.Ta1;
v=a40.B0; d.qam2=(v.atm.qam.tavg0-a)/d.Ta2;
v=a40.C0; d.qam3=(v.atm.qam.tavg0-a)/d.Ta3;
v=a40.D0; d.qam4=(v.atm.qam.tavg0-a)/d.Ta4;
v=a40.E0; d.qam5=(v.atm.qam.tavg0-a)/d.Ta5;
v=a40.F0; d.qam6=(v.atm.qam.tavg0-a)/d.Ta6;
v=a40.P0; d.qam7=(v.atm.qam.tavg0-a)/d.Ta7;
v=a40.P1; d.qam8=(v.atm.qam.tavg0-a)/d.Ta8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%QAL: high cloud amount
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=a40.c0; d.QAH0=mean(v.atm.qah.ann_stat.mmen.all); a=d.QAH0;
v=a40.A0; d.QAH1=mean(v.atm.qah.ann_stat.mmen.all)-a; d.QAH1=d.QAH1/d.Ta1;
v=a40.B0; d.QAH2=mean(v.atm.qah.ann_stat.mmen.all)-a; d.QAH2=d.QAH2/d.Ta2;
v=a40.C0; d.QAH3=mean(v.atm.qah.ann_stat.mmen.all)-a; d.QAH3=d.QAH3/d.Ta3;
v=a40.D0; d.QAH4=mean(v.atm.qah.ann_stat.mmen.all)-a; d.QAH4=d.QAH4/d.Ta4;;
v=a40.E0; d.QAH5=mean(v.atm.qah.ann_stat.mmen.all)-a; d.QAH5=d.QAH5/d.Ta5;
v=a40.F0; d.QAH6=mean(v.atm.qah.ann_stat.mmen.all)-a; d.QAH6=d.QAH6/d.Ta6;;
v=a40.P0; d.QAH7=mean(v.atm.qah.ann_stat.mmen.all)-a; d.QAH7=d.QAH7/d.Ta7;;
v=a40.P1; d.QAH8=mean(v.atm.qah.ann_stat.mmen.all)-a; d.QAH8=d.QAH8/d.Ta8;;
v=a40.c0; d.qah0= v.atm.qah.tavg0; a=d.qah0;
v=a40.A0; d.qah1=(v.atm.qah.tavg0-a)/d.Ta1;
v=a40.B0; d.qah2=(v.atm.qah.tavg0-a)/d.Ta2;
v=a40.C0; d.qah3=(v.atm.qah.tavg0-a)/d.Ta3;
v=a40.D0; d.qah4=(v.atm.qah.tavg0-a)/d.Ta4;
v=a40.E0; d.qah5=(v.atm.qah.tavg0-a)/d.Ta5;
v=a40.F0; d.qah6=(v.atm.qah.tavg0-a)/d.Ta6;
v=a40.P0; d.qah7=(v.atm.qah.tavg0-a)/d.Ta7;
v=a40.P1; d.qah8=(v.atm.qah.tavg0-a)/d.Ta8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LWP: LWP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=a40.c0; d.LWP0=mean(v.atm.lwp.ann_stat.mmen.all); a=d.LWP0;
v=a40.A0; d.LWP1=mean(v.atm.lwp.ann_stat.mmen.all)-a; d.LWP1=d.LWP1/d.Ta1;
v=a40.B0; d.LWP2=mean(v.atm.lwp.ann_stat.mmen.all)-a; d.LWP2=d.LWP2/d.Ta2;
v=a40.C0; d.LWP3=mean(v.atm.lwp.ann_stat.mmen.all)-a; d.LWP3=d.LWP3/d.Ta3;
v=a40.D0; d.LWP4=mean(v.atm.lwp.ann_stat.mmen.all)-a; d.LWP4=d.LWP4/d.Ta4;;
v=a40.E0; d.LWP5=mean(v.atm.lwp.ann_stat.mmen.all)-a; d.LWP5=d.LWP5/d.Ta5;
v=a40.F0; d.LWP6=mean(v.atm.lwp.ann_stat.mmen.all)-a; d.LWP6=d.LWP6/d.Ta6;;
v=a40.P0; d.LWP7=mean(v.atm.lwp.ann_stat.mmen.all)-a; d.LWP7=d.LWP7/d.Ta7;;
v=a40.P1; d.LWP8=mean(v.atm.lwp.ann_stat.mmen.all)-a; d.LWP8=d.LWP8/d.Ta8;;
v=a40.c0; d.lwp0= v.atm.lwp.tavg0; a=d.lwp0;
v=a40.A0; d.lwp1=(v.atm.lwp.tavg0-a)/d.Ta1;
v=a40.B0; d.lwp2=(v.atm.lwp.tavg0-a)/d.Ta2;
v=a40.C0; d.lwp3=(v.atm.lwp.tavg0-a)/d.Ta3;
v=a40.D0; d.lwp4=(v.atm.lwp.tavg0-a)/d.Ta4;
v=a40.E0; d.lwp5=(v.atm.lwp.tavg0-a)/d.Ta5;
v=a40.F0; d.lwp6=(v.atm.lwp.tavg0-a)/d.Ta6;
v=a40.P0; d.lwp7=(v.atm.lwp.tavg0-a)/d.Ta7;
v=a40.P1; d.lwp8=(v.atm.lwp.tavg0-a)/d.Ta8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%IWP: IWP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=a40.c0; d.IWP0=mean(v.atm.iwp.ann_stat.mmen.all); a=d.IWP0;
v=a40.A0; d.IWP1=mean(v.atm.iwp.ann_stat.mmen.all)-a; d.IWP1=d.IWP1/d.Ta1;
v=a40.B0; d.IWP2=mean(v.atm.iwp.ann_stat.mmen.all)-a; d.IWP2=d.IWP2/d.Ta2;
v=a40.C0; d.IWP3=mean(v.atm.iwp.ann_stat.mmen.all)-a; d.IWP3=d.IWP3/d.Ta3;
v=a40.D0; d.IWP4=mean(v.atm.iwp.ann_stat.mmen.all)-a; d.IWP4=d.IWP4/d.Ta4;;
v=a40.E0; d.IWP5=mean(v.atm.iwp.ann_stat.mmen.all)-a; d.IWP5=d.IWP5/d.Ta5;
v=a40.F0; d.IWP6=mean(v.atm.iwp.ann_stat.mmen.all)-a; d.IWP6=d.IWP6/d.Ta6;;
v=a40.P0; d.IWP7=mean(v.atm.iwp.ann_stat.mmen.all)-a; d.IWP7=d.IWP7/d.Ta7;;
v=a40.P1; d.IWP8=mean(v.atm.iwp.ann_stat.mmen.all)-a; d.IWP8=d.IWP8/d.Ta8;;
v=a40.c0; d.iwp0= v.atm.iwp.tavg0; a=d.iwp0;
v=a40.A0; d.iwp1=(v.atm.iwp.tavg0-a)/d.Ta1;
v=a40.B0; d.iwp2=(v.atm.iwp.tavg0-a)/d.Ta2;
v=a40.C0; d.iwp3=(v.atm.iwp.tavg0-a)/d.Ta3;
v=a40.D0; d.iwp4=(v.atm.iwp.tavg0-a)/d.Ta4;
v=a40.E0; d.iwp5=(v.atm.iwp.tavg0-a)/d.Ta5;
v=a40.F0; d.iwp6=(v.atm.iwp.tavg0-a)/d.Ta6;
v=a40.P0; d.iwp7=(v.atm.iwp.tavg0-a)/d.Ta7;
v=a40.P1; d.iwp8=(v.atm.iwp.tavg0-a)/d.Ta8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

return

