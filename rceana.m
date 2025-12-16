function v=rceana(tpath,expn,ts,te,zs)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; 
%expn='RCE_H064x008_L79_R48_uwconv';  ts=60; te=180; zs=1;
expn='RCE_H1024x128_L79_R03';  ts=60; te=160; zs=1;
%expn='RCE_H128x128_L79_R01';  ts=60; te=260; zs=1;

varn='bkpk';  fname=strcat(tpath,expn,'/atmos_data/',varn,'.nc')
f=netcdf(fname,'nowrite'); 
v.bk=f{'bk'}(:); v.pk=f{'pk'}(:); v.ph=f{'phalf'}(:); close(f);
v.nz_ph=length(v.ph); v.nz_pf=v.nz_ph-1;

a=find(expn(:)=='R'); i=a(end); v.dx=str2num(expn(i+1:i+2))*1000.; v.dy=v.dx;

varn='ps'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
f=netcdf(fname,'nowrite'); v.fname=fname; 'FILE OPENED...'
varn='time';    v.t =f{varn}(:); v.nt=length(v.t);
varn='grid_xt'; v.x =f{varn}(:); v.nx=length(v.x);
varn='grid_yt'; v.y =f{varn}(:); v.ny=length(v.y); v.ngrid=v.nx*v.ny;
v.ts=ts; v.te=te; v.t=v.t(ts:te); v.nt=length(v.t);
ze=v.nz_pf; v.zs=zs; v.ze=ze; v.nz=ze-zs+1; 

varn='ps'; ps=f{varn}(ts:te,:,:); close(f); v.ps=getavar(ps,v,'2d');
pf(1:v.nt,1:v.nz_pf,1:v.ny,1:v.nx)=0; pfa=pf;
a=v.bk(1)*ps+v.pk(1); ph(:,1,:,:)=a; 
for k=2:v.nz_ph
  a=v.bk(k)*ps+v.pk(k); ph(:,k,:,:)=a;
  pf(:,k-1,:,:)=(ph(:,k,:,:)-ph(:,k-1,:,:))./(log(ph(:,k,:,:))-log(ph(:,k-1,:,:)));
% pftest(:,k-1,:,:) = 0.5*(ph(:,k,:,:)+ph(:,k-1,:,:));
end
dp=diff(ph,1,2);

%for verification of dp
%varn='delp'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
%f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); v.delp=a;

varn='delz'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); v.pf=f{'pfull'}(zs:ze); close(f);
dz=a; rho=dp./dz/G; zh=a; zf=a;

zh(:,v.nz+1,:,:)=0;
for k = v.nz : -1: 1 %a=dz(:,k,:,:);
  zh(:,k,:,:)= zh(:,k+1,:,:)+dz(:,k,:,:);
  zf(:,k,:,:)=(zh(:,k+1,:,:)+zh(:,k,:,:))*0.5;
end

v.dz = getavar(dz, v,'3d');
v.rho= getavar(rho,v,'3d');
v.zf = getavar(zf, v,'3d'); 
v.zh = getavar(zh, v,'3d');

%for verification of zfull
%varn='z_full'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
%if (exist(fname,'file') == 2)
%  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
%  v.zf1=getavar(a,v,'3d'); zf1=a;
%end
%figure; plot(v.zf0.avg,v.pf,'-r*'); hold on; plot(v.zf1.avg,v.pf,'-bs');set(gca,'YDir','reverse');

varn='temp';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.ta = getavar(a,v,'3d'); ta=a;
end

varn='sphum';  fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qv = getavar(a,v,'3d'); qv=a;
end

varn='liq_wat'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.ql = getavar(a,v,'3d'); ql=a;
end

varn='ice_wat'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qi = getavar(a,v,'3d'); qi=a; qc=ql+qi;
  v.qc = getavar(qc,v,'3d');
end

varn='rainwat'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qr = getavar(a,v,'3d'); qr=a;
end

varn='snowwat'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qs = getavar(a,v,'3d'); qs=a;
end

varn='graupel'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qg = getavar(a,v,'3d'); qg=a;
end

