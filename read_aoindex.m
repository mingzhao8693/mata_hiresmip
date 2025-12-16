function x=read_aoindex(yr1, yr2, aoi0)
%yr1=1979; yr2=2014; aoi0=0.5;
fname='aoindex.txt'; fid=fopen(fname,'r');
n=1; i=1; 
while (1 > 0)
  yyy  =fscanf(fid,'%d',1); 
  mon  =fscanf(fid,'%d',1);
  aoi  =fscanf(fid,'%f',1);
  time =yyy+(mon-0.5)/12;
  if (yyy>=yr1) & (yyy<=yr2)
    x.year (i)=yyy;
    x.mon  (i)=mon;
    x.aoi  (i)=aoi;
    x.time (i)=time;
    i=i+1;
  elseif(yyy>yr2)
      break;
  end
  n=n+1;
end
fclose(fid);
id_NDJFM=(x.mon>=11) | (x.mon<=3);
id=(x.aoi>= aoi0) & id_NDJFM; x.id_aop_NDJFM = id;
id=(x.aoi<=-aoi0) & id_NDJFM; x.id_aon_NDJFM = id;

id_MJJAS=(x.mon>=5) & (x.mon<=9);
id=(x.aoi>= aoi0) & id_MJJAS; x.id_aop_MJJAS = id;
id=(x.aoi<=-aoi0) & id_MJJAS; x.id_aon_MJJAS = id;

id=(x.aoi>= aoi0); x.id_aop = id;
id=(x.aoi<=-aoi0); x.id_aon = id;

return

figure; 
plot(x.time,x.aoi); hold on; 
plot(x.time, x.id_aop,'r'); hold on; 
plot(x.time,-x.id_aon,'g'); hold on; 
