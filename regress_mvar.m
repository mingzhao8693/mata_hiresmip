function z=regress_mvar(o,nlat,nlon,ws)
%latlon=[0 360 -90 90];region='global';mod='c96';myr=5; ws=5;
%o=readobs(latlon,region,'c48');
%fn=strcat('/work/miz/mat_cm4/obs_',region,'_to_c48.mat'); load(fn);
%below contain array(nyr,nmon,lat,lon)
%x=o.sfc.pcp_nino3; ano.pcp_nino3=getanom(x);
x=o.sfc.sst_nino3; ano.sst_nino3=getanom(x);
x=o.sfc.tsurf;     ano.tsurf =getanom(x);
x=o.sfc.tref;      ano.tref  =getanom(x);
x=o.sfc.pcp;       ano.pcp   =getanom(x);
x=o.sfc.evap;      ano.evap  =getanom(x);
x=o.atm.w500;      ano.w500  =getanom(x);
x=o.atm.w700;      ano.w700  =getanom(x);
x=o.toa.lwcf;      ano.lwcf  =getanom(x);
x=o.toa.swcf;      ano.swcf  =getanom(x);
x=o.toa.ttcf;      ano.ttcf  =getanom(x); 
x=o.toa.netrad;    ano.netrad=getanom(x); 
x=o.toa.lwnet;     ano.lwnet =getanom(x); 
x=o.toa.swnet;     ano.swnet =getanom(x); 
x=o.toa.lwnet_clr; ano.lwnetclr=getanom(x); 
x=o.toa.swnet_clr; ano.swnetclr=getanom(x); 

y=ano.tsurf.all; nlat=length(y(1,1,:,1)); nlon=length(y(1,1,1,:));
for j=1:nlat
  for i=1:nlon
    ano.tsurf_r.all(:,:,j,i)=ano.tsurf.all(:,:,j,i)-ano.tsurf.avg(:,:); 
    ano.tref_r.all (:,:,i,i)=ano.tref.all (:,:,j,i)-ano.tref.avg(:,:); 
  end
end

%response of netrad/ttcf/swcf/lwcf/pcp to TUSRF/SST
x=ano.tsurf.all;
y=ano.netrad.all; z.netrad_vs_tsurf=regress_yx(y,x,nlat,nlon,ws);
y=ano.ttcf.all;   z.ttcf_vs_tsurf  =regress_yx(y,x,nlat,nlon,ws);
y=ano.swcf.all;   z.swcf_vs_tsurf  =regress_yx(y,x,nlat,nlon,ws);
y=ano.lwcf.all;   z.lwcf_vs_tsurf  =regress_yx(y,x,nlat,nlon,ws);
y=ano.pcp.all;    z.pcp_vs_tsurf   =regress_yx(y,x,nlat,nlon,ws);

%response of netrad/ttcf/swcf/lwcf/pcp to relative TUSRF/SST
x=ano.tsurf_r.all; 
y=ano.netrad.all; z.netrad_vs_tsurfr=regress_yx(y,x,nlat,nlon,ws);
y=ano.ttcf.all;   z.ttcf_vs_tsurfr  =regress_yx(y,x,nlat,nlon,ws);
y=ano.swcf.all;   z.swcf_vs_tsurfr  =regress_yx(y,x,nlat,nlon,ws);
y=ano.lwcf.all;   z.lwcf_vs_tsurfr  =regress_yx(y,x,nlat,nlon,ws);
y=ano.swnet.all;  z.swnet_vs_tsurfr =regress_yx(y,x,nlat,nlon,ws);
y=ano.lwnet.all;  z.lwnet_vs_tsurfr =regress_yx(y,x,nlat,nlon,ws);
y=ano.swnetclr.all;  z.swnetclr_vs_tsurfr =regress_yx(y,x,nlat,nlon,ws);
y=ano.lwnetclr.all;  z.lwnetclr_vs_tsurfr =regress_yx(y,x,nlat,nlon,ws);
y=ano.pcp.all;    z.pcp_vs_tsurfr   =regress_yx(y,x,nlat,nlon,ws);

