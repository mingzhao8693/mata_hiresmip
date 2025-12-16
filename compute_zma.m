function [g]=compute_zma(v1,opt)
aa=squeeze(v1.al.aa); xx=v1.al;
a =squeeze(xx.prday_fqwet); g.av.prday_fqwet=squeeze(mean(a.*aa,2));
a =squeeze(xx.prday_awwet); g.av.prday_awwet=squeeze(mean(a.*aa,2));

a =squeeze(xx.tas_av);      g.av.tas   =mean(a.*aa,2);
a =squeeze(xx.prday_av);    g.av.prday =mean(a.*aa,2);
a =squeeze(xx.lwcf_av);     g.av.lwcf  =mean(a.*aa,2);
a =squeeze(xx.swcf_av);     g.av.swcf  =mean(a.*aa,2);
a =squeeze(xx.ttcf_av);     g.av.ttcf  =mean(a.*aa,2);

if (opt==1)
  a =squeeze(xx.rlut_av);     g.av.rlut   =mean(a.*aa,2);
  a =squeeze(xx.swabs_av);    g.av.swabs  =mean(a.*aa,2);
  a =squeeze(xx.prw_av);      g.av.prw    =mean(a.*aa,2);
  a =squeeze(xx.clwvi_av);    g.av.clwvi  =mean(a.*aa,2);
  a =squeeze(xx.clivi_av);    g.av.clivi  =mean(a.*aa,2);
  a =squeeze(xx.clt_av);      g.av.clt    =mean(a.*aa,2);

  a =squeeze(xx.prc_av);      g.av.prc    =mean(a.*aa,2);
  a =squeeze(xx.prl_av);      g.av.prl    =mean(a.*aa,2);
  a =squeeze(xx.cvh_av);      g.av.cvh    =mean(a.*aa,2);
  a =squeeze(xx.lsh_av);      g.av.lsh    =mean(a.*aa,2);
  a =squeeze(xx.dcv_av);      g.av.dcv    =mean(a.*aa,2);
  a =squeeze(xx.dls_av);      g.av.dls    =mean(a.*aa,2);
%  a =squeeze(xx.pecv_av);     g.av.pecv   =mean(a.*aa,2);
%  a =squeeze(xx.pels_av);     g.av.pels   =mean(a.*aa,2);
%  a =squeeze(xx.pett_av);     g.av.pett   =mean(a.*aa,2);
  a =squeeze(xx.qlcond_av);   g.av.qlcond =mean(a.*aa,2);
  a =squeeze(xx.qicond_av);   g.av.qicond =mean(a.*aa,2);
  g.av.pe_ls = g.av.prl/g.av.lsh;
  g.av.pe_cv = g.av.prc/g.av.cvh;
end

xx=v1.al; g.al=compute_zma0(xx,aa,opt);
xx=v1.ar; g.ar=compute_zma0(xx,aa,opt);
xx=v1.tc; g.tc=compute_zma0(xx,aa,opt);
xx=v1.td; g.td=compute_zma0(xx,aa,opt);
xx=v1.mc; g.mc=compute_zma0(xx,aa,opt);
xx=v1.op; g.op=compute_zma0(xx,aa,opt);

return
