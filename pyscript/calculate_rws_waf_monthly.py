#!/usr/bin/env python

import os
import numpy as np
import xarray as xr

from windspharm.xarray import VectorWind


# ============================================================
# USER SETTINGS
# ============================================================

# ------------------------------------------------------------
# Experiment and control directories
# ------------------------------------------------------------

EXP_DIR = "/work/miz/rws_waf_monthly/sp_pattern/data"
CTL_DIR = "/work/miz/rws_waf_monthly/control/data"

# ------------------------------------------------------------
# Output directory
# ------------------------------------------------------------

OUT_DIR = "/work/miz/rws_waf_monthly/sp_pattern"

# ------------------------------------------------------------
# Input file names
# ------------------------------------------------------------

U_FILE = "atmos.000201-010112.ucomp.nc"
V_FILE = "atmos.000201-010112.vcomp.nc"
Z_FILE = "atmos.000201-010112.hght.nc"

# ------------------------------------------------------------
# Target pressure level
# ------------------------------------------------------------

TARGET_LEVEL = 200.0       # hPa

# ------------------------------------------------------------
# Analysis period
# ------------------------------------------------------------

START_YEAR = 2
END_YEAR   = 101

# ------------------------------------------------------------
# Earth constants
# ------------------------------------------------------------

A = 6.371e6                # Earth radius, m
OMEGA = 7.2921150e-5       # rotation rate, s-1
G = 9.80665                # gravity, m s-2

# ------------------------------------------------------------
# TN01 pressure normalization
#
# Published spherical TN01 implementations commonly use
# p / 1000 hPa.
#
# At 200 hPa:
#
#     P_NORM = 200 / 1000 = 0.2
# ------------------------------------------------------------

P_NORM = TARGET_LEVEL / 1000.0

# ------------------------------------------------------------
# Tropical mask
# ------------------------------------------------------------

LAT_MIN_TN01 = 10.0        # degrees

# ------------------------------------------------------------
# Minimum background wind speed squared
#
# TN01 contains 1 / |V|.
# ------------------------------------------------------------

WIND2_MIN = 1.0e-8

# ------------------------------------------------------------
# NetCDF fill value
# ------------------------------------------------------------

FILL_VALUE = -9999.0


# ============================================================
# UTILITY FUNCTIONS
# ============================================================

def fix_latitude_order(ds):
    """
    Ensure latitude is ascending south-to-north.

    The xarray windspharm interface can internally reverse
    latitude when necessary, but keeping all datasets in the
    same orientation is cleaner.
    """

    if "lat" not in ds.coords:
        raise ValueError("Latitude coordinate 'lat' not found.")

    lat = ds["lat"].values

    if lat[0] > lat[-1]:
        ds = ds.sortby("lat")

    return ds


def select_level(da, target_level):
    """
    Select the pressure level closest to target_level.

    Expected pressure coordinate names:
        level
        plev
        plev3
        pressure
    """

    possible_names = [
        "level",
        "plev",
        "plev3",
        "pressure"
    ]

    lev_name = None

    for name in possible_names:

        if name in da.coords:
            lev_name = name
            break

        if name in da.dims:
            lev_name = name
            break

    if lev_name is None:
        raise ValueError(
            "Could not identify pressure-level coordinate. "
            "Expected one of: level, plev, plev3, pressure."
        )

    selected = da.sel(
        {lev_name: target_level},
        method="nearest"
    )

    actual_level = float(
        selected[lev_name].values
    )

    print(
        f"Requested level = {target_level:.1f} hPa; "
        f"selected level = {actual_level:.3f} hPa"
    )

    return selected


def zonal_anomaly(da):
    """
    Remove the zonal mean.

    Zonal mean is calculated independently at each time and
    latitude. NaNs are ignored when calculating the zonal mean.
    """

    zonal_mean = da.mean(
        dim="lon",
        skipna=True
    )

    return da - zonal_mean


def monthly_climatology(da):
    """
    Construct a 12-month climatology.

    Input:
        time, lat, lon

    Output:
        month, lat, lon

    Month = 1,...,12.
    """

    return da.groupby(
        "time.month"
    ).mean(
        dim="time",
        skipna=True
    )


def check_finite_uv(u, v, label):
    """
    Check that U and V contain no NaNs or infinities.

    windspharm requires complete U/V fields.
    """

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
            f"{label}: non-finite U/V values detected. "
            f"U bad={bad_u}, V bad={bad_v}"
        )


