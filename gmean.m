function [v]=gmean(a,aa,opt)
b=squeeze(mean(a,2)); nt=length(b(:,1,1));
for t=1:nt
  b0=squeeze(b(t,:,:));
  v.ts(t)=mean(mean(b0.*aa));
end
a=squeeze(mean(mean(a,1),2));
v.gm=mean(mean(a.*aa,1));
if (opt == 0)
  v.zm=squeeze(mean(a,2));
elseif (opt==1)
  v.zm=squeeze(mean(a.*aa,2));
else
  x=a.*aa; x(isnan(x))=0;
  v.gm=mean(mean(x));
  v.zm=squeeze(nanmean(a,2));
end
v.av=a;
return
