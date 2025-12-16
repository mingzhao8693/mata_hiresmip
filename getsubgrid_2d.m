function [p]=getsubgrid_2d(wa,rho,varx,vary,v,xi,yi,opt,conv_choice)
%var=w500; xi=16; yi=16;
t1=1; t2=v.nt; nt=v.nt; disp(strcat('In getsubgrid_2d...',v.expn));
w_th=v.w_th; qc_th=v.qc_th; qc=v.qc;
nx_new=v.nx/xi; ny_new=v.ny/yi; ng_new=nx_new*ny_new;
ng_sub=xi*yi; 
if ~strcmp(opt,'non')
  varp=get_anom(varx);
  for j=1:ny_new
    disp(strcat('j=',num2str(j)));
    for i=1:nx_new
      is=xi*(i-1)+1; ie=is+xi-1;
      js=yi*(j-1)+1; je=js+yi-1;
      wa_s  =squeeze(wa  (:,js:je,is:ie));
      qc_s  =squeeze(qc  (:,js:je,is:ie));
      rho_s =squeeze(rho (:,js:je,is:ie));
      varp_s=squeeze(varp(:,js:je,is:ie));
      varx_s=squeeze(varx(:,js:je,is:ie));
      vary_s=squeeze(vary(:,js:je,is:ie));
      wa_s  =reshape(wa_s,  nt,ng_sub);%subgrid vertical velocity
      qc_s  =reshape(qc_s,  nt,ng_sub);%subgrid vertical velocity
      rho_s =reshape(rho_s, nt,ng_sub);%subgrid density
      mf_s  =rho_s.*wa_s;              %subgrid mass flux
      varp_s=reshape(varp_s,nt,ng_sub);%subgrid varx deviation from h-mean
      varx_s=reshape(varx_s,nt,ng_sub);%subgrid varx
      vary_s=reshape(vary_s,nt,ng_sub);%subgrid vary
      %disp(strcat('i=',num2str(i),'is=',num2str(is),'ie=',num2str(ie),'j=',num2str(j),'js=',num2str(js),'je=',num2str(je)))
      wa_s_avg  =mean(wa_s,  2); %coarse grid mean vertical velocity:M(t,k)
      qc_s_avg  =mean(qc_s,  2); %coarse grid mean vertical velocity:M(t,k)
      rho_s_avg =mean(rho_s, 2); %coarse grid mean density:M(t,k)
      mf_s_avg  =mean(mf_s,  2); %coarse grid mean mass flux
      varp_s_avg=mean(varp_s,2); %coarse grid mean varx:M(t,k)  
      varx_s_avg=mean(varx_s,2); %coarse grid mean varx:M(t,k)  
      vary_s_avg=mean(vary_s,2); %coarse grid mean varx:M(t,k)  
      for t=1:nt
	rho_s1 =squeeze(rho_s (t,:)); %subgrid density
	wa_s1  =squeeze(wa_s  (t,:)); %subgrid total vertical velocity
	qc_s1  =squeeze(qc_s  (t,:)); %subgrid total vertical velocity
	mf_s1  =squeeze(mf_s  (t,:)); %subgrid total mass flux
	varp_s1=squeeze(varp_s(t,:)); %varx deviation from horizontal mean
	varx_s1=squeeze(varx_s(t,:)); %subgrid varx'=varx-coarse grid mean
	vary_s1=squeeze(vary_s(t,:)); %subgrid varx'=varx-coarse grid mean
	mfvx_s1=mf_s1.*varx_s1;
        %fractional area of coarse grid with wp>w_th (updraft)
	if (conv_choice==0)
	  id=(wa_s1>=w_th); %define updrafts
	elseif (conv_choice==1)
	  id=(qc_s1> qc_th); %define convective clouds
	end
	nn=sum(id);
	if (nn>0)
	  fa_w    (t)=nn/ng_sub; %fractional area of updrafts in eachsubdomain
	  w_cup   (t)=mean(wa_s1  (id)); %mean updraft w
	  mf_cup  (t)=mean(mf_s1  (id)); %mean updraft mass flux
	  v_cup   (t)=mean(varp_s1(id)); %mean environmental scalar varp
	  vx_cup  (t)=mean(varx_s1(id)); %mean environmental scalar varx
	  vy_cup  (t)=mean(vary_s1(id)); %mean environmental scalar vary
          mfvx_cup(t)=mean(mfvx_s1(id));
	  if (fa_w(t)==1)
	    w_env   (t)=w_cup   (t);
	    mf_env  (t)=mf_cup  (t);
	    v_env   (t)=v_cup   (t);
	    vx_env  (t)=vx_cup  (t);
	    vy_env  (t)=vy_cup  (t);
            mfvx_env(t)=mfvx_cup(t);
	  else
	    w_env   (t)=mean(wa_s1  (~id)); %mean environmental w
	    mf_env  (t)=mean(mf_s1  (~id)); %mean environmental w
	    v_env   (t)=mean(varp_s1(~id)); %mean environmental scalar varp
	    vx_env  (t)=mean(varx_s1(~id)); %mean environmental scalar varp
	    vy_env  (t)=mean(vary_s1(~id)); %mean environmental scalar varp
	    mfvx_env(t)=mean(mfvx_s1(~id));
	  end
	  sigma=fa_w(t); err=1.1;
	  d_mf =mf_cup(t)-mf_env(t); d_mf_err=err*mf_cup(t)-mf_env(t);
	  d_vx =v_cup(t) -v_env(t);  d_vx_err=err*v_cup(t) -v_env(t);
	  %comment the following because density variation is important
	  %a=w_cup(t)-w_env(t);
	  %flx_ed1(t)=rho_s_avg(t)*sigma*(1-sigma)*a*b;
	  %flx_ed2(t)=rho_s_avg(t)*sigma*w_cup(t)*b;
	  mfx_ed1 (t)=sigma*(1-sigma)*d_mf;
	  mfx_ed2 (t)=sigma*mf_cup(t)+(1-sigma)*mf_env(t);

	  flx_ed1 (t)=sigma*(1-sigma)*d_mf    *d_vx;
	  flx_ed1a(t)=sigma*(1-sigma)*d_mf    *d_vx_err;
	  flx_ed1b(t)=sigma*(1-sigma)*d_mf_err*d_vx_err;

	  flx_ed2 (t)=sigma*mf_cup(t)    *(v_cup(t)    -varp_s_avg(t));
	  flx_ed2a(t)=sigma*mf_cup(t)    *(v_cup(t)*err-varp_s_avg(t));
	  flx_ed2b(t)=sigma*mf_cup(t)*err*(v_cup(t)*err-varp_s_avg(t));
	else
	  fa_w    (t)=0;
	  mf_env  (t)=mean(mf_s1  (~id)); %mean environmental w
	  w_env   (t)=mean(wa_s1  (~id)); %mean environmental w
	  v_env   (t)=mean(varp_s1(~id)); %mean environmental scalar varp
	  vx_env  (t)=mean(varx_s1(~id)); %mean environmental scalar varp
	  vy_env  (t)=mean(vary_s1(~id)); %mean environmental scalar varp
	  mfvx_env(t)=mean(mfvx_s1(~id));
	  mfvx_cup(t)=mfvx_env(t);
	  mf_cup  (t)=mf_env(t);
	  w_cup   (t)=w_env (t);
	  v_cup   (t)=v_env (t);
	  vx_cup  (t)=vx_env(t);
	  vy_cup  (t)=vy_env(t);
	  flx_ed1 (t)=0; flx_ed1a(t)=0; flx_ed1b(t)=0;
	  flx_ed2 (t)=0; flx_ed2a(t)=0; flx_ed2b(t)=0;
	  mfx_ed1 (t)=0;
	  mfx_ed2 (t)=0;
	end
	%comment the following because density variation is important
	%vertical subgrid flux of varx: rho * w' * varx'
	%flx_edd(t)=mean(rho_s1.*(wa_s1-wa_s_avg(t)).*(varp_s1-varp_s_avg(t)));
	%vertical total flux of varx: rho * w * varp (varp=varx-Horiz._mean)
	%flx_tot(t)=mean(rho_s1.*wa_s1.*varp_s1);
	%must use mass flux to recover the transport!!!
	flx_edd(t)=mean((mf_s1-mf_s_avg(t)).*(varp_s1-varp_s_avg(t)));
	flx_grd(t)=mf_s_avg(t)*varp_s_avg(t);
	flx_tot(t)=mean(mf_s1.*varp_s1);
	
	flx_EDD(t)=mean((mf_s1-mf_s_avg(t)).*(varx_s1-varx_s_avg(t)));
	flx_GRD(t)=mf_s_avg(t)*varx_s_avg(t);
	flx_TOT(t)=mean(mf_s1.*varx_s1);
      end     
      p.wbar    (:,j,i)=wa_s_avg;
      p.rbar    (:,j,i)=rho_s_avg;
      p.vxbar   (:,j,i)=varx_s_avg;
      p.vybar   (:,j,i)=vary_s_avg;
      p.mf_bar  (:,j,i)=mf_s_avg;
      p.mfvx_cup(:,j,i)=mfvx_cup;
      p.mfvx_env(:,j,i)=mfvx_env;
      p.mf_cup  (:,j,i)=mf_cup;
      p.w_cup   (:,j,i)=w_cup;
      p.v_cup   (:,j,i)=v_cup;
      p.vx_cup  (:,j,i)=vx_cup;
      p.vy_cup  (:,j,i)=vy_cup;
      p.mf_env  (:,j,i)=mf_env;
      p.w_env   (:,j,i)=w_env;
      p.v_env   (:,j,i)=v_env;
      p.vx_env  (:,j,i)=vx_env;
      p.vy_env  (:,j,i)=vy_env;
      p.fa_wup  (:,j,i)=fa_w;
      p.fx_TOT  (:,j,i)=flx_TOT;
      p.fx_GRD  (:,j,i)=flx_GRD;
      p.fx_EDD  (:,j,i)=flx_EDD;
      p.fx_tot  (:,j,i)=flx_tot;
      p.fx_grd  (:,j,i)=flx_grd; 
      p.fx_edd  (:,j,i)=flx_edd; 
      p.fx_ed1  (:,j,i)=flx_ed1;
      p.fx_ed2  (:,j,i)=flx_ed2;
      p.fx_ed1a (:,j,i)=flx_ed1a;
      p.fx_ed1b (:,j,i)=flx_ed1b;
      p.fx_ed2a (:,j,i)=flx_ed2a;
      p.fx_ed2b (:,j,i)=flx_ed2b;
      p.mf_ed1  (:,j,i)=mfx_ed1;
      p.mf_ed2  (:,j,i)=mfx_ed2;
    end
  end
  %sigma = p.fa_wup defined as fractional area of updraft within each
  %coarsen grid or subdomain sigma>0 labeled as updraft containing subdomain
  id=(p.fa_wup>0); 
  nn=sum(sum(sum(id)));
  if (nn>0) %nn: total number of updraft containing subdomain
    %FA_wup may be different from that defined as by p.wbar>0
    p.avg.FA_wup  =nn/(ng_new*nt);%fractional area of all updraft subdomain
    p.avg.fa_wup  =mean(p.fa_wup (id)); %sigma averaged over all updraft subdomain
    p.std.fa_wup  =std (p.fa_wup (id)); %sigma std over all updraft subdomain
    p.avg.fx_TOT  =mean(p.fx_TOT (id)); %total flux averaged over updraft subdomain
    p.avg.fx_GRD  =mean(p.fx_GRD (id)); %total flux averaged over updraft subdomain
    p.avg.fx_EDD  =mean(p.fx_EDD (id)); %total flux averaged over updraft subdomain
    p.avg.fx_tot  =mean(p.fx_tot (id)); %total flux averaged over updraft subdomain
    p.avg.fx_grd  =mean(p.fx_grd (id)); %grid-scale flux averaged over updraft
    p.avg.fx_edd  =mean(p.fx_edd (id)); %eddy flux averaged over updraft dsubdomain
    p.avg.fx_ed1  =mean(p.fx_ed1 (id)); %modeled eddy flux 1
    p.avg.fx_ed2  =mean(p.fx_ed2 (id)); %modeled eddy flux 1
    p.avg.mf_bar  =mean(p.mf_bar (id)); %modeled eddy flux 1
    p.avg.mf_cup  =mean(p.mf_cup (id)); %modeled eddy flux 1
    p.avg.mf_env  =mean(p.mf_env (id)); %modeled eddy flux 1
    p.avg.mf_ed1  =mean(p.mf_ed1 (id)); %modeled eddy flux 1
    p.avg.mf_ed2  =mean(p.mf_ed2 (id)); %modeled eddy flux 1
    p.avg.fx_ed1a =mean(p.fx_ed1a(id)); %modeled eddy flux 1
    p.avg.fx_ed1b =mean(p.fx_ed1b(id)); %modeled eddy flux 1
    p.avg.fx_ed2a =mean(p.fx_ed2a(id)); %modeled eddy flux 1
    p.avg.fx_ed2b =mean(p.fx_ed2b(id)); %modeled eddy flux 1
    p.avg.vy_cup  =mean(p.vy_cup (id)); %modeled eddy flux 1
    p.avg.vy_env  =mean(p.vy_env (id)); %modeled eddy flux 1
    p.avg.vybar   =mean(p.vybar  (id)); %modeled eddy flux 1
    p.avg.vx_cup  =mean(p.vx_cup (id)); %modeled eddy flux 1
    p.avg.vx_env  =mean(p.vx_env (id)); %modeled eddy flux 1
    p.avg.vxbar   =mean(p.vxbar  (id)); %modeled eddy flux 1
    p.avg.mfvx_cup=mean(p.mfvx_cup(id));
    p.avg.mfvx_env=mean(p.mfvx_env(id));
    p.avg.chek_pcp=p.avg.fa_wup*p.avg.vy_cup+(1-p.avg.fa_wup)*p.avg.vy_env;
  else %if there is no updraft containing subdomain (coarsen grid)
    p.avg.FA_wup =0;
    p.avg.fa_wup =0;
    p.std.fa_wup =0;
    p.avg.fx_tot =0;
    p.avg.fx_grd =0;
    p.avg.fx_edd =0;
    p.avg.fx_ed1 =0;
    p.avg.fx_ed2 =0;
    p.avg.mf_cup =0;
    p.avg.mf_ed1 =0;
    p.avg.fx_ed1a=0;
    p.avg.fx_ed1b=0;
    p.avg.fx_ed2a=0;
    p.avg.fx_ed2b=0;
  end
  
else %if not doing vertical flux calculation
  
  for j=1:ny_new
    for i=1:nx_new
      is=xi*(i-1)+1; ie=is+xi-1;
      js=yi*(j-1)+1; je=js+yi-1;
      varx_s    =squeeze(varx(:,js:je,is:ie));
      varx_s_avg=mean(mean(varx_s,3),2);
      p.vxbar(:,j,i)=varx_s_avg;
    end
  end

end

if (xi==1 & yi==1)
  p.w_cup =0;
  p.v_cup =0;
  p.w_env =0;
  p.v_env =0;
end

if strcmp(opt,'rmwr')
  p.wbar =0;
  p.rbar =0;
  p.w_cup=0;
  p.r_cup=0;
  p.w_env=0;
  p.r_env=0;
end

return
