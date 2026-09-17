function plot_extreme_extended(p)
% Reordered so that (a,b,c,d) = (TAS, VPD, TWB, RH) - Top Row

if p.showus  
  [lat,lon]=borders('continental us'); us.lat=lat; us.lon=lon; us.co='k:'; lw=0.01;
  for k=1:length(lon); us.lon{k}=us.lon{k}+360; end;
end
let = p.let; lon=p.lon; lat=p.lat; lm=p.lm; co=p.co; len=0.16; wid=0.02;
mk='.'; ms=1; mc=0.1*[1 1 1]; ds=100;
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
        subplot(row, col, idx);
        hold on;
        
        % Data Selection Logic
        if c == 1 % TAS Column
          if     r==1; a=p.v1; b=p.dv1; sx=let(idx)+p.s1; cax=[p.cmin1 p.cmax1];
	  elseif r==2; a=p.v2; b=p.dv2; sx=let(idx)+p.s2; cax=[p.cmin1 p.cmax1];
          elseif r==3; a=p.v3; b=p.dv3; sx=let(idx)+p.s3; cax=[p.cmin1 p.cmax1];
          elseif r==4; a=p.v4; b=p.dv4; sx=let(idx)+p.s4; cax=[p.cmin1 p.cmax1];
          elseif r==5; a=p.v5; b=p.dv5; sx=let(idx)+p.s5; cax=[p.cmin1 p.cmax1];
          end;
          unit_val = p.unit1; unit_str = p.unit1_bar; % Shared for TAS
            
        elseif c == 2 % VPD Column
          if     r==1; a=p.v6;  b=p.dv6;  sx=let(idx)+p.s6;  cax=[p.cmin2 p.cmax2];
	  elseif r==2; a=p.v7;  b=p.dv7;  sx=let(idx)+p.s7;  cax=[p.cmin2 p.cmax2];
          elseif r==3; a=p.v8;  b=p.dv8;  sx=let(idx)+p.s8;  cax=[p.cmin2 p.cmax2];
          elseif r==4; a=p.v9;  b=p.dv9;  sx=let(idx)+p.s9;  cax=[p.cmin2 p.cmax2];
          elseif r==5; a=p.v10; b=p.dv10; sx=let(idx)+p.s10; cax=[p.cmin2 p.cmax2];
          end;
          unit_val = p.unit4; unit_str = p.unit4_bar;

        elseif c == 3 % TWB Column
          if     r==1; a=p.v11; b=p.dv11; sx=let(idx)+p.s11; cax=[p.cmin3 p.cmax3];
	  elseif r==2; a=p.v12; b=p.dv12; sx=let(idx)+p.s12; cax=[p.cmin3 p.cmax3];
          elseif r==3; a=p.v13; b=p.dv13; sx=let(idx)+p.s13; cax=[p.cmin3 p.cmax3];
          elseif r==4; a=p.v14; b=p.dv14; sx=let(idx)+p.s14; cax=[p.cmin3 p.cmax3];
          elseif r==5  a=p.v15; b=p.dv15; sx=let(idx)+p.s15; cax=[p.cmin3 p.cmax3];
          end;
          unit_val = p.unit7; unit_str = p.unit7_bar;

        elseif c == 4 % RH Column
          if     r==1; a=p.v16; b=p.dv16; sx=let(idx)+p.s16; cax=[p.cmin4 p.cmax4];
	  elseif r==2; a=p.v17; b=p.dv17; sx=let(idx)+p.s17; cax=[p.cmin4 p.cmax4];
          elseif r==3; a=p.v18; b=p.dv18; sx=let(idx)+p.s18; cax=[p.cmin4 p.cmax4];
          elseif r==4; a=p.v19; b=p.dv19; sx=let(idx)+p.s19; cax=[p.cmin4 p.cmax4];
          elseif r==5; a=p.v20; b=p.dv20; sx=let(idx)+p.s20; cax=[p.cmin4 p.cmax4];
          end;
          unit_val = p.unit10; unit_str = p.unit10_bar;
        end
        
        % Plotting
        a(~p.id) = NaN;
        pcolor(p.lon, p.lat, a); shading flat; caxis(cax);
        contour(p.lon, p.lat, p.lm, 1, co); axis(p.xy);
	if (p.showus);
	  for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
	end
        
        if (p.showavg);
	  s = sprintf('%s (%5.3f%s)', sx, b, unit_val);
	else
	  s = sx;
	end;
        title(s, 'FontSize', fsize, 'Interpreter', 'latex');
        
        cb = colorbar('FontSize', fsize, 'Location', 'southoutside');
        set(cb, 'Position', [0.13 + (c-1)*0.21, 0.05, 0.15, 0.01]);
        set(get(cb,'title'),'string',unit_str);

    end
end

expn='plot_extreme_extended'; visfig='off'; figpath='./fig_land/';
vname=strcat(p.vname); %,'_',num2str(p.do_bias));
printnew(visfig,figpath,expn,vname,p.fmt);

%save(strcat(vname,'.mat'), 'p');

end
