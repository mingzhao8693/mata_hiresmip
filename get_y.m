function b=get_y(ca,cb,cc,cd,c1,c2,c3,c4,c5,...
		 va,vb,vc,vd,v1,v2,v3,v4,v5,...
		 wa,wb,wc,wd,w1,w2,w3,w4,w5,k1,k2,opt)

if strcmp(opt,'temp')
  b.ca=ca.ta.avg(k1:k2); b.va=va.ta.avg(k1:k2); b.wa=wa.ta.avg(k1:k2); 
  b.cb=cb.ta.avg(k1:k2); b.vb=vb.ta.avg(k1:k2); b.wb=wb.ta.avg(k1:k2); 
  b.cc=cc.ta.avg(k1:k2); b.vc=vc.ta.avg(k1:k2); b.wc=wc.ta.avg(k1:k2); 
  b.cd=cd.ta.avg(k1:k2); b.vd=vd.ta.avg(k1:k2); b.wd=wd.ta.avg(k1:k2); 
  b.c1=c1.ta.avg(k1:k2); b.v1=v1.ta.avg(k1:k2); b.w1=w1.ta.avg(k1:k2); 
  b.c2=c2.ta.avg(k1:k2); b.v2=v2.ta.avg(k1:k2); b.w2=w2.ta.avg(k1:k2); 
  b.c3=c3.ta.avg(k1:k2); b.v3=v3.ta.avg(k1:k2); b.w3=w3.ta.avg(k1:k2); 
  b.c4=c4.ta.avg(k1:k2); b.v4=v4.ta.avg(k1:k2); b.w4=w4.ta.avg(k1:k2); 
  b.c5=c5.ta.avg(k1:k2); b.v5=v5.ta.avg(k1:k2); b.w5=w5.ta.avg(k1:k2); 
else
  c=0.01;
  b.ca=ca.pf.avg(k1:k2)*c; b.va=va.pf.avg(k1:k2)*c; b.wa=wa.pf.avg(k1:k2)*c; 
  b.cb=cb.pf.avg(k1:k2)*c; b.vb=vb.pf.avg(k1:k2)*c; b.wb=wb.pf.avg(k1:k2)*c; 
  b.cc=cc.pf.avg(k1:k2)*c; b.vc=vc.pf.avg(k1:k2)*c; b.wc=wc.pf.avg(k1:k2)*c; 
  b.cd=cd.pf.avg(k1:k2)*c; b.vd=vd.pf.avg(k1:k2)*c; b.wd=wd.pf.avg(k1:k2)*c; 
  b.c1=c1.pf.avg(k1:k2)*c; b.v1=v1.pf.avg(k1:k2)*c; b.w1=w1.pf.avg(k1:k2)*c; 
  b.c2=c2.pf.avg(k1:k2)*c; b.v2=v2.pf.avg(k1:k2)*c; b.w2=w2.pf.avg(k1:k2)*c; 
  b.c3=c3.pf.avg(k1:k2)*c; b.v3=v3.pf.avg(k1:k2)*c; b.w3=w3.pf.avg(k1:k2)*c; 
  b.c4=c4.pf.avg(k1:k2)*c; b.v4=v4.pf.avg(k1:k2)*c; b.w4=w4.pf.avg(k1:k2)*c; 
  b.c5=c5.pf.avg(k1:k2)*c; b.v5=v5.pf.avg(k1:k2)*c; b.w5=w5.pf.avg(k1:k2)*c; 
end
