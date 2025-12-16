function [ts,ind]=plot_spearle_all(vm, o, p)
land_th=o.land_th; ice_th=o.ice_th; 
a=o.lm0; a(a>=land_th)=1; a(a<land_th)=0; lm=a; %land mask
a=o.imk; a(a>=ice_th) =1; a(a<=ice_th)=0; im=a; %ice mask
idm=lm|im; id=~idm;                     %land & ice mask
aa=o.aa; aa0=aa(id)/mean(aa(id)); %for open ocean area-weighting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lon=o.lon; lat=o.lat; rg.idm_all=idm; rg.id_all=id;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rg.latlon_tpac=[140 270 -10 10]; a=rg.latlon_tpac; %rg:tropical Pacific region
rg.latlon_tpac=[110 280 -10 10]; a=rg.latlon_tpac; %rg:tropical Pacific region

lat1=a(3); lat2=a(4); lon1=a(1); lon2=a(2); rg.tpac=[lon1 lat1 lon2-lon1 lat2-lat1];
rg.ys=min(find(lat(:)>=lat1)); rg.ye=max(find(lat(:)<=lat2));
rg.xs=min(find(lon(:)>=lon1)); rg.xe=max(find(lon(:)<=lon2));
a=id; a(:,:)=0; a(rg.ys:rg.ye,rg.xs:rg.xe)=1; rg.id=a;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rg.latlon_wpac=[110 180 -10  10];  %west pacific
rg.latlon_epac=[180 280 -10  10];  %east Pacific
rg.latlon_nhep=[180 280  5   10];
rg.latlon_shep=[180 280 -10  -5];
rg.latlon_equa=[180 280 -5    5];
%rg.latlon_wpac=[140 170 -3    3];  %west pacific
%rg.latlon_epac=[190 270 -3    3];  %east Pacific
%rg.latlon_nhep=[190 240  3    9];
%rg.latlon_shep=[190 240 -9   -3];
%rg.latlon_equa=[190 240 -3    3];
rg.latlon_ipwp=[50  180 -30  30];
rg.latlon_trop=[0   360 -30  30];
rg.latlon_so  =[0   360 -75 -45];
rg.latlon_glob=[0   360 -90  90];
a=rg.latlon_ipwp; rg.ipwp=[a(1) a(3) a(2)-a(1) a(4)-a(3)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%observed trend%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
obs=squeeze(vm(1).sst.hadisst.trend); a=obs; 
a0=mean(mean(a(id).*aa0)); 
if p.do_norm; 
  a=(a-a0)/a0; obs_norm=a; 
end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, p.xsize, p.ysize]*1.2; fsize=6; 
handle=figure('Position',pms,'visible','on'); 
row=7; col=5; cmap=bluewhitered_miz(256); 
co='k'; cmin=p.cmin; cmax=p.cmax;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mod_num=30; n=5; x=[1979:2020];
for i = 1:mod_num
  v=vm(i); j=i+n;
  subplot(row, col, j); colormap(cmap);
  if strcmp(p.vname,'sst_trend')|strcmp(p.vname,'sst_trend_norm')
    a=v.sst.mod.trend; mod_org(i,:,:)=a; 
    mod_all(i,:,:,:)=squeeze(mean(v.sst.mod.ts.sst,2));
    a0=mean(mean(a(id).*aa0)); mod_av(i)=a0;
    if p.do_norm
      a=(a-a0)/a0; mod_norm(i,:,:)=a;
      ts(i)=get_sst_indices(o,a,rg,obs_norm);
    else
      ts(i)=get_sst_indices(o,a,rg,obs);
    end
  end
  a(idm)=NaN;
  pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
  contour(lon,lat,lm,1,co);
  rectangle('Position',rg.tpac,'EdgeColor',p.color,'LineStyle',':');
  rectangle('Position',rg.ipwp,'EdgeColor',p.color1,'LineStyle',':');
  set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
  corr_glob(i)=ts(i).corr_glob;
  corr_tpac(i)=ts(i).corr_tpac;
  titl=sprintf('M%02d (avg=%4.2fK; r1=%4.2f; r2=%4.2f)',i,a0,corr_glob(i),corr_tpac(i)); 
  title(titl,'FontSize',fsize);
  
  a=v.tsurf; b=get_sst_indices(o,a,rg);
  y=b.wpac-b.epac;            c=polyfit(x, y, 1); ts(i).ew  =c(1)*10;
  y=(b.shep+b.nhep)/2-b.equa; c=polyfit(x, y, 1); ts(i).ns  =c(1)*10;
  y=b.so;                     c=polyfit(x, y, 1); ts(i).so  =c(1)*10;
  y=b.ipwp;                   c=polyfit(x, y, 1); ts(i).ipwp=c(1)*10;
  y=b.trop;                   c=polyfit(x, y, 1); ts(i).trop=c(1)*10;
  y=b.glob;                   c=polyfit(x, y, 1); ts(i).glob=c(1)*10;
  ts(i).rat_ipwp1=ts(i).ipwp/ts(i).trop;
  ts(i).rat_ipwp2=ts(i).ipwp/ts(i).glob;
  ts(i).rat_so1  =ts(i).so  /ts(i).trop;
  ts(i).rat_so2  =ts(i).so  /ts(i).glob;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%HadISST observed trend%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1; a0=mean(mean(obs(id).*aa0));
