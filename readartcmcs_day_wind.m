function [v]=readartcmcs_day_wind(tpath,expn,yr1,yr2,pct,opt,diag)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/backup/ECMWF/';
%expn ='ERAI_6h_DATA'; yr1=1979; yr2=1979; opt='obs';
%tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
%expn ='c192L33_am4p0_2010climo_new_newpp'; yr1=2; yr2=3; opt='OP';
%pct  =[99 99.9]; diag=1;

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
  varn='shape_TBB';
elseif strcmp(opt,'AL')
  varn='shape_al';
else
  varn='shape_al';
end
m=1;
for m=1:length(d_end)
  v.d_beg(m)=d_beg(m); v.d_end(m)=d_end(m); %m=1; %v.d_end(m)=v.d_beg(m)+30*3; v
  %AR/TC shape/feature/ID
  %varn='AR'; ff='day'; exd='/AR_climlmt/';  exf1=''; exf2=''; exf3='';
  ff='day'; exd='/AR_allstorms_Tb_th_30/';  exf1=''; exf2=''; exf3=''; %varn='shape_olr';
  [a time]=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff);
  id=isnan(a); a(id)=0; %v.a=a;%!!!!!!!to be deleted!!!!!!!
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

  nt  =length(a(:,1,1));
  nlat=length(a(1,:,1));
  nlon=length(a(1,1,:)); 
  aa=repmat(v.aa,[1 1 nt]);aa=shiftdim(aa,2);size(aa)
  v.prday_ts_day_lat=mean(a,3);
  v.prday_ts_day    =mean(mean(a.*aa,3),2);

  if strcmp(opt(1:2),'PR')
    pr_th=str2num(opt(3:4)); v.pr_th=pr_th;v
    id=(a>pr_th); %regions of precip > pr_th (mm/day)
  elseif strcmp(opt,'PR10')
    id=(a>10); %regions of precip > 10mm/day
  elseif strcmp(opt,'OP')
    id=~id & (a>1);%other regions of significant precipitation (P>1mm/day)
  else
    id=id & (a>1); %limit feature obj to regions of P>1mm/day
  end
  
  v.frqday(m,:,:)=squeeze(mean(id,1)); 
  v.sumday(m,:,:)=squeeze(sum (id,1)); %v.id=id; return
  v.frqday_ts_day_lat=mean(id,3);
  v.frqday_ts_day    =mean(mean(id.*aa,3),2);
  v.frqday_ts_nonid  =mean(mean(~id.*aa,3),2);clear aa;

  k=1; P99 =squeeze(v.prday_pct(m,k,:,:));
  k=2; P999=squeeze(v.prday_pct(m,k,:,:));
  for j=1:nlat
    for i=1:nlon
      idallp=(a(:,j,i)>=P99 (j,i));     
      idboth=idallp & id(:,j,i);
      v.prday_fp99_from_id(j,i) =sum(idboth)/sum(idallp);
%      id99 (:,j,i)=idboth;              %P99 and ID
%      ip99 (:,j,i)=idallp & ~id(:,j,i); %P99 and NonID    
      idallp=(a(:,j,i)>=P999(j,i));
      idboth=idallp & id(:,j,i);
      v.prday_fp999_from_id(j,i)=sum(idboth)/sum(idallp);
%      id999(:,j,i)=idboth;
%      ip999(:,j,i)=idallp & ~id(:,j,i);      
    end
  end 
  v.id_sum   =squeeze(sum(id,1));
