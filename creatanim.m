[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
expn ='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; yr1=1951; yr2=1951; opt='mod';

fn=strcat(tpath,expn,'/atmos.static.nc'); v.lon=ncread(fn,'lon'); 
if strcmp(opt,'obs')
  lat=ncread(fn,'lat'); v.lat=flipud(lat);
  a=ncread(fn,'land_mask'); a=a'; v.lm=flipud(a);
else
  v.lat=ncread(fn,'lat'); a=ncread(fn,'land_mask'); v.lm=a';
end
v.lm(v.lm>=0.5)=1; v.lm(v.lm<0.5)=0; 
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;

n1=1; nn=100; yr=num2str(yr1);

dd='/AR_allstorms/avg_daily/';
ff=strcat('c192L33_am4p0_amip_HIRESMIP_H8_newpp_',yr,'.shape.nc');
fn=strcat(tpath,expn,dd,ff);
a=ncread(fn,'shape',   [1 1 n1],[Inf Inf nn]); a(isnan(a))=0; ar=a;
a=ncread(fn,'shape_tc',[1 1 n1],[Inf Inf nn]); a(isnan(a))=0; tc=a;
a=ncread(fn,'shape_td',[1 1 n1],[Inf Inf nn]); a(isnan(a))=0; td=a;
a=ncread(fn,'shape_et',[1 1 n1],[Inf Inf nn]); a(isnan(a))=0; et=a;

dd='/atmos_data/daily_avg/';
ff=strcat('atmos_cmip.',yr,'010100-',yr,'123123.');
varn='ivtx'; fn=strcat(tpath,expn,dd,ff,varn,'.nc');
ivtx=ncread(fn,'ivtx',[1 1 n1],[Inf Inf nn]); 
varn='ivty'; fn=strcat(tpath,expn,dd,ff,varn,'.nc');
ivty=ncread(fn,'ivty',[1 1 n1],[Inf Inf nn]); 
ivt=sqrt(ivtx.^2+ivty.^2);

dd='/atmos_data/daily/';
ff=strcat('atmos_cmip.',yr,'0101-',yr,'1231.');
varn='prw'; fn=strcat(tpath,expn,dd,ff,varn,'.nc')
prw=ncread(fn,'prw',[1 1 n1],[Inf Inf nn]); 
varn='pr'; fn=strcat(tpath,expn,dd,ff,varn,'.nc')
pr=ncread(fn,'pr',[1 1 n1],[Inf Inf nn]); 
varn='psl'; fn=strcat(tpath,expn,dd,ff,varn,'.nc')
psl=ncread(fn,'psl',[1 1 n1],[Inf Inf nn]); 

fn=strcat(tpath,expn,'/atmos_data/atmos_cmip.1951-2014-clim.psl.nc')
psl_clm=ncread(fn,'psl',[1 1 1],[Inf Inf 1]); 

%create animation
row=2; col=1;
for i=1:100
  str=sprintf('%s%02d',yr,i);disp(str);
  ivty0=squeeze(ivty(:,:,i))'; 
  ivt0 =squeeze(ivt (:,:,i))'; 
  prw0 =squeeze(prw (:,:,i))';
  pr0  =squeeze(pr  (:,:,i))'*86400;
  psl0 =squeeze(psl (:,:,i))'*0.01;
  ar0  =squeeze(ar  (:,:,i))';
  tc0  =squeeze(tc  (:,:,i))';
  td0  =squeeze(td  (:,:,i))';
  et0  =squeeze(et  (:,:,i))';
  pms=[ 0, 0, 700, 600];
  handle = figure('Position', pms,'visible','on');
  subplot(row,col,1)
  pcolor (v.lon,v.lat,pr0); shading flat; colorbar; hold on; caxis([0 80]);
  contour(v.lon,v.lat,ar0,[1],'r'); 
  contour(v.lon,v.lat,tc0,[1],'m'); 
  contour(v.lon,v.lat,td0,[1],'c'); 
  contour(v.lon,v.lat,et0,[1],'y'); 
  contour(v.lon,v.lat,v.lm,[1],'w');
  title(str);
  subplot(row,col,2)
  pcolor (v.lon,v.lat,psl0-psl_clm'*0.01); shading flat; colorbar;
  hold on; caxis([-20 20]);
  contour(v.lon,v.lat,ar0,[1],'r'); 
  contour(v.lon,v.lat,tc0,[1],'m'); 
  contour(v.lon,v.lat,td0,[1],'c'); 
  contour(v.lon,v.lat,et0,[1],'y'); 
  contour(v.lon,v.lat,v.lm,[1],'w');
end

