function [p]=getavar(var,v,opt,bin,pctile)
%t1=v.ts; t2=v.te; nt=t2-t1+1;
nz=v.nz; nt=v.nt; ngrid=v.ngrid;
t1=1; t2=nt; disp(strcat('In getavar...',v.expn));
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
  p.ts    =mean(a,3);
  p.ts_max=max(a,[],3);
  p.ts_min=min(a,[],3);
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
  a=reshape(a,v.nx*v.ny*nt,1); %id=~isnan(a); a=a(id);
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

  p.avg=mean(a); p.max=max(a); p.min=min(a); 
  if exist('bin')
    p.bine=bin;%p.bine=[p.min:(p.max-p.min)/20:p.max];
    pdf=histc(a,p.bine); pdf=pdf(1:end-1);
    pdf=pdf/sum(pdf); p.pdf=pdf';
    p.binc=(p.bine(1:end-1)+p.bine(2:end))*0.5;
    p.bins=diff(p.bine);
  end
  a=reshape(var,v.nt,v.nx*v.ny);
  p.ts    =mean(a,2);
  p.ts_max=max (a,[],2);
  p.ts_min=min (a,[],2);
  p.ts_std=std (p.ts,1);
  p.ts_avg=mean(p.ts);
  
  if exist('pctile')
    for i=1:length(p.pctile)
      a=a(~isnan(a));
      p.vptile(i)=prctile(a,p.pctile(i));i
    end
  end
end
return
