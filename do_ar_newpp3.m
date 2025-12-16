tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
%expn ='c192L33_am4p0_2010climo_new_newpp';yr1=2; yr2=101;
%expn ='c192L33_am4p0_2010climo_new_p4K_newpp';yr1=31; yr2=101;
%expn ='c192L33_am4p0_2010climo_new_4xCO2_newpp';yr1=2; yr2=101;
expn ='c192L33_am4p0_2010climo_new_p4K_4xCO2_newpp';yr1=2; yr2=101;
%expn='c192L33_am4p0_climo_hiresmip_futureSST_4xCO2_newpp';yr1=2;yr2=101;
%expn ='c192L33_am4p0_2010climo_new_p4K_4xCO2_newpp';yr1=32; yr2=62;
%expn='c192L33_am4p0_amip_HIRESMIP_future_ssp585_newpp';yr1=2015;yr2=2050;
%expn ='c192L33_am4p0_amip_HIRESMIP_H8_newpp';yr1=1951;yr2=1956;
latdef = [240,-89.625, 0.75]; 
londef = [480, 0.375,  0.75]; 
%expn ='c192L33_am4p0_amip_HIRESMIP_H8_newpp_lres';
%latdef = [120,-89.25, 1.5]; 
%londef = [240, 0.75,  1.5]; 

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
  disp(syr)
  ardir='AR_climlmt'; fn_ivtlmt=85; opt=0;
  fn_ivtlmt=strcat(tpath,expn,'/',ardir,'/',expn,'_2_101_','pixel_ivt_limit_climo.nc')
%  fn_ivtlmt=strcat(tpath,expn,'/',ardir,'/',expn,'_2_62_','pixel_ivt_limit_climo.nc')
  ARdetect_miz_new2(tpath,expn,syr,latdef,londef,timedef,fn_ivtlmt,ardir);
end


return

tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
expn ='c192L33_am4p0_2010climo_new_p4K_newpp';
latdef = [240,-89.625, 0.75]; 
londef = [480, 0.375,  0.75]; 

for yr=3:31
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
  disp(syr)
  fn_ivtlmt=strcat(tpath,expn,'/AR_new/',expn,'_',syr,'_pixel_ivt_limit_new.nc');
  ARdetect_miz_new(tpath,expn,syr,latdef,londef,timedef,fn_ivtlmt);
end
