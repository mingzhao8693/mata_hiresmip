function v=mjo_var(tpath,expn,yr1,yr2,nyr,latlon,region)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath ='/archive/Ming.Zhao/awg/warsaw/';
%expn='c96L33_am4p0_2010climo_rkm_dp1'; yr1='0002'; yr2='0011'; nyr=10;
%latlon=[0 360 -30 30]; region='tropics';
epath=strcat('/atmos_daily/');
fext=strcat('atmos.',yr1,'0101-',yr2,'1231.');%,varn,'.nc'); 
fn_static=strcat(tpath,expn,'/atmos.static.nc')
v=read_static(tpath,expn,fn_static, latlon); 
%set time perid
v.nyr=nyr; v.nday=365; v.nt=v.nyr*v.nday; 
v.ts=1; v.te=v.ts+v.nt-1;v

varn='olr'; fn=strcat(tpath,expn,epath,fext,varn,'.nc'); v.fn=fn
f=netcdf(fn,'nowrite'); varx=f{varn}(:,v.ys:v.ye,v.xs:v.xe); close(f);
varb=varx(v.ts:v.te,:,:); varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
v.olr=varana(varb,v)

varn='precip'; fn=strcat(tpath,expn,epath,fext,varn,'.nc'); v.fn=fn
f=netcdf(fn,'nowrite'); varx=f{varn}(:,v.ys:v.ye,v.xs:v.xe); close(f);
varb=varx(v.ts:v.te,:,:); varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
v.precip=varana(varb*86400,v)

%varn='u850'; fn=strcat(tpath,expn,epath,fext,varn,'.nc'); v.fn=fn
%f=netcdf(fn,'nowrite'); varx=f{varn}(:,v.ys:v.ye,v.xs:v.xe); close(f);
%varb=varx(v.ts:v.te,:,:); varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
%v.u850=varana(varb,v)

%varn='u200'; fn=strcat(tpath,expn,epath,fext,varn,'.nc'); v.fn=fn
%f=netcdf(fn,'nowrite'); varx=f{varn}(:,v.ys:v.ye,v.xs:v.xe); close(f);
%varb=varx(v.ts:v.te,:,:); varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
%v.u200=varana(varb,v)

fn=strcat(tpath,expn,'/',expn,'_',region,'_varana.mat');
save(fn,'v','-v7.3'); %save very large files

return

tpath ='/archive/Ming.Zhao/awg/verona/';
latlon=[0 360 -30 30]; region='tropics';
expn='AM4.0'; yr1='1980'; yr2='2014'; nyr=35;
v=mjo_var(tpath,expn,yr1,yr2,nyr,latlon,region)
expn='AM3.0'; yr1='1980'; yr2='2014'; nyr=35;
v=mjo_var(tpath,expn,yr1,yr2,nyr,latlon,region)






clm=squeeze(mean(varb,2));
for d=1:v.nday
  for y=1:v.nyr
    anom(d,y,:,:)=squeeze(varb(d,y,:,:))-squeeze(clm(d,:,:));
  end
end
%put var and ano back to daily continuous date (nday,nlat,nlon)
org=reshape(varb,v.nt,v.nlat,v.nlon);
ano=reshape(anom,v.nt,v.nlat,v.nlon); 
%band filtering
dd1=20; dd2=100; 
for j=1:v.nlat; v.lat(j)
  for i=1:v.nlon
    x=squeeze(ano(:,j,i));
    x=mybandpass(x,dd1,dd2);
    ano_iso(:,j,i)=x';
  end
end

for j=1:v.nlat
  for i=1:v.nlon
    tmp=squeeze(ano(:,j,i));  
    v.var_org(j,i)=var(tmp);
    tmp=squeeze(ano_iso(:,j,i));
    v.var_iso(j,i)=var(tmp);
  end
end

return

figure; pcolor(v.lon,v.lat,v.olr. var_org); shading flat; colorbar;
figure; pcolor(v.lon,v.lat,v.var_iso); shading flat; colorbar;

figure; pcolor(v.lon,v.lat,v.var_iso./v.var_org); shading flat; colorbar;

tpath ='/archive/Ming.Zhao/awg/ulm_201505/';
expn='c96L32_am4g10r3_2000climo'; yr1='0002'; yr2='0011'; nyr=10;
latlon=[0 360 -10 5];
varn='precip'; v.pcp=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,varn)
varn='olr';    v.olr=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,varn)

s=v.pcp.ind;
figure; vbin=[-0.8:0.1:0.8];
[C,h]=contourf(v.lon,s.ndd,s.corr_org_avg,vbin);shading flat; colorbar; %clabel(C,h)
figure; v.vbin=[-0.8:0.1:0.8];
[C,h]=contourf(v.lon,s.ndd,s.corr_iso_avg,vbin);shading flat; colorbar; %clabel(C,h)