varn='rh';     fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.rh = getavar(a,v,'3d'); rh=a;
end
varn='rh_dyn'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.rh = getavar(a,v,'3d'); rh=a;
end

qt =qv+ql+qi+qr+qs+qg;
dse=CPD*ta+G*zf;
mse=dse+LV0*qv-HLF*qi;
hli=dse-LV0*(ql+qi)-HLF*qi;
rv = qv./(1.-qv); rc=qc./(1.-qc); rt=qt./(1.-qt);
tv = ta.*(1+rv/EPS)./(1+rv+rc); clear rc;
thv= tv.*((1000./pf).^RDOCP);
a=squeeze(mean(mean(mean(tv,4),3),1));
for k = 1:v.nz
  buo(:,k,:,:)=tv(:,k,:,:)-a(k);
end
v.qt = getavar(qt, v,'3d');
v.dse= getavar(dse,v,'3d');
v.mse= getavar(mse,v,'3d');
v.hli= getavar(hli,v,'3d');
v.tv = getavar(tv, v,'3d');
v.thv= getavar(thv,v,'3d');
v.buo= getavar(buo,v,'3d');

qp=qr+qs+qg; v.qp=getavar(qp, v,'3d'); %clear qr qs qg rh;
a=ps; a(:,:,:)=0; 
qt_int=a; qv_int=a; qc_int=a; qp_int=a; dse_int=a; mse_int=a;
for k = 1:v.nz
  qt_int (:,:,:)=qt_int (:,:,:)+squeeze(qt (:,k,:,:).*rho(:,k,:,:).*dz(:,k,:,:));
  qv_int (:,:,:)=qv_int (:,:,:)+squeeze(qv (:,k,:,:).*rho(:,k,:,:).*dz(:,k,:,:));
  qc_int (:,:,:)=qc_int (:,:,:)+squeeze(qc (:,k,:,:).*rho(:,k,:,:).*dz(:,k,:,:));
  qp_int (:,:,:)=qp_int (:,:,:)+squeeze(qp (:,k,:,:).*rho(:,k,:,:).*dz(:,k,:,:));
  dse_int(:,:,:)=dse_int(:,:,:)+squeeze(dse(:,k,:,:).*rho(:,k,:,:).*dz(:,k,:,:));
  mse_int(:,:,:)=mse_int(:,:,:)+squeeze(mse(:,k,:,:).*rho(:,k,:,:).*dz(:,k,:,:));
end
v.qt_int =getavar(qt_int, v,'2d');
v.qv_int =getavar(qv_int, v,'2d');
v.qc_int =getavar(qc_int, v,'2d');
v.qp_int =getavar(qp_int, v,'2d');
v.dse_int=getavar(dse_int,v,'2d');
v.mse_int=getavar(mse_int,v,'2d');


%below attempt to compute buoyance as dpp/dz
pff=rho.*RD.*ta.*(1+0.61*rv); v.pff=getavar(pff,v,'3d');%full pressure at full level
ppf=pff-pf;                   v.ppf=getavar(ppf,v,'3d');%perturbation pressure from hydrostatic
dppfdz=ph; dppdz=pf; %vertical gradient of non-hydrostatic perturbation pressure
for k = 2:v.nz
  dppfdz(:,k,:,:)=(ppf(:,k,:,:)-ppf(:,k-1,:,:))./(zf(:,k,:,:)-zf(:,k-1,:,:));
end
dppfdz(:,1,     :,:)=dppfdz(:,2,   :,:);
dppfdz(:,v.nz+1,:,:)=dppfdz(:,v.nz,:,:);
dppdz (:,:,:,:)=0.5*(dppfdz(:,1:v.nz,:,:)+dppfdz(:,2:end,:,:));
v.dpdz  =getavar(dp./dz, v,'3d');
v.dppfdz=getavar(dppfdz, v,'3d');
%above attempt to compute buoyance as dpp/dz

varn='ucomp';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); ua=a;
  v.ua = getavar(a,v,'3d');
end
varn='vcomp';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); va=a;
  v.va = getavar(a,v,'3d');
end
varn='w';      fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); wa=a;
  v.wa = getavar(wa, v,'3d');
end

