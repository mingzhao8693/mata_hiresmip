tpath='/archive/Ming.Zhao/awg/2023.04/';
pct=[90 95]; latlon=[0 360 -90 90]; yr1=2; yr2=2; 
expn='c192L33_am4p0_2010climo_newctl'; opt=1;

v=fwihw_ana(tpath,expn,yr1,yr2,pct,latlon,opt);

var=v.tasmaxday.var(1);

a=var.a; dofy=var.dofy; mofy=var.mofy; year=var.year; time=var.time;

win=15; thresh=heatwave_threshold_grid(a,dofy,pct,win);
ipct=2; thresh=squeeze(thresh(:,2,:,:));

minlen=3; [hw2d,hwg,hwday]=detect_heatwaves_grid(a,thresh,minlen,year,mofy,dofy);

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

t=1; nt=v.nday; nlat=v.nlat; nlon=v.nlon; lat=v.lat; lon=v.lon;
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
  exd='/fwihw/'; cl=8; form='netcdf4';
  fnout=strcat(tpath,expn,exd,expn,'_',yr,'.fwihw.nc');disp(fnout);
  nccreate(fnout,'time','Dimensions',{'time' nt},'Format',form);
  nccreate(fnout,'lat', 'Dimensions',{'lat' nlat},'Format',form);
  nccreate(fnout,'lon', 'Dimensions',{'lon' nlon},'Format',form);
  nccreate(fnout,'prday',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'tasday',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'rhday',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'wsdday',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'wsdmaxday','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'tasmaxday','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'hwday',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','int8',  'Format',form,'DeflateLevel',cl);
  nccreate(fnout,'ffmcday',  'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'dmcday',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'dcday',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'isiday',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'buiday',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'fwiday',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
  nccreate(fnout,'dsrday',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);

  ncwrite(fnout,'time', time(:,t));
  ncwrite(fnout,'lat',  lat);
  ncwrite(fnout,'lon',  lon);
  ncwrite(fnout,'prday',    prday    (:,:,:,t))
  ncwrite(fnout,'tasday',   tasday   (:,:,:,t))
  ncwrite(fnout,'rhday',    rhday    (:,:,:,t))
  ncwrite(fnout,'wsdday',   wsdday   (:,:,:,t))
  ncwrite(fnout,'tasmaxday',tasmaxday(:,:,:,t))
  ncwrite(fnout,'hwday',   int8(hwday(:,:,:,t)))
  ncwrite(fnout,'ffmcday',  ffmcday  (:,:,:,t))
  ncwrite(fnout,'dmcday',   dmcday   (:,:,:,t))
  ncwrite(fnout,'dcday',    dcday    (:,:,:,t))
  ncwrite(fnout,'isiday',   isiday   (:,:,:,t))
  ncwrite(fnout,'buiday',   buiday   (:,:,:,t))
  ncwrite(fnout,'fwiday',   fwiday   (:,:,:,t))
  ncwrite(fnout,'dsrday',   dsrday   (:,:,:,t))
%  str=strcat('hours since+',yr,'-01-01 00:00:00'); str(str=='+')=' ';
  str=strcat('days since 0001-01-01 00:00:00'); 
  ncwriteatt(fnout,'time','units',str);
end
