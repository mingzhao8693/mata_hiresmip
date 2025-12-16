function [d]=getoneyear(v,id_ca,aa)
a=id_ca.*aa; a0=sum(sum(a,3),2);
d.frqday_org  = sum(sum(v.frqday_org .*a,3),2)./a0;
d.prday_av    = sum(sum(v.prday_av   .*a,3),2)./a0; 
d.prday_idwei = sum(sum(v.prday_idwei.*a,3),2)./a0;

b=v.prday_idavg; b(isnan(b))=0; d.prday_idavg=sum(sum(b.*a,3),2)./a0;
b=v.prday_idstd; b(isnan(b))=0; d.prday_idstd=sum(sum(b.*a,3),2)./a0;
b=v.prday_idmax; b(isnan(b))=0; d.prday_idmax=sum(sum(b.*a,3),2)./a0;
for i=1:length(v.prday_idpct(1,:,1,1))
  b=squeeze(v.prday_idpct(:,i,:,:));
  b(isnan(b))=0;
  d.prday_idpct(i,:)=sum(sum(b.*a,3),2)./a0;
end
return
