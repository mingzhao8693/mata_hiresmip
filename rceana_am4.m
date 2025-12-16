function v=rceana_am4(tpath,expn,ts,te,zs,qc_th,do_uwc)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/RCEMIP/'; 
%ts=1; te=6; zs=1; qc_th=0.00001; do_uwc=1;
%expn='rce_am4p0_300_100km_128x64'; 
dir=strcat('/atmos_data/'); 
fname=strcat(tpath,expn,dir,'atmos_month.nc')
f=netcdf(fname,'nowrite'); v.fname=fname; 'FILE OPENED...'
varn='time';    v.t =f{varn}(:); v.nt=length(v.t);
varn='grid_xt'; v.x =f{varn}(:); v.nx=length(v.x);
varn='grid_yt'; v.y =f{varn}(:); v.ny=length(v.y); v.ngrid=v.nx*v.ny;
v.ts=ts; v.te=te; v.t=v.t(ts:te); v.nt=length(v.t);
v.bk=f{'bk'}(:); v.pk=f{'pk'}(:); v.ph=f{'phalf'}(:);
v.nz_ph=length(v.ph); v.nz_pf=v.nz_ph-1;
ze=v.nz_pf; v.zs=zs; v.ze=ze; v.nz=ze-zs+1; v.expn=expn;
v.dx=100; v.dy=v.dx;
v.pctile=[50 75 90 95 99 99.9 99.99]; pctile=v.pctile; v
%varn='precip'; pcp=f{varn}(ts:te,:,:); v.pcp=getavar(pcp,v,'2d');
%varn='evap';   evp=f{varn}(ts:te,:,:); v.evp=getavar(evp,v,'2d');
%varn='netrad_toa'; rad=f{varn}(ts:te,:,:); v.rad=getavar(rad,v,'2d');

varn='ps'; ps=f{varn}(ts:te,:,:); v.sfc.ps=getavar(ps,v,'2d');
pf(1:v.nt,1:v.nz_pf,1:v.ny,1:v.nx)=0; %pfa=pf;
a=v.bk(1)*ps+v.pk(1); ph(:,1,:,:)=a; 
for k=2:v.nz_ph
  a=v.bk(k)*ps+v.pk(k); ph(:,k,:,:)=a;
  pf(:,k-1,:,:)=(ph(:,k,:,:)-ph(:,k-1,:,:))./(log(ph(:,k,:,:))-log(ph(:,k-1,:,:)));
end
dp=diff(ph,1,2); v.atm.dp=getavar(dp, v,'3d'); clear ph ps;
v.atm.pf=getavar(pf, v,'3d'); v.pf=f{'pfull'}(zs:ze);

%varn='delz'; a=f{varn}(ts:te,zs:ze,:,:); v.atm.dz=getavar(a, v,'3d');dz=a;
%rho=dp./dz/G; v.atm.rho= getavar(rho,v,'3d');

varn='omega';   a=f{varn}(ts:te,zs:ze,:,:); om=a;
varn='liq_wat'; a=f{varn}(ts:te,zs:ze,:,:); ql=a;
varn='ice_wat'; a=f{varn}(ts:te,zs:ze,:,:); qi=a; qc=ql+qi;

id.up =(om<0); id.cup=(om<0 & qc>qc_th); id.cld=(qc> qc_th);
id.dn =(om>0); id.cdn=(om>0 & qc>qc_th); id.clr=(qc<=qc_th);

k=17; %500hPa level
om500=squeeze((om(:,k,:,:)+om(:,k+1,:,:))/2); 
qc500=squeeze((qc(:,k,:,:)+qc(:,k+1,:,:))/2);
idx.up =(om500<0); idx.dn =(om500>0);

v.om500 =csampone(om500, v,'2d',idx,0);

%below conditional sampling
v.om=csampone(om,v,'3d',id,1); 
v.qc=csampone(qc,v,'3d',id,1);
v.ql=csampone(ql,v,'3d',id,0);
v.qi=csampone(qi,v,'3d',id,0);
id0=(om<0&qc>0);a=om;a(~id0)=NaN; v.om.cup0=getavar_smart(a,v,'3d',[0 1],pctile);
id0=(om>0&qc>0);a=om;a(~id0)=NaN; v.om.cdn0=getavar_smart(a,v,'3d',[0 1],pctile);
id0=(qc>0);     a=om;a(~id0)=NaN; v.om.cld0=getavar_smart(a,v,'3d',[0 1],pctile);
id0=(qc==0);    a=om;a(~id0)=NaN; v.om.clr0=getavar_smart(a,v,'3d',[0 1],pctile);clear id0; 

