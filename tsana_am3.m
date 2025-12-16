function v=tsana_am3(o,tpath,expn,yr1,yr2,latlon,region,syr,nyr,myr,mod,opt)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
% $$$ tpath='/archive/Ming.Zhao/awg/verona/'; myr=1;
% $$$ latlon=[0 360 -90 90]; region='global'; opt='2'; 
% $$$ expn='AM3';yr1='1980';yr2='2007';syr=1;nyr=28;mod='c45'
% $$$ fn=strcat('/work/miz/mat_cm4/obs_',region,'_to_c48.mat'); load(fn);
lonx=o.lon; latx =o.lat;

pp='/ts_all/'; fext =strcat('atmos.',yr1,'01-',yr2,'12.');
varn='t_surf'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
latlon_nino3=[210 270 -5 5]; %NINO3
v=getninosst(tpath,expn,fname,varn,latlon_nino3,syr,nyr)
sst_nino3=v.sst_nino3;

pp='/ts_all/'; fext =strcat('atmos.',yr1,'01-',yr2,'12.');
varn='t_surf'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
v=readts_grid_2d(tpath,expn,fname, latlon); 
v.ts=(syr-1)*12+1; v.te=v.ts+nyr*12-1; 
v.nt=v.te-v.ts+1; v.expn=expn;v
for t=1:v.nt; aa1(t,:,:)=v.aa(:,:); end; v.aa=aa1;
v.aa=v.aa/mean(mean(v.aa(1,:,:))); v.mod=mod; 
v.sfc.sst_nino3=sst_nino3;

s.aa=o.aa; s.lm0=o.lm0; %s.im0=o.im0;
s.lat=o.lat; s.lon=o.lon; s.latlon=latlon;
v.s=s; o.dummy=o.sfc.evap; 
o.dummy.clm(:,:,:)=0; o.dummy.sea(:,:,:)=0; o.dummy.ann(:,:)=0;

%pp='/ts_all/'; fext =strcat('atmos.','static');
%varn='land_mask'; fname=strcat(tpath,expn,pp,fext,'.nc')
%f=netcdf(fname,'nowrite'); 
%v.lm0=f{varn}(v.ys:v.ye,v.xs:v.xe); close(f);

fext =strcat('atmos.',yr1,'01-',yr2,'12.');
varn='ice_mask'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); v.missing_value=-1.e+10;v
v.imk=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe);close(f);
v.sfc.ice=extracts(v.imk,v,o.sfc.ice,myr,1); 

varn='t_surf'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite');
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe);close(f);%tmp=tmp-273.15;
v.sfc.tsurf  =extracts(tmp,v,o.sfc.tsurf,myr,0);
v.sfc.sst_woa=extracts(tmp,v,o.sfc.sst_woa,myr,1);
v.sfc.sst    =extracts(tmp,v,o.sfc.sst,myr,1);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.sfc.tsurf.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.sfc.tsurf.al0=getts(v.sfc.tsurf.all,o);

%ATM OMEGA 
%(k=1,   2,   3,  4,  5,  6,  7,  8,  9,  10, 11, 12, 13, 14,15 for 
%  1000, 925, 850,775,700,600,500,400,300,250,200,150,100,70,50 hPa)
varn='omega'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
k=1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp)*864;
v.atm.w1000=extracts(tmp,v,o.atm.w1000,myr,0); 
k=2; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp)*864;
v.atm.w925=extracts(tmp,v,o.atm.w925,myr,0); 
k=3; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp)*864;
v.atm.w850=extracts(tmp,v,o.atm.w850,myr,0); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.atm.w850.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.atm.w850.al0=getts(v.atm.w850.all,o);
k=4; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp)*864;
v.atm.w775=extracts(tmp,v,o.atm.w775,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp)*864;
v.atm.w700=extracts(tmp,v,o.atm.w700,myr,0); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.atm.w700.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.atm.w700.al0=getts(v.atm.w700.all,o);
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp)*864;
v.atm.w600=extracts(tmp,v,o.atm.w600,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp)*864;
v.atm.w500=extracts(tmp,v,o.atm.w500,myr,0); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.atm.w500.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.atm.w500.al0=getts(v.atm.w500.all,o);
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp)*864;
v.atm.w400=extracts(tmp,v,o.atm.w400,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp)*864;
v.atm.w300=extracts(tmp,v,o.atm.w300,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp)*864;
v.atm.w250=extracts(tmp,v,o.atm.w250,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp)*864;
v.atm.w200=extracts(tmp,v,o.atm.w200,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp)*864;
v.atm.w150=extracts(tmp,v,o.atm.w150,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp)*864;
v.atm.w100=extracts(tmp,v,o.atm.w100,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp)*864;
v.atm.w70=extracts(tmp,v,o.atm.w70,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp)*864;
v.atm.w50=extracts(tmp,v,o.atm.w50,myr,0); 
close(f)

%ATM MC_FULL
varn='mc_full'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite');
  k=1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.mc1000=extracts(tmp,v,o.dummy,myr,0); 
  k=2; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.mc925=extracts(tmp,v,o.dummy,myr,0); 
  k=3; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.mc850=extracts(tmp,v,o.dummy,myr,0); 
  tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
  v.atm.mc850.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  v.atm.mc850.al0=getts(v.atm.mc850.all,o);
  k=4; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.mc775=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.mc700=extracts(tmp,v,o.dummy,myr,0); 
  tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
  v.atm.mc700.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  v.atm.mc700.al0=getts(v.atm.mc700.all,o);
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.mc600=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.mc500=extracts(tmp,v,o.dummy,myr,0); 
  tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
  v.atm.mc500.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
  v.atm.mc500.al0=getts(v.atm.mc500.all,o);
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.mc400=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.mc300=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe);tmp=squeeze(tmp);
  v.atm.mc250=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe);tmp=squeeze(tmp);
  v.atm.mc200=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe);tmp=squeeze(tmp);
  v.atm.mc150=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe);tmp=squeeze(tmp);
  v.atm.mc100=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe);tmp=squeeze(tmp);
  v.atm.mc70=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe);tmp=squeeze(tmp);
  v.atm.mc50=extracts(tmp,v,o.dummy,myr,0); 
  close(f)
