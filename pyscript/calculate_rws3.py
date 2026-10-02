#!/usr/bin/env python3

import numpy as np
import xarray as xr
from windspharm.xarray import VectorWind


# ============================================================
# Settings
# ============================================================

UFILE = "/work/miz/rws/atmos_cmip.0101010100-0101123123.ua_unmsk.nc"
VFILE = "/work/miz/rws/atmos_cmip.0101010100-0101123123.va_unmsk.nc"
ZGFILE = "/work/miz/rws/atmos_cmip.0101010100-0101123123.zg_unmsk.nc"

UVAR = "ua_unmsk"
VVAR = "va_unmsk"
ZGVAR = "zg_unmsk"

OUTFILE = "/work/miz/rws/atmos_cmip.0101010100-0101123123.rws.nc"
MONTHLY_OUTFILE = "/work/miz/rws/atmos_cmip.0101010100-0101123123.rws.monthly.nc"

TARGET_PLEV = 25000       # Pa = 250 hPa
TRUNCATION = 63
BLOCK_SIZE = 10

WRITE_MONTHLY = True

# Earth
EARTH_RADIUS = 6.371e6
GRAVITY = 9.80665
OMEGA = 7.292115e-5

# TN01 pressure normalization
# p = 250 / 1000 = 0.25 at 250 hPa
PRESSURE_NORMALIZED = TARGET_PLEV / 100000.0

# Avoid division by very weak basic flow
WAF_MIN_WIND = 5.0        # m/s

# TN01 is not appropriate very close to the equator
WAF_MIN_ABS_LAT = 10.0    # degrees


# ============================================================
# Helper: Takaya-Nakamura WAF
# ============================================================

def calculate_tn_waf(
    psi_prime,
    u_basic,
    v_basic,
    lat_deg,
    lon_deg,
    earth_radius=6.371e6,
    pressure_normalized=0.25,
    min_wind=5.0,
    min_abs_lat=10.0,
):
    """
    Takaya-Nakamura (2001) stationary-wave activity flux.

    Parameters
    ----------
    psi_prime : ndarray
        Perturbation geostrophic streamfunction [m2 s-1].
        Shape: (time, lat, lon)

    u_basic, v_basic : ndarray
        Basic-state horizontal wind [m s-1].
        Shape: (lat, lon)

    lat_deg, lon_deg : ndarray
        Latitude and longitude in degrees.

    Returns
    -------
    waf_u, waf_v : ndarray
        Eastward and northward WAF components.
        Shape: (time, lat, lon)
        Units approximately m2 s-2.
    """

    a = earth_radius

    lat_rad = np.deg2rad(lat_deg)
    lon_rad = np.deg2rad(lon_deg)

    cos_phi = np.cos(lat_rad)

    # --------------------------------------------------------
    # Grid spacing
    # --------------------------------------------------------

    dlon = np.mean(np.diff(lon_rad))
    dlat = np.mean(np.diff(lat_rad))

    # --------------------------------------------------------
    # Basic-state wind
    # --------------------------------------------------------

    U = u_basic[np.newaxis, :, :]
    V = v_basic[np.newaxis, :, :]

    wind_speed = np.sqrt(U**2 + V**2)

    # --------------------------------------------------------
    # Derivatives of psi'
    #
    # Longitude:
    # periodic centered differences
    #
    # Latitude:
    # centered finite differences
    # --------------------------------------------------------

    psi_lambda = (
        np.roll(psi_prime, -1, axis=2)
        - np.roll(psi_prime, 1, axis=2)
    ) / (2.0 * dlon)

    psi_ll = (
        np.roll(psi_prime, -1, axis=2)
        - 2.0 * psi_prime
        + np.roll(psi_prime, 1, axis=2)
    ) / (dlon**2)

    psi_phi = np.gradient(
        psi_prime,
        dlat,
        axis=1,
        edge_order=2,
    )

    psi_phiphi = np.gradient(
        psi_phi,
        dlat,
        axis=1,
        edge_order=2,
    )

    # Mixed derivative
    psi_lambdaphi = np.gradient(
        psi_lambda,
        dlat,
        axis=1,
        edge_order=2,
    )

    # --------------------------------------------------------
    # Latitude factors
    # --------------------------------------------------------

    cos_phi_3d = cos_phi[np.newaxis, :, np.newaxis]

    # --------------------------------------------------------
    # TN01 terms
    # --------------------------------------------------------

    term_xx = (
        psi_lambda**2
        - psi_prime * psi_ll
    )

    term_xy = (
        psi_lambda * psi_phi
        - psi_prime * psi_lambdaphi
    )

    term_yy = (
        psi_phi**2
        - psi_prime * psi_phiphi
    )

    # --------------------------------------------------------
    # TN01 prefactor
    #
    # p cos(phi) / (2 |U|)
    # --------------------------------------------------------

    prefactor = (
        pressure_normalized
        * cos_phi_3d
        / (2.0 * wind_speed)
    )

    # --------------------------------------------------------
    # Eastward component
    # --------------------------------------------------------

    waf_u = prefactor * (
        U / (a**2 * cos_phi_3d**2) * term_xx
        +
        V / (a**2 * cos_phi_3d) * term_xy
    )

    # --------------------------------------------------------
    # Northward component
    # --------------------------------------------------------

    waf_v = prefactor * (
        U / (a**2 * cos_phi_3d) * term_xy
        +
        V / a**2 * term_yy
    )

    # --------------------------------------------------------
    # Mask weak basic flow
    # --------------------------------------------------------

    bad_basic_flow = wind_speed < min_wind

    # --------------------------------------------------------
    # Mask equatorial region
    # --------------------------------------------------------

    bad_lat = (
        np.abs(lat_deg)[np.newaxis, :, np.newaxis]
        < min_abs_lat
    )

    bad_lat = np.broadcast_to(
        bad_lat,
        waf_u.shape,
    )

    bad = bad_basic_flow | bad_lat

    waf_u = np.where(bad, np.nan, waf_u)
    waf_v = np.where(bad, np.nan, waf_v)

    return waf_u, waf_v


