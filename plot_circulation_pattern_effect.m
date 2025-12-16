%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotting wind for understanding HIW reponse to SST pattern
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2022.03/'; 
fext='_global_opt2.c48_tsana_spearle_new_'; period1='2_101'; 
expn='c192L33_am4p0_2010climo'; fn=strcat(tpath,expn,'/',expn,fext,period1,'.mat');load(fn);v0=v;
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear'; fn=strcat(tpath,expn,'/',expn,fext,period1,'.mat');load(fn);v1=v;
expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2'; fn=strcat(tpath,expn,'/',expn,fext,period1,'.mat');load(fn);v2=v;
expn='c192L33_am4p0_2010climo_p1K'; fn=strcat(tpath,expn,'/',expn,fext,period1,'.mat');load(fn);v3=v;
expn='c192L33_am4p0_2010climo_old_p4K'; fn=strcat(tpath,expn,'/',expn,fext,period1,'.mat');load(fn);v4=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v2_bak=v2; v2=v3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%vertical sections
seas={'ANN','MAM','JJA','SON','DJF'}; m=1;
plev={'1000', '925', '850','775','700','600','500','400','300','250','200','150','100','70','50'};
zlev=cellfun(@str2num,plev);
s=v.s; lm=s.lm; lon=s.lon; lat=s.lat; latlon=[0 360 -80 80]; lm(lm>0.5)=1;
a=v0.sfc.slp; a=squeeze(a.sea(m,:,:));    [a,x,y]=get_regdata(a,lat,lon,latlon); slp0=a;
a=v0.atm.za; mv=-999; a=vslice_1var(a,m); [a,x,y]=get_regdata(a,lat,lon,latlon); za0 =a;
a=v0.atm.om; mv=-999; a=vslice_1var(a,m); [a,x,y]=get_regdata(a,lat,lon,latlon); om0 =a;
a=v0.atm.ua; mv=-999; a=vslice_1var(a,m); [a,x,y]=get_regdata(a,lat,lon,latlon); ua0 =a;
a=v0.atm.va; mv=-999; a=vslice_1var(a,m); [a,x,y]=get_regdata(a,lat,lon,latlon); va0 =a;
a=v1.sfc.slp; a=squeeze(a.sea(m,:,:));    [a,x,y]=get_regdata(a,lat,lon,latlon); slp1=a-slp0;
a=v1.atm.za; mv=-999; a=vslice_1var(a,m); [a,x,y]=get_regdata(a,lat,lon,latlon); za1 =a-za0;
a=v1.atm.om; mv=-999; a=vslice_1var(a,m); [a,x,y]=get_regdata(a,lat,lon,latlon); om1 =a-om0;
a=v1.atm.ua; mv=-999; a=vslice_1var(a,m); [a,x,y]=get_regdata(a,lat,lon,latlon); ua1 =a-ua0;
a=v1.atm.va; mv=-999; a=vslice_1var(a,m); [a,x,y]=get_regdata(a,lat,lon,latlon); va1 =a-va0;
a=v2.sfc.slp; a=squeeze(a.sea(m,:,:));    [a,x,y]=get_regdata(a,lat,lon,latlon); slp2=a-slp0;
a=v2.atm.za; mv=-999; a=vslice_1var(a,m); [a,x,y]=get_regdata(a,lat,lon,latlon); za2 =a-za0;
a=v2.atm.om; mv=-999; a=vslice_1var(a,m); [a,x,y]=get_regdata(a,lat,lon,latlon); om2 =a-om0;
a=v2.atm.ua; mv=-999; a=vslice_1var(a,m); [a,x,y]=get_regdata(a,lat,lon,latlon); ua2 =a-ua0;
a=v2.atm.va; mv=-999; a=vslice_1var(a,m); [a,x,y]=get_regdata(a,lat,lon,latlon); va2 =a-va0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot horizontal slice%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmin=-10; cmax=10; cmin1=-3; cmax1=3; %500hPa
cfact=1; fsize=12; n=2; xy=[0 360 min(y) max(y)]; co='k';
pms=[ 0, 0, 1800, 1000]; warning off all
handle = figure('Position', pms,'visible','on');
row=2; col=2; %xy=[100 360 0 max(y)];
subplot(row,col,1); %figure;
k=11; a=squeeze(ua1(k,:,:)); b=squeeze(va1(k,:,:)); c=squeeze(om1(k,:,:))*864; c=slp1-mean(mean(slp1));
c=squeeze(za1(k,:,:)); c=c-mean(mean(c));
contourf(x,y,c,20); hold on; shading flat; colorbar; %caxis([cmin cmax]); 
quiver(x(1:n:end),y(1:n:end),a(1:n:end,1:n:end),b(1:n:end,1:n:end),cfact,'k')
contour(s.lon,s.lat,lm,1,co,'LineWidth',1); 
xlabel('longitude','FontSize',fsize); ylabel('latitude','FontSize',fsize); axis(xy);
set(gca,'FontSize',fsize); title(strcat(plev(k),'hPa wind and height (',seas(m),')'));
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap); %colormap(jet); 
subplot(row,col,2); %figure;
k=11; a=squeeze(ua2(k,:,:)); b=squeeze(va2(k,:,:)); c=squeeze(om2(k,:,:))*864; c=slp2-mean(mean(slp2));
c=squeeze(za2(k,:,:)); c=c-mean(mean(c));
contourf(x,y,c,20); hold on; shading flat; colorbar; %caxis([cmin cmax]); 
quiver(x(1:n:end),y(1:n:end),a(1:n:end,1:n:end),b(1:n:end,1:n:end),cfact,'k')
contour(s.lon,s.lat,lm,1,co,'LineWidth',1); 
xlabel('longitude','FontSize',fsize); ylabel('latitude','FontSize',fsize); axis(xy);
set(gca,'FontSize',fsize); title(strcat(plev(k),'hPa wind and height (',seas(m),')'));
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap); %colormap(jet); 
subplot(row,col,3); %figure;
k=3; a=squeeze(ua1(k,:,:)); b=squeeze(va1(k,:,:)); c=squeeze(om1(k,:,:))*864;
c=slp1-mean(mean(slp1));
contourf(x,y,c,20); hold on; shading flat; colorbar; caxis([cmin1 cmax1]); 
quiver(x(1:n:end),y(1:n:end),a(1:n:end,1:n:end),b(1:n:end,1:n:end),cfact,'k')
contour(s.lon,s.lat,lm,1,co,'LineWidth',1); 
xlabel('longitude','FontSize',fsize); ylabel('latitude','FontSize',fsize); axis(xy);
set(gca,'FontSize',fsize); title(strcat(plev(k),'hPa wind and SLP (',seas(m),')'));
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap); %colormap(jet); 
subplot(row,col,4); %figure;
k=3; a=squeeze(ua2(k,:,:)); b=squeeze(va2(k,:,:)); c=squeeze(om2(k,:,:))*864;
c=slp2-mean(mean(slp2));
contourf(x,y,c,20); hold on; shading flat; colorbar; caxis([cmin1 cmax1]); 
quiver(x(1:n:end),y(1:n:end),a(1:n:end,1:n:end),b(1:n:end,1:n:end),cfact,'k')
contour(s.lon,s.lat,lm,1,co,'LineWidth',1); 
xlabel('longitude','FontSize',fsize); ylabel('latitude','FontSize',fsize); axis(xy);
set(gca,'FontSize',fsize); title(strcat(plev(k),'hPa wind and SLP (',seas(m),')'));
vname=sprintf('lat-lon',string(seas(m)));
visfig='off'; figpath='./fig_cre/';  expn='sst_pattern_effect';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot vertical slice%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1800, 1500]; warning off all
handle = figure('Position', pms,'visible','on'); 
cfact=1; fsize=12; n=2; xz=[0 360 100 1000];
cmin=-50; cmax=50; cmin1=-10; cmax1=10; 
row=3; col=1; lw=1; cfact=1; co='k'; n=3;
subplot(row,col,1);
a=squeeze(nanmean(ua0,2));
b=squeeze(nanmean(va0,2));
c=squeeze(nanmean(om0,2))*864;
contourf(x,zlev,c,20); hold on; shading flat; colorbar; caxis([cmin cmax]); 
quiver(x(1:n:end),zlev,a(:,1:n:end),c(:,1:n:end),cfact,'k')
set(gca,'FontSize',fsize); axis(xz); set(gca,'yDir','reverse'); 
nn=256; cmap=bluewhitered_miz(nn); colormap(cmap); %colormap(jet); 
subplot(row,col,2);
a=squeeze(nanmean(ua1,2));
b=squeeze(nanmean(va1,2));
c=squeeze(nanmean(om1,2))*864;
contourf(x,zlev,c,20); hold on; shading flat; colorbar; caxis([cmin1 cmax1]); 
quiver(x(1:n:end),zlev,a(:,1:n:end),c(:,1:n:end),cfact,'k')
set(gca,'FontSize',fsize); axis(xz); set(gca,'yDir','reverse'); 
subplot(row,col,3);
a=squeeze(nanmean(ua2,2));
b=squeeze(nanmean(va2,2));
c=squeeze(nanmean(om2,2))*864;
contourf(x,zlev,c,20); hold on; shading flat; colorbar; caxis([cmin1 cmax1]); 
quiver(x(1:n:end),zlev,a(:,1:n:end),c(:,1:n:end),cfact,'k')
set(gca,'FontSize',fsize); axis(xz); set(gca,'yDir','reverse');
vname=sprintf('lon-pres',string(seas(m)));
visfig='off'; figpath='./fig_cre/';  expn='sst_pattern_effect';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%wind circulation plotting:
seas={'ANN','MAM','JJA','SON','DJF'};
plev={'1000', '925', '850','775','700','600','500','400','300','250','200','150','100','70','50'};
zlev=cellfun(@str2num,plev);
kom=7; k=3; m=3;  %k=7: 500hPa; 11: 200hPa; m=1:ANN; 2:MAM; 3:JJA; 4:SON; 5:DJF;
v=v0; ua=v.atm.ua(k); va=v.atm.va(k); om=v.atm.om(kom); 
ua=squeeze(ua.sea(m,:,:)); va=squeeze(va.sea(m,:,:)); om=squeeze(om.sea(m,:,:));
wsp0=sqrt(ua.^2+va.^2); ua0=ua; va0=va; om0=om*864;
v=v1; ua=v.atm.ua(k); va=v.atm.va(k); om=v.atm.om(kom);
ua=squeeze(ua.sea(m,:,:)); va=squeeze(va.sea(m,:,:)); om=squeeze(om.sea(m,:,:));
wsp1=sqrt(ua.^2+va.^2); ua1=ua; va1=va; om1=om*864;
v=v2; ua=v.atm.ua(k); va=v.atm.va(k); om=v.atm.om(kom);
ua=squeeze(ua.sea(m,:,:)); va=squeeze(va.sea(m,:,:)); om=squeeze(om.sea(m,:,:));
wsp2=sqrt(ua.^2+va.^2); ua2=ua; va2=va; om2=om*864;

