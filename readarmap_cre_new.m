function [v]=readarmap_cre_new(tpath,expn,yr1,yr2,pct,opt)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/backup/ECMWF/';
%expn ='ERAI_6h_DATA'; yr1=1979; yr2=1979; opt='obs';
%tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
%expn ='c192L33_am4p0_amip_HIRESMIP_H8_newpp'; yr1=1979; yr2=1980; opt='mod';
%pct  =[99 99.9];

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

v.tpath=tpath; v.expn=expn; v.yr1=yr1; v.yr2=yr2; v.nyr=yr2-yr1+1; 
mon=[31 28 31 30 31 30 31 31 30 31 30 31]; ddd=cumsum(mon);
yea=[365]; ddd=cumsum(yea);
d_beg=[1 ddd+1]; d_end=ddd;
%sea=[59 92 92 91]; ddd=cumsum(sea);d_beg=[1 ddd+1]; d_end=ddd;
m=1;
for m=1:length(d_end)
  v.d_beg(m)=d_beg(m); v.d_end(m)=d_end(m); %m=1; %v.d_end(m)=v.d_beg(m)+30*3; v
  %AR feature
  ff='6hr'; exd='/AR_climlmt/'; varn='AR'; exf1=''; exf2=''; exf3='';
  [shape time]=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff);
  id=isnan(shape); shape(id)=0; 
  id=shape(:,:,:); id(id>0)=1; disp('id size:'); size(id)
  v.arfq (m,:,:)=squeeze(mean(id,1)); 
  v.arfqs(m,:,:)=squeeze(sum (id,1));
  %new addition
  %precip%%%%%%%%%%%%%%%%%%%%%%%
  varn='pr'; ff='6hr'; exd='/atmos_data/6hr_avg/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400;  
  v.pr6hr_av (m,:,:)  =squeeze(mean(a, 1)); %all time average
  v.pr6hr_pct(m,:,:,:)=prctile(a,pct,1); v.pct=pct;
  k=1; P99 =squeeze(v.pr6hr_pct(m,k,:,:));
  k=2; P999=squeeze(v.pr6hr_pct(m,k,:,:));
  nlat=length(a(1,:,1));
  nlon=length(a(1,1,:));
  for j=1:nlat
    for i=1:nlon
      idallp=(a(:,j,i)>=P99 (j,i));
      idboth=idallp & id(:,j,i);
      v.pr6hr_fp99_ar(j,i)=sum(idboth)/sum(idallp);
      id99(:,j,i)=idboth;
      idallp=(a(:,j,i)>=P999(j,i));
      idboth=idallp & id(:,j,i);
      v.pr6hr_fp999_ar(j,i)=sum(idboth)/sum(idallp);
      id999(:,j,i)=idboth;
    end
  end
  v.id_sum   =squeeze(sum(id,1));
  v.id99_sum =squeeze(sum(id99, 1));
  v.id999_sum=squeeze(sum(id999,1));
  %PR==========
  varn='pr'; ff='6hr'; exd='/atmos_data/6hr_avg/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400; s=get_amon_stat_new(a,id,pct,0,id99,id999);
  v.pr6hr_ar        (m,:,:) =s.ar;         %ar total
  v.pr6hr_aravg     (m,:,:) =s.aravg;      %ar average
  v.pr6hr_aravg_p99 (m,:,:) =s.aravg_p99;  %ar average
  v.pr6hr_aravg_p999(m,:,:) =s.aravg_p999; %ar average
  v.pr6hr_armax     (m,:,:) =s.armax;      %ar max
  %end of new addition
  %IVTY========
  ff='6hr'; exd='/atmos_data/'; varn='ivty'; exf1='atmos.'; exf2='010100-'; exf3='123123.';
  ivty=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); 
  s=get_amon_stat_new(ivty,id,pct,0,id99,id999);
  v.ivty_ar        (m,:,:)  =s.ar;         %ar total
  v.ivty_aravg     (m,:,:)  =s.aravg;      %ar average
  v.ivty_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
  v.ivty_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
  v.ivty_armax     (m,:,:)  =s.armax;      %ar max
  v.ivty_av        (m,:,:)  =s.av;         %all average
  v.ivty_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  %IVTX========
  ff='6hr'; exd='/atmos_data/'; varn='ivtx'; exf1='atmos.'; exf2='010100-'; exf3='123123.';
  ivtx=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff);
  s=get_amon_stat_new(ivtx,id,pct,0,id99,id999);
  v.ivtx_ar        (m,:,:)  =s.ar;         %ar total
  v.ivtx_aravg     (m,:,:)  =s.aravg;      %ar average
  v.ivtx_aravg_p99 (m,:,:,:)=s.aravg_p99;  %ar average
  v.ivtx_aravg_p999(m,:,:,:)=s.aravg_p999; %ar average
  v.ivtx_armax     (m,:,:)  =s.armax;      %ar max
  v.ivtx_av        (m,:,:)  =s.av;         %all average
  v.ivtx_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  %IVT total========
  a=sqrt(ivtx.*ivtx+ivty.*ivty); clear ivtx ivty;
  s=get_amon_stat_new(a,id,pct,0,id99,id999);
  v.ivt_ar        (m,:,:)   =s.ar;         %ar total
  v.ivt_aravg     (m,:,:)   =s.aravg;      %ar average
  v.ivt_aravg_p99 (m,:,:)   =s.aravg_p99;  %ar average
  v.ivt_aravg_p999(m,:,:)   =s.aravg_p999; %ar average
  v.ivt_armax     (m,:,:)   =s.armax;      %ar max
  v.ivt_av        (m,:,:)   =s.av;         %all average
  v.ivt_pct       (m,:,:,:) =s.pct;        %[25 50 75 90 99 99.9] percentile;
