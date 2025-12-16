function a=do_ceres_adj(varn, a, adj_opt)
if (adj_opt == 0); return; end;

[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
fn=strcat('/work/miz/mat_hiresmip_cre/obs_global_to_c48_ceres41.mat'); load(fn); 
if strcmp(varn,'toa_lw_all')
  adj0=o.adj.rlut;
elseif strcmp(varn,'toa_lw_clr')
  adj0=o.adj.rlutcs;
elseif strcmp(varn,'toa_sw_all')
  adj0=o.adj.rsut;
elseif strcmp(varn,'toa_sw_clr')
  adj0=o.adj.rsutcs;
elseif strcmp(varn,'toa_solar_all')
  adj0=o.adj.rsdt;
elseif strcmp(varn,'toa_net_all')
  adj0=o.adj.netrad;
elseif strcmp(varn,'toa_net_clr')
  adj0=o.adj.netradcs;
end
varn
mean(adj0)
nyr =length(a(:,1,1))/365;
nlat=length(a(1,:,1));
nlon=length(a(1,1,:));
a=reshape(a,365,nyr,nlat,nlon);
mon=[31 28 31 30 31 30 31 31 30 31 30 31]; ddd=cumsum(mon);
d_beg=[1 ddd+1]; d_end=ddd; tbeg=1; tend=365;
for m=1:12
  t1=d_beg(m); t2=d_end(m); %[t1 t2]
  a(t1:t2,:,:,:)=a(t1:t2,:,:,:)+adj0(m);
end
a=reshape(a,365*nyr,nlat,nlon);
