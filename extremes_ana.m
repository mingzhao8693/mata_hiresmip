function [x]=extremes_ana(var,pct,thresh,opt)
for k=1:length(var)
  var(k).a=single(var(k).a);
  a=var(k).a;
  x.pct(k,:,:,:)=prctile(a,pct,1); x.pct_th=pct;
  x.av (k,:,:)  =squeeze(mean(a, 1)); %all time average
  x.std(k,:,:)  =squeeze(std (a, 1)); %all time std
  for i=1:length(thresh)
    b0=thresh(i); %b0
    a1=a; id=(a1>=b0); a1(~id)=NaN;
    x.fq_ge(k,i,:,:) =single(squeeze(mean(id,1)));   %frequency of a>=thresh;
    x.av_ge(k,i,:,:) =squeeze(nanmean(a1,1)); %average of all a with a>=thresh
    a1=a; id=(a1< b0); a1(~id)=NaN;
    x.fq_lt(k,i,:,:) =single(squeeze(mean(id,1)));   %frequency of a<thresh;
    x.av_lt(k,i,:,:) =squeeze(nanmean(a1,1)); %average of all a with a<thresh
  end
  x.thresh=thresh;
end
if opt==1
  for k=1:length(var)
    a=var.a; b=size(a);
    a=reshape(a,b(1)*b(2)*b(3),1);
    var(k).max =max(a);
    var(k).min =min(a);
    var(k).med =median(a);
    var(k).mean=mean(a);
    id=isnan(a);
    var(k).nancount=sum(id);
  end
  x.var=var;
end
return

