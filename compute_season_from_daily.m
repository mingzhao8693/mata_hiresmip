function [v]=compute_season_from_daily(a)

ann=squeeze(nanmean(a,1));
b = [1  60  152 244 335];
e = [59 151 243 334 365];
i=2; n1=b(i); n2=e(i); mam=squeeze(nanmean(a(n1:n2,:,:),1));
i=3; n1=b(i); n2=e(i); jja=squeeze(nanmean(a(n1:n2,:,:),1));
i=4; n1=b(i); n2=e(i); son=squeeze(nanmean(a(n1:n2,:,:),1));

s=circshift(a, 31, 1); %s(32,:,:)==a(1,:,:); s(90,:,:)==a(59,:,:); s(1,:,:)==a(335,:,:);
djf=squeeze(nanmean(s(1:90,:,:),1));
  
v.ann=ann; v.mam=mam; v.jja=jja; v.son=son; v.djf=djf;

b=[1  32 60  91 121 152 182 213 244 274 305 335];
e=[31 59 90 120 151 181 212 243 273 304 334 365];
for k=1:12
  n1=b(k); n2=e(k);
  tmp=a(n1:n2,:,:);
  v.mon(k,:,:)=nanmean(tmp,1);
end

return
