function tr=compute_trend(v,o,s,p)
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
tr.tsurf.mod=get_trend_TSR(s,a,xt_mod,alpha);
tr.tsurf.mod.ts=ts;
%HadISST%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ia=1870; ib=2021; Y=[ia:ib]';
i1=find(Y==y1); i2=find(Y==y2);
if ~isempty(i1) & ~isempty(i2)
  xt_obs=Y(i1:i2); findit=1;
else
  i1=1; i2=ib-ia+1; xt_obs=[ia:ib]; findit=0;
end
vobs=o.sfc.sst_1870_2020.all(i1:i2,m1:m2,:,:);
imsk=o.sfc.ice_1870_2020.all(i1:i2,m1:m2,:,:);
ts=compute_gocean_sst_mon(vobs,imsk,s.lm,s.aa);
ts.findit=findit; ts.xt_obs=xt_obs;
ts.ice=imsk; %a=squeeze(mean(vobs,2));
a=get4season_all(vobs);
tr.sst.hadisst=get_trend_TSR(s,a,xt_obs,alpha);
tr.sst.hadisst.ts=ts;
%ERSSTv5 1870-2020%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ia=1870; ib=2020; Y=[ia:ib]';
i1=find(Y==y1); i2=find(Y==y2);
if ~isempty(i1) & ~isempty(i2)
  xt_obs=Y(i1:i2); findit=1;
else
  i1=1; i2=ib-ia+1; xt_obs=[ia:ib]; findit=0;
end
vobs=o.sfc.ersst_1870_2020.all(i1:i2,m1:m2,:,:);
imsk=(vobs<0);
ts=compute_gocean_sst_mon(vobs,imsk,s.lm,s.aa); %a=squeeze(mean(vobs,2)); 
ts.findit=findit; ts.xt_obs=xt_obs;
a=get4season_all(vobs);
tr.sst.ersst=get_trend_TSR(s,a,xt_obs,alpha);
tr.sst.ersst.ts=ts;
%COBESST% 1891-2020%%%%%%%%%%%%%%%%%%%%%%%%%%%
ia=1891; ib=2020; Y=[ia:ib]';
i1=find(Y==y1); i2=find(Y==y2);
if ~isempty(i1) & ~isempty(i2)
  xt_obs=Y(i1:i2); findit=1;
else
  i1=1; i2=ib-ia+1; xt_obs=[ia:ib]; findit=0;
end
vobs=o.sfc.cobesst_1891_2020.all(i1:i2,m1:m2,:,:);
imsk=(vobs<0);
ts=compute_gocean_sst_mon(vobs,imsk,s.lm,s.aa); %a=squeeze(mean(vobs,2)); 
ts.findit=findit; ts.xt_obs=xt_obs;
a=get4season_all(vobs);
tr.sst.cobesst=get_trend_TSR(s,a,xt_obs,alpha);
tr.sst.cobesst.ts=ts;
%COBE2SST 1850-2019%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=o.sfc.cobe2sst_1850_2019.all; a(end+1,:,:,:)=a(end,:,:,:);
o.sfc.cobe2sst_1850_2020.all=a; %extend one more year to 2020
ia=1850; ib=2020; Y=[ia:ib]';
i1=find(Y==y1); i2=find(Y==y2);
if ~isempty(i1) & ~isempty(i2)
  xt_obs=Y(i1:i2); findit=1;
else
  i1=1; i2=ib-ia+1; xt_obs=[ia:ib]; findit=0;
end
vobs=o.sfc.cobe2sst_1850_2020.all(i1:i2,m1:m2,:,:);
imsk=(vobs<0);
ts=compute_gocean_sst_mon(vobs,imsk,s.lm,s.aa); %a=squeeze(mean(vobs,2)); 
ts.findit=findit; ts.xt_obs=xt_obs;
a=get4season_all(vobs);
tr.sst.cobe2sst=get_trend_TSR(s,a,xt_obs,alpha);
tr.sst.cobe2sst.ts=ts;
%ERA5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ia=1959; ib=2021; Y=[ia:ib]';
i1=find(Y==y1); i2=find(Y==y2); 
if ~isempty(i1) & ~isempty(i2)
  xt_obs=Y(i1:i2); findit=1;
else
  i1=1; i2=ib-ia+1; xt_obs=[ia:ib]; findit=0;