varn='mf';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); mf=a;
  v.mf = getavar(a,v,'3d');
end

%conditional sampling of state variables
v.state_allt=csampling_state_allt(v,wa,rho,qc,qt,qv,ql,qi,qr,qs,qg,rh,ta,hli,mse,dse,thv,buo,dppdz,mf)
%v.state=csampling_state(v,wa,rho,qc,qt,qv,ql,qi,qr,qs,qg,rh,ta,hli,mse,dse,mf)

wbin=[-5:0.2:25]; 
if (v.nz_pf==91)
  v.pf([40 47 53 58 63 68 74 80]-zs+1)
  %k=40-zs+1; a=squeeze(wa(:,k,:,:)); v.w200=getavar(a,v,'2d',wbin);
  %k=47-zs+1; a=squeeze(wa(:,k,:,:)); v.w300=getavar(a,v,'2d',wbin);
  %k=53-zs+1; a=squeeze(wa(:,k,:,:)); v.w400=getavar(a,v,'2d',wbin);
  k=44-zs+1; a=squeeze(wa(:,k,:,:)); v.w500=getavar(a,v,'2d',wbin);
  %k=63-zs+1; a=squeeze(wa(:,k,:,:)); v.w600=getavar(a,v,'2d',wbin);
  %k=68-zs+1; a=squeeze(wa(:,k,:,:)); v.w700=getavar(a,v,'2d',wbin);
  %k=74-zs+1; a=squeeze(wa(:,k,:,:)); v.w800=getavar(a,v,'2d',wbin);
  %k=80-zs+1; a=squeeze(wa(:,k,:,:)); v.w900=getavar(a,v,'2d',wbin);
elseif(v.nz_pf==79) %v.pf([26 33 39 44 49 55 61 67]-zs+1)
  k=26-zs+1; a=squeeze(wa(:,k,:,:)); v.w200=getavar(a,v,'2d',wbin);
  k=33-zs+1; a=squeeze(wa(:,k,:,:)); v.w300=getavar(a,v,'2d',wbin);
  k=39-zs+1; a=squeeze(wa(:,k,:,:)); v.w400=getavar(a,v,'2d',wbin);w400=a;
  k=44-zs+1; a=squeeze(wa(:,k,:,:)); v.w500=getavar(a,v,'2d',wbin);w500=a;
  k=49-zs+1; a=squeeze(wa(:,k,:,:)); v.w600=getavar(a,v,'2d',wbin);
  k=55-zs+1; a=squeeze(wa(:,k,:,:)); v.w700=getavar(a,v,'2d',wbin);
  k=61-zs+1; a=squeeze(wa(:,k,:,:)); v.w800=getavar(a,v,'2d',wbin);
end

pbin=[0:0.1:10];
varn='precip'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.sfc.pcp = getavar(a*LV0,v,'2d',pbin); pcp=a*LV0;
end
varn='evap';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.sfc.evp = getavar(a*LV0,v,'2d'); evap=a*LV0;
end
varn='shflx';  fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.sfc.shflx = getavar(a,v,'2d'); shflx=a;
end
v.sfc.thflx = getavar(evap+shflx,v,'2d');

%TOA radiation========================
varn='olr';      fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);     
  v.toa.lwnet = getavar(a,v,'2d'); olr=a;
end
varn='olr_clr';      fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);     
  v.toa.lwnet_clr = getavar(a,v,'2d'); olr_clr=a;
end
a=olr_clr-olr; v.toa.lwcf=getavar(a,v,'2d'); lwcf_toa=a;

varn='swdn_toa'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.toa.swdn = getavar(a,v,'2d',[0]); swdn_toa=a;
end
varn='swup_toa'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.toa.swup = getavar(a,v,'2d'); swup_toa=a;
end
varn='swup_toa_clr'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.toa.swup = getavar(a,v,'2d'); swup_toa_clr=a;
end

a=swdn_toa-swup_toa;     v.toa.swnet=getavar(a,v,'2d'); swnet_toa=a;
a=swup_toa_clr-swup_toa; v.toa.swcf =getavar(a,v,'2d'); swcf_toa =a;
a=lwcf_toa + swcf_toa;   v.toa.ttcf =getavar(a,v,'2d'); ttcf_toa =a;

