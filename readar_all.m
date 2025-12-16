function [ar]=readar_all(tpath,expn,yr1,yr2,ardir,opt)
%tpath='/archive/Ming.Zhao/backup/ECMWF/';
%expn ='ERAI_6h_DATA'; yr1=1979; yr2=1980; opt=1;
%tpath='/archive/Ming.Zhao/awg/warsaw_201710/'; opt=1;
%expn ='c192L33_am4p0_amip_HIRESMIP_H8'; %yr1=1950; yr2=2014;
fname=strcat(tpath,expn,'/atmos.static.nc'); disp(fname);
f=netcdf(fname,'nowrite'); 
v.lm0=f{'land_mask'}(:,:);
v.lon=f{'lon'}(:,:); v.lat=f{'lat'}(:,:); close(f)

v.nyr=yr2-yr1+1; v.yr1=yr1; v.yr2=yr2; i1=1; v
for t=1:v.nyr
  yrt(t)=v.yr1+t-1;
  if (yrt(t)<10)
    yy=strcat('000',num2str(yrt(t)));
  elseif (yrt(t)<100)
    yy=strcat('00',num2str(yrt(t)));
  elseif (yrt(t)<1000)
    yy=strcat('0',num2str(yrt(t)));
  else
    yy=num2str(yrt(t));
  end
  artmp=readar(tpath,expn,yy,ardir,opt); yr(t).ar=artmp;
  if (opt==0)
    i2=i1+length(artmp)-1; 
    ar(i1:i2)=artmp; 
    i1=i2+1;
  else
    i2=i1+length(artmp.yyy)-1; 
    ar.yyy (i1:i2) =artmp.yyy;
    ar.mmm (i1:i2) =artmp.mmm;
    ar.ddd (i1:i2) =artmp.ddd;
    ar.hrs (i1:i2) =artmp.hrs;
    ar.leng(i1:i2) =artmp.leng;
    ar.widt(i1:i2) =artmp.widt;
    ar.clon(i1:i2) =artmp.clon;
    ar.clat(i1:i2) =artmp.clat;
    ar.elon(i1:i2) =artmp.elon;
    ar.elat(i1:i2) =artmp.elat;
    ar.plon(i1:i2) =artmp.plon;
    ar.plat(i1:i2) =artmp.plat;
    ar.ivtz(i1:i2) =artmp.ivtz;
    ar.ivtm(i1:i2) =artmp.ivtm;
    ar.ivtd(i1:i2) =artmp.ivtd;
    ar.coh (i1:i2) =artmp.coh;
    ar.llon(i1:i2) =artmp.llon;
    ar.llat(i1:i2) =artmp.llat;
    ar.IVTZ(i1:i2) =artmp.IVTZ;
    ar.IVTM(i1:i2) =artmp.IVTM;
    ar.IVTD(i1:i2) =artmp.IVTD;
    i1=i2+1;
  end
end
v.yrt=yrt;
tpath='/work/miz/mat_AR/';
fn=strcat(tpath,expn,'_AR_',num2str(yr1),'_',num2str(yr2),'_saveopt',num2str(opt),'_',ardir,'_readar_all.mat')
disp('do get_ar_fq which take long time to finish...');
if (opt==0)
  save(fn,'v','yr','-v7.3'); %save(fn,'v','-v7.3');
else
  v.ar=ar; v.f=get_ar_fq(v,1);
  save(fn,'v');
end

return