end
vobs=o.sfc.skt_era5.all(i1:i2,m1:m2,:,:);
imsk=(vobs<0);
ts=compute_gocean_sst_mon(vobs,imsk,s.lm,s.aa); %a=squeeze(mean(vobs,2)); 
ts.findit=findit; ts.xt_obs=xt_obs;
a=get4season_all(vobs);
tr.tsurf_obs_1979_2020=get_trend_TSR(s,a,xt_obs,alpha);
tr.tsurf_obs_1979_2020.ts=ts;
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
tr.pcp.mod=get_trend_TSR(s,a,xt_mod,alpha);
tr.pcp.mod.ts=ts;
%GPCPv2.3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ia=1979; ib=2020; Y=[ia:ib]';%GPCPv2.3 precip start and end year
i1=find(Y==y1); i2=find(Y==y2); 
if ~isempty(i1) & ~isempty(i2)
  xt_obs=Y(i1:i2); findit=1;
else
  i1=1; i2=ib-ia+1; xt_obs=[ia:ib]; findit=0;
end
vobs=o.sfc.pcp.all(i1:i2,m1:m2,:,:); %GPCPv2.3
ts=compute_gmean_mon(vobs,imsk,s.lm,s.aa);
ts.findit=findit; ts.xt_obs=xt_obs; %a=squeeze(mean(vobs,2));
a=get4season_all(vobs);
tr.pcp.obs_gpcp=get_trend_TSR(s,a,xt_obs,alpha);
tr.pcp.obs_gpcp.ts=ts;
%MSWEP%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ia=1979; ib=2020; Y=[ia:ib]'; %MSWEP precip start and end year
i1=find(Y==y1); i2=find(Y==y2); 
if ~isempty(i1) & ~isempty(i2)
  xt_obs=Y(i1:i2); findit=1;
else
  i1=1; i2=ib-ia+1; xt_obs=[ia:ib]; findit=0;
end
vobs=o.sfc.pcp_mswep.all(i1:i2,m1:m2,:,:);
ts=compute_gmean_mon(vobs,imsk,s.lm,s.aa);
ts.findit=findit; ts.xt_obs=xt_obs; %a=squeeze(mean(vobs,2));
a=get4season_all(vobs);
tr.pcp.obs_mswep=get_trend_TSR(s,a,xt_obs,alpha);
tr.pcp.obs_mswep.ts=ts;
%GPCC%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ia=1891; ib=2020; Y=[ia:ib]'; %GPCC precip start and end year
i1=find(Y==y1); i2=find(Y==y2); 
if ~isempty(i1) & ~isempty(i2)
  xt_obs=Y(i1:i2); findit=1;
else
  i1=1; i2=ib-ia+1; xt_obs=[ia:ib]; findit=0
end
vobs=o.sfc.pcp_gpcc.all(i1:i2,m1:m2,:,:);
ts=compute_gmean_mon(vobs,imsk,s.lm,s.aa);
ts.findit=findit; ts.xt_obs=xt_obs; %a=squeeze(mean(vobs,2));
a=get4season_all(vobs);
tr.pcp.obs_gpcc=get_trend_TSR(s,a,xt_obs,alpha);
tr.pcp.obs_gpcc.ts=ts;
%ERA5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ia=1940; ib=2023; Y=[ia:ib]'; %ERA5 precip start and end year
i1=find(Y==y1); i2=find(Y==y2); 
if ~isempty(i1) & ~isempty(i2)
  xt_obs=Y(i1:i2); findit=1;
else
  i1=1; i2=ib-ia+1; xt_obs=[ia:ib]; findit=0
end
vobs=o.sfc.pcp_era5.all(i1:i2,m1:m2,:,:);
ts=compute_gmean_mon(vobs,imsk,s.lm,s.aa);
ts.findit=findit; ts.xt_obs=xt_obs; %a=squeeze(mean(vobs,2));
a=get4season_all(vobs);
tr.pcp.obs_era5=get_trend_TSR(s,a,xt_obs,alpha);
tr.pcp.obs_era5.ts=ts;
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
tr.slp.mod=get_trend_TSR(s,a,xt_mod,alpha);
tr.slp.mod.ts=ts;
%ERA5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ia=1959; ib=2021; Y=[ia:ib]';
i1=find(Y==y1); i2=find(Y==y2); 
if ~isempty(i1) & ~isempty(i2)
  xt_obs=Y(i1:i2); findit=1;
