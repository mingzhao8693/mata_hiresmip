function plot_2d_3panel_new(p)
%str=vname(end-2:end);
x=p.x; y=p.y; lm=p.lm; aa=p.aa; id=p.id;
z1=p.z1; z2=p.z2; z3=p.z3; %z4=p.z4; %z5=p.z5; z6=p.z6;  
s1=p.s1; s2=p.s2; s3=p.s3; %s4=p.s4; %s5=p.s5; s6=p.s6; 
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
%z4_mean=miznanmean(z4,id,aa,opt);
%z5_mean=miznanmean(z5,id,aa,opt);
%z6_mean=miznanmean(z6,id,aa,opt);
if (~isfield(p,'optit'))
  s1=sprintf('%s (mean:%5.3f)',s1,z1_mean);
  s2=sprintf('%s (mean:%5.3f)',s2,z2_mean);
  s3=sprintf('%s (mean:%5.3f)',s3,z3_mean); 
elseif (p.optit==0)
  s1=sprintf('%s (mean:%5.3f)',s1,z1_mean);
  s2=sprintf('%s (mean:%5.3f)',s2,z2_mean);
  s3=sprintf('%s (mean:%5.3f)',s3,z3_mean); 
elseif (p.optit==1)
  s1=sprintf('%s (mean:%5.2f)',s1,p.z1_avg);
  s2=sprintf('%s (mean:%5.2f)',s2,p.z2_avg);
  s3=sprintf('%s (mean:%5.2f)',s3,p.z3_avg); 
elseif (p.optit==3)
  s1=sprintf('%s (%5.2fK/K:%5.2fK/K)',s1,p.z1_mean,p.z1_avg);
  s2=sprintf('%s (%5.2fK/K;%5.2fK/K)',s2,p.z2_mean,p.z2_avg);
  s3=sprintf('%s (%5.2fK/K;%5.2fK/K)',s3,p.z3_mean,p.z3_avg); 
else
  disp('no title');
end
%xy=[0 360 -90 90]; 
xl='longitude'; yl='latitude'; xy=p.xy;

pms=[ 0, 0, 500, 900]*1; fsize=8; lw=2; row=3; col=1;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); 
pcolor(x,y,z1); hold on; shading flat; colorbar; caxis([p.c1]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s1=sprintf('%s (mean:%5.3f; %5.1f%%)',s1,z1_mean,z1_mean/z0_mean*100); 
title(s1,'FontSize',fsize); 
subplot(row,col,2); 
pcolor(x,y,z2); hold on; shading flat; colorbar; caxis([p.c2]); 
contour(x,y,lm,1,p.c); axis(xy);
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s6=sprintf('%s (mean:%5.3f; %5.1f%%)',s6,z6_mean,z6_mean/z0_mean*100); 
title(s2,'FontSize',fsize); 

subplot(row,col,3); 
pcolor(x,y,z3); hold on; shading flat; colorbar; caxis([p.c3]); 
contour(x,y,lm,1,p.c); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
myboxon(0,360,-90,90,p.c);
%s2=sprintf('%s (mean:%5.3f; %5.1f%%)',s2,z2_mean,z2_mean/z0_mean*100); 
title(s3,'FontSize',fsize); 

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

visfig='off'; figpath='./fig_PE/'; expn='readartc'; 
printnew(visfig,figpath,p.expn,p.vname);
