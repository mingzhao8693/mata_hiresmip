function [z zb rmse]=vslice_s(v,s,k,varn,mod,mv)
a=mv; aa=squeeze(mean(s.aa,2)); lat=s.lat; %k=1;
pf=[1000 925 850 700 600 500 400 300 250 200 150 100 70 50 30 20 10];
dp=-diff(pf); dp(end+1)=dp(end);
if strcmp(varn(1:3),'zmt')
  i=1;
  y=squeeze(v.atm.t1000.sea(k,:,:));id1=(y>a); z(i,:)=zmeanwithmask(y,id1);i=i+1;
  y=squeeze(v.atm.t925.sea(k,:,:)); id2=(y>a); z(i,:)=zmeanwithmask(y,id2);i=i+1;
  y=squeeze(v.atm.t850.sea(k,:,:)); id3=(y>a); z(i,:)=zmeanwithmask(y,id3);i=i+1;
  y=squeeze(v.atm.t700.sea(k,:,:)); id4=(y>a); z(i,:)=zmeanwithmask(y,id4);i=i+1;
  y=squeeze(v.atm.t600.sea(k,:,:)); id5=(y>a); z(i,:)=zmeanwithmask(y,id5);i=i+1;
  y=squeeze(v.atm.t500.sea(k,:,:)); id6=(y>a); z(i,:)=zmeanwithmask(y,id6);i=i+1;
  y=squeeze(v.atm.t400.sea(k,:,:)); id7=(y>a); z(i,:)=zmeanwithmask(y,id7);i=i+1;
  y=squeeze(v.atm.t300.sea(k,:,:)); id8=(y>a); z(i,:)=zmeanwithmask(y,id8);i=i+1;
  y=squeeze(v.atm.t250.sea(k,:,:)); id9=(y>a); z(i,:)=zmeanwithmask(y,id9);i=i+1;
  y=squeeze(v.atm.t200.sea(k,:,:)); ida=(y>a); z(i,:)=zmeanwithmask(y,ida);i=i+1;
  y=squeeze(v.atm.t150.sea(k,:,:)); idb=(y>a); z(i,:)=zmeanwithmask(y,idb);i=i+1;
  y=squeeze(v.atm.t100.sea(k,:,:)); idc=(y>a); z(i,:)=zmeanwithmask(y,idc);i=i+1;
  y=squeeze(v.atm.t70.sea (k,:,:)); idd=(y>a); z(i,:)=zmeanwithmask(y,idd);i=i+1;
  y=squeeze(v.atm.t50.sea (k,:,:)); idd=(y>a); z(i,:)=zmeanwithmask(y,idd);i=i+1;
  y=squeeze(v.atm.t30.sea (k,:,:)); idd=(y>a); z(i,:)=zmeanwithmask(y,idd);i=i+1;
  y=squeeze(v.atm.t20.sea (k,:,:)); idd=(y>a); z(i,:)=zmeanwithmask(y,idd);i=i+1;
  y=squeeze(v.atm.t10.sea (k,:,:)); idd=(y>a); z(i,:)=zmeanwithmask(y,idd);i=i+1;
  if strcmp(mod,'obs')
    zb=z; zb(:,:)=0;
  else
    i=1;
    y=squeeze(v.atm.t1000.sea_bias(k,:,:)); zb(i,:)=zmeanwithmask(y,id1);i=i+1;
    y=squeeze(v.atm.t925.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,id2);i=i+1;
    y=squeeze(v.atm.t850.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,id3);i=i+1;
    y=squeeze(v.atm.t700.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,id4);i=i+1;
    y=squeeze(v.atm.t600.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,id5);i=i+1;
    y=squeeze(v.atm.t500.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,id6);i=i+1;
    y=squeeze(v.atm.t400.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,id7);i=i+1;
    y=squeeze(v.atm.t300.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,id8);i=i+1;
    y=squeeze(v.atm.t250.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,id9);i=i+1;
    y=squeeze(v.atm.t200.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,ida);i=i+1;
    y=squeeze(v.atm.t150.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,idb);i=i+1;
    y=squeeze(v.atm.t100.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,idc);i=i+1;
    y=squeeze(v.atm.t70.sea_bias (k,:,:));  zb(i,:)=zmeanwithmask(y,idd);i=i+1;
    y=squeeze(v.atm.t50.sea_bias (k,:,:));  zb(i,:)=zmeanwithmask(y,idd);i=i+1;
    y=squeeze(v.atm.t30.sea_bias (k,:,:));  zb(i,:)=zmeanwithmask(y,idd);i=i+1;
    y=squeeze(v.atm.t20.sea_bias (k,:,:));  zb(i,:)=zmeanwithmask(y,idd);i=i+1;
    y=squeeze(v.atm.t10.sea_bias (k,:,:));  zb(i,:)=zmeanwithmask(y,idd);i=i+1;
  end
