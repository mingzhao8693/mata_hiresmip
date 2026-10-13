function d=compute_diff_sig(a1,s1,n1,a2,s2,n2,num,idl,aa,mskopt)
id=idl;
for i=1:length(a1(:,1,1))
  a=squeeze(a1(i,:,:)); id1=~isnan(a); id=idl&id1; avg.sumid(i)=sum(sum(id));
  b=aa; b=b(id)/mean(b(id)); a1_ts(i)=mean(a(id).*b);
  a=squeeze(a2(i,:,:)); id1=~isnan(a); id=idl&id1;
  b=aa; b=b(id)/mean(b(id)); a2_ts(i)=mean(a(id).*b);
end
a=a1_ts; a1_avg=mean(a); a1_std=std(a);
a=a2_ts; a2_avg=mean(a); a2_std=std(a);
diff_avg= a2_avg - a1_avg; pdiff_avg=diff_avg./a1_avg*100.;
c1  = a1_std.^2./n1;
c2  = a2_std.^2./n2;
se_avg = sqrt(c1+c2);

a1=squeeze(mean(a1,1));
a2=squeeze(mean(a2,1));

diff= a2 - a1; pdiff=diff./a1*100.;
c1  = s1.^2./n1;
c2  = s2.^2./n2;
se  = sqrt(c1+c2);
%df  = round((c1+c2).^2/(c1.^2./(n1-1)+c2.^2./(n2-1)));

%find tscore (small sample) based on df or
%find zscore (large sample)

%large sample use z-score
%critical value is a factor used to compute the margin of error
%because sample sizes are large enough, we express the critical
%value as z-score. To find the critical value, we take the
%following steps, using confidence level of 95 as an example:
%1) compute alpha=1-(confidence_level/100)=1-(95/100)=0.05
%2) find critical probability: pvalue=1-alpha/2=1-0.05/2=0.975
%3) the critical vaue is the z-score having a cumulative probability
%   equal to pvalue. From the normal distribution calculator, we
%   find that the critical value is xx

%specify the confidence interval. The range of the confidence
%interval is defined by the sample statistics plus/minus margin of error
%me=tscore*se or zscore*se;
%zscore=2.576; %corresponding 99% confidence level
%zscore=2.326; %corresponding 98% confidence level
%zscore=1.960; %corresponding 95% confidence level
 zscore=1.645; %corresponding 90% confidence level
%zscore=1.440; %corresponding 85% confidence level
%zscore=1.282; %corresponding 80% confidence level
%zscore=1.150; %corresponding 75% confidence level
%zscore=1.036; %corresponding 70% confidence level
%zscore=0.674; %corresponding 50% confidence level
me=zscore*se; 
id1 = (n1<num) | (n2<num) ; 
id2 = abs(diff)<me;
id3 = (pdiff>50000) | (pdiff<-50000);
id  = id1|id2|id3;
idx = id2; %region of insignficant
if mskopt==0
  disp('not doing masking');
elseif mskopt==1
  diff(id) =NaN;
  pdiff(id)=NaN;
end

d.a1_avg=a1; d.a2_avg=a2; d.diff=diff; d.pdiff=pdiff; d.me=me; d.idx=idx;

me_avg=zscore*se_avg; idx_avg=abs(diff_avg)<me_avg;

avg.a1_ts=a1_ts;
avg.a2_ts=a2_ts;
avg.diff =diff_avg;
avg.pdiff=pdiff_avg;
avg.me   =me_avg;
avg.idx  =idx_avg;
d.avg=avg;

return


%se=sqrt(s1^2/n1+s2^2/n2);
%df=round((s1^2/n1+s2^2/n2)^2/((s1^2/n1)^2/(n1-1)+(s2^2/n2)^2/(n2-1)));
%v.mgnerr=tscore*se;

figure; pcolor(p.z1);  shading flat; colorbar; caxis([-5 5]); colormap(jet);
figure; pcolor(p.pd1); shading flat; colorbar; caxis([-1 1]); colormap(jet);
figure; pcolor(p.z1);  shading flat; colorbar; caxis([-5  5]);  colormap(jet);
figure; pcolor(p.pd1/4.52); shading flat; colorbar; caxis([-20 20]); colormap(jet);
