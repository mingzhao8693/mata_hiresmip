tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; ts=13; te=60;
expn ='mwc_am4p0_300_100km_64x32_cntl';  v0=quickread(tpath,expn,ts,te);
expn ='mwc_am4p0_300_100km_64x32_302';   v1=quickread(tpath,expn,ts,te);
expn ='mwc_am4p0_300_100km_64x32_302_A'; v2=quickread(tpath,expn,ts,te);
expn ='mwc_am4p0_300_100km_64x32_302_B'; v3=quickread(tpath,expn,ts,te);
%expn ='rce_am4p0_300_100km_64x32';       r0=quickread(tpath,expn,ts,te);
%expn ='rce_am4p0_302_100km_64x32';       r1=quickread(tpath,expn,ts,te);

y0=v0.mse.avg; y1=v1.mse.avg;
for k=1:v0.nz
  y0(k,:)=y0(k,:)-mean(y0(k,:),2);
  y1(k,:)=y1(k,:)-mean(y1(k,:),2);
end
x=[1:64]; y=v0.pf.avg0;
figure; pcolor(x,y,y0); colorbar; shading flat; 
set(gca,'yDir','reverse'); caxis([300 360]);
figure; plot(v0.mse.avg(:,20:40),v0.pf0); set(gca,'yDir','reverse');

y0=v0.thv.avg; y1=v1.thv.avg;
for k=1:v0.nz
  y0(k,:)=y0(k,:)-mean(y0(k,:),2);
  y1(k,:)=y1(k,:)-mean(y1(k,:),2);
end
x=[1:64]; y=v0.pf.avg0;
figure; pcolor(x,y,y0); colorbar; shading flat; caxis([-4 4]);
set(gca,'yDir','reverse'); 

for k=1:v.nz
  y0(k,:)=y0(k,:)-y0(v.nz,:);
  y1(k,:)=y1(k,:)-y1(v.nz,:);
end
figure; pcolor([1:64],v.pf.avg0,y1-y0); shading flat; colorbar;
set(gca,'yDir','reverse'); 

axis([0 30 600 1000]);

i=63; y0=v0.th.avg(:,i); y1=v1.th.avg(:,i);
figure; 
plot(y0-y0(end),v0.pf.avg0); hold on;
plot(y1-y1(end),v1.pf.avg0,'r'); 
set(gca,'yDir','reverse'); caxis([0 64 -3 3]);


y0=v0.sst.avg; y1=v1.sst.avg; y2=v2.sst.avg; y3=v3.sst.avg;
figure; plot(y0,'k'); hold on; plot(y1,'r'); plot(y2,'g'); plot(y3,'b');


Y0=r0.pcp.avg; Y1=r1.pcp.avg; 
y0=v0.pcp.avg; y1=v1.pcp.avg; y2=v2.pcp.avg; y3=v3.pcp.avg;
figure; plot(Y0,'c'); hold on; plot(Y1,'m'); 
plot(y0,'k'); plot(y1,'r'); plot(y2,'g'); plot(y3,'b');

Y0=r0.toa.netrad.avg; Y1=r1.pcp.avg; 
y0=v0.pcp.avg; y1=v1.pcp.avg; y2=v2.pcp.avg; y3=v3.pcp.avg;
figure; plot(Y0,'c'); hold on; plot(Y1,'m'); 
plot(y0,'k'); plot(y1,'r'); plot(y2,'g'); plot(y3,'b');


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
