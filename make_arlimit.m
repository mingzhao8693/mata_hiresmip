  tpath='/work/miz/mat_AR/';
  expn ='c192L33_am4p0_amip_HIRESMIP_H8_newpp';
  fext='_1979_2014_AR_readar_limit.mat'; fn=strcat(tpath,expn,fext); 
  load(fn); a=v.ivt_limit_clm.mon; v0.limit_clm=permute(a,[3 2 1]); 

  expn ='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp';
  fext='_2015_2050_AR_readar_limit.mat'; fn=strcat(tpath,expn,fext);
  load(fn); a=v.ivt_limit_clm.mon; w0.limit_clm=permute(a,[3 2 1]);

  %tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
  %expn ='c192L33_am4p0_amip_HIRESMIP_H8_newpp';
  %yr1=1979; yr2=2014;
  tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
  expn ='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp';
  yr1=2015; yr2=2050;

  tpath='/work/miz/mat_AR/';
  expn ='c192L33_am4p0_2010climo_new_newpp';
  fext='_2_31_AR_readar_limit.mat'; fn=strcat(tpath,expn,fext); 
  load(fn); a=v.ivt_limit_clm.mon; v0.limit_clm=permute(a,[3 2 1]); 

  expn ='c192L33_am4p0_2010climo_new_p4K_newpp';
  fext='_2_31_AR_readar_limit.mat'; fn=strcat(tpath,expn,fext);
  load(fn); a=v.ivt_limit_clm.mon; w0.limit_clm=permute(a,[3 2 1]);

  tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
  expn ='c192L33_am4p0_2010climo_new_newpp';
  yr1=2; yr2=31;

  tpath='/work/miz/mat_AR/';
  expn='ERAI_6h_DATA'; yr1=1979; yr2=2014;
  fext='_1979_2014_readar_limit.mat'; fn=strcat(tpath,expn,fext); 
  load(fn); a=v.ivt_limit_clm.mon; v0.limit_clm=permute(a,[3 2 1]); 

  tpath='/archive/Ming.Zhao/backup/ECMWF/';
  expn='ERAI_6h_DATA'; yr1=1979;yr2=2014;

  if (do_future1)
  tpath='/work/miz/mat_AR/';
  expn ='c192L33_am4p0_amip_HIRESMIP_H8_newpp';
  fext='_1979_2014_readar_limit.mat'; fn=strcat(tpath,expn,fext); 
  load(fn); a=v.ivt_limit_clm.mon; v0.limit_clm=permute(a,[3 2 1]); 

  expn ='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp';
  fext='_2015_2050_readar_limit.mat'; fn=strcat(tpath,expn,fext);
  load(fn); a=v.ivt_limit_clm.mon; w0.limit_clm=permute(a,[3 2 1]);

  tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
  expn ='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp';
  yr1=2015; yr2=2050;
  
elseif (do_future2)
  tpath='/work/miz/mat_AR/';
  expn ='c192L33_am4p0_amip_HIRESMIP_H8_newpp';
  fext='_1979_2014_readar_limit.mat'; fn=strcat(tpath,expn,fext); 
  load(fn); a=v.ivt_limit_clm.mon; v0.limit_clm=permute(a,[3 2 1]); 

  expn ='c192L33_am4p0_amip_HIRESMIP_future_ssp585_3';
  fext='_2015_2050_AR_readar_limit.mat'; fn=strcat(tpath,expn,fext);
  load(fn); a=v.ivt_limit_clm.mon; w0.limit_clm=permute(a,[3 2 1]);

  tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
  expn ='c192L33_am4p0_amip_HIRESMIP_future_ssp585_3';
  yr1=2015; yr2=2050;
  
elseif (do_p4K)
  tpath='/work/miz/mat_AR/';
  expn ='c192L33_am4p0_2010climo_new_newpp';
  fext='_2_31_readar_limit.mat'; fn=strcat(tpath,expn,fext); 
  load(fn); a=v.ivt_limit_clm.mon; v0.limit_clm=permute(a,[3 2 1]); 

  expn ='c192L33_am4p0_2010climo_new_p4K_newpp';
  fext='_2_31_readar_limit.mat'; fn=strcat(tpath,expn,fext);
  load(fn); a=v.ivt_limit_clm.mon; w0.limit_clm=permute(a,[3 2 1]);

  tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
  expn ='c192L33_am4p0_2010climo_new_p4K_newpp';
  yr1=2; yr2=31;

