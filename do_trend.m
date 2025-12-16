function v1=do_trend(v,yr1,yr2,opt)
s=v.s; v1.s=s; v1.time=v.time; v1.yr=[yr1:yr2]; v1.nyr=length(v1.yr);
i1=1; i2=v1.nyr; v1.expn=v.expn; %i1=31; i2=72; v1.yr=v1.yr(i1:i2); %1979:2020
if strcmp(opt,'mod')
  v1.ts_all =v.sfc.tsurf.all(i1:i2,:,:,:); 
  v1.ice_all=v.sfc.ice.all  (i1:i2,:,:,:);
  v1.pcp_all=v.sfc.pcp.all  (i1:i2,:,:,:);
else
  v1.ts_all  =v.sfc.ts_all  (i1:i2,:,:,:);
  v1.ice_all =v.sfc.ice_all (i1:i2,:,:,:);
  v1.pcp_all =v.sfc.pcp_all (i1:i2,:,:,:);
  v1.slp_all =v.sfc.slp_all (i1:i2,:,:,:);
  v1.z500_all=v.sfc.z500_all(i1:i2,:,:,:);
end
for t=1:v1.nyr-1 %year=194911-202012; 1949-2020
  a=v1.ts_all;  a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  v1.ts(t,:,:,:)=get7season(a,1);
  a=v1.ice_all; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  v1.ice(t,:,:,:)=get7season(a,1);
  a=v1.pcp_all; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  v1.pcp(t,:,:,:)=get7season(a,1);
  a=v1.slp_all; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  v1.slp(t,:,:,:)=get7season(a,1);
  a=v1.z500_all;a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  v1.z500(t,:,:,:)=get7season(a,1);
end
t=v1.nyr;
a=v1.ts_all;  a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
v1.ts(t,:,:,:)=get7season(a,1);
a=v1.ice_all; a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
v1.ice(t,:,:,:)=get7season(a,1);
a=v1.pcp_all; a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
v1.pcp(t,:,:,:)=get7season(a,1);
a=v1.slp_all; a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
v1.slp(t,:,:,:)=get7season(a,1);
a=v1.z500_all;a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
v1.z500(t,:,:,:)=get7season(a,1);

