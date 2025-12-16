function v=readobs_for_ceres41(latlon,region,mod)
latlon=[0 360 -90 90];region='global';mod='c48';
fn=strcat('./atmos.static_',mod,'.nc');
o=readgrid_static(fn,latlon);

tpath='/archive/Ming.Zhao/obs_for_am4p0_paper/CERES_EBAF_Ed4.1/';

fn1=strcat(tpath,'CERES_EBAF_Ed4.1_Subset_CLIM01-CLIM12.nc')
t1=1; t2=12; o.fn1=fn1;  %for 07/2005-06/2015 period;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
f=netcdf(fn1,'nowrite'); latname='lat'; lonname='lon';fn1

v.lat =f{latname}(:); v.lon=f{lonname}(:); 
v.ys  =min(find(v.lat(:)>=lat1)); v.ye  =max(find(v.lat(:)<= lat2));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat=f{latname}(v.ys:v.ye); v.lon=f{lonname}(v.xs:v.xe);
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
v.time=f{'ctime'}(t1:t2); v.nt=length(v.time); v.ts=1; v.te=v.nt;
s=o; lonx=s.lon; latx =s.lat;

a=f{'toa_cre_sw_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); size(a)
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); size(a)
v.swcftoa_clm=squeeze(mean(a,2));
v.swcftoa_ann=squeeze(mean(v.swcftoa_clm,1));
v.swcftoa_sea=get4season(v.swcftoa_clm);
o.toa.swcf.all=interp_grid(a,lonx,latx,v.lon,v.lat,1);
[o.toa.swcf.av0 o.toa.swcf.ts.ann]=getts0(o.toa.swcf.all,s)