varn='netrad_toa';  fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.toa.netrad = getavar(a,v,'2d'); netradtoa=a;
end

%Surface radiation===================
varn='swdn_sfc'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
  v.sfc.swdn = getavar(a,v,'2d'); swdn_sfc=a;
end
varn='swdn_sfc_clr'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
  v.sfc.swdn_clr = getavar(a,v,'2d'); swdn_sfc_clr=a;
end
varn='swup_sfc'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
  v.sfc.swup = getavar(a,v,'2d'); swup_sfc=a;
end
varn='swup_sfc_clr'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
  v.sfc.swup_clr = getavar(a,v,'2d'); swup_sfc_clr=a;
end
a=swdn_sfc    -swup_sfc;     v.sfc.swnet    =getavar(a,v,'2d'); swnet_sfc=a;
a=swdn_sfc_clr-swup_sfc_clr; v.sfc.swnet_clr=getavar(a,v,'2d'); swnet_sfc_clr=a;
a=swnet_sfc_clr-swnet_sfc;   v.sfc.swcf     =getavar(a,v,'2d'); swcf_sfc=a;

varn='lwdn_sfc'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.sfc.lwdn = getavar(a,v,'2d'); lwdn_sfc=a;
end
varn='lwdn_sfc_clr'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.sfc.lwdn_clr = getavar(a,v,'2d'); lwdn_sfc_clr=a;
end

varn='lwup_sfc'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.sfc.lwup = getavar(a,v,'2d',[0]); lwup_sfc=a;
end
varn='lwup_sfc_clr'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.sfc.lwup_clr = getavar(a,v,'2d',[0]); lwup_sfc_clr=a;
end
a=lwdn_sfc     -lwup_sfc;     v.sfc.lwnet    =getavar(a,v,'2d'); lwnet_sfc=a;
a=lwdn_sfc_clr -lwup_sfc_clr; v.sfc.lwnet_clr=getavar(a,v,'2d'); lwnet_sfc_clr=a;
a=lwnet_sfc_clr-lwnet_sfc;    v.sfc.lwcf     =getavar(a,v,'2d'); lwcf_sfc=a;
a=swnet_sfc    +lwnet_sfc;    v.sfc.netrad   =getavar(a,v,'2d'); netradsfc=a;
a=netradsfc    -netradtoa;    v.atm.netrad   =getavar(a,v,'2d'); netradatm=a;
%Finish radiation===================


varn='strat_area_ice';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qa_ice = getavar(a,v,'3d'); qa_ice=a;
end
varn='strat_area_liq';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qa_liq = getavar(a,v,'3d'); qa_liq=a;
end
v.qa_tot = getavar(qa_ice+qa_liq,v,'3d');

varn='gb_strat_lwp';  fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.lwp = getavar(a*1000.,v,'2d');
end
varn='gb_strat_iwp';  fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.iwp = getavar(a*1000.,v,'2d');
end
varn='cape_dyn';     fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.cape_dyn = getavar(a,v,'2d');
end
varn='cin_dyn';    fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.cin_dyn = getavar(a,v,'2d');
end
varn='tm';      fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);      
  v.tm = getavar(a,v,'2d');
end
varn='b_star';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.sfc.bstar = getavar(a,v,'2d');
end
varn='t_ref';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);      
  v.sfc.tref = getavar(a,v,'2d');
end
varn='q_ref';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);      
  v.sfc.qref = getavar(a,v,'2d');
end
varn='rh_ref';  fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.sfc.rhref = getavar(a,v,'2d');
end
%tpath='/work/miz/mat_rce/'; 
%fn=strcat(tpath,expn,'_RCE_',num2str(ts),'_',num2str(te),'.mat');
%save(fn,'v'); return

varn='snow_tot'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:)*HLF; close(f);
  v.sfc.fpcp = getavar(a,v,'2d',pbin);
end
do_quick==0;
if (do_quick==0)
  tpath='/work/miz/mat_rce/'; 
  fn=strcat(tpath,expn,'_RCE_',num2str(ts),'_',num2str(te),'.mat');
  save(fn,'v','-v7.3'); return