ua1=ua1-ua0; va1=va1-va0; om1=om1-om0; wsp1=wsp1-wsp0;
ua2=ua2-ua0; va2=va2-va0; om2=om2-om0; wsp2=wsp2-wsp0;

s=v.s; x=s.lon; y=s.lat; lm=s.lm; lm(lm>0.5)=1;
xy=[0 360 -80 80]; cmin0=-50; cmax0=50; cmin1=-20; cmax1=20; cmin2=-30; cmax2=30;
pms=[ 0, 0, 2400, 1200]; warning off all
handle = figure('Position', pms,'visible','on'); 
row=2; col=2; fsize=18; lw=1; cfact=1; co='k'; n=3;
subplot(row,col,1); 
contourf(x,y,wsp0,20); hold on; shading flat; colorbar; caxis([cmin0 cmax0]); 
quiver(x(1:n:end),y(1:n:end),ua0(1:n:end,1:n:end),va0(1:n:end,1:n:end),cfact,'k')
contour(x,y,lm,1,co,'LineWidth',1); 
nn=256;  cmap=bluewhitered_miz(nn); colormap(cmap); %colormap(jet); 
xlabel('longitude','FontSize',fsize);
ylabel('latitude','FontSize',fsize); axis(xy);
set(gca,'FontSize',fsize); title(strcat(plev(k),'hPa winds (',seas(m),')'));
subplot(row,col,2);

