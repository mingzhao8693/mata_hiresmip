function hatch_mask(x,y,mask,varargin)
% Draw diagonal hatch lines over mask==1
% x,y: meshgrid longitude/latitude
% mask: 1 for hatching, 0 otherwise

p = inputParser;
addParameter(p,'Spacing',4);
addParameter(p,'Color',[0.3 0.3 0.3]);
addParameter(p,'LineWidth',0.4);
parse(p,varargin{:});

spacing = p.Results.Spacing;
color   = p.Results.Color;
lw      = p.Results.LineWidth;

lon = x(1,:);
lat = y(:,1);

% Interpolate mask onto a finer grid
lonfine = linspace(min(lon),max(lon),4*numel(lon));
latfine = linspace(min(lat),max(lat),4*numel(lat));
[xf,yf] = meshgrid(lonfine,latfine);

mf = interp2(x,y,double(mask),xf,yf,'nearest',0);

% Draw diagonal lines y = x + c
xmin = min(lon); xmax = max(lon);
ymin = min(lat); ymax = max(lat);

for c = (ymin-xmax):spacing:(ymax-xmin)
    xv = linspace(xmin,xmax,2000);
    yv = xv + c;

    inside = yv>=ymin & yv<=ymax;
    xv = xv(inside);
    yv = yv(inside);

    if isempty(xv), continue; end

    mv = interp2(xf,yf,mf,xv,yv,'nearest',0);
    xv(mv<0.5) = NaN;
    yv(mv<0.5) = NaN;

    plot(xv,yv,'Color',color,'LineWidth',lw);
end
end
