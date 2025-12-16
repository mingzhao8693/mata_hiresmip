function [v]=readartc_day(tpath,expn,yr1,yr2,pct,opt,diag)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/backup/ECMWF/';
%expn ='ERAI_6h_DATA'; yr1=1979; yr2=1979; opt='obs';
%tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
%expn ='c192L33_am4p0_2010climo_new_newpp'; yr1=2; yr2=101; opt='AR';
%pct  =[99 99.9]; diag=0;

fn=strcat(tpath,expn,'/atmos.static.nc'); v.lon=ncread(fn,'lon'); 
v.lat=ncread(fn,'lat'); a=ncread(fn,'land_mask'); v.lm=a';
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

if strcmp(opt,'AR')
  varn='shape_ar';
elseif strcmp(opt,'TC')
  varn='shape_tc';
elseif strcmp(opt,'TD')
  varn='shape_td';
elseif strcmp(opt,'MC')
  varn='shape_olr';
else
  varn='shape_et';
end
m=1;
for m=1:length(d_end)
  v.d_beg(m)=d_beg(m); v.d_end(m)=d_end(m); %m=1; %v.d_end(m)=v.d_beg(m)+30*3; v
  %AR/TC shape/feature/ID
  %varn='AR'; ff='day'; exd='/AR_climlmt/';  exf1=''; exf2=''; exf3='';
  ff='day'; exd='/AR_allstorms/';  exf1=''; exf2=''; exf3=''; %varn='shape_olr';
  [a time]=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff);
  id=isnan(a); a(id)=0; 
  id=(a>=1); a(id)=1; a(~id)=0; id=a; %id(id<1)=0; id(id>=1)=1;
  v.frqday_org(m,:,:)=squeeze(mean(id,1)); 
  v.sumday_org(m,:,:)=squeeze(sum (id,1)); %v.id=id; return
  %day of a year%%%%%%%%%%%%%%%%%%%%%%%
  a=findday(id,1);   v.day_from_jan1(m,:,:)=squeeze(nanmean(a,1));
  a=findday(id,181); v.day_from_jul1(m,:,:)=squeeze(nanmean(a,1));
  %precip%%%%%%%%%%%%%%%%%%%%%%%
  varn='pr'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400; %unit:mm/day
  i=a>0.25; v.prday_fqwet(m,:,:,1)=squeeze(mean(i,1)); a1=a;
  a1(~i)=0; v.prday_awwet(m,:,:,1)=squeeze(mean(a1,1));
  i=a>1;    v.prday_fqwet(m,:,:,2)=squeeze(mean(i,1)); a1=a;
  a1(~i)=0; v.prday_awwet(m,:,:,2)=squeeze(mean(a1,1));
  i=a>2;    v.prday_fqwet(m,:,:,3)=squeeze(mean(i,1)); a1=a;
  a1(~i)=0; v.prday_awwet(m,:,:,3)=squeeze(mean(a1,1)); clear a1;
  v.prday_av (m,:,:)  =squeeze(mean(a, 1)); %all time average
  v.prday_std(m,:,:)  =squeeze(std (a, 1)); %all time std
  v.prday_pct(m,:,:,:)=prctile(a,pct,1); v.pct=pct;
  k=1; P99 =squeeze(v.prday_pct(m,k,:,:));
  k=2; P999=squeeze(v.prday_pct(m,k,:,:));
  
  id=id & (a>1); %limit feature obj to regions of P>1mm/day
  v.frqday(m,:,:)=squeeze(mean(id,1)); 
  v.sumday(m,:,:)=squeeze(sum (id,1)); %v.id=id; return
  
  nlat=length(a(1,:,1));
  nlon=length(a(1,1,:)); 
  for j=1:nlat
    for i=1:nlon
      idallp=(a(:,j,i)>=P99 (j,i));     
      idboth=idallp & id(:,j,i);
      v.prday_fp99_from_id(j,i) =sum(idboth)/sum(idallp);
      id99 (:,j,i)=idboth;              %P99 and ID
      ip99 (:,j,i)=idallp & ~id(:,j,i); %P99 and NonID    
      idallp=(a(:,j,i)>=P999(j,i));
      idboth=idallp & id(:,j,i);
      v.prday_fp999_from_id(j,i)=sum(idboth)/sum(idallp);
      id999(:,j,i)=idboth;
      ip999(:,j,i)=idallp & ~id(:,j,i);      
    end
  end 
  v.id_sum   =squeeze(sum(id,1));
  v.id99_sum =squeeze(sum(id99, 1));
  v.id999_sum=squeeze(sum(id999,1));
  v.ip99_sum =squeeze(sum(ip99, 1));
  v.ip999_sum=squeeze(sum(ip999,1));
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  varn='pr'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
%  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400; 
  s=get_cond_var(a,id,pct,3,id99,id999,ip99,ip999);
  v.prday_idwei     (m,:,:)  =s.idwei;      %id weighted average(i.e. id=1;nonid=0)
  v.prday_idmax     (m,:,:)  =s.idmax;      %id max
  v.prday_idavg     (m,:,:)  =s.idavg;      %id average
  v.prday_idstd     (m,:,:)  =s.idstd;      %id average
  v.prday_nonid_avg (m,:,:)  =s.nonid_avg;  %id average
  v.prday_nonid_std (m,:,:)  =s.nonid_std;  %id average

  v.prday_idpct     (m,:,:,:)=s.idpct;      %id average
  v.prday_idpct_avg (m,:,:,:)=s.idpct_avg;  %id average
  v.prday_idpct_std (m,:,:,:)=s.idpct_std;  %id average
  v.prday_idpct_sum (m,:,:,:)=squeeze(sum (s.idx,2)); 
  v.prday_idpct_frq (m,:,:,:)=squeeze(mean(s.idx,2)); 
  v.prday_idpct_wei (m,:,:,:)=s.idpct_wei;  

  v.prday_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.prday_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.prday_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.prday_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.prday_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.prday_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %TAS%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='tas'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.tas_av        (m,:,:)  =s.av;          %all average
  v.tas_pct       (m,:,:,:)=s.pct;         %[25 50 75 90 99 99.9] percentile;
  v.tas_idwei     (m,:,:)  =s.idwei;       %id total
  v.tas_idmax     (m,:,:)  =s.idmax;       %id max
  v.tas_idavg     (m,:,:)  =s.idavg;       %id average
  v.tas_idstd     (m,:,:)  =s.idstd;       %id average
  v.tas_nonid_avg (m,:,:)  =s.nonid_avg;   %id average
  v.tas_nonid_std (m,:,:)  =s.nonid_std;   %id average
  v.tas_idavg_p99 (m,:,:)  =s.idavg_p99;   %id average
  v.tas_idstd_p99 (m,:,:)  =s.idstd_p99;   %id average
  v.tas_idavg_p999(m,:,:)  =s.idavg_p999;  %id average
  v.tas_idstd_p999(m,:,:)  =s.idstd_p999;  %id average
  v.tas_nonid_p99 (m,:,:)  =s.nonid_p99;   %id average
  v.tas_nonid_p999(m,:,:)  =s.nonid_p999;  %id average
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if (diag==0); break; end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ivty'; ff='day'; exd='/atmos_data/daily_avg/';  exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
  ivty=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); 
  s=get_cond_var(ivty,id,pct,0,id99,id999,ip99,ip999);
  v.ivty_av        (m,:,:)  =s.av;         %all average
  v.ivty_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.ivty_idwei     (m,:,:)  =s.idwei;         %id total
  v.ivty_idmax     (m,:,:)  =s.idmax;      %id max
  v.ivty_idavg     (m,:,:)  =s.idavg;      %id average
  v.ivty_idstd     (m,:,:)  =s.idstd;      %id average
  v.ivty_nonid_avg (m,:,:)  =s.nonid_avg;  %id average
  v.ivty_nonid_std (m,:,:)  =s.nonid_std;  %id average
  v.ivty_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.ivty_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.ivty_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.ivty_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.ivty_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.ivty_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ivtx'; ff='day'; exd='/atmos_data/daily_avg/';  exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
  ivtx=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff);
  s=get_cond_var(ivtx,id,pct,0,id99,id999,ip99,ip999);
  v.ivtx_av        (m,:,:)  =s.av;         %all average
  v.ivtx_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.ivtx_idwei     (m,:,:)  =s.idwei;      %id total
  v.ivtx_idmax     (m,:,:)  =s.idmax;      %id max
  v.ivtx_idavg     (m,:,:)  =s.idavg;      %id average
  v.ivtx_idstd     (m,:,:)  =s.idstd;      %id average
  v.ivtx_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.ivtx_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.ivtx_idavg_p99 (m,:,:,:)=s.idavg_p99;  %id average
  v.ivtx_idstd_p99 (m,:,:,:)=s.idstd_p99;  %id average
  v.ivtx_idavg_p999(m,:,:,:)=s.idavg_p999; %id average
  v.ivtx_idstd_p999(m,:,:,:)=s.idstd_p999; %id average
  v.ivtx_nonid_p99 (m,:,:,:)=s.nonid_p99;  %id average
  v.ivtx_nonid_p999(m,:,:,:)=s.nonid_p999; %id average
  %IVT total%%%%%%%%%%%%%%%%%%%
  a=sqrt(ivtx.*ivtx+ivty.*ivty); clear ivtx ivty;
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.ivt_av        (m,:,:)   =s.av;         %all average
  v.ivt_pct       (m,:,:,:) =s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.ivt_idwei     (m,:,:)   =s.idwei;      %id total
  v.ivt_idmax     (m,:,:)   =s.idmax;      %id max
  v.ivt_idavg     (m,:,:)   =s.idavg;      %id average
  v.ivt_idstd     (m,:,:)   =s.idstd;      %id average
  v.ivt_nonid_avg     (m,:,:)   =s.nonid_avg;      %id average
  v.ivt_nonid_std     (m,:,:)   =s.nonid_std;      %id average
  v.ivt_idavg_p99 (m,:,:)   =s.idavg_p99;  %id average
  v.ivt_idstd_p99 (m,:,:)   =s.idstd_p99;  %id average
  v.ivt_idavg_p999(m,:,:)   =s.idavg_p999; %id average
  v.ivt_idstd_p999(m,:,:)   =s.idstd_p999; %id average
  v.ivt_nonid_p99 (m,:,:)   =s.nonid_p99;  %id average
  v.ivt_nonid_p999(m,:,:)   =s.nonid_p999; %id average
  %%precipitable water%%%%%%%%%%%
  varn='prw'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff);
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.prw_av        (m,:,:)  =s.av;         %all average
  v.prw_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;    
  v.prw_idwei     (m,:,:)  =s.idwei;      %id average
  v.prw_idmax     (m,:,:)  =s.idmax;      %id max
  v.prw_idavg     (m,:,:)  =s.idavg;      %id average
  v.prw_idstd     (m,:,:)  =s.idstd;      %id average
  v.prw_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.prw_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.prw_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.prw_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.prw_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.prw_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.prw_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.prw_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %PRC==========
  varn='prc'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400; 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.prc6hr_idwei     (m,:,:) =s.idwei;      %id total
  v.prc6hr_idmax     (m,:,:) =s.idmax;      %id max
  v.prc6hr_idavg     (m,:,:) =s.idavg;      %id average
  v.prc6hr_idstd     (m,:,:) =s.idstd;      %id average
  v.prc6hr_nonid_avg     (m,:,:) =s.nonid_avg;      %id average
  v.prc6hr_nonid_std     (m,:,:) =s.nonid_std;      %id average
  v.prc6hr_idavg_p99 (m,:,:) =s.idavg_p99;  %id average
  v.prc6hr_idstd_p99 (m,:,:) =s.idstd_p99;  %id average
  v.prc6hr_idavg_p999(m,:,:) =s.idavg_p999; %id average
  v.prc6hr_idstd_p999(m,:,:) =s.idstd_p999; %id average
  v.prc6hr_nonid_p99 (m,:,:) =s.nonid_p99;  %id average
  v.prc6hr_nonid_p999(m,:,:) =s.nonid_p999; %id average
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='lwcf'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.lwcf_av        (m,:,:)  =s.av;         %all average
  v.lwcf_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.lwcf_idwei     (m,:,:)  =s.idwei;      %id total
  v.lwcf_idmax     (m,:,:)  =s.idmax;      %id max
  v.lwcf_idavg     (m,:,:)  =s.idavg;      %id average
  v.lwcf_idstd     (m,:,:)  =s.idstd;      %id average
  v.lwcf_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.lwcf_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.lwcf_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.lwcf_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.lwcf_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.lwcf_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.lwcf_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.lwcf_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='swcf'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.swcf_av        (m,:,:)  =s.av;         %all average
  v.swcf_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.swcf_idwei     (m,:,:)  =s.idwei;      %id total
  v.swcf_idmax     (m,:,:)  =s.idmax;      %id max
  v.swcf_idavg     (m,:,:)  =s.idavg;      %id average
  v.swcf_idstd     (m,:,:)  =s.idstd;      %id average
  v.swcf_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.swcf_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.swcf_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.swcf_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.swcf_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.swcf_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.swcf_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.swcf_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if (diag==1); break; end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='rlut'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.rlut_av        (m,:,:)  =s.av;         %all average
  v.rlut_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.rlut_idwei     (m,:,:)  =s.idwei;      %id total
  v.rlut_idmax     (m,:,:)  =s.idmax;      %id max
  v.rlut_idavg     (m,:,:)  =s.idavg;      %id average
  v.rlut_idstd     (m,:,:)  =s.idstd;      %id average
  v.rlut_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.rlut_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.rlut_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.rlut_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.rlut_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.rlut_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.rlut_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.rlut_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='rsut'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.rsut_av        (m,:,:)  =s.av;         %all average
  v.rsut_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.rsut_idwei     (m,:,:)  =s.idwei;      %id total
  v.rsut_idmax     (m,:,:)  =s.idmax;      %id max
  v.rsut_idavg     (m,:,:)  =s.idavg;      %id average
  v.rsut_idstd     (m,:,:)  =s.idstd;      %id average
  v.rsut_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.rsut_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.rsut_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.rsut_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.rsut_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.rsut_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.rsut_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.rsut_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='prsn'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400; 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.prsn_av        (m,:,:)  =s.av;         %all average
  v.prsn_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.prsn_idwei     (m,:,:)  =s.idwei;      %id total
  v.prsn_idmax     (m,:,:)  =s.idmax;      %id max
  v.prsn_idavg     (m,:,:)  =s.idavg;      %id average
  v.prsn_idstd     (m,:,:)  =s.idstd;      %id average
  v.prsn_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.prsn_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.prsn_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.prsn_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.prsn_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.prsn_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.prsn_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.prsn_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='hfls'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)/LV0*86400;
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.hfls_av        (m,:,:)  =s.av;         %all average
  v.hfls_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.hfls_idwei     (m,:,:)  =s.idwei;      %id total
  v.hfls_idmax     (m,:,:)  =s.idmax;      %id max
  v.hfls_idavg     (m,:,:)  =s.idavg;      %id average
  v.hfls_idstd     (m,:,:)  =s.idstd;      %id average
  v.hfls_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.hfls_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.hfls_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.hfls_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.hfls_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.hfls_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.hfls_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.hfls_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.hfls_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.hfls_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if (diag==2); break; end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %T850%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ta_unmsk'; ff='day'; lev=3; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.t850_av        (m,:,:)  =s.av;         %all average
  v.t850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.t850_idwei     (m,:,:)  =s.idwei;      %id total
  v.t850_idmax     (m,:,:)  =s.idmax;      %id max
  v.t850_idavg     (m,:,:)  =s.idavg;      %id average
  v.t850_idstd     (m,:,:)  =s.idstd;      %id average
  v.t850_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.t850_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.t850_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.t850_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.t850_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.t850_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.t850_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.t850_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %Q850%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='hus_unmsk'; ff='day'; lev=3; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.q850_av        (m,:,:)  =s.av;         %all average
  v.q850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.q850_idwei     (m,:,:)  =s.idwei;      %id total
  v.q850_idmax     (m,:,:)  =s.idmax;      %id max
  v.q850_idavg     (m,:,:)  =s.idavg;      %id average
  v.q850_idstd     (m,:,:)  =s.idstd;      %id average
  v.q850_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.q850_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.q850_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.q850_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.q850_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.q850_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.q850_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.q850_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %W850%%%%%%%%%%%%%%%%%%%%%%%%
  varn='wap_unmsk'; ff='day'; lev=3; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev)*864; 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.w850_av        (m,:,:)  =s.av;         %all average
  v.w850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.w850_idwei     (m,:,:)  =s.idwei;      %id total
  v.w850_idmax     (m,:,:)  =s.idmax;      %id max
  v.w850_idavg     (m,:,:)  =s.idavg;      %id average
  v.w850_idstd     (m,:,:)  =s.idstd;      %id average
  v.w850_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.w850_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.w850_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.w850_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.w850_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.w850_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.w850_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.w850_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %U850%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ua_unmsk'; ff='day'; lev=3; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);u850=a;
  v.u850_av        (m,:,:)  =s.av;         %all average
  v.u850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.u850_idwei     (m,:,:)  =s.idwei;      %id total
  v.u850_idmax     (m,:,:)  =s.idmax;      %id max
  v.u850_idavg     (m,:,:)  =s.idavg;      %id average
  v.u850_idstd     (m,:,:)  =s.idstd;      %id average
  v.u850_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.u850_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.u850_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.u850_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.u850_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.u850_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.u850_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.u850_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %V850%%%%%%%%%%%%%%%%%%%%%%%%
  varn='va_unmsk'; ff='day'; lev=3; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);v850=a;
  v.v850_av        (m,:,:)  =s.av;         %all average
  v.v850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.v850_idwei     (m,:,:)  =s.idwei;      %id total
  v.v850_idmax     (m,:,:)  =s.idmax;      %id max
  v.v850_idavg     (m,:,:)  =s.idavg;      %id average
  v.v850_idstd     (m,:,:)  =s.idstd;      %id average
  v.v850_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.v850_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.v850_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.v850_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.v850_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.v850_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.v850_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.v850_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %WS850%%%%%%%%%%%%%%%%%%%%%%%%
  a=sqrt(u850.^2+v850.^2); clear u850 v850; 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.ws850_av        (m,:,:)  =s.av;         %all average
  v.ws850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.ws850_idwei     (m,:,:)  =s.idwei;      %id total
  v.ws850_idmax     (m,:,:)  =s.idmax;      %id max
  v.ws850_idavg     (m,:,:)  =s.idavg;      %id average
  v.ws850_idstd     (m,:,:)  =s.idstd;      %id average
  v.ws850_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.ws850_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.ws850_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.ws850_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.ws850_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.ws850_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.ws850_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.ws850_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if (diag==3); break; end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %T500%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ta_unmsk'; ff='day'; lev=6; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.t500_av        (m,:,:)  =s.av;         %all average
  v.t500_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.t500_idwei     (m,:,:)  =s.idwei;      %id total
  v.t500_idmax     (m,:,:)  =s.idmax;      %id max
  v.t500_idavg     (m,:,:)  =s.idavg;      %id average
  v.t500_idstd     (m,:,:)  =s.idstd;      %id average
  v.t500_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.t500_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.t500_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.t500_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.t500_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.t500_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.t500_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.t500_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %%Q500%%%%%%%%%%%%%%%%%%%%%%%%
  varn='hus_unmsk'; ff='day'; lev=6; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.q500_av        (m,:,:)  =s.av;         %all average
  v.q500_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.q500_idwei     (m,:,:)  =s.idwei;      %id total
  v.q500_idmax     (m,:,:)  =s.idmax;      %id max
  v.q500_idavg     (m,:,:)  =s.idavg;      %id average
  v.q500_idstd     (m,:,:)  =s.idstd;      %id average
  v.q500_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.q500_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.q500_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.q500_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.q500_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.q500_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.q500_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.q500_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %W500%%%%%%%%%%%%%%%%%%%%%%%%
  varn='wap_unmsk'; ff='day'; lev=6; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev)*864;
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.w500_av        (m,:,:)  =s.av;         %all average
  v.w500_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.w500_idwei     (m,:,:)  =s.idwei;      %id total
  v.w500_idmax     (m,:,:)  =s.idmax;      %id max
  v.w500_idavg     (m,:,:)  =s.idavg;      %id average
  v.w500_idstd     (m,:,:)  =s.idstd;      %id average
  v.w500_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.w500_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.w500_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.w500_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.w500_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.w500_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.w500_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.w500_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %U500%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ua_unmsk'; ff='day'; lev=6; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);u500=a;
  v.u500_av        (m,:,:)  =s.av;          %all average
  v.u500_pct       (m,:,:,:)=s.pct;         %[25 50 75 90 99 99.9] percentile;
  v.u500_idwei     (m,:,:)  =s.idwei;       %id total
  v.u500_idmax     (m,:,:)  =s.idmax;       %id max
  v.u500_idavg     (m,:,:)  =s.idavg;       %id average
  v.u500_idstd     (m,:,:)  =s.idstd;       %id average
  v.u500_nonid_avg     (m,:,:)  =s.nonid_avg;       %id average
  v.u500_nonid_std     (m,:,:)  =s.nonid_std;       %id average
  v.u500_idavg_p99 (m,:,:)  =s.idavg_p99;   %id average
  v.u500_idstd_p99 (m,:,:)  =s.idstd_p99;   %id average
  v.u500_idavg_p999(m,:,:)  =s.idavg_p999;  %id average
  v.u500_idstd_p999(m,:,:)  =s.idstd_p999;  %id average
  v.u500_nonid_p99 (m,:,:)  =s.nonid_p99;   %id average
  v.u500_nonid_p999(m,:,:)  =s.nonid_p999;  %id average
  %V500%%%%%%%%%%%%%%%%%%%%%%%%
  varn='va_unmsk'; ff='day'; lev=6; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);v500=a;
  v.v500_av        (m,:,:)  =s.av;          %all average
  v.v500_pct       (m,:,:,:)=s.pct;         %[25 50 75 90 99 99.9] percentile;
  v.v500_idwei     (m,:,:)  =s.idwei;       %id total
  v.v500_idmax     (m,:,:)  =s.idmax;       %id max
  v.v500_idavg     (m,:,:)  =s.idavg;       %id average
  v.v500_idstd     (m,:,:)  =s.idstd;       %id average
  v.v500_nonid_avg     (m,:,:)  =s.nonid_avg;       %id average
  v.v500_nonid_std     (m,:,:)  =s.nonid_std;       %id average
  v.v500_idavg_p99 (m,:,:)  =s.idavg_p99;   %id average
  v.v500_idstd_p99 (m,:,:)  =s.idstd_p99;   %id average
  v.v500_idavg_p999(m,:,:)  =s.idavg_p999;  %id average
  v.v500_idstd_p999(m,:,:)  =s.idstd_p999;  %id average
  v.v500_nonid_p99 (m,:,:)  =s.nonid_p99;   %id average
  v.v500_nonid_p999(m,:,:)  =s.nonid_p999;  %id average
  %WS500%%%%%%%%%%%%%%%%%%%%%%%
  a=sqrt(u500.^2+v500.^2); clear u500 v500; 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.ws500_av        (m,:,:)  =s.av;         %all average
  v.ws500_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.ws500_idwei     (m,:,:)  =s.idwei;      %id total
  v.ws500_idmax     (m,:,:)  =s.idmax;      %id max
  v.ws500_idavg     (m,:,:)  =s.idavg;      %id average
  v.ws500_idstd     (m,:,:)  =s.idstd;      %id average
  v.ws500_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.ws500_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.ws500_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.ws500_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.ws500_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.ws500_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.ws500_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.ws500_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if (diag==4); break; end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %T250%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ta_unmsk'; ff='day'; lev=9; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.t250_av        (m,:,:)  =s.av;         %all average
  v.t250_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.t250_idwei     (m,:,:)  =s.idwei;      %id total
  v.t250_idmax     (m,:,:)  =s.idmax;      %id max
  v.t250_idavg     (m,:,:)  =s.idavg;      %id average
  v.t250_idstd     (m,:,:)  =s.idstd;      %id average
  v.t250_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.t250_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.t250_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.t250_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.t250_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.t250_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.t250_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.t250_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %Q250%%%%%%%%%%%%%%%%%%%%%%%%
  varn='hus_unmsk'; ff='day'; lev=9; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.q250_av        (m,:,:)  =s.av;         %all average
  v.q250_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.q250_idwei     (m,:,:)  =s.idwei;      %id total
  v.q250_idmax     (m,:,:)  =s.idmax;      %id max
  v.q250_idavg     (m,:,:)  =s.idavg;      %id average
  v.q250_idstd     (m,:,:)  =s.idstd;      %id average
  v.q250_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.q250_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.q250_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.q250_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.q250_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.q250_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.q250_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.q250_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %W250%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='wap_unmsk'; ff='day'; lev=9; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev)*864; 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.w250_av        (m,:,:)  =s.av;         %all average
  v.w250_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.w250_idwei     (m,:,:)  =s.idwei;      %id total
  v.w250_idmax     (m,:,:)  =s.idmax;      %id max
  v.w250_idavg     (m,:,:)  =s.idavg;      %id average
  v.w250_idstd     (m,:,:)  =s.idstd;      %id average
  v.w250_nonid_avg     (m,:,:)  =s.nonid_avg;      %id average
  v.w250_nonid_std     (m,:,:)  =s.nonid_std;      %id average
  v.w250_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.w250_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.w250_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.w250_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.w250_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.w250_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %U250%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ua_unmsk'; ff='day'; lev=9; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);u250=a;
  v.u250_av        (m,:,:)  =s.av;          %all average
  v.u250_pct       (m,:,:,:)=s.pct;         %[25 50 75 90 99 99.9] percentile;
  v.u250_idwei     (m,:,:)  =s.idwei;       %id total
  v.u250_idmax     (m,:,:)  =s.idmax;       %id max
  v.u250_idavg     (m,:,:)  =s.idavg;       %id average
  v.u250_idstd     (m,:,:)  =s.idstd;       %id average
  v.u250_nonid_avg     (m,:,:)  =s.nonid_avg;       %id average
  v.u250_nonid_std     (m,:,:)  =s.nonid_std;       %id average
  v.u250_idavg_p99 (m,:,:)  =s.idavg_p99;   %id average
  v.u250_idstd_p99 (m,:,:)  =s.idstd_p99;   %id average
  v.u250_idavg_p999(m,:,:)  =s.idavg_p999;  %id average
  v.u250_idstd_p999(m,:,:)  =s.idstd_p999;  %id average
  v.u250_nonid_p99 (m,:,:)  =s.nonid_p99;   %id average
  v.u250_nonid_p999(m,:,:)  =s.nonid_p999;  %id average
  %V250%%%%%%%%%%%%%%%%%%%%%%%%
  varn='va_unmsk'; ff='day'; lev=9; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);v250=a;
  v.v250_av        (m,:,:)  =s.av;         %all average
  v.v250_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.v250_idwei     (m,:,:)  =s.idwei;      %id total
  v.v250_idmax     (m,:,:)  =s.idmax;      %id max
  v.v250_idavg     (m,:,:)  =s.idavg;      %id average
  v.v250_idstd     (m,:,:)  =s.idstd;      %id average
  v.v250_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.v250_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.v250_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.v250_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.v250_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.v250_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %WS250%%%%%%%%%%%%%%%%%%%%%%%
  a=sqrt(u250.^2+v250.^2); clear u250 v250; 
  s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
  v.ws250_av        (m,:,:)  =s.av;         %all average
  v.ws250_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.ws250_idwei     (m,:,:)  =s.idwei;      %id total
  v.ws250_idmax     (m,:,:)  =s.idmax;      %id max
  v.ws250_idavg     (m,:,:)  =s.idavg;      %id average
  v.ws250_idstd     (m,:,:)  =s.idstd;      %id average
  v.ws250_idavg_p99 (m,:,:)  =s.idavg_p99;  %id average
  v.ws250_idstd_p99 (m,:,:)  =s.idstd_p99;  %id average
  v.ws250_idavg_p999(m,:,:)  =s.idavg_p999; %id average
  v.ws250_idstd_p999(m,:,:)  =s.idstd_p999; %id average
  v.ws250_nonid_p99 (m,:,:)  =s.nonid_p99;  %id average
  v.ws250_nonid_p999(m,:,:)  =s.nonid_p999; %id average
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$     varn='ttwt'; ff='6hr'; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
% $$$     a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
% $$$     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$     varn='ttws'; ff='6hr'; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
% $$$     a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
% $$$     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$     varn='tcrh'; ff='6hr'; exd='/atmos_data/6hr/'; exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
% $$$     a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); s=get_cond_var(a,id,pct,0,id99,id999,ip99,ip999);
end
epath='/work/miz/mat_hiresmip/';
%fext =strcat('_',num2str(yr1),'_',num2str(yr2),'_',num2str(v.d_beg(m)),'_',num2str(v.d_end(m)));
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(epath,expn,fext,'_',opt,'_diag',num2str(diag),'_readartc_day_new.mat')

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
  
