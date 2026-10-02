#!/usr/bin/env python3

import numpy as np
import xarray as xr
from windspharm.xarray import VectorWind


# ============================================================
# Settings
# ============================================================

# ------------------------------------------------------------
# Instantaneous data to diagnose
# ------------------------------------------------------------

UFILE = "/work/miz/rws/atmos_cmip.0101010100-0101123123.ua_unmsk.nc"
VFILE = "/work/miz/rws/atmos_cmip.0101010100-0101123123.va_unmsk.nc"
ZGFILE = "/work/miz/rws/atmos_cmip.0101010100-0101123123.zg_unmsk.nc"


# ------------------------------------------------------------
# Long-term 6-hourly climatology
#
# Years 2-101 averaged at each 6-hourly time.
# ------------------------------------------------------------

UCLIM_FILE = "/work/miz/rws/ua_clim_6hourly.nc"
VCLIM_FILE = "/work/miz/rws/va_clim_6hourly.nc"
ZGCLIM_FILE = "/work/miz/rws/zg_clim_6hourly.nc"


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
PRESSURE_NORMALIZED = TARGET_PLEV / 100000.0

# Avoid division by very weak basic flow
WAF_MIN_WIND = 5.0

# TN01 not appropriate very close to equator
WAF_MIN_ABS_LAT = 10.0


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
    # Prefactor
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
    # Masks
    # --------------------------------------------------------

    bad_basic_flow = wind_speed < min_wind

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
# Open instantaneous data
# ============================================================

print("Opening instantaneous data...")

ds_u = xr.open_dataset(UFILE)
ds_v = xr.open_dataset(VFILE)
ds_zg = xr.open_dataset(ZGFILE)

u_all = ds_u[UVAR]
v_all = ds_v[VVAR]
zg_all = ds_zg[ZGVAR]


# ============================================================
# Open climatology
# ============================================================

print("Opening long-term climatology...")

ds_uc = xr.open_dataset(UCLIM_FILE)
ds_vc = xr.open_dataset(VCLIM_FILE)
ds_zgc = xr.open_dataset(ZGCLIM_FILE)

u_clim_all = ds_uc[UVAR]
v_clim_all = ds_vc[VVAR]
zg_clim_all = ds_zgc[ZGVAR]


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

u_clim = u_clim_all.sel(
    plev3=TARGET_PLEV,
    method="nearest",
)

v_clim = v_clim_all.sel(
    plev3=TARGET_PLEV,
    method="nearest",
)

zg_clim = zg_clim_all.sel(
    plev3=TARGET_PLEV,
    method="nearest",
)


# ============================================================
# Check coordinates
# ============================================================

print("")
print("Checking instantaneous data...")

if not np.array_equal(
    u.time.values,
    v.time.values,
):
    raise ValueError(
        "Instantaneous U and V times do not match."
    )

if not np.array_equal(
    u.time.values,
    zg.time.values,
):
    raise ValueError(
        "Instantaneous U and ZG times do not match."
    )