# ============================================================
# Open input files
# ============================================================

print("Opening NetCDF files...")

ds_u = xr.open_dataset(UFILE)
ds_v = xr.open_dataset(VFILE)
ds_zg = xr.open_dataset(ZGFILE)

u_all = ds_u[UVAR]
v_all = ds_v[VVAR]
zg_all = ds_zg[ZGVAR]

print("U:")
print(u_all)

print("V:")
print(v_all)

print("ZG:")
print(zg_all)


# ============================================================
# Select 250 hPa
# ============================================================

u = u_all.sel(
    plev3=TARGET_PLEV,
    method="nearest",
)

v = v_all.sel(
    plev3=TARGET_PLEV,
    method="nearest",
)

zg = zg_all.sel(
    plev3=TARGET_PLEV,
    method="nearest",
)

print("")
print("Selected pressure level:")

if "plev3" in u.coords:
    print("U:", u["plev3"].values)
else:
    print("U:", TARGET_PLEV)

if "plev3" in zg.coords:
    print("ZG:", zg["plev3"].values)
else:
    print("ZG:", TARGET_PLEV)


# ============================================================
# Check time alignment
# ============================================================

print("")
print("Checking time alignment...")

if not np.array_equal(
    u.time.values,
    v.time.values,
):
    raise ValueError(
        "U and V time coordinates do not match."
    )

if not np.array_equal(
    u.time.values,
    zg.time.values,
):
    raise ValueError(
        "U and ZG time coordinates do not match."
    )

print("U, V, and ZG time coordinates match.")


# ============================================================
# Make latitude north-to-south for windspharm
# ============================================================

if u.lat.values[0] < u.lat.values[-1]:

    print(
        "Reversing latitude from "
        "south-to-north to north-to-south."
    )

    u = u.isel(
        lat=slice(None, None, -1)
    )

    v = v.isel(
        lat=slice(None, None, -1)
    )

    zg = zg.isel(
        lat=slice(None, None, -1)
    )


# ============================================================
# Coordinates
# ============================================================

lat = u.lat.values
lon = u.lon.values
time = u.time.values

nt = len(time)
nlat = len(lat)
nlon = len(lon)

