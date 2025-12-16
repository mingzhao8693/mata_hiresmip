function o=readobs(latlon,region,mod,do_erai_3d)
%latlon=[0 360 -90 90]; region='global'; mod='c96'; do_erai_3d=false;
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
fn=strcat('./atmos.static_',mod,'.nc');
o=readgrid_static(fn,latlon); o.do_erai_3d=do_erai_3d;

tpath='/archive/Ming.Zhao/obs_for_am4p0_paper/';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERA-INTERIM 3D field%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if do_erai_3d
  %Jan1980 - Dec2014
  %t1=13; t2=432; v=read_erainterim_tqzuv_new(tpath,latlon,o,t1,t2); o.atm=v;
  %t1=13; t2=432; v=read_erainterim_tqzuv_new(tpath,latlon,o,t1,t2); o.atm1=v;
   t1=13; t2=432; v=read_erainterim_3d_new(tpath,latlon,o,t1,t2); o.atm=v;
   do_erai_3d_flag = 1;
else
   do_erai_3d_flag = 0;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,'ERA_interim/monthly/era_interim_monthly_197901_201512.nc')
t1=13; t2=432;  %Jan1980 - Dec2014
[sfc toa atm]=read_erainterim_new(fn,latlon,t1,t2,o); 
o.sfc=sfc; o.fn.ERA_INTERIM_2Dfield=sfc.fn;
o.sfc.pcp_era      =sfc.pcp; 
o.sfc.swnet_era    =sfc.swnet;
o.sfc.lwnet_era    =sfc.lwnet;
o.sfc.swnet_clr_era=sfc.swnet_clr;
o.sfc.lwnet_clr_era=sfc.lwnet_clr;
o.sfc.lwdn_era     =sfc.lwdn;
o.sfc.netrad_era   =sfc.netrad;
o.sfc.netflx_era   =sfc.netflx;
%o.sfc.tsurf7915    =tsurf7915;  o.sfc.tref7915=tref7915;
if do_erai_3d
  o.atm.lwnet_era    =atm.lwnet;
  o.atm.swnet_era    =atm.swnet;
  o.atm.netrad_era   =atm.netrad;
  o.atm.lwp=atm.lwp; o.atm.iwp=atm.iwp;  o.atm.wvp=atm.wvp;
  o.atm.qal=atm.qal; o.atm.qam=atm.qam;  o.atm.qah=atm.qah; 
  o.atm.cape=atm.cape;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

path_hadisst='HADISST/monthly/hadisst_186912-202012_';
t1=2; t2=1825;  %1870Jan-2020Dec; 152yrs
varn='sst'; fn=strcat(tpath,path_hadisst,varn,'.nc')
o.sfc.sst_1870_2020=read_data_2d(fn,latlon,t1,t2,o,varn,'lat','lon');

varn='ice'; fn=strcat(tpath,path_hadisst,varn,'.nc')
o.sfc.ice_1870_2020=read_data_2d(fn,latlon,t1,t2,o,varn,'lat','lon');

fn='/archive/Ming.Zhao/backup/ERSSTv5/ERSSTv5_185401-202304_monthly_sst.nc';
t1=193; t2=2004;  %1870Jan-2020Dec; 152yrs
varn='sst'; 
o.sfc.ersst_1870_2020=read_data_2d(fn,latlon,t1,t2,o,varn,'lat','lon');

fn='/archive/Ming.Zhao/backup/COBESST/COBESST_189101-202303_monthly_sst.nc';
t1=1; t2=1560;  %1891Jan-2020Dec; 152yrs
varn='sst'; 
o.sfc.cobesst_1891_2020=read_data_2d(fn,latlon,t1,t2,o,varn,'lat','lon');

fn='/archive/Ming.Zhao/backup/COBE2SST/COBE2SST_185001-201912_monthly_sst.nc';
t1=1; t2=2040;  %1850Jan-2019Dec; 152yrs
varn='sst'; 
o.sfc.cobe2sst_1850_2019=read_data_2d(fn,latlon,t1,t2,o,varn,'lat','lon');