else
  i1=1; i2=ib-ia+1; xt_obs=[ia:ib]; findit=0;
end
vobs=o.sfc.slp_era5.all(i1:i2,m1:m2,:,:)*0.01;
ts=compute_gmean_mon(vobs,imsk,s.lm,s.aa); %a=squeeze(mean(vobs,2));
ts.findit=findit; ts.xt_mod=xt_mod;
a=get4season_all(vobs);
tr.slp.obs_era5=get_trend_TSR(s,a,xt_obs,alpha);
tr.slp.obs_era5.ts=ts;
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
tr.tref.mod=get_trend_TSR(s,a,xt_mod,alpha);
tr.tref.mod.ts=ts;
%ERA5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ia=1959; ib=2021; Y=[ia:ib]';
i1=find(Y==y1); i2=find(Y==y2); 
if ~isempty(i1) & ~isempty(i2)
  xt_obs=Y(i1:i2); findit=1;
else
  i1=1; i2=ib-ia+1; xt_obs=[ia:ib]; findit=0;
end
vobs=o.sfc.t2m_era5.all(i1:i2,m1:m2,:,:);
ts=compute_gmean_mon(vobs,imsk,s.lm,s.aa); %a=squeeze(mean(vobs,2));
ts.findit=findit; ts.xt_mod=xt_mod;
a=get4season_all(vobs);
tr.tref.obs_era5=get_trend_TSR(s,a,xt_obs,alpha);
tr.tref.obs_era5.ts=ts;
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
tr.rhref.mod=get_trend_TSR(s,a,xt_mod,alpha);
tr.rhref.mod.ts=ts;
%ERA5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ia=1959; ib=2021; Y=[ia:ib]';
i1=find(Y==y1); i2=find(Y==y2); 
if ~isempty(i1) & ~isempty(i2)
  xt_obs=Y(i1:i2); findit=1;
else
  i1=1; i2=ib-ia+1; xt_obs=[ia:ib]; findit=0;
end
vobs=o.sfc.rh2m_era5.all(i1:i2,m1:m2,:,:)*100;
ts=compute_gmean_mon(vobs,imsk,s.lm,s.aa); %a=squeeze(mean(vobs,2));
ts.findit=findit; ts.xt_mod=xt_mod;
a=get4season_all(vobs);
tr.rhref.obs=get_trend_TSR(s,a,xt_obs,alpha);
tr.rhref.obs.ts=ts;
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
tr.evap.mod=get_trend_TSR(s,a,xt_mod,alpha);
tr.evap.mod.ts=ts;
%ERA5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ia=1959; ib=2021; Y=[ia:ib]';
i1=find(Y==y1); i2=find(Y==y2); 
if ~isempty(i1) & ~isempty(i2)
  xt_obs=Y(i1:i2); findit=1;
else
  i1=1; i2=ib-ia+1; xt_obs=[ia:ib]; findit=0;
end
vobs=o.sfc.mslhf_era5.all(i1:i2,m1:m2,:,:);
ts=compute_gmean_mon(vobs,imsk,s.lm,s.aa); %a=squeeze(mean(vobs,2));
ts.findit=findit; ts.xt_mod=xt_mod;
a=get4season_all(vobs);
tr.evap.obs=get_trend_TSR(s,a,xt_obs,alpha);
tr.evap.obs.ts=ts;
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
tr.shflx.mod=get_trend_TSR(s,a,xt_mod,alpha);
tr.shflx.mod.ts=ts;
%ERA5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ia=1959; ib=2021; Y=[ia:ib]';
i1=find(Y==y1); i2=find(Y==y2);
if ~isempty(i1) & ~isempty(i2)
  xt_obs=Y(i1:i2); findit=1;
else
  i1=1; i2=ib-ia+1; xt_obs=[ia:ib]; findit=0;
end
vobs=o.sfc.mslhf_era5.all(i1:i2,m1:m2,:,:);
ts=compute_gmean_mon(vobs,imsk,s.lm,s.aa); %a=squeeze(mean(vobs,2));
ts.findit=findit; ts.xt_mod=xt_mod;
a=get4season_all(vobs);
tr.shflx.obs=get_trend_TSR(s,a,xt_obs,alpha);
tr.shflx.obs.ts=ts;

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
