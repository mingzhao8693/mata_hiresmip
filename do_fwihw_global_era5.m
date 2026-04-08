function [v]=do_fwihw_global_era5(tpath,expn,yr1,yr2,do_trend)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%tpath='/archive/Ming.Zhao/awg/2023.04/';
%expn ='c192L33_am4p0_2010climo_newctl';                 yr1=2;    yr2=101;
%expn='c192L33_am4p0_2010climo_newctl_p1K';              yr1=2;    yr2=101;
%expn='c192L33_am4p0_2010climo_trend_1979_2020_spear';   yr1=2;    yr2=101;
%expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2'; yr1=2;    yr2=101;
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_30min';    yr1=1951; yr2=2020;
%expn ='c192L33_CM4X_amip';                              yr1=1979; yr2=2020;

fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fn=strcat(tpath,expn,'/fwihw/',expn,fext,'.hw_thresh_original_and_correct.mat')
if (exist(fn,'file') == 2)
  disp('load in file...'); load(fn); thresh=v.thresh; v
else
  disp(strcat('file not exist:',fn)); return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The following is normally not needed but they are needed
% in case a run is broken due to whatever reason because
%ffmc, dmc and dc calculation require memory of previous state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
do_continue = false %don't do this unless something broken
if do_continue
  exd='/fwihw/'; yr='0015'; fn=strcat(tpath,expn,exd,expn,'_',yr,'.fwihw_ctlthresh.nc');disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,'ffmcday');   a=a(:,:,end); a=permute(a,[3 2 1]); ffmc=a;
    a=ncread(fn,'dmcday');    a=a(:,:,end); a=permute(a,[3 2 1]); dmc =a;
    a=ncread(fn,'dcday');     a=a(:,:,end); a=permute(a,[3 2 1]); dc  =a;
    init_fwiday=[ffmc; dmc; dc;];
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
minlen=3; %used for heat wave analysis lenght of days tasmax exceeding
nlat=v.nlat; nlon=v.nlon; lat=v.lat; lon=v.lon; nyr=v.nyr; pct=v.pct; latlon=v.latlon; opt=0; t=1;
for t=1:nyr; %t=27 corresponds to year 28
  yrt=yr1+t-1; 
  if (yrt<10)
    yr=strcat('000',num2str(yrt));
  elseif (yrt<100)
    yr=strcat('00',num2str(yrt));
  elseif (yrt<1000)
    yr=strcat('0',num2str(yrt));
  else
    yr=num2str(yrt);
  end
% read in daily data and compute fwi
  if t==1
    init_fwiday=[]; 
  end
  nbin=[]; pct=[0.01 0.1 99.9];
  v=fwihw_ana_obs(tpath,expn,yrt,yrt,pct,latlon,opt,init_fwiday,nbin,do_trend); v
  init_fwiday=v.init_fwiday;