path_cru='CRU/monthly/cru_ts_322.1901-2013.shift.';
t1=949; t2=1356;  %for 1980Jan-2013Dec period;
varn='tmp'; fn=strcat(tpath,path_cru,varn,'.nc')
o.sfc.tas_cru=read_data_2d(fn,latlon,t1,t2,o,varn,'lat','lon');

% $$$ %Precip%%%%%%%%%%%%%%%%%%%%%
% $$$ path_gpcp='GPCP/monthly/gpcp_v2p3_monthly_197901-201607.';
% $$$ %t1=265; t2=444; %2001Jan-2015Dec; 
% $$$ t1=13;  t2=432;	%1980Jan-2014Dec; 
% $$$ varn='precip'; fn=strcat(tpath,path_gpcp,varn,'.nc')
% $$$ o.sfc.pcp1=read_data_2d(fn,latlon,t1,t2,o,varn,'LAT','LON');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%latest GPCP precip data up to 2023%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path_gpcp='GPCP/monthly/gpcp_v2p3_monthly_197901-202302.';
t1=1;  t2=504;	time0='1800-01-01 0:0:0'; %1979Jan-2020Dec; 
varn='precip'; fn=strcat(tpath,path_gpcp,varn,'.nc')
o.sfc.pcp=read_data_2d(fn,latlon,t1,t2,o,varn,'lat','lon','time',time0,1);

path_mswep='/archive/Ming.Zhao/backup/ECMWF/mswep.197901-202012.';
t1=1;  t2=504;	time0='1900-01-01 0:0:0'; %1979Jan-2020Dec; 
varn='precipitation'; fn=strcat(path_mswep,varn,'.nc')
o.sfc.pcp_mswep=read_data_2d(fn,latlon,t1,t2,o,varn,'lat','lon','time',time0,1);

%%%%%%%%%%%%%%%%%%%%%%%
path_gpcc='/archive/Ming.Zhao/backup/ECMWF/gpcc.189101-202012.';
varn='precip'; fn=strcat(path_gpcc,varn,'.nc')
t1=1;  t2=1560; time0='1891-01-01 0:0:0'; 	%1891Jan-2020Dec; 
v=read_data_2d(fn,latlon,t1,t2,o,varn,'lat','lon','time',time0,24);
v.nyr=v.nt/12; tmp=v.all;
for m=1:12
  for i=1:v.nyr
    yr=i-1+1891;
    nday = eomday(yr,m);
    tmp(i,m,:,:)=tmp(i,m,:,:)/nday;
  end
