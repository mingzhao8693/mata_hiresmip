function plot_1d_zscale_ivty(p,p1)
x=p.x; xy=p.xy; xy1=p.xy1; msize=p.ms; ls=p.ls; %'none';
pms=[ 0, 0, 1200, 800]*0.8; fsize=20; lw=2; msize
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x,p.y0,'Color','k','Marker','*','MarkerSize',msize,'LineWidth',lw,'LineStyle',ls); hold on; 
line(x,p.y1,'Color','b','Marker','s','MarkerSize',msize,'LineWidth',lw,'LineStyle',ls); 
%line(x,p.Y0,'Color','k','Marker','*','MarkerSize',msize,'LineWidth',lw); hold on; 
%line(x,p.Y1,'Color','b','Marker','s','MarkerSize',msize,'LineWidth',lw); 
legend(p.s1,p.s2,3); axis(xy); set(gca,'FontSize',fsize);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl,'FontSize',fsize);
grid on;
opt=1;
if (opt==1)
  ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
  line(x,p1.y0,'Color','r','Marker','.','MarkerSize',msize,'LineWidth',lw,'LineStyle','--'); hold on;
  line(x,p1.y1,'Color','m','Marker','.','MarkerSize',msize,'LineWidth',lw,'LineStyle','--'); hold on;
%  line([xy(1) xy(2)],[0 0], 'Color','r','MarkerSize',msize,'LineWidth',1); 
  legend(p.s1,p.s2,4); axis(xy1); set(gca,'FontSize',fsize);
  ylabel(p1.y2,'FontSize',fsize);
else
  box on;
end

set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,p.vname);
