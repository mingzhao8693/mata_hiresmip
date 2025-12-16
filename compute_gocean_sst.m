function [v]=compute_gocean_sst(sst,imk,lmk,aa)
lmk0=0.5; imk0=0.5;
for m=1:12
  a=aa; 
  im=squeeze(imk(m,:,:)); 
  id=~((lmk>lmk0)|(im>imk0));
  a=a/mean(a(id)); 
  b=sst(m,:,:);
  sst_omean_mon(m)=mean(b(id).*a(id));
  ssta(m,:,:)=sst(m,:,:)-sst_omean_mon(m);
end
sst_omean_ann=mean(sst_omean_mon);

v.clm  = ssta;
v.clm0 = sst_omean_mon;
v.ann0 = sst_omean_ann;

return



sst=a40.c0.sfc.tsurf.clm;
imk=a40.c0.sfc.ice.clm;

a=compute_gocean_sst(sst,imk,s.lm0,s.aa)