end
v.all=tmp;
v.al0=getts(tmp,o);
v.clm=squeeze(mean(tmp,2));
v.ann=squeeze(mean(v.clm,1));
v.sea=get4season(v.clm); 
o.sfc.pcp_gpcc=v; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path_era5='ERA5/ERA5_194001-202407.';
t1=1;  t2=1008;	time0='1900-01-01 0:0:0'; %1940Jan-2023Dec; 
varn='tp'; fn=strcat(tpath,path_era5,varn,'.nc')
o.sfc.pcp_era5=read_data_2d(fn,latlon,t1,t2,o,varn,'latitude','longitude','time',time0,24);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path_era5='ERA5/ERA5_195901-202112_';
t1=1; t2=756; latname='latitude'; lonname='longitude'; %1959Jan-2021Dec; 63yrs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='sp';  fn=strcat(tpath,path_era5,varn,'.nc')
o.sfc.sp_era5 =read_data_2d(fn,latlon,t1,t2,o,varn,latname,lonname);
varn='t2m'; fn=strcat(tpath,path_era5,varn,'.nc')
o.sfc.t2m_era5=read_data_2d(fn,latlon,t1,t2,o,varn,latname,lonname);
varn='d2m'; fn=strcat(tpath,path_era5,varn,'.nc')
o.sfc.d2m_era5=read_data_2d(fn,latlon,t1,t2,o,varn,latname,lonname); 
%compute RH at 2m%%%%%%
t2m=o.sfc.t2m_era5.all-273.15;
d2m=o.sfc.d2m_era5.all-273.15;
tmp=exp(17.625*d2m./(243.04+d2m))./exp(17.625*t2m./(243.04+t2m));
clear t2m v;
v.all=tmp;
v.al0=getts(tmp,o);
v.clm=squeeze(mean(tmp,2));
v.ann=squeeze(mean(v.clm,1));
v.sea=get4season(v.clm); 
v.clm0=mean(v.al0,1);
v.ts0 =mean(v.al0,2)';
v.ann0=mean(v.ts0);
o.sfc.rh2m_era5=v;
%compute 2m vapor pressure and specific humidity%%%%%%%
vp  = 6.112*exp(17.625*d2m./(d2m+243.04)); clear d2m v; %vapor pressure
tmp = o.sfc.sp_era5.all;          %surface pressure
tmp = EPS*vp./(tmp -vp);          %2m mixing ratio
qref= tmp./(1.+tmp);              %2m specific humidity 
tmp = vp;   clear vp;             %2m vapor pressure
v.all=tmp;
v.al0=getts(tmp,o);
v.clm=squeeze(mean(tmp,2));
v.ann=squeeze(mean(v.clm,1));
v.sea=get4season(v.clm); 
v.clm0=mean(v.al0,1);
v.ts0 =mean(v.al0,2)';
v.ann0=mean(v.ts0);
o.sfc.vpref_era5=v;
tmp = qref; clear qref; %2m specific humidity
v.all=tmp;
v.al0=getts(tmp,o);
v.clm=squeeze(mean(tmp,2));
v.ann=squeeze(mean(v.clm,1));
v.sea=get4season(v.clm); 
v.clm0=mean(v.al0,1);
v.ts0 =mean(v.al0,2)';
v.ann0=mean(v.ts0);
o.sfc.qref_era5=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='msl';   fn=strcat(tpath,path_era5,varn,'.nc')
o.sfc.slp_era5=read_data_2d(fn,latlon,t1,t2,o,varn,latname,lonname);
varn='skt';   fn=strcat(tpath,path_era5,varn,'.nc')
o.sfc.skt_era5=read_data_2d(fn,latlon,t1,t2,o,varn,latname,lonname);
varn='mslhf'; fn=strcat(tpath,path_era5,varn,'.nc')
o.sfc.mslhf_era5=read_data_2d(fn,latlon,t1,t2,o,varn,latname,lonname);
varn='msshf'; fn=strcat(tpath,path_era5,varn,'.nc')
o.sfc.msshf_era5=read_data_2d(fn,latlon,t1,t2,o,varn,latname,lonname);
varn='metss';  fn=strcat(tpath,path_era5,varn,'.nc')
o.sfc.metss_era5=read_data_2d(fn,latlon,t1,t2,o,varn,latname,lonname);
varn='mntss';  fn=strcat(tpath,path_era5,varn,'.nc')
o.sfc.mntss_era5=read_data_2d(fn,latlon,t1,t2,o,varn,latname,lonname);

varn='z200'; fn=strcat(tpath,path_era5,varn,'.nc')
o.atm.z200_era5=read_data_2d(fn,latlon,t1,t2,o,varn,latname,lonname); 
varn='z500'; fn=strcat(tpath,path_era5,varn,'.nc')
o.atm.z500_era5=read_data_2d(fn,latlon,t1,t2,o,varn,latname,lonname);
varn='z700'; fn=strcat(tpath,path_era5,varn,'.nc')
o.atm.z700_era5=read_data_2d(fn,latlon,t1,t2,o,varn,latname,lonname); 
varn='z850'; fn=strcat(tpath,path_era5,varn,'.nc')
o.atm.z850_era5=read_data_2d(fn,latlon,t1,t2,o,varn,latname,lonname); 
%%%%%%%%%%%%%%%%%%%%%%

