1) Combine yearly netcdf file to a single combined netcdf file for SST
or sea ice data

2) Use the following scripts to do convert 

module purge
module load cdo/1.9.2
module load nco/4.7.6
module load netcdf/4.6.1
module load ncarg/6.5.0   

set inpfa = /archive/Ming.Zhao/backup/highresmip/CMIP6_hiresmip_futureSST_ICE/combined/combined_cmip6_hiresmip_sst_daily_2015_2050.nc
set inpf = cmip6_hiresmip_sst_2015_2050.nc
set outf = sst.nc
set ivar = tos
set ovar = sst

cdo fillmiss $inpfa $inpf
cdo addc,273.15 $inpf temp.nc
cdo fillmiss temp.nc $outf
ncrename -v $ivar,$ovar $outf 
ncatted -O -a units,sst,o,c,K $outf

cdo  selyear,2015 sst.nc temp0.nc
cdo  shifttime,-1year temp0.nc sst_2014.nc
cdo  selyear,2050 sst.nc temp1.nc
cdo  shifttime,1year temp1.nc sst_2051.nc
cdo  mergetime sst_2014.nc sst.nc sst_2051.nc sst_2014_2051.nc


ncl 'inpf="sst_2014_2051.nc"' $HOME/AM2p12b/warsaw/input_warsaw/mata_highresmip/write_date.ncl

nccopy -d 1 sst_2014_2051.nc sst_2014_2051_d2_compressed.nc
