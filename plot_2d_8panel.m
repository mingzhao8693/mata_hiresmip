function plot_2d_8panel(p)
%str=vname(end-2:end);
x=p.x; y=p.y; lm=p.lm; aa=p.aa; id=p.id; fsize=p.fsize;
z1=p.z1; z2=p.z2; z3=p.z3; z4=p.z4; z5=p.z5; z6=p.z6; z7=p.z7; z8=p.z8; 
s1=p.s1; s2=p.s2; s3=p.s3; s4=p.s4; s5=p.s5; s6=p.s6; s7=p.s7; s8=p.s8; 
%a=z1; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z1_mean=mean(z1(i).*a);
%a=z2; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z2_mean=mean(z2(i).*a);
%a=z3; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z3_mean=mean(z3(i).*a);
%a=z4; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z4_mean=mean(z4(i).*a);
%a=z5; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z5_mean=mean(z5(i).*a);
%a=z6; i=~isnan(a)&id; a=aa(i)/mean(aa(i)); z6_mean=mean(z6(i).*a);
opt=0; %0:treat NaN as 0; 1:treat NaN as NaN; 100:use dz_mean
z1_mean=miznanmean(z1,id,aa,opt);
z2_mean=miznanmean(z2,id,aa,opt);
z3_mean=miznanmean(z3,id,aa,opt);
z4_mean=miznanmean(z4,id,aa,opt);
z5_mean=miznanmean(z5,id,aa,opt);
z6_mean=miznanmean(z6,id,aa,opt);
z7_mean=miznanmean(z7,id,aa,opt);
z8_mean=miznanmean(z8,id,aa,opt);
if (~isfield(p,'optit'))
  s1=sprintf('%s (mean:%5.3f)',s1,z1_mean);
  s2=sprintf('%s (mean:%5.3f)',s2,z2_mean);
  s3=sprintf('%s (mean:%5.3f)',s3,z3_mean); 
  s4=sprintf('%s (mean:%5.3f)',s4,z4_mean);
  s5=sprintf('%s (mean:%5.3f)',s5,z5_mean); 
  s6=sprintf('%s (mean:%5.3f)',s6,z6_mean); 
  s7=sprintf('%s (mean:%5.3f)',s7,z7_mean); 
  s8=sprintf('%s (mean:%5.3f)',s8,z8_mean); 
elseif (p.optit==0)
  s1=sprintf('%s (mean:%5.2f%%)',s1,z1_mean);
  s2=sprintf('%s (mean:%5.2f%%)',s2,z2_mean);
  s3=sprintf('%s (mean:%5.2f%%)',s3,z3_mean); 
  s4=sprintf('%s (mean:%5.2f%%)',s4,z4_mean);
  s5=sprintf('%s (mean:%5.2f%%)',s5,z5_mean); 
  s6=sprintf('%s (mean:%5.2f%%)',s6,z6_mean); 
  s7=sprintf('%s (mean:%5.2f%%)',s7,z7_mean); 
  s8=sprintf('%s (mean:%5.2f%%)',s8,z8_mean); 
elseif (p.optit==1)
  s1=sprintf('%s (%5.2f %s)',s1,z1_mean,p.un);
  s2=sprintf('%s (%5.2f %s)',s2,z2_mean,p.un);
  s3=sprintf('%s (%5.2f %s)',s3,z3_mean,p.un); 
  s4=sprintf('%s (%5.2f %s)',s4,z4_mean,p.un);
  s5=sprintf('%s (%5.2f %s)',s5,z5_mean,p.un); 
  s6=sprintf('%s (%5.2f %s)',s6,z6_mean,p.un); 
  s7=sprintf('%s (%5.2f %s)',s7,z7_mean,p.un); 
%  s8=sprintf('%s (%5.2f %s)',s8,z8_mean,p.un); 
%  s8=sprintf('%s (%5.2f\\%%)',s8,z8_mean); 
  s8=sprintf('%s (%5.2f\\%%)',s8,z7_mean/z1_mean*100); 
