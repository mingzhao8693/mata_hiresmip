function [id_obs id_mod]=get_id_PNA(yr1,yr2,thresh,phas,season)
%yr1=1979; yr2=2014; thresh=0.8; phas='pos'; season='NDJFM';
tpath='/home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_hiresmip/PNA/';
fn='_1979_2014_Z500_0N-90N_120E-360E_'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%read in ERA_interim results%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='ERA_interim'; opt='obs'; i=2;
sea='DJF';fname=strcat(expn,fn,sea,'_EOF.nc')
o.djf=read_eof_all(tpath,expn,fname,opt);
sea='MAM';fname=strcat(expn,fn,sea,'_EOF.nc')
o.mam=read_eof_all(tpath,expn,fname,opt);
sea='JJA';fname=strcat(expn,fn,sea,'_EOF.nc')
o.jja=read_eof_all(tpath,expn,fname,opt);
sea='SON';fname=strcat(expn,fn,sea,'_EOF.nc')
o.son=read_eof_all(tpath,expn,fname,opt);
o.timid =[o.djf.timid; o.mam.timid; o.jja.timid; o.son.timid];
o.eof_ts=[o.djf.eof_ts(:,i);o.mam.eof_ts(:,i);o.jja.eof_ts(:,i);o.son.eof_ts(:,i)];
[a id]=sort(o.timid);
o.comb4.timid =a; o.comb4.eof_ts=o.eof_ts(id);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFM';fname=strcat(expn,fn,sea,'_EOF.nc')
o.ndjfm=read_eof_all(tpath,expn,fname,opt);
sea='MJJAS';fname=strcat(expn,fn,sea,'_EOF.nc')
o.mjjas=read_eof_all(tpath,expn,fname,opt);
sea='APR';  fname=strcat(expn,fn,sea,'_EOF.nc')
o.apr  =read_eof_all(tpath,expn,fname,opt);
sea='OCT';  fname=strcat(expn,fn,sea,'_EOF.nc')
o.oct  =read_eof_all(tpath,expn,fname,opt);
o.timid =[o.ndjfm.timid;o.apr.timid;o.mjjas.timid;o.oct.timid];
o.eof_ts=[o.ndjfm.eof_ts(:,i);o.apr.eof_ts(:,i);o.mjjas.eof_ts(:,i);o.oct.eof_ts(:,i)];
[a id]=sort(o.timid);
o.comb3.timid =a; o.comb3.eof_ts=o.eof_ts(id);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFMA';fname=strcat(expn,fn,sea,'_EOF.nc')
o.ndjfma=read_eof_all(tpath,expn,fname,opt);
sea='MJJASO';fname=strcat(expn,fn,sea,'_EOF.nc')
o.mjjaso=read_eof_all(tpath,expn,fname,opt);
o.timid =[o.ndjfma.timid; o.mjjaso.timid];
o.eof_ts=[o.ndjfma.eof_ts(:,i);o.mjjaso.eof_ts(:,i)];
[a id]=sort(o.timid);
o.comb2.timid =a; o.comb2.eof_ts=o.eof_ts(id);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='ALL';fname=strcat(expn,fn,sea,'_EOF.nc')
o.all=read_eof_all(tpath,expn,fname,opt);
o.comb0.timid =o.all.timid; o.comb0.eof_ts=o.all.eof_ts(:,i);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ figure;
% $$$ plot(o.comb4.timid,o.comb4.eof_ts,'r'); hold on;
% $$$ plot(o.comb2.timid,o.comb2.eof_ts,'g'); hold on;
% $$$ plot(o.comb3.timid,o.comb3.eof_ts,'b'); hold on;
% $$$ plot(o.comb0.timid,o.comb0.eof_ts,'-cs');
% $$$ plot(o.comb0.timid,w_obs.eof_ts(:,i),'c*')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%read in MODEL results%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='c192L33_am4p0_amip_HIRESMIP_H8'; opt='mod';
sea='DJF';fname=strcat(expn,fn,sea,'_EOF.nc')
v.djf=read_eof_all(tpath,expn,fname,opt);
sea='MAM';fname=strcat(expn,fn,sea,'_EOF.nc')
v.mam=read_eof_all(tpath,expn,fname,opt);
sea='JJA';fname=strcat(expn,fn,sea,'_EOF.nc')
v.jja=read_eof_all(tpath,expn,fname,opt);
sea='SON';fname=strcat(expn,fn,sea,'_EOF.nc')
v.son=read_eof_all(tpath,expn,fname,opt);
v.timid =[v.djf.timid; v.mam.timid; v.jja.timid; v.son.timid];
v.eof_ts=[v.djf.eof_ts(:,i);v.mam.eof_ts(:,i);v.jja.eof_ts(:,i);v.son.eof_ts(:,i)];
[a id]=sort(v.timid);
v.comb4.timid =a;
v.comb4.eof_ts=v.eof_ts(id);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFM';fname=strcat(expn,fn,sea,'_EOF.nc')
v.ndjfm=read_eof_all(tpath,expn,fname,opt);
sea='MJJAS';fname=strcat(expn,fn,sea,'_EOF.nc')
v.mjjas=read_eof_all(tpath,expn,fname,opt);
sea='APR';  fname=strcat(expn,fn,sea,'_EOF.nc')
v.apr  =read_eof_all(tpath,expn,fname,opt);
sea='OCT';  fname=strcat(expn,fn,sea,'_EOF.nc')
v.oct  =read_eof_all(tpath,expn,fname,opt);
v.timid =[v.ndjfm.timid;v.apr.timid;v.mjjas.timid;v.oct.timid];
v.eof_ts=[v.ndjfm.eof_ts(:,i);v.apr.eof_ts(:,i);v.mjjas.eof_ts(:,i);v.oct.eof_ts(:,i)];
[a id]=sort(v.timid);
v.comb3.timid =a; v.comb3.eof_ts=v.eof_ts(id);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFMA';fname=strcat(expn,fn,sea,'_EOF.nc')
v.ndjfma=read_eof_all(tpath,expn,fname,opt);
sea='MJJASO';fname=strcat(expn,fn,sea,'_EOF.nc')
v.mjjaso=read_eof_all(tpath,expn,fname,opt);
v.timid =[v.ndjfma.timid; v.mjjaso.timid];
v.eof_ts=[v.ndjfma.eof_ts(:,i);v.mjjaso.eof_ts(:,i)];
[a id]=sort(v.timid);
v.comb2.timid =a;
v.comb2.eof_ts=v.eof_ts(id);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='ALL';fname=strcat(expn,fn,sea,'_EOF.nc')
v.all=read_eof_all(tpath,expn,fname,opt);
v.comb0.timid =v.all.timid;
v.comb0.eof_ts=v.all.eof_ts(:,i);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ figure;
% $$$ plot(v.comb4.timid,v.comb4.eof_ts,'r'); hold on;
% $$$ plot(v.comb2.timid,v.comb2.eof_ts,'g'); hold on;
% $$$ plot(v.comb0.timid,v.comb0.eof_ts,'-bs'); hold on;
% $$$ plot(o.comb0.timid,-w_mod.eof_ts(:,i),'b*')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%find pos and neg index%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=o.comb0.eof_ts; x_obs=id_from_index(1979,2014,a,thresh);
a=v.comb0.eof_ts; x_mod=id_from_index(1979,2014,a,thresh);
%a=o.comb2.eof_ts; x_obs=id_from_index(1979,2014,a,thresh);
%a=v.comb2.eof_ts; x_mod=id_from_index(1979,2014,a,thresh);
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
% $$$ old=w_mod.eof_ts(:,i); 
% $$$ x_mod=id_from_index(1979,2014,a,thresh);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%below are AO index from other source%%%%%%%%
%x_obs1=read_aoindex (yr1,yr2,thresh); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(phas,'pos')
  disp('pos............')
  if strcmp(season,'NDJFM')
    id_mod =x_mod.id_pos_NDJFM;
    id_obs =x_obs.id_pos_NDJFM;
  elseif strcmp(season,'MJJAS')
    id_mod =x_mod.id_pos_MJJAS;
    id_obs =x_obs.id_pos_MJJAS;
  end
else
  disp('neg............')
  if strcmp(season,'NDJFM')
    id_mod =x_mod.id_neg_NDJFM;
    id_obs =x_obs.id_neg_NDJFM;
  elseif strcmp(season,'MJJAS')
    id_mod =x_mod.id_neg_MJJAS;
    id_obs =x_obs.id_neg_MJJAS;
  end
end
s=sprintf('sum(id_obs)=%d; sum(id_mod)=%d',sum(id_obs),sum(id_mod));
disp(s);

return




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

