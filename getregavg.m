function [d]=getregavg(v,id_ca,aa)
d.year=v.yr1;
id0=(id_ca==1); a0=aa(id0); a0=a0/mean(a0);
for m=1:12;
  f=squeeze(v.frqday     (m,:,:)); f=f(id0); d.frqday     (m)=sum(f.*a0)/sum(a0);
  a=squeeze(v.prday_av   (m,:,:)); a=a(id0); d.prday_av   (m)=sum(a.*a0)/sum(a0);
  a=squeeze(v.prday_idwei(m,:,:)); a=a(id0); d.prday_idwei(m)=sum(a.*a0)/sum(a0);
  
  a=squeeze(v.prday_idavg(m,:,:)); a=a(id0); id=~isnan(a);
  d.prday_idavg(m)=sum(a(id).*f(id).*a0(id))./sum(f(id).*a0(id));
  a=squeeze(v.prday_idstd(m,:,:)); a=a(id0); id=~isnan(a);
  d.prday_idstd(m)=sum(a(id).*f(id).*a0(id))./sum(f(id).*a0(id));
  a=squeeze(v.prday_idmax(m,:,:)); a=a(id0); id=~isnan(a);
  d.prday_idmax(m)=sum(a(id).*f(id).*a0(id))./sum(f(id).*a0(id));

  for i=1:length(v.prday_idpct(1,:,1,1))
    a=squeeze(v.prday_idpct(m,i,:,:)); a=a(id0); id=~isnan(a);
    d.prday_idpct(i,m)=sum(a(id).*f(id).*a0(id))./sum(f(id).*a0(id));
  end
end

return
