%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fn='/archive/Ming.Zhao/awg/2023.04/c192_obs/c192_obs_1979_2020_daily_climo_obs_climo.mat';fn
%x=load(fn); era5=x.v.era5; mswep=x.v.mswep; clear x;
fn='/archive/Ming.Zhao/awg/2023.04/c192L33_am4p0_2010climo_newctl/c192L33_am4p0_2010climo_newctl_2_101_read_daily_obs_bias_only';fn
load(fn)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/';
pct=[90 95 99]; latlon=[0 360 -90 90]; yr1=2; yr2=101; opt=1;
expn='c192L33_am4p0_2010climo_newctl'; 
%expn='c192L33_am4p0_2010climo_newctl_p1K'; 
expn='c192L33_am4p0_2010climo_trend_1979_2020_spear';   
expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2';
%expn='c192L33_CM4X_amip_13'; opt=1; yr1=1950; yr2=2020;
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_30min'; opt=1; yr1=1951; yr2=2020;
%fn='_1979_2020_daily_climo_onlybias.mat';
%fn=strcat(tpath,expn,'/',expn,fn); load(fn); fn

atmos_data_dir='atmos_data';
fn=strcat(tpath,expn,'/atmos.static.nc'); disp(fn);
v=readts_grid_2d(tpath,expn,fn,latlon,'c192'); v.latlon=latlon;
v.tpath=tpath; v.expn=expn; v.yr1=yr1; v.yr2=yr2; v.nyr=yr2-yr1+1;

yea=[365]; ddd=cumsum(yea); d.beg_yea=[0 ddd(1:end-1)]+1; d.end_yea=ddd;
v.do_yea=1; v.d_beg=d.beg_yea; v.d_end=d.end_yea; v.yea=yea;

% precomputing tasmax threshhold for heatwave analysis
varn='tasmax'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %this is a smart reader script
thresh=[]; tasmax=extremes_ana(var,pct,thresh,1)

var=tasmax.var(1); dofy=var.dofy; mofy=var.mofy; year=var.year; time=var.time;
a=var.a-273.15; win=15; v.thresh=heatwave_threshold_grid(a,dofy,pct,win);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% do bias correction for tasmax based on ERA5 data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
do_bias_correction = true
if do_bias_correction
  var=tasmax.var(1); dofy=var.dofy; mofy=var.mofy; year=var.year; time=var.time;
  a=B.tas.bias_f30;  a=repmat(a,[v.nyr 1 1]); var.a=var.a-a;
  a=var.a-273.15; win=15; v.thresh_c=heatwave_threshold_grid(a,dofy,pct,win);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% end of do bias correction for tasmax based on ERA5 data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%save precomputed threshold values for heatwave analysis only
v.pct=pct; fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(tpath,expn,'/fwihw/',expn,fext,'.hw_thresh_orig_and_corr.mat')
save(fnmat,'v','-v7.3');

%save precomputed threshold values and original data
v.tasmax=tasmax; clear tasmax var;
fnmat=strcat(tpath,expn,'/fwihw/',expn,fext,'.hw_thresh_all.mat')
save(fnmat,'v','-v7.3'); v.tasmax=0; clear var;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The following script is used to generate annual fwihw file
%for a number of daily variables including heatwaves and FWI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/';
pct=[90 95 99]; latlon=[0 360 -90 90]; opt=1;
yr1=2; yr2=101; nyr=yr2-yr1+1;
expn='c192L33_am4p0_2010climo_newctl'; 
%expn='c192L33_am4p0_2010climo_newctl_p1K'; 
expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2';
%expn='c192L33_am4p0_2010climo_trend_1979_2020_spear';   

yr1=1950; yr2=2020; nyr=yr2-yr1+1;
expn='c192L33_CM4X_amip';
expn='c192L33_CM4X_amip_13';
expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_30min'; yr1=1951; yr2=2020; nyr=yr2-yr1+1;

