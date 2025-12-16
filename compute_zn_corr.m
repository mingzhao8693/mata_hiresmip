function [r]=compute_zn_corr(v1,opt)
xx=v1.al; opt=1;
a=squeeze(xx.prday_av_ts_day_lat); b=squeeze(xx.prday_idwei_ts_day_lat);
r.al.prday=compute_zn_corr0(a,b,opt);

a=squeeze(xx.lwcf_av_ts_day_lat); b=squeeze(xx.lwcf_idwei_ts_day_lat);
r.al.lwcf=compute_zn_corr0(a,b,opt);

a=squeeze(xx.swcf_av_ts_day_lat); b=squeeze(xx.swcf_idwei_ts_day_lat);
r.al.swcf=compute_zn_corr0(a,b,opt);

a=squeeze(xx.ttcf_av_ts_day_lat); b=squeeze(xx.ttcf_idwei_ts_day_lat);
r.al.ttcf=compute_zn_corr0(a,b,opt);

if (opt==1)
  a =squeeze(xx.prc_av_ts_day_lat);      g.av.prc    =mean(a,1);
  a =squeeze(xx.prl_av_ts_day_lat);      g.av.prl    =mean(a,1);
  a =squeeze(xx.cvh_av_ts_day_lat);      g.av.cvh    =mean(a,1);
  a =squeeze(xx.lsh_av_ts_day_lat);      g.av.lsh    =mean(a,1);
  a =squeeze(xx.dcv_av_ts_day_lat);      g.av.dcv    =mean(a,1);
  a =squeeze(xx.dls_av_ts_day_lat);      g.av.dls    =mean(a,1);
  a =squeeze(xx.pecv_av_ts_day_lat);     g.av.pecv   =mean(a,1);
  a =squeeze(xx.pels_av_ts_day_lat);     g.av.pels   =mean(a,1);
  a =squeeze(xx.pett_av_ts_day_lat);     g.av.pett   =mean(a,1);
  a =squeeze(xx.qlcond_av_ts_day_lat);   g.av.qlcond =mean(a,1);
  a =squeeze(xx.qicond_av_ts_day_lat);   g.av.qicond =mean(a,1);
  g.av.pe_ls = g.av.prl ./ g.av.lsh;
  g.av.pe_cv = g.av.prc ./ g.av.cvh;
end
