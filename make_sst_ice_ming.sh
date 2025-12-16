#!/bin/bash
alias cdo=/nbhome/Fabien.Paulot/my_soft/bin/cdo

cd $FTMPDIR

rm -f temp*nc

export inpfa=/archive/Ming.Zhao/backup/highresmip/combined/hadisst2.2_sea_ice_daily_1948_2015.nc
export inpf=hadisst2.2_sea_ice_daily_1948_2015.nc
export outf=ice.nc
export ivar=siconc
export ovar=ice

#cdo fillmiss $inpfa $inpf
#cdo  selyear,1948 $inpf temp0.nc
#cdo  shifttime,-1year temp0.nc temp1.nc
#cdo  selyear,2015 $inpf temp0_b.nc
#cdo  shifttime,1year temp0_b.nc temp1_b.nc
#cdo  mergetime temp1.nc $inpf temp1_b.nc temp2.nc
#mv temp2.nc temp3.nc
#cdo  setreftime,1860-01-01,00:00:00,days temp3.nc $outf

cdo fillmiss $inpfa $outf
ncrename -v $ivar,$ovar $outf 
ncatted -O -a units,ice,o,c,% $outf

ncl 'inpf="${outf}"' /nbhome/Fabien.Paulot/cmip6_sst_ice/write_date.ncl

export inpfa=/archive/Ming.Zhao/backup/highresmip/hadisst2.2_sst_daily_1948_2015.nc
export inpf=hadisst2.2_sst_daily_1948_2015.nc
export outf=sst.nc
export ivar=tos
export ovar=sst

rm -f temp*nc

#cdo fillmiss $inpfa $inpf
#cdo  selyear,1948 $inpf temp0.nc
#cdo  shifttime,-1year temp0.nc temp1.nc
#cdo  selyear,2015 $inpf temp0_b.nc
#cdo  shifttime,1year temp0_b.nc temp1_b.nc
#cdo  mergetime temp1.nc $inpf temp1_b.nc temp2.nc
#cdo  setreftime,1860-01-01,00:00:00,days temp2.nc temp3.nc
#cdo  addc,273.15 temp3.nc temp4.nc
#cdo fillmiss temp4.nc $outf

cdo fillmiss $inpfa $inpf
cdo  addc,273.15 $inpf temp.nc
cdo fillmiss temp.nc $outf
ncrename -v $ivar,$ovar $outf 
ncatted -O -a units,sst,o,c,K $outf

ncl 'inpf="${outf}"' /nbhome/Fabien.Paulot/cmip6_sst_ice/write_date.ncl

rm -f temp*nc
