function s=get_scalar(v,tpath,expn,pp,fext,yr1,yr2)
varn='rrvco2'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite');
  s.rrvco2=f{varn}(v.ts:v.te);close(f);
end

varn='co2mass'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite');
  s.co2mass=f{varn}(v.ts:v.te);close(f);
end

varn='solar_constant'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite');
  s.solarc=f{varn}(v.ts:v.te);close(f);
end

varn='n2oglobal'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite');
  s.n2o=f{varn}(v.ts:v.te);close(f);
end

varn='ch4global'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite');
  s.ch4=f{varn}(v.ts:v.te);close(f);
end

varn='cfc11global'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite');
  s.cfc11=f{varn}(v.ts:v.te);close(f);
end

varn='cfc12global'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite');
  s.cfc12=f{varn}(v.ts:v.te);close(f);
end

varn='cfc113global'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite');
  s.cfc113=f{varn}(v.ts:v.te);close(f);
end

varn='hcfc22global'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite');
  s.hcfc22=f{varn}(v.ts:v.te);close(f);
end

if ~exist('s')
  s=0;
end
