function [p]=getsubgrid(wa,rho,varx,v,xi,yi,ks,ke,w_th)
%var=wa; xi=16; yi=16; ks=1; ke=64;
t1=1; t2=v.nt; nt=v.nt; disp('In getsubgrid...'); 
nz=ke-ks+1; p.ks=ks; p.ke=ke;

a=squeeze(mean(mean(mean(varx,4),3),1));
for k = ks:ke %deviation from horizontal mean
  varp(:,k,:,:)=varx(:,k,:,:)-a(k);
end

nx_new=v.nx/xi; ny_new=v.ny/yi; ng_new=nx_new*ny_new;
ng_sub=xi*yi; %w_th=0.5;
for j=1:ny_new
  disp(strcat('j=',num2str(j)));
  for i=1:nx_new
    is=xi*(i-1)+1; ie=is+xi-1;
    js=yi*(j-1)+1; je=js+yi-1;
    wa_s  =squeeze(wa  (:,ks:ke,js:je,is:ie));
    rho_s =squeeze(rho (:,ks:ke,js:je,is:ie));
    varx_s=squeeze(varx(:,ks:ke,js:je,is:ie));    
    varp_s=squeeze(varp(:,ks:ke,js:je,is:ie)); 
    wa_s  =reshape(wa_s,  nt,nz,ng_sub);%subgrid vertical velocity
    rho_s =reshape(rho_s, nt,nz,ng_sub);%subgrid density
    varx_s=reshape(varx_s,nt,nz,ng_sub);%subgrid varx
    varp_s=reshape(varp_s,nt,nz,ng_sub);%subgrid varx deviation from h-mean
    %disp(strcat('i=',num2str(i),'is=',num2str(is),'ie=',num2str(ie),'j=',num2str(j),'js=',num2str(js),'je=',num2str(je)))
    
    wa_s_avg  =mean(wa_s,  3); %coarse grid mean vertical velocity:M(t,k)
    rho_s_avg =mean(rho_s, 3); %coarse grid mean density:M(t,k)
    varx_s_avg=mean(varx_s,3); %coarse grid mean varx:M(t,k)  
    varp_s_avg=mean(varp_s,3); %coarse grid mean varx:M(t,k)  
    for t=1:nt
      for k=1:nz
	rho_s1 =squeeze(rho_s (t,k,:)); %subgrid density
	wa_s1  =squeeze(wa_s  (t,k,:)); %subgrid total vertical velocity
	varx_s1=squeeze(varx_s(t,k,:)); %subgrid varx'=varx-coarse grid mean
	varp_s1=squeeze(varp_s(t,k,:)); %varx deviation from horizontal mean
	%fractional area of coarse grid with wp>w_th (updraft)
	id=(wa_s1>=w_th); %define updrafts
	nn=sum(id); 
	if (nn>0)
	  fa_w (t,k)=nn/ng_sub; %fractional area of updrafts in eachsubdomain
	  w_cup(t,k)=mean(wa_s1   (id)); %mean updraft w
	  v_cup(t,k)=mean(varp_s1 (id)); %mean environmental scalar varp
	  if (fa_w(t,k)==1)
	    w_env(t,k)=w_cup(t,k);
	    v_env(t,k)=v_cup(t,k);
	  else
	    w_env(t,k)=mean(wa_s1  (~id)); %mean environmental w
	    v_env(t,k)=mean(varp_s1(~id)); %mean environmental scalar varp
	  end
	  sigma=fa_w(t,k);
	  a=w_cup(t,k)-w_env(t,k);
	  b=v_cup(t,k)-v_env(t,k);
	  flx_ed1(t,k)=rho_s_avg(t,k)*sigma*(1-sigma)*a*b;
	  flx_ed2(t,k)=rho_s_avg(t,k)*sigma*a*b;
	else
	  fa_w (t,k)=0;
	  w_env(t,k)=mean(wa_s1  (~id)); %mean environmental w
	  v_env(t,k)=mean(varp_s1(~id)); %mean environmental scalar varp
	  w_cup(t,k)=w_env(t,k);
	  v_cup(t,k)=v_env(t,k);
	  flx_ed1(t,k)=0;
	  flx_ed2(t,k)=0;
	end
	%vertical subgrid flux of varx: rho * w' * varx'
	flx_edd(t,k)=mean(rho_s1.*(wa_s1-wa_s_avg(t,k)).*(varp_s1-varp_s_avg(t,k)));
	%vertical total flux of varx: rho * w * varp (varp=varx-Horiz._mean)
	flx_tot(t,k)=mean(rho_s1.*wa_s1.*varp_s1);
	flx_grd(t,k)=rho_s_avg(t,k)*wa_s_avg(t,k)*varp_s_avg(t,k);
      end
    end
    p.wbar   (j,i,:,:)=wa_s_avg;
    p.rbar   (j,i,:,:)=rho_s_avg;
    p.vbar   (j,i,:,:)=varx_s_avg;
    p.w_cup  (j,i,:,:)=w_cup;
    p.v_cup  (j,i,:,:)=v_cup;
    p.w_env  (j,i,:,:)=w_env;
    p.v_env  (j,i,:,:)=v_env;
    p.fa_wup (j,i,:,:)=fa_w;
    p.flx_tot(j,i,:,:)=flx_tot; 
    p.flx_grd(j,i,:,:)=flx_grd; 
    p.flx_edd(j,i,:,:)=flx_edd; 
    p.flx_ed1(j,i,:,:)=flx_ed1;
    p.flx_ed2(j,i,:,:)=flx_ed2;
  end
