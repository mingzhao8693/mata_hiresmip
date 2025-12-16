function [b]=get_clm_ann(a)
%a(nmon,nyr,nlat,nlon)
b.mon=squeeze(nanmean(a,2));
b.ann=squeeze(nanmean(b.mon,1));
b.mam=squeeze(nanmean(b.mon(3:5,:,:),1));
b.jja=squeeze(nanmean(b.mon(6:8,:,:),1));
b.son=squeeze(nanmean(b.mon(9:11,:,:),1));
c(1,:,:)=b.mon(12,:,:);
c(2,:,:)=b.mon( 1,:,:);
c(3,:,:)=b.mon( 2,:,:);
b.djf=squeeze(nanmean(c,1));

c(1,:,:)=b.mon(11,:,:);
c(2,:,:)=b.mon(12,:,:);
c(3,:,:)=b.mon( 1,:,:);
c(4,:,:)=b.mon( 2,:,:);
c(5,:,:)=b.mon( 3,:,:);
b.ndjfm=squeeze(nanmean(c,1));

b.mjjas=squeeze(nanmean(b.mon(5:9,:,:),1));

return
