function v=rceana_ins(tpath,expn,res,ts,te,zs)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; 
%expn='RCE_H2048x128_L79_R03_300'; res='org';  ts=300; te=301; zs=1;
%expn='RCE_H0128x008_L79_R48_300'; res='org'; ts=200; te=201; zs=1;ze=64;

start_time=clock; opath='/work/miz/mat_rce/';
dir=strcat('/atmos_data/',res,'/');
varn='bkpk';  fname=strcat(tpath,expn,dir,varn,'.nc')
f=netcdf(fname,'nowrite'); 
v.bk=f{'bk'}(:); v.pk=f{'pk'}(:); v.ph0=f{'phalf'}(:); close(f);
v.nz_ph=length(v.ph0); v.nz_pf=v.nz_ph-1;

a=find(expn(:)=='R'); i=a(end); v.dx=str2num(expn(i+1:i+2))*1000.; v.dy=v.dx;

varn='ps'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc');disp(fname);
f=netcdf(fname,'nowrite'); v.fname=fname; disp('FILE OPENED...');
varn='time';    v.t =f{varn}(:); v.nt=length(v.t);
varn='grid_xt'; v.x =f{varn}(:); v.nx=length(v.x);
varn='grid_yt'; v.y =f{varn}(:); v.ny=length(v.y); v.ngrid=v.nx*v.ny;
v.ts=ts; v.te=te; v.t=v.t(ts:te); v.nt=length(v.t);
ze=v.nz_pf; v.zs=zs; v.ze=ze; v.nz=ze-zs+1; 
pctile=[50 75 90 95 99 99.9 99.99]; v.pctile=pctile;

varn='ps'; ps=f{varn}(ts:te,:,:); close(f); v.ps=getavar(ps,v,'2d');
pf_hy(1:v.nt,1:v.nz_pf,1:v.ny,1:v.nx)=0; pfa=pf_hy;
a=v.bk(1)*ps+v.pk(1); ph_hy(:,1,:,:)=a; 
for k=2:v.nz_ph
  a=v.bk(k)*ps+v.pk(k); ph_hy(:,k,:,:)=a;
  pf_hy(:,k-1,:,:)=(ph_hy(:,k,:,:)-ph_hy(:,k-1,:,:))./(log(ph_hy(:,k,:,:))-log(ph_hy(:,k-1,:,:)));
% pftest(:,k-1,:,:) = 0.5*(ph_hy(:,k,:,:)+ph_hy(:,k-1,:,:));
end
dp=diff(ph_hy,1,2); v.dp=getavar(dp,v,'3d');

%for verification of dp
%varn='delp'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
%f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); v.delp=a;

varn='delz'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); v.pf0=f{'pfull'}(zs:ze); close(f);
dz=a; rho=dp./dz/G; zh=a; zf=a;

zh(:,v.nz+1,:,:)=0;
for k = v.nz : -1: 1 %a=dz(:,k,:,:);
  zh(:,k,:,:)= zh(:,k+1,:,:)+dz(:,k,:,:);
  zf(:,k,:,:)=(zh(:,k+1,:,:)+zh(:,k,:,:))*0.5;
end
v.zf = getavar(zf, v,'3d');  disp('zf...');

%v.dz = getavar(dz, v,'3d'); disp('dz...');
v.rho= getavar(rho,v,'3d'); disp('rho...');
%v.zh = getavar(zh, v,'3d'); disp('zh...');
v.pf_hy = getavar(pf_hy, v,'3d'); disp('pf_hy...');
v.ph_hy = getavar(ph_hy, v,'3d'); disp('ph_hy...');

%for verification of zfull
%varn='z_full'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
%if (exist(fname,'file') == 2)
%  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
%  v.zf1=getavar(a,v,'3d'); zf1=a;
%end
%figure; plot(v.zf0.avg,v.pf_hy,'-r*'); hold on; plot(v.zf1.avg,v.pf_hy,'-bs');set(gca,'YDir','reverse');

varn='w';      fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); wa=a;
  v.wa = getavar(wa, v,'3d');
end
wbin=[-25:2:-3 -2:0.25:-0.25 -0.1 0.1 0.25:0.25:2 3:2:25]; 
%v.pf0([26 33 39 44 49 55 61 67]-zs+1)
%k=26-zs+1; a=squeeze(wa(:,k,:,:)); v.w200=getavar(a,v,'2d',wbin,pctile);
%k=33-zs+1; a=squeeze(wa(:,k,:,:)); v.w300=getavar(a,v,'2d',wbin,pctile);
%k=39-zs+1; a=squeeze(wa(:,k,:,:)); v.w400=getavar(a,v,'2d',wbin,pctile);
k=44-zs+1; a=squeeze(wa(:,k,:,:)); v.w500=getavar_smart(a,v,'2d',wbin);w500=a;
k=49-zs+1; a=squeeze(wa(:,k,:,:)); v.w600=getavar_smart(a,v,'2d',wbin);w600=a;
k=55-zs+1; a=squeeze(wa(:,k,:,:)); v.w700=getavar_smart(a,v,'2d',wbin);w700=a;
k=61-zs+1; a=squeeze(wa(:,k,:,:)); v.w800=getavar_smart(a,v,'2d',wbin);w800=a;
%figure; semilogy(v.w500.binc,v.w500.pdf./v.w500.bins,'-s'); b=squeeze(rho(:,k,:,:));
a=w500;id=~(a>0);a(id)=NaN;v.w500_up=getavar_smart(a,v,'2d',[0.1 0.25:0.25:2 3:2:25],pctile);
a=w500;id=~(a<0);a(id)=NaN;v.w500_dn=getavar_smart(a,v,'2d',[-25:2:-3 -2:0.25:-0.25 -0.1],fliplr(pctile));
v.upmdn_500.avg=v.w500_up.avg-v.w500_dn.avg;
v.upmdn_500.ts =v.w500_up.ts -v.w500_dn.ts;

