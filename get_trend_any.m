function [v]=get_trend_any(vm, y1, y2, alpha)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%y1=1979; y2=2020; alpha=0.8;
%y1=2021; y2=2070; alpha=0.8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute the hadisst SST trend if yr1 and yr2 are within the data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=vm(1);
ia=1870; ib=2021; Y=[ia:ib]'; 
a=v.tr.sst.hadisst.ts.sst; b=v.tr.sst.hadisst.ts.ice;
obs.hadisst=get_obs_sst(v.s,a,b,Y,y1,y2,alpha)

ia=1870; ib=2020; Y=[ia:ib]'; 
a=v.tr.sst.ersst.ts.sst; b=a<0;
obs.ersst=get_obs_sst(v.s,a,b,Y,y1,y2,alpha)

ia=1891; ib=2020; Y=[ia:ib]'; 
a=v.tr.sst.cobesst.ts.sst; b=a<0;
obs.cobesst=get_obs_sst(v.s,a,b,Y,y1,y2,alpha)

ia=1850; ib=2020; Y=[ia:ib]'; 
a=v.tr.sst.cobe2sst.ts.sst; b=a<0;
obs.cobe2sst=get_obs_sst(v.s,a,b,Y,y1,y2,alpha)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mod_num=30; s=vm(1).s; clear sst ice;
for i = 1:mod_num
  v=vm(i); yr=[v.t1:v.t2-1];
  a=v.sfc.tsurf.all; b=v.sfc.ice.all;
  i1=find(yr==y1); i2=find(yr==y2); xt=yr(i1:i2)';
  a=a(i1:i2,:,:,:); 
  b=b(i1:i2,:,:,:); 
  sst(i,:,1:12,:,:)=a;
  ice(i,:,1:12,:,:)=b;
  sst(i,:,13,:,:)=squeeze(mean(a,2));
  ice(i,:,13,:,:)=squeeze(mean(b,2));
  sst(i,:,14,:,:)=squeeze((a(:,12,:,:)+a(:,1,:,:)+a(:,2,:,:))/3);
  ice(i,:,14,:,:)=squeeze((b(:,12,:,:)+b(:,1,:,:)+b(:,2,:,:))/3);
  sst(i,:,15,:,:)=squeeze(mean(a(:,6:8,:,:),2));
  ice(i,:,15,:,:)=squeeze(mean(b(:,6:8,:,:),2));
  mod(i).xt=xt; 
  mod(i).sst=squeeze(sst(i,:,:,:,:)); 
  mod(i).ice=squeeze(ice(i,:,:,:,:)); 
  mod(i).sst_clm=squeeze(mean(mod(i).sst,1));
  mod(i).ice_clm=squeeze(mean(mod(i).ice,1));
end
i=mod_num+1; mod(i).xt=xt; 
mod(i).sst=squeeze(mean(sst,1));
mod(i).ice=squeeze(mean(ice,1));
mod(i).sst_clm=squeeze(mean(mod(i).sst,1));
mod(i).ice_clm=squeeze(mean(mod(i).ice,1));
clear sst;
for i = 1:mod_num+1
  sst=mod(i).sst; disp('mode_num:');i
  for m=1:length(sst(1,:,1,1)); disp('m=');m
    a=squeeze(mod(i).sst(:,m,:,:));
    x=get_trend_TSR_simple(s,a,xt,alpha); %unit:K/dec
    mod(i).trend(m,:,:)=x.trend;
    mod(i).mean (m,:,:)=x.mean;
  end
end
%save the computed results%%%%%%%%%%%%%%%%%%%%%%%
clear v; v.mod=mod; v.obs=obs; v.alpha=alpha; v.s=vm(1).s; 
tpath='/work/miz/mat_spear/';
fn=strcat('spear_sst_trend_',num2str(y1),'_',num2str(y2),'.mat');
fn=strcat(tpath,fn); fn
save(fn,'v','-v7.3');
return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load the results for plotting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_spear/';
y1=1979; y2=2020; %y1=2021; y2=2070;
fn=strcat('spear_sst_trend_',num2str(y1),'_',num2str(y2),'.mat');
fn=strcat(tpath,fn); load(fn);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fig 1: Seasonal variation of SST trend%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ice_th=0.1; land_th=0.1;
s=v.s; aa=s.aa; lm=s.lm>land_th; lon=s.lon; lat=s.lat; 
obs=v.obs.hadisst.trend; obs_ice=v.obs.hadisst.ice_clm;
%choose model ensemble mean (i=31) or an individual member (i=1-30)
%plotting the trend for each month and ANN, DJF and JJA
i=31; mod=v.mod(i).trend; mod_ice=v.mod(i).ice_clm;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=strcat('sst_trend_all_mon_',num2str(y1),'_',num2str(y2));
p.do_norm=0; p.mod_name='spear'; %p.mod_name='hadisst';
if p.do_norm
  p.unit='K/K'; p.vname=strcat(a,'_norm'); cmin=-1.5; cmax=1.5; %normalization
