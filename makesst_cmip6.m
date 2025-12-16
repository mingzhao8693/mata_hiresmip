
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0]=thermconst;

fnin='/archive/miz/AR5/input_data/HadISST_sst_climo_1981-2005.nc';
fnout='HadISST_sst_aqua_1981-2005.nc'

f =netcdf(fnin,'nowrite');
v.lon=f{'lon'}(:);    v.lat =f{'lat'}(:); 
v.nlon=length(v.lon); v.nlat=length(v.lat); v.ngrid=v.nlat*v.nlon;
v.xs0=1; v.xe0=v.nlon;
v.ys0=1; v.ye0=v.nlat;
v.time=f{'time'}(:); v.nt=length(v.time);
v.climatology_bounds =f{'climatology_bounds'}(:,:);
v.sst =f{'sst'} (:,:,:); 
v.yr  =f{'yr'} (:);
v.mo  =f{'mo'} (:);
v.dy  =f{'dy'} (:);
v.average_T1 =f{'average_T1'} (:);
v.average_T2 =f{'average_T2'} (:);
v.average_DT =f{'average_DT'} (:);
close(f);

fname=strcat('./atmos.static.nc');
f=netcdf(fname,'nowrite');
lm=f{'land_mask'}(:,:); lon=f{'lon'}(:); lat =f{'lat'}(:); 
nlon=length(lon); nlat=length(lat); close(f); 

[xo,yo]=meshgrid(lon,  lat);
[xi,yi]=meshgrid(v.lon,v.lat);
v.lm=interp2(xo,yo,lm,xi,yi,'linear'); lm=(v.lm>0);

v.sst_aqua=v.sst;
sst=v.sst;
%tmp=squeeze(mean(sst(8:10,:,:)));
%tmp=squeeze(sst(9,:,:));
%for t=1:12
%  sst(t,:,:)=tmp;
%end

for t=1:12
  tmp=squeeze(sst(t,:,:));
  tmp=tmp.*~lm;
  for j=1:v.nlat
    a=tmp(j,:); a=a(a~=0); a=mean(a);
    if (a>=273.15)
      v.sst1d(t,j)=mean(a); 
    else
      v.sst1d(t,j)=273.15;
    end
    v.sst_aqua(t,j,:)=v.sst1d(t,j);
  end
end

% $$$ b=[1 2 1]; %windowSize = 7; b=ones(1,windowSize)/windowSize;
% $$$ sst1d=filter(b,4,v.sst1d); sst1d=circshift(sst1d',-floor(length(b)/2));
% $$$ sst1d(sst1d<273.15)=273.15;
% $$$ figure; plot(v.lat(2:end-1),diff(diff(v.sst1d))); hold on; 
% $$$ plot(v.lat(2:end-1),diff(diff(sst1d)),'.r-'); axis([-20 20 -0.2 0.2]);
% $$$ figure; plot(v.lat,v.sst1d); hold on; plot(v.lat,sst1d,'-r.'); axis([-20 20 296 302]);
% $$$ sst=squeeze(v.sst_aqua(1,:,:)); figure; contourf(sst);colorbar; 
% $$$ for j=1:v.nlat
% $$$   v.sst_aqua(:,j,:)=sst1d(j);
% $$$ end

nc = netcdf(fnout,'clobber'); 
if isempty(nc) error('NetCDF File Not Opened.'); end
nc.Conventions = 'CF-1.0';
nc.title = 'Monthly version of HadISST sea surface temperature component';
nc.institution = 'Met Office, Hadley Centre for Climate Research' ;
nc.source      = 'HadISST';
nc.history     = '09/11/2006 HadISST converted to NetCDF from pp format by John Kennedy';

nc('time')  = 0; nc('nv')  = 2; nc('idim') = 12; 
nc{'time'}  = ncdouble('time'); nc{'time'}(1:v.nt) = v.time(:); 
nc('lat') = v.nlat;          nc('lon')     = v.nlon;
nc{'lat'} = ncfloat('lat');  nc{'lat'} (:) = v.lat; 
nc{'lon'} = ncfloat('lon');  nc{'lon'} (:) = v.lon; 

nc{'sst'}=ncfloat('time','lat','lon'); nc{'sst'}(:,:,:)=v.sst_aqua(:,:,:);
nc{'climatology_bounds'} = ncdouble('time','nv'); 
nc{'climatology_bounds'}(:,:)=v.climatology_bounds(:,:);
nc{'yr'} = ncint('idim'); nc{'yr'}(:)=v.yr;
nc{'mo'} = ncint('idim'); nc{'mo'}(:)=v.mo;
nc{'dy'} = ncint('idim'); nc{'dy'}(:)=v.dy;
nc{'average_T1'} = ncdouble('time'); nc{'average_T1'}(:)=v.average_T1;
nc{'average_T2'} = ncdouble('time'); nc{'average_T2'}(:)=v.average_T2;
nc{'average_DT'} = ncdouble('time'); nc{'average_DT'}(:)=v.average_DT;
nc{'nrecords'} = ncint();  nc{'nrecords'}(:)=12;

nc{'time'}.long_name     ='Time';      
nc{'time'}.climatology   ='climatology_bounds';      
nc{'time'}.standard_name ='time';
nc{'time'}.units         ='days since 1869-12-1 00:00:00';      
nc{'time'}.delta_t       ='0000-00-01 00:00:00';      
nc{'time'}.modulo        =' ';      

nc{'lat'}.standard_name  = 'latitude' ;    nc{'lat'}.units  = 'degrees_north' ;
nc{'lon'}.standard_name  = 'longitude';    nc{'lon'}.units  = 'degrees_east' ;

nc{'yr'}.long_name    ='year';      
nc{'mo'}.long_name    ='month';      
nc{'dy'}.long_name    ='day';      

nc{'sst'}.long_name     ='Monthly 1 degree resolution SST';
nc{'sst'}.standard_name ='sea_surface_temperature';
nc{'sst'}.units         ='degK';      
nc{'sst'}.add_offset    = 0.e0;
nc{'sst'}.scale_factor  = 1.e0;
nc{'sst'}.FillValue_    =-1.e+30;
nc{'sst'}.missing_value =-1.e+30;
nc{'sst'}.description   ='HadISST 1.1 monthly average sea surface temperature';
nc{'sst'}.cell_methods  ='time: lat: lon: mean within months time: mean over years';
nc{'sst'}.time_avg_info ='average_T1,average_T2,average_DT';

nc{'average_T1'}.long_name ='Start time for average period';
nc{'average_T1'}.units     ='days since 1869-12-1 00:00:00';      

nc{'average_T2'}.long_name ='End time for average period';
nc{'average_T2'}.units     ='days since 1869-12-1 00:00:00';      

nc{'average_DT'}.long_name ='Length of average period';
nc{'average_DT'}.units     ='days';      

close(nc); 

return

fname='/archive/miz2/GCM/riga/c180_aqua_X0/pp/atmos/ts/monthly/1yr/zsst.nc'
f=netcdf(fname,'nowrite');
lat =f{'lat'} (:); 
Xsst =f{'t_surf'} (:); close(f);

fname='/archive/miz2/GCM/riga/c180_aqua_x0/pp/atmos/ts/monthly/1yr/zsst.nc'
f=netcdf(fname,'nowrite');
xsst =f{'t_surf'} (:); close(f);

figure; plot(lat(2:end-1),diff(diff(sst))); hold on; plot(lat(2:end-1),diff(diff(xsst)),'r');