varn='sphum';  fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qv = getavar(a,v,'3d'); qv=a;
end

varn='liq_wat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.ql = getavar(a,v,'3d'); ql=a;
end

varn='ice_wat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qi = getavar(a,v,'3d'); qi=a; 
end
qc=ql+qi; v.qc = getavar(qc,v,'3d');

a=wa.*rho; wrho=a; mf=a; qc_th=0.00001;%kg/kg
a=wrho; id=~(a>0 & qc>qc_th); a(id)=NaN; v.mf_cup=getavar_smart(a,v,'3d',[0 1],pctile);
a=wrho; id=~(a<0 & qc>qc_th); a(id)=NaN; v.mf_cdn=getavar_smart(a,v,'3d',[0 1],pctile);
a=wrho; id=~(      qc>qc_th); a(id)=NaN; v.mf_cld=getavar_smart(a,v,'3d',[0 1],pctile);

a=wrho; id=~(a>0);            a(id)=NaN; v.mf_up =getavar_smart(a,v,'3d',[0 1],pctile);
a=wrho; id=~(a<0);            a(id)=NaN; v.mf_dn =getavar_smart(a,v,'3d',[0 1],pctile);
a=wrho;                                  v.mf    =getavar_smart(a,v,'3d',[0 1],pctile); 

do_fast='fast1'; do_fast='none'; 
if strcmp(do_fast,'fast1')
  fn=strcat(opath,expn,'_',res,'_ins_',num2str(ts),'_',num2str(te),do_fast,'.mat');
  save(fn,'v','-v7.3'); return
end

%below surface precipitation, evaporation and heat flux=======
pbin=[-1 1 10:10:100 200:100:1000 10000]; %pbin=[1:100:1000];
varn='precip'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.precip = getavar(a*86400,v,'2d',pbin,pctile); pcp=a*86400;
  v.pcp    = getavar(a*LV0,  v,'2d');
end
%figure; semilogy(v.sfc.precip.binc,v.sfc.precip.pdf./v.sfc.precip.bins,'-s');
varn='snow_tot'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:)*HLF; close(f);
  v.fpcp = getavar(a,v,'2d');
end

varn='evap';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.evp = getavar(a*LV0,v,'2d'); evap=a*LV0;
end
varn='shflx';  fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.shflx = getavar(a,v,'2d'); shflx=a;
end
v.thflx = getavar(evap+shflx,v,'2d'); clear evap shflx;
%above surface precipitation, evaporation and heat flux=======

varn='cape_dyn'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.cape = getavar(a,v,'2d',[0:100:3000 4000:1000:10000],pctile);
end
varn='cin_dyn';  fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.cin = getavar(a,v,'2d',[0:50:1000 2000:1000:10000],pctile);
end

%below atmospheric radiative cooling rate=======
varn='tdt_lw'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); tdt_lw=a;
  v.tdt_lw = getavar(a,v,'3d');
end
varn='tdt_sw'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); tdt_sw=a;
  v.tdt_sw = getavar(a,v,'3d');
end
a=tdt_lw+tdt_sw; v.tdt_rd=getavar(a,v,'3d'); tdt_rd=a;

a=ps; a(:,:,:)=0; 
tdt_lw_int=a; tdt_sw_int=a; tdt_rd_int=a;
for k = 1:v.nz
  tdt_lw_int(:,:,:)=tdt_lw_int(:,:,:)+squeeze(tdt_lw(:,k,:,:).*rho(:,k,:,:).*dz(:,k,:,:));
  tdt_sw_int(:,:,:)=tdt_sw_int(:,:,:)+squeeze(tdt_sw(:,k,:,:).*rho(:,k,:,:).*dz(:,k,:,:));
  tdt_rd_int(:,:,:)=tdt_rd_int(:,:,:)+squeeze(tdt_rd(:,k,:,:).*rho(:,k,:,:).*dz(:,k,:,:));
end
a=tdt_lw_int; v.tdt_lw_int=getavar(a*CPD,v,'2d'); clear tdt_lw_int;
a=tdt_sw_int; v.tdt_sw_int=getavar(a*CPD,v,'2d'); clear tdt_sw_int;
a=tdt_rd_int; v.tdt_rd_int=getavar(a*CPD,v,'2d'); clear tdt_rd_int;
%below atmospheric radiative cooling rate=======

varn='temp';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.ta = getavar(a,v,'3d'); ta=a;
end

varn='rainwat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qr = getavar(a,v,'3d'); qr=a;
end

varn='snowwat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qs = getavar(a,v,'3d'); qs=a;
end

varn='graupel'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qg = getavar(a,v,'3d'); qg=a;
end

qp =qr+qs+qg; v.qp = getavar(qp, v,'3d'); %clear qr qs qg rh;

varn='rh';     fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.rh = getavar(a,v,'3d'); rh=a;
end
%varn='rh_dyn'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
%if (exist(fname,'file') == 2)
%  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
%  v.rh = getavar(a,v,'3d'); rh=a;
%end

varn='cld_amt'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qa = getavar(a,v,'3d'); qa=a;
end

varn='ucomp';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); ua=a;
  v.ua = getavar(a,v,'3d');
end
varn='vcomp';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); va=a;
  v.va = getavar(a,v,'3d');
end
varn='omega';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); om=a;
  v.om = getavar(om, v,'3d');
end

