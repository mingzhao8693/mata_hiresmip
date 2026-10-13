function d=compute_diff_sigtest(a1,s1,n1,a2,s2,n2,num,idl,aa,mskopt,testopt,conf_level)

% ============================================================
% Statistical significance of differences between two datasets
%
% testopt:
%   1 = z-test (normal approximation)
%   2 = Welch's two-sample t-test
%
% conf_level:
%   90 = 90% confidence
%   95 = 95% confidence
%   99 = 99% confidence
%
% mskopt:
%   0 = no masking
%   1 = mask insignificant differences
%
% d.idx = 1 indicates statistically insignificant
% d.pvalue = two-sided p-value
%
% Assumes independent samples.
% ============================================================

if nargin < 11 || isempty(testopt)
    testopt = 1;
end

if nargin < 12 || isempty(conf_level)
    conf_level = 90;
end

alpha = 1-conf_level/100;

if ~ismember(testopt,[1 2])
    error('testopt must be 1 (z-test) or 2 (t-test)');
end

if conf_level <= 0 || conf_level >= 100
    error('conf_level must be between 0 and 100');
end

% ============================================================
% Area-weighted time series
% ============================================================

a1_ts = nan(size(a1,1),1);
a2_ts = nan(size(a2,1),1);

for i=1:size(a1,1)
    a=squeeze(a1(i,:,:));
    id=idl & ~isnan(a) & isfinite(aa);
    if any(id(:))
        sumid(i)=sum(sum(id));
        b=aa(id);
        b=b/mean(b);
        a1_ts(i)=mean(a(id).*b);
    end
end
for i=1:size(a2,1)
    a=squeeze(a2(i,:,:));
    id=idl & ~isnan(a) & isfinite(aa);
    if any(id(:))
        b=aa(id);
        b=b/mean(b);
        a2_ts(i)=mean(a(id).*b);
    end
end

a1_ts=a1_ts(isfinite(a1_ts));
a2_ts=a2_ts(isfinite(a2_ts));

n1_avg=length(a1_ts);
n2_avg=length(a2_ts);

a1_avg=mean(a1_ts);
a1_std=std(a1_ts);

a2_avg=mean(a2_ts);
a2_std=std(a2_ts);

diff_avg=a2_avg-a1_avg;
pdiff_avg=diff_avg./a1_avg*100;

c1_avg=a1_std.^2./n1_avg;
c2_avg=a2_std.^2./n2_avg;
se_avg=sqrt(c1_avg+c2_avg);

% ============================================================
% Grid-point mean difference
% ============================================================

a1=squeeze(mean(a1,1,'omitnan'));
a2=squeeze(mean(a2,1,'omitnan'));

diff=a2-a1;
pdiff=diff./a1*100;

c1=s1.^2./n1;
c2=s2.^2./n2;

se=sqrt(c1+c2);

% ============================================================
% Critical values and p-values
% ============================================================

if testopt==1

    % --------------------------------------------------------
    % Z-test
    % --------------------------------------------------------

    critical=norminv(1-alpha/2);

    zstat=abs(diff)./se;
    pvalue=2*normcdf(-zstat);

    critical_avg=critical;
    zstat_avg=abs(diff_avg)./se_avg;
    pvalue_avg=2*normcdf(-zstat_avg);

    df=nan(size(diff));
    df_avg=NaN;

elseif testopt==2

    % --------------------------------------------------------
    % Welch's two-sample t-test
    % --------------------------------------------------------

    df=(c1+c2).^2 ./ ...
       (c1.^2./(n1-1)+c2.^2./(n2-1));

    critical=tinv(1-alpha/2,df);

    tstat=abs(diff)./se;
    pvalue=2*tcdf(-tstat,df);

    df_avg=(c1_avg+c2_avg).^2 / ...
       (c1_avg.^2/(n1_avg-1)+c2_avg.^2/(n2_avg-1));

    critical_avg=tinv(1-alpha/2,df_avg);

    tstat_avg=abs(diff_avg)./se_avg;
    pvalue_avg=2*tcdf(-tstat_avg,df_avg);

end

% ============================================================
% Handle zero standard error
% ============================================================

zero_se=(se==0);

pvalue(zero_se & diff==0)=1;
pvalue(zero_se & diff~=0)=0;

pvalue(~isfinite(se))=NaN;

if se_avg==0
    if diff_avg==0
        pvalue_avg=1;
    else
        pvalue_avg=0;
    end
end

% ============================================================
% Margin of error
% ============================================================

me=critical.*se;

% ============================================================
% Statistical significance masks
% ============================================================

id1=(n1<num) | (n2<num);
id2=(pvalue>=alpha) | ~isfinite(pvalue);
id3=(pdiff>50000) | (pdiff<-50000);

id=id1 | id2 | id3;

idx=id2;  % 1 = statistically insignificant

if mskopt==0
    disp('not doing masking');
elseif mskopt==1
    diff(id)=NaN;
    pdiff(id)=NaN;
end

% ============================================================
% Grid-point outputs
% ============================================================

d.a1_avg=a1;
d.a2_avg=a2;
d.diff=diff;
d.pdiff=pdiff;
d.me=me;
d.idx=idx;
d.pvalue=pvalue;
d.df=df;

% ============================================================
% Area-mean significance
% ============================================================

me_avg=critical_avg*se_avg;
idx_avg=(pvalue_avg>=alpha) | ~isfinite(pvalue_avg);

avg.a1_ts=a1_ts; avg.a1_avg=a1_avg;
avg.a2_ts=a2_ts; avg.a2_avg=a2_avg;
avg.diff =diff_avg;
avg.pdiff=pdiff_avg;
avg.me=me_avg;
avg.idx=idx_avg;
avg.pvalue=pvalue_avg;
avg.df=df_avg;

d.avg=avg;

return
