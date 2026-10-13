function [RWS, divchi, zeta, zeta_a, uchi, vchi] = calc_RWS(u,v,lon,lat)
% ==============================================================
% CALC_RWS
%
% Calculate Rossby Wave Source from horizontal wind.
%
% INPUT:
%   u   = zonal wind [lon x lat] (m/s)
%   v   = meridional wind [lon x lat] (m/s)
%   lon = longitude (degrees)
%   lat = latitude  (degrees)
%
% OUTPUT:
%   RWS     = Rossby Wave Source (s^-2)
%   divchi  = divergent wind divergence (s^-1)
%   zeta    = relative vorticity (s^-1)
%   zeta_a  = absolute vorticity (s^-1)
%   uchi    = divergent zonal wind (m/s)
%   vchi    = divergent meridional wind (m/s)
%
% Formula:
%
% RWS = -zeta_a * div(Vchi)
%       - Vchi . grad(zeta_a)
%
% ==============================================================

    % Earth parameters
    Re = 6.371e6;
    Omega = 7.292115e-5;

    lon = lon(:);
    lat = lat(:);

    % Make sure data are [lon x lat]
    if size(u,1) ~= length(lon)
        u = u';
        v = v';
    end

    % Coordinates
    lambda = deg2rad(lon);
    phi    = deg2rad(lat);

    dlon = mean(diff(lambda));
    dlat = mean(diff(phi));

    % ----------------------------------------------------------
    % Coriolis parameter
    % ----------------------------------------------------------

    f = 2*Omega*sin(phi);
    f2 = repmat(f',length(lon),1);

    cosphi = cos(phi);
    cos2 = repmat(cosphi',length(lon),1);

    % ----------------------------------------------------------
    % Relative vorticity
    %
    % zeta =
    % 1/(a cos(phi)) * dv/dlambda
    % - 1/a * du/dphi
    % ----------------------------------------------------------

    dv_dlon = dlon_cyclic(v,dlon);
    du_dlat = dlat_center(v*0 + u,dlat);

    zeta = dv_dlon ./ (Re*cos2) ...
         - du_dlat ./ Re;

    % ----------------------------------------------------------
    % Absolute vorticity
    % ----------------------------------------------------------

    zeta_a = zeta + f2;

    % ----------------------------------------------------------
    % Divergence of total wind
    % ----------------------------------------------------------

    du_dlon = dlon_cyclic(u,dlon);

    vcos = v .* cos2;

    d_vcos_dlat = dlat_center(vcos,dlat);

    div = du_dlon ./ (Re*cos2) ...
        + d_vcos_dlat ./ (Re*cos2);

    % ----------------------------------------------------------
    % Helmholtz decomposition
    %
    % div(Vchi) = div(V)
    % ----------------------------------------------------------

    chi = streamfunction_inversion(div,lon,lat);

    % ----------------------------------------------------------
    % Divergent wind
    %
    % Vchi = grad(chi)
    % ----------------------------------------------------------

    dchi_dlon = dlon_cyclic(chi,dlon);
    dchi_dlat = dlat_center(chi,dlat);

    uchi = dchi_dlon ./ (Re*cos2);
    vchi = dchi_dlat ./ Re;

    % ----------------------------------------------------------
    % Divergent wind divergence
    % ----------------------------------------------------------

    duchi_dlon = dlon_cyclic(uchi,dlon);

    vchi_cos = vchi .* cos2;

    dvchi_cos_dlat = dlat_center(vchi_cos,dlat);

    divchi = duchi_dlon ./ (Re*cos2) ...
           + dvchi_cos_dlat ./ (Re*cos2);

    % ----------------------------------------------------------
    % Gradient of absolute vorticity
    % ----------------------------------------------------------

    dzeta_dlon = dlon_cyclic(zeta_a,dlon);
    dzeta_dlat = dlat_center(zeta_a,dlat);

    dzeta_dx = dzeta_dlon ./ (Re*cos2);
    dzeta_dy = dzeta_dlat ./ Re;

    % ----------------------------------------------------------
    % Rossby Wave Source
    % ----------------------------------------------------------

    RWS = -zeta_a .* divchi ...
          - uchi .* dzeta_dx ...
          - vchi .* dzeta_dy;

end
