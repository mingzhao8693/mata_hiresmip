function myboxon(x1,x2,y1,y2,c)
lw=0.2; 
plot([x1 x1],[y1 y2],c,'LineWidth',lw); hold on;
%plot([x2 x2],[y1 y2],c,'LineWidth',lw); hold on;
plot([x1 x2],[y1 y1],c,'LineWidth',lw); hold on;
%plot([x1 x2],[y2 y2],c,'LineWidth',lw); hold on;
return