a=f{'toa_cre_lw_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
a=reshape(a,12,v.nt/12,v.nlat,v.nlon);
v.lwcftoa_clm=squeeze(mean(a,2));
v.lwcftoa_ann=squeeze(mean(v.lwcftoa_clm,1));
v.lwcftoa_sea=get4season(v.lwcftoa_clm);
o.toa.lwcf.all=interp_grid(a,lonx,latx,v.lon,v.lat,1);
[o.toa.lwcf.av0 o.toa.lwcf.ts.ann]=getts0(o.toa.lwcf.all,s)

a=f{'toa_cre_net_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
a=reshape(a,12,v.nt/12,v.nlat,v.nlon);
v.ttcftoa_clm=squeeze(mean(a,2));
v.ttcftoa_ann=squeeze(mean(v.ttcftoa_clm,1));
v.ttcftoa_sea=get4season(v.ttcftoa_clm);
o.toa.ttcf.all=interp_grid(a,lonx,latx,v.lon,v.lat,1);
[o.toa.ttcf.av0 o.toa.ttcf.ts.ann]=getts0(o.toa.ttcf.all,s)

a=f{'toa_lw_all_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
a=reshape(a,12,v.nt/12,v.nlat,v.nlon);
v.olr_clm=squeeze(mean(a,2));
v.olr_ann=squeeze(mean(v.olr_clm,1));
v.olr_sea=get4season(v.olr_clm);
o.toa.rlut.all=interp_grid(a,lonx,latx,v.lon,v.lat,1);
[o.toa.rlut.av0 o.toa.rlut.ts.ann]=getts0(o.toa.rlut.all,s)

a=f{'toa_lw_clr_t_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
a=reshape(a,12,v.nt/12,v.nlat,v.nlon);
v.lwclrtoa_clm=squeeze(mean(a,2));
v.lwclrtoa_ann=squeeze(mean(v.lwclrtoa_clm,1));
v.lwclrtoa_sea=get4season(v.lwclrtoa_clm);
o.toa.rlutcs.all=interp_grid(a,lonx,latx,v.lon,v.lat,1);
[o.toa.rlutcs.av0 o.toa.rlutcs.ts.ann]=getts0(o.toa.rlutcs.all,s)

a=f{'toa_lw_clr_c_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
a=reshape(a,12,v.nt/12,v.nlat,v.nlon);
v.lwclrtoa_o_clm=squeeze(mean(a,2));
v.lwclrtoa_o_ann=squeeze(mean(v.lwclrtoa_clm,1));
v.lwclrtoa_o_sea=get4season(v.lwclrtoa_clm);
o.toa.rlutcs_o.all=interp_grid(a,lonx,latx,v.lon,v.lat,1);
[o.toa.rlutcs_o.av0 o.toa.rlutcs_o.ts.ann]=getts0(o.toa.rlutcs_o.all,s)

a=f{'solar_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); rsdt=a;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon);
v.swdntoa_clm=squeeze(mean(a,2));
v.swdntoa_ann=squeeze(mean(v.swdntoa_clm,1));
v.swdntoa_sea=get4season(v.swdntoa_clm);
o.toa.rsdt.all=interp_grid(a,lonx,latx,v.lon,v.lat,1);
[o.toa.rsdt.av0 o.toa.rsdt.ts.ann]=getts0(o.toa.rsdt.all,s)

a=f{'toa_sw_clr_t_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe);
a=reshape(a,12,v.nt/12,v.nlat,v.nlon);
v.swclrtoa_clm=squeeze(mean(a,2));
v.swclrtoa_ann=squeeze(mean(v.swclrtoa_clm,1));
v.swclrtoa_sea=get4season(v.swclrtoa_clm);
o.toa.rsutcs.all=interp_grid(a,lonx,latx,v.lon,v.lat,1);
[o.toa.rsutcs.av0 o.toa.rsutcs.ts.ann]=getts0(o.toa.rsutcs.all,s)

a=f{'toa_sw_all_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); rsut=a;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon);
v.swabs_clm=squeeze(mean(a,2));
v.swabs_ann=squeeze(mean(v.swabs_clm,1));
v.swabs_sea=get4season(v.swabs_clm);
o.toa.rsut.all=interp_grid(a,lonx,latx,v.lon,v.lat,1);
[o.toa.rsut.av0 o.toa.rsut.ts.ann]=getts0(o.toa.rsut.all,s)

a=rsdt-rsut;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon);
v.swabs_clm=squeeze(mean(a,2));
v.swabs_ann=squeeze(mean(v.swabs_clm,1));
v.swabs_sea=get4season(v.swabs_clm);
o.toa.swabs.all=interp_grid(a,lonx,latx,v.lon,v.lat,1);
[o.toa.swabs.av0 o.toa.swabs.ts.ann]=getts0(o.toa.swabs.all,s)

a=f{'toa_net_all_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
a=reshape(a,12,v.nt/12,v.nlat,v.nlon);
v.netradtoa_clm=squeeze(mean(a,2));
v.netradtoa_ann=squeeze(mean(v.netradtoa_clm,1));
v.netradtoa_sea=get4season(v.netradtoa_clm);
o.toa.netrad.all=interp_grid(a,lonx,latx,v.lon,v.lat,1);
[o.toa.netrad.av0 o.toa.netrad.ts.ann]=getts0(o.toa.netrad.all,s)

a=f{'toa_net_clr_t_clim'}(t1:t2,v.ys:v.ye,v.xs:v.xe); 
a=reshape(a,12,v.nt/12,v.nlat,v.nlon);
v.netradtoa_clr_clm=squeeze(mean(a,2));
v.netradtoa_clr_ann=squeeze(mean(v.netradtoa_clr_clm,1));
v.netradtoa_clr_sea=get4season(v.netradtoa_clr_clm);
o.toa.netradcs.all=interp_grid(a,lonx,latx,v.lon,v.lat,1);
[o.toa.netradcs.av0 o.toa.netradcs.ts.ann]=getts0(o.toa.netradcs.all,s)

close(f);

% $$$ tpath='/work/miz/mat_hiresmip_cre/'; expn='obs';
% $$$ fn=strcat(tpath,expn,'_',region,'_to_',mod,'_ceres41.mat');
% $$$ save(fn,'o','-v7.3'); %save(fn,'o');
% $$$ return

%[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%fn=strcat('/work/miz/mat_hiresmip_cre/obs_global_to_c48_ceres41.mat'); load(fn); 

tpath='/archive/Ming.Zhao/backup/ECMWF/'
expn ='ERAI_6h_DATA';
fn=strcat(tpath,expn,'/atmos_static_240_480.nc'); v.lon=ncread(fn,'lon'); 
lat=ncread(fn,'lat'); v.lat=lat;
a=ncread(fn,'land_mask');  v.lm=a';
v.lm(v.lm>=0.5)=1; v.lm(v.lm<0.5)=0; 
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
R0=6371.0e3; dtor=1./180.*pi;
dlat=v.lat(round(v.nlat/2))-v.lat(round(v.nlat/2)-1);
dlon=v.lon(round(v.nlon/2))-v.lon(round(v.nlon/2)-1);
for i=1:v.nlat
  rad=v.lat(i)*dtor; %rad1=(v.lat(i)-0.5*dlat)*dtor;
  v.aa0(i,1:v.nlon)=(R0*cos(rad)*dlon*dtor) * (R0*dlat*dtor);
  v.dx (i,1:v.nlon)=(R0*cos(rad)*dlon*dtor);
  v.dy (i,1:v.nlon)=(R0*dlat*dtor);
  v.f  (i,1:v.nlon)= 2*pi/86400*sin(rad);
end
%i=v.nlat; rad1=(v.lat(i)+0.5*dlat)*dtor; v.dx1(i+1,1:v.nlon)=(R0*cos(rad1)*dlon*dtor);
amean=mean(mean(v.aa0));
v.aa = v.aa0/amean;

tpath='/archive/Ming.Zhao/backup/CERES/daily/ERAI_grid_cdo/';
fn=strcat(tpath,'CERES_daily_20050101-20151231_climo.nc')
mon=[31 28 31 30 31 30 31 31 30 31 30 31]; ddd=cumsum(mon);
d_beg=[1 ddd+1]; d_end=ddd; tbeg=1; tend=365;
varn='toa_lw_all_daily'; 
a=ncread(fn,varn,[1 1 tbeg],[Inf Inf tend]); rlut=a;
varn='toa_lw_clr_daily'; 
a=ncread(fn,varn,[1 1 tbeg],[Inf Inf tend]); 
a=fillmissing(a,'nearest',1);                rlutcs=a;
varn='toa_solar_all_daily'; 
a=ncread(fn,varn,[1 1 tbeg],[Inf Inf tend]); rsdt=a;
varn='toa_sw_all_daily'; 
a=ncread(fn,varn,[1 1 tbeg],[Inf Inf tend]); rsut=a;
varn='toa_sw_clr_daily'; 
a=ncread(fn,varn,[1 1 tbeg],[Inf Inf tend]); rsutcs=a;
varn='toa_net_all_daily'; 
a=ncread(fn,varn,[1 1 tbeg],[Inf Inf tend]); netrad=a;
varn='toa_net_clr_daily'; 
a=ncread(fn,varn,[1 1 tbeg],[Inf Inf tend]); 
a=fillmissing(a,'nearest',1); a=fillmissing(a,'nearest',2); netradcs=a;
varn='toa_alb_all_daily'; 
a=ncread(fn,varn,[1 1 tbeg],[Inf Inf tend]); 
a=fillmissing(a,'nearest',1); a=fillmissing(a,'nearest',2); alb=a;
varn='toa_alb_clr_daily'; 
a=ncread(fn,varn,[1 1 tbeg],[Inf Inf tend]); 
a=fillmissing(a,'nearest',1); a=fillmissing(a,'nearest',2); albcs=a;

aa=v.aa;
for m=1:12
  t1=d_beg(m); t2=d_end(m);
  a=rlut;
  b(m,:,:)=squeeze(mean(a(:,:,t1:t2),3)); c=squeeze(b(m,:,:))'; 
  s.rlut.av0(m)=mean(mean(c.*aa)); s.rlut_all=b;

  a=rlutcs;
  b(m,:,:)=squeeze(mean(a(:,:,t1:t2),3)); c=squeeze(b(m,:,:))'; 
  s.rlutcs.av0(m)=mean(mean(c.*aa)); s.rlutcs_all=b;

  a=rsut;
  b(m,:,:)=squeeze(mean(a(:,:,t1:t2),3)); c=squeeze(b(m,:,:))'; 
  s.rsut.av0(m)=mean(mean(c.*aa)); s.rsut_all=b;
  
  a=rsutcs;
  b(m,:,:)=squeeze(mean(a(:,:,t1:t2),3)); c=squeeze(b(m,:,:))'; 
  s.rsutcs.av0(m)=mean(mean(c.*aa)); s.rsutcs_all=b;

  a=rsdt;
  b(m,:,:)=squeeze(mean(a(:,:,t1:t2),3)); c=squeeze(b(m,:,:))'; 
  s.rsdt.av0(m)=mean(mean(c.*aa)); s.rsdt_all=b;

  a=netrad;
  b(m,:,:)=squeeze(mean(a(:,:,t1:t2),3)); c=squeeze(b(m,:,:))'; 
  s.netrad.av0(m)=mean(mean(c.*aa)); s.netrad_all=b;

  a=netradcs;
  b(m,:,:)=squeeze(mean(a(:,:,t1:t2),3)); c=squeeze(b(m,:,:))'; 
  s.netradcs.av0(m)=mean(mean(c.*aa)); s.netradcs_all=b;

  a=alb;
  b(m,:,:)=squeeze(mean(a(:,:,t1:t2),3)); c=squeeze(b(m,:,:))'; 
  s.alb.av0(m)=mean(mean(c.*aa)); s.alb_all=b;

  a=albcs;
  b(m,:,:)=squeeze(mean(a(:,:,t1:t2),3)); c=squeeze(b(m,:,:))'; 
  s.albcs.av0(m)=mean(mean(c.*aa)); s.albcs_all=b;

  a=rsdt;
  b(m,:,:)=squeeze(mean(a(:,:,t1:t2),3)); c=squeeze(b(m,:,:))'; 
  s.rsdt.av0(m)=mean(mean(c.*aa)); s.rsdt_all=b;

  a=netrad;
  b(m,:,:)=squeeze(mean(a(:,:,t1:t2),3)); c=squeeze(b(m,:,:))'; 
  s.netrad.av0(m)=mean(mean(c.*aa)); s.netrad_all=b;

  a=netradcs;
  b(m,:,:)=squeeze(mean(a(:,:,t1:t2),3)); c=squeeze(b(m,:,:))'; 
  s.netradcs.av0(m)=mean(mean(c.*aa)); s.netradcs_all=b;
end

o.toa_daily=s;

adj.rlut     =o.toa.rlut.av0    -o.toa_daily.rlut.av0;
adj.rlutcs   =o.toa.rlutcs.av0  -o.toa_daily.rlutcs.av0;
adj.rsut     =o.toa.rsut.av0    -o.toa_daily.rsut.av0;
adj.rsutcs   =o.toa.rsutcs.av0  -o.toa_daily.rsutcs.av0;
adj.rsdt     =o.toa.rsdt.av0    -o.toa_daily.rsdt.av0;
adj.netrad   =o.toa.netrad.av0  -o.toa_daily.netrad.av0;
adj.netradcs =o.toa.netradcs.av0-o.toa_daily.netradcs.av0;

o.adj=adj;
tpath='/work/miz/mat_hiresmip_cre/'; expn='obs';
fn=strcat(tpath,expn,'_',region,'_to_',mod,'_ceres41.mat');
save(fn,'o','-v7.3'); %save(fn,'o');

return

pms=[ 0, 0, 950, 800]*2; row=2; col=2;
subplot(row,col,1)
y1=o.toa.rlut.av0; y2=o.toa_daily.rlut.av0;
plot(y1,'b'); hold on; plot(y2,'r'); 
legend('EBAF-monthly','SYN-daily'); title('RLUT');
subplot(row,col,2)
y1=o.toa.rlutcs.av0; y2=o.toa_daily.rlutcs.av0;
plot(y1,'b'); hold on; plot(y2,'r'); 
legend('EBAF-monthly','SYN-daily'); title('RLUTCS');
subplot(row,col,3)
y1=o.toa.rsut.av0; y2=o.toa_daily.rsut.av0;
plot(y1,'b'); hold on; plot(y2,'r'); 
legend('EBAF-monthly','SYN-daily'); title('RSUT');
subplot(row,col,4)
y1=o.toa.rsutcs.av0; y2=o.toa_daily.rsutcs.av0;
plot(y1,'b'); hold on; plot(y2,'r'); 
legend('EBAF-monthly','SYN-daily'); title('RSUTCS');
