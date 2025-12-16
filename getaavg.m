function x=getaavg(v,v2d,id,opt);

wa  =v2d.wa  (id); ;%wa(isnan(wa))=0; 
mf  =v2d.mf  (id);
rho =v2d.rho (id);
ta  =v2d.ta  (id);
qv  =v2d.qv  (id);
rh  =v2d.rh  (id); %rh(isnan(rh))=0;
ql  =v2d.ql  (id);
qi  =v2d.qi  (id);
qc  =v2d.qc  (id);
qr  =v2d.qr  (id);
qs  =v2d.qs  (id);
qg  =v2d.qg  (id);
qt  =v2d.qt  (id);
hl  =v2d.hl  (id);
mse =v2d.mse (id);
wqc =v2d.wqc (id);
wqt =v2d.wqt (id);
whl =v2d.whl (id);
wmse=v2d.wmse(id);
rflx=v2d.rflx(id);
sflx=v2d.sflx(id);
qtflx_dyn=v2d.qtflx_dyn(id);
qtflx_lin=v2d.qtflx_lin(id);
qtflx_dif=v2d.qtflx_dif(id);
qtdt_dyn =v2d.qtdt_dyn (id);
qtdt_lin =v2d.qtdt_lin (id);
qtdt_dif =v2d.qtdt_dif (id);
qcdt_dyn =v2d.qcdt_dyn (id);
qcdt_lin =v2d.qcdt_lin (id);
qcdt_dif =v2d.qcdt_dif (id);
mf_hdiv  =v2d.mf_hdiv  (id);
mf_vdiv  =v2d.mf_vdiv  (id);

nid=sum(sum(id));
if (opt==0)
  pctile=[0  25 50 75];
else
  pctile=[100 75 50 25];
end
n=length(pctile);

if (nid>0)
  for i=1:n
    wtmp=prctile(wa,pctile(i));  x.wptile(i)=wtmp;
    if (opt==0)
      idtmp=(wa>=wtmp);
    else
      idtmp=(wa<=wtmp);
    end
    x.fa  (i) = sum(idtmp)/v.ngrid;
    x.wa  (i) = mean(wa(idtmp));
    x.mf  (i) = mean(mf(idtmp))*x.fa(i);
    x.w   (i) = mean(mf(idtmp)./rho(idtmp));
    x.rho (i) = mean(rho (idtmp));
    x.ta  (i) = mean(ta  (idtmp));
    x.qv  (i) = mean(qv  (idtmp));
    x.rh  (i) = mean(rh  (idtmp));
    x.ql  (i) = mean(ql  (idtmp));
    x.qi  (i) = mean(qi  (idtmp));
    x.qc  (i) = mean(qc  (idtmp));
    x.qr  (i) = mean(qr  (idtmp));
    x.qs  (i) = mean(qs  (idtmp));
    x.qg  (i) = mean(qg  (idtmp));
    x.qt  (i) = mean(qt  (idtmp));
    x.hl  (i) = mean(hl  (idtmp));
    x.mse (i) = mean(mse (idtmp));
    x.wqc (i) = mean(wqc (idtmp))*x.fa(i);
    x.wqt (i) = mean(wqt (idtmp))*x.fa(i);
    x.whl (i) = mean(whl (idtmp))*x.fa(i);
    x.wmse(i) = mean(wmse(idtmp))*x.fa(i);
    x.rflx(i) = mean(rflx(idtmp))*x.fa(i);
    x.sflx(i) = mean(sflx(idtmp))*x.fa(i);
    x.qtflx_dyn(i) = mean(qtflx_dyn(idtmp))*x.fa(i);
    x.qtflx_lin(i) = mean(qtflx_lin(idtmp))*x.fa(i);
    x.qtflx_dif(i) = mean(qtflx_dif(idtmp))*x.fa(i);
    x.qtdt_dyn (i) = mean(qtdt_dyn (idtmp))*x.fa(i);
    x.qtdt_lin (i) = mean(qtdt_lin (idtmp))*x.fa(i);
    x.qtdt_dif (i) = mean(qtdt_dif (idtmp))*x.fa(i);
    x.qcdt_dyn (i) = mean(qcdt_dyn (idtmp))*x.fa(i);
    x.qcdt_lin (i) = mean(qcdt_lin (idtmp))*x.fa(i);
    x.qcdt_dif (i) = mean(qcdt_dif (idtmp))*x.fa(i);
    x.mf_hdiv  (i) = mean(mf_hdiv  (idtmp))*x.fa(i);
    x.mf_vdiv  (i) = mean(mf_vdiv  (idtmp))*x.fa(i);
  end
else
    k=1;  x.wptile(k:n)=0;
    x.fa  (k:n) = 0;
    x.wa  (k:n) = 0;
    x.mf  (k:n) = 0;
    x.w   (k:n) = 0;
    x.rho (k:n) = 0;
    x.ta  (k:n) = 0;
    x.qv  (2:n) = 0; 
    x.rh  (k:n) = 0;
    x.ql  (k:n) = 0;
    x.qi  (k:n) = 0;
    x.qc  (k:n) = 0;
    x.qr  (k:n) = 0;
    x.qs  (k:n) = 0;
    x.qg  (k:n) = 0;
    x.qt  (k:n) = 0;
    x.hl  (k:n) = 0;
    x.mse (k:n) = 0;
    x.wqc (k:n) = 0;
    x.wqt (k:n) = 0;
    x.whl (k:n) = 0;
    x.wmse(k:n) = 0;
    x.rflx(k:n) = 0;
    x.sflx(k:n) = 0;
    x.qtflx_dyn(k:n) = 0;
    x.qtflx_lin(k:n) = 0;
    x.qtflx_dif(k:n) = 0;
    x.qtdt_dyn (k:n) = 0;
    x.qtdt_lin (k:n) = 0;
    x.qtdt_dif (k:n) = 0;
    x.qcdt_dyn (k:n) = 0;
    x.qcdt_lin (k:n) = 0;
    x.qcdt_dif (k:n) = 0;
    x.mf_hdiv  (k:n) = 0;
    x.mf_vdiv  (k:n) = 0;
end

return
