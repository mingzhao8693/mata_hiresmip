function [d]=getalltoa(v,t1,t2,o,a40,opt)
%latlon=[0 360 -90 90]; t1=101; t2=150; opt=0; 
s=v.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
a=lm; id=(lm==1); a(id)=1; a(~id)=0;
a0=aa.*a; a0=a0./mean(mean(a0)); 

a=v.c0.sfc.tref.all (1:100,:,:,:); c1=gmean(a,aa,0);
a=v.w0.sfc.tref.all (t1:t2,:,:,:); w1=gmean(a,aa,0);
d.tref0=w1.gm-c1.gm;
d.tref =w1.zm-c1.zm;

a=v.c0.toa.netrad.all (1:100,:,:,:); c1=gmean(a,aa,0);
a=v.w0.toa.netrad.all (t1:t2,:,:,:); w1=gmean(a,aa,0);
d.netrad0=w1.gm-c1.gm;
d.netrad =w1.zm-c1.zm;

a=v.c0.toa.lwnet.all (1:100,:,:,:); c1=gmean(a,aa,0);
a=v.w0.toa.lwnet.all (t1:t2,:,:,:); w1=gmean(a,aa,0);
d.lwnet0=w1.gm-c1.gm;
d.lwnet =w1.zm-c1.zm;

a=v.c0.toa.swnet.all (1:100,:,:,:); c1=gmean(a,aa,0);
a=v.w0.toa.swnet.all (t1:t2,:,:,:); w1=gmean(a,aa,0);
d.swnet0=w1.gm-c1.gm;
d.swnet =w1.zm-c1.zm;

a=v.c0.toa.netrad_clr.all (1:100,:,:,:); c1=gmean(a,aa,0);
a=v.w0.toa.netrad_clr.all (t1:t2,:,:,:); w1=gmean(a,aa,0);
d.netrad_clr0=w1.gm-c1.gm;
d.netrad_clr =w1.zm-c1.zm;

a=v.c0.toa.lwnet_clr.all (1:100,:,:,:); c1=gmean(a,aa,0);
a=v.w0.toa.lwnet_clr.all (t1:t2,:,:,:); w1=gmean(a,aa,0);
d.lwnet_clr0=w1.gm-c1.gm;
d.lwnet_clr =w1.zm-c1.zm;

a=v.c0.toa.swnet_clr.all (1:100,:,:,:); c1=gmean(a,aa,0);
a=v.w0.toa.swnet_clr.all (t1:t2,:,:,:); w1=gmean(a,aa,0);
d.swnet_clr0=w1.gm-c1.gm;
d.swnet_clr =w1.zm-c1.zm;

a=v.c0.toa.ttcf.all (1:100,:,:,:); c1=gmean(a,aa,0);
a=v.w0.toa.ttcf.all (t1:t2,:,:,:); w1=gmean(a,aa,0);
d.ttcf0=w1.gm-c1.gm;
d.ttcf =w1.zm-c1.zm;

a=v.c0.toa.lwcf.all (1:100,:,:,:); c1=gmean(a,aa,0);
a=v.w0.toa.lwcf.all (t1:t2,:,:,:); w1=gmean(a,aa,0);
d.lwcf0=w1.gm-c1.gm;
d.lwcf =w1.zm-c1.zm;

a=v.c0.toa.swcf.all (1:100,:,:,:); c1=gmean(a,aa,0);
a=v.w0.toa.swcf.all (t1:t2,:,:,:); w1=gmean(a,aa,0);
d.swcf0=w1.gm-c1.gm;
d.swcf =w1.zm-c1.zm;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=v.c0.sfc.ice.all (1:100,:,:,:); c1=gmean(a,aa,0);
a=v.w0.sfc.ice.all (t1:t2,:,:,:); w1=gmean(a,aa,0);
d.ice0=w1.gm-c1.gm;
d.ice =w1.zm-c1.zm;

a=v.c0.sfc.lai.all (1:100,:,:,:); a(a<0)=NaN; c1=gmean(a,aa,0);
a=v.w0.sfc.lai.all (t1:t2,:,:,:); a(a<0)=NaN; w1=gmean(a,aa,0);
d.lai0=w1.gm-c1.gm;
d.lai =w1.zm-c1.zm; 
%below to compute average only over land%%%%
a=c1.av; c1.zm_l=nanmean(a,2); a(isnan(a))=0; a=a.*a0; c1.gm_l=mean(mean(a,1),2); c1
a=w1.av; w1.zm_l=nanmean(a,2); a(isnan(a))=0; a=a.*a0; w1.gm_l=mean(mean(a,1),2); w1
d.lai0=w1.gm_l-c1.gm_l;
d.lai =w1.zm_l-c1.zm_l;

