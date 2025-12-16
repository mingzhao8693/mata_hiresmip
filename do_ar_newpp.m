tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
expn ='c192L33_am4p0_amip_HIRESMIP_H8_newpp';
latdef = [240,-89.625, 0.75]; 
londef = [480, 0.375,  0.75]; 
%expn ='c192L33_am4p0_amip_HIRESMIP_H8_newpp_lres';
%latdef = [120,-89.25, 1.5]; 
%londef = [240, 0.75,  1.5]; 

for yr=1979:2014
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
  %ARdetect_miz(tpath,expn,syr,latdef,londef,timedef);
  %fn_ivtlmt=strcat(tpath,expn,'/AR_ctlmt/',expn,'_',syr,'_pixel_ivt_limit_new.nc');
  fn_ivtlmt=strcat(tpath,expn,'/AR_climlmt/',expn,'_',syr,'_pixel_ivt_limit_new.nc');
  ARdetect_miz_new(tpath,expn,syr,latdef,londef,timedef,fn_ivtlmt);
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
