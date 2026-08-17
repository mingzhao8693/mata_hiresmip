function plot_pattern_effect_Fig_atm_20panel_transposed_scalar(p)
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

% Setup Data Mapping      Z500 U200  U850 SLP 
% row 1: ERA5             (Z0, Z3,   Z6,  Z9)
% row 2: Control          (z0, z3,   z6,  z9)
% row 2: SPEAR-pattern    (z1, z4,   z7,  z10)
% row 3: Observed-pattern (z2, z5,   z8,  z11)
% row 4: Difference    (z2-z1, z5-z4, z8-z7, z11-z10)

% Define indices for variables across columns
% Column 1: Z500 (Z0, z0, z1,  z2)
% Column 2: U200 (Z3, z3, z4,  z5)
% Column 3: U850 (Z6, z6, z7,  z8)
% Column 4: SLP  (Z9, z9, z10, z11)

for r = 1:5 % Rows: Present, SPEAR, Observed, Diff
    for c = 1:4 % Cols: TAS, VPD, TWB, RH
        idx = (r-1)*col + c; % The subplot position (1-16)
        subplot(row, col, idx); hold on;
        % Data Selection Logic
        if c == 1 %Z500', U500, V500 (shaing Z500')
%	  maxwind_c=findmaxmag(p.u0,p.v0,p.u0,p.v0,p.u0,     p.v0);
%	  maxwind_d=findmaxmag(p.u1,p.v1,p.u2,p.v2,p.u2-p.u1,p.v2-p.v1);
          if     r==1;
	    a=p.Z0; b=p.dZ0; sx=let(idx)+p.S0; cax=[p.cmin0 p.cmax0];
	    add.z=p.Z0; %add.u=p.U0; add.v=p.V0; add.zbin=p.z0_bin; add.ubin=p.u0_bin; add.u200=p.u200_era;
            %quiver(lon(1:n:end),lat(1:n:end),p.u1(1:n:end,1:n:end),p.v1(1:n:end,1:n:end),cfact,'y');
            %pcolor(lon,lat,p.tas1); caxis([-3 3]); shading flat; colorbar;
            %[phi psi] = flowfun(lon,lat,p.u1',p.v1'); %contour(lon,lat,psi',20,'k'); hold on; 
            %contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
            %contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
	  elseif r==2;
	    a=p.z0; b=p.dz0; sx=let(idx)+p.s0; cax=[p.cmin0 p.cmax0];
	    add.z=p.z0; add.zbin=p.z0_bin; 
	    if (p.do_bias); a=p.z0-p.Z0; b=p.dz0-p.dZ0; cax=[p.cmin1 p.cmax1]; end;
          elseif r==3;
	    a=p.z1; b=p.dz1; sx=let(idx)+p.s1; cax=[p.cmin1 p.cmax1];
	    add.z=p.z1; add.zbin=p.z0_bin; 
          elseif r==4;
	    a=p.z2; b=p.dz2; sx=let(idx)+p.s2; cax=[p.cmin1 p.cmax1];
	    add.z=p.z2; add.zbin=p.z0_bin; 
          else;
	    a=p.z2-p.z1; b=p.dz2-p.dz1; sx=let(idx)+'(m) minus (i)'; cax=[p.cmin1 p.cmax1];
 	    add.z=p.z2-p.z1; add.zbin=p.z0_bin;
          end;
          unit_val = p.unit1; unit_str = p.unit1_bar; % Shared for TAS
          if r==1 | r==2; unit_val = p.unit0; unit_str = p.unit0_bar; end
            
        elseif c == 2 % Z200, U200, V200 (shading Z200)
          if     r==1; %ERA5: p.Z3, p.U3, p.V3
%	    a=p.U3; b=p.dU3; sx=let(idx)+p.S3; cax=[p.cmin3 p.cmax3];
	    a=p.Z3; b=p.dZ3; sx=let(idx)+p.S3; cax=[p.cmin3 p.cmax3];
	    add.z=p.Z3; add.zbin=p.z3_bin; 
            %  [phi psi] = flowfun(lon,lat,p.u6',p.v6'); %contour(lon,lat,psi',20,'k'); hold on; 
            %  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
            %  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
	  elseif r==2; %control: p.z3, p.u3, p.v3
%	    a=p.u3; b=p.du3; sx=let(idx)+p.s3; cax=[p.cmin3 p.cmax3];
	    a=p.z3; b=p.dz3; sx=let(idx)+p.s3; cax=[p.cmin3 p.cmax3];
	    add.z=p.z3; add.zbin=p.z3_bin;
	    if (p.do_bias); a=p.z3-p.Z3; b=p.dz2-p.dZ3; cax=[p.cmin4 p.cmax4]; end;
%	    if (p.do_bias); a=p.u3-p.U3; b=p.du3-p.dU3; add.u=p.u3-p.U3; add.v=p.v3-p.V3; cax=[p.cmin4 p.cmax4]; end;
            %  [phi psi] = flowfun(lon,lat,p.u6',p.v6'); %contour(lon,lat,psi',20,'k'); hold on; 
            %  contour(lon,lat,phi', p.phi_bin,p.phi_co,'Linestyle','-', 'showtext','off'); hold on;
            %  contour(lon,lat,phi',-p.phi_bin,p.phi_co,'Linestyle','--','showtext','off');
          elseif r==3; %SPEAR-pattern minus control:    p.z4, p.u4, p.v4
%	    a=p.u4; b=p.du4; sx=let(idx)+p.s4; cax=[p.cmin4 p.cmax4];
	    a=p.z4; b=p.dz4; sx=let(idx)+p.s4; cax=[p.cmin4 p.cmax4];
	    add.dz=p.z4; add.zbin=p.z0_bin;
          elseif r==4; %observed-pattern minus control: p.z5, p.u5, p.v5
%	    a=p.u5; b=p.du5; sx=let(idx)+p.s5; cax=[p.cmin4 p.cmax4];
	    a=p.z5; b=p.dz5; sx=let(idx)+p.s5; cax=[p.cmin4 p.cmax4];
	    add.dz=p.z5; add.zbin=p.z0_bin;
          else;
%	    a=p.u5-p.u4;  b=p.du5-p.du4; sx=let(idx)+'(n) minus (j)'; cax=[p.cmin4 p.cmax4];
	    a=p.z5-p.z4;  b=p.dz5-p.dz4; sx=let(idx)+'(n) minus (j)'; cax=[p.cmin4 p.cmax4];
	    add.dz=p.z5-p.z4; add.zbin=p.z0_bin;
          end;
          unit_val = p.unit4; unit_str = p.unit4_bar;
          if r==1 | r==2; unit_val = p.unit3; unit_str = p.unit3_bar; end

        elseif c == 3 % Z850      
          if     r==1;
	    a=p.Z6; b=p.dZ6; sx=let(idx)+p.S6; cax=[p.cmin6 p.cmax6];
	    add.z=p.Z6; add.zbin=p.z6_bin; 
	  elseif r==2;
	    a=p.z6; b=p.dz6; sx=let(idx)+p.s6; cax=[p.cmin6 p.cmax6];
 	    add.z=p.z6; add.zbin=p.z6_bin;  
	    if (p.do_bias); a=p.z6-p.Z6; b=p.dz6-p.dZ6; cax=[p.cmin7 p.cmax7]; end;
%	    if (p.do_bias); a=p.u6-p.U6; b=p.du6-p.dU6; cax=[p.cmin7 p.cmax7]; end;
         elseif r==3;
	    a=p.z7; b=p.dz7; sx=let(idx)+p.s7; cax=[p.cmin7 p.cmax7];
 	    add.dz=p.z7; add.zbin=p.z6_bin;  
          elseif r==4;
	    a=p.z8; b=p.dz8; sx=let(idx)+p.s8; cax=[p.cmin7 p.cmax7];
	    add.dz=p.z8; add.zbin=p.z6_bin;  
           else;
	    a=p.z8-p.z7; b=p.dz8-p.dz7; sx=let(idx)+'(o) minus (k)'; cax=[p.cmin7 p.cmax7];
	    add.dz=p.z8-p.z7; add.zbin=p.z6_bin;  
          end;
          unit_val = p.unit7; unit_str = p.unit7_bar;
          if r==1 | r==2; unit_val = p.unit6; unit_str = p.unit6_bar; end

        elseif c == 4 % IVT
          if     r==1;
	    a=p.Z9; b=p.dZ9; sx=let(idx)+p.S9; cax=[p.cmin9 p.cmax9];
	    add.z=p.Z9; add.zbin=p.z9_bin; 
	  elseif r==2;
	    a=p.z9; b=p.dz9; sx=let(idx)+p.s9; cax=[p.cmin9 p.cmax9];
	    add.z=p.z9; add.zbin=p.z9_bin; 
	    if (p.do_bias); a=p.z9-p.Z9; b=p.dz9-p.dZ9; cax=[p.cmin10 p.cmax10]; end;
          elseif r==3;
	    a=p.z10; b=p.dz10; sx=let(idx)+p.s10; cax=[p.cmin10 p.cmax10];
 	    add.dz=p.z10; add.zbin=p.z6_bin; 
         elseif r==4;
	    a=p.z11; b=p.dz11; sx=let(idx)+p.s11; cax=[p.cmin10 p.cmax10];
 	    add.dz=p.z11; add.zbin=p.z6_bin;  
          else;
	    a=p.z11-p.z10;  b=p.dz11-p.dz10; sx=let(idx)+'(p) minus (l)'; cax=[p.cmin10 p.cmax10];
 	    add.dz=p.z11-p.z10; add.zbin=p.z6_bin;  
          end;
          unit_val = p.unit10; unit_str = p.unit10_bar;
          if r==1 | r==2; unit_val = p.unit9; unit_str = p.unit9_bar; end
        end
        
        % Plotting  a(~p.id) = NaN;
        pcolor(p.lon, p.lat, a); shading flat; caxis(cax);
        contour(p.lon, p.lat, p.lm, 1, co); axis(p.xy);
	if p.do_add;
	  if c==4;
	    scale_c = 0.05; scale_d = 4.0*scale_c; ref=200; ref1=50; vunit='kg/m/s';
	  else;
	    scale_c = 1;    scale_d = 4.0*scale_c; ref=10;  ref1=2.5; vunit='m/s';
	  end;
 	end
        %for k=1:length(us.lon); plot(us.lon{k},us.lat{k},us.co,'LineWidth',lw); end;
        
        % Stippling (Significance) - Only for SPEAR and Observed rows
        if (r == 3 || r == 4)
%            [xx,yy] = meshgrid(lon,lat);
%            stipple(xx,yy,isig,'density',ds,'color',mc,'marker',mk,'markersize',ms);
        end
        
%	s = sprintf('%s (%5.3f%s)', sx, b, unit_val);
	s = sprintf('%s', sx);
        title(s, 'FontSize', fsize, 'Interpreter', 'latex');
        
        % Colorbar Logic: Place bar for Row 1 and Row 4 of each column
        if r == 2
            cb = colorbar('FontSize', fsize, 'Location', 'northoutside');
            set(cb, 'Position', [0.129 + (c-1)*0.21, 0.95, 0.15, 0.01]); % Adjust positions
            set(get(cb,'title'),'string',unit_str);
        elseif r == 4
            cb = colorbar('FontSize', fsize, 'Location', 'southoutside');
            set(cb, 'Position', [0.129 + (c-1)*0.21, 0.05, 0.15, 0.01]);
            set(get(cb,'title'),'string',unit_str);
        end
    end
end

expn='pattern_effect_20panel_rotated'; visfig='off'; figpath='./fig_land/';
vname=p.vname; %vname=strcat(p.vname,'_',num2str(p.do_bias));

printnew(visfig,figpath,expn,vname,p.fmt);
end
