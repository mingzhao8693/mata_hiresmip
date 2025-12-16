function [am]=compute_aero_rfp_lamip1(am,opt)
if (strcmp(opt,'am3'))
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
  
  x1=am.c1.atm.aod.ann_stat.mmen.all;
  x2=am.c2.atm.aod.ann_stat.mmen.all;
  x3=am.c3.atm.aod.ann_stat.mmen.all;
  x4=am.c4.atm.aod.ann_stat.mmen.all;
  x5=am.c5.atm.aod.ann_stat.mmen.all; am.c0.atm.aod=(x1+x2+x3+x4+x5)/5;
  x1=am.a1.atm.aod.ann_stat.mmen.all;
  x2=am.a2.atm.aod.ann_stat.mmen.all;
  x3=am.a3.atm.aod.ann_stat.mmen.all;
  x4=am.a4.atm.aod.ann_stat.mmen.all;
  x5=am.a5.atm.aod.ann_stat.mmen.all; am.a0.atm.aod=(x1+x2+x3+x4+x5)/5;
elseif(strcmp(opt,'am4'))
  am.c0.toa.netrad=am.c1.toa.netrad.ann_stat.mmen.all;
  x1=am.a1.toa.netrad.ann_stat.mmen.all;
  x2=am.a2.toa.netrad.ann_stat.mmen.all; 
  x3=am.a3.toa.netrad.ann_stat.mmen.all; am.a0.toa.netrad=(x1+x2+x3)/3;

  am.c0.sfc.netrad=am.c1.sfc.netrad.ann_stat.mmen.all;
  x1=am.a1.sfc.netrad.ann_stat.mmen.all;
  x2=am.a2.sfc.netrad.ann_stat.mmen.all; 
  x3=am.a3.sfc.netrad.ann_stat.mmen.all; am.a0.sfc.netrad=(x1+x2+x3)/3;

  am.c0.atm.netrad=am.c1.atm.netrad.ann_stat.mmen.all;
  x1=am.a1.atm.netrad.ann_stat.mmen.all;
  x2=am.a2.atm.netrad.ann_stat.mmen.all; 
  x3=am.a3.atm.netrad.ann_stat.mmen.all; am.a0.atm.netrad=(x1+x2+x3)/3;

  am.c0.atm.swnet=am.c1.atm.swnet.ann_stat.mmen.all;
  x1=am.a1.atm.swnet.ann_stat.mmen.all;
  x2=am.a2.atm.swnet.ann_stat.mmen.all; 
  x3=am.a2.atm.swnet.ann_stat.mmen.all; am.a0.atm.swnet=(x1+x2+x3)/3;

  am.c0.atm.aod=am.c1.atm.aod.ann_stat.mmen.all;
  x1=am.a1.atm.aod.ann_stat.mmen.all;
  x2=am.a2.atm.aod.ann_stat.mmen.all; 
  x3=am.a2.atm.aod.ann_stat.mmen.all; am.a0.atm.aod=(x1+x2+x3)/3;
elseif(strcmp(opt,'amx'))
  am.c0.toa.netrad=am.c1.toa.netrad.ann_stat.mmen.all;
  am.a0.toa.netrad=am.a1.toa.netrad.ann_stat.mmen.all; 

  am.c0.sfc.netrad=am.c1.sfc.netrad.ann_stat.mmen.all;
  am.a0.sfc.netrad=am.a1.sfc.netrad.ann_stat.mmen.all;

  am.c0.atm.netrad=am.c1.atm.netrad.ann_stat.mmen.all;
  am.a0.atm.netrad=am.a1.atm.netrad.ann_stat.mmen.all;

  am.c0.atm.swnet=am.c1.atm.swnet.ann_stat.mmen.all;
  am.a0.atm.swnet=am.a1.atm.swnet.ann_stat.mmen.all;

  am.c0.atm.aod=am.c1.atm.aod.ann_stat.mmen.all;
  am.a0.atm.aod=am.a1.atm.aod.ann_stat.mmen.all;
end
  
am.toa.rfp.aer=am.a0.toa.netrad-am.c0.toa.netrad;
am.sfc.rfp.aer=am.a0.sfc.netrad-am.c0.sfc.netrad;
am.atm.rfp.aer=am.a0.atm.netrad-am.c0.atm.netrad;
am.atm.aod.aer=am.a0.atm.aod   -am.c0.atm.aod;

return
