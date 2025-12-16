function [v]=readarmap_sim(tpath,expn,yr1,yr2,ardir,opt)
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

%yr1=1979; yr2=1979;
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

  fn=strcat(tpath,expn,'/',ardir,'/',expn,'_AR_',yr,'.nc');disp(fn);
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
    %varn='pr';
    %fn=strcat(tpath,expn,'/atmos_data/6hr_avg/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    %a=ncread(fn,varn); prav6h=permute(a,[3 2 1])*86400;
    %varn='pr';
    %fn=strcat(tpath,expn,'/atmos_data/6hr/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    %a=ncread(fn,varn); prin6h=permute(a,[3 2 1])*86400;
    varn='prw';
    fn=strcat(tpath,expn,'/atmos_data/6hr/','atmos_cmip.',yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); prw=permute(a,[3 2 1]);

    varn='pr';
    fn=strcat(tpath,expn,'/atmos_data/daily/','atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); pravdd=permute(a,[3 2 1])*86400;;
    varn='tas';
    fn=strcat(tpath,expn,'/atmos_data/daily/','atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); tas=permute(a,[3 2 1]);    
    varn='tasmax';
    fn=strcat(tpath,expn,'/atmos_data/daily/','atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc');disp(fn);
    a=ncread(fn,varn); tasmax=permute(a,[3 2 1]);  
    %varn='tasmin';
    %fn=strcat(tpath,expn,'/atmos_data/daily/','atmos_cmip.',yr,'0101-',yr,'1231.',varn,'.nc');disp(fn);
    %a=ncread(fn,varn); tasmin=permute(a,[3 2 1]);    
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
    
    v.ar_zscale(m,t,:)=get_zonal_scale(id); %figure; plot(v.lat,squeeze(v.ar_zscale(1,1,:)));return
    
    arf=squeeze(mean(id,1)); %unit: frequency measured by fraction of time-steps
    v.freq_ar(m,t,:,:)=arf;
    
    a=ivty(tbeg:tend,:,:); s=get_mon_stat_sim(a,id,0);
    v.ivty_ar   (m,t,:,:)  =s.ar;
    v.ivty_aravg(m,t,:,:)  =s.aravg;
    v.ivty_armax(m,t,:,:)  =s.armax;
    v.ivty_av   (m,t,:,:)  =s.av;
    %v.ivty_pct  (m,t,:,:,:)=s.pct;

    a=ivtx(tbeg:tend,:,:); s=get_mon_stat_sim(a,id,0);
    v.ivtx_ar   (m,t,:,:)  =s.ar;
    v.ivtx_aravg(m,t,:,:)  =s.aravg;
    v.ivtx_armax(m,t,:,:)  =s.armax;
    v.ivtx_av   (m,t,:,:)  =s.av;
    %v.ivtx_pct  (m,t,:,:,:)=s.pct;

    a=ivt(tbeg:tend,:,:);  s=get_mon_stat_sim(a,id,0);
    v.ivt_ar   (m,t,:,:)  =s.ar;
    v.ivt_aravg(m,t,:,:)  =s.aravg;
    v.ivt_armax(m,t,:,:)  =s.armax;
    v.ivt_av   (m,t,:,:)  =s.av;
    %v.ivt_pct  (m,t,:,:,:)=s.pct;

    %conditional sampling of other AR properties
    %a=prav6h(tbeg:tend,:,:); s=get_mon_stat_sim(a,id,0);
    %v.prav6h_ar   (m,t,:,:)  =s.ar;    %ar
    %v.prav6h_aravg(m,t,:,:)  =s.aravg; %ar average
    %v.prav6h_armax(m,t,:,:)  =s.armax; %ar max
    %v.prav6h_av   (m,t,:,:)  =s.av;    %monthly average
    %v.prav6h_pct  (m,t,:,:,:)=s.pct;   %monthly average
    %v.prav6h.f    (m,t,:,:,:)=s.f;    %rain frequency
   
    a=prw(tbeg:tend,:,:);  s=get_mon_stat_sim(a,id,0);
    v.prw_ar   (m,t,:,:)  =s.ar;
    v.prw_aravg(m,t,:,:)  =s.aravg;
    v.prw_armax(m,t,:,:)  =s.armax;
    v.prw_av   (m,t,:,:)  =s.av;
    %v.prw_pct  (m,t,:,:,:)=s.pct;
  
    if strcmp(opt,'mod')
      %a=prin6h(tbeg:tend,:,:); s=get_mon_stat_sim(a,id,0);
      %v.prin6h_ar   (m,t,:,:)  =s.ar;
      %v.prin6h_aravg(m,t,:,:)  =s.aravg;
      %v.prin6h_armax(m,t,:,:)  =s.armax;
      %v.prin6h_av   (m,t,:,:)  =s.av;
      %v.prin6h_pct  (m,t,:,:,:)=s.pct;
      
      a=pravdd(dbeg:dend,:,:); s=get_mon_stat_sim(a,id_day,0);
      v.pravdd_ar   (m,t,:,:)  =s.ar;
      v.pravdd_aravg(m,t,:,:)  =s.aravg;
      v.pravdd_armax(m,t,:,:)  =s.armax;
      v.pravdd_av   (m,t,:,:)  =s.av;
      %v.pravdd_pct  (m,t,:,:,:)=s.pct;
      
      a=tas(dbeg:dend,:,:);   s=get_mon_stat_sim(a,id_day,0);
      v.tas_ar      (m,t,:,:) =s.ar;
      v.tas_aravg   (m,t,:,:) =s.aravg;
      v.tas_armax   (m,t,:,:) =s.armax;
      v.tas_av      (m,t,:,:) =s.av;

      a=tasmax(dbeg:dend,:,:); s=get_mon_stat_sim(a,id_day,0);
      v.tasmax_ar   (m,t,:,:) =s.ar;
      v.tasmax_aravg(m,t,:,:) =s.aravg;
      v.tasmax_armax(m,t,:,:) =s.armax;
      v.tasmax_av   (m,t,:,:) =s.av;
      
      %a=tasmin(dbeg:dend,:,:); s=get_mon_stat_sim(a,id_day,0);
      %v.tasmin_ar   (m,t,:,:)  =s.ar;
      %v.tasmin_aravg(m,t,:,:)  =s.aravg;
      %v.tasmin_armax(m,t,:,:)  =s.armax;
      %v.tasmin_av   (m,t,:,:)  =s.av;
      
    end
  end
end

a=v.freq_ar;    v.freq_ar_clm     = get_clm_ann(a);

a=v.ivty_ar;    v.ivty_ar_clm     = get_clm_ann(a);
a=v.ivty_aravg; v.ivty_aravg_clm  = get_clm_ann(a);
a=v.ivty_armax; v.ivty_armax_clm  = get_clm_ann(a);
a=v.ivty_av;    v.ivty_av_clm     = get_clm_ann(a);

a=v.ivtx_ar;    v.ivtx_ar_clm     = get_clm_ann(a);
a=v.ivtx_aravg; v.ivtx_aravg_clm  = get_clm_ann(a);
a=v.ivtx_armax; v.ivtx_armax_clm  = get_clm_ann(a);
a=v.ivtx_av;    v.ivtx_av_clm     = get_clm_ann(a);

a=v.ivt_ar;     v.ivt_ar_clm      = get_clm_ann(a);
a=v.ivt_aravg;  v.ivt_aravg_clm   = get_clm_ann(a);
a=v.ivt_armax;  v.ivt_armax_clm   = get_clm_ann(a);
a=v.ivt_av;     v.ivt_av_clm      = get_clm_ann(a);

%a=v.prav6h_ar;    v.prav6h_ar_clm    = get_clm_ann(a);
%a=v.prav6h_aravg; v.prav6h_aravg_clm = get_clm_ann(a);
%a=v.prav6h_armax; v.prav6h_armax_clm = get_clm_ann(a);
%a=v.prav6h_av;    v.prav6h_av_clm    = get_clm_ann(a);

a=v.prw_ar;       v.prw_ar_clm    = get_clm_ann(a);
a=v.prw_aravg;    v.prw_aravg_clm = get_clm_ann(a);
a=v.prw_armax;    v.prw_armax_clm = get_clm_ann(a);
a=v.prw_av;       v.prw_av_clm    = get_clm_ann(a);

if strcmp(opt,'mod')
  %a=v.prin6h_ar;    v.prin6h_ar_clm    = get_clm_ann(a);
  %a=v.prin6h_aravg; v.prin6h_aravg_clm = get_clm_ann(a);
  %a=v.prin6h_armax; v.prin6h_armax_clm = get_clm_ann(a);
  %a=v.prin6h_av;    v.prin6h_av_clm    = get_clm_ann(a);
  
  a=v.tas_ar;       v.tas_ar_clm       = get_clm_ann(a);
  a=v.tas_aravg;    v.tas_aravg_clm    = get_clm_ann(a);
  a=v.tas_armax;    v.tas_armax_clm    = get_clm_ann(a);
  a=v.tas_av;       v.tas_av_clm       = get_clm_ann(a);

  a=v.tasmax_ar;    v.tasmax_ar_clm    = get_clm_ann(a);
  a=v.tasmax_aravg; v.tasmax_aravg_clm = get_clm_ann(a);
  a=v.tasmax_armax; v.tasmax_armax_clm = get_clm_ann(a);
  a=v.tasmax_av;    v.tasmax_av_clm    = get_clm_ann(a);
  
  %a=v.tasmin_ar;    v.tasmin_ar_clm    = get_clm_ann(a);
  %a=v.tasmin_aravg; v.tasmin_aravg_clm = get_clm_ann(a);
  %a=v.tasmin_armax; v.tasmin_armax_clm = get_clm_ann(a);
  %a=v.tasmin_av;    v.tasmin_av_clm    = get_clm_ann(a);
  
end

%fnmat=strcat('/work/miz/mat_hiresmip/',expn,'_readarmap.mat')
epath='/work/miz/mat_AR/';
fnmat=strcat(epath,expn,'_',num2str(yr1),'_',num2str(yr2),'_',ardir,'_readarmap_sim1.mat')

save(fnmat,'v','-v7.3'); %save(fnmat,'v');

return

tpath='/archive/Ming.Zhao/backup/ECMWF/';
expn ='ERAI_6h_DATA'; yr1=1979; yr2=2014; opt='obs';
v=readarmap_sim(tpath,expn,yr1,yr2,opt)

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn ='c192L33_am4p0_amip_HIRESMIP_H8'; yr1=1979; yr2=2014; opt='mod';
v=readarmap_sim(tpath,expn,yr1,yr2,opt)


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
  