# ============================================================
# ROSSBY WAVE SOURCE
# ============================================================

def calculate_rws(u, v):
    """
    Calculate Rossby Wave Source:

        RWS =
            - eta * div_chi
            - u_chi * d(eta)/dx
            - v_chi * d(eta)/dy

    where

        eta = relative vorticity + planetary vorticity.

    The divergent wind is obtained using windspharm.

    RWS is calculated from the actual monthly U/V fields,
    not from the climatological background flow.
    """

    check_finite_uv(
        u,
        v,
        "RWS"
    )

    # --------------------------------------------------------
    # windspharm
    # --------------------------------------------------------

    w = VectorWind(
        u,
        v,
        rsphere=A
    )

    # --------------------------------------------------------
    # Relative vorticity
    # --------------------------------------------------------

    vort = w.vorticity()

    # --------------------------------------------------------
    # Divergent wind
    # --------------------------------------------------------

    uchi, vchi = w.irrotationalcomponent()

    # --------------------------------------------------------
    # Divergence
    # --------------------------------------------------------

    div = w.divergence()

    # --------------------------------------------------------
    # Coriolis parameter
    # --------------------------------------------------------

    lat = u["lat"]

    f = xr.DataArray(
        2.0 * OMEGA * np.sin(
            np.deg2rad(lat.values)
        ),
        coords={"lat": lat},
        dims=("lat",)
    )

    # Broadcast to 2-D
    f2d = xr.broadcast(
        u,
        f
    )[1]

    # --------------------------------------------------------
    # Absolute vorticity
    # --------------------------------------------------------

    eta = vort + f2d

    # --------------------------------------------------------
    # Gradient of absolute vorticity
    #
    # Use windspharm's spherical gradient so that the
    # derivatives are consistent with the windspharm
    # vorticity/divergence calculation.
    # --------------------------------------------------------

    deta_dx, deta_dy = w.gradient(
        eta
    )

    # --------------------------------------------------------
    # Rossby Wave Source
    # --------------------------------------------------------

    rws = (
        -eta * div
        -uchi * deta_dx
        -vchi * deta_dy
    )

    rws.name = "rws"

    rws.attrs["long_name"] = (
        "Rossby wave source"
    )

    rws.attrs["units"] = "s-2"

    return rws


# ============================================================
# TAKAYA-NAKAMURA WAVE ACTIVITY FLUX
# ============================================================

