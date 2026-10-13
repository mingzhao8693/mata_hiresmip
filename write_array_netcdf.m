function write_array_netcdf(filename, a, year, season, percentile, lat, lon, vname)

% =========================================================
% Input:
%
%   a(year, season, percentile, lat, lon)
%
%   11 x 17 x 11 x 360 x 576
%
% Output:
%
%   a(year, season, percentile, lat, lon)
%
%   11 x 17 x 11 x 180 x 288
%
% Spatial resolution is reduced by factor of 2 using
% 2x2 spatial averaging.
%
% NetCDF layout for ncview:
%
%   a(season, percentile, year, lon, lat)
%
% with year as the unlimited/record dimension.
% =========================================================

% ---------------------------------------------------------
% Check dimensions
% ---------------------------------------------------------

nyear = numel(year);
nseason = numel(season);
npercentile = numel(percentile);
nlat = numel(lat);
nlon = numel(lon);

assert(isequal(size(a), ...
    [nyear nseason npercentile nlat nlon]), ...
    'Dimensions of a do not match year, season, percentile, lat, lon.');

assert(mod(nlat,2) == 0, ...
    'Number of latitude points must be even.');

assert(mod(nlon,2) == 0, ...
    'Number of longitude points must be even.');

% ---------------------------------------------------------
% New spatial dimensions
% ---------------------------------------------------------

nlat2 = nlat / 2;
nlon2 = nlon / 2;

% ---------------------------------------------------------
% Coarse grain latitude
%
% Combine every 2 adjacent latitude points
% ---------------------------------------------------------

a = reshape(a, ...
    nyear, nseason, npercentile, 2, nlat2, nlon);

a = mean(a, 4, 'omitnan');

% Explicitly restore 5-D shape
a = reshape(a, ...
    nyear, nseason, npercentile, nlat2, nlon);

% ---------------------------------------------------------
% Coarse grain longitude
%
% Combine every 2 adjacent longitude points
% ---------------------------------------------------------

a = reshape(a, ...
    nyear, nseason, npercentile, nlat2, 2, nlon2);

a = mean(a, 5, 'omitnan');

% Explicitly restore 5-D shape
a = reshape(a, ...
    nyear, nseason, npercentile, nlat2, nlon2);

% ---------------------------------------------------------
% Coarse-grain coordinate arrays
% ---------------------------------------------------------

lat = reshape(lat, 2, nlat2);
lat = mean(lat, 1, 'omitnan');
lat = lat(:);

lon = reshape(lon, 2, nlon2);
lon = mean(lon, 1, 'omitnan');
lon = lon(:);

% ---------------------------------------------------------
% Check result
% ---------------------------------------------------------

fprintf('Original size: ');
disp([nyear nseason npercentile nlat nlon]);

fprintf('New size:      ');
disp(size(a));

% ---------------------------------------------------------
% Rearrange for ncview
%
% MATLAB:
%
%   year x season x percentile x lat x lon
%
% NetCDF:
%
%   season x percentile x year x lon x lat
%
% ---------------------------------------------------------

a_nc = permute(a, [2 3 1 5 4]);

% ---------------------------------------------------------
% Delete existing file
% ---------------------------------------------------------

if isfile(filename)
    delete(filename);
end

% ---------------------------------------------------------
% Create NetCDF variable
% ---------------------------------------------------------

nccreate(filename, vname, ...
    'Dimensions', {'season', nseason, ...
                   'percentile', npercentile, ...
                   'year', Inf, ...
                   'lon', nlon2, ...
                   'lat', nlat2}, ...
    'Datatype', class(a_nc), ...
    'Format', 'netcdf4');

% ---------------------------------------------------------
% Coordinate variables
% ---------------------------------------------------------

nccreate(filename, 'season', ...
    'Dimensions', {'season', nseason}, ...
    'Datatype', class(season));

nccreate(filename, 'percentile', ...
    'Dimensions', {'percentile', npercentile}, ...
    'Datatype', class(percentile));

nccreate(filename, 'year', ...
    'Dimensions', {'year', Inf}, ...
    'Datatype', class(year));

nccreate(filename, 'lon', ...
    'Dimensions', {'lon', nlon2}, ...
    'Datatype', class(lon));

nccreate(filename, 'lat', ...
    'Dimensions', {'lat', nlat2}, ...
    'Datatype', class(lat));

% ---------------------------------------------------------
% Attributes
% ---------------------------------------------------------

ncwriteatt(filename, vname, ...
    'long_name', 'coarse-grained data');

ncwriteatt(filename, vname, ...
    'coordinates', 'year season percentile lat lon');

ncwriteatt(filename, 'year', ...
    'long_name', 'year');
ncwriteatt(filename, 'year', ...
    'axis', 'T');

ncwriteatt(filename, 'season', ...
    'long_name', 'season');

ncwriteatt(filename, 'percentile', ...
    'long_name', 'percentile');

ncwriteatt(filename, 'lat', ...
    'long_name', 'latitude');
ncwriteatt(filename, 'lat', ...
    'standard_name', 'latitude');
ncwriteatt(filename, 'lat', ...
    'units', 'degrees_north');
ncwriteatt(filename, 'lat', ...
    'axis', 'Y');

ncwriteatt(filename, 'lon', ...
    'long_name', 'longitude');
ncwriteatt(filename, 'lon', ...
    'standard_name', 'longitude');
ncwriteatt(filename, 'lon', ...
    'units', 'degrees_east');
ncwriteatt(filename, 'lon', ...
    'axis', 'X');

% ---------------------------------------------------------
% Write data
% ---------------------------------------------------------

ncwrite(filename, vname, a_nc);

ncwrite(filename, 'season', season);
ncwrite(filename, 'percentile', percentile);
ncwrite(filename, 'year', year);
ncwrite(filename, 'lat', lat);
ncwrite(filename, 'lon', lon);

% ---------------------------------------------------------
% Display resulting NetCDF structure
% ---------------------------------------------------------

fprintf('\nCreated NetCDF file:\n%s\n\n', filename);

ncdisp(filename);

end

