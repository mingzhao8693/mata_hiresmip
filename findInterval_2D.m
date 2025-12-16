function loc_array = findInterval_2D(lat_array, ref_lats)
% FINDINTERVAL_2D Maps a 2D latitude array to FWI daylength factor zone indices (1-5).
%
%   loc_array = FINDINTERVAL_2D(lat_array, ref_lats)
%
%   INPUTS:
%       lat_array : M x L array of latitude values (e.g., -90 to 90).
%       ref_lats  : 1 x K vector of reference latitudes defining the zone boundaries.
%                   (Standard FWI uses 6 boundaries: [-90 -30 -10 10 30 90])
%
%   OUTPUT:
%       loc_array : M x L array where each element is the index (1 to K-1)
%                   corresponding to the latitude zone.

    % Ensure ref_lats is a row vector and subset the boundaries needed (K-1 intervals)
    ref_lats_subset = reshape(ref_lats(1:end-1), 1, 1, []); % Size: 1 x 1 x (K-1)

    % --- The Key Vectorization Step (Broadcasting) ---
    
    % 1. Reshape the subset to 1 x 1 x (K-1)
    % This ensures the first two dimensions are singletons.
    % MATLAB's broadcasting implicitly expands the 1x1 dimensions to match the M x L 
    % dimensions of lat_array.
    
    % 2. Perform the Comparison: lat_array (M x L) >= ref_lats_subset (1 x 1 x K-1)
    % The result is a Logical Array: M x L x (K-1).
    size(lat_array)
    size(ref_lats_subset)
    is_greater = lat_array >= ref_lats_subset; size(is_greater)

    % 3. Sum the logical array along the third dimension.
    % The sum counts how many boundaries each latitude value is greater than or equal to.
    % This count directly gives the zone index (1 to 5).
    loc_array = sum(is_greater, 3);
    
    % The output loc_array is M x L.
end
