function z0=process_array_amip(v,opt)
%load('/archive/Ming.Zhao/awg/warsaw/c96L33_am4p0_longamip_1850rad/c96L33_am4p0_longamip_1850rad_global_opt2.c48_tsana_hiresmip_new_ivt_1979-2014_1870-2014_do_3d_atm_2_do_trend_0.mat');
  z0.expn=v.expn; z0.yr1=v.t1; z0.yr2=v.t2-1;
  z0.sea={'ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'}; s=v.s;
  z0.lat=s.lat; z0.lon=s.lon; z0.nlat=s.nlat; z0.nlon=s.nlon; z0.lm=s.lm0; z0.aa=s.aa; z0.im=get4season_all(s.im); 
  
  a=squeeze(v.sfc.tsurf.all (:,:,:,:)); a=get4season_all(a); z0.tsurf =a; c.tsurf =squeeze(mean(a,1));
  a=squeeze(v.sfc.ice.all   (:,:,:,:)); a=get4season_all(a); z0.ice   =a; c.ice   =squeeze(mean(a,1));
  a=squeeze(v.sfc.pcp.all   (:,:,:,:)); a=get4season_all(a); z0.pcp   =a; c.pcp   =squeeze(mean(a,1));
  a=squeeze(v.toa.netrad.all(:,:,:,:)); a=get4season_all(a); z0.netrad=a; c.netrad=squeeze(mean(a,1));
  a=squeeze(v.toa.lwcf.all  (:,:,:,:)); a=get4season_all(a); z0.lwcf  =a; c.lwcf  =squeeze(mean(a,1));
  a=squeeze(v.toa.swcf.all  (:,:,:,:)); a=get4season_all(a); z0.swcf  =a; c.swcf  =squeeze(mean(a,1));
  
%klev=[1, 2, 3, 4, 5]; %selected vertical levels for 850, 700, 500, 300, 200hPa
  k=1; %850hPa
  a=v.atm.za(k).all; a=get4season_all(a); z0.z850 =a; c.z850 =squeeze(mean(a,1));
  a=v.atm.ua(k).all; a=get4season_all(a); z0.u850 =a; c.u850 =squeeze(mean(a,1));
  a=v.atm.va(k).all; a=get4season_all(a); z0.v850 =a; c.v850 =squeeze(mean(a,1));
  if isfield(v.atm, 'om') 
    a=v.atm.om(k).all; a=get4season_all(a); z0.om850=a; c.om850=squeeze(mean(a,1));
  end
  k=3; %500hPa
  a=v.atm.za(k).all; a=get4season_all(a); z0.z500 =a; c.z500 =squeeze(mean(a,1));
  a=v.atm.ua(k).all; a=get4season_all(a); z0.u500 =a; c.u500 =squeeze(mean(a,1));
  a=v.atm.va(k).all; a=get4season_all(a); z0.v500 =a; c.v500 =squeeze(mean(a,1));
  if isfield(v.atm, 'om') 
    a=v.atm.om(k).all; a=get4season_all(a); z0.om500=a; c.om500=squeeze(mean(a,1));
  end
  k=5; %200hPa
  a=v.atm.za(k).all; a=get4season_all(a); z0.z200 =a; c.z200 =squeeze(mean(a,1));
  a=v.atm.ua(k).all; a=get4season_all(a); z0.u200 =a; c.u200 =squeeze(mean(a,1));
  a=v.atm.va(k).all; a=get4season_all(a); z0.v200 =a; c.v200 =squeeze(mean(a,1));
  if isfield(v.atm, 'om') 
    a=v.atm.om(k).all; a=get4season_all(a); z0.om200=a; c.om200=squeeze(mean(a,1));
  end

  z0.clm=c;
  
  if opt==1; %c48
    [latx,lonx]=loadlatlon('c48');
    z0=interp_miz(z0,lonx,latx);
  elseif opt==2;
    z0=obtain_anom(z0);
  end
  
  return

  
