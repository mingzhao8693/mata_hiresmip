function x=compute_diff_gf(a1,s1,a2,s2,nyr1,nyr2,score,aa,mskopt)
%a1=squeeze(v1.tc.prday_idavg); a2=squeeze(w1.tc.prday_idavg); 
%s1=squeeze(v1.tc.prday_idstd); s2=squeeze(w1.tc.prday_idstd); 
%n1=squeeze(v1.tc.id_sum);      n2=squeeze(w1.tc.id_sum); 
nmon=1; 
a=a1; a(:,:,:)=nyr1*nmon; n1=a; 
a=a2; a(:,:,:)=nyr2*nmon; n2=a; 
diff= a2 - a1;
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
%zscore=1.960; %corresponding 95% confidence level
%zscore=1.645; %corresponding 90% confidence level
%zscore=1.404; %corresponding 85% confidence level
%zscore=1.282; %corresponding 80% confidence level
%zscore=1.037; %corresponding 70% confidence level
me=2.576*se; id1=abs(diff)>me; x.id1=id1; %99%
me=1.960*se; id2=abs(diff)>me; x.id2=id2; %95%
me=1.645*se; id3=abs(diff)>me; x.id3=id3; %90%
me=1.440*se; id4=abs(diff)>me; x.id4=id4; %85%
me=score*se; id =abs(diff)>me; x.id =id;  %xx%
if mskopt==0
  %disp('not doing masking');
elseif mskopt==1
  diff(~id)=0;
end

for i=1:length(a1(:,1,1))
  a=squeeze(a1(i,:,:)); idx=~isnan(a); b=aa; b=b(idx)/mean(b(idx)); a1_avg(i)=mean(a(idx).*b);
  a=squeeze(a2(i,:,:)); idx=~isnan(a); b=aa; b=b(idx)/mean(b(idx)); a2_avg(i)=mean(a(idx).*b);
end

x.diff=diff;
x.se  =se;
x.a1_avg=a1_avg;
x.a2_avg=a2_avg;
return


%se=sqrt(s1^2/n1+s2^2/n2);
%df=round((s1^2/n1+s2^2/n2)^2/((s1^2/n1)^2/(n1-1)+(s2^2/n2)^2/(n2-1)));
%v.mgnerr=tscore*se;

figure; pcolor(p.z1);  shading flat; colorbar; caxis([-5 5]); colormap(jet);
figure; pcolor(p.pd1); shading flat; colorbar; caxis([-1 1]); colormap(jet);
figure; pcolor(p.z1);  shading flat; colorbar; caxis([-5  5]);  colormap(jet);
figure; pcolor(p.pd1/4.52); shading flat; colorbar; caxis([-20 20]); colormap(jet);