if p.do_norm; 
  a=obs_norm; 
else
  a=obs;
end
ts(i)=get_sst_indices(o,a,rg,obs);
corr_glob(i)=ts(i).corr_glob;
corr_tpac(i)=ts(i).corr_tpac;
subplot(row, col, 1); a(idm==1)=NaN; colormap(cmap);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co); 
rectangle('Position',rg.tpac,'EdgeColor',p.color,'LineStyle',':');
rectangle('Position',rg.ipwp,'EdgeColor',p.color1,'LineStyle',':');
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
titl=sprintf('(a) HadISST (avg=%4.2fK; r1=%4.2f; r2=%4.2f)',a0,corr_glob(i),corr_tpac(i)); 
title(titl,'FontSize',fsize);
%---------------------------
a=vm(1).sst.hadisst.ts.sst; a=squeeze(mean(a,2));
b=get_sst_indices(o,a,rg);
y=b.wpac-b.epac;            c=polyfit(x, y, 1); ts(i).ew  =c(1)*10;
y=(b.shep+b.nhep)/2-b.equa; c=polyfit(x, y, 1); ts(i).ns  =c(1)*10;
y=b.so;                     c=polyfit(x, y, 1); ts(i).so  =c(1)*10;
y=b.ipwp;                   c=polyfit(x, y, 1); ts(i).ipwp=c(1)*10;
y=b.trop;                   c=polyfit(x, y, 1); ts(i).trop=c(1)*10;
y=b.glob;                   c=polyfit(x, y, 1); ts(i).glob=c(1)*10;
ts(i).rat_ipwp1=ts(i).ipwp/ts(i).trop;
ts(i).rat_ipwp2=ts(i).ipwp/ts(i).glob;
ts(i).rat_so1  =ts(i).so  /ts(i).trop;
ts(i).rat_so2  =ts(i).so  /ts(i).glob;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERSST observed trend%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1; a=squeeze(vm(1).sst.ersst.trend); 
idx=~isnan(a)&id; a0=o.aa; a0=a0(idx)/mean(a0(idx));
a0=mean(mean(a(idx).*a0));
if p.do_norm; a=(a-a0)/a0; end
ts(i)=get_sst_indices(o,a,rg,obs);
corr_glob(i)=ts(i).corr_glob;
corr_tpac(i)=ts(i).corr_tpac;
subplot(row, col, 2); a(idm==1)=NaN; colormap(cmap);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co); 
rectangle('Position',rg.tpac,'EdgeColor',p.color,'LineStyle',':');
rectangle('Position',rg.ipwp,'EdgeColor',p.color1,'LineStyle',':');
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
titl=sprintf('(b) ERSSTv5 (avg=%4.2fK; r1=%4.2f; r2=%4.2f)',a0,corr_glob(i),corr_tpac(i)); 
title(titl,'FontSize',fsize);
%---------------------------
a=vm(1).sst.ersst.ts.sst; a=squeeze(mean(a,2));
b=get_sst_indices(o,a,rg);
y=b.wpac-b.epac;            c=polyfit(x, y, 1); ts(i).ew  =c(1)*10;
y=(b.shep+b.nhep)/2-b.equa; c=polyfit(x, y, 1); ts(i).ns  =c(1)*10;
y=b.so;                     c=polyfit(x, y, 1); ts(i).so  =c(1)*10;
y=b.ipwp;                   c=polyfit(x, y, 1); ts(i).ipwp=c(1)*10;
y=b.trop;                   c=polyfit(x, y, 1); ts(i).trop=c(1)*10;
y=b.glob;                   c=polyfit(x, y, 1); ts(i).glob=c(1)*10;
ts(i).rat_ipwp1=ts(i).ipwp/ts(i).trop;
ts(i).rat_ipwp2=ts(i).ipwp/ts(i).glob;
ts(i).rat_so1  =ts(i).so  /ts(i).trop;
ts(i).rat_so2  =ts(i).so  /ts(i).glob;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%COBESST observed trend%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1; a=squeeze(vm(1).sst.cobesst.trend);
idx=~isnan(a)&id; a0=o.aa; a0=a0(idx)/mean(a0(idx));
a0=mean(mean(a(idx).*a0));
if p.do_norm; a=(a-a0)/a0; end
ts(i)=get_sst_indices(o,a,rg,obs);
corr_glob(i)=ts(i).corr_glob;
corr_tpac(i)=ts(i).corr_tpac;
subplot(row, col, 3); a(idm==1)=NaN; colormap(cmap);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co); title('HadISST','FontSize',fsize);
rectangle('Position',rg.tpac,'EdgeColor',p.color,'LineStyle',':');
rectangle('Position',rg.ipwp,'EdgeColor',p.color1,'LineStyle',':');
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
titl=sprintf('(c) COBE SST (avg=%4.2fK; r1=%4.2f; r2=%4.2f)',a0,corr_glob(i),corr_tpac(i)); 
title(titl,'FontSize',fsize);
a=vm(1).sst.cobesst.ts.sst; a=squeeze(mean(a,2));
b=get_sst_indices(o,a,rg);
y=b.wpac-b.epac;            c=polyfit(x, y, 1); ts(i).ew  =c(1)*10;
y=(b.shep+b.nhep)/2-b.equa; c=polyfit(x, y, 1); ts(i).ns  =c(1)*10;
y=b.so;                     c=polyfit(x, y, 1); ts(i).so  =c(1)*10;
y=b.ipwp;                   c=polyfit(x, y, 1); ts(i).ipwp=c(1)*10;
y=b.trop;                   c=polyfit(x, y, 1); ts(i).trop=c(1)*10;
y=b.glob;                   c=polyfit(x, y, 1); ts(i).glob=c(1)*10;
ts(i).rat_ipwp1=ts(i).ipwp/ts(i).trop;
ts(i).rat_ipwp2=ts(i).ipwp/ts(i).glob;
ts(i).rat_so1  =ts(i).so  /ts(i).trop;
ts(i).rat_so2  =ts(i).so  /ts(i).glob;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%COBE2SST observed trend%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1; a=squeeze(vm(1).sst.cobe2sst.trend);
idx=~isnan(a)&id; a0=o.aa; a0=a0(idx)/mean(a0(idx));
a0=mean(mean(a(idx).*a0));
if p.do_norm; a=(a-a0)/a0; end
ts(i)=get_sst_indices(o,a,rg,obs);
corr_glob(i)=ts(i).corr_glob;
corr_tpac(i)=ts(i).corr_tpac;
subplot(row, col, 4); a(idm==1)=NaN; colormap(cmap);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co); title('HadISST','FontSize',fsize);
rectangle('Position',rg.tpac,'EdgeColor',p.color,'LineStyle',':');
rectangle('Position',rg.ipwp,'EdgeColor',p.color1,'LineStyle',':');
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
titl=sprintf('(d) COBE2 SST (avg=%4.2fK; r1=%4.2f; r2=%4.2f)',a0,corr_glob(i),corr_tpac(i)); 
title(titl,'FontSize',fsize);
a=vm(1).sst.cobe2sst.ts.sst; a=squeeze(mean(a,2));
b=get_sst_indices(o,a,rg);
y=b.wpac-b.epac;            c=polyfit(x, y, 1); ts(i).ew  =c(1)*10;
y=(b.shep+b.nhep)/2-b.equa; c=polyfit(x, y, 1); ts(i).ns  =c(1)*10;
y=b.so;                     c=polyfit(x, y, 1); ts(i).so  =c(1)*10;
y=b.ipwp;                   c=polyfit(x, y, 1); ts(i).ipwp=c(1)*10;
y=b.trop;                   c=polyfit(x, y, 1); ts(i).trop=c(1)*10;
y=b.glob;                   c=polyfit(x, y, 1); ts(i).glob=c(1)*10;
ts(i).rat_ipwp1=ts(i).ipwp/ts(i).trop;
ts(i).rat_ipwp2=ts(i).ipwp/ts(i).glob;
ts(i).rat_so1  =ts(i).so  /ts(i).trop;
ts(i).rat_so2  =ts(i).so  /ts(i).glob;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SPEAR LE ensemble mean%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1;
a=mod_org; a=squeeze(mean(a,1)); a0=mean(mean(a(id).*aa0));
if p.do_norm; 
  a=mod_norm; a=squeeze(mean(a,1)); ts(i)=get_sst_indices(o,a,rg,obs_norm);
