function plot_allmember_pcp(vm, o, p, m)
mon={'ANN','MAM','JJA','SON','DJF'}; %m=2;
land_th=o.land_th; ice_th=o.ice_th;
a=o.lm0; a(a>=land_th)=1; a(a<land_th)=0; lm=a; %land mask
a=o.imk; a(a>=ice_th) =1; a(a<=ice_th)=0; im=a; %ice mask
idm=lm|im; id=~idm; id=(lm==1);   %land & ice mask
aa=o.aa; aa0=aa(id)/mean(aa(id)); %for open ocean area-weighting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lon=o.lon; lat=o.lat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, p.xsize, p.ysize]*1.2; fsize=6; 
handle=figure('Position',pms,'visible','on'); 
row=5; col=4; cmap=bluewhitered_miz(256); 
co='k'; cmin=p.cmin; cmax=p.cmax; cmin=-0.12; cmax=0.12;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GPCC observed trend%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=1;
a=squeeze(vm(1).pcp.obs_gpcc.trend(m,:,:)); a0=mean(mean(a.*aa));
idx=~isnan(a)&id; a0=o.aa; a0=a0(idx)/mean(a0(idx));
a0=mean(mean(a(idx).*a0));
subplot(row, col, i); colormap(cmap);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co); %colorbar; 
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
titl=sprintf('(a) GPCC (avg=%4.2fmmday^{-1}dec^{-1})',a0); 
title(titl,'FontSize',fsize-1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GPCP observed trend%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1;
a=squeeze(vm(1).pcp.obs_gpcp.trend(m,:,:)); a0=mean(mean(a.*aa));
subplot(row, col, i); colormap(cmap);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co); %colorbar; 
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
titl=sprintf('(b) GPCP (avg=%4.2fmmday^{-1}dec^{-1})',a0); 
title(titl,'FontSize',fsize-1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MSWEP observed trend%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1;
a=squeeze(vm(1).pcp.obs_mswep.trend(m,:,:));
idx=~isnan(a)&id; a0=o.aa; a0=a0(idx)/mean(a0(idx));
a0=mean(mean(a(idx).*a0));
subplot(row, col, i); %colormap(cmap);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co); %colorbar; 
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
titl=sprintf('(c) MSWEP (avg=%4.2fmmday^{-1}dec^{-1})',a0); 
title(titl,'FontSize',fsize-1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mod_num=13; n=4;
for i = 1:mod_num
  v=vm(i); j=i+n; %mod_all(i,:,:,:)=squeeze(mean(v.pcp.mod.ts.va,2));
  a=squeeze(v.pcp.mod.trend(m,:,:)); mod_org(i,:,:)=a; 
  a0=mean(mean(a.*aa)); mod_av(i)=a0;
  subplot(row, col, j); colormap(cmap); %a(idm)=NaN;
  pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
  contour(lon,lat,lm,1,co);
  set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
  titl=sprintf('M%02d (avg=%4.2fmmday^{-1}dec^{-1})',i,a0);
  title(titl,'FontSize',fsize-1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AMIP ensemble mean%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=4; a=mod_org; a=squeeze(mean(a,1));
a0=mean(mean(a(id).*aa0));
subplot(row, col, i); %colormap(cmap);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co); 
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
titl=sprintf('(d) ENS mean (avg=%4.2fKdec^{-1})',a0); 
title(titl,'FontSize',fsize-1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a=strcat(p.vname,'1980-2020; (',mon(m),')'); a=strrep(a,'_',' '); sgtitle(a);
cb = colorbar('FontSize',fsize+4,'Location','southoutside');
set(cb, 'Position', [.165 .04 .7 .02]); caxis([cmin, cmax+0.001]); 
colormap(cmap); 
cb.Label.String = '\rm{K dec^{-1}}'; pos=get(cb,'Position')
cb.Label.Position = [pos(1)-0.165 pos(2)+1.75]; 
cb.Label.Rotation = 0;
%if p.opt == "bias"; a=length(c); c(a/2-1:a/2+2,:)=1; colormap(c);end;
%cb.Position = [0.92 0.11 0.02 0.81]; full size right outside
%cb.Position = [0.92 0.45 0.02 0.41];

vname = p.vname; mod_name=p.mod_name; 
visfig='off'; figpath='./fig_cre/';
printnew(visfig,figpath,mod_name,vname);
