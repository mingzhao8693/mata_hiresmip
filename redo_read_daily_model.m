%reload both model and obs to compute daily climatological biases
tpath='/archive/Ming.Zhao/awg/2023.04/';
expn ='c192L33_CM4X_amip_01'; yr1=1950; yr2=2020; 
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_mod_climo.mat'); disp(fnmat); load(fnmat); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute model daily climo bias
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
opath='/archive/Ming.Zhao/awg/2023.04/'; expo ='c192_obs'; fext ='_1950_2020';
fnmat=strcat(opath,expo,'/',expo,fext,'_daily_climo_obs_climo.mat'); disp(fnmat); o=load(fnmat); o=o.v;

fday=30; v=compute_daily_model_bias(v,o,fday);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Save model daily climatological bias to mat file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_mod_climo_bias_f30.mat')
save(fnmat,'v','-v7.3'); %save(fnmat,'v');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Save simplified model daily climatological bias to mat file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fnmat=strcat(tpath,expn,'/',expn,fext,'_daily_climo_mod_climo_bias_f30_B.mat')
B=obtain_simplified_bias(v.c192am4);
save(fnmat,'B','-v7.3'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%write model daily bias to netcdf file%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fnout=strcat(tpath,expn,'/',expn,fext,'_daily_climo_mod_climo_bias_f30.nc')
write_model_bias(v, fnout)
