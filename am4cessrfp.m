%below opt=1 for writing mat file to /work/miz
%below opt=2 for writing mat file to /archive
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
latlon=[0 360 -90 90];region='global'; mod='c96';myr=5; opt=2;
%latlon=[0 360  30 90];region='nhextr';mod='c96';myr=5; opt=2; 
%latlon=[0 360 -30 30];region='tropic';mod='c96';myr=5; opt=2; 
%latlon=[150 250 -5 5]; region='equpac'; nyr=5; myr=1; opt=0;
%read in or generate observation data
%o=readobs(latlon,region,'c48');
fn=strcat('/work/miz/mat_cm4/obs_',region,'_to_c48.mat'); load(fn);
tpath='/archive/Ming.Zhao/awg/warsaw/'; myr=5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
expn='c96L33_am4p0_2010climo_fixedN0'; yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_2010climo_fixedN0_p2K'; yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_2010climo_fixedN1'; yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_2010climo_fixedN1_p2K'; yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       

expn='c96L33_am4p0_2010climo_fixedN4'; yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_2010climo_fixedN4_p2K'; yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_2010climo_eis0'; yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_2010climo_eis0_p2K'; yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%test zone
vname='dnetrad_lat'; expn='AM4p0_rfp_cess'; 
yl='changes in TOA net radiation (W/m2)'; climo=0;
y1=am4.v0.toa.netrad.txavg0;  s1='2010RAD';
y2=am4.w0.toa.netrad.txavg0;  s2='1860RAD';
y3=am4fn0.v0.toa.netrad.txavg0;  s3='2010AERO';
y4=am4fn0.w0.toa.netrad.txavg0;  s4='P2K';
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='c96L33_am4p0_1850rad_novol_m0'; yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_1850rad_novol_m1'; yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_1850rad_novol_m2'; yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_onlyaero_m0'; yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_onlyaero_m1'; yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_onlyaero_m2'; yr1='1980';yr2='2014';syr=1;nyr=35;mod='c96'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/AM2.1/'; myr=5;
expn='AM2p1_1990climo_cntl'; yr1='1991';yr2='2000';syr=1;nyr=10;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_1990climo_cntl_p2K'; yr1='1991';yr2='2000';syr=1;nyr=10;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_1990climo_cntl_2xCO2'; yr1='1991';yr2='2000';syr=1;nyr=10;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_1990climo_1860rad'; yr1='1991';yr2='2000';syr=1;nyr=10;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_1990climo_1990GHG'; yr1='1991';yr2='2000';syr=1;nyr=10;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_1990climo_1990aero'; yr1='1991';yr2='2000';syr=1;nyr=10;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw/'; myr=5;
expn='c96L33_am4p0_1990climo_no10um'; yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_1990climo_no10um_2xCO2'; yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_1850climo_1990ozone'; yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       

expn='c96L33_am4p0_1990GHG_1850ozone'; yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_1990GHG_1850ozone_no10um'; yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       


