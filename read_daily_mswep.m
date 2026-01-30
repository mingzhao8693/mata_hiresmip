function [v]=read_daily_mswep(tpath,expn,yr1,yr2,pct,opt,diag,latlon)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath='/archive/Ming.Zhao/awg/2023.04/';
expn ='c192_obs'; yr1=1979; yr2=2020; opt=1; 
pct=[1 5 10 25 50 75 90 95 99 99.9 99.99 99.999]; latlon=[180 340 10 90]; latlon=[190 304 16 75]; diag=0;
latlon=[0 360 -90 90];

atmos_data_dir='atmos_data';
if strcmp(atmos_data_dir,'atmos_data_240_480')
  fn=strcat(tpath,expn,'/atmos_static_240_480.nc'); 
else
  fn=strcat(tpath,expn,'/atmos.static.nc');
end
disp(fn);

v=readts_grid_2d(tpath,expn,fn,latlon,'c192'); v.latlon=latlon;
a=ncread(fn,'land_mask'); v.lm_org=a';
a=a(v.xs:v.xe,v.ys:v.ye); a=a';  %figure; pcolor(a); shading flat; colorbar;
v.lm=a; v.lm(v.lm>=0.5)=1; v.lm(v.lm<0.5)=0; 
amean=mean(mean(v.aa0)); v.aa = v.aa0/amean;

v.tpath=tpath; v.expn=expn; v.yr1=yr1; v.yr2=yr2; v.nyr=yr2-yr1+1;
v.pct=pct; v.opt=opt;

yea=[365];                                 ddd=cumsum(yea); d.beg_yea=[0 ddd(1:end-1)]+1; d.end_yea=ddd;
hyr=[90 183 92];                           ddd=cumsum(hyr); d.beg_hyr=[0 ddd(1:end-1)]+1; d.end_hyr=ddd;
sea=[59 92 92 91 31];                      ddd=cumsum(sea); d.beg_sea=[0 ddd(1:end-1)]+1; d.end_sea=ddd;
mon=[31 28 31 30 31 30 31 31 30 31 30 31]; ddd=cumsum(mon); d.beg_mon=[0 ddd(1:end-1)]+1; d.end_mon=ddd;

v.do_yea=1; v.do_hyr=0; v.do_sea=0; v.do_mon=0;
if v.do_mon
  v.d_beg=d.beg_mon; v.d_end=d.end_mon; v.mon=mon;
elseif v.do_sea
  v.d_beg=d.beg_sea; v.d_end=d.end_sea; v.sea=sea;
elseif v.do_hyr
  v.d_beg=d.beg_hyr; v.d_end=d.end_hyr; v.hyr=hyr;
else
  v.d_beg=d.beg_yea; v.d_end=d.end_yea; v.yea=yea;
