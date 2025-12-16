function plot_2d_6panel_drought(p)
%let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
%     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
let=p.let; %s1=p.s1; s2=p.s2; s3=p.s3; s4=p.s4; s5=p.s5; s6=p.s6;s7=p.s7; s8=p.s8;
lon=p.lon; lat=p.lat; lm=p.lm; co=p.co; len=0.16; wid=0.02;
cmin1=p.cmin1; cmax1=p.cmax1; cmin2=p.cmin2; cmax2=p.cmax2;
%cmin3=p.cmin3; cmax3=p.cmax3; cmin4=p.cmin4; cmax4=p.cmax4;
mk='.'; ms=3; mc=0.1*[1 1 1]; ds=100;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1000, 750]*1; fsize=9; row=3; col=2; minus=char(8212);
handle = figure('Position', pms,'visible','on'); i=1; unit=p.unit;
x0=0.08; y0=0.72; wx=0.4; wy=0.23; dx=0.05+0.0; dy=0.07;
p1= [x0,          y0,           wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,           wx, wy];%position of first subplot
p3= [x0,          y0-(wy+dy),   wx, wy];%position of first subplot
p4= [x0+wx+dx,    y0-(wy+dy),   wx, wy];%position of first subplot
p5= [x0,          y0-2*(wy+dy), wx, wy];%position of first subplot
p6= [x0+wx+dx,    y0-2*(wy+dy), wx, wy];%position of first subplot
nn=256;  cmap=bluewhitered_miz(nn); colormap(cmap); %colormap(jet); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot('Position',p1); a=p.v1; b=p.dv1; isig=p.isig1; sx=let(i)+p.s1; i=i+1; 
pcolor(p.lon,p.lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
if p.do_add; contour(p.lon,p.lat,p.v1_add,p.v1_addbin,p.co_add,'showtext',p.show);end;
contour(p.lon,p.lat,p.lm,1,co); [xx,yy] = meshgrid(lon,lat);
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s%s (%5.3f%s)',sx,p.varn,b,p.unit); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot('Position',p2); a=p.v2; b=p.dv2; isig=p.isig2; sx=let(i)+p.s2; i=i+1; 
pcolor(p.lon,p.lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
if p.do_add; contour(p.lon,p.lat,p.v1_add,p.v1_addbin,p.co_add,'showtext',p.show);end;
contour(p.lon,p.lat,p.lm,1,co); [xx,yy] = meshgrid(lon,lat);
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s%s (%5.3f%s)',sx,p.varn,b,p.unit0); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot('Position',p3); a=p.v3; b=p.dv3; isig=p.isig3; sx=let(i)+p.s3; i=i+1; 
pcolor(p.lon,p.lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
if p.do_add; contour(p.lon,p.lat,p.v1_add,p.v1_addbin,p.co_add,'showtext',p.show);end;
contour(p.lon,p.lat,p.lm,1,co); [xx,yy] = meshgrid(lon,lat);
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s%s (%5.3f%s)',sx,p.varn,b,p.unit0); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot('Position',p4); a=p.v4; b=p.dv4; isig=p.isig4; sx=let(i)+p.s4; i=i+1; 
pcolor(p.lon,p.lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
if p.do_add; contour(p.lon,p.lat,p.v1_add,p.v1_addbin,p.co_add,'showtext',p.show);end;
contour(p.lon,p.lat,p.lm,1,co); [xx,yy] = meshgrid(lon,lat);
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s%s (%5.3f%s)',sx,p.varn,b,p.unit0); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot('Position',p5); a=p.v5; b=p.dv5; isig=p.isig5; sx=let(i)+p.s5; i=i+1; 
pcolor(p.lon,p.lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
if p.do_add; contour(p.lon,p.lat,p.v1_add,p.v1_addbin,p.co_add,'showtext',p.show);end;
contour(p.lon,p.lat,p.lm,1,co); [xx,yy] = meshgrid(lon,lat);
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s%s (%5.3f%s)',sx,p.varn,b,p.unit0); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot('Position',p6); a=p.v6; b=p.dv6; isig=p.isig6; sx=let(i)+p.s6; i=i+1; 
pcolor(p.lon,p.lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
if p.do_add; contour(p.lon,p.lat,p.v1_add,p.v1_addbin,p.co_add,'showtext',p.show);end;
contour(p.lon,p.lat,p.lm,1,co); [xx,yy] = meshgrid(lon,lat);
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s%s (%5.3f%s)',sx,p.varn,b,p.unit0); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%a=p.vname; a=strrep(a,'_',' '); sgtitle(upper(a));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb = colorbar('FontSize',fsize,'Location','southoutside');
set(cb, 'Position', [.165 .04 .7 .02]); caxis([cmin1, cmax1+0.001]); 
colormap(cmap);
cb.Label.String = p.unit_bar; pos=get(cb,'Position')
cb.Label.Position = [pos(1)-0.16 pos(2)+2.75]; 
cb.Label.Rotation = 0;
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
expn='pattern_effect'; visfig='off'; figpath='./fig_cre/';
printnew(visfig,figpath,expn,p.vname);
return
