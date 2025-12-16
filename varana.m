function s=varana(varb,v)
%var(nday,nyr,nlat,nlon);
%multi-year daily climatology at each (lat lon)
clm=squeeze(mean(varb,2));
for d=1:v.nday
  for y=1:v.nyr
    anom(d,y,:,:)=squeeze(varb(d,y,:,:))-squeeze(clm(d,:,:));
  end
end
%put var and ano back to daily continuous date (nday,nlat,nlon)
org=reshape(varb,v.nt,v.nlat,v.nlon);
ano=reshape(anom,v.nt,v.nlat,v.nlon); 
%band filtering
dd1=20; dd2=100; 
for j=1:v.nlat; v.lat(j)
  for i=1:v.nlon
    x=squeeze(ano(:,j,i));
    x=mybandpass(x,dd1,dd2);
    ano_iso(:,j,i)=x';
  end
end
ano_org=ano;
for i=1:v.nlon
  for j=1:v.nlat
    for n=1:v.nyr-1;
      t1(n)=(n-1)*365+10*30+1; t2(n)=t1(n)+30*6; %Nov-to-Apr, 6mon after Nov 1
      ano_org_win(n,:,j,i)=ano_org(t1(n):t2(n),j,i);
      ano_iso_win(n,:,j,i)=ano_iso(t1(n):t2(n),j,i);
      t3(n)=t2(n)+30*6;
      ano_org_sum(n,:,j,i)=ano_org(t2(n):t3(n),j,i);
      ano_iso_sum(n,:,j,i)=ano_iso(t2(n):t3(n),j,i);
    end
  end
end
x=size(ano_org_win); nt=x(1)*x(2);
ano_org_win=reshape(ano_org_win,nt,v.nlat,v.nlon);
ano_iso_win=reshape(ano_iso_win,nt,v.nlat,v.nlon);
x=size(ano_org_sum); nt=x(1)*x(2);
ano_org_sum=reshape(ano_org_sum,nt,v.nlat,v.nlon);
ano_iso_sum=reshape(ano_iso_sum,nt,v.nlat,v.nlon);

for j=1:v.nlat
  for i=1:v.nlon
    x=squeeze(ano_org    (:,j,i)); s.all.var_org(j,i)=std(x);
    x=squeeze(ano_iso    (:,j,i)); s.all.var_iso(j,i)=std(x);

    x=squeeze(ano_org_win(:,j,i)); s.win.var_org(j,i)=std(x);
    x=squeeze(ano_iso_win(:,j,i)); s.win.var_iso(j,i)=std(x);
    x=squeeze(ano_org_sum(:,j,i)); s.sum.var_org(j,i)=std(x);
    x=squeeze(ano_iso_sum(:,j,i)); s.sum.var_iso(j,i)=std(x);
  end
end
s.all.ratio=s.all.var_iso./s.all.var_org;
s.win.ratio=s.win.var_iso./s.win.var_org;
s.sum.ratio=s.sum.var_iso./s.sum.var_org;

return

