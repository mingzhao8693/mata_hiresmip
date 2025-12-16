function v=mjo_gpcp()
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath ='/archive/Ming.Zhao/backup/precip_obs/GPCP/';
expn='gpcp_V1DD_V1p2_daily_19961001_20151031.nc';

fname=strcat(tpath,expn);
latname='LAT'; lonname='LON'; 
latlon_trop=[0 360 -30 30]; ts=93; te=6662; varn='prcp';
s=getaregion(fname,latlon_trop,latname,lonname,ts,te,varn)
s.nday=365; s.nyr=s.nt/s.nday;
s.varb=reshape(s.varb,s.nday,s.nyr,s.nlat,s.nlon);
s.precip=varana(s.varb,s); s.varb=0;

latlon=[0 360 -10 5]; ts=93; te=6662; varn='prcp';
v=getaregion(fname,latlon_trop,latname,lonname,ts,te,varn)
v.nday=365; v.nyr=v.nt/v.nday;
v.varb=reshape(v.varb,v.nday,v.nyr,v.nlat,v.nlon)*86400;
v.io.pcp=lagregress(v.varb,v,0);
v.io.pcp=lagregress(v.varb,v,1);
v.s=s; 

fn=strcat('/work/miz/mat_mjo/gpcp_mjo.mat');fn
save(fn,'v'); %save(fn,'o','-v7.3'); 

return

fn=strcat('/work/miz/mat_mjo/gpcp_mjo.mat'); load(fn); v=o;

figure; pcolor((v.io.pcp.lagcorr.iso_avg)'); shading flat; colorbar; caxis([-0.8 0.8]); 

figure; pcolor((v.io.pcp.lagcorr.org_avg)'); shading flat; colorbar; caxis([-0.8 0.8]); 
