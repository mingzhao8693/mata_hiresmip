function v=do_bony(o,omega,omega_clm,lm0,aa0,lat,lon,latlon,dlo)
%latlon=[0 360 -30 30]; lat=o.lat; lon=o.lon;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
ys=min(find(lat(:)>=lat1)); ye=max(find(lat(:)<=lat2));
xs=min(find(lon(:)>=lon1)); xe=max(find(lon(:)<=lon2));[ys ye xs xe]
lat=lat(ys:ye); lon=lon(xs:xe);
nlat=length(lat); nlon=length(lon); [nlat nlon]
aa0=aa0(ys:ye,xs:xe); lm0=lm0(ys:ye,xs:xe);

s.omeg.all=omega         (:,:,ys:ye,xs:xe);
s.lwcf.all=o.toa.lwcf.all(:,:,ys:ye,xs:xe);
s.swcf.all=o.toa.swcf.all(:,:,ys:ye,xs:xe);
s.ttcf.all=o.toa.ttcf.all(:,:,ys:ye,xs:xe);
s.omeg.clm=omega_clm     (:,  ys:ye,xs:xe);
s.lwcf.clm=o.toa.lwcf.clm(:,  ys:ye,xs:xe);
s.swcf.clm=o.toa.swcf.clm(:,  ys:ye,xs:xe);
s.ttcf.clm=o.toa.ttcf.clm(:,  ys:ye,xs:xe);
s.qal.clm =o.atm.qal.clm (:,  ys:ye,xs:xe);
s.qam.clm =o.atm.qam.clm (:,  ys:ye,xs:xe);
s.qah.clm =o.atm.qah.clm (:,  ys:ye,xs:xe);
s.lwp.clm =o.atm.lwp.clm (:,  ys:ye,xs:xe);
s.iwp.clm =o.atm.iwp.clm (:,  ys:ye,xs:xe);
s.wvp.clm =o.atm.wvp.clm (:,  ys:ye,xs:xe);

v.dlo=dlo; %dlo='do_all' for land+ocean; 'do_ocean' for ocean only

%ommin=-110;   ommax=110;  ombin=10;
%ommin=-115;   ommax=115;  ombin=10;
%ommin=-120;   ommax=120;  ombin=15; 
%ommin=-112.5; ommax=67.5; ombin=15;
%ommin=-127.5; ommax=82.5; ombin=15;
ommin=-130;   ommax=90;   ombin=10;
v.obin=[ommin:ombin:ommax];
v.obinb=v.obin;v.obinc=0.5*(v.obin(1:end-1)+v.obin(2:end));
v.obin(1)=-10000.; v.obin(end)=10000.; 

%using interannually varying omega and CRF
nyr=length(s.omeg.all(:,1,1,1)); 
v.nt=nyr*12; v.nlat=nlat; v.nlon=nlon;
omega=reshape(s.omeg.all,v.nt,v.nlat,v.nlon);
aa=aa0; aa=aa/mean(mean(aa)); %normalize aa0
a=omega; v.lm0=a; 
for i=1:v.nt; a(i,:,:)=aa(:,:); v.lm0(i,:,:)=lm0(:,:); end
var=reshape(s.lwcf.all,v.nt,nlat,nlon);
v.lwcf=sorter_driver(var, omega, v, a)
var=reshape(s.swcf.all,v.nt,nlat,nlon);
v.swcf=sorter_driver(var, omega, v, a)
var=reshape(s.ttcf.all,v.nt,nlat,nlon);
v.ttcf=sorter_driver(var, omega, v, a)

%using climatological omega and CRF
v.nt=12; omega=s.omeg.clm;
a=omega; v.lm0=a; aa=aa0; aa=aa/mean(mean(aa));
for i=1:v.nt; a(i,:,:)=aa(:,:); v.lm0(i,:,:)=lm0(:,:); end
var=reshape(s.lwcf.clm,v.nt,nlat,nlon);
v.lwcf_clm=sorter_driver(var, omega, v, a)
var=reshape(s.swcf.clm,v.nt,nlat,nlon);
v.swcf_clm=sorter_driver(var, omega, v, a)
var=reshape(s.ttcf.clm,v.nt,nlat,nlon);
v.ttcf_clm=sorter_driver(var, omega, v, a)
var=reshape(s.qal.clm,v.nt,nlat,nlon);
v.qal_clm=sorter_driver(var, omega, v, a)
var=reshape(s.qam.clm,v.nt,nlat,nlon);
v.qam_clm=sorter_driver(var, omega, v, a)
var=reshape(s.qah.clm,v.nt,nlat,nlon);
v.qah_clm=sorter_driver(var, omega, v, a)
var=reshape(s.lwp.clm,v.nt,nlat,nlon);
v.lwp_clm=sorter_driver(var, omega, v, a)
var=reshape(s.iwp.clm,v.nt,nlat,nlon);
v.iwp_clm=sorter_driver(var, omega, v, a)
var=reshape(s.wvp.clm,v.nt,nlat,nlon);
v.wvp_clm=sorter_driver(var, omega, v, a)

return

figure; c1=[0.8 0.8 0.8]; c2=[0.5 0.5 0.5]; 
shadedplot(v.obinc,x.avg-x.std,x.avg+x.std,c1,c2); hold on;
plot(v.obinc,x.avg); hold on;
