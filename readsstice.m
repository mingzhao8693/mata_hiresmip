function [x]=readsstice(tpath,expn,pp,yr1,yr2,t1,t2)
%tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
%expn ='CM4_abrupt4xCO2_C'; yr1='0001';yr2='0150';
%pp='/ts_all/';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fname='atmos.static.nc'; fn=strcat(tpath,expn,'/',fname)
lm=ncread(fn,'land_mask');

fext =strcat('atmos.',yr1,'01-',yr2,'12.');
varn='t_surf'; fn=strcat(tpath,expn,pp,fext,varn,'.nc')
lat=ncread(fn,'lat'); nlat=length(lat);
lon=ncread(fn,'lon'); nlon=length(lon); 

a=ncread(fn,'t_surf'); 
n=length(a(1,1,:)); a=reshape(a,nlon,nlat,12,n/12);
sst_climo=mean(a(:,:,:,t1:t2),4); sst=a(:,:,:,t1:t2);

varn='ice_mask'; fn=strcat(tpath,expn,pp,fext,varn,'.nc')
a=ncread(fn,'ice_mask'); 
n=length(a(1,1,:)); a=reshape(a,nlon,nlat,12,n/12);
ice_climo=mean(a(:,:,:,t1:t2),4); ice=a(:,:,:,t1:t2);

R0=6371.0e3; dtor=1./180.*pi;
dlat=lat(round(nlat/2))-lat(round(nlat/2)-1);
dlon=lon(round(nlon/2))-lon(round(nlon/2)-1);
for i=1:nlat
  rad=lat(i)*dtor; 
  aa0(i,1:nlon)=(R0*cos(rad)*dlon*dtor) * (R0*dlat*dtor);
  dx (i,1:nlon)=(R0*cos(rad)*dlon*dtor);
  dy (i,1:nlon)=(R0*dlat*dtor);
  f  (i,1:nlon)= 2*pi/86400*sin(rad);
end
amean=mean(mean(aa0)); aa=aa0/amean; aa=aa';
%compute mean SST over oceanic regions (lm==0|im==0)%
for m=1:12
  a=aa; 
  im=ice_climo(:,:,m);
  id=~((lm>0)|(im>0)); 
  a=a/mean(a(id)); %v.a(:,:,m)=a;
  b=sst_climo(:,:,m);
  sst_omean(m)=mean(b(id).*a(id));
end
x.sst_omean0=mean(sst_omean);
x.sst_omean =sst_omean;
x.sst_climo =sst_climo; x.sst_ann=squeeze(mean(sst_climo,3));
x.ice_climo =ice_climo; x.ice_ann=squeeze(mean(ice_climo,3));
x.lat=lat; x.lon=lon; x.nlat=nlat; x.nlon=nlon;
x.aa=aa;
x.lm=lm;

for t=1:length(sst(1,1,1,:))
  for m=1:12
    a=aa; 
    im=ice(:,:,m,t);
    id=~((lm>0)|(im>0)); 
    a=a/mean(a(id)); 
    b=sst(:,:,m,t);
    sst_omean_glob(m,t)=mean(b(id).*a(id));
  end
end
x.sst_omean_glob    =sst_omean_glob;
x.sst_omean_glob_ann=squeeze(mean(sst_omean_glob,1));
  
