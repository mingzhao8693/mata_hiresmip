[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; 
expn='RCE_H0512x032_L79_R12_300'; res='R48'; ts=60; te=360; zs=1;
dir=strcat('/atmos_data/',res,'/');
varn='bkpk';  fname=strcat(tpath,expn,dir,varn,'.nc')
f=netcdf(fname,'nowrite'); 
v.bk=f{'bk'}(:); v.pk=f{'pk'}(:); v.ph0=f{'phalf'}(:); close(f);
v.nz_ph=length(v.ph0); v.nz_pf=v.nz_ph-1;

varn='ps'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
f=netcdf(fname,'nowrite'); v.fname=fname; 'FILE OPENED...'
varn='time';    v.t =f{varn}(:); v.nt=length(v.t);
varn='grid_xt'; v.x =f{varn}(:); v.nx=length(v.x);
varn='grid_yt'; v.y =f{varn}(:); v.ny=length(v.y); v.ngrid=v.nx*v.ny;
v.ts=ts; v.te=te; v.t=v.t(ts:te); v.nt=length(v.t);

pctile=[50 75 90 95 99 99.9 99.99]; v.pctile=pctile;
pbin=[-1 1 10:10:100 200:100:1000 10000]; %pbin=[1:100:1000];
pbin=[1:10:50000]; %pbin=[1:100:1000];

res='R48'; dir=strcat('/atmos_data/',res,'/');
varn='precip'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
fname='/home/Ming.Zhao/nc2nc_fortran/tmp.nc'
f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
v.pcp_r48 = getavar(a*86400,v,'2d',pbin,pctile);pcp_r48=a;

res='org'; dir=strcat('/atmos_data/',res,'/');
varn='ps'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
f=netcdf(fname,'nowrite'); vo.fname=fname; 'FILE OPENED...'
varn='time';    vo.t =f{varn}(:); vo.nt=length(vo.t);
varn='grid_xt'; vo.x =f{varn}(:); vo.nx=length(vo.x);
varn='grid_yt'; vo.y =f{varn}(:); vo.ny=length(vo.y); vo.ngrid=vo.nx*vo.ny;
vo.ts=ts; vo.te=te; vo.t=vo.t(ts:te); vo.nt=length(vo.t);
varn='precip'; fname=strcat(tpath,expn,dir,varn,'_atmos_instant.nc')
f=netcdf(fname,'nowrite'); a=f{varn}(ts:te,:,:); close(f); 
vo.pcp_org = getavar(a*86400,vo,'2d',pbin,pctile); pcp_org=a;
for t=1:vo.nt
  disp(t);
  for i=1:8
    for j=1:128
      m=(i-1)*4+1;
      n=(j-1)*4+1;
      b(t,i,j)=(a(t,m,n+0)+a(t,m+1,n+0)+a(t,m+2,n+0)+a(t,m+3,n+0)+...
	        a(t,m,n+1)+a(t,m+1,n+1)+a(t,m+2,n+1)+a(t,m+3,n+1)+...;
                a(t,m,n+2)+a(t,m+1,n+2)+a(t,m+2,n+2)+a(t,m+3,n+2)+...;
                a(t,m,n+3)+a(t,m+1,n+3)+a(t,m+2,n+3)+a(t,m+3,n+3))/16;
%      b(t,i,j)= a(t,m+1,n+1);
    end
  end
end
pcp_R48=b;
figure; plot(squeeze(pcp_R48(end-5,1,:))); hold on; plot(squeeze(pcp_r48(end-5,1,:)),'r');

pcp_org=reshape(pcp_org,vo.nt*vo.ngrid,1)*86400;
pcp_r48=reshape(pcp_r48,v.nt *v.ngrid, 1)*86400;
pcp_R48=reshape(pcp_R48,v.nt *v.ngrid, 1)*86400;

a=pcp_org; a_org=sort(a(a>10));
a=pcp_r48; a_r48=sort(a(a>10));
a=pcp_R48; a_R48=sort(a(a>10)); 
[a_org(end-10:end) a_r48(end-10:end) a_R48(end-10:end)]

pdf_org=histc(a_org,pbin); pdf_org=pdf_org(1:end-1)'; pdf_org=pdf_org/sum(pdf_org);
pdf_r48=histc(a_r48,pbin); pdf_r48=pdf_r48(1:end-1)'; pdf_r48=pdf_r48/sum(pdf_r48);
pdf_R48=histc(a_R48,pbin); pdf_R48=pdf_R48(1:end-1)'; pdf_R48=pdf_R48/sum(pdf_R48);
binc=(pbin(1:end-1)+pbin(2:end))*0.5;

figure; 
loglog(binc,pdf_org,'r'); hold on; 
loglog(binc,pdf_r48,'g'); loglog(binc,pdf_R48,'b');

figure; 
semilogx(binc,cumsum(pdf_org),'r'); hold on; 
semilogx(binc,cumsum(pdf_r48)); semilogx(binc,cumsum(pdf_R48));

a=pcp_org_3d;

c=pcp_r48_last;

figure; i=7; x=[1:128]; x=x*4; xo=[1:512];
plot(xo,a(i,:),'r'); hold on;
plot(xx,b(i,:),'g'); 
plot(xx,c(i,:),'b');

figure; pcolor(a); colorbar; caxis([0 0.001]); shading flat;
figure; pcolor(b); colorbar; caxis([0 0.001]); shading flat; 
figure; pcolor(c); colorbar; caxis([0 0.001]); shading flat;
