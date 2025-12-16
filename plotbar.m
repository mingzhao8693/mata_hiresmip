y=[a.c0 a.v0 a.w0; a.c1 a.v1 a.w1; a.c2 a.v2 a.w2; ...
   a.c3 a.v3 a.w3; a.c4 a.v4 a.w4; a.c5 a.v5 a.w5; ...
   a.c6 a.v6 a.w6; a.c7 a.v7 a.w7; a.c8 a.v8 a.w8;];
e=[b.c0 b.v0 b.w0; b.c1 b.v1 b.w1; b.c2 b.v2 b.w2; ...
   b.c3 b.v3 b.w3; b.c4 b.v4 b.w4; b.c5 b.v5 b.w5; ...
   b.c6 b.v6 b.w6; b.c7 b.v7 b.w7; b.c8 b.v8 b.w8;];

%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 800]*0.8; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1; 
x=[1:9]; 
barwitherr(e,x,y); legend('295','300','305',opt); axis(xy);
ylabel(yl,'FontSize',fsize);
alist={'R1.5','R03','R06','R12','R24','R48','R48C','AM4o','AM4n'};
set(gca,'xtick',x,'FontSize',fsize); 
set(gca,'xticklabel',alist,'FontSize',fsize);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; expn='rce_mon8_12';
%%%%%%%%%%%%%%%%%%%%%%%%%%
