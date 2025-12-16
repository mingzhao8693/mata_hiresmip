function [v]=readar_limit(tpath,expn,yr1,yr2,ardir,opt)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/backup/ECMWF/';
%expn ='ERAI_6h_DATA'; yr1=1979; yr2=2014; opt='obs';
%tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
%expn ='c192L33_am4p0_amip_HIRESMIP_H8'; yr1=1979; yr2=2014; opt='mod';
%expn ='c192L33_am4p0_amip_HIRESMIP_future_ssp585_2'; yr1=2015; yr2=2050; opt='mod';
%expn ='c192L33_am4p0_2010climo_new_p4K'; yr1=2; yr2=31; opt='mod';

fn=strcat(tpath,expn,'/atmos.static.nc'); v.lon=ncread(fn,'lon'); v.expn=expn;
if strcmp(opt,'obs')
  lat=ncread(fn,'lat'); v.lat=flipud(lat);
  a=ncread(fn,'land_mask'); a=a'; v.lm=flipud(a);
else
  v.lat=ncread(fn,'lat'); a=ncread(fn,'land_mask'); v.lm=a';
end
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

v.yr1=yr1; v.yr2=yr2; v.nyr=yr2-yr1+1;
for t=1:v.nyr
  yrt=yr1+t-1; 
  if (yrt<10)
    yr=strcat('000',num2str(yrt));
  elseif (yrt<100)
    yr=strcat('00',num2str(yrt));
  elseif (yrt<1000)
    yr=strcat('0',num2str(yrt));
  else
    yr=num2str(yrt);
  end
  if strcmp(ardir,'AR')
    fn=strcat(tpath,expn,'/',ardir,'/',expn,'_',yr,'_pixel_ivt_limit.nc');
  else
    fn=strcat(tpath,expn,'/',ardir,'/',expn,'_',yr,'_pixel_ivt_limit_new.nc');
  end
  disp(fn);
  v.time=ncread(fn,'time'); v.nt=length(v.time); b=ncread(fn,'lat');
  a=ncread(fn,'ivt'); a=permute(a,[3 2 1]); 
  i1=12*(t-1)+1; i2=i1+12-1;
  ivt(i1:i2,:,:)=a;
end
v.ivt_limit=reshape(ivt,12,v.nyr,v.nlat,v.nlon);
v.ivt_limit_clm=get_clm_ann(v.ivt_limit);

epath='/work/miz/mat_AR/';
fnmat=strcat(epath,expn,'_',num2str(yr1),'_',num2str(yr2),'_',ardir,'_readar_limit.mat')

save(fnmat,'v','-v7.3'); %save(fnmat,'v');

return

tpath='/archive/Ming.Zhao/backup/ECMWF/';
expn ='ERAI_6h_DATA'; yr1=1979; yr2=2014; opt='obs';
v=readar_limit(tpath,expn,yr1,yr2,opt)

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn ='c192L33_am4p0_amip_HIRESMIP_H8'; yr1=1979; yr2=2014; opt='mod';
v=readar_limit(tpath,expn,yr1,yr2,opt)

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn ='c192L33_am4p0_amip_HIRESMIP_future_ssp585_2'; yr1=2015; yr2=2050; opt='mod';
v=readar_limit(tpath,expn,yr1,yr2,opt)

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn ='c192L33_am4p0_2010climo_new'; yr1=2; yr2=31; opt='mod';
v=readar_limit(tpath,expn,yr1,yr2,opt)

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn ='c192L33_am4p0_2010climo_new_p4K'; yr1=2; yr2=31; opt='mod';
v=readar_limit(tpath,expn,yr1,yr2,opt)


%tpath='/archive/Ming.Zhao/backup/ECMWF/';
%expn ='ERAI_6h_DATA'; yr1=1979; yr2=2014; opt='obs';
%tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
%expn ='c192L33_am4p0_amip_HIRESMIP_H8'; yr1=1979; yr2=2014; opt='mod';
%expn ='c192L33_am4p0_amip_HIRESMIP_future_ssp585_2'; yr1=2015; yr2=2050; opt='mod';
%expn ='c192L33_am4p0_2010climo_new_p4K'; yr1=2; yr2=31; opt='mod';


tpath='/work/miz/mat_AR/';
expn='ERAI_6h_DATA'; 
fext='_1979_2014_readar_limit.mat';  fn=strcat(tpath,expn,fext); load(fn);vo.limit=v;

expn='c192L33_am4p0_amip_HIRESMIP_H8';
fext='_1979_2014_readar_limit.mat';  fn=strcat(tpath,expn,fext); load(fn);vm.limit=v;

expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_2';
fext='_2015_2050_readar_limit.mat';  fn=strcat(tpath,expn,fext); load(fn);wm.limit=v;

expn='c192L33_am4p0_2010climo_new';
fext='_2_31_readar_limit.mat';       fn=strcat(tpath,expn,fext); load(fn);v1.limit=v;

expn='c192L33_am4p0_2010climo_new_p4K';
fext='_2_31_readar_limit.mat';       fn=strcat(tpath,expn,fext); load(fn);w1.limit=v;
