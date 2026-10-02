#!/usr/bin/env python3

import os
import numpy as np
import xarray as xr

from windspharm.xarray import VectorWind


# ==============================================================
# USER SETTINGS
# ==============================================================

UFILE = (
    "/work/miz/rws/"
    "atmos_cmip.0101010100-0101123123.ua_unmsk.nc"
)

VFILE = (
    "/work/miz/rws/"
    "atmos_cmip.0101010100-0101123123.va_unmsk.nc"
)

OUTFILE = (
    "/work/miz/rws/"
    "atmos_cmip.0101010100-0101123123.rws.nc"
)

# Monthly mean output: ONE file containing all variables
MONTHLY_OUTFILE = (
    "/work/miz/rws/"
    "atmos_cmip.0101010100-0101123123.rws.monthly.nc"
)

# Pressure level
TARGET_PLEV = 25000.0       # Pa = 250 hPa

# Spectral truncation
TRUNCATION = 63             # T63

# Number of time steps processed at once
BLOCK_SIZE = 10

# Write monthly means
WRITE_MONTHLY = True


# ==============================================================
# OPEN INPUT FILES
# ==============================================================

print("Opening NetCDF files...")

ds_u = xr.open_dataset(UFILE)
ds_v = xr.open_dataset(VFILE)

print(ds_u)
print(ds_v)


# ==============================================================
# GET VARIABLES
# ==============================================================

u = ds_u["ua_unmsk"]
v = ds_v["va_unmsk"]


# ==============================================================
# SELECT 250-hPa LEVEL
# ==============================================================

if "plev3" in u.dims:

    print("\nAvailable pressure levels:")
    print(u["plev3"].values)

    # Select nearest level to 250 hPa
    u = u.sel(
        plev3=TARGET_PLEV,
        method="nearest"
    )

    v = v.sel(
        plev3=TARGET_PLEV,
        method="nearest"
    )

    print(
        "\nSelected pressure level:",
        float(u["plev3"].values)
    )

# ==============================================================
# SELECT 250-hPa LEVEL
# ==============================================================

if "plev3" in u.dims:

    print("\nAvailable pressure levels:")
    print(u["plev3"].values)

    # Select nearest level to 250 hPa
    u = u.sel(
        plev3=TARGET_PLEV,
        method="nearest"
    )

    v = v.sel(
        plev3=TARGET_PLEV,
        method="nearest"
    )

    print(
        "\nSelected pressure level:",
        float(u["plev3"].values)
    )

# ==============================================================
# CHECK DIMENSIONS
# ==============================================================

print("\nU dimensions:")
print(u.dims)

print("\nV dimensions:")
print(v.dims)


# ==============================================================
# MAKE SURE LATITUDE IS NORTH TO SOUTH
# ==============================================================
#
# windspharm requires latitude in descending order.
#

if u["lat"][0] < u["lat"][-1]:

    print("\nReversing latitude to north -> south")

    u = u.sortby("lat", ascending=False)
    v = v.sortby("lat", ascending=False)


# ==============================================================
# CHECK GRID
# ==============================================================

lat = u["lat"]
lon = u["lon"]
time = u["time"]

nt = len(time)
nlat = len(lat)
nlon = len(lon)

print("\nGrid:")
print("time =", nt)
print("lat  =", nlat)
print("lon  =", nlon)


# ==============================================================
# PREALLOCATE OUTPUT ARRAYS
# ==============================================================

print("\nAllocating output arrays...")

shape = (nt, nlat, nlon)

rws_out = np.full(
    shape,
    np.nan,
    dtype=np.float32
)

rws_div_out = np.full(
    shape,
    np.nan,
    dtype=np.float32
)

rws_vort_out = np.full(
    shape,
    np.nan,
    dtype=np.float32
)

div_out = np.full(
    shape,
    np.nan,
    dtype=np.float32
)

relvor_out = np.full(
    shape,
    np.nan,
    dtype=np.float32
)

absvor_out = np.full(
    shape,
    np.nan,
    dtype=np.float32
)

chi_out = np.full(
    shape,
    np.nan,
    dtype=np.float32
)

