function plot_usa_reg_pcp_ts(p,vo)
wsize=5; f=ones(1,wsize)/wsize;
s=vo.s; lon=s.lon; lat=s.lat; lm=s.lm0; x=vo.yr;
s1='NDJFM'; s2='MJJAS'; s3='ANN'; loc='northwest'; lw=2;
x1=x(1)-1; x2=x(end)+1; y1=0; y2=5; xy=[x1 x2 y1 y2];

pms=[ 0, 0, 1800, 1500]*1.5; row=3; col=3; fs=12;
handle=figure('Position',pms,'visible','on');
subplot(row,col,1); a=vo.nwr; tit='NorthWest';
i=5; y=a(:,i); plot(x,y,'b');hold on; y=movingmean(y,5,1); plot(x,y,'b','LineWidth',lw);
i=6; y=a(:,i); plot(x,y,'r');hold on; y=movingmean(y,5,1); plot(x,y,'r','LineWidth',lw);
i=7; y=a(:,i); plot(x,y,'k');hold on; y=movingmean(y,5,1); plot(x,y,'k','LineWidth',lw);
%legend(s1,s2,s3,'Location','north','FontSize',fs); 
y1=0; y2=4; xy=[x1 x2 y1 y2]; axis(xy); 
set(gca,'FontSize',fs); title(tit,'FontSize',fs);

subplot(row,col,2); a=vo.umw; tit='Upper Midwest';
i=5; y=a(:,i); plot(x,y,'b');hold on; y=movingmean(y,5,1); plot(x,y,'b','LineWidth',lw);
i=6; y=a(:,i); plot(x,y,'r');hold on; y=movingmean(y,5,1); plot(x,y,'r','LineWidth',lw);
i=7; y=a(:,i); plot(x,y,'k');hold on; y=movingmean(y,5,1); plot(x,y,'k','LineWidth',lw);
%legend(s1,s2,s3,'Location','north','FontSize',fs); 
y1=0; y2=4; xy=[x1 x2 y1 y2]; axis(xy);
set(gca,'FontSize',fs); title(tit,'FontSize',fs);

subplot(row,col,3); a=vo.ner; tit='Northeast';
i=5; y=a(:,i); plot(x,y,'b');hold on; y=movingmean(y,5,1); plot(x,y,'b','LineWidth',lw);
i=6; y=a(:,i); plot(x,y,'r');hold on; y=movingmean(y,5,1); plot(x,y,'r','LineWidth',lw);
i=7; y=a(:,i); plot(x,y,'k');hold on; y=movingmean(y,5,1); plot(x,y,'k','LineWidth',lw);
%legend(s1,s2,s3,'Location','north','FontSize',fs);
y1=1.5; y2=4.5; xy=[x1 x2 y1 y2]; axis(xy);
set(gca,'FontSize',fs); title(tit,'FontSize',fs);

subplot(row,col,4); a=vo.wwr; tit='West';
i=5; y=a(:,i); plot(x,y,'b');hold on; y=movingmean(y,5,1); plot(x,y,'b','LineWidth',lw);
i=6; y=a(:,i); plot(x,y,'r');hold on; y=movingmean(y,5,1); plot(x,y,'r','LineWidth',lw);
i=7; y=a(:,i); plot(x,y,'k');hold on; y=movingmean(y,5,1); plot(x,y,'k','LineWidth',lw);
%legend(s1,s2,s3,'Location','north','FontSize',fs);
y1=0; y2=3.5; xy=[x1 x2 y1 y2]; axis(xy);
set(gca,'FontSize',fs); title(tit,'FontSize',fs);

subplot(row,col,5); a=vo.nrp; tit='Northern Rockies and Plains';
i=5; y=a(:,i); plot(x,y,'b');hold on; y=movingmean(y,5,1); plot(x,y,'b','LineWidth',lw);
i=6; y=a(:,i); plot(x,y,'r');hold on; y=movingmean(y,5,1); plot(x,y,'r','LineWidth',lw);
i=7; y=a(:,i); plot(x,y,'k');hold on; y=movingmean(y,5,1); plot(x,y,'k','LineWidth',lw);
%legend(s1,s2,s3,'Location','north','FontSize',fs); 
y1=0; y2=3.5; xy=[x1 x2 y1 y2]; axis(xy);
set(gca,'FontSize',fs); title(tit,'FontSize',fs);

subplot(row,col,6); a=vo.ovr; tit='Ohio Valley';
i=5; y=a(:,i); plot(x,y,'b');hold on; y=movingmean(y,5,1); plot(x,y,'b','LineWidth',lw);
i=6; y=a(:,i); plot(x,y,'r');hold on; y=movingmean(y,5,1); plot(x,y,'r','LineWidth',lw);
i=7; y=a(:,i); plot(x,y,'k');hold on; y=movingmean(y,5,1); plot(x,y,'k','LineWidth',lw);
%legend(s1,s2,s3,'Location','north','FontSize',fs);
y1=1.5; y2=4.5; xy=[x1 x2 y1 y2]; axis(xy);
set(gca,'FontSize',fs); title(tit,'FontSize',fs);

subplot(row,col,7); a=vo.swr; tit='SouthWest';
i=5; y=a(:,i); plot(x,y,'b');hold on; y=movingmean(y,5,1); plot(x,y,'b','LineWidth',lw);
i=6; y=a(:,i); plot(x,y,'r');hold on; y=movingmean(y,5,1); plot(x,y,'r','LineWidth',lw);
i=7; y=a(:,i); plot(x,y,'k');hold on; y=movingmean(y,5,1); plot(x,y,'k','LineWidth',lw);
%legend(s1,s2,s3,'Location','north','FontSize',fs);
y1=0.2; y2=2; xy=[x1 x2 y1 y2]; axis(xy);
set(gca,'FontSize',fs); title(tit,'FontSize',fs);

subplot(row,col,8); a=vo.ssr; tit='South';
i=5; y=a(:,i); plot(x,y,'b');hold on; y=movingmean(y,5,1); plot(x,y,'b','LineWidth',lw);
i=6; y=a(:,i); plot(x,y,'r');hold on; y=movingmean(y,5,1); plot(x,y,'r','LineWidth',lw);
i=7; y=a(:,i); plot(x,y,'k');hold on; y=movingmean(y,5,1); plot(x,y,'k','LineWidth',lw);
%legend(s1,s2,s3,'Location','north','FontSize',fs);
y1=1; y2=4; xy=[x1 x2 y1 y2]; axis(xy);
set(gca,'FontSize',fs); title(tit,'FontSize',fs);

subplot(row,col,9); a=vo.ser; tit='Southeast';
i=5; y=a(:,i); plot(x,y,'b');hold on; y=movingmean(y,5,1); plot(x,y,'b','LineWidth',lw);
i=6; y=a(:,i); plot(x,y,'r');hold on; y=movingmean(y,5,1); plot(x,y,'r','LineWidth',lw);
i=7; y=a(:,i); plot(x,y,'k');hold on; y=movingmean(y,5,1); plot(x,y,'k','LineWidth',lw);
%legend(s1,s2,s3,'Location','north','FontSize',fs);
y1=1; y2=6; xy=[x1 x2 y1 y2]; axis(xy);
set(gca,'FontSize',fs); title(tit,'FontSize',fs);

visfig='off'; figpath='./fig_USA/'; 
printnew(visfig,figpath,p.expn,p.vname);


