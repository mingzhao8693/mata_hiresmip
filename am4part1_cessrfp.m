%below opt=1 for writing mat file to /work/miz
%below opt=2 for writing mat file to /archive
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
latlon=[0 360 -90 90];region='global';mod='c96';myr=5; opt=2;
%latlon=[0 360  30 90];region='nhextr';mod='c96';myr=5; opt=2; 
%latlon=[0 360 -30 30];region='tropic';mod='c96';myr=5; opt=2; 
%latlon=[150 250 -5 5]; region='equpac'; nyr=5; myr=1; opt=0;
%read in or generate observation data
%o=readobs(latlon,region,'c48'); 
fn=strcat('/work/miz/mat_am4p0/obs_',region,'_to_c48.mat'); load(fn);
%fn=strcat('/work/miz/mat_cm4/obs_',region,'_to_c48.mat'); load(fn);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=1;
expn='c96L33_am4p0_2010climo_sst_pert0'; yr1='0002';yr2='0011';syr=1;nyr=8;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_sst_pert0_p2K'; yr1='0002';yr2='0011';syr=1;nyr=8;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/AM2.1/'; myr=5;
expn='AM2p1_1990climo_cntl'; yr1='1991';yr2='2000';syr=1;nyr=10;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM2p1_1990climo_cntl_p2K'; yr1='1991';yr2='2000';syr=1;nyr=10;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/AM3/'; myr=5;
expn='c48L48_am3p10_clim'; yr1='1981';yr2='1990';syr=1;nyr=10;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c48L48_am3p10_clim_p2k'; yr1='1981';yr2='1990';syr=1;nyr=10;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw/'; myr=5;
expn='c96L33_am4p0_2010climo_fixedN1';     yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_fixedN1_p2K'; yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_eis0';     yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_eis0_p2K'; yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
exit

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw/'; myr=5;
expn='c96L33_am4p0_2010climo'; yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_p2K'; yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010climo_2xCO2';yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo';  yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010GHG';   yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'     
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_2010aero';  yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'    
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat');

tpath='/archive/Ming.Zhao/awg/warsaw/';
expn='c96L33_am4p0_2010climo';          fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v0=v;
fn='/archive/Ming.Zhao/awg/warsaw/c96L33_am4p0_2010climo_p2K_h1g/c96L33_am4p0_2010climo_p2K_global_tsana.mat';load(fn);am4.w0=v;

tpath='/archive/Ming.Zhao/awg/xanadu/';
expn='c96L33_am4p0_2010climo_sst_pert0';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v1=v;
expn='c96L33_am4p0_2010climo_sst_pert0_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w1=v;

expn='c96L33_am4p0_2010climo_cfcs_test7';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v2=v;
expn='c96L33_am4p0_2010climo_cfcs_test7_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w2=v;
expn='c96L33_am4p0_2010climo_cfcs_test8';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v3=v;
expn='c96L33_am4p0_2010climo_cfcs_test8_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w3=v;


x=[1:100]; y0=x; y1=x.^0.5; y3=x.^0.4; y4=x.^0.25;
figure; plot(x,y0); hold on; plot(x,y1,'r'); 
plot(x,y2,,'g'); plot(x,y3,'b'); plot(x,y4,'k');

dttcf0=(am4.w0.toa.ttcf.tavg0-am4.v0.toa.ttcf.tavg0);
dttcf1=(am4.w1.toa.ttcf.tavg0-am4.v1.toa.ttcf.tavg0);
dttcf2=(am4.w2.toa.ttcf.tavg0-am4.v2.toa.ttcf.tavg0);
dttcf3=(am4.w3.toa.ttcf.tavg0-am4.v3.toa.ttcf.tavg0);

dttcf0=(am4.w3.atm.rkm_uws.tavg0-am4.v3.atm.rkm_uws.tavg0);

dttcf0=(am4.w3.atm.rkm_uwd.tavg0-am4.v3.atm.rkm_uwd.tavg0);

lat=am4.v0.s.lat; lon=am4.v0.s.lon; lm=am4.v0.s.lm0; 
figure; pcolor(lon,lat,dttcf0); hold on; 
shading flat; colorbar; caxis([-0.5 0.5]); contour(lon,lat,lm,1,'k');

figure; pcolor(lon,lat,dttcf1); hold on; 
shading flat; colorbar; caxis([-4 4]); contour(lon,lat,lm,1,'k');

figure; pcolor(lon,lat,dttcf2); hold on; 
shading flat; colorbar; caxis([-4 4]); contour(lon,lat,lm,1,'k');

figure; pcolor(lon,lat,dttcf3); hold on; 
shading flat; colorbar; caxis([-4 4]); contour(lon,lat,lm,1,'k');


figure; pcolor(lon,lat,dttcf1-dttcf0); hold on; 
shading flat; colorbar; caxis([-1 1]); contour(lon,lat,lm,1,'k');


z=(am4.w1.atm.rkm_uws.tavg0-am4.v1.atm.rkm_uws.tavg0);
lat=am4.v1.s.lat; lon=am4.v1.s.lon; lm=am4.v1.s.lm0; 
figure; pcolor(lon,lat,z); hold on; shading flat; colorbar; caxis([-0.5 0.5]); 
contour(lon,lat,lm,1,'k');

z=(am4.w1.atm.rkm_uwd.tavg0-am4.v1.atm.rkm_uwd.tavg0);
lat=am4.v0.s.lat; lon=am4.v0.s.lon; lm=am4.v0.s.lm0; 
figure; pcolor(lon,lat,z); hold on; shading flat; colorbar; caxis([-0.1 0.1]); 
contour(lon,lat,lm,1,'k');


expn='AM4p0p3k_bvoc_2010C_p2K_PIpcairco2_v7_1980LU_dustfix'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am41.w0=v;
expn='AM4p0p3k_bvoc_2010C_PIpcairco2_v7_1980LU_dustfix';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am41.v0=v;

