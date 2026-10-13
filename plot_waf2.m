%% ============================================================
% Plot JJA 200-hPa Response z' and Takaya-Nakamura WAF
%
% Input:
%   /work/miz/rws_waf_ray_monthly/ob_pattern/newestbak/waf_JJA.nc
%
% Variables:
%
%   zprime_diff(lat,lon)
%       EXP minus CTL JJA zonal geopotential height perturbation
%       Units: m
%
%   waf_x_response(lat,lon)
%       Response WAF zonal component
%       Units: m2 s-2
%
%   waf_y_response(lat,lon)
%       Response WAF meridional component
%       Units: m2 s-2
%
% =============================================================

clear;
close all;
clc;


%% ============================================================
% USER SETTINGS
% ============================================================

fname = '/work/miz/rws_waf_ray_monthly/ob_pattern/newestbak/waf_JJA.nc';

% ------------------------------------------------------------
% Vector thinning
% ------------------------------------------------------------

nskip = 8;

% ------------------------------------------------------------
% Quiver scaling
%
% Increase qscale -> longer arrows
% Decrease qscale -> shorter arrows
% ------------------------------------------------------------

qscale = 2.0;

% ------------------------------------------------------------
% Reference vector
% ------------------------------------------------------------

ref = 100;                  % m2 s-2

% ------------------------------------------------------------
% zprime contour interval
% ------------------------------------------------------------

zint = 40;                  % m

% ------------------------------------------------------------
% Maximum absolute zprime contour
% ------------------------------------------------------------

zmax = 200;                 % m


%% ============================================================
% READ COORDINATES
% ============================================================

lon = ncread(fname,'lon');
lat = ncread(fname,'lat');


%% ============================================================
% READ RESPONSE WAF
% ============================================================

waf_x = ncread(fname,'waf_x_ctl');
waf_y = ncread(fname,'waf_y_ctl');


%% ============================================================
% READ RESPONSE GEOPOTENTIAL HEIGHT PERTURBATION
%
% zprime_diff = EXP - CTL
% ============================================================

zprime = ncread(fname,'zprime_ctl');


%% ============================================================
% CHECK ORIGINAL MATLAB ARRAY DIMENSIONS
% ============================================================

disp(' ');
disp('Original dimensions returned by ncread:');

disp(['lon:       ',mat2str(size(lon))]);
disp(['lat:       ',mat2str(size(lat))]);

disp(['waf_x:     ',mat2str(size(waf_x))]);
disp(['waf_y:     ',mat2str(size(waf_y))]);
disp(['zprime:    ',mat2str(size(zprime))]);


%% ============================================================
% TRANSPOSE NETCDF FIELDS
%
% NetCDF declaration:
%
%     variable(lat,lon)
%
% MATLAB ncread returns:
%
%     [lon,lat]
%
% Therefore transpose to:
%
%     [lat,lon]
% ============================================================

waf_x  = waf_x';
waf_y  = waf_y';
zprime = zprime';


%% ============================================================
% CHECK TRANSPOSED DIMENSIONS
% ============================================================

disp(' ');
disp('Dimensions after transpose:');

disp(['WAF size:     ',mat2str(size(waf_x))]);
disp(['zprime size:  ',mat2str(size(zprime))]);


%% ============================================================
% CREATE 2-D LONGITUDE/LATITUDE GRID
% ============================================================

[Lon,Lat] = meshgrid(lon,lat);


%% ============================================================
% SELECT NORTHERN HEMISPHERE
%
% Plot 10N-90N
% ============================================================

ilat = lat >= 10 & lat <= 90;

Lon2 = Lon(ilat,:);
Lat2 = Lat(ilat,:);

U2 = waf_x(ilat,:);
V2 = waf_y(ilat,:);

Z2 = zprime(ilat,:);


%% ============================================================
% REMOVE EXTREME / INVALID VALUES FROM PLOT
%
% Convert NaN/Inf automatically ignored by contour/quiver.
% ============================================================

U2(~isfinite(U2)) = NaN;
V2(~isfinite(V2)) = NaN;
Z2(~isfinite(Z2)) = NaN;


%% ============================================================
% THIN WAF VECTORS
% ============================================================

Lonq = Lon2(1:nskip:end,1:nskip:end);
Latq = Lat2(1:nskip:end,1:nskip:end);

Uq = U2(1:nskip:end,1:nskip:end);
Vq = V2(1:nskip:end,1:nskip:end);


%% ============================================================
% CREATE FIGURE
% ============================================================

figure('Position',[100 100 1200 650]);


%% ============================================================
% PLOT z' CONTOURS
% ============================================================

levels = -zmax:zint:zmax;

[C,h] = contour(Lon2,Lat2,Z2,levels, ...
                'LineWidth',1.0);

hold on;


%% ============================================================
% LABEL z' CONTOURS
% ============================================================

clabel(C,h, ...
       'FontSize',9, ...
       'Color','k');


%% ============================================================
% ZERO z' CONTOUR
% ============================================================

contour(Lon2,Lat2,Z2,[0 0], ...
        'k','LineWidth',1.8);


%% ============================================================
% PLOT WAF VECTORS
% ============================================================

quiver(Lonq,Latq,Uq,Vq,qscale, ...
       'k','LineWidth',1.0);


%% ============================================================
% DOMAIN
% ============================================================

xlim([0 360]);
ylim([10 90]);


%% ============================================================
% AXIS LABELS
% ============================================================

xlabel('Longitude');
ylabel('Latitude');


%% ============================================================
% TITLE
% ============================================================

title('JJA 200-hPa Response z'' and Takaya-Nakamura Wave Activity Flux');


%% ============================================================
% TICKS
% ============================================================

xticks(0:30:360);
yticks(10:10:90);


%% ============================================================
% AXIS / FIGURE PROPERTIES
% ============================================================

set(gca,'FontSize',13);

box on;

axis normal;


%% ============================================================
% REFERENCE WAF VECTOR
% ============================================================

x0 = 20;
y0 = 15;

quiver(x0,y0,ref,0,qscale, ...
       'k','LineWidth',1.2);

text(x0,y0-3, ...
     [num2str(ref),' m^2 s^{-2}'], ...
     'FontSize',11);


%% ============================================================
% FINISH
% ============================================================

hold off;


%% ============================================================
% END
% ============================================================
