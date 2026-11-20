function v=interp_var(var,s)
  v=var; disp('interp_var.........................');
  if exist('s','var')
    for k=1:length(var);
      lonx=s.lon; latx =s.lat;
      v(k).a=interp_grid(var.a,lonx,latx,v.lon,v.lat,1);
      v(k).lat=latx;
      v(k).lon=lonx;
    end
  end
  return