atmos_data_dir='atmos_data';
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(tpath,expn,'/fwihw/',expn,fext,'.hw_thresh_orig_and_corr.mat')
load(fnmat); thresh=v.thresh; thresh_c=v.thresh_c;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The following is normally not needed but they are needed
% in case a run is broken due to whatever reason because
%ffmc, dmc and dc calculation require memory of previous state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
exd='/fwihw/'; yr='0027'; fn=strcat(tpath,expn,exd,expn,'_',yr,'.fwihw_ctlthresh.nc');disp(fn);
if (exist(fn,'file') == 2)
  a=ncread(fn,'ffmcday');   a=a(:,:,end); a=permute(a,[3 2 1]); ffmc=a;
  a=ncread(fn,'dmcday');    a=a(:,:,end); a=permute(a,[3 2 1]); dmc =a;
  a=ncread(fn,'dcday');     a=a(:,:,end); a=permute(a,[3 2 1]); dc  =a;
  init_fwiday=[ffmc; dmc; dc;];
  a=ncread(fn,'ffmcday_c'); a=a(:,:,end); a=permute(a,[3 2 1]); ffmc=a;
  a=ncread(fn,'dmcday_c');  a=a(:,:,end); a=permute(a,[3 2 1]); dmc =a;
  a=ncread(fn,'dcday_c');   a=a(:,:,end); a=permute(a,[3 2 1]); dc  =a;
  init_fwiday_c=[ffmc; dmc; dc;]; clear ffmc dmc dc;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
minlen=3; %used for heat wave analysis lenght of days tasmax exceeding
nlat=v.nlat; nlon=v.nlon; lat=v.lat; lon=v.lon; t=1;
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
    init_fwiday=[]; init_fwiday_c=[];
  end
  v=fwihw_ana(tpath,expn,yrt,yrt,pct,latlon,opt,init_fwiday,init_fwiday_c,true); v
  init_fwiday=v.init_fwiday;
  init_fwiday_c=v.init_fwiday_c;