else
  a=mod_org;  a=squeeze(mean(a,1)); ts(i)=get_sst_indices(o,a,rg,obs);
end
corr_glob(i)=ts(i).corr_glob;
corr_tpac(i)=ts(i).corr_tpac;
subplot(row, col, 5); a(idm==1)=NaN; colormap(cmap);
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co); 
rectangle('Position',rg.tpac,'EdgeColor',p.color,'LineStyle',':');
rectangle('Position',rg.ipwp,'EdgeColor',p.color1,'LineStyle',':');
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
titl=sprintf('(e) ENS mean (avg=%4.2fK; r1=%4.2f; r2=%4.2f)',a0,corr_glob(i),corr_tpac(i)); 
title(titl,'FontSize',fsize);
a=squeeze(mean(mod_all,1)); b=get_sst_indices(o,a,rg);
y=b.wpac-b.epac;            c=polyfit(x, y, 1); ts(i).ew  =c(1)*10;
y=(b.shep+b.nhep)/2-b.equa; c=polyfit(x, y, 1); ts(i).ns  =c(1)*10;
y=b.so;                     c=polyfit(x, y, 1); ts(i).so  =c(1)*10;
y=b.ipwp;                   c=polyfit(x, y, 1); ts(i).ipwp=c(1)*10;
y=b.trop;                   c=polyfit(x, y, 1); ts(i).trop=c(1)*10;
y=b.glob;                   c=polyfit(x, y, 1); ts(i).glob=c(1)*10;
ts(i).rat_ipwp1=ts(i).ipwp/ts(i).trop;
ts(i).rat_ipwp2=ts(i).ipwp/ts(i).glob;
ts(i).rat_so1  =ts(i).so  /ts(i).trop;
ts(i).rat_so2  =ts(i).so  /ts(i).glob;

