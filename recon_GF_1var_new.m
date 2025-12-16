function var_ts=recon_GF_1var_new(s,var,varp,c,w,t1,t2,im0,lm0,p_thresh,opt)
wei=s.wei; var=s.R; varp=s.p_R; p_thresh=0.05; opt=1;
%c=AM4.c1; w=AM4.w1; t1=1; t2=150; 
d.rad_ts=w.toa.netrad.ts.org_ann-mean(c.toa.netrad.ts.org_ann);
lat=s.lat; lon=s.lon; aa=s.aa; lm=s.lm0>lm0;
imk=w.sfc.ice.clm; imk(imk>=im0)=1; imk(imk<im0)=0;
if (opt==0)
  a=c.sfc.tsurf.all(t1:t2,:,:,:);
else
  a=c.sfc.tsurf.all(:,:,:,:);
end
sst_clm=squeeze(mean(a,1)); nt=t2-t1+1;
a=repmat(sst_clm,[1 1 1 nt]); a=permute(a,[4,1,2,3]);
ssta=w.sfc.tsurf.all(t1:t2,:,:,:)-a;

var=var .* (varp < p_thresh);
for m=1:12
  id=lm | squeeze(imk(m,:,:)); m
  A=squeeze(var(:,:,m)); %gfx(m,:,:)=wei*A';gf=squeeze(gf(m,:,:));gf=gf';
  for t=1:nt;
    a =squeeze(ssta(t,m,:,:)); a(id)=0; a=a';
    Tp=reshape(a,90*144,1); saveit(:,m)=(wei'*Tp);
    y=A*(wei'*Tp); %y=gf*Tp;
    y=reshape(y,144,90); y=y';
    varx(t,m)=mean(mean(y.*aa));
  end
end
var_ts=squeeze(mean(varx,2));
return

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
