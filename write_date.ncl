begin

inp = addfile(inpf,"w")

time = inp->time

T = cd_calendar(time,0)

year = T(:,0)
mon  = T(:,1)
day  = T(:,2)

year!0 = "time"
mon!0  = "time"
day!0  = "time"
year&time = time
mon&time  = time
day&time  = time

;nrecords = dimsizes(time)

;inp->mon=mon
;inp->day=day
;inp->year=year
;inp->nrecords=nrecords

time_bnds = new((/dimsizes(time),2/),double)
time_bnds(:,0) = time-0.5
time_bnds(:,1) = time+0.5

copy_VarCoords(time,time_bnds(:,0))
time_bnds!1="bnds"
inp->time_bnds=time_bnds

;time@calendar="gregorian"
time@bounds=tochar("time_bnds");
inp->time=time


end