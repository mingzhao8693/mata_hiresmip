function v=rceana_circ(tpath,expn,res,ts,te,zs,ze,w_th,qc_th)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; w_th=0.5; qc_th=0.00001;
%expn='RCE_H2048x128_L79_R01_300'; res='org_z'; ts=240; te=365; zs=1;ze=64;
%expn='RCE_H0128x008_L79_R48_300';  res='org_z'; ts=240; te=365; zs=1;ze=64;
%expn='RCE_H2048x128_L79_R03_300'; res='org_z'; ts=330; te=365; zs=1;ze=64;

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

% $$$ varn='w'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
% $$$ if (exist(fname,'file') == 2)
% $$$   f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,25,:,:); wa=squeeze(a);
% $$$   close(f);
% $$$ end
% $$$ varn='liq_wat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
% $$$ if (exist(fname,'file') == 2)
% $$$   f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,25,:,:); ql=squeeze(a);
% $$$   close(f);
% $$$ end
% $$$ varn='ice_wat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
% $$$ if (exist(fname,'file') == 2)
% $$$   f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,25,:,:); qi=squeeze(a);
% $$$   close(f);
% $$$ end
% $$$ qc=ql+qi;
% $$$ id=(wa> 0.5); a=pcp; a(~id)=NaN; v.pcp1=getavar_smart(a,v,'2d',pbin,pctile);
% $$$ id=(wa> 0.1); a=pcp; a(~id)=NaN; v.pcp2=getavar_smart(a,v,'2d',pbin,pctile);
% $$$ id=(wa<-0.1); a=pcp; a(~id)=NaN; v.pcp3=getavar_smart(a,v,'2d',pbin,pctile);
% $$$ id=(wa<-0.5); a=pcp; a(~id)=NaN; v.pcp4=getavar_smart(a,v,'2d',pbin,pctile);
% $$$ id=(wa>0.5 | wa<-0.5); a=pcp; a(~id)=NaN; v.pcp5=getavar_smart(a,v,'2d',pbin,pctile);
% $$$ id=(wa>0.1 | wa<-0.1); a=pcp; a(~id)=NaN; v.pcp6=getavar_smart(a,v,'2d',pbin,pctile);
% $$$ id=(wa>0.1 | qc>0);    a=pcp; a(~id)=NaN; v.pcp7=getavar_smart(a,v,'2d',pbin,pctile);
% $$$ id=(qc>0);             a=pcp; a(~id)=NaN; v.pcp8=getavar_smart(a,v,'2d',pbin,pctile);

varn='liq_wat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:,:);
  v.ql=getavar(a,v,'3d'); b=v.ql.avg; k_qlmax=find(b==max(b));disp(k_qlmax);
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k_qlmax,:,:); ql=squeeze(a);
  close(f);
end

varn='ice_wat'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:,:);
  v.qi=getavar(a,v,'3d'); b=v.qi.avg; k_qimax=find(b==max(b));disp(k_qimax);
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k_qimax,:,:); qi=squeeze(a);
  close(f);
end

varn='rh'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k_qlmax,:,:); rh1=squeeze(a);
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k_qimax,:,:); rh2=squeeze(a);
  close(f);
end

varn='w'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
if (exist(fname,'file') == 2)
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k_qlmax,:,:); wa1=squeeze(a);
  f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,k_qimax,:,:); wa2=squeeze(a);
  close(f);
end

a=ql; id_cld=(a>qc_th); v.cld.k_qlmax=k_qlmax;
a(~id_cld)=NaN; v.cld.ql_stat=getavar_smart(a,v,'2d',qcbin,pctile);
rhbin=[5:5:75 80:1:120 125:5:150]; 
wabin=[-1:0.1:-0.6 -0.5:0.05:0.5 0.6:0.1:1];
a=rh1; a(~id_cld)=NaN; v.cld.rh1_stat=getavar_smart(a,v,'2d',rhbin,pctile);
a=rh1; a( id_cld)=NaN; v.clr.rh1_stat=getavar_smart(a,v,'2d',rhbin,pctile);
a=rh1;                 v.all.rh1_stat=getavar_smart(a,v,'2d',rhbin,pctile);
a=wa1; a(~id_cld)=NaN; v.cld.wa1_stat=getavar_smart(a,v,'2d',wabin,pctile);
a=wa1; a( id_cld)=NaN; v.clr.wa1_stat=getavar_smart(a,v,'2d',wabin,pctile);
a=wa1;                 v.all.wa1_stat=getavar_smart(a,v,'2d',wabin,pctile);

a=qi; id_cld=(a>qc_th); v.cld.k_qimax=k_qimax;
a(~id_cld)=NaN; v.cld.qi_stat=getavar_smart(a,v,'2d',qcbin,pctile);
a=rh2; a(~id_cld)=NaN; v.cld.rh2_stat=getavar_smart(a,v,'2d',rhbin,pctile);
a=rh2; a( id_cld)=NaN; v.clr.rh2_stat=getavar_smart(a,v,'2d',rhbin,pctile);
a=rh2;                 v.all.rh2_stat=getavar_smart(a,v,'2d',rhbin,pctile);
a=wa2; a(~id_cld)=NaN; v.cld.wa2_stat=getavar_smart(a,v,'2d',wabin,pctile);
a=wa2; a( id_cld)=NaN; v.clr.wa2_stat=getavar_smart(a,v,'2d',wabin,pctile);
a=wa2;                 v.all.wa2_stat=getavar_smart(a,v,'2d',wabin,pctile);

