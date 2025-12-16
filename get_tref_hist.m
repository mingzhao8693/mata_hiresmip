function y=get_tref_hist(cm4,t0,t1,yr1,yr2)
%t0=[1861:1960]; %control run
%t1=[1861:2000]; %historical run
n=length(t0); 
x0=cm4.c0.sfc.tref.ts.org_ann(1:n); %last n years from control
x1=cm4.h0.sfc.tref.ts.org_ann; 
c=polyfit(t0,x0,1); xx=t1*c(1)+c(2); xx=xx-mean(xx); %remove control trend
gb=x1-xx;

x0=cm4.c0.sfc.tref.ts.org_ann_nh(1:n);
x1=cm4.h0.sfc.tref.ts.org_ann_nh;
c=polyfit(t0,x0,1); xx=t1*c(1)+c(2); xx=xx-mean(xx);
nh=x1-xx;

x0=cm4.c0.sfc.tref.ts.org_ann_sh(1:n);
x1=cm4.h0.sfc.tref.ts.org_ann_sh;
c=polyfit(t0,x0,1); xx=t1*c(1)+c(2); xx=xx-mean(xx);
sh=x1-xx;

id=(t1>=yr1)&(t1<=yr2); 
y.gb=gb;
y.nh=nh;
y.sh=sh;
y.gb_ano=gb-mean(gb(id));
y.nh_ano=nh-mean(nh(id));
y.sh_ano=sh-mean(sh(id));

return