% $$$ %divergence of total IVT 
% $$$ dx=repmat(v.dx,[1 1 nt]); dx=shiftdim(dx,2);
% $$$ dy=repmat(v.dy,[1 1 nt]); dy=shiftdim(dy,2); dA=dx.*dy;
% $$$ a=ivtx.*dy; a(:,:,end+1)=a(:,:,1); divtx=-diff(a,1,3)./dA*86400;
% $$$ a=ivty.*dx; a(:,end+1,:)=a(:,1,:); divty=-diff(a,1,2)./dA*86400;
% $$$ divt=divtx +divty; a=squeeze(mean(divt,1)); mean(mean(a.*v.aa))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$   a=ivtx; a(:,:,end+1)=a(:,:,1);
% $$$   b=ivty; b(:,end+1,:)=b(:,end,:);
% $$$   aa=squeeze(mean(dif_zflx,1)); mean(mean(aa.*v.aa))
% $$$   bb=squeeze(mean(dif_mflx,1)); mean(mean(bb.*v.aa))
% $$$   cc=squeeze(mean(divt,1));     mean(mean(cc.*v.aa))
% $$$   figure; pcolor(v.lon,v.lat,aa); shading flat; colorbar; caxis([-10 10]);
% $$$   figure; pcolor(v.lon,v.lat,bb); shading flat; colorbar; caxis([-10 10]);
% $$$   figure; pcolor(v.lon,v.lat,cc); shading flat; colorbar; caxis([-10 10]);
  if strcmp(opt,'obs')
