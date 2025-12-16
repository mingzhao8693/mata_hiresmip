function plot_2d_9panel_gf(p)
%str=vname(end-2:end);
x=p.x; y=p.y; lm=p.lm; aa=p.aa; id=p.id;
z1=p.z1; z2=p.z2; z3=p.z3; z4=p.z4; z5=p.z5; z6=p.z6;z7=p.z7; z8=p.z8; z9=p.z9;
s1=p.s1; s2=p.s2; s3=p.s3; s4=p.s4; s5=p.s5; s6=p.s6;s7=p.s7; s8=p.s8; s9=p.s9;
%a=z1; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z1_mean=mean(z1(i).*a);
%a=z2; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z2_mean=mean(z2(i).*a);
%a=z3; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z3_mean=mean(z3(i).*a);
%a=z4; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z4_mean=mean(z4(i).*a);
opt=0; %0:treat NaN as 0; 1:treat NaN as NaN; 100:use dz_mean
z1_mean=miznanmean(z1,id,aa,opt);
z2_mean=miznanmean(z2,id,aa,opt);
z3_mean=miznanmean(z3,id,aa,opt);
z4_mean=miznanmean(z4,id,aa,opt);
z5_mean=miznanmean(z5,id,aa,opt);
z6_mean=miznanmean(z6,id,aa,opt);
z7_mean=miznanmean(z7,id,aa,opt);
z8_mean=miznanmean(z8,id,aa,opt);
z9_mean=miznanmean(z9,id,aa,opt);
if (~isfield(p,'optit'))
  s1=sprintf('%s (mean:%5.3f)',s1,z1_mean);
  s2=sprintf('%s (mean:%5.3f)',s2,z2_mean);
  s3=sprintf('%s (mean:%5.3f)',s3,z3_mean); 
  s4=sprintf('%s (mean:%5.3f)',s4,z4_mean);
  s5=sprintf('%s (mean:%5.3f)',s5,z5_mean); 
  s6=sprintf('%s (mean:%5.3f)',s6,z6_mean); 
  s7=sprintf('%s (mean:%5.3f)',s7,z7_mean); 
  s8=sprintf('%s (mean:%5.3f)',s8,z8_mean); 
  s9=sprintf('%s (mean:%5.3f)',s9,z9_mean); 
elseif (p.optit==0)
  s1=sprintf('%s (mean:%5.2f%%)',s1,z1_mean);
  s2=sprintf('%s (mean:%5.2f%%)',s2,z2_mean);
  s3=sprintf('%s (mean:%5.2f%%)',s3,z3_mean); 
  s4=sprintf('%s (mean:%5.2f%%)',s4,z4_mean);
  s5=sprintf('%s (mean:%5.2f%%)',s5,z5_mean); 
  s6=sprintf('%s (mean:%5.2f%%)',s6,z6_mean); 
  s7=sprintf('%s (mean:%5.2f%%)',s7,z7_mean); 
  s8=sprintf('%s (mean:%5.2f%%)',s8,z8_mean); 
  s9=sprintf('%s (mean:%5.2f%%)',s9,z9_mean); 
elseif (p.optit==1)
  s1=sprintf('%s (%5.2f %s)',s1,z1_mean,p.un);
  s2=sprintf('%s (%5.2f %s)',s2,z2_mean,p.un);
  s3=sprintf('%s (%5.2f %s)',s3,z3_mean,p.un); 
  s4=sprintf('%s (%5.2f %s)',s4,z4_mean,p.un);
  s5=sprintf('%s (%5.2f %s)',s5,z5_mean,p.un); 
  s6=sprintf('%s (%5.2f %s)',s6,z6_mean,p.un); 
  s7=sprintf('%s (%5.2f %s)',s7,z7_mean,p.un); 
  s8=sprintf('%s (%5.2f %s)',s8,z8_mean,p.un); 
  s9=sprintf('%s (%5.2f %s)',s9,z9_mean,p.un); 
elseif (p.optit==2)
  s1=sprintf('%s (mean:%5.2f %s)',s1,z1_mean,p.un);
  s2=sprintf('%s (mean:%5.2f %s)',s2,z2_mean,p.un);
  s3=sprintf('%s (mean:%5.2f%%)',s3,z3_mean); 
  s4=sprintf('%s (mean:%5.2f%%)',s4,z4_mean);
  s5=sprintf('%s (mean:%5.2f%%)',s5,z5_mean); 
  s6=sprintf('%s (mean:%5.2f%%)',s6,z6_mean); 
  s7=sprintf('%s (mean:%5.2f%%)',s7,z7_mean); 
  s8=sprintf('%s (mean:%5.2f%%)',s8,z8_mean); 
  s9=sprintf('%s (mean:%5.2f%%)',s9,z9_mean); 
