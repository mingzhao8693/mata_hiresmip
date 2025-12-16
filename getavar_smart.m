function [p]=getavar_smart(var,v,opt,bin,pctile)
nz=v.nz; nt=v.nt; ngrid=v.ngrid;
t1=1; t2=nt; disp(strcat('In getavar_smart...',v.expn));
if exist('pctile')
  p.pctile=pctile; %[50 75 90 95 99 99.9 99.99];
  disp(p.pctile);
end
if strcmp(opt,'3d')
  a=var(t1:t2,:,:,:); nz=length(a(1,:,1,1));
  a=shiftdim(a,1);
  a=reshape(a,nz,ngrid*nt);
  for k=1:nz
    b=squeeze(a(k,:));
    id=~isnan(b); %remove flagged column based on NaN
    nn=sum(id);
    if (nn>0)
      b=b(id); 
      p.fav(k)=length(b)/(ngrid.*nt);%fractional area
      p.avg(k)=mean(b);           %averaged value
      p.std(k)=std(b);
      p.AVG(k)=p.avg(k)*p.fav(k); %averaged value x fractional area
    else
      p.fav(k)=NaN;
      p.avg(k)=NaN;
      p.std(k)=NaN;
      p.AVG(k)=NaN;
    end
  end
  a=reshape(var,nt,nz,ngrid);
  for i=1:nt
    for k=1:nz
      b=squeeze(a(i,k,:)); 
      id=~isnan(b); b=b(id);
      p.fa(i,k)=length(b);
      if (p.fa(i,k)>0)
	p.ts(i,k)    =mean(b);
	p.ts_max(i,k)=max (b);
	p.ts_min(i,k)=min (b);
      else
	p.ts(i,k)    =NaN;
	p.ts_max(i,k)=NaN;
	p.ts_min(i,k)=NaN;
      end
    end
  end
  if exist('pctile')
    for k=1:nz
      b=squeeze(a(:,k,:,:));
      b=b(~isnan(b));
      for i=1:length(p.pctile)
	p.vptile(k,i)=prctile(b,p.pctile(i));
      end
    end
  end
else
  a=var(t1:t2,:,:);
  a=reshape(a,ngrid*nt,1); 
  id=~isnan(a); 
  nn=sum(id);
  if (nn>0)
    a=a(id);
    p.avg=mean(a); p.std=std(a); p.max=max(a); p.min=min(a); 
    p.fav=length(a)/(ngrid*nt);
    p.AVG=p.avg*p.fav;
  else
    p.avg=NaN; p.std=NaN; p.max=NaN; p.min=NaN; p.fav=NaN; p.AVG=NaN;    
  end
  if exist('bin')
    p.bine=bin;%p.bine=[p.min:(p.max-p.min)/20:p.max];
    pdf=histc(a,p.bine); pdf=pdf(1:end-1);
    pdf=pdf/sum(pdf); p.pdf=pdf';
    p.binc=(p.bine(1:end-1)+p.bine(2:end))*0.5;
    p.bins=diff(p.bine);
  end
  a=reshape(var,nt,ngrid);
  for i=1:nt
    b=squeeze(a(i,:)); id=~isnan(b); b=b(id);
    if (length(b)>0)
      p.ts_fa (i)=length(b)/ngrid;
      p.ts    (i)=mean(b);
      p.ts_max(i)=max (b);
      p.ts_min(i)=min (b);
      p.ts_std(i)=std (b,1);
      p.ts_skw(i)=skewness(b);%mean(b.*b.*b)/b_std^3; definition
    else
      p.ts_fa (i)=0;
      p.ts    (i)=NaN;
      p.ts_max(i)=NaN;
      p.ts_min(i)=NaN;
      p.ts_std(i)=NaN;
    end
  end
  id=~isnan(p.ts);
  p.ts_avg=mean(p.ts(id));
  p.std_ts=std(p.ts);
  if exist('pctile')
    for i=1:length(p.pctile)
      a=a(~isnan(a));
      p.vptile(i)=prctile(a,p.pctile(i));
    end
  end
end
return
