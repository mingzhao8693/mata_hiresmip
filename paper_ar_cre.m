%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/backup/ECMWF/';
expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=1979;yr2=2014;
opt='obs'; v=readarmap_pcp(tpath,expn,yr1,yr2,ardir,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; ardir='AR_climlmt';yr1=1979;yr2=2014;
opt='mod'; v=readarmap_pcp(tpath,expn,yr1,yr2,pct,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp'; ardir='AR_climlmt';yr1=2015;yr2=2050;
opt='mod'; v=readarmap_pcp(tpath,expn,yr1,yr2,pct,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_2010climo_new_newpp'; ardir='AR_climlmt';yr1=2;yr2=31;
opt='mod'; v=readarmap_pcp(tpath,expn,yr1,yr2,pct,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_2010climo_new_p4K_newpp'; ardir='AR_climlmt';yr1=2;yr2=31;
opt='mod'; v=readarmap_pcp(tpath,expn,yr1,yr2,pct,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
expn='c192L33_am4p0_2010climo_new_newpp'; ardir='AR_climlmt';yr1=2;yr2=31;
opt='mod'; v=readarmap_cre(tpath,expn,yr1,yr2,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
expn='c192L33_am4p0_2010climo_new_p4K_newpp'; ardir='AR_climlmt';yr1=2;yr2=31;
opt='mod'; v=readarmap_cre(tpath,expn,yr1,yr2,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/';
expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; yrs='_1979_2014_';ardir='AR_climlmt'
fext=strcat(yrs,,'readarmap_cre_new.mat'); fn=strcat(tpath,expn,fext); load(fn);vm=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/';
expn='c192L33_am4p0_2010climo_new_newpp'; yrs='_2_3_';ardir='AR_climlmt'
fext=strcat(yrs,'readarmap_pcp.mat'); fn=strcat(tpath,expn,fext); load(fn);v1=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/';
expn='c192L33_am4p0_2010climo_new_p4K_newpp'; yrs='_2_3_';ardir='AR_climlmt'
fext=strcat(yrs,'readarmap_pcp.mat'); fn=strcat(tpath,expn,fext); load(fn);w1=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig0 AR frequency, fraction of P99 and P999
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='arfq_vs_arfqs'; p.str='ANN'; vx=v1; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 0.12]; p.cs1=[0 1]; p.cs2=[0 1];
p.s0='(a) AR frequency (annual mean)'; 
p.s1='(b) fraction of P>P99 due to ARs'; 
p.s2='(c) fraction of P>P99.9 due to ARs'; p.str=''; k_pct=7;
p.z0=squeeze(vx.arfq (1,:,:)); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.pr6hr_fp99_ar)
p.dz=squeeze(vx.pr6hr_fp999_ar)
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig0 AR frequency
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='arfq_vs_arfqs'; p.str='ANN'; vx=v1; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 0.12]; p.cs1=[0 6000]; p.cs2=[0 1];
p.s0='(a) AR frequency (annual mean)'; 
p.s1='(b) AR total number of occurrence'; 
p.s2='(c) AR no with precip > P99'; p.str=''; k_pct=7;
p.z0=squeeze(vx.arfq (1,:,:)); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.arfqs(1,:,:))
p.dz=squeeze(vx.pr6hr_fp999_ar)
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_precip
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='pcp_av_aravg_aravgp99'; p.str='ANN'; vx=v1;
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 20]; p.cs1=[0 20]; p.cs2=[0 150];
p.s0='(a) Annual mean precipitation'; 
p.s1='(b) AR mean precipitation'; 
p.s2='(c) AR 99 percentile precipitation';
p.z0=squeeze(vx.pr6hr_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.pr6hr_aravg)
p.dz=squeeze(vx.pr6hr_aravg_p999);
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_precip
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='pcp_av__nonarp99_nonarp999'; p.str='ANN'; vx=v1;
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 20]; p.cs1=[0 150]; p.cs2=[0 150];
p.s0='(a) Annual mean precipitation'; 
p.s1='(b) AR mean precipitation'; 
p.s2='(c) AR 99 percentile precipitation';
p.z0=squeeze(vx.pr6hr_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.pr6hr_nonar_p99)
p.dz=squeeze(vx.pr6hr_nonar_p999);
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_omega850
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='w850_av_vs_aravg_arpct6'; k=6; p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[-80 80]; p.cs1=[-100 100]; p.cs2=[-200 200];
p.s0='(a) annual mean 850 hPa omega'; 
p.s1='(b) AR mean 850 hPa omega'; 
p.s2='(c) AR 99 percentile 850 hPa omega';
p.z0=squeeze(vx.w850_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.w850_aravg)
p.dz=squeeze(vx.w850_arpct(1,k,:,:));
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='w500_av_vs_aravg'; p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[-80 80]; p.cs1=[-200 80]; p.cs2=[-200 80];
p.s0='(a) Precipitation (annual mean)'; 
p.s1='(b) Precipitation (AR averaged)'; 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.w500_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.w500_aravg)
p.dz=p.z1-p.z0;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_omega
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w850'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[-80 80]; p.cs1=[-180 180]; p.cs2=[-100 100];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.w850_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.w850_aravg)
p.dz=(p.z1-p.z0)./abs(p.z0)*100.;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w500'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[-80 80]; p.cs1=[-200 80]; p.cs2=[-200 80];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.w500_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.w500_aravg)
p.dz=p.z1-p.z0;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w250'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[-80 80]; p.cs1=[-200 80]; p.cs2=[-200 80];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.w250_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.w250_aravg)
p.dz=p.z1-p.z0;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_PRW
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prw'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 100]; p.cs1=[0 100]; p.cs2=[-100 100];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.prw_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.prw_aravg);
p.dz=(p.z1-p.z0)./p.z0*100;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_Q
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='q850'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 15]; p.cs1=[0 15]; p.cs2=[-100 100];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.q850_av)*1000; p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.q850_aravg)*1000
p.dz=(p.z1-p.z0)./p.z0*100;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='q500'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 5]; p.cs1=[0 5]; p.cs2=[-200 200];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.q500_av)*1000; p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.q500_aravg)*1000
p.dz=(p.z1-p.z0)./p.z0*100;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='q250'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 0.2]; p.cs1=[0 0.2]; p.cs2=[-100 100];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.q250_av)*1000; p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.q250_aravg)*1000
p.dz=(p.z1-p.z0)./p.z0*100;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t850'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[250 300]; p.cs1=[250 300]; p.cs2=[-3 3];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.t850_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.t850_aravg)
p.dz=(p.z1-p.z0)./p.z0*100;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t500'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[220 270]; p.cs1=[220 270]; p.cs2=[-3 3];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.t500_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.t500_aravg)
p.dz=(p.z1-p.z0)./p.z0*100;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t250'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[200 240]; p.cs1=[200 240]; p.cs2=[-3 3];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.t250_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.t250_aravg)
p.dz=(p.z1-p.z0)./p.z0*100;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_WS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ws850'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 30]; p.cs1=[0 30]; p.cs2=[-100 100];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.ws850_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.ws850_aravg)
p.dz=(p.z1-p.z0)./p.z0*100;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ws500'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 30]; p.cs1=[0 30]; p.cs2=[-100 100];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.ws500_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.ws500_aravg)
p.dz=(p.z1-p.z0)./p.z0*100;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ws250'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 50]; p.cs1=[0 50]; p.cs2=[-150 150];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.ws250_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.ws250_aravg)
p.dz=(p.z1-p.z0)./p.z0*100;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_TAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tas'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[250 300]; p.cs1=[250 300]; p.cs2=[-5 5];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.tas_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.tas_aravg)
p.dz=(p.z1-p.z0)./p.z0*100;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tasmax'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[250 300]; p.cs1=[250 300]; p.cs2=[-5 5];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.tasmax_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.tasmax_aravg)
p.dz=(p.z1-p.z0)./p.z0*100;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tasmin'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[250 300]; p.cs1=[250 300]; p.cs2=[-5 5];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.tasmin_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.tasmin_aravg)
p.dz=(p.z1-p.z0)./p.z0*100;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_HFLS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='hfls'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 5]; p.cs1=[0 5]; p.cs2=[-100 100];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.hfls_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.hfls_aravg)
p.dz=(p.z1-p.z0)./p.z0*100;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_PRSN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prsn'; p.vname=strcat(vname,'_av_vs_aravg'); p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 3]; p.cs1=[0 3]; p.cs2=[-100 100];
p.s0=strcat('(a)',vname,' (annual mean)'); 
p.s1=strcat('(b)',vname,' (AR average)'); 
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.prsn_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.prsn_aravg)
p.dz=(p.z1-p.z0)./p.z0*100;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='pcp_pct7_fr_ar'; p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 200]; p.cs1=[0 1]; p.cs2=[0 1];
p.s0='(a) Precipitation (99.9 percentile)'; 
p.s1='(b) Precipitation (fraction from AR)'; 
p.s2='(c) (b) minus (a)'; p.str=''; k_pct=6;
p.z0=squeeze(vx.prday_pct  (1,k_pct,:,:)); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.prday_fr_ar(1,k_pct,:,:))
p.dz=p.z1-p.z0;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vx.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas=tas1-tas0;
clear p; [p.dtas1,p.dtas2]=get_dtas(vx,wm,v1,w1);
p.vname='Fig13a-c'; p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs1=[-0.01 0.01]; p.cs2=[-0.01 0.01];
p.s1='(a) FUTURE minus PRESENT (absolute)';p.s0=p.s1;
p.s2='(c) P4K minus CLIMO (absolute)';
p.z1=wm.freq_ar_clm.ann-vx.freq_ar_clm.ann; p.x1=wm.lon; p.y1=wm.lat;
p.z2=w1.freq_ar_clm.ann-v1.freq_ar_clm.ann;  
p.z0=vx.freq_ar_clm.ann; p.z3=v1.freq_ar_clm.ann;  
x=vx.ar.leng;  vx.ar_no =length(x)/vx.nyr;
x=wm.ar.leng;  wm.ar_no =length(x)/wm.nyr; (wm.ar_no-vx.ar_no)/vx.ar_no*100/0.99
x=v1.ar.leng;  v1.ar_no =length(x)/v1.nyr;
x=w1.ar.leng;  w1.ar_no =length(x)/w1.nyr; (w1.ar_no-v1.ar_no)/v1.ar_no*100/4.526
x=wm2.ar.leng; wm2.ar_no=length(x)/wm2.nyr;(wm2.ar_no-vx.ar_no)/vx.ar_no*100/0.99
x=w2.ar.leng;  w2.ar_no =length(x)/w2.nyr; (w2.ar_no-v1.ar_no)/v1.ar_no*100/4.526
for i=1:36
  yr0=2015+i-1;
  yr=wm.ar.yyy;  id=(yr==yr0); no1(i)=sum(id);
  yr=wm2.ar.yyy; id=(yr==yr0); no2(i)=sum(id);
end
plot_2d_diff_warm_2(p); 
