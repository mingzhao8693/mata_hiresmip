function vx=plot_storm_track(v,stm,year,latlon,wind_th,twc_th,vort_th,nday)
%wind_th=17; %latbnd=90;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
lat_trop=30; no.tc=0; no.ts=0; no.es_sh=0; no.es_nh=0; no.total_storm=0;

lonb=[0:  5:360]; lonfq=(lonb(1:end-1)+lonb(2:end))/2; nlon=length(lonfq);
latb=[-90:4:90 ]; latfq=(latb(1:end-1)+latb(2:end))/2; nlat=length(latfq);
fq_stm=zeros(nlat,nlon); gs_stm=zeros(nlat,nlon);

pms=[ 0, 0, 1280, 800]*1.5; warning off all; fsize=16;lw=1; ms1=5;ms2=3;
handle = figure('Position', pms,'visible','on'); 
contourf(v.lon,v.lat,v.lm,[0.2 0.2 0.2]); hold on;

for k=1:length(stm)
  ts =stm(k); ts.twcmax=max(ts.twc);
  id_wind=(ts.wind>wind_th);
  id_twc =(ts.twc>twc_th);
  id_vort=(ts.vort>vort_th);
  id_all = id_wind & id_twc & id_vort;
  id_dur =(sum(id_all)*ts.delt)/86400 > nday;
  id_trop=(ts.lat(1)>=-lat_trop & ts.lat(1)<=lat_trop);
  ts.tcid=id_dur & id_trop;
  for i=1:ts.num-1
    if (ts.lon(i)>320 & ts.lon(i+1)<250)
      %sss=sprintf('%4d-%02d-%02d-%f-%f-%f',ts.year(i),ts.month(i),ts.day(i),ts.lat(i),ts.lon(i),ts.lon(i+1)); disp(sss)
      ts.lon(i+1)=ts.lon(i+1)+360; %disp([ts.lon(i) ts.lon(i+1)])
    elseif (ts.lon(i)<40 & ts.lon(i+1)>300)
      ts.lon(i+1)=ts.lon(i+1)-360;
    end
  end
  idd = (ts.lat(1)>=lat1 & ts.lat(1)<=lat2 & ts.lon(1)>=lon1 & ts.lon(1)<=lon2);
  idd = idd & (ts.yearmax==year); %idd= idd & (ts.boxnumb==2 | ts.boxnumb==3);
  if (idd)
    if (ts.tcid)
      plot(ts.lon,ts.lat,'r-','LineWidth',lw,'MarkerSize',ms1);hold on;
      for i=1:ts.num
	if (ts.twc(i)>=twc_th)
	  plot(ts.lon(i),ts.lat(i),'m.-','LineWidth',lw,'MarkerSize',ms1,'MarkerFaceColor','m');
	  if (ts.wind(i)>33)
	    plot(ts.lon(i),ts.lat(i),'yo-','LineWidth',lw,'MarkerSize',ms2,'MarkerFaceColor','y');
	  end
	end
      end
      plot(ts.lon(1),ts.lat(1),'rs','LineWidth',lw,'MarkerSize',ms1,'MarkerFaceColor','r');
    else
      plot(ts.lon,ts.lat,'k-','LineWidth',lw,'MarkerSize',ms1);hold on;
      for i=1:ts.num
	if (ts.twc(i)>=twc_th)
	  plot(ts.lon(i),ts.lat(i),'m.-','LineWidth',lw,'MarkerSize',ms1,'MarkerFaceColor','m');
	  if (ts.wind(i)>33)
	    plot(ts.lon(i),ts.lat(i),'yo-','LineWidth',lw,'MarkerSize',ms2,'MarkerFaceColor','y');
	  end
	end
      end
      plot(ts.lon(1),ts.lat(1),'ks','LineWidth',lw,'MarkerSize',ms1,'MarkerFaceColor','k');
    end
    sss=sprintf('%4d-%02d-%02d',ts.year(1),ts.month(1),ts.day(1));
    %text(ts.lon(1),ts.lat(1),sss,'FontSize',fsize);
    no.total_storm = no.total_storm + 1;
    if (ts.tcid)
      no.tc=no.tc+1; vx.tc(no.tc).ts=ts;
    elseif (ts.lat(1)>=-lat_trop & ts.lat(1)<=lat_trop)
      no.ts=no.ts+1; vx.ts(no.ts).ts=ts;
    elseif (ts.lat(1)<-lat_trop)
      no.es_sh=no.es_sh+1; vx.es_sh(no.es_sh).ts=ts;
    elseif (ts.lat(1)> lat_trop)
      no.es_nh=no.es_nh+1; vx.es_nh(no.es_nh).ts=ts;
    end
    
    ii=find(ts.lon(1)>=lonb,1,'last'); ii=min(ii,nlon);
    jj=find(ts.lat(1)>=latb,1,'last'); jj=min(jj,nlat);
    gs_stm(jj,ii)=gs_stm(jj,ii)+1;
    for i=1:ts.num
      ii=find(ts.lon(i)>=lonb,1,'last'); ii=min(ii,nlon);
      jj=find(ts.lat(i)>=latb,1,'last'); jj=min(jj,nlat);
      fq_stm(jj,ii)=fq_stm(jj,ii)+1;
    end
  
  end
end
vx.no=no; 
title(strcat(num2str(year),'; total number = ',num2str(no.tc)));
vx.latfq=latfq; vx.lonfq=lonfq; vx.latb=latb; vx.lonb=lonb; 
vx.gs_stm=gs_stm; 
vx.fq_stm=fq_stm;

axis([-10 370 -80 80]); set(gca,'FontSize',fsize); colormap(winter);

return