%  v.id99_sum =squeeze(sum(id99, 1));
%  v.id999_sum=squeeze(sum(id999,1));
%  v.ip99_sum =squeeze(sum(ip99, 1));
%  v.ip999_sum=squeeze(sum(ip999,1));
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  varn='pr'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
%  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400; 
  s=get_cond_var_new(a,id,pct,v.aa);
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
  idxx=s.idx; clear s;
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.prday_idx_avg         (m,:,:,:)=s.idx_avg;    %id average
  v.prday_idx_std         (m,:,:,:)=s.idx_std;    %id average
  v.prday_av_ann          (m,:,:,:)=s.av_ann;
  v.prday_idwei_ann       (m,:,:,:)=s.idwei_ann;
  v.prday_av_ts_day       (m,:)    =s.av_ts_day;
  v.prday_idwei_ts_day    (m,:)    =s.idwei_ts_day;
  v.prday_av_ts_day_lat   (m,:,:)  =s.av_ts_day_lat;
  v.prday_idwei_ts_day_lat(m,:,:)  =s.idwei_ts_day_lat;
  v.prday_nonid_ts_day    (m,:,:)  =s.nonid_ts_day;
  v.prday_nonid_ts_day_lat(m,:,:)  =s.nonid_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='sfcWind'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff);
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.wnd_av        (m,:,:)  =s.av;         %all average
  v.wnd_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;    
  v.wnd_idwei     (m,:,:)  =s.idwei;      %id average
  v.wnd_idmax     (m,:,:)  =s.idmax;      %id max
  v.wnd_idavg     (m,:,:)  =s.idavg;      %id average
  v.wnd_idstd     (m,:,:)  =s.idstd;      %id average
  v.wnd_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.wnd_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.wnd_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.wnd_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.wnd_av_ts_day       (m,:)   =s.av_ts_day;
  v.wnd_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.wnd_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.wnd_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='sfcWindmax'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff);
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.wndmax_av        (m,:,:)  =s.av;         %all average
  v.wndmax_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;    
  v.wndmax_idwei     (m,:,:)  =s.idwei;      %id average
  v.wndmax_idmax     (m,:,:)  =s.idmax;      %id max
  v.wndmax_idavg     (m,:,:)  =s.idavg;      %id average
  v.wndmax_idstd     (m,:,:)  =s.idstd;      %id average
  v.wndmax_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.wndmax_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.wndmax_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.wndmax_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.wndmax_av_ts_day       (m,:)   =s.av_ts_day;
  v.wndmax_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.wndmax_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.wndmax_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if (diag==0); break; end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %TAS%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='tas'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.tas_av        (m,:,:)  =s.av;          %all average
  v.tas_pct       (m,:,:,:)=s.pct;         %[25 50 75 90 99 99.9] percentile;
  v.tas_idwei     (m,:,:)  =s.idwei;       %id total
  v.tas_idmax     (m,:,:)  =s.idmax;       %id max
  v.tas_idavg     (m,:,:)  =s.idavg;       %id average
  v.tas_idstd     (m,:,:)  =s.idstd;       %id average
  v.tas_nonid_avg (m,:,:)  =s.nonid_avg;   %id average
  v.tas_nonid_std (m,:,:)  =s.nonid_std;   %id average
  v.tas_idx_avg   (m,:,:,:)=s.idx_avg;     %id average
  v.tas_idx_std   (m,:,:,:)=s.idx_std;     %id average
  v.tas_av_ann          (m,:,:,:)=s.av_ann;
  v.tas_idwei_ann       (m,:,:,:)=s.idwei_ann;
  v.tas_av_ts_day       (m,:)    =s.av_ts_day;
  v.tas_idwei_ts_day    (m,:)    =s.idwei_ts_day;
  v.tas_av_ts_day_lat   (m,:,:)  =s.av_ts_day_lat;
  v.tas_idwei_ts_day_lat(m,:,:)  =s.idwei_ts_day_lat;
  v.tas_nonid_ts_day    (m,:,:)  =s.nonid_ts_day;
  v.tas_nonid_ts_day_lat(m,:,:)  =s.nonid_ts_day_lat;
  %W500%%%%%%%%%%%%%%%%%%%%%%%%
  varn='wap_unmsk'; ff='day'; lev=6; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev)*864;
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.w500_av        (m,:,:)  =s.av;         %all average
  v.w500_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.w500_idwei     (m,:,:)  =s.idwei;      %id total
  v.w500_idmax     (m,:,:)  =s.idmax;      %id max
  v.w500_idavg     (m,:,:)  =s.idavg;      %id average
  v.w500_idstd     (m,:,:)  =s.idstd;      %id average
  v.w500_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.w500_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.w500_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.w500_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.w500_av_ts_day       (m,:)   =s.av_ts_day;
  v.w500_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.w500_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.w500_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %Q850%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='hus_unmsk'; ff='day'; lev=3; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.q850_av        (m,:,:)  =s.av;         %all average
  v.q850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.q850_idwei     (m,:,:)  =s.idwei;      %id total
  v.q850_idmax     (m,:,:)  =s.idmax;      %id max
  v.q850_idavg     (m,:,:)  =s.idavg;      %id average
  v.q850_idstd     (m,:,:)  =s.idstd;      %id average
  v.q850_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.q850_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.q850_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.q850_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.q850_av_ts_day       (m,:)   =s.av_ts_day;
  v.q850_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.q850_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.q850_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %T850%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ta_unmsk'; ff='day'; lev=3; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.t850_av        (m,:,:)  =s.av;         %all average
  v.t850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.t850_idwei     (m,:,:)  =s.idwei;      %id total
  v.t850_idmax     (m,:,:)  =s.idmax;      %id max
  v.t850_idavg     (m,:,:)  =s.idavg;      %id average
  v.t850_idstd     (m,:,:)  =s.idstd;      %id average
  v.t850_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.t850_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.t850_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.t850_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.t850_av_ts_day       (m,:)   =s.av_ts_day;
  v.t850_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.t850_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.t850_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if (diag==0); break; end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='lwcf'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); ttcf=a;
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.lwcf_av        (m,:,:)  =s.av;         %all average
  v.lwcf_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.lwcf_idwei     (m,:,:)  =s.idwei;      %id total
  v.lwcf_idmax     (m,:,:)  =s.idmax;      %id max
  v.lwcf_idavg     (m,:,:)  =s.idavg;      %id average
  v.lwcf_idstd     (m,:,:)  =s.idstd;      %id average
  v.lwcf_nonid_avg (m,:,:)  =s.nonid_avg;  %id average
  v.lwcf_nonid_std (m,:,:)  =s.nonid_std;  %id average
  v.lwcf_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.lwcf_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.lwcf_av_ann          (m,:,:,:)=s.av_ann;
  v.lwcf_idwei_ann       (m,:,:,:)=s.idwei_ann;
  v.lwcf_av_ts_day       (m,:)    =s.av_ts_day;
  v.lwcf_idwei_ts_day    (m,:)    =s.idwei_ts_day;
  v.lwcf_av_ts_day_lat   (m,:,:)  =s.av_ts_day_lat;
  v.lwcf_idwei_ts_day_lat(m,:,:)  =s.idwei_ts_day_lat;
  v.lwcf_nonid_ts_day    (m,:,:)  =s.nonid_ts_day;
  v.lwcf_nonid_ts_day_lat(m,:,:)  =s.nonid_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='swcf'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); ttcf=ttcf+a;
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.swcf_av        (m,:,:)  =s.av;         %all average
  v.swcf_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.swcf_idwei     (m,:,:)  =s.idwei;      %id total
  v.swcf_idmax     (m,:,:)  =s.idmax;      %id max
  v.swcf_idavg     (m,:,:)  =s.idavg;      %id average
  v.swcf_idstd     (m,:,:)  =s.idstd;      %id average
  v.swcf_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.swcf_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.swcf_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.swcf_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.swcf_av_ann          (m,:,:,:)=s.av_ann;
  v.swcf_idwei_ann       (m,:,:,:)=s.idwei_ann;
  v.swcf_av_ts_day       (m,:)    =s.av_ts_day;
  v.swcf_idwei_ts_day    (m,:)    =s.idwei_ts_day;
  v.swcf_av_ts_day_lat   (m,:,:)  =s.av_ts_day_lat;
  v.swcf_idwei_ts_day_lat(m,:,:)  =s.idwei_ts_day_lat;
  v.swcf_nonid_ts_day    (m,:,:)  =s.nonid_ts_day;
  v.swcf_nonid_ts_day_lat(m,:,:)  =s.nonid_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  a=ttcf; clear ttcf;
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.ttcf_av        (m,:,:)  =s.av;         %all average
  v.ttcf_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.ttcf_idwei     (m,:,:)  =s.idwei;      %id total
  v.ttcf_idmax     (m,:,:)  =s.idmax;      %id max
  v.ttcf_idavg     (m,:,:)  =s.idavg;      %id average
  v.ttcf_idstd     (m,:,:)  =s.idstd;      %id average
  v.ttcf_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.ttcf_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.ttcf_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.ttcf_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.ttcf_av_ann          (m,:,:,:)=s.av_ann;
  v.ttcf_idwei_ann       (m,:,:,:)=s.idwei_ann;
  v.ttcf_av_ts_day       (m,:)    =s.av_ts_day;
  v.ttcf_idwei_ts_day    (m,:)    =s.idwei_ts_day;
  v.ttcf_av_ts_day_lat   (m,:,:)  =s.av_ts_day_lat;
  v.ttcf_idwei_ts_day_lat(m,:,:)  =s.idwei_ts_day_lat;
  v.ttcf_nonid_ts_day    (m,:,:)  =s.nonid_ts_day;
  v.ttcf_nonid_ts_day_lat(m,:,:)  =s.nonid_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='rlut'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.rlut_av        (m,:,:)  =s.av;         %all average
  v.rlut_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.rlut_idwei     (m,:,:)  =s.idwei;      %id total
  v.rlut_idmax     (m,:,:)  =s.idmax;      %id max
  v.rlut_idavg     (m,:,:)  =s.idavg;      %id average
  v.rlut_idstd     (m,:,:)  =s.idstd;      %id average
  v.rlut_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.rlut_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.rlut_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.rlut_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.rlut_av_ts_day       (m,:)   =s.av_ts_day;
  v.rlut_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.rlut_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.rlut_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='swabs'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.swabs_av        (m,:,:)  =s.av;         %all average
  v.swabs_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.swabs_idwei     (m,:,:)  =s.idwei;      %id total
  v.swabs_idmax     (m,:,:)  =s.idmax;      %id max
  v.swabs_idavg     (m,:,:)  =s.idavg;      %id average
  v.swabs_idstd     (m,:,:)  =s.idstd;      %id average
  v.swabs_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.swabs_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.swabs_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.swabs_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.swabs_av_ts_day       (m,:)   =s.av_ts_day;
  v.swabs_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.swabs_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.swabs_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='prw'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff);
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.prw_av        (m,:,:)  =s.av;         %all average
  v.prw_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;    
  v.prw_idwei     (m,:,:)  =s.idwei;      %id average
  v.prw_idmax     (m,:,:)  =s.idmax;      %id max
  v.prw_idavg     (m,:,:)  =s.idavg;      %id average
  v.prw_idstd     (m,:,:)  =s.idstd;      %id average
  v.prw_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.prw_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.prw_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.prw_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.prw_av_ts_day       (m,:)   =s.av_ts_day;
  v.prw_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.prw_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.prw_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='clwvi'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.clwvi_av        (m,:,:)  =s.av;         %all average
  v.clwvi_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.clwvi_idwei     (m,:,:)  =s.idwei;      %id total
  v.clwvi_idmax     (m,:,:)  =s.idmax;      %id max
  v.clwvi_idavg     (m,:,:)  =s.idavg;      %id average
  v.clwvi_idstd     (m,:,:)  =s.idstd;      %id average
  v.clwvi_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.clwvi_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.clwvi_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.clwvi_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.clwvi_av_ts_day       (m,:)   =s.av_ts_day;
  v.clwvi_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.clwvi_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.clwvi_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='clwvi'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.clwvi_av        (m,:,:)  =s.av;         %all average
  v.clwvi_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.clwvi_idwei     (m,:,:)  =s.idwei;      %id total
  v.clwvi_idmax     (m,:,:)  =s.idmax;      %id max
  v.clwvi_idavg     (m,:,:)  =s.idavg;      %id average
  v.clwvi_idstd     (m,:,:)  =s.idstd;      %id average
  v.clwvi_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.clwvi_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.clwvi_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.clwvi_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.clwvi_av_ts_day       (m,:)   =s.av_ts_day;
  v.clwvi_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.clwvi_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.clwvi_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='clivi'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.clivi_av        (m,:,:)  =s.av;         %all average
  v.clivi_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.clivi_idwei     (m,:,:)  =s.idwei;      %id total
  v.clivi_idmax     (m,:,:)  =s.idmax;      %id max
  v.clivi_idavg     (m,:,:)  =s.idavg;      %id average
  v.clivi_idstd     (m,:,:)  =s.idstd;      %id average
  v.clivi_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.clivi_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.clivi_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.clivi_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.clivi_av_ts_day       (m,:)   =s.av_ts_day;
  v.clivi_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.clivi_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.clivi_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='clt'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.clt_av        (m,:,:)  =s.av;         %all average
  v.clt_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.clt_idwei     (m,:,:)  =s.idwei;      %id total
  v.clt_idmax     (m,:,:)  =s.idmax;      %id max
  v.clt_idavg     (m,:,:)  =s.idavg;      %id average
  v.clt_idstd     (m,:,:)  =s.idstd;      %id average
  v.clt_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.clt_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.clt_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.clt_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.clt_av_ts_day       (m,:)   =s.av_ts_day;
  v.clt_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.clt_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.clt_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if (diag==1); break; end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (diag==2)
  varn='prec_conv'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400.; %mm/day
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx); prc=a; clear a;
  v.prc_av        (m,:,:)  =s.av;         %all average
  v.prc_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.prc_idwei     (m,:,:)  =s.idwei;      %id total
  v.prc_idmax     (m,:,:)  =s.idmax;      %id max
  v.prc_idavg     (m,:,:)  =s.idavg;      %id average
  v.prc_idstd     (m,:,:)  =s.idstd;      %id average
  v.prc_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.prc_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.prc_idx_avg  (m,:,:,:) =s.idx_avg;    %id average
  v.prc_idx_std  (m,:,:,:) =s.idx_std;    %id average
  v.prc_av_ts_day       (m,:)   =s.av_ts_day;
  v.prc_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.prc_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.prc_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='dting_uwc'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)/LV0*86400;%mm/day
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx); cvh=a; clear a;
  v.cvh_av        (m,:,:)  =s.av;         %all average
  v.cvh_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.cvh_idwei     (m,:,:)  =s.idwei;      %id total
  v.cvh_idmax     (m,:,:)  =s.idmax;      %id max
  v.cvh_idavg     (m,:,:)  =s.idavg;      %id average
  v.cvh_idstd     (m,:,:)  =s.idstd;      %id average
  v.cvh_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.cvh_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.cvh_idx_avg  (m,:,:,:) =s.idx_avg;    %id average
  v.cvh_idx_std  (m,:,:,:) =s.idx_std;    %id average
  v.cvh_av_ts_day       (m,:)   =s.av_ts_day;
  v.cvh_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.cvh_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.cvh_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  a=cvh-prc; %convective detrainment rate for concensate
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx); clear a;%save dcv!
  v.dcv_av        (m,:,:)  =s.av;         %average without nan
  v.dcv_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.dcv_idwei     (m,:,:)  =s.idwei;      %id total
  v.dcv_idmax     (m,:,:)  =s.idmax;      %id max
  v.dcv_idavg     (m,:,:)  =s.idavg;      %id average
  v.dcv_idstd     (m,:,:)  =s.idstd;      %id average
  v.dcv_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.dcv_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.dcv_idx_avg  (m,:,:,:) =s.idx_avg;    %id average
  v.dcv_idx_std  (m,:,:,:) =s.idx_std;    %id average
  v.dcv_av_ts_day       (m,:)   =s.av_ts_day;
  v.dcv_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.dcv_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.dcv_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %compute convective precip efficiency
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$   a=prc./cvh;           %convective precip efficiency
% $$$   idtmp=(cvh<=0)|(a>1); %remove grids with negative column convective heating
% $$$   a(idtmp)=NaN;         %remove grids with pe > 1
% $$$   s=get_cond_var_new(a,id,pct,v.aa,0,idxx); clear a;
% $$$   v.pecv_av        (m,:,:)  =s.av_nonan;   %average without nan
% $$$   v.pecv_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
% $$$   v.pecv_idwei     (m,:,:)  =s.idwei;      %id total
% $$$   v.pecv_idmax     (m,:,:)  =s.idmax;      %id max
% $$$   v.pecv_idavg     (m,:,:)  =s.idavg;      %id average
% $$$   v.pecv_idstd     (m,:,:)  =s.idstd;      %id average
% $$$   v.pecv_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
% $$$   v.pecv_nonid_std (m,:,:)  =s.nonid_std;      %id average
% $$$   v.pecv_idx_avg  (m,:,:,:) =s.idx_avg;    %id average
% $$$   v.pecv_idx_std  (m,:,:,:) =s.idx_std;    %id average
% $$$   v.pecv_av_ts_day       (m,:)   =s.av_ts_day;
% $$$   v.pecv_idwei_ts_day    (m,:)   =s.idwei_ts_day;
% $$$   v.pecv_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
% $$$   v.pecv_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ql_cond_col'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400.; 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx); lsh=a; clear a;
  v.qlcond_av        (m,:,:)  =s.av;         %all average
  v.qlcond_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.qlcond_idwei     (m,:,:)  =s.idwei;      %id total
  v.qlcond_idmax     (m,:,:)  =s.idmax;      %id max
  v.qlcond_idavg     (m,:,:)  =s.idavg;      %id average
  v.qlcond_idstd     (m,:,:)  =s.idstd;      %id average
  v.qlcond_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.qlcond_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.qlcond_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.qlcond_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.qlcond_av_ts_day       (m,:)   =s.av_ts_day;
  v.qlcond_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.qlcond_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.qlcond_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='qi_dep_col'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400.; 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx); lsh=lsh+a; clear a;
  v.qicond_av        (m,:,:)  =s.av;         %all average
  v.qicond_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.qicond_idwei     (m,:,:)  =s.idwei;      %id total
  v.qicond_idmax     (m,:,:)  =s.idmax;      %id max
  v.qicond_idavg     (m,:,:)  =s.idavg;      %id average
  v.qicond_idstd     (m,:,:)  =s.idstd;      %id average
  v.qicond_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.qicond_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.qicond_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.qicond_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.qicond_av_ts_day       (m,:)   =s.av_ts_day;
  v.qicond_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.qicond_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.qicond_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  a=lsh; %unit:mm/day
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx); 
  v.lsh_av        (m,:,:)  =s.av;         %all average
  v.lsh_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.lsh_idwei     (m,:,:)  =s.idwei;      %id total
  v.lsh_idmax     (m,:,:)  =s.idmax;      %id max
  v.lsh_idavg     (m,:,:)  =s.idavg;      %id average
  v.lsh_idstd     (m,:,:)  =s.idstd;      %id average
  v.lsh_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.lsh_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.lsh_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.lsh_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.lsh_av_ts_day       (m,:)   =s.av_ts_day;
  v.lsh_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.lsh_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.lsh_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='prec_ls'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400.; 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx); prl=a; clear a;
  v.prl_av        (m,:,:)  =s.av;         %all average
  v.prl_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.prl_idwei     (m,:,:)  =s.idwei;      %id total
  v.prl_idmax     (m,:,:)  =s.idmax;      %id max
  v.prl_idavg     (m,:,:)  =s.idavg;      %id average
  v.prl_idstd     (m,:,:)  =s.idstd;      %id average
  v.prl_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.prl_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.prl_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.prl_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.prl_av_ts_day       (m,:)   =s.av_ts_day;
  v.prl_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.prl_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.prl_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  a=lsh-prl; %large-scale condensate detrainment
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.dls_av        (m,:,:)  =s.av;         %all average
  v.dls_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.dls_idwei     (m,:,:)  =s.idwei;      %id total
  v.dls_idmax     (m,:,:)  =s.idmax;      %id max
  v.dls_idavg     (m,:,:)  =s.idavg;      %id average
  v.dls_idstd     (m,:,:)  =s.idstd;      %id average
  v.dls_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.dls_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.dls_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.dls_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.dls_av_ts_day       (m,:)   =s.av_ts_day;
  v.dls_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.dls_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.dls_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %compute large-scale precip efficiency
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  clear lsh cvh prc prl
% $$$   lsh=lsh+(cvh-prc);   %add convective detrainment rate of condensate to lsh
% $$$   a=prl./lsh;          %large-scale precipitation efficiency
% $$$   idtmp=(lsh<=0)|(a>1);%remove grids with negative column condensational/depositional heating
% $$$   a(idtmp)=NaN;        %remove grids with pe > 1
% $$$   s=get_cond_var_new(a,id,pct,v.aa,0,idxx); clear a;
% $$$   v.pels_av        (m,:,:)  =s.av_nonan;   %all average
% $$$   v.pels_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
% $$$   v.pels_idwei     (m,:,:)  =s.idwei;      %id total
% $$$   v.pels_idmax     (m,:,:)  =s.idmax;      %id max
% $$$   v.pels_idavg     (m,:,:)  =s.idavg;      %id average
% $$$   v.pels_idstd     (m,:,:)  =s.idstd;      %id average
% $$$   v.pels_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
% $$$   v.pels_nonid_std (m,:,:)  =s.nonid_std;      %id average
% $$$   v.pels_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
% $$$   v.pels_idx_std   (m,:,:,:)=s.idx_std;    %id average
% $$$   v.pels_av_ts_day       (m,:)   =s.av_ts_day;
% $$$   v.pels_idwei_ts_day    (m,:)   =s.idwei_ts_day;
% $$$   v.pels_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
% $$$   v.pels_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %compute total precip efficiency
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$   tsh=lsh+cvh;      clear lsh cvh; %sum total LS and CV cond/depo rate
% $$$   a=(prl+prc)./tsh; clear prl prc  %compute total precipitation efficiency
% $$$   idtmp=(tsh<=0)|(a>10); clear tsh;%remove grids with neg total cond/depo rate
% $$$   a(idtmp)=NaN;                    %remove grids with total pe > 1
% $$$   s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
% $$$   v.pett_av        (m,:,:)  =s.av_nonan;   %all average
% $$$   v.pett_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
% $$$   v.pett_idwei     (m,:,:)  =s.idwei;      %id total
% $$$   v.pett_idmax     (m,:,:)  =s.idmax;      %id max
% $$$   v.pett_idavg     (m,:,:)  =s.idavg;      %id average
% $$$   v.pett_idstd     (m,:,:)  =s.idstd;      %id average
% $$$   v.pett_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
% $$$   v.pett_nonid_std (m,:,:)  =s.nonid_std;      %id average
% $$$   v.pett_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
% $$$   v.pett_idx_std   (m,:,:,:)=s.idx_std;    %id average
% $$$   v.pett_av_ts_day       (m,:)   =s.av_ts_day;
% $$$   v.pett_idwei_ts_day    (m,:)   =s.idwei_ts_day;
% $$$   v.pett_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
% $$$   v.pett_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$   varn='t_ls_col'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos.'; exf2='0101-'; exf3='1231.';
% $$$   a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff);
% $$$   s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
% $$$   v.hls_av        (m,:,:)  =s.av;         %all average
% $$$   v.hls_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
% $$$   v.hls_idwei     (m,:,:)  =s.idwei;      %id total
% $$$   v.hls_idmax     (m,:,:)  =s.idmax;      %id max
% $$$   v.hls_idavg     (m,:,:)  =s.idavg;      %id average
% $$$   v.hls_idstd     (m,:,:)  =s.idstd;      %id average
% $$$   v.hls_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
% $$$   v.hls_nonid_std (m,:,:)  =s.nonid_std;      %id average
% $$$   v.hls_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
% $$$   v.hls_idx_std   (m,:,:,:)=s.idx_std;    %id average
% $$$   v.hls_av_ts_day       (m,:)   =s.av_ts_day;
% $$$   v.hls_idwei_ts_day    (m,:)   =s.idwei_ts_day;
% $$$   v.hls_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
% $$$   v.hls_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if (diag==2); break; end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ivty'; ff='day'; exd='/atmos_data/daily_avg/';  exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
  ivty=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); 
  s=get_cond_var_new(ivty,id,pct,v.aa,0,idxx);
  v.ivty_av        (m,:,:)  =s.av;         %all average
  v.ivty_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.ivty_idwei     (m,:,:)  =s.idwei;         %id total
  v.ivty_idmax     (m,:,:)  =s.idmax;      %id max
  v.ivty_idavg     (m,:,:)  =s.idavg;      %id average
  v.ivty_idstd     (m,:,:)  =s.idstd;      %id average
  v.ivty_nonid_avg (m,:,:)  =s.nonid_avg;  %id average
  v.ivty_nonid_std (m,:,:)  =s.nonid_std;  %id average
  v.ivty_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.ivty_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.ivty_av_ts_day       (m,:)   =s.av_ts_day;
  v.ivty_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.ivty_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.ivty_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ivtx'; ff='day'; exd='/atmos_data/daily_avg/';  exf1='atmos_cmip.'; exf2='010100-'; exf3='123123.';
  ivtx=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff);
  s=get_cond_var_new(ivtx,id,pct,v.aa,0,idxx);
  v.ivtx_av        (m,:,:)  =s.av;         %all average
  v.ivtx_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.ivtx_idwei     (m,:,:)  =s.idwei;      %id total
  v.ivtx_idmax     (m,:,:)  =s.idmax;      %id max
  v.ivtx_idavg     (m,:,:)  =s.idavg;      %id average
  v.ivtx_idstd     (m,:,:)  =s.idstd;      %id average
  v.ivtx_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.ivtx_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.ivtx_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.ivtx_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.ivtx_av_ts_day       (m,:)   =s.av_ts_day;
  v.ivtx_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.ivtx_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.ivtx_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %IVT total%%%%%%%%%%%%%%%%%%%
  a=sqrt(ivtx.*ivtx+ivty.*ivty); clear ivtx ivty;
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.ivt_av        (m,:,:)   =s.av;         %all average
  v.ivt_pct       (m,:,:,:) =s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.ivt_idwei     (m,:,:)   =s.idwei;      %id total
  v.ivt_idmax     (m,:,:)   =s.idmax;      %id max
  v.ivt_idavg     (m,:,:)   =s.idavg;      %id average
  v.ivt_idstd     (m,:,:)   =s.idstd;      %id average
  v.ivt_nonid_avg (m,:,:)   =s.nonid_avg;  %id average
  v.ivt_nonid_std (m,:,:)   =s.nonid_std;  %id average
  v.ivt_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.ivt_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.ivt_av_ts_day       (m,:)   =s.av_ts_day;
  v.ivt_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.ivt_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.ivt_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='prsn'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff)*86400; 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.prsn_av        (m,:,:)  =s.av;         %all average
  v.prsn_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.prsn_idwei     (m,:,:)  =s.idwei;      %id total
  v.prsn_idmax     (m,:,:)  =s.idmax;      %id max
  v.prsn_idavg     (m,:,:)  =s.idavg;      %id average
  v.prsn_idstd     (m,:,:)  =s.idstd;      %id average
  v.prsn_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.prsn_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.prsn_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.prsn_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.prsn_av_ts_day       (m,:)   =s.av_ts_day;
  v.prsn_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.prsn_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.prsn_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='hfls'; ff='day'; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); a=a/LV0*86400.;
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.hfls_av        (m,:,:)  =s.av;         %all average
  v.hfls_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.hfls_idwei     (m,:,:)  =s.idwei;      %id total
  v.hfls_idmax     (m,:,:)  =s.idmax;      %id max
  v.hfls_idavg     (m,:,:)  =s.idavg;      %id average
  v.hfls_idstd     (m,:,:)  =s.idstd;      %id average
  v.hfls_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.hfls_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.hfls_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.hfls_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.hfls_av_ts_day       (m,:)   =s.av_ts_day;
  v.hfls_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.hfls_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.hfls_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if (diag==3); break; end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$   %T850%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$   varn='ta_unmsk'; ff='day'; lev=3; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
