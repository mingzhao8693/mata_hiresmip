#!/usr/bin/env python

import os
import sys
import numpy as np
import xarray as xr

from windspharm.xarray import VectorWind


# ============================================================
# COMMAND-LINE ARGUMENTS
# ============================================================

if len(sys.argv) != 5:
    print("Usage:")
    print(
        "  python calculate_rws_waf.py "
        "INPUT_DIR OUTPUT_DIR START_YEAR END_YEAR"
    )
    print("")
    print("Example:")
    print(
        "  python calculate_rws_waf.py "
        "/work/miz/rws /work/miz/rws_output 2 101"
    )
    sys.exit(1)


DATA_DIR = sys.argv[1]
OUTPUT_DIR = sys.argv[2]
START_YEAR = int(sys.argv[3])
END_YEAR = int(sys.argv[4])


# ============================================================
# CHECK COMMAND-LINE ARGUMENTS
# ============================================================

if START_YEAR < 2:
    raise ValueError(
        "START_YEAR must be >= 2"
    )

if END_YEAR > 101:
    raise ValueError(
        "END_YEAR must be <= 101"
    )

if START_YEAR > END_YEAR:
    raise ValueError(
        "START_YEAR must be <= END_YEAR"
    )

if not os.path.isdir(DATA_DIR):
    raise ValueError(
        f"Input directory does not exist: {DATA_DIR}"
    )

os.makedirs(
    OUTPUT_DIR,
    exist_ok=True
)


print(
    f"Input directory : {DATA_DIR}"
)

print(
    f"Output directory: {OUTPUT_DIR}"
)

print(
    f"Processing years {START_YEAR:04d} "
    f"through {END_YEAR:04d}"
)


# ============================================================
# FIXED 6-HOURLY CLIMATOLOGY USED AS BASIC STATE
# ============================================================

ua_clim_file = (
    f"{DATA_DIR}/"
    f"atmos_cmip.ua_unmsk.0002_0101_climo_lres.nc"
)

va_clim_file = (
    f"{DATA_DIR}/"
    f"atmos_cmip.va_unmsk.0002_0101_climo_lres.nc"
)

zg_clim_file = (
    f"{DATA_DIR}/"
    f"atmos_cmip.zg_unmsk.0002_0101_climo_lres.nc"
)


# ============================================================
# PRESSURE LEVEL
# ============================================================

target_plev = 25000.0       # Pa = 250 hPa


# ============================================================
# EARTH RADIUS
# ============================================================

EARTH_RADIUS = 6.371e6      # m


# ============================================================
# GRAVITY
# ============================================================

GRAVITY = 9.80665            # m s-2


# ============================================================
# MINIMUM BASIC-STATE WIND SPEED FOR WAF
# ============================================================

MIN_BASIC_SPEED = 5.0        # m s-1


# ============================================================
# BLOCK SIZE
# ============================================================

BLOCK_SIZE = 20


# ============================================================
# VARIABLE NAMES
# ============================================================

time_name = "time"
lat_name = "lat"
lon_name = "lon"
plev_name = "plev3"