% $$$     %precip%%%%%%%%%%%%%%%%%%%%%%%
% $$$     varn='pr'; ff='6hr'; exd='/atmos_data/'; exf1='atmos.'; exf2='010100-'; exf3='123123.';
% $$$     a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400; s=get_amon_stat_new(a,id,pct,1); 
% $$$     v.pr6hr_ar   (m,:,:)  =s.ar;    %ar total
% $$$     v.pr6hr_aravg(m,:,:)  =s.aravg; %ar average
% $$$     v.pr6hr_arpct(m,:,:,:)=s.arpct; %[25 50 75 90 99 99.9] percentile;
% $$$     v.pr6hr_armax(m,:,:)  =s.armax; %ar max
% $$$     v.pr6hr_av   (m,:,:)  =s.av;    %all average
% $$$     v.pr6hr_pct  (m,:,:,:)=s.pct;   %[25 50 75 90 99 99.9] percentile;
% $$$     v.pr6hr_f    (m,:,:,:)=s.f;     %rain, moderate, heavy, cat4,5 rain
% $$$     v.pr6hr_fr_ar(m,:,:,:)=s.fr_ar; 
    %%precipitable water%%%%%%%%%%%
    varn='prw'; ff='6hr'; exd='/atmos_data/'; exf1='atmos.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); s=get_amon_stat_new(a,id,pct,0,id99,id999);
    v.prw_ar   (m,:,:)  =s.ar;    %ar average
    v.prw_aravg(m,:,:)  =s.aravg; %ar average
    v.prw_arpct(m,:,:,:)=s.arpct; %[25 50 75 90 99 99.9] percentile;
    v.prw_armax(m,:,:)  =s.armax; %ar max
    v.prw_av   (m,:,:)  =s.av;    %all average
    v.prw_pct  (m,:,:,:)=s.pct;   %[25 50 75 90 99 99.9] percentile;    
  else
