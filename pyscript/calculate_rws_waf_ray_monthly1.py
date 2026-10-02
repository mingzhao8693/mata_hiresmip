#!/usr/bin/env python

import os
import numpy as np
import xarray as xr

from windspharm.xarray import VectorWind


# ============================================================
# USER SETTINGS
# ============================================================

EXP_DIR = "/work/miz/rws_waf_monthly/sp_pattern/data"
CTL_DIR = "/work/miz/rws_waf_monthly/control/data"

OUT_DIR = "/work/miz/rws_waf_monthly/sp_pattern"

U_FILE = "atmos.000201-010112.ucomp.nc"
V_FILE = "atmos.000201-010112.vcomp.nc"
Z_FILE = "atmos.000201-010112.hght.nc"

TARGET_LEVEL = 200.0

START_YEAR = 2
END_YEAR   = 101

# Earth parameters
A = 6.371e6
OMEGA = 7.2921150e-5
G = 9.80665

# TN01 pressure normalization:
# p / 1000 hPa
P_NORM = TARGET_LEVEL / 1000.0

# Avoid equatorial singularity in psi = g Z / f
LAT_MIN_TN01 = 10.0

# Avoid division by very weak background flow
WIND2_MIN = 1.0e-8

FILL_VALUE = -9999.0


# ============================================================
# NEW: BAROTROPIC STATIONARY ROSSBY-WAVE RAY TRACING
# ============================================================

# Background state used for ray tracing:
# CTL JJA climatology at 200 hPa.
#
# If you want to use EXP instead, change this to "EXP".
RAY_BACKGROUND = "CTL"

# Initial zonal wavenumber.
#
# k = zonal wavenumber / (a cos(phi))
#
# A value of 5 corresponds approximately to planetary
# wavenumber-5 structure.
RAY_ZONAL_WAVENUMBER = 5.0

# Number of rays launched around the RWS source.
RAY_N_RAYS = 9

# Initial meridional wavenumber.
#
# The ray tracer will determine the stationary meridional
# wavenumber from the stationary dispersion relation.
RAY_INITIAL_L_SIGN = 1.0

# Automatically determine the ray source from the maximum
# positive EXP-CTL JJA RWS within this region.
RAY_SOURCE_LON_MIN = 120.0
RAY_SOURCE_LON_MAX = 180.0
RAY_SOURCE_LAT_MIN = 10.0
RAY_SOURCE_LAT_MAX = 45.0

# Small latitude/longitude perturbations used to launch
# multiple rays around the source.
RAY_SOURCE_LON_SPREAD = 10.0
RAY_SOURCE_LAT_SPREAD = 5.0

# Ray integration settings.
#
# The integration uses a fixed time step.
RAY_DT_HOURS = 1.0
RAY_NSTEPS = 24 * 10

# Stop rays outside these latitude limits.
RAY_LAT_MIN = 10.0
RAY_LAT_MAX = 75.0

# Stop rays if the stationary dispersion relation cannot
# support real meridional wavenumber.
RAY_STOP_IF_NO_STATIONARY_WAVE = True


# ============================================================
# FUNCTIONS
# ============================================================

def select_level(da, target_level):

    for levname in ["level", "plev", "plev3", "pressure"]:

        if levname in da.coords:

            levels = da[levname].values

            idx = np.argmin(
                np.abs(levels - target_level)
            )

            actual_level = float(levels[idx])

            print(
                f"Selecting {levname} = {actual_level} "
                f"for requested {target_level} hPa"
            )

            return da.sel(
                {levname: levels[idx]}
            )

    raise ValueError(
        "Could not find pressure-level coordinate. "
        "Expected one of: level, plev, plev3, pressure"
    )


def fix_latitude_order(da):

    if "lat" not in da.coords:
        raise ValueError(
            "Latitude coordinate 'lat' not found."
        )

    lat = da["lat"].values

    if lat[0] > lat[-1]:

        print(
            "Reversing latitude to ascending order."
        )

        da = da.sortby("lat")

    return da


def zonal_anomaly(da):

    """
    Remove the zonal mean at each latitude.

    skipna=True is used because 200-hPa height may contain
    terrain-related missing values.
    """

    return (
        da
        - da.mean(
            dim="lon",
            skipna=True
        )
    )


def monthly_climatology(da):

    """
    Long-term calendar-month climatology.

    month=1: mean of all Januarys
    month=2: mean of all Februarys
    ...
    month=12: mean of all Decembers
    """

    return da.groupby("time.month").mean(
        dim="time",
        skipna=True
    )


def check_finite_uv(u, v, name):

    u_np = np.asarray(u.values)
    v_np = np.asarray(v.values)

    bad_u = np.count_nonzero(
        ~np.isfinite(u_np)
    )

    bad_v = np.count_nonzero(
        ~np.isfinite(v_np)
    )

    if bad_u > 0 or bad_v > 0:

        raise ValueError(
            f"{name}: U/V contain non-finite values: "
            f"bad_u={bad_u}, bad_v={bad_v}"
        )


# ============================================================
# ROSSBY WAVE SOURCE
# ============================================================

def calculate_rws(u, v):

    """
    Rossby Wave Source:

        RWS = -eta * div
              - u_chi * d(eta)/dx
              - v_chi * d(eta)/dy

    IMPORTANT:

    RWS is calculated from the individual monthly U/V fields,
    NOT from the long-term monthly climatological winds.
    """

    check_finite_uv(
        u,
        v,
        "RWS"
    )

    w = VectorWind(
        u,
        v,
        rsphere=A
    )

    # Relative vorticity
    vort = w.vorticity()

    # Divergent wind
    uchi, vchi = (
        w.irrotationalcomponent()
    )

    # Horizontal divergence
    div = w.divergence()

    # Coriolis parameter
    lat_rad = np.deg2rad(
        u["lat"]
    )

    f = xr.DataArray(
        2.0 * OMEGA * np.sin(lat_rad),
        coords={
            "lat": u["lat"]
        },
        dims=("lat",)
    )

    # Absolute vorticity
    eta = vort + f

    # Gradient of absolute vorticity
    deta_dx, deta_dy = (
        w.gradient(eta)
    )

    # Rossby Wave Source
    rws = (
        -eta * div
        - uchi * deta_dx
        - vchi * deta_dy
    )

    rws.name = "rws"

    rws.attrs["long_name"] = (
        "Rossby Wave Source"
    )

    rws.attrs["units"] = "s^-2"

    return rws


