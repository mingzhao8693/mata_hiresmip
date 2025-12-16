function x=read1var(fname,varn,v,t1,t2,s,opt)
lonx=s.lon; latx =s.lat;
f=netcdf(fname,'nowrite'); 'FILE OPENED...'
k=37; %1000hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t1000.clm=squeeze(mean(tmp,2));
x.t1000.ann=squeeze(mean(x.t1000.clm,1));
x.t1000.sea=get4season(x.t1000.clm);
k=36; %975hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t975.clm=squeeze(mean(tmp,2));
x.t975.ann=squeeze(mean(x.t975.clm,1));
x.t975.sea=get4season(x.t975.clm);
k=35; %950hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t950.clm=squeeze(mean(tmp,2));
x.t950.ann=squeeze(mean(x.t950.clm,1));
x.t950.sea=get4season(x.t950.clm);
k=34; %925hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t925.clm=squeeze(mean(tmp,2));
x.t925.ann=squeeze(mean(x.t925.clm,1));
x.t925.sea=get4season(x.t925.clm);
k=31; %850hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t850.clm=squeeze(mean(tmp,2));
x.t850.ann=squeeze(mean(x.t850.clm,1));
x.t850.sea=get4season(x.t850.clm);
if (opt==1)
  x.t850.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  x.t850.al0=getts(x.t850.all,s)
end
k=28; %775hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t775.clm=squeeze(mean(tmp,2));
x.t775.ann=squeeze(mean(x.t775.clm,1));
x.t775.sea=get4season(x.t775.clm);
k=26; %700hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t700.clm=squeeze(mean(tmp,2));
x.t700.ann=squeeze(mean(x.t700.clm,1));
x.t700.sea=get4season(x.t700.clm);
if (opt==1)
  x.t700.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  x.t700.al0=getts(x.t700.all,s)
end
k=24; %600hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t600.clm=squeeze(mean(tmp,2));
x.t600.ann=squeeze(mean(x.t600.clm,1));
x.t600.sea=get4season(x.t600.clm);
k=22; %500hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t500.clm=squeeze(mean(tmp,2));
x.t500.ann=squeeze(mean(x.t500.clm,1));
x.t500.sea=get4season(x.t500.clm);
if (opt==1)
  x.t500.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  x.t500.al0=getts(x.t500.all,s)
end
k=20; %400hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t400.clm=squeeze(mean(tmp,2));
x.t400.ann=squeeze(mean(x.t400.clm,1));
x.t400.sea=get4season(x.t400.clm);
k=18; %300hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t300.clm=squeeze(mean(tmp,2));
x.t300.ann=squeeze(mean(x.t300.clm,1));
x.t300.sea=get4season(x.t300.clm);
k=17; %250hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t250.clm=squeeze(mean(tmp,2));
x.t250.ann=squeeze(mean(x.t250.clm,1));
x.t250.sea=get4season(x.t250.clm);
k=15; %200hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t200.clm=squeeze(mean(tmp,2));
x.t200.ann=squeeze(mean(x.t200.clm,1));
x.t200.sea=get4season(x.t200.clm);
k=13; %150hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t150.clm=squeeze(mean(tmp,2));
x.t150.ann=squeeze(mean(x.t150.clm,1));
x.t150.sea=get4season(x.t150.clm);
k=11; %100hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t100.clm=squeeze(mean(tmp,2));
x.t100.ann=squeeze(mean(x.t100.clm,1));
x.t100.sea=get4season(x.t100.clm);
k=10; %70hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t70.clm=squeeze(mean(tmp,2));
x.t70.ann=squeeze(mean(x.t70.clm,1));
x.t70.sea=get4season(x.t70.clm);
k=9; %50hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t50.clm=squeeze(mean(tmp,2));
x.t50.ann=squeeze(mean(x.t50.clm,1));
x.t50.sea=get4season(x.t50.clm);
k=8; %30hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t30.clm=squeeze(mean(tmp,2));
x.t30.ann=squeeze(mean(x.t30.clm,1));
x.t30.sea=get4season(x.t30.clm);
k=7; %20hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t20.clm=squeeze(mean(tmp,2));
x.t20.ann=squeeze(mean(x.t20.clm,1));
x.t20.sea=get4season(x.t20.clm);
k=6; %10hPa
tmp=f{varn}(t1:t2,k,v.ys:v.ye,v.xs:v.xe);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); tmp=flipdim(tmp,3);
x.t10.clm=squeeze(mean(tmp,2));
x.t10.ann=squeeze(mean(x.t10.clm,1));
x.t10.sea=get4season(x.t10.clm);
close(f)