% $$$     %precip%%%%%%%%%%%%%%%%%%%%%%%
% $$$     varn='pr'; ff='6hr'; exd='/atmos_data/6hr_avg/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
% $$$     a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400; s=get_amon_stat_new(a,id,pct,1); 
% $$$     v.pr6hr_ar   (m,:,:)  =s.ar;    %ar total
% $$$     v.pr6hr_aravg(m,:,:)  =s.aravg; %ar average
% $$$     v.pr6hr_arpct(m,:,:,:)=s.arpct; %[25 50 75 90 99 99.9] percentile;
% $$$     v.pr6hr_armax(m,:,:)  =s.armax; %ar max
% $$$     v.pr6hr_av   (m,:,:)  =s.av;    %all average
% $$$     v.pr6hr_pct  (m,:,:,:)=s.pct;   %[25 50 75 90 99 99.9] percentile;
% $$$     v.pr6hr_f    (m,:,:,:)=s.f;     %rain, moderate, heavy, cat4,5 rain
% $$$     v.pr6hr_fr_ar(m,:,:,:)=s.fr_ar; 
    %%precipitable water%%%%%%%%%%%
    varn='prw'; ff='6hr'; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); s=get_amon_stat_new(a,id,pct,0,id99,id999);
    v.prw_ar        (m,:,:)  =s.ar;         %ar average
    v.prw_aravg     (m,:,:)  =s.aravg;      %ar average
    v.prw_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.prw_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.prw_armax     (m,:,:)  =s.armax;      %ar max
    v.prw_av        (m,:,:)  =s.av;         %all average
    v.prw_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='prsn'; ff='6hr'; exd='/atmos_data/6hr_avg/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400; s=get_amon_stat_new(a,id,pct,0,id99,id999);
    v.prsn_ar        (m,:,:)  =s.ar;         %ar total
    v.prsn_aravg     (m,:,:)  =s.aravg;      %ar average
    v.prsn_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.prsn_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.prsn_armax     (m,:,:)  =s.armax;      %ar max
    v.prsn_av        (m,:,:)  =s.av;         %all average
    v.prsn_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='hfls'; ff='6hr'; exd='/atmos_data/6hr_avg/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)/LV0*86400; s=get_amon_stat_new(a,id,pct,0,id99,id999);
    v.hfls_ar        (m,:,:)  =s.ar;         %ar total
    v.hfls_aravg     (m,:,:)  =s.aravg;      %ar average
    v.hfls_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.hfls_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.hfls_armax     (m,:,:)  =s.armax;      %ar max
    v.hfls_av        (m,:,:)  =s.av;         %all average
    v.hfls_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='wap_unmsk'; ff='6hr'; lev=1; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev)*864; s=get_amon_stat_new(a,id,pct,0,id99,id999);
    v.w850_ar        (m,:,:)  =s.ar;         %ar total
    v.w850_aravg     (m,:,:)  =s.aravg;      %ar average
    v.w850_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.w850_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.w850_armax     (m,:,:)  =s.armax;      %ar max
    v.w850_av        (m,:,:)  =s.av;         %all average
    v.w850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='wap_unmsk'; ff='6hr'; lev=2; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev)*864; s=get_amon_stat_new(a,id,pct,0,id99,id999);
    v.w500_ar        (m,:,:)  =s.ar;         %ar total
    v.w500_aravg     (m,:,:)  =s.aravg;      %ar average
    v.w500_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.w500_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.w500_armax     (m,:,:)  =s.armax;      %ar max
    v.w500_av        (m,:,:)  =s.av;         %all average
    v.w500_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='wap_unmsk'; ff='6hr'; lev=3; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev)*864; s=get_amon_stat_new(a,id,pct,0,id99,id999);
    v.w250_ar        (m,:,:)  =s.ar;         %ar total
    v.w250_aravg     (m,:,:)  =s.aravg;      %ar average
    v.w250_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.w250_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.w250_armax     (m,:,:)  =s.armax;      %ar max
    v.w250_av        (m,:,:)  =s.av;         %all average
    v.w250_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='ta_unmsk'; ff='6hr'; lev=1; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); s=get_amon_stat_new(a,id,pct,0,id99,id999);
    v.t850_ar        (m,:,:)  =s.ar;         %ar total
    v.t850_aravg     (m,:,:)  =s.aravg;      %ar average
    v.t850_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.t850_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.t850_armax     (m,:,:)  =s.armax;      %ar max
    v.t850_av        (m,:,:)  =s.av;         %all average
    v.t850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='ta_unmsk'; ff='6hr'; lev=2; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); s=get_amon_stat_new(a,id,pct,0,id99,id999);
    v.t500_ar        (m,:,:)  =s.ar;         %ar total
    v.t500_aravg     (m,:,:)  =s.aravg;      %ar average
    v.t500_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.t500_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.t500_armax     (m,:,:)  =s.armax;      %ar max
    v.t500_av        (m,:,:)  =s.av;         %all average
    v.t500_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='ta_unmsk'; ff='6hr'; lev=3; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); s=get_amon_stat_new(a,id,pct,0,id99,id999);
    v.t250_ar        (m,:,:)  =s.ar;         %ar total
    v.t250_aravg     (m,:,:)  =s.aravg;      %ar average
    v.t250_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.t250_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.t250_armax     (m,:,:)  =s.armax;      %ar max
    v.t250_av        (m,:,:)  =s.av;         %all average
    v.t250_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='hus_unmsk'; ff='6hr'; lev=1; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); s=get_amon_stat_new(a,id,pct,0,id99,id999);
    v.q850_ar        (m,:,:)  =s.ar;         %ar total
    v.q850_aravg     (m,:,:)  =s.aravg;      %ar average
    v.q850_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.q850_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.q850_armax     (m,:,:)  =s.armax;      %ar max
    v.q850_av        (m,:,:)  =s.av;         %all average
    v.q850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='hus_unmsk'; ff='6hr'; lev=2; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); s=get_amon_stat_new(a,id,pct,0,id99,id999);
    v.q500_ar        (m,:,:)  =s.ar;         %ar total
    v.q500_aravg     (m,:,:)  =s.aravg;      %ar average
    v.q500_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.q500_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.q500_armax     (m,:,:)  =s.armax;      %ar max
    v.q500_av        (m,:,:)  =s.av;         %all average
    v.q500_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='hus_unmsk'; ff='6hr'; lev=3; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); s=get_amon_stat_new(a,id,pct,0,id99,id999);
    v.q250_ar        (m,:,:)  =s.ar;         %ar total
    v.q250_aravg     (m,:,:)  =s.aravg;      %ar average
    v.q250_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.q250_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.q250_armax     (m,:,:)  =s.armax;      %ar max
    v.q250_av        (m,:,:)  =s.av;         %all average
    v.q250_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %U850%%%%%%%%%%%%%%%%%%%%%%%%
    varn='ua_unmsk'; ff='6hr'; lev=1; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); s=get_amon_stat_new(a,id,pct,0,id99,id999);u850=a;
    v.u850_ar        (m,:,:)  =s.ar;         %ar total
    v.u850_aravg     (m,:,:)  =s.aravg;      %ar average
    v.u850_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.u850_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.u850_armax     (m,:,:)  =s.armax;      %ar max
    v.u850_av        (m,:,:)  =s.av;         %all average
    v.u850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %V850%%%%%%%%%%%%%%%%%%%%%%%%
    varn='va_unmsk'; ff='6hr'; lev=1; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); s=get_amon_stat_new(a,id,pct,0,id99,id999);v850=a;
    v.v850_ar        (m,:,:)  =s.ar;         %ar total
    v.v850_aravg     (m,:,:)  =s.aravg;      %ar average
    v.v850_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.v850_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.v850_armax     (m,:,:)  =s.armax;      %ar max
    v.v850_av        (m,:,:)  =s.av;         %all average
    v.v850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %WS850%%%%%%%%%%%%%%%%%%%%%%%%
    a=sqrt(u850.^2+v850.^2); clear u850 v850; s=get_amon_stat_new(a,id,pct,0,id99,id999);
    v.ws850_ar        (m,:,:)  =s.ar;         %ar total
    v.ws850_aravg     (m,:,:)  =s.aravg;      %ar average
    v.ws850_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.ws850_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.ws850_armax     (m,:,:)  =s.armax;      %ar max
    v.ws850_av        (m,:,:)  =s.av;         %all average
    v.ws850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %U500%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='ua_unmsk'; ff='6hr'; lev=2; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); s=get_amon_stat_new(a,id,pct,0,id99,id999);u500=a;
    v.u500_ar        (m,:,:)  =s.ar;          %ar total
    v.u500_aravg     (m,:,:)  =s.aravg;       %ar average
    v.u500_aravg_p99 (m,:,:)  =s.aravg_p99;   %ar average
    v.u500_aravg_p999(m,:,:)  =s.aravg_p999;  %ar average
    v.u500_armax     (m,:,:)  =s.armax;       %ar max
    v.u500_av        (m,:,:)  =s.av;          %all average
    v.u500_pct       (m,:,:,:)=s.pct;         %[25 50 75 90 99 99.9] percentile;
    %V500%%%%%%%%%%%%%%%%%%%%%%%%
    varn='va_unmsk'; ff='6hr'; lev=2; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); s=get_amon_stat_new(a,id,pct,0,id99,id999);v500=a;
    v.v500_ar        (m,:,:)  =s.ar;          %ar total
    v.v500_aravg     (m,:,:)  =s.aravg;       %ar average
    v.v500_aravg_p99 (m,:,:)  =s.aravg_p99;   %ar average
    v.v500_aravg_p999(m,:,:)  =s.aravg_p999;  %ar average
    v.v500_armax     (m,:,:)  =s.armax;       %ar max
    v.v500_av        (m,:,:)  =s.av;          %all average
    v.v500_pct       (m,:,:,:)=s.pct;         %[25 50 75 90 99 99.9] percentile;
    %WS500%%%%%%%%%%%%%%%%%%%%%%%
    a=sqrt(u500.^2+v500.^2); clear u500 v500; s=get_amon_stat_new(a,id,pct,0,id99,id999);
    v.ws500_ar        (m,:,:)  =s.ar;         %ar total
    v.ws500_aravg     (m,:,:)  =s.aravg;      %ar average
    v.ws500_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.ws500_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.ws500_armax     (m,:,:)  =s.armax;      %ar max
    v.ws500_av        (m,:,:)  =s.av;         %all average
    v.ws500_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %U250%%%%%%%%%%%%%%%%%%%%%%%%
    varn='ua_unmsk'; ff='6hr'; lev=3; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); s=get_amon_stat_new(a,id,pct,0,id99,id999);u250=a;
    v.u250_ar        (m,:,:)  =s.ar;          %ar total
    v.u250_aravg     (m,:,:)  =s.aravg;       %ar average
    v.u250_aravg_p99 (m,:,:)  =s.aravg_p99;   %ar average
    v.u250_aravg_p999(m,:,:)  =s.aravg_p999;  %ar average
    v.u250_armax     (m,:,:)  =s.armax;       %ar max
    v.u250_av        (m,:,:)  =s.av;          %all average
    v.u250_pct       (m,:,:,:)=s.pct;         %[25 50 75 90 99 99.9] percentile;
    %V250%%%%%%%%%%%%%%%%%%%%%%%%
    varn='va_unmsk'; ff='6hr'; lev=3; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); s=get_amon_stat_new(a,id,pct,0,id99,id999);v250=a;
    v.v250_ar        (m,:,:)  =s.ar;         %ar total
    v.v250_aravg     (m,:,:)  =s.aravg;      %ar average
    v.v250_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.v250_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.v250_armax     (m,:,:)  =s.armax;      %ar max
    v.v250_av        (m,:,:)  =s.av;         %all average
    v.v250_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %WS250%%%%%%%%%%%%%%%%%%%%%%%
    a=sqrt(u250.^2+v250.^2); clear u250 v250; s=get_amon_stat_new(a,id,pct,0,id99,id999);
    v.ws250_ar        (m,:,:)  =s.ar;         %ar total
    v.ws250_aravg     (m,:,:)  =s.aravg;      %ar average
    v.ws250_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.ws250_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.ws250_armax     (m,:,:)  =s.armax;      %ar max
    v.ws250_av        (m,:,:)  =s.av;         %all average
    v.ws250_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$     varn='ttwt'; ff='6hr'; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
