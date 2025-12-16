function plot_2d_diff_warm_2(p)
%str=vname(end-2:end);
x1=p.x1; y1=p.y1; z1=p.z1; z2=p.z2; lm=p.lm; cs1=p.cs1; cs2=p.cs2;
s0=p.s0; s1=p.s1; s2=p.s2; str=p.str; a=p.a;

%compute statistics

dtas1=mean(mean(p.dtas1.*p.a));z1=z1/dtas1; %e=e/dtas0; diff_pdk=mean(e(id).*aa);
dtas2=mean(mean(p.dtas2.*p.a));z2=z2/dtas2; %e=e/dtas0; diff_pdk=mean(e(id).*aa);

id= isnan(p.z0); id=~id; aa=a(id)/mean(a(id)); c1_mean=mean(p.z0(id).*aa);%disp(c1_mean)
id= isnan(p.z3); id=~id; aa=a(id)/mean(a(id)); c2_mean=mean(p.z3(id).*aa);%disp(c2_mean)
disp('c1_mean='); disp(c1_mean);
disp('c2_mean='); disp(c2_mean);

id= isnan(z1); id=~id; aa=a(id)/mean(a(id)); z1_mean=mean(z1(id).*aa);
id= isnan(z2); id=~id; aa=a(id)/mean(a(id)); z2_mean=mean(z2(id).*aa);
msg=sprintf('z1mean=%f; z2mean=%f; dtas1=%f; dtas2=%f',z1_mean,z2_mean,dtas1,dtas2);
disp(msg); %str=strcat(' (',str,')'); s0=strcat(s0,str); s1=strcat(s1,str); 

pms=[ 0, 0, 500, 600]*1; fsize=12; lw=2; row=2; col=1;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); xy=[0 360 -90 90]; xl='longitude'; yl='latitude';
pcolor(x1,y1,z1); hold on; shading flat; colorbar; caxis([cs1]); 
contour(x1,y1,lm,1,'k'); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
%s1=sprintf('%s (mean:%5.4f))',s1(1:end-1),z1_mean); 
title(s1,'FontSize',fsize); 

subplot(row,col,2);
pcolor(x1,y1,z2); hold on; shading flat; colorbar; caxis([cs1]); 
contour(x1,y1,lm,1,'k'); axis(xy); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
%s2=sprintf('%s (mean:%5.4f))',s2(1:end-1),z2_mean); 
title(s2,'FontSize',fsize); 

visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,p.vname);
