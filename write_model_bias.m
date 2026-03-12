function [v]=write_model_bias(v,fnout)

%fnout=strcat(tpath,expn,'/',expn,'_daily_climo_mod_bias_f30.nc')
'write netcdf file...'
disp(fnout);

nt=365; nlat=v.nlat; nlon=v.nlon; lat=v.lat; lon=v.lon;
cl=8; form='netcdf4'; time=[1:1:nt];
nccreate(fnout,'time','Dimensions',{'time' Inf},'Format',form);
nccreate(fnout,'lat', 'Dimensions',{'lat' nlat},'Format',form);
nccreate(fnout,'lon', 'Dimensions',{'lon' nlon},'Format',form);

nccreate(fnout,'pr_c192am4',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'ps_c192am4',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'ts_c192am4',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tas_c192am4',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tasmax_c192am4',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vps_c192am4',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vp_c192am4',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vpd_c192am4',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'rh_c192am4',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'qv_c192am4',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'uas_c192am4',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vas_c192am4',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'wsd_c192am4',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

nccreate(fnout,'pr_bias_gpcp13',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias_gpcp13_f', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias_gpcp32',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias_gpcp32_f', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias_gpm',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias_gpm_f',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias_mswep',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias_mswep_f',  'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias_era5',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_bias_era5_f',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

nccreate(fnout,'ps_bias',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'ps_bias_f',        'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'ts_bias',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'ts_bias_f',        'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tas_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tas_bias_f',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tasmax_bias',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tasmax_bias_f',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vps_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vps_bias_f',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vp_bias',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vp_bias_f',        'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vpd_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vpd_bias_f',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'rh_bias',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'rh_bias_f',        'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'qv_bias',          'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'qv_bias_f',        'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'uas_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'uas_bias_f',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vas_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'vas_bias_f',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'wsd_bias',         'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'wsd_bias_f',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

ncwrite(fnout,'time', time(:));
ncwrite(fnout,'lat',  lat);
ncwrite(fnout,'lon',  lon); x=v.c192am4;;

ncwrite(fnout,'pr_c192am4',         permute(v.c192am4.pr.daily_climo.daily,     [3 2 1]))
ncwrite(fnout,'ps_c192am4',         permute(v.c192am4.ps.daily_climo.daily,     [3 2 1]))
ncwrite(fnout,'ts_c192am4',         permute(v.c192am4.ts.daily_climo.daily,     [3 2 1]))
ncwrite(fnout,'tas_c192am4',        permute(v.c192am4.tas.daily_climo.daily,    [3 2 1]))
ncwrite(fnout,'tasmax_c192am4',     permute(v.c192am4.tasmax.daily_climo.daily, [3 2 1]))
ncwrite(fnout,'vps_c192am4',        permute(v.c192am4.vps.daily_climo.daily,    [3 2 1]))
ncwrite(fnout,'vp_c192am4',         permute(v.c192am4.vp.daily_climo.daily,     [3 2 1]))
ncwrite(fnout,'vpd_c192am4',        permute(v.c192am4.vpd.daily_climo.daily,    [3 2 1]))
ncwrite(fnout,'rh_c192am4',         permute(v.c192am4.rh.daily_climo.daily,     [3 2 1]))
ncwrite(fnout,'qv_c192am4',         permute(v.c192am4.qv.daily_climo.daily,     [3 2 1]))
ncwrite(fnout,'uas_c192am4',        permute(v.c192am4.uas.daily_climo.daily,    [3 2 1]))
ncwrite(fnout,'vas_c192am4',        permute(v.c192am4.vas.daily_climo.daily,    [3 2 1]))
ncwrite(fnout,'wsd_c192am4',        permute(v.c192am4.wsd.daily_climo.daily,    [3 2 1]))

ncwrite(fnout,'pr_bias_gpcp13',     permute(v.c192am4.pr.bias.daily.gpcp13,     [3 2 1]))
ncwrite(fnout,'pr_bias_gpcp13_f',   permute(v.c192am4.pr.bias.daily.gpcp13_f,   [3 2 1]))
ncwrite(fnout,'pr_bias_gpcp32',     permute(v.c192am4.pr.bias.daily.gpcp32,     [3 2 1]))
ncwrite(fnout,'pr_bias_gpcp32_f',   permute(v.c192am4.pr.bias.daily.gpcp32_f,   [3 2 1]))
ncwrite(fnout,'pr_bias_gpm',        permute(v.c192am4.pr.bias.daily.gpm,        [3 2 1]))
ncwrite(fnout,'pr_bias_gpm_f',      permute(v.c192am4.pr.bias.daily.gpm_f,      [3 2 1]))
ncwrite(fnout,'pr_bias_mswep',      permute(v.c192am4.pr.bias.daily.mswep,      [3 2 1]))
ncwrite(fnout,'pr_bias_mswep_f',    permute(v.c192am4.pr.bias.daily.mswep_f,    [3 2 1]))
ncwrite(fnout,'pr_bias_era5',       permute(v.c192am4.pr.bias.daily.era5,       [3 2 1]))
ncwrite(fnout,'pr_bias_era5_f',     permute(v.c192am4.pr.bias.daily.era5_f,     [3 2 1]))

ncwrite(fnout,'ps_bias',            permute(v.c192am4.ps.bias.daily,            [3 2 1]))
ncwrite(fnout,'ps_bias_f',          permute(v.c192am4.ps.bias.daily_f,          [3 2 1]))
ncwrite(fnout,'ts_bias',            permute(v.c192am4.ts.bias.daily,            [3 2 1]))
ncwrite(fnout,'ts_bias_f',          permute(v.c192am4.ts.bias.daily_f,          [3 2 1]))
ncwrite(fnout,'tas_bias',           permute(v.c192am4.tas.bias.daily,           [3 2 1]))
ncwrite(fnout,'tas_bias_f',         permute(v.c192am4.tas.bias.daily_f,         [3 2 1]))
ncwrite(fnout,'tasmax_bias',        permute(v.c192am4.tasmax.bias.daily,        [3 2 1]))
ncwrite(fnout,'tasmax_bias_f',      permute(v.c192am4.tasmax.bias.daily_f,      [3 2 1]))
ncwrite(fnout,'vps_bias',           permute(v.c192am4.vps.bias.daily,           [3 2 1]))
ncwrite(fnout,'vps_bias_f',         permute(v.c192am4.vps.bias.daily_f,         [3 2 1]))
ncwrite(fnout,'vp_bias',            permute(v.c192am4.vp.bias.daily,            [3 2 1]))
ncwrite(fnout,'vp_bias_f',          permute(v.c192am4.vp.bias.daily_f,          [3 2 1]))
ncwrite(fnout,'vpd_bias',           permute(v.c192am4.vpd.bias.daily,           [3 2 1]))
ncwrite(fnout,'vpd_bias_f',         permute(v.c192am4.vpd.bias.daily_f,         [3 2 1]))
ncwrite(fnout,'rh_bias',            permute(v.c192am4.rh.bias.daily,            [3 2 1]))
ncwrite(fnout,'rh_bias_f',          permute(v.c192am4.rh.bias.daily_f,          [3 2 1]))
ncwrite(fnout,'qv_bias',            permute(v.c192am4.qv.bias.daily,            [3 2 1]))
ncwrite(fnout,'qv_bias_f',          permute(v.c192am4.qv.bias.daily_f,          [3 2 1]))
ncwrite(fnout,'uas_bias',           permute(v.c192am4.uas.bias.daily,           [3 2 1]))
ncwrite(fnout,'uas_bias_f',         permute(v.c192am4.uas.bias.daily_f,         [3 2 1]))
ncwrite(fnout,'vas_bias',           permute(v.c192am4.vas.bias.daily,           [3 2 1]))
ncwrite(fnout,'vas_bias_f',         permute(v.c192am4.vas.bias.daily_f,         [3 2 1]))
ncwrite(fnout,'wsd_bias',           permute(v.c192am4.wsd.bias.daily,           [3 2 1]))
ncwrite(fnout,'wsd_bias_f',         permute(v.c192am4.wsd.bias.daily_f,         [3 2 1]))
str=strcat('days since 1979-01-01 00:00:00'); 
ncwriteatt(fnout,'time','units',str);