def tn01_waf_2d(u_bg, v_bg, z_prime):
    """
    Calculate the two-dimensional horizontal
    Takaya-Nakamura (2001) wave activity flux.

    ------------------------------------------------------------
    Background flow
    ------------------------------------------------------------

        u_bg
        v_bg

    are the monthly climatological background winds.

    ------------------------------------------------------------
    Perturbation
    ------------------------------------------------------------

        z_prime

    is geopotential height perturbation in meters.

    ------------------------------------------------------------
    Streamfunction
    ------------------------------------------------------------

        psi' = Phi' / f

        Phi' = g Z'

    therefore

        psi' = g Z' / f

    ------------------------------------------------------------
    Spherical TN01 formulation
    ------------------------------------------------------------

        Wx = p cos(phi)/(2 |V|)

             [
               U/(a^2 cos^2(phi))
               (psi_lambda^2 - psi psi_ll)

               +

               V/(a^2 cos(phi))
               (psi_lambda psi_phi - psi psi_lphi)
             ]


        Wy = p cos(phi)/(2 |V|)

             [
               U/(a^2 cos(phi))
               (psi_lambda psi_phi - psi psi_lphi)

               +

               V/a^2
               (psi_phi^2 - psi psi_phiphi)
             ]

    where

        lambda = longitude in radians
        phi    = latitude in radians

    and p is normalized as

        p / 1000 hPa.

    ------------------------------------------------------------
    """

    # --------------------------------------------------------
    # Check background winds
    # --------------------------------------------------------

    check_finite_uv(
        u_bg,
        v_bg,
        "TN01 background wind"
    )

    # --------------------------------------------------------
    # Coordinates
    # --------------------------------------------------------

    lat = u_bg["lat"]
    lon = u_bg["lon"]

    lat_values = lat.values
    lon_values = lon.values

    lat_rad_values = np.deg2rad(
        lat_values
    )

    lon_rad_values = np.deg2rad(
        lon_values
    )

    # --------------------------------------------------------
    # cos(phi)
    # --------------------------------------------------------

    cosphi = xr.DataArray(
        np.cos(lat_rad_values),
        coords={"lat": lat},
        dims=("lat",)
    )

    # Broadcast to 2-D
    cosphi2d = xr.broadcast(
        u_bg,
        cosphi
    )[1]

    # --------------------------------------------------------
    # Coriolis parameter
    # --------------------------------------------------------

    f = xr.DataArray(
        2.0 * OMEGA * np.sin(
            lat_rad_values
        ),
        coords={"lat": lat},
        dims=("lat",)
    )

    f2d = xr.broadcast(
        u_bg,
        f
    )[1]

    # --------------------------------------------------------
    # Background wind speed squared
    # --------------------------------------------------------

    wind2 = (
        u_bg**2
        +
        v_bg**2
    )

    # --------------------------------------------------------
    # Streamfunction perturbation
    #
    # psi' = g Z' / f
    #
    # The tropics will be masked later.
    # --------------------------------------------------------

    psi = (
        G * z_prime / f2d
    )

    # --------------------------------------------------------
    # Convert coordinate units from degrees to radians.
    #
    # This is important because the TN01 expression uses
    # derivatives with respect to lambda and phi in radians.
    # --------------------------------------------------------

    psi_rad = psi.assign_coords(
        lon=("lon", lon_rad_values),
        lat=("lat", lat_rad_values)
    )

    # --------------------------------------------------------
    # First derivatives
    # --------------------------------------------------------

    psi_lambda = psi_rad.differentiate(
        "lon"
    )

    psi_phi = psi_rad.differentiate(
        "lat"
    )

    # --------------------------------------------------------
    # Second derivatives
    # --------------------------------------------------------

    psi_ll = psi_lambda.differentiate(
        "lon"
    )

    psi_phiphi = psi_phi.differentiate(
        "lat"
    )

    psi_lphi = psi_lambda.differentiate(
        "lat"
    )

    # --------------------------------------------------------
    # TN01 quadratic terms
    # --------------------------------------------------------

    term_xx = (
        psi_lambda**2
        -
        psi * psi_ll
    )

    term_xy = (
        psi_lambda * psi_phi
        -
        psi * psi_lphi
    )

    term_yy = (
        psi_phi**2
        -
        psi * psi_phiphi
    )

    # --------------------------------------------------------
    # Zonal WAF component
    # --------------------------------------------------------

    inside_x = (

        u_bg
        /
        (
            A**2
            *
            cosphi2d**2
        )
        *
        term_xx

        +

        v_bg
        /
        (
            A**2
            *
            cosphi2d
        )
        *
        term_xy

    )

    # --------------------------------------------------------
    # Meridional WAF component
    # --------------------------------------------------------

    inside_y = (

        u_bg
        /
        (
            A**2
            *
            cosphi2d
        )
        *
        term_xy

        +

        v_bg
        /
        A**2
        *
        term_yy

    )

    # --------------------------------------------------------
    # TN01 prefactor
    #
    # p is normalized as p/1000 hPa.
    # --------------------------------------------------------

    wind_speed = np.sqrt(
        wind2
    )

    prefactor = (
        P_NORM
        *
        cosphi2d
        /
        (
            2.0
            *
            wind_speed
        )
    )

    # --------------------------------------------------------
    # WAF components
    # --------------------------------------------------------

    waf_x = (
        prefactor
        *
        inside_x
    )

    waf_y = (
        prefactor
        *
        inside_y
    )

    # --------------------------------------------------------
    # Restore original coordinate values
    # --------------------------------------------------------

    waf_x = waf_x.assign_coords(
        lon=lon,
        lat=lat
    )

    waf_y = waf_y.assign_coords(
        lon=lon,
        lat=lat
    )

    # --------------------------------------------------------
    # Validity masks
    #
    # 1. Avoid tropics.
    # 2. Avoid very weak background flow.
    #
    # Existing NaNs in z_prime are preserved.
    # --------------------------------------------------------

    valid_lat = xr.DataArray(
        np.abs(lat_values) >= LAT_MIN_TN01,
        coords={"lat": lat},
        dims=("lat",)
    )

    valid_lat2d = xr.broadcast(
        u_bg,
        valid_lat
    )[1]

    valid_wind = (
        wind2 > WIND2_MIN
    )

    valid = (
        valid_lat2d
        &
        valid_wind
    )

    waf_x = waf_x.where(
        valid
    )

    waf_y = waf_y.where(
        valid
    )

    # --------------------------------------------------------
    # Names
    # --------------------------------------------------------

    waf_x.name = "waf_x"
    waf_y.name = "waf_y"

    # --------------------------------------------------------
    # Attributes
    # --------------------------------------------------------

    waf_x.attrs["long_name"] = (
        "TN01 horizontal wave activity flux, "
        "zonal component"
    )

    waf_y.attrs["long_name"] = (
        "TN01 horizontal wave activity flux, "
        "meridional component"
    )

    waf_x.attrs["units"] = "m2 s-2"
    waf_y.attrs["units"] = "m2 s-2"

    waf_x.attrs["pressure_normalization"] = (
        "p/1000 hPa"
    )

    waf_y.attrs["pressure_normalization"] = (
        "p/1000 hPa"
    )

    waf_x.attrs["streamfunction"] = (
        "psi_prime = g * Z_prime / f"
    )

    waf_y.attrs["streamfunction"] = (
        "psi_prime = g * Z_prime / f"
    )

    waf_x.attrs["background_flow"] = (
        "monthly climatological U/V"
    )

    waf_y.attrs["background_flow"] = (
        "monthly climatological U/V"
    )

    return waf_x, waf_y