u_name = "ua_unmsk"
v_name = "va_unmsk"
zg_name = "zg_unmsk"


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

    Parameters
    ----------
    psi : 2D array
        Perturbation streamfunction.

    ubar : 2D array
        Basic-state zonal wind.

    vbar : 2D array
        Basic-state meridional wind.

    lat_deg : 1D array
        Latitude in degrees.

    lon_deg : 1D array
        Longitude in degrees.

    Returns
    -------
    Fx, Fy : 2D arrays
        Eastward and northward WAF components.

    Pressure is normalized by 1000 hPa.

    At 250 hPa:

        p_norm = 250 / 1000 = 0.25
    """

    a = EARTH_RADIUS

    # --------------------------------------------------------
    # Pressure normalization
    # --------------------------------------------------------

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
    # Longitude grid spacing
    # --------------------------------------------------------

    dlon = lon[1] - lon[0]

    # --------------------------------------------------------
    # Longitude derivatives
    #
    # Longitude is periodic.
    # --------------------------------------------------------

    dpsi_dlon = (
        np.roll(
            psi,
            -1,
            axis=1
        )
        -
        np.roll(
            psi,
            1,
            axis=1
        )
    ) / (
        2.0 * dlon
    )

    d2psi_dlon2 = (
        np.roll(
            psi,
            -1,
            axis=1
        )
        -
        2.0 * psi
        +
        np.roll(
            psi,
            1,
            axis=1
        )
    ) / (
        dlon**2
    )

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
    # Eastward WAF
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
    # Northward WAF
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
# OPEN CLIMATOLOGY ONCE
# ============================================================

print(
    "Opening 6-hourly climatology..."
)

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


# ============================================================
# CLIMATOLOGY LATITUDE ORIENTATION
# ============================================================

if (
    uc[lat_name].values[0]
    <
    uc[lat_name].values[-1]
):

    print(
        "Reversing climatology latitude "
        "to north-to-south..."
    )

    uc = uc.isel(
        {
            lat_name:
            slice(None, None, -1)
        }
    )

    vc = vc.isel(
        {
            lat_name:
            slice(None, None, -1)
        }
    )

    zgc = zgc.isel(
        {
            lat_name:
            slice(None, None, -1)
        }
    )


# ============================================================
# MONTHLY BASIC-STATE U/V
# ============================================================

print(
    "Calculating monthly climatological "
    "basic-state U/V..."
)

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
# MONTHLY CLIMATOLOGICAL ZONAL-MEAN Z
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
# CLOSE CLIMATOLOGY FILES
# ============================================================

ds_uc.close()
ds_vc.close()
ds_zgc.close()


# ============================================================
# LOOP OVER MODEL YEARS
# ============================================================

for year in range(
    START_YEAR,
    END_YEAR + 1
):

    yy = f"{year:04d}"

    print()
    print(
        "================================================"
    )
    print(
        f"PROCESSING MODEL YEAR {yy}"
    )
    print(
        "================================================"
    )


    # ========================================================
    # INPUT FILE NAMES
    # ========================================================

    ua_file = (
        f"{DATA_DIR}/"
        f"atmos_cmip."
        f"{yy}010100-{yy}123123."
        f"ua_unmsk_lres.nc"
    )

    va_file = (
        f"{DATA_DIR}/"
        f"atmos_cmip."
        f"{yy}010100-{yy}123123."
        f"va_unmsk_lres.nc"
    )

    zg_file = (
        f"{DATA_DIR}/"
        f"atmos_cmip."
        f"{yy}010100-{yy}123123."
        f"zg_unmsk_lres.nc"
    )


    # ========================================================
    # OUTPUT FILE NAMES
    # ========================================================

    out_file = (
        f"{OUTPUT_DIR}/"
        f"atmos_cmip."
        f"{yy}010100-{yy}123123."
        f"rws_waf.nc"
    )

    jja_monthly_file = (
        f"{OUTPUT_DIR}/"
        f"atmos_cmip."
        f"{yy}010100-{yy}123123."
        f"rws_waf.JJA_monthly.nc"
    )

    jja_mean_file = (
        f"{OUTPUT_DIR}/"
        f"atmos_cmip."
        f"{yy}010100-{yy}123123."
        f"rws_waf.JJA_mean.nc"
    )


    # ========================================================
    # CHECK INPUT FILES
    # ========================================================

    input_files = [
        ua_file,
        va_file,
        zg_file
    ]

    missing = [
        f
        for f in input_files
        if not os.path.exists(f)
    ]

    if missing:

        print(
            f"WARNING: missing input file(s) "
            f"for year {yy}:"
        )

        for f in missing:
            print(
                "   ",
                f
            )

        print(
            f"Skipping year {yy}."
        )

        continue


    # ========================================================
    # OPEN INPUT FILES
    # ========================================================

    print(
        f"Opening instantaneous files "
        f"for year {yy}..."
    )

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


    # ========================================================
    # SELECT 250 hPa
    # ========================================================

    u = ds_u[u_name].sel(
        {plev_name: target_plev}
    )

    v = ds_v[v_name].sel(
        {plev_name: target_plev}
    )

    zg = ds_zg[zg_name].sel(
        {plev_name: target_plev}
    )


    # ========================================================
    # COORDINATES
    # ========================================================

    lat = u[lat_name].values
    lon = u[lon_name].values
    time = u[time_name]

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
        "Number of times:",
        len(time)
    )


    # ========================================================
    # REVERSE LATITUDE IF NECESSARY
    # ========================================================

    if lat[0] < lat[-1]:

        print(
            "Reversing latitude "
            "to north-to-south..."
        )

        u = u.isel(
            {
                lat_name:
                slice(None, None, -1)
            }
        )

        v = v.isel(
            {
                lat_name:
                slice(None, None, -1)
            }
        )

        zg = zg.isel(
            {
                lat_name:
                slice(None, None, -1)
            }
        )

        lat = u[lat_name].values


    # ========================================================
    # CORIOLIS PARAMETER
    # ========================================================

    OMEGA = 7.292115e-5

    lat_rad = np.deg2rad(
        lat
    )

    f = (
        2.0
        * OMEGA
        * np.sin(lat_rad)
    )

    f_safe = np.where(
        np.abs(f) > 1.0e-5,
        f,
        np.nan
    )


    # ========================================================
    # OUTPUT ARRAY DIMENSIONS
    # ========================================================

    ntime = len(time)
    nlat = len(lat)
    nlon = len(lon)

    print(
        "Output dimensions:",
        ntime,
        nlat,
        nlon
    )


    # ========================================================
    # PREALLOCATE OUTPUT
    # ========================================================

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


    # ========================================================
    # MAIN TIME LOOP
    # ========================================================

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
            f"Year {yy}: processing records "
            f"{i0} - {i1-1} of {ntime}"
        )


        # ----------------------------------------------------
        # Read block
        # ----------------------------------------------------

        u_block = (
            u.isel(
                {
                    time_name:
                    slice(i0, i1)
                }
            )
            .values
            .astype(np.float64)
        )

        v_block = (
            v.isel(
                {
                    time_name:
                    slice(i0, i1)
                }
            )
            .values
            .astype(np.float64)
        )

        zg_block = (
            zg.isel(
                {
                    time_name:
                    slice(i0, i1)
                }
            )
            .values
            .astype(np.float64)
        )

        nblock = i1 - i0


        # ----------------------------------------------------
        # Windspharm
        # ----------------------------------------------------

        print(
            "  Calculating "
            "vorticity/divergence..."
        )

        vw_obj = VectorWind(

            xr.DataArray(
                u_block,
                dims=(
                    "time",
                    lat_name,
                    lon_name
                ),
                coords={
                    lat_name: lat,
                    lon_name: lon
                }
            ),

            xr.DataArray(
                v_block,
                dims=(
                    "time",
                    lat_name,
                    lon_name
                ),
                coords={
                    lat_name: lat,
                    lon_name: lon
                }
            )
        )


        # ----------------------------------------------------
        # Relative vorticity
        # ----------------------------------------------------

        vort_da = vw_obj.vorticity(
            truncation=None
        )


        # ----------------------------------------------------
        # Divergence
        # ----------------------------------------------------

        div_da = vw_obj.divergence(
            truncation=None
        )


        # ----------------------------------------------------
        # Helmholtz decomposition
        # ----------------------------------------------------

        print(
            "  Calculating "
            "Helmholtz decomposition..."
        )

        (
            uchi_da,
            vchi_da,
            upsi_da,
            vpsi_da
        ) = vw_obj.helmholtz()


        # ----------------------------------------------------
        # Velocity potential
        # ----------------------------------------------------

        print(
            "  Calculating "
            "velocity potential..."
        )

        chi_da = vw_obj.velocitypotential(
            truncation=None
        )


        # ----------------------------------------------------
        # Rotational streamfunction
        # ----------------------------------------------------

        print(
            "  Calculating "
            "rotational streamfunction..."
        )

        sf_da = vw_obj.sfvp(
            truncation=None
        )[0]


        # ----------------------------------------------------
        # Convert to numpy
        # ----------------------------------------------------

        vort = vort_da.values
        div = div_da.values

        uchi = uchi_da.values
        vchi = vchi_da.values

        urot = upsi_da.values
        vrot = vpsi_da.values

        chi = chi_da.values
        sf = sf_da.values


        # ====================================================
        # ROSSBY WAVE SOURCE
        # ====================================================

        eta = (
            vort
            +
            f[None, :, None]
        )


        # ----------------------------------------------------
        # Longitude gradient of absolute vorticity
        # ----------------------------------------------------

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


        # ----------------------------------------------------
        # Latitude gradient
        # ----------------------------------------------------

        deta_dlat = np.gradient(
            eta,
            lat_rad,
            axis=1
        )


        # ----------------------------------------------------
        # Convert to physical gradients
        # ----------------------------------------------------

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


        # ----------------------------------------------------
        # RWS
        # ----------------------------------------------------

        rws = (
            -eta * div
            -
            uchi * deta_dx
            -
            vchi * deta_dy
        )


        # ----------------------------------------------------
        # Store diagnostics
        # ----------------------------------------------------

        rws_all[i0:i1] = (
            rws.astype(np.float32)
        )

        div_all[i0:i1] = (
            div.astype(np.float32)
        )

        vort_all[i0:i1] = (
            vort.astype(np.float32)
        )

        chi_all[i0:i1] = (
            chi.astype(np.float32)
        )

        sf_all[i0:i1] = (
            sf.astype(np.float32)
        )

        urot_all[i0:i1] = (
            urot.astype(np.float32)
        )

        vrot_all[i0:i1] = (
            vrot.astype(np.float32)
        )


        # ====================================================
        # INSTANTANEOUS WAF
        # ====================================================

        for j in range(
            nblock
        ):

            ii = i0 + j


            # ------------------------------------------------
            # Month
            # ------------------------------------------------

            month = int(
                time.isel(
                    {
                        time_name:
                        ii
                    }
                )
                .dt.month.values
            )


            # ------------------------------------------------
            # Monthly basic state
            # ------------------------------------------------

            ubar = (
                u_month
                .sel(month=month)
                .values
                .astype(np.float64)
            )

            vbar = (
                v_month
                .sel(month=month)
                .values
                .astype(np.float64)
            )


            # ------------------------------------------------
            # Monthly climatological zonal-mean Z
            # ------------------------------------------------

            zg_zonal = (
                zg_zonal_month
                .sel(month=month)
                .values
                .astype(np.float64)
            )


            # ------------------------------------------------
            # Instantaneous perturbation Z
            # ------------------------------------------------

            zg_prime = (
                zg_block[j]
                -
                zg_zonal[:, None]
            )


            # ------------------------------------------------
            # Geostrophic perturbation streamfunction
            #
            # psi' = g Zg' / f
            # ------------------------------------------------

            psi_prime = (
                GRAVITY
                * zg_prime
                /
                f_safe[:, None]
            )


            # ------------------------------------------------
            # TN01 WAF
            # ------------------------------------------------

            Fx, Fy = tn01_waf_2d(
                psi_prime,
                ubar,
                vbar,
                lat,
                lon
            )


            # ------------------------------------------------
            # Equatorial mask
            # ------------------------------------------------

            equator_mask = (
                np.abs(lat) < 10.0
            )

            Fx[
                equator_mask,
                :
            ] = np.nan

            Fy[
                equator_mask,
                :
            ] = np.nan


            # ------------------------------------------------
            # Store WAF
            # ------------------------------------------------

            waf_u_all[ii] = (
                Fx.astype(np.float32)
            )

            waf_v_all[ii] = (
                Fy.astype(np.float32)
            )


    # ========================================================
    # CREATE INSTANTANEOUS OUTPUT DATASET
    # ========================================================

    print(
        f"Creating output dataset "
        f"for year {yy}..."
    )

    ds_out = xr.Dataset(

        data_vars={

            "rws": (
                (
                    time_name,
                    lat_name,
                    lon_name
                ),
                rws_all
            ),

            "divergence": (
                (
                    time_name,
                    lat_name,
                    lon_name
                ),
                div_all
            ),

            "relative_vorticity": (
                (
                    time_name,
                    lat_name,
                    lon_name
                ),
                vort_all
            ),

            "velocity_potential": (
                (
                    time_name,
                    lat_name,
                    lon_name
                ),
                chi_all
            ),

            "rotational_streamfunction": (
                (
                    time_name,
                    lat_name,
                    lon_name
                ),
                sf_all
            ),

            "u_rot": (
                (
                    time_name,
                    lat_name,
                    lon_name
                ),
                urot_all
            ),

            "v_rot": (
                (
                    time_name,
                    lat_name,
                    lon_name
                ),
                vrot_all
            ),

            "waf_u": (
                (
                    time_name,
                    lat_name,
                    lon_name
                ),
                waf_u_all
            ),

            "waf_v": (
                (
                    time_name,
                    lat_name,
                    lon_name
                ),
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
                "Takaya-Nakamura phase-independent "
                "wave activity flux",

            "basic_state":
                "monthly climatological U/V from "
                "1950-2020 climatology",

            "perturbation":
                "instantaneous geopotential height "
                "minus monthly climatological "
                "zonal mean",

            "pressure":
                "250 hPa",

            "pressure_normalization":
                "p/1000 hPa = 0.25",

            "minimum_basic_wind_speed":
                f"{MIN_BASIC_SPEED} m s-1",

            "model_year":
                yy
        }
    )


    # ========================================================
    # SAVE INSTANTANEOUS OUTPUT
    # ========================================================

    print(
        f"Saving instantaneous output "
        f"for year {yy}:"
    )

    print(
        out_file
    )

    ds_out.to_netcdf(
        out_file
    )


    # ========================================================
    # REMOVE EXTRA JAN-1 RECORD
    # ========================================================

    last_time = time.isel(
        {
            time_name:
            -1
        }
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
            "Removing final Jan-1 00 UTC "
            "record before seasonal averaging."
        )

        ds_season = ds_out.isel(
            {
                time_name:
                slice(0, -1)
            }
        )

    else:

        ds_season = ds_out


    # ========================================================
    # SELECT JJA
    # ========================================================

    print(
        f"Selecting JJA for year {yy}..."
    )

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


    # ========================================================
    # JJA MONTHLY MEANS
    # ========================================================

    print(
        "Calculating June/July/August means..."
    )

    ds_jja_monthly = (
        ds_jja
        .groupby(
            f"{time_name}.month"
        )
        .mean(
            time_name,
            skipna=True
        )
    )


    # ========================================================
    # SAVE JJA MONTHLY
    # ========================================================

    print(
        "Saving JJA monthly output:"
    )

    print(
        jja_monthly_file
    )

    ds_jja_monthly.to_netcdf(
        jja_monthly_file
    )


    # ========================================================
    # JJA MEAN
    # ========================================================

    print(
        "Calculating overall JJA mean..."
    )

    ds_jja_mean = (
        ds_jja
        .mean(
            time_name,
            skipna=True
        )
    )


    # ========================================================
    # SAVE JJA MEAN
    # ========================================================

    print(
        "Saving JJA mean:"
    )

    print(
        jja_mean_file
    )

    ds_jja_mean.to_netcdf(
        jja_mean_file
    )


    # ========================================================
    # WAF DIAGNOSTICS
    # ========================================================

    print()

    print(
        "========================================"
    )

    print(
        f"WAF DIAGNOSTICS -- YEAR {yy}"
    )

    print(
        "========================================"
    )


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
            np.nanpercentile(
                vals,
                90
            )
        )

        print(
            "  95th    :",
            np.nanpercentile(
                vals,
                95
            )
        )

        print(
            "  99th    :",
            np.nanpercentile(
                vals,
                99
            )
        )

        print(
            "  Maximum :",
            np.nanmax(vals)
        )


    # ========================================================
    # CLOSE DATA
    # ========================================================

    ds_u.close()
    ds_v.close()
    ds_zg.close()

    print()

    print(
        f"FINISHED YEAR {yy}"
    )

    print()


# ============================================================
# ALL YEARS FINISHED
# ============================================================

print()

print(
    "================================================"
)

print(
    f"FINISHED YEARS {START_YEAR:04d} "
    f"THROUGH {END_YEAR:04d}"
)

print(
    "================================================"
)