expn='c96L33_am4p0_2010climo'; yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_2010climo_p2K'; yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_2010climo_2xCO2'; yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_1850climo'; yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_2010aero';  yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_2010GHG';  yr1='0002';yr2='0031';syr=1;nyr=30;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_2000GHG';  yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='c96L33_am4p0_1990climo';  yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_1990climo_p2K';  yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_1990climo_2xCO2';  yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_1850climo';  yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_1990GHG';  yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_am4p0_1990aero';  yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw/'; myr=5;
expn='c96L33_aref1_1990climo';  yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_aref1_1990climo_p2K';  yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_aref1_1990climo_2xCO2';  yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_aref1_1990climo_1850rad';  yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_aref1_1990climo_1990GHG';  yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c96L33_aref1_1990climo_1990aero';  yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='c48L48_am3p10_clim'; yr1='1981';yr2='1990';syr=1;nyr=10;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p10_clim_p2k'; yr1='1981';yr2='1990';syr=1;nyr=10;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p10_clim_pi'; yr1='1981';yr2='1990';syr=1;nyr=10;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p10_clim_pi_aero'; yr1='1981';yr2='1990';syr=1;nyr=10;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p10_clim_pi_GHG'; yr1='1981';yr2='1990';syr=1;nyr=10;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='c48L48_am3p9_clim_R';yr1='1981';yr2='1990';syr=1;nyr=10;mod='c45'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c48L48_am3p9_clim_R_p2K';yr1='1981';yr2='1990';syr=1;nyr=10;mod='c45'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='m45_am2p14_1990'; yr1='1983';yr2='1998';syr=1;nyr=15;mod='c96'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='m45_am2p14_1990_2K'; yr1='1983';yr2='1998';syr=1;nyr=15;mod='c96'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='m45_am2p14_1990_CLIM_2xCO2'; yr1='1983';yr2='1998';syr=1;nyr=15;mod='c96'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='m45_am2p14_1990_CLIM_1xCO2'; yr1='1983';yr2='1998';syr=1;nyr=15;mod='c96'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='m45_am2p14_1990_CLIM_4xCO2'; yr1='1983';yr2='1998';syr=1;nyr=15;mod='c96'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48l24_am2p14_C0';yr1='1981';yr2='1990';syr=1;nyr=10;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c48l24_am2p14_C0_p2K';yr1='1981';yr2='1990';syr=1;nyr=10;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_cm4/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat'); 
tpath='/archive/Ming.Zhao/awg/verona/';
expn='c96L32_am4g11r8_2010climo_aref0';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);aref0.v0=v;
expn='c96L32_am4g11r8_2010climo_aref0_p2K';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);aref0.w0=v;
expn='c96L32_am4g11r8_2010climo_aref0_2xCO2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);aref0.g0=v;
expn='c48l24_am2p14_C0';                      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am21.v0=v;
expn='c48l24_am2p14_C0_p2K';                  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am21.w0=v;
expn='c48L48_am3p9_clim_R';                   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v0=v;
expn='c48L48_am3p9_clim_R_p2K';               fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.w0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_cm4/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat');
tpath='/archive/Ming.Zhao/awg/warsaw/';
expn='c96L33_am4p0_2010climo';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v0=v;
expn='c96L33_am4p0_2010climo_swrad2h'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v1=v;
expn='c96L33_am4p0_2010climo_swrad3h'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v2=v;
mean(am4.v0.toa.ttcf.ann_stat.mmen.all)
mean(am4.v1.toa.ttcf.ann_stat.mmen.all)
mean(am4.v2.toa.ttcf.ann_stat.mmen.all)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_cm4/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat');
tpath='/archive/Ming.Zhao/awg/warsaw/';
expn='c96L33_am4p0_2010climo';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v0=v;
expn='c96L33_am4p0_2010climo_p2K';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w0=v;
expn='c96L33_am4p0_2010climo_2xCO2';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.x0=v;
expn='c96L33_am4p0_1850climo';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c0=v;
expn='c96L33_am4p0_2010GHG';        fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.g0=v;
expn='c96L33_am4p0_2010aero';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.a0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qn_map'; s=am4.v0.s; a=1000000; k=1;
v=am4.v0; plev=[1000 925 850 775 700 600 500 400 300 250 200];
i=1; cd(i).t=squeeze(mean(v.atm.t1000.sea(k,:,:),1));
i=2; cd(i).t=squeeze(mean(v.atm.t925.sea(k,:,:),1));
i=3; cd(i).t=squeeze(mean(v.atm.t850.sea(k,:,:),1));
i=4; cd(i).t=squeeze(mean(v.atm.t775.sea(k,:,:),1));
i=5; cd(i).t=squeeze(mean(v.atm.t700.sea(k,:,:),1));
i=6; cd(i).t=squeeze(mean(v.atm.t600.sea(k,:,:),1));
i=7; cd(i).t=squeeze(mean(v.atm.t500.sea(k,:,:),1));
i=8; cd(i).t=squeeze(mean(v.atm.t400.sea(k,:,:),1));
i=9; cd(i).t=squeeze(mean(v.atm.t300.sea(k,:,:),1));
i=10;cd(i).t=squeeze(mean(v.atm.t250.sea(k,:,:),1));
i=11;cd(i).t=squeeze(mean(v.atm.t200.sea(k,:,:),1));
i=1; cd(i).qn=squeeze(mean(v.atm.qn1000.sea(k,:,:),1))/a;
i=2; cd(i).qn=squeeze(mean(v.atm.qn925.sea(k,:,:),1))/a;
i=3; cd(i).qn=squeeze(mean(v.atm.qn850.sea(k,:,:),1))/a;
i=4; cd(i).qn=squeeze(mean(v.atm.qn775.sea(k,:,:),1))/a;
i=5; cd(i).qn=squeeze(mean(v.atm.qn700.sea(k,:,:),1))/a;
i=6; cd(i).qn=squeeze(mean(v.atm.qn600.sea(k,:,:),1))/a;
i=7; cd(i).qn=squeeze(mean(v.atm.qn500.sea(k,:,:),1))/a;
i=8; cd(i).qn=squeeze(mean(v.atm.qn400.sea(k,:,:),1))/a;
i=9; cd(i).qn=squeeze(mean(v.atm.qn300.sea(k,:,:),1))/a;
i=10;cd(i).qn=squeeze(mean(v.atm.qn250.sea(k,:,:),1))/a;
i=11;cd(i).qn=squeeze(mean(v.atm.qn200.sea(k,:,:),1))/a;
i=1; cd(i).nn=squeeze(mean(v.atm.nn1000.sea(k,:,:),1));
i=2; cd(i).nn=squeeze(mean(v.atm.nn925.sea(k,:,:),1));
i=3; cd(i).nn=squeeze(mean(v.atm.nn850.sea(k,:,:),1));
i=4; cd(i).nn=squeeze(mean(v.atm.nn775.sea(k,:,:),1));
i=5; cd(i).nn=squeeze(mean(v.atm.nn700.sea(k,:,:),1));
i=6; cd(i).nn=squeeze(mean(v.atm.nn600.sea(k,:,:),1));
i=7; cd(i).nn=squeeze(mean(v.atm.nn500.sea(k,:,:),1));
i=8; cd(i).nn=squeeze(mean(v.atm.nn400.sea(k,:,:),1));
i=9; cd(i).nn=squeeze(mean(v.atm.nn300.sea(k,:,:),1));
i=10;cd(i).nn=squeeze(mean(v.atm.nn250.sea(k,:,:),1));
i=11;cd(i).nn=squeeze(mean(v.atm.nn200.sea(k,:,:),1));
i=1; cd(i).al=squeeze(mean(v.atm.al1000.sea(k,:,:),1));
i=2; cd(i).al=squeeze(mean(v.atm.al925.sea(k,:,:),1));
i=3; cd(i).al=squeeze(mean(v.atm.al850.sea(k,:,:),1));
i=4; cd(i).al=squeeze(mean(v.atm.al775.sea(k,:,:),1));
i=5; cd(i).al=squeeze(mean(v.atm.al700.sea(k,:,:),1));
i=6; cd(i).al=squeeze(mean(v.atm.al600.sea(k,:,:),1));
i=7; cd(i).al=squeeze(mean(v.atm.al500.sea(k,:,:),1));
i=8; cd(i).al=squeeze(mean(v.atm.al400.sea(k,:,:),1));
i=9; cd(i).al=squeeze(mean(v.atm.al300.sea(k,:,:),1));
i=10;cd(i).al=squeeze(mean(v.atm.al250.sea(k,:,:),1));
i=11;cd(i).al=squeeze(mean(v.atm.al200.sea(k,:,:),1));
a=0.0;
for k=1:11
  x=cd(k).t; id=(x<a);
  cd(k).ro=100.*plev(k)./(cd(k).t*287); cd(k).ro(id)=NaN;
  cd(k).cn=cd(k).qn.*cd(k).ro;
  x=cd(k).al; id=(x<a);
  cd(k).cn1=cd(k).cn./x; cd(k).cn1(id)=NaN; 
  cd(k).cn2=cd(k).nn./x; cd(k).cn2(id)=NaN; 
