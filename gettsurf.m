function [d]=gettsurf(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt)
%t1=101; t2=150; opt=0;
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
a=CM4.c0.sfc.tsurf.all (1:100,:,:,:); c1=gmean(a,aa,opt);
a=CM4.w0.sfc.tsurf.all (t1:t2,:,:,:); w1=gmean(a,aa,opt);
a=ESM.c0.sfc.tsurf.all (1:100,:,:,:); c2=gmean(a,aa,opt);
a=ESM.w0.sfc.tsurf.all (t1:t2,:,:,:); w2=gmean(a,aa,opt);
a=SP1.c0.sfc.tsurf.all (1:100,:,:,:); c3=gmean(a,aa,opt);
a=SP1.w0.sfc.tsurf.all (t1:t2,:,:,:); w3=gmean(a,aa,opt);
a=SP4.c0.sfc.tsurf.all (1:100,:,:,:); c4=gmean(a,aa,opt);
a=SP4.w0.sfc.tsurf.all (t1:t2,:,:,:); w4=gmean(a,aa,opt);
a=a40.c0.sfc.tsurf.all (:    ,:,:,:); c5=gmean(a,aa,opt);
a=a40.w0.sfc.tsurf.all (:    ,:,:,:); w5=gmean(a,aa,opt);

a=a40.G0.sfc.tsurf.all (:    ,:,:,:); G5=gmean(a,aa,opt);
a=a40.W0.sfc.tsurf.all (:    ,:,:,:); W5=gmean(a,aa,opt);
a=a40.W1.sfc.tsurf.all (:    ,:,:,:); W1=gmean(a,aa,opt);

a=a40.S0.sfc.tsurf.all (:    ,:,:,:); S5=gmean(a,aa,opt);
a=a40.I0.sfc.tsurf.all (:    ,:,:,:); I5=gmean(a,aa,opt);
a=a40.V0.sfc.tsurf.all (:    ,:,:,:); V5=gmean(a,aa,opt);
a=a40.P0.sfc.tsurf.all (:    ,:,:,:); P5=gmean(a,aa,opt);

a=a40.S1.sfc.tsurf.all (:    ,:,:,:); A5=gmean(a,aa,opt);
a=a40.I1.sfc.tsurf.all (:    ,:,:,:); B5=gmean(a,aa,opt);
a=a40.V1.sfc.tsurf.all (:    ,:,:,:); C5=gmean(a,aa,opt);
a=a40.P1.sfc.tsurf.all (:    ,:,:,:); D5=gmean(a,aa,opt);

%a=a41.c0.sfc.tsurf.all(:    ,:,:,:); c6=gmean(a,aa,opt);
%a=a41.w0.sfc.tsurf.all(:    ,:,:,:); w6=gmean(a,aa,opt);

d.T1=(w1.gm-c1.gm); d.T2=(w2.gm-c2.gm); d.T3=(w3.gm-c3.gm);
d.T4=(w4.gm-c4.gm); d.T5=(w5.gm-c5.gm); d.T6=(G5.gm-c5.gm);
d.T7=(W5.gm-c5.gm); d.Tf=(W1.gm-c5.gm); 
d.T8=(S5.gm-c5.gm); d.T9=(I5.gm-c5.gm); d.Tx=(V5.gm-c5.gm); d.Ty=(P5.gm-c5.gm); 
d.Ta=(A5.gm-c5.gm); d.Tb=(B5.gm-c5.gm); d.Tc=(C5.gm-c5.gm); d.Td=(D5.gm-c5.gm); 

d.c1=c1; d.w1=w1;
d.c2=c2; d.w2=w2;
d.c3=c3; d.w3=w3;
d.c4=c4; d.w4=w4;
d.c5=c5; d.w5=w5; d.G5=G5; 
d.W5=W5; d.W1=W1; 
d.S5=S5; d.I5=I5; d.V5=V5; d.P5=P5;
d.A5=A5; d.B5=B5; d.C5=C5; d.D5=D5;

return
