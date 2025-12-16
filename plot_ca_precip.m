function plot_ca_precip(ca,or,wa,nv)
pms=[ 0, 0, 1500, 1200]*1.5; m1=8; m2=19; x0=[1:12]; fsize=12; ms=8; lw=1;
handle=figure('Position',pms,'visible','on'); row=3; col=2;
subplot(row,col,1)
plot(x0,ca.sea.prday_av,   'r-', 'MarkerSize',ms,'LineWidth',lw);hold on
plot(x0,ca.sea.prday_idwei,'r--','MarkerSize',ms,'LineWidth',lw); 
plot(x0,or.sea.prday_av,   'b-', 'MarkerSize',ms,'LineWidth',lw);hold on
plot(x0,or.sea.prday_idwei,'b--','MarkerSize',ms,'LineWidth',lw);
plot(x0,wa.sea.prday_av,   'k-', 'MarkerSize',ms,'LineWidth',lw);hold on
plot(x0,wa.sea.prday_idwei,'k--','MarkerSize',ms,'LineWidth',lw); 
%plot(x0,nv.sea.prday_av,   'b-', 'MarkerSize',ms,'LineWidth',lw);hold on
%plot(x0,nv.sea.prday_idwei,'b--','MarkerSize',ms,'LineWidth',lw); 
s1='total precip'; s2='AR precip'; legend(s1,s2,'location','north'); 
yl='precipitation (mm/day)'; ylabel(yl,'FontSize',fsize); 
axis([1 12 0 5]); set(gca,'FontSize',fsize);
subplot(row,col,3)
plot(x0,ca.sea.prday_idavg,'r-', 'MarkerSize',ms,'LineWidth',lw);hold on
plot(x0,ca.sea.prday_idmax,'r--','MarkerSize',ms,'LineWidth',lw);hold on
plot(x0,or.sea.prday_idavg,'b-', 'MarkerSize',ms,'LineWidth',lw);hold on
plot(x0,or.sea.prday_idmax,'b--','MarkerSize',ms,'LineWidth',lw);hold on
plot(x0,wa.sea.prday_idavg,'k-', 'MarkerSize',ms,'LineWidth',lw);hold on
plot(x0,wa.sea.prday_idmax,'k--','MarkerSize',ms,'LineWidth',lw);hold on
%plot(x0,nv.sea.prday_idavg, 'b-', 'MarkerSize',ms,'LineWidth',lw);hold on
%plot(x0,nv.sea.prday_idmax, 'b--','MarkerSize',ms,'LineWidth',lw);hold on
%shadedplot(x,y3-y4, y3+y4,[0.7 0.7 0.7],'k'); hold on;
%plot(x,y3,'.b-','MarkerSize',ms,'LineWidth',lw);
%plot(x,y5,'.r-','MarkerSize',ms,'LineWidth',lw); 
s1='AR mean precip'; s2='AR max precip'; legend(s1,s2,'location','north'); 
yl='precipitation (mm/day)'; ylabel(yl,'FontSize',fsize); 
axis([1 12 0 35]); set(gca,'FontSize',fsize);
subplot(row,col,5)
plot(x0,ca.sea.frqday,'r-', 'MarkerSize',ms,'LineWidth',lw);hold on
plot(x0,or.sea.frqday,'b-', 'MarkerSize',ms,'LineWidth',lw);hold on
plot(x0,wa.sea.frqday,'k-', 'MarkerSize',ms,'LineWidth',lw);hold on
%plot(x0,nv.sea.frqday,'b-', 'MarkerSize',ms,'LineWidth',lw);hold on
yl='AR frequency of occurrence (%)'; ylabel(yl,'FontSize',fsize); 
xl='month'; xlabel(xl,'FontSize',fsize); 
axis([1 12 0 20]); set(gca,'FontSize',fsize);
subplot(row,col,2); xt=[1979:2019];
plot(xt,ca.ts.prday_av,   'r-', 'MarkerSize',ms,'LineWidth',lw);hold on
plot(xt,ca.ts.prday_idwei,'r--','MarkerSize',ms,'LineWidth',lw); 
plot(xt,or.ts.prday_av,   'b-', 'MarkerSize',ms,'LineWidth',lw);hold on
plot(xt,or.ts.prday_idwei,'b--','MarkerSize',ms,'LineWidth',lw); 
plot(xt,wa.ts.prday_av,   'k-', 'MarkerSize',ms,'LineWidth',lw);hold on
plot(xt,wa.ts.prday_idwei,'k--','MarkerSize',ms,'LineWidth',lw); 
%plot(xt,nv.ts.prday_av,   'b-', 'MarkerSize',ms,'LineWidth',lw);hold on
%plot(xt,nv.ts.prday_idwei,'b--','MarkerSize',ms,'LineWidth',lw); 
s1='total precip'; s2='AR precip'; legend(s1,s2,'location','northeast'); 
yl='precipitation (mm/day)'; ylabel(yl,'FontSize',fsize); 
axis([1979 2020 0 7]); set(gca,'FontSize',fsize);
subplot(row,col,4);
plot(xt,ca.ts.prday_idavg,'r-', 'MarkerSize',ms,'LineWidth',lw); hold on;
plot(xt,ca.ts.prday_idmax,'r--','MarkerSize',ms,'LineWidth',lw); hold on;
plot(xt,or.ts.prday_idavg,'b-', 'MarkerSize',ms,'LineWidth',lw);
plot(xt,or.ts.prday_idmax,'b--','MarkerSize',ms,'LineWidth',lw);
plot(xt,wa.ts.prday_idavg,'k-', 'MarkerSize',ms,'LineWidth',lw); 
plot(xt,wa.ts.prday_idmax,'k--','MarkerSize',ms,'LineWidth',lw); 
%plot(xt,nv.ts.prday_idavg,'b--','MarkerSize',ms,'LineWidth',lw); 
%plot(xt,nv.ts.prday_idmax,'b--','MarkerSize',ms,'LineWidth',lw); 
s1='AR mean precip'; s2='AR max precip'; legend(s1,s2,'location','northeast'); 
yl='precipitation (mm/day)'; ylabel(yl,'FontSize',fsize); 
axis([1979 2020 0 50]); set(gca,'FontSize',fsize);
subplot(row,col,6);
plot(xt,ca.ts.frqday,   'r-', 'MarkerSize',ms,'LineWidth',lw);hold on
plot(xt,or.ts.frqday,   'b-', 'MarkerSize',ms,'LineWidth',lw);hold on
plot(xt,wa.ts.frqday,   'k-', 'MarkerSize',ms,'LineWidth',lw);hold on
%plot(xt,or.ts.frqday,   'g-', 'MarkerSize',ms,'LineWidth',lw);hold on
yl='AR frequency of occurrence (%)'; ylabel(yl,'FontSize',fsize); 
xl='year'; xlabel(xl,'FontSize',fsize); 
axis([1979 2020 0 30]); set(gca,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

visfig='off'; figpath='./fig_CA/'; expn='ca'; vname='ca_precip'; 
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