tpath ='/archive/Ming.Zhao/mdt/20160322/';
expn='CM4_c96L32_am4g10r8_2000_mjoanalysis'; yr1='1981'; yr2='2000'; nyr=20;
latlon=[0 360 -10 5];
varn='precip'; v.pcp=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,varn)
varn='olr';    v.olr=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,varn)

tpath ='/archive/Ming.Zhao/mdt/20160322/';
expn='CM4_c96L32_am4g10r3_2000_OMp5_lmix_H5_nmle_ndiff_meke_KHTH200';
yr1='0001'; yr2='0020'; nyr=20;
latlon=[0 360 -10 5];
varn='precip'; v.pcp=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,varn)
varn='olr';    v.olr=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,varn)

tpath ='/archive/Ming.Zhao/awgom2/ulm_201505/';
expn='AM4OM2F_c96l32_am4g9_2000climo';
yr1='0001'; yr2='0020'; nyr=20;
latlon=[0 360 -10 5];
varn='precip'; v.pcp1=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,varn)
varn='olr';    v.olr1=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,varn)

tpath ='/archive/Ming.Zhao/awgom2/ulm_201505/';
expn='HIRAMOM2F_c96L32_DPCg10r8_2000climo';
yr1='0001'; yr2='0020'; nyr=20;
latlon=[0 360 -10 5];
varn='precip'; v.pcp1=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,varn)
varn='olr';    v.olr1=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,varn)

s=v.pcp1; s=v.olr1;
s.vbin=[-0.8:0.1:0.8];
figure; [C,h]=contourf(s.lon,s.ndd,s.corr_avg,s.vbin); 
shading flat; colorbar; %clabel(C,h)
figure; [C,h]=contourf(s.lon,s.ndd,s.corr_iso_avg,s.vbin); 
shading flat; colorbar; %clabel(C,h)



s=v.pcp1; t1=1; t2=9;
s.vbin=[-0.8:0.1:0.8]; 
yorg=squeeze(mean(s.corr    (t1:t2,:,:),1));
yiso=squeeze(mean(s.corr_iso(t1:t2,:,:),1));
figure; [C,h]=contourf(s.lon,s.ndd,yorg,s.vbin); caxis([-0.8 0.8]);
shading flat; colorbar; %clabel(C,h)
figure; [C,h]=contourf(s.lon,s.ndd,yiso,s.vbin); 
shading flat; colorbar; %clabel(C,h)





tpath ='/archive/Ming.Zhao/awg/tikal_201403/'; 
latlon=[0 360 -10 5]; yr1='0001'; yr2='0020';
expn='CM4_C192L48_FLOR_1990_ctrl';
varn='olr';          v.olr    =mjo_ana(tpath, expn, yr1, yr2, latlon, varn)
varn='precip';       v.pcp    =mjo_ana(tpath, expn, yr1, yr2, latlon, varn)
varn='hmint_uwc';    v.hmint  =mjo_ana(tpath, expn, yr1, yr2, latlon, varn)
varn='hm_tot0_uwc';  v.hm_tot0=mjo_ana(tpath, expn, yr1, yr2, latlon, varn)
varn='hm_total_uwc'; v.hm_tot1=mjo_ana(tpath, expn, yr1, yr2, latlon, varn)
varn='hm_hadv0_uwc'; v.hm_hadv=mjo_ana(tpath, expn, yr1, yr2, latlon, varn)

s=v.pcp; s=v.olr
s=v.hmint; s=v.hm_tot0; s=v.hm_hadv;
s.vbin=[-0.8:0.1:0.8];
figure; [C,h]=contourf(s.lon,s.ndd,s.corr0,s.vbin); colorbar; clabel(C,h)

figure; 
plot(v.hm_tot0.olr_ano(:,50),'r*-'); hold on;
plot(v.hm_tot1.olr_ano(:,50),'bs-');
 

o=v.hmint; o=v.olr; o.vbin=[-0.8:0.1:0.8];
figure;
[C,h]=contourf(o.lon,o.nday,o.corr0,o.vbin); colorbar;
clabel(C,h)







tpath ='/archive/Ming.Zhao/awg/siena_201211/';
expn='CM.c180L48_awgp1d_B_2000_ctrl';

nyr=20;
for yr=1:nyr
  year=sprintf('%04d',yr)
  v(yr)=mjo_ana(tpath, expn, year)
end

corr=v(1).corr;
for yr=2:nyr
  corr = corr+v(yr).corr;
end

corr=corr/nyr;
figure; contourf(v(1).lon,v(1).nday,corr); colorbar;


tmp=(v(1).corr+v(2).corr+v(3))/2



figure; contourf(v.lon,v.nd,v.corr)


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


