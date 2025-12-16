function v=read_erainterim_tqzuv_new(tpath,latlon,s,t1,t2);
%mod='c48'; fn=strcat('./atmos.static_',mod,'.nc'); 
%latlon=[0 360 -90 90]; s=readgrid_static(fn,latlon);
%tpath='/archive/Ming.Zhao/backup/readobs_data';
%t1=265; t2=396; %Jan2001 - Dec2012
%t1=265; t2=432; %Jan2001 - Dec2015
tpath=strcat(tpath,'/ERA_interim/monthly/');

[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
fname=strcat(tpath,'t.197901-201512.nc')
f=netcdf(fname,'nowrite'); 'FILE OPENED...'
latname='latitude';lonname='longitude';
%note latitude reversed in the files; data need to be flipped
v.lat =f{latname}(:); v.lon=f{lonname}(:); v.latlon=latlon;
v.ye  =min(find(v.lat(:)<=lat1)); v.ys  =max(find(v.lat(:)>= lat2));
v.xs  =min(find(v.lon(:)>=lon1)); v.xe  =max(find(v.lon(:)<= lon2));
v.lat=f{latname}(v.ys:v.ye); v.lon=f{lonname}(v.xs:v.xe);
v.lat=flipud(v.lat);
v.time=f{'time'}(t1:t2); v.nt=length(v.time); v.ts=1; v.te=v.nt;
v.pf=f{'levelist'}(:); v.nz=length(v.pf); v
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
lonx=s.lon; latx =s.lat;

afact=0.00213617807865754; offset=248.596641592917;

varn='t'; fname=strcat(tpath,varn,'.197901-201512.nc')
x=read1var(fname,varn,v,t1,t2,s,0);
v.t1000=x.t1000; v.t975=x.t975; v.t950=x.t950; 
v.t925 =x.t925;  v.t850=x.t850; v.t775=x.t775;
v.t700 =x.t700;  v.t600=x.t600; v.t500=x.t500; 
v.t400 =x.t400;  v.t300=x.t300; v.t250=x.t250; 
v.t200 =x.t200;  v.t150=x.t150; v.t100=x.t100; 
v.t70  =x.t70;   v.t50 =x.t50;  v.t30 =x.t30;
v.t20  =x.t20;   v.t10 =x.t10;

varn='q'; fname=strcat(tpath,varn,'.197901-201512.nc')
x=read1var(fname,varn,v,t1,t2,s,0);
v.q1000=x.t1000; v.q975=x.t975; v.q950=x.t950; 
v.q925 =x.t925;  v.q850=x.t850; v.q775=x.t775;
v.q700 =x.t700;  v.q600=x.t600; v.q500=x.t500; 
v.q400 =x.t400;  v.q300=x.t300; v.q250=x.t250; 
v.q200 =x.t200;  v.q150=x.t150; v.q100=x.t100; 
v.q70  =x.t70;   v.q50 =x.t50;  v.q30 =x.t30; 
v.q20  =x.t20;   v.q10 =x.t10;


varn='r'; fname=strcat(tpath,varn,'.197901-201512.nc')
x=read1var(fname,varn,v,t1,t2,s,0);
v.rh1000=x.t1000; v.rh975=x.t975; v.rh950=x.t950; 
v.rh925 =x.t925;  v.rh850=x.t850; v.rh775=x.t775;
v.rh700 =x.t700;  v.rh600=x.t600; v.rh500=x.t500; 
v.rh400 =x.t400;  v.rh300=x.t300; v.rh250=x.t250; 
v.rh200 =x.t200;  v.rh150=x.t150; v.rh100=x.t100; 
v.rh70  =x.t70;   v.rh50 =x.t50;

varn='z'; fname=strcat(tpath,varn,'.197901-201512.nc')
x=read1var(fname,varn,v,t1,t2,s,0);
v.z1000=x.t1000; v.z975=x.t975; v.z950=x.t950; 
v.z925 =x.t925;  v.z850=x.t850; v.z775=x.t775;
v.z700 =x.t700;  v.z600=x.t600; v.z500=x.t500; 
v.z400 =x.t400;  v.z300=x.t300; v.z250=x.t250; 
v.z200 =x.t200;  v.z150=x.t150; v.z100=x.t100; 
v.z70  =x.t70;   v.z50 =x.t50;

varn='u'; fname=strcat(tpath,varn,'.197901-201512.nc')
x=read1var(fname,varn,v,t1,t2,s,0);
v.u1000=x.t1000; v.u975=x.t975; v.u950=x.t950; 
v.u925 =x.t925;  v.u850=x.t850; v.u775=x.t775;
v.u700 =x.t700;  v.u600=x.t600; v.u500=x.t500; 
v.u400 =x.t400;  v.u300=x.t300; v.u250=x.t250; 
v.u200 =x.t200;  v.u150=x.t150; v.u100=x.t100; 
v.u70  =x.t70;   v.u50 =x.t50;  v.u30 =x.t30; 
v.u20  =x.t20;   v.u10 =x.t10;

varn='v'; fname=strcat(tpath,varn,'.197901-201512.nc')
x=read1var(fname,varn,v,t1,t2,s,0);
v.v1000=x.t1000; v.v975=x.t975; v.v950=x.t950; 
v.v925 =x.t925;  v.v850=x.t850; v.v775=x.t775;
v.v700 =x.t700;  v.v600=x.t600; v.v500=x.t500; 
v.v400 =x.t400;  v.v300=x.t300; v.v250=x.t250; 
v.v200 =x.t200;  v.v150=x.t150; v.v100=x.t100; 
v.v70  =x.t70;   v.v50 =x.t50;  v.v30 =x.t30; 
v.v20  =x.t20;   v.v10 =x.t10;

varn='w'; fname=strcat(tpath,varn,'.197901-201512.nc')
x=read1var(fname,varn,v,t1,t2,s,1); a=864.;
v.w1000=chunit(x.t1000,a); v.w975=chunit(x.t975,a); v.w950=chunit(x.t950,a); 
v.w925 =chunit(x.t925,a);  v.w850=chunit(x.t850,a); v.w775=chunit(x.t775,a);
v.w700 =chunit(x.t700,a);  v.w600=chunit(x.t600,a); v.w500=chunit(x.t500,a); 
v.w400 =chunit(x.t400,a);  v.w300=chunit(x.t300,a); v.w250=chunit(x.t250,a); 
v.w200 =chunit(x.t200,a);  v.w150=chunit(x.t150,a); v.w100=chunit(x.t100,a); 
v.w70  =chunit(x.t70,a);   v.w50 =chunit(x.t50,a);

v.h1000.clm=CPD*v.t1000.clm+v.z1000.clm+LV0*v.q1000.clm;
v.h1000.ann=CPD*v.t1000.ann+v.z1000.ann+LV0*v.q1000.ann;
v.h1000.sea=CPD*v.t1000.sea+v.z1000.sea+LV0*v.q1000.sea;
v.h925.clm =CPD*v.t925.clm +v.z925.clm +LV0*v.q925.clm; 
v.h925.ann =CPD*v.t925.ann +v.z925.ann +LV0*v.q925.ann; 
v.h925.sea =CPD*v.t925.sea +v.z925.sea +LV0*v.q925.sea; 
v.h850.clm =CPD*v.t850.clm +v.z850.clm +LV0*v.q850.clm; 
v.h850.ann =CPD*v.t850.ann +v.z850.ann +LV0*v.q850.ann; 
v.h850.sea =CPD*v.t850.sea +v.z850.sea +LV0*v.q850.sea; 
v.h700.clm =CPD*v.t700.clm +v.z700.clm +LV0*v.q700.clm; 
v.h700.ann =CPD*v.t700.ann +v.z700.ann +LV0*v.q700.ann; 
v.h700.sea =CPD*v.t700.sea +v.z700.sea +LV0*v.q700.sea; 
v.h600.clm =CPD*v.t600.clm +v.z600.clm +LV0*v.q600.clm; 
v.h600.ann =CPD*v.t600.ann +v.z600.ann +LV0*v.q600.ann; 
v.h600.sea =CPD*v.t600.sea +v.z600.sea +LV0*v.q600.sea; 
v.h500.clm =CPD*v.t500.clm +v.z500.clm +LV0*v.q500.clm; 
v.h500.ann =CPD*v.t500.ann +v.z500.ann +LV0*v.q500.ann; 
v.h500.sea =CPD*v.t500.sea +v.z500.sea +LV0*v.q500.sea; 
v.h400.clm =CPD*v.t400.clm +v.z400.clm +LV0*v.q400.clm; 
v.h400.ann =CPD*v.t400.ann +v.z400.ann +LV0*v.q400.ann; 
v.h400.sea =CPD*v.t400.sea +v.z400.sea +LV0*v.q400.sea; 
v.h300.clm =CPD*v.t300.clm +v.z300.clm +LV0*v.q300.clm; 
v.h300.ann =CPD*v.t300.ann +v.z300.ann +LV0*v.q300.ann; 
v.h300.sea =CPD*v.t300.sea +v.z300.sea +LV0*v.q300.sea; 
v.h250.clm =CPD*v.t250.clm +v.z250.clm +LV0*v.q250.clm; 
v.h250.ann =CPD*v.t250.ann +v.z250.ann +LV0*v.q250.ann; 
v.h250.sea =CPD*v.t250.sea +v.z250.sea +LV0*v.q250.sea; 
v.h200.clm =CPD*v.t200.clm +v.z200.clm +LV0*v.q200.clm; 
v.h200.ann =CPD*v.t200.ann +v.z200.ann +LV0*v.q200.ann; 
v.h200.sea =CPD*v.t200.sea +v.z200.sea +LV0*v.q200.sea; 
v.h150.clm =CPD*v.t150.clm +v.z150.clm +LV0*v.q150.clm; 
v.h150.ann =CPD*v.t150.ann +v.z150.ann +LV0*v.q150.ann; 
v.h150.sea =CPD*v.t150.sea +v.z150.sea +LV0*v.q150.sea; 
v.h100.clm =CPD*v.t100.clm +v.z100.clm +LV0*v.q100.clm; 
v.h100.ann =CPD*v.t100.ann +v.z100.ann +LV0*v.q100.ann; 
v.h100.sea =CPD*v.t100.sea +v.z100.sea +LV0*v.q100.sea; 

return

mod='c48'; fn=strcat('./atmos.static_',mod,'.nc'); 
latlon=[0 360 -90 90]; o=readgrid_static(fn,latlon);
tpath='/archive/Ming.Zhao/backup/readobs_data/ecmwf-int/monthly/';
t1=265; t2=396; %Jan2001 - Dec2012
t1=265; t2=432; %Jan2001 - Dec2015
v=read_erainterim_tqzuv_new(tpath,latlon,o,t1,t2);
