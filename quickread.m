function v=quickread(tpath,expn,ts,te)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/';
%expn ='mwc_am4p0_300_100km_64x32_302'; ts=13; te=14
fname=strcat(tpath,expn,'/atmos_data/atmos_month.nc');
f=netcdf(fname,'nowrite'); x=[1:64]*100;
a=f{'pfull'}(:); v.pf0=a; v.nz   =length(v.pf0);
a=f{'phalf'}(:); v.ph0=a; v.nz_ph=length(v.ph0); 

a=f{'t_surf'}      (ts:te,:,:); v.sst=get_stat(a,'2d');
a=f{'precip'}      (ts:te,:,:); v.pcp=get_stat(a,'2d');
a=f{'prec_conv'}   (ts:te,:,:); v.pcv=get_stat(a,'2d');
a=f{'prec_ls'}     (ts:te,:,:); v.pls=get_stat(a,'2d');
a=f{'eis_uwc'}     (ts:te,:,:); v.eis=get_stat(a,'2d');
a=f{'lts_uwc'}     (ts:te,:,:); v.lts=get_stat(a,'2d');
a=f{'low_cld_amt'} (ts:te,:,:); v.qal=get_stat(a,'2d');
a=f{'swup_toa'}    (ts:te,:,:); swup_toa    =a;
a=f{'swup_toa_clr'}(ts:te,:,:); swup_toa_clr=a;
a=swup_toa_clr-swup_toa; v.toa.swcf=get_stat(a,'2d');
a=f{'olr'}    (ts:te,:,:); lwnet    =a;
a=f{'olr_clr'}(ts:te,:,:); lwnet_clr=a;
a=lwnet_clr-lwnet; v.toa.lwcf=get_stat(a,'2d');
a=f{'netrad_toa'}(ts:te,:,:);v.toa.netrad=get_stat(a,'2d');

a=f{'delp'}   (ts:te,:,:,:); v.dp=get_stat(a,'3d'); 
ph(:,2:34,:,:)=cumsum(a,2)*0.01; ph(:,1,:,:)=v.ph0(1); v.ph=get_stat(ph,'3d');
for k=2:v.nz+1
  pf(:,k-1,:,:)=(ph(:,k,:,:)-ph(:,k-1,:,:))./(log(ph(:,k,:,:))-log(ph(:,k-1,:,:)));
end
v.pf=get_stat(pf,'3d');
a=f{'temp'}   (ts:te,:,:,:); v.ta =get_stat(a,'3d'); ta=a;
a=ta.*(1000./pf).^(RD/CPD);  v.th =get_stat(a,'3d');
a=f{'sphum'}  (ts:te,:,:,:); v.qv =get_stat(a,'3d'); qv=a; rv=qv./(1.-qv);
a=f{'liq_wat'}(ts:te,:,:,:); v.ql =get_stat(a,'3d'); ql=a;
a=f{'ice_wat'}(ts:te,:,:,:); v.qi =get_stat(a,'3d'); qi=a; qc=ql+qi; rc=qc./(1.-qc);
a=ta.*(1+rv/EPS)./(1+rv+rc); v.tv =get_stat(a,'3d'); tv=a;
a=tv.*(1000./pf).^(RD/CPD);  v.thv=get_stat(a,'3d');
a=f{'z_full'}  (ts:te,:,:,:);v.zf =get_stat(a,'3d'); zf=a;
a=(CPD*ta+G*zf+LV0*qv-HLF*qi)/CPD;  v.mse=get_stat(a,'3d'); mse=a;

a=f{'rh'}     (ts:te,:,:,:); v.rh=get_stat(a,'3d');
a=f{'cld_amt'}(ts:te,:,:,:); v.qa=get_stat(a,'3d');
a=f{'omega'}  (ts:te,:,:,:); v.om=get_stat(a*864,'3d'); 
a=f{'ucomp'}  (ts:te,:,:,:); v.ua=get_stat(a,'3d');

return