% $$$ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ %This is old CERES data used in AM4 paper
% $$$ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ fn1=strcat(tpath,'CERES/monthly/CERES_EBAF-TOA_Ed2.8_Subset_200003-201607.nc')
% $$$ fn2=strcat(tpath,'CERES/monthly/CERES_EBAF-Surface_Ed2.8_Subset_200003-201602.nc')
% $$$ t1=11; t2=178;  %for 2001Jan-2014Dec period;
% $$$ v=read_ceres_simple(tpath,fn1,fn2,latlon,t1,t2,o);
%new way to read the data
%fn=strcat(tpath,'CERES/monthly/CERES_EBAF-TOA_Ed2.8_Subset_200003-201607.nc')
%t1=11; t2=178; v1=read_ceres_new(tpath,fn,latlon,t1,t2,o);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%new CERES data up to 2020%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,'CERES_EBAF_Ed4.1/CERES_EBAF_Ed4.1_Subset_200003-202203.nc')
t1=11; t2=250;  %for 2001Jan-2020Dec period;
v=read_ceres_new(tpath,fn,latlon,t1,t2,o);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
o.fn.CERES_TOA=v.fn_ceres; 
o.toa=v.toa; o.toa.yr1=2001; o.toa.yr2=2020; %CERES TOA
o.sfc.swdn         =v.sfc.swdn; %CERES SFC radiation
o.sfc.swup         =v.sfc.swup;
o.sfc.lwdn         =v.sfc.lwdn;
o.sfc.lwup         =v.sfc.lwup;
o.sfc.swnet        =v.sfc.swnet;
o.sfc.lwnet        =v.sfc.lwnet;
o.sfc.netrad       =v.sfc.netrad;
o.sfc.lwnet_clr    =v.sfc.lwnet_clr;
o.sfc.swnet_clr    =v.sfc.swnet_clr;
o.sfc.lwcf         =v.sfc.lwcf;
o.sfc.swcf         =v.sfc.swcf;
o.sfc.ttcf         =v.sfc.ttcf;
o.sfc.netrad_clr   =v.sfc.netrad_clr;
o.sfc.albedo       =v.sfc.albedo;
o.atm.netrad       =v.atm.netrad;
o.atm.lwnet        =v.atm.lwnet;
o.atm.swnet        =v.atm.swnet;
o.atm.lwnet_clr    =v.atm.lwnet_clr;
o.atm.swnet_clr    =v.atm.swnet_clr;
o.atm.netrad_clr   =v.atm.netrad_clr;
o.atm.lwcf         =v.atm.lwcf;
o.atm.swcf         =v.atm.swcf;
o.atm.ttcf         =v.atm.ttcf;

o.toa.netrad_era   =toa.netrad;
o.toa.swnet_era    =toa.swnet;    
o.toa.lwnet_era    =toa.lwnet;
o.toa.swnet_clr_era=toa.swnet_clr;
o.toa.lwnet_clr_era=toa.lwnet_clr;
o.sfc.netflx.clm   =o.sfc.netrad.clm-o.sfc.tshflx.clm;
o.sfc.netflx.ann   =o.sfc.netrad.ann-o.sfc.tshflx.ann;
o.sfc.netflx.sea   =o.sfc.netrad.sea-o.sfc.tshflx.sea;
%net MSE input in atm column, balanced by atm transport in steady state
o.atm.netflx.clm   =-(o.sfc.netflx.clm-o.toa.netrad.clm);
o.atm.netflx.ann   =-(o.sfc.netflx.ann-o.toa.netrad.ann);
o.atm.netflx.sea   =-(o.sfc.netflx.sea-o.toa.netrad.sea);

fn=strcat(tpath,'WOA05/monthly/WOA05_pottemp_salt.nc')
v=read_woa05_simple(fn,latlon,o); o.fn.WOA05=fn;
o.sfc.sst_woa=v.sst;

