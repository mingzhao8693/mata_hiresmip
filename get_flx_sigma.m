function [v]=get_flx_sigma(fa, fx_edd, fx_grd, fx_tot)
%fa    =v1.r(2).wmse500.fa_wup;
%fx_edd=v1.r(2).wmse500.fx_edd;
%fx_grd=v1.r(2).wmse500.fx_grd;
%fx_tot=v1.r(2).wmse500.fx_tot;

nt=length(fa(:,1,1,1)); nz=length(fa(1,:,1,1));
ny=length(fa(1,1,:,1)); nx=length(fa(1,1,1,:));

a=fa;     a=shiftdim(a,1); fa=a;
a=fx_edd; a=shiftdim(a,1); fx_edd=a;
a=fx_grd; a=shiftdim(a,1); fx_grd=a;
a=fx_tot; a=shiftdim(a,1); fx_tot=a;

sbin=[0:0.1:1]; nbin=length(sbin)-1; binc=(sbin(1:end-1)+sbin(2:end))/2;
for k=1:nz
  a=squeeze(fa    (k,:,:,:));
  b=squeeze(fx_edd(k,:,:,:));
  c=squeeze(fx_grd(k,:,:,:));
  d=squeeze(fx_tot(k,:,:,:));
  id=(a>0); nn=sum(sum(sum(id)));
  if (nn>0) %coarse grid is labeled as updraft column if a=sigma>0
    a=a(id); b=b(id); c=c(id); d=d(id);
    v.sigma(k)=nn/(nt*nx*ny);
    for i=1:nbin
      idx=(a>sbin(i)) & (a<=sbin(i+1));
      v.p_sigma     (k,i)=sum(idx)/nn;
      v.fx_edd_sigma(k,i)=mean(b(idx));
      v.fx_grd_sigma(k,i)=mean(c(idx));
      v.fx_tot_sigma(k,i)=mean(d(idx));
    end
  else
    v.p_sigma     (k,1:nbin)=0;
    v.fx_edd_sigma(k,1:nbin)=0;
    v.fx_grd_sigma(k,1:nbin)=0;
    v.fx_tot_sigma(k,1:nbin)=0;
  end
end
v.sbin=sbin;
v.nbin=nbin;
v.binc=binc;
return
