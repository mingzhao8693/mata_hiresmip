function r=lag_regress_2d(varb,v,latlon,lat1,lat2,io,opt)
if (opt==2) r=0; return; end;
%varb(day,yr,lat,lon);
%daily climatology at each (lat lon) averaged over years
clm_day=squeeze(mean(varb,2)); %clm_day(nday,nlat,nlon)
for d=1:v.nday
  for y=1:v.nyr
    anom(d,y,:,:)=squeeze(varb(d,y,:,:))-squeeze(clm_day(d,:,:));
  end
end
%put varb/anom back to multiyear daily data 
%org(day,lat,lon); ano_org(day,lat,lon);
org    =reshape(varb,v.nt,v.nlat,v.nlon);
ano_org=reshape(anom,v.nt,v.nlat,v.nlon); 

%band filtering of the time serie at each point
dd1=20; dd2=100;
for j=1:v.nlat; v.lat(j)
  for i=1:v.nlon
    x=squeeze(ano_org(:,j,i));
    x=mybandpass(x,dd1,dd2);
    ano_iso(:,j,i)=x';
  end
end
%figure;plot(ano_org(:,1,1),'r-*');hold on;plot(ano_iso(:,1,1),'b-s');
%ano_iso(day,lat,lon)
%define the equatorial region and meridional average; array in (day,lon)
id=(v.lat>lat1 & v.lat<lat2);
clm_day_yavg=squeeze(mean(clm_day(:,id,:),2));
ano_org_yavg=squeeze(mean(ano_org(:,id,:),2));
ano_iso_yavg=squeeze(mean(ano_iso(:,id,:),2)); 

lgd_max=v.lgd_max; %30; %t1=Nov01; t2=Apr30
for n=1:v.nyr-1;
  ss=strcat('extract yearly Nov-to-Apr data: year=',num2str(n));ss
%  t1(n)=n*10*30+1; t2(n)=t1(n)+30*6; %Nov-to-Apr, 6mon after Nov 1
  t1(n)=(n-1)*365+10*30+1; t2(n)=t1(n)+30*6; %Nov-to-Apr, 6mon after Nov 1
  %IO winter time series r.ano_iso_win(yr,day)
  r.ano_org_win(n,:)=io.ano_org0(t1(n):t2(n));
  r.ano_iso_win(n,:)=io.ano_iso0(t1(n):t2(n));
  for i=1:v.nlon
    %r_ano_iso(yr,lon,day,lat): winter time series at each (yr,lon,winday,lat)
    r_ano_org(n,i,:,:)=(ano_org(t1(n):t2(n),:,i))';
    r_ano_iso(n,i,:,:)=(ano_iso(t1(n):t2(n),:,i))';
    for t=1:2*lgd_max+1;
      lgd(t)=t-(lgd_max+1);
      %ano_iso_yld(yr,lon,lagday,day): lagged TS at each (yr,lon,lagday,day)
      %lagday is described by lgd(t)
      %ano_iso_yavg (day,lon):meridionally averaged daily TS
      ano_org_yld(n,i,t,:)=ano_org_yavg(t1(n)+lgd(t):t2(n)+lgd(t),i);
      ano_iso_yld(n,i,t,:)=ano_iso_yavg(t1(n)+lgd(t):t2(n)+lgd(t),i);
    end
  end
end
r.lgd=lgd;         %lagged day [-30:30]
r.lon=v.lon;       %longitude
r.lat=v.lat;       %latitude
r.clm_day=clm_day; %r.clm_day(day,lat,lon) daily climatology at each location
r.reg=io;
r.latlon=latlon;
%r.ano_iso0   (day): IO all season daily TS
%r.ano_iso_win(yr,winday): IO winter daily TS (yr, Nov1:Nov1+6mon)
%r_ano_iso  (yr,lon,winday,lat): winter daily TS at all location
%ano_iso_y1d(yr,lon,lagday,day): winter daily TS at each lon with lagday shift

