function v=read_erainterim_3d_new(tpath,latlon,s,t1,t2);
%mod='c48'; fn=strcat('./atmos.static_',mod,'.nc'); 
%latlon=[0 360 -90 90]; s=readgrid_static(fn,latlon);
%tpath='/archive/Ming.Zhao/backup/readobs_data';
%t1=265; t2=396; %Jan2001 - Dec2012
%t1=265; t2=432; %Jan2001 - Dec2015
%tpath='/archive/Ming.Zhao/obs_for_am4p0_paper/';
%latlon=[0 360 -90 90]; region='global'; mod='c96'
%t1=13; t2=432;  %Jan1980 - Dec2014

tpath=strcat(tpath,'/ERA_interim/monthly/');

[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
fn=strcat(tpath,'t.197901-201512.nc')
latname='latitude';lonname='longitude';
%note latitude reversed in the files; data need to be flipped
v.lon=ncread(fn,lonname); 
v.lat=ncread(fn,latname); v.latlon=latlon;
v.ye  =min(find(v.lat(:)<=lat1)); v.ys  =max(find(v.lat(:)>= lat2));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat=v.lat(v.ys:v.ye); v.lon=v.lon(v.xs:v.xe);
v.lat=flipud(v.lat);
a=ncread(fn,'time'); v.time=a(t1:t2); v.nt=length(v.time); v.ts=1; v.te=v.nt;
v.pf=ncread(fn,'levelist'); v.nz=length(v.pf); v
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
lonx=s.lon; latx =s.lat;
% $$$ lev =[37   36  35  34  31   28  26  24  22  20  18  17  15  13  11 10  9  8   7  6];
% $$$ plev=[1000 975 950 925 850 775 700 600 500 400 300 250 200 150 100 70 50 30  20 10];
lev =[37    34  31  28  26  24  22  20  18  17  15  13  11 10  9];
plev=[1000 925 850 775 700 600 500 400 300 250 200 150 100 70 50];
v.lev=lev; v.plev=plev;
%afact=0.00213617807865754; offset=248.596641592917;
varn='t'; fname=strcat(tpath,varn,'.197901-201512.nc')
a=ncread(fname,varn,[1 1 1 1 ],[Inf Inf Inf Inf]); a=permute(a,[4 3 2 1]); 
for k=1:length(lev)
  tmp=a(t1:t2,lev(k),v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  tmp=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  tmp=reshape(tmp,12,v.nt/12,s.nlat,s.nlon); tmp=flipdim(tmp,3);
  v.ta(k).lev =lev(k);  %v.ta(k).all=tmp;
  v.ta(k).plev=plev(k); 
  v.ta(k).clm=squeeze(mean(tmp,2));
  v.ta(k).ann=squeeze(mean(v.ta(k).clm,1));
  v.ta(k).sea=get4season(v.ta(k).clm);
end
varn='q'; fname=strcat(tpath,varn,'.197901-201512.nc')
a=ncread(fname,varn,[1 1 1 1 ],[Inf Inf Inf Inf]); a=permute(a,[4 3 2 1]); 
for k=1:length(lev)
  tmp=a(t1:t2,lev(k),v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  tmp=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  tmp=reshape(tmp,12,v.nt/12,s.nlat,s.nlon); tmp=flipdim(tmp,3);
  v.qv(k).lev =lev(k);  %v.qv(k).all=tmp;
  v.qv(k).plev=plev(k); 
  v.qv(k).clm=squeeze(mean(tmp,2));
  v.qv(k).ann=squeeze(mean(v.qv(k).clm,1));
  v.qv(k).sea=get4season(v.qv(k).clm);
end
varn='r'; fname=strcat(tpath,varn,'.197901-201512.nc')
a=ncread(fname,varn,[1 1 1 1 ],[Inf Inf Inf Inf]); a=permute(a,[4 3 2 1]); 
for k=1:length(lev)
  tmp=a(t1:t2,lev(k),v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  tmp=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  tmp=reshape(tmp,12,v.nt/12,s.nlat,s.nlon); tmp=flipdim(tmp,3);
  v.rh(k).lev =lev(k);  %v.rh(k).all=tmp;
  v.rh(k).plev=plev(k);
  v.rh(k).clm=squeeze(mean(tmp,2));
  v.rh(k).ann=squeeze(mean(v.rh(k).clm,1));
  v.rh(k).sea=get4season(v.rh(k).clm);
end
varn='z'; fname=strcat(tpath,varn,'.197901-201512.nc')
a=ncread(fname,varn,[1 1 1 1 ],[Inf Inf Inf Inf]); a=permute(a,[4 3 2 1]); 
for k=1:length(lev)
  tmp=a(t1:t2,lev(k),v.ys:v.ye,v.xs:v.xe)/G; tmp=squeeze(tmp);
  tmp=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  tmp=reshape(tmp,12,v.nt/12,s.nlat,s.nlon); tmp=flipdim(tmp,3);
  v.za(k).lev =lev(k);  %v.za(k).all=tmp;
  v.za(k).plev=plev(k); 
  v.za(k).clm=squeeze(mean(tmp,2));
  v.za(k).ann=squeeze(mean(v.za(k).clm,1));
  v.za(k).sea=get4season(v.za(k).clm);
end
varn='u'; fname=strcat(tpath,varn,'.197901-201512.nc')
a=ncread(fname,varn,[1 1 1 1 ],[Inf Inf Inf Inf]); a=permute(a,[4 3 2 1]); 
for k=1:length(lev)
  tmp=a(t1:t2,lev(k),v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  tmp=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  tmp=reshape(tmp,12,v.nt/12,s.nlat,s.nlon); tmp=flipdim(tmp,3);
  v.ua(k).lev =lev(k);  %v.ua(k).all=tmp;
  v.ua(k).plev=plev(k); 
  v.ua(k).clm=squeeze(mean(tmp,2));
  v.ua(k).ann=squeeze(mean(v.ua(k).clm,1));
  v.ua(k).sea=get4season(v.ua(k).clm);
end
varn='v'; fname=strcat(tpath,varn,'.197901-201512.nc')
a=ncread(fname,varn,[1 1 1 1 ],[Inf Inf Inf Inf]); a=permute(a,[4 3 2 1]); 
for k=1:length(lev)
  tmp=a(t1:t2,lev(k),v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  tmp=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  tmp=reshape(tmp,12,v.nt/12,s.nlat,s.nlon); tmp=flipdim(tmp,3);
  v.va(k).lev =lev(k);  %v.va(k).all=tmp;
  v.va(k).plev=plev(k); 
  v.va(k).clm=squeeze(mean(tmp,2));
  v.va(k).ann=squeeze(mean(v.va(k).clm,1));
  v.va(k).sea=get4season(v.va(k).clm);
end
varn='w'; fname=strcat(tpath,varn,'.197901-201512.nc')
a=ncread(fname,varn,[1 1 1 1 ],[Inf Inf Inf Inf]); a=permute(a,[4 3 2 1]); 
for k=1:length(lev)
  tmp=a(t1:t2,lev(k),v.ys:v.ye,v.xs:v.xe)*864; tmp=squeeze(tmp);
  tmp=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  tmp=reshape(tmp,12,v.nt/12,s.nlat,s.nlon); tmp=flipdim(tmp,3);
  v.om(k).lev =lev(k);  %v.om(k).all=tmp;
  v.om(k).plev=plev(k); 
  v.om(k).clm=squeeze(mean(tmp,2));
  v.om(k).ann=squeeze(mean(v.om(k).clm,1));
  v.om(k).sea=get4season(v.om(k).clm);
end

for k=1:length(lev)
  v.mse(k).clm=CPD*v.ta(k).clm+v.za(k).clm+LV0*v.qv(k).clm;
  v.mse(k).ann=CPD*v.ta(k).ann+v.za(k).ann+LV0*v.qv(k).ann;
  v.mse(k).sea=CPD*v.ta(k).sea+v.za(k).sea+LV0*v.qv(k).sea;
end

return

mod='c48'; fn=strcat('./atmos.static_',mod,'.nc'); 
latlon=[0 360 -90 90]; o=readgrid_static(fn,latlon);
tpath='/archive/Ming.Zhao/backup/readobs_data/ecmwf-int/monthly/';
t1=265; t2=396; %Jan2001 - Dec2012
t1=265; t2=432; %Jan2001 - Dec2015
v=read_erainterim_3d_new(tpath,latlon,o,t1,t2);
