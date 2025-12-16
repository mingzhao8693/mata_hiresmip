function plot_2d_15panel_wp_special(p)
%let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
%     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
let=p.let; %s1=p.s1; s2=p.s2; s3=p.s3; s4=p.s4; s5=p.s5; s6=p.s6;s7=p.s7; s8=p.s8;
lon=p.lon; lat=p.lat; lm=p.lm; co=p.co;
cmin1=p.cmin1; cmax1=p.cmax1; cmin2=p.cmin2; cmax2=p.cmax2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1000, 1200]*1; fsize=7; row=5; col=3; minus=char(8212);
handle = figure('Position', pms,'visible','on'); i=1; unit=p.unit;
nn=256;  cmap=bluewhitered_miz(nn); colormap(cmap); %colormap(jet); 
subplot(row,col,i); a=p.v1; b=p.dv1; sx=let(i)+p.s1; i=i+1; a1=a; b1=b;
pcolor(p.lon0,p.lat0,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(p.lon0,p.lat0,p.v1_add,p.v1_addbin,p.v1_co,'showtext',p.show);
contour(p.lon0,p.lat0,p.lm0,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit0); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v2; b=p.dv2; sx=let(i)+p.s2; i=i+1; a2=a; b2=b;
pcolor(p.lon0,p.lat0,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(p.lon0,p.lat0,p.v1_add,p.v1_addbin,p.v1_co,'showtext',p.show);
contour(p.lon0,p.lat0,p.lm0,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit0); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v3; b=p.dv3; sx=let(i)+p.s3; i=i+1; a3=a; b3=b;
pcolor(p.lon0,p.lat0,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(p.lon0,p.lat0,p.v1_add,p.v1_addbin,p.v1_co,'showtext',p.show);
contour(p.lon0,p.lat0,p.lm0,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit0); title(s,'FontSize',fsize); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v4; b=p.dv4; sx=let(i)+p.s4; i=i+1; a4=a; b4=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
%contour(p.lon0,p.lat0,p.v4_add,p.v4_addbin,p.v7_co,'showtext',p.show);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v5; b=p.dv5; sx=let(i)+p.s5; i=i+1; a5=a; b5=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
%contour(p.lon0,p.lat0,p.v4_add,p.v4_addbin,p.v4_co,'showtext',p.show);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v6; b=p.dv6; sx=let(i)+p.s6; i=i+1; a6=a; b6=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
%contour(p.lon0,p.lat0,p.v4_add,p.v4_addbin,p.v7_co,'showtext',p.show);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); title(s,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v7; b=p.dv7; sx=let(i)+p.s7; i=i+1; a7=a; b7=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
%contour(p.lon0,p.lat0,p.v7_add,p.v7_addbin,p.v7_co,'showtext',p.show);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v8; b=p.dv8; sx=let(i)+p.s8; i=i+1; a8=a; b8=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
%contour(p.lon0,p.lat0,p.v7_add,p.v7_addbin,p.v7_co,'showtext',p.show);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v9; b=p.dv9; sx=let(i)+p.s9; i=i+1; a9=a; b9=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
%contour(p.lon0,p.lat0,p.v7_add,p.v7_addbin,p.v7_co,'showtext',p.show);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); title(s,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v10; b=p.dv10; sx=let(i)+p.s10; i=i+1; a10=a; b10=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v11; b=p.dv11; sx=let(i)+p.s11; i=i+1; a11=a; b11=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v12; b=p.dv12; sx=let(i)+p.s12; i=i+1; a12=a; b12=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); title(s,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(row,col,i); a=p.v13; b=p.dv13; sx=let(i)+p.s13; i=i+1; a13=a; b13=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v14; b=p.dv14; sx=let(i)+p.s14; i=i+1; a14=a; b14=b;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); a=p.v15; b=p.dv15; sx=let(i)+p.s15; i=i+1; a15=a; b15=b;
pcolor(lon,lat,a); hold on; shading flat;  caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co); 
s=sprintf('%s (%5.3f%s)',sx,b,p.unit); title(s,'FontSize',fsize);

cb=colorbar('FontSize',fsize+2,'Location','southoutside');
set(cb, 'Position', [.165 .04 .7 .02]); caxis([cmin1, cmax1]); 
cb.Label.String = p.unit_bar; %title(cb, unit,'FontSize',fsize+2);
pos=get(cb,'Position')
cb.Label.Position = [pos(1)/2+p.pos1 pos(2)+1.7];  %for radiation

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%nn=256;  cmap=bluewhitered_miz(nn); colormap(cmap);
%nn=256; cmap=cbrewer('div','BrBG',nn); colormap(cmap);
%nn=256; cmap=cbrewer('div','Spectral',nn); colormap(cmap);
%nn=256; cmap=cbrewer('seq','Greens',nn); colormap(cmap);
%expn='cm4_spear_climsen'; visfig='off'; figpath='./fig_gclimsen/';
expn='warming_pattern'; visfig='off'; figpath='./fig_cre/';
printnew(visfig,figpath,expn,p.vname);
return
