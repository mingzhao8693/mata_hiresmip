function x=get4xco2f(a40,aa,opt)
lm=a40.c0.s.lm0; a=lm; id=(lm==1); a(id)=1; a(~id)=0;
a0=aa.*a; a0=a0./mean(mean(a0)); 
t1=20; t2=50;
a=a40.c0.sfc.tref.all  (:    ,:,:,:); c1=gmean(a,aa,opt);
a=a40.G0.sfc.tref.all  (:    ,:,:,:); g1=gmean(a,aa,opt);
a=a40.W0.sfc.tref.all  (:    ,:,:,:); c2=gmean(a,aa,opt);
a=a40.w0.sfc.tref.all  (:    ,:,:,:); g2=gmean(a,aa,opt);
a=a40.W1.sfc.tref.all  (:    ,:,:,:); c3=gmean(a,aa,opt);
a=a40.w1.sfc.tref.all  (:    ,:,:,:); g3=gmean(a,aa,opt);
a=a40.Va.sfc.tref.all  (t1:t2,:,:,:); va=gmean(a,aa,opt);
a=a40.Vb.sfc.tref.all  (t1:t2,:,:,:); vb=gmean(a,aa,opt);

a=a40.c0.toa.netrad.all(:    ,:,:,:); C1=gmean(a,aa,opt);
a=a40.G0.toa.netrad.all(:    ,:,:,:); G1=gmean(a,aa,opt);
a=a40.W0.toa.netrad.all(:    ,:,:,:); C2=gmean(a,aa,opt);
a=a40.w0.toa.netrad.all(:    ,:,:,:); G2=gmean(a,aa,opt);
a=a40.W1.toa.netrad.all(:    ,:,:,:); C3=gmean(a,aa,opt);
a=a40.w1.toa.netrad.all(:    ,:,:,:); G3=gmean(a,aa,opt);
a=a40.Va.toa.netrad.all(t1:t2,:,:,:); Va=gmean(a,aa,opt);
a=a40.Vb.toa.netrad.all(t1:t2,:,:,:); Vb=gmean(a,aa,opt);

x.T_veg   =vb.gm-va.gm; x.F_veg   =Vb.gm-Va.gm;
x.T_av_veg=vb.av-va.av; x.F_av_veg=Vb.av-Va.av;

x.T1=g1.gm-c1.gm; 
x.T2=g2.gm-c2.gm; 
x.T3=g3.gm-c3.gm;

x.F1=G1.gm-C1.gm; x.gm1=x.F1; 
x.F2=G2.gm-C2.gm; x.gm2=x.F2; 
x.F3=G3.gm-C3.gm; x.gm3=x.F3; 

x.av1=(G1.av-C1.av); x.C1=C1; x.G1=G1; 
x.av2=(G2.av-C2.av); x.C2=C2; x.G2=G2;
x.av3=(G3.av-C3.av); x.C3=C3; x.G3=G3;
x.va=va; x.Va=Va;
x.vb=vb; x.Vb=Vb;


x.av1_T=(g1.av-c1.av); 
x.av2_T=(g2.av-c2.av); 
x.av3_T=(g3.av-c3.av); 

x.T    =(x.T2   +x.T3   )/2;
x.F    =(x.F2   +x.F3   )/2;
x.gm   =(x.gm2  +x.gm3  )/2;
x.av   =(x.av2  +x.av3  )/2;
x.av_T =(x.av2_T+x.av3_T)/2; 

%x.T    =(x.T1   + x.T2   +x.T3   )/3;
%x.F    =(x.F1   + x.F2   +x.F3   )/3;
%x.av   =(x.av1  + x.av2  +x.av3  )/3;
%x.gm   =(x.gm1  + x.gm2  +x.gm3  )/3;
%x.av_T =(x.av1_T+ x.av2_T+x.av3_T)/3; 

%x.T    =x.T1;
%x.F    =x.F1;
%x.av   =x.av1;
%x.gm   =x.gm1;
%x.av_T =x.av1_T; 