fn=strcat(tpath,'HADISST/monthly/hadisst_186912-201611_sst.nc')
%t1=1310; t2=1753; %1979Jan-2015Dec; 36yrs
%t1=1574; t2=1753;  %2001Jan-2015Dec; 
t1=1322; t2=1741;  %1980Jan-2014Dec; 35yrs
v=read_hadisst_simple(fn,latlon,t1,t2,o); o.fn.hadisst=fn;
o.sfc.sst=v.sst;

latlon_nino3=[210 270 -5 5]; %NINO3
v=read_hadisst_simple(fn,latlon_nino3,t1,t2,o);
o.sfc.sst_nino3=v.sst;

fn=strcat(tpath,'HADIICE/monthly/c96_hadisst_ice_mask.nc')
v=read_hadiice_simple(fn,latlon,o); o.fn.hadiice=fn;
o.sfc.ice=v.ice;


%fn=strcat(tpath,'gpcp_v2p3_monthly_197901-201607.nc')
%t1=1; t2=444; %1979Jan-2015Dec; 
%v=read_gpcp_simple(fn,latlon,t1,t2,o); o.sfc.pcp7915=v.pcp; 

% $$$ fn=strcat(tpath,'gpcp_v2p1_monthly_197901-200909.nc')
% $$$ t1=1; t2=360; %1979Jan-2008Dec;
% $$$ v=read_gpcp_simple(fn,latlon,t1,t2,o); 
% $$$ o.sfc.pcp7908_gpcpv21=v.pcp;
% $$$ 
% $$$ v=read_gpcp_simple(fn,latlon_nino3,t1,t2,o); 
% $$$ o.sfc.pcp_nino3=v.pcp;
% $$$ 
% $$$ t1=1; t2=372; %1979Jan-2009Dec;
% $$$ v=read_gpcp_simple(fn,latlon,t1,t2,o); 
% $$$ o.sfc.pcp7909=v.pcp;

%xx

%fn=strcat(tpath,'gpcp_v2p2_monthly_1981-2010_c.nc')
%latname='LAT'; lonname='LON'; tname='TIME'; varname='precip_c';
%v=read_pcp_simple(fn,latname,lonname,tname,varname,latlon,o);
%o.sfc.pcp=v.pcp; o.fn.gpcp=fn;

%fn=strcat(tpath,'precip_1981-2000_c.nc')
%latname='lat'; lonname='lon'; tname='time'; varname='PRCP_EST_c';
%v=read_pcp_simple(fn,latname,lonname,tname,varname,latlon,o);
%o.sfc.pcp_cmap=v.pcp; o.fn.cmap=fn;

%fn=strcat(tpath,'CRU/monthly/land_temp_climo.nc')
%v=read_cru_simple(fn,latlon,o); o.fn.CRU=fn;
%o.sfc.tref_cru=v.tas;

