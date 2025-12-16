function cld_wall=updraft_ana()
a=wa;          a=shiftdim(a,1); x.wa         =reshape(a,v.nz,v.ngrid*v.nt);
a=mf;          a=shiftdim(a,1); x.mf         =reshape(a,v.nz,v.ngrid*v.nt);
a=qc;          a=shiftdim(a,1); x.qc         =reshape(a,v.nz,v.ngrid*v.nt);
a=qp;          a=shiftdim(a,1); x.qp         =reshape(a,v.nz,v.ngrid*v.nt);
a=buo;         a=shiftdim(a,1); x.buo        =reshape(a,v.nz,v.ngrid*v.nt);
a=dpf_nh_dz;   a=shiftdim(a,1); x.dpf_nh_dz  =reshape(a,v.nz,v.ngrid*v.nt);
a=mf_hdiv;     a=shiftdim(a,1); x.mf_hdiv    =reshape(a,v.nz,v.ngrid*v.nt);
a=mf_hdiv_int; a=shiftdim(a,1); x.mf_hdiv_int=reshape(a,v.nz,v.ngrid*v.nt);
a=qc_int;      a=shiftdim(a,1); x.qc_int     =reshape(a,1,   v.ngrid*v.nt);
a=qp_int;      a=shiftdim(a,1); x.qp_int     =reshape(a,1,   v.ngrid*v.nt);
a=pcp;         a=shiftdim(a,1); x.pcp        =reshape(a,1,   v.ngrid*v.nt);
a=w500;        a=shiftdim(a,1); x.w500       =reshape(a,1,   v.ngrid*v.nt);
a=w700;        a=shiftdim(a,1); x.w700       =reshape(a,1,   v.ngrid*v.nt);

%sampling cloud; %qc_col=squeeze(sum(x.qc,1)); id=(qc_col > 0.001);
qc_th=0.001;
id=(x.qc_int > qc_th);
cld.wa         =x.wa         (:,id); 
cld.mf         =x.mf         (:,id);
cld.qc         =x.qc         (:,id);
cld.qp         =x.qp         (:,id);
cld.buo        =x.buo        (:,id);
cld.dpf_nh_dz  =x.dpf_nh_dz  (:,id);
cld.mf_hdiv    =x.mf_hdiv    (:,id);
cld.mf_hdiv_int=x.mf_hdiv_int(:,id);
cld.qc_int     =x.qc_int       (id);
cld.qp_int     =x.qp_int       (id);
cld.pcp        =x.pcp          (id);
cld.w500       =x.w500         (id);
cld.w700       =x.w700         (id);

%conditional sampling of w within cld
wa_th=1.
%k1=18; k2=65; %k1=39; k2=49; wa_th=2;
%wacld_max=squeeze(max(cld.wa(k1:k2,:),[],1));
%wacld_min=squeeze(min(cld.wa(k1:k2,:),[],1));
%id_max=(wacld_max >  wa_th); cld_wmax.wa=cld.wa(:,id_max); 
%id_min=(wacld_min < -wa_th); cld_wmin.wa=cld.wa(:,id_min); 
%id_all=(wacld_max >  wa_th) | (wacld_min < -wa_th);

id=(cld.w500>wa_th)|(cld.w500< -wa_th); cldw.wlev=cld.w500(id); 
%id=(cld.w700>wa_th)|(cld.w700< -wa_th); cldw.wlev=cld.w700(id); 
%id=(cld.w700>wa_th); cldw.wlev=cld.w700(id); 

cldw.wa         =cld.wa         (:,id); 
cldw.mf         =cld.mf         (:,id); 
cldw.qc         =cld.qc         (:,id); 
cldw.qp         =cld.qp         (:,id); 
cldw.buo        =cld.buo        (:,id); 
cldw.dpf_nh_dz  =cld.dpf_nh_dz  (:,id); 
cldw.mf_hdiv    =cld.mf_hdiv    (:,id); 
cldw.mf_hdiv_int=cld.mf_hdiv_int(:,id); 
cldw.qc_int     =cld.qc_int       (id); 
cldw.qp_int     =cld.qp_int       (id); 
cldw.pcp        =cld.pcp          (id); 
cldw.w500       =cld.w500         (id); 
cldw.w700       =cld.w700         (id); 

