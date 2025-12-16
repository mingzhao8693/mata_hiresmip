function [id_obs id_mod]=get_id_PNA(yr1,yr2,thresh,phas,season)
%yr1=1979; yr2=2014; thresh=0.8; phas='pos'; season='NDJFM';
tpath='/home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_hiresmip/';
expn='ERA_interim'; fname='ERA_interim_1979_2014.EOF_z500_0N-90N_120E-360E.nc'; opt='obs';
w_obs=read_eof(tpath,expn,fname,opt);
mod_num=2; a=w_obs.eof_ts(:,mod_num); %mode2 is for PNA
x_obs=id_from_index(yr1,yr2,a,thresh);

tpath='/home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_hiresmip/';
expn='c192L33_am4p0_amip_HIRESMIP_H8'; 
fname='c192L33_am4p0_amip_HIRESMIP_H8_1979_2014.EOF_z500_0N-90N_120E-360E.nc'; opt='mod';
w_mod=read_eof(tpath,expn,fname,opt);
mod_num=2; a=w_mod.eof_ts(:,mod_num); %mode2 is for PNA
x_mod=id_from_index(yr1,yr2,-a,thresh);

x_obs1=read_pnaindex(yr1,yr2,thresh); 
x_mod1=read_modindex('model_pna_index.txt',yr1,yr2,thresh) %id=x.id_pos_NDJFM;

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

