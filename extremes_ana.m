function [x]=extremes_ana(var,pct,thresh,opt)
if isempty(thresh)
  thresh=[0];
end

x.pct_th=pct; 
x.thresh=thresh;
x.opt=opt;
x.daily_climo=compute_daily_climo(var(1).a);

for k=1:length(var)
  var(k).a=single(var(k).a);
  a=var(k).a;
  x.pct(k,:,:,:)=prctile(a,pct,1);
  x.av (k,:,:)  =squeeze(mean(a, 1)); %all time average
  x.std(k,:,:)  =squeeze(std (a, 1)); %all time std
end

for k=1:length(var)
  var(k).a=single(var(k).a);
  a=var(k).a;
  if isvector(thresh) %thresh is a series of fixed value, e.g, thresh=[0 1]
    for i=1:length(thresh)
      b0=a; b0(:,:,:)=thresh(i); %b0
      a1=a; id=(a1>=b0); a1(~id)=NaN;
      x.fq_ge(k,i,:,:) =single(squeeze(mean(id,1)));   %frequency of a>=thresh;
      x.av_ge(k,i,:,:) =squeeze(nanmean(a1,1)); %average of all a with a>=thresh
      a1=a; id=(a1< b0); a1(~id)=NaN;
      x.fq_lt(k,i,:,:) =single(squeeze(mean(id,1)));   %frequency of a<thresh;
      x.av_lt(k,i,:,:) =squeeze(nanmean(a1,1)); %average of all a with a<thresh
    end
  elseif length(size(thresh))==3 %thresh is time and spatially varying, thresh(nday,nlat,nlon)
    b0(:,:,:)=thresh(:,:,:);
    a1=a; id=(a1>=b0); a1(~id)=NaN;
    x.fq_ge(k,:,:) =single(squeeze(mean(id,1)));   %frequency of a>=thresh;
    x.av_ge(k,:,:) =squeeze(nanmean(a1,1)); %average of all a with a>=thresh
    a1=a; id=(a1< b0); a1(~id)=NaN;
    x.fq_lt(k,:,:) =single(squeeze(mean(id,1)));   %frequency of a<thresh;
    x.av_lt(k,:,:) =squeeze(nanmean(a1,1)); %average of all a with a<thresh
  end
end

%compute some simple statistics and save it for sanity check
for k=1:length(var)
  a=var(k).a; b=size(a);
  a=reshape(a,b(1)*b(2)*b(3),1);
  var(k).max =max(a);
  var(k).min =min(a);
  var(k).med =median(a);
  var(k).mean=mean(a);
  id=isnan(a);
  var(k).nancount=sum(id);
  var(k).avg=squeeze(mean(var(k).a,1));
end

if opt==1
  x.var=var;
  x.fn=var(1).fn;
end

return

