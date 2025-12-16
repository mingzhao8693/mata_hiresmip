function x=getaavg_flux(v,v2d,id,opt);
wa  =v2d.wa  (id); ;%wa(isnan(wa))=0; 
rho =v2d.rho (id);
qc  =v2d.qc  (id);
mf  =v2d.mf  (id);
wqv =v2d.wqv (id);
wqc =v2d.wqc (id);
wqt =v2d.wqt (id);
whli=v2d.whli(id);
wmse=v2d.wmse(id);
wdse=v2d.wdse(id);
mf_hdiv  =v2d.mf_hdiv  (id);
mf_vdiv  =v2d.mf_vdiv  (id);
rflx     =v2d.rflx(id);
sflx     =v2d.sflx(id);
qtflx_dyn=v2d.qtflx_dyn(id);
qtflx_lin=v2d.qtflx_lin(id);
qtflx_dif=v2d.qtflx_dif(id);

nid=sum(sum(sum(id)));
if (opt==0)
  pctile=[0  25 50 75 95];
else
  pctile=[100 75 50 25 5];
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
    x.rho (i) = mean(rho (idtmp));
    x.mf  (i) = mean(mf  (idtmp));
    x.wqv (i) = mean(wqv (idtmp));
    x.wqc (i) = mean(wqc (idtmp));
    x.wqt (i) = mean(wqt (idtmp));
    x.whli(i) = mean(whli(idtmp));
    x.wmse(i) = mean(wmse(idtmp));
    x.wdse(i) = mean(wdse(idtmp));
    x.mf_hdiv  (i) = mean(mf_hdiv  (idtmp));
    x.mf_vdiv  (i) = mean(mf_vdiv  (idtmp));
    x.rflx     (i) = mean(rflx(idtmp));
    x.sflx     (i) = mean(sflx(idtmp));
    x.qtflx_dyn(i) = mean(qtflx_dyn(idtmp));
    x.qtflx_lin(i) = mean(qtflx_lin(idtmp));
    x.qtflx_dif(i) = mean(qtflx_dif(idtmp));
  end
else
    k=1;  x.wptile(k:n)=0;
    x.fa  (k:n) = 0;
    x.wa  (k:n) = 0;
    x.rho (k:n) = 0;
    x.mf  (k:n) = 0;
    x.wqv (k:n) = 0;
    x.wqc (k:n) = 0;
    x.wqt (k:n) = 0;
    x.whli(k:n) = 0;
    x.wmse(k:n) = 0;
    x.wdse(k:n) = 0;
    x.mf_hdiv  (k:n) = 0;
    x.mf_vdiv  (k:n) = 0;
    x.rflx     (k:n) = 0;
    x.sflx     (k:n) = 0;
    x.qtflx_dyn(k:n) = 0;
    x.qtflx_lin(k:n) = 0;
    x.qtflx_dif(k:n) = 0;
end

return
