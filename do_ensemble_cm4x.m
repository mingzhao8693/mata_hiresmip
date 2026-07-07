function [ve]=do_ensemble_cm4x()

tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre_newer1.mat';
yrs='_2001_2020_'; diag='_diag2'; expn0='c192L33_CM4X_amip';

expn=expn0;               v(1) =get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_02'); v(2) =get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_03'); v(3) =get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_04'); v(4) =get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_05'); v(5) =get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_06'); v(6) =get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_07'); v(7) =get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_08'); v(8) =get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_09'); v(9) =get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_10'); v(10)=get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_11'); v(11)=get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_12'); v(12)=get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_13'); v(13)=get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_14'); v(14)=get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_15'); v(15)=get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_16'); v(16)=get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_17'); v(17)=get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_18'); v(18)=get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_19'); v(19)=get_one_member(tpath,expn,yrs,diag,s);
expn=strcat(expn0,'_20'); v(20)=get_one_member(tpath,expn,yrs,diag,s);

'success'
ve.mc=ens_avg_cm4x(v,'mc');
ve.al=ens_avg_cm4x(v,'al');
ve.ar=ens_avg_cm4x(v,'ar');
ve.tc=ens_avg_cm4x(v,'tc');
ve.pr=ens_avg_cm4x(v,'pr');
ve.p2=ens_avg_cm4x(v,'p2');
ve.pb=ens_avg_cm4x(v,'pb');
ve.pc=ens_avg_cm4x(v,'pc');
ve.pd=ens_avg_cm4x(v,'pd');

return
