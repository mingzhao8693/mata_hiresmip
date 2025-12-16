function [am]=compute_rfp_lamip(am,opt)
if (strcmp(opt,'am2'))
  x1=am.c1.toa.netrad.ann_stat.mmen.all;
  x2=am.c2.toa.netrad.ann_stat.mmen.all;
  x3=am.c3.toa.netrad.ann_stat.mmen.all; am.c0.toa.netrad=(x1+x2+x3)/3;
  x1=am.a1.toa.netrad.ann_stat.mmen.all;
  x2=am.a2.toa.netrad.ann_stat.mmen.all;
  x3=am.a3.toa.netrad.ann_stat.mmen.all; am.a0.toa.netrad=(x1+x2+x3)/3;
  x1=am.g1.toa.netrad.ann_stat.mmen.all;
  x2=am.g2.toa.netrad.ann_stat.mmen.all;
  x3=am.g3.toa.netrad.ann_stat.mmen.all; am.g0.toa.netrad=(x1+x2+x3)/3;
  x1=am.v1.toa.netrad.ann_stat.mmen.all;
  x2=am.v2.toa.netrad.ann_stat.mmen.all;
  x3=am.v3.toa.netrad.ann_stat.mmen.all; am.v0.toa.netrad=(x1+x2+x3)/3;

  x1=am.c1.sfc.netrad.ann_stat.mmen.all;
  x2=am.c2.sfc.netrad.ann_stat.mmen.all;
  x3=am.c3.sfc.netrad.ann_stat.mmen.all; am.c0.sfc.netrad=(x1+x2+x3)/3;
  x1=am.a1.sfc.netrad.ann_stat.mmen.all;
  x2=am.a2.sfc.netrad.ann_stat.mmen.all;
  x3=am.a3.sfc.netrad.ann_stat.mmen.all; am.a0.sfc.netrad=(x1+x2+x3)/3;
  x1=am.g1.sfc.netrad.ann_stat.mmen.all;
  x2=am.g2.sfc.netrad.ann_stat.mmen.all;
  x3=am.g3.sfc.netrad.ann_stat.mmen.all; am.g0.sfc.netrad=(x1+x2+x3)/3;
  x1=am.v1.sfc.netrad.ann_stat.mmen.all;
  x2=am.v2.sfc.netrad.ann_stat.mmen.all;
  x3=am.v3.sfc.netrad.ann_stat.mmen.all; am.v0.sfc.netrad=(x1+x2+x3)/3;

  x1=am.c1.atm.netrad.ann_stat.mmen.all;
  x2=am.c2.atm.netrad.ann_stat.mmen.all;
  x3=am.c3.atm.netrad.ann_stat.mmen.all; am.c0.atm.netrad=(x1+x2+x3)/3;
  x1=am.a1.atm.netrad.ann_stat.mmen.all;
  x2=am.a2.atm.netrad.ann_stat.mmen.all;
  x3=am.a3.atm.netrad.ann_stat.mmen.all; am.a0.atm.netrad=(x1+x2+x3)/3;
  x1=am.g1.atm.netrad.ann_stat.mmen.all;
  x2=am.g2.atm.netrad.ann_stat.mmen.all;
  x3=am.g3.atm.netrad.ann_stat.mmen.all; am.g0.atm.netrad=(x1+x2+x3)/3;
  x1=am.v1.atm.netrad.ann_stat.mmen.all;
  x2=am.v2.atm.netrad.ann_stat.mmen.all;
  x3=am.v3.atm.netrad.ann_stat.mmen.all; am.v0.atm.netrad=(x1+x2+x3)/3;

  x1=am.c1.atm.swnet.ann_stat.mmen.all;
  x2=am.c2.atm.swnet.ann_stat.mmen.all;
  x3=am.c3.atm.swnet.ann_stat.mmen.all; am.c0.atm.swnet=(x1+x2+x3)/3;
  x1=am.a1.atm.swnet.ann_stat.mmen.all;
  x2=am.a2.atm.swnet.ann_stat.mmen.all;
  x3=am.a3.atm.swnet.ann_stat.mmen.all; am.a0.atm.swnet=(x1+x2+x3)/3;
  x1=am.g1.atm.swnet.ann_stat.mmen.all;
  x2=am.g2.atm.swnet.ann_stat.mmen.all;
  x3=am.g3.atm.swnet.ann_stat.mmen.all; am.g0.atm.swnet=(x1+x2+x3)/3;
  x1=am.v1.atm.swnet.ann_stat.mmen.all;
  x2=am.v2.atm.swnet.ann_stat.mmen.all;
  x3=am.v3.atm.swnet.ann_stat.mmen.all; am.v0.atm.swnet=(x1+x2+x3)/3;