% $$$     a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); s=get_amon_stat_new(a,id,pct,0,id99,id999);
% $$$     v.ttwt_ar   (m,:,:)  =s.ar;    %ar total
% $$$     v.ttwt_aravg(m,:,:)  =s.aravg; %ar average
% $$$     v.ttwt_arpct(m,:,:,:)=s.arpct; %[25 50 75 90 99 99.9] percentile;
% $$$     v.ttwt_armax(m,:,:)  =s.armax; %ar max
% $$$     v.ttwt_av   (m,:,:)  =s.av;    %all average
% $$$     v.ttwt_pct  (m,:,:,:)=s.pct;   %[25 50 75 90 99 99.9] percentile;
% $$$     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$     varn='ttws'; ff='6hr'; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
% $$$     a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); s=get_amon_stat_new(a,id,pct,0,id99,id999);
% $$$     v.ttws_ar   (m,:,:)  =s.ar;    %ar total
% $$$     v.ttws_aravg(m,:,:)  =s.aravg; %ar average
% $$$     v.ttws_arpct(m,:,:,:)=s.arpct; %[25 50 75 90 99 99.9] percentile;
% $$$     v.ttws_armax(m,:,:)  =s.armax; %ar max
% $$$     v.ttws_av   (m,:,:)  =s.av;    %all average
% $$$     v.ttws_pct  (m,:,:,:)=s.pct;   %[25 50 75 90 99 99.9] percentile;
% $$$     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$     varn='tcrh'; ff='6hr'; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
% $$$     a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); s=get_amon_stat_new(a,id,pct,0,id99,id999);
% $$$     v.tcrh_ar   (m,:,:)  =s.ar;    %ar total
% $$$     v.tcrh_aravg(m,:,:)  =s.aravg; %ar average
% $$$     v.tcrh_arpct(m,:,:,:)=s.arpct; %[25 50 75 90 99 99.9] percentile;
% $$$     v.tcrh_armax(m,:,:)  =s.armax; %ar max
% $$$     v.tcrh_av   (m,:,:)  =s.av;    %all average
% $$$     v.tcrh_pct  (m,:,:,:)=s.pct;   %[25 50 75 90 99 99.9] percentile;
% $$$     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%start of some daily fields
    clear id_day
    for k=1:length(id(:,1,1))/4
      n=(k-1)*4+1; 
      id_day(k,:,:)=id(n,:,:)|id(n+1,:,:)|id(n+2,:,:)|id(n+3,:,:);
    end
    varn='pr'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400;
    v.prday_av (m,:,:)  =squeeze(mean(a, 1)); %all time average
    v.prday_pct(m,:,:,:)=prctile(a,pct,1); v.pct=pct;
    k=1; P99 =squeeze(v.prday_pct(m,k,:,:));
    k=2; P999=squeeze(v.prday_pct(m,k,:,:));
    nlat=length(a(1,:,1));
    nlon=length(a(1,1,:)); clear id99 id999;
    for j=1:nlat
      for i=1:nlon
	idallp=(a(:,j,i)>=P99 (j,i));
	idboth=idallp & id_day(:,j,i);
	v.prday_fp99_ar(j,i)=sum(idboth)/sum(idallp);
	id99(:,j,i)=idboth;
	idallp=(a(:,j,i)>=P999(j,i));
	idboth=idallp & id_day(:,j,i);
	v.prday_fp999_ar(j,i)=sum(idboth)/sum(idallp);
	id999(:,j,i)=idboth;
      end
    end
    v.idday_sum   =squeeze(sum(id_day,1));
    v.idday99_sum =squeeze(sum(id99, 1));
    v.idday999_sum=squeeze(sum(id999,1));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='pr'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400; s=get_amon_stat_new(a,id_day,pct,0,id99,id999);
    v.prday_ar        (m,:,:) =s.ar;         %ar total
    v.prday_aravg     (m,:,:) =s.aravg;      %ar average
    v.prday_aravg_p99 (m,:,:) =s.aravg_p99;  %ar average
    v.prday_aravg_p999(m,:,:) =s.aravg_p999; %ar average
    v.prday_armax     (m,:,:) =s.armax;      %ar max
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='lwcf'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); s=get_amon_stat_new(a,id_day,pct,0,id99,id999);
    v.lwcf_ar        (m,:,:)  =s.ar;         %ar total
    v.lwcf_aravg     (m,:,:)  =s.aravg;      %ar average
    v.lwcf_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.lwcf_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.lwcf_armax     (m,:,:)  =s.armax;      %ar max
    v.lwcf_av        (m,:,:)  =s.av;         %all average
    v.lwcf_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='swcf'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); s=get_amon_stat_new(a,id_day,pct,0,id99,id999);
    v.swcf_ar        (m,:,:)  =s.ar;         %ar total
    v.swcf_aravg     (m,:,:)  =s.aravg;      %ar average
    v.swcf_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.swcf_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.swcf_armax     (m,:,:)  =s.armax;      %ar max
    v.swcf_av        (m,:,:)  =s.av;         %all average
    v.swcf_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='rlut'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); s=get_amon_stat_new(a,id_day,pct,0,id99,id999);
    v.rlut_ar        (m,:,:)  =s.ar;         %ar total
    v.rlut_aravg     (m,:,:)  =s.aravg;      %ar average
    v.rlut_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.rlut_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.rlut_armax     (m,:,:)  =s.armax;      %ar max
    v.rlut_av        (m,:,:)  =s.av;         %all average
    v.rlut_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='rsut'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); s=get_amon_stat_new(a,id_day,pct,0,id99,id999);
    v.rsut_ar        (m,:,:)  =s.ar;         %ar total
    v.rsut_aravg     (m,:,:)  =s.aravg;      %ar average
    v.rsut_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
    v.rsut_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
    v.rsut_armax     (m,:,:)  =s.armax;      %ar max
    v.rsut_av        (m,:,:)  =s.av;         %all average
    v.rsut_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    varn='tas'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
    a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); s=get_amon_stat_new(a,id_day,pct,0,id99,id999);
    v.tas_ar        (m,:,:)  =s.ar;          %ar total
    v.tas_aravg     (m,:,:)  =s.aravg;       %ar average
    v.tas_aravg_p99 (m,:,:)  =s.aravg_p99;   %ar average
    v.tas_aravg_p999(m,:,:)  =s.aravg_p999;  %ar average
    v.tas_armax     (m,:,:)  =s.armax;       %ar max
    v.tas_av        (m,:,:)  =s.av;          %all average
    v.tas_pct       (m,:,:,:)=s.pct;         %[25 50 75 90 99 99.9] percentile;
