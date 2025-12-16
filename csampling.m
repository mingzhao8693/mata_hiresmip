function v=csampling(v,wa,rho,qc,qt,qv,ql,qi,qr,qs,qg,ta,hl)
for k=1:v.nz
  for t=1:v.nt
    v2d.wa  =squeeze(wa  (t,k,:,:));
    v2d.rho =squeeze(rho (t,k,:,:)); 
    v2d.qt  =squeeze(qt  (t,k,:,:)); 

    v2d.qv  =squeeze(qv  (t,k,:,:)); 
    v2d.rh  =squeeze(rh  (t,k,:,:)); 
    v2d.ql  =squeeze(ql  (t,k,:,:)); 
    v2d.qi  =squeeze(qi  (t,k,:,:)); 
    v2d.qc  =v2d.ql + v2d.qi;
    v2d.qr  =squeeze(qr  (t,k,:,:)); 
    v2d.qs  =squeeze(qs  (t,k,:,:)); 
    v2d.qg  =squeeze(qg  (t,k,:,:)); 

    v2d.ta  =squeeze(ta  (t,k,:,:)); 
    v2d.hl  =squeeze(hl  (t,k,:,:)); 
    v2d.mse =squeeze(mse (t,k,:,:)); 

    id = ~isnan(v2d.wa);
    wa_avg=mean(v2d.wa(id)); a=v2d.wa(id)-wa_avg;
    wa_std=sqrt(mean(a.*a));
    wa_skw=(mean(a.*a.*a)).*(1/3)/wa_std;
    v.wa_avg(t,k)=wa_avg;
    v.wa_std(t,k)=wa_std;
    v.wa_skw(t,k)=wa_skw;
    
    id_cloud = (v2d.ql+v2d.qi>0);
  
    id_up=(v2d.wa>0 & id_cloud);
    x=getaavg(v,v2d,id_up,0);
    v.up.fa (t,k,:) = x.fa;     v.up.mf  (t,k,:) = x.mf;
    v.up.w  (t,k,:) = x.w;      v.up.rho (t,k,:) = x.rho;
    v.up.ta (t,k,:) = x.ta;     v.up.qv  (t,k,:) = x.qv;
    v.up.rh (t,k,:) = x.rh;     v.up.ql  (t,k,:) = x.ql;
    v.up.qi (t,k,:) = x.qi;     v.up.qc  (t,k,:) = x.qc;
    v.up.qr (t,k,:) = x.qr;     v.up.qs  (t,k,:) = x.qs;     
    v.up.qg (t,k,:) = x.qg;     v.up.qt  (t,k,:) = x.qt;
    v.up.hl (t,k,:) = x.hl;     v.up.mse (t,k,:) = x.mse;  
    v.up.wa (t,k,:) = x.wa;     v.up.wptile(t,k,:)=x.wptile; 

    id_dn=(v2d.wa<0 & id_cloud);
    x=getaavg(v,v2d,id_dn,1);
    v.dn.fa (t,k,:) = x.fa;     v.dn.mf  (t,k,:) = x.mf;
    v.dn.w  (t,k,:) = x.w;      v.dn.rho (t,k,:) = x.rho;
    v.dn.ta (t,k,:) = x.ta;     v.dn.qv  (t,k,:) = x.qv;
    v.dn.rh (t,k,:) = x.rh;     v.dn.ql  (t,k,:) = x.ql;
    v.dn.qi (t,k,:) = x.qi;     v.dn.qc  (t,k,:) = x.qc;
    v.dn.qr (t,k,:) = x.qr;     v.dn.qs  (t,k,:) = x.qs;     
    v.dn.qg (t,k,:) = x.qg;     v.dn.qt  (t,k,:) = x.qt;  
    v.dn.hl (t,k,:) = x.hl;     v.dn.mse (t,k,:) = x.mse;
    v.dn.wa (t,k,:) = x.wa;     v.dn.wptile(t,k,:)=x.wptile; 
    v.dn.wqt(t,k,:) = x.wqt;    v.dn.whl (t,k,:) = x.whl;
    v.dn.wmse(t,k,:)= x.wmse;


    id_en=~(id_up | id_dn);
    x=getaavg(v,v2d,id_en,0);
    v.en.fa (t,k,:) = x.fa;     v.en.mf  (t,k,:) = x.mf;
    v.en.w  (t,k,:) = x.w;      v.en.rho (t,k,:) = x.rho;
    v.en.ta (t,k,:) = x.ta;     v.en.qv  (t,k,:) = x.qv;
    v.en.rh (t,k,:) = x.rh;     v.en.ql  (t,k,:) = x.ql;
    v.en.qi (t,k,:) = x.qi;     v.en.qc  (t,k,:) = x.qc;
    v.en.qr (t,k,:) = x.qr;     v.en.qs  (t,k,:) = x.qs;     
    v.en.qg (t,k,:) = x.qg;     v.en.qt  (t,k,:) = x.qt;   
    v.en.hl (t,k,:) = x.hl;     v.en.mse (t,k,:) = x.mse;   
    v.en.wa (t,k,:) = x.wa;     v.en.wptile(t,k,:)=x.wptile; 
    v.en.wqt(t,k,:) = x.wqt;    v.en.whl (t,k,:) = x.whl;
    v.en.wmse(t,k,:)= x.wmse;
  end
