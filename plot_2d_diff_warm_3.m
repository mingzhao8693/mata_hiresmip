function plot_2d_diff_warm_3(p)
%str=vname(end-2:end);
x1=p.x1; y1=p.y1; z1=p.z1; z2=p.z2; z3=p.z3; lm=p.lm; cs=p.cs; cs1=p.cs1;
s0=p.s0; s1=p.s1; s2=p.s2; str=p.str; a=p.a;

%compute statistics
id= isnan(z1); id=~id; aa=a(id)/mean(a(id)); z1_mean=mean(z1(id).*aa);
id= isnan(z2); id=~id; aa=a(id)/mean(a(id)); z2_mean=mean(z2(id).*aa);
id= isnan(z3); id=~id; aa=a(id)/mean(a(id)); z3_mean=mean(z3(id).*aa);

dtas0=mean(mean(p.dtas.*p.a));%e=e/dtas0; diff_pdk=mean(e(id).*aa);
msg=sprintf('z1mean=%f; z2mean=%f; z3mean=%f; dtas0=%f',...
	    z1_mean,z2_mean,z3_mean,dtas0);
disp(msg); %str=strcat(' (',str,')'); s0=strcat(s0,str); s1=strcat(s1,str); 

pms=[ 0, 0, 500, 900]*1; fsize=16; lw=2; row=3; col=1;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); xy=[0 360 -90 90]; xl='longitude'; yl='latitude';
pcolor(x1,y1,z1); hold on; shading flat; colorbar; caxis([cs]); 
contourf(x1,y1,lm/10,'w'); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
s1=sprintf('%s (mean:%5.4f)',s1,z1_mean); 
title(s1,'FontSize',fsize); 

subplot(row,col,2);
pcolor(x1,y1,z2); hold on; shading flat; colorbar; caxis([cs]); 
contourf(x1,y1,lm/10,'w'); axis(xy); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
s0=sprintf('%s (mean:%5.4f)',s0,z0_mean); 
title(s0,'FontSize',fsize); 

subplot(row,col,3); 
pcolor(x1,y1,z3); hold on; shading flat; colorbar; caxis([cs1]);
contourf(x1,y1,lm/50,'w'); axis(xy); 
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
title(s2,'FontSize',fsize);
%subplot(row,col,4);
%pcolor(x1,y1,(z1-z0)./z0*100); hold on; shading flat; colorbar; axis(xy); 
%xlabel(xl,'FontSize',fsize); %ylabel(yl,'FontSize',fsize);
%contourf(x1,y1,lm,'w'); 
%set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,p.vname);