% $$$ v1.nseason=length(v1.ts(1,:,1,1)); v1.season=[1:v1.nseason];
% $$$ v1.lat=s.lat; v1.nlat=length(v1.lat);
% $$$ v1.lon=s.lon; v1.nlon=length(v1.lon);
% $$$ v=v1; 
% $$$ sname='NWR'; [v.nwr v.id_nwr]=get_var_state(v,sname,v.pcp);
% $$$ sname='WWR'; [v.wwr v.id_wwr]=get_var_state(v,sname,v.pcp);
% $$$ sname='SWR'; [v.swr v.id_swr]=get_var_state(v,sname,v.pcp);
% $$$ sname='SSR'; [v.ssr v.id_ssr]=get_var_state(v,sname,v.pcp);
% $$$ sname='NRP'; [v.nrp v.id_nrp]=get_var_state(v,sname,v.pcp);
% $$$ sname='SER'; [v.ser v.id_ser]=get_var_state(v,sname,v.pcp);
% $$$ sname='OVR'; [v.ovr v.id_ovr]=get_var_state(v,sname,v.pcp);
% $$$ sname='UMW'; [v.umw v.id_umw]=get_var_state(v,sname,v.pcp);
% $$$ sname='NER'; [v.ner v.id_ner]=get_var_state(v,sname,v.pcp);
% $$$ sname='Canada'; [v.can v.id_can]=get_var_state(v,sname,v.pcp);
% $$$ sname='Mexico'; [v.mex v.id_mex]=get_var_state(v,sname,v.pcp);
% $$$ figure; lon=s.lon; lat=s.lat; a=s.lm0; b=0.5
% $$$ i=v.id_nwr==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
% $$$ i=v.id_wwr==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
% $$$ i=v.id_swr==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
% $$$ i=v.id_ssr==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
% $$$ i=v.id_nrp==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
% $$$ i=v.id_ser==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
% $$$ i=v.id_ovr==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
% $$$ i=v.id_umw==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
% $$$ i=v.id_ner==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
% $$$ i=v.id_can==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'b'); hold on;
% $$$ i=v.id_mex==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'b'); hold on;
% $$$ contour(lon,lat,s.lm0,[0 b],'k'); shading flat; axis([220 300 20 60]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Global SST trend analysis%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%note Y/xt/x in Theil_Sen_Regress in get_trend_TSR must be column vector
%otherwise it returns NaN, this is why Y cannot be [1950:2019];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha=0.1; Y=v1.yr'; v1.ts_all=0; v1.ice_all=0; v1.pcp_all=0;
y1=1950; y2=2020; 
if y1>=yr1 & y2<=yr2
  v1.trend_1950_2020=get_trend_one(v1,y1,y2,Y,alpha);
end
y1=1979; y2=2020; 
if y1>=yr1 & y2<=yr2
  v1.trend_1979_2020=get_trend_one(v1,y1,y2,Y,alpha);
end
y1=1950; y2=2014; 
if y1>=yr1 & y2<=yr2
  v1.trend_1950_2014=get_trend_one(v1,y1,y2,Y,alpha);
end
y1=1979; y2=2014; 
if y1>=yr1 & y2<=yr2
  v1.trend_1979_2014=get_trend_one(v1,y1,y2,Y,alpha);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v1.nseason=length(v1.ts(1,:,1,1)); v1.season=[1:v1.nseason];
v1.lat=s.lat; v1.nlat=length(v1.lat);
v1.lon=s.lon; v1.nlon=length(v1.lon);
v=v1; 
%NorthWest: Washington, Oregon, Idaho
sname='NWR';            [v.nwr v.id_nwr]=get_var_state(v,sname,v.pcp);
sname='Washington';     [v.wa  v.id_wa] =get_var_state(v,sname,v.pcp);
sname='Oregon';         [v.or  v.id_or] =get_var_state(v,sname,v.pcp);
sname='Idaho';          [v.id  v.id_id] =get_var_state(v,sname,v.pcp);
%West: California, Nevada
sname='WWR';            [v.wwr v.id_wwr]=get_var_state(v,sname,v.pcp);
sname='California';     [v.ca  v.id_ca] =get_var_state(v,sname,v.pcp);
sname='Nevada';         [v.nv  v.id_nv] =get_var_state(v,sname,v.pcp);
%Southwest: Arizona, Colorado, New Mexcio, Utah
sname='SWR';            [v.swr v.id_swr]=get_var_state(v,sname,v.pcp);
sname='Arizona';        [v.az  v.id_az] =get_var_state(v,sname,v.pcp);
sname='Colorado';       [v.co  v.id_co] =get_var_state(v,sname,v.pcp);
sname='New Mexico';     [v.nm  v.id_nm] =get_var_state(v,sname,v.pcp);
sname='Utah';           [v.ut  v.id_ut] =get_var_state(v,sname,v.pcp);
%South: Arkansas, Kansas, Louisianna, Mississippi, Oklahoma, Texas
sname='SSR';            [v.ssr v.id_ssr]=get_var_state(v,sname,v.pcp);
sname='Arkansas';       [v.ar  v.id_ar] =get_var_state(v,sname,v.pcp);
sname='Kansas';         [v.ks  v.id_ks] =get_var_state(v,sname,v.pcp);
sname='Louisiana';      [v.la  v.id_la] =get_var_state(v,sname,v.pcp);
sname='Mississippi';    [v.ms  v.id_ms] =get_var_state(v,sname,v.pcp);
sname='Oklahoma';       [v.ok  v.id_ok] =get_var_state(v,sname,v.pcp);
sname='Texas';          [v.tx  v.id_tx] =get_var_state(v,sname,v.pcp);
%Northern Rockies and Plains: Montana, Nebraska, North/South Dakota, Wyoming
sname='NRP';            [v.nrp v.id_nrp]=get_var_state(v,sname,v.pcp);
sname='Montana';        [v.mt  v.id_mt] =get_var_state(v,sname,v.pcp);
sname='Nebraska';       [v.ne  v.id_ne] =get_var_state(v,sname,v.pcp);
sname='North Dakota';   [v.nd  v.id_nd] =get_var_state(v,sname,v.pcp);
sname='South Dakota';   [v.sd  v.id_sd] =get_var_state(v,sname,v.pcp);
sname='Wyoming';        [v.wy  v.id_wy] =get_var_state(v,sname,v.pcp);
%Southest: Alabama, Floria, Georgia, North Carolina, South Carolina, Virginia
sname='SER';            [v.ser v.id_ser]=get_var_state(v,sname,v.pcp);
sname='Alabama';        [v.al  v.id_al] =get_var_state(v,sname,v.pcp);
sname='Florida';        [v.fl  v.id_fl] =get_var_state(v,sname,v.pcp);
sname='Georgia';        [v.ga  v.id_ga] =get_var_state(v,sname,v.pcp);
sname='North Carolina'; [v.nc  v.id_nc] =get_var_state(v,sname,v.pcp);
sname='South Carolina'; [v.sc  v.id_sc] =get_var_state(v,sname,v.pcp);
sname='Virginia';       [v.va  v.id_va] =get_var_state(v,sname,v.pcp);
%Ohio Valley:
sname='OVR';            [v.ovr v.id_ovr]=get_var_state(v,sname,v.pcp);
sname='Illinois';       [v.il  v.id_il] =get_var_state(v,sname,v.pcp);
sname='Indiana';        [v.in  v.id_in] =get_var_state(v,sname,v.pcp);
sname='Kentucky';       [v.ky  v.id_ky] =get_var_state(v,sname,v.pcp);
sname='Missouri';       [v.mo  v.id_mo] =get_var_state(v,sname,v.pcp);
sname='Ohio';           [v.oh  v.id_oh] =get_var_state(v,sname,v.pcp);
sname='Tennessee';      [v.tn  v.id_tn] =get_var_state(v,sname,v.pcp);
sname='West Virginia';  [v.wv  v.id_wv] =get_var_state(v,sname,v.pcp);
%Upper Midwest:
sname='UMW';            [v.umw v.id_umw]=get_var_state(v,sname,v.pcp);
sname='Iowa';           [v.ia  v.id_ia] =get_var_state(v,sname,v.pcp);
sname='Michigan';       [v.mi  v.id_mi] =get_var_state(v,sname,v.pcp);
sname='Minnesota';      [v.mn  v.id_mn] =get_var_state(v,sname,v.pcp);
sname='Wisconsin';      [v.wi  v.id_wi] =get_var_state(v,sname,v.pcp);
%Northeast:
sname='NER';            [v.ner v.id_ner]=get_var_state(v,sname,v.pcp);
sname='Connecticut';    [v.ct  v.id_ct] =get_var_state(v,sname,v.pcp);
sname='Delaware';       [v.de  v.id_de] =get_var_state(v,sname,v.pcp);
sname='Maine';          [v.me  v.id_me] =get_var_state(v,sname,v.pcp);
sname='Maryland';       [v.md  v.id_md] =get_var_state(v,sname,v.pcp);
sname='Massachusetts';  [v.ma  v.id_ma] =get_var_state(v,sname,v.pcp);
sname='New Hampshire';  [v.nh  v.id_nh] =get_var_state(v,sname,v.pcp);
sname='New Jersey';     [v.nj  v.id_nj] =get_var_state(v,sname,v.pcp);
sname='New York';       [v.ny  v.id_ny] =get_var_state(v,sname,v.pcp);
sname='Pennsylvania';   [v.pa  v.id_pa] =get_var_state(v,sname,v.pcp);
sname='Rhode Island';   [v.ri  v.id_ri] =get_var_state(v,sname,v.pcp);
sname='Vermont';        [v.vt  v.id_vt] =get_var_state(v,sname,v.pcp);

sname='Alaska';         [v.ak  v.id_ak] =get_var_state(v,sname,v.pcp);
sname='Hawaii';         [v.hi  v.id_hi] =get_var_state(v,sname,v.pcp);
sname='Canada';         [v.can v.id_can]=get_var_state(v,sname,v.pcp);
sname='Mexico';         [v.mex v.id_mex]=get_var_state(v,sname,v.pcp);

figure; lon=s.lon; lat=s.lat; a=s.lm0; b=0.5;
i=v.id_nwr==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
i=v.id_wwr==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
i=v.id_swr==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
i=v.id_ssr==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
i=v.id_nrp==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
i=v.id_ser==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
i=v.id_ovr==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
i=v.id_umw==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
i=v.id_ner==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'r'); hold on;
i=v.id_can==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'b'); hold on;
i=v.id_mex==1; a(i)=1; a(~i)=0; contour(lon,lat,a,[0 b],'b'); hold on;
contour(lon,lat,s.lm0,[0 b],'k'); shading flat; axis([220 300 20 60]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
epath='/work/miz/mat_pcp/'; 
fnmat=strcat(epath,v.expn,'_do_trend.mat'); disp(fnmat); %save(fnmat,'v'); 
save(fnmat,'v','-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%below create trend netcdf file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
exd='./'; form='netcdf4_classic'; form='classic'; 
fnout=strcat(epath,v.expn,'_do_trend.nc');disp(fnout);
if exist(fnout); delete(fnout); end
nccreate(fnout,'time',   'Dimensions',{'time' Inf},'Datatype','double','Format',form);
nccreate(fnout,'season', 'Dimensions',{'season' v.nseason},'Datatype','single','Format',form);
nccreate(fnout,'lat', 'Dimensions',{'lat' v.nlat},'Datatype','single','Format',form);
nccreate(fnout,'lon', 'Dimensions',{'lon' v.nlon},'Datatype','single','Format',form);
nccreate(fnout,'sst', 'Dimensions',{'lon' v.nlon 'lat' v.nlat 'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'pcp', 'Dimensions',{'lon' v.nlon 'lat' v.nlat 'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'slp', 'Dimensions',{'lon' v.nlon 'lat' v.nlat 'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'z500','Dimensions',{'lon' v.nlon 'lat' v.nlat 'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'ice', 'Dimensions',{'lon' v.nlon 'lat' v.nlat 'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);

nccreate(fnout,'NWR', 'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'WA',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'OR',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'ID',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);

nccreate(fnout,'WWR', 'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'CA',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'NV',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);

nccreate(fnout,'SWR', 'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'AZ',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'CO',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'NM',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'UT',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);

nccreate(fnout,'SSR', 'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'AR',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'KS',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'LA',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'MS',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'OK',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'TX',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);

nccreate(fnout,'NRP', 'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'MT',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'NE',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'ND',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'SD',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'WY',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);

nccreate(fnout,'SER', 'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'AL',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'FL',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'GA',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'NC',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'SC',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'VA',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);

nccreate(fnout,'OVR', 'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'IL',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'IN',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'KY',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'MO',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'OH',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'TN',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'WV',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);

nccreate(fnout,'UMW', 'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'IA',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'MI',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'MN',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'WI',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);

nccreate(fnout,'NER', 'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'CT',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'DE',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'ME',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'MD',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'MA',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'NH',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'NJ',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'NY',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'PA',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'RI',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'VT',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);

nccreate(fnout,'AK',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'HI',  'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'CAN', 'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);
nccreate(fnout,'MEX', 'Dimensions',{'season' v.nseason 'time' v.nyr},'Datatype','double','Format',form);

nccreate(fnout,'NWR0','Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'WA0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'OR0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'ID0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);

nccreate(fnout,'WWR0','Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'CA0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'NV0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);

nccreate(fnout,'SWR0','Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'AZ0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'CO0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'NM0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'UT0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);

nccreate(fnout,'SSR0','Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'AR0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'KS0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'LA0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'MS0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'OK0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'TX0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);

nccreate(fnout,'NRP0','Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'MT0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'NE0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'ND0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'SD0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'WY0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);

nccreate(fnout,'SER0','Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'AL0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'FL0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'GA0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'NC0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'SC0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'VA0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);

nccreate(fnout,'OVR0','Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'IL0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'IN0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'KY0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'MO0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'OH0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'TN0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'WV0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);

nccreate(fnout,'UMW0','Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'IA0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'MI0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'MN0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'WI0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);

nccreate(fnout,'NER0','Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'CT0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'DE0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'ME0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'MD0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'MA0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'NH0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'NJ0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'NY0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'PA0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'RI0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'VT0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);

nccreate(fnout,'AK0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'HI0', 'Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'CAN0','Dimensions',{'season' v.nseason},'Datatype','double','Format',form);
nccreate(fnout,'MEX0','Dimensions',{'season' v.nseason},'Datatype','double','Format',form);

ncwrite(fnout,'time',   v.yr);
ncwrite(fnout,'season', v.season);
ncwrite(fnout,'lat',    v.lat);
ncwrite(fnout,'lon',    v.lon);
a=v.ts;  a=permute(a,[4 3 2 1]); ncwrite(fnout,'sst', a);ncwriteatt(fnout,'sst','units','degK');
a=v.pcp; a=permute(a,[4 3 2 1]); ncwrite(fnout,'pcp', a);
a=v.slp; a=permute(a,[4 3 2 1]); ncwrite(fnout,'slp', a);
a=v.z500;a=permute(a,[4 3 2 1]); ncwrite(fnout,'z500',a);
a=v.ice; a=permute(a,[4 3 2 1]); ncwrite(fnout,'ice', a);

a=v.nwr; a=permute(a,[2 1]);     ncwrite(fnout,'NWR', a); ncwrite(fnout,'NWR0',mean(a,2));
a=v.wa;  a=permute(a,[2 1]);     ncwrite(fnout,'WA',  a); ncwrite(fnout,'WA0',mean(a,2));
a=v.or;  a=permute(a,[2 1]);     ncwrite(fnout,'OR',  a); ncwrite(fnout,'OR0',mean(a,2));
a=v.id;  a=permute(a,[2 1]);     ncwrite(fnout,'ID',  a); ncwrite(fnout,'ID0',mean(a,2));

a=v.wwr; a=permute(a,[2 1]);     ncwrite(fnout,'WWR', a); ncwrite(fnout,'WWR0',mean(a,2));
a=v.ca;  a=permute(a,[2 1]);     ncwrite(fnout,'CA',  a); ncwrite(fnout,'CA0',mean(a,2));
a=v.nv;  a=permute(a,[2 1]);     ncwrite(fnout,'NV',  a); ncwrite(fnout,'NV0',mean(a,2));

a=v.swr; a=permute(a,[2 1]);     ncwrite(fnout,'SWR', a); ncwrite(fnout,'SWR0',mean(a,2));
a=v.az;  a=permute(a,[2 1]);     ncwrite(fnout,'AZ',  a); ncwrite(fnout,'AZ0',mean(a,2));
a=v.co;  a=permute(a,[2 1]);     ncwrite(fnout,'CO',  a); ncwrite(fnout,'CO0',mean(a,2));
a=v.nm;  a=permute(a,[2 1]);     ncwrite(fnout,'NM',  a); ncwrite(fnout,'NM0',mean(a,2));
a=v.ut;  a=permute(a,[2 1]);     ncwrite(fnout,'UT',  a); ncwrite(fnout,'UT0',mean(a,2));

a=v.ssr; a=permute(a,[2 1]);     ncwrite(fnout,'SSR', a); ncwrite(fnout,'SSR0',mean(a,2));
a=v.ar;  a=permute(a,[2 1]);     ncwrite(fnout,'AR',  a); ncwrite(fnout,'AR0',mean(a,2));
a=v.ks;  a=permute(a,[2 1]);     ncwrite(fnout,'KS',  a); ncwrite(fnout,'KS0',mean(a,2));
a=v.la;  a=permute(a,[2 1]);     ncwrite(fnout,'LA',  a); ncwrite(fnout,'LA0',mean(a,2));
a=v.ms;  a=permute(a,[2 1]);     ncwrite(fnout,'MS',  a); ncwrite(fnout,'MS0',mean(a,2));
a=v.ok;  a=permute(a,[2 1]);     ncwrite(fnout,'OK',  a); ncwrite(fnout,'OK0',mean(a,2));
a=v.tx;  a=permute(a,[2 1]);     ncwrite(fnout,'TX',  a); ncwrite(fnout,'TX0',mean(a,2));

a=v.nrp; a=permute(a,[2 1]);     ncwrite(fnout,'NRP', a); ncwrite(fnout,'NRP0',mean(a,2));
a=v.mt;  a=permute(a,[2 1]);     ncwrite(fnout,'MT',  a); ncwrite(fnout,'MT0',mean(a,2));
a=v.ne;  a=permute(a,[2 1]);     ncwrite(fnout,'NE',  a); ncwrite(fnout,'NE0',mean(a,2));
a=v.nd;  a=permute(a,[2 1]);     ncwrite(fnout,'ND',  a); ncwrite(fnout,'ND0',mean(a,2));
a=v.sd;  a=permute(a,[2 1]);     ncwrite(fnout,'SD',  a); ncwrite(fnout,'SD0',mean(a,2));
a=v.wy;  a=permute(a,[2 1]);     ncwrite(fnout,'WY',  a); ncwrite(fnout,'WY0',mean(a,2));

a=v.ser; a=permute(a,[2 1]);     ncwrite(fnout,'SER', a); ncwrite(fnout,'SER0',mean(a,2));
a=v.al;  a=permute(a,[2 1]);     ncwrite(fnout,'AL',  a); ncwrite(fnout,'AL0',mean(a,2));
a=v.fl;  a=permute(a,[2 1]);     ncwrite(fnout,'FL',  a); ncwrite(fnout,'FL0',mean(a,2));
a=v.ga;  a=permute(a,[2 1]);     ncwrite(fnout,'GA',  a); ncwrite(fnout,'GA0',mean(a,2));
a=v.nc;  a=permute(a,[2 1]);     ncwrite(fnout,'NC',  a); ncwrite(fnout,'NC0',mean(a,2));
a=v.sc;  a=permute(a,[2 1]);     ncwrite(fnout,'SC',  a); ncwrite(fnout,'SC0',mean(a,2));
a=v.va;  a=permute(a,[2 1]);     ncwrite(fnout,'VA',  a); ncwrite(fnout,'VA0',mean(a,2));

a=v.ovr; a=permute(a,[2 1]);     ncwrite(fnout,'OVR', a); ncwrite(fnout,'OVR0',mean(a,2));
a=v.il;  a=permute(a,[2 1]);     ncwrite(fnout,'IL',  a); ncwrite(fnout,'IL0',mean(a,2));
a=v.in;  a=permute(a,[2 1]);     ncwrite(fnout,'IN',  a); ncwrite(fnout,'IN0',mean(a,2));
a=v.ky;  a=permute(a,[2 1]);     ncwrite(fnout,'KY',  a); ncwrite(fnout,'KY0',mean(a,2));
a=v.mo;  a=permute(a,[2 1]);     ncwrite(fnout,'MO',  a); ncwrite(fnout,'MO0',mean(a,2));
a=v.oh;  a=permute(a,[2 1]);     ncwrite(fnout,'OH',  a); ncwrite(fnout,'OH0',mean(a,2));
a=v.tn;  a=permute(a,[2 1]);     ncwrite(fnout,'TN',  a); ncwrite(fnout,'TN0',mean(a,2));
a=v.wv;  a=permute(a,[2 1]);     ncwrite(fnout,'WV',  a); ncwrite(fnout,'WV0',mean(a,2));

a=v.umw; a=permute(a,[2 1]);     ncwrite(fnout,'UMW', a); ncwrite(fnout,'UMW0',mean(a,2));
a=v.ia;  a=permute(a,[2 1]);     ncwrite(fnout,'IA',  a); ncwrite(fnout,'IA0',mean(a,2));
a=v.mi;  a=permute(a,[2 1]);     ncwrite(fnout,'MI',  a); ncwrite(fnout,'MI0',mean(a,2));
a=v.mn;  a=permute(a,[2 1]);     ncwrite(fnout,'MN',  a); ncwrite(fnout,'MN0',mean(a,2));
a=v.wi;  a=permute(a,[2 1]);     ncwrite(fnout,'WI',  a); ncwrite(fnout,'WI0',mean(a,2));

a=v.ner; a=permute(a,[2 1]);     ncwrite(fnout,'NER', a); ncwrite(fnout,'NER0',mean(a,2));
a=v.ct;  a=permute(a,[2 1]);     ncwrite(fnout,'CT',  a); ncwrite(fnout,'CT0',mean(a,2));
a=v.de;  a=permute(a,[2 1]);     ncwrite(fnout,'DE',  a); ncwrite(fnout,'DE0',mean(a,2));
a=v.me;  a=permute(a,[2 1]);     ncwrite(fnout,'ME',  a); ncwrite(fnout,'ME0',mean(a,2));
a=v.md;  a=permute(a,[2 1]);     ncwrite(fnout,'MD',  a); ncwrite(fnout,'MD0',mean(a,2));
a=v.ma;  a=permute(a,[2 1]);     ncwrite(fnout,'MA',  a); ncwrite(fnout,'MA0',mean(a,2));
a=v.nh;  a=permute(a,[2 1]);     ncwrite(fnout,'NH',  a); ncwrite(fnout,'NH0',mean(a,2));
a=v.nj;  a=permute(a,[2 1]);     ncwrite(fnout,'NJ',  a); ncwrite(fnout,'NJ0',mean(a,2));
a=v.ny;  a=permute(a,[2 1]);     ncwrite(fnout,'NY',  a); ncwrite(fnout,'NY0',mean(a,2));
a=v.pa;  a=permute(a,[2 1]);     ncwrite(fnout,'PA',  a); ncwrite(fnout,'PA0',mean(a,2));
a=v.ri;  a=permute(a,[2 1]);     ncwrite(fnout,'RI',  a); ncwrite(fnout,'RI0',mean(a,2));
a=v.vt;  a=permute(a,[2 1]);     ncwrite(fnout,'VT',  a); ncwrite(fnout,'VT0',mean(a,2));

a=v.ak;  a=permute(a,[2 1]);     ncwrite(fnout,'AK',  a); ncwrite(fnout,'AK0',mean(a,2));
a=v.hi;  a=permute(a,[2 1]);     ncwrite(fnout,'HI',  a); ncwrite(fnout,'HI0',mean(a,2));
a=v.can; a=permute(a,[2 1]);     ncwrite(fnout,'CAN', a); ncwrite(fnout,'CAN0',mean(a,2));
a=v.mex; a=permute(a,[2 1]);     ncwrite(fnout,'MEX', a); ncwrite(fnout,'MEX0',mean(a,2));

return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%figure; pcolor(v.trend); shading flat; colorbar; caxis([-0.3 0.3]); colormap(jet)
s=v1.s; lon=s.lon; lat=s.lat; lm=s.lm0; cmin=-0.5; cmax=0.5; 
xmin=0; xmax=360; ymin=-90; ymax=90; nn=256;
pms=[ 0, 0, 1200, 600]; row=2; col=2;
handle=figure('Position',pms,'visible','on');
subplot(row,col,1); v=v1.sst_1979_2020_ann;
id=~v.signif|(lm>0.5|v.ice_clim>0.01); a=v.trend; a(id)=0;
pcolor(lon,lat,a); shading flat; colorbar; hold on;
contour(lon,lat,lm,[0 0.5],'k');
a=[190 -5 50 10]; rectangle('Position',a); %latlon=[190 240 -5 5]; NINO3.4
%[latx,lonx]=borders('United States','k'); hold on; plot((lonx+360),latx,'k');
%[latx,lonx]=borders('Canada','k'); hold on; plot((lonx+360)',latx','k');
%[latx,lonx]=borders('Mexico','k'); hold on; plot((lonx+360)',latx','k');
axis([xmin xmax ymin ymax]); caxis([cmin cmax]); 
cmap=bluewhitered(nn); colormap(cmap); title('1979-2020 SST trend');
subplot(row,col,2); v=v1.pcp_1979_2020_ann; cmin=-0.5; cmax=0.5; 
id=~v.signif; a=v.trend; a(id)=0;
pcolor(lon,lat,a); shading flat; colorbar; hold on;
contour(lon,lat,lm,[0 0.5],'k');
axis([xmin xmax ymin ymax]); caxis([cmin cmax]);
cmap=bluewhitered(nn); colormap(cmap); title('1979-2020 precipitation trend');

subplot(row,col,3); v=sst_1950_2014;
id=~v.signif|(lm>0.5); a=v.trend; a(id)=0;
pcolor(lon,lat,a); shading flat; colorbar; hold on;
contour(lon,lat,lm,[0 0.5],'k');
axis([xmin xmax ymin ymax]); caxis([cmin cmax]);
cmap=bluewhitered(nn); colormap(cmap); title('1950-2014 SST trend');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
