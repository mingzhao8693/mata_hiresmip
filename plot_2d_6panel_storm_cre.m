function plot_2d_6panel_storm_cre(p)
%str=vname(end-2:end);
x=p.x; y=p.y; lm=p.lm; aa=p.aa; id=p.id; fsize=p.fsize;
z1=p.z1; z2=p.z2; z3=p.z3; z4=p.z4; z5=p.z5; z6=p.z6;
s1=p.s1; s2=p.s2; s3=p.s3; s4=p.s4; s5=p.s5; s6=p.s6;
%a=z1; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z1_mean=mean(z1(i).*a);
%a=z2; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z2_mean=mean(z2(i).*a);
%a=z3; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z3_mean=mean(z3(i).*a);
%a=z4; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z4_mean=mean(z4(i).*a);
opt=1; %0:treat NaN as 0; 1:treat NaN as NaN; 100:use dz_mean
z1_mean=miznanmean(z1,id,aa,opt);
z2_mean=miznanmean(z2,id,aa,opt);
z3_mean=miznanmean(z3,id,aa,opt);
z4_mean=miznanmean(z4,id,aa,opt);
z5_mean=miznanmean(z5,id,aa,opt);
z6_mean=miznanmean(z6,id,aa,opt);
if (opt==100)
  s1=sprintf('%s (global mean:%5.2f%%/K)',s1,p.dz1_mean);
  s2=sprintf('%s (global mean:%5.2f%%/K)',s2,p.dz2_mean);
  s3=sprintf('%s (global mean:%5.2f%%/K)',s3,p.dz3_mean); 
  s4=sprintf('%s (global mean:%5.2f%%/K)',s4,p.dz4_mean);
else
  s1=sprintf('%s (mean:%5.2fW/m2)',s1,z1_mean);
  s2=sprintf('%s (mean:%5.2fW/m2)',s2,z2_mean);
  s3=sprintf('%s (mean:%5.2fW/m2)',s3,z3_mean); 
  s4=sprintf('%s (mean:%5.2fW/m2)',s4,z4_mean);
  s5=sprintf('%s (mean:%5.2fW/m2)',s5,z5_mean); 
  s6=sprintf('%s (mean:%5.2fW/m2)',s6,z6_mean);
end
%xy=[0 360 -90 90]; 
xl='longitude'; yl='latitude'; xy=p.xy; a_th1=0.1; a_th2=1;

pms=[ 0, 0, 1100, 1000]*0.85; lw=2; row=3; col=2;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); a=z1; %id=abs(a)<a_th1; a(id)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c1]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s1=sprintf('%s (mean:%5.3f; %5.1f%%)',s1,z1_mean,z1_mean/z0_mean*100); 
title(s1,'FontSize',fsize); 

subplot(row,col,2); a=z2; %id=abs(a)<a_th1; a(id)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c2]); 
contour(x,y,lm,1,p.c); axis(xy);
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s6=sprintf('%s (mean:%5.3f; %5.1f%%)',s6,z6_mean,z6_mean/z0_mean*100); 
title(s2,'FontSize',fsize); 

subplot(row,col,3); a=z3; %id=abs(a)<a_th1; a(id)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c3]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s2=sprintf('%s (mean:%5.3f; %5.1f%%)',s2,z2_mean,z2_mean/z0_mean*100); 
title(s3,'FontSize',fsize); 

subplot(row,col,4); a=z4; %id=abs(a)<a_th1; a(id)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c4]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s3=sprintf('%s (mean:%5.3f; %5.1f%%)',s3,z3_mean,z3_mean/z0_mean*100); 
title(s4,'FontSize',fsize); 

subplot(row,col,5); a=z5; %id=abs(a)<a_th1; a(id)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c5]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s2=sprintf('%s (mean:%5.3f; %5.1f%%)',s2,z2_mean,z2_mean/z0_mean*100); 
title(s5,'FontSize',fsize); 

subplot(row,col,6); a=z6; %id=abs(a)<a_th1; a(id)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c6]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s3=sprintf('%s (mean:%5.3f; %5.1f%%)',s3,z3_mean,z3_mean/z0_mean*100); 
title(s6,'FontSize',fsize); 

if (p.opt==1)
  mizcolormap(p.cm);
elseif (p.opt==2);
  nn=p.nn; cmap=jet(nn); 
  cmap(nn/2:nn/2+1,:)=1; colormap(cmap);
elseif (p.opt==3);
  nn=p.nn; cmap=jet(nn); 
  cmap(nn-1:nn,:)=1; colormap(cmap);
else
  colormap(jet);
end

visfig='off'; figpath='./fig_CRE/'; expn='artcmcs'; 
printnew(visfig,figpath,p.expn,p.vname);