# ============================================================
# TAKAYA-NAKAMURA WAVE ACTIVITY FLUX
# ============================================================

def tn01_waf_2d(
    u_bg,
    v_bg,
    z_prime
):

    """
    2-D Takaya-Nakamura (2001) wave activity flux.

    INPUT
    -----
    u_bg : xarray.DataArray
        Background zonal wind.

    v_bg : xarray.DataArray
        Background meridional wind.

    z_prime : xarray.DataArray
        Zonal perturbation of geopotential height.

    TN01 streamfunction perturbation:

        psi' = g Z' / f

    Pressure normalization:

        p / 1000 hPa
    """

    # --------------------------------------------------------
    # Make sure latitude is ascending BEFORE exact alignment.
    # --------------------------------------------------------

    u_bg = fix_latitude_order(u_bg)
    v_bg = fix_latitude_order(v_bg)
    z_prime = fix_latitude_order(z_prime)

    # --------------------------------------------------------
    # Make sure U, V, and Z are on exactly the same grid
    # --------------------------------------------------------

    u_bg, v_bg, z_prime = xr.align(
        u_bg,
        v_bg,
        z_prime,
        join="exact"
    )

    # --------------------------------------------------------
    # Original degree coordinates
    # --------------------------------------------------------

    lat_deg_values = u_bg["lat"].values
    lon_deg_values = u_bg["lon"].values

    # --------------------------------------------------------
    # Check that the coordinates are non-empty
    # --------------------------------------------------------

    if len(lat_deg_values) < 2:
        raise ValueError(
            "TN01 WAF: latitude dimension has fewer than "
            "2 points after alignment."
        )

    if len(lon_deg_values) < 2:
        raise ValueError(
            "TN01 WAF: longitude dimension has fewer than "
            "2 points after alignment."
        )

    # --------------------------------------------------------
    # Convert coordinate values to radians
    # --------------------------------------------------------

    lat_values_rad = np.deg2rad(
        lat_deg_values
    )

    lon_values_rad = np.deg2rad(
        lon_deg_values
    )

    # --------------------------------------------------------
    # Assign radian coordinates
    # --------------------------------------------------------

    u_rad = u_bg.assign_coords(
        lat=("lat", lat_values_rad),
        lon=("lon", lon_values_rad)
    )

    v_rad = v_bg.assign_coords(
        lat=("lat", lat_values_rad),
        lon=("lon", lon_values_rad)
    )

    z_rad = z_prime.assign_coords(
        lat=("lat", lat_values_rad),
        lon=("lon", lon_values_rad)
    )

    # --------------------------------------------------------
    # Coriolis parameter
    # --------------------------------------------------------

    f = xr.DataArray(
        2.0
        * OMEGA
        * np.sin(lat_values_rad),
        coords={
            "lat": lat_values_rad
        },
        dims=("lat",),
        name="f"
    )

    # --------------------------------------------------------
    # Geostrophic streamfunction perturbation
    #
    # psi' = g Z' / f
    # --------------------------------------------------------

    psi = (
        G
        * z_rad
        / f
    )

    # --------------------------------------------------------
    # First derivatives
    # --------------------------------------------------------

    psi_lambda = (
        psi.differentiate("lon")
    )

    psi_phi = (
        psi.differentiate("lat")
    )

    # --------------------------------------------------------
    # Second derivatives
    # --------------------------------------------------------

    psi_ll = (
        psi_lambda
        .differentiate("lon")
    )

    psi_phiphi = (
        psi_phi
        .differentiate("lat")
    )

    psi_lphi = (
        psi_lambda
        .differentiate("lat")
    )

    # --------------------------------------------------------
    # Latitude factors
    # --------------------------------------------------------

    cosphi = xr.DataArray(
        np.cos(lat_values_rad),
        coords={
            "lat": lat_values_rad
        },
        dims=("lat",),
        name="cosphi"
    )

    # --------------------------------------------------------
    # TN01 quadratic terms
    # --------------------------------------------------------

    term_xx = (
        psi_lambda**2
        - psi * psi_ll
    )

    term_xy = (
        psi_lambda * psi_phi
        - psi * psi_lphi
    )

    term_yy = (
        psi_phi**2
        - psi * psi_phiphi
    )

    # --------------------------------------------------------
    # Background wind magnitude
    # --------------------------------------------------------

    wind2 = (
        u_rad**2
        + v_rad**2
    )

    windmag = np.sqrt(
        wind2
    )

    # --------------------------------------------------------
    # X component
    # --------------------------------------------------------

    inside_x = (
        u_rad
        / (
            A**2
            * cosphi**2
        )
        * term_xx

        +

        v_rad
        / (
            A**2
            * cosphi
        )
        * term_xy
    )

    # --------------------------------------------------------
    # Y component
    # --------------------------------------------------------

    inside_y = (
        u_rad
        / (
            A**2
            * cosphi
        )
        * term_xy

        +

        v_rad
        / A**2
        * term_yy
    )

    # --------------------------------------------------------
    # TN01 prefactor
    # --------------------------------------------------------

    prefactor = (
        P_NORM
        * cosphi
        / (
            2.0
            * windmag
        )
    )

    # --------------------------------------------------------
    # WAF
    # --------------------------------------------------------

    waf_x = (
        prefactor
        * inside_x
    )

    waf_y = (
        prefactor
        * inside_y
    )

    # --------------------------------------------------------
    # Masks
    # --------------------------------------------------------

    valid_lat = (
        np.abs(
            xr.DataArray(
                lat_deg_values,
                coords={
                    "lat": lat_values_rad
                },
                dims=("lat",)
            )
        )
        >= LAT_MIN_TN01
    )

    valid_wind = (
        wind2
        > WIND2_MIN
    )

    valid = (
        valid_lat
        & valid_wind
    )

    waf_x = waf_x.where(
        valid
    )

    waf_y = waf_y.where(
        valid
    )

    # --------------------------------------------------------
    # Restore degree coordinates
    # --------------------------------------------------------

    waf_x = waf_x.assign_coords(
        lat=("lat", lat_deg_values),
        lon=("lon", lon_deg_values)
    )

    waf_y = waf_y.assign_coords(
        lat=("lat", lat_deg_values),
        lon=("lon", lon_deg_values)
    )

    # --------------------------------------------------------
    # Names and attributes
    # --------------------------------------------------------

    waf_x.name = "waf_x"
    waf_y.name = "waf_y"

    waf_x.attrs["long_name"] = (
        "Takaya-Nakamura wave activity "
        "flux zonal component"
    )

    waf_y.attrs["long_name"] = (
        "Takaya-Nakamura wave activity "
        "flux meridional component"
    )

    waf_x.attrs["units"] = "m2 s-2"
    waf_y.attrs["units"] = "m2 s-2"

    return waf_x, waf_y


