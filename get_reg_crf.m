function [lwcf swcf ttcf]=get_reg_crf(v0,w0,g0,a0,c0,x0,opt)
lwcf.pdf_up=[v0.lwcf_clm.pdf_up w0.lwcf_clm.pdf_up g0.lwcf_clm.pdf_up ...
	     a0.lwcf_clm.pdf_up c0.lwcf_clm.pdf_up x0.lwcf_clm.pdf_up];
lwcf.pdf_ne=[v0.lwcf_clm.pdf_ne w0.lwcf_clm.pdf_ne g0.lwcf_clm.pdf_ne ...
	     a0.lwcf_clm.pdf_ne c0.lwcf_clm.pdf_ne x0.lwcf_clm.pdf_ne];
lwcf.pdf_dn=[v0.lwcf_clm.pdf_dn w0.lwcf_clm.pdf_dn g0.lwcf_clm.pdf_dn ...
	     a0.lwcf_clm.pdf_dn c0.lwcf_clm.pdf_dn x0.lwcf_clm.pdf_dn];
swcf.pdf_up=[v0.swcf_clm.pdf_up w0.swcf_clm.pdf_up g0.swcf_clm.pdf_up ...
	     a0.swcf_clm.pdf_up c0.swcf_clm.pdf_up x0.swcf_clm.pdf_up];
swcf.pdf_ne=[v0.swcf_clm.pdf_ne w0.swcf_clm.pdf_ne g0.swcf_clm.pdf_ne ...
	     a0.swcf_clm.pdf_ne c0.swcf_clm.pdf_ne x0.swcf_clm.pdf_ne];
swcf.pdf_dn=[v0.swcf_clm.pdf_dn w0.swcf_clm.pdf_dn g0.swcf_clm.pdf_dn ...
	     a0.swcf_clm.pdf_dn c0.swcf_clm.pdf_dn x0.swcf_clm.pdf_dn];
ttcf.pdf_up=[v0.ttcf_clm.pdf_up w0.ttcf_clm.pdf_up g0.ttcf_clm.pdf_up ...
	     a0.ttcf_clm.pdf_up c0.ttcf_clm.pdf_up x0.ttcf_clm.pdf_up];
ttcf.pdf_ne=[v0.ttcf_clm.pdf_ne w0.ttcf_clm.pdf_ne g0.ttcf_clm.pdf_ne ...
	     a0.ttcf_clm.pdf_ne c0.ttcf_clm.pdf_ne x0.ttcf_clm.pdf_ne];
ttcf.pdf_dn=[v0.ttcf_clm.pdf_dn w0.ttcf_clm.pdf_dn g0.ttcf_clm.pdf_dn ...
	     a0.ttcf_clm.pdf_dn c0.ttcf_clm.pdf_dn x0.ttcf_clm.pdf_dn];
if strcmp(opt,'all')
  lwcf.v=mean(v0.lwcf_clm.avg_all);
  lwcf.w=mean(w0.lwcf_clm.avg_all);
  lwcf.g=mean(g0.lwcf_clm.avg_all);
  lwcf.a=mean(a0.lwcf_clm.avg_all);
  lwcf.c=mean(c0.lwcf_clm.avg_all);
  lwcf.x=mean(x0.lwcf_clm.avg_all);
  swcf.v=mean(v0.swcf_clm.avg_all);
  swcf.w=mean(w0.swcf_clm.avg_all);
  swcf.g=mean(g0.swcf_clm.avg_all);
  swcf.a=mean(a0.swcf_clm.avg_all);
  swcf.c=mean(c0.swcf_clm.avg_all);
  swcf.x=mean(x0.swcf_clm.avg_all);
  ttcf.v=mean(v0.ttcf_clm.avg_all);
  ttcf.w=mean(w0.ttcf_clm.avg_all);
  ttcf.g=mean(g0.ttcf_clm.avg_all);
  ttcf.a=mean(a0.ttcf_clm.avg_all);
  ttcf.c=mean(c0.ttcf_clm.avg_all);
  ttcf.x=mean(x0.ttcf_clm.avg_all);