a=p.vname; a=strrep(a,'_',' '); %sgtitle(a);
cb = colorbar('FontSize',fsize+4,'Location','southoutside');
set(cb, 'Position', [.165 .04 .7 .02]); caxis([cmin, cmax+0.001]); 
colormap(cmap); 
%if p.opt == "bias"; a=length(c); c(a/2-1:a/2+2,:)=1; colormap(c);end;
% cb.Position = [0.92 0.11 0.02 0.81]; full size right outside
%cb.Position = [0.92 0.45 0.02 0.41];

vname = p.vname; mod_name=p.mod_name; 
visfig='off'; figpath='./fig_cre/';
printnew(visfig,figpath,mod_name,vname);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%simple indices%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:length(ts)
  a=ts(i); ew(i)=a.ew; ns(i)=a.ns; wme(i)=a.wme; smn(i)=a.smn; 
  ipwp(i)=a.ipwp; so(i)=a.so; trop(i)=a.trop; glob(i)=a.glob;
  rat_ipwp(i)=a.rat_ipwp2; rat_so(i)=a.rat_so2; 
  corr_glob(i)=a.corr_glob; %corr_trop(i)=a.corr_trop;
  corr_tpac(i)=a.corr_tpac;
end
pms=[ 0, 0, 850, 780]*1.2; fsize=10; ms=10; row=2; col=2; lw=2;
handle=figure('Position',pms,'visible','on'); 
subplot(row, col, 1); x=[-2 2]; i1=1; i2=35;
x1=ew; y1=ns;
c1=polyfit(x1(i1:i2),y1(i1:i2),1); y=c1(1)*x+c1(2); plot(x,y,'b--');hold on; 
c1=corrcoef(x1(i1:i2),y1(i1:i2)); s1=sprintf('r=%4.2f',c1(1,2));
i=31; plot(x1(i),y1(i),'bd','MarkerSize',ms,'LineWidth',lw); hold on;
i=32; plot(x1(i),y1(i),'bo','MarkerSize',ms,'LineWidth',lw); 
i=33; plot(x1(i),y1(i),'b*','MarkerSize',ms,'LineWidth',lw); 
i=34; plot(x1(i),y1(i),'bs','MarkerSize',ms,'LineWidth',lw); 
i=35; plot(x1(i),y1(i),'bp','MarkerSize',ms,'LineWidth',lw); 
plot(x1(1:30),y1(1:30),'b+','MarkerSize',8); hold on; 
for i=1:30
  text(x1(i),y1(i),num2str(i),'FontSize',8,'Color','b');
