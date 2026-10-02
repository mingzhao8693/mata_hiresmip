#!/usr/bin/env python3

import numpy as np
import xarray as xr
from windspharm.xarray import VectorWind


# ============================================================
# Settings
# ============================================================

# Instantaneous fields for the experiment/year being diagnosed
UFILE = "/work/miz/rws/atmos_cmip.0101010100-0101123123.ua_unmsk.nc"
VFILE = "/work/miz/rws/atmos_cmip.0101010100-0101123123.va_unmsk.nc"
ZGFILE = "/work/miz/rws/atmos_cmip.0101010100-0101123123.zg_unmsk.nc"

# Long-term 6-hourly climatologies
#
# These should be constructed from years 2-101:
#
#   cdo mergetime years2-101.nc merged.nc
#   cdo ydaymean merged.nc clim_6hourly.nc
#
UCLIM_FILE = "/work/miz/rws/ua_clim_6hourly.nc"
VCLIM_FILE = "/work/miz/rws/va_clim_6hourly.nc"
ZGCLIM_FILE = "/work/miz/rws/zg_clim_6hourly.nc"

# Output
OUT_INSTANT = (
    "/work/miz/rws/"
    "atmos_cmip.0101010100-0101123123.rws_waf.nc"
)

OUT_JJA_MONTHLY = (
    "/work/miz/rws/"
    "atmos_cmip.0101010100-0101123123.rws_waf.JJA_monthly.nc"
)

OUT_JJA_MEAN = (
    "/work/miz/rws/"
    "atmos_cmip.0101010100-0101123123.rws_waf.JJA_mean.nc"
)

# Target pressure level
TARGET_PLEV = 25000.0       # Pa = 250 hPa

# Constants
EARTH_RADIUS = 6.371e6      # m
OMEGA = 7.292115e-5         # s-1
GRAVITY = 9.80665           # m s-2

# Minimum basic-state wind speed for TN01 WAF
WIND_MIN = 5.0              # m s-1

# Equatorial mask
EQUATOR_LAT = 10.0          # degrees


# ============================================================
# Helper functions
# ============================================================

def get_lat_name(da):
    for name in ["lat", "latitude"]:
        if name in da.coords:
            return name
    raise ValueError("Could not find latitude coordinate.")


def get_lon_name(da):
    for name in ["lon", "longitude"]:
        if name in da.coords:
            return name
    raise ValueError("Could not find longitude coordinate.")


def get_plev_name(da):
    for name in ["plev", "plev3", "lev", "level"]:
        if name in da.coords:
            return name
    raise ValueError("Could not find pressure-level coordinate.")


def select_plev(da, target_plev):

    plev_name = get_plev_name(da)

    result = da.sel(
        {plev_name: target_plev},
        method="nearest"
    )

    actual = float(result[plev_name].values)

    print(
        f"Selected pressure level: "
        f"{actual:.1f} Pa "
        f"({actual / 100.0:.1f} hPa)"
    )

    return result


def ensure_north_to_south(da):

    lat_name = get_lat_name(da)

    lat = da[lat_name].values

    if lat[0] < lat[-1]:

        print(
            "Reversing latitude from "
            "south-to-north to north-to-south."
        )

        da = da.isel(
            {lat_name: slice(None, None, -1)}
        )

    return da


def longitude_derivative(field, lon_deg):
    """
    Periodic centered derivative with respect to longitude.

    The derivative is with respect to longitude in radians.
    """

    dlon = np.deg2rad(
        lon_deg[1] - lon_deg[0]
    )

    return (
        np.roll(field, -1, axis=-1)
        -
        np.roll(field, 1, axis=-1)
    ) / (2.0 * dlon)


def latitude_derivative(field, lat_deg):
    """
    Centered derivative with respect to latitude
    in radians.
    """

    lat_rad = np.deg2rad(lat_deg)

    return np.gradient(
        field,
        lat_rad,
        axis=-2,
        edge_order=2
    )