% heatwave analysis using tasmax and precomputed thresh duration of minlen
  var=v.tasmaxday.var(1);
  a=var.a; dofy=var.dofy; mofy=var.mofy; year=var.year; time=var.time;
  i=2; th=squeeze(thresh  (:,i,:,:)); [hw2d1,hwg1,hwday1,hwtmx1]=detect_heatwaves_grid_new(a,th,minlen,year,mofy,dofy);
  var=v.tasmaxday_c.var(1);
  a=var.a; dofy=var.dofy; mofy=var.mofy; year=var.year; time=var.time;
  i=2; th=squeeze(thresh_c(:,i,:,:)); [hw2d2,hwg2,hwday2,hwtmx2]=detect_heatwaves_grid_new(a,th,minlen,year,mofy,dofy);
  i=3; th=squeeze(thresh_c(:,i,:,:)); [hw2d3,hwg3,hwday3,hwtmx3]=detect_heatwaves_grid_new(a,th,minlen,year,mofy,dofy);
  v.nt=length(hwday1(:,1,1)); v.nday=v.nt/v.nyr;
  a=reshape(hwday1,v.nyr,v.nday,v.nlat,v.nlon); hwday1=permute(a,[4 3 2 1]); 
  a=reshape(hwtmx1,v.nyr,v.nday,v.nlat,v.nlon); hwtmx1=permute(a,[4 3 2 1]); 
  a=reshape(hwday2,v.nyr,v.nday,v.nlat,v.nlon); hwday2=permute(a,[4 3 2 1]); 
  a=reshape(hwtmx2,v.nyr,v.nday,v.nlat,v.nlon); hwtmx2=permute(a,[4 3 2 1]); 
  a=reshape(hwday3,v.nyr,v.nday,v.nlat,v.nlon); hwday3=permute(a,[4 3 2 1]); 
  a=reshape(hwtmx3,v.nyr,v.nday,v.nlat,v.nlon); hwtmx3=permute(a,[4 3 2 1]); 

  a=reshape(time, v.nday,v.nyr); time=a;
  a=v.prday.var(1).a;         a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); prday      =permute(a,[4 3 2 1]); 
  a=v.prday_c.var(1).a;       a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); prday_c    =permute(a,[4 3 2 1]); 
  a=v.tasday.var(1).a;        a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); tasday     =permute(a,[4 3 2 1]); 
  a=v.tasday_c.var(1).a;      a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); tasday_c   =permute(a,[4 3 2 1]); 
  a=v.rhday.var(1).a;         a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); rhday      =permute(a,[4 3 2 1]); 
  a=v.rhday_c.var(1).a;       a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); rhday_c    =permute(a,[4 3 2 1]); 
  a=v.wsdday.var(1).a;        a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); wsdday     =permute(a,[4 3 2 1]); 
  a=v.wsdday_c.var(1).a;      a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); wsdday_c   =permute(a,[4 3 2 1]); 
  a=v.tasmaxday.var(1).a;     a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); tasmaxday  =permute(a,[4 3 2 1]); 
  a=v.tasmaxday_c.var(1).a;   a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); tasmaxday_c=permute(a,[4 3 2 1]); 
  a=v.wsdmaxday.var(1).a;     a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); wsdmaxday  =permute(a,[4 3 2 1]); 

  a=v.fwiday.ffmc.var(1).a;   a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); ffmcday    =permute(a,[4 3 2 1]); 
  a=v.fwiday.dmc.var(1).a;    a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); dmcday     =permute(a,[4 3 2 1]); 
  a=v.fwiday.dc.var(1).a;     a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); dcday      =permute(a,[4 3 2 1]); 
  a=v.fwiday.isi.var(1).a;    a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); isiday     =permute(a,[4 3 2 1]); 
  a=v.fwiday.bui.var(1).a;    a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); buiday     =permute(a,[4 3 2 1]); 
  a=v.fwiday.fwi.var(1).a;    a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); fwiday     =permute(a,[4 3 2 1]); 
  a=v.fwiday.dsr.var(1).a;    a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); dsrday     =permute(a,[4 3 2 1]); 

  a=v.fwiday_c.ffmc.var(1).a; a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); ffmcday_c  =permute(a,[4 3 2 1]); 
  a=v.fwiday_c.dmc.var(1).a;  a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); dmcday_c   =permute(a,[4 3 2 1]); 
  a=v.fwiday_c.dc.var(1).a;   a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); dcday_c    =permute(a,[4 3 2 1]); 
  a=v.fwiday_c.isi.var(1).a;  a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); isiday_c   =permute(a,[4 3 2 1]); 
  a=v.fwiday_c.bui.var(1).a;  a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); buiday_c   =permute(a,[4 3 2 1]); 
  a=v.fwiday_c.fwi.var(1).a;  a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); fwiday_c   =permute(a,[4 3 2 1]); 
  a=v.fwiday_c.dsr.var(1).a;  a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); dsrday_c   =permute(a,[4 3 2 1]); 
  
  exd='/fwihw/'; cl=8; form='netcdf4'; nt=v.nday;
  fnout=strcat(tpath,expn,exd,expn,'_',yr,'.fwihw_ctlthresh.nc');disp(fnout);
