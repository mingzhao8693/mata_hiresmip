function z0=process_array(v0,opt)
  %v0=z.v0; opt=0;
  z0.sea={'ANN','MAM','JJA','SON','DJF','NDJFM','MJJAS'}; s=v0.s;
  z0.lat=s.lat; z0.lon=s.lon; z0.nlat=s.nlat; z0.nlon=s.nlon; z0.lm=s.lm0; z0.aa=s.aa; z0.im=get4season_all(s.im); 
  z0.lm=repmat(permute(z0.lm, [3 1 2]), [7 1 1]);
  z0.aa=repmat(permute(z0.aa, [3 1 2]), [7 1 1]);
  
  a=squeeze(v0.sfc.tsurf.all (:,:,:,:)); a=get4season_all(a); z0.tsurf =squeeze(mean(a,1));
  a=squeeze(v0.sfc.pcp.all   (:,:,:,:)); a=get4season_all(a); z0.pcp   =squeeze(mean(a,1));
  a=squeeze(v0.toa.netrad.all(:,:,:,:)); a=get4season_all(a); z0.netrad=squeeze(mean(a,1));
  a=squeeze(v0.toa.lwcf.all  (:,:,:,:)); a=get4season_all(a); z0.lwcf  =squeeze(mean(a,1));
  a=squeeze(v0.toa.swcf.all  (:,:,:,:)); a=get4season_all(a); z0.swcf  =squeeze(mean(a,1));
%klev=[3, 5, 7, 9, 11]; %selected vertical levels 850, 700, 500, 300, 200hPa
  k=7; %500hPa
  a=squeeze(v0.atm.za(k).clm(:,:,:,:)); a=get4season_all(a); z0.z500 =a;
  a=squeeze(v0.atm.ua(k).clm(:,:,:,:)); a=get4season_all(a); z0.u500 =a;
  a=squeeze(v0.atm.va(k).clm(:,:,:,:)); a=get4season_all(a); z0.v500 =a;
  a=squeeze(v0.atm.om(k).clm(:,:,:,:)); a=get4season_all(a); z0.om500=a;
  k=3; %850hPa
  a=squeeze(v0.atm.za(k).clm(:,:,:,:)); a=get4season_all(a); z0.z850 =a;
  a=squeeze(v0.atm.ua(k).clm(:,:,:,:)); a=get4season_all(a); z0.u850 =a;
  a=squeeze(v0.atm.va(k).clm(:,:,:,:)); a=get4season_all(a); z0.v850 =a;
  a=squeeze(v0.atm.om(k).clm(:,:,:,:)); a=get4season_all(a); z0.om850=a;
  k=11; %200hPa
  a=squeeze(v0.atm.za(k).clm(:,:,:,:)); a=get4season_all(a); z0.z200 =a;
  a=squeeze(v0.atm.ua(k).clm(:,:,:,:)); a=get4season_all(a); z0.u200 =a;
  a=squeeze(v0.atm.va(k).clm(:,:,:,:)); a=get4season_all(a); z0.v200 =a;
  a=squeeze(v0.atm.om(k).clm(:,:,:,:)); a=get4season_all(a); z0.om200=a;

  if opt==1; %c48
    [latx,lonx]=loadlatlon('c48');
    z0=interp_miz(z0,lonx,latx)
  end
  
  return
