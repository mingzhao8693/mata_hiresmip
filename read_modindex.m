function x=read_modindex(fn, yr1, yr2, threshold)
%fname='model_ao_index.txt'; yr1=1979; yr2=2014; threshold=0.5;
fid=fopen(fn,'r');
n=1; i=1; 
while (1 > 0)
  yyy  =fscanf(fid,'%d',1); 
  mon  =fscanf(fid,'%d',1);
  ind  =fscanf(fid,'%f',1);
  time =yyy+(mon-0.5)/12;
  if (yyy>=yr1) & (yyy<=yr2)
    x.year (i)=yyy;
    x.mon  (i)=mon;
    x.ind  (i)=ind;
    x.time (i)=time;
    i=i+1;
  elseif(yyy>yr2)
      break; yyy
  end
  n=n+1;
end
fclose(fid);
id_NDJFM=(x.mon>=11) | (x.mon<=3);
id=(x.ind>= threshold) & id_NDJFM; x.id_pos_NDJFM = id;
id=(x.ind<=-threshold) & id_NDJFM; x.id_neg_NDJFM = id;

id_MJJAS=(x.mon>=5) & (x.mon<=9);
id=(x.ind>= threshold) & id_MJJAS; x.id_pos_MJJAS = id;
id=(x.ind<=-threshold) & id_MJJAS; x.id_neg_MJJAS = id;

id=(x.ind>= threshold); x.id_pos = id;
id=(x.ind<=-threshold); x.id_neg = id;
return

figure; 
plot(x.time, x.ind); hold on; 
plot(x.time, x.id_pos,'r'); hold on; 
plot(x.time,-x.id_neg,'g'); hold on; 