end
m=0; %read annual data all together; m=1-12 read monthly data one at a time

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MSWEP precipitation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='precipitation'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily_mswep/');
exf1='mswep.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:mm/day
thresh=[0.2 1 5 10 50 100 200 400 500];
v.prday_mswep=extremes_ana(var,pct,thresh,1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v.expn ='c192L33_am4p0_2010climo_newctl'; v.yr1=2; v.yr2=101; v.nyr=v.yr2-v.yr1+1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='pr'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); var(k).a=var(k).a*86400; end; %unit:mm/day
thresh=[0.2 1 5 10 50 100 200 400 500];
v.prday_c192am4=extremes_ana(var,pct,thresh,1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute precipitation daily climatology
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var=v.prday_mswep.var; 
a=var(1).a; nyr=length(a(:,1,1))/365; a=reshape(a,365,nyr,v.nlat,v.nlon);
v.pr_mswep_daily_climo=squeeze(mean(a,2));
pr_mswep_daily_climo=permute(v.pr_mswep_daily_climo,[3 2 1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var=v.prday_c192am4.var; 
a=var(1).a; nyr=length(a(:,1,1))/365; a=reshape(a,365,nyr,v.nlat,v.nlon);
v.pr_c192am4_daily_climo=squeeze(mean(a,2));;
pr_c192am4_daily_climo=permute(v.pr_c192am4_daily_climo,[3 2 1]);;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v.pr_c192am4_daily_bias=v.pr_c192am4_daily_climo-v.pr_mswep_daily_climo;
pr_c192am4_daily_bias=permute(v.pr_c192am4_daily_bias,[3 2 1]); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute precipitation daily climatology
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=v.pr_c192am4_daily_bias;
b=movmean(a,15,1,'omitnan', 'Endpoints', 'fill'); v.pr_c192am4_daily_bias_f15=b;
c=movmean(a,30,1,'omitnan', 'Endpoints', 'fill'); v.pr_c192am4_daily_bias_f30=c;

pr_c192am4_daily_bias_f15=permute(v.pr_c192am4_daily_bias_f15,[3 2 1]); 
pr_c192am4_daily_bias_f30=permute(v.pr_c192am4_daily_bias_f30,[3 2 1]); 


%Save full data 
epath=strcat('/work/miz/mat_hiresmip/land/');
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(epath,expn,fext,'_c192am4_read_daily_mswep_all.mat')
save(fnmat,'v','-v7.3'); %save(fnmat,'v');

%Save climo data only
v.prday_mswep=0; v.prday_c192am4=0;
fnmat=strcat(epath,expn,fext,'_c192am4_read_daily_mswep_climo_only.mat')
save(fnmat,'v','-v7.3'); %save(fnmat,'v');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%write a netcdf file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fnout='/work/miz/mat_hiresmip/model_daily_precip_bias.nc';
nt=365; nlat=v.nlat; nlon=v.nlon; lat=v.lat; lon=v.lon;
cl=8; form='netcdf4'; time=[1:1:nt];
nccreate(fnout,'time','Dimensions',{'time' nt},'Format',form);
nccreate(fnout,'lat', 'Dimensions',{'lat' nlat},'Format',form);
nccreate(fnout,'lon', 'Dimensions',{'lon' nlon},'Format',form);
nccreate(fnout,'pr_c192am4_daily_climo',   'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_mswep_daily_climo',     'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_c192am4_daily_bias',    'Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_c192am4_daily_bias_f15','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
nccreate(fnout,'pr_c192am4_daily_bias_f30','Dimensions',{'lon' nlon 'lat' nlat 'time' nt},'Datatype','single','Format',form,'DeflateLevel',cl);
ncwrite(fnout,'time', time(:));
ncwrite(fnout,'lat',  lat);
ncwrite(fnout,'lon',  lon);
ncwrite(fnout,'pr_mswep_daily_climo',     pr_mswep_daily_climo)
ncwrite(fnout,'pr_c192am4_daily_climo',   pr_c192am4_daily_climo)
ncwrite(fnout,'pr_c192am4_daily_bias',    pr_c192am4_daily_bias)
ncwrite(fnout,'pr_c192am4_daily_bias_f15',pr_c192am4_daily_bias_f15)
ncwrite(fnout,'pr_c192am4_daily_bias_f30',pr_c192am4_daily_bias_f30)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v.expn ='c192L33_am4p0_2010climo_newctl'; v.yr1=2; v.yr2=101; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='pr'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); var(k).a=var(k).a*86400; end; %og.prday=var; %unit:mm/day
thresh=[0.2 1 5 10 50 100 200 400 500];
v.prday_c192am4=extremes_ana(var,pct,thresh,1)

var=v.prday_c192am4.var; 
a=var(1).a; nyr=length(a(:,1,1))/365; a=reshape(a,365,nyr,v.nlat,v.nlon);
a=squeeze(mean(a,2)); a=permute(a,[3 2 1]); pr_c192am4_daily_climo=a;

var=v.prday_mswep.var; 
a=var(1).a; nyr=length(a(:,1,1))/365; a=reshape(a,365,nyr,v.nlat,v.nlon);
a=squeeze(mean(a,2)); a=permute(a,[3 2 1]); pr_mswep_daily_climo=a;
%%%
