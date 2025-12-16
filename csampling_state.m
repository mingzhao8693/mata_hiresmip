function v=csampling_state(v,wa,qc,buo,rop,tap,qt,rh,hli,mse,dse,mf)
for k=1:v.nz
  v.tngrid=v.ngrid; k
  for t=1:v.nt
    v2d.wa  =squeeze(wa  (t,k,:,:));
    v2d.qc  =squeeze(qc  (t,k,:,:)); 
    v2d.buo =squeeze(buo (t,k,:,:)); 
    v2d.rop =squeeze(rop (t,k,:,:)); 
    v2d.tap =squeeze(tap (t,k,:,:)); 
    v2d.qt  =squeeze(qt  (t,k,:,:)); 
    v2d.rh  =squeeze(rh  (t,k,:,:)); 
    v2d.hli =squeeze(hli (t,k,:,:)); 
    v2d.mse =squeeze(mse (t,k,:,:)); 
    v2d.dse =squeeze(dse (t,k,:,:)); 
    v2d.mf  =squeeze(mf  (t,k,:,:)); 

    id = ~isnan(v2d.wa);
    wa_avg=mean(v2d.wa(id)); a=v2d.wa(id)-wa_avg;
    wa_std=sqrt(mean(a.*a));
    wa_skw=skewness(a); %wa_skw=mean(a.*a.*a)/wa_std^3; definition
    v.wa_avg(t,k)=wa_avg;
    v.wa_std(t,k)=wa_std;
    v.wa_skw(t,k)=wa_skw;
    
    id_cloud = (v2d.qc>0);
  
    id_up=(v2d.wa>0 & id_cloud); %cloud updrafts
    x=getaavg_state_onet(v,v2d,id_up,0);
    v.up.fa (t,k,:) = x.fa;    v.up.wpt(t,k,:) = x.wptile;  
    v.up.wa (t,k,:) = x.wa;    v.up.qc (t,k,:) = x.qc;
    v.up.qt (t,k,:) = x.qt;    
    v.up.qv (t,k,:) = x.qv;    v.up.ql (t,k,:) = x.ql;     
    v.up.qi (t,k,:) = x.qi;    v.up.qr (t,k,:) = x.qr;
    v.up.qs (t,k,:) = x.qs;    v.up.qg (t,k,:) = x.qg; 
    v.up.rh (t,k,:) = x.rh;    v.up.ta (t,k,:) = x.ta;
    v.up.hli(t,k,:) = x.hli;   v.up.mse(t,k,:) = x.mse;    
    v.up.dse(t,k,:) = x.dse;   v.up.mf (t,k,:) = x.mf;
    v.up.mff(t,k,:) = x.mff;

    id_dn=(v2d.wa<0 & id_cloud); %cloud downdrafts
    x=getaavg_state_onet(v,v2d,id_dn,1);
    v.dn.fa (t,k,:) = x.fa;    v.dn.wpt(t,k,:) = x.wptile;  
    v.dn.wa (t,k,:) = x.wa;    v.dn.rho(t,k,:) = x.rho; 
    v.dn.qc (t,k,:) = x.qc;    v.dn.qt (t,k,:) = x.qt;    
    v.dn.qv (t,k,:) = x.qv;    v.dn.ql (t,k,:) = x.ql;     
    v.dn.qi (t,k,:) = x.qi;    v.dn.qr (t,k,:) = x.qr;
    v.dn.qs (t,k,:) = x.qs;    v.dn.qg (t,k,:) = x.qg; 
    v.dn.rh (t,k,:) = x.rh;    v.dn.ta (t,k,:) = x.ta;
    v.dn.hli(t,k,:) = x.hli;   v.dn.mse(t,k,:) = x.mse;    
    v.dn.dse(t,k,:) = x.dse;   v.dn.mf (t,k,:) = x.mf;
    v.dn.mff(t,k,:) = x.mff;

    id_en=~(id_up | id_dn); %noncloud environment
    x=getaavg_state_onet(v,v2d,id_en,0);
    v.en.fa (t,k,:) = x.fa;    v.en.wpt(t,k,:) = x.wptile;  
    v.en.wa (t,k,:) = x.wa;    v.en.rho(t,k,:) = x.rho; 
    v.en.qc (t,k,:) = x.qc;    v.en.qt (t,k,:) = x.qt;    
    v.en.qv (t,k,:) = x.qv;    v.en.ql (t,k,:) = x.ql;     
    v.en.qi (t,k,:) = x.qi;    v.en.qr (t,k,:) = x.qr;
    v.en.qs (t,k,:) = x.qs;    v.en.qg (t,k,:) = x.qg; 
    v.en.rh (t,k,:) = x.rh;    v.en.ta (t,k,:) = x.ta;
    v.en.hli(t,k,:) = x.hli;   v.en.mse(t,k,:) = x.mse;    
    v.en.dse(t,k,:) = x.dse;   v.en.mf (t,k,:) = x.mf;
    v.en.mff(t,k,:) = x.mff;
  end
