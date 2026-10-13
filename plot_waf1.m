%% ============================================================
%  Plot CTL JJA 200-hPa Takaya-Nakamura Wave Activity Flux
%
%  Input:
%    /work/miz/rws_waf_ray_monthly/ob_pattern/waf_JJA.nc
%
%  Variables:
%    waf_x_ctl(lat,lon)
%    waf_y_ctl(lat,lon)
%
%  Units:
%    m2 s-2
% =============================================================

clear;
close all;
clc;

%% ============================================================
% USER SETTINGS
% =============================================================

fname = '/work/miz/rws_waf_ray_monthly/ob_pattern/waf_JJA.nc';

% Vector thinning
nskip = 8;

% Quiver scaling
qscale = 2.0;

% Reference vector
ref = 100;          % m2 s-2

%% ============================================================
% READ DATA
% =============================================================

lon = ncread(fname,'lon');
lat = ncread(fname,'lat');

waf_x = ncread(fname,'waf_x_ctl');
waf_y = ncread(fname,'waf_y_ctl');

%% ============================================================
% MATLAB NETCDF DIMENSION ORDER
%
% NetCDF:
%     waf_x_ctl(lat,lon)
%
% MATLAB ncread returns:
%     [lon,lat]
%
% Therefore transpose to obtain:
%     [lat,lon]
% =============================================================

waf_x = waf_x';
waf_y = waf_y';

%% Check dimensions

disp(['lon: ',num2str(length(lon))]);
disp(['lat: ',num2str(length(lat))]);
disp(['WAF size: ',mat2str(size(waf_x))]);

%% ============================================================
% CREATE 2-D GRID
% =============================================================

[Lon,Lat] = meshgrid(lon,lat);

%% ============================================================
% NORTHERN HEMISPHERE
% =============================================================

ilat = lat >= 10 & lat <= 90;

Lon2 = Lon(ilat,:);
Lat2 = Lat(ilat,:);

U2 = waf_x(ilat,:);
V2 = waf_y(ilat,:);

%% ============================================================
% THIN VECTORS
% =============================================================

Lonq = Lon2(1:nskip:end,1:nskip:end);
Latq = Lat2(1:nskip:end,1:nskip:end);

Uq = U2(1:nskip:end,1:nskip:end);
Vq = V2(1:nskip:end,1:nskip:end);

%% ============================================================
% PLOT
% =============================================================

figure('Position',[100 100 1200 650]);

quiver(Lonq,Latq,Uq,Vq,qscale, ...
       'k','LineWidth',1.0);

%% Domain

xlim([0 360]);
ylim([10 90]);

%% Labels

xlabel('Longitude');
ylabel('Latitude');

title('CTL JJA 200-hPa Takaya-Nakamura Wave Activity Flux');

%% Ticks

xticks(0:30:360);
yticks(10:10:90);

%% Figure properties

set(gca,'FontSize',13);
box on;

%% ============================================================
% REFERENCE VECTOR
% =============================================================

hold on;

x0 = 20;
y0 = 15;

quiver(x0,y0,ref,0,qscale, ...
       'k','LineWidth',1.2);

text(x0,y0-3, ...
     [num2str(ref),' m^2 s^{-2}'], ...
     'FontSize',11);

hold off;

%% ============================================================
% END
% =============================================================