def calculate_tn01_waf(
    psi,
    u_basic,
    v_basic,
    lat_deg,
    lon_deg,
    p_hpa=250.0,
    wind_min=5.0
):
    """
    Takaya-Nakamura (2001) stationary-wave activity flux.

    psi:
        perturbation streamfunction [m2 s-1]

    u_basic:
        basic-state zonal wind [m s-1]

    v_basic:
        basic-state meridional wind [m s-1]

    Returns:
        Fx: eastward WAF component
        Fy: northward WAF component
    """

    lat_rad = np.deg2rad(lat_deg)

    cosphi = np.cos(lat_rad)

    # Avoid numerical problems near poles
    cosphi = np.maximum(
        cosphi,
        1.0e-6
    )

    a = EARTH_RADIUS

    # --------------------------------------------------------
    # Derivatives of perturbation streamfunction
    # --------------------------------------------------------

    psi_lambda = longitude_derivative(
        psi,
        lon_deg
    )

    psi_phi = latitude_derivative(
        psi,
        lat_deg
    )

    psi_ll = longitude_derivative(
        psi_lambda,
        lon_deg
    )

    psi_pp = latitude_derivative(
        psi_phi,
        lat_deg
    )

    psi_lp = latitude_derivative(
        psi_lambda,
        lat_deg
    )

    # --------------------------------------------------------
    # Basic-state wind
    # --------------------------------------------------------

    U = u_basic
    V = v_basic

    wind_speed = np.sqrt(
        U**2 + V**2
    )

    # --------------------------------------------------------
    # TN01 flux
    # --------------------------------------------------------

    prefactor = (
        p_hpa
        * cosphi[None, :, None]
        /
        (
            2.0
            * wind_speed
        )
    )

    term_xx = (
        U
        /
        (
            a**2
            * cosphi[None, :, None]**2
        )
        *
        (
            psi_lambda**2
            -
            psi * psi_ll
        )
    )

    term_xy = (
        V
        /
        (
            a**2
            * cosphi[None, :, None]
        )
        *
        (
            psi_lambda * psi_phi
            -
            psi * psi_lp
        )
    )

    term_yx = (
        U
        /
        (
            a**2
            * cosphi[None, :, None]
        )
        *
        (
            psi_lambda * psi_phi
            -
            psi * psi_lp
        )
    )

    term_yy = (
        V
        /
        a**2
        *
        (
            psi_phi**2
            -
            psi * psi_pp
        )
    )

    Fx = (
        prefactor
        *
        (
            term_xx
            +
            term_xy
        )
    )

    Fy = (
        prefactor
        *
        (
            term_yx
            +
            term_yy
        )
    )

    # --------------------------------------------------------
    # Mask weak basic-state flow
    # --------------------------------------------------------

    weak_flow = (
        wind_speed < wind_min
    )

    Fx = np.where(
        weak_flow,
        np.nan,
        Fx
    )

    Fy = np.where(
        weak_flow,
        np.nan,
        Fy
    )

    # --------------------------------------------------------
    # Equatorial mask
    # --------------------------------------------------------

    equator_mask = (
        np.abs(lat_deg)
        <
        EQUATOR_LAT
    )

    Fx[:, equator_mask, :] = np.nan
    Fy[:, equator_mask, :] = np.nan

    return Fx, Fy


# ============================================================
# Read instantaneous fields
# ============================================================

print()
print("============================================================")
print("Reading instantaneous fields")
print("============================================================")

ds_u = xr.open_dataset(UFILE)
ds_v = xr.open_dataset(VFILE)
ds_zg = xr.open_dataset(ZGFILE)

print(ds_u)
print(ds_v)
print(ds_zg)

u = select_plev(
    ds_u["ua_unmsk"],
    TARGET_PLEV
)

v = select_plev(
    ds_v["va_unmsk"],
    TARGET_PLEV
)

zg = select_plev(
    ds_zg["zg_unmsk"],
    TARGET_PLEV
)

u = ensure_north_to_south(u)
v = ensure_north_to_south(v)
zg = ensure_north_to_south(zg)

lat_name = get_lat_name(u)
lon_name = get_lon_name(u)

lat = u[lat_name].values
lon = u[lon_name].values

print()
print(
    "Latitude:",
    lat[0],
    "to",
    lat[-1]
)

print(
    "Longitude:",
    lon[0],
    "to",
    lon[-1]
)

print(
    "Number of time records:",
    u.sizes["time"]
)


# ============================================================
# Read long-term 6-hourly climatology
# ============================================================

print()
print("============================================================")
print("Reading long-term 6-hourly climatology")
print("============================================================")

ds_uc = xr.open_dataset(
    UCLIM_FILE
)

ds_vc = xr.open_dataset(
    VCLIM_FILE
)

ds_zgc = xr.open_dataset(
    ZGCLIM_FILE
)

