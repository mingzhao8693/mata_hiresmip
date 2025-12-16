function [p]=onelev_txyavg(v,wa,qc,ti,xi,yi,wbin_up,wbin_dn,wbin,pctile,qc_th,vx,vbin)
nx_new=v.nx/xi; 
ny_new=v.ny/yi; 
nt_new=floor(v.nt/ti);
ng_new=nx_new*ny_new; 
ng_sub=xi*yi; 
disp(v.expn);
for t=1:nt_new
  disp(strcat('t=',num2str(t),'(nt_new,ny_new,nx_new)=',...
      num2str(nt_new),';',num2str(ny_new),';',num2str(nx_new)));
  for j=1:ny_new
    for i=1:nx_new
      ts=ti*(t-1)+1; te=ts+ti-1;
      is=xi*(i-1)+1; ie=is+xi-1;
      js=yi*(j-1)+1; je=js+yi-1;
      wa_s=squeeze(wa(ts:te,js:je,is:ie));
      qc_s=squeeze(qc(ts:te,js:je,is:ie));
      wa_s_avg=mean(mean(mean(wa_s)));
      qc_s_avg=mean(mean(mean(qc_s)));
      wa_new(t,j,i)=wa_s_avg;
      qc_new(t,j,i)=qc_s_avg;
      if exist('vx')
	vx_s=squeeze(vx(ts:te,js:je,is:ie));
	vx_s_avg=mean(mean(mean(vx_s)));
	vx_new(t,j,i)=vx_s_avg;
      end
    end
  end
end

vv=v; vv.nt=nt_new; vv.nx=nx_new; vv.ny=ny_new; vv.ngrid=nx_new*ny_new;
if exist('vx')
  p=onelev(vv,wa_new,qc_new,wbin_up,wbin_dn,wbin,pctile,qc_th,vx_new,vbin);
else
  p=onelev(vv,wa_new,qc_new,wbin_up,wbin_dn,wbin,pctile,qc_th);
end
p.xi=xi; p.yi=yi; p.ti=ti; 
p.nx_new=nx_new;
p.ny_new=ny_new;
p.nt_new=nt_new;
return

