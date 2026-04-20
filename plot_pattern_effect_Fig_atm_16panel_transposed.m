function plot_pattern_effect_Fig_atm_16panel_transposed(p)

let = p.let;
lon = p.lon; lat = p.lat; lm = p.lm; co = p.co;
cfact = p.cfact; n = 5;

row = 4; col = 4; fsize = 9;

figure('Position',[0 0 1400 1000]*1.2,'visible','on');

i = 1;

colormap(bluewhitered_miz(256));

% =========================================================
% ONLY CHANGE: TRUE TRANSPOSE INDEXING
% =========================================================
idx = @(k) (mod(k-1,row)*col + ceil(k/row));

% =========================================================
% ---- BLOCK 1 ----
% =========================================================
subplot(row,col,idx(i));
pcolor(lon,lat,p.z0); shading flat; caxis([p.cmin0 p.cmax0]); hold on;
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
contour(lon,lat,lm,1,co);
axis(p.xy);
title(strcat(let(i), p.s0),'FontSize',fsize,'Interpreter','latex');
colorbar('FontSize',fsize,'Location','eastoutside');
i=i+1;

subplot(row,col,idx(i));
pcolor(lon,lat,p.z1); shading flat; caxis([p.cmin1 p.cmax1]); hold on;
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
contour(lon,lat,lm,1,co);
axis(p.xy);
title(strcat(let(i),p.s1),'FontSize',fsize,'Interpreter','latex');
colorbar('FontSize',fsize,'Location','eastoutside');
i=i+1;

subplot(row,col,idx(i));
pcolor(lon,lat,p.z2); shading flat; caxis([p.cmin1 p.cmax1]); hold on;
if p.do_add;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
  quiver(lon(1:n:end),lat(1:n:end),p.u2(1:n:end,1:n:end),p.v2(1:n:end,1:n:end),cfact,'y');