elseif (p.optit==2)
  s1=sprintf('%s (mean:%5.2f %s)',s1,z1_mean,p.un);
  s2=sprintf('%s (mean:%5.2f %s)',s2,z2_mean,p.un);
  s3=sprintf('%s (mean:%5.2f%%)',s3,z3_mean); 
  s4=sprintf('%s (mean:%5.2f%%)',s4,z4_mean);
  s5=sprintf('%s (mean:%5.2f%%)',s5,z5_mean); 
  s6=sprintf('%s (mean:%5.2f%%)',s6,z6_mean); 
  s7=sprintf('%s (mean:%5.2f%%)',s7,z7_mean); 
  s8=sprintf('%s (mean:%5.2f%%)',s8,z8_mean); 
% $$$   s1=sprintf('%s (global mean:%5.2f%%/K)',s1,p.dz1_mean);
% $$$   s2=sprintf('%s (global mean:%5.2f%%/K)',s2,p.dz2_mean);
% $$$   s3=sprintf('%s (global mean:%5.2f%%/K)',s3,p.dz3_mean); 
% $$$   s4=sprintf('%s (global mean:%5.2f%%/K)',s4,p.dz4_mean);
% $$$   s5=sprintf('%s (global mean:%5.2f%%/K)',s5,p.dz5_mean); 
% $$$   s6=sprintf('%s (global mean:%5.2f%%/K)',s6,p.dz6_mean); 
elseif (p.optit==3)
  s1=sprintf('%s (mean:%5.2f %s)',s1,z1_mean,p.un);
  s2=sprintf('%s (mean:%5.2f %s)',s2,z2_mean,p.un);
  s3=sprintf('%s (mean:%5.3f%%)',s3,z3_mean/z1_mean*100); 
  s4=sprintf('%s (mean:%5.3f%%)',s4,z4_mean/z2_mean*100);
  s5=sprintf('%s (mean:%5.3f%%)',s5,z5_mean/z1_mean*100); 
  s6=sprintf('%s (mean:%5.3f%%)',s6,z6_mean/z2_mean*100); 
  s7=sprintf('%s (mean:%5.3f%%)',s7,z7_mean/z1_mean*100); 
  s8=sprintf('%s (mean:%5.3f%%)',s8,z8_mean/z2_mean*100); 
elseif (p.optit==4)
  s1=sprintf('%s (%5.3f%s)',s1,z1_mean,p.un);
  s2=sprintf('%s (%5.3f%s)',s2,z2_mean,p.un);
  s3=sprintf('%s (%5.3f%s)',s3,z3_mean,p.un); 
  s4=sprintf('%s (%5.3f%s)',s4,z4_mean,p.un);
  s5=sprintf('%s (%5.3f%s)',s5,z5_mean,p.un); 
  s6=sprintf('%s (%5.3f%s)',s6,z6_mean,p.un); 
  s7=sprintf('%s (%5.3f%s)',s7,z7_mean,p.un); 
  s8=sprintf('%s (%5.3f%s)',s8,z8_mean,p.un); 
elseif (p.optit==5)
  s1=sprintf('%s (%5.2f %s)',s1,z1_mean,p.un);
  a=corrcoef(z2,z1); s2=sprintf('%s (avg=%5.2f; r=%5.2f)',s2,z2_mean,a(1,2));
  a=corrcoef(z3,z1); s3=sprintf('%s (avg=%5.2f; r=%5.2f)',s3,z3_mean,a(1,2)); 
  a=corrcoef(z4,z1); s4=sprintf('%s (avg=%5.2f; r=%5.2f)',s4,z4_mean,a(1,2));
  a=corrcoef(z5,z1); s5=sprintf('%s (avg=%5.2f; r=%5.2f)',s5,z5_mean,a(1,2)); 
  a=corrcoef(z6,z1); s6=sprintf('%s (avg=%5.2f; r=%5.2f)',s6,z6_mean,a(1,2)); 
  a=corrcoef(z7,z1); s7=sprintf('%s (avg=%5.2f; r=%5.2f)',s7,z7_mean,a(1,2)); 
  a=corrcoef(z8,z1); s8=sprintf('%s (avg=%5.2f; r=%5.2f)',s8,z8_mean,a(1,2)); 