figure
contourf(x,z,v0.atm.om,20); hold on; shading flat; colorbar;

contourf(x,y,om1,20); hold on; shading flat; colorbar; caxis([cmin2 cmax2]); 
quiver(x(1:n:end),y(1:n:end),ua1(1:n:end,1:n:end),va1(1:n:end,1:n:end),cfact,'k')
contour(x,y,lm,1,co,'LineWidth',1); 
xlabel('longitude','FontSize',fsize); ylabel('latitude','FontSize',fsize); axis(xy);
set(gca,'FontSize',fsize); title(strcat(plev(k),'hPa winds (',seas(m),')'));

subplot(row,col,3); a=om1;
contourf(x,y,a,20); hold on; shading flat; colorbar; caxis([cmin1 cmax1]); 
quiver(x(1:n:end),y(1:n:end),ua1(1:n:end,1:n:end),va1(1:n:end,1:n:end),cfact,'k')
contour(x,y,lm,1,co,'LineWidth',1); 
xlabel('longitude','FontSize',fsize); ylabel('latitude','FontSize',fsize); axis(xy);
set(gca,'FontSize',fsize); title(strcat(plev(k),'hPa winds (',seas(m),')'));
subplot(row,col,4); a=om2;
contourf(x,y,a,20); hold on; shading flat; colorbar; caxis([cmin1 cmax1]); 
quiver(x(1:n:end),y(1:n:end),ua2(1:n:end,1:n:end),va2(1:n:end,1:n:end),cfact,'k')
contour(x,y,lm,1,co,'LineWidth',1); 
xlabel('longitude','FontSize',fsize); ylabel('latitude','FontSize',fsize); axis(xy);
set(gca,'FontSize',fsize); title(strcat(plev(k),'hPa winds (',seas(m),')'));

