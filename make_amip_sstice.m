[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0]=thermconst;

varn='sst'; %varn='ice';
if strcmp(varn,'sst')
  fn='/archive/Ming.Zhao/backup/sst_dataset/hadisst_sst_186912-202112.data.nc';
  fnin='/archive/Ming.Zhao/backup/sst_dataset/SPEAR_c192_o1_Hist_AllForc_IC1921_K50_ens_16/sst.nc';
  fnout='/archive/Ming.Zhao/backup/sst_dataset/SPEAR_c192_o1_Hist_AllForc_IC1921_K50_ens_16/sst_new.nc';
else
  fn='/archive/Ming.Zhao/backup/sst_dataset/hadisst_ice_186912-202112.data.nc';
  fnin='/archive/Ming.Zhao/backup/sst_dataset/SPEAR_c192_o1_Hist_AllForc_IC1921_K50_ens_16/ice.nc';
  fnout='/archive/Ming.Zhao/backup/sst_dataset/SPEAR_c192_o1_Hist_AllForc_IC1921_K50_ens_16/ice_new.nc';
end
v =readncfile(fn);
v1=readncfile(fnin);
%[xo,yo]=meshgrid(v.lon, v.lat);
%[xi,yi]=meshgrid(v1.lon,v1.lat);
if strcmp(varn,'sst')
  a=v1.sst; var_final=v.sst;
else
  a=v1.ice; var_final=v.ice;
end

a=permute(a,[3 2 1]); var_i=a(1:1212,:,:);   %01/1921 to 12/2021
var_o=interp_grid(var_i,v.lon,v.lat,v1.lon,v1.lat,1);
var_o=permute(var_o,[3 2 1]);
t1=614; t2=1825; var_final(:,:,t1:t2)=var_o; %01/1921 to 12/2021

nlat=length(v.lat); nlon=length(v.lon); nidim=length(v.yr(:,1)); nt=length(v.time);
disp(fnout); nidim=nt; v.nrecords=nt; v.time_bnds(:,end-11:end)=v.time_bnds(:,end-11:end)+366;
form='netcdf4_classic'; form='classic'; nt=length(v.time); 
nccreate(fnout,'time',      'Dimensions',{'time' Inf},'Datatype','double','Format',form);
nccreate(fnout,'yr',        'Dimensions',{'idim' nidim},'Datatype','int32', 'Format',form);
nccreate(fnout,'mo',        'Dimensions',{'idim' nidim},'Datatype','int32', 'Format',form);
nccreate(fnout,'dy',        'Dimensions',{'idim' nidim},'Datatype','int32', 'Format',form);
nccreate(fnout,'time_bnds', 'Dimensions',{'nv' 2 'time' nidim},'Datatype','double','Format',form);
nccreate(fnout,'nrecords',  'Datatype','int32', 'Format',form);
%nccreate(fnout,'average_T1','Dimensions',{'time' nt},'Datatype','double','Format',form);
%nccreate(fnout,'average_T2','Dimensions',{'time' nt},'Datatype','double','Format',form);
%nccreate(fnout,'average_DT','Dimensions',{'time' nt},'Datatype','double','Format',form);
%nccreate(fnout,'climatology_bounds','Dimensions',{'nv' 2 'time' nt},'Datatype','double','Format',form);
nccreate(fnout,'lat','Dimensions',{'lat' nlat},'Datatype','single','Format',form);
nccreate(fnout,'lon','Dimensions',{'lon' nlon},'Datatype','single','Format',form);
if strcmp(varn,'sst')
  nccreate(fnout,'sst','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form);
  des0='Constructed mid-month Sea Surface Temperature'; 
else
  nccreate(fnout,'ice','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form);
  des0='Constructed mid-month Sea-ice area fraction'; 
end
des='SPEAR_m16';
des=strcat('sst;',des); des

ncwrite(fnout,'time',               v.time);
ncwrite(fnout,'yr',                 v.yr);
ncwrite(fnout,'mo',                 v.mo);
ncwrite(fnout,'dy',                 v.dy);
ncwrite(fnout,'time_bnds',          v.time_bnds);
ncwrite(fnout,'nrecords',           v.nrecords);
%ncwrite(fnout,'average_T1',         v.average_T1);
%ncwrite(fnout,'average_T2',         v.average_T2);
%ncwrite(fnout,'average_DT',         v.average_DT);
%ncwrite(fnout,'climatology_bounds', v.climatology_bounds);
ncwrite(fnout,'lat',                v.lat);
ncwrite(fnout,'lon',                v.lon);
if strcmp(varn,'sst')
  ncwrite(fnout,'sst', var_final);
  ncwriteatt(fnout,varn,'long_name',des);
  ncwriteatt(fnout,varn,'standard_name','sst');
  ncwriteatt(fnout,varn,'units','degK');
else
  ncwrite(fnout,'ice', var_final*100);
  ncwriteatt(fnout,varn,'long_name',des);
  ncwriteatt(fnout,varn,'standard_name','ice');
  ncwriteatt(fnout,varn,'units','%');
end
%ncwriteatt(fnout,varn,'cell_methods',' time: mean over days');

ncwriteatt(fnout,'time','long_name','Time');
ncwriteatt(fnout,'time','standard_name','time');
ncwriteatt(fnout,'time','units','days since 1860-01-01 00:00:00');
ncwriteatt(fnout,'time','calendar',   'gregorian');
ncwriteatt(fnout,'time','bounds','time_bnds');

ncwriteatt(fnout,'lon','long_name','Longitude');
ncwriteatt(fnout,'lon','standard_name','longitude');
ncwriteatt(fnout,'lon','units','degrees_east');

ncwriteatt(fnout,'lat','long_name','Latitude');
ncwriteatt(fnout,'lat','standard_name','latitude');
ncwriteatt(fnout,'lat','units','degrees_north');

ncwriteatt(fnout,'nrecords','description','must be equal to size of time dimension');


return

