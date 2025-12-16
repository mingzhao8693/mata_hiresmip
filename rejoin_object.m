function map_out=rejoin_object(map_in,lon,lat)
%rejoin objects artificially cut off by circular longitudinal boundary
lons=min(lon(:));
lone=max(lon(:));
bound_val=unique(map_in(map_in~=0 & (lon==lone | lon==lons))); % unique non-zero values
for ocnt_west=1:numel(bound_val)
  for ocnt_east=1:numel(bound_val)
    bound_west_idx=find(map_in==bound_val(ocnt_west) & lon==lone);
    bound_east_idx=find(map_in==bound_val(ocnt_east) & lon==lons);
    [null,bound_west_col]=ind2sub(size(lon),bound_west_idx);
    [null,bound_east_col]=ind2sub(size(lon),bound_east_idx);
    if numel(intersect(bound_west_col,bound_east_col))>0 | numel(intersect(bound_west_col,bound_east_col-1))>0 | numel(intersect(bound_west_col,bound_east_col+1))>0
      map_in(map_in==bound_val(ocnt_east))=bound_val(ocnt_west); % note: this is no longer a label matrix (same-valued pixels are not necessarily in a contiguous region)
    end
  end
end
map_out=map_in;
return
