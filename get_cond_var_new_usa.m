function s=get_cond_var_new_usa(a,dmon,id,pct,aa0,opt,idxx)
%a(nt,nlat,nlon); id(nt,nlat,nlon); 
%b=a.*id;                   %conditional sampling of AR/id
%b_sum =sum(b,1);          %sum of all values of a with AR id=1
%id_sum=sum(id,1);         %sum of all AR id (occurrence)
%c=squeeze(b_sum./id_sum); %average of the value for AR
%c(isnan(c))=0;            %s.arfq =squeeze(mean(id,1)); s.arall=squeeze(mean(b,1));
%s.ar   =squeeze(c);
%s.armax1=squeeze(max(b,[],1));
%s.arfq =squeeze(mean(id,1)); s.arfqs=squeeze(sum (id,1));
%pct =[25 50 75 90 95 99 99.9]; pct=[99 99.9];

nt  =length(a(:,1,1));
nlat=length(a(1,:,1));
nlon=length(a(1,1,:));
aa=repmat(aa0,[1 1 nt]);aa=shiftdim(aa,2);size(aa)
s.av_ts_day_lat=mean_reduce(a);
s.av_ts_day=mean(mean(a.*aa,3),2);
tmp =reshape(a,dmon,nt/dmon,nlat,nlon);
s.av_ann=squeeze(mean(tmp,1));
s.av =squeeze(mean(a, 1));  %all time average
s.av_nonan=squeeze(nanmean(a, 1)); %all time average without nan

s.pct=prctile(a,pct,1); s.pct_values=pct;

if ~exist('idxx')
  b=a.*id; d=b; d(~id)=NaN;
  s.idwei=squeeze(mean   (b,1));
  s.idavg=squeeze(nanmean(d,1));
  s.idstd=squeeze(nanstd (d,1));
  s.idmax=squeeze(nanmax(d,[],1));
  d=a.*(~id); d(id)=NaN;
  s.nonid_avg=squeeze(nanmean(d,1));
  s.nonid_std=squeeze(nanstd (d,1));
  
  d=b; d(~id)=NaN;
  nt=length(a(:,1,1)); 
  s.idpct_values=[25 50 75 90 95 99];
  s.idpct=prctile(d,s.idpct_values,1);
  for i=1:length(s.idpct_values)
    if (i<=2) %compute lower quarter mean
      x=squeeze(s.idpct(i,:,:)); 
      x=repmat(x,[1 1 nt]); x=shiftdim(x,2);
      idx=(d<x); dd=d; dd(~idx)=NaN;
      %s.idpct_avg(i,:,:)=squeeze(nanmean(dd,1));
      %s.idpct_std(i,:,:)=squeeze(nanstd (dd,1));
      %s.idx(i,:,:,:)=idx;
      %dd=d; dd(~idx)=0;
      %s.idpct_wei(i,:,:)=squeeze(mean(dd,1));
    else %upper half mean
      x=squeeze(s.idpct(i-1,:,:));
      x=repmat(x,[1 1 nt]); x=shiftdim(x,2);
      idx=(d>x); dd=d; dd(~idx)=NaN;
      %s.idpct_avg(i,:,:)=squeeze(nanmean(dd,1));
      %s.idpct_std(i,:,:)=squeeze(nanstd (dd,1));
      %s.idx(i,:,:,:)=idx;
      %dd=d; dd(~idx)=0;
      %s.idpct_wei(i,:,:)=squeeze(mean(dd,1));
    end
      s.idpct_avg(i,:,:)=squeeze(nanmean(dd,1));
      s.idpct_std(i,:,:)=squeeze(nanstd (dd,1));
      s.idx(i,:,:,:)=idx&id;
      dd=d; dd(~idx)=0;
      s.idpct_wei(i,:,:)=squeeze(mean(dd,1));
  end
  return
end

