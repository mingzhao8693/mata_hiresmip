#!/usr/bin/env python

import numpy as np
import xarray as xr

from windspharm.xarray import VectorWind


# ============================================================
# USER SETTINGS
# ============================================================

TARGET_LEVEL = 200.0

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
# BAROTROPIC STATIONARY ROSSBY-WAVE RAY TRACING
# ============================================================

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
# positive RWS within this region.
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

    for levname in ["level", "plev", "plev3", "pressure", "pressure_level"]:

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
        "Expected one of: level, plev, plev3, pressure, pressure_level"
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

    # RWS stretching term
    rws_stretch = (
        -eta * div
    )

    rws_stretch.name = "rws_stretch"

    rws_stretch.attrs["long_name"] = (
        "Rossby Wave Source stretching term"
    )

    rws_stretch.attrs["units"] = "s^-2"

    # RWS vorticity-advection term
    rws_advect = (
        -uchi * deta_dx
        - vchi * deta_dy
    )

    rws_advect.name = "rws_advect"

    rws_advect.attrs["long_name"] = (
        "Rossby Wave Source vorticity-advection term"
    )

    rws_advect.attrs["units"] = "s^-2"

    # Total Rossby Wave Source
    rws = (
        rws_stretch
        + rws_advect
    )

    rws.name = "rws"

    rws.attrs["long_name"] = (
        "Rossby Wave Source"
    )

    rws.attrs["units"] = "s^-2"

    return xr.Dataset({
        "rws": rws,
        "rws_stretch": rws_stretch,
        "rws_advect": rws_advect
    })

# ============================================================
# TAKAYA-NAKAMURA WAVE ACTIVITY FLUX
# ============================================================

