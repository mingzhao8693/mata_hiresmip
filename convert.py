
import xarray as xr

# Load the ERA5 file
print("Loading dataset...")
ds = xr.open_dataset('ERA5_197901-202012.tp.nc')

# Get exact days per month (handles leap years automatically)
days = ds.time.dt.days_in_month

# Perform the conversion (m -> mm and divide by days)
print("Converting units to mm/day...")
ds['tp'] = (ds['tp'] * 1000) / days

# Fix the metadata units attribute
ds['tp'].attrs['units'] = 'mm/day'

# Save the new file
print("Saving final netCDF file...")
ds.to_netcdf('final_mm_day.nc')
print("Done!")
