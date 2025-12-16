function [d]=getdiff(c,w)
%compute difference between two arbitrary experiments
%and save it in structure d
d.ts.sst      =w.sfc.sst.ts.org_ann       -mean(c.sfc.sst.ts.org_ann);
d.ts.tref     =w.sfc.tref.ts.org_ann      -mean(c.sfc.tref.ts.org_ann);
d.ts.netrad   =w.toa.netrad.ts.org_ann    -mean(c.toa.netrad.ts.org_ann);
d.ts.netradclr=w.toa.netrad_clr.ts.org_ann-mean(c.toa.netrad_clr.ts.org_ann);
d.ts.ttcf     =w.toa.ttcf.ts.org_ann      -mean(c.toa.ttcf.ts.org_ann);
d.ts.lwcf     =w.toa.lwcf.ts.org_ann      -mean(c.toa.lwcf.ts.org_ann);
d.ts.swcf     =w.toa.swcf.ts.org_ann      -mean(c.toa.swcf.ts.org_ann);

d.sst0      =mean(d.ts.sst);
d.tref0     =mean(d.ts.tref); a=1/d.tref0; a=1;
d.netrad0   =mean(d.ts.netrad)*a;
d.netradclr0=mean(d.ts.netradclr)*a;
d.ttcf0     =mean(d.ts.ttcf)*a;
d.lwcf0     =mean(d.ts.lwcf)*a;
d.swcf0     =mean(d.ts.swcf)*a;

nt=length(w.sfc.tsurf.ann(:,1,1))
a=c.sfc.tsurf.tavg0;     a=repmat(a,[1 1 nt]);a=permute(a,[3,1,2]);d.mp.tsurf=w.sfc.tsurf.ann-a;
a=c.sfc.tref.tavg0;      a=repmat(a,[1 1 nt]);a=permute(a,[3,1,2]);d.mp.tref=w.sfc.tref.ann-a;
a=c.toa.netrad.tavg0;    a=repmat(a,[1 1 nt]);a=permute(a,[3,1,2]);d.mp.netrad=w.toa.netrad.ann-a;
a=c.toa.netrad_clr.tavg0;a=repmat(a,[1 1 nt]);a=permute(a,[3,1,2]);d.mp.netradclr=w.toa.netrad_clr.ann-a;
a=c.toa.ttcf.tavg0;      a=repmat(a,[1 1 nt]);a=permute(a,[3,1,2]);d.mp.ttcf=w.toa.ttcf.ann-a;
a=c.toa.lwcf.tavg0;      a=repmat(a,[1 1 nt]);a=permute(a,[3,1,2]);d.mp.lwcf=w.toa.lwcf.ann-a;
a=c.toa.swcf.tavg0;      a=repmat(a,[1 1 nt]);a=permute(a,[3,1,2]);d.mp.swcf=w.toa.swcf.ann-a;

return