u_clim = select_plev(
    ds_uc["ua_unmsk"],
    TARGET_PLEV
)

v_clim = select_plev(
    ds_vc["va_unmsk"],
    TARGET_PLEV
)

zg_clim = select_plev(
    ds_zgc["zg_unmsk"],
    TARGET_PLEV
)

u_clim = ensure_north_to_south(
    u_clim
)

v_clim = ensure_north_to_south(
    v_clim
)

zg_clim = ensure_north_to_south(
    zg_clim
)


# ============================================================
# Construct monthly climatological basic state
# ============================================================

print()
print("============================================================")
print("Constructing monthly climatological basic state")
print("============================================================")

# ------------------------------------------------------------
# Long-term monthly climatological U and V
#
# These are the basic-state winds used by TN01.
# ------------------------------------------------------------

u_basic_monthly = (
    u_clim
    .groupby("time.month")
    .mean("time")
)

v_basic_monthly = (
    v_clim
    .groupby("time.month")
    .mean("time")
)

# ------------------------------------------------------------
# Long-term monthly zonal-mean geopotential height
#
# Used to define the wave perturbation:
#
# Zg'(t) =
#     Zg(t)
#     -
#     <Zg>_zonal,monthly-climatology
# ------------------------------------------------------------

zg_zonal_monthly = (
    zg_clim
    .groupby("time.month")
    .mean("time")
    .mean(dim=lon_name)
)

print(
    "Monthly basic-state dimensions:"
)

print(
    u_basic_monthly.dims
)

print(
    v_basic_monthly.dims
)

print(
    zg_zonal_monthly.dims
)


# ============================================================
# Calculate Coriolis parameter
# ============================================================

lat_rad = np.deg2rad(lat)

f = (
    2.0
    * OMEGA
    * np.sin(lat_rad)
)

f_safe = f.copy()

f_safe[
    np.abs(f_safe) < 1.0e-5
] = np.nan


# ============================================================
# Prepare output arrays
# ============================================================

nt = u.sizes["time"]
nlat = len(lat)
nlon = len(lon)

print()
print("Output dimensions:")
print("time =", nt)
print("lat  =", nlat)
print("lon  =", nlon)

# ------------------------------------------------------------
# Use float32 for output storage.
# Calculations themselves use float64.
# ------------------------------------------------------------

rws_all = np.full(
    (nt, nlat, nlon),
    np.nan,
    dtype=np.float32
)

div_all = np.full_like(
    rws_all,
    np.nan
)

vort_all = np.full_like(
    rws_all,
    np.nan
)

vp_all = np.full_like(
    rws_all,
    np.nan
)

psi_rot_all = np.full_like(
    rws_all,
    np.nan
)

urot_all = np.full_like(
    rws_all,
    np.nan
)

vrot_all = np.full_like(
    rws_all,
    np.nan
)

waf_u_all = np.full_like(
    rws_all,
    np.nan
)

waf_v_all = np.full_like(
    rws_all,
    np.nan
)


# ============================================================
# Process instantaneous fields
# ============================================================

print()
print("============================================================")
print("Calculating instantaneous RWS and TN01 WAF")
print("============================================================")

# Process in blocks
BLOCK = 20

