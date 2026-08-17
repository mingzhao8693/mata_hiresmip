[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
latlon=[0 360 -90 90];region='global';
%o=readobs_new(latlon,region,'c48','era5');
%o=readobs_new(latlon,region,'c96','era5');
%o=readobs_new(latlon,region,'c96','era5');
fn=strcat('/work/miz/mat_hiresmip/obs_',region,'_to_c48_era5.mat'); load(fn); o.mod='c48';
fn=strcat('/work/miz/mat_hiresmip/obs_',region,'_to_c96_era5.mat'); load(fn); o.mod='c96'; 
fn=strcat('/work/miz/mat_hiresmip/obs_',region,'_to_c192_era5.mat');load(fn); o.mod='c192';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%C96 AM4 GF experiments%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/xanadu/'
p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c96'; 
p.do_trend=0; p.do_trend_obs=0; p.do_scalar=0; p.myr=1; p.opt=2; p.do_3d_atm=2; p.do_all=1;
p.yr1='0002'; p.yr2='0031'; p.syr=1; p.nyr=30;  p.y1=2; p.y2=31; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%below are patch experiments
p.expn='c96L33_am4p0_2010climo_GF'; v=tsana_hiresmip_new(o,tpath,p); %this is the control
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%below are patch experiments
expn0='c96L33_am4p0_2010climo'; d='/work/miz/mat_ml/';
fn=strcat(d,'c96L33_am4p0_2010climo_GF_patch','.mat')
%v=get_allexpn(1); patch=v.patch; save(fn,'patch'); %do this line and save fn if fn was not yet created
load(fn); expn=patch.expn; 
for i=124:length(expn)
  p.expn=strcat(expn0,'_',expn(i));
  v=tsana_hiresmip_new(o,tpath,p);
  z=process_array_amip(v,0);
  fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%C96 AM4 long AMIP run %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c96';
p.do_trend=0; p.do_trend_obs=0; p.do_scalar=0; p.myr=1; p.opt=2; p.do_3d_atm=2; p.do_all=1;
p.yr1='1870'; p.yr2='2020'; p.syr=1; p.nyr=151; p.y1=1979; p.y2=2020; 
tpath='/archive/Ming.Zhao/awg/2023.04/';
p.expn='c96L33_am4p0_longamip_1850rad_m1';           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_1850rad_m2';           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_1850rad_m3';           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_1850rad_m4';           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_1850rad_m5';           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_1850rad_m6';           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_1850rad_m7';           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_1850rad_m8';           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_1850rad_m9';           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_1850rad_m10';          v=tsana_hiresmip_new(o,tpath,p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c96';
p.do_trend=0; p.do_trend_obs=0; p.do_scalar=0; p.myr=1; p.opt=2; p.do_3d_atm=2; p.do_all=1;
p.yr1='1870'; p.yr2='2020'; p.syr=1; p.nyr=151; p.y1=1979; p.y2=2020; 
tpath='/archive/Ming.Zhao/awg/warsaw/';
p.expn='c96L33_am4p0_longamip_1850rad';           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_1850rad_novol_m1';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_m1';                v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_m2';                v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_m3';                v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_m1_GHG';            v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_m2_GHG';            v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_m3_GHG';            v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_m1_aero';           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_m2_aero';           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c96L33_am4p0_longamip_m3_aero';           v=tsana_hiresmip_new(o,tpath,p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CM4 coupled Pi-Controlrun %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c96';
p.do_trend=0; p.do_trend_obs=0; p.do_scalar=0; p.myr=1; p.opt=2; p.do_3d_atm=2; p.do_all=1;
p.yr1='0001'; p.yr2='0650'; p.syr=51; p.nyr=600; p.y1=0051; p.y2=0650; 
tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
p.expn='CM4_piControl_C';           v=tsana_hiresmip_new(o,tpath,p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%C192 AM4 long Climo run and pattern exeperiments%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c192';
p.do_trend=0; p.do_trend_obs=0; p.do_scalar=0; p.myr=1; p.opt=2; p.do_3d_atm=2; p.do_all=1;
p.yr1='0002'; p.yr2='0101'; p.syr=1; p.nyr=100; p.y1=1; p.y2=100; 
tpath='/archive/Ming.Zhao/awg/2023.04/';
p.expn='c192L33_am4p0_2010climo_newctl';                                          v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear';                           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2';                         v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs';          v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs';             v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_atlantic_mdr_obs';          v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_so_45_75s_obs';             v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_best_wegradient';           v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_worst_wegradient';          v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_2best_wegradient';          v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_2worst_wegradient';         v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_middle_wegradient';         v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_10n_70n_obs'; v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_north_pacific_obs';         v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_tropical_30ns_obs';         v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m16';               v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m17';               v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_pattern_m26';               v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear_zonal';                     v=tsana_hiresmip_new(o,tpath,p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CM4X AMIP large ensemble %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c192';
p.do_trend=0; p.do_trend_obs=0; p.do_scalar=0; p.myr=1; p.opt=2; p.do_3d_atm=2; p.do_all=1;
p.yr1='1950'; p.yr2='2020'; p.syr=1; p.nyr=71; p.y1=1979; p.y2=2020; 
tpath='/archive/Ming.Zhao/awg/2023.04/';
p.expn='c192L33_CM4X_amip';     v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_02';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_03';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_04';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_05';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_06';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_07';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_08';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_09';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_10';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_11';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_12';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_13';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_14';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_15';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_16';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_17';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_18';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_19';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_20';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_21';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_22';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_23';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_24';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_25';  v=tsana_hiresmip_new(o,tpath,p);
p.expn='c192L33_CM4X_amip_26';  v=tsana_hiresmip_new(o,tpath,p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Further process AM4 long AMIP runs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ph='/archive/Ming.Zhao/awg/warsaw/'; d='/work/miz/mat_ml/'; 
f='_global_opt2.c48_tsana_hiresmip_new_ivt_1979-2020_1870-2020_do_3d_atm_2_do_trend_0.mat';
e='c96L33_am4p0_longamip_1850rad';          n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c96L33_am4p0_longamip_1850rad_novol_m1'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c96L33_am4p0_longamip_m1';               n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c96L33_am4p0_longamip_m2';               n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');    
e='c96L33_am4p0_longamip_m3';               n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c96L33_am4p0_longamip_m1_GHG';           n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c96L33_am4p0_longamip_m2_GHG';           n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');    
e='c96L33_am4p0_longamip_m3_GHG';           n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');    
e='c96L33_am4p0_longamip_m1_aero';          n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');     
e='c96L33_am4p0_longamip_m2_aero';          n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');    
e='c96L33_am4p0_longamip_m3_aero';          n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ph='/archive/Ming.Zhao/awg/2023.04/'; d='/work/miz/mat_ml/'; 
f='_global_opt2.c48_tsana_hiresmip_new_ivt_1979-2020_1870-2020_do_3d_atm_2_do_trend_0.mat';
e='c96L33_am4p0_longamip_1850rad_m1';       n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,e,'.mat');      save(fn, 'z');
e='c96L33_am4p0_longamip_1850rad_m2';       n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,e,'.mat');      save(fn, 'z');
e='c96L33_am4p0_longamip_1850rad_m3';       n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,e,'.mat');      save(fn, 'z');
e='c96L33_am4p0_longamip_1850rad_m4';       n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,e,'.mat');      save(fn, 'z');
e='c96L33_am4p0_longamip_1850rad_m5';       n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,e,'.mat');      save(fn, 'z');
e='c96L33_am4p0_longamip_1850rad_m6';       n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,e,'.mat');      save(fn, 'z');
e='c96L33_am4p0_longamip_1850rad_m7';       n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,e,'.mat');      save(fn, 'z');
e='c96L33_am4p0_longamip_1850rad_m8';       n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,e,'.mat');      save(fn, 'z');
e='c96L33_am4p0_longamip_1850rad_m9';       n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,e,'.mat');      save(fn, 'z');
e='c96L33_am4p0_longamip_1850rad_m10';      n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,e,'.mat');      save(fn, 'z');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Further process CM4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
ph='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/'; d='/work/miz/mat_ml/'; 
f='_global_opt2.c48_tsana_hiresmip_new_ivt_51-650_0001-0650_do_3d_atm_2_do_trend_0.mat';
e='CM4_piControl_C'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,e,'.mat'); save(fn, 'z','-v7.3');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Further process CM4X AMIP large ensemble %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ph='/archive/Ming.Zhao/awg/2023.04/'; d='/work/miz/mat_ml/'; 
f='_global_opt2.c48_tsana_hiresmip_new_ivt_1979-2020_1950-2020_do_3d_atm_2_do_trend_0.mat';
e='c192L33_CM4X_amip';    n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_02'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_03'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_04'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_05'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_06'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_07'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_08'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_09'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_10'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_11'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_12'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_13'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_14'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_15'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_16'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_17'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_18'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_19'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_20'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_21'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_22'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_23'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_24'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_25'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_CM4X_amip_26'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,2); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Further process C192 AM4 pattern experiments%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ph='/archive/Ming.Zhao/awg/2023.04/'; d='/work/miz/mat_ml/'; 
f='_global_opt2.c48_tsana_hiresmip_new_ivt_1-100_0002-0101_do_3d_atm_2_do_trend_0.mat'; opt=0;
e='c192L33_am4p0_2010climo_newctl';                                 n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,opt); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_am4p0_2010climo_trend_1979_2020_spear';                  n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,opt); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_am4p0_2010climo_trend_1979_2020_times_2';                n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,opt); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,opt); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs';    n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,opt); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_atlantic_mdr_obs'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,opt); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_so_45_75s_obs';    n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,opt); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_best_wegradient';  n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,opt); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_worst_wegradient'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,opt); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_2best_wegradient'; n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,opt); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_2worst_wegradient';n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,opt); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_middle_wegradient';n=strcat(ph,e,'/',e,f); load(n); z=process_array_amip(v,opt); fn=strcat(d,z.expn,'.mat'); save(fn, 'z');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Combine AM4 longamip experiments%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d='/work/miz/mat_ml/'; 
e='c96L33_am4p0_longamip_1850rad';          fn=strcat(d,e,'.mat'); load(fn); zx=z; 
e='c96L33_am4p0_longamip_1850rad_novol_m1'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c96L33_am4p0_longamip';                  fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c96L33_am4p0_longamip_m1';               fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c96L33_am4p0_longamip_m2';               fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c96L33_am4p0_longamip_m1_aero';          fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c96L33_am4p0_longamip_m2_aero';          fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c96L33_am4p0_longamip_m3_aero';          fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c96L33_am4p0_longamip_m1_GHG';           fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c96L33_am4p0_longamip_m2_GHG';           fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c96L33_am4p0_longamip_m3_GHG';           fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c96L33_am4p0_longamip_1850rad_m1';       fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c96L33_am4p0_longamip_en';               fn=strcat(d,e,'.mat'); zx.expn=e; save(fn, 'zx', '-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d='/work/miz/mat_ml/'; 
e='c96L33_am4p0_longamip_en'; fn=strcat(d,e,'.mat'); load(fn); 
e='c96L33_am4p0_longamip_1850rad_m1'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c96L33_am4p0_longamip_en'; fn=strcat(d,e,'.mat'); zx.expn=e; save(fn, 'zx', '-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Combine CM4X experiments%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d='/work/miz/mat_ml/'; 
e='c192L33_CM4X_amip';    fn=strcat(d,e,'.mat'); load(fn); zx=z; 
e='c192L33_CM4X_amip_02'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_03'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_04'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_05'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_06'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_07'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_08'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_09'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_10'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_11'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_12'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_13'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_14'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_15'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_16'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_17'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_18'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_19'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_20'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_21'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_22'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_23'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_24'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_25'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_26'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_en'; fn=strcat(d,e,'.mat'); zx.expn=e; save(fn, 'zx', '-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d='/work/miz/mat_ml/'; 
e='c192L33_CM4X_amip_en'; fn=strcat(d,e,'.mat'); load(fn); 
e='c192L33_CM4X_amip_26'; fn=strcat(d,e,'.mat'); load(fn); zx=append_struct(zx,z);
e='c192L33_CM4X_amip_en'; fn=strcat(d,e,'.mat'); zx.expn=e; save(fn, 'zx', '-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Combine GF experiments%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d='/work/miz/mat_ml/'; fn=strcat(d,'c96L33_am4p0_2010climo_GF_patch','.mat'); load(fn);
expn=patch.expn; expn0='c96L33_am4p0_2010climo'; 
fn=strcat(d,'c96L33_am4p0_2010climo_GF','.mat'); load(fn); z0=z;
i=1; ex=strcat(expn0,'_',expn(i)); fn=strcat(d,ex,'.mat')
load(fn); z=subtract_struct(z,z0); zx=z;
for i=2:length(expn)
  ex=strcat(expn0,'_',expn(i)); fn=strcat(d,ex,'.mat')
  load(fn); z=subtract_struct(z,z0);
  zx=append_struct(zx,z);
end
e='c96L33_am4p0_2010climo_GF_en';     fn=strcat(d,e,'.mat'); zx.expn=e; save(fn, 'zx', '-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d='/work/miz/mat_ml/'; e='c96L33_am4p0_2010climo_GF_en'; fn=strcat(d,e,'.mat'); load(fn);
zx=rotate_struct(zx,153); %zx.tsurf dim 1: patch 1, 2,... 153, 1, 2,... 153, ... after rotation
e='c96L33_am4p0_2010climo_GF_en_rot'; fn=strcat(d,e,'.mat'); zx.expn=e; save(fn, 'zx', '-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Combine C192AM4 pattern experiments%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d='/work/miz/mat_ml/'; f='_global_opt2.c48_tsana_hiresmip_new_ivt_1-100_0002-0101_do_3d_atm_2_do_trend_0.mat';
e='c192L33_am4p0_2010climo_newctl';                                  n=strcat(d,e,'.mat');  load(n);  z0=z;
e='c192L33_am4p0_2010climo_trend_1979_2020_times_2';                 n=strcat(d,e,'.mat');  load(n);  z=subtract_struct(z,z0); zx=z;
e='c192L33_am4p0_2010climo_trend_1979_2020_spear';                   n=strcat(d,e,'.mat');  load(n);  z=subtract_struct(z,z0); zx=append_struct(zx,z);
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_pacific_10ns_obs';  n=strcat(d,e,'.mat');  load(n);  z=subtract_struct(z,z0); zx=append_struct(zx,z);
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_ipwp_30ns_obs';     n=strcat(d,e,'.mat');  load(n);  z=subtract_struct(z,z0); zx=append_struct(zx,z);
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_atlantic_mdr_obs';  n=strcat(d,e,'.mat');  load(n);  z=subtract_struct(z,z0); zx=append_struct(zx,z);
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_so_45_75s_obs';     n=strcat(d,e,'.mat');  load(n);  z=subtract_struct(z,z0); zx=append_struct(zx,z);
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_best_wegradient';   n=strcat(d,e,'.mat');  load(n);  z=subtract_struct(z,z0); zx=append_struct(zx,z);
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_worst_wegradient';  n=strcat(d,e,'.mat');  load(n);  z=subtract_struct(z,z0); zx=append_struct(zx,z);
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_2best_wegradient';  n=strcat(d,e,'.mat');  load(n);  z=subtract_struct(z,z0); zx=append_struct(zx,z);
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_2worst_wegradient'; n=strcat(d,e,'.mat');  load(n);  z=subtract_struct(z,z0); zx=append_struct(zx,z);
e='c192L33_am4p0_2010climo_trend_1979_2020_spear_middle_wegradient'; n=strcat(d,e,'.mat');  load(n);  z=subtract_struct(z,z0); zx=append_struct(zx,z);
e='c192L33_am4p0_2010climo_trend_en'; fn=strcat(d,e,'.mat'); zx.expn=e; save(fn, 'zx', '-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d='/work/miz/mat_ml/'; e='c192L33_am4p0_2010climo_trend_en'; fn=strcat(d,e,'.mat'); load(fn);
zx=rotate_struct(zx,11); %zx.tsurf dim 1: pattern 1, 2,... 11, 1, 2,... 11, ... after rotation
e='c192L33_am4p0_2010climo_trend_en_rot'; fn=strcat(d,e,'.mat'); zx.expn=e; save(fn, 'zx', '-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
