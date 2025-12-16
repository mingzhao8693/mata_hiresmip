function cmap2=mizcolormap_bw(x)
%x = [0 0.01 0.05 0.1 0.5 1:30];
%x = [0 0.01:0.02:0.08 0.1:0.05:1];
N = length(x);
clim = [min(x) max(x)];
dx = min(diff(x));
y = clim(1):dx:clim(2);

for k=1:N-1
  y(y>x(k) & y<=x(k+1)) = x(k+1); 
end

cmap = bluewhitered_miz(N);
cmap2 = [...
interp1(x(:),cmap(:,1),y(:)) ...
interp1(x(:),cmap(:,2),y(:)) ...
interp1(x(:),cmap(:,3),y(:)) ...
];
colormap(cmap2)
return
