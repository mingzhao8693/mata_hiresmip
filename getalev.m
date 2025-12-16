function x=getalev(tpath,expn,dir,ts,te,k)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;

varn='w';       fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k,:,:); wa=squeeze(a);
  varn='zfull'; zf0=f{varn}(:); close(f); zf=zf0(k);
end
varn='rho';     fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k,:,:); close(f); rho=squeeze(a);
end
varn='liq_wat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k,:,:); close(f); ql=squeeze(a);
end
varn='ice_wat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k,:,:); close(f); qi=squeeze(a);
end
varn='sphum';  fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k,:,:); close(f); qv=squeeze(a);
end
varn='rainwat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k,:,:); close(f); qr=squeeze(a);
end
varn='snowwat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k,:,:); close(f); qs=squeeze(a);
end
varn='graupel'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k,:,:); close(f); qg=squeeze(a);
end
varn='graupel'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k,:,:); close(f); qg=squeeze(a);
end
varn='rainflx'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k,:,:); close(f); rainflx=squeeze(a);
end
varn='solpflx'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k,:,:); close(f); solpflx=squeeze(a);
end
varn='temp';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k,:,:); close(f); ta=squeeze(a);
end

qc = ql+qi;
qt = qv+qc+qr+qs+qg;         clear qr qs qg;
dse= CPD*ta+G*zf; 
mse= dse+LV0*qv-HLF*qi;      clear qv;
hli= dse-LV0*(ql+qi)-HLF*qi; clear ql qi;
pfx= (rainflx+solpflx)*86400;clear rainflx solpflx;
x.wa=wa; x.qc=qc; x.qt=qt; x.rho=rho; x.pfx=pfx;
x.dse=dse; x.mse=mse; x.hli=hli; x.zf=zf; x.zf0=zf0;
return