end

v.up.fa_avg  =squeeze(mean(v.up.fa,  1)); v.up.mf_avg =squeeze(mean(v.up.mf, 1));
v.up.wa_avg  =squeeze(mean(v.up.wa,  1)); v.up.rho_avg=squeeze(mean(v.up.rho,1));
v.up.ta_avg  =squeeze(mean(v.up.ta,  1)); v.up.ta_avg =squeeze(mean(v.up.ta,1));
v.up.qv_avg  =squeeze(mean(v.up.qv,  1)); v.up.rh_avg =squeeze(mean(v.up.rh,1));
v.up.ql_avg  =squeeze(mean(v.up.ql,  1)); v.up.qi_avg =squeeze(mean(v.up.qi,1));
v.up.qc_avg  =squeeze(mean(v.up.qc,  1));
v.up.qr_avg  =squeeze(mean(v.up.qr,  1)); v.up.qs_avg =squeeze(mean(v.up.qs,1));
v.up.qg_avg  =squeeze(mean(v.up.qg,  1)); v.up.qt_avg =squeeze(mean(v.up.qt,1)); 
v.up.hl_avg  =squeeze(mean(v.up.hl,  1)); v.up.mse_avg=squeeze(mean(v.up.mse,1)); 
v.up.wqt_avg =squeeze(mean(v.up.wqt, 1)); v.up.wqc_avg=squeeze(mean(v.up.wqc,1));
v.up.whl_avg =squeeze(mean(v.up.whl, 1)); 
v.up.wmse_avg=squeeze(mean(v.up.wmse,1)); 
v.up.rflx_avg=squeeze(mean(v.up.rflx,1)); 
v.up.sflx_avg=squeeze(mean(v.up.sflx,1)); v.up.wptile_avg=squeeze(mean(v.up.wptile,1));
v.up.qtflx_dyn_avg=squeeze(mean(v.up.qtflx_dyn,1)); 
v.up.qtflx_lin_avg=squeeze(mean(v.up.qtflx_lin,1)); 
v.up.qtflx_dif_avg=squeeze(mean(v.up.qtflx_dif,1)); 
v.up.qtdt_dyn_avg =squeeze(mean(v.up.qtdt_dyn, 1)); 
v.up.qtdt_lin_avg =squeeze(mean(v.up.qtdt_lin, 1)); 
v.up.qtdt_dif_avg =squeeze(mean(v.up.qtdt_dif, 1)); 
v.up.qcdt_dyn_avg =squeeze(mean(v.up.qcdt_dyn, 1)); 
v.up.qcdt_lin_avg =squeeze(mean(v.up.qcdt_lin, 1)); 
v.up.qcdt_dif_avg =squeeze(mean(v.up.qcdt_dif, 1)); 
v.up.mf_hdiv_avg  =squeeze(mean(v.up.mf_hdiv,  1)); 
v.up.mf_vdiv_avg  =squeeze(mean(v.up.mf_vdiv,  1)); 

