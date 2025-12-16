function [a]=get_zonala(a0)
  a=squeeze(nanmean(a0,2));
  nlon=length(a0(1,:));
  a=repmat(a,[1 nlon]);
  a=a0-a;
  return
