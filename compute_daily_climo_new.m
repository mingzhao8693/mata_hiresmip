function [v]=compute_daily_climo_new(a,nyr,pct,n1,n2)
%  pct=[0.1 1 5 10 25 50 75 90 95 99 99.9]; 
  [nt nlat nlon]=size(a);
  nday=nt/nyr;
  a=reshape(a,nday,nyr,nlat,nlon);
  if ~exist('n1','var'); n1=1;   end;
  if ~exist('n2','var'); n2=nyr; end;
  nyr=n2-n1+1;
  v.daily_climo=squeeze(mean(a(:,n1:n2,:,:),2));
  
  b=[1  32 60  91 121 152 182 213 244 274 305 335];
  e=[31 59 90 120 151 181 212 243 273 304 334 365];
  for m=1:12
    i1=b(m); i2=e(m);
    tmp=a(i1:i2,n1:n2,:,:);
    tmp=reshape(tmp,(i2-i1+1)*nyr,nlat,nlon);
    v.pct(m,:,:,:)=prctile(tmp,pct,1);
    v.std(m,:,:,:)=std(tmp,0,1);
  end
  
%below v.pct(13:19) contain ANN,MAM,JJA,SON,DJF percentile values  
  b = [1   60  152 244 335];
  e = [365 151 243 334 365];
  for m=1:4
    i1=b(m); i2=e(m);
    tmp=a(i1:i2,n1:n2,:,:);
    tmp=reshape(tmp,(i2-i1+1)*nyr,nlat,nlon);
    v.pct(m+12,:,:,:)=prctile(tmp,pct,1);
    v.std(m+12,:,:,:)=std(tmp,0,1);
  end
  
  s=circshift(a, 31, 1); %s(32,:,:)==a(1,:,:); s(90,:,:)==a(59,:,:); s(1,:,:)==a(335,:,:);
  i1=1; i2=90;
  tmp=a(i1:i2,n1:n2,:,:);
  tmp=reshape(tmp,(i2-i1+1)*nyr,nlat,nlon);
  v.pct(17,:,:,:)=prctile(tmp,pct,1);
  v.std(17,:,:,:)=std(tmp,0,1);

  return