end

%Below are for vertical fluxes================
wrho=rho.*wa;      v.wrho = getavar(wrho,v,'3d');%verification for mf
wqt =rho.*wa.*qt;  v.wqt  = getavar(wqt, v,'3d'); 
wqv =rho.*wa.*qv;  v.wqv  = getavar(wqv, v,'3d'); clear qv;
wql =rho.*wa.*ql;  v.wql  = getavar(wql, v,'3d'); clear ql;
wqi =rho.*wa.*qi;  v.wqi  = getavar(wqi, v,'3d'); clear qi;
wqc =rho.*wa.*qc;  v.wqc  = getavar(wqc, v,'3d'); 
wqp =rho.*wa.*qp;  v.wqp  = getavar(wqp, v,'3d'); clear qp;
whli=rho.*wa.*hli; v.whli = getavar(whli,v,'3d'); clear hli;
wdse=rho.*wa.*dse; v.wdse = getavar(wdse,v,'3d'); clear dse;
wmse=rho.*wa.*mse; v.wmse = getavar(wmse,v,'3d'); clear mse;

%============================================
%compute horizontal mass and qt flux==========
urho=rho.*ua; urhoqt=urho.*qt;
a=urho; 
urho(:,:,:,2:end)=(a(:,:,:,1:end-1)+a(:,:,:,2:end))/2;
urho(:,:,:,1    )=(a(:,:,:,1)      +a(:,:,:,end)  )/2;
urho(:,:,:,end+1)=urho(:,:,:,1);
a=urhoqt;
urhoqt(:,:,:,2:end)=(a(:,:,:,1:end-1)+a(:,:,:,2:end))/2;
urhoqt(:,:,:,1    )=(a(:,:,:,1)      +a(:,:,:,end)  )/2;
urhoqt(:,:,:,end+1)=urhoqt(:,:,:,1);
vrho=rho.*va; vrhoqt=vrho.*qt;
a=vrho; 
vrho(:,:,2:end,:)=(a(:,:,1:end-1,:)+a(:,:,2:end,:))/2;
vrho(:,:,1,    :)=(a(:,:,1,      :)+a(:,:,end,  :))/2;
vrho(:,:,end+1,:)=vrho(:,:,1,:);
a=vrhoqt;
vrhoqt(:,:,2:end,:)=(a(:,:,1:end-1,:)+a(:,:,2:end,:))/2;
vrhoqt(:,:,1,    :)=(a(:,:,1,      :)+a(:,:,end,  :))/2;
vrhoqt(:,:,end+1,:)=vrhoqt(:,:,1,:);

mf_hdiv     = diff(urho,  1,4)/v.dx+diff(vrho,  1,3)/v.dy;
qtflx_hdiv  = diff(urhoqt,1,4)/v.dx+diff(vrhoqt,1,3)/v.dy;
qtdt_hadv   =(-qtflx_hdiv+mf_hdiv.*qt)./rho; %dominated by mf_hdiv.*qt
v.mf_hdiv   = getavar(mf_hdiv,v,'3d');
v.qtflx_hdiv= getavar(qtflx_hdiv,v,'3d');
v.qtdt_hadv = getavar(qtdt_hadv,v,'3d');

%compute vertical mass and qt flux===========
wrho=rho.*wa; wrhoqt=wrho.*qt;
a=wrho; 
wrho(:,2:end,:,:)=(a(:,1:end-1,:,:)+a(:,2:end,:,:))/2;
wrho(:,1,    :,:)=0; 
wrho(:,end+1,:,:)=0;
a=wrhoqt;
wrhoqt(:,2:end,:,:)=(a(:,1:end-1,:,:)+a(:,2:end,:,:))/2;
wrhoqt(:,1,    :,:)=0;
wrhoqt(:,end+1,:,:)=0;

mf_vdiv     = -diff(wrho,  1,2)./dz; %up minus lower
qtflx_vdiv  = -diff(wrhoqt,1,2)./dz; %up minus lower
qtdt_vadv   =(-qtflx_vdiv+mf_vdiv.*qt)./rho; %both terms important
v.mf_vdiv   = getavar(mf_vdiv,v,'3d');
v.qtflx_vdiv= getavar(qtflx_vdiv,v,'3d');
v.qtdt_vadv = getavar(qtdt_vadv,v,'3d');