elseif (p.optit==6)
  s1=sprintf('%s (%5.2f %s)',s1,z1_mean,p.un);
  s2=sprintf('%s (%5.2f %s)',s2,z2_mean,p.un);
  s3=sprintf('%s (%5.2f %s)',s3,z3_mean,p.un); 
  s4=sprintf('%s (%5.2f %s)',s4,z4_mean,p.un);
  s5=sprintf('%s (%5.2f %s)',s5,z5_mean,p.un); 
  s6=sprintf('%s (%5.2f %s)',s6,z6_mean,p.un); 
  s7=sprintf('%s (%5.2f %s)',s7,z7_mean,p.un); 
%  s8=sprintf('%s (%5.2f %s)',s8,z8_mean,p.un); 
  s8=sprintf('%s (%5.2f\\%%)',s8,z8_mean); 
elseif (p.optit==7)
  f=p.n1.*aa; id=f==0; z1(id)=0; z1_mean=sum(sum(z1.*f))/sum(sum(f));
  f=p.n2.*aa; id=f==0; z2(id)=0; z2_mean=sum(sum(z2.*f))/sum(sum(f));
  f=p.n3.*aa; id=f==0; z3(id)=0; z3_mean=sum(sum(z3.*f))/sum(sum(f));
  f=p.n4.*aa; id=f==0; z4(id)=0; z4_mean=sum(sum(z4.*f))/sum(sum(f));
  f=p.n5.*aa; id=f==0; z5(id)=0; z5_mean=sum(sum(z5.*f))/sum(sum(f));
  f=p.n6.*aa; id=f==0; z6(id)=0; z6_mean=sum(sum(z6.*f))/sum(sum(f));
  f=p.n7.*aa; id=f==0; z7(id)=0; z7_mean=sum(sum(z7.*f))/sum(sum(f));
  f=p.n8.*aa; id=f==0; z8(id)=0; z8_mean=sum(sum(z8.*f))/sum(sum(f));
  if p.rescale; z8_mean=p.fact; end;
  s1=sprintf('%s (avg=%5.2f %s)',s1,z1_mean,p.un);
  s2=sprintf('%s (avg=%5.2f %s)',s2,z2_mean,p.un);
  s3=sprintf('%s (avg=%5.2f %s)',s3,z3_mean,p.un); 
  s4=sprintf('%s (avg=%5.2f %s)',s4,z4_mean,p.un);
  s5=sprintf('%s (avg=%5.2f %s)',s5,z5_mean,p.un); 
  s6=sprintf('%s (avg=%5.2f %s)',s6,z6_mean,p.un); 
  s7=sprintf('%s (avg=%5.2f %s)',s7,z7_mean,p.un); 
  s8=sprintf('%s (avg=%5.2f %s)',s8,z8_mean,p.un); 
elseif (p.optit==8)
  s1=sprintf('%s (avg=%5.2f %s)',s1,p.N1-p.n1,p.un);
  s2=sprintf('%s (avg=%5.2f %s)',s2,p.N2-p.n2,p.un);
  s3=sprintf('%s (avg=%5.2f %s)',s3,p.N3-p.n3,p.un); 
  s4=sprintf('%s (avg=%5.2f %s)',s4,p.N4-p.n4,p.un);
  s5=sprintf('%s (avg=%5.2f %s)',s5,p.N5-p.n5,p.un); 
  s6=sprintf('%s (avg=%5.2f %s)',s6,p.N6-p.n6,p.un); 
  s7=sprintf('%s (avg=%5.2f %s)',s7,p.N7-p.n7,p.un); 
  s8=sprintf('%s (avg=%5.2f %s)',s8,p.N8-p.n8,p.un); 
elseif (p.optit==9)
  s1=sprintf('%s (avg=%5.2f %s)',s1,p.z1_avg,p.un);
  s2=sprintf('%s (avg=%5.2f %s)',s2,p.z2_avg,p.un);
  s3=sprintf('%s (avg=%5.2f %s)',s3,p.z3_avg,p.un); 
  s4=sprintf('%s (avg=%5.2f %s)',s4,p.z4_avg,p.un);
  s5=sprintf('%s (avg=%5.2f %s)',s5,p.z5_avg,p.un); 
  s6=sprintf('%s (avg=%5.2f %s)',s6,p.z6_avg,p.un); 
  s7=sprintf('%s (avg=%5.2f %s)',s7,p.z7_avg,p.un); 
  s8=sprintf('%s (avg=%5.2f %s)',s8,p.z8_avg,p.un); 