varn='temp';    a=f{varn}(ts:te,zs:ze,:,:); v.ta =csampone(a, v,'3d',id,0);ta=a;
varn='sphum';   a=f{varn}(ts:te,zs:ze,:,:); v.qv =csampone(a, v,'3d',id,0);qv=a;
varn='rh';      a=f{varn}(ts:te,zs:ze,:,:); v.rh =csampone(a, v,'3d',id,0);%rh=a;
varn='cld_amt'; a=f{varn}(ts:te,zs:ze,:,:); v.qa =csampone(a, v,'3d',id,0);%rh=a;
% $$$ varn='rainwat'; a=f{varn}(ts:te,zs:ze,:,:); v.qr =csampone(a, v,'3d',id,0);qr=a;
% $$$ varn='snowwat'; a=f{varn}(ts:te,zs:ze,:,:); v.qs =csampone(a, v,'3d',id,0);qs=a;
% $$$ varn='graupel'; a=f{varn}(ts:te,zs:ze,:,:); v.qg =csampone(a, v,'3d',id,0);qg=a;
% $$$ varn='strat_area_ice';a=f{varn}(ts:te,zs:ze,:,:);v.qa_ice=csampone(a,v,'3d',id,0);qa_ice=a;
% $$$ varn='strat_area_liq';a=f{varn}(ts:te,zs:ze,:,:);v.qa_liq=csampone(a,v,'3d',id,0);qa_liq=a;
% $$$ qa=max(qa_ice,qa_liq); v.qa=csampone(qa,v,'3d',id,0); clear qa_ice qa_liq;
% $$$ a=qr+qs+qg;                                 v.qp =csampone(a, v,'3d',id,0);qp=a;
% $$$ a=qv+ql+qi+qr+qs+qg;                        v.qt =csampone(a, v,'3d',id,0);qt=a;
% $$$ a=CPD*ta+G*zf;                              v.dse=csampone(a, v,'3d',id,0);dse=a;
% $$$ a=dse+LV0*qv-HLF*qi;                        v.mse=csampone(a, v,'3d',id,0);mse=a;
% $$$ a=dse-LV0*(ql+qi)-HLF*qi;                   v.hli=csampone(a, v,'3d',id,0);%hli=a;
% $$$ rv=qv./(1.-qv); rc=qc./(1.-qc); rt=qt./(1.-qt);
% $$$ a=ta.*(1+rv/EPS)./(1+rv+rc);                v.tv =csampone(a, v,'3d',id,0);tv=a;
% $$$ a=tv.*((100000./pf).^RDOCP);                v.thv=csampone(a, v,'3d',id,0);thv=a;
% $$$ a=tv;    a=get_anom(a);                     v.tvp=csampone(a, v,'3d',id,0);%tvp=a;
% $$$ a=rho;   a=get_anom(a); a=-a./rho*G;        v.buo=csampone(a, v,'3d',id,0);%buo=a;
% $$$ %below: compute measures of static stability
% $$$ dthv   = diff_vert(thv,1,2);  
% $$$ dthvdp = dthv./dp;  v.dthvdp=csampone(dthvdp, v,'3d',id,0);
% $$$ %dthvdz = dthv./dz; 
% $$$ clear rv rc rt ta zf pf dthv;
% $$$ 
% $$$ %vertical integral
% $$$ a=squeeze(sum(qt .*rho.*dz,2)); v.int.qt =csampone(a, v,'2d',idx,0);
% $$$ a=squeeze(sum(qv .*rho.*dz,2)); v.int.qv =csampone(a, v,'2d',idx,0);
% $$$ a=squeeze(sum(qc .*rho.*dz,2)); v.int.qc =csampone(a, v,'2d',idx,0);
% $$$ a=squeeze(sum(qp .*rho.*dz,2)); v.int.qp =csampone(a, v,'2d',idx,0);
% $$$ a=squeeze(sum(ql .*rho.*dz,2)); v.int.ql =csampone(a, v,'2d',idx,0);
% $$$ a=squeeze(sum(qi .*rho.*dz,2)); v.int.qi =csampone(a, v,'2d',idx,0);
% $$$ a=squeeze(sum(qr .*rho.*dz,2)); v.int.qr =csampone(a, v,'2d',idx,0);
% $$$ a=squeeze(sum(qs .*rho.*dz,2)); v.int.qs =csampone(a, v,'2d',idx,0);
% $$$ a=squeeze(sum(qg .*rho.*dz,2)); v.int.qg =csampone(a, v,'2d',idx,0);
% $$$ a=squeeze(sum(dse.*rho.*dz,2)); v.int.dse=csampone(a, v,'2d',idx,0);
% $$$ a=squeeze(sum(mse.*rho.*dz,2)); v.int.mse=csampone(a, v,'2d',idx,0);
% $$$ clear qv ql qi qr qs qg qp dmse;
% $$$ 
% $$$ p_strat1=50; p_strat2=100; p_strat3=200;
% $$$ a=find(v.pf<p_strat1); k1=max(a);
% $$$ a=find(v.pf<p_strat2); k2=max(a);
% $$$ a=find(v.pf<p_strat3); k3=max(a);
% $$$ a=squeeze(sum(qt(:,1:k1,:,:).*rho(:,1:k1,:,:).*dz(:,1:k1,:,:),2)); v.int.qts1=getavar(a,v,'2d');
% $$$ a=squeeze(sum(qt(:,1:k2,:,:).*rho(:,1:k2,:,:).*dz(:,1:k2,:,:),2)); v.int.qts2=getavar(a,v,'2d');
% $$$ a=squeeze(sum(qt(:,1:k3,:,:).*rho(:,1:k3,:,:).*dz(:,1:k3,:,:),2)); v.int.qts3=getavar(a,v,'2d');

