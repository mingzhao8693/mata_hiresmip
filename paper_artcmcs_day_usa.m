%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/backup/ECMWF/'; 
expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=2017;yr2=2017; pct=[99 99.9];
opt='obs'; addtc_to_AR_obs(tpath,expn,yr1,yr2,opt,-30);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/backup/ECMWF/'; diag=0; latlon=[180 340 10 90];
expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=2016;yr2=2016; pct=[99 99.9];
opt='AR'; v=readartcmcs_day_obs_usa(tpath,expn,yr1,yr2,pct,opt,diag,latlon);
opt='TC'; v=readartcmcs_day_obs_usa(tpath,expn,yr1,yr2,pct,opt,diag,latlon);
opt='AL'; v=readartcmcs_day_obs_usa(tpath,expn,yr1,yr2,pct,opt,diag,latlon);
yr1=1985;yr2=2008;
opt='MC'; v=readartcmcs_day_obs_usa(tpath,expn,yr1,yr2,pct,opt,diag,latlon);

tpath='/archive/Ming.Zhao/backup/ECMWF/'; diag=0; latlon=[180 340 10 90];
expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=1985;yr2=2008; pct=[99 99.9];
for yr = yr1:yr2
  opt='MC'; v=readartcmcs_day_obs_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
end

tpath='/archive/Ming.Zhao/backup/ECMWF/'; diag=0; latlon=[180 340 10 90];
expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=1980;yr2=2014; pct=[99 99.9];
for yr = yr1:yr2
  opt='AR'; v=readartcmcs_day_obs_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
  %opt='TC'; v=readartcmcs_day_obs_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
  %opt='AL'; v=readartcmcs_day_obs_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
end

tpath='/archive/Ming.Zhao/awg/warsaw_201803/'; diag=0; latlon=[180 340 10 90];
expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; ardir='AR_climlmt'; yr1=2016;yr2=2020; pct=[99 99.9];
for yr = yr1:yr2
  opt='AR'; v=readartcmcs_day_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
end

tpath='/archive/Ming.Zhao/awg/warsaw_201803/'; diag=0; latlon=[180 340 10 90];
expn='c192L33_am4p0_amip_HIRESMIP_H9_newpp'; ardir='AR_climlmt'; yr1=1979;yr2=2020; pct=[99 99.9];
for yr = yr1:yr2
  opt='AR'; v=readartcmcs_day_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
end

tpath='/archive/Ming.Zhao/awg/2022.03/'; diag=0; latlon=[180 340 10 90];
expn='c192_obs'; ardir='AR_climlmt'; yr1=1979;yr2=1979; pct=[99 99.9];
for yr = yr1:yr2
  opt='AR'; v=readartcmcs_day_mod_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
end


%fn='/home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_hiresmip/ca_precip_annual_mean_ERAI_grid.nc';
%a=ncread(fn,'precip'); a=a'; id_ca=(a>0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%observational analysis of CA precipitation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/'; d=2; s='_readartcmcs_day_usa.mat';
expn='ERAI_6h_DATA'; %expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp';
ardir='AR_climlmt'; yr=1980; yr=num2str(1980); yrs=strcat('_',yr,'_',yr,'_');
fext=strcat(yrs,'AR_diag0',s); fn=strcat(tpath,expn,fext); load(fn);
for t=1:38; t
  yr=num2str(1979+t-1); yrs=strcat('_',yr,'_',yr,'_');
  fext=strcat(yrs,'AR_diag0',s); fn=strcat(tpath,expn,fext); 
  load(fn); d=getregavg(v,v.id_ca,v.aa); ca(t)=d;
  frqday_org (t,:,:,:) = v.frqday_org;
  prday_av   (t,:,:,:) = v.prday_av; 
  prday_idwei(t,:,:,:) = v.prday_idwei;
  prday_idavg(t,:,:,:) = v.prday_idavg;
  prday_idstd(t,:,:,:) = v.prday_idstd;
  prday_idmax(t,:,:,:) = v.prday_idmax;
end
t=1;
for t=1:37
  a=[ca(t).frqday(11:12)      ca(t+1).frqday(1:12)];      c.frqday     (t,:)=get7season(a);
  a=[ca(t).prday_av(11:12)    ca(t+1).prday_av(1:12)];    c.prday_av   (t,:)=get7season(a);
  a=[ca(t).prday_idwei(11:12) ca(t+1).prday_idwei(1:12)]; c.prday_idwei(t,:)=get7season(a);
  a=[ca(t).prday_idavg(11:12) ca(t+1).prday_idavg(1:12)]; c.prday_idavg(t,:)=get7season(a);
  a=[ca(t).prday_idstd(11:12) ca(t+1).prday_idstd(1:12)]; c.prday_idstd(t,:)=get7season(a);
  a=[ca(t).prday_idmax(11:12) ca(t+1).prday_idmax(1:12)]; c.prday_idmax(t,:)=get7season(a);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m1=8; m2=19;
y0=mean(c.frqday     (:,m1:m2),1)*100; 
y1=mean(c.prday_av   (:,m1:m2),1); 
y2=mean(c.prday_idwei(:,m1:m2),1); 
y3=nanmean(c.prday_idavg(:,m1:m2),1);
y4=nanmean(c.prday_idstd(:,m1:m2),1);
y5=nanmean(c.prday_idmax(:,m1:m2),1);
m=5; xt=[1979:2015];
z0=c.frqday     (:,m)*100; 
z1=c.prday_av   (:,m); %z1=z1-mean(z1); 
z2=c.prday_idwei(:,m); %z2=z2-mean(z2);
z3=c.prday_idavg(:,m); 
z4=c.prday_idmax(:,m); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1000, 1200]*1.2; m1=8; m2=19; x=[1:12]; fsize=10; ms=8; lw=1;
handle=figure('Position',pms,'visible','on'); row=3; col=2;
subplot(row,col,1)
plot(x,y1,'.k-','MarkerSize',ms,'LineWidth',lw);hold on
plot(x,y2,'.b-','MarkerSize',ms,'LineWidth',lw); axis([1 12 0 3.5]);
s1='total precip'; s2='AR precip'; legend(s1,s2,'location','north'); 
yl='precipitation (mm/day)'; ylabel(yl,'FontSize',fsize); 
subplot(row,col,3)
plot(x,y3,'.b-','MarkerSize',ms,'LineWidth',lw);hold on
plot(x,y5,'.r-','MarkerSize',ms,'LineWidth',lw); 
shadedplot(x,y3-y4, y3+y4,[0.7 0.7 0.7],'k'); hold on;
plot(x,y3,'.b-','MarkerSize',ms,'LineWidth',lw);
plot(x,y5,'.r-','MarkerSize',ms,'LineWidth',lw); axis([1 12 0 35]);
s1='AR mean precip'; s2='AR max precip'; legend(s1,s2,'location','north'); 
yl='precipitation (mm/day)'; ylabel(yl,'FontSize',fsize); 
subplot(row,col,5)
plot(x,y0,'.b-','MarkerSize',ms,'LineWidth',lw); axis([1 12 0 15]);
yl='frequency of occurrence (%)'; ylabel(yl,'FontSize',fsize); 
xl='month'; xlabel(xl,'FontSize',fsize); 
subplot(row,col,2);
plot(xt,z1,'.k-','MarkerSize',ms,'LineWidth',lw); hold on; 
plot(xt,z2,'.b-','MarkerSize',ms,'LineWidth',lw); grid on;
s1='total precip'; s2='AR precip'; legend(s1,s2,'location','northeast'); 
axis([1979 2015 0 5.5]);
yl='precipitation (mm/day)'; ylabel(yl,'FontSize',fsize); 
subplot(row,col,4);
plot(xt,z3,'.b-','MarkerSize',ms,'LineWidth',lw); hold on; 
plot(xt,z4,'.r-','MarkerSize',ms,'LineWidth',lw); grid on;
s1='AR mean precip'; s2='AR max precip'; legend(s1,s2,'location','northeast'); 
axis([1979 2015 0 55]);
yl='precipitation (mm/day)'; ylabel(yl,'FontSize',fsize); 
subplot(row,col,6);
plot(xt,z0,'.b-','MarkerSize',ms,'LineWidth',lw); hold on; 
axis([1979 2015 0 20]);
yl='frequency of occurrence (%)'; ylabel(yl,'FontSize',fsize); 
xl='year'; xlabel(xl,'FontSize',fsize); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CA/'; expn='ca'; vname='ca_precip'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for t=1:35
  y1(t)=mean(ca(t).frqday_org (m1:m2));
  y2(t)=mean(ca(t).prday_av   (m1:m2));
  y3(t)=mean(ca(t).prday_idwei(m1:m2));
  y4(t)=mean(ca(t).prday_idavg(m1:m2));
end
figure; plot(y2,'r'); hold on; plot(y3,'g'); plot(y1*10,'b');

figure; plot(y1); hold on; plot(y2); plot(y3); plot(y4);

figure; 
pcolor(v.lon,v.lat,squeeze(prday_av(1,2,:,:))); 
shading flat; colorbar; colormap(jet); hold on;
contour(v.lon,v.lat,v.lm,'w');
usamap('CA');




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];latlon=[180 340 10 90];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; ardir='AR_climlmt';yr1=1980;yr2=2014;diag=0;
for yr=yr1:yr2
  %opt='AL';  v.al=readartcmcs_day_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
  %opt='MC';  v.mc=readartcmcs_day_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
   opt='AR';  v.ar=readartcmcs_day_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
  %opt='TC';  v.tc=readartcmcs_day_usa(tpath,expn,yr,yr,pct,opt,diag,latlon);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];diag=0;
expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp'; ardir='AR_climlmt';yr1=2015;yr2=2050;
%opt='mod'; addtc_to_AR(tpath,expn,yr1,yr2,opt,-30)
opt='AL';  v.al=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='MC';  v.mc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AR';  v.ar=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TC';  v.tc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%opt='mod'; v=readarmap_allday(tpath,expn,yr1,yr2,pct,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_2010climo_new_newpp'; ardir='AR_climlmt'; yr1=2;yr2=101;diag=0;
%opt='mod'; addtc_to_AR(tpath,expn,yr1,yr2,opt,-30)
opt='MC';  v.mc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%opt='AR';  vm=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%v=readar_limit_new(tpath,expn,yr1,yr2,ardir);
%opt='PR05';v.p5=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%opt='OP';  v.op=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%opt='AL';  v.al=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AR';  v.ar=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TC';  v.tc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TD';  v.td=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='MC';  v.mc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%opt='mod'; v=readarmap_allday(tpath,expn,yr1,yr2,pct,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_2010climo_new_p4K_newpp'; ardir='AR_climlmt';yr1=2;yr2=101;diag=0;
%opt='mod'; addtc_to_AR(tpath,expn,yr1,yr2,opt,-30)
opt='MC';  v.mc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);

