function plot_2d_diff_warm_4(p)
%str=vname(end-2:end);
x1=p.x1; y1=p.y1; z0=p.z0; z1=p.z1; lm=p.lm; cs=p.cs; cs1=p.cs1;
s0=p.s0; s1=p.s1; s2=p.s2; str=p.str; a=p.a;

%compute statistics
id= isnan(z0) | isnan(z1); id=~id;
aa=a(id)/mean(a(id));
z0_mean=mean(z0(id).*aa);
z1_mean=mean(z1(id).*aa);
e=(z1-z0); diff_abs=mean(e(id).*aa); 
dtas0=mean(mean(p.dtas.*p.a)); %e=e./z0./p.dtas;
e=e/dtas0; diff_pdk=mean(e(id).*aa);
msg=sprintf('PDmean=%f; Futuremean=%f; diff_abs=%f; diff_pdk=%f;dtas0=%f',...
	    z0_mean,z1_mean,diff_abs,diff_pdk,dtas0);
disp(msg);

str=strcat(' (',str,')'); s0=strcat(s0,str); s1=strcat(s1,str); 
pms=[ 0, 0, 1000, 500]*1.2; fsize=16; lw=2; row=2; col=2;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); xy=[0 360 -90 90]; xl='longitude'; yl='latitude';
pcolor(x1,y1,z1); hold on; shading flat; colorbar; caxis([cs]); 
contourf(x1,y1,lm/10,'w'); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
s1=sprintf('%s (mean:%5.4f)',s1,z1_mean); 
title(s1,'FontSize',fsize); 

subplot(row,col,2);
pcolor(x1,y1,z0); hold on; shading flat; colorbar; caxis([cs]); 
contourf(x1,y1,lm/10,'w'); axis(xy); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
s0=sprintf('%s (mean:%5.4f)',s0,z0_mean); 
title(s0,'FontSize',fsize); 

subplot(row,col,3); cs1=p.cs3;%p.vname=strcat(p.vname,'_abs');  
diff=(z1_mean-z0_mean)/z0_mean*100/dtas0;
s3=sprintf('%s; \\DeltaG/\\DeltaTs=%5.2f/K',p.s3,diff_pdk);
pcolor(x1,y1,e); hold on; shading flat; colorbar; caxis([cs1]);
contourf(x1,y1,lm/50,'w'); axis(xy); 
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); title(s3,'FontSize',fsize);

subplot(row,col,4); cs1=p.cs4;
e=e./z0*100;
diff=(z1_mean-z0_mean)/z0_mean*100/dtas0;
s4=sprintf('%s; \\DeltaG/G/\\DeltaTs=%5.2f%%/K',p.s4,diff);
pcolor(x1,y1,e); hold on; shading flat; colorbar; caxis([cs1]);
contourf(x1,y1,lm/50,'w'); axis(xy); 
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); title(s4,'FontSize',fsize);
p.vname=strcat(p.vname,'_absrel');
visfig='off'; figpath='./fig_AR/'; expn='hiresmip';
printit(visfig,figpath,expn,p.vname);
