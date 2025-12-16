function [cdf CDF]=mizcdf(windall,wdbin,opt)
nnn=histc(windall,wdbin); 
if (sum(nnn)~=0)
  cdf=1-cumsum(nnn)/sum(nnn);
  CDF=sum(nnn)*cdf;
else
  cdf=1-cumsum(nnn); cdf(:)=0;
  CDF=cdf;
end

if (opt==1)
  nnn=histc(windall,wdbin);
  if (sum(nnn)~=0)
    cdf=cumsum(nnn)/sum(nnn);
    CDF=sum(nnn)*cdf;
  else
    cdf=cumsum(nnn); cdf(:)=0;
    CDF=cdf;
  end
%  CDF=fliplr(CDF);
%  cdf=fliplr(cdf);  
end