%v=readar_limit_new(tpath,expn,yr1,yr2,ardir);
%opt='PR05';v.p5=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%opt='OP';  v.op=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%opt='AL';  v.al=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AR';  v.ar=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TC';  v.tc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TD';  v.td=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='MC';  v.mc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%opt='mod'; v=readarmap_allday(tpath,expn,yr1,yr2,pct,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_2010climo_new_p4K_4xCO2_newpp'; ardir='AR_climlmt';yr1=2;yr2=101;diag=1;
%v=readar_limit_new(tpath,expn,yr1,yr2,ardir);
%opt='mod'; addtc_to_AR(tpath,expn,yr1,yr2,opt,-50)
opt='AL';  v.al=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AR';  v.ar=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TC';  v.tc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TD';  v.td=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='MC';  v.mc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%opt='mod'; v=readarmap_allday(tpath,expn,yr1,yr2,pct,opt,diag);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_2010climo_new_4xCO2_newpp'; ardir='AR_climlmt';yr1=2;yr2=101;diag=1;
%v=readar_limit_new(tpath,expn,yr1,yr2,ardir);
%opt='mod'; addtc_to_AR(tpath,expn,yr1,yr2,opt,-50)
opt='AL';  v.al=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AR';  v.ar=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TC';  v.tc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TD';  v.td=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='MC';  v.mc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%opt='mod'; v=readarmap_allday(tpath,expn,yr1,yr2,pct,opt,diag);
%v=readar_limit_new(tpath,expn,yr1,yr2,ardir);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_climo_hiresmip_futureSST_4xCO2_newpp'; ardir='AR_climlmt';yr1=2;yr2=101;diag=1;
%v=readar_limit_new(tpath,expn,yr1,yr2,ardir);
%opt='mod'; addtc_to_AR(tpath,expn,yr1,yr2,opt,-50)
opt='AL';  v.al=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AR';  v.ar=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TC';  v.tc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TD';  v.td=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='MC';  v.mc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%v=readar_limit_new(tpath,expn,yr1,yr2,ardir);
%opt='mod'; v=readarmap_allday(tpath,expn,yr1,yr2,pct,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('/work/miz/mat_hiresmip/c192L33_am4p0_2010climo_new_newpp_2_3_PR10_diag2_readartcmcs_day.mat')
vv=v;

tpath='/work/miz/mat_hiresmip/';
expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; yrs='_1979_2014_';ardir='AR_climlmt'
fext=strcat(yrs,'readarmap_allday1.mat'); fn=strcat(tpath,expn,fext); load(fn);vm=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/';
expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp'; yrs='_2015_2050_';ardir='AR_climlmt'
fext=strcat(yrs,'readarmap_allday1.mat'); fn=strcat(tpath,expn,fext); load(fn);wm=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load observations%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/'; d=2; s='_readartcmcs_day.mat';
expn='ERAI_6h_DATA'; yrs='_1979_2014_';ardir='AR_climlmt'
fext=strcat(yrs,'AR_diag0',s); fn=strcat(tpath,expn,fext); load(fn);ob.ar=v;
fext=strcat(yrs,'TC_diag0',s); fn=strcat(tpath,expn,fext); load(fn);ob.tc=v;
fext=strcat('_1985_2008_MC_diag0',s); fn=strcat(tpath,expn,fext); load(fn);ob.mc=v;
fext=strcat('_1985_2008_AL_diag0',s); fn=strcat(tpath,expn,fext); load(fn);ob.al=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/'; d=0; s='_readartcmcs_day.mat';
expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; yrs='_1979_2014_';ardir='AR_climlmt'
fext=strcat(yrs,'AR_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);vm.ar=v;
fext=strcat(yrs,'TC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);vm.tc=v;
fext=strcat(yrs,'MC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);vm.mc=v;
fext=strcat(yrs,'AL_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);vm.al=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/'; d=0; s='_readartcmcs_day.mat';
expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp'; yrs='_2015_2050_';ardir='AR_climlmt'
fext=strcat(yrs,'AR_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);wm.ar=v;
fext=strcat(yrs,'TC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);wm.tc=v;
fext=strcat(yrs,'MC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);wm.mc=v;
fext=strcat(yrs,'AL_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);wm.al=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/'; d=0; s='_readartcmcs_day.mat';
expn='c192L33_am4p0_2010climo_new_newpp'; yrs='_2_101_';ardir='AR_climlmt';%yrs1='_2_31_';
fext=strcat(yrs,'AR_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);v1.ar=v;
fext=strcat(yrs,'TC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);v1.tc=v;
fext=strcat(yrs,'MC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);v1.mc=v;
%fext=strcat(yrs,'TD_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);v1.td=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/'; d=0;
expn='c192L33_am4p0_2010climo_new_p4K_newpp'; yrs='_2_101_';ardir='AR_climlmt'
fext=strcat(yrs,'AR_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w1.ar=v;
fext=strcat(yrs,'TC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w1.tc=v;
fext=strcat(yrs,'MC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w1.mc=v;
%fext=strcat(yrs,'TD_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w1.td=v;
%fext=strcat(yrs,'AL_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w1.al=v;
%fext=strcat(yrs,'PR05_diag',num2str(d),s);fn=strcat(tpath,expn,fext);load(fn);v1.p5=v;
%fext=strcat(yrs,'OP_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);v1.op=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/'; d=1;
expn='c192L33_am4p0_2010climo_new_p4K_4xCO2_newpp'; yrs='_2_101_';ardir='AR_climlmt'
fext=strcat(yrs,'AL_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w2.al=v;
fext=strcat(yrs,'AR_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w2.ar=v;
fext=strcat(yrs,'TC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w2.tc=v;
fext=strcat(yrs,'TD_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w2.td=v;
fext=strcat(yrs,'MC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w2.mc=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/'; d=1;
expn='c192L33_am4p0_2010climo_new_4xCO2_newpp'; yrs='_2_101_';ardir='AR_climlmt'
fext=strcat(yrs,'AL_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);g1.al=v;
fext=strcat(yrs,'AR_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);g1.ar=v;
fext=strcat(yrs,'TC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);g1.tc=v;
fext=strcat(yrs,'TD_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);g1.td=v;
fext=strcat(yrs,'MC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);g1.mc=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/'; d=1;
expn='c192L33_am4p0_climo_hiresmip_futureSST_4xCO2_newpp'; yrs='_2_101_';ardir='AR_climlmt'
fext=strcat(yrs,'AL_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w3.al=v;
fext=strcat(yrs,'AR_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w3.ar=v;
fext=strcat(yrs,'TC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w3.tc=v;
fext=strcat(yrs,'TD_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w3.td=v;
fext=strcat(yrs,'MC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w3.mc=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: new model - obs comparison
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig1: AR/TS/MSC days (frequency)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %occurrence frequency: fraction of all days
p.vname='Fig1'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(ob.mc.prday_fqwet(1,:,:,2))*100;
p.z2=squeeze(v0.mc.prday_fqwet(1,:,:,2))*100;
p.z3=squeeze(ob.ar.frqday)*100;
p.z4=squeeze(v0.ar.frqday)*100; p.z4=p.z4-p.z3;   
p.z5=squeeze(ob.tc.frqday)*100;
p.z6=squeeze(v0.tc.frqday)*100;
p.z7=squeeze(ob.mc.frqday)*100;    
p.z8=squeeze(v0.mc.frqday)*100; %p.z8=p.z8-p.z7;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) frequency of wet days; OBS';
p.s2='(e) frequency of wet days; MOD';
p.s3='(b) frequency of AR days; OBS';
p.s4='(f) frequency of AR days; MOD'; 
p.s5='(c) frequency of TS days; OBS'; 
p.s6='(g) frequency of TS days; MOD'; 
p.s7='(d) frequency of MCS days; OBS';
p.s8='(h) frequency of MCS days; MOD';
a=[0 100]; p.c1=a; p.c2=a; p.optit=0;
a=[0 40];  p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a; p.c4=[-5 5];
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig1a new: AR/TS/MSC days (frequency)%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='obs'; %occurrence frequency: fraction of all days
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='frqday'; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(ob.mc.prday_fqwet(1,:,:,2))*100;
p.z2=squeeze(ob.ar.frqday)*100;   
p.z3=squeeze(ob.tc.frqday)*100;
p.z4=squeeze(ob.mc.frqday)*100;    
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) frequency of wet day (OBS)';
p.s2='(b) frequency of AR days (MOD)'; 
p.s3='(c) frequency of TS days (OBS)'; 
p.s4='(d) frequency of MCS days (MOD)'; 
%p.s5='(e) frequency of MCS days (OBS)';
%p.s6='(f) frequency of MCS days (MOD)';
p.c1=[0 100]; a=[0 40]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=[0 40];
plot_2d_4panel_obs(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig1b: AR/TS/MSC days (frequency)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %occurrence frequency: fraction of all days
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='frqday'; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(ob.ar.frqday)*100;
p.z2=squeeze(v1.ar.frqday)*100;   
p.z3=squeeze(ob.tc.frqday)*100;
p.z4=squeeze(v1.tc.frqday)*100;
p.z5=squeeze(ob.mc.frqday)*100;    
p.z6=squeeze(v1.mc.frqday)*100;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) frequency of AR days (OBS)';
p.s2='(b) frequency of AR days (MOD)'; 
p.s3='(c) frequency of TS days (OBS)'; 
p.s4='(d) frequency of TS days (MOD)'; 
p.s5='(e) frequency of MCS days (OBS)';
p.s6='(f) frequency of MCS days (MOD)';
p.c1=[0 40]; a=[0 40]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=[0 40];
plot_2d_6panel_obs(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2: annual mean precip contributed from AR/TS/MSC %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %all time mean prday from each weather type
p.vname='Fig2'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(ob.ar.prday_av);   
p.z2=squeeze(v0.ar.prday_av);   
p.z3=squeeze(ob.ar.prday_idwei); 
p.z4=squeeze(v0.ar.prday_idwei);
p.z5=squeeze(ob.tc.prday_idwei);    
p.z6=squeeze(v0.tc.prday_idwei);    
p.z7=squeeze(ob.mc.prday_idwei);    
p.z8=squeeze(v0.mc.prday_idwei);    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean Pr; OBS';
p.s2='(e) annual mean Pr; MOD'; 
p.s3='(b) annual mean Pr from AR; OBS'; 
p.s4='(f) annual mean Pr from AR; MOD'; 
p.s5='(c) annual mean Pr from TS; OBS';
p.s6='(g) annual mean Pr from TS; MOD'; 
p.s7='(d) annual mean Pr from MCS; OBS';
p.s8='(h) annual mean Pr from MCS; MOD';
a=[1 10]; p.c1=a; p.c2=a; p.optit=1;
a=[0 3 ]; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2a: annual mean precip contributed from U25 of AR/TS/MSC days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %all time mean prday from each weather type
p.vname='Fig2a_U25'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
i=4; p.vname='Fig2a_U25';
p.z1=squeeze(ob.ar.prday_av);   
p.z2=squeeze(v0.ar.prday_av);   
p.z3=squeeze(ob.ar.prday_idpct_wei(:,i,:,:));
p.z4=squeeze(v0.ar.prday_idpct_wei(:,i,:,:));
p.z5=squeeze(ob.tc.prday_idpct_wei(:,i,:,:));
p.z6=squeeze(v0.tc.prday_idpct_wei(:,i,:,:));
p.z7=squeeze(ob.mc.prday_idpct_wei(:,i,:,:));
p.z8=squeeze(v0.mc.prday_idpct_wei(:,i,:,:));
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean Pr; OBS';
p.s2='(e) annual mean Pr; MOD'; 
p.s3='(b) annual mean Pr from AR; OBS'; 
p.s4='(f) annual mean Pr from AR; MOD'; 
p.s5='(c) annual mean Pr from TS; OBS';
p.s6='(g) annual mean Pr from TS; MOD'; 
p.s7='(d) annual mean Pr from MCS; OBS';
p.s8='(h) annual mean Pr from MCS; MOD';
a=[1 10]; p.c1=a; p.c2=a; 
a=[0 3 ]; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2b: annual mean precip contributed from U50 of AR/TS/MSC days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %all time mean prday from each weather type
p.vname='Fig2b_U50'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
i=3; p.vname='Fig2b_U50';
p.z1=squeeze(ob.ar.prday_av);   
p.z2=squeeze(v0.ar.prday_av);   
p.z3=squeeze(ob.ar.prday_idpct_wei(:,i,:,:));
p.z4=squeeze(v0.ar.prday_idpct_wei(:,i,:,:));
p.z5=squeeze(ob.tc.prday_idpct_wei(:,i,:,:));
p.z6=squeeze(v0.tc.prday_idpct_wei(:,i,:,:));
p.z7=squeeze(ob.mc.prday_idpct_wei(:,i,:,:));
p.z8=squeeze(v0.mc.prday_idpct_wei(:,i,:,:));
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean Pr; OBS';
p.s2='(e) annual mean Pr; MOD'; 
p.s3='(b) annual mean Pr from AR; OBS'; 
p.s4='(f) annual mean Pr from AR; MOD'; 
p.s5='(c) annual mean Pr from TS; OBS';
p.s6='(g) annual mean Pr from TS; MOD'; 
p.s7='(d) annual mean Pr from MCS; OBS';
p.s8='(h) annual mean Pr from MCS; MOD';
a=[1 10]; p.c1=a; p.c2=a; 
a=[0 3 ]; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig3: annual mean precip contributed from AR/TS/MSC %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; p.optit=2; 
p.vname='Fig3'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; aa=p.aa;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
obs=squeeze(ob.ar.prday_av); o_avg=mean(mean(obs.*aa));
mod=squeeze(v0.ar.prday_av); m_avg=mean(mean(mod.*aa)); 
a=squeeze(ob.ar.prday_idwei); p.z1=a./obs*100; p.z1_avg=mean(mean(a.*aa))/o_avg*100;
a=squeeze(v0.ar.prday_idwei); p.z2=a./mod*100; p.z2_avg=mean(mean(a.*aa))/m_avg*100;
a=squeeze(ob.tc.prday_idwei); p.z3=a./obs*100; p.z3_avg=mean(mean(a.*aa))/o_avg*100;    
a=squeeze(v0.tc.prday_idwei); p.z4=a./mod*100; p.z4_avg=mean(mean(a.*aa))/m_avg*100;   
a=squeeze(ob.mc.prday_idwei); p.z5=a./obs*100; p.z5_avg=mean(mean(a.*aa))/o_avg*100;   
a=squeeze(v0.mc.prday_idwei); p.z6=a./mod*100; p.z6_avg=mean(mean(a.*aa))/m_avg*100;   
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) percent of annual Pr from AR; OBS'; 
p.s2='(d) percent of annual Pr from AR; MOD'; 
p.s3='(b) percent of annual Pr from TS; OBS';
p.s4='(e) percent of annual Pr from TS; MOD'; 
p.s5='(c) percent of annual Pr from MCS; OBS';
p.s6='(f) percent of annual Pr from MCS; MOD';
a=[0 80 ]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.optit=1;
plot_2d_6panel_new(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig4: global mean daily Pr variability%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='Fig4'; ms=3; fsize=10; lw=0.1; ws=1;
a=squeeze(ob.al.prday_idwei_ts_day); xo  =getclim(a);
a=squeeze(ob.al.prday_nonid_ts_day); yo  =getclim(a);
a=squeeze(ob.al.prday_av_ts_day);    zo  =getclim(a);
a=squeeze(ob.ar.prday_idwei_ts_day); xoar=getclim(a);
a=squeeze(ob.tc.prday_idwei_ts_day); xotc=getclim(a);
a=squeeze(ob.mc.prday_idwei_ts_day); xomc=getclim(a);
a=squeeze(vm.al.prday_idwei_ts_day); xm  =getclim(a);
a=squeeze(vm.al.prday_nonid_ts_day); ym  =getclim(a);
a=squeeze(vm.al.prday_av_ts_day);    zm  =getclim(a);
a=squeeze(vm.ar.prday_idwei_ts_day); xmar=getclim(a);
a=squeeze(vm.tc.prday_idwei_ts_day); xmtc=getclim(a);
a=squeeze(vm.mc.prday_idwei_ts_day); xmmc=getclim(a);
pms=[ 0, 0, 950, 800]*1.1; row=2; col=2;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); t=[1:365]; xy=[1 365 -0.25 0.15]; lb='(a)';
x1=xo.ano_clim;   y1=yo.ano_clim;   z1=zo.ano_clim; 
xa=xoar.ano_clim; xb=xotc.ano_clim; xc=xomc.ano_clim; 
a=mizsmooth(z1,ws); plot(t,a,'-k','LineWidth',lw); sz=corrslop(y1,x1); hold on;
a=mizsmooth(x1,ws); plot(t,a,'-r','LineWidth',lw); sx=corrslop(x1,z1); 
a=mizsmooth(y1,ws); plot(t,a,'-b','LineWidth',lw); sy=corrslop(y1,z1); 
%a=mizsmooth(xa,ws); plot(t,a,'-m','LineWidth',lw); sa=corrslop(xa,z1); 
%a=mizsmooth(xb,ws); plot(t,a,'-c','LineWidth',lw); sb=corrslop(xb,z1); 
%a=mizsmooth(xc,ws); plot(t,a,'-g','LineWidth',lw); sc=corrslop(xc,z1); 
%plot(t,x1+y1,'.g','MarkerSize',ms); 
s1=sprintf('all days (mean=%5.2f)',mean(zo.clim));
s2=sprintf('storm days (mean=%5.2f; corr=%5.2f)',mean(xo.clim),sx.r(1));
s3=sprintf('non-storm days (mean=%5.2f; corr=%5.2f)',mean(yo.clim),sy.r(1));
legend(s1,s2,s3,'location','southwest'); grid on;
xl='day of year'; yl='global mean daily Pr (mm/day)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); ; axis(xy);
title('(a) OBS','FontSize',fsize); %mylabel(xy,1,lb,fsize);
subplot(row,col,2); t=[1:365]; xy=[1 365 -0.25 0.15]; lb='(a)';
x1=xm.ano_clim;  y1=ym.ano_clim;  z1=zm.ano_clim;
xa=xma.ano_clim; xb=xmb.ano_clim; xc=xmc.ano_clim; 
a=mizsmooth(z1,ws); plot(t,a,'-k','LineWidth',lw); sz=corrslop(y1,x1); hold on;
a=mizsmooth(x1,ws); plot(t,a,'-r','LineWidth',lw); sx=corrslop(x1,z1); 
a=mizsmooth(y1,ws); plot(t,a,'-b','LineWidth',lw); sy=corrslop(y1,z1); 
%a=mizsmooth(xa,ws); plot(t,a,'-m','LineWidth',lw); sa=corrslop(xa,z1); 
%a=mizsmooth(xb,ws); plot(t,a,'-c','LineWidth',lw); sb=corrslop(xb,z1); 
%a=mizsmooth(xc,ws); plot(t,a,'-g','LineWidth',lw); sc=corrslop(xc,z1); 
%plot(t,x1+y1,'.g','MarkerSize',ms); 
s1=sprintf('all days (mean=%5.2f)',mean(zm.clim));
s2=sprintf('storm days (mean=%5.2f; corr=%5.2f)',mean(xm.clim),sx.r(1));
s3=sprintf('non-storm days (mean=%5.2f; corr=%5.2f)',mean(ym.clim),sy.r(1));
legend(s1,s2,s3,'location','southwest'); grid on;
xl='day of year'; yl='global mean daily Pr (mm/day)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); ; axis(xy);
title('(c) MOD','FontSize',fsize); %mylabel(xy,1,lb,fsize);
subplot(row,col,3); a=0.7; x0=[-a:0.01:a]; xy=[-a a -a a];
x1=xo.ano_day; y1=yo.ano_day; z1=zo.ano_day;
plot(x1,z1,'r.','MarkerSize',ms); sx=corrslop(x1,z1); hold on;
plot(y1,z1,'b.','MarkerSize',ms); sy=corrslop(y1,z1); sz=corrslop(y1,x1);
%plot(x1+y1,z1,'g.','MarkerSize',ms); sz=corrslop(y1,x1);
p=sx; plot(x0,p.s(1)*x0+p.s(2),'r-','LineWidth',lw);
p=sy; plot(x0,p.s(1)*x0+p.s(2),'b-','LineWidth',lw);
s1=sprintf('storm days (corr=%5.2f)',sx.r(1));
s2=sprintf('non-storm days (corr=%5.2f)',sy.r(1));
legend(s1,s2,'location','southwest'); grid on;
xl='{          }anomalous Pr from storm/non-storm days (mm/day)';
yl='{      }anomalous global mean daily Pr (mm/day)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); ; axis(xy);
title('(b) OBS','FontSize',fsize); %mylabel(xy,1,lb,fsize);
subplot(row,col,4); a=0.7; x0=[-a:0.01:a]; xy=[-a a -a a];
x1=xm.ano_day; y1=ym.ano_day; z1=zm.ano_day;
plot(x1,z1,'r.','MarkerSize',ms); sx=corrslop(x1,z1); hold on;
plot(y1,z1,'b.','MarkerSize',ms); sy=corrslop(y1,z1); sz=corrslop(y1,x1);
%plot(x1+y1,z1,'g.','MarkerSize',ms); sz=corrslop(y1,x1);
p=sx; plot(x0,p.s(1)*x0+p.s(2),'r-','LineWidth',lw);
p=sy; plot(x0,p.s(1)*x0+p.s(2),'b-','LineWidth',lw);
s1=sprintf('storm days (corr=%5.2f)',sx.r(1));
s2=sprintf('non-storm days (corr=%5.2f)',sy.r(1));
legend(s1,s2,'location','southwest'); grid on;
xl='{          }anomalous Pr from storm/non-storm days (mm/day)';
yl='{      }anomalous global mean daily Pr (mm/day)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); ; axis(xy);
title('(d) MOD','FontSize',fsize); %mylabel(xy,1,lb,fsize);
visfig='off'; figpath='./fig_PE/'; expn='ctl'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5: fraction of extreme precip from AR/TS/TD/MSC days%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %fraction of P>P99 from each weather type
p.vname='Fig5'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(ob.mc.prday_pct(:,1,:,:));
p.z2=squeeze(v0.ar.prday_pct(:,1,:,:));
p.z3=squeeze(ob.ar.prday_fp99_from_id)*100;   
p.z4=squeeze(v0.ar.prday_fp99_from_id)*100;   
p.z5=squeeze(ob.tc.prday_fp99_from_id)*100;
p.z6=squeeze(v0.tc.prday_fp99_from_id)*100;
p.z7=squeeze(ob.mc.prday_fp99_from_id)*100;
p.z8=squeeze(v0.mc.prday_fp99_from_id)*100;
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) 99 percentile of daily Pr; OBS';
p.s2='(e) 99 percentile of daily Pr; MOD';
p.s3='(b) fraction from AR; OBS';
p.s4='(f) fraction from AR; MOD'; 
p.s5='(c) fraction from TS; OBS'; 
p.s6='(g) fraction from TS; MOD'; 
p.s7='(d) fraction from MCS; OBS';
p.s8='(h) fraction from MCS; MOD';
a=[1 80]; p.c1=a; p.c2=a; p.optit=2;
a=[0 100 ]; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.c7=a; p.c8=a;
plot_2d_8panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5a: fraction of extreme precip from AR/TS/TD/MSC days%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='obs'; %fraction of P>P99 from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='prday_fp99_from_id'; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(ob.ar.prday_pct(:,1,:,:));
p.z2=squeeze(v1.ar.prday_fp99_from_id);   
p.z3=squeeze(ob.tc.prday_fp99_from_id);
p.z4=squeeze(v1.mc.prday_fp99_from_id);
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) 99 percentile of daily precipitation';
p.s2='(b) fraction from AR'; 
p.s3='(c) fraction from TS'; 
p.s4='(d) fraction from MCS'; 
p.c1=[0 100]; a=[0 1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_4panel_obs(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig6: Precipitation averaged over all AR/TS/TD/MSC days%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; no=30; p.vname='prday_idavg';
p.vname='Fig6'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; aa=p.aa;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=128; p.c='k';
v=ob.ar; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z1]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z1_avg=mean(a(id).*b);
v=v0.ar; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z2]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z2_avg=mean(a(id).*b);
v=ob.tc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z3]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z3_avg=mean(a(id).*b);
v=v0.tc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z4]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z4_avg=mean(a(id).*b);
v=ob.mc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z5]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z5_avg=mean(a(id).*b);
v=v0.mc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z6]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z6_avg=mean(a(id).*b);
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) Pr averaged over all AR days; OBS';
p.s2='(d) Pr averaged over all AR days; MOD'; 
p.s3='(b) Pr averaged over all TS days; OBS'; 
p.s4='(e) Pr averaged over all TS days; MOD'; 
p.s5='(c) Pr averaged over all MCS days; OBS';
p.s6='(f) Pr averaged over all MCS days; MOD';
a=[1 25]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.optit=0
plot_2d_6panel_new(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig7: Precipitation averaged over certain AR/TS/TD/MCS days%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %p.vname='prday_idavg_U25';
p.vname='Fig7'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=128; p.c='k';
i=4; no=30;
v=ob.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z1]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z1_avg=mean(a(id).*b);
v=v0.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z2]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z2_avg=mean(a(id).*b);
v=ob.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z3]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z3_avg=mean(a(id).*b);
v=v0.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z4]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z4_avg=mean(a(id).*b);
v=ob.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z5]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z5_avg=mean(a(id).*b);
v=v0.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z6]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z6_avg=mean(a(id).*b);
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) Pr averaged over 25% heaviest-Pr AR days; OBS';
p.s2='(d) Pr averaged over 25% heaviest-Pr AR days; MOD'; 
p.s3='(b) Pr averaged over 25% heaviest-Pr TS days; OBS'; 
p.s4='(e) Pr averaged over 25% heaviest-Pr TS days; MOD'; 
p.s5='(c) Pr averaged over 25% heaviest-Pr MCS days; OBS';
p.s6='(f) Pr averaged over 25% heaviest-Pr MCS days; MOD';
a=[1 50]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.optit=0;
plot_2d_6panel_new(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig7a: Precipitation averaged over certain AR/TS/TD/MCS days%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %weather type mean prday
p.vname='Fig7a_prday_idpct_U50'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=128; p.c='k';
i=3; no=30;
v=ob.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z1]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z1_avg=mean(a(id).*b);
v=v0.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z2]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z2_avg=mean(a(id).*b);
v=ob.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z3]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z3_avg=mean(a(id).*b);
v=v0.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z4]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z4_avg=mean(a(id).*b);
v=ob.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z5]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z5_avg=mean(a(id).*b);
v=v0.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z6]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z6_avg=mean(a(id).*b);
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) Pr averaged over 50% heaviest-Pr AR days; OBS';
p.s2='(d) Pr averaged over 50% heaviest-Pr AR days; MOD'; 
p.s3='(b) Pr averaged over 50% heaviest-Pr TS days; OBS'; 
p.s4='(e) Pr averaged over 50% heaviest-Pr TS days; MOD'; 
p.s5='(c) Pr averaged over 50% heaviest-Pr MCS days; OBS';
p.s6='(f) Pr averaged over 50% heaviest-Pr MCS days; MOD';
a=[1 40]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.optit=0;
plot_2d_6panel_new(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig7b: Precipitation averaged over certain AR/TS/TD/MCS days%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %p.vname='prday_idavg_U10';
p.vname='Fig7b_prday_idpct_U10'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=128; p.c='k';
i=5; no=30;
v=ob.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z1]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z1_avg=mean(a(id).*b);
v=v0.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z2]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z2_avg=mean(a(id).*b);
v=ob.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z3]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z3_avg=mean(a(id).*b);
v=v0.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z4]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z4_avg=mean(a(id).*b);
v=ob.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z5]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z5_avg=mean(a(id).*b);
v=v0.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z6]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z6_avg=mean(a(id).*b);
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) Pr averaged over 10% heaviest-Pr AR days; OBS';
p.s2='(d) Pr averaged over 10% heaviest-Pr AR days; MOD'; 
p.s3='(b) Pr averaged over 10% heaviest-Pr TS days; OBS'; 
p.s4='(e) Pr averaged over 10% heaviest-Pr TS days; MOD'; 
p.s5='(c) Pr averaged over 10% heaviest-Pr MCS days; OBS';
p.s6='(f) Pr averaged over 10% heaviest-Pr MCS days; MOD';
a=[1 80]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.optit=0;
plot_2d_6panel_new(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig8: Precipitation averaged over certain AR/TS/TD/MCS days%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %p.vname='prday_idavg_L25';
p.vname='Fig8'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=128; p.c='k';
i=1; no=30;
v=ob.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z1]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z1_avg=mean(a(id).*b);
v=v0.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z2]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z2_avg=mean(a(id).*b);
v=ob.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z3]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z3_avg=mean(a(id).*b);
v=v0.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z4]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z4_avg=mean(a(id).*b);
v=ob.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z5]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z5_avg=mean(a(id).*b);
v=v0.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z6]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z6_avg=mean(a(id).*b);
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) Pr averaged over 25% lightest-Pr AR days; OBS';
p.s2='(d) Pr averaged over 25% lightest-Pr AR days; MOD'; 
p.s3='(b) Pr averaged over 25% lightest-Pr TS days; OBS'; 
p.s4='(e) Pr averaged over 25% lightest-Pr TS days; MOD'; 
p.s5='(c) Pr averaged over 25% lightest-Pr MCS days; OBS';
p.s6='(f) Pr averaged over 25% lightest-Pr MCS days; MOD';
a=[1 25]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; 
plot_2d_6panel_new(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig8a: Precipitation averaged over certain AR/TS/TD/MCS days%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=vm; v=v0.ar; p.expn='ctl-obs'; %weather type mean prday
p.vname='Fig8a_prday_idpct_L50'; p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=128; p.c='k';
i=2; no=30;
v=ob.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z1]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z1_avg=mean(a(id).*b);
v=v0.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z2]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z2_avg=mean(a(id).*b);
v=ob.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z3]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z3_avg=mean(a(id).*b);
v=v0.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z4]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z4_avg=mean(a(id).*b);
v=ob.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z5]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z5_avg=mean(a(id).*b);
v=v0.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z6]=compute_se(a1,s1,n1,no); a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; 
b=b(id)/mean(b(id)); p.z6_avg=mean(a(id).*b);
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) Pr averaged over 50% lightest-Pr AR days; OBS';
p.s2='(d) Pr averaged over 50% lightest-Pr AR days; MOD'; 
p.s3='(b) Pr averaged over 50% lightest-Pr TS days; OBS'; 
p.s4='(e) Pr averaged over 50% lightest-Pr TS days; MOD'; 
p.s5='(c) Pr averaged over 50% lightest-Pr MCS days; OBS';
p.s6='(f) Pr averaged over 50% lightest-Pr MCS days; MOD';
a=[1 25]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; 
plot_2d_6panel_new(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%p4K minus Ctl
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig9 change in annual mean Pr contributed from AR/TS/MSC%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='Fig9'; v=v1.ar; p.expn='p4K_minus_ctl'; p.xy=[0 360 -90 90]; 
p.lm=v.lm; p.x=v.lon; p.y=v.lat; %p.vname='del_prday_idwei';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
p.z1=squeeze(w1.ar.prday_av   -v1.ar.prday_av)/dTs;
p.z2=squeeze(w1.ar.prday_idwei-v1.ar.prday_idwei)/dTs;   
p.z3=squeeze(w1.tc.prday_idwei-v1.tc.prday_idwei)/dTs;
p.z4=squeeze(w1.mc.prday_idwei-v1.mc.prday_idwei)/dTs;    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual precipitation';
p.s2='(b) \Delta AR precipitation'; 
p.s3='(c) \Delta TS precipitation'; 
p.s4='(d) \Delta MCS precipitation'; p.optit=1;
p.c1=[-0.4 0.4]; a=[-0.2 0.2]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=[-0.4 0.4]; 
plot_2d_4panel_new(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig9a change in annual mean Pr contributed from AR/TS/MSC%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='Fig9a'; v=v1.ar; p.expn='p4K_minus_ctl'; p.xy=[0 360 -90 90]; 
p.lm=v.lm; p.x=v.lon; p.y=v.lat; %p.vname='del_prday_idwei';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; aa=p.aa;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
dTs =mean(mean(squeeze(w1.ar.tas_av-v1.ar.tas_av).*aa))
dTs =mean(mean(squeeze(wm.ar.tas_av-vm.ar.tas_av).*aa))
p.z1=squeeze(wm.ar.prday_av   -vm.ar.prday_av)/dTs;
p.z2=squeeze(wm.ar.prday_idwei-vm.ar.prday_idwei)/dTs;   
p.z3=squeeze(wm.tc.prday_idwei-vm.tc.prday_idwei)/dTs;
p.z4=squeeze(wm.mc.prday_idwei-vm.mc.prday_idwei)/dTs;    
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean precipitation';
p.s2='(b) \Delta AR precipitation'; 
p.s3='(c) \Delta TS precipitation'; 
p.s4='(d) \Delta MC precipitation'; 
p.c1=[-0.4 0.4]; a=[-0.2 0.2]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=[-0.4 0.4]; 
plot_2d_4panel_new(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig10: Change in frequency of AR/TS/MSC days and their Pr%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=v1; w0=w1; clear p; p.xy=[0 360 -90 90]; p.expn='p4K_minus_ctl';
p.vname='Fig10'; v=v0.ar; p.lm=v.lm; p.x=v.lon; p.y=v.lat; no=30
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;aa=p.aa;
p.cm=[-0.1: 0.005: 0.1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
a1=squeeze(v0.ar.frqday); b1=miznanmean(a1,p.id,p.aa,p.opt); b1s=b1;
a2=squeeze(w0.ar.frqday); b2=miznanmean(a2,p.id,p.aa,p.opt); b2s=b2;
p.z1=(a2-a1)/dTs*100; p.dz2_mean=(b2-b1)/b1/dTs*100; p.z1_mean=miznanmean(p.z1,p.id,aa,1);
a1=squeeze(v0.tc.frqday); b1=miznanmean(a1,p.id,p.aa,p.opt); b1s=b1s+b1;
a2=squeeze(w0.tc.frqday); b2=miznanmean(a2,p.id,p.aa,p.opt); b2s=b2s+b2;
p.z3=(a2-a1)/dTs*100; p.dz3_mean=(b2-b1)/b1/dTs*100; p.z3_mean=miznanmean(p.z3,p.id,aa,1);
a1=squeeze(v0.mc.frqday); b1=miznanmean(a1,p.id,p.aa,p.opt); b1s=b1s+b1;
a2=squeeze(w0.mc.frqday); b2=miznanmean(a2,p.id,p.aa,p.opt); b2s=b2s+b2;
p.z5=(a2-a1)/dTs*100; p.dz5_mean=(b2-b1)/b1/dTs*100; p.z5_mean=miznanmean(p.z5,p.id,aa,1);

v=v0.ar; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); a1_ar=a1;n1_ar=n1;
v=w0.ar; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); a2_ar=a2;n2_ar=n2;
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z2_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z2_mean=miznanmean(p.z2,p.id,aa,1);
%below produce identical results as above
%a=a1; f=n1/(365*36); id=isnan(a); a(id)=0; b=f.*aa; a1_avg=sum(sum(a.*b))/sum(sum(b));
%a=a2; f=n2/(365*36); id=isnan(a); a(id)=0; b=f.*aa; a2_avg=sum(sum(a.*b))/sum(sum(b));
%p.z2_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z2_mean=miznanmean(p.z2,p.id,aa,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.tc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); a1_tc=a1;n1_tc=n1;
v=w0.tc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); a2_tc=a2;n2_tc=n2;
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z4_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z4_mean=miznanmean(p.z4,p.id,aa,1);
v=v0.mc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); a1_mc=a1;n1_mc=n1;
v=w0.mc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); a2_mc=a2;n2_mc=n2;
[p.z6,p.e6,p.pd6]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z6=p.pd6/dTs;;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z6_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z6_mean=miznanmean(p.z6,p.id,aa,1);
%p=smoothp(p,3,3,'omitnan','shrink');
p.s1='(a) \Delta frequency of AR days'; 
p.s2='(d) \DeltaPr/Pr avg over all AR days'; 
p.s3='(b) \Delta frequency of TS days'; 
p.s4='(e) \DeltaPr/Pr avg over all TS days';
p.s5='(c) \Delta frequency of MCS days'; 
p.s6='(f) \DeltaPr/Pr avg over all MCS days';
a=[-1 1]; p.c1=a; p.c3=a; p.c5=a; a=[-8 8]; p.c2=a; p.c4=a; p.c6=a;p.optit=2;
plot_2d_6panel_new(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig10a: Change in frequency of AR/TS/MSC days and their Pr%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=v1; w0=w1; clear p; p.xy=[0 360 -90 90]; p.expn='p4K_minus_ctl';
p.vname='Fig10a'; v=v0.ar; p.lm=v.lm; p.x=v.lon; p.y=v.lat; no=30
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v0.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-0.1: 0.005: 0.1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
a1=squeeze(v0.ar.frqday); b1=miznanmean(a1,p.id,p.aa,p.opt); b1s=b1;
a2=squeeze(w0.ar.frqday); b2=miznanmean(a2,p.id,p.aa,p.opt); b2s=b2;
p.z1=(a2-a1)/dTs*100; p.dz2_mean=(b2-b1)/b1/dTs*100; p.z1_mean=miznanmean(p.z1,p.id,aa,1);
a1=squeeze(v0.tc.frqday); b1=miznanmean(a1,p.id,p.aa,p.opt); b1s=b1s+b1;
a2=squeeze(w0.tc.frqday); b2=miznanmean(a2,p.id,p.aa,p.opt); b2s=b2s+b2;
p.z3=(a2-a1)/dTs*100; p.dz3_mean=(b2-b1)/b1/dTs*100; p.z3_mean=miznanmean(p.z3,p.id,aa,1);
a1=squeeze(v0.mc.frqday); b1=miznanmean(a1,p.id,p.aa,p.opt); b1s=b1s+b1;
a2=squeeze(w0.mc.frqday); b2=miznanmean(a2,p.id,p.aa,p.opt); b2s=b2s+b2;
p.z5=(a2-a1)/dTs*100; p.dz5_mean=(b2-b1)/b1/dTs*100; p.z5_mean=miznanmean(p.z5,p.id,aa,1);

v=v0.ar; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); a1_ar=a1;n1_ar=n1;
v=w0.ar; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); a2_ar=a2;n2_ar=n2;
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.z2/dTs;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z2_avg=(a2_avg-a1_avg)/dTs; p.z2_mean=miznanmean(p.z2,p.id,aa,1);
%below produce identical results as above
%a=a1; f=n1/(365*36); id=isnan(a); a(id)=0; b=f.*aa; a1_avg=sum(sum(a.*b))/sum(sum(b));
%a=a2; f=n2/(365*36); id=isnan(a); a(id)=0; b=f.*aa; a2_avg=sum(sum(a.*b))/sum(sum(b));
%p.z2_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z2_mean=miznanmean(p.z2,p.id,aa,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v0.tc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); a1_tc=a1;n1_tc=n1;
v=w0.tc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); a2_tc=a2;n2_tc=n2;
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.z4/dTs;;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z4_avg=(a2_avg-a1_avg)/dTs; p.z4_mean=miznanmean(p.z4,p.id,aa,1);
v=v0.mc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); a1_mc=a1;n1_mc=n1;
v=w0.mc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); a2_mc=a2;n2_mc=n2;
[p.z6,p.e6,p.pd6]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z6=p.z6/dTs;;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z6_avg=(a2_avg-a1_avg)/dTs; p.z6_mean=miznanmean(p.z6,p.id,aa,1);
%p=smoothp(p,3,3,'omitnan','shrink');
p.s1='(a) \Delta frequency of AR days'; 
p.s2='(d) \DeltaPr avg over all AR days'; 
p.s3='(b) \Delta frequency of TS days'; 
p.s4='(e) \DeltaPr avg over all TS days';
p.s5='(c) \Delta frequency of MCS days'; 
p.s6='(f) \DeltaPr avg over all MCS days';
a=[-1 1]; p.c1=a; p.c3=a; p.c5=a; a=[-2 2]; p.c2=a; p.c4=a; p.c6=a;p.optit=4;
plot_2d_6panel_new(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig11: Change in frequency of AR/TS/MSC days and their Pr%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='Fig11'; v=v1.ar; p.lm=v.lm; p.x=v.lon; p.y=v.lat; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=128; p.c='k'; dTs=4.53; 
i=4; no=30;
v=v1.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_ar=a1;n1_ar=n1;
v=w1.ar; a2=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s2=squeeze(v.prday_idpct_std(1,i,:,:)); n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_ar=a2;n2_ar=n2;
[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z1_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z1_mean=miznanmean(p.z1,p.id,aa,1);

v=v1.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_tc=a1;n1_tc=n1;
v=w1.tc; a2=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s2=squeeze(v.prday_idpct_std(1,i,:,:)); n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_tc=a2;n2_tc=n2;
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z3_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z3_mean=miznanmean(p.z3,p.id,aa,1);

v=v1.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_mc=a1;n1_mc=n1;
v=w1.mc; a2=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s2=squeeze(v.prday_idpct_std(1,i,:,:)); n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_mc=a2;n2_mc=n2;
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z5_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z5_mean=miznanmean(p.z5,p.id,aa,1);

i=1;
v=v1.ar; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_ar=a1;n1_ar=n1;
v=w1.ar; a2=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s2=squeeze(v.prday_idpct_std(1,i,:,:)); n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_ar=a2;n2_ar=n2;
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z2_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z2_mean=miznanmean(p.z2,p.id,aa,1);

v=v1.tc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_tc=a1;n1_tc=n1;
v=w1.tc; a2=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s2=squeeze(v.prday_idpct_std(1,i,:,:)); n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_tc=a2;n2_tc=n2;
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z4_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z4_mean=miznanmean(p.z4,p.id,aa,1);

v=v1.mc; a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_mc=a1;n1_mc=n1;
v=w1.mc; a2=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s2=squeeze(v.prday_idpct_std(1,i,:,:)); n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_mc=a2;n2_mc=n2;
[p.z6,p.e6,p.pd6]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z6=p.pd6/dTs;;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z6_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z6_mean=miznanmean(p.z6,p.id,aa,1);
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \DeltaPr/Pr avg over 25% heaviest-Pr AR days';
p.s2='(d) \DeltaPr/Pr avg over 25% lightest-Pr AR days'; 
p.s3='(b) \DeltaPr/Pr avg over 25% heaviest-Pr TS days'; 
p.s4='(e) \DeltaPr/Pr avg over 25% lightest-Pr TS days'; 
p.s5='(c) \DeltaPr/Pr avg over 25% heaviest-Pr MCS days';
p.s6='(f) \DeltaPr/Pr avg over 25% lightest-Pr MCS days'; 
a=[-8 8]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;p.optit=3;
plot_2d_6panel_new(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig12: Change in W500, q850 of AR/TS/MSC days %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='Fig12'; v=v1.ar; p.lm=v.lm; p.x=v.lon; p.y=v.lat; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=128; p.c='k'; dTs=4.53; 
i=4; no=30;
v=v1.ar; a1=squeeze(v.w500_idx_avg(1,i,:,:)); 
s1=squeeze(v.w500_idx_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_ar=a1;n1_ar=n1;
v=w1.ar; a2=squeeze(v.w500_idx_avg(1,i,:,:)); 
s2=squeeze(v.w500_idx_std(1,i,:,:)); n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_ar=a2;n2_ar=n2;
[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z1_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z1_mean=miznanmean(p.z1,p.id,aa,1);

v=v1.tc; a1=squeeze(v.w500_idx_avg(1,i,:,:));
s1=squeeze(v.w500_idx_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_tc=a1;n1_tc=n1;
v=w1.tc; a2=squeeze(v.w500_idx_avg(1,i,:,:)); 
s2=squeeze(v.w500_idx_std(1,i,:,:)); n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_tc=a2;n2_tc=n2;
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z3_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z3_mean=miznanmean(p.z3,p.id,aa,1);

v=v1.mc; a1=squeeze(v.w500_idx_avg(1,i,:,:)); 
s1=squeeze(v.w500_idx_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_mc=a1;n1_mc=n1;
v=w1.mc; a2=squeeze(v.w500_idx_avg(1,i,:,:)); 
s2=squeeze(v.w500_idx_std(1,i,:,:)); n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_mc=a2;n2_mc=n2;
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z5_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z5_mean=miznanmean(p.z5,p.id,aa,1);

v=v1.ar; a1=squeeze(v.q850_idx_avg(1,i,:,:)); 
s1=squeeze(v.q850_idx_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_ar=a1;n1_ar=n1;
v=w1.ar; a2=squeeze(v.q850_idx_avg(1,i,:,:)); 
s2=squeeze(v.q850_idx_std(1,i,:,:)); n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_ar=a2;n2_ar=n2;
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z2_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z2_mean=miznanmean(p.z2,p.id,aa,1);

v=v1.tc; a1=squeeze(v.q850_idx_avg(1,i,:,:)); 
s1=squeeze(v.q850_idx_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_tc=a1;n1_tc=n1;
v=w1.tc; a2=squeeze(v.q850_idx_avg(1,i,:,:)); 
s2=squeeze(v.q850_idx_std(1,i,:,:)); n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_tc=a2;n2_tc=n2;
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z4_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z4_mean=miznanmean(p.z4,p.id,aa,1);

v=v1.mc; a1=squeeze(v.q850_idx_avg(1,i,:,:)); 
s1=squeeze(v.q850_idx_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_mc=a1;n1_mc=n1;
v=w1.mc; a2=squeeze(v.q850_idx_avg(1,i,:,:)); 
s2=squeeze(v.q850_idx_std(1,i,:,:)); n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_mc=a2;n2_mc=n2;
[p.z6,p.e6,p.pd6]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z6=p.pd6/dTs;;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z6_avg=(a2_avg-a1_avg)/a1_avg/dTs*100; p.z6_mean=miznanmean(p.z6,p.id,aa,1);

%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta\omega_{500}/\omega_{500} avg over 25% heaviest-Pr AR days';
p.s2='(d) \Deltaq_{850}/q_{850} avg over 25% heaviest-Pr AR days'; 
p.s3='(b) \Delta\omega_{500}/\omega_{500} avg over 25% heaviest-Pr TS days'; 
p.s4='(e) \Deltaq_{850}/q_{850} avg over 25% heaviest-Pr TS days'; 
p.s5='(c) \Delta\omega_{500}/\omega_{500} avg over 25% heaviest-Pr MCS days';
p.s6='(f) \Deltaq_{850}/q_{850} avg over 25% heaviest-Pr MCS days'; 
a=[-8 8]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; p.optit=3
plot_2d_6panel_new(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig13: Change in T850 of AR/TS/MSC days %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='Fig13'; v=v1.ar; p.lm=v.lm; p.x=v.lon; p.y=v.lat;
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=128; p.c='k'; dTs=4.53; 
i=4; no=30;
v=v1.ar; a1=squeeze(v.t850_idx_avg(1,i,:,:)); 
s1=squeeze(v.t850_idx_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_ar=a1;n1_ar=n1;
v=w1.ar; a2=squeeze(v.t850_idx_avg(1,i,:,:)); 
s2=squeeze(v.t850_idx_std(1,i,:,:)); n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_ar=a2;n2_ar=n2;
[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.z1/dTs;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z1_avg=(a2_avg-a1_avg)/dTs; p.z1_mean=miznanmean(p.z1,p.id,aa,1);
v=v1.tc; a1=squeeze(v.t850_idx_avg(1,i,:,:)); 
s1=squeeze(v.t850_idx_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_tc=a1;n1_tc=n1;
v=w1.tc; a2=squeeze(v.t850_idx_avg(1,i,:,:)); 
s2=squeeze(v.t850_idx_std(1,i,:,:)); n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_tc=a2;n2_tc=n2;
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.z2/dTs;;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z2_avg=(a2_avg-a1_avg)/dTs; p.z2_mean=miznanmean(p.z2,p.id,aa,1);
v=v1.mc; a1=squeeze(v.t850_idx_avg(1,i,:,:)); 
s1=squeeze(v.t850_idx_std(1,i,:,:)); n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_mc=a1;n1_mc=n1;
v=w1.mc; a2=squeeze(v.t850_idx_avg(1,i,:,:)); 
s2=squeeze(v.t850_idx_std(1,i,:,:)); n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_mc=a2;n2_mc=n2;
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.z3/dTs;;
a=a1; f=n1/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a1_avg=mean(a(id).*b);
a=a2; f=n2/(365*36); id=~isnan(a); b=f.*aa; b=b(id)/mean(b(id)); a2_avg=mean(a(id).*b);
p.z3_avg=(a2_avg-a1_avg)/dTs; p.z3_mean=miznanmean(p.z3,p.id,aa,1);
%p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \DeltaT_{850} avg over 25% heaviest-Pr AR days'; 
p.s2='(b) \DeltaT_{850} avg over 25% heaviest-Pr TS days'; 
p.s3='(c) \DeltaT_{850} avg over 25% heaviest-Pr MCS days'; 
a=[-1.1 1.1]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;p.optit=3;
plot_2d_3panel_new(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: submitted to Nature COMM figures below
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 1: AR/TS/TD/MSC days (frequency)%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %occurrence frequency: fraction of all days
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='frqday'; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(v1.ar.prday_fqwet(1,:,:,2))*100;
p.z2=squeeze(v1.ar.frqday)*100;   
p.z3=squeeze(v1.tc.frqday)*100;
p.z4=squeeze(v1.td.frqday)*100;
p.z5=squeeze(v1.mc.frqday)*100;    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) frequency of wet days';
p.s2='(c) frequency of AR days'; 
p.s3='(d) frequency of TS days'; 
p.s4='(e) frequency of TD days'; 
p.s5='(f) frequency of MCS days';
p.s6='(b) frequency of AR+TS+TD+MCS days'; p.s0='';
p.c1=[0 100]; a=[0 40]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=[0 100];
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 2: fraction of extreme precip from AR/TS/TD/MSC days%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %fraction of P>P99 from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='prday_fp99_from_id'; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(v1.ar.prday_pct(:,1,:,:));
p.z2=squeeze(v1.ar.prday_fp99_from_id);   
p.z3=squeeze(v1.tc.prday_fp99_from_id);
p.z4=squeeze(v1.td.prday_fp99_from_id);
p.z5=squeeze(v1.mc.prday_fp99_from_id);
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) 99 percentile of daily precipitation';
p.s2='(c) fraction from AR'; 
p.s3='(d) fraction from TS'; 
p.s4='(e) fraction from TD'; 
p.s5='(f) fraction from MCS';
p.s6='(b) fraction from AR+TS+TD+MCS'; p.s0='';
p.c1=[0 100]; a=[0 1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 3: annual mean precip contributed from AR/TS/TD/MSC %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='prday_idwei'; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(v1.ar.prday_av);   
p.z2=squeeze(v1.ar.prday_idwei);   
p.z3=squeeze(v1.tc.prday_idwei); 
p.z4=squeeze(v1.td.prday_idwei);
p.z5=squeeze(v1.mc.prday_idwei);    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean precipitation Pr';
p.s2='(c) annual mean Pr from AR'; 
p.s3='(d) annual mean Pr from TS'; 
p.s4='(e) annual mean Pr from TD'; 
p.s5='(f) annual mean Pr from MCS';
p.s6='(b) annual mean Pr from AR+TS+TD+MCS'; p.s0='';
p.c1=[0 10]; p.c2=[0 3]; p.c3=[0 3]; p.c4=[0 3]; p.c5=[0 6]; p.c6=[0 10]; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 3.5: annual mean precip contributed from top 50% of AR/TS/TD/MSC %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='prday_idpct_wei_75'; p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(v1.ar.prday_av); i=3;
p.z2=squeeze(v1.ar.prday_idpct_wei(1,i,:,:));   
p.z3=squeeze(v1.tc.prday_idpct_wei(1,i,:,:)); 
p.z4=squeeze(v1.td.prday_idpct_wei(1,i,:,:));
p.z5=squeeze(v1.mc.prday_idpct_wei(1,i,:,:));    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean precipitation Pr';
p.s2='(c) annual mean Pr from AR'; 
p.s3='(d) annual mean Pr from TS'; 
p.s4='(e) annual mean Pr from TD'; 
p.s5='(f) annual mean Pr from MCS';
p.s6='(b) annual mean Pr from AR+TS+TD+MCS'; p.s0='';
p.c1=[0 10]; p.c2=[0 3]; p.c3=[0 3]; p.c4=[0 3]; p.c5=[0 6]; p.c6=[0 10]; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.al; clear s1 s2 s3;
x=squeeze(v.prday_idwei_ts_day); x=getclim(x);
y=squeeze(v.prday_nonid_ts_day); y=getclim(y);
z=squeeze(v.prday_av_ts_day);    z=getclim(z);
pms=[ 0, 0, 1000, 800]*0.7; ms=6; fsize=12; lw=1; 
handle = figure('Position', pms,'visible','on'); t=[1:365];
x1=x.ano_clim; y1=y.ano_clim; z1=z.ano_clim; xm=0.18; lb='(a)';vname='prday_gclim';
plot(t,z1,'-k','LineWidth',lw); sz=corrslop(y1,x1); hold on;
plot(t,x1,'-r','LineWidth',lw); sx=corrslop(x1,z1); 
plot(t,y1,'-b','LineWidth',lw); sy=corrslop(y1,z1); 
%plot(t,x1+y1,'.g','MarkerSize',ms); 
s1=sprintf('All days {                    }(mean precip=%5.2f)',mean(z.clim));
s2=sprintf('AR+TS+TD+MCS days (mean precip=%5.2f; corr=%5.2f)',mean(x.clim),sx.r(1));
s3=sprintf('All other days{            }(mean precip=%5.2f; corr=%5.2f)',mean(y.clim),sy.r(1));
legend(s1,s2,s3,'location','northwest');
xl='day of year';
yl='{          }climatological global mean daily precipitation (mm/day)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); grid on;
xy=[1 365 -xm+0.02 xm+0.02]; mylabel(xy,1,lb,12);
visfig='off'; figpath='./fig_PE/'; expn='ctl'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.al; clear s1 s2;
x=squeeze(v.prday_idwei_ts_day); x=getclim(x);
y=squeeze(v.prday_nonid_ts_day); y=getclim(y);
z=squeeze(v.prday_av_ts_day);    z=getclim(z);
pms=[ 0, 0, 1000, 800]*0.7; fsize=12; lw=2; 
handle = figure('Position', pms,'visible','on'); 
%x1=x.ano_ann; y1=y.ano_ann; z1=z.ano_ann; xm=0.03; ms=8; lb='(c)';vname='prday_gannual';
x1=x.ano_day; y1=y.ano_day; z1=z.ano_day; xm=0.7; ms=4; lb='(b)';vname='prday_gdaily';
plot(x1,z1,'r.','MarkerSize',ms); sx=corrslop(x1,z1); hold on;
plot(y1,z1,'b.','MarkerSize',ms); sy=corrslop(y1,z1); sz=corrslop(y1,x1);
%plot(x1+y1,z1,'g.','MarkerSize',ms); sz=corrslop(y1,x1);
x0=[-xm:0.01:xm];
p=sx; plot(x0,p.s(1)*x0+p.s(2),'r-','LineWidth',lw);
p=sy; plot(x0,p.s(1)*x0+p.s(2),'b-','LineWidth',lw);
s1=sprintf('AR+TS+TD+MCS days (corr=%5.2f)',sx.r(1));
s2=sprintf('all other days{            }(corr=%5.2f)',sy.r(1));
legend(s1,s2,'location','northwest');
xl='{              }anomalous global mean precipitation from storm/non-storm days (mm/day)';
yl='{     }anomalous global mean precipitation (mm/day)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize); grid on;
xy=[-xm xm -xm xm]; mylabel(xy,1,lb,12);
visfig='off'; figpath='./fig_PE/'; expn='ctl'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.al; vname='ttcf';
x=squeeze(v.ttcf_idwei_ts_day); x=getclim(x);
y=squeeze(v.ttcf_nonid_ts_day); y=getclim(y);
z=squeeze(v.ttcf_av_ts_day);    z=getclim(z);
pms=[ 0, 0, 1000, 800]*0.7; x0=[-0.4:0.1:0.4]; fsize=10; lw=2; 
handle = figure('Position', pms,'visible','on'); 
x1=x.ano_ann; y1=y.ano_ann; z1=z.ano_ann; ms=12;
plot(x1,z1,'r.','MarkerSize',ms); sx=corrslop(x1,z1); hold on;
plot(y1,z1,'b.','MarkerSize',ms); sy=corrslop(y1,z1); sz=corrslop(y1,x1);
p=sx; plot(x0,p.s(1)*x0+p.s(2),'r-');
p=sy; plot(x0,p.s(1)*x0+p.s(2),'b-');
s1=sprintf('AR+TC+MCS days (mean=%5.2f; corr=%5.2f)',mean(x.clim),sx.r(1));
s2=sprintf('OTHER days     (mean=%5.2f; corr=%5.2f)',mean(y.clim),sy.r(1));
legend(s1,s2,'location','northwest');
xl='anomalous global mean net CRE from storm/non-storm days (W/m2)';
yl='anomalous global mean net CRE (W/m2)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='readartcmcs'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x=squeeze(v.ttcf_av_ts_day); 
x=x(1:365); t=[1:365]; x=x'; t=t'; 
nt=length(x); NFFT=2^nextpow2(nt); %Next power of 2 from length of y
y=fft(x); a=2*abs(y);
%y=fft(x,NFFT)/nt;  df=1/NFFT;
%a=2*abs(y(1:NFFT/2+1)); %a is amplitude of the wave
figure; plot(a);
figure; plot(x);

h1=harmonic_extract(t,a,1);
h2=harmonic_extract(t,y,2);
h3=harmonic_extract(t,x,3);
h4=harmonic_extract(t,x,4);
figure; plot(x,'k'); hold on; 
plot(h1,'r'); plot(h2,'g'); plot(h3,'b'); plot(h4,'c');
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.al; vname='ttcf';
x=squeeze(v.ttcf_idwei_ts_day); x=getclim(x);
y=squeeze(v.ttcf_nonid_ts_day); y=getclim(y);
z=squeeze(v.ttcf_av_ts_day);    z=getclim(z);
pms=[ 0, 0, 1000, 800]*0.7; x0=[-0.4:0.1:0.4]; fsize=10; lw=2; 
handle = figure('Position', pms,'visible','on'); 
x1=x.ano_ann; y1=y.ano_ann; z1=z.ano_ann; ms=12;
plot(x1,z1,'r.','MarkerSize',ms); sx=corrslop(x1,z1); hold on;
plot(y1,z1,'b.','MarkerSize',ms); sy=corrslop(y1,z1); sz=corrslop(y1,x1);
%plot(x1+y1,z1,'g.','MarkerSize',ms); sz=corrslop(y1,x1);
p=sx; plot(x0,p.s(1)*x0+p.s(2),'r-');
p=sy; plot(x0,p.s(1)*x0+p.s(2),'b-');
s1=sprintf('AR+TC+MCS days (mean=%5.2f; corr=%5.2f)',mean(x.clim),sx.r(1));
s2=sprintf('OTHER days     (mean=%5.2f; corr=%5.2f)',mean(y.clim),sy.r(1));
legend(s1,s2,'location','northwest');
xl='anomalous global mean net CRE from storm/non-storm days (W/m2)';
yl='anomalous global mean net CRE (W/m2)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='readartcmcs'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.al; vname='lwcf'; %mvregress([x1;y1]',z1');
x=squeeze(v.lwcf_idwei_ts_day); x=getclim(x);
y=squeeze(v.lwcf_nonid_ts_day); y=getclim(y);
z=squeeze(v.lwcf_av_ts_day);    z=getclim(z);
pms=[ 0, 0, 1000, 800]*0.7; x0=[-3:0.1:3]; fsize=10; lw=2; 
handle = figure('Position', pms,'visible','on'); 
x1=x.ano_ann; y1=y.ano_ann; z1=z.ano_ann; ms=6;
x1=x.ano_day; y1=y.ano_day; z1=z.ano_day; ms=6; 
i1=1; i2=36500;x1=x1(i1:i2);y1=y1(i1:i2);z1=z1(i1:i2);
%x1=x1/std(x1); y1=y1/std(y1); z1=z1/std(z1);
%id=abs(x1)>std(x1)*5; id=~id; x1=x1(id); y1=y1(id); z1=z1(id);
plot(x1,z1,'r.','MarkerSize',ms); sx=corrslop(x1,z1); hold on;
plot(y1,z1,'b.','MarkerSize',ms); sy=corrslop(y1,z1);
%plot(x1+y1,z1,'g.','MarkerSize',ms); sz=corrslop(y1,x1);
p=sx; plot(x0,p.s(1)*x0+p.s(2),'r-','LineWidth',3);
p=sy; plot(x0,p.s(1)*x0+p.s(2),'b-','LineWidth',3);
axis([-3 3 -3 3]); %plot([-1 1],[-1 1],'k');
s1=sprintf('AR+TC+MCS days (mean=%5.2f; corr=%5.2f)',mean(x.clim),sx.r(1));
s2=sprintf('OTHER days     (mean=%5.2f; corr=%5.2f)',mean(y.clim),sy.r(1));
legend(s1,s2,'location','northwest');
xl='anomalous global mean net CRE from storm/non-storm days (W/m2)';
yl='anomalous global mean net CRE (W/m2)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='readartcmcs'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.al; vname='swcf'; %mvregress([x1;y1]',z1');
x=squeeze(v.swcf_idwei_ts_day); x=getclim(x);
y=squeeze(v.swcf_nonid_ts_day); y=getclim(y);
z=squeeze(v.swcf_av_ts_day);    z=getclim(z);
pms=[ 0, 0, 1000, 800]*0.7; cm=5; x0=[-cm:0.1:cm]; fsize=10; lw=2; 
handle = figure('Position', pms,'visible','on'); 
x1=x.ano_ann; y1=y.ano_ann; z1=z.ano_ann; ms=6;
x1=x.ano_day; y1=y.ano_day; z1=z.ano_day; ms=6; 
i1=1; i2=36500;x1=x1(i1:i2);y1=y1(i1:i2);z1=z1(i1:i2);
%x1=x1/std(x1); y1=y1/std(y1); z1=z1/std(z1);
%id=abs(x1)>std(x1)*5; id=~id; x1=x1(id); y1=y1(id); z1=z1(id);
plot(x1,z1,'r.','MarkerSize',ms); sx=corrslop(x1,z1); hold on;
plot(y1,z1,'b.','MarkerSize',ms); sy=corrslop(y1,z1);
%plot(x1+y1,z1,'g.','MarkerSize',ms); sz=corrslop(y1,x1);
p=sx; plot(x0,p.s(1)*x0+p.s(2),'r-','LineWidth',3);
p=sy; plot(x0,p.s(1)*x0+p.s(2),'b-','LineWidth',3);
axis([-cm cm -cm cm]); %plot([-1 1],[-1 1],'k');
s1=sprintf('AR+TC+MCS days (mean=%5.2f; corr=%5.2f)',mean(x.clim),sx.r(1));
s2=sprintf('OTHER days     (mean=%5.2f; corr=%5.2f)',mean(y.clim),sy.r(1));
legend(s1,s2,'location','northwest');
xl='anomalous global mean net CRE from storm/non-storm days (W/m2)';
yl='anomalous global mean net CRE (W/m2)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='readartcmcs'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 7: Precipitation averaged only over AR/TS/TD/MSC days%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %weather type mean prday
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='prday_idavg'; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=128; p.c='k';
p.z1=squeeze(v1.ar.prday_av); p.z0=p.z1; no=30;
v=v1.ar; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z2]=compute_se(a1,s1,n1,no);
v=v1.tc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z3]=compute_se(a1,s1,n1,no);
v=v1.td; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z4]=compute_se(a1,s1,n1,no);
v=v1.mc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z5]=compute_se(a1,s1,n1,no);
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean precipitation, Pr (mm/day)';
p.s2='(c) Pr averaged over AR days'; 
p.s3='(d) Pr averaged over TS days'; 
p.s4='(e) Pr averaged over TD days'; 
p.s5='(f) Pr averaged over MCS days';
p.s6='(b) Pr averaged over AR+TS+TD+MCS days'; p.s0='';
p.c1=[0 15]; a=[0 15]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) Pr averaged over AR days'; 
p.s3='(b) Pr averaged over TS days'; 
p.s4='(c) Pr averaged over TD days'; 
p.s5='(d) Pr averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 7.1: Precipitation standard deviation over AR/TS/TD/MSC days%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %weather type mean prday
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='prday_idstd'; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=128; p.c='k';
p.z1=squeeze(v1.ar.prday_av); p.z0=p.z1; no=30;
v=v1.ar; a1=squeeze(v.prday_idstd); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z2]=compute_se(a1,s1,n1,no);
v=v1.tc; a1=squeeze(v.prday_idstd); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z3]=compute_se(a1,s1,n1,no);
v=v1.td; a1=squeeze(v.prday_idstd); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z4]=compute_se(a1,s1,n1,no);
v=v1.mc; a1=squeeze(v.prday_idstd); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z5]=compute_se(a1,s1,n1,no);
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean precipitation, Pr (mm/day)';
p.s2='(c) Pr standard deviation over AR days'; 
p.s3='(d) Pr standard deviation over TS days'; 
p.s4='(e) Pr standard deviation over TD days'; 
p.s5='(f) Pr standard deviation over MCS days';
p.s6='(b) Pr standard deviation over AR+TS+TD+MCS days'; p.s0='';
p.c1=[0 30]; a=[0 30]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) Pr standard deviation over AR days'; 
p.s3='(b) Pr standard deviation over TS days'; 
p.s4='(c) Pr standard deviation over TD days'; 
p.s5='(d) Pr standard deviation over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 7.2: Precipitation averaged over certain AR/TS/TD/MCS days%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %weather type mean prday
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='prday_idavg_25'; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=128; p.c='k';
p.z1=squeeze(v1.ar.prday_av); p.z0=p.z1; i=1; no=30;
v=v1.ar; 
a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); 
[p.z2]=compute_se(a1,s1,n1,no);
v=v1.tc; 
a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idstd); 
n1=squeeze(v.id_sum); 
[p.z3]=compute_se(a1,s1,n1,no);
v=v1.td; 
a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idstd); 
n1=squeeze(v.id_sum); 
[p.z4]=compute_se(a1,s1,n1,no);
v=v1.mc; 
a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idstd); 
n1=squeeze(v.id_sum); 
[p.z5]=compute_se(a1,s1,n1,no);
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean precipitation, Pr (mm/day)';
p.s2='(c) Pr averaged over AR days'; 
p.s3='(d) Pr averaged over TS days'; 
p.s4='(e) Pr averaged over TD days'; 
p.s5='(f) Pr averaged over MCS days';
p.s6='(b) Pr averaged over AR+TS+TD+MCS days'; p.s0='';
p.c1=[0 5]; a=[0 5]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) Pr averaged over AR days'; 
p.s3='(b) Pr averaged over TS days'; 
p.s4='(c) Pr averaged over TD days'; 
p.s5='(d) Pr averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 7.3: omega_500 averaged over certain AR/TS/TD/MCS days%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %weather type mean w500
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='w500_idpct_75'; p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=3;p.nn=128; p.c='k';
p.z1=squeeze(v1.ar.w500_av); p.z0=p.z1; i=3; no=30;
v=v1.ar;
a1=squeeze(v.w500_idx_avg   (1,i,:,:)); 
s1=squeeze(v.w500_idx_std   (1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_ar=a1;n1_ar=n1;
[p.z2]=compute_se(a1,s1,n1,no);
v=v1.tc; 
a1=squeeze(v.w500_idx_avg   (1,i,:,:)); 
s1=squeeze(v.w500_idx_std   (1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_ar=a1;n1_ar=n1;
[p.z3]=compute_se(a1,s1,n1,no);
v=v1.td; 
a1=squeeze(v.w500_idx_avg   (1,i,:,:)); 
s1=squeeze(v.w500_idx_std   (1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_ar=a1;n1_ar=n1;
[p.z4]=compute_se(a1,s1,n1,no);
v=v1.mc; 
a1=squeeze(v.w500_idx_avg   (1,i,:,:)); 
s1=squeeze(v.w500_idx_std   (1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_ar=a1;n1_ar=n1;
[p.z5]=compute_se(a1,s1,n1,no);
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
%p.z6=nanmean(a,3); %
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean \omega_{500} (hPa/day)';
p.s2='(c) \omega_{500} averaged over AR days'; 
p.s3='(d) \omega_{500} averaged over TS days'; 
p.s4='(e) \omega_{500} averaged over TD days'; 
p.s5='(f) \omega_{500} averaged over MCS days';
p.s6='(b) \omega_{500} averaged over AR+TS+TD+MCS days'; p.s0='';
p.c1=[-500 0]; a=[-500 0]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) \omega_{500} averaged over AR days'; 
p.s3='(b) \omega_{500} averaged over TS days'; 
p.s4='(c) \omega_{500} averaged over TD days'; 
p.s5='(d) \omega_{500} averaged over MCS days';
plot_2d_4panel(p)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%p4K minus Ctl
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 11 Absolute change in frequency of AR/TS/TD/MSC days%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_frqday';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-0.1: 0.005: 0.1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
a1=squeeze(v1.ar.prday_fqwet(1,:,:,2)); b1=miznanmean(a1,p.id,p.aa,p.opt)
a2=squeeze(w1.ar.prday_fqwet(1,:,:,2)); b2=miznanmean(a2,p.id,p.aa,p.opt)
p.z1=(a2-a1)/dTs*100; p.dz1_mean=(b2-b1)/b1/dTs*100;
a1=squeeze(v1.ar.frqday); b1=miznanmean(a1,p.id,p.aa,p.opt); b1s=b1;
a2=squeeze(w1.ar.frqday); b2=miznanmean(a2,p.id,p.aa,p.opt); b2s=b2;
p.z2=(a2-a1)/dTs*100; p.dz2_mean=(b2-b1)/b1/dTs*100;
a1=squeeze(v1.tc.frqday); b1=miznanmean(a1,p.id,p.aa,p.opt); b1s=b1s+b1;
a2=squeeze(w1.tc.frqday); b2=miznanmean(a2,p.id,p.aa,p.opt); b2s=b2s+b2;
p.z3=(a2-a1)/dTs*100; p.dz3_mean=(b2-b1)/b1/dTs*100;
a1=squeeze(v1.td.frqday); b1=miznanmean(a1,p.id,p.aa,p.opt); b1s=b1s+b1;
a2=squeeze(w1.td.frqday); b2=miznanmean(a2,p.id,p.aa,p.opt); b2s=b2s+b2;
p.z4=(a2-a1)/dTs*100; p.dz4_mean=(b2-b1)/b1/dTs*100;
a1=squeeze(v1.mc.frqday); b1=miznanmean(a1,p.id,p.aa,p.opt); b1s=b1s+b1;
a2=squeeze(w1.mc.frqday); b2=miznanmean(a2,p.id,p.aa,p.opt); b2s=b2s+b2;
p.z5=(a2-a1)/dTs*100; p.dz5_mean=(b2-b1)/b1/dTs*100;
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6; p.dz6_mean=(b2s-b1s)/b1s/dTs*100;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='(a) \Delta frequency of wet days';
p.s2='(c) \Delta frequency of AR days'; 
p.s3='(d) \Delta frequency of TS days'; 
p.s4='(e) \Delta frequency of TD days'; 
p.s5='(f) \Delta frequency of MCS days';
p.s6='(b) \Delta AR+TS+TD+MCS days'; p.s0='';
p.c1=[-2 2]; a=[-1 1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=p.c1;
plot_2d_6panel(p)
p.s2='(a) \Delta frequency of AR days'; 
p.s3='(b) \Delta frequency of TS days'; 
p.s4='(c) \Delta frequency of TD days'; 
p.s5='(d) \Delta frequency of MCS days';
p.c1=[-2 2]; a=[-1 1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=p.c1;
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 12 Percentage change in frequency of AR/TS/TD/MSC days%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_frqday_percent';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-0.1: 0.005: 0.1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53; no=0.001;
a1=squeeze(v1.ar.prday_fqwet(1,:,:,2)); b1=miznanmean(a1,p.id,p.aa,p.opt)
a2=squeeze(w1.ar.prday_fqwet(1,:,:,2)); b2=miznanmean(a2,p.id,p.aa,p.opt)
p.z1=(a2-a1)./a1*100/dTs; p.dz1_mean=(b2-b1)/b1/dTs*100;
p.z1(a1<no |a2<no)=NaN;
a1=squeeze(v1.ar.frqday); b1=miznanmean(a1,p.id,p.aa,p.opt); b1s=b1;a1s=a1;
a2=squeeze(w1.ar.frqday); b2=miznanmean(a2,p.id,p.aa,p.opt); b2s=b2;a2s=a2;
p.z2=(a2-a1)./a1*100/dTs; p.dz2_mean=(b2-b1)/b1/dTs*100;
p.z2(a1<no |a2<no)=NaN;
a1=squeeze(v1.tc.frqday); b1=miznanmean(a1,p.id,p.aa,p.opt); b1s=b1s+b1;a1s=a1s+a1;
a2=squeeze(w1.tc.frqday); b2=miznanmean(a2,p.id,p.aa,p.opt); b2s=b2s+b2;a2s=a2s+a2;
p.z3=(a2-a1)./a1*100/dTs; p.dz3_mean=(b2-b1)/b1/dTs*100;
p.z3(a1<no |a2<no)=NaN;
a1=squeeze(v1.td.frqday); b1=miznanmean(a1,p.id,p.aa,p.opt); b1s=b1s+b1;a1s=a1s+a1;
a2=squeeze(w1.td.frqday); b2=miznanmean(a2,p.id,p.aa,p.opt); b2s=b2s+b2;a2s=a2s+a2;
p.z4=(a2-a1)./a1*100/dTs; p.dz4_mean=(b2-b1)/b1/dTs*100;
p.z4(a1<no |a2<no)=NaN;
a1=squeeze(v1.mc.frqday); b1=miznanmean(a1,p.id,p.aa,p.opt); b1s=b1s+b1;a1s=a1s+a1;
a2=squeeze(w1.mc.frqday); b2=miznanmean(a2,p.id,p.aa,p.opt); b2s=b2s+b2;a2s=a2s+a2;
p.z5=(a2-a1)./a1*100/dTs; p.dz5_mean=(b2-b1)/b1/dTs*100;
p.z5(a1<no |a2<no)=NaN;
p.z6=(a2s-a1s)./a1s*100/dTs; p.dz6_mean=(b2s-b1s)/b1s/dTs*100;
p.z6(a1s<no |a2s<no)=NaN; p.z0=p.z6;
%p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6; 
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='(a) \Delta frequency of wet days';
p.s2='(c) \Delta frequency of AR days'; 
p.s3='(d) \Delta frequency of TS days'; 
p.s4='(e) \Delta frequency of TD days'; 
p.s5='(f) \Delta frequency of MCS days';
p.s6='(b) \Delta AR+TS+TD+MCS days'; p.s0='';
p.c1=[-20 20]; a=[-20 20]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=p.c1;
plot_2d_6panel(p)
p.s2='(a) \Delta frequency of AR days'; 
p.s3='(b) \Delta frequency of TS days'; 
p.s4='(c) \Delta frequency of TD days'; 
p.s5='(d) \Delta frequency of MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 13 change in annual mean Pr contributed from AR/TS/TD/MSC%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_idwei';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
p.z1=squeeze(w1.ar.prday_av   -v1.ar.prday_av)/dTs;
p.z2=squeeze(w1.ar.prday_idwei-v1.ar.prday_idwei)/dTs;   
p.z3=squeeze(w1.tc.prday_idwei-v1.tc.prday_idwei)/dTs;
p.z4=squeeze(w1.td.prday_idwei-v1.td.prday_idwei)/dTs;
p.z5=squeeze(w1.mc.prday_idwei-v1.mc.prday_idwei)/dTs;    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean precipitation';
p.s2='(c) \Delta AR precipitation'; 
p.s3='(d) \Delta TS precipitation'; 
p.s4='(e) \Delta TD precipitation'; 
p.s5='(f) \Delta MCS precipitation';
p.s6='(b) \Delta AR+TS+TD+MCS precipitation'; p.s0='';
p.c1=[-0.4 0.4]; a=[-0.2 0.2]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=[-0.4 0.4]; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 13.5 change in annual mean Pr contributed from AR/TS/TD/MSC%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_idpct_wei_99';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53; i=6;
p.z1=squeeze(w1.ar.prday_av   -v1.ar.prday_av)/dTs;
p.z2=squeeze(w1.ar.prday_idpct_wei(1,i,:,:)-v1.ar.prday_idpct_wei(1,i,:,:))/dTs;   
p.z3=squeeze(w1.tc.prday_idpct_wei(1,i,:,:)-v1.tc.prday_idpct_wei(1,i,:,:))/dTs;
p.z4=squeeze(w1.td.prday_idpct_wei(1,i,:,:)-v1.td.prday_idpct_wei(1,i,:,:))/dTs;
p.z5=squeeze(w1.mc.prday_idpct_wei(1,i,:,:)-v1.mc.prday_idpct_wei(1,i,:,:))/dTs;    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean precipitation';
p.s2='(c) \Delta AR precipitation'; 
p.s3='(d) \Delta TS precipitation'; 
p.s4='(e) \Delta TD precipitation'; 
p.s5='(f) \Delta MCS precipitation';
p.s6='(b) \Delta AR+TS+TD+MCS precipitation'; p.s0='';
p.c1=[-0.4 0.4]; a=[-0.2 0.2]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=[-0.4 0.4]; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 14 change in annual mean LW CRE contributed from AR/TS/TD/MSC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_lwcf_idwei';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
a =squeeze(w1.ar.lwcf_av);    b =squeeze(v1.ar.lwcf_av);    p.z1=(a-b)/dTs;
a =squeeze(w1.ar.lwcf_idwei); b =squeeze(v1.ar.lwcf_idwei); p.z2=(a-b)/dTs;
a =squeeze(w1.tc.lwcf_idwei); b =squeeze(v1.tc.lwcf_idwei); p.z3=(a-b)/dTs;
a =squeeze(w1.td.lwcf_idwei); b =squeeze(v1.td.lwcf_idwei); p.z4=(a-b)/dTs;
a =squeeze(w1.mc.lwcf_idwei); b =squeeze(v1.mc.lwcf_idwei); p.z5=(a-b)/dTs;
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean LW CRE';
p.s2='(c) \Delta AR LW CRE'; 
p.s3='(d) \Delta TS LW CRE'; 
p.s4='(e) \Delta TD LW CRE'; 
p.s5='(f) \Delta MCS LW CRE';
p.s6='(b) \Delta LW CRE from AR+TS+TD+MCS'; p.s0='';
p.c1=[-2 2]; a=[-1 1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=p.c1; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 15 change in annual mean SW CRE contributed from AR/TS/TD/MSC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_swcf_idwei';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
a =squeeze(w1.ar.swcf_av);    b =squeeze(v1.ar.swcf_av);    p.z1=(a-b)/dTs;
a =squeeze(w1.ar.swcf_idwei); b =squeeze(v1.ar.swcf_idwei); p.z2=(a-b)/dTs;
a =squeeze(w1.tc.swcf_idwei); b =squeeze(v1.tc.swcf_idwei); p.z3=(a-b)/dTs;
a =squeeze(w1.td.swcf_idwei); b =squeeze(v1.td.swcf_idwei); p.z4=(a-b)/dTs;
a =squeeze(w1.mc.swcf_idwei); b =squeeze(v1.mc.swcf_idwei); p.z5=(a-b)/dTs;
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean SW CRE';
p.s2='(c) \Delta AR SW CRE'; 
p.s3='(d) \Delta TS SW CRE'; 
p.s4='(e) \Delta TD SW CRE'; 
p.s5='(f) \Delta MCS SW CRE';
p.s6='(b) \Delta SW CRE from AR+TS+TD+MCS'; p.s0='';
p.c1=[-2 2]; a=[-1 1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=p.c1; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 16 change in annual mean total CRE contributed from AR/TS/TD/MSC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_ttcf_idwei';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
v=v1.ar; a1=squeeze(v.swcf_av+v.lwcf_av);
v=w1.ar; a2=squeeze(v.swcf_av+v.lwcf_av);       p.z1=(a2-a1)/dTs;
v=v1.ar; a1=squeeze(v.swcf_idwei+v.lwcf_idwei);
v=w1.ar; a2=squeeze(v.swcf_idwei+v.lwcf_idwei); p.z2=(a2-a1)/dTs;
v=v1.tc; a1=squeeze(v.swcf_idwei+v.lwcf_idwei);
v=w1.tc; a2=squeeze(v.swcf_idwei+v.lwcf_idwei); p.z3=(a2-a1)/dTs;
v=v1.td; a1=squeeze(v.swcf_idwei+v.lwcf_idwei);
v=w1.td; a2=squeeze(v.swcf_idwei+v.lwcf_idwei); p.z4=(a2-a1)/dTs;
v=v1.mc; a1=squeeze(v.swcf_idwei+v.lwcf_idwei);
v=w1.mc; a2=squeeze(v.swcf_idwei+v.lwcf_idwei); p.z5=(a2-a1)/dTs;
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean total CRE';
p.s2='(c) \Delta AR total CRE'; 
p.s3='(d) \Delta TS total CRE'; 
p.s4='(e) \Delta TD total CRE'; 
p.s5='(f) \Delta MCS total CRE';
p.s6='(b) \Delta total CRE from AR+TS+TD+MCS'; p.s0='';
p.c1=[-2 2]; a=[-1 1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=p.c1; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 17: change in Pr averaged only over AR/TS/TD/MSC days%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prday_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=128; p.c='k'; dTs=4.53; no=30;
v=v1.ar; a1=squeeze(v.prday_av); %s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.prday_av); %s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)./a1/dTs*100; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); a1_ar=a1;n1_ar=n1;
v=w1.ar; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); a2_ar=a2;n2_ar=n2;
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); a1_tc=a1;n1_tc=n1;
v=w1.tc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); a2_tc=a2;n2_tc=n2;
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); a1_td=a1;n1_td=n1;
v=w1.td; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); a2_td=a2;n2_td=n2;
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); a1_mc=a1;n1_mc=n1;
v=w1.mc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); a2_mc=a2;n2_mc=n2;
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
idx=isnan(a1_ar); a1_ar(idx)=0; n1_ar(idx)=0;
idx=isnan(a1_tc); a1_tc(idx)=0; n1_tc(idx)=0;
idx=isnan(a1_td); a1_td(idx)=0; n1_td(idx)=0;
idx=isnan(a1_mc); a1_mc(idx)=0; n1_mc(idx)=0;
idx=isnan(a2_ar); a2_ar(idx)=0; n2_ar(idx)=0;
idx=isnan(a2_tc); a2_tc(idx)=0; n2_tc(idx)=0;
idx=isnan(a2_td); a2_td(idx)=0; n2_td(idx)=0;
idx=isnan(a2_mc); a2_mc(idx)=0; n2_mc(idx)=0;
a1=(a1_ar.*n1_ar+a1_tc.*n1_tc+a1_td.*n1_td+a1_mc.*n1_mc)./(n1_ar+n1_tc+n1_td+n1_mc);
a2=(a2_ar.*n2_ar+a2_tc.*n2_tc+a2_td.*n2_td+a2_mc.*n2_mc)./(n2_ar+n2_tc+n2_td+n2_mc);
p.z6=(a2-a1)./a1*100/dTs; p.z0=p.z6;
%clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean precipitation';
p.s2='(c) \DeltaPr/Pr averaged over AR days'; 
p.s3='(d) \DeltaPr/Pr averaged over TS days'; 
p.s4='(e) \DeltaPr/Pr averaged over TD days'; 
p.s5='(f) \DeltaPr/Pr averaged over MCS days';
p.s6='(b) \DeltaPr/Pr averaged over AR+TS+TD+MCS days'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) \DeltaPr/Pr averaged over AR days'; 
p.s3='(b) \DeltaPr/Pr averaged over TS days'; 
p.s4='(c) \DeltaPr/Pr averaged over TD days'; 
p.s5='(d) \DeltaPr/Pr averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 17: change in Pr standard deviation over AR/TS/TD/MSC days%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prday_idstd';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=128; p.c='k'; dTs=4.53; no=30;
v=v1.ar; a1=squeeze(v.prday_av); %s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.prday_av); %s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)./a1/dTs*100; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.prday_idstd); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); a1_ar=a1;n1_ar=n1;
v=w1.ar; a2=squeeze(v.prday_idstd); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); a2_ar=a2;n2_ar=n2;
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prday_idstd); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); a1_tc=a1;n1_tc=n1;
v=w1.tc; a2=squeeze(v.prday_idstd); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); a2_tc=a2;n2_tc=n2;
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prday_idstd); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); a1_td=a1;n1_td=n1;
v=w1.td; a2=squeeze(v.prday_idstd); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); a2_td=a2;n2_td=n2;
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prday_idstd); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); a1_mc=a1;n1_mc=n1;
v=w1.mc; a2=squeeze(v.prday_idstd); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); a2_mc=a2;n2_mc=n2;
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
idx=isnan(a1_ar); a1_ar(idx)=0; n1_ar(idx)=0;
idx=isnan(a1_tc); a1_tc(idx)=0; n1_tc(idx)=0;
idx=isnan(a1_td); a1_td(idx)=0; n1_td(idx)=0;
idx=isnan(a1_mc); a1_mc(idx)=0; n1_mc(idx)=0;
idx=isnan(a2_ar); a2_ar(idx)=0; n2_ar(idx)=0;
idx=isnan(a2_tc); a2_tc(idx)=0; n2_tc(idx)=0;
idx=isnan(a2_td); a2_td(idx)=0; n2_td(idx)=0;
idx=isnan(a2_mc); a2_mc(idx)=0; n2_mc(idx)=0;
a1=(a1_ar.*n1_ar+a1_tc.*n1_tc+a1_td.*n1_td+a1_mc.*n1_mc)./(n1_ar+n1_tc+n1_td+n1_mc);
a2=(a2_ar.*n2_ar+a2_tc.*n2_tc+a2_td.*n2_td+a2_mc.*n2_mc)./(n2_ar+n2_tc+n2_td+n2_mc);
p.z6=(a2-a1)./a1*100/dTs; p.z0=p.z6;
%clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean precipitation';
p.s2='(c) \DeltaPr averaged over AR days'; 
p.s3='(d) \DeltaPr averaged over TS days'; 
p.s4='(e) \DeltaPr averaged over TD days'; 
p.s5='(f) \DeltaPr averaged over MCS days';
p.s6='(b) \DeltaPr averaged over AR+TS+TD+MCS days'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) \DeltaPr averaged over AR days'; 
p.s3='(b) \DeltaPr averaged over TS days'; 
p.s4='(c) \DeltaPr averaged over TD days'; 
p.s5='(d) \DeltaPr averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 17.5: change in Pr averaged only over AR/TS/TD/MSC days%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prday_idpct_avg25';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=128; p.c='k'; dTs=4.53; i=1; no=30;
v=v1.ar; a1=squeeze(v.prday_av); %s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.prday_av); %s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)./a1/dTs*100; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; 
a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_ar=a1;n1_ar=n1;
v=w1.ar; 
a2=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s2=squeeze(v.prday_idpct_std(1,i,:,:)); 
n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_ar=a2;n2_ar=n2;
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; 
a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_tc=a1;n1_tc=n1;
v=w1.tc; 
a2=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s2=squeeze(v.prday_idpct_std(1,i,:,:)); 
n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_tc=a2;n2_tc=n2;
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; 
a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_td=a1;n1_td=n1;
v=w1.td; 
a2=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s2=squeeze(v.prday_idpct_std(1,i,:,:)); 
n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_td=a2;n2_td=n2;
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; 
a1=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s1=squeeze(v.prday_idpct_std(1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_mc=a1;n1_mc=n1;
v=w1.mc; 
a2=squeeze(v.prday_idpct_avg(1,i,:,:)); 
s2=squeeze(v.prday_idpct_std(1,i,:,:)); 
n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_mc=a2;n2_mc=n2;
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
idx=isnan(a1_ar); a1_ar(idx)=0; n1_ar(idx)=0;
idx=isnan(a1_tc); a1_tc(idx)=0; n1_tc(idx)=0;
idx=isnan(a1_td); a1_td(idx)=0; n1_td(idx)=0;
idx=isnan(a1_mc); a1_mc(idx)=0; n1_mc(idx)=0;
idx=isnan(a2_ar); a2_ar(idx)=0; n2_ar(idx)=0;
idx=isnan(a2_tc); a2_tc(idx)=0; n2_tc(idx)=0;
idx=isnan(a2_td); a2_td(idx)=0; n2_td(idx)=0;
idx=isnan(a2_mc); a2_mc(idx)=0; n2_mc(idx)=0;
a1=(a1_ar.*n1_ar+a1_tc.*n1_tc+a1_td.*n1_td+a1_mc.*n1_mc)./(n1_ar+n1_tc+n1_td+n1_mc);
a2=(a2_ar.*n2_ar+a2_tc.*n2_tc+a2_td.*n2_td+a2_mc.*n2_mc)./(n2_ar+n2_tc+n2_td+n2_mc);
p.z6=(a2-a1)./a1*100/dTs; p.z0=p.z6;
%clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean precipitation';
p.s2='(c) \DeltaPr/Pr averaged over AR days'; 
p.s3='(d) \DeltaPr/Pr averaged over TS days'; 
p.s4='(e) \DeltaPr/Pr averaged over TD days'; 
p.s5='(f) \DeltaPr/Pr averaged over MCS days';
p.s6='(b) \DeltaPr/Pr averaged over AR+TS+TD+MCS days'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) \DeltaPr/Pr averaged over AR days'; 
p.s3='(b) \DeltaPr/Pr averaged over TS days'; 
p.s4='(c) \DeltaPr/Pr averaged over TD days'; 
p.s5='(d) \DeltaPr/Pr averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 18.5: change in omega 500 averaged only over AR/TS/TD/MSC days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_w500_idpct_avg75';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=128; p.c='k'; dTs=4.53; i=3; no=30;
v=v1.ar; a1=squeeze(v.w500_av); %s1=squeeze(v.w500_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.w500_av); %s2=squeeze(v.w500_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)./a1/dTs*100; p.z1=(a2-a1)/dTs; 
%[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; 
a1=squeeze(v.w500_idx_avg   (1,i,:,:)); 
s1=squeeze(v.w500_idx_std   (1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_ar=a1;n1_ar=n1;
v=w1.ar; 
a2=squeeze(v.w500_idx_avg   (1,i,:,:)); 
s2=squeeze(v.w500_idx_std   (1,i,:,:)); 
n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_ar=a2;n2_ar=n2;
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; 
a1=squeeze(v.w500_idx_avg   (1,i,:,:)); 
s1=squeeze(v.w500_idx_std   (1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_tc=a1;n1_tc=n1;
v=w1.tc; 
a2=squeeze(v.w500_idx_avg   (1,i,:,:)); 
s2=squeeze(v.w500_idx_std   (1,i,:,:)); 
n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_tc=a2;n2_tc=n2;
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; 
a1=squeeze(v.w500_idx_avg   (1,i,:,:)); 
s1=squeeze(v.w500_idx_std   (1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_td=a1;n1_td=n1;
v=w1.td; 
a2=squeeze(v.w500_idx_avg   (1,i,:,:)); 
s2=squeeze(v.w500_idx_std   (1,i,:,:)); 
n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_td=a2;n2_td=n2;
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; 
a1=squeeze(v.w500_idx_avg   (1,i,:,:)); 
s1=squeeze(v.w500_idx_std   (1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_mc=a1;n1_mc=n1;
v=w1.mc; 
a2=squeeze(v.w500_idx_avg   (1,i,:,:)); 
s2=squeeze(v.w500_idx_std   (1,i,:,:)); 
n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_mc=a2;n2_mc=n2;
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
idx=isnan(a1_ar); a1_ar(idx)=0; n1_ar(idx)=0;
idx=isnan(a1_tc); a1_tc(idx)=0; n1_tc(idx)=0;
idx=isnan(a1_td); a1_td(idx)=0; n1_td(idx)=0;
idx=isnan(a1_mc); a1_mc(idx)=0; n1_mc(idx)=0;
idx=isnan(a2_ar); a2_ar(idx)=0; n2_ar(idx)=0;
idx=isnan(a2_tc); a2_tc(idx)=0; n2_tc(idx)=0;
idx=isnan(a2_td); a2_td(idx)=0; n2_td(idx)=0;
idx=isnan(a2_mc); a2_mc(idx)=0; n2_mc(idx)=0;
a1=(a1_ar.*n1_ar+a1_tc.*n1_tc+a1_td.*n1_td+a1_mc.*n1_mc)./(n1_ar+n1_tc+n1_td+n1_mc);
a2=(a2_ar.*n2_ar+a2_tc.*n2_tc+a2_td.*n2_td+a2_mc.*n2_mc)./(n2_ar+n2_tc+n2_td+n2_mc);
p.z6=(a2-a1)./a1*100/dTs; p.z0=p.z6;
%clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean \omega_{500}';
p.s2='(a) \Delta\omega_{500}/\omega_{500} averaged over AR days'; 
p.s3='(b) \Delta\omega_{500}/\omega_{500} averaged over TS days'; 
p.s4='(c) \Delta\omega_{500}/\omega_{500} averaged over TD days'; 
p.s5='(d) \Delta\omega_{500}/\omega_{500} averaged over MCS days';
p.s6='(b) \Delta\omega_{500}/\omega_{500} over AR+TS+TD+MCS'; p.s0='';
p.c1=[-5 5]; a=[-8 8]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) \Delta\omega_{500}/\omega_{500} averaged over AR days'; 
p.s3='(b) \Delta\omega_{500}/\omega_{500} averaged over TS days'; 
p.s4='(c) \Delta\omega_{500}/\omega_{500} averaged over TD days'; 
p.s5='(d) \Delta\omega_{500}/\omega_{500} averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 18: change in omega 500 averaged only over AR/TS/TD/MSC days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_w500_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=128; p.c='k'; dTs=4.53; no=30;
v=v1.ar; a1=squeeze(v.w500_av); %s1=squeeze(v.w500_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.w500_av); %s2=squeeze(v.w500_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)./a1/dTs*100; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.w500_idavg); s1=squeeze(v.w500_idstd); n1=squeeze(v.id_sum); a1_ar=a1;n1_ar=n1;
v=w1.ar; a2=squeeze(v.w500_idavg); s2=squeeze(v.w500_idstd); n2=squeeze(v.id_sum); a2_ar=a2;n2_ar=n2;
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.w500_idavg); s1=squeeze(v.w500_idstd); n1=squeeze(v.id_sum); a1_tc=a1;n1_tc=n1;
v=w1.tc; a2=squeeze(v.w500_idavg); s2=squeeze(v.w500_idstd); n2=squeeze(v.id_sum); a2_tc=a2;n2_tc=n2;
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.w500_idavg); s1=squeeze(v.w500_idstd); n1=squeeze(v.id_sum); a1_td=a1;n1_td=n1;
v=w1.td; a2=squeeze(v.w500_idavg); s2=squeeze(v.w500_idstd); n2=squeeze(v.id_sum); a2_td=a2;n2_td=n2;
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.w500_idavg); s1=squeeze(v.w500_idstd); n1=squeeze(v.id_sum); a1_mc=a1;n1_mc=n1;
v=w1.mc; a2=squeeze(v.w500_idavg); s2=squeeze(v.w500_idstd); n2=squeeze(v.id_sum); a2_mc=a2;n2_mc=n2;
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;
idx=isnan(a1_ar); a1_ar(idx)=0; n1_ar(idx)=0;
idx=isnan(a1_tc); a1_tc(idx)=0; n1_tc(idx)=0;
idx=isnan(a1_td); a1_td(idx)=0; n1_td(idx)=0;
idx=isnan(a1_mc); a1_mc(idx)=0; n1_mc(idx)=0;
idx=isnan(a2_ar); a2_ar(idx)=0; n2_ar(idx)=0;
idx=isnan(a2_tc); a2_tc(idx)=0; n2_tc(idx)=0;
idx=isnan(a2_td); a2_td(idx)=0; n2_td(idx)=0;
idx=isnan(a2_mc); a2_mc(idx)=0; n2_mc(idx)=0;
a1=(a1_ar.*n1_ar+a1_tc.*n1_tc+a1_td.*n1_td+a1_mc.*n1_mc)./(n1_ar+n1_tc+n1_td+n1_mc);
a2=(a2_ar.*n2_ar+a2_tc.*n2_tc+a2_td.*n2_td+a2_mc.*n2_mc)./(n2_ar+n2_tc+n2_td+n2_mc);
p.z6=(a2-a1)./a1*100/dTs; p.z0=p.z6;
%clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean \omega_{500}';
p.s2='(a) \Delta\omega_{500} averaged over AR days'; 
p.s3='(b) \Delta\omega_{500} averaged over TS days'; 
p.s4='(c) \Delta\omega_{500} averaged over TD days'; 
p.s5='(d) \Delta\omega_{500} averaged over MCS days';
p.s6='(b) \Delta\omega_{500} over AR+TS+TD+MCS'; p.s0='';
p.c1=[-5 5]; a=[-5 5]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) \Delta\omega_{500} averaged over AR days'; 
p.s3='(b) \Delta\omega_{500} averaged over TS days'; 
p.s4='(c) \Delta\omega_{500} averaged over TD days'; 
p.s5='(d) \Delta\omega_{500} averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 19: change in prw averaged only over AR/TS/TD/MSC days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prw_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=4; p.nn=128; p.c='k'; dTs=4.53; no=30;
v=v1.ar; a1=squeeze(v.prw_av); %s1=squeeze(v.prw_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.prw_av); %s2=squeeze(v.prw_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)./a1/dTs*100; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.prw_idavg); s1=squeeze(v.prw_idstd); n1=squeeze(v.id_sum); a1_ar=a1;n1_ar=n1;
v=w1.ar; a2=squeeze(v.prw_idavg); s2=squeeze(v.prw_idstd); n2=squeeze(v.id_sum); a2_ar=a2;n2_ar=n2;
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prw_idavg); s1=squeeze(v.prw_idstd); n1=squeeze(v.id_sum); a1_tc=a1;n1_tc=n1;
v=w1.tc; a2=squeeze(v.prw_idavg); s2=squeeze(v.prw_idstd); n2=squeeze(v.id_sum); a2_tc=a2;n2_tc=n2;
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prw_idavg); s1=squeeze(v.prw_idstd); n1=squeeze(v.id_sum); a1_td=a1;n1_td=n1;
v=w1.td; a2=squeeze(v.prw_idavg); s2=squeeze(v.prw_idstd); n2=squeeze(v.id_sum); a2_td=a2;n2_td=n2;
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prw_idavg); s1=squeeze(v.prw_idstd); n1=squeeze(v.id_sum); a1_mc=a1;n1_mc=n1;
v=w1.mc; a2=squeeze(v.prw_idavg); s2=squeeze(v.prw_idstd); n2=squeeze(v.id_sum); a2_mc=a2;n2_mc=n2;
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
idx=isnan(a1_ar); a1_ar(idx)=0; n1_ar(idx)=0;
idx=isnan(a1_tc); a1_tc(idx)=0; n1_tc(idx)=0;
idx=isnan(a1_td); a1_td(idx)=0; n1_td(idx)=0;
idx=isnan(a1_mc); a1_mc(idx)=0; n1_mc(idx)=0;
idx=isnan(a2_ar); a2_ar(idx)=0; n2_ar(idx)=0;
idx=isnan(a2_tc); a2_tc(idx)=0; n2_tc(idx)=0;
idx=isnan(a2_td); a2_td(idx)=0; n2_td(idx)=0;
idx=isnan(a2_mc); a2_mc(idx)=0; n2_mc(idx)=0;
a1=(a1_ar.*n1_ar+a1_tc.*n1_tc+a1_td.*n1_td+a1_mc.*n1_mc)./(n1_ar+n1_tc+n1_td+n1_mc);
a2=(a2_ar.*n2_ar+a2_tc.*n2_tc+a2_td.*n2_td+a2_mc.*n2_mc)./(n2_ar+n2_tc+n2_td+n2_mc);
p.z6=(a2-a1)./a1*100/dTs; p.z0=p.z6;
%clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean PRW';
p.s2='(c) \Delta AR mean PRW'; 
p.s3='(d) \Delta TS mean PRW'; 
p.s4='(e) \Delta TD mean PRW'; 
p.s5='(f) \Delta MCS mean PRW';
p.s6='(b) \Delta AR+TS+TD+MCS PRW'; p.s0='';
p.c1=[0 12]; a=[0 12]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) \DeltaPRW averaged over AR days'; 
p.s3='(b) \DeltaPRW averaged over TS days'; 
p.s4='(c) \DeltaPRW averaged over TD days'; 
p.s5='(d) \DeltaPRW averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 20.5: change in q850 averaged only over AR/TS/TD/MSC days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl'; p.xy=[0 360 -90 90]; 
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_q850_idpct_avg75';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=4; p.nn=128; p.c='k'; dTs=4.53; i=3; no=30;
v=v1.ar; a1=squeeze(v.q850_av); %s1=squeeze(v.q850_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.q850_av); %s2=squeeze(v.q850_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)./a1/dTs*100; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; 
a1=squeeze(v.q850_idx_avg   (1,i,:,:)); 
s1=squeeze(v.q850_idx_std   (1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_ar=a1;n1_ar=n1;
v=w1.ar; 
a2=squeeze(v.q850_idx_avg   (1,i,:,:)); 
s2=squeeze(v.q850_idx_std   (1,i,:,:)); 
n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_ar=a2;n2_ar=n2;
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; 
a1=squeeze(v.q850_idx_avg   (1,i,:,:)); 
s1=squeeze(v.q850_idx_std   (1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_tc=a1;n1_tc=n1;
v=w1.tc; 
a2=squeeze(v.q850_idx_avg   (1,i,:,:)); 
s2=squeeze(v.q850_idx_std   (1,i,:,:)); 
n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_tc=a2;n2_tc=n2;
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; 
a1=squeeze(v.q850_idx_avg   (1,i,:,:)); 
s1=squeeze(v.q850_idx_std   (1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_td=a1;n1_td=n1;
v=w1.td; 
a2=squeeze(v.q850_idx_avg   (1,i,:,:)); 
s2=squeeze(v.q850_idx_std   (1,i,:,:)); 
n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_td=a2;n2_td=n2;
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; 
a1=squeeze(v.q850_idx_avg   (1,i,:,:)); 
s1=squeeze(v.q850_idx_std   (1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_mc=a1;n1_mc=n1;
v=w1.mc; 
a2=squeeze(v.q850_idx_avg   (1,i,:,:)); 
s2=squeeze(v.q850_idx_std   (1,i,:,:)); 
n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_mc=a2;n2_mc=n2;
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
idx=isnan(a1_ar); a1_ar(idx)=0; n1_ar(idx)=0;
idx=isnan(a1_tc); a1_tc(idx)=0; n1_tc(idx)=0;
idx=isnan(a1_td); a1_td(idx)=0; n1_td(idx)=0;
idx=isnan(a1_mc); a1_mc(idx)=0; n1_mc(idx)=0;
idx=isnan(a2_ar); a2_ar(idx)=0; n2_ar(idx)=0;
idx=isnan(a2_tc); a2_tc(idx)=0; n2_tc(idx)=0;
idx=isnan(a2_td); a2_td(idx)=0; n2_td(idx)=0;
idx=isnan(a2_mc); a2_mc(idx)=0; n2_mc(idx)=0;
a1=(a1_ar.*n1_ar+a1_tc.*n1_tc+a1_td.*n1_td+a1_mc.*n1_mc)./(n1_ar+n1_tc+n1_td+n1_mc);
a2=(a2_ar.*n2_ar+a2_tc.*n2_tc+a2_td.*n2_td+a2_mc.*n2_mc)./(n2_ar+n2_tc+n2_td+n2_mc);
p.z6=(a2-a1)./a1*100/dTs; p.z0=p.z6;
%clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean q_{850}';
p.s2='(a) \Deltaq_{850} averaged over AR days'; 
p.s3='(b) \Deltaq_{850} averaged over TS days'; 
p.s4='(c) \Deltaq_{850} averaged over TD days'; 
p.s5='(d) \Deltaq_{850} averaged over MCS days';
p.s6='(b) \Deltaq_{850} over AR+TS+TD+MCS'; p.s0='';
p.c1=[-8 8]; a=[-8 8]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) \Deltaq_{850}/q_{850} averaged over AR days'; 
p.s3='(b) \Deltaq_{850}/q_{850} averaged over TS days'; 
p.s4='(c) \Deltaq_{850}/q_{850} averaged over TD days'; 
p.s5='(d) \Deltaq_{850}/q_{850} averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 20: change in q850 averaged only over AR/TS/TD/MSC days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_q850_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=4; p.nn=128; p.c='k'; dTs=4.53; no=30;
v=v1.ar; a1=squeeze(v.q850_av); %s1=squeeze(v.q850_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.q850_av); %s2=squeeze(v.q850_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)./a1/dTs*100; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.q850_idavg); s1=squeeze(v.q850_idstd); n1=squeeze(v.id_sum); a1_ar=a1;n1_ar=n1;
v=w1.ar; a2=squeeze(v.q850_idavg); s2=squeeze(v.q850_idstd); n2=squeeze(v.id_sum); a2_ar=a2;n2_ar=n2;
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.q850_idavg); s1=squeeze(v.q850_idstd); n1=squeeze(v.id_sum); a1_tc=a1;n1_tc=n1;
v=w1.tc; a2=squeeze(v.q850_idavg); s2=squeeze(v.q850_idstd); n2=squeeze(v.id_sum); a2_tc=a2;n2_tc=n2;
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.q850_idavg); s1=squeeze(v.q850_idstd); n1=squeeze(v.id_sum); a1_td=a1;n1_td=n1;
v=w1.td; a2=squeeze(v.q850_idavg); s2=squeeze(v.q850_idstd); n2=squeeze(v.id_sum); a2_td=a2;n2_td=n2;
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.q850_idavg); s1=squeeze(v.q850_idstd); n1=squeeze(v.id_sum); a1_mc=a1;n1_mc=n1;
v=w1.mc; a2=squeeze(v.q850_idavg); s2=squeeze(v.q850_idstd); n2=squeeze(v.id_sum); a2_mc=a2;n2_mc=n2;
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
idx=isnan(a1_ar); a1_ar(idx)=0; n1_ar(idx)=0;
idx=isnan(a1_tc); a1_tc(idx)=0; n1_tc(idx)=0;
idx=isnan(a1_td); a1_td(idx)=0; n1_td(idx)=0;
idx=isnan(a1_mc); a1_mc(idx)=0; n1_mc(idx)=0;
idx=isnan(a2_ar); a2_ar(idx)=0; n2_ar(idx)=0;
idx=isnan(a2_tc); a2_tc(idx)=0; n2_tc(idx)=0;
idx=isnan(a2_td); a2_td(idx)=0; n2_td(idx)=0;
idx=isnan(a2_mc); a2_mc(idx)=0; n2_mc(idx)=0;
a1=(a1_ar.*n1_ar+a1_tc.*n1_tc+a1_td.*n1_td+a1_mc.*n1_mc)./(n1_ar+n1_tc+n1_td+n1_mc);
a2=(a2_ar.*n2_ar+a2_tc.*n2_tc+a2_td.*n2_td+a2_mc.*n2_mc)./(n2_ar+n2_tc+n2_td+n2_mc);
p.z6=(a2-a1)./a1*100/dTs; p.z0=p.z6;
%clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean q_{850}';
p.s2='(c) \Deltaq_{850} averaged over AR days'; 
p.s3='(d) \Deltaq_{850} averaged over TS days'; 
p.s4='(e) \Deltaq_{850} averaged over TD days'; 
p.s5='(f) \Deltaq_{850} averaged over MCS days';
p.s6='(b) \Deltaq_{850} over AR+TS+TD+MCS days'; p.s0='';
p.c1=[0 10]; a=[0 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) \Deltaq_{850} averaged over AR days'; 
p.s3='(b) \Deltaq_{850} averaged over TS days'; 
p.s4='(c) \Deltaq_{850} averaged over TD days'; 
p.s5='(d) \Deltaq_{850} averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 21.5: change in t850 averaged only over AR/TS/TD/MSC days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl'; p.xy=[0 360 -90 90]; 
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_t850_idpct_avg75';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=4; p.nn=128; p.c='k'; dTs=4.53; i=3; no=30;
v=v1.ar; a1=squeeze(v.t850_av); %s1=squeeze(v.t850_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.t850_av); %s2=squeeze(v.t850_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)/dTs; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; 
a1=squeeze(v.t850_idx_avg   (1,i,:,:)); 
s1=squeeze(v.t850_idx_std   (1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_ar=a1;n1_ar=n1;
v=w1.ar; 
a2=squeeze(v.t850_idx_avg   (1,i,:,:)); 
s2=squeeze(v.t850_idx_std   (1,i,:,:)); 
n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_ar=a2;n2_ar=n2;
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.z2/dTs;
v=v1.tc; 
a1=squeeze(v.t850_idx_avg   (1,i,:,:)); 
s1=squeeze(v.t850_idx_std   (1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_tc=a1;n1_tc=n1;
v=w1.tc; 
a2=squeeze(v.t850_idx_avg   (1,i,:,:)); 
s2=squeeze(v.t850_idx_std   (1,i,:,:)); 
n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_tc=a2;n2_tc=n2;
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.z3/dTs;;
v=v1.td; 
a1=squeeze(v.t850_idx_avg   (1,i,:,:)); 
s1=squeeze(v.t850_idx_std   (1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_td=a1;n1_td=n1;
v=w1.td; 
a2=squeeze(v.t850_idx_avg   (1,i,:,:)); 
s2=squeeze(v.t850_idx_std   (1,i,:,:)); 
n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_td=a2;n2_td=n2;
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.z4/dTs;;
v=v1.mc; 
a1=squeeze(v.t850_idx_avg   (1,i,:,:)); 
s1=squeeze(v.t850_idx_std   (1,i,:,:)); 
n1=squeeze(v.prday_idpct_sum(1,i,:,:)); a1_mc=a1;n1_mc=n1;
v=w1.mc; 
a2=squeeze(v.t850_idx_avg   (1,i,:,:)); 
s2=squeeze(v.t850_idx_std   (1,i,:,:)); 
n2=squeeze(v.prday_idpct_sum(1,i,:,:)); a2_mc=a2;n2_mc=n2;
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.z5/dTs;;
idx=isnan(a1_ar); a1_ar(idx)=0; n1_ar(idx)=0;
idx=isnan(a1_tc); a1_tc(idx)=0; n1_tc(idx)=0;
idx=isnan(a1_td); a1_td(idx)=0; n1_td(idx)=0;
idx=isnan(a1_mc); a1_mc(idx)=0; n1_mc(idx)=0;
idx=isnan(a2_ar); a2_ar(idx)=0; n2_ar(idx)=0;
idx=isnan(a2_tc); a2_tc(idx)=0; n2_tc(idx)=0;
idx=isnan(a2_td); a2_td(idx)=0; n2_td(idx)=0;
idx=isnan(a2_mc); a2_mc(idx)=0; n2_mc(idx)=0;
a1=(a1_ar.*n1_ar+a1_tc.*n1_tc+a1_td.*n1_td+a1_mc.*n1_mc)./(n1_ar+n1_tc+n1_td+n1_mc);
a2=(a2_ar.*n2_ar+a2_tc.*n2_tc+a2_td.*n2_td+a2_mc.*n2_mc)./(n2_ar+n2_tc+n2_td+n2_mc);
p.z6=(a2-a1)/dTs; p.z0=p.z6;
%clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean T_{850}';
p.s2='(a) \DeltaT_{850} averaged over AR days'; 
p.s3='(b) \DeltaT_{850} averaged over TS days'; 
p.s4='(c) \DeltaT_{850} averaged over TD days'; 
p.s5='(d) \DeltaT_{850} averaged over MCS days';
p.s6='(b) \DeltaT_{850} over AR+TS+TD+MCS'; p.s0='';
p.c1=[-1.1 1.1]; a=[-1.1 1.1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) \DeltaT_{850} averaged over AR days'; 
p.s3='(b) \DeltaT_{850} averaged over TS days'; 
p.s4='(c) \DeltaT_{850} averaged over TD days'; 
p.s5='(d) \DeltaT_{850} averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 21: change in T850 averaged only over AR/TS/TD/MSC days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_t850_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=4; p.nn=128; p.c='k'; dTs=4.53; no=30; dTs=1;
v=v1.ar; a1=squeeze(v.t850_av); %s1=squeeze(v.t850_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.t850_av); %s2=squeeze(v.t850_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)/dTs; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.t850_idavg); s1=squeeze(v.t850_idstd); n1=squeeze(v.id_sum);a1_ar=a1;n1_ar=n1;
v=w1.ar; a2=squeeze(v.t850_idavg); s2=squeeze(v.t850_idstd); n2=squeeze(v.id_sum);a2_ar=a2;n2_ar=n2; 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.z2/dTs;
v=v1.tc; a1=squeeze(v.t850_idavg); s1=squeeze(v.t850_idstd); n1=squeeze(v.id_sum);a1_tc=a1;n1_tc=n1;
v=w1.tc; a2=squeeze(v.t850_idavg); s2=squeeze(v.t850_idstd); n2=squeeze(v.id_sum);a2_tc=a2;n2_tc=n2;
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.z3/dTs;;
v=v1.td; a1=squeeze(v.t850_idavg); s1=squeeze(v.t850_idstd); n1=squeeze(v.id_sum);a1_td=a1;n1_td=n1;
v=w1.td; a2=squeeze(v.t850_idavg); s2=squeeze(v.t850_idstd); n2=squeeze(v.id_sum);a2_td=a2;n2_td=n2;
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.z4/dTs;;
v=v1.mc; a1=squeeze(v.t850_idavg); s1=squeeze(v.t850_idstd); n1=squeeze(v.id_sum);a1_mc=a1;n1_mc=n1;
v=w1.mc; a2=squeeze(v.t850_idavg); s2=squeeze(v.t850_idstd); n2=squeeze(v.id_sum);a2_mc=a2;n2_mc=n2;
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.z5/dTs;;
idx=isnan(a1_ar); a1_ar(idx)=0; n1_ar(idx)=0;
idx=isnan(a1_tc); a1_tc(idx)=0; n1_tc(idx)=0;
idx=isnan(a1_td); a1_td(idx)=0; n1_td(idx)=0;
idx=isnan(a1_mc); a1_mc(idx)=0; n1_mc(idx)=0;
idx=isnan(a2_ar); a2_ar(idx)=0; n2_ar(idx)=0;
idx=isnan(a2_tc); a2_tc(idx)=0; n2_tc(idx)=0;
idx=isnan(a2_td); a2_td(idx)=0; n2_td(idx)=0;
idx=isnan(a2_mc); a2_mc(idx)=0; n2_mc(idx)=0;
a1=(a1_ar.*n1_ar+a1_tc.*n1_tc+a1_td.*n1_td+a1_mc.*n1_mc)./(n1_ar+n1_tc+n1_td+n1_mc);
a2=(a2_ar.*n2_ar+a2_tc.*n2_tc+a2_td.*n2_td+a2_mc.*n2_mc)./(n2_ar+n2_tc+n2_td+n2_mc);
p.z6=(a2-a1)/dTs; p.z0=p.z6;
%clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean T_{850}';
p.s2='(c) \DeltaT_{850} averaged over AR days'; 
p.s3='(d) \DeltaT_{850} averaged over TS days'; 
p.s4='(e) \DeltaT_{850} averaged over TD days'; 
p.s5='(f) \DeltaT_{850} averaged over MCS days';
p.s6='(b) \DeltaT_{850} over AR+TS+TD+MCS days'; p.s0='';
p.c1=[0 7]; a=[0 7]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) \DeltaT_{850} averaged over AR days'; 
p.s3='(b) \DeltaT_{850} averaged over TS days'; 
p.s4='(c) \DeltaT_{850} averaged over TD days'; 
p.s5='(d) \DeltaT_{850} averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 22: change in TAS averaged only over AR/TS/TD/MSC days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_tas_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=4; p.nn=128; p.c='k'; dTs=4.53; no=30; dTs=1;
v=v1.ar; a1=squeeze(v.tas_av); %s1=squeeze(v.tas_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.tas_av); %s2=squeeze(v.tas_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)/dTs; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.tas_idavg); s1=squeeze(v.tas_idstd); n1=squeeze(v.id_sum); a1_ar=a1;n1_ar=n1;
v=w1.ar; a2=squeeze(v.tas_idavg); s2=squeeze(v.tas_idstd); n2=squeeze(v.id_sum); a2_ar=a2;n2_ar=n2;
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.z2/dTs;
v=v1.tc; a1=squeeze(v.tas_idavg); s1=squeeze(v.tas_idstd); n1=squeeze(v.id_sum); a1_tc=a1;n1_tc=n1;
v=w1.tc; a2=squeeze(v.tas_idavg); s2=squeeze(v.tas_idstd); n2=squeeze(v.id_sum); a2_tc=a2;n2_tc=n2;
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.z3/dTs;;
v=v1.td; a1=squeeze(v.tas_idavg); s1=squeeze(v.tas_idstd); n1=squeeze(v.id_sum); a1_td=a1;n1_td=n1;
v=w1.td; a2=squeeze(v.tas_idavg); s2=squeeze(v.tas_idstd); n2=squeeze(v.id_sum); a2_td=a2;n2_td=n2;
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.z4/dTs;;
v=v1.mc; a1=squeeze(v.tas_idavg); s1=squeeze(v.tas_idstd); n1=squeeze(v.id_sum); a1_mc=a1;n1_mc=n1;
v=w1.mc; a2=squeeze(v.tas_idavg); s2=squeeze(v.tas_idstd); n2=squeeze(v.id_sum); a2_mc=a2;n2_mc=n2;
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.z5/dTs;;
idx=isnan(a1_ar); a1_ar(idx)=0; n1_ar(idx)=0;
idx=isnan(a1_tc); a1_tc(idx)=0; n1_tc(idx)=0;
idx=isnan(a1_td); a1_td(idx)=0; n1_td(idx)=0;
idx=isnan(a1_mc); a1_mc(idx)=0; n1_mc(idx)=0;
idx=isnan(a2_ar); a2_ar(idx)=0; n2_ar(idx)=0;
idx=isnan(a2_tc); a2_tc(idx)=0; n2_tc(idx)=0;
idx=isnan(a2_td); a2_td(idx)=0; n2_td(idx)=0;
idx=isnan(a2_mc); a2_mc(idx)=0; n2_mc(idx)=0;
a1=(a1_ar.*n1_ar+a1_tc.*n1_tc+a1_td.*n1_td+a1_mc.*n1_mc)./(n1_ar+n1_tc+n1_td+n1_mc);
a2=(a2_ar.*n2_ar+a2_tc.*n2_tc+a2_td.*n2_td+a2_mc.*n2_mc)./(n2_ar+n2_tc+n2_td+n2_mc);
p.z6=(a2-a1)/dTs; p.z0=p.z6;
%clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean TAS';
p.s2='(a) \DeltaTAS averaged over AR days'; 
p.s3='(b) \DeltaTAS averaged over TS days'; 
p.s4='(c) \DeltaTAS averaged over TD days'; 
p.s5='(d) \DeltaTAS averaged over MCS days';
p.s6='(b) \DeltaTAS over AR+TS+TD+MCS days'; p.s0='';
p.c1=[0 7]; a=[0 7]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) \DeltaTAS averaged over AR days'; 
p.s3='(b) \DeltaTAS averaged over TS days'; 
p.s4='(c) \DeltaTAS averaged over TD days'; 
p.s5='(d) \DeltaTAS averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 23: change in T500 averaged only over AR/TS/TD/MSC days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_t500_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=4; p.nn=128; p.c='k'; dTs=4.53; no=30; dTs=1;
v=v1.ar; a1=squeeze(v.t500_av); %s1=squeeze(v.t500_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.t500_av); %s2=squeeze(v.t500_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)/dTs; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.t500_idavg); s1=squeeze(v.t500_idstd); n1=squeeze(v.id_sum);
v=w1.ar; a2=squeeze(v.t500_idavg); s2=squeeze(v.t500_idstd); n2=squeeze(v.id_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.z2/dTs;
v=v1.tc; a1=squeeze(v.t500_idavg); s1=squeeze(v.t500_idstd); n1=squeeze(v.id_sum); 
v=w1.tc; a2=squeeze(v.t500_idavg); s2=squeeze(v.t500_idstd); n2=squeeze(v.id_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.z3/dTs;;
v=v1.td; a1=squeeze(v.t500_idavg); s1=squeeze(v.t500_idstd); n1=squeeze(v.id_sum); 
v=w1.td; a2=squeeze(v.t500_idavg); s2=squeeze(v.t500_idstd); n2=squeeze(v.id_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.z4/dTs;;
v=v1.mc; a1=squeeze(v.t500_idavg); s1=squeeze(v.t500_idstd); n1=squeeze(v.id_sum); 
v=w1.mc; a2=squeeze(v.t500_idavg); s2=squeeze(v.t500_idstd); n2=squeeze(v.id_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.z5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean T_{500}';
p.s2='(c) \Delta AR mean T_{500}'; 
p.s3='(d) \Delta TS mean T_{500}'; 
p.s4='(e) \Delta TD mean T_{500}'; 
p.s5='(f) \Delta MCS mean T_{500}';
p.s6='(b) \Delta AR+TS+TD+MCS T_{500}'; p.s0='';
p.c1=[0 7]; a=[0 7]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) \DeltaT_{500} averaged over AR days'; 
p.s3='(b) \DeltaT_{500} averaged over TS days'; 
p.s4='(c) \DeltaT_{500} averaged over TD days'; 
p.s5='(d) \DeltaT_{500} averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 24: change in LW CRE averaged only over AR/TS/TD/MSC days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_lwcf_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=4; p.nn=128; p.c='k'; dTs=4.53; no=30;
v=v1.ar; a1=squeeze(v.lwcf_av); %s1=squeeze(v.lwcf_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.lwcf_av); %s2=squeeze(v.lwcf_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)/dTs; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum); a1_ar=a1;n1_ar=n1;
v=w1.ar; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum); a2_ar=a2;n2_ar=n2;
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.z2/dTs;
v=v1.tc; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum); a1_tc=a1;n1_tc=n1;
v=w1.tc; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum); a2_tc=a2;n2_tc=n2;
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.z3/dTs;;
v=v1.td; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum); a1_td=a1;n1_td=n1;
v=w1.td; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum); a2_td=a2;n2_td=n2;
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.z4/dTs;;
v=v1.mc; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum); a1_mc=a1;n1_mc=n1;
v=w1.mc; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum); a2_mc=a2;n2_mc=n2;
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.z5/dTs;;
idx=isnan(a1_ar); a1_ar(idx)=0; n1_ar(idx)=0;
idx=isnan(a1_tc); a1_tc(idx)=0; n1_tc(idx)=0;
idx=isnan(a1_td); a1_td(idx)=0; n1_td(idx)=0;
idx=isnan(a1_mc); a1_mc(idx)=0; n1_mc(idx)=0;
idx=isnan(a2_ar); a2_ar(idx)=0; n2_ar(idx)=0;
idx=isnan(a2_tc); a2_tc(idx)=0; n2_tc(idx)=0;
idx=isnan(a2_td); a2_td(idx)=0; n2_td(idx)=0;
idx=isnan(a2_mc); a2_mc(idx)=0; n2_mc(idx)=0;
a1=(a1_ar.*n1_ar+a1_tc.*n1_tc+a1_td.*n1_td+a1_mc.*n1_mc)./(n1_ar+n1_tc+n1_td+n1_mc);
a2=(a2_ar.*n2_ar+a2_tc.*n2_tc+a2_td.*n2_td+a2_mc.*n2_mc)./(n2_ar+n2_tc+n2_td+n2_mc);
p.z6=(a2-a1)/dTs; p.z0=p.z6;
%clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5; p.z6=nanmean(a,3);
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean LW CRE';
p.s2='(c) \DeltaLW CRE averaged over AR days'; 
p.s3='(d) \DeltaLW CRE averaged over TS days'; 
p.s4='(e) \DeltaLW CRE averaged over TD days'; 
p.s5='(f) \DeltaLW CRE averaged over MCS days';
p.s6='(b) \Delta LW CRE over AR+TS+TD+MCS condition'; p.s0='';
p.c1=[-2 2]; a=[-2 2]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) \DeltaLW CRE averaged over AR days'; 
p.s3='(b) \DeltaLW CRE averaged over TS days'; 
p.s4='(c) \DeltaLW CRE averaged over TD days'; 
p.s5='(d) \DeltaLW CRE averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 25: change in SW CRE averaged only over AR/TS/TD/MSC days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_swcf_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=4; p.nn=128; p.c='k'; dTs=4.53; no=30;
v=v1.ar; a1=squeeze(v.swcf_av); %s1=squeeze(v.swcf_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.swcf_av); %s2=squeeze(v.swcf_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)/dTs; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
v=w1.ar; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.z2/dTs;
v=v1.tc; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
v=w1.tc; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.z3/dTs;;
v=v1.td; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
v=w1.td; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.z4/dTs;;
v=v1.mc; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
v=w1.mc; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.z5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) \Delta annual mean SW CRE';
p.s2='(c) \DeltaSW CRE averaged over AR days'; 
p.s3='(d) \DeltaSW CRE averaged over TS days'; 
p.s4='(e) \DeltaSW CRE averaged over TD days'; 
p.s5='(f) \DeltaSW CRE averaged over MCS days';
p.s6='(b) \Delta SW CRE over AR+TS+TD+MCS condition'; p.s0='';
p.c1=[-5 5]; a=[-5 5]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) \DeltaSW CRE averaged over AR days'; 
p.s3='(b) \DeltaSW CRE averaged over TS days'; 
p.s4='(c) \DeltaSW CRE averaged over TD days'; 
p.s5='(d) \DeltaSW CRE averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig. 25: change in Pr from AR/TS/TD/MSC days with Pr>P99
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prday_idavg_p99';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; I=1; no=30;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=128; p.c='k'; dTs=4.53; I=1; no=30;
v=v1.ar; a1=squeeze(v.prday_pct(1,I,:,:)); %s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.prday_pct(1,I,:,:)); %s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)./a1/dTs*100; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.ar; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.tc; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.td; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.mc; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6; %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='percent change of Pr 99 percentile (P99)';
p.s2='\DeltaPr averaged over AR days with Pr>P99'; 
p.s3='\DeltaPr averaged over TS days with Pr>P99'; 
p.s4='\DeltaPr averaged over TD days with Pr>P99'; 
p.s5='\DeltaPr averaged over MSC days with Pr>P99';
p.s6='\DeltaPr averaged over AR+TS+TD+MSC days with Pr>P99'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
p.s2='\DeltaPr averaged over AR days with Pr>P99'; 
p.s3='\DeltaPr averaged over TS days with Pr>P99'; 
p.s4='\DeltaPr averaged over TD days with Pr>P99'; 
p.s5='\DeltaPr averaged over MSC days with Pr>P99';
plot_2d_4panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%omega500%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_w500_idavg_p99';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; I=1; no=30;
v=v1.ar; a1=squeeze(v.prday_pct(1,I,:,:)); %s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.prday_pct(1,I,:,:)); %s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)./a1/dTs*100; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.w500_idavg_p99); s1=squeeze(v.w500_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.ar; a2=squeeze(v.w500_idavg_p99); s2=squeeze(v.w500_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.w500_idavg_p99); s1=squeeze(v.w500_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.tc; a2=squeeze(v.w500_idavg_p99); s2=squeeze(v.w500_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.w500_idavg_p99); s1=squeeze(v.w500_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.td; a2=squeeze(v.w500_idavg_p99); s2=squeeze(v.w500_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.w500_idavg_p99); s1=squeeze(v.w500_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.mc; a2=squeeze(v.w500_idavg_p99); s2=squeeze(v.w500_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6; %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='percent change in Pr 99 percentile (P99)';
p.s2='percent change in \omega_{500} for AR (Pr>=P99)'; 
p.s3='percent change in \omega_{500} for TS (Pr>=P99)'; 
p.s4='percent change in \omega_{500} for TD (Pr>=P99)'; 
p.s5='percent change in \omega_{500} for MSC (Pr>=P99)';
p.s6='percent change in \omega_{500} for ALL (Pr>=P99)'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
plot_2d_4panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PRW%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prw_idavg_p99';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; I=1; no=30;
v=v1.ar; a1=squeeze(v.prday_pct(1,I,:,:)); %s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.prday_pct(1,I,:,:)); %s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)./a1/dTs*100; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.prw_idavg_p99); s1=squeeze(v.prw_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.ar; a2=squeeze(v.prw_idavg_p99); s2=squeeze(v.prw_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prw_idavg_p99); s1=squeeze(v.prw_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.tc; a2=squeeze(v.prw_idavg_p99); s2=squeeze(v.prw_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prw_idavg_p99); s1=squeeze(v.prw_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.td; a2=squeeze(v.prw_idavg_p99); s2=squeeze(v.prw_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prw_idavg_p99); s1=squeeze(v.prw_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.mc; a2=squeeze(v.prw_idavg_p99); s2=squeeze(v.prw_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6; %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='percent change in Pr 99 percentile (P99)';
p.s2='percent change in PRW for AR (Pr>=P99)'; 
p.s3='percent change in PRW for TS (Pr>=P99)'; 
p.s4='percent change in PRW for TD (Pr>=P99)'; 
p.s5='percent change in PRW for MSC (Pr>=P99)';
p.s6='percent change in PRW for ALL (Pr>=P99)'; p.s0='';
p.c1=[-10 10]; a=[0 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
plot_2d_4panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%HUS850%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_q850_idavg_p99';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; I=1; no=30;
v=v1.ar; a1=squeeze(v.prday_pct(1,I,:,:)); %s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.prday_pct(1,I,:,:)); %s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)./a1/dTs*100; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.q850_idavg_p99); s1=squeeze(v.q850_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.ar; a2=squeeze(v.q850_idavg_p99); s2=squeeze(v.q850_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.q850_idavg_p99); s1=squeeze(v.q850_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.tc; a2=squeeze(v.q850_idavg_p99); s2=squeeze(v.q850_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.q850_idavg_p99); s1=squeeze(v.q850_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.td; a2=squeeze(v.q850_idavg_p99); s2=squeeze(v.q850_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.q850_idavg_p99); s1=squeeze(v.q850_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.mc; a2=squeeze(v.q850_idavg_p99); s2=squeeze(v.q850_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6; %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='percent change in Pr 99 percentile (P99)';
p.s2='percent change in HUS_{850} for AR (Pr>=P99)'; 
p.s3='percent change in HUS_{850} for TS (Pr>=P99)'; 
p.s4='percent change in HUS_{850} for TD (Pr>=P99)'; 
p.s5='percent change in HUS_{850} for MSC (Pr>=P99)';
p.s6='percent change in HUS_{850} for ALL (Pr>=P99)'; p.s0='';
p.c1=[-10 10]; a=[0 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
plot_2d_4panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%HUS850%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_q850_idavg_p99';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; I=1; no=30;
v=v1.ar; a1=squeeze(v.prday_pct(1,I,:,:)); %s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.prday_pct(1,I,:,:)); %s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)./a1/dTs*100; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.q850_idavg_p99); s1=squeeze(v.q850_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.ar; a2=squeeze(v.q850_idavg_p99); s2=squeeze(v.q850_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.q850_idavg_p99); s1=squeeze(v.q850_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.tc; a2=squeeze(v.q850_idavg_p99); s2=squeeze(v.q850_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.q850_idavg_p99); s1=squeeze(v.q850_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.td; a2=squeeze(v.q850_idavg_p99); s2=squeeze(v.q850_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.q850_idavg_p99); s1=squeeze(v.q850_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.mc; a2=squeeze(v.q850_idavg_p99); s2=squeeze(v.q850_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6; %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='percent change in Pr 99 percentile (P99)';
p.s2='percent change in HUS_{850} for AR (Pr>=P99)'; 
p.s3='percent change in HUS_{850} for TS (Pr>=P99)'; 
p.s4='percent change in HUS_{850} for TD (Pr>=P99)'; 
p.s5='percent change in HUS_{850} for MSC (Pr>=P99)';
p.s6='percent change in HUS_{850} for ALL (Pr>=P99)'; p.s0='';
p.c1=[-10 10]; a=[0 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
plot_2d_4panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%T850%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_T850_idavg_p99';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; I=1; no=30;
v=v1.ar; a1=squeeze(v.prday_pct(1,I,:,:)); %s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.prday_pct(1,I,:,:)); %s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)./a1/dTs*100; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.t850_idavg_p99); s1=squeeze(v.t850_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.ar; a2=squeeze(v.t850_idavg_p99); s2=squeeze(v.t850_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.z2/dTs;
v=v1.tc; a1=squeeze(v.t850_idavg_p99); s1=squeeze(v.t850_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.tc; a2=squeeze(v.t850_idavg_p99); s2=squeeze(v.t850_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.z3/dTs;;
v=v1.td; a1=squeeze(v.t850_idavg_p99); s1=squeeze(v.t850_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.td; a2=squeeze(v.t850_idavg_p99); s2=squeeze(v.t850_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.z4/dTs;;
v=v1.mc; a1=squeeze(v.t850_idavg_p99); s1=squeeze(v.t850_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.mc; a2=squeeze(v.t850_idavg_p99); s2=squeeze(v.t850_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.z5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6; %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='percent change in Pr 99 percentile (P99)';
p.s2='change in T850 for AR (Pr>=P99)'; 
p.s3='change in T850 for TS (Pr>=P99)'; 
p.s4='change in T850 for TD (Pr>=P99)'; 
p.s5='change in T850 for MSC (Pr>=P99)';
p.s6='change in T850 for ALL (Pr>=P99)'; p.s0='';
p.c1=[-10 10]; a=[0 1.5]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
plot_2d_4panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TAS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_TAS_idavg_p99';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; I=1; no=30;
v=v1.ar; a1=squeeze(v.prday_pct(1,I,:,:)); %s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.prday_pct(1,I,:,:)); %s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)./a1/dTs*100; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.tas_idavg_p99); s1=squeeze(v.tas_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.ar; a2=squeeze(v.tas_idavg_p99); s2=squeeze(v.tas_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.z2/dTs;
v=v1.tc; a1=squeeze(v.tas_idavg_p99); s1=squeeze(v.tas_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.tc; a2=squeeze(v.tas_idavg_p99); s2=squeeze(v.tas_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.z3/dTs;;
v=v1.td; a1=squeeze(v.tas_idavg_p99); s1=squeeze(v.tas_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.td; a2=squeeze(v.tas_idavg_p99); s2=squeeze(v.tas_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.z4/dTs;;
v=v1.mc; a1=squeeze(v.tas_idavg_p99); s1=squeeze(v.tas_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.mc; a2=squeeze(v.tas_idavg_p99); s2=squeeze(v.tas_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.z5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6; %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='percent change in Pr 99 percentile (P99)';
p.s2='change in TAS for AR (Pr>=P99)'; 
p.s3='change in TAS for TS (Pr>=P99)'; 
p.s4='change in TAS for TD (Pr>=P99)'; 
p.s5='change in TAS for MSC (Pr>=P99)';
p.s6='change in TAS for ALL (Pr>=P99)'; p.s0='';
p.c1=[-10 10]; a=[-0.5 1.5]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
plot_2d_4panel(p);







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: present-day climo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %occurrence frequency: fraction of all days
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='frqday'; 
p.xy=[0 360 -90 90]; p.xy=[200 320 0 70];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(v1.ar.prday_fqwet(1,:,:,2));
p.z2=squeeze(v1.ar.frqday);   
p.z3=squeeze(v1.tc.frqday);
p.z4=squeeze(v1.td.frqday);
p.z5=squeeze(v1.mc.frqday);    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='frequency of wet day';
p.s2='frequency of AR days'; 
p.s3='frequency of TS days'; 
p.s4='frequency of TD days'; 
p.s5='frequency of MCS days';
p.s6='SUM=AR+TS+TD+MCS'; p.s0='';
p.c1=[0 1]; a=[0 0.4]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=[0 1];
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl';%occurrence frequency: fraction of the wet days
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='frqday_frac';
p.xy=[0 360 -90 90]; p.xy=[190 320 0 72];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(v1.ar.prday_fqwet(1,:,:,2));
p.z2=squeeze(v1.ar.frqday)./p.z1;   
p.z3=squeeze(v1.tc.frqday)./p.z1;
p.z4=squeeze(v1.td.frqday)./p.z1;
p.z5=squeeze(v1.mc.frqday)./p.z1; 
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='frequency of wet day';
p.s2='fraction of AR days'; 
p.s3='fraction of TS days'; 
p.s4='fraction of TD days'; 
p.s5='fraction of MCS days';
p.s6='SUM=AR+TS+TD+MCS'; p.s0='';
p.c1=[0 1]; a=[0 1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %fraction of P>P99 from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='prday_fp99_from_id';
p.xy=[0 360 -90 90]; p.xy=[190 320 0 72];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(v1.ar.prday_pct(:,1,:,:));
p.z2=squeeze(v1.ar.prday_fp99_from_id);   
p.z3=squeeze(v1.tc.prday_fp99_from_id);
p.z4=squeeze(v1.td.prday_fp99_from_id);
p.z5=squeeze(v1.mc.prday_fp99_from_id);
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='99 percentile of daily precip';
p.s2='fraction from AR'; 
p.s3='fraction from TS'; 
p.s4='fraction from TD'; 
p.s5='fraction from MCS';
p.s6='SUM=AR+TS+TD+MCS'; p.s0='';
p.c1=[0 100]; a=[0 1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %fraction of P>P99.9 from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='prday_fp999_from_id';
p.xy=[0 360 -90 90]; p.xy=[190 320 0 72];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(v1.ar.prday_pct(:,2,:,:));
p.z2=squeeze(v1.ar.prday_fp999_from_id);   
p.z3=squeeze(v1.tc.prday_fp999_from_id);
p.z4=squeeze(v1.td.prday_fp999_from_id);
p.z5=squeeze(v1.mc.prday_fp999_from_id);
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='99.9 percentile of daily precip';
p.s2='fraction from AR'; 
p.s3='fraction from TS'; 
p.s4='fraction from TD'; 
p.s5='fraction from MCS';
p.s6='SUM=AR+TS+TD+MCS'; p.s0='';
p.c1=[0 200]; a=[0 1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %all time mean prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='prday_idwei';
p.xy=[0 360 -90 90]; p.xy=[190 320 0 72];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(v1.ar.prday_av);   
p.z2=squeeze(v1.ar.prday_idwei);   
p.z3=squeeze(v1.tc.prday_idwei); 
p.z4=squeeze(v1.td.prday_idwei);
p.z5=squeeze(v1.mc.prday_idwei);    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='annual mean precipitation, P';
p.s2='annual mean AR precipitation'; 
p.s3='annual mean TS precipitation'; 
p.s4='annual mean TD precipitation'; 
p.s5='annual mean MCS precipitation';
p.s6='SUM=AR+TS+TD+MCS precipitation'; p.s0='';
p.c1=[0 10]; p.c2=[0 3]; p.c3=[0 3]; p.c4=[0 3]; p.c5=[0 6]; p.c6=[0 10]; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %fraction of prday from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='prday_idwei_frac';
p.xy=[0 360 -90 90]; p.xy=[190 320 0 72];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(v1.ar.prday_av); %p.z1=squeeze(v1.ar.prday_awwet(1,:,:,2)); 
p.z2=squeeze(v1.ar.prday_idwei);   
p.z3=squeeze(v1.tc.prday_idwei);
p.z4=squeeze(v1.td.prday_idwei);
p.z5=squeeze(v1.mc.prday_idwei);    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6; 
a=p.z1; p.z2=p.z2./a; p.z3=p.z3./a; p.z4=p.z4./a; p.z5=p.z5./a; p.z6=p.z6./a;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='annual mean precipitation P';
p.s2='fraction of P from AR'; 
p.s3='fraction of P from TS'; 
p.s4='fraction of P from TD'; 
p.s5='fraction of P from MCS';
p.s6='fraction of P from AR+TS+TD+MCS'; p.s0='';
p.c1=[0 12]; p.c2=[0 1]; p.c3=[0 1]; p.c4=[0 1]; p.c5=[0 1]; p.c6=[0 1]; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %weather type mean prday
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='prday_idavg';
p.xy=[0 360 -90 90]; p.xy=[190 320 0 72];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='k';
p.z1=squeeze(v1.ar.prday_av); p.z0=p.z1; no=1;
v=v1.ar; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z2]=compute_se(a1,s1,n1,no);
v=v1.tc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z3]=compute_se(a1,s1,n1,no);
v=v1.td; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z4]=compute_se(a1,s1,n1,no);
v=v1.mc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
[p.z5]=compute_se(a1,s1,n1,no);
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='annual mean precipitation';
p.s2='AR'; p.s3='TS'; p.s4='TD'; p.s5='MCS';
p.s6='AVG (AR+TS+TD+MCS)'; p.s0='';
p.c1=[0 15]; a=[0 15]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %weather type 99 percentile for prday
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='prday_idavg_p99';
p.xy=[0 360 -90 90]; p.xy=[190 320 0 72];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='k';
p.z1=squeeze(v1.ar.prday_pct(1,1,:,:)); p.z0=p.z1; no=1;
v=v1.ar; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
[p.z2]=compute_se(a1,s1,n1,no);
v=v1.tc; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
[p.z3]=compute_se(a1,s1,n1,no);
v=v1.td; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
[p.z4]=compute_se(a1,s1,n1,no);
v=v1.mc; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
[p.z5]=compute_se(a1,s1,n1,no);
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='99 percentile of daily precip, P99';
p.s2='AVG AR P>=P99'; 
p.s3='AVG TS P>=P99'; 
p.s4='AVG TD P>=P99'; 
p.s5='AVG MSC P>=P99';
p.s6='AVG AR+TS+TD+MCS P>=P99'; p.s0='';
p.c1=[0 100]; a=[0 100]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %weather type 99.9 percentile for prday
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='prday_idavg_p999';
p.xy=[0 360 -90 90]; p.xy=[190 320 0 72];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='k';
p.z1=squeeze(v1.ar.prday_pct(1,2,:,:)); p.z0=p.z1; no=5;
v=v1.ar; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
[p.z2]=compute_se(a1,s1,n1,no);
v=v1.tc; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
[p.z3]=compute_se(a1,s1,n1,no);
v=v1.td; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
[p.z4]=compute_se(a1,s1,n1,no);
v=v1.mc; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
[p.z5]=compute_se(a1,s1,n1,no);
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='99.9 percentile of daily precip, P99.9';
p.s2='AVG AR P>=P99.9'; 
p.s3='AVG TS P>=P99.9'; 
p.s4='AVG TD P>=P99.9'; 
p.s5='AVG MSC P>=P99.9';
p.s6='AVG AR+TS+TD+MCS P>=P99.9'; p.s0='';
p.c1=[0 200]; a=[0 200]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LWCF%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %all time mean lwcf from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='lwcf_idwei';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(v1.ar.lwcf_av);
p.z2=squeeze(v1.ar.lwcf_idwei);   
p.z3=squeeze(v1.tc.lwcf_idwei);
p.z4=squeeze(v1.td.lwcf_idwei);
p.z5=squeeze(v1.mc.lwcf_idwei);
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='LW CRF';
p.s2='LW CRE from AR'; 
p.s3='LW CRE from TS'; 
p.s4='LW CRE from TD'; 
p.s5='LW CRE from MCS';
p.s6='SUM=AR+TS+TD+MCS'; p.s0='';
p.c1=[0 80]; a=[0 40]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %fraction of lwcf from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='lwcf_idwei_frac';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1];p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(v1.ar.lwcf_av); %p.z1=squeeze(v1.ar.prday_awwet(1,:,:,2)); 
p.z2=squeeze(v1.ar.lwcf_idwei);   
p.z3=squeeze(v1.tc.lwcf_idwei);
p.z4=squeeze(v1.td.lwcf_idwei);
p.z5=squeeze(v1.mc.lwcf_idwei);    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6; 
a=p.z1; p.z2=p.z2./a; p.z3=p.z3./a; p.z4=p.z4./a; p.z5=p.z5./a; p.z6=p.z6./a;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='annual mean LW CRE (W/m2)';
p.s2='fraction of from AR'; 
p.s3='fraction of from TS'; 
p.s4='fraction of from TD'; 
p.s5='fraction of from MCS';
p.s6='fraction of from AR+TS+TD+MCS'; p.s0='';
p.c1=[0 80]; p.c2=[0 1]; p.c3=[0 1]; p.c4=[0 1]; p.c5=[0 1]; p.c6=[0 1]; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %weather type mean lwcf
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='lwcf_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='k';
p.z1=squeeze(v1.ar.lwcf_av); p.z0=p.z1; no=10;
v=v1.ar; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum); 
[p.z2]=compute_se(a1,s1,n1,no);
v=v1.tc; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum); 
[p.z3]=compute_se(a1,s1,n1,no);
v=v1.td; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum); 
[p.z4]=compute_se(a1,s1,n1,no);
v=v1.mc; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum); 
[p.z5]=compute_se(a1,s1,n1,no);
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='annual mean LW CRE (W/m2)';
p.s2='AR mean'; p.s3='TS mean'; p.s4='TD mean'; p.s5='MCS mean';
p.s6='AVG (AR+TS+TD+MCS)'; p.s0='';
p.c1=[0 80]; a=[0 80]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SWCF%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %all time mean swcf from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='swcf_idwei';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(v1.ar.swcf_av);
p.z2=squeeze(v1.ar.swcf_idwei);   
p.z3=squeeze(v1.tc.swcf_idwei);
p.z4=squeeze(v1.td.swcf_idwei);
p.z5=squeeze(v1.mc.swcf_idwei);
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='SW CRE';
p.s2='SW CRE from AR'; 
p.s3='SW CRE from TS'; 
p.s4='SW CRE from TD'; 
p.s5='SW CRE from MCS';
p.s6='SUM=AR+TS+TD+MCS'; p.s0='';
p.c1=[-80 0]; a=[-40 0]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %fraction of swcf from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='swcf_idwei_frac';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1];p.opt=1;p.nn=64; p.c='w';
p.z1=squeeze(v1.ar.swcf_av); %p.z1=squeeze(v1.ar.prday_awwet(1,:,:,2)); 
p.z2=squeeze(v1.ar.swcf_idwei);   
p.z3=squeeze(v1.tc.swcf_idwei);
p.z4=squeeze(v1.td.swcf_idwei);
p.z5=squeeze(v1.mc.swcf_idwei);    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6; 
a=p.z1; p.z2=p.z2./a; p.z3=p.z3./a; p.z4=p.z4./a; p.z5=p.z5./a; p.z6=p.z6./a;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='annual mean SW CRE (W/m2)';
p.s2='fraction of P from AR'; 
p.s3='fraction of P from TS'; 
p.s4='fraction of P from TD'; 
p.s5='fraction of P from MCS';
p.s6='fraction of P from AR+TS+TD+MCS'; p.s0='';
p.c1=[-80 0]; p.c2=[0 1]; p.c3=[0 1]; p.c4=[0 1]; p.c5=[0 1]; p.c6=[0 1]; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %weather type mean swcf
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='swcf_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=1;p.nn=64; p.c='k';
p.z1=squeeze(v1.ar.swcf_av); p.z0=p.z1; no=1;
v=v1.ar; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
[p.z2]=compute_se(a1,s1,n1,no);
v=v1.tc; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
[p.z3]=compute_se(a1,s1,n1,no);
v=v1.td; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
[p.z4]=compute_se(a1,s1,n1,no);
v=v1.mc; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
[p.z5]=compute_se(a1,s1,n1,no);
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='annual mean SW CRE (W/m2)';
p.s2='AR mean'; p.s3='TS mean'; p.s4='TD mean'; p.s5='MCS mean';
p.s6='AVG (AR+TS+TD+MCS)'; p.s0='';
p.c1=[-80 0]; a=[-150 0]; p.c2=a; p.c3=a; p.c4=a; p.c5=[-150 0]; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_frqday';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-0.1: 0.005: 0.1]; p.opt=2; p.nn=64; p.c='k';
p.z1=squeeze(w1.ar.prday_fqwet(1,:,:,2) - v1.ar.prday_fqwet(1,:,:,2));
p.z2=squeeze(w1.ar.frqday - v1.ar.frqday);
p.z3=squeeze(w1.tc.frqday - v1.tc.frqday);
p.z4=squeeze(w1.td.frqday - v1.td.frqday);
p.z5=squeeze(w1.mc.frqday - v1.mc.frqday);    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='\Delta frequency of wet day';
p.s2='\Delta frequency of AR days'; 
p.s3='\Delta frequency of TS days'; 
p.s4='\Delta frequency of TD days'; 
p.s5='\Delta frequency of MCS days';
p.s6='\Delta SUM=AR+TS+TD+MCS days'; p.s0='';
p.c1=[-0.1 0.1]; a=[-0.04 0.04]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_fp99_from_id';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k';
a=squeeze(w1.ar.prday_pct(:,1,:,:)); b=squeeze(v1.ar.prday_pct(:,1,:,:));p.z1=a-b;
a=squeeze(w1.ar.prday_fp99_from_id); b=squeeze(v1.ar.prday_fp99_from_id);p.z2=a-b;
a=squeeze(w1.tc.prday_fp99_from_id); b=squeeze(v1.tc.prday_fp99_from_id);p.z3=a-b;
a=squeeze(w1.td.prday_fp99_from_id); b=squeeze(v1.td.prday_fp99_from_id);p.z4=a-b;
a=squeeze(w1.mc.prday_fp99_from_id); b=squeeze(v1.mc.prday_fp99_from_id);p.z5=a-b;
a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3);  p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='\Delta 99 percentile of daily precip';
p.s2='\Delta fraction from AR'; 
p.s3='\Delta fraction from TS'; 
p.s4='\Delta fraction from TD'; 
p.s5='\Delta fraction from MCS';
p.s6='\Delta AVG (AR+TS+TD+MCS)'; p.s0='';
p.c1=[-10 10]; a=[-0.1 0.1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_fp999_from_id';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k';
a=squeeze(w1.ar.prday_pct(:,2,:,:));  b=squeeze(v1.ar.prday_pct(:,2,:,:));p.z1=a-b;
a=squeeze(w1.ar.prday_fp999_from_id); b=squeeze(v1.ar.prday_fp999_from_id);p.z2=a-b;
a=squeeze(w1.tc.prday_fp999_from_id); b=squeeze(v1.tc.prday_fp999_from_id);p.z3=a-b;
a=squeeze(w1.td.prday_fp999_from_id); b=squeeze(v1.td.prday_fp999_from_id);p.z4=a-b;
a=squeeze(w1.mc.prday_fp999_from_id); b=squeeze(v1.mc.prday_fp999_from_id);p.z5=a-b;
a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3);  p.z0=p.z6;
p=smoothp(p,5,5,'omitnan','shrink');
p.s1='\Delta 99.9 percentile of daily precip';
p.s2='\Delta fraction from AR'; 
p.s3='\Delta fraction from TS'; 
p.s4='\Delta fraction from TD'; 
p.s5='\Delta fraction from MCS';
p.s6='\Delta AVG (AR+TS+TD+MCS)'; p.s0='';
p.c1=[-20 20]; a=[-0.1 0.1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_idwei';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
p.z1=squeeze(w1.ar.prday_av   -v1.ar.prday_av)/dTs;
p.z2=squeeze(w1.ar.prday_idwei-v1.ar.prday_idwei)/dTs;   
p.z3=squeeze(w1.tc.prday_idwei-v1.tc.prday_idwei)/dTs;
p.z4=squeeze(w1.td.prday_idwei-v1.td.prday_idwei)/dTs;
p.z5=squeeze(w1.mc.prday_idwei-v1.mc.prday_idwei)/dTs;    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean precipitation';
p.s2='\Delta AR precipitation'; 
p.s3='\Delta TS precipitation'; 
p.s4='\Delta TD precipitation'; 
p.s5='\Delta MCS precipitation';
p.s6='\Delta SUM=AR+TS+TD+MCS precipitation'; p.s0='';
p.c1=[-0.4 0.4]; a=[-0.2 0.2]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=[-0.4 0.4]; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_idwei_frac';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
a0=squeeze(w1.ar.prday_av);    b0=squeeze(v1.ar.prday_av);    p.z1=(a0-b0)./b0/dTs*100;
a =squeeze(w1.ar.prday_idwei); b =squeeze(v1.ar.prday_idwei); p.z2=(a./a0-b./b0)*100;
a =squeeze(w1.tc.prday_idwei); b =squeeze(v1.tc.prday_idwei); p.z3=(a./a0-b./b0)*100;
a =squeeze(w1.td.prday_idwei); b =squeeze(v1.td.prday_idwei); p.z4=(a./a0-b./b0)*100;
a =squeeze(w1.mc.prday_idwei); b =squeeze(v1.mc.prday_idwei); p.z5=(a./a0-b./b0)*100;
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='percent change of annual mean P';
p.s2='\Delta fraction of P from AR'; 
p.s3='\Delta fraction of P from TS'; 
p.s4='\Delta fraction of P from TD'; 
p.s5='\Delta fraction of P from MCS';
p.s6='\Delta fraction of P from AR+TS+TD+MCS'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prday_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53; no=30;
a=squeeze(w1.ar.prday_av); b=squeeze(v1.ar.prday_av); p.z1=(a-b)./b/dTs*100;
v=v1.ar; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
v=w1.ar; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
v=w1.tc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
v=w1.td; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
v=w1.mc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean precipitation';
p.s2='\Delta AR mean precipitation'; 
p.s3='\Delta TS mean precipitation'; 
p.s4='\Delta TD mean precipitation'; 
p.s5='\Delta MCS mean precipitation';
p.s6='\Delta AVG (AR+TS+TD+MCS) precipitation'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prday_idavg_p99';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; I=1; no=30;
v=v1.ar; a1=squeeze(v.prday_pct(1,I,:,:)); %s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.prday_pct(1,I,:,:)); %s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum);
p.z1=(a2-a1)./a1/dTs*100; %[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;
v=v1.ar; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.ar; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.tc; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.td; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.mc; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6; %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='percent change of Pr 99 percentile (P99)';
p.s2='percent change of Pr for AR (Pr>=P99)'; 
p.s3='percent change of Pr for TS (Pr>=P99)'; 
p.s4='percent change of Pr for TD (Pr>=P99)'; 
p.s5='percent change of Pr for MSC (Pr>=P99)';
p.s6='percent change of Pr for ALL (Pr>=P99)'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prday_idavg_p999';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; no=1;
a=squeeze(w1.ar.prday_pct(1,2,:,:)); b=squeeze(v1.ar.prday_pct(1,2,:,:)); p.z1=(a-b)./a/dTs*100;
v=v1.ar; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
v=w1.ar; a2=squeeze(v.prday_idavg_p999); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
v=w1.tc; a2=squeeze(v.prday_idavg_p999); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
v=w1.td; a2=squeeze(v.prday_idavg_p999); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
v=w1.mc; a2=squeeze(v.prday_idavg_p999); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='percent change of P99.9';
p.s2='percent change of AR P>=P99.9'; 
p.s3='percent change of TS P>=P99.9'; 
p.s4='percent change of TD P>=P99.9'; 
p.s5='percent change of MSC P>=P99.9';
p.s6='percent change of ALL P>=P99.9'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%delta_w500%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_w500_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53; no=30;
a=squeeze(w1.ar.w500_av); b=squeeze(v1.ar.w500_av); p.z1=(a-b)./b/dTs*100;
v=v1.ar; a1=squeeze(v.w500_idavg); s1=squeeze(v.w500_idstd); n1=squeeze(v.id_sum); 
v=w1.ar; a2=squeeze(v.w500_idavg); s2=squeeze(v.w500_idstd); n2=squeeze(v.id_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.w500_idavg); s1=squeeze(v.w500_idstd); n1=squeeze(v.id_sum); 
v=w1.tc; a2=squeeze(v.w500_idavg); s2=squeeze(v.w500_idstd); n2=squeeze(v.id_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.w500_idavg); s1=squeeze(v.w500_idstd); n1=squeeze(v.id_sum); 
v=w1.td; a2=squeeze(v.w500_idavg); s2=squeeze(v.w500_idstd); n2=squeeze(v.id_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.w500_idavg); s1=squeeze(v.w500_idstd); n1=squeeze(v.id_sum); 
v=w1.mc; a2=squeeze(v.w500_idavg); s2=squeeze(v.w500_idstd); n2=squeeze(v.id_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean 500hPa omega';
p.s2='\Delta AR mean 500hPa omega'; 
p.s3='\Delta TS mean 500hPa omega'; 
p.s4='\Delta TD mean 500hPa omega'; 
p.s5='\Delta MCS mean 500hPa omega';
p.s6='\Delta AVG (AR+TS+TD+MCS) 500hPa omega'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_w500_idavg_p99';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; I=1; no=10;
v=v1.ar; a1=squeeze(v.prday_pct(1,I,:,:)); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum);
v=w1.ar; a2=squeeze(v.prday_pct(1,I,:,:)); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum);
[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;%p.z1=(a2-a1)./a1/dTs*100;
v=v1.ar; a1=squeeze(v.w500_idavg_p99); s1=squeeze(v.w500_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.ar; a2=squeeze(v.w500_idavg_p99); s2=squeeze(v.w500_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.w500_idavg_p99); s1=squeeze(v.w500_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.tc; a2=squeeze(v.w500_idavg_p99); s2=squeeze(v.w500_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.w500_idavg_p99); s1=squeeze(v.w500_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.td; a2=squeeze(v.w500_idavg_p99); s2=squeeze(v.w500_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.w500_idavg_p99); s1=squeeze(v.w500_idstd_p99); n1=squeeze(v.id99_sum); 
v=w1.mc; a2=squeeze(v.w500_idavg_p99); s2=squeeze(v.w500_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6; %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='percent change in Pr 99 percentile (P99)';
p.s2='percent change in \omega_{500} for AR (Pr>=P99)'; 
p.s3='percent change in \omega_{500} for TS (Pr>=P99)'; 
p.s4='percent change in \omega_{500} for TD (Pr>=P99)'; 
p.s5='percent change in \omega_{500} for MSC (Pr>=P99)';
p.s6='percent change in \omega_{500} for ALL (Pr>=P99)'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_w500_idavg_p999';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; no=5;
v=v1.ar; a1=squeeze(v.prday_pct(1,2,:,:)); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum);
v=w1.ar; a2=squeeze(v.prday_pct(1,2,:,:)); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum);
[p.z1,p.e1,p.pd1]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z1=p.pd1/dTs;%p.z1=(a2-a1)./a1/dTs*100;
v=v1.ar; a1=squeeze(v.w500_idavg_p999); s1=squeeze(v.w500_idstd_p999); n1=squeeze(v.id999_sum); 
v=w1.ar; a2=squeeze(v.w500_idavg_p999); s2=squeeze(v.w500_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.w500_idavg_p999); s1=squeeze(v.w500_idstd_p999); n1=squeeze(v.id999_sum); 
v=w1.tc; a2=squeeze(v.w500_idavg_p999); s2=squeeze(v.w500_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.w500_idavg_p999); s1=squeeze(v.w500_idstd_p999); n1=squeeze(v.id999_sum); 
v=w1.td; a2=squeeze(v.w500_idavg_p999); s2=squeeze(v.w500_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.w500_idavg_p999); s1=squeeze(v.w500_idstd_p999); n1=squeeze(v.id999_sum); 
v=w1.mc; a2=squeeze(v.w500_idavg_p999); s2=squeeze(v.w500_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6; %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='percent change in Prec 99.9 percentile (P99.9)';
p.s2='percent change in \omega_{500} for AR (P>=P99.9)'; 
p.s3='percent change in \omega_{500} for TS (P>=P99.9)'; 
p.s4='percent change in \omega_{500} for TD (P>=P99.9)'; 
p.s5='percent change in \omega_{500} for MSC (P>=P99.9)';
p.s6='percent change in \omega_{500} for ALL (P>=P99.9)'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%delta LWCF%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_lwcf_idwei';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
a =squeeze(w1.ar.lwcf_av);    b =squeeze(v1.ar.lwcf_av);    p.z1=(a-b)/dTs;
a =squeeze(w1.ar.lwcf_idwei); b =squeeze(v1.ar.lwcf_idwei); p.z2=(a-b)/dTs;
a =squeeze(w1.tc.lwcf_idwei); b =squeeze(v1.tc.lwcf_idwei); p.z3=(a-b)/dTs;
a =squeeze(w1.td.lwcf_idwei); b =squeeze(v1.td.lwcf_idwei); p.z4=(a-b)/dTs;
a =squeeze(w1.mc.lwcf_idwei); b =squeeze(v1.mc.lwcf_idwei); p.z5=(a-b)/dTs;
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean LW CRE';
p.s2='\Delta AR LW CRE'; 
p.s3='\Delta TS LW CRE'; 
p.s4='\Delta TD LW CRE'; 
p.s5='\Delta MCS LW CRE';
p.s6='\Delta LW CRE from AR+TS+TD+MCS'; p.s0='';
p.c1=[-1 1]; a=[-1 1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_lwcf_idwei_frac';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
a0=squeeze(w1.ar.lwcf_av);    b0=squeeze(v1.ar.lwcf_av);    p.z1=(a0-b0)/dTs;
a =squeeze(w1.ar.lwcf_idwei); b =squeeze(v1.ar.lwcf_idwei); p.z2=(a-b)./(a0-b0);
a =squeeze(w1.tc.lwcf_idwei); b =squeeze(v1.tc.lwcf_idwei); p.z3=(a-b)./(a0-b0);
a =squeeze(w1.td.lwcf_idwei); b =squeeze(v1.td.lwcf_idwei); p.z4=(a-b)./(a0-b0);
a =squeeze(w1.mc.lwcf_idwei); b =squeeze(v1.mc.lwcf_idwei); p.z5=(a-b)./(a0-b0);
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean LW CRE';
p.s2='\Delta AR LW CRE'; 
p.s3='\Delta TS LW CRE'; 
p.s4='\Delta TD LW CRE'; 
p.s5='\Delta MCS LW CRE';
p.s6='\Delta LW CRE from AR+TS+TD+MCS'; p.s0='';
p.c1=[-1 1]; a=[-1 1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_per_K_lwcf_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53; no=30;
a2=squeeze(w1.ar.lwcf_av); a1=squeeze(v1.ar.lwcf_av); p.z1=(a2-a1)/dTs;
v=v1.ar; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum);%n1=squeeze(v.frqday);
v=w1.ar; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum);%n2=squeeze(v.frqday);
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.z2/dTs;
v=v1.tc; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum);%n1=squeeze(v.frqday);
v=w1.tc; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum);%n2=squeeze(v.frqday);
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.z3/dTs;
v=v1.td; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum);%n1=squeeze(v.frqday);
v=w1.td; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum);%n2=squeeze(v.frqday);
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.z4/dTs;
v=v1.mc; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum);%n1=squeeze(v.frqday);
v=w1.mc; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum);%n2=squeeze(v.frqday);
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.z5/dTs;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean LW CRE';
p.s2='\Delta AR mean LW CRE'; 
p.s3='\Delta TS mean LW CRE'; 
p.s4='\Delta TD mean LW CRE'; 
p.s5='\Delta MCS mean LW CRE';
p.s6='\Delta AVG (AR+TS+TD+MCS) LW CRE'; p.s0='';
p.c1=[-1 1]; a=[-2 2]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_per_K_lwcf_nonid_avg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53; no=30; N=365*100;
a2=squeeze(w1.ar.lwcf_av); a1=squeeze(v1.ar.lwcf_av); p.z1=(a2-a1)/dTs;
v=v1.ar; a1=squeeze(v.lwcf_nonid_avg); s1=squeeze(v.lwcf_nonid_std); n1=squeeze(N-v.id_sum);%n1=squeeze(v.frqday);
v=w1.ar; a2=squeeze(v.lwcf_nonid_avg); s2=squeeze(v.lwcf_nonid_std); n2=squeeze(N-v.id_sum);%n2=squeeze(v.frqday);
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.z2/dTs;
v=v1.tc; a1=squeeze(v.lwcf_nonid_avg); s1=squeeze(v.lwcf_nonid_std); n1=squeeze(N-v.id_sum);%n1=squeeze(v.frqday);
v=w1.tc; a2=squeeze(v.lwcf_nonid_avg); s2=squeeze(v.lwcf_nonid_std); n2=squeeze(N-v.id_sum);%n2=squeeze(v.frqday);
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.z3/dTs;
v=v1.td; a1=squeeze(v.lwcf_nonid_avg); s1=squeeze(v.lwcf_nonid_std); n1=squeeze(N-v.id_sum);%n1=squeeze(v.frqday);
v=w1.td; a2=squeeze(v.lwcf_nonid_avg); s2=squeeze(v.lwcf_nonid_std); n2=squeeze(N-v.id_sum);%n2=squeeze(v.frqday);
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.z4/dTs;
v=v1.mc; a1=squeeze(v.lwcf_nonid_avg); s1=squeeze(v.lwcf_nonid_std); n1=squeeze(N-v.id_sum);%n1=squeeze(v.frqday);
v=w1.mc; a2=squeeze(v.lwcf_nonid_avg); s2=squeeze(v.lwcf_nonid_std); n2=squeeze(N-v.id_sum);%n2=squeeze(v.frqday);
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.z5/dTs;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean LW CRE';
p.s2='\Delta non-AR mean LW CRE'; 
p.s3='\Delta non-TS mean LW CRE'; 
p.s4='\Delta non-TD mean LW CRE'; 
p.s5='\Delta non-MCS mean LW CRE';
p.s6='\Delta AVG non-(AR+TS+TD+MCS) LW CRE'; p.s0='';
p.c1=[-1 1]; a=[-2 2]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%delta SWCF%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_swcf_idwei';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
a =squeeze(w1.ar.swcf_av);    b =squeeze(v1.ar.swcf_av);    p.z1=(a-b)/dTs;
a =squeeze(w1.ar.swcf_idwei); b =squeeze(v1.ar.swcf_idwei); p.z2=(a-b)/dTs;
a =squeeze(w1.tc.swcf_idwei); b =squeeze(v1.tc.swcf_idwei); p.z3=(a-b)/dTs;
a =squeeze(w1.td.swcf_idwei); b =squeeze(v1.td.swcf_idwei); p.z4=(a-b)/dTs;
a =squeeze(w1.mc.swcf_idwei); b =squeeze(v1.mc.swcf_idwei); p.z5=(a-b)/dTs;
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean SW CRE';
p.s2='\Delta AR SW CRE'; 
p.s3='\Delta TS SW CRE'; 
p.s4='\Delta TD SW CRE'; 
p.s5='\Delta MCS SW CRE';
p.s6='\Delta SW CRE from AR+TS+TD+MCS'; p.s0='';
p.c1=[-1 1]; a=[-1 1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_swcf_idwei_frac';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
a0=squeeze(w1.ar.swcf_av);    b0=squeeze(v1.ar.swcf_av);    p.z1=(a0-b0)/dTs;
a =squeeze(w1.ar.swcf_idwei); b =squeeze(v1.ar.swcf_idwei); p.z2=(a-b)./(a0-b0);
a =squeeze(w1.tc.swcf_idwei); b =squeeze(v1.tc.swcf_idwei); p.z3=(a-b)./(a0-b0);
a =squeeze(w1.td.swcf_idwei); b =squeeze(v1.td.swcf_idwei); p.z4=(a-b)./(a0-b0);
a =squeeze(w1.mc.swcf_idwei); b =squeeze(v1.mc.swcf_idwei); p.z5=(a-b)./(a0-b0);
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean SW CRE';
p.s2='\Delta AR SW CRE'; 
p.s3='\Delta TS SW CRE'; 
p.s4='\Delta TD SW CRE'; 
p.s5='\Delta MCS SW CRE';
p.s6='\Delta SW CRE from AR+TS+TD+MCS'; p.s0='';
p.c1=[-1 1]; a=[-1 1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_per_K_swcf_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53; no=30;
a2=squeeze(w1.ar.swcf_av); a1=squeeze(v1.ar.swcf_av); p.z1=(a2-a1)/dTs;
v=v1.ar; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum);%n1=squeeze(v.frqday);
v=w1.ar; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum);%n2=squeeze(v.frqday);
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.z2/dTs;
v=v1.tc; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum);%n1=squeeze(v.frqday);
v=w1.tc; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum);%n2=squeeze(v.frqday);
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.z3/dTs;
v=v1.td; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum);%n1=squeeze(v.frqday);
v=w1.td; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum);%n2=squeeze(v.frqday);
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.z4/dTs;
v=v1.mc; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum);%n1=squeeze(v.frqday);
v=w1.mc; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum);%n2=squeeze(v.frqday);
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.z5/dTs;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean SW CRE';
p.s2='\Delta AR mean SW CRE'; 
p.s3='\Delta TS mean SW CRE'; 
p.s4='\Delta TD mean SW CRE'; 
p.s5='\Delta MCS mean SW CRE';
p.s6='\Delta AVG (AR+TS+TD+MCS) SW CRE'; p.s0='';
p.c1=[-1 1]; a=[-2 2]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_per_K_swcf_nonid_avg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53; no=30; N=v.nyr*365
a2=squeeze(w1.ar.swcf_av); a1=squeeze(v1.ar.swcf_av); p.z1=(a2-a1)/dTs;
v=v1.ar; a1=squeeze(v.swcf_nonid_avg); s1=squeeze(v.swcf_nonid_std); n1=N-squeeze(v.id_sum);
v=w1.ar; a2=squeeze(v.swcf_nonid_avg); s2=squeeze(v.swcf_nonid_std); n2=N-squeeze(v.id_sum);
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.z2/dTs;
v=v1.tc; a1=squeeze(v.swcf_nonid_avg); s1=squeeze(v.swcf_nonid_std); n1=N-squeeze(v.id_sum);
v=w1.tc; a2=squeeze(v.swcf_nonid_avg); s2=squeeze(v.swcf_nonid_std); n2=N-squeeze(v.id_sum);
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.z3/dTs;
v=v1.td; a1=squeeze(v.swcf_nonid_avg); s1=squeeze(v.swcf_nonid_std); n1=N-squeeze(v.id_sum);
v=w1.td; a2=squeeze(v.swcf_nonid_avg); s2=squeeze(v.swcf_nonid_std); n2=N-squeeze(v.id_sum);
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.z4/dTs;
v=v1.mc; a1=squeeze(v.swcf_nonid_avg); s1=squeeze(v.swcf_nonid_std); n1=N-squeeze(v.id_sum);
v=w1.mc; a2=squeeze(v.swcf_nonid_avg); s2=squeeze(v.swcf_nonid_std); n2=N-squeeze(v.id_sum);
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.z5/dTs;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean SW CRE';
p.s2='\Delta AR mean SW CRE'; 
p.s3='\Delta TS mean SW CRE'; 
p.s4='\Delta TD mean SW CRE'; 
p.s5='\Delta MCS mean SW CRE';
p.s6='\Delta AVG (AR+TS+TD+MCS) SW CRE'; p.s0='';
p.c1=[-1 1]; a=[-2 2]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TAS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_per_K_tas_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53; no=1;
a2=squeeze(w1.ar.tas_av); a1=squeeze(v1.ar.tas_av); p.z1=(a2-a1)/dTs;
v=v1.ar; a1=squeeze(v.tas_idavg); s1=squeeze(v.tas_idstd); n1=squeeze(v.id_sum);%n1=squeeze(v.frqday);
v=w1.ar; a2=squeeze(v.tas_idavg); s2=squeeze(v.tas_idstd); n2=squeeze(v.id_sum);%n2=squeeze(v.frqday);
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.z2/dTs;
v=v1.tc; a1=squeeze(v.tas_idavg); s1=squeeze(v.tas_idstd); n1=squeeze(v.id_sum);%n1=squeeze(v.frqday);
v=w1.tc; a2=squeeze(v.tas_idavg); s2=squeeze(v.tas_idstd); n2=squeeze(v.id_sum);%n2=squeeze(v.frqday);
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.z3/dTs;
v=v1.td; a1=squeeze(v.tas_idavg); s1=squeeze(v.tas_idstd); n1=squeeze(v.id_sum);%n1=squeeze(v.frqday);
v=w1.td; a2=squeeze(v.tas_idavg); s2=squeeze(v.tas_idstd); n2=squeeze(v.id_sum);%n2=squeeze(v.frqday);
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.z4/dTs;
v=v1.mc; a1=squeeze(v.tas_idavg); s1=squeeze(v.tas_idstd); n1=squeeze(v.id_sum);%n1=squeeze(v.frqday);
v=w1.mc; a2=squeeze(v.tas_idavg); s2=squeeze(v.tas_idstd); n2=squeeze(v.id_sum);%n2=squeeze(v.frqday);
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.z5/dTs;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean SW CRE';
p.s2='\Delta AR mean SW CRE'; 
p.s3='\Delta TS mean SW CRE'; 
p.s4='\Delta TD mean SW CRE'; 
p.s5='\Delta MCS mean SW CRE';
p.s6='\Delta AVG (AR+TS+TD+MCS) SW CRE'; p.s0='';
p.c1=[-1.5 1.5]; a=[-1.5 1.5]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: P4K_4xCO2 minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_idwei';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
p.z1=squeeze(w2.ar.prday_av   -v1.ar.prday_av)/dTs;
p.z2=squeeze(w2.ar.prday_idwei-v1.ar.prday_idwei)/dTs;   
p.z3=squeeze(w2.tc.prday_idwei-v1.tc.prday_idwei)/dTs;
p.z4=squeeze(w2.td.prday_idwei-v1.td.prday_idwei)/dTs;
p.z5=squeeze(w2.mc.prday_idwei-v1.mc.prday_idwei)/dTs;    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean precipitation';
p.s2='\Delta AR precipitation'; 
p.s3='\Delta TS precipitation'; 
p.s4='\Delta TD precipitation'; 
p.s5='\Delta MCS precipitation';
p.s6='\Delta SUM=AR+TS+TD+MCS precipitation'; p.s0='';
p.c1=[-0.4 0.4]; a=[-0.2 0.2]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=[-0.4 0.4]; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_idwei_frac';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
a0=squeeze(w2.ar.prday_av);    b0=squeeze(v1.ar.prday_av);    p.z1=(a0-b0)./b0/dTs*100;
a =squeeze(w2.ar.prday_idwei); b =squeeze(v1.ar.prday_idwei); p.z2=(a./a0-b./b0)*100;
a =squeeze(w2.tc.prday_idwei); b =squeeze(v1.tc.prday_idwei); p.z3=(a./a0-b./b0)*100;
a =squeeze(w2.td.prday_idwei); b =squeeze(v1.td.prday_idwei); p.z4=(a./a0-b./b0)*100;
a =squeeze(w2.mc.prday_idwei); b =squeeze(v1.mc.prday_idwei); p.z5=(a./a0-b./b0)*100;
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='percent change of annual mean P';
p.s2='\Delta fraction of P from AR'; 
p.s3='\Delta fraction of P from TS'; 
p.s4='\Delta fraction of P from TD'; 
p.s5='\Delta fraction of P from MCS';
p.s6='\Delta fraction of P from AR+TS+TD+MCS'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_frqday';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-0.1: 0.005: 0.1]; p.opt=2; p.nn=64; p.c='k';
p.z1=squeeze(w2.ar.prday_fqwet(1,:,:,2) - v1.ar.prday_fqwet(1,:,:,2));
p.z2=squeeze(w2.ar.frqday - v1.ar.frqday);
p.z3=squeeze(w2.tc.frqday - v1.tc.frqday);
p.z4=squeeze(w2.td.frqday - v1.td.frqday);
p.z5=squeeze(w2.mc.frqday - v1.mc.frqday);    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='\Delta frequency of wet day';
p.s2='\Delta frequency of AR days'; 
p.s3='\Delta frequency of TS days'; 
p.s4='\Delta frequency of TD days'; 
p.s5='\Delta frequency of MCS days';
p.s6='\Delta SUM=AR+TS+TD+MCS days'; p.s0='';
p.c1=[-0.1 0.1]; a=[-0.04 0.04]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_fp99_from_id';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k';
a=squeeze(w2.ar.prday_pct(:,1,:,:)); b=squeeze(v1.ar.prday_pct(:,1,:,:));p.z1=a-b;
a=squeeze(w2.ar.prday_fp99_from_id); b=squeeze(v1.ar.prday_fp99_from_id);p.z2=a-b;
a=squeeze(w2.tc.prday_fp99_from_id); b=squeeze(v1.tc.prday_fp99_from_id);p.z3=a-b;
a=squeeze(w2.td.prday_fp99_from_id); b=squeeze(v1.td.prday_fp99_from_id);p.z4=a-b;
a=squeeze(w2.mc.prday_fp99_from_id); b=squeeze(v1.mc.prday_fp99_from_id);p.z5=a-b;
a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3);  p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='\Delta 99 percentile of daily precip';
p.s2='\Delta fraction from AR'; 
p.s3='\Delta fraction from TS'; 
p.s4='\Delta fraction from TD'; 
p.s5='\Delta fraction from MCS';
p.s6='\Delta AVG (AR+TS+TD+MCS)'; p.s0='';
p.c1=[-10 10]; a=[-0.1 0.1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_fp999_from_id';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k';
a=squeeze(w2.ar.prday_pct(:,2,:,:));  b=squeeze(v1.ar.prday_pct(:,2,:,:));p.z1=a-b;
a=squeeze(w2.ar.prday_fp999_from_id); b=squeeze(v1.ar.prday_fp999_from_id);p.z2=a-b;
a=squeeze(w2.tc.prday_fp999_from_id); b=squeeze(v1.tc.prday_fp999_from_id);p.z3=a-b;
a=squeeze(w2.td.prday_fp999_from_id); b=squeeze(v1.td.prday_fp999_from_id);p.z4=a-b;
a=squeeze(w2.mc.prday_fp999_from_id); b=squeeze(v1.mc.prday_fp999_from_id);p.z5=a-b;
a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3);  p.z0=p.z6;
p=smoothp(p,5,5,'omitnan','shrink');
p.s1='\Delta 99.9 percentile of daily precip';
p.s2='\Delta fraction from AR'; 
p.s3='\Delta fraction from TS'; 
p.s4='\Delta fraction from TD'; 
p.s5='\Delta fraction from MCS';
p.s6='\Delta AVG (AR+TS+TD+MCS)'; p.s0='';
p.c1=[-20 20]; a=[-0.1 0.1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prday_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53; no=30;
a=squeeze(w2.ar.prday_av); b=squeeze(v1.ar.prday_av); p.z1=(a-b)./b/dTs*100;
v=v1.ar; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
v=w2.ar; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
v=w2.tc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
v=w2.td; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
v=w2.mc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean precipitation';
p.s2='\Delta AR mean precipitation'; 
p.s3='\Delta TS mean precipitation'; 
p.s4='\Delta TD mean precipitation'; 
p.s5='\Delta MCS mean precipitation';
p.s6='\Delta AVG (AR+TS+TD+MCS) precipitation'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prday_idavg_p99';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; no=10;
a=squeeze(w2.ar.prday_pct(1,1,:,:)); b=squeeze(v1.ar.prday_pct(1,1,:,:)); p.z1=(a-b)./a/dTs*100;
v=v1.ar; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=w2.ar; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=w2.tc; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=w2.td; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=w2.mc; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='percent change of P99';
p.s2='percent change of AR P>=P99'; 
p.s3='percent change of TS P>=P99'; 
p.s4='percent change of TD P>=P99'; 
p.s5='percent change of MSC P>=P99';
p.s6='percent change of ALL P>=P99'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='p4K_4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prday_idavg_p999';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; no=1;
a=squeeze(w2.ar.prday_pct(1,2,:,:)); b=squeeze(v1.ar.prday_pct(1,2,:,:)); p.z1=(a-b)./a/dTs*100;
v=v1.ar; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
v=w2.ar; a2=squeeze(v.prday_idavg_p999); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
v=w2.tc; a2=squeeze(v.prday_idavg_p999); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
v=w2.td; a2=squeeze(v.prday_idavg_p999); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
v=w2.mc; a2=squeeze(v.prday_idavg_p999); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='percent change of P99.9';
p.s2='percent change of AR P>=P99.9'; 
p.s3='percent change of TS P>=P99.9'; 
p.s4='percent change of TD P>=P99.9'; 
p.s5='percent change of MSC P>=P99.9';
p.s6='percent change of ALL P>=P99.9'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: 4xCO2 minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_idwei';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
p.z1=squeeze(c1.ar.prday_av   -v1.ar.prday_av)/dTs;
p.z2=squeeze(c1.ar.prday_idwei-v1.ar.prday_idwei)/dTs;   
p.z3=squeeze(c1.tc.prday_idwei-v1.tc.prday_idwei)/dTs;
p.z4=squeeze(c1.td.prday_idwei-v1.td.prday_idwei)/dTs;
p.z5=squeeze(c1.mc.prday_idwei-v1.mc.prday_idwei)/dTs;    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean precipitation';
p.s2='\Delta AR precipitation'; 
p.s3='\Delta TS precipitation'; 
p.s4='\Delta TD precipitation'; 
p.s5='\Delta MCS precipitation';
p.s6='\Delta SUM=AR+TS+TD+MCS precipitation'; p.s0='';
p.c1=[-0.4 0.4]; a=[-0.2 0.2]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=[-0.4 0.4]; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_idwei_frac';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
a0=squeeze(c1.ar.prday_av);    b0=squeeze(v1.ar.prday_av);    p.z1=(a0-b0)./b0/dTs*100;
a =squeeze(c1.ar.prday_idwei); b =squeeze(v1.ar.prday_idwei); p.z2=(a./a0-b./b0)*100;
a =squeeze(c1.tc.prday_idwei); b =squeeze(v1.tc.prday_idwei); p.z3=(a./a0-b./b0)*100;
a =squeeze(c1.td.prday_idwei); b =squeeze(v1.td.prday_idwei); p.z4=(a./a0-b./b0)*100;
a =squeeze(c1.mc.prday_idwei); b =squeeze(v1.mc.prday_idwei); p.z5=(a./a0-b./b0)*100;
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='percent change of annual mean P';
p.s2='\Delta fraction of P from AR'; 
p.s3='\Delta fraction of P from TS'; 
p.s4='\Delta fraction of P from TD'; 
p.s5='\Delta fraction of P from MCS';
p.s6='\Delta fraction of P from AR+TS+TD+MCS'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_frqday';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-0.1: 0.005: 0.1]; p.opt=2; p.nn=64; p.c='k';
p.z1=squeeze(c1.ar.prday_fqwet(1,:,:,2) - v1.ar.prday_fqwet(1,:,:,2));
p.z2=squeeze(c1.ar.frqday - v1.ar.frqday);
p.z3=squeeze(c1.tc.frqday - v1.tc.frqday);
p.z4=squeeze(c1.td.frqday - v1.td.frqday);
p.z5=squeeze(c1.mc.frqday - v1.mc.frqday);    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta frequency of wet day';
p.s2='\Delta frequency of AR days'; 
p.s3='\Delta frequency of TS days'; 
p.s4='\Delta frequency of TD days'; 
p.s5='\Delta frequency of MCS days';
p.s6='\Delta SUM=AR+TS+TD+MCS days'; p.s0='';
p.c1=[-0.1 0.1]; a=[-0.04 0.04]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_fp99_from_id';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k';
a=squeeze(c1.ar.prday_pct(:,1,:,:)); b=squeeze(v1.ar.prday_pct(:,1,:,:));p.z1=a-b;
a=squeeze(c1.ar.prday_fp99_from_id); b=squeeze(v1.ar.prday_fp99_from_id);p.z2=a-b;
a=squeeze(c1.tc.prday_fp99_from_id); b=squeeze(v1.tc.prday_fp99_from_id);p.z3=a-b;
a=squeeze(c1.td.prday_fp99_from_id); b=squeeze(v1.td.prday_fp99_from_id);p.z4=a-b;
a=squeeze(c1.mc.prday_fp99_from_id); b=squeeze(v1.mc.prday_fp99_from_id);p.z5=a-b;
a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3);  p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='\Delta 99 percentile of daily precip';
p.s2='\Delta fraction from AR'; 
p.s3='\Delta fraction from TS'; 
p.s4='\Delta fraction from TD'; 
p.s5='\Delta fraction from MCS';
p.s6='\Delta AVG (AR+TS+TD+MCS)'; p.s0='';
p.c1=[-10 10]; a=[-0.1 0.1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_fp999_from_id';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k';
a=squeeze(c1.ar.prday_pct(:,2,:,:));  b=squeeze(v1.ar.prday_pct(:,2,:,:));p.z1=a-b;
a=squeeze(c1.ar.prday_fp999_from_id); b=squeeze(v1.ar.prday_fp999_from_id);p.z2=a-b;
a=squeeze(c1.tc.prday_fp999_from_id); b=squeeze(v1.tc.prday_fp999_from_id);p.z3=a-b;
a=squeeze(c1.td.prday_fp999_from_id); b=squeeze(v1.td.prday_fp999_from_id);p.z4=a-b;
a=squeeze(c1.mc.prday_fp999_from_id); b=squeeze(v1.mc.prday_fp999_from_id);p.z5=a-b;
a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3);  p.z0=p.z6;
p=smoothp(p,5,5,'omitnan','shrink');
p.s1='\Delta 99.9 percentile of daily precip';
p.s2='\Delta fraction from AR'; 
p.s3='\Delta fraction from TS'; 
p.s4='\Delta fraction from TD'; 
p.s5='\Delta fraction from MCS';
p.s6='\Delta AVG (AR+TS+TD+MCS)'; p.s0='';
p.c1=[-20 20]; a=[-0.1 0.1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar;  p.expn='4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prday_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53; no=30;
a=squeeze(c1.ar.prday_av); b=squeeze(v1.ar.prday_av); p.z1=(a-b)./b/dTs*100;
v=v1.ar; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
v=c1.ar; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
v=c1.tc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
v=c1.td; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
v=c1.mc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean precipitation';
p.s2='\Delta AR mean precipitation'; 
p.s3='\Delta TS mean precipitation'; 
p.s4='\Delta TD mean precipitation'; 
p.s5='\Delta MCS mean precipitation';
p.s6='\Delta AVG (AR+TS+TD+MCS) precipitation'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar;  p.expn='4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prday_idavg_p99';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; no=30;
a=squeeze(c1.ar.prday_pct(1,1,:,:)); b=squeeze(v1.ar.prday_pct(1,1,:,:)); p.z1=(a-b)./a/dTs*100;
v=v1.ar; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=c1.ar; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=c1.tc; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=c1.td; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=c1.mc; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='percent change of P99';
p.s2='percent change of AR P>=P99'; 
p.s3='percent change of TS P>=P99'; 
p.s4='percent change of TD P>=P99'; 
p.s5='percent change of MSC P>=P99';
p.s6='percent change of ALL P>=P99'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar;  p.expn='4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prday_idavg_p999';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; no=1;
a=squeeze(c1.ar.prday_pct(1,2,:,:)); b=squeeze(v1.ar.prday_pct(1,2,:,:)); p.z1=(a-b)./a/dTs*100;
v=v1.ar; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
v=c1.ar; a2=squeeze(v.prday_idavg_p999); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
v=c1.tc; a2=squeeze(v.prday_idavg_p999); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
v=c1.td; a2=squeeze(v.prday_idavg_p999); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
v=c1.mc; a2=squeeze(v.prday_idavg_p999); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,5,5,'omitnan','shrink');
p.s1='percent change of P99.9';
p.s2='percent change of AR P>=P99.9'; 
p.s3='percent change of TS P>=P99.9'; 
p.s4='percent change of TD P>=P99.9'; 
p.s5='percent change of MSC P>=P99.9';
p.s6='percent change of ALL P>=P99.9'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: warm_4xCO2 minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='warm_4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_idwei';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
p.z1=squeeze(w3.ar.prday_av   -v1.ar.prday_av)/dTs;
p.z2=squeeze(w3.ar.prday_idwei-v1.ar.prday_idwei)/dTs;   
p.z3=squeeze(w3.tc.prday_idwei-v1.tc.prday_idwei)/dTs;
p.z4=squeeze(w3.td.prday_idwei-v1.td.prday_idwei)/dTs;
p.z5=squeeze(w3.mc.prday_idwei-v1.mc.prday_idwei)/dTs;    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean precipitation';
p.s2='\Delta AR precipitation'; 
p.s3='\Delta TS precipitation'; 
p.s4='\Delta TD precipitation'; 
p.s5='\Delta MCS precipitation';
p.s6='\Delta SUM=AR+TS+TD+MCS precipitation'; p.s0='';
p.c1=[-0.4 0.4]; a=[-0.2 0.2]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=[-0.4 0.4]; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='warm_4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_idwei_frac';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53;
a0=squeeze(w3.ar.prday_av);    b0=squeeze(v1.ar.prday_av);    p.z1=(a0-b0)./b0/dTs*100;
a =squeeze(w3.ar.prday_idwei); b =squeeze(v1.ar.prday_idwei); p.z2=(a./a0-b./b0)*100;
a =squeeze(w3.tc.prday_idwei); b =squeeze(v1.tc.prday_idwei); p.z3=(a./a0-b./b0)*100;
a =squeeze(w3.td.prday_idwei); b =squeeze(v1.td.prday_idwei); p.z4=(a./a0-b./b0)*100;
a =squeeze(w3.mc.prday_idwei); b =squeeze(v1.mc.prday_idwei); p.z5=(a./a0-b./b0)*100;
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='percent change of annual mean P';
p.s2='\Delta fraction of P from AR'; 
p.s3='\Delta fraction of P from TS'; 
p.s4='\Delta fraction of P from TD'; 
p.s5='\Delta fraction of P from MCS';
p.s6='\Delta fraction of P from AR+TS+TD+MCS'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a; 
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='warm_4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_frqday';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-0.1: 0.005: 0.1]; p.opt=2; p.nn=64; p.c='k';
p.z1=squeeze(w3.ar.prday_fqwet(1,:,:,2) - v1.ar.prday_fqwet(1,:,:,2));
p.z2=squeeze(w3.ar.frqday - v1.ar.frqday);
p.z3=squeeze(w3.tc.frqday - v1.tc.frqday);
p.z4=squeeze(w3.td.frqday - v1.td.frqday);
p.z5=squeeze(w3.mc.frqday - v1.mc.frqday);    
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='\Delta frequency of wet day';
p.s2='\Delta frequency of AR days'; 
p.s3='\Delta frequency of TS days'; 
p.s4='\Delta frequency of TD days'; 
p.s5='\Delta frequency of MCS days';
p.s6='\Delta SUM=AR+TS+TD+MCS days'; p.s0='';
p.c1=[-0.1 0.1]; a=[-0.04 0.04]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='warm_4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_fp99_from_id';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k';
a=squeeze(w3.ar.prday_pct(:,1,:,:)); b=squeeze(v1.ar.prday_pct(:,1,:,:));p.z1=a-b;
a=squeeze(w3.ar.prday_fp99_from_id); b=squeeze(v1.ar.prday_fp99_from_id);p.z2=a-b;
a=squeeze(w3.tc.prday_fp99_from_id); b=squeeze(v1.tc.prday_fp99_from_id);p.z3=a-b;
a=squeeze(w3.td.prday_fp99_from_id); b=squeeze(v1.td.prday_fp99_from_id);p.z4=a-b;
a=squeeze(w3.mc.prday_fp99_from_id); b=squeeze(v1.mc.prday_fp99_from_id);p.z5=a-b;
a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3);  p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='\Delta 99 percentile of daily precip';
p.s2='\Delta fraction from AR'; 
p.s3='\Delta fraction from TS'; 
p.s4='\Delta fraction from TD'; 
p.s5='\Delta fraction from MCS';
p.s6='\Delta AVG (AR+TS+TD+MCS)'; p.s0='';
p.c1=[-10 10]; a=[-0.1 0.1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='warm_4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='del_prday_fp999_from_id';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-1:0.01:1]; p.opt=2; p.nn=64; p.c='k';
a=squeeze(w3.ar.prday_pct(:,2,:,:));  b=squeeze(v1.ar.prday_pct(:,2,:,:));p.z1=a-b;
a=squeeze(w3.ar.prday_fp999_from_id); b=squeeze(v1.ar.prday_fp999_from_id);p.z2=a-b;
a=squeeze(w3.tc.prday_fp999_from_id); b=squeeze(v1.tc.prday_fp999_from_id);p.z3=a-b;
a=squeeze(w3.td.prday_fp999_from_id); b=squeeze(v1.td.prday_fp999_from_id);p.z4=a-b;
a=squeeze(w3.mc.prday_fp999_from_id); b=squeeze(v1.mc.prday_fp999_from_id);p.z5=a-b;
a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3);  p.z0=p.z6;
p=smoothp(p,5,5,'omitnan','shrink');
p.s1='\Delta 99.9 percentile of daily precip';
p.s2='\Delta fraction from AR'; 
p.s3='\Delta fraction from TS'; 
p.s4='\Delta fraction from TD'; 
p.s5='\Delta fraction from MCS';
p.s6='\Delta AVG (AR+TS+TD+MCS)'; p.s0='';
p.c1=[-20 20]; a=[-0.1 0.1]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='warm_4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prday_idavg';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-4:0.04:4]; p.opt=2; p.nn=64; p.c='k'; dTs=4.53; no=30;
a=squeeze(w3.ar.prday_av); b=squeeze(v1.ar.prday_av); p.z1=(a-b)./b/dTs*100;
v=v1.ar; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
v=w3.ar; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
v=w3.tc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
v=w3.td; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prday_idavg); s1=squeeze(v.prday_idstd); n1=squeeze(v.id_sum); 
v=w3.mc; a2=squeeze(v.prday_idavg); s2=squeeze(v.prday_idstd); n2=squeeze(v.id_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='\Delta annual mean precipitation';
p.s2='\Delta AR mean precipitation'; 
p.s3='\Delta TS mean precipitation'; 
p.s4='\Delta TD mean precipitation'; 
p.s5='\Delta MCS mean precipitation';
p.s6='\Delta AVG (AR+TS+TD+MCS) precipitation'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='warm_4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prday_idavg_p99';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; no=30;
a=squeeze(w3.ar.prday_pct(1,1,:,:)); b=squeeze(v1.ar.prday_pct(1,1,:,:)); p.z1=(a-b)./a/dTs*100;
v=v1.ar; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=w3.ar; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=w3.tc; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=w3.td; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prday_idavg_p99); s1=squeeze(v.prday_idstd_p99); n1=squeeze(v.id99_sum); 
v=w3.mc; a2=squeeze(v.prday_idavg_p99); s2=squeeze(v.prday_idstd_p99); n2=squeeze(v.id99_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='percent change of P99';
p.s2='percent change of AR P>=P99'; 
p.s3='percent change of TS P>=P99'; 
p.s4='percent change of TD P>=P99'; 
p.s5='percent change of MSC P>=P99';
p.s6='percent change of ALL P>=P99'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='warm_4xCO2_minus_ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='percent_del_per_K_prday_idavg_p999';
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[-20:0.02:20]; p.opt=1; p.nn=64; p.c='k'; dTs=4.53; no=1;
a=squeeze(w3.ar.prday_pct(1,2,:,:)); b=squeeze(v1.ar.prday_pct(1,2,:,:)); p.z1=(a-b)./a/dTs*100;
v=v1.ar; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
v=w3.ar; a2=squeeze(v.prday_idavg_p999); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z2,p.e2,p.pd2]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z2=p.pd2/dTs;
v=v1.tc; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
v=w3.tc; a2=squeeze(v.prday_idavg_p999); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z3,p.e3,p.pd3]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z3=p.pd3/dTs;;
v=v1.td; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
v=w3.td; a2=squeeze(v.prday_idavg_p999); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z4,p.e4,p.pd4]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z4=p.pd4/dTs;;
v=v1.mc; a1=squeeze(v.prday_idavg_p999); s1=squeeze(v.prday_idstd_p999); n1=squeeze(v.id999_sum); 
v=w3.mc; a2=squeeze(v.prday_idavg_p999); s2=squeeze(v.prday_idstd_p999); n2=squeeze(v.id999_sum); 
[p.z5,p.e5,p.pd5]=compute_diff(a1,s1,n1,a2,s2,n2,no); p.z5=p.pd5/dTs;;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,3,3,'omitnan','shrink');
p.s1='percent change of P99.9';
p.s2='percent change of AR P>=P99.9'; 
p.s3='percent change of TS P>=P99.9'; 
p.s4='percent change of TD P>=P99.9'; 
p.s5='percent change of MSC P>=P99.9';
p.s6='percent change of ALL P>=P99.9'; p.s0='';
p.c1=[-10 10]; a=[-10 10]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