qtflx_div   = qtflx_hdiv + qtflx_vdiv;
qtdt_adv    = -qtflx_div./rho;
v.qtflx_adv = getavar(qtflx_div,v,'3d');
v.qtdt_adv  = getavar(qtdt_adv,v,'3d');
%============================================
%The following is not needed because they are identical to above offline calculation
% $$$ varn='wqt';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
% $$$ if (exist(fname,'file') == 2)
% $$$   f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
% $$$   v.wqt_dynn = getavar(a,v,'3d'); 
% $$$ end
varn='qtflx_dyn';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); 
  v.qtflx_dynn = getavar(a,v,'3d'); qtflx_dyn=a;
end
varn='qtflx_lin'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
   f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
   v.qtflx_linn = getavar(a,v,'3d'); qtflx_lin=a;
end
varn='rainflx'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
  v.rainflx = getavar(a,v,'3d'); rainflx=a;
end
varn='solpflx'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
  v.solpflx = getavar(a,v,'3d'); solpflx=a;
end
% $$$ varn='vtr'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
% $$$ if (exist(fname,'file') == 2)
% $$$   f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
% $$$   v.qrflx = getavar(a.*qr,v,'3d');
% $$$ end
% $$$ y1=v.qtflx_dyn.avg; y2=v.qtflx_phy.avg;
% $$$ y3=v.qtflx_lin.avg; y4=v.qtflx_dif.avg;
% $$$ y5a=v.rainflx.avg;  y5b=v.solpflx.avg;  y5c=v.qrflx.avg; y6=v.wqt.avg; 
% $$$ figure; 
% $$$ plot(y1,v.ph,'r'); hold on; plot(y2,v.ph,'b'); plot(y1+y2,v.ph,'c');
% $$$ plot(y3,v.ph,'g'); plot(y4,v.ph,'k'); set(gca,'YDir','reverse'); grid on;
% $$$ plot(-y5a-y5b,v.pf,'c*-'); plot(-y5c,v.pf,'b--'); plot(y6,v.pf,'r--');
% $$$ legend('dyn','phy','dyn+phy','expconv','vdif','pflx');

%conditional sampling of flux variables
v.flux_allt=csampling_flux_allt(v,wa,rho,qc,mf,wqv,wqc,wqt,whli,wmse,wdse,...
				mf_hdiv, mf_vdiv, rainflx, solpflx,...
				qtflx_dyn, qtflx_lin, qtflx_dyn)

clear wqv wqc wqt whli wmse wdse mf_hdiv mf_vdiv rainflx solpflx qtflx_dyn qtflx_lin;

% $$$ varn='mse'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
% $$$ if (exist(fname,'file') == 2)
% $$$   f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
% $$$   v.mse1 = getavar(a,v,'3d'); %verification
% $$$ end

%Below are for tendencies=
%T tendencies=============
varn='tdt_dyn'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); tdt_dyn=a;
  v.tdt_dyn = getavar(a,v,'3d');
end
varn='tdt_lw'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); tdt_lw=a;
  v.tdt_lw = getavar(a,v,'3d');
end
varn='tdt_sw'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); tdt_sw=a;
  v.tdt_sw = getavar(a,v,'3d');
end
varn='tdt_ls'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.tdt_ls = getavar(a,v,'3d');
end
varn='tdt_lin'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); tdt_lin=a;
  v.tdt_lin = getavar(a,v,'3d');
end
varn='tdt_phys'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); tdt_phy=a;
  v.tdt_phy = getavar(a,v,'3d');
end
varn='tdt_dif'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); tdt_dif=a;
  v.tdt_dif = getavar(a,v,'3d');
else
  tdt_dif=tdt_phy-tdt_lw-tdt_sw-tdt_lin; v.tdt_dif = getavar(tdt_dif,v,'3d');
end

