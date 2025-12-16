function [am]=compute_aero_rfp_lamip(am,opt)
if (strcmp(opt,'am3'))
  x1=am.c1.toa.netrad.ts.org_ann;
  x2=am.c2.toa.netrad.ts.org_ann;
  x3=am.c3.toa.netrad.ts.org_ann;
  x4=am.c4.toa.netrad.ts.org_ann;
  x5=am.c5.toa.netrad.ts.org_ann; am.c0.toa.netrad=(x1+x2+x3+x4+x5)/5;
  x1=am.a1.toa.netrad.ts.org_ann;
  x2=am.a2.toa.netrad.ts.org_ann;
  x3=am.a3.toa.netrad.ts.org_ann;
  x4=am.a4.toa.netrad.ts.org_ann;
  x5=am.a5.toa.netrad.ts.org_ann; am.a0.toa.netrad=(x1+x2+x3+x4+x5)/5;
  
  x1=am.c1.sfc.netrad.ts.org_ann;
  x2=am.c2.sfc.netrad.ts.org_ann;
  x3=am.c3.sfc.netrad.ts.org_ann;
  x4=am.c4.sfc.netrad.ts.org_ann;
  x5=am.c5.sfc.netrad.ts.org_ann; am.c0.sfc.netrad=(x1+x2+x3+x4+x5)/5;
  x1=am.a1.sfc.netrad.ts.org_ann;
  x2=am.a2.sfc.netrad.ts.org_ann;
  x3=am.a3.sfc.netrad.ts.org_ann;
  x4=am.a4.sfc.netrad.ts.org_ann;
  x5=am.a5.sfc.netrad.ts.org_ann; am.a0.sfc.netrad=(x1+x2+x3+x4+x5)/5;

  x1=am.c1.atm.netrad.ts.org_ann;
  x2=am.c2.atm.netrad.ts.org_ann;
  x3=am.c3.atm.netrad.ts.org_ann;
  x4=am.c4.atm.netrad.ts.org_ann;
  x5=am.c5.atm.netrad.ts.org_ann; am.c0.atm.netrad=(x1+x2+x3+x4+x5)/5;
  x1=am.a1.atm.netrad.ts.org_ann;
  x2=am.a2.atm.netrad.ts.org_ann;
  x3=am.a3.atm.netrad.ts.org_ann;
  x4=am.a4.atm.netrad.ts.org_ann;
  x5=am.a5.atm.netrad.ts.org_ann; am.a0.atm.netrad=(x1+x2+x3+x4+x5)/5;

  x1=am.c1.atm.swnet.ts.org_ann;
  x2=am.c2.atm.swnet.ts.org_ann;
  x3=am.c3.atm.swnet.ts.org_ann;
  x4=am.c4.atm.swnet.ts.org_ann;
  x5=am.c5.atm.swnet.ts.org_ann; am.c0.atm.swnet=(x1+x2+x3+x4+x5)/5;
  x1=am.a1.atm.swnet.ts.org_ann;
  x2=am.a2.atm.swnet.ts.org_ann;
  x3=am.a3.atm.swnet.ts.org_ann;
  x4=am.a4.atm.swnet.ts.org_ann;
  x5=am.a5.atm.swnet.ts.org_ann; am.a0.atm.swnet=(x1+x2+x3+x4+x5)/5;
  
  x1=am.c1.atm.aod.ts.org_ann;
  x2=am.c2.atm.aod.ts.org_ann;
  x3=am.c3.atm.aod.ts.org_ann;
  x4=am.c4.atm.aod.ts.org_ann;
  x5=am.c5.atm.aod.ts.org_ann; am.c0.atm.aod=(x1+x2+x3+x4+x5)/5;
  x1=am.a1.atm.aod.ts.org_ann;
  x2=am.a2.atm.aod.ts.org_ann;
  x3=am.a3.atm.aod.ts.org_ann;
  x4=am.a4.atm.aod.ts.org_ann;
  x5=am.a5.atm.aod.ts.org_ann; am.a0.atm.aod=(x1+x2+x3+x4+x5)/5;
elseif(strcmp(opt,'am4'))
  am.c0.toa.netrad=am.c1.toa.netrad.ts.org_ann;
  x1=am.a1.toa.netrad.ts.org_ann;
  x2=am.a2.toa.netrad.ts.org_ann; 
  x3=am.a3.toa.netrad.ts.org_ann; am.a0.toa.netrad=(x1+x2+x3)/3;

  am.c0.sfc.netrad=am.c1.sfc.netrad.ts.org_ann;
  x1=am.a1.sfc.netrad.ts.org_ann;
  x2=am.a2.sfc.netrad.ts.org_ann; 
  x3=am.a3.sfc.netrad.ts.org_ann; am.a0.sfc.netrad=(x1+x2+x3)/3;

  am.c0.atm.netrad=am.c1.atm.netrad.ts.org_ann;
  x1=am.a1.atm.netrad.ts.org_ann;
  x2=am.a2.atm.netrad.ts.org_ann; 
  x3=am.a3.atm.netrad.ts.org_ann; am.a0.atm.netrad=(x1+x2+x3)/3;

  am.c0.atm.swnet=am.c1.atm.swnet.ts.org_ann;
  x1=am.a1.atm.swnet.ts.org_ann;
  x2=am.a2.atm.swnet.ts.org_ann; 
  x3=am.a2.atm.swnet.ts.org_ann; am.a0.atm.swnet=(x1+x2+x3)/3;

  am.c0.atm.aod=am.c1.atm.aod.ts.org_ann;
  x1=am.a1.atm.aod.ts.org_ann;
  x2=am.a2.atm.aod.ts.org_ann; 
  x3=am.a2.atm.aod.ts.org_ann; am.a0.atm.aod=(x1+x2+x3)/3;
elseif(strcmp(opt,'amx'))
  am.c0.toa.netrad=am.c1.toa.netrad.ts.org_ann;
  am.a0.toa.netrad=am.a1.toa.netrad.ts.org_ann; 

  am.c0.sfc.netrad=am.c1.sfc.netrad.ts.org_ann;
  am.a0.sfc.netrad=am.a1.sfc.netrad.ts.org_ann;

  am.c0.atm.netrad=am.c1.atm.netrad.ts.org_ann;
  am.a0.atm.netrad=am.a1.atm.netrad.ts.org_ann;

  am.c0.atm.swnet=am.c1.atm.swnet.ts.org_ann;
  am.a0.atm.swnet=am.a1.atm.swnet.ts.org_ann;

  am.c0.atm.aod=am.c1.atm.aod.ts.org_ann;
  am.a0.atm.aod=am.a1.atm.aod.ts.org_ann;
end

am.toa.rfp.aer=am.a0.toa.netrad-am.c0.toa.netrad;
am.sfc.rfp.aer=am.a0.sfc.netrad-am.c0.sfc.netrad;
am.atm.rfp.aer=am.a0.atm.netrad-am.c0.atm.netrad;
am.atm.aod.aer=am.a0.atm.aod   -am.c0.atm.aod;

return