end
k2=2; x2=cd(k2).al;
k3=3; x3=cd(k3).al;
pl =(cd(k2).pl .*x2+cd(k3).pl .*x3)./(x2+x3);
ro =(cd(k2).ro .*x2+cd(k3).ro .*x3)./(x2+x3);
al =(cd(k2).al .*x2+cd(k3).al .*x3)./(x2+x3);
qn =(cd(k2).qn .*x2+cd(k3).qn .*x3)./(x2+x3);
nn =(cd(k2).nn .*x2+cd(k3).nn .*x3)./(x2+x3);
cn1=(cd(k2).cn1.*x2+cd(k3).cn1.*x3)./(x2+x3);
cn2=(cd(k2).cn2.*x2+cd(k3).cn2.*x3)./(x2+x3);
nlev=11;
for j=1:length(v.s.lat)
  for i=1:length(v.s.lon)
    pl(j,i) =0; ro(j,i) =0; al(j,i) =0;
    qn(j,i) =0; nn(j,i) =0; cn1(j,i)=0; cn2(j,i)=0;
    sumw=0;
    for k=2:3
        w=cd(k).al(j,i);
	if (w < 0)
	  w=0;
	end
	pl(j,i) =pl(j,i) +cd(k).pl (j,i)*w;
	ro(j,i) =ro(j,i) +cd(k).ro (j,i)*w;
	al(j,i) =al(j,i) +cd(k).al (j,i)*w;
	qn(j,i) =qn(j,i) +cd(k).qn (j,i)*w;
	nn(j,i) =nn(j,i) +cd(k).nn (j,i)*w;
	cn1(j,i)=cn1(j,i)+cd(k).cn1(j,i)*w;
	cn2(j,i)=cn2(j,i)+cd(k).cn2(j,i)*w;
	sumw=sumw+w;
    end
    pl(j,i) =pl(j,i) /sumw;
    ro(j,i) =ro(j,i) /sumw;
    al(j,i) =al(j,i) /sumw; 
    qn(j,i) =qn(j,i) /sumw;
    nn(j,i) =nn(j,i) /sumw; 
    cn1(j,i)=cn1(j,i)/sumw;
    cn2(j,i)=cn2(j,i)/sumw;
  end
