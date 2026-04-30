function v=get_trend_TSR_simple(x,xt,alpha)
%note xt must be column vector otherwise it returns with NaN
'get_trend_TSR_simple...'
%note xt must be column vector otherwise it returns with NaN
if ~iscolumn(xt); xt=xt'; end;
[nsea nyr nlat nlon]=size(x);
for m=1:nsea
  for j=1:nlat
    for i=1:nlon    
      y=squeeze(x(m,:,j,i));
      trend(m,j,i)=Theil_Sen_Regress(xt,y)*10; %K/decade
      %c=polyfit(xt,y,1); slope1(j,i)=c(1);
      [ht,pv]=Mann_Kendall(y,alpha);
      signif(m,j,i)=ht;
      pvalue(m,j,i)=pv;
    end
  end
  a=squeeze(x(m,:,:,:)); m
  avg(m,:,:)=squeeze(mean(a,1));
  sdd(m,:,:)=squeeze(std (a,1));
end

v.xt=xt; v.avg=avg; v.std=sdd;
v.trend=trend; v.signif=signif; v.pvalue=pvalue;

return
