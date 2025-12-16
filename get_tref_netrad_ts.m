function [d]=get_tref_netrad_ts(CM4,ESM,SP1,SP4,a40,a41,t1,t2,t3,opt)
%t1=1; t2=20; t3=30; first 100 year as control mean
%opt=1: don't account for the control trend
c1=CM4.c0.sfc.tref.ann_stat.mmen.all;   c1_l=ltrd(c1(t1:t2),opt);%CM4-CNTL:150-250yr
w1=CM4.w0.sfc.tref.ann_stat.mmen.all;   dT1=w1(t1:t3)-c1_l;         %CM4-4xCO2:1-150yr
c2=ESM.c0.sfc.tref.ann_stat.mmen.all;   c2_l=ltrd(c2(t1:t2),opt);%ESM-CNTL:1-100yr
w2=ESM.w0.sfc.tref.ann_stat.mmen.all;   dT2=w2(t1:t3)-c2_l;         %ESM-4xCO2:1-150
c3=SP1.c0.sfc.tref.ann_stat.mmen.all;   c3_l=ltrd(c3(t1:t2),opt);%SP1-CNTL:50-150yr
w3=SP1.w0.sfc.tref.ann_stat.mmen.all;   dT3=w3(t1:t3)-c3_l;         %SP1-4xCO2:1-150yr
c4=SP4.c0.sfc.tref.ann_stat.mmen.all;   c4_l=ltrd(c4(t1:t2),opt);%SP4-CNTL:50-150yr
w4=SP4.w0.sfc.tref.ann_stat.mmen.all;   dT4=w4(t1:t3)-c4_l;         %SP4-4xCO2:1-150yr
c5=a40.c0.sfc.tref.ann_stat.mmen.all;   c5_l=mean(c5);
w5=a40.w0.sfc.tref.ann_stat.mmen.all;   dT5(1:2)=mean(w5)-c5_l;
w6=a40.w1.sfc.tref.ann_stat.mmen.all;   dT6(1:2)=mean(w6)-c5_l;

C1=CM4.c0.toa.netrad.ann_stat.mmen.all; C1_l=ltrd(C1(t1:t2),opt);
W1=CM4.w0.toa.netrad.ann_stat.mmen.all; dN1=W1(t1:t3)-C1_l;
C2=ESM.c0.toa.netrad.ann_stat.mmen.all; C2_l=ltrd(C2(t1:t2),opt);
W2=ESM.w0.toa.netrad.ann_stat.mmen.all; dN2=W2(t1:t3)-C2_l;
C3=SP1.c0.toa.netrad.ann_stat.mmen.all; C3_l=ltrd(C3(t1:t2),opt);
W3=SP1.w0.toa.netrad.ann_stat.mmen.all; dN3=W3(t1:t3)-C3_l;
C4=SP4.c0.toa.netrad.ann_stat.mmen.all; C4_l=ltrd(C4(t1:t2),opt);
W4=SP4.w0.toa.netrad.ann_stat.mmen.all; dN4=W4(t1:t3)-C4_l;
C5=a40.c0.toa.netrad.ann_stat.mmen.all; C5_l=mean(C5);
W5=a40.w0.toa.netrad.ann_stat.mmen.all; dN5(1:2)=mean(W5)-C5_l;
W6=a40.w1.toa.netrad.ann_stat.mmen.all; dN6(1:2)=mean(W6)-C5_l;

C1s=CM4.c0.sfc.netflx.ann_stat.mmen.all; C1s_l=ltrd(C1s(t1:t2),opt);
W1s=CM4.w0.sfc.netflx.ann_stat.mmen.all; dN1s=W1s(t1:t3)-C1s_l;
C2s=ESM.c0.sfc.netflx.ann_stat.mmen.all; C2s_l=ltrd(C2s(t1:t2),opt);
W2s=ESM.w0.sfc.netflx.ann_stat.mmen.all; dN2s=W2s(t1:t3)-C2s_l;
C3s=SP1.c0.sfc.netflx.ann_stat.mmen.all; C3s_l=ltrd(C3s(t1:t2),opt);
W3s=SP1.w0.sfc.netflx.ann_stat.mmen.all; dN3s=W3s(t1:t3)-C3s_l;
C4s=SP4.c0.sfc.netflx.ann_stat.mmen.all; C4s_l=ltrd(C4s(t1:t2),opt);
W4s=SP4.w0.sfc.netflx.ann_stat.mmen.all; dN4s=W4s(t1:t3)-C4s_l;
C5s=a40.c0.sfc.netflx.ann_stat.mmen.all; C5s_l=mean(C5s);
W5s=a40.w0.sfc.netflx.ann_stat.mmen.all; dN5s(1:2)=mean(W5s)-C5s_l;

d.dT1=dT1; d.dT2=dT2; d.dT3=dT3; d.dT4=dT4; d.dT5=dT5; d.dT6=dT6;
d.dN1=dN1; d.dN2=dN2; d.dN3=dN3; d.dN4=dN4; d.dN5=dN5; d.dN6=dN6;
d.dN1s=dN1s; d.dN2s=dN2s; d.dN3s=dN3s; d.dN4s=dN4s; d.dN5s=dN5s;

return
