#!/usr/bin/env python3

import numpy as np
import xarray as xr

from windspharm.xarray import VectorWind


# ==============================================================
# USER SETTINGS
# ==============================================================

UFILE = "atmos_cmip.0101010100-0101123123.ua_unmsk.nc"
VFILE = "atmos_cmip.0101010100-0101123123.va_unmsk.nc"

OUTFILE = "/work/miz/rws/atmos_cmip.0101010100-0101123123.rws.nc"

# Pressure level to use.
# Change this to the pressure you want.
#
# plev3 is in Pa.
#
# Examples:
#   20000 Pa = 200 hPa
#   30000 Pa = 300 hPa
#   50000 Pa = 500 hPa
#
TARGET_PRESSURE = 25000.0

# Spectral truncation.
#
# None = full available spectral resolution
# 42   = T42
# 63   = T63
#
# For 576 x 360 data, T170-ish is approximately the native
# triangular spectral resolution. For RWS, T63 or T85 is often
# sufficient and provides some scale filtering.
TRUNCATION = 63

# Process this many time steps at once.
# Reduces memory requirements.
TIME_BLOCK = 10


# ==============================================================
# READ DATA
# ==============================================================

print("Opening NetCDF files...")

ds_u = xr.open_dataset(UFILE)
ds_v = xr.open_dataset(VFILE)

print(ds_u)
print(ds_v)


# ==============================================================
# READ WIND VARIABLES
# ==============================================================

u = ds_u["ua_unmsk"]
v = ds_v["va_unmsk"]


# ==============================================================
# CHECK THAT COORDINATES MATCH
# ==============================================================

if not np.allclose(ds_u["lat"].values, ds_v["lat"].values):
    raise ValueError("Latitude coordinates of U and V do not match.")

if not np.allclose(ds_u["lon"].values, ds_v["lon"].values):
    raise ValueError("Longitude coordinates of U and V do not match.")

if not np.allclose(ds_u["plev3"].values, ds_v["plev3"].values):
    raise ValueError("Pressure coordinates of U and V do not match.")

if not ds_u["time"].equals(ds_v["time"]):
    raise ValueError("Time coordinates of U and V do not match.")

# ==============================================================
# SELECT PRESSURE LEVEL
# ==============================================================

plevs = ds_u["plev3"].values

print("\nAvailable pressure levels:")
print(plevs)

# Find nearest pressure level
ip = np.argmin(np.abs(plevs - TARGET_PRESSURE))

actual_pressure = plevs[ip]

print(
    f"\nRequested pressure = {TARGET_PRESSURE} Pa "
    f"({TARGET_PRESSURE/100:.1f} hPa)"
)

print(
    f"Using pressure = {actual_pressure} Pa "
    f"({actual_pressure/100:.1f} hPa)"
)

u = u.isel(plev3=ip)
v = v.isel(plev3=ip)


# ==============================================================
# ENSURE DIMENSION ORDER
#
# Windspharm expects latitude, longitude as the horizontal
# dimensions. The xarray interface handles the metadata, but
# putting the dimensions in this order makes the calculation
# explicit.
# ==============================================================

u = u.transpose("time", "lat", "lon")
v = v.transpose("time", "lat", "lon")


# ==============================================================
# CHECK LATITUDE ORDER
#
# windspharm requires latitude from NORTH -> SOUTH.
# ==============================================================

lat = u["lat"].values

if lat[0] < lat[-1]:

    print("Latitude is south -> north. Reversing latitude.")

    u = u.isel(lat=slice(None, None, -1))
    v = v.isel(lat=slice(None, None, -1))


# ==============================================================
# OUTPUT ARRAYS
# ==============================================================

ntime = u.sizes["time"]
nlat  = u.sizes["lat"]
nlon  = u.sizes["lon"]

print("\nData dimensions:")
print("time =", ntime)
print("lat  =", nlat)
print("lon  =", nlon)


rws_all = np.empty(
    (ntime, nlat, nlon),
    dtype=np.float32
)


# Optional diagnostic fields
div_all = np.empty(
    (ntime, nlat, nlon),
    dtype=np.float32
)

eta_all = np.empty(
    (ntime, nlat, nlon),
    dtype=np.float32
)


# ==============================================================
# LOOP OVER TIME BLOCKS
# ==============================================================

