function p=get_gmean(z)
s=z.v0.s; p.lon=s.lon; p.lat=s.lat; p.lm=s.lm; aa=s.aa; p.aa=aa;
a0=z.v0.sfc.tref.tavg0;
a =z.g0.sfc.tref.tavg0-a0;  p.dtref1 =mean(mean(a.*aa));
a =z.g2.sfc.tref.tavg0-a0;  p.dtref2 =mean(mean(a.*aa));
a =z.g4.sfc.tref.tavg0-a0;  p.dtref3 =mean(mean(a.*aa));
a =z.u1.sfc.tref.tavg0-a0;  p.dtref4 =mean(mean(a.*aa));
a =z.u4.sfc.tref.tavg0-a0;  p.dtref5 =mean(mean(a.*aa));
a =z.gu.sfc.tref.tavg0-a0;  p.dtref6 =mean(mean(a.*aa));
a =z.p1.sfc.tref.tavg0-a0;  p.dtref7 =mean(mean(a.*aa));
a =z.p2.sfc.tref.tavg0-a0;  p.dtref8 =mean(mean(a.*aa));
%a =z.w1A.sfc.tref.tavg0-a0; p.dtref9 =mean(mean(a.*aa));
%a =z.w1B.sfc.tref.tavg0-a0; p.dtref10=mean(mean(a.*aa));

a0=z.v0.sfc.pcp.tavg0;
a =z.g0.sfc.pcp.tavg0-a0;  p.dpcp1 =mean(mean(a.*aa));
a =z.g2.sfc.pcp.tavg0-a0;  p.dpcp2 =mean(mean(a.*aa));
a =z.g4.sfc.pcp.tavg0-a0;  p.dpcp3 =mean(mean(a.*aa));
a =z.u1.sfc.pcp.tavg0-a0;  p.dpcp4 =mean(mean(a.*aa));
a =z.u4.sfc.pcp.tavg0-a0;  p.dpcp5 =mean(mean(a.*aa));
a =z.gu.sfc.pcp.tavg0-a0;  p.dpcp6 =mean(mean(a.*aa));
a =z.p1.sfc.pcp.tavg0-a0;  p.dpcp7 =mean(mean(a.*aa));
a =z.p2.sfc.pcp.tavg0-a0;  p.dpcp8 =mean(mean(a.*aa));
%a =z.w1A.sfc.pcp.tavg0-a0; p.dpcp9 =mean(mean(a.*aa));
%a =z.w1B.sfc.pcp.tavg0-a0; p.dpcp10=mean(mean(a.*aa));

a0=z.v0.toa.netrad.tavg0;
a =z.g0.toa.netrad.tavg0-a0;  p.dnetrad1 =mean(mean(a.*aa));
a =z.g2.toa.netrad.tavg0-a0;  p.dnetrad2 =mean(mean(a.*aa));
a =z.g4.toa.netrad.tavg0-a0;  p.dnetrad3 =mean(mean(a.*aa));
a =z.u1.toa.netrad.tavg0-a0;  p.dnetrad4 =mean(mean(a.*aa));
a =z.u4.toa.netrad.tavg0-a0;  p.dnetrad5 =mean(mean(a.*aa));
a =z.gu.toa.netrad.tavg0-a0;  p.dnetrad6 =mean(mean(a.*aa));
a =z.p1.toa.netrad.tavg0-a0;  p.dnetrad7 =mean(mean(a.*aa));
a =z.p2.toa.netrad.tavg0-a0;  p.dnetrad8 =mean(mean(a.*aa));


a0=z.v0.atm.lwnet.tavg0;
a =z.g0.atm.lwnet.tavg0-a0;  p.datm_lwnet1 =mean(mean(a.*aa));
a =z.g2.atm.lwnet.tavg0-a0;  p.datm_lwnet2 =mean(mean(a.*aa));
a =z.g4.atm.lwnet.tavg0-a0;  p.datm_lwnet3 =mean(mean(a.*aa));
a =z.u1.atm.lwnet.tavg0-a0;  p.datm_lwnet4 =mean(mean(a.*aa));
a =z.u4.atm.lwnet.tavg0-a0;  p.datm_lwnet5 =mean(mean(a.*aa));
a =z.gu.atm.lwnet.tavg0-a0;  p.datm_lwnet6 =mean(mean(a.*aa));
a =z.p1.atm.lwnet.tavg0-a0;  p.datm_lwnet7 =mean(mean(a.*aa));
a =z.p2.atm.lwnet.tavg0-a0;  p.datm_lwnet8 =mean(mean(a.*aa));

p.dco2_1=284/387; p.dco2_2=2; p.dco2_3=4;
x =[p.dco2_1   p.dco2_2   p.dco2_3];
y1=[p.dtref1   p.dtref2   p.dtref3];   %figure; plot(x,y,'s-');
y2=[p.dpcp1    p.dpcp2    p.dpcp3];    %figure; plot(x,y,'s-');
y3=[p.dnetrad1 p.dnetrad2 p.dnetrad3]; %figure; plot(x,y,'s-');
y3=[p.datm_lwnet1 p.datm_lwnet2 p.datm_lwnet3]; %figure; plot(x,y,'s-');