v=v1.ar; figure; pcolor(v.lon,v.lat,v.prday_fp99_from_id); shading flat; colorbar;
v=v1.tc; figure; pcolor(v.lon,v.lat,v.prday_fp99_from_id); shading flat; colorbar;

z=squeeze(v1.tc.frqday); 
figure; pcolor(v.lon,v.lat,z); shading flat; colorbar;

z=squeeze(v1.ar.prday_idwei); 
figure; pcolor(v.lon,v.lat,z); shading flat; colorbar;
z=squeeze(v1.tc.prday_idwei); 
figure; pcolor(v.lon,v.lat,z); shading flat; colorbar;
z=squeeze(v1.td.prday_idwei); 
figure; pcolor(v.lon,v.lat,z); shading flat; colorbar;
z=squeeze(v1.mc.prday_idwei); 
figure; pcolor(v.lon,v.lat,z); shading flat; colorbar;


z=squeeze(v1.tc.prday_idavg); 
figure; pcolor(v.lon,v.lat,z); shading flat; colorbar;

z=w1.ar.prday_fp99_from_id-v1.ar.prday_fp99_from_id; 
figure; pcolor(v.lon,v.lat,z); shading flat; colorbar; caxis([-0.2 0.2]);
z=w1.tc.prday_fp99_from_id-v1.tc.prday_fp99_from_id;
figure; pcolor(v.lon,v.lat,z); shading flat; colorbar; caxis([-0.2 0.2]);
z=w1.mc.prday_fp99_from_id-v1.mc.prday_fp99_from_id;
figure; pcolor(v.lon,v.lat,z); shading flat; colorbar; caxis([-0.2 0.2]);