def tn01_waf_2d(
    u_bg,
    v_bg,
    z_prime,
    print_diagnostics=True
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

    For the spatial derivatives, f is treated as locally
    constant, following the TN01 geostrophic approximation.

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
    # Derivatives of geopotential-height perturbation
    #
    # f is treated as locally constant during spatial
    # differentiation, following the TN01 formulation.
    # --------------------------------------------------------

    # Longitude: periodic centered differences
    # lon is in radians and represents a global 0--2pi grid.
    dlon = float(lon_values_rad[1] - lon_values_rad[0])
    if not np.allclose(
            np.diff(lon_values_rad),
            dlon,
            rtol=1e-10,
            atol=1e-12
    ):
        raise ValueError("Longitude grid must be uniformly spaced.")
    
    dZ_dlon = (
        z_rad.roll(lon=-1, roll_coords=False)
        - z_rad.roll(lon=1, roll_coords=False)
    ) / (2.0 * dlon)
    
    d2Z_dlon2 = (
        z_rad.roll(lon=-1, roll_coords=False)
        - 2.0 * z_rad
        + z_rad.roll(lon=1, roll_coords=False)
    ) / (dlon**2)

    # --------------------------------------------------------
    # Latitude derivatives
    #
    # Latitude is NOT periodic.
    # Use centered first derivative and an explicit centered
    # second derivative so that d2/dphi2 uses the standard
    # nearest-neighbor 3-point stencil.
    # --------------------------------------------------------
    
    dlat = float(lat_values_rad[1] - lat_values_rad[0])

    if not np.allclose(
            np.diff(lat_values_rad),
            dlat,
            rtol=1e-10,
            atol=1e-12
    ):
        raise ValueError(
            "Latitude grid must be uniformly spaced."
        )

    # First latitude derivative
    dZ_dlat = z_rad.differentiate(
        "lat",
        edge_order=2
    )

    # Second latitude derivative
    # Do NOT use roll here because latitude is not periodic.
    d2Z_dlat2 = (
        z_rad.shift(lat=-1)
        - 2.0 * z_rad
        + z_rad.shift(lat=1)
    ) / (dlat**2)

    # Mixed derivative:
    # first periodic longitude derivative,
    # then latitude derivative
    d2Z_dlondlat = dZ_dlon.differentiate(
        "lat",
        edge_order=2
    )
    # --------------------------------------------------------
    # Streamfunction derivatives
    #
    # f is NOT differentiated here.
    # --------------------------------------------------------

    psi_lambda = (
        G
        / f
        * dZ_dlon
    )

    psi_phi = (
        G
        / f
        * dZ_dlat
    )

    psi_ll = (
        G
        / f
        * d2Z_dlon2
    )

    psi_phiphi = (
        G
        / f
        * d2Z_dlat2
    )

    psi_lphi = (
        G
        / f
        * d2Z_dlondlat
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
    # WAF component diagnostics
    #
    # F_x = F_x(U term) + F_x(V term)
    # F_y = F_y(U term) + F_y(V term)
    # --------------------------------------------------------

    fx_u = (
        prefactor
        * u_rad
        / (
            A**2
            * cosphi**2
        )
        * term_xx
    )

    fx_v = (
        prefactor
        * v_rad
        / (
            A**2
            * cosphi
        )
        * term_xy
    )

    fy_u = (
        prefactor
        * u_rad
        / (
            A**2
            * cosphi
        )
        * term_xy
    )

    fy_v = (
        prefactor
        * v_rad
        / A**2
        * term_yy
    )

    # --------------------------------------------------------
    # Total WAF
    # --------------------------------------------------------

    waf_x = (
        fx_u
        + fx_v
    )

    waf_y = (
        fy_u
        + fy_v
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

    # --------------------------------------------------------
    # Print RMS diagnostics
    #
    # Use the same valid mask as the final WAF.
    # --------------------------------------------------------

    if print_diagnostics:
        
        print("  TN01 WAF component RMS:")

        for name, da in [
                ("fx_u", fx_u),
                ("fx_v", fx_v),
                ("fy_u", fy_u),
                ("fy_v", fy_v),
                ("waf_x", waf_x),
                ("waf_y", waf_y),
                ("psi", psi),
                ("psi_lambda", psi_lambda),
                ("psi_phi", psi_phi),
                ("psi_ll", psi_ll),
                ("psi_phiphi", psi_phiphi),
                ("psi_lphi", psi_lphi),
                ("psi_phi_sq", psi_phi**2),
                ("psi_psiphiphi", psi * psi_phiphi),
                ("term_xx", term_xx),
                ("term_xy", term_xy),
                ("term_yy", term_yy),
        ]:

            da_valid = da.where(valid)

            rms = np.sqrt(
                float(
                    (da_valid**2).mean(
                        skipna=True
                    )
                )
            )
            
            print(
                f"    {name:8s} RMS = {rms:.6e}"
            )

    # --------------------------------------------------------
    # Apply masks to total WAF
    # --------------------------------------------------------

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
    Bilinear interpolation returning a scalar float safely.
    """

    try:

        val = da.interp(
            lon=lon,
            lat=lat,
            method="linear"
        ).values

        if np.size(val) != 1:
            return np.nan

        return float(np.asarray(val).item())

    except Exception:

        return np.nan

# ============================================================
# NEW: STATIONARY ROSSBY-WAVE MERIDIONAL WAVENUMBER
# ============================================================
def stationary_meridional_wavenumber(
    u,
    v,
    beta_eff,
    k,
    previous_l=np.nan
):
    u = float(u)
    v = float(v)
    beta_eff = float(beta_eff)
    k = float(k)

    if not (
        np.isfinite(u)
        and np.isfinite(v)
        and np.isfinite(beta_eff)
        and np.isfinite(k)
    ):
        return np.nan

    if k <= 0.0:
        return np.nan

    V_TOL = 1.0e-8

    # --------------------------------------------------------
    # Analytic solution for V approx 0
    # --------------------------------------------------------
    if abs(v) < V_TOL:
        if u <= 0.0:
            return np.nan

        l2 = beta_eff / u - k * k
        if l2 <= 0.0:
            return np.nan

        l_abs = np.sqrt(l2)

        if np.isfinite(previous_l):
            return -l_abs if previous_l < 0.0 else l_abs

        return l_abs * np.sign(RAY_INITIAL_L_SIGN)

    # --------------------------------------------------------
    # Cubic solver
    # --------------------------------------------------------
    coeff = [
        float(v),
        float(u * k),
        float(v * k * k),
        float(u * k * k * k - beta_eff * k)
    ]

    coeff_scale = max(1.0, *(abs(c) for c in coeff))

    if abs(coeff[0]) < V_TOL * coeff_scale:
        a2, b2, c2 = coeff[1], coeff[2], coeff[3]
        if abs(a2) < V_TOL * max(1.0, abs(b2), abs(c2)):
            if abs(b2) < V_TOL:
                return np.nan
            roots = [-c2 / b2]
        else:
            roots = np.roots([float(a2), float(b2), float(c2)])
    else:
        roots = np.roots(coeff)

    # Extract real roots
    real_roots = []
    for root in roots:
        root = complex(root)
        if abs(root.imag) < 1.0e-8 and np.isfinite(root.real):
            real_roots.append(float(root.real))

    if len(real_roots) == 0:
        return np.nan

    # --------------------------------------------------------
    # Root selection:
    # 1. Prefer continuity with previous_l if available
    # 2. Otherwise use RAY_INITIAL_L_SIGN
    # --------------------------------------------------------
    if np.isfinite(previous_l):
        return min(real_roots, key=lambda root: abs(root - previous_l))

    sign_target = np.sign(RAY_INITIAL_L_SIGN)
    signed_roots = [
        root for root in real_roots
        if np.sign(root) == sign_target or abs(root) < 1.0e-12
    ]

    return signed_roots[0] if len(signed_roots) > 0 else real_roots[0]

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
    lon = float(source_lon)
    lat = float(source_lat)
    dt = float(dt_hours) * 3600.0

    lon_out = np.full(nsteps + 1, np.nan)
    lat_out = np.full(nsteps + 1, np.nan)
    k_out = np.full(nsteps + 1, np.nan)
    l_out = np.full(nsteps + 1, np.nan)
    cgx_out = np.full(nsteps + 1, np.nan)
    cgy_out = np.full(nsteps + 1, np.nan)
    beta_out = np.full(nsteps + 1, np.nan)
    u_out = np.full(nsteps + 1, np.nan)
    v_out = np.full(nsteps + 1, np.nan)
    stationary_out = np.full(nsteps + 1, np.nan)

    l = np.nan

    lon_min = float(u_bg["lon"].min())
    lon_max = float(u_bg["lon"].max())

    for n in range(nsteps + 1):
        if lat < RAY_LAT_MIN or lat > RAY_LAT_MAX:
            break

        # Adaptively handle longitude wrapping based on dataset coordinate domain
        if lon_min >= 0 and lon_max > 180:
            lon = lon % 360.0
        elif lon_min < 0:
            lon = (lon + 180.0) % 360.0 - 180.0

        if lon < lon_min or lon > lon_max:
            break

        lat_rad = np.deg2rad(lat)
        coslat = np.cos(lat_rad)
        if abs(coslat) < 1.0e-6:
            break

        # Dynamic physical wavenumber calculation: k = m / (a * cos(phi))
        k = float(zonal_wavenumber) / (A * coslat)

        u = interpolate_field(u_bg, lon, lat)
        v = interpolate_field(v_bg, lon, lat)
        beta = interpolate_field(beta_eff, lon, lat)

        if not (np.isfinite(u) and np.isfinite(v) and np.isfinite(beta)):
            break

        l_new = stationary_meridional_wavenumber(
            u, v, beta, k, previous_l=l
        )

        if not np.isfinite(l_new):
            if RAY_STOP_IF_NO_STATIONARY_WAVE:
                break
        else:
            l = l_new

        if not np.isfinite(l):
            break

        K2 = k * k + l * l
        if K2 <= 0.0:
            break

        K4 = K2 * K2

        cgx = u + beta * (k * k - l * l) / K4
        cgy = v + 2.0 * beta * k * l / K4
        omega = u * k + v * l - beta * k / K2

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

        if n == nsteps:
            break

        dlon_dt = cgx / (A * coslat)
        dlat_dt = cgy / A

        lon += np.rad2deg(dlon_dt * dt)
        lat += np.rad2deg(dlat_dt * dt)

    return {
        "lon": lon_out, "lat": lat_out, "k": k_out, "l": l_out,
        "cgx": cgx_out, "cgy": cgy_out, "beta": beta_out,
        "u": u_out, "v": v_out, "omega": stationary_out
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
    Find maximum positive RWS within a specified longitude/latitude region.
    """
    rws = rws.sortby(["lat", "lon"])

    sub = rws.sel(
        lon=slice(lon_min, lon_max),
        lat=slice(lat_min, lat_max)
    )

    if sub.size == 0:
        raise ValueError("RWS source search region is empty.")

    # Get maximum value
    flat_index = np.nanargmax(sub.values)
    index = np.unravel_index(flat_index, sub.shape)

    source_value = float(sub.values[index])

    # Enforce that the maximum value must be strictly positive
    if source_value <= 0.0 or not np.isfinite(source_value):
        raise ValueError(
            f"No positive RWS source found in region "
            f"lon=[{lon_min}, {lon_max}], lat=[{lat_min}, {lat_max}]. "
            f"Maximum value found was {source_value:.6e} s^-2."
        )

    lat_index = index[sub.dims.index("lat")]
    lon_index = index[sub.dims.index("lon")]

    source_lat = float(sub["lat"].values[lat_index])
    source_lon = float(sub["lon"].values[lon_index])

    return source_lon, source_lat, source_value


# ============================================================
# NEW: RUN RAY TRACING
# ============================================================

def calculate_ray_tracing(
    u_bg,
    v_bg,
    rws_source,
    background_name="BACKGROUND"
):

    """
    Calculate barotropic stationary Rossby-wave rays.

    The function is intentionally independent of EXP/CTL naming so
    that the same ray-tracing machinery can be used for model
    simulations and ERA5.

    Parameters
    ----------
    u_bg, v_bg : xarray.DataArray
        JJA background wind at the target pressure level.

    rws_source : xarray.DataArray
        RWS field used to locate the wave source.

    background_name : str
        Name stored in the output attributes.
    """

    print(
        "\nCalculating barotropic stationary "
        "Rossby-wave ray tracing..."
    )

    # --------------------------------------------------------
    # Select background state
    # --------------------------------------------------------

    print(
        f"  Ray-tracing background: {background_name}"
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
        rws_source,
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
        (len(rays), maxlen),
        np.nan
    )

    ray_lat = np.full(
        (len(rays), maxlen),
        np.nan
    )

    ray_k = np.full(
        (len(rays), maxlen),
        np.nan
    )

    ray_l = np.full(
        (len(rays), maxlen),
        np.nan
    )

    ray_cgx = np.full(
        (len(rays), maxlen),
        np.nan
    )

    ray_cgy = np.full(
        (len(rays), maxlen),
        np.nan
    )

    ray_beta = np.full(
        (len(rays), maxlen),
        np.nan
    )

    ray_u = np.full(
        (len(rays), maxlen),
        np.nan
    )

    ray_v = np.full(
        (len(rays), maxlen),
        np.nan
    )

    ray_omega = np.full(
        (len(rays), maxlen),
        np.nan
    )

    for iray, ray in enumerate(
        rays
    ):

        n = len(
            ray["lon"]
        )

        ray_lon[iray, :n] = ray["lon"]
        ray_lat[iray, :n] = ray["lat"]
        ray_k[iray, :n] = ray["k"]
        ray_l[iray, :n] = ray["l"]
        ray_cgx[iray, :n] = ray["cgx"]
        ray_cgy[iray, :n] = ray["cgy"]
        ray_beta[iray, :n] = ray["beta"]
        ray_u[iray, :n] = ray["u"]
        ray_v[iray, :n] = ray["v"]
        ray_omega[iray, :n] = ray["omega"]

    ds = xr.Dataset(
        {
            "ray_lon": (("ray", "step"), ray_lon),
            "ray_lat": (("ray", "step"), ray_lat),
            "k": (("ray", "step"), ray_k),
            "l": (("ray", "step"), ray_l),
            "group_velocity_x": (("ray", "step"), ray_cgx),
            "group_velocity_y": (("ray", "step"), ray_cgy),
            "beta_eff": (("ray", "step"), ray_beta),
            "background_u": (("ray", "step"), ray_u),
            "background_v": (("ray", "step"), ray_v),
            "omega": (("ray", "step"), ray_omega)
        }
    )

    ds = ds.assign_coords(
        ray=np.arange(len(rays)),
        step=np.arange(maxlen)
    )

    ds.attrs["description"] = (
        "Barotropic stationary Rossby-wave ray tracing"
    )

    ds.attrs["background"] = (
        f"{background_name} JJA {TARGET_LEVEL:.0f}-hPa climatology"
    )

    ds.attrs["source_longitude"] = source_lon
    ds.attrs["source_latitude"] = source_lat
    ds.attrs["source_rws"] = source_rws
    ds.attrs["zonal_wavenumber"] = RAY_ZONAL_WAVENUMBER
    ds.attrs["dt_hours"] = RAY_DT_HOURS
    ds.attrs["stationary_wave"] = "omega = 0"
    ds.attrs["dispersion_relation"] = (
        "omega = U*k + V*l - beta*k/(k^2+l^2)"
    )

    return ds
