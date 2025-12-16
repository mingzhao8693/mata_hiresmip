function r=get_iso_reg(varb,v,latlon,opt,event)
%varb(day,yr,lat,lon);
%latlon=[75 100 -6.5 6.5]; latlon=[70 90  -6.5 6.5];
%latlon=[75 85  -5 5];
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
ys=min(find(v.lat(:)>lat1)); ye=max(find(v.lat(:)< lat2));
xs=min(find(v.lon(:)>lon1)); xe=max(find(v.lon(:)< lon2));
xyavg=mean(mean(varb(:,:,ys:ye,xs:xe),4),3);%xyavg(day,year)
%daily climatology averaged over all years
clm_day=squeeze(mean(xyavg,2)); %clm_day(nday)
for d=1:v.nday
  for y=1:v.nyr
    anom(d,y)=xyavg(d,y)-clm_day(d);
  end
end
%put xyavg and anom back to multiyear daily data 
org    =reshape(xyavg,v.nt,1);
ano_org=reshape(anom, v.nt,1); 

%band filtering of the time serie at each point
dd1=20; dd2=100;
ano_iso=mybandpass(ano_org,dd1,dd2);

var_ano_iso=var(ano_iso);

%winter time TS: t1=Nov01; t2=Apr30
for n=1:v.nyr-1;
  %t1(n)=n*10*30+1; t2(n)=t1(n)+30*6; %Nov-to-Apr, 6mon after Nov 1
  t1(n)=(n-1)*365+10*30+1; t2(n)=t1(n)+30*6; %Nov-to-Apr, 6mon after Nov 1
  %IO winter time series r.ano_iso_win(yr,day)
  ano_org_win(n,:)=ano_org(t1(n):t2(n));
  ano_iso_win(n,:)=ano_iso(t1(n):t2(n));
end
r.org     =org;
r.clm_day0=clm_day;       %daily climatology at each location
r.ano_org0=ano_org;       %IO all season daily TS
r.ano_iso0=ano_iso;       %IO all season daily TS
r.ano_iso_win=ano_iso_win;%IO winter daily TS (yr, Nov1:Nov1+6mon)
r.ano_org_win=ano_org_win;%IO winter daily TS (yr, Nov1:Nov1+6mon)
r.t1=t1; 
r.t2=t2;
r.ano_iso_win_std=std(ano_iso_win');
r.ano_org_win_std=std(ano_org_win');
r.ano_iso_win_std0=mean(r.ano_iso_win_std);
r.ano_org_win_std0=mean(r.ano_org_win_std);
r.std_ratio=r.ano_iso_win_std0/r.ano_org_win_std0;
r.latlon=latlon; %v.lgd_max=30;
lgd_max=v.lgd_max; lgd=[-lgd_max:lgd_max];
r.lgd=lgd;
ndw=length(r.ano_iso_win(1,:)); r.ndw=ndw;

if (opt==0)
  sig=r.ano_iso_win_std0;
  i=1;
  for n=1:v.nyr-1;
    x=r.ano_iso_win(n,:); 
    for t=lgd_max+1:ndw-lgd_max
      id0=x(t)>1.*sig;
      id1=x(t)>x(t-1) & x(t)>x(t+1); 
      if (id0 & id1)
	id2=x(t)>=max(x(t-lgd_max:t+lgd_max));
	id3=t > lgd_max & t < ndw-lgd_max;
	if (id2 & id3)
	  r.event.yr(i)=n;
	  r.event.ts(i)=t-lgd_max;
	  r.event.te(i)=t+lgd_max;r
	  r.event.var(i,:)=x(r.event.ts(i):r.event.te(i));
	  i=i+1;
	end
      end
    end
  end
  r.event.num=i-1;
elseif (opt==1)
  for i=1:event.num
    yr=event.yr(i);
    ts=event.ts(i);
    te=event.te(i);
    r.comp_iso(i,:)=r.ano_iso_win(yr,ts:te);
    r.comp_org(i,:)=r.ano_org_win(yr,ts:te);
  end
  r.comp_iso_avg=squeeze(mean(r.comp_iso,1));
  r.comp_iso_avg_n=r.comp_iso_avg/r.ano_iso_win_std0
  r.comp_org_avg=squeeze(mean(r.comp_org,1));
  r.comp_org_avg_n=r.comp_org_avg/r.ano_org_win_std0
end
return