% $$$   a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
% $$$   s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
% $$$   v.t850_av        (m,:,:)  =s.av;         %all average
% $$$   v.t850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
% $$$   v.t850_idwei     (m,:,:)  =s.idwei;      %id total
% $$$   v.t850_idmax     (m,:,:)  =s.idmax;      %id max
% $$$   v.t850_idavg     (m,:,:)  =s.idavg;      %id average
% $$$   v.t850_idstd     (m,:,:)  =s.idstd;      %id average
% $$$   v.t850_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
% $$$   v.t850_nonid_std (m,:,:)  =s.nonid_std;      %id average
% $$$   v.t850_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
% $$$   v.t850_idx_std   (m,:,:,:)=s.idx_std;    %id average
% $$$   v.t850_av_ts_day       (m,:)   =s.av_ts_day;
% $$$   v.t850_idwei_ts_day    (m,:)   =s.idwei_ts_day;
% $$$   v.t850_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
% $$$   v.t850_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
% $$$   %Q850%%%%%%%%%%%%%%%%%%%%%%%%%
% $$$   varn='hus_unmsk'; ff='day'; lev=3; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
% $$$   a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
% $$$   s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
% $$$   v.q850_av        (m,:,:)  =s.av;         %all average
% $$$   v.q850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
% $$$   v.q850_idwei     (m,:,:)  =s.idwei;      %id total
% $$$   v.q850_idmax     (m,:,:)  =s.idmax;      %id max
% $$$   v.q850_idavg     (m,:,:)  =s.idavg;      %id average
% $$$   v.q850_idstd     (m,:,:)  =s.idstd;      %id average
% $$$   v.q850_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
% $$$   v.q850_nonid_std (m,:,:)  =s.nonid_std;      %id average
% $$$   v.q850_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
% $$$   v.q850_idx_std   (m,:,:,:)=s.idx_std;    %id average
% $$$   v.q850_av_ts_day       (m,:)   =s.av_ts_day;
% $$$   v.q850_idwei_ts_day    (m,:)   =s.idwei_ts_day;
% $$$   v.q850_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
% $$$   v.q850_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %W850%%%%%%%%%%%%%%%%%%%%%%%%
  varn='wap_unmsk'; ff='day'; lev=3; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev)*864; 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.w850_av        (m,:,:)  =s.av;         %all average
  v.w850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.w850_idwei     (m,:,:)  =s.idwei;      %id total
  v.w850_idmax     (m,:,:)  =s.idmax;      %id max
  v.w850_idavg     (m,:,:)  =s.idavg;      %id average
  v.w850_idstd     (m,:,:)  =s.idstd;      %id average
  v.w850_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.w850_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.w850_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.w850_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.w850_av_ts_day       (m,:)   =s.av_ts_day;
  v.w850_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.w850_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.w850_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %U850%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ua_unmsk'; ff='day'; lev=3; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);u850=a;
  v.u850_av        (m,:,:)  =s.av;         %all average
  v.u850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.u850_idwei     (m,:,:)  =s.idwei;      %id total
  v.u850_idmax     (m,:,:)  =s.idmax;      %id max
  v.u850_idavg     (m,:,:)  =s.idavg;      %id average
  v.u850_idstd     (m,:,:)  =s.idstd;      %id average
  v.u850_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.u850_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.u850_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.u850_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.u850_av_ts_day       (m,:)   =s.av_ts_day;
  v.u850_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.u850_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.u850_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %V850%%%%%%%%%%%%%%%%%%%%%%%%
  varn='va_unmsk'; ff='day'; lev=3; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);v850=a;
  v.v850_av        (m,:,:)  =s.av;         %all average
  v.v850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.v850_idwei     (m,:,:)  =s.idwei;      %id total
  v.v850_idmax     (m,:,:)  =s.idmax;      %id max
  v.v850_idavg     (m,:,:)  =s.idavg;      %id average
  v.v850_idstd     (m,:,:)  =s.idstd;      %id average
  v.v850_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.v850_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.v850_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.v850_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.v850_av_ts_day       (m,:)   =s.av_ts_day;
  v.v850_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.v850_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.v850_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %WS850%%%%%%%%%%%%%%%%%%%%%%%%
  a=sqrt(u850.^2+v850.^2); clear u850 v850; 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.ws850_av        (m,:,:)  =s.av;         %all average
  v.ws850_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.ws850_idwei     (m,:,:)  =s.idwei;      %id total
  v.ws850_idmax     (m,:,:)  =s.idmax;      %id max
  v.ws850_idavg     (m,:,:)  =s.idavg;      %id average
  v.ws850_idstd     (m,:,:)  =s.idstd;      %id average
  v.ws850_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.ws850_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.ws850_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.ws850_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.ws850_av_ts_day       (m,:)   =s.av_ts_day;
  v.ws850_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.ws850_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.ws850_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if (diag==4); break; end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %T500%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ta_unmsk'; ff='day'; lev=6; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.t500_av        (m,:,:)  =s.av;         %all average
  v.t500_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.t500_idwei     (m,:,:)  =s.idwei;      %id total
  v.t500_idmax     (m,:,:)  =s.idmax;      %id max
  v.t500_idavg     (m,:,:)  =s.idavg;      %id average
  v.t500_idstd     (m,:,:)  =s.idstd;      %id average
  v.t500_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.t500_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.t500_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.t500_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.t500_av_ts_day       (m,:)   =s.av_ts_day;
  v.t500_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.t500_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.t500_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%Q500%%%%%%%%%%%%%%%%%%%%%%%%
  varn='hus_unmsk'; ff='day'; lev=6; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.q500_av        (m,:,:)  =s.av;         %all average
  v.q500_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.q500_idwei     (m,:,:)  =s.idwei;      %id total
  v.q500_idmax     (m,:,:)  =s.idmax;      %id max
  v.q500_idavg     (m,:,:)  =s.idavg;      %id average
  v.q500_idstd     (m,:,:)  =s.idstd;      %id average
  v.q500_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.q500_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.q500_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.q500_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.q500_av_ts_day       (m,:)   =s.av_ts_day;
  v.q500_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.q500_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.q500_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
