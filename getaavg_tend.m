function x=getaavg_tend(v,v2d,id,opt);
wa  =v2d.wa  (id); ;%wa(isnan(wa))=0; 
rho =v2d.rho (id);
qc  =v2d.qc  (id);
qtdt_vadv=v2d.qtdt_vadv(id);
qtdt_hadv=v2d.qtdt_hadv(id);
qtdt_dyn =v2d.qtdt_dyn (id);
qtdt_lin =v2d.qtdt_lin (id);
qtdt_dif =v2d.qtdt_dif (id);
qvdt_dyn =v2d.qvdt_dyn (id);
qvdt_lin =v2d.qvdt_lin (id);
qvdt_dif =v2d.qvdt_dif (id);
qcdt_dyn =v2d.qcdt_dyn (id);
qcdt_lin =v2d.qcdt_lin (id);
qcdt_dif =v2d.qcdt_dif (id);
tdt_dyn  =v2d.tdt_dyn  (id);
tdt_lin  =v2d.tdt_lin  (id);
tdt_dif  =v2d.tdt_dif  (id);
tdt_rad  =v2d.tdt_rad  (id);
tdt_lw   =v2d.tdt_lw   (id);
tdt_sw   =v2d.tdt_sw   (id);

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
    x.qtdt_vadv(i) = mean(qtdt_vadv(idtmp));
    x.qtdt_hadv(i) = mean(qtdt_hadv(idtmp));
    x.qtdt_dyn (i) = mean(qtdt_dyn (idtmp));
    x.qtdt_lin (i) = mean(qtdt_lin (idtmp));
    x.qtdt_dif (i) = mean(qtdt_dif (idtmp));
    x.qvdt_dyn (i) = mean(qvdt_dyn (idtmp));
    x.qvdt_lin (i) = mean(qvdt_lin (idtmp));
    x.qvdt_dif (i) = mean(qvdt_dif (idtmp));
    x.qcdt_dyn (i) = mean(qcdt_dyn (idtmp));
    x.qcdt_lin (i) = mean(qcdt_lin (idtmp));
    x.qcdt_dif (i) = mean(qcdt_dif (idtmp));
    x.tdt_dyn  (i) = mean(tdt_dyn  (idtmp));
    x.tdt_lin  (i) = mean(tdt_lin  (idtmp));
    x.tdt_dif  (i) = mean(tdt_dif  (idtmp));
    x.tdt_rad  (i) = mean(tdt_rad  (idtmp));
    x.tdt_lw   (i) = mean(tdt_lw   (idtmp));
    x.tdt_sw   (i) = mean(tdt_sw   (idtmp));
  end
else
    k=1;  x.wptile(k:n)=0;
    x.fa  (k:n) = 0;
    x.wa  (k:n) = 0;
    x.rho (k:n) = 0;
    x.qtdt_vadv(k:n) = 0;
    x.qtdt_hadv(k:n) = 0;
    x.qtdt_dyn (k:n) = 0;
    x.qtdt_lin (k:n) = 0;
    x.qtdt_dif (k:n) = 0;
    x.qvdt_dyn (k:n) = 0;
    x.qvdt_lin (k:n) = 0;
    x.qvdt_dif (k:n) = 0;
    x.qcdt_dyn (k:n) = 0;
    x.qcdt_lin (k:n) = 0;
    x.qcdt_dif (k:n) = 0;
    x.tdt_dyn  (k:n) = 0;
    x.tdt_lin  (k:n) = 0;
    x.tdt_dif  (k:n) = 0;
    x.tdt_rad  (k:n) = 0;
    x.tdt_lw   (k:n) = 0;
    x.tdt_sw   (k:n) = 0;
end

return
