function plot_pdfbias(x,y0,y1,dy,xy,xy1,xl,yl,s1,s2,vname,mylab)
pms=[ 0, 0, 1200, 800]*0.6; fsize=20; lw=2; msize=8; msize=4;
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x,y0,'Color','k','Marker','*','MarkerSize',msize,'LineWidth',lw); hold on; 
line(x,y1,'Color','b','Marker','s','MarkerSize',msize,'LineWidth',lw); 
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
%legend(s1,s2,0); legend('boxoff');
%text(55, 0.01,'NH','FontSize',fsize);
%text(105,0.0126,'SH','FontSize',fsize);
axis(xy); set(gca,'FontSize',fsize);

opt=0;
if (opt==1)
  ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');

  line(x,dy,'Color','r','Marker','o','MarkerSize',msize,'LineWidth',lw); hold on;
  line([xy(1) xy(2)],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
  legend('Model minus ERAI',1); axis(xy1); 
  yl='percent difference (%)'; ylabel(yl,'FontSize',fsize);
else
  mylabel(xy,1,mylab,fsize);
end

set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
