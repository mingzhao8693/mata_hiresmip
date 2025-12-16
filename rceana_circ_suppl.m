function v=rceana_circ_suppl(tpath,expn,res,ts,te,zs,ze,w_th,qc_th)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; w_th=0.1; qc_th=0.00001;
expn='RCE_H0128x008_L79_R48_conv_300';  res='org_z'; ts=240; te=365; zs=1;ze=64;

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

varn='precip'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
f=netcdf(fname,'nowrite');  v.fname=fname; disp('FILE OPENED...');
varn='time';    v.t  =f{varn}(ts:te); v.nt=length(v.t);
varn='grid_xt'; v.x  =f{varn}(:); v.x=v.x*v.dx; v.nx=length(v.x);
varn='grid_yt'; v.y  =f{varn}(:); v.y=v.y*v.dy; v.ny=length(v.y); v.ngrid=v.nx*v.ny;
varn='precip'; pcp=f{varn}(ts:te,:,:)*86400; close(f);
v.pcp_tyavg=squeeze(mean(mean(pcp,2),1));

wbin_up=[0.1 0.25:0.25:2 3:2:25]; wbin_dn=[-25:2:-3 -2:0.25:-0.25 -0.1];
wbin=[wbin_dn wbin_up]; 
qcbin=[qc_th 0.0001:0.0001:0.003 0.004:0.001:0.01];
pbin=[-1 1 10:10:100 200:100:1000 10000]; %pbin=[1:100:1000];

varn='delz'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
f=netcdf(fname,'nowrite'); dz=f{varn}(ts:te,:,:,:); close(f);
nz=length(dz(1,:,1,1));
zh=dz; zh(:,nz+1,:,:)=0;
for k = nz : -1: 1 
  zh(:,k,:,:)= zh(:,k+1,:,:)+dz(:,k,:,:);
  zf(:,k,:,:)=(zh(:,k+1,:,:)+zh(:,k,:,:))*0.5;
end
varn='qtflx_uwc'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:,:); close(f); 
end

zlev=3000;
for t=1:v.nt
  for j=1:v.ny
    for i=1:v.nx
      for k=nz:-1:2
	if (zh(t,k+1,j,i)<=zlev) & (zh(t,k,j,i)>zlev)
	  dz1=zlev       -zh(t,k+1,j,i);
	  dz2=zh(t,k,j,i)-zlev;
	  dz =zh(t,k,j,i)-zh(t,k+1,j,i);
	  qtflx(t,j,i)=(a(t,k+1,j,i)*dz2+a(t,k,j,i)*dz1)/dz;disp(qtflx(t,j,i));
	  break
	end
      end
    end
  end
end

%k=43(z=5.09km;p=374hPa); k=36(z=5.81km;p=503hPa);
%k=33(z=4.96km;p=561hPa); k=25(z=3.01km;p=711hPa)
k=25; x3km=getalev(tpath,expn,dir,ts,te,k);
k=36; x500=getalev(tpath,expn,dir,ts,te,k);

%2D subdomain or coarsen grid/resolution analysis
dx=v.dx; dy=v.dy; nn=3;
for i=nn:-1:1
  xi=2^(i-1); yi=2^(i-1); 
  disp(strcat('(xi,yi)==========',num2str(xi),',',num2str(yi)));
  v.r(i).dx=dx;
  v.r(i).dy=dy;
  v.r(i).xi=xi;
  v.r(i).yi=yi;
  v.r(i).nx=v.nx/xi;
  v.r(i).ny=v.ny/yi;
  v.r(i).ngrid=v.ngrid/(xi*yi);
  x=x500; disp('start wmse500 flx...');
  %v.r(i).wmse500=getsubgrid_2d_new(x.wa,x.rho,x.mse,v,xi,yi,w_th,'flx');
  %v.r(i).whli500=getsubgrid_2d_new(x.wa,x.rho,x.hli,v,xi,yi,w_th,'rmwr');
  v.r(i).wqt500 =getsubgrid_2d_new(x.wa,x.rho,x.qt,qtflx,v,xi,yi,w_th,'rmwr');
  x=x3km; disp('start wmse3km flx...');
  %v.r(i).wmse3km=getsubgrid_2d_new(x.wa,x.rho,x.mse,v,xi,yi,w_th,'flx');
  %v.r(i).whli3km=getsubgrid_2d_new(x.wa,x.rho,x.hli,v,xi,yi,w_th,'flx');
  v.r(i).wqt3km =getsubgrid_2d_new(x.wa,x.rho,x.qt,qtflx,v,xi,yi,w_th,'flx');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fn=strcat(opath,expn,'_rceana_circ_',num2str(ts),'_',num2str(te),'.mat');
save(fn,'v','-v7.3'); 
return
