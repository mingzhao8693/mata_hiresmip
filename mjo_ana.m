function v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)
%varlist (2D)=======================
%standard prep wind:: precip u850 u200
%standard cloud:: precip LWP IWP WVP low_cld_amt mid_cld_amt high_cld_amt tot_cld_amt
%standard rad toa:: olr swdn_toa swup_toa olr_clr swdn_toa_clr swup_toa_clr
%standard rad sfc:: lwdn_sfc lwup_sfc swdn_sfc swup_sfc lwdn_sfc_clr lwup_sfc_clr swdn_sfc_clr swup_sfc_clr
%standard eng sfc:: shflx evap shflx_uwc lhflx_uwc 
%MSE state total tend:: hf_beg hf_end dhf hfint0 hintn0 hdt_sum_int0 hdt_tot_int hdt_ver_int
%MSE due to T::  tdt_rad_int0 tdt_dyn_int0 tdt_dif_int0 
%MSE due to Q::  qvdt_dyn_int0 qvdt_dif_int0
%MSE due to gz:: dgz_dyn_int0 dgz_phy_int0 hdt_dgz_int
%MSE due to dyn::  hdt_vadv_int0 hdt_hadv_int0 hdt_dgz_adj
%MSE due to mass::  hdp_dyn_int0 hdt_ddp_int hdt_adj_int 
%varlist (3D)========================
%standard T,Q,cloud,p:: temp sphum cld_amt liq_wat ice_wat rh 
%standard winds:: ucomp vcomp omega mc_full z_full 
%MSE state total tendency:: hfint hfintn hdt_sum_int
%MSE due to dynamics:: hdt_vadv_int hdt_hadv_int hdp_dyn_int tdt_dyn_int qvdt_dyn_int 
%MSE due to gz::       dgz_dyn_int dgz_phy_int 
%MSE due to diffusion:: tdt_dif_int qvdt_dif_int
%MSE due to radiation:: tdt_rad_int hdt_forc_int  
%MSE due to convection:: tdt_conv_int qdt_conv_int hdt_conv_int 
%varlist end========================
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath ='/archive/Ming.Zhao/awg/verona/';
%latlon=[38.75 181.25 -21.5 21.5]; region='iowpac'; 
%latlon=[40 120 -10 5]; region='iowpac';
%latlon=[0  360 -10 5]; region='global';
%expn='AM4.0';yr1='1981'; yr2='2014'; nyr=34;
%expn='c96L32_am4g10r8_2010climo_mse1';   yr1='0002'; yr2='0010'; nyr=9;
%expn='c96L32_am4g10r8_2010climo_mse3';   yr1='0002'; yr2='0009'; nyr=8;
%expn='c96L32_am4g11r11_2010climo_mse';   yr1='0002'; yr2='0021'; nyr=20;
%tpath ='/archive/Ming.Zhao/mdt/20161026/';
%latlon=[38.75 181.25 -21.5 21.5]; region='iowpac';
%expn='CM4_c96L32_am4g10r8_2010_OMp5_mse';yr1='0002'; yr2='0019'; nyr=18;
%tpath ='/archive/Ming.Zhao/mdt/20161028/';
%latlon=[38.75 181.25 -21.5 21.5]; region='iowpac';
%expn='CM4_c96L32_am4g10r8_2010_OMp5_ePBL2_mjo_mse1';yr1='0001'; yr2='0020'; nyr=20;
%tpath ='/archive/Ming.Zhao/mdt/20161108/';
%latlon=[38.75 181.25 -21.5 21.5]; region='iowpac';
%expn='CM4_c96L32_am4g10r8_2010_OMp5_ePBL2_mjo_mse3';yr1='0001'; yr2='0020'; nyr=20;
%tpath ='/archive/Ming.Zhao/awg/verona/';
%latlon=[38.75 181.25 -21.5 21.5]; region='iowpac';
%expn='AM3';yr1='1981'; yr2='2007'; nyr=27;
%tpath ='/archive/Ming.Zhao/awg/warsaw/';
%latlon=[0 360 -15 0]; region='gtrop';
%expn='c96L33_am4p0_m1';yr1='1980'; yr2='2014'; nyr=34;

%define 3 important regions
%latlon   =[0  360 -10 10]; %definition of tropical analysis region
io_latlon=[75 100 -10 5];  %definition of IO
lat1=-6.5; lat2=6.5;       %definition of equatorial region

epath ='/atmos_daily/'; varn='precip';
fext=strcat('atmos.',yr1,'0101-',yr2,'1231.'); 
fname=strcat(tpath,expn,epath,fext,varn,'.nc')
v=readts_grid(tpath,expn,fname, latlon); v.fname=fname
v.nyr=nyr; v.nday=365; v.nt=v.nyr*v.nday; v.ts=1; v.te=v.nt;

