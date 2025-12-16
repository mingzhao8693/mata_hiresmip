function [p]=onelev(v,wx,qx,wbin_up,wbin_dn,wbin,pctile,qc_th,vx,vbin)
qcbin=[qc_th 0.0001:0.0001:0.003 0.004 0.005];
qcbin=[qc_th 0.0001:0.0001:0.003 0.004:0.001:0.01];
pctile_dn=fliplr(pctile);
id_up =(wx>0);      id_dn =(wx<0); 
id_cld=(qx>=qc_th); id_clr=(qx<qc_th);
id_cup=id_up & id_cld; id_cdn=id_dn & id_cld;

a=wx;a(~id_up) =NaN; p.up =getavar_smart(a,v,'2d',wbin_up,pctile);
a=wx;a(~id_dn) =NaN; p.dn =getavar_smart(a,v,'2d',wbin_dn,pctile_dn);
a=wx;a(~id_cup)=NaN; p.cup=getavar_smart(a,v,'2d',wbin_up,pctile);
a=wx;a(~id_cdn)=NaN; p.cdn=getavar_smart(a,v,'2d',wbin_dn,pctile_dn);
a=wx;a(~id_cld)=NaN; p.cld=getavar_smart(a,v,'2d',wbin,pctile);
a=wx;a(~id_clr)=NaN; p.clr=getavar_smart(a,v,'2d',wbin,pctile);
a=wx;                p.all=getavar_smart(a,v,'2d',wbin,pctile);
if exist('vx')
  a=vx; a(~id_up)=NaN; p.up.pcp_stat =getavar_smart(a,v,'2d',vbin, pctile);
  a=vx; a(~id_dn)=NaN; p.dn.pcp_stat =getavar_smart(a,v,'2d',vbin, pctile);
  a=vx;                p.all.pcp_stat=getavar_smart(a,v,'2d',vbin, pctile);
  a=qx; a(~id_cld)=NaN;p.cld.qc_stat =getavar_smart(a,v,'2d',qcbin,pctile);
end

p.upmdn.avg=p.up.avg-p.dn.avg;
p.upmdn.ts =p.up.ts -p.dn.ts;
p.upmdn.std=std(p.upmdn.ts);
