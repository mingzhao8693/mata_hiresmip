function [v]=compute_month_from_daily(a)

v.ann=squeeze(nanmean(a,1));
b=[1  32 60  91 121 152 182 213 244 274 305 335]
e=[31 59 90 120 151 181 212 243 273 304 334 365
for i=1:12
  n1=b(i); n2=e(i); v.mon(i,:,:)=squeeze(nanmean(a(n1:n2,:,:),1));
end

return
