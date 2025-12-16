%below opt=1 for writing mat file to /work/miz
%below opt=2 for writing mat file to /archive
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
latlon=[0 360 -90 90];region='global'; mod='c96';myr=5; opt=2;
%latlon=[0 360  30 90];region='nhextr';mod='c96';myr=5; opt=2; 
%latlon=[0 360 -30 30];region='tropic';mod='c96';myr=5; opt=2; 
%latlon=[150 250 -5 5]; region='equpac'; nyr=5; myr=1; opt=0;
%read in or generate observation data
%o=readobs(latlon,region,'c48');
fn=strcat('/work/miz/mat_am4p0/obs_',region,'_to_c48.mat'); load(fn);
tpath='/archive/Ming.Zhao/awg/warsaw/'; myr=5;
expn='c96L33_am4p0_longamip_m2';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L33_am4p0_longAMIP_NewSST_Em20170518';yr1='1870';yr2='1989';syr=1;nyr=120;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L33_am4p0_longamip_1850rad';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_longamip';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_longamip_m1_aero';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L33_am4p0_longamip_m3_GHG';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_longamip_m2_GHG';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_longamip_m2_aero';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_longamip_m3_aero';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);

expn='c96L33_am4p0_longamip_1850rad_novol_m1';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_longamip_m1_GHG';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_longamip_m1';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
expn='c96L33_am4p0_longamip_m1_aero';yr1='1870';yr2='2014';syr=1;nyr=145;mod='c96'
v0=tsana(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/AM3/'; myr=5;
expn='c48L48_am3p11_WMGGOnly_A1'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_WMGGOnly_A2'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_WMGGOnly_A3'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_WMGGOnly_A4'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_WMGGOnly_A5'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       

expn='c48L48_am3p11_aeroOnly_A1'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_aeroOnly_A2'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_aeroOnly_A3'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_aeroOnly_A4'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_aeroOnly_A5'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       

expn='c48L48_am3p11_allforcr_A1'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_allforcr_A2'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_allforcr_A3'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_allforcr_A4'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_allforcr_A5'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
exit

expn='c48L48_am3p11_1860_A1'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_1860_A2'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_1860_A3'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_1860_A4'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_1860_A5'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_1860aero_A1'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_1860aero_A2'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_1860aero_A3'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_1860aero_A4'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_1860aero_A5'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_1860nat_A1'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_1860nat_A2'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_1860nat_A3'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_1860nat_A4'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='c48L48_am3p11_1860nat_A5'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/AM2.1/'; myr=5;
expn='AM2.1RC3_allforc_A1'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2.1RC3_allforc_A2'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2.1RC3_allforc_A3'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2.1RC3_1860_A1'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2.1RC3_1860_A2'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2.1RC3_1860_A3'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2.1RC3_1860aero_A1'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2.1RC3_1860aero_A2'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2.1RC3_1860aero_A3'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2.1RC3_WMGGOnly_A1'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2.1RC3_WMGGOnly_A2'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2.1RC3_WMGGOnly_A3'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2.1RC3_aeroOnly_A1'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2.1RC3_aeroOnly_A2'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2.1RC3_aeroOnly_A3'; yr1='1870';yr2='2015';syr=1;nyr=145;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/AM2.1/'; myr=5;
expn='AM2p1_longamip_allforcing_B1'; yr1='1870';yr2='1999';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_allforcing_B2'; yr1='1870';yr2='1999';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_allforcing_B3'; yr1='1870';yr2='1999';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_allforcing_B4'; yr1='1870';yr2='1999';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_allforcing_B5'; yr1='1870';yr2='1999';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_allforcing_B6'; yr1='1870';yr2='1999';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_allforcing_B7'; yr1='1870';yr2='1999';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_allforcing_B8'; yr1='1870';yr2='1999';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_allforcing_B9'; yr1='1870';yr2='1999';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_allforcing_B10'; yr1='1870';yr2='1999';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='AM2p1_longamip_1860rad_A1'; yr1='1870';yr2='2004';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_1860rad_A2'; yr1='1870';yr2='2004';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_1860rad_A3'; yr1='1870';yr2='2004';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_1860rad_A4'; yr1='1870';yr2='2004';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_1860rad_A5'; yr1='1870';yr2='2004';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_1860rad_A6'; yr1='1870';yr2='2004';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_1860rad_A7'; yr1='1870';yr2='2004';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_1860rad_A8'; yr1='1870';yr2='2004';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_1860rad_A9'; yr1='1870';yr2='2004';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
expn='AM2p1_longamip_1860rad_A10'; yr1='1870';yr2='2004';syr=1;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='AM2p1_longamip_1860rad'; yr1='1870';yr2='2004';syr=2;nyr=130;mod='c48'
v0=tsana_am2(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt);       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pp='/'; region='global'; dr=strcat('_',region,'_tsana.mat'); 
fn=strcat('/work/miz/mat_am4p0/obs_',region,'_to_c48.mat'); load(fn);
tpath='/archive/Ming.Zhao/awg/AM2.1/';
expn='AM2.1RC3_allforc_A1';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v1=getfields(v);
expn='AM2.1RC3_allforc_A1';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v2=v.toa;

expn='AM2.1RC3_allforc_A2';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v2=v.toa;
expn='AM2.1RC3_allforc_A3';    fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.v3=v.toa;
expn='AM2.1RC3_1860_A1';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.c1=v.toa;
expn='AM2.1RC3_1860_A2';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.c2=v.toa;
expn='AM2.1RC3_1860_A3';       fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.c3=v.toa;
expn='AM2.1RC3_WMGGOnly_A1';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.g1=v.toa;
expn='AM2.1RC3_WMGGOnly_A2';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.g2=v.toa;
expn='AM2.1RC3_WMGGOnly_A3';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.g3=v.toa;
expn='AM2.1RC3_aeroOnly_A1';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.a1=v.toa;
expn='AM2.1RC3_aeroOnly_A2';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.a2=v.toa;
expn='AM2.1RC3_aeroOnly_A3';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);am2.a3=v.toa;
x1=am2.v1.netrad.ts.org_ann;
x2=am2.v2.netrad.ts.org_ann;
x3=am2.v3.netrad.ts.org_ann; am2.v0.netradtoa=(x1+x2+x3)/3;
x1=am2.c1.netrad.ts.org_ann;
x2=am2.c2.netrad.ts.org_ann;
x3=am2.c3.netrad.ts.org_ann; am2.c0.netradtoa=(x1+x2+x3)/3;
x1=am2.g1.netrad.ts.org_ann;
x2=am2.g2.netrad.ts.org_ann;
x3=am2.g3.netrad.ts.org_ann; am2.g0.netradtoa=(x1+x2+x3)/3;
x1=am2.a1.netrad.ts.org_ann;
x2=am2.a2.netrad.ts.org_ann;
x3=am2.a3.netrad.ts.org_ann; am2.a0.netradtoa=(x1+x2+x3)/3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/AM3/';
expn='c48L48_am3p11_allforc_A1';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v1=v.toa;
expn='c48L48_am3p11_allforc_A2';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v2=v.toa;
expn='c48L48_am3p11_allforc_A3';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v3=v.toa;
expn='c48L48_am3p11_allforc_A4';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v4=v.toa;
expn='c48L48_am3p11_allforc_A5';  fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.v5=v.toa;
expn='c48L48_am3p11_1860_A1';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c1=v.toa;
expn='c48L48_am3p11_1860_A2';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c2=v.toa;
expn='c48L48_am3p11_1860_A3';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c3=v.toa;
expn='c48L48_am3p11_1860_A4';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c4=v.toa;
expn='c48L48_am3p11_1860_A5';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.c5=v.toa;
expn='c48L48_am3p11_WMGGOnly_A1'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g1=v.toa;
expn='c48L48_am3p11_WMGGOnly_A2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g2=v.toa;
expn='c48L48_am3p11_WMGGOnly_A3'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g3=v.toa;
expn='c48L48_am3p11_WMGGOnly_A4'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g4=v.toa;
expn='c48L48_am3p11_WMGGOnly_A5'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.g5=v.toa;
expn='c48L48_am3p11_aeroOnly_A1'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a1=v.toa;
expn='c48L48_am3p11_aeroOnly_A2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a2=v.toa;
expn='c48L48_am3p11_aeroOnly_A3'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a3=v.toa;
expn='c48L48_am3p11_aeroOnly_A4'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a4=v.toa;
expn='c48L48_am3p11_aeroOnly_A5'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.a5=v.toa;
%expn='c48L48_am3p11_1860aero_A1'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.x1=v.toa;
%expn='c48L48_am3p11_1860aero_A2'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.x2=v.toa;
%expn='c48L48_am3p11_1860aero_A3'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.x3=v.toa;
%expn='c48L48_am3p11_1860aero_A4'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.x4=v.toa;
%expn='c48L48_am3p11_1860aero_A5'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);am3.x5=v.toa;
x1=am3.v1.netrad.ts.org_ann;
x2=am3.v2.netrad.ts.org_ann;
x3=am3.v3.netrad.ts.org_ann;
x4=am3.v4.netrad.ts.org_ann;
x5=am3.v5.netrad.ts.org_ann; am3.v0.netradtoa=(x1+x2+x3+x4+x5)/5;
x1=am3.c1.netrad.ts.org_ann;
x2=am3.c2.netrad.ts.org_ann;
x3=am3.c3.netrad.ts.org_ann;
x4=am3.c4.netrad.ts.org_ann;
x5=am3.c5.netrad.ts.org_ann; am3.c0.netradtoa=(x1+x2+x3+x4+x5)/5;
x1=am3.g1.netrad.ts.org_ann;
x2=am3.g2.netrad.ts.org_ann;
x3=am3.g3.netrad.ts.org_ann;
x4=am3.g4.netrad.ts.org_ann;
x5=am3.g5.netrad.ts.org_ann; am3.g0.netradtoa=(x1+x2+x3+x4+x5)/5;
x1=am3.a1.netrad.ts.org_ann;
x2=am3.a2.netrad.ts.org_ann;
x3=am3.a3.netrad.ts.org_ann;
x4=am3.a4.netrad.ts.org_ann;
x5=am3.a5.netrad.ts.org_ann; am3.a0.netradtoa=(x1+x2+x3+x4+x5)/5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/warsaw/';
expn='c96L33_am4p0_longamip';                 fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v1=v.toa;
expn='c96L33_am4p0_longamip_m1';              fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.v2=v.toa;
expn='c96L33_am4p0_longamip_1850rad';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c1=v.toa;
expn='c96L33_am4p0_longamip_1850rad_novol_m1';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.c2=v.toa;
expn='c96L33_am4p0_longamip_m1_GHG';          fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.g1=v.toa;
expn='c96L33_am4p0_longamip_m1_aero';         fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4.a1=v.toa;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
expn='c96L33_am4p0';                 fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4s.v1=v.toa;
expn='c96L33_am4p0_m1';              fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4s.v2=v.toa;
expn='c96L33_am4p0_m2';              fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4s.v3=v.toa;
expn='c96L33_am4p0_m3';              fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4s.v4=v.toa;
expn='c96L33_am4p0_m4';              fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4s.v5=v.toa;
expn='c96L33_am4p0_1850rad_novol_m0';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4s.c1=v.toa;
expn='c96L33_am4p0_1850rad_novol_m1';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4s.c2=v.toa;
expn='c96L33_am4p0_1850rad_novol_m2';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4s.c3=v.toa;
expn='c96L33_am4p0_1850rad_novol_m3';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4s.c4=v.toa;
expn='c96L33_am4p0_1850rad_novol_m4';fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4s.c5=v.toa;
expn='c96L33_am4p0_onlyaero_m0';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4s.a1=v.toa;
expn='c96L33_am4p0_onlyaero_m1';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4s.a2=v.toa;
expn='c96L33_am4p0_onlyaero_m2';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4s.a3=v.toa;
expn='c96L33_am4p0_onlyaero_m3';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4s.a4=v.toa;
expn='c96L33_am4p0_onlyaero_m4';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);am4s.a5=v.toa;
x1=am4s.v1.netrad.ts.org_ann;
x2=am4s.v2.netrad.ts.org_ann;
x3=am4s.v3.netrad.ts.org_ann;  
x4=am4s.v4.netrad.ts.org_ann;  
x5=am4s.v5.netrad.ts.org_ann;  
am4s.v0.mem=[x1;x2;x3;x4;x5];
am4s.v0.avg=mean(am4s.v0.mem,1);
am4s.v0.std=std(am4s.v0.mem,1);
x1=am4s.c1.netrad.ts.org_ann;
x2=am4s.c2.netrad.ts.org_ann;
x3=am4s.c3.netrad.ts.org_ann;  
x4=am4s.c4.netrad.ts.org_ann;  
x5=am4s.c5.netrad.ts.org_ann;  
am4s.c0.mem=[x1;x2;x3;x4;x5];
am4s.c0.avg=mean(am4s.c0.mem,1);
am4s.c0.std=std(am4s.c0.mem,1);
x1=am4s.a1.netrad.ts.org_ann;
x2=am4s.a2.netrad.ts.org_ann;
x3=am4s.a3.netrad.ts.org_ann;
x4=am4s.a4.netrad.ts.org_ann;
x5=am4s.a5.netrad.ts.org_ann;
am4s.a0.mem=[x1;x2;x3;x4;x5];
am4s.a0.avg=mean(am4s.a0.mem,1);
am4s.a0.std=std(am4s.a0.mem,1);
x1=am4.v1.netrad.ts.org_ann;
x2=am4.v2.netrad.ts.org_ann; am4.v0.netradtoa=(x1+x2)/2;
figure; plot(x1,'r');hold on; plot(x2,'b');
x1=am4.c1.netrad.ts.org_ann;
x2=am4.c2.netrad.ts.org_ann; am4.c0.netradtoa=(x1+x2)/2;
figure; plot(x1,'r');hold on; plot(x2,'b'); plot(x2-x1,'k');
x1=am4.g1.netrad.ts.org_ann; am4.g0.netradtoa=(x1);
figure; plot(x1,'r');hold on;
x1=am4.a1.netrad.ts.org_ann; am4.a0.netradtoa=(x1);
figure; t=[1870:2014]; ts=[1980:2014]; lw=2;
netradtoa_pi=am4.c2.netrad.ts.org_ann;
tot=am4.v0.netradtoa-netradtoa_pi;
ghg=am4.g0.netradtoa-netradtoa_pi;
aer=am4.a0.netradtoa-netradtoa_pi;
vol=am4.c1.netrad.ts.org_ann-netradtoa_pi;
res=tot-ghg-aer;
plot(t, tot,'k'); hold on;
plot(t, ghg,'r'); hold on;
plot(t, aer,'b');
plot(t, tot-ghg-aer-vol,'c'); hold on;
plot(ts,am4s.v0.avg-am4s.c0.avg,'k','LineWidth',lw);
plot(ts,am4s.a0.avg-am4s.c0.avg,'b','LineWidth',lw);
plot(ts,am4s.a0.mem-am4s.c0.mem);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=giss_netforcing(); to=v.time; yo=v.netf;
am2.time=[1870:2014];
am2.dnetrad.all=am2.v0.netradtoa-am2.c0.netradtoa;
am2.dnetrad.ghg=am2.g0.netradtoa-am2.c0.netradtoa;
am2.dnetrad.aer=am2.a0.netradtoa-am2.c0.netradtoa;
am3.time=[1870:2014];
am3.dnetrad.all=am3.v0.netradtoa-am3.c0.netradtoa;
am3.dnetrad.ghg=am3.g0.netradtoa-am3.c0.netradtoa;
am3.dnetrad.aer=am3.a0.netradtoa-am3.c0.netradtoa;
am4.time=[1870:2014];
am4.dnetrad.all=am4.v0.netrad.ts.org_ann-am4.c0.netrad.ts.org_ann-0.3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*1.2; fsize=14; lw=3; 
handle=figure('Position',pms,'visible','on'); 
plot(am2.time,am2.dnetrad.all,'r-'); hold on; 
plot(am2.time,am2.dnetrad.ghg,'r--');
plot(am2.time,am2.dnetrad.aer,'r-.');
plot(am3.time,am3.dnetrad.all,'b-');
plot(am3.time,am3.dnetrad.ghg,'b--');
plot(am3.time,am3.dnetrad.aer,'b-.');
plot(am4.time,am4.dnetrad.all,'k-'); grid on;
legend('AM2 (total)','AM2 (GHG)','AM2 (aerosol)', ...
       'AM3 (total)','AM3 (GHG, no O3)','AM3 (aerosol)',...
       'AM4 (total)',2);
