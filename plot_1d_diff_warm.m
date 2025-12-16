function plot_1d_diff_warm(p)
p.dy1=(p.y2-p.y1)./p.y1*100./p.dtas1; p.dy1=mizsmooth(p.dy1,3); 
p.dy2=(p.y4-p.y3)./p.y2*100./p.dtas2; p.dy2=mizsmooth(p.dy2,3);
p.ds1='MOD-Future minus MOD-Present';
p.ds2='MOD-P4K minus MOD-Climo';
p.s1=sprintf('%s (mean=%3.0f)',p.s1,p.y1avg);
p.s2=sprintf('%s (mean=%3.0f)',p.s2,p.y2avg);
p.s3=sprintf('%s (mean=%3.0f)',p.s3,p.y3avg);
p.s4=sprintf('%s (mean=%3.0f)',p.s4,p.y4avg);
p.ls='-'; p.ms=1;
x=p.x; xy=p.xy; xy1=p.xy1; ms=p.ms; ls=p.ls; %'none';
pms=[ 0, 0, 1200, 800]*0.8; fsize=16; lw=2; 
handle = figure('Position', pms,'visible','on');
ax1=gca;
line(x,p.y1,'Color','k','Marker','*','MarkerSize',ms,'LineWidth',lw,'LineStyle','--'); hold on; 
line(x,p.y2,'Color','k','Marker','s','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls); 
line(x,p.y3,'Color','b','Marker','*','MarkerSize',ms,'LineWidth',lw,'LineStyle','--');
line(x,p.y4,'Color','b','Marker','s','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls); 
legend(p.s1,p.s2,p.s3,p.s4,2); axis(xy); set(gca,'FontSize',fsize);
xlabel(p.xl,'FontSize',fsize); ylabel(p.yl1,'FontSize',fsize);
%title(p.title,'FontSize',fsize);
do_cat=0;
if (do_cat)
  xx=[50 250 500 750 1000 1250]; xlist={'50','250','500','750','1000','1250'};
  set(gca,'xtick',xx); set(gca,'xticklabel',xlist,'FontSize',fsize);
end
ms=5
ax2 = axes('Position',get(ax1,'Position'),...
	   'XAxisLocation','bottom','YAxisLocation','right',...
	   'Color','none','XColor','k','YColor','r');
%nn=3; p.dy1=mizsmooth(p.dy1,nn); p.dy2=mizsmooth(p.dy2,nn);
line(x,p.dy1,'Color','r','Marker','o','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls); hold on;
line(x,p.dy2,'Color','m','Marker','o','MarkerSize',ms,'LineWidth',lw,'LineStyle',ls); hold on;
line([xy(1) xy(2)],[0 0], 'Color','r','MarkerSize',ms,'LineWidth',1); 

if (do_cat)
  line([0    250], [0 0], 'Color','k','LineWidth',5);  
  line([250  500], [0 0], 'Color','g','LineWidth',5); text(325, 5,'Cat 0-2','FontSize',fsize);
  line([500  750], [0 0], 'Color','b','LineWidth',5); text(575, 5,'Cat 1-3','FontSize',fsize);
  line([750  1000],[0 0], 'Color','y','LineWidth',5); text(825, 5,'Cat 2-4','FontSize',fsize);
  line([1000 1250],[0 0], 'Color','r','LineWidth',5); text(1075,5,'Cat 3-5','FontSize',fsize);
  xx=[50 250 500 750 1000 1250]; xlist={'50','250','500','750','1000','1250'};
  set(gca,'xtick',xx); set(gca,'xticklabel',xlist,'FontSize',fsize);
end

legend(p.ds1,p.ds2,1); axis(xy1); ylabel(p.yl2,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,p.vname);
return