for i0 in range(
    0,
    nt,
    BLOCK
):

    i1 = min(
        i0 + BLOCK,
        nt
    )

    print(
        f"Processing records "
        f"{i0 + 1} - {i1} "
        f"of {nt}"
    )

    # --------------------------------------------------------
    # Read instantaneous block
    # --------------------------------------------------------

    u_block = (
        u
        .isel(time=slice(i0, i1))
        .values
        .astype(np.float64)
    )

    v_block = (
        v
        .isel(time=slice(i0, i1))
        .values
        .astype(np.float64)
    )

    zg_block = (
        zg
        .isel(time=slice(i0, i1))
        .values
        .astype(np.float64)
    )

    # --------------------------------------------------------
    # Time / month
    # --------------------------------------------------------

    time_block = u.isel(
        time=slice(i0, i1)
    ).time

    months = (
        time_block
        .dt.month
        .values
    )

    # ========================================================
    # Windspharm diagnostics
    # ========================================================

    uw = xr.DataArray(
        u_block,
        dims=(
            "time",
            "lat",
            "lon"
        ),
        coords={
            "time": time_block,
            "lat": lat,
            "lon": lon,
        }
    )

    vw = xr.DataArray(
        v_block,
        dims=(
            "time",
            "lat",
            "lon"
        ),
        coords={
            "time": time_block,
            "lat": lat,
            "lon": lon,
        }
    )

    vw_obj = VectorWind(
        uw,
        vw
    )

    # --------------------------------------------------------
    # Relative vorticity
    # --------------------------------------------------------

    vort = (
        vw_obj
        .vorticity()
        .values
    )

    # --------------------------------------------------------
    # Divergence
    # --------------------------------------------------------

    div = (
        vw_obj
        .divergence()
        .values
    )

    # --------------------------------------------------------
    # Absolute vorticity
    # --------------------------------------------------------

    abs_vort = (
        vort
        +
        f[None, :, None]
    )

    # --------------------------------------------------------
    # Helmholtz decomposition
    #
    # windspharm returns FOUR fields:
    #
    #   uchi = divergent zonal wind
    #   vchi = divergent meridional wind
    #   upsi = rotational zonal wind
    #   vpsi = rotational meridional wind
    # --------------------------------------------------------

    (
        uchi_da,
        vchi_da,
        upsi_da,
        vpsi_da
    ) = vw_obj.helmholtz()

    uchi = uchi_da.values
    vchi = vchi_da.values

    urot = upsi_da.values
    vrot = vpsi_da.values

    # --------------------------------------------------------
    # Gradient of absolute vorticity
    # --------------------------------------------------------

    eta_lambda = longitude_derivative(
        abs_vort,
        lon
    )

    eta_phi = latitude_derivative(
        abs_vort,
        lat
    )

    grad_eta_x = (
        eta_lambda
        /
        (
            EARTH_RADIUS
            *
            np.cos(lat_rad)[None, :, None]
        )
    )

    grad_eta_y = (
        eta_phi
        /
        EARTH_RADIUS
    )

    # --------------------------------------------------------
    # Rossby wave source
    #
    # RWS =
    #   - eta * div
    #   - Vchi dot grad(eta)
    # --------------------------------------------------------

    rws = (
        -abs_vort * div
        -
        uchi * grad_eta_x
        -
        vchi * grad_eta_y
    )

    # --------------------------------------------------------
    # Velocity potential
    # --------------------------------------------------------

    vp = (
        vw_obj
        .velocitypotential()
        .values
    )

    # --------------------------------------------------------
    # Rotational streamfunction
    # --------------------------------------------------------

    psi_rot = (
        vw_obj
        .sfvp()[0]
        .values
    )

    # ========================================================
    # Instantaneous TN01 WAF
    # ========================================================

    waf_u_block = np.full(
        u_block.shape,
        np.nan,
        dtype=np.float64
    )

    waf_v_block = np.full(
        u_block.shape,
        np.nan,
        dtype=np.float64
    )

    # --------------------------------------------------------
    # Calculate WAF separately for each instantaneous time.
    #
    # The BASIC STATE depends on the calendar month.
    #
    # June  -> June climatological U/V
    # July  -> July climatological U/V
    # August -> August climatological U/V
    #
    # The wave perturbation is:
    #
    # Zg'(t) =
    #   instantaneous Zg(t)
    #   -
    #   monthly climatological zonal-mean Zg
    # --------------------------------------------------------

    for j in range(
        i1 - i0
    ):

        month = int(
            months[j]
        )

        # ----------------------------------------------------
        # Monthly climatological basic-state wind
        # ----------------------------------------------------

        U_basic = (
            u_basic_monthly
            .sel(month=month)
            .values
        )

        V_basic = (
            v_basic_monthly
            .sel(month=month)
            .values
        )

        # ----------------------------------------------------
        # Monthly climatological zonal-mean Zg
        # ----------------------------------------------------

        ZG_zonal = (
            zg_zonal_monthly
            .sel(month=month)
            .values
        )

        # ----------------------------------------------------
        # Instantaneous wave perturbation
        # ----------------------------------------------------

        zg_prime = (
            zg_block[j]
            -
            ZG_zonal[:, None]
        )

        # ----------------------------------------------------
        # Geostrophic perturbation streamfunction
        #
        # psi' = Phi'/f
        #
        # Phi' = g Zg'
        #
        # therefore:
        #
        # psi' = g Zg' / f
        # ----------------------------------------------------

        psi_prime = (
            GRAVITY
            *
            zg_prime
            /
            f_safe[:, None]
        )

        # ----------------------------------------------------
        # Add time dimension
        # ----------------------------------------------------

        psi_input = (
            psi_prime[None, :, :]
        )

        U_input = (
            U_basic[None, :, :]
        )

        V_input = (
            V_basic[None, :, :]
        )

        # ----------------------------------------------------
        # TN01 WAF
        # ----------------------------------------------------

        Fx, Fy = calculate_tn01_waf(
            psi_input,
            U_input,
            V_input,
            lat,
            lon,
            p_hpa=TARGET_PLEV / 100.0,
            wind_min=WIND_MIN
        )

        waf_u_block[j] = Fx[0]
        waf_v_block[j] = Fy[0]

    # ========================================================
    # Store block
    # ========================================================

    rws_all[i0:i1] = (
        rws.astype(np.float32)
    )

    div_all[i0:i1] = (
        div.astype(np.float32)
    )

    vort_all[i0:i1] = (
        vort.astype(np.float32)
    )

    vp_all[i0:i1] = (
        vp.astype(np.float32)
    )

    psi_rot_all[i0:i1] = (
        psi_rot.astype(np.float32)
    )

    urot_all[i0:i1] = (
        urot.astype(np.float32)
    )

    vrot_all[i0:i1] = (
        vrot.astype(np.float32)
    )

    waf_u_all[i0:i1] = (
        waf_u_block.astype(np.float32)
    )

    waf_v_all[i0:i1] = (
        waf_v_block.astype(np.float32)
    )


