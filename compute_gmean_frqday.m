function v=compute_gmean_frqday(a1,a2,dT,aa)
%v=v0.ar; aa=repmat(v1.aa,[1 1 100]); aa=permute(aa,[3 1 2]);

a=a1; n1=length(a(:,1,1)); a=mean(mean(a.*aa,3),2); a1=mean(a); s1=std(a);
a=a2; n2=length(a(:,1,1)); a=mean(mean(a.*aa,3),2); a2=mean(a); s2=std(a);

diff= a2 - a1; pdiff=diff./a1*100.;
c1  = s1.^2./n1;
c2  = s2.^2./n2;
se  = sqrt(c1+c2);
zscore=1.96; %corresponding 95% confidence level
%zscore=1.44; %corresponding 85% confidence level
%zscore=1.28; %corresponding 80% confidence level
%zscore=1.036;%corresponding 70% confidence level
me=zscore*se;
id=abs(diff)<me;
sig=1; if id; sig=0; end

diff =diff /dT; %unit:/K
pdiff=pdiff/dT;
v.diff=diff; v.pdiff=pdiff; v.me=me; v.zscore=zscore; v.sig=sig; v.a1=a1; v.a2=a2;

return

dT1=1.1614; dT2=1.1848; v=v0.ar; aa=repmat(v.aa,[1 1 100]); aa=permute(aa,[3 1 2]);
%AR
v=v0.ar; a1=v.frqday_all;
v=w1.ar; a2=v.frqday_all; w1.ar.diff.frqday=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.ar; a2=v.frqday_all; w2.ar.diff.frqday=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.ar; a1=squeeze(v.prday_idwei_ann);
v=w1.ar; a2=squeeze(v.prday_idwei_ann); w1.ar.diff.prday_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.ar; a2=squeeze(v.prday_idwei_ann); w2.ar.diff.prday_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.ar; a1=squeeze(v.netrad_idwei_ann);
v=w1.ar; a2=squeeze(v.netrad_idwei_ann); w1.ar.diff.netrad_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.ar; a2=squeeze(v.netrad_idwei_ann); w2.ar.diff.netrad_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.ar; a1=squeeze(v.netradclr_idwei_ann);
v=w1.ar; a2=squeeze(v.netradclr_idwei_ann); w1.ar.diff.netradclr_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.ar; a2=squeeze(v.netradclr_idwei_ann); w2.ar.diff.netradclr_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.ar; a1=squeeze(v.lwcf_idwei_ann);
v=w1.ar; a2=squeeze(v.lwcf_idwei_ann); w1.ar.diff.lwcf_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.ar; a2=squeeze(v.lwcf_idwei_ann); w2.ar.diff.lwcf_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.ar; a1=squeeze(v.swcf_idwei_ann);
v=w1.ar; a2=squeeze(v.swcf_idwei_ann); w1.ar.diff.swcf_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.ar; a2=squeeze(v.swcf_idwei_ann); w2.ar.diff.swcf_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
%TS
v=v0.tc; a1=v.frqday_all;
v=w1.tc; a2=v.frqday_all; w1.tc.diff.frqday=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.tc; a2=v.frqday_all; w2.tc.diff.frqday=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.tc; a1=squeeze(v.prday_idwei_ann);
v=w1.tc; a2=squeeze(v.prday_idwei_ann); w1.tc.diff.prday_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.tc; a2=squeeze(v.prday_idwei_ann); w2.tc.diff.prday_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.tc; a1=squeeze(v.netrad_idwei_ann);
v=w1.tc; a2=squeeze(v.netrad_idwei_ann); w1.tc.diff.netrad_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.tc; a2=squeeze(v.netrad_idwei_ann); w2.tc.diff.netrad_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.tc; a1=squeeze(v.netradclr_idwei_ann);
v=w1.tc; a2=squeeze(v.netradclr_idwei_ann); w1.tc.diff.netradclr_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.tc; a2=squeeze(v.netradclr_idwei_ann); w2.tc.diff.netradclr_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.tc; a1=squeeze(v.lwcf_idwei_ann);
v=w1.tc; a2=squeeze(v.lwcf_idwei_ann); w1.tc.diff.lwcf_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.tc; a2=squeeze(v.lwcf_idwei_ann); w2.tc.diff.lwcf_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.tc; a1=squeeze(v.swcf_idwei_ann);
v=w1.tc; a2=squeeze(v.swcf_idwei_ann); w1.tc.diff.swcf_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.tc; a2=squeeze(v.swcf_idwei_ann); w2.tc.diff.swcf_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
%MCS
v=v0.mc; a1=v.frqday_all;
v=w1.mc; a2=v.frqday_all; w1.mc.diff.frqday=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.mc; a2=v.frqday_all; w2.mc.diff.frqday=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.mc; a1=squeeze(v.prday_idwei_ann);
v=w1.mc; a2=squeeze(v.prday_idwei_ann); w1.mc.diff.prday_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.mc; a2=squeeze(v.prday_idwei_ann); w2.mc.diff.prday_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.mc; a1=squeeze(v.netrad_idwei_ann);
v=w1.mc; a2=squeeze(v.netrad_idwei_ann); w1.mc.diff.netrad_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.mc; a2=squeeze(v.netrad_idwei_ann); w2.mc.diff.netrad_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.mc; a1=squeeze(v.netradclr_idwei_ann);
v=w1.mc; a2=squeeze(v.netradclr_idwei_ann); w1.mc.diff.netradclr_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.mc; a2=squeeze(v.netradclr_idwei_ann); w2.mc.diff.netradclr_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.mc; a1=squeeze(v.lwcf_idwei_ann);
v=w1.mc; a2=squeeze(v.lwcf_idwei_ann); w1.mc.diff.lwcf_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.mc; a2=squeeze(v.lwcf_idwei_ann); w2.mc.diff.lwcf_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.mc; a1=squeeze(v.swcf_idwei_ann);
v=w1.mc; a2=squeeze(v.swcf_idwei_ann); w1.mc.diff.swcf_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.mc; a2=squeeze(v.swcf_idwei_ann); w2.mc.diff.swcf_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
%all storms
v=v0.al; a1=v.frqday_all;
v=w1.al; a2=v.frqday_all; w1.al.diff.frqday=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.al; a2=v.frqday_all; w2.al.diff.frqday=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.al; a1=squeeze(v.prday_idwei_ann);
v=w1.al; a2=squeeze(v.prday_idwei_ann); w1.al.diff.prday_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.al; a2=squeeze(v.prday_idwei_ann); w2.al.diff.prday_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.al; a1=squeeze(v.netrad_idwei_ann);
v=w1.al; a2=squeeze(v.netrad_idwei_ann); w1.al.diff.netrad_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.al; a2=squeeze(v.netrad_idwei_ann); w2.al.diff.netrad_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.al; a1=squeeze(v.netradclr_idwei_ann);
v=w1.al; a2=squeeze(v.netradclr_idwei_ann); w1.al.diff.netradclr_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.al; a2=squeeze(v.netradclr_idwei_ann); w2.al.diff.netradclr_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.al; a1=squeeze(v.lwcf_idwei_ann);
v=w1.al; a2=squeeze(v.lwcf_idwei_ann); w1.al.diff.lwcf_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.al; a2=squeeze(v.lwcf_idwei_ann); w2.al.diff.lwcf_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
v=v0.al; a1=squeeze(v.swcf_idwei_ann);
v=w1.al; a2=squeeze(v.swcf_idwei_ann); w1.al.diff.swcf_idwei=compute_gmean_frqday(a1,a2,dT1,aa)
v=w2.al; a2=squeeze(v.swcf_idwei_ann); w2.al.diff.swcf_idwei=compute_gmean_frqday(a1,a2,dT2,aa)
