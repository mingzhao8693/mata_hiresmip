function dF = dlon_cyclic(F,dlon)
% --------------------------------------------------------------
% Derivative with respect to longitude.
% Periodic boundary condition in longitude.
% --------------------------------------------------------------

    dF = zeros(size(F));

    % Interior
    dF(2:end-1,:) = ...
        (F(3:end,:) - F(1:end-2,:)) ./ (2*dlon);

    % Western boundary
    dF(1,:) = ...
        (F(2,:) - F(end,:)) ./ (2*dlon);

    % Eastern boundary
    dF(end,:) = dF(1,:);

end
