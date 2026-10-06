#!/usr/bin/env python

import os
import sys
import numpy as np
import xarray as xr

from rws_waf_ray_functions import (
    TARGET_LEVEL,
    FILL_VALUE,
    select_level,
    fix_latitude_order,
    zonal_anomaly,
    monthly_climatology,
    check_finite_uv,
    calculate_rws,
    tn01_waf_2d,
    find_variable,
    calculate_ray_tracing
)


# ============================================================
# COMMAND-LINE ARGUMENTS
# ============================================================

if len(sys.argv) != 6:
    print(
        "Usage:"
    )
    print(
        "python calculate_rws_waf_ray_monthly7.py "
        "EXP_DIR CTL_DIR OUT_DIR START_YEAR END_YEAR"
    )
    sys.exit(1)

EXP_DIR = sys.argv[1]
CTL_DIR = sys.argv[2]
OUT_DIR = sys.argv[3]

START_YEAR = int(sys.argv[4])
END_YEAR   = int(sys.argv[5])


U_FILE = "atmos.000201-010112.ucomp_lres_smooth9_smooth9.nc"
V_FILE = "atmos.000201-010112.vcomp_lres_smooth9_smooth9.nc"
Z_FILE = "atmos.000201-010112.hght_lres_smooth9_smooth9.nc"


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
    u_ctl_jja,
    v_ctl_jja,
    rws_diff_jja["rws"],
    background_name="CTL"
)


# ============================================================
# CREATE OUTPUT DIRECTORY
# ============================================================

os.makedirs(
    OUT_DIR,
    exist_ok=True
)


# ============================================================
# SAVE RWS
# ============================================================

print(
    "\nSaving RWS..."
)

rws_out = xr.Dataset({

    # --------------------------------------------------------
    # Monthly RWS
    # --------------------------------------------------------

    "rws_exp":
        rws_exp["rws"],

    "rws_ctl":
        rws_ctl["rws"],

    "rws_diff":
        rws_diff["rws"],

    "rws_stretch_exp":
        rws_exp["rws_stretch"],

    "rws_stretch_ctl":
        rws_ctl["rws_stretch"],

    "rws_stretch_diff":
        rws_diff["rws_stretch"],

    "rws_advect_exp":
        rws_exp["rws_advect"],

    "rws_advect_ctl":
        rws_ctl["rws_advect"],

    "rws_advect_diff":
        rws_diff["rws_advect"],


    # --------------------------------------------------------
    # Monthly climatology
    # --------------------------------------------------------

    "rws_exp_clim":
        rws_exp_clim["rws"],

    "rws_ctl_clim":
        rws_ctl_clim["rws"],

    "rws_diff_clim":
        rws_diff_clim["rws"],

    "rws_stretch_exp_clim":
        rws_exp_clim["rws_stretch"],

    "rws_stretch_ctl_clim":
        rws_ctl_clim["rws_stretch"],

    "rws_stretch_diff_clim":
        rws_diff_clim["rws_stretch"],

    "rws_advect_exp_clim":
        rws_exp_clim["rws_advect"],

    "rws_advect_ctl_clim":
        rws_ctl_clim["rws_advect"],

    "rws_advect_diff_clim":
        rws_diff_clim["rws_advect"],


    # --------------------------------------------------------
    # JJA
    # --------------------------------------------------------

    "rws_exp_JJA":
        rws_exp_jja["rws"],

    "rws_ctl_JJA":
        rws_ctl_jja["rws"],

    "rws_diff_JJA":
        rws_diff_jja["rws"],

    "rws_stretch_exp_JJA":
        rws_exp_jja["rws_stretch"],

    "rws_stretch_ctl_JJA":
        rws_ctl_jja["rws_stretch"],

    "rws_stretch_diff_JJA":
        rws_diff_jja["rws_stretch"],

    "rws_advect_exp_JJA":
        rws_exp_jja["rws_advect"],

    "rws_advect_ctl_JJA":
        rws_ctl_jja["rws_advect"],

    "rws_advect_diff_JJA":
        rws_diff_jja["rws_advect"]
})

rws_out.to_netcdf(
    os.path.join(
        OUT_DIR,
        "rws.nc"
    )
)


# ============================================================
# SAVE WAF
# ============================================================

print(
    "Saving WAF..."
)

waf_out = xr.Dataset({

    "waf_x_exp_clim":
        waf_x_exp_clim,

    "waf_y_exp_clim":
        waf_y_exp_clim,

    "waf_x_ctl_clim":
        waf_x_ctl_clim,

    "waf_y_ctl_clim":
        waf_y_ctl_clim,

    "waf_x_diff_clim":
        waf_x_diff_clim,

    "waf_y_diff_clim":
        waf_y_diff_clim,

    "waf_x_response_clim":
        waf_x_response_clim,

    "waf_y_response_clim":
        waf_y_response_clim,

    "zprime_exp_clim":
        ze_prime_clim,

    "zprime_ctl_clim":
        zc_prime_clim,

    "zprime_response_clim":
        z_response_prime_clim,

    "waf_x_exp_JJA":
        waf_x_exp_jja,

    "waf_y_exp_JJA":
        waf_y_exp_jja,

    "waf_x_ctl_JJA":
        waf_x_ctl_jja,

    "waf_y_ctl_JJA":
        waf_y_ctl_jja,

    "waf_x_diff_JJA":
        waf_x_diff_jja,

    "waf_y_diff_JJA":
        waf_y_diff_jja,

    "waf_x_response_JJA":
        waf_x_response_jja,

    "waf_y_response_JJA":
        waf_y_response_jja,

    "zprime_exp_JJA":
        z_exp_jja_prime,

    "zprime_ctl_JJA":
        z_ctl_jja_prime,

    "zprime_response_JJA":
        z_response_jja_prime
})

waf_out.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf.nc"
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
    "\nOutput files:"
)

print(
    os.path.join(
        OUT_DIR,
        "rws.nc"
    )
)

print(
    os.path.join(
        OUT_DIR,
        "waf.nc"
    )
)

print(
    os.path.join(
        OUT_DIR,
        "rossby_wave_ray_tracing_JJA.nc"
    )
)