%some derived quantaties
qt =qv+ql+qi+qp;
dse=CPD*ta+G*zf;
mse=dse+LV0*qv-HLF*qi;
hli=dse-LV0*(ql+qi)-HLF*qi;
rv = qv./(1.-qv); rc=qc./(1.-qc); rt=qt./(1.-qt);
tv = ta.*(1+rv/EPS)./(1+rv+rc); clear rc;
thv= tv.*((1000./pf_hy).^RDOCP);
%below: compute measures of static stability
dthv   = diff_vert(thv,1,2);
dthvdp = dthv./dp; 
dthvdz = dthv./dz; 
omr    = tdt_rd.*thv./tv./dthvdp; %radiative subsidence
% $$$ dtv    = diff_vert(tv,1,2);
% $$$ dtvdp  = dtv./dp;  v.dtvdp =getavar(dtvdp,  v,'3d');'dtvdp...'
% $$$ dtvdz  = dtv./dz;  v.dtvdz =getavar(dtvdz,  v,'3d');'dtvdz...'
% $$$ ddse   = diff_vert(dse,1,2);
% $$$ ddsedp = ddse./dp; v.ddsedp=getavar(ddsedp, v,'3d');'ddsedp...'
% $$$ ddsedz = ddse./dz; v.ddsedz=getavar(ddsedz, v,'3d');'ddsedz...'
% $$$ dmse   = diff_vert(mse,1,2);
% $$$ dmsedp = dmse./dp; v.dmsedp=getavar(dmsedp, v,'3d');'dmsedp...'
% $$$ dmsedz = dmse./dz; v.dmsedz=getavar(dmsedz, v,'3d');'dmsedz...'
%above: compute measures of static stability
v.qt    =getavar(qt, v,'3d');     disp('qt...');
v.dse   =getavar(dse,v,'3d');     disp('dse...');
v.mse   =getavar(mse,v,'3d');     disp('mse...');
v.hli   =getavar(hli,v,'3d');     disp('hli...');
v.tv    =getavar(tv, v,'3d');     disp('tv...');
v.thv   =getavar(thv,v,'3d');     disp('thv...');
v.dthvdp=getavar(dthvdp, v,'3d'); disp('dthvdp...');
v.dthvdz=getavar(dthvdz, v,'3d'); disp('dthvdz...');
a=omr; id=~(qc<qc_th); a(id)=NaN;         v.omr=getavar_smart(a,v,'3d',[0 1],pctile);
a=v.dthvdp.avg.*(v.tv.avg./v.thv.avg);    v.omega_rad=v.tdt_rd.avg./a;
a=diff(log(v.qv.avg)); b=v.dp.avg(2:end); v.dlogqdp=a./b;
%a=diff(v.qv.avg)./v.qv.avg(2:end); v.dlogqdp1=a./b;

do_int=1; %vertical integrated quantaties
if (do_int)
  qt_int =squeeze(sum(qt .*rho.*dz,2));
  qv_int =squeeze(sum(qv .*rho.*dz,2));
  qc_int =squeeze(sum(qc .*rho.*dz,2));
  ql_int =squeeze(sum(ql .*rho.*dz,2));
  qi_int =squeeze(sum(qi .*rho.*dz,2));
  qp_int =squeeze(sum(qp .*rho.*dz,2));
  dse_int=squeeze(sum(dse.*rho.*dz,2));
  mse_int=squeeze(sum(mse.*rho.*dz,2));
  v.qt_int =getavar(qt_int, v,'2d'); disp('qt_int...');
  v.qv_int =getavar(qv_int, v,'2d'); disp('qv_int...');
  v.qc_int =getavar(qc_int, v,'2d'); disp('qc_int...');
  v.ql_int =getavar(ql_int, v,'2d'); disp('ql_int...');
  v.qi_int =getavar(qi_int, v,'2d'); disp('qi_int...');
  v.qp_int =getavar(qp_int, v,'2d'); disp('qp_int...');
  v.dse_int=getavar(dse_int,v,'2d'); disp('dse_int...');
  v.mse_int=getavar(mse_int,v,'2d'); disp('mse_int...');
end

%below: compute buoyancy as anomalies from environment
a=squeeze(mean(mean(mean(ta, 4),  3),1));
b=squeeze(mean(mean(mean(tv, 4),  3),1));
c=squeeze(mean(mean(mean(rho,4),  3),1));
d=squeeze(mean(mean(mean(pf_hy,4),3),1));
e=squeeze(mean(mean(mean(thv,4),  3),1));
f=squeeze(mean(mean(mean(hli,4),  3),1));
for k = 1:v.nz
  tap  (:,k,:,:)=ta   (:,k,:,:)-a(k);
  tvp  (:,k,:,:)=tv   (:,k,:,:)-b(k);
  buo  (:,k,:,:)=-(rho(:,k,:,:)-c(k))/c(k)*G; %unit:m/s2
  pp_hy(:,k,:,:)=pf_hy(:,k,:,:)-d(k);
  thvp (:,k,:,:)=thv  (:,k,:,:)-e(k);
  hlip (:,k,:,:)=hli  (:,k,:,:)-f(k);
end
% $$$ for t=1:v.nt
% $$$   for k = 1:v.nz
% $$$     a(t,k)=squeeze(mean(mean(tv (t,k,:,:),4),3));
% $$$     b(t,k)=squeeze(mean(mean(ta (t,k,:,:),4),3));
% $$$     c(t,k)=squeeze(mean(mean(rho(t,k,:,:),4),3));
% $$$     d(t,k)=squeeze(mean(mean(wa (t,k,:,:),4),3));
% $$$     tvp(t,k,:,:)=tv  (t,k,:,:)-a(t,k);
% $$$     tap(t,k,:,:)=ta  (t,k,:,:)-b(t,k);
% $$$     buo(t,k,:,:)=-(rho(t,k,:,:)-c(t,k))/c(t,k)*G; %unit:m/s2
% $$$     wap(t,k,:,:)=wa  (t,k,:,:)-d(t,k);
% $$$   end
% $$$ end
%above: compute buoyancy as anomalies from environment
a=tap;   id=~(wa>0 & qc>qc_th); a(id)=NaN; v.tap_cup  =getavar_smart(a,v,'3d',[0 1],pctile);
a=tvp;   id=~(wa>0 & qc>qc_th); a(id)=NaN; v.tvp_cup  =getavar_smart(a,v,'3d',[0 1],pctile);
a=buo;   id=~(wa>0 & qc>qc_th); a(id)=NaN; v.buo_cup  =getavar_smart(a,v,'3d',[0 1],pctile);
a=pp_hy; id=~(wa>0 & qc>qc_th); a(id)=NaN; v.pp_hy_cup=getavar_smart(a,v,'3d',[0 1],pctile);

