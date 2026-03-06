function [x]=extremes_ana(var,pct,thresh,nbin,opt)
if isempty(thresh); thresh=[0]; end
if isempty(nbin);   nbin=20;    end
  
x.fn1=var(1).fn1;
x.fn2=var(1).fn2;
x.nyr=var(1).nyr;
x.lat=var(1).lat;
x.lon=var(1).lon;
x.pct_th=pct; x.thresh=thresh; x.opt=opt;

nn = length(var);
for k=1:nn
  x.daily_climo(k).daily =compute_daily_climo (var(k).a,var(k).nyr);
%  x.climo(k).season=squeeze(nanmean(x.climo(k).daily,1));
%  x.climo(k).season=compute_season_climo(var(k).a,var(k).nyr);
  x.tbeg(k) =var(k).tbeg;
  x.tend(k) =var(k).tend;
end
if nn == 1
  x.season_climo=compute_season_from_daily(x.daily_climo(1).daily);
end

for k=1:length(var)
  var(k).a=single(var(k).a);
  a=var(k).a; 
  x.av (k,:,:)  =squeeze(nanmean(a, 1)); %all time average
  x.std(k,:,:)  =squeeze(nanstd (a, 1)); %all time std
  x.pct(k,:,:,:)=prctile(a,pct,1);
  [nt nlat nlon]=size(a);
  a=reshape(a,nt*nlat*nlon,1);
  pctall(k,:)=prctile(a,pct,1); pctall(k,:)
  amin=pctall(k,2);   amin
  amax=pctall(k,end); amax
  bin(k,:) = [amin:(amax-amin)/nbin:amax]; nbin=nbin;
  [count(k,:), edges(k,:)] = histcounts(a,bin(k,:));
  pdfall(k,:) =count(k,:)/sum(count(k,:));
  binc  (k,:)=(edges(k,1:end-1)+edges(k,2:end))*0.5;
  x.pctall=pctall; x.nbin=nbin; x.bin=bin; x.binc=binc;
  x.pdfall=pdfall; x.count=count; x.edges=edges;
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
end

return

