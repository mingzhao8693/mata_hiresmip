function r=lag_regress_3d(varb,v,io_pcp,opt)
if (opt==2) r=0; return; end;
%varb(day,yr,lat,lon);
%daily climatology at each (lat lon) averaged over years
clm_day=squeeze(mean(varb,2)); %clm_day(nday,nlat,nlon)
for d=1:v.nday
  for y=1:v.nyr
    tmp(d,y,:,:,:)=squeeze(clm_day(d,:,:,:));
  end
end
clm_day=tmp; 
anom=varb-clm_day;
%for d=1:v.nday
%  for y=1:v.nyr
%    anom(d,y,:,:,:)=squeeze(varb(d,y,:,:,:))-squeeze(clm_day(d,:,:,:));
%  end
%end
%put varb/anom back to multiyear daily data 
%org(day,lat,lon); ano_org(day,lat,lon);
org    =reshape(varb,v.nt,v.nz,v.nlat,v.nlon);
ano_org=reshape(anom,v.nt,v.nz,v.nlat,v.nlon); 
clm_day=reshape(clm_day,v.nt,v.nz,v.nlat,v.nlon); 

%band filtering of the time serie at each point
dd1=20; dd2=100;
for j=1:v.nlat; v.lat(j)
  for i=1:v.nlon
    for k=1:v.nz
      x=squeeze(ano_org(:,k,j,i));
      x=mybandpass(x,dd1,dd2);
      ano_iso(:,k,j,i)=x';
    end
  end
end
%figure;plot(ano_org(:,1,1),'r-*');hold on;plot(ano_iso(:,1,1),'b-s');

%ano_iso(day,lat,lon)
%latlon=io_pcp.latlon;
%lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
lat1=-10; lat2=10;
%meridional average; array in (day,lon)
id=(v.lat>lat1 & v.lat<lat2);
clm_day_yavg=squeeze(mean(clm_day(:,:,id,:),3));
ano_org_yavg=squeeze(mean(ano_org(:,:,id,:),3));
ano_iso_yavg=squeeze(mean(ano_iso(:,:,id,:),3)); 

t1 = io_pcp.t1; %time frame at Nov 1 for each year
t2 = io_pcp.t2; %time frame at Apr30 for each year
for n=1:v.nyr-1;n
  %t1(n)=n*10*30+1; t2(n)=t1(n)+30*6; %t1=Nov01; t2=Apr30;
  %r.ano_iso(yr,nz,lat,lon,day): winter time series at each (yr,nz,lat,lon,winday)
  r.ano_org(n,:,:,:,:)=permute(ano_org(t1(n):t2(n),:,:,:),[2 3 4 1]);
  r.ano_iso(n,:,:,:,:)=permute(ano_iso(t1(n):t2(n),:,:,:),[2 3 4 1]);
  r.clm_day(n,:,:,:,:)=permute(clm_day(t1(n):t2(n),:,:,:),[2 3 4 1]);
end
r.lon=v.lon;       %longitude
r.lat=v.lat;       %latitude
%r.clm_day=clm_day; %r.clm_day(day,nz,lat,lon) daily climatology at each location
%r.ano_iso    (yr,nz,lat,lon,winday): winter daily TS at all location

r.ano_org_yavg=squeeze(mean(r.ano_org,3));
r.ano_iso_yavg=squeeze(mean(r.ano_iso,3));
r.clm_day_yavg=squeeze(mean(r.clm_day,3));

for n=1:v.nyr-1;n
  x0=squeeze(io_pcp.ano_iso_win(n,:)); x0=x0'; %z0=x0'; z0(:)=0;
  for k=1:v.nz
    for i=1:v.nlon
      y0=squeeze(r.ano_org_yavg(n,k,i,:));
      y1=squeeze(r.ano_iso_yavg(n,k,i,:));
      clm(n,k,i)=squeeze(mean(r.clm_day_yavg(n,k,i,:)));
      if (sum(y0)>0)
	a=corrcoef (x0,y0); r.corr.org(n,k,i)=a(1,2);
	a=mvregress(x0,y0); r.slop.org(n,k,i)=a;
      else
	r.corr.org(n,k,i)=0;
	r.slop.org(n,k,i)=0;
      end
      if (sum(y1)>0)
	a=corrcoef (x0,y1); r.corr.iso(n,k,i)=a(1,2);
	a=mvregress(x0,y1); r.slop.iso(n,k,i)=a;
      else
	r.corr.iso(n,k,i)=0;
	r.slop.iso(n,k,i)=0;
      end
    end
  end
end
r.clm=squeeze(mean(clm,1));
pcp_ano_org_std0=io_pcp.ano_org_win_std0;
pcp_ano_iso_std0=io_pcp.ano_iso_win_std0;
r.corr.org_avg=squeeze(mean(r.corr.org,1));
r.slop.org_avg=squeeze(mean(r.slop.org,1))*pcp_ano_org_std0;
r.corr.iso_avg=squeeze(mean(r.corr.iso,1));
r.slop.iso_avg=squeeze(mean(r.slop.iso,1))*pcp_ano_iso_std0;
return

if (opt==0) then
else
  for n=1:v.nyr-1;n
    x0=squeeze(io_pcp.ano_iso_win(n,:)); x0=x0'; %z0=x0'; z0(:)=0;
    for k=1:v.nz
      for i=1:v.nlon
	for j=1:v.nlat %without lag
	  y0=squeeze(r.ano_org(n,k,j,i,:));
	  y1=squeeze(r.ano_iso(n,k,j,i,:));
	  if (sum(y0)>0) then
	    a=corrcoef (x0,y0); r.corr.org(n,k,j,i)=a(1,2);
	    a=mvregress(x0,y0); r.slop.org(n,k,j,i)=a;
	  else
	    r.corr.org(n,k,j,i)=0;
	    r.slop.org(n,k,j,i)=0;
	  end
	  if (sum(y1)>0) then
	    a=corrcoef (x0,y1); r.corr.iso(n,k,j,i)=a(1,2);
	    a=mvregress(x0,y1); r.slop.iso(n,k,j,i)=a;
	  else
	    r.corr.iso(n,k,j,i)=0;
	    r.slop.iso(n,k,j,i)=0;
	  end
	end
      end
    end
  end
end
pcp_ano_org_std0=io_pcp.ano_org_win_std0;
pcp_ano_iso_std0=io_pcp.ano_iso_win_std0;
r.corr.org_avg=squeeze(mean(r.corr.org,1));
r.slop.org_avg=squeeze(mean(r.slop.org,1))*pcp_ano_org_std0;
r.corr.iso_avg=squeeze(mean(r.corr.iso,1));
r.slop.iso_avg=squeeze(mean(r.slop.iso,1))*pcp_ano_iso_std0;

return
