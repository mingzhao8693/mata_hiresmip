file_x = 'atmos.000201-010112.ivtx.nc';
file_y = 'atmos.000201-010112.ivty.nc';
file_out = 'atmos.000201-010112.ivtdiv.nc';

file_x   = 'ERA5_195901-202012.ivtx.nc';
file_y   = 'ERA5_195901-202012.ivty.nc';
file_out = 'ERA5_195901-202012.ivtdiv.nc';

% 2. Read variables and coordinates
fprintf('Reading NetCDF files...\n');
ivtx = ncread(file_x, 'ivtx'); 
ivty = ncread(file_y, 'ivty');
lon  = ncread(file_x, 'lon');
lat  = ncread(file_x, 'lat');
time = ncread(file_x, 'time');

% --- DIMENSION SANITY CHECK ---
% Ensures arrays are oriented as [Longitude x Latitude x Time]
dims = size(ivtx);
if dims(1) == length(lat) && dims(2) == length(lon)
    fprintf('Detected [lat, lon] ordering. Permuting arrays to [lon, lat]...\n');
    ivtx = permute(ivtx, [2, 1, 3]);
    ivty = permute(ivty, [2, 1, 3]);
elseif dims(3) == length(lat) && dims(2) == length(lon)
    fprintf('Detected [time, lon, lat] ordering. Permuting arrays to [lon, lat, time]...\n');
    ivtx = permute(ivtx, [2, 3, 1]);
    ivty = permute(ivty, [2, 3, 1]);
end

[Nlon, Nlat, Ntime] = size(ivtx);

% 3. Convert coordinates to Radians
R = 6.371e6; % Earth's radius in meters
lon_rad = deg2rad(lon);
lat_rad = deg2rad(lat);

% 4. Compute accurate spacing vectors (deltas) in radians
dlon = zeros(Nlon, 1);
dlon(1) = lon_rad(2) - lon_rad(1);
dlon(end) = lon_rad(end) - lon_rad(end-1);
dlon(2:end-1) = (lon_rad(3:end) - lon_rad(1:end-2)) / 2;

dlat = zeros(Nlat, 1);
dlat(1) = lat_rad(2) - lat_rad(1);
dlat(end) = lat_rad(end) - lat_rad(end-1);
dlat(2:end-1) = (lat_rad(3:end) - lat_rad(1:end-2)) / 2;

% Reshape coordinate parameters for 3D broadcasting
dlon_3d = reshape(dlon, [Nlon, 1, 1]);
dlat_3d = reshape(dlat, [1, Nlat, 1]);
cos_lat_3d = reshape(cos(lat_rad), [1, Nlat, 1]);
tan_lat_3d = reshape(tan(lat_rad), [1, Nlat, 1]);

fprintf('Calculating fully vectorized divergence...\n');
% 5. Compute raw matrix index derivatives across all dimensions simultaneously
dudi = zeros(Nlon, Nlat, Ntime);
dvdj = zeros(Nlon, Nlat, Ntime);

% Longitude derivatives (Dim 1)
dudi(1,:,:) = ivtx(2,:,:) - ivtx(1,:,:);
dudi(end,:,:) = ivtx(end,:,:) - ivtx(end-1,:,:);
dudi(2:end-1,:,:) = (ivtx(3:end,:,:) - ivtx(1:end-2,:,:)) / 2;

% Latitude derivatives (Dim 2)
dvdj(:,1,:) = ivty(:,2,:) - ivty(:,1,:);
dvdj(:,end,:) = ivty(:,end,:) - ivty(:,end-1,:);
dvdj(:,2:end-1,:) = (ivty(:,3:end,:) - ivty(:,1:end-2,:)) / 2;

% 6. Apply Spherical Divergence Formula
div_x = (dudi ./ dlon_3d) ./ (R .* cos_lat_3d);
div_y = (dvdj ./ dlat_3d) ./ R - (ivty ./ R) .* tan_lat_3d;

divergence = div_x + div_y;

% Diagnostic check to verify calculation is non-zero
fprintf('Max Divergence Value calculated: %e\n', max(divergence(:)));
fprintf('Min Divergence Value calculated: %e\n', min(divergence(:)));

% 7. Write results to NetCDF file
fprintf('Writing output file: %s...\n', file_out);
if exist(file_out, 'file'), delete(file_out); end

nccreate(file_out, 'lon', 'Dimensions', {'lon', Nlon}, 'Datatype', 'single');
nccreate(file_out, 'lat', 'Dimensions', {'lat', Nlat}, 'Datatype', 'single');
nccreate(file_out, 'time', 'Dimensions', {'time', Ntime}, 'Datatype', 'single');
nccreate(file_out, 'ivtdiv', 'Dimensions', {'lon', Nlon, 'lat', Nlat, 'time', Ntime}, 'Datatype', 'single');

ncwrite(file_out, 'lon', lon);
ncwrite(file_out, 'lat', lat);
ncwrite(file_out, 'time', time);
ncwrite(file_out, 'ivtdiv', single(divergence));

ncwriteatt(file_out, 'ivtdiv', 'long_name', 'Divergence of Vertically Integrated Water Vapor Transport');
ncwriteatt(file_out, 'ivtdiv', 'units', 'kg m-2 s-1');
fprintf('Process successfully finished!\n');
