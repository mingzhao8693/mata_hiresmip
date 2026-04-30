function tr=compute_trend_mod(v,o,s,p)
y1=p.y1; y2=p.y2; 
i1=v.t1; i2=v.t2-1; Ym=[i1:i2]'; m1=1; m2=12; alpha=0.8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute surface temperature trend 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%define the period (y1-y2) for SST trend analysis & comparison with obs
i1=find(Ym==y1); i2=find(Ym==y2);
if ~isempty(i1) & ~isempty(i2)
  xt_mod=Ym(i1:i2); findit=1;
else
  i1=1; i2=length(Ym); xt_mod=Ym; findit=0;
end
vmod=v.sfc.tsurf.all(i1:i2,m1:m2,:,:);
imsk=v.sfc.ice.all  (i1:i2,m1:m2,:,:);
ts=compute_gocean_sst_mon(vmod,imsk,s.lm,s.aa);%a=squeeze(mean(vmod,2));
ts.findit=findit; ts.xt_mod=xt_mod;
a=get4season_all(vmod);
tr.tsurf=get_trend_TSR(s,a,xt_mod,alpha);
tr.tsurf.ts=ts;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute surface precip trend 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%define the period (y1-y2) for PCP trend analysis & comparison with obs
i1=find(Ym==y1); i2=find(Ym==y2); 
if ~isempty(i1) & ~isempty(i2)
  xt_mod=Ym(i1:i2); findit=1;
else
  i1=1; i2=length(Ym); xt_mod=Ym; findit=0;
end
vmod=v.sfc.pcp.all(i1:i2,m1:m2,:,:);
imsk=v.sfc.ice.all(i1:i2,m1:m2,:,:);
ts=compute_gmean_mon(vmod,imsk,s.lm,s.aa); %a=squeeze(mean(vmod,2));
ts.findit=findit; ts.xt_mod=xt_mod;
a=get4season_all(vmod);
tr.pcp=get_trend_TSR(s,a,xt_mod,alpha);
tr.pcp.ts=ts;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute sea level pressure trend 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i1=find(Ym==y1); i2=find(Ym==y2); 
if ~isempty(i1) & ~isempty(i2)
  xt_mod=Ym(i1:i2); findit=1;
else
  i1=1; i2=length(Ym); xt_mod=Ym; findit=0;
end
vmod=v.sfc.slp.all(i1:i2,m1:m2,:,:);
imsk=v.sfc.ice.all(i1:i2,m1:m2,:,:);
ts=compute_gmean_mon(vmod,imsk,s.lm,s.aa); %a=squeeze(mean(vmod,2));
ts.findit=findit; ts.xt_mod=xt_mod;
a=get4season_all(vmod);
tr.slp=get_trend_TSR(s,a,xt_mod,alpha);
tr.slp.ts=ts;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute surface air temperature trend
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i1=find(Ym==y1); i2=find(Ym==y2); 
if ~isempty(i1) & ~isempty(i2)
  xt_mod=Ym(i1:i2); findit=1;
else
  i1=1; i2=length(Ym); xt_mod=Ym; findit=0;
end
vmod=v.sfc.tref.all(i1:i2,m1:m2,:,:);
imsk=v.sfc.ice.all (i1:i2,m1:m2,:,:);
ts=compute_gmean_mon(vmod,imsk,s.lm,s.aa); %a=squeeze(mean(vmod,2));
ts.findit=findit; ts.xt_mod=xt_mod;
a=get4season_all(vmod);
tr.tref=get_trend_TSR(s,a,xt_mod,alpha);
tr.tref.ts=ts;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute surface RH trend
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i1=find(Ym==y1); i2=find(Ym==y2);
if ~isempty(i1) & ~isempty(i2)
  xt_mod=Ym(i1:i2); findit=1;
else
  i1=1; i2=length(Ym); xt_mod=Ym; findit=0;
end
vmod=v.sfc.rhref.all(i1:i2,m1:m2,:,:);
imsk=v.sfc.ice.all (i1:i2,m1:m2,:,:);
ts=compute_gmean_mon(vmod,imsk,s.lm,s.aa); %a=squeeze(mean(vmod,2));
ts.findit=findit; ts.xt_mod=xt_mod;
a=get4season_all(vmod);
tr.rhref=get_trend_TSR(s,a,xt_mod,alpha);
tr.rhref.ts=ts;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute surface latent heat flux (evap) trend
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i1=find(Ym==y1); i2=find(Ym==y2); 
if ~isempty(i1) & ~isempty(i2)
  xt_mod=Ym(i1:i2); findit=1;
