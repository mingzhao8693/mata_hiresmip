function [a]=compute_daily_climo(a,n1,n2)
  [nt nlat nlon]=size(a);
  nyr=nt/365;
  a=reshape(a,365,nyr,nlat,nlon); size(a)
  if ~exist('n1','var'); n1=1;   end;
  if ~exist('n2','var'); n2=nyr; end;
  a=squeeze(mean(a(:,n1:n2,:,:),2));
  return
