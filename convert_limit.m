function [v]=convert_limit(tpath,expn,yr,v0,w0,opt)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
%expn ='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp'; yr1=2015; yr2=2050; opt='mod';
%expn ='c192L33_am4p0_2010climo_new_p4K'; yr1=2; yr2=31; opt='mod';yr='2015'; 
%fn=strcat(tpath,expn,'/AR/',expn,'_',yr,'_pixel_ivt_limit.nc');disp(fn);
%fn=strcat(tpath,expn,'/AR/',expn(1:end-6),'_',yr,'_pixel_ivt_limit.nc');disp(fn);
%time=ncread(fn,'time'); nt=length(time); 
%fn=strcat(tpath,expn,'/AR/',expn,'_0002_pixel_ivt_limit.nc');disp(fn);
%time=ncread(fn,'time'); nt=length(time); 
%lat=ncread(fn,'lat');   nlat=length(lat);
%lon=ncread(fn,'lon');   nlon=length(lon);
%ivt=ncread(fn,'ivt');   size(ivt)

if (opt==0)
  ivt=v0.limit_clm;
  ardir='AR_climlmt'
elseif(opt==1)
  ivt=ivt-w0.limit_clm+v0.limit_clm;
  ardir='AR_ctlmt'
end

undef = -9999; 
nt=v0.nt; nlon=v0.nlon; nlat=v0.nlat; time=v0.time; lon=v0.lon; lat=v0.lat;
fnout=strcat(tpath,expn,'/',ardir,'/',expn,'_',yr,'_pixel_ivt_limit_new.nc');disp(fnout);
nccreate(fnout,'time','dimensions',{'time',nt});
nccreate(fnout,'lon','dimensions',{'lon',nlon});
nccreate(fnout,'lat','dimensions',{'lat',nlat});
nccreate(fnout,'ivt','dimensions',{'lon',nlon,'lat',nlat,'time',12},'chunksize',[nlon,nlat,1],'datatype','double','fillvalue',undef,'format','netcdf4_classic','deflatelevel',9);

ncwrite(fnout,'time',time);
ncwrite(fnout,'lat', lat);
ncwrite(fnout,'lon', lon);
ncwrite(fnout,'ivt', ivt);

return