x.t1000.clm =interp_grid(x.t1000.clm,lonx,latx,v.lon,v.lat,1);
x.t1000.ann =interp_grid(x.t1000.ann,lonx,latx,v.lon,v.lat,1);
x.t1000.sea =interp_grid(x.t1000.sea,lonx,latx,v.lon,v.lat,1);
x.t975.clm  =interp_grid(x.t975.clm, lonx,latx,v.lon,v.lat,1);
x.t975.ann  =interp_grid(x.t975.ann, lonx,latx,v.lon,v.lat,1);
x.t975.sea  =interp_grid(x.t975.sea, lonx,latx,v.lon,v.lat,1);
x.t950.clm  =interp_grid(x.t950.clm, lonx,latx,v.lon,v.lat,1);
x.t950.ann  =interp_grid(x.t950.ann, lonx,latx,v.lon,v.lat,1);
x.t950.sea  =interp_grid(x.t950.sea, lonx,latx,v.lon,v.lat,1);
x.t925.clm  =interp_grid(x.t925.clm, lonx,latx,v.lon,v.lat,1);
x.t925.ann  =interp_grid(x.t925.ann, lonx,latx,v.lon,v.lat,1);
x.t925.sea  =interp_grid(x.t925.sea, lonx,latx,v.lon,v.lat,1);
x.t850.clm  =interp_grid(x.t850.clm, lonx,latx,v.lon,v.lat,1);
x.t850.ann  =interp_grid(x.t850.ann, lonx,latx,v.lon,v.lat,1);
x.t850.sea  =interp_grid(x.t850.sea, lonx,latx,v.lon,v.lat,1);
x.t775.clm  =interp_grid(x.t775.clm, lonx,latx,v.lon,v.lat,1);
x.t775.ann  =interp_grid(x.t775.ann, lonx,latx,v.lon,v.lat,1);
x.t775.sea  =interp_grid(x.t775.sea, lonx,latx,v.lon,v.lat,1);
x.t700.clm  =interp_grid(x.t700.clm, lonx,latx,v.lon,v.lat,1);
x.t700.ann  =interp_grid(x.t700.ann, lonx,latx,v.lon,v.lat,1);
x.t700.sea  =interp_grid(x.t700.sea, lonx,latx,v.lon,v.lat,1);
x.t600.clm  =interp_grid(x.t600.clm, lonx,latx,v.lon,v.lat,1);
x.t600.ann  =interp_grid(x.t600.ann, lonx,latx,v.lon,v.lat,1);
x.t600.sea  =interp_grid(x.t600.sea, lonx,latx,v.lon,v.lat,1);
x.t500.clm  =interp_grid(x.t500.clm, lonx,latx,v.lon,v.lat,1);
x.t500.ann  =interp_grid(x.t500.ann, lonx,latx,v.lon,v.lat,1);
x.t500.sea  =interp_grid(x.t500.sea, lonx,latx,v.lon,v.lat,1);
x.t400.clm  =interp_grid(x.t400.clm, lonx,latx,v.lon,v.lat,1);
x.t400.ann  =interp_grid(x.t400.ann, lonx,latx,v.lon,v.lat,1);
x.t400.sea  =interp_grid(x.t400.sea, lonx,latx,v.lon,v.lat,1);
x.t300.clm  =interp_grid(x.t300.clm, lonx,latx,v.lon,v.lat,1);
x.t300.ann  =interp_grid(x.t300.ann, lonx,latx,v.lon,v.lat,1);
x.t300.sea  =interp_grid(x.t300.sea, lonx,latx,v.lon,v.lat,1);
x.t250.clm  =interp_grid(x.t250.clm, lonx,latx,v.lon,v.lat,1);
x.t250.ann  =interp_grid(x.t250.ann, lonx,latx,v.lon,v.lat,1);
x.t250.sea  =interp_grid(x.t250.sea, lonx,latx,v.lon,v.lat,1);
x.t200.clm  =interp_grid(x.t200.clm, lonx,latx,v.lon,v.lat,1);
x.t200.ann  =interp_grid(x.t200.ann, lonx,latx,v.lon,v.lat,1);
x.t200.sea  =interp_grid(x.t200.sea, lonx,latx,v.lon,v.lat,1);
x.t150.clm  =interp_grid(x.t150.clm, lonx,latx,v.lon,v.lat,1);
x.t150.ann  =interp_grid(x.t150.ann, lonx,latx,v.lon,v.lat,1);
x.t150.sea  =interp_grid(x.t150.sea, lonx,latx,v.lon,v.lat,1);
x.t100.clm  =interp_grid(x.t100.clm, lonx,latx,v.lon,v.lat,1);
x.t100.ann  =interp_grid(x.t100.ann, lonx,latx,v.lon,v.lat,1);
x.t100.sea  =interp_grid(x.t100.sea, lonx,latx,v.lon,v.lat,1);
x.t70.clm   =interp_grid(x.t70.clm, lonx,latx,v.lon,v.lat,1);
x.t70.ann   =interp_grid(x.t70.ann, lonx,latx,v.lon,v.lat,1);
x.t70.sea   =interp_grid(x.t70.sea, lonx,latx,v.lon,v.lat,1);
x.t50.clm   =interp_grid(x.t50.clm, lonx,latx,v.lon,v.lat,1);
x.t50.ann   =interp_grid(x.t50.ann, lonx,latx,v.lon,v.lat,1);
x.t50.sea   =interp_grid(x.t50.sea, lonx,latx,v.lon,v.lat,1);
x.t30.clm   =interp_grid(x.t30.clm, lonx,latx,v.lon,v.lat,1);
x.t30.ann   =interp_grid(x.t30.ann, lonx,latx,v.lon,v.lat,1);
x.t30.sea   =interp_grid(x.t30.sea, lonx,latx,v.lon,v.lat,1);
x.t20.clm   =interp_grid(x.t20.clm, lonx,latx,v.lon,v.lat,1);
x.t20.ann   =interp_grid(x.t20.ann, lonx,latx,v.lon,v.lat,1);
x.t20.sea   =interp_grid(x.t20.sea, lonx,latx,v.lon,v.lat,1);
x.t10.clm   =interp_grid(x.t10.clm, lonx,latx,v.lon,v.lat,1);
x.t10.ann   =interp_grid(x.t10.ann, lonx,latx,v.lon,v.lat,1);
x.t10.sea   =interp_grid(x.t10.sea, lonx,latx,v.lon,v.lat,1);

