function [x]=findpdf(a,bin)
dbin=diff(bin); 
binc=(bin(1:end-1)+bin(2:end))/2;
n=histc(a,bin);
n=n(1:end-1);
n=n/sum(n)./dbin; 
x.pdf =n;
x.men =mean(a);
x.binc=binc;
x.dbin=dbin;

%x.pct=[50 75 85 95 99 99.9 99.99];
x.pct=[1:1:99];
for i=1:length(x.pct)
  x.pctile(i) =prctile(a,x.pct(i));
end
%x.p75 =prctile(a,75);
%x.p85 =prctile(a,85);
%x.p95 =prctile(a,95);
%x.p99 =prctile(a,99);
%x.p999=prctile(a,99.9);
%x.p9999=prctile(a,99.99);
return
