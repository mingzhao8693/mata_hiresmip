%below opt=1 for writing mat file to /work/miz 
%below opt=2 for writing mat file to /archive
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
latlon=[0 360 -90 90];region='global';mod='c96';myr=5; opt=2;
%latlon=[0 360 30 90];region='nhextr';mod='c96';myr=5; opt=2;
%latlon=[0 360 -30 30];region='tropic';mod='c96';myr=5; opt=2;
%latlon=[150 250 -5 5]; region='equpac'; nyr=5; myr=1; opt=0; 
%read in or generate observation data:
%o=readobs(latlon,region,'c96');
%o=readobs(latlon,region,'c48');
fn=strcat('/work/miz/mat_hiresmip/obs_',region,'_to_c48.mat'); load(fn); 
%fn=strcat('/work/miz/mat_cm4/obs_',region,'_to_c48.mat');load(fn);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5; opt=2;
expn='CM4_Scenario_ssp585';yr1='2015';yr2='2099';syr=1;nyr=85;mod='c96';%1870-2014period
v1=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_Scenario_ssp245';yr1='2015';yr2='2099';syr=1;nyr=85;mod='c96';%1870-2014period
v1=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);


tpath='/archive/Ming.Zhao/CM2/'; myr=5; 
expn='ESM2M_piControl'; yr1='0001';yr2='0100';syr=1;nyr=100;mod='c96'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='ESM2M_abrupt-4xCO2'; yr1='0001';yr2='0300';syr=1;nyr=150;mod='c96'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/ESM4/DECK/'; myr=5; 
expn='ESM4_amip_D1_1850climo'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96'
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='ESM4_amip_D1_1850climo_p2K'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96'
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='ESM4_amip_D1_1850climo_4xCO2'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96'
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
expn='c96L33_am4p0_1850climo_CM4_piControl_C_4xCO2_photosyn';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2; yr1='0002';yr2='0051';syr=1;nyr=50;mod='c96';
expn='c96L33_am4p0_1850climo_CM4_piControl_C_4xCO2_photosyn_dynveg';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2; yr1='0002';yr2='0051';syr=1;nyr=50;mod='c96';
expn='c96L33_am4p0_1850climo_CM4_piControl_C_dynveg';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2; yr1='0002';yr2='0051';syr=1;nyr=50;mod='c96';
expn='c96L33_am4p0_1850climo_CM4_piControl_C_4xCO2_dynveg';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM4_sst_pattern_26-75yr';%CM4-26-75
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_ESM2_sst_pattern_26_75'; %ESM2M-26-75
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2;yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_SSTP_CM4_4xCO2_yr26-75';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_SSTP_CM4_4xCO2_yr101-150';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_SSTP_CM4_4xCO2_yr101-150_minus_yr26-75';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
   expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_SSTP_ESM2M_4xCO2_yr26-75';
   v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_SSTP_ESM2M_4xCO2_yr101-150';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_SSTP_ESM2M_4xCO2_yr101-150_minus_yr26-75';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM4_pattern_ESM2_meridional';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);


tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_SSTA_last_50yr_minus_yr_26-75'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_SSTA_ESM2M_last_50yr_minus_yr_26-75'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L33_am4p0_1850climo_CM4_CM4_abrupt4xCO2_C_yr26-75'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_CM4_abrupt4xCO2_C_yr26-75_4xCO2'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_SSTA_only_yr26-75'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_SICA_only_yr26-75'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_static_veg_yr51'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L33_am4p0_2010climo_new'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2; 
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM4_zonal_mean_SSTA'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_ESM2_zonal_mean_SSTA'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_ESM2_sst_pattern_1_50'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2; myr=1;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_ESM2_sst_pattern_101_150'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_historical_pattern'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);


tpath='/archive/Ming.Zhao/awg/xanadu/'; myr=5; opt=2;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM2_sst_pattern_101_200'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM4_last50_minus_first50_sst_pattern_new'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);


expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM4_sst_pattern_1-50yr'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM4_sst_pattern'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM2_sst_pattern'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L33_am4p0_2010climo_p2K_hist_pattern_only'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_hist_pattern_only'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM4_last50_minus_first50_sst_pattern'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);


expn='c96L33_am4p0_1850climo_CM4_piControl_C'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_abrupt4xCO2_C_and_4xCO2'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96'
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_piControl_C_4xCO2'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96'
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_abrupt4xCO2_C'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96'
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_piControl_C_SSTA_only'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96'
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_piControl_C_SICA_only'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96'
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_piControl_C_static_veg'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96'
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_piControl_C_2K'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96'
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_abrupt4xCO2_C_noSSTA'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96'
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_abrupt4xCO2_C_noSICA'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96'
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_abrupt4xCO2_C_ctl_static_veg'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96'
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_1850climo_CM4_abrupt4xCO2_C_m2.7K'; yr1='0002';yr2='0021';syr=1;nyr=20;mod='c96'
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5; opt=2;
expn='CM4_amip';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96';%1870-2014period
v1=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_historical';yr1='1850';yr2='2014';syr=1;nyr=165;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_historical2';yr1='1850';yr2='2014';syr=1;nyr=165;mod='c96';opt=1;
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_historical3';yr1='1850';yr2='2014';syr=1;nyr=165;mod='c96';opt=1;
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_piControl_C';yr1='0001';yr2='0650';syr=151;nyr=300;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_abrupt4xCO2_C';yr1='0001';yr2='0150';syr=1;nyr=150;mod='c96';opt=2
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_1pctCO2_C';yr1='0001';yr2='0150';syr=1;nyr=150;mod='c96';opt=1;
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L33_am4p0_2010climo'; yr1='0002';yr2='0011';syr=1;nyr=10;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);


tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5; opt=10;
expn='c192L33_am4p0_amip_HIRESMIP_H5';yr1='1950';yr2='2014';syr=1;nyr=65;mod='c192';%1950-2014period
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='CM4_c192L33_am4p0_1950Control_new';yr1='0001';yr2='0155';syr=1;nyr=155;mod='c192';
v2=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='CM4_c192L33_am4p0_1950Control_new_hist0';yr1='1950';yr2='2014';syr=1;nyr=65;mod='c192';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585';yr1='2015';yr2='2050';syr=1;nyr=36;mod='c192';%2015-2050period
v6=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='CM4_c192L33_am4p0_1950Control_new';yr1='0001';yr2='0155';syr=1;nyr=155;mod='c192';%1950-2014period
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5; opt=10;
expn='CM4_Scenario_ssp585';yr1='2015';yr2='2099';syr=1;nyr=36;mod='c96';%1870-2014period
v5=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5; opt=10;
expn='CM4_amip';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96';%1870-2014period
v2=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='CM4_historical';yr1='1850';yr2='2014';syr=101;nyr=65;mod='c96';
v3=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_c192L33_am4p0_1950Control_new_hist0';yr1='1950';yr2='2014';syr=1;nyr=65;mod='c192';
v1=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
figure; 
v=v0; plot(v.time,v.atm.scalar.solarc,'r*-'); hold on; 
v=v1; plot(v.time,v.atm.scalar.solarc,'bs-'); hold on; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/am4_spear/'; myr=5; opt=2;
expn='AM4_spear_C96_O1_1850cntl_standard';yr1='0001';yr2='0200';syr=51;nyr=150;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4_spear_C96_O1_1850cntl_standard_4xCO2';yr1='0001';yr2='0200';syr=1;nyr=150;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4_spear_C96_O1_1850cntl';yr1='0001';yr2='0200';syr=51;nyr=150;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4_spear_C96_O1_1850cntl_4xCO2';yr1='0001';yr2='0200';syr=1;nyr=150;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5; opt=2;
expn='SPEAR_c96_o1_Control_1850_E50';yr1='0001';yr2='0200';syr=1;nyr=200;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_Scenario_ssp585';yr1='2015';yr2='2099';syr=1;nyr=85;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5; opt=2;
expn='ESM4_piControl_D';yr1='0001';yr2='0890';syr=1;nyr=300;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='ESM4_abrupt-4xCO2_D1';yr1='0001';yr2='0395';syr=1;nyr=300;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='ESM4_historical_D1';yr1='1850';yr2='2014';syr=1;nyr=165;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/am4_spear/'; myr=5; opt=2;
expn='SPEAR_c96_o1_Control_1850_E50';yr1='0001';yr2='0200';syr=1;nyr=200;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4_spear_C96_O1_1850cntl_4xCO2';yr1='0001';yr2='0200';syr=1;nyr=200;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='AM4_spear_C96_O1_1850cntl';yr1='0001';yr2='0200';syr=1;nyr=200;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5; opt=2;
expn='CM4_c192L33_am4p0_1950Control_new_hist02';yr1='1950';yr2='2014';syr=1;nyr=65;mod='c192';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585';yr1='2015';yr2='2050';syr=1;nyr=35;mod='c192';%1950-2014period
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c192L33_am4p0_amip_HIRESMIP_H5';yr1='1950';yr2='2014';syr=1;nyr=65;mod='c192';%1950-2014period
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_c192L33_am4p0_1950Control_new';yr1='0001';yr2='0155';syr=1;nyr=155;mod='c192';%1950-2014period
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_c192L33_am4p0_1950Control_new_4xCO2';yr1='0001';yr2='0170';syr=1;nyr=170;mod='c192';%1950-2014period
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5; opt=2;
expn='ESM4_amip_D1';yr1='1980';yr2='2014';syr=11;nyr=20;mod='c96';%1990-2009period
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='ESM4_amip-p4K';yr1='1990';yr2='2009';syr=1;nyr=20;mod='c96';%1990-2009period
v1=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; myr=5; opt=2;
expn='CM4_amip';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96';%1870-2014period
v1=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_historical';yr1='1850';yr2='2014';syr=1;nyr=165;mod='c96';
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_historical2';yr1='1850';yr2='2014';syr=1;nyr=165;mod='c96';opt=1;
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_historical3';yr1='1850';yr2='2014';syr=1;nyr=165;mod='c96';opt=1;
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_piControl_C';yr1='0001';yr2='0650';syr=151;nyr=300;mod='c96';opt=2
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_abrupt4xCO2_C';yr1='0001';yr2='0150';syr=1;nyr=150;mod='c96';opt=2
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='CM4_1pctCO2_C';yr1='0001';yr2='0150';syr=1;nyr=150;mod='c96';opt=1;
v0=tsana_hiresmip(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load previous anlaysis matfiles%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fn=strcat('/work/miz/mat_cm4/obs_global_to_c48.mat'); load(fn);
fn=strcat('/work/miz/mat_hiresmip/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat'); 
tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
tpath='/work/miz/mat_cm4/';
tpath='/work/miz/mat_hiresmip/';
expn='c192L33_am4p0_amip_HIRESMIP_H5';            fn=strcat(tpath,expn,dr);load(fn);AM4h.h0=v;
expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585'; fn=strcat(tpath,expn,dr);load(fn);AM4h.w0=v;
expn='CM4_c192L33_am4p0_1950Control_new';         fn=strcat(tpath,expn,dr);load(fn);CM4h.c0=v;
expn='CM4_c192L33_am4p0_1950Control_new_4xCO2';   fn=strcat(tpath,expn,dr);load(fn);CM4h.w0=v;
expn='CM4_c192L33_am4p0_1950Control_new_hist0';   fn=strcat(tpath,expn,dr);load(fn);CM4h.h1=v;
expn='CM4_c192L33_am4p0_1950Control_new_hist02';  fn=strcat(tpath,expn,dr);load(fn);CM4h.h2=v;

expn='CM4_amip';           fn=strcat(tpath,expn,dr);load(fn);AM4.h0=v;
expn='CM4_historical';     fn=strcat(tpath,expn,dr);load(fn);CM4.h1=v;
expn='CM4_historical2';    fn=strcat(tpath,expn,dr);load(fn);CM4.h2=v;
expn='CM4_historical3';    fn=strcat(tpath,expn,dr);load(fn);CM4.h3=v;
expn='CM4_piControl_C';    fn=strcat(tpath,expn,dr);load(fn);CM4.c0=v;
expn='CM4_abrupt4xCO2_C';  fn=strcat(tpath,expn,dr);load(fn);CM4.w0=v;
expn='CM4_1pctCO2_C';      fn=strcat(tpath,expn,dr);load(fn);CM4.p0=v;
expn='CM4_Scenario_ssp585';fn=strcat(tpath,expn,dr);load(fn);CM4.w1=v;

expn='AM4_spear_C96_O1_1850cntl';       fn=strcat(tpath,expn,dr);load(fn);SP4.c0=v;
expn='AM4_spear_C96_O1_1850cntl_4xCO2'; fn=strcat(tpath,expn,dr);load(fn);SP4.w0=v;

expn='ESM4_historical_D1';   fn=strcat(tpath,expn,dr);load(fn);ESM4.h0=v;
expn='ESM4_piControl_D';     fn=strcat(tpath,expn,dr);load(fn);ESM4.c0=v;
expn='ESM4_abrupt-4xCO2_D1'; fn=strcat(tpath,expn,dr);load(fn);ESM4.w0=v;

expn='AM2.1';                fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v0=v;
expn='AM3';                  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v0=v;
expn='c96L33_am4p0';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v0=v;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%climsen analysis%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_hiresmip/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat'); 
tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
expn='CM4_piControl_C';                 fn=strcat(tpath,expn,dr);load(fn);CM4.c0=v;
expn='CM4_abrupt4xCO2_C';               fn=strcat(tpath,expn,dr);load(fn);CM4.w0=v;
expn='ESM4_piControl_D';                fn=strcat(tpath,expn,dr);load(fn);ESM4.c0=v;
expn='ESM4_abrupt-4xCO2_D1';            fn=strcat(tpath,expn,dr);load(fn);ESM4.w0=v;

tpath='/archive/Ming.Zhao/am4_spear/';
expn='AM4_spear_C96_O1_1850cntl';       fn=strcat(tpath,expn,dr);load(fn);SP3.c0=v;
expn='AM4_spear_C96_O1_1850cntl_4xCO2'; fn=strcat(tpath,expn,dr);load(fn);SP3.w0=v;
dr=strcat('_',region,'_opt1.tsana.mat'); 
expn='AM4_spear_C96_O1_1850cntl_standard';       fn=strcat(tpath,expn,dr);load(fn);SP2.c0=v;
expn='AM4_spear_C96_O1_1850cntl_standard_4xCO2'; fn=strcat(tpath,expn,dr);load(fn);SP2.w0=v;
%expn='CM4_c192L33_am4p0_1950Control_new';      fn=strcat(tpath,expn,dr);load(fn);CM4h.c0=v;
%expn='CM4_c192L33_am4p0_1950Control_new_4xCO2';fn=strcat(tpath,expn,dr);load(fn);CM4h.w0=v;

dr=strcat('_',region,'_opt1.tsana.mat'); 
expn='ESM4_amip_D1';                    fn=strcat(tpath,expn,dr);load(fn);a41.c0=v;
expn='ESM4_amip-p4K';                   fn=strcat(tpath,expn,dr);load(fn);a41.w0=v;

tpath='/archive/Ming.Zhao/awg/xanadu/'; dr=strcat('_',region,'_tsana.mat'); 
expn='c96L33_am4p0_1850climo_CM4_piControl_C';        fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.c0=v;
expn='c96L33_am4p0_1850climo_CM4_abrupt4xCO2_C_4xCO2';fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.w0=v;
expn='c96L33_am4p0_1850climo_CM4_abrupt4xCO2_C';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.W0=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_4xCO2';fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.G0=v;

expn='c96L33_am4p0_2010climo';          fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.c1=v;
expn='c96L33_am4p0_2010climo_p2K';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.w1=v;
expn='c96L33_am4p0_2010climo_4xCO2';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.g1=v;

tpath='/archive/Ming.Zhao/awg/warsaw/'; dr=strcat('_',region,'_tsana.mat'); 
expn='c96L33_am4p0_2010climo';          fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.c2=v;
expn='c96L33_am4p0_2010climo_p2K';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.w2=v;
expn='c96L33_am4p0_2010climo_2xCO2';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.g2=v;

y0=am4.c0.toa.swnet.txavg0;
y1=am4.g0.toa.swnet.txavg0;
y2=am4.g1.toa.swnet.txavg0;
figure; plot(y1-y0); hold on; plot((y2-y0)*2,'r');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Final Load files for plotting...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%climsen analysis%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_hiresmip/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana_new.mat');
tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
expn='CM4_piControl_C';                 fn=strcat(tpath,expn,'/',expn,dr);load(fn);CM4.c0=v;
expn='CM4_abrupt4xCO2_C';               fn=strcat(tpath,expn,'/',expn,dr);load(fn);CM4.w0=v;
expn='CM4_1pctCO2_C';                   fn=strcat(tpath,expn,'/',expn,dr);load(fn);CM4.w2=v;

t1=1; t2=20; t3=30; opt=1;
c1=CM4.c0.sfc.tref.ann_stat.mmen.all;   c1_l=ltrd(c1(t1:t2),opt);%CM4-CNTL:150-250yr
w1=CM4.w0.sfc.tref.ann_stat.mmen.all;   dT1=w1(t1:t3)-c1_l;         %CM4-4xCO2:1-150yr
w2=CM4.w2.sfc.tref.ann_stat.mmen.all;   dT2=w2(t1:t3)-c1_l;         %CM4-4xCO2:1-150yr
C1=CM4.c0.toa.netrad.ann_stat.mmen.all; C1_l=ltrd(C1(t1:t2),opt);
W1=CM4.w0.toa.netrad.ann_stat.mmen.all; dN1=W1(t1:t3)-C1_l;
W2=CM4.w2.toa.netrad.ann_stat.mmen.all; dN2=W2(t1:t3)-C1_l;
dT1=dT1/2; dN1=dN1/2;
[r,p]=corrcoef(dN1,dT1); corr=r(1,2);
c=polyfit(dT1,dN1,1);    slop=c(1); F=c(2); dT=c(2)/c(1);
xa=[0:10]; ya=c(1)*xa+c(2);
t1=1;  t2=30; x0=getcorrslop(dT1(t1:t2),dN1(t1:t2));
t1=1;  t2=10; x1=getcorrslop(dT1(t1:t2),dN1(t1:t2));
t1=11; t2=30; x2=getcorrslop(dT1(t1:t2),dN1(t1:t2));

xy=[0 10 -2 8]; msize=18; row=1; col=2;
pms=[ 0, 0, 1200, 400]*2; fsize=20; lw=1; s0='(%4.2f)';
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); ax1=gca; time=[2.5:5:150]; 
line(time,dT1,'Color','k','LineWidth',lw*3,'LineStyle',ls1); hold on;
line(time,dT2,'Color','k','LineWidth',lw*2,'LineStyle',':'); hold on;
axis([0 150 0 4]); %box on; %set(gca,'FontSize',fsize); 
xl='year'; yl='$\delta T_s (K)$';  grid on;
xlabel(xl,'FontSize',fsize,'Interpreter','latex');
ylabel(yl,'FontSize',fsize,'Interpreter','latex');
set(gca,'FontSize',fsize); %title('(a)','FontSize',fsize); grid on;
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','top','YAxisLocation','right',...
	   'Color','none','XColor','b','YColor','b');
line(time,dN1,'Color','b','LineWidth',lw*3,'LineStyle',ls1); hold on;
line(time,dN2,'Color','b','LineWidth',lw*2,'LineStyle',':'); hold on;
yl='$\delta N (W m^{-2}$)'; 
ylabel(yl,'FontSize',fsize,'Interpreter','latex');
set(gca,'FontSize',fsize); xy=[0 150 0 4]; mylabel(xy,1,'',12);

subplot(row,col,2); 
plot(dT1,dN1, 'ko','MarkerSize',msize); hold on;
%plot(dT2,dN2, 'k+','MarkerSize',msize); hold on;
v=x0;  plot(v.xc,v.yc,'k-', 'LineWidth',lw*4);
v=x1;  plot(v.xa,v.ya,'b--', 'LineWidth',lw*2);
v=x2;  plot(v.xb,v.yb,'r--', 'LineWidth',lw*2);
xy=[0 5 0 4]; mylabel(xy,1,'',12);
xl='$\delta T_s (K)$';
yl='$\delta N (W m^{-2}$)';
xlabel(xl,'FontSize',fsize,'Interpreter','latex');
ylabel(yl,'FontSize',fsize,'Interpreter','latex'); grid on;
mylabel(xy,1,'',12); set(gca,'FontSize',fsize);
expn='teach_climsen'; visfig='off'; figpath='./'; vname='gregory';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z1=a40.G0.toa.netrad.tavg0-a40.c0.toa.netrad.tavg0;
z2=a40.G0.toa.lwnet_clr.tavg0 -a40.c0.toa.lwnet_clr.tavg0;
z3=a40.G0.toa.swnet_clr.tavg0 -a40.c0.toa.swnet_clr.tavg0;
z4=a40.G0.toa.ttcf.tavg0      -a40.c0.toa.ttcf.tavg0;
z5=a40.G0.toa.lwcf.tavg0      -a40.c0.toa.lwcf.tavg0;
z6=a40.G0.toa.swcf.tavg0      -a40.c0.toa.swcf.tavg0;
z1=z1/2; z2=z2/2; z3=z3/2; z4=z4/2; z5=z5/2; z6=z6/2; 
cmin=0; cmax=5; vbin=[cmin:0.01:cmax]; vname='2CO2forcing';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z1=a40.P0.toa.netrad.tavg0-a40.c0.toa.netrad.tavg0;
z2=a40.P0.toa.lwnet_clr.tavg0 -a40.c0.toa.lwnet_clr.tavg0;
z3=a40.P0.toa.swnet_clr.tavg0 -a40.c0.toa.swnet_clr.tavg0;
z4=a40.P0.toa.ttcf.tavg0      -a40.c0.toa.ttcf.tavg0;
z5=a40.P0.toa.lwcf.tavg0      -a40.c0.toa.lwcf.tavg0;
z6=a40.P0.toa.swcf.tavg0      -a40.c0.toa.swcf.tavg0;
a=a40.P0.sfc.tref.tavg0-a40.c0.sfc.tref.tavg0;
a=mean(mean(a.*aa));
z1=z1/a; z2=z2/a; z3=z3/a; z4=z4/a; z5=z5/a; z6=z6/a;
cmin=-5; cmax=5; vbin=[cmin:0.01:cmax]; vname='p2Kfeedback';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nn=256; cmap=bluewhitered_miz(nn); color='w';
lm(lm>=0.5)=1; lm(lm<0.5)=0; xy=[0 360 -90 90];
pms=[ 0, 0, 1000, 400]*1.8; fsize=10; row=2; col=3;
handle = figure('Position', pms,'visible','on');
t = tiledlayout(2, 3, "TileSpacing", "tight");
subplot(row,col,1); a=z1; b=mean(mean(a.*aa)); vbino=20;
do_mapproj(lat,lon,a,vbino,lat,lon,lm,'robinson',xy);caxis([cmin cmax]);
contour(lon,lat,lm,1,color); colormap(cmap);%colormap(jet(256));
%pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]); contour(lon,lat,lm,1,color);
colormap(cmap);%colormap(jet(256));
s=sprintf('$\\delta N$ (%4.2f W/m2)',b); 
title(s,'FontSize',fsize,'Interpreter','latex'); set(gca,'FontSize',fsize); 

subplot(row,col,2); a=-z2; b=mean(mean(a.*aa));

pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); colormap(cmap);%colormap(jet(256));
s=sprintf('$\\delta LW_{CLR}$ (%4.2f W/m2)',b); 
title(s,'FontSize',fsize,'Interpreter','latex'); set(gca,'FontSize',fsize); 

subplot(row,col,3); a=z3; b=mean(mean(a.*aa));
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); colormap(cmap);%colormap(jet(256));
s=sprintf('$\\delta SW_{CLR}$ (%4.2f W/m2)',b); 
title(s,'FontSize',fsize,'Interpreter','latex'); set(gca,'FontSize',fsize); 

subplot(row,col,4); a=z4; b=mean(mean(a.*aa));
%a=z3+z2-z1-z0; b=mean(mean(a.*aa));
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-cmax cmax]);
contour(lon,lat,lm,1,color); colormap(cmap);%colormap(jet(256));
s=sprintf('$\\delta CRE$ (%4.2f W/m2)',b); 
title(s,'FontSize',fsize,'Interpreter','latex'); set(gca,'FontSize',fsize); 

subplot(row,col,5); a=z5; b=mean(mean(a.*aa));
%a=z3+z2-z1-z0; b=mean(mean(a.*aa));
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-cmax cmax]);
contour(lon,lat,lm,1,color); colormap(cmap);%colormap(jet(256));
s=sprintf('$\\delta LWCRE$ (%4.2f W/m2)',b); 
title(s,'FontSize',fsize,'Interpreter','latex'); set(gca,'FontSize',fsize); 

subplot(row,col,6); a=z6; b=mean(mean(a.*aa));
%a=z3+z2-z1-z0; b=mean(mean(a.*aa));
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-cmax cmax]);
contour(lon,lat,lm,1,color); colormap(cmap);%colormap(jet(256));
s=sprintf('$\\delta SWCRE$ (%4.2f W/m2)',b); 
title(s,'FontSize',fsize,'Interpreter','latex'); set(gca,'FontSize',fsize); 

expn='teach_climsen'; visfig='off'; figpath='./'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

expn='ESM4_piControl_D';                fn=strcat(tpath,expn,'/',expn,dr);load(fn);ESM.c0=v;
expn='ESM4_abrupt-4xCO2_D1';            fn=strcat(tpath,expn,'/',expn,dr);load(fn);ESM.w0=v;
tpath='/archive/Ming.Zhao/am4_spear/';
pp='/'; region='global'; dr=strcat('_',region,'_tsana_new.mat');
expn='AM4_spear_C96_O1_1850cntl_standard';       fn=strcat(tpath,expn,'/',expn,dr);load(fn);SP1.c0=v;
expn='AM4_spear_C96_O1_1850cntl_standard_4xCO2'; fn=strcat(tpath,expn,'/',expn,dr);load(fn);SP1.w0=v;
expn='AM4_spear_C96_O1_1850cntl';                fn=strcat(tpath,expn,'/',expn,dr);load(fn);SP4.c0=v;
expn='AM4_spear_C96_O1_1850cntl_4xCO2';          fn=strcat(tpath,expn,'/',expn,dr);load(fn);SP4.w0=v;

tpath='/archive/Ming.Zhao/awg/xanadu/'; dr=strcat('_',region,'_tsana_new.mat'); 
expn='c96L33_am4p0_1850climo_CM4_piControl_C';            fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.c0=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_4xCO2';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.G0=v;

expn='c96L33_am4p0_1850climo_CM4_abrupt4xCO2_C_and_4xCO2';fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.w0=v;
expn='c96L33_am4p0_1850climo_CM4_abrupt4xCO2_C';          fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.W0=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_SSTA_only';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.S0=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_SICA_only';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.I0=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_static_veg'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.V0=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_2K';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.P0=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM4_pattern_ESM2_meridional';
fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.P1=v;

expn='c96L33_am4p0_1850climo_CM4_CM4_abrupt4xCO2_C_yr26-75_4xCO2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.w1=v;
expn='c96L33_am4p0_1850climo_CM4_CM4_abrupt4xCO2_C_yr26-75';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.W1=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_SSTA_only_yr26-75';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.S1=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_SICA_only_yr26-75';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.I1=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_static_veg_yr51';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.V1=v;

expn='c96L33_am4p0_1850climo_CM4_piControl_C_dynveg';                fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.Va=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_4xCO2_photosyn_dynveg'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.Vb=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_4xCO2_dynveg';          fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.Vc=v;

%ESM.c0=CM4.c0; ESM.w0=CM4.w0; 
a41.c1=v; a41.w1=v; a41.g1=v; a41.c0=v; ;a41.w0=v;
tpath='/archive/Ming.Zhao/CM2/'; dr=strcat('_',region,'_tsana.mat'); 
expn='ESM2M_piControl';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);esm.c0=v;
expn='ESM2M_abrupt-4xCO2';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);esm.w0=v;

pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat');
tpath='/archive/Ming.Zhao/awg/warsaw/'; 
expn='c96L33_am4p0_2010climo';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v0=v;
expn='c96L33_am4p0_2010climo_p2K';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w0=v;
%fn='/archive/Ming.Zhao/awg/warsaw/c96L33_am4p0_2010climo_p2K_h1g/c96L33_am4p0_2010climo_p2K_global_tsana.mat';load(fn);am4.w0=v;
expn='c96L33_am4p0_1990climo';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v0=v;
expn='c96L33_am4p0_1990climo_p2K';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.w0=v;
tpath='/archive/Ming.Zhao/awg/AM2.1/';
expn='AM2p1_1990climo_cntl';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v0=v;
expn='AM2p1_1990climo_cntl_p2K';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.w0=v;
am4.netr_ctl=mean(am4.v0.toa.netrad.ann_stat.mmen.all);
am4.netr_p2K=mean(am4.w0.toa.netrad.ann_stat.mmen.all);
am4.ttcf_ctl=mean(am4.v0.toa.ttcf.ann_stat.mmen.all);
am4.ttcf_p2K=mean(am4.w0.toa.ttcf.ann_stat.mmen.all);
am4.tref_ctl=mean(am4.v0.sfc.tref.ann_stat.mmen.all);
am4.tref_p2K=mean(am4.w0.sfc.tref.ann_stat.mmen.all);
am4.dtref   =am4.tref_p2K-am4.tref_ctl;
am4.dnetr_dT=(am4.netr_p2K-am4.netr_ctl)/am4.dtref;
am4.dttcf_dT=(am4.ttcf_p2K-am4.ttcf_ctl)/am4.dtref;
am4.dT_cess =1/am4.dnetr_dT;

am2.netr_ctl=mean(am2.v0.toa.netrad.ann_stat.mmen.all);
am2.netr_p2K=mean(am2.w0.toa.netrad.ann_stat.mmen.all);
am2.ttcf_ctl=mean(am2.v0.toa.ttcf.ann_stat.mmen.all);
am2.ttcf_p2K=mean(am2.w0.toa.ttcf.ann_stat.mmen.all);
am2.ttcf_dif=am2.ttcf_p2K-am2.ttcf_ctl;
am2.tref_ctl=mean(am2.v0.sfc.tref.ann_stat.mmen.all);
am2.tref_p2K=mean(am2.w0.sfc.tref.ann_stat.mmen.all);
am2.dnetr_dT=(am2.netr_p2K-am2.netr_ctl)/(am2.tref_p2K-am2.tref_ctl);
am2.dttcf_dT=(am2.ttcf_p2K-am2.ttcf_ctl)/(am2.tref_p2K-am2.tref_ctl);
am2.dT_cess =1/am2.dnetr_dT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Begin of SST Pattern Simulations%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%there are two different ways to do the SST pattern experiments
% 1) dividing global mean and multiply 2K
tpath='/archive/Ming.Zhao/awg/xanadu/'; dr=strcat('_',region,'_tsana_new.mat'); 
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM4_sst_pattern_26-75yr';%AM4-CM4pattern2K-50
fn=strcat(tpath,expn,pp,expn,dr);load(fn); a40.A0=v; 
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM4_sst_pattern';%AM4-CM4pattern2K-125
fn=strcat(tpath,expn,pp,expn,dr);load(fn); a40.B0=v; 
expn='c96L33_am4p0_1850climo_CM4_piControl_C_SSTA_last_50yr_minus_yr_26-75'; %AM4-CM4pattern2K-125minus5
fn=strcat(tpath,expn,pp,expn,dr);load(fn); a40.C0=v;

expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_ESM2_sst_pattern_26_75'; %ESM2M-26-75
fn=strcat(tpath,expn,pp,expn,dr);load(fn); a40.D0=v; 
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_ESM2_sst_pattern_101_150';%ESM2M-101-150
fn=strcat(tpath,expn,pp,expn,dr);load(fn); a40.E0=v; 
expn='c96L33_am4p0_1850climo_CM4_piControl_C_SSTA_ESM2M_last_50yr_minus_yr_26-75';%ESM2M-101-150minus26-75
fn=strcat(tpath,expn,pp,expn,dr);load(fn); a40.F0=v;

% $$$ expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM4_sst_pattern_1-50yr';%CM4-1-50
% $$$ fn=strcat(tpath,expn,pp,expn,dr);load(fn); a40.A0=v; 
% $$$ expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_ESM2_sst_pattern_1_50';%ESM2M-1-50
% $$$ fn=strcat(tpath,expn,pp,expn,dr);load(fn); a40.B0=v; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ % 2) subtracting global mean and add 2K 
% $$$ tpath='/archive/Ming.Zhao/awg/xanadu/'; dr=strcat('_',region,'_tsana_new.mat'); 
% $$$ expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_SSTP_CM4_4xCO2_yr26-75';
% $$$ fn=strcat(tpath,expn,pp,expn,dr);load(fn); a40.A0=v;
% $$$ expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_SSTP_ESM2M_4xCO2_yr26-75';
% $$$ fn=strcat(tpath,expn,pp,expn,dr);load(fn); a40.B0=v;
% $$$ expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_SSTP_CM4_4xCO2_yr101-150';
% $$$ fn=strcat(tpath,expn,pp,expn,dr);load(fn); a40.C0=v; 
% $$$ expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_SSTP_ESM2M_4xCO2_yr101-150';
% $$$ fn=strcat(tpath,expn,pp,expn,dr);load(fn); a40.D0=v; 
% $$$ expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_SSTP_CM4_4xCO2_yr101-150_minus_yr26-75';
% $$$ fn=strcat(tpath,expn,pp,expn,dr);load(fn); a40.E0=v; 
% $$$ expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_SSTP_ESM2M_4xCO2_yr101-150_minus_yr26-75';
% $$$ fn=strcat(tpath,expn,pp,expn,dr);load(fn); a40.F0=v; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%end of SST Pattern Simulations%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure; pcolor(a40.I0.sfc.ice.tavg0-a40.I1.sfc.ice.tavg0); 
shading flat; colorbar; caxis([-0.05 0.05]); colormap(jet);
figure; pcolor(a40.V0.sfc.lai.tavg0-a40.V1.sfc.lai.tavg0); 
shading flat; colorbar; caxis([-0.05 0.05]); colormap(jet);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Explore effect of SST pattern with global mean SST normalized to p2K
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM4_sst_pattern_1-50yr';%CM4-1-50yrSST
fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.A0=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_ESM2_sst_pattern_1_50';%ESM2-1-50yrSST
fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.B0=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM4_sst_pattern';%CM4-100-150yrSST
fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.C0=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_ESM2_sst_pattern_101_150';%ESM2-100-150yrSST
fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.D0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM4_last50_minus_first50_sst_pattern_new'; 
fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.E0=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_historical_pattern';
fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.H0=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM2_sst_pattern';
fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.F0=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_CM4_zonal_mean_SSTA';
fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.X0=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_p2K_ESM2_zonal_mean_SSTA';
fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.X0=v;

%expn='c96L33_am4p0_1850climo_CM4_abrupt4xCO2_C_noSSTA';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.S1=v;
%expn='c96L33_am4p0_1850climo_CM4_abrupt4xCO2_C_noSICA';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.I1=v;
%expn='c96L33_am4p0_1850climo_CM4_abrupt4xCO2_C_ctl_static_veg';fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.V1=v;     
%%expn='c96L33_am4p0_1850climo_CM4_abrupt4xCO2_C_m2.7K';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.P1=v;
%expn='c96L33_am4p0_1850climo_CM4_abrupt4xCO2_C_noSSTP';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.P1=v;

% $$$ tpath='/archive/Ming.Zhao/awg/xanadu/'; dr=strcat('_',region,'_tsana_new.mat'); 
% $$$ expn='c96L33_am4p0_2010climo_old';                   fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.c1=v;
% $$$ expn='c96L33_am4p0_2010climo_p2K_old';               fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.w1=v;
% $$$ expn='c96L33_am4p0_2010climo_p2K_hist_pattern_only'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.w2=v;
% $$$ expn='c96L33_am4p0_2010climo_2xCO2_old';             fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.g1=v;
% $$$ expn='c96L33_am4p0_2010climo_new';                   fn=strcat(tpath,expn,pp,expn,dr);load(fn);a40.c2=v;
a41.c1=v; a41.w1=v; a41.g1=v; a41.c0=v; ;a41.w0=v;
tpath='/archive/Ming.Zhao/ESM4/DECK/'; dr=strcat('_',region,'_tsana_new.mat'); 
expn='ESM4_amip_D1_1850climo';          fn=strcat(tpath,expn,pp,expn,dr);load(fn);a41.c1=v;
expn='ESM4_amip_D1_1850climo_p2K';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);a41.w1=v;
expn='ESM4_amip_D1_1850climo_4xCO2';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);a41.g1=v;

%expn='CM4_c192L33_am4p0_1950Control_new';      fn=strcat(tpath,expn,dr);load(fn);CM4h.c0=v;
%expn='CM4_c192L33_am4p0_1950Control_new_4xCO2';fn=strcat(tpath,expn,dr);load(fn);CM4h.w0=v;
tpath='/work/miz/mat_hiresmip/'; %tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
dr=strcat('_',region,'_opt1.tsana.mat'); 
expn='ESM4_amip_D1';                    fn=strcat(tpath,expn,dr);load(fn);a41.c0=v;
expn='ESM4_amip-p4K';                   fn=strcat(tpath,expn,dr);load(fn);a41.w0=v;
a40.Vb.toa.lwnet.ts.org_ann+a40.Vb.toa.swnet.ts.org_ann-a40.Vb.toa.netrad.ts.org_ann


vname='Fig6n'; xy=[-90 90 -2.5 1.5]; xy1=[-90 90 -3 3];
pms=[ 0, 0, 1200, 1000]*1; fsize=9.5; lw=1; s0='(%4.2f)';
handle = figure('Position', pms,'visible','on'); row=2; col=2;
ss1='CM4.0'; ss2='SPEAR'; ss3='SPEAR-SV'; minus=char(8212);
ss4=sprintf('CM4.0 %c SPEAR',minus);
ss5=sprintf('SPEAR %c SPEAR-SV',minus);
ss6=sprintf('CM4.0 %c SPEAR-SV',minus);
subplot(row,col,1)
y1=CM4.w0.sfc.lai.ts.org_ann-mean(CM4.c0.sfc.lai.ts.org_ann);
y2=SP1.w0.sfc.lai.ts.org_ann-mean(SP1.c0.sfc.lai.ts.org_ann);
y3=SP4.w0.sfc.lai.ts.org_ann-mean(SP4.c0.sfc.lai.ts.org_ann);
y4=a40.Vb.sfc.lai.ts.org_ann-mean(a40.c0.sfc.lai.ts.org_ann);
plot(y1,'r'); hold on; plot(y2,'g'); plot(y3,'b'); plot(y4,'k');
subplot(row,col,2)
y1=CM4.w0.toa.netrad.ts.org_ann-mean(CM4.c0.toa.netrad.ts.org_ann);%-8.23;
y2=SP1.w0.toa.netrad.ts.org_ann-mean(SP1.c0.toa.netrad.ts.org_ann);%-8.23;
y3=SP4.w0.toa.netrad.ts.org_ann-mean(SP4.c0.toa.netrad.ts.org_ann);%-8.23;
y4=a40.Vb.toa.netrad.ts.org_ann-mean(a40.c0.toa.netrad.ts.org_ann);
plot(y1,'r'); hold on; plot(y2,'g'); plot(y3,'b'); plot(y4,'k');
subplot(row,col,3)
%y1=CM4.w0.toa.netrad.ts.org_ann-mean(CM4.c0.toa.netrad.ts.org_ann)-8.23;
y1=(SP1.w0.toa.netrad.ts.org_ann-mean(SP1.c0.toa.netrad.ts.org_ann))-8.23;
y2=(SP1.w0.sfc.tref.ts.org_ann  -mean(SP1.c0.sfc.tref.ts.org_ann));
y3=(SP4.w0.toa.netrad.ts.org_ann-mean(SP4.c0.toa.netrad.ts.org_ann))-8.23;
y4=(SP4.w0.sfc.tref.ts.org_ann  -mean(SP4.c0.sfc.tref.ts.org_ann));
y5=a40.Vb.toa.netrad.ts.org_ann-mean(a40.c0.toa.netrad.ts.org_ann);
plot(y1./y2-y3./y4,'r'); hold on; %plot(y3./y4,'b');
plot(y5,'g'); %plot(y3,'b'); plot(y4,'k');

%plot(a40.G0.toa.netrad.ts.org_ann-mean(a40.c0.toa.netrad.ts.org_ann),'r');hold on;
plot(a40.Va.toa.netrad.ts.org_ann-mean(a40.c0.toa.netrad.ts.org_ann),'g');hold on;
plot(a40.Vb.toa.netrad.ts.org_ann-mean(a40.c0.toa.netrad.ts.org_ann),'b');
subplot(row,col,3)
plot(a40.G0.sfc.tref.ts.org_ann-mean(a40.c0.sfc.tref.ts.org_ann),'r');hold on;
plot(a40.Va.sfc.tref.ts.org_ann-mean(a40.c0.sfc.tref.ts.org_ann),'g');hold on;
plot(a40.Vb.sfc.tref.ts.org_ann-mean(a40.c0.sfc.tref.ts.org_ann),'b');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load: LAI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
v=a40.c0; z0=v.sfc.lai.tavg0; y0=v.sfc.lai.ts.org_ann; x0=v.toa.netrad.ts.org_ann;
v=a40.Va; za=v.sfc.lai.tavg0; ya=v.sfc.lai.ts.org_ann; xa=v.toa.netrad.ts.org_ann;
v=a40.Vb; zb=v.sfc.lai.tavg0; yb=v.sfc.lai.ts.org_ann; xb=v.toa.netrad.ts.org_ann;
pms=[ 0, 0, 900, 700]*1.5; fsize=10; 
row=3; col=3; i=1; cmin=-1; cmax=6; co='w'; 
handle=figure('Position',pms,'visible','on');
subplot(row,col,i); a=z0; sx=let(i); i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; %caxis([cmin cmax]);
contour(lon,lat,lm,1,co); colormap(jet);
subplot(row,col,2); a=za; sx=let(i); i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; %caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 
subplot(row,col,3); a=zb; sx=let(i); i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; %caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 
subplot(row,col,4); a=za-z0; sx=let(i); i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; %caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 
subplot(row,col,5); a=zb-z0; sx=let(i); i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-5 5]);
contour(lon,lat,lm,1,co); 



figure; plot(CM4.c0.sfc.lai.ts.org_ann); hold on; plot(CM4.w0.sfc.lai.ts.org_ann,'r');
figure; plot(CM4.c0.sfc.ice.ts.org_ann); hold on; plot(CM4.w0.sfc.ice.ts.org_ann,'r');
v=a40.c0; d.lai_a40_c0=v.sfc.lai.tavg0; a=d.lai0;
v=a40.V0; d.lai_a40_V0=v.sfc.lai.tavg0;
v=CM4.c0; d.lai_CM4_c0=squeeze(mean(v.sfc.lai.ann(1:20,:,:),1));
v=CM4.w0; d.lai_CM4_w0=squeeze(mean(v.sfc.lai.ann(1:20,:,:),1));
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0;

let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
pms=[ 0, 0, 900, 700]*1.5; fsize=10; 
row=3; col=3; cmin=-1; cmax=6; co='w';
handle=figure('Position',pms,'visible','on');
subplot(row,col,i); a=d.lai_a40_c0; sx=let(i); i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; %caxis([cmin cmax]);
contour(lon,lat,lm,1,co); colormap(jet);
subplot(row,col,2); a=d.lai_a40_V0; sx=let(i); i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; %caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 
subplot(row,col,3); a=d.lai_a40_V0-d.lai_a40_c0; sx=let(i); i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; %caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%New Fig1!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%dT=esm2.w0.sfc.tref.ann_stat.mmen.all  -mean(esm2.c0.sfc.tref.ann_stat.mmen.all);
%dN=esm2.w0.toa.netrad.ann_stat.mmen.all-mean(esm2.c0.toa.netrad.ann_stat.mmen.all);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='Fig1'; %LATEST===FIG1===
t1=1; t2=20; t3=30;%1st 100yr control, ann_stat contain 5-year annual mean
d=get_tref_netrad_ts(CM4,esm,SP1,SP4,a40,a41,t1,t2,t3,1);
pms=[ 0, 0, 800, 1500]*0.65; fsize=8; msize=8; lw=1; ls1='-'; ls2='--';
handle=figure('Position',pms,'visible','on'); row=2; col=1;
hAxis(1)=subplot(row,col,1); pos = get( hAxis(1), 'Position' )
pos(2) = 0.58 ;  % Shift down.
pos(4) = 0.4 ; % Increase height.
set( hAxis(1), 'Position', pos );
ax1=gca; x0=[2.5:5:150]; x1=[2.5:5:300]; x2=[101 150]; x3=[26 75];
line(x0,d.dT1,'Color','r','LineWidth',lw,'LineStyle',ls1); hold on;
line(x0,d.dT3,'Color','b','LineWidth',lw,'LineStyle',ls1); hold on;
line(x0,d.dT4,'Color','c','LineWidth',lw,'LineStyle',ls1); hold on;
line(x0,d.dT2,'Color','k','LineWidth',lw,'LineStyle',ls1); hold on;
line(x3,d.dT6,'Color','g','LineWidth',lw,'LineStyle',ls1); hold on;
line(x2,d.dT5,'Color','m','LineWidth',lw,'LineStyle',ls1); hold on;
line([100 100],[1 10],'Color','k','LineWidth',lw,'LineStyle',':');
line([150 150],[1 10],'Color','k','LineWidth',lw,'LineStyle',':');
line([25 25],  [1 10],'Color','k','LineWidth',lw,'LineStyle',':');
line([75 75],  [1 10],'Color','k','LineWidth',lw,'LineStyle',':');
legend('CM4.0','SPEAR','SPEAR-SV','AM4-CM4-4xCO2-50','AM4-CM4-4xCO2-125','location','southwest'); 
legend('CM4.0','SPEAR','SPEAR-SV','ESM2M','AM4-CM4-4xCO2-50','AM4-CM4-4xCO2-125','location','southwest'); 
axis([0 150 1 6.5]); %box on; %set(gca,'FontSize',fsize); 
xl='year'; yl='change in surface air temperature ($\delta T_g$, K)'; 
xlabel(xl,'FontSize',fsize,'Interpreter','latex');
ylabel(yl,'FontSize',fsize,'Interpreter','latex');
set(gca,'FontSize',fsize); %title('(a)','FontSize',fsize); grid on;
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','k');
line(x0,d.dN1,'Color','r','LineWidth',lw,'LineStyle',ls2); hold on;
line(x0,d.dN3,'Color','b','LineWidth',lw,'LineStyle',ls2); hold on;
line(x0,d.dN4,'Color','c','LineWidth',lw,'LineStyle',ls2); hold on;
line(x0,d.dN2,'Color','k','LineWidth',lw,'LineStyle',ls2); hold on;
line(x3,d.dN6,'Color','g','LineWidth',lw,'LineStyle',ls2); hold on;
line(x2,d.dN5,'Color','m','LineWidth',lw,'LineStyle',ls2); hold on;
legend('CM4.0','SPEAR','SPEAR-SV','AM4-W1-4xCO2','AM4-W2-4xCO2','location','southeast'); 
legend('CM4.0','SPEAR','SPEAR-SV','ESM2M','AM4-CM4-4xCO2-50','AM4-CM4-4xCO2-125','location','southeast'); 
yl='change in net TOA radiative flux ($\delta N_g$, W/m2)'; 
ylabel(yl,'FontSize',fsize,'Interpreter','latex');
set(gca,'FontSize',fsize); xy=[0 150 -0.5 5.5]; mylabel(xy,1,'(a)',12);box on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%New Fig1b: Gregory plot dN vs dTs for ECS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hAxis(2)=subplot(row,col,2); pos = get( hAxis(2), 'Position' )
pos(2) = 0.095 ; % Shift down.
pos(4) = 0.4 ;   % Increase height.
set( hAxis(2), 'Position', pos ) ;
%hAxis(2)=subplot(row,col,2); pos = get( hAxis(2), 'Position' )
%pos(2) = 0.10 ; % Shift down.
%pos(4) = 0.4 ;  % Increase height.
%set( hAxis(2), 'Position', pos ) ;
t1=1; t2=20; t3=30; opt=1; %1st 100yr control, ann_stat contain 5-year annual mean
d=get_tref_netrad_ts(CM4,esm,SP1,SP4,a40,a41,t1,t2,t3,opt);
t1=1;  t2=10; x1 =getcorrslop(d.dT1(t1:t2),d.dN1(t1:t2));
t1=11; t2=30; xx1=getcorrslop(d.dT1(t1:t2),d.dN1(t1:t2));
t1=1;  t2=10; x3 =getcorrslop(d.dT3(t1:t2),d.dN3(t1:t2));
t1=11; t2=30; xx3=getcorrslop(d.dT3(t1:t2),d.dN3(t1:t2));
t1=1;  t2=10; x4 =getcorrslop(d.dT4(t1:t2),d.dN4(t1:t2));
t1=11; t2=30; xx4=getcorrslop(d.dT4(t1:t2),d.dN4(t1:t2));
t1=1;  t2=10; x2 =getcorrslop(d.dT2(t1:t2),d.dN2(t1:t2));
t1=11; t2=30; xx2=getcorrslop(d.dT2(t1:t2),d.dN2(t1:t2));
%t1=1;  t2=10; x5 =getcorrslop(dT   (t1:t2),dN   (t1:t2));
%t1=11; t2=30; xx5=getcorrslop(dT   (t1:t2),dN   (t1:t2));
%dT6=mean(a40.w0.sfc.tref.ann_stat.mmen.all)  -mean(a40.c0.sfc.tref.ann_stat.mmen.all);
%dN6=mean(a40.w0.toa.netrad.ann_stat.mmen.all)-mean(a40.c0.toa.netrad.ann_stat.mmen.all);
%dT6=290.439-mean(a40.c0.sfc.tref.ann_stat.mmen.all);
%dN6=2.83   -mean(a40.c0.toa.netrad.ann_stat.mmen.all);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(d.dT1,d.dN1, 'r.','MarkerSize',msize); hold on; 
plot(d.dT3,d.dN3, 'b.','MarkerSize',msize); hold on; 
plot(d.dT4,d.dN4, 'c.','MarkerSize',msize); hold on; 
plot(d.dT2,d.dN2, 'k.','MarkerSize',msize); hold on; 
plot(d.dT6,d.dN6, 'g+','MarkerSize',msize+4,'LineWidth',lw);
plot(d.dT5,d.dN5, 'm+','MarkerSize',msize+4,'LineWidth',lw);
v=x1;  plot(v.xa,v.ya,'r--','LineWidth',lw);
v=xx1; plot(v.xb,v.yb,'r-', 'LineWidth',lw);
v=x3;  plot(v.xa,v.ya,'b--','LineWidth',lw);
v=xx3; plot(v.xb,v.yb,'b-', 'LineWidth',lw);
v=x4;  plot(v.xa,v.ya,'c--','LineWidth',lw);
v=xx4; plot(v.xb,v.yb,'c-', 'LineWidth',lw);
v=x2;  plot(v.xa,v.ya,'k--','LineWidth',lw);
v=xx2; plot(v.xb,v.yb,'k-', 'LineWidth',lw);
%title('(b)','FontSize',fsize); %plot([0 20],[0 0],'k-');
legend('CM4.0','SPEAR','SPEAR-SV','AM4-W1-4xCO2','AM4-W2-4xCO2','location','southwest');
legend('CM4.0','SPEAR','SPEAR-SV','ESM2M','AM4-CM4-4xCO2-50','AM4-CM4-4xCO2-125','location','best');
xl='change in surface air temperature ($\delta T_g$, K)';
yl='change in net TOA radiative flux ($\delta N_g$, W/m2)';
xlabel(xl,'FontSize',fsize,'Interpreter','latex');
ylabel(yl,'FontSize',fsize,'Interpreter','latex');
xy=[0 10 0 8]; mylabel(xy,1,'(b)',12); set(gca,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%New Fig1a: dTs and dN 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%dT=esm2.w0.sfc.tref.ann_stat.mmen.all  -mean(esm2.c0.sfc.tref.ann_stat.mmen.all);
%dN=esm2.w0.toa.netrad.ann_stat.mmen.all-mean(esm2.c0.toa.netrad.ann_stat.mmen.all);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_dnetradtoa_ts_new'; 
t1=1; t2=20; t3=30;%1st 100yr control, ann_stat contain 5-year annual mean
d=get_tref_netrad_ts(CM4,ESM,SP1,SP4,a40,a41,t1,t2,t3,1);
pms=[ 0, 0, 900, 700]*0.65; fsize=10; msize=11; lw=1; ls1='-'; ls2='--';
handle=figure('Position',pms,'visible','on');
ax1=gca; x0=[2.5:5:150]; x1=[2.5:5:300]; x2=[101 150]; x3=[26 75];
line(x0,d.dT1,'Color','r','LineWidth',lw,'LineStyle',ls1); hold on;
%line(x1,d.dT2,'Color','k','LineWidth',lw,'LineStyle',ls1); hold on;
line(x0,d.dT3,'Color','b','LineWidth',lw,'LineStyle',ls1); hold on;
line(x0,d.dT4,'Color','c','LineWidth',lw,'LineStyle',ls1); hold on;
line(x3,d.dT6,'Color','k','LineWidth',lw,'LineStyle',ls1); hold on;
line(x2,d.dT5,'Color','m','LineWidth',lw,'LineStyle',ls1); hold on;
line([100 100],[1 10],'Color','k','LineWidth',lw,'LineStyle',':');
line([150 150],[1 10],'Color','k','LineWidth',lw,'LineStyle',':');
line([25 25],  [1 10],'Color','k','LineWidth',lw,'LineStyle',':');
line([75 75],  [1 10],'Color','k','LineWidth',lw,'LineStyle',':');
legend('CM4.0','SPEAR','SPEAR-SV','AM4-W1-4xCO2','AM4-W2-4xCO2','location','southwest'); 
%legend('CM4.0','SPEAR','SPEAR-SV','ESM2M','AM4.0-W-4xCO2','location','southwest'); 
%legend('CM4 (150yr)','SPEAR (200yr)','ESM4 (300yr)',0);grid on;
axis([0 150 1 6.5]); box on; %set(gca,'FontSize',fsize); 
xl='year'; xlabel(xl,'FontSize',fsize); 
yl='change in surface air temperature (K)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title('(a)','FontSize',fsize); grid on;
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','k');
line(x0,d.dN1,'Color','r','LineWidth',lw,'LineStyle',ls2); hold on;
%line(x1,d.dN2,'Color','k','LineWidth',lw,'LineStyle',ls2); hold on;
line(x0,d.dN3,'Color','b','LineWidth',lw,'LineStyle',ls2); hold on;
line(x0,d.dN4,'Color','c','LineWidth',lw,'LineStyle',ls2); hold on;
line(x3,d.dN6,'Color','k','LineWidth',lw,'LineStyle',ls2); hold on;
line(x2,d.dN5,'Color','m','LineWidth',lw,'LineStyle',ls2); hold on;
%legend('CM4.0','SPEAR','SPEAR-SV','ESM2M','AM4.0-W-4xCO2','location','southeast'); 
legend('CM4.0','SPEAR','SPEAR-SV','AM4-W1-4xCO2','AM4-W2-4xCO2','location','southeast'); 
yl='change in net TOA radiative flux (W/m2)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); xy=[0 150 -0.5 5.5]; mylabel(xy,1,'(a)',12);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%New Fig1b: Gregory plot dN vs dTs for ECS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dT=esm2.w0.sfc.tref.ann_stat.mmen.all  -mean(esm2.c0.sfc.tref.ann_stat.mmen.all);
dN=esm2.w0.toa.netrad.ann_stat.mmen.all-mean(esm2.c0.toa.netrad.ann_stat.mmen.all);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='greg_netradtoa_ts';
t1=1; t2=20; t3=30;%1st 100yr control, ann_stat contain 5-year annual mean
d=get_tref_netrad_ts(CM4,ESM,SP1,SP4,a40,a41,t1,t2,t3,1);
t1=1;  t2=10; x1 =getcorrslop(d.dT1(t1:t2),d.dN1(t1:t2));
t1=11; t2=30; xx1=getcorrslop(d.dT1(t1:t2),d.dN1(t1:t2));
t1=1;  t2=10; x2 =getcorrslop(d.dT2(t1:t2),d.dN2(t1:t2));
t1=11; t2=60; xx2=getcorrslop(d.dT2(t1:t2),d.dN2(t1:t2));
t1=1;  t2=10; x3 =getcorrslop(d.dT3(t1:t2),d.dN3(t1:t2));
t1=11; t2=30; xx3=getcorrslop(d.dT3(t1:t2),d.dN3(t1:t2));
t1=1;  t2=10; x4 =getcorrslop(d.dT4(t1:t2),d.dN4(t1:t2));
t1=11; t2=30; xx4=getcorrslop(d.dT4(t1:t2),d.dN4(t1:t2));
%t1=1;  t2=10; x5 =getcorrslop(dT   (t1:t2),dN   (t1:t2));
%t1=11; t2=30; xx5=getcorrslop(dT   (t1:t2),dN   (t1:t2));
%dT6=mean(a40.w0.sfc.tref.ann_stat.mmen.all)  -mean(a40.c0.sfc.tref.ann_stat.mmen.all);
%dN6=mean(a40.w0.toa.netrad.ann_stat.mmen.all)-mean(a40.c0.toa.netrad.ann_stat.mmen.all);
%dT6=290.439-mean(a40.c0.sfc.tref.ann_stat.mmen.all);
%dN6=2.83   -mean(a40.c0.toa.netrad.ann_stat.mmen.all);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 900, 700]*0.65; fsize=11; msize=12; lw=1;
handle=figure('Position',pms,'visible','on');
plot(d.dT1,d.dN1, 'r.','MarkerSize',msize); hold on; 
%plot(d.dT2,d.dN2, 'k.','MarkerSize',msize); hold on; 
plot(d.dT3,d.dN3, 'b.','MarkerSize',msize); hold on; 
plot(d.dT4,d.dN4, 'c.','MarkerSize',msize); hold on; 
%plot(dT,   dN,    'k.','MarkerSize',msize, 'LineWidth',lw);
plot(d.dT6,d.dN6, 'k+','MarkerSize',msize+4,'LineWidth',lw);
plot(d.dT5,d.dN5, 'm+','MarkerSize',msize+4,'LineWidth',lw);
v=x1;  plot(v.xa,v.ya,'r--','LineWidth',lw);
v=xx1; plot(v.xb,v.yb,'r-', 'LineWidth',lw);
%v=x2;  plot(v.xa,v.ya,'k--','LineWidth',lw);
%v=xx2; plot(v.xb,v.yb,'k-', 'LineWidth',lw);
v=x3;  plot(v.xa,v.ya,'b--','LineWidth',lw);
v=xx3; plot(v.xb,v.yb,'b-', 'LineWidth',lw);
v=x4;  plot(v.xa,v.ya,'c--','LineWidth',lw);
v=xx4; plot(v.xb,v.yb,'c-', 'LineWidth',lw);
%v=x5;  plot(v.xa,v.ya,'k--','LineWidth',lw);
%v=xx5; plot(v.xb,v.yb,'k-', 'LineWidth',lw);
%title('(b)','FontSize',fsize); %plot([0 20],[0 0],'k-');
%legend('CM4.0','SPEAR','SPEAR-SV','ESM2M','AM4.0-W-4xCO2','location','southwest');
legend('CM4.0','SPEAR','SPEAR-SV','AM4-W1-4xCO2','AM4-W2-4xCO2','location','southwest');
xlabel('change in surface air temperature (K)','FontSize',fsize); 
ylabel('change in net TOA radiative flux (W/m2)','FontSize',fsize);
xy=[0 10 0 8]; mylabel(xy,1,'(b)',12); set(gca,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%LATEST===FIG2=== Fig2_12panel: surface air temperature warming map%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_map_12panel'; vname='Fig2'; opt=0; unit='K';
%t1=101; t2=150; d =gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
t1=26;  t2=75;  d1=gettref(CM4,esm,SP1,SP4,a40,a41,t1,t2,opt);
t1=101; t2=150; d2=gettref(CM4,esm,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
cmin=0.; cmax=12; cmin1=-3; cmax1=3; cmin2=-3; cmax2=3; co='k';
pms=[ 0, 0, 1600, 1200]*0.7; fsize=8; row=4; col=3;
handle = figure('Position', pms,'visible','on'); minus=char(8212); 
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet(256));
subplot(row,col,1); d=d1; a=d.w1.av-d.c1.av; b=d.T1; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(a) $\\delta T $ (Y50; %4.2f K); CM4.0',b); 
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,2); d=d2; a=d.w1.av-d.c1.av; b=d.T1; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(b) $\\delta T $ (Y125; %4.2f K); CM4.0',b);
title(s,'FontSize',fsize,'Interpreter','latex');

cb0=colorbar('FontSize',fsize+2,'Location','westoutside');
set(cb0, 'Position', [0.08 0.77 0.02 0.15]); caxis([cmin, cmax]); 
cb0.Label.String = unit; pos=get(cb0,'Position')
cb0.Label.Position = [pos(1)+0.5 pos(2)+12]; 
cb0.Label.Rotation = 0;

subplot(row,col,3); a=a2-a1; b=b2-b1; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(c) $\\delta T $ (Y125 $-$ Y50; %4.2f K); CM4.0',b);
title(s,'FontSize',fsize,'Interpreter','latex');

%-------------------------
subplot(row,col,4); d=d1; a=d.w3.av-d.c3.av; b=d.T3; a4=a; b4=b;
pcolor(lon,lat,a1-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(d) $\\delta T $ (Y50; %4.2f K); CM4.0 $-$ SPEAR',b1-b);
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,5); d=d2; a=d.w3.av-d.c3.av; b=d.T3; a5=a; b5=b;
pcolor(lon,lat,a2-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(e) $\\delta T $ (Y125; %4.2f K); CM4.0 $-$ SPEAR',b2-b);
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,6); a=a5-a4; b=b5-b4; a6=a; b6=b;
pcolor(lon,lat,a3-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('(f) $\\delta T $ (Y125 $-$ Y50; %4.2f K); CM4.0 $-$ SPEAR',b3-b);
title(s,'FontSize',fsize,'Interpreter','latex');

%-------------------------
subplot(row,col,7); d=d1; a=d.w4.av-d.c4.av; b=d.T4; a7=a; b7=b;
pcolor(lon,lat,a4-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('(g) $\\delta T $ (Y50; %4.2f K); SPEAR $-$ SPEAR-SV',b4-b);
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,8); d=d2; a=d.w4.av-d.c4.av; b=d.T4; a8=a; b8=b;
pcolor(lon,lat,a5-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('(h) $\\delta T $ (Y125; %4.2f K); SPEAR $-$ SPEAR-SV',b5-b);
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,9); a=a8-a7; b=b8-b7; a9=a; b9=b;
pcolor(lon,lat,a6-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('(i) $\\delta T $ (Y125 $-$ Y50; %4.2f K); SPEAR $-$ SPEAR-SV',b6-b);
title(s,'FontSize',fsize,'Interpreter','latex');

%-------------------------
subplot(row,col,10); d=d1; a=d.w2.av-d.c2.av; b=d.T2; a10=a; b10=b;
pcolor(lon,lat,a1-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(j) $\\delta T $ (Y50; %4.2f K); CM4.0 $-$ ESM2M',b1-b);
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,11); d=d2; a=d.w2.av-d.c2.av; b=d.T2; a11=a; b11=b;
pcolor(lon,lat,a2-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(k) $\\delta T $ (Y125; %4.2f K); CM4.0 $-$ ESM2M',b2-b);
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,12); a=a11-a10; b=b11-b10; a12=a; b12=b;
pcolor(lon,lat,a3-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('(l) $\\delta T $ (Y125 $-$ Y50; %4.2f K); CM4.0 $-$ ESM2M',b3-b);
title(s,'FontSize',fsize,'Interpreter','latex');
%----------------------------
cb1=colorbar('FontSize',fsize+2,'Location','southoutside');
set(cb1, 'Position', [.22 .04 .6 .02]); caxis([cmin1, cmax1]); 
cb1.Label.String = unit; pos=get(cb1,'Position')
cb1.Label.Position = [pos(1)-0.2 pos(2)+2]; 

expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%LATEST===FIGS1=== FigS1: SST anomalies map%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dsst_map_12panel'; vname='FigS1'; opt=0; unit='K';
%t1=101; t2=150;d =getsst(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
t1=26;  t2=75;  d1=getsst(CM4,esm,SP1,SP4,a40,a41,t1,t2,opt);
t1=101; t2=150; d2=getsst(CM4,esm,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa; a=0.01;
id=(lm>0.5)|(CM4.c0.sfc.ice.tavg0>a)|(SP1.c0.sfc.ice.tavg0>a)|(SP4.c0.sfc.ice.tavg0>a);
cmin=0.; cmax=12; cmin1=-3; cmax1=3; cmin2=-3; cmax2=3; co='k';
pms=[ 0, 0, 1600, 1200]*0.7; fsize=8; row=4; col=3;
handle = figure('Position', pms,'visible','on'); minus=char(8212); 
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet(256));
subplot(row,col,1); d=d1; a=d.w1.av-d.c1.av; b=d.T1; a1=a; b1=b;a(id)=NaN;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(a) $\\delta SST $ (Y50); CM4.0'); 
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,2); d=d2; a=d.w1.av-d.c1.av; b=d.T1; a2=a; b2=b;a(id)=NaN;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(b) $\\delta SST $ (Y125); CM4.0');
title(s,'FontSize',fsize,'Interpreter','latex');

cb0=colorbar('FontSize',fsize+2,'Location','westoutside');
set(cb0, 'Position', [0.08 0.77 0.02 0.15]); caxis([cmin, cmax]); 
cb0.Label.String = unit; pos=get(cb0,'Position')
cb0.Label.Position = [pos(1)+0.5 pos(2)+12]; 
cb0.Label.Rotation = 0;

subplot(row,col,3); a=a2-a1; b=b2-b1; a3=a; b3=b;a(id)=NaN;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(c) $\\delta SST $ (Y125 $-$ Y50); CM4.0');
title(s,'FontSize',fsize,'Interpreter','latex');

%-------------------------
subplot(row,col,4); d=d1; a=d.w3.av-d.c3.av; b=d.T3; a4=a; b4=b;a(id)=NaN;
pcolor(lon,lat,a1-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(d) $\\delta SST $ (Y50); CM4.0 $-$ SPEAR');
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,5); d=d2; a=d.w3.av-d.c3.av; b=d.T3; a5=a; b5=b;a(id)=NaN;
pcolor(lon,lat,a2-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(e) $\\delta SST $ (Y125); CM4.0 $-$ SPEAR');
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,6); a=a5-a4; b=b5-b4; a6=a; b6=b;a(id)=NaN;
pcolor(lon,lat,a3-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('(f) $\\delta SST $ (Y125 $-$ Y50); CM4.0 $-$ SPEAR');
title(s,'FontSize',fsize,'Interpreter','latex');

%-------------------------
subplot(row,col,7); d=d1; a=d.w4.av-d.c4.av; b=d.T4; a7=a; b7=b;a(id)=NaN;
pcolor(lon,lat,a4-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('(g) $\\delta SST $ (Y50); SPEAR $-$ SPEAR-SV');
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,8); d=d2; a=d.w4.av-d.c4.av; b=d.T4; a8=a; b8=b;a(id)=NaN;
pcolor(lon,lat,a5-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('(h) $\\delta SST $ (Y125); SPEAR $-$ SPEAR-SV');
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,9); a=a8-a7; b=b8-b7; a9=a; b9=b;a(id)=NaN;
pcolor(lon,lat,a6-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('(i) $\\delta SST $ (Y125 $-$ Y50); SPEAR $-$ SPEAR-SV');
title(s,'FontSize',fsize,'Interpreter','latex');

%-------------------------
subplot(row,col,10); d=d1; a=d.w2.av-d.c2.av; b=d.T2; a10=a; b10=b;a(id)=NaN;
pcolor(lon,lat,a1-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(j) $\\delta SST $ (Y50); CM4.0 $-$ ESM2M');
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,11); d=d2; a=d.w2.av-d.c2.av; b=d.T2; a11=a; b11=b;a(id)=NaN;
pcolor(lon,lat,a2-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(k) $\\delta SST $ (Y125); CM4.0 $-$ ESM2M');
title(s,'FontSize',fsize,'Interpreter','latex');

subplot(row,col,12); a=a11-a10; b=b11-b10; a12=a; b12=b;a(id)=NaN;
pcolor(lon,lat,a3-a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('(l) $\\delta SST $ (Y125 $-$ Y50); CM4.0 $-$ ESM2M');
title(s,'FontSize',fsize,'Interpreter','latex');
%----------------------------
cb1=colorbar('FontSize',fsize+2,'Location','southoutside');
set(cb1, 'Position', [.22 .04 .6 .02]); caxis([cmin1, cmax1]); 
cb1.Label.String = unit; pos=get(cb1,'Position')
cb1.Label.Position = [pos(1)-0.2 pos(2)+2]; 

expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%New Fig2_12panel: surface air temperature warming map%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_map_12panel'; vname='Fig2o'; opt=0;
%t1=101; t2=150; d =gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
t1=26;  t2=75;  d1=gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
t1=101; t2=150; d2=gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
cmin=0.; cmax=12; cmin1=-1.2; cmax1=1.2; cmin2=-1.2; cmax2=1.2; co='k';
pms=[ 0, 0, 1600, 1200]*0.7; fsize=8; row=4; col=3;
handle = figure('Position', pms,'visible','on'); minus=char(8212); 
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet(256));
subplot(row,col,1); d=d1; a=d.w1.av-d.c1.av; b=d.T1; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(a) \\DeltaSAT CM4.0 (Y50; %4.2f K)',b); title(s,'FontSize',fsize);
subplot(row,col,2); d=d2; a=d.w1.av-d.c1.av; b=d.T1; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(b) \\DeltaSAT CM4.0 (Y125; %4.2f K)',b); title(s,'FontSize',fsize);
subplot(row,col,3); a=a2-a1; b=b2-b1;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(c) (b) %c (a) (%4.2f K)',minus,b); title(s,'FontSize',fsize);
%-------------------------
subplot(row,col,4); d=d1; a=d.w3.av-d.c3.av; b=d.T3; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(d) \\DeltaSAT SPEAR (Y50; %4.2f K)',b); title(s,'FontSize',fsize);
subplot(row,col,5); d=d2; a=d.w3.av-d.c3.av; b=d.T3; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(e) \\DeltaSAT SPEAR (Y125; %4.2f K)',b); title(s,'FontSize',fsize);
subplot(row,col,6); a=a5-a4; b=b5-b4; a6=a; b6=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(f) (e) %c (d) (%4.2f K)',minus,b); title(s,'FontSize',fsize);
%-------------------------
subplot(row,col,7); d=d1; a=d.w4.av-d.c4.av; b=d.T4; a7=a; b7=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(g) \\DeltaSAT SPEAR-SV (Y50; %4.2f K)',b); title(s,'FontSize',fsize);
subplot(row,col,8); d=d2; a=d.w4.av-d.c4.av; b=d.T4; a8=a; b8=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(h) \\DeltaSAT SPEAR-SV (Y125; %4.2f K)',b); title(s,'FontSize',fsize);

cb0=colorbar('FontSize',fsize+2,'Location','westoutside');
set(cb0, 'Position', [0.08 0.35 0.02 0.55]); caxis([cmin, cmax]); 
cb0.Label.String = unit; pos=get(cb0,'Position')
cb0.Label.Position = [pos(1)+0.5 pos(2)+12]; 
cb0.Label.Rotation = 0;

subplot(row,col,9); a=a8-a7; b=b8-b7; a9=a; b9=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(i) (h) %c (g) (%4.2f K)',minus,b); title(s,'FontSize',fsize);
%----------------------------
subplot(row,col,10); a=a4-a7; b=b4-b7;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(j) (d) %c (g) (%4.2f K)',minus,b); title(s,'FontSize',fsize);
subplot(row,col,11); a=a5-a8; b=b5-b8;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(k) (e) %c (h) (%4.2f K)',minus,b); title(s,'FontSize',fsize);
subplot(row,col,12); a=a6-a9; b=b6-b9;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(l) (f) %c (i) (%4.2f K)',minus,b); title(s,'FontSize',fsize);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
unit='K';
cb1=colorbar('FontSize',fsize+2,'Location','southoutside');
set(cb1, 'Position', [.22 .04 .6 .02]); caxis([cmin2, cmax2]); 
cb1.Label.String = unit; pos=get(cb1,'Position')
cb1.Label.Position = [pos(1)-0.2 pos(2)+2]; 

expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LATEST===FIG3=== new figure for understanding vegetation forcing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='Fig3'; %LATEST===FIG3===
pms=[ 0, 0, 800, 1500]*0.65; fsize=10; msize=8; lw=1; ls1='-'; ls2='--';
handle=figure('Position',pms,'visible','on'); row=2; col=1;
minus=char(8212); da=char(8211);
hAxis(1)=subplot(row,col,1); pos = get( hAxis(1), 'Position' )
ls1='--'; ls2='-'; ax1=gca; x1=[1:150]; x2=[1:50]; x3=[1:51];
s1=sprintf('CM4.0 (4xCO2 -- pi-Control)');
s4=sprintf('AM4-CM4-C-DVEG-4xCO2 -- AM4-CM4-C-DVEG');
y1=CM4.w0.sfc.lai.ts.org_ann-mean(CM4.c0.sfc.lai.ts.org_ann);
y2=SP1.w0.sfc.lai.ts.org_ann-mean(SP1.c0.sfc.lai.ts.org_ann);
y3=SP4.w0.sfc.lai.ts.org_ann-mean(SP4.c0.sfc.lai.ts.org_ann);
vb=a40.Vb; va=a40.Va; vc=a40.Vc; 
y4=vb.sfc.lai.ts.org_ann-mean(va.sfc.lai.ts.org_ann); y5(2:51)=y4;y5(1)=0.1;
y6=vc.sfc.lai.ts.org_ann-mean(va.sfc.lai.ts.org_ann);
line(x1,y1,'Color','r','LineWidth',lw,'LineStyle',ls1); hold on;
%line(x2,y4,'Color','k','LineWidth',lw,'LineStyle',ls1); hold on;
line(x3,y5,'Color','k','LineWidth',lw,'LineStyle',ls1); hold on;
%line(x2,y6,'Color','b','LineWidth',lw,'LineStyle',ls1); hold on;
%line(x1,y2,'Color','c','LineWidth',lw,'LineStyle',ls1); hold on;
%line(x1,y3,'Color','k','LineWidth',lw,'LineStyle',ls1); hold on;
%legend(s1,s2,s3,s4,'location','northwest'); legend('boxoff');
legend(s1,s4,'location','northwest','Interpreter','latex'); legend('boxoff');
%legend(s1,s4,'location','northwest'); legend('boxoff');
xl='year'; xlabel(xl,'FontSize',fsize,'Interpreter','latex');
yl='change in leaf area index (LAI, m2/m2)';
ylabel(yl,'FontSize',fsize,'Interpreter','latex');
mylabel([1 150 0 0.5],1,' ',fsize);
set(gca,'FontSize',fsize); %box on; %title(vname,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','none','YColor',[0.2 0.2 0.2]);
y1=vb.toa.netrad.ts.org_ann   -mean(va.toa.netrad.ts.org_ann);
y2=vb.toa.swnet_clr.ts.org_ann-mean(va.toa.swnet_clr.ts.org_ann);
y3=vb.toa.lwnet_clr.ts.org_ann-mean(va.toa.lwnet_clr.ts.org_ann);
y4=vb.toa.ttcf.ts.org_ann     -mean(va.toa.ttcf.ts.org_ann);
% $$$ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ a=s.lm0; id=(lm==0); a(id)=1; a(~id)=0; a0=aa.*a; a0=a0./mean(mean(a0)); 
% $$$ a=a40.Vb.sfc.fsw.all; a=squeeze(mean(a,2)); a(a<0)=0;
% $$$ b=a40.c0.sfc.fsw.all; b=squeeze(mean(b,2)); b(b<0)=0;
% $$$ a=a40.Vb.toa.swnet_clr.all; a=squeeze(mean(a,2));
% $$$ b=a40.c0.toa.swnet_clr.all; b=squeeze(mean(b,2));
% $$$ for t=1:length(a(:,1,1))
% $$$   x=squeeze(a(t,:,:)); x=x.*a0; xa(t)=mean(mean(x,1),2);
% $$$ end
% $$$ for t=1:length(b(:,1,1))
% $$$   x=squeeze(b(t,:,:)); x=x.*a0; xb(t)=mean(mean(x,1),2);
% $$$ end
% $$$ y7=xa-mean(xa); %figure; plot(xa,'r'); hold on; plot(xb,'k');
% $$$ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
line(x2, y1,'Color','k','LineWidth',lw,'LineStyle',ls2); hold on;
line(x2, y2,'Color','b','LineWidth',lw,'LineStyle',ls2); hold on;
%line(x2,-y3,'Color','g','LineWidth',lw,'LineStyle',ls2); hold on;
%line(x2, y4,'Color','b','LineWidth',lw,'LineStyle',ls2); hold on;
%line(x2,y2-y3+y4,'Color','ys','LineWidth',lw,'LineStyle',ls2); hold on;
s1='TOA net radiation ($\Delta N_{g,veg}$)'; s2='TOA clear-sky SW radiation'; 
s3='TOA clear-sky LW radiation'; s4='TOA net cloud radiative effect';
%legend(s1,s2,s3,s4,'location','southeast'); legend('boxoff');
legend(s1,s2,'location','southeast','Interpreter','latex'); 
legend('boxoff');
xl='year'; %xlabel(xl,'FontSize',fsize,'Interpreter','latex');
yl='change in TOA radiative flux (W/m2)';
ylabel(yl,'FontSize',fsize,'Interpreter','latex'); 
mylabel([1 150 -1 2],1,'(a)',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%New Fig3b: Gregory plot dN vs dTs for ECS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vb=a40.Vb; va=a40.Va;  
dT_veg=vb.sfc.tref.ann_stat.mmen.all  -mean(va.sfc.tref.ann_stat.mmen.all);
dN_veg=vb.toa.netrad.ann_stat.mmen.all-mean(va.toa.netrad.ann_stat.mmen.all);
dT_veg(11:30)=mean(dT_veg(end-6:end));
dN_veg(11:30)=mean(dN_veg(end-6:end));
hAxis(2)=subplot(row,col,2); pos = get( hAxis(2), 'Position' )
pos(2) = 0.095 ; % Shift down.
pos(4) = 0.4 ;   % Increase height.
set( hAxis(2), 'Position', pos ) ;
%hAxis(2)=subplot(row,col,2); pos = get( hAxis(2), 'Position' )
%pos(2) = 0.10 ; % Shift down.
%pos(4) = 0.4 ;  % Increase height.
%set( hAxis(2), 'Position', pos ) ;
t1=1; t2=20; t3=30; opt=1; %1st 100yr control, ann_stat contain 5-year annual mean
d=get_tref_netrad_ts(CM4,esm,SP1,SP4,a40,a41,t1,t2,t3,opt);
d.dT3=d.dT1;%-dT_veg; 
d.dN3=d.dN1-dN_veg+mean(dN_veg); 
t1=1;  t2=10; x1 =getcorrslop(d.dT1(t1:t2),d.dN1(t1:t2));
t1=11; t2=30; xx1=getcorrslop(d.dT1(t1:t2),d.dN1(t1:t2));
t1=1;  t2=10; x3 =getcorrslop(d.dT3(t1:t2),d.dN3(t1:t2));
t1=11; t2=30; xx3=getcorrslop(d.dT3(t1:t2),d.dN3(t1:t2));
t1=1;  t2=10; x4 =getcorrslop(d.dT4(t1:t2),d.dN4(t1:t2));
t1=11; t2=30; xx4=getcorrslop(d.dT4(t1:t2),d.dN4(t1:t2));
t1=1;  t2=10; x2 =getcorrslop(d.dT2(t1:t2),d.dN2(t1:t2));
t1=11; t2=30; xx2=getcorrslop(d.dT2(t1:t2),d.dN2(t1:t2));
%t1=1;  t2=10; x5 =getcorrslop(dT   (t1:t2),dN   (t1:t2));
%t1=11; t2=30; xx5=getcorrslop(dT   (t1:t2),dN   (t1:t2));
%dT6=mean(a40.w0.sfc.tref.ann_stat.mmen.all)  -mean(a40.c0.sfc.tref.ann_stat.mmen.all);
%dN6=mean(a40.w0.toa.netrad.ann_stat.mmen.all)-mean(a40.c0.toa.netrad.ann_stat.mmen.all);
%dT6=290.439-mean(a40.c0.sfc.tref.ann_stat.mmen.all);
%dN6=2.83   -mean(a40.c0.toa.netrad.ann_stat.mmen.all);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(d.dT1,d.dN1, 'r.','MarkerSize',msize); hold on; 
plot(d.dT3,d.dN3, 'b.','MarkerSize',msize); hold on; 
%plot(d.dT4,d.dN4, 'c.','MarkerSize',msize); hold on; 
%plot(d.dT2,d.dN2, 'k.','MarkerSize',msize); hold on; 
%plot(d.dT6,d.dN6, 'g+','MarkerSize',msize+4,'LineWidth',lw);
%plot(d.dT5,d.dN5, 'm+','MarkerSize',msize+4,'LineWidth',lw);
v=x1;  plot(v.xa,v.ya,'r--','LineWidth',lw);
v=xx1; plot(v.xb,v.yb,'r-', 'LineWidth',lw);
v=x3;  plot(v.xa,v.ya,'b--','LineWidth',lw);
v=xx3; plot(v.xb,v.yb,'b-', 'LineWidth',lw);
%v=x4;  plot(v.xa,v.ya,'c--','LineWidth',lw);
%v=xx4; plot(v.xb,v.yb,'c-', 'LineWidth',lw);
%v=x2;  plot(v.xa,v.ya,'k--','LineWidth',lw);
%v=xx2; plot(v.xb,v.yb,'k-', 'LineWidth',lw);
%title('(b)','FontSize',fsize); %plot([0 20],[0 0],'k-');
%legend('CM4.0','CM4.0-corrected','AM4-CM4-4xCO2-50','AM4-CM4-4xCO2-125','location','southwest');
legend('CM4.0','CM4.0-corrected','location','southwest','Interpreter','latex');
legend('boxoff');
xl='change in surface air temperature ($\delta T_g$, K)';
yl='change in net TOA radiative flux ($\delta N_g$, W/m2)';
xlabel(xl,'FontSize',fsize,'Interpreter','latex');
ylabel(yl,'FontSize',fsize,'Interpreter','latex');
xy=[0 10 0 8.5]; mylabel(xy,1,'(b)',fsize); set(gca,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='Fig2p1'; xy=[-90 90 -2.5 1.5]; xy1=[-90 90 -3 3];
pms=[ 0, 0, 800, 500]*1.2; fsize=11; lw=1; s0='(%4.2f)';
handle = figure('Position', pms,'visible','on'); row=2; col=2;
ls1='--'; ls2='-'; ax1=gca; x1=[1:150]; x2=[1:50];
s1='CM4.0'; s2='SPEAR'; s3='SPEAR-SV'; minus=char(8212);
s4=sprintf('AM4-CM4-4xCO2-DVEG %c AM4-CM4-C',minus);
y1=CM4.w0.sfc.lai.ts.org_ann-mean(CM4.c0.sfc.lai.ts.org_ann);
y2=SP1.w0.sfc.lai.ts.org_ann-mean(SP1.c0.sfc.lai.ts.org_ann);
y3=SP4.w0.sfc.lai.ts.org_ann-mean(SP4.c0.sfc.lai.ts.org_ann);
vb=a40.Vb; va=a40.Va; x2=[1:50]; %vb=a40.Va; va=a40.c0; x2=[1:35];
y4=vb.sfc.lai.ts.org_ann-mean(va.sfc.lai.ts.org_ann);
%y6=y5-mean(y4);
line(x1,y1,'Color','r','LineWidth',lw,'LineStyle',ls1); hold on;
line(x2,y4,'Color','k','LineWidth',lw,'LineStyle',ls1); hold on;
%line(x2,y6,'Color','b','LineWidth',lw,'LineStyle',ls1); hold on;
%line(x1,y2,'Color','c','LineWidth',lw,'LineStyle',ls1); hold on;
%line(x1,y3,'Color','k','LineWidth',lw,'LineStyle',ls1); hold on;
%legend(s1,s2,s3,s4,'location','northwest'); legend('boxoff');
legend(s1,s4,'location','northwest'); legend('boxoff');
xl='year'; xlabel(xl,'FontSize',fsize);
yl='change in leaf area index (LAI) (m2/m2)';
ylabel(yl,'FontSize',fsize); mylabel([1 150 -0.1 0.5],1,' ',fsize);
set(gca,'FontSize',fsize); %box on; %title(vname,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','none','YColor',[0.2 0.2 0.2]);
y1=vb.toa.netrad.ts.org_ann   -mean(va.toa.netrad.ts.org_ann);
y2=vb.toa.swnet_clr.ts.org_ann-mean(va.toa.swnet_clr.ts.org_ann);
y3=vb.toa.lwnet_clr.ts.org_ann-mean(va.toa.lwnet_clr.ts.org_ann);
y4=vb.toa.ttcf.ts.org_ann     -mean(va.toa.ttcf.ts.org_ann);
% $$$ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ a=s.lm0; id=(lm==0); a(id)=1; a(~id)=0; a0=aa.*a; a0=a0./mean(mean(a0)); 
% $$$ a=a40.Vb.sfc.fsw.all; a=squeeze(mean(a,2)); a(a<0)=0;
% $$$ b=a40.c0.sfc.fsw.all; b=squeeze(mean(b,2)); b(b<0)=0;
% $$$ a=a40.Vb.toa.swnet_clr.all; a=squeeze(mean(a,2));
% $$$ b=a40.c0.toa.swnet_clr.all; b=squeeze(mean(b,2));
% $$$ for t=1:length(a(:,1,1))
% $$$   x=squeeze(a(t,:,:)); x=x.*a0; xa(t)=mean(mean(x,1),2);
% $$$ end
% $$$ for t=1:length(b(:,1,1))
% $$$   x=squeeze(b(t,:,:)); x=x.*a0; xb(t)=mean(mean(x,1),2);
% $$$ end
% $$$ y7=xa-mean(xa); %figure; plot(xa,'r'); hold on; plot(xb,'k');
% $$$ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
line(x2, y1,'Color','k','LineWidth',lw,'LineStyle',ls2); hold on;
line(x2, y2,'Color','r','LineWidth',lw,'LineStyle',ls2); hold on;
line(x2,-y3,'Color','g','LineWidth',lw,'LineStyle',ls2); hold on;
line(x2, y4,'Color','b','LineWidth',lw,'LineStyle',ls2); hold on;
%line(x2,y2-y3+y4,'Color','ys','LineWidth',lw,'LineStyle',ls2); hold on;
s1='TOA net radiation';          s2='TOA clear-sky SW radiation'; 
s3='TOA clear-sky LW radiation'; s4='TOA net cloud radiative effect';
legend(s1,s2,s3,s4,'location','southeast'); legend('boxoff');
xl='year'; xlabel(xl,'FontSize',fsize);
yl='change in TOA radiative flux (W/m2)';
ylabel(yl,'FontSize',fsize); mylabel([1 150 -2 3],1,'',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
ylabel(yl,'FontSize',fsize); 
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%LATEST===FIG4===Mew Fig4_6panel including time seris of feedback%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='4xCO2_dN_dT_feedback_6panel'; vname='Fig4'; t1=1; t2=150; opt=0;
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
df=get4xco2f(a40,aa,opt);
d0=get_fdbk(CM4,esm,SP1,SP4,a40,df,t1,t2,0);
d1=get_fdbk(CM4,ESM,SP1,SP4,a40,df,t1,t2,1);
d2=get_fdbk(CM4,ESM,SP1,SP4,a40,df,t1,t2,2);
d3=get_fdbk(CM4,ESM,SP1,SP4,a40,df,t1,t2,3); 
cmin=0; cmax=10; vbin=[cmin:0.01:cmax]; color='w';
pms=[ 0, 0, 1000, 1000]; fsize=7.5; row=3; col=2;  unit1='W/m2';
handle = figure('Position', pms,'visible','on'); unit2='K';
subplot(row,col,1); a=df.av; b=df.gm; minus=char(8212);
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit1,'FontSize',8);
s=sprintf('(a) $\\Delta N_{4xCO2,noveg}$ (%4.2f)',b); 
title(s,'FontSize',fsize,'Interpreter','latex'); set(gca,'FontSize',fsize); 
subplot(row,col,2); a=df.F_av_veg; b=df.F_veg; 
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit1,'FontSize',8);
s=sprintf('(b) $\\Delta N_{4xCO2,veg}$ (%4.2f)',b); 
title(s,'FontSize',fsize,'Interpreter','latex'); set(gca,'FontSize',fsize); 

cb0=colorbar('FontSize',fsize+2,'Location','eastoutside');
set(cb0, 'Position', [0.92 0.71 0.02 0.215]); caxis([cmin, cmax]); 
cb0.Label.String = unit1; pos=get(cb0,'Position');
cb0.Label.Position = [pos(1) pos(2)+10.5]; 
cb0.Label.Rotation = 0;

subplot(row,col,3); a=df.av_T; b=df.T;
pcolor(lon,lat,a); hold on; shading flat; caxis([0 2]);
contour(lon,lat,lm,1,color); %title(h,unit2,'FontSize',8);
s=sprintf('(c) $\\Delta T_{noveg}$ (%4.2f)',b); 
title(s,'FontSize',fsize,'Interpreter','latex'); set(gca,'FontSize',fsize); 
subplot(row,col,4); a=df.T_av_veg; b=df.T_veg;
pcolor(lon,lat,a); hold on; shading flat; caxis([0 2]);
contour(lon,lat,lm,1,color); %title(h,unit2,'FontSize',8);
s=sprintf('(d) $\\Delta T_{veg}$ (%4.2f)',b); 
title(s,'FontSize',fsize,'Interpreter','latex'); set(gca,'FontSize',fsize); 

cb1=colorbar('FontSize',fsize+2,'Location','eastoutside');
set(cb1, 'Position', [0.92 0.41 0.02 0.215]); caxis([0 2]); 
cb1.Label.String = unit2; pos=get(cb1,'Position');
cb1.Label.Position = [pos(1)-0.3 pos(2)+1.8]; 
cb1.Label.Rotation = 0;

subplot(row,col,5); x0=[2.5:5:150]; dd=d0;
plot(x0,dd.fb1,'r','LineWidth',lw); hold on;
plot(x0,dd.fb3,'b','LineWidth',lw); hold on;
plot(x0,dd.fb4,'c','LineWidth',lw); hold on;
plot([26  75], dd.fb6,'k','LineWidth',lw);
plot([101 150],dd.fb5,'m','LineWidth',lw);
legend('CM4.0','SPEAR','SPEAR-SV','AM4-CM4-50','AM4-CM4-125','Location','southeast','Interpreter','latex');
xl='year'; xlabel(xl,'FontSize',fsize,'Interpreter','latex'); 
yl='$\alpha_g$ (W/m2/K)'; ylabel(yl,'FontSize',fsize,'Interpreter','latex');
title(' (e) TOA net radiative feedback without CO2 induced vegetation forcing','FontSize',fsize,'Interpreter','latex'); 
xy=[0 150 -2.1 -1.1]; mylabel(xy,2,'',8); 
set(gca,'FontSize',fsize); 

subplot(row,col,6); x0=[2.5:5:150]; dd=d1;
plot(x0,dd.fb1,'r','LineWidth',lw); hold on;
plot(x0,dd.fb3,'b','LineWidth',lw); hold on;
plot(x0,dd.fb4,'c','LineWidth',lw); hold on;
plot([26  75], dd.fb6,'k','LineWidth',lw);
plot([101 150],dd.fb5,'m','LineWidth',lw);
legend('CM4.0','SPEAR','SPEAR-SV','AM4-CM4-50','AM4-CM4-125','Location','southeast','Interpreter','latex');
xl='year'; xlabel(xl,'FontSize',fsize,'Interpreter','latex'); 
yl='$\alpha_g$ (W/m2/K)'; ylabel(yl,'FontSize',fsize,'Interpreter','latex');
title('(f) TOA net radiative feedback with CO2 induced vegetation forcing','FontSize',fsize,'Interpreter','latex'); 
xy=[0 150 -2.1 -1.1]; mylabel(xy,2,'',8); 
set(gca,'FontSize',fsize); 
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%test for 
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
vb=a40.Vb; va=a40.Va; vc=a40.Vc; 
z1=vb.sfc.lai.tavg0   -va.sfc.lai.tavg0;
z2=vb.sfc.tref.tavg0  -va.sfc.tref.tavg0;
z3=vb.toa.netrad.tavg0-va.toa.netrad.tavg0;
z4=vb.toa.swnet.tavg0 -va.toa.swnet.tavg0;
z5=vb.toa.lwnet.tavg0 -va.toa.lwnet.tavg0;
pms=[ 0, 0, 1500, 1000]; fsize=7.5; row=6; col=3;  unit1='W/m2';
handle = figure('Position', pms,'visible','on'); unit2='K';
subplot(row,col,1); 
figure;
pcolor(lon,lat,va.sfc.lai.tavg0); hold on; shading flat; caxis([-5 5]); colorbar; colormap(jet);

pcolor(lon,lat,z1); hold on; shading flat; caxis([-5 5]); colorbar; colormap(jet);
subplot(row,col,2);
pcolor(lon,lat,z2); hold on; shading flat; caxis([ 0 2]); colorbar; colormap(jet);
subplot(row,col,3);
pcolor(lon,lat,z3); hold on; shading flat; caxis([-2 10]);colorbar; colormap(jet);
subplot(row,col,4);
pcolor(lon,lat,z4); hold on; shading flat; caxis([-2 10]);colorbar; colormap(jet);
subplot(row,col,5);
pcolor(lon,lat,z5); hold on; shading flat; caxis([-2 10]);colorbar; colormap(jet);
subplot(row,col,6);
pcolor(lon,lat,z4-z5); hold on; shading flat; caxis([-2 10]);colorbar; colormap(jet);
subplot(row,col,7);
pcolor(lon,lat,va.toa.lwnet.tavg0); hold on; shading flat; caxis([200 300]);colorbar; colormap(jet);
subplot(row,col,8);
pcolor(lon,lat,vb.toa.lwnet.tavg0); hold on; shading flat; caxis([200 300]);colorbar; colormap(jet);
subplot(row,col,9);
pcolor(lon,lat,vb.toa.lwnet.tavg0-va.toa.lwnet.tavg0); hold on; shading flat; caxis([-2 10]);colorbar; colormap(jet);
subplot(row,col,10); a1=va.sfc.pcp.tavg0;
pcolor(lon,lat,a1); hold on; shading flat; caxis([0 12]);colorbar; colormap(jet);
subplot(row,col,11); a2=vb.sfc.pcp.tavg0;
pcolor(lon,lat,a2); hold on; shading flat; caxis([0 12]);colorbar; colormap(jet);
subplot(row,col,12);
pcolor(lon,lat,a2-a1); hold on; shading flat; caxis([-1 1]);colorbar; colormap(jet);
subplot(row,col,13); a1=va.sfc.rhref.tavg0;
pcolor(lon,lat,a1); hold on; shading flat; caxis([70 90]);colorbar; colormap(jet);
subplot(row,col,14); a2=vb.sfc.rhref.tavg0;
pcolor(lon,lat,a2); hold on; shading flat; caxis([70 90]);colorbar; colormap(jet);
subplot(row,col,15);
pcolor(lon,lat,a2-a1); hold on; shading flat; caxis([-10 10]);colorbar; colormap(jet);

subplot(row,col,16); a1=va.sfc.tsurf.tavg0;
pcolor(lon,lat,a1); hold on; shading flat; caxis([200 310]);colorbar; colormap(jet);
subplot(row,col,17); a2=vb.sfc.tsurf.tavg0;
pcolor(lon,lat,a2); hold on; shading flat; caxis([200 310]);colorbar; colormap(jet);
subplot(row,col,18);
pcolor(lon,lat,a2-a1); hold on; shading flat; caxis([0 2]);colorbar; colormap(jet);

nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet);
%end of test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Mew Fig3_6panel including time seris of feedback%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='4xCO2_dN_dT_feedback_6panel'; vname='Fig3o'; t1=1; t2=150; opt=0;
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
df=get4xco2f(a40,aa,opt);
d2=get_fdbk(CM4,ESM,SP1,SP4,a40,df,t1,t2,2);
d3=get_fdbk(CM4,ESM,SP1,SP4,a40,df,t1,t2,3); 
cmin=0; cmax=10; vbin=[cmin:0.01:cmax]; color='w';
pms=[ 0, 0, 1000, 1000]; fsize=7.5; row=3; col=2;  unit1='W/m2';
handle = figure('Position', pms,'visible','on'); unit2='K';
subplot(row,col,1); a=df.av3; b=df.gm3; minus=char(8212);
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit1,'FontSize',8);
s=sprintf('(a) \\DeltaN (AM4-CM4-4xCO2-50 %c AM4-CM4-50; %4.2f)',minus,b); 
title(s,'FontSize',fsize); set(gca,'FontSize',fsize); 
subplot(row,col,2); a=df.av2; b=df.gm2; 
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit1,'FontSize',8);
s=sprintf('(b) \\DeltaN (AM4-CM4-4xCO2-125 %c AM4-CM4-125; %4.2f)',minus,b); 
title(s,'FontSize',fsize); set(gca,'FontSize',fsize); 

cb0=colorbar('FontSize',fsize+2,'Location','eastoutside');
set(cb0, 'Position', [0.92 0.71 0.02 0.215]); caxis([cmin, cmax]); 
cb0.Label.String = unit1; pos=get(cb0,'Position');
cb0.Label.Position = [pos(1) pos(2)+10.5]; 
cb0.Label.Rotation = 0;

subplot(row,col,3); a=df.av3_T; b=df.T3;
pcolor(lon,lat,a); hold on; shading flat; caxis([0 2]);
contour(lon,lat,lm,1,color); %title(h,unit2,'FontSize',8);
s=sprintf('(c) \\DeltaSAT (AM4-CM4-4xCO2-50 %c AM4-CM4-50; %4.2f)',minus,b); 
title(s,'FontSize',fsize); set(gca,'FontSize',fsize); 
subplot(row,col,4); a=df.av2_T; b=df.T2;
pcolor(lon,lat,a); hold on; shading flat; caxis([0 2]);
contour(lon,lat,lm,1,color); %title(h,unit2,'FontSize',8);
s=sprintf('(d) \\DeltaSAT (AM4-CM4-4xCO2-125 %c AM4-CM4-125; %4.2f)',minus,b); 
title(s,'FontSize',fsize); set(gca,'FontSize',fsize); 

cb1=colorbar('FontSize',fsize+2,'Location','eastoutside');
set(cb1, 'Position', [0.92 0.41 0.02 0.215]); caxis([0 2]); 
cb1.Label.String = unit2; pos=get(cb1,'Position');
cb1.Label.Position = [pos(1) pos(2)+1.8]; 
cb1.Label.Rotation = 0;

subplot(row,col,5); x0=[2.5:5:150];
plot(x0,d3.fb1,'r','LineWidth',lw); hold on;
plot(x0,d3.fb3,'b','LineWidth',lw); hold on;
plot(x0,d3.fb4,'c','LineWidth',lw); hold on;
plot([26  75], d3.fb6,'k','LineWidth',lw);
plot([101 150],d3.fb5,'m','LineWidth',lw);
legend('CM4.0','SPEAR','SPEAR-SV','AM4-CM4-50','AM4-CM4-125','Location','southeast');
xl='year'; xlabel(xl,'FontSize',fsize); 
yl='\alpha_g (W/m2/K)'; ylabel(yl,'FontSize',fsize);
title(' (e) TOA net radiative feedback','FontSize',fsize); 
xy=[0 150 -1.9 -1.1]; %mylabel(xy,2,'(e)',8); 
set(gca,'FontSize',fsize); 
subplot(row,col,6); x0=[2.5:5:150];
plot(x0,d2.fb1,'r','LineWidth',lw); hold on;
plot(x0,d2.fb3,'b','LineWidth',lw); hold on;
plot(x0,d2.fb4,'c','LineWidth',lw); hold on;
plot([26  75], d2.fb6,'k','LineWidth',lw);
plot([101 150],d2.fb5,'m','LineWidth',lw);
legend('CM4.0','SPEAR','SPEAR-SV','AM4-CM4-50','AM4-CM4-125','Location','southeast');
xl='year'; xlabel(xl,'FontSize',fsize); 
yl='\alpha_g (W/m2/K)'; ylabel(yl,'FontSize',fsize);
title('(f) TOA net radiative feedback','FontSize',fsize); 
xy=[0 150 -1.9 -1.1]; %mylabel(xy,2,'(f)',8); 
set(gca,'FontSize',fsize); 
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LATEST===FIG5===Fig5_12panel: TOA net radiative feedback coupled models
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dN_feedback_map_12panel';  vname='Fig5'; opt=0;
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
df=get4xco2f(a40,aa,opt); %fav=df.av2; f0=df.gm2; dT_co2=df.T2;
FAV=df.av; F0=df.gm; dT_CO2=df.T;
fav=df.av+df.F_av_veg; f0=df.gm+df.F_veg; dT_co2=df.T+df.T_veg;
t1=26; t2=75; 
dt1=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d1 =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
t1=101; t2=150; 
dt2=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d2 =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
cmin=-4; cmax=4; cmin1=-4; cmax1=4; co='w';
pms=[ 0, 0, 1600, 1200]*0.7; fsize=8; row=4; col=3; 
handle = figure('Position', pms,'visible','on'); minus=char(8212);
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet);
subplot(row,col,1); dt=dt1; d=d1; dT=dt.T1-dT_co2;
a=(d.w1.av-d.c1.av-fav)/dT; b=(d.N1-f0)/dT; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(a) CM4.0 (Y50; %4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,2); dt=dt2; d=d2; dT=dt.T1-dT_co2;
a=(d.w1.av-d.c1.av-fav)/dT; b=(d.N1-f0)/dT; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(b) CM4.0 (Y125; %4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,3); dT=dt2.T1-dt1.T1;
a=(d2.w1.av-d1.w1.av)/dT; b=(d2.N1-d1.N1)/dT; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(c) CM4.0 (Y125 %c Y50; %4.2f)',minus,b); title(s,'FontSize',fsize);

subplot(row,col,4); dt=dt1; d=d1; dT=dt.T3-dT_co2;
a=(d.w3.av-d.c3.av-fav)/dT; b=(d.N3-f0)/dT; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(d) SPEAR (Y50; %4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,5); dt=dt2; d=d2; dT=dt.T3-dT_co2;
a=(d.w3.av-d.c3.av-fav)/dT; b=(d.N3-f0)/dT; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(e) SPEAR (Y125; %4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,6); dt=dt1; dT=dt2.T3-dt1.T3;
a=(d2.w3.av-d1.w3.av)/dT; b=(d2.N3-d1.N3)/dT; a6=a; b6=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(f) SPEAR (Y125 %c Y50; %4.2f)',minus,b); title(s,'FontSize',fsize);

subplot(row,col,7); dt=dt1; d=d1; dT=dt.T4-dT_CO2;
a=(d.w4.av-d.c4.av-FAV)/dT; b=(d.N4-F0)/dT; a7=a; b7=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(g) SPEAR-SV (Y50; %4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,8); dt=dt2; d=d2; dT=dt.T4-dT_CO2;
a=(d.w4.av-d.c4.av-FAV)/dT; b=(d.N4-F0)/dT; a8=a; b8=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(h) SPEAR-SV (Y125; %4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,9); dT=dt2.T4-dt1.T4;
a=(d2.w4.av-d1.w4.av)/dT; b=(d2.N4-d1.N4)/dT; a9=a; b9=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(i) SPEAR-SV (Y125 %c Y50; %4.2f)',minus,b); title(s,'FontSize',fsize);

subplot(row,col,10); a=a4-a7; b=b4-b7;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(j) (d) %c (g) (%4.2f)',minus,b); title(s,'FontSize',fsize);
subplot(row,col,11); a=a5-a8; b=b5-b8;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(k) (e) %c (h) (%4.2f)',minus,b); title(s,'FontSize',fsize);
subplot(row,col,12); a=a6-a9; b=b6-b9;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(l) (f) %c (i) (%4.2f)',minus,b); title(s,'FontSize',fsize);

cb=colorbar('FontSize',fsize+2,'Location','southoutside');
set(cb, 'Position', [.165 .04 .7 .02]); caxis([cmin1, cmax1]); 
cb.Label.String = 'W/m2/K'; %title(cb, unit,'FontSize',fsize+2);
pos=get(cb,'Position')
cb.Label.Position = [pos(1)/2-0.1 pos(2)+1.9];  %for radiation
%nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LATEST===FIGS3==TOA net cloud feedback coupled models
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='FigS3'; opt=0;
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
df=get4xco2f(a40,aa,opt); 
FAV=df.ttcf2d; F0=df.ttcf0; dT_CO2=df.T;
fav=df.ttcf2d+df.ttcf2d_veg; f0=df.ttcf0+df.ttcf0_veg; dT_co2=df.T+df.T_veg;
t1=26; t2=75; 
dt1=gettref  (CM4,esm,SP1,SP4,a40,a41,t1,t2,opt);
d1 =getttcf  (CM4,esm,SP1,SP4,a40,a41,t1,t2,opt);
t1=101; t2=150; 
dt2=gettref  (CM4,esm,SP1,SP4,a40,a41,t1,t2,opt);
d2 =getttcf  (CM4,esm,SP1,SP4,a40,a41,t1,t2,opt);
cmin=-4; cmax=4; cmin1=-4; cmax1=4; co='w';
pms=[ 0, 0, 1600, 1200]*0.7; fsize=8; row=4; col=3; 
handle = figure('Position', pms,'visible','on'); minus=char(8212);
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet);
subplot(row,col,1); dt=dt1; d=d1; dT=dt.T1-dT_co2;
a=(d.w1.av-d.c1.av-fav)/dT; b=(d.N1-f0)/dT; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 
s=sprintf('(a) CM4.0 (Y50; \\DeltaCRE=%4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,2); dt=dt2; d=d2; dT=dt.T1-dT_co2;
a=(d.w1.av-d.c1.av-fav)/dT; b=(d.N1-f0)/dT; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 
s=sprintf('(b) CM4.0 (Y125; \\DeltaCRE=%4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,3); dT=dt2.T1-dt1.T1;
a=(d2.w1.av-d1.w1.av)/dT; b=(d2.N1-d1.N1)/dT; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 
s=sprintf('(c) CM4.0 (Y125 %c Y50; \\DeltaCRE=%4.2f)',minus,b); title(s,'FontSize',fsize);

subplot(row,col,4); dt=dt1; d=d1; dT=dt.T3-dT_co2;
a=(d.w3.av-d.c3.av-fav)/dT; b=(d.N3-f0)/dT; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 
s=sprintf('(d) SPEAR (Y50;  \\DeltaCRE=%4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,5); dt=dt2; d=d2; dT=dt.T3-dT_co2;
a=(d.w3.av-d.c3.av-fav)/dT; b=(d.N3-f0)/dT; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 
s=sprintf('(e) SPEAR (Y125; \\DeltaCRE=%4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,6); dt=dt1; dT=dt2.T3-dt1.T3;
a=(d2.w3.av-d1.w3.av)/dT; b=(d2.N3-d1.N3)/dT; a6=a; b6=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 
s=sprintf('(f) SPEAR (Y125 %c Y50; \\DeltaCRE=%4.2f)',minus,b); title(s,'FontSize',fsize);

subplot(row,col,7); dt=dt1; d=d1; dT=dt.T4-dT_CO2;
a=(d.w4.av-d.c4.av-FAV)/dT; b=(d.N4-F0)/dT; a7=a; b7=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 
s=sprintf('(g) SPEAR-SV (Y50; \\DeltaCRE=%4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,8); dt=dt2; d=d2; dT=dt.T4-dT_CO2;
a=(d.w4.av-d.c4.av-FAV)/dT; b=(d.N4-F0)/dT; a8=a; b8=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 
s=sprintf('(h) SPEAR-SV (Y125; \\DeltaCRE=%4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,9); dT=dt2.T4-dt1.T4;
a=(d2.w4.av-d1.w4.av)/dT; b=(d2.N4-d1.N4)/dT; a9=a; b9=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 
s=sprintf('(i) SPEAR-SV (Y125 %c Y50; \\DeltaCRE=%4.2f)',minus,b); title(s,'FontSize',fsize);

subplot(row,col,10); dt=dt1; d=d1; dT=dt.T2-dT_CO2;
a=(d.w2.av-d.c2.av-FAV)/dT; b=(d.N2-F0)/dT; a10=a; b10=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 
s=sprintf('(j) ESM2M (Y50; \\DeltaCRE=%4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,11); dt=dt2; d=d2; dT=dt.T2-dT_CO2;
a=(d.w2.av-d.c2.av-FAV)/dT; b=(d.N2-F0)/dT; a11=a; b11=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 
s=sprintf('(k) ESM2M (Y125; \\DeltaCRE=%4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,12); dT=dt2.T2-dt1.T2;
a=(d2.w2.av-d1.w2.av)/dT; b=(d2.N2-d1.N2)/dT; a12=a; b12=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); 
s=sprintf('(l) ESM2M (Y125 %c Y50; \\DeltaCRE=%4.2f)',minus,b); title(s,'FontSize',fsize);

cb=colorbar('FontSize',fsize+2,'Location','southoutside');
set(cb, 'Position', [.165 .04 .7 .02]); caxis([cmin1, cmax1]); 
cb.Label.String = 'W/m2/K'; %title(cb, unit,'FontSize',fsize+2);
pos=get(cb,'Position')
cb.Label.Position = [pos(1)/2-0.1 pos(2)+1.9];  %for radiation
%nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%New Fig4_12panel: TOA net radiative feedback coupled models
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dN_feedback_map_12panel';  vname='Fig4O'; opt=0;
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
df=get4xco2f(a40,aa,opt); %fav=df.av2; f0=df.gm2; dT_co2=df.T2;
fav=df.av; f0=df.gm; dT_co2=df.T;
t1=26; t2=75; 
dt1=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d1 =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
t1=101; t2=150; 
dt2=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d2 =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
cmin=-4; cmax=4; cmin1=-4; cmax1=4; co='w';
pms=[ 0, 0, 1600, 1200]*0.7; fsize=8; row=4; col=3; 
handle = figure('Position', pms,'visible','on'); minus=char(8212);
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet);
subplot(row,col,1); dt=dt1; d=d1; dT=dt.T1-dT_co2;
a=(d.w1.av-d.c1.av-fav)/dT; b=(d.N1-f0)/dT; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(a) CM4.0 (Y50; %4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,2); dt=dt2; d=d2; dT=dt.T1-dT_co2;
a=(d.w1.av-d.c1.av-fav)/dT; b=(d.N1-f0)/dT; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(b) CM4.0 (Y125; %4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,3); dT=dt2.T1-dt1.T1;
a=(d2.w1.av-d1.w1.av)/dT; b=(d2.N1-d1.N1)/dT; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(c) CM4.0 (Y125 %c Y50; %4.2f)',minus,b); title(s,'FontSize',fsize);

subplot(row,col,4); dt=dt1; d=d1; dT=dt.T3-dT_co2;
a=(d.w3.av-d.c3.av-fav)/dT; b=(d.N3-f0)/dT; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(d) SPEAR (Y50; %4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,5); dt=dt2; d=d2; dT=dt.T3-dT_co2;
a=(d.w3.av-d.c3.av-fav)/dT; b=(d.N3-f0)/dT; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(e) SPEAR (Y125; %4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,6); dt=dt1; dT=dt2.T3-dt1.T3;
a=(d2.w3.av-d1.w3.av)/dT; b=(d2.N3-d1.N3)/dT; a6=a; b6=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(f) SPEAR (Y125 %c Y50; %4.2f)',minus,b); title(s,'FontSize',fsize);

subplot(row,col,7); dt=dt1; d=d1; dT=dt.T4-dT_co2;
a=(d.w4.av-d.c4.av-fav)/dT; b=(d.N4-f0)/dT; a7=a; b7=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(g) SPEAR-SV (Y50; %4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,8); dt=dt2; d=d2; dT=dt.T4-dT_co2;
a=(d.w4.av-d.c4.av-fav)/dT; b=(d.N4-f0)/dT; a8=a; b8=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(h) SPEAR-SV (Y125; %4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,9); dT=dt2.T4-dt1.T4;
a=(d2.w4.av-d1.w4.av)/dT; b=(d2.N4-d1.N4)/dT; a9=a; b9=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(i) SPEAR-SV (Y125 %c Y50; %4.2f)',minus,b); title(s,'FontSize',fsize);

subplot(row,col,10); a=a4-a7; b=b4-b7;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(j) (d) %c (g) (%4.2f)',minus,b); title(s,'FontSize',fsize);
subplot(row,col,11); a=a5-a8; b=b5-b8;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(k) (e) %c (h) (%4.2f)',minus,b); title(s,'FontSize',fsize);
subplot(row,col,12); a=a6-a9; b=b6-b9;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); %title(h,'W/m2/K','FontSize',6);
s=sprintf('(l) (f) %c (i) (%4.2f)',minus,b); title(s,'FontSize',fsize);

cb=colorbar('FontSize',fsize+2,'Location','southoutside');
set(cb, 'Position', [.165 .04 .7 .02]); caxis([cmin1, cmax1]); 
cb.Label.String = 'W/m2/K'; %title(cb, unit,'FontSize',fsize+2);
pos=get(cb,'Position')
cb.Label.Position = [pos(1)/2-0.1 pos(2)+1.9];  %for radiation
%nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LATEST===FIG6===Fig6: change in zonal mean TOA radiative flux CM4/SPEAR/SPEAR-SV
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t1=26; t2=75; 
v=CM4; cm4_50 =getalltoa(v,t1,t2,o,a40,1);
v=SP1; sp1_50 =getalltoa(v,t1,t2,o,a40,1);
v=SP4; sp4_50 =getalltoa(v,t1,t2,o,a40,0);
v=esm; esm_50 =getalltoa(v,t1,t2,o,a40,1);
t1=101; t2=150; 
v=CM4; cm4_125=getalltoa(v,t1,t2,o,a40,1);
v=SP1; sp1_125=getalltoa(v,t1,t2,o,a40,1);
v=SP4; sp4_125=getalltoa(v,t1,t2,o,a40,0);
v=esm; esm_125=getalltoa(v,t1,t2,o,a40,1);
v=esm; esm_125x=getalltoa(v,t1,t2,o,a40,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='Fig6'; xy=[-90 90 -2.5 1.5]; xy1=[-90 90 -3 4.2];
pms=[ 0, 0, 1000, 1000]*1; fsize=9.5; lw=1; s0='(%4.2f)'; minus=char(8212);
handle = figure('Position', pms,'visible','on'); row=3; col=2;
ss1='CM4.0'; ss2='SPEAR'; ss3='SPEAR-SV'; ss4='ESM2M'; minus=char(8211);
ss5=sprintf('CM4.0 %c SPEAR',minus);
ss6=sprintf('SPEAR %c SPEAR-SV',minus);
ss7=sprintf('CM4.0 %c SPEAR-SV',minus);
ss8=sprintf('CM4.0 %c ESM2M',   minus);
ss5=sprintf('CM4.0 $-$ SPEAR');
ss6=sprintf('SPEAR $-$ SPEAR-SV');
ss7=sprintf('CM4.0 $-$ SPEAR-SV');
ss8=sprintf('CM4.0 $-$ ESM2M');
%ss9=sprintf('CM4.0 %c ESM2M-NV', minus);
subplot(row,col,1); lat=v.c0.s.lat;
y1=cm4_125.netrad; %plot(lat,y1,'k','LineWidth',lw); hold on;
y2=sp1_125.netrad; %plot(lat,y2,'c','LineWidth',lw); hold on;
y3=sp4_125.netrad; %plot(lat,y3,'m','LineWidth',lw); hold on;
y4=esm_125.netrad; %plot(lat,y4,'m','LineWidth',lw); hold on;
%yx=esm_125x.netrad; %plot(lat,y4,'m','LineWidth',lw); hold on;
y5=y1-y2; plot(lat,y5,'r','LineWidth',lw); hold on;%plot(lat,z1+z2+z3,'r*','LineWidth',lw);
y6=y2-y3; plot(lat,y6,'g','LineWidth',lw); hold on;%plot(lat,z1+z2+z3,'r*','LineWidth',lw);
y7=y1-y3; plot(lat,y7,'b','LineWidth',lw); hold on;%plot(lat,z1+z2+z3,'r*','LineWidth',lw);
y8=y1-y4; plot(lat,y8,'k','LineWidth',lw); hold on;%plot(lat,z1+z2+z3,'r*','LineWidth',lw);
%y9=y1-yx; plot(lat,y9,'k--','LineWidth',lw); hold on;%plot(lat,z1+z2+z3,'r*','LineWidth',lw);
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.netrad0);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.netrad0);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.netrad0);
s4=sprintf(char(strcat(ss4,{' '},s0)),esm_125.netrad0);
s5=sprintf(char(strcat(ss5,{' '},s0)),cm4_125.netrad0-sp1_125.netrad0);
s6=sprintf(char(strcat(ss6,{' '},s0)),sp1_125.netrad0-sp4_125.netrad0);
s7=sprintf(char(strcat(ss7,{' '},s0)),cm4_125.netrad0-sp4_125.netrad0);
s8=sprintf(char(strcat(ss8,{' '},s0)),cm4_125.netrad0-esm_125.netrad0);
%s9=sprintf(char(strcat(ss9,{' '},s0)),cm4_125.netrad0-esm_125x.netrad0);
%legend(s1,s2,s3,s4,s5,'location','south'); 
legend(s5,s6,s7,s8,'location','north','Interpreter','latex'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize,'Interpreter','latex');
yl='TOA net radiative feedback (W/m2/K)';
ylabel(yl,'FontSize',fsize,'Interpreter','latex'); 
mylabel(xy1,1,'(a)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);
subplot(row,col,3)
y1=cm4_125.ttcf; %plot(lat,y1,'r','LineWidth',lw); hold on;
y2=sp1_125.ttcf; %plot(lat,y2,'b','LineWidth',lw); hold on;
y3=sp4_125.ttcf; %plot(lat,y3,'c','LineWidth',lw); hold on;
y4=esm_125.ttcf; %plot(lat,y4,'c','LineWidth',lw); hold on;
y5=y1-y2; plot(lat,y5,'r','LineWidth',lw); hold on; 
y6=y2-y3; plot(lat,y6,'g','LineWidth',lw); hold on;
y7=y1-y3; plot(lat,y7,'b','LineWidth',lw); hold on; 
y8=y1-y4; plot(lat,y8,'k','LineWidth',lw); hold on; z1=y8;
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.ttcf0);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.ttcf0);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.ttcf0);
s4=sprintf(char(strcat(ss4,{' '},s0)),esm_125.ttcf0);
s5=sprintf(char(strcat(ss5,{' '},s0)),cm4_125.ttcf0-sp1_125.ttcf0);
s6=sprintf(char(strcat(ss6,{' '},s0)),sp1_125.ttcf0-sp4_125.ttcf0);
s7=sprintf(char(strcat(ss7,{' '},s0)),cm4_125.ttcf0-sp4_125.ttcf0);
s8=sprintf(char(strcat(ss8,{' '},s0)),cm4_125.ttcf0-esm_125.ttcf0);
%legend(s1,s2,s3,s4,s5,'location','north'); 
legend(s5,s6,s7,s8,'location','north','Interpreter','latex'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize,'Interpreter','latex');
yl='TOA net cloud feedback (W/m2/K)';
ylabel(yl,'FontSize',fsize,'Interpreter','latex'); 
mylabel(xy1,1,'(b)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);
subplot(row,col,5);
y1=-cm4_125.lwnet_clr; %plot(lat,y1,'r','LineWidth',lw); hold on;
y2=-sp1_125.lwnet_clr; %plot(lat,y2,'b','LineWidth',lw); hold on;
y3=-sp4_125.lwnet_clr; %plot(lat,y3,'c','LineWidth',lw); hold on;
y4=-esm_125.lwnet_clr; %plot(lat,y4,'c','LineWidth',lw); hold on;
y5=y1-y2; plot(lat,y5,'r','LineWidth',lw); hold on; 
y6=y2-y3; plot(lat,y6,'g','LineWidth',lw); hold on;
y7=y1-y3; plot(lat,y7,'b','LineWidth',lw); hold on; 
y8=y1-y4; plot(lat,y8,'k','LineWidth',lw); hold on; z2=y8;
s1=sprintf(char(strcat(ss1,{' '},s0)),-cm4_125.lwnet_clr0);
s2=sprintf(char(strcat(ss2,{' '},s0)),-sp1_125.lwnet_clr0);
s3=sprintf(char(strcat(ss3,{' '},s0)),-sp4_125.lwnet_clr0);
s4=sprintf(char(strcat(ss4,{' '},s0)),-esm_125.lwnet_clr0);
s5=sprintf(char(strcat(ss5,{' '},s0)),-(cm4_125.lwnet_clr0-sp1_125.lwnet_clr0));
s6=sprintf(char(strcat(ss6,{' '},s0)),-(sp1_125.lwnet_clr0-sp4_125.lwnet_clr0));
s7=sprintf(char(strcat(ss7,{' '},s0)),-(cm4_125.lwnet_clr0-sp4_125.lwnet_clr0));
s8=sprintf(char(strcat(ss8,{' '},s0)),-(cm4_125.lwnet_clr0-esm_125.lwnet_clr0));
%legend(s1,s2,s3,s4,s5,'location','north'); 
legend(s5,s6,s7,s8,'location','north','Interpreter','latex'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize,'Interpreter','latex');
yl='TOA clear-sky LW feedback (W/m2/K)';
ylabel(yl,'FontSize',fsize,'Interpreter','latex'); 
mylabel(xy1,1,'(c)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);

subplot(row,col,2); 
y1=cm4_125.swnet_clr; %plot(lat,y1,'r','LineWidth',lw); hold on;
y2=sp1_125.swnet_clr; %plot(lat,y2,'b','LineWidth',lw); hold on;
y3=sp4_125.swnet_clr; %plot(lat,y3,'c','LineWidth',lw); hold on;
y4=esm_125.swnet_clr; %plot(lat,y3,'c','LineWidth',lw); hold on;
y5=y1-y2; plot(lat,y5,'r','LineWidth',lw); hold on; 
y6=y2-y3; plot(lat,y6,'g','LineWidth',lw); hold on;
y7=y1-y3; plot(lat,y7,'b','LineWidth',lw); hold on; 
y8=y1-y4; plot(lat,y8,'k','LineWidth',lw); hold on; z3=y8;
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.swnet_clr0);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.swnet_clr0);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.swnet_clr0);
s4=sprintf(char(strcat(ss4,{' '},s0)),esm_125.swnet_clr0);
s5=sprintf(char(strcat(ss5,{' '},s0)),cm4_125.swnet_clr0-sp1_125.swnet_clr0);
s6=sprintf(char(strcat(ss6,{' '},s0)),sp1_125.swnet_clr0-sp4_125.swnet_clr0);
s7=sprintf(char(strcat(ss7,{' '},s0)),cm4_125.swnet_clr0-sp4_125.swnet_clr0);
s8=sprintf(char(strcat(ss8,{' '},s0)),cm4_125.swnet_clr0-esm_125.swnet_clr0);
%legend(s1,s2,s3,s4,s5,'location','north'); 
legend(s5,s6,s7,s8,'location','north','Interpreter','latex'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize,'Interpreter','latex');
yl='TOA clear-sky SW feedback (W/m2/K)';
ylabel(yl,'FontSize',fsize,'Interpreter','latex'); 
mylabel(xy1,1,'(d)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);

subplot(row,col,4); 
y1=cm4_125.ice*100; %plot(lat,y1,'r','LineWidth',lw); hold on;
y2=sp1_125.ice*100; %plot(lat,y2,'b','LineWidth',lw); hold on;
y3=sp4_125.ice*100; %plot(lat,y3,'c','LineWidth',lw); hold on;
y4=esm_125.ice*100; %plot(lat,y3,'c','LineWidth',lw); hold on;
y5=y1-y2; plot(lat,y5,'r','LineWidth',lw); hold on;
y6=y2-y3; plot(lat,y6,'g','LineWidth',lw); hold on;
y7=y1-y3; plot(lat,y7,'b','LineWidth',lw); hold on;
y8=y1-y4; plot(lat,y8,'k','LineWidth',lw); hold on;
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.ice0*100);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.ice0*100);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.ice0*100);
s4=sprintf(char(strcat(ss4,{' '},s0)),esm_125.ice0*100);
s5=sprintf(char(strcat(ss5,{' '},s0)),cm4_125.ice0*100-sp1_125.ice0*100);
s6=sprintf(char(strcat(ss6,{' '},s0)),sp1_125.ice0*100-sp4_125.ice0*100);
s7=sprintf(char(strcat(ss7,{' '},s0)),cm4_125.ice0*100-sp4_125.ice0*100);
s8=sprintf(char(strcat(ss8,{' '},s0)),cm4_125.ice0*100-esm_125.ice0*100);
%legend(s1,s2,s3,s4,s5,'location','north'); 
legend(s5,s6,s7,s8,'location','south','Interpreter','latex'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize,'Interpreter','latex');
yl='change in sea-ice concentration (\%/K)';
ylabel(yl,'FontSize',fsize,'Interpreter','latex'); 
mylabel([-90 90 -6 3],1,'(e)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);

subplot(row,col,6); ls1='-'; ls2='--'; ax1=gca;
y1=cm4_125.lai; %plot(lat,y1,'r','LineWidth',lw); hold on;
y2=sp1_125.lai; %plot(lat,y2,'b','LineWidth',lw); hold on;
y3=sp4_125.lai; %plot(lat,y3,'c','LineWidth',lw); hold on;
y4=esm_125.lai; %plot(lat,y4,'c','LineWidth',lw); hold on;
y5=y1-y2; line(lat,y5,'Color','r','LineWidth',lw,'LineStyle',ls1); hold on;
y6=y2-y3; line(lat,y6,'Color','g','LineWidth',lw,'LineStyle',ls1); hold on;
y7=y1-y3; line(lat,y7,'Color','b','LineWidth',lw,'LineStyle',ls1); hold on;
%y8=y1-y4; line(lat,y8,'Color','k','LineWidth',lw,'LineStyle',ls1); hold on;
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.lai0);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.lai0);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.lai0);
s4=sprintf(char(strcat(ss4,{' '},s0)),esm_125.lai0);
s5=sprintf(char(strcat(ss5,{' '},s0)),cm4_125.lai0-sp1_125.lai0);
s6=sprintf(char(strcat(ss6,{' '},s0)),sp1_125.lai0-sp4_125.lai0);
s7=sprintf(char(strcat(ss7,{' '},s0)),cm4_125.lai0-sp4_125.lai0);
s8=sprintf(char(strcat(ss8,{' '},s0)),cm4_125.lai0-esm_125.lai0);
%legend(s5,s6,s7,s8,'location','northwest'); legend('boxoff');
legend(s5,s6,s7,'location','northwest','Interpreter','latex'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize,'Interpreter','latex');
yl='change in LAI (m2/m2/K)';
ylabel(yl,'FontSize',fsize,'Interpreter','latex'); 
mylabel([-90 90 -1 1],1,'(f)',fsize);
set(gca,'FontSize',fsize-2); %box on; %title(vname,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','none','YColor',[0.2 0.2 0.2]);
y1=cm4_125.fsw; %plot(lat,y1,'r','LineWidth',lw); hold on;
y2=sp1_125.fsw; %plot(lat,y2,'b','LineWidth',lw); hold on;
y3=sp4_125.fsw; %plot(lat,y3,'c','LineWidth',lw); hold on;
y4=esm_125.fsw; %plot(lat,y3,'c','LineWidth',lw); hold on;
y5=y1-y2; line(lat,y5,'Color','r','LineWidth',lw,'LineStyle',ls2); hold on;
y6=y2-y3; line(lat,y6,'Color','g','LineWidth',lw,'LineStyle',ls2); hold on;
y7=y1-y3; line(lat,y7,'Color','b','LineWidth',lw,'LineStyle',ls2); hold on;
%y8=y1-y4; line(lat,y8,'Color','k','LineWidth',lw,'LineStyle',ls2); hold on;
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.fsw0);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.fsw0);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.fsw0);
s4=sprintf(char(strcat(ss4,{' '},s0)),esm_125.fsw0);
s5=sprintf(char(strcat(ss5,{' '},s0)),cm4_125.fsw0-sp1_125.fsw0);
s6=sprintf(char(strcat(ss6,{' '},s0)),sp1_125.fsw0-sp4_125.fsw0);
s7=sprintf(char(strcat(ss7,{' '},s0)),cm4_125.fsw0-sp4_125.fsw0);
s8=sprintf(char(strcat(ss8,{' '},s0)),cm4_125.fsw0-esm_125.fsw0);
%legend(s5,s6,s7,s8,'location','southeast'); legend('boxoff');
legend(s5,s6,s7,'location','southeast','Interpreter','latex'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize,'Interpreter','latex');
yl='change in SW radiation into land (W/m2/K)';
ylabel(yl,'FontSize',fsize,'Interpreter','latex'); 
mylabel([-90 90 -5 10],1,'(f)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);
ylabel(yl,'FontSize',fsize-1); 
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LATEST===FIGS6=== change in zonal mean TOA radiative flux CM4/SPEAR/SPEAR-SV
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t1=26; t2=75; 
v=CM4; cm4_50 =getalltoa(v,t1,t2,o,a40,1);
v=SP1; sp1_50 =getalltoa(v,t1,t2,o,a40,1);
v=SP4; sp4_50 =getalltoa(v,t1,t2,o,a40,0);
v=esm; esm_50 =getalltoa(v,t1,t2,o,a40,1);
t1=101; t2=150; 
v=CM4; cm4_125=getalltoa(v,t1,t2,o,a40,1);
v=SP1; sp1_125=getalltoa(v,t1,t2,o,a40,1);
v=SP4; sp4_125=getalltoa(v,t1,t2,o,a40,0);
v=esm; esm_125=getalltoa(v,t1,t2,o,a40,1);
v=esm; esm_125x=getalltoa(v,t1,t2,o,a40,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='FigS6'; xy=[-90 90 -1 1]; xy1=[-90 90 -1 1];
pms=[ 0, 0, 1000, 1000]*1; fsize=9.5; lw=1; s0='(%4.2f)'; minus=char(8212);
handle = figure('Position', pms,'visible','on'); row=3; col=2;
ss1='CM4.0'; ss2='SPEAR'; ss3='SPEAR-SV'; ss4='ESM2M'; 
ss5=sprintf('CM4.0 (Y125 %c Y50)',minus);
ss6=sprintf('SPEAR (Y125 %c Y50)',minus);
ss7=sprintf('SPEAR-SV (Y125 %c Y50)',minus);
ss8=sprintf('ESM2M (Y125 %c Y50)',   minus);
%ss9=sprintf('CM4.0 %c ESM2M-NV', minus);
subplot(row,col,1); lat=v.c0.s.lat;
y1=cm4_125.netrad-cm4_50.netrad; %plot(lat,y1,'k','LineWidth',lw); hold on;
y2=sp1_125.netrad-sp1_50.netrad; %plot(lat,y2,'c','LineWidth',lw); hold on;
y3=sp4_125.netrad-sp4_50.netrad; %plot(lat,y3,'m','LineWidth',lw); hold on;
y4=esm_125.netrad-esm_50.netrad; %plot(lat,y4,'m','LineWidth',lw); hold on;
plot(lat,y1,'r','LineWidth',lw); hold on;%plot(lat,z1+z2+z3,'r*','LineWidth',lw);
plot(lat,y2,'g','LineWidth',lw); hold on;%plot(lat,z1+z2+z3,'r*','LineWidth',lw);
plot(lat,y3,'b','LineWidth',lw); hold on;%plot(lat,z1+z2+z3,'r*','LineWidth',lw);
plot(lat,y4,'k','LineWidth',lw); hold on;%plot(lat,z1+z2+z3,'r*','LineWidth',lw);
s1=sprintf(char(strcat(ss5,{' '},s0)),cm4_125.netrad0-cm4_50.netrad0);
s2=sprintf(char(strcat(ss6,{' '},s0)),sp1_125.netrad0-sp1_50.netrad0);
s3=sprintf(char(strcat(ss7,{' '},s0)),sp4_125.netrad0-sp4_50.netrad0);
s4=sprintf(char(strcat(ss8,{' '},s0)),esm_125.netrad0-esm_50.netrad0);
legend(s1,s2,s3,s4,'location','south'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='TOA net radiative feedback (W/m2/K)';
ylabel(yl,'FontSize',fsize); mylabel(xy1,1,'(a)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);

subplot(row,col,3)
y1=cm4_125.ttcf; %plot(lat,y1,'r','LineWidth',lw); hold on;
y2=sp1_125.ttcf; %plot(lat,y2,'b','LineWidth',lw); hold on;
y3=sp4_125.ttcf; %plot(lat,y3,'c','LineWidth',lw); hold on;
y4=esm_125.ttcf; %plot(lat,y4,'c','LineWidth',lw); hold on;
y5=y1-y2; plot(lat,y5,'r','LineWidth',lw); hold on; 
y6=y2-y3; plot(lat,y6,'g','LineWidth',lw); hold on;
y7=y1-y3; plot(lat,y7,'b','LineWidth',lw); hold on; 
y8=y1-y4; plot(lat,y8,'k','LineWidth',lw); hold on; z1=y8;
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.ttcf0);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.ttcf0);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.ttcf0);
s4=sprintf(char(strcat(ss4,{' '},s0)),esm_125.ttcf0);
s5=sprintf(char(strcat(ss5,{' '},s0)),cm4_125.ttcf0-sp1_125.ttcf0);
s6=sprintf(char(strcat(ss6,{' '},s0)),sp1_125.ttcf0-sp4_125.ttcf0);
s7=sprintf(char(strcat(ss7,{' '},s0)),cm4_125.ttcf0-sp4_125.ttcf0);
s8=sprintf(char(strcat(ss8,{' '},s0)),cm4_125.ttcf0-esm_125.ttcf0);
%legend(s1,s2,s3,s4,s5,'location','north'); 
legend(s5,s6,s7,s8,'location','south'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='TOA net cloud radiative feedback (W/m2/K)';
ylabel(yl,'FontSize',fsize); mylabel(xy1,1,'(b)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);
subplot(row,col,5);
y1=-cm4_125.lwnet_clr; %plot(lat,y1,'r','LineWidth',lw); hold on;
y2=-sp1_125.lwnet_clr; %plot(lat,y2,'b','LineWidth',lw); hold on;
y3=-sp4_125.lwnet_clr; %plot(lat,y3,'c','LineWidth',lw); hold on;
y4=-esm_125.lwnet_clr; %plot(lat,y4,'c','LineWidth',lw); hold on;
y5=y1-y2; plot(lat,y5,'r','LineWidth',lw); hold on; 
y6=y2-y3; plot(lat,y6,'g','LineWidth',lw); hold on;
y7=y1-y3; plot(lat,y7,'b','LineWidth',lw); hold on; 
y8=y1-y4; plot(lat,y8,'k','LineWidth',lw); hold on; z2=y8;
s1=sprintf(char(strcat(ss1,{' '},s0)),-cm4_125.lwnet_clr0);
s2=sprintf(char(strcat(ss2,{' '},s0)),-sp1_125.lwnet_clr0);
s3=sprintf(char(strcat(ss3,{' '},s0)),-sp4_125.lwnet_clr0);
s4=sprintf(char(strcat(ss4,{' '},s0)),-esm_125.lwnet_clr0);
s5=sprintf(char(strcat(ss5,{' '},s0)),-(cm4_125.lwnet_clr0-sp1_125.lwnet_clr0));
s6=sprintf(char(strcat(ss6,{' '},s0)),-(sp1_125.lwnet_clr0-sp4_125.lwnet_clr0));
s7=sprintf(char(strcat(ss7,{' '},s0)),-(cm4_125.lwnet_clr0-sp4_125.lwnet_clr0));
s8=sprintf(char(strcat(ss8,{' '},s0)),-(cm4_125.lwnet_clr0-esm_125.lwnet_clr0));
%legend(s1,s2,s3,s4,s5,'location','north'); 
legend(s5,s6,s7,s8,'location','south'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='TOA clear-sky LW feedback (W/m2/K)';
ylabel(yl,'FontSize',fsize); mylabel(xy1,1,'(c)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);

subplot(row,col,2); 
y1=cm4_125.swnet_clr; %plot(lat,y1,'r','LineWidth',lw); hold on;
y2=sp1_125.swnet_clr; %plot(lat,y2,'b','LineWidth',lw); hold on;
y3=sp4_125.swnet_clr; %plot(lat,y3,'c','LineWidth',lw); hold on;
y4=esm_125.swnet_clr; %plot(lat,y3,'c','LineWidth',lw); hold on;
y5=y1-y2; plot(lat,y5,'r','LineWidth',lw); hold on; 
y6=y2-y3; plot(lat,y6,'g','LineWidth',lw); hold on;
y7=y1-y3; plot(lat,y7,'b','LineWidth',lw); hold on; 
y8=y1-y4; plot(lat,y8,'k','LineWidth',lw); hold on; z3=y8;
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.swnet_clr0);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.swnet_clr0);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.swnet_clr0);
s4=sprintf(char(strcat(ss4,{' '},s0)),esm_125.swnet_clr0);
s5=sprintf(char(strcat(ss5,{' '},s0)),cm4_125.swnet_clr0-sp1_125.swnet_clr0);
s6=sprintf(char(strcat(ss6,{' '},s0)),sp1_125.swnet_clr0-sp4_125.swnet_clr0);
s7=sprintf(char(strcat(ss7,{' '},s0)),cm4_125.swnet_clr0-sp4_125.swnet_clr0);
s8=sprintf(char(strcat(ss8,{' '},s0)),cm4_125.swnet_clr0-esm_125.swnet_clr0);
%legend(s1,s2,s3,s4,s5,'location','north'); 
legend(s5,s6,s7,s8,'location','south'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='TOA clear-sky SW feedback (W/m2/K)';
ylabel(yl,'FontSize',fsize); mylabel(xy1,1,'(d)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);

subplot(row,col,4); 
y1=cm4_125.ice*100; %plot(lat,y1,'r','LineWidth',lw); hold on;
y2=sp1_125.ice*100; %plot(lat,y2,'b','LineWidth',lw); hold on;
y3=sp4_125.ice*100; %plot(lat,y3,'c','LineWidth',lw); hold on;
y4=esm_125.ice*100; %plot(lat,y3,'c','LineWidth',lw); hold on;
y5=y1-y2; plot(lat,y5,'r','LineWidth',lw); hold on;
y6=y2-y3; plot(lat,y6,'g','LineWidth',lw); hold on;
y7=y1-y3; plot(lat,y7,'b','LineWidth',lw); hold on;
y8=y1-y4; plot(lat,y8,'k','LineWidth',lw); hold on;
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.ice0*100);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.ice0*100);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.ice0*100);
s4=sprintf(char(strcat(ss4,{' '},s0)),esm_125.ice0*100);
s5=sprintf(char(strcat(ss5,{' '},s0)),cm4_125.ice0*100-sp1_125.ice0*100);
s6=sprintf(char(strcat(ss6,{' '},s0)),sp1_125.ice0*100-sp4_125.ice0*100);
s7=sprintf(char(strcat(ss7,{' '},s0)),cm4_125.ice0*100-sp4_125.ice0*100);
s8=sprintf(char(strcat(ss8,{' '},s0)),cm4_125.ice0*100-esm_125.ice0*100);
%legend(s1,s2,s3,s4,s5,'location','north'); 
legend(s5,s6,s7,s8,'location','south'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='change in sea-ice concentration (%/K)';
ylabel(yl,'FontSize',fsize); mylabel([-90 90 -6 3],1,'(e)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);

subplot(row,col,6); ls1='-'; ls2='--'; ax1=gca;
y1=cm4_125.lai; %plot(lat,y1,'r','LineWidth',lw); hold on;
y2=sp1_125.lai; %plot(lat,y2,'b','LineWidth',lw); hold on;
y3=sp4_125.lai; %plot(lat,y3,'c','LineWidth',lw); hold on;
y4=esm_125.lai; %plot(lat,y4,'c','LineWidth',lw); hold on;
y5=y1-y2; line(lat,y5,'Color','r','LineWidth',lw,'LineStyle',ls1); hold on;
y6=y2-y3; line(lat,y6,'Color','g','LineWidth',lw,'LineStyle',ls1); hold on;
y7=y1-y3; line(lat,y7,'Color','b','LineWidth',lw,'LineStyle',ls1); hold on;
%y8=y1-y4; line(lat,y8,'Color','k','LineWidth',lw,'LineStyle',ls1); hold on;
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.lai0);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.lai0);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.lai0);
s4=sprintf(char(strcat(ss4,{' '},s0)),esm_125.lai0);
s5=sprintf(char(strcat(ss5,{' '},s0)),cm4_125.lai0-sp1_125.lai0);
s6=sprintf(char(strcat(ss6,{' '},s0)),sp1_125.lai0-sp4_125.lai0);
s7=sprintf(char(strcat(ss7,{' '},s0)),cm4_125.lai0-sp4_125.lai0);
s8=sprintf(char(strcat(ss8,{' '},s0)),cm4_125.lai0-esm_125.lai0);
%legend(s5,s6,s7,s8,'location','northwest'); legend('boxoff');
legend(s5,s6,s7,'location','northwest'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='change in LAI (m2/m2/K)';
ylabel(yl,'FontSize',fsize); mylabel([-90 90 -1 1],1,'(f)',fsize);
set(gca,'FontSize',fsize-2); %box on; %title(vname,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','none','YColor',[0.2 0.2 0.2]);
y1=cm4_125.fsw; %plot(lat,y1,'r','LineWidth',lw); hold on;
y2=sp1_125.fsw; %plot(lat,y2,'b','LineWidth',lw); hold on;
y3=sp4_125.fsw; %plot(lat,y3,'c','LineWidth',lw); hold on;
y4=esm_125.fsw; %plot(lat,y3,'c','LineWidth',lw); hold on;
y5=y1-y2; line(lat,y5,'Color','r','LineWidth',lw,'LineStyle',ls2); hold on;
y6=y2-y3; line(lat,y6,'Color','g','LineWidth',lw,'LineStyle',ls2); hold on;
y7=y1-y3; line(lat,y7,'Color','b','LineWidth',lw,'LineStyle',ls2); hold on;
%y8=y1-y4; line(lat,y8,'Color','k','LineWidth',lw,'LineStyle',ls2); hold on;
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.fsw0);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.fsw0);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.fsw0);
s4=sprintf(char(strcat(ss4,{' '},s0)),esm_125.fsw0);
s5=sprintf(char(strcat(ss5,{' '},s0)),cm4_125.fsw0-sp1_125.fsw0);
s6=sprintf(char(strcat(ss6,{' '},s0)),sp1_125.fsw0-sp4_125.fsw0);
s7=sprintf(char(strcat(ss7,{' '},s0)),cm4_125.fsw0-sp4_125.fsw0);
s8=sprintf(char(strcat(ss8,{' '},s0)),cm4_125.fsw0-esm_125.fsw0);
%legend(s5,s6,s7,s8,'location','southeast'); legend('boxoff');
legend(s5,s6,s7,'location','southeast'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='{          }change in net SW radiation into land surface (W/m2/K)';
ylabel(yl,'FontSize',fsize-2); mylabel([-90 90 -5 10],1,'(f)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);
ylabel(yl,'FontSize',fsize-2.5); 
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%LATEST===FIGS1=== FigS2: LAI map%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dlai_map_panel'; vname='FigS2'; opt=0; co='k';
t1=26;  t2=75;  d1=gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
t1=101; t2=150; d2=gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
cmin =-7;  cmax =7;  cmin1=-3; cmax1=3;
cmin2=-30; cmax2=30; cmin3=-5; cmax3=5; unit1='m2/m2'; unit2='W/m2';
pms=[ 0, 0, 1600, 1200]*0.7; fsize=7; row=4; col=3;
handle = figure('Position', pms,'visible','on'); minus=char(8212);
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet(256));
subplot(row,col,1); t1=6; t2=14; v=CM4; %t1=8; t2=12; v=SP1;
a=mean(v.w0.sfc.lai.ann(t1:t2,:,:),1)-mean(v.c0.sfc.lai.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1); a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); s=sprintf('(a) CM4.0 (Y50; \\DeltaLAI=%4.2f)',b);
title(s,'FontSize',fsize); %title(h,'m2/m2','FontSize',6);
subplot(row,col,2); t1=21; t2=30; v=CM4;
a=mean(v.w0.sfc.lai.ann(t1:t2,:,:),1)-mean(v.c0.sfc.lai.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1); a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); s=sprintf('(b) CM4.0 (Y125; \\DeltaLAI=%4.2f)',b);
title(s,'FontSize',fsize); %title(h,'m2/m2','FontSize',6);
subplot(row,col,3); a=a2-a1; b=b2-b1; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); s=sprintf('(c) (b) %c (a) (\\DeltaLAI=%4.2f)',minus,b);
title(s,'FontSize',fsize); %title(h,'m2/m2','FontSize',6);
subplot(row,col,4); t1=6; t2=14; v=SP1; %t1=8; t2=12; v=SP1;
a=mean(v.w0.sfc.lai.ann(t1:t2,:,:),1)-mean(v.c0.sfc.lai.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1); a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); s=sprintf('(d) SPEAR (Y50; \\DeltaLAI=%4.2f)',b);
title(s,'FontSize',fsize); %title(h,'m2/m2','FontSize',6);
subplot(row,col,5); t1=21; t2=30; v=SP1;
a=mean(v.w0.sfc.lai.ann(t1:t2,:,:),1)-mean(v.c0.sfc.lai.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1); a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); s=sprintf('(e) SPEAR (Y125; \\DeltaLAI=%4.2f)',b);
title(s,'FontSize',fsize); %title(h,'m2/m2','FontSize',6);

cb0=colorbar('FontSize',fsize+2,'Location','westoutside');
set(cb0, 'Position', [0.08 0.55 0.02 0.37]); caxis([cmin cmax]); 
cb0.Label.String = unit1; pos=get(cb0,'Position');
cb0.Label.Position = [pos(1)+0.5 pos(2)+6.6]; 
cb0.Label.Rotation = 0;

subplot(row,col,6); a=a5-a4; b=b5-b4; a6=a; b6=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); s=sprintf('(f) (e) %c (d) (\\DeltaLAI=%4.2f)',minus,b);
title(s,'FontSize',fsize); %title(h,'m2/m2','FontSize',6);

cb1=colorbar('FontSize',fsize+2,'Location','eastoutside');
set(cb1, 'Position', [0.92 0.55 0.02 0.37]); caxis([cmin1 cmax1]); 
cb1.Label.String = unit1; pos=get(cb1,'Position');
cb1.Label.Position = [pos(1)-0.1 pos(2)+2.8]; 
cb1.Label.Rotation = 0;

subplot(row,col,7); t1=6; t2=14; v=SP1;
a=mean(v.w0.sfc.fsw.ann(t1:t2,:,:),1)-mean(v.c0.sfc.fsw.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1); a7=a; b7=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co);  %title(h,'W/m2','FontSize',6);
s=sprintf('(g) SPEAR (Y50; \\DeltaSWR=%4.2f)',b);
title(s,'FontSize',fsize);
subplot(row,col,8); t1=21; t2=30; v=SP1;
a=mean(v.w0.sfc.fsw.ann(t1:t2,:,:),1)-mean(v.c0.sfc.fsw.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1); a8=a; b8=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co);  %title(h,'W/m2','FontSize',6);
s=sprintf('(h) SPEAR (Y125; \\DeltaSWR=%4.2f)',b);
title(s,'FontSize',fsize); %colormap(parula);
subplot(row,col,9); a=a8-a7; b=b8-b7; a9=a; b9=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin3 cmax3]);
contour(lon,lat,lm,1,co); s=sprintf('(i) (h) %c (g) (\\DeltaSWR=%4.2f)',minus,b);
title(s,'FontSize',fsize); %title(h,'W/m2','FontSize',6);

subplot(row,col,10); t1=6; t2=14; v=SP4;
a=mean(v.w0.sfc.fsw.ann(t1:t2,:,:),1)-mean(v.c0.sfc.fsw.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1); 
a=a7-a; b=b7-b; a10=a; b10=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co); 
s=sprintf('(j) SPEAR %c SPEAR-SV (Y50; \\DeltaSWR=%4.2f)',minus,b);
title(s,'FontSize',fsize); %title(h,'                    W2/m2','FontSize',6);
subplot(row,col,11); t1=21; t2=30; v=SP4;
a=mean(v.w0.sfc.fsw.ann(t1:t2,:,:),1)-mean(v.c0.sfc.fsw.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1);
a=a8-a; b=b8-b; a11=a; b11=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co); 
s=sprintf('(k) SPEAR %c SPEAR-SV (Y125; \\DeltaSWR=%4.2f)',minus,b);
title(s,'FontSize',fsize); %title(h,'                   W2/m2','FontSize',6);

cb2=colorbar('FontSize',fsize+2,'Location','westoutside');
set(cb2, 'Position', [0.08 0.12 0.02 0.35]); caxis([cmin2 cmax2]); 
cb2.Label.String = unit2; pos=get(cb2,'Position');
cb2.Label.Position = [pos(1)+0.5 pos(2)+30]; 
cb2.Label.Rotation = 0;

subplot(row,col,12); a=a11-a10; b=b11-b10; 
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin3 cmax3]);
contour(lon,lat,lm,1,co); s=sprintf('(l) (k) %c (j) (\\DeltaSWR=%4.2f)',minus,b);
title(s,'FontSize',fsize); %title(h,'W2/m2','FontSize',6);

cb3=colorbar('FontSize',fsize+2,'Location','westoutside');
set(cb3, 'Position', [0.92 0.12 0.02 0.35]); caxis([cmin3 cmax3]); 
cb3.Label.String = unit2; pos=get(cb3,'Position')
cb3.Label.Position = [pos(1)+0. pos(2)+5.5]; 
cb3.Label.Rotation = 0;

nn=256; cmap=bluewhitered_miz(nn);   colormap(cmap);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%test on snow distribution
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
c0=CM4.c0; w0=CM4.w0; co='w';
a=c0.sfc.snow_water.ann; a(a<0|a>200)=NaN; snw_cntl =squeeze(nanmean(a(1:20,:,:),1));
a=w0.sfc.snow_water.ann; a(a<0|a>200)=NaN; snw_4xco2=squeeze(nanmean(a(1:20,:,:),1));
figure; 
plot(lat,nanmean(snw_cntl, 2),'b');hold on;
plot(lat,nanmean(snw_4xco2,2),'r');hold on;
figure; 
plot(lat,nanmean(snw_4xco2-snw_cntl, 2),'b');hold on;

a=c0.sfc.lai.ann; lai_cntl =squeeze(nanmean(a(1:20,:,:),1));
a=w0.sfc.lai.ann; lai_4xco2=squeeze(nanmean(a(1:20,:,:),1));
figure; 
plot(lat,nanmean(lai_cntl, 2),'b');hold on;
plot(lat,nanmean(lai_4xco2,2),'r');hold on;
figure; 
plot(lat,nanmean(lai_4xco2-lai_cntl, 2),'b');hold on;

c0=SP1.c0; w0=SP1.w0; co='w';
a=c0.sfc.snow_cv.ann+c0.sfc.snow_ls.ann;
a=mean(mean(a(1:20,:,:),1),3); snow_cntl=squeeze(a*86400); 
a=w0.sfc.snow_cv.ann+w0.sfc.snow_ls.ann; t1=6;  t2=14;
a=mean(mean(a(t1:t2,:,:),1),3); snow_warm1=squeeze(a*86400); 
a=w0.sfc.snow_cv.ann+w0.sfc.snow_ls.ann; t1=21; t2=30;
a=mean(mean(a(t1:t2,:,:),1),3); snow_warm2=squeeze(a*86400); 
figure;
plot(lat,snow_cntl, 'k'); hold on;
plot(lat,snow_warm1,'r'); hold on;
plot(lat,snow_warm2,'m'); hold on;

figure;
plot(lat,snow_warm1-snow_cntl,'r'); hold on;
plot(lat,snow_warm2-snow_cntl,'m'); hold on;


pms=[ 0, 0, 1500, 900]; fsize=7.5; row=3; col=3;  unit1='W/m2';
handle = figure('Position', pms,'visible','on'); unit2='K';
subplot(row,col,1); a=c0.sfc.snow_cv.ann+c0.sfc.snow_ls.ann;a=squeeze(mean(a(1:20,:,:),1))*86400;a0=a;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([0 1]); colormap(jet);
contour(lon,lat,lm,1,co); 
subplot(row,col,2); t1=6; t2=14; 
a=w0.sfc.snow_cv.ann+w0.sfc.snow_ls.ann; a=squeeze(mean(a(t1:t2,:,:),1))*86400;a1=a;
pcolor(lon,lat,a); hold on; shading flat; caxis([ 0 1]); colorbar; colormap(jet);
contour(lon,lat,lm,1,co); 
subplot(row,col,3);
pcolor(lon,lat,a1-a0); hold on; shading flat; caxis([-1 1]);colorbar; colormap(jet);
contour(lon,lat,lm,1,co); 

subplot(row,col,4); a=c0.sfc.snow_ls.ann;a=squeeze(mean(a(1:20,:,:),1))*86400;a0=a;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([0 1]); colormap(jet);
contour(lon,lat,lm,1,co); 
subplot(row,col,5); t1=6; t2=14; a=w0.sfc.snow_ls.ann; a=squeeze(mean(a(t1:t2,:,:),1))*86400;a1=a;
pcolor(lon,lat,a); hold on; shading flat; caxis([ 0 1]); colorbar; colormap(jet);
contour(lon,lat,lm,1,co); 
subplot(row,col,6);
pcolor(lon,lat,a1-a0); hold on; shading flat; caxis([-1 1]);colorbar; colormap(jet);
contour(lon,lat,lm,1,co); 

subplot(row,col,7); a=c0.sfc.snow_cv.ann;a=squeeze(mean(a(1:20,:,:),1))*86400;a0=a;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([0 1]); colormap(jet);
contour(lon,lat,lm,1,co); 
subplot(row,col,8); t1=6; t2=14; a=w0.sfc.snow_cv.ann; a=squeeze(mean(a(t1:t2,:,:),1))*86400;a1=a;
pcolor(lon,lat,a); hold on; shading flat; caxis([ 0 1]); colorbar; colormap(jet);
contour(lon,lat,lm,1,co); 
subplot(row,col,9);
pcolor(lon,lat,a1-a0); hold on; shading flat; caxis([-1 1]);colorbar; colormap(jet);
contour(lon,lat,lm,1,co); 

subplot(row,col,10); 
a=c0.sfc.snow_water.ann; a(a<0|a>200)=NaN; a=squeeze(nanmean(a(1:20,:,:),1));a0=a;
figure; plot(lat,nanmean(a,2));
figure; pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([0 1]); colormap(jet);
contour(lon,lat,lm,1,co); 
subplot(row,col,11); t1=6; t2=14; a=w0.sfc.snow_cv.ann; a=squeeze(mean(a(t1:t2,:,:),1))*86400;a1=a;
pcolor(lon,lat,a); hold on; shading flat; caxis([ 0 1]); colorbar; colormap(jet);
contour(lon,lat,lm,1,co); 
subplot(row,col,12);
pcolor(lon,lat,a1-a0); hold on; shading flat; caxis([-1 1]);colorbar; colormap(jet);
contour(lon,lat,lm,1,co); 

%end of test

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5n_B: individual models' feedbacks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t1=26; t2=75; 
v=CM4; cm4_50 =getalltoa(v,t1,t2,o,a40,1);
v=SP1; sp1_50 =getalltoa(v,t1,t2,o,a40,1);
v=SP4; sp4_50 =getalltoa(v,t1,t2,o,a40,1);
v=esm; esm_50 =getalltoa(v,t1,t2,o,a40,1);
t1=101; t2=150; 
v=CM4; cm4_125=getalltoa(v,t1,t2,o,a40,1);
v=SP1; sp1_125=getalltoa(v,t1,t2,o,a40,1);
v=SP4; sp4_125=getalltoa(v,t1,t2,o,a40,1);
v=esm; esm_125=getalltoa(v,t1,t2,o,a40,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='Fig5n'; xy=[-90 90 -2.5 1.5]; xy1=[-90 90 -8 8];
pms=[ 0, 0, 1000, 1000]*1; fsize=9.5; lw=1; s0='(%4.2f)';
handle = figure('Position', pms,'visible','on'); row=2; col=2;
ss1='CM4.0'; ss2='SPEAR'; ss3='SPEAR-SV'; ss4='ESM2M'; 
minus=char(8212); %ss4=sprintf('CM4.0 %c SPEAR',minus);
ss5=sprintf('SPEAR %c SPEAR-SV',minus);
ss6=sprintf('CM4.0 %c SPEAR-SV',minus);
subplot(row,col,1); lat=v.c0.s.lat;
y1=cm4_125.netrad; plot(lat,y1,'r','LineWidth',lw); hold on;
y2=sp1_125.netrad; plot(lat,y2,'b','LineWidth',lw); hold on;
y3=sp4_125.netrad; plot(lat,y3,'c','LineWidth',lw); hold on;
y4=esm_125.netrad; plot(lat,y4,'k','LineWidth',lw); hold on;
%y4=y1-y2; plot(lat,y4,'r','LineWidth',lw); hold on;%plot(lat,z1+z2+z3,'r*','LineWidth',lw);
%y5=y2-y3; plot(lat,y5,'b','LineWidth',lw); hold on;%plot(lat,z1+z2+z3,'r*','LineWidth',lw);
%y6=y1-y3; plot(lat,y6,'k','LineWidth',lw); hold on;plot(lat,z1+z2+z3,'r*','LineWidth',lw);
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.netrad0);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.netrad0);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.netrad0);
s4=sprintf(char(strcat(ss4,{' '},s0)),esm_125.netrad0);
%s4=sprintf(char(strcat(ss4,{' '},s0)),cm4_125.netrad0-sp1_125.netrad0);
%s5=sprintf(char(strcat(ss5,{' '},s0)),sp1_125.netrad0-sp4_125.netrad0);
%s6=sprintf(char(strcat(ss6,{' '},s0)),cm4_125.netrad0-sp4_125.netrad0);
legend(s1,s2,s3,s4,'location','south'); 
%legend(s4,s5,s6,'location','south'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='TOA net radiative feedback (W/m2/K)';
ylabel(yl,'FontSize',fsize); mylabel(xy1,1,'(a)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);
subplot(row,col,2)
y1=cm4_125.ttcf; plot(lat,y1,'r','LineWidth',lw); hold on;
y2=sp1_125.ttcf; plot(lat,y2,'b','LineWidth',lw); hold on;
y3=sp4_125.ttcf; plot(lat,y3,'c','LineWidth',lw); hold on;
y4=esm_125.ttcf; plot(lat,y4,'k','LineWidth',lw); hold on;
%y4=y1-y2; plot(lat,y4,'r','LineWidth',lw); hold on; 
%y5=y2-y3; plot(lat,y5,'b','LineWidth',lw); hold on;
%y6=y1-y3; plot(lat,y6,'k','LineWidth',lw); hold on; z1=y6;
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.ttcf0);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.ttcf0);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.ttcf0);
s4=sprintf(char(strcat(ss4,{' '},s0)),esm_125.ttcf0);
%s4=sprintf(char(strcat(ss4,{' '},s0)),cm4_125.ttcf0-sp1_125.ttcf0);
%s5=sprintf(char(strcat(ss5,{' '},s0)),sp1_125.ttcf0-sp4_125.ttcf0);
%s6=sprintf(char(strcat(ss6,{' '},s0)),cm4_125.ttcf0-sp4_125.ttcf0);
legend(s1,s2,s3,s4,'location','north'); 
%legend(s4,s5,s6,'location','south'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='TOA net cloud feedback (W/m2/K)';
ylabel(yl,'FontSize',fsize); mylabel(xy1,1,'(b)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);
subplot(row,col,3);
y1=-cm4_125.lwnet_clr; plot(lat,y1,'r','LineWidth',lw); hold on;
y2=-sp1_125.lwnet_clr; plot(lat,y2,'b','LineWidth',lw); hold on;
y3=-sp4_125.lwnet_clr; plot(lat,y3,'c','LineWidth',lw); hold on;
y4=-esm_125.lwnet_clr; plot(lat,y4,'k','LineWidth',lw); hold on;
%y4=y1-y2; plot(lat,y4,'r','LineWidth',lw); hold on; 
%y5=y2-y3; plot(lat,y5,'b','LineWidth',lw); hold on;
%y6=y1-y3; plot(lat,y6,'k','LineWidth',lw); hold on; z2=y6;
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.lwnet_clr0);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.lwnet_clr0);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.lwnet_clr0);
s4=sprintf(char(strcat(ss4,{' '},s0)),esm_125.lwnet_clr0);
%s4=sprintf(char(strcat(ss4,{' '},s0)),cm4_125.lwnet_clr0-sp1_125.lwnet_clr0);
%s5=sprintf(char(strcat(ss5,{' '},s0)),sp1_125.lwnet_clr0-sp4_125.lwnet_clr0);
%s6=sprintf(char(strcat(ss6,{' '},s0)),cm4_125.lwnet_clr0-sp4_125.lwnet_clr0);
legend(s1,s2,s3,s4,'location','north'); 
%legend(s4,s5,s6,'location','south'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='TOA clear-sky LW feedback (W/m2/K)';
ylabel(yl,'FontSize',fsize); mylabel(xy1,1,'(c)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);
subplot(row,col,4); 
y1=cm4_125.swnet_clr; plot(lat,y1,'r','LineWidth',lw); hold on;
y2=sp1_125.swnet_clr; plot(lat,y2,'b','LineWidth',lw); hold on;
y3=sp4_125.swnet_clr; plot(lat,y3,'c','LineWidth',lw); hold on;
y4=esm_125.swnet_clr; plot(lat,y4,'k','LineWidth',lw); hold on;
%y4=y1-y2; plot(lat,y4,'r','LineWidth',lw); hold on; 
%y5=y2-y3; plot(lat,y5,'b','LineWidth',lw); hold on;
%y6=y1-y3; plot(lat,y6,'k','LineWidth',lw); hold on; z3=y6;
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.swnet_clr0);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.swnet_clr0);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.swnet_clr0);
s4=sprintf(char(strcat(ss4,{' '},s0)),esm_125.swnet_clr0);
%s4=sprintf(char(strcat(ss4,{' '},s0)),cm4_125.swnet_clr0-sp1_125.swnet_clr0);
%s5=sprintf(char(strcat(ss5,{' '},s0)),sp1_125.swnet_clr0-sp4_125.swnet_clr0);
%s6=sprintf(char(strcat(ss6,{' '},s0)),cm4_125.swnet_clr0-sp4_125.swnet_clr0);
legend(s1,s2,s3,s4,'location','north'); 
%legend(s4,s5,s6,'location','south'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='TOA clear-sky SW feedback (W/m2/K)';
ylabel(yl,'FontSize',fsize); mylabel(xy1,1,'(d)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);

subplot(row,col,4); 
y1=cm4_125.ice*100; %plot(lat,y1,'r','LineWidth',lw); hold on;
y2=sp1_125.ice*100; %plot(lat,y2,'b','LineWidth',lw); hold on;
y3=sp4_125.ice*100; %plot(lat,y3,'c','LineWidth',lw); hold on;
y4=y1-y2; plot(lat,y4,'r','LineWidth',lw); hold on;
y5=y2-y3; plot(lat,y5,'b','LineWidth',lw); hold on;
y6=y1-y3; plot(lat,y6,'k','LineWidth',lw); hold on;
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.ice0*100);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.ice0*100);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.ice0*100);
s4=sprintf(char(strcat(ss4,{' '},s0)),cm4_125.ice0*100-sp1_125.ice0*100);
s5=sprintf(char(strcat(ss5,{' '},s0)),sp1_125.ice0*100-sp4_125.ice0*100);
s6=sprintf(char(strcat(ss6,{' '},s0)),cm4_125.ice0*100-sp4_125.ice0*100);
%legend(s1,s2,s3,s4,s5,'location','north'); 
legend(s4,s5,s6,'location','south'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='change in sea-ice concentration (%/K)';
ylabel(yl,'FontSize',fsize); mylabel([-90 90 -4 4],1,'(e)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);

subplot(row,col,6); ls1='-'; ls2='--'; ax1=gca;
y1=cm4_125.lai; %plot(lat,y1,'r','LineWidth',lw); hold on;
y2=sp1_125.lai; %plot(lat,y2,'b','LineWidth',lw); hold on;
y3=sp4_125.lai; %plot(lat,y3,'c','LineWidth',lw); hold on;
y4=y1-y2; line(lat,y4,'Color','r','LineWidth',lw,'LineStyle',ls1); hold on;
y5=y2-y3; line(lat,y5,'Color','b','LineWidth',lw,'LineStyle',ls1); hold on;
y6=y1-y3; line(lat,y6,'Color','k','LineWidth',lw,'LineStyle',ls1); hold on;
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.lai0);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.lai0);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.lai0);
s4=sprintf(char(strcat(ss4,{' '},s0)),cm4_125.lai0-sp1_125.lai0);
s5=sprintf(char(strcat(ss5,{' '},s0)),sp1_125.lai0-sp4_125.lai0);
s6=sprintf(char(strcat(ss6,{' '},s0)),cm4_125.lai0-sp4_125.lai0);
legend(s4,s5,s6,'location','northwest'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='change in LAI (m2/m2/K)';
ylabel(yl,'FontSize',fsize); mylabel([-90 90 -1 1],1,'(f)',fsize);
set(gca,'FontSize',fsize-2); %box on; %title(vname,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','none','YColor',[0.2 0.2 0.2]);
y1=cm4_125.fsw; %plot(lat,y1,'r','LineWidth',lw); hold on;
y2=sp1_125.fsw; %plot(lat,y2,'b','LineWidth',lw); hold on;
y3=sp4_125.fsw; %plot(lat,y3,'c','LineWidth',lw); hold on;
y4=y1-y2; line(lat,y4,'Color','r','LineWidth',lw,'LineStyle',ls2); hold on;
y5=y2-y3; line(lat,y5,'Color','b','LineWidth',lw,'LineStyle',ls2); hold on;
y6=y1-y3; line(lat,y6,'Color','k','LineWidth',lw,'LineStyle',ls2); hold on;
s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.fsw0);
s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.fsw0);
s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.fsw0);
s4=sprintf(char(strcat(ss4,{' '},s0)),(cm4_125.fsw0-sp1_125.fsw0));
s5=sprintf(char(strcat(ss5,{' '},s0)),(sp1_125.fsw0-sp4_125.fsw0));
s6=sprintf(char(strcat(ss6,{' '},s0)),(cm4_125.fsw0-sp4_125.fsw0));
legend(s4,s5,s6,'location','southeast'); legend('boxoff');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='{          }change in net SW radiation into land surface (W/m2/K)';
ylabel(yl,'FontSize',fsize-2); mylabel([-90 90 -5 10],1,'(f)',fsize);
set(gca,'FontSize',fsize-2); %title(vname,'FontSize',fsize);
ylabel(yl,'FontSize',fsize-2.5); 
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
% $$$ ls1='-'; ls2='--'; ax1=gca;
% $$$ y1=cm4_125.swnet_clr; %plot(lat,y1,'r','LineWidth',lw); hold on;
% $$$ y2=sp1_125.swnet_clr; %plot(lat,y2,'b','LineWidth',lw); hold on;
% $$$ y3=sp4_125.swnet_clr; %plot(lat,y3,'c','LineWidth',lw); hold on;
% $$$ y4=y1-y2; line(lat,y4,'Color','r','LineWidth',lw,'LineStyle',ls1); hold on;
% $$$ y5=y2-y3; line(lat,y5,'Color','g','LineWidth',lw,'LineStyle',ls1); hold on;
% $$$ y6=y1-y3; line(lat,y6,'Color','b','LineWidth',lw,'LineStyle',ls1); hold on;
% $$$ s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.swnet_clr0);
% $$$ s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.swnet_clr0);
% $$$ s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.swnet_clr0);
% $$$ s4=sprintf(char(strcat(ss4,{' '},s0)),cm4_125.swnet_clr0-sp1_125.swnet_clr0);
% $$$ s5=sprintf(char(strcat(ss5,{' '},s0)),sp1_125.swnet_clr0-sp4_125.swnet_clr0);
% $$$ s6=sprintf(char(strcat(ss6,{' '},s0)),cm4_125.swnet_clr0-sp4_125.swnet_clr0);
% $$$ legend(s4,s5,s6,'location','north'); legend('boxoff');
% $$$ xl='latitude'; xlabel(xl,'FontSize',fsize);
% $$$ yl='change in TOA clear-sky SW feedback (W/m2/K)';
% $$$ ylabel(yl,'FontSize',fsize); mylabel(xy1,1,'(b)',fsize);
% $$$ set(gca,'FontSize',fsize-1); %title(vname,'FontSize',fsize);
% $$$ ax2 = axes('Position',get(ax1,'Position'),...
% $$$ 	   'XAxisLocation','bottom','YAxisLocation','right',...
% $$$ 	   'Color','none','XColor','k','YColor','k');
% $$$ y1=cm4_125.ice*100; %plot(lat,y1,'r','LineWidth',lw); hold on;
% $$$ y2=sp1_125.ice*100; %plot(lat,y2,'b','LineWidth',lw); hold on;
% $$$ y3=sp4_125.ice*100; %plot(lat,y3,'c','LineWidth',lw); hold on;
% $$$ y4=y1-y2; line(lat,y4,'Color','r','LineWidth',lw,'LineStyle',ls2); hold on;
% $$$ y5=y2-y3; line(lat,y5,'Color','g','LineWidth',lw,'LineStyle',ls2); hold on;
% $$$ y6=y1-y3; line(lat,y6,'Color','b','LineWidth',lw,'LineStyle',ls2); hold on;
% $$$ s1=sprintf(char(strcat(ss1,{' '},s0)),cm4_125.ice0*100);
% $$$ s2=sprintf(char(strcat(ss2,{' '},s0)),sp1_125.ice0*100);
% $$$ s3=sprintf(char(strcat(ss3,{' '},s0)),sp4_125.ice0*100);
% $$$ s4=sprintf(char(strcat(ss4,{' '},s0)),(cm4_125.ice0-sp1_125.ice0)*100);
% $$$ s5=sprintf(char(strcat(ss5,{' '},s0)),(sp1_125.ice0-sp4_125.ice0)*100);
% $$$ s6=sprintf(char(strcat(ss6,{' '},s0)),(cm4_125.ice0-sp4_125.ice0)*100);
% $$$ legend(s4,s5,s6,'location','south'); legend('boxoff');
% $$$ xl='latitude'; xlabel(xl,'FontSize',fsize);
% $$$ yl='change in SIC (%)';
% $$$ ylabel(yl,'FontSize',fsize); mylabel([-90 90 -20 20],1,'(d)',fsize);
% $$$ set(gca,'FontSize',fsize-1); %title(vname,'FontSize',fsize);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 5: latitudional distribution of absolute TAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dsic_abs_zm'; v0=CM4.c0; lat=o.lat; xy=[-90 90 0 17]; 
t1=6; t2=14; v=CM4;
a=mean(v.w0.sfc.ice.ann(t1:t2,:,:),1)-mean(v.c0.sfc.ice.ann(1:20,:,:),1);a=squeeze(a)*100; 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); 
b1=b; a1=squeeze(mean(a,2));
t1=6; t2=14; v=SP1;
a=mean(v.w0.sfc.ice.ann(t1:t2,:,:),1)-mean(v.c0.sfc.ice.ann(1:20,:,:),1);a=squeeze(a)*100; 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); 
b2=b; a2=squeeze(mean(a,2));
t1=6; t2=14; v=SP4;
a=mean(v.w0.sfc.ice.ann(t1:t2,:,:),1)-mean(v.c0.sfc.ice.ann(1:20,:,:),1);a=squeeze(a)*100; 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); 
b3=b; a3=squeeze(mean(a,2));

t1=21; t2=30; v=CM4;
a=mean(v.w0.sfc.ice.ann(t1:t2,:,:),1)-mean(v.c0.sfc.ice.ann(1:20,:,:),1);a=squeeze(a)*100; 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); 
b4=b; a4=squeeze(mean(a,2));
t1=21; t2=30; v=SP1;
a=mean(v.w0.sfc.ice.ann(t1:t2,:,:),1)-mean(v.c0.sfc.ice.ann(1:20,:,:),1);a=squeeze(a)*100; 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); 
b5=b; a5=squeeze(mean(a,2));
t1=21; t2=30; v=SP4;
a=mean(v.w0.sfc.ice.ann(t1:t2,:,:),1)-mean(v.c0.sfc.ice.ann(1:20,:,:),1);a=squeeze(a)*100; 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); 
b6=b; a6=squeeze(mean(a,2));
pms=[ 0, 0, 1500, 1200]*0.6; fsize=20; lw=2;
handle = figure('Position', pms,'visible','on'); 
plot(lat,a1,'r','LineWidth',lw); hold on;
plot(lat,a2,'b','LineWidth',lw); hold on;
plot(lat,a3,'k','LineWidth',lw); hold on;
plot(lat,a4,'r--','LineWidth',lw); hold on;
plot(lat,a5,'b--','LineWidth',lw); hold on;
plot(lat,a6,'k--','LineWidth',lw); hold on;

a=(w1-c1); plot(lat,a,'m','LineWidth',lw); hold on;
a=(w5-c5); plot(lat,a,'c','LineWidth',lw); hold on;
a=(g1-c1); plot(lat,a,'g','LineWidth',lw); hold on;
s2=sprintf('CM4 (%4.2fK)',    d.T2);
s3=sprintf('SPEAR (%4.2fK)',  d.T3);
s4=sprintf('ESM4 (%4.2fK)',   d.T4);
s1=sprintf('AM4.0-P2K (%4.2fK)',d.T1);
s5=sprintf('AM4.1-P4K (%4.2fK)',d.T5);
s0=sprintf('AM4-2xCO2 (%4.2fK)',d.T0);
legend(s2,s3,s4,s1,s5,s0,0); grid on; axis(xy);
yl='\Delta Ts (K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';      xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%New Fig 5.5 Sea-ICE over ocean coupled models
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dsic_map_12panel'; vname='Fig5.5'; opt=0;
%t1=101; t2=150; d =gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
t1=26;  t2=75;  d1=gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
t1=101; t2=150; d2=gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
cmin=-100; cmax=100; cmin1=-30; cmax1=30; cmin2=-30; cmax2=30; co='k';
pms=[ 0, 0, 1600, 1200]*0.7; fsize=8; row=4; col=3; unit='%';
handle = figure('Position', pms,'visible','on'); minus=char(8212); 
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet(256));
subplot(row,col,1); t1=6; t2=14; v=CM4; 
a=mean(v.w0.sfc.ice.ann(t1:t2,:,:),1)-mean(v.c0.sfc.ice.ann(1:20,:,:),1);a=squeeze(a)*100; 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); s=sprintf('(a) \\DeltaSIC CM4.0 (Y50; %4.2f)',b);
title(s,'FontSize',fsize);
subplot(row,col,2); t1=21; t2=30; v=CM4;
a=mean(v.w0.sfc.ice.ann(t1:t2,:,:),1)-mean(v.c0.sfc.ice.ann(1:20,:,:),1);a=squeeze(a)*100; 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co);  s=sprintf('(b) \\DeltaSIC CM4.0 (Y125; %4.2f)',b);
title(s,'FontSize',fsize);
subplot(row,col,3); a=a2-a1; b=b2-b1;
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('(c) (b) %c (a) (%4.2f)',minus,b); title(s,'FontSize',fsize);
%-------------------------
subplot(row,col,4); t1=6; t2=14; v=SP1; 
a=mean(v.w0.sfc.ice.ann(t1:t2,:,:),1)-mean(v.c0.sfc.ice.ann(1:20,:,:),1);a=squeeze(a)*100; 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(d) \\DeltaSIC SPEAR (Y50; %4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,5); t1=21; t2=30; v=SP1;
a=mean(v.w0.sfc.ice.ann(t1:t2,:,:),1)-mean(v.c0.sfc.ice.ann(1:20,:,:),1);a=squeeze(a)*100; 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); %title(h,'K');
s=sprintf('(e) \\DeltaSIC SPEAR (Y125; %4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,6); a=a5-a4; b=b5-b4; a6=a; b6=b;
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); a6=a; b6=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('(f) (e) %c (d) (%4.2f)',minus,b); title(s,'FontSize',fsize);
%-------------------------
subplot(row,col,7); t1=6; t2=14; v=SP4; 
a=mean(v.w0.sfc.ice.ann(t1:t2,:,:),1)-mean(v.c0.sfc.ice.ann(1:20,:,:),1);a=squeeze(a)*100; 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); a7=a; b7=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); s=sprintf('(g) \\DeltaSIC SPEAR-SV (Y50; %4.2f)',b); 
title(s,'FontSize',fsize);
subplot(row,col,8); t1=21; t2=30; v=SP4;
a=mean(v.w0.sfc.ice.ann(t1:t2,:,:),1)-mean(v.c0.sfc.ice.ann(1:20,:,:),1);a=squeeze(a)*100; 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); a8=a; b8=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); s=sprintf('(h) \\DeltaSIC SPEAR-SV (Y125; %4.2f)',b); 
title(s,'FontSize',fsize);

cb0=colorbar('FontSize',fsize+2,'Location','westoutside');
set(cb0, 'Position', [0.08 0.35 0.02 0.55]); caxis([cmin, cmax]); 
cb0.Label.String = unit; pos=get(cb0,'Position')
cb0.Label.Position = [pos(1)+0.5 pos(2)+100]; 
cb0.Label.Rotation = 0;

subplot(row,col,9); a=a8-a7; b=b8-b7;
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); a9=a; b9=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); s=sprintf('(i) (h) %c (g) (%4.2f)',minus,b); 
title(s,'FontSize',fsize);
%----------------------------
subplot(row,col,10); a=a1-a4; b=b1-b4;
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); a10=a; b10=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co); 
s=sprintf('(j) (a) %c (d) (%4.2f K)',minus,b); title(s,'FontSize',fsize);
subplot(row,col,11); a=a2-a5; b=b2-b5;
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); a11=a; b11=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co); 
s=sprintf('(k) (b) %c (e) (%4.2f K)',minus,b); title(s,'FontSize',fsize);
subplot(row,col,12); a=a3-a6; b=b3-b6;
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,0); a12=a; b12=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co); 
s=sprintf('(l) (c) %c (f) (%4.2f K)',minus,b); title(s,'FontSize',fsize);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
unit='%';
cb1=colorbar('FontSize',fsize+2,'Location','southoutside');
set(cb1, 'Position', [.22 .04 .6 .02]); caxis([cmin2, cmax2]); 
cb1.Label.String = unit; pos=get(cb1,'Position')
cb1.Label.Position = [pos(1)-0.2 pos(2)+2]; 

expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dsic_map_panel'; vname='Fig5.5'; opt=0;
t1=26;  t2=75;  d1=gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
t1=101; t2=150; d2=gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
cmin =-1; cmax =1; cmin1=-1; cmax1=1;
cmin2=-1; cmax2=1; cmin3=-1; cmax3=1; unit1='m2/m2'; unit2='W/m2';
pms=[ 0, 0, 1600, 1200]*0.7; fsize=7; row=4; col=3;
handle = figure('Position', pms,'visible','on'); minus=char(8212);
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet(256));
subplot(row,col,1); t1=6; t2=14; v=CM4; %t1=8; t2=12; v=SP1;
a=mean(v.w0.sfc.ice.ann(t1:t2,:,:),1)-mean(v.c0.sfc.ice.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1); a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); s=sprintf('(a) \\DeltaSIC CM4.0 (Y50; %4.2f)',b);
title(s,'FontSize',fsize); %title(h,'m2/m2','FontSize',6);
subplot(row,col,2); t1=21; t2=30; v=CM4;
a=mean(v.w0.sfc.sic.ann(t1:t2,:,:),1)-mean(v.c0.sfc.sic.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1); a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); s=sprintf('(b) \\DeltaSIC CM4.0 (Y125; %4.2f)',b);
title(s,'FontSize',fsize); %title(h,'m2/m2','FontSize',6);
subplot(row,col,3); a=a2-a1; b=b2-b1; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); s=sprintf('(c) (b) %c (a) (%4.2f)',minus,b);
title(s,'FontSize',fsize); %title(h,'m2/m2','FontSize',6);
subplot(row,col,4); t1=6; t2=14; v=SP1; %t1=8; t2=12; v=SP1;
a=mean(v.w0.sfc.sic.ann(t1:t2,:,:),1)-mean(v.c0.sfc.sic.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1); a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); s=sprintf('(d) \\DeltaSIC SPEAR (Y50; %4.2f)',b);
title(s,'FontSize',fsize); %title(h,'m2/m2','FontSize',6);
subplot(row,col,5); t1=21; t2=30; v=SP1;
a=mean(v.w0.sfc.sic.ann(t1:t2,:,:),1)-mean(v.c0.sfc.sic.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1); a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin cmax]);
contour(lon,lat,lm,1,co); s=sprintf('(e) \\DeltaSIC SPEAR (Y125; %4.2f)',b);
title(s,'FontSize',fsize); %title(h,'m2/m2','FontSize',6);

cb0=colorbar('FontSize',fsize+2,'Location','westoutside');
set(cb0, 'Position', [0.08 0.55 0.02 0.37]); caxis([cmin cmax]); 
cb0.Label.String = unit1; pos=get(cb0,'Position');
cb0.Label.Position = [pos(1)+0.5 pos(2)+6.6]; 
cb0.Label.Rotation = 0;

subplot(row,col,6); a=a5-a4; b=b5-b4; a6=a; b6=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); s=sprintf('(f) (e) %c (d) (%4.2f)',minus,b);
title(s,'FontSize',fsize); %title(h,'m2/m2','FontSize',6);

cb1=colorbar('FontSize',fsize+2,'Location','eastoutside');
set(cb1, 'Position', [0.92 0.55 0.02 0.37]); caxis([cmin1 cmax1]); 
cb1.Label.String = unit1; pos=get(cb1,'Position');
cb1.Label.Position = [pos(1)-0.1 pos(2)+2.8]; 
cb1.Label.Rotation = 0;

subplot(row,col,7); t1=6; t2=14; v=SP1;
a=mean(v.w0.sfc.fsw.ann(t1:t2,:,:),1)-mean(v.c0.sfc.fsw.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1); a7=a; b7=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co);  %title(h,'W/m2','FontSize',6);
s=sprintf('(g) \\DeltaSWR SPEAR (Y50; %4.2f)',b);
title(s,'FontSize',fsize);
subplot(row,col,8); t1=21; t2=30; v=SP1;
a=mean(v.w0.sfc.fsw.ann(t1:t2,:,:),1)-mean(v.c0.sfc.fsw.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1); a8=a; b8=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co);  %title(h,'W/m2','FontSize',6);
s=sprintf('(h) \\DeltaSWR SPEAR (Y125; %4.2f)',b);
title(s,'FontSize',fsize); %colormap(parula);
subplot(row,col,9); a=a8-a7; b=b8-b7; a9=a; b9=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin3 cmax3]);
contour(lon,lat,lm,1,co); s=sprintf('(i) (h) %c (g) (%4.2f)',minus,b);
title(s,'FontSize',fsize); %title(h,'W/m2','FontSize',6);

subplot(row,col,10); t1=6; t2=14; v=SP4;
a=mean(v.w0.sfc.fsw.ann(t1:t2,:,:),1)-mean(v.c0.sfc.fsw.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1); 
a=a7-a; b=b7-b; a10=a; b10=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co); 
s=sprintf('(j) \\DeltaSWR (SPEAR %c SPEAR-SV; Y50; %4.2f)',minus,b);
title(s,'FontSize',fsize); %title(h,'                    W2/m2','FontSize',6);
subplot(row,col,11); t1=21; t2=30; v=SP4;
a=mean(v.w0.sfc.fsw.ann(t1:t2,:,:),1)-mean(v.c0.sfc.fsw.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1);
a=a8-a; b=b8-b; a11=a; b11=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co); 
s=sprintf('(k) \\DeltaSWR (SPEAR %c SPEAR-SV; Y125; %4.2f)',minus,b);
title(s,'FontSize',fsize); %title(h,'                   W2/m2','FontSize',6);

cb2=colorbar('FontSize',fsize+2,'Location','westoutside');
set(cb2, 'Position', [0.08 0.12 0.02 0.35]); caxis([cmin2 cmax2]); 
cb2.Label.String = unit2; pos=get(cb2,'Position');
cb2.Label.Position = [pos(1)+0.5 pos(2)+30]; 
cb2.Label.Rotation = 0;

subplot(row,col,12); a=a11-a10; b=b11-b10; 
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin3 cmax3]);
contour(lon,lat,lm,1,co); s=sprintf('(l) (k) %c (j) (%4.2f)',minus,b);
title(s,'FontSize',fsize); %title(h,'W2/m2','FontSize',6);

cb3=colorbar('FontSize',fsize+2,'Location','westoutside');
set(cb3, 'Position', [0.92 0.12 0.02 0.35]); caxis([cmin3 cmax3]); 
cb3.Label.String = unit2; pos=get(cb3,'Position')
cb3.Label.Position = [pos(1)+0. pos(2)+5.5]; 
cb3.Label.Rotation = 0;

nn=256; cmap=bluewhitered_miz(nn);   colormap(cmap);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LATEST===FIG7===  feedback from AM4!!!!!!!!!!!!!!!!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
vname='dN_feedback_AM4_pert_12panel'; vname='Fig7'; t1=101; t2=150; opt=0;
df=get4xco2f(a40,aa,opt); 
dN_veg=df.F_av_veg; dN0_veg=df.F_veg; dT0_veg=df.T_veg;
dt=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
cmin=-4; cmax=4; s0='(%4.2f)'; unit='W/m2/K';
pms=[ 0, 0, 1600, 1200]*0.7; fsize=7; row=4; col=3; color='w';
handle = figure('Position', pms,'visible','on'); 
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet);
subplot(row,col,1); s='(a) AM4-CM4-50 (wrt AM4-CM4-C)';
dT=dt.Tf-dT0_veg; a=(d.W1.av-d.c5.av-dN_veg)/dT; b=(d.Nf-dN0_veg)/dT; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,2); s='(b) AM4-CM4-125 (wrt AM4-CM4-C)';
dT=dt.T7-dT0_veg; a=(d.W5.av-d.c5.av-dN_veg)/dT; b=(d.N7-dN0_veg)/dT; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,3); s='(c) AM4-CM4-125 (wrt AM4-CM4-50)';
dT=dt.W5.gm-dt.W1.gm; a=(d.W5.av-d.W1.av)/dT; b=(d.W5.gm-d.W1.gm)/dT; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);

subplot(row,col,4); s='(d) AM4-CM4-SST-50 (wrt AM4-CM4-C)';%===========
dT=dt.Tf-dT0_veg; a=(d.A5.av-d.c5.av)/dT; b=d.Na/dT; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,5); s='(e) AM4-CM4-SST-125 (wrt AM4-CM4-C)';%===========
dT=dt.T7-dT0_veg; a=(d.S5.av-d.c5.av)/dT; b=d.N8/dT; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,6); s='(f) AM4-CM4-SST-125 (wrt AM4-CM4-SST-50)';%===========
dT=dt.W5.gm-dt.W1.gm; a=(d.S5.av-d.A5.av)/dT; b=(d.S5.gm-d.A5.gm)/dT; a6=a; b6=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);

subplot(row,col,7); s='(g) AM4-CM4-SIC-50 (wrt AM4-CM4-C)';%===========
dT=dt.Tf-dT0_veg; a=(d.B5.av-d.c5.av)/dT; b=d.Nb/dT; a7=a; b7=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,8); s='(h) AM4-CM4-SIC-125 (wrt AM4-CM4-C)';%===========
dT=dt.T7-dT0_veg; a=(d.I5.av-d.c5.av)/dT; b=d.N9/dT; a8=a; b8=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,9); s='(i) AM4-CM4-SIC-125 (wrt AM4-CM4-SIC-50)';%===========
dT=dt.W5.gm-dt.W1.gm; a=(d.I5.av-d.B5.av)/dT; b=(d.I5.gm-d.B5.gm)/dT; a9=a; b9=b;
%(b8*dt.T7-b7*dt.Tf)/(dt.T7-dt.Tf) %(b8*dt.T7)/(dt.T7) %(b7*dt.Tf)/(dt.Tf)
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);

subplot(row,col,10); s='(j) AM4-CM4-VEG-50 (wrt AM4-CM4-C)';%===========
dT=dt.Tf-dT0_veg; a=(d.C5.av-d.c5.av-dN_veg)/dT; b=(d.Nc-dN0_veg)/dT; a10=a; b10=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,11); s='(k) AM4-CM4-VEG-125 (wrt AM4-CM4-C)';%===========
dT=dt.T7-dT0_veg; a=(d.V5.av-d.c5.av-dN_veg)/dT; b=(d.Nx-dN0_veg)/dT; a11=a; b11=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,12); s='(l) AM4-CM4-VEG-125 (wrt AM4-CM4-VEG-50)';%===========
dT=dt.W5.gm-dt.W1.gm; a=(d.V5.av-d.C5.av)/dT; b=(d.V5.gm-d.C5.gm)/dT; a12=a; b12=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);

cb=colorbar('FontSize',fsize+2,'Location','southoutside');
set(cb, 'Position', [.165 .04 .7 .02]); caxis([cmin, cmax]); 
cb.Label.String = 'W/m2/K'; %title(cb, unit,'FontSize',fsize+2);
pos=get(cb,'Position')
cb.Label.Position = [pos(1)-0.12 pos(2)+1.9];  %for radiation
%nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%New Fig6_12panel feedback from AM4!!!!!!!!!!!!!!!!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
vname='dN_feedback_AM4_pert_12panel'; vname='Fig6'; t1=101; t2=150; opt=0;
df=get4xco2f(a40,aa,opt); fav=df.av; f0=df.gm;
dt=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
cmin=-4; cmax=4; s0='(%4.2f)'; unit='W/m2/K';
pms=[ 0, 0, 1600, 1200]*0.7; fsize=7; row=4; col=3; color='w';
handle = figure('Position', pms,'visible','on'); 
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet);
subplot(row,col,1); s='(a) AM4-CM4-50 (wrt AM4-CM4-C)';
dT=dt.Tf; a=(d.W1.av-d.c5.av)/dT; b=d.Nf/dT; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,2); s='(b) AM4-CM4-125 (wrt AM4-CM4-C)';
dT=dt.T7; a=(d.W5.av-d.c5.av)/dT; b=d.N7/dT; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,3); s='(c) AM4-CM4-125 (wrt AM4-CM4-50)';
dT=dt.W5.gm-dt.W1.gm; a=(d.W5.av-d.W1.av)/dT; b=(d.W5.gm-d.W1.gm)/dT; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);

subplot(row,col,4); s='(d) AM4-CM4-SST-50 (wrt AM4-CM4-C)';%===========
dT=dt.Tf; a=(d.A5.av-d.c5.av)/dT; b=d.Na/dT; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,5); s='(e) AM4-CM4-SST-125 (wrt AM4-CM4-C)';%===========
dT=dt.T7; a=(d.S5.av-d.c5.av)/dT; b=d.N8/dT; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,6); s='(f) AM4-CM4-SST-125 (wrt AM4-CM4-SST-50)';%===========
dT=dt.W5.gm-dt.W1.gm; a=(d.S5.av-d.A5.av)/dT; b=(d.S5.gm-d.A5.gm)/dT; a6=a; b6=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);

subplot(row,col,7); s='(g) AM4-CM4-SIC-50 (wrt AM4-CM4-C)';%===========
dT=dt.Tf; a=(d.B5.av-d.c5.av)/dT; b=d.Nb/dT; a7=a; b7=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,8); s='(h) AM4-CM4-SIC-125 (wrt AM4-CM4-C)';%===========
dT=dt.T7; a=(d.I5.av-d.c5.av)/dT; b=d.N9/dT; a8=a; b8=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,9); s='(i) AM4-CM4-SIC-125 (wrt AM4-CM4-SIC-50)';%===========
dT=dt.W5.gm-dt.W1.gm; a=(d.I5.av-d.B5.av)/dT; b=(d.I5.gm-d.B5.gm)/dT; a9=a; b9=b;
%(b8*dt.T7-b7*dt.Tf)/(dt.T7-dt.Tf) %(b8*dt.T7)/(dt.T7) %(b7*dt.Tf)/(dt.Tf)
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);

subplot(row,col,10); s='(j) AM4-CM4-VEG-50 (wrt AM4-CM4-C)';%===========
dT=dt.Tf; a=(d.C5.av-d.c5.av)/dT; b=d.Nc/dT; a10=a; b10=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,11); s='(k) AM4-CM4-VEG-125 (wrt AM4-CM4-C)';%===========
dT=dt.T7; a=(d.V5.av-d.c5.av)/dT; b=d.Nx/dT; a11=a; b11=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,12); s='(l) AM4-CM4-VEG-125 (wrt AM4-CM4-VEG-50)';%===========
dT=dt.W5.gm-dt.W1.gm; a=(d.V5.av-d.C5.av)/dT; b=(d.V5.gm-d.C5.gm)/dT; a12=a; b12=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',6);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);

cb=colorbar('FontSize',fsize+2,'Location','southoutside');
set(cb, 'Position', [.165 .04 .7 .02]); caxis([cmin, cmax]); 
cb.Label.String = 'W/m2/K'; %title(cb, unit,'FontSize',fsize+2);
pos=get(cb,'Position')
cb.Label.Position = [pos(1)+0.33 pos(2)+1.9];  %for radiation
%nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LATEST ===FIG8===New Fig8_12panel SAT!!!!!!!!!!!!!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
vname='dT_feedback_AM4_pert_12panel'; vname='Fig8'; t1=101; t2=150; opt=0;
df=get4xco2f(a40,aa,opt); fav=df.av; f0=df.gm;
dt=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
cmin=0; cmax=8; cmin1=-1.2; cmax1=1.2; cmin2=-1.2; cmax2=1.2; s0='(%4.2f)';
pms=[ 0, 0, 1600, 1200]*0.7; fsize=8; row=4; col=3; color='w';
handle = figure('Position', pms,'visible','on'); unit='K';
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap); %colormap(jet);
subplot(row,col,1); s='(a) AM4-CM4-50'; minus=char(8212); 
dT=dt.Tf; a=(dt.W1.av-dt.c5.av); b=dT; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',8);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,2); s='(b) AM4-CM4-125';
dT=dt.T7; a=(dt.W5.av-dt.c5.av); b=dT; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',8);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,3); s=sprintf('(c) (b) %c (a)',minus);
a=a2-a1; b=b2-b1;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',8);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);

subplot(row,col,4); s='(d) AM4-CM4-SST-50';%===========
dT=dt.Ta; a=(dt.A5.av-dt.c5.av); b=dT; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',8);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,5); s='(e) AM4-CM4-SST-125';%===========
dT=dt.T8; a=(dt.S5.av-dt.c5.av); b=dT; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',8);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,6); s=sprintf('(f) (e) %c (d)',minus);%===========
a=a5-a4; b=b5-b4; a6=a; b6=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',8);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);

subplot(row,col,7); s='(g) AM4-CM4-SIC-50';%===========
dT=dt.Tb; a=(dt.B5.av-dt.c5.av); b=dT; a7=a; b7=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',8);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,8); s='(h) AM4-CM4-SIC-125';%===========
dT=dt.T9; a=(dt.I5.av-dt.c5.av); b=dT; a8=a; b8=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin cmax]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',8);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);

cb0=colorbar('FontSize',fsize+2,'Location','westoutside');
set(cb0, 'Position', [0.08 0.35 0.02 0.55]); caxis([cmin, cmax]); 
cb0.Label.String = unit; pos=get(cb0,'Position');
cb0.Label.Position = [pos(1)+0.4 pos(2)+7.7]; 
cb0.Label.Rotation = 0;

subplot(row,col,9); s=sprintf('(i) (h) %c (g)',minus);%===========
a=a8-a7; b=b8-b7; a9=a; b9=b; 
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',8);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);

dT_veg=df.T_av_veg; dT0_veg=df.T_veg; 
dT_veg=0; dT0_veg=0; 

subplot(row,col,10); s='(j) AM4-CM4-VEG-50';%===========
dT=dt.Tc; a=(dt.C5.av-dt.c5.av)-dT_veg; b=dT-dT0_veg; a10=a; b10=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',8);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,11); s='(k) AM4-CM4-VEG-125';%===========
dT=dt.Tx; a=(dt.V5.av-dt.c5.av)-dT_veg; b=dT-dT0_veg; a11=a; b11=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',8);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,12); s=sprintf('(l) (k) %c (j)',minus);%===========
a=a11-a10; b=b11-b10; a12=a; b12=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,color); %title(h,unit,'FontSize',8);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);

unit='K';
cb1=colorbar('FontSize',fsize+2,'Location','southoutside');
set(cb1, 'Position', [.22 .04 .6 .02]); caxis([cmin2, cmax2]); 
cb1.Label.String = unit; pos=get(cb1,'Position')
cb1.Label.Position = [pos(1)-0.22 pos(2)+2]; 

%nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%New Fig8: partitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dNdT_AM4_W2_cold_zm';
t1=101; t2=150; opt=0; lw=1; s0='(%4.2f)';
dt=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
pms=[ 0, 0, 1000, 1200]; fsize=8; row=2; col=2; color='w';
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); xy=[-90 90 -3 3];
d=getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
a=d.c5.zm; dT0=dt.T7;
y1=(d.W5.zm-a)/dT0;   b1=d.N7/dT0;   s1='AM4.0-W';
y2=(d.P5.zm-a)/dt.Ty; b2=d.Ny/dt.Ty; s2='AM4.0-W-CESS';
y3=(d.S5.zm-a)/dT0;   b3=d.N8/dT0;   s3='AM4.0-W-SSTA';
y4=y3-y2;             b4=b3-b2;      s4='AM4.0-W-SSTP';
y5=(d.I5.zm-a)/dT0;   b5=d.N9/dT0;   s5='AM4.0-W-SICA';
y6=(d.V5.zm-a)/dT0;   b6=d.Nx/dT0;   s6='AM4.0-W-VEGA';
plot(lat,y1,'r','LineWidth',lw); hold on;
plot(lat,y2,'m','LineWidth',lw); hold on;
plot(lat,y3,'c','LineWidth',lw); hold on;
%plot(lat,y4,'b','LineWidth',lw); hold on;
plot(lat,y5,'k','LineWidth',lw); hold on;
plot(lat,y6,'g','LineWidth',lw); hold on;
s1=sprintf(char(strcat(s1,{' '},s0)),b1);
s2=sprintf(char(strcat(s2,{' '},s0)),b2);
s3=sprintf(char(strcat(s3,{' '},s0)),b3);
s4=sprintf(char(strcat(s4,{' '},s0)),b4);
s5=sprintf(char(strcat(s5,{' '},s0)),b5);
s6=sprintf(char(strcat(s6,{' '},s0)),b6);
legend(s1,s2,s3,s5,s6,'location','north');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='change in TOA net radiative flux (W/m2/K)'; 
ylabel(yl,'FontSize',fsize); mylabel(xy,1,'(a)',9);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);

subplot(row,col,2); xy=[-90 90 -3.5 1];%%%%%%%%%%%
d =getttcf(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
a=d.c5.zm; dT0=dt.T7;
y1=(d.W5.zm-a)/dT0;   b1=d.N7/dT0;   s1='AM4.0-W';
y2=(d.P5.zm-a)/dt.Ty; b2=d.Ny/dt.Ty; s2='AM4.0-W-CESS';
y3=(d.S5.zm-a)/dT0;   b3=d.N8/dT0;   s3='AM4.0-W-SSTA';
%y4=y3-y2;             b4=b3-b2;      s4='AM4.0-W-SSTP';
y5=(d.I5.zm-a)/dT0;   b5=d.N9/dT0;   s5='AM4.0-W-SICA';
y6=(d.V5.zm-a)/dT0;   b6=d.Nx/dT0;   s6='AM4.0-W-VEGA';
plot(lat,y1,'r','LineWidth',lw); hold on;
plot(lat,y2,'m','LineWidth',lw); hold on;
plot(lat,y3,'c','LineWidth',lw); hold on;
%plot(lat,y4,'b','LineWidth',lw); hold on;
plot(lat,y5,'k','LineWidth',lw); hold on;
plot(lat,y6,'g','LineWidth',lw); hold on;
s1=sprintf(char(strcat(s1,{' '},s0)),b1);
s2=sprintf(char(strcat(s2,{' '},s0)),b2);
s3=sprintf(char(strcat(s3,{' '},s0)),b3);
s4=sprintf(char(strcat(s4,{' '},s0)),b4);
s5=sprintf(char(strcat(s5,{' '},s0)),b5);
s6=sprintf(char(strcat(s6,{' '},s0)),b6);
legend(s1,s2,s3,s5,s6,'location','south');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='change in TOA net cloud radiative effect (W/m2/K)'; 
ylabel(yl,'FontSize',fsize); mylabel(xy,1,'(b)',8);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);

subplot(row,col,3); xy=[-90 90 -3 5];
ds=getswnet_clr(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
dl=getlwnet_clr(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
a=ds.c5.zm+dl.c5.zm; dT0=dt.T7;
y1=(ds.W5.zm+dl.W5.zm-a)/dT0;   b1=(ds.N7+dl.N7)/dT0;   s1='AM4.0-W';
y2=(ds.P5.zm+dl.P5.zm-a)/dt.Ty; b2=(ds.Ny+dl.Ny)/dt.Ty; s2='AM4.0-W-CESS';
y3=(ds.S5.zm+dl.S5.zm-a)/dT0;   b3=(ds.N8+dl.N8)/dT0;   s3='AM4.0-W-SSTA';
%y4=y3-y2;                       b4=b3-b2;               s4='AM4.0-W-SSTP';
y5=(ds.I5.zm+dl.I5.zm-a)/dT0;   b5=(ds.N9+dl.N9)/dT0;   s5='AM4.0-W-SICA';
y6=(ds.V5.zm+dl.V5.zm-a)/dT0;   b6=(ds.Nx+dl.Nx)/dT0;   s6='AM4.0-W-VEGA';
plot(lat,y1,'r','LineWidth',lw); hold on;
plot(lat,y2,'m','LineWidth',lw); hold on;
plot(lat,y3,'c','LineWidth',lw); hold on;
%plot(lat,y4,'b','LineWidth',lw); hold on;
plot(lat,y5,'k','LineWidth',lw); hold on;
plot(lat,y6,'g','LineWidth',lw); hold on;
s1=sprintf(char(strcat(s1,{' '},s0)),b1);
s2=sprintf(char(strcat(s2,{' '},s0)),b2);
s3=sprintf(char(strcat(s3,{' '},s0)),b3);
s4=sprintf(char(strcat(s4,{' '},s0)),b4);
s5=sprintf(char(strcat(s5,{' '},s0)),b5);
s6=sprintf(char(strcat(s6,{' '},s0)),b6);
legend(s1,s2,s3,s5,s6,'location','north');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='change in TOA net clear-sky radiative flux (W/m2/K)'; 
ylabel(yl,'FontSize',fsize); mylabel(xy,1,'(c)',12);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);

subplot(row,col,4); xy=[-90 90 -3 3];
df=get4xco2f(a40,aa,opt); fav=df.G2.zm-df.C2.zm; f0=df.gm2; dT_co2=df.T2
t1=101; t2=150; opt=0;
dt=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);

a=dt.T1-df.T2; y1=(d.w1.zm-d.c1.zm-fav)/a; b1=(d.N1-f0)/a; s1='CM4.0';
a=dt.T3-df.T2; y2=(d.w3.zm-d.c3.zm-fav)/a; b2=(d.N3-f0)/a; s2='SPEAR';
a=dt.T4-df.T2; y3=(d.w4.zm-d.c4.zm-fav)/a; b3=(d.N4-f0)/a; s3='SPEAR-SV';
y4=y1-y2;                                  b4=b1-b2; s4='CM4.0 minus SPEAR';
y5=y2-y3;                                  b5=b2-b3; s5='SPEAR minus SPEAR-SV';
plot(lat,y1,'r','LineWidth',lw); hold on;
plot(lat,y2,'b','LineWidth',lw); hold on;
plot(lat,y3,'c','LineWidth',lw); hold on;
plot(lat,y4,'k','LineWidth',lw); hold on;
plot(lat,y5,'g','LineWidth',lw); hold on;
s1=sprintf(char(strcat(s1,{' '},s0)),b1);
s2=sprintf(char(strcat(s2,{' '},s0)),b2);
s3=sprintf(char(strcat(s3,{' '},s0)),b3);
s4=sprintf(char(strcat(s4,{' '},s0)),b4);
s5=sprintf(char(strcat(s5,{' '},s0)),b5);
legend(s1,s2,s3,s4,s5,'location','north');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='change in TOA net radiative flux (W/m2/K)'; 
ylabel(yl,'FontSize',fsize); mylabel(xy,1,'(d)',12);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LATEST ===Fig9===: SST pattern
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot_pattern_effect()



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%END of New Figs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2_12panel: surface temperature warming map%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtsurf_map_12panel'; opt=0;
t1=26;  t2=75;  d1=gettsurf(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
t1=101; t2=150; d2=gettsurf(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
cmin=0.; cmax=16; cmin1=-1; cmax1=2; cmin2=-2; cmax2=2; co='k';
pms=[ 0, 0, 1600, 1200]*0.7; fsize=8; row=4; col=3;
handle = figure('Position', pms,'visible','on'); 
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet(256));
subplot(row,col,1); d=d1; a=d.w1.av-d.c1.av; b=d.T1; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,co);
s=sprintf('(a) \\DeltaSST CM4.0 (%4.2f K)',b); title(s,'FontSize',fsize);
subplot(row,col,2); d=d2; a=d.w1.av-d.c1.av; b=d.T1; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,co);
s=sprintf('(b) \\DeltaSST CM4.0 (%4.2f K)',b); title(s,'FontSize',fsize);
subplot(row,col,3); a=a2-a1; b=b2-b1; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('(c) (b) minus (a) (%4.2f K)',b); title(s,'FontSize',fsize);
%-------------------------
subplot(row,col,4); d=d1; a=d.w3.av-d.c3.av; b=d.T3; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,co);
s=sprintf('(d) \\DeltaSST SPEAR (%4.2f K)',b); title(s,'FontSize',fsize);
subplot(row,col,5); d=d2; a=d.w3.av-d.c3.av; b=d.T3; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,co);
s=sprintf('(e) \\DeltaSST SPEAR (%4.2f K)',b); title(s,'FontSize',fsize);
subplot(row,col,6); a=a5-a4; b=b5-b4; a6=a; b6=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('(f) (e) minus (d) (%4.2f K)',b); title(s,'FontSize',fsize);
%-------------------------
subplot(row,col,7); d=d1; a=d.w4.av-d.c4.av; b=d.T4; a7=a; b7=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,co);
s=sprintf('(g) \\DeltaSST SPEAR-SV (%4.2f K)',b); title(s,'FontSize',fsize);
subplot(row,col,8); d=d2; a=d.w4.av-d.c4.av; b=d.T4; a8=a; b8=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,co);
s=sprintf('(h) \\DeltaSST SPEAR-SV (%4.2f K)',b); title(s,'FontSize',fsize);
subplot(row,col,9); a=a8-a7; b=b8-b7; a9=a; b9=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('(i) (h) minus (g) (%4.2f K)',b); title(s,'FontSize',fsize);
%----------------------------
subplot(row,col,10); a=a1-a4; b=b1-b4;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co);
s=sprintf('(j) (a) minus (d) (%4.2f K)',b); title(s,'FontSize',fsize);
subplot(row,col,11); a=a2-a5; b=b2-b5;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co);
s=sprintf('(k) (b) minus (e) (%4.2f K)',b); title(s,'FontSize',fsize);
subplot(row,col,12); a=a3-a6; b=b3-b6;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co);
s=sprintf('(l) (c) minus (f) (%4.2f K)',b); title(s,'FontSize',fsize);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2a-f_new: surface air temperature warming map%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_map_6panel_lai'; opt=0;
t1=101; t2=150; d =gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
t1=26;  t2=50;  d1=gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
t1=51;  t2=100; d2=gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
cmin=0.; cmax=16; vbin=[cmin:0.02:cmax]; co='k';
pms=[ 0, 0, 1200, 1200]*0.7; fsize=8; row=4; col=2;
handle = figure('Position', pms,'visible','on'); colormap(jet(256));
subplot(row,col,1); a=d.w1.av-d.c1.av; b=d.T1; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,co);
s=sprintf('(a) \\DeltaSAT CM4.0 (%4.2fK)',b); title(s,'FontSize',fsize);
subplot(row,col,2); a=d.w3.av-d.c3.av; b=d.T3; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,co);
s=sprintf('(b) \\DeltaSAT SPEAR (%4.2fK)',b); title(s,'FontSize',fsize);
subplot(row,col,3); a=d.w4.av-d.c4.av; b=d.T4; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,co);
s=sprintf('(c) \\DeltaSAT SPEAR-SV (%4.2fK)',b); title(s,'FontSize',fsize);
subplot(row,col,4); a=a3-a4; b=b3-b4;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-4 4]);
contour(lon,lat,lm,1,co);
s=sprintf('(d) (b) minus (c) (%4.2fK)',b); title(s,'FontSize',fsize);

subplot(row,col,5); t1=21; t2=30; v=CM4; %t1=8; t2=12; v=SP1;
a=mean(v.w0.sfc.lai.ann(t1:t2,:,:),1)-mean(v.c0.sfc.lai.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1)
%b=mean(v.w0.sfc.lai.ann_stat.mmen.all(t1:t2))-mean(v.c0.sfc.lai.ann_stat.mmen.all(1:20))
%a=d1.w1.av-d1.c1.av; b=d1.T1; a=a1-a; b=b1-b;%CM4   last - first
%a=d1.w3.av-d1.c3.av; b=d1.T3; a=a3-a; b=b3-b;%SPEAR last - first
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-7 7]);
contour(lon,lat,lm,1,co); s=sprintf('(e) \\DeltaLAI CM4.0 (%4.2fm2/m2)',b);
%s=sprintf('{      }(e) SPEAR (last 50yr minus first 50yr; %4.2fK)',b);
title(s,'FontSize',fsize);
subplot(row,col,6); t1=21; t2=30; v=SP1;
a=mean(v.w0.sfc.lai.ann(t1:t2,:,:),1)-mean(v.c0.sfc.lai.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1)
%b=mean(v.w0.sfc.lai.ann_stat.mmen.all(t1:t2))-mean(v.c0.sfc.lai.ann_stat.mmen.all(1:20))
%a=d1.w4.av-d1.c4.av; b=d1.T4; a=a4-a; b=b4-b;
%a=d2.w4.av-d2.c4.av; b=d2.T4; a=a4-a; b=b4-b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-7 7]);
contour(lon,lat,lm,1,co); s=sprintf('(f) \\DeltaLAI SPEAR (%4.2fm2/m2)',b);
%s=sprintf('{        }(f) SPEAR-SV (last 50yr minus first 50yr; %4.2fK)',b);
title(s,'FontSize',fsize); %colormap(parula);

subplot(row,col,7); t1=21; t2=30; v=SP1;
a=mean(v.w0.sfc.fsw.ann(t1:t2,:,:),1)-mean(v.c0.sfc.fsw.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1); a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-30 30]);
contour(lon,lat,lm,1,co); 
s=sprintf('(g) \\DeltaSWR SPEAR (%4.2fW/m2)',b);
title(s,'FontSize',fsize);
subplot(row,col,8); t1=21; t2=30; v=SP4;
a=mean(v.w0.sfc.fsw.ann(t1:t2,:,:),1)-mean(v.c0.sfc.fsw.ann(1:20,:,:),1);a=squeeze(a); 
latlon=[0 360 -90 90]; b=get_regmean(a,latlon,o,0,1); a=a1-a; b=b1-b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-30 30]);
contour(lon,lat,lm,1,co); 
s=sprintf('(h) \\DeltaSWR (SPEAR - SPEAR-SV) (%4.2fW/m2)',b);
title(s,'FontSize',fsize); %colormap(parula);

nn=256; cmap=bluewhitered_miz(nn);   colormap(cmap);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2g: latitudional distribution of TAS warming
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_abs_zm'; lat=o.lat; xy=[-90 90 3 18];
t1=101; t2=150; opt=0;
d=gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
pms=[ 0, 0, 900, 700]*0.8; fsize=12; lw=1;
handle = figure('Position', pms,'visible','on'); 
a=(d.w1.zm-d.c1.zm); plot(lat,a,'r','LineWidth',lw); hold on;
%a=(d.w2.zm-d.c2.zm); plot(lat,a,'k','LineWidth',lw); hold on;
a=(d.w3.zm-d.c3.zm); plot(lat,a,'b','LineWidth',lw); hold on;
a=(d.w4.zm-d.c4.zm); plot(lat,a,'c','LineWidth',lw); hold on;
a=(d.w5.zm-d.c5.zm); plot(lat,a,'m','LineWidth',lw); hold on;
%a=(d.W5.zm-d.c5.zm); plot(lat,a,'g','LineWidth',lw); hold on;
%a=(d.G5.zm-d.c5.zm); plot(lat,a,'g--','LineWidth',lw); hold on;
%a=(d.W5.zm+d.G5.zm-2*d.c5.zm); plot(lat,a,'g','LineWidth',lw*2); hold on;
s1=sprintf('CM4.0    (%4.2f)',d.T1);
%s2=sprintf('ESM4    (%4.2f)',d.T2);
s3=sprintf('SPEAR    (%4.2f)',d.T3);
s4=sprintf('SPEAR-SV (%4.2f)',d.T4);
s5=sprintf('AM4.0-PW (%4.2f)',d.T5);
%s6=sprintf('AM4.0-PSBC       (%4.2f)',d.T6);
%s7=sprintf('AM4.0-4xCO2      (%4.2f)',d.T7);
%legend(s1,s2,s3,s4,s5,s6,s7,'Location','northwest');
legend(s1,s3,s4,s5,'Location','northwest');
xl='latitude'; xlabel(xl,'FontSize',fsize); 
yl='change in surface air temperature (K)'; ylabel(yl,'FontSize',fsize);
axis(xy); grid on; set(gca,'FontSize',fsize); mylabel(xy,1,'(e)',12);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2.S1: surface air temperature warming map%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_map1'; t1=101; t2=150; opt=0; 
d=gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
cmin=0.; cmax=16; vbin=[cmin:0.02:cmax]; d1=-6;d2=6; vbin1=[d1:0.1:d2];
pms=[ 0, 0, 1400, 1100]*0.7; fsize=10; row=3; col=2;
handle = figure('Position', pms,'visible','on'); colormap(jet(256));
subplot(row,col,1); a=(d.w1.av-d.c1.av);%/(w1.gm-c1.gm);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'w');
s=sprintf('(a) CM4.0 (%4.2fK)',d.T1); title(s,'FontSize',fsize);
subplot(row,col,2); a=(d.w2.av-d.c2.av);%/(w2.gm-c2.gm);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'w');
s=sprintf('(b) ESM4 (%4.2fK)',d.T2); title(s,'FontSize',fsize);
subplot(row,col,3); a=(d.w3.av-d.c3.av);%/(w3.gm-c3.gm);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'w');
s=sprintf('(c) SPEAR (%4.2fK)',d.T3); title(s,'FontSize',fsize);
subplot(row,col,4); a=(d.w4.av-d.c4.av);%/(w4.gm-c4.gm);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'w');
s=sprintf('(d) SPEAR-SV (%4.2fK)',d.T4); title(s,'FontSize',fsize);
subplot(row,col,5); a=(d.w5.av-d.c5.av);% (w4.av-c4.av);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'w');
s=sprintf('(e) AM4.0-PW (%4.2fK)',d.T5);
title(s,'FontSize',fsize);
subplot(row,col,6); a=a-(d.w1.av-d.c1.av);% (w1.av-c1.av);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-1 1]);
contour(lon,lat,lm,1,'w');
s=sprintf('(f) (e) minus (a) (%4.2fK)',d.T5-d.T1);
title(s,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2.S2: sea surface temperature warming map%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtsurf_map'; t1=101; t2=150; 
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
a=CM4.c0.sfc.tsurf.all (1:100,:,:,:); c1=gmean(a,aa,opt);
a=CM4.w0.sfc.tsurf.all (t1:t2,:,:,:); w1=gmean(a,aa,opt);
a=ESM.c0.sfc.tsurf.all (1:100,:,:,:); c2=gmean(a,aa,opt);
a=ESM.w0.sfc.tsurf.all (t1:t2,:,:,:); w2=gmean(a,aa,opt);
a=SP1.c0.sfc.tsurf.all (1:100,:,:,:); c3=gmean(a,aa,opt);
a=SP1.w0.sfc.tsurf.all (t1:t2,:,:,:); w3=gmean(a,aa,opt);
a=SP4.c0.sfc.tsurf.all (1:100,:,:,:); c4=gmean(a,aa,opt);
a=SP4.w0.sfc.tsurf.all (t1:t2,:,:,:); w4=gmean(a,aa,opt);
a=a40.c0.sfc.tsurf.all (:    ,:,:,:); c5=gmean(a,aa,opt);
a=a40.w0.sfc.tsurf.all (:    ,:,:,:); w5=gmean(a,aa,opt);
a=a40.W0.sfc.tsurf.all (:    ,:,:,:); W5=gmean(a,aa,opt);
a=a40.G0.sfc.tsurf.all (:    ,:,:,:); G5=gmean(a,aa,opt);
a=a40.W1.sfc.tsurf.all (:    ,:,:,:); U5=gmean(a,aa,opt);
a=a40.W2.sfc.tsurf.all (:    ,:,:,:); A5=gmean(a,aa,opt);
a=a40.W3.sfc.tsurf.all (:    ,:,:,:); B5=gmean(a,aa,opt);
%a=a41.c0.sfc.tsurf.all(:    ,:,:,:); c6=gmean(a,aa,opt);
%a=a41.w0.sfc.tsurf.all(:    ,:,:,:); w6=gmean(a,aa,opt);
cmin=0.; cmax=16; vbin=[cmin:0.02:cmax]; d1=-6;d2=6; vbin1=[d1:0.1:d2];
pms=[ 0, 0, 1400, 1100]*0.7; fsize=10; row=3; col=2;
handle = figure('Position', pms,'visible','on'); colormap(jet(256));
subplot(row,col,1); a=(w1.av-c1.av);%/(w1.gm-c1.gm);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'w');
s=sprintf('(a) CM4.0 (%4.2fK)',d.T1); title(s,'FontSize',fsize);
subplot(row,col,2); a=(w2.av-c2.av);%/(w2.gm-c2.gm);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'w');
s=sprintf('(b) ESM4 (%4.2fK)',d.T2); title(s,'FontSize',fsize);
subplot(row,col,3); a=(w3.av-c3.av);%/(w3.gm-c3.gm);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'w');
s=sprintf('(c) SPEAR (%4.2fK)',d.T3); title(s,'FontSize',fsize);
subplot(row,col,4); a=(w4.av-c4.av);%/(w4.gm-c4.gm);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'w');
s=sprintf('(d) SPEAR-SV (%4.2fK)',d.T4); title(s,'FontSize',fsize);
subplot(row,col,5); a=(w5.av-c5.av);% (w4.av-c4.av);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'w');
s=sprintf('(e) AM4.0-PW (%4.2fK)',d.T5);
title(s,'FontSize',fsize);
subplot(row,col,6); a=a-(w1.av-c1.av);% (w1.av-c1.av);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-1 1]);
contour(lon,lat,lm,1,'w');
s=sprintf('(f) (e) minus (a) (%4.2fK)',d.T5-d.T1);
title(s,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig2.S3: sea ice concentration map%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dice_map'; t1=101; t2=150; 
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
a=CM4.c0.sfc.ice.all (1:100,:,:,:); c1=gmean(a,aa,opt);
a=CM4.w0.sfc.ice.all (t1:t2,:,:,:); w1=gmean(a,aa,opt);
a=ESM.c0.sfc.ice.all (1:100,:,:,:); c2=gmean(a,aa,opt);
a=ESM.w0.sfc.ice.all (t1:t2,:,:,:); w2=gmean(a,aa,opt);
a=SP1.c0.sfc.ice.all (1:100,:,:,:); c3=gmean(a,aa,opt);
a=SP1.w0.sfc.ice.all (t1:t2,:,:,:); w3=gmean(a,aa,opt);
a=SP4.c0.sfc.ice.all (1:100,:,:,:); c4=gmean(a,aa,opt);
a=SP4.w0.sfc.ice.all (t1:t2,:,:,:); w4=gmean(a,aa,opt);
a=a40.c0.sfc.ice.all (:    ,:,:,:); c5=gmean(a,aa,opt);
a=a40.w0.sfc.ice.all (:    ,:,:,:); w5=gmean(a,aa,opt);
a=a40.W0.sfc.ice.all (:    ,:,:,:); W5=gmean(a,aa,opt);
a=a40.G0.sfc.ice.all (:    ,:,:,:); G5=gmean(a,aa,opt);
a=a40.W1.sfc.ice.all (:    ,:,:,:); U5=gmean(a,aa,opt);
a=a40.W2.sfc.ice.all (:    ,:,:,:); A5=gmean(a,aa,opt);
a=a40.W3.sfc.ice.all (:    ,:,:,:); B5=gmean(a,aa,opt);
%a=a41.c0.sfc.ice.all(:    ,:,:,:); c6=gmean(a,aa,opt);
%a=a41.w0.sfc.ice.all(:    ,:,:,:); w6=gmean(a,aa,opt);
cmin=-1; cmax=1; vbin=[cmin:0.01:cmax]; d1=-6;d2=6; vbin1=[d1:0.1:d2];
pms=[ 0, 0, 1400, 1100]*0.7; fsize=10; row=3; col=2;
handle = figure('Position', pms,'visible','on'); colormap(jet(256));
subplot(row,col,1); a=(w1.av-c1.av);%/(w1.gm-c1.gm);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'w');
s=sprintf('(a) CM4.0 (%4.2f)',d.T1); title(s,'FontSize',fsize);
subplot(row,col,2); a=(w2.av-c2.av);%/(w2.gm-c2.gm);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'w');
s=sprintf('(b) ESM4 (%4.2f)',d.T2); title(s,'FontSize',fsize);
subplot(row,col,3); a=(w3.av-c3.av);%/(w3.gm-c3.gm);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'w');
s=sprintf('(c) SPEAR (%4.2f)',d.T3); title(s,'FontSize',fsize);
subplot(row,col,4); a=(w4.av-c4.av);%/(w4.gm-c4.gm);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'w');
s=sprintf('(d) SPEAR-SV (%4.2f)',d.T4); title(s,'FontSize',fsize);
subplot(row,col,5); a=(w5.av-c5.av);% (w4.av-c4.av);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'w');
s=sprintf('(e) AM4.0-PW (%4.2f)',d.T5);
title(s,'FontSize',fsize);
subplot(row,col,6); a=a-(w1.av-c1.av);% (w1.av-c1.av);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-0.2 0.2]);
contour(lon,lat,lm,1,'w');
s=sprintf('(f) (e) minus (a) (%4.2f)',d.T5-d.T1);
title(s,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig3a: 4xCO2 TOA forcing %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='4xCO2_dN_dT_4panel'; t1=1; t2=150; opt=0;
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
df=get4xco2f(a40,aa,opt);
d=get_fdbk(CM4,ESM,SP1,SP4,a40,df,t1,t2,opt); x0=[2.5:5:150];
cmin=0; cmax=10; vbin=[cmin:0.01:cmax]; color='w';
pms=[ 0, 0, 650, 400]*1.8; fsize=10; row=2; col=2;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); a=df.av1; b=df.gm1; colormap(jet);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); 
s=sprintf('{        }(a) AM4.0-C-4xCO2 minus AM4.0-C (%4.2f W/m2)',b); 
title(s,'FontSize',fsize); set(gca,'FontSize',fsize); 
subplot(row,col,2); a=df.av1_T; b=df.T1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([0 2]);
contour(lon,lat,lm,1,color);
s=sprintf('{      }(b) AM4.0-C-4xCO2 minus AM4.0-C (%4.2f K)',b); 
title(s,'FontSize',fsize); set(gca,'FontSize',fsize); 
subplot(row,col,3); a=df.av2; b=df.gm2;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('{        }(c) AM4.0-W-4xCO2 minus AM4.0-W (%4.2f W/m2)',b);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize); 
subplot(row,col,4); a=df.av2_T; b=df.T2; a(1,1)=-10;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([0 2]);
contour(lon,lat,lm,1,color);
s=sprintf('{      }(d) AM4.0-W-4xCO2 minus AM4.0-W (%4.2f K)',b);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize); 
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig3e time seris of feedback%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
vname='ts_feedback'; t1=1; t2=150; opt=0;
df=get4xco2f(a40,aa,opt);
d=get_fdbk(CM4,ESM,SP1,SP4,a40,df,t1,t2,opt); x0=[2.5:5:150];
pms=[ 0, 0, 1000, 600]*0.6; fsize=10; lw=1;
handle = figure('Position', pms,'visible','on'); 
plot(x0,d.fb1,'r','LineWidth',lw); hold on;
%plot(x0,d.fb2,'k','LineWidth',lw); hold on;
plot(x0,d.fb3,'b','LineWidth',lw); hold on;
plot(x0,d.fb4,'c','LineWidth',lw); hold on;
plot([101 150],d.fb5,'k','LineWidth',lw);
legend('CM4.0','SPEAR','SPEAR-SV','AM4.0-W','Location','southeast');
xl='year'; xlabel(xl,'FontSize',fsize); 
yl='TOA net raditive feedback (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xy=[0 150 -1.8 -1.1]; mylabel(xy,2,'',12); 
title('(e) TOA net radiative feedback','FontSize',fsize);
set(gca,'FontSize',fsize); 
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig3a-f_new: 4xCO2 TOA forcing %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='4xCO2_dN_dT_6panel'; t1=1; t2=150; opt=0;
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
df=get4xco2f(a40,aa,opt);
%d=get_fdbk(CM4,ESM,SP1,SP4,a40,df,t1,t2,opt); x0=[2.5:5:150];
cmin=0; cmax=10; vbin=[cmin:0.01:cmax]; color='w';
pms=[ 0, 0, 500, 650]*2; fsize=8; row=3; col=2;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); a=df.av1; b=df.gm1; 
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);%colormap(jet);
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); 
s=sprintf('{        }(a) AM4.0-C-4xCO2 minus AM4.0-C (%4.2f W/m2)',b); 
title(s,'FontSize',fsize); set(gca,'FontSize',fsize); 
subplot(row,col,2); a=df.av1_T; b=df.T1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([0 2]);
contour(lon,lat,lm,1,color);
s=sprintf('{      }(b) AM4.0-C-4xCO2 minus AM4.0-C (%4.2f K)',b); 
title(s,'FontSize',fsize); set(gca,'FontSize',fsize); 
subplot(row,col,3); a=df.av3; b=df.gm3;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('{        }(c) AM4.0-W1-4xCO2 minus AM4.0-W1 (%4.2f W/m2)',b);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize); 
subplot(row,col,4); a=df.av3_T; b=df.T3; a(1,1)=-10;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([0 2]);
contour(lon,lat,lm,1,color);
s=sprintf('{      }(d) AM4.0-W1-4xCO2 minus AM4.0-W1 (%4.2f K)',b);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize); 
subplot(row,col,5); a=df.av2; b=df.gm2;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('{        }(e) AM4.0-W2-4xCO2 minus AM4.0-W2 (%4.2f W/m2)',b);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize); 
subplot(row,col,6); a=df.av2_T; b=df.T2; a(1,1)=-10;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([0 2]);
contour(lon,lat,lm,1,color);
s=sprintf('{      }(f) AM4.0-W2-4xCO2 minus AM4.0-W2 (%4.2f K)',b);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize); 
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig3.S1: 4xCO2 TOA forcing %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='4xCO2_forcing_1'; t1=1; t2=150; opt=0;
df=get4xco2f(a40,aa,opt);
d=get_fdbk(CM4,ESM,SP1,SP4,a40,df,t1,t2,opt); x0=[2.5:5:150];
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
cmin=0; cmax=10; vbin=[cmin:0.01:cmax];
pms=[ 0, 0, 650, 400]*0.8; fsize=10; row=1; col=1;
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); a=df.av1; b=df.gm1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(a) AM4.0-C-4xCO2 minus AM4.0-C (%4.2f W/m2)',b); 
title(s,'FontSize',fsize); set(gca,'FontSize',fsize); 
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig3.S2: 4xCO2 TOA forcing %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='4xCO2_forcing_2'; t1=1; t2=150; opt=0;
df=get4xco2f(a40,aa,opt);
d=get_fdbk(CM4,ESM,SP1,SP4,a40,df,t1,t2,opt); x0=[2.5:5:150];
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
cmin=0; cmax=10; vbin=[cmin:0.01:cmax];
pms=[ 0, 0, 650, 400]*0.8; fsize=10; row=1; col=1;
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); a=df.av2; b=df.gm2;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(b) AM4.0-PW minus AM4.0-W (%4.2f W/m2)',b);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize); 
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig3.S3: 4xCO2 TOA forcing %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='4xCO2_forcing_map'; opt=0;
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
df=get4xco2f(a40,aa,opt);
cmin=0; cmax=10; vbin=[cmin:0.01:cmax];
%pms=[ 0, 0, 650, 1200]*0.7; fsize=10; row=3; col=1;
pms=[ 0, 0, 1500, 800]*0.7; fsize=10; row=2; col=2;
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); a=df.av1; b=df.gm1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(a) AM4.0-CTRL 4xCO2 (%4.2f W/m2)',b); title(s,'FontSize',fsize);
subplot(row,col,2); a=df.av2; b=df.gm2;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(b) AM4.0-WARM 4xCO2 (%4.2f W/m2)',b); title(s,'FontSize',fsize);
subplot(row,col,3); a=df.av; b=df.gm;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(c) [(a)+(b)]/2  (%4.2f W/m2)',b); title(s,'FontSize',fsize);
subplot(row,col,4); beta=1; fp=1.18*beta;
a=df.av2+fp*df.T2; b=df.gm2+fp*df.T2;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(d) adjusted 4xCO2 forcing (%4.2f W/m2)',b); title(s,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig4a: TOA net radiative feedback%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dN_feedback_map_6panel';  opt=0;
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
df=get4xco2f(a40,aa,opt); fav=df.av2; f0=df.gm2; dT_co2=df.T2
t1=101; t2=150; 
dt=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
t1=1; t2=50; 
dt1=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d1 =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; color='w';
pms=[ 0, 0, 1500, 1200]*0.7; fsize=10; row=3; col=2;
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); dT=dt.T1-dT_co2;
a=(d.w1.av-d.c1.av-fav)/dT; b=(d.N1-f0)/dT; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(a) CM4.0 (%4.2f W/m2/K)',b); title(s,'FontSize',fsize);
subplot(row,col,2); dT=dt.T3-dT_co2;
a=(d.w3.av-d.c3.av-fav)/dT; b=(d.N3-f0)/dT; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(b) SPEAR (%4.2f W/m2/K)',b); title(s,'FontSize',fsize);
subplot(row,col,3); dT=dt.T4-dT_co2;
a=(d.w4.av-d.c4.av-fav)/dT; b=(d.N4-f0)/dT; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(c) SPEAR-SV (%4.2f W/m2/K)',b); title(s,'FontSize',fsize);
subplot(row,col,4); a=a3-a4; b=b3-b4;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(d) (b) minus (c) (%4.2f W/m2/K)',b); title(s,'FontSize',fsize);
subplot(row,col,5); 
%dT=dt1.T1-dT_co2; a=(d1.w1.av-d1.c1.av-fav)/dT; b=(d1.N1-f0)/dT; a=a1-a; b=b1-b;%CM4
dT=dt1.T3-dT_co2; a=(d1.w3.av-d1.c3.av-fav)/dT; b=(d1.N3-f0)/dT; a=a3-a; b=b3-b;%SPEAR
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
%s=sprintf('(e) CM4.0 (last 50yr - first 50yr; %4.2f W/m2/K)',b);
s=sprintf('{        }(e) SPEAR (last 50yr minus first 50yr; %4.2f W/m2/K)',b);
title(s,'FontSize',fsize);
subplot(row,col,6);
dT=dt1.T4-dT_co2; a=(d1.w4.av-d1.c4.av-fav)/dT; b=(d1.N4-f0)/dT; a=a4-a; b=b4-b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('{        }(f) SPEAR-SV (last 50yr minus first 50yr; %4.2f W/m2/K)',b);
title(s,'FontSize',fsize);
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig4_new: TOA net radiative feedback%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dN_feedback_map_6panel_new';  opt=0;
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
df=get4xco2f(a40,aa,opt); fav=df.av2; f0=df.gm2; dT_co2=df.T2
t1=26; t2=75; 
dt1=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d1 =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
t1=101; t2=150; 
dt2=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d2 =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; color='w';
pms=[ 0, 0, 1200, 1200]*0.7; fsize=8; row=4; col=2;
handle = figure('Position', pms,'visible','on'); colormap(jet);
dt=dt1; d=d1; %plot dt1 and d1 in panels a-c!!!!!!!!!!!!!!
subplot(row,col,1);  dT=dt.T1-dT_co2;
a=(d.w1.av-d.c1.av-fav)/dT; b=(d.N1-f0)/dT; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(a) CM4.0 (%4.2f W/m2/K)',b); title(s,'FontSize',fsize);
subplot(row,col,2); dT=dt.T3-dT_co2;
a=(d.w3.av-d.c3.av-fav)/dT; b=(d.N3-f0)/dT; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(b) SPEAR (%4.2f W/m2/K)',b); title(s,'FontSize',fsize);
subplot(row,col,3); dT=dt.T4-dT_co2;
a=(d.w4.av-d.c4.av-fav)/dT; b=(d.N4-f0)/dT; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(c) SPEAR-SV (%4.2f W/m2/K)',b); title(s,'FontSize',fsize);
subplot(row,col,4); a=a3-a4; b=b3-b4;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(d) (b) minus (c) (%4.2f W/m2/K)',b); title(s,'FontSize',fsize);

%plot dN between two 50yr period centered at 125 and 50 in panels d-h!!!!!!!!!!!!!!
subplot(row,col,5);  dT=dt2.T1-dt1.T1;
a=(d2.w1.av-d1.w1.av)/dT; b=(d2.N1-d1.N1)/dT; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(e) CM4.0 (%4.2f W/m2/K)',b); title(s,'FontSize',fsize);
subplot(row,col,6); dT=dt2.T3-dt1.T3;
a=(d2.w3.av-d1.w3.av)/dT; b=(d2.N3-d1.N3)/dT; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(f) SPEAR (%4.2f W/m2/K)',b); title(s,'FontSize',fsize);
subplot(row,col,7); dT=dt2.T4-dt1.T4;
a=(d2.w4.av-d1.w4.av)/dT; b=(d2.N4-d1.N4)/dT; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(g) SPEAR-SV (%4.2f W/m2/K)',b); title(s,'FontSize',fsize);
subplot(row,col,8); a=a3-a4; b=b3-b4;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(h) (f) minus (g) (%4.2f W/m2/K)',b); title(s,'FontSize',fsize);

nn=256; cmap=bluewhitered_miz(nn); colormap(cmap);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig4.S1: TOA net radiative feedback%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dN_feedback_map_4panel'; t1=101; t2=150; opt=0;
df=get4xco2f(a40,aa,opt); fav=df.av2; f0=df.gm2; dT_co2=df.T2
dt=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; color='w';
pms=[ 0, 0, 1500, 800]*0.7; fsize=10; row=2; col=2;
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); dT=dt.T1-dT_co2;
a=(d.w1.av-d.c1.av-fav)/dT; b=(d.N1-f0)/dT; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(a) CM4.0 (%4.2f W/m2/K)',b); title(s,'FontSize',fsize);
%subplot(row,col,2); dT=dt.T2-dT_co2;
%a=(d.w2.av-d.c2.av-fav)/dT; b=(d.N2-f0)/dT; a2=a; b2=b;
%pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
%contour(lon,lat,lm,1,color);
%s=sprintf('(b) ESM4 (%4.2f W/m2/K)',b); title(s,'FontSize',fsize);
subplot(row,col,2); dT=dt.T3-dT_co2;
a=(d.w3.av-d.c3.av-fav)/dT; b=(d.N3-f0)/dT; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(b) SPEAR (%4.2f W/m2/K)',b); title(s,'FontSize',fsize);
subplot(row,col,3); dT=dt.T4-dT_co2;
a=(d.w4.av-d.c4.av-fav)/dT; b=(d.N4-f0)/dT; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(c) SPEAR-SV (%4.2f W/m2/K)',b); title(s,'FontSize',fsize);
%subplot(row,col,5); a=a1-a2; b=b1-b2;
%pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
%contour(lon,lat,lm,1,color);
%s=sprintf('(e) CM4.0 minus ESM4 (%4.2f W/m2/K)',b); 
%title(s,'FontSize',fsize);
subplot(row,col,4); a=a3-a4; b=b3-b4;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(d) (b) minus (c) (%4.2f W/m2/K)',b);
title(s,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig4.S2: change in TOA net radiative flux%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetTOA_map'; t1=101; t2=150; opt=0;
d=getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
cmin=-12; cmax=12; vbin=[cmin:0.05:cmax]; d1=-6;d2=6; vbin1=[d1:0.1:d2];
pms=[ 0, 0, 1500, 1200]*0.7; fsize=10; row=3; col=2; color='k';
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); a=(d.w1.av-d.c1.av); b=d.N1; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(a) CM4.0 (%4.2f W/m2)',b); title(s,'FontSize',fsize);
subplot(row,col,2); a=(d.w2.av-d.c2.av); b=d.N2; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(b) ESM4 (%4.2f W/m2)',b); title(s,'FontSize',fsize);
subplot(row,col,3); a=(d.w3.av-d.c3.av); b=d.N3; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(c) SPEAR (%4.2f W/m2)',b); title(s,'FontSize',fsize);
subplot(row,col,4); a=(d.w4.av-d.c4.av); b=d.N4; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(d) SPEAR-SV (%4.2f W/m2)',b); title(s,'FontSize',fsize);
subplot(row,col,5); a=a1-a2; b=b1-b2;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(e) CM4.0 minus ESM4 (%4.2f W/m2)',b); 
title(s,'FontSize',fsize);
subplot(row,col,6); a=a3-a4; b=b3-b4;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(f) SPEAR minus SPEAR-SV (%4.2f W/m2)',b);
title(s,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig3.S3: change in TOA net radiative flux%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetTOA_map1'; t1=101; t2=150; opt=0;
d=getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
pms=[ 0, 0, 1500, 1200]*0.7; fsize=10; row=3; col=2; color='k';
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); a=(d.w1.av-d.c1.av); b=d.N1; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(a) CM4.0 (%4.2f W/m2)',b); title(s,'FontSize',fsize);
subplot(row,col,2); a=(d.w2.av-d.c2.av); b=d.N2; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(b) ESM4 (%4.2f W/m2)',b); title(s,'FontSize',fsize);
subplot(row,col,3); a=(d.w3.av-d.c3.av); b=d.N3; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(c) SPEAR (%4.2f W/m2)',b); title(s,'FontSize',fsize);
subplot(row,col,4); a=(d.w4.av-d.c4.av); b=d.N4; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(d) SPEAR-SV (%4.2f W/m2)',b); title(s,'FontSize',fsize);
subplot(row,col,5); a=d.w5.av-d.c5.av; b=d.N5;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(e) AM4.0-PW (%4.2f W/m2)',b); title(s,'FontSize',fsize);
subplot(row,col,6); a=d.G5.av-d.c5.av; b=d.N7;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(f) AM4.0-4xCO2-Forcing (%4.2f W/m2)',b); title(s,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig4.5: Vegetation changes and its effects
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dN_feedback_map_6panel';  opt=0;
df=get4xco2f(a40,aa,opt); fav=df.av2; f0=df.gm2; dT_co2=df.T2
t1=101; t2=150; 
dt =gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d  =getvege(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
t1=1; t2=50; 
dt1=gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d1 =getvege(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
cmin=-6; cmax=6; vbin=[cmin:0.01:cmax]; color='w';
pms=[ 0, 0, 1500, 1200]*0.7; fsize=10; row=3; col=2;
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); dT=dt.T1;
a=(d.w1.av-d.c1.av); b=d.N1; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(a) CM4.0 (%4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,2); dT=dt.T3;
a=(d.w3.av-d.c3.av); b=d.N3; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(b) SPEAR (%4.2f)',b); title(s,'FontSize',fsize);
subplot(row,col,3); 
a=(d1.w3.av-d1.c3.av); b=d1.N3; a=a3-a; b=b3-b;%SPEAR
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(e) SPEAR (last 50yr minus first 50yr; %4.2f W/m2/K)',b);
title(s,'FontSize',fsize);

subplot(row,col,4);
a=(d1.w4.av-d1.c4.av); b=d1.N4; a=a4-a; b=b4-b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('(f) SPEAR-SV (last 50yr minus first 50yr; %4.2f W/m2/K)',b);
title(s,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5-A: Separatioin of TOA net radiative feedback perturbation from ColdCtl
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
vname='dN_feedback_AM4_pert_cold';  t1=101; t2=150; opt=0;
df=get4xco2f(a40,aa,opt); fav=df.av; f0=df.gm;
dt=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; s0='(%4.2f W/m2/K)';
pms=[ 0, 0, 1500, 1200]*0.7; fsize=10; row=3; col=2; color='w';
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); s='(a) AM4.0-W';
a=(d.W5.av-d.c5.av)/dt.T7; b=d.N7/dt.T7; dT0=dt.T7; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); 
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,2); s='(b) AM4.0-W-CESS';
a=(d.P5.av-d.c5.av)/dt.Ty; b=d.Ny/dt.Ty; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); 
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,3); s='(c) AM4.0-W-SSTA';%===========
a=(d.S5.av-d.c5.av)/dT0; b=d.N8/dT0; a3=a; b3=b;
%a=(d.S5.av-d.c5.av)/dt.T8; b=d.N8/dt.T8; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,4); s='(d) AM4.0-W-SSTP'; s='(d) (c) minus (b)';
a=(d.P5.av-d.c5.av)/dt.Ty; b=d.Ny/dt.Ty; a=a3-a; b=b3-b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,5); s='(e) AM4.0-W-SICA';%===========
a=(d.I5.av-d.c5.av)/dT0; b=d.N9/dT0; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,6); s='(f) AM4.0-W-VEGA';%===========
a=(d.V5.av-d.c5.av)/dT0; b=d.Nx/dT0; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
enn=256; cmap=bluewhitered_miz(nn); colormap(cmap);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
xpn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig6: change in Tref of the perturbation runs from ColdCtl
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
vname='dT_feedback_AM4_pert_cold';  t1=101; t2=150; opt=0;
df=get4xco2f(a40,aa,opt); fav=df.av; f0=df.gm;
dt=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
cmin=0; cmax=8; vbin=[cmin:0.01:cmax]; s0='(%4.2f K)';
pms=[ 0, 0, 1500, 1200]*0.7; fsize=10; row=3; col=2; color='w';
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); s='(a) AM4.0-W';
a=(dt.W5.av-dt.c5.av); b=dt.T7; dT0=dt.T7; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); 
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,2); s='(b) AM4.0-W-CESS';
a=(dt.P5.av-dt.c5.av); b=dt.Ty; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([0 4]);
contour(lon,lat,lm,1,color); 
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,3); s='(c) AM4.0-W-SSTA';%===========
a=(dt.S5.av-dt.c5.av); b=dt.T8; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,4); s='(d) (c)/4.76 minus (b)/2.24';
a=(dt.P5.av-dt.c5.av); b=dt.Ty; a=a3/b3-a/b; b=b3/b3-b/b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-1 1]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,5); s='(e) AM4.0-W-SICA';%===========
a=(dt.I5.av-dt.c5.av); b=dt.T9; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,6); s='(f) AM4.0-W-VEGA';%===========
a=(dt.V5.av-dt.c5.av); b=dt.Tx; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([-1 1]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
enn=256; cmap=bluewhitered_miz(nn); colormap(cmap);
%cmap=cbrewer('div','BrBG',nn);   colormap(cmap);
%cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%cmap=fabien_colormap(nn);         colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5-C: Separatioin of TOA net radiative feedback Warm Ctl
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dN_feedback_AM4_pert_warm';  t1=101; t2=150; opt=0;
df=get4xco2f(a40,aa,opt); fav=df.av; f0=df.gm;
dt=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; s0='(%4.2f W/m2/K)';
pms=[ 0, 0, 1500, 1200]*0.7; fsize=10; row=3; col=2;
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); s='(a) AM4.0-W';
a=(d.W5.av-d.c5.av)/dt.T7; b=d.N7/dt.T7; dT0=dt.T7; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); 
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,2); s='(b) AM4.0-W-CESS'; dT=dt.Td-dt.T7;
a=(d.D5.av-d.W5.av)/dT; b=(d.Nd-d.N7)/dT; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); 
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,3); s='(c) AM4.0-W-SSTA';
a=(d.A5.av-d.c5.av)/dT0; b=d.Na/dT0; a=a1-a; b=b1-b; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,4); s='(d) AM4.0-W-SSTP'; 
a=a3-a2; b=b3-b2;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,5); s='(e) AM4.0-W-SICA';
a=(d.B5.av-d.c5.av)/dT0; b=d.Nb/dT0; a=a1-a; b=b1-b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,6); s='(e) AM4.0-W-VEGA';
a=(d.C5.av-d.c5.av)/dT0; b=d.Nc/dT0; a=a1-a; b=b1-b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig6a: change in zonal mean TOA net radiative flux
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dNdT_AM4_pert_cold_zm'; xy=[-90 90 -3 3];
t1=101; t2=150; opt=0;
dt=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; s0='(%4.2f)';
pms=[ 0, 0, 700, 500]*1; fsize=10; lw=1; dT0=dt.T7;
handle = figure('Position', pms,'visible','on'); colormap(jet);
a=d.c5.zm; dT0=dt.T7;
y1=(d.W5.zm-a)/dT0;   b1=d.N7/dT0;   s1='AM4.0-W';
y2=(d.P5.zm-a)/dt.Ty; b2=d.Ny/dt.Ty; s2='AM4.0-W-CESS';
y3=(d.S5.zm-a)/dT0;   b3=d.N8/dT0;   s3='AM4.0-W-SSTA';
y4=y3-y2;             b4=b3-b2;      s4='AM4.0-W-SSTP';
y5=(d.I5.zm-a)/dT0;   b5=d.N9/dT0;   s5='AM4.0-W-SICA';
y6=(d.V5.zm-a)/dT0;   b6=d.Nx/dT0;   s6='AM4.0-W-VEGA';
plot(lat,y1,'r','LineWidth',lw); hold on;
plot(lat,y2,'m','LineWidth',lw); hold on;
plot(lat,y3,'c','LineWidth',lw); hold on;
plot(lat,y4,'b','LineWidth',lw); hold on;
plot(lat,y5,'k','LineWidth',lw); hold on;
plot(lat,y6,'g','LineWidth',lw); hold on;
s1=sprintf(char(strcat(s1,{' '},s0)),b1);
s2=sprintf(char(strcat(s2,{' '},s0)),b2);
s3=sprintf(char(strcat(s3,{' '},s0)),b3);
s4=sprintf(char(strcat(s4,{' '},s0)),b4);
s5=sprintf(char(strcat(s5,{' '},s0)),b5);
s6=sprintf(char(strcat(s6,{' '},s0)),b6);
legend(s1,s2,s3,s4,s5,s6,'location','north');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='change in TOA net radiative flux (W/m2/K)'; 
ylabel(yl,'FontSize',fsize); mylabel(xy,1,'(a)',12);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig6b: change in zonal mean TOA net cloud radiative flux
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dNdT_AM4_pert_cold_zm_cld'; xy=[-90 90 -3.5 1];
t1=101; t2=150; opt=0;
dt=gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getttcf(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; s0='(%4.2f)';
pms=[ 0, 0, 700, 500]*1; fsize=10; lw=1; dT0=dt.T7;
handle = figure('Position', pms,'visible','on'); colormap(jet);
a=d.c5.zm; dT0=dt.T7;
y1=(d.W5.zm-a)/dT0;   b1=d.N7/dT0;   s1='AM4.0-W';
y2=(d.P5.zm-a)/dt.Ty; b2=d.Ny/dt.Ty; s2='AM4.0-W-CESS';
y3=(d.S5.zm-a)/dT0;   b3=d.N8/dT0;   s3='AM4.0-W-SSTA';
y4=y3-y2;             b4=b3-b2;      s4='AM4.0-W-SSTP';
y5=(d.I5.zm-a)/dT0;   b5=d.N9/dT0;   s5='AM4.0-W-SICA';
y6=(d.V5.zm-a)/dT0;   b6=d.Nx/dT0;   s6='AM4.0-W-VEGA';
plot(lat,y1,'r','LineWidth',lw); hold on;
plot(lat,y2,'m','LineWidth',lw); hold on;
plot(lat,y3,'c','LineWidth',lw); hold on;
plot(lat,y4,'b','LineWidth',lw); hold on;
plot(lat,y5,'k','LineWidth',lw); hold on;
plot(lat,y6,'g','LineWidth',lw); hold on;
s1=sprintf(char(strcat(s1,{' '},s0)),b1);
s2=sprintf(char(strcat(s2,{' '},s0)),b2);
s3=sprintf(char(strcat(s3,{' '},s0)),b3);
s4=sprintf(char(strcat(s4,{' '},s0)),b4);
s5=sprintf(char(strcat(s5,{' '},s0)),b5);
s6=sprintf(char(strcat(s6,{' '},s0)),b6);
legend(s1,s2,s3,s4,s5,s6,'location','south');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='change in TOA net cloud radiative effect (W/m2/K)'; 
ylabel(yl,'FontSize',fsize); mylabel(xy,1,'(b)',12);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig6c: change in zonal mean TOA net clear-sky radiative flux
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dNdT_AM4_pert_cold_zm_clr'; xy=[-90 90 -3 5];
t1=101; t2=150; opt=0;
dt=gettref     (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
ds=getswnet_clr(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
dl=getlwnet_clr(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; s0='(%4.2f)';
pms=[ 0, 0, 700, 500]*1; fsize=10; lw=1;
handle = figure('Position', pms,'visible','on'); colormap(jet);
a=ds.c5.zm+dl.c5.zm; dT0=dt.T7;
y1=(ds.W5.zm+dl.W5.zm-a)/dT0;   b1=(ds.N7+dl.N7)/dT0;   s1='AM4.0-W';
y2=(ds.P5.zm+dl.P5.zm-a)/dt.Ty; b2=(ds.Ny+dl.Ny)/dt.Ty; s2='AM4.0-W-CESS';
y3=(ds.S5.zm+dl.S5.zm-a)/dT0;   b3=(ds.N8+dl.N8)/dT0;   s3='AM4.0-W-SSTA';
y4=y3-y2;                       b4=b3-b2;               s4='AM4.0-W-SSTP';
y5=(ds.I5.zm+dl.I5.zm-a)/dT0;   b5=(ds.N9+dl.N9)/dT0;   s5='AM4.0-W-SICA';
y6=(ds.V5.zm+dl.V5.zm-a)/dT0;   b6=(ds.Nx+dl.Nx)/dT0;   s6='AM4.0-W-VEGA';
plot(lat,y1,'r','LineWidth',lw); hold on;
plot(lat,y2,'m','LineWidth',lw); hold on;
plot(lat,y3,'c','LineWidth',lw); hold on;
plot(lat,y4,'b','LineWidth',lw); hold on;
plot(lat,y5,'k','LineWidth',lw); hold on;
plot(lat,y6,'g','LineWidth',lw); hold on;
s1=sprintf(char(strcat(s1,{' '},s0)),b1);
s2=sprintf(char(strcat(s2,{' '},s0)),b2);
s3=sprintf(char(strcat(s3,{' '},s0)),b3);
s4=sprintf(char(strcat(s4,{' '},s0)),b4);
s5=sprintf(char(strcat(s5,{' '},s0)),b5);
s6=sprintf(char(strcat(s6,{' '},s0)),b6);
legend(s1,s2,s3,s4,s5,s6,'location','north');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='change in TOA net clear-sky radiative flux (W/m2/K)'; 
ylabel(yl,'FontSize',fsize); mylabel(xy,1,'(c)',12);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig6d: change in zonal mean TOA net SW clear-sky radiative flux
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dNdT_AM4_pert_cold_zm_swclr'; xy=[-90 90 -1 7];
t1=101; t2=150; opt=0;
dt=gettref     (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
ds=getswnet_clr(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; s0='(%4.2f)';
pms=[ 0, 0, 700, 500]*1; fsize=10; lw=1;
handle = figure('Position', pms,'visible','on'); colormap(jet);
a=ds.c5.zm; dT0=dt.T7;
y1=(ds.W5.zm-a)/dT0;   b1=(ds.N7)/dT0;   s1='AM4.0-W';
y2=(ds.P5.zm-a)/dt.Ty; b2=(ds.Ny)/dt.Ty; s2='AM4.0-W-CESS';
y3=(ds.S5.zm-a)/dT0;   b3=(ds.N8)/dT0;   s3='AM4.0-W-SSTA';
y4=y3-y2;              b4=b3-b2;         s4='AM4.0-W-SSTP';
y5=(ds.I5.zm-a)/dT0;   b5=(ds.N9)/dT0;   s5='AM4.0-W-SICA';
y6=(ds.V5.zm-a)/dT0;   b6=(ds.Nx)/dT0;   s6='AM4.0-W-VEGA';
plot(lat,y1,'r','LineWidth',lw); hold on;
plot(lat,y2,'m','LineWidth',lw); hold on;
plot(lat,y3,'c','LineWidth',lw); hold on;
plot(lat,y4,'b','LineWidth',lw); hold on;
plot(lat,y5,'k','LineWidth',lw); hold on;
plot(lat,y6,'g','LineWidth',lw); hold on;
s1=sprintf(char(strcat(s1,{' '},s0)),b1);
s2=sprintf(char(strcat(s2,{' '},s0)),b2);
s3=sprintf(char(strcat(s3,{' '},s0)),b3);
s4=sprintf(char(strcat(s4,{' '},s0)),b4);
s5=sprintf(char(strcat(s5,{' '},s0)),b5);
s6=sprintf(char(strcat(s6,{' '},s0)),b6);
legend(s1,s2,s3,s4,s5,s6,'location','north');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='change in TOA clear-sky SW radiative flux (W/m2/K)'; 
ylabel(yl,'FontSize',fsize); mylabel(xy,1,'(d)',12);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig6e: change in zonal mean TOA net LW clear-sky radiative flux
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dNdT_AM4_pert_cold_zm_lwclr'; xy=[-90 90 -5 1];
t1=101; t2=150; opt=0;
dt=gettref     (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
dl=getlwnet_clr(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; s0='(%4.2f)';
pms=[ 0, 0, 700, 500]*1; fsize=10; lw=1;
handle = figure('Position', pms,'visible','on'); colormap(jet);
a=dl.c5.zm; dT0=dt.T7;
y1=(dl.W5.zm-a)/dT0;   b1=(dl.N7)/dT0;   s1='AM4.0-W';
y2=(dl.P5.zm-a)/dt.Ty; b2=(dl.Ny)/dt.Ty; s2='AM4.0-W-CESS';
y3=(dl.S5.zm-a)/dT0;   b3=(dl.N8)/dT0;   s3='AM4.0-W-SSTA';
y4=y3-y2;              b4=b3-b2;         s4='AM4.0-W-SSTP';
y5=(dl.I5.zm-a)/dT0;   b5=(dl.N9)/dT0;   s5='AM4.0-W-SICA';
y6=(dl.V5.zm-a)/dT0;   b6=(dl.Nx)/dT0;   s6='AM4.0-W-VEGA';
plot(lat,y1,'r','LineWidth',lw); hold on;
plot(lat,y2,'m','LineWidth',lw); hold on;
plot(lat,y3,'c','LineWidth',lw); hold on;
plot(lat,y4,'b','LineWidth',lw); hold on;
plot(lat,y5,'k','LineWidth',lw); hold on;
plot(lat,y6,'g','LineWidth',lw); hold on;
s1=sprintf(char(strcat(s1,{' '},s0)),b1);
s2=sprintf(char(strcat(s2,{' '},s0)),b2);
s3=sprintf(char(strcat(s3,{' '},s0)),b3);
s4=sprintf(char(strcat(s4,{' '},s0)),b4);
s5=sprintf(char(strcat(s5,{' '},s0)),b5);
s6=sprintf(char(strcat(s6,{' '},s0)),b6);
legend(s1,s2,s3,s4,s5,s6,'location','south');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='change in TOA clear-sky LW radiative flux (W/m2/K)'; 
ylabel(yl,'FontSize',fsize); mylabel(xy,1,'(e)',12);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig6f: change in zonal mean TOA net radiative flux CM4/SPEAR/SPEAR-SV
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dNdT_CM4_SPEAR_zm'; xy=[-90 90 -3 3];
df=get4xco2f(a40,aa,opt); fav=df.G2.zm-df.C2.zm; f0=df.gm2; dT_co2=df.T2
t1=101; t2=150; opt=0;
dt=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; s0='(%4.2f)';
pms=[ 0, 0, 700, 500]*1; fsize=10; lw=1; dT0=dt.T7;
handle = figure('Position', pms,'visible','on');
a=dt.T1-df.T2; y1=(d.w1.zm-d.c1.zm-fav)/a; b1=(d.N1-f0)/a; s1='CM4.0';
a=dt.T3-df.T2; y2=(d.w3.zm-d.c3.zm-fav)/a; b2=(d.N3-f0)/a; s2='SPEAR';
a=dt.T4-df.T2; y3=(d.w4.zm-d.c4.zm-fav)/a; b3=(d.N4-f0)/a; s3='SPEAR-SV';
y4=y1-y2;                                  b4=b1-b2; s4='CM4.0 minus SPEAR';
y5=y2-y3;                                  b5=b2-b3; s5='SPEAR minus SPEAR-SV';
plot(lat,y1,'r','LineWidth',lw); hold on;
plot(lat,y2,'b','LineWidth',lw); hold on;
plot(lat,y3,'c','LineWidth',lw); hold on;
plot(lat,y4,'k','LineWidth',lw); hold on;
plot(lat,y5,'g','LineWidth',lw); hold on;
s1=sprintf(char(strcat(s1,{' '},s0)),b1);
s2=sprintf(char(strcat(s2,{' '},s0)),b2);
s3=sprintf(char(strcat(s3,{' '},s0)),b3);
s4=sprintf(char(strcat(s4,{' '},s0)),b4);
s5=sprintf(char(strcat(s5,{' '},s0)),b5);
legend(s1,s2,s3,s4,s5,'location','north');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='change in TOA net radiative flux (W/m2/K)'; 
ylabel(yl,'FontSize',fsize); mylabel(xy,1,'(f)',12);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig6d: change in zonal mean TOA net SW SFC clear-sky radiative flux
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dNdT_AM4_pert_cold_zm_swclr_sfc'; xy=[-90 90 -1 7];
t1=101; t2=150; opt=0;
dt=gettref        (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
ds=getswnetsfc_clr(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; s0='(%4.2f)';
pms=[ 0, 0, 700, 500]*1; fsize=10; lw=1;
handle = figure('Position', pms,'visible','on'); colormap(jet);
a=ds.c5.zm; dT0=dt.T7;
y1=(ds.W5.zm-a)/dT0;   b1=(ds.N7)/dT0;   s1='AM4.0-W';
y2=(ds.P5.zm-a)/dt.Ty; b2=(ds.Ny)/dt.Ty; s2='AM4.0-W-CESS';
y3=(ds.S5.zm-a)/dT0;   b3=(ds.N8)/dT0;   s3='AM4.0-W-SSTA';
y4=y3-y2;              b4=b3-b2;         s4='AM4.0-W-SSTP';
y5=(ds.I5.zm-a)/dT0;   b5=(ds.N9)/dT0;   s5='AM4.0-W-SICA';
y6=(ds.V5.zm-a)/dT0;   b6=(ds.Nx)/dT0;   s6='AM4.0-W-VEGA';
plot(lat,y1,'r','LineWidth',lw); hold on;
plot(lat,y2,'m','LineWidth',lw); hold on;
plot(lat,y3,'c','LineWidth',lw); hold on;
plot(lat,y4,'b','LineWidth',lw); hold on;
plot(lat,y5,'k','LineWidth',lw); hold on;
plot(lat,y6,'g','LineWidth',lw); hold on;
s1=sprintf(char(strcat(s1,{' '},s0)),b1);
s2=sprintf(char(strcat(s2,{' '},s0)),b2);
s3=sprintf(char(strcat(s3,{' '},s0)),b3);
s4=sprintf(char(strcat(s4,{' '},s0)),b4);
s5=sprintf(char(strcat(s5,{' '},s0)),b5);
s6=sprintf(char(strcat(s6,{' '},s0)),b6);
legend(s1,s2,s3,s4,s5,s6,'location','north');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='change in TOA clear-sky SW radiative flux (W/m2/K)'; 
ylabel(yl,'FontSize',fsize); mylabel(xy,1,'(d)',12);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5.S1: Separatioin of TOA net radiative feedback other?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetTOA_feedback_AM4b';  t1=101; t2=150; opt=0;
df=get4xco2f(a40,aa,opt); fav=df.av; f0=df.gm;
dt=gettref  (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getnettoa(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax];
pms=[ 0, 0, 1500, 1200]*0.7; fsize=10; row=3; col=2;
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); s='(a) AM4.0-PW';
a=(d.w5.av-d.c5.av-fav)/dt.T5; b=(d.N5-f0)/dt.T5;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (%4.2f W/m2/K)',s,b); title(s,'FontSize',fsize);
subplot(row,col,2); s='(b) AM4.0-PW-total';
a=(d.W5.av-d.c5.av)/dt.T7; b=d.N7/dt.T7;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); 
s=sprintf('%s (%4.2f W/m2)',s,b); title(s,'FontSize',fsize);
subplot(row,col,3); s='(c) AM4.0-PW-SSTA';
dT0=dt.T7; a=(d.S5.av-d.c5.av)/dT0; b=d.N8/dT0;%%%%
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (%4.2f W/m2)',s,b); title(s,'FontSize',fsize);
subplot(row,col,4); s='(d) AM4.0-PW-SICA';
a=(d.I5.av-d.c5.av)/dT0; b=d.N9/dT0;%%%%
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (%4.2f W/m2)',s,b); title(s,'FontSize',fsize);
subplot(row,col,5); s='(e) AM4.0-PW-VEGA';
a=(d.V5.av-d.c5.av)/dT0; b=d.Nx/dT0;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (%4.2f W/m2)',s,b); title(s,'FontSize',fsize);
subplot(row,col,6); s='(f) AM4.0-PW-Uniform-SSTA';
a=(d.P5.av-d.c5.av)/dt.Ty; b=d.Ny/dt.Ty;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf('%s (%4.2f W/m2)',s,b); title(s,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5.S2: Zonal mean net TOA radiative feedback%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetTOA_feedback_zm'; xy=[-90 90 -3 2]; 
t1=101; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2); opt=0;
a=CM4.c0.toa.netrad.all (1:100,:,:,:); c1=gmean(a,aa,opt);
a=CM4.w0.toa.netrad.all (t1:t2,:,:,:); w1=gmean(a,aa,opt);
a=ESM.c0.toa.netrad.all (1:100,:,:,:); c2=gmean(a,aa,opt);
a=ESM.w0.toa.netrad.all (t1:t2,:,:,:); w2=gmean(a,aa,opt);
a=SP1.c0.toa.netrad.all (1:100,:,:,:); c3=gmean(a,aa,opt);
a=SP1.w0.toa.netrad.all (t1:t2,:,:,:); w3=gmean(a,aa,opt);
a=SP4.c0.toa.netrad.all (1:100,:,:,:); c4=gmean(a,aa,opt);
a=SP4.w0.toa.netrad.all (t1:t2,:,:,:); w4=gmean(a,aa,opt);
a=a40.c0.toa.netrad.all (:    ,:,:,:); c5=gmean(a,aa,opt);
a=a40.w0.toa.netrad.all (:    ,:,:,:); w5=gmean(a,aa,opt);
a=a40.W0.toa.netrad.all (:    ,:,:,:); W5=gmean(a,aa,opt);
a=a40.G0.toa.netrad.all (:    ,:,:,:); G5=gmean(a,aa,opt);
a=a40.S0.toa.netrad.all (:    ,:,:,:); S5=gmean(a,aa,opt);
a=a40.W1.toa.netrad.all (:    ,:,:,:); U5=gmean(a,aa,opt);
a=a40.W2.toa.netrad.all (:    ,:,:,:); A5=gmean(a,aa,opt);
a=a40.W3.toa.netrad.all (:    ,:,:,:); B5=gmean(a,aa,opt);
%a=a41.c0.toa.netrad.all (:   ,:,:,:); c6=gmean(a,aa,opt);
%a=a41.w0.toa.netrad.all (:   ,:,:,:); w6=gmean(a,aa,opt);
d.X1=(w1.gm-c1.gm); d.X2=(w2.gm-c2.gm); d.X3=(w3.gm-c3.gm); 
d.X4=(w4.gm-c4.gm); d.X5=(w5.gm-c5.gm); d.X6=(W5.gm-c5.gm); 
d.X7=(G5.gm-c5.gm); d.X8=(S5.gm-c5.gm); d.X9=(U5.gm-c5.gm);
d.Xa=(A5.gm-c5.gm); d.Xb=(B5.gm-c5.gm);
d.CO2.av=G5.av-c5.av; d.CO2.gm=d.X7; fav=d.CO2.av; f0=d.X7;
d.CO2.zm=(G5.zm-c5.zm); dg=d.CO2.zm;
pms=[ 0, 0, 700, 600]*1; fsize=10; lw=1;
handle = figure('Position', pms,'visible','on'); 
a=(w1.zm-c1.zm-dg)/d.T1; plot(lat,a,'r','LineWidth',lw); hold on; d.Y1=mean(a.*a0);
a=(w2.zm-c2.zm-dg)/d.T2; plot(lat,a,'k','LineWidth',lw); hold on; d.Y2=mean(a.*a0);
a=(w3.zm-c3.zm-dg)/d.T3; plot(lat,a,'b','LineWidth',lw); hold on; d.Y3=mean(a.*a0);
a=(w4.zm-c4.zm-dg)/d.T4; plot(lat,a,'c','LineWidth',lw); hold on; d.Y4=mean(a.*a0);
a=(w5.zm-c5.zm-dg)/d.T5; plot(lat,a,'m','LineWidth',lw); hold on; d.Y5=mean(a.*a0);
s1=sprintf('CM4.0    (%4.2f)', (d.X1-f0)/d.T1);
s2=sprintf('ESM4     (%4.2f)', (d.X2-f0)/d.T2);
s3=sprintf('SPEAR    (%4.2f)', (d.X3-f0)/d.T3);
s4=sprintf('SPEAR-SV (%4.2f)', (d.X4-f0)/d.T4);
s5=sprintf('AM4.0-PW (%4.2f)', (d.X5-f0)/d.T5);
legend(s1,s2,s3,s4,s5,'location','northwest'); grid on; %axis(xy);
yl='TOA net radiative feedback (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude'; xlabel(xl,'FontSize',fsize); mylabel(xy,1,'(a)',12);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5.S3: Zonal mean net TOA radiative feedback%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetTOA_feedback_zm_diff'; xy=[-90 90 -2 0.8]; 
t1=101; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2); opt=0;
a=CM4.c0.toa.netrad.all (1:100,:,:,:); c1=gmean(a,aa,opt);
a=CM4.w0.toa.netrad.all (t1:t2,:,:,:); w1=gmean(a,aa,opt);
a=ESM.c0.toa.netrad.all (1:100,:,:,:); c2=gmean(a,aa,opt);
a=ESM.w0.toa.netrad.all (t1:t2,:,:,:); w2=gmean(a,aa,opt);
a=SP1.c0.toa.netrad.all (1:100,:,:,:); c3=gmean(a,aa,opt);
a=SP1.w0.toa.netrad.all (t1:t2,:,:,:); w3=gmean(a,aa,opt);
a=SP4.c0.toa.netrad.all (1:100,:,:,:); c4=gmean(a,aa,opt);
a=SP4.w0.toa.netrad.all (t1:t2,:,:,:); w4=gmean(a,aa,opt);
a=a40.c0.toa.netrad.all (:    ,:,:,:); c5=gmean(a,aa,opt);
a=a40.w0.toa.netrad.all (:    ,:,:,:); w5=gmean(a,aa,opt);
a=a40.W0.toa.netrad.all (:    ,:,:,:); W5=gmean(a,aa,opt);
a=a40.G0.toa.netrad.all (:    ,:,:,:); G5=gmean(a,aa,opt);
a=a40.S0.toa.netrad.all (:    ,:,:,:); S5=gmean(a,aa,opt);
a=a40.W1.toa.netrad.all (:    ,:,:,:); U5=gmean(a,aa,opt);
a=a40.W2.toa.netrad.all (:    ,:,:,:); A5=gmean(a,aa,opt);
a=a40.W3.toa.netrad.all (:    ,:,:,:); B5=gmean(a,aa,opt);
%a=a41.c0.toa.netrad.all (:   ,:,:,:); c6=gmean(a,aa,opt);
%a=a41.w0.toa.netrad.all (:   ,:,:,:); w6=gmean(a,aa,opt);
d.X1=(w1.gm-c1.gm); d.X2=(w2.gm-c2.gm); d.X3=(w3.gm-c3.gm); 
d.X4=(w4.gm-c4.gm); d.X5=(w5.gm-c5.gm); d.X6=(W5.gm-c5.gm); 
d.X7=(G5.gm-c5.gm); d.X8=(S5.gm-c5.gm); d.X9=(U5.gm-c5.gm);
d.Xa=(A5.gm-c5.gm); d.Xb=(B5.gm-c5.gm);
d.CO2.av=G5.av-c5.av; d.CO2.gm=d.X7; fav=d.CO2.av; f0=d.X7;
d.CO2.zm=(G5.zm-c5.zm); dg=d.CO2.zm;
pms=[ 0, 0, 700, 600]*1; fsize=10; lw=1;
handle = figure('Position', pms,'visible','on'); 
y1=(w1.zm-c1.zm-dg)/d.T1; 
y2=(w2.zm-c2.zm-dg)/d.T2; 
y3=(w3.zm-c3.zm-dg)/d.T3; 
y4=(w4.zm-c4.zm-dg)/d.T4; 
y5=(w5.zm-c5.zm-dg)/d.T5; 
a=y2-y1; plot(lat,a,'k','LineWidth',lw); hold on; d.Y1=mean(a.*a0);
a=y3-y1; plot(lat,a,'b','LineWidth',lw); hold on; d.Y2=mean(a.*a0);
a=y4-y1; plot(lat,a,'c','LineWidth',lw); hold on; d.Y3=mean(a.*a0);
a=y5-y1; plot(lat,a,'m','LineWidth',lw); hold on; d.Y4=mean(a.*a0);
s1=sprintf('ESM4 minus CM4.0     (%4.2f)', d.Y1);
s2=sprintf('SPEAR minus CM4.0    (%4.2f)', d.Y2);
s3=sprintf('SPEAR-SV minus CM4.0 (%4.2f)', d.Y3);
s4=sprintf('AM4.0-PW minus CM4.0 (%4.2f)', d.Y4);
legend(s1,s2,s3,s4,'location','northwest'); grid on; %axis(xy);
yl='TOA net radiative feedback (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude'; xlabel(xl,'FontSize',fsize); mylabel(xy,1,'(b)',12);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5.S4: Zonal mean net TOA radiative feedback
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetTOA_feedback_zm_AM4'; xy=[-90 90 -3 2]; 
t1=101; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2); opt=0;
a=CM4.c0.toa.netrad.all (1:100,:,:,:); c1=gmean(a,aa,opt);
a=CM4.w0.toa.netrad.all (t1:t2,:,:,:); w1=gmean(a,aa,opt);
a=ESM.c0.toa.netrad.all (1:100,:,:,:); c2=gmean(a,aa,opt);
a=ESM.w0.toa.netrad.all (t1:t2,:,:,:); w2=gmean(a,aa,opt);
a=SP1.c0.toa.netrad.all (1:100,:,:,:); c3=gmean(a,aa,opt);
a=SP1.w0.toa.netrad.all (t1:t2,:,:,:); w3=gmean(a,aa,opt);
a=SP4.c0.toa.netrad.all (1:100,:,:,:); c4=gmean(a,aa,opt);
a=SP4.w0.toa.netrad.all (t1:t2,:,:,:); w4=gmean(a,aa,opt);
a=a40.c0.toa.netrad.all (:    ,:,:,:); c5=gmean(a,aa,opt);
a=a40.w0.toa.netrad.all (:    ,:,:,:); w5=gmean(a,aa,opt);
a=a40.W0.toa.netrad.all (:    ,:,:,:); W5=gmean(a,aa,opt);
a=a40.G0.toa.netrad.all (:    ,:,:,:); G5=gmean(a,aa,opt);
a=a40.S0.toa.netrad.all (:    ,:,:,:); S5=gmean(a,aa,opt);
a=a40.W1.toa.netrad.all (:    ,:,:,:); U5=gmean(a,aa,opt);
a=a40.W2.toa.netrad.all (:    ,:,:,:); A5=gmean(a,aa,opt);
a=a40.W3.toa.netrad.all (:    ,:,:,:); B5=gmean(a,aa,opt);
%a=a41.c0.toa.netrad.all (:   ,:,:,:); c6=gmean(a,aa,opt);
%a=a41.w0.toa.netrad.all (:   ,:,:,:); w6=gmean(a,aa,opt);
d.X1=(w1.gm-c1.gm); d.X2=(w2.gm-c2.gm); d.X3=(w3.gm-c3.gm); 
d.X4=(w4.gm-c4.gm); d.X5=(w5.gm-c5.gm); d.X6=(W5.gm-c5.gm); 
d.X7=(G5.gm-c5.gm); d.X8=(S5.gm-c5.gm); d.X9=(U5.gm-c5.gm);
d.Xa=(A5.gm-c5.gm); d.Xb=(B5.gm-c5.gm);
d.CO2.av=G5.av-c5.av; d.CO2.gm=d.X7; fav=d.CO2.av; f0=d.X7;
d.CO2.zm=(G5.zm-c5.zm); dg=d.CO2.zm;
pms=[ 0, 0, 700, 600]*1; fsize=10; lw=1;
handle = figure('Position', pms,'visible','on');
a=(w1.zm-c1.zm-dg)/d.T1; plot(lat,a,'r','LineWidth',lw); hold on; d.Y1=mean(a.*a0);
a=(w5.zm-c5.zm-dg)/d.T5; plot(lat,a,'m','LineWidth',lw); hold on; d.Y5=mean(a.*a0);
a=(W5.zm-c5.zm)   /d.T6; plot(lat,a,'k','LineWidth',lw); hold on; d.Y6=mean(a.*a0);y1=a;
a=(U5.zm-c5.zm)   /d.T9; plot(lat,a,'b','LineWidth',lw); hold on; d.Y9=mean(a.*a0);y2=a;
a=y1-y2;                 plot(lat,a,'c','LineWidth',lw); hold on; d.Y8=mean(a.*a0);
a=(S5.zm-c5.zm)   /d.T5; plot(lat,a,'g','LineWidth',lw); hold on; d.Y8=mean(a.*a0);
%a=dg;                    plot(lat,a,'g:','LineWidth',lw); hold on; d.X0=mean(a.*a0);
s1=sprintf('CM4.0                    (%4.2f)', (d.X1-f0)/d.T1);
s2=sprintf('AM4.0-PW                 (%4.2f)', (d.X5-f0)/d.T5);
s3=sprintf('AM4.0-PW-SSTA-ICEA-VEG   (%4.2f)', (d.X6   )/d.T6);
s4=sprintf('AM4.0-PW-SSTA-ICEA-noVEG (%4.2f)', (d.X9   )/d.T9);
s5=sprintf('VEG minus noVEG        (%4.2f)', (d.X6/d.T6-d.X9/d.T9));
s6=sprintf('AM4.0-PW-VEG-only        (%4.2f)', (d.X8/d.T6));
legend(s1,s2,s3,s4,s5,s6,'location','northwest'); grid on; axis(xy);
yl='TOA net radiative feedback (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude'; xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig3e: prediction%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='predict_ecs';
pms=[ 0, 0, 1500, 1200]*0.6; fsize=20; lw=2;
handle = figure('Position', pms,'visible','on'); 
x=[4.9 3.7 3.2]; alpha=[d.X2 d.X3 d.X4]; y=4./-alpha
plot(x(1),y(1),'r^','MarkerSize',msize,'LineWidth',2); hold on; 
plot(x(2),y(2),'bs','MarkerSize',msize,'LineWidth',2); hold on; 
plot(x(3),y(3),'kv','MarkerSize',msize,'LineWidth',2); hold on; 
plot([2 6],[2 6],'k--','LineWidth',2); grid on; axis([2 6 2 6]);
legend('CM4','SPEAR','ESM4',2);
xl='actual ECS (K)';    xlabel(xl,'FontSize',fsize);
yl='predicted ECS (K)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig6a: total cloud radiative feedback%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ttcf_zm'; xy=[-90 90 -3.5 1]; t1=101; t2=150; opt=0;
dt=gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getttcf(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; s0='(%4.2f)';
pms=[ 0, 0, 750, 500]*1.1; fsize=10; lw=1; dT0=dt.T7;
handle = figure('Position', pms,'visible','on'); colormap(jet);
y1=(d.W5.zm-d.c5.zm)/dt.T7; b1=d.N7/dT0;   s1='AM4.0-W';
y1=(d.W5.zm-d.c5.zm)/dt.T7; b1=d.N7/dT0;   s1='AM4.0-W';
y2=(d.P5.zm-d.c5.zm)/dt.Ty; b2=d.Ny/dt.Ty; s2='AM4.0-W-uniform-SSTA';
y3=(d.S5.zm-d.c5.zm)/dT0;   b3=d.N8/dT0;   s3='AM4.0-W-SSTA';
y4=(d.I5.zm-d.c5.zm)/dT0;   b5=d.N9/dT0;   s4='AM4.0-W-SICA';
y5=(d.V5.zm-d.c5.zm)/dT0;   b6=d.Nx/dT0;   s5='AM4.0-W-VEGA';
plot(lat,y1,'r','LineWidth',lw); hold on;
plot(lat,y2,'m','LineWidth',lw); hold on;
plot(lat,y3,'k','LineWidth',lw); hold on;
plot(lat,y4,'c','LineWidth',lw); hold on;
plot(lat,y5,'g','LineWidth',lw); hold on;
s1=sprintf(char(strcat(s1,{' '},s0)),b1);
s2=sprintf(char(strcat(s2,{' '},s0)),b2);
s3=sprintf(char(strcat(s3,{' '},s0)),b3);
s4=sprintf(char(strcat(s4,{' '},s0)),b4);
s5=sprintf(char(strcat(s5,{' '},s0)),b5);
legend(s1,s2,s3,s4,s5,'location','south');
xl='latitude'; xlabel(xl,'FontSize',fsize);
yl='change in TOA net cloud radiative effect (W/m2/K)'; 
ylabel(yl,'FontSize',fsize);
xy=[-90 90 -3 1]; mylabel(xy,1,'(a)',12);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig6a: total cloud radiative feedback%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ttcf'; xy=[-90 90 -3.5 1]; t1=101; t2=150; opt=0;
dt=gettref(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getttcf(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; s0='(%4.2f W/m2/K)';
pms=[ 0, 0, 1500, 1200]*0.7; fsize=10; row=3; col=2;
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); s='(a) AM4.0-W-total';
a=(d.W5.av-d.c5.av)/dt.T7; b=d.N7/dt.T7; dT0=dt.T7; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); 
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,2); s='(b) AM4.0-W-uniform-SSTA';
a=(d.P5.av-d.c5.av)/dt.Ty; b=d.Ny/dt.Ty; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); 
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,3); s='(c) AM4.0-W-SSTA';%===========
a=(d.S5.av-d.c5.av)/dT0; b=d.N8/dT0; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,4); s='(d) AM4.0-W-SSTP';
a=(d.P5.av-d.c5.av)/dt.Ty; b=d.Ny/dt.Ty; a=a3-a; b=b3-b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,5); s='(e) AM4.0-W-SICA';%===========
a=(d.I5.av-d.c5.av)/dT0; b=d.N9/dT0; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,6); s='(f) AM4.0-W-VEGA';%===========
a=(d.V5.av-d.c5.av)/dT0; b=d.Nx/dT0; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig6b: total clear-sky radiative feedback%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netrad_clr'; xy=[-90 90 -3.5 1]; t1=101; t2=150; opt=0;
dt=gettref      (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
ds=getswnet_clr(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
dl=getlwnet_clr(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; s0='(%4.2f W/m2/K)';
pms=[ 0, 0, 1500, 1200]*0.7; fsize=10; row=3; col=2;
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); s='(a) AM4.0-W-total';
a=((ds.W5.av+dl.W5.av)-(ds.c5.av+dl.c5.av))/dt.T7; 
b=(ds.N7+dl.N7)/dt.T7; dT0=dt.T7; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); 
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,2); s='(b) AM4.0-W-uniform-SSTA';
a=((ds.P5.av+dl.P5.av)-(ds.c5.av+dl.c5.av))/dt.Ty; 
b=(ds.Ny+dl.Ny)/dt.Ty; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); 
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,3); s='(c) AM4.0-W-SSTA';
a=((ds.S5.av+dl.S5.av)-(ds.c5.av+dl.c5.av))/dT0; 
b=(ds.N8+dl.N8)/dT0; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,4); s='(d) AM4.0-W-SSTP';
a=((ds.P5.av+dl.P5.av)-(ds.c5.av+dl.c5.av))/dt.Ty; 
b=(ds.Ny+dl.Ny)/dt.Ty; a=a3-a; b=b3-b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,5); s='(e) AM4.0-W-SICA';
a=((ds.I5.av+dl.I5.av)-(ds.c5.av+dl.c5.av))/dT0; 
b=(ds.N9+dl.N9)/dT0; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,6); s='(f) AM4.0-W-VEGA';%===========
a=((ds.V5.av+dl.V5.av)-(ds.c5.av+dl.c5.av))/dT0;
b=(ds.Nx+dl.Nx)/dT0; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig6b: total SW net clear-sky radiative feedback
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet_clr'; xy=[-90 90 -3.5 1]; t1=101; t2=150; opt=0;
dt=gettref     (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getswnet_clr(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; s0='(%4.2f W/m2/K)';
pms=[ 0, 0, 1500, 1200]*0.7; fsize=10; row=3; col=2;
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); s='(a) AM4.0-W-total';
a=(d.W5.av-d.c5.av)/dt.T7; b=d.N7/dt.T7; dT0=dt.T7; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); 
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,2); s='(b) AM4.0-W-uniform-SSTA';
a=(d.P5.av-d.c5.av)/dt.Ty; b=d.Ny/dt.Ty; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); 
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,3); s='(c) AM4.0-W-SSTA';
a=(d.S5.av-d.c5.av)/dT0; b=d.N8/dT0; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,4); s='(d) AM4.0-W-SSTP';
a=(d.P5.av-d.c5.av)/dt.Ty; b=d.Ny/dt.Ty; a=a3-a; b=b3-b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,5); s='(e) AM4.0-W-SICA';
a=(d.I5.av-d.c5.av)/dT0; b=d.N9/dT0; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,6); s='(f) AM4.0-W-VEGA';%===========
a=(d.V5.av-d.c5.av)/dT0; b=d.Nx/dT0; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig6b: total LW net clear-sky radiative feedback
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_clr'; xy=[-90 90 -3.5 1]; t1=101; t2=150; opt=0;
dt=gettref     (CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
d =getlwnet_clr(CM4,ESM,SP1,SP4,a40,a41,t1,t2,opt);
s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
cmin=-4; cmax=4; vbin=[cmin:0.01:cmax]; s0='(%4.2f W/m2/K)';
pms=[ 0, 0, 1500, 1200]*0.7; fsize=10; row=3; col=2;
handle = figure('Position', pms,'visible','on'); colormap(jet);
subplot(row,col,1); s='(a) AM4.0-W-total';
a=(d.W5.av-d.c5.av)/dt.T7; b=d.N7/dt.T7; dT0=dt.T7; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); 
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,2); s='(b) AM4.0-W-uniform-SSTA';
a=(d.P5.av-d.c5.av)/dt.Ty; b=d.Ny/dt.Ty; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color); 
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,3); s='(c) AM4.0-W-SSTA';
a=(d.S5.av-d.c5.av)/dT0; b=d.N8/dT0; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,4); s='(d) AM4.0-W-SSTP';
a=(d.P5.av-d.c5.av)/dt.Ty; b=d.Ny/dt.Ty; a=a3-a; b=b3-b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,5); s='(e) AM4.0-W-SICA';
a=(d.I5.av-d.c5.av)/dT0; b=d.N9/dT0; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
subplot(row,col,6); s='(f) AM4.0-W-VEGA';%===========
a=(d.V5.av-d.c5.av)/dT0; b=d.Nx/dT0; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,color);
s=sprintf(char(strcat(s,{' '},s0)),b); title(s,'FontSize',fsize);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% $$$ a=CM4.c0.toa.ttcf.all (1:100,:,:,:); c1=gmean(a,aa,opt);
% $$$ a=CM4.w0.toa.ttcf.all (t1:t2,:,:,:); w1=gmean(a,aa,opt);
% $$$ a=ESM.c0.toa.ttcf.all (1:100,:,:,:); c2=gmean(a,aa,opt);
% $$$ a=ESM.w0.toa.ttcf.all (t1:t2,:,:,:); w2=gmean(a,aa,opt);
% $$$ a=SP1.c0.toa.ttcf.all (1:100,:,:,:); c3=gmean(a,aa,opt);
% $$$ a=SP1.w0.toa.ttcf.all (t1:t2,:,:,:); w3=gmean(a,aa,opt);
% $$$ a=SP4.c0.toa.ttcf.all (1:100,:,:,:); c4=gmean(a,aa,opt);
% $$$ a=SP4.w0.toa.ttcf.all (t1:t2,:,:,:); w4=gmean(a,aa,opt);
% $$$ a=a40.c0.toa.ttcf.all (:    ,:,:,:); c5=gmean(a,aa,opt);
% $$$ a=a40.w0.toa.ttcf.all (:    ,:,:,:); w5=gmean(a,aa,opt);
% $$$ a=a40.W0.toa.ttcf.all (:    ,:,:,:); W5=gmean(a,aa,opt);
% $$$ a=a40.G0.toa.ttcf.all (:    ,:,:,:); G5=gmean(a,aa,opt);
% $$$ a=a40.S0.toa.ttcf.all (:    ,:,:,:); S5=gmean(a,aa,opt);
% $$$ a=a40.W1.toa.ttcf.all (:    ,:,:,:); U5=gmean(a,aa,opt);
% $$$ a=a40.W2.toa.ttcf.all (:    ,:,:,:); A5=gmean(a,aa,opt);
% $$$ a=a40.W3.toa.ttcf.all (:    ,:,:,:); B5=gmean(a,aa,opt);
% $$$ %a=a41.c0.toa.ttcf.all (:   ,:,:,:); c6=gmean(a,aa,opt);
% $$$ %a=a41.w0.toa.ttcf.all (:   ,:,:,:); w6=gmean(a,aa,opt);
% $$$ d.X1=(w1.gm-c1.gm); d.X2=(w2.gm-c2.gm); d.X3=(w3.gm-c3.gm); 
% $$$ d.X4=(w4.gm-c4.gm); d.X5=(w5.gm-c5.gm); d.X6=(W5.gm-c5.gm); 
% $$$ d.X7=(G5.gm-c5.gm); d.X8=(S5.gm-c5.gm); d.X9=(U5.gm-c5.gm);
% $$$ d.Xa=(A5.gm-c5.gm); d.Xb=(B5.gm-c5.gm);
% $$$ d.CO2.av=G5.av-c5.av; d.CO2.gm=d.X7; fav=d.CO2.av; f0=d.X7;
% $$$ d.CO2.zm=(G5.zm-c5.zm); dg=d.CO2.zm;
pms=[ 0, 0, 700, 600]*1; fsize=10; lw=1;
handle = figure('Position', pms,'visible','on');
a=(w1.zm-c1.zm)/d.T1; plot(lat,a,'r','LineWidth',lw); hold on; d.Y1=mean(a.*a0);
a=(w2.zm-c2.zm)/d.T2; plot(lat,a,'k','LineWidth',lw); hold on; d.Y2=mean(a.*a0);
a=(w3.zm-c3.zm)/d.T3; plot(lat,a,'b','LineWidth',lw); hold on; d.Y3=mean(a.*a0);
a=(w4.zm-c4.zm)/d.T4; plot(lat,a,'c','LineWidth',lw); hold on; d.Y4=mean(a.*a0);
a=(w5.zm-c5.zm)/d.T5; plot(lat,a,'m','LineWidth',lw); hold on; d.Y5=mean(a.*a0);
s1=sprintf('CM4.0    (%4.2f)', (d.X1-f0)/d.T1);
s2=sprintf('ESM4     (%4.2f)', (d.X2-f0)/d.T2);
s3=sprintf('SPEAR    (%4.2f)', (d.X3-f0)/d.T3);
s4=sprintf('SPEAR-SV (%4.2f)', (d.X4-f0)/d.T4);
s5=sprintf('AM4.0-PW (%4.2f)', (d.X5-f0)/d.T5);
legend(s1,s2,s3,s4,s5,'location','south'); grid on; %axis(xy);
yl='change in TOA net cloud radiative effect (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude'; xlabel(xl,'FontSize',fsize); mylabel(xy,1,'(a)',12);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5b: Cloud radiative feedback difference%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ttcf_zm_diff'; xy=[-90 90 -1 1]; 
t1=101; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2); opt=0;
a=CM4.c0.toa.ttcf.all (1:100,:,:,:); c1=gmean(a,aa,opt);
a=CM4.w0.toa.ttcf.all (t1:t2,:,:,:); w1=gmean(a,aa,opt);
a=ESM.c0.toa.ttcf.all (1:100,:,:,:); c2=gmean(a,aa,opt);
a=ESM.w0.toa.ttcf.all (t1:t2,:,:,:); w2=gmean(a,aa,opt);
a=SP1.c0.toa.ttcf.all (1:100,:,:,:); c3=gmean(a,aa,opt);
a=SP1.w0.toa.ttcf.all (t1:t2,:,:,:); w3=gmean(a,aa,opt);
a=SP4.c0.toa.ttcf.all (1:100,:,:,:); c4=gmean(a,aa,opt);
a=SP4.w0.toa.ttcf.all (t1:t2,:,:,:); w4=gmean(a,aa,opt);
a=a40.c0.toa.ttcf.all (:    ,:,:,:); c5=gmean(a,aa,opt);
a=a40.w0.toa.ttcf.all (:    ,:,:,:); w5=gmean(a,aa,opt);
a=a40.W0.toa.ttcf.all (:    ,:,:,:); W5=gmean(a,aa,opt);
a=a40.G0.toa.ttcf.all (:    ,:,:,:); G5=gmean(a,aa,opt);
a=a40.S0.toa.ttcf.all (:    ,:,:,:); S5=gmean(a,aa,opt);
a=a40.W1.toa.ttcf.all (:    ,:,:,:); U5=gmean(a,aa,opt);
a=a40.W2.toa.ttcf.all (:    ,:,:,:); A5=gmean(a,aa,opt);
a=a40.W3.toa.ttcf.all (:    ,:,:,:); B5=gmean(a,aa,opt);
%a=a41.c0.toa.ttcf.all (:   ,:,:,:); c6=gmean(a,aa,opt);
%a=a41.w0.toa.ttcf.all (:   ,:,:,:); w6=gmean(a,aa,opt);
d.X1=(w1.gm-c1.gm); d.X2=(w2.gm-c2.gm); d.X3=(w3.gm-c3.gm); 
d.X4=(w4.gm-c4.gm); d.X5=(w5.gm-c5.gm); d.X6=(W5.gm-c5.gm); 
d.X7=(G5.gm-c5.gm); d.X8=(S5.gm-c5.gm); d.X9=(U5.gm-c5.gm);
d.Xa=(A5.gm-c5.gm); d.Xb=(B5.gm-c5.gm);
d.CO2.av=G5.av-c5.av; d.CO2.gm=d.X7; fav=d.CO2.av; f0=d.X7;
d.CO2.zm=(G5.zm-c5.zm); dg=d.CO2.zm;
pms=[ 0, 0, 700, 600]*1; fsize=10; lw=1;
handle = figure('Position', pms,'visible','on');
y1=(w1.zm-c1.zm-dg)/d.T1; 
y2=(w2.zm-c2.zm-dg)/d.T2; 
y3=(w3.zm-c3.zm-dg)/d.T3; 
y4=(w4.zm-c4.zm-dg)/d.T4; 
y5=(w5.zm-c5.zm-dg)/d.T5; 
a=y2-y1; plot(lat,a,'k','LineWidth',lw); hold on; d.Y1=mean(a.*a0);
a=y3-y1; plot(lat,a,'b','LineWidth',lw); hold on; d.Y2=mean(a.*a0);
a=y4-y1; plot(lat,a,'c','LineWidth',lw); hold on; d.Y3=mean(a.*a0);
a=y5-y1; plot(lat,a,'m','LineWidth',lw); hold on; d.Y4=mean(a.*a0);
s1=sprintf('ESM4 minus CM4.0     (%4.2f)', d.Y1);
s2=sprintf('SPEAR minus CM4.0    (%4.2f)', d.Y2);
s3=sprintf('SPEAR-SV minus CM4.0 (%4.2f)', d.Y3);
s4=sprintf('AM4.0-PW minus CM4.0 (%4.2f)', d.Y4);
legend(s1,s2,s3,s4,'location','northeast'); grid on; %axis(xy);
yl='change in TOA net cloud radiative effect (W/m2/K)';
ylabel(yl,'FontSize',fsize);
xl='latitude'; xlabel(xl,'FontSize',fsize); mylabel(xy,2,'(b)',12);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5a: Clear-sky radiative feedback%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet_clr_zm_diff'; xy=[-90 90 -0.5 7]; 
t1=101; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2); opt=0;
a=CM4.c0.toa.swnet_clr.all (1:100,:,:,:);   c1=gmean(a,aa,opt);
a=CM4.w0.toa.swnet_clr.all (t1:t2  ,:,:,:); w1=gmean(a,aa,opt);
a=ESM.c0.toa.swnet_clr.all(1:100  ,:,:,:); c2=gmean(a,aa,opt);
a=ESM.w0.toa.swnet_clr.all(t1:t2  ,:,:,:); w2=gmean(a,aa,opt);
a=SP1.c0.toa.swnet_clr.all (1:100 ,:,:,:);  c3=gmean(a,aa,opt);
a=SP1.w0.toa.swnet_clr.all (t1:t2  ,:,:,:); w3=gmean(a,aa,opt);
a=SP4.c0.toa.swnet_clr.all (1:100 ,:,:,:);  c4=gmean(a,aa,opt);
a=SP4.w0.toa.swnet_clr.all (t1:t2  ,:,:,:); w4=gmean(a,aa,opt);
a=a40.c0.toa.swnet_clr.all (:      ,:,:,:); c5=gmean(a,aa,opt);
a=a40.w0.toa.swnet_clr.all (:      ,:,:,:); w5=gmean(a,aa,opt);
a=a40.W0.toa.swnet_clr.all (:      ,:,:,:); W5=gmean(a,aa,opt);
a=a40.G0.toa.swnet_clr.all (:      ,:,:,:); G5=gmean(a,aa,opt);
a=a40.S0.toa.swnet_clr.all (:      ,:,:,:); S5=gmean(a,aa,opt);
a=a40.W1.toa.swnet_clr.all (:      ,:,:,:); U5=gmean(a,aa,opt);
%a=a41.c0.toa.swnet_clr.all (:      ,:,:,:); c6=gmean(a,aa,opt);
%a=a41.w0.toa.swnet_clr.all (:      ,:,:,:); w6=gmean(a,aa,opt);
d.X1=(w1.gm-c1.gm); d.X2=(w2.gm-c2.gm); d.X3=(w3.gm-c3.gm); 
d.X4=(w4.gm-c4.gm); d.X5=(w5.gm-c5.gm); d.X6=(W5.gm-c5.gm); 
d.X7=(G5.gm-c5.gm); d.X8=(S5.gm-c5.gm); d.X9=(U5.gm-c5.gm);
d.Xa=(A5.gm-c5.gm); d.Xb=(B5.gm-c5.gm);
d.CO2.av=G5.av-c5.av; d.CO2.gm=d.X7; fav=d.CO2.av; f0=d.X7;
d.CO2.zm=(G5.zm-c5.zm); dg=d.CO2.zm;
pms=[ 0, 0, 700, 600]*1; fsize=10; lw=1;
handle = figure('Position', pms,'visible','on');
y1=(w1.zm-c1.zm)/d.T1; 
y2=(w2.zm-c2.zm)/d.T2; 
y3=(w3.zm-c3.zm)/d.T3; 
y4=(w4.zm-c4.zm)/d.T4; 
y5=(w5.zm-c5.zm)/d.T5; 
a=y2-y1; plot(lat,a,'k','LineWidth',lw); hold on; d.Y1=mean(a.*a0);
a=y3-y1; plot(lat,a,'b','LineWidth',lw); hold on; d.Y2=mean(a.*a0);
a=y4-y1; plot(lat,a,'c','LineWidth',lw); hold on; d.Y3=mean(a.*a0);
a=y5-y1; plot(lat,a,'m','LineWidth',lw); hold on; d.Y4=mean(a.*a0);
s1=sprintf('ESM4 minus CM4.0     (%4.2f)', d.Y1);
s2=sprintf('SPEAR minus CM4.0    (%4.2f)', d.Y2);
s3=sprintf('SPEAR-SV minus CM4.0 (%4.2f)', d.Y3);
s4=sprintf('AM4.0-PW minus CM4.0 (%4.2f)', d.Y4);
legend(s1,s2,s3,s4,'location','south'); grid on; %axis(xy);
yl='change in TOA net cloud radiative effect (W/m2/K)';
ylabel(yl,'FontSize',fsize);
xl='latitude'; xlabel(xl,'FontSize',fsize); mylabel(xy,2,'(b)',12);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig5b: Clear-sky radiative feedback%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet_clr_zm'; xy=[-90 90 -0.5 7]; 
t1=101; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2); opt=0;
a=CM4.c0.toa.swnet_clr.all (1:100,:,:,:);   c1=gmean(a,aa,opt);
a=CM4.w0.toa.swnet_clr.all (t1:t2  ,:,:,:); w1=gmean(a,aa,opt);
a=ESM.c0.toa.swnet_clr.all(1:100  ,:,:,:); c2=gmean(a,aa,opt);
a=ESM.w0.toa.swnet_clr.all(t1:t2  ,:,:,:); w2=gmean(a,aa,opt);
a=SP1.c0.toa.swnet_clr.all (1:100 ,:,:,:);  c3=gmean(a,aa,opt);
a=SP1.w0.toa.swnet_clr.all (t1:t2  ,:,:,:); w3=gmean(a,aa,opt);
a=SP4.c0.toa.swnet_clr.all (1:100 ,:,:,:);  c4=gmean(a,aa,opt);
a=SP4.w0.toa.swnet_clr.all (t1:t2  ,:,:,:); w4=gmean(a,aa,opt);
a=a40.c0.toa.swnet_clr.all (:      ,:,:,:); c5=gmean(a,aa,opt);
a=a40.w0.toa.swnet_clr.all (:      ,:,:,:); w5=gmean(a,aa,opt);
a=a40.W0.toa.swnet_clr.all (:      ,:,:,:); W5=gmean(a,aa,opt);
a=a40.G0.toa.swnet_clr.all (:      ,:,:,:); G5=gmean(a,aa,opt);
a=a40.S0.toa.swnet_clr.all (:      ,:,:,:); S5=gmean(a,aa,opt);
a=a40.W1.toa.swnet_clr.all (:      ,:,:,:); U5=gmean(a,aa,opt);
%a=a41.c0.toa.swnet_clr.all (:      ,:,:,:); c6=gmean(a,aa,opt);
%a=a41.w0.toa.swnet_clr.all (:      ,:,:,:); w6=gmean(a,aa,opt);
d.X1=(w1.gm-c1.gm); d.X2=(w2.gm-c2.gm); d.X3=(w3.gm-c3.gm); 
d.X4=(w4.gm-c4.gm); d.X5=(w5.gm-c5.gm); d.X6=(W5.gm-c5.gm); 
d.X7=(G5.gm-c5.gm); d.X8=(S5.gm-c5.gm); d.X9=(U5.gm-c5.gm);
d.Xa=(A5.gm-c5.gm); d.Xb=(B5.gm-c5.gm);
d.CO2.av=G5.av-c5.av; d.CO2.gm=d.X7; fav=d.CO2.av; f0=d.X7;
d.CO2.zm=(G5.zm-c5.zm); dg=d.CO2.zm;
pms=[ 0, 0, 700, 600]*1; fsize=10; lw=1;
handle = figure('Position', pms,'visible','on');
a=(w1.zm-c1.zm)/d.T1; plot(lat,a,'r','LineWidth',lw); hold on; d.Y1=mean(a.*a0);
a=(w2.zm-c2.zm)/d.T2; plot(lat,a,'k','LineWidth',lw); hold on; d.Y2=mean(a.*a0);
a=(w3.zm-c3.zm)/d.T3; plot(lat,a,'b','LineWidth',lw); hold on; d.Y3=mean(a.*a0);
a=(w4.zm-c4.zm)/d.T4; plot(lat,a,'c','LineWidth',lw); hold on; d.Y4=mean(a.*a0);
a=(w5.zm-c5.zm)/d.T5; plot(lat,a,'m','LineWidth',lw); hold on; d.Y5=mean(a.*a0);
s1=sprintf('CM4.0    (%4.2f)', (d.X1-f0)/d.T1);
s2=sprintf('ESM4     (%4.2f)', (d.X2-f0)/d.T2);
s3=sprintf('SPEAR    (%4.2f)', (d.X3-f0)/d.T3);
s4=sprintf('SPEAR-SV (%4.2f)', (d.X4-f0)/d.T4);
s5=sprintf('AM4.0-PW (%4.2f)', (d.X5-f0)/d.T5);
legend(s1,s2,s3,s4,s5,'location','north'); grid on; %axis(xy);
yl='change in TOA net cloud radiative effect (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude'; xlabel(xl,'FontSize',fsize); mylabel(xy,2,'(a)',12);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 1: global mean surface air temperature %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tref_ann_ts'; s=CM4.c0.s; xy=[1700 2200 285 292];
c1=CM4.c0.sfc.tref.ts.org_ann;  t1=[1700:1700+500-1];
w1=CM4.w0.sfc.tref.ts.org_ann;  x1=[1851:2000];
c2=SP4.c0.sfc.tref.ts.org_ann;  t2=[1800:1800+200-1];
w2=SP4.w0.sfc.tref.ts.org_ann;  x2=[1851:1851+200-1];
c3=ESM.c0.sfc.tref.ts.org_ann; t3=[1850:1850+300-1];
w3=ESM.w0.sfc.tref.ts.org_ann; x3=[1850:1850+300-1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1; fsize=24; lw=2; ;
handle=figure('Position',pms,'visible','on');
plot(t1,c1, 'b-',  'LineWidth',lw); hold on; 
plot(x1,w1, 'r-',  'LineWidth',lw); hold on; 
plot(t2,c2, 'c-',  'LineWidth',lw); hold on; 
plot(x2,w2, 'm-',  'LineWidth',lw); hold on; 
plot(t3,c3, 'k-',  'LineWidth',lw); hold on; 
plot(x3,w3, 'g-',  'LineWidth',lw); hold on; 
legend('CM4-CNTL','CM4-4xCO2','SPEAR-CNTL','SPEAR-4xCO2','ESM4-CNTL','ESM4-4xCO2',2);
xlabel('year','FontSize',fsize); grid on;
ylabel('global mean surface air temperature (K)','FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 2: global mean TOA net radiative flux %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa_ann_ts'; s=CM4.c0.s; xy=[1700 2200 -2 8];
c1=CM4.c0.toa.netrad.ts.org_ann;  t1=[1700:1700+500-1];
w1=CM4.w0.toa.netrad.ts.org_ann;  x1=[1851:2000];
c2=SP4.c0.toa.netrad.ts.org_ann;  t2=[1800:1800+200-1];
w2=SP4.w0.toa.netrad.ts.org_ann;  x2=[1851:1851+200-1];
c3=ESM.c0.toa.netrad.ts.org_ann; t3=[1850:1850+300-1];
w3=ESM.w0.toa.netrad.ts.org_ann; x3=[1850:1850+300-1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1; fsize=24; lw=2; ;
handle=figure('Position',pms,'visible','on');
plot(t1,c1, 'b-',  'LineWidth',lw); hold on; 
plot(x1,w1, 'r-',  'LineWidth',lw); hold on; 
plot(t2,c2, 'c-',  'LineWidth',lw); hold on; 
plot(x2,w2, 'm-',  'LineWidth',lw); hold on; 
plot(t3,c3, 'k-',  'LineWidth',lw); hold on; 
plot(x3,w3, 'g-',  'LineWidth',lw); hold on; 
legend('CM4-CNTL','CM4-4xCO2','SPEAR-CNTL','SPEAR-4xCO2','ESM4-CNTL','ESM4-4xCO2',2);
xlabel('year','FontSize',fsize); grid on;
ylabel('global mean TOA net radiative flux (W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize); axis(xy);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 4: Gregory plot dN vs dTs for ECS using annual mean
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='greg_netradtoa_ts_ann';%ann_stat contain 5-year annual mean
c1=CM4.c0.sfc.tref.ts.org_ann;    c1_avg=mean(c1(150:250));%CM4-CNTL:150-250yr
w1=CM4.w0.sfc.tref.ts.org_ann;    dT1=w1(1:150)-c1_avg;   %CM4-4xCO2:1-150yr
c2=SP4.c0.sfc.tref.ts.org_ann;    c2_avg=mean(c2(50:150));%SP4-CNTL:50-150yr
w2=SP4.w0.sfc.tref.ts.org_ann;    dT2=w2(1:150)-c2_avg;   %SP4-4xCO2:1-150yr
c3=ESM.c0.sfc.tref.ts.org_ann;   c3_avg=mean(c3(1:100)); %ESM4-CNTL:1-100yr
w3=ESM.w0.sfc.tref.ts.org_ann;   dT3=w3(1:150)-c3_avg;   %ESM4-4xCO2:1-150
C1=CM4.c0.toa.netrad.ts.org_ann;  C1_avg=mean(C1(150:250));
W1=CM4.w0.toa.netrad.ts.org_ann;  dN1=W1(1:150)-C1_avg;
C2=SP4.c0.toa.netrad.ts.org_ann;  C2_avg=mean(C2(50:150));
W2=SP4.w0.toa.netrad.ts.org_ann;  dN2=W2(1:150)-C2_avg;
C3=ESM.c0.toa.netrad.ts.org_ann; C3_avg=mean(C3(1:100));
W3=ESM.w0.toa.netrad.ts.org_ann; dN3=W3(1:150)-C3_avg;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t1=1;  t2=150; CM4.g =getcorrslop(dT1(t1:t2),dN1(t1:t2));
t1=1;  t2=150; SP4.g =getcorrslop(dT2(t1:t2),dN2(t1:t2));
t1=1;  t2=150; ESM.g=getcorrslop(dT3(t1:t2),dN3(t1:t2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 900, 700]*1; fsize=24; msize=16; lw=2;ls1='-';ls2='--';
handle=figure('Position',pms,'visible','on');
plot(dT1,dN1, 'r.','MarkerSize',msize); hold on; 
plot(dT2,dN2, 'b.','MarkerSize',msize); hold on; 
plot(dT3,dN3, 'k.','MarkerSize',msize); hold on; 
v=CM4.g;  plot(v.xb,v.yb,'r-', 'LineWidth',lw,'LineStyle',ls1);
v=SP4.g;  plot(v.xb,v.yb,'b-', 'LineWidth',lw,'LineStyle',ls1);
v=ESM.g; plot(v.xb,v.yb,'k-', 'LineWidth',lw,'LineStyle',ls1);
plot([0 20],[0 0],'k-');
legend('CM4 (1-150yr)','SPEAR (1-150yr)','ESM4 (1-150yr)',1);
xlabel('global surface air temperature anomaly (K)','FontSize',fsize); 
ylabel('TOA net radiative flux anomaly (W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([0 10 0 8.5]);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 4.5: dTs and dN 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_dnetradtoa_ts';%ann_stat contain 5-year annual mean
c1=CM4.c0.sfc.tref.ts.org_ann;    c1_avg=mean(c1(150:250));%CM4-CNTL:150-250yr
w1=CM4.w0.sfc.tref.ts.org_ann;    dT1=w1(1:150)-c1_avg;   %CM4-4xCO2:1-150yr
c2=SP4.c0.sfc.tref.ts.org_ann;    c2_avg=mean(c2(50:150));%SP4-CNTL:50-150yr
w2=SP4.w0.sfc.tref.ts.org_ann;    dT2=w2(1:150)-c2_avg;   %SP4-4xCO2:1-150yr
c3=ESM.c0.sfc.tref.ts.org_ann;   c3_avg=mean(c3(1:100)); %ESM4-CNTL:1-100yr
w3=ESM.w0.sfc.tref.ts.org_ann;   dT3=w3(1:150)-c3_avg;   %ESM4-4xCO2:1-150
C1=CM4.c0.toa.netrad.ts.org_ann;  C1_avg=mean(C1(150:250));
W1=CM4.w0.toa.netrad.ts.org_ann;  dN1=W1(1:150)-C1_avg;
C2=SP4.c0.toa.netrad.ts.org_ann;  C2_avg=mean(C2(50:150));
W2=SP4.w0.toa.netrad.ts.org_ann;  dN2=W2(1:150)-C2_avg;
C3=ESM.c0.toa.netrad.ts.org_ann; C3_avg=mean(C3(1:100));
W3=ESM.w0.toa.netrad.ts.org_ann; dN3=W3(1:150)-C3_avg;
C1s=CM4.c0.sfc.netflx.ts.org_ann;  C1s_avg=mean(C1s(150:250));
W1s=CM4.w0.sfc.netflx.ts.org_ann;  dN1s=W1s(1:150)-C1s_avg;
C2s=SP4.c0.sfc.netflx.ts.org_ann;  C2s_avg=mean(C2s(50:150));
W2s=SP4.w0.sfc.netflx.ts.org_ann;  dN2s=W2s(1:150)-C2s_avg;
C3s=ESM.c0.sfc.netflx.ts.org_ann; C3s_avg=mean(C3s(1:100));
W3s=ESM.w0.sfc.netflx.ts.org_ann; dN3s=W3s(1:150)-C3s_avg;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure; plot(dN1s-dN1,'r'); hold on; plot(dN2s-dN2,'b'); plot(dN3s-dN3,'k');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t1=1;  t2=150; CM4.g =getcorrslop(dT1(t1:t2),dN1(t1:t2));
t1=1;  t2=150; SP4.g =getcorrslop(dT2(t1:t2),dN2(t1:t2));
t1=1;  t2=150; ESM.g=getcorrslop(dT3(t1:t2),dN3(t1:t2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1; fsize=24; msize=16; lw=3;
handle=figure('Position',pms,'visible','on');
ax1=gca;
x=[1:1:150]; line(x,(dN1-CM4.g.F) ./dT1,'Color','r','LineWidth',lw); hold on;
x=[1:1:150]; line(x,(dN2-SP4.g.F) ./dT2,'Color','b','LineWidth',lw); hold on;
x=[1:1:150]; line(x,(dN3-ESM.g.F)./dT3,'Color','k','LineWidth',lw); hold on;
legend('CM4','SPEAR','ESM4',1);grid on;
axis([0 150 1.5 6]); set(gca,'FontSize',fsize);
xl='year';          xlabel(xl,'FontSize',fsize); 
yl='\Delta Ts (K)'; ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
x=[2.5:5:150]; line(x,dN1,'Color','r','LineWidth',lw); hold on;
x=[2.5:5:200]; line(x,dN2,'Color','b','LineWidth',lw); hold on;
x=[2.5:5:300]; line(x,dN3,'Color','k','LineWidth',lw); hold on;
x=[2.5:5:150]; line(x,dN1s,'Color','r','LineWidth',lw/3); hold on;
x=[2.5:5:200]; line(x,dN2s,'Color','b','LineWidth',lw/3); hold on;
x=[2.5:5:300]; line(x,dN3s,'Color','k','LineWidth',lw/3); hold on;
%legend('CM4 (1-50-150yr)','SPEAR (1-50-200yr)','ESM4 (1-50-300yr)',1);
yl='\Delta NETRADTOA (W/m2)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); axis([0 300 0.5 5.5]);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 5: surface air temperature map%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_map_org_150'; t1=130; t2=150; s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
[d c1 w1 g1 c2 w2 c3 w3 c4 w4 c5 w5]=get_tref(am4,CM4,SP4,ESM4,a41,aa,t1,t2);
cmin=0; cmax=15; vbin=[cmin:0.2:cmax]; d1=-6;d2=6; vbin1=[d1:0.1:d2];
pms=[ 0, 0, 750, 1200]*1; fsize=16; row=3; col=1;
handle = figure('Position', pms,'visible','on'); 
subplot(row,col,1); a=w2-c2;
contourf(lon,lat,a,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
s=sprintf('(a) CM4 TAS; 4xCO2 - CNTL = %5.2f K',d.T2); title(s,'FontSize',fsize);
subplot(row,col,2); a=w3-c3;
contourf(lon,lat,a,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
s=sprintf('(b) SPEAR TAS; 4xCO2 - CNTL = %5.2f K',d.T3); title(s,'FontSize',fsize);
subplot(row,col,3); a=w4-c4;
contourf(lon,lat,a,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
s=sprintf('(c) ESM4 TAS; 4xCO2 - CNTL = %5.2f K',d.T4); title(s,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 5: surface air temperature map%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_map_dif_150'; t1=130; t2=150; s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
[d c1 w1 g1 c2 w2 c3 w3 c4 w4 c5 w5]=get_tref(am4,CM4,SP4,ESM4,a41,aa,t1,t2);
cmin=0; cmax=15; vbin=[cmin:0.2:cmax]; d1=-6;d2=6; vbin1=[d1:0.1:d2];
pms=[ 0, 0, 750, 800]*1; fsize=16; row=2; col=1;
handle = figure('Position', pms,'visible','on'); 
subplot(row,col,1); a=(w3-c3)-(w2-c2); b=(wav3-cav3)-(wav2-cav2);
contourf(lon,lat,a,vbin1); hold on; shading flat; colorbar; caxis([d1 d2]/2);
contour(lon,lat,lm,1,'r'); %rectangle('Position',[260 -30 20 30]); %rectangle('Position',[150 -15 20 30]); 
s=sprintf('SPEAR minus CM4; global mean = %5.2f K',d.T3-d.T2); title(s,'FontSize',fsize);
subplot(row,col,2); a=(w4-c4)-(w2-c2); b=(wav4-cav4)-(wav2-cav2);
contourf(lon,lat,a,vbin1); hold on; shading flat; colorbar; caxis([d1 d2]/2);
contour(lon,lat,lm,1,'r'); %rectangle('Position',[260 -30 20 30]); %rectangle('Position',[150 -15 20 30]); 
s=sprintf('ESM4 minus CM4; global mean = %5.2f K',d.T4-d.T2); title(s,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 5: surface air temperature map%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_map_rel_dif_150'; t1=130; t2=150; s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
[d c1 w1 g1 c2 w2 c3 w3 c4 w4 c5 w5]=get_tref(am4,CM4,SP4,ESM4,a41,aa,t1,t2);
d1=-0.5;d2=0.5; vbin=[d1:0.01:d2];
pms=[ 0, 0, 750, 800]*1; fsize=16; row=2; col=1;
handle = figure('Position', pms,'visible','on'); 
subplot(row,col,1); a=(w3-c3)/d.T3-(w2-c2)/d.T2; b=mean(mean(a.*aa));
contourf(lon,lat,a,vbin); hold on; shading flat; colorbar; caxis([d1 d2]/2);
contour(lon,lat,lm,1,'r'); %rectangle('Position',[260 -30 20 30]); %rectangle('Position',[150 -15 20 30]); 
[C,h]=contour(lon,lat,c3,[298:1:300]); clabel(C,h);
s=sprintf('SPEAR minus CM4 (relative); global mean = %5.2f K',b); title(s,'FontSize',fsize);
subplot(row,col,2); a=(w4-c4)/d.T4-(w2-c2)/d.T2; b=mean(mean(a.*aa));
contourf(lon,lat,a,vbin); hold on; shading flat; colorbar; caxis([d1 d2]/2);
contour(lon,lat,lm,1,'r'); %rectangle('Position',[260 -30 20 30]); %rectangle('Position',[150 -15 20 30]);
[C,h]=contour(lon,lat,c3,[298:1:300]); clabel(C,h);
s=sprintf('ESM4 minus CM4 (relative); global mean = %5.2f K',b); title(s,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 5: PDF of warming pattern %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_pdf_dif_150'; s=CM4.c0.s; lat=s.lat; lon=s.lon; r.lm=s.lm0;r.aa=s.aa;
r.latlon=[0 360 -30 30];
lat1=r.latlon(3); lat2=r.latlon(4); lon1=r.latlon(1); lon2=r.latlon(2);
r.ys=min(find(lat(:)>=lat1)); r.ye=max(find(lat(:)<= lat2));
r.xs=min(find(lon(:)>=lon1)); r.xe=max(find(lon(:)<= lon2));
a=am4.c0.sfc.tref.all (:      ,:,:,:); c1=squeeze(mean(a,1));
a=am4.w0.sfc.tref.all (:      ,:,:,:); w1=squeeze(mean(a,1));dT1=get_trop_stat(c1,w1,r);
a=am4.g0.sfc.tref.all (:      ,:,:,:); g1=squeeze(mean(a,1));
a=CM4.c0.sfc.tref.all (151:250 ,:,:,:);c2=squeeze(mean(a,1));
a=CM4.w0.sfc.tref.all (130:150,:,:,:); w2=squeeze(mean(a,1));dT2=get_trop_stat(c2,w2,r);
a=SP4.c0.sfc.tref.all (51:150 ,:,:,:); c3=squeeze(mean(a,1));
a=SP4.w0.sfc.tref.all (130:150,:,:,:); w3=squeeze(mean(a,1));dT3=get_trop_stat(c3,w3,r);
a=ESM.c0.sfc.tref.all(1:100  ,:,:,:); c4=squeeze(mean(a,1));
a=ESM.w0.sfc.tref.all(130:150,:,:,:); w4=squeeze(mean(a,1));dT4=get_trop_stat(c4,w4,r);
d.T0=(gav1-cav1); d.T1=(wav1-cav1); d.T2=(wav2-cav2); d.T3=(wav3-cav3); d.T4=(wav4-cav4);
lat=o.lat; lon=o.lon; cmin=0; cmax=15; vbin=[cmin:0.2:cmax]; d1=-6;d2=6; vbin1=[d1:0.1:d2];
pms=[ 0, 0, 750, 800]*1; fsize=16; row=2; col=1;
handle = figure('Position', pms,'visible','on'); 
subplot(row,col,1); a=(w3-c3)-(w2-c2); b=(wav3-cav3)-(wav2-cav2);
contourf(lon,lat,a,vbin1); hold on; shading flat; colorbar; caxis([d1 d2]/2);
s=sprintf('SPEAR minus CM4; global mean = %5.2f K',d.T3-d.T2); title(s,'FontSize',fsize);
subplot(row,col,2); a=(w4-c4)-(w2-c2); b=(wav4-cav4)-(wav2-cav2);
contourf(lon,lat,a,vbin1); hold on; shading flat; colorbar; caxis([d1 d2]/2);
s=sprintf('ESM4 minus CM4; global mean = %5.2f K',d.T4-d.T2); title(s,'FontSize',fsize);
%subplot(row,col,1); a=w1-c1;
%contourf(lon,lat,a,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);%caxis([1 4]);
%s=sprintf('(a) AM4 TAS; P2K - CNTL = %5.2f K',d.T1); title(s,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 5: TOA net radiation map%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetradtoa_dTs_map_150'; t1=130; t2=150; s=CM4.c0.s; lat=s.lat; lon=s.lon; lm=s.lm0; aa=s.aa;
a=am4.c0.toa.netrad.all (:      ,:,:,:); c1=squeeze(mean(mean(a,1),2));cav1=mean(mean(c1.*aa,1));
a=am4.w0.toa.netrad.all (:      ,:,:,:); w1=squeeze(mean(mean(a,1),2));wav1=mean(mean(w1.*aa,1));
a=am4.g0.toa.netrad.all (:      ,:,:,:); g1=squeeze(mean(mean(a,1),2));gav1=mean(mean(g1.*aa,1));
a=CM4.c0.toa.netrad.all (151:250,:,:,:); c2=squeeze(mean(mean(a,1),2));cav2=mean(mean(c2.*aa,1));
a=CM4.w0.toa.netrad.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(a,1),2));wav2=mean(mean(w2.*aa,1));
a=SP4.c0.toa.netrad.all (51:150 ,:,:,:); c3=squeeze(mean(mean(a,1),2));cav3=mean(mean(c3.*aa,1));
a=SP4.w0.toa.netrad.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(a,1),2));wav3=mean(mean(w3.*aa,1));
a=ESM.c0.toa.netrad.all(1:100  ,:,:,:); c4=squeeze(mean(mean(a,1),2));cav4=mean(mean(c4.*aa,1));
a=ESM.w0.toa.netrad.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(a,1),2));wav4=mean(mean(w4.*aa,1));
a=a41.c0.toa.netrad.all (:      ,:,:,:); c5=squeeze(mean(mean(a,1),2));cav5=mean(mean(c1.*aa,1));
a=a41.w0.toa.netrad.all (:      ,:,:,:); w5=squeeze(mean(mean(a,1),2));wav5=mean(mean(w1.*aa,1));
d.X0=(gav1-cav1); d.X1=(wav1-cav1); d.X2=(wav2-cav2); d.X3=(wav3-cav3); d.X4=(wav4-cav4); d.X5=(wav5-cav5);
cmin=-3; cmax=3; vbin=[cmin:0.03:cmax];
pms=[ 0, 0, 750, 1200]*1; fsize=16; row=3; col=1;
handle = figure('Position', pms,'visible','on'); 
subplot(row,col,1); a=(w2-c2-dg)/d.T2; av=mean(mean(a.*aa));
contourf(lon,lat,a,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'r'); 
s=sprintf('(a) CM4 dNETRAD/dTs = %5.2f W/m2/K',av); title(s,'FontSize',fsize);
subplot(row,col,2); a=(w3-c3-dg)/d.T3; av=mean(mean(a.*aa));
contourf(lon,lat,a,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'r'); 
s=sprintf('(b) SPEAR dNETRAD/dTs = %5.2f W/m2/K',av); title(s,'FontSize',fsize);
subplot(row,col,3); a=(w4-c4-dg)/d.T4; av=mean(mean(a.*aa));
contourf(lon,lat,a,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'r'); 
s=sprintf('(c) ESM4  dNETRAD/dTs = %5.2f W/m2/K',av); title(s,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 750, 800]*1; fsize=16; row=2; col=1; vname='dnetradtoa_dTs_map_AM'
handle = figure('Position', pms,'visible','on'); 
subplot(row,col,1); a=(w1-c1)/d.T1; av=mean(mean(a.*aa));
contourf(lon,lat,a,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'r'); 
s=sprintf('(a) AM4.0 dNETRAD/dTs = %5.2f W/m2/K',av); title(s,'FontSize',fsize);
subplot(row,col,2); a=(w5-c5)/d.T5; av=mean(mean(a.*aa));
contourf(lon,lat,a,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
contour(lon,lat,lm,1,'r'); 
s=sprintf('(b) AM4.1 dNETRAD/dTs = %5.2f W/m2/K',av); title(s,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 5: surface air temperature map%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dnetradtoa_map_dif_150'; v0=CM4.c0; latx=v0.lat; lonx=v0.lon; lm=v0.lm0; aa=v0.s.aa;
k=1; ss={'ANN','MAM','JJA','SON','DJF'};
a=am4.c0.toa.netrad.all (:      ,:,:,:); c1=squeeze(mean(mean(a,1),2));cav1=mean(mean(c1.*aa,1));
a=am4.w0.toa.netrad.all (:      ,:,:,:); w1=squeeze(mean(mean(a,1),2));wav1=mean(mean(w1.*aa,1));
a=am4.g0.toa.netrad.all (:      ,:,:,:); g1=squeeze(mean(mean(a,1),2));gav1=mean(mean(g1.*aa,1));
a=CM4.c0.toa.netrad.all (151:250 ,:,:,:);c2=squeeze(mean(mean(a,1),2));cav2=mean(mean(c2.*aa,1));
a=CM4.w0.toa.netrad.all (130:150,:,:,:); w2=squeeze(mean(mean(a,1),2));wav2=mean(mean(w2.*aa,1));
a=SP4.c0.toa.netrad.all (51:150 ,:,:,:); c3=squeeze(mean(mean(a,1),2));cav3=mean(mean(c3.*aa,1));
a=SP4.w0.toa.netrad.all (130:150,:,:,:); w3=squeeze(mean(mean(a,1),2));wav3=mean(mean(w3.*aa,1));
a=ESM.c0.toa.netrad.all(1:100  ,:,:,:); c4=squeeze(mean(mean(a,1),2));cav4=mean(mean(c4.*aa,1));
a=ESM.w0.toa.netrad.all(130:150,:,:,:); w4=squeeze(mean(mean(a,1),2));wav4=mean(mean(w4.*aa,1));
d.X0=(gav1-cav1); d.X1=(wav1-cav1); d.X2=(wav2-cav2); d.X3=(wav3-cav3); d.X4=(wav4-cav4);
lat=o.lat; lon=o.lon; cmin=0; cmax=15; vbin=[cmin:0.2:cmax]; d1=-6;d2=6; vbin1=[d1:0.1:d2];
pms=[ 0, 0, 750, 800]*1; fsize=16; row=2; col=1;
handle = figure('Position', pms,'visible','on'); 
subplot(row,col,1); a=(w3-c3)-(w2-c2); b=(wav3-cav3)-(wav2-cav2);
contourf(lon,lat,a,vbin1); hold on; shading flat; colorbar; caxis([d1 d2]);
s=sprintf('SPEAR minus CM4; global mean = %5.2f K',d.X3-d.X2); title(s,'FontSize',fsize);
subplot(row,col,2); a=(w4-c4)-(w2-c2); b=(wav4-cav4)-(wav2-cav2);
contourf(lon,lat,a,vbin1); hold on; shading flat; colorbar; caxis([d1 d2]);
s=sprintf('ESM4 minus CM4; global mean = %5.2f K',d.X4-d.X2); title(s,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 5: surface air temperature map%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_map_org_50'; v0=CM4.c0; latx=v0.lat; lonx=v0.lon; lm=v0.lm0; aa=v0.s.aa;
k=1; ss={'ANN','MAM','JJA','SON','DJF'};
a=am4.c0.sfc.tref.all (:      ,:,:,:); c1=squeeze(mean(mean(a,1),2));cav1=mean(mean(c1.*aa,1));
a=am4.w0.sfc.tref.all (:      ,:,:,:); w1=squeeze(mean(mean(a,1),2));wav1=mean(mean(w1.*aa,1));
a=am4.g0.sfc.tref.all (:      ,:,:,:); g1=squeeze(mean(mean(a,1),2));gav1=mean(mean(g1.*aa,1));
a=CM4.c0.sfc.tref.all (151:250,:,:,:); c2=squeeze(mean(mean(a,1),2));cav2=mean(mean(c2.*aa,1));
a=CM4.w0.sfc.tref.all ( 30:50, :,:,:); w2=squeeze(mean(mean(a,1),2));wav2=mean(mean(w2.*aa,1));
a=SP4.c0.sfc.tref.all (51:150, :,:,:); c3=squeeze(mean(mean(a,1),2));cav3=mean(mean(c3.*aa,1));
a=SP4.w0.sfc.tref.all ( 30:50, :,:,:); w3=squeeze(mean(mean(a,1),2));wav3=mean(mean(w3.*aa,1));
a=ESM.c0.sfc.tref.all( 1:100, :,:,:); c4=squeeze(mean(mean(a,1),2));cav4=mean(mean(c4.*aa,1));
a=ESM.w0.sfc.tref.all( 30:50, :,:,:); w4=squeeze(mean(mean(a,1),2));wav4=mean(mean(w4.*aa,1));
d.T0=(gav1-cav1); d.T1=(wav1-cav1); d.T2=(wav2-cav2); d.T3=(wav3-cav3); d.T4=(wav4-cav4);
lat=o.lat; lon=o.lon; cmin=0; cmax=15; vbin=[cmin:0.2:cmax]; d1=-6;d2=6; vbin1=[d1:0.1:d2];
pms=[ 0, 0, 750, 1200]*1; fsize=16; row=3; col=1;
handle = figure('Position', pms,'visible','on'); 
subplot(row,col,1); a=w2-c2;
contourf(lon,lat,a,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
s=sprintf('(a) CM4 TAS; 4xCO2 - CNTL = %5.2f K',d.T2); title(s,'FontSize',fsize);
subplot(row,col,2); a=w3-c3;
contourf(lon,lat,a,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
s=sprintf('(b) SPEAR TAS; 4xCO2 - CNTL = %5.2f K',d.T3); title(s,'FontSize',fsize);
subplot(row,col,3); a=w4-c4;
contourf(lon,lat,a,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
s=sprintf('(c) ESM4 TAS; 4xCO2 - CNTL = %5.2f K',d.T4); title(s,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 5: surface air temperature map%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_map_dif_50'; v0=CM4.c0; latx=v0.lat; lonx=v0.lon; lm=v0.lm0; aa=v0.s.aa;
k=1; ss={'ANN','MAM','JJA','SON','DJF'};
a=am4.c0.sfc.tref.all (:      ,:,:,:); c1=squeeze(mean(mean(a,1),2));cav1=mean(mean(c1.*aa,1));
a=am4.w0.sfc.tref.all (:      ,:,:,:); w1=squeeze(mean(mean(a,1),2));wav1=mean(mean(w1.*aa,1));
a=am4.g0.sfc.tref.all (:      ,:,:,:); g1=squeeze(mean(mean(a,1),2));gav1=mean(mean(g1.*aa,1));
a=CM4.c0.sfc.tref.all (151:250,:,:,:); c2=squeeze(mean(mean(a,1),2));cav2=mean(mean(c2.*aa,1));
a=CM4.w0.sfc.tref.all ( 30:50, :,:,:); w2=squeeze(mean(mean(a,1),2));wav2=mean(mean(w2.*aa,1));
a=SP4.c0.sfc.tref.all (51:150, :,:,:); c3=squeeze(mean(mean(a,1),2));cav3=mean(mean(c3.*aa,1));
a=SP4.w0.sfc.tref.all ( 30:50, :,:,:); w3=squeeze(mean(mean(a,1),2));wav3=mean(mean(w3.*aa,1));
a=ESM.c0.sfc.tref.all( 1:100, :,:,:); c4=squeeze(mean(mean(a,1),2));cav4=mean(mean(c4.*aa,1));
a=ESM.w0.sfc.tref.all( 30:50, :,:,:); w4=squeeze(mean(mean(a,1),2));wav4=mean(mean(w4.*aa,1));
a=a41.c0.sfc.tref.all (:,      :,:,:); c5=squeeze(mean(mean(a,1),2));cav5=mean(mean(c5.*aa,1));
a=a41.w0.sfc.tref.all (:,      :,:,:); w5=squeeze(mean(mean(a,1),2));wav5=mean(mean(w5.*aa,1));
d.T0=(gav1-cav1); d.T1=(wav1-cav1); d.T2=(wav2-cav2); d.T3=(wav3-cav3); d.T4=(wav4-cav4);d.T5=(wav5-cav5);
lat=o.lat; lon=o.lon; cmin=0; cmax=15; vbin=[cmin:0.2:cmax]; d1=-4;d2=4; vbin1=[d1:0.03:d2];
pms=[ 0, 0, 750, 800]*1; fsize=16; row=2; col=1;
handle = figure('Position', pms,'visible','on'); 
subplot(row,col,1); a=(w3-c3)-(w2-c2); b=(wav3-cav3)-(wav2-cav2);
contourf(lon,lat,a,vbin1); hold on; shading flat; colorbar; caxis([d1/2 d2/2]);
s=sprintf('SPEAR minus CM4; global mean = %5.2f K',d.T3-d.T2); title(s,'FontSize',fsize);
subplot(row,col,2); a=(w4-c4)-(w2-c2); b=(wav4-cav4)-(wav2-cav2);
contourf(lon,lat,a,vbin1); hold on; shading flat; colorbar; caxis([d1/2 d2/2]);
s=sprintf('ESM4 minus CM4; global mean = %5.2f K',d.T4-d.T2); title(s,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 5: latitudional distribution of absolute TAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_abs_zm'; v0=CM4.c0; lat=o.lat; xy=[-90 90 0 17]; 
a=am4.c0.sfc.tref.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.w0.sfc.tref.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.g0.sfc.tref.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.c0.sfc.tref.all (151:250 ,:,:,:);c2=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.w0.sfc.tref.all (130:150,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.c0.sfc.tref.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.w0.sfc.tref.all (130:150,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.c0.sfc.tref.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.w0.sfc.tref.all(130:150,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
a=a41.c0.sfc.tref.all (:      ,:,:,:); c5=squeeze(mean(mean(mean(a,1),2),4));
a=a41.w0.sfc.tref.all (:      ,:,:,:); w5=squeeze(mean(mean(mean(a,1),2),4));
pms=[ 0, 0, 1500, 1200]*0.6; fsize=20; lw=2;
handle = figure('Position', pms,'visible','on'); 
a=(w2-c2); plot(lat,a,'r','LineWidth',lw); hold on;
a=(w3-c3); plot(lat,a,'b','LineWidth',lw); hold on;
a=(w4-c4); plot(lat,a,'k','LineWidth',lw); hold on;
a=(w1-c1); plot(lat,a,'m','LineWidth',lw); hold on;
a=(w5-c5); plot(lat,a,'c','LineWidth',lw); hold on;
a=(g1-c1); plot(lat,a,'g','LineWidth',lw); hold on;
s2=sprintf('CM4 (%4.2fK)',    d.T2);
s3=sprintf('SPEAR (%4.2fK)',  d.T3);
s4=sprintf('ESM4 (%4.2fK)',   d.T4);
s1=sprintf('AM4.0-P2K (%4.2fK)',d.T1);
s5=sprintf('AM4.1-P4K (%4.2fK)',d.T5);
s0=sprintf('AM4-2xCO2 (%4.2fK)',d.T0);
legend(s2,s3,s4,s1,s5,s0,0); grid on; axis(xy);
yl='\Delta Ts (K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';      xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 5: latitudional distribution of TAS normalized by global mean
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_rel_zm'; xy=[-90 90 0.7 2.9]; 
t1=130; t2=150; s=CM4.c0.s; lat=s.lat; lon=s.lon; aa=s.aa; a0=mean(aa,2);
a=am4.c0.sfc.tref.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.w0.sfc.tref.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.g0.sfc.tref.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.c0.sfc.tref.all (151:250,:,:,:); c2=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.w0.sfc.tref.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.c0.sfc.tref.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.w0.sfc.tref.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.c0.sfc.tref.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.w0.sfc.tref.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
a=a41.c0.sfc.tref.all (:      ,:,:,:); c5=squeeze(mean(mean(mean(a,1),2),4));
a=a41.w0.sfc.tref.all (:      ,:,:,:); w5=squeeze(mean(mean(mean(a,1),2),4));
pms=[ 0, 0, 1500, 1200]*0.6; fsize=20; lw=2;
handle = figure('Position', pms,'visible','on'); 
a=(w2-c2)/d.T2; plot(lat,a,'r','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=(w3-c3)/d.T3; plot(lat,a,'b','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=(w4-c4)/d.T4; plot(lat,a,'k','LineWidth',lw); hold on; d.X4=mean(a.*a0);
a=(w1-c1)/d.T1; plot(lat,a,'m','LineWidth',lw); hold on; d.X1=mean(a.*a0);
a=(w5-c5)/d.T5; plot(lat,a,'c','LineWidth',lw); hold on; d.X5=mean(a.*a0);
s2=sprintf('CM4 (%4.2fK)',      d.X2);
s3=sprintf('SPEAR (%4.2fK)',    d.X3);
s4=sprintf('ESM4 (%4.2fK)',     d.X4);
s1=sprintf('AM4.0-P2K (%4.2fK)',d.X1);
s5=sprintf('AM4.1-P4K (%4.2fK)',d.X5);
legend(s2,s3,s4,s1,s5,0); grid on; axis(xy);
yl='\DeltaTs normalized by global mean warming (K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';      xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 5: latitudional distribution of TAS normalized by global mean
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='dtref_rel_zm_yr10'; t1=10; t2=30; v0=CM4.c0; lat=o.lat; xy=[-90 90 0.7 2.9]; 
a=am4.c0.sfc.tref.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.w0.sfc.tref.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.g0.sfc.tref.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.c0.sfc.tref.all (151:250,:,:,:); c2=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.w0.sfc.tref.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.c0.sfc.tref.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.w0.sfc.tref.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.c0.sfc.tref.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.w0.sfc.tref.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
a=a41.c0.sfc.tref.all (:      ,:,:,:); c5=squeeze(mean(mean(mean(a,1),2),4));
a=a41.w0.sfc.tref.all (:      ,:,:,:); w5=squeeze(mean(mean(mean(a,1),2),4));
pms=[ 0, 0, 1500, 1200]*0.6; fsize=20; lw=2;
handle = figure('Position', pms,'visible','on'); 
a=(w2-c2); av=mean(a.*a0); plot(lat,a/av,'r','LineWidth',lw); d.T2=av;hold on;
a=(w3-c3); av=mean(a.*a0); plot(lat,a/av,'b','LineWidth',lw); d.T3=av;
a=(w4-c4); av=mean(a.*a0); plot(lat,a/av,'k','LineWidth',lw); d.T4=av;
a=(w1-c1); av=mean(a.*a0); plot(lat,a/av,'m','LineWidth',lw); d.T1=av;
a=(w5-c5); av=mean(a.*a0); plot(lat,a/av,'c','LineWidth',lw); d.T5=av;
s2=sprintf('CM4 (%4.2fK)',      d.T2);
s3=sprintf('SPEAR (%4.2fK)',    d.T3);
s4=sprintf('ESM4 (%4.2fK)',     d.T4);
s1=sprintf('AM4.0-P2K (%4.2fK)',d.T1);
s5=sprintf('AM4.1-P4K (%4.2fK)',d.T5);
legend(s2,s3,s4,s1,s5,0); grid on; axis(xy);
yl='\DeltaTs normalized by global mean warming (K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';      xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 8: NETRADTOA%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netrad_zm'; xy=[-90 90 -3 1]; 
t1=130; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
a=am4.c0.toa.netrad.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.w0.toa.netrad.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.g0.toa.netrad.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));dg=(g1-c1)*2;
a=CM4.c0.toa.netrad.all (151:250,:,:,:); c2=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.w0.toa.netrad.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.c0.toa.netrad.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.w0.toa.netrad.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.c0.toa.netrad.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.w0.toa.netrad.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
a=a41.c0.toa.netrad.all (:      ,:,:,:); c5=squeeze(mean(mean(mean(a,1),2),4));
a=a41.w0.toa.netrad.all (:      ,:,:,:); w5=squeeze(mean(mean(mean(a,1),2),4));
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
a=(w2-c2-dg)/d.T2; plot(lat,a,'r','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=(w3-c3-dg)/d.T3; plot(lat,a,'b','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=(w4-c4-dg)/d.T4; plot(lat,a,'k','LineWidth',lw); hold on; d.X4=mean(a.*a0);
a=(w1-c1)   /d.T1; plot(lat,a,'m','LineWidth',lw); hold on; d.X1=mean(a.*a0);
a=(w5-c5)   /d.T5; plot(lat,a,'c','LineWidth',lw); hold on; d.X5=mean(a.*a0);
%a=dg/2;           plot(lat,a,'g:','LineWidth',lw); hold on; d.X0=mean(a.*a0);
s2=sprintf('CM4 (%4.2f W/m2/K)',      d.X2);
s3=sprintf('SPEAR (%4.2f W/m2/K)',    d.X3);
s4=sprintf('ESM4 (%4.2f W/m2/K)',     d.X4);
s1=sprintf('AM4.0-P2K (%4.2f W/m2/K)',d.X1);
s5=sprintf('AM4.1-P4K (%4.2f W/m2/K)',d.X5);
%s0=sprintf('AM4-2xCO2 (%4.2f W/m2)',  d.X0);
legend(s2,s3,s4,s1,s5,0); grid on; axis(xy);
yl='TOA net radiative feedback (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';             xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 8: NETRADTOA_supp1%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netrad_zm_supp1'; xy=[-90 90 -2 1]; 
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
y1=(w2-c2-dg)/d.T2; 
y2=(w3-c3-dg)/d.T3; 
y3=(w4-c4-dg)/d.T4; 
y4=(w1-c1)   /d.T1; 
y5=(w5-c5)   /d.T5; 
a=y2-y1; plot(lat,a,'b','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=y3-y1; plot(lat,a,'k','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=y5-y4; plot(lat,a,'c','LineWidth',lw); hold on; d.X4=mean(a.*a0);
s1=sprintf('SPEAR minus CM4 (%4.2f W/m2/K)',   d.X2);
s2=sprintf('ESM4  minus CM4 (%4.2f W/m2/K)',   d.X3);
s3=sprintf('AM4.1 minus AM4.0 (%4.2f W/m2/K)', d.X4);
legend(s1,s2,s3,0); grid on; axis(xy);
yl='TOA net radiative feedback (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';             xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 8: prediction%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='predict_ecs';
pms=[ 0, 0, 1500, 1200]*0.6; fsize=20; lw=2;
handle = figure('Position', pms,'visible','on'); 
x=[4.9 3.7 3.2]; alpha=[d.X2 d.X3 d.X4]; y=4./-alpha
plot(x(1),y(1),'r^','MarkerSize',msize,'LineWidth',2); hold on; 
plot(x(2),y(2),'bs','MarkerSize',msize,'LineWidth',2); hold on; 
plot(x(3),y(3),'kv','MarkerSize',msize,'LineWidth',2); hold on; 
plot([2 6],[2 6],'k--','LineWidth',2); grid on; axis([2 6 2 6]);
legend('CM4','SPEAR','ESM4',2);
xl='actual ECS (K)';    xlabel(xl,'FontSize',fsize);
yl='predicted ECS (K)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 8: NETRADTOA%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netrad_zm_yr10'; xy=[-90 90 -3 1]; 
t1=1; t2=20; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
[d c1 w1 g1 c2 w2 c3 w3 c4 w4 c5 w5]=get_tref(am4,CM4,SP4,ESM4,a41,aa,t1,t2);
a=am4.c0.toa.netrad.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.w0.toa.netrad.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.g0.toa.netrad.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));dg=(g1-c1)*2;
a=CM4.c0.toa.netrad.all (151:250,:,:,:); c2=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.w0.toa.netrad.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.c0.toa.netrad.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.w0.toa.netrad.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.c0.toa.netrad.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.w0.toa.netrad.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
a=a41.c0.toa.netrad.all (:      ,:,:,:); c5=squeeze(mean(mean(mean(a,1),2),4));
a=a41.w0.toa.netrad.all (:      ,:,:,:); w5=squeeze(mean(mean(mean(a,1),2),4));
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
a=(w2-c2-dg)/d.T2; plot(lat,a,'r','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=(w3-c3-dg)/d.T3; plot(lat,a,'b','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=(w4-c4-dg)/d.T4; plot(lat,a,'k','LineWidth',lw); hold on; d.X4=mean(a.*a0);
a=(w1-c1)   /d.T1; plot(lat,a,'m','LineWidth',lw); hold on; d.X1=mean(a.*a0);
a=(w5-c5)   /d.T5; plot(lat,a,'c','LineWidth',lw); hold on; d.X5=mean(a.*a0);
%a=dg/2;           plot(lat,a,'g:','LineWidth',lw); hold on; d.X0=mean(a.*a0);
s2=sprintf('CM4 (%4.2f W/m2/K)',      d.X2);
s3=sprintf('SPEAR (%4.2f W/m2/K)',    d.X3);
s4=sprintf('ESM4 (%4.2f W/m2/K)',     d.X4);
s1=sprintf('AM4.0-P2K (%4.2f W/m2/K)',d.X1);
s5=sprintf('AM4.1-P4K (%4.2f W/m2/K)',d.X5);
%s0=sprintf('AM4-2xCO2 (%4.2f W/m2)',  d.X0);
legend(s2,s3,s4,s1,s5,0); grid on; axis(xy);
yl='TOA net radiative feedback (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';             xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 8: NETRADTOA%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netrad_zm_150_20'; xy=[-90 90 -1 2]; 
t1=1; t2=20; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
[d c1 w1 g1 c2 w2 c3 w3 c4 w4 c5 w5]=get_tref(am4,CM4,SP4,ESM4,a41,aa,t1,t2);
a=am4.c0.toa.netrad.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.w0.toa.netrad.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.g0.toa.netrad.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));dg=(g1-c1)*2;
a=CM4.c0.toa.netrad.all (151:250,:,:,:); c2=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.w0.toa.netrad.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.c0.toa.netrad.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.w0.toa.netrad.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.c0.toa.netrad.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.w0.toa.netrad.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
a=a41.c0.toa.netrad.all (:      ,:,:,:); c5=squeeze(mean(mean(mean(a,1),2),4));
a=a41.w0.toa.netrad.all (:      ,:,:,:); w5=squeeze(mean(mean(mean(a,1),2),4));
a=(w2-c2-dg)/d.T2; d.X2=mean(a.*a0); y2=a;
a=(w3-c3-dg)/d.T3; d.X3=mean(a.*a0); y3=a;
a=(w4-c4-dg)/d.T4; d.X4=mean(a.*a0); y4=a;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t1=130; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
[d c1 w1 g1 c2 w2 c3 w3 c4 w4 c5 w5]=get_tref(am4,CM4,SP4,ESM4,a41,aa,t1,t2);
a=am4.c0.toa.netrad.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.w0.toa.netrad.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.g0.toa.netrad.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));dg=(g1-c1)*2;
a=CM4.c0.toa.netrad.all (151:250,:,:,:); c2=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.w0.toa.netrad.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.c0.toa.netrad.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.w0.toa.netrad.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.c0.toa.netrad.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.w0.toa.netrad.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
a=a41.c0.toa.netrad.all (:      ,:,:,:); c5=squeeze(mean(mean(mean(a,1),2),4));
a=a41.w0.toa.netrad.all (:      ,:,:,:); w5=squeeze(mean(mean(mean(a,1),2),4));
a=(w2-c2-dg)/d.T2; d.X2=mean(a.*a0); Y2=a;
a=(w3-c3-dg)/d.T3; d.X3=mean(a.*a0); Y3=a;
a=(w4-c4-dg)/d.T4; d.X4=mean(a.*a0); Y4=a;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
a=Y2-y2; plot(lat,a,'r',  'LineWidth',lw); hold on; d.X2=mean(a.*a0);
%a=Y2; plot(lat,a,'r--','LineWidth',lw); hold on; %d.X3=mean(a.*a0);
a=Y3-y3; plot(lat,a,'b',  'LineWidth',lw); hold on; d.X3=mean(a.*a0);
%a=Y3; plot(lat,a,'b--','LineWidth',lw); hold on; %d.X4=mean(a.*a0);
a=Y4-y4; plot(lat,a,'k',  'LineWidth',lw); hold on; d.X4=mean(a.*a0);
%a=Y4; plot(lat,a,'k--','LineWidth',lw); hold on; %d.X4=mean(a.*a0);
s2=sprintf('CM4   (year140 minus year10 = %4.2f W/m2/K)',d.X2);
s3=sprintf('SPEAR (year140 minus year10 = %4.2f W/m2/K)',d.X3);
s4=sprintf('ESM4  (year140 minus year10 = %4.2f W/m2/K)',d.X4);
%s1=sprintf('AM4.0-P2K (%4.2f W/m2/K)',d.X1);
%s5=sprintf('AM4.1-P4K (%4.2f W/m2/K)',d.X5);
%s0=sprintf('AM4-2xCO2 (%4.2f W/m2)',  d.X0);
legend(s2,s3,s4,0); grid on; axis(xy);
yl='TOA net radiative feedback (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';             xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 6: SWCF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcf_zm'; xy=[-90 90 -4 1.2];
t1=130; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
a=am4.c0.toa.swcf.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.w0.toa.swcf.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.g0.toa.swcf.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));dg=(g1-c1)*2;
a=CM4.c0.toa.swcf.all (151:250,:,:,:); c2=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.w0.toa.swcf.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.c0.toa.swcf.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.w0.toa.swcf.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.c0.toa.swcf.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.w0.toa.swcf.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
a=a41.c0.toa.swcf.all (:      ,:,:,:); c5=squeeze(mean(mean(mean(a,1),2),4));
a=a41.w0.toa.swcf.all (:      ,:,:,:); w5=squeeze(mean(mean(mean(a,1),2),4));
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
a=(w2-c2-dg)/d.T2; plot(lat,a,'r','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=(w3-c3-dg)/d.T3; plot(lat,a,'b','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=(w4-c4-dg)/d.T4; plot(lat,a,'k','LineWidth',lw); hold on; d.X4=mean(a.*a0);
a=(w1-c1)   /d.T1; plot(lat,a,'m','LineWidth',lw); hold on; d.X1=mean(a.*a0);
a=(w5-c5)   /d.T5; plot(lat,a,'c','LineWidth',lw); hold on; d.X5=mean(a.*a0);
%a=dg/2;           plot(lat,a,'g','LineWidth',lw); hold on; d.X0=mean(a.*a0);
s2=sprintf('CM4 (%4.2f W/m2/K)',      d.X2);
s3=sprintf('SPEAR (%4.2f W/m2/K)',    d.X3);
s4=sprintf('ESM4 (%4.2f W/m2/K)',     d.X4);
s1=sprintf('AM4.0-P2K (%4.2f W/m2/K)',d.X1);
s5=sprintf('AM4.1-P4K (%4.2f W/m2/K)',d.X5);
legend(s2,s3,s4,s1,s5,0); grid on; axis(xy);
yl='TOA SW cloud feedback (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';              xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 7: LWCF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcf_zm'; xy=[-90 90 -0.5 1.5];
t1=130; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
a=am4.c0.toa.lwcf.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.w0.toa.lwcf.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.g0.toa.lwcf.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));dg=(g1-c1)*2;
a=CM4.c0.toa.lwcf.all (151:250,:,:,:); c2=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.w0.toa.lwcf.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.c0.toa.lwcf.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.w0.toa.lwcf.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.c0.toa.lwcf.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.w0.toa.lwcf.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
a=a41.c0.toa.lwcf.all (:      ,:,:,:); c5=squeeze(mean(mean(mean(a,1),2),4));
a=a41.w0.toa.lwcf.all (:      ,:,:,:); w5=squeeze(mean(mean(mean(a,1),2),4));
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
a=(w2-c2-dg)/d.T2; plot(lat,a,'r','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=(w3-c3-dg)/d.T3; plot(lat,a,'b','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=(w4-c4-dg)/d.T4; plot(lat,a,'k','LineWidth',lw); hold on; d.X4=mean(a.*a0);
a=(w1-c1)   /d.T1; plot(lat,a,'m','LineWidth',lw); hold on; d.X1=mean(a.*a0);
a=(w5-c5)   /d.T5; plot(lat,a,'c','LineWidth',lw); hold on; d.X5=mean(a.*a0);
%a=dg/2   ;         plot(lat,a,'g','LineWidth',lw); hold on; d.X0=mean(a.*a0);
s2=sprintf('CM4 (%4.2f W/m2/K)',    d.X2);
s3=sprintf('SPEAR (%4.2f W/m2/K)',  d.X3);
s4=sprintf('ESM4 (%4.2f W/m2/K)',   d.X4);
s1=sprintf('AM4.0-P2K (%4.2f W/m2/K)',d.X1);
s5=sprintf('AM4.1-P4K (%4.2f W/m2/K)',d.X5);
legend(s2,s3,s4,s1,s5,0); grid on; axis(xy);
yl='TOA LW cloud feedback (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';              xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 7: TTCF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ttcf_zm'; xy=[-90 90 -4 1]; 
t1=130; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
a=am4.c0.toa.ttcf.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.w0.toa.ttcf.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.g0.toa.ttcf.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));dg=(g1-c1)*2;
a=CM4.c0.toa.ttcf.all (151:250,:,:,:); c2=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.w0.toa.ttcf.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.c0.toa.ttcf.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.w0.toa.ttcf.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.c0.toa.ttcf.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.w0.toa.ttcf.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
a=a41.c0.toa.ttcf.all (:      ,:,:,:); c5=squeeze(mean(mean(mean(a,1),2),4));
a=a41.w0.toa.ttcf.all (:      ,:,:,:); w5=squeeze(mean(mean(mean(a,1),2),4));
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
a=(w2-c2-dg)/d.T2; plot(lat,a,'r','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=(w3-c3-dg)/d.T3; plot(lat,a,'b','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=(w4-c4-dg)/d.T4; plot(lat,a,'k','LineWidth',lw); hold on; d.X4=mean(a.*a0);
a=(w1-c1)   /d.T1; plot(lat,a,'m','LineWidth',lw); hold on; d.X1=mean(a.*a0);
a=(w5-c5)   /d.T5; plot(lat,a,'c','LineWidth',lw); hold on; d.X5=mean(a.*a0);
%a=dg/2   ;         plot(lat,a,'g','LineWidth',lw); hold on; d.X0=mean(a.*a0);
s2=sprintf('CM4 (%4.2f W/m2/K)',    d.X2);
s3=sprintf('SPEAR (%4.2f W/m2/K)',  d.X3);
s4=sprintf('ESM4 (%4.2f W/m2/K)',   d.X4);
s1=sprintf('AM4.0-P2K (%4.2f W/m2/K)',d.X1);
s5=sprintf('AM4.1-P4K (%4.2f W/m2/K)',d.X5);
legend(s2,s3,s4,s1,s5,0); grid on; axis(xy);
yl='total cloud radiative feedback (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';              xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 8: NETRADTOA_supp1%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ttcf_zm_supp1'; xy=[-90 90 -2 1]; 
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
y1=(w2-c2-dg)/d.T2; 
y2=(w3-c3-dg)/d.T3; 
y3=(w4-c4-dg)/d.T4; 
y4=(w1-c1)   /d.T1; 
y5=(w5-c5)   /d.T5; 
a=y2-y1; plot(lat,a,'b','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=y3-y1; plot(lat,a,'k','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=y5-y4; plot(lat,a,'c','LineWidth',lw); hold on; d.X4=mean(a.*a0);
s1=sprintf('SPEAR minus CM4 (%4.2f W/m2/K)',   d.X2);
s2=sprintf('ESM4  minus CM4 (%4.2f W/m2/K)',   d.X3);
s3=sprintf('AM4.1 minus AM4.0 (%4.2f W/m2/K)', d.X4);
legend(s1,s2,s3,0); grid on; axis(xy);
yl='total cloud feedback (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';             xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 7: SWNET_CLR%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet_clr_zm'; xy=[-90 90 -0.5 6];
t1=130; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
a=am4.c0.toa.swnet_clr.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.w0.toa.swnet_clr.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.g0.toa.swnet_clr.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));dg=(g1-c1)*2;
a=CM4.c0.toa.swnet_clr.all (151:250,:,:,:); c2=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.w0.toa.swnet_clr.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.c0.toa.swnet_clr.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.w0.toa.swnet_clr.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.c0.toa.swnet_clr.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.w0.toa.swnet_clr.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
a=a41.c0.toa.swnet_clr.all (:      ,:,:,:); c5=squeeze(mean(mean(mean(a,1),2),4));
a=a41.w0.toa.swnet_clr.all (:      ,:,:,:); w5=squeeze(mean(mean(mean(a,1),2),4));
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
a=(w2-c2-dg)/d.T2; plot(lat,a,'r','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=(w3-c3-dg)/d.T3; plot(lat,a,'b','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=(w4-c4-dg)/d.T4; plot(lat,a,'k','LineWidth',lw); hold on; d.X4=mean(a.*a0);
a=(w1-c1)   /d.T1; plot(lat,a,'m','LineWidth',lw); hold on; d.X1=mean(a.*a0);
a=(w5-c5)   /d.T5; plot(lat,a,'c','LineWidth',lw); hold on; d.X5=mean(a.*a0);
%a=dg/2   ;         plot(lat,a,'g','LineWidth',lw); hold on; d.X0=mean(a.*a0);
s2=sprintf('CM4 (%4.2f W/m2/K)',    d.X2);
s3=sprintf('SPEAR (%4.2f W/m2/K)',  d.X3);
s4=sprintf('ESM4 (%4.2f W/m2/K)',   d.X4);
s1=sprintf('AM4.0-P2K (%4.2f W/m2/K)',d.X1);
s5=sprintf('AM4.1-P4K (%4.2f W/m2/K)',d.X5);
legend(s2,s3,s4,s1,s5,0); grid on; axis(xy);
yl='TOA clear-sky SW radiative feedback (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';              xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 8: TOA SW Radiative feedback supp1%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet_clr_zm_supp1'; xy=[-90 90 -2.8 0.8]; 
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
y1=(w2-c2-dg)/d.T2; 
y2=(w3-c3-dg)/d.T3; 
y3=(w4-c4-dg)/d.T4; 
y4=(w1-c1)   /d.T1; 
y5=(w5-c5)   /d.T5; 
a=y2-y1; plot(lat,a,'b','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=y3-y1; plot(lat,a,'k','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=y5-y4; plot(lat,a,'c','LineWidth',lw); hold on; d.X4=mean(a.*a0);
s1=sprintf('SPEAR minus CM4 (%4.2f W/m2/K)',   d.X2);
s2=sprintf('ESM4  minus CM4 (%4.2f W/m2/K)',   d.X3);
s3=sprintf('AM4.1 minus AM4.0 (%4.2f W/m2/K)', d.X4);
legend(s1,s2,s3,0); grid on; axis(xy);
yl='TOA clear-sky SW radiative feedback (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';             xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 8: TOA clear-sky LW Radiative feedback %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_clr_zm'; xy=[-90 90 -5 -0.8];
t1=130; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
a=-am4.c0.toa.lwnet_clr.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=-am4.w0.toa.lwnet_clr.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=-am4.g0.toa.lwnet_clr.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));dg=(g1-c1)*2;
a=-CM4.c0.toa.lwnet_clr.all (151:250,:,:,:); c2=squeeze(mean(mean(mean(a,1),2),4));
a=-CM4.w0.toa.lwnet_clr.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=-SP4.c0.toa.lwnet_clr.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=-SP4.w0.toa.lwnet_clr.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=-ESM.c0.toa.lwnet_clr.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=-ESM.w0.toa.lwnet_clr.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
a=-a41.c0.toa.lwnet_clr.all (:      ,:,:,:); c5=squeeze(mean(mean(mean(a,1),2),4));
a=-a41.w0.toa.lwnet_clr.all (:      ,:,:,:); w5=squeeze(mean(mean(mean(a,1),2),4));
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
a=(w2-c2-dg)/d.T2; plot(lat,a,'r','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=(w3-c3-dg)/d.T3; plot(lat,a,'b','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=(w4-c4-dg)/d.T4; plot(lat,a,'k','LineWidth',lw); hold on; d.X4=mean(a.*a0);
a=(w1-c1)   /d.T1; plot(lat,a,'m','LineWidth',lw); hold on; d.X1=mean(a.*a0);
a=(w5-c5)   /d.T5; plot(lat,a,'c','LineWidth',lw); hold on; d.X5=mean(a.*a0);
%a=dg/2;           plot(lat,a,'g','LineWidth',lw); hold on; d.X0=mean(a.*a0);
s2=sprintf('CM4 (%4.2f W/m2/K)',    d.X2);
s3=sprintf('SPEAR (%4.2f W/m2/K)',  d.X3);
s4=sprintf('ESM4 (%4.2f W/m2/K)',   d.X4);
s1=sprintf('AM4.0-P2K (%4.2f W/m2/K)',d.X1);
s5=sprintf('AM4.1-P4K (%4.2f W/m2/K)',d.X5);
legend(s2,s3,s4,s1,s5,0); grid on; axis(xy);
yl='TOA clear-sky LW radiative feedback (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';              xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 8: TOA clear-sky LW Radiative feedback supp1%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_clr_zm_supp1'; xy=[-90 90 -2.8 0.8]; 
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
y1=(w2-c2-dg)/d.T2; 
y2=(w3-c3-dg)/d.T3; 
y3=(w4-c4-dg)/d.T4; 
y4=(w1-c1)   /d.T1; 
y5=(w5-c5)   /d.T5; 
a=y2-y1; plot(lat,a,'b','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=y3-y1; plot(lat,a,'k','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=y5-y4; plot(lat,a,'c','LineWidth',lw); hold on; d.X4=mean(a.*a0);
s1=sprintf('SPEAR minus CM4 (%4.2f W/m2/K)',   d.X2);
s2=sprintf('ESM4  minus CM4 (%4.2f W/m2/K)',   d.X3);
s3=sprintf('AM4.1 minus AM4.0 (%4.2f W/m2/K)', d.X4);
legend(s1,s2,s3,0); grid on; axis(xy);
yl='TOA clear-sky LW radiative feedback (W/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';             xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 8: LWP_ZM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwp_zm'; xy=[-90 90 -0.002 0.008];
t1=130; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
a=am4.c0.atm.lwp.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.w0.atm.lwp.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.g0.atm.lwp.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));dg=(g1-c1)*2;
a=CM4.c0.atm.lwp.all (151:250,:,:,:); c2=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.w0.atm.lwp.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.c0.atm.lwp.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.w0.atm.lwp.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.c0.atm.lwp.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.w0.atm.lwp.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
a=a41.c0.atm.lwp.all (:      ,:,:,:); c5=squeeze(mean(mean(mean(a,1),2),4));
a=a41.w0.atm.lwp.all (:      ,:,:,:); w5=squeeze(mean(mean(mean(a,1),2),4));
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
a=(w2-c2-dg)/d.T2; plot(lat,a,'r','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=(w3-c3-dg)/d.T3; plot(lat,a,'b','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=(w4-c4-dg)/d.T4; plot(lat,a,'k','LineWidth',lw); hold on; d.X4=mean(a.*a0);
a=(w1-c1)   /d.T1; plot(lat,a,'m','LineWidth',lw); hold on; d.X1=mean(a.*a0);
a=(w5-c5)   /d.T5; plot(lat,a,'c','LineWidth',lw); hold on; d.X5=mean(a.*a0);
%a=dg/2;           plot(lat,a,'g','LineWidth',lw); hold on; d.X0=mean(a.*a0);
s2=sprintf('CM4 (%4.2f g/m2/K)',      d.X2*1000);
s3=sprintf('SPEAR (%4.2f g/m2/K)',    d.X3*1000);
s4=sprintf('ESM4 (%4.2f g/m2/K)',     d.X4*1000);
s1=sprintf('AM4.0-P2K (%4.2f g/m2/K)',d.X1*1000);
s5=sprintf('AM4.1-P4K (%4.2f g/m2/K)',d.X5*1000);
legend(s2,s3,s4,s1,s5,0); grid on; axis(xy);
yl='liquid water path feedback (kg/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';              xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 8: IWP_ZM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='iwp_zm'; xy=[-90 90 -0.003 0.007];
t1=130; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
a=am4.c0.atm.iwp.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.w0.atm.iwp.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.g0.atm.iwp.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));dg=(g1-c1)*2;
a=CM4.c0.atm.iwp.all (151:250,:,:,:); c2=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.w0.atm.iwp.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.c0.atm.iwp.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.w0.atm.iwp.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.c0.atm.iwp.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.w0.atm.iwp.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
a=a41.c0.atm.iwp.all (:      ,:,:,:); c5=squeeze(mean(mean(mean(a,1),2),4));
a=a41.w0.atm.iwp.all (:      ,:,:,:); w5=squeeze(mean(mean(mean(a,1),2),4));
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
a=(w2-c2-dg)/d.T2; plot(lat,a,'r','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=(w3-c3-dg)/d.T3; plot(lat,a,'b','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=(w4-c4-dg)/d.T4; plot(lat,a,'k','LineWidth',lw); hold on; d.X4=mean(a.*a0);
a=(w1-c1)   /d.T1; plot(lat,a,'m','LineWidth',lw); hold on; d.X1=mean(a.*a0);
a=(w5-c5)   /d.T5; plot(lat,a,'c','LineWidth',lw); hold on; d.X5=mean(a.*a0);
%a=dg/2;           plot(lat,a,'g','LineWidth',lw); hold on; d.X0=mean(a.*a0);
s2=sprintf('CM4 (%4.2f g/m2/K)',      d.X2*1000);
s3=sprintf('SPEAR (%4.2f g/m2/K)',    d.X3*1000);
s4=sprintf('ESM4 (%4.2f g/m2/K)',     d.X4*1000);
s1=sprintf('AM4.0-P2K (%4.2f g/m2/K)',d.X1*1000);
s5=sprintf('AM4.1-P4K (%4.2f g/m2/K)',d.X5*1000);
legend(s2,s3,s4,s1,s5,0); grid on; axis(xy);
yl='ice water path feedback (kg/m2/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';              xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 8: QAL_ZM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qal_zm'; xy=[-90 90 -2.5 1];
t1=130; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
a=am4.c0.atm.qal.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.w0.atm.qal.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.g0.atm.qal.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));dg=(g1-c1)*2;
a=CM4.c0.atm.qal.all (151:250,:,:,:); c2=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.w0.atm.qal.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.c0.atm.qal.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.w0.atm.qal.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.c0.atm.qal.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.w0.atm.qal.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
a=a41.c0.atm.qal.all (:      ,:,:,:); c5=squeeze(mean(mean(mean(a,1),2),4));
a=a41.w0.atm.qal.all (:      ,:,:,:); w5=squeeze(mean(mean(mean(a,1),2),4));
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
a=(w2-c2-dg)/d.T2; plot(lat,a,'r','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=(w3-c3-dg)/d.T3; plot(lat,a,'b','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=(w4-c4-dg)/d.T4; plot(lat,a,'k','LineWidth',lw); hold on; d.X4=mean(a.*a0);
a=(w1-c1)   /d.T1; plot(lat,a,'m','LineWidth',lw); hold on; d.X1=mean(a.*a0);
a=(w5-c5)   /d.T5; plot(lat,a,'c','LineWidth',lw); hold on; d.X5=mean(a.*a0);
%a=dg/2;           plot(lat,a,'g','LineWidth',lw); hold on; d.X0=mean(a.*a0);
s2=sprintf('CM4 (%4.2f %%/K)',      d.X2);
s3=sprintf('SPEAR (%4.2f %%/K)',    d.X3);
s4=sprintf('ESM4 (%4.2f %%/K)',     d.X4);
s1=sprintf('AM4.0-P2K (%4.2f %%/K)',d.X1);
s5=sprintf('AM4.1-P4K (%4.2f %%/K)',d.X5);
legend(s2,s3,s4,s1,s5,0); grid on; axis(xy);
yl='low cloud amount feedback (%/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';              xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 8: QAH_ZM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qah_zm'; xy=[-90 90 -1.5 1.5];
t1=130; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
a=am4.c0.atm.qah.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.w0.atm.qah.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.g0.atm.qah.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));dg=(g1-c1)*2;
a=CM4.c0.atm.qah.all (151:250,:,:,:); c2=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.w0.atm.qah.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.c0.atm.qah.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.w0.atm.qah.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.c0.atm.qah.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.w0.atm.qah.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
a=(w2-c2-dg)/d.T2; plot(lat,a,'r','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=(w3-c3-dg)/d.T3; plot(lat,a,'b','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=(w4-c4-dg)/d.T4; plot(lat,a,'k','LineWidth',lw); hold on; d.X4=mean(a.*a0);
a=(w1-c1)   /d.T1; plot(lat,a,'m','LineWidth',lw); hold on; d.X1=mean(a.*a0);
a=(w5-c5)   /d.T5; plot(lat,a,'c','LineWidth',lw); hold on; d.X5=mean(a.*a0);
%a=dg/2;           plot(lat,a,'g','LineWidth',lw); hold on; d.X0=mean(a.*a0);
s2=sprintf('CM4 (%4.2f %%/K)',      d.X2);
s3=sprintf('SPEAR (%4.2f %%/K)',    d.X3);
s4=sprintf('ESM4 (%4.2f %%/K)',     d.X4);
s1=sprintf('AM4.0-P2K (%4.2f %%/K)',d.X1);
s5=sprintf('AM4.1-P4K (%4.2f %%/K)',d.X5);
legend(s2,s3,s4,s1,s5,0); grid on; axis(xy);
yl='high cloud amount feedback (%/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';              xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 8: QAM_ZM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qam_zm'; xy=[-90 90 -2.5 1];
t1=130; t2=150; s=CM4.c0.s; lat=s.lat; aa=s.aa; a0=mean(aa,2);
a=am4.c0.atm.qam.all (:      ,:,:,:); c1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.w0.atm.qam.all (:      ,:,:,:); w1=squeeze(mean(mean(mean(a,1),2),4));
a=am4.g0.atm.qam.all (:      ,:,:,:); g1=squeeze(mean(mean(mean(a,1),2),4));dg=(g1-c1)*2;
a=CM4.c0.atm.qam.all (151:250,:,:,:); c2=squeeze(mean(mean(mean(a,1),2),4));
a=CM4.w0.atm.qam.all (t1:t2  ,:,:,:); w2=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.c0.atm.qam.all (51:150 ,:,:,:); c3=squeeze(mean(mean(mean(a,1),2),4));
a=SP4.w0.atm.qam.all (t1:t2  ,:,:,:); w3=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.c0.atm.qam.all(1:100  ,:,:,:); c4=squeeze(mean(mean(mean(a,1),2),4));
a=ESM.w0.atm.qam.all(t1:t2  ,:,:,:); w4=squeeze(mean(mean(mean(a,1),2),4));
pms=[ 0, 0, 1500, 1200]*0.6; fsize=16; lw=2;
handle = figure('Position', pms,'visible','on'); 
a=(w2-c2-dg)/d.T2; plot(lat,a,'r','LineWidth',lw); hold on; d.X2=mean(a.*a0);
a=(w3-c3-dg)/d.T3; plot(lat,a,'b','LineWidth',lw); hold on; d.X3=mean(a.*a0);
a=(w4-c4-dg)/d.T4; plot(lat,a,'k','LineWidth',lw); hold on; d.X4=mean(a.*a0);
a=(w1-c1)   /d.T1; plot(lat,a,'m','LineWidth',lw); hold on; d.X1=mean(a.*a0);
a=(w5-c5)   /d.T5; plot(lat,a,'c','LineWidth',lw); hold on; d.X5=mean(a.*a0);
%a=dg/2;           plot(lat,a,'g','LineWidth',lw); hold on; d.X0=mean(a.*a0);
s2=sprintf('CM4 (%4.2f %%/K)',      d.X2);
s3=sprintf('SPEAR (%4.2f %%/K)',    d.X3);
s4=sprintf('ESM4 (%4.2f %%/K)',     d.X4);
s1=sprintf('AM4.0-P2K (%4.2f %%/K)',d.X1);
s5=sprintf('AM4.1-P4K (%4.2f %%/K)',d.X5);
legend(s2,s3,s4,s1,s5,0); grid on; axis(xy);
yl='middle cloud amount feedback (%/K)'; ylabel(yl,'FontSize',fsize);
xl='latitude';              xlabel(xl,'FontSize',fsize);
set(gca,'FontSize',fsize); %title(vname,'FontSize',fsize);
expn='cm4_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%test%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=CM4.c0; latx=v0.lat; lonx=v0.lon; lm=v0.lm0; aa=v0.s.aa;
k=1; ss={'ANN','MAM','JJA','SON','DJF'};
a=CM4.c0.sfc.tref.all (151:250,:,:,:); c1=squeeze(mean(mean(a,1),2));cavg1=mean(mean(c1.*aa,1));
a=CM4.w0.sfc.tref.all (130:150,:,:,:); w1=squeeze(mean(mean(a,1),2));wavg1=mean(mean(w1.*aa,1));
a=SP4.c0.sfc.tref.all (51:150, :,:,:); c2=squeeze(mean(mean(a,1),2));cavg2=mean(mean(c2.*aa,1));
a=SP4.w0.sfc.tref.all (130:150,:,:,:); w2=squeeze(mean(mean(a,1),2));wavg2=mean(mean(w2.*aa,1));
a=ESM.c0.sfc.tref.all(1:100,  :,:,:); c3=squeeze(mean(mean(a,1),2));cavg3=mean(mean(c3.*aa,1));
a=ESM.w0.sfc.tref.all(130:150,:,:,:); w3=squeeze(mean(mean(a,1),2));wavg3=mean(mean(w3.*aa,1));
lat=o.lat; lon=o.lon; cmin=0; cmax=15; vbin=[cmin:0.1:cmax];
pms=[ 0, 0, 600, 1000]*1.5; fsize=16; row=3; col=1; 
handle = figure('Position', pms,'visible','on'); 
subplot(row,col,1); 
contourf(lon,lat,w1-c1,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
title(strcat('(a) CM4 surface air temperature; 4xCO2 - CNTL=',num2str(wavg1-cavg1)),'FontSize',fsize);
subplot(row,col,2); 
contourf(lon,lat,w2-c2,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
title(strcat('(b) SPEAR-LO surface air temperature;  4xCO2 - CNTL=',num2str(wavg2-cavg2)),'FontSize',fsize);
%subplot(row,col,3); 
%contourf(lon,lat,w3-c3,vbin); hold on; shading flat; colorbar; caxis([cmin cmax]);
%title(strcat('(c) ESM4 surface air temperature;  4xCO2 - CNTL=',num2str(wavg3-cavg3)),'FontSize',fsize);
subplot(row,col,3); 
contourf(lon,lat,(w2-c2)-(w1-c1),[-3.5:0.1:3.5]); hold on; shading flat; colorbar; caxis([-1 1]);
title('(b) minus (a)','FontSize',fsize);
%subplot(row,col,6); 
%contourf(lon,lat,(w3-c3)-(w1-c1),[-3.5:0.1:3.5]); hold on; shading flat; colorbar; caxis([-3 3]);
%title('(c) minus (a)','FontSize',fsize);
expn='cm4_spear'; vname='tref'; visfig='off'; figpath='./fig_hiresmip/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load previous coupled anlaysis matfiles%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/CM2/';
expn='CM2.1U_Control-1860_D4';               fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm21.v0=v;
expn='CM2.1U-D4_1PctTo2X_I1';                fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm21.w0=v;
expn='CM2.1U-D4_1860-2000-AllForc_H1';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm21.h0=v;
expn='CM3Z_Control-1860_D1';                 fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm3.v0=v;
expn='CM3Z_D1_1PctTo4X_I1';                  fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm3.w0=v;
expn='CM3Z_D1_1860-2005_AllForc_H1';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);cm3.h0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section I: Analysis of time series
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1 ='AM4C192-AMIP';
s2 ='CM4C192-H1';
s3 ='CM4C192-H2';
s4 ='CM4C192-CTL';
s5 ='CM4C192-4xCO2';
s6 ='AM4C192-futureSST';
s7 ='AM4-DECKAMIP';
s8 ='CM4-H1';
s9 ='CM4-H2';
s10='CM4-H3';
s11='CM4-CTL';
s12='CM4-4xCO2';
s13='CM4-SSP585';
s14='SPEAR-CTL';
s15='SPEAR-4xCO2';
s16='ESM4-H1';
s17='ESM4-CTL';
s18='ESM4-4xCO2';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%annual surface air temperature%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tsurf_ann'; s=AM4h.h0.s; lat=s.lat; lon=s.lon;
y1=AM4h.h0.sfc.tref.ts.org_ann; x1=[1950:2014];
y2=CM4h.h1.sfc.tref.ts.org_ann; x2=[1950:2014];
y3=CM4h.h2.sfc.tref.ts.org_ann; x3=[1950:2014];
y4=CM4h.c0.sfc.tref.ts.org_ann; x4=[1900:1900+155-1];
y5=CM4h.w0.sfc.tref.ts.org_ann; x5=[1900:1900+170-1];
y6=AM4h.w0.sfc.tref.ts.org_ann; x6=[2015:2049];
z1=AM4.h0.sfc.tref.ts.org_ann;  t1=[1950:2014];
z2=CM4.h1.sfc.tref.ts.org_ann;  t2=[1850:2014];
z3=CM4.h2.sfc.tref.ts.org_ann;  t3=[1850:2014];
z4=CM4.h3.sfc.tref.ts.org_ann;  t4=[1850:2014];
z5=CM4.c0.sfc.tref.ts.org_ann;  t5=[1700:1700+500-1];
z6=CM4.w0.sfc.tref.ts.org_ann;  t6=[1851:2000];
z7=CM4.w1.sfc.tref.ts.org_ann;  t7=[2015:2099];
Y1=ESM4.h0.sfc.tref.ts.org_ann; X1=[1850:2014];
Y2=ESM4.c0.sfc.tref.ts.org_ann; X2=[1850:1850+300-1];
Y3=ESM4.w0.sfc.tref.ts.org_ann; X3=[1850:1850+300-1];
Z1=SP4.c0.sfc.tref.ts.org_ann;  T1=[1800:1800+200-1];
Z2=SP4.w0.sfc.tref.ts.org_ann;  T2=[1851:1851+200-1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.5; fsize=16; lw1=1; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(x1,y1,    'k',   'LineWidth',lw1); hold on; 
plot(x2,y2,    'g',   'LineWidth',lw1); hold on; 
plot(x3,y3,    'c',   'LineWidth',lw1); hold on; 
plot(x4,y4,    'b',   'LineWidth',lw1); hold on; 
plot(x5,y5,    'r',   'LineWidth',lw1); hold on; 
plot(x6,y6,    'm',   'LineWidth',lw1); hold on; 
plot(t1,z1,    'k',   'LineWidth',lw2); hold on; 
plot(t2,z2,    'g',   'LineWidth',lw2); hold on; 
plot(t3,z3,    'c',   'LineWidth',lw2); hold on; 
plot(t4,z4,    'y',   'LineWidth',lw2); hold on; 
plot(t5,z5,    'b',   'LineWidth',lw2); hold on; 
plot(t6,z6,    'm',   'LineWidth',lw2); hold on; 
plot(t7,z7,    'r',   'LineWidth',lw2); hold on; 
plot(T1,Z1,    'c-',  'LineWidth',lw3); hold on; 
plot(T2,Z2,    'm-',  'LineWidth',lw3); hold on; 
plot(X1,Y1,    'k-',  'LineWidth',lw3); hold on; 
plot(X2,Y2,    'b-',  'LineWidth',lw3); hold on; 
plot(X3,Y3,    'r-',  'LineWidth',lw3); hold on; 
legend(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,2);
xlabel('year','FontSize',fsize); 
ylabel('global mean surface air temperature (K)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1700 2200 285 293.5]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%surface air temperature at pentad frequency%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tsurf'; s=AM4h.h0.s; lat=s.lat; lon=s.lon;
y1=AM4h.h0.sfc.pcp.ann_stat.mmen.all; x1=[1950:5:2014];
y2=CM4h.h1.sfc.pcp.ann_stat.mmen.all; x2=[1950:5:2014];
y3=CM4h.h2.sfc.pcp.ann_stat.mmen.all; x3=[1950:5:2014];
y4=CM4h.c0.sfc.pcp.ann_stat.mmen.all; x4=[1900:5:1900+155-1];
y5=CM4h.w0.sfc.pcp.ann_stat.mmen.all; x5=[1900:5:1900+170-1];
y6=AM4h.w0.sfc.pcp.ann_stat.mmen.all; x6=[2015:5:2049];
z1=AM4.h0.sfc.pcp.ann_stat.mmen.all;  t1=[1950:5:2014];
z2=CM4.h1.sfc.pcp.ann_stat.mmen.all;  t2=[1850:5:2014];
z3=CM4.h2.sfc.pcp.ann_stat.mmen.all;  t3=[1850:5:2014];
z4=CM4.h3.sfc.pcp.ann_stat.mmen.all;  t4=[1850:5:2014];
z5=CM4.c0.sfc.pcp.ann_stat.mmen.all;  t5=[1700:5:1700+500-1];
z6=CM4.w0.sfc.pcp.ann_stat.mmen.all;  t6=[1851:5:2000];
z7=CM4.w1.sfc.pcp.ann_stat.mmen.all;  t7=[2015:5:2099];
Y1=ESM4.h0.sfc.pcp.ann_stat.mmen.all; X1=[1850:5:2014];
Y2=ESM4.c0.sfc.pcp.ann_stat.mmen.all; X2=[1850:5:1850+300-1];
Y3=ESM4.w0.sfc.pcp.ann_stat.mmen.all; X3=[1850:5:1850+300-1];
Z1=SP4.c0.sfc.pcp.ann_stat.mmen.all;  T1=[1800:5:1800+200-1];
Z2=SP4.w0.sfc.pcp.ann_stat.mmen.all;  T2=[1851:5:1851+200-1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.5; fsize=16; lw1=1; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(x1,y1,    'k',   'LineWidth',lw1); hold on; 
plot(x2,y2,    'g',   'LineWidth',lw1); hold on; 
plot(x3,y3,    'c',   'LineWidth',lw1); hold on; 
plot(x4,y4,    'b',   'LineWidth',lw1); hold on; 
plot(x5,y5,    'r',   'LineWidth',lw1); hold on; 
plot(x6,y6,    'm',   'LineWidth',lw1); hold on; 
plot(t1,z1,    'k',   'LineWidth',lw2); hold on; 
plot(t2,z2,    'g',   'LineWidth',lw2); hold on; 
plot(t3,z3,    'c',   'LineWidth',lw2); hold on; 
plot(t4,z4,    'y',   'LineWidth',lw2); hold on; 
plot(t5,z5,    'b',   'LineWidth',lw2); hold on; 
plot(t6,z6,    'm',   'LineWidth',lw2); hold on; 
plot(t7,z7,    'r',   'LineWidth',lw2); hold on; 
plot(T1,Z1,    'c-',  'LineWidth',lw3); hold on; 
plot(T2,Z2,    'm-',  'LineWidth',lw3); hold on; 
plot(X1,Y1,    'k-',  'LineWidth',lw3); hold on; 
plot(X2,Y2,    'b-',  'LineWidth',lw3); hold on; 
plot(X3,Y3,    'r-',  'LineWidth',lw3); hold on; 
legend(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,2);
xlabel('year','FontSize',fsize); 
ylabel('global mean surface air temperature (K)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1700 2200 285 293.5]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%surface precipitation%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_ann'; s=AM4h.h0.s; lat=s.lat; lon=s.lon;
y1=AM4h.h0.sfc.pcp.ts.org_ann; x1=[1950:2014];
y2=CM4h.h1.sfc.pcp.ts.org_ann; x2=[1950:2014];
y3=CM4h.h2.sfc.pcp.ts.org_ann; x3=[1950:2014];
y4=CM4h.c0.sfc.pcp.ts.org_ann; x4=[1900:1900+155-1];
y5=CM4h.w0.sfc.pcp.ts.org_ann; x5=[1900:1900+170-1];
y6=AM4h.w0.sfc.pcp.ts.org_ann; x6=[2015:2049];
z1=AM4.h0.sfc.pcp.ts.org_ann;  t1=[1950:2014];
z2=CM4.h1.sfc.pcp.ts.org_ann;  t2=[1850:2014];
z3=CM4.h2.sfc.pcp.ts.org_ann;  t3=[1850:2014];
z4=CM4.h3.sfc.pcp.ts.org_ann;  t4=[1850:2014];
z5=CM4.c0.sfc.pcp.ts.org_ann;  t5=[1700:1700+500-1];
z6=CM4.w0.sfc.pcp.ts.org_ann;  t6=[1851:2000];
Z1=SP4.c0.sfc.pcp.ts.org_ann;  T1=[1800:1800+200-1];
Z2=SP4.w0.sfc.pcp.ts.org_ann;  T2=[1851:1851+200-1];
Y1=ESM4.h0.sfc.pcp.ts.org_ann; t7=[1850:2014];
Y2=ESM4.c0.sfc.pcp.ts.org_ann; t8=[1850:1850+300-1];
Y3=ESM4.w0.sfc.pcp.ts.org_ann; t9=[1850:1850+300-1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.5; fsize=16; lw1=2; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(x1,y1,    'k',   'LineWidth',lw1); hold on; 
plot(x2,y2,    'g',   'LineWidth',lw1); hold on; 
plot(x3,y3,    'c',   'LineWidth',lw1); hold on; 
plot(x4,y4,    'b',   'LineWidth',lw1); hold on; 
plot(x5,y5,    'r',   'LineWidth',lw1); hold on; 
plot(x6,y6,    'm',   'LineWidth',lw1); hold on; 
plot(t1,z1,    'k',   'LineWidth',lw2); hold on; 
plot(t2,z2,    'g',   'LineWidth',lw2); hold on; 
plot(t3,z3,    'c',   'LineWidth',lw2); hold on; 
plot(t4,z4,    'y',   'LineWidth',lw2); hold on; 
plot(t5,z5,    'b',   'LineWidth',lw2); hold on; 
plot(t6,z6,    'm',   'LineWidth',lw2); hold on; 
plot(T1,Z1,    'b--', 'LineWidth',lw3); hold on; 
plot(T2,Z2,    'r--', 'LineWidth',lw3); hold on; 
plot(t7,Y1,    'k-',  'LineWidth',lw3); hold on; 
plot(t8,Y2,    'b-',  'LineWidth',lw3); hold on; 
plot(t9,Y3,    'r-',  'LineWidth',lw3); hold on; 
legend(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,2);
xlabel('year','FontSize',fsize); 
ylabel('global mean surface precipitation (mm/day)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1700 2200 2.85 3.2]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%surface precipitation at 5 year avg%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp'; s=AM4h.h0.s; lat=s.lat; lon=s.lon;
y1=AM4h.h0.sfc.pcp.ann_stat.mmen.all; x1=[1950:5:2014];
y2=CM4h.h1.sfc.pcp.ann_stat.mmen.all; x2=[1950:5:2014];
y3=CM4h.h2.sfc.pcp.ann_stat.mmen.all; x3=[1950:5:2014];
y4=CM4h.c0.sfc.pcp.ann_stat.mmen.all; x4=[1900:5:1900+155-1];
y5=CM4h.w0.sfc.pcp.ann_stat.mmen.all; x5=[1900:5:1900+170-1];
y6=AM4h.w0.sfc.pcp.ann_stat.mmen.all; x6=[2015:5:2045];
z1=AM4.h0.sfc.pcp.ann_stat.mmen.all;  t1=[1950:5:2014];
z2=CM4.h1.sfc.pcp.ann_stat.mmen.all;  t2=[1850:5:2014];
z3=CM4.h2.sfc.pcp.ann_stat.mmen.all;  t3=[1850:5:2014];
z4=CM4.h3.sfc.pcp.ann_stat.mmen.all;  t4=[1850:5:2014];
z5=CM4.c0.sfc.pcp.ann_stat.mmen.all;  t5=[1700:5:1700+500-1];
z6=CM4.w0.sfc.pcp.ann_stat.mmen.all;  t6=[1851:5:2000];
Z1=SP4.c0.sfc.pcp.ann_stat.mmen.all;  T1=[1800:5:1800+200-1];
Z2=SP4.w0.sfc.pcp.ann_stat.mmen.all;  T2=[1851:5:1851+200-1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.5; fsize=16; lw1=2; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(x1,y1,    'k',   'LineWidth',lw1); hold on; 
plot(x2,y2,    'g',   'LineWidth',lw1); hold on; 
plot(x3,y3,    'c',   'LineWidth',lw1); hold on; 
plot(x4,y4,    'b',   'LineWidth',lw1); hold on; 
plot(x5,y5,    'r',   'LineWidth',lw1); hold on; 
plot(x6,y6,    'm',   'LineWidth',lw1); hold on; 
plot(t1,z1,    'k',   'LineWidth',lw2); hold on; 
plot(t2,z2,    'g',   'LineWidth',lw2); hold on; 
plot(t3,z3,    'c',   'LineWidth',lw2); hold on; 
plot(t4,z4,    'y',   'LineWidth',lw2); hold on; 
plot(t5,z5,    'b',   'LineWidth',lw2); hold on; 
plot(t6,z6,    'm',   'LineWidth',lw2); hold on; 
plot(T1,Z1,    'b--', 'LineWidth',lw3); hold on; 
plot(T2,Z2,    'r--', 'LineWidth',lw3); hold on; 
legend(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,2);
xlabel('year','FontSize',fsize); 
ylabel('global mean surface precipitation (mm/day)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1700 2200 2.85 3.2]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%TOA net radiative flux%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netradtoa'; s=AM4h.h0.s; lat=s.lat; lon=s.lon;
y1=AM4h.h0.toa.netrad.ann_stat.mmen.all; x1=[1950:5:2014];
y2=CM4h.h1.toa.netrad.ann_stat.mmen.all; x2=[1950:5:2014];
y3=CM4h.h2.toa.netrad.ann_stat.mmen.all; x3=[1950:5:2014];
y4=CM4h.c0.toa.netrad.ann_stat.mmen.all; x4=[1900:5:1900+155-1];
y5=CM4h.w0.toa.netrad.ann_stat.mmen.all; x5=[1900:5:1900+170-1];
y6=AM4h.w0.toa.netrad.ann_stat.mmen.all; x6=[2015:5:2049];
z1=AM4.h0.toa.netrad.ann_stat.mmen.all;  t1=[1950:5:2014];
z2=CM4.h1.toa.netrad.ann_stat.mmen.all;  t2=[1850:5:2014];
z3=CM4.h2.toa.netrad.ann_stat.mmen.all;  t3=[1850:5:2014];
z4=CM4.h3.toa.netrad.ann_stat.mmen.all;  t4=[1850:5:2014];
z5=CM4.c0.toa.netrad.ann_stat.mmen.all;  t5=[1700:5:1700+500-1];
z6=CM4.w0.toa.netrad.ann_stat.mmen.all;  t6=[1851:5:2000];
Z1=SP4.c0.toa.netrad.ann_stat.mmen.all;  T1=[1800:5:1800+200-1];
Z2=SP4.w0.toa.netrad.ann_stat.mmen.all;  T2=[1851:5:1851+200-1];
Y1=ESM4.h0.toa.netrad.ann_stat.mmen.all; t7=[1850:5:2014];
Y2=ESM4.c0.toa.netrad.ann_stat.mmen.all; t8=[1850:5:1850+300-1];
Y3=ESM4.w0.toa.netrad.ann_stat.mmen.all; t9=[1850:5:1850+300-1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.5; fsize=16; lw1=2; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(x1,y1,    'k',   'LineWidth',lw1); hold on; 
plot(x2,y2,    'g',   'LineWidth',lw1); hold on; 
plot(x3,y3,    'c',   'LineWidth',lw1); hold on; 
plot(x4,y4,    'b',   'LineWidth',lw1); hold on; 
plot(x5,y5,    'r',   'LineWidth',lw1); hold on; 
plot(x6,y6,    'm',   'LineWidth',lw1); hold on; 
plot(t1,z1,    'k',   'LineWidth',lw2); hold on; 
plot(t2,z2,    'g',   'LineWidth',lw2); hold on; 
plot(t3,z3,    'c',   'LineWidth',lw2); hold on; 
plot(t4,z4,    'y',   'LineWidth',lw2); hold on; 
plot(t5,z5,    'b',   'LineWidth',lw2); hold on; 
plot(t6,z6,    'm',   'LineWidth',lw2); hold on; 
plot(T1,Z1,    'b--', 'LineWidth',lw3); hold on; 
plot(T2,Z2,    'r--', 'LineWidth',lw3); hold on; 
plot(t7,Y1,    'k-',  'LineWidth',lw3); hold on; 
plot(t8,Y2,    'b-',  'LineWidth',lw3); hold on; 
plot(t9,Y3,    'r-',  'LineWidth',lw3); hold on; 
legend(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,3);
xlabel('year','FontSize',fsize); 
ylabel('TOA net radiative flux (W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1700 2200 -1.5 6]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%TOA net LW radiative flux%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet'; s=AM4h.h0.s; lat=s.lat; lon=s.lon;
y1=AM4h.h0.toa.lwnet.ann_stat.mmen.all; x1=[1950:5:2014];
y2=CM4h.h1.toa.lwnet.ann_stat.mmen.all; x2=[1950:5:2014];
y3=CM4h.h2.toa.lwnet.ann_stat.mmen.all; x3=[1950:5:2014];
y4=CM4h.c0.toa.lwnet.ann_stat.mmen.all; x4=[1900:5:1900+155-1];
y5=CM4h.w0.toa.lwnet.ann_stat.mmen.all; x5=[1900:5:1900+170-1];
y6=AM4h.w0.toa.lwnet.ann_stat.mmen.all; x6=[2015:5:2049];
z1=AM4.h0.toa.lwnet.ann_stat.mmen.all;  t1=[1950:5:2014];
z2=CM4.h1.toa.lwnet.ann_stat.mmen.all;  t2=[1850:5:2014];
z3=CM4.h2.toa.lwnet.ann_stat.mmen.all;  t3=[1850:5:2014];
z4=CM4.h3.toa.lwnet.ann_stat.mmen.all;  t4=[1850:5:2014];
z5=CM4.c0.toa.lwnet.ann_stat.mmen.all;  t5=[1700:5:1700+500-1];
z6=CM4.w0.toa.lwnet.ann_stat.mmen.all;  t6=[1851:5:2000];
Z1=SP4.c0.toa.lwnet.ann_stat.mmen.all;  T1=[1800:5:1800+200-1];
Z2=SP4.w0.toa.lwnet.ann_stat.mmen.all;  T2=[1851:5:1851+200-1];
Y1=ESM4.h0.toa.lwnet.ann_stat.mmen.all; t7=[1850:5:2014];
Y2=ESM4.c0.toa.lwnet.ann_stat.mmen.all; t8=[1850:5:1850+300-1];
Y3=ESM4.w0.toa.lwnet.ann_stat.mmen.all; t9=[1850:5:1850+300-1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.5; fsize=16; lw1=2; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(x1,y1,    'k',   'LineWidth',lw1); hold on; 
plot(x2,y2,    'g',   'LineWidth',lw1); hold on; 
plot(x3,y3,    'c',   'LineWidth',lw1); hold on; 
plot(x4,y4,    'b',   'LineWidth',lw1); hold on; 
plot(x5,y5,    'r',   'LineWidth',lw1); hold on; 
plot(x6,y6,    'm',   'LineWidth',lw1); hold on; 
plot(t1,z1,    'k',   'LineWidth',lw2); hold on; 
plot(t2,z2,    'g',   'LineWidth',lw2); hold on; 
plot(t3,z3,    'c',   'LineWidth',lw2); hold on; 
plot(t4,z4,    'y',   'LineWidth',lw2); hold on; 
plot(t5,z5,    'b',   'LineWidth',lw2); hold on; 
plot(t6,z6,    'm',   'LineWidth',lw2); hold on; 
plot(T1,Z1,    'b--', 'LineWidth',lw3); hold on; 
plot(T2,Z2,    'r--', 'LineWidth',lw3); hold on; 
plot(t7,Y1,    'k-',  'LineWidth',lw3); hold on; 
plot(t8,Y2,    'b-',  'LineWidth',lw3); hold on; 
plot(t9,Y3,    'r-',  'LineWidth',lw3); hold on; 
legend(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,2);
xlabel('year','FontSize',fsize); 
ylabel('TOA net LW radiative flux (W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1700 2200 236 244]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%TOA net SW radiative flux%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet'; s=AM4h.h0.s; lat=s.lat; lon=s.lon;
y1=AM4h.h0.toa.swnet.ann_stat.mmen.all; x1=[1950:5:2014];
y2=CM4h.h1.toa.swnet.ann_stat.mmen.all; x2=[1950:5:2014];
y3=CM4h.h2.toa.swnet.ann_stat.mmen.all; x3=[1950:5:2014];
y4=CM4h.c0.toa.swnet.ann_stat.mmen.all; x4=[1900:5:1900+155-1];
y5=CM4h.w0.toa.swnet.ann_stat.mmen.all; x5=[1900:5:1900+170-1];
y6=AM4h.w0.toa.swnet.ann_stat.mmen.all; x6=[2015:5:2049];
z1=AM4.h0.toa.swnet.ann_stat.mmen.all;  t1=[1950:5:2014];
z2=CM4.h1.toa.swnet.ann_stat.mmen.all;  t2=[1850:5:2014];
z3=CM4.h2.toa.swnet.ann_stat.mmen.all;  t3=[1850:5:2014];
z4=CM4.h3.toa.swnet.ann_stat.mmen.all;  t4=[1850:5:2014];
z5=CM4.c0.toa.swnet.ann_stat.mmen.all;  t5=[1700:5:1700+500-1];
z6=CM4.w0.toa.swnet.ann_stat.mmen.all;  t6=[1851:5:2000];
Z1=SP4.c0.toa.swnet.ann_stat.mmen.all;  T1=[1800:5:1800+200-1];
Z2=SP4.w0.toa.swnet.ann_stat.mmen.all;  T2=[1851:5:1851+200-1];
Y1=ESM4.h0.toa.swnet.ann_stat.mmen.all; t7=[1850:5:2014];
Y2=ESM4.c0.toa.swnet.ann_stat.mmen.all; t8=[1850:5:1850+300-1];
Y3=ESM4.w0.toa.swnet.ann_stat.mmen.all; t9=[1850:5:1850+300-1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.5; fsize=16; lw1=2; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(x1,y1,    'k',   'LineWidth',lw1); hold on; 
plot(x2,y2,    'g',   'LineWidth',lw1); hold on; 
plot(x3,y3,    'c',   'LineWidth',lw1); hold on; 
plot(x4,y4,    'b',   'LineWidth',lw1); hold on; 
plot(x5,y5,    'r',   'LineWidth',lw1); hold on; 
plot(x6,y6,    'm',   'LineWidth',lw1); hold on; 
plot(t1,z1,    'k',   'LineWidth',lw2); hold on; 
plot(t2,z2,    'g',   'LineWidth',lw2); hold on; 
plot(t3,z3,    'c',   'LineWidth',lw2); hold on; 
plot(t4,z4,    'y',   'LineWidth',lw2); hold on; 
plot(t5,z5,    'b',   'LineWidth',lw2); hold on; 
plot(t6,z6,    'm',   'LineWidth',lw2); hold on; 
plot(T1,Z1,    'b--', 'LineWidth',lw3); hold on; 
plot(T2,Z2,    'r--', 'LineWidth',lw3); hold on; 
plot(t7,Y1,    'k-',  'LineWidth',lw3); hold on; 
plot(t8,Y2,    'b-',  'LineWidth',lw3); hold on; 
plot(t9,Y3,    'r-',  'LineWidth',lw3); hold on; 
legend(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,2);
xlabel('year','FontSize',fsize); 
ylabel('TOA net SW radiative flux (W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1700 2200 237 246]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%TOA LW CRE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcf'; s=AM4h.h0.s; lat=s.lat; lon=s.lon;
y1=AM4h.h0.toa.lwcf.ann_stat.mmen.all; x1=[1950:5:2014];
y2=CM4h.h1.toa.lwcf.ann_stat.mmen.all; x2=[1950:5:2014];
y3=CM4h.h2.toa.lwcf.ann_stat.mmen.all; x3=[1950:5:2014];
y4=CM4h.c0.toa.lwcf.ann_stat.mmen.all; x4=[1900:5:1900+155-1];
y5=CM4h.w0.toa.lwcf.ann_stat.mmen.all; x5=[1900:5:1900+170-1];
y6=AM4h.w0.toa.lwcf.ann_stat.mmen.all; x6=[2015:5:2049];
z1=AM4.h0.toa.lwcf.ann_stat.mmen.all;  t1=[1950:5:2014];
z2=CM4.h1.toa.lwcf.ann_stat.mmen.all;  t2=[1850:5:2014];
z3=CM4.h2.toa.lwcf.ann_stat.mmen.all;  t3=[1850:5:2014];
z4=CM4.h3.toa.lwcf.ann_stat.mmen.all;  t4=[1850:5:2014];
z5=CM4.c0.toa.lwcf.ann_stat.mmen.all;  t5=[1700:5:1700+500-1];
z6=CM4.w0.toa.lwcf.ann_stat.mmen.all;  t6=[1851:5:2000];
Z1=SP4.c0.toa.lwcf.ann_stat.mmen.all;  T1=[1800:5:1800+200-1];
Z2=SP4.w0.toa.lwcf.ann_stat.mmen.all;  T2=[1851:5:1851+200-1];
Y1=ESM4.h0.toa.lwcf.ann_stat.mmen.all; t7=[1850:5:2014];
Y2=ESM4.c0.toa.lwcf.ann_stat.mmen.all; t8=[1850:5:1850+300-1];
Y3=ESM4.w0.toa.lwcf.ann_stat.mmen.all; t9=[1850:5:1850+300-1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.5; fsize=16; lw1=2; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(x1,y1,    'k',   'LineWidth',lw1); hold on; 
plot(x2,y2,    'g',   'LineWidth',lw1); hold on; 
plot(x3,y3,    'c',   'LineWidth',lw1); hold on; 
plot(x4,y4,    'b',   'LineWidth',lw1); hold on; 
plot(x5,y5,    'r',   'LineWidth',lw1); hold on; 
plot(x6,y6,    'm',   'LineWidth',lw1); hold on; 
plot(t1,z1,    'k',   'LineWidth',lw2); hold on; 
plot(t2,z2,    'g',   'LineWidth',lw2); hold on; 
plot(t3,z3,    'c',   'LineWidth',lw2); hold on; 
plot(t4,z4,    'y',   'LineWidth',lw2); hold on; 
plot(t5,z5,    'b',   'LineWidth',lw2); hold on; 
plot(t6,z6,    'm',   'LineWidth',lw2); hold on; 
plot(T1,Z1,    'b--', 'LineWidth',lw3); hold on; 
plot(T2,Z2,    'r--', 'LineWidth',lw3); hold on; 
plot(t7,Y1,    'k-',  'LineWidth',lw3); hold on; 
plot(t8,Y2,    'b-',  'LineWidth',lw3); hold on; 
plot(t9,Y3,    'r-',  'LineWidth',lw3); hold on; 
legend(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,3);
xlabel('year','FontSize',fsize); 
ylabel('TOA LW cloud radiative effect (W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1700 2200 22.5 25.5]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%TOA SW CRE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swcf'; s=AM4h.h0.s; lat=s.lat; lon=s.lon;
y1=AM4h.h0.toa.swcf.ann_stat.mmen.all; x1=[1950:5:2014];
y2=CM4h.h1.toa.swcf.ann_stat.mmen.all; x2=[1950:5:2014];
y3=CM4h.h2.toa.swcf.ann_stat.mmen.all; x3=[1950:5:2014];
y4=CM4h.c0.toa.swcf.ann_stat.mmen.all; x4=[1900:5:1900+155-1];
y5=CM4h.w0.toa.swcf.ann_stat.mmen.all; x5=[1900:5:1900+170-1];
y6=AM4h.w0.toa.swcf.ann_stat.mmen.all; x6=[2015:5:2049];
z1=AM4.h0.toa.swcf.ann_stat.mmen.all;  t1=[1950:5:2014];
z2=CM4.h1.toa.swcf.ann_stat.mmen.all;  t2=[1850:5:2014];
z3=CM4.h2.toa.swcf.ann_stat.mmen.all;  t3=[1850:5:2014];
z4=CM4.h3.toa.swcf.ann_stat.mmen.all;  t4=[1850:5:2014];
z5=CM4.c0.toa.swcf.ann_stat.mmen.all;  t5=[1700:5:1700+500-1];
z6=CM4.w0.toa.swcf.ann_stat.mmen.all;  t6=[1851:5:2000];
Z1=SP4.c0.toa.swcf.ann_stat.mmen.all;  T1=[1800:5:1800+200-1];
Z2=SP4.w0.toa.swcf.ann_stat.mmen.all;  T2=[1851:5:1851+200-1];
Y1=ESM4.h0.toa.swcf.ann_stat.mmen.all; t7=[1850:5:2014];
Y2=ESM4.c0.toa.swcf.ann_stat.mmen.all; t8=[1850:5:1850+300-1];
Y3=ESM4.w0.toa.swcf.ann_stat.mmen.all; t9=[1850:5:1850+300-1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.5; fsize=16; lw1=2; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(x1,y1,    'k',   'LineWidth',lw1); hold on; 
plot(x2,y2,    'g',   'LineWidth',lw1); hold on; 
plot(x3,y3,    'c',   'LineWidth',lw1); hold on; 
plot(x4,y4,    'b',   'LineWidth',lw1); hold on; 
plot(x5,y5,    'r',   'LineWidth',lw1); hold on; 
plot(x6,y6,    'm',   'LineWidth',lw1); hold on; 
plot(t1,z1,    'k',   'LineWidth',lw2); hold on; 
plot(t2,z2,    'g',   'LineWidth',lw2); hold on; 
plot(t3,z3,    'c',   'LineWidth',lw2); hold on; 
plot(t4,z4,    'y',   'LineWidth',lw2); hold on; 
plot(t5,z5,    'b',   'LineWidth',lw2); hold on; 
plot(t6,z6,    'm',   'LineWidth',lw2); hold on; 
plot(T1,Z1,    'b--', 'LineWidth',lw3); hold on; 
plot(T2,Z2,    'r--', 'LineWidth',lw3); hold on; 
plot(t7,Y1,    'k-',  'LineWidth',lw3); hold on; 
plot(t8,Y2,    'b-',  'LineWidth',lw3); hold on; 
plot(t9,Y3,    'r-',  'LineWidth',lw3); hold on; 
legend(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,3);
xlabel('year','FontSize',fsize); 
ylabel('TOA SW cloud radiative effect (W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1700 2200 -49.5 -46.5]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%TOA net LW clear-sky radiative flux%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_clr'; s=AM4h.h0.s; lat=s.lat; lon=s.lon;
y1=AM4h.h0.toa.lwnet_clr.ann_stat.mmen.all; x1=[1950:5:2014];
y2=CM4h.h1.toa.lwnet_clr.ann_stat.mmen.all; x2=[1950:5:2014];
y3=CM4h.h2.toa.lwnet_clr.ann_stat.mmen.all; x3=[1950:5:2014];
y4=CM4h.c0.toa.lwnet_clr.ann_stat.mmen.all; x4=[1900:5:1900+155-1];
y5=CM4h.w0.toa.lwnet_clr.ann_stat.mmen.all; x5=[1900:5:1900+170-1];
y6=AM4h.w0.toa.lwnet_clr.ann_stat.mmen.all; x6=[2015:5:2049];
z1=AM4.h0.toa.lwnet_clr.ann_stat.mmen.all;  t1=[1950:5:2014];
z2=CM4.h1.toa.lwnet_clr.ann_stat.mmen.all;  t2=[1850:5:2014];
z3=CM4.h2.toa.lwnet_clr.ann_stat.mmen.all;  t3=[1850:5:2014];
z4=CM4.h3.toa.lwnet_clr.ann_stat.mmen.all;  t4=[1850:5:2014];
z5=CM4.c0.toa.lwnet_clr.ann_stat.mmen.all;  t5=[1700:5:1700+500-1];
z6=CM4.w0.toa.lwnet_clr.ann_stat.mmen.all;  t6=[1851:5:2000];
Z1=SP4.c0.toa.lwnet_clr.ann_stat.mmen.all;  T1=[1800:5:1800+200-1];
Z2=SP4.w0.toa.lwnet_clr.ann_stat.mmen.all;  T2=[1851:5:1851+200-1];
Y1=ESM4.h0.toa.lwnet_clr.ann_stat.mmen.all; t7=[1850:5:2014];
Y2=ESM4.c0.toa.lwnet_clr.ann_stat.mmen.all; t8=[1850:5:1850+300-1];
Y3=ESM4.w0.toa.lwnet_clr.ann_stat.mmen.all; t9=[1850:5:1850+300-1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.5; fsize=16; lw1=2; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(x1,y1,    'k',   'LineWidth',lw1); hold on; 
plot(x2,y2,    'g',   'LineWidth',lw1); hold on; 
plot(x3,y3,    'c',   'LineWidth',lw1); hold on; 
plot(x4,y4,    'b',   'LineWidth',lw1); hold on; 
plot(x5,y5,    'r',   'LineWidth',lw1); hold on; 
plot(x6,y6,    'm',   'LineWidth',lw1); hold on; 
plot(t1,z1,    'k',   'LineWidth',lw2); hold on; 
plot(t2,z2,    'g',   'LineWidth',lw2); hold on; 
plot(t3,z3,    'c',   'LineWidth',lw2); hold on; 
plot(t4,z4,    'y',   'LineWidth',lw2); hold on; 
plot(t5,z5,    'b',   'LineWidth',lw2); hold on; 
plot(t6,z6,    'm',   'LineWidth',lw2); hold on; 
plot(T1,Z1,    'b--', 'LineWidth',lw3); hold on; 
plot(T2,Z2,    'r--', 'LineWidth',lw3); hold on; 
plot(t7,Y1,    'k-',  'LineWidth',lw3); hold on; 
plot(t8,Y2,    'b-',  'LineWidth',lw3); hold on; 
plot(t9,Y3,    'r-',  'LineWidth',lw3); hold on; 
legend(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,2);
xlabel('year','FontSize',fsize); 
ylabel('TOA net LW clear-sky radiative flux (W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1700 2200 259 268]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%TOA net SW clear-sky radiative flux%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet_clr'; s=AM4h.h0.s; lat=s.lat; lon=s.lon;
y1=AM4h.h0.toa.swnet_clr.ann_stat.mmen.all; x1=[1950:5:2014];
y2=CM4h.h1.toa.swnet_clr.ann_stat.mmen.all; x2=[1950:5:2014];
y3=CM4h.h2.toa.swnet_clr.ann_stat.mmen.all; x3=[1950:5:2014];
y4=CM4h.c0.toa.swnet_clr.ann_stat.mmen.all; x4=[1900:5:1900+155-1];
y5=CM4h.w0.toa.swnet_clr.ann_stat.mmen.all; x5=[1900:5:1900+170-1];
y6=AM4h.w0.toa.swnet_clr.ann_stat.mmen.all; x6=[2015:5:2049];
z1=AM4.h0.toa.swnet_clr.ann_stat.mmen.all;  t1=[1950:5:2014];
z2=CM4.h1.toa.swnet_clr.ann_stat.mmen.all;  t2=[1850:5:2014];
z3=CM4.h2.toa.swnet_clr.ann_stat.mmen.all;  t3=[1850:5:2014];
z4=CM4.h3.toa.swnet_clr.ann_stat.mmen.all;  t4=[1850:5:2014];
z5=CM4.c0.toa.swnet_clr.ann_stat.mmen.all;  t5=[1700:5:1700+500-1];
z6=CM4.w0.toa.swnet_clr.ann_stat.mmen.all;  t6=[1851:5:2000];
Z1=SP4.c0.toa.swnet_clr.ann_stat.mmen.all;  T1=[1800:5:1800+200-1];
Z2=SP4.w0.toa.swnet_clr.ann_stat.mmen.all;  T2=[1851:5:1851+200-1];
Y1=ESM4.h0.toa.swnet_clr.ann_stat.mmen.all; t7=[1850:5:2014];
Y2=ESM4.c0.toa.swnet_clr.ann_stat.mmen.all; t8=[1850:5:1850+300-1];
Y3=ESM4.w0.toa.swnet_clr.ann_stat.mmen.all; t9=[1850:5:1850+300-1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.5; fsize=16; lw1=2; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(x1,y1,    'k',   'LineWidth',lw1); hold on; 
plot(x2,y2,    'g',   'LineWidth',lw1); hold on; 
plot(x3,y3,    'c',   'LineWidth',lw1); hold on; 
plot(x4,y4,    'b',   'LineWidth',lw1); hold on; 
plot(x5,y5,    'r',   'LineWidth',lw1); hold on; 
plot(x6,y6,    'm',   'LineWidth',lw1); hold on; 
plot(t1,z1,    'k',   'LineWidth',lw2); hold on; 
plot(t2,z2,    'g',   'LineWidth',lw2); hold on; 
plot(t3,z3,    'c',   'LineWidth',lw2); hold on; 
plot(t4,z4,    'y',   'LineWidth',lw2); hold on; 
plot(t5,z5,    'b',   'LineWidth',lw2); hold on; 
plot(t6,z6,    'm',   'LineWidth',lw2); hold on; 
plot(T1,Z1,    'b--', 'LineWidth',lw3); hold on; 
plot(T2,Z2,    'r--', 'LineWidth',lw3); hold on; 
plot(t7,Y1,    'k-',  'LineWidth',lw3); hold on; 
plot(t8,Y2,    'b-',  'LineWidth',lw3); hold on; 
plot(t9,Y3,    'r-',  'LineWidth',lw3); hold on; 
legend(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,2);
xlabel('year','FontSize',fsize); 
ylabel('TOA net SW clear-sky radiative flux (W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1700 2200 286 293]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ice'; s=AM4h.h0.s; lat=s.lat; lon=s.lon;
y1=AM4h.h0.sfc.ice.ann_stat.mmen.all; x1=[1950:5:2014];
y2=CM4h.h1.sfc.ice.ann_stat.mmen.all; x2=[1950:5:2014];
y3=CM4h.h2.sfc.ice.ann_stat.mmen.all; x3=[1950:5:2014];
y4=CM4h.c0.sfc.ice.ann_stat.mmen.all; x4=[1900:5:1900+155-1];
y5=CM4h.w0.sfc.ice.ann_stat.mmen.all; x5=[1900:5:1900+170-1];
y6=AM4h.w0.sfc.ice.ann_stat.mmen.all; x6=[2015:5:2049];
z1=y1;%AM4.h0.sfc.ice.ann_stat.mmen.all;  t1=[1950:5:2014];
z2=CM4.h1.sfc.ice.ann_stat.mmen.all;  t2=[1850:5:2014];
z3=CM4.h2.sfc.ice.ann_stat.mmen.all;  t3=[1850:5:2014];
z4=CM4.h3.sfc.ice.ann_stat.mmen.all;  t4=[1850:5:2014];
z5=CM4.c0.sfc.ice.ann_stat.mmen.all;  t5=[1700:5:1700+500-1];
z6=CM4.w0.sfc.ice.ann_stat.mmen.all;  t6=[1851:5:2000];
Z1=SP4.c0.sfc.ice.ann_stat.mmen.all;  T1=[1800:5:1800+200-1];
Z2=SP4.w0.sfc.ice.ann_stat.mmen.all;  T2=[1851:5:1851+200-1];
Y1=ESM4.h0.sfc.ice.ann_stat.mmen.all; t7=[1850:5:2014];
Y2=ESM4.c0.sfc.ice.ann_stat.mmen.all; t8=[1850:5:1850+300-1];
Y3=ESM4.w0.sfc.ice.ann_stat.mmen.all; t9=[1850:5:1850+300-1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.5; fsize=16; lw1=2; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(x1,y1,    'k',   'LineWidth',lw1); hold on; 
plot(x2,y2,    'g',   'LineWidth',lw1); hold on; 
plot(x3,y3,    'c',   'LineWidth',lw1); hold on; 
plot(x4,y4,    'b',   'LineWidth',lw1); hold on; 
plot(x5,y5,    'r',   'LineWidth',lw1); hold on; 
plot(x6,y6,    'm',   'LineWidth',lw1); hold on; 
plot(t1,z1,    'k',   'LineWidth',lw2); hold on; 
plot(t2,z2,    'g',   'LineWidth',lw2); hold on; 
plot(t3,z3,    'c',   'LineWidth',lw2); hold on; 
plot(t4,z4,    'y',   'LineWidth',lw2); hold on; 
plot(t5,z5,    'b',   'LineWidth',lw2); hold on; 
plot(t6,z6,    'm',   'LineWidth',lw2); hold on; 
plot(T1,Z1,    'b--', 'LineWidth',lw3); hold on; 
plot(T2,Z2,    'r--', 'LineWidth',lw3); hold on; 
plot(t7,Y1,    'k-',  'LineWidth',lw3); hold on; 
plot(t8,Y2,    'b-',  'LineWidth',lw3); hold on; 
plot(t9,Y3,    'r-',  'LineWidth',lw3); hold on; 
legend(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,3);
xlabel('year','FontSize',fsize); 
ylabel('global sea-ice concentration','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1700 2200 0 0.06]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%high cloud amount%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qah'; s=AM4h.h0.s; lat=s.lat; lon=s.lon;
y1=AM4h.h0.atm.qah.ann_stat.mmen.all; x1=[1950:5:2014];
y2=CM4h.h1.atm.qah.ann_stat.mmen.all; x2=[1950:5:2014];
y3=CM4h.h2.atm.qah.ann_stat.mmen.all; x3=[1950:5:2014];
y4=CM4h.c0.atm.qah.ann_stat.mmen.all; x4=[1900:5:1900+155-1];
y5=CM4h.w0.atm.qah.ann_stat.mmen.all; x5=[1900:5:1900+170-1];
y6=AM4h.w0.atm.qah.ann_stat.mmen.all; x6=[2015:5:2049];
z1=AM4.h0.atm.qah.ann_stat.mmen.all;  t1=[1950:5:2014];
z2=CM4.h1.atm.qah.ann_stat.mmen.all;  t2=[1850:5:2014];
z3=CM4.h2.atm.qah.ann_stat.mmen.all;  t3=[1850:5:2014];
z4=CM4.h3.atm.qah.ann_stat.mmen.all;  t4=[1850:5:2014];
z5=CM4.c0.atm.qah.ann_stat.mmen.all;  t5=[1700:5:1700+500-1];
z6=CM4.w0.atm.qah.ann_stat.mmen.all;  t6=[1851:5:2000];
Z1=SP4.c0.atm.qah.ann_stat.mmen.all;  T1=[1800:5:1800+200-1];
Z2=SP4.w0.atm.qah.ann_stat.mmen.all;  T2=[1851:5:1851+200-1];
Y1=ESM4.h0.atm.qah.ann_stat.mmen.all; t7=[1850:5:2014];
Y2=ESM4.c0.atm.qah.ann_stat.mmen.all; t8=[1850:5:1850+300-1];
Y3=ESM4.w0.atm.qah.ann_stat.mmen.all; t9=[1850:5:1850+300-1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.5; fsize=16; lw1=2; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(x1,y1,    'k',   'LineWidth',lw1); hold on; 
plot(x2,y2,    'g',   'LineWidth',lw1); hold on; 
plot(x3,y3,    'c',   'LineWidth',lw1); hold on; 
plot(x4,y4,    'b',   'LineWidth',lw1); hold on; 
plot(x5,y5,    'r',   'LineWidth',lw1); hold on; 
plot(x6,y6,    'm',   'LineWidth',lw1); hold on; 
plot(t1,z1,    'k',   'LineWidth',lw2); hold on; 
plot(t2,z2,    'g',   'LineWidth',lw2); hold on; 
plot(t3,z3,    'c',   'LineWidth',lw2); hold on; 
plot(t4,z4,    'y',   'LineWidth',lw2); hold on; 
plot(t5,z5,    'b',   'LineWidth',lw2); hold on; 
plot(t6,z6,    'm',   'LineWidth',lw2); hold on; 
plot(T1,Z1,    'b--', 'LineWidth',lw3); hold on; 
plot(T2,Z2,    'r--', 'LineWidth',lw3); hold on; 
plot(t7,Y1,    'k-',  'LineWidth',lw3); hold on; 
plot(t8,Y2,    'b-',  'LineWidth',lw3); hold on; 
plot(t9,Y3,    'r-',  'LineWidth',lw3); hold on; 
legend(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,3);
xlabel('year','FontSize',fsize); 
ylabel('high cloud amount (%)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1700 2200 36 39.5]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Gregory plot for netradtoa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='greg_netradtoa';
y1=CM4h.c0.sfc.tref.ann_stat.mmen.all;   y1_avg=mean(y1(4:end));
y2=CM4h.w0.sfc.tref.ann_stat.mmen.all;   y2=y2-y1_avg;
y3=CM4.c0.sfc.tref.ann_stat.mmen.all;    y3_avg=mean(y3(30:80));
y4=CM4.w0.sfc.tref.ann_stat.mmen.all;    y4=y4-y3_avg;
y5=SP4.c0.sfc.tref.ann_stat.mmen.all;    y5_avg=mean(y5(10:30));
y6=SP4.w0.sfc.tref.ann_stat.mmen.all;    y6=y6-y5_avg;
y7=ESM4.c0.sfc.tref.ann_stat.mmen.all;   y7_avg=mean(y7(10:30));
y8=ESM4.w0.sfc.tref.ann_stat.mmen.all;   y8=y8-y7_avg;
z1=CM4h.c0.toa.netrad.ann_stat.mmen.all; z1_avg=mean(z1(4:end));
z2=CM4h.w0.toa.netrad.ann_stat.mmen.all; z2=z2-z1_avg;
z3=CM4.c0.toa.netrad.ann_stat.mmen.all;  z3_avg=mean(z3(30:80));
z4=CM4.w0.toa.netrad.ann_stat.mmen.all;  z4=z4-z3_avg;
z5=SP4.c0.toa.netrad.ann_stat.mmen.all;  z5_avg=mean(z5(10:30));
z6=SP4.w0.toa.netrad.ann_stat.mmen.all;  z6=z6-z5_avg;
z7=ESM4.c0.toa.netrad.ann_stat.mmen.all; z7_avg=mean(z7(10:30));
z8=ESM4.w0.toa.netrad.ann_stat.mmen.all; z8=z8-z7_avg;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t1=1;  t2=10; x2 =getcorrslop(y2(t1:t2),z2(t1:t2));
t1=11; t2=34; xx2=getcorrslop(y2(t1:t2),z2(t1:t2));
t1=1;  t2=10; x4 =getcorrslop(y4(t1:t2),z4(t1:t2));
t1=11; t2=30; xx4=getcorrslop(y4(t1:t2),z4(t1:t2));
t1=1;  t2=10; x6 =getcorrslop(y6(t1:t2),z6(t1:t2));
t1=11; t2=40; xx6=getcorrslop(y6(t1:t2),z6(t1:t2));
t1=1;  t2=10; x8 =getcorrslop(y8(t1:t2),z8(t1:t2));
t1=11; t2=40; xx8=getcorrslop(y8(t1:t2),z8(t1:t2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 800, 700]*1.5; fsize=16; msize=16; lw1=2; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(y2,z2, 'r.','MarkerSize',msize); hold on; 
plot(y4,z4, 'g.','MarkerSize',msize); hold on; 
plot(y6,z6, 'b.','MarkerSize',msize); hold on; 
plot(y8,z8, 'k.','MarkerSize',msize); hold on; 
v=x2;  plot(v.xa,v.ya,'r:', 'LineWidth',lw1);
v=xx2; plot(v.xb,v.yb,'r--','LineWidth',lw1);
v=x4;  plot(v.xa,v.ya,'g:', 'LineWidth',lw1);
v=xx4; plot(v.xb,v.yb,'g--','LineWidth',lw1);
v=x6;  plot(v.xa,v.ya,'b:', 'LineWidth',lw1);
v=xx6; plot(v.xb,v.yb,'b--','LineWidth',lw1);
v=x8;  plot(v.xa,v.ya,'k:', 'LineWidth',lw1);
v=xx8; plot(v.xb,v.yb,'k--','LineWidth',lw1);
legend('C192CM4','CM4','SPEAR','ESM4',1);
xlabel('global surface air temperature anomaly (K)','FontSize',fsize); 
ylabel('TOA net radiative flux anomaly (W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([0 10 0 8.5]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Gregory plot for CRE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='greg_ttcf';
y1=CM4h.c0.sfc.tref.ann_stat.mmen.all;   y1_avg=mean(y1(4:end));
y2=CM4h.w0.sfc.tref.ann_stat.mmen.all;   y2=y2-y1_avg;
y3=CM4.c0.sfc.tref.ann_stat.mmen.all;    y3_avg=mean(y3(30:80));
y4=CM4.w0.sfc.tref.ann_stat.mmen.all;    y4=y4-y3_avg;
y5=SP4.c0.sfc.tref.ann_stat.mmen.all;    y5_avg=mean(y5(10:30));
y6=SP4.w0.sfc.tref.ann_stat.mmen.all;    y6=y6-y5_avg;
y7=ESM4.c0.sfc.tref.ann_stat.mmen.all;   y7_avg=mean(y7(10:30));
y8=ESM4.w0.sfc.tref.ann_stat.mmen.all;   y8=y8-y7_avg;
z1=CM4h.c0.toa.ttcf.ann_stat.mmen.all;   z1_avg=mean(z1(4:end));
z2=CM4h.w0.toa.ttcf.ann_stat.mmen.all;   z2=z2-z1_avg;
z3=CM4.c0.toa.ttcf.ann_stat.mmen.all;    z3_avg=mean(z3(30:80));
z4=CM4.w0.toa.ttcf.ann_stat.mmen.all;    z4=z4-z3_avg;
z5=SP4.c0.toa.ttcf.ann_stat.mmen.all;    z5_avg=mean(z5(10:30));
z6=SP4.w0.toa.ttcf.ann_stat.mmen.all;    z6=z6-z5_avg;
z7=ESM4.c0.toa.ttcf.ann_stat.mmen.all;   z7_avg=mean(z7(10:30));
z8=ESM4.w0.toa.ttcf.ann_stat.mmen.all;   z8=z8-z7_avg;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t1=1;  t2=10; x2 =getcorrslop(y2(t1:t2),z2(t1:t2));
t1=11; t2=34; xx2=getcorrslop(y2(t1:t2),z2(t1:t2));
t1=1;  t2=10; x4 =getcorrslop(y4(t1:t2),z4(t1:t2));
t1=11; t2=30; xx4=getcorrslop(y4(t1:t2),z4(t1:t2));
t1=1;  t2=10; x6 =getcorrslop(y6(t1:t2),z6(t1:t2));
t1=11; t2=40; xx6=getcorrslop(y6(t1:t2),z6(t1:t2));
t1=1;  t2=10; x8 =getcorrslop(y8(t1:t2),z8(t1:t2));
t1=11; t2=40; xx8=getcorrslop(y8(t1:t2),z8(t1:t2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 800, 700]*1; fsize=16; msize=16; lw1=2; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(y2,z2, 'r.','MarkerSize',msize); hold on; 
plot(y4,z4, 'g.','MarkerSize',msize); hold on; 
plot(y6,z6, 'b.','MarkerSize',msize); hold on; 
plot(y8,z8, 'k.','MarkerSize',msize); hold on; 
v=x2;  plot(v.xa,v.ya,'r:', 'LineWidth',lw1);
v=xx2; plot(v.xb,v.yb,'r--','LineWidth',lw1);
v=x4;  plot(v.xa,v.ya,'g:', 'LineWidth',lw1);
v=xx4; plot(v.xb,v.yb,'g--','LineWidth',lw1);
v=x6;  plot(v.xa,v.ya,'b:', 'LineWidth',lw1);
v=xx6; plot(v.xb,v.yb,'b--','LineWidth',lw1);
v=x8;  plot(v.xa,v.ya,'k:', 'LineWidth',lw1);
v=xx8; plot(v.xb,v.yb,'k--','LineWidth',lw1);
legend('C192CM4','CM4','SPEAR','ESM4',2);
xlabel('global surface air temperature anomaly (K)','FontSize',fsize); 
ylabel('TOA cloud radiative effect anomaly (W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([0 10 -3 3]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Gregory plot for SWCF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='greg_swcf';
y1=CM4h.c0.sfc.tref.ann_stat.mmen.all;   y1_avg=mean(y1(4:end));
y2=CM4h.w0.sfc.tref.ann_stat.mmen.all;   y2=y2-y1_avg;
y3=CM4.c0.sfc.tref.ann_stat.mmen.all;    y3_avg=mean(y3(30:80));
y4=CM4.w0.sfc.tref.ann_stat.mmen.all;    y4=y4-y3_avg;
y5=SP4.c0.sfc.tref.ann_stat.mmen.all;    y5_avg=mean(y5(10:30));
y6=SP4.w0.sfc.tref.ann_stat.mmen.all;    y6=y6-y5_avg;
y7=ESM4.c0.sfc.tref.ann_stat.mmen.all;   y7_avg=mean(y7(10:30));
y8=ESM4.w0.sfc.tref.ann_stat.mmen.all;   y8=y8-y7_avg;
z1=CM4h.c0.toa.swcf.ann_stat.mmen.all;   z1_avg=mean(z1(4:end));
z2=CM4h.w0.toa.swcf.ann_stat.mmen.all;   z2=z2-z1_avg;
z3=CM4.c0.toa.swcf.ann_stat.mmen.all;    z3_avg=mean(z3(30:80));
z4=CM4.w0.toa.swcf.ann_stat.mmen.all;    z4=z4-z3_avg;
z5=SP4.c0.toa.swcf.ann_stat.mmen.all;    z5_avg=mean(z5(10:30));
z6=SP4.w0.toa.swcf.ann_stat.mmen.all;    z6=z6-z5_avg;
z7=ESM4.c0.toa.swcf.ann_stat.mmen.all;   z7_avg=mean(z7(10:30));
z8=ESM4.w0.toa.swcf.ann_stat.mmen.all;   z8=z8-z7_avg;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t1=1;  t2=10; x2 =getcorrslop(y2(t1:t2),z2(t1:t2));
t1=11; t2=34; xx2=getcorrslop(y2(t1:t2),z2(t1:t2));
t1=1;  t2=10; x4 =getcorrslop(y4(t1:t2),z4(t1:t2));
t1=11; t2=30; xx4=getcorrslop(y4(t1:t2),z4(t1:t2));
t1=1;  t2=10; x6 =getcorrslop(y6(t1:t2),z6(t1:t2));
t1=11; t2=40; xx6=getcorrslop(y6(t1:t2),z6(t1:t2));
t1=1;  t2=10; x8 =getcorrslop(y8(t1:t2),z8(t1:t2));
t1=11; t2=40; xx8=getcorrslop(y8(t1:t2),z8(t1:t2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 800, 700]*1; fsize=16; msize=16; lw1=2; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(y2,z2, 'r.','MarkerSize',msize); hold on; 
plot(y4,z4, 'g.','MarkerSize',msize); hold on; 
plot(y6,z6, 'b.','MarkerSize',msize); hold on; 
plot(y8,z8, 'k.','MarkerSize',msize); hold on; 
v=x2;  plot(v.xa,v.ya,'r:', 'LineWidth',lw1);
v=xx2; plot(v.xb,v.yb,'r--','LineWidth',lw1);
v=x4;  plot(v.xa,v.ya,'g:', 'LineWidth',lw1);
v=xx4; plot(v.xb,v.yb,'g--','LineWidth',lw1);
v=x6;  plot(v.xa,v.ya,'b:', 'LineWidth',lw1);
v=xx6; plot(v.xb,v.yb,'b--','LineWidth',lw1);
v=x8;  plot(v.xa,v.ya,'k:', 'LineWidth',lw1);
v=xx8; plot(v.xb,v.yb,'k--','LineWidth',lw1);
legend('C192CM4','CM4','SPEAR','ESM4',3);
xlabel('global surface air temperature anomaly (K)','FontSize',fsize); 
ylabel('TOA SW cloud radiative effect anomaly (W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([0 7 -1 2]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Gregory plot for LWCF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='greg_lwcf';
y1=CM4h.c0.sfc.tref.ann_stat.mmen.all;   y1_avg=mean(y1(4:end));
y2=CM4h.w0.sfc.tref.ann_stat.mmen.all;   y2=y2-y1_avg;
y3=CM4.c0.sfc.tref.ann_stat.mmen.all;    y3_avg=mean(y3(30:80));
y4=CM4.w0.sfc.tref.ann_stat.mmen.all;    y4=y4-y3_avg;
y5=SP4.c0.sfc.tref.ann_stat.mmen.all;    y5_avg=mean(y5(10:30));
y6=SP4.w0.sfc.tref.ann_stat.mmen.all;    y6=y6-y5_avg;
y7=ESM4.c0.sfc.tref.ann_stat.mmen.all;   y7_avg=mean(y7(10:30));
y8=ESM4.w0.sfc.tref.ann_stat.mmen.all;   y8=y8-y7_avg;
z1=CM4h.c0.toa.lwcf.ann_stat.mmen.all;   z1_avg=mean(z1(4:end));
z2=CM4h.w0.toa.lwcf.ann_stat.mmen.all;   z2=z2-z1_avg;
z3=CM4.c0.toa.lwcf.ann_stat.mmen.all;    z3_avg=mean(z3(30:80));
z4=CM4.w0.toa.lwcf.ann_stat.mmen.all;    z4=z4-z3_avg;
z5=SP4.c0.toa.lwcf.ann_stat.mmen.all;    z5_avg=mean(z5(10:30));
z6=SP4.w0.toa.lwcf.ann_stat.mmen.all;    z6=z6-z5_avg;
z7=ESM4.c0.toa.lwcf.ann_stat.mmen.all;   z7_avg=mean(z7(10:30));
z8=ESM4.w0.toa.lwcf.ann_stat.mmen.all;   z8=z8-z7_avg;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t1=1;  t2=10; x2 =getcorrslop(y2(t1:t2),z2(t1:t2));
t1=11; t2=34; xx2=getcorrslop(y2(t1:t2),z2(t1:t2));
t1=1;  t2=10; x4 =getcorrslop(y4(t1:t2),z4(t1:t2));
t1=11; t2=30; xx4=getcorrslop(y4(t1:t2),z4(t1:t2));
t1=1;  t2=10; x6 =getcorrslop(y6(t1:t2),z6(t1:t2));
t1=11; t2=40; xx6=getcorrslop(y6(t1:t2),z6(t1:t2));
t1=1;  t2=10; x8 =getcorrslop(y8(t1:t2),z8(t1:t2));
t1=11; t2=40; xx8=getcorrslop(y8(t1:t2),z8(t1:t2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 800, 700]*1; fsize=16; msize=16; lw1=2; lw2=1; lw3=3;
handle=figure('Position',pms,'visible','on');
plot(y2,z2, 'r.','MarkerSize',msize); hold on; 
plot(y4,z4, 'g.','MarkerSize',msize); hold on; 
plot(y6,z6, 'b.','MarkerSize',msize); hold on; 
plot(y8,z8, 'k.','MarkerSize',msize); hold on; 
v=x2;  plot(v.xa,v.ya,'r:', 'LineWidth',lw1);
v=xx2; plot(v.xb,v.yb,'r--','LineWidth',lw1);
v=x4;  plot(v.xa,v.ya,'g:', 'LineWidth',lw1);
v=xx4; plot(v.xb,v.yb,'g--','LineWidth',lw1);
v=x6;  plot(v.xa,v.ya,'b:', 'LineWidth',lw1);
v=xx6; plot(v.xb,v.yb,'b--','LineWidth',lw1);
v=x8;  plot(v.xa,v.ya,'k:', 'LineWidth',lw1);
v=xx8; plot(v.xb,v.yb,'k--','LineWidth',lw1);
legend('C192CM4','CM4','SPEAR','ESM4',2);
xlabel('global surface air temperature anomaly (K)','FontSize',fsize); 
ylabel('TOA LW cloud radiative effect anomaly (W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([0 7 -2 1]);
visfig='off'; figpath='./fig_hiresmip/'; expn='hiresmip';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lon=s.lon; lat=s.lat;
t1=31; t2=65; t=[t1:t2]; 
A=squeeze(AM4.h0.sfc.tsurf.all(t1:t2,:,:,:));
AM4.h0.tsurf_trend = get_mytrend(A,t);

A=squeeze(CM4h.h1.sfc.tsurf.all(t1:t2,:,:,:));
CM4h.h1.tsurf_trend = get_mytrend(A,t);

t1=131; t2=165; t=[t1:t2]; 
A=squeeze(CM4.h1.sfc.tsurf.all(t1:t2,:,:,:));
CM4.h1.tsurf_trend = get_mytrend(A,t);

t1=1; t2=2; t=[t1:t2]; 
A=squeeze(CM4.w0.sfc.tsurf.all(t1:t2,:,:,:));  CM4.w0.tsurf_trend = get_mytrend(A,t);
A=squeeze(ESM4.w0.sfc.tsurf.all(t1:t2,:,:,:)); ESM4.w0.tsurf_trend= get_mytrend(A,t);

y0=ESM4.w0.tsurf_trend.ann;  cmin=-2; cmax=2;
figure; pcolor(lon,lat,y0); caxis([cmin cmax]); shading flat; colorbar; 
y1=CM4.w0.tsurf_trend.ann; 
figure; pcolor(lon,lat,y1); caxis([cmin cmax]); shading flat; colorbar; 


figure; pcolor(lon,lat,y0-y1); caxis([cmin cmax]); shading flat; colorbar; 


y0=CM4.h1.tsurf_trend.ann; 
figure; pcolor(lon,lat,y0); caxis([-0.2 0.2]); shading flat; colorbar; 
y0=CM4h.h1.tsurf_trend.ann; 
figure; pcolor(lon,lat,y0); caxis([-0.2 0.2]); shading flat; colorbar; 



y0=AM4.h0.tsurf_trend.ann; 
figure; pcolor(lon,lat,y0); caxis([-0.2 0.2]); shading flat; colorbar; 
y0=CM4.h1.tsurf_trend.ann; 
figure; pcolor(lon,lat,y0); caxis([-0.2 0.2]); shading flat; colorbar; 
y0=CM4h.h1.tsurf_trend.ann; 
figure; pcolor(lon,lat,y0); caxis([-0.2 0.2]); shading flat; colorbar; 

t1=1; t2=10; t=[t1:t2]; 
A=squeeze(CM4.w0.sfc.tsurf.all(t1:t2,:,:,:));
CM4.w0.tsurf_trend = get_mytrend(A,t);

t1=1; t2=10; t=[t1:t2]; 
A=squeeze(SP4.w0.sfc.tsurf.all(t1:t2,:,:,:));
SP4.w0.tsurf_trend = get_mytrend(A,t);

y0=CM4.w0.tsurf_trend.ann; 
figure; pcolor(lon,lat,y0); caxis([-0.5 0.5]); shading flat; colorbar; 
y0=SP4.w0.tsurf_trend.ann; 
figure; pcolor(lon,lat,y0); caxis([-0.5 0.5]); shading flat; colorbar; 

y0=SP4.w0.tsurf_trend.ann-CM4.w0.tsurf_trend.ann; 
figure; pcolor(lon,lat,y0); caxis([-0.5 0.5]); shading flat; colorbar; 

y=AM4.h0.tsurf_trend.mon; 
for m=1:12;
  figure;
  pcolor(lon,lat,squeeze(y(m,:,:))); caxis([-0.2 0.2]); 
  shading flat; colorbar; 
end

t1=31; t2=65; t=[t1:t2]; lon=s.lon; lat=s.lat;
A=squeeze(CM4h.h1.sfc.tsurf.all(t1:t2,:,:,:)); A0=squeeze(mean(A,2));
y=trend(A,t,1); y0=trend(A0,t,1); y_mod=y0;
figure; pcolor(lon,lat,y_mod-y_obs); caxis([-0.2 0.2]); shading flat; colorbar; 

figure; pcolor(lon,lat,y0); caxis([-0.2 0.2]); shading flat; colorbar; 
for m=1:12;
  figure;
  pcolor(lon,lat,squeeze(y(m,:,:))); caxis([-0.2 0.2]); 
  shading flat; colorbar; 
end

t1=131; t2=165; t=[t1:t2]; lon=s.lon; lat=s.lat;
A=squeeze(CM4.h1.sfc.tsurf.all(t1:t2,:,:,:)); A0=squeeze(mean(A,2));
y=trend(A,t,1); y0=trend(A0,t,1); y_mod=y0;
figure; pcolor(lon,lat,y_mod-y_obs); caxis([-0.2 0.2]); shading flat; colorbar; 
figure; pcolor(lon,lat,y0); caxis([-0.2 0.2]); shading flat; colorbar; 
for m=1:12;
  figure;
  pcolor(lon,lat,squeeze(y(m,:,:))); caxis([-0.2 0.2]); 
  shading flat; colorbar; 
end

t1=131; t2=165; t=[t1:t2]; lon=s.lon; lat=s.lat;
A=squeeze(SP.h1.sfc.tsurf.all(t1:t2,:,:,:)); A0=squeeze(mean(A,2));
y=trend(A,t,1); y0=trend(A0,t,1); y_mod=y0;
figure; pcolor(lon,lat,y_mod-y_obs); caxis([-0.2 0.2]); shading flat; colorbar; 
figure; pcolor(lon,lat,y0); caxis([-0.2 0.2]); shading flat; colorbar; 
for m=1:12;
  figure;
  pcolor(lon,lat,squeeze(y(m,:,:))); caxis([-0.2 0.2]); 
  shading flat; colorbar; 
end








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section I: Analysis of historical runs%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g.gb=readsat_giss_gb(); g.nh=readsat_giss_nh(); g.sh=readsat_giss_sh(); 
yr1=1951; yr2=1980; vname='SAT_1951_1980';
%yr1=1881; yr2=1920; vname='SAT_1881_1920';
%yr1=1920; yr2=1960; vname='SAT_1920_1959';
id=(g.gb.year>=yr1)&(g.gb.year<=yr2); 
g.gb.all=g.gb.all-mean(g.gb.all(id));
g.nh.all=g.nh.all-mean(g.nh.all(id));
g.sh.all=g.sh.all-mean(g.sh.all(id)); tf=273.15; lw=2;
%AMIP
y0=am4.h0.sfc.tref.ts.org_ann; t0=[1870:2014];
Y0=AM4.h0.sfc.tref.ts.org_ann; T0=[1950:2014];
Ya=AM4.ha.sfc.tref.ts.org_ann; Ta=[1950:2014];
Yb=AM4.hb.sfc.tref.ts.org_ann; Tb=[1950:2014];
y1=AM4.h1.sfc.tref.ts.org_ann; t1=[1950:2014];
y2=AM4.h2.sfc.tref.ts.org_ann; t2=[1950:2014];
%z=AM4.ha.sfc.sst.tavg0-am4.h0.sfc.sst.tavg0;
%CMs
tt0=[1:65]; tt1=[1950:2014]; yy0=get_tref_hist(CM4,tt0,tt1,yr1,yr2);
zz0=CM4.c0.sfc.tref.ts.org_ann(1:65); zz1=CM4.h0.sfc.tref.ts.org_ann;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.; fsize=16; x=[5:5:20]-2.5; 
x1=[5:5:140]-2.5; x2=[65:5:140]-2.5; lw=2;
handle=figure('Position',pms,'visible','on'); lw=3;
plot(t0,y0-tf,    'b',   'LineWidth',lw); hold on; 
plot(T0,Y0-tf,    'b--', 'LineWidth',lw); hold on; 
plot(Ta,Ya-tf,    'k',   'LineWidth',lw); hold on; 
plot(Tb,Yb-tf,    'k--', 'LineWidth',lw); hold on; 
%plot(t1,y1-tf,    'g',   'LineWidth',lw); hold on; 
%plot(t2,y2-tf,    'g--',   'LineWidth',lw); hold on; 
plot(t1,yy0.gb-tf,'r',  'LineWidth',lw*2); %plot(t1,zz1-tf,'g'); 
plot(t1,zz0-tf,   'c',  'LineWidth',lw*2);
plot([1850:1979],cm4.h0.sfc.tref.ts.org_ann-tf,       'r--','LineWidth', lw*2);
plot([1850:1979],cm4.c0.sfc.tref.ts.org_ann(1:130)-tf,'c--','LineWidth', lw*2);
legend('c96AM4-AMIP-PCMDI-SST','c192AM4-AMIP-PCMDI-SST',...
       'C192AM4-AMIP-HIRESMIP-SST-monthly','C192AM4-AMIP-HIRESMIP-SST-daily',...
       'C192AM4+1/4MOM6-historical','C192AM4+1/4MOM6-1850control',...
       'CM4-historical','CM4-PI-Control-C',2);
xlabel('year','FontSize',fsize); 
ylabel('Surface air temperature anomalies (K)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1850 2017 12.4 14.5]);
visfig='off'; figpath='./fig_am4/'; expn='hiresmip'; vname='tas';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y0=am4.h0.toa.netrad.ann_stat.mmen.all; t0=[1870:5:2014];
Y0=AM4.h0.toa.netrad.ann_stat.mmen.all; T0=[1950:5:2014];
Ya=AM4.ha.toa.netrad.ann_stat.mmen.all; Ta=[1950:5:2014];
Yb=AM4.hb.toa.netrad.ann_stat.mmen.all; Tb=[1950:5:2014];
y1=AM4.h1.toa.netrad.ann_stat.mmen.all; t1=[1950:5:2014];
y2=AM4.h2.toa.netrad.ann_stat.mmen.all; t2=[1950:5:2014];
%z=AM4.ha.toa.sst.tavg0-am4.h0.toa.sst.tavg0;
%CMs
zz1=CM4.c0.toa.netrad.ann_stat.mmen.all(1:13);       tt1=[1950:5:2014];
zz2=CM4.h0.toa.netrad.ann_stat.mmen.all;       tt2=[1950:5:2014];
zz3=cm4.c0.toa.netrad.ann_stat.mmen.all;       tt3=[1850:5:1850+129];
zz4=cm4.h0.toa.netrad.ann_stat.mmen.all;       tt4=[1850:5:1964];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.; fsize=16; x=[5:5:20]-2.5; 
x1=[5:5:140]-2.5; x2=[65:5:140]-2.5; lw=2;
handle=figure('Position',pms,'visible','on'); lw=3;
plot(t0,y0,    'b',   'LineWidth',lw); hold on; 
plot(T0,Y0,    'b--', 'LineWidth',lw); hold on; 
plot(Ta,Ya,    'k',   'LineWidth',lw); hold on; 
plot(Tb,Yb,    'k--', 'LineWidth',lw); hold on; 
%plot(t1,y1,    'g',   'LineWidth',lw); hold on; 
%plot(t2,y2,    'g--',   'LineWidth',lw); hold on; 
plot(tt1,zz1,   'c',  'LineWidth',lw*2);
plot(tt2,zz2,   'r',  'LineWidth',lw*2);
plot(tt3,zz3,   'c--',  'LineWidth',lw*2);
plot(tt4,zz4,   'r--',  'LineWidth',lw*2);
legend('c96AM4-AMIP-PCMDI-SST','c192AM4-AMIP-PCMDI-SST',...
       'C192AM4-AMIP-HIRESMIP-SST-monthly','C192AM4-AMIP-HIRESMIP-SST-daily',...
       'C192AM4+1/4MOM6-historical','C192AM4+1/4MOM6-1850control',...
       'CM4-historical','CM4-PI-Control-C',2);
xlabel('year','FontSize',fsize); 
ylabel('Surface air temperature anomalies (K)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1850 2017 -1 1.5]);
visfig='off'; figpath='./fig_am4/'; expn='hiresmip'; vname='netradtoa';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.; fsize=28; x=[5:5:20]-2.5; 
x1=[5:5:140]-2.5; x2=[65:5:140]-2.5; 
handle=figure('Position',pms,'visible','on'); lw=3;
plot(g.gb.year,g.gb.all,'k',  'LineWidth',lw); hold on; s0='OBS (GISS)';
%plot(tx,   yx.gb,  'g-', 'LineWidth',lw); sx='AM4-longamip';
plot(t2,    y2.gb,  'g-', 'LineWidth',lw); s2='CM2.1';
plot(t3,    y3.gb,  'b-', 'LineWidth',lw); s3='CM3';
plot(t4,    y4.gb,  'r-', 'LineWidth',lw); s4='CM4';
plot([yr1 yr1],[-2 2],'k:'); plot([yr2 yr2],[-2 2],'k:');
plot([1840 2017],[0 0], 'k:');
legend(s0,s2,s3,s4,2); %legend(s0,sx,s1,s4,2);
xlabel('year','FontSize',fsize); 
ylabel('Surface air temperature anomalies (K)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1860 2017 -0.7 1.7]);
visfig='off'; figpath='./fig_am4/'; expn='cm4_hist'; vname='tas_gb';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pms=[ 0, 0, 1200, 800]*1.5;
handle=figure('Position',pms,'visible','on'); lw=2;
plot([1870:2014],am4.h0.sfc.tref.ts.org_ann, 'g-', 'LineWidth',lw); hold on;
plot([1850:2014],cm4.h0.sfc.tref.ts.org_ann, 'r-', 'LineWidth',lw); hold on;
plot([1861:2000],cm21.h0.sfc.tref.ts.org_ann,'k-', 'LineWidth',lw); hold on;
plot([1861:2005],cm3.h0.sfc.tref.ts.org_ann, 'b-', 'LineWidth',lw); hold on;
plot([1850:2014],cm4.v0.sfc.tref.ts.org_ann, 'r--','LineWidth',lw); hold on;
plot([1861:1960],cm21.v0.sfc.tref.ts.org_ann,'k--','LineWidth',lw'); hold on;
plot([1861:1940],cm3.v0.sfc.tref.ts.org_ann, 'b--','LineWidth',lw'); hold on;
legend('AM4','CM4','CM2.1','CM3','CM2.1-CTL','CM3-CTL',2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*1.5;
handle=figure('Position',pms,'visible','on'); lw=2;
plot([1870:2014],am4.h0.sfc.tref.ts.org_ann, 'g-', 'LineWidth',lw); hold on;
plot([1850:2014],cm4.h0.sfc.tref.ts.org_ann, 'r-', 'LineWidth',lw); hold on;
plot([1861:2000],cm21.h0.sfc.tref.ts.org_ann,'k-', 'LineWidth',lw); hold on;
plot([1861:2005],cm3.h0.sfc.tref.ts.org_ann, 'b-', 'LineWidth',lw); hold on;
plot([1850:2014],cm4.v0.sfc.tref.ts.org_ann, 'r--','LineWidth',lw); hold on;
plot([1861:1960],cm21.v0.sfc.tref.ts.org_ann,'k--','LineWidth',lw'); hold on;
plot([1861:1940],cm3.v0.sfc.tref.ts.org_ann, 'b--','LineWidth',lw'); hold on;
legend('AM4','CM4','CM2.1','CM3','CM2.1-CTL','CM3-CTL',2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section I: Analysis of historical runs%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g.gb=readsat_giss_gb(); g.nh=readsat_giss_nh(); g.sh=readsat_giss_sh(); 
%yr1=1951; yr2=1980; vname='SAT_1951_1980';
yr1=1881; yr2=1920; vname='SAT_1881_1920';
%yr1=1920; yr2=1960; vname='SAT_1920_1959';
id=(g.gb.year>=yr1)&(g.gb.year<=yr2); 
g.gb.all=g.gb.all-mean(g.gb.all(id));
g.nh.all=g.nh.all-mean(g.nh.all(id));
g.sh.all=g.sh.all-mean(g.sh.all(id));
%for longamip--------------------
tx=[1871:2015]; id=(tx>=yr1)&(tx<=yr2);
a=am4.h0.sfc.tref.ts.org_ann;    yx.gb=a-mean(a(id));
a=am4.h0.sfc.tref.ts.org_ann_nh; yx.nh=a-mean(a(id));
a=am4.h0.sfc.tref.ts.org_ann_sh; yx.sh=a-mean(a(id));
%for cm2.1-------------------------
t=[1861:1940]; t2=[1861:2000]; y2=get_tref_hist(cm21,t,t2,yr1,yr2);
%for cm3-------------------------
t=[1861:1940]; t3=[1861:2005]; y3=get_tref_hist(cm3, t,t3,yr1,yr2);
%for CM4-----------------------
t=[1850:2014]; t4=[1850:2014]; y4=get_tref_hist(cm4, t,t4,yr1,yr2);
%--------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 700]*1.; fsize=28; x=[5:5:20]-2.5; 
x1=[5:5:140]-2.5; x2=[65:5:140]-2.5; 
handle=figure('Position',pms,'visible','on'); lw=3;
plot(g.gb.year,g.gb.all,'k',  'LineWidth',lw); hold on; s0='OBS (GISS)';
%plot(tx,   yx.gb,  'g-', 'LineWidth',lw); sx='AM4-longamip';
plot(t2,    y2.gb,  'g-', 'LineWidth',lw); s2='CM2.1';
plot(t3,    y3.gb,  'b-', 'LineWidth',lw); s3='CM3';
plot(t4,    y4.gb,  'r-', 'LineWidth',lw); s4='CM4';
plot([yr1 yr1],[-2 2],'k:'); plot([yr2 yr2],[-2 2],'k:');
plot([1840 2017],[0 0], 'k:');
legend(s0,s2,s3,s4,2); %legend(s0,sx,s1,s4,2);
xlabel('year','FontSize',fsize); 
ylabel('Surface air temperature anomalies (K)','FontSize',fsize);
set(gca,'FontSize',fsize); axis([1860 2017 -0.7 1.7]);
visfig='off'; figpath='./fig_am4/'; expn='cm4_hist'; vname='tas_gb';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig 3 SWABS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='swabs'; unit='(W/m2)'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.v1.s; %lat=s.lat; lon=s.lon; xy=[0 360 -90 90]; mv=-999;
v=o;      zo=squeeze(v.toa.swnet.sea(k,:,:)); s.so='CERES';
v=am4.v0; z1=squeeze(v.toa.swnet.sea(k,:,:)); s.s1='AM4p0';
v=am2.v0; z2=squeeze(v.toa.swnet.sea(k,:,:)); s.s2='AM2.1';
v=am3.v0; z3=squeeze(v.toa.swnet.sea(k,:,:)); s.s3='AM3';
b1=z1-zo; b2=z2-zo; b3=z3-zo; 
a=o.aa; v=am4.v0; v.ss=ss; v.varn=varn; v.expn='AM4p0'; 
e=b1; v.rms1=sqrt(mean(mean(e.*e.*a))); v.bias1=mean(mean(e.*a)); v.corr1=corrcoef(z1,zo);
e=b2; v.rms2=sqrt(mean(mean(e.*e.*a))); v.bias2=mean(mean(e.*a)); v.corr2=corrcoef(z2,zo);
e=b3; v.rms3=sqrt(mean(mean(e.*e.*a))); v.bias3=mean(mean(e.*a)); v.corr3=corrcoef(z3,zo);
form='(BIAS=%5.2f; RMSE=%5.2f)'; fm='MEAN=%5.2f';
v.s1=sprintf(fm,mean(mean(z1.*a))); v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},'; ',v.s1,')'];
v.s2=sprintf(fm,mean(mean(zo.*a))); v.s2=['(b) CERES-EBAF-ed2.8 (2001-2015; ',v.ss{k},'; ',v.s2,')'];
v.s3=sprintf(form,v.bias1,v.rms1); v.s3=['(c) AM4.0 minus CERES ',v.s3];
v.s4=sprintf(form,v.bias2,v.rms2); v.s4=['(d) AM2.1 minus CERES ',v.s4];
v.s5=sprintf(form,v.bias3,v.rms3); v.s5=['(e) AM3 minus CERES ',v.s5];
v.c1=25;    v.c2=410;  v.vbino=[v.c1:10:v.c2]; v.unit=unit;
v.cmin=-60; v.cmax=60; v.vbin =[v.cmin:5:v.cmax]; 
plot_5panel_mapp(k,v,s,z1,zo,b1,b2,b3,0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig 5 OLR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=5; varn='olr'; unit='(W/m2)'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.v1.s; 
v=o;      zo=squeeze(v.toa.lwnet.sea(k,:,:)); s.so='CERES';
v=am4.v0; z1=squeeze(v.toa.lwnet.sea(k,:,:)); s.s1='AM4p0';
v=am2.v0; z2=squeeze(v.toa.lwnet.sea(k,:,:)); s.s2='AM2.1';
v=am3.v0; z3=squeeze(v.toa.lwnet.sea(k,:,:)); s.s3='AM3';
b1=z1-zo; b2=z2-zo; b3=z3-zo; 
a=o.aa; v=am4.v0; v.ss=ss; v.varn=varn; v.expn='AM4p0'; 
e=b1; v.rms1=sqrt(mean(mean(e.*e.*a))); v.bias1=mean(mean(e.*a)); v.corr1=corrcoef(z1,zo);
e=b2; v.rms2=sqrt(mean(mean(e.*e.*a))); v.bias2=mean(mean(e.*a)); v.corr2=corrcoef(z2,zo);
e=b3; v.rms3=sqrt(mean(mean(e.*e.*a))); v.bias3=mean(mean(e.*a)); v.corr3=corrcoef(z3,zo);
form='(BIAS=%5.2f; RMSE=%5.2f)'; fm='MEAN=%5.2f';
v.s1=sprintf(fm,mean(mean(z1.*a))); v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},'; ',v.s1,')'];
v.s2=sprintf(fm,mean(mean(zo.*a))); v.s2=['(b) CERES-EBAF-ed2.8 (2001-2015; ',v.ss{k},'; ',v.s2,')'];
v.s3=sprintf(form,v.bias1,v.rms1); v.s3=['(c) AM4.0 minus CERES ',v.s3];
v.s4=sprintf(form,v.bias2,v.rms2); v.s4=['(d) AM2.1 minus CERES ',v.s4];
v.s5=sprintf(form,v.bias3,v.rms3); v.s5=['(e) AM3 minus CERES ',v.s5];
v.c1=120;   v.c2=350;  v.vbino=[v.c1:10:v.c2]; v.unit=unit;
v.cmin=-34; v.cmax=34; v.vbin =[v.cmin:5:v.cmax]; 
plot_5panel_mapp(k,v,s,z1,zo,b1,b2,b3,0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig 6 NETRAD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=5; varn='netrad'; unit='(W/m2)'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.v1.s; 
v=o;      zo=squeeze(v.toa.netrad.sea(k,:,:)); s.so='CERES';
v=am4.v0; z1=squeeze(v.toa.netrad.sea(k,:,:)); s.s1='AM4p0';
v=am2.v0; z2=squeeze(v.toa.netrad.sea(k,:,:)); s.s2='AM2.1';
v=am3.v0; z3=squeeze(v.toa.netrad.sea(k,:,:)); s.s3='AM3';
b1=z1-zo; b2=z2-zo; b3=z3-zo; 
a=o.aa; v=am4.v0; v.ss=ss; v.varn=varn; v.expn='AM4p0'; 
e=b1; v.rms1=sqrt(mean(mean(e.*e.*a))); v.bias1=mean(mean(e.*a)); v.corr1=corrcoef(z1,zo);
e=b2; v.rms2=sqrt(mean(mean(e.*e.*a))); v.bias2=mean(mean(e.*a)); v.corr2=corrcoef(z2,zo);
e=b3; v.rms3=sqrt(mean(mean(e.*e.*a))); v.bias3=mean(mean(e.*a)); v.corr3=corrcoef(z3,zo);
form='(BIAS=%5.2f; RMSE=%5.2f)'; fm='MEAN=%5.2f';
v.s1=sprintf(fm,mean(mean(z1.*a))); v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},'; ',v.s1,')'];
v.s2=sprintf(fm,mean(mean(zo.*a))); v.s2=['(b) CERES-EBAF-ed2.8 (2001-2015; ',v.ss{k},'; ',v.s2,')'];
v.s3=sprintf(form,v.bias1,v.rms1); v.s3=['(c) AM4.0 minus CERES ',v.s3];
v.s4=sprintf(form,v.bias2,v.rms2); v.s4=['(d) AM2.1 minus CERES ',v.s4];
v.s5=sprintf(form,v.bias3,v.rms3); v.s5=['(e) AM3 minus CERES ',v.s5];
v.c1=-180;  v.c2=120;  v.vbino=[v.c1:10:v.c2]; v.unit=unit;
v.cmin=-60; v.cmax=60; v.vbin =[v.cmin:5:v.cmax]; 
plot_5panel_mapp(k,v,s,z1,zo,b1,b2,b3,0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig 10 Precip
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure; contourf(b1,v.vbin); shading flat; colorbar; caxis([-3 3]);
nn=32; cmap=cbrewer('div', 'BrBG', nn); 
cmap1=[cmap(1:nn/2-2,:); cmap(nn/2+2:end,:)];
colormap(cmap1);

k=5; varn='pcp_green'; unit='(mm/day)'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.v0.s; lat=s.lat; lon=s.lon; xy=[0 360 -90 90]; mv=-999;
v=o;      zo=squeeze(v.sfc.pcp.sea(k,:,:)); s.so='CERES';
v=am4.v0; z1=squeeze(v.sfc.pcp.sea(k,:,:)); s.s1='AM4p0';
v=am2.v0; z2=squeeze(v.sfc.pcp.sea(k,:,:)); s.s2='AM2.1';
v=am3.v0; z3=squeeze(v.sfc.pcp.sea(k,:,:)); s.s3='AM3';
b1=z1-zo; b2=z2-zo; b3=z3-zo; 
a=o.aa; v=am4.v0; v.ss=ss; v.varn=varn; v.expn='AM4p0'; 
e=b1; v.rms1=sqrt(mean(mean(e.*e.*a))); v.bias1=mean(mean(e.*a)); v.corr1=corrcoef(z1,zo);
e=b2; v.rms2=sqrt(mean(mean(e.*e.*a))); v.bias2=mean(mean(e.*a)); v.corr2=corrcoef(z2,zo);
e=b3; v.rms3=sqrt(mean(mean(e.*e.*a))); v.bias3=mean(mean(e.*a)); v.corr3=corrcoef(z3,zo);
form='(BIAS=%5.2f; RMSE=%5.2f)'; fm='MEAN=%5.2f';
v.s1=sprintf(fm,mean(mean(z1.*a))); v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},'; ',v.s1,')'];
v.s2=sprintf(fm,mean(mean(zo.*a))); v.s2=['(b) GPCP-v2.3 (1980-2014; ',v.ss{k},'; ',v.s2,')'];
v.s3=sprintf(form,v.bias1,v.rms1); v.s3=['(c) AM4.0 minus GPCP ',v.s3];
v.s4=sprintf(form,v.bias2,v.rms2); v.s4=['(d) AM2.1 minus GPCP ',v.s4];
v.s5=sprintf(form,v.bias3,v.rms3); v.s5=['(e) AM3 minus GPCP ',v.s5];
v.c1=0;  v.c2=12;    v.vbino=[v.c1:0.5:v.c2]; v.unit=unit;
v.cmin=-4; v.cmax=4; v.vbin =[v.cmin:0.5:v.cmax]; 
plot_5panel_mapp(k,v,s,z1,zo,b1,b2,b3,4)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig 13 TAS over land
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='tas_land'; unit='(C)'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.v1.s;
v=o;      zo=squeeze(v.sfc.tas.sea(k,:,:)) -273.15; s.so='CRU';
v=am4.v0; z1=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s1='AM4p0';
v=am2.v0; z2=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s2='AM2.1';
v=am3.v0; z3=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s3='AM3';
id=(zo>10000); zo(id)=NaN; z1(id)=NaN; z2(id)=NaN; z3(id)=NaN;
b1=z1-zo; b2=z2-zo; b3=z3-zo; 
a=o.aa; v=am4.v0; v.ss=ss; v.varn=varn; v.expn='AM4p0'; 
id=~isnan(b1); a(id)=a(id)/mean(a(id)); a=a(id);
e=b1(id); v.rms1=sqrt(mean(e.*e.*a)); v.bias1=mean(mean(e.*a)); v.corr1=corrcoef(z1(id),zo(id));
e=b2(id); v.rms2=sqrt(mean(e.*e.*a)); v.bias2=mean(mean(e.*a)); v.corr2=corrcoef(z2(id),zo(id));
e=b3(id); v.rms3=sqrt(mean(e.*e.*a)); v.bias3=mean(mean(e.*a)); v.corr3=corrcoef(z3(id),zo(id));
form='(BIAS=%5.2f; RMSE=%5.2f)'; fm='MEAN=%5.2f';
v.s1=sprintf(fm,mean(mean(z1(id).*a))); v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},'; ',v.s1,')'];
v.s2=sprintf(fm,mean(mean(zo(id).*a))); v.s2=['(b) CRU-TS-3.22 (1980-2013; ',v.ss{k},'; ',v.s2,')'];
v.s3=sprintf(form,v.bias1,v.rms1); v.s3=['(c) AM4.0 minus CRU ',v.s3];
v.s4=sprintf(form,v.bias2,v.rms2); v.s4=['(d) AM2.1 minus CRU ',v.s4];
v.s5=sprintf(form,v.bias3,v.rms3); v.s5=['(e) AM3 minus CRU ',v.s5];
%id=(s.lm0>0.25); a=NaN; z1(~id)=a; 
v.c1=-30;   v.c2=30;   v.vbino=[v.c1:1:v.c2]; v.unit=unit;
v.cmin=-12; v.cmax=12; v.vbin =[v.cmin:1:v.cmax];
plot_5panel_mapp(k,v,s,z1,zo,b1,b2,b3,2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig 13 TAS over ocean
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='tas_ocean'; unit='(C)'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.v1.s;
v=o;      zo=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.so='ERA-Interim';
v=am4.v0; z1=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s1='AM4p0';
v=am2.v0; z2=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s2='AM2.1';
v=am3.v0; z3=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s3='AM3';
id=(s.lm0>0.25); a=NaN; zo(id)=NaN; z1(id)=NaN; z2(id)=NaN; z3(id)=NaN;
b1=z1-zo; b2=z2-zo; b3=z3-zo;
a=o.aa; v=am4.v0; v.ss=ss; v.varn=varn; v.expn='AM4p0'; 
id=~isnan(b1); a(id)=a(id)/mean(a(id)); a=a(id);
e=b1(id); v.rms1=sqrt(mean(e.*e.*a)); v.bias1=mean(mean(e.*a)); v.corr1=corrcoef(z1(id),zo(id));
e=b2(id); v.rms2=sqrt(mean(e.*e.*a)); v.bias2=mean(mean(e.*a)); v.corr2=corrcoef(z2(id),zo(id));
e=b3(id); v.rms3=sqrt(mean(e.*e.*a)); v.bias3=mean(mean(e.*a)); v.corr3=corrcoef(z3(id),zo(id));
form='(BIAS=%5.2f; RMSE=%5.2f)'; fm='MEAN=%5.2f';
v.s1=sprintf(fm,mean(mean(z1(id).*a))); v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},'; ',v.s1,')'];
v.s2=sprintf(fm,mean(mean(zo(id).*a))); v.s2=['(b) ERA-Interim (1980-2014; ',v.ss{k},'; ',v.s2,')'];
v.s3=sprintf(form,v.bias1,v.rms1); v.s3=['(c) AM4.0 minus ERA ',v.s3];
v.s4=sprintf(form,v.bias2,v.rms2); v.s4=['(d) AM2.1 minus ERA ',v.s4];
v.s5=sprintf(form,v.bias3,v.rms3); v.s5=['(e) AM3 minus ERA ',v.s5];
v.c1=-30;  v.c2=30;  v.vbino=[v.c1:1:v.c2]; v.unit=unit;
v.cmin=-6; v.cmax=6; v.vbin =[v.cmin:0.5:v.cmax];
plot_5panel_mapp(k,v,s,z1,zo,b1,b2,b3,2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I S12: surface air temperature
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='tas_all'; unit='(C)'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.v1.s;
v=o;      zo=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.so='ERA-Interim';
v=am4.v0; z1=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s1='AM4p0';
v=am2.v0; z2=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s2='AM2.1';
v=am3.v0; z3=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s3='AM3';
id=(s.lm0>0.25); %a=NaN; zo(id)=NaN; z1(id)=NaN; z2(id)=NaN; z3(id)=NaN;
b1=z1-zo; b2=z2-zo; b3=z3-zo;
a=o.aa; v=am4.v0; v.ss=ss; v.varn=varn; v.expn='AM4p0'; 
id=~isnan(b1); a(id)=a(id)/mean(a(id)); a=a(id);
e=b1(id); v.rms1=sqrt(mean(e.*e.*a)); v.bias1=mean(mean(e.*a)); v.corr1=corrcoef(z1(id),zo(id));
e=b2(id); v.rms2=sqrt(mean(e.*e.*a)); v.bias2=mean(mean(e.*a)); v.corr2=corrcoef(z2(id),zo(id));
e=b3(id); v.rms3=sqrt(mean(e.*e.*a)); v.bias3=mean(mean(e.*a)); v.corr3=corrcoef(z3(id),zo(id));
form='(BIAS=%5.2f; RMSE=%5.2f)'; fm='MEAN=%5.2f';
v.s1=sprintf(fm,mean(mean(z1(id).*a))); v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},'; ',v.s1,')'];
v.s2=sprintf(fm,mean(mean(zo(id).*a))); v.s2=['(b) ERA-Interim (1980-2014; ',v.ss{k},'; ',v.s2,')'];
v.s3=sprintf(form,v.bias1,v.rms1); v.s3=['(c) AM4.0 minus ERA ',v.s3];
v.s4=sprintf(form,v.bias2,v.rms2); v.s4=['(d) AM2.1 minus ERA ',v.s4];
v.s5=sprintf(form,v.bias3,v.rms3); v.s5=['(e) AM3 minus ERA ',v.s5];
v.c1=-30;  v.c2=30;  v.vbino=[v.c1:1:v.c2]; v.unit=unit;
v.cmin=-6; v.cmax=6; v.vbin =[v.cmin:0.5:v.cmax];
plot_5panel_mapp(k,v,s,z1,zo,b1,b2,b3,2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig20: NH sea level pressure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='slp_nh'; unit='(C)'; ss={'ANN','MAM','JJA','SON','DJF'};
s=am4.v1.s; load coast; latc=lat; lonc=long; 
v=o;      zo=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.so='ERA-Interim';
v=am4.v0; z1=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s1='AM4p0';
v=am2.v0; z2=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s2='AM2.1';
v=am3.v0; z3=squeeze(v.sfc.tref.sea(k,:,:))-273.15; s.s3='AM3';
id=(s.lm0>0.25); %a=NaN; zo(id)=NaN; z1(id)=NaN; z2(id)=NaN; z3(id)=NaN;
b1=z1-zo; b2=z2-zo; b3=z3-zo;
a=o.aa; v=am4.v0; v.ss=ss; v.varn=varn; v.expn='AM4p0'; 
id=~isnan(b1); a(id)=a(id)/mean(a(id)); a=a(id);
e=b1(id); v.rms1=sqrt(mean(e.*e.*a)); v.bias1=mean(mean(e.*a)); v.corr1=corrcoef(z1(id),zo(id));
e=b2(id); v.rms2=sqrt(mean(e.*e.*a)); v.bias2=mean(mean(e.*a)); v.corr2=corrcoef(z2(id),zo(id));
e=b3(id); v.rms3=sqrt(mean(e.*e.*a)); v.bias3=mean(mean(e.*a)); v.corr3=corrcoef(z3(id),zo(id));
form='(BIAS=%5.2f; RMSE=%5.2f)'; fm='MEAN=%5.2f';
v.s1=sprintf(fm,mean(mean(z1(id).*a))); v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},'; ',v.s1,')'];
v.s2=sprintf(fm,mean(mean(zo(id).*a))); v.s2=['(b) ERA-Interim (1980-2014; ',v.ss{k},'; ',v.s2,')'];
v.s3=sprintf(form,v.bias1,v.rms1); v.s3=['(c) AM4.0 minus ERA ',v.s3];
v.s4=sprintf(form,v.bias2,v.rms2); v.s4=['(d) AM2.1 minus ERA ',v.s4];
v.s5=sprintf(form,v.bias3,v.rms3); v.s5=['(e) AM3 minus ERA ',v.s5];
v.c1=-30;  v.c2=30;  v.vbino=[v.c1:1:v.c2]; v.unit=unit;
v.cmin=-6; v.cmax=6; v.vbin =[v.cmin:0.5:v.cmax];

k=5;
z1=squeeze(am4.v0.sfc.slp.sea(k,:,:));
zo=squeeze(o.sfc.slp.sea(k,:,:));
id=(z1<950); zo(id)=NaN; zo=zo-1013.25; z1=z1-1013.25;
lon(1)=0; lon(end)=360; lonx(1)=0; lonx(end)=360;
figure; vbino=[-10:1:10];
axesm('stereo','Origin',[90 -90],'MapLatLimit',[20 90])
contourfm(lat,lon,z1,vbino); hold on;  gridm on; colorbar;
contourm(latx,lonx,lm,'k','LineWidth',1); 

mlabel on; %plabel on;
setm(gca,'MLabelParallel',-20)

figure; pcolor(lon,lat,z1); shading flat; colorbar;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=am4.v0; latx=v0.lat; lonx=v0.lon; lm=am4.v0.lm0;
k=3; ss={'ANN','MAM','JJA','SON','DJF'};
lat=o.lat; lon=o.lon; cmin=-3; cmax=3; row=3; col=2;
pms=[ 0, 0, 1000, 800]*1; fsize=16; lw=2; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on'); 
y1=am4.v0.sfc.sst.ts.org_ann;
y2=an4.v0.sfc.sst.ts.org_ann;
plot(y1,'b'); hold on; plot(y2,'r');

%test%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=am4.v0; latx=v0.lat; lonx=v0.lon; lm=am4.v0.lm0;
k=1; ss={'ANN','MAM','JJA','SON','DJF'};
lat=o.lat; lon=o.lon; cmin=-0.5; cmax=0.5; row=2; col=2;
pms=[ 0, 0, 1000, 800]*1.5; fsize=16; lw=2; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on'); 
zo=squeeze(o.sfc.sst.sea(k,:,:))  -273.15;
z0=squeeze(o.sfc.tsurf.sea(k,:,:))-273.15;
z1=squeeze(am4.v0.sfc.tsurf.sea(k,:,:))-273.15;
z2=squeeze(an4.v0.sfc.tsurf.sea(k,:,:))-273.15;
z3=squeeze(bn4.v0.sfc.tsurf.sea(k,:,:))-273.15;
subplot(row,col,1); 
pcolor(lon,lat,z0-zo); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title(strcat('INTERIM minus HadiSST (',ss{k},')'));
subplot(row,col,2); 
pcolor(lon,lat,z1-zo); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title('AM4 minus HadiSST');
subplot(row,col,3); 
pcolor(lon,lat,z2-zo); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title('c192AM4H minus HadiSST');
subplot(row,col,4); 
pcolor(lon,lat,z3-zo); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title('c192AM4 minus c96AM4');


subplot(row,col,5); 
pcolor(lon,lat,z2-zo); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title('AM2 minus GPCP');
subplot(row,col,6);
pcolor(lon,lat,z3-zo); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title('AM3 minus GPCP');
expn='pcp'; vname=ss{k};
visfig='off'; figpath='./fig_am4/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%test%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=am4.v0; latx=v0.lat; lonx=v0.lon; lm=am4.v0.lm0;
k=3; ss={'ANN','MAM','JJA','SON','DJF'};
lat=o.lat; lon=o.lon; cmin=0; cmax=1; row=2; col=2;
pms=[ 0, 0, 1000, 500]*1.5; fsize=16; lw=2; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on'); 
zo=squeeze(o.sfc.pcp.sea(k,:,:));
ze=squeeze(o.sfc.pcp_era.sea(k,:,:));
z0=squeeze(cm4.v0.sfc.pcp.sea(k,:,:));
z1=squeeze(am4.v0.sfc.pcp.sea(k,:,:));
z2=squeeze(am2.v0.sfc.pcp.sea(k,:,:));
z3=squeeze(am3.v0.sfc.pcp.sea(k,:,:));
y0=squeeze(cm4.v0.sfc.prec_ls.sea(k,:,:));
y1=squeeze(am4.v0.sfc.prec_ls.sea(k,:,:));
y2=squeeze(am2.v0.sfc.prec_ls.sea(k,:,:));
y3=squeeze(am3.v0.sfc.prec_ls.sea(k,:,:));
subplot(row,col,1); 
pcolor(lon,lat,y0./z0); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); 
title(strcat('CM4 (fraction of largescale P, ',ss{k},')'));
subplot(row,col,2); 
pcolor(lon,lat,y1./z1); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title('AM4 (fraction of largescale P)');
subplot(row,col,3); 
pcolor(lon,lat,y2./z2); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title('AM2 (fraction of largescale P)');
subplot(row,col,4);
pcolor(lon,lat,y3./z3); hold on; shading flat; colorbar; caxis([cmin cmax]);
contourf(lonx,latx,lm,[0 1],'k'); title('AM3 (fraction of largescale P)');
expn='fl'; vname=ss{k};
visfig='off'; figpath='./fig_am4/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.7: seaonal cycle of TOA radiation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.7a seaonal cycle of TOA Raditive flux%%%%
pms=[ 0, 0, 600, 1800]*0.8; fsize=12; lw=1; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on');
row=3; col=1;
subplot(row,col,1);
toa=am4.v0.toa; xy=[1 12 -13.5 13.5]; 
xo=toa.netrad.clm_stat.omen.all; xo=xo-mean(xo);
yo=toa.lwnet.clm_stat.omen.all;  yo=yo-mean(yo);
zo=toa.swnet.clm_stat.omen.all;  zo=zo-mean(zo);
x1=toa.netrad.clm_stat.mmen.all; x1=x1-mean(x1);
y1=toa.lwnet.clm_stat.mmen.all;  y1=y1-mean(y1);
z1=toa.swnet.clm_stat.mmen.all;  z1=z1-mean(z1);
plot(t,x1,'k',  'LineWidth',lw); hold on; corrcoef(x1,xo)
plot(t,y1,'r',  'LineWidth',lw); hold on; corrcoef(y1,yo)
plot(t,z1,'b',  'LineWidth',lw); hold on; corrcoef(z1,zo)
plot(t,xo,'k--','LineWidth',lw); hold on;
plot(t,yo,'r--','LineWidth',lw); hold on;
plot(t,zo,'b--','LineWidth',lw); hold on;
vname='netradtoa_scyc'; expn='AM4p0';
yl='TOA radiative flux anomalies (W/m^2)';
legend('net','LW','SW',0); mylabel(xy,1,'(a)',fsize);
xlabel('month','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
subplot(row,col,2);
toa=am4.v0.toa; xy=[1 12 -13.5 13.5]; 
xo=toa.netrad_clr.clm_stat.omen.all; xo=xo-mean(xo);
yo=toa.lwnet_clr.clm_stat.omen.all;  yo=yo-mean(yo);
zo=toa.swnet_clr.clm_stat.omen.all;  zo=zo-mean(zo);
x1=toa.netrad_clr.clm_stat.mmen.all; x1=x1-mean(x1);
y1=toa.lwnet_clr.clm_stat.mmen.all;  y1=y1-mean(y1);
z1=toa.swnet_clr.clm_stat.mmen.all;  z1=z1-mean(z1);
plot(t,x1,'k',  'LineWidth',lw); hold on;
plot(t,y1,'r',  'LineWidth',lw); hold on;
plot(t,z1,'b',  'LineWidth',lw); hold on;
plot(t,xo,'k--','LineWidth',lw); hold on;
plot(t,yo,'r--','LineWidth',lw); hold on;
plot(t,zo,'b--','LineWidth',lw); hold on;
vname='radtoa_clr_scyc'; expn='AM4p0';
yl='TOA clear-sky radiative flux anomalies (W/m^2)';
%legend('net','LW','SW',0); 
mylabel(xy,1,'(b)',fsize);
xlabel('month','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
subplot(row,col,3);
toa=am4.v0.toa; xy=[1 12 -13.5 13.5]; 
xo=toa.ttcf.clm_stat.omen.all;  xo=xo-mean(xo);%xo=repmat(xo,1,2);
yo=toa.lwcf.clm_stat.omen.all;  yo=yo-mean(yo);%yo=repmat(yo,1,2);
zo=toa.swcf.clm_stat.omen.all;  zo=zo-mean(zo);%zo=repmat(zo,1,2);
x1=toa.ttcf.clm_stat.mmen.all;  x1=x1-mean(x1);%x1=repmat(x1,1,2);
y1=toa.lwcf.clm_stat.mmen.all;  y1=y1-mean(y1);%y1=repmat(y1,1,2);
z1=toa.swcf.clm_stat.mmen.all;  z1=z1-mean(z1);%z1=repmat(z1,1,2);
plot(t,x1,'k',  'LineWidth',lw); hold on;corrcoef(x1,xo)
plot(t,y1,'r',  'LineWidth',lw); hold on;corrcoef(y1,yo)
plot(t,z1,'b',  'LineWidth',lw); hold on;corrcoef(z1,zo)
plot(t,xo,'k--','LineWidth',lw); hold on;
plot(t,yo,'r--','LineWidth',lw); hold on;
plot(t,zo,'b--','LineWidth',lw); hold on;
vname='cre_scyc'; expn='AM4p0'; 
yl='TOA cloud radiative effect anomalies (W/m^2)';
%legend('net','LW','SW',0); 
mylabel(xy,1,'(c)',fsize); 
xlabel('month','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); vname='toa_flux';
visfig='off'; figpath='./fig_am4/'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.7: seaonal cycle of TOA radiation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.7a seaonal cycle of TOA Raditive flux%%%%
vname='netradtoa_scyc'; expn='AM4p0';
yl='TOA radiative flux anomalies (W/m2)';
pms=[ 0, 0, 800, 600]*0.8; fsize=16; lw=2; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on');
toa=am4.v0.toa; xy=[1 12 -13.5 13.5]; 
xo=toa.netrad.clm_stat.omen.all; xo=xo-mean(xo);
yo=toa.lwnet.clm_stat.omen.all;  yo=yo-mean(yo);
zo=toa.swnet.clm_stat.omen.all;  zo=zo-mean(zo);
x1=toa.netrad.clm_stat.mmen.all; x1=x1-mean(x1);
y1=toa.lwnet.clm_stat.mmen.all;  y1=y1-mean(y1);
z1=toa.swnet.clm_stat.mmen.all;  z1=z1-mean(z1);
plot(t,x1,'k',  'LineWidth',lw); hold on; corrcoef(x1,xo)
plot(t,y1,'r',  'LineWidth',lw); hold on; corrcoef(y1,yo)
plot(t,z1,'b',  'LineWidth',lw); hold on; corrcoef(z1,zo)
plot(t,xo,'k--','LineWidth',lw); hold on;
plot(t,yo,'r--','LineWidth',lw); hold on;
plot(t,zo,'b--','LineWidth',lw); hold on;
legend('net','LW','SW',0); mylabel(xy,1,'(a)',fsize);
xlabel('month','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.7b seasonal cycle of TOA clear-sky Raditive flux
vname='radtoa_clr_scyc'; expn='AM4p0';
yl='TOA clear-sky radiative flux anomalies (W/m^2)';
pms=[ 0, 0, 800, 600]*0.8; fsize=16; lw=2; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on');
toa=am4.v0.toa; xy=[1 12 -13.5 13.5]; 
xo=toa.netrad_clr.clm_stat.omen.all; xo=xo-mean(xo);
yo=toa.lwnet_clr.clm_stat.omen.all;  yo=yo-mean(yo);
zo=toa.swnet_clr.clm_stat.omen.all;  zo=zo-mean(zo);
x1=toa.netrad_clr.clm_stat.mmen.all; x1=x1-mean(x1);
y1=toa.lwnet_clr.clm_stat.mmen.all;  y1=y1-mean(y1);
z1=toa.swnet_clr.clm_stat.mmen.all;  z1=z1-mean(z1);
plot(t,x1,'k',  'LineWidth',lw); hold on;
plot(t,y1,'r',  'LineWidth',lw); hold on;
plot(t,z1,'b',  'LineWidth',lw); hold on;
plot(t,xo,'k--','LineWidth',lw); hold on;
plot(t,yo,'r--','LineWidth',lw); hold on;
plot(t,zo,'b--','LineWidth',lw); hold on;
legend('net','LW','SW',0); mylabel(xy,1,'(b)',fsize);
xlabel('month','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.7c seasonal cycle of TOA CRE%%%%%%%%%%%%%
vname='cre_scyc'; expn='AM4p0'; 
yl='TOA cloud radiative effect anomalies (W/m2)';
pms=[ 0, 0, 800, 600]*0.8; fsize=16; lw=2; msize=8; t=[1:1:12];
handle = figure('Position', pms,'visible','on');
toa=am4.v0.toa; xy=[1 12 -13.5 13.5]; 
xo=toa.ttcf.clm_stat.omen.all;  xo=xo-mean(xo);%xo=repmat(xo,1,2);
yo=toa.lwcf.clm_stat.omen.all;  yo=yo-mean(yo);%yo=repmat(yo,1,2);
zo=toa.swcf.clm_stat.omen.all;  zo=zo-mean(zo);%zo=repmat(zo,1,2);
x1=toa.ttcf.clm_stat.mmen.all;  x1=x1-mean(x1);%x1=repmat(x1,1,2);
y1=toa.lwcf.clm_stat.mmen.all;  y1=y1-mean(y1);%y1=repmat(y1,1,2);
z1=toa.swcf.clm_stat.mmen.all;  z1=z1-mean(z1);%z1=repmat(z1,1,2);
plot(t,x1,'k',  'LineWidth',lw); hold on;corrcoef(x1,xo)
plot(t,y1,'r',  'LineWidth',lw); hold on;corrcoef(y1,yo)
plot(t,z1,'b',  'LineWidth',lw); hold on;corrcoef(z1,zo)
plot(t,xo,'k--','LineWidth',lw); hold on;
plot(t,yo,'r--','LineWidth',lw); hold on;
plot(t,zo,'b--','LineWidth',lw); hold on;
legend('net','LW','SW',0); mylabel(xy,1,'(c)',fsize); 
xlabel('month','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.8: time series of TOA radiation anomalies
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.8: time series of TOA net radation%%%%%%
pms=[ 0, 0, 1400, 1000]*0.8; fsize=11; lw=2; msize=6; 
handle = figure('Position', pms,'visible','on');
row=2; col=2;
subplot(row,col,1); vname='netradtoa_ts'; expn='AM4p0'; 
yl='TOA net radiation (W/m^2)'; xy=[2000 2015 -0.8 0.8];
g=o.ceres_ts_global.toa.netrad.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4.v0.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.mean,yo.anom); 
s1=sprintf('AM4.0 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-ed2.8',2); mylabel(xy,1,'(a)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
subplot(row,col,2); vname='lwnet_ts'; expn='AM4p0'; 
yl='OLR (W/m^2)'; xy=[2000 2015 -0.8 0.8];
g=o.ceres_ts_global.toa.lwnet.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4.v0.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.mean,yo.anom); 
s1=sprintf('AM4.0 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-ed2.8',3); mylabel(xy,1,'(b)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
subplot(row,col,3); vname='swnet_ts'; expn='AM4p0'; 
yl='TOA SW radiation (W/m^2)'; xy=[2000 2015 -0.8 0.8];
g=o.ceres_ts_global.toa.swnet.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4.v0.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.mean,yo.anom); 
s1=sprintf('AM4.0 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-ed2.8',3); mylabel(xy,1,'(c)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
subplot(row,col,4); vname='swcf_ts'; expn='AM4p0'; 
yl='SW CRE (W/m^2)'; xy=[2000 2015 -0.8 0.8];
g=o.ceres_ts_global.toa.swcf.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4.v0.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.mean,yo.anom); 
s1=sprintf('AM4.0 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-ed2.8',3); mylabel(xy,1,'(d)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; vname='toa_flux_ts';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.8: time series of TOA radiation anomalies
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.8a: time series of TOA net radation%%%%%%
vname='netradtoa_ts'; expn='AM4p0'; 
yl='TOA net radiation (W/m2)'; xy=[2000 2015 -0.8 0.8];
g=o.ceres_ts_global.toa.netrad.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4.v0.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.netrad.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.mean,yo.anom); 
s1=sprintf('AM4.0 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-ed2.8',2); mylabel(xy,1,'(a)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_am4/'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.8b: time series of OLR %%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_ts'; expn='AM4p0'; 
yl='OLR (W/m2)'; xy=[2000 2015 -0.8 0.8];
g=o.ceres_ts_global.toa.lwnet.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4.v0.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.lwnet.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.mean,yo.anom); 
s1=sprintf('AM4.0 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-ed2.8',3); mylabel(xy,1,'(b)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.8c: time series of TOA SW net radiation%%%%%%
vname='swnet_ts'; expn='AM4p0'; 
yl='TOA SW radiation (W/m2)'; xy=[2000 2015 -0.8 0.8];
g=o.ceres_ts_global.toa.swnet.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4.v0.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.swnet.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.mean,yo.anom); 
s1=sprintf('AM4.0 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-ed2.8',3); mylabel(xy,1,'(c)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig.8d: time series of TOA SW CRE%%%%%%%%%%%%%%%%
vname='swcf_ts'; expn='AM4p0'; 
yl='SW CRE (W/m2)'; xy=[2000 2015 -0.8 0.8];
g=o.ceres_ts_global.toa.swcf.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4.v0.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.swcf.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.mean,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.mean,yo.anom); 
s1=sprintf('AM4.0 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-ed2.8',3); mylabel(xy,1,'(d)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwcf_ts'; expn='AM4p0'; 
yl='LW CRE (W/m2)'; xy=[2000 2015 -0.8 0.8];
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
g=o.ceres_ts_global.toa.lwcf.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                  %03/2000-12/2014; 178 months
ya=am4.v0.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
yb=am4.v1.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
yc=am4.v2.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
yd=am4.v3.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
ye=am4.v4.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
yf=am4.v5.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
yg=am4.v6.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
yh=am4.v7.toa.lwcf.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.anom,yo.anom); 
s1=sprintf('AM4.1 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-v2.8',3); mylabel(xy,1,'(c)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='lwnet_clr_ts'; expn='AM4p0'; 
yl='clear-sky OLR (W/m2)'; xy=[2000 2015 -0.8 0.8];
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
g=o.ceres_ts_global.toa.lwnet_clr.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4a.v0.toa.lwnet_clr.al0(end-14:end,:); %01/2000-12/2014
yb=am4b.v0.toa.lwnet_clr.al0(end-14:end,:); %01/2000-12/2014
yc=am4c.v0.toa.lwnet_clr.al0(end-14:end,:); %01/2000-12/2014
yd=am4d.v0.toa.lwnet_clr.al0(end-14:end,:); %01/2000-12/2014
ye=am4e.v0.toa.lwnet_clr.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.anom,yo.anom); 
s1=sprintf('AM4.1 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-v2.8',3); mylabel(xy,1,'(c)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swnet_clr_ts'; expn='AM4p0'; 
yl='clear-sky SW absorption (W/m2)'; xy=[2000 2015 -0.8 0.8];
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
g=o.ceres_ts_global.toa.swnet_clr.ts;%03/2000-02/2016; 192 months
g=g(1:end-14);                    %03/2000-12/2014; 178 months
ya=am4a.v0.toa.swnet_clr.al0(end-14:end,:); %01/2000-12/2014
yb=am4b.v0.toa.swnet_clr.al0(end-14:end,:); %01/2000-12/2014
yc=am4c.v0.toa.swnet_clr.al0(end-14:end,:); %01/2000-12/2014
yd=am4d.v0.toa.swnet_clr.al0(end-14:end,:); %01/2000-12/2014
ye=am4e.v0.toa.swnet_clr.al0(end-14:end,:); %01/2000-12/2014
nyr=length(ya(:,1)); wsize=12;
x=ya; x=reshape(x',12*nyr,1); x=x(3:end); ya=deseason(x,wsize);
x=yb; x=reshape(x',12*nyr,1); x=x(3:end); yb=deseason(x,wsize);
x=yc; x=reshape(x',12*nyr,1); x=x(3:end); yc=deseason(x,wsize);
x=yd; x=reshape(x',12*nyr,1); x=x(3:end); yd=deseason(x,wsize);
x=ye; x=reshape(x',12*nyr,1); x=x(3:end); ye=deseason(x,wsize);
x=yf; x=reshape(x',12*nyr,1); x=x(3:end); yf=deseason(x,wsize);
x=yg; x=reshape(x',12*nyr,1); x=x(3:end); yg=deseason(x,wsize);
x=yh; x=reshape(x',12*nyr,1); x=x(3:end); yh=deseason(x,wsize);
%var=[ya.anom yb.anom yc.anom yg.anom yh.anom];
var=[ya.anom yb.anom yc.anom yd.anom ye.anom yf.anom yg.anom yh.anom];
ym=get_meanmaxmin(var,ya.time);
pms=[ 0, 0, 1000, 600]*0.8; fsize=16; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
wsize=12; yo=deseason(g,wsize);
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
shadedplot(ym.time,ym.min, ym.max,[0.7 0.7 0.7],'k');  hold on;
plot(ym.time,ym.anom,'-k','LineWidth',lw); hold on;
plot(yo.time,yo.anom,'-r','LineWidth',lw); hold on; 
c=corrcoef(ym.anom,yo.anom); 
s1=sprintf('AM4.1 (corr=%5.2f)',c(1,2));
legend(s1,'CERES-EBAF-v2.8',3); mylabel(xy,1,'(c)',fsize);
xlabel('year','FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.15-16 and S13: zonal mean temperature
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmt'; unit='(C)';  ss={'ANN','MAM','JJA','SON','DJF'};
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50];
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4.v1.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=o;      [zo bo rmso]=vslice(v,s,k,varn,'obs',mv);
v=am4.v0; [z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv);
v=am2.v0; [z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv);
v=am3.v0; [z3 b3 rms3]=vslice(v,s,k,varn,'mod',mv);
v=am4.v0; v.ss=ss; v.pf=pf; v.xy=xy; v.varn=varn; v.expn='AM4p0'; 
v.rms1=rms1; v.rms2=rms2; v.rms3=rms3;
z1(1,80:end)=NaN; id=isnan(z1); zo(id)=NaN; b1(id)=NaN; b2(id)=NaN; b3(id)=NaN;
form='(RMSE=%5.2f)'; a=273.15; z1=z1-a; zo=zo-a;
v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},')'];
v.s2=['(b) ERA-interim (1980-2014; ',v.ss{k},')'];
v.s3=sprintf(form,v.rms1); v.s3=['(c) AM4.0 minus ERA ',v.s3];
v.s4=sprintf(form,v.rms2); v.s4=['(d) AM2.1 minus ERA ',v.s4];
v.s5=sprintf(form,v.rms3); v.s5=['(e) AM3 minus ERA ',v.s5];
v.c1=-90;  v.c2=20;  v.vbino=[v.c1:10:v.c2]; v.unit=unit;
v.cmin=-6; v.cmax=6; v.vbin =[v.cmin:0.5:v.cmax]; 
v.vlab0=[-70:10:20]; pt=7; v.vlab=[-5 -4 -3 -2 -1 0 1 2 3 4 5];
plot_5panel_zmean(k,v,s,z1,zo,b1,b2,b3,3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.17-18 and S14: zonal mean zonal wind
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmu'; unit='(m/s)'; ss={'ANN','MAM','JJA','SON','DJF'};
pf=[1000 925 850 700 600 500 400 300 250 200 150 100];
s=am4.v5.s; lat=s.lat; xy=[-90 90 100 1000]; mv=-999;
v=o;      [zo bo rmso]=vslice(v,s,k,varn,'obs',mv);
v=am4.v0; [z1 b1 rms1]=vslice(v,s,k,varn,'mod',mv);
v=am2.v0; [z2 b2 rms2]=vslice(v,s,k,varn,'mod',mv);
v=am3.v0; [z3 b3 rms3]=vslice(v,s,k,varn,'mod',mv);
v=am4.v0; v.ss=ss; v.pf=pf; v.xy=xy; v.varn=varn; v.expn='AM4p0'; 
v.rms1=rms1; v.rms2=rms2; v.rms3=rms3;
z1(1,80:end)=NaN; id=isnan(z1); zo(id)=NaN; b1(id)=NaN; b2(id)=NaN; b3(id)=NaN;
form='(RMSE=%5.2f)';
v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},')'];
v.s2=['(b) ERA-interim (1980-2014; ',v.ss{k},')'];
v.s3=sprintf(form,v.rms1); v.s3=['(c) AM4.0 minus ERA ',v.s3];
v.s4=sprintf(form,v.rms2); v.s4=['(d) AM2.1 minus ERA ',v.s4];
v.s5=sprintf(form,v.rms3); v.s5=['(e) AM3 minus ERA ',v.s5];
v.c1=-30;  v.c2=30;  v.vbino=[v.c1:4:v.c2]; v.unit=unit;
v.cmin=-10; v.cmax=10; v.vbin =[v.cmin:1:v.cmax]; 
v.vlab0=[-30:4:30]; v.vlab=[-10:1:10];
plot_5panel_zmean(k,v,s,z1,zo,b1,b2,b3,3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I S15-S18: stratospheric winds(DJF-JJA-MAM-SON)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1; varn='zmu_strat'; unit='(m/s)'; ss={'ANN','MAM','JJA','SON','DJF'};
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50 30 20 10];
s=am4.v1.s; lat=s.lat; mv=-1e10; xy=[-90 90 10 1000]; 
lpf=log10(pf); xy=[-90 90 min(lpf) max(lpf)];
pftic=log10([10 20 30 50 70 100 200 300 500 700 925]);
pflis={'10','20','30','50','70','100','200','300','500','700','925'}
v=o;      [zo bo rmso]=vslice_s(v,s,k,varn,'obs',mv);
v=am4.v0; [z1 b1 rms1]=vslice_s(v,s,k,varn,'mod',mv);
v=am2.v0; [z2 b2 rms2]=vslice_s(v,s,k,varn,'mod',mv);
v=am3.v0; [z3 b3 rms3]=vslice_s(v,s,k,varn,'mod',mv);
v=am4.v0; v.ss=ss; v.pf=pf; v.xy=xy; v.varn=varn; v.expn='AM4p0'; 
v.rms1=rms1; v.rms2=rms2; v.rms3=rms3; v.pftic=pftic; v.pflis=pflis;
z1(1,80:end)=NaN; id=isnan(z1); zo(id)=NaN; b1(id)=NaN; b2(id)=NaN; b3(id)=NaN;
form='(RMSE=%5.2f)';
v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},')'];
v.s2=['(b) ERA-interim (1980-2014; ',v.ss{k},')'];
v.s3=sprintf(form,v.rms1); v.s3=['(c) AM4.0 minus ERA ',v.s3];
v.s4=sprintf(form,v.rms2); v.s4=['(d) AM2.1 minus ERA ',v.s4];
v.s5=sprintf(form,v.rms3); v.s5=['(e) AM3 minus ERA ',v.s5];
v.c1=-30;  v.c2=30;  v.vbino=[v.c1:5:v.c2]; v.unit=unit;
v.cmin=-12; v.cmax=12; v.vbin =[v.cmin:2:v.cmax]; 
v.vlab0=[-30:5:30]; v.vlab=[-10:5:10];
plot_5panel_zmean(k,v,s,z1,zo,b1,b2,b3,3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I S19-S22: stratospheric zonal mean temperature(DJF-JJA-MAM-SON)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=4; varn='zmt_strat'; unit='(C)'; ss={'ANN','MAM','JJA','SON','DJF'};
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50 30 20 10];
s=am4.v1.s; lat=s.lat; mv=-1e10; xy=[-90 90 10 1000]; 
lpf=log10(pf); xy=[-90 90 min(lpf) max(lpf)];
pftic=log10([10 20 30 50 70 100 200 300 500 700 925]);
pflis={'10','20','30','50','70','100','200','300','500','700','925'}
v=o;      [zo bo rmso]=vslice_s(v,s,k,varn,'obs',mv);
v=am4.v0; [z1 b1 rms1]=vslice_s(v,s,k,varn,'mod',mv);
v=am2.v0; [z2 b2 rms2]=vslice_s(v,s,k,varn,'mod',mv);
v=am3.v0; [z3 b3 rms3]=vslice_s(v,s,k,varn,'mod',mv);
v=am4.v0; v.ss=ss; v.pf=pf; v.xy=xy; v.varn=varn; v.expn='AM4p0'; 
v.rms1=rms1; v.rms2=rms2; v.rms3=rms3; v.pftic=pftic; v.pflis=pflis;
z1(1,80:end)=NaN; id=isnan(z1); zo(id)=NaN; b1(id)=NaN; b2(id)=NaN; b3(id)=NaN;
form='(RMSE=%5.2f)'; a=273.15; z1=z1-a; zo=zo-a;
v.s1=['(a) AM4.0 (1980-2014; ',v.ss{k},')'];
v.s2=['(b) ERA-interim (1980-2014; ',v.ss{k},')'];
v.s3=sprintf(form,v.rms1); v.s3=['(c) AM4.0 minus ERA ',v.s3];
v.s4=sprintf(form,v.rms2); v.s4=['(d) AM2.1 minus ERA ',v.s4];
v.s5=sprintf(form,v.rms3); v.s5=['(e) AM3 minus ERA ',v.s5];
v.c1=-90;  v.c2=20;  v.vbino=[v.c1:10:v.c2]; v.unit=unit;
v.cmin=-10; v.cmax=10; v.vbin =[v.cmin:1:v.cmax]; 
v.vlab0=[-30:5:30]; v.vlab=[-10:5:10];
plot_5panel_zmean(k,v,s,z1,zo,b1,b2,b3,3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


z1(1,80:end)=NaN; %figure; contourf(z1);
id=isnan(z1); zo(id)=NaN; b1(id)=NaN; b2(id)=NaN; b3(id)=NaN;
pms=[ 0, 0, 1300, 1100]*0.8; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
cmin=-10; cmax=10; vbin=[cmin:1:cmax];
x0=0.08; y0=0.7; wx=0.38; wy=0.25; dx=0.1; dy=0.05;
p1= [x0,          y0,           wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,           wx, wy];%position of first subplot
p3= [x0+(wx+dx)/2,y0-wy-dy,     wx, wy];%position of first subplot
p4= [x0,          y0-2*(wy+dy), wx, wy];%position of first subplot
p5= [x0+wx+dx,    y0-2*(wy+dy), wx, wy];%position of first subplot
nn=32; cmap=jet(nn); %cmap(nn/2:nn/2+1,:)=1;
subplot('Position',p1); c1=-90; c2=20; vbino=[c1:10:c2]; vlab0=[-90:10:20]
[C,h]=contourf(lat,lpf,z1-273.15,vbino); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h,vlab0,'Rotation',0); colormap(cmap);
set(gca,'ytick',pftic); set(gca,'yticklabel',pflis); 
mt=['(a) AM4.0 (1980-2014; ',ss{k},')'];
title(mt,'FontSize',fsize); set(gca,'FontSize',fsize); 
axis(xy); set(gca,'yDir','reverse'); 
subplot('Position',p2);
[C,h]=contourf(lat,lpf,zo-273.15,vbino); shading flat; 
colorbar; caxis([c1 c2]); clabel(C,h,vlab0,'Rotation',0); colormap(cmap);
set(gca,'ytick',pftic); set(gca,'yticklabel',pflis); 
mt=['(b) ERA-I (1980-2014; ',ss{k},')'];
title(mt,'FontSize',fsize); set(gca,'FontSize',fsize); 
axis(xy); set(gca,'yDir','reverse'); 
subplot('Position',p3); vlab1=[-10:2:10]
[C,h]=contourf(lat,lpf,b1,vbin); shading flat;
colorbar; caxis([cmin cmax]); clabel(C,h,vlab1,'Rotation',0);  colormap(bluewhitered(nn));
set(gca,'ytick',pftic); set(gca,'yticklabel',pflis); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(c) AM4.0 minus ERA-I (RMSE=%5.2f)',rms1);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot('Position',p4);
[C,h]=contourf(lat,lpf,b2,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h,vlab1,'Rotation',0); 
set(gca,'ytick',pftic); set(gca,'yticklabel',pflis); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(d) AM2.1 minus ERA-I (RMSE=%5.2f)',rms2);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
subplot('Position',p5); 
[C,h]=contourf(lat,lpf,b3,vbin); shading flat; 
colorbar; caxis([cmin cmax]); clabel(C,h,vlab1,'Rotation',0); 
set(gca,'ytick',pftic); set(gca,'yticklabel',pflis); 
axis(xy); set(gca,'yDir','reverse');
s=sprintf('(e) AM3 minus ERA-I (RMSE=%5.2f)',rms3);
title(s,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_am4/';
vname=strcat(varn,(ss{k}),'_strato');
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.38 long amip aerosol effect
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_am4p0/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat'); 
tpath='/archive/Ming.Zhao/awg/warsaw/';
expn='c96L33_am4p0_longamip';                 fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v1=getfields(v);
%expn='c96L33_am4p0_longamip_m1';              fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v2=getfields(v);
%expn='c96L33_am4p0_longamip_m2';              fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v3=getfields(v);
expn='c96L33_am4p0_longamip_m1_aero';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.a1=getfields(v);
expn='c96L33_am4p0_longamip_m2_aero';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.a2=getfields(v);
expn='c96L33_am4p0_longamip_m3_aero';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.a3=getfields(v);
expn='c96L33_am4p0_longamip_m1_GHG';          fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.g1=getfields(v);
expn='c96L33_am4p0_longamip_m2_GHG';          fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.g2=getfields(v);
expn='c96L33_am4p0_longamip_m3_GHG';          fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.g3=getfields(v);
expn='c96L33_am4p0_longamip_1850rad_novol_m1';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c1=getfields(v);
%expn='c96L33_am4p0_longamip_1850rad';        fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c1=getfields(v);
%expn='c96L33_am4p0_longAMIP_1850forcing_cmip5_1860aero';fn=strcat(tpath,expn,pp,expn,dr);load(fn);amx.c1=getfields(v);
%expn='c96L33_am4p0_longAMIP_1850forcing_cmip5_TSaero';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);amx.a1=getfields(v);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/AM3/';
expn='c48L48_am3p11_allforcr_A1'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v1=getfields(v);
expn='c48L48_am3p11_allforcr_A2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v2=getfields(v);
expn='c48L48_am3p11_allforcr_A3'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v3=getfields(v);
expn='c48L48_am3p11_allforcr_A4'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v4=getfields(v);
expn='c48L48_am3p11_allforcr_A5'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v5=getfields(v);
expn='c48L48_am3p11_aeroOnly_A1'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a1=getfields(v);
expn='c48L48_am3p11_aeroOnly_A2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a2=getfields(v);
expn='c48L48_am3p11_aeroOnly_A3'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a3=getfields(v);
expn='c48L48_am3p11_aeroOnly_A4'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a4=getfields(v);
expn='c48L48_am3p11_aeroOnly_A5'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a5=getfields(v);
expn='c48L48_am3p11_WMGGOnly_A1'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g1=getfields(v);
expn='c48L48_am3p11_WMGGOnly_A2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g2=getfields(v);
expn='c48L48_am3p11_WMGGOnly_A3'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g3=getfields(v);
expn='c48L48_am3p11_WMGGOnly_A4'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g4=getfields(v);
expn='c48L48_am3p11_WMGGOnly_A5'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g5=getfields(v);
expn='c48L48_am3p11_1860_A1';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c1=getfields(v);
expn='c48L48_am3p11_1860_A2';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c2=getfields(v);
expn='c48L48_am3p11_1860_A3';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c3=getfields(v);
expn='c48L48_am3p11_1860_A4';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c4=getfields(v);
expn='c48L48_am3p11_1860_A5';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c5=getfields(v);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/AM2.1/';
expn='AM2.1RC3_allforc_A1';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v1=getfields(v);
expn='AM2.1RC3_allforc_A2';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v2=getfields(v);
expn='AM2.1RC3_allforc_A3';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v3=getfields(v);
expn='AM2.1RC3_aeroOnly_A1';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.a1=getfields(v); 
expn='AM2.1RC3_aeroOnly_A2';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.a2=getfields(v);
expn='AM2.1RC3_aeroOnly_A3';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.a3=getfields(v);
expn='AM2.1RC3_WMGGOnly_A1';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.g1=getfields(v);
expn='AM2.1RC3_WMGGOnly_A2';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.g2=getfields(v);
expn='AM2.1RC3_WMGGOnly_A3';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.g3=getfields(v);
expn='AM2.1RC3_1860_A1';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.c1=getfields(v);
expn='AM2.1RC3_1860_A2';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.c2=getfields(v);
expn='AM2.1RC3_1860_A3';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.c3=getfields(v);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
am2=compute_rfp_lamip(am2,'am2');
am3=compute_rfp_lamip(am3,'am3');
am4=compute_rfp_lamip(am4,'am4');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.38 long amip aerosol effect
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=14; lw=3; 
handle=figure('Position',pms,'visible','on'); 
t=[1870:5:2014]+2.5; xy=[1870 2015 -2.0 0.5];
lw=2; a=3; k1=1; k2=22;
x=am3.toa.rfp.aer; y=am4.toa.rfp.aer; 
r=corrcoef(x(k1:k2),y(k1:k2)); c=polyfit(x(k1:k2),y(k1:k2),1);
y1=c(1)*x+c(2); hold on; 
plot(t,x, 'b','LineWidth',lw); hold on;
plot(t,y, 'r','LineWidth',lw); hold on;
plot(t,y1,'k','LineWidth',lw); hold on;
%plot(t,amx.toa.rfp.aer,'c','LineWidth',lw); hold on;
plot([1870 2015],[0 0],'k-'); box on;
xlabel('year','FontSize',fsize); axis(xy);
ylabel('Aerosol RFP at TOA (W/m^2)','FontSize',fsize);
set(gca,'FontSize',fsize); box on;
legend('AM3','AM4','AM4 (predicted from regression)',3);
visfig='off'; figpath='./fig_am4/'; expn='longamip'; vname='aero_rfp_cmip5';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AM4 paper part I Fig.38x include everything (all RFP+allmodels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*0.8; fsize=14; lw=3; 
handle=figure('Position',pms,'visible','on'); 
t=[1870:5:2014]+2.5; xy=[1870 2015 -1.8 3.2];
lw=2; a=3; k1=1; k2=22;
tot4=am4.toa.rfp.tot; aer4=am4.toa.rfp.aer; ghg4=am4.toa.rfp.ghg;
tot3=am3.toa.rfp.tot; aer3=am3.toa.rfp.aer; ghg3=am3.toa.rfp.ghg;
tot2=am2.toa.rfp.tot; aer2=am2.toa.rfp.aer; ghg2=am2.toa.rfp.ghg;
plot(t,ghg4, 'r--','LineWidth',lw+2); hold on;
plot(t,ghg3, 'b--','LineWidth',lw); hold on;
plot(t,ghg2, 'g--','LineWidth',lw); hold on;
plot(t,aer4, 'r-.', 'LineWidth',lw+2); hold on;
plot(t,aer3, 'b-.', 'LineWidth',lw); hold on;
plot(t,aer2, 'g-.', 'LineWidth',lw); hold on;
plot(t,ghg4+aer4,'r-','LineWidth',lw+2); hold on;
plot(t,ghg3+aer3,'b-','LineWidth',lw); hold on;
plot(t,ghg2+aer2,'g-','LineWidth',lw); hold on;
plot(t,tot4,     'r:','LineWidth',lw*2); hold on;
plot(t,tot3,     'b:','LineWidth',lw*2); hold on;
plot(t,tot2,     'g:','LineWidth',lw*2); hold on;
plot([1870 2015],[0 0],'k-'); box on; grid on;
xlabel('year','FontSize',fsize); axis(xy);
ylabel('RFP at TOA (W/m2)','FontSize',fsize);
set(gca,'FontSize',fsize); box on;
legend('AM4(WMGG+O3)',     'AM3(WMGG)',     'AM2(WMGG)',...
       'AM4(AERO)',        'AM3(AERO)',     'AM2(AERO)',...
       'AM4(WMGG+O3+AERO)','AM3(WMGG+AERO)','AM2(WMGG+AERO)',...
       'AM4(Total)',       'AM3(Total)',    'AM2(Total)',  2);
visfig='off'; figpath='./fig_am4/'; expn='longamip'; vname='rfp';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


