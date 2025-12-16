function [b]=get_sea_mean(a)
%a(nmon,nyr,nlat,nlon)
b.ann=squeeze(nanmean(a,1));
b.mam=squeeze(nanmean(a(3:5,:,:),1));
b.jja=squeeze(nanmean(a(6:8,:,:),1));
b.son=squeeze(nanmean(a(9:11,:,:),1));
c(1,:,:)=a(12,:,:);
c(2,:,:)=a( 1,:,:);
c(3,:,:)=a( 2,:,:);
b.djf=squeeze(nanmean(c,1));
b.m2o=squeeze(nanmean(a(5:9,:,:),1));
c=circshift(a,2,1);
b.n2m=squeeze(nanmean(a(1:5,:,:),1));
%a.djf=((a.mon(12,:,:)+a.mon(1,:,:)+a.mon(2,:,:))/3;
