function al=compute_zma0(xx,aa,opt)
a=squeeze(xx.frqday_org);    al.frqday_org   =mean(a.*aa,2);
a=squeeze(xx.frqday);        al.frqday       =mean(a.*aa,2);
a=squeeze(xx.day_from_jan1); al.day_from_jan1=mean(a.*aa,2);
a=squeeze(xx.day_from_jul1); al.day_from_jul1=mean(a.*aa,2);

a=squeeze(xx.tas_idwei);   al.tas_idwei  =mean(a.*aa,2);
a=squeeze(xx.prday_idwei); al.prday_idwei=mean(a.*aa,2);
a=squeeze(xx.lwcf_idwei);  al.lwcf_idwei =mean(a.*aa,2);
a=squeeze(xx.swcf_idwei);  al.swcf_idwei =mean(a.*aa,2);
a=squeeze(xx.ttcf_idwei);  al.ttcf_idwei =mean(a.*aa,2);

a=squeeze(xx.tas_idavg);   al.tas_idavg  =nanmean(a,2);
a=squeeze(xx.prday_idavg); al.prday_idavg=nanmean(a,2);
a=squeeze(xx.lwcf_idavg);  al.lwcf_idavg =nanmean(a,2);
a=squeeze(xx.swcf_idavg);  al.swcf_idavg =nanmean(a,2);
a=squeeze(xx.ttcf_idavg);  al.ttcf_idavg =nanmean(a,2);

a=squeeze(xx.tas_nonid_avg);   al.tas_ndavg  =nanmean(a,2);
a=squeeze(xx.prday_nonid_avg); al.prday_ndavg=nanmean(a,2);
a=squeeze(xx.lwcf_nonid_avg);  al.lwcf_ndavg =nanmean(a,2);
a=squeeze(xx.swcf_nonid_avg);  al.swcf_ndavg =nanmean(a,2);
a=squeeze(xx.ttcf_nonid_avg);  al.ttcf_ndavg =nanmean(a,2);

if (opt==1)
  a=squeeze(xx.rlut_idwei);   al.rlut_idwei  =mean(a.*aa,2);
  a=squeeze(xx.swabs_idwei);  al.swabs_idwei =mean(a.*aa,2);
  a=squeeze(xx.prw_idwei);    al.prw_idwei   =mean(a.*aa,2);
  a=squeeze(xx.clwvi_idwei);  al.clwvi_idwei =mean(a.*aa,2);
  a=squeeze(xx.clivi_idwei);  al.clivi_idwei =mean(a.*aa,2);
  a=squeeze(xx.clt_idwei);    al.clt_idwei   =mean(a.*aa,2);

  a=squeeze(xx.prc_idwei);    al.prc_idwei   =mean(a.*aa,2);
  a=squeeze(xx.prl_idwei);    al.prl_idwei   =mean(a.*aa,2);
  a=squeeze(xx.cvh_idwei);    al.cvh_idwei   =mean(a.*aa,2);
  a=squeeze(xx.lsh_idwei);    al.lsh_idwei   =mean(a.*aa,2);
  a=squeeze(xx.dcv_idwei);    al.dcv_idwei   =mean(a.*aa,2);
  a=squeeze(xx.dls_idwei);    al.dls_idwei   =mean(a.*aa,2);
  a=squeeze(xx.qlcond_idwei); al.qlcond_idwei=mean(a.*aa,2);
  a=squeeze(xx.qicond_idwei); al.qicond_idwei=mean(a.*aa,2);
  al.pe_ls = al.prl_idwei / al.lsh_idwei;
  al.pe_cv = al.prc_idwei / al.cvh_idwei;
  
  a=squeeze(xx.rlut_idavg);       al.rlut_idavg  =mean(a,2);
  a=squeeze(xx.swabs_idavg);      al.swabs_idavg =mean(a,2);
  a=squeeze(xx.prw_idavg);        al.prw_idavg   =mean(a,2);
  a=squeeze(xx.clwvi_idavg);      al.clwvi_idavg =mean(a,2);
  a=squeeze(xx.clivi_idavg);      al.clivi_idavg =mean(a,2);
  a=squeeze(xx.clt_idavg);        al.clt_idavg   =mean(a,2);
  a=squeeze(xx.prc_idavg);        al.prc_idavg   =mean(a,2);
  a=squeeze(xx.prl_idavg);        al.prl_idavg   =mean(a,2);
  a=squeeze(xx.cvh_idavg);        al.cvh_idavg   =mean(a,2);
  a=squeeze(xx.lsh_idavg);        al.lsh_idavg   =mean(a,2);
  a=squeeze(xx.dcv_idavg);        al.dcv_idavg   =mean(a,2);
  a=squeeze(xx.dls_idavg);        al.dls_idavg   =mean(a,2);
  a=squeeze(xx.qlcond_idavg);     al.qlcond_idavg=mean(a,2);
  a=squeeze(xx.qicond_idavg);     al.qicond_idavg=mean(a,2);
  a=squeeze(xx.prc_nonid_avg);    al.prc_ndavg   =mean(a,2);
  a=squeeze(xx.prl_nonid_avg);    al.prl_ndavg   =mean(a,2);
  a=squeeze(xx.cvh_nonid_avg);    al.cvh_ndavg   =mean(a,2);
  a=squeeze(xx.lsh_nonid_avg);    al.lsh_ndavg   =mean(a,2);
  a=squeeze(xx.dcv_nonid_avg);    al.dcv_ndavg   =mean(a,2);
  a=squeeze(xx.dls_nonid_avg);    al.dls_ndavg   =mean(a,2);
  a=squeeze(xx.qlcond_nonid_avg); al.qlcond_ndavg=mean(a,2);
  a=squeeze(xx.qicond_nonid_avg); al.qicond_ndavg=mean(a,2);