% $$$ y1=v.tdt_dyn.avg; y2=v.tdt_phys.avg; 
% $$$ y2a=v.tdt_lw.avg+v.tdt_sw.avg;
% $$$ y2b=v.tdt_lin.avg; y2c=v.tdt_dif.avg; 
% $$$ figure; plot(y1+y2,v.pf,'k','LineWidth',3); hold on;
% $$$ plot(y1, v.pf,'-r'); plot(y2, v.pf,'-c*'); 
% $$$ plot(y2a,v.pf,'-b'); plot(y2b,v.pf,'-kd'); 
% $$$ plot(y2c,v.pf,'-g'); plot(y2a+y2b+y2c,v.pf,'ks');
% $$$ set(gca,'YDir','reverse'); grid on;

%QT tendencies=============
varn='qtdt_dyn';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qtdt_dyn=a;
  v.qtdt_dyn = getavar(a,v,'3d');
end
varn='qtdt_phys'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qtdt_phy=a;
  v.qtdt_phy = getavar(a,v,'3d');
end
varn='qtdt_lin';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qtdt_lin=a;
  v.qtdt_lin = getavar(a,v,'3d');
end
varn='qtdt_dif';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qtdt_dif=a;
  v.qtdt_dif = getavar(a,v,'3d');
else
  qtdt_dif=qtdt_phy-qtdt_lin; v.qtdt_dif=getavar(qtdt_dif,v,'3d');
end

% $$$ y1 =v.qtdt_dyn.avg; y2=v.qtdt_phy.avg; y2a=v.qtdt_lin.avg; y2b=v.qtdt_dif.avg;
% $$$ figure; plot(y1+y2,v.pf,'k','LineWidth',3); hold on;
% $$$ plot(y1, v.pf,'-r'); plot(y2, v.pf,'-g*'); plot(y2a,v.pf,'-b'); 
% $$$ plot(y2b,v.pf,'-k'); plot(y2a+y2b,v.pf,'ks');
% $$$ set(gca,'YDir','reverse'); grid on;


%QV tendencies=============
varn='qvdt_dyn';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qvdt_dyn=a;
  v.qvdt_dyn = getavar(a,v,'3d');
end
varn='qvdt_phys';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qvdt_phy=a;
  v.qvdt_phy = getavar(a,v,'3d');
end
varn='qvdt_lin';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qvdt_lin=a;
  v.qvdt_lin = getavar(a,v,'3d');
end
varn='qvdt_dif';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qvdt_dif=a;
  v.qvdt_dif = getavar(a,v,'3d');
else
  qvdt_dif=qvdt_phy-qvdt_lin; v.qvdt_dif = getavar(qvdt_dif,v,'3d');
end

%QL tendencies=============
varn='qldt_dyn';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qldt_dyn=a;
  v.qldt_dyn = getavar(a,v,'3d');
end
varn='qldt_phys';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qldt_phy=a;
  v.qldt_phy = getavar(a,v,'3d');
end
varn='qldt_lin';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qldt_lin=a;
  v.qldt_lin = getavar(a,v,'3d');
end
varn='qldt_dif';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qldt_dif=a;
  v.qldt_dif = getavar(a,v,'3d');
else
  qldt_dif=qldt_phy-qldt_lin; v.qldt_dif = getavar(qldt_dif,v,'3d');
end

%QI tendencies===============
varn='qidt_dyn';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qidt_dyn=a;
  v.qidt_dyn = getavar(a,v,'3d');
end
varn='qidt_phys';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qidt_phy=a;
  v.qidt_phy = getavar(a,v,'3d');
end
varn='qidt_lin';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qidt_lin=a;
  v.qidt_lin = getavar(a,v,'3d');
end
varn='qidt_dif';   fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qidt_lin=a;
  v.qidt_dif = getavar(a,v,'3d');
else
  qidt_dif=qidt_phy-qidt_lin; v.qidt_dif = getavar(qidt_dif,v,'3d');
end