a=v.c0.sfc.fsw.all (1:100,:,:,:); a(a<0)=NaN; c1=gmean(a,aa,0);
a=v.w0.sfc.fsw.all (t1:t2,:,:,:); a(a<0)=NaN; w1=gmean(a,aa,0);
d.fsw0=w1.gm-c1.gm;
d.fsw =w1.zm-c1.zm;
%below to compute average only over land%%%%
a=c1.av; c1.zm_l=nanmean(a,2); a(isnan(a))=0; a=a.*a0; c1.gm_l=mean(mean(a,1),2); c1
a=w1.av; w1.zm_l=nanmean(a,2); a(isnan(a))=0; a=a.*a0; w1.gm_l=mean(mean(a,1),2); w1
d.fsw0=w1.gm_l-c1.gm_l;
d.fsw =w1.zm_l-c1.zm_l;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

df=get4xco2f(a40,aa,0); 
if opt==0
  d.F0_co2=df.F; 
  d.T0_co2=df.T;
  d.F_co2=squeeze(mean(df.av,2)); 
  d.T_co2=squeeze(mean(df.av_T,2));
else opt==1
  d.F0_co2=df.F+df.F_veg; 
  d.T0_co2=df.T+df.T_veg;
  d.F_co2=squeeze(mean(df.av  +df.F_av_veg,2)); 
  d.T_co2=squeeze(mean(df.av_T+df.T_av_veg,2));
  df.netrad0    = df.netrad0    +df.netrad0_veg
  df.netrad     = df.netrad     +df.netrad_veg
  df.netrad_clr0= df.netrad_clr0+df.netrad_clr0_veg
  df.netrad_clr = df.netrad_clr +df.netrad_clr_veg
  df.lwnet0     = df.lwnet0     +df.lwnet0_veg
  df.lwnet      = df.lwnet      +df.lwnet_veg
  df.lwnet_clr0 = df.lwnet_clr0 +df.lwnet_clr0_veg
  df.lwnet_clr  = df.lwnet_clr  +df.lwnet_clr_veg
  df.swnet0     = df.swnet0     +df.swnet0_veg
  df.swnet      = df.swnet      +df.swnet_veg
  df.swnet_clr0 = df.swnet_clr0 +df.swnet_clr0_veg
  df.swnet_clr  = df.swnet_clr  +df.swnet_clr_veg
  df.ttcf0      = df.ttcf0      +df.ttcf0_veg
  df.ttcf       = df.ttcf       +df.ttcf_veg
  df.lwcf0      = df.lwcf0      +df.lwcf0_veg
  df.lwcf       = df.lwcf       +df.lwcf_veg
  df.swcf0      = df.swcf0      +df.swcf0_veg
  df.swcf       = df.swcf       +df.swcf_veg
  df.lai0       = df.lai0       +df.lai0_veg
  df.lai        = df.lai        +df.lai_veg
  df.fsw0       = df.fsw0       +df.fsw0_veg
  df.fsw        = df.fsw        +df.fsw_veg
end
d.dT=(d.tref0-d.T0_co2);
d.netrad0    =(d.netrad0    -df.netrad0)    /d.dT;
d.netrad     =(d.netrad     -df.netrad )    /d.dT;
d.netrad_clr0=(d.netrad_clr0-df.netrad_clr0)/d.dT;
d.netrad_clr =(d.netrad_clr -df.netrad_clr) /d.dT;
d.lwnet0     =(d.lwnet0     -df.lwnet0)     /d.dT;
d.lwnet      =(d.lwnet      -df.lwnet)      /d.dT;
d.lwnet_clr0 =(d.lwnet_clr0 -df.lwnet_clr0) /d.dT;
d.lwnet_clr  =(d.lwnet_clr  -df.lwnet_clr)  /d.dT;
d.swnet0     =(d.swnet0     -df.swnet0)     /d.dT;
d.swnet      =(d.swnet      -df.swnet)      /d.dT;
d.swnet_clr0 =(d.swnet_clr0 -df.swnet_clr0) /d.dT;
d.swnet_clr  =(d.swnet_clr  -df.swnet_clr)  /d.dT;
d.ttcf0      =(d.ttcf0      -df.ttcf0)      /d.dT;
d.ttcf       =(d.ttcf       -df.ttcf)       /d.dT;
d.lwcf0      =(d.lwcf0      -df.lwcf0)      /d.dT;
d.lwcf       =(d.lwcf       -df.lwcf)       /d.dT;
d.swcf0      =(d.swcf0      -df.swcf0)      /d.dT;
d.swcf       =(d.swcf       -df.swcf)       /d.dT;
%addition%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d.ice0       =(d.ice0)               /d.dT;
d.ice        =(d.ice)                /d.dT;
d.lai0       =(d.lai0       -df.lai0)/d.dT;
d.lai        =(d.lai        -df.lai) /d.dT;
d.fsw0       =(d.fsw0       -df.fsw0)/d.dT;
d.fsw        =(d.fsw        -df.fsw) /d.dT; d.df=df;

return
