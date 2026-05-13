function [a,v]=do_interp(a,g,v)

if g.opt==1;
  'interp to lower resolution (c192)...'
  a=interp_grid(a,g.lonx,g.latx,g.lon,g.lat,1);
  v.nlat=g.nlat;
  v.nlon=g.nlon;
end

return
