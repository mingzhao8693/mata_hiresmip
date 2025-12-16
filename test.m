x1=[0:100/(length(osc1)-1):100];
x2=[0:100/(length(soft)-1):100];

osc1_interp=interp1(x1,osc1,x2); %interp osc1 from x1 coordiate to x2 coordinate
                                 
soft_interp=interp1(x2,soft,x1); %interp soft from x2 coordiate to x1 coordinate


y

vq = interp1(x,v,xq)
tar -xvf 2010*.nc.tar &
tar -xvf 2011*.nc.tar &
tar -xvf 2012*.nc.tar &
tar -xvf 2013*.nc.tar &
tar -xvf 2014*.nc.tar &

tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; ts=13; te=60
expn ='mwc_am4p0_300_100km_64x32';       v0=quickread(tpath,expn,ts,te);
expn ='mwc_am4p0_300_100km_64x32_302';   v1=quickread(tpath,expn,ts,te);
expn ='mwc_am4p0_300_100km_64x32_302_A'; v2=quickread(tpath,expn,ts,te);
expn ='mwc_am4p0_300_100km_64x32_302_B'; v3=quickread(tpath,expn,ts,te);

y0=v0.ts; y1=v1.ts; y2=v2.ts; y3=v3.ts; 
figure; plot(y0,'k'); hold on; plot(y1,'r'); plot(y2,'g'); plot(y3,'b');

y0=v0.netrad; y1=v1.netrad; y2=v2.netrad; y3=v3.netrad; 
figure; plot(y0,'k'); hold on; plot(y1,'r'); plot(y2,'g'); plot(y3,'b');


y0=v0.pr; y1=v1.pr; y2=v2.pr; y3=v3.pr; 
figure; plot(y1-y0,'r'); hold on; plot(y2-y0,'g'); plot(y3-y0,'b');

y0=v0.qal; y1=v1.qal; y2=v2.qal; y3=v3.qal; 
figure; plot(y0,'k'); hold on; plot(y1,'r'); plot(y2,'g'); plot(y3,'b');

figure; plot(y1-y0,'r'); hold on; plot(y2-y0,'g'); plot(y3-y0,'b');

y0=v0.swcf; y1=v1.swcf; y2=v2.swcf; y3=v3.swcf; 
figure; plot(y1-y0,'r'); hold on; plot(y2-y0,'g'); plot(y3-y0,'b');

y0=v0.lwcf; y1=v1.lwcf; y2=v2.lwcf; y3=v3.lwcf; 
figure; plot(y1-y0,'r'); hold on; plot(y2-y0,'g'); plot(y3-y0,'b');

y0=v0.netrad; y1=v1.netrad; y2=v2.netrad; y3=v3.netrad; 

[mean(y0) mean(y1) mean(y2) mean(y3)];

figure; contourf(v0.qa); set(gca,'yDir','reverse'); 
figure; contourf(v2.qa); set(gca,'yDir','reverse'); 

figure; contourf(v0.rh); set(gca,'yDir','reverse'); 
figure; contourf(v2.rh); set(gca,'yDir','reverse'); 

figure; contourf(v0.ua); set(gca,'yDir','reverse'); 
figure; contourf(v2.ua); set(gca,'yDir','reverse'); 


w=squeeze(v.w(end,40:end,:,:)); v.nz=length(w(:,1,1));

x=reshape(w,v.nz,128*256,1);

for i=1:length(x(1,:))
  y=x(:,i);
  z(i)=max(abs(y));
end
std0=std(z);
id=z>10*std0;
ww=x(:,id);
[L, EOFs, EC, error, norms] = EOF(ww,3,1);

xx=xxx(:,30:60,:); nlat=length(xx(1,:,1));
yyy=reshape(xx,35,nlat*144,1);
a=mean(yyy,1); 
for i=1:35
  yyy(i,:)=yyy(i,:)-a;
end

[L, EOFs, EC, error, norms] = EOF(yyy',3,1);
zzz=reshape(EC,nlat,144,3);

figure; contourf(squeeze(zzz(:,:,1)));