do_more = false;
if do_more
  t=[1980:2014]'; t=t-1980
  x=o.sfc.tsurf;   ano.tsurf=getanom(x);
  x=o.sfc.tref;    ano.tref =getanom(x);
  x=o.sfc.pcp;     ano.pcp  =getanom(x);
  y=ano.tsurf.all; o.trend.tsurf=get_trend(t,y);
  y=ano.tref.all;  o.trend.tref =get_trend(t,y);
  y=ano.pcp.all;   o.trend.pcp  =get_trend(t,y); o.trend.time=t+1980;
  %computer CRF sorting into omega scheme for 01/2001-12/2014 period
  latlon_t=[0 360 -30 30]; latlon_nhet=[0 360 30 90]; latlon_shet=[0 360 -90 -30];
  dlo='do_all'; %set dlo=do_all; recover global or regional means
  omega=o.atm_0114.w700.all; omega_clm=o.atm_0114.w700.clm;%unit:hPa/day
  o.om700.glob=do_bony_obs(o,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon,dlo);
  o.om700.trop=do_bony_obs(o,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_t,dlo);
  o.om700.nhet=do_bony_obs(o,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_nhet,dlo);
  o.om700.shet=do_bony_obs(o,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_shet,dlo);
  omega=o.atm_0114.w500.all; omega_clm=o.atm_0114.w500.clm;%unit:hPa/day
  o.om500.glob=do_bony_obs(o,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon,dlo);
  o.om500.trop=do_bony_obs(o,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_t,dlo);
  o.om500.nhet=do_bony_obs(o,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_nhet,dlo);
  o.om500.shet=do_bony_obs(o,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_shet,dlo);
  dlo='do_ocean'; %set dlo=do_ocean
  omega=o.atm_0114.w700.all; omega_clm=o.atm_0114.w700.clm;%unit:hPa/day
  o.om700.glob_ocean=do_bony_obs(o,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon,dlo);
  o.om700.trop_ocean=do_bony_obs(o,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_t,dlo);
  o.om700.nhet_ocean=do_bony_obs(o,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_nhet,dlo);
  o.om700.shet_ocean=do_bony_obs(o,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_shet,dlo);
  omega=o.atm_0114.w500.all; omega_clm=o.atm_0114.w500.clm;%unit:hPa/day
  o.om500.glob_ocean=do_bony_obs(o,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon,dlo);
  o.om500.trop_ocean=do_bony_obs(o,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_t,dlo);
  o.om500.nhet_ocean=do_bony_obs(o,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_nhet,dlo);
  o.om500.shet_ocean=do_bony_obs(o,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_shet,dlo);
  %computer CRF correlation and slope
  o.sfc.tsurf=o.sfc.sst;
  o.crf=regress_mvar(o,o.nlat,o.nlon,1);
%  t=[1979:2015]'; t=t-1979
%  x=o.sfc.tsurf7915; ano.tsurf7915=getanom(x);
%  x=o.sfc.tref7915;  ano.tref7915 =getanom(x);
%  x=o.sfc.pcp7915;   ano.pcp7915  =getanom(x);
%  y=ano.tsurf7915.all;  o.trend.tsurf =get_trend(t,y);
%  y=ano.tref7915.all;   o.trend.tref  =get_trend(t,y);
%  y=ano.pcp7915.all;    o.trend.pcp   =get_trend(t,y); o.trend.time=t+1979;
end

o.ceres_ts_global=compute_ceres_glob_mean_ts();

tpath='/work/miz/mat_hiresmip/'; expn='obs';
fn=strcat(tpath,expn,'_',region,'_to_',mod,'do_erai_3d_',num2str(do_erai_3d_flag),'.mat')
save(fn,'o','-v7.3'); %save(fn,'o');
return

% $$$ t1=265; t2=432; %Jan2001 - Dec2014
% $$$ v=read_erainterim_tqzuv_new(tpath,latlon,o,t1,t2); o.atm_0114=v;

% $$$ %ERA-INTERIM 2D field%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$ fn=strcat(tpath,'ERA_interim/monthly/era_interim_monthly_197901_201512.nc')
% $$$ t1=265; t2=432;  %Jan2001 - Dec2014
% $$$ [sfc_0114 toa_0114 atm_0114]=read_erainterim_new(fn,latlon,t1,t2,o);
% $$$ o.sfc_0114=sfc_0114; 
% $$$ o.toa_0114=toa_0114;
% $$$ o.atm_0114.lwp=atm_0114.lwp;
% $$$ o.atm_0114.iwp=atm_0114.iwp;
% $$$ o.atm_0114.wvp=atm_0114.wvp;
% $$$ o.atm_0114.qal=atm_0114.qal;
% $$$ o.atm_0114.qam=atm_0114.qam;
% $$$ o.atm_0114.qah=atm_0114.qah;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fn=strcat(tpath,'era_interim_monthly_197901_201512.nc')
%t1=1; t2=444; %1979Jan-2015Dec; full range of the data
%[sfc toa atm]=read_erainterim_new(fn,latlon,t1,t2,o);
%tref7915=sfc.tref; tsurf7915=sfc.tsurf;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% $$$ fn=strcat(tpath,'HADISST/monthly/hadisst_186912-201611_sst.nc')
% $$$ t1=2; t2=1741;  %1870Jan-2014Dec; 145yrs
% $$$ v=read_hadisst_simple(fn,latlon,t1,t2,o); o.fn.hadisst=fn;
% $$$ o.sfc.sst_1870_2014=v.sst; %o.sfc.sst_1870_2014.all=0;
% $$$ return