elseif (p.optit==3)
  s1=sprintf('%s (mean:%5.2f %s)',s1,z1_mean,p.un);
  s2=sprintf('%s (mean:%5.2f %s)',s2,z2_mean,p.un);
  s3=sprintf('%s (mean:%5.3f%%)',s3,z3_mean/z1_mean*100); 
  s4=sprintf('%s (mean:%5.3f%%)',s4,z4_mean/z2_mean*100);
  s5=sprintf('%s (mean:%5.3f%%)',s5,z5_mean/z1_mean*100); 
  s6=sprintf('%s (mean:%5.3f%%)',s6,z6_mean/z2_mean*100); 
  s7=sprintf('%s (mean:%5.3f%%)',s7,z7_mean/z1_mean*100); 
  s8=sprintf('%s (mean:%5.3f%%)',s8,z8_mean/z2_mean*100); 
  s9=sprintf('%s (mean:%5.3f%%)',s9,z9_mean/z2_mean*100); 
elseif (p.optit==4)
  s1=sprintf('%s (%5.2f %s)',s1,z1_mean,p.un);
  s2=sprintf('%s (%5.2f %s)',s2,z2_mean,p.un);
  s3=sprintf('%s (%5.2f %s)',s3,z3_mean,p.un); 
  s4=sprintf('%s (%5.2f %s)',s4,z4_mean,p.un);
  s5=sprintf('%s (%5.2f %s)',s5,z5_mean,p.un); 
  s6=sprintf('%s (%5.2f %s)',s6,z6_mean,p.un); 
  s7=sprintf('%s (%5.2f %s)',s7,z7_mean,p.un); 
  s8=sprintf('%s (%5.2f %s)',s8,z8_mean,p.un); 
  s9=sprintf('%s (%5.2f %s)',s9,z9_mean,p.un); 
elseif (p.optit==5)
  a=corrcoef(z1,z1); s1=sprintf('%s (avg=%5.2f; r=%5.2f)',s1,z1_mean,a(1,2));
  a=corrcoef(z2,z2); s2=sprintf('%s (avg=%5.2f; r=%5.2f)',s2,z2_mean,a(1,2)); 
  a=corrcoef(z3,z3); s3=sprintf('%s (avg=%5.2f; r=%5.2f)',s3,z3_mean,a(1,2));
  a=corrcoef(z4,z1); s4=sprintf('%s (avg=%5.2f; r=%5.2f)',s4,z4_mean,a(1,2)); 
  a=corrcoef(z5,z2); s5=sprintf('%s (avg=%5.2f; r=%5.2f)',s5,z5_mean,a(1,2)); 
  a=corrcoef(z6,z3); s6=sprintf('%s (avg=%5.2f; r=%5.2f)',s6,z6_mean,a(1,2)); 
  a=corrcoef(z7,z1); s7=sprintf('%s (avg=%5.2f; r=%5.2f)',s7,z7_mean,a(1,2)); 
  a=corrcoef(z8,z2); s8=sprintf('%s (avg=%5.2f; r=%5.2f)',s8,z8_mean,a(1,2)); 
  a=corrcoef(z9,z3); s9=sprintf('%s (avg=%5.2f; r=%5.2f)',s9,z9_mean,a(1,2)); 
else
  disp('no title');
end
%xy=[0 360 -90 90]; 
xl='longitude'; yl='latitude'; xy=p.xy; a_th1=0.1; a_th2=1;
fq_th=[0.01 0.10]; color='blue'; fs=5;
pms=[ 0, 0, 1700, 1000]*1.5; fsize=10; lw=2; row=3; col=3;
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
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c3]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s2=sprintf('%s (mean:%5.3f; %5.1f%%)',s2,z2_mean,z2_mean/z0_mean*100); 
title(s5,'FontSize',fsize); 

subplot(row,col,6); a=z6; %id=abs(a)<a_th1; a(id)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c4]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s3=sprintf('%s (mean:%5.3f; %5.1f%%)',s3,z3_mean,z3_mean/z0_mean*100); 
title(s6,'FontSize',fsize); 

subplot(row,col,7); a=z7; %id=abs(a)<a_th1; a(id)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c4]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s3=sprintf('%s (mean:%5.3f; %5.1f%%)',s3,z3_mean,z3_mean/z0_mean*100); 
title(s7,'FontSize',fsize); 

subplot(row,col,8); a=z8; %id=abs(a)<a_th1; a(id)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c3]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s2=sprintf('%s (mean:%5.3f; %5.1f%%)',s2,z2_mean,z2_mean/z0_mean*100); 
title(s8,'FontSize',fsize); 

subplot(row,col,9); a=z9; %id=abs(a)<a_th1; a(id)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c4]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s3=sprintf('%s (mean:%5.3f; %5.1f%%)',s3,z3_mean,z3_mean/z0_mean*100); 
title(s9,'FontSize',fsize); 

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
return
visfig='off'; figpath='./fig_CRE/'; expn='artcmcs'; 
printnew(visfig,figpath,p.expn,p.vname);
