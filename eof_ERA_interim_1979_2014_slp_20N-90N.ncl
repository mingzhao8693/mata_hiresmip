; ncl 'season="ALL"' eof_ERA_interim_1979_2014_slp_20N-90N.ncl
; ncl 'season="DJF"' eof_ERA_interim_1979_2014_slp_20N-90N.ncl
; ncl 'season="JJA"' eof_ERA_interim_1979_2014_slp_20N-90N.ncl
; ncl 'season="MAM"' eof_ERA_interim_1979_2014_slp_20N-90N.ncl
; ncl 'season="SON"' eof_ERA_interim_1979_2014_slp_20N-90N.ncl
; ncl 'season="NDJFM"' eof_ERA_interim_1979_2014_slp_20N-90N.ncl
; ncl 'season="MJJAS"' eof_ERA_interim_1979_2014_slp_20N-90N.ncl
;================================================
; eof_6_640.ncl
;
; Concepts illustrated:
;   - Calculating EOFs
;   - Drawing a black-and-white XY plot
;   - Applying spatial weighting
;   - Writing EOFs to a NetCDF file
;   - Labeling the X axis with nicely-formatted time labels
;   - Drawing a time series plot
;================================================
; This script uses functions eofunc_n_Wrap and 
; eofunc_ts_n_Wrap, which were added in NCL V6.4.0.
;================================================
; These files are loaded by default in NCL V6.2.0 and newer
; load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
; load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
; load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

;*******************************************
; Read data
;*******************************************
  diri   = "/archive/Ming.Zhao/obs_for_am4p0_paper/ERA_interim/monthly/"
  expn   ="ERA_interim_1979_2014"
  fili   = "msl.197901-201512.nc"                    ; rectilinear
  fn     = diri+fili
  f      = addfile(fn,"r")                         ; open file                 
  varn   = f->msl({692496:1007328},{20:90},:)      ; p(time,latitude,longtitude)       
  printVarSummary(varn)                            ; p(21,61,240)
  varname="_SLP_20N-90N_"

  varn = varn*0.01;
  varn_clm = clmMonTLL(varn)
  varn_ano = calcMonAnomTLL(varn,varn_clm)
  printVarSummary(varn_clm)                            
  printVarSummary(varn_ano)    
  
  ;season = "DJF" 
  ;season = "JJA"
  ;season = "MAM"
  ;season = "SON"
  ;season = "ALL"

  if (season .eq. "DJF") then
    t1=ispan(0,  1,1)
    t2=ispan(11,13,1)
  elseif (season .eq. "JJA") then
    t1=ispan(5,7,1)
    t2=t1+12
  elseif (season .eq. "MAM") then
    t1=ispan(2,4,1)
    t2=t1+12
  elseif (season .eq. "SON") then
    t1=ispan(8,10,1)
    t2=t1+12
  elseif (season .eq. "NDJFM") then
    t1=ispan(0,2,1)
    t2=ispan(10,14,1)
  elseif (season .eq. "MJJAS") then
    t1=ispan(4,8,1)
    t2=t1+12
  else
    t1=ispan(0,11,1)
    t2=t1+12
  end if
  tidx0 = array_append_record(t1,t2,0)
  print(tidx0)
  i = 0
  do while(i.le.33)
    t2 = t2+12
    i=i+1
    tidx = array_append_record(tidx0,t2,0)
    delete(tidx0)
    tidx0 = tidx
    delete(tidx)
  end do
  tidx=tidx0
  delete(tidx0)
  if (season .eq. "DJF") then
    delete(t2)
    t2=ispan(431,431,1)
    tidx0=array_append_record(tidx,t2,0)
    delete(tidx);
    tidx=tidx0;
  end if
  print(tidx)

;  varnx = varn(tidx,:,:)
;  printVarSummary(varnx)
;  quit

;  wks = gsn_open_wks("x11","plot SLP")  ; output to screen
;  wks = gsn_open_wks("png","ncl_slp")   ; output to file ncl_slp.png    
;  res              = True               ; plot mods desired
;  res@tiMainString = "Default Color"    ; main title
;  res@cnFillOn     =  True              ; turn on color fill
;  res@tiMainString = "NCL plot of SLP"
;  plot = gsn_csm_contour_map(wks, varnx, res)     ; create plot
;  quit


  p = varn_ano(tidx,:,:)                              ; do EOF for varn_ano