v.dn.fa_avg  =squeeze(mean(v.dn.fa,  1)); v.dn.mf_avg =squeeze(mean(v.dn.mf, 1));
v.dn.wa_avg  =squeeze(mean(v.dn.wa,  1)); v.dn.rho_avg=squeeze(mean(v.dn.rho,1));
v.dn.ta_avg  =squeeze(mean(v.dn.ta,  1)); v.dn.ta_avg =squeeze(mean(v.dn.ta,1));
v.dn.qv_avg  =squeeze(mean(v.dn.qv,  1)); v.dn.rh_avg =squeeze(mean(v.dn.rh,1));
v.dn.ql_avg  =squeeze(mean(v.dn.ql,  1)); v.dn.qi_avg =squeeze(mean(v.dn.qi,1));
v.dn.qc_avg  =squeeze(mean(v.dn.qc,  1));
v.dn.qr_avg  =squeeze(mean(v.dn.qr,  1)); v.dn.qs_avg =squeeze(mean(v.dn.qs,1));
v.dn.qg_avg  =squeeze(mean(v.dn.qg,  1)); v.dn.qt_avg =squeeze(mean(v.dn.qt,1)); 
v.dn.hl_avg  =squeeze(mean(v.dn.hl,  1)); v.dn.mse_avg=squeeze(mean(v.dn.mse, 1)); 
v.dn.wqt_avg =squeeze(mean(v.dn.wqt, 1)); v.dn.wqc_avg=squeeze(mean(v.dn.wqc,1));
v.dn.whl_avg =squeeze(mean(v.dn.whl, 1));
v.dn.wmse_avg=squeeze(mean(v.dn.wmse,1)); 
v.dn.rflx_avg=squeeze(mean(v.dn.rflx,1));
v.dn.sflx_avg=squeeze(mean(v.dn.sflx,1)); v.dn.wptile_avg=squeeze(mean(v.dn.wptile,1));
v.dn.qtflx_dyn_avg=squeeze(mean(v.dn.qtflx_dyn,1)); 
v.dn.qtflx_lin_avg=squeeze(mean(v.dn.qtflx_lin,1)); 
v.dn.qtflx_dif_avg=squeeze(mean(v.dn.qtflx_dif,1)); 
v.dn.qtdt_dyn_avg =squeeze(mean(v.dn.qtdt_dyn, 1)); 
v.dn.qtdt_lin_avg =squeeze(mean(v.dn.qtdt_lin, 1)); 
v.dn.qtdt_dif_avg= squeeze(mean(v.dn.qtdt_dif, 1)); 
v.dn.qcdt_dyn_avg =squeeze(mean(v.dn.qcdt_dyn, 1)); 
v.dn.qcdt_lin_avg =squeeze(mean(v.dn.qcdt_lin, 1)); 
v.dn.qcdt_dif_avg= squeeze(mean(v.dn.qcdt_dif, 1)); 
v.dn.mf_hdiv_avg  =squeeze(mean(v.dn.mf_hdiv,  1)); 
v.dn.mf_vdiv_avg  =squeeze(mean(v.dn.mf_vdiv,  1)); 

v.en.fa_avg  =squeeze(mean(v.en.fa,  1)); v.en.mf_avg =squeeze(mean(v.en.mf, 1));
v.en.wa_avg  =squeeze(mean(v.en.wa,  1)); v.en.rho_avg=squeeze(mean(v.en.rho,1));
v.en.ta_avg  =squeeze(mean(v.en.ta,  1)); v.en.ta_avg =squeeze(mean(v.en.ta,1));
v.en.qv_avg  =squeeze(mean(v.en.qv,  1)); v.en.rh_avg =squeeze(mean(v.en.rh,1));
v.en.ql_avg  =squeeze(mean(v.en.ql,  1)); v.en.qi_avg =squeeze(mean(v.en.qi,1));
v.en.qc_avg  =squeeze(mean(v.en.qc,  1));
v.en.qr_avg  =squeeze(mean(v.en.qr,  1)); v.en.qs_avg =squeeze(mean(v.en.qs,1));
v.en.qg_avg  =squeeze(mean(v.en.qg,  1)); v.en.qt_avg =squeeze(mean(v.en.qt,1));
v.en.hl_avg  =squeeze(mean(v.en.hl,  1)); v.en.mse_avg =squeeze(mean(v.en.mse, 1)); 
v.en.wqt_avg =squeeze(mean(v.en.wqt, 1)); v.en.wqc_avg=squeeze(mean(v.en.wqc,1));
v.en.whl_avg =squeeze(mean(v.en.whl, 1));
v.en.wmse_avg=squeeze(mean(v.en.wmse,1)); 
v.en.rflx_avg=squeeze(mean(v.en.rflx,1));
v.en.sflx_avg=squeeze(mean(v.en.sflx,1)); v.en.wptile_avg=squeeze(mean(v.en.wptile,1));
v.en.qtflx_dyn_avg=squeeze(mean(v.en.qtflx_dyn,1)); 
v.en.qtflx_lin_avg=squeeze(mean(v.en.qtflx_lin,1)); 
v.en.qtflx_dif_avg=squeeze(mean(v.en.qtflx_dif,1)); 
v.en.qtdt_dyn_avg =squeeze(mean(v.en.qtdt_dyn, 1)); 
v.en.qtdt_lin_avg =squeeze(mean(v.en.qtdt_lin, 1)); 
v.en.qtdt_dif_avg =squeeze(mean(v.en.qtdt_dif, 1)); 
v.en.qcdt_dyn_avg =squeeze(mean(v.en.qcdt_dyn, 1)); 
v.en.qcdt_lin_avg =squeeze(mean(v.en.qcdt_lin, 1)); 
v.en.qcdt_dif_avg =squeeze(mean(v.en.qcdt_dif, 1)); 
v.en.mf_hdiv_avg  =squeeze(mean(v.en.mf_hdiv,  1)); 
v.en.mf_vdiv_avg  =squeeze(mean(v.en.mf_vdiv,  1)); 
