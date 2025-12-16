function [p]=getsubgrid_2d_new(wa,rho,varx,v,xi,yi,w_th,opt)
%var=w500; xi=16; yi=16;
t1=1; t2=v.nt; nt=v.nt; disp('In getsubgrid_2d...'); 

nx_new=v.nx/xi; ny_new=v.ny/yi; ng_new=nx_new*ny_new;
ng_sub=xi*yi; 
if strcmp(opt,'flx')
  varp=get_anom(varx);
  for j=1:ny_new
    disp(strcat('j=',num2str(j)));
    for i=1:nx_new
      is=xi*(i-1)+1; ie=is+xi-1;
      js=yi*(j-1)+1; je=js+yi-1;
      wa_s  =squeeze(wa  (:,js:je,is:ie));
      rho_s =squeeze(rho (:,js:je,is:ie));
      varx_s=squeeze(varx(:,js:je,is:ie));
      varp_s=squeeze(varp(:,js:je,is:ie));
      wa_s  =reshape(wa_s,  nt,ng_sub);%subgrid vertical velocity
      rho_s =reshape(rho_s, nt,ng_sub);%subgrid density
      varx_s=reshape(varx_s,nt,ng_sub);%subgrid varx
      varp_s=reshape(varp_s,nt,ng_sub);%subgrid varx deviation from h-mean
      %disp(strcat('i=',num2str(i),'is=',num2str(is),'ie=',num2str(ie),'j=',num2str(j),'js=',num2str(js),'je=',num2str(je)))
      wa_s_avg  =mean(wa_s,  2); %coarse grid mean vertical velocity:M(t,k)
      rho_s_avg =mean(rho_s, 2); %coarse grid mean density:M(t,k)
      varx_s_avg=mean(varx_s,2); %coarse grid mean varx:M(t,k)  
      varp_s_avg=mean(varp_s,2); %coarse grid mean varx:M(t,k)  
      for t=1:nt
	rho_s1 =squeeze(rho_s (t,:)); %subgrid density
	wa_s1  =squeeze(wa_s  (t,:)); %subgrid total vertical velocity
	varx_s1=squeeze(varx_s(t,:)); %subgrid varx'=varx-coarse grid mean
	varp_s1=squeeze(varp_s(t,:)); %varx deviation from horizontal mean
        %fractional area of coarse grid with wp>w_th (updraft)
	id=(wa_s1>=w_th); %define updrafts
	nn=sum(id);
	if (nn>0)
	  fa_w (t)=nn/ng_sub; %fractional area of updrafts in eachsubdomain
	  w_cup(t)=mean(wa_s1   (id)); %mean updraft w
	  v_cup(t)=mean(varp_s1 (id)); %mean environmental scalar varp
	  if (fa_w(t)==1)
	    w_env(t)=w_cup(t)
	    v_env(t)=v_cup(t)
	  else
	    w_env(t)=mean(wa_s1  (~id)); %mean environmental w
	    v_env(t)=mean(varp_s1(~id)); %mean environmental scalar varp
	  end
	  sigma=fa_w(t); a=w_cup(t)-w_env(t); b=v_cup(t)-v_env(t);
	  flx_ed1(t)=rho_s_avg(t)*sigma*(1-sigma)*a*b;
	  flx_ed2(t)=rho_s_avg(t)*sigma*a*b;
	else
	  fa_w (t)=0;
	  w_env(t)=mean(wa_s1  (~id)); %mean environmental w
	  v_env(t)=mean(varp_s1(~id)); %mean environmental scalar varp
	  w_cup(t)=w_env(t);
	  v_cup(t)=v_env(t);
	  flx_ed1(t)=0;
	  flx_ed2(t)=0;
	end
	%vertical subgrid flux of varx: rho * w' * varx'
	flx_edd(t)=mean(rho_s1.*(wa_s1-wa_s_avg(t)).*(varp_s1-varp_s_avg(t)));
	%vertical total flux of varx: rho * w * varp (varp=varx-Horiz._mean)
	flx_tot(t)=mean(rho_s1.*wa_s1.*varp_s1);
	flx_grd(t)=rho_s_avg(t)*wa_s_avg(t)*varp_s_avg(t);
      end
      p.wbar  (:,j,i)=wa_s_avg;
      p.rbar  (:,j,i)=rho_s_avg;
      p.vbar  (:,j,i)=varx_s_avg;
      p.w_cup (:,j,i)=w_cup;
      p.v_cup (:,j,i)=v_cup;
      p.w_env (:,j,i)=w_env;
      p.v_env (:,j,i)=v_env;
      p.fa_wup(:,j,i)=fa_w;
      p.fx_tot(:,j,i)=flx_tot; 
      p.fx_grd(:,j,i)=flx_grd; 
      p.fx_edd(:,j,i)=flx_edd; 
      p.fx_ed1(:,j,i)=flx_ed1;
      p.fx_ed2(:,j,i)=flx_ed2;
    end
  end
  a  =p.fa_wup;
  x1 =p.fx_tot;
  x2 =p.fx_grd;
  x3 =p.fx_edd;
  x4 =p.fx_ed1;
  x5 =p.fx_ed2;
  %sigma = p.fa_wup defined as fractional area of updraft within each
  %coarsen grid or subdomain sigma>0 labeled as updraft containing subdomain
  id=(a>0); nn=sum(sum(sum(id)));
  if (nn>0) %nn: total number of updraft containing subdomain
    %FA_wup may be different from that defined as by p.wbar>0
    p.avg.FA_wup=nn/ng_new;  %fractional area of all updraft subdomain
    p.avg.fa_wup=mean(a (id));%sigma averaged over all updraft subdomain
    p.std.fa_wup=std (a (id));%sigma std over all updraft subdomain

    p.avg.fx_tot=mean(x1(id));%total flux averaged over updraft subdomain
    p.avg.fx_grd=mean(x2(id));%grid-scale flux averaged over updraft
    p.avg.fx_edd=mean(x3(id));%eddy flux averaged over updraft dsubdomain
    p.avg.fx_ed1=mean(x4(id));%modeled eddy flux 1
    p.avg.fx_ed2=mean(x5(id));%modeled eddy flux 1
  else %if there is no updraft containing subdomain (coarsen grid)
    p.avg.FA_wup=0;
    p.avg.fa_wup=0;
    p.std.fa_wup=0;
    
    p.avg.fx_tot=0;
    p.avg.fx_grd=0;
    p.avg.fx_edd=0;
    p.avg.fx_ed1=0;
    p.avg.fx_ed2=0;
  end
  
else %if not doing vertical flux calculation
  
  for j=1:ny_new
    for i=1:nx_new
      is=xi*(i-1)+1; ie=is+xi-1;
      js=yi*(j-1)+1; je=js+yi-1;
      varx_s    =squeeze(varx(:,js:je,is:ie));
      varx_s_avg=mean(mean(varx_s,3),2);
      p.vbar(:,j,i)=varx_s_avg;
    end
  end

end



return