print("")
print("nt   =", nt)
print("nlat =", nlat)
print("nlon =", nlon)

print("lat range:", lat[0], lat[-1])
print("lon range:", lon[0], lon[-1])


# ============================================================
# Preallocate diagnostics
# ============================================================

rws_out = np.empty(
    (nt, nlat, nlon),
    dtype=np.float32,
)

rws_div_out = np.empty(
    (nt, nlat, nlon),
    dtype=np.float32,
)

rws_vortadv_out = np.empty(
    (nt, nlat, nlon),
    dtype=np.float32,
)

div_out = np.empty(
    (nt, nlat, nlon),
    dtype=np.float32,
)

zeta_out = np.empty(
    (nt, nlat, nlon),
    dtype=np.float32,
)

eta_out = np.empty(
    (nt, nlat, nlon),
    dtype=np.float32,
)

chi_out = np.empty(
    (nt, nlat, nlon),
    dtype=np.float32,
)

psi_out = np.empty(
    (nt, nlat, nlon),
    dtype=np.float32,
)

u_div_out = np.empty(
    (nt, nlat, nlon),
    dtype=np.float32,
)

v_div_out = np.empty(
    (nt, nlat, nlon),
    dtype=np.float32,
)

u_rot_out = np.empty(
    (nt, nlat, nlon),
    dtype=np.float32,
)

v_rot_out = np.empty(
    (nt, nlat, nlon),
    dtype=np.float32,
)

waf_u_out = np.empty(
    (nt, nlat, nlon),
    dtype=np.float32,
)

waf_v_out = np.empty(
    (nt, nlat, nlon),
    dtype=np.float32,
)


# ============================================================
# Accumulate basic-state wind
# ============================================================

u_basic_sum = np.zeros(
    (nlat, nlon),
    dtype=np.float64,
)

v_basic_sum = np.zeros(
    (nlat, nlon),
    dtype=np.float64,
)


# ============================================================
# FIRST PASS
#
# RWS and wind diagnostics
#
# Basic-state wind is the time mean:
#
#   U = <U>time
#   V = <V>time
# ============================================================

print("")
print("==============================================")
print("FIRST PASS: RWS and wind diagnostics")
print("==============================================")

for start in range(0, nt, BLOCK_SIZE):

    end = min(
        start + BLOCK_SIZE,
        nt,
    )

    print(
        f"Processing times {start}:{end} "
        f"of {nt}"
    )

    ub = u.isel(
        time=slice(start, end)
    )

    vb = v.isel(
        time=slice(start, end)
    )

    # --------------------------------------------------------
    # Accumulate basic-state wind
    # --------------------------------------------------------

    u_basic_sum += np.sum(
        ub.values,
        axis=0,
        dtype=np.float64,
    )

    v_basic_sum += np.sum(
        vb.values,
        axis=0,
        dtype=np.float64,
    )

    # --------------------------------------------------------
    # windspharm
    # --------------------------------------------------------

    w = VectorWind(
        ub,
        vb,
    )

    # --------------------------------------------------------
    # Absolute and relative vorticity
    # --------------------------------------------------------

    eta = w.absolutevorticity(
        truncation=TRUNCATION
    )

    zeta = w.vorticity(
        truncation=TRUNCATION
    )

    # --------------------------------------------------------
    # Divergence
    # --------------------------------------------------------

    div = w.divergence(
        truncation=TRUNCATION
    )

    # --------------------------------------------------------
    # Velocity potential and rotational streamfunction
    # --------------------------------------------------------

    chi = w.velocitypotential(
        truncation=TRUNCATION
    )

    psi = w.streamfunction(
        truncation=TRUNCATION
    )

    # --------------------------------------------------------
    # Divergent wind
    # --------------------------------------------------------

    u_div, v_div = w.irrotationalcomponent(
        truncation=TRUNCATION
    )

    # --------------------------------------------------------
    # Rotational wind
    # --------------------------------------------------------

    u_rot, v_rot = w.nondivergentcomponent(
        truncation=TRUNCATION
    )

    # --------------------------------------------------------
    # Gradient of absolute vorticity
    # --------------------------------------------------------

    etax, etay = w.gradient(
        eta,
        truncation=TRUNCATION
    )

    # --------------------------------------------------------
    # Rossby wave source
    #
    # RWS = -eta * div
    #       - Vdiv . grad(eta)
    # --------------------------------------------------------

    rws_div = -eta * div

    rws_vortadv = (
        -u_div * etax
        -v_div * etay
    )

    rws = (
        rws_div
        + rws_vortadv
    )

    # --------------------------------------------------------
    # Save diagnostics
    # --------------------------------------------------------

    rws_out[start:end] = (
        rws.values.astype(np.float32)
    )

    rws_div_out[start:end] = (
        rws_div.values.astype(np.float32)
    )

    rws_vortadv_out[start:end] = (
        rws_vortadv.values.astype(np.float32)
    )

    div_out[start:end] = (
        div.values.astype(np.float32)
    )

    zeta_out[start:end] = (
        zeta.values.astype(np.float32)
    )

    eta_out[start:end] = (
        eta.values.astype(np.float32)
    )

    chi_out[start:end] = (
        chi.values.astype(np.float32)
    )

    psi_out[start:end] = (
        psi.values.astype(np.float32)
    )

    u_div_out[start:end] = (
        u_div.values.astype(np.float32)
    )

    v_div_out[start:end] = (
        v_div.values.astype(np.float32)
    )

    u_rot_out[start:end] = (
        u_rot.values.astype(np.float32)
    )

    v_rot_out[start:end] = (
        v_rot.values.astype(np.float32)
    )