end

v.up.fa_avg =squeeze(mean(v.up.fa, 1)); 
v.up.wpt_avg=squeeze(mean(v.up.wpt,1));
v.up.wa_avg =squeeze(mean(v.up.wa, 1)); 
v.up.rho_avg=squeeze(mean(v.up.rho,1));
v.up.qc_avg =squeeze(mean(v.up.qc, 1));
v.up.qt_avg =squeeze(mean(v.up.qt, 1)); 
v.up.qv_avg =squeeze(mean(v.up.qv, 1)); 
v.up.ql_avg =squeeze(mean(v.up.ql, 1)); 
v.up.qi_avg =squeeze(mean(v.up.qi, 1));
v.up.qr_avg =squeeze(mean(v.up.qr, 1)); 
v.up.qs_avg =squeeze(mean(v.up.qs, 1));
v.up.qg_avg =squeeze(mean(v.up.qg, 1)); 
v.up.rh_avg =squeeze(mean(v.up.rh, 1));
v.up.ta_avg =squeeze(mean(v.up.ta, 1)); 
v.up.hli_avg=squeeze(mean(v.up.hli,1));
v.up.mse_avg=squeeze(mean(v.up.mse,1)); 
v.up.dse_avg=squeeze(mean(v.up.dse,1)); 
v.up.mf_avg =squeeze(mean(v.up.mf, 1)); 
v.up.mff_avg=squeeze(mean(v.up.mff,1)); 

v.dn.fa_avg =squeeze(mean(v.dn.fa, 1)); 
v.dn.wpt_avg=squeeze(mean(v.dn.wpt,1));
v.dn.wa_avg =squeeze(mean(v.dn.wa, 1)); 
v.dn.rho_avg=squeeze(mean(v.dn.rho,1));
v.dn.qc_avg =squeeze(mean(v.dn.qc, 1));
v.dn.qt_avg =squeeze(mean(v.dn.qt, 1)); 
v.dn.qv_avg =squeeze(mean(v.dn.qv, 1)); 
v.dn.ql_avg =squeeze(mean(v.dn.ql, 1)); 
v.dn.qi_avg =squeeze(mean(v.dn.qi, 1));
v.dn.qr_avg =squeeze(mean(v.dn.qr, 1)); 
v.dn.qs_avg =squeeze(mean(v.dn.qs, 1));
v.dn.qg_avg =squeeze(mean(v.dn.qg, 1)); 
v.dn.rh_avg =squeeze(mean(v.dn.rh, 1));
v.dn.ta_avg =squeeze(mean(v.dn.ta, 1)); 
v.dn.hli_avg=squeeze(mean(v.dn.hli,1)); 
v.dn.mse_avg=squeeze(mean(v.dn.mse,1));
v.dn.dse_avg=squeeze(mean(v.dn.dse,1));
v.dn.mf_avg =squeeze(mean(v.dn.mf, 1)); 
v.dn.mff_avg=squeeze(mean(v.dn.mff,1)); 

v.en.fa_avg =squeeze(mean(v.en.fa, 1)); 
v.en.wpt_avg=squeeze(mean(v.en.wpt,1));
v.en.wa_avg =squeeze(mean(v.en.wa, 1)); 
v.en.rho_avg=squeeze(mean(v.en.rho,1));
v.en.qc_avg =squeeze(mean(v.en.qc, 1));
v.en.qt_avg =squeeze(mean(v.en.qt, 1)); 
v.en.qv_avg =squeeze(mean(v.en.qv, 1)); 
v.en.ql_avg =squeeze(mean(v.en.ql, 1)); 
v.en.qi_avg =squeeze(mean(v.en.qi, 1));
v.en.qr_avg =squeeze(mean(v.en.qr, 1)); 
v.en.qs_avg =squeeze(mean(v.en.qs, 1));
v.en.qg_avg =squeeze(mean(v.en.qg, 1)); 
v.en.rh_avg =squeeze(mean(v.en.rh, 1));
v.en.ta_avg =squeeze(mean(v.en.ta, 1)); 
v.en.hli_avg=squeeze(mean(v.en.hli,1)); 
v.en.mse_avg=squeeze(mean(v.en.mse,1)); 
v.en.dse_avg=squeeze(mean(v.en.dse,1)); 
v.en.mf_avg =squeeze(mean(v.en.mf, 1)); 
v.en.mff_avg=squeeze(mean(v.en.mff,1)); 

return
