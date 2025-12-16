function [v]=readartcmcs_day_obs(tpath,expn,yr1,yr2,pct,opt,diag)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
%expn ='c192L33_am4p0_2010climo_new_newpp'; yr1=2; yr2=3; opt='OP';
%tpath='/archive/Ming.Zhao/backup/ECMWF/';
%expn ='ERAI_6h_DATA'; yr1=1985; yr2=1985; opt='AR';
%pct  =[99 99.9]; diag=1;

fn=strcat(tpath,expn,'/atmos_static_240_480.nc'); v.lon=ncread(fn,'lon'); 
lat=ncread(fn,'lat'); v.lat=lat;
a=ncread(fn,'land_mask');  v.lm=a';
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
m=1; varn
for m=1:length(d_end)
  v.d_beg(m)=d_beg(m); v.d_end(m)=d_end(m); %m=1; %v.d_end(m)=v.d_beg(m)+30*3; v
  %AR/TC shape/feature/ID
  %varn='AR'; ff='day'; exd='/AR_climlmt/';  exf1=''; exf2=''; exf3='';
  ff='day'; exd='/AR_allstorms_Tb_th_30/';  exf1=''; exf2=''; exf3=''; %varn='shape_olr';
  [a time]=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); size(a)
  id=isnan(a); a(id)=0; %v.a=a;
  id=(a>=1); a(id)=1; a(~id)=0; id=a; %id(id<1)=0; id(id>=1)=1;
  v.frqday_org(m,:,:)=squeeze(mean(id,1)); 
  v.sumday_org(m,:,:)=squeeze(sum (id,1)); %v.id=id; return
  %day of a year%%%%%%%%%%%%%%%%%%%%%%%
  a=findday(id,1);   v.day_from_jan1(m,:,:)=squeeze(nanmean(a,1));
  a=findday(id,181); v.day_from_jul1(m,:,:)=squeeze(nanmean(a,1));
  %precip%%%%%%%%%%%%%%%%%%%%%%%
  varn='precipitation'; ff='day'; exd='/atmos_data_240_480/daily/'; 
  exf1='mswep.'; exf2='0101-'; exf3='1231.';
  a=readallyear_mon(v,exd,varn,exf1,exf2,exf3,m,ff); size(a) %unit:mm/day
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
%  varn='pr'; ff='day'; exd='/atmos_data_240_480/daily/'; exf1='atmos.'; exf2='0101-'; exf3='1231.';
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
  if (diag==0); break; end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  varn='prw'; ff='day'; exd='/atmos_data_240_480/daily/'; exf1='atmos.'; exf2='0101-'; exf3='1231.';
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
  varn='ivty'; ff='day'; exd='/atmos_data_240_480/daily/';  exf1='atmos.'; exf2='0101-'; exf3='1231.';
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
  varn='ivtx'; ff='day'; exd='/atmos_data_240_480/daily/';  exf1='atmos.'; exf2='0101-'; exf3='1231.';
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
end
epath='/work/miz/mat_hiresmip/';
%fext =strcat('_',num2str(yr1),'_',num2str(yr2),'_',num2str(v.d_beg(m)),'_',num2str(v.d_end(m)));
fext =strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(epath,expn,fext,'_',opt,'_diag',num2str(diag),'_readartcmcs_day.mat')

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
  