else
  i1=1; i2=length(Ym); xt_mod=Ym; findit=0;
end
vmod=v.sfc.evap.all(i1:i2,m1:m2,:,:);
imsk=v.sfc.ice.all (i1:i2,m1:m2,:,:);
ts=compute_gmean_mon(vmod,imsk,s.lm,s.aa); %a=squeeze(mean(vmod,2));
ts.findit=findit; ts.xt_mod=xt_mod;
a=get4season_all(vmod);
tr.evap=get_trend_TSR(s,a,xt_mod,alpha);
tr.evap.ts=ts;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute surface sensible heat flux (evap) trend
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i1=find(Ym==y1); i2=find(Ym==y2); 
if ~isempty(i1) & ~isempty(i2)
  xt_mod=Ym(i1:i2); findit=1;
else
  i1=1; i2=length(Ym); xt_mod=Ym; findit=0;
end
vmod=v.sfc.shflx.all(i1:i2,m1:m2,:,:);
imsk=v.sfc.ice.all (i1:i2,m1:m2,:,:);
ts=compute_gmean_mon(vmod,imsk,s.lm,s.aa); %a=squeeze(mean(vmod,2));
ts.findit=findit; ts.xt_mod=xt_mod;
a=get4season_all(vmod);
tr.shflx=get_trend_TSR(s,a,xt_mod,alpha);
tr.shflx.ts=ts;

return