wqt=wrho.*qt;
a=wqt; id=~(wa>0 & qc>qc_th); a(id)=NaN; v.wqt_cup=getavar_smart(a,v,'3d',[0 1],pctile);
a=wqt; id=~(wa<0 & qc>qc_th); a(id)=NaN; v.wqt_cdn=getavar_smart(a,v,'3d',[0 1],pctile);
a=wqt; id=~(       qc>qc_th); a(id)=NaN; v.wqt_cld=getavar_smart(a,v,'3d',[0 1],pctile);
a=wqt; id=~(      qc<=qc_th); a(id)=NaN; v.wqt_clr=getavar_smart(a,v,'3d',[0 1],pctile);
a=wqt;                                   v.wqt    =getavar_smart(a,v,'3d',[0 1],pctile);

whli=wrho.*hli;
a=whli; id=~(wa>0 & qc>qc_th); a(id)=NaN; v.whli_cup=getavar_smart(a,v,'3d',[0 1],pctile);
a=whli; id=~(wa<0 & qc>qc_th); a(id)=NaN; v.whli_cdn=getavar_smart(a,v,'3d',[0 1],pctile);
a=whli; id=~(       qc>qc_th); a(id)=NaN; v.whli_cld=getavar_smart(a,v,'3d',[0 1],pctile);
a=whli; id=~(      qc<=qc_th); a(id)=NaN; v.whli_clr=getavar_smart(a,v,'3d',[0 1],pctile);
a=whli;                                   v.whli    =getavar_smart(a,v,'3d',[0 1],pctile);

wmse=wrho.*mse;
a=wmse; id=~(wa>0 & qc>qc_th); a(id)=NaN; v.wmse_cup=getavar_smart(a,v,'3d',[0 1],pctile);
a=wmse; id=~(wa<0 & qc>qc_th); a(id)=NaN; v.wmse_cdn=getavar_smart(a,v,'3d',[0 1],pctile);
a=wmse; id=~(       qc>qc_th); a(id)=NaN; v.wmse_cld=getavar_smart(a,v,'3d',[0 1],pctile);
a=wmse; id=~(      qc<=qc_th); a(id)=NaN; v.wmse_clr=getavar_smart(a,v,'3d',[0 1],pctile);
a=wmse;                                   v.wmse    =getavar_smart(a,v,'3d',[0 1],pctile);

wthv=wrho.*thv;
a=wthv; id=~(wa>0 & qc>qc_th); a(id)=NaN; v.wthv_cup=getavar_smart(a,v,'3d',[0 1],pctile);
a=wthv; id=~(wa<0 & qc>qc_th); a(id)=NaN; v.wthv_cdn=getavar_smart(a,v,'3d',[0 1],pctile);
a=wthv; id=~(       qc>qc_th); a(id)=NaN; v.wthv_cld=getavar_smart(a,v,'3d',[0 1],pctile);
a=wthv; id=~(      qc<=qc_th); a(id)=NaN; v.wthv_clr=getavar_smart(a,v,'3d',[0 1],pctile);
a=wthv;                                   v.wthv    =getavar_smart(a,v,'3d',[0 1],pctile);

wbuo=wrho.*buo;
a=wbuo; id=~(wa>0 & qc>qc_th); a(id)=NaN; v.wbuo_cup=getavar_smart(a,v,'3d',[0 1],pctile);
a=wbuo; id=~(wa<0 & qc>qc_th); a(id)=NaN; v.wbuo_cdn=getavar_smart(a,v,'3d',[0 1],pctile);
a=wbuo; id=~(       qc>qc_th); a(id)=NaN; v.wbuo_cld=getavar_smart(a,v,'3d',[0 1],pctile);
a=wbuo; id=~(      qc<=qc_th); a(id)=NaN; v.wbuo_clr=getavar_smart(a,v,'3d',[0 1],pctile);
a=wbuo;                                   v.wbuo    =getavar_smart(a,v,'3d',[0 1],pctile);

wthvp=wrho.*thvp;
a=wthvp;id=~(wa>0 & qc>qc_th); a(id)=NaN; v.wthvp_cup=getavar_smart(a,v,'3d',[0 1],pctile);
a=wthvp;id=~(wa<0 & qc>qc_th); a(id)=NaN; v.wthvp_cdn=getavar_smart(a,v,'3d',[0 1],pctile);
a=wthvp;id=~(       qc>qc_th); a(id)=NaN; v.wthvp_cld=getavar_smart(a,v,'3d',[0 1],pctile);
a=wthvp;id=~(      qc<=qc_th); a(id)=NaN; v.wthvp_clr=getavar_smart(a,v,'3d',[0 1],pctile);
a=wthvp;                                  v.wthvp    =getavar_smart(a,v,'3d',[0 1],pctile);

whlip=wrho.*hlip;
a=whlip;id=~(wa>0 & qc>qc_th); a(id)=NaN; v.whlip_cup=getavar_smart(a,v,'3d',[0 1],pctile);
a=whlip;id=~(wa<0 & qc>qc_th); a(id)=NaN; v.whlip_cdn=getavar_smart(a,v,'3d',[0 1],pctile);
a=whlip;id=~(       qc>qc_th); a(id)=NaN; v.whlip_cld=getavar_smart(a,v,'3d',[0 1],pctile);
a=whlip;id=~(      qc<=qc_th); a(id)=NaN; v.whlip_clr=getavar_smart(a,v,'3d',[0 1],pctile);
a=whlip;                                  v.whlip    =getavar_smart(a,v,'3d',[0 1],pctile);