else
  disp('no title');
end

%xy=[0 360 -90 90]; 
xl='longitude'; yl='latitude'; xy=p.xy;

pms=[ 0, 0, 900, 900]*1; lw=2; row=4; col=2;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); a=z1; a(a==0)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c1]); %contour(x,y,a,[25 75],'c','LineWidth',1);
contour(x,y,lm,1,p.c); axis(xy);
ylabel(yl,'FontSize',fsize,'Interpreter','latex');
set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s1=sprintf('%s (mean:%5.3f; %5.1f%%)',s1,z1_mean,z1_mean/z0_mean*100); 
title(s1,'FontSize',fsize,'Interpreter','latex'); 

subplot(row,col,2); a=z2; a(a==0)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c2]); 
contour(x,y,lm,1,p.c); axis(xy);
%ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s6=sprintf('%s (mean:%5.3f; %5.1f%%)',s6,z6_mean,z6_mean/z0_mean*100); 
title(s2,'FontSize',fsize,'Interpreter','latex'); 

subplot(row,col,3); a=z3; a(a==0)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c3]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize,'Interpreter','latex'); 
set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s2=sprintf('%s (mean:%5.3f; %5.1f%%)',s2,z2_mean,z2_mean/z0_mean*100); 
title(s3,'FontSize',fsize,'Interpreter','latex'); 

subplot(row,col,4); a=z4; a(a==0)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c4]); 
contour(x,y,lm,1,p.c); axis(xy); 
%ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s3=sprintf('%s (mean:%5.3f; %5.1f%%)',s3,z3_mean,z3_mean/z0_mean*100); 
title(s4,'FontSize',fsize,'Interpreter','latex'); 

subplot(row,col,5); a=z5; a(a==0)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c5]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize,'Interpreter','latex'); 
set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s4=sprintf('%s (mean:%5.3f; %5.1f%%)',s4,z4_mean,z4_mean/z0_mean*100); 
title(s5,'FontSize',fsize,'Interpreter','latex'); 

subplot(row,col,6); a=z6; a(a==0)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c6]); 
contour(x,y,lm,1,p.c); axis(xy); 
%ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s5=sprintf('%s (mean:%5.3f; %5.1f%%)',s5,z5_mean,z5_mean/z0_mean*100); 
title(s6,'FontSize',fsize,'Interpreter','latex'); 

subplot(row,col,7); a=z7; a(a==0)=NaN;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c7]); 
contour(x,y,lm,1,p.c); axis(xy); 
xlabel(xl,'FontSize',fsize,'Interpreter','latex'); 
ylabel(yl,'FontSize',fsize,'Interpreter','latex'); 
set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c); 
title(s7,'FontSize',fsize,'Interpreter','latex'); 

subplot(row,col,8); a=z8; a(a==0)=NaN; %z8(z8>100)=100;
pcolor(x,y,a); hold on; shading flat; colorbar; caxis([p.c8]); 
contour(x,y,lm,1,p.c); axis(xy); 
xlabel(xl,'FontSize',fsize,'Interpreter','latex'); 
%ylabel(yl,'FontSize',fsize); 
set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c); 
title(s8,'FontSize',fsize,'Interpreter','latex'); 

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
elseif (p.opt==6);
  cmap=mizcolormap(p.cm);%mizcolormap_bw(p.cm);
  nn=floor(length(cmap(:,1))/2);
  cmap(nn:nn+1,:)=1; colormap(cmap);
elseif (p.opt==7);
  cmap=mizcolormap(p.cm);
  mizcolormap_bw(p.cm);
else
  colormap(jet);
end
%if strcmp(p.vn(1:3),'obs');
%  sgtitle('observation','FontSize',12);
%else
%  sgtitle('model','FontSize',12);
%end

visfig='off'; figpath='./fig_cre/'; %expn='storm_cre'; 
printnew(visfig,figpath,p.expn,p.vn);