end
xy=[-0.1 0.15 -0.08 0.05]; mylabel(xy,2,'(a)',fsize);
legend(s1,'HadISST','ERSSTv5','COBE SST','COBE2 SST','SPEAR-LE','Location','southeast');
xlabel('Pacific W-E SST index (K/decade)','FontSize',fsize,'Interpreter','latex');
ylabel('Pacific O-E SST index (K/decade)','FontSize',fsize,'Interpreter','latex');
set(gca,'FontSize',fsize); 

subplot(row, col, 2);
x1=rat_so; y1=rat_ipwp;
c1=polyfit(x1(i1:i2),y1(i1:i2),1); y=c1(1)*x+c1(2); plot(x,y,'b--');hold on; 
c1=corrcoef(x1(i1:i2),y1(i1:i2)); s1=sprintf('r=%4.2f',c1(1,2)); 
i=31; plot(x1(i),y1(i),'bd','MarkerSize',ms,'LineWidth',lw); hold on;
i=32; plot(x1(i),y1(i),'bo','MarkerSize',ms,'LineWidth',lw); 
i=33; plot(x1(i),y1(i),'b*','MarkerSize',ms,'LineWidth',lw); 
i=34; plot(x1(i),y1(i),'bs','MarkerSize',ms,'LineWidth',lw); 
i=35; plot(x1(i),y1(i),'bp','MarkerSize',ms,'LineWidth',lw); 
plot(x1(1:30),y1(1:30),'b+','MarkerSize',8); 
for i=1:30
  text(x1(i),y1(i),num2str(i),'FontSize',8,'Color','b');
end
xy=[-0.5 0.9 0.9 1.45]; mylabel(xy,1,'(b)',fsize);
legend(s1,'HadISST','ERSSTv5','COBE SST','COBE2 SST','SPEAR-LE','Location','southwest');
ylabel('Indo-Pacific Warm Pool SST warming ratio','FontSize',fsize,'Interpreter','latex');
xlabel('Southern Ocean SST warming ratio','FontSize',fsize,'Interpreter','latex');
set(gca,'FontSize',fsize); 

subplot(row, col, 3); obs(idm==1)=NaN; colormap(cmap); 
y1=corr_tpac; x1=corr_glob; %ms=10;
c1=polyfit(x1(i1:i2),y1(i1:i2),1); y=c1(1)*x+c1(2); plot(x,y,'b--');hold on; 
c1=corrcoef(x1(i1:i2),y1(i1:i2)); s1=sprintf('r=%4.2f',c1(1,2)); 
i=31; plot(x1(i),y1(i),'bd','MarkerSize',ms,'LineWidth',lw); hold on;
i=32; plot(x1(i),y1(i),'bo','MarkerSize',ms,'LineWidth',lw); 
i=33; plot(x1(i),y1(i),'b*','MarkerSize',ms,'LineWidth',lw); 
i=34; plot(x1(i),y1(i),'bs','MarkerSize',ms,'LineWidth',lw); 
i=35; plot(x1(i),y1(i),'bp','MarkerSize',ms,'LineWidth',lw); 
plot(x1(1:30),y1(1:30),'b+','MarkerSize',8); 
for i=1:30
  text(x1(i),y1(i),num2str(i),'FontSize',8,'Color','b'); hold on;
