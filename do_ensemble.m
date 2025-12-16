function [ve]=do_ensemble()

tpath='/work/miz/mat_hiresmip_cre/'; s='_readartcmcs_day_cre_new.mat';
yrs='_2001_2020_'; diag='_diag3';

expn='c192L33_am4p0_amip_HIRESMIP_HX';  v1=get_one_member(tpath,expn,yrs,diag,s);

diag='_diag2';
expn='c192L33_am4p0_amip_HIRESMIP_HX4'; v2=get_one_member(tpath,expn,yrs,diag,s);
expn='c192L33_am4p0_amip_HIRESMIP_HX5'; v3=get_one_member(tpath,expn,yrs,diag,s);
expn='c192L33_am4p0_amip_HIRESMIP_HX6'; v4=get_one_member(tpath,expn,yrs,diag,s);
expn='c192L33_am4p0_amip_HIRESMIP_HX7'; v5=get_one_member(tpath,expn,yrs,diag,s);
'success'
ve.mc=ens_avg(v1.mc,v2.mc,v3.mc,v4.mc,v5.mc);
ve.al=ens_avg(v1.al,v2.al,v3.al,v4.al,v5.al);
ve.ar=ens_avg(v1.ar,v2.ar,v3.ar,v4.ar,v5.ar);
ve.tc=ens_avg(v1.tc,v2.tc,v3.tc,v4.tc,v5.tc);
ve.pr=ens_avg(v1.pr,v2.pr,v3.pr,v4.pr,v5.pr);
ve.p2=ens_avg(v1.p2,v2.p2,v3.p2,v4.p2,v5.p2);
ve.pb=ens_avg(v1.pb,v2.pb,v3.pb,v4.pb,v5.pb);
ve.pc=ens_avg(v1.pc,v2.pc,v3.pc,v4.pc,v5.pc);
ve.pd=ens_avg(v1.pd,v2.pd,v3.pd,v4.pd,v5.pd);

return