if (opt==0) %do correlation/regression with lag
  for n=1:v.nyr-1; 
    ss=strcat('lag regression:year=',num2str(n));ss
    x0=squeeze(r.ano_iso_win(n,:));x0=x0';
    %x1=squeeze(r.ano_org_win(n,:));x1=x1';
    for i=1:v.nlon
      for t=1:2*lgd_max+1; %t:lag days
	y0=squeeze(ano_org_yld(n,i,t,:));
	y1=squeeze(ano_iso_yld(n,i,t,:));
	a=corrcoef (x0,y0); r.lagcorr.org(n,i,t)=a(1,2);
	a=mvregress(x0,y0); r.lagslop.org(n,i,t)=a;
	a=corrcoef (x0,y1); r.lagcorr.iso(n,i,t)=a(1,2);
	a=mvregress(x0,y1); r.lagslop.iso(n,i,t)=a;
      end
    end
  end
  pcp_ano_org_std0=io.ano_org_win_std0;
  pcp_ano_iso_std0=io.ano_iso_win_std0;
  r.lagcorr.org_avg=squeeze(mean(r.lagcorr.org,1));
  r.lagslop.org_avg=squeeze(mean(r.lagslop.org,1))*pcp_ano_org_std0;;
  r.lagcorr.iso_avg=squeeze(mean(r.lagcorr.iso,1));
  r.lagslop.iso_avg=squeeze(mean(r.lagslop.iso,1))*pcp_ano_iso_std0;;
elseif(opt==1) %do correlation/regression both with and without lag
  for n=1:v.nyr-1;n
    x0=squeeze(v.io.pcp.ano_iso_win(n,:));x0=x0';
    %x1=squeeze(v.io.pcp.ano_org_win(n,:));x1=x1';
    for i=1:v.nlon
      for j=1:v.nlat
	y0=squeeze(r_ano_org(n,i,j,:));
	y1=squeeze(r_ano_iso(n,i,j,:));
	a=corrcoef (x0,y0); r.corr.org(n,i,j)=a(1,2);
	a=mvregress(x0,y0); r.slop.org(n,i,j)=a;
	a=corrcoef (x0,y1); r.corr.iso(n,i,j)=a(1,2);
	a=mvregress(x0,y1); r.slop.iso(n,i,j)=a;
      end      
      for t=1:2*lgd_max+1; %t:lag days
	y0=squeeze(ano_org_yld(n,i,t,:));
	y1=squeeze(ano_iso_yld(n,i,t,:));
	a=corrcoef (x0,y0); r.lagcorr.org(n,i,t)=a(1,2);
	a=mvregress(x0,y0); r.lagslop.org(n,i,t)=a;
	a=corrcoef (x0,y1); r.lagcorr.iso(n,i,t)=a(1,2);
	a=mvregress(x0,y1); r.lagslop.iso(n,i,t)=a;
      end
    end
  end
  pcp_ano_org_std0=io.ano_org_win_std0;
  pcp_ano_iso_std0=io.ano_iso_win_std0;
  r.corr.org_avg=squeeze(mean(r.corr.org,1));
  r.slop.org_avg=squeeze(mean(r.slop.org,1))*pcp_ano_org_std0;
  r.corr.iso_avg=squeeze(mean(r.corr.iso,1))*pcp_ano_iso_std0;
  r.slop.iso_avg=squeeze(mean(r.slop.iso,1));
  r.lagcorr.org_avg=squeeze(mean(r.lagcorr.org,1));
  r.lagslop.org_avg=squeeze(mean(r.lagslop.org,1))*pcp_ano_org_std0;
  r.lagcorr.iso_avg=squeeze(mean(r.lagcorr.iso,1))*pcp_ano_iso_std0;
  r.lagslop.iso_avg=squeeze(mean(r.lagslop.iso,1));
end

return
