function plot_pattern_effect_Fig_atm_12panel(p)
%let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
%     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
let=p.let; %s1=p.s1; s2=p.s2; s3=p.s3; s4=p.s4; s5=p.s5; s6=p.s6;s7=p.s7; s8=p.s8;
lon=p.lon; lat=p.lat; lm=p.lm; co=p.co; len=0.16; wid=0.02;
mk='.'; ms=1; mc=0.1*[1 1 1]; ds=100; cfact=p.cfact; n=5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1300, 1000]*1.2; fsize=9; row=4; col=3; minus=char(8212);
handle = figure('Position', pms,'visible','on'); i=1; unit=p.unit0;
nn=256;  cmap=bluewhitered_miz(nn); colormap(cmap); %colormap(jet); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%v0 v1 v2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.z0; b=p.dz0; sx=let(i)+p.s0; i=i+1; a0=a; b0=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([p.cmin0 p.cmax0]);
if p.do_add;
  add.z=p.z0; add.u=p.u0; add.v=p.v0; add.zbin=p.z0_bin; add.ubin=p.u0_bin;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
%  quiver(lon(1:n:end),lat(1:n:end),p.u1(1:n:end,1:n:end),p.v1(1:n:end,1:n:end),cfact,'y');
%  pcolor(lon,lat,p.tas1); caxis([-3 3]); shading flat; colorbar;
%  [phi psi] = flowfun(lon,lat,p.u1',p.v1'); %contour(lon,lat,psi',20,'k'); hold on; 
%  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end;
contour(lon,lat,p.lm,1,co); axis(p.xy);
s=sprintf('%s (%5.3f%s)',sx,b,p.unit0); s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.08 0.765 wid len]); caxis([p.cmin0, p.cmax0]); 
set(get(cb0,'title'),'string',p.unit0_bar,'Rotation',0.0);
%cb0.Label.String = p.unit0_bar; pos=get(cb0,'Position'); a=1.3; b=-3.3; pos
%cb0.Label.Position = [pos(1)+a pos(2)+b]; cb0.Label.Position
%cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.z1; b=p.dz1; sx=let(i)+p.s1; i=i+1; a1=a; b1=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([p.cmin1 p.cmax1]);
if p.do_add;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
  quiver(lon(1:n:end),lat(1:n:end),p.u1(1:n:end,1:n:end),p.v1(1:n:end,1:n:end),cfact,'y');
%  pcolor(lon,lat,p.tas1); caxis([-3 3]); shading flat; colorbar;
%  [phi psi] = flowfun(lon,lat,p.u1',p.v1'); %contour(lon,lat,psi',20,'k'); hold on; 
%  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end;
contour(lon,lat,p.lm,1,co); axis(p.xy);
s=sprintf('%s (%5.3f%s)',sx,b,p.unit1); s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.z2; b=p.dz2; sx=let(i)+p.s2; i=i+1; a2=a; b2=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin1 p.cmax1]);
if p.do_add;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
  quiver(lon(1:n:end),lat(1:n:end),p.u2(1:n:end,1:n:end),p.v2(1:n:end,1:n:end),cfact,'y');
%  [phi psi] = flowfun(lon,lat,p.u1',p.v1'); %contour(lon,lat,psi',20,'k'); hold on; 
%  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end;
contour(lon,lat,p.lm,1,co); axis(p.xy);
s=sprintf('%s (%5.3f%s)',sx,b,p.unit1); s=sprintf('%s',sx); 
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.93 0.765 wid len]); caxis([p.cmin1, p.cmax1]);
set(get(cb0,'title'),'string',p.unit1_bar,'Rotation',0.0);
%cb0.Label.String = p.unit1_bar; pos=get(cb0,'Position');
%cb0.Label.Position = [pos(1)-0.3 pos(2)+a]; 
%cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%v3 v4 v5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.u3; b=p.du3; sx=let(i)+p.s3; i=i+1; a3=a; b3=b;n=5;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin3 p.cmax3]);
contour(lon,lat,lm,1,co); axis(p.xy); [xx,yy] = meshgrid(lon,lat);
if p.do_add
  add.z=p.z3; add.u=p.u3; add.v=p.v3; add.zbin=p.z3_bin; add.ubin=p.u3_bin;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
%  [phi psi] = flowfun(lon,lat,p.u6',p.v6'); %contour(lon,lat,psi',20,'k'); hold on; 
%  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end
s=sprintf('%s (%5.3f%s)',sx,b,p.unit3); s=sprintf('%s',sx);
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.08 0.545 wid len]); caxis([p.cmin3, p.cmax3]); a=-0.01;
set(get(cb0,'title'),'string',p.unit3_bar,'Rotation',0.0);
%cb0.Label.String = p.unit3_bar; pos=get(cb0,'Position');
%cb0.Label.Position = [pos(1)-0.3 pos(2)+a]; 
%cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.u4; b=p.du4; sx=let(i)+p.s4; i=i+1; a4=a; b5=4;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin4 p.cmax4]);
contour(lon,lat,lm,1,co); axis(p.xy)
if p.do_add;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
  quiver(lon(1:n:end),lat(1:n:end),p.u4(1:n:end,1:n:end),p.v4(1:n:end,1:n:end),cfact,'y');
