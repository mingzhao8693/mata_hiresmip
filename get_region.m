function v=get_region(lat,lon,sst,pcp,u10,v10,latlon,glm)
%latlon=[286 375 -21 32]; %NINO3
%lat=v.glat; lon=v.glon; sst=ts_ano;

lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
nyr=length(sst(1,:,1,1)); nt=12*nyr;
nlon=length(lon); nlat=length(lat);

sst=reshape(sst,nt,nlat,nlon);
pcp=reshape(pcp,nt,nlat,nlon);
u10=reshape(u10,nt,nlat,nlon);
v10=reshape(v10,nt,nlat,nlon);

ys=min(find(lat(:)>=lat1)); ye=max(find(lat(:)<= lat2));   
latx=lat(ys:ye);

if (lon1>=0 & lon2<=360)
  xs=min(find(lon(:)>=lon1)); xe=max(find(lon(:)<= lon2));
  lmx =glm(  ys:ye,xs:xe); lonx=lon(xs:xe);
  sstx=sst(:,ys:ye,xs:xe);
  pcpx=pcp(:,ys:ye,xs:xe);
  u10x=u10(:,ys:ye,xs:xe);
  v10x=v10(:,ys:ye,xs:xe);
elseif (lon1>=0 & lon2>360)
    xs=min(find(lon(:)>=lon1)); xe=max(find(lon(:)<= 360));
    lmx =glm(ys:ye,xs:xe); lonx=lon(xs:xe);
    sstx=sst(:,ys:ye,xs:xe);
    pcpx=pcp(:,ys:ye,xs:xe);
    u10x=u10(:,ys:ye,xs:xe);
    v10x=v10(:,ys:ye,xs:xe);
    nx =xe-xs+1; 
    xx=max(find(lon(:)<= lon2-360));
    lmx(:,nx+1:nx+xx)=glm(ys:ye,1:xx); lonx(nx+1:nx+xx)=lon(1:xx);
    sstx(:,:,nx+1:nx+xx)=sst(:,ys:ye,1:xx);
    pcpx(:,:,nx+1:nx+xx)=pcp(:,ys:ye,1:xx);
    u10x(:,:,nx+1:nx+xx)=u10(:,ys:ye,1:xx);
    v10x(:,:,nx+1:nx+xx)=v10(:,ys:ye,1:xx);
end
v.latlon=latlon;
v.nlat =length(latx);
v.nlon =length(lonx);
v.lm   =lmx;
v.lon  =lonx;
v.lat  =latx; 
id=(lonx<100); lonx(id)=lonx(id)+360; v.lonx =lonx;

for i=1:v.nlon
  sstx(:,:,i) =detrend(squeeze(sstx(:,:,i)),'linear');
  pcpx(:,:,i) =detrend(squeeze(pcpx(:,:,i)),'linear');
  u10x(:,:,i) =detrend(squeeze(u10x(:,:,i)),'linear');
  v10x(:,:,i) =detrend(squeeze(v10x(:,:,i)),'linear');
end

v.sstx =reshape(sstx,12,nyr,v.nlat,v.nlon);
v.pcpx =reshape(pcpx,12,nyr,v.nlat,v.nlon);
v.u10x =reshape(u10x,12,nyr,v.nlat,v.nlon);
v.v10x =reshape(v10x,12,nyr,v.nlat,v.nlon);

return



x=get_earth_area(lat,lon); a=x.aa(ys:ye,xs:xe); a=a/mean(mean(a));
x=repmat(a,[1 1 nt]); aa=shiftdim(x,2); 

ssta=mean(mean(zz,3),2);

ssta_detrend=detrend(ssta,'linear'); %detrend ssta

v.ssta = ssta_detrend;
v.ssta_3mon=movmean(v.ssta,3);
v.ssta_5mon=movmean(v.ssta,5);

v.ssta_2d     =reshape(v.ssta,     12,nyr);
v.ssta_3mon_2d=reshape(v.ssta_3mon,12,nyr);
v.ssta_5mon_2d=reshape(v.ssta_5mon,12,nyr);

return
