function v=readts_grid_2d(tpath, expn, fname, latlon, mod)

%tpath='/archive/Ming.Zhao/am4_spear/';
%expn ='SPEAR_c192_o1_Hist_AllForc_IC1921_K50_ens_01';
%yr1='1921'; yr2='2100';
%pp='/ts_all/'; fext =strcat('atmos.',yr1,'01-',yr2,'12.');
%varn='t_surf'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
%latlon=[0 360 -90 90]; 

[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%lat1=-90; lat2=90; lon1=1.25; lon2=358.75; %global
%lat1=-31; lat2=31; lon1=1.25; lon2=358.75; %global tropical
%lat1=-25; lat2=10; lon1=275;  lon2=330;    %amazon
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);

fn=fname;
v.lon=ncread(fn,'lon'); v.lat=ncread(fn,'lat'); %v.time=ncread(fn,'time');
v.ys  =min(find(v.lat(:)>=lat1)); v.ye  =max(find(v.lat(:)<= lat2));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat=v.lat(v.ys:v.ye); v.lon=v.lon(v.xs:v.xe);
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;

R0=6371.0e3; dtor=1./180.*pi;
for i=1:v.nlat
  rad=v.lat(i)*dtor;
  dlat=v.lat(round(v.nlat/2))-v.lat(round(v.nlat/2)-1);
  dlon=v.lon(round(v.nlon/2))-v.lon(round(v.nlon/2)-1);
  v.aa0(i,1:v.nlon)=(R0*cos(rad)*dlon*dtor) * (R0*dlat*dtor);
  v.dx (i,1:v.nlon)=(R0*cos(rad)*dlon*dtor);
  v.dy (i,1:v.nlon)=(R0*dlat*dtor);
  v.f  (i,1:v.nlon)= 2*pi/86400*sin(rad);
end;

amean=mean(mean(v.aa0));
v.aa = v.aa0/amean;

if exist('mod','var')
  %fn=strcat(tpath,expn,'/ts_all/atmos.static.nc')
  fn=strcat('./atmos.static.',mod,'.nc')
  a=ncread(fn,'land_mask',[1 1],[Inf Inf]);
  a=permute(a,[2 1]);
  v.lmg=a;
  v.lm0=a(v.ys:v.ye,v.xs:v.xe);
end

return