elseif (strcmp(opt,'am3'))
  x1=am.c1.toa.netrad.ann_stat.mmen.all;
  x2=am.c2.toa.netrad.ann_stat.mmen.all;
  x3=am.c3.toa.netrad.ann_stat.mmen.all;
  x4=am.c4.toa.netrad.ann_stat.mmen.all;
  x5=am.c5.toa.netrad.ann_stat.mmen.all; am.c0.toa.netrad=(x1+x2+x3+x4+x5)/5;
  x1=am.a1.toa.netrad.ann_stat.mmen.all;
  x2=am.a2.toa.netrad.ann_stat.mmen.all;
  x3=am.a3.toa.netrad.ann_stat.mmen.all;
  x4=am.a4.toa.netrad.ann_stat.mmen.all;
  x5=am.a5.toa.netrad.ann_stat.mmen.all; am.a0.toa.netrad=(x1+x2+x3+x4+x5)/5;
  x1=am.g1.toa.netrad.ann_stat.mmen.all;
  x2=am.g2.toa.netrad.ann_stat.mmen.all;
  x3=am.g3.toa.netrad.ann_stat.mmen.all;
  x4=am.g4.toa.netrad.ann_stat.mmen.all;
  x5=am.g5.toa.netrad.ann_stat.mmen.all; am.g0.toa.netrad=(x1+x2+x3+x4+x5)/5;
  x1=am.v1.toa.netrad.ann_stat.mmen.all;
  x2=am.v2.toa.netrad.ann_stat.mmen.all;
  x3=am.v3.toa.netrad.ann_stat.mmen.all;
  x4=am.v4.toa.netrad.ann_stat.mmen.all;
  x5=am.v5.toa.netrad.ann_stat.mmen.all; am.v0.toa.netrad=(x1+x2+x3+x4+x5)/5;

  x1=am.c1.sfc.netrad.ann_stat.mmen.all;
  x2=am.c2.sfc.netrad.ann_stat.mmen.all;
  x3=am.c3.sfc.netrad.ann_stat.mmen.all;
  x4=am.c4.sfc.netrad.ann_stat.mmen.all;
  x5=am.c5.sfc.netrad.ann_stat.mmen.all; am.c0.sfc.netrad=(x1+x2+x3+x4+x5)/5;
  x1=am.a1.sfc.netrad.ann_stat.mmen.all;
  x2=am.a2.sfc.netrad.ann_stat.mmen.all;
  x3=am.a3.sfc.netrad.ann_stat.mmen.all;
  x4=am.a4.sfc.netrad.ann_stat.mmen.all;
  x5=am.a5.sfc.netrad.ann_stat.mmen.all; am.a0.sfc.netrad=(x1+x2+x3+x4+x5)/5;
  x1=am.g1.sfc.netrad.ann_stat.mmen.all;
  x2=am.g2.sfc.netrad.ann_stat.mmen.all;
  x3=am.g3.sfc.netrad.ann_stat.mmen.all;
  x4=am.g4.sfc.netrad.ann_stat.mmen.all;
  x5=am.g5.sfc.netrad.ann_stat.mmen.all; am.g0.sfc.netrad=(x1+x2+x3+x4+x5)/5;
  x1=am.v1.sfc.netrad.ann_stat.mmen.all;
  x2=am.v2.sfc.netrad.ann_stat.mmen.all;
  x3=am.v3.sfc.netrad.ann_stat.mmen.all;
  x4=am.v4.sfc.netrad.ann_stat.mmen.all;
  x5=am.v5.sfc.netrad.ann_stat.mmen.all; am.v0.sfc.netrad=(x1+x2+x3+x4+x5)/5;

  x1=am.c1.atm.netrad.ann_stat.mmen.all;
  x2=am.c2.atm.netrad.ann_stat.mmen.all;
  x3=am.c3.atm.netrad.ann_stat.mmen.all;
  x4=am.c4.atm.netrad.ann_stat.mmen.all;
  x5=am.c5.atm.netrad.ann_stat.mmen.all; am.c0.atm.netrad=(x1+x2+x3+x4+x5)/5;
  x1=am.a1.atm.netrad.ann_stat.mmen.all;
  x2=am.a2.atm.netrad.ann_stat.mmen.all;
  x3=am.a3.atm.netrad.ann_stat.mmen.all;
  x4=am.a4.atm.netrad.ann_stat.mmen.all;
  x5=am.a5.atm.netrad.ann_stat.mmen.all; am.a0.atm.netrad=(x1+x2+x3+x4+x5)/5;
  x1=am.g1.atm.netrad.ann_stat.mmen.all;
  x2=am.g2.atm.netrad.ann_stat.mmen.all;
  x3=am.g3.atm.netrad.ann_stat.mmen.all;
  x4=am.g4.atm.netrad.ann_stat.mmen.all;
  x5=am.g5.atm.netrad.ann_stat.mmen.all; am.g0.atm.netrad=(x1+x2+x3+x4+x5)/5;
  x1=am.v1.atm.netrad.ann_stat.mmen.all;
  x2=am.v2.atm.netrad.ann_stat.mmen.all;
  x3=am.v3.atm.netrad.ann_stat.mmen.all;
  x4=am.v4.atm.netrad.ann_stat.mmen.all;
  x5=am.v5.atm.netrad.ann_stat.mmen.all; am.v0.atm.netrad=(x1+x2+x3+x4+x5)/5;

  x1=am.c1.atm.swnet.ann_stat.mmen.all;
  x2=am.c2.atm.swnet.ann_stat.mmen.all;
  x3=am.c3.atm.swnet.ann_stat.mmen.all;
  x4=am.c4.atm.swnet.ann_stat.mmen.all;
  x5=am.c5.atm.swnet.ann_stat.mmen.all; am.c0.atm.swnet=(x1+x2+x3+x4+x5)/5;
  x1=am.a1.atm.swnet.ann_stat.mmen.all;
  x2=am.a2.atm.swnet.ann_stat.mmen.all;
  x3=am.a3.atm.swnet.ann_stat.mmen.all;
  x4=am.a4.atm.swnet.ann_stat.mmen.all;
  x5=am.a5.atm.swnet.ann_stat.mmen.all; am.a0.atm.swnet=(x1+x2+x3+x4+x5)/5;
  x1=am.g1.atm.swnet.ann_stat.mmen.all;
  x2=am.g2.atm.swnet.ann_stat.mmen.all;
  x3=am.g3.atm.swnet.ann_stat.mmen.all;
  x4=am.g4.atm.swnet.ann_stat.mmen.all;
  x5=am.g5.atm.swnet.ann_stat.mmen.all; am.g0.atm.swnet=(x1+x2+x3+x4+x5)/5;
  x1=am.v1.atm.swnet.ann_stat.mmen.all;
  x2=am.v2.atm.swnet.ann_stat.mmen.all;
  x3=am.v3.atm.swnet.ann_stat.mmen.all;
  x4=am.v4.atm.swnet.ann_stat.mmen.all;
  x5=am.v5.atm.swnet.ann_stat.mmen.all; am.v0.atm.swnet=(x1+x2+x3+x4+x5)/5;
  