end



  
  tpath='/work/miz/mat_AR/';
  expn ='c192L33_am4p0_2010climo_new_newpp';
  fext='_2_31_AR_readar_limit.mat'; fn=strcat(tpath,expn,fext); 
  load(fn); a=v.ivt_limit_clm.mon; v0.limit_clm=permute(a,[3 2 1]); 

  expn ='c192L33_am4p0_2010climo_new_p4K_newpp';
  fext='_2_31_AR_readar_limit.mat'; fn=strcat(tpath,expn,fext);
  load(fn); a=v.ivt_limit_clm.mon; w0.limit_clm=permute(a,[3 2 1]);

  tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
  expn ='c192L33_am4p0_2010climo_new_p4K_newpp';
  yr1=2; yr2=31;
  
  
  tpath='/work/miz/mat_AR/';
  expn ='c192L33_am4p0_amip_HIRESMIP_H8_newpp';
  fext='_1979_2014_AR_readar_limit.mat'; fn=strcat(tpath,expn,fext); 
  load(fn); a=v.ivt_limit_clm.mon; v0.limit_clm=permute(a,[3 2 1]); 

  expn ='c192L33_am4p0_amip_HIRESMIP_future_ssp585_3';
  fext='_2015_2050_AR_readar_limit.mat'; fn=strcat(tpath,expn,fext);
  load(fn); a=v.ivt_limit_clm.mon; w0.limit_clm=permute(a,[3 2 1]);

  tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
  expn ='c192L33_am4p0_amip_HIRESMIP_future_ssp585_3';
  yr1=2015; yr2=2050;
  
  tpath='/work/miz/mat_AR/';
  expn ='c192L33_am4p0_amip_HIRESMIP_H8_newpp';
  fext='_1979_2014_AR_readar_limit.mat'; fn=strcat(tpath,expn,fext); 
  load(fn); a=v.ivt_limit_clm.mon; v0.limit_clm=permute(a,[3 2 1]); 

  expn ='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp';
  fext='_2015_2050_AR_readar_limit.mat'; fn=strcat(tpath,expn,fext);
  load(fn); a=v.ivt_limit_clm.mon; w0.limit_clm=permute(a,[3 2 1]);

  tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
  expn ='c192L33_am4p0_amip_HIRESMIP_H8_newpp';
  yr1=1952; yr2=1978;

  
  tpath='/work/miz/mat_AR/';
  expn ='c192L33_am4p0_2010climo_new_newpp';
  fext='_2_31_AR_readar_limit.mat'; fn=strcat(tpath,expn,fext); 
  load(fn); a=v.ivt_limit_clm.mon; v0.limit_clm=permute(a,[3 2 1]); 

  expn ='c192L33_am4p0_2010climo_new_p4K_newpp';
  fext='_2_31_AR_readar_limit.mat'; fn=strcat(tpath,expn,fext);
  load(fn); a=v.ivt_limit_clm.mon; w0.limit_clm=permute(a,[3 2 1]);

  tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
  expn ='c192L33_am4p0_2010climo_new_newpp';
  yr1=33; yr2=60;

%read dimensions below but ivt value will be replaced by v0/w0  
fn=strcat(tpath,expn,'/AR/',expn,'_0002_pixel_ivt_limit.nc');disp(fn);
v0.time=ncread(fn,'time'); v0.nt  =length(v0.time); 
v0.lat =ncread(fn,'lat');  v0.nlat=length(v0.lat);
v0.lon =ncread(fn,'lon');  v0.nlon=length(v0.lon);
%ivt=ncread(fn,'ivt');   size(ivt)
for yr=yr1:yr2
  timedef= [1460,yr,1,1,0,6];
  if (yr<10)
    syr=strcat('000',num2str(yr));
  elseif(yr<100)
      syr=strcat('00',num2str(yr));
  elseif(yr<1000)
      syr=strcat('0',num2str(yr));
  else
    syr=num2str(yr);
  end
  disp(syr); opt=0; 
  convert_limit(tpath,expn,syr,v0,v0,opt)
end
