function x=read_oni(yr1, yr2, ssta0)
%yr1=1979; yr2=2014; ssta0=0.8;
fname='oni.txt'; fid=fopen(fname,'r');
n=1; i=1; 
while (1 > 0)
  yyy  =fscanf(fid,'%d',1); 
  mon  =fscanf(fid,'%d',1);
  sst1 =fscanf(fid,'%f',1);
  sst2 =fscanf(fid,'%f',1);
  ssta1=fscanf(fid,'%f',1);
  ssta2=fscanf(fid,'%f',1);
  enso =fscanf(fid,'%s',1);
  time =yyy+(mon-0.5)/12;
  if (yyy>=yr1) & (yyy<=yr2)
    x.year (i)=yyy;
    x.mon  (i)=mon;
    x.sst1 (i)=sst1;
    x.sst2 (i)=sst2;
    x.ssta1(i)=ssta1;
    x.ssta2(i)=ssta2;
    x.enso (i)=enso;
    x.time (i)=time;
    i=i+1;
  elseif(yyy>yr2)
      break;
  end

  n=n+1;
end
fclose(fid); %ssta0 = 1; 
id_NDJFM=(x.mon>=11) | (x.mon<=3);
id=(x.ssta2>= ssta0) & id_NDJFM; x.id_eln_NDJFM = id;
id=(x.ssta2<=-ssta0) & id_NDJFM; x.id_lan_NDJFM = id;

id_MJJAS=(x.mon>=5)  & (x.mon<=9);
id=(x.ssta2>= ssta0) & id_MJJAS; x.id_eln_MJJAS = id;
id=(x.ssta2<=-ssta0) & id_MJJAS; x.id_lan_MJJAS = id;

id=(x.ssta2>= ssta0); x.id_eln = id;
id=(x.ssta2<=-ssta0); x.id_lan = id;

return

figure; 
plot(x.time,x.ssta2); hold on; 
plot(x.time,x.id_elnino,'r'); hold on; 
plot(x.time,x.id_lanina,'g'); hold on; 


plot(x.time,x.ssta2,'r');


