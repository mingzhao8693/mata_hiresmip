function [v]=compute_hw_thresh(tpath,expn,yr1,yr2,pct,latlon,do_bias_correct)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pct=[90 95 99]; latlon=[0 360 -90 90]; yr1=2; yr2=101; ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%tpath='/archive/Ming.Zhao/awg/2023.04/';
%expn ='c192L33_am4p0_2010climo_newctl';                 yr1=2;    yr2=101;
%expn='c192L33_am4p0_2010climo_newctl_p1K';              yr1=2;    yr2=101;
%expn='c192L33_am4p0_2010climo_trend_1979_2020_spear';   yr1=2;    yr2=101;
%expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2'; yr1=2;    yr2=101;
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_30min';    yr1=1951; yr2=2020;
%expn ='c192L33_CM4X_amip';                               yr1=1979; yr2=2020;
  
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
if do_bias_correct
  fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_mod_climo_bias_f30_B.mat'); disp(fnmat);
  if (exist(fnmat,'file') == 2)
    'load in file...'
    load(fnmat); B
  else
    disp(strcat('not exist:',fnmat)); return  
  end
  dirname='/daily/'; exf1='atmos_cmip.'; varn='tasmax';
else
  dirname='/daily_era5_remapcon/'; exf1='ERA5_daily.'; varn='t2mmax';
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

atmos_data_dir='atmos_data';
fn=strcat(tpath,expn,'/atmos.static.nc'); disp(fn);
v=readts_grid_2d(tpath,expn,fn,latlon,'c192'); v.latlon=latlon;
v.tpath=tpath; v.expn=expn; v.yr1=yr1; v.yr2=yr2; v.nyr=yr2-yr1+1; v.tyr=[yr1:yr2]';

yea=[365]; ddd=cumsum(yea); d.beg_yea=[0 ddd(1:end-1)]+1; d.end_yea=ddd;
v.do_yea=1; v.d_beg=d.beg_yea; v.d_end=d.end_yea; v.yea=yea;

% precomputing tasmax threshhold for heatwave analysis
ff='day'; exd=strcat('/',atmos_data_dir,dirname);
exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); %this is a smart reader script
%thresh=[]; nbin=[]; do_trend=0; tasmax=extremes_ana(var,pct,thresh,nbin,do_trend,1); var=tasmax.var(1);
var=var(1); dofy=var.dofy; mofy=var.mofy; year=var.year; time=var.time;
a=var.a-273.15; win=15;
v.thresh=heatwave_threshold_grid(a,dofy,pct,win);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% do bias correction for tasmax based on ERA5 data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%do_bias_correct = true
if do_bias_correct
%  var=tasmax.var(1); dofy=var.dofy; mofy=var.mofy; year=var.year; time=var.time;
  a=B.tasmax.bias_f;  a=repmat(a,[v.nyr 1 1]); var.a=var.a-a;
  a=var.a-273.15; win=15; v.thresh_c=heatwave_threshold_grid(a,dofy,pct,win);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% end of do bias correction for tasmax based on ERA5 data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%save precomputed threshold values for heatwave analysis only
v.pct=pct; clear var;
fnmat=strcat(tpath,expn,'/fwihw/',expn,fext,'.hw_thresh_original_and_correct.mat')
save(fnmat,'v','-v7.3');

return

%save precomputed threshold values and original data
v.tasmax=tasmax; clear tasmax var;
fnmat=strcat(tpath,expn,'/fwihw/',expn,fext,'.hw_thresh_all.mat')
save(fnmat,'v','-v7.3'); v.tasmax=0; clear var;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
