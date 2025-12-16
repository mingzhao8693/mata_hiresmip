
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0]=thermconst;

fnin='/archive/miz/AR5/input_data/hadisst/HadISST_sst.nc';

fnout='HadISST_sst_ElNino.nc'
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

%use 1982,1987,1991,1997, and 2002 for El-Nino composite
yr1=1982; t1=(yr1-1950)*12+1; t2=t1+11;
v.sst_1982=squeeze(v.sst(t1:t2,:,:));
yr1=1987; t1=(yr1-1950)*12+1; t2=t1+11;
v.sst_1987=squeeze(v.sst(t1:t2,:,:));
yr1=1991; t1=(yr1-1950)*12+1; t2=t1+11;
v.sst_1991=squeeze(v.sst(t1:t2,:,:));
yr1=1997; t1=(yr1-1950)*12+1; t2=t1+11;
v.sst_1997=squeeze(v.sst(t1:t2,:,:));
yr1=2002; t1=(yr1-1950)*12+1; t2=t1+11;
v.sst_2002=squeeze(v.sst(t1:t2,:,:));
for t=1:12;
  v.sst_elnino(t,:,:)=(v.sst_1982(t,:,:)+v.sst_1987(t,:,:)...
      +v.sst_1991(t,:,:)+v.sst_1997(t,:,:)+v.sst_2002(t,:,:))/5;
end
v.sst_elnino0=squeeze(mean(v.sst_elnino,1));
%figure; contourf(v.lon,v.lat,v.sst_lanina0);colorbar;
%figure; contourf(v.lon,v.lat,v.sst_lanina0-v.sst0,[-1:0.1:1]);colorbar;

v.time = [47528.5 47559.5 47590 47619.5 47650 47680.5 47711 ....
	  47741.5 47772.5 47803 47833.5 47864];
v.nt=12;
v.yr=[0 0 0 0 0 0 0 0 0 0 0 0];
v.mo=[1 2 3 4 5 6 7 8 9 10 11 12];
v.dy=[0 0 0 0 0 0 0 0 0 0 0 0] ;
v.average_T1=[ 40224.5 40255.5 40285 40314.5 40345 40375.5 ...
	       40406 40436.5 40467.5 40498 40528.5 40559];
v.average_T2=[ 47528.5 47559.5 47590 47619.5 47650 47680.5 ...
	       47711 47741.5 47772.5 47803 47833.5 47864];
v.average_DT=[7300 7300 7300 7300 7300 7300 7300 7300 7300 7300 7300 7300];

nc = netcdf(fnout,'clobber'); 
if isempty(nc) error('NetCDF File Not Opened.'); end
nc.Conventions = 'CF-1.0';
nc.title = 'Monthly version of HadISST sea surface temperature component';
nc.institution = 'Met Office, Hadley Centre for Climate Research' ;
nc.source      = 'HadISST';
nc.history     = '09/11/2006 HadISST converted to NetCDF from pp format by John Kennedy';

nc('TIME') = 0;  nc('idim') = 12; 
nc{'TIME'} = ncdouble('TIME'); nc{'TIME'}(1:v.nt) = v.time(:); 
nc('LATITUDE') = v.nlat;          nc('LONGITUDE')     = v.nlon;
nc{'LATITUDE'} = ncdouble('LATITUDE');  nc{'LATITUDE'} (:) = v.lat; 
nc{'LONGITUDE'} = ncdouble('LONGITUDE');  nc{'LONGITUDE'} (:) = v.lon; 

nc{'SST'}=ncfloat('TIME','LATITUDE','LONGITUDE'); 
nc{'SST'}(:,:,:)=v.sst_elnino(:,:,:);
nc{'SST'}(:,:,:)=v.sst_lanina(:,:,:);

nc{'yr'} = ncint('idim'); nc{'yr'}(:)=v.yr;
nc{'mo'} = ncint('idim'); nc{'mo'}(:)=v.mo;
nc{'dy'} = ncint('idim'); nc{'dy'}(:)=v.dy;
nc{'average_T1'} = ncdouble('TIME'); nc{'average_T1'}(:)=v.average_T1;
nc{'average_T2'} = ncdouble('TIME'); nc{'average_T2'}(:)=v.average_T2;
nc{'average_DT'} = ncdouble('TIME'); nc{'average_DT'}(:)=v.average_DT;
nc{'nrecords'} = ncint();  nc{'nrecords'}(:)=12;

nc{'TIME'}.units         ='days since 1869-12-01';      
nc{'TIME'}.time_origin   = '01-DEC-1869 00:00:00';
nc{'TIME'}.axis          = 'T';
nc{'TIME'}.calendar      = 'julian';
nc{'TIME'}.modulo        = ' ';

nc{'LONGITUDE'}.units  = 'degrees_east' ;
nc{'LONGITUDE'}.modulo = 360.;
nc{'LONGITUDE'}.point_spacing = 'even' ;
nc{'LONGITUDE'}.axis = 'X' ;

nc{'LATITUDE'}.units  = 'degrees_north' ;
nc{'LATITUDE'}.point_spacing = 'even' ;
nc{'LATITUDE'}.axis = 'Y' ;

nc{'yr'}.long_name    ='year';      
nc{'mo'}.long_name    ='month';      
nc{'dy'}.long_name    ='day';      

nc{'SST'}.missing_value =-1.e+34;
nc{'SST'}.FillValue_    =-1.e+34;
nc{'SST'}.long_name     ='NEWSST + 273.16';
nc{'SST'}.history   ='From HadISST1';
nc{'SST'}.time_avg_info ='average_T1,average_T2,average_DT';

nc{'average_T1'}.long_name ='Start time for average period';
nc{'average_T1'}.units     ='days since 1869-12-01';      

nc{'average_T2'}.long_name ='End time for average period';
nc{'average_T2'}.units     ='days since 1869-12-01';      

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
