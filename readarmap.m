function [v]=readarmap(tpath,expn,yr1,yr2,opt)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/backup/ECMWF/';
%expn ='ERAI_6h_DATA'; yr1=1979; yr2=2016; opt='obs';
%tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
%expn ='c192L33_am4p0_amip_HIRESMIP_H8'; yr1=1950; yr2=1951; opt='mod';

fn=strcat(tpath,expn,'/atmos.static.nc'); v.lon=ncread(fn,'lon'); 
if strcmp(opt,'obs')
  lat=ncread(fn,'lat'); v.lat=flipud(lat);
  a=ncread(fn,'land_mask'); a=a'; v.lm=flipud(a);
else
  v.lat=ncread(fn,'lat'); a=ncread(fn,'land_mask'); v.lm=a';
end
v.lm(v.lm>=0.5)=1; v.lm(v.lm<0.5)=0;

v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
R0=6371.0e3; dtor=1./180.*pi;
dlat=v.lat(round(v.nlat/2))-v.lat(round(v.nlat/2)-1);
dlon=v.lon(round(v.nlon/2))-v.lon(round(v.nlon/2)-1);
for i=1:v.nlat
  rad=v.lat(i)*dtor; %rad1=(v.lat(i)-0.5*dlat)*dtor;
  v.aa0(i,1:v.nlon)=(R0*cos(rad)*dlon*dtor) * (R0*dlat*dtor);
  v.dx (i,1:v.nlon)=(R0*cos(rad)*dlon*dtor);
  v.dy (i,1:v.nlon)=(R0*dlat*dtor);
  v.f  (i,1:v.nlon)= 2*pi/86400*sin(rad);
end
%i=v.nlat; rad1=(v.lat(i)+0.5*dlat)*dtor; v.dx1(i+1,1:v.nlon)=(R0*cos(rad1)*dlon*dtor);

amean=mean(mean(v.aa0));
v.aa = v.aa0/amean;

