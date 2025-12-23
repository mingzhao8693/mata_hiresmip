tpath='/archive/Ming.Zhao/awg/2023.04/';
pct=[90 95]; latlon=[0 360 -90 90]; yr1=2; yr2=101; 
expn='c192L33_am4p0_2010climo_newctl'; opt=1;

expn='c192L33_CM4X_amip'; opt=1; yr1=1950; yr2=2020;

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
for k=1:length(var); var(k).a=var(k).a-273.15; end; %unit:C

var=var(1); tasmax=var.a; win=15; %window of days for computing percentile
dofy=var.dofy; mofy=var.mofy; year=var.year; time=var.time;
thresh=heatwave_threshold_grid(tasmax,dofy,pct,win);
ipct=2; thresh=squeeze(thresh(:,2,:,:));

%save precomputed threshold values for heatwave analysis
v.thresh=thresh; %v.tasmax=tasmax; %save thresh and orignal tasmax
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(tpath,expn,'/fwihw/',expn,fext,'.hw_thresh_only.mat')
save(fnmat,'v','-v7.3'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

minlen=3; t=1; %used for heat wave analysis lenght of days tasmax exceeding
nlat=v.nlat; nlon=v.nlon; lat=v.lat; lon=v.lon;
for t=1:v.nyr
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
  
  yr1=yrt; yr2=yrt;
  v=fwihw_ana(tpath,expn,yr1,yr2,pct,latlon,opt);
% heatwave analysis using tasmax and precomputed thresh duration of minlen
  var=v.tasmaxday.var(1);
  a=var.a; dofy=var.dofy; mofy=var.mofy; year(:)=var.year; time=var.time;
  [hw2d,hwg,hwday]=detect_heatwaves_grid(a,thresh,minlen,year,mofy,dofy);
  v.nt=length(hwday(:,1,1)); v.nday=v.nt/v.nyr;
  a=reshape(hwday,v.nyr,v.nday,v.nlat,v.nlon); hwday=permute(a,[4 3 2 1]); 
  a=reshape(time, v.nday,v.nyr); time=a;
  
  a=v.prday.var(1).a;      a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); prday    =permute(a,[4 3 2 1]); 
  a=v.tasday.var(1).a;     a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); tasday   =permute(a,[4 3 2 1]); 
  a=v.rhday.var(1).a;      a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); rhday    =permute(a,[4 3 2 1]); 
  a=v.wsdday.var(1).a;     a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); wsdday   =permute(a,[4 3 2 1]); 
  a=v.tasmaxday.var(1).a;  a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); tasmaxday=permute(a,[4 3 2 1]); 
  a=v.wsdmaxday.var(1).a;  a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); wsdmaxday=permute(a,[4 3 2 1]); 
  a=v.fwiday.ffmc.var(1).a;a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); ffmcday  =permute(a,[4 3 2 1]); 
  a=v.fwiday.dmc.var(1).a; a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); dmcday   =permute(a,[4 3 2 1]); 
  a=v.fwiday.dc.var(1).a;  a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); dcday    =permute(a,[4 3 2 1]); 
  a=v.fwiday.isi.var(1).a; a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); isiday   =permute(a,[4 3 2 1]); 
  a=v.fwiday.bui.var(1).a; a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); buiday   =permute(a,[4 3 2 1]); 
  a=v.fwiday.fwi.var(1).a; a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); fwiday   =permute(a,[4 3 2 1]); 
  a=v.fwiday.dsr.var(1).a; a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); dsrday   =permute(a,[4 3 2 1]); 

  a=v.fwidaymax.ffmc.var(1).a;a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); ffmcdaymax  =permute(a,[4 3 2 1]); 
  a=v.fwidaymax.dmc.var(1).a; a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); dmcdaymax   =permute(a,[4 3 2 1]); 
  a=v.fwidaymax.dc.var(1).a;  a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); dcdaymax    =permute(a,[4 3 2 1]); 
  a=v.fwidaymax.isi.var(1).a; a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); isidaymax   =permute(a,[4 3 2 1]); 
  a=v.fwidaymax.bui.var(1).a; a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); buidaymax   =permute(a,[4 3 2 1]); 
  a=v.fwidaymax.fwi.var(1).a; a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); fwidaymax   =permute(a,[4 3 2 1]); 
  a=v.fwidaymax.dsr.var(1).a; a=reshape(a,v.nyr,v.nday,v.nlat,v.nlon); dsrdaymax   =permute(a,[4 3 2 1]); 

  
  exd='/fwihw/'; cl=8; form='netcdf4'; nt=v.nday;
  fnout=strcat(tpath,expn,exd,expn,'_',yr,'.fwihw.nc');disp(fnout);
  nccreate(fnout,'time','Dimensions',{'time' nt},'Format',form);
  nccreate(fnout,'lat', 'Dimensions',{'lat' nlat},'Format',form);
  nccreate(fnout,'lon', 'Dimensions',{'lon' nlon},'Format',form);
  nccreate(fnout,'prday',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'tasday',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'rhday',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'wsdday',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'wsdmaxday', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'tasmaxday', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'hwday',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8',  'Format',form,'DeflateLevel',cl);
  nccreate(fnout,'ffmcday',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'dmcday',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'dcday',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'isiday',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'buiday',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'fwiday',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'dsrday',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'ffmcdaymax','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'dmcdaymax', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'dcdaymax',  'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'isidaymax', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'buidaymax', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'fwidaymax', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'dsrdaymax', 'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

  ncwrite(fnout,'time', time(:));
  ncwrite(fnout,'lat',  lat);
  ncwrite(fnout,'lon',  lon);
  ncwrite(fnout,'prday',     prday     (:,:,:))
  ncwrite(fnout,'tasday',    tasday    (:,:,:))
  ncwrite(fnout,'rhday',     rhday     (:,:,:))
  ncwrite(fnout,'wsdday',    wsdday    (:,:,:))
  ncwrite(fnout,'wsdmaxday', wsdmaxday (:,:,:))
  ncwrite(fnout,'tasmaxday', tasmaxday (:,:,:))
  ncwrite(fnout,'hwday',    int8(hwday (:,:,:)))
  ncwrite(fnout,'ffmcday',   ffmcday   (:,:,:))
  ncwrite(fnout,'dmcday',    dmcday    (:,:,:))
  ncwrite(fnout,'dcday',     dcday     (:,:,:))
  ncwrite(fnout,'isiday',    isiday    (:,:,:))
  ncwrite(fnout,'buiday',    buiday    (:,:,:))
  ncwrite(fnout,'fwiday',    fwiday    (:,:,:))
  ncwrite(fnout,'dsrday',    dsrday    (:,:,:))
  ncwrite(fnout,'ffmcdaymax',ffmcdaymax(:,:,:))
  ncwrite(fnout,'dmcdaymax', dmcdaymax (:,:,:))
  ncwrite(fnout,'dcdaymax',  dcdaymax  (:,:,:))
  ncwrite(fnout,'isidaymax', isidaymax (:,:,:))
  ncwrite(fnout,'buidaymax', buidaymax (:,:,:))
  ncwrite(fnout,'fwidaymax', fwidaymax (:,:,:))
  ncwrite(fnout,'dsrdaymax', dsrdaymax (:,:,:))
%  str=strcat('hours since+',yr,'-01-01 00:00:00'); str(str=='+')=' ';
  str=strcat('days since 0001-01-01 00:00:00'); 
  ncwriteatt(fnout,'time','units',str);
end
