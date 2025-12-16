function plot_pattern_effect_Fig2_suppl3(p)
%let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
%     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
let=p.let; %s1=p.s1; s2=p.s2; s3=p.s3; s4=p.s4; s5=p.s5; s6=p.s6;s7=p.s7; s8=p.s8;
lon=p.lon; lat=p.lat; lm=p.lm; co=p.co; len=0.16; wid=0.02;
cmin1=p.cmin1; cmax1=p.cmax1; cmin2=p.cmin2; cmax2=p.cmax2;
mk='.'; ms=1; mc=0.1*[1 1 1]; ds=100;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1600, 1000]*1; fsize=8; row=4; col=4; minus=char(8212);
handle = figure('Position', pms,'visible','on'); i=1; unit=p.unit;
nn=256;  cmap=bluewhitered_miz(nn); colormap(cmap); %colormap(jet); 
subplot(row,col,i); a=p.v1; b=p.dv1; sx=let(i)+p.s1; i=i+1; a1=a; b1=b;
pcolor(p.lon0,p.lat0,a); hold on; shading flat; caxis([cmin1 cmax1]);
if p.do_add; contour(p.lon0,p.lat0,p.v1_add,p.v1_addbin,p.v1_co,'showtext',p.show);end;
contour(p.lon0,p.lat0,p.lm0,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit0); s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=p.v2; b=p.dv2; sx=let(i)+p.s2; i=i+1; a2=a; b2=b;
pcolor(p.lon0,p.lat0,a); hold on; shading flat;  caxis([cmin1 cmax1]);
if p.do_add; contour(p.lon0,p.lat0,p.v1_add,p.v1_addbin,p.v1_co,'showtext',p.show);end;
contour(p.lon0,p.lat0,p.lm0,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit0); s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=p.v3; b=p.dv3; sx=let(i)+p.s3; i=i+1; a3=a; b3=b;
pcolor(p.lon0,p.lat0,a); hold on; shading flat;  caxis([cmin1 cmax1]);
if p.do_add; contour(p.lon0,p.lat0,p.v1_add,p.v1_addbin,p.v1_co,'showtext',p.show);end;
contour(p.lon0,p.lat0,p.lm0,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit0); s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=p.v4; b=p.dv4; sx=let(i)+p.s4; i=i+1; a4=a; b4=b;
pcolor(p.lon0,p.lat0,a); hold on; shading flat;  caxis([cmin1 cmax1]);
if p.do_add; contour(p.lon0,p.lat0,p.v1_add,p.v1_addbin,p.v1_co,'showtext',p.show);end;
contour(p.lon0,p.lat0,p.lm0,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit0); s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.93 0.765 wid len]); caxis([cmin1, cmax1]); 
cb0.Label.String = 'K/K'; pos=get(cb0,'Position');
cb0.Label.Position = [pos(1)-0.3 pos(2)+1.1]; 
cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v5; b=p.dv5; isig=p.isig5; sx=let(i)+p.s5; i=i+1; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); [xx,yy] = meshgrid(lon,lat);
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=p.v6; b=p.dv6; isig=p.isig6; sx=let(i)+p.s6; i=i+1; a6=a; b6=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=p.v7; b=p.dv7; isig=p.isig7; sx=let(i)+p.s7; i=i+1; a7=a; b7=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=p.v8; b=p.dv8; isig=p.isig8; sx=let(i)+p.s8; i=i+1; a8=a; b8=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.93 0.545 wid len]); caxis([cmin1, cmax1]); 
cb0.Label.String = '%/K'; pos=get(cb0,'Position');
cb0.Label.Position = [pos(1)-0.3 pos(2)+1.3]; 
cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v9; b=p.dv9; isig=p.isig9; sx=let(i)+p.s9; i=i+1; a9=a; b9=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=p.v10; b=p.dv10; isig=p.isig10; sx=let(i)+p.s10; i=i+1; a10=a; b10=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=p.v11; b=p.dv11; isig=p.isig11; sx=let(i)+p.s11; i=i+1; a11=a; b11=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=p.v12; b=p.dv12; isig=p.isig12; sx=let(i)+p.s12; i=i+1; a12=a; b12=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.93 0.325 wid len]); caxis([cmin1, cmax1]); 
cb0.Label.String = '%/K'; pos=get(cb0,'Position');
cb0.Label.Position = [pos(1)-0.3 pos(2)+1.5]; 
cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v13; b=p.dv13; isig=p.isig13; sx=let(i)+p.s13; i=i+1; a13=a; b13=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co); 
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=p.v14; b=p.dv14; isig=p.isig14; sx=let(i)+p.s14; i=i+1; a14=a; b14=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co); 
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=p.v15; b=p.dv15; isig=p.isig15; sx=let(i)+p.s15; i=i+1; a15=a; b15=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co); 
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=p.v16; b=p.dv16; isig=p.isig16; sx=let(i)+p.s16; i=i+1; a16=a; b16=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin2 cmax2]);
contour(lon,lat,lm,1,co); 
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.93 0.106 wid len]); caxis([cmin2 cmax2]); 
cb0.Label.String = '%/K'; pos=get(cb0,'Position');
cb0.Label.Position = [pos(1)-0.3 pos(2)+3.6]; 
cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%cb=colorbar('FontSize',fsize+2,'Location','southoutside');
%set(cb, 'Position', [.165 .04 .7 .02]); caxis([cmin1, cmax1]); 
%cb.Label.String = p.unit_bar; %title(cb, unit,'FontSize',fsize+2);
%pos=get(cb,'Position')
%cb.Label.Position = [pos(1)/2+p.pos1 pos(2)+1.7];  %for radiation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%nn=256;  cmap=bluewhitered_miz(nn); colormap(cmap);
%nn=256; cmap=cbrewer('div','BrBG',nn); colormap(cmap);
%nn=256; cmap=cbrewer('div','Spectral',nn); colormap(cmap);
%nn=256; cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
expn=p.expn; visfig='off'; figpath='./fig_cre/';
printnew(visfig,figpath,expn,p.vname);
return