x.t1000.latdis.sea = squeeze(mean(x.t1000.sea,3));
x.t975.latdis.sea  = squeeze(mean(x.t975.sea,3));
x.t950.latdis.sea  = squeeze(mean(x.t950.sea,3));
x.t925.latdis.sea  = squeeze(mean(x.t925.sea,3));
x.t850.latdis.sea  = squeeze(mean(x.t850.sea,3));
x.t775.latdis.sea  = squeeze(mean(x.t775.sea,3));
x.t700.latdis.sea  = squeeze(mean(x.t700.sea,3));
x.t600.latdis.sea  = squeeze(mean(x.t600.sea,3));
x.t500.latdis.sea  = squeeze(mean(x.t500.sea,3));
x.t400.latdis.sea  = squeeze(mean(x.t400.sea,3));
x.t300.latdis.sea  = squeeze(mean(x.t300.sea,3));
x.t250.latdis.sea  = squeeze(mean(x.t250.sea,3));
x.t200.latdis.sea  = squeeze(mean(x.t200.sea,3));
x.t150.latdis.sea  = squeeze(mean(x.t150.sea,3));
x.t100.latdis.sea  = squeeze(mean(x.t100.sea,3));
x.t70.latdis.sea   = squeeze(mean(x.t70.sea,3));
x.t50.latdis.sea   = squeeze(mean(x.t50.sea,3));
x.t30.latdis.sea   = squeeze(mean(x.t30.sea,3));
x.t20.latdis.sea   = squeeze(mean(x.t20.sea,3));
x.t10.latdis.sea   = squeeze(mean(x.t10.sea,3));