varn='ucomp';   a=f{varn}(ts:te,zs:ze,:,:); v.ua      =csampone(a,v,'3d',id,0);
varn='vcomp';   a=f{varn}(ts:te,zs:ze,:,:); v.va      =csampone(a,v,'3d',id,0);
% $$$ varn='mf';      a=f{varn}(ts:te,zs:ze,:,:); v.mf      =csampone(a,v,'3d',id,0);
% $$$ varn='mse';     a=f{varn}(ts:te,zs:ze,:,:); v.mse1    =csampone(a,v,'3d',id,0);
% $$$ varn='mse_int'; a=f{varn}(ts:te,:,:,:);     v.int.mse1=csampone(a,v,'2d',idx,0);
%varn='cape_dyn';a=f{varn}(ts:te,:,:);       v.cape_dyn=csampone(a,v,'2d',idx,0);
%varn='cin_dyn'; a=f{varn}(ts:te,:,:);       v.cin_dyn =csampone(a,v,'2d',idx,0);
%varn='tm';      a=f{varn}(ts:te,:,:);       v.tm      =csampone(a,v,'2d',idx,0);
%above conditional sampling

%cloud seen by radiation========
% $$$ varn='gb_strat_lwp'; a=f{varn}(ts:te,:,:); v.lwp=csampone(a,v,'2d',idx,0);x.lwp=a;
% $$$ varn='gb_strat_iwp'; a=f{varn}(ts:te,:,:); v.iwp=csampone(a,v,'2d',idx,0);x.iwp=a;
% $$$ a=x.lwp+x.iwp;                             v.tcp=csampone(a,v,'2d',idx,0);x.tcp=a;

%varn='gb_strat_lwp'; a=f{varn}(ts:te,:,:); v.lwp=csampone(a,v,'2d',idx,0);x.lwp=a;
%varn='gb_strat_iwp'; a=f{varn}(ts:te,:,:); v.iwp=csampone(a,v,'2d',idx,0);x.iwp=a;
%a=x.lwp+x.iwp;                             v.tcp=csampone(a,v,'2d',idx,0);x.tcp=a;
%varn='WVP';          a=f{varn}(ts:te,:,:); v.wvp=csampone(a,v,'2d',idx,0);x.wvp=a;
%a=x.tcp+x.wvp;                             v.twp=csampone(a,v,'2d',idx,0);x.twp=a;
%varn='low_cld_amt';  a=f{varn}(ts:te,:,:); v.qal=csampone(a,v,'2d',idx,0);x.qal=a;
%varn='mid_cld_amt';  a=f{varn}(ts:te,:,:); v.qam=csampone(a,v,'2d',idx,0);x.qam=a;
%a=x.qal+x.qam;                             v.qlm=csampone(a,v,'2d',idx,0);
%varn='high_cld_amt'; a=f{varn}(ts:te,:,:); v.qah=csampone(a,v,'2d',idx,0);x.qah=a;
%varn='tot_cld_amt';  a=f{varn}(ts:te,:,:); v.qat=csampone(a,v,'2d',idx,0);x.qat=a;
x=0; clear x;

