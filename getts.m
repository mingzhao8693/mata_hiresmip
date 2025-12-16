function ts=getts(all,s)
%all=o.toa.lwcf.all; clm=o.toa.lwcf.clm;
aa=s.aa; lm_th=0.5;
id=(s.lm<=lm_th); aa=aa/mean(aa(id));
nyr=length(all(:,1,1,1)); 
for t=1:nyr
  for m=1:12
    x=squeeze(all(t,m,:,:));
    x=x(id).*aa(id);
    ts(t,m)=mean(x);
  end
end
return