expn='c96L33_am4p0_2010climo_2xCO2';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.x0=v;
expn='c96L33_am4p0_1850climo';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c0=v;
expn='c96L33_am4p0_2010GHG';        fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.g0=v;
expn='c96L33_am4p0_2010aero';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.a0=v;
expn='c96L33_am4p0_2010climo_fixedN1';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v1=v;
expn='c96L33_am4p0_2010climo_fixedN1_p2K';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w1=v;
expn='c96L33_am4p0_2010climo_eis0';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v9=v;
expn='c96L33_am4p0_2010climo_eis0_p2K';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w9=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='c96L33_am4p0_1990climo';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4a.v0=v;
expn='c96L33_am4p0_1990climo_p2K';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4a.w0=v;
expn='c96L33_am4p0_1990climo_2xCO2';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4a.x0=v;
expn='c96L33_am4p0_1850climo';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4a.c0=v;
expn='c96L33_am4p0_1990GHG';        fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4a.g0=v;
expn='c96L33_am4p0_1990aero';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4a.a0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/AM2.1/';
expn='AM2p1_1990climo_cntl';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v0=v;
expn='AM2p1_1990climo_cntl_p2K';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.w0=v;
expn='AM2p1_1990climo_cntl_2xCO2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.x0=v;
expn='AM2p1_1990climo_1860rad';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.c0=v;
expn='AM2p1_1990climo_1990GHG';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.g0=v;
expn='AM2p1_1990climo_1990aero';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.a0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/AM3/';
expn='c48L48_am3p10_clim';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v0=v;
expn='c48L48_am3p10_clim_p2k';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.w0=v;
expn='c48L48_am3p10_clim_pi';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c0=v;
expn='c48L48_am3p10_clim_pi_GHG';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g0=v;
expn='c48L48_am3p10_clim_pi_aero'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a0=v;
am3.x0=am3.v0;
save('/work/miz/mat_am4p0/am4part1_cessrfp.mat','-v7.3'); 
load('/work/miz/mat_am4p0/am4part1_cessrfp.mat'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=am4;  am4.d =compute_rfp_all(x);
x=am4a; am4a.d=compute_rfp_all(x);
x=am2;  am2.d =compute_rfp_all(x);
x=am3;  am3.d =compute_rfp_all(x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.37: RFP and Cess feedback
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
am3.d.netradtoa.rfp(3)=;
am3.d.netradtoa.rfp(2)=-1.69;
am3.d.netradtoa.rfp(4)=0;


vname='rfp_cess_glb'; expn='AM4p0'; 
xy=[0.5 5.5 -5 5]; %xy=[0.5 6.5 -5 5];
am3.d.netradtoa.rfp(2)=am3.d.netradtoa.rfp(2)+am3.d.netradtoa.rfp(4);
am3.d.netradtoa.rfp(4)=0; am3.d.netradtoa.rfp
am3.d.netradtoa.rfp=[0.9442 -1.69 2.6341 0 -2.8631 0];
y=[am4.d.netradtoa.rfp; am4a.d.netradtoa.rfp; ...
   am2.d.netradtoa.rfp; am3.d.netradtoa.rfp];%am2a.d.netradtoa.rfp; ];
%mytitle='NETRADTOA';
%Plot total RFP%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=14; lw=3; 
handle=figure('Position',pms,'visible','on'); 
x=[1:6]; bar(x,y'); hold on; grid on;
set(gca,'xtick',x); axis(xy);
alist={'Total','Aerosol','GHG','Residual','P2K','2xCO2'};
set(gca,'xticklabel',alist); 
set(gca,'FontSize',fsize); %title(mytitle);
ylabel('changes in TOA net radiative flux (W/m^2)','FontSize',fsize);
legend('AM4.0(2010)','AM4.0(1990)','AM2.1(1990)','AM3(1990)',1)
visfig='off'; figpath='./fig_am4/';  
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qn_map'; 
v=am4.v0; cd1=get_cd(v)
v=am4.w0; cd2=get_cd(v)

pms=[ 0, 0, 500, 900]; fsize=12; lw=2; msize=12; 
handle = figure('Position', pms,'visible','on');
k=7; z1=cd1(k).cn1;     z2=cd2(k).cn1; 
k=4; z1=cd1(k).cn2;     z2=cd2(k).cn2; 
k=6; z1=cd1(k).qn;      z2=cd2(k).qn; 
k=2; z1=cd1(k).al*100;  z2=cd2(k).al*100; 
k=1; z1=cd1(k).qal;     z2=cd2(k).qal; 
k=1; z1=cd1(k).qam;     z2=cd2(k).qam; 
k=1; z1=cd1(k).qah;     z2=cd2(k).qah; 
k=1; z1=cd1(k).lwp*1000;z2=cd2(k).lwp*1000; 
k=1; z1=cd1(k).iwp*1000;z2=cd2(k).iwp*1000; 
row=3; col=1; 
subplot(row,col,1); 
pcolor(z1); shading flat; colorbar; caxis([0 100]);
subplot(row,col,2); 
pcolor(z2); shading flat; colorbar; caxis([0 100]);
subplot(row,col,3); 
pcolor(z2-z1); caxis([-5 5]);
shading flat; colorbar;



v=am4.v0; f1=squeeze(mean(v.atm.al850.sea(k,:,:),1)); qn1=squeeze(mean(v.atm.qn850.sea(k,:,:),1))/a;
v=am4.w0; f2=squeeze(mean(v.atm.al850.sea(k,:,:),1)); qn2=squeeze(mean(v.atm.qn850.sea(k,:,:),1))/a;
z=f1; z(z<0)=0; f1=z;  n1=qn1./f1; figure; pcolor(f1); shading flat; caxis([0 1]);colorbar;
z=f2; z(z<0)=0; f2=z;  n2=qn2./f2; figure; pcolor(f2); shading flat; caxis([0 1]);colorbar;

figure; pcolor(qn2-qn1); shading flat; caxis([-25 25]);colorbar;
figure; pcolor(n2-n1);   shading flat; caxis([-50 50]);colorbar;
figure; pcolor(qn1); shading flat; caxis([0 25]);colorbar;
figure; pcolor(n1);  shading flat; caxis([0 100]);colorbar;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_clr_rfp_cess_glb'; expn='AM4p0'; 
xy=[0.5 5.5 -5 5]; %xy=[0.5 6.5 -5 5];
am3.d.netradtoa_clr.rfp(2)=am3.d.netradtoa_clr.rfp(2)+am3.d.netradtoa_clr.rfp(4);
am3.d.netradtoa_clr.rfp(4)=0; am3.d.netradtoa_clr.rfp
y=[am4.d.netradtoa_clr.rfp; am4a.d.netradtoa_clr.rfp; ...
   am2.d.netradtoa_clr.rfp; am3.d.netradtoa_clr.rfp];%am2a.d.netradtoa_clr.rfp; ];
%mytitle='NETRADTOA';
%Plot total RFP%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=14; lw=3; 
handle=figure('Position',pms,'visible','on'); 
x=[1:6]; bar(x,y'); hold on; grid on;
set(gca,'xtick',x); axis(xy);
alist={'Total','Aerosol','GHG','Residual','P2K','2xCO2'};
set(gca,'xticklabel',alist); 
set(gca,'FontSize',fsize); %title(mytitle);
ylabel('changes in TOA clear-sky net radiative flux (W/m2)','FontSize',fsize);
legend('AM4.0(2010)','AM4.0(1990)','AM2.1(1990)','AM3(1990)',1)
visfig='off'; figpath='./fig_am4/';  
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_clr_rfp_cess_glb'; expn='AM4p0'; 
xy=[0.5 5.5 -5 5]; %xy=[0.5 6.5 -5 5];
am3.d.lwnet_clr.rfp(2)=am3.d.lwnet_clr.rfp(2)+am3.d.lwnet_clr.rfp(4);
am3.d.lwnet_clr.rfp(4)=0; am3.d.lwnet_clr.rfp
y=[am4.d.lwnet_clr.rfp; am4a.d.lwnet_clr.rfp; ...
   am2.d.lwnet_clr.rfp; am3.d.lwnet_clr.rfp];%am2a.d.lwnet_clr.rfp; ];
%mytitle='NETRADTOA';
%Plot total RFP%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=14; lw=3; 
handle=figure('Position',pms,'visible','on'); 
x=[1:6]; bar(x,y'); hold on; grid on;
set(gca,'xtick',x); axis(xy);
alist={'Total','Aerosol','GHG','Residual','P2K','2xCO2'};
set(gca,'xticklabel',alist); 
set(gca,'FontSize',fsize); %title(mytitle);
ylabel('changes in TOA clear-sky LW radiative flux (W/m2)','FontSize',fsize);
legend('AM4.0(2010)','AM4.0(1990)','AM2.1(1990)','AM3(1990)',1)
visfig='off'; figpath='./fig_am4/';  
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet_clr_rfp_cess_glb'; expn='AM4p0'; 
xy=[0.5 5.5 -5 5]; %xy=[0.5 6.5 -5 5];
am3.d.swnet_clr.rfp(2)=am3.d.swnet_clr.rfp(2)+am3.d.swnet_clr.rfp(4);
am3.d.swnet_clr.rfp(4)=0; am3.d.swnet_clr.rfp
y=[am4.d.swnet_clr.rfp; am4a.d.swnet_clr.rfp; ...
   am2.d.swnet_clr.rfp; am3.d.swnet_clr.rfp];%am2a.d.swnet_clr.rfp; ];
%mytitle='NETRADTOA';
%Plot total RFP%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=14; lw=3; 
handle=figure('Position',pms,'visible','on'); 
x=[1:6]; bar(x,y'); hold on; grid on;
set(gca,'xtick',x); axis(xy);
alist={'Total','Aerosol','GHG','Residual','P2K','2xCO2'};
set(gca,'xticklabel',alist); 
set(gca,'FontSize',fsize); %title(mytitle);
ylabel('changes in TOA clear-sky SW radiative flux (W/m2)','FontSize',fsize);
legend('AM4.0(2010)','AM4.0(1990)','AM2.1(1990)','AM3(1990)',1)
visfig='off'; figpath='./fig_am4/';  
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ttcf_rfp_cess_glb'; expn='AM4p0'; 
xy=[0.5 5.5 -5 5]; %xy=[0.5 6.5 -5 5];
am3.d.ttcf.rfp(2)=am3.d.ttcf.rfp(2)+am3.d.ttcf.rfp(4);
am3.d.ttcf.rfp(4)=0; am3.d.ttcf.rfp
y=[am4.d.ttcf.rfp; am4a.d.ttcf.rfp; ...
   am2.d.ttcf.rfp; am3.d.ttcf.rfp];%am2a.d.ttcf.rfp; ];
%mytitle='NETRADTOA';
%Plot total RFP%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=14; lw=3; 
handle=figure('Position',pms,'visible','on'); 
x=[1:6]; bar(x,y'); hold on; grid on;
set(gca,'xtick',x); axis(xy);
alist={'Total','Aerosol','GHG','Residual','P2K','2xCO2'};
set(gca,'xticklabel',alist); 
set(gca,'FontSize',fsize); %title(mytitle);
ylabel('changes in TOA clear-sky net radiative flux (W/m2)','FontSize',fsize);
legend('AM4.0(2010)','AM4.0(1990)','AM2.1(1990)','AM3(1990)',1)
visfig='off'; figpath='./fig_am4/';  
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section 1: RFP CESS sensitivity global and regional plots%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xy=[0.5 4.6 -5 5]; xy=[0.5 6.5 -5 5];
plot_am4_netrad(aref0,am21,am3,am4,xy,4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section 2: latitudional plots%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=mean(s.aa,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetrad_lat'; expn='AM4p0_rfp_cess'; 
yl='changes in TOA net radiation (W/m2)'; climo=0;
y1=am4.v0.toa.netrad.txavg0;  s1='2010RAD';
y2=am4.c0.toa.netrad.txavg0;  s2='1860RAD';
y3=am4.a0.toa.netrad.txavg0;  s3='2010AERO';
y4=am4.w0.toa.netrad.txavg0;  s4='P2K';
y.var1=y1-y2;     y.s1=strcat('2010RAD minus 1860RAD (Total RFP;');
y.var2=y3-y2;     y.s2=strcat('2010AER minus 1860RAD (Aero RFP;');
y.var3=y.var1-y.var2; y.s3=strcat('Total minus Aero RFP  (GHG+VOL;');
y.var4=y4-y1;         y.s4=strcat('P2K minus 2010RAD   (CESS;');
a=mean(mean(y.var1.*a0)); y.s1=sprintf('%s MEAN=%5.2f)',y.s1,a);y.av1=a;
a=mean(mean(y.var2.*a0)); y.s2=sprintf('%s MEAN=%5.2f)',y.s2,a);y.av2=a;
a=mean(mean(y.var3.*a0)); y.s3=sprintf('%s MEAN=%5.2f)',y.s3,a);y.av3=a;
a=mean(mean(y.var4.*a0)); y.s4=sprintf('%s MEAN=%5.2f)',y.s4,a);y.av4=a;
y.xy=[-90 90 -7 9]; y.yl=yl; y.xl='latitude'; x=s.lat; 
y.c1='k'; y.c2='b'; y.c3='g'; y.c4='r'; y.opt=1;
pms=[ 0, 0, 1000, 800]*0.8; fsize=12; lw=2; msize=12; 
handle = figure('Position', pms,'visible','on');
plot(x, y.var1, y.c1,  'LineWidth',lw); hold on; 
plot(x, y.var2, y.c2,  'LineWidth',lw); hold on; 
plot(x, y.var3, y.c3,  'LineWidth',lw);
plot(x, y.var4, y.c4,  'LineWidth',lw);
legend(y.s1,y.s2,y.s3,y.s4,y.opt); grid on;
set(gca,'FontSize',fsize); axis(y.xy);  
xlabel(y.xl,'FontSize',fsize); 
ylabel(y.yl,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetrad_clr'; expn='AM4p0_rfpcess'; 
yl='changes in TOA net radiation (W/m2)'; climo=0;
y1=am4c.v0.toa.netrad_clr.txavg0;  s1='2010RAD';
y2=am4c.c0.toa.netrad_clr.txavg0;  s2='1860RAD';
y3=am4c.a0.toa.netrad_clr.txavg0;  s3='2010AERO';
y4=am4c.w0.toa.netrad_clr.txavg0;  s4='P2K';
y.var1=y1-y2;     y.s1=strcat('2010RAD minus 1860RAD (Total RFP;');
y.var2=y3-y2;     y.s2=strcat('2010AER minus 1860RAD (Aero RFP;');
y.var3=y.var1-y.var2; y.s3=strcat('Total minus Aero  (GHG&VOL;');
y.var4=y4-y1;         y.s4=strcat('P2K minus 2010RAD (CESS;');
a=mean(mean(y.var1.*a0)); y.s1=sprintf('%s MEAN=%5.2f)',y.s1,a);y.av1=a;
a=mean(mean(y.var2.*a0)); y.s2=sprintf('%s MEAN=%5.2f)',y.s2,a);y.av2=a;
a=mean(mean(y.var3.*a0)); y.s3=sprintf('%s MEAN=%5.2f)',y.s3,a);y.av3=a;
a=mean(mean(y.var4.*a0)); y.s4=sprintf('%s MEAN=%5.2f)',y.s4,a);y.av4=a;
y.xy=[-90 90 -7 9]; y.yl=yl; y.xl='latitude'; x=s.lat; 
y.c1='k'; y.c2='b'; y.c3='g'; y.c4='r'; y.opt=1;
pms=[ 0, 0, 1000, 800]*0.8; fsize=12; lw=2; msize=12; 
handle = figure('Position', pms,'visible','on');
plot(x, y.var1, y.c1,  'LineWidth',lw); hold on; 
plot(x, y.var2, y.c2,  'LineWidth',lw); hold on; 
plot(x, y.var3, y.c3,  'LineWidth',lw);
plot(x, y.var4, y.c4,  'LineWidth',lw);
legend(y.s1,y.s2,y.s3,y.s4,y.opt); grid on;
set(gca,'FontSize',fsize); axis(y.xy);  
xlabel(y.xl,'FontSize',fsize); 
ylabel(y.yl,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=aref0.v0; aref0.c0=v0; aref0.a0=v0; 
v0=am21.v0;  am21.c0 =v0; am21.a0 =v0; am21.g0=v0; 
v0=am3.v0;   am3.c0  =v0; am3.a0  =v0; am3.g0 =v0; 
x=aref0;     aref0.d=compute_rfp_all(x);
x=am21;      am21.d =compute_rfp_all(x);
x=am3;       am3.d  =compute_rfp_all(x);
x=am4;       am4.d  =compute_rfp_all(x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
am2=aref0; am2.d.netradtoa.rfp=[2.17 -0.7 2.87 -3.70 3.55];am2.d.netradtoa_clr.rfp(:)=0;
am3=aref0; am3.d.netradtoa.rfp=[0.99 -1.6 2.59 -2.99 3.62];am3.d.netradtoa_clr.rfp(:)=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section 1: RFP CESS sensitivity global and regional plots%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xy=[0.5 4.6 -5 5]; xy=[0.5 6.5 -5 5];
plot_am4_netrad(aref0,am21,am3,am4,xy,4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section 2: latitudional plots%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=mean(s.aa,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetrad'; yl='changes in TOA net radiation (W/m2)'; climo=0;
y1 =am4.v0.toa.netrad.txavg0;  s1='2010RAD';
y2 =am4.w0.toa.netrad.txavg0;  s2='P2K';
y3 =am4.g0.toa.netrad.txavg0;  s3='2xCO2';
y4 =am4.c0.toa.netrad.txavg0;  s4='1860RAD';
y5 =am4.a0.toa.netrad.txavg0;  s5='2010AERO';
y6 =am4.u0.toa.netrad.txavg0;  s6='M2K';
y7 =am4.f0.toa.netrad.txavg0;  s7='1/2xCO2';
%y8 =am21.v0.toa.netrad.txavg0; s8='AM2CNTL';
%y9 =am21.w0.toa.netrad.txavg0; s9='AM2P2K';
y.a0=a0; y.climo=climo; y.yl=yl; y.xy=[-90 90 -7 9];
if (y.climo==1); 
 y.var1=y1; y.var2=y2; y.var3=y3; y.var4=y4; 
 y.var5=y5; y.var6=y6; y.var7=y7;
else
 y.var1=y2-y1;  y.s1=strcat(s2,'-minus-',s1);
 y.var2=y3-y1;  y.s2=strcat(s3,'-minus-',s1);
 y.var3=y1-y4;  y.s3=strcat(s1,'-minus-',s4);
 y.var4=y5-y4;  y.s4=strcat(s5,'-minus-',s4);
 y.var5=y1-y6;  y.s5=strcat(s1,'-minus-',s6);
 y.var6=y1-y7;  y.s6=strcat(s1,'-minus-',s7);
end
y.c1='r'; y.c2='g'; y.c3='k'; y.c4='b'; y.c5='m'; y.c6='c';
expn='AM4'; x=s.lat; y.opt=1; y.xl='latitude';
plot_latdis_am4cessrfp(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dswnet'; yl='changes in TOA SW radiation (W/m2)'; climo=0;
ya =aref0.v0.toa.swnet.txavg0;     sa='AM2like';
yb =aref0.w0.toa.swnet.txavg0; 
yc =am3.v0.toa.swnet.txavg0;       sb='AM3';
yd =am3.w0.toa.swnet.txavg0; 
y1 =am4g11r11.v0.toa.swnet.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.toa.swnet.txavg0; 
y3 =am4g12r04.v0.toa.swnet.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.toa.swnet.txavg0;
y5 =am4g12r16.v0.toa.swnet.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.toa.swnet.txavg0;
y7 =am4g12r17.v0.toa.swnet.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.toa.swnet.txavg0; y8a =am4g12r17.u0.toa.swnet.txavg0;
y9 =am4g12r18.v0.toa.swnet.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.toa.swnet.txavg0;
k=1; yo=squeeze(o.toa.swnet.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='CERES'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9; %y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dlwnet'; yl='changes in TOA LW radiation (W/m2)'; climo=0;
ya =aref0.v0.toa.lwnet.txavg0;     sa='AM2like';
yb =aref0.w0.toa.lwnet.txavg0; 
yc =am3.v0.toa.lwnet.txavg0;       sb='AM3';
yd =am3.w0.toa.lwnet.txavg0; 
y1 =am4g11r11.v0.toa.lwnet.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.toa.lwnet.txavg0; 
y3 =am4g12r04.v0.toa.lwnet.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.toa.lwnet.txavg0;
y5 =am4g12r16.v0.toa.lwnet.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.toa.lwnet.txavg0;
y7 =am4g12r17.v0.toa.lwnet.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.toa.lwnet.txavg0; y8a =am4g12r17.u0.toa.lwnet.txavg0;
y9 =am4g12r18.v0.toa.lwnet.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.toa.lwnet.txavg0;
k=1; yo=squeeze(o.toa.lwnet.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='CERES'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9; %y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dttcf'; yl='changes in TOA net CRE (W/m2)'; climo=0;
ya =aref0.v0.toa.ttcf.txavg0;     sa='AM2like';
yb =aref0.w0.toa.ttcf.txavg0; 
yc =am3.v0.toa.ttcf.txavg0;       sb='AM3';
yd =am3.w0.toa.ttcf.txavg0; 
y1 =am4g11r11.v0.toa.ttcf.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.toa.ttcf.txavg0; 
y3 =am4g12r04.v0.toa.ttcf.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.toa.ttcf.txavg0;
y5 =am4g12r16.v0.toa.ttcf.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.toa.ttcf.txavg0;
y7 =am4g12r17.v0.toa.ttcf.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.toa.ttcf.txavg0; y8a =am4g12r17.u0.toa.ttcf.txavg0;
y9 =am4g12r18.v0.toa.ttcf.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.toa.ttcf.txavg0;
k=1; yo=squeeze(o.toa.ttcf.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='CERES'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9; %y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dswcf'; yl='changes in TOA SW CRE (W/m2)'; climo=0;
ya =aref0.v0.toa.swcf.txavg0;     sa='AM2like';
yb =aref0.w0.toa.swcf.txavg0; 
yc =am3.v0.toa.swcf.txavg0;       sb='AM3';
yd =am3.w0.toa.swcf.txavg0; 
y1 =am4g11r11.v0.toa.swcf.txavg0; s1='AM4g11r11';
y2 =am4g11r11.w0.toa.swcf.txavg0; 
y3 =am4g12r04.v0.toa.swcf.txavg0; s3='AM4g12r04';
y4 =am4g12r04.w0.toa.swcf.txavg0;
y5 =am4g12r16.v0.toa.swcf.txavg0; s5='AM4g12r16';
y6 =am4g12r16.w0.toa.swcf.txavg0;
y7 =am4g12r17.v0.toa.swcf.txavg0; s7='AM4g12r17';
y8 =am4g12r17.w0.toa.swcf.txavg0; y8a =am4g12r17.u0.toa.swcf.txavg0;
y9 =am4g12r18.v0.toa.swcf.txavg0; s9='AM4g12r18';
y10=am4g12r18.w0.toa.swcf.txavg0;
k=1; yo=squeeze(o.toa.swcf.latdis.sea(k,:)); y.varo=yo;
y.xy=[-90 90 -7 -1]; y.yl=yl; y.climo=climo;
if (y.climo==1); 
  ya=-ya;  yc=-yc;  y1=-y1;  y3=-y3;  y5=-y5;  y7=-y7;  y9=-y9;
  yb(:)=0; yd(:)=0; y2(:)=0; y4(:)=0; y6(:)=0; y8(:)=0; y10(:)=0;
  y.xy=[-90 90 -130 85]; y.yl=yl(12:end); vname=vname(2:end);
  y.so='CERES'; y.co='m';
end
y.varo=yo; y.var1=yb-ya; y.var2=yd-yc;
y.var3=y2-y1; y.var4=y4-y3; y.var5=y6-y5; y.var6=y8-y7; y.var7=y10-y9; %y.var7=y7-y8a;
y.s1=sa;    y.s2=sb;    y.s3=s1;   y.s4=s3;   y.s5=s5;   y.s6=s7;    y.s7=s9;
y.c1='k--'; y.c2='r--'; y.c3='r-'; y.c4='g-'; y.c5='b-'; y.c6='k-'; y.c7='c-'; 
expn='AM4'; x=s.lat; y.opt=0; y.xl='latitude';
plot_latdis_am4(x,y,expn,vname);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section 2: latitudional plots of CESS cloud feedbacks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=mean(s.aa,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetrad_lat'; expn='cess';
yl='changes in TOA net radiation (W/m2)'; climo=0;
y1=am4a.v0.toa.netrad.txavg0;  s1='AM4-CNTL';
y2=am4a.w0.toa.netrad.txavg0;  s2='AM4';
y3=am3.v0.toa.netrad.txavg0;   s3='AM3-CNTL';
y4=am3.w0.toa.netrad.txavg0;   s4='AM3';
y5=am2.v0.toa.netrad.txavg0;   s5='AM2-CNTL';
y6=am2.w0.toa.netrad.txavg0;   s6='AM2.1';
y7=am4.v1.toa.netrad.txavg0;   s7='AM4FN-CNTL';
y8=am4.w1.toa.netrad.txavg0;   s8='AM4FN';
y9=am4.v9.toa.netrad.txavg0;   s9='AM4EIS-CNTL';
y10=am4.w9.toa.netrad.txavg0;  s10='AM4EIS';
y.var1=y2-y1; y.s1=strcat('AM4');
y.var2=y4-y3; y.s2=strcat('AM3');
y.var3=y6-y5; y.s3=strcat('AM2.1');
y.var4=y8-y7; y.s4=strcat('AM4FN');
y.var5=y10-y9;y.s5=strcat('AM4EIS');
a=mean(mean(y.var1.*a0)); y.s1=sprintf('%s (MEAN=%5.2f)',y.s1,a);y.av1=a;
a=mean(mean(y.var2.*a0)); y.s2=sprintf('%s (MEAN=%5.2f)',y.s2,a);y.av2=a;
a=mean(mean(y.var3.*a0)); y.s3=sprintf('%s (MEAN=%5.2f)',y.s3,a);y.av3=a;
a=mean(mean(y.var4.*a0)); y.s4=sprintf('%s (MEAN=%5.2f)',y.s4,a);y.av4=a;
a=mean(mean(y.var5.*a0)); y.s5=sprintf('%s (MEAN=%5.2f)',y.s5,a);y.av5=a;
y.xy=[-90 90 -7 0]; y.yl=yl; y.xl='latitude'; x=s.lat; 
y.c1='r'; y.c2='g'; y.c3='b'; y.c4='r--'; y.c5='r:'; y.opt=1;
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=3; msize=12; 
handle = figure('Position', pms,'visible','on');
plot(x, y.var1, y.c1,  'LineWidth',lw); hold on; 
plot(x, y.var2, y.c2,  'LineWidth',lw); hold on; 
plot(x, y.var3, y.c3,  'LineWidth',lw);
plot(x, y.var4, y.c4,  'LineWidth',lw);
plot(x, y.var5, y.c5,  'LineWidth',lw+1);
legend(y.s1,y.s2,y.s3,y.s4,y.s5,y.opt); grid on;
set(gca,'FontSize',fsize); axis(y.xy);  
xlabel(y.xl,'FontSize',fsize); 
ylabel(y.yl,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=mean(s.aa,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetrad_clr_lat'; expn='cess';
yl='changes in TOA clear-sky net radiation (W/m2)'; climo=0;
y1=am4a.v0.toa.netrad_clr.txavg0;  s1='AM4-CNTL';
y2=am4a.w0.toa.netrad_clr.txavg0;  s2='AM4';
y3=am3.v0.toa.netrad_clr.txavg0;   s3='AM3-CNTL';
y4=am3.w0.toa.netrad_clr.txavg0;   s4='AM3';
y5=am2.v0.toa.netrad_clr.txavg0;   s5='AM2-CNTL';
y6=am2.w0.toa.netrad_clr.txavg0;   s6='AM2.1';
y7=am4.v1.toa.netrad_clr.txavg0;   s7='AM4FN-CNTL';
y8=am4.w1.toa.netrad_clr.txavg0;   s8='AM4FN';
y9 =am4.v9.toa.netrad_clr.txavg0;  s9='AM4EIS-CNTL';
y10=am4.w9.toa.netrad_clr.txavg0;  s10='AM4EIS';
y.var1=y2-y1; y.s1=strcat('AM4');
y.var2=y4-y3; y.s2=strcat('AM3');
y.var3=y6-y5; y.s3=strcat('AM2.1');
y.var4=y8-y7; y.s4=strcat('AM4FN');
y.var5=y10-y9;y.s5=strcat('AM4EIS');
a=mean(mean(y.var1.*a0)); y.s1=sprintf('%s (MEAN=%5.2f)',y.s1,a);y.av1=a;
a=mean(mean(y.var2.*a0)); y.s2=sprintf('%s (MEAN=%5.2f)',y.s2,a);y.av2=a;
a=mean(mean(y.var3.*a0)); y.s3=sprintf('%s (MEAN=%5.2f)',y.s3,a);y.av3=a;
a=mean(mean(y.var4.*a0)); y.s4=sprintf('%s (MEAN=%5.2f)',y.s4,a);y.av4=a;
a=mean(mean(y.var5.*a0)); y.s5=sprintf('%s (MEAN=%5.2f)',y.s5,a);y.av5=a;
y.xy=[-90 90 -7 0]; y.yl=yl; y.xl='latitude'; x=s.lat; 
y.c1='r'; y.c2='g'; y.c3='b'; y.c4='r--'; y.c5='r:'; y.opt=4;
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=3; msize=12; 
handle = figure('Position', pms,'visible','on');
plot(x, y.var1, y.c1,  'LineWidth',lw); hold on; 
plot(x, y.var2, y.c2,  'LineWidth',lw); hold on; 
plot(x, y.var3, y.c3,  'LineWidth',lw);
plot(x, y.var4, y.c4,  'LineWidth',lw);
plot(x, y.var5, y.c5,  'LineWidth',lw+1);
legend(y.s1,y.s2,y.s3,y.s4,y.s5,y.opt); grid on;
set(gca,'FontSize',fsize); axis(y.xy);  
xlabel(y.xl,'FontSize',fsize); 
ylabel(y.yl,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=mean(s.aa,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dttcf_lat'; expn='cess';
yl='changes in TOA net CRE (W/m2)'; climo=0;
y1=am4a.v0.toa.ttcf.txavg0;  s1='AM4-CNTL';
y2=am4a.w0.toa.ttcf.txavg0;  s2='AM4';
y3=am3.v0.toa.ttcf.txavg0;   s3='AM3-CNTL';
y4=am3.w0.toa.ttcf.txavg0;   s4='AM3';
y5=am2.v0.toa.ttcf.txavg0;   s5='AM2-CNTL';
y6=am2.w0.toa.ttcf.txavg0;   s6='AM2.1';
y7=am4.v1.toa.ttcf.txavg0;   s7='AM4FN-CNTL';
y8=am4.w1.toa.ttcf.txavg0;   s8='AM4FN';
y9 =am4.v9.toa.ttcf.txavg0;  s9='AM4EIS-CNTL';
y10=am4.w9.toa.ttcf.txavg0;  s10='AM4EIS';
y.var1=y2-y1; y.s1=strcat('AM4');
y.var2=y4-y3; y.s2=strcat('AM3');
y.var3=y6-y5; y.s3=strcat('AM2.1');
y.var4=y8-y7; y.s4=strcat('AM4FN');
y.var5=y10-y9;y.s5=strcat('AM4EIS');
a=mean(mean(y.var1.*a0)); y.s1=sprintf('%s (MEAN=%5.2f)',y.s1,a);y.av1=a;
a=mean(mean(y.var2.*a0)); y.s2=sprintf('%s (MEAN=%5.2f)',y.s2,a);y.av2=a;
a=mean(mean(y.var3.*a0)); y.s3=sprintf('%s (MEAN=%5.2f)',y.s3,a);y.av3=a;
a=mean(mean(y.var4.*a0)); y.s4=sprintf('%s (MEAN=%5.2f)',y.s4,a);y.av4=a;
a=mean(mean(y.var5.*a0)); y.s5=sprintf('%s (MEAN=%5.2f)',y.s5,a);y.av5=a;
y.xy=[-90 90 -4 4]; y.yl=yl; y.xl='latitude'; x=s.lat; 
y.c1='r'; y.c2='g'; y.c3='b'; y.c4='r--'; y.c5='r:'; y.opt=1;
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=3; msize=12; 
handle = figure('Position', pms,'visible','on');
plot(x, y.var1, y.c1,  'LineWidth',lw); hold on; 
plot(x, y.var2, y.c2,  'LineWidth',lw); hold on; 
plot(x, y.var3, y.c3,  'LineWidth',lw);
plot(x, y.var4, y.c4,  'LineWidth',lw);
plot(x, y.var5, y.c5,  'LineWidth',lw+1);
legend(y.s1,y.s2,y.s3,y.s4,y.s5,y.opt); grid on;
set(gca,'FontSize',fsize); axis(y.xy);  
xlabel(y.xl,'FontSize',fsize); 
ylabel(y.yl,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=mean(s.aa,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dswcf_lat'; expn='cess';
yl='changes in TOA SW CRE (W/m2)'; climo=0;
y1=am4a.v0.toa.swcf.txavg0;  s1='AM4-CNTL';
y2=am4a.w0.toa.swcf.txavg0;  s2='AM4';
y3=am3.v0.toa.swcf.txavg0;   s3='AM3-CNTL';
y4=am3.w0.toa.swcf.txavg0;   s4='AM3';
y5=am2.v0.toa.swcf.txavg0;   s5='AM2-CNTL';
y6=am2.w0.toa.swcf.txavg0;   s6='AM2.1';
y7=am4.v1.toa.swcf.txavg0;   s7='AM4FN-CNTL';
y8=am4.w1.toa.swcf.txavg0;   s8='AM4FN';
y9 =am4.v9.toa.swcf.txavg0;  s9='AM4EIS-CNTL';
y10=am4.w9.toa.swcf.txavg0;  s10='AM4EIS';
y.var1=y2-y1; y.s1=strcat('AM4');
y.var2=y4-y3; y.s2=strcat('AM3');
y.var3=y6-y5; y.s3=strcat('AM2.1');
y.var4=y8-y7; y.s4=strcat('AM4FN');
y.var5=y10-y9; y.s5=strcat('AM4EIS');
a=mean(mean(y.var1.*a0)); y.s1=sprintf('%s (MEAN=%5.2f)',y.s1,a);y.av1=a;
a=mean(mean(y.var2.*a0)); y.s2=sprintf('%s (MEAN=%5.2f)',y.s2,a);y.av2=a;
a=mean(mean(y.var3.*a0)); y.s3=sprintf('%s (MEAN=%5.2f)',y.s3,a);y.av3=a;
a=mean(mean(y.var4.*a0)); y.s4=sprintf('%s (MEAN=%5.2f)',y.s4,a);y.av4=a;
a=mean(mean(y.var5.*a0)); y.s5=sprintf('%s (MEAN=%5.2f)',y.s5,a);y.av5=a;
y.xy=[-90 90 -6 6]; y.yl=yl; y.xl='latitude'; x=s.lat; 
y.c1='r'; y.c2='g'; y.c3='b'; y.c4='r--'; y.c5='r:'; y.opt=1;
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=3; msize=12; 
handle = figure('Position', pms,'visible','on');
plot(x, y.var1, y.c1,  'LineWidth',lw); hold on; 
plot(x, y.var2, y.c2,  'LineWidth',lw); hold on; 
plot(x, y.var3, y.c3,  'LineWidth',lw);
plot(x, y.var4, y.c4,  'LineWidth',lw);
plot(x, y.var5, y.c5,  'LineWidth',lw+1);
legend(y.s1,y.s2,y.s3,y.s4,y.s5,y.opt); grid on;
set(gca,'FontSize',fsize); axis(y.xy);  
xlabel(y.xl,'FontSize',fsize); 
ylabel(y.yl,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=mean(s.aa,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dlwcf_lat'; expn='cess';
yl='changes in TOA LW CRE (W/m2)'; climo=0;
y1=am4a.v0.toa.lwcf.txavg0;  s1='AM4-CNTL';
y2=am4a.w0.toa.lwcf.txavg0;  s2='AM4';
y3=am3.v0.toa.lwcf.txavg0;   s3='AM3-CNTL';
y4=am3.w0.toa.lwcf.txavg0;   s4='AM3';
y5=am2.v0.toa.lwcf.txavg0;   s5='AM2-CNTL';
y6=am2.w0.toa.lwcf.txavg0;   s6='AM2.1';
y7=am4.v1.toa.lwcf.txavg0;   s7='AM4FN-CNTL';
y8=am4.w1.toa.lwcf.txavg0;   s8='AM4FN';
y9 =am4.v9.toa.lwcf.txavg0;  s9='AM4EIS-CNTL';
y10=am4.w9.toa.lwcf.txavg0;  s10='AM4EIS';
y.var1=y2-y1; y.s1=strcat('AM4');
y.var2=y4-y3; y.s2=strcat('AM3');
y.var3=y6-y5; y.s3=strcat('AM2.1');
y.var4=y8-y7; y.s4=strcat('AM4FN');
y.var5=y10-y9; y.s5=strcat('AM4EIS');
a=mean(mean(y.var1.*a0)); y.s1=sprintf('%s (MEAN=%5.2f)',y.s1,a);y.av1=a;
a=mean(mean(y.var2.*a0)); y.s2=sprintf('%s (MEAN=%5.2f)',y.s2,a);y.av2=a;
a=mean(mean(y.var3.*a0)); y.s3=sprintf('%s (MEAN=%5.2f)',y.s3,a);y.av3=a;
a=mean(mean(y.var4.*a0)); y.s4=sprintf('%s (MEAN=%5.2f)',y.s4,a);y.av4=a;
a=mean(mean(y.var5.*a0)); y.s5=sprintf('%s (MEAN=%5.2f)',y.s5,a);y.av5=a;
y.xy=[-90 90 -6 6]; y.yl=yl; y.xl='latitude'; x=s.lat; 
y.c1='r'; y.c2='g'; y.c3='b'; y.c4='r--'; y.c5='r:'; y.opt=1;
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=3; msize=12; 
handle = figure('Position', pms,'visible','on');
plot(x, y.var1, y.c1,  'LineWidth',lw); hold on; 
plot(x, y.var2, y.c2,  'LineWidth',lw); hold on; 
plot(x, y.var3, y.c3,  'LineWidth',lw);
plot(x, y.var4, y.c4,  'LineWidth',lw);
plot(x, y.var5, y.c5,  'LineWidth',lw+1);
legend(y.s1,y.s2,y.s3,y.s4,y.s5,y.opt); grid on;
set(gca,'FontSize',fsize); axis(y.xy);  
xlabel(y.xl,'FontSize',fsize); 
ylabel(y.yl,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=mean(s.aa,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dlwp_lat'; expn='cess';
yl='changes in LWP (g/m2)'; climo=0; a=1000;
y1=am4a.v0.atm.lwp.txavg0*a;  s1='AM4-CNTL';
y2=am4a.w0.atm.lwp.txavg0*a;  s2='AM4';
y3=am3.v0.atm.lwp.txavg0*a;   s3='AM3-CNTL';
y4=am3.w0.atm.lwp.txavg0*a;   s4='AM3';
y5=am2.v0.atm.lwp.txavg0*a;   s5='AM2-CNTL';
y6=am2.w0.atm.lwp.txavg0*a;   s6='AM2.1';
y7=am4.v1.atm.lwp.txavg0*a;   s7='AM4FN-CNTL';
y8=am4.w1.atm.lwp.txavg0*a;   s8='AM4FN';
y9 =am4.v9.atm.lwp.txavg0*a;  s9='AM4EIS-CNTL';
y10=am4.w9.atm.lwp.txavg0*a;  s10='AM4EIS';
y.var1=y2-y1; y.s1=strcat('AM4');
y.var2=y4-y3; y.s2=strcat('AM3');
y.var3=y6-y5; y.s3=strcat('AM2.1');
y.var4=y8-y7; y.s4=strcat('AM4FN');
y.var5=y10-y9; y.s5=strcat('AM4EIS');
a=mean(mean(y.var1.*a0)); y.s1=sprintf('%s (MEAN=%5.2f)',y.s1,a);y.av1=a;
a=mean(mean(y.var2.*a0)); y.s2=sprintf('%s (MEAN=%5.2f)',y.s2,a);y.av2=a;
a=mean(mean(y.var3.*a0)); y.s3=sprintf('%s (MEAN=%5.2f)',y.s3,a);y.av3=a;
a=mean(mean(y.var4.*a0)); y.s4=sprintf('%s (MEAN=%5.2f)',y.s4,a);y.av4=a;
a=mean(mean(y.var5.*a0)); y.s5=sprintf('%s (MEAN=%5.2f)',y.s5,a);y.av5=a;
y.xy=[-90 90 -5 20]; y.yl=yl; y.xl='latitude'; x=s.lat; 
y.c1='r'; y.c2='g'; y.c3='b'; y.c4='r--'; y.c5='r:'; y.opt=0;
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=3; msize=12; 
handle = figure('Position', pms,'visible','on');
plot(x, y.var1, y.c1,  'LineWidth',lw); hold on; 
plot(x, y.var2, y.c2,  'LineWidth',lw); hold on; 
plot(x, y.var3, y.c3,  'LineWidth',lw);
plot(x, y.var4, y.c4,  'LineWidth',lw);
plot(x, y.var5, y.c5,  'LineWidth',lw+1);
legend(y.s1,y.s2,y.s3,y.s4,y.s5,y.opt); grid on;
set(gca,'FontSize',fsize); axis(y.xy);  
xlabel(y.xl,'FontSize',fsize); 
ylabel(y.yl,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=mean(s.aa,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='diwp_lat'; expn='cess';
yl='changes in IWP (g/m2)'; climo=0; a=1000;
y1=am4a.v0.atm.iwp.txavg0*a;  s1='AM4-CNTL';
y2=am4a.w0.atm.iwp.txavg0*a;  s2='AM4';
y3=am3.v0.atm.iwp.txavg0*a;   s3='AM3-CNTL';
y4=am3.w0.atm.iwp.txavg0*a;   s4='AM3';
y5=am2.v0.atm.iwp.txavg0*a;   s5='AM2-CNTL';
y6=am2.w0.atm.iwp.txavg0*a;   s6='AM2.1';
y7=am4.v1.atm.iwp.txavg0*a;   s7='AM4FN-CNTL';
y8=am4.w1.atm.iwp.txavg0*a;   s8='AM4FN';
y9 =am4.v9.atm.iwp.txavg0*a;  s9='AM4EIS-CNTL';
y10=am4.w9.atm.iwp.txavg0*a;  s10='AM4EIS';
y.var1=y2-y1; y.s1=strcat('AM4');
y.var2=y4-y3; y.s2=strcat('AM3');
y.var3=y6-y5; y.s3=strcat('AM2.1');
y.var4=y8-y7; y.s4=strcat('AM4FN');
y.var5=y10-y9; y.s5=strcat('AM4EIS');
a=mean(mean(y.var1.*a0)); y.s1=sprintf('%s (MEAN=%5.2f)',y.s1,a);y.av1=a;
a=mean(mean(y.var2.*a0)); y.s2=sprintf('%s (MEAN=%5.2f)',y.s2,a);y.av2=a;
a=mean(mean(y.var3.*a0)); y.s3=sprintf('%s (MEAN=%5.2f)',y.s3,a);y.av3=a;
a=mean(mean(y.var4.*a0)); y.s4=sprintf('%s (MEAN=%5.2f)',y.s4,a);y.av4=a;
a=mean(mean(y.var5.*a0)); y.s5=sprintf('%s (MEAN=%5.2f)',y.s5,a);y.av5=a;
y.xy=[-90 90 -5 20]; y.yl=yl; y.xl='latitude'; x=s.lat; 
y.c1='r'; y.c2='g'; y.c3='b'; y.c4='r--'; y.c5='r:'; y.opt=1;
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=3; msize=12; 
handle = figure('Position', pms,'visible','on');
plot(x, y.var1, y.c1,  'LineWidth',lw); hold on; 
plot(x, y.var2, y.c2,  'LineWidth',lw); hold on; 
plot(x, y.var3, y.c3,  'LineWidth',lw);
plot(x, y.var4, y.c4,  'LineWidth',lw);
plot(x, y.var5, y.c5,  'LineWidth',lw+1);
legend(y.s1,y.s2,y.s3,y.s4,y.s5,y.opt); grid on;
set(gca,'FontSize',fsize); axis(y.xy);  
xlabel(y.xl,'FontSize',fsize); 
ylabel(y.yl,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=mean(s.aa,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dwvp_lat'; expn='cess'; 
yl='changes in WVP (kg/m2)'; climo=0; a=1;
y1=am4a.v0.atm.wvp.txavg0*a;  s1='AM4-CNTL';
y2=am4a.w0.atm.wvp.txavg0*a;  s2='AM4';
y3=am3.v0.atm.wvp.txavg0*a;   s3='AM3-CNTL';
y4=am3.w0.atm.wvp.txavg0*a;   s4='AM3';
y5=am2.v0.atm.wvp.txavg0*a;   s5='AM2-CNTL';
y6=am2.w0.atm.wvp.txavg0*a;   s6='AM2.1';
y7=am4.v1.atm.wvp.txavg0*a;   s7='AM4FN-CNTL';
y8=am4.w1.atm.wvp.txavg0*a;   s8='AM4FN';
y9 =am4.v9.atm.wvp.txavg0*a;  s9='AM4EIS-CNTL';
y10=am4.w9.atm.wvp.txavg0*a;  s10='AM4EIS';
y.var1=y2-y1; y.s1=strcat('AM4');
y.var2=y4-y3; y.s2=strcat('AM3');
y.var3=y6-y5; y.s3=strcat('AM2.1');
y.var4=y8-y7; y.s4=strcat('AM4FN');
y.var5=y10-y9; y.s5=strcat('AM4EIS');
a=mean(mean(y.var1.*a0)); y.s1=sprintf('%s (MEAN=%5.2f)',y.s1,a);y.av1=a;
a=mean(mean(y.var2.*a0)); y.s2=sprintf('%s (MEAN=%5.2f)',y.s2,a);y.av2=a;
a=mean(mean(y.var3.*a0)); y.s3=sprintf('%s (MEAN=%5.2f)',y.s3,a);y.av3=a;
a=mean(mean(y.var4.*a0)); y.s4=sprintf('%s (MEAN=%5.2f)',y.s4,a);y.av4=a;
a=mean(mean(y.var5.*a0)); y.s5=sprintf('%s (MEAN=%5.2f)',y.s5,a);y.av5=a;
y.xy=[-90 90 0 10]; y.yl=yl; y.xl='latitude'; x=s.lat; 
y.c1='r'; y.c2='g'; y.c3='b'; y.c4='r--'; y.c5='r:'; y.opt=1;
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=3; msize=12; 
handle = figure('Position', pms,'visible','on');
plot(x, y.var1, y.c1,  'LineWidth',lw); hold on; 
plot(x, y.var2, y.c2,  'LineWidth',lw); hold on; 
plot(x, y.var3, y.c3,  'LineWidth',lw);
plot(x, y.var4, y.c4,  'LineWidth',lw);
plot(x, y.var5, y.c5,  'LineWidth',lw+1);
legend(y.s1,y.s2,y.s3,y.s4,y.s5,y.opt); grid on;
set(gca,'FontSize',fsize); axis(y.xy);  
xlabel(y.xl,'FontSize',fsize); 
ylabel(y.yl,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=mean(s.aa,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dqal_lat'; expn='cess';
yl='changes in low cloud amount (%)'; climo=0;
y1=am4a.v0.atm.qal.txavg0;  s1='AM4-CNTL';
y2=am4a.w0.atm.qal.txavg0;  s2='AM4';
y3=am3.v0.atm.qal.txavg0;   s3='AM3-CNTL';
y4=am3.w0.atm.qal.txavg0;   s4='AM3';
y5=am2.v0.atm.qal.txavg0;   s5='AM2-CNTL';
y6=am2.w0.atm.qal.txavg0;   s6='AM2.1';
y7=am4.v1.atm.qal.txavg0;   s7='AM4FN-CNTL';
y8=am4.w1.atm.qal.txavg0;   s8='AM4FN';
y9 =am4.v9.atm.qal.txavg0;  s9='AM4EIS-CNTL';
y10=am4.w9.atm.qal.txavg0;  s10='AM4EIS';
y.var1=y2-y1; y.s1=strcat('AM4');
y.var2=y4-y3; y.s2=strcat('AM3');
y.var3=y6-y5; y.s3=strcat('AM2.1');
y.var4=y8-y7; y.s4=strcat('AM4FN');
y.var5=y10-y9; y.s5=strcat('AM4EIS');
a=mean(mean(y.var1.*a0)); y.s1=sprintf('%s (MEAN=%5.2f)',y.s1,a);y.av1=a;
a=mean(mean(y.var2.*a0)); y.s2=sprintf('%s (MEAN=%5.2f)',y.s2,a);y.av2=a;
a=mean(mean(y.var3.*a0)); y.s3=sprintf('%s (MEAN=%5.2f)',y.s3,a);y.av3=a;
a=mean(mean(y.var4.*a0)); y.s4=sprintf('%s (MEAN=%5.2f)',y.s4,a);y.av4=a;
a=mean(mean(y.var5.*a0)); y.s5=sprintf('%s (MEAN=%5.2f)',y.s5,a);y.av5=a;
y.xy=[-90 90 -4 4]; y.yl=yl; y.xl='latitude'; x=s.lat; 
y.c1='r'; y.c2='g'; y.c3='b'; y.c4='r--'; y.c5='r:'; y.opt=2;
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=3; msize=12; 
handle = figure('Position', pms,'visible','on');
plot(x, y.var1, y.c1,  'LineWidth',lw); hold on; 
plot(x, y.var2, y.c2,  'LineWidth',lw); hold on; 
plot(x, y.var3, y.c3,  'LineWidth',lw);
plot(x, y.var4, y.c4,  'LineWidth',lw);
plot(x, y.var5, y.c5,  'LineWidth',lw+1);
legend(y.s1,y.s2,y.s3,y.s4,y.s5,y.opt); grid on;
set(gca,'FontSize',fsize); axis(y.xy);  
xlabel(y.xl,'FontSize',fsize); 
ylabel(y.yl,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=mean(s.aa,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dqam_lat'; expn='cess';
yl='changes in middle cloud amount (%)'; climo=0;
y1=am4a.v0.atm.qam.txavg0;  s1='AM4-CNTL';
y2=am4a.w0.atm.qam.txavg0;  s2='AM4';
y3=am3.v0.atm.qam.txavg0;   s3='AM3-CNTL';
y4=am3.w0.atm.qam.txavg0;   s4='AM3';
y5=am2.v0.atm.qam.txavg0;   s5='AM2-CNTL';
y6=am2.w0.atm.qam.txavg0;   s6='AM2.1';
y7=am4.v1.atm.qam.txavg0;   s7='AM4FN-CNTL';
y8=am4.w1.atm.qam.txavg0;   s8='AM4FN';
y9 =am4.v9.atm.qam.txavg0;  s9='AM4EIS-CNTL';
y10=am4.w9.atm.qam.txavg0;  s10='AM4EIS';
y.var1=y2-y1; y.s1=strcat('AM4');
y.var2=y4-y3; y.s2=strcat('AM3');
y.var3=y6-y5; y.s3=strcat('AM2.1');
y.var4=y8-y7; y.s4=strcat('AM4FN');
y.var5=y10-y9; y.s5=strcat('AM4EIS');
a=mean(mean(y.var1.*a0)); y.s1=sprintf('%s (MEAN=%5.2f)',y.s1,a);y.av1=a;
a=mean(mean(y.var2.*a0)); y.s2=sprintf('%s (MEAN=%5.2f)',y.s2,a);y.av2=a;
a=mean(mean(y.var3.*a0)); y.s3=sprintf('%s (MEAN=%5.2f)',y.s3,a);y.av3=a;
a=mean(mean(y.var4.*a0)); y.s4=sprintf('%s (MEAN=%5.2f)',y.s4,a);y.av4=a;
a=mean(mean(y.var5.*a0)); y.s5=sprintf('%s (MEAN=%5.2f)',y.s5,a);y.av5=a;
y.xy=[-90 90 -5 5]; y.yl=yl; y.xl='latitude'; x=s.lat; 
y.c1='r'; y.c2='g'; y.c3='b'; y.c4='r--'; y.c5='r:'; y.opt=1;
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=3; msize=12; 
handle = figure('Position', pms,'visible','on');
plot(x, y.var1, y.c1,  'LineWidth',lw); hold on; 
plot(x, y.var2, y.c2,  'LineWidth',lw); hold on; 
plot(x, y.var3, y.c3,  'LineWidth',lw);
plot(x, y.var4, y.c4,  'LineWidth',lw);
plot(x, y.var5, y.c5,  'LineWidth',lw+1);
legend(y.s1,y.s2,y.s3,y.s4,y.s5,y.opt); grid on;
set(gca,'FontSize',fsize); axis(y.xy);  
xlabel(y.xl,'FontSize',fsize); 
ylabel(y.yl,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=mean(s.aa,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dqah_lat'; expn='cess';
yl='changes in high cloud amount (%)'; climo=0;
y1=am4a.v0.atm.qah.txavg0;  s1='AM4-CNTL';
y2=am4a.w0.atm.qah.txavg0;  s2='AM4';
y3=am3.v0.atm.qah.txavg0;   s3='AM3-CNTL';
y4=am3.w0.atm.qah.txavg0;   s4='AM3';
y5=am2.v0.atm.qah.txavg0;   s5='AM2-CNTL';
y6=am2.w0.atm.qah.txavg0;   s6='AM2.1';
y7=am4.v1.atm.qah.txavg0;   s7='AM4FN-CNTL';
y8=am4.w1.atm.qah.txavg0;   s8='AM4FN';
y9 =am4.v9.atm.qah.txavg0;  s9='AM4EIS-CNTL';
y10=am4.w9.atm.qah.txavg0;  s10='AM4EIS';
y.var1=y2-y1; y.s1=strcat('AM4');
y.var2=y4-y3; y.s2=strcat('AM3');
y.var3=y6-y5; y.s3=strcat('AM2.1');
y.var4=y8-y7; y.s4=strcat('AM4FN');
y.var5=y10-y9; y.s5=strcat('AM4EIS');
a=mean(mean(y.var1.*a0)); y.s1=sprintf('%s (MEAN=%5.2f)',y.s1,a);y.av1=a;
a=mean(mean(y.var2.*a0)); y.s2=sprintf('%s (MEAN=%5.2f)',y.s2,a);y.av2=a;
a=mean(mean(y.var3.*a0)); y.s3=sprintf('%s (MEAN=%5.2f)',y.s3,a);y.av3=a;
a=mean(mean(y.var4.*a0)); y.s4=sprintf('%s (MEAN=%5.2f)',y.s4,a);y.av4=a;
a=mean(mean(y.var5.*a0)); y.s5=sprintf('%s (MEAN=%5.2f)',y.s5,a);y.av5=a;
y.xy=[-90 90 -5 5]; y.yl=yl; y.xl='latitude'; x=s.lat; 
y.c1='r'; y.c2='g'; y.c3='b'; y.c4='r--'; y.c5='r:'; y.opt=1;
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=3; msize=12; 
handle = figure('Position', pms,'visible','on');
plot(x, y.var1, y.c1,  'LineWidth',lw); hold on; 
plot(x, y.var2, y.c2,  'LineWidth',lw); hold on; 
plot(x, y.var3, y.c3,  'LineWidth',lw);
plot(x, y.var4, y.c4,  'LineWidth',lw);
plot(x, y.var5, y.c5,  'LineWidth',lw+1);
legend(y.s1,y.s2,y.s3,y.s4,y.s5,y.opt); grid on;
set(gca,'FontSize',fsize); axis(y.xy);  
xlabel(y.xl,'FontSize',fsize); 
ylabel(y.yl,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=s.aa; z=am4.v0; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtsurf_map'; k=1;
x1=squeeze(am4a.v0.sfc.tsurf.sea(k,:,:)); s.s1='AM4.0';
x2=squeeze(am4a.w0.sfc.tsurf.sea(k,:,:)); s.s1='AM4.0';
x3=squeeze(am3.v0.sfc.tsurf.sea(k,:,:));  s.s2='AM3';
x4=squeeze(am3.w0.sfc.tsurf.sea(k,:,:));  s.s2='AM3';
x5=squeeze(am2.v0.sfc.tsurf.sea(k,:,:));  s.s3='AM2';
x6=squeeze(am2.w0.sfc.tsurf.sea(k,:,:));  s.s3='AM2';
x7=squeeze(am4.v1.sfc.tsurf.sea(k,:,:));  s.s4='AM4FN';
x8=squeeze(am4.w1.sfc.tsurf.sea(k,:,:));  s.s4='AM4FN';
x9 =squeeze(am4.v9.sfc.tsurf.sea(k,:,:));  s.s5='AM4EIS';
x10=squeeze(am4.w9.sfc.tsurf.sea(k,:,:));  s.s5='AM4EIS';
z1=x2-x1; z2=x4-x3; z3=x6-x5; z4=x8-x7; z5=x10-x9; 
a=mean(mean(z1.*a0)); s.s1=sprintf('%s (MEAN=%5.2f)',s.s1,a);
a=mean(mean(z2.*a0)); s.s2=sprintf('%s (MEAN=%5.2f)',s.s2,a);
a=mean(mean(z3.*a0)); s.s3=sprintf('%s (MEAN=%5.2f)',s.s3,a);
a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s4,a);
%z4=z1-z3; a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s5,a);
cmin=0; cmax=3; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='cess'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=s.aa; z=am4.v0; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_map'; k=1;
x1=squeeze(am4a.v0.sfc.tref.sea(k,:,:)); s.s1='AM4.0';
x2=squeeze(am4a.w0.sfc.tref.sea(k,:,:)); s.s1='AM4.0';
x3=squeeze(am3.v0.sfc.tref.sea(k,:,:));  s.s2='AM3';
x4=squeeze(am3.w0.sfc.tref.sea(k,:,:));  s.s2='AM3';
x5=squeeze(am2.v0.sfc.tref.sea(k,:,:));  s.s3='AM2';
x6=squeeze(am2.w0.sfc.tref.sea(k,:,:));  s.s3='AM2';
x7=squeeze(am4.v1.sfc.tref.sea(k,:,:));  s.s4='AM4FN';
x8=squeeze(am4.w1.sfc.tref.sea(k,:,:));  s.s4='AM4FN';
x9 =squeeze(am4.v9.sfc.tref.sea(k,:,:));  s.s5='AM4EIS';
x10=squeeze(am4.w9.sfc.tref.sea(k,:,:));  s.s5='AM4EIS';
z1=x2-x1; z2=x4-x3; z3=x6-x5; z4=x8-x7; z5=x10-x9; 
a=mean(mean(z1.*a0)); s.s1=sprintf('%s (MEAN=%5.2f)',s.s1,a);
a=mean(mean(z2.*a0)); s.s2=sprintf('%s (MEAN=%5.2f)',s.s2,a);
a=mean(mean(z3.*a0)); s.s3=sprintf('%s (MEAN=%5.2f)',s.s3,a);
a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s4,a);
%z4=z1-z3; a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s5,a);
cmin=0; cmax=3; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='cess'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=s.aa; z=am4.v0; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dpcp_map'; k=1;
x1=squeeze(am4a.v0.sfc.pcp.sea(k,:,:)); s.s1='AM4.0';
x2=squeeze(am4a.w0.sfc.pcp.sea(k,:,:)); s.s1='AM4.0';
x3=squeeze(am3.v0.sfc.pcp.sea(k,:,:));  s.s2='AM3';
x4=squeeze(am3.w0.sfc.pcp.sea(k,:,:));  s.s2='AM3';
x5=squeeze(am2.v0.sfc.pcp.sea(k,:,:));  s.s3='AM2';
x6=squeeze(am2.w0.sfc.pcp.sea(k,:,:));  s.s3='AM2';
x7=squeeze(am4.v1.sfc.pcp.sea(k,:,:));  s.s4='AM4FN';
x8=squeeze(am4.w1.sfc.pcp.sea(k,:,:));  s.s4='AM4FN';
x9 =squeeze(am4.v9.sfc.pcp.sea(k,:,:));  s.s5='AM4EIS';
x10=squeeze(am4.w9.sfc.pcp.sea(k,:,:));  s.s5='AM4EIS';
z1=x2-x1; z2=x4-x3; z3=x6-x5; z4=x8-x7; z5=x10-x9; 
a=mean(mean(z1.*a0)); s.s1=sprintf('%s (MEAN=%5.2f)',s.s1,a);
a=mean(mean(z2.*a0)); s.s2=sprintf('%s (MEAN=%5.2f)',s.s2,a);
a=mean(mean(z3.*a0)); s.s3=sprintf('%s (MEAN=%5.2f)',s.s3,a);
a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s4,a);
%z4=x1; a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s5,a);
cmin=-3; cmax=3; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='cess'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=s.aa; z=am4.v0; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetrad_map'; k=1;
x1=squeeze(am4a.v0.toa.netrad.sea(k,:,:)); s.s1='AM4.0';
x2=squeeze(am4a.w0.toa.netrad.sea(k,:,:)); s.s1='AM4.0';
x3=squeeze(am3.v0.toa.netrad.sea(k,:,:));  s.s2='AM3';
x4=squeeze(am3.w0.toa.netrad.sea(k,:,:));  s.s2='AM3';
x5=squeeze(am2.v0.toa.netrad.sea(k,:,:));  s.s3='AM2';
x6=squeeze(am2.w0.toa.netrad.sea(k,:,:));  s.s3='AM2';
x7=squeeze(am4.v1.toa.netrad.sea(k,:,:));  s.s4='AM4FN';
x8=squeeze(am4.w1.toa.netrad.sea(k,:,:));  s.s4='AM4FN';
x9 =squeeze(am4.v9.toa.netrad.sea(k,:,:));  s.s5='AM4EIS';
x10=squeeze(am4.w9.toa.netrad.sea(k,:,:));  s.s5='AM4EIS';
z1=x2-x1; z2=x4-x3; z3=x6-x5; z4=x8-x7; z5=x10-x9; 
a=mean(mean(z1.*a0)); s.s1=sprintf('%s (MEAN=%5.2f)',s.s1,a);
a=mean(mean(z2.*a0)); s.s2=sprintf('%s (MEAN=%5.2f)',s.s2,a);
a=mean(mean(z3.*a0)); s.s3=sprintf('%s (MEAN=%5.2f)',s.s3,a);
a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s4,a);
%z4=z1-z5; a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s5,a);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='cess'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=s.aa; z=am4.v0; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetrad_clr_map'; k=1;
x1=squeeze(am4a.v0.toa.netrad_clr.sea(k,:,:)); s.s1='AM4.0';
x2=squeeze(am4a.w0.toa.netrad_clr.sea(k,:,:)); s.s1='AM4.0';
x3=squeeze(am3.v0.toa.netrad_clr.sea(k,:,:));  s.s2='AM3';
x4=squeeze(am3.w0.toa.netrad_clr.sea(k,:,:));  s.s2='AM3';
x5=squeeze(am2.v0.toa.netrad_clr.sea(k,:,:));  s.s3='AM2';
x6=squeeze(am2.w0.toa.netrad_clr.sea(k,:,:));  s.s3='AM2';
x7=squeeze(am4.v1.toa.netrad_clr.sea(k,:,:));  s.s4='AM4FN';
x8=squeeze(am4.w1.toa.netrad_clr.sea(k,:,:));  s.s4='AM4FN';
x9 =squeeze(am4.v9.toa.netrad_clr.sea(k,:,:));  s.s5='AM4EIS';
x10=squeeze(am4.w9.toa.netrad_clr.sea(k,:,:));  s.s5='AM4EIS';
z1=x2-x1; z2=x4-x3; z3=x6-x5; z4=x8-x7; z5=x10-x9; 
a=mean(mean(z1.*a0)); s.s1=sprintf('%s (MEAN=%5.2f)',s.s1,a);
a=mean(mean(z2.*a0)); s.s2=sprintf('%s (MEAN=%5.2f)',s.s2,a);
a=mean(mean(z3.*a0)); s.s3=sprintf('%s (MEAN=%5.2f)',s.s3,a);
a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s4,a);
%z4=z1-z5; a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s5,a);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='cess'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=s.aa; z=am4.v0; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dttcf_map'; k=1;
x1=squeeze(am4a.v0.toa.ttcf.sea(k,:,:)); s.s1='AM4.0';
x2=squeeze(am4a.w0.toa.ttcf.sea(k,:,:)); s.s1='AM4.0';
x3=squeeze(am3.v0.toa.ttcf.sea(k,:,:));  s.s2='AM3';
x4=squeeze(am3.w0.toa.ttcf.sea(k,:,:));  s.s2='AM3';
x5=squeeze(am2.v0.toa.ttcf.sea(k,:,:));  s.s3='AM2';
x6=squeeze(am2.w0.toa.ttcf.sea(k,:,:));  s.s3='AM2';
x7=squeeze(am4.v1.toa.ttcf.sea(k,:,:));  s.s4='AM4FN';
x8=squeeze(am4.w1.toa.ttcf.sea(k,:,:));  s.s4='AM4FN';
x9 =squeeze(am4.v9.toa.ttcf.sea(k,:,:)); s.s5='AM4EIS';
x10=squeeze(am4.w9.toa.ttcf.sea(k,:,:)); s.s5='AM4EIS';
z1=x2-x1; z2=x4-x3; z3=x6-x5; z4=x8-x7; z5=x10-x9; 
a=mean(mean(z1.*a0)); s.s1=sprintf('%s (MEAN=%5.2f)',s.s1,a);
a=mean(mean(z2.*a0)); s.s2=sprintf('%s (MEAN=%5.2f)',s.s2,a);
a=mean(mean(z3.*a0)); s.s3=sprintf('%s (MEAN=%5.2f)',s.s3,a);
a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s4,a);
%z4=z4-z1; a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s5,a);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='cess'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=s.aa; z=am4.v0; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dswcf_map'; k=1;
x1=squeeze(am4a.v0.toa.swcf.sea(k,:,:)); s.s1='AM4.0';
x2=squeeze(am4a.w0.toa.swcf.sea(k,:,:)); s.s1='AM4.0';
x3=squeeze(am3.v0.toa.swcf.sea(k,:,:));  s.s2='AM3';
x4=squeeze(am3.w0.toa.swcf.sea(k,:,:));  s.s2='AM3';
x5=squeeze(am2.v0.toa.swcf.sea(k,:,:));  s.s3='AM2';
x6=squeeze(am2.w0.toa.swcf.sea(k,:,:));  s.s3='AM2';
x7=squeeze(am4.v1.toa.swcf.sea(k,:,:));  s.s4='AM4FN';
x8=squeeze(am4.w1.toa.swcf.sea(k,:,:));  s.s4='AM4FN';
x9 =squeeze(am4.v9.toa.swcf.sea(k,:,:)); s.s5='AM4EIS';
x10=squeeze(am4.w9.toa.swcf.sea(k,:,:)); s.s5='AM4EIS';
z1=x2-x1; z2=x4-x3; z3=x6-x5; z4=x8-x7; z5=x10-x9; 
a=mean(mean(z1.*a0)); s.s1=sprintf('%s (MEAN=%5.2f)',s.s1,a);
a=mean(mean(z2.*a0)); s.s2=sprintf('%s (MEAN=%5.2f)',s.s2,a);
a=mean(mean(z3.*a0)); s.s3=sprintf('%s (MEAN=%5.2f)',s.s3,a);
a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s4,a);
%z4=z4-z1; a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s5,a);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='cess'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=s.aa; z=am4.v0; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dlwcf_map'; k=1;
x1=squeeze(am4a.v0.toa.lwcf.sea(k,:,:)); s.s1='AM4.0';
x2=squeeze(am4a.w0.toa.lwcf.sea(k,:,:)); s.s1='AM4.0';
x3=squeeze(am3.v0.toa.lwcf.sea(k,:,:));  s.s2='AM3';
x4=squeeze(am3.w0.toa.lwcf.sea(k,:,:));  s.s2='AM3';
x5=squeeze(am2.v0.toa.lwcf.sea(k,:,:));  s.s3='AM2';
x6=squeeze(am2.w0.toa.lwcf.sea(k,:,:));  s.s3='AM2';
x7=squeeze(am4.v1.toa.lwcf.sea(k,:,:));  s.s4='AM4FN';
x8=squeeze(am4.w1.toa.lwcf.sea(k,:,:));  s.s4='AM4FN';
x9 =squeeze(am4.v9.toa.lwcf.sea(k,:,:)); s.s5='AM4EIS';
x10=squeeze(am4.w9.toa.lwcf.sea(k,:,:)); s.s5='AM4EIS';
z1=x2-x1; z2=x4-x3; z3=x6-x5; z4=x8-x7; z5=x10-x9; 
a=mean(mean(z1.*a0)); s.s1=sprintf('%s (MEAN=%5.2f)',s.s1,a);
a=mean(mean(z2.*a0)); s.s2=sprintf('%s (MEAN=%5.2f)',s.s2,a);
a=mean(mean(z3.*a0)); s.s3=sprintf('%s (MEAN=%5.2f)',s.s3,a);
a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s4,a);
%z4=z4-z1; a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s5,a);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='cess'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=s.aa; z=am4.v0; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dlwp_map'; k=1; a=1000.
x1=squeeze(am4a.v0.atm.lwp.sea(k,:,:))*a; s.s1='AM4.0';
x2=squeeze(am4a.w0.atm.lwp.sea(k,:,:))*a; s.s1='AM4.0';
x3=squeeze(am3.v0.atm.lwp.sea(k,:,:))*a;  s.s2='AM3';
x4=squeeze(am3.w0.atm.lwp.sea(k,:,:))*a;  s.s2='AM3';
x5=squeeze(am2.v0.atm.lwp.sea(k,:,:))*a;  s.s3='AM2';
x6=squeeze(am2.w0.atm.lwp.sea(k,:,:))*a;  s.s3='AM2';
x7=squeeze(am4.v1.atm.lwp.sea(k,:,:))*a;  s.s4='AM4FN';
x8=squeeze(am4.w1.atm.lwp.sea(k,:,:))*a;  s.s4='AM4FN';
x9 =squeeze(am4.v9.atm.lwp.sea(k,:,:))*a; s.s5='AM4EIS';
x10=squeeze(am4.w9.atm.lwp.sea(k,:,:))*a; s.s5='AM4EIS';
z1=x2-x1; z2=x4-x3; z3=x6-x5; z4=x8-x7; z5=x10-x9; 
a=mean(mean(z1.*a0)); s.s1=sprintf('%s (MEAN=%5.2f)',s.s1,a);
a=mean(mean(z2.*a0)); s.s2=sprintf('%s (MEAN=%5.2f)',s.s2,a);
a=mean(mean(z3.*a0)); s.s3=sprintf('%s (MEAN=%5.2f)',s.s3,a);
a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s4,a);
%z4=x1; a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s5,a);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='cess'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=s.aa; z=am4.v0; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='diwp_map'; k=1; a=1000.
x1=squeeze(am4a.v0.atm.iwp.sea(k,:,:))*a; s.s1='AM4.0';
x2=squeeze(am4a.w0.atm.iwp.sea(k,:,:))*a; s.s1='AM4.0';
x3=squeeze(am3.v0.atm.iwp.sea(k,:,:))*a;  s.s2='AM3';
x4=squeeze(am3.w0.atm.iwp.sea(k,:,:))*a;  s.s2='AM3';
x5=squeeze(am2.v0.atm.iwp.sea(k,:,:))*a;  s.s3='AM2';
x6=squeeze(am2.w0.atm.iwp.sea(k,:,:))*a;  s.s3='AM2';
x7=squeeze(am4.v1.atm.iwp.sea(k,:,:))*a;  s.s4='AM4FN';
x8=squeeze(am4.w1.atm.iwp.sea(k,:,:))*a;  s.s4='AM4FN';
x9 =squeeze(am4.v9.atm.iwp.sea(k,:,:))*a; s.s5='AM4EIS';
x10=squeeze(am4.w9.atm.iwp.sea(k,:,:))*a; s.s5='AM4EIS';
z1=x2-x1; z2=x4-x3; z3=x6-x5; z4=x8-x7; z5=x10-x9; 
a=mean(mean(z1.*a0)); s.s1=sprintf('%s (MEAN=%5.2f)',s.s1,a);
a=mean(mean(z2.*a0)); s.s2=sprintf('%s (MEAN=%5.2f)',s.s2,a);
a=mean(mean(z3.*a0)); s.s3=sprintf('%s (MEAN=%5.2f)',s.s3,a);
a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s4,a);
%z4=x1; a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s5,a);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='cess'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=s.aa; z=am4.v0; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dwvp_map'; k=1; a=1.;
x1=squeeze(am4a.v0.atm.wvp.sea(k,:,:))*a; s.s1='AM4.0';
x2=squeeze(am4a.w0.atm.wvp.sea(k,:,:))*a; s.s1='AM4.0';
x3=squeeze(am3.v0.atm.wvp.sea(k,:,:))*a;  s.s2='AM3';
x4=squeeze(am3.w0.atm.wvp.sea(k,:,:))*a;  s.s2='AM3';
x5=squeeze(am2.v0.atm.wvp.sea(k,:,:))*a;  s.s3='AM2';
x6=squeeze(am2.w0.atm.wvp.sea(k,:,:))*a;  s.s3='AM2';
x7=squeeze(am4.v1.atm.wvp.sea(k,:,:))*a;  s.s4='AM4FN';
x8=squeeze(am4.w1.atm.wvp.sea(k,:,:))*a;  s.s4='AM4FN';
x9 =squeeze(am4.v9.atm.wvp.sea(k,:,:))*a; s.s5='AM4EIS';
x10=squeeze(am4.w9.atm.wvp.sea(k,:,:))*a; s.s5='AM4EIS';
z1=x2-x1; z2=x4-x3; z3=x6-x5; z4=x8-x7; z5=x10-x9; 
a=mean(mean(z1.*a0)); s.s1=sprintf('%s (MEAN=%5.2f)',s.s1,a);
a=mean(mean(z2.*a0)); s.s2=sprintf('%s (MEAN=%5.2f)',s.s2,a);
a=mean(mean(z3.*a0)); s.s3=sprintf('%s (MEAN=%5.2f)',s.s3,a);
a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s4,a);
%z4=x1-x3; a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s5,a);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='cess'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=s.aa; z=am4.v0; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dqal_map'; k=1; a=1.;
x1=squeeze(am4a.v0.atm.qal.sea(k,:,:))*a; s.s1='AM4.0';
x2=squeeze(am4a.w0.atm.qal.sea(k,:,:))*a; s.s1='AM4.0';
x3=squeeze(am3.v0.atm.qal.sea(k,:,:))*a;  s.s2='AM3';
x4=squeeze(am3.w0.atm.qal.sea(k,:,:))*a;  s.s2='AM3';
x5=squeeze(am2.v0.atm.qal.sea(k,:,:))*a;  s.s3='AM2';
x6=squeeze(am2.w0.atm.qal.sea(k,:,:))*a;  s.s3='AM2';
x7=squeeze(am4.v1.atm.qal.sea(k,:,:))*a;  s.s4='AM4FN';
x8=squeeze(am4.w1.atm.qal.sea(k,:,:))*a;  s.s4='AM4FN';
x9 =squeeze(am4.v9.atm.qal.sea(k,:,:))*a; s.s5='AM4EIS';
x10=squeeze(am4.w9.atm.qal.sea(k,:,:))*a; s.s5='AM4EIS';
z1=x2-x1; z2=x4-x3; z3=x6-x5; z4=x8-x7; z5=x10-x9; 
a=mean(mean(z1.*a0)); s.s1=sprintf('%s (MEAN=%5.2f)',s.s1,a);
a=mean(mean(z2.*a0)); s.s2=sprintf('%s (MEAN=%5.2f)',s.s2,a);
a=mean(mean(z3.*a0)); s.s3=sprintf('%s (MEAN=%5.2f)',s.s3,a);
a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s4,a);
%z4=x1; a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s5,a);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='cess'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=s.aa; z=am4.v0; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dqam_map'; k=1; a=1.;
x1=squeeze(am4a.v0.atm.qam.sea(k,:,:))*a; s.s1='AM4.0';
x2=squeeze(am4a.w0.atm.qam.sea(k,:,:))*a; s.s1='AM4.0';
x3=squeeze(am3.v0.atm.qam.sea(k,:,:))*a;  s.s2='AM3';
x4=squeeze(am3.w0.atm.qam.sea(k,:,:))*a;  s.s2='AM3';
x5=squeeze(am2.v0.atm.qam.sea(k,:,:))*a;  s.s3='AM2';
x6=squeeze(am2.w0.atm.qam.sea(k,:,:))*a;  s.s3='AM2';
x7=squeeze(am4.v1.atm.qam.sea(k,:,:))*a;  s.s4='AM4FN';
x8=squeeze(am4.w1.atm.qam.sea(k,:,:))*a;  s.s4='AM4FN';
x9 =squeeze(am4.v9.atm.qam.sea(k,:,:))*a; s.s5='AM4EIS';
x10=squeeze(am4.w9.atm.qam.sea(k,:,:))*a; s.s5='AM4EIS';
z1=x2-x1; z2=x4-x3; z3=x6-x5; z4=x8-x7; z5=x10-x9; 
a=mean(mean(z1.*a0)); s.s1=sprintf('%s (MEAN=%5.2f)',s.s1,a);
a=mean(mean(z2.*a0)); s.s2=sprintf('%s (MEAN=%5.2f)',s.s2,a);
a=mean(mean(z3.*a0)); s.s3=sprintf('%s (MEAN=%5.2f)',s.s3,a);
a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s4,a);
%z4=x1; a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s5,a);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='cess'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=am4.v0.s; a0=s.aa; z=am4.v0; s.latx=z.lat; s.lonx=z.lon; s.lmx=z.lm0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dqah_map'; k=1; a=1.;
x1=squeeze(am4a.v0.atm.qah.sea(k,:,:))*a; s.s1='AM4.0';
x2=squeeze(am4a.w0.atm.qah.sea(k,:,:))*a; s.s1='AM4.0';
x3=squeeze(am3.v0.atm.qah.sea(k,:,:))*a;  s.s2='AM3';
x4=squeeze(am3.w0.atm.qah.sea(k,:,:))*a;  s.s2='AM3';
x5=squeeze(am2.v0.atm.qah.sea(k,:,:))*a;  s.s3='AM2';
x6=squeeze(am2.w0.atm.qah.sea(k,:,:))*a;  s.s3='AM2';
x7=squeeze(am4.v1.atm.qah.sea(k,:,:))*a;  s.s4='AM4FN';
x8=squeeze(am4.w1.atm.qah.sea(k,:,:))*a;  s.s4='AM4FN';
x9 =squeeze(am4.v9.atm.qah.sea(k,:,:))*a; s.s5='AM4EIS';
x10=squeeze(am4.w9.atm.qah.sea(k,:,:))*a; s.s5='AM4EIS';
z1=x2-x1; z2=x4-x3; z3=x6-x5; z4=x8-x7; z5=x10-x9; 
a=mean(mean(z1.*a0)); s.s1=sprintf('%s (MEAN=%5.2f)',s.s1,a);
a=mean(mean(z2.*a0)); s.s2=sprintf('%s (MEAN=%5.2f)',s.s2,a);
a=mean(mean(z3.*a0)); s.s3=sprintf('%s (MEAN=%5.2f)',s.s3,a);
a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s4,a);
%z4=x1; a=mean(mean(z4.*a0)); s.s4=sprintf('%s (MEAN=%5.2f)',s.s5,a);
cmin=-10; cmax=10; vbin=[cmin:(cmax-cmin)/20:cmax];
fpath='./fig_am4/'; expn='cess'; f=1; ncolor=64
plot_4panel_am4(s,z1,z2,z3,z4,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmt'; ss={'ANN','MAM','JJA','SON','DJF'};
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4a.v0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=am4a.v0;[z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv);
v=am4a.w0;[z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv); 
v=am3.v0; [z3 b3 rms3]=vslice(v,s,k,varn,'mod',mv);
v=am3.w0; [z4 b4 rms4]=vslice(v,s,k,varn,'mod',mv); 
v=am2.v0; [z5 b5 rms5]=vslice(v,s,k,varn,'mod',mv);
v=am2.w0; [z6 b6 rms6]=vslice(v,s,k,varn,'mod',mv); 
v=am4.v1; [z7 b7 rms7]=vslice(v,s,k,varn,'mod',mv);
v=am4.w1; [z8 b8 rms8]=vslice(v,s,k,varn,'mod',mv); 
v=am4.v9; [z9 b9 rms9]=vslice(v,s,k,varn,'mod',mv);
v=am4.w9; [z10 b10 rms10]=vslice(v,s,k,varn,'mod',mv); 
id=isnan(z1); zo(id)=NaN;
zz1=z2-z1; zz2=z4-z3; zz3=z6-z5; zz4=z8-z7; zz5=z10-z9;
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-2; cmax=5; vbin=[cmin:0.2:cmax];
subplot(row,col,1); 
[C,h]=contourf(lat,pf,zz1,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(a) AM4',rms1);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
[C,h]=contourf(lat,pf,zz2,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(b) AM3',rms2);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,3); 
[C,h]=contourf(lat,pf,zz3,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(c) AM2.1',rms1);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lat,pf,zz4,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(d) AM4FN',rms2);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='cess'; vname=strcat(varn,(ss{k}));
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmrh'; ss={'ANN','MAM','JJA','SON','DJF'};
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4a.v0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=am4a.v0;[z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv);
v=am4a.w0;[z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv); 
v=am3.v0; [z3 b3 rms3]=vslice(v,s,k,varn,'mod',mv);
v=am3.w0; [z4 b4 rms4]=vslice(v,s,k,varn,'mod',mv); 
v=am2.v0; [z5 b5 rms5]=vslice(v,s,k,varn,'mod',mv);
v=am2.w0; [z6 b6 rms6]=vslice(v,s,k,varn,'mod',mv); 
v=am4.v1; [z7 b7 rms7]=vslice(v,s,k,varn,'mod',mv);
v=am4.w1; [z8 b8 rms8]=vslice(v,s,k,varn,'mod',mv); 
v=am4.v9; [z9 b9 rms9]=vslice(v,s,k,varn,'mod',mv);
v=am4.w9; [z10 b10 rms10]=vslice(v,s,k,varn,'mod',mv); 
zz1=z2-z1; zz2=z4-z3; zz3=z6-z5; zz4=z8-z7; zz5=z10-z9;
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-5; cmax=5; vbin=[cmin:1:cmax];
subplot(row,col,1); 
[C,h]=contourf(lat,pf,zz1,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(a) AM4');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
[C,h]=contourf(lat,pf,zz2,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(b) AM3');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,3); 
[C,h]=contourf(lat,pf,zz3,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(c) AM2.1');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lat,pf,zz4,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(d) AM4FN');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='cess'; vname=strcat(varn,(ss{k}));
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmw'; ss={'ANN','MAM','JJA','SON','DJF'};
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4a.v0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=am4a.v0;[z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv);
v=am4a.w0;[z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv); 
v=am3.v0; [z3 b3 rms3]=vslice(v,s,k,varn,'mod',mv);
v=am3.w0; [z4 b4 rms4]=vslice(v,s,k,varn,'mod',mv); 
v=am2.v0; [z5 b5 rms5]=vslice(v,s,k,varn,'mod',mv);
v=am2.w0; [z6 b6 rms6]=vslice(v,s,k,varn,'mod',mv); 
v=am4.v1; [z7 b7 rms7]=vslice(v,s,k,varn,'mod',mv);
v=am4.w1; [z8 b8 rms8]=vslice(v,s,k,varn,'mod',mv); 
v=am4.v9; [z9  b9  rms9] =vslice(v,s,k,varn,'mod',mv);
v=am4.w9; [z10 b10 rms10]=vslice(v,s,k,varn,'mod',mv); 
zz1=z2-z1; zz2=z4-z3; zz3=z6-z5; zz4=z8-z7; zz5=z10-z9;
pms=[ 0, 0, 1200, 600]; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
row=2; col=2; cmin=-5; cmax=5; vbin=[cmin:1:cmax];
subplot(row,col,1); 
[C,h]=contourf(lat,pf,zz1,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(a) AM4');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,2); 
[C,h]=contourf(lat,pf,zz2,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(b) AM3');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,3); 
[C,h]=contourf(lat,pf,zz3,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(c) AM2.1');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot(row,col,4); 
[C,h]=contourf(lat,pf,zz4,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(d) AM4FN');
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; expn='cess'; vname=strcat(varn,(ss{k}));
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


k=1; varn='zmt'; ss={'ANN','MAM','JJA','SON','DJF'};
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4a.v0.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=am4a.v0;[z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv);
v=am4a.w0;[z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv);
id=isnan(z1); zo(id)=NaN;
zz1=z2-z1;

cmin=-6; cmax=6; vbin=[cmin:(cmax-cmin)/100:cmax];
fpath='./fig_am4/'; expn='cess'; f=1; ncolor=64
plot_4panel_am4(s,zz1,zz1,zz1,zz1,vbin,cmin,cmax,vname,fpath,expn,f,k,ncolor);


mypath='/work/miz/mat_climsen/';  yr1=1981; yr2=1990; %region='global';
fext=strcat('_',num2str(yr1),'-',num2str(yr2),'.climsen_',region,'.mat');
expn ='c48l24_am2p14_C0';               load(strcat(mypath,expn,fext)); v0=v;%AM2L24orignal
expn ='c48l24_am2p14_C0_p2K';           load(strcat(mypath,expn,fext)); w0=v;

expn ='c48l24_am2p14_climo_oldrun1';    load(strcat(mypath,expn,fext)); v0a=v;%AM2L24orignal
expn ='c48l24_am2p14_climo_oldrun1_p2K';load(strcat(mypath,expn,fext)); w0a=v;
expn ='c48l24_am2p14_climo_oldrun2';    load(strcat(mypath,expn,fext)); v0b=v;%AM2L24orignal
expn ='c48l24_am2p14_climo_oldrun2_p2K';load(strcat(mypath,expn,fext)); w0b=v;
expn ='c48l24_am2p14_climo_oldrun3';    load(strcat(mypath,expn,fext)); v0c=v;%AM2L24orignal
expn ='c48l24_am2p14_climo_oldrun3_p2K';load(strcat(mypath,expn,fext)); w0c=v;
