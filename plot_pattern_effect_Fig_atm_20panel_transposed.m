function plot_pattern_effect_Fig_atm_20panel_transposed(p)
% Reordered so that (a,b,c,d) = (TAS, VPD, TWB, RH) - Top Row
%let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
%     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
let=p.let; %s1=p.s1; s2=p.s2; s3=p.s3; s4=p.s4; s5=p.s5; s6=p.s6;s7=p.s7; s8=p.s8;
lon=p.lon; lat=p.lat; lm=p.lm; co=p.co; len=0.16; wid=0.02;
mk='.'; ms=1; mc=0.1*[1 1 1]; ds=100; cfact=p.cfact; n=5;

%[lat,lon]=borders('continental us'); us.lat=lat; us.lon=lon; us.co='k:'; lw=0.01;
%for k=1:length(lon); us.lon{k}=us.lon{k}+360; end;
%let = p.let; lon=p.lon; lat=p.lat; lm=p.lm; co=p.co; len=0.16; wid=0.02;
%mk='.'; ms=1; mc=0.1*[1 1 1]; ds=100;
pms=[ 0, 0, 1400, 1200]*1.1; fsize=9; row=5; col=4;
handle = figure('Position', pms,'visible','on'); 
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap); 
if p.flipcmap; colormap(flipud(cmap)); end;

% Setup Data Mapping
% row 1: Present-day (v0, v3, v6, v9)
% row 2: SPEAR (v1, v4, v7, v10)
% row 3: Observed (v2, v5, v8, v11)
% row 4: Difference (v2-v1, v5-v4, v8-v7, v11-v10)

% Define indices for variables across columns
% Column 1: TAS (v0, v1, v2)
% Column 2: VPD (v3, v4, v5)
% Column 3: TWB (v6, v7, v8)
% Column 4: RH  (v9, v10, v11)