elseif strcmp(varn(1:3),'zmu')
  i=1;
  y=squeeze(v.atm.u1000.sea(k,:,:));id1=(y>a); z(i,:)=zmeanwithmask(y,id1);i=i+1;
  y=squeeze(v.atm.u925.sea(k,:,:)); id2=(y>a); z(i,:)=zmeanwithmask(y,id2);i=i+1;
  y=squeeze(v.atm.u850.sea(k,:,:)); id3=(y>a); z(i,:)=zmeanwithmask(y,id3);i=i+1;
  y=squeeze(v.atm.u700.sea(k,:,:)); id4=(y>a); z(i,:)=zmeanwithmask(y,id4);i=i+1;
  y=squeeze(v.atm.u600.sea(k,:,:)); id5=(y>a); z(i,:)=zmeanwithmask(y,id5);i=i+1;
  y=squeeze(v.atm.u500.sea(k,:,:)); id6=(y>a); z(i,:)=zmeanwithmask(y,id6);i=i+1;
  y=squeeze(v.atm.u400.sea(k,:,:)); id7=(y>a); z(i,:)=zmeanwithmask(y,id7);i=i+1;
  y=squeeze(v.atm.u300.sea(k,:,:)); id8=(y>a); z(i,:)=zmeanwithmask(y,id8);i=i+1;
  y=squeeze(v.atm.u250.sea(k,:,:)); id9=(y>a); z(i,:)=zmeanwithmask(y,id9);i=i+1;
  y=squeeze(v.atm.u200.sea(k,:,:)); ida=(y>a); z(i,:)=zmeanwithmask(y,ida);i=i+1;
  y=squeeze(v.atm.u150.sea(k,:,:)); idb=(y>a); z(i,:)=zmeanwithmask(y,idb);i=i+1;
  y=squeeze(v.atm.u100.sea(k,:,:)); idc=(y>a); z(i,:)=zmeanwithmask(y,idc);i=i+1;
  y=squeeze(v.atm.u70.sea (k,:,:)); idd=(y>a); z(i,:)=zmeanwithmask(y,idd);i=i+1;
  y=squeeze(v.atm.u50.sea (k,:,:)); idd=(y>a); z(i,:)=zmeanwithmask(y,idd);i=i+1;
  y=squeeze(v.atm.u30.sea (k,:,:)); idd=(y>a); z(i,:)=zmeanwithmask(y,idd);i=i+1;
  y=squeeze(v.atm.u20.sea (k,:,:)); idd=(y>a); z(i,:)=zmeanwithmask(y,idd);i=i+1;
  y=squeeze(v.atm.u10.sea (k,:,:)); idd=(y>a); z(i,:)=zmeanwithmask(y,idd);i=i+1;
  if strcmp(mod,'obs')
    zb=z; zb(:,:)=0;
  else
    i=1;
    y=squeeze(v.atm.u1000.sea_bias(k,:,:)); zb(i,:)=zmeanwithmask(y,id1);i=i+1;
    y=squeeze(v.atm.u925.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,id2);i=i+1;
    y=squeeze(v.atm.u850.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,id3);i=i+1;
    y=squeeze(v.atm.u700.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,id4);i=i+1;
    y=squeeze(v.atm.u600.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,id5);i=i+1;
    y=squeeze(v.atm.u500.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,id6);i=i+1;
    y=squeeze(v.atm.u400.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,id7);i=i+1;
    y=squeeze(v.atm.u300.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,id8);i=i+1;
    y=squeeze(v.atm.u250.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,id9);i=i+1;
    y=squeeze(v.atm.u200.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,ida);i=i+1;
    y=squeeze(v.atm.u150.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,idb);i=i+1;
    y=squeeze(v.atm.u100.sea_bias(k,:,:));  zb(i,:)=zmeanwithmask(y,idc);i=i+1;
    y=squeeze(v.atm.u70.sea_bias (k,:,:));  zb(i,:)=zmeanwithmask(y,idd);i=i+1;
    y=squeeze(v.atm.u50.sea_bias (k,:,:));  zb(i,:)=zmeanwithmask(y,idd);i=i+1;
    y=squeeze(v.atm.u30.sea_bias (k,:,:));  zb(i,:)=zmeanwithmask(y,idd);i=i+1;
    y=squeeze(v.atm.u20.sea_bias (k,:,:));  zb(i,:)=zmeanwithmask(y,idd);i=i+1;
    y=squeeze(v.atm.u10.sea_bias (k,:,:));  zb(i,:)=zmeanwithmask(y,idd);i=i+1;
  end
end
%compute RMSE  
a=zb; b=zb;
for k=1:length(zb(:,1))
  a(k,:)=aa;
end
dp=dp./mean(dp);
for j=1:length(zb(1,:))
  b(:,j)=dp;
end

id=~isnan(zb);
e=zb(id).*a(id).*b(id);
rmse=sqrt(mean(e.*e));

return




figure; vbin=[-4:0.5:4];
[C,h]=contourf(lat,pf,zb,vbin); shading flat; 
colorbar; caxis([-4 4]); clabel(C,h); 
set(gca,'yDir','reverse');
nn=32; cmap=jet(nn); cmap(nn/2:nn/2+1,:)=1; colormap(cmap);