% $$$   %W500%%%%%%%%%%%%%%%%%%%%%%%%
% $$$   varn='wap_unmsk'; ff='day'; lev=6; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
% $$$   a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev)*864;
% $$$   s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
% $$$   v.w500_av        (m,:,:)  =s.av;         %all average
% $$$   v.w500_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
% $$$   v.w500_idwei     (m,:,:)  =s.idwei;      %id total
% $$$   v.w500_idmax     (m,:,:)  =s.idmax;      %id max
% $$$   v.w500_idavg     (m,:,:)  =s.idavg;      %id average
% $$$   v.w500_idstd     (m,:,:)  =s.idstd;      %id average
% $$$   v.w500_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
% $$$   v.w500_nonid_std (m,:,:)  =s.nonid_std;      %id average
% $$$   v.w500_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
% $$$   v.w500_idx_std   (m,:,:,:)=s.idx_std;    %id average
% $$$   v.w500_av_ts_day       (m,:)   =s.av_ts_day;
% $$$   v.w500_idwei_ts_day    (m,:)   =s.idwei_ts_day;
% $$$   v.w500_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
% $$$   v.w500_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %U500%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ua_unmsk'; ff='day'; lev=6; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);u500=a;
  v.u500_av        (m,:,:)  =s.av;          %all average
  v.u500_pct       (m,:,:,:)=s.pct;         %[25 50 75 90 99 99.9] percentile;
  v.u500_idwei     (m,:,:)  =s.idwei;       %id total
  v.u500_idmax     (m,:,:)  =s.idmax;       %id max
  v.u500_idavg     (m,:,:)  =s.idavg;       %id average
  v.u500_idstd     (m,:,:)  =s.idstd;       %id average
  v.u500_nonid_avg (m,:,:)  =s.nonid_avg;       %id average
  v.u500_nonid_std (m,:,:)  =s.nonid_std;       %id average
  v.u500_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.u500_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.u500_av_ts_day       (m,:)   =s.av_ts_day;
  v.u500_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.u500_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.u500_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %V500%%%%%%%%%%%%%%%%%%%%%%%%
  varn='va_unmsk'; ff='day'; lev=6; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);v500=a;
  v.v500_av        (m,:,:)  =s.av;          %all average
  v.v500_pct       (m,:,:,:)=s.pct;         %[25 50 75 90 99 99.9] percentile;
  v.v500_idwei     (m,:,:)  =s.idwei;       %id total
  v.v500_idmax     (m,:,:)  =s.idmax;       %id max
  v.v500_idavg     (m,:,:)  =s.idavg;       %id average
  v.v500_idstd     (m,:,:)  =s.idstd;       %id average
  v.v500_nonid_avg (m,:,:)  =s.nonid_avg;       %id average
  v.v500_nonid_std (m,:,:)  =s.nonid_std;       %id average
  v.v500_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.v500_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.v500_av_ts_day       (m,:)   =s.av_ts_day;
  v.v500_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.v500_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.v500_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %WS500%%%%%%%%%%%%%%%%%%%%%%%
  a=sqrt(u500.^2+v500.^2); clear u500 v500; 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.ws500_av        (m,:,:)  =s.av;         %all average
  v.ws500_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.ws500_idwei     (m,:,:)  =s.idwei;      %id total
  v.ws500_idmax     (m,:,:)  =s.idmax;      %id max
  v.ws500_idavg     (m,:,:)  =s.idavg;      %id average
  v.ws500_idstd     (m,:,:)  =s.idstd;      %id average
  v.ws500_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.ws500_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.ws500_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.ws500_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.ws500_av_ts_day       (m,:)   =s.av_ts_day;
  v.ws500_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.ws500_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.ws500_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if (diag==5); break; end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %T250%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ta_unmsk'; ff='day'; lev=9; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.t250_av        (m,:,:)  =s.av;         %all average
  v.t250_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.t250_idwei     (m,:,:)  =s.idwei;      %id total
  v.t250_idmax     (m,:,:)  =s.idmax;      %id max
  v.t250_idavg     (m,:,:)  =s.idavg;      %id average
  v.t250_idstd     (m,:,:)  =s.idstd;      %id average
  v.t250_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.t250_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.t250_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.t250_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.t250_av_ts_day       (m,:)   =s.av_ts_day;
  v.t250_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.t250_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.t250_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %Q250%%%%%%%%%%%%%%%%%%%%%%%%
  varn='hus_unmsk'; ff='day'; lev=9; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.q250_av        (m,:,:)  =s.av;         %all average
  v.q250_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.q250_idwei     (m,:,:)  =s.idwei;      %id total
  v.q250_idmax     (m,:,:)  =s.idmax;      %id max
  v.q250_idavg     (m,:,:)  =s.idavg;      %id average
  v.q250_idstd     (m,:,:)  =s.idstd;      %id average
  v.q250_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.q250_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.q250_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.q250_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.q250_av_ts_day       (m,:)   =s.av_ts_day;
  v.q250_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.q250_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.q250_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %W250%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='wap_unmsk'; ff='day'; lev=9; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev)*864; 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.w250_av        (m,:,:)  =s.av;         %all average
  v.w250_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.w250_idwei     (m,:,:)  =s.idwei;      %id total
  v.w250_idmax     (m,:,:)  =s.idmax;      %id max
  v.w250_idavg     (m,:,:)  =s.idavg;      %id average
  v.w250_idstd     (m,:,:)  =s.idstd;      %id average
  v.w250_nonid_avg (m,:,:)  =s.nonid_avg;      %id average
  v.w250_nonid_std (m,:,:)  =s.nonid_std;      %id average
  v.w250_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.w250_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.w250_av_ts_day       (m,:)   =s.av_ts_day;
  v.w250_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.w250_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.w250_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %U250%%%%%%%%%%%%%%%%%%%%%%%%
  varn='ua_unmsk'; ff='day'; lev=9; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);u250=a;
  v.u250_av        (m,:,:)  =s.av;          %all average
  v.u250_pct       (m,:,:,:)=s.pct;         %[25 50 75 90 99 99.9] percentile;
  v.u250_idwei     (m,:,:)  =s.idwei;       %id total
  v.u250_idmax     (m,:,:)  =s.idmax;       %id max
  v.u250_idavg     (m,:,:)  =s.idavg;       %id average
  v.u250_idstd     (m,:,:)  =s.idstd;       %id average
  v.u250_nonid_avg (m,:,:)  =s.nonid_avg;       %id average
  v.u250_nonid_std (m,:,:)  =s.nonid_std;       %id average
  v.u250_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.u250_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.u250_av_ts_day       (m,:)   =s.av_ts_day;
  v.u250_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.u250_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.u250_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %V250%%%%%%%%%%%%%%%%%%%%%%%%
  varn='va_unmsk'; ff='day'; lev=9; exd='/atmos_data/daily/'; exf1='atmos_cmip.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff,lev); 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);v250=a;
  v.v250_av        (m,:,:)  =s.av;         %all average
  v.v250_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.v250_idwei     (m,:,:)  =s.idwei;      %id total
  v.v250_idmax     (m,:,:)  =s.idmax;      %id max
  v.v250_idavg     (m,:,:)  =s.idavg;      %id average
  v.v250_idstd     (m,:,:)  =s.idstd;      %id average
  v.v250_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.v250_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.v250_av_ts_day       (m,:)   =s.av_ts_day;
  v.v250_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.v250_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.v250_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
  %WS250%%%%%%%%%%%%%%%%%%%%%%%
  a=sqrt(u250.^2+v250.^2); clear u250 v250; 
  s=get_cond_var_new(a,id,pct,v.aa,0,idxx);
  v.ws250_av        (m,:,:)  =s.av;         %all average
  v.ws250_pct       (m,:,:,:)=s.pct;        %[25 50 75 90 99 99.9] percentile;
  v.ws250_idwei     (m,:,:)  =s.idwei;      %id total
  v.ws250_idmax     (m,:,:)  =s.idmax;      %id max
  v.ws250_idavg     (m,:,:)  =s.idavg;      %id average
  v.ws250_idstd     (m,:,:)  =s.idstd;      %id average
  v.ws250_idx_avg   (m,:,:,:)=s.idx_avg;    %id average
  v.ws250_idx_std   (m,:,:,:)=s.idx_std;    %id average
  v.ws250_av_ts_day       (m,:)   =s.av_ts_day;
  v.ws250_idwei_ts_day    (m,:)   =s.idwei_ts_day;
  v.ws250_av_ts_day_lat   (m,:,:) =s.av_ts_day_lat;
  v.ws250_idwei_ts_day_lat(m,:,:) =s.idwei_ts_day_lat;
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
fnmat=strcat(epath,expn,fext,'_',opt,'_diag',num2str(diag),'_readartcmcs_day_wind.mat')

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
  