%surface variables===========
varn='snow_tot';a=f{varn}(ts:te,:,:)*HLF;v.sfc.fpcp=csampone(a,v,'2d',idx,0);fpcp=a;
varn='precip';  a=f{varn}(ts:te,:,:); v.sfc.pcp   =csampone(a*LV0,v,'2d',idx,0); pcp=a*LV0;
varn='prec_ls'; a=f{varn}(ts:te,:,:); v.sfc.pcp_ls=csampone(a*LV0,v,'2d',idx,0); pcp_ls=a*LV0;
varn='evap';    a=f{varn}(ts:te,:,:); v.sfc.evp   =csampone(a*LV0,v,'2d',idx,0); evp=a*LV0;
varn='shflx';   a=f{varn}(ts:te,:,:); v.sfc.shflx =csampone(a,v,'2d',idx,0); shflx=a;
a=evp+shflx;                          v.sfc.thflx =csampone(a,v,'2d',idx,0); thflx=a;
a=evp-pcp;                            v.sfc.emp   =csampone(a,v,'2d',idx,0); emp=a;
varn='b_star';  a=f{varn}(ts:te,:,:); v.sfc.bstar =csampone(a,v,'2d',idx,0);
varn='t_ref';   a=f{varn}(ts:te,:,:); v.sfc.tref  =csampone(a,v,'2d',idx,0);
varn='q_ref';   a=f{varn}(ts:te,:,:); v.sfc.qref  =csampone(a,v,'2d',idx,0);
varn='rh_ref';  a=f{varn}(ts:te,:,:); v.sfc.rhref =csampone(a,v,'2d',idx,0);
v.pcp_mon_avg=squeeze(mean(pcp,2)); clear fpcp pcp pcp_ls evp shflx emp

