function plot_2d_12panel_new(p)
%let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
%     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
let=p.let; s1=p.s1; s2=p.s2; s3=p.s3; s4=p.s4; s5=p.s5; s6=p.s6;s7=p.s7; s8=p.s8;
lon=p.lon; lat=p.lat; lm=p.lm; co=p.co;
cmin1=p.cmin1; cmax1=p.cmax1; cmin2=p.cmin2; cmax2=p.cmax2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 900]*1; fsize=7; row=4; col=3; minus=char(8212);
handle = figure('Position', pms,'visible','on'); i=1; unit=p.unit;
nn=256;  cmap=bluewhitered_miz(nn); colormap(cmap); %colormap(jet); 
subplot(row,col,i); a=p.v1; b=p.dT1; sx=let(i)+s1; i=i+1; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%s=%4.2f)',sx,p.tit,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v2; b=p.dT2; sx=let(i)+s2; i=i+1; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%s=%4.2f)',sx,p.tit,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v3; b=p.dT3; sx=let(i)+s3; i=i+1; a3=a; b3=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%s=%4.2f)',sx,p.tit,b); title(s,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v4; b=p.dT4; sx=let(i)+s4; i=i+1; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%s=%4.2f)',sx,p.tit,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v5; b=p.dT5; sx=let(i)+s5; i=i+1; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%s=%4.2f)',sx,p.tit,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v6; b=p.dT6; sx=let(i)+s6; i=i+1; a6=a; b6=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%s=%4.2f)',sx,p.tit,b); title(s,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=a1-a4; b=b1-b4; sx=let(i); i=i+1; a7=a; b7=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (a) %c (d) (%s=%4.2f)',sx,minus,p.tit,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=a2-a5; b=b2-b5; sx=let(i); i=i+1; a8=a; b8=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (b) %c (e) (%s=%4.2f)',sx,minus,p.tit,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=a3-a6; b=b3-b6; sx=let(i); i=i+1; a9=a; b9=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (c) %c (f) (%s=%4.2f)',sx,minus,p.tit,b); title(s,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v7; b=p.dT7; sx=let(i)+s7; i=i+1; a10=a; b10=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%s=%4.2f)',sx,p.tit,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v8; b=p.dT8; sx=let(i)+s8; i=i+1; a11=a; b11=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%s=%4.2f)',sx,p.tit,b); title(s,'FontSize',fsize);
subplot(row,col,i); a=a2-a11; b=b2-b11; sx=let(i); i=i+1; a12=a; b12=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (b) %c (k) (%s=%4.2f)',sx,minus,p.tit,b); title(s,'FontSize',fsize);

cb=colorbar('FontSize',fsize+2,'Location','southoutside');
set(cb, 'Position', [.165 .04 .7 .02]); caxis([cmin1, cmax1]); 
cb.Label.String = unit; %title(cb, unit,'FontSize',fsize+2);
pos=get(cb,'Position')
cb.Label.Position = [pos(1)/2-0.1 pos(2)+1.7];  %for radiation

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%nn=256;  cmap=bluewhitered_miz(nn); colormap(cmap);
%nn=256; cmap=cbrewer('div','BrBG',nn); colormap(cmap);
%nn=256; cmap=cbrewer('div','Spectral',nn); colormap(cmap);
%nn=256; cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
expn='warming_pattern'; visfig='off'; figpath='./fig_cre/';
printnew(visfig,figpath,expn,p.vname);
return