%global TSURF response to netradtoa/ttcf/swcf/lwcf
y=ano.tsurf.avg; 
x=ano.netrad.all; z.tsurfg_vs_netrad=regress_yx(y,x,nlat,nlon,ws);
x=ano.ttcf.all;   z.tsurfg_vs_ttcf  =regress_yx(y,x,nlat,nlon,ws);
x=ano.swcf.all;   z.tsurfg_vs_swcf  =regress_yx(y,x,nlat,nlon,ws);
x=ano.lwcf.all;   z.tsurfg_vs_lwcf  =regress_yx(y,x,nlat,nlon,ws);

%global netradtoa response to TSURF/SST/SAT
y=ano.netrad.avg; 
x=ano.tsurf.all;  z.netradg_vs_tsurf=regress_yx(y,x,nlat,nlon,ws);
%x=ano.tref.all;   z.netradg_vs_tref =regress_yx(y,x,nlat,nlon,ws);

%global netradtoa response to relative SST/SAT
y=ano.netrad.avg; 
x=ano.tsurf_r.all;  z.netradg_vs_tsurfr=regress_yx(y,x,nlat,nlon,ws);
%x=ano.tref_r.all;   z.netradg_vs_trefr =regress_yx(y,x,nlat,nlon,ws);

%global TTCF response to TSURF/SST/SAT
y=ano.ttcf.avg; 
x=ano.tsurf.all;  z.ttcfg_vs_tsurf=regress_yx(y,x,nlat,nlon,ws);
%x=ano.tref.all;   z.ttcfg_vs_tref =regress_yx(y,x,nlat,nlon,ws);

%global TTCF response to relative SST/SAT
y=ano.ttcf.avg; 
x=ano.tsurf_r.all;  z.ttcfg_vs_tsurfr=regress_yx(y,x,nlat,nlon,ws);
%x=ano.tref_r.all;   z.ttcfg_vs_trefr =regress_yx(y,x,nlat,nlon,ws);

%global SWCF response to TSURF/SST/SAT
y=ano.swcf.avg; 
x=ano.tsurf.all;  z.swcfg_vs_tsurf=regress_yx(y,x,nlat,nlon,ws);
%x=ano.tref.all;   z.swcfg_vs_tref =regress_yx(y,x,nlat,nlon,ws);

%global SWCF response to relative SST/SAT
y=ano.swcf.avg; 
x=ano.tsurf_r.all;  z.swcfg_vs_tsurfr=regress_yx(y,x,nlat,nlon,ws);
%x=ano.tref_r.all;   z.swcfg_vs_trefr =regress_yx(y,x,nlat,nlon,ws);

%global LWCF response to TSURF/SST/SAT
y=ano.lwcf.avg; 
x=ano.tsurf.all;  z.lwcfg_vs_tsurf=regress_yx(y,x,nlat,nlon,ws);
%x=ano.tref.all;   z.lwcfg_vs_tref =regress_yx(y,x,nlat,nlon,ws);

%global SWCF response to relative SST/SAT
y=ano.lwcf.avg; 
x=ano.tsurf_r.all;  z.lwcfg_vs_tsurfr=regress_yx(y,x,nlat,nlon,ws);
%x=ano.tref_r.all;   z.lwcfg_vs_trefr =regress_yx(y,x,nlat,nlon,ws);

return





var0=getanom0(o.sfc.tsurf.al0);  z.tsurf_g =regress_var0(var0,ano,ws);
var0=getanom0(o.sfc.tref.al0);   z.tref_g  =regress_var0(var0,ano,ws);


lon=o.lon; lat=o.lat;
m=1; x=squeeze(z.netrad_vs_tsurf.corr(m,:,:));
figure; pcolor(x); shading flat; colorbar;

m=1; x=squeeze(z.tsurfg_vs_netrad.corr(m,:,:));
figure; pcolor(lon,lat,x); shading flat; colorbar; caxis([-0.4 0.4]);

m=1; x=squeeze(z.netradg_vs_tsurf.corr(m,:,:));
figure; pcolor(lon,lat,x); shading flat; colorbar; caxis([-0.4 0.4]);

m=1; x=squeeze(z.netradg_vs_tsurfr.corr(m,:,:));
figure; pcolor(lon,lat,x); shading flat; colorbar; caxis([-0.4 0.4]);


m=1; x=squeeze( o.crf.netrad_g.corr.tsurf(m,:,:));
figure; pcolor(lon,lat,x); shading flat; colorbar; caxis([-0.4 0.4]);
