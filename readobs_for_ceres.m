function v=readobs_for_ceres(latlon,region,mod)
latlon=[0 360 -90 90];region='global';mod='c48';
fn=strcat('./atmos.static_',mod,'.nc');
o=readgrid_static(fn,latlon);

tpath='/archive/Ming.Zhao/obs_for_am4p0_paper/';

fn=strcat(tpath,'CRU/monthly/cru_ts_322.1901-2013.tmp.nc')
t1=949; t2=1356;  %for 1980Jan-2013Dec period;
v=read_cru_simple(fn,latlon,t1,t2,o); o.fn.CRU=fn;
o.sfc.tas=v.sfc.tas;

fn1=strcat(tpath,'CERES_EBAF-TOA_Ed2.8_Subset_CLIM01-CLIM12.nc')
fn2=strcat(tpath,'CERES_EBAF-Surface_Ed2.8_Subset_CLIM01-CLIM12.nc')
t1=1; t2=12;  %for 2001Jan-2014Dec period;
v=read_ceres_climo(tpath,fn1,fn2,latlon,t1,t2,o);

tpath='/work/miz/mat_am4p0/'; expn='obs';
fn=strcat(tpath,expn,'_',region,'_to_',mod,'_ceres.mat');
save(fn,'o','-v7.3'); %save(fn,'o');
return

lon=o.lon; lat=o.lat; m=1; x=squeeze(o.trend.tsurf(m,:,:));
figure; pcolor(lon,lat,x);shading flat;colorbar;caxis([-0.05 0.05]);

lon=o.lon; lat=o.lat; m=1; x=squeeze(o.trend.tref(m,:,:));
figure; pcolor(lon,lat,x);shading flat;colorbar;caxis([-0.05 0.05]);

lon=o.lon; lat=o.lat; m=1; x=squeeze(o.trend.pcp(m,:,:));
figure; pcolor(lon,lat,x);shading flat;colorbar;caxis([-0.05 0.05]);
