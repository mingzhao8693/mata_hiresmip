function [v]=get_fx_sigma(wphi) %wphi=v2.r(2).wmse500;

fa    =wphi.fa_wup;
fx_edd=wphi.fx_edd;
fx_grd=wphi.fx_grd;
fx_tot=wphi.fx_tot;
wbar  =wphi.wbar;
vbar  =wphi.vxbar; vbar=vbar-mean(mean(mean(vbar)));
w_cup =wphi.w_cup;
w_env =wphi.w_env;
v_cup =wphi.v_cup;
v_env =wphi.v_env;
del_w =w_cup-wbar;
del_v =v_cup-vbar;
dwdv  =del_w.*del_v;

%below is because I didn't save the variable due to too much storage
if (wphi.w_cup==0) 
  w_cup=wbar;
  w_env=wbar;
  v_cup=vbar;
  v_env=vbar;
end
%above is because I didn't save the variable due to too much storage

nt=length(fa(:,1,1));
ny=length(fa(1,:,1)); 
nx=length(fa(1,1,:));
sbin=[0:0.1:1]; nbin=length(sbin)-1; binc=(sbin(1:end-1)+sbin(2:end))/2;

%fractional area of updraft in each coarse-grid
%fa=sigma; coarse grid is labeled as updrafts containing column if fa>0
id=(fa>0); nn=sum(sum(sum(id)));
if (nn>0)
  aa =fa    (id);
  x1 =fx_edd(id);
  x2 =fx_grd(id);
  x3 =fx_tot(id);
  x4 =wbar  (id);
  x5 =w_cup (id);
  x6 =w_env (id);
  x7 =vbar  (id);
  x8 =v_cup (id);
  x9 =v_env (id);
  x10=dwdv  (id);
  x11=x1./((1-aa).^2); %equilbrium eddy flux
  x12=del_w (id);
  x13=del_v (id);
  %fractional area of updraft containing column over entire domain
  v.FA=nn/(nt*nx*ny); 
  v.fa=mean(aa);
  for i=1:nbin
    idx=(aa>sbin(i)) & (aa<=sbin(i+1));
    v.pdf_sigma (i)=sum(idx)/nn;
    v.sigma     (i)=mean(aa(idx));
    v.fx_edd_avg(i)=mean(x1(idx));
    v.fx_grd_avg(i)=mean(x2(idx));
    v.fx_tot_avg(i)=mean(x3(idx));
    v.fx_edd_std(i)=std (x1(idx));
    v.fx_grd_std(i)=std (x2(idx));
    v.fx_tot_std(i)=std (x3(idx));
    
    v.wbar_avg  (i)=mean(x4(idx));
    v.wcup_avg  (i)=mean(x5(idx));
    v.wenv_avg  (i)=mean(x6(idx));
    v.wbar_std  (i)=std (x4(idx));
    v.wcup_std  (i)=std (x5(idx));
    v.wenv_std  (i)=std (x6(idx));

    v.vbar_avg  (i)=mean(x7(idx));
    v.vcup_avg  (i)=mean(x8(idx));
    v.venv_avg  (i)=mean(x9(idx));
    v.vbar_std  (i)=std (x7(idx));
    v.vcup_std  (i)=std (x8(idx));
    v.venv_std  (i)=std (x9(idx));
    
    v.dwdv_avg  (i)=mean(x10(idx));
    v.fx_edd_equ(i)=mean(x11(idx));
    v.del_w_avg (i)=mean(x12(idx));
    v.del_v_avg (i)=mean(x13(idx));
  end
else
  v.pdf_sigma (1:nbin)=0;
  v.sigma     (1:nbin)=0;
  v.fx_edd_avg(1:nbin)=0;
  v.fx_grd_avg(1:nbin)=0;
  v.fx_tot_avg(1:nbin)=0;
  v.fx_edd_std(1:nbin)=0;
  v.fx_grd_std(1:nbin)=0;
  v.fx_tot_std(1:nbin)=0;
  v.wbar_avg  (1:nbin)=0;
  v.wbar_std  (1:nbin)=0;
end
v.sbin=sbin;
v.nbin=nbin;
v.binc=binc;

return
