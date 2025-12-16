function [id_obs id_mod]=get_id_SAM(yr1,yr2,thresh,phas,season)
%yr1=1979; yr2=2014; thresh=0.8; phas='pos'; season='NDJFM';

tpath='/home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_hiresmip/SAM/';
fn='_1979_2014_SLP_20S-90S_'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%read in ERA_interim results%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='ERA_interim'; opt='obs'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='ALL';fname=strcat(expn,fn,sea,'_EOF.nc')
o.all=read_eof_all(tpath,expn,fname,opt);
o.comb0.timid =o.all.timid; o.comb0.eof_ts=o.all.eof_ts(:,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFMA';fname=strcat(expn,fn,sea,'_EOF.nc')
o.ndjfma=read_eof_nam(tpath,expn,fname,opt);
sea='MJJASO';fname=strcat(expn,fn,sea,'_EOF.nc')
o.mjjaso=read_eof_nam(tpath,expn,fname,opt);
o.timid =[o.ndjfma.timid; o.mjjaso.timid];
o.eof_ts=[o.ndjfma.eof_ts(:,1);o.mjjaso.eof_ts(:,1)];
[a id]=sort(o.timid);
o.comb2.timid =a; o.comb2.eof_ts=o.eof_ts(id);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ figure;
% $$$ plot(o.comb0.timid,o.comb0.eof_ts,'-cs');
% $$$ plot(o.comb0.timid,x_obs1.aoi,    'c*')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%read in MODEL results%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='c192L33_am4p0_amip_HIRESMIP_H8'; opt='mod';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='ALL';fname=strcat(expn,fn,sea,'_EOF.nc')
v.all=read_eof_nam(tpath,expn,fname,opt);
v.comb0.timid =v.all.timid;
v.comb0.eof_ts=v.all.eof_ts(:,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFMA';fname=strcat(expn,fn,sea,'_EOF.nc')
v.ndjfma=read_eof_nam(tpath,expn,fname,opt);
sea='MJJASO';fname=strcat(expn,fn,sea,'_EOF.nc')
v.mjjaso=read_eof_nam(tpath,expn,fname,opt);
v.timid =[v.ndjfma.timid; v.mjjaso.timid];
v.eof_ts=[v.ndjfma.eof_ts(:,1);v.mjjaso.eof_ts(:,1)];
[a id]=sort(v.timid);
v.comb2.timid =a;
v.comb2.eof_ts=v.eof_ts(id);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ figure;
% $$$ plot(v.comb0.timid,v.comb0.eof_ts,'-bs'); hold on;
% $$$ plot(v.comb0.timid,old,'b*'); hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%find pos and neg index%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 a=o.comb0.eof_ts; x_obs=id_from_index(1979,2014,a,thresh);
 a=v.comb0.eof_ts; x_mod=id_from_index(1979,2014,a,thresh);
%a=o.comb2.eof_ts; x_obs=id_from_index(1979,2014,a,thresh);
%a=v.comb2.eof_ts; x_mod=id_from_index(1979,2014,a,thresh);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(phas,'pos')
  disp('pos............')
  if strcmp(season,'NDJFM')
    id_obs=x_obs.id_pos_NDJFM; %id_obs=x_obs1.id_aop_NDJFM;
    id_mod=x_mod.id_pos_NDJFM;
  elseif strcmp(season,'MJJAS')
    id_obs=x_obs.id_pos_MJJAS; %id_obs=x_obs1.id_aop_MJJAS;
    id_mod=x_mod.id_pos_MJJAS;
  end
else
  disp('neg............')
  if strcmp(season,'NDJFM')
    id_obs=x_obs.id_neg_NDJFM; %id_obs=x_obs1.id_aon_NDJFM;
    id_mod=x_mod.id_neg_NDJFM;
  elseif strcmp(season,'MJJAS')
    id_obs=x_obs.id_neg_MJJAS; %id_obs=x_obs1.id_aon_MJJAS;
    id_mod=x_mod.id_neg_MJJAS;
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
