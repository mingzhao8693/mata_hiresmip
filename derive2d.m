function v=derive2d(a,s);
aa=s.aa; v.fn='derived quantity';

v.clm=squeeze(mean(a,1));
v.ann=squeeze(mean(v.clm,1));
v.all=a;
v.al0=getts(v.all,s)
v.sea=get4season(v.clm); 

n=length(v.sea(:,1,1));
for i=1:n
  a=squeeze(v.sea(i,:,:)); 
  v.sea0(i)=nanmean(nanmean(a.*aa));
end

v.clm0=mean(v.al0,1);
v.ts0 =mean(v.al0,2)';
v.ann0=mean(v.ts0);

return


