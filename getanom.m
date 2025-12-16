function ano=getanom(x);
all=x.all; clm=x.clm;
ts =x.al0; clm0=squeeze(mean(ts,1));
nyr=length(all(:,1,1,1));
for t=1:nyr
  y1(t,:,:,:)=clm;
  y2(t,:) = clm0;
end
ano.all=all-y1;
ano.avg=ts -y2;
ano.al0=x.al0;
return
