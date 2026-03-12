function [v]=read_daily_model(tpath,expn,yr1,yr2,pct,opt,latlon,do_trend)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%if one wants to load observations%%%%%
%tpath='/archive/Ming.Zhao/awg/2023.04/'; expn ='c192_obs'; yr1=1979; yr2=2020; opt=0; 
%fext =strcat('_',num2str(yr1),'_',num2str(yr2));
%fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_obs_all.mat');   %load(fnmat); 
%fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_obs_climo.mat'); %load(fnmat); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/awg/2023.04/';
%expn ='c192L33_am4p0_2010climo_newctl'; yr1=2; yr2=101; opt=0; 
%expn ='c192L33_CM4X_amip'; yr1=1979; yr2=1980; opt=0; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Model evaluations:
%cd /archive/Ming.Zhao/awg/2023.04/c192L33_CM4X_amip/atmos_data/daily
%dmget *.ps.nc *.tas.nc *huss.nc *hurs.nc *pr.nc *uas.nc *vas.nc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pct=[0.1 1 5 10 25 50 75 90 95 99 99.9];
%latlon=[180 340 10 90];
%latlon=[190 304 16 75];
%latlon=[0 360 -90 90];

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

v.tpath=tpath; v.expn=expn; v.yr1=yr1; v.yr2=yr2; v.nyr=yr2-yr1+1; v.tyr=[yr1:yr2]';
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
nbin=[]; v.do_trend=do_trend;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Model evaluations: dmget *.ps.nc *.tas.nc *huss.nc *hurs.nc *pr.nc *uas.nc *vas.nc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read C192AM4 daily data%%%%%%%
%v.expn ='c192L33_am4p0_2010climo_newctl'; v.yr1=2; v.yr2=101; v.nyr=v.yr2-v.yr1+1;
%v.expn ='c192L33_am4p0_amip_HIRESMIP_nudge_wind_30min'; v.yr1=1979; v.yr2=2020; v.nyr=v.yr2-v.yr1+1;
%v.expn ='c192L33_CM4X_amip_15'; v.yr1=1979; v.yr2=2020; v.nyr=v.yr2-v.yr1+1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%surface pressure ps in unit of hPa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='ps'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff);
for k=1:length(var); var(k).a=var(k).a*0.01; end; %og.psday=var; %unit:hPa
thresh=[]; v.c192am4.ps=extremes_ana(var,pct,thresh,nbin,do_trend,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TASMAX in unit of K
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='tasmax'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff);
thresh=[]; v.c192am4.tasmax=extremes_ana(var,pct,thresh,nbin,do_trend,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TS in unit of K
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='ts'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff);
thresh=[]; v.c192am4.ts=extremes_ana(var,pct,thresh,nbin,do_trend,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TAS in unit of K
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='tas'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff);
thresh=[]; v.c192am4.tas=extremes_ana(var,pct,thresh,nbin,do_trend,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute surface saturation vapor pressure vps in unit of hPa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:length(var); var(k).a=es_t_array(var(k).a); end;
%for k=1:length(var); var2(k).a=es_t_array_tetens(var(k).a); end;
%for k=1:length(var); var3(k).a=es_t_array_ardenbuck(var(k).a); end;
%for k=1:length(var); var3(k).a=es_t_array_goffgratch(var(k).a); end;
thresh=[]; v.c192am4.vps=extremes_ana(var,pct,thresh,nbin,do_trend,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%surface humidity kg/kg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='huss'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %unit:kg/kg
thresh=[]; v.c192am4.qv=extremes_ana(var,pct,thresh,nbin,do_trend,opt) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute surface vapor pressure vp (hPa) from surface specific humidity huss
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:length(var); var(k).a=e_qp_array(var(k).a,v.c192am4.ps.var(k).a); end; 
thresh=[]; v.c192am4.vp=extremes_ana(var,pct,thresh,nbin,do_trend,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute surface vapor pressure vp in unit of hPa from surface specific humidity huss
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:length(var); var(k).a=v.c192am4.vps.var(k).a-v.c192am4.vp.var(k).a; end;
for k=1:length(var); id=var(k).a<=0; var(k).a(id)=0;  end; %og.vpdday=var;
thresh=[]; v.c192am4.vpd=extremes_ana(var,pct,thresh,nbin,do_trend,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read in surface relative humidity (%)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='hurs'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); id=var(k).a>=100; var(k).a(id)=100; end;
for k=1:length(var); id=var(k).a<=0;   var(k).a(id)=0;   end; %og.rhday=var; %unit:%
thresh=[10:10:90]; v.c192am4.rh=extremes_ana(var,pct,thresh,nbin,do_trend,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='pr'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); var(k).a=var(k).a*86400; end; %unit:mm/day
thresh=[0.2 1 5 10 50 100 200 400 500];
v.c192am4.pr=extremes_ana(var,pct,thresh,nbin,do_trend,opt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='uas'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
thresh=[]; v.c192am4.uas=extremes_ana(var,pct,thresh,nbin,do_trend,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varn='vas'; ff='day'; exd=strcat('/',atmos_data_dir,'/daily/');
exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
thresh=[]; v.c192am4.vas=extremes_ana(var,pct,thresh,nbin,do_trend,1)
%compute wind speed %%%%%%%%%%%
for k=1:length(var); var(k).a=sqrt(v.c192am4.uas.var(k).a.^2+v.c192am4.vas.var(k).a.^2); end;
thresh=[]; v.c192am4.wsd=extremes_ana(var,pct,thresh,nbin,do_trend,opt)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Save model analysis data data%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
%fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_mod_all.mat'); disp(fnmat); save(fnmat,'v','-v7.3'); %load(fnmat); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Save less model analysis data data%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varlist={'pr','tasmaxday'}; v.c192am4=clearvar(v.c192am4,0,varlist);
fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_mod_climo.mat'); disp(fnmat); save(fnmat,'v','-v7.3'); %load(fnmat); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%reload both model and obs to compute daily climatological biases
%expn ='c192L33_am4p0_2010climo_newctl'; yr1=2;    yr2=101; 
%expn ='c192L33_CM4X_amip';              yr1=1979; yr2=2020; 
%fext =strcat('_',num2str(yr1),'_',num2str(yr2));
%fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_mod_climo.mat'); disp(fnmat); load(fnmat); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute model daily climo bias
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
opath='/archive/Ming.Zhao/awg/2023.04/'; expo ='c192_obs'; fext ='_1979_2020';
fnmat=strcat(opath,expo,'/',expo,fext,'_daily_climo_obs_climo.mat'); disp(fnmat); o=load(fnmat); o=o.v;

fday=30; v=compute_daily_model_bias(v,o,fday);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Save model daily climatological bias to mat file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_mod_climo_bias_f30.mat')
save(fnmat,'v','-v7.3'); %save(fnmat,'v');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%write model daily bias to netcdf file%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fnout=strcat(tpath,expn,'/',expn,fext,'_daily_climo_mod_climo_bias_f30.nc')
write_model_bias(v, fnout)

return




%Save only climo bias only
x=v.c192am4;

B.pr_mswep.bias     =x.pr_mswep.bias;      %compare to ERA5
B.pr_mswep.bias_f30 =x.pr_mswep.bias_f30;  %compare to MSWEP
B.pr.bias           =x.pr.bias;            %compare to ERA5
B.pr.bias_f30       =x.pr.bias_f30;        %compare to ERA5
B.tas.bias          =x.tas.bias;
B.tas.bias_f30      =x.tas.bias_f30;
B.tasmax.bias       =x.tasmax.bias;
B.tasmax.bias_f30   =x.tasmax.bias_f30;
B.rh.bias           =x.rh.bias;
B.rh.bias_f30       =x.rh.bias_f30;
B.wsd.bias          =x.wsd.bias;
B.wsd.bias_f30      =x.wsd.bias_f30;

fnmat=strcat(tpath,expn,'/',expn,fext,'_read_daily_obs_bias_only.mat')
save(fnmat,'B','-v7.3'); %save(fnmat,'v');

%  B.rh.bias_f30 =x.rh.bias_f30;  
%  B.wsd.bias_f30=x.wsd.bias_f30;
