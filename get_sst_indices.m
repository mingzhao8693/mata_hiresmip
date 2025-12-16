function sst=get_sst_indices(o,a,rg,obs)
%if mean(a(~isnan(a)))>100; a=a-273.15; end;
sst.wpac=get_regmean(a,rg.latlon_wpac,o,1,0);%ocean only
sst.epac=get_regmean(a,rg.latlon_epac,o,1,0);%ocean only
sst.nhep=get_regmean(a,rg.latlon_nhep,o,1,0);%ocean only
sst.shep=get_regmean(a,rg.latlon_shep,o,1,0);%ocean only
sst.equa=get_regmean(a,rg.latlon_equa,o,1,0);%ocean only
sst.ipwp=get_regmean(a,rg.latlon_ipwp,o,1,0);%ocean only
sst.trop=get_regmean(a,rg.latlon_trop,o,1,0);%ocean only
sst.so  =get_regmean(a,rg.latlon_so,  o,1,0);%ocean only
sst.glob=get_regmean(a,rg.latlon_glob,o,1,0);%ocean only
%sst.darw=get_regmean(a,rg.latlon_darw,o,0,0);%all
%sst.tahi=get_regmean(a,rg.latlon_tahi,o,1,0);%ocean only

sst.wme =sst.wpac-sst.epac;
sst.smn =(sst.shep+sst.nhep)/2 - sst.equa; 
sst.ns  =0; 
sst.ew  =0; 
sst.rat_ipwp1=(sst.ipwp-273.15)./(sst.trop-273.15);
sst.rat_ipwp2=(sst.ipwp-273.15)./(sst.glob-273.15);
sst.rat_so1  =(sst.so  -273.15)./(sst.trop-273.15);
sst.rat_so2  =(sst.so  -273.15)./(sst.glob-273.15);
%sst.soi      =sst.darw -sst.tahi;

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

