tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
epath='/analysis_allstorm/tropical_storms_wsfc/';
expn ='c192L33_am4p0_amip_HIRESMIP_H8';
fn=strcat(tpath,expn,epath,expn,'_traj.mat');
latbnd=90; wind_th=17; twc_th=2; vort_th=1.6*10^(-4); nday=3;
latbnd=45; wind_th=10; twc_th=0; vort_th=1.6*10^(-4); nday=2;
v=get_tsyearly(fn,'mod',latbnd,wind_th,twc_th,vort_th,nday);
stm=vx.yr(1).ts;
latlon=[0 360 -90 90]; wind_th=17; twc_th=3; vort_th=1.6*10^(-4); nday=2;
plot_storm_track(vx,stm,1950,latlon,wind_th,twc_th,vort_th,nday); 

fnin='/archive/Ming.Zhao/awg/warsaw_201710/c192L33_am4p0_amip_HIRESMIP_H8/analysis/cyclones_wsfc/cyclones_1950';
%fnin='/archive/Ming.Zhao/awg/warsaw_201710/c192L33_am4p0_amip_HIRESMIP_H8/analysis_45S_45N/cyclones_wsfc/cyclones_1950';
%fnin='/archive/Ming.Zhao/awg/warsaw_201710/c192L33_am4p0_amip_HIRESMIP_H8/analysis/cyclones_wsfc/cyclones_1950.old6';
fid=fopen(fnin,'r');
for n=1:10
  x(n).mon=fscanf(fid,'%d',1);
  x(n).day=fscanf(fid,'%d',1);
  x(n).yyy=fscanf(fid,'%d',1);
  x(n).num=fscanf(fid,'%d',1);
  x(n).hhh=fscanf(fid,'%d',1);
  for k=1:x(n).num
    x(n).iii(k)=fscanf(fid,'%d',1); 
    x(n).jjj(k)=fscanf(fid,'%d',1);
    x(n).lon(k)=fscanf(fid,'%f',1);
    x(n).lat(k)=fscanf(fid,'%f',1);
    tmp   =fscanf(fid,'%f',1);
    tmp   =fscanf(fid,'%f',1);
    tmp   =fscanf(fid,'%f',1);
    stmp  =fscanf(fid,'%s',1);
    stmp  =fscanf(fid,'%s',1);
    tmp   =fscanf(fid,'%f',1);
    tmp   =fscanf(fid,'%f',1);
    tmp   =fscanf(fid,'%f',1);
    tmp   =fscanf(fid,'%f',1);
  end
end

n=1;
pms=[ 0, 0, 1280, 800]*0.8; warning off all; fsize=16;lw=2; ms1=10;ms2=3;
handle = figure('Position', pms,'visible','on'); 
contourf(v.lon,v.lat,v.lm,[0.2 0.2 0.2]); hold on;
for k=1:x(n).num
  plot(x(n).lon(k),x(n).lat(k),'rs','MarkerSize',ms1,'MarkerFaceColor','r'); hold on;
end
sss=sprintf('%4d-%02d-%02d-%02d',x(n).yyy,x(n).mon,x(n).day,x(n).hhh);
title(sss,'FontSize',fsize);
axis([-10 370 -90 90]); set(gca,'FontSize',fsize); colormap(winter);
