
begin

system("cp /archive/Xianan.Jiang/mjo/sst/sst.climo.1981-2000/sst.climo.1981-2000.data.nc temp.nc")

 rr  = addfile("monthly_mean_sst.nc", "r")  ; input
 sst = doubletofloat(rr->sst)

 nr  = addfile("temp.nc", "w")  ; input
 nr->SST=sst

system("ncks -C -O -x -v ncl5,ncl6,ncl7 temp.nc new_monthly_mean_sst.nc")
system("\rm temp.nc")
end


