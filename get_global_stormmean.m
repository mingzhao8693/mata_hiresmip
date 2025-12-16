function z1_mean=get_global_stormmean(z1,n1,aa)
%z1=squeeze(v.pd.swcf_idavg);
%n1=squeeze(v.pd.frqday);
z1=squeeze(z1); n1=squeeze(n1);
f=n1.*aa; id=f==0; z1(id)=0;
z1_mean=sum(sum(z1.*f))/sum(sum(f));

