%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load the results for plotting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_spear/';
y1=1979; y2=2020; %y1=2021; y2=2070;
fn=strcat('spear_sst_trend_',num2str(y1),'_',num2str(y2),'.mat');
fn=strcat(tpath,fn); load(fn);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Fig 2: plot trend for each member of SPEAR LE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ice_th=0.1; land_th=0.1;
s=v.s; aa=s.aa; lm=s.lm>land_th; lon=s.lon; lat=s.lat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.xsize=1100; p.ysize=1000; 
p.x1=0; p. x2=360; p.y1=-90; p.y2=90;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, p.xsize, p.ysize]*1.2; fsize=6; 
handle=figure('Position',pms,'visible','on'); 
row=7; col=5; cmap=bluewhitered_miz(256); co='k';
p.do_norm=0;
a=strcat('sst_trend_ann_all_member_',num2str(y1),'_',num2str(y2));
if p.do_norm
  p.unit='\rm{K K^{-1}}'; p.vname=strcat(a,'_norm'); cmin=-1.5; cmax=1.5; %normalization
else
  p.unit='\rm{K dec^{-1}}'; p.vname=a; cmin=-0.6; cmax=0.6; %no normalization
end
p.mod_name='spear'; %p.mod_name='hadisst';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%mod_num=30; %idm=v.idm; id=v.id; %aa0=aa(id)/mean(aa(id));
m=13;
a=v.obs.hadisst; b=squeeze(a.trend(m,:,:)); bi=squeeze(a.ice_clm(m,:,:));
im=(bi>ice_th); id=lm|im; id=~id; aa0=aa(id)/mean(aa(id)); %open ocean area-weighting
b0=mean(b(id).*aa0); idb=id;
i=1; %HadISST%%%%%%%%%%%%%%%
a=b; a0=b0; ida=idb; 
if p.do_norm; a=(a-a0)/a0; b=(b-b0)/b0; end
subplot(row, col, i); colormap(cmap); a(~id)=NaN;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co);
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
id=ida&idb; c=corrcoef(a(id),b(id));
titl=sprintf('HadISST (avg=%4.2fK; r=%4.2f)',a0,c(1,2));
title(titl,'FontSize',fsize);
i=2; %ERSST%%%%%%%%%%%%%%%%%
x=v.obs.ersst; a=squeeze(x.trend(m,:,:)); ai=squeeze(x.ice_clm(m,:,:));
im=(ai>ice_th); id=lm|im|isnan(a); id=~id; aa0=aa(id)/mean(aa(id)); %open ocean area-weighting
a0=mean(a(id).*aa0); ida=id; if p.do_norm; a=(a-a0)/a0; end
subplot(row, col, i); colormap(cmap); a(~id)=NaN;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co);
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
id=ida&idb; c=corrcoef(a(id),b(id));
titl=sprintf('ERSST (avg=%4.2fK; r=%4.2f)',a0,c(1,2));
title(titl,'FontSize',fsize);
i=3; %COBESST%%%%%%%%%%%%%%%%%
x=v.obs.cobesst; a=squeeze(x.trend(m,:,:)); ai=squeeze(x.ice_clm(m,:,:));
im=(ai>ice_th); id=lm|im|isnan(a); id=~id; aa0=aa(id)/mean(aa(id)); %open ocean area-weighting
a0=mean(a(id).*aa0); ida=id; if p.do_norm; a=(a-a0)/a0; end
subplot(row, col, i); colormap(cmap); a(~id)=NaN;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co);
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
id=ida&idb; c=corrcoef(a(id),b(id));
titl=sprintf('ERSST (avg=%4.2fK; r=%4.2f)',a0,c(1,2));
title(titl,'FontSize',fsize);
i=4; %COBE2SST%%%%%%%%%%%%%%%%%
x=v.obs.cobe2sst; a=squeeze(x.trend(m,:,:)); ai=squeeze(x.ice_clm(m,:,:));
im=(ai>ice_th); id=lm|im|isnan(a); id=~id; aa0=aa(id)/mean(aa(id)); %open ocean area-weighting
a0=mean(a(id).*aa0); ida=id; if p.do_norm; a=(a-a0)/a0; end
subplot(row, col, i); colormap(cmap); a(~id)=NaN;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co);
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
id=ida&idb; c=corrcoef(a(id),b(id));
titl=sprintf('ERSST (avg=%4.2fK; r=%4.2f)',a0,c(1,2));
title(titl,'FontSize',fsize);
%i=5; SPEAR LE ensemble mean%%%
for i = 1:31
  a=squeeze(v.mod(i).trend(m,:,:)); ai=squeeze(v.mod(i).ice_clm(m,:,:));
  im=(ai>ice_th); id=lm|im|isnan(a); id=~id; aa0=aa(id)/mean(aa(id)); %open ocean area-weighting
  a0=mean(a(id).*aa0); ida=id;
  if p.do_norm; a=(a-a0)/a0; end;
  if (i==31); i=0; end;
  subplot(row, col, i+5); colormap(cmap); a(~id)=NaN;
  pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
  contour(lon,lat,lm,1,co);
  set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
  id=ida&idb; c=corrcoef(a(id),b(id));
  titl=sprintf('M%02d (avg=%4.2fK; r=%4.2f)',i,a0,c(1,2));
  title(titl,'FontSize',fsize);
end
titl=sprintf('ENS mean (avg=%4.2fK; r=%4.2f)',a0,c(1,2));
title(titl,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=p.vname; a=strrep(a,'_',' '); sgtitle(upper(a));
cb = colorbar('FontSize',fsize+4,'Location','southoutside');
set(cb, 'Position', [.165 .04 .7 .02]); caxis([cmin, cmax+0.001]); 
colormap(cmap); 
cb.Label.String = p.unit; pos=get(cb,'Position')
cb.Label.Position = [pos(1)-0.165 pos(2)+1.75]; 
cb.Label.Rotation = 0;
vname = p.vname; mod_name=p.mod_name; 
visfig='off'; figpath='./fig_cre/';
printnew(visfig,figpath,mod_name,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