%Start radiation===================
varn='olr';     a=f{varn}(ts:te,:,:);     v.toa.lwnet    =csampone(a,v,'2d',idx,0); x.olr=a;
varn='olr_clr'; a=f{varn}(ts:te,:,:);     v.toa.lwnet_clr=csampone(a,v,'2d',idx,0); x.olr_clr=a;
a=x.olr_clr-x.olr;                            v.toa.lwcf =csampone(a,v,'2d',idx,0); x.lwcf_toa=a;
varn='swdn_toa';a=f{varn}(ts:te,:,:);     v.toa.swdn     =csampone(a,v,'2d',idx,0);x.swdn_toa=a;
varn='swup_toa';a=f{varn}(ts:te,:,:);     v.toa.swup     =csampone(a,v,'2d',idx,0); x.swup_toa=a;
varn='swup_toa_clr';a=f{varn}(ts:te,:,:); v.toa.swup     =csampone(a,v,'2d',idx,0); x.swup_toa_clr=a;
a=x.swdn_toa    -x.swup_toa;              v.toa.swnet    =csampone(a,v,'2d',idx,0); x.swnet_toa=a;
a=x.swdn_toa    -x.swup_toa_clr;          v.toa.swnet_clr=csampone(a,v,'2d',idx,0); x.swnet_toa_clr=a;
a=x.swup_toa_clr-x.swup_toa;              v.toa.swcf     =csampone(a,v,'2d',idx,0); x.swcf_toa =a;
a=x.lwcf_toa    +x.swcf_toa;              v.toa.ttcf     =csampone(a,v,'2d',idx,0); x.ttcf_toa =a;
varn='netrad_toa'; a=f{varn}(ts:te,:,:);  v.toa.netrad   =csampone(a,v,'2d',idx,0); x.netradtoa=a;
a=x.swnet_toa_clr-x.olr_clr;              v.toa.netrad_clr=csampone(a,v,'2d',idx,0); x.netradtoa_clr=a;
varn='swdn_sfc';   a=f{varn}(ts:te,:,:);  v.sfc.swdn     =csampone(a,v,'2d',idx,0); x.swdn_sfc=a;
varn='swdn_sfc_clr'; a=f{varn}(ts:te,:,:);v.sfc.swdn_clr =csampone(a,v,'2d',idx,0); x.swdn_sfc_clr=a;
varn='swup_sfc';     a=f{varn}(ts:te,:,:);v.sfc.swup     =csampone(a,v,'2d',idx,0); x.swup_sfc=a;
varn='swup_sfc_clr'; a=f{varn}(ts:te,:,:);v.sfc.swup_clr =csampone(a,v,'2d',idx,0); x.swup_sfc_clr=a;
a=x.swdn_sfc     -x.swup_sfc;             v.sfc.swnet    =csampone(a,v,'2d',idx,0);x.swnet_sfc=a;
a=x.swdn_sfc_clr -x.swup_sfc_clr;         v.sfc.swnet_clr=csampone(a,v,'2d',idx,0);x.swnet_sfc_clr=a;
a=x.swnet_sfc_clr-x.swnet_sfc;            v.sfc.swcf     =csampone(a,v,'2d',idx,0);x.swcf_sfc=a;
varn='lwdn_sfc';  a=f{varn}(ts:te,:,:);   v.sfc.lwdn     =csampone(a,v,'2d',idx,0);x.lwdn_sfc=a;
varn='lwdn_sfc_clr'; a=f{varn}(ts:te,:,:);v.sfc.lwdn_clr =csampone(a,v,'2d',idx,0);x.lwdn_sfc_clr=a;
varn='lwup_sfc';     a=f{varn}(ts:te,:,:);v.sfc.lwup     =csampone(a,v,'2d',idx,0);x.lwup_sfc=a;
varn='lwup_sfc_clr'; a=f{varn}(ts:te,:,:);v.sfc.lwup_clr =csampone(a,v,'2d',idx,0);x.lwup_sfc_clr=a;
a=x.lwdn_sfc     -x.lwup_sfc;             v.sfc.lwnet    =csampone(a,v,'2d',idx,0); x.lwnet_sfc=a;
a=x.lwdn_sfc_clr -x.lwup_sfc_clr;         v.sfc.lwnet_clr=csampone(a,v,'2d',idx,0); x.lwnet_sfc_clr=a;
a=x.lwnet_sfc_clr-x.lwnet_sfc;            v.sfc.lwcf     =csampone(a,v,'2d',idx,0); x.lwcf_sfc=a;
a=x.swnet_sfc    +x.lwnet_sfc;            v.sfc.netrad   =csampone(a,v,'2d',idx,0); x.netradsfc=a;
a=x.netradsfc    -x.netradtoa;            v.atm.netrad   =csampone(a,v,'2d',idx,0); x.netradatm=a;
a=thflx-x.netradatm;                      v.atm.neteng   =csampone(a,v,'2d',idx,0); x.netengatm=a;
%Finish radiation===================
x=0; clear x thflx;

tpath='/work/miz/mat_rce/'; %tpath=strcat(tpath,expn,'/');
fn=strcat(tpath,expn,'_mon_',num2str(ts),'_',num2str(te),'.mat');fn
save(fn,'v'); return;
%save(fn,'v','-v7.3');


%Below are for tendencies=
%T tendencies=============
disp('do_tend...');
varn='tdt_dyn';  a=f{varn}(ts:te,:,:);  v.atm.tdt_dyn = csampone(a,v,'3d',id,0);x.tdt_dyn=a;
varn='tdt_lw';   a=f{varn}(ts:te,:,:);  v.atm.tdt_lw  = csampone(a,v,'3d',id,1);x.tdt_lw=a;
varn='tdt_sw';   a=f{varn}(ts:te,:,:);  v.atm.tdt_sw  = csampone(a,v,'3d',id,0);x.tdt_sw=a;
varn='tdt_ls';   a=f{varn}(ts:te,:,:);  v.atm.tdt_ls  = csampone(a,v,'3d',id,0);x.tdt_ls=a;
%varn='tdt_lin';  a=f{varn}(ts:te,:,:);  v.atm.tdt_lin = csampone(a,v,'3d',id,0);x.tdt_lin=a;
varn='tdt_phys'; a=f{varn}(ts:te,:,:);  v.atm.tdt_phy = csampone(a,v,'3d',id,0);x.tdt_phy=a;
%a=x.tdt_phy-x.tdt_lw-x.tdt_sw-x.tdt_lin;v.atm.tdt_dif = csampone(a,v,'3d',id,0);x.tdt_dif=a;
%varn='tdt_dif'; a=f{varn}(ts:te,:,:); v.atm.tdt_dif = csampone(a,v,'3d',id,0);tdt_dif=a;

