function [g]=compute_zm(v1,opt)
aa=squeeze(v1.ar.aa); xx=v1.ar;
a =squeeze(xx.tas_av);      g.av.tas   =mean(a,2);
a =squeeze(xx.prday_av);    g.av.prday =mean(a,2);
a =squeeze(xx.lwcf_av);     g.av.lwcf  =mean(a,2);
a =squeeze(xx.swcf_av);     g.av.swcf  =mean(a,2);
a =squeeze(xx.ttcf_av);     g.av.ttcf  =mean(a,2);

if (opt==1)
  a =squeeze(xx.prc_av);      g.av.prc    =mean(a,2);
  a =squeeze(xx.prl_av);      g.av.prl    =mean(a,2);
  a =squeeze(xx.cvh_av);      g.av.cvh    =mean(a,2);
  a =squeeze(xx.lsh_av);      g.av.lsh    =mean(a,2);
  a =squeeze(xx.dcv_av);      g.av.dcv    =mean(a,2);
  a =squeeze(xx.dls_av);      g.av.dls    =mean(a,2);
  a =squeeze(xx.pecv_av);     g.av.pecv   =mean(a,2);
  a =squeeze(xx.pels_av);     g.av.pels   =mean(a,2);
  a =squeeze(xx.pett_av);     g.av.pett   =mean(a,2);
  a =squeeze(xx.qlcond_av);   g.av.qlcond =mean(a,2);
  a =squeeze(xx.qicond_av);   g.av.qicond =mean(a,2);
  g.av.pe_ls = g.av.prl/g.av.lsh;
  g.av.pe_cv = g.av.prc/g.av.cvh;
end

xx=v1.al; g.al=compute_zm0(xx,aa,opt);
xx=v1.ar; g.ar=compute_zm0(xx,aa,opt);
xx=v1.tc; g.tc=compute_zm0(xx,aa,opt);
xx=v1.tc; g.td=compute_zm0(xx,aa,opt);
xx=v1.mc; g.mc=compute_gm0(xx,aa,opt);

return


aa=squeeze(v1.ar.aa); xx=v1.ar;
a =squeeze(xx.tas_av_ts_day_lat);      g.av.tas   =mean(a,1);
a =squeeze(xx.prday_av_ts_day_lat);    g.av.prday =mean(a,1);
a =squeeze(xx.lwcf_av_ts_day_lat);     g.av.lwcf  =mean(a,1);
a =squeeze(xx.swcf_av_ts_day_lat);     g.av.swcf  =mean(a,1);
a =squeeze(xx.ttcf_av_ts_day_lat);     g.av.ttcf  =mean(a,1);

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
