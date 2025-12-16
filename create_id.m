function id=create_id(vx,year,ntime,olr)
%vx=ve; year=32; ntime=nt;
%if (year > 2020); id(1:480,1:240,1:1460)=0; return; end
nlon=length(vx.lon); nlat=length(vx.lat);
i=find(vx.tyear==year); i
if ~isfield(vx, 'yr') | isempty(i) | i>length(vx.yr)
  id=zeros(nlon,nlat,ntime); return;
end

ts=vx.yr(i).ts; num_ts=length(ts); 
disp(strcat('number of storms=',num2str(num_ts)));%ts contains all TCs at year i
id=zeros(nlon,nlat,ntime); 
if (leapyear(year) & year>200)
  mon=[31 29 31 30 31 30 31 31 30 31 30 31];
else
  mon=[31 28 31 30 31 30 31 31 30 31 30 31];
end
ddd=cumsum(mon);
d_beg=[1 ddd+1]; d_end=ddd; dn=8; dd=2;
dnx=round(6/(vx.lon(2)-vx.lon(1))); disp(sprintf('dnx=%f',dnx));
dny=round(6/(vx.lat(2)-vx.lat(1))); disp(sprintf('dny=%f',dny));
for n=1:num_ts
  onetc=ts(n);
  for j=1:onetc.num-1
    mmm=onetc.month(j); ddd=onetc.day(j); hhh=onetc.hour(j);
    t=(d_beg(mmm)+ddd-1-1)*4+floor(hhh/6)+1;%[mmm ddd hhh t]
    if (t==0 | t>ntime)
      str=sprintf('%04d%02d%02d%02d',onetc.year(j),onetc.month(j),onetc.day(j),onetc.hour(j));disp(str);
    else
      %iii=onetc.iii(j); jjj=onetc.jjj(j); d=10;
      %i1=max(iii-d,1); i2=min(iii+d,nlon);
      %j1=max(jjj-d,1); j2=min(jjj+d,nlat);
      latx=onetc.lat(j); lonx=onetc.lon(j);
      s=findij(latx,lonx,vx.lat,vx.lon);
      if exist('olr')
	i1=max(s.i1-dd,1); i2=min(s.i2+dd,nlon);
	j1=max(s.j1-dd,1); j2=min(s.j2+dd,nlat);
	if mean(mean(olr(i1:i2,j1:j2,t)))>0
	  i1=max(s.i1-dnx,1); i2=min(s.i2+dnx,nlon);
	  j1=max(s.j1-dny,1); j2=min(s.j2+dny,nlat);
	  id(i1:i2,j1:j2,t)=1;
	end
      else
	i1=max(s.i1-dnx,1); i2=min(s.i2+dnx,nlon);
	j1=max(s.j1-dny,1); j2=min(s.j2+dny,nlat);
	id(i1:i2,j1:j2,t)=1;
      end
    end
  end
end
return
