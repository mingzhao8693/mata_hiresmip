function [B]=obtain_simplified_bias_standalone(tpath,expn,yr1,yr2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%tpath='/archive/Ming.Zhao/awg/2023.04/';
%expn ='c192L33_am4p0_2010climo_newctl';                 yr1=2;    yr2=101;
%expn='c192L33_am4p0_2010climo_newctl_p1K';              yr1=2;    yr2=101;
%expn='c192L33_am4p0_2010climo_trend_1979_2020_spear';   yr1=2;    yr2=101;
%expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2'; yr1=2;    yr2=101;
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_30min';    yr1=1951; yr2=2020;
%expn ='c192L33_CM4X_amip_02';                           yr1=1979; yr2=2020;

fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fn=strcat(tpath,expn,'/',expn,fext,'_daily_climo_mod_climo_bias_f30.mat'); disp(fn)
if (exist(fn,'file') == 2)
  disp('load in file...'); load(fn); x=v.c192am4;
else
  disp(strcat('file not exist:',fn)); return
end

B.pr.mswep    =x.pr.bias.daily.mswep;    %compare to ERA5
B.pr.mswep_f  =x.pr.bias.daily.mswep_f;  %compare to MSWEP
B.pr.gpcp13   =x.pr.bias.daily.gpcp13;   %compare to ERA5
B.pr.gpcp13_f =x.pr.bias.daily.gpcp13_f; %compare to MSWEP
B.pr.gpcp32   =x.pr.bias.daily.gpcp32;   %compare to ERA5
B.pr.gpcp32_f =x.pr.bias.daily.gpcp32_f; %compare to MSWEP
B.pr.gpm      =x.pr.bias.daily.gpm;      %compare to ERA5
B.pr.gpm_f    =x.pr.bias.daily.gpm_f;    %compare to MSWEP
B.pr.era5     =x.pr.bias.daily.era5;     %compare to ERA5
B.pr.era5_f   =x.pr.bias.daily.era5_f;   %compare to MSWEP

B.tas.bias     =x.tas.bias.daily;
B.tas.bias_f   =x.tas.bias.daily_f;
B.tasmax.bias  =x.tasmax.bias.daily;
B.tasmax.bias_f=x.tasmax.bias.daily_f;
B.rh.bias      =x.rh.bias.daily;
B.rh.bias_f    =x.rh.bias.daily_f;
B.wsd.bias     =x.wsd.bias.daily;
B.wsd.bias_f   =x.wsd.bias.daily_f;

%return

fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_mod_climo_bias_f30_B.mat'); disp(fnmat);
save(fnmat,'B','-v7.3'); %load(fnmat);

return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/awg/2023.04/';
%expn ='c192L33_am4p0_2010climo_newctl';                  yr1=2;    yr2=101;
%expn='c192L33_am4p0_2010climo_newctl_p1K';              yr1=2;    yr2=101;
%expn='c192L33_am4p0_2010climo_trend_1979_2020_spear';   yr1=2;    yr2=101;
%expn='c192L33_am4p0_2010climo_trend_1979_2020_times_2'; yr1=2;    yr2=101;
%expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_30min';    yr1=1951; yr2=2020;
expn ='c192L33_CM4X_amip_03'; yr1=1979; yr2=2020; B=obtain_simplified_bias(tpath,expn,yr1,yr2);
expn ='c192L33_CM4X_amip_04'; yr1=1979; yr2=2020; B=obtain_simplified_bias(tpath,expn,yr1,yr2);
expn ='c192L33_CM4X_amip_05'; yr1=1979; yr2=2020; B=obtain_simplified_bias(tpath,expn,yr1,yr2);
expn ='c192L33_CM4X_amip_06'; yr1=1979; yr2=2020; B=obtain_simplified_bias(tpath,expn,yr1,yr2);
expn ='c192L33_CM4X_amip_07'; yr1=1979; yr2=2020; B=obtain_simplified_bias(tpath,expn,yr1,yr2);
expn ='c192L33_CM4X_amip_08'; yr1=1979; yr2=2020; B=obtain_simplified_bias(tpath,expn,yr1,yr2);
expn ='c192L33_CM4X_amip_09'; yr1=1979; yr2=2020; B=obtain_simplified_bias(tpath,expn,yr1,yr2);
expn ='c192L33_CM4X_amip_10'; yr1=1979; yr2=2020; B=obtain_simplified_bias(tpath,expn,yr1,yr2);
expn ='c192L33_CM4X_amip_11'; yr1=1979; yr2=2020; B=obtain_simplified_bias(tpath,expn,yr1,yr2);
expn ='c192L33_CM4X_amip_12'; yr1=1979; yr2=2020; B=obtain_simplified_bias(tpath,expn,yr1,yr2);
expn ='c192L33_CM4X_amip_13'; yr1=1979; yr2=2020; B=obtain_simplified_bias(tpath,expn,yr1,yr2);
expn ='c192L33_CM4X_amip_14'; yr1=1979; yr2=2020; B=obtain_simplified_bias(tpath,expn,yr1,yr2);