%k=43(z=5.09km;p=374hPa); k=36(z=5.81km;p=503hPa);
%k=33(z=4.96km;p=561hPa); k=25(z=3.01km;p=711hPa)
%k=1; x=getalev(tpath,expn,dir,ts,te,k);%test match pcp
k=20; x2km=getalev(tpath,expn,dir,ts,te,k); disp('get x2km...');
k=25; x3km=getalev(tpath,expn,dir,ts,te,k); disp('get x3km...');
k=36; x500=getalev(tpath,expn,dir,ts,te,k); disp('get x500...');
v.zf0=x2km.zf0;



x=x3km; v.w3km_org=onelev(v,x.wa,x.qc,wbin_up,wbin_dn,wbin,pctile,qc_th,pcp,pbin);
x=x500; v.w500_org=onelev(v,x.wa,x.qc,wbin_up,wbin_dn,wbin,pctile,qc_th,pcp,pbin);

%id.up =(x.wa>0); id.cup=(x.wa>0 & x.qc>qc_th); id.cld=(x.qc> qc_th);
%id.dn =(x.wa<0); id.cdn=(x.wa<0 & x.qc>qc_th); id.clr=(x.qc<=qc_th);
%a=x.mse; v.mse500=csampone(a, v,'2d',id,1);

dx=v.dx; dy=v.dy;
if     (dx==1.5); nn=64;
elseif (dx==3);   nn=32;
elseif (dx==6);   nn=16;
elseif (dx==12);  nn=8;
elseif (dx==24);  nn=4;
elseif (dx==48);  nn=2
end

xi=nn; yi=nn; wbin=[-150:5:150]; 
x=x500; qc=x.qc; wx=x.wa*0.65*G*864; %m/s->hPa/day
ti=1; v.w500_r96_ins  =onelev_txyavg(v,wx,qc,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th,pcp,pbin);
ti=5; v.w500_r96_5day =onelev_txyavg(v,wx,qc,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th,pcp,pbin);
ti=10;v.w500_r96_10day=onelev_txyavg(v,wx,qc,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th,pcp,pbin);
ti=30;v.w500_r96_30day=onelev_txyavg(v,wx,qc,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th,pcp,pbin);

dx=v.dx; dy=v.dy;
if     (dx==1.5); nn=32;
elseif (dx==3);   nn=16;
elseif (dx==6);   nn=8;
elseif (dx==12);  nn=4;
elseif (dx==24);  nn=2;
elseif (dx==48);  nn=1
end

xi=nn; yi=nn; wbin=[-150:5:150]; 
x=x500; qc=x.qc; wx=x.wa*0.65*G*864; %m/s->hPa/day
ti=1; v.w500_r48_ins  =onelev_txyavg(v,wx,qc,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th,pcp,pbin);
ti=5; v.w500_r48_5day =onelev_txyavg(v,wx,qc,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th,pcp,pbin);
ti=10;v.w500_r48_10day=onelev_txyavg(v,wx,qc,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th,pcp,pbin);
ti=30;v.w500_r48_30day=onelev_txyavg(v,wx,qc,ti,xi,yi,wbin,wbin,wbin,pctile,qc_th,pcp,pbin);

%2D subdomain or coarsen grid/resolution analysis
dx=v.dx; dy=v.dy; 
if     (dx==1.5); nn=8;
elseif (dx==3);   nn=7;
elseif (dx==6);   nn=6;
elseif (dx==12);  nn=5;
elseif (dx==24);  nn=4;
elseif (dx==48);  nn=3
end
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
  x=x500; v.qc=x.qc; disp('start wmse500 flx...');
  v.r(i).wqt500  =getsubgrid_2d(x.wa,x.rho,x.qt*86400,x.pfx,v,xi,yi,'flx',0);
  %v.r(i).wmse500=getsubgrid_2d(x.wa,x.rho,x.mse,     x.pfx,v,xi,yi,'rmwr',0);
  %v.r(i).whli500=getsubgrid_2d(x.wa,x.rho,x.hli,     x.pfx,v,xi,yi,'rmwr',0);

  x=x3km; v.qc=x.qc; disp('start wmse3km flx...');
  v.r(i).wqt3km  =getsubgrid_2d(x.wa,x.rho,x.qt*86400,x.pfx,v,xi,yi,'flx',0);
  v.r(i).wqt3km_a=getsubgrid_2d(x.wa,x.rho,x.qt*86400,x.pfx,v,xi,yi,'flx',1);
  v.r(i).wmse3km =getsubgrid_2d(x.wa,x.rho,x.mse,     pcp,  v,xi,yi,'rmwr',0);
  %v.r(i).whli3km=getsubgrid_2d(x.wa,x.rho,x.hli,     x.pfx,v,xi,yi,'rmwr',0);

  x=x2km; v.qc=x.qc; disp('start wmse3km flx...');
  v.r(i).wqt2km  =getsubgrid_2d(x.wa,x.rho,x.qt*86400,x.pfx,v,xi,yi,'flx',0);
  %v.r(i).wmse2km=getsubgrid_2d(x.wa,x.rho,x.mse,     x.pfx,v,xi,yi,'rmwr',0);
  %v.r(i).whli2km=getsubgrid_2d(x.wa,x.rho,x.hli,     x.pfx,v,xi,yi,'rmwr',0);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v.qc=0;
fn=strcat(opath,expn,'_rceana_circ_',num2str(ts),'_',num2str(te),'.mat');
save(fn,'v','-v7.3'); 
return
