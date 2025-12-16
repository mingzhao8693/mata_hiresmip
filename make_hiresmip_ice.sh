#!/bin/bash

module load cdo/1.9.2

cd $FTMPDIR

rm -f temp*nc

export inpfa=/archive/Ming.Zhao/backup/highresmip/CMIP6_hiresmip_futureSST_ICE/combined/cmip6_hiresmip_sea_ice_daily_2015_2050.nc
export inpf=cmip6_hiresmip_sea_ice_daily_2015_2050.nc
export outf=ice.nc
export ivar=siconc
export ovar=ice

#cdo fillmiss $inpfa $inpf
#cdo  selyear,2015 $inpf temp0.nc
#cdo  shifttime,-1year temp0.nc temp1.nc
#cdo  selyear,2050 $inpf temp0_b.nc
#cdo  shifttime,1year temp0_b.nc temp1_b.nc
#cdo  mergetime temp1.nc $inpf temp1_b.nc temp2.nc
#mv temp2.nc temp3.nc
#cdo  setreftime,1860-01-01,00:00:00,days temp3.nc $outf

cdo fillmiss $inpfa $outf
ncrename -v $ivar,$ovar $outf 
ncatted -O -a units,ice,o,c,% $outf

ncl 'inpf="${outf}"' /archive/Ming.Zhao/backup/highresmip/CMIP6_hiresmip_futureSST_ICE/combined/write_date.ncl
