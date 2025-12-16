function al=compute_gm0(xx,aa,opt)
a=squeeze(xx.frqday_org);  al.frqday_org =mean(mean(a.*aa));
a=squeeze(xx.frqday);      al.frqday_ar  =mean(mean(a.*aa));
a=squeeze(xx.tas_idwei);   al.tas_idwei  =mean(mean(a.*aa));
a=squeeze(xx.prday_idwei); al.prday_idwei=mean(mean(a.*aa));
a=squeeze(xx.lwcf_idwei);  al.lwcf_idwei =mean(mean(a.*aa));
a=squeeze(xx.swcf_idwei);  al.swcf_idwei =mean(mean(a.*aa));
a=squeeze(xx.ttcf_idwei);  al.ttcf_idwei =mean(mean(a.*aa));

a=squeeze(xx.tas_idavg);   al.tas_idavg  =nanmean(nanmean(a.*aa));
a=squeeze(xx.prday_idavg); al.prday_idavg=nanmean(nanmean(a.*aa));
a=squeeze(xx.lwcf_idavg);  al.lwcf_idavg =nanmean(nanmean(a.*aa));
a=squeeze(xx.swcf_idavg);  al.swcf_idavg =nanmean(nanmean(a.*aa));
a=squeeze(xx.ttcf_idavg);  al.ttcf_idavg =nanmean(nanmean(a.*aa));

a=squeeze(xx.tas_nonid_avg);   al.tas_ndavg  =nanmean(nanmean(a.*aa));
a=squeeze(xx.prday_nonid_avg); al.prday_ndavg=nanmean(nanmean(a.*aa));
a=squeeze(xx.lwcf_nonid_avg);  al.lwcf_ndavg =nanmean(nanmean(a.*aa));
a=squeeze(xx.swcf_nonid_avg);  al.swcf_ndavg =nanmean(nanmean(a.*aa));
a=squeeze(xx.ttcf_nonid_avg);  al.ttcf_ndavg =nanmean(nanmean(a.*aa));

if (opt==1)
  a=squeeze(xx.prc_idwei);    al.prc_idwei   =mean(mean(a.*aa));
  a=squeeze(xx.prl_idwei);    al.prl_idwei   =mean(mean(a.*aa));
  a=squeeze(xx.cvh_idwei);    al.cvh_idwei   =mean(mean(a.*aa));
  a=squeeze(xx.lsh_idwei);    al.lsh_idwei   =mean(mean(a.*aa));
  a=squeeze(xx.dcv_idwei);    al.dcv_idwei   =mean(mean(a.*aa));
  a=squeeze(xx.dls_idwei);    al.dls_idwei   =mean(mean(a.*aa));
  a=squeeze(xx.qlcond_idwei); al.qlcond_idwei=mean(mean(a.*aa));
  a=squeeze(xx.qicond_idwei); al.qicond_idwei=mean(mean(a.*aa));
  al.pe_ls = al.prl_idwei / al.lsh_idwei;
  al.pe_cv = al.prc_idwei / al.cvh_idwei;
end
