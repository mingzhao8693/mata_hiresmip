function zout = subtract_struct(z1, z2)
% Assumes z1 and z2 have identical fields. All 4-D numeric arrays are subtracted
% zout = z1 - z2

    zout = z1;

    fields = fieldnames(z1);

    for i = 1:numel(fields)
        fld = fields{i};

        if isnumeric(z1.(fld)) && ndims(z1.(fld)) == 4
            zout.(fld) = z1.(fld) - z2.(fld);
        end
    end

end