% more stuff to add
%NETRAD
a=a40.c0.toa.netrad.all(:    ,:,:,:); c1=gmean(a,aa,opt);
a=a40.G0.toa.netrad.all(:    ,:,:,:); g1=gmean(a,aa,opt);
a=a40.W0.toa.netrad.all(:    ,:,:,:); c2=gmean(a,aa,opt);
a=a40.w0.toa.netrad.all(:    ,:,:,:); g2=gmean(a,aa,opt);
a=a40.W1.toa.netrad.all(:    ,:,:,:); c3=gmean(a,aa,opt);
a=a40.w1.toa.netrad.all(:    ,:,:,:); g3=gmean(a,aa,opt);
a=a40.Va.toa.netrad.all(t1:t2,:,:,:); c4=gmean(a,aa,opt);
a=a40.Vb.toa.netrad.all(t1:t2,:,:,:); g4=gmean(a,aa,opt);
a1=g1.gm-c1.gm; a2=g2.gm-c2.gm; a3=g3.gm-c3.gm; a=(a2+a3)/2;x.netrad0=a;
a1=g1.av-c1.av; a2=g2.av-c2.av; a3=g3.av-c3.av; a=(a2+a3)/2; 
x.netrad=squeeze(mean(a,2)); x.netrad2d=a;
x.netrad0_veg=g4.gm-c4.gm;
a=g4.av-c4.av; x.netrad_veg=squeeze(mean(a,2)); x.netrad2d_veg=a;
%LWNET
a=a40.c0.toa.lwnet.all(:    ,:,:,:); c1=gmean(a,aa,opt);
a=a40.G0.toa.lwnet.all(:    ,:,:,:); g1=gmean(a,aa,opt);
a=a40.W0.toa.lwnet.all(:    ,:,:,:); c2=gmean(a,aa,opt);
a=a40.w0.toa.lwnet.all(:    ,:,:,:); g2=gmean(a,aa,opt);
a=a40.W1.toa.lwnet.all(:    ,:,:,:); c3=gmean(a,aa,opt);
a=a40.w1.toa.lwnet.all(:    ,:,:,:); g3=gmean(a,aa,opt);
a=a40.Va.toa.lwnet.all(t1:t2,:,:,:); c4=gmean(a,aa,opt);
a=a40.Vb.toa.lwnet.all(t1:t2,:,:,:); g4=gmean(a,aa,opt);
a1=g1.gm-c1.gm; a2=g2.gm-c2.gm; a3=g3.gm-c3.gm; a=(a2+a3)/2;x.lwnet0=a;
a1=g1.av-c1.av; a2=g2.av-c2.av; a3=g3.av-c3.av; a=(a2+a3)/2; 
x.lwnet=squeeze(mean(a,2)); x.lwnet2d=a; 
x.lwnet0_veg=g4.gm-c4.gm;
a=g4.av-c4.av; x.lwnet_veg=squeeze(mean(a,2)); x.lwnet2d_veg=a;
%SWNET
a=a40.c0.toa.swnet.all(:    ,:,:,:); c1=gmean(a,aa,opt);
a=a40.G0.toa.swnet.all(:    ,:,:,:); g1=gmean(a,aa,opt);
a=a40.W0.toa.swnet.all(:    ,:,:,:); c2=gmean(a,aa,opt);
a=a40.w0.toa.swnet.all(:    ,:,:,:); g2=gmean(a,aa,opt);
a=a40.W1.toa.swnet.all(:    ,:,:,:); c3=gmean(a,aa,opt);
a=a40.w1.toa.swnet.all(:    ,:,:,:); g3=gmean(a,aa,opt);
a=a40.Va.toa.swnet.all(t1:t2,:,:,:); c4=gmean(a,aa,opt);
a=a40.Vb.toa.swnet.all(t1:t2,:,:,:); g4=gmean(a,aa,opt);
a1=g1.gm-c1.gm; a2=g2.gm-c2.gm; a3=g3.gm-c3.gm; a=(a2+a3)/2;x.swnet0=a;
a1=g1.av-c1.av; a2=g2.av-c2.av; a3=g3.av-c3.av; a=(a2+a3)/2; 
x.swnet=squeeze(mean(a,2)); x.swnet2d=a;
x.swnet0_veg=g4.gm-c4.gm;
a=g4.av-c4.av; x.swnet_veg=squeeze(mean(a,2)); x.swnet2d_veg=a;
%NETRAD_CLR
a=a40.c0.toa.netrad_clr.all(:    ,:,:,:); c1=gmean(a,aa,opt);
a=a40.G0.toa.netrad_clr.all(:    ,:,:,:); g1=gmean(a,aa,opt);
a=a40.W0.toa.netrad_clr.all(:    ,:,:,:); c2=gmean(a,aa,opt);
a=a40.w0.toa.netrad_clr.all(:    ,:,:,:); g2=gmean(a,aa,opt);
a=a40.W1.toa.netrad_clr.all(:    ,:,:,:); c3=gmean(a,aa,opt);
a=a40.w1.toa.netrad_clr.all(:    ,:,:,:); g3=gmean(a,aa,opt);
a=a40.Va.toa.netrad_clr.all(t1:t2,:,:,:); c4=gmean(a,aa,opt);
a=a40.Vb.toa.netrad_clr.all(t1:t2,:,:,:); g4=gmean(a,aa,opt);
a1=g1.gm-c1.gm; a2=g2.gm-c2.gm; a3=g3.gm-c3.gm; a=(a2+a3)/2;x.netrad_clr0=a;
a1=g1.av-c1.av; a2=g2.av-c2.av; a3=g3.av-c3.av; a=(a2+a3)/2; 
x.netrad_clr=squeeze(mean(a,2)); x.netrad_clr2d=a;
x.netrad_clr0_veg=g4.gm-c4.gm;
a=g4.av-c4.av; x.netrad_clr_veg=squeeze(mean(a,2)); x.netrad_clr2d_veg=a;
%LWNET_CLR
a=a40.c0.toa.lwnet_clr.all(:    ,:,:,:); c1=gmean(a,aa,opt);
a=a40.G0.toa.lwnet_clr.all(:    ,:,:,:); g1=gmean(a,aa,opt);
a=a40.W0.toa.lwnet_clr.all(:    ,:,:,:); c2=gmean(a,aa,opt);
a=a40.w0.toa.lwnet_clr.all(:    ,:,:,:); g2=gmean(a,aa,opt);
a=a40.W1.toa.lwnet_clr.all(:    ,:,:,:); c3=gmean(a,aa,opt);
a=a40.w1.toa.lwnet_clr.all(:    ,:,:,:); g3=gmean(a,aa,opt);
a=a40.Va.toa.lwnet_clr.all(t1:t2,:,:,:); c4=gmean(a,aa,opt);
a=a40.Vb.toa.lwnet_clr.all(t1:t2,:,:,:); g4=gmean(a,aa,opt);
a1=g1.gm-c1.gm; a2=g2.gm-c2.gm; a3=g3.gm-c3.gm; a=(a2+a3)/2;x.lwnet_clr0=a;
a1=g1.av-c1.av; a2=g2.av-c2.av; a3=g3.av-c3.av; a=(a2+a3)/2; 
x.lwnet_clr=squeeze(mean(a,2)); x.lwnet_clr2d=a;
x.lwnet_clr0_veg=g4.gm-c4.gm;
a=g4.av-c4.av; x.lwnet_clr_veg=squeeze(mean(a,2)); x.lwnet_clr2d_veg=a;
%SWNET_CLR
a=a40.c0.toa.swnet_clr.all(:    ,:,:,:); c1=gmean(a,aa,opt);
a=a40.G0.toa.swnet_clr.all(:    ,:,:,:); g1=gmean(a,aa,opt);
a=a40.W0.toa.swnet_clr.all(:    ,:,:,:); c2=gmean(a,aa,opt);
a=a40.w0.toa.swnet_clr.all(:    ,:,:,:); g2=gmean(a,aa,opt);
a=a40.W1.toa.swnet_clr.all(:    ,:,:,:); c3=gmean(a,aa,opt);
a=a40.w1.toa.swnet_clr.all(:    ,:,:,:); g3=gmean(a,aa,opt);
a=a40.Va.toa.swnet_clr.all(t1:t2,:,:,:); c4=gmean(a,aa,opt);
a=a40.Vb.toa.swnet_clr.all(t1:t2,:,:,:); g4=gmean(a,aa,opt);
a1=g1.gm-c1.gm; a2=g2.gm-c2.gm; a3=g3.gm-c3.gm; a=(a2+a3)/2;x.swnet_clr0=a;
a1=g1.av-c1.av; a2=g2.av-c2.av; a3=g3.av-c3.av; a=(a2+a3)/2; 
x.swnet_clr=squeeze(mean(a,2)); x.swnet_clr2d=a;
x.swnet_clr0_veg=g4.gm-c4.gm;
a=g4.av-c4.av; x.swnet_clr_veg=squeeze(mean(a,2)); x.swnet_clr2d_veg=a;
%TTCF
a=a40.c0.toa.ttcf.all(:    ,:,:,:); c1=gmean(a,aa,opt);
a=a40.G0.toa.ttcf.all(:    ,:,:,:); g1=gmean(a,aa,opt);
a=a40.W0.toa.ttcf.all(:    ,:,:,:); c2=gmean(a,aa,opt);
a=a40.w0.toa.ttcf.all(:    ,:,:,:); g2=gmean(a,aa,opt);
a=a40.W1.toa.ttcf.all(:    ,:,:,:); c3=gmean(a,aa,opt);
a=a40.w1.toa.ttcf.all(:    ,:,:,:); g3=gmean(a,aa,opt);
a=a40.Va.toa.ttcf.all(t1:t2,:,:,:); c4=gmean(a,aa,opt);
a=a40.Vb.toa.ttcf.all(t1:t2,:,:,:); g4=gmean(a,aa,opt);
a1=g1.gm-c1.gm; a2=g2.gm-c2.gm; a3=g3.gm-c3.gm; a=(a2+a3)/2;x.ttcf0=a;
a1=g1.av-c1.av; a2=g2.av-c2.av; a3=g3.av-c3.av; a=(a2+a3)/2; 
x.ttcf=squeeze(mean(a,2)); x.ttcf2d=a;
x.ttcf0_veg=g4.gm-c4.gm;
a=g4.av-c4.av; x.ttcf_veg=squeeze(mean(a,2)); x.ttcf2d_veg=a;
%LWCF
a=a40.c0.toa.lwcf.all(:    ,:,:,:); c1=gmean(a,aa,opt);
a=a40.G0.toa.lwcf.all(:    ,:,:,:); g1=gmean(a,aa,opt);
a=a40.W0.toa.lwcf.all(:    ,:,:,:); c2=gmean(a,aa,opt);
a=a40.w0.toa.lwcf.all(:    ,:,:,:); g2=gmean(a,aa,opt);
a=a40.W1.toa.lwcf.all(:    ,:,:,:); c3=gmean(a,aa,opt);
a=a40.w1.toa.lwcf.all(:    ,:,:,:); g3=gmean(a,aa,opt);
a=a40.Va.toa.lwcf.all(t1:t2,:,:,:); c4=gmean(a,aa,opt);
a=a40.Vb.toa.lwcf.all(t1:t2,:,:,:); g4=gmean(a,aa,opt);
a1=g1.gm-c1.gm; a2=g2.gm-c2.gm; a3=g3.gm-c3.gm; a=(a2+a3)/2;x.lwcf0=a;
a1=g1.av-c1.av; a2=g2.av-c2.av; a3=g3.av-c3.av; a=(a2+a3)/2; 
x.lwcf=squeeze(mean(a,2)); x.lwcf2d=a;
x.lwcf0_veg=g4.gm-c4.gm;
a=g4.av-c4.av; x.lwcf_veg=squeeze(mean(a,2)); x.lwcf2d_veg=a;
%SWCF
a=a40.c0.toa.swcf.all(:    ,:,:,:); c1=gmean(a,aa,opt);
a=a40.G0.toa.swcf.all(:    ,:,:,:); g1=gmean(a,aa,opt);
a=a40.W0.toa.swcf.all(:    ,:,:,:); c2=gmean(a,aa,opt);
a=a40.w0.toa.swcf.all(:    ,:,:,:); g2=gmean(a,aa,opt);
a=a40.W1.toa.swcf.all(:    ,:,:,:); c3=gmean(a,aa,opt);
a=a40.w1.toa.swcf.all(:    ,:,:,:); g3=gmean(a,aa,opt);
a=a40.Va.toa.swcf.all(t1:t2,:,:,:); c4=gmean(a,aa,opt);
a=a40.Vb.toa.swcf.all(t1:t2,:,:,:); g4=gmean(a,aa,opt);
a1=g1.gm-c1.gm; a2=g2.gm-c2.gm; a3=g3.gm-c3.gm; a=(a2+a3)/2;x.swcf0=a;
a1=g1.av-c1.av; a2=g2.av-c2.av; a3=g3.av-c3.av; a=(a2+a3)/2; 
x.swcf=squeeze(mean(a,2)); x.swcf2d=a;
x.swcf0_veg=g4.gm-c4.gm;
a=g4.av-c4.av; x.swcf_veg=squeeze(mean(a,2)); x.swcf2d_veg=a;
%LAI
a=a40.c0.sfc.lai.all(:    ,:,:,:); c1=gmean(a,aa,opt);
a=a40.G0.sfc.lai.all(:    ,:,:,:); g1=gmean(a,aa,opt);
a=a40.W0.sfc.lai.all(:    ,:,:,:); c2=gmean(a,aa,opt);
a=a40.w0.sfc.lai.all(:    ,:,:,:); g2=gmean(a,aa,opt);
a=a40.W1.sfc.lai.all(:    ,:,:,:); c3=gmean(a,aa,opt);
a=a40.w1.sfc.lai.all(:    ,:,:,:); g3=gmean(a,aa,opt);
a=a40.Va.sfc.lai.all(t1:t2,:,:,:); a(a<0)=NaN; c4=gmean(a,aa,opt);
a=a40.Vb.sfc.lai.all(t1:t2,:,:,:); a(a<0)=NaN; g4=gmean(a,aa,opt);
a1=g1.gm-c1.gm; a2=g2.gm-c2.gm; a3=g3.gm-c3.gm; a=(a2+a3)/2;x.lai0=a;
a1=g1.av-c1.av; a2=g2.av-c2.av; a3=g3.av-c3.av; a=(a2+a3)/2; 
x.lai=squeeze(mean(a,2)); x.lai2d=a;
%x.lai0_veg=g4.gm-c4.gm;
%a=g4.av-c4.av; 
%x.lai_veg=squeeze(mean(a,2)); x.lai2d_veg=a;
a=c4.av; cn.zm_l=nanmean(a,2); a(isnan(a))=0; a=a.*a0; cn.gm_l=mean(mean(a,1),2); cn
a=g4.av; vg.zm_l=nanmean(a,2); a(isnan(a))=0; a=a.*a0; vg.gm_l=mean(mean(a,1),2); vg
x.lai0_veg =(vg.gm_l-cn.gm_l); x.lai_cn=cn;
x.lai_veg  =(vg.zm_l-cn.zm_l); x.lai_vg=vg;
x.lai2d_veg=g4.av-c4.av;
%FSW
a=a40.c0.sfc.fsw.all(:    ,:,:,:); c1=gmean(a,aa,opt);
a=a40.G0.sfc.fsw.all(:    ,:,:,:); g1=gmean(a,aa,opt);
a=a40.W0.sfc.fsw.all(:    ,:,:,:); c2=gmean(a,aa,opt);
a=a40.w0.sfc.fsw.all(:    ,:,:,:); g2=gmean(a,aa,opt);
a=a40.W1.sfc.fsw.all(:    ,:,:,:); c3=gmean(a,aa,opt);
a=a40.w1.sfc.fsw.all(:    ,:,:,:); g3=gmean(a,aa,opt);
a=a40.Va.sfc.fsw.all(t1:t2,:,:,:); a(a<0)=NaN; c4=gmean(a,aa,opt);
a=a40.Vb.sfc.fsw.all(t1:t2,:,:,:); a(a<0)=NaN; g4=gmean(a,aa,opt);
a1=g1.gm-c1.gm; a2=g2.gm-c2.gm; a3=g3.gm-c3.gm; a=(a2+a3)/2;x.fsw0=a;
a1=g1.av-c1.av; a2=g2.av-c2.av; a3=g3.av-c3.av; a=(a2+a3)/2; 
x.fsw=squeeze(mean(a,2)); x.fsw2d=a;
%x.fsw0_veg=g4.gm-c4.gm;
%a=g4.av-c4.av; x.fsw_veg=squeeze(mean(a,2)); x.fsw2d_veg=a;
a=c4.av; cn.zm_l=nanmean(a,2); a(isnan(a))=0; a=a.*a0; cn.gm_l=mean(mean(a,1),2); cn
a=g4.av; vg.zm_l=nanmean(a,2); a(isnan(a))=0; a=a.*a0; vg.gm_l=mean(mean(a,1),2); vg
x.fsw0_veg =(vg.gm_l-cn.gm_l); x.fsw_cn=cn;
x.fsw_veg  =(vg.zm_l-cn.zm_l); x.fsw_vg=vg;
x.fsw2d_veg=g4.av-c4.av;
return
