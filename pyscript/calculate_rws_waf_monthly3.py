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
    #
    # This is important because xr.align(join="exact") requires
    # the coordinate indexes to match exactly, including order.
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
    #
    # IMPORTANT:
    # The radian values must also be used as the coordinate
    # labels. Otherwise xarray may align fields incorrectly.
    # --------------------------------------------------------

    lat_values_rad = np.deg2rad(
        lat_deg_values
    )

    lon_values_rad = np.deg2rad(
        lon_deg_values
    )

    # --------------------------------------------------------
    # Assign radian coordinates
    #
    # Keep the original dimensions and replace the coordinate
    # labels with radians.
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
    #
    # IMPORTANT:
    # Give f the same radian latitude coordinate as z_rad.
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
# FINISHED
# ============================================================

print(
    "\nAll RWS and WAF calculations completed successfully."
)

print(
    f"Output directory: {OUT_DIR}"
)