end

%k=1;pl=cd(k).pl;al=cd(k).al;qn=cd(k).qn;nn=cd(k).nn;cn1=cd(k).cn1;cn2=cd(k).cn2; 
pms=[ 0, 0, 1500, 600]; fsize=12; lw=2; msize=12; 
handle = figure('Position', pms,'visible','on');
row=2; col=3; 
subplot(row,col,1); pcolor(pl); shading flat; caxis([0 1000]); colorbar;
subplot(row,col,2); pcolor(al); shading flat; caxis([0 0.5]);colorbar;
subplot(row,col,3); pcolor(cn1);shading flat; caxis([0 200]);colorbar;
subplot(row,col,4); pcolor(qn); shading flat; caxis([0 10]); colorbar;
subplot(row,col,5); pcolor(nn); shading flat; caxis([0 10]); colorbar;
subplot(row,col,6); pcolor(cn2);shading flat; caxis([0 200]);colorbar;



v=am4.v0; f1=squeeze(mean(v.atm.al850.sea(k,:,:),1)); qn1=squeeze(mean(v.atm.qn850.sea(k,:,:),1))/a;
v=am4.w0; f2=squeeze(mean(v.atm.al850.sea(k,:,:),1)); qn2=squeeze(mean(v.atm.qn850.sea(k,:,:),1))/a;
z=f1; z(z<0)=0; f1=z;  n1=qn1./f1; figure; pcolor(f1); shading flat; caxis([0 1]);colorbar;
z=f2; z(z<0)=0; f2=z;  n2=qn2./f2; figure; pcolor(f2); shading flat; caxis([0 1]);colorbar;