# ============================================================
# Construct instantaneous output Dataset
# ============================================================

print()
print("============================================================")
print("Creating instantaneous output")
print("============================================================")

ds_out = xr.Dataset(
    {
        "rws": (
            ("time", "lat", "lon"),
            rws_all
        ),

        "divergence": (
            ("time", "lat", "lon"),
            div_all
        ),

        "relative_vorticity": (
            ("time", "lat", "lon"),
            vort_all
        ),

        "velocity_potential": (
            ("time", "lat", "lon"),
            vp_all
        ),

        "rotational_streamfunction": (
            ("time", "lat", "lon"),
            psi_rot_all
        ),

        "rotational_u": (
            ("time", "lat", "lon"),
            urot_all
        ),

        "rotational_v": (
            ("time", "lat", "lon"),
            vrot_all
        ),

        "waf_u": (
            ("time", "lat", "lon"),
            waf_u_all
        ),

        "waf_v": (
            ("time", "lat", "lon"),
            waf_v_all
        ),
    },

    coords={
        "time": u.time,
        "lat": lat,
        "lon": lon,
    }
)


# ============================================================
# Attributes
# ============================================================

ds_out["rws"].attrs = {
    "long_name":
        "Rossby wave source",
    "units":
        "s-2",
    "description":
        "RWS = -absolute_vorticity*divergence "
        "- divergent_wind dot grad(absolute_vorticity)"
}

ds_out["divergence"].attrs = {
    "long_name":
        "horizontal wind divergence",
    "units":
        "s-1",
}

ds_out["relative_vorticity"].attrs = {
    "long_name":
        "relative vorticity",
    "units":
        "s-1",
}

ds_out["velocity_potential"].attrs = {
    "long_name":
        "velocity potential",
    "units":
        "m2 s-1",
}

ds_out["rotational_streamfunction"].attrs = {
    "long_name":
        "rotational streamfunction",
    "units":
        "m2 s-1",
}

ds_out["rotational_u"].attrs = {
    "long_name":
        "rotational zonal wind",
    "units":
        "m s-1",
}

ds_out["rotational_v"].attrs = {
    "long_name":
        "rotational meridional wind",
    "units":
        "m s-1",
}

ds_out["waf_u"].attrs = {
    "long_name":
        "Takaya-Nakamura wave activity flux, "
        "eastward component",
    "units":
        "m2 s-2",
    "description":
        "Instantaneous TN01 WAF calculated using "
        "the corresponding monthly climatological "
        "basic-state wind."
}

ds_out["waf_v"].attrs = {
    "long_name":
        "Takaya-Nakamura wave activity flux, "
        "northward component",
    "units":
        "m2 s-2",
    "description":
        "Instantaneous TN01 WAF calculated using "
        "the corresponding monthly climatological "
        "basic-state wind."
}

