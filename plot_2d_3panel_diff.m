function plot_2d_3panel_diff(p)
%str=vname(end-2:end);
x1=p.x1; y1=p.y1; z0=p.z0; z1=p.z1; dz=p.dz;
lm=p.lm; cs0=p.cs0; cs1=p.cs1; cs2=p.cs2;
s0=p.s0; s1=p.s1; s2=p.s2; str=p.str; a=p.a;
  
%compute statistics
id= isnan(z0) | isnan(z1); 
id=~id; id(p.j1:p.j2,:)=0;
aa=a(id)/mean(a(id));
z0_mean=mean(z0(id).*aa);
z1_mean=mean(z1(id).*aa);
dz_mean=mean(dz(id).*aa);
dz_mean=(z1_mean-z0_mean)/z0_mean/p.dtas*100;
c=corrcoef(z1(id),z0(id)); corr=c(1,2); 
msg=sprintf('z0mean=%f; z1mean=%f; dzmean=%f; corr=%f',z0_mean,z1_mean,dz_mean,corr);
disp(msg);
%end of compute statistics
%str=strcat(' (',str,')'); s1=strcat(s1,str); s2=strcat(s2,str); 
%%%%%%%%%%%%%%%%
pms=[ 0, 0, 500, 900]*1; fsize=16; lw=2; row=3; col=1;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); xy=[0 360 -90 90]; xl='longitude'; yl='latitude';
pcolor(x1,y1,z0); hold on; shading flat; colorbar; caxis([cs0]); 
contour(x1,y1,lm,1,'w'); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
s0=sprintf('%s (mean:%5.2f)',s0,z0_mean); 
title(s0,'FontSize',fsize); 

subplot(row,col,2);
pcolor(x1,y1,z1); hold on; shading flat; colorbar; caxis([cs1]); 
contour(x1,y1,lm,1,'w'); axis(xy); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); title(s2,'FontSize',fsize); 
s1=sprintf('%s (mean:%5.2f)',s1,z1_mean); 
title(s1,'FontSize',fsize); 

subplot(row,col,3); %e=e./z0*100;
pcolor(x1,y1,dz); hold on; shading flat; colorbar; caxis([cs2]);
contour(x1,y1,lm,1,'w'); axis(xy); 
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
s2=sprintf('%s (mean:%5.2f%%/K)',s2,dz_mean); 
title(s2,'FontSize',fsize); 
set(gca,'FontSize',fsize);

visfig='off'; figpath='./fig_PE/'; expn='hiresmip'; 
printit(visfig,figpath,expn,p.vname);
