function [v]=readar_limit_new(tpath,expn,yr1,yr2,ardir)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/backup/ECMWF/';
%expn ='ERAI_6h_DATA'; yr1=1979; yr2=2014; opt='obs';
%tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
%expn ='c192L33_am4p0_amip_HIRESMIP_H8'; yr1=1979; yr2=2014; opt='mod';
%expn ='c192L33_am4p0_amip_HIRESMIP_future_ssp585_2'; yr1=2015; yr2=2050; opt='mod';
%expn ='c192L33_am4p0_2010climo_new_p4K'; yr1=2; yr2=31; opt='mod';
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
  fn=strcat(tpath,expn,'/',ardir,'/',expn,'_',yr,'_pixel_ivt_limit.nc');
  disp(fn);
  v.time=ncread(fn,'time'); v.nt=length(v.time); 
  v.lat=ncread(fn,'lat'); v.lon=ncread(fn,'lon');
  a=ncread(fn,'ivt'); a=permute(a,[3 2 1]); 
  i1=12*(t-1)+1; i2=i1+12-1;
  ivt(i1:i2,:,:)=a;
end
v.nlat=length(v.lat); v.nlon=length(v.lon);
v.ivt_limit=reshape(ivt,12,v.nyr,v.nlat,v.nlon);
v.ivt_limit_clm=get_clm_ann(v.ivt_limit);

epath='/work/miz/mat_AR/';
fnmat=strcat(epath,expn,'_',num2str(yr1),'_',num2str(yr2),'_',ardir,'_readar_limit.mat')

save(fnmat,'v','-v7.3'); %save(fnmat,'v');

'generate climo ivt limit....'
a=v.ivt_limit_clm.mon; ivt=permute(a,[3 2 1]); 

undef = -9999; 
nt=12; nlon=v.nlon; nlat=v.nlat; time=v.time; lon=v.lon; lat=v.lat;
fnout=strcat(tpath,expn,'/',ardir,'/',expn,'_',num2str(yr1),'_',num2str(yr2),'_pixel_ivt_limit_climo.nc');disp(fnout);
nccreate(fnout,'time','dimensions',{'time',nt});
nccreate(fnout,'lon','dimensions',{'lon',nlon});
nccreate(fnout,'lat','dimensions',{'lat',nlat});
nccreate(fnout,'ivt','dimensions',{'lon',nlon,'lat',nlat,'time',12},'chunksize',[nlon,nlat,1],'datatype','double','fillvalue',undef,'format','netcdf4_classic','deflatelevel',9);

ncwrite(fnout,'time',time);
ncwrite(fnout,'lat', lat);
ncwrite(fnout,'lon', lon);
ncwrite(fnout,'ivt', ivt);

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
