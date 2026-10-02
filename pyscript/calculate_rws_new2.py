#!/usr/bin/env python

import numpy as np
import xarray as xr

from windspharm.xarray import VectorWind


# ============================================================
# USER SETTINGS
# ============================================================

# Instantaneous data
ua_file = "/work/miz/rws/atmos_cmip.0101010100-0101123123.ua_unmsk.nc"
va_file = "/work/miz/rws/atmos_cmip.0101010100-0101123123.va_unmsk.nc"
zg_file = "/work/miz/rws/atmos_cmip.0101010100-0101123123.zg_unmsk.nc"

# 6-hourly climatology
ua_clim_file = "/work/miz/rws/atmos_cmip.ua_unmsk.1950_2020_climo.nc"
va_clim_file = "/work/miz/rws/atmos_cmip.va_unmsk.1950_2020_climo.nc"
zg_clim_file = "/work/miz/rws/atmos_cmip.zg_unmsk.1950_2020_climo.nc"

# Output
output_inst = (
    "/work/miz/rws/"
    "atmos_cmip.0101010100-0101123123.rws_waf.nc"
)

output_jja_monthly = (
    "/work/miz/rws/"
    "atmos_cmip.0101010100-0101123123.rws_waf.JJA_monthly.nc"
)

output_jja_mean = (
    "/work/miz/rws/"
    "atmos_cmip.0101010100-0101123123.rws_waf.JJA_mean.nc"
)

# Pressure level
target_plev = 25000.0       # Pa = 250 hPa

# Earth radius
EARTH_RADIUS = 6.371e6      # m

# Gravity
GRAVITY = 9.80665            # m s-2

# Minimum basic-state wind speed for WAF
MIN_BASIC_SPEED = 5.0       # m s-1

# Block size
BLOCK_SIZE = 20


# ============================================================
# TN01 WAVE ACTIVITY FLUX
# ============================================================

def tn01_waf_2d(
    psi,
    ubar,
    vbar,
    lat_deg,
    lon_deg
):
    """
    Takaya-Nakamura wave activity flux.

    psi       : perturbation streamfunction
    ubar/vbar : basic-state horizontal wind
    lat_deg   : latitude, degrees
    lon_deg   : longitude, degrees

    Returns
    -------
    Fx, Fy
        Eastward and northward WAF components.

    Important:
    Pressure is normalized by 1000 hPa.
    At 250 hPa:

        p_norm = 250 / 1000 = 0.25

    """

    a = EARTH_RADIUS

    # --------------------------------------------------------
    # Pressure normalization
    # --------------------------------------------------------
    #
    # This is the important correction.
    #
    # Do NOT use p = 250 here.
    #
    p_norm = 250.0 / 1000.0

    # --------------------------------------------------------
    # Coordinates
    # --------------------------------------------------------

    lat = np.deg2rad(lat_deg)
    lon = np.deg2rad(lon_deg)

    cosphi = np.cos(lat)

    # --------------------------------------------------------
    # Basic-state wind speed
    # --------------------------------------------------------

    speed = np.sqrt(
        ubar**2 +
        vbar**2
    )

    speed_safe = np.where(
        speed >= MIN_BASIC_SPEED,
        speed,
        np.nan
    )

    # --------------------------------------------------------
    # Grid spacing
    # --------------------------------------------------------

    dlon = lon[1] - lon[0]

    # --------------------------------------------------------
    # Longitude derivatives
    #
    # Longitude is periodic.
    # --------------------------------------------------------

    dpsi_dlon = (
        np.roll(psi, -1, axis=1)
        -
        np.roll(psi, 1, axis=1)
    ) / (2.0 * dlon)

    d2psi_dlon2 = (
        np.roll(psi, -1, axis=1)
        -
        2.0 * psi
        +
        np.roll(psi, 1, axis=1)
    ) / (dlon**2)

    # --------------------------------------------------------
    # Latitude derivatives
    # --------------------------------------------------------

    dpsi_dlat = np.gradient(
        psi,
        lat,
        axis=0
    )

    d2psi_dlat2 = np.gradient(
        dpsi_dlat,
        lat,
        axis=0
    )

    # --------------------------------------------------------
    # Mixed derivative
    # --------------------------------------------------------

    d2psi_dlonlat = np.gradient(
        dpsi_dlon,
        lat,
        axis=0
    )

    # --------------------------------------------------------
    # TN01 terms
    # --------------------------------------------------------

    term_xx = (
        dpsi_dlon**2
        -
        psi * d2psi_dlon2
    )

    term_xy = (
        dpsi_dlon * dpsi_dlat
        -
        psi * d2psi_dlonlat
    )

    term_yy = (
        dpsi_dlat**2
        -
        psi * d2psi_dlat2
    )

    # --------------------------------------------------------
    # WAF eastward component
    # --------------------------------------------------------

    Fx = (
        p_norm
        * cosphi[:, None]
        / (2.0 * speed_safe)
    ) * (
        ubar
        / (
            a**2
            * cosphi[:, None]**2
        )
        * term_xx
        +
        vbar
        / (
            a**2
            * cosphi[:, None]
        )
        * term_xy
    )

    # --------------------------------------------------------
    # WAF northward component
    # --------------------------------------------------------

    Fy = (
        p_norm
        * cosphi[:, None]
        / (2.0 * speed_safe)
    ) * (
        ubar
        / (
            a**2
            * cosphi[:, None]
        )
        * term_xy
        +
        vbar
        / a**2
        * term_yy
    )

    return Fx, Fy