%a=x.tdt_ls; a=squeeze(sum(a.*rho.*dz,2));v.atm.int.tdt_ls=csampone(a,v,'2d',idx,0);

tdt_rad=x.tdt_lw+x.tdt_sw; 
%x=tdt_rad*CPD; a=squeeze(sum(x.*rho.*dz,2));v.atm.int.tdt_rad=csampone(a,v,'2d',idx,0);
%a=squeeze(sum(x(:,1:k1,:,:).*rho(:,1:k1,:,:).*dz(:,1:k1,:,:),2)); v.atm.int.tdt_rad1=getavar(a,v,'2d');
%a=squeeze(sum(x(:,1:k2,:,:).*rho(:,1:k2,:,:).*dz(:,1:k2,:,:),2)); v.atm.int.tdt_rad2=getavar(a,v,'2d');
%a=squeeze(sum(x(:,1:k3,:,:).*rho(:,1:k3,:,:).*dz(:,1:k3,:,:),2)); v.atm.int.tdt_rad3=getavar(a,v,'2d');
v.tdt_rd=csampone(tdt_rad,v,'3d',id,0);
%a=tdt_rad.*thv./tv./dthvdp; v.om_rad=csampone(a,v,'3d',id,0);%radiative subsidence
%a=diff_vert(a,1,2); a=a./dp; v.domrad_dp=csampone(a,v,'3d',id,0);

%clear x tdt_rad thv tv dthvdp;

%QT tendencies=============
varn='qtdt_dyn'; a=f{varn}(ts:te,zs:ze,:,:); v.atm.qtdt_dyn=csampone(a,v,'3d',id,0);x.qtdt_dyn=a;
varn='qtdt_phys';a=f{varn}(ts:te,zs:ze,:,:); v.atm.qtdt_phy=csampone(a,v,'3d',id,0);x.qtdt_phy=a;
%varn='qtdt_lin'; a=f{varn}(ts:te,zs:ze,:,:); v.atm.qtdt_lin=csampone(a,v,'3d',id,0);x.qtdt_lin=a;
%a=x.qtdt_phy-x.qtdt_lin;                     v.atm.qtdt_dif=csampone(a,v,'3d',id,0);x.qtdt_dif=a;
%varn='qtdt_dif';a=f{varn}(ts:te,zs:ze,:,:); v.atm.qtdt_dif=csampone(a,v,'3d',id,0);x.qtdt_dif=a;
x=0; clear x;

%QV tendencies=============
varn='qvdt_dyn'; a=f{varn}(ts:te,zs:ze,:,:); v.atm.qvdt_dyn=csampone(a,v,'3d',id,0);x.qvdt_dyn=a;
varn='qvdt_phys';a=f{varn}(ts:te,zs:ze,:,:); v.atm.qvdt_phy=csampone(a,v,'3d',id,0);x.qvdt_phy=a;
%varn='qvdt_lin'; a=f{varn}(ts:te,zs:ze,:,:); v.atm.qvdt_lin=csampone(a,v,'3d',id,0);x.qvdt_lin=a;
%a=x.qvdt_phy-x.qvdt_lin;                     v.atm.qvdt_dif=csampone(a,v,'3d',id,0);x.qvdt_dif=a;
%varn='qvdt_dif';a=f{varn}(ts:te,zs:ze,:,:); v.atm.qvdt_dif=csampone(a,v,'3d',id,0);x.qvdt_dif=a;
x=0; clear x;