visfig='off'; figpath='./fig_am4/'; expn='longamip'; vname='radf';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


pms=[ 0, 0, 1200, 800]*1.2; fsize=14; lw=3; 
handle=figure('Position',pms,'visible','on'); 
plot(to,yo,'k'); hold on;
plot(am4.time,am4.dnetrad,'r'); hold on;
plot(am4.time,am4.dnetrad-0.32,'m'); hold on;
plot(am2.time,am2.dnetrad,'g'); hold on;
plot(am2o.time,am2o.dnetrad,'c'); hold on;
plot(am3.time,am3.dnetrad,'b'); grid on;
axis([1870 2015 -4 4]);
ylabel('TOA net radiative forcing (W/m2)','FontSize',fsize);
legend('GISS','AM4.0','AM4.0(adjusted)','AM2.1(CMIP5)','AM2.1(CMIP3)','AM3(CMIP5)',2); 
visfig='off'; figpath='./fig_am4/'; expn='AM4'; vname='radf';
printit(visfig,figpath,expn,vname);



am4l.v0.toa.netrad.
b1=am2b1.netrad.ann_stat.mmen.all;
b2=am2b2.netrad.ann_stat.mmen.all;
b3=am2b3.netrad.ann_stat.mmen.all;
b4=am2b4.netrad.ann_stat.mmen.all;
b5=am2b5.netrad.ann_stat.mmen.all;
b6=am2b6.netrad.ann_stat.mmen.all;
b7=am2b7.netrad.ann_stat.mmen.all;
b8=am2b8.netrad.ann_stat.mmen.all;
b9=am2b9.netrad.ann_stat.mmen.all;
a1=am2a1.c0.netrad.ann_stat.mmen.all;
a2=am2a2.c0.netrad.ann_stat.mmen.all;
a3=am2a3.c0.netrad.ann_stat.mmen.all;
a4=am2a4.c0.netrad.ann_stat.mmen.all;
a5=am2a5.c0.netrad.ann_stat.mmen.all;
a6=am2a6.c0.netrad.ann_stat.mmen.all;
a7=am2a7.c0.netrad.ann_stat.mmen.all;
a8=am2a8.c0.netrad.ann_stat.mmen.all;
a9=am2a9.c0.netrad.ann_stat.mmen.all;

