function [v]=compute_gocean_sst_mon(sst,imk,lmk,aa)
% $$$ c=AM4.c1; w=AM4.w1; t1=1; t2=150; nt=t2-t1+1;
% $$$ a=c.sfc.tsurf.all(:,:,:,:); sst_clm=squeeze(mean(a,1)); 
% $$$ a=repmat(sst_clm,[1 1 1 nt]); a=permute(a,[4,1,2,3]);
% $$$ sst=w.sfc.tsurf.all(t1:t2,:,:,:)-a; %SST warming anomalies
% $$$ imk=w.sfc.ice.all; lmk=c.s.lm0; aa=s.aa;
nt=length(sst(:,1,1,1));
for t=1:nt
  for m=1:12
    a=aa; 
    im=squeeze(imk(t,m,:,:)); 
    id=~((lmk>0)|(im>0));
    a=a/mean(a(id)); 
    b=sst(t,m,:,:);
    ts_sst_omean_mon(t,m)=mean(b(id).*a(id));
    ssta(t,m,:,:)=sst(t,m,:,:)-ts_sst_omean_mon(t,m);
  end
end
ts_sst_omean_ann=mean(ts_sst_omean_mon,2);

v.sst              = sst;
v.ssta             = ssta;
v.ssta_ann         = squeeze(mean(ssta,2));
v.ssta_ann0        = squeeze(mean(mean(ssta,2),1));
v.ts_sst_omean_mon = ts_sst_omean_mon;
v.ts_sst_omean_ann = ts_sst_omean_ann;
v.ssta_clm         = squeeze(mean(ssta,1));
v.sst_clm          = squeeze(mean(sst,1));
return


b=sst_omean_mon; b=repmat(b,[1 1 s.nlat,s.nlon]);
a=ssta-b; 

t1=1; t2=150; a=squeeze(mean(v.ssta_ann(t1:t2,:,:),1)); a(~id)=NaN;
figure; pcolor(a); 
shading flat; colorbar; caxis([-5 5]); 
colormap(bluewhitered(256)); %colormap(jet);


sst=w.sfc.tsurf.all; imk=w.sfc.ice.all; lmk=w.lm0; aa=w.aa0;
v=compute_gocean_sst_mon(sst,imk,s.lm0,s.aa)
