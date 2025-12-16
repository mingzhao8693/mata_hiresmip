function [v]=compute_gmean_mon(var,imk,lmk,aa)
% $$$ c=AM4.c1; w=AM4.w1; t1=1; t2=150; nt=t2-t1+1;
% $$$ a=c.sfc.tsurf.all(:,:,:,:); sst_clm=squeeze(mean(a,1)); 
% $$$ a=repmat(sst_clm,[1 1 1 nt]); a=permute(a,[4,1,2,3]);
% $$$ sst=w.sfc.tsurf.all(t1:t2,:,:,:)-a; %SST warming anomalies
% $$$ imk=w.sfc.ice.all; lmk=c.s.lm0; aa=s.aa;
nt=length(var(:,1,1,1));
for t=1:nt
  for m=1:12
    a=aa; 
    im=squeeze(imk(t,m,:,:)); 
    id_l= ((lmk>0)|(im>0)); id=id_l; a_l=a(id)/mean(a(id));
    id_o=~((lmk>0)|(im>0)); id=id_o; a_o=a(id)/mean(a(id)); 
    
    b=var(t,m,:,:);
    id=id_o; ts_omean_mon(t,m)=mean(b(id).*a_o);
    id=id_l; ts_lmean_mon(t,m)=mean(b(id).*a_l);
    va(t,m,:,:)=var(t,m,:,:)-ts_omean_mon(t,m);
  end
end
ts_omean_ann=mean(ts_omean_mon,2);
ts_lmean_ann=mean(ts_lmean_mon,2);

v.ts_omean_mon = ts_omean_mon;
v.ts_omean_ann = ts_omean_ann;
v.ts_lmean_mon = ts_lmean_mon;
v.ts_lmean_ann = ts_lmean_ann;
v.va           = va;
v.va_clm       = squeeze(mean(va,1));
v.va_ann       = squeeze(mean(va,2));
v.va_ann0      = squeeze(mean(mean(va,2),1));

return


b=sst_omean_mon; b=repmat(b,[1 1 s.nlat,s.nlon]);
a=ssta-b; 

t1=1; t2=150; a=squeeze(mean(v.ssta_ann(t1:t2,:,:),1)); a(~id)=NaN;
figure; pcolor(a); 
shading flat; colorbar; caxis([-5 5]); 
colormap(bluewhitered(256)); %colormap(jet);


sst=w.sfc.tsurf.all; imk=w.sfc.ice.all; lmk=w.lm0; aa=w.aa0;
v=compute_gocean_sst_mon(sst,imk,s.lm0,s.aa)
