
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0]=thermconst;

fnin='/archive/miz/AR5/input_data/hadisst/HadISST_sst.nc';

fnout='HadISST_sst_LaNina.nc'

f =netcdf(fnin,'nowrite');
v.lon=f{'lon'}(:);    v.lat =f{'lat'}(:); 
v.nlon=length(v.lon); v.nlat=length(v.lat); v.ngrid=v.nlat*v.nlon;
v.xs0=1; v.xe0=v.nlon;
v.ys0=1; v.ye0=v.nlat;
v.time=f{'time'}(:); v.nt=length(v.time);
v.climatology_bounds =f{'climatology_bounds'}(:,:);
v.sst =f{'sst'} (2:end-4,:,:); 
v.yr  =f{'yr'} (:);
v.mo  =f{'mo'} (:);
v.dy  =f{'dy'} (:);
v.average_T1 =f{'average_T1'} (:);
v.average_T2 =f{'average_T2'} (:);
v.average_DT =f{'average_DT'} (:);
close(f);
v.sst0=squeeze(mean(v.sst,1));
%use 1985,1988,1998,1999,and 2000 for La-Nina composite
yr1=1985; t1=(yr1-1950)*12+1; t2=t1+11;
v.sst_1985=squeeze(v.sst(t1:t2,:,:));
yr1=1988; t1=(yr1-1950)*12+1; t2=t1+11;
v.sst_1988=squeeze(v.sst(t1:t2,:,:));
yr1=1998; t1=(yr1-1950)*12+1; t2=t1+11;
v.sst_1998=squeeze(v.sst(t1:t2,:,:));
yr1=1999; t1=(yr1-1950)*12+1; t2=t1+11;
v.sst_1999=squeeze(v.sst(t1:t2,:,:));
yr1=2000; t1=(yr1-1950)*12+1; t2=t1+11;
v.sst_2000=squeeze(v.sst(t1:t2,:,:));

for t=1:12;
  v.sst_lanina(t,:,:)=(v.sst_1985(t,:,:)+v.sst_1988(t,:,:)...
      +v.sst_1998(t,:,:)+v.sst_1999(t,:,:)+v.sst_2000(t,:,:))/5;
end

v.sst_lanina0=squeeze(mean(v.sst_lanina,1));

%figure; contourf(v.lon,v.lat,v.sst_lanina0);colorbar;
%figure; contourf(v.lon,v.lat,v.sst_lanina0-v.sst0,[-1:0.1:1]);colorbar;
v.climatology_bounds= [...
  40223 49354;...
  40254 49385;...
  40282 49413;...
  40313 49444;...
  40343 49474;...
  40374 49505;...
  40404 49535;...
  40435 49566;...
  40466 49597;...
  40496 49627;...
  40527 49658;...
  40557 49688] ;
v.time = [49354 49385 49413 49444 49474 49505 49535 49566 49597 49627 49658 49688];
v.nt=12;
v.yr=[0 0 0 0 0 0 0 0 0 0 0 0];
v.mo=[1 2 3 4 5 6 7 8 9 10 11 12];
v.dy=[1 1 1 1 1 1 1 1 1 1 1 1] ;
v.average_T1=[40223 40254 40282 40313 40343 40374 ...
	      40404 40435 40466 40496 40527 40557];
v.average_T2=[49354 49385 49413 49444 49474 49505 ...
	      49535 49566 49597 49627 49658 49688];
v.average_DT=[9125 9125 9125 9125 9125 9125 9125 9125 9125 9125 9125 9125];

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

nc{'sst'}=ncfloat('time','lat','lon'); nc{'sst'}(:,:,:)=v.sst_lanina(:,:,:);
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
