function [d]=get_fdbk(CM4,ESM,SP1,SP4,a40,df,t1,t2,opt)
%t1=1; t2=150; 
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
a=CM4.c0.sfc.tref.all (1:100,:,:,:); c1=squeeze(mean(mean(a,2),1));
a=CM4.w0.sfc.tref.all (t1:t2,:,:,:); w1=squeeze(mean(a,2));
a=ESM.c0.sfc.tref.all (1:100,:,:,:); c2=squeeze(mean(mean(a,2),1));
a=ESM.w0.sfc.tref.all (t1:t2,:,:,:); w2=squeeze(mean(a,2));
a=SP1.c0.sfc.tref.all (1:100,:,:,:); c3=squeeze(mean(mean(a,2),1));
a=SP1.w0.sfc.tref.all (t1:t2,:,:,:); w3=squeeze(mean(a,2));
a=SP4.c0.sfc.tref.all (1:100,:,:,:); c4=squeeze(mean(mean(a,2),1));
a=SP4.w0.sfc.tref.all (t1:t2,:,:,:); w4=squeeze(mean(a,2));
a=a40.c0.sfc.tref.all (:    ,:,:,:); c5=squeeze(mean(mean(a,2),1));
a=a40.W0.sfc.tref.all (:    ,:,:,:); w5=squeeze(mean(mean(a,2),1));
a=a40.W1.sfc.tref.all (:    ,:,:,:); w6=squeeze(mean(mean(a,2),1));

a=CM4.c0.toa.netrad.all (1:100,:,:,:); C1=squeeze(mean(mean(a,2),1));
a=CM4.w0.toa.netrad.all (t1:t2,:,:,:); W1=squeeze(mean(a,2));
a=ESM.c0.toa.netrad.all (1:100,:,:,:); C2=squeeze(mean(mean(a,2),1));
a=ESM.w0.toa.netrad.all (t1:t2,:,:,:); W2=squeeze(mean(a,2));
a=SP1.c0.toa.netrad.all (1:100,:,:,:); C3=squeeze(mean(mean(a,2),1));
a=SP1.w0.toa.netrad.all (t1:t2,:,:,:); W3=squeeze(mean(a,2));
a=SP4.c0.toa.netrad.all (1:100,:,:,:); C4=squeeze(mean(mean(a,2),1));
a=SP4.w0.toa.netrad.all (t1:t2,:,:,:); W4=squeeze(mean(a,2));
a=a40.c0.toa.netrad.all (:    ,:,:,:); C5=squeeze(mean(mean(a,2),1));
a=a40.W0.toa.netrad.all (:    ,:,:,:); W5=squeeze(mean(mean(a,2),1));
a=a40.W1.toa.netrad.all (:    ,:,:,:); W6=squeeze(mean(mean(a,2),1));

a=CM4.c0.sfc.netflx.all (1:100,:,:,:); C1s=squeeze(mean(mean(a,2),1));
a=CM4.w0.sfc.netflx.all (t1:t2,:,:,:); W1s=squeeze(mean(a,2));
a=ESM.c0.sfc.netflx.all (1:100,:,:,:); C2s=squeeze(mean(mean(a,2),1));
a=ESM.w0.sfc.netflx.all (t1:t2,:,:,:); W2s=squeeze(mean(a,2));
a=SP1.c0.sfc.netflx.all (1:100,:,:,:); C3s=squeeze(mean(mean(a,2),1));
a=SP1.w0.sfc.netflx.all (t1:t2,:,:,:); W3s=squeeze(mean(a,2));
a=SP4.c0.sfc.netflx.all (1:100,:,:,:); C4s=squeeze(mean(mean(a,2),1));
a=SP4.w0.sfc.netflx.all (t1:t2,:,:,:); W4s=squeeze(mean(a,2));

n=5; N=t2/n; beta=1.;

if opt==0
 fav=df.av;  dT_co2=df.T;
elseif opt==1
 fav=df.av+df.F_av_veg;  dT_co2=df.T+df.T_veg;
elseif opt==2
 fav=df.av2; dT_co2=df.T2; 
elseif opt==3
 fav=df.av3; dT_co2=df.T3;
end
for i=1:N
  ts(i)=n*(i-1)+1; te(i)=ts(i)+n-1;
  a=squeeze(mean(w1 (ts(i):te(i),:,:),1)); a=a-c1; dT1(i)=mean(mean(a.*aa));
  a=squeeze(mean(w2 (ts(i):te(i),:,:),1)); a=a-c2; dT2(i)=mean(mean(a.*aa));
  a=squeeze(mean(w3 (ts(i):te(i),:,:),1)); a=a-c3; dT3(i)=mean(mean(a.*aa));
  a=squeeze(mean(w4 (ts(i):te(i),:,:),1)); a=a-c4; dT4(i)=mean(mean(a.*aa));
  a=squeeze(mean(W1 (ts(i):te(i),:,:),1)); a=a-C1-fav; dN1(i)=mean(mean(a.*aa));
  a=squeeze(mean(W2 (ts(i):te(i),:,:),1)); a=a-C2-fav; dN2(i)=mean(mean(a.*aa));
  a=squeeze(mean(W3 (ts(i):te(i),:,:),1)); a=a-C3-fav; dN3(i)=mean(mean(a.*aa));
  a=squeeze(mean(W4 (ts(i):te(i),:,:),1)); a=a-C4-fav; dN4(i)=mean(mean(a.*aa));
  a=squeeze(mean(W1s(ts(i):te(i),:,:),1)); a=a-C1s;   dN1s(i)=mean(mean(a.*aa));
  a=squeeze(mean(W2s(ts(i):te(i),:,:),1)); a=a-C2s;   dN2s(i)=mean(mean(a.*aa));
  a=squeeze(mean(W3s(ts(i):te(i),:,:),1)); a=a-C3s;   dN3s(i)=mean(mean(a.*aa));
  a=squeeze(mean(W4s(ts(i):te(i),:,:),1)); a=a-C4s;   dN4s(i)=mean(mean(a.*aa));
end
a=w5-c5; dT5=mean(mean(a.*aa));
a=W5-C5; dN5=mean(mean(a.*aa));
a=w6-c5; dT6=mean(mean(a.*aa));
a=W6-C5; dN6=mean(mean(a.*aa));

d.fb1=(dN1)./(dT1-dT_co2);
d.fb2=(dN2)./(dT2-dT_co2);
d.fb3=(dN3)./(dT3-dT_co2);
d.fb4=(dN4)./(dT4-dT_co2);

if opt==1
  d.fb4=(dN4+df.F_veg)./(dT4-dT_co2+df.T_veg);
  d.fb5(1:2)=(dN5-df.F_veg)/(dT5-df.T_veg);
  d.fb6(1:2)=(dN6-df.F_veg)/(dT6-df.T_veg);
else
  d.fb5(1:2)=dN5/dT5;
  d.fb6(1:2)=dN6/dT6;
end
return