# ============================================================
# OPEN DATA
# ============================================================

print("Opening instantaneous NetCDF files...")

ds_u = xr.open_dataset(
    ua_file,
    chunks=None
)

ds_v = xr.open_dataset(
    va_file,
    chunks=None
)

ds_zg = xr.open_dataset(
    zg_file,
    chunks=None
)

print(ds_u)
print(ds_v)
print(ds_zg)


# ============================================================
# IDENTIFY DIMENSIONS
# ============================================================

time_name = "time"
lat_name = "lat"
lon_name = "lon"
plev_name = "plev3"

u_name = "ua_unmsk"
v_name = "va_unmsk"
zg_name = "zg_unmsk"


# ============================================================
# SELECT 250 hPa
# ============================================================

print("Selecting 250 hPa...")

u = ds_u[u_name].sel(
    {plev_name: target_plev}
)

v = ds_v[v_name].sel(
    {plev_name: target_plev}
)

zg = ds_zg[zg_name].sel(
    {plev_name: target_plev}
)


# ============================================================
# COORDINATES
# ============================================================

lat = u[lat_name].values
lon = u[lon_name].values
time = u[time_name]

print("Latitude:", lat[0], "to", lat[-1])
print("Longitude:", lon[0], "to", lon[-1])
print("Number of times:", len(time))


# ============================================================
# WINDSPharm REQUIRES NORTH -> SOUTH LATITUDE
# ============================================================

if lat[0] < lat[-1]:

    print("Reversing latitude to north-to-south...")

    u = u.isel({lat_name: slice(None, None, -1)})
    v = v.isel({lat_name: slice(None, None, -1)})
    zg = zg.isel({lat_name: slice(None, None, -1)})

    lat = u[lat_name].values


# ============================================================
# OPEN 6-HOURLY CLIMATOLOGY
# ============================================================

print("Opening 6-hourly climatology...")

ds_uc = xr.open_dataset(
    ua_clim_file
)

ds_vc = xr.open_dataset(
    va_clim_file
)

ds_zgc = xr.open_dataset(
    zg_clim_file
)


uc = ds_uc[u_name].sel(
    {plev_name: target_plev}
)

vc = ds_vc[v_name].sel(
    {plev_name: target_plev}
)

zgc = ds_zgc[zg_name].sel(
    {plev_name: target_plev}
)


# Make sure climatology latitude has same orientation
if uc[lat_name].values[0] < uc[lat_name].values[-1]:

    uc = uc.isel(
        {lat_name: slice(None, None, -1)}
    )

    vc = vc.isel(
        {lat_name: slice(None, None, -1)}
    )

    zgc = zgc.isel(
        {lat_name: slice(None, None, -1)}
    )


# ============================================================
# MONTHLY BASIC-STATE U/V
# ============================================================

print("Calculating monthly climatological basic-state U/V...")

u_month = uc.groupby(
    "time.month"
).mean(
    "time"
)

v_month = vc.groupby(
    "time.month"
).mean(
    "time"
)


# ============================================================
# MONTHLY CLIMATOLOGICAL ZONAL-MEAN GEOPOTENTIAL HEIGHT
# ============================================================

print(
    "Calculating monthly climatological "
    "zonal-mean geopotential height..."
)

zg_month = zgc.groupby(
    "time.month"
).mean(
    "time"
)

zg_zonal_month = zg_month.mean(
    dim=lon_name
)


# ============================================================
# CORIOLIS PARAMETER
# ============================================================