elseif(strcmp(opt,'am4'))
  am.c0.toa.netrad=am.c1.toa.netrad.ann_stat.mmen.all;
  x1=am.a1.toa.netrad.ann_stat.mmen.all;
  x2=am.a2.toa.netrad.ann_stat.mmen.all; 
  x3=am.a3.toa.netrad.ann_stat.mmen.all; am.a0.toa.netrad=(x1+x2+x3)/3;
  x1=am.g1.toa.netrad.ann_stat.mmen.all;
  x2=am.g2.toa.netrad.ann_stat.mmen.all; 
  x3=am.g3.toa.netrad.ann_stat.mmen.all; am.g0.toa.netrad=(x1+x2+x3)/3;
  am.v0.toa.netrad=am.v1.toa.netrad.ann_stat.mmen.all;

  am.c0.sfc.netrad=am.c1.sfc.netrad.ann_stat.mmen.all;
  x1=am.a1.sfc.netrad.ann_stat.mmen.all;
  x2=am.a2.sfc.netrad.ann_stat.mmen.all; 
  x3=am.a3.sfc.netrad.ann_stat.mmen.all; am.a0.sfc.netrad=(x1+x2+x3)/3;
  x1=am.g1.sfc.netrad.ann_stat.mmen.all;
  x2=am.g2.sfc.netrad.ann_stat.mmen.all; 
  x3=am.g3.sfc.netrad.ann_stat.mmen.all; am.g0.sfc.netrad=(x1+x2+x3)/3;
  am.v0.sfc.netrad=am.v1.sfc.netrad.ann_stat.mmen.all;

  am.c0.atm.netrad=am.c1.atm.netrad.ann_stat.mmen.all;
  x1=am.a1.atm.netrad.ann_stat.mmen.all;
  x2=am.a2.atm.netrad.ann_stat.mmen.all; 
  x3=am.a3.atm.netrad.ann_stat.mmen.all; am.a0.atm.netrad=(x1+x2+x3)/3;
  x1=am.g1.atm.netrad.ann_stat.mmen.all;
  x2=am.g2.atm.netrad.ann_stat.mmen.all; 
  x3=am.g3.atm.netrad.ann_stat.mmen.all; am.g0.atm.netrad=(x1+x2+x3)/3;
  am.v0.atm.netrad=am.v1.atm.netrad.ann_stat.mmen.all;

  am.c0.atm.swnet=am.c1.atm.swnet.ann_stat.mmen.all;
  x1=am.a1.atm.swnet.ann_stat.mmen.all;
  x2=am.a2.atm.swnet.ann_stat.mmen.all; 
  x3=am.a2.atm.swnet.ann_stat.mmen.all; am.a0.atm.swnet=(x1+x2+x3)/3;
  x1=am.g1.atm.swnet.ann_stat.mmen.all;
  x2=am.g2.atm.swnet.ann_stat.mmen.all; 
  x3=am.g2.atm.swnet.ann_stat.mmen.all; am.g0.atm.swnet=(x1+x2+x3)/3;
  am.v0.atm.swnet=am.v1.atm.swnet.ann_stat.mmen.all;