# ============================================================
# NEW: BAROTROPIC ROSSBY-WAVE BACKGROUND
# ============================================================

def calculate_absolute_vorticity_gradient(
    u,
    v
):

    """
    Calculate absolute vorticity and its meridional gradient.

    The ray tracing uses

        beta_eff = d(eta)/dy

    where

        eta = zeta + f.

    beta_eff has units of m^-1 s^-1.
    """

    u = fix_latitude_order(u)
    v = fix_latitude_order(v)

    u, v = xr.align(
        u,
        v,
        join="exact"
    )

    w = VectorWind(
        u,
        v,
        rsphere=A
    )

    vort = w.vorticity()

    lat_rad = np.deg2rad(
        u["lat"].values
    )

    f = xr.DataArray(
        2.0
        * OMEGA
        * np.sin(lat_rad),
        coords={
            "lat": u["lat"]
        },
        dims=("lat",)
    )

    eta = (
        vort
        + f
    )

    # Windspharm gradient gives derivatives with respect
    # to physical distance.
    deta_dx, deta_dy = (
        w.gradient(eta)
    )

    deta_dy.name = "beta_eff"

    deta_dy.attrs["long_name"] = (
        "Meridional gradient of absolute vorticity"
    )

    deta_dy.attrs["units"] = "m^-1 s^-1"

    return eta, deta_dy


# ============================================================
# NEW: INTERPOLATE FIELD AT RAY POSITION
# ============================================================

def interpolate_field(
    da,
    lon,
    lat
):

    """
    Bilinear interpolation of an xarray field at one
    longitude/latitude point.

    Longitude is assumed to be in the same convention as
    the input field.
    """

    return float(
        da.interp(
            lon=xr.DataArray(lon),
            lat=xr.DataArray(lat),
            method="linear"
        ).values
    )


# ============================================================
# NEW: STATIONARY ROSSBY-WAVE MERIDIONAL WAVENUMBER
# ============================================================

def stationary_meridional_wavenumber(
    u,
    v,
    beta_eff,
    k
):

    """
    Solve the stationary barotropic Rossby-wave dispersion
    relation for the meridional wavenumber.

    Local beta-plane dispersion relation:

        omega = U k + V l
                - beta k / (k^2 + l^2)

    For a stationary wave:

        omega = 0

    Therefore:

        (U k + V l)(k^2 + l^2)
        - beta k = 0

    This is a cubic equation in l.

    The root closest to the previous meridional wavenumber
    is selected when possible.
    """

    # Polynomial coefficients for:
    #
    # V l^3
    # + U k l^2
    # + V k^2 l
    # + U k^3
    # - beta k = 0

    coeff = [
        v,
        u * k,
        v * k * k,
        u * k * k * k - beta_eff * k
    ]

    # If V is extremely small, the equation reduces to
    # approximately:
    #
    # l^2 = beta/U - k^2
    #
    if abs(v) < 1.0e-8:

        if u <= 0.0:
            return np.nan

        l2 = (
            beta_eff / u
            - k * k
        )

        if l2 <= 0.0:
            return np.nan

        return np.sqrt(
            l2
        ) * RAY_INITIAL_L_SIGN

    roots = np.roots(
        coeff
    )

    real_roots = [
        r.real
        for r in roots
        if abs(r.imag) < 1.0e-8
    ]

    if len(real_roots) == 0:
        return np.nan

    # Select root according to requested sign.
    signed_roots = [
        r
        for r in real_roots
        if np.sign(r) == np.sign(
            RAY_INITIAL_L_SIGN
        )
        or abs(r) < 1.0e-12
    ]

    if len(signed_roots) > 0:
        return signed_roots[0]

    return real_roots[0]


# ============================================================
# NEW: BAROTROPIC STATIONARY RAY TRACING
# ============================================================