x=[1870:1:1999];
figure; plot(x,a2,'r'); hold on; plot(x,a3,'g'); plot(x,a4,'g');
plot(x(121), a2(121),'rs');
k=121;
b=[b2(k) b3(k) b4(k) b5(k) b6(k) b7(k) b8(k) b9(k)];
a=[a2(k) a3(k) a4(k) a5(k) a6(k) a7(k) a8(k) a9(k) a1(k)];

a1=am2a1.toa.netrad.ann_stat.mmen.all;

figure; plot([1871:1:2000],x2-x1,'-r*'); grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v0=aref0.v0; aref0.c0=v0; aref0.a0=v0; 
x=aref0; aref0.d =compute_rfp_all(x);

x=am3;  am3.d =compute_rfp_all(x);
x=am4;  am4.d =compute_rfp_all(x);
x=am4b; am4b.d=compute_rfp_all(x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%am2=aref0; am2.d.netradtoa_clr.rfp(:)=0;
am2.d.netradtoa.rfp=[2.17 -0.7 2.87 0 -3.70 3.55];
am2.d.netradtoa.rfp=[1.92 -0.7 2.62 0 -3.70 3.55];
%am3=aref0; am3.d.netradtoa_clr.rfp(:)=0;
am3.d.netradtoa.rfp=[0.99 -1.6 2.59 0 -2.99 3.62];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

am2_adj.rfp=[2.87*1.12-0.7+0.17 -0.7 2.87*1.12 0 -3.70 3.55];
am3_adj.rfp=[2.59*1.12-1.6+0.17 -1.6 2.59*1.12 0 -2.99 3.62];

am2.rfp_p2K=-3.70;
am2.rfp_tot= 1.92;
am2.rfp_aer=-0.7;
am2.rfp_ghg= 2.6;
am2.rfp_res=am2.rfp_tot-am2.rfp_aer-am2.rfp_ghg;
%am2.rfp_GHG=am2.rfp_ghg*1.12;
%am2.rfp_RES=am2.rfp_res+0.17;
%am2.rfp_TOT=am2.rfp_aer+am2.rfp_GHG+am2.rfp_RES
am2.d.netradtoa.rfp=[am3.rfp_tot am3.rfp_aer am3.rfp_ghg am3.rfp_res am3.rfp_p2K 0];

am3.rfp_p2K=-2.863;
am3.rfp_tot= 0.944;
am3.rfp_aer=-1.69;
am3.rfp_ghg= 2.28;
am3.rfp_res=am3.rfp_tot-am3.rfp_aer-am3.rfp_ghg;
%am3.rfp_GHG=am3.rfp_ghg*1.2;
%am3.rfp_RES=am3.rfp_res+0.17;
%am3.rfp_TOT=am3.rfp_aer+am3.rfp_GHG+am3.rfp_RES
am3.d.netradtoa.rfp=[am3.rfp_tot am3.rfp_aer am3.rfp_ghg am3.rfp_res am3.rfp_p2K 0];

am2.adj_rfp=[am2.rfp_TOT am2.rfp_aer am2.rfp_GHG am2.rfp_RES am2.rfp_p2K];
am3.adj_rfp=[am3.rfp_TOT am3.rfp_aer am3.rfp_GHG am3.rfp_RES am3.rfp_p2K];
am4.d.netradtoa.rfp=[2.6634 -0.7449 3.2392 0.1691 -3.5329]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section 1: RFP CESS sensitivity global and regional plots%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rfp_cess_glb'; expn='AM4p0'; 
xy=[0.5 4.6 -5 5]; xy=[0.5 5.5 -5 5];
y=[am4.d.netradtoa.rfp; am4b.d.netradtoa.rfp; ...
   am2.d.netradtoa.rfp; am3.d.netradtoa.rfp;  ];
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
legend('AM4.0','AM4.0-1990','AM2.1','AM3',1)
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
