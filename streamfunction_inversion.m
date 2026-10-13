function chi = streamfunction_inversion(div,lon,lat)
% --------------------------------------------------------------
% Approximate solution of:
%
%       Laplacian(chi) = div
%
% using an iterative relaxation method.
%
% NOTE:
% For publication-quality global RWS calculations, replace this
% with a spherical-harmonic Poisson solver.
% --------------------------------------------------------------

    Re = 6.371e6;

    nlon = length(lon);
    nlat = length(lat);

    lambda = deg2rad(lon(:));
    phi = deg2rad(lat(:));

    dlon = mean(diff(lambda));
    dlat = mean(diff(phi));

    cosphi = cos(phi);

    chi = zeros(nlon,nlat);

    % Remove global mean divergence
    div = div - mean(div(:),'omitnan');

    % Iteration parameters
    maxiter = 5000;
    tol = 1e-10;
    relax = 1.2;

    for iter = 1:maxiter

        chi_old = chi;

        for j = 2:nlat-1

            cp = cosphi(j);

            for i = 1:nlon

                % Periodic longitude
                ip = i+1;
                if ip > nlon
                    ip = 1;
                end

                im = i-1;
                if im < 1
                    im = nlon;
                end

                % Coefficients for spherical Laplacian
                A = 1/(Re^2*cp^2*dlon^2);

                Bp = cosphi(j+1) / ...
                    (Re^2*cp*dlat^2);

                Bm = cosphi(j-1) / ...
                    (Re^2*cp*dlat^2);

                denom = 2*A + ...
                    (Bp+Bm)/cp;

                chi_new = ...
                    ( A*(chi(ip,j)+chi(im,j)) ...
                    + Bp*chi(i,j+1) ...
                    + Bm*chi(i,j-1) ...
                    - div(i,j) ) / denom;

                chi(i,j) = ...
                    (1-relax)*chi(i,j) ...
                    + relax*chi_new;

            end
        end

        % Remove arbitrary constant
        chi = chi - mean(chi(:),'omitnan');

        % Convergence
        err = max(abs(chi(:)-chi_old(:)));

        if err < tol
            fprintf('Converged after %d iterations\n',iter);
            break
        end

    end

end
