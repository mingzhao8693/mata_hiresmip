function v=read_erai_region(tpath,latlon,region,ts,te)
%latlon=[0 360 10 90]; region='NH'; v.latlon=latlon;
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
v.ts=ts; v.te=te; v.nt=te-ts+1; v.nyr=v.nt/12;
%%%%%%%%%%%%%%%%%%%%%%%%%
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
fn=strcat(tpath,'ERA_interim/monthly/land_mask.nc');
f=netcdf(fn,'nowrite'); v.fn_land_mask=fn;
v.lon=f{'lon'}(:); v.lat=f{'lat'}(:); 
v.ys  =min(find(v.lat(:)<=lat2)); v.ye  =max(find(v.lat(:)>= lat1));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat =v.lat(v.ys:v.ye); v.lon =v.lon(v.xs:v.xe);
v.nlon=length(v.lon); v.nlat=length(v.lat); v.ngrid=v.nlon*v.nlat;
a=f{'land_mask'}(:,v.ys:v.ye,v.xs:v.xe);
v.lm=a*1.52594875864068e-05+0.499992370256207; close(f);
%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,'/ERA_interim/monthly/z_sfc.nc'); p.fn_z_sfc=fn;
f=netcdf(fn,'nowrite'); a=f{'z'}(:,v.ys:v.ye,v.xs:v.xe); 
v.zs=a*0.825278867135642+26007.6759836133; close(f); 
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%
%read in additional data: z and msl
%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,'ERA_interim/monthly/z.197901-201512.nc');
f=netcdf(fn,'nowrite'); v.fn_z=fn; 
k=37; a=f{'z'}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a=squeeze(a)/G;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); z1000=a; 
v.z1000_clm=squeeze(mean(a,2)); v.z1000_ann=squeeze(mean(v.z1000_clm,1));
a=v.z1000_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); v.z1000_ano=z1000-a;
k=22; a=f{'z'}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a=squeeze(a)/G;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); z500=a; 
v.z500_clm=squeeze(mean(a,2)); v.z500_ann=squeeze(mean(v.z500_clm,1));
a=v.z500_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); v.z500_ano=z500-a;

k=26; a=f{'z'}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a=squeeze(a)/G;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); z700=a; 
v.z700_clm=squeeze(mean(a,2)); v.z700_ann=squeeze(mean(v.z700_clm,1));
a=v.z700_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); v.z700_ano=z700-a;

k=31; a=f{'z'}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a=squeeze(a)/G;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); z850=a; 
v.z850_clm=squeeze(mean(a,2)); v.z850_ann=squeeze(mean(v.z850_clm,1));
a=v.z850_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); v.z850_ano=z850-a;
close(f);
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,'ERA_interim/monthly/msl.197901-201512.nc'); v.fn_slp=fn;
f=netcdf(fn,'nowrite'); a=f{'msl'}(v.ts:v.te,v.ys:v.ye,v.xs:v.xe); close(f);
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); msl=a;
v.msl_clm=squeeze(mean(a,2)); v.msl_ann=squeeze(mean(v.msl_clm,1));
a=v.msl_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); v.msl_ano=msl-a;
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(tpath,'ERA_interim/monthly/u.197901-201512.nc');
f=netcdf(fn,'nowrite'); v.fn_u=fn; 
k=15; a=f{'u'}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a=squeeze(a);
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); u200=a; 
v.u200_clm=squeeze(mean(a,2)); v.u200_ann=squeeze(mean(v.u200_clm,1));
a=v.u200_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); v.u200_ano=u200-a; close(f); return;

k=31; a=f{'u'}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a=squeeze(a);
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); u850=a; 
v.u850_clm=squeeze(mean(a,2)); v.u850_ann=squeeze(mean(v.u850_clm,1));
a=v.u850_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); v.u850_ano=u850-a; 

k=37; a=f{'u'}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a=squeeze(a)/G;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); u1000=a; 
v.u1000_clm=squeeze(mean(a,2)); v.u1000_ann=squeeze(mean(v.u1000_clm,1));
a=v.u1000_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); v.u1000_ano=u1000-a;
k=22; a=f{'u'}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a=squeeze(a)/G;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); u500=a; 
v.u500_clm=squeeze(mean(a,2)); v.u500_ann=squeeze(mean(v.u500_clm,1));
a=v.u500_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); v.u500_ano=u500-a;
k=26; a=f{'u'}(v.ts:v.te,k,v.ys:v.ye,v.xs:v.xe); a=squeeze(a)/G;
a=reshape(a,12,v.nt/12,v.nlat,v.nlon); u700=a; 
v.u700_clm=squeeze(mean(a,2)); v.u700_ann=squeeze(mean(v.u700_clm,1));
a=v.u700_clm; x=repmat(a,[1 1 1 v.nyr]); a=shiftdim(x,3); 
a=permute(a,[2 1 3 4]); v.u700_ano=u700-a;
close(f);
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
return
