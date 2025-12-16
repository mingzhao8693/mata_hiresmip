clc;clear all;close all;

store_P=[];
store_T=[];
for year = 1981:2020
    year
    if year == 1981
        startmonth=10;
    else
        startmonth=1;
    end
    if year == 2020
        endmonth=9;
    else
        endmonth=12;
    end
    for month=startmonth:endmonth
        infilename = sprintf('/Volumes/Pruina_External_Elements/ForecastDrought/Data/PRISM/Monthly_PRISM_%04d%02d.nc',year,month);
        
        P = ncread(infilename,'prcp');
        P = P(:);
        T = ncread(infilename,'temp');
        T = T(:);
        
        %remove nan values with ranom non-zero values
        idx_nan_T = find(isnan(T));
        idx_nan_P = find(isnan(P));
        
        idx_nan = unique([idx_nan_T;idx_nan_P]);
        idx_nan = sort(idx_nan);
        
        P(idx_nan) = rand(length(idx_nan),1).*10^-8;
        T(idx_nan) = rand(length(idx_nan),1).*10^-8;
        
        %store data so rows = site (lat,lon) and cols = month        
        store_P = [store_P,P];
        store_T = [store_T,T];
    end
end
P = store_P;
T = store_T;
%% Define input PDSI constant parameters:
% Specify which dimension of the temperature and precipitation data is the
% monthly time step. By default, pdsi treats the first dimension as time.
dim = 2;

% years: The first and last year of the T and P data. A two element vector.
years = [1981 , 2020];

% cafecYears: The first and last year of the calibration period used to
%    compute CAFEC normalization. A two element vector.
cafecYears = [1981 , 2020];

%show progress bar
showprogress = true;

%% calculate PDSI:
lat = ncread(infilename,'lat');
lon = ncread(infilename,'lon');
[LAT,LON] = meshgrid(lat,lon);

lats = LAT(:);

%define soil water parameters:
% awcs: The available water capacity of the surface layer for each site
%    (in mm). A common default value is 25.4 mm. A numeric array. Must have
%    the same size as lats.
awcs = linspace(25.4,25.4,length(P(:,1)));
awcs = awcs';
% awcu: The available water capacity of the underlying layer for each
%    site (in mm). A common default value is 127 mm. A numeric array. Must
%    have the same size as lats.
awcu = linspace(127,127,length(P(:,1)));
awcu = awcu';

%calculate PDSI
[X, Xm, Z, PE] = pdsi(T, P, years, lats, awcs, awcu, cafecYears, dim, showprogress);
PDSI = X;
PDSI(idx_nan) = NaN;
Modified_PDSI = Xm;
Modified_PDSI(idx_nan) = NaN;
%export data:
outputfilename = '/Volumes/Pruina_External_Elements/ForecastDrought/Data/PRISM/Monthly_PRISM_PDSI.nc';
if exist(outputfilename,'file') > 0
    CMD_rm = ['rm ',outputfilename];
    system(CMD_rm);
end

nccreate(outputfilename,'lat','Datatype','single','Dimensions',{'lat' length(lat)});
ncwriteatt(outputfilename, 'lat', 'standard_name', 'latitude');
ncwriteatt(outputfilename, 'lat', 'units', 'degreeN');
ncwrite(outputfilename,'lat', lat);

nccreate(outputfilename,'lon','Datatype','single','Dimensions',{'lon' length(lon)});
ncwriteatt(outputfilename, 'lon', 'standard_name', 'longitude');
ncwriteatt(outputfilename, 'lon', 'units', 'degreeW');
ncwrite(outputfilename,'lon', lon);

time = datenum([1981 1 1]):datenum([2020 12 31]);
datevecs = datevec(time);
idx = find(datevecs(:,3) == 1);
time = time(idx)';
nccreate(outputfilename,'time','Datatype','single','Dimensions',{'time' length(time)});
ncwriteatt(outputfilename, 'time', 'units', 'datenum');
ncwrite(outputfilename,'time',time);

pdsi = reshape(PDSI,[length(lon),length(lat),length(time)]);
nccreate(outputfilename,'pdsi','Datatype','single','Dimensions',{'lon' length(lon) 'lat' length(lat) 'time', length(time)});
ncwrite(outputfilename,'pdsi',pdsi);

% % outputfilename = '/Volumes/Pruina_External_Elements/ForecastDrought/Data/PRISM/Monthly_PRISM_PDSI.mat';
% % save(outputfilename,'PDSI', '-v7.3');
disp('finished')
