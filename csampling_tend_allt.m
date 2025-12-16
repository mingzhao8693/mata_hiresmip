function o=csampling_tend_allt(v,wa,rho,qc, qtdt_vadv, qtdt_hadv,...
			       qtdt_dyn, qtdt_lin, qtdt_dif,...
                               qvdt_dyn, qvdt_lin, qvdt_dif,...
                               qldt_dyn, qldt_lin, qldt_dif,...
			       qidt_dyn, qidt_lin, qidt_dif,...
			       tdt_dyn,  tdt_lin,  tdt_dif, tdt_lw, tdt_sw)

[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
qcdt_dyn=qldt_dyn+qidt_dyn;
qcdt_lin=qldt_dyn+qidt_lin;
qcdt_dif=qldt_dyn+qidt_dif;

v.tngrid=v.nt*v.ngrid;
for k=1:v.nz
  k
  v2d.wa  =squeeze(wa  (:,k,:,:));
  v2d.rho =squeeze(rho (:,k,:,:)); 
  v2d.qc  =squeeze(qc  (:,k,:,:)); 
  v2d.qtdt_vadv=squeeze(qtdt_vadv(:,k,:,:));
  v2d.qtdt_hadv=squeeze(qtdt_hadv(:,k,:,:));
  
  v2d.qtdt_dyn =squeeze(qtdt_dyn (:,k,:,:));
  v2d.qtdt_lin =squeeze(qtdt_lin (:,k,:,:));
  v2d.qtdt_dif =squeeze(qtdt_dif (:,k,:,:));
  v2d.qvdt_dyn =squeeze(qvdt_dyn (:,k,:,:));
  v2d.qvdt_lin =squeeze(qvdt_lin (:,k,:,:));
  v2d.qvdt_dif =squeeze(qvdt_dif (:,k,:,:));
  
  v2d.qcdt_dyn =squeeze(qldt_dyn (:,k,:,:)+qidt_dyn (:,k,:,:));
  v2d.qcdt_lin =squeeze(qldt_lin (:,k,:,:)+qidt_lin (:,k,:,:));
  v2d.qcdt_dif =squeeze(qldt_dif (:,k,:,:)+qidt_dif (:,k,:,:));
  
  v2d.tdt_dyn  =squeeze(tdt_dyn  (:,k,:,:));
  v2d.tdt_lin  =squeeze(tdt_lin  (:,k,:,:));
  v2d.tdt_dif  =squeeze(tdt_dif  (:,k,:,:));
  v2d.tdt_rad  =squeeze(tdt_lw   (:,k,:,:)+tdt_sw   (:,k,:,:));
  v2d.tdt_lw   =squeeze(tdt_lw   (:,k,:,:));
  v2d.tdt_sw   =squeeze(tdt_sw   (:,k,:,:));

  id = ~isnan(v2d.wa);
  wa_avg=mean(v2d.wa(id)); a=v2d.wa(id)-wa_avg;
  wa_std=sqrt(mean(a.*a));
  wa_skw=(mean(a.*a.*a)).*(1/3)/wa_std;
  o.wa_avg(k)=wa_avg;
  o.wa_std(k)=wa_std;
  o.wa_skw(k)=wa_skw;
    
  id_cloud = (v2d.qc>0);
  
  id_up=(v2d.wa>0 & id_cloud);
  x=getaavg_tend(v,v2d,id_up,0);
  o.up.fa       (k,:)=x.fa;          o.up.wpt      (k,:)=x.wptile;  
  o.up.wa       (k,:)=x.wa;          o.up.rho      (k,:)=x.rho; 
  o.up.qtdt_hadv(k,:)=x.qtdt_hadv;   o.up.qtdt_vadv(k,:)=x.qtdt_vadv;
  o.up.qtdt_dyn (k,:)=x.qtdt_dyn;    o.up.qtdt_lin (k,:)=x.qtdt_lin;
  o.up.qtdt_dif (k,:)=x.qtdt_dif; 
  o.up.qvdt_dyn (k,:)=x.qvdt_dyn;    o.up.qvdt_lin (k,:)=x.qvdt_lin;
  o.up.qvdt_dif (k,:)=x.qvdt_dif; 
  o.up.qcdt_dyn (k,:)=x.qcdt_dyn;    o.up.qcdt_lin (k,:)=x.qcdt_lin;
  o.up.qcdt_dif (k,:)=x.qcdt_dif; 
  o.up.tdt_dyn  (k,:)=x.tdt_dyn;     o.up.tdt_lin  (k,:)=x.tdt_lin;
  o.up.tdt_dif  (k,:)=x.tdt_dif;     o.up.tdt_rad  (k,:)=x.tdt_rad;
  o.up.tdt_lw   (k,:)=x.tdt_lw;      o.up.tdt_sw   (k,:)=x.tdt_sw; 

  id_dn=(v2d.wa<0 & id_cloud);
  x=getaavg_tend(v,v2d,id_dn,1);
  o.dn.fa       (k,:)=x.fa;          o.dn.wpt      (k,:)=x.wptile;  
  o.dn.wa       (k,:)=x.wa;          o.dn.rho      (k,:)=x.rho; 
  o.dn.qtdt_hadv(k,:)=x.qtdt_hadv;   o.dn.qtdt_vadv(k,:)=x.qtdt_vadv;
  o.dn.qtdt_dyn (k,:)=x.qtdt_dyn;    o.dn.qtdt_lin (k,:)=x.qtdt_lin;
  o.dn.qtdt_dif (k,:)=x.qtdt_dif; 
  o.dn.qvdt_dyn (k,:)=x.qvdt_dyn;    o.dn.qvdt_lin (k,:)=x.qvdt_lin;
  o.dn.qvdt_dif (k,:)=x.qvdt_dif; 
  o.dn.qcdt_dyn (k,:)=x.qcdt_dyn;    o.dn.qcdt_lin (k,:)=x.qcdt_lin;
  o.dn.qcdt_dif (k,:)=x.qcdt_dif; 
  o.dn.tdt_dyn  (k,:)=x.tdt_dyn;     o.dn.tdt_lin  (k,:)=x.tdt_lin;
  o.dn.tdt_dif  (k,:)=x.tdt_dif;     o.dn.tdt_rad  (k,:)=x.tdt_rad;
  o.dn.tdt_lw   (k,:)=x.tdt_lw;      o.dn.tdt_sw   (k,:)=x.tdt_sw; 

  id_en=~(id_up | id_dn);
  x=getaavg_tend(v,v2d,id_en,0);
  o.en.fa       (k,:)=x.fa;          o.en.wpt      (k,:)=x.wptile;  
  o.en.wa       (k,:)=x.wa;          o.en.rho      (k,:)=x.rho; 
  o.en.qtdt_hadv(k,:)=x.qtdt_hadv;   o.en.qtdt_vadv(k,:)=x.qtdt_vadv;
  o.en.qtdt_dyn (k,:)=x.qtdt_dyn;    o.en.qtdt_lin (k,:)=x.qtdt_lin;
  o.en.qtdt_dif (k,:)=x.qtdt_dif; 
  o.en.qvdt_dyn (k,:)=x.qvdt_dyn;    o.en.qvdt_lin (k,:)=x.qvdt_lin;
  o.en.qvdt_dif (k,:)=x.qvdt_dif; 
  o.en.qcdt_dyn (k,:)=x.qcdt_dyn;    o.en.qcdt_lin (k,:)=x.qcdt_lin;
  o.en.qcdt_dif (k,:)=x.qcdt_dif; 
  o.en.tdt_dyn  (k,:)=x.tdt_dyn;     o.en.tdt_lin  (k,:)=x.tdt_lin;
  o.en.tdt_dif  (k,:)=x.tdt_dif;     o.en.tdt_rad  (k,:)=x.tdt_rad;
  o.en.tdt_lw   (k,:)=x.tdt_lw;      o.en.tdt_sw   (k,:)=x.tdt_sw; 
end

