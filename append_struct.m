function zout = append_struct(z1, z2)
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
            zout.(fld) = cat(1, z1.(fld), z2.(fld));
        end
    end

end