% heatwave analysis using tasmax and precomputed thresh duration of minlen
  var=v.tasmaxday.var(1);
  a=var.a; dofy=var.dofy; mofy=var.mofy; year=var.year; time=var.time;
  %i=1,2,3 corresponds to pct=90,95,99
  i=1; th=squeeze(thresh(:,i,:,:)); [hw2d1,hwg1,hwday1,hwtmx1]=detect_heatwaves_grid_new(a,th,minlen,year,mofy,dofy);
  i=2; th=squeeze(thresh(:,i,:,:)); [hw2d2,hwg2,hwday2,hwtmx2]=detect_heatwaves_grid_new(a,th,minlen,year,mofy,dofy);
  i=3; th=squeeze(thresh(:,i,:,:)); [hw2d3,hwg3,hwday3,hwtmx3]=detect_heatwaves_grid_new(a,th,minlen,year,mofy,dofy);
  v.nt=length(hwday1(:,1,1)); v.nday=v.nt/v.nyr;
  a=reshape(hwday1,v.nyr,v.nday,v.nlat,v.nlon); hwday1=permute(a,[4 3 2 1]); 
  a=reshape(hwtmx1,v.nyr,v.nday,v.nlat,v.nlon); hwtmx1=permute(a,[4 3 2 1]); 
  a=reshape(hwday2,v.nyr,v.nday,v.nlat,v.nlon); hwday2=permute(a,[4 3 2 1]); 
  a=reshape(hwtmx2,v.nyr,v.nday,v.nlat,v.nlon); hwtmx2=permute(a,[4 3 2 1]); 
  a=reshape(hwday3,v.nyr,v.nday,v.nlat,v.nlon); hwday3=permute(a,[4 3 2 1]); 
  a=reshape(hwtmx3,v.nyr,v.nday,v.nlat,v.nlon); hwtmx3=permute(a,[4 3 2 1]); 

  a=reshape(time, v.nday,v.nyr); time=a;
  a=v.prday.var(1).a;         a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); prday      =permute(a,[4 3 2 1]); 
  a=v.tasday.var(1).a;        a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); tasday     =permute(a,[4 3 2 1]); 
  a=v.rhday.var(1).a;         a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); rhday      =permute(a,[4 3 2 1]); 
  a=v.wsdday.var(1).a;        a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); wsdday     =permute(a,[4 3 2 1]); 
  a=v.tasmaxday.var(1).a;     a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); tasmaxday  =permute(a,[4 3 2 1]); 

  a=v.fwiday.ffmc.var(1).a;   a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); ffmcday    =permute(a,[4 3 2 1]); 
  a=v.fwiday.dmc.var(1).a;    a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); dmcday     =permute(a,[4 3 2 1]); 
  a=v.fwiday.dc.var(1).a;     a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); dcday      =permute(a,[4 3 2 1]); 
  a=v.fwiday.isi.var(1).a;    a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); isiday     =permute(a,[4 3 2 1]); 
  a=v.fwiday.bui.var(1).a;    a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); buiday     =permute(a,[4 3 2 1]); 
  a=v.fwiday.fwi.var(1).a;    a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); fwiday     =permute(a,[4 3 2 1]); 
  a=v.fwiday.dsr.var(1).a;    a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); dsrday     =permute(a,[4 3 2 1]); 

  exd='/fwihw/'; cl=8; form='netcdf4'; nt=v.nday;
  fnout=strcat(tpath,expn,exd,expn,'_',yr,'.fwihw.nc');disp(fnout);
  nccreate(fnout,'time','Dimensions',{'time' Inf},'Format',form);
  nccreate(fnout,'lat', 'Dimensions',{'lat' nlat},'Format',form);
  nccreate(fnout,'lon', 'Dimensions',{'lon' nlon},'Format',form);
  nccreate(fnout,'prday',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'tasday',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'rhday',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'wsdday',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'tasmaxday',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'hwday1',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8',  'Format',form,'DeflateLevel',cl);
  nccreate(fnout,'hwtmx1',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'hwday2',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8',  'Format',form,'DeflateLevel',cl);
  nccreate(fnout,'hwtmx2',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'hwday3',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8',  'Format',form,'DeflateLevel',cl);
  nccreate(fnout,'hwtmx3',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

  nccreate(fnout,'ffmcday',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'dmcday',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'dcday',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'isiday',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'buiday',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'fwiday',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'dsrday',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

  ncwrite(fnout,'time', time(:));
  ncwrite(fnout,'lat',  lat);
  ncwrite(fnout,'lon',  lon);
  ncwrite(fnout,'prday',       prday      (:,:,:))
  ncwrite(fnout,'tasday',      tasday     (:,:,:))
  ncwrite(fnout,'rhday',       rhday      (:,:,:))
  ncwrite(fnout,'wsdday',      wsdday     (:,:,:))
  ncwrite(fnout,'tasmaxday',   tasmaxday  (:,:,:))
  ncwrite(fnout,'hwday1',      int8(hwday1(:,:,:)))
  ncwrite(fnout,'hwtmx1',      hwtmx1     (:,:,:))
  ncwrite(fnout,'hwday2',      int8(hwday2(:,:,:)))
  ncwrite(fnout,'hwtmx2',      hwtmx2     (:,:,:))
  ncwrite(fnout,'hwday3',      int8(hwday3(:,:,:)))
  ncwrite(fnout,'hwtmx3',      hwtmx3     (:,:,:))
  ncwrite(fnout,'ffmcday',     ffmcday    (:,:,:))
  ncwrite(fnout,'dmcday',      dmcday     (:,:,:))
  ncwrite(fnout,'dcday',       dcday      (:,:,:))
  ncwrite(fnout,'isiday',      isiday     (:,:,:))
  ncwrite(fnout,'buiday',      buiday     (:,:,:))
  ncwrite(fnout,'fwiday',      fwiday     (:,:,:))
  ncwrite(fnout,'dsrday',      dsrday     (:,:,:))
%  str=strcat('hours since+',yr,'-01-01 00:00:00'); str(str=='+')=' ';
%  str=strcat('days since 1950-01-01 00:00:00'); 
  str=strcat('days since 0001-01-01 00:00:00'); 
  ncwriteatt(fnout,'time','units',str);
  
  whos v
end


