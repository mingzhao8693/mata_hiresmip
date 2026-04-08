function [ar]=readarall_spearhi(tpath,expn,yr1,yr2,ardir,opt)
%tpath='/archive/Ming.Zhao/backup/ECMWF/';
%expn ='ERAI_6h_DATA'; yr1=1979; yr2=1980; opt=1;
%tpath='/archive/Ming.Zhao/spear_hi_8_dev/'; ardir='AR_climlmt'; opt=1;
%expn ='SPEAR_c384_OM4p08_Control_1990_A13'; yr1=301; yr2=310; 
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
v.yr=yr; v.yrt=yrt;
if (opt==1)
  disp('do get_ar_fq, which may take long time to finish...');
  v.ar=ar; v.f=get_ar_fq(v,1);
end
fn=strcat(tpath,expn,'/',expn,'_',num2str(yr1),'_',num2str(yr2),'_readarall_spearhi.mat')
save(fn,'v','-v7.3');
return