# ============================================================
# Basic-state wind
# ============================================================

u_basic = (
    u_basic_sum / nt
)

v_basic = (
    v_basic_sum / nt
)

wind_basic_speed = np.sqrt(
    u_basic**2
    + v_basic**2
)

print("")
print("Basic-state wind calculated.")

print(
    "Basic-state wind range:",
    np.nanmin(wind_basic_speed),
    np.nanmax(wind_basic_speed),
)


# ============================================================
# SECOND PASS
#
# TN01 wave activity flux
#
# IMPORTANT:
#
# Geopotential-height perturbation:
#
#   Zg' = Zg - <Zg>time,zonal
#
# where <Zg>time,zonal is a function of latitude only.
#
# Then:
#
#   Phi' = g Zg'
#
#   psi' = Phi' / f
#        = g Zg' / f
#
# The basic-state wind is:
#
#   U = <U>time
#   V = <V>time
# ============================================================

print("")
print("==============================================")
print("SECOND PASS: TN01 wave activity flux")
print("==============================================")

print("")
print(
    "Calculating time-mean zonal-mean "
    "250-hPa geopotential height..."
)


# ============================================================
# Calculate time-mean zonal-mean Zg
#
# zg dimensions:
#   time, lat, lon
#
# Result:
#   lat
# ============================================================

zg_data = zg.values.astype(
    np.float64
)

zg_basic_zonal = np.nanmean(
    zg_data,
    axis=(0, 2),
)

print(
    "Time-mean zonal-mean Zg range:",
    np.nanmin(zg_basic_zonal),
    np.nanmax(zg_basic_zonal),
)


# ============================================================
# Coriolis parameter
# ============================================================

lat_rad = np.deg2rad(lat)

f = (
    2.0
    * OMEGA
    * np.sin(lat_rad)
)

f_2d = f[:, np.newaxis]


# ============================================================
# TN01 WAF block loop
# ============================================================