OMEGA = 7.292115e-5

lat_rad = np.deg2rad(lat)

f = (
    2.0
    * OMEGA
    * np.sin(lat_rad)
)

# Avoid division very close to equator
f_safe = np.where(
    np.abs(f) > 1.0e-5,
    f,
    np.nan
)


# ============================================================
# OUTPUT ARRAYS
# ============================================================

ntime = len(time)
nlat = len(lat)
nlon = len(lon)

print(
    "Output dimensions:",
    ntime,
    nlat,
    nlon
)


rws_all = np.full(
    (ntime, nlat, nlon),
    np.nan,
    dtype=np.float32
)

div_all = np.full(
    (ntime, nlat, nlon),
    np.nan,
    dtype=np.float32
)

vort_all = np.full(
    (ntime, nlat, nlon),
    np.nan,
    dtype=np.float32
)

chi_all = np.full(
    (ntime, nlat, nlon),
    np.nan,
    dtype=np.float32
)

sf_all = np.full(
    (ntime, nlat, nlon),
    np.nan,
    dtype=np.float32
)

urot_all = np.full(
    (ntime, nlat, nlon),
    np.nan,
    dtype=np.float32
)

vrot_all = np.full(
    (ntime, nlat, nlon),
    np.nan,
    dtype=np.float32
)

waf_u_all = np.full(
    (ntime, nlat, nlon),
    np.nan,
    dtype=np.float32
)

waf_v_all = np.full(
    (ntime, nlat, nlon),
    np.nan,
    dtype=np.float32
)


# ============================================================
# MAIN LOOP
# ============================================================

