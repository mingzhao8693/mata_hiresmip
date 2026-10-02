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

    lat_deg = u_bg["lat"]
    lon_deg = u_bg["lon"]

    # --------------------------------------------------------
    # Convert coordinate values to radians
    #
    # IMPORTANT:
    # The radian values must also be used as the coordinate
    # labels. Otherwise xarray may align fields incorrectly.
    # --------------------------------------------------------

    lat_values_rad = np.deg2rad(
        lat_deg.values
    )

    lon_values_rad = np.deg2rad(
        lon_deg.values
    )

    lat_rad = xr.DataArray(
        lat_values_rad,
        coords={
            "lat": lat_values_rad
        },
        dims=("lat",),
        name="lat"
    )

    lon_rad = xr.DataArray(
        lon_values_rad,
        coords={
            "lon": lon_values_rad
        },
        dims=("lon",),
        name="lon"
    )

    # --------------------------------------------------------
    # Assign radian coordinates
    # --------------------------------------------------------

    u_rad = u_bg.assign_coords(
        lat=lat_values_rad,
        lon=lon_values_rad
    )

    v_rad = v_bg.assign_coords(
        lat=lat_values_rad,
        lon=lon_values_rad
    )

    z_rad = z_prime.assign_coords(
        lat=lat_values_rad,
        lon=lon_values_rad
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
        np.abs(lat_deg)
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
        lat=lat_deg,
        lon=lon_deg
    )

    waf_y = waf_y.assign_coords(
        lat=lat_deg,
        lon=lon_deg
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
# ============================================================
# LONG-TERM MONTHLY CLIMATOLOGY
# ============================================================
# ============================================================

print(
    "\nCalculating long-term monthly climatologies..."
)


# ------------------------------------------------------------
# WIND CLIMATOLOGIES
# ------------------------------------------------------------

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


# ------------------------------------------------------------
# HEIGHT CLIMATOLOGIES
# ------------------------------------------------------------

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


# ------------------------------------------------------------
# ZONAL HEIGHT PERTURBATIONS
#
# IMPORTANT:
#
# First calculate the long-term monthly mean Z.
# Then remove the zonal mean.
#
# This is equivalent to:
#
# mean(Z - zonal_mean(Z))
#
# for a complete climatological average, but this form
# makes the intended climatological calculation explicit.
# ------------------------------------------------------------

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


# ------------------------------------------------------------
# HEIGHT RESPONSE
#
# First calculate the EXP-CTL response at every month,
# then calculate its long-term calendar-month climatology.
# ------------------------------------------------------------

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
#
# WAF is now calculated ONLY ONCE for each calendar month.
#
# There is no need to calculate WAF separately for every
# individual year because both the background flow and height
# perturbation are long-term monthly climatologies.
#
# RWS below is still calculated for every individual month.
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

    # --------------------------------------------------------
    # EXP monthly climatological background flow
    # --------------------------------------------------------

    u_exp_bg = ue_clim.sel(
        month=month
    )

    v_exp_bg = ve_clim.sel(
        month=month
    )

    # --------------------------------------------------------
    # CTL monthly climatological background flow
    # --------------------------------------------------------

    u_ctl_bg = uc_clim.sel(
        month=month
    )

    v_ctl_bg = vc_clim.sel(
        month=month
    )

    # --------------------------------------------------------
    # EXP monthly climatological height perturbation
    # --------------------------------------------------------

    zp_exp = ze_prime_clim.sel(
        month=month
    )

    # --------------------------------------------------------
    # CTL monthly climatological height perturbation
    # --------------------------------------------------------

    zp_ctl = zc_prime_clim.sel(
        month=month
    )

    # --------------------------------------------------------
    # Monthly climatological height response
    # --------------------------------------------------------

    zp_response = (
        z_response_prime_clim.sel(
            month=month
        )
    )

    # ========================================================
    # EXP WAF
    #
    # EXP climatological U/V
    # +
    # EXP climatological Z perturbation
    # ========================================================

    waf_x_exp, waf_y_exp = (
        tn01_waf_2d(
            u_exp_bg,
            v_exp_bg,
            zp_exp
        )
    )

    # ========================================================
    # CTL WAF
    #
    # CTL climatological U/V
    # +
    # CTL climatological Z perturbation
    # ========================================================

    waf_x_ctl, waf_y_ctl = (
        tn01_waf_2d(
            u_ctl_bg,
            v_ctl_bg,
            zp_ctl
        )
    )

    # ========================================================
    # WAF DIFFERENCE
    #
    # EXP WAF - CTL WAF
    # ========================================================

    waf_x_diff = (
        waf_x_exp
        - waf_x_ctl
    )

    waf_y_diff = (
        waf_y_exp
        - waf_y_ctl
    )

    # ========================================================
    # RESPONSE WAF
    #
    # CTL climatological U/V
    # +
    # climatological EXP-CTL height response
    # ========================================================

    waf_x_response, waf_y_response = (
        tn01_waf_2d(
            u_ctl_bg,
            v_ctl_bg,
            zp_response
        )
    )

    # --------------------------------------------------------
    # Store
    # --------------------------------------------------------

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
# ADD MONTH COORDINATE
# ============================================================

month_coord = np.arange(
    1,
    13
)

waf_x_exp_clim = (
    waf_x_exp_clim.assign_coords(
        month=month_coord
    )
)

waf_y_exp_clim = (
    waf_y_exp_clim.assign_coords(
        month=month_coord
    )
)

waf_x_ctl_clim = (
    waf_x_ctl_clim.assign_coords(
        month=month_coord
    )
)

waf_y_ctl_clim = (
    waf_y_ctl_clim.assign_coords(
        month=month_coord
    )
)

waf_x_diff_clim = (
    waf_x_diff_clim.assign_coords(
        month=month_coord
    )
)

waf_y_diff_clim = (
    waf_y_diff_clim.assign_coords(
        month=month_coord
    )
)

waf_x_response_clim = (
    waf_x_response_clim.assign_coords(
        month=month_coord
    )
)

waf_y_response_clim = (
    waf_y_response_clim.assign_coords(
        month=month_coord
    )
)


# ============================================================
# RWS: INDIVIDUAL MONTHLY CALCULATION
# ============================================================

print(
    "\nCalculating monthly RWS from individual monthly U/V..."
)

ntime = ue.sizes["time"]

lat = ue["lat"]
lon = ue["lon"]

shape = (
    ntime,
    len(lat),
    len(lon)
)


rws_exp_all = np.full(
    shape,
    np.nan,
    dtype=np.float32
)

rws_ctl_all = np.full(
    shape,
    np.nan,
    dtype=np.float32
)

rws_response_all = np.full(
    shape,
    np.nan,
    dtype=np.float32
)


for it in range(ntime):

    month = int(
        ue["time"].dt.month.values[it]
    )

    print(
        f"[{it + 1:4d}/{ntime}] "
        f"{str(ue.time.values[it])[:7]} "
        f"RWS"
    )

    # --------------------------------------------------------
    # Individual monthly winds
    # --------------------------------------------------------

    u_exp_month = ue.isel(
        time=it
    )

    v_exp_month = ve.isel(
        time=it
    )

    u_ctl_month = uc.isel(
        time=it
    )

    v_ctl_month = vc.isel(
        time=it
    )

    # --------------------------------------------------------
    # RWS
    # --------------------------------------------------------

    rws_exp = calculate_rws(
        u_exp_month,
        v_exp_month
    )

    rws_ctl = calculate_rws(
        u_ctl_month,
        v_ctl_month
    )

    rws_response = (
        rws_exp
        - rws_ctl
    )

    # --------------------------------------------------------
    # Store
    # --------------------------------------------------------

    rws_exp_all[it, :, :] = (
        rws_exp.values.astype(
            np.float32
        )
    )

    rws_ctl_all[it, :, :] = (
        rws_ctl.values.astype(
            np.float32
        )
    )

    rws_response_all[it, :, :] = (
        rws_response.values.astype(
            np.float32
        )
    )


# ============================================================
# CREATE MONTHLY RWS DATASET
# ============================================================

times = ue["time"]

rws_monthly = xr.Dataset(

    {

        "rws_exp": (
            ("time", "lat", "lon"),
            rws_exp_all
        ),

        "rws_ctl": (
            ("time", "lat", "lon"),
            rws_ctl_all
        ),

        "rws_response": (
            ("time", "lat", "lon"),
            rws_response_all
        )

    },

    coords={
        "time": times,
        "lat": lat,
        "lon": lon
    }
)


# ============================================================
# RWS ATTRIBUTES
# ============================================================

rws_monthly["rws_exp"].attrs = {

    "long_name":
        "Rossby Wave Source, experiment",

    "units":
        "s^-2",

    "description":
        "Calculated using individual monthly "
        "experiment U/V fields."
}


rws_monthly["rws_ctl"].attrs = {

    "long_name":
        "Rossby Wave Source, control",

    "units":
        "s^-2",

    "description":
        "Calculated using individual monthly "
        "control U/V fields."
}


rws_monthly["rws_response"].attrs = {

    "long_name":
        "Rossby Wave Source response",

    "units":
        "s^-2",

    "description":
        "Experiment RWS minus control RWS."
}


# ============================================================
# CREATE WAF CLIMATOLOGY DATASET
# ============================================================

waf_clim = xr.Dataset(

    {

        "waf_x_exp": waf_x_exp_clim,
        "waf_y_exp": waf_y_exp_clim,

        "waf_x_ctl": waf_x_ctl_clim,
        "waf_y_ctl": waf_y_ctl_clim,

        "waf_x_diff": waf_x_diff_clim,
        "waf_y_diff": waf_y_diff_clim,

        "waf_x_response":
            waf_x_response_clim,

        "waf_y_response":
            waf_y_response_clim

    }
)


# ============================================================
# WAF ATTRIBUTES
# ============================================================

waf_clim["waf_x_exp"].attrs = {

    "long_name":
        "TN01 WAF zonal component, EXP",

    "units":
        "m2 s-2",

    "description":
        "Calculated using EXP long-term monthly "
        "mean U/V and EXP long-term monthly "
        "mean zonal height perturbation."
}


waf_clim["waf_y_exp"].attrs = {

    "long_name":
        "TN01 WAF meridional component, EXP",

    "units":
        "m2 s-2",

    "description":
        "Calculated using EXP long-term monthly "
        "mean U/V and EXP long-term monthly "
        "mean zonal height perturbation."
}


waf_clim["waf_x_ctl"].attrs = {

    "long_name":
        "TN01 WAF zonal component, CTL",

    "units":
        "m2 s-2",

    "description":
        "Calculated using CTL long-term monthly "
        "mean U/V and CTL long-term monthly "
        "mean zonal height perturbation."
}


waf_clim["waf_y_ctl"].attrs = {

    "long_name":
        "TN01 WAF meridional component, CTL",

    "units":
        "m2 s-2",

    "description":
        "Calculated using CTL long-term monthly "
        "mean U/V and CTL long-term monthly "
        "mean zonal height perturbation."
}


waf_clim["waf_x_diff"].attrs = {

    "long_name":
        "TN01 WAF zonal component, EXP minus CTL",

    "units":
        "m2 s-2",

    "description":
        "EXP WAF minus CTL WAF."
}


waf_clim["waf_y_diff"].attrs = {

    "long_name":
        "TN01 WAF meridional component, EXP minus CTL",

    "units":
        "m2 s-2",

    "description":
        "EXP WAF minus CTL WAF."
}


waf_clim["waf_x_response"].attrs = {

    "long_name":
        "TN01 WAF zonal component, response",

    "units":
        "m2 s-2",

    "description":
        "Calculated using CTL long-term monthly "
        "mean U/V and long-term monthly mean "
        "EXP-CTL zonal height response."
}


waf_clim["waf_y_response"].attrs = {

    "long_name":
        "TN01 WAF meridional component, response",

    "units":
        "m2 s-2",

    "description":
        "Calculated using CTL long-term monthly "
        "mean U/V and long-term monthly mean "
        "EXP-CTL zonal height response."
}


# ============================================================
# GLOBAL ATTRIBUTES
# ============================================================

waf_clim.attrs = {

    "description":
        "200-hPa monthly climatological "
        "Takaya-Nakamura wave activity flux.",

    "background_flow":
        "Long-term calendar-month climatological U/V.",

    "exp_background":
        "EXP long-term monthly mean U/V.",

    "ctl_background":
        "CTL long-term monthly mean U/V.",

    "response_background":
        "CTL long-term monthly mean U/V.",

    "height_field":
        "Long-term calendar-month mean geopotential height.",

    "height_perturbation":
        "Zonal anomaly of long-term monthly mean height.",

    "response_height":
        "Long-term monthly mean EXP-CTL height response.",

    "pressure_normalization":
        "p/1000 hPa.",

    "latitude_mask":
        f"|latitude| < {LAT_MIN_TN01} degrees masked."
}


# ============================================================
# COMBINE RWS AND WAF
#
# WAF has only 12 calendar months.
# RWS has 1200 individual monthly records.
# Therefore they are kept in separate datasets/files.
# ============================================================

os.makedirs(
    OUT_DIR,
    exist_ok=True
)


# ============================================================
# WRITE MONTHLY RWS
# ============================================================

rws_file = os.path.join(
    OUT_DIR,
    "rws.200hPa.monthly.all_years.nc"
)

print(
    f"\nWriting RWS:\n{rws_file}"
)


rws_encoding = {

    var: {
        "zlib": True,
        "complevel": 4,
        "dtype": "float32",
        "_FillValue": FILL_VALUE
    }

    for var in rws_monthly.data_vars
}


rws_monthly.to_netcdf(
    rws_file,
    encoding=rws_encoding
)


# ============================================================
# WRITE MONTHLY CLIMATOLOGICAL WAF
# ============================================================

waf_file = os.path.join(
    OUT_DIR,
    "waf.200hPa.monthly_climatology.nc"
)

print(
    f"\nWriting WAF climatology:\n{waf_file}"
)


waf_encoding = {

    var: {
        "zlib": True,
        "complevel": 4,
        "dtype": "float32",
        "_FillValue": FILL_VALUE
    }

    for var in waf_clim.data_vars
}


waf_clim.to_netcdf(
    waf_file,
    encoding=waf_encoding
)


# ============================================================
# JJA WAF CLIMATOLOGY
# ============================================================

print(
    "\nCreating JJA WAF climatology..."
)


waf_jja = waf_clim.sel(
    month=[6, 7, 8]
)


# ------------------------------------------------------------
# Mean June-July-August
# ------------------------------------------------------------

waf_jja_mean = waf_jja.mean(
    dim="month",
    skipna=True
)


waf_jja_mean_file = os.path.join(
    OUT_DIR,
    "waf.200hPa.JJA_climatology.nc"
)


print(
    f"Writing JJA WAF climatology:\n"
    f"{waf_jja_mean_file}"
)


waf_jja_mean.to_netcdf(
    waf_jja_mean_file,
    encoding={
        var: {
            "zlib": True,
            "complevel": 4,
            "dtype": "float32",
            "_FillValue": FILL_VALUE
        }
        for var in waf_jja_mean.data_vars
    }
)


# ============================================================
# JJA MONTHLY WAF
# ============================================================

waf_jja_monthly_file = os.path.join(
    OUT_DIR,
    "waf.200hPa.JJA_monthly_climatology.nc"
)


print(
    f"Writing JJA monthly WAF:\n"
    f"{waf_jja_monthly_file}"
)


waf_jja.to_netcdf(
    waf_jja_monthly_file,
    encoding={
        var: {
            "zlib": True,
            "complevel": 4,
            "dtype": "float32",
            "_FillValue": FILL_VALUE
        }
        for var in waf_jja.data_vars
    }
)


# ============================================================
# JJA RWS
# ============================================================

print(
    "\nCreating JJA RWS..."
)


rws_jja = rws_monthly.sel(
    time=rws_monthly.time.dt.month.isin(
        [6, 7, 8]
    )
)


rws_jja_file = os.path.join(
    OUT_DIR,
    "rws.200hPa.JJA_monthly.all_years.nc"
)


print(
    f"Writing JJA monthly RWS:\n"
    f"{rws_jja_file}"
)


rws_jja.to_netcdf(
    rws_jja_file,
    encoding=rws_encoding
)


# ============================================================
# ANNUAL JJA RWS
# ============================================================

print(
    "\nCalculating annual JJA RWS means..."
)


rws_jja_yearly = (
    rws_jja
    .groupby("time.year")
    .mean(
        dim="time",
        skipna=True
    )
)


years = rws_jja_yearly[
    "year"
].values


# Use July 1 as representative time
jja_times = [

    np.datetime64(
        f"{int(y):04d}-07-01"
    )

    for y in years
]


rws_jja_yearly = (
    rws_jja_yearly
    .assign_coords(
        time=(
            "year",
            jja_times
        )
    )
)


rws_jja_yearly = (
    rws_jja_yearly
    .swap_dims(
        {"year": "time"}
    )
)


rws_jja_yearly = (
    rws_jja_yearly
    .drop_vars("year")
)


rws_jja_yearly_file = os.path.join(
    OUT_DIR,
    "rws.200hPa.JJA_mean.all_years.nc"
)


print(
    f"Writing annual JJA RWS:\n"
    f"{rws_jja_yearly_file}"
)


rws_jja_yearly.to_netcdf(
    rws_jja_yearly_file,
    encoding=rws_encoding
)


# ============================================================
# SUMMARY
# ============================================================

print(
    "\n=================================================="
)

print(
    "CALCULATION COMPLETE"
)

print(
    "=================================================="
)

print(
    "\nRWS files:"
)

print(
    "  ",
    rws_file
)

print(
    "  ",
    rws_jja_file
)

print(
    "  ",
    rws_jja_yearly_file
)

print(
    "\nWAF files:"
)

print(
    "  ",
    waf_file
)

print(
    "  ",
    waf_jja_monthly_file
)

print(
    "  ",
    waf_jja_mean_file
)

print(
    "\nWAF variables:"
)

for var in waf_clim.data_vars:

    print(
        "  ",
        var
    )

print(
    "\nRWS variables:"
)

for var in rws_monthly.data_vars:

    print(
        "  ",
        var
    )

print(
    "\n=================================================="
)
