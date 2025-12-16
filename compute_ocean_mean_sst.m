function [v]=compute_ocean_mean_sst(sst,imk,lmk,aa)
for m=1:12
  a=aa; 
  im=squeeze(imk(:,:,m)); 
  id=~((lmk>0)|(im>0));
  a=a/mean(a(id)); 
  b=sst(:,:,m);
  sst_omean(m)=mean(b(id).*a(id));
end
sst_omean_ann=mean(sst_omean);

v.sst_omean = sst_omean;
v.sst_omean_ann = sst_omean_ann;
v.dsst = sst/sst_omean_ann*2;

nlon=length(sst(:,1,1));
nlat=length(sst(1,:,1));
for m=1:12
  for j=1:nlat
    im=squeeze(imk(:,j,m)); 
    lm=squeeze(lmk(:,j)); 
    id=~((lm>0)|(im>0));
    if sum(id)>0
      sst_ozmean_2d(j,m) = mean(sst(id,j,m));
    else
      sst_ozmean_2d(j,m) = mean(sst(:,j,m));
    end
    sst_ozmean_3d(1:nlat,j,m)=sst_ozmean_2d(j,m);
  end
end
v.sst_ozmean_2d=sst_ozmean_2d;
v.sst_ozmean_3d=sst_ozmean_3d;

return
