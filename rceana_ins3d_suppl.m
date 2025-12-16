function v=rceana_ins3d_suppl(tpath,expn,res,ts,te,zs,ze,w_th,qc_th)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; w_th=0.1; qc_th=0.00001;
expn='RCE_H0128x008_L79_R48_300'; res='org_z'; ts=240; te=365; zs=1;ze=64;
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

varn='w'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
f=netcdf(fname,'nowrite');  v.fname=fname; disp('FILE OPENED...');
varn='time';    v.t  =f{varn}(ts:te); v.nt=length(v.t);
varn='grid_xt'; v.x  =f{varn}(:); v.x=v.x*v.dx; v.nx=length(v.x);
varn='grid_yt'; v.y  =f{varn}(:); v.y=v.y*v.dy; v.ny=length(v.y); v.ngrid=v.nx*v.ny;
varn='zfull';   v.zf0=f{varn}(zs:ze); 
varn='zhalf';   v.zh0=f{varn}(zs:ze+1); 
varn='w'; a=f{varn}(ts:te,zs:ze,:,:); close(f); wa=a;
v.dz0=diff(v.zh0); 

varn='liq_wat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); ql=a;
end
varn='ice_wat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); qi=a;
end
qc=ql+qi; clear ql qi;

wbin_up=[0.1 0.25:0.25:2 3:2:25]; wbin_dn=[-25:2:-3 -2:0.25:-0.25 -0.1];
wbin=[wbin_dn wbin_up]; 
qcbin=[qc_th 0.0001:0.0001:0.003 0.004:0.001:0.01];

id.up =(wa>0); id.cup=(wa>0 & qc>qc_th); id.cld=(qc> qc_th);
id.dn =(wa<0); id.cdn=(wa<0 & qc>qc_th); id.clr=(qc<=qc_th);
v.wa=csampone(wa,v,'3d',id,1);
v.qc=csampone(qc,v,'3d',id,1);
a=qc; a(id.cld)=1; a(~id.cld)=0; v.qa=csampone(a,v,'3d',id,1);

%setup pf, zf, and dz in case they are needed
varn='rho'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f); rho=a;
  %v.rho=csampone(a,v,'3d',id,1);
end
dz=a; zf=a;
for k=1:v.nz
  dz(:,k,:,:)=v.dz0(k);
  zf(:,k,:,:)=v.zf0(k);
end
dp=rho.*dz*G; v.zf0=v.zf0/1000;

varn='ps'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc');disp(fname);
f=netcdf(fname,'nowrite'); ps=f{varn}(ts:te,:,:); close(f); v.ps=getavar(ps,v,'2d');
ph=wa; ph(:,1,:,:)=ps(:,:,:);
for k=2:v.nz+1
  ph(:,k,:,:)  =ph(:,k-1,:,:)-dp(:,k-1,:,:);
  pf(:,k-1,:,:)=(ph(:,k,:,:)-ph(:,k-1,:,:))./(log(ph(:,k,:,:))-log(ph(:,k-1,:,:)));
end
clear ph; v.pf=csampone(pf,v,'3d',id,1);

varn='temp';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.ta=csampone(a,v,'3d',id,1);
end
%a=CPD*a+G*zf; clear zf;
PI=(100000./pf).^RDOCP; a=a.*PI; v.thv=csampone(a,v,'3d',id,1);
a=diff_vert(a,1,2); dthvdz=a./dz; 
v.dthvdz=csampone(dthvdz,v,'3d',id,1);

%v.ddsedz     =csampone(ddsedz,v,'3d',id,1);
%v.ddsedz_vadv=csampone(-wa.*ddsedz,v,'3d',id,1);
v.tdt_vadv=csampone(-wa.*dthvdz./PI,v,'3d',id,1);

varn='tdt_lw';  fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  tdt_lw = a;
end
varn='tdt_sw'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  tdt_sw = a;
end
v.tdt_lw =csampone(tdt_lw,v,'3d',id,1);
v.tdt_sw =csampone(tdt_sw,v,'3d',id,1);
v.tdt_rad=csampone(tdt_lw+tdt_sw,v,'3d',id,1); clear tdt_lw tdt_sw;

varn='tdt_lin'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.tdt_lin =csampone(a,v,'3d',id,1);
end
%varn='tdt_ls'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
%if (exist(fname,'file') == 2)
%  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
%  v.tdt_ls =csampone(a,v,'3d',id,1);
%end

varn='tdt_dyn'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.tdt_dyn =csampone(a,v,'3d',id,1);
end

varn='tdt_phys'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.tdt_phy =csampone(a,v,'3d',id,1);
end

varn='omega';   fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,zs:ze,:,:); close(f);
  v.om = csampone(a,v,'3d',id,1);
  dom=diff_vert(a,1,2); domdp =-dom./dp; 
  v.domdp = csampone(domdp,v,'3d',id,1);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat(opath,expn,'_rceana_ins3d_suppl',num2str(ts),'_',num2str(te),'.mat');
save(fn,'v','-v7.3'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
return
