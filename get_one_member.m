function [vx]=get_one_member(tpath,expn,yrs,diag,s)
%tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre_new.mat';
%expn='c192L33_am4p0_amip_HIRESMIP_HX'; yrs='_2001_2020_'; diag='_diag3';

fext=strcat(yrs,'MC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);vx.mc=v;fn
fext=strcat(yrs,'AL',  diag,s); fn=strcat(tpath,expn,fext); load(fn);vx.al=v;fn
fext=strcat(yrs,'AR',  diag,s); fn=strcat(tpath,expn,fext); load(fn);vx.ar=v;fn
fext=strcat(yrs,'TC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);vx.tc=v;fn
fext=strcat(yrs,'PR01',diag,s); fn=strcat(tpath,expn,fext); load(fn);vx.pr=v;fn
fext=strcat(yrs,'P02', diag,s); fn=strcat(tpath,expn,fext); load(fn);vx.p2=v;fn
fext=strcat(yrs,'PB',  diag,s); fn=strcat(tpath,expn,fext); load(fn);vx.pb=v;fn
fext=strcat(yrs,'PC',  diag,s); fn=strcat(tpath,expn,fext); load(fn);vx.pc=v;fn
fext=strcat(yrs,'PD',  diag,s); fn=strcat(tpath,expn,fext); load(fn);vx.pd=v;fn

return
