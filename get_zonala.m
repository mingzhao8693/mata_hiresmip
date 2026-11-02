function [a]=get_zonala(a0)
if length(size(a0))==2
  a=squeeze(nanmean(a0,2));
  nlon=length(a0(1,:));
  a=repmat(a,[1 nlon]);
  a=a0-a;
elseif length(size(a0))==3
  a=squeeze(nanmean(a0,3));
  nlon=length(a0(1,1,:));
  a=repmat(a,[1 1 nlon]);
  a=a0-a;
end
return
