function [id_obs id_mod]=get_id_ENSO(yr1,yr2,thresh,phas,season)
%yr1=1979; yr2=2014; thresh=0.8; phas='pos'; season='NDJFM';
x=read_oni(yr1,yr2,thresh); 
a=x.ssta2'; 
x_obs=id_from_index(yr1,yr2,a,thresh);
x_mod=x_obs;

if strcmp(phas,'pos')
  disp('pos............')
  if strcmp(season,'NDJFM')
    id_obs=x_obs.id_pos_NDJFM; %id_obs=x_obs1.id_pnap_NDJFM;
    id_mod=x_mod.id_pos_NDJFM;
  elseif strcmp(season,'MJJAS')
    id_obs=x_obs.id_pos_MJJAS; %id_obs=x_obs1.id_pnap_MJJAS;
    id_mod=x_mod.id_pos_MJJAS;   
  elseif strcmp(season,'DJF')
    id_obs=x_obs.id_pos_DJF;   %id_obs=x_obs1.id_pnap_DJF;
    id_mod=x_mod.id_pos_DJF;   
  elseif strcmp(season,'JJA')
    id_obs=x_obs.id_pos_JJA;   %id_obs=x_obs1.id_pnap_JJA;
    id_mod=x_mod.id_pos_JJA;   
  end
else
  disp('neg............')
  if strcmp(season,'NDJFM')
    id_obs=x_obs.id_neg_NDJFM; %id_obs=x_obs1.id_pnan_NDJFM;
    id_mod=x_mod.id_neg_NDJFM;
  elseif strcmp(season,'MJJAS')
    id_obs=x_obs.id_neg_MJJAS; %id_obs=x_obs1.id_pnan_MJJAS;
    id_mod=x_mod.id_neg_MJJAS;
  elseif strcmp(season,'DJF')
    id_obs=x_obs.id_neg_DJF;   %id_obs=x_obs1.id_pnan_DJF;
    id_mod=x_mod.id_neg_DJF;   
  elseif strcmp(season,'JJA')
    id_obs=x_obs.id_neg_JJA;   %id_obs=x_obs1.id_pnan_JJA;
    id_mod=x_mod.id_neg_JJA;   
  end
end
s=sprintf('sum(id_obs)=%d; sum(id_mod)=%d',sum(id_obs),sum(id_mod));
disp(s);
return

