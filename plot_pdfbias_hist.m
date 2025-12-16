function plot_pdfbias_hist(x,y0,y1,dy,xy,xy1,xl,yl,s1,s2,vname)
pms=[ 0, 0, 1200, 800]*0.8; fsize=20; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x,y0,'Color','k','Marker','*','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x,y1,'Color','b','Marker','s','MarkerSize',msize,'LineWidth',lw); 
legend(s1,s2,2); axis(xy); set(gca,'FontSize',fsize);
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');

line(x,dy,'Color','r','Marker','o','MarkerSize',msize,'LineWidth',lw); hold on;
line([xy(1) xy(2)],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
legend('Model minus ERAI',1); axis(xy1); 
yl='percent difference (%)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
return
