function v=interp_miz(z0,lonx,latx)
  lon=z0.lon; lat=z0.lat; 
  subnames = fieldnames(z0);
  for i=1:length(subnames)
    tmp=z0.(subnames{i});
    if length(size(tmp))==3 & length(tmp(:,1,1)==7)
      a=interp_grid(tmp,lonx,latx,lon,lat,1); %subnames{i}
      v.(subnames{i})=a;
    end
  end
  v.lat=latx; v.lon=lonx; 

  return
