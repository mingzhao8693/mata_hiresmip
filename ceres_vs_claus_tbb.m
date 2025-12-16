tpath='/archive/Ming.Zhao/backup/ECMWF/'; Tb_th=-30;
expn ='ERAI_6h_DATA'; yr1=2001; yr2=2001; pct=[99 99.9]; opt='obs';
fn=strcat(tpath,expn,'/atmos_static_240_480.nc'); 
v.lon=ncread(fn,'lon'); v.lat=ncread(fn,'lat'); lon=v.lon; lat=v.lat;
a=ncread(fn,'land_mask'); v.lm=a';
v.lm(v.lm>=0.5)=1; v.lm(v.lm<0.5)=0;
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;

exd='/atmos_data_240_480/ceres_6hr_avg/'; yr='2001'; v.nt=1460;
fn=strcat(tpath,expn,exd,'ceres.',yr,'0101-',yr,'1231','.toa_lw_all.nc'); disp(fn);
a=ncread(fn,'toa_lw_all',[1 1 1],[Inf Inf v.nt]); 
a(a<80)=NaN; a=fillmissing(a,'nearest'); 
tf=(a/(5.67*10^(-8))).^(1/4); a=1.228; b=-1.106*10^(-3);
tb=(-a+sqrt(a^2+4*b.*tf))/(2*b); a=tb; clear tf tb; tbb_ceres=a;
lat=ncread(fn,'lat'); lon=ncread(fn,'lon');
%id=(a<=Tbb_th); tbb_233=a; tbb_233(id)=1; tbb_233(~id)=0;
%a=a-olr_climo; idx=(a<Tb_th); %mid-to-high latitudes

exd='/atmos_data_240_480/claus_6hr_avg/'; yr='2001'; v.nt=1460;
fn=strcat(tpath,expn,exd,'claus_',yr,'_ERAI_grid.nc'); disp(fn);
a=ncread(fn,'temperature',[1 1 1],[Inf Inf v.nt]); 
a(a==min(min(min(a))))=NaN; a=fillmissing(a,'nearest'); tbb_claus=a;

latlon=[0 360 -90 90];
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
ys=min(find(v.lat(:)>=lat1)); ye=max(find(v.lat(:)<= lat2));
xs=min(find(v.lon(:)>=lon1)); xe=max(find(v.lon(:)<= lon2));

i1=1200; i2=1400; tbb0=250; x=v.lon(xs:xe); y=v.lat(ys:ye);
z1=squeeze(tbb_ceres(xs:xe,ys:ye,i1:i2)); xx=reshape(z1,480*240*(i2-i1+1),1);
z2=squeeze(tbb_claus(xs:xe,ys:ye,i1:i2)); yy=reshape(z2,480*240*(i2-i1+1),1);
i=1; z1=squeeze(z1(:,:,i))'; z2=squeeze(z2(:,:,i))';

pms=[ 0, 0, 1200, 1200]*1.1; row=2; col=2; cmin=180; cmax=250;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); a=z1; a(a>tbb0)=NaN; colormap(jet);
pcolor(x,y,a); shading flat; colorbar; caxis([cmin cmax]);
title('(a) CERES');
subplot(row,col,2); a=z2; a(a>tbb0)=NaN; 
pcolor(x,y,a); shading flat; colorbar; caxis([cmin cmax]);
title('(b) CLAUS');
subplot(row,col,3); a=z1-z2;
pcolor(x,y,a); shading flat; colorbar; caxis([-5 5]);
title('(c) CERES minus CLAUS');
subplot(row,col,4);
c=polyfit(xx,yy,1); x1=[0:1:350]; y1=c(1)*x1+c(2); c
plot(xx,yy,'.'); hold on; plot(x1,y1,'r'); grid on;
xlabel('CERES TB'); ylabel('CLAUS TB'); 

id=(z1<tbb0); xx=xx(id); yy=yy(id);
c=polyfit(xx,yy,1); x1=[0:1:350]; y1=c(1)*x1+c(2); c
plot(z1,z2,'.'); hold on; plot(x1,y1,'b'); grid on;
%axis([0 50 0 50]);
xlabel('CERES TB'); ylabel('CLAUS TB'); 



i=360; 
x=tbb_ceres(:,:,1:i); y=tbb_claus(:,:,1:i);
x=reshape(x,480*240*length(x(1,1,:)),1);
y=reshape(y,480*240*length(y(1,1,:)),1);
c=polyfit(x,y,1); 
x1=[min(min(x)):1:max(max(x))];
y1=c(1)*x1+c(2); c
figure; plot(x,y,'.'); hold on; plot(x1,y1); grid on;