def trace_stationary_rossby_wave(
    u_bg,
    v_bg,
    beta_eff,
    source_lon,
    source_lat,
    zonal_wavenumber,
    nsteps,
    dt_hours
):

    """
    Barotropic stationary Rossby-wave ray tracing.

    This is a local beta-plane approximation expressed in
    longitude/latitude coordinates.

    Dispersion relation:

        omega = U k + V l
                - beta k / (k^2 + l^2)

    Stationary wave:

        omega = 0

    Group velocity:

        cg_x =
            U + beta (k^2 - l^2) / K^4

        cg_y =
            V + 2 beta k l / K^4

    where

        K^2 = k^2 + l^2.

    The ray position is advanced according to

        d(lambda)/dt = cg_x / (a cos(phi))

        d(phi)/dt = cg_y / a

    """

    lon = float(source_lon)
    lat = float(source_lat)

    lat0_rad = np.deg2rad(
        lat
    )

    # Convert zonal wavenumber to physical wavenumber.
    #
    # k = m / (a cos(phi))
    #
    k = (
        zonal_wavenumber
        / (
            A
            * np.cos(lat0_rad)
        )
    )

    # Initial background state
    u = interpolate_field(
        u_bg,
        lon,
        lat
    )

    v = interpolate_field(
        v_bg,
        lon,
        lat
    )

    beta = interpolate_field(
        beta_eff,
        lon,
        lat
    )

    l = stationary_meridional_wavenumber(
        u,
        v,
        beta,
        k
    )

    # Output arrays
    lon_out = np.full(
        nsteps + 1,
        np.nan
    )

    lat_out = np.full(
        nsteps + 1,
        np.nan
    )

    k_out = np.full(
        nsteps + 1,
        np.nan
    )

    l_out = np.full(
        nsteps + 1,
        np.nan
    )

    cgx_out = np.full(
        nsteps + 1,
        np.nan
    )

    cgy_out = np.full(
        nsteps + 1,
        np.nan
    )

    beta_out = np.full(
        nsteps + 1,
        np.nan
    )

    u_out = np.full(
        nsteps + 1,
        np.nan
    )

    v_out = np.full(
        nsteps + 1,
        np.nan
    )

    stationary_out = np.full(
        nsteps + 1,
        np.nan
    )

    # Initial state
    lon_out[0] = lon
    lat_out[0] = lat
    k_out[0] = k
    l_out[0] = l

    dt = (
        dt_hours
        * 3600.0
    )

    for n in range(
        nsteps + 1
    ):

        # Stop if latitude leaves allowed range.
        if (
            lat < RAY_LAT_MIN
            or lat > RAY_LAT_MAX
        ):
            break

        # Stop if longitude is outside the data domain.
        lon_min = float(
            u_bg["lon"].min()
        )

        lon_max = float(
            u_bg["lon"].max()
        )

        if (
            lon < lon_min
            or lon > lon_max
        ):
            break

        try:

            u = interpolate_field(
                u_bg,
                lon,
                lat
            )

            v = interpolate_field(
                v_bg,
                lon,
                lat
            )

            beta = interpolate_field(
                beta_eff,
                lon,
                lat
            )

        except Exception:

            break

        if not (
            np.isfinite(u)
            and np.isfinite(v)
            and np.isfinite(beta)
        ):
            break

        if n > 0:

            # Recalculate stationary meridional
            # wavenumber using the local background.
            l_new = (
                stationary_meridional_wavenumber(
                    u,
                    v,
                    beta,
                    k
                )
            )

            if not np.isfinite(l_new):

                if RAY_STOP_IF_NO_STATIONARY_WAVE:
                    break

            else:
                l = l_new

        if not np.isfinite(l):
            break

        K2 = (
            k * k
            + l * l
        )

        K4 = K2 * K2

        if K2 <= 0.0:
            break

        # ----------------------------------------------------
        # Group velocity
        # ----------------------------------------------------

        cgx = (
            u
            + beta
            * (
                k * k
                - l * l
            )
            / K4
        )

        cgy = (
            v
            + 2.0
            * beta
            * k
            * l
            / K4
        )

        # ----------------------------------------------------
        # Stationarity check
        # ----------------------------------------------------

        omega = (
            u * k
            + v * l
            - beta
            * k
            / K2
        )

        # ----------------------------------------------------
        # Save
        # ----------------------------------------------------

        lon_out[n] = lon
        lat_out[n] = lat
        k_out[n] = k
        l_out[n] = l
        cgx_out[n] = cgx
        cgy_out[n] = cgy
        beta_out[n] = beta
        u_out[n] = u
        v_out[n] = v
        stationary_out[n] = omega

        # No need to advance after final step.
        if n == nsteps:
            break

        # ----------------------------------------------------
        # Advance ray position
        # ----------------------------------------------------

        lat_rad = np.deg2rad(
            lat
        )

        coslat = np.cos(
            lat_rad
        )

        if abs(coslat) < 1.0e-6:
            break

        dlon_dt = (
            cgx
            / (
                A
                * coslat
            )
        )

        dlat_dt = (
            cgy
            / A
        )

        lon = (
            lon
            + np.rad2deg(
                dlon_dt
                * dt
            )
        )

        lat = (
            lat
            + np.rad2deg(
                dlat_dt
                * dt
            )
        )

    return {
        "lon": lon_out,
        "lat": lat_out,
        "k": k_out,
        "l": l_out,
        "cgx": cgx_out,
        "cgy": cgy_out,
        "beta": beta_out,
        "u": u_out,
        "v": v_out,
        "omega": stationary_out
    }


# ============================================================
# NEW: FIND RWS SOURCE
# ============================================================

def find_rws_source(
    rws,
    lon_min,
    lon_max,
    lat_min,
    lat_max
):

    """
    Find maximum positive RWS within a specified
    longitude/latitude region.
    """

    # --------------------------------------------------------
    # Make sure coordinates are increasing before slicing.
    # Model longitude is in the 0-360 degree convention.
    # --------------------------------------------------------

    rws = rws.sortby(
        ["lat", "lon"]
    )

    sub = rws.sel(
        lon=slice(
            lon_min,
            lon_max
        ),
        lat=slice(
            lat_min,
            lat_max
        )
    )

    if sub.size == 0:
        raise ValueError(
            "RWS source search region is empty."
        )

    # Maximum positive RWS
    flat_index = np.nanargmax(
        sub.values
    )

    index = np.unravel_index(
        flat_index,
        sub.shape
    )

    lat_index = index[
        sub.dims.index("lat")
    ]

    lon_index = index[
        sub.dims.index("lon")
    ]

    source_lat = float(
        sub["lat"].values[lat_index]
    )

    source_lon = float(
        sub["lon"].values[lon_index]
    )

    source_value = float(
        sub.values[
            index
        ]
    )

    return (
        source_lon,
        source_lat,
        source_value
    )

# ============================================================
# NEW: RUN RAY TRACING
# ============================================================

