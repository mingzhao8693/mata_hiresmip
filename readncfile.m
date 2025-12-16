function [v]=readncfile(fn);
  
  meta  = ncinfo(fn);
  for i=1:length(meta.Variables)
    vn = meta.Variables(i).Name;
    v.(vn) = ncread(fn, vn);  
  end
  
  return


