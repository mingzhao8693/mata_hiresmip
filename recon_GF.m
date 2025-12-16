function g=recon_GF(s,gf,c,w,t1,t2)
c=CM4.c0; w=CM4.w0; 
gf_r=s.gf.netrad; gf_t=s.gf.tas; gf_p=s.gf.pcp; 
t1=1; t2=150; nt=t2-t1+1;
a=c.sfc.tsurf.all(t1:t2,:,:,:); clm=squeeze(mean(a,1)); 
a=repmat(clm,[1 1 1 nt]); a=permute(a,[4,1,2,3]);
ssta=w.sfc.tsurf.all(t1:t2,:,:,:)-a;
d.rad_ts=w.toa.netrad.ts.org_ann-mean(c.toa.netrad.ts.org_ann);
d.tas_ts=w.sfc.tref.ts.org_ann  -mean(c.sfc.tref.ts.org_ann);
d.pcp_ts=w.sfc.pcp.ts.org_ann   -mean(c.sfc.pcp.ts.org_ann);

lat=s.lat; lon=s.lon; aa=s.aa; lm=s.lm0;
im=w.sfc.ice.clm; im(im>=0.5)=1; im(im<0.5)=0;
for m=1:12
  I=squeeze(im(m,:,:)); m
  g.r=squeeze(gf_r(m,:,:)); g.r=g.r';
  g.t=squeeze(gf_t(m,:,:)); g.t=g.t';
  g.p=squeeze(gf_p(m,:,:)); g.p=g.p';
  for t=1:nt;
    a=squeeze(ssta(t,m,:,:));
    id=(lm>0.5)|I; a(id)=0;
    a=reshape(a',90*144,1);
    y=g.r*a; y=reshape(y,144,90); y=y'; g.rad(t,m)=mean(mean(y.*aa));
    y=g.t*a; y=reshape(y,144,90); y=y'; g.tas(t,m)=mean(mean(y.*aa));
    y=g.p*a; y=reshape(y,144,90); y=y'; g.pcp(t,m)=mean(mean(y.*aa));
  end
end
g.rad_ts=squeeze(mean(g.rad,2));
g.tas_ts=squeeze(mean(g.tas,2));
g.pcp_ts=squeeze(mean(g.pcp,2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot time series
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 500]*1; fsize=9.5; lw=1; s0='(%4.2f)';
handle = figure('Position', pms,'visible','on'); row=1; col=1;
x=[t1:t2]-1; 
plot(x,g.netrad_ts+8,'r'); hold on; 
plot(x,d.netrad_ts,'k');
axis([1 150 -6 6]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 500]*1; fsize=9.5; lw=1; s0='(%4.2f)';
handle = figure('Position', pms,'visible','on'); row=1; col=1;
x=[t1:t2]-1; 
plot(x,g.tas_ts,'r'); hold on; 
plot(x,d.tas_ts,'k'); %axis([1 150 -6 6]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 500]*1; fsize=9.5; lw=1; s0='(%4.2f)';
handle = figure('Position', pms,'visible','on'); row=1; col=1;
x=[t1:t2]-1; 
plot(x,g.pcp_ts*86400,'r'); hold on; 
plot(x,d.pcp_ts,'k'); %axis([1 150 -6 6]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
