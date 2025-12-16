function [ve,vt,vx,vy]=get_tsyearly(fn,opt,latbnd,wind_th,twc_th,vort_th,nday)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%the following lines to be commented out
%tpath='/archive/Ming.Zhao/awg/warsaw_201803/'; opt='mod';
%expn='c192L33_am4p0_2010climo_new_newpp'; ardir='AR_climlmt'; yr1=2;yr2=31;
%epath='/analysis_allstorms/allstorms_wsfc/';
%fn=strcat(tpath,expn,epath,expn,'_traj.mat');
%clear vt ve vx vy; latbnd=30; wind_th=17; twc_th=2; vort_th=1.6*10^(-4); nday=3;
%the above lines to be commented out

path (path,'/home/miz/AM2p12b/analysis/miztstorm/mizscripts/matlab/')
load(fn); %latbnd=45; %opt='obs'; v
if(strcmp(opt,'mod'))
  trtmp=v.tr; isobs=0; %wind_th=16;
else
  trtmp=v.trobs; isobs=1; wind_th=17;
end
yr_beg=v.tr(1).year(1); yr_end=v.tr(end).year(1);

lat_trop=latbnd;
vt.tyear=[yr_beg:1:yr_end]; vt.nyr=length(vt.tyear); vt.lm=v.lm;
vt.nlon=v.nlon; vt.lon=v.lon; vt.nlat=v.nlat; vt.lat=v.lat;
ve=vt; vx=vt; vy=vt; dlat=10; dlon=10;

for t=1:vt.nyr
  i=1; j=1; k=1; l=1; t
  for n=1:length(trtmp)
    ts =trtmp(n);
    %id = (ts.wind>wind_th) & (ts.twc>twc_th) & (ts.vort>vort_th);
    %id=((sum(id)*ts.delt)/86400 > nday);
    %id0= (ts.lat(1)>=-latbnd) & (ts.lat(1)<=latbnd)
    %ts.is_tc = ((sum(id)*ts.delt)/86400 > nday);
    %idd_tc= (ts.lat(1)>=-latbnd) & (ts.lat(1)<=latbnd) & ts.is_tc;
    if strcmp(opt,'mod')
      id_wind=(ts.wind>wind_th);                  %wind speed threshold
      id_twc =(ts.twc >twc_th);                   %warm core  threshold
      id_vort=(ts.vort>vort_th);                  %vorticity  threshold
      id_all = id_wind & id_twc & id_vort;        %all
      id_dur =(sum(id_all)*ts.delt)/86400 > nday; %duration
      id_trop=(ts.lat(1)>=-lat_trop & ts.lat(1)<=lat_trop); %tropical origin
      ts.tcid=id_dur & id_trop;
      id_year=(ts.year(1) == vt.tyear(t));
      idd_tc = ts.tcid &  id_year;            %idd_tc =(idd_tc | isobs);
      idd_et =~ts.tcid & ~id_trop & id_year;  %extratropical storms;
    else
      id_year=(ts.year(1) == vt.tyear(t));
      idd_tc=id_year; idd_et=0; id_year=0;
    end
    if (idd_tc)
      vt.yr(t).ts(i)=ts; i=i+1;
    elseif (idd_et)
      ve.yr(t).ts(j)=ts; j=j+1;
    elseif (id_year)
      if (abs(ts.lat(1)-ts.lat(end))<dlat) & (abs(ts.lon(1)-ts.lon(end))<dlon)
	%disp('localized storm not counted as tropical depression');
	vy.yr(t).ts(l)=ts; l=l+1;
      else
	vx.yr(t).ts(k)=ts; k=k+1;
      end
    end
  end
end

return

stm=vx.yr(1).ts; year=1982;
latlon=[0 360 -90 90]; wind_th=0; twc_th=0; vort_th=0; nday=0;
plot_storm_track(vx,stm,year,latlon,wind_th,twc_th,vort_th,nday); 