for r = 1:5 % Rows: Present, SPEAR, Observed, Diff
    for c = 1:4 % Cols: TAS, VPD, TWB, RH
        idx = (r-1)*col + c; % The subplot position (1-16)
        subplot(row, col, idx); hold on;
        % Data Selection Logic
        if c == 1 % Z500'
          if     r==1;
	    a=p.z0; b=p.dz0; sx=let(idx)+p.s0; cax=[p.cmin0 p.cmax0];
	    if p.do_add;
	      add.z=p.z0; add.u=p.u0; add.v=p.v0; add.zbin=p.z0_bin; add.ubin=p.u0_bin;
              %  quiver(lon(1:n:end),lat(1:n:end),p.u1(1:n:end,1:n:end),p.v1(1:n:end,1:n:end),cfact,'y');
              %  pcolor(lon,lat,p.tas1); caxis([-3 3]); shading flat; colorbar;
              %  [phi psi] = flowfun(lon,lat,p.u1',p.v1'); %contour(lon,lat,psi',20,'k'); hold on; 
              %  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
              %  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
            end;
	  elseif r==2;
	    a=p.z0; b=p.dz0; sx=let(idx)+p.s0; cax=[p.cmin0 p.cmax0];
	    if p.do_add;
	      add.z=p.z0; add.u=p.u0; add.v=p.v0; add.zbin=p.z0_bin; add.ubin=p.u0_bin;
	    end
          elseif r==3;
	    a=p.z1; b=p.dz1; sx=let(idx)+p.s1; cax=[p.cmin1 p.cmax1];
          elseif r==4;
	    a=p.z2; b=p.dz2; sx=let(idx)+p.s2; cax=[p.cmin1 p.cmax1];
          else;
	    a=p.z2-p.z1; b=p.dz2-p.dz1; sx=let(idx)+'(m) minus (i)'; cax=[p.cmin1 p.cmax1];
          end;
          unit_val = p.unit1; unit_str = p.unit1_bar; % Shared for TAS
          if r==1 | r==2; unit_val = p.unit0; unit_str = p.unit0_bar; end
            
        elseif c == 2 % U200
          if     r==1;
	    a=p.u3; b=p.du3; sx=let(idx)+p.s3; cax=[p.cmin3 p.cmax3];
	    if p.do_add
	      add.z=p.z3; add.u=p.u3; add.v=p.v3; add.zbin=p.z3_bin; add.ubin=p.u3_bin;
              %  [phi psi] = flowfun(lon,lat,p.u6',p.v6'); %contour(lon,lat,psi',20,'k'); hold on; 
              %  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
              %  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
            end
	  elseif r==2;
	    a=p.u3; b=p.du3; sx=let(idx)+p.s3; cax=[p.cmin3 p.cmax3];
	    if p.do_add
	      add.z=p.z3; add.u=p.u3; add.v=p.v3; add.zbin=p.z3_bin; add.ubin=p.u3_bin;
              %  [phi psi] = flowfun(lon,lat,p.u6',p.v6'); %contour(lon,lat,psi',20,'k'); hold on; 
              %  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
              %  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
            end
          elseif r==3;
	    a=p.u4; b=p.du4; sx=let(idx)+p.s4; cax=[p.cmin4 p.cmax4];
          elseif r==4;
	    a=p.u5; b=p.du5; sx=let(idx)+p.s5; cax=[p.cmin4 p.cmax4];
          else;
	    a=p.u5-p.u4;  b=p.du5-p.du4; sx=let(idx)+'(n) minus (j)'; cax=[p.cmin4 p.cmax4];
          end;
          unit_val = p.unit4; unit_str = p.unit4_bar;
          if r==1 | r==2; unit_val = p.unit3; unit_str = p.unit3_bar; end

        elseif c == 3 % Z850
          if     r==1;
	    a=p.u6; b=p.du6; sx=let(idx)+p.s6; sx=let(idx)+p.s6; cax=[p.cmin6 p.cmax6];
	    add.z=p.z6; add.u=p.u6; add.v=p.v6; add.zbin=p.z6_bin; add.ubin=p.u6_bin; 
	  elseif r==2;
	    a=p.u6; b=p.du6; sx=let(idx)+p.s6; cax=[p.cmin6 p.cmax6];
          elseif r==3;
	    a=p.u7; b=p.du7; sx=let(idx)+p.s7; cax=[p.cmin7 p.cmax7];
          elseif r==4;
	    a=p.u8; b=p.du8; sx=let(idx)+p.s8; cax=[p.cmin7 p.cmax7];
          else;
	    a=p.u8-p.u7; b=p.du8-p.du7; sx=let(idx)+'(o) minus (k)'; cax=[p.cmin7 p.cmax7];
          end;
          unit_val = p.unit7; unit_str = p.unit7_bar;
          if r==1 | r==2; unit_val = p.unit6; unit_str = p.unit6_bar; end

        elseif c == 4 % SLP
          if     r==1;
	    a=p.z9; b=p.dz9; sx=let(idx)+p.s9; cax=[p.cmin9 p.cmax9];
	    add.z=p.z9; add.u=p.u9; add.v=p.v9; add.zbin=p.z9_bin; add.ubin=p.u9_bin;
	  elseif r==2;
	    a=p.z9; b=p.dz9; sx=let(idx)+p.s9; cax=[p.cmin9 p.cmax9];
	    add.z=p.z9; add.u=p.u9; add.v=p.v9; add.zbin=p.z9_bin; add.ubin=p.u9_bin;
          elseif r==3;
	    a=p.z10; b=p.dz10; sx=let(idx)+p.s10; cax=[p.cmin10 p.cmax10];
          elseif r==4;
	    a=p.z11; b=p.dz11; sx=let(idx)+p.s11; cax=[p.cmin10 p.cmax10];
          else;
	    a=p.z11-p.z10;  b=p.dz11-p.dz10; sx=let(idx)+'(p) minus (l)'; cax=[p.cmin10 p.cmax10];
          end;
          unit_val = p.unit10; unit_str = p.unit10_bar;
          if r==1 | r==2; unit_val = p.unit9; unit_str = p.unit9_bar; end
        end
        
        % Plotting  a(~p.id) = NaN;
        pcolor(p.lon, p.lat, a); shading flat; caxis(cax);
	if p.do_add;
	  contour(lon,lat,add.u, add.ubin,'color',p.z1_co,'Linestyle','-', 'showtext',p.show);
	  contour(lon,lat,add.u,-add.ubin,'color',p.z1_co,'Linestyle','--','showtext',p.show);
	  quiver(lon(1:n:end),lat(1:n:end),add.u(1:n:end,1:n:end),add.v(1:n:end,1:n:end),cfact,'k');
	end

        contour(p.lon, p.lat, p.lm, 1, co); axis(p.xy);
%        for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
        
        % Stippling (Significance) - Only for SPEAR and Observed rows
        if (r == 3 || r == 4)
%            [xx,yy] = meshgrid(lon,lat);
%            stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms);
        end
        
%        s = sprintf('%s (%5.3f%s)', sx, b, unit_val);
        s = sprintf('%s', sx);
        title(s, 'FontSize', fsize, 'Interpreter', 'latex');
        
        % Colorbar Logic: Place bar for Row 1 and Row 4 of each column
        if r == 1
            cb = colorbar('FontSize', fsize, 'Location', 'northoutside');
            set(cb, 'Position', [0.13 + (c-1)*0.21, 0.95, 0.15, 0.01]); % Adjust positions
            set(get(cb,'title'),'string',unit_str);
        elseif r == 4
            cb = colorbar('FontSize', fsize, 'Location', 'southoutside');
            set(cb, 'Position', [0.13 + (c-1)*0.21, 0.05, 0.15, 0.01]);
            set(get(cb,'title'),'string',unit_str);
        end
    end
end

expn='pattern_effect_20panel_rotated'; visfig='off'; figpath='./fig_land/';
vname=p.vname; %vname=strcat(p.vname,'_',num2str(p.do_bias));

printnew(visfig,figpath,expn,vname,p.fmt);
end