;*******************************************
; Calculate EOFs
;*******************************************
  w      = sqrt(cos(0.01745329*p&latitude))           ; weights(61)
  wp     = p*conform(p, w, 1)                         ; wp(21,61,240)
  copy_VarCoords(p, wp)                               ; wp(time,lat,lon)
  printVarSummary(wp)                                 ; [time | 21] x [latitude | 61] x [longitude | 240]
  
  neof   = 4                                          ; user specified (commonly <=5) 
  eof    = eofunc_n_Wrap(wp, neof, False, 0)
  eof_ts = eofunc_ts_n_Wrap (wp, eof, False, 0)
  
  printVarSummary( eof )                              ; examine EOF variables                 
  printVarSummary( eof_ts )
  
;*******************************************
; Create netCDF: simple approach                                               
;*******************************************
  fnc          = expn+varname+season+".EOF.nc"
  system("/bin/rm -f "+fnc)               ; rm any pre-existing file            
  fout         = addfile(fnc, "c")        ; new netCDF file                   
  
  fout@title   = "EOF of SLP: 1979-2014"
  fout->EOF    = eof
  fout->EOF_TS = eof_ts
  
;*******************************************
; North significance test: any pcvar, eval_transpose, eval can be used
;*******************************************
  print("---")
  print("--- eofunc_north ---")
  print("---")
  
  dimp   = dimsizes(p)
  ntim   = dimp(0)                                            ; max # eigenvalues possible
  
  prinfo = True
  sig    = eofunc_north(eof@pcvar, ntim, prinfo)            
                                                              
  print("---")
;*******************************************
;  Create a 'time' axis for plot
;*******************************************

  yyyymm = cd_calendar(eof_ts&time,-1)  
  yrfrac = yyyymm_to_yyyyfrac(yyyymm, 0.0); not used here

;*******************************************
;  plots
;*******************************************

  pltType = "png"                         ; send graphics to PNG file

  wks = gsn_open_wks(pltType,expn+varname+season+"_EOF")
;
  plot = new(neof,graphic)                ; create graphic array
                                          ; only needed if paneling
  res                      = True         
  res@gsnDraw              = False        ; don't draw yet
  res@gsnFrame             = False        ; don't advance frame yet
  res@gsnPolar             = "NH"         ; specify the hemisphere
 
  res@mpCenterLonF         = -90.           ; default is 0 [GM]
  res@mpMinLatF            = min(wp&latitude)
  res@mpMaxLatF            = max(wp&latitude)

  res@cnFillOn             = True         ; turn on color fill
  res@cnFillPalette        = "BlWhRe"     ; choose colormap
  res@cnLinesOn            = True         ; True is default
  res@cnLineLabelsOn       = False        ; True is default
  res@lbLabelBarOn         = False        ; turn off individual lb's
                                          ; set symmetric plot min/max
  symMinMaxPlt(eof, 16, False, res); contributed.ncl

; panel plot only resources

  resP                     = True         ; modify the panel plot
  resP@gsnMaximize         = True         ; large format
  resP@gsnPanelLabelBar    = True         ; add common colorbar
  resP@gsnPanelMainString  = expn+varname+season+" (SLP: 1979-2014: eofunc_north)"

  do n=0,neof-1
     res@gsnLeftString  = "EOF "+(n+1)
     res@gsnCenterString= "NORTH="+sig(n)
     res@gsnRightString = sprintf("%5.1f", eof@pcvar(n)) +"%"

     plot(n) = gsn_csm_contour_map_polar(wks,eof(n,:,:),res)
  end do
  gsn_panel(wks,plot,(/2,2/),resP)     ; draw all 'neof' as one plot

;*******************************************
; time series (principal component) plot
;*******************************************

  eof_ts@long_name = "Amplitude"

  rts           = True
  rts@gsnDraw   = False       ; don't draw yet
  rts@gsnFrame  = False       ; don't advance frame yet

  rts@vpHeightF = 0.40        ; Changes the aspect ratio
  rts@vpWidthF  = 0.85
  rts@vpXF      = 0.10        ; change start locations
  rts@vpYF      = 0.75        ; the plot

  rts@gsnYRefLine           = 0.              ; reference line   
  rts@gsnAboveYRefLineColor = "red"           ; above ref line fill red
  rts@gsnBelowYRefLineColor = "blue"          ; below ref line fill blue

; panel plot only resources
  rtsP                      = True             ; modify the panel plot
  rtsP@gsnMaximize          = True             ; large format
  rtsP@gsnPanelMainString   = expn+varname+season+" (SLP: 1979-2014: eofunc_north)"
      
  do n=0,neof-1
     rts@gsnLeftString  = "EOF "+(n+1)
     rts@gsnCenterString= "NORTH="+sig(n)
     rts@gsnRightString = sprintf("%5.1f", eof@pcvar(n)) +"%"

     plot(n) = gsn_csm_xy (wks,yrfrac,eof_ts(n,:),rts)
  end do
  gsn_panel(wks,plot,(/2,2/),rtsP)        ; draw all 'neof' as one plot


