function F = fabien_colormap(m)

load MyColormaps;

if nargin<1

m = size(get(gcf,'colormap'),1);

end

l=length(mycmap);

alpha=(l-1)/(m-1);

indices=alpha*(1:m)+1-alpha;

%make sure that first indices is 1
indices(1)=1;
indices(end)=l;

r=interp1(1:l,mycmap(:,1),indices);
g=interp1(1:l,mycmap(:,2),indices);
b=interp1(1:l,mycmap(:,3),indices);

F=[r',g',b'];