z1=v.skt_mod_1979_2020.trend; c1=-0.5; c2=0.5; vname='tsurf';
z2=v.skt_obs_1979_2020.trend;
pms=[ 0, 0, 500, 1000]*1; row=3; col=1; fsize=24; lw=2; 
handle=figure('Position',pms,'visible','on');
lat=o.lat; lon=o.lon; lm=s.lm0;
subplot(row,col,1); 
pcolor(lon,lat,z1); shading flat; caxis([c1 c2]); hold on;
contour(lon,lat,lm,1,'k'); colorbar; colormap(jet); 
title(strcat('Model (',vname,' unit:K/dec)'));
subplot(row,col,2);
pcolor(lon,lat,z2); shading flat; caxis([c1 c2]); hold on;
contour(lon,lat,lm,1,'k'); colorbar; colormap(jet); 
title(strcat('ERA5 (',vname,')'));
subplot(row,col,3);
pcolor(lon,lat,z1-z2); shading flat; caxis([c1 c2]); hold on;
contour(lon,lat,lm,1,'k'); colorbar; colormap(jet);
title(strcat('Model minus ERA5 (',vname,')'));
visfig='off'; figpath='./fig_cre/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z1=v.tas_mod_1979_2020.trend; c1=-0.5; c2=0.5; vname='tas';
z2=v.tas_obs_1979_2020.trend;
pms=[ 0, 0, 500, 1000]*1; row=3; col=1; fsize=24; lw=2; 
handle=figure('Position',pms,'visible','on');
lat=o.lat; lon=o.lon; lm=s.lm0;
subplot(row,col,1); 
pcolor(lon,lat,z1); shading flat; caxis([c1 c2]); hold on;
contour(lon,lat,lm,1,'k'); colorbar; colormap(jet); 
title(strcat('Model (',vname,' unit:K/dec)'));
subplot(row,col,2);
pcolor(lon,lat,z2); shading flat; caxis([c1 c2]); hold on;
contour(lon,lat,lm,1,'k'); colorbar; colormap(jet); 
title(strcat('ERA5 (',vname,')'));
subplot(row,col,3);
pcolor(lon,lat,z1-z2); shading flat; caxis([c1 c2]); hold on;
contour(lon,lat,lm,1,'k'); colorbar; colormap(jet);
title(strcat('Model minus ERA5 (',vname,')'));
visfig='off'; figpath='./fig_cre/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z1=v.rhref_mod_1979_2020.trend; c1=-2; c2=2; vname='rhref';
z2=v.rhref_obs_1979_2020.trend;
pms=[ 0, 0, 500, 1000]*1; row=3; col=1; fsize=24; lw=2; 
handle=figure('Position',pms,'visible','on');
lat=o.lat; lon=o.lon; lm=s.lm0;
subplot(row,col,1); 
pcolor(lon,lat,z1); shading flat; caxis([c1 c2]); hold on;
contour(lon,lat,lm,1,'k'); colorbar; colormap(jet); 
title(strcat('Model (',vname,' unit:%/dec)'));
subplot(row,col,2);
pcolor(lon,lat,z2); shading flat; caxis([c1 c2]); hold on;
contour(lon,lat,lm,1,'k'); colorbar; colormap(jet); 
title(strcat('ERA5 (',vname,')'));
subplot(row,col,3);
pcolor(lon,lat,z1-z2); shading flat; caxis([c1 c2]); hold on;
contour(lon,lat,lm,1,'k'); colorbar; colormap(jet);
title(strcat('Model minus ERA5 (',vname,')'));
visfig='off'; figpath='./fig_cre/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z1=v.qref_mod_1979_2020.trend*1000; c1=-0.2; c2=0.2; vname='qref';
z2=v.qref_obs_1979_2020.trend*1000;
pms=[ 0, 0, 500, 1000]*1; row=3; col=1; fsize=24; lw=2; 
handle=figure('Position',pms,'visible','on');
lat=o.lat; lon=o.lon; lm=s.lm0; 
subplot(row,col,1); 
pcolor(lon,lat,z1); shading flat; caxis([c1 c2]); hold on;
contour(lon,lat,lm,1,'k'); colorbar; colormap(jet); 
title(strcat('Model (',vname,' unit:g/kg/dec)'));
subplot(row,col,2);
pcolor(lon,lat,z2); shading flat; caxis([c1 c2]); hold on;
contour(lon,lat,lm,1,'k'); colorbar; colormap(jet); 
title(strcat('ERA5 (',vname,')'));
subplot(row,col,3);
pcolor(lon,lat,z1-z2); shading flat; caxis([c1 c2]); hold on;
contour(lon,lat,lm,1,'k'); colorbar; colormap(jet);
title(strcat('Model minus ERA5 (',vname,')'));
visfig='off'; figpath='./fig_cre/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z1=v.pcp_mod_1979_2020.trend; c1=-0.2; c2=0.2; vname='precip';
z2=v.pcp_obs_1979_2020.trend;
pms=[ 0, 0, 500, 1000]*1; row=3; col=1; fsize=24; lw=2; 
handle=figure('Position',pms,'visible','on');
lat=o.lat; lon=o.lon; lm=s.lm0; 
subplot(row,col,1); 
pcolor(lon,lat,z1); shading flat; caxis([c1 c2]); hold on;
contour(lon,lat,lm,1,'k'); colorbar; colormap(jet); 
title(strcat('Model (',vname,' unit:mm/day/dec)'));
subplot(row,col,2);
pcolor(lon,lat,z2); shading flat; caxis([c1 c2]); hold on;
contour(lon,lat,lm,1,'k'); colorbar; colormap(jet); 
title(strcat('MSWEP (',vname,')'));
subplot(row,col,3);
pcolor(lon,lat,z1-z2); shading flat; caxis([c1 c2]); hold on;
contour(lon,lat,lm,1,'k'); colorbar; colormap(jet);
title(strcat('Model minus MSWEP (',vname,')'));
visfig='off'; figpath='./fig_cre/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure; pcolor(v.rhref_mod_1979_2020.trend-v.rhref_obs_1979_2020.trend); shading flat; colorbar; colormap(jet); caxis([-3 3]); hold on; contour(s.lm0,1,'k');

%figure; pcolor(v.vpref_mod_1979_2020.trend-v.pcp_obs_1979_2020.trend); shading flat; colorbar; colormap(jet); caxis([-.2 .2]); hold on; contour(s.lm0,1,'k');
%figure; pcolor(v.tref_mod_1979_2020.trend); shading flat; colorbar; colormap(jet); caxis([-.2 .2]); hold on; contour(s.lm0,1,'k');
%figure; pcolor(v.pcp_mod_1979_2020.trend-v.pcp_obs_1979_2020.trend); shading flat; colorbar; colormap(jet); caxis([-.2 .2]); hold on; contour(s.lm0,1,'k');