def calculate_ray_tracing(
    u_exp_jja,
    v_exp_jja,
    u_ctl_jja,
    v_ctl_jja,
    rws_diff_jja
):

    """
    Calculate barotropic stationary Rossby-wave rays.

    The default background is the CTL JJA climatology.

    Rays are initialized around the maximum positive
    EXP-CTL JJA RWS in the western-Pacific source region.
    """

    print(
        "\nCalculating barotropic stationary "
        "Rossby-wave ray tracing..."
    )

    # --------------------------------------------------------
    # Select background state
    # --------------------------------------------------------

    if RAY_BACKGROUND.upper() == "EXP":

        u_bg = u_exp_jja
        v_bg = v_exp_jja

        print(
            "  Ray-tracing background: EXP JJA"
        )

    else:

        u_bg = u_ctl_jja
        v_bg = v_ctl_jja

        print(
            "  Ray-tracing background: CTL JJA"
        )

    # --------------------------------------------------------
    # Calculate effective beta
    # --------------------------------------------------------

    print(
        "  Calculating meridional gradient of "
        "absolute vorticity..."
    )

    eta_bg, beta_eff = (
        calculate_absolute_vorticity_gradient(
            u_bg,
            v_bg
        )
    )

    # --------------------------------------------------------
    # Find RWS source
    # --------------------------------------------------------

    (
        source_lon,
        source_lat,
        source_rws
    ) = find_rws_source(
        rws_diff_jja,
        RAY_SOURCE_LON_MIN,
        RAY_SOURCE_LON_MAX,
        RAY_SOURCE_LAT_MIN,
        RAY_SOURCE_LAT_MAX
    )

    print(
        "  RWS source:"
    )

    print(
        f"    longitude = {source_lon:.2f}"
    )

    print(
        f"    latitude  = {source_lat:.2f}"
    )

    print(
        f"    RWS       = {source_rws:.6e} s^-2"
    )

    # --------------------------------------------------------
    # Ray starting positions
    # --------------------------------------------------------

    if RAY_N_RAYS == 1:

        start_lons = [
            source_lon
        ]

        start_lats = [
            source_lat
        ]

    else:

        nside = int(
            np.ceil(
                np.sqrt(
                    RAY_N_RAYS
                )
            )
        )

        lon_offsets = np.linspace(
            -RAY_SOURCE_LON_SPREAD,
            RAY_SOURCE_LON_SPREAD,
            nside
        )

        lat_offsets = np.linspace(
            -RAY_SOURCE_LAT_SPREAD,
            RAY_SOURCE_LAT_SPREAD,
            nside
        )

        start_lons = []
        start_lats = []

        for dlat in lat_offsets:

            for dlon in lon_offsets:

                start_lons.append(
                    source_lon + dlon
                )

                start_lats.append(
                    source_lat + dlat
                )

                if len(start_lons) >= RAY_N_RAYS:
                    break

            if len(start_lons) >= RAY_N_RAYS:
                break

    # --------------------------------------------------------
    # Trace each ray
    # --------------------------------------------------------

    rays = []

    for iray in range(
        len(start_lons)
    ):

        print(
            f"  Tracing ray "
            f"{iray + 1:02d}/{len(start_lons):02d}..."
        )

        ray = trace_stationary_rossby_wave(
            u_bg,
            v_bg,
            beta_eff,
            start_lons[iray],
            start_lats[iray],
            RAY_ZONAL_WAVENUMBER,
            RAY_NSTEPS,
            RAY_DT_HOURS
        )

        rays.append(
            ray
        )

    # --------------------------------------------------------
    # Convert rays to xarray Dataset
    # --------------------------------------------------------

    maxlen = max(
        len(ray["lon"])
        for ray in rays
    )

    ray_lon = np.full(
        (
            len(rays),
            maxlen
        ),
        np.nan
    )

    ray_lat = np.full(
        (
            len(rays),
            maxlen
        ),
        np.nan
    )

    ray_k = np.full(
        (
            len(rays),
            maxlen
        ),
        np.nan
    )

    ray_l = np.full(
        (
            len(rays),
            maxlen
        ),
        np.nan
    )

    ray_cgx = np.full(
        (
            len(rays),
            maxlen
        ),
        np.nan
    )

    ray_cgy = np.full(
        (
            len(rays),
            maxlen
        ),
        np.nan
    )

    ray_beta = np.full(
        (
            len(rays),
            maxlen
        ),
        np.nan
    )

    ray_u = np.full(
        (
            len(rays),
            maxlen
        ),
        np.nan
    )

    ray_v = np.full(
        (
            len(rays),
            maxlen
        ),
        np.nan
    )

    ray_omega = np.full(
        (
            len(rays),
            maxlen
        ),
        np.nan
    )

    for iray, ray in enumerate(
        rays
    ):

        n = len(
            ray["lon"]
        )

        ray_lon[
            iray,
            :n
        ] = ray["lon"]

        ray_lat[
            iray,
            :n
        ] = ray["lat"]

        ray_k[
            iray,
            :n
        ] = ray["k"]

        ray_l[
            iray,
            :n
        ] = ray["l"]

        ray_cgx[
            iray,
            :n
        ] = ray["cgx"]

        ray_cgy[
            iray,
            :n
        ] = ray["cgy"]

        ray_beta[
            iray,
            :n
        ] = ray["beta"]

        ray_u[
            iray,
            :n
        ] = ray["u"]

        ray_v[
            iray,
            :n
        ] = ray["v"]

        ray_omega[
            iray,
            :n
        ] = ray["omega"]

    ds = xr.Dataset(
        {
            "ray_lon": (
                ("ray", "step"),
                ray_lon
            ),

            "ray_lat": (
                ("ray", "step"),
                ray_lat
            ),

            "k": (
                ("ray", "step"),
                ray_k
            ),

            "l": (
                ("ray", "step"),
                ray_l
            ),

            "group_velocity_x": (
                ("ray", "step"),
                ray_cgx
            ),

            "group_velocity_y": (
                ("ray", "step"),
                ray_cgy
            ),

            "beta_eff": (
                ("ray", "step"),
                ray_beta
            ),

            "background_u": (
                ("ray", "step"),
                ray_u
            ),

            "background_v": (
                ("ray", "step"),
                ray_v
            ),

            "omega": (
                ("ray", "step"),
                ray_omega
            )
        }
    )

    ds = ds.assign_coords(
        ray=np.arange(
            len(rays)
        ),

        step=np.arange(
            maxlen
        )
    )

    ds.attrs["description"] = (
        "Barotropic stationary Rossby-wave ray tracing"
    )

    ds.attrs["background"] = (
        f"{RAY_BACKGROUND} JJA 200-hPa climatology"
    )

    ds.attrs["source_longitude"] = (
        source_lon
    )

    ds.attrs["source_latitude"] = (
        source_lat
    )

    ds.attrs["source_rws"] = (
        source_rws
    )

    ds.attrs["zonal_wavenumber"] = (
        RAY_ZONAL_WAVENUMBER
    )

    ds.attrs["dt_hours"] = (
        RAY_DT_HOURS
    )

    ds.attrs["stationary_wave"] = (
        "omega = 0"
    )

    ds.attrs["dispersion_relation"] = (
        "omega = U*k + V*l "
        "- beta*k/(k^2+l^2)"
    )

    return ds


