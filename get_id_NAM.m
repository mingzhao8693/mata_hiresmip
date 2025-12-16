function [id_obs id_mod]=get_id_NAM(yr1,yr2,thresh,phas,season)
%yr1=1979; yr2=2014; thresh=0.8; phas='pos'; season='NDJFM';

tpath='/home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_hiresmip/NAM/';
fn='_1979_2014_SLP_20N-90N_'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%read in ERA_interim results%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='ERA_interim'; opt='obs'; 
sea='DJF';fname=strcat(expn,fn,sea,'_EOF.nc')
o.djf=read_eof_nam(tpath,expn,fname,opt);
sea='MAM';fname=strcat(expn,fn,sea,'_EOF.nc')
o.mam=read_eof_nam(tpath,expn,fname,opt);
sea='JJA';fname=strcat(expn,fn,sea,'_EOF.nc')
o.jja=read_eof_nam(tpath,expn,fname,opt);
sea='SON';fname=strcat(expn,fn,sea,'_EOF.nc')
o.son=read_eof_nam(tpath,expn,fname,opt);
o.timid =[o.djf.timid; o.mam.timid; o.jja.timid; o.son.timid];
o.eof_ts=[o.djf.eof_ts(:,1);o.mam.eof_ts(:,1);o.jja.eof_ts(:,1);o.son.eof_ts(:,1)];
[a id]=sort(o.timid);
o.comb4.timid =a; o.comb4.eof_ts=o.eof_ts(id);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFM';fname=strcat(expn,fn,sea,'_EOF.nc')
o.ndjfm=read_eof_nam(tpath,expn,fname,opt);
sea='MJJAS';fname=strcat(expn,fn,sea,'_EOF.nc')
o.mjjas=read_eof_nam(tpath,expn,fname,opt);
sea='APR';  fname=strcat(expn,fn,sea,'_EOF.nc')
o.apr  =read_eof_nam(tpath,expn,fname,opt);
sea='OCT';  fname=strcat(expn,fn,sea,'_EOF.nc')
o.oct  =read_eof_nam(tpath,expn,fname,opt);
o.timid =[o.ndjfm.timid;o.apr.timid;o.mjjas.timid;o.oct.timid];
o.eof_ts=[o.ndjfm.eof_ts(:,1);o.apr.eof_ts(:,1);o.mjjas.eof_ts(:,1);o.oct.eof_ts(:,1)];
[a id]=sort(o.timid);
o.comb3.timid =a; o.comb3.eof_ts=o.eof_ts(id);
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
sea='ALL';fname=strcat(expn,fn,sea,'_EOF.nc')
o.all=read_eof_nam(tpath,expn,fname,opt);
o.comb0.timid =o.all.timid; o.comb0.eof_ts=o.all.eof_ts(:,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ figure;
% $$$ plot(o.comb4.timid,o.comb4.eof_ts,'r'); hold on;
% $$$ plot(o.comb2.timid,o.comb2.eof_ts,'g'); hold on;
% $$$ plot(o.comb3.timid,o.comb3.eof_ts,'b'); hold on;
% $$$ plot(o.comb0.timid,o.comb0.eof_ts,'-cs');
% $$$ plot(o.comb0.timid,x_obs1.aoi,    'c*')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%read in MODEL results%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='c192L33_am4p0_amip_HIRESMIP_H8'; opt='mod';
sea='DJF';fname=strcat(expn,fn,sea,'_EOF.nc')
v.djf=read_eof_nam(tpath,expn,fname,opt);
sea='MAM';fname=strcat(expn,fn,sea,'_EOF.nc')
v.mam=read_eof_nam(tpath,expn,fname,opt);
sea='JJA';fname=strcat(expn,fn,sea,'_EOF.nc')
v.jja=read_eof_nam(tpath,expn,fname,opt);
sea='SON';fname=strcat(expn,fn,sea,'_EOF.nc')
v.son=read_eof_nam(tpath,expn,fname,opt);
v.timid =[v.djf.timid; v.mam.timid; v.jja.timid; v.son.timid];
v.eof_ts=[v.djf.eof_ts(:,1);v.mam.eof_ts(:,1);v.jja.eof_ts(:,1);v.son.eof_ts(:,1)];
[a id]=sort(v.timid);
v.comb4.timid =a;
v.comb4.eof_ts=v.eof_ts(id);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFM';fname=strcat(expn,fn,sea,'_EOF.nc')
v.ndjfm=read_eof_nam(tpath,expn,fname,opt);
sea='MJJAS';fname=strcat(expn,fn,sea,'_EOF.nc')
v.mjjas=read_eof_nam(tpath,expn,fname,opt);
sea='APR';  fname=strcat(expn,fn,sea,'_EOF.nc')
v.apr  =read_eof_nam(tpath,expn,fname,opt);
sea='OCT';  fname=strcat(expn,fn,sea,'_EOF.nc')
v.oct  =read_eof_nam(tpath,expn,fname,opt);
v.timid =[v.ndjfm.timid;v.apr.timid;v.mjjas.timid;v.oct.timid];
v.eof_ts=[v.ndjfm.eof_ts(:,1);v.apr.eof_ts(:,1);v.mjjas.eof_ts(:,1);v.oct.eof_ts(:,1)];
[a id]=sort(v.timid);
v.comb3.timid =a; v.comb3.eof_ts=v.eof_ts(id);
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
sea='ALL';fname=strcat(expn,fn,sea,'_EOF.nc')
v.all=read_eof_nam(tpath,expn,fname,opt);
v.comb0.timid =v.all.timid;
v.comb0.eof_ts=v.all.eof_ts(:,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ figure;
% $$$ plot(v.comb4.timid,v.comb4.eof_ts,'r'); hold on;
% $$$ plot(v.comb2.timid,v.comb2.eof_ts,'g'); hold on;
% $$$ plot(v.comb0.timid,v.comb0.eof_ts,'-bs'); hold on;
% $$$ plot(v.comb0.timid,old,'b*'); hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%find pos and neg index%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%a=o.comb0.eof_ts; x_obs=id_from_index(1979,2014,a,thresh);
%a=v.comb0.eof_ts; x_mod=id_from_index(1979,2014,a,thresh);
 a=o.comb2.eof_ts; x_obs=id_from_index(1979,2014,a,thresh);
 a=v.comb2.eof_ts; x_mod=id_from_index(1979,2014,a,thresh);
%a=o.comb3.eof_ts; x_obs=id_from_index(1979,2014,a,thresh);
%a=v.comb3.eof_ts; x_mod=id_from_index(1979,2014,a,thresh);
%a=o.comb4.eof_ts; x_obs=id_from_index(1979,2014,a,thresh);
%a=v.comb4.eof_ts; x_mod=id_from_index(1979,2014,a,thresh);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ tpath='/home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_hiresmip/';
% $$$ expn='c192L33_am4p0_amip_HIRESMIP_H8'; opt='mod';
% $$$ fname=strcat(expn,'_1979_2014.EOF_SLP_20N-90N.nc'); 
% $$$ w_mod=read_eof(tpath,expn,fname,opt);
% $$$ old=w_mod.eof_ts(:,1); 
% $$$ x_mod=id_from_index(1979,2014,a,thresh);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%below are AO index from other source%%%%%%%%
x_obs1=read_aoindex (yr1,yr2,thresh); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(phas,'pos')
  disp('pos............')
  if strcmp(season,'NDJFM')
    id_mod =x_mod.id_pos_NDJFM;
    id_obs =x_obs.id_pos_NDJFM;
    id_obs1=x_obs1.id_aop_NDJFM;
  elseif strcmp(season,'MJJAS')
    id_mod =x_mod.id_pos_MJJAS;
    id_obs =x_obs.id_pos_MJJAS;
    id_obs1=x_obs1.id_aop_MJJAS;
  end
else
  disp('neg............')
  if strcmp(season,'NDJFM')
    id_mod =x_mod.id_neg_NDJFM;
    id_obs =x_obs.id_neg_NDJFM;
    id_obs1=x_obs1.id_aon_NDJFM;
  elseif strcmp(season,'MJJAS')
    id_mod =x_mod.id_neg_MJJAS;
    id_obs =x_obs.id_neg_MJJAS;
    id_obs1=x_obs1.id_aon_MJJAS;
  end
end

id_obs = id_obs1; %use external NAM index for OBS

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