for start in range(0, nt, BLOCK_SIZE):

    end = min(
        start + BLOCK_SIZE,
        nt,
    )

    print(
        f"TN WAF times {start}:{end} "
        f"of {nt}"
    )

    # --------------------------------------------------------
    # Read geopotential height
    # --------------------------------------------------------

    zg_block = zg.isel(
        time=slice(start, end)
    ).values.astype(
        np.float64
    )

    # --------------------------------------------------------
    # Remove time-mean zonal mean
    #
    # Zg' = Zg - <Zg>time,zonal
    # --------------------------------------------------------

    zg_prime = (
        zg_block
        - zg_basic_zonal[
            np.newaxis,
            :,
            np.newaxis,
        ]
    )

    # --------------------------------------------------------
    # Geopotential perturbation
    #
    # Phi' = g Zg'
    # --------------------------------------------------------

    phi_prime = (
        GRAVITY
        * zg_prime
    )

    # --------------------------------------------------------
    # Geostrophic perturbation streamfunction
    #
    # psi' = Phi' / f
    #      = g Zg' / f
    # --------------------------------------------------------

    psi_prime = (
        phi_prime
        / f_2d[
            np.newaxis,
            :,
            :,
        ]
    )

    # --------------------------------------------------------
    # TN01 WAF
    # --------------------------------------------------------

    waf_u, waf_v = calculate_tn_waf(
        psi_prime=psi_prime,
        u_basic=u_basic,
        v_basic=v_basic,
        lat_deg=lat,
        lon_deg=lon,
        earth_radius=EARTH_RADIUS,
        pressure_normalized=PRESSURE_NORMALIZED,
        min_wind=WAF_MIN_WIND,
        min_abs_lat=WAF_MIN_ABS_LAT,
    )

    # --------------------------------------------------------
    # Save
    # --------------------------------------------------------

    waf_u_out[start:end] = (
        waf_u.astype(
            np.float32
        )
    )

    waf_v_out[start:end] = (
        waf_v.astype(
            np.float32
        )
    )


# ============================================================
# Construct output Dataset
# ============================================================

print("")
print("Constructing output Dataset...")

ds_out = xr.Dataset(

    data_vars={

        "rws": (
            ("time", "lat", "lon"),
            rws_out,
            {
                "long_name":
                    "Rossby wave source",
                "units":
                    "s-2",
                "description":
                    "RWS = -eta*div - Vdiv.grad(eta)",
            },
        ),

        "rws_divergence": (
            ("time", "lat", "lon"),
            rws_div_out,
            {
                "long_name":
                    "RWS divergence term",
                "units":
                    "s-2",
                "description":
                    "-absolute_vorticity * divergence",
            },
        ),

        "rws_vorticity_gradient": (
            ("time", "lat", "lon"),
            rws_vortadv_out,
            {
                "long_name":
                    "RWS vorticity-gradient term",
                "units":
                    "s-2",
                "description":
                    "-divergent_wind dot "
                    "gradient(absolute_vorticity)",
            },
        ),

        "divergence": (
            ("time", "lat", "lon"),
            div_out,
            {
                "long_name":
                    "Horizontal divergence",
                "units":
                    "s-1",
            },
        ),

        "relative_vorticity": (
            ("time", "lat", "lon"),
            zeta_out,
            {
                "long_name":
                    "Relative vorticity",
                "units":
                    "s-1",
            },
        ),

        "absolute_vorticity": (
            ("time", "lat", "lon"),
            eta_out,
            {
                "long_name":
                    "Absolute vorticity",
                "units":
                    "s-1",
            },
        ),

        "velocity_potential": (
            ("time", "lat", "lon"),
            chi_out,
            {
                "long_name":
                    "Velocity potential",
                "units":
                    "m2 s-1",
            },
        ),

        "streamfunction": (
            ("time", "lat", "lon"),
            psi_out,
            {
                "long_name":
                    "Rotational streamfunction "
                    "diagnosed from wind",
                "units":
                    "m2 s-1",
            },
        ),

        "u_div": (
            ("time", "lat", "lon"),
            u_div_out,
            {
                "long_name":
                    "Eastward divergent wind",
                "units":
                    "m s-1",
            },
        ),

        "v_div": (
            ("time", "lat", "lon"),
            v_div_out,
            {
                "long_name":
                    "Northward divergent wind",
                "units":
                    "m s-1",
            },
        ),

        "u_rot": (
            ("time", "lat", "lon"),
            u_rot_out,
            {
                "long_name":
                    "Eastward rotational wind",
                "units":
                    "m s-1",
            },
        ),

        "v_rot": (
            ("time", "lat", "lon"),
            v_rot_out,
            {
                "long_name":
                    "Northward rotational wind",
                "units":
                    "m s-1",
            },
        ),

        "waf_u": (
            ("time", "lat", "lon"),
            waf_u_out,
            {
                "long_name":
                    "Takaya-Nakamura wave activity "
                    "flux, eastward component",
                "units":
                    "m2 s-2",
                "description":
                    "TN01 WAF using 250-hPa "
                    "geopotential-height perturbation "
                    "relative to the time-mean zonal mean",
            },
        ),

        "waf_v": (
            ("time", "lat", "lon"),
            waf_v_out,
            {
                "long_name":
                    "Takaya-Nakamura wave activity "
                    "flux, northward component",
                "units":
                    "m2 s-2",
                "description":
                    "TN01 WAF using 250-hPa "
                    "geopotential-height perturbation "
                    "relative to the time-mean zonal mean",
            },
        ),
    },

    coords={
        "time": time,
        "lat": lat,
        "lon": lon,
    },

    attrs={

        "description":
            "250-hPa Rossby wave source and "
            "Takaya-Nakamura wave activity flux diagnostics",

        "pressure_level":
            "250 hPa",

        "rws_definition":
            "RWS = -eta*div - Vdiv.grad(eta)",

        "tn_waf":
            "Takaya and Nakamura (2001)",

        "tn_geopotential_perturbation":
            "zg_prime = zg - time_mean_zonal_mean(zg)",

        "tn_streamfunction":
            "psi_prime = g * zg_prime / f",

        "tn_basic_state":
            "Time-mean 250-hPa horizontal wind "
            "over the input period",

        "tn_waf_min_basic_wind":
            f"{WAF_MIN_WIND} m s-1",

        "tn_waf_equatorial_mask":
            f"|latitude| < {WAF_MIN_ABS_LAT} degrees",
    },
)