z=w1.ar.prday_idavg-v1.ar.prday_idavg; z=squeeze(z);
z=v1.mc.prday_idavg; z=squeeze(z);
figure; pcolor(v.lon,v.lat,z); shading flat; colorbar; caxis([0 50]);
z=w1.tc.prday_idavg_p99-v1.tc.prday_idavg_p99; z=squeeze(z);
figure; pcolor(v.lon,v.lat,z); shading flat; colorbar; caxis([-50 50]);
z=w1.mc.prday_idavg_p99-v1.mc.prday_idavg_p99; z=squeeze(z);
figure; pcolor(v.lon,v.lat,z); shading flat; colorbar; caxis([-50 50]);

z=w1.ar.prday_idavg_p99-v1.ar.prday_idavg_p99; z=squeeze(z);
figure; pcolor(v.lon,v.lat,z); shading flat; colorbar; caxis([-50 50]);
z=w1.tc.prday_idavg_p99-v1.tc.prday_idavg_p99; z=squeeze(z);
figure; pcolor(v.lon,v.lat,z); shading flat; colorbar; caxis([-50 50]);
z=w1.mc.prday_idavg_p99-v1.mc.prday_idavg_p99; z=squeeze(z);
figure; pcolor(v.lon,v.lat,z); shading flat; colorbar; caxis([-50 50]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: mean precip P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prday';p.vname=strcat(vname,'_avg_p4k_climo');str='-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[0 15]; p.cs1=[0 15]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.prday_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.prday_av); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: mean precip Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prday';p.vname=strcat(vname,'_avg_future_present'); str='-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[0 15]; p.cs1=[0 15]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.prday_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.prday_av); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: AR-AVG precip P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prday';p.vname=strcat(vname,'_aravg_p4k_climo'); str='-AR-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[0 15]; p.cs1=[0 15]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.prday_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.prday_aravg); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: AR-AVG precip Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prday';p.vname=strcat(vname,'_aravg_future_present'); str='-AR-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[0 15]; p.cs1=[0 15]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.prday_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.prday_aravg); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: AR-AVG-P99 precip P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prday';p.vname=strcat(vname,'_aravg_p99_p4k_climo');str='-AR-AVG-P99';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[0 150]; p.cs1=[0 150]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.prday_aravg_p99); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.prday_aravg_p99); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: AR-AVG-P99 precip Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prday';p.vname=strcat(vname,'_aravg_p99_future_present');str='-AR-AVG-P99';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[0 150]; p.cs1=[0 150]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.prday_aravg_p99); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.prday_aravg_p99); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: AR-AVG-P999 precip P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prday';p.vname=strcat(vname,'_aravg_p999_p4k_climo');str='-AR-AVG-P999';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[0 150]; p.cs1=[0 150]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.prday_aravg_p999); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.prday_aravg_p999); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: AR-AVG-P999 precip Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prday';p.vname=strcat(vname,'_aravg_p999_future_present');str='-AR-AVG-P999';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[0 150]; p.cs1=[0 150]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.prday_aravg_p999); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.prday_aravg_p999); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: NONAR-AVG-P99 precip P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prday';p.vname=strcat(vname,'_nonar_p99_p4k_climo');str='-NONAR-AVG-P99';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[0 150]; p.cs1=[0 150]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.prday_nonar_p99); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.prday_nonar_p99); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: Fig NONAR-AVG-P99 precip Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prday';p.vname=strcat(vname,'_nonar_p99_future_present');str='-NONAR-AVG-P99';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[0 150]; p.cs1=[0 150]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.prday_nonar_p99); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.prday_nonar_p99); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: Fig NONAR-AVG-P999 precip P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prday';p.vname=strcat(vname,'_nonar_p999_p4k_climo');str='-NONAR-AVG-P999';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[0 150]; p.cs1=[0 150]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.prday_nonar_p999); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.prday_nonar_p999); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: Fig NONAR-AVG-P999 precip Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prday';p.vname=strcat(vname,'_nonar_p999_future_present');str='-NONAR-AVG-P999';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[0 150]; p.cs1=[0 150]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.prday_aravg_p999); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.prday_aravg_p999); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: IVT: AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='IVT';p.vname=strcat(vname,'_avg_p4k_climo'); str='-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[50 500]; p.cs1=[50 500]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.ivt_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.ivt_av); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: IVT: AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='IVT';p.vname=strcat(vname,'_avg_future_present'); str='-AR-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[50 500]; p.cs1=[50 500]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.ivt_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.ivt_av); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: IVTX: AR-AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='IVT';p.vname=strcat(vname,'_aravg_p4k_climo'); str='-AR-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[150 900]; p.cs1=[150 900]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.ivt_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.ivt_aravg); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: IVT: AR-AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='IVT';p.vname=strcat(vname,'_aravg_future_present'); str='-AR-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[150 900]; p.cs1=[150 900]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.ivt_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.ivt_aravg); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: IVTY: AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='IVTY';p.vname=strcat(vname,'_avg_p4k_climo'); str='-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[-120 120]; p.cs1=[-120 120]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.ivty_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.ivty_av); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: IVTY: AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='IVTY';p.vname=strcat(vname,'_avg_future_present'); str='-AR-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[-120 120]; p.cs1=[-120 120]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.ivty_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.ivty_av); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: IVTY: AR-AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='IVTY';p.vname=strcat(vname,'_aravg_p4k_climo'); str='-AR-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[-300 300]; p.cs1=[-300 300]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.ivty_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.ivty_aravg); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: IVTY: AR-AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='IVTY';p.vname=strcat(vname,'_aravg_future_present'); str='-AR-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[-300 300]; p.cs1=[-300 300]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.ivty_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.ivty_aravg); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: IVTX: AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='IVTX';p.vname=strcat(vname,'_avg_p4k_climo'); str='-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[-400 400]; p.cs1=[-400 400]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.ivtx_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.ivtx_av); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: IVTX: AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='IVTX';p.vname=strcat(vname,'_avg_future_present'); str='-AR-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[-400 400]; p.cs1=[-400 400]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.ivtx_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.ivtx_av); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: IVTX: AR-AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='IVTX';p.vname=strcat(vname,'_aravg_p4k_climo'); str='-AR-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[-400 400]; p.cs1=[-400 400]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.ivtx_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.ivtx_aravg); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: IVTY: AR-AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='IVTX';p.vname=strcat(vname,'_aravg_future_present'); str='-AR-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[-400 400]; p.cs1=[-400 400]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.ivtx_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.ivtx_aravg); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: PRW: AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='PRW';p.vname=strcat(vname,'_avg_p4k_climo'); str='-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[0 80]; p.cs1=[0 80]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.prw_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.prw_av); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: PRW: AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='PRW';p.vname=strcat(vname,'_avg_future_present'); str='-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[0 80]; p.cs1=[0 80]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.prw_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.prw_av); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: PRW: AR-AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='PRW';p.vname=strcat(vname,'_aravg_p4k_climo'); str='-AR-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[0 80]; p.cs1=[0 80]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.prw_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.prw_aravg); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: PRW: AR-AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='PRW';p.vname=strcat(vname,'_aravg_future_present'); str='-AR-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[0 80]; p.cs1=[0 80]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.prw_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.prw_aravg); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: LWCF: AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='LWCF';p.vname=strcat(vname,'_avg_p4k_climo'); str='-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[0 80]; p.cs1=[0 80]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.lwcf_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.lwcf_av); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: LWCF: AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='LWCF';p.vname=strcat(vname,'_avg_future_present'); str='-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[0 80]; p.cs1=[0 80]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.lwcf_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.lwcf_av); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: LWCF: AR-AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='LWCF';p.vname=strcat(vname,'_aravg_p4k_climo'); str='-AR-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[0 80]; p.cs1=[0 80]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.lwcf_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.lwcf_aravg); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: PRW: AR-AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='LWCF';p.vname=strcat(vname,'_aravg_future_present'); str='-AR-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[0 80]; p.cs1=[0 80]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.lwcf_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.lwcf_aravg); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: SWCF: AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='SWCF';p.vname=strcat(vname,'_avg_p4k_climo'); str='-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[-100 50]; p.cs1=[-100 50]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.swcf_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.swcf_av); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: SWCF: AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='SWCF';p.vname=strcat(vname,'_avg_future_present'); str='-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[-100 50]; p.cs1=[-100 50]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.swcf_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.swcf_av); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: SWCF: AR-AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='SWCF';p.vname=strcat(vname,'_aravg_p4k_climo'); str='-AR-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[-100 50]; p.cs1=[-100 50]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.swcf_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.swcf_aravg); p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: SWCF: AR-AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='SWCF';p.vname=strcat(vname,'_aravg_future_present'); str='-AR-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[-100 50]; p.cs1=[-100 50]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.swcf_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.swcf_aravg); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: : RLUT AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='RLUT';p.vname=strcat(vname,'_avg_p4k_climo'); str='-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[150 300]; p.cs1=[150 300]; p.cs2=[-5 5];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.rlut_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.rlut_av); p.dtas=4.53;
p.dz=(p.z1-p.z0)/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: RLUT: AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='RLUT';p.vname=strcat(vname,'_avg_future_present'); str='-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[150 300]; p.cs1=[150 300]; p.cs2=[-5 5];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.rlut_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.rlut_av); p.dtas=0.99;
p.dz=(p.z1-p.z0)/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: RLUT: AR-AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='RLUT';p.vname=strcat(vname,'_aravg_p4k_climo'); str='-AR-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[150 300]; p.cs1=[150 300]; p.cs2=[-5 5];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.rlut_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.rlut_aravg); p.dtas=4.53;
p.dz=(p.z1-p.z0)/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: RLUT: AR-AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='RLUT';p.vname=strcat(vname,'_aravg_future_present'); str='-AR-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[150 300]; p.cs1=[150 300]; p.cs2=[-5 5];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.rlut_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.rlut_aravg); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: : RSUT AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='RSUT';p.vname=strcat(vname,'_avg_p4k_climo'); str='-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[0 150]; p.cs1=[0 150]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.rsut_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.rsut_av); p.dtas=4.53;
p.dz=(p.z1-p.z0)/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: RSUT: AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='RSUT';p.vname=strcat(vname,'_avg_future_present'); str='-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[0 150]; p.cs1=[0 150]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.rsut_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.rsut_av); p.dtas=0.99;
p.dz=(p.z1-p.z0)/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: RSUT: AR-AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='RSUT';p.vname=strcat(vname,'_aravg_p4k_climo'); str='-AR-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[0 150]; p.cs1=[0 150]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.rsut_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.rsut_aravg); p.dtas=4.53;
p.dz=(p.z1-p.z0)/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: RSUT: AR-AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='RSUT';p.vname=strcat(vname,'_aravg_future_present'); str='-AR-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[0 150]; p.cs1=[0 150]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.rsut_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.rsut_aravg); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: : W850 AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='W850';p.vname=strcat(vname,'_avg_p4k_climo'); str='-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[-50 50]; p.cs1=[-50 50]; p.cs2=[-3 3];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.w850_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.w850_av); p.dtas=4.53;
p.dz=(p.z1-p.z0)/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: W850: AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='W850';p.vname=strcat(vname,'_avg_future_present'); str='-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[-50 50]; p.cs1=[-50 50]; p.cs2=[-3 3];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.w850_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.w850_av); p.dtas=0.99;
p.dz=(p.z1-p.z0)/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: W850: AR-AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='W850';p.vname=strcat(vname,'_aravg_p4k_climo'); str='-AR-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[-100 100]; p.cs1=[-100 100]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.w850_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.w850_aravg); p.dtas=4.53;
p.dz=(p.z1-p.z0)/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: W850: AR-AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='W850';p.vname=strcat(vname,'_aravg_future_present'); str='-AR-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[-100 100]; p.cs1=[-100 100]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.w850_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.w850_aravg); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: : Q850 AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='Q850';p.vname=strcat(vname,'_avg_p4k_climo'); str='-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[0 15]; p.cs1=[0 15]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.q850_av)*1000; p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.q850_av)*1000; p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: Q850: AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='Q850';p.vname=strcat(vname,'_avg_future_present'); str='-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[0 15]; p.cs1=[0 15]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.q850_av)*1000; p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.q850_av)*1000; p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: Q850: AR-AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='Q850';p.vname=strcat(vname,'_aravg_p4k_climo'); str='-AR-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[0 15]; p.cs1=[0 15]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.q850_aravg)*1000; p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.q850_aravg)*1000; p.dtas=4.53;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: Q850: AR-AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='Q850';p.vname=strcat(vname,'_aravg_future_present'); str='-AR-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[0 15]; p.cs1=[0 15]; p.cs2=[-10 10];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.q850_aravg)*1000; p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.q850_aravg)*1000; p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: : T850 AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='T850';p.vname=strcat(vname,'_avg_p4k_climo'); str='-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[250 300]; p.cs1=[250 300]; p.cs2=[-2 2];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.t850_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.t850_av); p.dtas=4.53;
p.dz=(p.z1-p.z0)/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: T850: AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='T850';p.vname=strcat(vname,'_avg_future_present'); str='-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[250 300]; p.cs1=[250 300]; p.cs2=[-2 2];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.t850_av); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.t850_av); p.dtas=0.99;
p.dz=(p.z1-p.z0)/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: T850: AR-AVG P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='T850';p.vname=strcat(vname,'_aravg_p4k_climo'); str='-AR-AVG';
p.s0=strcat('(a) CLIMO-',vname, str);
p.s1=strcat('(b) P4K-'  ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=v1.lm; p.a=v1.aa; p.cs0=[250 300]; p.cs1=[250 300]; p.cs2=[-2 2];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(v1.t850_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(w1.t850_aravg); p.dtas=4.53;
p.dz=(p.z1-p.z0)/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PE paper: T850: AR-AVG Future minus Present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='T850';p.vname=strcat(vname,'_aravg_future_present'); str='-AR-AVG';
p.s0=strcat('(a) PRESENT-',vname, str);
p.s1=strcat('(b) FUTURE-' ,vname, str);
p.s2='(c) (b) minus (a)'; p.str='';
p.lm=vm.lm; p.a=v1.aa; p.cs0=[250 300]; p.cs1=[250 300]; p.cs2=[-2 2];
lat0=-10; p.j1=max(find(v1.lat<-lat0)); p.j2=min(find(v1.lat>lat0));
p.z0=squeeze(vm.t850_aravg); p.x1=v1.lon; p.y1=v1.lat;
p.z1=squeeze(wm.t850_aravg); p.dtas=0.99;
p.dz=(p.z1-p.z0)./p.z0*100/p.dtas;
plot_2d_3panel(p); 






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_PCP P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prw';p.vname=strcat(vname,'_av');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 100]; p.cs1=[0 100]; p.cs2=[-10 10];
p.s0=strcat('(a) P4K-'  ,vname,' (AVG)'); 
p.s1=strcat('(b) CLIMO-',vname,' (AVG)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(w1.prw_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(v1.prw_aravg_p99);
p.dz=(p.z0-p.z1)./p.z1*100/4.53;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_PCP P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prday';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[-300 300]; p.cs1=[-300 300]; p.cs2=[-10 10];
p.s0=strcat('(a) P4K-'  ,vname,' (AR-AVG P99)'); 
p.s1=strcat('(b) CLIMO-',vname,' (AR-AVG P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(w1.prday_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(v1.prday_aravg_p99);
p.dz=(p.z0-p.z1)./p.z1*100/4.53;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_PCP P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prw';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 100]; p.cs1=[0 100]; p.cs2=[-10 10];
p.s0=strcat('(a) P4K-'  ,vname,' (AR-AVG P99)'); 
p.s1=strcat('(b) CLIMO-',vname,' (AR-AVG P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(w1.prw_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(v1.prw_aravg_p99);
p.dz=(p.z0-p.z1)./p.z1*100/4.53;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_PCP P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t850';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[200 300]; p.cs1=[200 300]; p.cs2=[0 2];
p.s0=strcat('(a) P4K-'  ,vname,' (AR-AVG P99)'); 
p.s1=strcat('(b) CLIMO-',vname,' (AR-AVG P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(w1.t850_aravg_p999); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(v1.t850_aravg_p999);
p.dz=(p.z0-p.z1)/4.53;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_PCP P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tas';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[200 300]; p.cs1=[200 300]; p.cs2=[-1 1];
p.s0=strcat('(a) P4K-'  ,vname,' (AR-AVG P99)'); 
p.s1=strcat('(b) CLIMO-',vname,' (AR-AVG P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(w1.tas_aravg_p999); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(v1.tas_aravg_p999);
p.dz=(p.z0-p.z1)/4.53;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_W850 P4K minus CLIMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w850';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[-400 400]; p.cs1=[-400 400]; p.cs2=[-5 5];
p.s0=strcat('(a) P4K-'  ,vname,' (AR-AVG P99)'); 
p.s1=strcat('(b) CLIMO-',vname,' (AR-AVG P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(w1.w850_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(v1.w850_aravg_p99);
p.dz=(p.z0-p.z1)./p.z1*100/4.53;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig0 AR frequency, fraction of P99 and P999
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.vname='arfq_vs_arfqs'; p.str='ANN'; vx=v1; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 0.25]; p.cs1=[0 1]; p.cs2=[0 1];
lat0=30; p.j1=max(find(vx.lat<-lat0)); p.j2=min(find(vx.lat>lat0));
p.s0='(a) frequency of AR days (annual mean)'; 
p.s1='(b) fraction of P>P99 due to ARs'; 
p.s2='(c) fraction of P>P99.9 due to ARs'; p.str=''; k_pct=7;
p.z0=squeeze(vx.arday_fq (1,:,:)); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.prday_fp99_ar)
p.dz=squeeze(vx.prday_fp999_ar)
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_precip
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prday';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 100]; p.cs1=[0 100]; p.cs2=[-15 15];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(w1.prday_av); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(v1.prday_av); p.dtas=4.53;
p.dz=(p.z0-p.z1)./p.z1*100/p.dtas;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_precip
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prday';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 100]; p.cs1=[0 100]; p.cs2=[-15 15];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.prday_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.prday_nonar_p99);
p.dz=p.z0-p.z1;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_precip
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prcday';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 50]; p.cs1=[0 50]; p.cs2=[-2 2];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.prc6hr_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.prc6hr_nonar_p99);
p.dz=p.z0-p.z1;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig IVTY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ivty'; p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');  vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[-500 500]; p.cs1=[-500 500]; p.cs2=[-500 500];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.ivty_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.ivty_nonar_p99);
p.dz=p.z0-p.z1;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig IVTY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ivtx'; p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');  vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[-500 500]; p.cs1=[-500 500]; p.cs2=[-500 500];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.ivtx_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.ivtx_nonar_p99);
p.dz=p.z0-p.z1;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_PRW
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prw';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 80]; p.cs1=[0 80]; p.cs2=[-10 10];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.prw_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.prw_nonar_p99);
p.dz=p.z0-p.z1;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_omega850
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='prsn';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[-10 10]; p.cs1=[-10 10]; p.cs2=[-10 10];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.prsn_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.prsn_nonar_p99);
p.dz=p.z0-p.z1;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_omega850
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w850';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[-800 800]; p.cs1=[-800 800]; p.cs2=[-150 150];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.w850_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.w850_nonar_p99);
p.dz=p.z0-p.z1;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_omega500
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w500';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[-800 800]; p.cs1=[-800 800]; p.cs2=[-150 150];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.w500_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.w500_nonar_p99);
p.dz=p.z0-p.z1;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_omega250
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='w250';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[-800 800]; p.cs1=[-800 800]; p.cs2=[-150 150];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.w250_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.w250_nonar_p99);
p.dz=p.z0-p.z1;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_q850
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='q850';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 15]; p.cs1=[0 15]; p.cs2=[-3 3];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.q850_aravg_p99)*1000; p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.q850_nonar_p99)*1000;
p.dz=p.z0-p.z1;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_q500
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='q500';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 5]; p.cs1=[0 5]; p.cs2=[-1 1];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.q500_aravg_p99)*1000; p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.q500_nonar_p99)*1000;
p.dz=p.z0-p.z1;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_q250
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='q250';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 0.5]; p.cs1=[0 0.5]; p.cs2=[-0.1 0.1];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.q250_aravg_p99)*1000; p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.q250_nonar_p99)*1000;
p.dz=p.z0-p.z1;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_t850
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t850';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[250 300]; p.cs1=[250 300]; p.cs2=[-3 3];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.t850_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.t850_nonar_p99);
p.dz=p.z0-p.z1;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_t500
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t500';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[250 270]; p.cs1=[250 270]; p.cs2=[-3 3];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.t500_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.t500_nonar_p99);
p.dz=p.z0-p.z1;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_t250
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='t250';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[200 240]; p.cs1=[200 240]; p.cs2=[-3 3];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.t250_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.t250_nonar_p99);
p.dz=p.z0-p.z1;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CRE paper: Fig_ws850
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ws850';p.vname=strcat(vname,'_aravg_aravgp99_nonarp99');vx=v1;p.str='ANN'; 
p.lm=vx.lm; p.a=vx.aa; p.cs0=[0 25]; p.cs1=[0 25]; p.cs2=[-10 10];
p.s0=strcat('(a)',vname,' (AR-AVG P99)'); 
p.s1=strcat('(b)',vname,' (Non-AR P99)');
p.s2='(c) (b) minus (a)'; p.str='';
p.z0=squeeze(vx.ws850_aravg_p99); p.x1=vx.lon; p.y1=vx.lat;
p.z1=squeeze(vx.ws850_nonar_p99);
p.dz=p.z0-p.z1;
plot_2d_3panel(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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
x=w1.ar.leng;  w1.ar_no =length(x)/w1.nyr; (w1.ar_no-v1.ar_no)/v1.ar_no*100/4.53
x=wm2.ar.leng; wm2.ar_no=length(x)/wm2.nyr;(wm2.ar_no-vx.ar_no)/vx.ar_no*100/0.99
x=w2.ar.leng;  w2.ar_no =length(x)/w2.nyr; (w2.ar_no-v1.ar_no)/v1.ar_no*100/4.53
for i=1:36
  yr0=2015+i-1;
  yr=wm.ar.yyy;  id=(yr==yr0); no1(i)=sum(id);
  yr=wm2.ar.yyy; id=(yr==yr0); no2(i)=sum(id);
end
plot_2d_diff_warm_2(p); 
