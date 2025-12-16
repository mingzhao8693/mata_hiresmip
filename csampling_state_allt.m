function o=csampling_state_allt(v,wa,rho,qc,qt,qv,ql,qi,qr,qs,qg,rh,ta,hli,...
				mse,dse,thv,buo,tap,mf,dthvdp,tdt_rd)
v.tngrid=v.nt*v.ngrid;
qp=qr+qs+qg;
for k=1:v.nz
  k
  v2d.wa  =squeeze(wa  (:,k,:,:));
  v2d.rho =squeeze(rho (:,k,:,:)); 
  v2d.qc  =squeeze(qc  (:,k,:,:));
  v2d.qp  =squeeze(qp  (:,k,:,:));
  v2d.qt  =squeeze(qt  (:,k,:,:)); 
  v2d.qv  =squeeze(qv  (:,k,:,:)); 
  v2d.ql  =squeeze(ql  (:,k,:,:)); 
  v2d.qi  =squeeze(qi  (:,k,:,:)); 
  v2d.qr  =squeeze(qr  (:,k,:,:)); 
  v2d.qs  =squeeze(qs  (:,k,:,:)); 
  v2d.qg  =squeeze(qg  (:,k,:,:)); 
  v2d.rh  =squeeze(rh  (:,k,:,:)); 
  v2d.ta  =squeeze(ta  (:,k,:,:)); 
  v2d.hli =squeeze(hli (:,k,:,:)); 
  v2d.mse =squeeze(mse (:,k,:,:)); 
  v2d.dse =squeeze(dse (:,k,:,:)); 
  v2d.thv =squeeze(thv (:,k,:,:)); 
  v2d.buo =squeeze(buo (:,k,:,:)); 
  v2d.tap =squeeze(tap (:,k,:,:)); 
  v2d.mf  =squeeze(mf  (:,k,:,:)); 
  v2d.dthvdp=squeeze(dthvdp (:,k,:,:)); 
  v2d.tdt_rd=squeeze(tdt_rd (:,k,:,:)); 

  id = ~isnan(v2d.wa);
  wa_avg=mean(v2d.wa(id)); a=v2d.wa(id)-wa_avg;
  wa_std=sqrt(mean(a.*a));
  wa_skw=skewness(a); %wa_skw=mean(a.*a.*a)/wa_std^3; definition
  o.wa_avg(k)=wa_avg;
  o.wa_std(k)=wa_std;
  o.wa_skw(k)=wa_skw;

  id_cloud = (v2d.qc>0);
  
  id_up=(v2d.wa>0 & id_cloud); %cloud updrafts
  x=getaavg_state(v,v2d,id_up,0);
  o.up.fa (k,:) = x.fa;    o.up.wpt(k,:) = x.wptile;  
  o.up.wa (k,:) = x.wa;    o.up.rho(k,:) = x.rho; 
  o.up.qc (k,:) = x.qc;    o.up.qp (k,:) = x.qp; 
  o.up.qt (k,:) = x.qt;    
  o.up.qv (k,:) = x.qv;    o.up.ql (k,:) = x.ql;     
  o.up.qi (k,:) = x.qi;    o.up.qr (k,:) = x.qr;
  o.up.qs (k,:) = x.qs;    o.up.qg (k,:) = x.qg; 
  o.up.rh (k,:) = x.rh;    o.up.ta (k,:) = x.ta;
  o.up.hli(k,:) = x.hli;   o.up.mse(k,:) = x.mse;    
  o.up.dse(k,:) = x.dse;   o.up.tap(k,:) = x.tap;
  o.up.thv(k,:) = x.thv;   o.up.buo(k,:) = x.buo;
  o.up.mf (k,:) = x.mf;    o.up.mff(k,:) = x.mff; 
  o.up.dthvdp(k,:) = x.dthvdp;
  o.up.tdt_rd(k,:) = x.tdt_rd;

  id_dn=(v2d.wa<0 & id_cloud); %cloud downdrafts
  x=getaavg_state(v,v2d,id_dn,1);
  o.dn.fa (k,:) = x.fa;    o.dn.wpt(k,:) = x.wptile;  
  o.dn.wa (k,:) = x.wa;    o.dn.rho(k,:) = x.rho; 
  o.dn.qc (k,:) = x.qc;    o.dn.qp (k,:) = x.qp;   
  o.dn.qt (k,:) = x.qt;    
  o.dn.qv (k,:) = x.qv;    o.dn.ql (k,:) = x.ql;     
  o.dn.qi (k,:) = x.qi;    o.dn.qr (k,:) = x.qr;
  o.dn.qs (k,:) = x.qs;    o.dn.qg (k,:) = x.qg; 
  o.dn.rh (k,:) = x.rh;    o.dn.ta (k,:) = x.ta;
  o.dn.hli(k,:) = x.hli;   o.dn.mse(k,:) = x.mse;    
  o.dn.dse(k,:) = x.dse;   o.dn.tap(k,:) = x.tap;
  o.dn.thv(k,:) = x.thv;   o.dn.buo(k,:) = x.buo;
  o.dn.mf (k,:) = x.mf;    o.dn.mff(k,:) = x.mff;
  o.dn.dthvdp(k,:) = x.dthvdp;
  o.dn.tdt_rd(k,:) = x.tdt_rd;

  id_en=~(id_up | id_dn); %noncloud environment
  x=getaavg_state(v,v2d,id_en,0);
  o.en.fa (k,:) = x.fa;    o.en.wpt(k,:) = x.wptile;  
  o.en.wa (k,:) = x.wa;    o.en.rho(k,:) = x.rho; 
  o.en.qc (k,:) = x.qc;    o.en.qp (k,:) = x.qp;   
  o.en.qt (k,:) = x.qt;    
  o.en.qv (k,:) = x.qv;    o.en.ql (k,:) = x.ql;     
  o.en.qi (k,:) = x.qi;    o.en.qr (k,:) = x.qr;
  o.en.qs (k,:) = x.qs;    o.en.qg (k,:) = x.qg; 
  o.en.rh (k,:) = x.rh;    o.en.ta (k,:) = x.ta;
  o.en.hli(k,:) = x.hli;   o.en.mse(k,:) = x.mse;    
  o.en.dse(k,:) = x.dse;   o.en.tap(k,:) = x.tap;
  o.en.thv(k,:) = x.thv;   o.en.buo(k,:) = x.buo;
  o.en.mf (k,:) = x.mf;    o.en.mff(k,:) = x.mff;
  o.en.dthvdp(k,:) = x.dthvdp;
  o.en.tdt_rd(k,:) = x.tdt_rd;
end

return

