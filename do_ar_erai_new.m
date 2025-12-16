tpath='/archive/Ming.Zhao/backup/ECMWF/';
expn ='ERAI_6h_DATA'; 
latdef = [241, -90, 0.75];
londef = [480,  0,  0.75];

for yr=1979:2016
  timedef= [1460,yr,1,1,0,6];
  syr=num2str(yr);
  disp(syr)
  ardir='AR_climlmt'
  fn_ivtlmt=strcat(tpath,expn,'/',ardir,'/',expn,'_',syr,'_pixel_ivt_limit_new.nc');
  ARdetect_miz_new1(tpath,expn,syr,latdef,londef,timedef,fn_ivtlmt,ardir);
end

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
  ardir='AR_climlmt'
  %ARdetect_miz(tpath,expn,syr,latdef,londef,timedef);
  %fn_ivtlmt=strcat(tpath,expn,'/AR_ctlmt/',expn,'_',syr,'_pixel_ivt_limit_new.nc');
  fn_ivtlmt=strcat(tpath,expn,'/',ardir,'/',expn,'_',syr,'_pixel_ivt_limit_new.nc');
  ARdetect_miz_new1(tpath,expn,syr,latdef,londef,timedef,fn_ivtlmt,ardir);
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