%  fnout=strcat(tpath,expn,exd,expn,'_',yr,'.fwihw.nc');disp(fnout);
  nccreate(fnout,'time','Dimensions',{'time' Inf},'Format',form);
  nccreate(fnout,'lat', 'Dimensions',{'lat' nlat},'Format',form);
  nccreate(fnout,'lon', 'Dimensions',{'lon' nlon},'Format',form);
  nccreate(fnout,'prday',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'prday_c',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'tasday',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'tasday_c',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'rhday',       'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'rhday_c',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'wsdday',      'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'wsdday_c',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'wsdmaxday',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'tasmaxday',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'tasmaxday_c', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
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
  nccreate(fnout,'ffmcday_c',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'dmcday_c',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'dcday_c',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'isiday_c',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'buiday_c',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'fwiday_c',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'dsrday_c',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

  ncwrite(fnout,'time', time(:));
  ncwrite(fnout,'lat',  lat);
  ncwrite(fnout,'lon',  lon);
  ncwrite(fnout,'prday',       prday      (:,:,:))
  ncwrite(fnout,'prday_c',     prday_c    (:,:,:))
  ncwrite(fnout,'tasday',      tasday     (:,:,:))
  ncwrite(fnout,'tasday_c',    tasday_c   (:,:,:))
  ncwrite(fnout,'rhday',       rhday      (:,:,:))
  ncwrite(fnout,'rhday_c',     rhday_c    (:,:,:))
  ncwrite(fnout,'wsdday',      wsdday     (:,:,:))
  ncwrite(fnout,'wsdday_c',    wsdday_c   (:,:,:))
  ncwrite(fnout,'wsdmaxday',   wsdmaxday  (:,:,:))
  ncwrite(fnout,'tasmaxday',   tasmaxday  (:,:,:))
  ncwrite(fnout,'tasmaxday_c', tasmaxday_c(:,:,:))
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
  ncwrite(fnout,'ffmcday_c',   ffmcday_c  (:,:,:))
  ncwrite(fnout,'dmcday_c',    dmcday_c   (:,:,:))
  ncwrite(fnout,'dcday_c',     dcday_c    (:,:,:))
  ncwrite(fnout,'isiday_c',    isiday_c   (:,:,:))
  ncwrite(fnout,'buiday_c',    buiday_c   (:,:,:))
  ncwrite(fnout,'fwiday_c',    fwiday_c   (:,:,:))
  ncwrite(fnout,'dsrday_c',    dsrday_c   (:,:,:))
%  str=strcat('hours since+',yr,'-01-01 00:00:00'); str(str=='+')=' ';
%  str=strcat('days since 1950-01-01 00:00:00'); 
  str=strcat('days since 0001-01-01 00:00:00'); 
  ncwriteatt(fnout,'time','units',str);
  
  whos v
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The following script is used to create a netcdf files
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/';
pct=[90 95 99]; latlon=[0 360 -90 90]; opt=1;
yr1=2; yr2=101; nyr=yr2-yr1+1;
expn='c192L33_am4p0_2010climo_newctl'; 
%expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2';
%expn='c192L33_am4p0_2010climo_trend_1979_2020_spear';   
%expn='c192L33_am4p0_2010climo_newctl_p1K'; 

%yr1=1950; yr2=2020; nyr=yr2-yr1+1;
%expn='c192L33_CM4X_amip_13';

atmos_data_dir='atmos_data';
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(tpath,expn,'/fwihw/',expn,fext,'.hw_thresh_all.mat')
load(fnmat); var=v.var; 

dofy=var.dofy; mofy=var.mofy; year=var.year; time=var.time; clear var;
v.thresh=heatwave_threshold_grid(v.tasmax,dofy,pct,win);
exd='/fwihw/'; cl=8; form='netcdf4'; nt=v.nday;
fnout=strcat(tpath,expn,exd,expn,'_',yr,'.fwihw_tasmax_percentile.nc');disp(fnout);
nccreate(fnout,'time','Dimensions',{'time' nt},'Format',form);
nccreate(fnout,'lat', 'Dimensions',{'lat' nlat},'Format',form);
nccreate(fnout,'lon', 'Dimensions',{'lon' nlon},'Format',form);
nccreate(fnout,'tasmax_p90', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tasmax_p95', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'tasmax_p99', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
ncwrite(fnout,'time', time(:));
ncwrite(fnout,'lat',  lat);
ncwrite(fnout,'lon',  lon);
ncwrite(fnout,'tasmax_p90',p90(:,:,:))
ncwrite(fnout,'tasmax_p95',p95(:,:,:))
ncwrite(fnout,'tasmax_p99',p99(:,:,:))
 
