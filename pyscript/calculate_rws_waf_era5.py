#!/usr/bin/env python

import os
import numpy as np
import xarray as xr

from rws_waf_functions import (
    select_level,
    fix_latitude_order,
    zonal_anomaly,
    monthly_climatology,
    calculate_rws,
    tn01_waf_2d
)


# ============================================================
# COMMAND-LINE ARGUMENTS
# ============================================================

if len(sys.argv) != 2:
    print(
        "Usage:"
    )
    print(
        "python calculate_rws_waf_era5.py "
        "OUT_DIR"
    )
    sys.exit(1)

OUT_DIR = sys.argv[1]

ERA5_DIR = "/work/miz/rws_waf_ray_monthly/era5"

ERA5_U_FILE = "ERA5_197901-202012.ucomp_lres.nc"
ERA5_V_FILE = "ERA5_197901-202012.vcomp_lres.nc"
ERA5_Z_FILE = "ERA5_197901-202012.hght_lres.nc"

TARGET_LEVEL = 200.0


# ============================================================
# OPEN ERA5 DATA
# ============================================================

print("\nOpening ERA5 files...")

decoder = xr.coders.CFDatetimeCoder(
    use_cftime=True
)

era5_u_ds = xr.open_dataset(
    os.path.join(
        ERA5_DIR,
        "data",
        ERA5_U_FILE
    ),
    decode_times=decoder
)

era5_v_ds = xr.open_dataset(
    os.path.join(
        ERA5_DIR,
        "data",
        ERA5_V_FILE
    ),
    decode_times=decoder
)