%v.state=csampling_state(v,wa,rho,qc,qt,qv,ql,qi,qr,qs,qg,rh,ta,hli,mse,dse,mf)
do_fast='fast2'; %do_fast='none'; 
if strcmp(do_fast,'fast2')
  fn=strcat(opath,expn,'_',res,'_ins_',num2str(ts),'_',num2str(te),do_fast,'.mat');
  save(fn,'v','-v7.3'); return
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Below analysis updraft dynamics%%%%%%%%%%%%%%%%%%%%%%
%compute vertical gradient of non-hydrostatic pressure, 
%note: dw/dt = -dpf_nh/dz/rho which can be understood as buoyancy as well
pf_tt=rho.*RD.*ta.*(1+0.60779*qv); %total pressure=rho.*(1-qv).*RD.*ta+rho.*qv*RV.*ta;
pf_nh=pf_tt-pf_hy; 
v.pf_nh    =getavar(pf_nh,v,'3d');%non-hydrostatic pressure
v.pp_hy    =getavar(pp_hy,v,'3d');%perturbation hydrostatic pressure
for k = 2:v.nz
   dpf_nh_dz(:,k,:,:)=(pf_nh(:,k,:,:)-pf_nh(:,k-1,:,:))./(zf(:,k,:,:)-zf(:,k-1,:,:));
   dpp_hy_dz(:,k,:,:)=(pp_hy(:,k,:,:)-pp_hy(:,k-1,:,:))./(zf(:,k,:,:)-zf(:,k-1,:,:));
end
dpf_nh_dz(:,1,     :,:)=dpf_nh_dz(:,2,   :,:);
dpf_nh_dz(:,v.nz+1,:,:)=dpf_nh_dz(:,v.nz,:,:);
dpp_hy_dz(:,1,     :,:)=dpp_hy_dz(:,2,   :,:);
dpp_hy_dz(:,v.nz+1,:,:)=dpp_hy_dz(:,v.nz,:,:);
dpf_nh_dz =-0.5*(dpf_nh_dz(:,1:v.nz,:,:)+dpf_nh_dz(:,2:end,:,:))./rho;
dpp_hy_dz =-0.5*(dpp_hy_dz(:,1:v.nz,:,:)+dpp_hy_dz(:,2:end,:,:))./rho;
v.dpf_nh_dz=getavar(dpf_nh_dz, v,'3d');
v.dpp_hy_dz=getavar(dpp_hy_dz, v,'3d');
%%above attempt to compute buoyance as dpp/dz

%below compute horizontal gradient of perturbation hydrostatic pressure
a=pp_hy; dpp_hy_dx=a; dpp_hy_dy=a;
dpp_hy_dx(:,:,:,2:end)=(a(:,:,:,1:end-1)+a(:,:,:,2:end))/2;
dpp_hy_dx(:,:,:,1    )=(a(:,:,:,1)      +a(:,:,:,end)  )/2;
dpp_hy_dx(:,:,:,end+1)=dpp_hy_dx(:,:,:,1);
dpp_hy_dy(:,:,2:end,:)=(a(:,:,1:end-1,:)+a(:,:,2:end,:))/2;
dpp_hy_dy(:,:,1,    :)=(a(:,:,1,      :)+a(:,:,end,  :))/2;
dpp_hy_dy(:,:,end+1,:)=dpp_hy_dy(:,:,1,:);
dpp_hy_dx = diff(dpp_hy_dx,1,4)/v.dx;
dpp_hy_dy = diff(dpp_hy_dy,1,3)/v.dy;
dpp_hy_hor = dpp_hy_dx + dpp_hy_dy;
v.dpp_hy_hor = getavar(dpp_hy_hor,v,'3d');
%above compute horizontal gradient of perturbation hydrostatic pressure

%compute horizontal mass flux
urho=rho.*ua; a=urho;
urho(:,:,:,2:end)=(a(:,:,:,1:end-1)+a(:,:,:,2:end))/2;
urho(:,:,:,1    )=(a(:,:,:,1)      +a(:,:,:,end)  )/2;
urho(:,:,:,end+1)=urho(:,:,:,1);
vrho=rho.*va; a=vrho;
vrho(:,:,2:end,:)=(a(:,:,1:end-1,:)+a(:,:,2:end,:))/2;
vrho(:,:,1,    :)=(a(:,:,1,      :)+a(:,:,end,  :))/2;
vrho(:,:,end+1,:)=vrho(:,:,1,:);
mf_hdiv   = diff(urho,  1,4)/v.dx+diff(vrho,  1,3)/v.dy;
v.mf_hdiv = getavar(mf_hdiv,v,'3d');

%vertical integral of horizontal mass flux from surface
mf_hdiv_int=-mf_hdiv.*dz;
for k = v.nz-1:-1:1
   mf_hdiv_int(:,k,:,:)=mf_hdiv_int(:,k+1,:,:)-mf_hdiv(:,k,:,:).*dz(:,k,:,:);
end
mf_hdiv_int=mf_hdiv_int./rho;
%end of compute horizontal mass flux

%compute vertical mass flux
wrho=rho.*wa; a=wrho; 
wrho(:,2:end,:,:)=(a(:,1:end-1,:,:)+a(:,2:end,:,:))/2;
wrho(:,1,    :,:)=0; 
wrho(:,end+1,:,:)=0;
mf_vdiv   = -diff(wrho,  1,2)./dz; %up minus lower
v.mf_vdiv = getavar(mf_vdiv,v,'3d');
%end of compute vertical mass flux

%sorted updraft analysis
%cld_wall=updraft_ana()


