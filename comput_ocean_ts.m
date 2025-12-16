function [x]=comput_ocean_ts(sfc,t1,t2,lm,aa)
sst_climo=squeeze(mean(sfc.tsurf.all(t1:t2,:,:,:),1));
ice_climo=squeeze(mean(sfc.ice.all  (t1:t2,:,:,:),1));
for m=1:12
  a=aa; 
  im=squeeze(ice_climo(m,:,:));
  id=~((lm>0)|(im>0));
  a=a/mean(a(id));
  b=squeeze(sst_climo(m,:,:));
  sst_omean(m)=mean(b(id).*a(id));
end
x.sst_omean0=mean(sst_omean);
x.sst_omean =sst_omean;

return

x1=comput_ocean_ts(CM4.c0.sfc,101,150,lm,aa);
