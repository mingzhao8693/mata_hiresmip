function v=read_data_2d(fn,latlon,t1,t2,s,varn,latname,lonname,timname,time0,nnn);
%tpath='/archive/Ming.Zhao/obs_for_am4p0_paper/';
%fname=strcat(tpath,'ERA5/ERA5_195901-202112_msl.nc')
%latlon=[0 360 -90 90]; varn='msl';
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);

v.lon=ncread(fn,lonname); 
v.lat=ncread(fn,latname);
if exist('timname')
  v.time=ncread(fn,timname);
  v.time=datestr(double(v.time(t1:t2))/nnn+datenum(time0));%v.time
end
%f=netcdf(fname,'nowrite'); strcat('FILE OPENED:',fname)
%latname='latitude'; lonname='longitude';
%v.lat =f{latname}(:); v.lon=f{lonname}(:); 
v.ys  =min(find(v.lat(:)>=lat1)); v.ye  =max(find(v.lat(:)<= lat2));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat=v.lat(v.ys:v.ye); v.lon=v.lon(v.xs:v.xe);
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
lonx=s.lon; latx =s.lat; aa=s.aa;

a=ncread(fn,varn,[1 1 1],[Inf Inf Inf]);
a=a(v.xs:v.xe,v.ys:v.ye,t1:t2); %1959JAN-2021DEC;63yr
a=permute(a,[3 2 1]);
if ~exist('timname'); v.time=[1:length(a(:,1,1))]; end
v.nt=length(v.time); v.ts=1; v.te=v.nt;

tmp=reshape(a,12,v.nt/12,v.nlat,v.nlon);
lonx=s.lon; latx =s.lat; aa=s.aa;

clm=squeeze(mean(tmp,2));
ann=squeeze(mean(clm,1));

v.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.al0=getts(v.all,s)
v.clm=interp_grid(clm,lonx,latx,v.lon,v.lat,1);
v.ann=interp_grid(ann,lonx,latx,v.lon,v.lat,1);
v.sea=get4season(v.clm); 
v.fn =fn;

n=length(v.sea(:,1,1));
for i=1:n
  a=squeeze(v.sea(i,:,:)); 
  v.sea0(i)=nanmean(nanmean(a.*aa));
end

v.clm0=mean(v.al0,1);
v.ts0 =mean(v.al0,2)';
v.ann0=mean(v.ts0);

return

if strcmp(varn,'msl')
  v.slp_clm=squeeze(mean(tmp,2));
  v.slp_ann=squeeze(mean(v.slp_clm,1));
  v.slp.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  v.slp.al0=getts(v.slp.all,s)
  v.slp.clm=interp_grid(v.slp_clm,lonx,latx,v.lon,v.lat,1);
  v.slp.ann=interp_grid(v.slp_ann,lonx,latx,v.lon,v.lat,1); size(v.slp.clm)
  v.slp.sea=get4season(v.slp.clm); 
  v.slp.fn =fn;
elseif strcmp(varn,'t2m')
  v.t2m_clm=squeeze(mean(tmp,2));
  v.t2m_ann=squeeze(mean(v.t2m_clm,1));
  v.t2m.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  v.t2m.al0=getts(v.t2m.all,s)
  v.t2m.clm=interp_grid(v.t2m_clm,lonx,latx,v.lon,v.lat,1);
  v.t2m.ann=interp_grid(v.t2m_ann,lonx,latx,v.lon,v.lat,1); size(v.t2m.clm)
  v.t2m.sea=get4season(v.t2m.clm); 
  v.t2m.fn =fn;
elseif strcmp(varn,'d2m')
  v.d2m_clm=squeeze(mean(tmp,2));
  v.d2m_ann=squeeze(mean(v.d2m_clm,1));
  v.d2m.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  v.d2m.al0=getts(v.d2m.all,s)
  v.d2m.clm=interp_grid(v.d2m_clm,lonx,latx,v.lon,v.lat,1);
  v.d2m.ann=interp_grid(v.d2m_ann,lonx,latx,v.lon,v.lat,1); size(v.d2m.clm)
  v.d2m.sea=get4season(v.d2m.clm); 
  v.d2m.fn =fn;
elseif strcmp(varn,'z500')
  v.z500_clm=squeeze(mean(tmp,2));
  v.z500_ann=squeeze(mean(v.z500_clm,1));
  v.z500.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  v.z500.al0=getts(v.z500.all,s)
  v.z500.clm=interp_grid(v.z500_clm,lonx,latx,v.lon,v.lat,1);
  v.z500.ann=interp_grid(v.z500_ann,lonx,latx,v.lon,v.lat,1); size(v.z500.clm)
  v.z500.sea=get4season(v.z500.clm); 
  v.z500.fn =fn;
elseif strcmp(varn,'z200')
  v.z200_clm=squeeze(mean(tmp,2));
  v.z200_ann=squeeze(mean(v.z200_clm,1));
  v.z200.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  v.z200.al0=getts(v.z200.all,s)
  v.z200.clm=interp_grid(v.z200_clm,lonx,latx,v.lon,v.lat,1);
  v.z200.ann=interp_grid(v.z200_ann,lonx,latx,v.lon,v.lat,1); size(v.z200.clm)
  v.z200.sea=get4season(v.z200.clm); 
  v.z200.fn =fn;
elseif strcmp(varn,'z850')
  v.z850_clm=squeeze(mean(tmp,2));
  v.z850_ann=squeeze(mean(v.z850_clm,1));
  v.z850.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  v.z850.al0=getts(v.z850.all,s)
  v.z850.clm=interp_grid(v.z850_clm,lonx,latx,v.lon,v.lat,1);
  v.z850.ann=interp_grid(v.z850_ann,lonx,latx,v.lon,v.lat,1); size(v.z850.clm)
  v.z850.sea=get4season(v.z850.clm); 
  v.z850.fn =fn;
end

return


