function plot_2d_6panel_new(p)
%str=vname(end-2:end);
x=p.x; y=p.y; lm=p.lm; aa=p.aa; id=p.id;
z1=p.z1; z2=p.z2; z3=p.z3; z4=p.z4; z5=p.z5; z6=p.z6;  
s1=p.s1; s2=p.s2; s3=p.s3; s4=p.s4; s5=p.s5; s6=p.s6; 
%a=z1; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z1_mean=mean(z1(i).*a);
%a=z2; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z2_mean=mean(z2(i).*a);
%a=z3; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z3_mean=mean(z3(i).*a);
%a=z4; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z4_mean=mean(z4(i).*a);
%a=z5; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z5_mean=mean(z5(i).*a);
%a=z6; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z6_mean=mean(z6(i).*a);
opt=1; %0:treat NaN as 0; 1:treat NaN as NaN; 100:use dz_mean
z1_mean=miznanmean(z1,id,aa,opt);
z2_mean=miznanmean(z2,id,aa,opt);
z3_mean=miznanmean(z3,id,aa,opt);
z4_mean=miznanmean(z4,id,aa,opt);
z5_mean=miznanmean(z5,id,aa,opt);
z6_mean=miznanmean(z6,id,aa,opt);
if (~isfield(p,'optit'))
  s1=sprintf('%s (mean:%5.3f)',s1,z1_mean);
  s2=sprintf('%s (mean:%5.3f)',s2,z2_mean);
  s3=sprintf('%s (mean:%5.3f)',s3,z3_mean); 
  s4=sprintf('%s (mean:%5.3f)',s4,z4_mean);
  s5=sprintf('%s (mean:%5.3f)',s5,z5_mean); 
  s6=sprintf('%s (mean:%5.3f)',s6,z6_mean); 
elseif (p.optit==0)
  s1=sprintf('%s (mean:%5.3f)',s1,p.z1_avg);
  s2=sprintf('%s (mean:%5.3f)',s2,p.z2_avg);
  s3=sprintf('%s (mean:%5.3f)',s3,p.z3_avg); 
  s4=sprintf('%s (mean:%5.3f)',s4,p.z4_avg);
  s5=sprintf('%s (mean:%5.3f)',s5,p.z5_avg); 
  s6=sprintf('%s (mean:%5.3f)',s6,p.z6_avg); 
  %s1=sprintf('%s (mean:%5.2f)',s1,z1_mean);
  %s2=sprintf('%s (mean:%5.2f)',s2,z2_mean);
  %s3=sprintf('%s (mean:%5.2f)',s3,z3_mean); 
  %s4=sprintf('%s (mean:%5.2f)',s4,z4_mean);
  %s5=sprintf('%s (mean:%5.2f)',s5,z5_mean); 
  %s6=sprintf('%s (mean:%5.2f)',s6,z6_mean); 
elseif (p.optit==1)
  s1=sprintf('%s (mean:%5.2f%%)',s1,p.z1_avg);
  s2=sprintf('%s (mean:%5.2f%%)',s2,p.z2_avg);
  s3=sprintf('%s (mean:%5.2f%%)',s3,p.z3_avg); 
  s4=sprintf('%s (mean:%5.2f%%)',s4,p.z4_avg);
  s5=sprintf('%s (mean:%5.2f%%)',s5,p.z5_avg); 
  s6=sprintf('%s (mean:%5.2f%%)',s6,p.z6_avg); 
elseif (p.optit==2)
  s1=sprintf('%s (mean:%5.3f%%/K)',  s1,p.z1_mean);
  s2=sprintf('%s (mean:%5.2f%%/K;%5.2f%%/K)',s2,p.z2_mean,p.z2_avg);
  s3=sprintf('%s (mean:%5.3f%%/K)',  s3,p.z3_mean); 
  s4=sprintf('%s (mean:%5.2f%%/K;%5.2f%%/K)',s4,p.z4_mean,p.z4_avg);
  s5=sprintf('%s (mean:%5.3f%%/K)',  s5,p.z5_mean); 
  s6=sprintf('%s (mean:%5.2f%%/K;%5.2f%%/K)',s6,p.z6_mean,p.z6_avg); 
elseif (p.optit==3)
  s1=sprintf('%s (%5.2f%%/K:%5.2f%%/K)',s1,p.z1_mean,p.z1_avg);
  s2=sprintf('%s (%5.2f%%/K;%5.2f%%/K)',s2,p.z2_mean,p.z2_avg);
  s3=sprintf('%s (%5.2f%%/K;%5.2f%%/K)',s3,p.z3_mean,p.z3_avg); 
  s4=sprintf('%s (%5.2f%%/K;%5.2f%%/K)',s4,p.z4_mean,p.z4_avg);
  s5=sprintf('%s (%5.2f%%/K;%5.2f%%/K)',s5,p.z5_mean,p.z5_avg); 
  s6=sprintf('%s (%5.2f%%/K;%5.2f%%/K)',s6,p.z6_mean,p.z6_avg); 