end
xy=[0.2 1.1 -0.9 1.1]; mylabel(xy,2,'(c)',fsize);
legend(s1,'HadISST','ERSSTv5','COBE SST','COBE2 SST','SPEAR-LE','Location','southeast');
xlabel('SST trend pattern correlation (global open ocean)','FontSize',fsize,'Interpreter','latex');
ylabel('SST trend pattern correlation (equatorial Pacific)','FontSize',fsize,'Interpreter','latex');
set(gca,'FontSize',fsize); 

subplot(row, col, 4); obs(idm==1)=NaN; colormap(cmap); x=[-2 2]; %ms=10;
y1=glob; x1=rat_so; x2=rat_ipwp; x3=ew; i1=1; i2=35;
c1=polyfit(x1(i1:i2),y1(i1:i2),1); y=c1(1)*x+c1(2); plot(x,y,'k--');hold on; 
c2=polyfit(x2(i1:i2),y1(i1:i2),1); y=c2(1)*x+c2(2); plot(x,y,'r--');
c3=polyfit(x3(i1:i2),y1(i1:i2),1); y=c3(1)*x+c3(2); plot(x,y,'b--');
i=31; plot(x1(i),y1(i),'kd','MarkerSize',ms,'LineWidth',lw); hold on;
i=32; plot(x1(i),y1(i),'ko','MarkerSize',ms,'LineWidth',lw); 
i=33; plot(x1(i),y1(i),'k*','MarkerSize',ms,'LineWidth',lw); 
i=34; plot(x1(i),y1(i),'ks','MarkerSize',ms,'LineWidth',lw); 
i=35; plot(x1(i),y1(i),'kp','MarkerSize',ms,'LineWidth',lw); 
i=31; plot(x2(i),y1(i),'rd','MarkerSize',ms,'LineWidth',lw); 
i=32; plot(x2(i),y1(i),'ro','MarkerSize',ms,'LineWidth',lw); 
i=33; plot(x2(i),y1(i),'r*','MarkerSize',ms,'LineWidth',lw); 
i=34; plot(x2(i),y1(i),'rs','MarkerSize',ms,'LineWidth',lw); 
i=35; plot(x2(i),y1(i),'rp','MarkerSize',ms,'LineWidth',lw); 
i=31; plot(x3(i),y1(i),'bd','MarkerSize',ms,'LineWidth',lw); 
i=32; plot(x3(i),y1(i),'bo','MarkerSize',ms,'LineWidth',lw); 
i=33; plot(x3(i),y1(i),'b*','MarkerSize',ms,'LineWidth',lw); 
i=34; plot(x3(i),y1(i),'bs','MarkerSize',ms,'LineWidth',lw); 
i=35; plot(x3(i),y1(i),'bp','MarkerSize',ms,'LineWidth',lw); 
plot(x1(1:30),y1(1:30),'k+','MarkerSize',8); 
plot(x2(1:30),y1(1:30),'r+','MarkerSize',8); 
plot(x3(1:30),y1(1:30),'b+','MarkerSize',8); 
for i=1:30
  text(x1(i),y1(i),num2str(i),'FontSize',8,'Color','k'); hold on;
  text(x2(i),y1(i),num2str(i),'FontSize',8,'Color','r'); 
  text(x3(i),y1(i),num2str(i),'FontSize',8,'Color','b'); 
end
xy=[-0.5 1.5 0.05 0.41]; mylabel(xy,1,'(d)',fsize);
c1=corrcoef(x1(i1:i2),y1(i1:i2));
c2=corrcoef(x2(i1:i2),y1(i1:i2));
c3=corrcoef(x3(i1:i2),y1(i1:i2));
s1=sprintf('r=%4.2f',c1(1,2)); 
s2=sprintf('r=%4.2f',c2(1,2));
s3=sprintf('r=%4.2f',c3(1,2));
text( 0.5,  0.13, 'SO',  'FontSize',14,'Color','k');
text( 1.2,  0.19, 'IPWP','FontSize',14,'Color','r');
text(-0.31, 0.2,  'W-E', 'FontSize',14,'Color','b');


legend(s1,s2,s3,'HadISST','ERSSTv5','COBE SST','COBE2 SST','SPEAR-LE','Location','northwest');
xlabel('SO, IPWP, W-E SST index (K/decade)','FontSize',fsize,'Interpreter','latex');
ylabel('global mean SST trend (K/decade)','FontSize',fsize,'Interpreter','latex');
set(gca,'FontSize',fsize); 

