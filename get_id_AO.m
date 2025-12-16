function [id_obs id_mod]=get_id_AO(yr1,yr2,thresh,phas,season)
%yr1=1979; yr2=2014; thresh=0.8;
tpath='/home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_hiresmip/';
expn='ERA_interim'; opt='obs';
%fname=strcat(expn,'_1979_2014.EOF_z700.nc'); 
fname=strcat(expn,'_1979_2014.EOF_SLP_20N-90N.nc'); 
w_obs=read_eof(tpath,expn,fname,opt);
a=w_obs.eof_ts(:,1); 
x_obs=id_from_index(1979,2014,a,thresh);

tpath='/home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_hiresmip/';
expn='c192L33_am4p0_amip_HIRESMIP_H8'; opt='mod';
%fname=strcat(expn,'_1979_2014.EOF_z700.nc'); 
fname=strcat(expn,'_1979_2014.EOF_SLP_20N-90N.nc'); 
w_mod=read_eof(tpath,expn,fname,opt);
a=w_mod.eof_ts(:,1); 
x_mod=id_from_index(1979,2014,a,thresh);

x_obs1=read_aoindex (yr1,yr2,thresh); 

if strcmp(phas,'pos')
  disp('pos............')
  if strcmp(season,'NDJFM')
    id_obs=x_obs.id_pos_NDJFM;
    id_mod=x_mod.id_pos_NDJFM;
    id_obs=x_obs1.id_aop_NDJFM;
  elseif strcmp(season,'MJJAS')
    id_obs=x_obs.id_pos_MJJAS;
    id_mod=x_mod.id_pos_MJJAS;
    id_obs=x_obs1.id_aop_MJJAS;
  end
else
  disp('neg............')
  if strcmp(season,'NDJFM')
    id_obs=x_obs.id_neg_NDJFM;
    id_mod=x_mod.id_neg_NDJFM;
    id_obs=x_obs1.id_aon_NDJFM;
  elseif strcmp(season,'MJJAS')
    id_obs=x_obs.id_neg_MJJAS;
    id_mod=x_mod.id_neg_MJJAS;
    id_obs=x_obs1.id_aon_MJJAS;
  end
end

return

%compare to other calculations:
yr1=1979; yr2=2014; a0=0.8; 
x=read_aoindex (yr1,yr2,a0);                      id_obs1=x.id_aop_NDJFM;x_obs=x;
x=read_modindex('model_ao_index.txt',yr1,yr2,a0); id_mod1=x.id_pos_NDJFM;x_mod=x;
load('/work/miz/mat_AR/c192L33_am4p0_amip_HIRESMIP_H8_clivar_ana_aopna_NH.mat');v
index=-v.AO_z700.index1'; x=id_from_index(yr1,yr2,index,a0); id_mod1=x.id_pos_NDJFM;
corrcoef(index,x_mod.ind)
%figure; plot(id_mod1,'r*'); hold on; plot(id_mod,'bs');
%figure; plot(v.time,index,'-r*'); hold on; plot(v.time,x_mod.ind,'-bs');


% $$$ yr1=1979; yr2=2014; a0=0.8; 
% $$$ x=read_aoindex (yr1,yr2,a0);                      id_obs=x.id_aon_NDJFM;x_obs=x;
% $$$ x=read_modindex('model_ao_index.txt',yr1,yr2,a0); id_mod1=x.id_neg_NDJFM;x_mod=x;
% $$$ load('/work/miz/mat_AR/c192L33_am4p0_amip_HIRESMIP_H8_clivar_ana_aopna_NH.mat');v
% $$$ index=-v.AO_z700.index1; x=id_from_index(v.time,index,a0); id_mod=x.id_neg_NDJFM;
% $$$ corrcoef(index,x_mod.ind)
% $$$ %figure; plot(id_mod1,'r*'); hold on; plot(id_mod,'bs');
% $$$ %figure; plot(v.time,index,'-r*'); hold on; plot(v.time,x_mod.ind,'-bs');