# ============================================================
# OPEN EXPERIMENT DATA
# ============================================================

print("\nOpening EXPERIMENT files...")

decoder = xr.coders.CFDatetimeCoder(
    use_cftime=True
)

ue_ds = xr.open_dataset(
    os.path.join(
        EXP_DIR,
        U_FILE
    ),
    decode_times=decoder
)

ve_ds = xr.open_dataset(
    os.path.join(
        EXP_DIR,
        V_FILE
    ),
    decode_times=decoder
)

ze_ds = xr.open_dataset(
    os.path.join(
        EXP_DIR,
        Z_FILE
    ),
    decode_times=decoder
)


# ============================================================
# OPEN CONTROL DATA
# ============================================================

print("\nOpening CONTROL files...")

uc_ds = xr.open_dataset(
    os.path.join(
        CTL_DIR,
        U_FILE
    ),
    decode_times=decoder
)

vc_ds = xr.open_dataset(
    os.path.join(
        CTL_DIR,
        V_FILE
    ),
    decode_times=decoder
)

zc_ds = xr.open_dataset(
    os.path.join(
        CTL_DIR,
        Z_FILE
    ),
    decode_times=decoder
)


# ============================================================
# FIND VARIABLES
# ============================================================

def find_variable(
    ds,
    possible_names
):

    for name in possible_names:

        if name in ds.data_vars:
            return ds[name]

    raise ValueError(
        f"Could not find variable among "
        f"{possible_names}. "
        f"Available variables: "
        f"{list(ds.data_vars)}"
    )


ue = find_variable(
    ue_ds,
    ["ucomp", "ua", "u", "U"]
)

ve = find_variable(
    ve_ds,
    ["vcomp", "va", "v", "V"]
)

ze = find_variable(
    ze_ds,
    ["hght", "zg", "z", "height"]
)

uc = find_variable(
    uc_ds,
    ["ucomp", "ua", "u", "U"]
)

vc = find_variable(
    vc_ds,
    ["vcomp", "va", "v", "V"]
)

zc = find_variable(
    zc_ds,
    ["hght", "zg", "z", "height"]
)


# ============================================================
# SELECT 200 hPa
# ============================================================

print("\nSelecting 200 hPa...")

ue = select_level(
    ue,
    TARGET_LEVEL
)

ve = select_level(
    ve,
    TARGET_LEVEL
)

ze = select_level(
    ze,
    TARGET_LEVEL
)

uc = select_level(
    uc,
    TARGET_LEVEL
)

vc = select_level(
    vc,
    TARGET_LEVEL
)

zc = select_level(
    zc,
    TARGET_LEVEL
)


# ============================================================
# FIX LATITUDE ORDER
# ============================================================

ue = fix_latitude_order(ue)
ve = fix_latitude_order(ve)
ze = fix_latitude_order(ze)

uc = fix_latitude_order(uc)
vc = fix_latitude_order(vc)
zc = fix_latitude_order(zc)


# ============================================================
# SELECT ANALYSIS PERIOD
# ============================================================

print(
    f"\nSelecting years "
    f"{START_YEAR:04d}-{END_YEAR:04d}..."
)


def select_years(da):

    return da.sel(
        time=slice(
            f"{START_YEAR:04d}-01-01",
            f"{END_YEAR:04d}-12-31"
        )
    )


ue = select_years(ue)
ve = select_years(ve)
ze = select_years(ze)

uc = select_years(uc)
vc = select_years(vc)
zc = select_years(zc)


print(
    "Number of EXP months:",
    ue.sizes["time"]
)

print(
    "Number of CTL months:",
    uc.sizes["time"]
)


# ============================================================
# CHECK TIME
# ============================================================

if ue.sizes["time"] != uc.sizes["time"]:

    raise ValueError(
        "EXP and CTL have different "
        "numbers of time records."
    )


if not np.array_equal(
    ue["time"].values,
    uc["time"].values
):

    raise ValueError(
        "EXP and CTL time coordinates do not match."
    )


# ============================================================
# LONG-TERM MONTHLY CLIMATOLOGY
# ============================================================

print(
    "\nCalculating long-term monthly climatologies..."
)

print(
    "  EXP U/V monthly climatology..."
)

ue_clim = monthly_climatology(
    ue
)

ve_clim = monthly_climatology(
    ve
)

print(
    "  CTL U/V monthly climatology..."
)

uc_clim = monthly_climatology(
    uc
)

vc_clim = monthly_climatology(
    vc
)

print(
    "  EXP height monthly climatology..."
)

ze_clim = monthly_climatology(
    ze
)

print(
    "  CTL height monthly climatology..."
)

zc_clim = monthly_climatology(
    zc
)

print(
    "  EXP climatological zonal height perturbation..."
)

ze_prime_clim = zonal_anomaly(
    ze_clim
)

print(
    "  CTL climatological zonal height perturbation..."
)

zc_prime_clim = zonal_anomaly(
    zc_clim
)

print(
    "  EXP-CTL height response..."
)

z_response = (
    ze - zc
)

print(
    "  Long-term monthly mean EXP-CTL height response..."
)

z_response_clim = monthly_climatology(
    z_response
)

print(
    "  Zonal height perturbation of response..."
)

z_response_prime_clim = zonal_anomaly(
    z_response_clim
)


# ============================================================
# CHECK CLIMATOLOGICAL WIND FIELDS
# ============================================================

print(
    "\nChecking climatological background winds..."
)

for month in range(1, 13):

    check_finite_uv(
        ue_clim.sel(month=month),
        ve_clim.sel(month=month),
        f"EXP climatology month {month}"
    )

    check_finite_uv(
        uc_clim.sel(month=month),
        vc_clim.sel(month=month),
        f"CTL climatology month {month}"
    )


# ============================================================
# CALCULATE CLIMATOLOGICAL WAF
# ============================================================

print(
    "\nCalculating monthly climatological TN01 WAF..."
)

waf_x_exp_clim = []
waf_y_exp_clim = []

waf_x_ctl_clim = []
waf_y_ctl_clim = []

waf_x_diff_clim = []
waf_y_diff_clim = []

