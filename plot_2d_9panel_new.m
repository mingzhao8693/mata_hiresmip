function plot_2d_9panel_new(p)
%let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
%     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
let=p.let; s1=p.s1; s2=p.s2; s3=p.s3; s4=p.s4;
lon=p.lon; lat=p.lat; lm=p.lm; co=p.co;
cmin1=p.cmin1; cmax1=p.cmax1; cmin2=p.cmin2; cmax2=p.cmax2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 600]*1; fsize=8; row=3; col=3;
handle = figure('Position', pms,'visible','on'); i=1;
nn=256;  cmap=bluewhitered_miz(nn); colormap(cmap); %colormap(jet); 
subplot(row,col,i); a=p.v1; b=p.dT1; sx=let(i)+s1; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v2; b=p.dT2; sx=let(i)+s2; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v1-p.v2; b=p.dT1-p.dT2; sx=let(i); i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (a) minus (b) (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v3; b=p.dT3; sx=let(i)+s3; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v4; b=p.dT4; sx=let(i)+s4; i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v3-p.v4; b=p.dT3-p.dT4; sx=let(i); i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (d) minus (e) (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v3-p.v1; b=p.dT3-p.dT1; sx=let(i); i=i+1;a1=a;b1=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (d) minus (a) (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v4-p.v2; b=p.dT4-p.dT2; sx=let(i); i=i+1;a2=a;b2=b;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (e) minus (b) (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); a=a1-a2; b=b1-b2; sx=let(i); i=i+1;
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (g) minus (h) (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%nn=256;  cmap=bluewhitered_miz(nn); colormap(cmap);
%nn=256; cmap=cbrewer('div','BrBG',nn); colormap(cmap);
%nn=256; cmap=cbrewer('div','Spectral',nn); colormap(cmap);
%nn=256; cmap=cbrewer('seq','Greens',nn); colormap(cmap);
expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
printnew(visfig,figpath,expn,p.vname);
return
