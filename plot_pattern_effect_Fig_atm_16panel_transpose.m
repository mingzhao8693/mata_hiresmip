function plot_pattern_effect_Fig_atm_16panel_transpose(p)

let = p.let;
lon = p.lon; lat = p.lat; lm = p.lm; co = p.co;
cfact = p.cfact; n = 5;

row = 4; col = 4; fsize = 9;

figure('Position',[0 0 1400 1000]*1.2,'visible','on');

i = 1;

colormap(bluewhitered_miz(256));

% =========================================================
% TRANSPOSE INDEXING
% =========================================================
idx = @(k) (mod(k-1,row)*col + ceil(k/row));

% =========================================================
% AXIS STORAGE (IMPORTANT FIX)
% =========================================================
ax = gobjects(row,col);

getRC = @(k) deal(ceil(k/col), mod(k-1,col)+1);

% =========================================================
% HELPER TO PLOT ONE PANEL
% =========================================================
function make_panel(k, Z, clim, title_str)

    [r,c] = getRC(k);
    ax(r,c) = subplot(row,col,idx(k));

    pcolor(lon,lat,Z); shading flat;
    caxis(clim);
    hold on;

    contour(lon,lat,lm,1,co);
    axis(p.xy);

    title(title_str,'FontSize',fsize,'Interpreter','latex');

end

% =========================================================
% ---- BLOCK 1 ----
% =========================================================
make_panel(i, p.z0, [p.cmin0 p.cmax0], [let(i) p.s0]); i=i+1;
make_panel(i, p.z1, [p.cmin1 p.cmax1], [let(i) p.s1]); i=i+1;
make_panel(i, p.z2, [p.cmin1 p.cmax1], [let(i) p.s2]); i=i+1;
make_panel(i, p.z2-p.z1, [p.cmin1 p.cmax1], [let(i) ' (c)-(b)']); i=i+1;

% =========================================================
% ---- BLOCK 2 ----
% =========================================================
make_panel(i, p.u3, [p.cmin3 p.cmax3], [let(i) p.s3]); i=i+1;
make_panel(i, p.u4, [p.cmin4 p.cmax4], [let(i) p.s4]); i=i+1;
make_panel(i, p.u5, [p.cmin4 p.cmax4], [let(i) p.s5]); i=i+1;
make_panel(i, p.u5-p.u4, [p.cmin4 p.cmax4], [let(i) ' (g)-(f)']); i=i+1;

% =========================================================
% ---- BLOCK 3 ----
% =========================================================
make_panel(i, p.u6, [p.cmin6 p.cmax6], [let(i) p.s6]); i=i+1;
make_panel(i, p.u7, [p.cmin7 p.cmax7], [let(i) p.s7]); i=i+1;
make_panel(i, p.u8, [p.cmin7 p.cmax7], [let(i) p.s8]); i=i+1;
make_panel(i, p.u8-p.u7, [p.cmin7 p.cmax7], [let(i) ' (k)-(j)']); i=i+1;

% =========================================================
% ---- BLOCK 4 ----
% =========================================================
make_panel(i, p.z9,  [p.cmin9  p.cmax9],  [let(i) p.s9]); i=i+1;
make_panel(i, p.z10, [p.cmin10 p.cmax10], [let(i) p.s10]); i=i+1;
make_panel(i, p.z11, [p.cmin10 p.cmax10], [let(i) p.s11]); i=i+1;
make_panel(i, p.z11-p.z10, [p.cmin10 p.cmax10], [let(i) ' (o)-(n)']);

drawnow;

% =========================================================
% ROW 1: individual TOP colorbars (per column)
% =========================================================
for c = 1:col
    cb = colorbar(ax(1,c));
    cb.Location = 'northoutside';
    cb.Box = 'off';
end

% =========================================================
% ROWS 2–4: shared colorbar per column
% =========================================================
for c = 1:col

    clim_min = inf;
    clim_max = -inf;

    for r = 2:row
        clim = caxis(ax(r,c));
        clim_min = min(clim_min, clim(1));
        clim_max = max(clim_max, clim(2));
    end

    for r = 2:row
        caxis(ax(r,c), [clim_min clim_max]);
    end

    cb = colorbar(ax(2,c));
    cb.Location = 'southoutside';
    cb.Box = 'off';

end

end