% $$$ fn=strcat(tpath,'HADISST/monthly/hadisst_186912-202012_sst.nc')
% $$$ t1=2; t2=1825;  %1870Jan-2020Dec; 152yrs
% $$$ v=read_hadisst_new(fn,latlon,t1,t2,o,'sst'); o.fn.hadisst=fn;
% $$$ o.sfc.sst_1870_2020=v.sst; 

% $$$ tpath='/archive/Ming.Zhao/obs_for_am4p0_paper/';
% $$$ fn=strcat(tpath,'HADIICE/monthly/hadisst_186912-202012_ice.nc')
% $$$ t1=2; t2=1825;  %1870Jan-2020Dec; 152yrs
% $$$ v=read_hadisst_new(fn,latlon,t1,t2,o,'ice'); o.fn.hadiice=fn;
% $$$ o.sfc.ice_1870_2020=v.ice; 

% $$$ fn='/archive/Ming.Zhao/backup/ECMWF/mswep.197901-202012.precipitation.nc'
% $$$ t1=1;  t2=504;	%1979Jan-2020Dec; 
% $$$ v=read_mswep_precip(fn,latlon,t1,t2,o);
% $$$ o.sfc.pcp_mswep=v.pcp; 

% $$$ fn='/archive/Ming.Zhao/backup/ECMWF/gpcc.189101-202012.precip.nc'
% $$$ t1=1;  t2=1560;	%1891Jan-2020Dec; 
% $$$ v=read_gpcc_precip(fn,latlon,t1,t2,o);
% $$$ o.sfc.pcp_gpcc1=v.pcp; 

% $$$ fn=strcat(tpath,'GPCP/monthly/gpcp_v2p3_monthly_197901-201607.precip.nc')
% $$$ %t1=265; t2=444; %2001Jan-2015Dec; 
% $$$ t1=13;  t2=432;	%1980Jan-2014Dec; 
% $$$ v=read_gpcp_simple(fn,latlon,t1,t2,o); o.fn.gpcp=fn;
% $$$ o.sfc.pcp=v.pcp; 

%fn=strcat(tpath,'HADISST/monthly/hadisst_186912-201611_sst.nc')
%t1=2; t2=1741;  %1870Jan-2014Dec; 145yrs
%v=read_hadisst_simple(fn,latlon,t1,t2,o); o.fn.hadisst=fn;
%o.sfc.sst_1870_2014=v.sst; o.sfc.sst_1870_2014.all=0;

% $$$ fn=strcat(tpath,'CRU/monthly/cru_ts_322.1901-2013.tmp.nc')
% $$$ t1=949; t2=1356;  %for 1980Jan-2013Dec period;
% $$$ v=read_cru_simple(fn,latlon,t1,t2,o); o.fn.CRU=fn;
% $$$ o.sfc.tas=v.sfc.tas;

lon=o.lon; lat=o.lat; m=1; x=squeeze(o.trend.tsurf(m,:,:));
figure; pcolor(lon,lat,x);shading flat;colorbar;caxis([-0.05 0.05]);

lon=o.lon; lat=o.lat; m=1; x=squeeze(o.trend.tref(m,:,:));
figure; pcolor(lon,lat,x);shading flat;colorbar;caxis([-0.05 0.05]);

lon=o.lon; lat=o.lat; m=1; x=squeeze(o.trend.pcp(m,:,:));
figure; pcolor(lon,lat,x);shading flat;colorbar;caxis([-0.05 0.05]);
