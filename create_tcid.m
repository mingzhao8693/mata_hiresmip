function id=create_tcid(vx,year,ntime)
i=find(vx.tyear==year); 
ts=vx.yr(i).ts; num_ts=length(ts); %ts contains all TCs at year i
nlon=vx.nlon; nlat=vx.nlat;
id=zeros(nlon,nlat,ntime); 
if (leapyear(year))
  mon=[31 29 31 30 31 30 31 31 30 31 30 31];
else
  mon=[31 28 31 30 31 30 31 31 30 31 30 31];
end
ddd=cumsum(mon);
d_beg=[1 ddd+1]; d_end=ddd;
for n=1:num_ts
  onetc=ts(n);
  for j=1:onetc.num-1
    mmm=onetc.month(j); ddd=onetc.day(j); hhh=onetc.hour(j);
    t=(d_beg(mmm)+ddd-1-1)*4+floor(hhh/6)+1;%[mmm ddd hhh t]
    if (t==0)
      str=sprintf('%04d%02d%02d%02d',onetc.year(j),onetc.month(j),onetc.day(j),onetc.hour(j));disp(str);
    else
      iii=onetc.iii(j); jjj=onetc.jjj(j); d=10;
      i1=max(iii-d,1); i2=min(iii+d,nlon);
      j1=max(jjj-d,1); j2=min(jjj+d,nlat);
      id(i1:i2,j1:j2,t)=1;
    end
  end
end
return