era5_z_ds = xr.open_dataset(
    os.path.join(
        ERA5_DIR,
        "data",
        ERA5_Z_FILE
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


era5_u = find_variable(
    era5_u_ds,
    ["ucomp", "ua", "u", "U"]
)

era5_v = find_variable(
    era5_v_ds,
    ["vcomp", "va", "v", "V"]
)

era5_z = find_variable(
    era5_z_ds,
    ["hght", "zg", "z", "height"]
)


# ============================================================
# SELECT 200 hPa
# ============================================================

print("\nSelecting 200 hPa...")

era5_u = select_level(
    era5_u,
    TARGET_LEVEL
)

era5_v = select_level(
    era5_v,
    TARGET_LEVEL
)

era5_z = select_level(
    era5_z,
    TARGET_LEVEL
)


# ============================================================
# FIX LATITUDE ORDER
# ============================================================

era5_u = fix_latitude_order(
    era5_u
)

era5_v = fix_latitude_order(
    era5_v
)

era5_z = fix_latitude_order(
    era5_z
)


# ============================================================
# RENAME ERA5 TIME DIMENSION
# ============================================================

era5_u = era5_u.rename(
    {"valid_time": "time"}
)

era5_v = era5_v.rename(
    {"valid_time": "time"}
)

era5_z = era5_z.rename(
    {"valid_time": "time"}
)


# ============================================================
# CHECK ERA5 TIME
# ============================================================

print(
    "\nNumber of ERA5 months:",
    era5_u.sizes["time"]
)

if (
    era5_u.sizes["time"]
    != era5_v.sizes["time"]
):

    raise ValueError(
        "ERA5 U and V have different "
        "numbers of time records."
    )

if (
    era5_u.sizes["time"]
    != era5_z.sizes["time"]
):

    raise ValueError(
        "ERA5 U and height have different "
        "numbers of time records."
    )


if not np.array_equal(
    era5_u["time"].values,
    era5_v["time"].values
):

    raise ValueError(
        "ERA5 U and V time coordinates do not match."
    )

if not np.array_equal(
    era5_u["time"].values,
    era5_z["time"].values
):

    raise ValueError(
        "ERA5 U and height time coordinates do not match."
    )


# ============================================================
# MONTHLY CLIMATOLOGY
# ============================================================

print(
    "\nCalculating ERA5 monthly climatologies..."
)

era5_u_clim = monthly_climatology(
    era5_u
)

era5_v_clim = monthly_climatology(
    era5_v
)

era5_z_clim = monthly_climatology(
    era5_z
)

era5_zprime_clim = zonal_anomaly(
    era5_z_clim
)


# ============================================================
# ERA5 RWS CALCULATION
# ============================================================

print(
    "\nCalculating ERA5 monthly RWS..."
)

rws_era5 = []

nmonths_era5 = era5_u.sizes["time"]

for it in range(nmonths_era5):

    print(
        f"  RWS month "
        f"{it + 1:04d}/{nmonths_era5:04d}",
        end="\r"
    )

    u_era5 = era5_u.isel(
        time=it
    )

    v_era5 = era5_v.isel(
        time=it
    )

    rws_era5.append(
        calculate_rws(
            u_era5,
            v_era5
        )
    )

print()


# ============================================================
# CONVERT RWS LIST TO XARRAY
# ============================================================

rws_era5 = xr.concat(
    rws_era5,
    dim="time"
)

rws_era5 = rws_era5.assign_coords(
    time=era5_u["time"]
)


# ============================================================
# MONTHLY RWS CLIMATOLOGY
# ============================================================

print(
    "\nCalculating ERA5 monthly RWS climatologies..."
)

rws_era5_clim = monthly_climatology(
    rws_era5
)


# ============================================================
# JJA MEANS
# ============================================================

print(
    "\nCalculating ERA5 JJA means..."
)

rws_era5_jja = (
    rws_era5
    .where(
        rws_era5["time"].dt.month.isin(
            [6, 7, 8]
        ),
        drop=True
    )
    .mean(
        dim="time",
        skipna=True
    )
)

u_era5_jja = (
    era5_u
    .where(
        era5_u["time"].dt.month.isin(
            [6, 7, 8]
        ),
        drop=True
    )
    .mean(
        dim="time",
        skipna=True
    )
)

v_era5_jja = (
    era5_v
    .where(
        era5_v["time"].dt.month.isin(
            [6, 7, 8]
        ),
        drop=True
    )
    .mean(
        dim="time",
        skipna=True
    )
)

z_era5_jja = (
    era5_z
    .where(
        era5_z["time"].dt.month.isin(
            [6, 7, 8]
        ),
        drop=True
    )
    .mean(
        dim="time",
        skipna=True
    )
)

z_era5_jja_prime = zonal_anomaly(
    z_era5_jja
)


# ============================================================
# CALCULATE MONTHLY TN01 WAF
# ============================================================

print(
    "\nCalculating ERA5 monthly TN01 WAF..."
)

waf_x_era5_clim = []
waf_y_era5_clim = []

for month in range(1, 13):

    print(
        f"  Calculating WAF for month {month:02d}..."
    )

    u_era5_bg = era5_u_clim.sel(
        month=month
    )

    v_era5_bg = era5_v_clim.sel(
        month=month
    )

    zp_era5 = era5_zprime_clim.sel(
        month=month
    )

    waf_x_era5, waf_y_era5 = (
        tn01_waf_2d(
            u_era5_bg,
            v_era5_bg,
            zp_era5
        )
    )

    waf_x_era5_clim.append(
        waf_x_era5
    )

    waf_y_era5_clim.append(
        waf_y_era5
    )


# ============================================================
# CONVERT WAF LISTS TO XARRAY
# ============================================================

print(
    "\nConverting ERA5 WAF climatologies to xarray..."
)

waf_x_era5_clim = xr.concat(
    waf_x_era5_clim,
    dim="month"
)

waf_y_era5_clim = xr.concat(
    waf_y_era5_clim,
    dim="month"
)


# ============================================================
# CALCULATE JJA WAF
# ============================================================

print(
    "\nCalculating ERA5 JJA WAF..."
)

waf_x_era5_jja, waf_y_era5_jja = (
    tn01_waf_2d(
        u_era5_jja,
        v_era5_jja,
        z_era5_jja_prime
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
# COMBINE ERA5 MONTHLY RWS
# ============================================================

rws_era5_monthly_out = xr.Dataset(
    {
        "rws": rws_era5["rws"],
        "rws_stretch": rws_era5["rws_stretch"],
        "rws_advect": rws_era5["rws_advect"]
    }
)


# ============================================================
# COMBINE ERA5 MONTHLY RWS CLIMATOLOGIES
# ============================================================

rws_era5_clim_out = xr.Dataset(
    {
        "rws": rws_era5_clim["rws"],
        "rws_stretch": rws_era5_clim["rws_stretch"],
        "rws_advect": rws_era5_clim["rws_advect"]
    }
)


# ============================================================
# COMBINE ERA5 JJA RWS
# ============================================================

rws_era5_jja_out = xr.Dataset(
    {
        "rws": rws_era5_jja["rws"],
        "rws_stretch": rws_era5_jja["rws_stretch"],
        "rws_advect": rws_era5_jja["rws_advect"]
    }
)


# ============================================================
# COMBINE ERA5 MONTHLY WAF CLIMATOLOGIES
# ============================================================

waf_era5_clim_out = xr.Dataset(
    {
        "waf_x": waf_x_era5_clim,
        "waf_y": waf_y_era5_clim,
        "zprime": era5_zprime_clim
    }
)


# ============================================================
# COMBINE ERA5 JJA WAF
# ============================================================

waf_era5_jja_out = xr.Dataset(
    {
        "waf_x": waf_x_era5_jja,
        "waf_y": waf_y_era5_jja,
        "zprime": z_era5_jja_prime
    }
)


# ============================================================
# SAVE ERA5 MONTHLY RWS
# ============================================================

print(
    "\nSaving ERA5 monthly RWS..."
)

rws_era5_monthly_out.to_netcdf(
    os.path.join(
        OUT_DIR,
        "rws_ERA5_monthly.nc"
    )
)


# ============================================================
# SAVE ERA5 MONTHLY RWS CLIMATOLOGIES
# ============================================================

print(
    "Saving ERA5 monthly RWS climatologies..."
)

rws_era5_clim_out.to_netcdf(
    os.path.join(
        OUT_DIR,
        "rws_ERA5_clim.nc"
    )
)


# ============================================================
# SAVE ERA5 JJA RWS
# ============================================================

print(
    "Saving ERA5 JJA RWS..."
)

rws_era5_jja_out.to_netcdf(
    os.path.join(
        OUT_DIR,
        "rws_ERA5_JJA.nc"
    )
)


# ============================================================
# SAVE ERA5 MONTHLY WAF CLIMATOLOGIES
# ============================================================

print(
    "Saving ERA5 monthly WAF climatologies..."
)

waf_era5_clim_out.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_ERA5_clim.nc"
    )
)


# ============================================================
# SAVE ERA5 JJA WAF
# ============================================================

print(
    "Saving ERA5 JJA WAF..."
)

waf_era5_jja_out.to_netcdf(
    os.path.join(
        OUT_DIR,
        "waf_ERA5_JJA.nc"
    )
)


# ============================================================
# FINISHED
# ============================================================

print(
    "\nAll ERA5 RWS and WAF calculations "
    "completed successfully."
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
        "rws_ERA5_monthly.nc"
    )
)

print(
    os.path.join(
        OUT_DIR,
        "rws_ERA5_clim.nc"
    )
)

print(
    os.path.join(
        OUT_DIR,
        "rws_ERA5_JJA.nc"
    )
)

print(
    os.path.join(
        OUT_DIR,
        "waf_ERA5_clim.nc"
    )
)

print(
    os.path.join(
        OUT_DIR,
        "waf_ERA5_JJA.nc"
    )
)
