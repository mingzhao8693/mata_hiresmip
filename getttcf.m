function [d]=getttcf(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt)
%t1=101; t2=150; opt=0;
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
a=CM4.c0.toa.ttcf.all (1:100,:,:,:); c1=gmean(a,aa,opt);
a=CM4.w0.toa.ttcf.all (t1:t2,:,:,:); w1=gmean(a,aa,opt);
a=ESM.c0.toa.ttcf.all (1:100,:,:,:); c2=gmean(a,aa,opt);
a=ESM.w0.toa.ttcf.all (t1:t2,:,:,:); w2=gmean(a,aa,opt);
a=SP1.c0.toa.ttcf.all (1:100,:,:,:); c3=gmean(a,aa,opt);
a=SP1.w0.toa.ttcf.all (t1:t2,:,:,:); w3=gmean(a,aa,opt);
a=SP4.c0.toa.ttcf.all (1:100,:,:,:); c4=gmean(a,aa,opt);
a=SP4.w0.toa.ttcf.all (t1:t2,:,:,:); w4=gmean(a,aa,opt);
a=a40.c0.toa.ttcf.all (:    ,:,:,:); c5=gmean(a,aa,opt);
a=a40.w0.toa.ttcf.all (:    ,:,:,:); w5=gmean(a,aa,opt);

a=a40.G0.toa.ttcf.all (:    ,:,:,:); G5=gmean(a,aa,opt);
a=a40.W0.toa.ttcf.all (:    ,:,:,:); W5=gmean(a,aa,opt);

a=a40.S0.toa.ttcf.all (:    ,:,:,:); S5=gmean(a,aa,opt);
a=a40.I0.toa.ttcf.all (:    ,:,:,:); I5=gmean(a,aa,opt);
a=a40.V0.toa.ttcf.all (:    ,:,:,:); V5=gmean(a,aa,opt);
a=a40.P0.toa.ttcf.all (:    ,:,:,:); P5=gmean(a,aa,opt);

a=a40.S1.toa.ttcf.all (:    ,:,:,:); A5=gmean(a,aa,opt);
a=a40.I1.toa.ttcf.all (:    ,:,:,:); B5=gmean(a,aa,opt);
a=a40.V1.toa.ttcf.all (:    ,:,:,:); C5=gmean(a,aa,opt);
a=a40.P1.toa.ttcf.all (:    ,:,:,:); D5=gmean(a,aa,opt);
%a=a40.P2.toa.ttcf.all (:    ,:,:,:); D5=gmean(a,aa,opt);

%a=a41.c0.toa.ttcf.all(:    ,:,:,:); c6=gmean(a,aa,opt);
%a=a41.w0.toa.ttcf.all(:    ,:,:,:); w6=gmean(a,aa,opt);

d.N1=(w1.gm-c1.gm); d.N2=(w2.gm-c2.gm); d.N3=(w3.gm-c3.gm);
d.N4=(w4.gm-c4.gm); d.N5=(w5.gm-c5.gm); d.N6=(G5.gm-c5.gm);
d.N7=(W5.gm-c5.gm);
d.N8=(S5.gm-c5.gm); d.N9=(I5.gm-c5.gm); d.Nx=(V5.gm-c5.gm); d.Ny=(P5.gm-c5.gm);
d.Na=(A5.gm-c5.gm); d.Nb=(B5.gm-c5.gm); d.Nc=(C5.gm-c5.gm); d.Nd=(D5.gm-c5.gm);

d.c1=c1; d.w1=w1;
d.c2=c2; d.w2=w2;
d.c3=c3; d.w3=w3;
d.c4=c4; d.w4=w4;
d.c5=c5; d.w5=w5; d.G5=G5; 
d.W5=W5; 
d.S5=S5; d.I5=I5; d.V5=V5; d.P5=P5;
d.A5=A5; d.B5=B5; d.C5=C5; d.D5=D5;

return
