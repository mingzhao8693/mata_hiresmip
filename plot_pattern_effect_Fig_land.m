function plot_pattern_effect_Fig_land(p)
%let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
%     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
let=p.let; %s1=p.s1; s2=p.s2; s3=p.s3; s4=p.s4; s5=p.s5; s6=p.s6;s7=p.s7; s8=p.s8;
lon=p.lon; lat=p.lat; lm=p.lm; co=p.co; len=0.16; wid=0.02;

mk='.'; ms=1; mc=0.1*[1 1 1]; ds=100;
%a=''; p.unit0_bar=a; p.unit1_bar=a; p.unit3_bar=a; p.unit4_bar=a;
%p.unit6_bar=a; p.unit7_bar=a; p.unit9_bar=a; p.unit10_bar=a;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 1000]*1.2; fsize=9; row=4; col=4; minus=char(8212);
handle = figure('Position', pms,'visible','on'); i=1; unit=p.unit1;
nn=256;  cmap=bluewhitered_miz(nn); colormap(cmap); %colormap(jet); 
if p.flipcmap; colormap(flipud(cmap)); end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%v0 v1 v2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v0; b=p.dv0; a(~p.id)=NaN; sx=let(i)+p.s0; i=i+1; a1=a; b1=b;
pcolor(p.lon,p.lat,a); hold on; shading flat; caxis([p.cmin0 p.cmax0]);
%if p.do_add; contour(p.lon0,p.lat0,p.v1_add,p.v1_addbin,p.v1_co,'showtext',p.show);end;
contour(p.lon,p.lat,p.lm,1,co); axis(p.xy)
s=sprintf('%s (%5.3f%s)',sx,b,p.unit0); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.08 0.765 wid len]); caxis([p.cmin0, p.cmax0]);
set(get(cb0,'title'),'string',p.unit0_bar,'Rotation',0.0);
%cb0.Label.String = p.unit0_bar; pos=get(cb0,'Position'); pos
%cb0.Label.Position = [pos(1)-0.3 pos(2)+a]; 
%cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v1; b=p.dv1; a(~p.id)=NaN; isig=p.isig1; sx=let(i)+p.s1; i=i+1; a1=a; b1=b;
pcolor(p.lon,p.lat,a); hold on; shading flat; caxis([p.cmin1 p.cmax1]);
%if p.do_add; contour(p.lon0,p.lat0,p.v1_add,p.v1_addbin,p.v1_co,'showtext',p.show);end;
contour(p.lon,p.lat,p.lm,1,co); axis(p.xy); [xx,yy] = meshgrid(lon,lat);
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit1); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=p.v2; b=p.dv2; a(~p.id)=NaN; isig=p.isig2; sx=let(i)+p.s2; i=i+1; a2=a; b2=b;
pcolor(p.lon,p.lat,a); hold on; shading flat;  caxis([p.cmin1 p.cmax1]);
%if p.do_add; contour(p.lon0,p.lat0,p.v1_add,p.v1_addbin,p.v1_co,'showtext',p.show);end;
contour(p.lon,p.lat,p.lm,1,co); axis(p.xy); [xx,yy] = meshgrid(lon,lat);
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit1); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=a2-a1; b=b2-b1; a(~p.id)=NaN; isig=p.isig2; sx=let(i)+p.s2; i=i+1; a2=a; b2=b;
pcolor(p.lon,p.lat,a); hold on; shading flat;  caxis([p.cmin1 p.cmax1]);
%if p.do_add; contour(p.lon0,p.lat0,p.v1_add,p.v1_addbin,p.v1_co,'showtext',p.show);end;
contour(p.lon,p.lat,p.lm,1,co); axis(p.xy); [xx,yy] = meshgrid(lon,lat);
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit1); %s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.93 0.765 wid len]); caxis([p.cmin1, p.cmax1]); a=0.5;
set(get(cb0,'title'),'string',p.unit1_bar,'Rotation',0.0);
%cb0.Label.String = p.unit1_bar; pos=get(cb0,'Position'); pos
%cb0.Label.Position = [pos(1)-0.3 pos(2)+a]; 
%cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%v3 v4 v5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v3; b=p.dv3; a(~p.id)=NaN; sx=let(i)+p.s3; i=i+1; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin3 p.cmax3]);
contour(lon,lat,lm,1,co); axis(p.xy); [xx,yy] = meshgrid(lon,lat);
s=sprintf('%s (%5.3f%s)',sx,b,p.unit3); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.08 0.545 wid len]); caxis([p.cmin3, p.cmax3]); a=-0.01;
set(get(cb0,'title'),'string',p.unit3_bar,'Rotation',0.0);
%cb0.Label.String = p.unit3_bar; pos=get(cb0,'Position');
%cb0.Label.Position = [pos(1)-0.3 pos(2)+a]; 
%cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v4; b=p.dv4; a(~p.id)=NaN; isig=p.isig4; sx=let(i)+p.s4; i=i+1; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin4 p.cmax4]);
contour(lon,lat,lm,1,co); axis(p.xy); [xx,yy] = meshgrid(lon,lat);
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit4); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=p.v5; b=p.dv5; a(~p.id)=NaN; isig=p.isig5; sx=let(i)+p.s5; i=i+1; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin4 p.cmax4]);
contour(lon,lat,lm,1,co); axis(p.xy)
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit4); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.93 0.545 wid len]); caxis([p.cmin4, p.cmax4]); a=-0.01;
set(get(cb0,'title'),'string',p.unit4_bar,'Rotation',0.0);
%cb0.Label.String = p.unit4_bar; pos=get(cb0,'Position');
%cb0.Label.Position = [pos(1)-0.3 pos(2)+a]; 
%cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%v6 v7 v8
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v6; a(~p.id)=NaN; b=p.dv6; sx=let(i)+p.s6; i=i+1;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin6 p.cmax6]);
contour(lon,lat,lm,1,co); axis(p.xy);
s=sprintf('%s (%5.3f%s)',sx,b,p.unit6); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.08 0.325 wid len]); caxis([p.cmin6, p.cmax6]); a=3.5;%1.2*4;
set(get(cb0,'title'),'string',p.unit6_bar,'Rotation',0.0);
%cb0.Label.String = p.unit6_bar; pos=get(cb0,'Position');
%cb0.Label.Position = [pos(1)-0.3 pos(2)+a]; 
%cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v7; b=p.dv7; a(~p.id)=NaN; isig=p.isig7; sx=let(i)+p.s7; i=i+1; a7=a; b7=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin7 p.cmax7]);
contour(lon,lat,lm,1,co); axis(p.xy);
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit7); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=p.v8; b=p.dv8; a(~p.id)=NaN; isig=p.isig8; sx=let(i)+p.s8; i=i+1; a8=a; b8=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin7 p.cmax7]);
contour(lon,lat,lm,1,co); axis(p.xy);
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit7); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.93 0.325 wid len]); caxis([p.cmin7, p.cmax7]); a=3.5;%1.2*4;
set(get(cb0,'title'),'string',p.unit7_bar,'Rotation',0.0);
%cb0.Label.String = p.unit7_bar; pos=get(cb0,'Position');
%cb0.Label.Position = [pos(1)-0.3 pos(2)+a]; 
%cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%v9 v10 v11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v9; b=p.dv9; a(~p.id)=NaN; sx=let(i)+p.s9; i=i+1; a10=a; b10=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin9 p.cmax9]);
contour(lon,lat,lm,1,co); axis(p.xy);
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit9); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.08 0.106 wid len]); caxis([p.cmin9 p.cmax9]); a=3.8; %1.25*4;
set(get(cb0,'title'),'string',p.unit9_bar,'Rotation',0.0);
%cb0.Label.String = p.unit9_bar; pos=get(cb0,'Position');
%cb0.Label.Position = [pos(1)-0.3 pos(2)+a]; 
%cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v10; b=p.dv10; a(~p.id)=NaN; isig=p.isig10; sx=let(i)+p.s10; i=i+1; a10=a; b10=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin10 p.cmax10]);
contour(lon,lat,lm,1,co); axis(p.xy);
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit10); 
title(s,'FontSize',fsize,'Interpreter','latex');
subplot(row,col,i); a=p.v11; b=p.dv11; a(~p.id)=NaN; isig=p.isig11; sx=let(i)+p.s11; i=i+1; a11=a; b11=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([p.cmin10 p.cmax10]);
contour(lon,lat,lm,1,co); axis(p.xy);
stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit10); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.93 0.106 wid len]); caxis([p.cmin10 p.cmax10]); a=3.8; %1.25*4;
set(get(cb0,'title'),'string',p.unit10_bar,'Rotation',0.0);
%cb0.Label.String = p.unit10_bar; pos=get(cb0,'Position');
%cb0.Label.Position = [pos(1)-0.3 pos(2)+a]; 
%cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%nn=256;  cmap=bluewhitered_miz(nn); colormap(cmap);
%nn=256; cmap=cbrewer('div','BrBG',nn); colormap(cmap);
%nn=256; cmap=cbrewer('div','Spectral',nn); colormap(cmap);
%nn=256; cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
expn='pattern_effect'; visfig='off'; figpath='./fig_land/';
printnew(visfig,figpath,expn,p.vname);
return
