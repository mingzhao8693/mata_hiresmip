function v=getcorrslop(x,y)
[r,p]=corrcoef(x,y); v.corr=r(1,2);
c=polyfit(x,y,1);    v.slop=c(1);
v.F=c(2); v.dT=c(2)/c(1);

v.xa=[0:10];
xmin=0; xmax=max(x); 
v.xa=[xmin:(xmax-xmin)/20:xmax]; 
v.ya=c(1)*v.xa+c(2);

xmin=min(x)-0.1; xmax=max(x); xmax=10;
v.xb=[xmin:(xmax-xmin)/20:xmax]; 
v.yb=c(1)*v.xb+c(2);

v.xc=[0:10]; 
v.yc=c(1)*v.xc+c(2);

return


