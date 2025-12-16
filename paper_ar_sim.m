tpath='/archive/Ming.Zhao/backup/ECMWF/';
expn='ERAI_6h_DATA'; ardir='AR_climlmt'; yr1=1979;yr2=2014;
opt='obs'; v=readarmap_sim(tpath,expn,yr1,yr2,ardir,opt);
           v=readar_limit (tpath,expn,yr1,yr2,ardir,opt);
opt=1;     v=readar_all   (tpath,expn,yr1,yr2,ardir,opt);

tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; ardir='AR_climlmt';yr1=1979;yr2=2014;
opt='mod'; v=readarmap_sim(tpath,expn,yr1,yr2,ardir,opt);
           v=readar_limit (tpath,expn,yr1,yr2,ardir,opt);
opt=1;     v=readar_all   (tpath,expn,yr1,yr2,ardir,opt);

tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp'; ardir='AR_cclilmt'; yr1=2015;yr2=2050;
opt='mod'; v=readarmap_sim(tpath,expn,yr1,yr2,ardir,opt);
           v=readar_limit (tpath,expn,yr1,yr2,ardir,opt);
opt=1;     v=readar_all   (tpath,expn,yr1,yr2,ardir,opt);

tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_3'; ardir='AR_climlmt'; yr1=2015;yr2=2050;
opt='mod'; v=readarmap_sim(tpath,expn,yr1,yr2,ardir,opt);
           v=readar_limit(tpath,expn,yr1,yr2,ardir,opt);
opt=1;     v=readar_all(tpath,expn,yr1,yr2,ardir,opt);

tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_3'; ardir='AR_cclilmt'; yr1=2015;yr2=2050;
opt='mod'; v=readarmap_sim(tpath,expn,yr1,yr2,ardir,opt);
           v=readar_limit(tpath,expn,yr1,yr2,ardir,opt);
opt=1;     v=readar_all(tpath,expn,yr1,yr2,ardir,opt);


tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
expn='c192L33_am4p0_2010climo_new_newpp'; ardir='AR_climlmt'; yr1=2;yr2=31;
opt='mod'; v=readarmap_sim(tpath,expn,yr1,yr2,ardir,opt);
           v=readar_limit (tpath,expn,yr1,yr2,ardir,opt);
opt=1;     v=readar_all   (tpath,expn,yr1,yr2,ardir,opt); 

tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
expn='c192L33_am4p0_2010climo_new_p4K_newpp'; ardir='AR_cclilmt'; yr1=2;yr2=31;
opt='mod'; v=readarmap_sim(tpath,expn,yr1,yr2,ardir,opt);
           v=readar_limit(tpath,expn,yr1,yr2,ardir,opt);
opt=1;     v=readar_all  (tpath,expn,yr1,yr2,ardir,opt); 

tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
expn='c192L33_am4p0_2010climo_new_p4K_newpp'; ardir='AR_climlmt'; yr1=2;yr2=31;
opt='mod'; v=readarmap_sim(tpath,expn,yr1,yr2,ardir,opt);
           v=readar_limit (tpath,expn,yr1,yr2,ardir,opt);
opt=1;     v=readar_all   (tpath,expn,yr1,yr2,ardir,opt); 

tpath='/archive/Ming.Zhao/awg/warsaw_201803/'; ardir='AR';
expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp_lres'; yr1=1979;yr2=2014;
opt='mod'; v =readarmap_sim(tpath,expn,yr1,yr2,ardir,opt);
           vx=readar_limit (tpath,expn,yr1,yr2,ardir,opt);
opt=1;     v =readar_all(tpath,expn,yr1,yr2,ardir,opt);


tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn='c192L33_am4p0_amip_HIRESMIP_H8'; yr1=1950;yr2=1978;
opt='mod'; v=readarmap_sim(tpath,expn,yr1,yr2,opt);
           vx=readar_limit(tpath,expn,yr1,yr2,opt)
opt=1;     v=readar_all(tpath,expn,yr1,yr2,opt);

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn='c192L33_am4p0_amip_HIRESMIP_H8'; yr1=1979;yr2=2014;
opt='mod'; v=readarmap_sim(tpath,expn,yr1,yr2,opt);
opt=1;     v=readar_all(tpath,expn,yr1,yr2,opt);

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_2'; yr1=2015;yr2=2050;
opt='mod'; v=readarmap_sim(tpath,expn,yr1,yr2,opt);
opt=1;     v=readar_all(tpath,expn,yr1,yr2,opt);

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn='c192L33_am4p0_2010climo_new_newpp'; yr1=2;yr2=31;
opt='mod'; v=readarmap_sim(tpath,expn,yr1,yr2,opt);
opt=1;     v=readar_all(tpath,expn,yr1,yr2,opt); 

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn='c192L33_am4p0_2010climo_new_p4K';  yr1=2;yr2=31;
opt='mod'; v=readarmap_sim(tpath,expn,yr1,yr2,opt);
opt=1;     v=readar_all(tpath,expn,yr1,yr2,opt); 

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn='c192L33_am4p0_2010climo_new_4xCO2';yr1=2;yr2=31;
opt='mod'; v=readarmap_sim(tpath,expn,yr1,yr2,opt);
opt=1;     v=readar_all(tpath,expn,yr1,yr2,opt); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ tpath='/work/miz/mat_AR/';
% $$$ expn='ERAI_6h_DATA'; 
% $$$ fext='_1979_2014_readarmap_sim1.mat'; fn=strcat(tpath,expn,fext); load(fn);vo=v;
% $$$ fext='_AR_1979_2014_saveopt1.mat';    fn=strcat(tpath,expn,fext); load(fn);vo.ar=v.ar;
% $$$ fext='_1979_2014_readar_limit.mat';   fn=strcat(tpath,expn,fext); load(fn);vo.limit=v;
% $$$ 
% $$$ expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; ardir='AR';
% $$$ fext='_1979_2014_readarmap_sim1.mat';         fn=strcat(tpath,expn,fext); load(fn);vm=v;
% $$$ fext='_AR_1979_2014_saveopt1_readar_all.mat'; fn=strcat(tpath,expn,fext); load(fn);vm.ar=v.ar;
% $$$ fext='_1979_2014_AR_readar_limit.mat';        fn=strcat(tpath,expn,fext); load(fn);vm.limit=v;
% $$$ 
% $$$ expn='c192L33_am4p0_2010climo_new_newpp';
% $$$ fext='_2_31_readarmap_sim1.mat';              fn=strcat(tpath,expn,fext); load(fn);v1=v;
% $$$ fext='_AR_2_31_saveopt1_readar_all.mat';      fn=strcat(tpath,expn,fext); load(fn);v1.ar=v.ar;
% $$$ fext='_2_31_AR_readar_limit.mat';             fn=strcat(tpath,expn,fext); load(fn);v1.limit=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%New Analysis using AR_climlmt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_AR/';
expn='ERAI_6h_DATA';  yrs='_1979_2014_';ardir='AR_climlmt'
fext=strcat(yrs,ardir,'_readarmap_sim1.mat');               fn=strcat(tpath,expn,fext); load(fn);vo=v;
fext=strcat(yrs,ardir,'_readar_limit.mat');                 fn=strcat(tpath,expn,fext); load(fn);vo.limit=v;
fext=strcat('_AR',yrs,'saveopt1_',ardir,'_readar_all.mat'); fn=strcat(tpath,expn,fext); load(fn);vo.ar=v.ar;

expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; yrs='_1979_2014_';ardir='AR_climlmt'
fext=strcat(yrs,ardir,'_readarmap_sim1.mat');               fn=strcat(tpath,expn,fext); load(fn);vm=v;
fext=strcat(yrs,ardir,'_readar_limit.mat');                 fn=strcat(tpath,expn,fext); load(fn);vm.limit=v;
fext=strcat('_AR',yrs,'saveopt1_',ardir,'_readar_all.mat'); fn=strcat(tpath,expn,fext); load(fn);vm.ar=v.ar;

expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp';yrs='_2015_2050_';ardir='AR_climlmt';
fext=strcat(yrs,ardir,'_readarmap_sim1.mat');               fn=strcat(tpath,expn,fext); load(fn);wm=v;
fext=strcat(yrs,ardir,'_readar_limit.mat');                 fn=strcat(tpath,expn,fext); load(fn);wm.limit=v;
fext=strcat('_AR',yrs,'saveopt1_',ardir,'_readar_all.mat'); fn=strcat(tpath,expn,fext); load(fn);wm.ar=v.ar;

expn='c192L33_am4p0_2010climo_new_newpp'; yrs='_2_31_';ardir='AR_climlmt'
fext=strcat(yrs,ardir,'_readarmap_sim1.mat');               fn=strcat(tpath,expn,fext); load(fn);v1=v;
fext=strcat(yrs,ardir,'_readar_limit.mat');                 fn=strcat(tpath,expn,fext); load(fn);v1.limit=v;
fext=strcat('_AR',yrs,'saveopt1_',ardir,'_readar_all.mat'); fn=strcat(tpath,expn,fext); load(fn);v1.ar=v.ar;

expn='c192L33_am4p0_2010climo_new_p4K_newpp'; yrs='_2_31_';ardir='AR_climlmt';
fext=strcat(yrs,ardir,'_readarmap_sim1.mat');               fn=strcat(tpath,expn,fext); load(fn);w1=v;
fext=strcat(yrs,ardir,'_readar_limit.mat');                 fn=strcat(tpath,expn,fext); load(fn);w1.limit=v;
fext=strcat('_AR',yrs,'saveopt1_',ardir,'_readar_all.mat'); fn=strcat(tpath,expn,fext); load(fn);w1.ar=v.ar;

expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp'; yrs='_2015_2050_';ardir='AR_cclilmt';
fext=strcat(yrs,ardir,'_readarmap_sim1.mat');               fn=strcat(tpath,expn,fext); load(fn);wm2=v;
fext=strcat(yrs,ardir,'_readar_limit.mat');                 fn=strcat(tpath,expn,fext); load(fn);wm2.limit=v;
fext=strcat('_AR',yrs,'saveopt1_',ardir,'_readar_all.mat'); fn=strcat(tpath,expn,fext); load(fn);wm2.ar=v.ar;

expn='c192L33_am4p0_2010climo_new_p4K_newpp'; yrs='_2_31_';ardir='AR_cclilmt';
fext=strcat(yrs,ardir,'_readarmap_sim1.mat');               fn=strcat(tpath,expn,fext); load(fn);w2=v;
fext=strcat(yrs,ardir,'_readar_limit.mat');                 fn=strcat(tpath,expn,fext); load(fn);w2.limit=v;
fext=strcat('_AR',yrs,'saveopt1_',ardir,'_readar_all.mat'); fn=strcat(tpath,expn,fext); load(fn);w2.ar=v.ar;

%addition experiments and sensitivity test
expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_3'; yrs='_2015_2050_';ardir='AR_climlmt';
fext=strcat(yrs,ardir,'_readarmap_sim1.mat');               fn=strcat(tpath,expn,fext); load(fn);wm3=v;
fext=strcat(yrs,ardir,'_readar_limit.mat');                 fn=strcat(tpath,expn,fext); load(fn);wm3.limit=v;
fext=strcat('_AR',yrs,'saveopt1_',ardir,'_readar_all.mat'); fn=strcat(tpath,expn,fext); load(fn);wm3.ar=v.ar;

expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_3'; yrs='_2015_2050_';ardir='AR_cclilmt';
fext=strcat(yrs,ardir,'_readarmap_sim1.mat');               fn=strcat(tpath,expn,fext); load(fn);wm4=v;
fext=strcat(yrs,ardir,'_readar_limit.mat');                 fn=strcat(tpath,expn,fext); load(fn);wm4.limit=v;
fext=strcat('_AR',yrs,'saveopt1_',ardir,'_readar_all.mat'); fn=strcat(tpath,expn,fext); load(fn);wm4.ar=v.ar;

expn='c192L33_am4p0_amip_HIRESMIP_H8_newpp_lres'; yrs='_1979_2014_';ardir='AR'
fext=strcat(yrs,ardir,'_readarmap_sim1.mat');               fn=strcat(tpath,expn,fext); load(fn);vm1=v;
fext=strcat(yrs,ardir,'_readar_limit.mat');                 fn=strcat(tpath,expn,fext); load(fn);vm1.limit=v;
fext=strcat('_AR',yrs,'saveopt1_',ardir,'_readar_all.mat'); fn=strcat(tpath,expn,fext); load(fn);vm1.ar=v.ar;

%expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp';
%fext='_2015_2050_readarmap_sim1.mat';         fn=strcat(tpath,expn,fext); load(fn);wm=v;
%fext='_AR_2015_2050_saveopt1_readar_all.mat'; fn=strcat(tpath,expn,fext); load(fn);wm.ar=v.ar;
%fext='_2015_2050_AR_readar_limit.mat';        fn=strcat(tpath,expn,fext); load(fn);wm.limit=v;
%expn='c192L33_am4p0_2010climo_new_p4K_newpp';
%fext='_2_31_readarmap_sim1.mat';              fn=strcat(tpath,expn,fext); load(fn);w1=v;
%fext='_AR_2_31_saveopt1_readar_all.mat';      fn=strcat(tpath,expn,fext); load(fn);w1.ar=v.ar;
%fext='_2_31_AR_readar_limit.mat';             fn=strcat(tpath,expn,fext); load(fn);w1.limit=v;

%expn='c192L33_am4p0_amip_HIRESMIP_H8';
%fext='_1979_2014_readarmap_sim1.mat'; fn=strcat(tpath,expn,fext); load(fn);vm=v;
%fext='_AR_1979_2014_saveopt1.mat';   fn=strcat(tpath,expn,fext); load(fn);vm.ar=v.ar;
%fext='_1979_2014_readar_limit.mat';  fn=strcat(tpath,expn,fext); load(fn);vm.limit=v;

%expn='c192L33_am4p0_amip_HIRESMIP_H8';
%fext='_1950_1978_readarmap_sim.mat'; fn=strcat(tpath,expn,fext); load(fn);vm1=v;
%fext='_AR_1950_1978_saveopt1.mat';   fn=strcat(tpath,expn,fext); load(fn);vm1.ar=v.ar;

%expn='c192L33_am4p0_amip_HIRESMIP_H8';
%fext='_1950_2014_readarmap_sim.mat'; fn=strcat(tpath,expn,fext); load(fn);vm2=v;
%fext='_AR_1950_2014_saveopt1.mat';   fn=strcat(tpath,expn,fext); load(fn);vm2.ar=v.ar;

expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_2';
fext='_2015_2050_readarmap_sim1.mat'; fn=strcat(tpath,expn,fext); load(fn);wm=v;
fext='_AR_2015_2050_saveopt1.mat';   fn=strcat(tpath,expn,fext); load(fn);wm.ar=v.ar;
fext='_2015_2050_readar_limit.mat';  fn=strcat(tpath,expn,fext); load(fn);wm.limit=v;

expn='c192L33_am4p0_2010climo_new';
fext='_2_31_readarmap_sim1.mat';      fn=strcat(tpath,expn,fext); load(fn);v1=v;
fext='_AR_2_31_saveopt1.mat';        fn=strcat(tpath,expn,fext); load(fn);v1.ar=v.ar;
fext='_2_31_readar_limit.mat';       fn=strcat(tpath,expn,fext); load(fn);v1.limit=v;