% $$$ subplot(row, col, 5); obs(idm==1)=NaN; colormap(cmap); 
% $$$ i=31; a=corr_tpac(i); plot([a a], [0 10],'k'); hold on;
% $$$ i=32; a=corr_tpac(i); plot([a a], [0 10],'r');
% $$$ i=33; a=corr_tpac(i); plot([a a], [0 10],'g');
% $$$ i=34; a=corr_tpac(i); plot([a a], [0 10],'m');
% $$$ i=35; a=corr_tpac(i); plot([a a], [0 10],'b');
% $$$ hist(corr_tpac(1:30),[-1:0.1:1]); hold on; 
% $$$ xy=[-1 1.1 0 15]; mylabel(xy,2,'(c)',fsize);
% $$$ legend('HadISST','ERSSTv5','COBE SST','COBE2 SST','SPEAR-LE','Location','northeast');
% $$$ xlabel('pattern correlation coefficent (equatorial Pacific)','FontSize',fsize);
% $$$ ylabel('number of simulations','FontSize',fsize);
% $$$ set(gca,'FontSize',fsize); 
% $$$ subplot(row, col, 6); obs(idm==1)=NaN; colormap(cmap); 
% $$$ i=31; a=corr_glob(i); plot([a a], [0 30],'k'); hold on;
% $$$ i=32; a=corr_glob(i); plot([a a], [0 30],'r'); 
% $$$ i=33; a=corr_glob(i); plot([a a], [0 30],'g'); 
% $$$ i=34; a=corr_glob(i); plot([a a], [0 30],'m'); 
% $$$ i=35; a=corr_glob(i); plot([a a], [0 30],'b'); 
% $$$ hist(corr_glob(1:30),[0:0.1:1]); hold on; axis([-0.1 1.1 0 15]);
% $$$ legend('HadISST','ERSSTv5','COBE SST','COBE2 SST','SPEAR-LE','Location','NorthWest');
% $$$ xlabel('pattern correlation coefficent (global)','FontSize',fsize);
% $$$ ylabel('number of simulations','FontSize',fsize);
% $$$ set(gca,'FontSize',fsize); 

ind.ew=ew; ind.ns=ns; 
ind.rat_ipwp=rat_ipwp; ind.rat_so=rat_so; ind.so=so;
ind.corr_glob=corr_glob; ind.corr_tpac=corr_tpac;
ind.ipwp=ipwp; ind.so=so; ind.trop=trop; ind.glob=glob;

vname='index'; mod_name=p.mod_name; 
visfig='off'; figpath='./fig_cre/';
printnew(visfig,figpath,mod_name,vname);

return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load SPEAR LE runs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/am4_spear/'; 
expn0='SPEAR_c192_o1_Hist_AllForc_IC1921_K50_ens_';
fext='_global_opt0.c48_tsana_spearle_new_';
period1='1921_2100';  %period2='2019_2060'; 
expn=sprintf('%s%02d',expn0,1);
fn=strcat(tpath,expn,'/',expn,fext,period1,'.mat')
load(fn); o=v.s; o.imk=v.sfc.ice.tavg0;
for i=1:30
  expn=sprintf('%s%02d',expn0,i); 
  fn=strcat(tpath,expn,'/',expn,fext,period1,'.mat')
  load(fn); vm(i)=v;
  %vm(i).sst.mod=v.tr.tsurf.mod;  vm(i).tsurf=v.sfc.tsurf.ann;
  %tsurf(i,:,:,:)=v.sfc.tsurf.ann;
  %fn=strcat(tpath,expn,'/',expn,fext,period2,'.mat')
  %load(fn); w(i).sst=v.sst; w(i).pcp=v.pcp;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
o=v.s; o.imk=v.sfc.ice.tavg0; o.land_th=0.1; o.ice_th=0.1;
p.x1=0; p. x2=360; p.y1=-90; p.y2=90; p.xsize=1100; p.ysize=1000; 
%p.x1=140; p. x2=270; p.y1=-10; p.y2=10; p.xsize=1100; p.ysize=1000; 
p.mod_name="spear_historical"; p.color='w'; p.color1='c';
p.do_norm=0; p.cmin=-0.3; p.cmax=0.3; p.vname="sst_trend"; 
%p.do_norm=1; p.cmin=-1.5; p.cmax=1.5; p.vname="sst_trend_norm"; 
[ts,ind]=plot_spearle_all(vm, o, p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
