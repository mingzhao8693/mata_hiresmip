function o=csampling_flux_allt(v,wa,rho,qc,mf,wqv,wqc,wqt,whli,wmse,wdse,...
                               mf_hdiv, mf_vdiv, rainflx, solpflx,...
			       qtflx_dyn, qtflx_lin, qtflx_dif)
v.tngrid=v.nt*v.ngrid;
for k=1:v.nz
  k
  v2d.wa  =squeeze(wa  (:,k,:,:));
  v2d.rho =squeeze(rho (:,k,:,:)); 
  v2d.qc  =squeeze(qc  (:,k,:,:)); 
  v2d.mf  =squeeze(mf  (:,k,:,:));
  v2d.wqv =squeeze(wqv (:,k,:,:));
  v2d.wqc =squeeze(wqc (:,k,:,:));
  v2d.wqt =squeeze(wqt (:,k,:,:));
  v2d.whli=squeeze(whli(:,k,:,:));
  v2d.wmse=squeeze(wmse(:,k,:,:));
  v2d.wdse=squeeze(wdse(:,k,:,:));
  v2d.mf_hdiv  =squeeze(mf_hdiv  (:,k,:,:));
  v2d.mf_vdiv  =squeeze(mf_vdiv  (:,k,:,:));
  v2d.rflx     =squeeze(rainflx  (:,k,:,:));
  v2d.sflx     =squeeze(solpflx  (:,k,:,:));
  v2d.qtflx_dyn=squeeze(qtflx_dyn(:,k,:,:));
  v2d.qtflx_lin=squeeze(qtflx_lin(:,k,:,:));
  v2d.qtflx_dif=squeeze(qtflx_dif(:,k,:,:));

  id = ~isnan(v2d.wa);
  wa_avg=mean(v2d.wa(id)); a=v2d.wa(id)-wa_avg;
  wa_std=sqrt(mean(a.*a));
  wa_skw=skewness(a); %wa_skw=mean(a.*a.*a)/wa_std^3; definition
  o.wa_avg(k)=wa_avg;
  o.wa_std(k)=wa_std;
  o.wa_skw(k)=wa_skw;
    
  id_cloud = (v2d.qc>0);
  
  id_up=(v2d.wa>0 & id_cloud);
  x=getaavg_flux(v,v2d,id_up,0);
  o.up.fa  (k,:) = x.fa;    o.up.wpt (k,:) = x.wptile;  
  o.up.wa  (k,:) = x.wa;    o.up.rho (k,:) = x.rho; 
  o.up.wqv (k,:) = x.wqv;   o.up.wqc (k,:) = x.wqc;  
  o.up.wqt (k,:) = x.wqt;   o.up.whli(k,:) = x.whli;    
  o.up.wmse(k,:)= x.wmse;   o.up.wdse(k,:) = x.wdse;
  o.up.mf_hdiv  (k,:)= x.mf_hdiv;
  o.up.mf_vdiv  (k,:)= x.mf_vdiv;
  o.up.rflx     (k,:)= x.rflx;
  o.up.sflx     (k,:)= x.sflx;
  o.up.qtflx_dyn(k,:)= x.qtflx_dyn;
  o.up.qtflx_lin(k,:)= x.qtflx_lin;
  o.up.qtflx_dif(k,:)= x.qtflx_dif;

  id_dn=(v2d.wa<0 & id_cloud);
  x=getaavg_flux(v,v2d,id_dn,1);
  o.dn.fa  (k,:) = x.fa;    o.dn.wpt (k,:) = x.wptile;  
  o.dn.wa  (k,:) = x.wa;    o.dn.rho (k,:) = x.rho; 
  o.dn.wqv (k,:) = x.wqv;   o.dn.wqc (k,:) = x.wqc;  
  o.dn.wqt (k,:) = x.wqt;   o.dn.whli(k,:) = x.whli;    
  o.dn.wmse(k,:)= x.wmse;   o.dn.wdse(k,:) = x.wdse;
  o.dn.mf_hdiv  (k,:)= x.mf_hdiv;
  o.dn.mf_vdiv  (k,:)= x.mf_vdiv;
  o.dn.rflx     (k,:)= x.rflx;
  o.dn.sflx     (k,:)= x.sflx;
  o.dn.qtflx_dyn(k,:)= x.qtflx_dyn;
  o.dn.qtflx_lin(k,:)= x.qtflx_lin;
  o.dn.qtflx_dif(k,:)= x.qtflx_dif;

  id_en=~(id_up | id_dn);
  x=getaavg_flux(v,v2d,id_en,0);
  o.en.fa  (k,:) = x.fa;    o.en.wpt (k,:) = x.wptile;  
  o.en.wa  (k,:) = x.wa;    o.en.rho (k,:) = x.rho; 
  o.en.wqv (k,:) = x.wqv;   o.en.wqc (k,:) = x.wqc;  
  o.en.wqt (k,:) = x.wqt;   o.en.whli(k,:) = x.whli;    
  o.en.wmse(k,:)= x.wmse;   o.en.wdse(k,:) = x.wdse;
  o.en.mf_hdiv  (k,:)= x.mf_hdiv;
  o.en.mf_vdiv  (k,:)= x.mf_vdiv;
  o.en.rflx     (k,:)= x.rflx;
  o.en.sflx     (k,:)= x.sflx;
  o.en.qtflx_dyn(k,:)= x.qtflx_dyn;
  o.en.qtflx_lin(k,:)= x.qtflx_lin;
  o.en.qtflx_dif(k,:)= x.qtflx_dif;
  
end

return
