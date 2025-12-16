b.v0=v0.zf0(k1:k2); b.c0=c0.zf0(k1:k2); b.w0=w0.zf0(k1:k2); 
b.v1=v1.zf0(k1:k2); b.c1=c1.zf0(k1:k2); b.w1=w1.zf0(k1:k2); 
b.v2=v2.zf0(k1:k2); b.c2=c2.zf0(k1:k2); b.w2=w2.zf0(k1:k2); 
b.v3=v3.zf0(k1:k2); b.c3=c3.zf0(k1:k2); b.w3=w3.zf0(k1:k2); 
b.v4=v4.zf0(k1:k2); b.c4=c4.zf0(k1:k2); b.w4=w4.zf0(k1:k2); 
b.v5=v5.zf0(k1:k2); b.c5=c5.zf0(k1:k2); b.w5=w5.zf0(k1:k2); 
b.v6=v6.zf0(k1:k2); b.c6=c6.zf0(k1:k2); b.w6=w6.zf0(k1:k2); 
ta_295=mean([b.c0; b.c1; b.c2; b.c3; b.c4; b.c5],1);
ta_300=mean([b.v0; b.v1; b.v2; b.v3; b.v4; b.v5],1);
ta_305=mean([b.w0; b.w1; b.w2; b.w3; b.w4; b.w5],1);
%zf_295=mean([c0.zf(k1:k2);c1.zf(k1:k2);c2.zf(k1:k2);c3.zf(k1:k2);c4.zf(k1:k2);c5.zf(k1:k2)],1);
%zf_300=mean([v0.zf(k1:k2);v1.zf(k1:k2);v2.zf(k1:k2);v3.zf(k1:k2);v4.zf(k1:k2);v5.zf(k1:k2)],1);
%zf_305=mean([w0.zf(k1:k2);w1.zf(k1:k2);w2.zf(k1:k2);w3.zf(k1:k2);w4.zf(k1:k2);w5.zf(k1:k2)],1);
zf_295=v1.zf0; zf_300=v1.zf0; zf_305=v1.zf0;

pms=[ 0, 0, 1100, 900]*0.7; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
co='Color';     C0='b'; V0='k'; W0='r'; 
ls='LineStyle'; S0='-'; S1='--'; S2='-.'; S3=':'; S4=S2; S5=S3; S6=S3;
MK='Marker'; MS='MarkerSize';
lw='LineWidth'; d1=2; d2=d1*3;
line(a.v0,b.v0,co,V0,ls,S0,lw,d1); hold on;
line(a.v1,b.v1,co,V0,ls,S1,lw,d1);
%line(a.v2,b.v2,co,V0,ls,S2,lw,d1);
%line(a.v3,b.v3,co,V0,ls,S3,lw,d1);
%line(a.v4,b.v4,co,V0,ls,S4,lw,d1);
line(a.v5,b.v5,co,V0,ls,S5,lw,d1);
line(a.v6,b.v6,co,V0,ls,S6,lw,d2);

line(a.c0,b.c0,co,C0,ls,S0,lw,d1);
line(a.c1,b.c1,co,C0,ls,S1,lw,d1);
%line(a.c2,b.c2,co,C0,ls,S2,lw,d1);
%line(a.c3,b.c3,co,C0,ls,S3,lw,d1);
%line(a.c4,b.c4,co,C0,ls,S4,lw,d1);
line(a.c5,b.c5,co,C0,ls,S5,lw,d1);
line(a.c6,b.c6,co,C0,ls,S6,lw,d2);

line(a.w0,b.w0,co,W0,ls,S0,lw,d1);
line(a.w1,b.w1,co,W0,ls,S1,lw,d1);
%line(a.w2,b.w2,co,W0,ls,S2,lw,d1);
%line(a.w3,b.w3,co,W0,ls,S3,lw,d1);
%line(a.w4,b.w4,co,W0,ls,S4,lw,d1);
line(a.w5,b.w5,co,W0,ls,S5,lw,d1);
line(a.w6,b.w6,co,W0,ls,S6,lw,d2);

legend('R1.5','R03','R48','R48C',opt);
%legend('R1.5','R03','R12','R48','R48C',opt);
%legend('R1.5','R03','R06','R12','R24','R48','R48C',opt);
yl='height z (km)';
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'yDir',ydir,'FontSize',fsize); axis(xy);
visfig='off'; figpath='./fig_rce/';

return

ax1 = gca;
ax2=axes('Position',get(ax1,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','b','YColor','b');
line(zf_295,ta_295,co,C0,ls,S0,lw,1);hold on;
line(zf_300,ta_300,co,V0,ls,S0,lw,1);hold on;
line(zf_305,ta_305,co,W0,ls,S0,lw,1);hold on;
set(gca,'yDir',ydir,'FontSize',fsize); axis(xy0);
xl='height z (km)';   xlabel(xl,'FontSize',fsize);
yl='temperature (K)'; ylabel(yl,'FontSize',fsize);
visfig='off'; figpath='./fig_rce/';