for i0 in range(0, ntime, TIME_BLOCK):

    i1 = min(i0 + TIME_BLOCK, ntime)

    print(
        f"\nProcessing time {i0}:{i1} "
        f"of {ntime}"
    )

    # ----------------------------------------------------------
    # Load block into memory
    # ----------------------------------------------------------

    ub = u.isel(time=slice(i0, i1)).load()
    vb = v.isel(time=slice(i0, i1)).load()

    # ----------------------------------------------------------
    # Check for missing values
    # ----------------------------------------------------------

    if np.any(~np.isfinite(ub.values)):
        raise ValueError(
            f"Missing/nonfinite U values in time block {i0}:{i1}"
        )

    if np.any(~np.isfinite(vb.values)):
        raise ValueError(
            f"Missing/nonfinite V values in time block {i0}:{i1}"
        )

    # ----------------------------------------------------------
    # windspharm
    # ----------------------------------------------------------

    w = VectorWind(
        ub,
        vb,
        rsphere=6.3712e6,
        legfunc="computed"
    )

    # ----------------------------------------------------------
    # Absolute vorticity
    #
    # eta = relative vorticity + planetary vorticity
    # ----------------------------------------------------------

    eta = w.absolutevorticity(
        truncation=TRUNCATION
    )

    # ----------------------------------------------------------
    # Divergence
    # ----------------------------------------------------------

    div = w.divergence(
        truncation=TRUNCATION
    )

    # ----------------------------------------------------------
    # Divergent wind
    #
    # uchi, vchi =
    # irrotational/divergent component
    # ----------------------------------------------------------

    uchi, vchi = w.irrotationalcomponent(
        truncation=TRUNCATION
    )

    # ----------------------------------------------------------
    # Gradient of absolute vorticity
    # ----------------------------------------------------------

    etax, etay = w.gradient(
        eta,
        truncation=TRUNCATION
    )

    # ----------------------------------------------------------
    # Rossby Wave Source
    #
    # S = -eta * div
    #     - uchi * d(eta)/dx
    #     - vchi * d(eta)/dy
    #
    # Units: s^-2
    # ----------------------------------------------------------

    S = (
        -eta * div
        -uchi * etax
        -vchi * etay
    )

    # ----------------------------------------------------------
    # Store
    # ----------------------------------------------------------

    rws_all[i0:i1, :, :] = S.values.astype(np.float32)

    div_all[i0:i1, :, :] = div.values.astype(np.float32)

    eta_all[i0:i1, :, :] = eta.values.astype(np.float32)


# ==============================================================
# CONVERT TO XARRAY
# ==============================================================

time = u["time"]
lat = u["lat"]
lon = u["lon"]


rws_da = xr.DataArray(
    rws_all,
    dims=("time", "lat", "lon"),
    coords={
        "time": time,
        "lat": lat,
        "lon": lon
    },
    name="rws"
)


div_da = xr.DataArray(
    div_all,
    dims=("time", "lat", "lon"),
    coords={
        "time": time,
        "lat": lat,
        "lon": lon
    },
    name="divergence"
)


eta_da = xr.DataArray(
    eta_all,
    dims=("time", "lat", "lon"),
    coords={
        "time": time,
        "lat": lat,
        "lon": lon
    },
    name="absolute_vorticity"
)


# ==============================================================
# ADD METADATA
# ==============================================================

rws_da.attrs = {
    "long_name":
        "Rossby Wave Source",

    "description":
        "Rossby Wave Source calculated as "
        "-eta*div(Vchi) - Vchi dot grad(eta)",

    "units":
        "s-2",

    "pressure":
        f"{actual_pressure} Pa",

    "pressure_hPa":
        f"{actual_pressure/100.0} hPa",

    "spectral_truncation":
        str(TRUNCATION),

    "method":
        "Spherical harmonic Helmholtz decomposition "
        "using windspharm"
}


div_da.attrs = {
    "long_name":
        "Horizontal divergence",

    "units":
        "s-1"
}


eta_da.attrs = {
    "long_name":
        "Absolute vorticity",

    "units":
        "s-1"
}


# ==============================================================
# CREATE OUTPUT DATASET
# ==============================================================

ds_out = xr.Dataset(
    {
        "rws": rws_da,
        "divergence": div_da,
        "absolute_vorticity": eta_da
    }
)


# Add useful global metadata

ds_out.attrs["title"] = (
    "Rossby Wave Source calculated from atmospheric wind"
)

ds_out.attrs["source_u"] = UFILE
ds_out.attrs["source_v"] = VFILE

ds_out.attrs["method"] = (
    "Spherical harmonic calculation using windspharm"
)

ds_out.attrs["rws_equation"] = (
    "RWS = -eta*div(Vchi) - Vchi dot grad(eta)"
)

ds_out.attrs["earth_radius"] = "6371200 m"


# ==============================================================
# WRITE NETCDF
# ==============================================================

print("\nWriting output:")

print(OUTFILE)

encoding = {
    "rws": {
        "zlib": True,
        "complevel": 4,
        "dtype": "float32"
    },

    "divergence": {
        "zlib": True,
        "complevel": 4,
        "dtype": "float32"
    },

    "absolute_vorticity": {
        "zlib": True,
        "complevel": 4,
        "dtype": "float32"
    }
}


ds_out.to_netcdf(
    OUTFILE,
    encoding=encoding
)


# ==============================================================
# CLOSE FILES
# ==============================================================

ds_u.close()
ds_v.close()

print("\n==============================================")
print("RWS calculation complete.")
print("Output:")
print(OUTFILE)
print("==============================================")
