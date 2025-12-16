function plot_3panel_mapp_new(s,z1,z2,z3,vname,fpath,expn,f,k,icmap);
aa=s.aa;
if (k==1)
  sea='ANN';
elseif(k==2)
  sea='MAM';
elseif(k==3)
  sea='JJA';
elseif(k==4)
  sea='SON';
elseif(k==5)
  sea='DJF';
end
vname=strcat(vname,'_',sea); a=s.aa; 
%id=~isnan(z2) & ~isnan(z3); a(id)=a(id)/mean(a(id)); a=a(id);
%c=corrcoef(z2(id)+z1(id),z1(id)); s.corr2=c(1,2);
%c=corrcoef(z3(id)+z1(id),z1(id)); s.corr3=c(1,2);
%e=z1(id); s.mean1=mean(e.*a);
%s.s1=sprintf('%s %s (MEAN=%5.2f)',s.s1,upper(sea),s.mean1);
%e=z2(id); s.rmse2=sqrt(mean(e.*e.*a)); s.bias2=mean(mean(e.*a));
%e=z3(id); s.rmse3=sqrt(mean(e.*e.*a)); s.bias3=mean(mean(e.*a));
%s.s2=sprintf('%s (BIAS=%5.2f; RMSE=%5.2f)',s.s2,s.bias2,s.rmse2);
%s.s3=sprintf('%s (BIAS=%5.2f; RMSE=%5.2f)',s.s3,s.bias3,s.rmse3);
%s.s2=sprintf('%s (RMSE=%5.2f)',s.s2,s.rmse2);
%s.s3=sprintf('%s (RMSE=%5.2f)',s.s3,s.rmse3);

lat=s.lat; lon=s.lon; xy=[0 360 -90 90];s
latx=s.latx; lonx=s.lonx; lm=s.lmx; lm(lm<=0.5)=0; lm(lm>0.5)=1; 
domap='noprojection'; domap='hammer'; domap='robinson'; %domap='eckert4'; 

a=s.aa; id=~isnan(z1); a(id)=a(id)/mean(a(id)); a=a(id);
e=z1(id); s.mean1=mean(e.*a);
s.s1=sprintf('%s (%s; MEAN=%5.2f)',s.s1,upper(sea),s.mean1);

a=s.aa; id=~isnan(z2) & z2>-1000 & z2<1000; a(id)=a(id)/mean(a(id)); a=a(id);
e=z2(id); s.mean2=mean(e.*a);

s.s2=sprintf('%s (%s; MEAN=%5.2f)',s.s2,upper(sea),s.mean2);
e=z3(id); s.rmse3=sqrt(mean(e.*e.*a)); s.bias3=mean(mean(e.*a));
s.s3=sprintf('%s (RMSE=%5.2f)',s.s3,s.rmse3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 800, 1100]*0.8; fsize=10; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=0.08; y0=0.7; wx=0.8; wy=0.25; dy=0.05; %icmap=5;
p1= [x0,y0,           wx, wy];%position of first subplot
p2= [x0,y0-wy-dy,     wx, wy];%position of first subplot
p3= [x0,y0-2*(wy+dy), wx, wy];%position of first subplot
nn=32; caxis([s.cmin s.cmax]); cmap1=bluewhitered(nn);
caxis([s.c1 s.c2]);
if (icmap==0)
  cmap=fabien_colormap(nn);
elseif (icmap==1) 
  cmap=bluewhitered(nn);
elseif (icmap==2)
  cmap =cbrewer('seq', 'BuGn', nn);
  cmap1=cbrewer('div', 'BrBG', nn); cmap=cmap1;
else
  cmap=jet(nn); %cmap(nn/2:nn/2+1,:)=1;
end
pos1=[0.85 0.48 0.02 0.42];%[left bottom width height];
pos2=[0.85 0.11 0.02 0.22];%[left bottom width height];
%pos1=[0.85 0.71 0.02 0.22];%[left bottom width height];
%pos2=[0.85 0.18 0.02 0.40];%[left bottom width height];

row=3; col=1; domap='noprojection'; domap='robinson'; 
subplot('Position',p1); a=z1;
do_mapproj(lat,lon,a,s.vbino,latx,lonx,lm,domap,xy); %clabel(C,h); 
caxis([s.c1 s.c2]); colormap(cmap); freezeColors; 
h=colorbar('Location','eastoutside','Position',pos1); cbfreeze(h,cmap);%cbunits(h,s.unit); 
title(s.s1,'FontSize',fsize);
  
subplot('Position',p2); a=z2; id=isnan(a); a(id)=0;
do_mapproj(lat,lon,a,s.vbino,latx,lonx,lm,domap,xy); %clabel(C,h); 
caxis([s.c1 s.c2]); colormap(cmap1); freezeColors; 
title(s.s2,'FontSize',fsize);

subplot('Position',p3); a=z3; id=isnan(a); a(id)=0;
do_mapproj(lat,lon,a,s.vbin,latx,lonx,lm,domap,xy); %clabel(C,h); 
caxis([s.cmin s.cmax]); colormap(cmap1); %freezeColors; 
h=colorbar('Location','eastoutside','Position',pos2); %cbfreeze(h,cmap);
cbunits(h,s.unit);
title(s.s3,'FontSize',fsize);

visfig='off'; vname=strcat(vname,'_',domap);
printnew(visfig,fpath,expn,vname);

