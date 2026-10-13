u(lon,lat,time)
v(lon,lat,time)
nt = size(u,3);

RWS = nan(size(u));

for t = 1:nt

    fprintf('Time %d / %d\n',t,nt);

    [RWS(:,:,t),divchi,zeta,zeta_a,uchi,vchi] = ...
        calc_RWS(u(:,:,t),v(:,:,t),lon,lat);

end
RWS_clim = mean(RWS,3,'omitnan');
RWS_clim
RWS_anom = RWS_period - RWS_climatology;
6-hourly ERA5 u,v
       ↓
relative vorticity
       ↓
divergent wind Vχ
       ↓
instantaneous RWS
       ↓
seasonal/monthly mean RWS
       ↓
RWS anomaly
       ↓
compare with circulation anomaly
