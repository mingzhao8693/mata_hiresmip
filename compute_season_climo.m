function [a]=compute_season_climo(a,nyr,n1,n2)
  [nt nlat nlon]=size(a); 
  nday=nt/nyr;
  a=reshape(a,nday,nyr,nlat,nlon);
  if ~exist('n1','var'); n1=1;   end;
  if ~exist('n2','var'); n2=nyr; end;
  a=squeeze(nanmean(a(:,n1:n2,:,:),2));
  a=squeeze(nanmean(a,1));
  return
