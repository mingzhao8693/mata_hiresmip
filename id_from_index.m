function x=id_from_index(yr1,yr2,ind,threshold)
%time=v.time; %yr1=1979; yr=2014; ind=a; threshold=0.8
time=[yr1+1/24:1/12:yr2+1]'; x.time=time;
mon=mod((time-floor(time(1)))*12,12)+0.5; mon=floor(mon);

id_NDJFM=(mon>=11) | (mon<=3);
id=(ind>= threshold) & id_NDJFM; x.id_pos_NDJFM = id;
id=(ind<=-threshold) & id_NDJFM; x.id_neg_NDJFM = id;

id_MJJAS=(mon>=5) & (mon<=9);
id=(ind>= threshold) & id_MJJAS; x.id_pos_MJJAS = id;
id=(ind<=-threshold) & id_MJJAS; x.id_neg_MJJAS = id;

id_DJF=(mon>=12) | (mon<=2);
id=(ind>= threshold) & id_DJF; x.id_pos_DJF = id;
id=(ind<=-threshold) & id_DJF; x.id_neg_DJF = id;

id_JJA=(mon>=6) & (mon<=8);
id=(ind>= threshold) & id_JJA; x.id_pos_JJA = id;
id=(ind<=-threshold) & id_JJA; x.id_neg_JJA = id;

id=(ind>= threshold); x.id_pos = id;
id=(ind<=-threshold); x.id_neg = id;

x.id_NDJFM=id_NDJFM;
x.id_MJJAS=id_MJJAS;
x.DJF = id_DJF;
x.JJA = id_JJA;

return

figure; 
plot(x.time, x.ind); hold on; 
plot(x.time, x.id_pos,'r'); hold on; 
plot(x.time,-x.id_neg,'g'); hold on; 