% $$$ dsedt_dyn=CPD*tdt_dyn; %+gzdt_dyn;
% $$$ msedt_dyn=dsedt_dyn+LV0*qvdt_dyn-HLF*qidt_dyn;
% $$$ dsedt_lin=CPD*tdt_lin;
% $$$ msedt_lin=dsedt_lin+LV0*qvdt_lin-HLF*qidt_lin;
% $$$ v.dsedt_dyn = getavar(dsedt_dyn,v,'3d');
% $$$ v.msedt_dyn = getavar(msedt_dyn,v,'3d');
% $$$ v.dsedt_lin = getavar(dsedt_lin,v,'3d');
% $$$ v.msedt_lin = getavar(msedt_lin,v,'3d');
% $$$ figure; plot(v.dsedt_dyn.avg,v.pf); hold on; 
% $$$ plot(v.msedt_dyn.avg,v.pf,'r'); 
% $$$ set(gca,'YDir','reverse');
% $$$ figure; plot(v.dsedt_lin.avg,v.pf); set(gca,'YDir','reverse');
% $$$ figure; plot(v.msedt_lin.avg,v.pf); set(gca,'YDir','reverse');
% $$$ %Compute fluxes based on tendencies, at a given grid-box the implied
% $$$ %flux may come from both vertical and horizontal; horizontal average yield vertical flux only.
% $$$ qtflx_dyn=a; qtflx_dyn(:,1,:,:)=0;
% $$$ qtflx_phy=a; qtflx_phy(:,1,:,:)=0;
% $$$ qtflx_lin=a; qtflx_lin(:,1,:,:)=0;
% $$$ for k=1:v.nz
% $$$   qtflx_dyn(:,k+1,:,:)=qtflx_dyn(:,k,:,:)+qtdt_dyn(:,k,:,:).*rho(:,k,:,:).*dz(:,k,:,:);
% $$$   qtflx_phy(:,k+1,:,:)=qtflx_phy(:,k,:,:)+qtdt_phy(:,k,:,:).*rho(:,k,:,:).*dz(:,k,:,:);
% $$$   qtflx_lin(:,k+1,:,:)=qtflx_lin(:,k,:,:)+qtdt_lin(:,k,:,:).*rho(:,k,:,:).*dz(:,k,:,:);
% $$$ end
% $$$ qtflx_dif = qtflx_phy - qtflx_lin;
% $$$ v.qtflx_dyn = getavar(qtflx_dyn,v,'3d');
% $$$ v.qtflx_phy = getavar(qtflx_phy,v,'3d');
% $$$ v.qtflx_lin = getavar(qtflx_lin,v,'3d');
% $$$ v.qtflx_dif = getavar(qtflx_dif,v,'3d');

v.tend_allt=csampling_tend_allt(v,wa,rho,qc, qtdt_vadv, qtdt_hadv,...
				qtdt_dyn, qtdt_lin, qtdt_dif,...
				qvdt_dyn, qvdt_lin, qvdt_dif,...
				qldt_dyn, qldt_lin, qldt_dif,...
				qidt_dyn, qidt_lin, qidt_dif,...
				tdt_dyn,  tdt_lin,  tdt_dif, tdt_lw, tdt_sw)



varn='prec_uws'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
  v.sfc.pcp_uws = getavar(a*LV0,v,'2d');
end

varn='prec_uwd'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
  v.sfc.pcp_uwd = getavar(a*LV0,v,'2d');
end

varn='prec_uwd'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
  v.sfc.pcp_uwd = getavar(a*LV0,v,'2d');
end

varn='cmf_uws'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); 
  v.cmf_uws = getavar(a,v,'3d');
end

varn='cmf_uwd'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); 
  v.cmf_uwd = getavar(a,v,'3d');
end

varn='hlflx_uwc'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); 
  v.hlflx_uwc = getavar(a,v,'3d');
end

varn='qtflx_uwc'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); 
  v.qtflx_uwc = getavar(a,v,'3d');
end

varn='qtflx_uwc'; fname=strcat(tpath,expn,'/atmos_data/',varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); 
  v.qtflx_uwc = getavar(a,v,'3d');
end

tpath='/work/miz/mat_rce/'; 
fn=strcat(tpath,expn,'_RCE_',num2str(ts),'_',num2str(te),'.mat');
%save(fn,'v'); 
save(fn,'v','-v7.3');

return