vname=sprintf('wind%s',string(plev(k)),string(seas(m)));
visfig='off'; figpath='./fig_cre/';  expn='sst_pattern_effect';
printnew(visfig,figpath,expn,vname);

return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CLIMO runs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%below opt=1 for writing mat file to /work/miz 
%below opt=2 for writing mat file to /archive
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
latlon=[0 360 -90 90];region='global';mod='c96';myr=5;
fn=strcat('/work/miz/mat_hiresmip/obs_',region,'_to_c48.mat'); ;load(fn); o.mod='c48'

tpath='/archive/Ming.Zhao/awg/2022.03/'
p.latlon=[0 360 -90 90]; p.region='global'; p.mod='c192'; p.opt=0; 
p.yr1='0002'; p.yr2='0101'; p.myr=1; p.do_trend=0; p.do_scalar=0;
p.syr=1; p.nyr=100; p.y1=0002; p.y2=0101; p.opt=2; p.do_3d_atm=1;
%p.expn='c192L33_am4p0_2010climo';
p.expn='c192L33_am4p0_2010climo_p1K';
%p.expn='c192L33_am4p0_2010climo_old_p4K';
%p.expn='c192L33_am4p0_2010climo_trend_1979_2020_spear'; 
%p.expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2';
v=tsana_spearle(o,tpath,p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