# ============================================================
# NetCDF encoding
# ============================================================

encoding = {}

for var in ds_out.data_vars:

    encoding[var] = {
        "zlib": True,
        "complevel": 4,
        "dtype": "float32",
    }


# ============================================================
# Write full-resolution output
# ============================================================

print("")
print("Writing full-resolution output:")
print(OUTFILE)

ds_out.to_netcdf(
    OUTFILE,
    encoding=encoding,
)

print("Finished full-resolution output.")


# ============================================================
# Monthly means
#
# IMPORTANT:
#
# The full-resolution file retains all 1460 records.
#
# For monthly climatological means, remove the final
# 0102-01-01 00 UTC cyclic endpoint so that the 12 months
# contain the proper number of 6-hourly samples:
#
#   January  = 31 * 4
#   February = 28 * 4
#   ...
#   December = 31 * 4
#
# This avoids creating a 13th January and avoids giving
# December an extra sample.
# ============================================================

if WRITE_MONTHLY:

    print("")
    print("Calculating monthly means...")

    ds_out_monthly_source = ds_out.isel(
        time=slice(0, -1)
    )

    # --------------------------------------------------------
    # Use calendar month directly.
    #
    # After removing the final Jan 1 00 UTC point, all
    # remaining times belong to model year 101.
    # --------------------------------------------------------

    ds_monthly = (
        ds_out_monthly_source
        .groupby(
            "time.month"
        )
        .mean(
            dim="time",
            keep_attrs=True,
        )
    )

    print("")
    print("Monthly output:")
    print(ds_monthly)


    # --------------------------------------------------------
    # Monthly encoding
    # --------------------------------------------------------

    monthly_encoding = {}

    for var in ds_monthly.data_vars:

        monthly_encoding[var] = {
            "zlib": True,
            "complevel": 4,
            "dtype": "float32",
        }


    # --------------------------------------------------------
    # Write monthly file
    # --------------------------------------------------------

    print("")
    print("Writing monthly output:")
    print(MONTHLY_OUTFILE)

    ds_monthly.to_netcdf(
        MONTHLY_OUTFILE,
        encoding=monthly_encoding,
    )

    print("Finished monthly output.")


# ============================================================
# Close input files
# ============================================================

ds_u.close()
ds_v.close()
ds_zg.close()


# ============================================================
# Finished
# ============================================================

print("")
print("==============================================")
print("ALL DONE")
print("==============================================")

print("")
print("Full output:")
print(OUTFILE)

if WRITE_MONTHLY:
    print("")
    print("Monthly output:")
    print(MONTHLY_OUTFILE)