for i0 in range(
    0,
    ntime,
    BLOCK_SIZE
):

    i1 = min(
        i0 + BLOCK_SIZE,
        ntime
    )

    print(
        f"Processing records {i0} - {i1-1} "
        f"of {ntime}"
    )

    # --------------------------------------------------------
    # Read block
    # --------------------------------------------------------

    u_block = u.isel(
        {time_name: slice(i0, i1)}
    ).values.astype(
        np.float64
    )

    v_block = v.isel(
        {time_name: slice(i0, i1)}
    ).values.astype(
        np.float64
    )

    zg_block = zg.isel(
        {time_name: slice(i0, i1)}
    ).values.astype(
        np.float64
    )

    nblock = i1 - i0

    # --------------------------------------------------------
    # Windspharm
    # --------------------------------------------------------

    print("  Calculating vorticity/divergence...")

    vw_obj = VectorWind(
        xr.DataArray(
            u_block,
            dims=("time", lat_name, lon_name),
            coords={
                lat_name: lat,
                lon_name: lon
            }
        ),
        xr.DataArray(
            v_block,
            dims=("time", lat_name, lon_name),
            coords={
                lat_name: lat,
                lon_name: lon
            }
        )
    )

    # Relative vorticity
    vort_da = vw_obj.vorticity(
        truncation=None
    )

    # Divergence
    div_da = vw_obj.divergence(
        truncation=None
    )

    # --------------------------------------------------------
    # Helmholtz decomposition
    #
    # windspharm returns:
    #
    # uchi, vchi = divergent wind
    # upsi, vpsi = rotational wind
    # --------------------------------------------------------

    print("  Calculating Helmholtz decomposition...")

    (
        uchi_da,
        vchi_da,
        upsi_da,
        vpsi_da
    ) = vw_obj.helmholtz()

    # --------------------------------------------------------
    # Velocity potential
    # --------------------------------------------------------

    print("  Calculating velocity potential...")

    chi_da = vw_obj.velocitypotential(
        truncation=None
    )

    # --------------------------------------------------------
    # Rotational streamfunction
    # --------------------------------------------------------

    print("  Calculating rotational streamfunction...")

    sf_da = vw_obj.sfvp(
        truncation=None
    )[0]

    # --------------------------------------------------------
    # Convert to numpy
    # --------------------------------------------------------

    vort = vort_da.values
    div = div_da.values

    uchi = uchi_da.values
    vchi = vchi_da.values

    urot = upsi_da.values
    vrot = vpsi_da.values

    chi = chi_da.values
    sf = sf_da.values

    # --------------------------------------------------------
    # RWS
    #
    # RWS = -eta * div
    #       - Uchi * d(eta)/dx
    #       - Vchi * d(eta)/dy
    #
    # eta = f + relative vorticity
    # --------------------------------------------------------

    eta = (
        vort
        +
        f[None, :, None]
    )

    # Gradient of absolute vorticity
    #
    # Longitude
    # --------------------------------------------------------

    dlon_rad = np.deg2rad(
        lon[1] - lon[0]
    )

    deta_dlon = (
        np.roll(
            eta,
            -1,
            axis=2
        )
        -
        np.roll(
            eta,
            1,
            axis=2
        )
    ) / (
        2.0 * dlon_rad
    )

    # --------------------------------------------------------
    # Latitude
    # --------------------------------------------------------

    deta_dlat = np.gradient(
        eta,
        lat_rad,
        axis=1
    )

    # --------------------------------------------------------
    # Convert angular gradients to physical gradients
    # --------------------------------------------------------

    deta_dx = (
        deta_dlon
        /
        (
            EARTH_RADIUS
            *
            np.cos(lat_rad)[None, :, None]
        )
    )

    deta_dy = (
        deta_dlat
        /
        EARTH_RADIUS
    )

    # --------------------------------------------------------
    # RWS
    # --------------------------------------------------------

    rws = (
        -eta * div
        -
        uchi * deta_dx
        -
        vchi * deta_dy
    )

    # --------------------------------------------------------
    # Store RWS diagnostics
    # --------------------------------------------------------

    rws_all[i0:i1] = rws.astype(
        np.float32
    )

    div_all[i0:i1] = div.astype(
        np.float32
    )

    vort_all[i0:i1] = vort.astype(
        np.float32
    )

    chi_all[i0:i1] = chi.astype(
        np.float32
    )

    sf_all[i0:i1] = sf.astype(
        np.float32
    )

    urot_all[i0:i1] = urot.astype(
        np.float32
    )

    vrot_all[i0:i1] = vrot.astype(
        np.float32
    )

    # ========================================================
    # INSTANTANEOUS WAF
    # ========================================================

    for j in range(nblock):

        ii = i0 + j

        # ----------------------------------------------------
        # Determine month
        # ----------------------------------------------------

        month = int(
            time.isel(
                {time_name: ii}
            ).dt.month.values
        )

        # ----------------------------------------------------
        # Monthly climatological basic state
        # ----------------------------------------------------

        ubar = u_month.sel(
            month=month
        ).values.astype(
            np.float64
        )

        vbar = v_month.sel(
            month=month
        ).values.astype(
            np.float64
        )

        # ----------------------------------------------------
        # Monthly climatological zonal-mean Z
        # ----------------------------------------------------

        zg_zonal = zg_zonal_month.sel(
            month=month
        ).values.astype(
            np.float64
        )

        # ----------------------------------------------------
        # Instantaneous perturbation geopotential height
        #
        # Remove monthly climatological zonal mean.
        # ----------------------------------------------------

        zg_prime = (
            zg_block[j]
            -
            zg_zonal[:, None]
        )

        # ----------------------------------------------------
        # Geostrophic perturbation streamfunction
        #
        # psi' = Phi'/f
        #      = g Zg'/f
        # ----------------------------------------------------

        psi_prime = (
            GRAVITY
            * zg_prime
            /
            f_safe[:, None]
        )

        # ----------------------------------------------------
        # TN01 WAF
        # ----------------------------------------------------

        Fx, Fy = tn01_waf_2d(
            psi_prime,
            ubar,
            vbar,
            lat,
            lon
        )

        # ----------------------------------------------------
        # Mask equatorial region
        # ----------------------------------------------------

        equator_mask = (
            np.abs(lat) < 10.0
        )

        Fx[equator_mask, :] = np.nan
        Fy[equator_mask, :] = np.nan

        # ----------------------------------------------------
        # Store
        # ----------------------------------------------------

        waf_u_all[ii] = Fx.astype(
            np.float32
        )

        waf_v_all[ii] = Fy.astype(
            np.float32
        )


# ============================================================
# CREATE OUTPUT DATASET
# ============================================================

print("Creating instantaneous output dataset...")