end

return


a=squeeze(xx.frqday_org); a=mean(a,2); n=length(a); 
for i=1:n/2; b(i)=mean(a(2*i-1:2*i),1); end; al.frqday_org=b; 
a=squeeze(xx.frqday); a=mean(a,2);
for i=1:n/2; b(i)=mean(a(2*i-1:2*i),1); end; al.frqday=b; 

a=squeeze(xx.tas_idwei_ts_day_lat);   al.tas_idwei  =mean(a,1);
a=squeeze(xx.prday_idwei_ts_day_lat); al.prday_idwei=mean(a,1);
a=squeeze(xx.lwcf_idwei_ts_day_lat);  al.lwcf_idwei =mean(a,1);
a=squeeze(xx.swcf_idwei_ts_day_lat);  al.swcf_idwei =mean(a,1);
a=squeeze(xx.ttcf_idwei_ts_day_lat);  al.ttcf_idwei =mean(a,1);

if (opt==1)
  a=squeeze(xx.prc_idwei_ts_day_lat);    al.prc_idwei   =mean(a,1);
  a=squeeze(xx.prl_idwei_ts_day_lat);    al.prl_idwei   =mean(a,1);
  a=squeeze(xx.cvh_idwei_ts_day_lat);    al.cvh_idwei   =mean(a,1);
  a=squeeze(xx.lsh_idwei_ts_day_lat);    al.lsh_idwei   =mean(a,1);
  a=squeeze(xx.dcv_idwei_ts_day_lat);    al.dcv_idwei   =mean(a,1);
  a=squeeze(xx.dls_idwei_ts_day_lat);    al.dls_idwei   =mean(a,1);
  a=squeeze(xx.qlcond_idwei_ts_day_lat); al.qlcond_idwei=mean(a,1);
  a=squeeze(xx.qicond_idwei_ts_day_lat); al.qicond_idwei=mean(a,1);
  al.pe_ls = al.prl_idwei ./ al.lsh_idwei;
  al.pe_cv = al.prc_idwei ./ al.cvh_idwei;
end