elseif (p.optit==4)
  s1=sprintf('%s (mean:%5.3f%%/K)',  s1,p.z1_mean);
  s2=sprintf('%s (mean:%5.2fmm/day/K;%5.2fmm/day/K)',s2,p.z2_mean,p.z2_avg);
  s3=sprintf('%s (mean:%5.3f%%/K)',  s3,p.z3_mean); 
  s4=sprintf('%s (mean:%5.2fmm/day/K;%5.2fmm/day/K)',s4,p.z4_mean,p.z4_avg);
  s5=sprintf('%s (mean:%5.3f%%/K)',  s5,p.z5_mean); 
  s6=sprintf('%s (mean:%5.2fmm/day/K;%5.2fmm/day/K)',s6,p.z6_mean,p.z6_avg); 
elseif (p.optit==5)
  s1=sprintf('%s (global mean:%5.2f%%/K)',s1,p.dz1_mean);
  s2=sprintf('%s (global mean:%5.2f%%/K)',s2,p.dz2_mean);
  s3=sprintf('%s (global mean:%5.2f%%/K)',s3,p.dz3_mean); 
  s4=sprintf('%s (global mean:%5.2f%%/K)',s4,p.dz4_mean);
  s5=sprintf('%s (global mean:%5.2f%%/K)',s5,p.dz5_mean); 
  s6=sprintf('%s (global mean:%5.2f%%/K)',s6,p.dz6_mean); 
else
  disp('no title');
end

%xy=[0 360 -90 90]; 
xl='longitude'; yl='latitude'; xy=p.xy;

pms=[ 0, 0, 1100, 900]*1; fsize=8; lw=2; row=3; col=2;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); 
pcolor(x,y,z1); hold on; shading flat; colorbar; caxis([p.c1]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s1=sprintf('%s (mean:%5.3f; %5.1f%%)',s1,z1_mean,z1_mean/z0_mean*100); 
title(s1,'FontSize',fsize); set(gca,'Box','on');
subplot(row,col,2); 
pcolor(x,y,z2); hold on; shading flat; colorbar; caxis([p.c2]); 
contour(x,y,lm,1,p.c); axis(xy);
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s6=sprintf('%s (mean:%5.3f; %5.1f%%)',s6,z6_mean,z6_mean/z0_mean*100); 
title(s2,'FontSize',fsize); set(gca,'Box','on');

subplot(row,col,3); 
pcolor(x,y,z3); hold on; shading flat; colorbar; caxis([p.c3]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s2=sprintf('%s (mean:%5.3f; %5.1f%%)',s2,z2_mean,z2_mean/z0_mean*100); 
title(s3,'FontSize',fsize); set(gca,'Box','on');
subplot(row,col,4); 
pcolor(x,y,z4); hold on; shading flat; colorbar; caxis([p.c4]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s3=sprintf('%s (mean:%5.3f; %5.1f%%)',s3,z3_mean,z3_mean/z0_mean*100); 
title(s4,'FontSize',fsize); set(gca,'Box','on');
subplot(row,col,5); 
pcolor(x,y,z5); hold on; shading flat; colorbar; caxis([p.c5]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s4=sprintf('%s (mean:%5.3f; %5.1f%%)',s4,z4_mean,z4_mean/z0_mean*100); 
title(s5,'FontSize',fsize); set(gca,'Box','on');
subplot(row,col,6);
pcolor(x,y,z6); hold on; shading flat; colorbar; caxis([p.c6]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s5=sprintf('%s (mean:%5.3f; %5.1f%%)',s5,z5_mean,z5_mean/z0_mean*100); 
title(s6,'FontSize',fsize); set(gca,'Box','on');

if (p.opt==1)
  mizcolormap(p.cm);
elseif (p.opt==2);
  nn=p.nn; cmap=jet(nn); 
  cmap(nn/2:nn/2+1,:)=1; colormap(cmap);
elseif (p.opt==3);
  nn=p.nn; cmap=jet(nn); 
  cmap(nn-1:nn,:)=1; colormap(cmap);
elseif (p.opt==4);
  nn=p.nn; cmap=jet(nn); 
  cmap(1:1,:)=1; colormap(cmap);
elseif (p.opt==5);
  nn=p.nn; cmap=bluewhitered_miz(nn);
  colormap(cmap);
else
  colormap(jet);
end

visfig='off'; figpath='./fig_cre/'; expn='readartc'; 
printnew(visfig,figpath,p.expn,p.vname);
