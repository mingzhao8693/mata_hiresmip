%% ============================================================
% Compare ERA5 and CTRL JJA 200-hPa z' and TN WAF
%
% ERA5:
%   waf_ERA5.nc
%       waf_x_JJA
%       waf_y_JJA
%       zprime_JJA
%
% CTRL:
%   waf.nc
%       waf_x_ctl_JJA
%       waf_y_ctl_JJA
%       zprime_ctl_JJA
%
% ============================================================

clear;
close all;
clc;

%% ============================================================
% FILES
% ============================================================

fname_era5 = '/work/miz/rws_waf_ray_monthly/era5/waf_ERA5.nc';
fname_ctl  = '/work/miz/rws_waf_ray_monthly/ob_pattern/waf.nc';

%% ============================================================
% PLOT SETTINGS
% ============================================================

nskip = 8;

qscale = 2.0;

ref = 100;              % WAF reference vector

zint = 40;              % geopotential height contour interval, m
zmax = 200;             % maximum contour, m

%% ============================================================
% READ COORDINATES
% ============================================================

lon = ncread(fname_era5,'lon');
lat = ncread(fname_era5,'lat');

%% ============================================================
% READ ERA5
% ============================================================

waf_x_era5 = ncread(fname_era5,'waf_x_JJA');
waf_y_era5 = ncread(fname_era5,'waf_y_JJA');
z_era5     = ncread(fname_era5,'zprime_JJA');

%% ============================================================
% READ CTRL
% ============================================================

waf_x_ctl = ncread(fname_ctl,'waf_x_ctl_JJA');
waf_y_ctl = ncread(fname_ctl,'waf_y_ctl_JJA');
z_ctl     = ncread(fname_ctl,'zprime_ctl_JJA');

%% ============================================================
% TRANSPOSE
% NetCDF = [lon,lat]
% MATLAB plotting = [lat,lon]
% ============================================================

waf_x_era5 = waf_x_era5';
waf_y_era5 = waf_y_era5';
z_era5     = z_era5';

waf_x_ctl = waf_x_ctl';
waf_y_ctl = waf_y_ctl';
z_ctl     = z_ctl';

%% ============================================================
% CHECK DIMENSIONS
% ============================================================

disp(' ');
disp('ERA5 dimensions:');
disp(['WAF X: ',mat2str(size(waf_x_era5))]);
disp(['WAF Y: ',mat2str(size(waf_y_era5))]);
disp(['Z:     ',mat2str(size(z_era5))]);

disp(' ');
disp('CTRL dimensions:');
disp(['WAF X: ',mat2str(size(waf_x_ctl))]);
disp(['WAF Y: ',mat2str(size(waf_y_ctl))]);
disp(['Z:     ',mat2str(size(z_ctl))]);

%% ============================================================
% GRID
% ============================================================

[Lon,Lat] = meshgrid(lon,lat);

%% ============================================================
% NORTHERN HEMISPHERE
% ============================================================

ilat = lat >= 10 & lat <= 90;

Lon2 = Lon(ilat,:);
Lat2 = Lat(ilat,:);

%% ============================================================
% ERA5
% ============================================================

U_era5 = waf_x_era5(ilat,:);
V_era5 = waf_y_era5(ilat,:);
Z_era5 = z_era5(ilat,:);

%% ============================================================
% CTRL
% ============================================================

U_ctl = waf_x_ctl(ilat,:);
V_ctl = waf_y_ctl(ilat,:);
Z_ctl = z_ctl(ilat,:);

%% ============================================================
% INVALID VALUES
% ============================================================

U_era5(~isfinite(U_era5)) = NaN;
V_era5(~isfinite(V_era5)) = NaN;
Z_era5(~isfinite(Z_era5)) = NaN;

U_ctl(~isfinite(U_ctl)) = NaN;
V_ctl(~isfinite(V_ctl)) = NaN;
Z_ctl(~isfinite(Z_ctl)) = NaN;

%% ============================================================
% THIN WAF VECTORS
% ============================================================

Lonq = Lon2(1:nskip:end,1:nskip:end);
Latq = Lat2(1:nskip:end,1:nskip:end);

Uq_era5 = U_era5(1:nskip:end,1:nskip:end);
Vq_era5 = V_era5(1:nskip:end,1:nskip:end);

Uq_ctl = U_ctl(1:nskip:end,1:nskip:end);
Vq_ctl = V_ctl(1:nskip:end,1:nskip:end);

%% ============================================================
% CONTOUR LEVELS
% ============================================================

levels = -zmax:zint:zmax;

%% ============================================================
% FIGURE
% ============================================================

figure('Position',[100 100 3000 600]);

%% ============================================================
% ERA5
% ============================================================
xy=[0 360 15 75];

subplot(1,2,1);

[C,h] = contour(Lon2,Lat2,Z_era5,levels, ...
                'LineWidth',1.0);

hold on;

clabel(C,h, ...
       'FontSize',9, ...
       'Color','k');

% Zero contour
contour(Lon2,Lat2,Z_era5,[0 0], ...
        'k','LineWidth',1.8);

% WAF
quiver(Lonq,Latq,Uq_era5,Vq_era5,qscale, ...
       'k','LineWidth',1.0);

xlim([0 360]);
ylim([10 90]);
axis(xy);
xticks(0:30:360);
yticks(10:10:90);

xlabel('Longitude');
ylabel('Latitude');

title('ERA5 JJA 200-hPa z'' and TN WAF');

set(gca,'FontSize',12);
box on;
axis normal;

% Reference vector
quiver(20,15,ref,0,qscale, ...
       'k','LineWidth',1.2);

text(20,12, ...
     [num2str(ref),' m^2 s^{-2}'], ...
     'FontSize',10);

%% ============================================================
% CTRL
% ============================================================

subplot(1,2,2);

[C,h] = contour(Lon2,Lat2,Z_ctl,levels, ...
                'LineWidth',1.0);

hold on;

clabel(C,h, ...
       'FontSize',9, ...
       'Color','k');

% Zero contour
contour(Lon2,Lat2,Z_ctl,[0 0], ...
        'k','LineWidth',1.8);

% WAF
quiver(Lonq,Latq,Uq_ctl,Vq_ctl,qscale, ...
       'k','LineWidth',1.0);

xlim([0 360]);
ylim([10 90]);
axis(xy);
xticks(0:30:360);
yticks(10:10:90);

xlabel('Longitude');
ylabel('Latitude');

title('CTRL JJA 200-hPa z'' and TN WAF');

set(gca,'FontSize',12);
box on;
axis normal;

% Reference vector
quiver(20,15,ref,0,qscale, ...
       'k','LineWidth',1.2);

text(20,12, ...
     [num2str(ref),' m^2 s^{-2}'], ...
     'FontSize',10);

hold off;