if exist('opt')
  if (opt==0)
    b=a.*id; d=b; d(~id)=NaN;
    s.idwei=squeeze(mean   (b,1));
    tmp=reshape(b,dmon,nt/dmon,nlat,nlon);
    s.idwei_ann=squeeze(mean(tmp,1));
    s.idwei_ts_day=mean(mean(b.*aa,3),2);
    s.idwei_ts_day_lat=mean_reduce(b);
    s.idavg=squeeze(nanmean(d,1));
    s.idstd=squeeze(nanstd (d,1));
    s.idmax=squeeze(nanmax(d,[],1));
    d=a.*(~id); 
    s.nonid_ts_day    =mean(mean(d.*aa,3),2);
    s.nonid_ts_day_lat=mean_reduce(d);
    d(id)=NaN;
    s.nonid_avg=squeeze(nanmean(d,1));
    s.nonid_std=squeeze(nanstd (d,1));
    for i=1:length(idxx(:,1,1,1))
      idx=squeeze(idxx(i,:,:,:));
      b=a.*idx; d=b; d(~idx)=NaN;
      s.idx_avg(i,:,:)=squeeze(nanmean(d,1));
      s.idx_std(i,:,:)=squeeze(nanstd (d,1));     
    end
  elseif (opt==1)
    b=a.*id; d=b; d(~id)=NaN;
    s.id   =squeeze(mean   (b,1));
    s.idavg=squeeze(nanmean(d,1)); 
    s.idmax=squeeze(nanmax(d,[],1)); 
    s.idpct=prctile(d,pct,1); 
    %compute frequency of absolute rain
    nnn=length(a(:,1,1));
    idx=(a>1);      s.f(1,:,:)=squeeze(sum(idx,1)/nnn); %precip>1mm/day: rain
    idx=(a>2.5*24); s.f(2,:,:)=squeeze(sum(idx,1)/nnn); %precip>60mm/day:moderate_rain
    idx=(a>7.6*24); s.f(3,:,:)=squeeze(sum(idx,1)/nnn); %precip>182.5mm/day:heavy_rain
    idx=(a>10.*24); s.f(4,:,:)=squeeze(sum(idx,1)/nnn); %precip>240mm/day:heavy_rain
    idx=(a>20.*24); s.f(5,:,:)=squeeze(sum(idx,1)/nnn); %precip>480mm/day:voilent_rain
    %compute fractional of a (rain) percentile rain contributed from AR
    nlat=length(a(1,:,1));
    nlon=length(a(1,1,:));
    npct=length(s.pct_values);
    for j=1:nlat
      for i=1:nlon
	for k=1:npct
	  pctx=s.pct(k,j,i); c=a(:,j,i);
	  idx=c>pctx; nnn=sum(idx);
	  idno=sum(id(idx,j,i),1);
	  s.fr_id(k,j,i)=idno/nnn;
	end
      end
    end
    s.idfq =squeeze(mean(id,1)); 
    s.idfqs=squeeze(sum (id,1));
  elseif (opt==2)
    b=a.*id; d=b; d(~id)=NaN;
    s.id   =squeeze(mean   (b,1));
    s.idavg=squeeze(nanmean(d,1)); 
    s.idmax=squeeze(nanmax(d,[],1)); 
    s.idpct=prctile(d,pct,1);
    nnnn=length(a(:,1,1));
    nlat=length(a(1,:,1));
    nlon=length(a(1,1,:));
    npct=length(s.pct_values);
    for j=1:nlat
      for i=1:nlon
	for k=1:npct
	  pctx=s.pct(k,j,i); c=a(:,j,i);
	  idx=c>pctx; nnn=sum(idx); 
	  idno=sum(id(idx,j,i),1);
	  %if (idno>0)
	  %  disp(strcat('nnn=',num2str(nnn),';idno=',num2str(idno),';'num2str(nnnn)));
	  %end
	  s.frac_id(k,j,i)=idno/nnn;
	end
      end
    end
  elseif (opt==8)
    b=a.*idnew; d=b; d(~idnew)=NaN;
    s.id   =squeeze(mean   (b,1));
    s.idavg=squeeze(nanmean(d,1)); 
    s.idmax=squeeze(nanmax(d,[],1)); 
    s.idpct=prctile(d,pct,1); 
  elseif (opt==-1)
    s.p01 =squeeze(prctile(a,1.0,1));   %1   percentile
    %s.p001=squeeze(prctile(a,0.1,1));  %0.1 percentile
  end
end

return
