function a = miz_setmax(a,thresh)
% set a minimum value for a
  idx = a > thresh; %anything greater than thresh
  a(idx) = thresh;
  return