else
  p.unit='K/dec'; p.vname=a; cmin=-0.6; cmax=0.6; %no normalization
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.xsize=1000; p.ysize=1000; 
p.x1=0; p.x2=360; p.y1=-90; p.y2=90;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, p.xsize, p.ysize]*1.2; fsize=6; 
handle=figure('Position',pms,'visible','on'); 
row=5; col=3; cmap=bluewhitered_miz(256); co='k';
mn={'JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC','ANN','DJF','JJA'};
for i=1:15
  b=squeeze(obs(i,:,:)); bi=squeeze(obs_ice(i,:,:));
  im=(bi>ice_th); id=lm|im; id=~id; aa0=aa(id)/mean(aa(id)); %open ocean area-weighting
  b0=mean(b(id).*aa0); idb=id;
  a=squeeze(mod(i,:,:)); ai=squeeze(mod_ice(i,:,:));
  if strcmp(p.mod_name,'hadisst'); a=b; ai=bi; end; %override model with obs for plotting obs
  im=(ai>ice_th); id=lm|im; id=~id; aa0=aa(id)/mean(aa(id)); %open ocean area-weighting
  a0=mean(a(id).*aa0); ida=id;
  if p.do_norm; a=(a-a0)/a0; b=(b-b0)/b0; end;
  subplot(row, col, i); a(~ida)=NaN; colormap(cmap);
  pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
  contour(lon,lat,lm,1,co); 
  set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
  id=ida & idb; c=corrcoef(a(id),b(id));
  titl=sprintf('%s (avg=%4.3f%s; r=%4.3f)',mn{i},a0,p.unit,c(1,2));
  title(titl,'FontSize',fsize);
end
a=p.vname; a=strrep(a,'_',' '); sgtitle(upper(a));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cb = colorbar('FontSize',fsize+4,'Location','southoutside');
set(cb, 'Position', [.165 .04 .7 .02]); caxis([cmin, cmax+0.001]); 
colormap(cmap);
cb.Label.String = p.unit; pos=get(cb,'Position')
cb.Label.Position = [pos(1)-0.165 pos(2)+1.75]; 
cb.Label.Rotation = 0;
vname = p.vname; mod_name=p.mod_name; 
visfig='off'; figpath='./fig_cre/';
printnew(visfig,figpath,mod_name,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Fig 2: plot trend for each member of SPEAR LE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ice_th=0.1; land_th=0.1;
s=v.s; aa=s.aa; lm=s.lm>land_th; lon=s.lon; lat=s.lat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.xsize=1100; p.ysize=1000; 
p.x1=0; p. x2=360; p.y1=-90; p.y2=90;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, p.xsize, p.ysize]*1.2; fsize=6; 
handle=figure('Position',pms,'visible','on'); 
row=7; col=5; cmap=bluewhitered_miz(256); co='k';
p.do_norm=0;
a=strcat('sst_trend_ann_all_member_',num2str(y1),'_',num2str(y2));
if p.do_norm
  p.unit='K/K'; p.vname=strcat(a,'_norm'); cmin=-1.5; cmax=1.5; %normalization
else
  p.unit='K/dec'; p.vname=a; cmin=-0.6; cmax=0.6; %no normalization