do_cloud_field_analysis = 1;
if (do_cloud_field_analysis)
  id_cld = (qc>0) & (qa>0);
  a=buo; id=~(buo>0 & id_cld); a(id)=NaN; v.buo_cpos=getavar_smart(a,v,'3d',[0 1],pctile);
  a=buo; id=~(buo<0 & id_cld); a(id)=NaN; v.buo_cneg=getavar_smart(a,v,'3d',[0 1],pctile);
  a=qp;  id=~(buo>0 & id_cld); a(id)=NaN; v.qp_cpos =getavar_smart(a,v,'3d',[0 1],pctile);
  a=qp;  id=~(buo<0 & id_cld); a(id)=NaN; v.qp_cneg =getavar_smart(a,v,'3d',[0 1],pctile);
  a=qc;  id=~(id_cld);         a(id)=NaN; v.qc_cld=getavar_smart(a,v,'3d',[0 1],pctile);
  a=qa;  id=~(id_cld);         a(id)=NaN; v.qa_cld=getavar_smart(a,v,'3d',[0 1],pctile);

  a=ps;  a(:,:,:)=0; buo_int=a;
  a=buo; id=~(a>0); a(id)=0; a=a.*rho.*dz;
  for k = 1:v.nz
    buo_int(:,:,:)=buo_int(:,:,:)+squeeze(a(:,k,:,:));
  end
  v.buo_int= getavar(buo_int,v,'2d',pctile); 

  k=44;%lev=500hPa; 
  %k=49;%lev=600hPa;
  %k=55;%lev=700hPa;
  tvbin=[-2:0.1:2];a=squeeze(tvp(:,k,:,:));v.tvp500=getavar_smart(a,v,'2d',tvbin);tvp500=a;
  tabin=[-2:0.1:2];a=squeeze(tap(:,k,:,:));v.tap500=getavar_smart(a,v,'2d',tabin);tap500=a;
  bubin=[-2:0.1:2];a=squeeze(buo(:,k,:,:));v.buo500=getavar_smart(a,v,'2d',bubin);buo500=a;
  qcbin=[0.0003:0.0003:0.003];a=squeeze(qc(:,k,:,:));v.qc500=getavar_smart(a,v,'2d',qcbin);qc500=a;
  %id=qc500>0.0001;  figure; plot(buo500(id),w500(id),'.');
  a=buo500; id=~(a>0); a(id)=NaN; v.buo500_po=getavar_smart(a,v,'2d',bubin);
  a=tap500; id=~(a>0); a(id)=NaN; v.tap500_po=getavar_smart(a,v,'2d',tabin);
  a=tvp500; id=~(a>0); a(id)=NaN; v.tvp500_po=getavar_smart(a,v,'2d',tvbin);
  %id=~isnan(tvp500); id=(w500>1); figure; plot(buo500(id),w500(id),'.');
  %figure; plot(tap500(id),tvp500(id),'.'); plot(tvp500(id),buo500(id),'.');

  
  pms=[ 0, 0, 1200, 800]*1.5; row=4; col=3;
  handle = figure('Position', pms,'visible','on'); 
  xy=[1 128 100 1000]; t=2; y=2; co=[-30 30];
  z1=squeeze(wa       (t,:,y,:)); z2=squeeze(tdt_phy(t,:,y,:)); z3=squeeze(pf_nh  (t,:,y,:));
  z4=squeeze(dpf_nh_dz(t,:,y,:)); z5=squeeze(buo    (t,:,y,:)); z6=squeeze(tap    (t,:,y,:));
  z7=squeeze(mf_hdiv  (t,:,y,:)); z8=squeeze(mf_vdiv(t,:,y,:)); z9=z7+z8;
  z10=squeeze(pp_hy   (t,:,y,:)); z11=squeeze(dpp_hy_dz(t,:,y,:));
  z12=squeeze(dpp_hy_dx(t,:,y,:));
  z13=squeeze(dpp_hy_dy(t,:,y,:));z13=squeeze(ua(t,:,y,:));z13=squeeze(om(t,:,y,:));

  subplot(row,col,1);
  pcolor(v.x, v.pf0, z1); colorbar; shading flat; set(gca,'yDir','reverse'); axis(xy);
  title('w'); caxis([-1 1]);
  subplot(row,col,2);
  pcolor(v.x, v.pf0, z2); colorbar; shading flat; set(gca,'yDir','reverse'); axis(xy);
  title('tdt-phy'); caxis([-0.0001 0.0001]);
  subplot(row,col,3);
  pcolor(v.x, v.pf0, z3); colorbar; shading flat; set(gca,'yDir','reverse'); axis(xy);
  title('pf-nh'); %caxis([-50 50]);
  subplot(row,col,4);
  pcolor(v.x, v.pf0, z4); colorbar; shading flat; set(gca,'yDir','reverse'); axis(xy);
  title('dpf-nh-dz'); caxis([-0.02 0.02]);
  subplot(row,col,5);
  pcolor(v.x, v.pf0, z5); colorbar; shading flat; set(gca,'yDir','reverse'); axis(xy);
  title('buoyancy'); caxis([-0.05 0.05]);
  subplot(row,col,6);
  pcolor(v.x, v.pf0, z6); colorbar; shading flat; set(gca,'yDir','reverse'); axis(xy);
  title('\Delta T'); caxis([-2 2]);
  subplot(row,col,7);
  pcolor(v.x, v.pf0, z7); colorbar; shading flat; set(gca,'yDir','reverse'); axis(xy);
  title('hdiv'); %caxis([-2 2]);
  subplot(row,col,8);
  pcolor(v.x, v.pf0, z8); colorbar; shading flat; set(gca,'yDir','reverse'); axis(xy);
  title('vdiv'); %caxis([-2 2]);
  subplot(row,col,9);
  pcolor(v.x, v.pf0, z9); colorbar; shading flat; set(gca,'yDir','reverse'); axis(xy);
  title('hdiv+vdiv'); %caxis([-2 2]);
  subplot(row,col,10);
  pcolor(v.x, v.pf0, z10); colorbar; shading flat; set(gca,'yDir','reverse'); axis(xy);
  title('pp-hy'); %caxis([-2 2]);
  subplot(row,col,11);
  pcolor(v.x, v.pf0, z11); colorbar; shading flat; set(gca,'yDir','reverse'); axis(xy);
  title('dpp-hy-dz'); %caxis([-2 2]);
  subplot(row,col,11);
  pcolor(v.x, v.pf0, z12); colorbar; shading flat; set(gca,'yDir','reverse'); axis(xy);
  title('dpp-hy-dx'); caxis([-0.01 0.01]);
  subplot(row,col,12);
  pcolor(v.x, v.pf0, z1-z13/G); colorbar; shading flat; set(gca,'yDir','reverse'); axis(xy);
  title('ua'); caxis([-1 1]);
