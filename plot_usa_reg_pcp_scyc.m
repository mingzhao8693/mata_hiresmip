function plot_usa_reg_pcp_scyc(p,vo1,vo2,vo3)
s=vo1.s; lon=s.lon; lat=s.lat; lm=s.lm0; mon=[1:12]; n=10000;
s1='1916-1950'; s2='1951-1985'; s3='1986-2020'; loc='northwest';
x1=0.5; x2=12.5; y1=0; y2=5; xy=[x1 x2 y1 y2];

pms=[ 0, 0, 1800, 1500]*1.5; row=3; col=3; fs=12;
handle=figure('Position',pms,'visible','on');
subplot(row,col,1); m1=8; m2=19; tit='NorthWest';
a=vo1.nwr(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=vo2.nwr(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=vo3.nwr(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location','north','FontSize',fs); title(tit,'FontSize',fs);
y1=0; y2=3.5; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,2); m1=8; m2=19; tit='Upper Midwest';
a=vo1.umw(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=vo2.umw(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=vo3.umw(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
y1=0.5; y2=4; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,3); m1=8; m2=19; tit='Northeast';
a=vo1.ner(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=vo2.ner(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=vo3.ner(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
y1=2.2; y2=3.8; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,4); m1=8; m2=19; tit='West';
a=vo1.wwr(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=vo2.wwr(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=vo3.wwr(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location','north','FontSize',fs); title(tit,'FontSize',fs);
y1=0; y2=2.5; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,5); m1=8; m2=19; tit='Northern Rockies and Plains';
a=vo1.nrp(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=vo2.nrp(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=vo3.nrp(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
y1=0; y2=3; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,6); m1=8; m2=19; tit='Ohio Valley';
a=vo1.ovr(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=vo2.ovr(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=vo3.ovr(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
y1=2; y2=4.5; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,7); m1=8; m2=19; tit='SouthWest';
a=vo1.swr(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=vo2.swr(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=vo3.swr(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location','north','FontSize',fs); title(tit,'FontSize',fs);
y1=0.4; y2=1.8; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,8); m1=8; m2=19; tit='South';
a=vo1.ssr(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=vo2.ssr(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=vo3.ssr(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
y1=1.5; y2=3.5; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,9); m1=8; m2=19; tit='Southeast';
a=vo1.ser(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=vo2.ser(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=vo3.ser(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
y1=2; y2=5.5; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

visfig='off'; figpath='./fig_USA/'; 
printnew(visfig,figpath,p.expn,p.vname);


