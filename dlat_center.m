function dF = dlat_center(F,dlat)
% --------------------------------------------------------------
% Derivative with respect to latitude.
% Central difference in interior.
% One-sided difference at boundaries.
% --------------------------------------------------------------

    dF = zeros(size(F));

    % Interior
    dF(:,2:end-1) = ...
        (F(:,3:end) - F(:,1:end-2)) ./ (2*dlat);

    % Southern boundary
    dF(:,1) = ...
        (F(:,2) - F(:,1)) ./ dlat;

    % Northern boundary
    dF(:,end) = ...
        (F(:,end) - F(:,end-1)) ./ dlat;

end
