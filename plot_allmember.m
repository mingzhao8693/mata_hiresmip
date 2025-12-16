function plot_allmember(vm, o, p)
land_th=o.land_th; ice_th=o.ice_th; 
a=o.lm0; a(a>=land_th)=1; a(a<land_th)=0; lm=a; %land mask
a=o.imk; a(a>=ice_th) =1; a(a<=ice_th)=0; im=a; %ice mask
idm=lm|im; id=~idm;               %land & ice mask
aa=o.aa; aa0=aa(id)/mean(aa(id)); %for open ocean area-weighting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lon=o.lon; lat=o.lat; rg.idm_all=idm; rg.id_all=id;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, p.xsize, p.ysize]*1.2; fsize=6; 
handle=figure('Position',pms,'visible','on'); 
row=5; col=4; cmap=bluewhitered_miz(256); 
co='k'; cmin=p.cmin; cmax=p.cmax;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mod_num=13; n=5; x=[1979:2020];
for i = 1:mod_num
  v=vm(i); j=i+n; v.sst.tsurf=v.tsurf;
  a=v.sst.tsurf.mod.ts.sst;
  mod_all(i,:,:,:)=squeeze(mean(v.sst.tsurf.mod.ts.sst,2));
  a=v.sst.tsurf.mod.trend; mod_org(i,:,:)=a; 
  a0=mean(mean(a(id).*aa0)); mod_av(i)=a0;
  subplot(row, col, j); colormap(cmap);
  a(idm)=NaN;
  pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
  contour(lon,lat,lm,1,co);
  set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
  titl=sprintf('M%02d (avg=%4.2fKdec^{-1})',i,a0);
  title(titl,'FontSize',fsize-1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%HadISST observed trend%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1; i=1; a=vm(1).sst.hadisst.trend; a0=mean(mean(a(id).*aa0));
subplot(row, col, i); a(idm==1)=NaN; colormap(cmap);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co); 
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
titl=sprintf('(a) HadISST (avg=%4.2fKdec^{-1})',a0); 
title(titl,'FontSize',fsize-1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERSST observed trend%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1; i=2; a=vm(1).sst.ersst.trend; 
idx=~isnan(a)&id; a0=o.aa; a0=a0(idx)/mean(a0(idx));
a0=mean(mean(a(idx).*a0));
subplot(row, col, i); a(idm==1)=NaN; colormap(cmap);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co); 
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
titl=sprintf('(b) ERSSTv5 (avg=%4.2fKdec^{-1})',a0); 
title(titl,'FontSize',fsize-1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%COBESST observed trend%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1; i=3; a=squeeze(vm(1).sst.cobesst.trend);
idx=~isnan(a)&id; a0=o.aa; a0=a0(idx)/mean(a0(idx));
a0=mean(mean(a(idx).*a0));
subplot(row, col, i); a(idm==1)=NaN; colormap(cmap);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co); title('HadISST','FontSize',fsize);
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
titl=sprintf('(c) COBE SST (avg=%4.2fKdec^{-1})',a0); 
title(titl,'FontSize',fsize-1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%COBE2SST observed trend%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1; i=4; a=squeeze(vm(1).sst.cobe2sst.trend);
idx=~isnan(a)&id; a0=o.aa; a0=a0(idx)/mean(a0(idx));
a0=mean(mean(a(idx).*a0));
subplot(row, col, i); a(idm==1)=NaN; colormap(cmap);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co); title('HadISST','FontSize',fsize);
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
titl=sprintf('(d) COBE2 SST (avg=%4.2fKdec^{-1})',a0); 
title(titl,'FontSize',fsize-1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AMIP ensemble mean%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1; i=5; a=mod_org; a=squeeze(mean(a,1));
a0=mean(mean(a(id).*aa0));
subplot(row, col, i); a(idm==1)=NaN; colormap(cmap);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co); 
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
titl=sprintf('(e) ENS mean (avg=%4.2fKdec^{-1})',a0); 
title(titl,'FontSize',fsize-1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a=p.vname; a=strrep(a,'_',' '); %sgtitle(a);
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