end
%Above analysis updraft dynamics%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

varn='strat_area_ice';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qa_ice = getavar(a,v,'3d'); qa_ice=a;
end

varn='strat_area_liq';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qa_liq = getavar(a,v,'3d'); qa_liq=a;
end

a=max(qa_ice,qa_liq); v.qa_tot=getavar(a,v,'3d'); qa_tot=a;
id=(qc>5E-6); a=qc; a(id)=1; v.qa_miz=getavar(a,v,'3d'); qa_miz=a;
%figure; plot(v.qa.avg,v.pf0);hold on;plot(v.qa_tot.avg,v.pf0,'g');plot(v.qa_miz.avg,v.pf0,'r');

varn='gb_strat_lwp';  fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.lwp = getavar(a*1000.,v,'2d');
end
varn='gb_strat_iwp';  fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.iwp = getavar(a*1000.,v,'2d');
end

varn='mf';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); mf=a;
  v.mf = getavar(a,v,'3d');
end


%conditional sampling of state variables
v.state_allt=csampling_state_allt(v,wa,rho,qc,qt,qv,ql,qi,qr,qs,qg,rh,ta,hli,...
				  mse,dse,thv,tvp,tap,mf,dthvdp,tdt_rd)

%TOA radiation========================
do_radiation = 0;
if (do_radiation)
  disp('Start of do_radiation: TOA radiation...');
  varn='olr';      fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);     
    v.toa.lwnet = getavar(a,v,'2d'); olr=a;
  end
  varn='olr_clr';      fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);     
    v.toa.lwnet_clr = getavar(a,v,'2d'); olr_clr=a;
  end
  a=olr_clr-olr; v.toa.lwcf=getavar(a,v,'2d'); lwcf_toa=a;
  
  varn='swdn_toa'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
    v.toa.swdn = getavar(a,v,'2d',[0]); swdn_toa=a;
  end
  varn='swup_toa'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
    v.toa.swup = getavar(a,v,'2d'); swup_toa=a;
  end
  varn='swup_toa_clr'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
    v.toa.swup = getavar(a,v,'2d'); swup_toa_clr=a;
  end

  a=swdn_toa-swup_toa;     v.toa.swnet=getavar(a,v,'2d'); swnet_toa=a;
  a=swup_toa_clr-swup_toa; v.toa.swcf =getavar(a,v,'2d'); swcf_toa =a;
  a=lwcf_toa + swcf_toa;   v.toa.ttcf =getavar(a,v,'2d'); ttcf_toa =a;

  varn='netrad_toa';  fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
    v.toa.netrad = getavar(a,v,'2d'); netradtoa=a;
  end

  disp('Surface radiation...');

  varn='swdn_sfc'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
    v.sfc.swdn = getavar(a,v,'2d'); swdn_sfc=a;
  end
  varn='swdn_sfc_clr'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
    v.sfc.swdn_clr = getavar(a,v,'2d'); swdn_sfc_clr=a;
  end
  varn='swup_sfc'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
    v.sfc.swup = getavar(a,v,'2d'); swup_sfc=a;
  end
  varn='swup_sfc_clr'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
    v.sfc.swup_clr = getavar(a,v,'2d'); swup_sfc_clr=a;
  end
  a=swdn_sfc    -swup_sfc;     v.sfc.swnet    =getavar(a,v,'2d'); swnet_sfc=a;
  a=swdn_sfc_clr-swup_sfc_clr; v.sfc.swnet_clr=getavar(a,v,'2d'); swnet_sfc_clr=a;
  a=swnet_sfc_clr-swnet_sfc;   v.sfc.swcf     =getavar(a,v,'2d'); swcf_sfc=a;

  varn='lwdn_sfc'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
    v.sfc.lwdn = getavar(a,v,'2d'); lwdn_sfc=a;
  end
  varn='lwdn_sfc_clr'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
    v.sfc.lwdn_clr = getavar(a,v,'2d'); lwdn_sfc_clr=a;
  end
  varn='lwup_sfc'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
    v.sfc.lwup = getavar(a,v,'2d',[0]); lwup_sfc=a;
  end
  varn='lwup_sfc_clr'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
    v.sfc.lwup_clr = getavar(a,v,'2d',[0]); lwup_sfc_clr=a;
  end
  a=lwdn_sfc     -lwup_sfc;     v.sfc.lwnet    =getavar(a,v,'2d'); lwnet_sfc=a;
  a=lwdn_sfc_clr -lwup_sfc_clr; v.sfc.lwnet_clr=getavar(a,v,'2d'); lwnet_sfc_clr=a;
  a=lwnet_sfc_clr-lwnet_sfc;    v.sfc.lwcf     =getavar(a,v,'2d'); lwcf_sfc=a;
  a=swnet_sfc    +lwnet_sfc;    v.sfc.netrad   =getavar(a,v,'2d'); netradsfc=a;
  a=netradsfc    -netradtoa;    v.atm.netrad   =getavar(a,v,'2d'); netradatm=a;
  disp('End of do_radiation: TOA radiation...');