udiv_out = np.full(
    shape,
    np.nan,
    dtype=np.float32
)

vdiv_out = np.full(
    shape,
    np.nan,
    dtype=np.float32
)

urot_out = np.full(
    shape,
    np.nan,
    dtype=np.float32
)

vrot_out = np.full(
    shape,
    np.nan,
    dtype=np.float32
)


# ==============================================================
# PROCESS DATA IN TIME BLOCKS
# ==============================================================

print("\nStarting RWS calculation...")

for i0 in range(0, nt, BLOCK_SIZE):

    i1 = min(i0 + BLOCK_SIZE, nt)

    print(
        f"\nProcessing time steps "
        f"{i0}:{i1} of {nt}"
    )

    # ----------------------------------------------------------
    # Get block
    # ----------------------------------------------------------

    ub = u.isel(
        time=slice(i0, i1)
    )

    vb = v.isel(
        time=slice(i0, i1)
    )

    # ----------------------------------------------------------
    # Create VectorWind object
    # ----------------------------------------------------------

    w = VectorWind(
        ub,
        vb
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
    # Relative vorticity
    # ----------------------------------------------------------

    zeta = w.vorticity(
        truncation=TRUNCATION
    )

    # ----------------------------------------------------------
    # Divergence
    # ----------------------------------------------------------

    div = w.divergence(
        truncation=TRUNCATION
    )

    # ----------------------------------------------------------
    # Velocity potential
    #
    # u_div = d(chi)/dx
    # v_div = d(chi)/dy
    #
    # divergence = Laplacian(chi)
    # ----------------------------------------------------------

    chi = w.velocitypotential(
        truncation=TRUNCATION
    )

    # ----------------------------------------------------------
    # Divergent / irrotational wind
    # ----------------------------------------------------------

    u_div, v_div = w.irrotationalcomponent(
        truncation=TRUNCATION
    )

    # ----------------------------------------------------------
    # Rotational / non-divergent wind
    # ----------------------------------------------------------

    u_rot, v_rot = w.nondivergentcomponent(
        truncation=TRUNCATION
    )

    # ----------------------------------------------------------
    # Gradient of absolute vorticity
    #
    # windspharm returns:
    #   etax = d(eta)/dx
    #   etay = d(eta)/dy
    # ----------------------------------------------------------

    etax, etay = w.gradient(
        eta,
        truncation=TRUNCATION
    )

    # ----------------------------------------------------------
    # RWS TERM 1:
    #
    # - eta * divergence
    #
    # Positive in NH corresponds to generation of
    # anticyclonic vorticity.
    # ----------------------------------------------------------

    rws_div = -eta * div

    # ----------------------------------------------------------
    # RWS TERM 2:
    #
    # - V_div dot grad(eta)
    #
    # = -u_div*deta/dx - v_div*deta/dy
    # ----------------------------------------------------------

    rws_vortadv = (
        -u_div * etax
        -v_div * etay
    )

    # ----------------------------------------------------------
    # TOTAL RWS
    # ----------------------------------------------------------

    rws = (
        rws_div
        + rws_vortadv
    )

    # ----------------------------------------------------------
    # Store results
    # ----------------------------------------------------------

    rws_out[i0:i1, :, :] = (
        rws.values.astype(np.float32)
    )

    rws_div_out[i0:i1, :, :] = (
        rws_div.values.astype(np.float32)
    )

    rws_vort_out[i0:i1, :, :] = (
        rws_vortadv.values.astype(np.float32)
    )

    div_out[i0:i1, :, :] = (
        div.values.astype(np.float32)
    )

    relvor_out[i0:i1, :, :] = (
        zeta.values.astype(np.float32)
    )

    absvor_out[i0:i1, :, :] = (
        eta.values.astype(np.float32)
    )

    chi_out[i0:i1, :, :] = (
        chi.values.astype(np.float32)
    )

    udiv_out[i0:i1, :, :] = (
        u_div.values.astype(np.float32)
    )

    vdiv_out[i0:i1, :, :] = (
        v_div.values.astype(np.float32)
    )

    urot_out[i0:i1, :, :] = (
        u_rot.values.astype(np.float32)
    )

    vrot_out[i0:i1, :, :] = (
        v_rot.values.astype(np.float32)
    )


# ==============================================================
# CREATE OUTPUT DATASET
# ==============================================================

print("\nCreating output Dataset...")

coords = {
    "time": time,
    "lat": lat,
    "lon": lon
}

ds_out = xr.Dataset(

    data_vars={

        "rws": (
            ("time", "lat", "lon"),
            rws_out
        ),

        "rws_divergence": (
            ("time", "lat", "lon"),
            rws_div_out
        ),

        "rws_vorticity_gradient": (
            ("time", "lat", "lon"),
            rws_vort_out
        ),

        "divergence": (
            ("time", "lat", "lon"),
            div_out
        ),

        "relative_vorticity": (
            ("time", "lat", "lon"),
            relvor_out
        ),

        "absolute_vorticity": (
            ("time", "lat", "lon"),
            absvor_out
        ),

        "velocity_potential": (
            ("time", "lat", "lon"),
            chi_out
        ),

        "u_div": (
            ("time", "lat", "lon"),
            udiv_out
        ),

        "v_div": (
            ("time", "lat", "lon"),
            vdiv_out
        ),

        "u_rot": (
            ("time", "lat", "lon"),
            urot_out
        ),

        "v_rot": (
            ("time", "lat", "lon"),
            vrot_out
        )
    },

    coords=coords
)


# ==============================================================
# VARIABLE ATTRIBUTES
# ==============================================================

ds_out["rws"].attrs = {
    "long_name":
        "Rossby wave source",
    "description":
        "RWS = -eta*divergence - V_div dot grad(eta)",
    "units":
        "s-2"
}

ds_out["rws_divergence"].attrs = {
    "long_name":
        "RWS divergence term",
    "description":
        "-absolute_vorticity * divergence",
    "units":
        "s-2"
}

ds_out["rws_vorticity_gradient"].attrs = {
    "long_name":
        "RWS divergent-vorticity-gradient term",
    "description":
        "-u_div*d(eta)/dx - v_div*d(eta)/dy",
    "units":
        "s-2"
}

ds_out["divergence"].attrs = {
    "long_name":
        "Horizontal wind divergence",
    "units":
        "s-1"
}

ds_out["relative_vorticity"].attrs = {
    "long_name":
        "Relative vorticity",
    "units":
        "s-1"
}

ds_out["absolute_vorticity"].attrs = {
    "long_name":
        "Absolute vorticity",
    "units":
        "s-1"
}

ds_out["velocity_potential"].attrs = {
    "long_name":
        "Velocity potential",
    "description":
        "Divergent wind is the horizontal gradient of velocity potential",
    "units":
        "m2 s-1"
}

ds_out["u_div"].attrs = {
    "long_name":
        "Zonal divergent wind",
    "units":
        "m s-1"
}

ds_out["v_div"].attrs = {
    "long_name":
        "Meridional divergent wind",
    "units":
        "m s-1"
}

ds_out["u_rot"].attrs = {
    "long_name":
        "Zonal rotational wind",
    "units":
        "m s-1"
}

ds_out["v_rot"].attrs = {
    "long_name":
        "Meridional rotational wind",
    "units":
        "m s-1"
}


# ==============================================================
# GLOBAL ATTRIBUTES
# ==============================================================

ds_out.attrs = {

    "title":
        "250-hPa Rossby Wave Source diagnostics",

    "pressure_level":
        "250 hPa",

    "spectral_truncation":
        "T63",

    "rws_definition":
        "RWS = -eta*divergence - V_div dot grad(eta)",

    "divergent_wind":
        "Irrotational component of horizontal wind",

    "rotational_wind":
        "Non-divergent component of horizontal wind",

    "velocity_potential":
        "chi such that V_div = grad(chi)",

    "processing":
        "Calculated at original time resolution",

    "source_u":
        UFILE,

    "source_v":
        VFILE
}


# ==============================================================
# NETCDF ENCODING
# ==============================================================

encoding = {}

for varname in ds_out.data_vars:

    encoding[varname] = {
        "zlib": True,
        "complevel": 4,
        "dtype": "float32"
    }


# ==============================================================
# WRITE FULL TIME-RESOLUTION FILE
# ==============================================================

print("\n==============================================")
print("Writing full-resolution output:")
print(OUTFILE)
print("==============================================")

ds_out.to_netcdf(
    OUTFILE,
    encoding=encoding
)

print("\nFull-resolution file written successfully.")


# ==============================================================
# MONTHLY MEANS
# ==============================================================

if WRITE_MONTHLY:

    print("\n==============================================")
    print("Calculating monthly means...")
    print("==============================================")

    # ----------------------------------------------------------
    # Calculate monthly means from the time-resolved
    # diagnostic variables.
    #
    # "MS" = Month Start.
    #
    # Therefore the time coordinate is:
    #
    # 0101 -> January 1
    # 0201 -> February 1
    # 0301 -> March 1
    # etc.
    # ----------------------------------------------------------
if WRITE_MONTHLY:

    print("\n==============================================")
    print("Calculating monthly means...")
    print("==============================================")

    # ----------------------------------------------------------
    # Remove the endpoint at the beginning of the next year.
    #
    # The input has:
    #   0101-01-01 06:00
    #   ...
    #   0101-12-31 18:00
    #   0102-01-01 00:00  <-- endpoint, not part of year 0101
    # ----------------------------------------------------------

    print(
        "\nLast time before removing endpoint:",
        ds_out.time[-1].values
    )

    ds_out = ds_out.isel(
        time=slice(0, -1)
    )

    print(
        "Last time after removing endpoint:",
        ds_out.time[-1].values
    )

    # ----------------------------------------------------------
    # Calculate monthly means
    # ----------------------------------------------------------

    ds_monthly = ds_out.resample(
        time="MS"
    ).mean(
        dim="time",
        keep_attrs=True
    )
    
    # ----------------------------------------------------------
    # Add monthly metadata
    # ----------------------------------------------------------

    ds_monthly.attrs = ds_out.attrs.copy()

    ds_monthly.attrs["temporal_resolution"] = (
        "Monthly mean"
    )

    ds_monthly.attrs["monthly_averaging"] = (
        "Monthly mean calculated from the "
        "time-resolved diagnostic variables"
    )

    ds_monthly.attrs["monthly_time_coordinate"] = (
        "First day of each calendar month"
    )

    # ----------------------------------------------------------
    # Encoding
    # ----------------------------------------------------------

    monthly_encoding = {}

    for varname in ds_monthly.data_vars:

        monthly_encoding[varname] = {
            "zlib": True,
            "complevel": 4,
            "dtype": "float32"
        }

    # ----------------------------------------------------------
    # Print information
    # ----------------------------------------------------------

    print("\nMonthly dataset:")
    print(ds_monthly)

    print(
        "\nNumber of monthly records:",
        ds_monthly.sizes["time"]
    )

    print(
        "First month:",
        ds_monthly.time.values[0]
    )

    print(
        "Last month:",
        ds_monthly.time.values[-1]
    )

    # ----------------------------------------------------------
    # Write ONE monthly NetCDF file
    # ----------------------------------------------------------

    print("\n==============================================")
    print("Writing monthly mean output:")
    print(MONTHLY_OUTFILE)
    print("==============================================")

    ds_monthly.to_netcdf(
        MONTHLY_OUTFILE,
        encoding=monthly_encoding
    )

    print("\nMonthly file written successfully.")


# ==============================================================
# CLOSE INPUT DATASETS
# ==============================================================

ds_u.close()
ds_v.close()


# ==============================================================
# FINISH
# ==============================================================

print("\n==============================================")
print("RWS calculation complete.")
print("==============================================")

print("\nFull-resolution file:")
print(OUTFILE)

if WRITE_MONTHLY:

    print("\nMonthly mean file:")
    print(MONTHLY_OUTFILE)

print("\nVariables in monthly file:")

for varname in ds_monthly.data_vars:

    print("  ", varname)

print("\n==============================================")