# ============================================================
# MAIN
# ============================================================

def main():

    # ========================================================
    # Create output directory
    # ========================================================

    os.makedirs(
        OUT_DIR,
        exist_ok=True
    )

    # ========================================================
    # Construct input paths
    # ========================================================

    exp_u_path = os.path.join(
        EXP_DIR,
        U_FILE
    )

    exp_v_path = os.path.join(
        EXP_DIR,
        V_FILE
    )

    exp_z_path = os.path.join(
        EXP_DIR,
        Z_FILE
    )

    ctl_u_path = os.path.join(
        CTL_DIR,
        U_FILE
    )

    ctl_v_path = os.path.join(
        CTL_DIR,
        V_FILE
    )

    ctl_z_path = os.path.join(
        CTL_DIR,
        Z_FILE
    )

    # ========================================================
    # Print input information
    # ========================================================

    print()
    print("============================================================")
    print("RWS / TN01 WAF CALCULATION")
    print("============================================================")

    print()
    print("Experiment:")
    print(exp_u_path)
    print(exp_v_path)
    print(exp_z_path)

    print()
    print("Control:")
    print(ctl_u_path)
    print(ctl_v_path)
    print(ctl_z_path)

    print()
    print("Output:")
    print(OUT_DIR)

    # ========================================================
    # CF time decoder
    # ========================================================

    time_coder = xr.coders.CFDatetimeCoder(
        use_cftime=True
    )

    # ========================================================
    # Open datasets
    # ========================================================

    print()
    print("Opening experiment files...")

    ds_ue = xr.open_dataset(
        exp_u_path,
        decode_times=time_coder
    )

    ds_ve = xr.open_dataset(
        exp_v_path,
        decode_times=time_coder
    )

    ds_ze = xr.open_dataset(
        exp_z_path,
        decode_times=time_coder
    )

    print("Opening control files...")

    ds_uc = xr.open_dataset(
        ctl_u_path,
        decode_times=time_coder
    )

    ds_vc = xr.open_dataset(
        ctl_v_path,
        decode_times=time_coder
    )

    ds_zc = xr.open_dataset(
        ctl_z_path,
        decode_times=time_coder
    )

    # ========================================================
    # Fix latitude ordering
    # ========================================================

    ds_ue = fix_latitude_order(
        ds_ue
    )

    ds_ve = fix_latitude_order(
        ds_ve
    )

    ds_ze = fix_latitude_order(
        ds_ze
    )

    ds_uc = fix_latitude_order(
        ds_uc
    )

    ds_vc = fix_latitude_order(
        ds_vc
    )

    ds_zc = fix_latitude_order(
        ds_zc
    )

    # ========================================================
    # Variable names
    # ========================================================

    u_name = "ucomp"
    v_name = "vcomp"
    z_name = "hght"

    # ========================================================
    # Check variables
    # ========================================================

    required = [
        (ds_ue, u_name, "experiment U"),
        (ds_ve, v_name, "experiment V"),
        (ds_ze, z_name, "experiment height"),
        (ds_uc, u_name, "control U"),
        (ds_vc, v_name, "control V"),
        (ds_zc, z_name, "control height"),
    ]

    for ds, name, label in required:

        if name not in ds:

            raise ValueError(
                f"{name} not found in {label} file."
            )

    # ========================================================
    # Select target level
    # ========================================================

    print()
    print("Selecting pressure level...")

    ue = select_level(
        ds_ue[u_name],
        TARGET_LEVEL
    )

    ve = select_level(
        ds_ve[v_name],
        TARGET_LEVEL
    )

    ze = select_level(
        ds_ze[z_name],
        TARGET_LEVEL
    )

    uc = select_level(
        ds_uc[u_name],
        TARGET_LEVEL
    )

    vc = select_level(
        ds_vc[v_name],
        TARGET_LEVEL
    )

    zc = select_level(
        ds_zc[z_name],
        TARGET_LEVEL
    )

    # ========================================================
    # Select analysis period
    # ========================================================

    start_date = (
        f"{START_YEAR:04d}-01-01"
    )

    end_date = (
        f"{END_YEAR:04d}-12-31"
    )

    print()
    print("Analysis period:")
    print(
        f"{start_date} through {end_date}"
    )

    ue = ue.sel(
        time=slice(
            start_date,
            end_date
        )
    )

    ve = ve.sel(
        time=slice(
            start_date,
            end_date
        )
    )

    ze = ze.sel(
        time=slice(
            start_date,
            end_date
        )
    )

    uc = uc.sel(
        time=slice(
            start_date,
            end_date
        )
    )

    vc = vc.sel(
        time=slice(
            start_date,
            end_date
        )
    )

    zc = zc.sel(
        time=slice(
            start_date,
            end_date
        )
    )

    # ========================================================
    # Check time dimension
    # ========================================================

    ne = ue.sizes["time"]
    nc = uc.sizes["time"]

    print()
    print(
        f"Experiment months = {ne}"
    )

    print(
        f"Control months     = {nc}"
    )

    if ne != nc:

        raise ValueError(
            "Experiment and control have different "
            "numbers of time records."
        )

    # ========================================================
    # Check horizontal grids
    # ========================================================

    if not np.array_equal(
        ue["lat"].values,
        uc["lat"].values
    ):

        raise ValueError(
            "Experiment and control latitude grids differ."
        )

    if not np.array_equal(
        ue["lon"].values,
        uc["lon"].values
    ):

        raise ValueError(
            "Experiment and control longitude grids differ."
        )

    # ========================================================
    # Construct monthly climatological U/V
    # ========================================================

    print()
    print("============================================================")
    print("CONSTRUCTING MONTHLY CLIMATOLOGICAL U/V")
    print("============================================================")

    print()
    print("Experiment U climatology...")

    ue_clim = monthly_climatology(
        ue
    )

    print("Experiment V climatology...")

    ve_clim = monthly_climatology(
        ve
    )

    print("Control U climatology...")

    uc_clim = monthly_climatology(
        uc
    )

    print("Control V climatology...")

    vc_clim = monthly_climatology(
        vc
    )

    print()
    print(
        "Experiment U climatology shape:",
        ue_clim.shape
    )

    print(
        "Experiment V climatology shape:",
        ve_clim.shape
    )

    print(
        "Control U climatology shape:   ",
        uc_clim.shape
    )

    print(
        "Control V climatology shape:   ",
        vc_clim.shape
    )

    # ========================================================
    # Check climatological winds
    # ========================================================

    for month in range(1, 13):

        check_finite_uv(
            ue_clim.sel(month=month),
            ve_clim.sel(month=month),
            f"Experiment climatology month {month}"
        )

        check_finite_uv(
            uc_clim.sel(month=month),
            vc_clim.sel(month=month),
            f"Control climatology month {month}"
        )

    # ========================================================
    # Height response
    # ========================================================

    print()
    print("Constructing experiment-control height response...")

    z_response = (
        ze - zc
    )

    # ========================================================
    # Zonal height perturbations
    # ========================================================

    print(
        "Constructing zonal height perturbations..."
    )

    z_exp_prime = zonal_anomaly(
        ze
    )

    z_ctl_prime = zonal_anomaly(
        zc
    )

    z_response_prime = zonal_anomaly(
        z_response
    )

    # ========================================================
    # Time and month information
    # ========================================================

    time_values = ue["time"].values

    months = np.asarray(
        ue["time"].dt.month.values
    )

    # ========================================================
    # Lists for monthly results
    # ========================================================

    rws_exp_list = []
    rws_ctl_list = []
    rws_response_list = []

    waf_x_exp_list = []
    waf_y_exp_list = []

    waf_x_ctl_list = []
    waf_y_ctl_list = []

    waf_x_diff_list = []
    waf_y_diff_list = []

    waf_x_response_list = []
    waf_y_response_list = []

    # ========================================================
    # Monthly calculation loop
    # ========================================================

    print()
    print("============================================================")
    print("CALCULATING MONTHLY RWS AND TN01 WAF")
    print("============================================================")

    for it in range(ne):

        month = int(
            months[it]
        )

        # ----------------------------------------------------
        # Progress information
        # ----------------------------------------------------

        if (
            it == 0
            or (it + 1) % 12 == 1
        ):

            print(
                f"Processing {it+1}/{ne}: "
                f"{time_values[it]} "
                f"(month={month})"
            )

        # ----------------------------------------------------
        # Actual monthly U/V
        #
        # Used for RWS.
        # ----------------------------------------------------

        u_e = ue.isel(
            time=it
        )

        v_e = ve.isel(
            time=it
        )

        u_c = uc.isel(
            time=it
        )

        v_c = vc.isel(
            time=it
        )

        # ----------------------------------------------------
        # Monthly zonal height perturbations
        # ----------------------------------------------------

        zp_e = z_exp_prime.isel(
            time=it
        )

        zp_c = z_ctl_prime.isel(
            time=it
        )

        zp_r = z_response_prime.isel(
            time=it
        )

        # ----------------------------------------------------
        # Corresponding monthly climatological background winds
        # ----------------------------------------------------

        u_bg_e = ue_clim.sel(
            month=month
        )

        v_bg_e = ve_clim.sel(
            month=month
        )

        u_bg_c = uc_clim.sel(
            month=month
        )

        v_bg_c = vc_clim.sel(
            month=month
        )

        # ====================================================
        # RWS: EXPERIMENT
        # ====================================================

        rws_e = calculate_rws(
            u_e,
            v_e
        )

        # ====================================================
        # RWS: CONTROL
        # ====================================================

        rws_c = calculate_rws(
            u_c,
            v_c
        )

        # ====================================================
        # RWS RESPONSE
        #
        # rws_response = rws_exp - rws_ctl
        # ====================================================

        rws_r = (
            rws_e
            -
            rws_c
        )

        rws_r.name = "rws_response"

        rws_r.attrs["long_name"] = (
            "Rossby wave source response "
            "(experiment minus control)"
        )

        rws_r.attrs["units"] = "s-2"

        # ====================================================
        # TN01 WAF: EXPERIMENT
        #
        # Background:
        #   experiment monthly climatological U/V
        #
        # Perturbation:
        #   experiment monthly zonal height perturbation
        # ====================================================

        waf_x_e, waf_y_e = tn01_waf_2d(
            u_bg_e,
            v_bg_e,
            zp_e
        )

        # ====================================================
        # TN01 WAF: CONTROL
        #
        # Background:
        #   control monthly climatological U/V
        #
        # Perturbation:
        #   control monthly zonal height perturbation
        # ====================================================

        waf_x_c, waf_y_c = tn01_waf_2d(
            u_bg_c,
            v_bg_c,
            zp_c
        )

        # ====================================================
        # TN01 WAF DIFFERENCE
        #
        # EXACTLY:
        #
        #   WAF_diff = WAF_exp - WAF_ctl
        # ====================================================

        waf_x_diff = (
            waf_x_e
            -
            waf_x_c
        )

        waf_y_diff = (
            waf_y_e
            -
            waf_y_c
        )

        waf_x_diff.name = "waf_x_diff"
        waf_y_diff.name = "waf_y_diff"

        # ====================================================
        # TN01 RESPONSE WAF
        #
        # Use:
        #
        #   control climatological U/V
        #
        # with:
        #
        #   experiment-control height response
        #
        # This is NOT WAF_exp - WAF_ctl.
        #
        # TN01 is quadratic in the height perturbation.
        # ====================================================

        waf_x_r, waf_y_r = tn01_waf_2d(
            u_bg_c,
            v_bg_c,
            zp_r
        )

        waf_x_r.name = "waf_x_response"
        waf_y_r.name = "waf_y_response"

        # ----------------------------------------------------
        # Store monthly results
        # ----------------------------------------------------

        rws_exp_list.append(
            rws_e
        )

        rws_ctl_list.append(
            rws_c
        )

        rws_response_list.append(
            rws_r
        )

        waf_x_exp_list.append(
            waf_x_e
        )

        waf_y_exp_list.append(
            waf_y_e
        )

        waf_x_ctl_list.append(
            waf_x_c
        )

        waf_y_ctl_list.append(
            waf_y_c
        )

        waf_x_diff_list.append(
            waf_x_diff
        )

        waf_y_diff_list.append(
            waf_y_diff
        )

        waf_x_response_list.append(
            waf_x_r
        )

        waf_y_response_list.append(
            waf_y_r
        )

    # ========================================================
    # COMBINE MONTHLY RESULTS
    # ========================================================

    print()
    print("Combining monthly diagnostics...")

    rws_exp = xr.concat(
        rws_exp_list,
        dim="time"
    ).assign_coords(
        time=ue["time"]
    )

    rws_ctl = xr.concat(
        rws_ctl_list,
        dim="time"
    ).assign_coords(
        time=ue["time"]
    )

    rws_response = xr.concat(
        rws_response_list,
        dim="time"
    ).assign_coords(
        time=ue["time"]
    )

    waf_x_exp = xr.concat(
        waf_x_exp_list,
        dim="time"
    ).assign_coords(
        time=ue["time"]
    )

    waf_y_exp = xr.concat(
        waf_y_exp_list,
        dim="time"
    ).assign_coords(
        time=ue["time"]
    )

    waf_x_ctl = xr.concat(
        waf_x_ctl_list,
        dim="time"
    ).assign_coords(
        time=ue["time"]
    )

    waf_y_ctl = xr.concat(
        waf_y_ctl_list,
        dim="time"
    ).assign_coords(
        time=ue["time"]
    )

    waf_x_diff = xr.concat(
        waf_x_diff_list,
        dim="time"
    ).assign_coords(
        time=ue["time"]
    )

    waf_y_diff = xr.concat(
        waf_y_diff_list,
        dim="time"
    ).assign_coords(
        time=ue["time"]
    )

    waf_x_response = xr.concat(
        waf_x_response_list,
        dim="time"
    ).assign_coords(
        time=ue["time"]
    )

    waf_y_response = xr.concat(
        waf_y_response_list,
        dim="time"
    ).assign_coords(
        time=ue["time"]
    )

    # ========================================================
    # OUTPUT DATASET
    # ========================================================

    print()
    print("Creating output dataset...")

    ds_out = xr.Dataset(
        {
            "rws_exp": rws_exp,
            "rws_ctl": rws_ctl,
            "rws_response": rws_response,

            "waf_x_exp": waf_x_exp,
            "waf_y_exp": waf_y_exp,

            "waf_x_ctl": waf_x_ctl,
            "waf_y_ctl": waf_y_ctl,

            "waf_x_diff": waf_x_diff,
            "waf_y_diff": waf_y_diff,

            "waf_x_response": waf_x_response,
            "waf_y_response": waf_y_response,
        }
    )

    # ========================================================
    # Global attributes
    # ========================================================

    ds_out.attrs["description"] = (
        "200-hPa Rossby wave source and "
        "Takaya-Nakamura wave activity flux"
    )

    ds_out.attrs["analysis_period"] = (
        f"{START_YEAR:04d}-{END_YEAR:04d}"
    )

    ds_out.attrs["pressure_level_hPa"] = (
        TARGET_LEVEL
    )

    ds_out.attrs["earth_radius_m"] = A

    ds_out.attrs["rotation_rate_s-1"] = OMEGA

    ds_out.attrs["gravity_m_s-2"] = G

    ds_out.attrs["TN01_pressure_normalization"] = (
        "p/1000 hPa"
    )

    ds_out.attrs["TN01_streamfunction"] = (
        "psi_prime = g * Z_prime / f"
    )

    ds_out.attrs["TN01_background_flow"] = (
        "12-month climatological U/V constructed "
        "separately for experiment and control"
    )

    ds_out.attrs["TN01_experiment_WAF"] = (
        "TN01(experiment monthly climatological U/V, "
        "experiment monthly zonal height perturbation)"
    )

    ds_out.attrs["TN01_control_WAF"] = (
        "TN01(control monthly climatological U/V, "
        "control monthly zonal height perturbation)"
    )

    ds_out.attrs["TN01_WAF_difference"] = (
        "waf_exp - waf_ctl"
    )

    ds_out.attrs["TN01_response_WAF"] = (
        "TN01(control monthly climatological U/V, "
        "experiment-minus-control monthly zonal height response)"
    )

    ds_out.attrs["RWS_definition"] = (
        "RWS = -eta*div_chi - u_chi*deta/dx - v_chi*deta/dy"
    )

    ds_out.attrs["TN01_tropical_mask"] = (
        f"|latitude| < {LAT_MIN_TN01} degrees"
    )

    # ========================================================
    # NetCDF encoding
    # ========================================================

    encoding = {}

    for var in ds_out.data_vars:

        encoding[var] = {
            "_FillValue": FILL_VALUE,
            "zlib": True,
            "complevel": 4,
            "dtype": "float32"
        }

    # ========================================================
    # WRITE ALL MONTHS
    # ========================================================

    out_all = os.path.join(
        OUT_DIR,
        "rws_waf.200hPa.monthly.all_years.nc"
    )

    print()
    print("Writing:")
    print(out_all)

    ds_out.to_netcdf(
        out_all,
        encoding=encoding
    )

    # ========================================================
    # JJA MONTHLY
    # ========================================================

    print()
    print("Creating JJA monthly dataset...")

    jja = ds_out.where(
        ds_out["time"].dt.month.isin(
            [6, 7, 8]
        ),
        drop=True
    )

    out_jja_monthly = os.path.join(
        OUT_DIR,
        "rws_waf.200hPa.JJA_monthly.all_years.nc"
    )

    print()
    print("Writing:")
    print(out_jja_monthly)

    jja.to_netcdf(
        out_jja_monthly,
        encoding=encoding
    )

    # ========================================================
    # ANNUAL JJA MEAN
    # ========================================================

    print()
    print("Creating annual JJA means...")

    jja_mean = jja.groupby(
        "time.year"
    ).mean(
        dim="time",
        skipna=True
    )

    # --------------------------------------------------------
    # Use the July time record of each year as the time
    # coordinate for the annual JJA mean.
    # --------------------------------------------------------

    july_times = ds_out["time"].where(
        ds_out["time"].dt.month == 7,
        drop=True
    )

    jja_mean = jja_mean.assign_coords(
        time=("year", july_times.values)
    )

    jja_mean = jja_mean.swap_dims(
        {"year": "time"}
    )

    jja_mean = jja_mean.drop_vars(
        "year",
        errors="ignore"
    )

    # ========================================================
    # Annual JJA output
    # ========================================================

    out_jja_mean = os.path.join(
        OUT_DIR,
        "rws_waf.200hPa.JJA_mean.all_years.nc"
    )

    print()
    print("Writing:")
    print(out_jja_mean)

    jja_encoding = {}

    for var in jja_mean.data_vars:

        jja_encoding[var] = {
            "_FillValue": FILL_VALUE,
            "zlib": True,
            "complevel": 4,
            "dtype": "float32"
        }

    jja_mean.to_netcdf(
        out_jja_mean,
        encoding=jja_encoding
    )

    # ========================================================
    # SUMMARY
    # ========================================================

    print()
    print("============================================================")
    print("CALCULATION COMPLETE")
    print("============================================================")

    print()
    print("Output files:")

    print(
        f"  {out_all}"
    )

    print(
        f"  {out_jja_monthly}"
    )

    print(
        f"  {out_jja_mean}"
    )

    print()
    print("Output variables:")

    for var in ds_out.data_vars:

        print(
            f"  {var}"
        )

    print()
    print("TN01 background-flow definition:")

    print(
        "  EXP WAF      = TN01(EXP monthly climatological U/V,"
    )

    print(
        "                       EXP monthly Z' )"
    )

    print(
        "  CTL WAF      = TN01(CTL monthly climatological U/V,"
    )

    print(
        "                       CTL monthly Z' )"
    )

    print(
        "  WAF DIFF     = EXP WAF - CTL WAF"
    )

    print(
        "  RESPONSE WAF = TN01(CTL monthly climatological U/V,"
    )

    print(
        "                       EXP-CTL monthly Z' )"
    )

    print()
    print("RWS uses actual monthly U/V fields.")
    print("TN01 uses monthly climatological U/V background flow.")
    print()
    print("Done.")


# ============================================================
# ENTRY POINT
# ============================================================

if __name__ == "__main__":
    main()
