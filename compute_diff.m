function [diff,me,pdiff,a1_avg,a2_avg,idx]=compute_diff(a1,s1,n1,a2,s2,n2,num,nyr1,nyr2,aa,mskopt)
%a1=squeeze(v1.tc.prday_idavg); a2=squeeze(w1.tc.prday_idavg); 
%s1=squeeze(v1.tc.prday_idstd); s2=squeeze(w1.tc.prday_idstd); 
%n1=squeeze(v1.tc.id_sum);      n2=squeeze(w1.tc.id_sum); 

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
id1= (n1<num) | (n2<num) ; 
id2=abs(diff)<me; id3=(pdiff>50000) | (pdiff<-50000);
id=id1|id2|id3; idx=id2;
if mskopt==0
  disp('not doing masking');
elseif mskopt==1
  diff(id) =NaN;
  pdiff(id)=NaN;
end

a=a1; f=n1/(365*nyr1); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*nyr2); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);

return


%se=sqrt(s1^2/n1+s2^2/n2);
%df=round((s1^2/n1+s2^2/n2)^2/((s1^2/n1)^2/(n1-1)+(s2^2/n2)^2/(n2-1)));
%v.mgnerr=tscore*se;

figure; pcolor(p.z1);  shading flat; colorbar; caxis([-5 5]); colormap(jet);
figure; pcolor(p.pd1); shading flat; colorbar; caxis([-1 1]); colormap(jet);
figure; pcolor(p.z1);  shading flat; colorbar; caxis([-5  5]);  colormap(jet);
figure; pcolor(p.pd1/4.52); shading flat; colorbar; caxis([-20 20]); colormap(jet);
