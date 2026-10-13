#!/usr/bin/env python

import numpy as np
import xarray as xr

from rws_waf_ray_functions import (
    tn01_waf_2d,
    G,
    OMEGA
)


# ============================================================
# TEST SETTINGS
# ============================================================

U0 = 20.0          # m/s
V0 = 5.0           # m/s

m = 5.0            # zonal angular wavenumber
l = 2.0            # meridional angular wavenumber

PSI0 = 1.0e7       # m2/s

# ============================================================
# TEST GRID
# ============================================================

lat = np.arange(
    15.0,
    76.0,
    1.0
)

lon = np.arange(
    0.0,
    360.0,
    1.0
)

lat_rad = np.deg2rad(lat)
lon_rad = np.deg2rad(lon)

lon2d, lat2d = np.meshgrid(
    lon_rad,
    lat_rad
)

# ============================================================
# ANALYTIC GEOPOTENTIAL-HEIGHT WAVE
#
# Z' = Z0 cos(m lambda + l phi)
#
# This directly tests the local-f derivative convention used
# by tn01_waf_2d().
# ============================================================

Z0 = 100.0       # meters

phase = (
    m * lon2d
    + l * lat2d
)

zprime = (
    Z0
    * np.cos(phase)
)
zprime = xr.DataArray(
    zprime,
    coords={
        "lat": lat,
        "lon": lon
    },
    dims=("lat", "lon"),
    name="zprime"
)
# ============================================================
# XARRAY FIELDS
# ============================================================

zprime = xr.DataArray(
    zprime,
    coords={
        "lat": lat,
        "lon": lon
    },
    dims=("lat", "lon"),
    name="zprime"
)

u = xr.full_like(
    zprime,
    U0
)

v = xr.full_like(
    zprime,
    V0
)


# ============================================================
# CALCULATE TN01 WAF
# ============================================================

waf_x, waf_y = tn01_waf_2d(
    u,
    v,
    zprime,
    print_diagnostics=True
)


# ============================================================
# CHECK AT 45 N
# ============================================================

wx45 = waf_x.sel(
    lat=45.0
)

wy45 = waf_y.sel(
    lat=45.0
)

ratio_numeric = (
    wy45 / wx45
)

# ============================================================
# ANALYTIC EXPECTED RATIO
# ============================================================

phi45 = np.deg2rad(45.0)

cos45 = np.cos(phi45)

ratio_expected = (
    (
        U0 / cos45 * m * l
        + V0 * l**2
    )
    /
    (
        U0 / cos45**2 * m**2
        + V0 / cos45 * m * l
    )
)


print()
print("========================================")
print("TN01 ANALYTIC TEST")
print("========================================")

print(
    f"m = {m:.1f}"
)

print(
    f"l = {l:.1f}"
)

print(
    f"Expected Wy/Wx at 45N = "
    f"{ratio_expected:.6f}"
)

print(
    f"Numerical mean Wy/Wx at 45N = "
    f"{float(ratio_numeric.mean(skipna=True)):.6f}"
)

print(
    f"Numerical min Wy/Wx at 45N = "
    f"{float(ratio_numeric.min(skipna=True)):.6f}"
)

print(
    f"Numerical max Wy/Wx at 45N = "
    f"{float(ratio_numeric.max(skipna=True)):.6f}"
)
# ============================================================
# EXPECTED COMPONENT RATIOS AT 45 N
# ============================================================

fxu_expected = (
    U0 / cos45**2
    * m**2
)

fxv_expected = (
    V0 / cos45
    * m * l
)

fyu_expected = (
    U0 / cos45
    * m * l
)

fyv_expected = (
    V0
    * l**2
)

print()
print("Expected relative component magnitudes at 45N:")
print(
    f"  fx_u = {fxu_expected:.6f}"
)
print(
    f"  fx_v = {fxv_expected:.6f}"
)
print(
    f"  fy_u = {fyu_expected:.6f}"
)
print(
    f"  fy_v = {fyv_expected:.6f}"
)

print()
print("Expected component ratios:")
print(
    f"  fx_v/fx_u = "
    f"{fxv_expected/fxu_expected:.6f}"
)
print(
    f"  fy_u/fx_u = "
    f"{fyu_expected/fxu_expected:.6f}"
)
print(
    f"  fy_v/fx_u = "
    f"{fyv_expected/fxu_expected:.6f}"
)