end

%ATM T
varn='temp'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
k=1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);t1000=tmp;
v.atm.t1000=extracts(tmp,v,o.atm.t1000,myr,0); 
k=2; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);t925=tmp;
v.atm.t925=extracts(tmp,v,o.atm.t925,myr,0); 
k=3; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);t850=tmp;
v.atm.t850=extracts(tmp,v,o.atm.t850,myr,0); 
k=4; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);t775=tmp;
v.atm.t775=extracts(tmp,v,o.atm.t775,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);t700=tmp;
v.atm.t700=extracts(tmp,v,o.atm.t700,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);t600=tmp;
v.atm.t600=extracts(tmp,v,o.atm.t600,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);t500=tmp;
v.atm.t500=extracts(tmp,v,o.atm.t500,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);t400=tmp;
v.atm.t400=extracts(tmp,v,o.atm.t400,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);t300=tmp;
v.atm.t300=extracts(tmp,v,o.atm.t300,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);t250=tmp;
v.atm.t250=extracts(tmp,v,o.atm.t250,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);t200=tmp;
v.atm.t200=extracts(tmp,v,o.atm.t200,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);t150=tmp;
v.atm.t150=extracts(tmp,v,o.atm.t150,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);t100=tmp;
v.atm.t100=extracts(tmp,v,o.atm.t100,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);t70=tmp;
v.atm.t70=extracts(tmp,v,o.atm.t70,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);t50=tmp;
v.atm.t50=extracts(tmp,v,o.atm.t50,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.t30=extracts(tmp,v,o.atm.t30,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.t20=extracts(tmp,v,o.atm.t20,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.t10=extracts(tmp,v,o.atm.t10,myr,0); 
close(f)

% $$$ varn='t975'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
% $$$ f=netcdf(fname,'nowrite'); 
% $$$ tmp=f{'temp'}(v.ts:v.te,1,v.ys:v.ye,v.xs:v.xe);close(f);tmp=squeeze(tmp);
% $$$ v.atm.t975=extracts(tmp,v,o.atm.t975,myr,0); 
% $$$ varn='t950'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
% $$$ f=netcdf(fname,'nowrite'); 
% $$$ tmp=f{'temp'}(v.ts:v.te,1,v.ys:v.ye,v.xs:v.xe);close(f);tmp=squeeze(tmp);
% $$$ v.atm.t950=extracts(tmp,v,o.atm.t950,myr,0); 
% $$$ figure; pcolor(squeeze(v.atm.t975.sea_bias(1,:,:))); shading flat; caxis([-.8 .8]); colorbar;
% $$$ figure; pcolor(squeeze(v.atm.t950.sea_bias(1,:,:))); shading flat; caxis([-.8 .8]); colorbar;
% $$$ figure; pcolor(squeeze(v.sfc.tref.sea_bias(1,:,:))); shading flat; caxis([-.8 .8]); colorbar;

%ATM q
varn='sphum'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
k=1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q1000=tmp;
v.atm.q1000=extracts(tmp,v,o.atm.q1000,myr,0); 
k=2; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q925=tmp;
v.atm.q925=extracts(tmp,v,o.atm.q925,myr,0); 
k=3; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q850=tmp;
v.atm.q850=extracts(tmp,v,o.atm.q850,myr,0); 
k=4; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q775=tmp;
v.atm.q775=extracts(tmp,v,o.atm.q775,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q700=tmp;
v.atm.q700=extracts(tmp,v,o.atm.q700,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q600=tmp;
v.atm.q600=extracts(tmp,v,o.atm.q600,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q500=tmp;
v.atm.q500=extracts(tmp,v,o.atm.q500,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q400=tmp;
v.atm.q400=extracts(tmp,v,o.atm.q400,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q300=tmp;
v.atm.q300=extracts(tmp,v,o.atm.q300,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q250=tmp;
v.atm.q250=extracts(tmp,v,o.atm.q250,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q200=tmp;
v.atm.q200=extracts(tmp,v,o.atm.q200,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q150=tmp;
v.atm.q150=extracts(tmp,v,o.atm.q150,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q100=tmp;
v.atm.q100=extracts(tmp,v,o.atm.q100,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q70=tmp;
v.atm.q70=extracts(tmp,v,o.atm.q70,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q50=tmp;
v.atm.q50=extracts(tmp,v,o.atm.q50,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q50=tmp;
v.atm.q30=extracts(tmp,v,o.atm.q30,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q50=tmp;
v.atm.q20=extracts(tmp,v,o.atm.q20,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q50=tmp;
v.atm.q10=extracts(tmp,v,o.atm.q10,myr,0); 
close(f)
%ATM ql
varn='liq_wat'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
k=1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q1000=tmp;
v.atm.ql1000=extracts(tmp,v,o.atm.q1000,myr,0); 
k=2; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q925=tmp;
v.atm.ql925=extracts(tmp,v,o.atm.q925,myr,0); 
k=3; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q850=tmp;
v.atm.ql850=extracts(tmp,v,o.atm.q850,myr,0); 
k=4; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q775=tmp;
v.atm.ql775=extracts(tmp,v,o.atm.q775,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q700=tmp;
v.atm.ql700=extracts(tmp,v,o.atm.q700,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q600=tmp;
v.atm.ql600=extracts(tmp,v,o.atm.q600,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q500=tmp;
v.atm.ql500=extracts(tmp,v,o.atm.q500,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q400=tmp;
v.atm.ql400=extracts(tmp,v,o.atm.q400,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q300=tmp;
v.atm.ql300=extracts(tmp,v,o.atm.q300,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q250=tmp;
v.atm.ql250=extracts(tmp,v,o.atm.q250,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q200=tmp;
v.atm.ql200=extracts(tmp,v,o.atm.q200,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q150=tmp;
v.atm.ql150=extracts(tmp,v,o.atm.q150,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q100=tmp;
v.atm.ql100=extracts(tmp,v,o.atm.q100,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q70=tmp;
v.atm.ql70=extracts(tmp,v,o.atm.q70,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q50=tmp;
v.atm.ql50=extracts(tmp,v,o.atm.q50,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q50=tmp;
v.atm.ql30=extracts(tmp,v,o.atm.q30,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q50=tmp;
v.atm.ql20=extracts(tmp,v,o.atm.q20,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q50=tmp;
v.atm.ql10=extracts(tmp,v,o.atm.q10,myr,0); 
close(f)
%ATM qi
varn='ice_wat'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
k=1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q1000=tmp;
v.atm.qi1000=extracts(tmp,v,o.atm.q1000,myr,0); 
k=2; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q925=tmp;
v.atm.qi925=extracts(tmp,v,o.atm.q925,myr,0); 
k=3; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q850=tmp;
v.atm.qi850=extracts(tmp,v,o.atm.q850,myr,0); 
k=4; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q775=tmp;
v.atm.qi775=extracts(tmp,v,o.atm.q775,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q700=tmp;
v.atm.qi700=extracts(tmp,v,o.atm.q700,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q600=tmp;
v.atm.qi600=extracts(tmp,v,o.atm.q600,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q500=tmp;
v.atm.qi500=extracts(tmp,v,o.atm.q500,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q400=tmp;
v.atm.qi400=extracts(tmp,v,o.atm.q400,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q300=tmp;
v.atm.qi300=extracts(tmp,v,o.atm.q300,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q250=tmp;
v.atm.qi250=extracts(tmp,v,o.atm.q250,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q200=tmp;
v.atm.qi200=extracts(tmp,v,o.atm.q200,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q150=tmp;
v.atm.qi150=extracts(tmp,v,o.atm.q150,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q100=tmp;
v.atm.qi100=extracts(tmp,v,o.atm.q100,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q70=tmp;
v.atm.qi70=extracts(tmp,v,o.atm.q70,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q50=tmp;
v.atm.qi50=extracts(tmp,v,o.atm.q50,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q50=tmp;
v.atm.qi30=extracts(tmp,v,o.atm.q30,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q50=tmp;
v.atm.qi20=extracts(tmp,v,o.atm.q20,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q50=tmp;
v.atm.qi10=extracts(tmp,v,o.atm.q10,myr,0); 
close(f)
%ATM qa
varn='cld_amt'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
k=1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q1000=tmp;
v.atm.qa1000=extracts(tmp,v,o.atm.q1000,myr,0); 
k=2; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q925=tmp;
v.atm.qa925=extracts(tmp,v,o.atm.q925,myr,0); 
k=3; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q850=tmp;
v.atm.qa850=extracts(tmp,v,o.atm.q850,myr,0); 
k=4; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q775=tmp;
v.atm.qa775=extracts(tmp,v,o.atm.q775,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q700=tmp;
v.atm.qa700=extracts(tmp,v,o.atm.q700,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q600=tmp;
v.atm.qa600=extracts(tmp,v,o.atm.q600,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q500=tmp;
v.atm.qa500=extracts(tmp,v,o.atm.q500,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q400=tmp;
v.atm.qa400=extracts(tmp,v,o.atm.q400,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q300=tmp;
v.atm.qa300=extracts(tmp,v,o.atm.q300,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q250=tmp;
v.atm.qa250=extracts(tmp,v,o.atm.q250,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q200=tmp;
v.atm.qa200=extracts(tmp,v,o.atm.q200,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q150=tmp;
v.atm.qa150=extracts(tmp,v,o.atm.q150,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q100=tmp;
v.atm.qa100=extracts(tmp,v,o.atm.q100,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q70=tmp;
v.atm.qa70=extracts(tmp,v,o.atm.q70,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q50=tmp;
v.atm.qa50=extracts(tmp,v,o.atm.q50,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q50=tmp;
v.atm.qa30=extracts(tmp,v,o.atm.q30,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q50=tmp;
v.atm.qa20=extracts(tmp,v,o.atm.q20,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);q50=tmp;
v.atm.qa10=extracts(tmp,v,o.atm.q10,myr,0); 
close(f)
%ATM rh
varn='rh'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); 
  k=1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.rh1000=extracts(tmp,v,o.atm.rh1000,myr,0); 
  k=2; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.rh925=extracts(tmp,v,o.atm.rh925,myr,0); 
  k=3; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.rh850=extracts(tmp,v,o.atm.rh850,myr,0); 
  k=4; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.rh775=extracts(tmp,v,o.atm.rh775,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.rh700=extracts(tmp,v,o.atm.rh700,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.rh600=extracts(tmp,v,o.atm.rh600,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.rh500=extracts(tmp,v,o.atm.rh500,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.rh400=extracts(tmp,v,o.atm.rh400,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.rh300=extracts(tmp,v,o.atm.rh300,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.rh250=extracts(tmp,v,o.atm.rh250,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.rh200=extracts(tmp,v,o.atm.rh200,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.rh150=extracts(tmp,v,o.atm.rh150,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.rh100=extracts(tmp,v,o.atm.rh100,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.rh70=extracts(tmp,v,o.atm.rh70,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
  v.atm.rh50=extracts(tmp,v,o.atm.rh50,myr,0); 
  close(f)
end
%ATM hght
varn='hght'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
k=1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);z1000=tmp;
v.atm.z1000=extracts(tmp,v,o.atm.z1000,myr,0); 
k=2; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);z925=tmp;
v.atm.z925=extracts(tmp,v,o.atm.z925,myr,0); 
k=3; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);z850=tmp;
v.atm.z850=extracts(tmp,v,o.atm.z850,myr,0); 
k=4; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);z775=tmp;
v.atm.z775=extracts(tmp,v,o.atm.z775,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);z700=tmp;
v.atm.z700=extracts(tmp,v,o.atm.z700,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);z600=tmp;
v.atm.z600=extracts(tmp,v,o.atm.z600,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);z500=tmp;
v.atm.z500=extracts(tmp,v,o.atm.z500,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);z400=tmp;
v.atm.z400=extracts(tmp,v,o.atm.z400,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);z300=tmp;
v.atm.z300=extracts(tmp,v,o.atm.z300,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);z250=tmp;
v.atm.z250=extracts(tmp,v,o.atm.z250,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);z200=tmp;
v.atm.z200=extracts(tmp,v,o.atm.z200,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);z150=tmp;
v.atm.z150=extracts(tmp,v,o.atm.z150,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);z100=tmp;
v.atm.z100=extracts(tmp,v,o.atm.z100,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);z70=tmp;
v.atm.z70=extracts(tmp,v,o.atm.z70,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);z50=tmp;
v.atm.z50=extracts(tmp,v,o.atm.z50,myr,0); 
close(f)
%MSE
%k=1-15:1000,925,850,775,700,600,500,400,300,250,200,150,100,70,50hPa
tmp=CPD*t1000+G*z1000+LV0*q1000; v.atm.h1000=extracts(tmp,v,o.atm.h1000,myr,0);
tmp=CPD*t925 +G*z925 +LV0*q925;  v.atm.h925 =extracts(tmp,v,o.atm.h925,myr,0); 
tmp=CPD*t850 +G*z850 +LV0*q850;  v.atm.h850 =extracts(tmp,v,o.atm.h850,myr,0); 
%tmp=CPD*t775 +G*z775 +LV0*q775;  v.atm.h775 =extracts(tmp,v,o.atm.h775,myr,0); 
tmp=CPD*t700 +G*z700 +LV0*q700;  v.atm.h700 =extracts(tmp,v,o.atm.h700,myr,0); 
tmp=CPD*t600 +G*z600 +LV0*q600;  v.atm.h600 =extracts(tmp,v,o.atm.h600,myr,0); 
tmp=CPD*t500 +G*z500 +LV0*q500;  v.atm.h500 =extracts(tmp,v,o.atm.h500,myr,0); 
tmp=CPD*t400 +G*z400 +LV0*q400;  v.atm.h400 =extracts(tmp,v,o.atm.h400,myr,0); 
tmp=CPD*t300 +G*z300 +LV0*q300;  v.atm.h300 =extracts(tmp,v,o.atm.h300,myr,0); 
tmp=CPD*t250 +G*z250 +LV0*q250;  v.atm.h250 =extracts(tmp,v,o.atm.h250,myr,0); 
tmp=CPD*t200 +G*z200 +LV0*q200;  v.atm.h200 =extracts(tmp,v,o.atm.h200,myr,0); 
tmp=CPD*t150 +G*z150 +LV0*q150;  v.atm.h150 =extracts(tmp,v,o.atm.h150,myr,0); 
tmp=CPD*t100 +G*z100 +LV0*q100;  v.atm.h100 =extracts(tmp,v,o.atm.h100,myr,0); 
clear t1000 t925 t850 t775 t700 t600 t500 t400 t300 t250 t200 t150 t100;
clear q1000 q925 q850 q775 q700 q600 q500 q400 q300 q250 q200 q150 q100;
clear z1000 z925 z850 z775 z700 z600 z500 z400 z300 z250 z200 z150 z100;

%ATM U
varn='ucomp'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
k=1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u1000=extracts(tmp,v,o.atm.u1000,myr,0); 
k=2; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u925=extracts(tmp,v,o.atm.u925,myr,0); 
k=3; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u850=extracts(tmp,v,o.atm.u850,myr,0); 
k=4; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u775=extracts(tmp,v,o.atm.u775,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u700=extracts(tmp,v,o.atm.u700,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u600=extracts(tmp,v,o.atm.u600,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u500=extracts(tmp,v,o.atm.u500,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u400=extracts(tmp,v,o.atm.u400,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u300=extracts(tmp,v,o.atm.u300,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u250=extracts(tmp,v,o.atm.u250,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u200=extracts(tmp,v,o.atm.u200,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u150=extracts(tmp,v,o.atm.u150,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u100=extracts(tmp,v,o.atm.u100,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u70=extracts(tmp,v,o.atm.u70,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u50=extracts(tmp,v,o.atm.u50,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u30=extracts(tmp,v,o.atm.u30,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u20=extracts(tmp,v,o.atm.u20,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.u10=extracts(tmp,v,o.atm.u10,myr,0); 
close(f)
%ATM V
varn='vcomp'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
k=1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v1000=extracts(tmp,v,o.atm.v1000,myr,0); 
k=2; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v925=extracts(tmp,v,o.atm.v925,myr,0); 
k=3; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v850=extracts(tmp,v,o.atm.v850,myr,0); 
k=4; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v775=extracts(tmp,v,o.atm.v775,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v700=extracts(tmp,v,o.atm.v700,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v600=extracts(tmp,v,o.atm.v600,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v500=extracts(tmp,v,o.atm.v500,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v400=extracts(tmp,v,o.atm.v400,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v300=extracts(tmp,v,o.atm.v300,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v250=extracts(tmp,v,o.atm.v250,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v200=extracts(tmp,v,o.atm.v200,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v150=extracts(tmp,v,o.atm.v150,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v100=extracts(tmp,v,o.atm.v100,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v70=extracts(tmp,v,o.atm.v70,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v50=extracts(tmp,v,o.atm.v50,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v30=extracts(tmp,v,o.atm.v30,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v20=extracts(tmp,v,o.atm.v20,myr,0); 
k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);
v.atm.v10=extracts(tmp,v,o.atm.v10,myr,0); 
close(f)

%ATM liq_drp
varn='liq_drp'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); 
  k=1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.qn1000=extracts(tmp,v,o.dummy,myr,0); 
  k=2; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.qn925=extracts(tmp,v,o.dummy,myr,0); 
  k=3; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.qn850=extracts(tmp,v,o.dummy,myr,0); 
  k=4; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.qn775=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.qn700=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.qn600=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.qn500=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.qn400=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.qn300=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.qn250=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.qn200=extracts(tmp,v,o.dummy,myr,0); 
  close(f)
end

%ATM droplets
varn='droplets'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); 
  k=1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.nn1000=extracts(tmp,v,o.dummy,myr,0); 
  k=2; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.nn925=extracts(tmp,v,o.dummy,myr,0); 
  k=3; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.nn850=extracts(tmp,v,o.dummy,myr,0); 
  k=4; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.nn775=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.nn700=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.nn600=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.nn500=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.nn400=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.nn300=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.nn250=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.nn200=extracts(tmp,v,o.dummy,myr,0); 
  close(f)
end

%ATM aliq
varn='aliq'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); 
  k=1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.al1000=extracts(tmp,v,o.dummy,myr,0); 
  k=2; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.al925=extracts(tmp,v,o.dummy,myr,0); 
  k=3; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.al850=extracts(tmp,v,o.dummy,myr,0); 
  k=4; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.al775=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.al700=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.al600=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.al500=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.al400=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.al300=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.al250=extracts(tmp,v,o.dummy,myr,0); 
  k=k+1; tmp=f{varn}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); tmp=squeeze(tmp);%tmp(tmp<0)=0;
  v.atm.al200=extracts(tmp,v,o.dummy,myr,0); 
  close(f)
end

%Surface
varn='t_ref'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe);close(f);%tmp=tmp-273.15;
v.sfc.tref=extracts(tmp,v,o.sfc.tref,myr,0); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.sfc.tref.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.sfc.tref.al0=getts(v.sfc.tref.all,o);

varn='precip'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe)*86400; close(f);
v.sfc.pcp=extracts(tmp,v,o.sfc.pcp,myr,0); 
v.sfc.pcp7909=extracts(tmp,v,o.sfc.pcp7909,myr,0);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.sfc.pcp.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.sfc.pcp.al0=getts(v.sfc.pcp.all,o);


varn='prec_ls'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe)*86400; close(f);
v.sfc.prec_ls=extracts(tmp,v,o.sfc.pcp,myr,0); 

varn='prec_conv'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe)*86400; close(f);
v.sfc.prec_cv=extracts(tmp,v,o.sfc.pcp,myr,0); 

v.time=[str2num(yr1):1:str2num(yr2)];
n=length(v.time); n=floor(n/5);
yr=str2num(yr1)-1; v.tpen=[2.5:5:n*5-2.5]+yr;

if (opt==0)
  tpath='/work/miz/mat_cm4/'; 
  fn=strcat(tpath,expn,'_',region,'_tsana.mat');fn
  save(fn,'v'); %save(fn,'v','-v7.3');
  return
end

varn='snow_conv'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f); snow_cv=tmp;
v.sfc.snow_cv=extracts(tmp,v,o.sfc.pcp,myr,0);

varn='snow_ls'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f); snow_ls=tmp;
v.sfc.snow_ls=extracts(tmp,v,o.sfc.pcp,myr,0);
snow=snow_cv+snow_ls;

varn='tau_x'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
v.sfc.taux=extracts(-tmp,v,o.sfc.taux,myr,0);

varn='tau_y'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
v.sfc.tauy=extracts(-tmp,v,o.sfc.tauy,myr,0);

varn='rh_ref'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
v.sfc.rhref=extracts(tmp,v,o.sfc.rhref,myr,0);

varn='u_ref'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
v.sfc.uref=extracts(tmp,v,o.sfc.uref,myr,0); 

varn='wind_ref'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); 
  tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
  v.sfc.wref=extracts(tmp,v,o.sfc.wref,myr,0);
end

varn='evap'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe)*LV0; close(f); evap=tmp;
v.sfc.evap=extracts(tmp,v,o.sfc.evap,myr,0); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.sfc.evap.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.sfc.evap.al0=getts(v.sfc.evap.all,o);

varn='shflx'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f); shflx=tmp;
v.sfc.shflx=extracts(tmp,v,o.sfc.shflx,myr,0); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.sfc.shflx.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.sfc.shflx.al0=getts(v.sfc.shflx.all,o);

varn='olr'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f); olr=tmp;
v.toa.lwnet=extracts(tmp,v,o.toa.lwnet,myr,0); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.toa.lwnet.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.toa.lwnet.al0=getts(v.toa.lwnet.all,o);

varn='olr_clr'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f); olr_clr=tmp;
v.toa.lwnet_clr=extracts(tmp,v,o.toa.lwnet_clr,myr,0); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.toa.lwnet_clr.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.toa.lwnet_clr.al0=getts(v.toa.lwnet_clr.all,o);

tmp=olr_clr-olr; lwcftoa=tmp;size(lwcftoa)
v.toa.lwcf=extracts(tmp,v,o.toa.lwcf,myr,0);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.toa.lwcf.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.toa.lwcf.al0=getts(v.toa.lwcf.all,o);

varn='lwup_sfc_clr'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f); lwupsfc_clr=tmp;

varn='lwdn_sfc_clr'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f); lwdnsfc_clr=tmp;

tmp=-(olr_clr-lwupsfc_clr+lwdnsfc_clr);
v.atm.lwnet_clr=extracts(tmp,v,o.atm.lwnet_clr,myr,0); 
clear lwdnsfc_clr lwupsfc_clr;

varn='swup_toa'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f); swup_toa=tmp;

varn='swup_toa_clr'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f); swup_toa_clr=tmp;

tmp=swup_toa_clr-swup_toa; swcftoa=tmp;
v.toa.swcf=extracts(tmp,v,o.toa.swcf,myr,0); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.toa.swcf.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.toa.swcf.al0=getts(v.toa.swcf.all,o);

tmp=(olr_clr-olr)+(swup_toa_clr-swup_toa); ttcftoa=tmp;
v.toa.ttcf=extracts(tmp,v,o.toa.ttcf,myr,0); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.toa.ttcf.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.toa.ttcf.al0=getts(v.toa.ttcf.all,o);

varn='swdn_toa'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f); swdn_toa=tmp;
tmp=swdn_toa-swup_toa; swabs=tmp; clear swup_toa swdn_toa;
v.toa.swnet=extracts(tmp,v,o.toa.swnet,myr,0);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.toa.swnet.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.toa.swnet.al0=getts(v.toa.swnet.all,o);

tmp=swabs-olr; v.toa.netrad=extracts(tmp,v,o.toa.netrad,myr,0);
netradtoa=tmp; 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.toa.netrad.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.toa.netrad.al0=getts(v.toa.netrad.all,o);

varn='swdn_toa_clr'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f); swdn_toa_clr=tmp;
tmp=swdn_toa_clr-swup_toa_clr; 
v.toa.swnet_clr=extracts(tmp,v,o.toa.swnet_clr,myr,0);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.toa.swnet_clr.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.toa.swnet_clr.al0=getts(v.toa.swnet_clr.all,o);

tmp=swdn_toa_clr-swup_toa_clr-olr_clr;
v.toa.netrad_clr=extracts(tmp,v,o.toa.netrad_clr,myr,0);

varn='lwdn_sfc'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
lwdnsfc=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
varn='lwup_sfc'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
lwupsfc=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
tmp=lwdnsfc-lwupsfc; lwnetsfc=tmp;
v.sfc.lwnet=extracts(tmp,v,o.sfc.lwnet,myr,0);
lwflxsfc=tmp; clear lwdnsfc lwupsfc;

tmp=-(olr+lwflxsfc); 
v.atm.lwnet=extracts(tmp,v,o.atm.lwnet,myr,0);

varn='swdn_sfc'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
swdnsfc=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
v.sfc.swdn=extracts(tmp,v,o.sfc.swdn,myr,0); 

varn='swup_sfc'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
swupsfc=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
v.sfc.swup=extracts(tmp,v,o.sfc.swup,myr,0); 

tmp=swupsfc./swdnsfc; tmp(swdnsfc<0.5)=0; tmp(tmp>1)=1;
v.sfc.albedo=extracts(tmp,v,o.sfc.albedo,myr,0); 

tmp=swdnsfc-swupsfc; swnetsfc=tmp;
v.sfc.swnet=extracts(tmp,v,o.sfc.swnet,myr,0); 
swflxsfc=tmp; clear swdnsfc swupsfc;

tmp=swabs-swflxsfc; 
v.atm.swnet=extracts(tmp,v,o.atm.swnet,myr,0);

tmp=lwflxsfc+swflxsfc; 
v.sfc.netrad=extracts(tmp,v,o.sfc.netrad,myr,0); 
netradsfc=tmp; clear lwflxsfc swflxsfc olr swabs;

tmp=netradtoa-netradsfc; 
v.atm.netrad=extracts(tmp,v,o.atm.netrad,myr,0);
clear netradtoa-netradsfc;

tmp=netradsfc-evap-shflx-snow*HLF; 
v.sfc.netflx=extracts(tmp,v,o.sfc.netflx,myr,0);

varn='swdn_sfc_clr'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
swdnsfc_clr=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
varn='swup_sfc_clr'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
swupsfc_clr=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
tmp=swdnsfc_clr-swupsfc_clr; swnetsfc_clr=tmp;
v.sfc.swnet_clr=extracts(tmp,v,o.sfc.swnet_clr,myr,0); 
swnetsfc_clr=tmp; 

varn='lwdn_sfc_clr'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
lwdnsfc_clr=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
varn='lwup_sfc_clr'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
lwupsfc_clr=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
tmp=lwdnsfc_clr-lwupsfc_clr; lwnetsfc_clr=tmp;
v.sfc.lwnet_clr=extracts(tmp,v,o.sfc.lwnet_clr,myr,0); 

tmp=swnetsfc_clr+tmp; 
v.sfc.netrad_clr=extracts(tmp,v,o.sfc.netrad_clr,myr,0); 

tmp=-lwnetsfc_clr+lwnetsfc; lwcfsfc=tmp;
v.sfc.lwcf=extracts(tmp,v,o.sfc.lwcf,myr,0); 

tmp=-swnetsfc_clr+swnetsfc; swcfsfc=tmp;
v.sfc.swcf=extracts(tmp,v,o.sfc.swcf,myr,0); 

tmp=lwcfsfc+swcfsfc; ttcfsfc=tmp;
v.sfc.ttcf=extracts(tmp,v,o.sfc.ttcf,myr,0); 

tmp=lwcftoa-lwcfsfc;
v.atm.lwcf=extracts(tmp,v,o.atm.lwcf,myr,0); 

tmp=swcftoa-swcfsfc;
v.atm.swcf=extracts(tmp,v,o.atm.swcf,myr,0); 

tmp=ttcftoa-ttcfsfc;
v.atm.ttcf=extracts(tmp,v,o.atm.ttcf,myr,0); 

%temporary%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
% $$$ pp='/ts_all_aero/';fext =strcat('atmos_month_aer.',yr1,'01-',yr2,'12.');
% $$$ varn='aer_ex_c_vs'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
% $$$ if (exist(fname,'file') == 2)
% $$$   f=netcdf(fname,'nowrite'); 
% $$$   tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
% $$$   v.atm.aod=extracts(tmp,v,o.dummy,myr,0);
% $$$ end
% $$$ varn='sulfate_col'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
% $$$ if (exist(fname,'file') == 2)
% $$$   f=netcdf(fname,'nowrite'); 
% $$$   tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
% $$$   v.atm.sul=extracts(tmp,v,o.dummy,myr,0);
% $$$ end
% $$$ varn='blk_crb_col'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
% $$$ if (exist(fname,'file') == 2)
% $$$   f=netcdf(fname,'nowrite'); 
% $$$   tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
% $$$   v.atm.blk=extracts(tmp,v,o.dummy,myr,0);
% $$$ end
%v.aa=0; %v.time=[str2num(yr1):1:str2num(yr2)];
%v.time=[str2num(yr1):1:str2num(yr1)+nyr];
%n=length(v.time); n=floor(n/5);
%yr=str2num(yr1)-1; v.tpen=[2.5:5:n*5-2.5]+yr;
%v.f=0; v.imk=0;
%fn=strcat(tpath,expn,'/',expn,'_',region,'_tsana.mat');
%save(fn,'v','-v7.3'); %save very large files
%return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%below the observation data may be wrong
varn='WVP'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f); wvp=tmp;
v.atm.wvp=extracts(tmp,v,o.dummy,myr,0); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon);
v.atm.wvp.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.atm.wvp.al0=getts(v.atm.wvp.all,o);

varn='LWP'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f); lwp=tmp;
v.atm.lwp=extracts(tmp,v,o.dummy,myr,0); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.atm.lwp.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.atm.lwp.al0=getts(v.atm.lwp.all,o);

varn='IWP'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f); lwp=tmp;
v.atm.iwp=extracts(tmp,v,o.dummy,myr,0);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.atm.iwp.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.atm.iwp.al0=getts(v.atm.iwp.all,o);

varn='low_cld_amt'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f); 
v.atm.qal=extracts(tmp,v,o.dummy,myr,0); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.atm.qal.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.atm.qal.al0=getts(v.atm.qal.all,o);

varn='mid_cld_amt'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
v.atm.qam=extracts(tmp,v,o.dummy,myr,0); 
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.atm.qam.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.atm.qam.al0=getts(v.atm.qam.all,o);

varn='high_cld_amt'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
f=netcdf(fname,'nowrite'); 
tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
v.atm.qah=extracts(tmp,v,o.dummy,myr,0);
tmp=reshape(tmp,12,v.nt/12,v.nlat,v.nlon); 
v.atm.qah.all=interp_grid(tmp,lonx,latx,v.lon,v.lat,1);
v.atm.qah.al0=getts(v.atm.qah.all,o);

varn='crh_uwc'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); 
  tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
  v.atm.crh=extracts(tmp,v,o.dummy,myr,0);
end

pp='/ts_all_aero/';fext =strcat('atmos_month_aer.',yr1,'01-',yr2,'12.');
varn='aer_ex_c_vs'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); 
  tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
  v.atm.aod=extracts(tmp,v,o.dummy,myr,0);
end

varn='sulfate_col'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); 
  tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
  v.atm.sul=extracts(tmp,v,o.dummy,myr,0);
end

varn='blk_crb_col'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); 
  tmp=f{varn}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
  v.atm.blk=extracts(tmp,v,o.dummy,myr,0);
end

%computer CRF sorting into omega scheme
latlon_t=[0 360 -30 30]; latlon_nhet=[0 360 30 90]; latlon_shet=[0 360 -90 -30];
dlo='do_all';   %set dlo=do_all
omega=v.atm.w700.all; omega_clm=v.atm.w700.clm;
v.om700.glob=do_bony(v,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon,dlo);
v.om700.trop=do_bony(v,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_t,dlo);
v.om700.nhet=do_bony(v,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_nhet,dlo);
v.om700.shet=do_bony(v,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_shet,dlo);
omega=v.atm.w500.all; omega_clm=v.atm.w500.clm;
v.om500.glob=do_bony(v,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon,dlo);
v.om500.trop=do_bony(v,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_t,dlo);
v.om500.nhet=do_bony(v,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_nhet,dlo);
v.om500.shet=do_bony(v,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_shet,dlo);
dlo='do_ocean'; %set dlo=do_ocean
omega=v.atm.w700.all; omega_clm=v.atm.w700.clm;
v.om700.glob_ocean=do_bony(v,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon,dlo);
v.om700.trop_ocean=do_bony(v,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_t,dlo);
v.om700.nhet_ocean=do_bony(v,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_nhet,dlo);
v.om700.shet_ocean=do_bony(v,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_shet,dlo);
omega=v.atm.w500.all; omega_clm=v.atm.w500.clm;
v.om500.glob_ocean=do_bony(v,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon,dlo);
v.om500.trop_ocean=do_bony(v,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_t,dlo);
v.om500.nhet_ocean=do_bony(v,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_nhet,dlo);
v.om500.shet_ocean=do_bony(v,omega,omega_clm,o.lm0,o.aa0,o.lat,o.lon,latlon_shet,dlo);

%computer CRF correlation and slope
if (opt==3)
  v.crf  =regress_mvar(v,o.nlat,o.nlon,1);
  v.trend=trend_ana(v);
end
v.aa=0; %v.time=[str2num(yr1):1:str2num(yr2)];
v.time=[str2num(yr1):1:str2num(yr1)+nyr];
n=length(v.time); n=floor(n/5);
yr=str2num(yr1)-1; v.tpen=[2.5:5:n*5-2.5]+yr;
v.f=0; v.imk=0;
if (opt==1)
  tpath='/work/miz/mat_cm4/'; 
  fn=strcat(tpath,expn,'_',region,'_tsana.mat');
  save(fn,'v'); %save(fn,'v','-v7.3');
else
  fn=strcat(tpath,expn,'/',expn,'_',region,'_tsana.mat');
% save(fn,'v');
  save(fn,'v','-v7.3'); %save very large files
  %save -v7.3 '/work/miz/tmp.mat' 'v'; 
end

return

x=v.bony.obinc; c1=[0.8 0.8 0.8]; c2=[0.5 0.5 0.5]; 
figure; y=o.bony.lwcf;
shadedplot(x,y.avg-y.std,y.avg+y.std,c1,c1); hold on;
plot(x,y.avg,'r'); hold on;
y=v.bony.lwcf_clm; 
plot(x,y.avg,'b'); 

figure; 
plot(obinc,o.bony.swcf_clm.avg,'r'); hold on;
plot(obinc,v.bony.swcf_clm.avg); hold on

%usage:
%below opt=1 for writing mat file to /work/miz
%below opt=2 for writing mat file to /archive
 latlon=[0 360 -90 90]; region='global'; nyr=4; myr=1; opt=2;
%latlon=[0 360 -30 30]; region='tropic'; myr=1; opt=0;
%latlon=[150 250 -5 5]; region='equpac'; myr=1; opt=0;
%read in or generate observation data
%o=readobs(latlon,region,'c96');
fn=strcat('/work/miz/mat_cm4/obs_',region,'_tsana.mat'); load(fn); 
%%%start analysis%%%================
tpath='/archive/Ming.Zhao/awg/tikal_201403/';
expn='CM_c96L48_am4d1r0_FO_2000_ctrl2'; yr1='0001'; yr2='0004'; mod='c96';
v=tsana(o,tpath,expn,yr1,yr2,latlon,region,nyr,myr,mod,opt);

%load CM2.5FLOR and previous analysis matlab
pp='/ts_all/'; region='global'; 
dr=strcat('_',region,'_tsana.mat'); 
tpath='/archive/Ming.Zhao/awg/tikal_201403/';
load(strcat('/work/miz/mat_cm4/CM2.5_A_Control-1990_FLOR_B01',dr)); cm25f=v;

expn='CM_c96L48_am4d1r0_FO_2000_ctrl2';
fn=strcat(tpath,expn,pp,expn,dr); load(fn); x=v;
vname='sst_bias'; k1=1; k2=1; s=x.s; f=1; s0=expn; s0(s0=='_')='-';
t=1; z1=squeeze(mean(cm25f.sst.dif_myr (t,:,:),1));s.s1=strcat('CM2.5F-year-',num2str(t));
t=2; z3=squeeze(mean(cm25f.sst.dif_myr (t,:,:),1));s.s3=strcat('CM2.5F-year-',num2str(t));
t=3; z5=squeeze(mean(cm25f.sst.dif_myr (t,:,:),1));s.s5=strcat('CM2.5F-year-',num2str(t));
t=1; z2=squeeze(mean(x.sst.dif_myr (t,:,:),1));s.s2=strcat(s0,'-year-',num2str(t));
t=2; z4=squeeze(mean(x.sst.dif_myr (t,:,:),1));s.s4=strcat(s0,'-year-',num2str(t));
t=3; z6=squeeze(mean(x.sst.dif_myr (t,:,:),1));s.s6=strcat(s0,'-year-',num2str(t));
cmin=-5; cmax=5; vbin=[cmin:(cmax-cmin)/20:cmax]; 
fpath=strcat(tpath,expn,pp,'figs/'); exp='cm'; %fpath='./fig_cm4'; exp='cm4';
plot_6panel_cm4(s,z1,z2,z3,z4,z5,z6,vbin,cmin,cmax,vname,fpath,exp,f);
%%%%%%%%%%%%%%%%%%%%%%%%%%
