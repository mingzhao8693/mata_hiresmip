function [g]=compute_gm(v1,opt)
aa=squeeze(v1.ar.aa); xx=v1.ar;
a =squeeze(xx.tas_av);      g.av.tas   =mean(mean(a.*aa));
a =squeeze(xx.prday_av);    g.av.prday =mean(mean(a.*aa));
a =squeeze(xx.lwcf_av);     g.av.lwcf  =mean(mean(a.*aa));
a =squeeze(xx.swcf_av);     g.av.swcf  =mean(mean(a.*aa));
a =squeeze(xx.ttcf_av);     g.av.ttcf  =mean(mean(a.*aa));

if (opt==1)
  a =squeeze(xx.prc_av);      g.av.prc    =mean(mean(a.*aa));
  a =squeeze(xx.prl_av);      g.av.prl    =mean(mean(a.*aa));
  a =squeeze(xx.cvh_av);      g.av.cvh    =mean(mean(a.*aa));
  a =squeeze(xx.lsh_av);      g.av.lsh    =mean(mean(a.*aa));
  a =squeeze(xx.dcv_av);      g.av.dcv    =mean(mean(a.*aa));
  a =squeeze(xx.dls_av);      g.av.dls    =mean(mean(a.*aa));
  a =squeeze(xx.pecv_av);     g.av.pecv   =mean(mean(a.*aa));
  a =squeeze(xx.pels_av);     g.av.pels   =mean(mean(a.*aa));
  a =squeeze(xx.pett_av);     g.av.pett   =mean(mean(a.*aa));
  a =squeeze(xx.qlcond_av);   g.av.qlcond =mean(mean(a.*aa));
  a =squeeze(xx.qicond_av);   g.av.qicond =mean(mean(a.*aa));
  g.av.pe_ls = g.av.prl/g.av.lsh;
  g.av.pe_cv = g.av.prc/g.av.cvh;
end

xx=v1.al; g.al=compute_gm0(xx,aa,opt);
xx=v1.ar; g.ar=compute_gm0(xx,aa,opt);
xx=v1.tc; g.tc=compute_gm0(xx,aa,opt);
xx=v1.tc; g.td=compute_gm0(xx,aa,opt);
xx=v1.mc; g.mc=compute_gm0(xx,aa,opt);

return
