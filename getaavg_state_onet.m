function x=getaavg_state_onet(v,v2d,id,opt);
wa  =v2d.wa  (id); ;%wa(isnan(wa))=0; 
rho =v2d.rho (id);
qc  =v2d.qc  (id);
qp  =v2d.qp  (id);
qt  =v2d.qt  (id);
qv  =v2d.qv  (id);
ql  =v2d.ql  (id);
qi  =v2d.qi  (id);
qr  =v2d.qr  (id);
qs  =v2d.qs  (id);
qg  =v2d.qg  (id);
rh  =v2d.rh  (id); %rh(isnan(rh))=0;
ta  =v2d.ta  (id);
hli =v2d.hli (id);
mse =v2d.mse (id);
dse =v2d.dse (id);
thv =v2d.thv (id);
buo =v2d.buo (id);
tap =v2d.tap(id);
mf  =v2d.mf  (id);
dthvdp =v2d.dthvdp (id);
tdt_rd =v2d.tdt_rd (id);

nid=sum(sum(sum(id))); 
if (opt==0)
  pctile=[0  25 50 75 95];
else
  pctile=[100 75 50 25 5];
end
n=length(pctile);

if (nid>0)
  for i=1:n
    wtmp=prctile(wa,pctile(i)); %wtmp: percentile value of w
    x.wptile(i)=wtmp; %ie: x precent of data have wa value below wtmp
    if (opt==0)
      idtmp=(wa>=wtmp); %i=n give the strongest updrafts
    else
      idtmp=(wa<=wtmp); %i=n give the strongest downdrafts
    end
    x.fa  (i) = sum(idtmp)/v.tngrid;
    x.wa  (i) = mean(wa(idtmp));
    x.rho (i) = mean(rho (idtmp));
    x.qc  (i) = mean(qc  (idtmp));
    x.qp  (i) = mean(qp  (idtmp));
    x.qt  (i) = mean(qt  (idtmp));
    x.qv  (i) = mean(qv  (idtmp));
    x.ql  (i) = mean(ql  (idtmp));
    x.qi  (i) = mean(qi  (idtmp));
    x.qr  (i) = mean(qr  (idtmp));
    x.qs  (i) = mean(qs  (idtmp));
    x.qg  (i) = mean(qg  (idtmp));
    x.rh  (i) = mean(rh  (idtmp));
    x.ta  (i) = mean(ta  (idtmp));
    x.hli (i) = mean(hli (idtmp));
    x.mse (i) = mean(mse (idtmp));
    x.dse (i) = mean(dse (idtmp));
    x.thv (i) = mean(thv (idtmp));
    x.buo (i) = mean(buo (idtmp));
    x.tap (i) = mean(tap(idtmp));
    x.mf  (i) = mean(mf  (idtmp));
    x.mff (i) = mean(mf  (idtmp)).*x.fa(i);
    x.dthvdp (i) = mean(dthvdp (idtmp));
    x.tdt_rd (i) = mean(tdt_rd (idtmp));
  end
else
    k=1;  x.wptile(k:n)=0;
    x.fa  (k:n) = 0;
    x.wa  (k:n) = 0;
    x.rho (k:n) = 0;
    x.qc  (k:n) = 0;
    x.qp  (k:n) = 0;
    x.qt  (k:n) = 0; 
    x.qv  (k:n) = 0;
    x.ql  (k:n) = 0;
    x.qi  (k:n) = 0;
    x.qr  (k:n) = 0;
    x.qs  (k:n) = 0;
    x.qg  (k:n) = 0;
    x.rh  (k:n) = 0;
    x.ta  (k:n) = 0;
    x.hli (k:n) = 0;
    x.mse (k:n) = 0;
    x.dse (k:n) = 0;
    x.thv (k:n) = 0;
    x.buo (k:n) = 0;
    x.tap (k:n) = 0;
    x.mf  (k:n) = 0;
    x.mff (k:n) = 0;
    x.dthvdp (k:n) = 0;
    x.tdt_rd (k:n) = 0;
end

return
