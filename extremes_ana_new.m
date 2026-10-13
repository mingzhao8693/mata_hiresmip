function [x]=extremes_ana_new(var,pct,thresh,do_trend,opt)
disp('extremes_ana_new...'); %thresh=[0 1 2 3 4];
%if isempty(thresh); thresh=[0]; end
%if isempty(nbin);   nbin=20;    end
  
x.fn1=var.fn1;
x.fn2=var.fn2;
x.nyr=var.nyr; nyr=x.nyr;
x.tyr=var.tyr; tyr=x.tyr;
x.lat=var.lat;
x.lon=var.lon; 
x.pct_th=pct; x.opt=opt; 

x.climo =compute_daily_climo_new(var.a,nyr,pct);
%x.season_climo=compute_season_from_daily(x.daily_climo(1).daily); 

var.a=single(var.a);
a=var.a; [nt nlat nlon]=size(a);
a=reshape(a,[nt/nyr,nyr,nlat,nlon]);
varx=a; clear a;
[nday nyr nlat nlon]=size(varx); size(varx)

sea={'JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC','ANN','MAM','JJA','SON','DJF'};
x.sea=sea;
for iyr=1:nyr
  tmp=squeeze(varx(:,iyr,:,:)); disp(strcat('iyr=',num2str(x.tyr(iyr))));
  %x.ann(iyr)=squeeze(nanmean(tmp,1));
  b=[1  32 60  91 121 152 182 213 244 274 305 335 1   60  152 244 335];  %each MON,ANN,MAM,JJA,SON,DJF
  e=[31 59 90 120 151 181 212 243 273 304 334 365 365 151 243 334 365+59];
  nsea=length(b);
  for k=1:nsea
    n1=b(k); n2=e(k); disp(sea{k});
    if k==nsea
      if iyr==1 | iyr==nyr
	tmp1=squeeze(varx(1:59,iyr,:,:));
      else
	tmp1=squeeze(varx(1:59,iyr+1,:,:));
      end
      tmp=cat(1,tmp,tmp1);
      disp('data concate done for DJF season');
    end;
    a=tmp(n1:n2,:,:); nd=length(a(:,1,1));
    x.av (iyr,k,:,:)  =nanmean  (a,1);
    x.std(iyr,k,:,:)  =nanstd   (a,1);
    x.med(iyr,k,:,:)  =nanmedian(a,1);
    x.max(iyr,k,:,:)  =nanmax   (a,[],1);
    x.min(iyr,k,:,:)  =nanmin   (a,[],1);
%    x.pct(iyr,k,:,:,:)=prctile(a,pct,1);
    if isvector(thresh) %thresh is a series of fixed value, e.g, thresh=[0 1]
      x.thresh=thresh;
      for i=1:length(thresh)
	b0=a; b0(:,:,:)=thresh(i);                         %b0:threshold value
	a1=a; id=(a1> b0); a1(~id)=NaN;
	x.fq_gt(iyr,k,i,:,:) =single(squeeze(sum(id,1)));  %frequency of a>=thresh;
	x.av_gt(iyr,k,i,:,:) =squeeze(nanmean(a1,1));      %average of all a with a>=thresh
	a1=a; id=(a1<=b0); a1(~id)=NaN;
	x.fq_le(iyr,k,i,:,:) =single(squeeze(sum(id,1)));  %frequency of a<thresh;
	x.av_le(iyr,k,i,:,:) =squeeze(nanmean(a1,1));      %average of all a with a<thresh
      end
    else
      for j=1:length(pct)
	ipct=j; thresh=squeeze(x.climo.pct(k,ipct,:,:)); 
	b0=repmat(reshape(thresh,1,360,576),nd,1,1); x.thresh(k,j,:,:)=thresh; %size(thresh)
	a1=a; id=(a1> b0); a1(~id)=NaN;
	x.fq_gt(iyr,k,j,:,:) =single(squeeze(sum(id,1)))/nd; %frequency of a>=thresh;
	x.av_gt(iyr,k,j,:,:) =squeeze(nanmean(a1,1));        %average of all a with a>=thresh
	a1=a; id=(a1<=b0); a1(~id)=NaN;
	x.fq_le(iyr,k,j,:,:) =single(squeeze(sum(id,1)))/nd; %frequency of a<thresh;
	x.av_le(iyr,k,j,:,:) =squeeze(nanmean(a1,1));        %average of all a with a<thresh
      end
    end
  end
  b0=size(tmp);
  a=reshape(tmp,b0(1)*b0(2)*b0(3),1); 
  x.gmax(iyr)  =nanmax(a);
  x.gmin(iyr)  =nanmin(a);
  x.gmed(iyr)  =nanmedian(a);
  x.gavg(iyr)  =nanmean(a);
  x.gpct(iyr,:)=prctile(a,pct,1);
  id=isnan(a); x.gnan(iyr,k)=sum(id);
end
x.sname=var.sname;

a=get4season_all(x.av); a=cat(2, x.av, a); x.av=a; %a(13:19) contain ANN,MAM,JJA,SON,DJF,NDJFM and MJJAS mean

s=var.s; lonx=s.lon; latx=s.lat; x.alpha=0.8;
if do_trend
  a=x.av; a=interp_grid(a,lonx,latx,x.lon,x.lat,1); x.tr.av=get_trend_TSR_simple(a,x.tyr,x.alpha);
end

if opt==1
  x.var=var;
end

return