elseif strcmp(opt,'ne')
  lwcf.v=mean(v0.lwcf_clm.avg_ne);
  lwcf.w=mean(w0.lwcf_clm.avg_ne);
  lwcf.g=mean(g0.lwcf_clm.avg_ne);
  lwcf.a=mean(a0.lwcf_clm.avg_ne);
  lwcf.c=mean(c0.lwcf_clm.avg_ne);
  lwcf.x=mean(x0.lwcf_clm.avg_ne);
  swcf.v=mean(v0.swcf_clm.avg_ne);
  swcf.w=mean(w0.swcf_clm.avg_ne);
  swcf.g=mean(g0.swcf_clm.avg_ne);
  swcf.a=mean(a0.swcf_clm.avg_ne);
  swcf.c=mean(c0.swcf_clm.avg_ne);
  swcf.x=mean(x0.swcf_clm.avg_ne);
  ttcf.v=mean(v0.ttcf_clm.avg_ne);
  ttcf.w=mean(w0.ttcf_clm.avg_ne);
  ttcf.g=mean(g0.ttcf_clm.avg_ne);
  ttcf.a=mean(a0.ttcf_clm.avg_ne);
  ttcf.c=mean(c0.ttcf_clm.avg_ne);
  ttcf.x=mean(x0.ttcf_clm.avg_ne);
 elseif strcmp(opt,'dn')
  lwcf.v=mean(v0.lwcf_clm.avg_dn);
  lwcf.w=mean(w0.lwcf_clm.avg_dn);
  lwcf.g=mean(g0.lwcf_clm.avg_dn);
  lwcf.a=mean(a0.lwcf_clm.avg_dn);
  lwcf.c=mean(c0.lwcf_clm.avg_dn);
  lwcf.x=mean(x0.lwcf_clm.avg_dn);
  swcf.v=mean(v0.swcf_clm.avg_dn);
  swcf.w=mean(w0.swcf_clm.avg_dn);
  swcf.g=mean(g0.swcf_clm.avg_dn);
  swcf.a=mean(a0.swcf_clm.avg_dn);
  swcf.c=mean(c0.swcf_clm.avg_dn);
  swcf.x=mean(x0.swcf_clm.avg_dn);
  ttcf.v=mean(v0.ttcf_clm.avg_dn);
  ttcf.w=mean(w0.ttcf_clm.avg_dn);
  ttcf.g=mean(g0.ttcf_clm.avg_dn);
  ttcf.a=mean(a0.ttcf_clm.avg_dn);
  ttcf.c=mean(c0.ttcf_clm.avg_dn);
  ttcf.x=mean(x0.ttcf_clm.avg_dn);
 elseif strcmp(opt,'up')
  lwcf.v=mean(v0.lwcf_clm.avg_up);
  lwcf.w=mean(w0.lwcf_clm.avg_up);
  lwcf.g=mean(g0.lwcf_clm.avg_up);
  lwcf.a=mean(a0.lwcf_clm.avg_up);
  lwcf.c=mean(c0.lwcf_clm.avg_up);
  lwcf.x=mean(x0.lwcf_clm.avg_up);
  swcf.v=mean(v0.swcf_clm.avg_up);
  swcf.w=mean(w0.swcf_clm.avg_up);
  swcf.g=mean(g0.swcf_clm.avg_up);
  swcf.a=mean(a0.swcf_clm.avg_up);
  swcf.c=mean(c0.swcf_clm.avg_up);
  swcf.x=mean(x0.swcf_clm.avg_up);
  ttcf.v=mean(v0.ttcf_clm.avg_up);
  ttcf.w=mean(w0.ttcf_clm.avg_up);
  ttcf.g=mean(g0.ttcf_clm.avg_up);
  ttcf.a=mean(a0.ttcf_clm.avg_up);
  ttcf.c=mean(c0.ttcf_clm.avg_up);
  ttcf.x=mean(x0.ttcf_clm.avg_up);
end
return
