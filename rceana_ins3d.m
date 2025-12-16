function v=rceana_ins3d(tpath,expn,res,ts,te,zs,ze,w_th,qc_th)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; w_th=0.1; qc_th=0.00001;
%expn='RCE_H0128x008_L79_R48_conv_300'; res='org_z'; ts=360; te=365; zs=1;ze=64;
%expn='RCE_H2048x128_L79_R03_300'; res='org_z'; ts=360; te=365; zs=1;ze=64;
%expn='RCE_H2048x128_L79_R01_300'; res='org_z'; ts=200; te=201; zs=1;ze=64;

start_time=clock; opath='/work/miz/mat_rce/';
dir=strcat('/atmos_data/',res,'/');
fname='./bkpk.nc'; f=netcdf(fname,'nowrite');
v.bk=f{'bk'}(:); v.pk=f{'pk'}(:); v.ph0=f{'phalf'}(:); close(f);
v.nz_ph=length(v.ph0); v.nz_pf=v.nz_ph-1;
a=find(expn(:)=='R'); i=a(end); v.dx=str2num(expn(i+1:i+2)); v.dy=v.dx;
if (v.dx==1); v.dx=1.5; v.dy=1.5; end;
v.ts=ts; v.te=te; v.zs=zs; v.ze=ze; v.nt=te-ts+1; v.nz=ze-zs+1;
pctile=[50 75 90 95 99 99.9 99.99]; v.pctile=pctile; 
v.expn=expn; v.w_th=w_th; v.qc_th=qc_th;

varn='rho'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
f=netcdf(fname,'nowrite');  v.fname=fname; disp('FILE OPENED...');
varn='time';    v.t  =f{varn}(ts:te); v.nt=length(v.t);
varn='grid_xt'; v.x  =f{varn}(:); v.x=v.x*v.dx; v.nx=length(v.x);
varn='grid_yt'; v.y  =f{varn}(:); v.y=v.y*v.dy; v.ny=length(v.y); v.ngrid=v.nx*v.ny;
varn='zfull';   v.zf0=f{varn}(zs:ze); 
varn='zhalf';   v.zh0=f{varn}(zs:ze+1); 
varn='rho'; a=f{varn}(ts:te,zs:ze,:,:); close(f); rho=a; v.rho=getavar(rho,v,'3d');
v.dz0=diff(v.zh0); dz=a; zf=a;
for k=1:v.nz
  dz(:,k,:,:)=v.dz0(k);
  zf(:,k,:,:)=v.zf0(k);
end
dp=rho.*dz*G; v.zf0=v.zf0/1000; v.zh0=v.zh0/1000;

varn='ps'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc');disp(fname);
f=netcdf(fname,'nowrite'); ps=f{varn}(ts:te,:,:); close(f); v.ps=getavar(ps,v,'2d');
ph_hy=dz; ph_hy(:,1,:,:)=ps(:,:,:);
for k=2:v.nz+1
  ph_hy(:,k,:,:)  =ph_hy(:,k-1,:,:)-dp(:,k-1,:,:);
  pf_hy(:,k-1,:,:)=(ph_hy(:,k,:,:)-ph_hy(:,k-1,:,:))./(log(ph_hy(:,k,:,:))-log(ph_hy(:,k-1,:,:)));
end
v.pf_hy=getavar(pf_hy,v,'3d'); disp('pf_hy...'); v.pf0=v.pf_hy.avg;
v.ph_hy=getavar(ph_hy,v,'3d'); disp('ph_hy...'); v.ph0=v.ph_hy.avg;
clear ph_hy ps

varn='w';      fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); wa=a;
end
varn='liq_wat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.ql = getavar(a,v,'3d'); ql=a;
end
varn='ice_wat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qi = getavar(a,v,'3d'); qi=a; 
end
qc=ql+qi; 

wbin_up=[0.1 0.25:0.25:2 3:2:25]; wbin_dn=[-25:2:-3 -2:0.25:-0.25 -0.1];
wbin=[wbin_dn wbin_up]; 
qcbin=[qc_th 0.0001:0.0001:0.003 0.004:0.001:0.01];

id.up =(wa>0); id.cup=(wa>0 & qc>qc_th); id.cld=(qc> qc_th);
id.dn =(wa<0); id.cdn=(wa<0 & qc>qc_th); id.clr=(qc<=qc_th);

v.wa=csampone(wa,v,'3d',id,1);
v.ql=csampone(ql,v,'3d',id,1); clear ql;
v.qi=csampone(qi,v,'3d',id,1);
v.qc=csampone(qc,v,'3d',id,1);

varn='sphum';  fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qv = csampone(a,v,'3d',id,1); qv=a;
end
varn='rainwat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qr = csampone(a,v,'3d',id,1); qr=a;
end
varn='snowwat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qs = csampone(a,v,'3d',id,1); qs=a;
end
varn='graupel'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.qg = csampone(a,v,'3d',id,1); qg=a;
end
a=qr+qs+qg; v.qp=csampone(a,v,'3d',id,1); qp=a; clear qr qs qg
a=qv+qc+qp; v.qt=csampone(a,v,'3d',id,1); qt=a; clear qp;

varn='rh';     fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.rh = csampone(a,v,'3d',id,1);
end

varn='temp';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.ta = csampone(a,v,'3d',id,1); ta=a;
end
a=CPD*ta+G*zf;       v.dse=csampone(a,v,'3d',id,1); dse=a; clear zf;
a=dse+LV0*qv-HLF*qi; v.mse=csampone(a,v,'3d',id,1); mse=a; disp('mse...');
a=dse-LV0*qc-HLF*qi; v.hli=csampone(a,v,'3d',id,1); hli=a; clear dse qi;
rt=qt./(1.-qt); rv=qv./(1.-qv); rc=qc./(1.-qc); clear qv;

tv = ta.*(1+rv/EPS)./(1+rv+rc);    clear rc rv rt;
thv= tv.*((100000./pf_hy).^RDOCP); clear pf_hy;
v.tv =csampone(tv, v,'3d',id,1); display('tv...');
v.thv=csampone(thv,v,'3d',id,1); display('thv...');

a=tv;  a=get_anom(a); v.tvp =csampone(a,v,'3d',id,1);clear tv; display('tvp...');
a=thv; a=get_anom(a); v.thvp=csampone(a,v,'3d',id,1);clear thv;display('thvp...');
a=rho; a=get_anom(a); buo=-a./rho*G; %buoyancy
v.buo=csampone(buo,v,'3d',id,1); display('buo...');

a=wa.*rho; v.wrho=csampone(a,v,'3d',id,1);display('wrho...');
a=wa.*buo; v.wbuo=csampone(a,v,'3d',id,1);clear buo;display('wbuo...');
a=mse; a=get_anom(a); a=wa.*rho.*a; v.wmse=csampone(a,v,'3d',id,1);
a=hli; a=get_anom(a); a=wa.*rho.*a; v.whli=csampone(a,v,'3d',id,1);
a=qt;  a=get_anom(a); a=wa.*rho.*a; v.wqt =csampone(a,v,'3d',id,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(opath,expn,'_rceana_ins3d_',num2str(ts),'_',num2str(te),'.mat');
save(fn,'v','-v7.3'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
return