varn='precip'; fn=strcat(tpath,expn,epath,fext,varn,'.nc'); 
varb=readvar(varn,fn,v,'2d','no')*86400;
% $$$ a=mean(mean(varb,4),3); b=reshape(a,365*34,1); figure; plot(b(1:730));
% $$$ for n=1:33;
% $$$   t1(n)=n*10*30+1;         t2(n)=t1(n)+30*6; %Nov-to-Apr, 6mon after Nov 1
% $$$   t3(n)=(n-1)*365+10*30+1; t4(n)=t3(n)+30*6; %Nov-to-Apr, 6mon after Nov 1
% $$$   c1(n,:)=b(t1(n):t2(n));
% $$$   c2(n,:)=b(t3(n):t4(n));
% $$$ end
% $$$ figure; d1=1; d2=12000; d=[d1:1:d2];
% $$$ plot(d/365,b(d1:d2),'-b*'); hold on;
% $$$ for n=1:10
% $$$ % plot([t1(n):t2(n)]/365,c1(n,:),'-gs');
% $$$  plot([t3(n):t4(n)]/365,c2(n,:),'-rd');
% $$$ end
v.io.pcp=get_iso_reg(varb,v,io_latlon,0);
event=v.io.pcp.event; v.lgd=v.io.pcp.lgd; v.event=event;
v.io.pcp=get_iso_reg(varb,v,io_latlon,1,event);
v.pcp=lagregress(varb,v,latlon,lat1,lat2,v.io.pcp,0);
%figure; contourf(v.lon,v.lgd,v.pcp.lagslop.org_avg',20); shading flat; caxis([-3 3]);colorbar;
%figure; contourf(v.lon,v.lgd,v.pcp.lagcorr.iso_avg',20); shading flat; caxis([-0.8 0.8]);colorbar;
%figure; plot(v.lgd,v.io.pcp.comp_iso_avg,'k-*');

varn='olr'; fn=strcat(tpath,expn,epath,fext,varn,'.nc'); 
varb=readvar(varn,fn,v,'2d','no');
v.io.olr=get_iso_reg(varb,v,io_latlon,0);
v.olr=lagregress(varb,v,latlon,lat1,lat2,v.io.olr,0);

varn='u200'; fn=strcat(tpath,expn,epath,fext,varn,'.nc'); 
varb=readvar(varn,fn,v,'2d','no');
v.io.u200=get_iso_reg(varb,v,io_latlon,0);
v.u200=lagregress(varb,v,latlon,lat1,lat2,v.io.u200,0);

varn='u850'; fn=strcat(tpath,expn,epath,fext,varn,'.nc');
varb=readvar(varn,fn,v,'2d','no');
v.io.u850=get_iso_reg(varb,v,io_latlon,0);
v.u200=lagregress(varb,v,latlon,lat1,lat2,v.io.u850,0);

fn=strcat(tpath,expn,'/',expn,'_',region,'_lagreg.mat');fn
save(fn,'v','-v7.3'); 
return %could be stop here for simple analysis

varn='ps'; varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
v.io.ps=get_iso_reg(varb,v,1,event); 
v.ps=lag_regress(varb,v,v.io.pcp,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2D fields
%%dhf=hdt_tot_int=hdt_sum_int +hdt_dgz_adj
%%hdt_sum_int=hdt_dyn_int +tdt_rad_int+tdt_dif_int+qvdt_dif_int
%%hdt_dyn_int=hdt_adv_int +hdp_dyn_int
%%hdt_adv_int=hdt_hadv_int+hdt_vadv_int
%varn='hf_beg'; varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
%v.io.hf_beg=get_iso_reg(varb,v,1,event); 
%varn='hf_end'; varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
%v.io.hf_end=get_iso_reg(varb,v,1,event); 
%varn='dhf'; varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
%v.io.dhf=get_iso_reg(varb,v,1,event); 
varn='hfint0'; varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
v.io.hfint0=get_iso_reg(varb,v,1,event); 
v.hfint0=lag_regress(varb,v,v.io.pcp,1);

varn='dpint0'; varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
v.io.dpint0=get_iso_reg(varb,v,1,event); 
v.dpint0=lag_regress(varb,v,v.io.pcp,1)
varn='hdt_tot_int';   varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
v.io.hdt_tot_int=get_iso_reg(varb,v,1,event); 
v.hdt_tot_int=lag_regress(varb,v,v.io.pcp,1)
varn='hdt_sum_int0';  varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');varb1=varb;
v.io.hdt_sum_int0=get_iso_reg(varb,v,1,event); 
varn='hdt_dgz_adj';   varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');varb2=varb;
v.io.hdt_dgz_adj=get_iso_reg(varb,v,1,event); 
v.hdt_dgz_adj=lag_regress(varb,v,v.io.pcp,1);
varb=varb1+varb2; v.io.hdt_net_int=get_iso_reg(varb,v,1,event); 
v.hdt_net_int=lag_regress(varb,v,v.io.pcp,1)

varn='hdt_ddp_int0'; varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
v.io.hdt_ddp_int0=get_iso_reg(varb,v,1,event); 
v.hdt_ddp_int0=lag_regress(varb,v,v.io.pcp,1)
varn='hdt_dgz_int0'; varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
v.io.hdt_dgz_int0=get_iso_reg(varb,v,1,event); 
v.hdt_dgz_int0=lag_regress(varb,v,v.io.pcp,1)
varn='hdt_adj_int0'; varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
v.io.hdt_adj_int0=get_iso_reg(varb,v,1,event); 
v.hdt_adj_int0=lag_regress(varb,v,v.io.pcp,1)
varn='ddp_phy_int0'; varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
v.io.ddp_phy_int0=get_iso_reg(varb,v,1,event); 
v.ddp_phy_int0=lag_regress(varb,v,v.io.pcp,1)
varn='ddp_dyn_int0';  varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
v.io.ddp_dyn_int0=get_iso_reg(varb,v,1,event); 
v.ddp_dyn_int0=lag_regress(varb,v,v.io.pcp,1);

%figure; x=v.lgd;
%y1=v.io.ddp_phy_int0.comp_iso_avg; plot(x,y1,'r*-'); hold on; 
%y2=v.io.ddp_dyn_int0.comp_iso_avg; plot(x,y2,'bs-');
%plot(x,y1+y2,'g-'); grid on;

varn='hdt_hadv_int0'; varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
v.io.hdt_hadv_int0=get_iso_reg(varb,v,1,event); 
v.hdt_hadv_int0=lag_regress(varb,v,v.io.pcp,1);
varn='hdt_vadv_int0'; varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
v.io.hdt_vadv_int0=get_iso_reg(varb,v,1,event); 
v.hdt_vadv_int0=lag_regress(varb,v,v.io.pcp,1);
varn='hdp_dyn_int0';  varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
v.io.hdp_dyn_int0=get_iso_reg(varb,v,1,event); 
v.hdp_dyn_int0=lag_regress(varb,v,v.io.pcp,1);
varn='tdt_rad_int0';  varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
v.io.tdt_rad_int0=get_iso_reg(varb,v,1,event); 
v.tdt_rad_int0=lag_regress(varb,v,v.io.pcp,1);
varn='tdt_dif_int0';  varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
v.io.tdt_dif_int0=get_iso_reg(varb,v,1,event); 
v.tdt_dif_int0=lag_regress(varb,v,v.io.pcp,1);
varn='qvdt_dif_int0'; varb=readvar(varn,tpath,expn,epath,fext,v,'2d','no');
v.io.qvdt_dif_int0=get_iso_reg(varb,v,1,event); 
v.qvdt_dif_int0=lag_regress(varb,v,v.io.pcp,1);

varn='ucomp'; fn=strcat(tpath,expn,epath,fext,varn,'.nc'); k1=19; k2=22;
f=netcdf(fn,'nowrite'); varb=f{varn}(v.ts:v.te,k1:k2,v.ys:v.ye,v.xs:v.xe);
varb=squeeze(mean(varb,2)); varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
v.io.u700=get_iso_reg(varb,v,1,event); 
v.u700=lag_regress(varb,v,v.io.pcp,1);

varn='vcomp'; fn=strcat(tpath,expn,epath,fext,varn,'.nc'); k1=19; k2=22;
f=netcdf(fn,'nowrite'); varb=f{varn}(v.ts:v.te,k1:k2,v.ys:v.ye,v.xs:v.xe);
varb=squeeze(mean(varb,2)); varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
v.io.v700=get_iso_reg(varb,v,1,event); 
v.v700=lag_regress(varb,v,v.io.pcp,1);

varn='sphum'; fn=strcat(tpath,expn,epath,fext,varn,'.nc'); k1=19; k2=22;
f=netcdf(fn,'nowrite'); varb=f{varn}(v.ts:v.te,k1:k2,v.ys:v.ye,v.xs:v.xe);
varb=squeeze(mean(varb,2)); varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
v.io.qv700=get_iso_reg(varb,v,1,event); 
v.qv700=lag_regress(varb,v,v.io.pcp,1);

varn='hfintn'; fn=strcat(tpath,expn,epath,fext,varn,'.nc'); 
f=netcdf(fn,'nowrite'); varb=f{varn}(v.ts:v.te,v.nz,v.ys:v.ye,v.xs:v.xe);
varb=squeeze(varb); varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
v.io.hfintn0=get_iso_reg(varb,v,1,event); 

%3D standard fields
varn='temp'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','no');ta=varb;
v.io.ta=get_iso_reg_3d(varb,v,1,event,'no'); 
varn='sphum'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','no');qv=varb;
v.io.qv=get_iso_reg_3d(varb,v,1,event,'no'); 
varn='ice_wat'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','no');qi=varb;
v.io.qi=get_iso_reg_3d(varb,v,1,event,'no'); 
varn='z_full'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','no')*G;gz=varb;
v.io.gz=get_iso_reg_3d(varb,v,1,event,'no'); 
varb=CPD*ta+LV0*qv+gz-HLF*qi; v.io.hf=get_iso_reg_3d(varb,v,1,event,'no'); 
v.hf=lag_regress_3d(varb,v,v.io.pcp,1);

varn='rh'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','no');
v.io.rh=get_iso_reg_3d(varb,v,1,event,'no'); 
varn='cld_amt'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','no');
v.io.qa=get_iso_reg_3d(varb,v,1,event,'no'); 
varn='liq_wat'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','no');
v.io.ql=get_iso_reg_3d(varb,v,1,event,'no'); 
varn='ucomp'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','no');
v.io.ua=get_iso_reg_3d(varb,v,1,event,'no'); 
v.ua=lag_regress_3d(varb,v,v.io.pcp,1);
varn='vcomp'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','no');
v.io.va=get_iso_reg_3d(varb,v,1,event,'no'); 
v.va=lag_regress_3d(varb,v,v.io.pcp,1);
varn='omega'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','no');
v.io.omg=get_iso_reg_3d(varb,v,1,event,'no'); 
v.omg=lag_regress_3d(varb,v,v.io.pcp,1);
varn='mc_full'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','no');
v.io.mc=get_iso_reg_3d(varb,v,1,event,'no'); 

%3D MSE
varn='dpint'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');dpint=varb;
v.io.dpint=get_iso_reg_3d(varb,v,1,event,'no'); 
v.dpint=lag_regress_3d(varb,v,v.io.pcp,1);

%varn='hfintn'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
%varb=varb./dpint;
%v.io.hfintn=get_iso_reg_3d(varb,v,1,event,'no'); 
%v.hfintn=lag_regress_3d(varb,v,v.io.pcp,1);

varn='hdt_dgz_int'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
varb=varb./dpint;
v.io.hdt_dgz_int=get_iso_reg_3d(varb,v,1,event,'no');
v.hdt_dgz_int=lag_regress_3d(varb,v,v.io.pcp,1);

varn='hdt_ddp_int'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
varb=varb./dpint;
v.io.hdt_ddp_int=get_iso_reg_3d(varb,v,1,event,'no');
v.hdt_ddp_int=lag_regress_3d(varb,v,v.io.pcp,1);

varn='hdt_adj_int'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
varb=varb./dpint;
v.io.hdt_adj_int=get_iso_reg_3d(varb,v,1,event,'no');
v.hdt_adj_int=lag_regress_3d(varb,v,v.io.pcp,1);

varn='ddp_phy_int'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
varb=varb./dpint;
v.io.ddp_phy_int=get_iso_reg_3d(varb,v,1,event,'no');
v.ddp_phy_int=lag_regress_3d(varb,v,v.io.pcp,1);

varn='hfint'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
varb=varb./dpint;
v.io.hfint=get_iso_reg_3d(varb,v,1,event,'no'); 
v.hfint=lag_regress_3d(varb,v,v.io.pcp,1);

varn='tdt_rad_int'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
varb=varb./dpint;
v.io.tdt_rad_int=get_iso_reg_3d(varb,v,1,event,'no'); 
v.tdt_rad_int=lag_regress_3d(varb,v,v.io.pcp,1);

varn='hdt_hadv_int'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
varb=varb./dpint;
v.io.hdt_hadv_int=get_iso_reg_3d(varb,v,1,event,'no'); 
v.hdt_hadv_int=lag_regress_3d(varb,v,v.io.pcp,1);

varn='hdt_vadv_int'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
varb=varb./dpint;
v.io.hdt_vadv_int=get_iso_reg_3d(varb,v,1,event,'no');
v.hdt_vadv_int=lag_regress_3d(varb,v,v.io.pcp,1);

varn='hdp_dyn_int'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
varb=varb./dpint;
v.io.hdp_dyn_int=get_iso_reg_3d(varb,v,1,event,'no');
v.hdp_dyn_int=lag_regress_3d(varb,v,v.io.pcp,1);

varn='ddp_dyn_int'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
varb=varb./dpint;
v.io.ddp_dyn_int=get_iso_reg_3d(varb,v,1,event,'no');
v.ddp_dyn_int=lag_regress_3d(varb,v,v.io.pcp,1);

varn='tdt_dif_int'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
varb=varb./dpint;
v.io.tdt_dif_int=get_iso_reg_3d(varb,v,1,event,'no');
v.tdt_dif_int=lag_regress_3d(varb,v,v.io.pcp,1);

varn='qvdt_dif_int'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
varb=varb./dpint;
v.io.qvdt_dif_int=get_iso_reg_3d(varb,v,1,event,'no');
v.qvdt_dif_int=lag_regress_3d(varb,v,v.io.pcp,1);

varn='hdt_conv_int'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
varb=varb./dpint;
v.io.hdt_conv_int=get_iso_reg_3d(varb,v,1,event,'no'); 
v.hdt_conv_int=lag_regress_3d(varb,v,v.io.pcp,1);

varn='tdt_conv_int'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
varb=varb./dpint;
v.io.tdt_conv_int=get_iso_reg_3d(varb,v,1,event,'no'); 
v.tdt_conv_int=lag_regress_3d(varb,v,v.io.pcp,1);

varn='qdt_conv_int'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
varb=varb./dpint;
v.io.qdt_conv_int=get_iso_reg_3d(varb,v,1,event,'no'); 
v.qdt_conv_int=lag_regress_3d(varb,v,v.io.pcp,1);

%varn='dgz_conv_int'; varb=readvar(varn,tpath,expn,epath,fext,v,'3d','yes');
%varb=varb./dpint;
%v.io.dgz_conv_int=get_iso_reg_3d(varb,v,1,event,'no'); 
%v.dgz_conv_int=lag_regress_3d(varb,v,v.io.pcp,1);

fn=strcat(tpath,expn,'/',expn,'_',region,'_mjo.mat');fn
save(fn,'v','-v7.3'); return

return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=12; cx=0.6; lw=1;
z1=(v.io.hdt_hadv_int.comp_iso_avg+v.io.hdt_dgz_int.comp_iso_avg)*100; 
z2=(v.io.hdt_vadv_int.comp_iso_avg)*100; 
contourf(x,y,z1,[-cx:0.1:cx]);hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,z2,[0  :0.1:cx],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-cx:0.1:0], 'k--','LineWidth',lw); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse_adv_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%composite vertical section radiation%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=12; cx=0.6; lw=1;
z1=v.io.tdt_rad_int.comp_iso_avg*100; 
z2=(v.io.hfint.comp_iso_avg)*100; z2=z2/10^6;
contourf(x,y,z1,[-cx:0.1:cx]);hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,z2,[0  :0.1:cx],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-cx:0.1:0], 'k--','LineWidth',lw); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse_rad_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%composite vertical section turbulence diffusion
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=12; cx=0.6; lw=1;
z1a=v.io.tdt_dif_int.comp_iso_avg*100;
z1b=v.io.qvdt_dif_int.comp_iso_avg*100; z1=z1a+z1b; z1(z1<-cx)=-cx;
z2=v.io.hfint.comp_iso_avg*100; z2=z2/10^6;
contourf(x,y,z1,[-cx:0.1:cx]);hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,z2,[0  :0.1:cx],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-cx:0.1:0], 'k--','LineWidth',lw); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse_turb_iso_comp';
printit(visfig,figpath,expn,vname);
%%composite vertical section %%%%%%%%%%%%%%%%%%
%convection%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; fsize=12; cx=0.6; lw=1;
z1a=v.io.tdt_conv_int.comp_iso_avg*100; 
z1b=v.io.qdt_conv_int.comp_iso_avg*100; z1=z1a+z1b; z1(z1<-cx)=-cx;
z2a=v.io.tdt_conv_int.comp_clm_avg*100;
z2b=v.io.qdt_conv_int.comp_clm_avg*100; z2=z2a+z2b;
contourf(x,y,z1,[-cx:0.1:cx]);hold on; shading flat; caxis([-cx cx]); colorbar;
[C,h]=contour(x,y,z2,[0   :0.2:1.6],'k-', 'LineWidth',lw); clabel(C,h)
[C,h]=contour(x,y,z2,[-1.6:0.2:0] , 'k--','LineWidth',lw); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse_conv_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; z1=v.io.hdp_dyn_int.comp_iso_avg; fsize=18;
z2=v.io.omg.comp_iso_avg; z2=z2*864;
contourf(x,y,z1,[-2.5:0.1:2.5]);hold on; shading flat; caxis([-2.5 2.5]); colorbar;
[C,h]=contour(x,y,z2,[0  :5 :80],'k-', 'LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-80:10:0 ],'k--','LineWidth',2); clabel(C,h)
set(gca,'yDir','reverse'); axis([-20 20 100 1000]);
ylabel('pressure (hPa)',   'FontSize',fsize); 
xlabel('lagged time (day)','FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse_hdp_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Fig0a%%%%%%%%%%%%%%%%%%%%%%%%%
k1=1; k2=100; x=[k1:k2]; lw=1; msize=12;
y1=v.io.hdt_tot_int.org(k1:k2);
y2=v.io.hdt_net_int.org(k1:k2);
y3=v.io.hdt_tot_int.ano_iso_win(k1:k2);
y4=v.io.hdt_net_int.ano_iso_win(k1:k2);
y5=v.io.hdt_tot_int.ano_org_win(k1:k2);
y6=v.io.hdt_net_int.ano_org_win(k1:k2);
pms=[ 0, 0, 1200, 800]*0.8; warning off all
handle = figure('Position', pms,'visible','on');
plot(x,y1,'-r*','LineWidth',lw,'MarkerSize',msize-2); hold on; 
plot(x,y2,'-bs','LineWidth',lw,'MarkerSize',msize);
xlabel('day','FontSize',fsize); 
ylabel('MSE tendency','FontSize',fsize);
legend('\Delta <MSE>/\Delta t','\Sigma <\partial MSE/\partial t>')
axis([2 100 -250 250]); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_mjo/'; vname='dmse_org_budget';
printit(visfig,figpath,expn,vname);
%Fig0b%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; warning off all
handle = figure('Position', pms,'visible','on');
plot(x,y3,'-r*','LineWidth',lw,'MarkerSize',msize-2); hold on; 
plot(x,y4,'-bs','LineWidth',lw,'MarkerSize',msize);
xlabel('day','FontSize',fsize); 
ylabel('20-100 day band-pass-filtered MSE tendency','FontSize',fsize);
legend('\Delta <MSE>/\Delta t','\Sigma <\partial MSE/\partial t>')
axis([2 100 -50 50]); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_mjo/'; vname='dmse_iso_budget';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.lon; y=v.lgd; z1=v.pcp.lagslop.iso_avg';
%z2=v.hfint0.lagslop.org_avg'; z2=z2/10^6; fsize=18;
z2=v.hfint0.lagslop.iso_avg'; z2=z2/10^6; fsize=18;
contourf(x,y,z1,[-2.4:0.2:2.4]); hold on; shading flat; caxis([-2 2]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-','LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',2); clabel(C,h)
uu=5*86400/111000 %speed=longitude/day
xx=40+uu*(y+20); plot(xx,y,'k--','LineWidth',3)
ylabel('lagged time (day)','FontSize',fsize); 
xlabel('longitude','FontSize',fsize);
axis([40 180 -20 20]); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_mjo/'; vname='pcp_mse_iso_regress';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 2a total MSE tendency%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.lon; y=v.lat; z1=v.hdt_tot_int.slop.iso_avg'; fsize=18;
z2=v.hfint0.slop.iso_avg'; z2=z2/10^6;
contourf(x,y,z1,[-10:1:10]); hold on; shading flat; caxis([-10 10]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-','LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',2); clabel(C,h)
ylabel('latitude','FontSize',fsize); 
xlabel('longitude','FontSize',fsize);
axis([40 180 -20 20]); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_mjo/'; vname='dmse_tot_iso_regress';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 2b net MSE tendency%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.lon; y=v.lat; z1=v.hdt_net_int.slop.iso_avg'; fsize=18;
z2=v.hfint0.slop.iso_avg'; z2=z2/10^6;
contourf(x,y,z1,[-10:1:10]); hold on; shading flat; caxis([-10 10]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-','LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',2); clabel(C,h)
ylabel('latitude','FontSize',fsize); 
xlabel('longitude','FontSize',fsize);
axis([40 180 -20 20]); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_mjo/'; vname='dmse_net_iso_regress';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.lon; y=v.lat; z1=v.hdt_hadv_int0.slop.iso_avg'; fsize=18;
z2=v.hfint0.slop.iso_avg'; z2=z2/10^6;
contourf(x,y,z1,[-10:1:10]); hold on; shading flat; caxis([-10 10]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-','LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',2); clabel(C,h)
ylabel('latitude','FontSize',fsize); 
xlabel('longitude','FontSize',fsize);
axis([40 180 -20 20]); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_mjo/'; vname='dmse_hadv_iso_regress';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 4%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.lon; y=v.lat; z1=v.hdt_vadv_int0.slop.iso_avg'; fsize=18;
z2=v.hfint0.slop.iso_avg'; z2=z2/10^6;
contourf(x,y,z1,[-10:1:10]); hold on; shading flat; caxis([-10 10]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-','LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',2); clabel(C,h)
ylabel('latitude','FontSize',fsize); 
xlabel('longitude','FontSize',fsize);
axis([40 180 -20 20]); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_mjo/'; vname='dmse_vadv_iso_regress';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.lon; y=v.lat; z1=v.hdp_dyn_int0.slop.iso_avg'; fsize=18;
z2=v.hfint0.slop.iso_avg'; z2=z2/10^6;
contourf(x,y,z1,[-10:1:10]); hold on; shading flat; caxis([-10 10]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-','LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',2); clabel(C,h)
ylabel('latitude','FontSize',fsize); 
xlabel('longitude','FontSize',fsize);
axis([40 180 -20 20]); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_mjo/'; vname='dmse_hdp_iso_regress';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plotting....
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; lw=3; fsize=14;
%plot(lgd,mean(event.var,1),'k'); hold on;
plot(x, v.io.pcp.comp_iso_avg_n*30,'k--','LineWidth',lw*2); hold on; sx='precip';
%plot(x, v.io.u850.comp_iso_avg,  'k--'); grid on;
%plot(x, v.io.u200.comp_iso_avg,  'k-.'); 
%plot(x, v.io.olr.comp_iso_avg,   'k:');
plot(x,  v.io.hfint0.comp_iso_avg_n*30,'r--','LineWidth',lw*2); sy='<MSE>';
%plot(x, v.io.hfintn0.comp_iso_avg_n*10,'r-'); 
%plot(x, v.io.hf_beg.comp_iso_avg,'r-'); 
%plot(x, v.io.hf_end.comp_iso_avg_n,'r*:');
%plot(x, v.io.dhf.comp_iso_avg,'b-*'); sy='(dm/dt)-total'
%y0=v.io.hdt_sum_int0.comp_iso_avg; plot(x,y0,'g--');
y0=v.io.hdt_tot_int.comp_iso_avg;   plot(x,y0,'r-*','LineWidth',lw);s0='<dMSE/dt>-total';
y1=v.io.tdt_rad_int0.comp_iso_avg;  plot(x,y1,'g-','LineWidth',lw); s1='radiation';
y2a=v.io.tdt_dif_int0.comp_iso_avg; %plot(x,y2a,'g--'); s2a='sensible';
y2b=v.io.qvdt_dif_int0.comp_iso_avg;%plot(x,y2b,'c:');  s2b='latent heat';
y2=y2a+y2b;                         plot(x,y2,'c-','LineWidth',lw); s2='surface heat flux';
y3=v.io.hdt_dgz_adj.comp_iso_avg;   plot(x,y3,'k-','LineWidth',lw); s3='hdt-dgz-phy';
y4a=v.io.hdt_hadv_int0.comp_iso_avg;%plot(x,y4a,'m:');  s4a='hdt-hadv-int';
y4b=v.io.hdt_vadv_int0.comp_iso_avg;%plot(x,y4b,'m--'); s4b='hdt-vadv-int';
y4c=v.io.hdp_dyn_int0.comp_iso_avg; %plot(x,y4c,'m-.'); s4c='hdp-dyn-int';
y4=y4a+y4b+y4c;                     plot(x,y4,'b-','LineWidth',lw); s4='<dMSE/dt>-dyn';
y5=y1+y2+y3+y4;                     plot(x,y5,'r-s');  s5='sum';
y6=y4a;                             plot(x,y6,'b*--'); s6='hadv';
y7=y4b;                             plot(x,y7,'bo-.'); s7='vadv';
y8=y4c;                             plot(x,y8,'b+:');  s8='hdp-dyn';
y9=y4a+y4b;                         plot(x,y9,'bp-');  s9='adv';
%plot(x,y0-y4c,'rp-')
legend(sx,sy,s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,4,'boxoff'); grid on;
xlabel('lagged time (day)','FontSize',fsize); 
ylabel('MSE budget (W/m2)','FontSize',fsize);
axis([-20 20 -100 60]); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_mjo/'; vname='dmse_io_iso_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; lw=3; fsize=14;
%plot(lgd,mean(event.var,1),'k'); hold on;
plot(x, v.io.pcp.comp_org_avg_n*30,'k--','LineWidth',lw*2); hold on; sx='precip';
%plot(x, v.io.u850.comp_org_avg,  'k--'); grid on;
%plot(x, v.io.u200.comp_org_avg,  'k-.'); 
%plot(x, v.io.olr.comp_org_avg,   'k:');
plot(x,  v.io.hfint0.comp_org_avg_n*30,'r--','LineWidth',lw*2); sy='<MSE>';
%plot(x, v.io.hfintn0.comp_org_avg_n*10,'r-'); 
%plot(x, v.io.hf_beg.comp_org_avg,'r-'); 
%plot(x, v.io.hf_end.comp_org_avg_n,'r*:');
%plot(x, v.io.dhf.comp_org_avg,'b-*'); sy='(dm/dt)-total'
%y0=v.io.hdt_sum_int0.comp_org_avg; plot(x,y0,'g--');
y0=v.io.hdt_tot_int.comp_org_avg;   plot(x,y0,'r-*','LineWidth',lw);s0='<dMSE/dt>-total';
y1=v.io.tdt_rad_int0.comp_org_avg;  plot(x,y1,'g-','LineWidth',lw); s1='radiation';
y2a=v.io.tdt_dif_int0.comp_org_avg; %plot(x,y2a,'g--'); s2a='sensible';
y2b=v.io.qvdt_dif_int0.comp_org_avg;%plot(x,y2b,'c:');  s2b='latent heat';
y2=y2a+y2b;                         plot(x,y2,'c-','LineWidth',lw); s2='surface heat flux';
y3=v.io.hdt_dgz_adj.comp_org_avg;   plot(x,y3,'k-','LineWidth',lw); s3='hdt-dgz-phy';
y4a=v.io.hdt_hadv_int0.comp_org_avg;%plot(x,y4a,'m:');  s4a='hdt-hadv-int';
y4b=v.io.hdt_vadv_int0.comp_org_avg;%plot(x,y4b,'m--'); s4b='hdt-vadv-int';
y4c=v.io.hdp_dyn_int0.comp_org_avg; %plot(x,y4c,'m-.'); s4c='hdp-dyn-int';
y4=y4a+y4b+y4c;                     plot(x,y4,'b-','LineWidth',lw); s4='<dMSE/dt>-dyn';
y5=y1+y2+y3+y4;                     plot(x,y5,'r-s');  s5='sum';
y6=y4a;                             plot(x,y6,'b*--'); s6='hadv';
y7=y4b;                             plot(x,y7,'bo-.'); s7='vadv';
y8=y4c;                             plot(x,y8,'b+:');  s8='hdp-dyn';
y9=y4a+y4b;                         plot(x,y9,'bp-');  s9='adv';
legend(sx,sy,s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,4,'boxoff'); grid on;
xlabel('lagged time (day)','FontSize',fsize); 
ylabel('MSE budget (W/m2)','FontSize',fsize);
axis([-20 20 -150 60]); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_mjo/'; vname='dmse_io_org_comp';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=v.io.pcp.lgd; y=v.pf; z1=v.io.omg.comp_iso_avg; fsize=18;
z2=v.io.hdp_fint0.slop.iso_avg'; z2=z2/10^6;
contourf(x,y,z1,20); hold on; shading flat; caxis([-10 10]); colorbar;
[C,h]=contour(x,y,z2,[0 :1:5],'k-','LineWidth',2); clabel(C,h)
[C,h]=contour(x,y,z2,[-5:1:0],'k--','LineWidth',2); clabel(C,h)
ylabel('latitude','FontSize',fsize); 
xlabel('longitude','FontSize',fsize);
axis([40 180 -20 20]); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_mjo/'; vname='dmse_hdp_iso_regress';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lgd=v.io.pcp.lgd; pf=v.pf;
z=v.io.ddp_dyn_int.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
contourf(lgd,pf,z,20); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.hdp_dyn_int.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
contourf(lgd,pf,z,20); shading flat; colorbar; set(gca,'YDir','reverse');


lgd=v.io.pcp.lgd; pf=v.pf;
z=v.io.omg.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
contourf(lgd,pf,z,20); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.hdp_dyn_int.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
contourf(lgd,pf,z,20); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.hdt_dgz.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
pcolor(lgd,pf,z); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.rh.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
pcolor(lgd,pf,z); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.qv.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
pcolor(lgd,pf,z); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.omg.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
pcolor(lgd,pf,z); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.ta.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
pcolor(lgd,pf,z); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.mc.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
pcolor(lgd,pf,z); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.hfintn.comp_iso_avg; 
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
pcolor(lgd,pf,z); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.hfint.comp_iso_avg; 
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
pcolor(lgd,pf,z); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.tdt_rad_int.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
pcolor(lgd,pf,z); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.hdt_hadv_int.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
pcolor(lgd,pf,z); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.hdt_vadv_int.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
pcolor(lgd,pf,z); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.tdt_dif_int.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
pcolor(lgd,pf,z); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.hdt_conv_int.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
pcolor(lgd,pf,z); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.dgz_conv_int.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
pcolor(lgd,pf,z); shading flat; colorbar; set(gca,'YDir','reverse');
z=v.io.tdt_rad_int.comp_iso_avg;
pms=[0, 0, 1600, 800]*0.5; figure('Position',pms);
pcolor(lgd,pf,z); shading flat; colorbar; set(gca,'YDir','reverse');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k1=1; k2=2000;
x=v.io.hdt_sum_int0.org(k1:k2);
y=v.io.hdt_dgz_adj.org(k1:k2);
z=v.io.dhf.org(k1:k2); ze=x+y; %yp=rand(1,3650); yp=yp-mean(yp); yp=y+2*yp'; zp=x+yp;
figure; plot(x,'c'); hold on; plot(y,'g'); plot(z,'-b*'); plot(ze,'-rs');
dd1=20; dd2=200;
x1 =mybandpass(x, dd1,dd2);
y1 =mybandpass(y, dd1,dd2);
z1 =mybandpass(z, dd1,dd2);
ze1=mybandpass(ze,dd1,dd2);
figure; plot(x1,'c'); hold on; plot(y1,'g'); plot(z1,'-b*'); plot(ze1,'-rs'); 
plot(x1+y1,'-ko');





k1=1; k2=500;
%y1=v.io.hf_beg.org(k1:k2); 
%y2=v.io.hf_end.org(k1:k2); 
%y3=v.io.dhf.org   (k1:k2);
y4=v.io.hdt_tot_int.org(k1:k2);
y5=v.io.hdt_sum_int0.org(k1:k2);
y6=v.io.hdt_dgz_adj.org (k1:k2);
figure; plot((y2-y1)/1860,'-r*'); hold on; 
plot(y3,'-gs');
plot(y4,'-bo');
plot(y5+y6,'-k+');
plot(y5,':k');
plot(y6,'--k');

y6=v.io.hdt_ver_int.org (k1:k2);
y7=v.io.hmint_uwc.org   (k1:k2); 

figure; plot((y2-y1)/1860,'-r*'); hold on; plot(y3,'-gs');
plot(y4+y5,'bo');


figure; plot(y4,'-r*'); hold on; plot(y6,'-gs');

plot(y4+y5,'bo');




y1=v.io.hdt_tot_int.org (k1:k2);  plot(y1,'-r*'); hold on;
y2=v.io.hdt_sum_int0.org(k1:k2);  plot(y2,'-g'); 
y3=v.io.hdt_dgz_adj.org (k1:k2);  plot(y3,'-b')
y4=v.io.dgz_phy_int0.org (k1:k2); plot(y4,'-c')
plot(y2+y3,'-ks')

figure; contourf(v.lon,v.pcp.lgd,v.pcp.lagcorr.org_avg',20); shading flat; colorbar; 
figure; contourf(v.lon,v.pcp.lgd,v.pcp.lagcorr.iso_avg',20); shading flat; colorbar; 
figure; contourf(v.lon,v.pcp.lgd,v.pcp.lagslop.org_avg',20); shading flat; colorbar; 
figure; contourf(v.lon,v.pcp.lgd,v.pcp.lagslop.iso_avg',20); shading flat; colorbar; 

figure; contourf(v.lon,v.lat,v.pcp.slop.org_avg',20); shading flat; colorbar; 
figure; contourf(v.lon,v.lat,v.hmint.slop.org_avg',20); shading flat; colorbar; 
figure; contourf(v.lon,v.lat,v.hdt_tot_int.slop.org_avg',20); shading flat; colorbar; 


y4=plot(v.io.hdt_tot_int.org(k1:k2)-v.io.hdt_dgz_adj.org(k1:k2),'c')

plot(v.io.hdt_ver_int.org(k1:k2),'g')

varn='olr'; 
fext=strcat('atmos_daily.',yr1,'-',yr2,'.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext); f=netcdf(fn,'nowrite');fn
varb=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
v.io.olr=lagregress(varb,v,0)
v.io.olr=lagregress(varb,v,1)

varn='u850';
fext=strcat('atmos_daily.',yr1,'-',yr2,'.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext); f=netcdf(fn,'nowrite');fn
varb=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
v.io.u850=lagregress(varb,v,0)
v.io.u850=lagregress(varb,v,1)

varn='u200';
fext=strcat('atmos_daily.',yr1,'-',yr2,'.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext); f=netcdf(fn,'nowrite');fn
varb=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
v.io.u200=lagregress(varb,v,0)
v.io.u200=lagregress(varb,v,1)

varn='hdt_hadv_int'; kmax=32;
varn='hdt_vadv_int'; kmax=32;
varn='tdt_rad_int'; kmax=32;
fext=strcat('atmos_daily.',yr1,'-',yr2,'.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext); f=netcdf(fn,'nowrite');fn
varb=f{varn}(v.ts:v.te,kmax,v.ys:v.ye,v.xs:v.xe); close(f);
varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
v.io.tdt_rad_int=lagregress(varb,v,1)

varn='tdt_dyn_int'; kmax=32;
fext=strcat('atmos_daily.',yr1,'-',yr2,'.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext); f=netcdf(fn,'nowrite');fn
varb=f{varn}(v.ts:v.te,kmax,v.ys:v.ye,v.xs:v.xe); close(f);
varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
v.io.tdt_dyn_int=lagregress(varb,v,1)

varn='qvdt_dyn_int'; kmax=32;
fext=strcat('atmos_daily.',yr1,'-',yr2,'.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext); f=netcdf(fn,'nowrite');fn
varb=f{varn}(v.ts:v.te,kmax,v.ys:v.ye,v.xs:v.xe); close(f);
varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
v.io.qvdt_dyn_int=lagregress(varb,v,1)

varn='hdp_dyn_int'; kmax=32;
fext=strcat('atmos_daily.',yr1,'-',yr2,'.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext); f=netcdf(fn,'nowrite');fn
varb=f{varn}(v.ts:v.te,kmax,v.ys:v.ye,v.xs:v.xe); close(f);
varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
v.io.hdp_dyn_int=lagregress(varb,v,1)

varn='hdt_dgz_adj'; 
fext=strcat('atmos_daily.',yr1,'-',yr2,'.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext); f=netcdf(fn,'nowrite');fn
varb=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon); hdt_total=varb+hdt_sum_int;
v.io.hdt_dgz_adj=lagregress(varb,v,1)

varn='lhflx_uwc';
fext=strcat('atmos_daily.',yr1,'-',yr2,'.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext); f=netcdf(fn,'nowrite');fn
varb=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
v.io.lhflx=lagregress(varb,v,1)

varn='shflx_uwc';
fext=strcat('atmos_daily.',yr1,'-',yr2,'.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext); f=netcdf(fn,'nowrite');fn
varb=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
v.io.shflx=lagregress(varb,v,1)

varn='hdt_sum_int'; kmax=32;
fext=strcat('atmos_daily.',yr1,'-',yr2,'.',varn,'.nc'); 
fn=strcat(tpath,expn,epath,fext); f=netcdf(fn,'nowrite');fn
varb=f{varn}(v.ts:v.te,kmax,v.ys:v.ye,v.xs:v.xe); close(f);
varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon); hdt_sum_int=varb;
v.io.hdt_sum_int=lagregress(varb,v,1)

fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat');fn
save(fn,'v','-v7.3'); return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tpath ='/archive/Ming.Zhao/mdt/20160322/';
latlon=[0 360 -10 5]; region='equat'; yr1='0001'; yr2='0020'; nyr=20;
expn='CM4_c96L32_am4g10r8_2000_OMp5_lmix_H5_nmle_ndiff_meke_KHTH200';
%v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)
fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat');fn
load(fn);

tpath ='/archive/Ming.Zhao/mdt/20160322/';
latlon=[0 360 -10 5]; region='equat'; yr1='0001'; yr2='0020'; nyr=20;
expn='CM4_c96L32_am4g10r14_2000_OMp5_lmix_H5_nmle_ndiff_meke_KHTH200';
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

tpath ='/archive/Ming.Zhao/mdt/20160629/';
latlon=[0 360 -10 5]; region='equat'; yr1='0001'; yr2='0020'; nyr=20;
expn='CM4_c96L32_am4g11r5_2000_OMp5_H5_ndiff_meke_MLE30d_ePBLe';
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

tpath ='/archive/Ming.Zhao/awgom2/ulm_201505/';
expn='AM4OM2F_c96L32_am4g10_2000climo'; region='equat';
fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat'); load(fn);v0=v;

tpath ='/archive/Ming.Zhao/awgom2/ulm_201505/';
expn='AM4OM2F_c96L32_am4g10r8_2000climo'; region='equat';
fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat'); load(fn);v0=v;

tpath ='/archive/Ming.Zhao/mdt/20160322/'; region='equat';
expn='CM4_c96L32_am4g10r8_2000_OMp5_lmix_H5_nmle_ndiff_meke_KHTH200';
fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat'); load(fn);v1=v;

tpath ='/archive/Ming.Zhao/mdt/20160322/'; region='equat';
expn='CM4_c96L32_am4g10r14_2000_OMp5_lmix_H5_nmle_ndiff_meke_KHTH200';
fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat'); load(fn);v2=v;

tpath ='/archive/Ming.Zhao/mdt/20160322/'; region='equat';
expn='CM4_c96L32_am4g10r14_2000_OMp5_lmix_H5_nmle_ndiff_meke_KHTH200';
fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat'); load(fn);v2=v;

tpath ='/archive/Ming.Zhao/mdt/20160629/'; region='equat';
expn='CM4_c96L32_am4g11r5_2000_OMp5_H5_ndiff_meke_MLE30d_ePBLe';
fn=strcat(tpath,expn,'/ts_all/',expn,'_',region,'_mjo.mat'); load(fn);v3=v;

s=v.io.pcp; vbin=[-0.8:0.1:0.8];
y0=s.lagcorr.org_avg; y1=s.lagcorr.iso_avg;
figure; pcolor(s.lon,s.lgd,y0');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)
figure; pcolor(s.lon,s.lgd,y1');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)

s=v2.io.pcp; vbin=[-0.8:0.1:0.8];
y0=s.lagcorr.org_avg; y1=s.lagcorr.iso_avg;
figure; pcolor(s.lon,s.lgd,y0');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)
figure; pcolor(s.lon,s.lgd,y1');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)

s=v2.io.pcp; vbin=[-0.8:0.1:0.8];
y0=s.lagcorr.org_avg; y1=s.lagcorr.iso_avg;
figure; pcolor(s.lon,s.lgd,y0');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)
figure; pcolor(s.lon,s.lgd,y1');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)

s=v3.io.pcp; vbin=[-0.5:0.1:0.5];
y0=s.lagcorr.org_avg; y1=s.lagcorr.iso_avg;
figure; pcolor(s.lon,s.lgd,y0');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)
figure; pcolor(s.lon,s.lgd,y1');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)


s=v1.io.pcp; vbin=[-0.8:0.1:0.8];
figure; contourf(s.lon,s.lgd,s.corr_org_avg,vbin);shading flat; colorbar; %clabel(C,h)
figure; contourf(s.lon,s.ndd,s.corr_iso_avg,vbin);shading flat; colorbar; %clabel(C,h)

s=v2.io.pcp; vbin=[-0.8:0.1:0.8];
figure; contourf(s.lon,s.ndd,s.corr_org_avg,vbin);shading flat; colorbar; %clabel(C,h)
figure; contourf(s.lon,s.ndd,s.corr_iso_avg,vbin);shading flat; colorbar; %clabel(C,h)

s=v0.io.pcp; vbin=[-0.8:0.1:0.8];
figure; contourf(s.lon,s.ndd,s.corr_org_avg,vbin);shading flat; colorbar; %clabel(C,h)
figure; contourf(s.lon,s.ndd,s.corr_iso_avg,vbin);shading flat; colorbar; %clabel(C,h)

tpath ='/archive/Ming.Zhao/awgom2/ulm_201505/';
latlon=[40 120 -10 10]; region='equat'; yr1='0001'; yr2='0020'; nyr=20;
expn='AM4OM2F_c96L32_am4g10r8_2000climo'; %latlon=[0 360 -10 10];
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

tpath ='/archive/Ming.Zhao/awgom2/ulm_201505/';
latlon=[0 360 -10 5]; region='equat'; yr1='0001'; yr2='0020'; nyr=20;
expn='AM4OM2F_c96L32_am4g10_2000climo';
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

tpath ='/archive/Ming.Zhao/awgom2/ulm_201505/';
latlon=[0 360 -10 5]; region='equat'; yr1='0001'; yr2='0020'; nyr=20;
expn='AM4OM2F_c96L32_am4g10r8_2000climo';
v=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,region)

tpath ='/archive/Ming.Zhao/awg/ulm_201505/';
expn='c96L32_am4g10r3_2000climo'; yr1='0002'; yr2='0011'; nyr=10;
latlon=[0 360 -10 5];
varn='precip'; v.pcp=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,varn)
varn='olr';    v.olr=mjo_ana(tpath,expn,yr1,yr2,latlon,nyr,varn)


tpath ='/archive/Ming.Zhao/mdt/20160322/';
expn='CM4_c96L32_am4g10r8_2000_mjoanalysis'; yr1='1981'; yr2='2000'; nyr=20;
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



s=v.io.pcp; vbin=[-0.8:0.1:0.8];
y0=s.lagcorr.org_avg;
y1=s.lagcorr.iso_avg;
figure; pcolor(s.lon,s.lgd,y0');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)
figure; pcolor(s.lon,s.lgd,y1');caxis([-0.8 0.8]);shading flat;colorbar; %clabel(C,h)

figure; pcolor(s.lon,s.lat,v.io.pcp.corr.org_avg');shading flat;colorbar;
y0=squeeze(mean(s.slop.org,1)); y1=squeeze(mean(s.slop.iso,1));
figure; contourf(s.lon,s.lgd,y0,vbin);shading flat;colorbar; %clabel(C,h)
figure; contourf(s.lon,s.lgd,y1,vbin);shading flat;colorbar; %clabel(C,h)
y=squeeze(v.io.pcp.ano_iso_win(1,:)');
x=squeeze(s.ano_iso_yld(1,1,1,:));
a=mvregress(x,y); figure; plot(x,y,'s');
return


s=v.pcp1; t1=1; t2=9;
s.vbin=[-0.8:0.1:0.8]; 
yorg=squeeze(mean(s.corr    (t1:t2,:,:),1));
yiso=squeeze(mean(s.corr_iso(t1:t2,:,:),1));
figure; [C,h]=contourf(s.lon,s.ndd,yorg,s.vbin); caxis([-0.8 0.8]);
shading flat; colorbar; %clabel(C,h)
figure; [C,h]=contourf(s.lon,s.ndd,yiso,s.vbin); 
shading flat; colorbar; %clabel(C,h)

x1=v.io.pcp.corr.org_avg;          y1=v.io.pcp.slop.iso_avg;
x2=v.io.hmint.corr.org_avg;        y2=v.io.hmint.slop.iso_avg;
x3=v.io.hdt_tot_int.corr.org_avg;  y3=v.io.hdt_tot_int.slop.iso_avg;
x4=v.io.hdt_hadv_int.corr.org_avg; y4=v.io.hdt_hadv_int.slop.iso_avg;
x5=v.io.hdt_vadv_int.corr.org_avg; y5=v.io.hdt_vadv_int.slop.org_avg;
x6=v.io.hdt_adv_int.corr.org_avg;  y6=v.io.hdt_adv_int.slop.org_avg;
x7=v.io.tdt_rad_int.corr.org_avg;  y7=v.io.tdt_rad_int.slop.org_avg;
x8=v.io.tdt_dyn_int.corr.org_avg;  y8=v.io.tdt_dyn_int.slop.org_avg;
x9=v.io.qvdt_dyn_int.corr.org_avg; y9=v.io.qvdt_dyn_int.slop.org_avg;
x10=v.io.hdp_dyn_int.corr.org_avg; y10=v.io.hdp_dyn_int.slop.org_avg;
x11=v.io.hdt_dgz_adj.corr.org_avg; y11=v.io.hdt_dgz_adj.slop.org_avg;
x12=v.io.lhflx.corr.org_avg;       y12=v.io.lhflx.slop.org_avg;
x13=v.io.shflx.corr.org_avg;       y13=v.io.shflx.slop.org_avg;

pms=[ 0, 0, 1500, 1000]; warning off all
handle = figure('Position', pms,'visible','on');
row=4; col=4; 
subplot(row,col,1); contourf(v.lon,v.lat,y1'); shading flat; colorbar;
grid on; title('rainfall'); 
subplot(row,col,2); contourf(v.lon,v.lat,y2'); shading flat; colorbar;
grid on; title('<m>');
subplot(row,col,3); contourf(v.lon,v.lat,y3'); shading flat; colorbar;
grid on; title('<hdt-tot-int>');
subplot(row,col,4); contourf(v.lon,v.lat,y4'); shading flat; colorbar;
grid on; title('<hdt-hadv-int>');
subplot(row,col,5); contourf(v.lon,v.lat,y5'); shading flat; colorbar;
grid on; title('<hdt-vadv-int>');
subplot(row,col,6); contourf(v.lon,v.lat,y6'); shading flat; colorbar;
grid on; title('<hdt-adv-int>');
subplot(row,col,7); contourf(v.lon,v.lat,y7'); shading flat; colorbar;
grid on; title('<tdt-rad-int>');
subplot(row,col,8); contourf(v.lon,v.lat,y8'); shading flat; colorbar;
grid on; title('<tdt-dyn-int>');
subplot(row,col,9); contourf(v.lon,v.lat,y9'); shading flat; colorbar;
grid on; title('<qvdt-dyn-int>');
subplot(row,col,10); contourf(v.lon,v.lat,y10'); shading flat; colorbar;
grid on; title('<hdp-dyn-int>');
subplot(row,col,11); contourf(v.lon,v.lat,y11'); shading flat; colorbar;
grid on; title('<hdt-dgz-adj>');
subplot(row,col,12); contourf(v.lon,v.lat,y12'); shading flat; colorbar;
grid on; title('<lhflx>');
subplot(row,col,13); contourf(v.lon,v.lat,y11'); shading flat; colorbar;
grid on; title('<shflx>');



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


%visfig='off'; figpath='./'; expn='mse'; vname='regress';
%printit(visfig,figpath,expn,vname);
%figure; 
%plot(varb(2:end,1,1,1),'r-*'); hold on;  
%plot(hdt_sum_int(2:end,1,1,1),'b-s');
