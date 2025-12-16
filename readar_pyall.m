function [ar]=readar_pyall(tpath,expn,yr1,yr2,opt)
%tpath='/archive/Ming.Zhao/backup/ECMWF/';
%expn ='ERAI_6h_DATA'; yr1=1979; yr2=1980; opt=1;
%tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
%expn ='c192L33_am4p0_amip_HIRESMIP_H8'; yr1=1950; yr2=1950; opt=1;
fname=strcat(tpath,expn,'/atmos.static.nc'); disp(fname);
f=netcdf(fname,'nowrite'); 
v.lm0=f{'land_mask'}(:,:);
v.lon=f{'lon'}(:,:); v.lat=f{'lat'}(:,:); close(f)

v.nyr=yr2-yr1+1; v.yr1=yr1; v.yr2=yr2; i1=1;
for t=1:v.nyr
  v.yrt(t)=v.yr1+t-1; disp(v.yrt(t));
  artmp=readar_py(tpath,expn,v.yrt(t),opt); yr(t).ar=artmp;
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
    ar.wlon(i1:i2) =artmp.wlon;
    ar.elat(i1:i2) =artmp.elat;
    ar.elon(i1:i2) =artmp.elon;
    ar.plat(i1:i2) =artmp.plat;
    ar.ivtz(i1:i2) =artmp.ivtz;
    ar.ivtm(i1:i2) =artmp.ivtm;
    ar.ivtd(i1:i2) =artmp.ivtd;
    ar.ivti(i1:i2) =artmp.ivti;
    ar.coh (i1:i2) =artmp.coh;
    ar.llon(i1:i2) =artmp.llon;
    ar.llat(i1:i2) =artmp.llat;
    ar.IVTZ(i1:i2) =artmp.IVTZ;
    ar.IVTM(i1:i2) =artmp.IVTM;
    ar.IVTD(i1:i2) =artmp.IVTD;
    i1=i2+1;
  end
end

tpath='/work/miz/mat_hiresmip/';
fn=strcat(tpath,expn,'_AR_py_',num2str(yr1),'_',num2str(yr2),'_saveopt',num2str(opt),'.mat')
if (opt==0)
  save(fn,'v','yr','-v7.3'); %save(fn,'v','-v7.3');
else
  v.ar=ar; %v.f=get_ar_fq(v,1);
  save(fn,'v');
end

return

tpath='/archive/Ming.Zhao/backup/ECMWF/';
expn ='ERAI_6h_DATA'; yr1=1979; yr2=1981; opt=1;
readar_pyall(tpath,expn,yr1,yr2,opt)

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn ='c192L33_am4p0_amip_HIRESMIP_H8'; yr1=1950; yr2=1952; opt=1;
readar_pyall(tpath,expn,yr1,yr2,opt)
