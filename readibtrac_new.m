fn='/home/miz/AM2p12b/analysis/ibtracs_latest/IBTrACS.ALL.v04r00.nc';
f=netcdf(fn,'nowrite'); const=0.5144444444444;
a=f{'time'} (:,:); a(a==-9999000.)=NaN; v.time=a;
a=f{'lat'}(:,:); a(a==-9999)=NaN; v.lat=a;
a=f{'lon'}(:,:); a(a==-9999)=NaN; id=(a<0);a(id)=a(id)+360;a(a<20)=NaN;v.lon=a;
a=f{'sid'}   (:,:); a(a==-9999)=NaN; v.sid   =a;
a=f{'basin'} (:,:); a(a==-9999)=NaN; v.basin =a;
a=f{'number'}(:);   a(a==-9999)=NaN; v.noyr  =a;
a=f{'name'}  (:,:); a(a==-9999)=NaN; v.name  =a;
a=f{'nature'}(:,:,:); a(a==-9999)=NaN; v.nature=a;
a=f{'wmo_wind'}(:,:); a(a==-9999)=NaN; v.wind_wmo=a*const;
a=f{'wmo_pres'}(:,:); a(a==-9999)=NaN; v.pres_wmo=a;
a=f{'usa_wind'}(:,:); a(a==-9999)=NaN; v.wind_usa=a*const;
a=f{'usa_pres'}(:,:); a(a==-9999)=NaN; v.pres_usa=a;

a=v.time; a=datetime('17-Nov-1858')+a;
[v.year,v.mon,v.day]=ymd(a);
[v.hour,v.min,v.sec]=hms(a);
%figure; for i=1:1000; plot(v.lon(i,:),v.lat(i,:),'r'); hold on; end;

totnum=length(v.lat(:,1)); 
wind=v.wind_usa; pres=v.pres_usa;
for n=1:totnum
  ts(n).year=v.year(n,1); n
  ts(n).yymmdd=v.year(n,1)*10000+v.mon(n,1)*100+v.day(n,1);
  a=v.lat(n,:); id=~isnan(a); ts(n).num=sum(id); ts(n).noyr=v.noyr(n);
  ts(n).name=v.name(n,:);
  for i=1:ts(n).num
    ts(n).year  (i)=v.year(n,i);
    ts(n).mon   (i)=v.mon (n,i);
    ts(n).day   (i)=v.day (n,i);
    ts(n).hour  (i)=v.hour(n,i);
    ts(n).lat   (i)=v.lat (n,i);
    ts(n).lon   (i)=v.lon (n,i);
    ts(n).nature(i,:)=v.nature(n,i,:);
    a=pres(n,i);
    if (isnan(a))
      ts(n).pres(i)=-999.00;
    else
      ts(n).pres(i)=a;
    end
    a=wind(n,i);
    if (isnan(a))
      ts(n).wind(i)=-999.00;
    else
      ts(n).wind(i)=a;
    end
  end
  ts(n).TS=0; ts(n).HUR=0;
  a=nanmax(ts(n).wind);
  if (a>17)
    ts(n).TS=1;
  elseif (a>33)
    ts(n).TS=1; ts(n).HUR=1;
  end
end

for yr=1842:2022
  t=yr-1842+1; y(t).num=0; y(t).yr=yr;
end

for n=1:totnum
  yr=ts(n).year(1);n 
  t=yr-1842+1;
  if (ts(n).TS>0)
    y(t).num=y(t).num+1;
    k=y(t).num;
    y(t).yymmdd(k)=ts(n).yymmdd;
    y(t).ts(k)=ts(n);
  end
end
%output to GFDL format
%output all frequency as shown in the IBTRACS
do_all_time = 1;
nyr = length(y); 
yr_start=2014; yr_end=2020;
for t=1:nyr;
  yr=1842+t-1;
  if (yr>=yr_start) & (yr<=yr_end)
    traj = strcat('traj_',num2str(yr)); tid=fopen(traj,'w');
    ori  = strcat('ori_', num2str(yr)); oid=fopen(ori, 'w');
    ts=y(t).ts;
    for n=1:y(t).num
      for i=1:ts(n).num
	a=ts(n).hour(i);
	if (a==0 | a==6 | a==12 | a==18 | do_all_time)
	  fprintf(oid,'%7.2f %7.2f %7d %7d %7d %7d\n',...
		  ts(n).lon(i),  ts(n).lat(i), ...
		  ts(n).year(i), ts(n).mon(i),...
		  ts(n).day(i),  ts(n).hour(i));
	  fprintf(tid,'%s %7d %7d %7d %7d %7d\n','start',ts(n).num-i+1,...
		  ts(n).year(i),ts(n).mon(i),ts(n).day(i),ts(n).hour(i));
	  break
	end
      end
      for j=i:ts(n).num
	a=ts(n).hour(j);
	if (a==0 | a==6 | a==12 | a==18 | do_all_time)
	  fprintf(tid,'%7.2f %7.2f %7.2f %7.2f %7d %7d %7d %7d\n',...
		  ts(n).lon(j),  ts(n).lat(j), ...
		  ts(n).wind(j), ts(n).pres(j), ...
		  ts(n).year(j), ts(n).mon(j),...
		  ts(n).day(j),  ts(n).hour(j));
	end
      end
    end
    fclose(tid);
  end
end
  