ds_out = xr.Dataset(
    data_vars={

        "rws": (
            (time_name, lat_name, lon_name),
            rws_all
        ),

        "divergence": (
            (time_name, lat_name, lon_name),
            div_all
        ),

        "relative_vorticity": (
            (time_name, lat_name, lon_name),
            vort_all
        ),

        "velocity_potential": (
            (time_name, lat_name, lon_name),
            chi_all
        ),

        "rotational_streamfunction": (
            (time_name, lat_name, lon_name),
            sf_all
        ),

        "u_rot": (
            (time_name, lat_name, lon_name),
            urot_all
        ),

        "v_rot": (
            (time_name, lat_name, lon_name),
            vrot_all
        ),

        "waf_u": (
            (time_name, lat_name, lon_name),
            waf_u_all
        ),

        "waf_v": (
            (time_name, lat_name, lon_name),
            waf_v_all
        )
    },

    coords={
        time_name: time,
        lat_name: lat,
        lon_name: lon
    },

    attrs={
        "description":
            "250-hPa instantaneous RWS and "
            "Takaya-Nakamura wave activity flux",

        "WAF_method":
            "Takaya-Nakamura phase-independent wave activity flux",

        "basic_state":
            "monthly climatological U/V",

        "perturbation":
            "instantaneous geopotential height minus "
            "monthly climatological zonal mean",

        "pressure":
            "250 hPa",

        "pressure_normalization":
            "p/1000 hPa = 0.25",

        "minimum_basic_wind_speed":
            f"{MIN_BASIC_SPEED} m s-1"
    }
)


# ============================================================
# SAVE INSTANTANEOUS OUTPUT
# ============================================================

print(
    "Saving instantaneous output:"
)

print(output_inst)

ds_out.to_netcdf(
    output_inst
)


# ============================================================
# REMOVE POSSIBLE EXTRA JAN-1 RECORD
# ============================================================

# The input appears to contain:
#
# Jan 1 year 101 00 UTC
# ...
# Dec 31 year 101 18 UTC
# Jan 1 year 102 00 UTC
#
# Remove the final record if it is January 1 at 00 UTC.

last_time = time.isel(
    {time_name: -1}
)

last_month = int(
    last_time.dt.month.values
)

last_day = int(
    last_time.dt.day.values
)

last_hour = int(
    last_time.dt.hour.values
)

if (
    last_month == 1
    and
    last_day == 1
    and
    last_hour == 0
):

    print(
        "Removing final extra Jan-1 00 UTC record "
        "before seasonal averaging."
    )

    ds_season = ds_out.isel(
        {time_name: slice(0, -1)}
    )

else:

    ds_season = ds_out


# ============================================================
# JJA
# ============================================================

print("Selecting JJA...")

ds_jja = ds_season.where(
    ds_season[time_name].dt.month.isin(
        [6, 7, 8]
    ),
    drop=True
)

print(
    "Number of JJA records:",
    ds_jja.sizes[time_name]
)


# ============================================================
# MONTHLY JJA MEANS
# ============================================================

print(
    "Calculating June/July/August means..."
)

ds_jja_monthly = ds_jja.groupby(
    f"{time_name}.month"
).mean(
    time_name,
    skipna=True
)


# ============================================================
# SAVE JJA MONTHLY
# ============================================================

print(
    "Saving JJA monthly output:"
)

print(output_jja_monthly)

ds_jja_monthly.to_netcdf(
    output_jja_monthly
)


# ============================================================
# OVERALL JJA MEAN
# ============================================================

print(
    "Calculating overall JJA mean..."
)

ds_jja_mean = ds_jja.mean(
    time_name,
    skipna=True
)


# ============================================================
# SAVE JJA MEAN
# ============================================================

print(
    "Saving JJA mean:"
)

print(output_jja_mean)

ds_jja_mean.to_netcdf(
    output_jja_mean
)


# ============================================================
# BASIC WAF DIAGNOSTICS
# ============================================================

print("\n========================================")
print("WAF DIAGNOSTICS")
print("========================================")

waf_mag = np.sqrt(
    waf_u_all.astype(np.float64)**2
    +
    waf_v_all.astype(np.float64)**2
)

valid = np.isfinite(
    waf_mag
)

if np.any(valid):

    vals = waf_mag[valid]

    print(
        "WAF magnitude statistics:"
    )

    print(
        "  Minimum :",
        np.nanmin(vals)
    )

    print(
        "  Median  :",
        np.nanmedian(vals)
    )

    print(
        "  90th    :",
        np.nanpercentile(vals, 90)
    )

    print(
        "  95th    :",
        np.nanpercentile(vals, 95)
    )

    print(
        "  99th    :",
        np.nanpercentile(vals, 99)
    )

    print(
        "  Maximum :",
        np.nanmax(vals)
    )


print("\n========================================")
print("DONE")
print("========================================")

print(
    "Instantaneous:",
    output_inst
)

print(
    "JJA monthly:",
    output_jja_monthly
)

print(
    "JJA mean:",
    output_jja_mean
)