%  [phi psi] = flowfun(lon,lat,p.u7',p.v7'); %contour(lon,lat,psi',20,'k'); hold on; 
%  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end
s=sprintf('%s (%5.3f%s)',sx,b,p.unit4); s=sprintf('%s',sx);
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.u5; b=p.du5; sx=let(i)+p.s5; i=i+1; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin4 p.cmax4]);
contour(lon,lat,lm,1,co); axis(p.xy)
if p.do_add;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
  quiver(lon(1:n:end),lat(1:n:end),p.u5(1:n:end,1:n:end),p.v5(1:n:end,1:n:end),cfact,'y');
%  [phi psi] = flowfun(lon,lat,p.u8',p.v8'); %contour(lon,lat,psi',20,'k'); hold on; 
%  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end
s=sprintf('%s (%5.3f%s)',sx,b,p.unit4); s=sprintf('%s',sx);
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
subplot(row,col,i); a=p.u6; b=p.du6; sx=let(i)+p.s6; i=i+1; a6=a; b6=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin6 p.cmax6]);
contour(lon,lat,lm,1,co); axis(p.xy);
if p.do_add;
  add.z=p.z6; add.u=p.u6; add.v=p.v6; add.zbin=p.z6_bin; add.ubin=p.u6_bin; 
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
end;
s=sprintf('%s (%5.3f%s)',sx,b,p.unit6); s=sprintf('%s',sx);
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.08 0.325 wid len]); caxis([p.cmin6, p.cmax6]); a=3.5;%1.2*4;
set(get(cb0,'title'),'string',p.unit6_bar,'Rotation',0.0);
%cb0.Label.String = p.unit6_bar; pos=get(cb0,'Position');
%cb0.Label.Position = [pos(1)-0.3 pos(2)+a]; 
%cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.u7; b=p.du7; sx=let(i)+p.s7; i=i+1; a7=a; b7=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin7 p.cmax7]);
contour(lon,lat,lm,1,co); axis(p.xy);
if p.do_add;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
  quiver(lon(1:n:end),lat(1:n:end),p.u7(1:n:end,1:n:end),p.v7(1:n:end,1:n:end),cfact,'y');
%   [phi psi] = flowfun(lon,lat,p.u12',p.v12'); %contour(lon,lat,psi',20,'k'); hold on; 
%   contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%   contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end;
s=sprintf('%s (%5.3f%s)',sx,b,p.unit7); s=sprintf('%s',sx);
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.u8; b=p.du8; sx=let(i)+p.s8; i=i+1; a8=a; b8=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin7 p.cmax7]);
contour(lon,lat,lm,1,co); axis(p.xy);
if p.do_add;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
  quiver(lon(1:n:end),lat(1:n:end),p.u8(1:n:end,1:n:end),p.v8(1:n:end,1:n:end),cfact,'y');
%   [phi psi] = flowfun(lon,lat,p.u13',p.v13'); %contour(lon,lat,psi',20,'k'); hold on; 
%   contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%   contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end;
s=sprintf('%s (%5.3f%s)',sx,b,p.unit7); s=sprintf('%s',sx);
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
subplot(row,col,i); a=p.z9; b=p.dz9; sx=let(i)+p.s9; i=i+1; a9=a; b9=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin9 p.cmax9]);
contour(lon,lat,lm,1,co); axis(p.xy);
if p.do_add;
  add.z=p.z9; add.u=p.u9; add.v=p.v9; add.zbin=p.z9_bin;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
end;
s=sprintf('%s (%5.3f%s)',sx,b,p.unit9); s=sprintf('%s',sx);
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb0=colorbar('FontSize',fsize,'Location','eastoutside');
set(cb0, 'Position', [0.08 0.106 wid len]); caxis([p.cmin9 p.cmax9]); a=3.8; %1.25*4;
set(get(cb0,'title'),'string',p.unit9_bar,'Rotation',0.0);
%cb0.Label.String = p.unit9_bar; pos=get(cb0,'Position');
%cb0.Label.Position = [pos(1)-0.3 pos(2)+a]; 
%cb0.Label.Rotation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.z10; b=p.dz10; sx=let(i)+p.s10; i=i+1; a10=a; b10=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([p.cmin10 p.cmax10]);
contour(lon,lat,lm,1,co); axis(p.xy);
if p.do_add;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
  quiver(lon(1:n:end),lat(1:n:end),p.u10(1:n:end,1:n:end),p.v10(1:n:end,1:n:end),cfact,'y');
  %contour(lon,lat,p.u16,p.u16_addbin,'y-','showtext',p.show);
end;
s=sprintf('%s (%5.3f%s)',sx,b,p.unit10); s=sprintf('%s',sx);
title(s,'FontSize',fsize,'Interpreter','latex');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.z11; b=p.dz11; sx=let(i)+p.s11; i=i+1; a11=a; b11=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([p.cmin10 p.cmax10]);
contour(lon,lat,lm,1,co); axis(p.xy);
if p.do_add;
  %contour(lon,lat,add.z,add.zbin,p.z1_co,'showtext',p.show);
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
  quiver(lon(1:n:end),lat(1:n:end),p.u11(1:n:end,1:n:end),p.v11(1:n:end,1:n:end),cfact,'y');
end;
s=sprintf('%s (%5.3f%s)',sx,b,p.unit10); s=sprintf('%s',sx);
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
