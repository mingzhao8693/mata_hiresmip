function zout = rotate_struct(z1,n_patten)
%APPEND_STRUCT Append the time dimension of two structures.
%
%   zout = append_struct(z1, z2)
%
% Assumes z1 and z2 have identical fields. All 4-D numeric arrays are
% concatenated along the first dimension. All other fields are copied
% from z1.

    zout = z1;

    fields = fieldnames(z1);

    for i = 1:numel(fields)
        fld = fields{i};

        if isnumeric(z1.(fld)) && ndims(z1.(fld)) == 4
	  a=z1.(fld);
	  [n,nsea,nlat,nlon]=size(a);
	  n_member=round(n/n_patten);
	  b=reshape(a,[n_member,n_patten,nsea,nlat,nlon]);
	  c=permute(b,[2,1,3,4,5]);
	  d=reshape(c,[n,nsea,nlat,nlon]);
          zout.(fld) = d;
        end
    end

end