waf_x_response_clim = []
waf_y_response_clim = []


for month in range(1, 13):

    print(
        f"  Calculating WAF for month {month:02d}..."
    )

    u_exp_bg = ue_clim.sel(
        month=month
    )

    v_exp_bg = ve_clim.sel(
        month=month
    )

    u_ctl_bg = uc_clim.sel(
        month=month
    )

    v_ctl_bg = vc_clim.sel(
        month=month
    )

    zp_exp = ze_prime_clim.sel(
        month=month
    )

    zp_ctl = zc_prime_clim.sel(
        month=month
    )

    zp_response = (
        z_response_prime_clim.sel(
            month=month
        )
    )

    waf_x_exp, waf_y_exp = (
        tn01_waf_2d(
            u_exp_bg,
            v_exp_bg,
            zp_exp
        )
    )

    waf_x_ctl, waf_y_ctl = (
        tn01_waf_2d(
            u_ctl_bg,
            v_ctl_bg,
            zp_ctl
        )
    )

    waf_x_diff = (
        waf_x_exp
        - waf_x_ctl
    )

    waf_y_diff = (
        waf_y_exp
        - waf_y_ctl
    )

    waf_x_response, waf_y_response = (
        tn01_waf_2d(
            u_ctl_bg,
            v_ctl_bg,
            zp_response
        )
    )

    waf_x_exp_clim.append(
        waf_x_exp
    )

    waf_y_exp_clim.append(
        waf_y_exp
    )

    waf_x_ctl_clim.append(
        waf_x_ctl
    )

    waf_y_ctl_clim.append(
        waf_y_ctl
    )

    waf_x_diff_clim.append(
        waf_x_diff
    )

    waf_y_diff_clim.append(
        waf_y_diff
    )

    waf_x_response_clim.append(
        waf_x_response
    )

    waf_y_response_clim.append(
        waf_y_response
    )


# ============================================================
# CONVERT WAF LISTS TO XARRAY
# ============================================================

print(
    "\nConverting WAF climatologies to xarray..."
)

waf_x_exp_clim = xr.concat(
    waf_x_exp_clim,
    dim="month"
)

waf_y_exp_clim = xr.concat(
    waf_y_exp_clim,
    dim="month"
)

waf_x_ctl_clim = xr.concat(
    waf_x_ctl_clim,
    dim="month"
)

waf_y_ctl_clim = xr.concat(
    waf_y_ctl_clim,
    dim="month"
)

waf_x_diff_clim = xr.concat(
    waf_x_diff_clim,
    dim="month"
)

waf_y_diff_clim = xr.concat(
    waf_y_diff_clim,
    dim="month"
)

waf_x_response_clim = xr.concat(
    waf_x_response_clim,
    dim="month"
)

waf_y_response_clim = xr.concat(
    waf_y_response_clim,
    dim="month"
)


# ============================================================
# RWS CALCULATION
# ============================================================

print(
    "\nCalculating monthly RWS..."
)

rws_exp = []
rws_ctl = []

nmonths = ue.sizes["time"]

for it in range(nmonths):

    print(
        f"  RWS month "
        f"{it + 1:04d}/{nmonths:04d}",
        end="\r"
    )

    u_exp = ue.isel(
        time=it
    )

    v_exp = ve.isel(
        time=it
    )

    u_ctl = uc.isel(
        time=it
    )

    v_ctl = vc.isel(
        time=it
    )

    rws_exp.append(
        calculate_rws(
            u_exp,
            v_exp
        )
    )

    rws_ctl.append(
        calculate_rws(
            u_ctl,
            v_ctl
        )
    )

print()


# ============================================================
# CONVERT RWS LISTS TO XARRAY
# ============================================================

print(
    "\nConverting RWS to xarray..."
)

rws_exp = xr.concat(
    rws_exp,
    dim="time"
)

rws_ctl = xr.concat(
    rws_ctl,
    dim="time"
)

rws_exp = rws_exp.assign_coords(
    time=ue["time"]
)

rws_ctl = rws_ctl.assign_coords(
    time=uc["time"]
)


# ============================================================
# RWS DIFFERENCE
# ============================================================

print(
    "\nCalculating EXP-CTL RWS difference..."
)

rws_diff = (
    rws_exp
    - rws_ctl
)

rws_diff.name = "rws_diff"

rws_diff.attrs["long_name"] = (
    "EXP minus CTL Rossby Wave Source"
)

rws_diff.attrs["units"] = "s^-2"


# ============================================================
# MONTHLY RWS CLIMATOLOGIES
# ============================================================

print(
    "\nCalculating monthly RWS climatologies..."
)

rws_exp_clim = monthly_climatology(
    rws_exp
)

rws_ctl_clim = monthly_climatology(
    rws_ctl
)

rws_diff_clim = monthly_climatology(
    rws_diff
)


# ============================================================
# JJA MEANS
# ============================================================

print(
    "\nCalculating JJA means..."
)

rws_exp_jja = (
    rws_exp
    .where(
        rws_exp["time"].dt.month.isin(
            [6, 7, 8]
        ),
        drop=True
    )
    .mean(
        dim="time",
        skipna=True
    )
)

rws_ctl_jja = (
    rws_ctl
    .where(
        rws_ctl["time"].dt.month.isin(
            [6, 7, 8]
        ),
        drop=True
    )
    .mean(
        dim="time",
        skipna=True
    )
)

rws_diff_jja = (
    rws_diff
    .where(
        rws_diff["time"].dt.month.isin(
            [6, 7, 8]
        ),
        drop=True
    )
    .mean(
        dim="time",
        skipna=True
    )
)


# ============================================================
# JJA WAF
# ============================================================

print(
    "\nCalculating JJA WAF..."
)

u_exp_jja = (
    ue
    .where(
        ue["time"].dt.month.isin(
            [6, 7, 8]
        ),
        drop=True
    )
    .mean(
        dim="time",
        skipna=True
    )
)

v_exp_jja = (
    ve
    .where(
        ve["time"].dt.month.isin(
            [6, 7, 8]
        ),
        drop=True
    )
    .mean(
        dim="time",
        skipna=True
    )
)

