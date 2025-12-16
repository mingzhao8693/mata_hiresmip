function v=obs_mjo_lagreg(io_latlon, tp_latlon, latlon, lateq, do_var)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath ='/archive/Ming.Zhao/obs_for_am4p0_paper/'; %do_var=0;

% $$$ %define important regions
% $$$ io_latlon=[75 100 -10 5];  %definition of IO
% $$$ tp_latlon=[0 360 -30 30];  %definition of tropical region
% $$$ latlon   =[0  360 -10 10]; %definition of an arbitrary region
% $$$ lat1=-6.5; lat2=6.5;       %definition of equatorial latitude
lat1=-lateq; lat2=lateq;

%Precip analysis%%%%%%%%%%%%%%%%%%%
expn='GPCP'; fn='atmos.19970101-20141231.precip.nc';
fname=strcat(tpath,expn,'/atmos_daily/',fn); latname='latitude'; lonname='longitude'; 
%get IO time series (orginal and filtered)
varn='precip'; ts=1; te=6570; %period 19970101-20150101
io.pcp=getareg_filt(fname,io_latlon,latname,lonname,ts,te,varn)
%do correlation with and without lag
v=getaregion(fname,latlon,latname,lonname,ts,te,varn)
v.nday=365; v.nyr=floor(v.nt/v.nday); v.nt=v.nday*v.nyr;
v.varb=reshape(v.varb,v.nday,v.nyr,v.nlat,v.nlon)*86400;
pcp.lga=lagregress(v.varb,v,latlon,lat1,lat2,io.pcp,0); clear v;
%variance analysis-------
if (do_var)
  ts=1; te=6570; varn='precip'; v.tp_latlon=tp_latlon;
  v=getaregion(fname,tp_latlon,latname,lonname,ts,te,varn)
  v.nday=365; v.nyr=floor(v.nt/v.nday); v.nt=v.nday*v.nyr;
  v.varb=v.varb(1:v.nt,:,:)*86400;
  v.varb=reshape(v.varb,v.nday,v.nyr,v.nlat,v.nlon);
  v.va=varana(v.varb,v); v.varb=0; 
  pcp.var=v; clear v;
end

%OLR analysis%%%%%%%%%%%%%%%%%%%%%%
expn='NOAA_OLR'; fn='atmos.19790101-20111231.olr.nc';
fname=strcat(tpath,expn,'/atmos_daily/',fn); latname='lat'; lonname='lon'; 
%get IO time series (orginal and filtered)
varn='olr'; ts=1; te=11680; %19790101-20101231
io.olr=getareg_filt(fname,io_latlon,latname,lonname,ts,te,varn)
%do correlation with and without lag
v=getaregion(fname,latlon,latname,lonname,ts,te,varn)
v.nday=365; v.nyr=floor(v.nt/v.nday); v.nt=v.nday*v.nyr;
v.varb=reshape(v.varb,v.nday,v.nyr,v.nlat,v.nlon);
olr.lga=lagregress(v.varb,v,latlon,lat1,lat2,io.olr,0); clear v;
% do variance analysis
if (do_var)
  v=getaregion(fname,tp_latlon,latname,lonname,ts,te,varn)
  v.nday=365; v.nyr=floor(v.nt/v.nday); v.nt=v.nday*v.nyr;
  v.varb=v.varb(1:v.nt,:,:);
  v.varb=reshape(v.varb,v.nday,v.nyr,v.nlat,v.nlon);
  v.va=varana(v.varb,v); v.varb=0;
  olr.var=v; clear v;
end

%U200 analysis%%%%%%%%%%%%%%%%%%%%%%
expn='ERA_interim'; fn='atmos.19800101-20141231.u200.nc';
fname=strcat(tpath,expn,'/atmos_daily/',fn); latname='lat'; lonname='lon';
varn='u200'; ts=1; te=12410; %19800101-20141231
io.u200=getareg_filt(fname,io_latlon,latname,lonname,ts,te,varn)
%do correlation with and without lag
v=getaregion(fname,latlon,latname,lonname,ts,te,varn)
v.nday=365; v.nyr=floor(v.nt/v.nday); v.nt=v.nday*v.nyr;
v.varb=reshape(v.varb,v.nday,v.nyr,v.nlat,v.nlon);
u200.lga=lagregress(v.varb,v,latlon,lat1,lat2,io.u200,0); clear v;
% do variance analysis
if (do_var)
  v=getaregion(fname,tp_latlon,latname,lonname,ts,te,varn)
  v.nday=365; v.nyr=floor(v.nt/v.nday); v.nt=v.nday*v.nyr;
  v.varb=v.varb(1:v.nt,:,:);
  v.varb=reshape(v.varb,v.nday,v.nyr,v.nlat,v.nlon);
  v.va=varana(v.varb,v); v.varb=0; 
  u200.var=v; clear v;
end

%U850 analysis%%%%%%%%%%%%%%%%%%%%%%
expn='ERA_interim'; fn='atmos.19800101-20141231.u850.nc';
fname=strcat(tpath,expn,'/atmos_daily/',fn); latname='lat'; lonname='lon';
varn='u850'; ts=1; te=12410; %19800101-20141231
io.u850=getareg_filt(fname,io_latlon,latname,lonname,ts,te,varn)
%do correlation with and without lag
v=getaregion(fname,latlon,latname,lonname,ts,te,varn)
v.nday=365; v.nyr=floor(v.nt/v.nday); v.nt=v.nday*v.nyr;
v.varb=reshape(v.varb,v.nday,v.nyr,v.nlat,v.nlon);
u850.lga=lagregress(v.varb,v,latlon,lat1,lat2,io.u850,0); clear v;
% do variance analysis
if (do_var)
  v=getaregion(fname,tp_latlon,latname,lonname,ts,te,varn)
  v.nday=365; v.nyr=floor(v.nt/v.nday); v.nt=v.nday*v.nyr;
  v.varb=v.varb(1:v.nt,:,:);
  v.varb=reshape(v.varb,v.nday,v.nyr,v.nlat,v.nlon);
  v.va=varana(v.varb,v); v.varb=0; 
  u850.var=v; clear v;
end

v.pcp=pcp; v.olr=olr; v.u200=u200; v.u850=u850;

fn=strcat('/work/miz/mat_am4p0/obs_mjo_lagreg.mat');fn
save(fn,'v','-v7.3'); 

return


fn=strcat('/work/miz/mat_mjo/mjo_lagreg_obs.mat');load(fn)
