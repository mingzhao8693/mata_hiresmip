1) Combine yearly netcdf file to a single combined netcdf file for SST
or sea ice data

2) Use the following scripts to do convert 

module purge
module load cdo/1.9.2
module load nco/4.7.6
module load netcdf/4.6.1
module load ncarg/6.5.0   
module load ncview/2.1.2

set inpfa = /archive/Ming.Zhao/backup/highresmip/CMIP6_hiresmip_futureSST_ICE/combined/combined_cmip6_hiresmip_sea_ice_daily_2015_2050.nc
set inpf = cmip6_hiresmip_sea_ice_daily_2015_2050.nc
set outf = ice.nc
set ivar = siconc
set ovar = ice

cdo fillmiss $inpfa $outf
ncrename -v $ivar,$ovar $outf 
ncatted -O -a units,ice,o,c,% $outf

cdo  selyear,2015 ice.nc temp0.nc
cdo  shifttime,-1year temp0.nc ice_2014.nc
cdo  selyear,2050 ice.nc temp1.nc
cdo  shifttime,1year temp1.nc ice_2051.nc
cdo  mergetime ice_2014.nc ice.nc ice_2051.nc ice_2014_2051.nc
#cdo  setreftime,1860-01-01,00:00:00,days temp3.nc $outf

ncl 'inpf="ice_2014_2051.nc"' $HOME/AM2p12b/warsaw/input_warsaw/mata_highresmip/write_date.ncl

nccopy -d 1 ice_2014_2051.nc ice_2014_2051_d1_compressed.nc
