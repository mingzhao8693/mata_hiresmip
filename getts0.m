function [ts ts0]=getts0(all,s)
%all=o.toa.lwcf.all; clm=o.toa.lwcf.clm;
aa=s.aa;
nyr=length(all(:,1,1,1)); 
for t=1:nyr
  for m=1:12
    x=squeeze(all(t,m,:,:));
    ts(t,m)=mean(mean(x.*aa));
  end
  ts0(t)=mean(ts(t,:),2);
end
return