end
do_sfc_cape_cin = 1
if (do_sfc_cape_cin)
  disp('start of do_sfc_cape_cin...');
  varn='cape_dyn';     fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
    v.cape_dyn = getavar(a,v,'2d',[0:100:3000 4000:1000:10000],pctile);
  end
  varn='cin_dyn';    fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
    v.cin_dyn = getavar(a,v,'2d',[0:50:1000 2000:1000:10000],pctile);
  end
  varn='tm';      fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);      
    v.tm = getavar(a,v,'2d');
  end
  varn='b_star';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
    v.sfc.bstar = getavar(a,v,'2d');
  end
  varn='t_ref';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);      
    v.sfc.tref = getavar(a,v,'2d');
  end
  varn='q_ref';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);      
    v.sfc.qref = getavar(a,v,'2d');
  end
  varn='rh_ref';  fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
  if (exist(fname,'file') == 2)
    f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
    v.sfc.rhref = getavar(a,v,'2d');
  end
  disp('end of do_sfc_cape_cin...');
end

do_fast='fast3'; %do_fast='none'; 
if strcmp(do_fast,'fast3')
  fn=strcat(opath,expn,'_',res,'_ins_',num2str(ts),'_',num2str(te),do_fast,'.mat');
  save(fn,'v','-v7.3'); return
end

%Below are for vertical fluxes================
%wrho=rho.*wa;      v.wrho = getavar(wrho,v,'3d');%verification for mf
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
%end of compute horizontal mass and qt flux==========
 
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
%end of compute vertical mass and qt flux===========
%============================================

%The following is not needed because they are identical to above offline calculation
% $$$ varn='wqt';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
% $$$ if (exist(fname,'file') == 2)
% $$$   f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
% $$$   v.wqt_dynn = getavar(a,v,'3d'); 
% $$$ end
varn='qtflx_dyn';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); 
  v.qtflx_dynn = getavar(a,v,'3d'); qtflx_dyn=a;
end
varn='qtflx_lin'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
   f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
   v.qtflx_linn = getavar(a,v,'3d'); qtflx_lin=a;
end
varn='rainflx'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
  v.rainflx = getavar(a,v,'3d'); rainflx=a;
end
varn='solpflx'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
  v.solpflx = getavar(a,v,'3d'); solpflx=a;
end
% $$$ varn='vtr'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
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

% $$$ varn='mse'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
% $$$ if (exist(fname,'file') == 2)
% $$$   f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
% $$$   v.mse1 = getavar(a,v,'3d'); %verification
% $$$ end

%Below are for tendencies=
%T tendencies=============
varn='tdt_dyn'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); tdt_dyn=a;
  v.tdt_dyn = getavar(a,v,'3d');
end

varn='tdt_ls'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f);
  v.tdt_ls = getavar(a,v,'3d'); tdt_ls=a;
end
varn='tdt_lin'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); tdt_lin=a;
  v.tdt_lin = getavar(a,v,'3d'); tdt_lin=a;
end
varn='tdt_phys'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); tdt_phy=a;
  v.tdt_phy = getavar(a,v,'3d');
end
varn='tdt_dif'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
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
varn='qtdt_dyn';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qtdt_dyn=a;
  v.qtdt_dyn = getavar(a,v,'3d');
end
varn='qtdt_phys'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qtdt_phy=a;
  v.qtdt_phy = getavar(a,v,'3d');
end
varn='qtdt_lin';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qtdt_lin=a;
  v.qtdt_lin = getavar(a,v,'3d');
end
varn='qtdt_dif';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
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
varn='qvdt_dyn';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qvdt_dyn=a;
  v.qvdt_dyn = getavar(a,v,'3d');
end
varn='qvdt_phys';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qvdt_phy=a;
  v.qvdt_phy = getavar(a,v,'3d');
end
varn='qvdt_lin';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qvdt_lin=a;
  v.qvdt_lin = getavar(a,v,'3d');
end
varn='qvdt_dif';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qvdt_dif=a;
  v.qvdt_dif = getavar(a,v,'3d');
else
  qvdt_dif=qvdt_phy-qvdt_lin; v.qvdt_dif = getavar(qvdt_dif,v,'3d');
end

%QL tendencies=============
varn='qldt_dyn';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qldt_dyn=a;
  v.qldt_dyn = getavar(a,v,'3d');
end
varn='qldt_phys';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qldt_phy=a;
  v.qldt_phy = getavar(a,v,'3d');
end
varn='qldt_lin';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qldt_lin=a;
  v.qldt_lin = getavar(a,v,'3d');
end
varn='qldt_dif';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qldt_dif=a;
  v.qldt_dif = getavar(a,v,'3d');
else
  qldt_dif=qldt_phy-qldt_lin; v.qldt_dif = getavar(qldt_dif,v,'3d');
end

%QI tendencies===============
varn='qidt_dyn';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qidt_dyn=a;
  v.qidt_dyn = getavar(a,v,'3d');
end
varn='qidt_phys';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qidt_phy=a;
  v.qidt_phy = getavar(a,v,'3d');
end
varn='qidt_lin';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qidt_lin=a;
  v.qidt_lin = getavar(a,v,'3d');
end
varn='qidt_dif';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
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



varn='prec_uws'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
  v.sfc.pcp_uws = getavar(a*LV0,v,'2d');
end

varn='prec_uwd'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
  v.sfc.pcp_uwd = getavar(a*LV0,v,'2d');
end

varn='prec_uwd'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
  v.sfc.pcp_uwd = getavar(a*LV0,v,'2d');
end

varn='cmf_uws'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); 
  v.cmf_uws = getavar(a,v,'3d');
end

varn='cmf_uwd'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); 
  v.cmf_uwd = getavar(a,v,'3d');
end

varn='hlflx_uwc'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); 
  v.hlflx_uwc = getavar(a,v,'3d');
end

varn='qtflx_uwc'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); 
  v.qtflx_uwc = getavar(a,v,'3d');
end

varn='qtflx_uwc'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); 
  v.qtflx_uwc = getavar(a,v,'3d');
end

v.start_time=start_time; v.end_time=clock; 
v.time_used_for_analysis=v.end_time-v.start_time;
fn=strcat(opath,expn,'_',res,'_ins_',num2str(ts),'_',num2str(te),'.mat');
save(fn,'v','-v7.3'); %save(fn,'v'); 

return