%yr1=1950; yr2=2014;
v.yr1=yr1; v.yr2=yr2; v.nyr=yr2-yr1+1;
mon=[31 28 31 30 31 30 31 31 30 31 30 31]; ddd=cumsum(mon);
d_beg=[1 ddd+1]; d_end=ddd; lat=v.lat; lon=v.lon;
for t=1:v.nyr
  yrt=yr1+t-1; 
  if (yrt<10)
    yr=strcat('000',num2str(yrt));
  elseif (yrt<100)
    yr=strcat('00',num2str(yrt));
  elseif (yrt<1000)
    yr=strcat('0',num2str(yrt));
  else
    yr=num2str(yrt);
  end

  fn=strcat(tpath,expn,'/AR/',expn,'_AR_',yr,'.nc');disp(fn);
  v.time=ncread(fn,'time'); v.nt=length(v.time); b=ncread(fn,'lat');
  a=ncread(fn,'shape'); shape=permute(a,[3 2 1]); 
  id=isnan(shape); shape(id)=0; size(shape)
  varn='ivty';
  fn=strcat(tpath,expn,'/atmos_data/','atmos.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
  a=ncread(fn,varn); ivty=permute(a,[3 2 1]); v.nt=length(ivty(:,1,1));
  varn='ivtx';
  fn=strcat(tpath,expn,'/atmos_data/','atmos.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
  a=ncread(fn,varn); ivtx=permute(a,[3 2 1]);
  ivt=sqrt(ivtx.*ivtx+ivty.*ivty);
  
  dx=repmat(v.dx,[1 1 v.nt]); dx=shiftdim(dx,2);
  dy=repmat(v.dy,[1 1 v.nt]); dy=shiftdim(dy,2); dA=dx.*dy;
  a=ivtx.*dy; a(:,:,end+1)=a(:,:,1); divtx=-diff(a,1,3)./dA*86400;
  a=ivty.*dx; a(:,end+1,:)=a(:,1,:); divty=-diff(a,1,2)./dA*86400;
  divt=divtx +divty; a=squeeze(mean(divt,1)); mean(mean(a.*v.aa))

% $$$   a=ivtx; a(:,:,end+1)=a(:,:,1);
% $$$   b=ivty; b(:,end+1,:)=b(:,end,:);
% $$$   aa=squeeze(mean(dif_zflx,1)); mean(mean(aa.*v.aa))
% $$$   bb=squeeze(mean(dif_mflx,1)); mean(mean(bb.*v.aa))
% $$$   cc=squeeze(mean(divt,1));     mean(mean(cc.*v.aa))
% $$$   figure; pcolor(v.lon,v.lat,aa); shading flat; colorbar; caxis([-10 10]);
% $$$   figure; pcolor(v.lon,v.lat,bb); shading flat; colorbar; caxis([-10 10]);
% $$$   figure; pcolor(v.lon,v.lat,cc); shading flat; colorbar; caxis([-10 10]);

  if strcmp(opt,'obs')
    varn='pr';
    fn=strcat(tpath,expn,'/atmos_data/','atmos.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); pr=permute(a,[3 2 1]);
    a=diff(pr,1,1); %note ERA-I precip is accumulated forecast precip
    pr(2:2:end,:,:)=a(1:2:end,:,:); pr=pr*1000/(6*3600)*86400;  prav6h=pr;
    varn='prw';
    fn=strcat(tpath,expn,'/atmos_data/','atmos.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); prw=permute(a,[3 2 1]);
  else
    varn='pr';
    fn=strcat(tpath,expn,'/atmos_data/6hr_avg/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); prav6h=permute(a,[3 2 1])*86400;
    varn='hfls';
    fn=strcat(tpath,expn,'/atmos_data/6hr_avg/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); evav6h=permute(a,[3 2 1])/LV0*86400;
    varn='prsn';
    fn=strcat(tpath,expn,'/atmos_data/6hr_avg/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); prsn=permute(a,[3 2 1])*86400;

    varn='pr';
    fn=strcat(tpath,expn,'/atmos_data/6hr/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); prin6h=permute(a,[3 2 1])*86400;
    varn='hfls';
    fn=strcat(tpath,expn,'/atmos_data/6hr/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); evin6h=permute(a,[3 2 1])/LV0*86400;
    varn='prw';
    fn=strcat(tpath,expn,'/atmos_data/6hr/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); prw=permute(a,[3 2 1]);
    varn='ttwt';
    fn=strcat(tpath,expn,'/atmos_data/6hr/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); ttwt=permute(a,[3 2 1]);
    varn='ttws';
    fn=strcat(tpath,expn,'/atmos_data/6hr/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); ttws=permute(a,[3 2 1]);
    varn='tcrh';
    fn=strcat(tpath,expn,'/atmos_data/6hr/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); tcrh=permute(a,[3 2 1]);
    varn='wap_unmsk';
    fn=strcat(tpath,expn,'/atmos_data/6hr/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn);
    b=squeeze(a(:,:,1,:)); w850=-permute(b,[3 2 1]);
    b=squeeze(a(:,:,2,:)); w500=-permute(b,[3 2 1]);
    b=squeeze(a(:,:,3,:)); w250=-permute(b,[3 2 1]);
    varn='ua_unmsk';
    fn=strcat(tpath,expn,'/atmos_data/6hr/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn);
    b=squeeze(a(:,:,1,:)); u850= permute(b,[3 2 1]);
    b=squeeze(a(:,:,2,:)); u500= permute(b,[3 2 1]);
    b=squeeze(a(:,:,3,:)); u250= permute(b,[3 2 1]);
    varn='va_unmsk';
    fn=strcat(tpath,expn,'/atmos_data/6hr/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn);
    b=squeeze(a(:,:,1,:)); v850= permute(b,[3 2 1]);
    b=squeeze(a(:,:,2,:)); v500= permute(b,[3 2 1]);
    b=squeeze(a(:,:,3,:)); v250= permute(b,[3 2 1]);
    wind850=sqrt(u850.^2+v850.^2);
    wind500=sqrt(u500.^2+v500.^2);
    wind250=sqrt(u250.^2+v250.^2);
    varn='ta_unmsk';
    fn=strcat(tpath,expn,'/atmos_data/6hr/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn);
    b=squeeze(a(:,:,1,:)); t850= permute(b,[3 2 1]);
    b=squeeze(a(:,:,2,:)); t500= permute(b,[3 2 1]);
    b=squeeze(a(:,:,3,:)); t250= permute(b,[3 2 1]);
    varn='hus_unmsk';
    fn=strcat(tpath,expn,'/atmos_data/6hr/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn);
    b=squeeze(a(:,:,1,:)); q850= permute(b,[3 2 1]);
    b=squeeze(a(:,:,2,:)); q500= permute(b,[3 2 1]);
    b=squeeze(a(:,:,3,:)); q250= permute(b,[3 2 1]);

    varn='pr';
    fn=strcat(tpath,expn,'/atmos_data/daily/','atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); pravdd=permute(a,[3 2 1])*86400;;
    varn='tasmax';
    fn=strcat(tpath,expn,'/atmos_data/daily/','atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); tasmax=permute(a,[3 2 1]);  
    varn='tasmin';
    fn=strcat(tpath,expn,'/atmos_data/daily/','atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); tasmin=permute(a,[3 2 1]);    
    varn='tas';
    fn=strcat(tpath,expn,'/atmos_data/daily/','atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); tas=permute(a,[3 2 1]);    
  end
  for m=1:12
    disp(strcat(yr,':mon=', num2str(m))); dbeg=d_beg(m); dend=d_end(m);
    tbeg=(dbeg-1)*4+1; days=strcat(num2str(dbeg),'-',num2str(dend));
    tend=dend*4;       disp(strcat(days,';',num2str(tbeg),':',num2str(tend)));
    id=shape(tbeg:tend,:,:); id(id>0)=1; disp(size(id))
    clear id_day
    for k=1:dend-dbeg+1
      n=(k-1)*4+1; 
      id_day(k,:,:)=id(n,:,:)|id(n+1,:,:)|id(n+2,:,:)|id(n+3,:,:);
    end
    
    arf=squeeze(mean(id,1)); %unit: frequency measured by fraction of time-steps
    v.freq_ar(m,t,:,:)=arf;
    
    a=ivty(tbeg:tend,:,:); s=get_mon_stat(a,id);
    v.ivty_ar   (m,t,:,:)=s.ar;
    v.ivty_armax(m,t,:,:)=s.armax;
    v.ivty_av   (m,t,:,:)=s.av;
    v.ivty_99   (m,t,:,:)=s.p99;

    a=ivtx(tbeg:tend,:,:); s=get_mon_stat(a,id);
    v.ivtx_ar   (m,t,:,:)=s.ar;
    v.ivtx_armax(m,t,:,:)=s.armax;
    v.ivtx_av   (m,t,:,:)=s.av;
    v.ivtx_99   (m,t,:,:)=s.p99;

    a=ivt(tbeg:tend,:,:);  s=get_mon_stat(a,id,2);
    v.ivt_ar   (m,t,:,:)=s.ar;
    v.ivt_armax(m,t,:,:)=s.armax;
    v.ivt_av   (m,t,:,:)=s.av;
    v.ivt_85   (m,t,:,:)=s.p85;
    v.ivt_99   (m,t,:,:)=s.p99;

    a=divty(tbeg:tend,:,:); s=get_mon_stat(a,id,1);
    v.divy_ar(m,t,:,:)=s.ar;
    v.divy_av(m,t,:,:)=s.av;

    a=divtx(tbeg:tend,:,:); s=get_mon_stat(a,id,1);
    v.divx_ar(m,t,:,:)=s.ar;
    v.divx_av(m,t,:,:)=s.av;

    a=divt(tbeg:tend,:,:);  s=get_mon_stat(a,id,2);
    v.divt_ar   (m,t,:,:)=s.ar;
    v.divt_armax(m,t,:,:)=s.armax;
    v.divt_av   (m,t,:,:)=s.av;
    v.divt_85   (m,t,:,:)=s.p85;
    v.divt_99   (m,t,:,:)=s.p99;
    
    %conditional sampling of other AR properties
    a=prav6h(tbeg:tend,:,:); s=get_mon_stat(a,id,3);
    v.prav6h_ar   (m,t,:,:)=s.ar;   %ar average
    v.prav6h_ar25 (m,t,:,:)=s.arpct(1,:,:);
    v.prav6h_ar50 (m,t,:,:)=s.arpct(2,:,:);
    v.prav6h_ar75 (m,t,:,:)=s.arpct(3,:,:);
    v.prav6h_ar90 (m,t,:,:)=s.arpct(4,:,:);
    v.prav6h_ar99 (m,t,:,:)=s.arpct(5,:,:);
    v.prav6h_armax(m,t,:,:)=s.armax;%ar max
    v.prav6h_av   (m,t,:,:)=s.av;   %monthly average

    v.prav6h_25   (m,t,:,:)=s.pct(1,:,:); %90 percentile of 6h averaged pr
    v.prav6h_50   (m,t,:,:)=s.pct(2,:,:); %99 percentile of 6h averaged pr
    v.prav6h_75   (m,t,:,:)=s.pct(3,:,:); %99.9 percentile of 6h averaged pr
    v.prav6h_90   (m,t,:,:)=s.pct(4,:,:); %90 percentile of 6h averaged pr
    v.prav6h_99   (m,t,:,:)=s.pct(5,:,:); %99 percentile of 6h averaged pr
    v.prav6h_999  (m,t,:,:)=s.pct(6,:,:); %99.9 percentile of 6h averaged pr
    v.prav6h_f1   (m,t,:,:)=s.f1;   %rain frequency
    v.prav6h_f2   (m,t,:,:)=s.f2;   %moderate rain frequency
    v.prav6h_f3   (m,t,:,:)=s.f3;   %heavy rain frequency
    v.prav6h_f4   (m,t,:,:)=s.f4;   %cat4 rain frequency
    v.prav6h_f5   (m,t,:,:)=s.f5;   %cat5 rain frequency
   
    a=prw(tbeg:tend,:,:);  s=get_mon_stat(a,id);
    v.prw_ar   (m,t,:,:)=s.ar;
    v.prw_armax(m,t,:,:)=s.armax;
    v.prw_av   (m,t,:,:)=s.av;
    v.prw_99   (m,t,:,:)=s.p99;
  
    if strcmp(opt,'mod')
      a=evav6h(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.evav6h_ar   (m,t,:,:)=s.ar;
      v.evav6h_armax(m,t,:,:)=s.armax;
      v.evav6h_av   (m,t,:,:)=s.av;
      v.evav6h_99   (m,t,:,:)=s.p99;

      a=evin6h(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.evin6h_ar   (m,t,:,:)=s.ar;
      v.evin6h_armax(m,t,:,:)=s.armax;
      v.evin6h_av   (m,t,:,:)=s.av;
      v.evin6h_99   (m,t,:,:)=s.p99;

      a=prin6h(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.prin6h_ar   (m,t,:,:)=s.ar;
      v.prin6h_armax(m,t,:,:)=s.armax;
      v.prin6h_av   (m,t,:,:)=s.av;
      v.prin6h_99   (m,t,:,:)=s.p99;
      
      a=prsn(tbeg:tend,:,:); s=get_mon_stat(a,id,3);
      v.prsn_ar   (m,t,:,:)=s.ar;
      v.prsn_armax(m,t,:,:)=s.armax;
      v.prsn_av   (m,t,:,:)=s.av;
      v.prsn_99   (m,t,:,:)=s.pct(5,:,:);
      v.prsn_999  (m,t,:,:)=s.pct(6,:,:);

      a=w850(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.w850_ar   (m,t,:,:)=s.ar;
      v.w850_armax(m,t,:,:)=s.armax;
      v.w850_av   (m,t,:,:)=s.av;
      v.w850_99   (m,t,:,:)=s.p99;

      a=w500(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.w500_ar   (m,t,:,:)=s.ar;
      v.w500_armax(m,t,:,:)=s.armax;
      v.w500_av   (m,t,:,:)=s.av;
      v.w500_99   (m,t,:,:)=s.p99;

      a=w250(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.w250_ar   (m,t,:,:)=s.ar;
      v.w250_armax(m,t,:,:)=s.armax;
      v.w250_av   (m,t,:,:)=s.av;
      v.w250_99   (m,t,:,:)=s.p99;
      
      a=wind850(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.wind850_ar   (m,t,:,:)=s.ar;
      v.wind850_armax(m,t,:,:)=s.armax;
      v.wind850_av   (m,t,:,:)=s.av;
      v.wind850_99   (m,t,:,:)=s.p99;

      a=wind500(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.wind500_ar   (m,t,:,:)=s.ar;
      v.wind500_armax(m,t,:,:)=s.armax;
      v.wind500_av   (m,t,:,:)=s.av;
      v.wind500_99   (m,t,:,:)=s.p99;

      a=wind250(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.wind250_ar   (m,t,:,:)=s.ar;
      v.wind250_armax(m,t,:,:)=s.armax;
      v.wind250_av   (m,t,:,:)=s.av;
      v.wind250_99   (m,t,:,:)=s.p99;
      
      a=t850(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.t850_ar   (m,t,:,:)=s.ar;
      v.t850_armax(m,t,:,:)=s.armax;
      v.t850_av   (m,t,:,:)=s.av;
      v.t850_99   (m,t,:,:)=s.p99;

      a=t500(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.t500_ar   (m,t,:,:)=s.ar;
      v.t500_armax(m,t,:,:)=s.armax;
      v.t500_av   (m,t,:,:)=s.av;
      v.t500_99   (m,t,:,:)=s.p99;

      a=t250(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.t250_ar   (m,t,:,:)=s.ar;
      v.t250_armax(m,t,:,:)=s.armax;
      v.t250_av   (m,t,:,:)=s.av;
      v.t250_99   (m,t,:,:)=s.p99;

      a=q850(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.q850_ar   (m,t,:,:)=s.ar;
      v.q850_armax(m,t,:,:)=s.armax;
      v.q850_av   (m,t,:,:)=s.av;
      v.q850_99   (m,t,:,:)=s.p99;

      a=q500(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.q500_ar   (m,t,:,:)=s.ar;
      v.q500_armax(m,t,:,:)=s.armax;
      v.q500_av   (m,t,:,:)=s.av;
      v.q500_99   (m,t,:,:)=s.p99;

      a=q250(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.q250_ar   (m,t,:,:)=s.ar;
      v.q250_armax(m,t,:,:)=s.armax;
      v.q250_av   (m,t,:,:)=s.av;
      v.q250_99   (m,t,:,:)=s.p99;
      
      a=ttwt(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.ttwt_ar   (m,t,:,:)=s.ar;
      v.ttwt_armax(m,t,:,:)=s.armax;
      v.ttwt_av   (m,t,:,:)=s.av;
      v.ttwt_99   (m,t,:,:)=s.p99;
      
      a=tcrh(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.tcrh_ar   (m,t,:,:)=s.ar;
      v.tcrh_armax(m,t,:,:)=s.armax;
      v.tcrh_av   (m,t,:,:)=s.av;
      v.tcrh_99   (m,t,:,:)=s.p99;

      a=ttws(tbeg:tend,:,:); s=get_mon_stat(a,id);
      v.ttws_ar   (m,t,:,:)=s.ar;
      v.ttws_armax(m,t,:,:)=s.armax;
      v.ttws_av   (m,t,:,:)=s.av;
      v.ttws_99   (m,t,:,:)=s.p99;
      
      a=pravdd(dbeg:dend,:,:); s=get_mon_stat(a,id_day);
      v.pravdd_ar   (m,t,:,:)=s.ar;
      v.pravdd_armax(m,t,:,:)=s.armax;
      v.pravdd_av   (m,t,:,:)=s.av;
      v.pravdd_99   (m,t,:,:)=s.p99;

      a=tasmax(dbeg:dend,:,:); s=get_mon_stat(a,id_day);
      v.tasmax_ar   (m,t,:,:)=s.ar;
      v.tasmax_armax(m,t,:,:)=s.armax;
      v.tasmax_av   (m,t,:,:)=s.av;
      v.tasmax_99   (m,t,:,:)=s.p99;
      
      a=tasmin(dbeg:dend,:,:); s=get_mon_stat(a,id_day,-1);
      v.tasmin_ar   (m,t,:,:)=s.ar;
      v.tasmin_armax(m,t,:,:)=s.armax;
      v.tasmin_av   (m,t,:,:)=s.av;
      v.tasmin_01   (m,t,:,:)=s.p01;
      
      a=tas(dbeg:dend,:,:); s=get_mon_stat(a,id_day);
      v.tas_ar   (m,t,:,:)=s.ar;
      v.tas_armax(m,t,:,:)=s.armax;
      v.tas_av   (m,t,:,:)=s.av;
      v.tas_99   (m,t,:,:)=s.p99;
    end
  end
end

a=v.freq_ar;    v.freq_ar_clm     = get_clm_ann(a);

a=v.ivty_ar;    v.ivty_ar_clm     = get_clm_ann(a);
a=v.ivty_armax; v.ivty_armax_clm  = get_clm_ann(a);
a=v.ivty_av;    v.ivty_av_clm     = get_clm_ann(a);
a=v.ivty_99;    v.ivty_99_clm     = get_clm_ann(a);

a=v.ivtx_ar;    v.ivtx_ar_clm     = get_clm_ann(a);
a=v.ivtx_armax; v.ivtx_armax_clm  = get_clm_ann(a);
a=v.ivtx_av;    v.ivtx_av_clm     = get_clm_ann(a);
a=v.ivtx_99;    v.ivtx_99_clm     = get_clm_ann(a);

a=v.ivt_ar;     v.ivt_ar_clm      = get_clm_ann(a);
a=v.ivt_armax;  v.ivt_armax_clm   = get_clm_ann(a);
a=v.ivt_av;     v.ivt_av_clm      = get_clm_ann(a);
a=v.ivt_85;     v.ivt_85_clm      = get_clm_ann(a);
a=v.ivt_99;     v.ivt_99_clm      = get_clm_ann(a);

a=v.divy_ar;    v.divy_ar_clm     = get_clm_ann(a);
a=v.divy_av;    v.divy_av_clm     = get_clm_ann(a);

a=v.divx_ar;    v.divx_ar_clm     = get_clm_ann(a);
a=v.divx_av;    v.divx_av_clm     = get_clm_ann(a);

a=v.divt_ar;    v.divt_ar_clm     = get_clm_ann(a);
a=v.divt_armax; v.divt_armax_clm  = get_clm_ann(a);
a=v.divt_av;    v.divt_av_clm     = get_clm_ann(a);
a=v.divt_99;    v.divt_99_clm     = get_clm_ann(a);

a=v.prav6h_ar;    v.prav6h_ar_clm    = get_clm_ann(a);
a=v.prav6h_armax; v.prav6h_armax_clm = get_clm_ann(a);
a=v.prav6h_av;    v.prav6h_av_clm    = get_clm_ann(a);
a=v.prav6h_90;    v.prav6h_90_clm    = get_clm_ann(a);
a=v.prav6h_99;    v.prav6h_99_clm    = get_clm_ann(a);
a=v.prav6h_999;   v.prav6h_999_clm   = get_clm_ann(a);
a=v.prav6h_f1;    v.prav6h_f1_clm    = get_clm_ann(a);
a=v.prav6h_f2;    v.prav6h_f2_clm    = get_clm_ann(a);
a=v.prav6h_f3;    v.prav6h_f3_clm    = get_clm_ann(a);
a=v.prav6h_f4;    v.prav6h_f4_clm    = get_clm_ann(a);
a=v.prav6h_f5;    v.prav6h_f5_clm    = get_clm_ann(a);

a=v.prw_ar;       v.prw_ar_clm    = get_clm_ann(a);
a=v.prw_armax;    v.prw_armax_clm = get_clm_ann(a);
a=v.prw_av;       v.prw_av_clm    = get_clm_ann(a);
a=v.prw_99;       v.prw_99_clm    = get_clm_ann(a);

if strcmp(opt,'mod')
  a=v.evav6h_ar;    v.evav6h_ar_clm    = get_clm_ann(a);
  a=v.evav6h_armax; v.evav6h_armax_clm = get_clm_ann(a);
  a=v.evav6h_av;    v.evav6h_av_clm    = get_clm_ann(a);
  a=v.evav6h_99;    v.evav6h_99_clm    = get_clm_ann(a);
  
  a=v.evin6h_ar;    v.evin6h_ar_clm    = get_clm_ann(a);
  a=v.evin6h_armax; v.evin6h_armax_clm = get_clm_ann(a);
  a=v.evin6h_av;    v.evin6h_av_clm    = get_clm_ann(a);
  a=v.evin6h_99;    v.evin6h_99_clm    = get_clm_ann(a);
  
  a=v.prin6h_ar;    v.prin6h_ar_clm    = get_clm_ann(a);
  a=v.prin6h_armax; v.prin6h_armax_clm = get_clm_ann(a);
  a=v.prin6h_av;    v.prin6h_av_clm    = get_clm_ann(a);
  a=v.prin6h_99;    v.prin6h_99_clm    = get_clm_ann(a);
  
  a=v.prsn_ar;      v.prsn_ar_clm   = get_clm_ann(a);
  a=v.prsn_armax;   v.prsn_armax_clm= get_clm_ann(a);
  a=v.prsn_av;      v.prsn_av_clm   = get_clm_ann(a);
  a=v.prsn_99;      v.prsn_99_clm   = get_clm_ann(a);
  
  a=v.w850_ar;      v.w850_ar_clm   = get_clm_ann(a);
  a=v.w850_armax;   v.w850_armax_clm= get_clm_ann(a);
  a=v.w850_av;      v.w850_av_clm   = get_clm_ann(a);
  a=v.w850_99;      v.w850_99_clm   = get_clm_ann(a);
  
  a=v.w500_ar;      v.w500_ar_clm   = get_clm_ann(a);
  a=v.w500_armax;   v.w500_armax_clm= get_clm_ann(a);
  a=v.w500_av;      v.w500_av_clm   = get_clm_ann(a);
  a=v.w500_99;      v.w500_99_clm   = get_clm_ann(a);
  
  a=v.w250_ar;      v.w250_ar_clm   = get_clm_ann(a);
  a=v.w250_armax;   v.w250_armax_clm= get_clm_ann(a);
  a=v.w250_av;      v.w250_av_clm   = get_clm_ann(a);
  a=v.w250_99;      v.w250_99_clm   = get_clm_ann(a);

  a=v.wind850_ar;   v.wind850_ar_clm    = get_clm_ann(a);
  a=v.wind850_armax;v.wind850_armax_clm = get_clm_ann(a);
  a=v.wind850_av;   v.wind850_av_clm    = get_clm_ann(a);
  a=v.wind850_99;   v.wind850_99_clm    = get_clm_ann(a);

  a=v.wind500_ar;   v.wind500_ar_clm    = get_clm_ann(a);
  a=v.wind500_armax;v.wind500_armax_clm = get_clm_ann(a);
  a=v.wind500_av;   v.wind500_av_clm    = get_clm_ann(a);
  a=v.wind500_99;   v.wind500_99_clm    = get_clm_ann(a);
  
  a=v.wind250_ar;   v.wind250_ar_clm    = get_clm_ann(a);
  a=v.wind250_armax;v.wind250_armax_clm = get_clm_ann(a);
  a=v.wind250_av;   v.wind250_av_clm    = get_clm_ann(a);
  a=v.wind250_99;   v.wind250_99_clm    = get_clm_ann(a);
  
  a=v.t850_ar;      v.t850_ar_clm      = get_clm_ann(a);
  a=v.t850_armax;   v.t850_armax_clm   = get_clm_ann(a);
  a=v.t850_av;      v.t850_av_clm      = get_clm_ann(a);
  a=v.t850_99;      v.t850_99_clm      = get_clm_ann(a);
  
  a=v.t500_ar;      v.t500_ar_clm      = get_clm_ann(a);
  a=v.t500_armax;   v.t500_armax_clm   = get_clm_ann(a);
  a=v.t500_av;      v.t500_av_clm      = get_clm_ann(a);
  a=v.t500_99;      v.t500_99_clm      = get_clm_ann(a);
  
  a=v.t250_ar;      v.t500_ar_clm      = get_clm_ann(a);
  a=v.t250_armax;   v.t500_armax_clm   = get_clm_ann(a);
  a=v.t250_av;      v.t500_av_clm      = get_clm_ann(a);
  a=v.t250_99;      v.t500_99_clm      = get_clm_ann(a);

  a=v.q850_ar;      v.q850_ar_clm      = get_clm_ann(a);
  a=v.q850_armax;   v.q850_armax_clm   = get_clm_ann(a);
  a=v.q850_av;      v.q850_av_clm      = get_clm_ann(a);
  a=v.q850_99;      v.q850_99_clm      = get_clm_ann(a);
  
  a=v.q500_ar;      v.q500_ar_clm      = get_clm_ann(a);
  a=v.q500_armax;   v.q500_armax_clm   = get_clm_ann(a);
  a=v.q500_av;      v.q500_av_clm      = get_clm_ann(a);
  a=v.q500_99;      v.q500_99_clm      = get_clm_ann(a);
  
  a=v.q250_ar;      v.q500_ar_clm      = get_clm_ann(a);
  a=v.q250_armax;   v.q500_armax_clm   = get_clm_ann(a);
  a=v.q250_av;      v.q500_av_clm      = get_clm_ann(a);
  a=v.q250_99;      v.q500_99_clm      = get_clm_ann(a);
  
  a=v.ttwt_ar;      v.ttwt_ar_clm      = get_clm_ann(a);
  a=v.ttwt_armax;   v.ttwt_armax_clm   = get_clm_ann(a);
  a=v.ttwt_av;      v.ttwt_av_clm      = get_clm_ann(a);
  a=v.ttwt_99;      v.ttwt_99_clm      = get_clm_ann(a);
  
  a=v.tcrh_ar;      v.tcrh_ar_clm      = get_clm_ann(a);
  a=v.tcrh_armax;   v.tcrh_armax_clm   = get_clm_ann(a);
  a=v.tcrh_av;      v.tcrh_av_clm      = get_clm_ann(a);
  a=v.tcrh_99;      v.tcrh_99_clm      = get_clm_ann(a);
  
  a=v.ttws_ar;      v.ttws_ar_clm      = get_clm_ann(a);
  a=v.ttws_armax;   v.ttws_armax_clm   = get_clm_ann(a);
  a=v.ttws_av;      v.ttws_av_clm      = get_clm_ann(a);
  a=v.ttws_99;      v.ttws_99_clm      = get_clm_ann(a);
  
  a=v.tas_ar;       v.tas_ar_clm       = get_clm_ann(a);
  a=v.tas_armax;    v.tas_armax_clm    = get_clm_ann(a);
  a=v.tas_av;       v.tas_av_clm       = get_clm_ann(a);
  a=v.tas_99;       v.tas_99_clm       = get_clm_ann(a);
  
  a=v.tasmax_ar;    v.tasmax_ar_clm    = get_clm_ann(a);
  a=v.tasmax_armax; v.tasmax_armax_clm = get_clm_ann(a);
  a=v.tasmax_av;    v.tasmax_av_clm    = get_clm_ann(a);
  a=v.tasmax_99;    v.tasmax_99_clm    = get_clm_ann(a);
  
  a=v.tasmin_ar;     v.tasmin_ar_clm = get_clm_ann(a);
  a=v.tasmin_av;     v.tasmin_av_clm = get_clm_ann(a);
  a=v.tasmin_01;     v.tasmin_01_clm = get_clm_ann(a);
end

%fnmat=strcat('/work/miz/mat_hiresmip/',expn,'_readarmap.mat')
epath='/work/miz/mat_hiresmip/';
fnmat=strcat(epath,expn,'_',num2str(yr1),'_',num2str(yr2),'_readarmap.mat')

save(fnmat,'v','-v7.3'); %save(fnmat,'v');

return

tpath='/archive/Ming.Zhao/backup/ECMWF/';
expn ='ERAI_6h_DATA'; yr1=1979; yr2=2016; opt='obs';
v=readarmap(tpath,expn,yr1,yr2,opt)

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn ='c192L33_am4p0_amip_HIRESMIP_H8'; yr1=1950; yr2=2014; opt='mod';
v=readarmap(tpath,expn,yr1,yr2,opt)


tpath='/work/miz/mat_hiresmip/'; fext='_arfreq_readarmap.mat';
expn='ERAI_6h_DATA'; fn=strcat(tpath,expn,fext); load(fn); vo=v;
expn='c192L33_am4p0_amip_HIRESMIP_H8'; fn=strcat(tpath,expn,fext); load(fn);v1=v;

a=(vo.pcp_ar_ann/86400*5.80205599194531e-06+0.190110166548979)*1000; 
y1=mean(a,2); 
a=v1.pcp_ar_ann; y2=mean(a,2); 
figure; plot(vo.lat,y1); hold on; plot(v1.lat,y2,'r');

v=vo; figure; pcolor(v.lon,v.lat,v.fq_ar_ann/1400); shading flat; colorbar; caxis([0 0.15]);
v=v1; figure; pcolor(v.lon,v.lat,v.fq_ar_ann/1400); shading flat; colorbar; caxis([0 0.15]);

v1.x.fq_ar_ann=interp_grid(v1.fq_ar_ann,vo.lon,vo.lat,v1.lon,v1.lat,1);

xmin=0; xmax=360; ymin=-90; ymax=90;
s.cmin=0; s.cmax=0.15; s.c1=-0.05; s.c2=0.05; nn=32; 
caxis([s.cmin s.cmax]); cmap =bluewhitered(nn); cmap =jet(nn); 
caxis([s.c1 s.c2]);     cmap1=bluewhitered(nn); cmap1=jet(nn); 

lat=vo.lat; lon=vo.lon; lm=vo.lm; vbin=[0:0.01:0.15]; 

pms=[ 0, 0, 400, 800]*1.5; warning off all; fsize=12;
handle = figure('Position', pms,'visible','on');
row=3; col=1; 
subplot(row,col,1); z1=vo.fq_ar_ann/1400;
contourf(lon,lat,z1,vbin); hold on; colormap(cmap); freezeColors; 
contour(lon,lat,lm,'k'); shading flat; caxis([s.cmin s.cmax]);
axis([xmin xmax ymin ymax]); h=colorbar; %cbfreeze(h,cmap); 

%title(strcat(s.s1,a),'FontSize',fsize);
subplot(row,col,2); z2=v1.x.fq_ar_ann/1400;
contourf(lon,lat,z2,vbin); hold on; colormap(cmap); freezeColors; 
contour(lon,lat,lm,'k'); shading flat; caxis([s.cmin s.cmax]);
axis([xmin xmax ymin ymax]); h=colorbar; %cbfreeze(h,cmap); 
%title(s.s2,'FontSize',fsize);
subplot(row,col,3); z3=z2-z1; vbin_dif=[s.c1:0.01:s.c2];
contourf(lon,lat,z3,vbin_dif); hold on; colormap(cmap1); freezeColors; 
contour(lon,lat,lm,'k'); shading flat; caxis([s.c1 s.c2]); 
axis([xmin xmax ymin ymax]); h=colorbar; %cbfreeze(h,cmap); 
%title(s.s3,'FontSize',fsize);


f.lat=latc; f.lon=lonc; f.latb=latb; f.lonb=lonb; f.nlat=length(latc); f.nlon=length(lonc);
fq_ar   (1:12,1:v.nyr,1:f.nlat,1:f.nlon)=0;
fq_ar_lf(1:12,1:v.nyr,1:f.nlat,1:f.nlon)=0;

for j=1:f.nlat
  id_lat = (lat>latb(j) & lat<=latb(j+1));
  for i=1:f.nlon
    id_lon = (lon>lonb(i) & lon<=lonb(i+1));
    c=b(id_lat,id_lon);
    fq_ar(m,t,j,i)=mean(mean(c));
  end
end
  
