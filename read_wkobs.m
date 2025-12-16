function v=read_wkobs
tpath ='/archive/Ming.Zhao/obs_for_am4p0_paper/';
%fn='WK_stps_1979-2005.dailynormalfullyear.p.nc';%1979-2005
%v.olr_old = load_wk(fn);

fn='NOAA_OLR/NOAA_OLR_gtrop_olr_WK.nc';%1979-2012
fn=strcat(tpath,fn)
v.olr = load_wk(fn);

fn='GPCP/GPCP_gtrop_precip_WK.nc';%1997-2014
fn=strcat(tpath,fn)
v.pcp = load_wk(fn);

fn='ERA_interim/ERA_interim_gtrop_u200_WK.nc';%1981-2014
fn=strcat(tpath,fn)
v.u200 = load_wk(fn);

fn='ERA_interim/ERA_interim_gtrop_u850_WK.nc';%1981-2014
fn=strcat(tpath,fn)
v.u850 = load_wk(fn);

fn='EqWaveDispersion.nc';
f = netcdf(fn, 'nowrite');
d.xx = f{'x'}(:); d.xx=flipud(d.xx); d.zz = f{'z'}(:);
d.AfreqMRG         =f{'AfreqMRG'}(:,:);
d.AfreqKelvinRossby=f{'AfreqKelvinRossby'}(:,:);
d.AfreqIG_n1       =f{'AfreqIG_n1'}(:,:);
d.AfreqIG_n2       =f{'AfreqIG_n2'}(:,:); close(f);

v.d=d;
return

%%%%%%%%
cmin=0.8; cmax=2.0;
zbin=[cmin:(cmax-cmin)/20:cmax]; 
x=v.x; y=v.y; z=(v.var_sym_filt)';
%figure; pcolor(x,y,z); shading flat; colorbar;
figure; contourf(x,y,z,zbin); shading flat; colorbar;
axis([-15 15 0 0.5]); caxis([cmin cmax]);
%%%%%%%%

%%%%%%%%
cmin=-1.4; cmax=1.6;
zbin=[cmin:(cmax-cmin)/30:cmax]; 
x=v.x; y=v.y; z=log(v.var_tot);
figure; contourf(x,y,z,zbin); shading flat; colorbar;
axis([-15 15 0 0.5]); caxis([cmin cmax]);
%%%%%%%%
%%%%%%%%
cmin=-1.5; cmax=1.5;
zbin=[cmin:(cmax-cmin)/20:cmax]; 
x=v.x; y=v.y; z=log(v.var_sym0)./log(v.var_tot);
figure; contourf(x,y,z,zbin); shading flat; colorbar;
axis([-15 15 0 0.5]); caxis([cmin cmax]);
%%%%%%%%

x=v.x; y=v.y; z=v.var_sym_filt; 
figure; contourf(x,y,z); colorbar;

fn=strcat(fnout,'.mat'); save(fn,'v'); 

figure; contourf(log(v.var_sym0));

figure; contourf(v.y,v.x,log(v.var_sym0));

figure; contourf(v.y,v.x,log(v.var_tot))