%  [phi psi] = flowfun(lon,lat,p.u1',p.v1'); %contour(lon,lat,psi',20,'k'); hold on; 
%  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end;
contour(lon,lat,lm,1,co);
axis(p.xy);
title(strcat(let(i),p.s2),'FontSize',fsize,'Interpreter','latex');
colorbar('FontSize',fsize,'Location','eastoutside');
i=i+1;

subplot(row,col,idx(i));
pcolor(lon,lat,p.z2-p.z1); shading flat; caxis([p.cmin1 p.cmax1]); hold on;
if p.do_add;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
%  quiver(lon(1:n:end),lat(1:n:end),p.u2(1:n:end,1:n:end),p.v2(1:n:end,1:n:end),cfact,'y');
%  [phi psi] = flowfun(lon,lat,p.u1',p.v1'); %contour(lon,lat,psi',20,'k'); hold on; 
%  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end;
contour(lon,lat,lm,1,co);
axis(p.xy);
title(strcat(let(i), ' (c) minus (b)'),'FontSize',fsize,'Interpreter','latex');
colorbar('FontSize',fsize,'Location','eastoutside');
i=i+1;

% =========================================================
% BLOCK 2
% =========================================================
subplot(row,col,idx(i));
pcolor(lon,lat,p.u3); shading flat; caxis([p.cmin3 p.cmax3]); hold on;
if p.do_add
  add.z=p.z3; add.u=p.u3; add.v=p.v3; add.zbin=p.z3_bin; add.ubin=p.u3_bin;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
%  [phi psi] = flowfun(lon,lat,p.u6',p.v6'); %contour(lon,lat,psi',20,'k'); hold on; 
%  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end
contour(lon,lat,lm,1,co);
axis(p.xy);
title(strcat(let(i),p.s3),'FontSize',fsize,'Interpreter','latex');
colorbar('FontSize',fsize,'Location','eastoutside');
i=i+1;

subplot(row,col,idx(i));
pcolor(lon,lat,p.u4); shading flat; caxis([p.cmin4 p.cmax4]); hold on;
if p.do_add;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
  quiver(lon(1:n:end),lat(1:n:end),p.u4(1:n:end,1:n:end),p.v4(1:n:end,1:n:end),cfact,'y');
%  contour(lon,lat,add.u+p.u4, add.ubin,'color','y','Linestyle','-', 'showtext',p.show);
%  [phi psi] = flowfun(lon,lat,p.u7',p.v7'); %contour(lon,lat,psi',20,'k'); hold on; 
%  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end
contour(lon,lat,lm,1,co);
axis(p.xy);
title(strcat(let(i),p.s4),'FontSize',fsize,'Interpreter','latex');
colorbar('FontSize',fsize,'Location','eastoutside');
i=i+1;

subplot(row,col,idx(i));
pcolor(lon,lat,p.u5); shading flat; caxis([p.cmin4 p.cmax4]); hold on;
if p.do_add;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
  quiver(lon(1:n:end),lat(1:n:end),p.u4(1:n:end,1:n:end),p.v4(1:n:end,1:n:end),cfact,'y');
%  contour(lon,lat,add.u+p.u4, add.ubin,'color','y','Linestyle','-', 'showtext',p.show);
%  [phi psi] = flowfun(lon,lat,p.u7',p.v7'); %contour(lon,lat,psi',20,'k'); hold on; 
%  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end
contour(lon,lat,lm,1,co);
axis(p.xy);
title(strcat(let(i),p.s5),'FontSize',fsize,'Interpreter','latex');
colorbar('FontSize',fsize,'Location','eastoutside');
i=i+1;

subplot(row,col,idx(i));
pcolor(lon,lat,p.u5-p.u4); shading flat; caxis([p.cmin4 p.cmax4]); hold on;
if p.do_add;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
%  quiver(lon(1:n:end),lat(1:n:end),p.u5(1:n:end,1:n:end),p.v5(1:n:end,1:n:end),cfact,'y');
%  [phi psi] = flowfun(lon,lat,p.u8',p.v8'); %contour(lon,lat,psi',20,'k'); hold on; 
%  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end
contour(lon,lat,lm,1,co);
axis(p.xy);
title(strcat(let(i), ' (g) minus (f)'),'FontSize',fsize,'Interpreter','latex');
colorbar('FontSize',fsize,'Location','eastoutside');
i=i+1;

% =========================================================
% BLOCK 3
% =========================================================
subplot(row,col,idx(i));
pcolor(lon,lat,p.u6); shading flat; caxis([p.cmin6 p.cmax6]); hold on;
if p.do_add;
  add.z=p.z6; add.u=p.u6; add.v=p.v6; add.zbin=p.z6_bin; add.ubin=p.u6_bin; 
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
end;
contour(lon,lat,lm,1,co);
axis(p.xy);
title(strcat(let(i),p.s6),'FontSize',fsize,'Interpreter','latex');
colorbar('FontSize',fsize,'Location','eastoutside');
i=i+1;

subplot(row,col,idx(i));
pcolor(lon,lat,p.u7); shading flat; caxis([p.cmin7 p.cmax7]); hold on;
if p.do_add;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
  quiver(lon(1:n:end),lat(1:n:end),p.u7(1:n:end,1:n:end),p.v7(1:n:end,1:n:end),cfact,'y');
%   [phi psi] = flowfun(lon,lat,p.u12',p.v12'); %contour(lon,lat,psi',20,'k'); hold on; 
%   contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%   contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end;
contour(lon,lat,lm,1,co);
axis(p.xy);
title(strcat(let(i),p.s7),'FontSize',fsize,'Interpreter','latex');
colorbar('FontSize',fsize,'Location','eastoutside');
i=i+1;

subplot(row,col,idx(i));
pcolor(lon,lat,p.u8); shading flat; caxis([p.cmin7 p.cmax7]); hold on;
if p.do_add;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
  quiver(lon(1:n:end),lat(1:n:end),p.u8(1:n:end,1:n:end),p.v8(1:n:end,1:n:end),cfact,'y');
%  contour(lon,lat,add.u+p.u8, add.ubin,'color','y','Linestyle','-', 'showtext',p.show);
%   [phi psi] = flowfun(lon,lat,p.u13',p.v13'); %contour(lon,lat,psi',20,'k'); hold on; 
%   contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%   contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end
contour(lon,lat,lm,1,co);
axis(p.xy);
title(strcat(let(i),p.s8),'FontSize',fsize,'Interpreter','latex');
colorbar('FontSize',fsize,'Location','eastoutside');
i=i+1;

subplot(row,col,idx(i));
pcolor(lon,lat,p.u8-p.u7); shading flat; caxis([p.cmin7 p.cmax7]); hold on;
if p.do_add;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
%  quiver(lon(1:n:end),lat(1:n:end),p.u8(1:n:end,1:n:end),p.v8(1:n:end,1:n:end),cfact,'y');
%   [phi psi] = flowfun(lon,lat,p.u13',p.v13'); %contour(lon,lat,psi',20,'k'); hold on; 
%   contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
%   contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
end;
contour(lon,lat,lm,1,co);
axis(p.xy);
title(strcat(let(i), ' (k) minus (j)'),'FontSize',fsize,'Interpreter','latex');
colorbar('FontSize',fsize,'Location','eastoutside');
i=i+1;

% =========================================================
% BLOCK 4
% =========================================================
subplot(row,col,idx(i));
pcolor(lon,lat,p.z9); shading flat; caxis([p.cmin9 p.cmax9]); hold on;
if p.do_add;
  add.z=p.z9; add.u=p.u9; add.v=p.v9; add.zbin=p.z9_bin; add.ubin=p.u9_bin;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
end;
contour(lon,lat,lm,1,co);
axis(p.xy);
title(strcat(let(i),p.s9),'FontSize',fsize,'Interpreter','latex');
colorbar('FontSize',fsize,'Location','eastoutside');
i=i+1;

cb = colorbar('FontSize', fsize, 'Location', 'northoutside');
set(cb, 'Position', [0.13 + (c-1)*0.21, 0.95, 0.15, 0.01]); % Adjust positions
set(get(cb,'title'),'string',unit_str);

subplot(row,col,idx(i));
pcolor(lon,lat,p.z10); shading flat; caxis([p.cmin10 p.cmax10]); hold on;
if p.do_add;
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
  quiver(lon(1:n:end),lat(1:n:end),p.u10(1:n:end,1:n:end),p.v10(1:n:end,1:n:end),cfact,'y');
  %contour(lon,lat,p.u16,p.u16_addbin,'y-','showtext',p.show);
end;
contour(lon,lat,lm,1,co);
axis(p.xy);
title(strcat(let(i),p.s10),'FontSize',fsize,'Interpreter','latex');
colorbar('FontSize',fsize,'Location','eastoutside');
i=i+1;

subplot(row,col,idx(i));
pcolor(lon,lat,p.z11); shading flat; caxis([p.cmin10 p.cmax10]); hold on;
if p.do_add;
  %contour(lon,lat,add.z,add.zbin,p.z1_co,'showtext',p.show);
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
  quiver(lon(1:n:end),lat(1:n:end),p.u11(1:n:end,1:n:end),p.v11(1:n:end,1:n:end),cfact,'y');
end;
contour(lon,lat,lm,1,co);
axis(p.xy);
title(strcat(let(i),p.s11),'FontSize',fsize,'Interpreter','latex');
colorbar('FontSize',fsize,'Location','eastoutside');
i=i+1;

subplot(row,col,idx(i));
pcolor(lon,lat,p.z11-p.z10); shading flat; caxis([p.cmin10 p.cmax10]); hold on;
if p.do_add;
  %contour(lon,lat,add.z,add.zbin,p.z1_co,'showtext',p.show);
  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
%  quiver(lon(1:n:end),lat(1:n:end),p.u11(1:n:end,1:n:end),p.v11(1:n:end,1:n:end),cfact,'y');
end;
contour(lon,lat,lm,1,co);
axis(p.xy);
title(strcat(let(i), ' (o) minus (n)'),'FontSize',fsize,'Interpreter','latex');
colorbar('FontSize',fsize,'Location','eastoutside');

expn='pattern_effect'; visfig='off'; figpath='./fig_land/';
printnew(visfig,figpath,expn,p.vname,p.fmt);

return