figure; pcolor(qn2-qn1); shading flat; caxis([-25 25]);colorbar;
figure; pcolor(n2-n1);   shading flat; caxis([-50 50]);colorbar;
figure; pcolor(qn1); shading flat; caxis([0 25]);colorbar;
figure; pcolor(n1);  shading flat; caxis([0 100]);colorbar;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='c96L33_am4p0_2010climo_fixedN0';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4fn0.v0=v;
expn='c96L33_am4p0_2010climo_fixedN0_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4fn0.w0=v;
expn='c96L33_am4p0_2010climo_fixedN1';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4fn1.v0=v;
expn='c96L33_am4p0_2010climo_fixedN1_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4fn1.w0=v;
expn='c96L33_am4p0_2010climo_fixedN4';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4fn2.v0=v;
expn='c96L33_am4p0_2010climo_fixedN4_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4fn2.w0=v;

expn='c96L33_am4p0_2010climo_eis0';        fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4eis0.v0=v;
expn='c96L33_am4p0_2010climo_eis0_p2K';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4eis0.w0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/verona/';
expn='c96L32_am4g11r11_2010climo';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11.v0=v;
expn='c96L32_am4g11r11_2010climo_p2K';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4g11.w0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y1=am4.v0.toa.netrad.ann_stat.mmen.all;    y1=mean(y1);
y2=am4.w0.toa.netrad.ann_stat.mmen.all;    y2=mean(y2);
y3=am4fn1.v0.toa.netrad.ann_stat.mmen.all; y3=mean(y3);
y4=am4fn1.w0.toa.netrad.ann_stat.mmen.all; y4=mean(y4);
y5=am4fn2.v0.toa.netrad.ann_stat.mmen.all; y5=mean(y5);
y6=am4fn2.w0.toa.netrad.ann_stat.mmen.all; y6=mean(y6);
[y1 y2 y3 y4 y5 y6]
[y2-y1 y4-y3 y6-y5]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dttcf_lat_fixedN'; expn='AM4p0_rfp_cess'; 
yl='changes in TOA net radiation (W/m2)'; climo=0;
k=1; lat=am4.v0.s.lat;
yo=o.toa.ttcf.latdis.sea(k,:);y1a=am4.v0.toa.ttcf.txavg0;
y1=am4.v0.toa.ttcf.sea_stat.latdis_all(k,:);
y2=am4.w0.toa.ttcf.sea_stat.latdis_all(k,:);
y3=am4fn1.v0.toa.ttcf.sea_stat.latdis_all(k,:);
y4=am4fn1.w0.toa.ttcf.sea_stat.latdis_all(k,:);
y5=am4fn2.v0.toa.ttcf.sea_stat.latdis_all(k,:);
y6=am4fn2.w0.toa.ttcf.sea_stat.latdis_all(k,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=12; lw=2; msize=12; 
handle = figure('Position', pms,'visible','on');
%plot(lat,y1+yo,'b*-'); hold on; plot(lat,y1a,'rs-');
plot(lat,y2-y1,'r'); hold on; 
plot(lat,y4-y3,'b'); plot(lat,y6-y5,'g');
axis([-90 90 -3 3]); 
ylabel('\Delta CRE (P2K minus CNTL)','FontSize',fsize);
legend('AM4.0','AM4.0 (fixed N 50/150)','AM4.0 (fixed N 100/300)');
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dswcf_lat_fixedN'; expn='AM4p0_rfp_cess'; 
yl='changes in TOA net radiation (W/m2)'; climo=0;
k=1; lat=am4.v0.s.lat;
yo=o.toFua.swcf.latdis.sea(k,:);y1a=am4.v0.toa.swcf.txavg0;
y1=am4.v0.toa.swcf.sea_stat.latdis_all(k,:);
y2=am4.w0.toa.swcf.sea_stat.latdis_all(k,:);
y3=am4fn1.v0.toa.swcf.sea_stat.latdis_all(k,:);
y4=am4fn1.w0.toa.swcf.sea_stat.latdis_all(k,:);
y5=am4fn2.v0.toa.swcf.sea_stat.latdis_all(k,:);
y6=am4fn2.w0.toa.swcf.sea_stat.latdis_all(k,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=12; lw=2; msize=12; 
handle = figure('Position', pms,'visible','on');
%plot(lat,y1+yo,'b*-'); hold on; plot(lat,y1a,'rs-');
plot(lat,y2-y1,'r'); hold on; 
plot(lat,y4-y3,'b'); plot(lat,y6-y5,'g');
axis([-90 90 -5 5]); 
ylabel('\Delta CRE (P2K minus CNTL)','FontSize',fsize);
legend('AM4.0','AM4.0 (fixed N 50/150)','AM4.0 (fixed N 100/300)');
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dttcf_lat'; expn='AM4p0_rfp_cess'; 
yl='changes in TOA net radiation (W/m2)'; climo=0;
k=1; lat=am4.v0.s.lat;
yo=o.toa.ttcf.latdis.sea(k,:);y1a=am4.v0.toa.ttcf.txavg0;
y1=am4.v0.toa.ttcf.sea_stat.latdis_all(k,:);
y2=am4.w0.toa.ttcf.sea_stat.latdis_all(k,:);
y3=am4fn1.v0.toa.ttcf.sea_stat.latdis_all(k,:);
y4=am4fn1.w0.toa.ttcf.sea_stat.latdis_all(k,:);
y5=am4g11.v0.toa.ttcf.sea_stat.latdis_all(k,:);
y6=am4g11.w0.toa.ttcf.sea_stat.latdis_all(k,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=12; lw=2; msize=12; 
handle = figure('Position', pms,'visible','on');
%plot(lat,y1+yo,'b*-'); hold on; plot(lat,y1a,'rs-');
plot(lat,y2-y1,'r'); hold on; 
plot(lat,y4-y3,'b'); plot(lat,y6-y5,'g');
axis([-90 90 -3 3]); 
ylabel('\Delta CRE (P2K minus CNTL)','FontSize',fsize);
legend('AM4.0','AM4.0 (fixed N))','AM4g11r11');
visfig='off'; figpath='./fig_am4/'; vname='dcre';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dswcf_lat'; expn='AM4p0_rfp_cess'; 
yl='changes in TOA net radiation (W/m2)'; climo=0;
k=1; lat=am4.v0.s.lat;
yo=o.toa.swcf.latdis.sea(k,:);y1a=am4.v0.toa.swcf.txavg0;
y1=am4.v0.toa.swcf.sea_stat.latdis_all(k,:);
y2=am4.w0.toa.swcf.sea_stat.latdis_all(k,:);
y3=am4fn1.v0.toa.swcf.sea_stat.latdis_all(k,:);
y4=am4fn1.w0.toa.swcf.sea_stat.latdis_all(k,:);
y5=am4g11.v0.toa.swcf.sea_stat.latdis_all(k,:);
y6=am4g11.w0.toa.swcf.sea_stat.latdis_all(k,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=12; lw=2; msize=12; 
handle = figure('Position', pms,'visible','on');
%plot(lat,y1+yo,'b*-'); hold on; plot(lat,y1a,'rs-');
plot(lat,y2-y1,'r'); hold on; 
plot(lat,y4-y3,'b'); plot(lat,y6-y5,'g');
axis([-90 90 -3 3]); 
ylabel('\Delta CRE (P2K minus CNTL)','FontSize',fsize);
legend('AM4.0','AM4.0 (fixed N))','AM4g11r11');
visfig='off'; figpath='./fig_am4/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



figure;
plot(lat,y1,'-b*'); hold on; plot(lat,y2,'-rs');
plot(lat,y3,'-k*'); hold on; plot(lat,y4,'-ms');
plot(lat,y5,'-c*'); hold on; plot(lat,y6,'-ys');

vname='dttcf_lat'; expn='AM4p0_rfp_cess'; 
yl='changes in TOA net radiation (W/m2)'; climo=0;
k=1; lat=am4.v0.s.lat;
y2=am4.v0.toa.ttcf.txavg0;
y1=am4.v0.toa.ttcf.txavg0;

y2=am4.w0.toa.ttcf.txavg0;
y3=am4fn1.v0.toa.ttcf.txavg0;
y4=am4fn1.w0.toa.ttcf.txavg0;
y5=am4g11.v0.toa.ttcf.txavg0;
y6=am4g11.w0.toa.ttcf.txavg0;
figure; 
plot(lat,y2-y1,'b'); hold on; 
plot(lat,y4-y3,'r'); plot(lat,y6-y5,'g');


k=1;
y1=am4.v0.toa.swcf.sea_stat.latdis_all(k,:);
y2=am4.w0.toa.swcf.sea_stat.latdis_all(k,:);
y3=am4fn1.v0.toa.swcf.sea_stat.latdis_all(k,:);
y4=am4fn1.w0.toa.swcf.sea_stat.latdis_all(k,:);
y5=am4g11.v0.toa.swcf.sea_stat.latdis_all(k,:);
y6=am4g11.w0.toa.swcf.sea_stat.latdis_all(k,:);
figure; plot(y2-y1,'b'); hold on; plot(y4-y3,'r'); plot(y6-y5,'g');
plot(y1,'-b*'); hold on; plot(y2,'-rs');
plot(y3,'-k*'); hold on; plot(y4,'-ms');

k=1;
y1=am4.v0.toa.swcf.sea_stat.latdis_all(k,:);
y2=am4.v0.toa.swcf.txavg0;
figure; plot(y1); hold on; plot(y2,'r')

y3=am4fn1.v0.toa.swcf.sea_stat.latdis_all(k,:);
y4=am4fn1.w0.toa.swcf.sea_stat.latdis_all(k,:);
y5=am4g11.v0.toa.swcf.sea_stat.latdis_all(k,:);
y6=am4g11.w0.toa.swcf.sea_stat.latdis_all(k,:);
figure; plot(y2-y1,'b'); hold on; plot(y4-y3,'r'); plot(y6-y5,'g');
plot(y1,'-b*'); hold on; plot(y2,'-rs');
plot(y3,'-k*'); hold on; plot(y4,'-ms');



y2=am4.w0.toa.netrad.txavg0;  s2='1860RAD';
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
expn='c96L33_am4p0_1990climo';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4a.v0=v;
expn='c96L33_am4p0_1990climo_p2K';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4a.w0=v;
expn='c96L33_am4p0_1990climo_2xCO2';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4a.x0=v;
expn='c96L33_am4p0_1850climo';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4a.c0=v;
expn='c96L33_am4p0_1990GHG';        fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4a.g0=v;
expn='c96L33_am4p0_1990aero';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4a.a0=v;
%x1=am4.a0.toa.netrad.ts.org_ann-am4.c0.toa.netrad.ts.org_ann;
%x2=am4a.a0.toa.netrad.ts.org_ann-am4a.c0.toa.netrad.ts.org_ann(1:10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='c96L33_aref1_1990climo';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2a.v0=v;
expn='c96L33_aref1_1990climo_p2K';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2a.w0=v;
expn='c96L33_aref1_1990climo_2xCO2';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2a.x0=v;
expn='c96L33_aref1_1990climo_1850rad'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2a.c0=v;
expn='c96L33_aref1_1990climo_1990GHG'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2a.g0=v;
expn='c96L33_aref1_1990climo_1990aero';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2a.a0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/AM2.1/';
expn='AM2p1_1990climo_cntl';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v0=v;
expn='AM2p1_1990climo_cntl_p2K';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.w0=v;
expn='AM2p1_1990climo_cntl_2xCO2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.x0=v;
expn='AM2p1_1990climo_1860rad';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.c0=v;
expn='AM2p1_1990climo_1990GHG';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.g0=v;
expn='AM2p1_1990climo_1990aero';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.a0=v;
%expn='c48l24_am2p14_C0';           fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v0=v;
%expn='c48l24_am2p14_C0_p2K';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.w0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/AM3/';
expn='c48L48_am3p10_clim';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v0=v;
expn='c48L48_am3p10_clim_p2k';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.w0=v;
expn='c48L48_am3p10_clim_pi';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c0=v;
expn='c48L48_am3p10_clim_pi_GHG';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a0=v;
expn='c48L48_am3p10_clim_pi_aero'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g0=v;
am3.x0=am3.v0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mean(am3.v0.toa.netrad.ann_stat.mmen.all)-mean(am3.c0.toa.netrad.ann_stat.mmen.all)
mean(am3.v0.toa.netrad.ann_stat.mmen.all)-mean(am3.a0.toa.netrad.ann_stat.mmen.all)
mean(am3.v0.toa.netrad.ann_stat.mmen.all)-mean(am3.g0.toa.netrad.ann_stat.mmen.all)
mean(am3.w0.toa.netrad.ann_stat.mmen.all)-mean(am3.v0.toa.netrad.ann_stat.mmen.all)
mean(am2a.w0.toa.netrad.ann_stat.mmen.all)-mean(am2a.v0.toa.netrad.ann_stat.mmen.all)
mean(am2a.w0.toa.netrad.ann_stat.mmen.all)-mean(am2a.v0.toa.netrad.ann_stat.mmen.all)
v0=aref0.v0; aref0.c0=v0; aref0.a0=v0; 
x=aref0; aref0.d =compute_rfp_all(x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=am4;  am4.d =compute_rfp_all(x);
x=am4a; am4a.d=compute_rfp_all(x);
x=am2a; am2a.d=compute_rfp_all(x);
x=am2;  am2.d =compute_rfp_all(x);
x=am3;  am3.d =compute_rfp_all(x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%am2=aref0; am2.d.netradtoa_clr.rfp(:)=0;
am2.d.netradtoa.rfp=[2.17 -0.7 2.87 0 -3.70 3.55];
am2.d.netradtoa.rfp=[1.92 -0.7 2.62 0 -3.70 3.55];
%am3=aref0; am3.d.netradtoa_clr.rfp(:)=0;
am3.d.netradtoa.rfp=[0.99 -1.6 2.59 0 -2.99 3.62];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section 1: RFP CESS sensitivity global and regional plots%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rfp_cess_glb'; expn='AM4p0'; 
xy=[0.5 5.5 -5 5]; %xy=[0.5 6.5 -5 5];
am3.d.netradtoa.rfp(2)=am3.d.netradtoa.rfp(2)+am3.d.netradtoa.rfp(4);
am3.d.netradtoa.rfp(4)=0; am3.d.netradtoa.rfp
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
ylabel('changes in TOA net radiative flux (W/m2)','FontSize',fsize);
legend('AM4.0(2010)','AM4.0(1990)','AM2.1(1990)','AM3(1990)',1)
visfig='off'; figpath='./fig_am4/';  
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%Section 2: latitudional plots%%%%%%%%%%%%%%%%
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
