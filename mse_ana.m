function v=mse_ana(mpath, expn, mod)

[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath ='/archive/miz/awg/tikal_201403/';
expn='c96L48_am4a1_mz';
epath ='/gfdl.ncrc2-intel-prod-openmp/pp/atmos/ts/daily/5yr/';

latlon=[0 360 -5 5]; 
varn='rh'; fext=strcat('atmos.19810101-19851231.',varn,'.nc'); 
fname=strcat(tpath,expn,epath,fext)
v=readts_grid(tpath,expn,fname, latlon);

varn='hm_tot0_uwc'; fext=strcat('atmos.19810101-19851231.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext)
f=netcdf(fn,'nowrite'); 
v.dhm_tot0=f{varn}(:,v.ys:v.ye,v.xs:v.xe); close(f); 

varn='hm_total_uwc'; fext=strcat('atmos.19810101-19851231.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext)
f=netcdf(fn,'nowrite'); 
v.dhm_tot1=f{varn}(:,v.ys:v.ye,v.xs:v.xe); close(f); 

varn='hm_vadv0_uwc'; fext=strcat('atmos.19810101-19851231.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext)
f=netcdf(fn,'nowrite'); 
v.dhm_vadv=f{varn}(:,v.ys:v.ye,v.xs:v.xe); close(f); 

varn='hm_hadv0_uwc'; fext=strcat('atmos.19810101-19851231.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext)
f=netcdf(fn,'nowrite'); 
v.dhm_hadv=f{varn}(:,v.ys:v.ye,v.xs:v.xe); close(f); 

varn='tdt_rad_int'; fext=strcat('atmos.19810101-19851231.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext)
f=netcdf(fn,'nowrite'); 
v.dhm_rad=f{varn}(:,v.ys:v.ye,v.xs:v.xe); close(f); 

varn='tdt_dif_int'; fext=strcat('atmos.19810101-19851231.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext)
f=netcdf(fn,'nowrite'); 
v.dhm_tdt_dif=f{varn}(:,v.ys:v.ye,v.xs:v.xe); close(f); 

varn='qdt_dif_int'; fext=strcat('atmos.19810101-19851231.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext)
f=netcdf(fn,'nowrite'); 
v.dhm_qdt_dif=f{varn}(:,v.ys:v.ye,v.xs:v.xe); close(f); 

varn='ddp_dyn_int'; fext=strcat('atmos.19810101-19851231.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext)
f=netcdf(fn,'nowrite'); 
v.dhm_ddp_dyn=f{varn}(:,v.ys:v.ye,v.xs:v.xe); close(f); 

v.dhm_tot2=v.dhm_hadv+v.dhm_vadv+v.dhm_rad+v.dhm_tdt_dif+v.dhm_qdt_dif+v.dhm_ddp_dyn;

figure;
plot(v.dhm_tot0(:,1,1),'r*-'); hold on; 
plot(v.dhm_tot1(:,1,1),'gs-');
plot(v.dhm_tot2(:,1,1),'bo-');


varn='hmint_uwc'; fext=strcat('atmos.19810101-19851231.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext)
f=netcdf(fn,'nowrite'); 
v.hmint=f{varn}(:,v.ys:v.ye,v.xs:v.xe); close(f); 

figure; contourf(squeeze(v.hmint(1,:,:)),20); %caxis([299 305]);


figure; contourf(squeeze(v.hmint(1,:,:)))

v.hm_vadv0=f{'hm_vadv0_uwc'}(:,:,:); 
v.hm_hadv0=f{'hm_hadv0_uwc'}(:,:,:); 
v.tdt_rad0=f{'tdt_rad_int'} (:,:,:); figure; contourf(squeeze(v.tdt_rad0(1,:,:)))
v.tdt_dyn0=f{'tdt_dyn_int'} (:,:,:); figure; contourf(squeeze(v.tdt_dyn0(1,:,:)))
v.tdt_dif0=f{'tdt_dif_int'} (:,:,:); figure; contourf(squeeze(v.tdt_dif0(1,:,:)))
v.evap     =f{'evap'}       (:,:,:)*LV0; 
v.shflx    =f{'shflx'}      (:,:,:);
v.shflx_uwc=f{'shflx_uwc'}  (:,:,:); 
v.lhflx_uwc=f{'lhflx_uwc'}  (:,:,:); 

figure; contourf(squeeze(v.shflx(1,:,:)))
figure; contourf(squeeze(v.shflx_uwc(1,:,:)))

figure; 
contourf(squeeze(v.tdt_dif0(1,:,:)-v.shflx_uwc(1,:,:)),100);caxis([-2 2]);
colorbar;

v.olr     =f{'olr'}         (:,:,:); 
v.swup_toa=f{'swup_toa'}    (:,:,:); 
v.swdn_toa=f{'swdn_toa'}    (:,:,:); 
v.swup_sfc=f{'swup_sfc'}    (:,:,:); 
v.swdn_sfc=f{'swdn_sfc'}    (:,:,:); 
v.lwup_sfc=f{'lwup_sfc'}    (:,:,:); 
v.lwdn_sfc=f{'lwdn_sfc'}    (:,:,:); 
v.netradtoa=v.olr+v.swup_toa-v.swdn_toa;                 %positive up
v.netradsfc=v.lwup_sfc-v.lwdn_sfc+v.swup_sfc-v.swdn_sfc; %positive up
v.netradatm=v.netradtoa-v.netradsfc; 
v.precip   =f{'precip'}     (:,:,:)*LV0; 
v.prec_conv=f{'prec_conv'}  (:,:,:)*LV0; 

v.qvdt_uwc =f{'qdt_uwc'}    (:,:,:);
v.qldt_uwc =f{'qldt_uwc'}   (:,:,:);
v.qidt_uwc =f{'qidt_uwc'}   (:,:,:);
v.qtdt_uwc =v.qvdt_uwc+v.qldt_uwc++v.qidt_uwc;
v.qtflx   =f{'qtflx_uwc'}   (:,:,:);
v.pflx    =f{'pflx_uwc'}    (:,:,:);
v.qtflx_up=f{'qtflx_up_uwc'}(:,:,:);
v.qtflx_dn=f{'qtflx_dn_uwc'}(:,:,:);

v.snow3d    =f{'lscale_snow3d'}(:,:,:);
v.rain3d    =f{'lscale_rain3d'}(:,:,:);
v.qtflx_vdif=f{'qtflx_vdif'}   (:,:,:);
v.prec3d=v.rain3d+v.snow3d;

v.qtdt_uwc0  =squeeze(mean(mean(v.qtdt_uwc,  3),2));
v.pflx0      =squeeze(mean(mean(v.pflx,      3),2));
v.prec3d0    =squeeze(mean(mean(v.prec3d,    3),2));
v.qtflx0     =squeeze(mean(mean(v.qtflx,     3),2));
v.qtflx_up0  =squeeze(mean(mean(v.qtflx_up,  3),2));
v.qtflx_dn0  =squeeze(mean(mean(v.qtflx_dn,  3),2));
v.qtflx_vdif0=squeeze(mean(mean(v.qtflx_vdif,3),2));
v.qtflx_ls0  =v.qtflx_up0+v.qtflx_dn0;

v.prec3d_all0=v.prec3d0(1:end-1)+cumsum(v.pflx0);
v.qtflx_all0=v.qtflx0+v.qtflx_ls0+v.qtflx_vdif0;
figure;
plot(v.qtflx0     *LV0,v.pf,'r'); hold on;
plot(v.qtflx_up0  *LV0,v.pf,'g'); hold on;
plot(v.qtflx_dn0  *LV0,v.pf,'b'); hold on;
plot(v.qtflx_ls0  *LV0,v.pf,'k'); hold on;
plot(v.qtflx_vdif0*LV0,v.pf,'c'); hold on;
plot(v.qtflx_all0 *LV0,v.pf,'m'); hold on;
plot(v.prec3d0(1:end-1)*LV0,v.pf,'y'); hold on;
plot(v.prec3d_all0*LV0,v.pf,'k--'); hold on;
set(gca,'YDir','reverse');

figure;
plot(v.qtdt_uwc0(1:end-1).*diff(v.pf)*100/G,v.pf(1:end-1),'r'); hold on;
plot(diff(v.qtflx0)-v.pflx0(1:end-1),       v.pf(1:end-1),'b'); 
set(gca,'YDir','reverse');


figure; 
plot(diff(v.qtflx0),v.pf(1:end-1),'r'); hold on; 
plot(v.pflx0,v.pf,'b'); hold on; 
set(gca,'YDir','reverse');

figure;
plot(diff(v.qtflx0)'./diff(v.pf),v.pf(1:end-1),'r'); hold on; 
plot(v.pflx0,v.pf,'b'); hold on; 

plot(v.qtflx_e0,v.pf,'b'); 


figure; plot(v.qtdt_uwc0,v.pf);
set(gca,'YDir','reverse');

mean(mean(mean(v.netradatm)))
mean(mean(mean(v.tdt_rad0)))
mean(mean(mean(v.shflx)))
mean(mean(mean(v.shflx_uwc)))
mean(mean(mean(v.evap)))
mean(mean(mean(v.lhflx_uwc)))
mean(mean(mean(v.precip)))
mean(mean(mean(v.prec_conv)))

figure; pcolor(-v.netradatm); shading flat; colorbar; caxis([-160 -80]);
figure; pcolor(v.tdt_rad0);   shading flat; colorbar; caxis([-160 -80]);
figure; pcolor(v.shflx);     shading flat; colorbar; caxis([1 12]);
figure; pcolor(v.shflx_uwc); shading flat; colorbar; caxis([1 12]);
figure; pcolor(v.evap);      shading flat; colorbar; caxis([90 170]);
figure; pcolor(v.lhflx_uwc); shading flat; colorbar; caxis([90 170]);
figure; pcolor(v.hm_hadv0);  shading flat; colorbar; caxis([90 170]);
figure; pcolor(v.hm_vadv0);  shading flat; colorbar;
figure; pcolor(v.hmint);  shading flat; colorbar;

figure; pcolor(v.lhflx_uwc-v.evap);  shading flat; colorbar; caxis([-1 1]);
figure; pcolor(v.evap);  shading flat; colorbar; caxis([-1 1]);
figure; pcolor(v.shflx_uwc-v.shflx); shading flat; colorbar; caxis([-1 1]);

v.qv=f{'sphum'}(:)*1000; v.rh=f{'rh'}(:);
v.qa=f{'cld_amt'}(:); v.ql=f{'liq_wat'}(:)*1000; v.qi=f{'ice_wat'}(:)*1000;
v.qc=v.ql+v.qi;
v.qdt_ls =f{'qdt_ls'}(:)*86400*1000; 
v.qdt_vd =f{'qdt_vdif'}(:)*86400*1000; 
v.mf=f{'mc_full'}(:);
v.precip=f{'precip'}(:)*LV0; 
v.prec_cv=f{'prec_conv'}(:)*LV0; 
v.prec_ls=f{'prec_ls'}(:)*LV0; v.frac_ls=v.prec_ls/v.precip;
v.evap=f{'evap'}(:)*LV0; v.shflx=f{'shflx'}(:); 
if (strcmp(mod,'dpc') | strcmp(mod,'hiram') )
  v.mf_uwc=f{'cmf_uwc'}(:); 
  v.qdt_pevap_uwc=f{'qdt_pevap_uwc'}(:)*86400*1000; 
  v.qdt_uwc=f{'qdt_uwc'}(:)*86400*1000; 
  v.qldt_uwc=f{'qldt_uwc'}(:)*86400*1000; 
  v.qidt_uwc=f{'qidt_uwc'}(:)*86400*1000; 
  v.qtdt_uwc=v.qdt_uwc+v.qldt_uwc+v.qidt_uwc;
  v.prec_uwc=f{'prec_uwc'}(:)*LV0; 
  if (strcmp(mod,'dpc'))
    v.mf_uwd=f{'cmf_uwd'}(:); v.mf_uws=v.mf_uwc-v.mf_uwd;
    v.qdt_pevap_uwd=f{'qdt_pevap_uwd'}(:)*86400*1000; 
    v.qdt_pevap_uws=v.qdt_pevap_uwc-v.qdt_pevap_uwd;
    v.qdt_uwd=f{'qdt_uwd'}(:)*86400*1000; 
    v.qdt_uws=v.qdt_uwc-v.qdt_uwd;
    v.qdt_tt =v.qdt_ls+v.qdt_vd+v.qdt_uwc;
    v.qldt_uwd=f{'qldt_uwd'}(:)*86400*1000; 
    v.qldt_uws=v.qldt_uwc-v.qldt_uwd;
    v.qidt_uwd=f{'qidt_uwd'}(:)*86400*1000; 
    v.qidt_uws=v.qidt_uwc-v.qidt_uwd;
    v.qtdt_uwd=v.qdt_uwd+v.qldt_uwd+v.qidt_uwd;
    v.qtdt_uws=v.qdt_uws+v.qldt_uws+v.qidt_uws;
    v.prec_uwd=f{'prec_uwd'}(:)*LV0; 
  end
end
close(f)
return
