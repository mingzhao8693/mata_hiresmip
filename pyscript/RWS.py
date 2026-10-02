import numpy as np
from windspharm.standard import VectorWind


def rossby_wave_source(u, v, lat, truncation=None):
    """
    Calculate Rossby Wave Source (RWS).

    Parameters
    ----------
    u : numpy.ndarray
        Zonal wind [m/s].
        Shape: (nlat, nlon)

    v : numpy.ndarray
        Meridional wind [m/s].
        Shape: (nlat, nlon)

    lat : numpy.ndarray
        Latitude [degrees].
        Must be ordered from north to south.

    truncation : int, optional
        Spectral truncation used by windspharm.
        Example: 42 for T42.
        If None, windspharm determines the truncation.

    Returns
    -------
    rws : numpy.ndarray
        Rossby Wave Source [s^-2]

    div_chi : numpy.ndarray
        Divergence of divergent wind [s^-1]

    vrt_abs : numpy.ndarray
        Absolute vorticity [s^-1]

    uchi : numpy.ndarray
        Zonal divergent wind [m/s]

    vchi : numpy.ndarray
        Meridional divergent wind [m/s]
    """

    # ------------------------------------------------------------
    # Check dimensions
    # ------------------------------------------------------------

    if u.shape != v.shape:
        raise ValueError("u and v must have the same shape.")

    if u.ndim != 2:
        raise ValueError(
            "This function expects 2-D arrays: (latitude, longitude)."
        )

    if u.shape[0] != len(lat):
        raise ValueError(
            "First dimension of u/v must correspond to latitude."
        )

    # windspharm expects latitude north -> south
    if lat[0] < lat[-1]:
        lat = lat[::-1]
        u = u[::-1, :]
        v = v[::-1, :]

    # ------------------------------------------------------------
    # Create windspharm object
    # ------------------------------------------------------------

    w = VectorWind(u, v)

    # ------------------------------------------------------------
    # Total-wind divergence
    # ------------------------------------------------------------

    div = w.divergence(truncation=truncation)

    # ------------------------------------------------------------
    # Relative vorticity
    # ------------------------------------------------------------

    vrt = w.vorticity(truncation=truncation)

    # ------------------------------------------------------------
    # Absolute vorticity
    #
    # f = 2 Omega sin(latitude)
    # ------------------------------------------------------------

    Omega = 7.292115e-5

    f = 2.0 * Omega * np.sin(np.deg2rad(lat))

    f = f[:, np.newaxis]

    vrt_abs = vrt + f

    # ------------------------------------------------------------
    # Divergent component of wind
    # ------------------------------------------------------------

    uchi, vchi = w.irrotationalcomponent(
        truncation=truncation
    )

    # ------------------------------------------------------------
    # Divergence of divergent wind
    #
    # This should equal total divergence (apart from
    # numerical/truncation differences).
    # ------------------------------------------------------------

    wchi = VectorWind(uchi, vchi)

    div_chi = wchi.divergence(
        truncation=truncation
    )

    # ------------------------------------------------------------
    # Gradient of absolute vorticity
    # ------------------------------------------------------------

    grad_zeta_x, grad_zeta_y = wchi.gradient(
        vrt_abs,
        truncation=truncation
    )

    # ------------------------------------------------------------
    # Rossby Wave Source
    #
    # RWS =
    #
    # - zeta_a * div(Vchi)
    # - Vchi . grad(zeta_a)
    #
    # ------------------------------------------------------------

    rws = (
        -vrt_abs * div_chi
        -uchi * grad_zeta_x
        -vchi * grad_zeta_y
    )

    return rws, div_chi, vrt_abs, uchi, vchi