expn='c192L33_am4p0_2010climo_new_p4K';
fext='_2_31_readarmap_sim1.mat';      fn=strcat(tpath,expn,fext); load(fn);w1=v;
fext='_AR_2_31_saveopt1.mat';        fn=strcat(tpath,expn,fext); load(fn);w1.ar=v.ar;
fext='_2_31_readar_limit.mat';       fn=strcat(tpath,expn,fext); load(fn);w1.limit=v;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%gloal warming test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR PDF of the length
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear p; [p.dtas1,p.dtas2]=get_dtas(vm,wm,v1,w1);
p.s1='C192AM4-PD'; p.s2='C192AM4-Future'; p.s3='C192AM4-Climo'; p.s4='C192AM4-P4K';
p.vname='len_pdf_dif_warm'; p.xl='length (km)'; p.title='(a) AR length';
p.yl1='probability density (km^{-1})'; p.yl2='percent change (%/K)';
xmin=2000; xmax=16000; p.xy=[xmin xmax 0 0.00046]; p.xy1=[xmin xmax -10 100]; 
bins=450; bin=[2000:bins:8000 8000+bins:3*bins:50000];
x=vm.ar.leng; a=findpdf(x,bin); p.y1=a.pdf; p.y1avg=a.men;vm.len=a;
x=wm.ar.leng; a=findpdf(x,bin); p.y2=a.pdf; p.y2avg=a.men;wm.len=a;
x=v1.ar.leng; a=findpdf(x,bin); p.y3=a.pdf; p.y3avg=a.men;v1.len=a;
x=w1.ar.leng; a=findpdf(x,bin); p.y4=a.pdf; p.y4avg=a.men;w1.len=a; p.x=a.binc; 
plot_1d_diff_warm(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR PDF of the width
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear p; [p.dtas1,p.dtas2]=get_dtas(vm,wm,v1,w1);
p.s1='C192AM4-PD'; p.s2='C192AM4-Future'; p.s3='C192AM4-Climo'; p.s4='C192AM4-P4K';
p.vname='wid_pdf_dif_warm'; p.xl='width (km)'; p.title='(b) AR width';
p.yl1='probability density (km^{-1})'; p.yl2='percent change (%/K)';
xmin=100; xmax=2000; p.xy=[xmin xmax 0 0.0026]; p.xy1=[xmin xmax -10 100]; 
bins=50; bin=[100:bins:800 800+bins:3*bins:5000];
x=vm.ar.widt; a=findpdf(x,bin); p.y1=a.pdf; p.y1avg=a.men;vm.widt=a;
x=wm.ar.widt; a=findpdf(x,bin); p.y2=a.pdf; p.y2avg=a.men;wm.widt=a;
x=v1.ar.widt; a=findpdf(x,bin); p.y3=a.pdf; p.y3avg=a.men;v1.widt=a;
x=w1.ar.widt; a=findpdf(x,bin); p.y4=a.pdf; p.y4avg=a.men;w1.widt=a; p.x=a.binc; 
plot_1d_diff_warm(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
p.s1='Future minus PD'; p.s2='P4K minus Climo'; p.s3='Future minus PD'; p.s4='P4K minus Climo';
p.vname='len_pctile_dif_warm'; p.xl='\Delta LEN/\Delta Ts (kg/m/s)'; 
p.yl1='\Delta LEN/\Delta Ts (kg/m/s/K)'; p.yl2='\Delta LEN /LEN/ \Delta Ts (%)';
p.x=[1 2 3 4 5 6 7]; xmin=1; xmax=7; p.xy=[xmin xmax 0 100]; p.xy1=[xmin xmax -50 50];
p.y1=[vm.len.p50 vm.len.p75 vm.len.p85 vm.len.p95 vm.len.p99 vm.len.p999 vm.len.p9999];
p.y2=[wm.len.p50 wm.len.p75 wm.len.p85 wm.len.p95 wm.len.p99 wm.len.p999 wm.len.p9999];
p.y3=[v1.len.p50 v1.len.p75 v1.len.p85 v1.len.p95 v1.len.p99 v1.len.p999 v1.len.p9999];
p.y4=[w1.len.p50 w1.len.p75 w1.len.p85 w1.len.p95 w1.len.p99 w1.len.p999 w1.len.p9999];
x=[1 2 3 4 5 6 7]; fsize=20;
pms=[ 0, 0, 1200, 800]*0.6; fsize=20; lw=2; 
handle = figure('Position', pms,'visible','on');
plot(x,(p.y2-p.y1)./p.y1/p.dtas1*100,'-r*','LineWidth',lw); hold on; 
plot(x,(p.y4-p.y3)./p.y3/p.dtas2*100,'-ms','LineWidth',lw);
xlist={'50%','75%','85%','95%','99%','99.9%','99.99%'};
xlabel('percentile','FontSize',fsize); 
legend('Future minus PD','P4K minius Climo',2);
ylabel('\Delta length /length/ \Delta Ts (%)','FontSize',fsize);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; vname='pctile_percentdiff';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR PDF of the width
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear p; [p.dtas1,p.dtas2]=get_dtas(vm,wm,v1,w1);
p.s1='C192AM4-PD'; p.s2='C192AM4-Future'; p.s3='C192AM4-Climo'; p.s4='C192AM4-P4K';
p.vname='wid_pdf_dif_warm'; p.xl='width (km)'; 
p.yl1='probability density (km^{-1})'; p.yl2='Warming minus CNTL (%/K)';
xmin=100; xmax=2000; p.xy=[xmin xmax 0 0.0025]; p.xy1=[xmin xmax -50 50];
bins=50; bin=[100:bins:800 800+bins:3*bins:5000];
x=vm.ar.widt; a=findpdf(x,bin); p.y1=a.pdf; p.y1avg=a.men;vm.wid=a;
x=wm.ar.widt; a=findpdf(x,bin); p.y2=a.pdf; p.y2avg=a.men;wm.wid=a;
x=v1.ar.widt; a=findpdf(x,bin); p.y3=a.pdf; p.y3avg=a.men;v1.wid=a;
x=w1.ar.widt; a=findpdf(x,bin); p.y4=a.pdf; p.y4avg=a.men;w1.wid=a; p.x=a.binc; 
plot_1d_diff_warm(p);
p.s1='Future minus PD'; p.s2='P4K minus Climo'; p.s3='Future minus PD'; p.s4='P4K minus Climo';
p.vname='len_pctile_dif_warm'; p.xl='\Delta LEN/\Delta Ts (kg/m/s)'; 
p.yl1='\Delta LEN/\Delta Ts (kg/m/s/K)'; p.yl2='\Delta WID /WID/ \Delta Ts (%)';
p.x=[1 2 3 4 5 6 7]; xmin=1; xmax=7; p.xy=[xmin xmax 0 100]; p.xy1=[xmin xmax -50 50];
p.y1=[vm.wid.p50 vm.wid.p75 vm.wid.p85 vm.wid.p95 vm.wid.p99 vm.wid.p999 vm.wid.p9999];
p.y2=[wm.wid.p50 wm.wid.p75 wm.wid.p85 wm.wid.p95 wm.wid.p99 wm.wid.p999 wm.wid.p9999];
p.y3=[v1.wid.p50 v1.wid.p75 v1.wid.p85 v1.wid.p95 v1.wid.p99 v1.wid.p999 v1.wid.p9999];
p.y4=[w1.wid.p50 w1.wid.p75 w1.wid.p85 w1.wid.p95 w1.wid.p99 w1.wid.p999 w1.wid.p9999];
x=[1 2 3 4 5 6 7]; fsize=20;
pms=[ 0, 0, 1200, 800]*0.6; fsize=20; lw=2; 
handle = figure('Position', pms,'visible','on');
plot(x,(p.y2-p.y1)./p.y1/p.dtas1*100,'-r*','LineWidth',lw); hold on; 
plot(x,(p.y4-p.y3)./p.y3/p.dtas2*100,'-ms','LineWidth',lw);
xlist={'50%','75%','85%','95%','99%','99.9%','99.99%'};
xlabel('percentile','FontSize',fsize); 
legend('Future minus PD','P4K minius Climo',2);
ylabel('\Delta length /length/ \Delta Ts (%)','FontSize',fsize);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; vname='pctile_percentdiff';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR PDF of the magnitude of mean IVT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear p; [p.dtas1,p.dtas2]=get_dtas(vm,wm,v1,w1);
p.s1='C192AM4-PD'; p.s2='C192AM4-Future'; p.s3='C192AM4-Climo'; p.s4='C192AM4-P4K';
p.vname='ivt_pdf_dif_warm'; p.xl='magnitude of AR mean IVT (kg m^{-1}s^{-1})'; 
p.yl1='probability density (ms kg^{-1})'; p.yl2='precent change (%/K)';
xmin=50; xmax=1250; p.xy=[xmin xmax 0 0.0036]; p.xy1=[xmin xmax -30 300];
bins=20; bin=[0 :bins:1500]; %dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
x=sqrt(vm.ar.ivtz.^2+vm.ar.ivtm.^2); a=findpdf(x,bin); p.y1=a.pdf; p.y1avg=a.men;vm.ivt=a;vm.ar_no=length(x)/vm.nyr;
x=sqrt(wm.ar.ivtz.^2+wm.ar.ivtm.^2); a=findpdf(x,bin); p.y2=a.pdf; p.y2avg=a.men;wm.ivt=a;wm.ar_no=length(x)/wm.nyr;
x=sqrt(v1.ar.ivtz.^2+v1.ar.ivtm.^2); a=findpdf(x,bin); p.y3=a.pdf; p.y3avg=a.men;v1.ivt=a;v1.ar_no=length(x)/v1.nyr;
x=sqrt(w1.ar.ivtz.^2+w1.ar.ivtm.^2); a=findpdf(x,bin); p.y4=a.pdf; p.y4avg=a.men;w1.ivt=a;w1.ar_no=length(x)/w1.nyr; p.x=a.binc; 
plot_1d_diff_warm(p);
%%%%%%%%%%%%%%%%%%%%%%
p.s1='C192AM4-Future minus C192AM4-PD'; p.s2='C192AM4-P4K minus C192AM4-Climo'; 
p.s3='C192AM4-Future minus C192AM4-PD'; p.s4='C192AM4-P4K minus C192AM4-Climo';
p.vname='ivt_pctile_dif_warm'; p.xl='\Delta IVT/\Delta Ts (kg/m/s)'; 
p.yl1='\Delta IVT/\Delta Ts (kg/m/s/K)'; p.yl2='\Delta IVT /IVT/ \Delta Ts (%)';
p.x=[1 2 3 4 5 6 7]; xmin=1; xmax=7; p.xy=[xmin xmax 0 100]; p.xy1=[xmin xmax -50 50];
p.y1=[vm.ivt.p50 vm.ivt.p75 vm.ivt.p85 vm.ivt.p95 vm.ivt.p99 vm.ivt.p999 vm.ivt.p9999];
p.y2=[wm.ivt.p50 wm.ivt.p75 wm.ivt.p85 wm.ivt.p95 wm.ivt.p99 wm.ivt.p999 wm.ivt.p9999];
p.y3=[v1.ivt.p50 v1.ivt.p75 v1.ivt.p85 v1.ivt.p95 v1.ivt.p99 v1.ivt.p999 v1.ivt.p9999];
p.y4=[w1.ivt.p50 w1.ivt.p75 w1.ivt.p85 w1.ivt.p95 w1.ivt.p99 w1.ivt.p999 w1.ivt.p9999];
x=[1 2 3 4 5 6 7]; fsize=20;
pms=[ 0, 0, 1200, 800]*0.6; fsize=20; lw=2; 
handle = figure('Position', pms,'visible','on');
plot(x,(p.y2-p.y1)/p.dtas1,'-r*','LineWidth',lw); hold on; 
plot(x,(p.y4-p.y3)/p.dtas2,'-ms','LineWidth',lw);
xlist={'50%','75%','85%','95%','99%','99.9%','99.99%'};
xlabel('percentile','FontSize',fsize); 
legend('Future minus PD','P4K minius Climo',2);
ylabel('\Delta IVT /IVT/ \Delta Ts (%)','FontSize',fsize);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; vname='pctile_percentdiff';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%
%


x=[0:0.1:10]; y1=exp(-(x-5).^2); y2=exp(-(x-5.2).^2);
%figure; plot(x,y1); hold on; plot(x,y2,'r'); figure; plot(x,(y2-y1)./y1*100);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s0='ERA-Interim'; s1='C192AM4-Present'; s2='C192AM4-Future'; s3='C192AM4-Climo';s4='C192AM4-P4K';
bins=10; bin=[0 :bins:800 800+bins:10*bins:1250]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
bins=20; bin=[-1000:5*bins:0 0+bins:bins:700 700+bins:5*bins:1200]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
x=sqrt(vo.ar.ivtz.^2+vo.ar.ivtm.^2); vo.ivt=findpdf(x,bin); vo.ar_no=length(x)/vo.nyr;
x=sqrt(vm.ar.ivtz.^2+vm.ar.ivtm.^2); vm.ivt=findpdf(x,bin); vm.ar_no=length(x)/vm.nyr;
x=sqrt(wm.ar.ivtz.^2+wm.ar.ivtm.^2); wm.ivt=findpdf(x,bin); wm.ar_no=length(x)/wm.nyr;
x=sqrt(v1.ar.ivtz.^2+v1.ar.ivtm.^2); v1.ivt=findpdf(x,bin); v1.ar_no=length(x)/v1.nyr;
x=sqrt(w1.ar.ivtz.^2+w1.ar.ivtm.^2); w1.ivt=findpdf(x,bin); w1.ar_no=length(x)/w1.nyr;
s0=sprintf('%s (%5.f)',s0,vo.ar_no);
s1=sprintf('%s (%5.f)',s1,vm.ar_no);
s2=sprintf('%s (%5.f)',s2,wm.ar_no);
s3=sprintf('%s (%5.f)',s3,v1.ar_no);
s4=sprintf('%s (%5.f)',s4,w1.ar_no);
vname='ivt_ar_pdf'; xmin=50; xmax=1250; xy=[xmin xmax 0 0.0032];  xy1=[xmin xmax -50 360];
x =vo.ivt.binc; y0=vo.ivt.pdf; y1=vm.ivt.pdf; y2=wm.ivt.pdf; y3=v1.ivt.pdf; y4=w1.ivt.pdf; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ax1=gca;
%line(x,y0, 'Color','k','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x,y1, 'Color','k','MarkerSize',msize,'LineWidth',lw); hold on;
line(x,y2, 'Color','r','MarkerSize',msize,'LineWidth',lw); 
line(x,y3, 'Color','c','MarkerSize',msize,'LineWidth',lw); 
line(x,y4, 'Color','m','MarkerSize',msize,'LineWidth',lw); 
xx=[50 250 500 750 1000 1250]; xlist={'50','250','500','750','1000','1250'};
set(gca,'xtick',xx); set(gca,'xticklabel',xlist,'FontSize',fsize);
legend(s1,s2,s3,s4,2); axis(xy); set(gca,'FontSize',fsize); %grid minor;
xl='Integrated Water Vapor Transport (kg m^{-1}s^{-1})';
yl='Probability Density (ms kg^{-1})';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
dy1=(y2-y1)./y1*100/p.dtas1; dy1=mizsmooth(dy1',3);
dy2=(y4-y3)./y2*100/p.dtas2; dy2=mizsmooth(dy2',3);
line(x,dy1, 'Color','r','MarkerSize',msize,'LineWidth',lw); hold on;
line(x,dy2, 'Color','m','MarkerSize',msize,'LineWidth',lw); hold on;
line([0    250], [0 0], 'Color','k','LineWidth',5);  
line([250  500], [0 0], 'Color','g','LineWidth',5); text(320,-10,'Cat 0-2','FontSize',fsize);
line([500  750], [0 0], 'Color','b','LineWidth',5); text(570,-10,'Cat 1-3','FontSize',fsize);
line([750  1000],[0 0], 'Color','y','LineWidth',5); text(820,-10,'Cat 2-4','FontSize',fsize);
line([1000 1250],[0 0], 'Color','r','LineWidth',5); text(1070,-10,'Cat 3-5','FontSize',fsize);
xx=[50 250 500 750 1000 1250]; xlist={'50','250','500','750','1000','1250'};
set(gca,'xtick',xx); set(gca,'xticklabel',xlist,'FontSize',fsize);
p.ds1='(Future - PD)/PD/\DeltaTs';
p.ds2='(P4K - Climo)/Climo/\DeltaTs';
legend(p.ds1,p.ds2,1); axis(xy1); 
p.yl2='Warming minus CNTL (%/K)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR PDF of the centroid of latitude
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear p; [p.dtas1,p.dtas2]=get_dtas(vm,wm,v1,w1);
p.s1='C192AM4-PD'; p.s2='C192AM4-Future'; p.s3='C192AM4-Climo'; p.s4='C192AM4-P4K';
p.vname='clat_pdf_dif_warm'; p.xl='latitude (degree)'; 
p.yl1='probability density (km^{-1})'; p.yl2='Warming minus CNTL (%/K)';
xmin=-90; xmax=90; p.xy=[xmin xmax 0 0.026]; p.xy1=[xmin xmax -20 20];
bins=2; bin=[-90 -82 :2*bins:-60 -60+bins:bins:-20 -15 -5 5 15 20:bins:60 60+bins:2*bins:82 90];
x=vm.ar.clat; a=findpdf(x,bin); p.y1=a.pdf; p.y1avg=a.men;
x=wm.ar.clat; a=findpdf(x,bin); p.y2=a.pdf; p.y2avg=a.men;
x=v1.ar.clat; a=findpdf(x,bin); p.y3=a.pdf; p.y3avg=a.men;
x=w1.ar.clat; a=findpdf(x,bin); p.y4=a.pdf; p.y4avg=a.men; p.x=a.binc; 
plot_1d_diff_warm(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig8 TAS warming pattern (annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas1=tas1-tas0;
tas0=v1.tas_av_clm.ann; tas1=w1.tas_av_clm.ann; p.dtas2=tas1-tas0;
p.s0='C192AM4-PD'; p.s1='C192AM4-Future'; 
p.lm=vm.lm; p.a=vm.aa; 
p.vname='Fig8'; p.str='ANN';
p.cs1=[0 4]; p.s1='(a) FUTURE minus PRESENT';
p.cs2=[0 4]; p.s2='(b) P4K minus CLIMO';
p.z1=wm.tas_av_clm.ann-vm.tas_av_clm.ann; p.x1=wm.lon; p.y1=wm.lat;
p.z2=w1.tas_av_clm.ann-v1.tas_av_clm.ann; p.x1=wm.lon; p.y1=wm.lat;
x1=p.x1; y1=p.y1; z1=p.z1; z2=p.z2; lm=p.lm; cs1=p.cs1; cs2=p.cs2;
s0=p.s0; s1=p.s1; s2=p.s2; str=p.str; a=p.a;
%compute statistics
dtas1=mean(mean(p.dtas1.*p.a));z1=z1/dtas1; %e=e/dtas0; diff_pdk=mean(e(id).*aa);
dtas2=mean(mean(p.dtas2.*p.a));z2=z2/dtas2; %e=e/dtas0; diff_pdk=mean(e(id).*aa);
id= isnan(z1); id=~id; aa=a(id)/mean(a(id)); z1_mean=mean(z1(id).*aa);
id= isnan(z2); id=~id; aa=a(id)/mean(a(id)); z2_mean=mean(z2(id).*aa);
msg=sprintf('z1mean=%f; z2mean=%f; dtas1=%f; dtas2=%f',z1_mean,z2_mean,dtas1,dtas2);
disp(msg); %str=strcat(' (',str,')'); s0=strcat(s0,str); s1=strcat(s1,str); 
%plotting
pms=[ 0, 0, 500, 600]*1; fsize=12; lw=2; row=2; col=1;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); xy=[0 360 -90 90]; xl='longitude'; yl='latitude';
pcolor(x1,y1,z1); hold on; shading flat; colorbar; caxis([cs1]); 
contourf(x1,y1,lm/10,'k'); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
%s1=sprintf('%s (mean:%5.4f)',s1,z1_mean); 
title(s1,'FontSize',fsize); 
subplot(row,col,2);
pcolor(x1,y1,z2); hold on; shading flat; colorbar; caxis([cs1]); 
contourf(x1,y1,lm/10,'k'); axis(xy); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
%s2=sprintf('%s (mean:%5.4f)',s2,z2_mean); 
title(s2,'FontSize',fsize); 
%nn=256; cmap=jet(nn); %cmap=fabien_colormap(nn); 
nn=256; cmap=bluewhitered(nn); %cmap(1,:)=[1 1 1]; 
colormap(cmap);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,p.vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-PD'; p.s1='C192AM4-Future'; p.lm=vm.lm; p.a=vm.aa; p.cs=[0 500]; 
p.vname='ivt_limit_clm_ann_future'; p.str='ANN';
p.cs1=[-50 50]; p.rel=0; p.s2='(Future - PD)/\DeltaTs';
%p.cs1=[-15 15]; p.rel=1; p.s2='(Future - PD)/PD\DeltaTs';
p.z0=vm.limit.ivt_limit_clm.ann; p.x0=vm.lon; p.y0=vm.lat;
p.z1=wm.limit.ivt_limit_clm.ann; p.x1=vm.lon; p.y1=vm.lat;    
plot_2d_diff_warm(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig9: IVT threshold (annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=v1.tas_av_clm.ann; tas1=w1.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='CLIMO'; p.s1='P4K'; lm=vm.lm; p.a=vm.aa; cs1=[0 500]; 
p.vname='Fig9'; p.str='ANN';
cs2=[-200 200]; p.rel=0; p.s2='(P4K - Climo)/\DeltaTs';
x1=vm.lon; y1=vm.lat;
%z1=vm.limit.ivt_limit_clm.ann; 
%z2=wm.limit.ivt_limit_clm.ann; z2_ccli=wm2.limit.ivt_limit_clm.ann;
%z3=v1.limit.ivt_limit_clm.ann; 
%z4=w1.limit.ivt_limit_clm.ann; z4_ccli=w2.limit.ivt_limit_clm.ann;
z1=vm.limit.ivt_limit_clm.ndjfm; 
z2=wm.limit.ivt_limit_clm.ndjfm; z2_ccli=wm2.limit.ivt_limit_clm.ndjfm;
z3=v1.limit.ivt_limit_clm.ndjfm; 
z4=w1.limit.ivt_limit_clm.ndjfm; z4_ccli=w2.limit.ivt_limit_clm.ndjfm;
z1(z1<100)=100; z2(z2<100)=100; z3(z3<100)=100; z4(z4<100)=100; 
pms=[ 0, 0, 1000, 600]*1; fsize=12; lw=2; row=2; col=2;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); xy=[0 360 -90 90]; xl='longitude'; yl='latitude';
pcolor(x1,y1,z1); hold on; shading flat; colorbar; caxis([cs1]); 
contour(x1,y1,lm,[1],'k'); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
title('(a) PRESENT','FontSize',fsize); 
subplot(row,col,3);
pcolor(x1,y1,z2-z1); hold on; shading flat; colorbar; caxis([cs2]); 
contour(x1,y1,lm,[1],'k'); axis(xy); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
title('(c) FUTURE minus PRESENT','FontSize',fsize); 
subplot(row,col,2); xy=[0 360 -90 90]; xl='longitude'; yl='latitude';
pcolor(x1,y1,z3); hold on; shading flat; colorbar; caxis([cs1]); 
contour(x1,y1,lm,[1],'k'); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
title('(b) CLIMO','FontSize',fsize); 
subplot(row,col,4);
pcolor(x1,y1,z4-z3); hold on; shading flat; colorbar; caxis([cs2]); 
contour(x1,y1,lm,[1],'k'); axis(xy); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
title('(d) P4K minus CLIMO','FontSize',fsize); 
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,p.vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig10: AR sensitivity to IVT threshold (a snapshot difference)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn='/archive/Ming.Zhao/awg/warsaw_201803/c192L33_am4p0_2010climo_new_p4K_newpp/atmos_data/atmos.0031010100-0031123123.ivtx.nc'
ivtx=ncread(fn,'ivtx');
fn='/archive/Ming.Zhao/awg/warsaw_201803/c192L33_am4p0_2010climo_new_p4K_newpp/atmos_data/atmos.0031010100-0031123123.ivty.nc'
ivty=ncread(fn,'ivty'); ivt=sqrt(ivtx.*ivtx+ivty.*ivty);
fn='/archive/Ming.Zhao/awg/warsaw_201803/c192L33_am4p0_2010climo_new_p4K_newpp/AR_climlmt/c192L33_am4p0_2010climo_new_p4K_newpp_0031_pixel_ivt_limit_new.nc'
a=ncread(fn,'ivt'); a=squeeze(a(:,:,2)); a(a<100)=100; ivt0_clim=a';
fn='/archive/Ming.Zhao/awg/warsaw_201803/c192L33_am4p0_2010climo_new_p4K_newpp/AR_cclilmt/c192L33_am4p0_2010climo_new_p4K_newpp_0031_pixel_ivt_limit_new.nc'
a=ncread(fn,'ivt'); a=squeeze(a(:,:,2)); a(a<100)=100; ivt0_ccli=a';
fn='/archive/Ming.Zhao/awg/warsaw_201803/c192L33_am4p0_2010climo_new_p4K_newpp/AR_climlmt/c192L33_am4p0_2010climo_new_p4K_newpp_AR_0031.nc'
a=ncread(fn,'shape'); shape_clim=permute(a,[3 2 1]); 
fn='/archive/Ming.Zhao/awg/warsaw_201803/c192L33_am4p0_2010climo_new_p4K_newpp/AR_cclilmt/c192L33_am4p0_2010climo_new_p4K_newpp_AR_0031.nc'
a=ncread(fn,'shape'); shape_ccli=permute(a,[3 2 1]); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=152; cs1=[1 10]; p.vname='Fig10';
z1=squeeze(squeeze(shape_clim(i,:,:)));
z2=squeeze(squeeze(shape_ccli(i,:,:)));
IVT=(squeeze(ivt(:,:,i)))'; 
a=IVT; b=ivt0_clim; a(a<b)=NaN; a(a>=b)=1; id1=a; %figure; pcolor(x1,y1,a); shading flat; colorbar; cmap=bluewhitered(256); colormap(cmap);
a=IVT; b=ivt0_ccli; a(a<b)=NaN; a(a>=b)=1; id2=a; %figure; pcolor(x1,y1,a); shading flat; colorbar; cmap=bluewhitered(256); colormap(cmap);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1000, 600]*1.2; fsize=12; lw=2; row=2; col=2;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); xy=[0 360 -90 90]; xl='longitude'; yl='latitude';
pcolor(x1,y1,z1); hold on; shading flat; colorbar; caxis([cs1]); 
contour(x1,y1,lm,[1],'k'); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
title('(a)','FontSize',fsize); 
subplot(row,col,2);
pcolor(x1,y1,z2); hold on; shading flat; colorbar; caxis([cs1]); 
contour(x1,y1,lm,[1],'k'); axis(xy); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
title('(b)','FontSize',fsize); 
subplot(row,col,3); xy=[0 360 -90 90]; xl='longitude'; yl='latitude';
pcolor(x1,y1,id1); hold on; shading flat; colorbar; caxis([cs1]); 
contour(x1,y1,lm,[1],'k'); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
title('(c)','FontSize',fsize); 
subplot(row,col,4);
pcolor(x1,y1,id2); hold on; shading flat; colorbar; caxis([cs1]); 
contour(x1,y1,lm,[1],'k'); axis(xy); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); %cmap=colormap(hsv(256)); colormap(cmap);
title('(d)','FontSize',fsize); 
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,p.vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=v1.tas_av_clm.ann; tas1=w1.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-Climo'; p.s1='C192AM4-P4K'; p.lm=vm.lm; p.a=vm.aa; p.cs=[50 500]; 
p.vname='ivt_limit_clm_ann_p4K'; p.str='ANN';
p.cs1=[-50 50]; p.rel=0; p.s2='(P4K - Climo)/\DeltaTs';
%p.cs1=[-15 15]; p.rel=1; p.s2='(P4K - Climo)/PD\DeltaTs';
p.z0=v1.limit.ivt_limit_clm.ann; p.x0=vm.lon; p.y0=vm.lat;
p.z1=w1.limit.ivt_limit_clm.ann; p.x1=vm.lon; p.y1=vm.lat;    
plot_2d_diff_warm(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig11a: change in IVT PDF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear p; [p.dtas1,p.dtas2]=get_dtas(vm,wm,v1,w1);
p.s1='PRESENT'; p.s2='FUTURE'; p.s3='CLIMO'; p.s4='P4K';
p.s5='FUTURE-CTLIVT0'; p.s6='P4K-CTLIVT0';
p.vname='Fig11a'; p.xl='magnitude of AR mean IVT (kg m^{-1}s^{-1})'; 
p.yl1='probability density (ms kg^{-1})'; 
p.yl2='percent change of probability density (%/K)';
xmin=50; xmax=1250; p.xy=[xmin xmax 0 0.0036]; p.xy1=[xmin xmax -30 600];
bins=20; bin=[0 :bins:1500]; %dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
v=vm; x=sqrt(v.ar.ivtz.^2+v.ar.ivtm.^2); a=findpdf(x,bin); p.y1=a.pdf; p.y1avg=a.men;vm.ivt=a;vm.ar_no=length(x)/vm.nyr;
v=wm; x=sqrt(v.ar.ivtz.^2+v.ar.ivtm.^2); a=findpdf(x,bin); p.y2=a.pdf; p.y2avg=a.men;wm.ivt=a;wm.ar_no=length(x)/wm.nyr;
v=v1; x=sqrt(v.ar.ivtz.^2+v.ar.ivtm.^2); a=findpdf(x,bin); p.y3=a.pdf; p.y3avg=a.men;v1.ivt=a;v1.ar_no=length(x)/v1.nyr;
v=w1; x=sqrt(v.ar.ivtz.^2+v.ar.ivtm.^2); a=findpdf(x,bin); p.y4=a.pdf; p.y4avg=a.men;w1.ivt=a;w1.ar_no=length(x)/w1.nyr; p.x=a.binc; 
v=wm2;x=sqrt(v.ar.ivtz.^2+v.ar.ivtm.^2); a=findpdf(x,bin); p.y5=a.pdf; p.y5avg=a.men;wm2.ivt=a;wm2.ar_no=length(x)/wm2.nyr; 
v=w2; x=sqrt(v.ar.ivtz.^2+v.ar.ivtm.^2); a=findpdf(x,bin); p.y6=a.pdf; p.y6avg=a.men;w2.ivt=a;w2.ar_no=length(x)/w2.nyr; 
npt=3;
p.dy1=(p.y2-p.y1)./p.y1*100./p.dtas1; p.dy1=mizsmooth(p.dy1,npt); 
p.dy2=(p.y4-p.y3)./p.y3*100./p.dtas2; p.dy2=mizsmooth(p.dy2,npt);
p.dy3=(p.y5-p.y1)./p.y1*100./p.dtas1; p.dy3=mizsmooth(p.dy3,npt); 
p.dy4=(p.y6-p.y3)./p.y3*100./p.dtas2; p.dy4=mizsmooth(p.dy4,npt);
p.ds1='FUTURE minus PRESENT';
p.ds2='P4K minus CLIMO';
p.ds3='FUTURE-CTLIVT0 minus PRESENT';
p.ds4='P4K-CTLIVT0 minus CLIMO';
p.s1=sprintf('%s (mean=%3.0f)',p.s1,p.y1avg);
p.s2=sprintf('%s (mean=%3.0f)',p.s2,p.y2avg);
p.s3=sprintf('%s (mean=%3.0f)',p.s3,p.y3avg);
p.s4=sprintf('%s (mean=%3.0f)',p.s4,p.y4avg);
p.s5=sprintf('%s (mean=%3.0f)',p.s5,p.y5avg);
p.s6=sprintf('%s (mean=%3.0f)',p.s6,p.y6avg);
p.ls='-'; p.ms=1;
x=p.x; xy=p.xy; xy1=p.xy1; ms=p.ms; ls=p.ls; %'none';
pms=[ 0, 0, 1200, 800]*0.8; fsize=14; lw=1; 
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x,p.y1,'Color','k','Marker','*','MarkerSize',ms,'LineWidth',lw,'LineStyle','--'); hold on; 
line(x,p.y2,'Color','k','Marker','s','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls); 
line(x,p.y3,'Color','b','Marker','*','MarkerSize',ms,'LineWidth',lw,'LineStyle','--');
line(x,p.y4,'Color','b','Marker','s','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls); 
line(x,p.y5,'Color','c','Marker','*','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls);
line(x,p.y6,'Color','g','Marker','s','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls); 
legend(p.s1,p.s2,p.s3,p.s4,p.s5,p.s6,2); axis(xy); set(gca,'FontSize',fsize);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl1,'FontSize',fsize);
title('(a)','FontSize',fsize);
do_cat=1;
if (do_cat)
  xx=[50 250 500 750 1000 1250]; xlist={'50','250','500','750','1000','1250'};
  set(gca,'xtick',xx); set(gca,'xticklabel',xlist,'FontSize',fsize);
end
ms=1;
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
%nn=3; p.dy1=mizsmooth(p.dy1,nn); p.dy2=mizsmooth(p.dy2,nn);
line(x,p.dy1,'Color','r','Marker','o','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls); hold on;
line(x,p.dy2,'Color','m','Marker','o','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls); hold on;
line(x,p.dy3,'Color','r','Marker','o','MarkerSize',ms,'LineWidth',lw,'LineStyle','-.'); hold on;
line(x,p.dy4,'Color','m','Marker','o','MarkerSize',ms,'LineWidth',lw,'LineStyle','-.'); hold on;
line([xy(1) xy(2)],[0 0], 'Color','r','MarkerSize',ms,'LineWidth',1); 
if (do_cat)
  line([0    250], [0 0], 'Color','k','LineWidth',5); i=10;
  line([250  500], [0 0], 'Color','g','LineWidth',5); text(325, i,'Cat 0-2','FontSize',fsize);
  line([500  750], [0 0], 'Color','b','LineWidth',5); text(575, i,'Cat 1-3','FontSize',fsize);
  line([750  1000],[0 0], 'Color','y','LineWidth',5); text(825, i,'Cat 2-4','FontSize',fsize);
  line([1000 1250],[0 0], 'Color','r','LineWidth',5); text(1075,i,'Cat 3-5','FontSize',fsize);
  xx=[50 250 500 750 1000 1250]; xlist={'50','250','500','750','1000','1250'};
  set(gca,'xtick',xx); set(gca,'xticklabel',xlist,'FontSize',fsize);
end
line(x,p.dy1,'Color','r','Marker','o','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls); hold on;
line(x,p.dy2,'Color','m','Marker','o','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls); hold on;
line(x,p.dy3,'Color','r','Marker','o','MarkerSize',ms,'LineWidth',lw,'LineStyle','-.'); hold on;
line(x,p.dy4,'Color','m','Marker','o','MarkerSize',ms,'LineWidth',lw,'LineStyle','-.'); hold on;
legend(p.ds1,p.ds2,p.ds3,p.ds4,1); axis(xy1); ylabel(p.yl2,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,p.vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig11b: AR IVT percentile
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear p; [p.dtas1,p.dtas2]=get_dtas(vm,wm,v1,w1);
p.s1='PRESENT'; p.s2='FUTURE'; p.s3='CLIMO'; p.s4='P4K';
p.s5='FUTURE-CTLIVT0'; p.s6='P4K-CTLIVT0';
bins=20; bin=[0 :bins:1500]; %dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
v=vm; x=sqrt(v.ar.ivtz.^2+v.ar.ivtm.^2); a=findpdf(x,bin); p.y1=a.pctile; vm.ivt=a;vm.ar_no=length(x)/vm.nyr;
v=wm; x=sqrt(v.ar.ivtz.^2+v.ar.ivtm.^2); a=findpdf(x,bin); p.y2=a.pctile; wm.ivt=a;wm.ar_no=length(x)/wm.nyr;
v=v1; x=sqrt(v.ar.ivtz.^2+v.ar.ivtm.^2); a=findpdf(x,bin); p.y3=a.pctile; v1.ivt=a;v1.ar_no=length(x)/v1.nyr;
v=w1; x=sqrt(v.ar.ivtz.^2+v.ar.ivtm.^2); a=findpdf(x,bin); p.y4=a.pctile; w1.ivt=a;w1.ar_no=length(x)/w1.nyr; p.x=a.binc; 
v=wm2;x=sqrt(v.ar.ivtz.^2+v.ar.ivtm.^2); a=findpdf(x,bin); p.y5=a.pctile; wm2.ivt=a;wm2.ar_no=length(x)/wm2.nyr; 
v=w2; x=sqrt(v.ar.ivtz.^2+v.ar.ivtm.^2); a=findpdf(x,bin); p.y6=a.pctile; w2.ivt=a;w2.ar_no=length(x)/w2.nyr; 
p.x=a.pct; 
p.dy1=(p.y2-p.y1)./p.y1*100./p.dtas1; %p.dy1=mizsmooth(p.dy1,3); 
p.dy2=(p.y4-p.y3)./p.y3*100./p.dtas2; %p.dy2=mizsmooth(p.dy2,3);
p.dy3=(p.y5-p.y1)./p.y1*100./p.dtas1; %p.dy3=mizsmooth(p.dy3,3); 
p.dy4=(p.y6-p.y3)./p.y3*100./p.dtas2; %p.dy4=mizsmooth(p.dy4,3);
p.ds1='FUTURE minus PRESENT';
p.ds2='P4K minus CLIMO';
p.ds3='FUTURE-CTLIVT0 minus PRESENT';
p.ds4='P4K-CTLIVT0 minus CLIMO'; i=50;
p.s1=sprintf('%s (median=%3.0f)',p.s1,p.y1(i));
p.s2=sprintf('%s (median=%3.0f)',p.s2,p.y2(i));
p.s3=sprintf('%s (median=%3.0f)',p.s3,p.y3(i));
p.s4=sprintf('%s (median=%3.0f)',p.s4,p.y4(i));
p.s5=sprintf('%s (median=%3.0f)',p.s5,p.y5(i));
p.s6=sprintf('%s (median=%3.0f)',p.s6,p.y6(i));
p.ls='-'; p.ms=1;
p.vname='Fig11b'; p.title='(b)'; p.xl='percent rank'; 
p.yl1='percentile value of AR mean IVT magnitude (kg m^{-1}s^{-1})'; 
p.yl2='percent change of percentile value (%/K)';
xmin=0; xmax=100; p.xy=[xmin xmax 20 1250]; p.xy1=[xmin xmax -5 15]; 
x=p.x; xy=p.xy; xy1=p.xy1; ms=p.ms; ls=p.ls; %'none';
pms=[ 0, 0, 1200, 800]*0.8; fsize=14; lw1=1; lw=2; 
handle = figure('Position', pms,'visible','on');
ax1=gca; 
line(x,p.y1,'Color','k','Marker','*','MarkerSize',ms,'LineWidth',lw1,'LineStyle','--'); hold on; 
line(x,p.y2,'Color','k','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
line(x,p.y3,'Color','b','Marker','*','MarkerSize',ms,'LineWidth',lw1,'LineStyle','--');
line(x,p.y4,'Color','b','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
line(x,p.y5,'Color','c','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
line(x,p.y6,'Color','g','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
legend(p.s1,p.s2,p.s3,p.s4,p.s5,p.s6,2); axis(xy); set(gca,'FontSize',fsize);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl1,'FontSize',fsize);
title(p.title,'FontSize',fsize);
ms=1;
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
%nn=3; p.dy1=mizsmooth(p.dy1,nn); p.dy2=mizsmooth(p.dy2,nn);
line(x,p.dy1,'Color','r','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); hold on;
line(x,p.dy2,'Color','m','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); hold on;
line(x,p.dy3,'Color','r','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle','-.'); hold on;
line(x,p.dy4,'Color','m','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle','-.'); hold on;
line([xy(1) xy(2)],[0 0], 'Color',[0.5 0.5 0.5],'MarkerSize',ms,'LineWidth',1,'LineStyle',':'); 
legend(p.ds1,p.ds2,p.ds3,p.ds4,1); axis(xy1); ylabel(p.yl2,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,p.vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig12a: AR PDF of the length
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear p; [p.dtas1,p.dtas2]=get_dtas(vm,wm,v1,w1);
p.s1='PRESENT'; p.s2='FUTURE'; p.s3='CLIMO'; p.s4='P4K';
p.s5='FUTURE-CTLIVT0'; p.s6='P4K-CTLIVT0';
p.vname='Fig12a'; p.xl='length (km)'; p.title='(a)';
p.yl1='probability density (km^{-1})'; 
p.yl2='percent change of probability density (%/K)';
xmin=2000; xmax=16000; p.xy=[xmin xmax 0 0.00048]; p.xy1=[xmin xmax -20 200]; 
bins=450; bin=[2000:bins:8000 8000+bins:3*bins:50000];
x=vm.ar.leng; a=findpdf(x,bin); p.y1=a.pdf; p.y1avg=a.men;vm.len=a;
x=wm.ar.leng; a=findpdf(x,bin); p.y2=a.pdf; p.y2avg=a.men;wm.len=a;
x=v1.ar.leng; a=findpdf(x,bin); p.y3=a.pdf; p.y3avg=a.men;v1.len=a;
x=w1.ar.leng; a=findpdf(x,bin); p.y4=a.pdf; p.y4avg=a.men;w1.len=a; 
x=wm2.ar.leng;a=findpdf(x,bin); p.y5=a.pdf; p.y5avg=a.men;wm2.len=a;
x=w2.ar.leng; a=findpdf(x,bin); p.y6=a.pdf; p.y6avg=a.men;w2.len=a; p.x=a.binc; 
p.dy1=(p.y2-p.y1)./p.y1*100./p.dtas1; p.dy1=mizsmooth(p.dy1,3); 
p.dy2=(p.y4-p.y3)./p.y3*100./p.dtas2; p.dy2=mizsmooth(p.dy2,3);
p.dy3=(p.y5-p.y1)./p.y1*100./p.dtas1; p.dy3=mizsmooth(p.dy3,3); 
p.dy4=(p.y6-p.y3)./p.y3*100./p.dtas2; p.dy4=mizsmooth(p.dy4,3);
p.ds1='FUTURE minus PRESENT';
p.ds2='P4K minus CLIMO';
p.ds3='FUTURE-CTLIVT0 minus PRESENT';
p.ds4='P4K-CTLIVT0 minus CLIMO';
p.s1=sprintf('%s (mean=%3.0f)',p.s1,p.y1avg);
p.s2=sprintf('%s (mean=%3.0f)',p.s2,p.y2avg);
p.s3=sprintf('%s (mean=%3.0f)',p.s3,p.y3avg);
p.s4=sprintf('%s (mean=%3.0f)',p.s4,p.y4avg);
p.s5=sprintf('%s (mean=%3.0f)',p.s5,p.y5avg);
p.s6=sprintf('%s (mean=%3.0f)',p.s6,p.y6avg);
p.ls='-'; p.ms=1;
x=p.x; xy=p.xy; xy1=p.xy1; ms=p.ms; ls=p.ls; %'none';
pms=[ 0, 0, 1200, 800]*0.8; fsize=14; lw1=1; lw=2; 
handle = figure('Position', pms,'visible','on');
ax1=gca; 
line(x,p.y1,'Color','k','Marker','*','MarkerSize',ms,'LineWidth',lw1,'LineStyle','--'); hold on; 
line(x,p.y2,'Color','k','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
line(x,p.y3,'Color','b','Marker','*','MarkerSize',ms,'LineWidth',lw1,'LineStyle','--');
line(x,p.y4,'Color','b','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
line(x,p.y5,'Color','c','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
line(x,p.y6,'Color','g','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
legend(p.s1,p.s2,p.s3,p.s4,p.s5,p.s6,2); axis(xy); set(gca,'FontSize',fsize);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl1,'FontSize',fsize);
title(p.title,'FontSize',fsize);
ms=1;
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
%nn=3; p.dy1=mizsmooth(p.dy1,nn); p.dy2=mizsmooth(p.dy2,nn);
line(x,p.dy1,'Color','r','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); hold on;
line(x,p.dy2,'Color','m','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); hold on;
line(x,p.dy3,'Color','r','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle','-.'); hold on;
line(x,p.dy4,'Color','m','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle','-.'); hold on;
line([xy(1) xy(2)],[0 0], 'Color',[0.5 0.5 0.5],'MarkerSize',ms,'LineWidth',1); 
legend(p.ds1,p.ds2,p.ds3,p.ds4,1); axis(xy1); ylabel(p.yl2,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,p.vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig12b: AR PDF of the width
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear p; [p.dtas1,p.dtas2]=get_dtas(vm,wm,v1,w1);
p.s1='PRESENT'; p.s2='FUTURE'; p.s3='CLIMO'; p.s4='P4K';
p.s5='FUTURE-CTLIVT0'; p.s6='P4K-CTLIVT0';
p.vname='Fig12b'; p.xl='width (km)'; p.title='(b)';
p.yl1='probability density (km^{-1})'; 
p.yl2='percent change of percentile value (%/K)';
xmin=100; xmax=2000; p.xy=[xmin xmax 0 0.003]; p.xy1=[xmin xmax -20 200]; 
bins=50; bin=[100:bins:800 800+bins:3*bins:5000];
x=vm.ar.widt; a=findpdf(x,bin); p.y1=a.pdf; p.y1avg=a.men;vm.widt=a;
x=wm.ar.widt; a=findpdf(x,bin); p.y2=a.pdf; p.y2avg=a.men;wm.widt=a;
x=v1.ar.widt; a=findpdf(x,bin); p.y3=a.pdf; p.y3avg=a.men;v1.widt=a;
x=w1.ar.widt; a=findpdf(x,bin); p.y4=a.pdf; p.y4avg=a.men;w1.widt=a; 
x=wm2.ar.widt;a=findpdf(x,bin); p.y5=a.pdf; p.y5avg=a.men;wm2.widt=a;
x=w2.ar.widt; a=findpdf(x,bin); p.y6=a.pdf; p.y6avg=a.men;w2.widt=a; p.x=a.binc; 
p.dy1=(p.y2-p.y1)./p.y1*100./p.dtas1; p.dy1=mizsmooth(p.dy1,3); 
p.dy2=(p.y4-p.y3)./p.y3*100./p.dtas2; p.dy2=mizsmooth(p.dy2,3);
p.dy3=(p.y5-p.y1)./p.y1*100./p.dtas1; p.dy3=mizsmooth(p.dy3,3); 
p.dy4=(p.y6-p.y3)./p.y3*100./p.dtas2; p.dy4=mizsmooth(p.dy4,3);
p.ds1='FUTURE minus PRESENT';
p.ds2='P4K minus CLIMO';
p.ds3='FUTURE-CTLIVT0 minus PRESENT';
p.ds4='P4K-CTLIVT0 minus CLIMO';
p.s1=sprintf('%s (mean=%3.0f)',p.s1,p.y1avg);
p.s2=sprintf('%s (mean=%3.0f)',p.s2,p.y2avg);
p.s3=sprintf('%s (mean=%3.0f)',p.s3,p.y3avg);
p.s4=sprintf('%s (mean=%3.0f)',p.s4,p.y4avg);
p.s5=sprintf('%s (mean=%3.0f)',p.s5,p.y5avg);
p.s6=sprintf('%s (mean=%3.0f)',p.s6,p.y6avg);
p.ls='-'; p.ms=1;
x=p.x; xy=p.xy; xy1=p.xy1; ms=p.ms; ls=p.ls; %'none';
pms=[ 0, 0, 1200, 800]*0.8; fsize=14; lw1=1; lw=2; 
handle = figure('Position', pms,'visible','on');
ax1=gca; 
line(x,p.y1,'Color','k','Marker','*','MarkerSize',ms,'LineWidth',lw1,'LineStyle','--'); hold on; 
line(x,p.y2,'Color','k','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
line(x,p.y3,'Color','b','Marker','*','MarkerSize',ms,'LineWidth',lw1,'LineStyle','--');
line(x,p.y4,'Color','b','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
line(x,p.y5,'Color','c','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
line(x,p.y6,'Color','g','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
legend(p.s1,p.s2,p.s3,p.s4,p.s5,p.s6,2); axis(xy); set(gca,'FontSize',fsize);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl1,'FontSize',fsize);
title(p.title,'FontSize',fsize);
ms=1;
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
%nn=3; p.dy1=mizsmooth(p.dy1,nn); p.dy2=mizsmooth(p.dy2,nn);
line(x,p.dy1,'Color','r','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); hold on;
line(x,p.dy2,'Color','m','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); hold on;
line(x,p.dy3,'Color','r','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle','-.'); hold on;
line(x,p.dy4,'Color','m','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle','-.'); hold on;
line([xy(1) xy(2)],[0 0], 'Color',[0.5 0.5 0.5],'MarkerSize',ms,'LineWidth',1); 
legend(p.ds1,p.ds2,p.ds3,p.ds4,1); axis(xy1); ylabel(p.yl2,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,p.vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig12c: AR length percentile
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear p; [p.dtas1,p.dtas2]=get_dtas(vm,wm,v1,w1);
p.s1='PRESENT'; p.s2='FUTURE'; p.s3='CLIMO'; p.s4='P4K';
p.s5='FUTURE-CTLIVT0'; p.s6='P4K-CTLIVT0';
bins=450; bin=[2000:bins:8000 8000+bins:3*bins:50000];
x=vm.ar.leng; a=findpdf(x,bin); p.y1=a.pctile; vm.len=a;
x=wm.ar.leng; a=findpdf(x,bin); p.y2=a.pctile; wm.len=a;
x=v1.ar.leng; a=findpdf(x,bin); p.y3=a.pctile; v1.len=a;
x=w1.ar.leng; a=findpdf(x,bin); p.y4=a.pctile; w1.len=a; 
x=wm2.ar.leng;a=findpdf(x,bin); p.y5=a.pctile; wm2.len=a;
x=w2.ar.leng; a=findpdf(x,bin); p.y6=a.pctile; w2.len=a; p.x=a.pct; 
p.dy1=(p.y2-p.y1)./p.y1*100./p.dtas1; %p.dy1=mizsmooth(p.dy1,3); 
p.dy2=(p.y4-p.y3)./p.y3*100./p.dtas2; %p.dy2=mizsmooth(p.dy2,3);
p.dy3=(p.y5-p.y1)./p.y1*100./p.dtas1; %p.dy3=mizsmooth(p.dy3,3); 
p.dy4=(p.y6-p.y3)./p.y3*100./p.dtas2; %p.dy4=mizsmooth(p.dy4,3);
p.ds1='FUTURE minus PRESENT';
p.ds2='P4K minus CLIMO';
p.ds3='FUTURE-CTLIVT0 minus PRESENT';
p.ds4='P4K-CTLIVT0 minus CLIMO'; i=50;
p.s1=sprintf('%s (median=%3.0f)',p.s1,p.y1(i));
p.s2=sprintf('%s (median=%3.0f)',p.s2,p.y2(i));
p.s3=sprintf('%s (median=%3.0f)',p.s3,p.y3(i));
p.s4=sprintf('%s (median=%3.0f)',p.s4,p.y4(i));
p.s5=sprintf('%s (median=%3.0f)',p.s5,p.y5(i));
p.s6=sprintf('%s (median=%3.0f)',p.s6,p.y6(i));
p.ls='-'; p.ms=1;
p.vname='Fig12c'; p.title='(c)'; p.xl='percent rank'; 
p.yl1='percentile value of AR length (km)'; 
p.yl2='percent change of percentile value (%/K)';
xmin=0; xmax=100; p.xy=[xmin xmax 2000 16000]; p.xy1=[xmin xmax 0 18]; 
x=p.x; xy=p.xy; xy1=p.xy1; ms=p.ms; ls=p.ls; %'none';
pms=[ 0, 0, 1200, 800]*0.8; fsize=14; lw1=1; lw=2; 
handle = figure('Position', pms,'visible','on');
ax1=gca; 
line(x,p.y1,'Color','k','Marker','*','MarkerSize',ms,'LineWidth',lw1,'LineStyle','--'); hold on; 
line(x,p.y2,'Color','k','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
line(x,p.y3,'Color','b','Marker','*','MarkerSize',ms,'LineWidth',lw1,'LineStyle','--');
line(x,p.y4,'Color','b','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
line(x,p.y5,'Color','c','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
line(x,p.y6,'Color','g','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
legend(p.s1,p.s2,p.s3,p.s4,p.s5,p.s6,2); axis(xy); set(gca,'FontSize',fsize);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl1,'FontSize',fsize);
title(p.title,'FontSize',fsize);
ms=1;
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
%nn=3; p.dy1=mizsmooth(p.dy1,nn); p.dy2=mizsmooth(p.dy2,nn);
line(x,p.dy1,'Color','r','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); hold on;
line(x,p.dy2,'Color','m','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); hold on;
line(x,p.dy3,'Color','r','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle','-.'); hold on;
line(x,p.dy4,'Color','m','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle','-.'); hold on;
line([xy(1) xy(2)],[0 0], 'Color',[0.5 0.5 0.5],'MarkerSize',ms,'LineWidth',1); 
legend(p.ds1,p.ds2,p.ds3,p.ds4,1); axis(xy1); ylabel(p.yl2,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,p.vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig12d: AR width percentile
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear p; [p.dtas1,p.dtas2]=get_dtas(vm,wm,v1,w1);
p.s1='PRESENT'; p.s2='FUTURE'; p.s3='CLIMO'; p.s4='P4K';
p.s5='FUTURE-CTLIVT0'; p.s6='P4K-CTLIVT0';
bins=50; bin=[100:bins:800 800+bins:3*bins:5000];
x=vm.ar.widt; a=findpdf(x,bin); p.y1=a.pctile; vm.len=a;
x=wm.ar.widt; a=findpdf(x,bin); p.y2=a.pctile; wm.len=a;
x=v1.ar.widt; a=findpdf(x,bin); p.y3=a.pctile; v1.len=a;
x=w1.ar.widt; a=findpdf(x,bin); p.y4=a.pctile; w1.len=a; 
x=wm2.ar.widt;a=findpdf(x,bin); p.y5=a.pctile; wm2.len=a;
x=w2.ar.widt; a=findpdf(x,bin); p.y6=a.pctile; w2.len=a; p.x=a.pct; 
p.dy1=(p.y2-p.y1)./p.y1*100./p.dtas1; %p.dy1=mizsmooth(p.dy1,3); 
p.dy2=(p.y4-p.y3)./p.y3*100./p.dtas2; %p.dy2=mizsmooth(p.dy2,3);
p.dy3=(p.y5-p.y1)./p.y1*100./p.dtas1; %p.dy3=mizsmooth(p.dy3,3); 
p.dy4=(p.y6-p.y3)./p.y3*100./p.dtas2; %p.dy4=mizsmooth(p.dy4,3);
p.ds1='FUTURE minus PRESENT';
p.ds2='P4K minus CLIMO';
p.ds3='FUTURE-CTLIVT0 minus PRESENT';
p.ds4='P4K-CTLIVT0 minus CLIMO'; i=50;
p.s1=sprintf('%s (median=%3.0f)',p.s1,p.y1(i));
p.s2=sprintf('%s (median=%3.0f)',p.s2,p.y2(i));
p.s3=sprintf('%s (median=%3.0f)',p.s3,p.y3(i));
p.s4=sprintf('%s (median=%3.0f)',p.s4,p.y4(i));
p.s5=sprintf('%s (median=%3.0f)',p.s5,p.y5(i));
p.s6=sprintf('%s (median=%3.0f)',p.s6,p.y6(i));
p.ls='-'; p.ms=1;
p.vname='Fig12d'; p.title='(d)'; p.xl='percent rank'; 
p.yl1='percentile value of AR width (km)';
p.yl2='percent change of percentile value (%/K)';
xmin=0; xmax=100; p.xy=[xmin xmax 150 1600]; p.xy1=[xmin xmax -2 18]; 
x=p.x; xy=p.xy; xy1=p.xy1; ms=p.ms; ls=p.ls; %'none';
pms=[ 0, 0, 1200, 800]*0.8; fsize=14; lw1=1; lw=2; 
handle = figure('Position', pms,'visible','on');
ax1=gca; 
line(x,p.y1,'Color','k','Marker','*','MarkerSize',ms,'LineWidth',lw1,'LineStyle','--'); hold on; 
line(x,p.y2,'Color','k','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
line(x,p.y3,'Color','b','Marker','*','MarkerSize',ms,'LineWidth',lw1,'LineStyle','--');
line(x,p.y4,'Color','b','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
line(x,p.y5,'Color','c','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
line(x,p.y6,'Color','g','Marker','s','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); 
legend(p.s1,p.s2,p.s3,p.s4,p.s5,p.s6,2); axis(xy); set(gca,'FontSize',fsize);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl1,'FontSize',fsize);
title(p.title,'FontSize',fsize);
ms=1;
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
%nn=3; p.dy1=mizsmooth(p.dy1,nn); p.dy2=mizsmooth(p.dy2,nn);
line(x,p.dy1,'Color','r','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); hold on;
line(x,p.dy2,'Color','m','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle',ls); hold on;
line(x,p.dy3,'Color','r','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle','-.'); hold on;
line(x,p.dy4,'Color','m','Marker','o','MarkerSize',ms,'LineWidth',lw1,'LineStyle','-.'); hold on;
line([xy(1) xy(2)],[0 0], 'Color',[0.5 0.5 0.5],'MarkerSize',ms,'LineWidth',1); 
legend(p.ds1,p.ds2,p.ds3,p.ds4,1); axis(xy1); ylabel(p.yl2,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,p.vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas1=tas1-tas0;
tas0=v1.tas_av_clm.ann; tas1=w1.tas_av_clm.ann; p.dtas2=tas1-tas0;
p.s0='C192AM4-PD'; p.s1='C192AM4-Future'; 
p.lm=vm.lm; p.a=vm.aa; 
p.vname='dtas_av_ann_future_p4K'; p.str='ANN';
p.cs1=[0 4]; p.s1='(a) MOD-Future minus MOD-Present';
p.cs2=[0 4]; p.s2='(b) MOD-P4K minus MOD-Climo';
p.z1=wm.tas_av_clm.ann-vm.tas_av_clm.ann; p.x1=wm.lon; p.y1=wm.lat;
p.z2=w1.tas_av_clm.ann-v1.tas_av_clm.ann; p.x1=wm.lon; p.y1=wm.lat;
plot_2d_diff_warm_2(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=v1.tas_av_clm.ann; tas1=w1.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-Climo'; p.s1='C192AM4-P4K'; 
p.lm=vm.lm; p.a=vm.aa; p.cs=[270 302]; p.cs1=[0 4];
p.vname='tas_av_ann_p4K'; p.str='ANN';
p.cs1=[0 4]; p.rel=0; p.s2='(P4K minus Climo)/\DeltaT';
p.z0=v1.tas_av_clm.ann; p.x0=v1.lon; p.y0=v1.lat;
p.z1=w1.tas_av_clm.ann; p.x1=w1.lon; p.y1=w1.lat;    
plot_2d_diff_warm(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Precipitable water change (annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-PD'; p.s1='C192AM4-Future'; 
p.lm=vm.lm; p.a=vm.aa; p.cs=[0 50]; 
p.vname='prw_av_ann_future'; p.str='ANN';
p.cs1=[-5 15]; p.rel=1; p.s2='(Future - PD)/PD\DeltaTs';
p.z0=vm.prw_av_clm.ann; p.x0=vm.lon; p.y0=vm.lat;
p.z1=wm.prw_av_clm.ann; p.x1=wm.lon; p.y1=wm.lat;    
plot_2d_diff_warm(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=v1.tas_av_clm.ann; tas1=w1.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-Climo'; p.s1='C192AM4-P4K'; 
p.lm=vm.lm; p.a=vm.aa; p.cs=[0 50]; 
p.vname='prw_av_ann_p4K'; p.str='ANN';
p.cs1=[-5 15]; p.rel=1; p.s2='(P4K - Climo)/PD\DeltaTs';
p.z0=v1.prw_av_clm.ann; p.x0=v1.lon; p.y0=v1.lat;
p.z1=w1.prw_av_clm.ann; p.x1=w1.lon; p.y1=w1.lat;    
plot_2d_diff_warm(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%IVT limit PD vs Future (annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-PD'; p.s1='C192AM4-Future'; p.lm=vm.lm; p.a=vm.aa; p.cs=[0 500]; 
p.vname='ivt_limit_clm_ann_future'; p.str='ANN';
p.cs1=[-50 50]; p.rel=0; p.s2='(Future - PD)/\DeltaTs';
%p.cs1=[-15 15]; p.rel=1; p.s2='(Future - PD)/PD\DeltaTs';
p.z0=vm.limit.ivt_limit_clm.ann; p.x0=vm.lon; p.y0=vm.lat;
p.z1=wm.limit.ivt_limit_clm.ann; p.x1=vm.lon; p.y1=vm.lat;    
plot_2d_diff_warm(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%IVT limit Climo vs P4K (annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=v1.tas_av_clm.ann; tas1=w1.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-Climo'; p.s1='C192AM4-P4K'; p.lm=vm.lm; p.a=vm.aa; p.cs=[50 500]; 
p.vname='ivt_limit_clm_ann_p4K'; p.str='ANN';
p.cs1=[-50 50]; p.rel=0; p.s2='(P4K - Climo)/\DeltaTs';
%p.cs1=[-15 15]; p.rel=1; p.s2='(P4K - Climo)/PD\DeltaTs';
p.z0=v1.limit.ivt_limit_clm.ann; p.x0=vm.lon; p.y0=vm.lat;
p.z1=w1.limit.ivt_limit_clm.ann; p.x1=vm.lon; p.y1=vm.lat;    
plot_2d_diff_warm(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%IVT limit PD vs Future (annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-PD'; p.s1='C192AM4-Future'; p.lm=vm.lm; p.a=vm.aa; p.cs=[0 500]; 
p.vname='ivt_limit_future-present2'; p.str='ANN';
p.cs1=[-50 50]; p.rel=0; p.s2='(Future - PD)/\DeltaTs';
%p.cs1=[-15 15]; p.rel=1; p.s2='(Future - PD)/PD\DeltaTs';
p.z0=vm.limit.ivt_limit_clm.ann; p.x0=vm.lon; p.y0=vm.lat;
p.z1=wm2.limit.ivt_limit_clm.ann; p.x1=vm.lon; p.y1=vm.lat;    
plot_2d_diff_warm(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%IVT limit Climo vs P4K (annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=v1.tas_av_clm.ann; tas1=w1.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-Climo'; p.s1='C192AM4-P4K'; p.lm=vm.lm; p.a=vm.aa; p.cs=[50 500]; 
p.vname='ivt_limit_p4k-clm'; p.str='ANN';
p.cs1=[-50 50]; p.rel=0; p.s2='(P4K - Climo)/\DeltaTs';
%p.cs1=[-15 15]; p.rel=1; p.s2='(P4K - Climo)/PD\DeltaTs';
p.z0=v1.limit.ivt_limit_clm.ann; p.x0=vm.lon; p.y0=vm.lat;
p.z1=w2.limit.ivt_limit_clm.ann; p.x1=vm.lon; p.y1=vm.lat;    
plot_2d_diff_warm(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR frequency response to warming (annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='C192AM4-PD'; p.s2='C192AM4-Future'; p.s3='Future minus PD';
p.vname='freq_ar_ann_1d'; x0=vo.lat; p.xl='latitude';
xmin=-90; xmax=90; p.xy=[xmin xmax 0 0.14]; p.xy1=[xmin xmax -20 20];
a=wm.freq_ar_clm.ann; a=mean(a,2); p.y1=a; p.x=vm.lat;
a=vm.freq_ar_clm.ann; a=mean(a,2); p.y0=a; p.ms=2; p.ls='-';
a=(p.y1-p.y0)./p.y0*100; p.dy=a; p.dy(1:30)=NaN; %p.dy=mizsmooth(a,3);
p.yl='AR frequency'; p.y2='percent difference (%)';
plot_1d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig13a-c: AR frequency response to warming (absoluate difference in annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas=tas1-tas0;
clear p; [p.dtas1,p.dtas2]=get_dtas(vm,wm,v1,w1);
p.vname='Fig13a-c'; p.str='ANN'; 
p.lm=vm.lm; p.a=vm.aa; p.cs1=[-0.01 0.01]; p.cs2=[-0.01 0.01];
p.s1='(a) FUTURE minus PRESENT (absolute)';p.s0=p.s1;
p.s2='(c) P4K minus CLIMO (absolute)';
p.z1=wm.freq_ar_clm.ann-vm.freq_ar_clm.ann; p.x1=wm.lon; p.y1=wm.lat;
p.z2=w1.freq_ar_clm.ann-v1.freq_ar_clm.ann;  
p.z0=vm.freq_ar_clm.ann; p.z3=v1.freq_ar_clm.ann;  
x=vm.ar.leng;  vm.ar_no =length(x)/vm.nyr;
x=wm.ar.leng;  wm.ar_no =length(x)/wm.nyr; (wm.ar_no-vm.ar_no)/vm.ar_no*100/0.99
x=v1.ar.leng;  v1.ar_no =length(x)/v1.nyr;
x=w1.ar.leng;  w1.ar_no =length(x)/w1.nyr; (w1.ar_no-v1.ar_no)/v1.ar_no*100/4.526
x=wm2.ar.leng; wm2.ar_no=length(x)/wm2.nyr;(wm2.ar_no-vm.ar_no)/vm.ar_no*100/0.99
x=w2.ar.leng;  w2.ar_no =length(x)/w2.nyr; (w2.ar_no-v1.ar_no)/v1.ar_no*100/4.526
for i=1:36
  yr0=2015+i-1;
  yr=wm.ar.yyy;  id=(yr==yr0); no1(i)=sum(id);
  yr=wm2.ar.yyy; id=(yr==yr0); no2(i)=sum(id);
end
plot_2d_diff_warm_2(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig13b-d: AR frequency response to warming (relative difference in annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas=tas1-tas0;
clear p; [p.dtas1,p.dtas2]=get_dtas(vm,wm,v1,w1);
p.vname='Fig13b-d'; p.str='ANN'; p.lm=vm.lm; p.a=vm.aa; 
p.cs1=[-15 15]; p.cs2=[-15 15]; p.x1=wm.lon; p.y1=wm.lat;
p.s1='(b) FUTURE minus PRESENT (relative)'; p.s0=p.s1;
p.s2='(d) P4K minus CLIMO (relative)';
p.z1=(wm.freq_ar_clm.ann-vm.freq_ar_clm.ann)./vm.freq_ar_clm.ann*100; 
p.z2=(w1.freq_ar_clm.ann-v1.freq_ar_clm.ann)./v1.freq_ar_clm.ann*100;   
p.z0=vm.freq_ar_clm.ann; p.z3=v1.freq_ar_clm.ann;
j1=116; j2=124; p.z1(j1:j2,:)=NaN; p.z2(j1:j2,:)=NaN;
plot_2d_diff_warm_2(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig14a-c: AR frequency response to warming (absoluate difference in annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas=tas1-tas0;
clear p; [p.dtas1,p.dtas2]=get_dtas(vm,wm,v1,w1);
p.vname='Fig14a-c'; p.str='ANN'; 
p.lm=vm.lm; p.a=vm.aa; p.cs1=[-0.02 0.02]; p.cs2=[-0.02 0.02];
p.s1='(a) FUTURE-CTLIVT0 minus PRESENT (absolute)';p.s0=p.s1;
p.s2='(c) P4K-CTLIVT0 minus CLIMO (absolute)';
p.z1=wm2.freq_ar_clm.ann-vm.freq_ar_clm.ann; p.x1=wm.lon; p.y1=wm.lat;
p.z2=w2.freq_ar_clm.ann -v1.freq_ar_clm.ann;   
p.z0=vm.freq_ar_clm.ann; p.z3=v1.freq_ar_clm.ann;  
plot_2d_diff_warm_2(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig14b-d: AR frequency response to warming (relative difference in annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas=tas1-tas0;
clear p; [p.dtas1,p.dtas2]=get_dtas(vm,wm,v1,w1);
p.vname='Fig14b-d'; p.str='ANN'; p.lm=vm.lm; p.a=vm.aa; 
p.cs1=[-30 30]; p.cs2=[-30 30]; p.x1=wm.lon; p.y1=wm.lat;
p.s1='(b) FUTURE-CTLIVT0 minus PRESENT (relative)';p.s0=p.s1;
p.s2='(d) P4K-CTLIVT0 minus CLIMO (relative)';
p.z1=(wm2.freq_ar_clm.ann-vm.freq_ar_clm.ann)./vm.freq_ar_clm.ann*100; 
p.z2=(w2.freq_ar_clm.ann -v1.freq_ar_clm.ann)./v1.freq_ar_clm.ann*100;   
p.z0=vm.freq_ar_clm.ann; p.z3=v1.freq_ar_clm.ann;
j1=116; j2=124; p.z1(j1:j2,:)=NaN; p.z2(j1:j2,:)=NaN;
plot_2d_diff_warm_2(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR frequency response to warming (annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-PD'; p.s1='C192AM4-Future'; 
p.vname='arfq_ann_climo_future'; p.str='ANN'; p.lm=vm.lm; p.a=vm.aa; p.cs=[0 0.12]; 
p.cs3=[-0.01 0.01]; p.rel=0; p.s3='(Future - PD)/\DeltaTs';
p.cs4=[-15    15];  p.rel=1; p.s4='(Future - PD)/PD/\DeltaTs';
p.z0=vm.freq_ar_clm.ann; p.x0=vm.lon; p.y0=vm.lat;
p.z1=wm.freq_ar_clm.ann; p.x1=wm.lon; p.y1=wm.lat;    
j1=119; j2=122; p.z1(j1:j2)=NaN; p.z2(j1:j2)=NaN;
plot_2d_diff_warm_4(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-PD'; p.s1='C192AM4-Future'; 
p.vname='arfq_ndjfm_climo_future'; p.str='NDJFM'; p.lm=vm.lm; p.a=vm.aa; p.cs=[0 0.12]; 
p.cs1=[-15    15];  p.rel=1; p.s2='(Future - PD)/PD/\DeltaTs';
%p.cs1=[-0.01 0.01]; p.rel=0; p.s2='(Future - PD)/\DeltaTs';
p.z0=vm.freq_ar_clm.ndjfm; p.x0=vm.lon; p.y0=vm.lat;
p.z1=wm.freq_ar_clm.ndjfm; p.x1=wm.lon; p.y1=wm.lat;    
plot_2d_diff_warm(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-PD'; p.s1='C192AM4-Future'; 
p.vname='arfq_mjjas_climo_future'; p.str='MJJAS'; p.lm=vm.lm; p.a=vm.aa; p.cs=[0 0.12]; 
p.cs1=[-15    15];  p.rel=1; p.s2='(Future - PD)/PD/\DeltaTs';
p.cs1=[-0.01 0.01]; p.rel=0; p.s2='(Future - PD)/\DeltaTs';
p.z0=vm.freq_ar_clm.mjjas; p.x0=vm.lon; p.y0=vm.lat;
p.z1=wm.freq_ar_clm.mjjas; p.x1=wm.lon; p.y1=wm.lat;    
plot_2d_diff_warm(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=v1.tas_av_clm.ann; tas1=w1.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-Climo'; p.s1='C192AM4-P4K'; 
p.lm=vm.lm; p.a=vm.aa; p.cs=[0 0.12];
p.vname='arfq_ann_climo_p4K'; p.str='ANN';
p.cs1=[-15    15];  p.rel=1; p.s2='(P4K - Climo)/climo/\DeltaTs';
p.cs1=[-0.01 0.01]; p.rel=0; p.s2='(P4K - Climo)/\DeltaTs';
p.z0=v1.freq_ar_clm.ann; p.x0=v1.lon; p.y0=v1.lat;
p.z1=w1.freq_ar_clm.ann; p.x1=w1.lon; p.y1=w1.lat;    
plot_2d_diff_warm(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=v1.tas_av_clm.ann; tas1=w1.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-Climo'; p.s1='C192AM4-P4K'; 
p.lm=vm.lm; p.a=vm.aa; p.cs=[0 0.12];
p.vname='arfq_ndjfm_climo_p4K'; p.str='NDJFM';
p.cs1=[-20    20];  p.rel=1; p.s2='(P4K - Climo)/Climo/\DeltaTs';
p.cs1=[-0.01 0.01]; p.rel=0; p.s2='(P4K - Climo)/\DeltaTs';
p.z0=v1.freq_ar_clm.ndjfm; p.x0=v1.lon; p.y0=v1.lat;
p.z1=w1.freq_ar_clm.ndjfm; p.x1=w1.lon; p.y1=w1.lat;    
plot_2d_diff_warm(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=v1.tas_av_clm.ann; tas1=w1.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-Climo'; p.s1='C192AM4-P4K'; 
p.lm=vm.lm; p.a=vm.aa; p.cs=[0 0.12];
p.vname='arfq_mjjas_climo_p4K'; p.str='MJJAS';
p.cs1=[-15    15];  p.rel=1; p.s2='(P4K - Climo)/Climo/\DeltaTs';
p.cs1=[-0.01 0.01]; p.rel=0; p.s2='(P4K - Climo)/\DeltaTs';
p.z0=v1.freq_ar_clm.mjjas; p.x0=v1.lon; p.y0=v1.lat;
p.z1=w1.freq_ar_clm.mjjas; p.x1=w1.lon; p.y1=w1.lat;    
plot_2d_diff_warm(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG IVT response to future warming (annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-PD'; p.s1='C192AM4-Future'; p.lm=vm.lm; p.a=vm.aa; p.cs=[0 800]; 
%p.cs1=[-50 50]; p.rel=0; p.s3='(Future minus Climo)/\DeltaT';
p.cs1=[-15  15];  p.rel=1; p.s2='(Future - PD)/PD/\DeltaT';
p.vname='ivt_aravg_ann_future'; p.str='ANN';
p.z0=vm.ivt_aravg_clm.ann; p.x0=vm.lon; p.y0=vm.lat;
p.z1=wm.ivt_aravg_clm.ann; p.x1=wm.lon; p.y1=wm.lat;    
plot_2d_diff_warm(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG IVT response to p4K warming (annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=v1.tas_av_clm.ann; tas1=w1.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-Climo'; p.s1='C192AM4-P4K'; p.lm=v1.lm; p.a=v1.aa; p.cs=[0 800]; 
%p.cs1=[-50 50]; p.rel=0; p.s3='(Future minus Climo)/\DeltaT';
p.cs1=[-15  15];  p.rel=1; p.s2='(P4K - Climo)/Climo/\DeltaT';
p.vname='ivt_aravg_ann_p4K'; p.str='ANN';
p.z0=v1.ivt_aravg_clm.ann; p.x0=v1.lon; p.y0=v1.lat;
p.z1=w1.ivt_aravg_clm.ann; p.x1=w1.lon; p.y1=w1.lat;    
plot_2d_diff_warm(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG IVT response to p4K warming (annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=v1.tas_av_clm.ann; tas1=w1.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-Climo'; p.s1='C192AM4-P4K'; p.lm=v1.lm; p.a=v1.aa; p.cs=[0 800]; 
%p.cs1=[-0.1 0.1]; p.rel=0; p.s3='(Future minus Climo)/\DeltaT';
p.cs1=[-15  15];  p.rel=1; p.s2='(P4K - Climo)/Climo/\DeltaT';
p.vname='ivt_armax_ann_p4K'; p.str='ANN';
p.z0=v1.ivt_armax_clm.ann; p.x0=v1.lon; p.y0=v1.lat;
p.z1=w1.ivt_armax_clm.ann; p.x1=w1.lon; p.y1=w1.lat;    
plot_2d_diff_warm(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR precipitation response to warming (annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s1='C192AM4-PD'; p.s2='C192AM4-Future'; p.lm=vm.lm; p.a=vm.aa; p.cs=[0 2]; 
%p.cs1=[-0.1 0.1]; p.rel=0; p.s3='(P4K minus Climo)/\DeltaT';
p.cs1=[-15  15];  p.rel=1; p.s3='(P4K minus Climo)/PD/\DeltaT';
p.vname='prav6h_ar_ann_future'; p.str='ANN';
p.z0=vm.prav6h_ar_clm.ann; p.x0=vm.lon; p.y0=vm.lat;
p.z1=wm.prav6h_ar_clm.ann; p.x1=wm.lon; p.y1=wm.lat;    
plot_2d_diff_warm(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=v1.tas_av_clm.ann; tas1=w1.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s1='C192AM4-Climo'; p.s2='C192AM4-P4K'; p.lm=vm.lm; p.a=vm.aa; p.cs=[0 2]; 
 p.cs1=[-0.1 0.1]; p.rel=0; p.s3='(P4K minus Climo)/\DeltaT';
%p.cs1=[-15  15];  p.rel=1; p.s3='(P4K minus Climo)/PD/\DeltaT';
p.vname='prav6h_ar_ann_p4K'; p.str='ANN';
p.z0=v1.prav6h_ar_clm.ann; p.x0=v1.lon; p.y0=v1.lat;
p.z1=w1.prav6h_ar_clm.ann; p.x1=w1.lon; p.y1=w1.lat;    
plot_2d_diff_warm(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%total precipitation response to warming (annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=wm.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s1='C192AM4-PD'; p.s2='C192AM4-Future'; p.lm=vm.lm; p.a=vm.aa; p.cs=[0 12];
 p.cs1=[-1   1];   p.rel=0; p.s3='(Future minus PD)/\DeltaT';
p.cs1=[-15  15];  p.rel=1; p.s3='(Future minus PD)/PD/\DeltaT';
p.vname='prav6h_av_ann_future'; p.str='ANN';
p.z0=vm.prav6h_av_clm.ann; p.x0=vm.lon; p.y0=vm.lat;
p.z1=wm.prav6h_av_clm.ann; p.x1=wm.lon; p.y1=wm.lat;    
plot_2d_diff_warm(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=v1.tas_av_clm.ann; tas1=w1.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s1='C192AM4-Climo'; p.s2='C192AM4-P4K'; p.lm=vm.lm; p.a=vm.aa; p.cs=[0 12]; 
 p.cs1=[-1   1];   p.rel=0; p.s3='(P4K minus Climo)/\DeltaT';
%p.cs1=[-15  15];  p.rel=1; p.s3='(P4K minus Climo)/Climo/\DeltaT';
p.vname='prav6h_av_ann_p4K'; p.str='ANN';
p.z0=v1.prav6h_av_clm.ann; p.x0=v1.lon; p.y0=v1.lat;
p.z1=w1.prav6h_av_clm.ann; p.x1=w1.lon; p.y1=w1.lat;    
plot_2d_diff_warm(p); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%annual mean water vapor content
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='C192AM4-PD'; p.s2='C192AM4-Future'; p.s3='Future minus PD';
p.lm=vm.lm; p.cs=[00 60]; p.cs1=[0 6];
p.vname='prw_av_clm_ann_future'; p.str='ANN'; p.a=vm.aa;
a=wm.prw_av_clm.ann; p.x1=wm.lon; p.y1=wm.lat; p.z1=a; 
a=vm.prw_av_clm.ann; p.x0=vm.lon; p.y0=vm.lat; p.z0=a;
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%total meridional water transport (2D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='C192AM4-PD'; p.s2='C192AM4-Future'; p.s3='Future minus PD';
p.lm=vm.lm; p.cs=[-50 50]; p.cs1=[-10 10];
p.vname='ivty_av_clm_ann_future'; p.str='ANN'; p.a=vm.aa;
a=wm.ivty_av_clm.ann; p.x1=wm.lon; p.y1=wm.lat; p.z1=a; 
a=vm.ivty_av_clm.ann; p.x0=vm.lon; p.y0=vm.lat; p.z0=a;
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR meridional water transport (2D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='C192AM4-PD'; p.s2='C192AM4-Future'; p.s3='Future minus PD';
p.lm=vm.lm; p.cs=[-50 50]; p.cs1=[-10 10];
p.vname='ivty_ar_clm_ann_future'; p.str='ANN'; p.a=vm.aa;
a=wm.ivty_ar_clm.ann; p.x1=wm.lon; p.y1=wm.lat; p.z1=a; 
a=vm.ivty_ar_clm.ann; p.x0=vm.lon; p.y0=vm.lat; p.z0=a;
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR zonal water transport (2D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='C192AM4-PD'; p.s2='C192AM4-Future'; p.s3='Future minus PD';
p.lm=vm.lm; p.cs=[-50 50]; p.cs1=[-10 10];
p.vname='ivtx_ar_clm_ann_future'; p.str='ANN'; p.a=vm.aa;
a=wm.ivtx_ar_clm.ann; p.x1=wm.lon; p.y1=wm.lat; p.z1=a; 
a=vm.ivtx_ar_clm.ann; p.x0=vm.lon; p.y0=vm.lat; p.z0=a;
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG meridional water transport (2D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='C192AM4-PD'; p.s2='C192AM4-Future'; p.s3='Future minus PD';
p.lm=vm.lm; p.cs=[-350 350]; p.cs1=[-50 50];
p.vname='ivty_aravg_clm_ann_future'; p.str='ANN'; p.a=vm.aa;
a=wm.ivty_aravg_clm.ann; p.x1=wm.lon; p.y1=wm.lat; p.z1=a; 
a=vm.ivty_aravg_clm.ann; p.x0=vm.lon; p.y0=vm.lat; p.z0=a;
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG zonal water transport (2D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='C192AM4-PD'; p.s2='C192AM4-Future'; p.s3='Future minus PD';
p.lm=vm.lm; p.cs=[-350 350]; p.cs1=[-100 100];
p.vname='ivtx_aravg_clm_ann_future'; p.str='ANN'; p.a=vm.aa;
a=wm.ivtx_aravg_clm.ann; p.x1=wm.lon; p.y1=wm.lat; p.z1=a; 
a=vm.ivtx_aravg_clm.ann; p.x0=vm.lon; p.y0=vm.lat; p.z0=a;
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%global warming test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR BASIC CHARACTERISTICS........................................
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig1a: PDF of length/width ratio
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-I'; s2='PRESENT'; s3='C192AM4-WARMING'; mylab='(a)';
bins=1; bin=[2:bins:20 20+bins:4*bins:50]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;
x=vo.ar.leng./vo.ar.widt; vo.rat=findpdf(x,bin);
x=vm.ar.leng./vm.ar.widt; vm.rat=findpdf(x,bin);
vname='Fig1a'; xmin=2; xmax=30; xy=[xmin xmax 0 0.17];  xy1=[xmin xmax -200 200]; 
x =vo.rat.binc; y0=vo.rat.pdf; y1=vm.rat.pdf; dy=(y1-y0)./y0*100; dy=mizsmooth(dy,3);
xl='length-width ratio'; yl='probability density';
plot_pdfbias(x,y0,y1,dy,xy,xy1,xl,yl,s1,s2,vname,mylab)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig1b: PDF of the length
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; s3='C192AM4-Future'; mylab='(b)';
bins=450; bin=[2000:bins:8000 8000+bins:3*bins:50000];
x=vo.ar.leng; vo.len=findpdf(x,bin); vo.ar_no=length(x)/vo.nyr;%s1=sprintf('%s (%7.1f)',s1,vo.ar_no);
x=vm.ar.leng; vm.len=findpdf(x,bin); vm.ar_no=length(x)/vm.nyr;%s2=sprintf('%s (%7.1f)',s2,vm.ar_no);
vname='Fig1b'; xmin=2000; xmax=16000; xy=[xmin xmax 0 0.00045]; xy1=[xmin xmax -50 50]; 
x=vo.len.binc; y0=vo.len.pdf; y1=vm.len.pdf; dy=(y1-y0)./y0*100; dy=mizsmooth(dy,3);
xl='length (km)'; yl='probability density (km^{-1})';
plot_pdfbias(x,y0,y1,dy,xy,xy1,xl,yl,s1,s2,vname,mylab)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig1c: PDF of the width
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; s3='C192AM4-Future'; mylab='(c)';
bins=50; bin=[100:bins:800 800+bins:3*bins:5000];
x=vo.ar.widt; vo.wid=findpdf(x,bin);
x=vm.ar.widt; vm.wid=findpdf(x,bin);
vname='Fig1c'; xmin=100; xmax=2000; xy=[xmin xmax 0 0.0025];  xy1=[xmin xmax -50 50]; 
x =vo.wid.binc; y0=vo.wid.pdf; y1=vm.wid.pdf; dy=(y1-y0)./y0*100; dy=mizsmooth(dy,3);
xl='width (km)'; yl='probability density (km^{-1})';
plot_pdfbias(x,y0,y1,dy,xy,xy1,xl,yl,s1,s2,vname,mylab)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig1d: PDF of the center of latitude
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; s3='C192AM4-WARMING'; mylab='(d)';
bins=2; bin=[-90 -82 :2*bins:-60 -60+bins:bins:-20 -15 -5 5 15 20:bins:60 60+bins:2*bins:82 90];
x=vo.ar.clat; vo.clat=findpdf(x,bin);
x=vm.ar.clat; vm.clat=findpdf(x,bin);
vname='Fig1d'; xmin=-90; xmax=90; xy=[xmin xmax 0 0.025];  xy1=[xmin xmax -50 50];
x =vo.clat.binc; y0=vo.clat.pdf; y1=vm.clat.pdf; dy=(y1-y0)./y0*100; dy=mizsmooth(dy,3);
xl='latitude of AR centeroid (degree)'; yl='probability density (degree^{-1})';
plot_pdfbias(x,y0,y1,dy,xy,xy1,xl,yl,s1,s2,vname,mylab)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig1e: PDF of the equaorward extent of latitude
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; s3='C192AM4-WARMING'; mylab='(e)';
bins=4; bin=[-90 -82 :2*bins:-60 -60+bins:bins:-20 -15 -5 5 15 20:bins:60 60+bins:2*bins:82 90];
bins=6; bin=[-90 -82 :2*bins:-60 -60+bins:bins:-20 -15 -5 5 15 20:bins:60 60+bins:2*bins:82 90];
x=vo.ar.elat; vo.elat=findpdf(x,bin);
x=vm.ar.elat; vm.elat=findpdf(x,bin);
vname='Fig1e'; xmin=-90; xmax=90; xy=[xmin xmax 0 0.025];  xy1=[xmin xmax -50 50];
x =vo.elat.binc; y0=vo.elat.pdf; y1=vm.elat.pdf; dy=(y1-y0)./y0*100; dy=mizsmooth(dy,3);
xl='latitude of AR maximum equatorward extent (degree)'; yl='probability density (degree^{-1})';
plot_pdfbias(x,y0,y1,dy,xy,xy1,xl,yl,s1,s2,vname,mylab)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig1f: PDF of the poleward extent of latitude
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; s3='C192AM4-WARMING'; mylab='(f)';
bins=4; bin=[-90 -82 :2*bins:-60 -60+bins:bins:-20 -15 -5 5 15 20:bins:60 60+bins:2*bins:82 90];
bins=6; bin=[-90 -82 :2*bins:-60 -60+bins:bins:-20 -15 -5 5 15 20:bins:60 60+bins:2*bins:82 90];
x=vo.ar.plat; vo.plat=findpdf(x,bin);
x=vm.ar.plat; vm.plat=findpdf(x,bin);
vname='Fig1f'; xmin=-90; xmax=90; xy=[xmin xmax 0 0.025];  xy1=[xmin xmax -50 50];
x =vo.plat.binc; y0=vo.plat.pdf; y1=vm.plat.pdf; dy=(y1-y0)./y0*100; dy=mizsmooth(dy,3);
xl='latitude of AR maximum poleward extent (degree)'; yl='probability density (degree^{-1})';
plot_pdfbias(x,y0,y1,dy,xy,xy1,xl,yl,s1,s2,vname,mylab)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR PDF of the landfall latitude
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; s3='C192AM4-WARMING'; mylab='';
bins=4; bin=[-90 :bins: 90];
x=-vo.ar.llat; vo.llat=findpdf(x,bin);
x= vm.ar.llat; vm.llat=findpdf(x,bin);
vname='llat_pdf'; xmin=-90; xmax=90; xy=[xmin xmax 0 0.025];  xy1=[xmin xmax -300 300];
x =vo.llat.binc; y0=vo.llat.pdf; y1=vm.llat.pdf; dy=(y1-y0)./y0*100; dy=mizsmooth(dy,3);
xl='latitude of AR landfall location (degree)'; yl='probability density (degree^{-1})';
plot_pdfbias(x,y0,y1,dy,xy,xy1,xl,yl,s1,s2,vname,mylab)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig1g: PDF of the magnitude of mean IVT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; s3='C192AM4-WARMING'; mylab='(g)';
bins=20; bin=[0 :bins:1200]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
x=sqrt(vo.ar.ivtz.^2+vo.ar.ivtm.^2); vo.ivt=findpdf(x,bin);
x=sqrt(vm.ar.ivtz.^2+vm.ar.ivtm.^2); vm.ivt=findpdf(x,bin);
vname='Fig1g'; xmin=0; xmax=1000; xy=[xmin xmax 0 0.003];  xy1=[xmin xmax -100 100];
x =vo.ivt.binc; y0=vo.ivt.pdf; y1=vm.ivt.pdf; dy=(y1-y0)./y0*100; dy=mizsmooth(dy,3);
xl='magnitude of mean IVT (kg m^{-1}s^{-1})'; yl='probability density (ms kg^{-1})';
plot_pdfbias(x,y0,y1,dy,xy,xy1,xl,yl,s1,s2,vname,mylab)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig1h: PDF of the zonal IVT strength
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; s3='C192AM4-WARMING'; mylab='(h)';
bins=20; bin=[-1000:5*bins:0 0+bins:bins:700 700+bins:5*bins:1200]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
x=vo.ar.ivtz; vo.ivtz=findpdf(x,bin);
x=vm.ar.ivtz; vm.ivtz=findpdf(x,bin); %x=wm.ar.ivtz; wm.ivtz=findpdf(x,bin);
vname='Fig1h'; xmin=-800; xmax=1000; xy=[xmin xmax 0 0.003];  xy1=[xmin xmax -100 100];
x =vo.ivtz.binc; y0=vo.ivtz.pdf; y1=vm.ivtz.pdf; dy=(y1-y0)./y0*100; dy=mizsmooth(dy,3);
xl='zonal IVT (kg m^{-1}s^{-1})'; yl='probability density (ms kg^{-1})';
plot_pdfbias(x,y0,y1,dy,xy,xy1,xl,yl,s1,s2,vname,mylab)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig1i: PDF of the meridional IVT strength
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; s3='C192AM4-WARMING'; mylab='(i)';
bins=20; bin=[-1200:100:-700 -700+bins:bins:700-bins 700:100:1200]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
x=vo.ar.ivtm; vo.ivtm=findpdf(x,bin);
x=vm.ar.ivtm; vm.ivtm=findpdf(x,bin); %x=wm.ar.ivtm; wm.ivtm=findpdf(x,bin);
vname='Fig1i'; xmin=-700; xmax=700; xy=[xmin xmax 0 0.003];  xy1=[xmin xmax -100 100];
x =vo.ivtm.binc; y0=vo.ivtm.pdf; y1=vm.ivtm.pdf; dy=(y1-y0)./y0*100; dy=mizsmooth(dy,3);
xl='meridional IVT (kg m^{-1}s^{-1})'; yl='probability density (ms kg^{-1})';
plot_pdfbias(x,y0,y1,dy,xy,xy1,xl,yl,s1,s2,vname,mylab)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig1j: PDF of the direction of mean IVT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; s3='C192AM4-WARMING'; mylab='(j)';
bins=1; bin=[0 :bins:360]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
x=vo.ar.ivtd; vo.ivtd=findpdf(x,bin);
x=vm.ar.ivtd; vm.ivtd=findpdf(x,bin); %x=wm.ar.ivtd; wm.ivtd=findpdf(x,bin);
vname='Fig1j'; xmin=0; xmax=360; xy=[xmin xmax 0 0.015]; xy1=[xmin xmax -100 100];
x =vo.ivtd.binc; y0=vo.ivtd.pdf; y1=vm.ivtd.pdf; dy=(y1-y0)./y0*100; dy=mizsmooth(dy,3);
xl='direction of mean IVT (degree)'; yl='probability density (degree^{-1})';
plot_pdfbias(x,y0,y1,dy,xy,xy1,xl,yl,s1,s2,vname,mylab)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig1k: AR PDF of the direction of mean IVT in polar coordinate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; s3='C192AM4-WARMING'; mylab='(k)';
bins=1; bin=[0 :bins:360]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
x=vo.ar.ivtd; vo.ivtd=findpdf(x,bin);
x=vm.ar.ivtd; vm.ivtd=findpdf(x,bin); %x=wm.ar.ivtd; wm.ivtd=findpdf(x,bin);
x =vo.ivtd.binc; y0=vo.ivtd.pdf; y1=vm.ivtd.pdf; dy=(y1-y0)./y0*100; dy=mizsmooth(dy,3);
xx=x*2*pi/360; vname='Fig1k'
pms=[ 0, 0, 1200, 800]*0.6; fsize=20; lw=2; msize=4; %msize=4;
handle = figure('Position', pms,'visible','on');
polar(xx,y0,'k-'); hold on; text( 0.006,0.005,'NH','FontSize',fsize);
polar(xx,y1,'b-');          text(-0.007,0.005,'SH','FontSize',fsize);
view([90 -90]);
set(gca,'FontSize',fsize); text(0.015,0.015,mylab,'FontSize',fsize);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig1l: PDF of the coherence of IVT direction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; s3='C192AM4-WARMING'; mylab='(l)';
bins=0.005; bin=[0 0.5:bins:1.005]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;
x=vo.ar.coh; vo.coh=findpdf(x,bin);
x=vm.ar.coh; vm.coh=findpdf(x,bin);
vname='Fig1l'; xmin=0.5; xmax=1; xy=[xmin xmax 0 10]; xy1=[xmin xmax -100 100];
x =vo.coh.binc; y0=vo.coh.pdf; y1=vm.coh.pdf; dy=(y1-y0)./y0*100; dy=mizsmooth(dy,3);
xl='coherence of IVT direction'; yl='probability density';
plot_pdfbias(x,y0,y1,dy,xy,xy1,xl,yl,s1,s2,vname,mylab)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig1j: PDF of the direction of mean IVT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-I'; s2='PRESENT'; s3='C192AM4-WARMING'; mylab='(j)';
bins=1; bin=[0 :bins:360]; dbin=diff(bin); binc=(bin(1:end-1)+bin(2:end))/2;%dbin=1;
x=vo.ar.ivtd; vo.ivtd=findpdf(x,bin);
x=vm.ar.ivtd; vm.ivtd=findpdf(x,bin); %x=wm.ar.ivtd; wm.ivtd=findpdf(x,bin);
id=(vo.ar.clat>0); x=vo.ar.ivtd(id); vo.ivtd_nh=findpdf(x,bin);
id=(vm.ar.clat>0); x=vm.ar.ivtd(id); vm.ivtd_nh=findpdf(x,bin);
id=(vo.ar.clat<0); x=vo.ar.ivtd(id); vo.ivtd_sh=findpdf(x,bin);
id=(vm.ar.clat<0); x=vm.ar.ivtd(id); vm.ivtd_sh=findpdf(x,bin);
vname='Fig1j'; xmin=0; xmax=360; xy=[xmin xmax 0 0.015]; xy1=[xmin xmax -100 100];
xl='direction of mean IVT (degree)'; yl='probability density (degree^{-1})';
x =vo.ivtd.binc; y0=vo.ivtd.pdf; y1=vm.ivtd.pdf; dy=(y1-y0)./y0*100; dy=mizsmooth(dy,3);
pms=[ 0, 0, 1200, 800]*0.6; fsize=20; lw=2; msize=8; msize=2;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x,y0,'Color','k','Marker','*','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x,y1,'Color','b','Marker','s','MarkerSize',msize,'LineWidth',lw); 
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
%legend(s1,s2,2); 
%text(55, 0.01,'NH','FontSize',fsize);
%text(105,0.0126,'SH','FontSize',fsize);
line(x,vo.ivtd_nh.pdf*0.5,'Color','r','LineStyle','-','MarkerSize',msize,'LineWidth',1); hold on;
line(x,vm.ivtd_nh.pdf*0.5,'Color','m','LineStyle','-','MarkerSize',msize,'LineWidth',1); 
line(x,vo.ivtd_sh.pdf*0.5,'Color','g','LineStyle','-','MarkerSize',msize,'LineWidth',1); hold on;
line(x,vm.ivtd_sh.pdf*0.5,'Color','c','LineStyle','-','MarkerSize',msize,'LineWidth',1); 
legend('ERA-I','PRESENT',...
       'ERA-I [P(NH)/2]','PRESENT [P(NH)/2]',...
       'ERA-I [P(SH)/2]','PRESENT [P(SH)/2]',1);
legend('boxoff');
axis(xy); mylabel(xy,1,mylab,fsize); set(gca,'FontSize',fsize);
opt=0;
if (opt==1)
  ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
  line(x,vo.ivtd_nh.pdf,'Color','r','LineStyle','-','MarkerSize',msize,'LineWidth',1); hold on;
  line(x,vm.ivtd_nh.pdf,'Color','m','LineStyle','--','MarkerSize',msize,'LineWidth',1); 
  line(x,vo.ivtd_sh.pdf,'Color','g','LineStyle','-','MarkerSize',msize,'LineWidth',1); hold on;
  line(x,vm.ivtd_sh.pdf,'Color','c','LineStyle','--','MarkerSize',msize,'LineWidth',1); 
  axis([0 360 0 0.04]);
  legend('ERA-Interim (NH)','MOD-Present (NH)','ERA-Interim (SH)','MOD-Present(SH)',1); %axis(xy1); 
  ylabel(yl,'FontSize',fsize);
end
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR FREQUENCY AND ITS VARIABILITY WITH LARGE-SCALE ENVIRONMENT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig2: zonal scale new
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-I'; p.s2='PRESENT'; p.s3='model minus ERAI';
p.vname='Fig2'; x0=vo.lat; p.xl='latitude'; p.ms=1;p.ls='-';
xmin=-83; xmax=83; p.xy=[xmin xmax 0 0.16]; p.xy1=[xmin xmax -1. 1.];
a=vm.ar_zscale; a=squeeze(nanmean(nanmean(a,2),1)); p.y1=a; p.x=vm.lat;
a=vo.ar_zscale; a=squeeze(nanmean(nanmean(a,2),1)); p.y0=interp1(x0,a,p.x,'linear');
a=(p.y1-p.y0)./p.y0*100; p.dy=a; p.dy(1:30)=NaN; %p.dy=mizsmooth(a,3);
p.yl='AR fractional zonal circumference'; p.y2='percent difference (%)';
p.y0=p.y0; p.y1=p.y1; p1=p;
%lat0=80; id=(vm.lat>lat0)|(vm.lat<-lat0);p.y0(id)=NaN; p.y1(id)=NaN;
%plot_1d_diff(p)
b=576*vm.dx(:,1);%b:total length in m at each latitude
p.vname='ratio_ivty_ann_climo_lat'; x0=vo.lat; p.xl='latitude';
xmin=-90; xmax=90; p.xy=[xmin xmax -2 2]; p.xy1=[xmin xmax -1 1];
a=vm.ivty_ar_clm.ann; a=mean(a,2); p.y1=a.*b; p.x=vm.lat;
a=vo.ivty_ar_clm.ann; a=mean(a,2); p.y0=interp1(x0,a,p.x,'linear').*b;
a=vm.ivty_av_clm.ann; a=mean(a,2); p.Y1=a.*b; 
a=vo.ivty_av_clm.ann; a=mean(a,2); p.Y0=interp1(x0,a,p.x,'linear').*b;
p.y1=p.y1./p.Y1; p.y0=p.y0./p.Y0; p.ms=1; p.ls='none';
a=(p.y1-p.y0); p.dy=a; %p.dy=mizsmooth(a,3);
lat0=30; id=(vm.lat>-lat0)&(vm.lat<lat0); p.y0(id)=NaN; p.y1(id)=NaN;
lat0=83; id=(vm.lat<-lat0)|(vm.lat>lat0); p.y0(id)=NaN; p.y1(id)=NaN;
p.y2='AR fractional meridional water transport'; 
plot_1d_zscale_ivty(p1,p);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR zonal scale
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='model minus ERAI';
p.vname='ar_zonal_scale'; x0=vo.lat; p.xl='latitude'; p.ms=4;p.ls='-';
xmin=-90; xmax=90; p.xy=[xmin xmax 0 15]; p.xy1=[xmin xmax -20 20];
a=vm.freq_ar_clm.ann; a=mean(a,2); p.y1=a; p.x=vm.lat;
a=vo.freq_ar_clm.ann; a=mean(a,2); p.y0=interp1(x0,a,p.x,'linear');
a=(p.y1-p.y0)./p.y0*100; p.dy=a; p.dy(1:30)=NaN; %p.dy=mizsmooth(a,3);
p.yl='AR zonal scale (%)'; p.y2='percent difference (%)';
p.y0=p.y0*100; p.y1=p.y1*100; plot_1d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR detection IVT limit PD vs ERAI (annual climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; lm=vm.lm; cs=[0 500]; cs1=[-100 100];
vname='ivt_limit_clm_ann'; str='ANN'; 
z0=vo.limit.ivt_limit_clm.ann; x0=vo.lon; y0=vo.lat;
z1=vm.limit.ivt_limit_clm.ann; x1=vm.lon; y1=vm.lat;    
z0=interp_grid(z0,x1,y1,x0,y0); %zx=interp_grid(z1,x0,y0,x1,y1); 
plot_arfqbias(x1,y1,z0,z1,lm,cs,cs1,s1,s2,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR detection IVT limit PD vs ERAI (NDJFM climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; lm=vm.lm; cs=[0 500]; cs1=[-100 100];
vname='ivt_limit_clm_ndjfm'; str='NDJFM'; 
z0=vo.limit.ivt_limit_clm.ndjfm; x0=vo.lon; y0=vo.lat;
z1=vm.limit.ivt_limit_clm.ndjfm; x1=vm.lon; y1=vm.lat;    
z0=interp_grid(z0,x1,y1,x0,y0); %zx=interp_grid(z1,x0,y0,x1,y1); 
plot_arfqbias(x1,y1,z0,z1,lm,cs,cs1,s1,s2,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR detection IVT limit PD vs ERAI (MJJAS climatology)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; lm=vm.lm; cs=[0 500]; cs1=[-100 100];
vname='ivt_limit_clm_mjjas'; str='MJJAS'; 
z0=vo.limit.ivt_limit_clm.mjjas; x0=vo.lon; y0=vo.lat;
z1=vm.limit.ivt_limit_clm.mjjas; x1=vm.lon; y1=vm.lat;    
z0=interp_grid(z0,x1,y1,x0,y0); %zx=interp_grid(z1,x0,y0,x1,y1); 
plot_arfqbias(x1,y1,z0,z1,lm,cs,cs1,s1,s2,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%frequency of occurrence MAP (annual climatology).............
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; s3='';lm=vm.lm; cs=[0 0.12]; cs1=[-0.03 0.03];
vname='arfq_ann_climo'; str='ANN'; vbin=[0:0.01:0.1]; dbin=[-0.02:0.001:0.02]; 
z0=vo.freq_ar_clm.ann; x0=vo.lon; y0=vo.lat;
z1=vm.freq_ar_clm.ann; x1=vm.lon; y1=vm.lat;    
z0=interp_grid(z0,x1,y1,x0,y0); %zx=interp_grid(z1,x0,y0,x1,y1); 
plot_arfqbias(x1,y1,z0,z1,lm,cs,cs1,s1,s2,s3,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig3a-c: AR frequency (NDJFM)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='(a) ERA-I'; s2='(b) PRESENT'; s3='(c) (b) minus (a)'; 
lm=vm.lm; cs=[0 0.12]; cs1=[-0.03 0.03]; vname='Fig3a-c'; 
str='NDJFM'; vbin=[0:0.01:0.1]; dbin=[-0.02:0.001:0.02]; 
z0=vo.freq_ar_clm.ndjfm; x0=vo.lon; y0=vo.lat;
z1=vm.freq_ar_clm.ndjfm; x1=vm.lon; y1=vm.lat;    
z0=interp_grid(z0,x1,y1,x0,y0); %zx=interp_grid(z1,x0,y0,x1,y1); 
plot_arfqbias(x1,y1,z0,z1,lm,cs,cs1,s1,s2,s3,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig3d-f: AR frequency (MJJAS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='(d) ERA-I'; s2='(e) PRESENT'; s3='(f) (e) minus (d)';
lm=vm.lm; cs=[0 0.12]; cs1=[-0.03 0.03]; vname='Fig3d-f';
str='MJJAS'; vbin=[0:0.01:0.1]; dbin=[-0.02:0.001:0.02]; 
z0=vo.freq_ar_clm.mjjas; x0=vo.lon; y0=vo.lat;
z1=vm.freq_ar_clm.mjjas; x1=vm.lon; y1=vm.lat;    
z0=interp_grid(z0,x1,y1,x0,y0); %zx=interp_grid(z1,x0,y0,x1,y1); 
plot_arfqbias(x1,y1,z0,z1,lm,cs,cs1,s1,s2,s3,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig4a-c: AR frequency (NDJFM minus ANN)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='(a) ERA-I'; s2='(b) PRESENT'; s3='(c) (b) minus (a)';
lm=vm.lm; cs=[-0.06 0.06]; cs1=[-0.03 0.03]; vname='Fig4a-c'; 
str='NDJFM minus ANN'; vbin=[0:0.01:0.1]; dbin=[-0.02:0.001:0.02]; 
z0=vo.freq_ar_clm.ndjfm-vo.freq_ar_clm.ann; x0=vo.lon; y0=vo.lat;
z1=vm.freq_ar_clm.ndjfm-vm.freq_ar_clm.ann; x1=vm.lon; y1=vm.lat;    
z0=interp_grid(z0,x1,y1,x0,y0); %zx=interp_grid(z1,x0,y0,x1,y1); 
plot_arfqbias(x1,y1,z0,z1,lm,cs,cs1,s1,s2,s3,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig4e-f: AR frequency (MJJAS minus ANN)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='(d) ERA-I'; s2='(e) PRESENT'; s3='(f) (e) minus (d)';
lm=vm.lm; cs=[-0.06 0.06]; cs1=[-0.03 0.03]; vname='Fig4d-f'; 
str='MJJAS minus ANN'; vbin=[0:0.01:0.1]; dbin=[-0.02:0.001:0.02]; 
z0=vo.freq_ar_clm.mjjas-vo.freq_ar_clm.ann; x0=vo.lon; y0=vo.lat;
z1=vm.freq_ar_clm.mjjas-vm.freq_ar_clm.ann; x1=vm.lon; y1=vm.lat;    
z0=interp_grid(z0,x1,y1,x0,y0); 
plot_arfqbias(x1,y1,z0,z1,lm,cs,cs1,s1,s2,s3,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig5a-c: AR frequency (NDJFM El-Nino years minus La-Nina years%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='(a) ERA-I'; s2='(b) PRESENT'; s3='(c) (b) minus (a)';
lm=vm.lm; cs=[-0.06 0.06]; cs1=[-0.06 0.06]; sea='NDJFM'; 
vname='Fig5a-c'; str=strcat(sea,', El-Nino minus La-Nina'); 
x1=vm.lon; y1=vm.lat; x0=vo.lon; y0=vo.lat;
[id_obs id_mod]=get_id_ENSO(1979,2014,0.8,'neg',sea);%La-Nina
z1=get_arfq_spec(vm.freq_ar,id_mod); 
z0=get_arfq_spec(vo.freq_ar,id_obs);  z0=interp_grid(z0,x1,y1,x0,y0); 
[id_obs id_mod]=get_id_ENSO(1979,2014,0.8,'pos',sea);%El-Nino
z1x=get_arfq_spec(vm.freq_ar,id_mod); 
z0x=get_arfq_spec(vo.freq_ar,id_obs); z0x=interp_grid(z0x,x1,y1,x0,y0); 
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,s3,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig5d-f: AR frequency (MJJAS El-Nino years minus La-Nina years)%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='(d) ERA-I'; s2='(e) PRESENT';  s3='(f) (e) minus (d)';
lm=vm.lm; cs=[-0.06 0.06]; cs1=[-0.06 0.06]; sea='MJJAS'; 
vname='Fig5d-f'; str=strcat(sea,', El-Nino minus La-Nina');
x1=vm.lon; y1=vm.lat; x0=vo.lon; y0=vo.lat;
[id_obs id_mod]=get_id_ENSO(1979,2014,0.8,'neg',sea);
z1=get_arfq_spec(vm.freq_ar,id_mod); 
z0=get_arfq_spec(vo.freq_ar,id_obs);  z0=interp_grid(z0,x1,y1,x0,y0); 
[id_obs id_mod]=get_id_ENSO(1979,2014,0.8,'pos',sea);
z1x=get_arfq_spec(vm.freq_ar,id_mod); 
z0x=get_arfq_spec(vo.freq_ar,id_obs); z0x=interp_grid(z0x,x1,y1,x0,y0); 
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,s3,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR frequency (NDJFM El-Nino years minus NDJFM climatlogy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[id_obs id_mod]=get_id_ENSO(1979,2014,0.8,'pos','NDJFM');
s1='ERA-Interim'; s2='C192AM4-PD'; lm=vm.lm; cs=[-0.05 0.05]; cs1=[-0.03 0.03];
vname='arfq_eln_ndjfm'; str='NDJFM, El-Nino minus climo'; 
z1=vm.freq_ar_clm.ndjfm; x1=vm.lon; y1=vm.lat;
z0=vo.freq_ar_clm.ndjfm; x0=vo.lon; y0=vo.lat; z0=interp_grid(z0, x1,y1,x0,y0); 
z1x=get_arfq_spec(vm.freq_ar,id_mod); 
z0x=get_arfq_spec(vo.freq_ar,id_obs); z0x=interp_grid(z0x,x1,y1,x0,y0); 
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR frequency (MJJAS El-Nino years minus MJJAS climatlogy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; lm=vm.lm; cs=[-0.05 0.05]; cs1=[-0.03 0.03];
vname='arfq_eln_mjjas'; str='MJJAS, El-Nino minus climo'; vbin=[0:0.01:0.1]; dbin=[-0.02:0.001:0.02]; 
z0=vo.freq_ar_clm.mjjas; x0=vo.lon; y0=vo.lat;
z1=vm.freq_ar_clm.mjjas; x1=vm.lon; y1=vm.lat;
yr1=1979; yr2=2014; a0=0.8; x=read_oni(yr1,yr2,a0); id=x.id_eln_MJJAS;
z0x=get_arfq_spec(vo.freq_ar,id);
z1x=get_arfq_spec(vm.freq_ar,id);
z0 =interp_grid(z0, x1,y1,x0,y0); 
z0x=interp_grid(z0x,x1,y1,x0,y0); 
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR frequency (NDJFM La-Nina years minus NDJFM climatlogy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; lm=vm.lm; cs=[-0.05 0.05]; cs1=[-0.03 0.03];
vname='arfq_lan_ndjfm'; str='NDJFM, La-Nina minus climo'; vbin=[0:0.01:0.1]; dbin=[-0.02:0.001:0.02]; 
z0=vo.freq_ar_clm.ndjfm; x0=vo.lon; y0=vo.lat;
z1=vm.freq_ar_clm.ndjfm; x1=vm.lon; y1=vm.lat;
yr1=1979; yr2=2014; a0=0.8; x=read_oni(yr1,yr2,a0); id=x.id_lan_NDJFM;
z0x=get_arfq_spec(vo.freq_ar,id);
z1x=get_arfq_spec(vm.freq_ar,id);
z0 =interp_grid(z0, x1,y1,x0,y0); 
z0x=interp_grid(z0x,x1,y1,x0,y0); 
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR frequency (MJJAS La-Nina years minus MJJAS climatlogy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='ERA-Interim'; s2='C192AM4-PD'; lm=vm.lm; cs=[-0.05 0.05]; cs1=[-0.03 0.03];
vname='arfq_lan_mjjas'; str='MJJAS, La-Nina minus climo'; vbin=[0:0.01:0.1]; dbin=[-0.02:0.001:0.02]; 
z0=vo.freq_ar_clm.mjjas; x0=vo.lon; y0=vo.lat;
z1=vm.freq_ar_clm.mjjas; x1=vm.lon; y1=vm.lat;
yr1=1979; yr2=2014; a0=0.8; x=read_oni(yr1,yr2,a0); id=x.id_lan_MJJAS;
z0x=get_arfq_spec(vo.freq_ar,id);
z1x=get_arfq_spec(vm.freq_ar,id);
z0 =interp_grid(z0, x1,y1,x0,y0); 
z0x=interp_grid(z0x,x1,y1,x0,y0); 
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR frequency (NDJFM season; positive AO minus negative AO)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='(a) ERA-Interim'; s2='(b) C192AM4-PD'; s3='(c) (b) minus (a)';
lm=vm.lm; cs=[-0.06 0.06]; cs1=[-0.06 0.06]; sea='NDJFM';
vname=strcat('arfq_dAO_',sea); str=strcat(sea,', +AO minus -AO'); 
[id_obs id_mod]=get_id_AO(1979,2014,0.8,'neg',sea);
z1=get_arfq_spec(vm.freq_ar,id_mod); x1=vm.lon; y1=vm.lat;
z0=get_arfq_spec(vo.freq_ar,id_obs); x0=vo.lon; y0=vo.lat; z0=interp_grid(z0,x1,y1,x0,y0); 
[id_obs id_mod]=get_id_AO(1979,2014,0.8,'pos',sea);
z1x=get_arfq_spec(vm.freq_ar,id_mod);
z0x=get_arfq_spec(vo.freq_ar,id_obs); z0x=interp_grid(z0x,x1,y1,x0,y0); 
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,s3,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR frequency (MJJAS season; positive AO minus negative AO)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='(d) ERA-Interim'; s2='(e) C192AM4-PD'; s3='(f) (e) minus (d)';
lm=vm.lm; cs=[-0.06 0.06]; cs1=[-0.06 0.06]; sea='MJJAS';
vname=strcat('arfq_dAO_',sea); str=strcat(sea,', +AO minus -AO');
[id_obs id_mod]=get_id_AO(1979,2014,0.8,'neg',sea);
z1=get_arfq_spec(vm.freq_ar,id_mod); x1=vm.lon; y1=vm.lat;
z0=get_arfq_spec(vo.freq_ar,id_obs); x0=vo.lon; y0=vo.lat; z0=interp_grid(z0,x1,y1,x0,y0); 
[id_obs id_mod]=get_id_AO(1979,2014,0.8,'pos',sea);
z1x=get_arfq_spec(vm.freq_ar,id_mod);
z0x=get_arfq_spec(vo.freq_ar,id_obs); z0x=interp_grid(z0x,x1,y1,x0,y0); 
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,s3,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR frequency (positive AO years minus NDJFM climatlogy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in index===================================================
[id_obs id_mod]=get_id_AO(1979,2014,0.8,'pos','NDJFM');
%================================================================
s1='ERA-Interim'; s2='C192AM4-PD'; lm=vm.lm; cs=[-0.05 0.05]; cs1=[-0.03 0.03];
vname='arfq_aop_ndjfm'; str='NDJFM, positive AO minus climo'; 
z1=vm.freq_ar_clm.ndjfm; x1=vm.lon; y1=vm.lat;
z0=vo.freq_ar_clm.ndjfm; x0=vo.lon; y0=vo.lat; z0=interp_grid(z0, x1,y1,x0,y0); 
z1x=get_arfq_spec(vm.freq_ar,id_mod);
z0x=get_arfq_spec(vo.freq_ar,id_obs); z0x=interp_grid(z0x,x1,y1,x0,y0);
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR frequency (negative AO years minus NDJFM climatlogy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in index===================================================
[id_obs id_mod]=get_id_AO(1979,2014,0.8,'neg','NDJFM');
%================================================================
s1='ERA-Interim'; s2='C192AM4-PD'; lm=vm.lm; cs=[-0.05 0.05]; cs1=[-0.03 0.03];
vname='arfq_aon_ndjfm'; str='NDJFM, negative AO minus climo'; 
z1=vm.freq_ar_clm.ndjfm; x1=vm.lon; y1=vm.lat;
z0=vo.freq_ar_clm.ndjfm; x0=vo.lon; y0=vo.lat; z0=interp_grid(z0, x1,y1,x0,y0); 
z1x=get_arfq_spec(vm.freq_ar,id_mod);
z0x=get_arfq_spec(vo.freq_ar,id_obs); z0x=interp_grid(z0x,x1,y1,x0,y0);
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR frequency (positive AO years minus MJJAS climatlogy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in index===================================================
[id_obs id_mod]=get_id_AO(1979,2014,0.8,'pos','MJJAS');
%================================================================
s1='ERA-Interim'; s2='C192AM4-PD'; lm=vm.lm; cs=[-0.05 0.05]; cs1=[-0.03 0.03];
vname='arfq_aop_mjjas'; str='MJJAS, positive AO minus climo'; vbin=[0:0.01:0.1]; dbin=[-0.02:0.001:0.02]; 
z0=vo.freq_ar_clm.mjjas; x0=vo.lon; y0=vo.lat; z0=interp_grid(z0, x1,y1,x0,y0); 
z1=vm.freq_ar_clm.mjjas; x1=vm.lon; y1=vm.lat;
z0x=get_arfq_spec(vo.freq_ar,id_obs); z0x=interp_grid(z0x,x1,y1,x0,y0);
z1x=get_arfq_spec(vm.freq_ar,id_mod);
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR frequency (negative AO years minus MJJAS climatlogy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in index===================================================
[id_obs id_mod]=get_id_AO(1979,2014,0.8,'neg','MJJAS');
%================================================================
s1='ERA-Interim'; s2='C192AM4-PD'; lm=vm.lm; cs=[-0.05 0.05]; cs1=[-0.03 0.03];
vname='arfq_aon_mjjas'; str='MJJAS, negative AO minus climo'; vbin=[0:0.01:0.1]; dbin=[-0.02:0.001:0.02]; 
z0=vo.freq_ar_clm.ndjfm; x0=vo.lon; y0=vo.lat; z0=interp_grid(z0, x1,y1,x0,y0); 
z1=vm.freq_ar_clm.ndjfm; x1=vm.lon; y1=vm.lat;
z0x=get_arfq_spec(vo.freq_ar,id_obs); z0x=interp_grid(z0x,x1,y1,x0,y0);
z1x=get_arfq_spec(vm.freq_ar,id_mod);
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,vname,str,vm.aa)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig6a-c: AR frequency (NDJFM season; NH(+NAM minus -NAM); SH(+SAM minus -SAM)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='(a) ERA-I'; s2='(b) PRESENT'; s3='(c) (b) minus (a)';
lm=vm.lm; cs=[-0.06 0.06]; cs1=[-0.06 0.06]; sea='NDJFM';
vname='Fig6a-c'; str=strcat(sea,', NH(+NAM minus -NAM);SH(+SAM minus -SAM)'); 
%[id_obs id_mod]=get_id_AO(1979,2014,0.8,'neg',sea);%negative phase
[id_obs id_mod]=get_id_NAM(1979,2014,0.8,'neg',sea);%negative phase
z1=get_arfq_spec(vm.freq_ar,id_mod); x1=vm.lon; y1=vm.lat;n1=floor(length(y1)/2);
z0=get_arfq_spec(vo.freq_ar,id_obs); x0=vo.lon; y0=vo.lat;n0=floor(length(y0)/2);
[id_obs id_mod]=get_id_SAM(1979,2014,0.8,'neg',sea);
a=get_arfq_spec(vm.freq_ar,id_mod); z1(1:n1,:)=a(1:n1,:);
a=get_arfq_spec(vo.freq_ar,id_obs); z0(1:n0,:)=a(1:n0,:); 
z0=interp_grid(z0,x1,y1,x0,y0); 
%[id_obs id_mod]=get_id_AO(1979,2014,0.8,'pos',sea);%positive phase
[id_obs id_mod]=get_id_NAM(1979,2014,0.8,'pos',sea);%positive phase
z1x=get_arfq_spec(vm.freq_ar,id_mod);
z0x=get_arfq_spec(vo.freq_ar,id_obs); 
[id_obs id_mod]=get_id_SAM(1979,2014,0.8,'pos',sea);
a=get_arfq_spec(vm.freq_ar,id_mod); z1x(1:n1,:)=a(1:n1,:);
a=get_arfq_spec(vo.freq_ar,id_obs); z0x(1:n0,:)=a(1:n0,:); 
z0x=interp_grid(z0x,x1,y1,x0,y0); 
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,s3,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper Fig6d-f AR frequency (MJJAS season; NH(+NAM minus -NAM); SH(+SAM minus -SAM)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='(d) ERA-I'; s2='(e) PRESENT'; s3='(f) (e) minus (d)';
lm=vm.lm; cs=[-0.06 0.06]; cs1=[-0.06 0.06]; sea='MJJAS';
vname='Fig6d-f'; str=strcat(sea,', NH(+NAM minus -NAM);SH(+SAM minus -SAM)'); 
%[id_obs id_mod]=get_id_AO(1979,2014,0.8,'neg',sea);%negative phase
[id_obs id_mod]=get_id_NAM(1979,2014,0.8,'neg',sea);%negative phase
z1=get_arfq_spec(vm.freq_ar,id_mod); x1=vm.lon; y1=vm.lat;n1=floor(length(y1)/2);
z0=get_arfq_spec(vo.freq_ar,id_obs); x0=vo.lon; y0=vo.lat;n0=floor(length(y0)/2);
[id_obs id_mod]=get_id_SAM(1979,2014,0.8,'neg',sea);
a=get_arfq_spec(vm.freq_ar,id_mod); z1(1:n1,:)=a(1:n1,:);
a=get_arfq_spec(vo.freq_ar,id_obs); z0(1:n0,:)=a(1:n0,:); 
z0=interp_grid(z0,x1,y1,x0,y0); 
%[id_obs id_mod]=get_id_AO(1979,2014,0.8,'pos',sea);%positive phase
[id_obs id_mod]=get_id_NAM(1979,2014,0.8,'pos',sea);%positive phase
z1x=get_arfq_spec(vm.freq_ar,id_mod);
z0x=get_arfq_spec(vo.freq_ar,id_obs); 
[id_obs id_mod]=get_id_SAM(1979,2014,0.8,'pos',sea);
a=get_arfq_spec(vm.freq_ar,id_mod); z1x(1:n1,:)=a(1:n1,:);
a=get_arfq_spec(vo.freq_ar,id_obs); z0x(1:n0,:)=a(1:n0,:); 
z0x=interp_grid(z0x,x1,y1,x0,y0); 
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,s3,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig7a-c: AR frequency (NDJFM season; positive PNA minus negative PNA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='(a) ERA-I'; s2='(b) PRESENT'; s3='(c) (b) minus (a)';
lm=vm.lm; cs=[-0.065 0.065]; cs1=[-0.065 0.065]; sea='NDJFM'; 
vname='Fig7a-c'; str=strcat(sea,', +PNA minus -PNA'); 
[id_obs id_mod]=get_id_PNA(1979,2014,0.8,'neg',sea);
z1=get_arfq_spec(vm.freq_ar,id_mod); x1=vm.lon; y1=vm.lat;
z0=get_arfq_spec(vo.freq_ar,id_obs); x0=vo.lon; y0=vo.lat; z0=interp_grid(z0,x1,y1,x0,y0); 
[id_obs id_mod]=get_id_PNA(1979,2014,0.8,'pos',sea);
z1x=get_arfq_spec(vm.freq_ar,id_mod);
z0x=get_arfq_spec(vo.freq_ar,id_obs); z0x=interp_grid(z0x,x1,y1,x0,y0); 
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,s3,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR paper: Fig7e-f: AR frequency (positive PNA minus negative PNA for MJJAS seasons)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1='(d) ERA-I'; s2='(e) PRESENT'; s3='(f) (e) minus (d)';
lm=vm.lm; cs=[-0.065 0.065]; cs1=[-0.065 0.065]; sea='MJJAS'; 
vname='Fig7d-f'; str=strcat(sea,', +PNA minus -PNA'); 
[id_obs id_mod]=get_id_PNA(1979,2014,0.8,'neg',sea);
z1=get_arfq_spec(vm.freq_ar,id_mod); x1=vm.lon; y1=vm.lat;
z0=get_arfq_spec(vo.freq_ar,id_obs); x0=vo.lon; y0=vo.lat; z0=interp_grid(z0,x1,y1,x0,y0); 
[id_obs id_mod]=get_id_PNA(1979,2014,0.8,'pos',sea);
z1x=get_arfq_spec(vm.freq_ar,id_mod);
z0x=get_arfq_spec(vo.freq_ar,id_obs); z0x=interp_grid(z0x,x1,y1,x0,y0); 
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,s3,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR frequency (positive PNA minus NDJFM seasons)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in index===================================================
[id_obs id_mod]=get_id_PNA(1979,2014,0.8,'pos','NDJFM');
%================================================================
s1='ERA-Interim'; s2='C192AM4-PD'; lm=vm.lm; cs=[-0.06 0.06]; cs1=[-0.03 0.03];
vname='arfq_pnap_ndjfm'; str='NDJFM, postive PNA minus climo'; 
z1=vm.freq_ar_clm.ndjfm; x1=vm.lon; y1=vm.lat;
z0=vo.freq_ar_clm.ndjfm; x0=vo.lon; y0=vo.lat; z0=interp_grid(z0, x1,y1,x0,y0);
z1x=get_arfq_spec(vm.freq_ar,id_mod);
z0x=get_arfq_spec(vo.freq_ar,id_obs); z0x=interp_grid(z0x,x1,y1,x0,y0); 
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR frequency (negative PNA minus NDJFM climatlogy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in index===================================================
[id_obs id_mod]=get_id_PNA(1979,2014,0.8,'neg','NDJFM');
%================================================================
s1='ERA-Interim'; s2='C192AM4-PD'; lm=vm.lm; cs=[-0.06 0.06]; cs1=[-0.03 0.03];
vname='arfq_pnan_ndjfm'; str='NDJFM, negative PNA minus climo'; 
z1=vm.freq_ar_clm.ndjfm; x1=vm.lon; y1=vm.lat;
z0=vo.freq_ar_clm.ndjfm; x0=vo.lon; y0=vo.lat; z0=interp_grid(z0,x1,y1,x0,y0);
z1x=get_arfq_spec(vm.freq_ar,id_mod);
z0x=get_arfq_spec(vo.freq_ar,id_obs); z0x=interp_grid(z0x,x1,y1,x0,y0);
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR frequency (positive PNA minus MJJAS climatlogy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in index===================================================
[id_obs id_mod]=get_id_PNA(1979,2014,0.8,'pos','MJJAS');
%================================================================
s1='ERA-Interim'; s2='C192AM4-PD'; lm=vm.lm; cs=[-0.06 0.06]; cs1=[-0.03 0.03];
vname='arfq_pnap_mjjas'; str='MJJAS, postive PNA minus climo'; 
z1=vm.freq_ar_clm.mjjas; x1=vm.lon; y1=vm.lat;
z0=vo.freq_ar_clm.mjjas; x0=vo.lon; y0=vo.lat; z0=interp_grid(z0, x1,y1,x0,y0);
z1x=get_arfq_spec(vm.freq_ar,id_mod);
z0x=get_arfq_spec(vo.freq_ar,id_obs); z0x=interp_grid(z0x,x1,y1,x0,y0); 
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR frequency (negative PNA minus MJJAS climatlogy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in index===================================================
[id_obs id_mod]=get_id_PNA(1979,2014,0.8,'neg','MJJAS');
%================================================================
s1='ERA-Interim'; s2='C192AM4-PD'; lm=vm.lm; cs=[-0.06 0.06]; cs1=[-0.03 0.03];
vname='arfq_pnan_mjjas'; str='MJJAS, negative PNA minus climo'; 
z1=vm.freq_ar_clm.mjjas; x1=vm.lon; y1=vm.lat;
z0=vo.freq_ar_clm.mjjas; x0=vo.lon; y0=vo.lat; z0=interp_grid(z0,x1,y1,x0,y0);
z1x=get_arfq_spec(vm.freq_ar,id_mod);
z0x=get_arfq_spec(vo.freq_ar,id_obs); z0x=interp_grid(z0x,x1,y1,x0,y0);
plot_arfqbias(x1,y1,z0x-z0,z1x-z1,lm,cs,cs1,s1,s2,vname,str,vm.aa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR WATER VAPOR CONTENT & VARIABILITY WITH LARGE-SCALE ENVIRONMENT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%annual mean water vapor content
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tas0=vm.tas_av_clm.ann; tas1=vm.tas_av_clm.ann; p.dtas=tas1-tas0;
p.s0='C192AM4-PD'; p.s1='C192AM4-Future'; 
p.lm=vm.lm; p.a=vm.aa; p.cs=[0 50]; 
p.vname='prw_av_clm'; p.str='ANN';
p.cs1=[-5 15]; p.rel=1; p.s2='(Future - PD)/PD\DeltaTs';
p.z0=vm.prw_av_clm.ann; p.x0=vm.lon; p.y0=vm.lat;
p.z1=wm.prw_av_clm.ann; p.x1=wm.lon; p.y1=wm.lat;    
plot_2d_diff_warm(p);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%annual mean water vapor content
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[00 60]; p.cs1=[-6 6];
p.vname='prw_av_clm_ann'; p.str='ANN'; p.a=vm.aa;
a=vm.prw_av_clm.ann; p.x1=vm.lon; p.y1=vm.lat;p.z1=a; 
a=vo.prw_av_clm.ann; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%seasonal mean water vapor content NDJFM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[00 60]; p.cs1=[-6 6];
p.vname='prw_av_clm_ndjfm'; p.str='NDJFM'; p.a=vm.aa;
a=vm.prw_av_clm.ndjfm; p.x1=vm.lon; p.y1=vm.lat;p.z1=a; 
a=vo.prw_av_clm.ndjfm; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%seasonal mean water vapor content MJJAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 60]; p.cs1=[-6 6];
p.vname='prw_av_clm_mjjas'; p.str='MJJAS'; p.a=vm.aa;
a=vm.prw_av_clm.mjjas; p.x1=vm.lon; p.y1=vm.lat;p.z1=a; 
a=vo.prw_av_clm.mjjas; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR WATER TRANSPORT AND VARIABILITY WITH LARGE-SCALE ENVIRONMENT.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR meridional water transport
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD';b=576*vm.dx(:,1);%b:total length in m at each latitude
p.vname='ar_ivty_ann_climo_lat'; x0=vo.lat; p.xl='latitude'; 
xmin=-90; xmax=90; p.xy=[xmin xmax -1.2E9 1.2E9];  p.xy1=[xmin xmax -0.6E9 0.6E9];
a=vm.ivty_ar_clm.ann; a=mean(a,2); p.y1=a.*b; p.x=vm.lat; p.ms=4; p.ls='none';
a=vo.ivty_ar_clm.ann; a=mean(a,2); p.y0=interp1(x0,a,p.x,'linear').*b;
a=(p.y1-p.y0); p.dy=a; %p.dy=mizsmooth(a,3);
p.yl='AR meridional water transport (kg/s)'; p.y2='Model minus ERAI (kg/s)';
plot_1d_diff(p); 
%partition between AR and non AR for model=======================
p.s1='C192AM4-PD (AR)'; p.s2='C192AM4-PD (total)'; p.s3='total minus AR';
b=576*vm.dx(:,1);
p.vname='model_ar_vs_total_ivty_ann_climo_lat'; x0=vo.lat; p.xl='latitude';
xmin=-90; xmax=90; p.xy=[xmin xmax -1.2E9 1.2E9];  p.xy1=[xmin xmax -1.2E9 1.2E9];
a=vm.ivty_ar_clm.ann; a=mean(a,2); p.y1=a.*b; p.x=vm.lat;
a=vm.ivty_av_clm.ann; a=mean(a,2); p.y0=a.*b;
a=(p.y1-p.y0); p.dy=-a; %p.dy=mizsmooth(a,3);
p.yl='AR and total meridional water transport (kg/s)';
p.y2='total minus AR (kg/s)';
plot_1d_diff(p)
%partition between AR and non AR from ERAI=======================
p.s1='ERA-Interim (AR)'; p.s2='ERA-Interim (total)'; p.s3='total minus AR';
b=576*vm.dx(:,1); p.x=vm.lat;
p.vname='ERAI_ar_vs_total_ivty_ann_climo_lat'; x0=vo.lat; p.xl='latitude';
xmin=-90; xmax=90; p.xy=[xmin xmax -1.2E9 1.2E9];  p.xy1=[xmin xmax -1.2E9 1.2E9];
a=vo.ivty_ar_clm.ann; a=mean(a,2); p.y1=interp1(x0,a,p.x,'linear').*b;
a=vo.ivty_av_clm.ann; a=mean(a,2); p.y0=interp1(x0,a,p.x,'linear').*b;
a=(p.y1-p.y0); p.dy=-a; %p.dy=mizsmooth(a,3);
p.yl='AR and total meridional water transport (kg/s)';
p.y2='total minus AR (kg/s)';
plot_1d_diff(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%total meridional water transport
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD';b=576*vm.dx(:,1);%b:total length in m at each latitude
p.vname='total_ivty_ann_climo_lat'; x0=vo.lat; p.xl='latitude';
xmin=-90; xmax=90; p.xy=[xmin xmax -1.2E9 1.2E9];  p.xy1=[xmin xmax -1.2E9 1.2E9];
a=vm.ivty_av_clm.ann; a=mean(a,2); p.y1=a.*b; p.x=vm.lat;
a=vo.ivty_av_clm.ann; a=mean(a,2); p.y0=interp1(x0,a,p.x,'linear').*b;
a=(p.y1-p.y0); p.dy=a; %p.dy=mizsmooth(a,3);
p.yl='total meridional water transport (kg/s)'; p.y2='Model minus ERAI (kg/s)';
plot_1d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR to total ratio in meridional water transport
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
b=576*vm.dx(:,1);%b:total length in m at each latitude
p.vname='ratio_ivty_ann_climo_lat'; x0=vo.lat; p.xl='latitude';
xmin=-90; xmax=90; p.xy=[xmin xmax -2 2]; p.xy1=[xmin xmax -1 1];
a=vm.ivty_ar_clm.ann; a=mean(a,2); p.y1=a.*b; p.x=vm.lat;
a=vo.ivty_ar_clm.ann; a=mean(a,2); p.y0=interp1(x0,a,p.x,'linear').*b;
a=vm.ivty_av_clm.ann; a=mean(a,2); p.Y1=a.*b; 
a=vo.ivty_av_clm.ann; a=mean(a,2); p.Y0=interp1(x0,a,p.x,'linear').*b;
p.y1=p.y1./p.Y1; p.y0=p.y0./p.Y0; p.ms=4; p.ls='none';
a=(p.y1-p.y0); p.dy=a; %p.dy=mizsmooth(a,3);
lat0=30; id=(vm.lat>-lat0)&(vm.lat<lat0); p.y0(id)=NaN; p.y1(id)=NaN;
lat0=80; id=(vm.lat<-lat0)|(vm.lat>lat0); p.y0(id)=NaN; p.y1(id)=NaN;
p.yl='ratio of AR to total meridional water transport'; p.y2='Model minus ERAI';
plot_1d_diff(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%total meridional water transport (2D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-50 50]; p.cs1=[-10 10];
p.vname='ivty_av_clm_ann'; p.str='ANN'; p.a=vm.aa;
a=vm.ivty_av_clm.ann; p.x1=vm.lon; p.y1=vm.lat;p.z1=a; 
a=vo.ivty_av_clm.ann; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AV total water transport for ANN (2D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 300]; p.cs1=[-100 100]; 
p.vname='ivt_av_clm_ann'; p.str='ANN'; p.a=vm.aa;
a=sqrt(vm.ivtx_av_clm.ann.^2+vm.ivty_av_clm.ann.^2); p.x1=vm.lon; p.y1=vm.lat;p.z1=a; 
a=sqrt(vo.ivtx_av_clm.ann.^2+vo.ivty_av_clm.ann.^2); x0=vo.lon; y0=vo.lat; 
p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AV total water transport for NDJFM (2D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 300]; p.cs1=[-100 100]; 
p.vname='ivt_av_clm_ndjfm'; p.str='NDJFM'; p.a=vm.aa;
a=sqrt(vm.ivtx_av_clm.ndjfm.^2+vm.ivty_av_clm.ndjfm.^2); p.x1=vm.lon; p.y1=vm.lat;p.z1=a; 
a=sqrt(vo.ivtx_av_clm.ndjfm.^2+vo.ivty_av_clm.ndjfm.^2); x0=vo.lon; y0=vo.lat; 
p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AV total water transport for MJJAS (2D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 300]; p.cs1=[-100 100]; 
p.vname='ivt_av_clm_mjjas'; p.str='MJJAS'; p.a=vm.aa;
a=sqrt(vm.ivtx_av_clm.mjjas.^2+vm.ivty_av_clm.mjjas.^2); p.x1=vm.lon; p.y1=vm.lat;p.z1=a; 
a=sqrt(vo.ivtx_av_clm.mjjas.^2+vo.ivty_av_clm.mjjas.^2); x0=vo.lon; y0=vo.lat; 
p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG total water transport (2D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 600]; p.cs1=[-200 200]; 
p.vname='ivt_aravg_clm_ann'; p.str='ANN'; p.a=vm.aa;
a=sqrt(vm.ivtx_aravg_clm.ann.^2+vm.ivty_aravg_clm.ann.^2); p.x1=vm.lon; p.y1=vm.lat;p.z1=a; 
a=sqrt(vo.ivtx_aravg_clm.ann.^2+vo.ivty_aravg_clm.ann.^2); x0=vo.lon; y0=vo.lat; 
p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG total water transport (2D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 600]; p.cs1=[-200 200]; 
p.vname='ivt_aravg_clm_ndjfm'; p.str='NDJFM'; p.a=vm.aa;
a=sqrt(vm.ivtx_aravg_clm.ndjfm.^2+vm.ivty_aravg_clm.ndjfm.^2); p.x1=vm.lon; p.y1=vm.lat;p.z1=a; 
a=sqrt(vo.ivtx_aravg_clm.ndjfm.^2+vo.ivty_aravg_clm.ndjfm.^2); x0=vo.lon; y0=vo.lat; 
p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG total water transport (2D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 600]; p.cs1=[-200 200]; 
p.vname='ivt_aravg_clm_mjjas'; p.str='MJJAS'; p.a=vm.aa;
a=sqrt(vm.ivtx_aravg_clm.mjjas.^2+vm.ivty_aravg_clm.mjjas.^2); p.x1=vm.lon; p.y1=vm.lat;p.z1=a; 
a=sqrt(vo.ivtx_aravg_clm.mjjas.^2+vo.ivty_aravg_clm.mjjas.^2); x0=vo.lon; y0=vo.lat; 
p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG meridional water transport (2D) for MJJAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-500 500]; p.cs1=[-50 50]; 
p.vname='ivty_aravg_clm_mjjas'; p.str='MJJAS'; p.a=vm.aa;
a=vm.ivty_aravg_clm.mjjas; p.x1=vm.lon; p.y1=vm.lat;p.z1=a; 
a=vo.ivty_aravg_clm.mjjas; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG zonal water transport (2D) for MJJAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-600 600]; p.cs1=[-300 300]; 
p.vname='ivtx_aravg_clm_mjjas'; p.str='MJJAS'; p.a=vm.aa;
a=vm.ivtx_aravg_clm.mjjas; p.x1=vm.lon; p.y1=vm.lat;p.z1=a; 
a=vo.ivtx_aravg_clm.mjjas; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR meridional water transport (2D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-50 50]; p.cs1=[-10 10]; 
p.vname='ivty_ar_clm_ann'; p.str='ANN'; p.a=vm.aa;
a=vm.ivty_ar_clm.ann; p.x1=vm.lon; p.y1=vm.lat;p.z1=a; 
a=vo.ivty_ar_clm.ann; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR zonal water transport (2D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-50 50]; p.cs1=[-10 10];
p.vname='ivtx_ar_clm_ann'; p.str='ANN'; p.a=vm.aa;
a=vm.ivtx_ar_clm.ann; p.x1=vm.lon; p.y1=vm.lat;p.z1=a; 
a=vo.ivtx_ar_clm.ann; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG meridional water transport (2D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-350 350]; p.cs1=[-50 50];
p.vname='ivty_aravg_clm_ann'; p.str='ANN'; p.a=vm.aa;
a=vm.ivty_avg_clm.ann; p.x1=vm.lon; p.y1=vm.lat;p.z1=a; 
a=vo.ivty_avg_clm.ann; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG zonal water transport (2D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-350 350]; p.cs1=[-100 100];
p.vname='ivtx_aravg_clm_ann'; p.str='ANN'; p.a=vm.aa;
a=vm.ivtx_aravg_clm.ann; p.x1=vm.lon; p.y1=vm.lat;p.z1=a; 
a=vo.ivtx_aravg_clm.ann; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR PRECIPITATION AND VARIABILITY WITH LARGE-SCALE ENVIRONMENT...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%test............................................................
p.s1='ERA-Interim'; p.s2='C192AM4-PD';
p.vname='prav6h_ar_clm_lat'; x0=vo.lat; p.xl='latitude';
xmin=-90; xmax=90; p.xy=[xmin xmax 0 1.5]; p.xy1=[xmin xmax -1 1];
a=vm.prav6h_ar_clm.ann; a=mean(a,2); p.y1=a; p.x=vm.lat;
a=vo.prav6h_ar_clm.ann; a=mean(a,2); p.y0=interp1(x0,a,p.x,'linear');
a=(p.y1-p.y0); p.dy=a; %p.dy=mizsmooth(a,3);
p.yl='AR associated precipitation (mm/day)'; p.y2='Model minus ERAI';
plot_1d_diff(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%test daily vs 6hrly precipitation results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model minus ERAI';
p.lm=vm.lm; p.cs=[0 2]; p.cs1=[-5 5];
p.vname='pravdd_av_clm_ann'; p.str='ANN'; p.a=vm.aa;
a=vm.pravdd_ar; a=get_clm_ann(a);  p.z1=a.ann; p.x1=vm.lon; p.y1=vm.lat;
a=vm.prav6h_ar_clm.ann;            p.z0=a; x0=vo.lon; y0=vo.lat; 
plot_2d_diff(p);
%test............................................................
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%total climatological mean precipitation map(ANN)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 12]; p.cs1=[-5 5];
p.vname='prav6h_av_clm_ann'; p.str='ANN'; p.a=vm.aa;
a=vm.prav6h_av_clm.ann; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_av_clm.ann; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%total climatological mean precipitation map(NDJFM)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 12]; p.cs1=[-5 5];
p.vname='prav6h_av_clm_ndjfm'; p.str='NDJFM'; p.a=vm.aa;
a=vm.prav6h_av_clm.ndjfm; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_av_clm.ndjfm; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%total climatological mean precipitation map(MJJAS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 12]; p.cs1=[-5 5];
p.vname='prav6h_av_clm_mjjas'; p.str='MJJAS'; p.a=vm.aa;
a=vm.prav6h_av_clm.mjjas; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_av_clm.mjjas; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR climatological mean precipitation map(ANN)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 2]; p.cs1=[-0.5 0.5];
p.vname='prav6h_ar_clm_ann'; p.str='ANN'; p.a=vm.aa;
a=vm.prav6h_ar_clm.ann; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_ar_clm.ann; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR climatological mean precipitation map(NDJFM)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 2]; p.cs1=[-0.5 0.5];
p.vname='prav6h_ar_clm_ndjfm'; p.str='NDJFM'; p.a=vm.aa;
a=vm.prav6h_ar_clm.ndjfm; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_ar_clm.ndjfm; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR climatological mean precipitation map(MJJAS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 2]; p.cs1=[-0.5 0.5];
p.vname='prav6h_ar_clm_mjjas'; p.str='MJJAS'; p.a=vm.aa;
a=vm.prav6h_ar_clm.mjjas; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_ar_clm.mjjas; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR seasonal mean anomalous precipitation map(NDJFM)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-0.6 0.6]; p.cs1=[-0.3 0.3];
p.vname='prav6h_ar_ndjfm_ano'; p.str='NDJFM - ANN'; p.a=vm.aa;
a=vm.prav6h_ar_clm.ndjfm-vm.prav6h_ar_clm.ann; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_ar_clm.ndjfm-vo.prav6h_ar_clm.ann; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR seasonal mean anomalous precipitation map(MJJAS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-0.6 0.6]; p.cs1=[-0.3 0.3];
p.vname='prav6h_ar_mjjas_ano'; p.str='MJJAS - ANN'; p.a=vm.aa;
a=vm.prav6h_ar_clm.mjjas-vm.prav6h_ar_clm.ann; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_ar_clm.mjjas-vo.prav6h_ar_clm.ann; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR anomalous precipitation map (NDJFM, El-Nino minus La-Nina)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFM'; p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-0.6 0.6]; p.cs1=[-0.3 0.3]; p.a=vm.aa;
p.vname=strcat('prav6h_ar_dENSO_',sea); p.str=strcat(sea,', El-Nino minus La-Nina');
[id_obs id_mod]=get_id_ENSO(1979,2014,0.8,'pos',sea);
a=get_arfq_spec(vm.prav6h_ar,id_mod); p.z1=a;
a=get_arfq_spec(vo.prav6h_ar,id_obs); p.z0=a; 
[id_obs id_mod]=get_id_ENSO(1979,2014,0.8,'neg',sea);
a=get_arfq_spec(vm.prav6h_ar,id_mod); p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=get_arfq_spec(vo.prav6h_ar,id_obs); p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR interannual anomalous precipitation map (NDJFM, El-Nino minus climo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFM'; [id_obs id_mod]=get_id_ENSO(1979,2014,0.8,'pos',sea);
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-0.6 0.6]; p.cs1=[-0.3 0.3]; p.a=vm.aa;
p.vname=strcat('prav6h_ar_eln_',sea); p.str=strcat(sea,', El-Nino minus climo');
a=get_arfq_spec(vm.prav6h_ar,id_mod); p.z1=a;
a=get_arfq_spec(vo.prav6h_ar,id_obs); p.z0=a; 
a=vm.prav6h_ar_clm.ndjfm; p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=vo.prav6h_ar_clm.ndjfm; p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR interannual anomalous precipitation map (NDJFM, La-Nina minus climo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFM'; [id_obs id_mod]=get_id_ENSO(1979,2014,0.8,'neg',sea);
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-0.6 0.6]; p.cs1=[-0.3 0.3]; p.a=vm.aa;
p.vname=strcat('prav6h_ar_lan_',sea); p.str=strcat(sea,', La-Nina minus climo');
a=get_arfq_spec(vm.prav6h_ar,id_mod); p.z1=a;
a=get_arfq_spec(vo.prav6h_ar,id_obs); p.z0=a; 
a=vm.prav6h_ar_clm.ndjfm; p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=vo.prav6h_ar_clm.ndjfm; p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%total interannual anomalous precipitation map (NDJFM, El-Nino minus climo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFM'; [id_obs id_mod]=get_id_ENSO(1979,2014,0.8,'pos',sea);
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-3 3]; p.cs1=[-1 1]; p.a=vm.aa;
p.vname=strcat('prav6h_av_eln_',sea); p.str=strcat(sea,', El-Nino minus climo');
a=get_arfq_spec(vm.prav6h_av,id_mod); p.z1=a;
a=get_arfq_spec(vo.prav6h_av,id_obs); p.z0=a; 
a=vm.prav6h_av_clm.ndjfm; p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=vo.prav6h_av_clm.ndjfm; p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%total interannual anomalous precipitation map (NDJFM, La-Nina minus climo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFM'; [id_obs id_mod]=get_id_ENSO(1979,2014,0.8,'neg',sea);
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-3 3]; p.cs1=[-1 1]; p.a=vm.aa;
p.vname=strcat('prav6h_av_lan_',sea); p.str=strcat(sea,', La-Nina minus climo');
a=get_arfq_spec(vm.prav6h_av,id_mod); p.z1=a;
a=get_arfq_spec(vo.prav6h_av,id_obs); p.z0=a; 
a=vm.prav6h_av_clm.ndjfm; p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=vo.prav6h_av_clm.ndjfm; p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR anomalous precipitation map (NDJFM, positive AO minus negative AO)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFM'; p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-0.6 0.6]; p.cs1=[-0.3 0.3]; p.a=vm.aa;
p.vname=strcat('prav6h_ar_dAO_',sea); p.str=strcat(sea,', +AO minus -AO');
[id_obs id_mod]=get_id_AO(1979,2014,0.8,'pos',sea);
a=get_arfq_spec(vm.prav6h_ar,id_mod); p.z1=a;
a=get_arfq_spec(vo.prav6h_ar,id_obs); p.z0=a; 
[id_obs id_mod]=get_id_AO(1979,2014,0.8,'neg',sea);
a=get_arfq_spec(vm.prav6h_ar,id_mod); p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=get_arfq_spec(vo.prav6h_ar,id_obs); p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR anomalous precipitation map (NDJFM, positive AO minus climo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in index===================================================
[id_obs id_mod]=get_id_AO(1979,2014,0.8,'pos','NDJFM');
%================================================================
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-0.6 0.6]; p.cs1=[-0.3 0.3];
p.vname='prav6h_ar_aop_ndjfm'; p.str='NDJFM, positive AO minus climo'; p.a=vm.aa;
a=get_arfq_spec(vm.prav6h_ar,id_mod); p.z1=a;
a=get_arfq_spec(vo.prav6h_ar,id_obs); p.z0=a; 
a=vm.prav6h_ar_clm.ndjfm; p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=vo.prav6h_ar_clm.ndjfm; p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR anomalous precipitation map (NDJFM, negative AO minus climo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in index===================================================
[id_obs id_mod]=get_id_AO(1979,2014,0.8,'neg','NDJFM');
%================================================================
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-0.6 0.6]; p.cs1=[-0.3 0.3];
p.vname='prav6h_ar_aon_ndjfm'; p.str='NDJFM, negative AO minus climo'; p.a=vm.aa;
a=get_arfq_spec(vm.prav6h_ar,id_mod); p.z1=a;
a=get_arfq_spec(vo.prav6h_ar,id_obs); p.z0=a; 
a=vm.prav6h_ar_clm.ndjfm; p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=vo.prav6h_ar_clm.ndjfm; p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR anomalous precipitation map (NDJFM, positive PNA minus negative PNA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFM'; p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-0.6 0.6]; p.cs1=[-0.3 0.3]; p.a=vm.aa;
p.vname=strcat('prav6h_ar_dPNA_',sea); p.str=strcat(sea,', +PNA minus -PNA');
[id_obs id_mod]=get_id_PNA(1979,2014,0.8,'pos',sea);
a=get_arfq_spec(vm.prav6h_ar,id_mod); p.z1=a;
a=get_arfq_spec(vo.prav6h_ar,id_obs); p.z0=a; 
[id_obs id_mod]=get_id_PNA(1979,2014,0.8,'neg',sea);
a=get_arfq_spec(vm.prav6h_ar,id_mod); p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=get_arfq_spec(vo.prav6h_ar,id_obs); p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR anomalous precipitation map (NDJFM, positive PNA minus climo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in index===================================================
[id_obs id_mod]=get_id_PNA(1979,2014,0.8,'pos','NDJFM');
%================================================================
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-0.6 0.6]; p.cs1=[-0.3 0.3];
p.vname='prav6h_ar_pnap_ndjfm'; p.str='NDJFM, positive PNA minus climo'; p.a=vm.aa;
a=get_arfq_spec(vm.prav6h_ar,id_mod); p.z1=a;
a=get_arfq_spec(vo.prav6h_ar,id_obs); p.z0=a; 
a=vm.prav6h_ar_clm.ndjfm; p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=vo.prav6h_ar_clm.ndjfm; p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AR anomalous precipitation map (NDJFM, negative PNA minus climo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in index===================================================
[id_obs id_mod]=get_id_PNA(1979,2014,0.8,'neg','NDJFM');
%================================================================
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-0.6 0.6]; p.cs1=[-0.3 0.3];
p.vname='prav6h_ar_pnan_ndjfm'; p.str='NDJFM, negative PNA minus climo'; p.a=vm.aa;
a=get_arfq_spec(vm.prav6h_ar,id_mod); p.z1=a;
a=get_arfq_spec(vo.prav6h_ar,id_obs); p.z0=a; 
a=vm.prav6h_ar_clm.ndjfm; p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=vo.prav6h_ar_clm.ndjfm; p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG (averaged over AR region/condition) mean precipitation map (ANN)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 15]; p.cs1=[-6 6];
p.vname='prav6h_aravg_clm_ann'; p.str='ANN'; p.a=vm.aa;
a=vm.prav6h_aravg_clm.ann; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_aravg_clm.ann; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG (averaged over AR region/condition) mean precipitation map (NDJFM)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 15]; p.cs1=[-6 6];
p.vname='prav6h_aravg_clm_ndjfm'; p.str='NDJFM'; p.a=vm.aa;
a=vm.prav6h_aravg_clm.ndjfm; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_aravg_clm.ndjfm; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG (averaged over AR region/condition) mean precipitation map (MJJAS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 15]; p.cs1=[-6 6];
p.vname='prav6h_aravg_clm_mjjas'; p.str='MJJAS'; p.a=vm.aa;
a=vm.prav6h_aravg_clm.mjjas; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_aravg_clm.mjjas; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG (averaged over AR region/condition) seasonal anomalous precipitation map(NDJFM)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-6 6]; p.cs1=[-3 3];
p.vname='prav6h_aravg_ndjfm_ano'; p.str='NDJFM - ANN'; p.a=vm.aa;
a=vm.prav6h_aravg_clm.ndjfm-vm.prav6h_aravg_clm.ann; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_aravg_clm.ndjfm-vo.prav6h_aravg_clm.ann; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG (averaged over AR region/condition) seasonal anomalous precipitation map(MJJAS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-6 6]; p.cs1=[-3 3];
p.vname='prav6h_aravg_mjjas_ano'; p.str='MJJAS - ANN'; p.a=vm.aa;
a=vm.prav6h_aravg_clm.mjjas-vm.prav6h_aravg_clm.ann; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_aravg_clm.mjjas-vo.prav6h_aravg_clm.ann; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG (averaged over AR region/condition) interannual anomalous precipitation map (NDJFM, El-Nino minus climo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFM'; [id_obs id_mod]=get_id_ENSO(1979,2014,0.8,'pos',sea);
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-6 6]; p.cs1=[-3 3]; p.a=vm.aa;
p.vname=strcat('prav6h_aravg_eln_',sea); p.str=strcat(sea,', El-Nino minus climo');
a=get_arfq_spec(vm.prav6h_aravg,id_mod); p.z1=a;
a=get_arfq_spec(vo.prav6h_aravg,id_obs); p.z0=a; 
a=vm.prav6h_aravg_clm.ndjfm; p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=vo.prav6h_aravg_clm.ndjfm; p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG (averaged over AR region/condition) interannual anomalous precipitation map (NDJFM, La-Nina minus climo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sea='NDJFM'; [id_obs id_mod]=get_id_ENSO(1979,2014,0.8,'neg',sea);
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-6 6]; p.cs1=[-3 3]; p.a=vm.aa;
p.vname=strcat('prav6h_aravg_lan_',sea); p.str=strcat(sea,', La-Nina minus climo');
a=get_arfq_spec(vm.prav6h_aravg,id_mod); p.z1=a;
a=get_arfq_spec(vo.prav6h_aravg,id_obs); p.z0=a; 
a=vm.prav6h_aravg_clm.ndjfm; p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=vo.prav6h_aravg_clm.ndjfm; p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG (averaged over AR region/condition) anomalous precipitation map (NDJFM, positive AO minus climo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in index===================================================
[id_obs id_mod]=get_id_AO(1979,2014,0.8,'pos','NDJFM');
%================================================================
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-6 6]; p.cs1=[-3 3];
p.vname='prav6h_aravg_aop_ndjfm'; p.str='NDJFM, positive AO minus climo'; p.a=vm.aa;
a=get_var_comp(vm.prav6h_aravg,id_mod); p.z1=a;
a=get_var_comp(vo.prav6h_aravg,id_obs); p.z0=a; 
a=vm.prav6h_aravg_clm.ndjfm; p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=vo.prav6h_aravg_clm.ndjfm; p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ARAVG (averaged over AR region/condition) anomalous precipitation map (NDJFM, negative AO minus climo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%================================================================
%read in index===================================================
[id_obs id_mod]=get_id_AO(1979,2014,0.8,'neg','NDJFM');
%================================================================
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-6 6]; p.cs1=[-3 3];
p.vname='prav6h_aravg_aon_ndjfm'; p.str='NDJFM, negative AO minus climo'; p.a=vm.aa;
a=get_var_comp(vm.prav6h_aravg,id_mod); p.z1=a;
a=get_var_comp(vo.prav6h_aravg,id_obs); p.z0=a; 
a=vm.prav6h_aravg_clm.ndjfm; p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=vo.prav6h_aravg_clm.ndjfm; p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARAVG anomalous precipitation map (NDJFM, positive PNA minus climo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in index===================================================
[id_obs id_mod]=get_id_PNA(1979,2014,0.8,'pos','NDJFM');
%================================================================
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-6 6]; p.cs1=[-3 3];
p.vname='prav6h_aravg_pnap_ndjfm'; p.str='NDJFM, positive PNA minus climo'; p.a=vm.aa;
a=get_var_comp(vm.prav6h_aravg,id_mod); p.z1=a;
a=get_var_comp(vo.prav6h_aravg,id_obs); p.z0=a; 
a=vm.prav6h_aravg_clm.ndjfm; p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=vo.prav6h_aravg_clm.ndjfm; p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ARAVG anomalous precipitation map (NDJFM, negative PNA minus climo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%================================================================
%read in index===================================================
[id_obs id_mod]=get_id_PNA(1979,2014,0.8,'neg','NDJFM');
%================================================================
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-6 6]; p.cs1=[-3 3];
p.vname='prav6h_aravg_pnan_ndjfm'; p.str='NDJFM, negative PNA minus climo'; p.a=vm.aa;
a=get_var_comp(vm.prav6h_aravg,id_mod); p.z1=a;
a=get_var_comp(vo.prav6h_aravg,id_obs); p.z0=a; 
a=vm.prav6h_aravg_clm.ndjfm; p.z1=p.z1-a; p.x1=vm.lon; p.y1=vm.lat;
a=vo.prav6h_aravg_clm.ndjfm; p.z0=p.z0-a; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(p.z0,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARMAX (averaged over AR region/condition) mean precipitation map (ANN)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 80]; p.cs1=[-20 20];
p.vname='prav6h_armax_clm_ann'; p.str='ANN'; p.a=vm.aa;
a=vm.prav6h_armax_clm.ann; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_armax_clm.ann; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARMAX (averaged over AR region/condition) mean precipitation map (NDJFM)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 80]; p.cs1=[-20 20];
p.vname='prav6h_armax_clm_ndjfm'; p.str='NDJFM'; p.a=vm.aa;
a=vm.prav6h_armax_clm.ndjfm; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_armax_clm.ndjfm; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARMAX (averaged over AR region/condition) mean precipitation map (MJJAS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[0 80]; p.cs1=[-20 20];
p.vname='prav6h_armax_clm_mjjas'; p.str='MJJAS'; p.a=vm.aa;
a=vm.prav6h_armax_clm.mjjas; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_armax_clm.mjjas; x0=vo.lon; y0=vo.lat; p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARMAX (averaged over AR region/condition) seasonal anomalous precipitation map(NDJFM)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-20 20]; p.cs1=[-10 10];
p.vname='prav6h_armax_ndjfm_ano'; p.str='NDJFM - ANN'; p.a=vm.aa;
a=vm.prav6h_armax_clm.ndjfm-vm.prav6h_armax_clm.ann; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_armax_clm.ndjfm-vo.prav6h_armax_clm.ann; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ARMAX (averaged over AR region/condition) seasonal anomalous precipitation map(MJJAS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.s1='ERA-Interim'; p.s2='C192AM4-PD'; p.s3='Model - ERAI';
p.lm=vm.lm; p.cs=[-20 20]; p.cs1=[-10 10];
p.vname='prav6h_armax_mjjas_ano'; p.str='MJJAS - ANN'; p.a=vm.aa;
a=vm.prav6h_armax_clm.mjjas-vm.prav6h_armax_clm.ann; p.x1=vm.lon; p.y1=vm.lat; p.z1=a; 
a=vo.prav6h_armax_clm.mjjas-vo.prav6h_armax_clm.ann; x0=vo.lon; y0=vo.lat;
p.z0=interp_grid(a,p.x1,p.y1,x0,y0);
plot_2d_diff(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