%QL tendencies=============
varn='qldt_dyn'; a=f{varn}(ts:te,zs:ze,:,:); v.atm.qldt_dyn=csampone(a,v,'3d',id,0);x.qldt_dyn=a;
varn='qldt_phys';a=f{varn}(ts:te,zs:ze,:,:); v.atm.qldt_phy=csampone(a,v,'3d',id,0);x.qldt_phy=a;
%varn='qldt_lin'; a=f{varn}(ts:te,zs:ze,:,:); v.atm.qldt_lin=csampone(a,v,'3d',id,0);x.qldt_lin=a;
%a=x.qldt_phy-x.qldt_lin;                     v.atm.qldt_dif=csampone(a,v,'3d',id,0);x.qldt_dif=a;
%varn='qldt_dif';a=f{varn}(ts:te,zs:ze,:,:); v.atm.qldt_dif=csampone(a,v,'3d',id,0);x.qldt_dif=a;
x=0; clear x;

%QI tendencies===============
varn='qidt_dyn'; a=f{varn}(ts:te,zs:ze,:,:); v.atm.qidt_dyn = csampone(a,v,'3d',id,0);qidt_dyn=a;
varn='qidt_phys';a=f{varn}(ts:te,zs:ze,:,:); v.atm.qidt_phy = csampone(a,v,'3d',id,0);qidt_phy=a;
%varn='qidt_lin'; a=f{varn}(ts:te,zs:ze,:,:); v.atm.qidt_lin = csampone(a,v,'3d',id,0);qidt_lin=a;
%a=qidt_phy-qidt_lin;                         v.atm.qidt_dif = csampone(a,v,'3d',id,0);qidt_dif=a;
%varn='qidt_dif';a=f{varn}(ts:te,zs:ze,:,:); v.atm.qidt_dif = csampone(a,v,'3d',id,0);qidt_lin=a;
x=0; clear x;

%energy conservation check==========
do_energy_check=0; %note definition of te, ke and dte with different unit
if (do_energy_check)
  varn='masss';  a=f{varn}(ts:te,:,:);      v.atm.en.masss =getavar(a,v,'2d',[0]);M=a;
  varn='te';     a=f{varn}(ts:te,:,:)./M/G; v.atm.en.te    =getavar(a,v,'2d',[0]);
  varn='ke';     a=f{varn}(ts:te,:,:);      v.atm.en.ke    =getavar(a,v,'2d',[0]);
  varn='eng_s';  a=f{varn}(ts:te,:,:)./M;   v.atm.en.eng_s =getavar(a,v,'2d',[0]);eng_s=a;
  varn='mse_s';  a=f{varn}(ts:te,:,:)./M;   v.atm.en.mse_s =getavar(a,v,'2d',[0]);mse_s=a;
  varn='dse_s';  a=f{varn}(ts:te,:,:)./M;   v.atm.en.dse_s =getavar(a,v,'2d',[0]);dse_s=a;
  varn='ken_s';  a=f{varn}(ts:te,:,:)./M;   v.atm.en.ken_s =getavar(a,v,'2d',[0]);ken_s=a;
  varn='pen_s';  a=f{varn}(ts:te,:,:)./M;   v.atm.en.pen_s =getavar(a,v,'2d',[0]);pen_s=a;

  varn='dmass1'; a=f{varn}(ts:te,:,:); v.atm.en.dmass1=getavar(a,v,'2d');dmass1=a;
  varn='dmass2'; a=f{varn}(ts:te,:,:); v.atm.en.dmass2=getavar(a,v,'2d');dmass2=a;
  varn='dte';    a=f{varn}(ts:te,:,:); v.atm.en.dte   =getavar(a,v,'2d');dte=a;
  varn='d_dse1'; a=f{varn}(ts:te,:,:); v.atm.en.d_dse1=getavar(a,v,'2d');d_dse1=a;
  varn='d_mse1'; a=f{varn}(ts:te,:,:); v.atm.en.d_mse1=getavar(a,v,'2d');d_mse1=a;
  varn='d_eng1'; a=f{varn}(ts:te,:,:); v.atm.en.d_eng1=getavar(a,v,'2d');d_eng1=a;
  varn='d_ken1'; a=f{varn}(ts:te,:,:); v.atm.en.d_ken1=getavar(a,v,'2d');d_ken1=a;
  varn='d_pen1'; a=f{varn}(ts:te,:,:); v.atm.en.d_pen1=getavar(a,v,'2d',[0]);d_pen1=a;
  varn='d_dse2'; a=f{varn}(ts:te,:,:); v.atm.en.d_dse2=getavar(a,v,'2d',[0]);d_dse2=a;
  varn='d_mse2'; a=f{varn}(ts:te,:,:); v.atm.en.d_mse2=getavar(a,v,'2d',[0]);d_mse2=a;
  varn='d_eng2'; a=f{varn}(ts:te,:,:); v.atm.en.d_eng2=getavar(a,v,'2d',[0]);d_eng2=a;
  varn='d_ken2'; a=f{varn}(ts:te,:,:); v.atm.en.d_ken2=getavar(a,v,'2d',[0]);d_ken2=a;
  varn='d_pen2'; a=f{varn}(ts:te,:,:); v.atm.en.d_pen2=getavar(a,v,'2d',[0]);d_pen2=a;