u_ctl_jja = (
    uc
    .where(
        uc["time"].dt.month.isin(
            [6, 7, 8]
        ),
        drop=True
    )
    .mean(
        dim="time",
        skipna=True
    )
)

v_ctl_jja = (
    vc
    .where(
        vc["time"].dt.month.isin(
            [6, 7, 8]
        ),
        drop=True
    )
    .mean(
        dim="time",
        skipna=True
    )
)

z_exp_jja = (
    ze
    .where(
        ze["time"].dt.month.isin(
            [6, 7, 8]
        ),
        drop=True
    )
    .mean(
        dim="time",
        skipna=True
    )
)

z_ctl_jja = (
    zc
    .where(
        zc["time"].dt.month.isin(
            [6, 7, 8]
        ),
        drop=True
    )
    .mean(
        dim="time",
        skipna=True
    )
)

z_response_jja = (
    z_exp_jja
    - z_ctl_jja
)

z_exp_jja_prime = zonal_anomaly(
    z_exp_jja
)

z_ctl_jja_prime = zonal_anomaly(
    z_ctl_jja
)

z_response_jja_prime = zonal_anomaly(
    z_response_jja
)

waf_x_exp_jja, waf_y_exp_jja = (
    tn01_waf_2d(
        u_exp_jja,
        v_exp_jja,
        z_exp_jja_prime
    )
)

waf_x_ctl_jja, waf_y_ctl_jja = (
    tn01_waf_2d(
        u_ctl_jja,
        v_ctl_jja,
        z_ctl_jja_prime
    )
)

waf_x_diff_jja = (
    waf_x_exp_jja
    - waf_x_ctl_jja
)

waf_y_diff_jja = (
    waf_y_exp_jja
    - waf_y_ctl_jja
)

waf_x_response_jja, waf_y_response_jja = (
    tn01_waf_2d(
        u_ctl_jja,
        v_ctl_jja,
        z_response_jja_prime
    )
)


# ============================================================
# NEW: BAROTROPIC STATIONARY RAY TRACING
# ============================================================

ray_tracing = calculate_ray_tracing(
    u_exp_jja,
    v_exp_jja,
    u_ctl_jja,
    v_ctl_jja,
    rws_diff_jja
)


# ============================================================
# CREATE OUTPUT DIRECTORY
# ============================================================

os.makedirs(
    OUT_DIR,
    exist_ok=True
)


# ============================================================
# SAVE MONTHLY RWS
# ============================================================

print(
    "\nSaving monthly RWS..."
)

rws_exp.to_netcdf(
    os.path.join(
        OUT_DIR,
        "rws_exp_monthly.nc"
    )
)

rws_ctl.to_netcdf(
    os.path.join(
        OUT_DIR,
        "rws_ctl_monthly.nc"
    )
)

rws_diff.to_netcdf(
    os.path.join(
        OUT_DIR,
        "rws_diff_monthly.nc"
    )
)


# ============================================================
# SAVE MONTHLY RWS CLIMATOLOGIES
# ============================================================

print(
    "Saving monthly RWS climatologies..."
)

rws_exp_clim.to_netcdf(
    os.path.join(
        OUT_DIR,
        "rws_exp_monthly_clim.nc"
    )
)

rws_ctl_clim.to_netcdf(
    os.path.join(
        OUT_DIR,
        "rws_ctl_monthly_clim.nc"
    )
)

rws_diff_clim.to_netcdf(
    os.path.join(
        OUT_DIR,
        "rws_diff_monthly_clim.nc"
    )
)


# ============================================================
# SAVE JJA RWS
# ============================================================

print(
    "Saving JJA RWS..."
)

rws_exp_jja.to_netcdf(
    os.path.join(
        OUT_DIR,
        "rws_exp_JJA.nc"
    )
)

rws_ctl_jja.to_netcdf(
    os.path.join(
        OUT_DIR,
        "rws_ctl_JJA.nc"
    )
)

rws_diff_jja.to_netcdf(
    os.path.join(
        OUT_DIR,
        "rws_diff_JJA.nc"
    )
)


# ============================================================
# SAVE MONTHLY WAF CLIMATOLOGIES
# ============================================================

print(
    "Saving monthly WAF climatologies..."
)

waf_x_exp_clim.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_x_exp_monthly_clim.nc"
    )
)

waf_y_exp_clim.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_y_exp_monthly_clim.nc"
    )
)

waf_x_ctl_clim.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_x_ctl_monthly_clim.nc"
    )
)

waf_y_ctl_clim.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_y_ctl_monthly_clim.nc"
    )
)

waf_x_diff_clim.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_x_diff_monthly_clim.nc"
    )
)

waf_y_diff_clim.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_y_diff_monthly_clim.nc"
    )
)

waf_x_response_clim.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_x_response_monthly_clim.nc"
    )
)

waf_y_response_clim.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_y_response_monthly_clim.nc"
    )
)


# ============================================================
# SAVE JJA WAF
# ============================================================

print(
    "Saving JJA WAF..."
)

waf_x_exp_jja.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_x_exp_JJA.nc"
    )
)

waf_y_exp_jja.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_y_exp_JJA.nc"
    )
)

waf_x_ctl_jja.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_x_ctl_JJA.nc"
    )
)

waf_y_ctl_jja.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_y_ctl_JJA.nc"
    )
)

waf_x_diff_jja.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_x_diff_JJA.nc"
    )
)

waf_y_diff_jja.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_y_diff_JJA.nc"
    )
)

waf_x_response_jja.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_x_response_JJA.nc"
    )
)

waf_y_response_jja.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_y_response_JJA.nc"
    )
)


# ============================================================
# NEW: SAVE RAY TRACING
# ============================================================

print(
    "Saving barotropic stationary Rossby-wave rays..."
)

ray_tracing.to_netcdf(
    os.path.join(
        OUT_DIR,
        "rossby_wave_ray_tracing_JJA.nc"
    )
)


# ============================================================
# FINISHED
# ============================================================

print(
    "\nAll RWS, WAF, and Rossby-wave ray-tracing "
    "calculations completed successfully."
)

print(
    f"Output directory: {OUT_DIR}"
)

print(
    "\nRay-tracing output:"
)

print(
    os.path.join(
        OUT_DIR,
        "rossby_wave_ray_tracing_JJA.nc"
    )
)