end
p.mod_name='spear'; %p.mod_name='hadisst';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%mod_num=30; %idm=v.idm; id=v.id; %aa0=aa(id)/mean(aa(id));
m=13;
a=v.obs.hadisst; b=squeeze(a.trend(m,:,:)); bi=squeeze(a.ice_clm(m,:,:));
im=(bi>ice_th); id=lm|im; id=~id; aa0=aa(id)/mean(aa(id)); %open ocean area-weighting
b0=mean(b(id).*aa0); idb=id;
i=1; %HadISST%%%%%%%%%%%%%%%
a=b; a0=b0; ida=idb; 
if p.do_norm; a=(a-a0)/a0; b=(b-b0)/b0; end
subplot(row, col, i); colormap(cmap); a(~id)=NaN;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co);
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
id=ida&idb; c=corrcoef(a(id),b(id));
titl=sprintf('HadISST (avg=%4.2fK; r=%4.2f)',a0,c(1,2));
title(titl,'FontSize',fsize);
i=2; %ERSST%%%%%%%%%%%%%%%%%
x=v.obs.ersst; a=squeeze(x.trend(m,:,:)); ai=squeeze(x.ice_clm(m,:,:));
im=(ai>ice_th); id=lm|im|isnan(a); id=~id; aa0=aa(id)/mean(aa(id)); %open ocean area-weighting
a0=mean(a(id).*aa0); ida=id; if p.do_norm; a=(a-a0)/a0; end
subplot(row, col, i); colormap(cmap); a(~id)=NaN;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co);
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
id=ida&idb; c=corrcoef(a(id),b(id));
titl=sprintf('ERSST (avg=%4.2fK; r=%4.2f)',a0,c(1,2));
title(titl,'FontSize',fsize);
i=3; %COBESST%%%%%%%%%%%%%%%%%
x=v.obs.cobesst; a=squeeze(x.trend(m,:,:)); ai=squeeze(x.ice_clm(m,:,:));
im=(ai>ice_th); id=lm|im|isnan(a); id=~id; aa0=aa(id)/mean(aa(id)); %open ocean area-weighting
a0=mean(a(id).*aa0); ida=id; if p.do_norm; a=(a-a0)/a0; end
subplot(row, col, i); colormap(cmap); a(~id)=NaN;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co);
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
id=ida&idb; c=corrcoef(a(id),b(id));
titl=sprintf('ERSST (avg=%4.2fK; r=%4.2f)',a0,c(1,2));
title(titl,'FontSize',fsize);
i=4; %COBE2SST%%%%%%%%%%%%%%%%%
x=v.obs.cobe2sst; a=squeeze(x.trend(m,:,:)); ai=squeeze(x.ice_clm(m,:,:));
im=(ai>ice_th); id=lm|im|isnan(a); id=~id; aa0=aa(id)/mean(aa(id)); %open ocean area-weighting
a0=mean(a(id).*aa0); ida=id; if p.do_norm; a=(a-a0)/a0; end
subplot(row, col, i); colormap(cmap); a(~id)=NaN;
pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
contour(lon,lat,lm,1,co);
set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
id=ida&idb; c=corrcoef(a(id),b(id));
titl=sprintf('ERSST (avg=%4.2fK; r=%4.2f)',a0,c(1,2));
title(titl,'FontSize',fsize);
%i=5; SPEAR LE ensemble mean%%%
for i = 1:31
  a=squeeze(v.mod(i).trend(m,:,:)); ai=squeeze(v.mod(i).ice_clm(m,:,:));
  im=(ai>ice_th); id=lm|im|isnan(a); id=~id; aa0=aa(id)/mean(aa(id)); %open ocean area-weighting
  a0=mean(a(id).*aa0); ida=id;
  if p.do_norm; a=(a-a0)/a0; end;
  if (i==31); i=0; end;
  subplot(row, col, i+5); colormap(cmap); a(~id)=NaN;
  pcolor(lon,lat,a); hold on; shading flat; caxis([cmin, cmax]);
  contour(lon,lat,lm,1,co);
  set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
  id=ida&idb; c=corrcoef(a(id),b(id));
  titl=sprintf('M%02d (avg=%4.2fK; r=%4.2f)',i,a0,c(1,2));
  title(titl,'FontSize',fsize);
end
titl=sprintf('ENS mean (avg=%4.2fK; r=%4.2f)',a0,c(1,2));
title(titl,'FontSize',fsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=p.vname; a=strrep(a,'_',' '); sgtitle(upper(a));
cb = colorbar('FontSize',fsize+4,'Location','southoutside');
set(cb, 'Position', [.165 .04 .7 .02]); caxis([cmin, cmax+0.001]); 
colormap(cmap); 
cb.Label.String = p.unit; pos=get(cb,'Position')
cb.Label.Position = [pos(1)-0.165 pos(2)+1.75]; 
cb.Label.Rotation = 0;
vname = p.vname; mod_name=p.mod_name; 
visfig='off'; figpath='./fig_cre/';
printnew(visfig,figpath,mod_name,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