end
%finish energy conservation check====
%figure; plot(v.atm.d_eng2.ts); hold on; plot(v.atm.neteng.ts,'r');
%figure; plot(v.atm.d_ken1.ts); hold on; plot(v.atm.neteng.ts,'r');

%below are convection parameterization related variables====
if (do_uwc==1)
  disp('do_uwc...');
  varn='prec_uws';  a=f{varn}(ts:te,:,:);       v.cv.pcp_uws  = csampone(a*LV0,v,'2d',idx,0);
  varn='prec_uwd';  a=f{varn}(ts:te,:,:);       v.cv.pcp_uwd  = csampone(a*LV0,v,'2d',idx,0);
  varn='prec_conv'; a=f{varn}(ts:te,:,:);       v.cv.pcp      = csampone(a*LV0,v,'2d',idx,0);
  varn='cmf_uws';   a=f{varn}(ts:te,zs:ze,:,:); v.cv.cmf_uws  = csampone(a,v,'3d',id,0);
  varn='cmf_uwd';   a=f{varn}(ts:te,zs:ze,:,:); v.cv.cmf_uwd  = csampone(a,v,'3d',id,0);
  varn='hlflx_uwc'; a=f{varn}(ts:te,zs:ze,:,:); v.cv.hlflx_uwc= csampone(a,v,'3d',id,0);
  varn='qtflx_uwc'; a=f{varn}(ts:te,zs:ze,:,:); v.cv.qtflx_uwc= csampone(a,v,'3d',id,0);
end

tpath='/work/miz/mat_rce/'; %tpath=strcat(tpath,expn,'/');
fn=strcat(tpath,expn,'_mon_',num2str(ts),'_',num2str(te),'.mat');fn
save(fn,'v'); return;
%save(fn,'v','-v7.3');

return

tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/';
ts=1; te=36; zs=1; qc_th=0.00001; do_uwc=1;
expn='rce_am4p0_295_100km_128x64_new'; v=rceana_am4(tpath,expn,ts,te,zs,qc_th,do_uwc)


tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/';
ts=1; te=36; zs=1; qc_th=0.00001; do_uwc=1;
expn='rce_am4p0_300_100km_128x64_new'; v=rceana_am4(tpath,expn,ts,te,zs,qc_th,do_uwc)

tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/';
ts=1; te=36; zs=1; qc_th=0.00001; do_uwc=1;
expn='rce_am4p0_302_100km_128x64_new'; v=rceana_am4(tpath,expn,ts,te,zs,qc_th,do_uwc)

tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/';
ts=1; te=36; zs=1; qc_th=0.00001; do_uwc=1;
expn='rce_am4p0_305_100km_128x64_new'; v=rceana_am4(tpath,expn,ts,te,zs,qc_th,do_uwc)




tpath='/archive/Ming.Zhao/RCEMIP/';
ts=1; te=60; zs=1; qc_th=0.00001; do_uwc=1;
expn='rce_am4p0_300_100km_128x64'; v=rceana_am4(tpath,expn,ts,te,zs,qc_th,do_uwc)


tpath='/archive/Ming.Zhao/RCEMIP/';
ts=1; te=60; zs=1; qc_th=0.00001; do_uwc=1;
expn='rce_am4p0_305_100km_128x64'; v=rceana_am4(tpath,expn,ts,te,zs,qc_th,do_uwc)


tpath='/archive/Ming.Zhao/RCEMIP/';
ts=1; te=60; zs=1; qc_th=0.00001; do_uwc=1;
expn='rce_am4p0_295_100km_128x64'; v=rceana_am4(tpath,expn,ts,te,zs,qc_th,do_uwc)

