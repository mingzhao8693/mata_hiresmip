function varb=readvar(varn,fn,v,opt,dodiff)
%fn=strcat(tpath,expn,epath,fext,varn,'.nc'); 
f=netcdf(fn,'nowrite');fn
if strcmp(opt,'2d')
  varb=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe);size(varb)
  varb=reshape(varb,v.nday,v.nyr,v.nlat,v.nlon);
else
  varb=f{varn}(v.ts:v.te,:,v.ys:v.ye,v.xs:v.xe); size(varb)
  varb=reshape(varb,v.nday,v.nyr,v.nz,v.nlat,v.nlon);
  if strcmp(dodiff,'yes')
    tmp=diff(varb,1,3);varb(:,:,2:v.nz,:,:)=tmp;
  end
end
close(f)
return
