function v=get_reg_sst(tpath,expn,fname,varn,latlon,syr,nyr)
%latlon=[210 270 -5 5]; %NINO3
v=readts_grid_2d(tpath,expn,fname, latlon); 
v.ts=(syr-1)*12+1; v.te=v.ts+nyr*12-1;
v.nt=v.te-v.ts+1; v.expn=expn; fname
v.aa=v.aa0/mean(mean(v.aa0)); varn

a=ncread(fname,varn,[1 1 1],[Inf Inf Inf]);
a=a(v.xs:v.xe,v.ys:v.ye,v.ts:v.te); 
a=permute(a,[3 2 1]);
%f=netcdf(fname,'nowrite'); v
%tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe);close(f);%tmp=tmp-273.15;
tmp=reshape(a,12,v.nt/12,v.nlat,v.nlon); 
for m=1:length(tmp(:,1,1,1))
  for t=1:length(tmp(1,:,1,1))
    v.sst.all(t,m,:,:)=tmp(m,t,:,:);;
  end
end
v.sst.clm=squeeze(mean(v.sst.all,1));

pp='/ts_all/'; fext =strcat('atmos.','static');
varn='land_mask'; fname=strcat(tpath,expn,pp,fext,'.nc')
a=ncread(fname,varn,[1 1],[Inf Inf]); a=permute(a,[2 1]);
v.lm=a(v.ys:v.ye,v.xs:v.xe);

v.sst.al0=getts(v.sst.all,v);
v.sst.reg=latlon;
return