ds_out.attrs = {
    "pressure_level":
        "250 hPa",

    "waf_method":
        "Takaya and Nakamura (2001)",

    "basic_state":
        "Long-term monthly climatological U and V "
        "from years 2-101",

    "wave_perturbation":
        "Instantaneous geopotential height minus "
        "corresponding monthly climatological "
        "zonal-mean geopotential height",

    "seasonal_composite":
        "JJA mean of instantaneous WAF",

    "purpose":
        "Diagnosis of a systematic summertime "
        "Rossby-wave activity pathway."
}


# ============================================================
# Save instantaneous output
# ============================================================

print()
print("============================================================")
print("Writing instantaneous output")
print("============================================================")

encoding = {
    var: {
        "zlib": True,
        "complevel": 4,
        "dtype": "float32"
    }
    for var in ds_out.data_vars
}

ds_out.to_netcdf(
    OUT_INSTANT,
    encoding=encoding
)

print(
    "Finished:",
    OUT_INSTANT
)


# ============================================================
# Remove possible cyclic endpoint
# ============================================================

print()
print("============================================================")
print("Preparing seasonal average")
print("============================================================")

ds_season_source = ds_out

last_month = int(
    ds_out.time.dt.month.values[-1]
)

last_day = int(
    ds_out.time.dt.day.values[-1]
)

last_hour = int(
    ds_out.time.dt.hour.values[-1]
)

print(
    "Last record:",
    ds_out.time.values[-1]
)

if (
    last_month == 1
    and last_day == 1
    and last_hour == 0
):

    print(
        "Detected January 1 00 UTC cyclic endpoint."
    )

    print(
        "Removing it before seasonal averaging."
    )

    ds_season_source = (
        ds_out.isel(
            time=slice(0, -1)
        )
    )


# ============================================================
# Select JJA
# ============================================================

print()
print("============================================================")
print("Selecting JJA")
print("============================================================")

jja_mask = (
    ds_season_source.time.dt.month.isin(
        [6, 7, 8]
    )
)

ds_jja = ds_season_source.sel(
    time=jja_mask
)

print(
    "Number of JJA records:",
    ds_jja.sizes["time"]
)


# ============================================================
# Monthly JJA means
# ============================================================

print()
print("============================================================")
print("Calculating June / July / August composites")
print("============================================================")

ds_jja_monthly = (
    ds_jja
    .groupby("time.month")
    .mean(
        dim="time",
        keep_attrs=True
    )
)

print(
    "Monthly JJA dimensions:"
)

print(
    ds_jja_monthly.dims
)


# ============================================================
# Save June/July/August composites
# ============================================================

print()
print("Writing:")
print(OUT_JJA_MONTHLY)

encoding_jja = {
    var: {
        "zlib": True,
        "complevel": 4,
        "dtype": "float32"
    }
    for var in ds_jja_monthly.data_vars
}

ds_jja_monthly.to_netcdf(
    OUT_JJA_MONTHLY,
    encoding=encoding_jja
)


# ============================================================
# Overall JJA mean
# ============================================================

print()
print("============================================================")
print("Calculating overall JJA composite")
print("============================================================")

ds_jja_mean = (
    ds_jja
    .mean(
        dim="time",
        keep_attrs=True
    )
    .expand_dims(
        season=["JJA"]
    )
)

print(
    "Writing:"
)

print(
    OUT_JJA_MEAN
)

encoding_jja_mean = {
    var: {
        "zlib": True,
        "complevel": 4,
        "dtype": "float32"
    }
    for var in ds_jja_mean.data_vars
}

ds_jja_mean.to_netcdf(
    OUT_JJA_MEAN,
    encoding=encoding_jja_mean
)


# ============================================================
# Finished
# ============================================================

print()
print("============================================================")
print("DONE")
print("============================================================")

print()
print("Instantaneous:")
print(OUT_INSTANT)

print()
print("Monthly JJA:")
print(OUT_JJA_MONTHLY)

print()
print("Overall JJA:")
print(OUT_JJA_MEAN)

print()
print("The WAF calculation is:")
print(
    "instantaneous Zg perturbation"
)

print(
    "        +"
)

print(
    "monthly climatological basic-state U/V"
)

print(
    "        ->"
)

print(
    "instantaneous TN01 WAF"
)

print(
    "        ->"
)

print(
    "JJA average of instantaneous WAF"
)

print()
print(
    "This provides the systematic summertime "
    "Rossby-wave activity pathway."
)
