function sst=get_sst_indices_new(o,a,rg,obs)
if mean(a(~isnan(a)))>100; a=a-273.15; end;
sst.wpac=get_regmean(a,rg.latlon_wpac,o,1,0);
sst.epac=get_regmean(a,rg.latlon_epac,o,1,0);
sst.nhep=get_regmean(a,rg.latlon_nhep,o,1,0);
sst.shep=get_regmean(a,rg.latlon_shep,o,1,0);
sst.equa=get_regmean(a,rg.latlon_equa,o,1,0);
sst.ipwp=get_regmean(a,rg.latlon_ipwp,o,1,0);
sst.trop=get_regmean(a,rg.latlon_trop,o,1,0);
sst.so  =get_regmean(a,rg.latlon_so,  o,1,0);
sst.glob=get_regmean(a,rg.latlon_glob,o,1,0);

sst.wme =sst.wpac-sst.epac;
sst.pme =(sst.shep+sst.nhep)/2 - sst.equa; 
sst.pe  =0; 
sst.we  =0; 
sst.rat_ipwp1=sst.ipwp./sst.trop;
sst.rat_ipwp2=sst.ipwp./sst.glob;
sst.rat_so1  =sst.so  ./sst.trop;
sst.rat_so2  =sst.so  ./sst.glob;

sst.we_ts  =0;
sst.pe_ts  =0;
sst.so_ts  =0;
sst.ipwp_ts=0;
sst.trop_ts=0;
sst.glob_ts=0;

if exist('obs')
  a(rg.idm_all==1)=NaN;
  idx=~(isnan(a)|isnan(obs)); 
  x=a(idx); y=obs(idx); c=corrcoef(x,y); sst.corr_glob=c(1,2);
  idx=idx & rg.id;
  x=a(idx); y=obs(idx); c=corrcoef(x,y); sst.corr_tpac=c(1,2);
else
  sst.corr_glob=1;
  sst.corr_tpac=1;
end
return