# ============================================================
# Make latitude north-to-south
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

    u_clim = u_clim.isel(
        lat=slice(None, None, -1)
    )

    v_clim = v_clim.isel(
        lat=slice(None, None, -1)
    )

    zg_clim = zg_clim.isel(
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


# ============================================================
# ============================================================
# CREATE MONTHLY CLIMATOLOGICAL BASIC STATES
# ============================================================
#
# The input climatology has 1460 records:
#
#   365 days x 4 times/day
#
# We average those 6-hourly climatological fields by month.
#
# Therefore:
#
#   u_basic_monthly[0] = January mean
#   u_basic_monthly[1] = February mean
#   ...
#   u_basic_monthly[11] = December mean
#
# Same for V and ZG.
# ============================================================

print("")
print("Calculating monthly climatological basic states...")


# ------------------------------------------------------------
# Monthly mean U and V
# ------------------------------------------------------------

u_basic_monthly = (
    u_clim
    .groupby("time.month")
    .mean("time")
    .values
    .astype(np.float64)
)

v_basic_monthly = (
    v_clim
    .groupby("time.month")
    .mean("time")
    .values
    .astype(np.float64)
)


# ------------------------------------------------------------
# Monthly mean ZG
# ------------------------------------------------------------

zg_basic_monthly = (
    zg_clim
    .groupby("time.month")
    .mean("time")
    .values
    .astype(np.float64)
)


print(
    "Monthly basic-state arrays:",
    u_basic_monthly.shape,
    v_basic_monthly.shape,
    zg_basic_monthly.shape,
)

# Expected:
#
#   (12, nlat, nlon)


# ============================================================
# ZONAL MEAN OF MONTHLY CLIMATOLOGICAL ZG
# ============================================================

print("")
print(
    "Calculating monthly zonal-mean "
    "climatological ZG..."
)

zg_basic_zonal_monthly = np.nanmean(
    zg_basic_monthly,
    axis=2,
)

print(
    "ZG monthly zonal basic-state shape:",
    zg_basic_zonal_monthly.shape,
)

# Expected:
#
#   (12, nlat)


# ============================================================
# CORIOLIS PARAMETER
# ============================================================

lat_rad = np.deg2rad(lat)

f = (
    2.0
    * OMEGA
    * np.sin(lat_rad)
)

f_2d = f[:, np.newaxis]


# ============================================================
# Preallocate RWS diagnostics
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
# MAIN LOOP
#
# RWS:
#   calculated from instantaneous winds
#
# TN01:
#   basic state = long-term monthly climatology
#
#   ZG' = instantaneous ZG
#        - monthly climatological zonal-mean ZG
# ============================================================

print("")
print("==============================================")
print("Calculating RWS and TN01 WAF")
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


    # ========================================================
    # Instantaneous U and V
    # ========================================================

    ub = u.isel(
        time=slice(start, end)
    )

    vb = v.isel(
        time=slice(start, end)
    )


    # ========================================================
    # RWS using instantaneous wind
    # ========================================================

    w = VectorWind(
        ub,
        vb,
    )

    eta = w.absolutevorticity(
        truncation=TRUNCATION
    )

    zeta = w.vorticity(
        truncation=TRUNCATION
    )

    div = w.divergence(
        truncation=TRUNCATION
    )

    chi = w.velocitypotential(
        truncation=TRUNCATION
    )

    psi = w.streamfunction(
        truncation=TRUNCATION
    )

    u_div, v_div = w.irrotationalcomponent(
        truncation=TRUNCATION
    )

    u_rot, v_rot = w.nondivergentcomponent(
        truncation=TRUNCATION
    )

    etax, etay = w.gradient(
        eta,
        truncation=TRUNCATION
    )

    rws_div = -eta * div

    rws_vortadv = (
        -u_div * etax
        -v_div * etay
    )

    rws = (
        rws_div
        + rws_vortadv
    )


    # ========================================================
    # Save RWS diagnostics
    # ========================================================

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


    # ========================================================
    # TN01 WAF
    # ========================================================

    # Month for each instantaneous time record
    months = (
        u.time.isel(
            time=slice(start, end)
        ).dt.month.values
    )

    # Read instantaneous ZG
    zg_block = zg.isel(
        time=slice(start, end)
    ).values.astype(np.float64)


    # --------------------------------------------------------
    # Allocate perturbation streamfunction
    # --------------------------------------------------------

    psi_prime = np.empty(
        zg_block.shape,
        dtype=np.float64,
    )


    # --------------------------------------------------------
    # Process each month represented in this block
    # --------------------------------------------------------

    for month in np.unique(months):

        month_index = month - 1

        inds = np.where(
            months == month
        )[0]

        # ----------------------------------------------------
        # Instantaneous ZG perturbation
        #
        # ZG' =
        # instantaneous ZG
        # -
        # long-term monthly climatological zonal-mean ZG
        # ----------------------------------------------------

        zg_prime = (
            zg_block[inds, :, :]
            -
            zg_basic_zonal_monthly[
                month_index,
                :,
            ][
                np.newaxis,
                :,
                np.newaxis,
            ]
        )


        # ----------------------------------------------------
        # Geopotential perturbation
        # ----------------------------------------------------

        phi_prime = (
            GRAVITY
            * zg_prime
        )


        # ----------------------------------------------------
        # Geostrophic perturbation streamfunction
        # ----------------------------------------------------

        psi_prime[inds, :, :] = (
            phi_prime
            /
            f_2d[
                np.newaxis,
                :,
                :
            ]
        )


    # --------------------------------------------------------
    # Basic-state wind for each time
    #
    # Each time gets its month's climatological U/V.
    # --------------------------------------------------------

    u_basic_block = np.empty(
        zg_block.shape,
        dtype=np.float64,
    )

    v_basic_block = np.empty(
        zg_block.shape,
        dtype=np.float64,
    )


    for month in np.unique(months):

        month_index = month - 1

        inds = np.where(
            months == month
        )[0]

        u_basic_block[inds, :, :] = (
            u_basic_monthly[
                month_index,
                :,
                :
            ]
        )

        v_basic_block[inds, :, :] = (
            v_basic_monthly[
                month_index,
                :,
                :
            ]
        )


    # --------------------------------------------------------
    # TN01 WAF
    #
    # calculate_tn_waf expects one basic state per block,
    # so calculate each month separately.
    # --------------------------------------------------------

    waf_u_block = np.empty(
        zg_block.shape,
        dtype=np.float64,
    )

    waf_v_block = np.empty(
        zg_block.shape,
        dtype=np.float64,
    )


    for month in np.unique(months):

        month_index = month - 1

        inds = np.where(
            months == month
        )[0]

        waf_u_month, waf_v_month = calculate_tn_waf(
            psi_prime=psi_prime[inds, :, :],
            u_basic=u_basic_monthly[
                month_index,
                :,
                :
            ],
            v_basic=v_basic_monthly[
                month_index,
                :,
                :
            ],
            lat_deg=lat,
            lon_deg=lon,
            earth_radius=EARTH_RADIUS,
            pressure_normalized=PRESSURE_NORMALIZED,
            min_wind=WAF_MIN_WIND,
            min_abs_lat=WAF_MIN_ABS_LAT,
        )

        waf_u_block[inds, :, :] = (
            waf_u_month
        )

        waf_v_block[inds, :, :] = (
            waf_v_month
        )


    waf_u_out[start:end] = (
        waf_u_block.astype(np.float32)
    )

    waf_v_out[start:end] = (
        waf_v_block.astype(np.float32)
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
                    "Rotational streamfunction diagnosed from wind",
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
                    "Takaya-Nakamura wave activity flux, eastward component",
                "units":
                    "m2 s-2",
                "description":
                    "TN01 WAF using instantaneous geopotential-height "
                    "perturbations relative to the long-term monthly "
                    "climatological zonal-mean ZG",
            },
        ),

        "waf_v": (
            ("time", "lat", "lon"),
            waf_v_out,
            {
                "long_name":
                    "Takaya-Nakamura wave activity flux, northward component",
                "units":
                    "m2 s-2",
                "description":
                    "TN01 WAF using monthly climatological basic-state "
                    "wind from years 2-101",
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
            "250-hPa Rossby wave source and Takaya-Nakamura "
            "wave activity flux diagnostics",

        "pressure_level":
            "250 hPa",

        "rws_definition":
            "RWS = -eta*div - Vdiv.grad(eta)",

        "tn_waf":
            "Takaya and Nakamura (2001)",

        "tn_basic_state":
            "Long-term monthly climatological 250-hPa "
            "horizontal wind based on years 2-101",

        "tn_geopotential_perturbation":
            "Instantaneous ZG minus long-term monthly "
            "climatological zonal-mean ZG",

        "tn_streamfunction":
            "psi_prime = g * zg_prime / f",

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
# Monthly means of diagnostics
# ============================================================

if WRITE_MONTHLY:

    print("")
    print("Calculating monthly means of diagnostics...")

    ds_monthly = (
        ds_out
        .groupby("time.month")
        .mean(
            dim="time",
            keep_attrs=True,
        )
    )

    print("")
    print("Monthly output:")
    print(ds_monthly)

    monthly_encoding = {}

    for var in ds_monthly.data_vars:

        monthly_encoding[var] = {
            "zlib": True,
            "complevel": 4,
            "dtype": "float32",
        }

    print("")
    print("Writing monthly output:")
    print(MONTHLY_OUTFILE)

    ds_monthly.to_netcdf(
        MONTHLY_OUTFILE,
        encoding=monthly_encoding,
    )

    print("Finished monthly output.")


# ============================================================
# Close files
# ============================================================

ds_u.close()
ds_v.close()
ds_zg.close()

ds_uc.close()
ds_vc.close()
ds_zgc.close()


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