% $$$     varn='tasmax'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
% $$$     a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); s=get_amon_stat_new(a,id_day,pct,0,id99,id999);
% $$$     v.tasmax_ar        (m,:,:)  =s.ar;         %ar total
% $$$     v.tasmax_aravg     (m,:,:)  =s.aravg;      %ar average
% $$$     v.tasmax_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
% $$$     v.tasmax_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
% $$$     v.tasmax_armax     (m,:,:)  =s.armax;      %ar max
% $$$     v.tasmax_av        (m,:,:)  =s.av;         %all average
% $$$     v.tasmax_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
% $$$     varn='tasmin'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
% $$$     a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); s=get_amon_stat_new(a,id_day,pct,0,id99,id999);
% $$$     v.tasmin_ar        (m,:,:)  =s.ar;         %ar total
% $$$     v.tasmin_aravg     (m,:,:)  =s.aravg;      %ar average
% $$$     v.tasmin_aravg_p99 (m,:,:)  =s.aravg_p99;  %ar average
% $$$     v.tasmin_aravg_p999(m,:,:)  =s.aravg_p999; %ar average
% $$$     v.tasmin_armax     (m,:,:)  =s.armax;      %ar max
% $$$     v.tasmin_av        (m,:,:)  =s.av;         %all average
% $$$     v.tasmin_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
% $$$     %%%%end of some daily fields
% $$$     %%%start of some 3-hourly fields
% $$$     id_3hr=repmat(id,2,1); id_3hr(1:2:end,:,:)=id; id_3hr(2:2:end,:,:)=id; 
% $$$     varn='pr'; ff='3hr'; exd='/atmos_data/3hr/'; exf1='atmos_cmip.';  exf2='010100-'; exf3='123123.';
% $$$     a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400; s=get_amon_stat_new(a,id_3hr,1);
% $$$     v.pr3hr_ar   (m,:,:)  =s.ar;    %ar total
% $$$     v.pr3hr_aravg(m,:,:)  =s.aravg; %ar average
% $$$     v.pr3hr_arpct(m,:,:,:)=s.arpct; %[25 50 75 90 99 99.9] percentile;
% $$$     v.pr3hr_armax(m,:,:)  =s.armax; %ar max
% $$$     v.pr3hr_av   (m,:,:)  =s.av;    %all average
% $$$     v.pr3hr_pct  (m,:,:,:)=s.pct;   %[25 50 75 90 99 99.9] percentile;
% $$$     v.pr3hr_f    (m,:,:,:)=s.f;     %rain, moderate, heavy, cat4,5 rain
% $$$     v.pr3hr_fr_ar(m,:,:,:)=s.fr_ar; 
% $$$     clear id_3hr;
% $$$     %%%end of some 3-hourly fields
  end
end
epath='/work/miz/mat_hiresmip/';
%fext =strcat('_',num2str(yr1),'_',num2str(yr2),'_',num2str(v.d_beg(m)),'_',num2str(v.d_end(m)));
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(epath,expn,fext,'_readarmap_cre_new.mat')

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
  
