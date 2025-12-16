%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/backup/ECMWF/';
expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=1979;yr2=2014;
opt='obs'; v=readarmap_day(tpath,expn,yr1,yr2,ardir,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; ardir='AR_climlmt';yr1=1979;yr2=2014;
opt='mod'; v=readarmap_allday(tpath,expn,yr1,yr2,pct,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp'; ardir='AR_climlmt';yr1=2015;yr2=2050;
opt='mod'; v=readarmap_allday(tpath,expn,yr1,yr2,pct,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_2010climo_new_newpp'; ardir='AR_climlmt'; yr1=2;yr2=101;diag=2;
%v=readar_limit_new(tpath,expn,yr1,yr2,ardir);
%opt='mod'; addtc_to_AR(tpath,expn,yr1,yr2,opt,-50)
opt='PR01';v.p1=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='PR05';v.p5=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='OP';  v.op=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AL';  v.al=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AR';  v.ar=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TC';  v.tc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='TD';  v.td=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='MC';  v.mc=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
%opt='mod'; v=readarmap_allday(tpath,expn,yr1,yr2,pct,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';pct=[99 99.9];%pct=[25 50 75 90 95 99 99.9];
expn='c192L33_am4p0_2010climo_new_p4K_newpp'; ardir='AR_climlmt';yr1=2;yr2=101;diag=2;
%v=readar_limit_new(tpath,expn,yr1,yr2,ardir);
%opt='mod'; addtc_to_AR(tpath,expn,yr1,yr2,opt,-50)
opt='PR05';v.p5=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='OP';  v.op=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
opt='AL';  v.al=readartcmcs_day(tpath,expn,yr1,yr2,pct,opt,diag);
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
tpath='/work/miz/mat_hiresmip/'; d=2; s='_readartcmcs_day.mat';
expn='c192L33_am4p0_2010climo_new_newpp'; yrs='_2_101_';ardir='AR_climlmt'
%fext=strcat(yrs,'PR05_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);v1.p5=v;
fext=strcat(yrs,'OP_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);v1.op=v;
fext=strcat(yrs,'AL_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);v1.al=v;
fext=strcat(yrs,'AR_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);v1.ar=v;
fext=strcat(yrs,'TC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);v1.tc=v;
fext=strcat(yrs,'TD_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);v1.td=v;
fext=strcat(yrs,'MC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);v1.mc=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_hiresmip/'; d=2;
expn='c192L33_am4p0_2010climo_new_p4K_newpp'; yrs='_2_101_';ardir='AR_climlmt'
%fext=strcat(yrs,'PR05_diag',num2str(d),s);fn=strcat(tpath,expn,fext);load(fn);w1.p5=v;
fext=strcat(yrs,'OP_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w1.op=v;
fext=strcat(yrs,'AL_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w1.al=v;
fext=strcat(yrs,'AR_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w1.ar=v;
fext=strcat(yrs,'TC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w1.tc=v;
fext=strcat(yrs,'TD_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w1.td=v;
fext=strcat(yrs,'MC_diag',num2str(d),s); fn=strcat(tpath,expn,fext); load(fn);w1.mc=v;
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
%CRE paper: to be drafted...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%zonal mean analysis
v=v1.al;
vv.al=v; vv.ar=v; vv.tc=v; vv.td=v; vv.mc=v; vv.op=v;
vv.z=compute_zma(vv,1);
v1.z=compute_zma(v1,1); %w1.ar=w1.al; w1.tc=w1.al; w1.td=w1.al; w1.mc=w1.al;
w1.z=compute_zma(w1,0);
w2.z=compute_zma(w2,0);
w3.z=compute_zma(w3,0);
g1.z=compute_zma(g1,0); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig TESTTTTTTTTTTTTTTTTT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0=v1.ar.lat; z=v1.z; a=100; f=z.al.frqday*a; vname='cre_fq_zm_wetday';
y0=z.av.ttcf; y1=z.al.ttcf_idwei; y2=z.op.ttcf_idwei;%z.al.ttcf_idavg;
f1=z.ar.frqday*a; f2=(z.tc.frqday+z.td.frqday)*a; f3=z.mc.frqday*a;
f4=z.op.frqday*a;
pms=[ 0, 0, 1200, 800]*0.7; fsize=12; lw=1; ms=1; ls='-'; ls1='--';
p.s0='all days'; p.s1='storm days'; p.s2='other wet days'; xy=[-90 90 -80 30];
handle = figure('Position', pms,'visible','on');
ax1=gca; p.xl='latitude'; p.yl='net CRE (W/m2)'; 
line(x0,y0,'Color','k','LineWidth',lw*1,'LineStyle',ls); hold on; 
line(x0,y1,'Color','k','LineWidth',lw*2,'LineStyle',ls); 
line(x0,y2,'Color','k','LineWidth',lw*2,'LineStyle',ls1); 
s0=sprintf('%s (mean=%5.2f)',p.s0,mean(y0));
s1=sprintf('%s (mean=%5.2f)',p.s1,mean(y1));
s2=sprintf('%s (mean=%5.2f)',p.s2,nanmean(y2));
legend(s0,s1,s2,'Location','northwest'); axis(xy);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl,'FontSize',fsize);
title('(a)','FontSize',fsize); set(gca,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
line(x0,f, 'Color','r','Marker','.','MarkerSize',ms,'LineWidth',lw*2,'LineStyle',ls); hold on;
line(x0,f1,'Color','m','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls1); hold on;
line(x0,f2,'Color','g','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls1); hold on;
line(x0,f3,'Color','b','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls1); hold on;
line(x0,f4,'Color','c','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls1); hold on;
p.ylr='occurrence frequency of storm days (%)'; ylabel(p.ylr,'FontSize',fsize); 
xy=[-90 90 0 100]; axis(xy);
s0=sprintf('storm days (mean=%5.2f)',mean(f));
s1=sprintf('AR days  (mean=%5.2f)',mean(f1));
s2=sprintf('TC days  (mean=%5.2f)',mean(f2));
s3=sprintf('MCS days (mean=%5.2f)',mean(f3));
s4=sprintf('other wet days (mean=%5.2f)',mean(f4));
legend(s0,s1,s2,s3,s4,'Location','northeast'); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='ctl'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0=v1.ar.lat; z=v1.z; f=z.al.frqday; vname='lw_sw_cre_zm_wetday';
y1=z.av.swcf; y2=z.al.swcf_idwei; y3=y2./f; y3=z.op.swcf_idwei;%z.al.swcf_idavg; 
y4=z.av.lwcf; y5=z.al.lwcf_idwei; y6=y5./f; y6=z.op.lwcf_idwei;%z.al.lwcf_idavg; 
pms=[ 0, 0, 1200, 800]*0.7; fsize=12; lw=1; ms=1; ls='-'; ls1='--';
p.s0='all days'; p.s1='storm days'; p.s2='other wet days'; xy=[-90 90 -150 30];
handle = figure('Position', pms,'visible','on');
ax1=gca; p.xl='latitude'; p.yl='SW CRE (W/m2)'; p.ylr='LW CRE (W/m2)';
line(x0,y1,'Color','b','LineWidth',lw*1,'LineStyle',ls); hold on; 
line(x0,y2,'Color','b','LineWidth',lw*2,'LineStyle',ls); hold on; 
line(x0,y3,'Color','b','LineWidth',lw*2,'LineStyle',ls1); 
s1=sprintf('%s (mean=%5.2f)',p.s0,mean(y1));
s2=sprintf('%s (mean=%5.2f)',p.s1,mean(y2));
s3=sprintf('%s (mean=%5.2f)',p.s2,mean(y3));
legend(s1,s2,s3,'Location','northwest'); axis(xy);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl,'FontSize',fsize);
title('(b)','FontSize',fsize); set(gca,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
line(x0,y4,'Color','r','LineWidth',lw*1,'LineStyle',ls); hold on;
line(x0,y5,'Color','r','LineWidth',lw*2,'LineStyle',ls); hold on;
line(x0,y6,'Color','r','LineWidth',lw*2,'LineStyle',ls1); hold on;
xy=[-90 90 0 175]; ylabel(p.ylr,'FontSize',fsize);
s4=sprintf('%s (mean=%5.2f)',p.s0,mean(y4));
s5=sprintf('%s (mean=%5.2f)',p.s1,mean(y5));
s6=sprintf('%s (mean=%5.2f)',p.s2,mean(y6));
legend(s4,s5,s6,'Location','northeast'); axis(xy); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='ctl'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TESTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig1a: total CRE and storm frequency 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0=v1.ar.lat; z=v1.z; a=100; f=z.al.frqday*a; vname='cre_fq_zm';
y0=z.av.ttcf; y1=z.al.ttcf_idwei; y2=y1./f*100;%z.al.ttcf_idavg;
f1=z.ar.frqday*a; f2=(z.tc.frqday+z.td.frqday)*a; f3=z.mc.frqday*a;
pms=[ 0, 0, 1200, 800]*0.7; fsize=12; lw=1; ms=1; ls='-'; ls1='--';
p.s0='all days'; p.s1='storm days'; p.s2='storm-day avg'; xy=[-90 90 -80 20];
handle = figure('Position', pms,'visible','on');
ax1=gca; p.xl='latitude'; p.yl='net CRE (W/m2)'; 
line(x0,y0,'Color','k','LineWidth',lw*1,'LineStyle',ls); hold on; 
line(x0,y1,'Color','k','LineWidth',lw*2,'LineStyle',ls); 
%line(x0,y2,'Color','k','LineWidth',lw*2,'LineStyle',ls1); 
s0=sprintf('%s (mean=%5.2f)',p.s0,mean(y0));
s1=sprintf('%s (mean=%5.2f)',p.s1,mean(y1));
s2=sprintf('%s (mean=%5.2f)',p.s2,nanmean(y2));
legend(s0,s1,'Location','northwest'); axis(xy);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl,'FontSize',fsize);
title('(a)','FontSize',fsize); set(gca,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
line(x0,f, 'Color','r','Marker','.','MarkerSize',ms,'LineWidth',lw*2,'LineStyle',ls); hold on;
line(x0,f1,'Color','m','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls1); hold on;
line(x0,f2,'Color','g','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls1); hold on;
line(x0,f3,'Color','b','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls1); hold on;
p.ylr='occurrence frequency of storm days (%)'; ylabel(p.ylr,'FontSize',fsize); 
xy=[-90 90 0 100]; axis(xy);
s0=sprintf('storm days (mean=%5.2f)',mean(f));
s1=sprintf('AR days  (mean=%5.2f)',mean(f1));
s2=sprintf('TC days  (mean=%5.2f)',mean(f2));
s3=sprintf('MCS days (mean=%5.2f)',mean(f3));
legend(s0,s1,s2,s3,'Location','northeast'); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='ctl'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig1b: partition of LW and SW CRE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0=v1.ar.lat; z=v1.z; f=z.al.frqday; vname='lw_sw_cre_zm';
y1=z.av.swcf; y2=z.al.swcf_idwei; y3=y2./f; %z.al.swcf_idavg; 
y4=z.av.lwcf; y5=z.al.lwcf_idwei; y6=y5./f; %z.al.lwcf_idavg; 
pms=[ 0, 0, 1200, 800]*0.7; fsize=12; lw=1; ms=1; ls='-'; ls1='--';
p.s0='all days'; p.s1='storm days'; p.s2='storm-day avg'; xy=[-90 90 -150 25];
handle = figure('Position', pms,'visible','on');
ax1=gca; p.xl='latitude'; p.yl='SW CRE (W/m2)'; p.ylr='LW CRE (W/m2)';
line(x0,y1,'Color','b','LineWidth',lw*1,'LineStyle',ls); hold on; 
line(x0,y2,'Color','b','LineWidth',lw*2,'LineStyle',ls); hold on; 
%line(x0,y3,'Color','b','LineWidth',lw*2,'LineStyle',ls1); 
s1=sprintf('%s (mean=%5.2f)',p.s0,mean(y1));
s2=sprintf('%s (mean=%5.2f)',p.s1,mean(y2));
s3=sprintf('%s (mean=%5.2f)',p.s2,nanmean(y3));
legend(s1,s2,'Location','northwest'); axis(xy);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl,'FontSize',fsize);
title('(b)','FontSize',fsize); set(gca,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
line(x0,y4,'Color','r','LineWidth',lw*1,'LineStyle',ls); hold on;
line(x0,y5,'Color','r','LineWidth',lw*2,'LineStyle',ls); hold on;
%line(x0,y6,'Color','r','LineWidth',lw*2,'LineStyle',ls1); hold on;
xy=[-90 90 0 175]; ylabel(p.ylr,'FontSize',fsize);
s4=sprintf('%s (mean=%5.2f)',p.s0,mean(y4));
s5=sprintf('%s (mean=%5.2f)',p.s1,mean(y5));
%s6=sprintf('%s (mean=%5.2f)',p.s2,nanmean(y6));
legend(s4,s5,'Location','northeast'); axis(xy); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='ctl'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig1.S1: total CRE and storm frequency 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0=v1.ar.lat; z=v1.z; a=100; f=z.al.frqday*a; vname='cre_fq';
y0=z.av.ttcf; y1=z.al.ttcf_idwei; y2=y1./f*100;%z.al.ttcf_idavg;
f1=z.ar.frqday*a; f2=z.tc.frqday*a; f3=z.td.frqday*a; f4=z.mc.frqday*a;
pms=[ 0, 0, 1200, 800]*0.7; fsize=12; lw=1; ms=1; ls='-'; ls1='--';
p.s0='all days'; p.s1='storm days'; xy=[-90 90 -80 26];
handle = figure('Position', pms,'visible','on');
ax1=gca; p.xl='latitude'; p.yl='net CRE (W/m2)'; 
line(x0,y0,'Color','k','LineWidth',lw*1,'LineStyle',ls); hold on; 
line(x0,y1,'Color','k','LineWidth',lw*2,'LineStyle',ls); 
line(x0,y2,'Color','k','LineWidth',lw*2,'LineStyle',ls1); 
s0=sprintf('%s (mean=%5.2f)',p.s0,mean(y0));
s1=sprintf('%s (mean=%5.2f)',p.s1,mean(y1));
s2=sprintf('%s (mean=%5.2f)',p.s1,nanmean(y2));
legend(s0,s1,s2,'Location','northwest'); axis(xy);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl,'FontSize',fsize);
title('(a)','FontSize',fsize); set(gca,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
line(x0,f, 'Color','r','Marker','.','MarkerSize',ms,'LineWidth',lw*2,'LineStyle',ls); hold on;
line(x0,f1,'Color','m','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls1); hold on;
line(x0,f2,'Color','g','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls1); hold on;
line(x0,f3,'Color','b','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls1); hold on;
line(x0,f4,'Color','c','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls1); hold on;
p.ylr='occurrence frequency of storm days (%)'; ylabel(p.ylr,'FontSize',fsize); 
xy=[-90 90 0 100]; axis(xy);
s0=sprintf('storm days (mean=%5.2f)',mean(f));
s1=sprintf('AR days  (mean=%5.2f)',mean(f1));
s2=sprintf('TS days  (mean=%5.2f)',mean(f2));
s3=sprintf('TD days  (mean=%5.2f)',mean(f3));
s4=sprintf('MCS days (mean=%5.2f)',mean(f4));
legend(s0,s1,s2,s3,s4,'Location','northeast'); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='readartcmcs'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 2: annual mean LW CRE contributed from AR/TS/TD/MSC %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %all time mean lwcf from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='lwcf_idwei_9panel';p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=2;p.nn=128; p.c='k';
p.z1=squeeze(v1.ar.lwcf_av);
p.z3=squeeze(v1.ar.lwcf_idwei);   
p.z4=squeeze(v1.tc.lwcf_idwei)+squeeze(v1.td.lwcf_idwei);
p.z5=squeeze(v1.mc.lwcf_idwei);
p.z2=p.z3+p.z4+p.z5;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) LW CRE';
p.s2='(b) LW CRE; AR+TC+MCS';
p.s3='(d) LW CRE; AR'; 
p.s4='(e) LW CRE; TC'; 
p.s5='(f) LW CRE; MCS'; 
p.s6='(c) LW CRE; AR+TC+MCS';
p.s7='(g) LW CRE; AR';
p.s8='(h) LW CRE; TC';
p.s9='(i) LW CRE; MCS';
p.c1=[-60 60]; p.opt=4
a=[-30 30]; p.c2=a; p.c3=a; p.c4=a; p.c5=a;
a=[  0 70]; p.c6=a; p.c7=a; p.c8=a; p.c9=a;%p.c2=p.c1; p.c6=[0 100];
plot_2d_9panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%6 panel plot%%%%%%%%%%%%%
p.z1=squeeze(v1.ar.lwcf_av);
p.z2=squeeze(v1.ar.lwcf_idwei);   
p.z3=squeeze(v1.tc.lwcf_idwei);
p.z4=squeeze(v1.td.lwcf_idwei);
p.z5=squeeze(v1.mc.lwcf_idwei);
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) LW CRE';
p.s2='(c) LW CRE from AR'; 
p.s3='(d) LW CRE from TS'; 
p.s4='(e) LW CRE from TD'; 
p.s5='(f) LW CRE from MCS';
p.s6='(b) LW CRE from AR+TS+TD+MCS'; p.s0='';
p.c1=[-60 60]; a=[-30 30]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=p.c1;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 2.S1: annual mean LW CRE contributed from AR/TS/TD/MSC %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %all time mean lwcf from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='lwcf_idwei_frac';p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=2;p.nn=128; p.c='k';
p.z1=squeeze(v1.ar.lwcf_av);
p.z2=squeeze(v1.ar.lwcf_idwei);   
p.z3=squeeze(v1.tc.lwcf_idwei);
p.z4=squeeze(v1.td.lwcf_idwei);
p.z5=squeeze(v1.mc.lwcf_idwei);
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) LW CRE';
p.s2='(c) LW CRE from AR'; 
p.s3='(d) LW CRE from TS'; 
p.s4='(e) LW CRE from TD'; 
p.s5='(f) LW CRE from MCS';
p.s6='(b) LW CRE from AR+TS+TD+MCS'; p.s0='';
a=p.z1; p.z6=p.z6./a; p.z1=p.z1
p.c1=[-1 1]; a=[-1 1]; 
p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=p.c1;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 3: annual mean SW CRE contributed from AR/TS/TD/MSC %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %all time mean swcf from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='swcf_idwei_9panel';p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=2;p.nn=128; p.c='k';
p.z1=squeeze(v1.ar.swcf_av);
p.z3=squeeze(v1.ar.swcf_idwei);   
p.z4=squeeze(v1.tc.swcf_idwei)+squeeze(v1.td.swcf_idwei);
p.z5=squeeze(v1.mc.swcf_idwei);
p.z2=p.z3+p.z4+p.z5; p.z6=p.z2;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) SW CRE';
p.s2='(b) SW CRE; AR+TC+MCS';
p.s3='(d) SW CRE; AR'; 
p.s4='(e) SW CRE; TC'; 
p.s5='(f) SW CRE; MCS'; 
p.s6='(c) SW CRE; AR+TC+MCS';
p.s7='(g) SW CRE; AR';
p.s8='(h) SW CRE; TC';
p.s9='(i) SW CRE; MCS';
p.c1=[-100 100]; p.opt=4
a=[-30 30]; p.c2=a; p.c3=a; p.c4=a; p.c5=a;
a=[  0 70]; p.c6=a; p.c7=a; p.c8=a; p.c9=a;%p.c2=p.c1; p.c6=[0 100];
plot_2d_9panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%6 panel plot%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.z1=squeeze(v1.ar.swcf_av);
p.z2=squeeze(v1.ar.swcf_idwei);   
p.z3=squeeze(v1.tc.swcf_idwei);
p.z4=squeeze(v1.td.swcf_idwei);
p.z5=squeeze(v1.mc.swcf_idwei);
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) SW CRE';
p.s2='(c) SW CRE from AR'; 
p.s3='(d) SW CRE from TS'; 
p.s4='(e) SW CRE from TD'; 
p.s5='(f) SW CRE from MCS';
p.s6='(b) SW CRE from AR+TS+TD+MCS'; p.s0='';
p.c1=[-100 100]; a=[-30 30]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 4: annual mean netCRE contributed from AR/TS/TD/MSC %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %all time mean swcf from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='ttcf_idwei_9panel';p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=2;p.nn=128; p.c='k';
p.z1=squeeze(v1.ar.ttcf_av);
p.z3=squeeze(v1.ar.ttcf_idwei);   
p.z4=squeeze(v1.tc.ttcf_idwei)+squeeze(v1.td.ttcf_idwei);
p.z5=squeeze(v1.mc.ttcf_idwei);
p.z2=p.z3+p.z4+p.z5; p.z6=p.z2;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) net CRE';
p.s2='(b) net CRE; AR+TC+MCS';
p.s3='(d) net CRE; AR'; 
p.s4='(e) net CRE; TC'; 
p.s5='(f) net CRE; MCS'; 
p.s6='(c) net CRE; AR+TC+MCS';
p.s7='(g) net CRE; AR';
p.s8='(h) net CRE; TC';
p.s9='(i) net CRE; MCS';
p.c1=[-60 60]; p.opt=4
a=[-20 20]; p.c2=a; p.c3=a; p.c4=a; p.c5=a;
a=[  0 70]; p.c6=a; p.c7=a; p.c8=a; p.c9=a;%p.c2=p.c1; p.c6=[0 100];
plot_2d_9panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%6 panel plot%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.z1=squeeze(v1.ar.swcf_av);
p.z2=squeeze(v1.ar.swcf_idwei);   
p.z3=squeeze(v1.tc.swcf_idwei);
p.z4=squeeze(v1.td.swcf_idwei);
p.z5=squeeze(v1.mc.swcf_idwei);
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) SW CRE';
p.s2='(c) SW CRE from AR'; 
p.s3='(d) SW CRE from TS'; 
p.s4='(e) SW CRE from TD'; 
p.s5='(f) SW CRE from MCS';
p.s6='(b) SW CRE from AR+TS+TD+MCS'; p.s0='';
p.c1=[-100 100]; a=[-30 30]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 5: LW CRE averaged only over AR/TS/TD/MSC days%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; no=100; 
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='crf_idavg_9panel';p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=2;p.nn=128; p.c='k';

v=v1.ar; n1=squeeze(v.id_sum);
a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); p.z1=compute_se(a1,s1,n1,no);
a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); p.z2=compute_se(a1,s1,n1,no);
a1=squeeze(v.ttcf_idavg); s1=squeeze(v.ttcf_idstd); p.z3=compute_se(a1,s1,n1,no);

v=v1.tc; a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); n1=squeeze(v.id_sum); 
v=v1.td; a2=squeeze(v.lwcf_idavg); s2=squeeze(v.lwcf_idstd); n2=squeeze(v.id_sum); 
a1=(a1.*n1+a2.*n2)./(n1+n2); s1=(s1.*n1+s2.*n2)./(n1+n2); n1=n1+n2;
p.z4=compute_se(a1,s1,n1,no);
v=v1.tc; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
v=v1.td; a2=squeeze(v.swcf_idavg); s2=squeeze(v.swcf_idstd); n2=squeeze(v.id_sum); 
a1=(a1.*n1+a2.*n2)./(n1+n2); s1=(s1.*n1+s2.*n2)./(n1+n2); n1=n1+n2;
p.z5=compute_se(a1,s1,n1,no);
v=v1.tc; a1=squeeze(v.ttcf_idavg); s1=squeeze(v.ttcf_idstd); n1=squeeze(v.id_sum); 
v=v1.td; a2=squeeze(v.ttcf_idavg); s2=squeeze(v.ttcf_idstd); n2=squeeze(v.id_sum); 
a1=(a1.*n1+a2.*n2)./(n1+n2); s1=(s1.*n1+s2.*n2)./(n1+n2); n1=n1+n2;
p.z6=compute_se(a1,s1,n1,no);

v=v1.mc; n1=squeeze(v.id_sum);
a1=squeeze(v.lwcf_idavg); s1=squeeze(v.lwcf_idstd); p.z7=compute_se(a1,s1,n1,no);
a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); p.z8=compute_se(a1,s1,n1,no);
a1=squeeze(v.ttcf_idavg); s1=squeeze(v.ttcf_idstd); p.z9=compute_se(a1,s1,n1,no);

p=smoothp(p,1,1,'omitnan','shrink');
p.frqday_ar=squeeze(v1.ar.frqday);
p.frqday_tc=squeeze(v1.tc.frqday+v1.td.frqday);
p.frqday_mc=squeeze(v1.mc.frqday);

a=[-150 150]; p.c1=a; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
p.s1='(a) LW CRE; AR days'; 
p.s2='(b) SW CRE; AR days'; 
p.s3='(c) net CRE; AR days'; 
p.s4='(d) LW CRE; TC days'; 
p.s5='(e) SW CRE; TC days';
p.s6='(f) net CRE; TC days'; 
p.s7='(g) LW CRE; MCS days';
p.s8='(h) SW CRE; MCS days'; 
p.s9='(i) net CRE; MCS days';
plot_2d_9panel_storm_cre(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 6: SW CRE averaged only over AR/TS/TD/MSC days%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; no=300; 
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='swcf_idavg_4panel';p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=2;p.nn=128; p.c='k';
v=v1.ar; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
[p.z1]=compute_se(a1,s1,n1,no);
v=v1.tc; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
[p.z2]=compute_se(a1,s1,n1,no);
v=v1.td; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
[p.z3]=compute_se(a1,s1,n1,no);
v=v1.mc; a1=squeeze(v.swcf_idavg); s1=squeeze(v.swcf_idstd); n1=squeeze(v.id_sum); 
[p.z4]=compute_se(a1,s1,n1,no);
p=smoothp(p,1,1,'omitnan','shrink');
p.c1=[-200 200]; a=[-200 200]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
p.s1='(a) SW CRE averaged over AR days'; 
p.s2='(b) SW CRE averaged over TS days'; 
p.s3='(c) SW CRE averaged over TD days'; 
p.s4='(d) SW CRE averaged over MCS days';
plot_2d_4panel_storm_cre(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig1.S1: change in total CRE CRE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0=v1.al.lat; vname='d_cre';
t1=v1.z.av.tas;        t2=w1.z.av.tas;  dtas=t2-t1; dtas0=mean(dtas);
z1=v1.z.av.ttcf;       z2=w1.z.av.ttcf;       y0=(z2-z1)/dtas0; 
z1=v1.z.al.ttcf_idwei; z2=w1.z.al.ttcf_idwei; y1=(z2-z1)/dtas0;
f1=v1.z.al.frqday;     f2=w1.z.al.frqday;     y2=(z2./f2-z1./f1)/dtas0;
f1=v1.z.al.frqday;     f2=w1.z.al.frqday;     y3=(f2-f1)/dtas0*100;
f1=v1.z.ar.frqday;     f2=w1.z.ar.frqday;     y4=(f2-f1)/dtas0*100;
f1=v1.z.tc.frqday;     f2=w1.z.tc.frqday;     y5=(f2-f1)/dtas0*100;
f1=v1.z.td.frqday;     f2=w1.z.td.frqday;     y6=(f2-f1)/dtas0*100;
f1=v1.z.mc.frqday;     f2=w1.z.mc.frqday;     y7=(f2-f1)/dtas0*100;
pms=[ 0, 0, 1200, 800]*0.7; fsize=12; lw=1; ms=1; ls='-'; ls1='--';
p.s0='all days'; p.s1='storm days'; xy=[-90 90 -3 3];
handle = figure('Position', pms,'visible','on');
ax1=gca; p.xl='latitude'; p.yl='change in net CRE (W/m2/K)'; 
line(x0,y0,'Color','k','LineWidth',lw*1,'LineStyle',ls); hold on; 
line(x0,y1,'Color','k','LineWidth',lw*2,'LineStyle',ls); 
line(x0,y2,'Color','k','LineWidth',lw*2,'LineStyle',ls1); 
s0=sprintf('%s (mean=%5.2f)',p.s0,mean(y0)); grid on;
s1=sprintf('%s (mean=%5.2f)',p.s1,mean(y1));
s2=sprintf('%s (mean=%5.2f)',p.s1,nanmean(y2));
legend(s0,s1,s2,'Location','northwest'); axis(xy);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl,'FontSize',fsize);
title('(a)','FontSize',fsize); set(gca,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
line(x0,y3,'Color','r','LineWidth',lw*2,'LineStyle',ls); hold on;
%line(x0,y4,'Color','m','LineWidth',lw,  'LineStyle',ls1); hold on;
%line(x0,y5,'Color','g','LineWidth',lw,  'LineStyle',ls1); hold on;
%line(x0,y6,'Color','b','LineWidth',lw,  'LineStyle',ls1); hold on;
%line(x0,y7,'Color','c','LineWidth',lw,  'LineStyle',ls1); hold on;
p.ylr='change in frequency of storm days (%/K)'; ylabel(p.ylr,'FontSize',fsize);
s0=sprintf('storm days (mean=%5.2f)',mean(y3));
s1=sprintf('AR days    (mean=%5.2f)',mean(y4));
s2=sprintf('TS days    (mean=%5.2f)',mean(y5));
s3=sprintf('TD days    (mean=%5.2f)',mean(y6));
s4=sprintf('MCS days   (mean=%5.2f)',mean(y7));
legend(s0,'Location','northeast'); 
xy=[-90 90 -1 1]; axis(xy);set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='readartcmcs'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig1.S2: change in LW and SW CRE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0=v1.al.lat; vname='d_lw_sw_cre';
t1=v1.z.av.tas;        t2=w1.z.av.tas;      dtas=t2-t1;dtas0=mean(dtas);
f1=v1.z.al.frqday;     f2=v1.z.al.frqday; 
z1=v1.z.av.swcf;       z2=w1.z.av.swcf;       y0=(z2-z1)/dtas0; 
z1=v1.z.al.swcf_idwei; z2=w1.z.al.swcf_idwei; y1=(z2-z1)/dtas0; 
z1=v1.z.av.lwcf;       z2=w1.z.av.lwcf;       y2=(z2-z1)/dtas0; 
z1=v1.z.al.lwcf_idwei; z2=w1.z.al.lwcf_idwei; y3=(z2-z1)/dtas0;
pms=[ 0, 0, 1200, 800]*0.7; fsize=12; lw=1; ms=1; ls='-';
p.s0='storm days'; p.s1='all days {    }'; xy=[-90 90 -1.2 1.2];
handle = figure('Position', pms,'visible','on');
ax1=gca; p.xl='latitude'; p.yl='\Delta SW CRE (W/m2/K)'; p.ylr='\Delta LW CRE (W/m2/K)';
line(x0,y1,'Color','b','Marker','.','MarkerSize',ms,'LineWidth',lw*2,'LineStyle',ls); hold on; 
line(x0,y0,'Color','b','Marker','.','MarkerSize',ms,'LineWidth',lw*1,'LineStyle',ls); 
s0=sprintf('%s (mean=%5.2f)',p.s0,mean(y1)); grid on;
s1=sprintf('%s (mean=%5.2f)',p.s1,mean(y0));
legend(s0,s1,'Location','northwest'); axis(xy);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl,'FontSize',fsize);
title('(b)','FontSize',fsize); set(gca,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
line(x0,y3,'Color','r','Marker','.','MarkerSize',ms,'LineWidth',lw*2,'LineStyle',ls); hold on;
line(x0,y2,'Color','r','Marker','.','MarkerSize',ms,'LineWidth',lw*1,'LineStyle',ls); hold on;
%line(x0,[xy(1) xy(2)],[0 0], 'Color','r','MarkerSize',ms,'LineWidth',1); 
xy=[-90 90 -1.2 1.2]; axis(xy); ylabel(p.ylr,'FontSize',fsize);
s0=sprintf('%s (mean=%5.2f)',p.s0,mean(y3));
s1=sprintf('%s (mean=%5.2f)',p.s1,mean(y2)); %box on;
legend(s0,s1,'Location','northeast');  set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='readartcmcs'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig1.S3: change in LW and SW CRE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0=v1.al.lat; vname='d_lw_sw_cre';
t1=v1.z.av.tas;        t2=w1.z.av.tas;      dtas=t2-t1;dtas0=mean(dtas);
f1=v1.z.al.frqday;     f2=v1.z.al.frqday; 
z1=v1.z.al.swcf_ndavg; z2=w1.z.al.swcf_ndavg; y0=(z2-z1)/dtas0; 
z1=v1.z.al.swcf_idavg; z2=w1.z.al.swcf_idavg; y1=(z2-z1)/dtas0; 
z1=v1.z.al.lwcf_ndavg; z2=w1.z.al.lwcf_ndavg; y2=(z2-z1)/dtas0; 
z1=v1.z.al.lwcf_idavg; z2=w1.z.al.lwcf_idavg; y3=(z2-z1)/dtas0;
pms=[ 0, 0, 1200, 800]*0.7; fsize=12; lw=1; ms=1; ls='-';
p.s0='storm days'; p.s1='all days {    }'; xy=[-90 90 -5 5];
handle = figure('Position', pms,'visible','on');
ax1=gca; p.xl='latitude'; p.yl='\Delta SW CRE (W/m2/K)'; p.ylr='\Delta LW CRE (W/m2/K)';
line(x0,y1,'Color','b','Marker','.','MarkerSize',ms,'LineWidth',lw*2,'LineStyle',ls); hold on; 
line(x0,y0,'Color','b','Marker','.','MarkerSize',ms,'LineWidth',lw*1,'LineStyle',ls); 
s0=sprintf('%s (mean=%5.2f)',p.s0,mean(y1)); grid on;
s1=sprintf('%s (mean=%5.2f)',p.s1,mean(y0));
legend(s0,s1,'Location','northwest'); axis(xy);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl,'FontSize',fsize);
title('(b)','FontSize',fsize); set(gca,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
line(x0,y3,'Color','r','Marker','.','MarkerSize',ms,'LineWidth',lw*2,'LineStyle',ls); hold on;
line(x0,y2,'Color','r','Marker','.','MarkerSize',ms,'LineWidth',lw*1,'LineStyle',ls); hold on;
%line(x0,[xy(1) xy(2)],[0 0], 'Color','r','MarkerSize',ms,'LineWidth',1); 
xy=[-90 90 -5 5]; axis(xy); ylabel(p.ylr,'FontSize',fsize);
s0=sprintf('%s (mean=%5.2f)',p.s0,mean(y3));
s1=sprintf('%s (mean=%5.2f)',p.s1,mean(y2)); %box on;
legend(s0,s1,'Location','northeast');  set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='readartcmcs'; 
printnew(visfig,figpath,expn,vname);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5: scatter plots of ttcf between idwei vs av%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.al; vname='ttcf_gm_ann_scatter';
f =squeeze(v1.al.frqday_ts_day); f =getclim(f);
f1=squeeze(v1.ar.frqday_ts_day); f1=getclim(f1);
f2=squeeze(v1.tc.frqday_ts_day); f2=getclim(f2);
f3=squeeze(v1.td.frqday_ts_day); f3=getclim(f3);
f4=squeeze(v1.mc.frqday_ts_day); f4=getclim(f4);
x =squeeze(v.ttcf_idwei_ts_day); x =getclim(x);
y =squeeze(v.ttcf_nonid_ts_day); y =getclim(y);
z =squeeze(v.ttcf_av_ts_day);    z =getclim(z);
pms=[ 0, 0, 1000, 800]*0.7; x0=[-4:0.1:4]; fsize=10; lw=2; 
handle = figure('Position', pms,'visible','on'); 
x1=x.ano_ann; y1=y.ano_ann; z1=z.ano_ann; ms=12;
plot(x1,z1,'r.','MarkerSize',ms); sx=corrslop(x1,z1); hold on;
plot(y1,z1,'b.','MarkerSize',ms); sy=corrslop(y1,z1); sz=corrslop(y1,x1);
p=sx; plot(x0,p.s(1)*x0+p.s(2),'r-');
p=sy; plot(x0,p.s(1)*x0+p.s(2),'b-');
s1=sprintf('storm days{      }(mean=%5.2f; std=%5.2f; corr=%5.2f)',mean(x.clim),x.std_day,sx.r(1));
s2=sprintf('non-storm days (mean=%5.2f; std=%5.2f; corr=%5.2f)',mean(y.clim),y.std_day,sy.r(1));
legend(s1,s2,'location','northwest');
xl='anomalous global annual mean net CRE from storm/non-storm days (W/m2)';
yl='anomalous global annual mean net CRE from all days (W/m2)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
xy=[-0.5 0.5 -0.5 0.5]; axis(xy); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='readartcmcs'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%scatter plots of ttcf between idwei vs av%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.al; vname='lwcf_gm_ann_scatter';
x=squeeze(v.lwcf_idwei_ts_day); x=getclim(x);
y=squeeze(v.lwcf_nonid_ts_day); y=getclim(y);
z=squeeze(v.lwcf_av_ts_day);    z=getclim(z);
pms=[ 0, 0, 1000, 800]*0.7; x0=[-4:0.1:4]; fsize=10; lw=2; 
handle = figure('Position', pms,'visible','on'); 
x1=x.ano_ann; y1=y.ano_ann; z1=z.ano_ann; ms=12;
plot(x1,z1,'r.','MarkerSize',ms); sx=corrslop(x1,z1); hold on;
plot(y1,z1,'b.','MarkerSize',ms); sy=corrslop(y1,z1); sz=corrslop(y1,x1);
p=sx; plot(x0,p.s(1)*x0+p.s(2),'r-');
p=sy; plot(x0,p.s(1)*x0+p.s(2),'b-');
s1=sprintf('storm days{   } (mean=%5.2f; corr=%5.2f)',mean(x.clim),sx.r(1));
s2=sprintf('non-storm days (mean=%5.2f; corr=%5.2f)',mean(y.clim),sy.r(1));
legend(s1,s2,'location','northwest');
xl='anomalous global annual mean LW CRE from storm/non-storm days (W/m2)';
yl='anomalous global annual mean LW CRE from all days (W/m2)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
xy=[-0.5 0.5 -0.5 0.5]; axis(xy); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='readartcmcs'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%scatter plots of swcf between idwei vs av%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.al; vname='swcf_gm_ann_scatter';
x=squeeze(v.swcf_idwei_ts_day); x=getclim(x);
y=squeeze(v.swcf_nonid_ts_day); y=getclim(y);
z=squeeze(v.swcf_av_ts_day);    z=getclim(z);
pms=[ 0, 0, 1000, 800]*0.7; x0=[-4:0.1:4]; fsize=10; lw=2; 
handle = figure('Position', pms,'visible','on'); 
x1=x.ano_ann; y1=y.ano_ann; z1=z.ano_ann; ms=12;
plot(x1,z1,'r.','MarkerSize',ms); sx=corrslop(x1,z1); hold on;
plot(y1,z1,'b.','MarkerSize',ms); sy=corrslop(y1,z1); sz=corrslop(y1,x1);
p=sx; plot(x0,p.s(1)*x0+p.s(2),'r-');
p=sy; plot(x0,p.s(1)*x0+p.s(2),'b-');
s1=sprintf('storm days{    }(mean=%5.2f; std=%5.2f; corr=%5.2f)',mean(x.clim),x.std_day,sx.r(1));
s2=sprintf('non-storm days (mean=%5.2f; std=%5.2f; corr=%5.2f)',mean(y.clim),y.std_day,sy.r(1));
legend(s1,s2,'location','northwest');
xl='anomalous global annual mean SW CRE from storm/non-storm days (W/m2)';
yl='anomalous global annual mean SW CRE from all days (W/m2)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
xy=[-0.5 0.5 -0.5 0.5]; axis(xy); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='readartcmcs'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%scatter plots of ttcf between idwei vs av%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.al; vname='ttcf_gm_day_scatter';
x=squeeze(v.lwcf_idwei_ts_day); x1=getclim(x);
y=squeeze(v.swcf_idwei_ts_day); y1=getclim(y);
x=squeeze(v.lwcf_nonid_ts_day); x2=getclim(x);
y=squeeze(v.swcf_nonid_ts_day); y2=getclim(y);
pms=[ 0, 0, 1000, 800]*0.7; x0=[-5:0.1:5]; fsize=10; lw=2; 
handle = figure('Position', pms,'visible','on'); 
x1=x1.ano_ann; y1=y1.ano_ann; x2=x2.ano_ann; y2=y2.ano_ann; ms=12;
plot(x1,y1,'r.','MarkerSize',ms); sx=corrslop(x1,y1); hold on;
plot(x2,y2,'b.','MarkerSize',ms); sy=corrslop(x2,y2); 
p=sx; plot(x0,p.s(1)*x0+p.s(2),'r-');
p=sy; plot(x0,p.s(1)*x0+p.s(2),'b-');
s1=sprintf('storm days (mean=%5.2f; std=%5.2f; corr=%5.2f)',mean(x.clim),x.std_day,sx.r(1));
s2=sprintf('non-storm days (mean=%5.2f; std=%5.2f; corr=%5.2f)',mean(y.clim),y.std_day,sy.r(1));
legend(s1,s2,'location','northwest');
xl='anomalous global mean net CRE from storm/non-storm days (W/m2)';
yl='anomalous global mean net CRE (W/m2)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
xy=[-5 5 -5 5]; axis(xy); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='readartcmcs'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%scatter plots of ttcf between idwei vs av%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.al; vname='ttcf_gm_day_scatter';
x=squeeze(v.ttcf_idwei_ts_day); x=getclim(x);
y=squeeze(v.ttcf_nonid_ts_day); y=getclim(y);
z=squeeze(v.ttcf_av_ts_day);    z=getclim(z);
pms=[ 0, 0, 1000, 800]*0.7; x0=[-5:0.1:5]; fsize=10; lw=2; 
handle = figure('Position', pms,'visible','on'); 
x1=x.ano_day; y1=y.ano_day; z1=z.ano_day; ms=4;
plot(x1,z1,'r.','MarkerSize',ms); sx=corrslop(x1,z1); hold on;
plot(y1,z1,'b.','MarkerSize',ms); sy=corrslop(y1,z1); sz=corrslop(y1,x1);
p=sx; plot(x0,p.s(1)*x0+p.s(2),'r-');
p=sy; plot(x0,p.s(1)*x0+p.s(2),'b-');
s1=sprintf('storm days (mean=%5.2f; std=%5.2f; corr=%5.2f)',mean(x.clim),x.std_day,sx.r(1));
s2=sprintf('other days (mean=%5.2f; std=%5.2f; corr=%5.2f)',mean(y.clim),y.std_day,sy.r(1));
legend(s1,s2,'location','northwest');
xl='anomalous global mean net CRE from storm/non-storm days (W/m2)';
yl='anomalous global mean net CRE (W/m2)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
xy=[-5 5 -5 5]; axis(xy); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='readartcmcs'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%scatter plots of ttcf between idwei vs av%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.al; vname='lwcf_gm_day_scatter';
x=squeeze(v.lwcf_idwei_ts_day); x=getclim(x);
y=squeeze(v.lwcf_nonid_ts_day); y=getclim(y);
z=squeeze(v.lwcf_av_ts_day);    z=getclim(z);
pms=[ 0, 0, 1000, 800]*0.7; x0=[-3:0.1:3]; fsize=10; lw=2; 
handle = figure('Position', pms,'visible','on'); 
x1=x.ano_day; y1=y.ano_day; z1=z.ano_day; ms=4;
plot(x1,z1,'r.','MarkerSize',ms); sx=corrslop(x1,z1); hold on;
plot(y1,z1,'b.','MarkerSize',ms); sy=corrslop(y1,z1); sz=corrslop(y1,x1);
p=sx; plot(x0,p.s(1)*x0+p.s(2),'r-','LineWidth',lw);
p=sy; plot(x0,p.s(1)*x0+p.s(2),'b-','LineWidth',lw);
s1=sprintf('storm days (mean=%5.2f; std=%5.2f; corr=%5.2f)',mean(x.clim),x.std_day,sx.r(1));
s2=sprintf('other days (mean=%5.2f; std=%5.2f; corr=%5.2f)',mean(y.clim),y.std_day,sy.r(1));
legend(s1,s2,'location','northwest');
xl='anomalous global mean net CRE from storm/non-storm days (W/m2)';
yl='anomalous global mean net CRE (W/m2)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
xy=[-3 3 -3 3]; axis(xy); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='readartcmcs'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%zonal mean analysis
v1.z=compute_zma(v1,1); 
w1.z=compute_zma(w1,1);
w2.z=compute_zma(w2,0);
w3.z=compute_zma(w3,0);
g1.z=compute_zma(g1,0); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig1: total CRE and storm frequency 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0=v1.ar.lat; z=v1.z; a=100; f=z.al.frqday*a; vname='cre_fq';
y0=z.av.ttcf; y1=z.al.ttcf_idwei;
f1=z.ar.frqday*a; f2=z.tc.frqday*a; f3=z.td.frqday*a; f4=z.mc.frqday*a;
pms=[ 0, 0, 1200, 800]*0.7; fsize=12; lw=1; ms=1; ls='-'; ls1='--';
p.s0='storm days'; p.s1='all days {    }'; xy=[-90 90 -60 20];
handle = figure('Position', pms,'visible','on');
ax1=gca; p.xl='latitude'; p.yl='net CRE (W/m2)'; 
line(x0,y1,'Color','k','Marker','.','MarkerSize',ms,'LineWidth',lw*2,'LineStyle',ls); hold on; 
line(x0,y0,'Color','k','Marker','.','MarkerSize',ms,'LineWidth',lw*1,'LineStyle',ls); 
s0=sprintf('%s (mean=%5.2f)',p.s0,mean(y1));
s1=sprintf('%s (mean=%5.2f)',p.s1,mean(y0));
legend(s0,s1,'Location','northwest'); axis(xy);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl,'FontSize',fsize);
title('(a)','FontSize',fsize); set(gca,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
line(x0,f, 'Color','r','Marker','.','MarkerSize',ms,'LineWidth',lw*2,'LineStyle',ls); hold on;
line(x0,f1,'Color','m','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls1); hold on;
line(x0,f2,'Color','g','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls1); hold on;
line(x0,f3,'Color','b','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls1); hold on;
line(x0,f4,'Color','c','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls1); hold on;
p.ylr='occurrence frequency of storm days (%)'; ylabel(p.ylr,'FontSize',fsize); 
xy=[-90 90 0 100]; axis(xy);
s0=sprintf('storm days (mean=%5.2f)',mean(f));
s1=sprintf('AR days  (mean=%5.2f)',mean(f1));
s2=sprintf('TS days  (mean=%5.2f)',mean(f2));
s3=sprintf('TD days  (mean=%5.2f)',mean(f3));
s4=sprintf('MCS days (mean=%5.2f)',mean(f4));
legend(s0,s1,s2,s3,s4,'Location','northeast'); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_CRE/'; expn='readartcmcs'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



figure; plot(x,f1,'k'); hold on; 
plot(x,(1-f1),'r-'); 


v1.r=compute_zn_corr(v1,opt);


y0=v1.z.av.lwcf;
y1=v1.z.al.lwcf_idwei;
y2=v1.z.al.lwcf_idavg.*f1;
y3=v1.z.al.lwcf_ndavg.*(1-f1); y4=y0-y3;
figure; plot(x,y0,'k'); hold on; 
plot(x,y1,'r-'); 
plot(x,y2,'g-');
plot(x,y3,'b-');
plot(x,y4,'m--');

y0=v1.z.av.swcf;
y1=v1.z.al.swcf_idwei;
y2=v1.z.al.swcf_idavg.*f1;
y3=v1.z.al.swcf_ndavg.*(1-f1); y4=y0-y3;
figure; plot(x,y0,'k'); hold on; 
plot(x,y1,'r-'); 
plot(x,y2,'g-');
plot(x,y3,'b-');
plot(x,y4,'m--');

y0=v1.z.av.ttcf;
y1=v1.z.al.ttcf_idwei;
y2=v1.z.al.ttcf_idavg.*f1;
y3=v1.z.al.ttcf_ndavg.*(1-f1); y4=y0-y3;
figure; plot(x,y0,'k'); hold on; 
plot(x,y1,'r-'); 
plot(x,y2,'g-');
plot(x,y3,'b-');
plot(x,y4,'m--');

y0= v1.z.av.lsh+v1.z.av.cvh;
y1= v1.z.al.lsh_idwei+v1.z.al.cvh_idwei;
y2=(v1.z.al.lsh_idavg+v1.z.al.cvh_idavg).*f1;
y3=(v1.z.al.lsh_ndavg+v1.z.al.cvh_ndavg).*(1-f1); y4=y0-y3;
figure; plot(x,y0,'k'); hold on; 
plot(x,y1,'r-'); 
plot(x,y2,'g-');
plot(x,y3,'b-');
plot(x,y4,'m--');

y0=v1.z.al.frqday; 
y1=w1.z.al.frqday; dy1=y2-y1;
y2=w2.z.al.frqday; dy1=y2-y1;
y3=w3.z.al.frqday; dy1=y2-y1;
y4=g1.z.al.frqday; dy1=y2-y1;
figure; plot(x,y1,'m'); hold on; 
plot(x,y1-y0,'r--'); 
plot(x,y2-y0,'g--');
plot(x,y3-y0,'b--');
plot(x,y4-y0,'k--');


x=v1.ar.lat;
lf1=v1.z.av.lwcf; lf2=w1.z.av.lwcf; y1=lf2-lf1;
sf1=v1.z.av.swcf; sf2=w1.z.av.swcf; y2=sf2-sf1;
tf1=v1.z.av.ttcf; tf2=w1.z.av.ttcf; y3=tf2-tf1;
figure; plot(x,y1,'r'); hold on;
plot(x,y2,'b'); plot(x,y3,'k');

y1=v1.z.av.lwcf;       y2=w1.z.av.lwcf;       dy1=y2-y1;
y1=v1.z.al.lwcf_idwei; y2=w1.z.al.lwcf_idwei; dy2=y2-y1;
figure; plot(x,dy1,'k'); hold on;
plot(x,dy2,'r'); plot(x,dy1-dy2,'b');

y1=v1.z.av.swcf;       y2=w1.z.av.swcf;       dy1=y2-y1;
y1=v1.z.al.swcf_idwei; y2=w1.z.al.swcf_idwei; dy2=y2-y1;
figure; plot(x,dy1,'k'); hold on;
plot(x,dy2,'r'); plot(x,dy1-dy2,'b');

y1=v1.z.av.lwcf;       y2=w1.z.av.lwcf;       dy1=y2-y1;
y1=v1.z.al.lwcf_idavg; y2=w1.z.al.lwcf_idavg; dy2=y2-y1;
y1=v1.z.al.lwcf_ndavg; y2=w1.z.al.lwcf_ndavg; dy3=y2-y1;
figure; plot(x,dy1,'k'); hold on;
plot(x,dy2,'r'); plot(x,dy3,'b');

v1.g=compute_gm(v1,1); 
w1.g=compute_gm(w1,1);
w2.g=compute_gm(w2,0);
w3.g=compute_gm(w3,0);
g1.g=compute_gm(g1,0); 
tas =[v1.g.av.tas  w1.g.av.tas  w2.g.av.tas  w3.g.av.tas  g1.g.av.tas];
ttcf=[v1.g.av.ttcf w1.g.av.ttcf w2.g.av.ttcf w3.g.av.ttcf g1.g.av.ttcf];
lwcf=[v1.g.av.lwcf w1.g.av.lwcf w2.g.av.lwcf w3.g.av.lwcf g1.g.av.lwcf];
swcf=[v1.g.av.swcf w1.g.av.swcf w2.g.av.swcf w3.g.av.swcf g1.g.av.swcf];

lf=[v1.g.al.lwcf_idwei w1.g.al.lwcf_idwei w2.g.al.lwcf_idwei w3.g.al.lwcf_idwei g1.g.al.lwcf_idwei];
sf=[v1.g.al.swcf_idwei w1.g.al.swcf_idwei w2.g.al.swcf_idwei w3.g.al.swcf_idwei g1.g.al.swcf_idwei];
tf=[v1.g.al.ttcf_idwei w1.g.al.ttcf_idwei w2.g.al.ttcf_idwei w3.g.al.ttcf_idwei g1.g.al.ttcf_idwei];

lfid=[v1.g.al.lwcf_idavg w1.g.al.lwcf_idavg w2.g.al.lwcf_idavg w3.g.al.lwcf_idavg g1.g.al.lwcf_idavg];
sfid=[v1.g.al.swcf_idavg w1.g.al.swcf_idavg w2.g.al.swcf_idavg w3.g.al.swcf_idavg g1.g.al.swcf_idavg];
tfid=[v1.g.al.ttcf_idavg w1.g.al.ttcf_idavg w2.g.al.ttcf_idavg w3.g.al.ttcf_idavg g1.g.al.ttcf_idavg];

lfnd=[v1.g.al.lwcf_ndavg w1.g.al.lwcf_ndavg w2.g.al.lwcf_ndavg w3.g.al.lwcf_ndavg g1.g.al.lwcf_ndavg];
sfnd=[v1.g.al.swcf_ndavg w1.g.al.swcf_ndavg w2.g.al.swcf_ndavg w3.g.al.swcf_ndavg g1.g.al.swcf_ndavg];
tfnd=[v1.g.al.ttcf_ndavg w1.g.al.ttcf_ndavg w2.g.al.ttcf_ndavg w3.g.al.ttcf_ndavg g1.g.al.ttcf_ndavg];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
aa=squeeze(v1.ar.aa);
a0=squeeze(v1.ar.tas_av); a1=squeeze(w1.ar.tas_av); dtas1=mean(mean((a1-a0).*aa));
a0=squeeze(v1.ar.tas_av); a1=squeeze(g1.al.tas_av); dtas2=mean(mean((a1-a0).*aa));
a0=squeeze(g1.al.prday_av); x1=mean(mean(a0.*aa))
a0=squeeze(v1.al.prday_av); x2=mean(mean(a0.*aa))
a0=squeeze(w1.al.prday_av); x3=mean(mean(a0.*aa))
a0=squeeze(w2.al.prday_av); x4=mean(mean(a0.*aa))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
%Fig 4: annual mean LW CRE contributed from AR/TS/TD/MSC %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %all time mean lwcf from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='lwcf_idwei';p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=2;p.nn=128; p.c='k';
p.z1=squeeze(v1.ar.lwcf_av);
p.z2=squeeze(v1.ar.lwcf_idwei);   
p.z3=squeeze(v1.tc.lwcf_idwei);
p.z4=squeeze(v1.td.lwcf_idwei);
p.z5=squeeze(v1.mc.lwcf_idwei);
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) LW CRF';
p.s2='(c) LW CRE from AR'; 
p.s3='(d) LW CRE from TS'; 
p.s4='(e) LW CRE from TD'; 
p.s5='(f) LW CRE from MCS';
p.s6='(b) LW CRE from AR+TS+TD+MCS'; p.s0='';
p.c1=[-60 60]; a=[-30 30]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=p.c1;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 5: annual mean SW CRE contributed from AR/TS/TD/MSC %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %all time mean swcf from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='swcf_idwei';p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=2;p.nn=128; p.c='k';
p.z1=squeeze(v1.ar.swcf_av);
p.z2=squeeze(v1.ar.swcf_idwei);   
p.z3=squeeze(v1.tc.swcf_idwei);
p.z4=squeeze(v1.td.swcf_idwei);
p.z5=squeeze(v1.mc.swcf_idwei);
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) SW CRE';
p.s2='(c) SW CRE from AR'; 
p.s3='(d) SW CRE from TS'; 
p.s4='(e) SW CRE from TD'; 
p.s5='(f) SW CRE from MCS';
p.s6='(b) SW CRE from AR+TS+TD+MCS'; p.s0='';
p.c1=[-100 100]; a=[-30 30]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


figure;  x0=[-4:0.1:4]; y0=2*x0; polyfit(x0,y0)
plot(x1,z1,'r.','MarkerSize',ms);

corrcoef(y.ano_ann,z.ano_ann)
corrcoef(x.ano_ann,z.ano_ann)
figure; 
plot(x.ano_ann,'r-'); hold on;
plot(y.ano_ann,'b-');
plot(z.ano_ann,'k-');
figure; 
plot(y.ano_day,z.ano_day,'b.'); hold on;
plot(x.ano_day,z.ano_day,'r.'); hold on;
corrcoef(y.ano_day,z.ano_day)
corrcoef(x.ano_day,z.ano_day)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.al;
x=squeeze(v.lwcf_idwei_ts_day); x=getclim(x);
y=squeeze(v.lwcf_nonid_ts_day); y=getclim(y);
z=squeeze(v.lwcf_av_ts_day);    z=getclim(z);
figure; 
plot(y.ano_ann,z.ano_ann,'b.'); hold on;
plot(x.ano_ann,z.ano_ann,'r.'); 
corrcoef(y.ano_ann,z.ano_ann)
corrcoef(x.ano_ann,z.ano_ann)
figure; 
plot(x.ano_ann,'r-'); hold on;
plot(y.ano_ann,'b-');
plot(z.ano_ann,'k-');
figure; 
plot(y.ano_day,z.ano_day,'b.'); hold on;
plot(x.ano_day,z.ano_day,'r.'); hold on;
corrcoef(y.ano_day,z.ano_day)
corrcoef(x.ano_day,z.ano_day)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.al;
x=squeeze(v.swcf_idwei_ts_day); x=getclim(x);
y=squeeze(v.swcf_nonid_ts_day); y=getclim(y);
z=squeeze(v.swcf_av_ts_day);    z=getclim(z);
figure; 
plot(y.ano_ann,z.ano_ann,'b.'); hold on;
plot(x.ano_ann,z.ano_ann,'r.'); 
corrcoef(y.ano_ann,z.ano_ann)
corrcoef(x.ano_ann,z.ano_ann)
figure; 
plot(y.ano_day,z.ano_day,'b.'); hold on;
plot(x.ano_day,z.ano_day,'r.'); hold on;
corrcoef(y.ano_day,z.ano_day)
corrcoef(x.ano_day,z.ano_day)



v=v1.al;
x=squeeze(v.swcf_idwei_ts_day); x=getclim(x);
y=squeeze(v.swcf_nonid_ts_day); y=getclim(y);
z=squeeze(v.swcf_av_ts_day);    z=getclim(z);
figure; 
plot(x.ano_ann,z.ano_ann,'b.'); hold on;
plot(y.ano_ann,z.ano_ann,'r.');
corrcoef(x.ano_ann,z.ano_ann)
corrcoef(y.ano_ann,z.ano_ann)


figure; 
plot(x.ano_ann,'r-'); hold on;
plot(y.ano_ann,'b-');
plot(z.ano_ann,'k-');

corrcoef(x.ano_ann,z.ano_ann)
corrcoef(y.ano_ann,z.ano_ann)

y=squeeze(v1.ar.ttcf_av_ts_day);
fn='/archive/Ming.Zhao/awg/warsaw_201803/c192L33_am4p0_2010climo_new_newpp/atmos_data/daily/c192L33_am4p0_2010climo_new_newpp_SLP_20N-90N_ALL.EOF.nc'
a=ncread(fn,'EOF_TS',[1 1],[730 4]); x=a(:,1); corrcoef(y(1:730),x)

figure; pcolor(v.lon,v.lat,ttcf_corr); shading flat; colorbar;
hold on; contour(v.lon,v.lat,v.lm,'k'); colormap(jet);
aa=repmat(v1.ar.aa,[1 1 100]); aa=shiftdim(aa,2);
x=squeeze(v1.ar.lwcf_av_ann);    lwcf_ts   =mean(mean(x.*aa,3),2);
[lwcf_corr]=mapcorrcoef(x,lwcf_ts,v.nlat,v.nlon);
x=squeeze(v1.ar.swcf_av_ann);    swcf_ts   =mean(mean(x.*aa,3),2);
[swcf_corr]=mapcorrcoef(x,swcf_ts,v.nlat,v.nlon);
x=squeeze(v1.ar.ttcf_av_ann);    ttcf_ts   =mean(mean(x.*aa,3),2);
[ttcf_corr]=mapcorrcoef(x,ttcf_ts,v.nlat,v.nlon);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x=squeeze(v1.ar.lwcf_av_ann);    lwcf_ts   =mean(mean(x.*aa,3),2);
x=squeeze(v1.ar.swcf_av_ann);    swcf_ts   =mean(mean(x.*aa,3),2);
x=squeeze(v1.ar.ttcf_av_ann);    ttcf_ts   =mean(mean(x.*aa,3),2);
x=squeeze(v1.ar.lwcf_idwei_ann); lwcf_ts_ar=mean(mean(x.*aa,3),2);
x=squeeze(v1.ar.swcf_idwei_ann); swcf_ts_ar=mean(mean(x.*aa,3),2);
x=squeeze(v1.ar.ttcf_idwei_ann); ttcf_ts_ar=mean(mean(x.*aa,3),2);
x=squeeze(v1.tc.lwcf_idwei_ann); lwcf_ts_tc=mean(mean(x.*aa,3),2);
x=squeeze(v1.tc.swcf_idwei_ann); swcf_ts_tc=mean(mean(x.*aa,3),2);
x=squeeze(v1.tc.ttcf_idwei_ann); ttcf_ts_tc=mean(mean(x.*aa,3),2);
x=squeeze(v1.td.lwcf_idwei_ann); lwcf_ts_td=mean(mean(x.*aa,3),2);
x=squeeze(v1.td.swcf_idwei_ann); swcf_ts_td=mean(mean(x.*aa,3),2);
x=squeeze(v1.td.ttcf_idwei_ann); ttcf_ts_td=mean(mean(x.*aa,3),2);
x=squeeze(v1.mc.lwcf_idwei_ann); lwcf_ts_mc=mean(mean(x.*aa,3),2);
x=squeeze(v1.mc.swcf_idwei_ann); swcf_ts_mc=mean(mean(x.*aa,3),2);
lwcf_ts_all=lwcf_ts_ar+lwcf_ts_tc+lwcf_ts_td+lwcf_ts_mc;
swcf_ts_all=swcf_ts_ar+swcf_ts_tc+swcf_ts_td+swcf_ts_mc;
ttcf_ts_all=ttcf_ts_ar+ttcf_ts_tc+ttcf_ts_td+ttcf_ts_mc;
lwcf_corr=mapcorrcoef(lwcf_ts_all,lwcf_tsy,nlat,nlon)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
aa=repmat(v1.ar.aa,[1 1 100]); aa=shiftdim(aa,2);
x=squeeze(v1.ar.lwcf_av_ann);    lwcf_lat   =mean(x,3);
x=squeeze(v1.ar.swcf_av_ann);    swcf_lat   =mean(x,3);
x=squeeze(v1.ar.ttcf_av_ann);    ttcf_lat   =mean(x,3);
x=squeeze(v1.ar.lwcf_idwei_ann); lwcf_lat_ar=mean(x,3);
x=squeeze(v1.ar.swcf_idwei_ann); swcf_lat_ar=mean(x,3);
x=squeeze(v1.ar.ttcf_idwei_ann); ttcf_lat_ar=mean(x,3);
x=squeeze(v1.tc.lwcf_idwei_ann); lwcf_lat_tc=mean(x,3);
x=squeeze(v1.tc.swcf_idwei_ann); swcf_lat_tc=mean(x,3);
x=squeeze(v1.tc.ttcf_idwei_ann); ttcf_lat_tc=mean(x,3);
x=squeeze(v1.td.lwcf_idwei_ann); lwcf_lat_td=mean(x,3);
x=squeeze(v1.td.swcf_idwei_ann); swcf_lat_td=mean(x,3);
x=squeeze(v1.td.ttcf_idwei_ann); ttcf_lat_td=mean(x,3);
x=squeeze(v1.mc.lwcf_idwei_ann); lwcf_lat_mc=mean(x,3);
x=squeeze(v1.mc.swcf_idwei_ann); swcf_lat_mc=mean(x,3);
x=squeeze(v1.mc.ttcf_idwei_ann); ttcf_lat_mc=mean(x,3);
lwcf_lat_all=lwcf_lat_ar+lwcf_lat_tc+lwcf_lat_td+lwcf_lat_mc;
swcf_lat_all=swcf_lat_ar+swcf_lat_tc+swcf_lat_td+swcf_lat_mc;
ttcf_lat_all=ttcf_lat_ar+ttcf_lat_tc+ttcf_lat_td+ttcf_lat_mc;
lwcf_corr_all=mapcorrcoef(lwcf_lat_all,lwcf_lat,v.nlat,v.nlon);
lwcf_corr_ar =mapcorrcoef(lwcf_lat_ar, lwcf_lat,v.nlat,v.nlon);
lwcf_corr_tc =mapcorrcoef(lwcf_lat_tc, lwcf_lat,v.nlat,v.nlon);
lwcf_corr_td =mapcorrcoef(lwcf_lat_td, lwcf_lat,v.nlat,v.nlon);
lwcf_corr_mc =mapcorrcoef(lwcf_lat_mc, lwcf_lat,v.nlat,v.nlon);
swcf_corr_all=mapcorrcoef(swcf_lat_all,swcf_lat,v.nlat,v.nlon);
swcf_corr_ar =mapcorrcoef(swcf_lat_ar, swcf_lat,v.nlat,v.nlon);
swcf_corr_tc =mapcorrcoef(swcf_lat_tc, swcf_lat,v.nlat,v.nlon);
swcf_corr_td =mapcorrcoef(swcf_lat_td, swcf_lat,v.nlat,v.nlon);
swcf_corr_mc =mapcorrcoef(swcf_lat_mc, swcf_lat,v.nlat,v.nlon);
ttcf_corr_all=mapcorrcoef(ttcf_lat_all,ttcf_lat,v.nlat,v.nlon);
ttcf_corr_ar =mapcorrcoef(ttcf_lat_ar, ttcf_lat,v.nlat,v.nlon);
ttcf_corr_tc =mapcorrcoef(ttcf_lat_tc, ttcf_lat,v.nlat,v.nlon);
ttcf_corr_td =mapcorrcoef(ttcf_lat_td, ttcf_lat,v.nlat,v.nlon);
ttcf_corr_mc =mapcorrcoef(ttcf_lat_mc, ttcf_lat,v.nlat,v.nlon);
figure; 
plot(v.lat,lwcf_corr_all,'k','LineWidth',2); hold on;
plot(v.lat,lwcf_corr_ar, 'r'); 
plot(v.lat,lwcf_corr_tc, 'g'); 
plot(v.lat,lwcf_corr_td, 'c'); 
plot(v.lat,lwcf_corr_mc, 'b'); 
figure; 
plot(v.lat,swcf_corr_all,'k','LineWidth',2); hold on;
plot(v.lat,swcf_corr_ar, 'r'); 
plot(v.lat,swcf_corr_tc, 'g'); 
plot(v.lat,swcf_corr_td, 'c'); 
plot(v.lat,swcf_corr_mc, 'b'); 
figure; 
plot(v.lat,ttcf_corr_all,'k','LineWidth',2); hold on;
plot(v.lat,ttcf_corr_ar, 'r'); 
plot(v.lat,ttcf_corr_tc, 'g'); 
plot(v.lat,ttcf_corr_td, 'c'); 
plot(v.lat,ttcf_corr_mc, 'b'); 
figure; 
plot(v.lat,lwcf_corr_all,'r','LineWidth',2); hold on;
plot(v.lat,swcf_corr_all,'g','LineWidth',2); hold on;
plot(v.lat,ttcf_corr_all,'b','LineWidth',2); hold on;



x=squeeze(v1.mc.ttcf_idwei_ann); ttcf_ts_mc=mean(mean(x.*aa,3),2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y =squeeze(v1.ar.lwcf_av_ts_day);    [ya, yaa, y_clim, ya_clim] =getclim(y);
x1=squeeze(v1.ar.lwcf_idwei_ts_day); [x1a,x1aa,x1_clim,x1a_clim]=getclim(x1);
x2=squeeze(v1.tc.lwcf_idwei_ts_day); [x2a,x2aa,x2_clim,x2a_clim]=getclim(x2);
x3=squeeze(v1.td.lwcf_idwei_ts_day); [x3a,x3aa,x3_clim,x3a_clim]=getclim(x3);
x4=squeeze(v1.mc.lwcf_idwei_ts_day); [x4a,x4aa,x4_clim,x4a_clim]=getclim(x4);
x=x1+x2+x3+x4; [xa,xaa,x_clim,xa_clim]=getclim(x); ws=1; t=[1:365]/30;
figure; plot(x1aa,yaa,'.'); mizcorrcoef(x1aa,yaa,ws);%figure; plot(x1,y,'.');
figure; plot(x2aa,yaa,'.'); mizcorrcoef(x2aa,yaa,ws);%figure; plot(x2,y,'.');
figure; plot(x3aa,yaa,'.'); mizcorrcoef(x3aa,yaa,ws);%figure; plot(x3,y,'.');
figure; plot(x4aa,yaa,'.'); mizcorrcoef(x4aa,yaa,ws);%figure; plot(x4,y,'.');
figure; plot(xaa, yaa,'.'); mizcorrcoef(xaa, yaa,ws);%figure; plot(x,y,'.');
figure; plot(t,ya_clim,'k','LineWidth',2); hold on; plot(t,xa_clim,'r','LineWidth',2); 
plot(t,x1a_clim,'r'); plot(t,x2a_clim,'g'); plot(t,x3a_clim,'c'); plot(t,x4a_clim,'b'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y =squeeze(v1.ar.swcf_av_ts_day);    [ya, yaa, y_clim, ya_clim] =getclim(y);
x1=squeeze(v1.ar.swcf_idwei_ts_day); [x1a,x1aa,x1_clim,x1a_clim]=getclim(x1);
x2=squeeze(v1.tc.swcf_idwei_ts_day); [x2a,x2aa,x2_clim,x2a_clim]=getclim(x2);
x3=squeeze(v1.td.swcf_idwei_ts_day); [x3a,x3aa,x3_clim,x3a_clim]=getclim(x3);
x4=squeeze(v1.mc.swcf_idwei_ts_day); [x4a,x4aa,x4_clim,x4a_clim]=getclim(x4);
x=x1+x2+x3+x4; [xa,xaa,x_clim,xa_clim]=getclim(x); ws=1; t=[1:365]/30;
figure; plot(x1aa,yaa,'.'); mizcorrcoef(x1aa,yaa,ws);%figure; plot(x1,y,'.');
figure; plot(x2aa,yaa,'.'); mizcorrcoef(x2aa,yaa,ws);%figure; plot(x2,y,'.');
figure; plot(x3aa,yaa,'.'); mizcorrcoef(x3aa,yaa,ws);%figure; plot(x3,y,'.');
figure; plot(x4aa,yaa,'.'); mizcorrcoef(x4aa,yaa,ws);%figure; plot(x4,y,'.');
figure; plot(xaa, yaa,'.'); mizcorrcoef(xaa, yaa,ws);%figure; plot(x,y,'.');
figure; plot(t,ya_clim,'k','LineWidth',2); hold on; plot(t,xa_clim,'r','LineWidth',2); 
plot(t,x1a_clim,'r'); plot(t,x2a_clim,'g'); plot(t,x3a_clim,'c'); plot(t,x4a_clim,'b'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y =squeeze(v1.mc.ttcf_av_ts_day);    [ya, yaa, y_clim, ya_clim] =getclim(y);
x1=squeeze(v1.ar.ttcf_idwei_ts_day); [x1a,x1aa,x1_clim,x1a_clim]=getclim(x1);
x2=squeeze(v1.tc.ttcf_idwei_ts_day); [x2a,x2aa,x2_clim,x2a_clim]=getclim(x2);
x3=squeeze(v1.td.ttcf_idwei_ts_day); [x3a,x3aa,x3_clim,x3a_clim]=getclim(x3);
x4=squeeze(v1.mc.ttcf_idwei_ts_day); [x4a,x4aa,x4_clim,x4a_clim]=getclim(x4);
x=x1+x2+x3+x4; [xa,xaa,x_clim,xa_clim]=getclim(x); ws=1; t=[1:365]/30;
figure; plot(x1aa,yaa,'.'); mizcorrcoef(x1aa,yaa,ws);%figure; plot(x1,y,'.');
figure; plot(x2aa,yaa,'.'); mizcorrcoef(x2aa,yaa,ws);%figure; plot(x2,y,'.');
figure; plot(x3aa,yaa,'.'); mizcorrcoef(x3aa,yaa,ws);%figure; plot(x3,y,'.');
figure; plot(x4aa,yaa,'.'); mizcorrcoef(x4aa,yaa,ws);%figure; plot(x4,y,'.');
figure; plot(xaa, yaa,'.'); mizcorrcoef(xaa, yaa,ws);%figure; plot(x,y,'.');
figure; plot(t,ya_clim,'k','LineWidth',2); hold on; plot(t,xa_clim,'r','LineWidth',2); 
plot(t,x1a_clim,'r'); plot(t,x2a_clim,'g'); plot(t,x3a_clim,'c'); plot(t,x4a_clim,'b'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


y =squeeze(v1.ar.swcf_av_ts_day);    y =y -mean(y); [y_clim,ya] =getclim(y);
x1=squeeze(v1.ar.swcf_idwei_ts_day); x1=x1-mean(x1);[x1_clim,x1a]=getclim(x1);
x2=squeeze(v1.tc.swcf_idwei_ts_day); x2=x2-mean(x2);[x2_clim,x2a]=getclim(x2);
x3=squeeze(v1.td.swcf_idwei_ts_day); x3=x3-mean(x3);[x3_clim,x3a]=getclim(x3);
x4=squeeze(v1.mc.swcf_idwei_ts_day); x4=x4-mean(x4);[x4_clim,x4a]=getclim(x4);
x=x1+x2+x3+x4; [xa,xaa,x_clim,xa_clim]=getclim(x); ws=1; t=[1:365]/30;
figure; plot(x1aa,yaa,'.'); mizcorrcoef(x1aa,yaa,ws);%figure; plot(x1,y,'.');
figure; plot(x2aa,yaa,'.'); mizcorrcoef(x2aa,yaa,ws);%figure; plot(x2,y,'.');
figure; plot(x3aa,yaa,'.'); mizcorrcoef(x3aa,yaa,ws);%figure; plot(x3,y,'.');
figure; plot(x4aa,yaa,'.'); mizcorrcoef(x4aa,yaa,ws);%figure; plot(x4,y,'.');
figure; plot(xaa, yaa,'.'); mizcorrcoef(xaa, yaa,ws);%figure; plot(x,y,'.');
figure; plot(t,ya_clim,'k','LineWidth',2); hold on; plot(t,xa_clim,'r','LineWidth',2); 
plot(t,x1a_clim,'r'); plot(t,x2a_clim,'g'); plot(t,x3a_clim,'c'); plot(t,x4a_clim,'b'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x=x1+x2+x3+x4; [x_clim,xa]=getclim(x); ws=1; t=[1:365];
figure; plot(x1a,ya,'.'); [xa1,ya]=mizcorrcoef(x1a,ya,ws);%figure; plot(x1,y,'.');
figure; plot(x2a,ya,'.'); [xa2,ya]=mizcorrcoef(x2a,ya,ws);%figure; plot(x2,y,'.');
figure; plot(x3a,ya,'.'); [xa3,ya]=mizcorrcoef(x3a,ya,ws);%figure; plot(x3,y,'.');
figure; plot(x4a,ya,'.'); [xa4,ya]=mizcorrcoef(x4a,ya,ws);%figure; plot(x4,y,'.');
figure; plot(xa, ya,'.'); [xa, ya]=mizcorrcoef(xa, ya,ws);%figure; plot(x,y,'.');
figure; plot(t,y_clim,'k','LineWidth',2); hold on; plot(t,x_clim,'r','LineWidth',2); 
plot(t,x1_clim,'r'); plot(t,x2_clim,'g'); plot(t,x3_clim,'c'); plot(t,x4_clim,'b'); 


y =squeeze(v1.ar.swcf_av_ts_day);    y =y -mean(y);[yclim,ya]=getclim(y);
x1=squeeze(v1.ar.swcf_idwei_ts_day); x1=x1-mean(x1);
x2=squeeze(v1.tc.swcf_idwei_ts_day); x2=x2-mean(x2);
x3=squeeze(v1.td.swcf_idwei_ts_day); x3=x3-mean(x3);
x4=squeeze(v1.mc.swcf_idwei_ts_day); x4=x4-mean(x4);
x=x1+x2+x3+x4; x_clim=getclim(x); ws=1; t=[1:365];
figure; plot(x1,y,'.'); [x1,y]=mizcorrcoef(x1,y,ws);figure; plot(x1,y,'.');
figure; plot(x2,y,'.'); [x2,y]=mizcorrcoef(x2,y,ws);figure; plot(x2,y,'.');
figure; plot(x3,y,'.'); [x3,y]=mizcorrcoef(x3,y,ws);figure; plot(x3,y,'.');
figure; plot(x4,y,'.'); [x4,y]=mizcorrcoef(x4,y,ws);figure; plot(x4,y,'.');
figure; plot(x, y,'.'); [x, y]=mizcorrcoef(x, y,ws);figure; plot(x,y,'.');
figure; plot(t,y_clim); hold on; plot(t,x_clim); 
plot(t,x1_clim); plot(t,x2_clim); plot(t,x3_clim); plot(t,x4_clim); 

y=squeeze(v1.ar.lwcf_av_ts_day); y=y-mean(y);yclim=getclim(y);
figure; plot(t,yclim);


figure; plot(x,y,'.'); corrcoef(x,y)
figure; plot(x-mean(x)); hold on; plot(y-mean(y),'r'); 

y=squeeze(v1.ar.ttcf_av_ts_day);
x=squeeze(v1.ar.ttcf_idwei_ts_day+...
	  v1.tc.ttcf_idwei_ts_day+...
	  v1.td.ttcf_idwei_ts_day+...
	  v1.mc.ttcf_idwei_ts_day);
figure; plot(x,y,'.'); corrcoef(x,y)

figure; plot(x-mean(x)); hold on; plot(y-mean(y),'r'); 



y=squeeze(v1.ar.lwcf_av_ann);
x=squeeze(v1.ar.lwcf_idwei_ann+v1.tc.lwcf_idwei_ann+v1.td.lwcf_idwei_ann+v1.mc.lwcf_idwei_ann);

y=squeeze(v1.ar.swcf_av_ann);
x=squeeze(v1.ar.swcf_idwei_ann+v1.tc.swcf_idwei_ann+v1.td.swcf_idwei_ann+v1.mc.swcf_idwei_ann);

y=squeeze(v1.ar.ttcf_av_ann);
x=squeeze(v1.ar.ttcf_idwei_ann+v1.tc.ttcf_idwei_ann+v1.td.ttcf_idwei_ann+v1.mc.ttcf_idwei_ann);

x_ann0=squeeze(mean(x,1)); y_ann0=squeeze(mean(y,1));
aa=v.aa; nt=length(x(:,1,1));
for t=1:nt
  x0=squeeze(x(t,:,:)); x_ann(t)=mean(mean(x0.*aa));
  y0=squeeze(y(t,:,:)); y_ann(t)=mean(mean(y0.*aa));
end
corrcoef(x_ann,y_ann)
figure; 
plot(y_ann-mean(y_ann)); hold on; 
plot(x_ann-mean(x_ann),'r');

plot((y_ann-mean(y_ann))/mean(y_ann)); hold on; 
plot((x_ann-mean(x_ann))/mean(x_ann),'r');

for j=1:240
  for i=1:480
    x0=squeeze(x(:,j,i)); 
    y0=squeeze(y(:,j,i)); 
    c=corrcoef(x0,y0);   corr(j,i)=c(1,2);
    %c=polyfit (x0,y0,1); slop(j,i)=c(1);
  end
end

figure; corr(corr<0.3)=NaN;
pcolor(v.lon,v.lat,corr); shading flat; colorbar; hold on; caxis([-0.8 0.8]); 
colormap(jet); contour(v.lon,v.lat,v.lm,'k');

figure; 
pcolor(v.lon,v.lat,slop); shading flat; colorbar; hold on; caxis([0 0.8]); 
colormap(jet); contour(v.lon,v.lat,v.lm,'k');


corrcoef(p.z1,p.z6);
j1=1;   j2=60;  figure; plot(p.z1(j1:j2,:),p.z6(j1:j2,:),'.');
j1=61;  j2=120; figure; plot(p.z1(j1:j2,:),p.z6(j1:j2,:),'.');
j1=121; j2=180; figure; plot(p.z1(j1:j2,:),p.z6(j1:j2,:),'.');
j1=181; j2=240; figure; plot(p.z1(j1:j2,:),p.z6(j1:j2,:),'.');

figure; pcolor(p.z6(j1:j2,:)); shading flat; colorbar;
id=(p.z6<-30) | (v.lm==1); id=v.lm==0;

id=(p.z6>-35 & p.z6<-25) & (v.lm==0); %id=(v.lm==1);
figure; pcolor(id); shading flat; colorbar;
x=p.z6(id); y=p.z1(id); c=polyfit(x,y,1); xm=[-100:10:0]; ym=xm*c(1)+c(2);c
figure; plot(x,y,'.'); hold on; plot(xm,ym,'r'); corrcoef(x,y)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 6: annual mean total CRE contributed from AR/TS/TD/MSC %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %all time mean swcf from each weather type
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='ttcf_idwei';p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=2;p.nn=128; p.c='k';
v=v1.ar; p.z1=squeeze(v.swcf_av+v.lwcf_av);
v=v1.ar; p.z2=squeeze(v.swcf_idwei+v.lwcf_idwei);
v=v1.tc; p.z3=squeeze(v.swcf_idwei+v.lwcf_idwei);
v=v1.td; p.z4=squeeze(v.swcf_idwei+v.lwcf_idwei);
v=v1.mc; p.z5=squeeze(v.swcf_idwei+v.lwcf_idwei);
p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) total CRE';
p.s2='(c) total CRE from AR'; 
p.s3='(d) total CRE from TS'; 
p.s4='(e) total CRE from TD'; 
p.s5='(f) total CRE from MCS';
p.s6='(b) total CRE from AR+TS+TD+MCS'; p.s0='';
p.c1=[-100 100]; a=[-20 20]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=p.c1*0.4;
plot_2d_6panel(p);
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
%Fig 8: LW CRE averaged only over AR/TS/TD/MSC days%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; %weather type mean lwcf
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='lwcf_idavg';p.xy=[0 360 -90 90]; 
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1]; p.opt=4;p.nn=128; p.c='k';
p.z1=squeeze(v1.ar.lwcf_av); p.z0=p.z1; no=30;
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
p.s1='(a) annual mean LW CRE (W/m2)';
p.s2='(c) LW CRE averaged over AR days'; 
p.s3='(d) LW CRE averaged over TS days'; 
p.s4='(e) LW CRE averaged over TD days'; 
p.s5='(f) LW CRE averaged over MCS days';
p.s6='(b) LW CRE averaged over AR+TS+TD+MCS days'; p.s0='';
p.c1=[-100 100]; a=[-100 100]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) LW CRE averaged over AR days'; 
p.s3='(b) LW CRE averaged over TS days'; 
p.s4='(c) LW CRE averaged over TD days'; 
p.s5='(d) LW CRE averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 9: SW CRE averaged only over AR/TS/TD/MSC days%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl';
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='swcf_idavg';p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1];p.opt=4;p.nn=128; p.c='k';
p.z1=squeeze(v1.ar.swcf_av); p.z0=p.z1; no=30;
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
p.s1='(a) annual mean SW CRE (W/m2)';
p.s2='(c) SW CRE averaged over AR days'; 
p.s3='(d) SW CRE averaged over TS days'; 
p.s4='(e) SW CRE averaged over TD days'; 
p.s5='(f) SW CRE averaged over MCS days';
p.s6='(b) SW CRE averaged over AR+TS+TD+MCS days'; p.s0='';
p.c1=[-200 200]; a=[-200 200]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) SW CRE averaged over AR days'; 
p.s3='(b) SW CRE averaged over TS days'; 
p.s4='(c) SW CRE averaged over TD days'; 
p.s5='(d) SW CRE averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 10: Total CRE averaged only over AR/TS/TD/MSC days%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=v1.ar; p.expn='ctl'; 
p.lm=v.lm; p.x=v.lon; p.y=v.lat; p.vname='ttcf_idavg';p.xy=[0 360 -90 90];
lat0=-30; p.j1=max(find(v.lat<-lat0)); p.j2=min(find(v.lat>lat0));
p.aa=squeeze(v1.ar.aa); p.id=~isnan(p.aa); p.id(p.j1:p.j2,:)=0; id=p.id;
p.cm=[0 0.0005 0.001 0.002 0.01:0.02:0.08 0.1:0.05:1];p.opt=4;p.nn=128; p.c='k';
p.z1=squeeze(v1.ar.swcf_av+v1.ar.lwcf_av); p.z0=p.z1; no=30;
v=v1.ar; p.z2=squeeze(v.swcf_idavg+v.lwcf_idavg); n=squeeze(v.id_sum); p.z2(n<no)=NaN;
v=v1.tc; p.z3=squeeze(v.swcf_idavg+v.lwcf_idavg); n=squeeze(v.id_sum); p.z3(n<no)=NaN;
v=v1.td; p.z4=squeeze(v.swcf_idavg+v.lwcf_idavg); n=squeeze(v.id_sum); p.z4(n<no)=NaN;
v=v1.mc; p.z5=squeeze(v.swcf_idavg+v.lwcf_idavg); n=squeeze(v.id_sum); p.z5(n<no)=NaN;
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
clear a; a(:,:,1)=p.z2; a(:,:,2)=p.z3; a(:,:,3)=p.z4; a(:,:,4)=p.z5;
p.z6=nanmean(a,3); %p.z6=p.z2+p.z3+p.z4+p.z5; p.z0=p.z6;
p=smoothp(p,1,1,'omitnan','shrink');
p.s1='(a) annual mean total CRE (W/m2)';
p.s2='(c) total CRE averaged over AR days'; 
p.s3='(d) total CRE averaged over TS days'; 
p.s4='(e) total CRE averaged over TD days'; 
p.s5='(f) total CRE averaged over MCS days';
p.s6='(b) total CRE averaged over AR+TS+TD+MCS days'; p.s0='';
p.c1=[-100 100]; a=[-100 100]; p.c2=a; p.c3=a; p.c4=a; p.c5=a; p.c6=a;
plot_2d_6panel(p)
p.s2='(a) total CRE averaged over AR days'; 
p.s3='(b) total CRE averaged over TS days'; 
p.s4='(c) total CRE averaged over TD days'; 
p.s5='(d) total CRE averaged over MCS days';
plot_2d_4panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