end

p.fa_wup=shiftdim(p.fa_wup,2);%subgrid fractional area (sigma) of w>w_th)
p.wbar  =shiftdim(p.wbar,   2); 
p.rbar  =shiftdim(p.rbar,   2);
p.vbar  =shiftdim(p.vbar,   2);
p.w_cup =shiftdim(p.w_cup,  2);
p.v_cup =shiftdim(p.v_cup,  2);
p.w_env =shiftdim(p.w_env,  2);
p.v_env =shiftdim(p.v_env,  2);
p.fx_tot=shiftdim(p.flx_tot,2);
p.fx_grd=shiftdim(p.flx_grd,2);
p.fx_edd=shiftdim(p.flx_edd,2);
p.fx_ed1=shiftdim(p.flx_ed1,2);
p.fx_ed2=shiftdim(p.flx_ed2,2);

for k=1:nz
  a  =squeeze(p.fa_wup(:,k,:,:));
  x1 =squeeze(p.fx_tot(:,k,:,:));
  x2 =squeeze(p.fx_grd(:,k,:,:));
  x3 =squeeze(p.fx_edd(:,k,:,:));
  x4 =squeeze(p.fx_ed1(:,k,:,:));
  x5 =squeeze(p.fx_ed2(:,k,:,:));
  id=(a>0); nn=sum(sum(sum(id)));
  if (nn>0) %coarse grid is labeled as updraft column if sigma=p.fa_w_sg>0
    %FA_w_sg_avg may be differnce than that defined simply by p.wa>0
    p.avg.FA_wup(k)=nn/ng_new;  %fractional area of all updraft subdomain
    p.avg.fa_wup(k)=mean(a (id));%sigma averaged over all updraft subdomain
    p.std.fa_wup(k)=std (a (id));%standard deviation of all updraft subdomain
    p.avg.fx_tot(k)=mean(x1(id));
    p.avg.fx_grd(k)=mean(x2(id));
    p.avg.fx_edd(k)=mean(x3(id));
    p.avg.fx_ed1(k)=mean(x4(id));
    p.avg.fx_ed2(k)=mean(x5(id));
  else
    p.avg.FA_wup(k)=0;
    p.avg.fa_wup(k)=0;
    p.std.fa_wup(k)=0;
    p.avg.fx_tot(k)=0;
    p.avg.fx_grd(k)=0;
    p.avg.fx_edd(k)=0;
    p.avg.fx_ed1(k)=0;
    p.avg.fx_ed2(k)=0;
  end
end

return