elseif(strcmp(opt,'amx'))
  am.c0.toa.netrad=am.c1.toa.netrad.ann_stat.mmen.all;
  am.a0.toa.netrad=am.a1.toa.netrad.ann_stat.mmen.all; 

  am.c0.sfc.netrad=am.c1.sfc.netrad.ann_stat.mmen.all;
  am.a0.sfc.netrad=am.a1.sfc.netrad.ann_stat.mmen.all;

  am.c0.atm.netrad=am.c1.atm.netrad.ann_stat.mmen.all;
  am.a0.atm.netrad=am.a1.atm.netrad.ann_stat.mmen.all;

  am.c0.atm.swnet=am.c1.atm.swnet.ann_stat.mmen.all;
  am.a0.atm.swnet=am.a1.atm.swnet.ann_stat.mmen.all;

end
  
am.toa.rfp.aer=am.a0.toa.netrad-am.c0.toa.netrad;
am.sfc.rfp.aer=am.a0.sfc.netrad-am.c0.sfc.netrad;
am.atm.rfp.aer=am.a0.atm.netrad-am.c0.atm.netrad;

am.toa.rfp.ghg=am.g0.toa.netrad-am.c0.toa.netrad;
am.sfc.rfp.ghg=am.g0.sfc.netrad-am.c0.sfc.netrad;
am.atm.rfp.ghg=am.g0.atm.netrad-am.c0.atm.netrad;

am.toa.rfp.tot=am.v0.toa.netrad-am.c0.toa.netrad;
am.sfc.rfp.tot=am.v0.sfc.netrad-am.c0.sfc.netrad;
am.atm.rfp.tot=am.v0.atm.netrad-am.c0.atm.netrad;

return
