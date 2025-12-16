function x=read_pnaindex(fname, yr1, yr2, pnai0)
%yr1=1979; yr2=2014; pnai0=0.5; fname='pnaindex.txt'; 
if strcmp(fname,'pnaindex_ncep_mon.txt')
  fid=fopen(fname,'r');
  n=1; i=1; 
  while (1 > 0)
    yyy(1:12)=fscanf(fid,'%d',1); 
    mon(1:12)=[1:12];
    pnai =fscanf(fid,'%f',12);
    time =yyy+(mon-0.5)/12;
    if (yyy(1)>=yr1) & (yyy(1)<=yr2)
      x.year (i:i+11)=yyy;
      x.mon  (i:i+11)=mon;
      x.pnai (i:i+11)=pnai;
      x.time (i:i+11)=time;
      i=i+12;
    elseif(yyy(1)>yr2)
      break;
    end
    n=n+1;
  end
else
  fid=fopen(fname,'r');
  n=1; i=1; 
  while (1 > 0)
    yyy  =fscanf(fid,'%d',1); 
    mon  =fscanf(fid,'%d',1);
    pnai =fscanf(fid,'%f',1);
    time =yyy+(mon-0.5)/12;
    if (yyy>=yr1) & (yyy<=yr2)
      x.year (i)=yyy;
      x.mon  (i)=mon;
      x.pnai (i)=pnai;
      x.time (i)=time;
      i=i+1;
    elseif(yyy>yr2)
      break;
    end
    n=n+1;
  end
end
fclose(fid);

id_NDJFM=(x.mon>=11) | (x.mon<=3);
id=(x.pnai>= pnai0) & id_NDJFM; x.id_pnap_NDJFM = id;
id=(x.pnai<=-pnai0) & id_NDJFM; x.id_pnan_NDJFM = id;

id_MJJAS=(x.mon>=5) & (x.mon<=9);
id=(x.pnai>= pnai0) & id_MJJAS; x.id_pnap_MJJAS = id;
id=(x.pnai<=-pnai0) & id_MJJAS; x.id_pnan_MJJAS = id;

id=(x.pnai>= pnai0); x.id_pnap = id;
id=(x.pnai<=-pnai0); x.id_pnan = id;

return

figure; 
plot(x.time,x.pnai); hold on; 
plot(x.time, x.id_pnap,'r'); hold on; 
plot(x.time,-x.id_pnan,'g'); hold on; 
