function [p]=onelev_tavg(v,w500,qc500,ti,wbin_up,wbin_dn,wbin,pctile,qc_th)

a=w500; b=qc500; nt_new=floor(v.nt/ti);
for i=1:nt_new
  t1=ti*(i-1)+1; t2=t1+ti-1;
  wx(i,:,:)=squeeze(mean(a(t1:t2,:,:),1));
  qx(i,:,:)=squeeze(mean(b(t1:t2,:,:),1));
end

v.nt=nt_new;
p=onelev(v,wx, qx, wbin_up, wbin_dn, wbin, pctile, qc_th);


