function a = miz_setmin(a,thresh)
% set a minimum value for a
  idx = a < thresh; %anything smaller than thresh
  a(idx) = thresh;
  return
