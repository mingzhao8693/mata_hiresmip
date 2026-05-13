function [v]=readarmap_spearhi(tpath,expn,yr1,yr2,ardir,opt,varn)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%tpath='/archive/Ming.Zhao/spear_hi_8_dev/'; ardir='AR_climlmt';
%expn ='SPEAR_c384_OM4p08_Control_1990_A13'; yr1=301; yr2=302; opt='mod';

fn=strcat(tpath,expn,'/atmos.static.c192.nc'); fn
latlon=[0 360 -90 90]; g=get_grid(fn,latlon); g.opt=opt; 

fn=strcat(tpath,expn,'/atmos.static.nc'); v=get_grid(fn,latlon);

%v.lon=ncread(fn,'lon'); v.lat=ncread(fn,'lat'); a=ncread(fn,'land_mask');

v.lm=v.lm'; v.lm(v.lm>=0.5)=1; v.lm(v.lm<0.5)=0; g.lon=v.lon; g.lat=v.lat; v.g=g;

%v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
%R0=6371.0e3; dtor=1./180.*pi;
%dlat=v.lat(round(v.nlat/2))-v.lat(round(v.nlat/2)-1);
%dlon=v.lon(round(v.nlon/2))-v.lon(round(v.nlon/2)-1);
%for i=1:v.nlat
%  rad=v.lat(i)*dtor; %rad1=(v.lat(i)-0.5*dlat)*dtor;
%  v.aa0(i,1:v.nlon)=(R0*cos(rad)*dlon*dtor) * (R0*dlat*dtor);
%  v.dx (i,1:v.nlon)=(R0*cos(rad)*dlon*dtor);
%  v.dy (i,1:v.nlon)=(R0*dlat*dtor);
%  v.f  (i,1:v.nlon)= 2*pi/86400*sin(rad);
%end
%i=v.nlat; rad1=(v.lat(i)+0.5*dlat)*dtor; v.dx1(i+1,1:v.nlon)=(R0*cos(rad1)*dlon*dtor);

amean=mean(mean(v.aa0));
v.aa = v.aa0/amean;

if strcmp(varn,'iwt'); varnx='iwtx'; varny='iwty'; else; varnx='ivtx'; varny='ivty'; end;

if strcmp(expn,'c384_obs'); pre='ERA5.'; else; pre='atmos.'; end;
  
%yr1=1979; yr2=1979;
v.yr1=yr1; v.yr2=yr2; v.nyr=yr2-yr1+1;
mon=[31 28 31 30 31 30 31 31 30 31 30 31]; ddd=cumsum(mon);
d_beg=[1 ddd+1]; d_end=ddd; lat=v.lat; lon=v.lon; t=1;
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
  varn=varny;
  fn=strcat(tpath,expn,'/atmos_data/',pre,yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
  a=ncread(fn,varn); ivty=permute(a,[3 2 1]); v.nt=length(ivty(:,1,1));
%  if strcmp(expn,'c384_obs'); varn='ivtx'; pre='ERA5.'; else; varn='iwtx'; pre='atmos.'; end;
  varn=varnx;
  fn=strcat(tpath,expn,'/atmos_data/',pre,yr,'010100-',yr,'123123.',varn,'.nc');disp(fn);
  a=ncread(fn,varn); ivtx=permute(a,[3 2 1]);
  ivt=sqrt(ivtx.*ivtx+ivty.*ivty);
  
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
    
    if g.opt==1;
      'interp to lower resolution (c192)...'
      arf=interp_grid(arf,g.lonx,g.latx,g.lon,g.lat,1);
    end;
    
    v.freq_ar(m,t,:,:)=arf;
    
    a=ivty(tbeg:tend,:,:); s=get_mon_stat_spearhi(a,id,0,g);
    v.ivty_ar   (m,t,:,:)  =s.ar;
    v.ivty_aravg(m,t,:,:)  =s.aravg;
    v.ivty_armax(m,t,:,:)  =s.armax;
    v.ivty_av   (m,t,:,:)  =s.av;
    %v.ivty_pct  (m,t,:,:,:)=s.pct;

    a=ivtx(tbeg:tend,:,:); s=get_mon_stat_spearhi(a,id,0,g);
    v.ivtx_ar   (m,t,:,:)  =s.ar;
    v.ivtx_aravg(m,t,:,:)  =s.aravg;
    v.ivtx_armax(m,t,:,:)  =s.armax;
    v.ivtx_av   (m,t,:,:)  =s.av;
    %v.ivtx_pct  (m,t,:,:,:)=s.pct;

    a=ivt(tbeg:tend,:,:);  s=get_mon_stat_spearhi(a,id,0,g);
    v.ivt_ar   (m,t,:,:)  =s.ar;
    v.ivt_aravg(m,t,:,:)  =s.aravg;
    v.ivt_armax(m,t,:,:)  =s.armax;
    v.ivt_av   (m,t,:,:)  =s.av;
    %v.ivt_pct  (m,t,:,:,:)=s.pct;
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

xt=[v.yr1:v.yr2]; alpha=0.1;
v.tr.freq_ar   =get_trend_TSR_simple(v.freq_ar,xt,alpha);
v.tr.ivtx_ar   =get_trend_TSR_simple(v.ivtx_ar,xt,alpha);
v.tr.ivty_ar   =get_trend_TSR_simple(v.ivty_ar,xt,alpha);
v.tr.ivtx_av   =get_trend_TSR_simple(v.ivtx_av,xt,alpha);
v.tr.ivty_av   =get_trend_TSR_simple(v.ivty_av,xt,alpha);
v.tr.ivtx_aravg=get_trend_TSR_simple(v.ivtx_ar,xt,alpha);
v.tr.ivty_aravg=get_trend_TSR_simple(v.ivty_ar,xt,alpha);

epath='/work/miz/mat_AR/'; epath=tpath;
fnmat=strcat(epath,expn,'/',expn,'_',num2str(yr1),'_',num2str(yr2),'_readarmap_spearhi.mat')

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
  
