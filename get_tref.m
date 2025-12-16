function [d c1 w1 g1 c2 w2 c3 w3 c4 w4 c5 w5]=get_tref(am4,CM4,SP4,ESM4,a41,aa,t1,t2)
a=am4.c0.sfc.tref.all (:      ,:,:,:); c1=squeeze(mean(mean(a,1),2));cav1=mean(mean(c1.*aa,1));
a=am4.w0.sfc.tref.all (:      ,:,:,:); w1=squeeze(mean(mean(a,1),2));wav1=mean(mean(w1.*aa,1));
a=am4.g0.sfc.tref.all (:      ,:,:,:); g1=squeeze(mean(mean(a,1),2));gav1=mean(mean(g1.*aa,1));
a=CM4.c0.sfc.tref.all (151:250,:,:,:); c2=squeeze(mean(mean(a,1),2));cav2=mean(mean(c2.*aa,1));
a=CM4.w0.sfc.tref.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(a,1),2));wav2=mean(mean(w2.*aa,1));
a=SP4.c0.sfc.tref.all (51:150 ,:,:,:); c3=squeeze(mean(mean(a,1),2));cav3=mean(mean(c3.*aa,1));
a=SP4.w0.sfc.tref.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(a,1),2));wav3=mean(mean(w3.*aa,1));
a=ESM4.c0.sfc.tref.all(1:100  ,:,:,:); c4=squeeze(mean(mean(a,1),2));cav4=mean(mean(c4.*aa,1));
a=ESM4.w0.sfc.tref.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(a,1),2));wav4=mean(mean(w4.*aa,1));
a=a41.c0.sfc.tref.all (:,      :,:,:); c5=squeeze(mean(mean(a,1),2));cav5=mean(mean(c5.*aa,1));
a=a41.w0.sfc.tref.all (:,      :,:,:); w5=squeeze(mean(mean(a,1),2));wav5=mean(mean(w5.*aa,1));

d.T0=(gav1-cav1); d.T1=(wav1-cav1); d.T2=(wav2-cav2); d.T3=(wav3-cav3); d.T4=(wav4-cav4);d.T5=(wav5-cav5);

return
