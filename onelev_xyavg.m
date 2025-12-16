function [p]=onelev_xyavg(v,wx,qc,xi,yi,wbin_up,wbin_dn,wbin,pctile,qc_th)
nx_new=v.nx/xi; 
ny_new=v.ny/yi; 
ng_new=nx_new*ny_new; 
ng_sub=xi*yi; nt=v.nt;

for j=1:ny_new
  for i=1:nx_new
    is=xi*(i-1)+1; ie=is+xi-1;
    js=yi*(j-1)+1; je=js+yi-1;
    wa_s=squeeze(wx(:,js:je,is:ie));
    qc_s=squeeze(qc(:,js:je,is:ie));
    wa_s=reshape(wa_s,nt,ng_sub);
    qc_s=reshape(qc_s,nt,ng_sub);
    wa_s_avg=mean(wa_s,2);
    qc_s_avg=mean(qc_s,2);
    wx_new(:,j,i)=wa_s_avg;
    qc_new(:,j,i)=qc_s_avg;
  end
end
vx=v; vx.nx=nx_new; nx.ny=ny_new; vx.ngrid=nx_new*ny_new;
p=onelev(vx,wx_new,qc_new,wbin_up,wbin_dn,wbin,pctile,qc_th);
return