%sorting
%w_max=squeeze(max(cld_wmax.wa(k1:k2,:),[],1));[a id]=sort(w_max);cld_wmax.wa_s=cld_wmax.wa(:,id);
%w_min=squeeze(min(cld_wmin.wa(k1:k2,:),[],1));[a id]=sort(w_min);cld_wmin.wa_s=cld_wmin.wa(:,id);
%w_all=squeeze(max(cld_wall.wa(k1:k2,:),[],1));[a id]=sort(w_all);cld_wall.wa_s=cld_wall.wa(:,id);

[a id]=sort(cldw.wlev);
cldw.wa_s         =cldw.wa         (:,id);
cldw.mf_s         =cldw.mf         (:,id);
cldw.qc_s         =cldw.qc         (:,id);
cldw.qp_s         =cldw.qp         (:,id);
cldw.buo_s        =cldw.buo        (:,id); 
cldw.dpf_nh_dz_s  =cldw.dpf_nh_dz  (:,id); 
cldw.mf_hdiv_s    =cldw.mf_hdiv    (:,id); 
cldw.mf_hdiv_int_s=cldw.mf_hdiv_int(:,id); 
cldw.qc_int_s     =cldw.qc_int       (id); 
cldw.qp_int_s     =cldw.qp_int       (id); 
cldw.pcp_s        =cldw.pcp          (id); 
cldw.w500_s       =cldw.w500         (id); 

%EOF analysis
U=cldw.wa_s'; %make vertical distribution along the 2nd dimention a(t,:)
%for k=1:v.nz
%  UU=U(:,k)-mean(U(:,k));
%end
%UU=U(1:4,:);
[L, EOFs, EC, error, norms]=EOF(U,3);
figure; plot(EOFs,v.pf0); set(gca,'yDir','reverse'); 
100*diag(L)/sum(diag(L))
y=EC*EOFs';

figure; plot(mean(cldw.wa_s,2),v.pf0);set(gca,'yDir','reverse'); 

%plotting
pms=[ 0, 0, 1200, 800]*1.5; row=7; col=1;
handle = figure('Position', pms,'visible','on'); 
subplot(row,col,1); xx=[1:length(id)];
pcolor(xx,v.pf0,cldw.wa_s); shading flat; colorbar; 
set(gca,'yDir','reverse'); caxis([-5 5]);

subplot(row,col,2);
pcolor(xx,v.pf0,y'); shading flat; colorbar; 
set(gca,'yDir','reverse'); caxis([-5 5]);

subplot(row,col,2);
pcolor(xx,v.pf0,cldw.mf_s); shading flat; colorbar; 
set(gca,'yDir','reverse'); %caxis([-0.2 0.2]);

subplot(row,col,3);
pcolor(xx,v.pf0,cldw.qc_s); shading flat; colorbar; 
set(gca,'yDir','reverse'); %caxis([-0.2 0.2]);

subplot(row,col,4);
pcolor(xx,v.pf0,cldw.qp_s); shading flat; colorbar; 
set(gca,'yDir','reverse'); %caxis([-0.2 0.2]);

subplot(row,col,5);
plot(xx,cldw.qc_int_s);

subplot(row,col,6);
plot(xx,cldw.qp_int_s);

subplot(row,col,7);
plot(xx,cldw.pcp_s); %axis([0 500 2 10]);



subplot(row,col,2);
pcolor(xx,v.pf0,cldw.dpf_nh_dz_s); shading flat; colorbar; 
set(gca,'yDir','reverse'); caxis([-0.2 0.2]);

subplot(row,col,3);
pcolor(xx,v.pf0,cldw.buo_s); shading flat; colorbar; 
set(gca,'yDir','reverse'); caxis([-0.2 0.2]);

subplot(row,col,4);
pcolor(xx,v.pf0,cldw.mf_hdiv_int_s); shading flat; colorbar; 
set(gca,'yDir','reverse'); caxis([-5 5]);

subplot(row,col,5);
pcolor(xx,v.pf0,cldw.qc_s); shading flat; colorbar; 
set(gca,'yDir','reverse'); %caxis([-0.001 0.001]);

subplot(row,col,6);
plot(xx,cldw.qc_int_s);

return

figure; pcolor(cldw.wa);  shading flat; colorbar; set(gca,'yDir','reverse');caxis([-5 5]);
figure; pcolor(cldw.qc);  shading flat; colorbar; set(gca,'yDir','reverse');
figure; pcolor(cldw.qc_s);shading flat; colorbar; set(gca,'yDir','reverse');
figure; pcolor(cldw.dpf_nh_dz);  shading flat; colorbar; set(gca,'yDir','reverse');
