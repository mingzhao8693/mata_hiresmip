function vx=plot_tc_oneyear(v,tc,year,latlon,wind_th,twc_th,vort_th,nday)
%wind_th=17; %latbnd=90;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);

no=0; num1=0; num3=0; num4=0; wind0=14;
pms=[ 0, 0, 1280, 800]*1.5; warning off all; fsize=16;lw=2; ms1=5;ms2=3;
handle = figure('Position', pms,'visible','on'); 
contourf(v.lon,v.lat,v.lm,[0.2 0.2 0.2]); hold on;

for k=1:length(tc)
  ts =tc(k); ts.twcmax=max(ts.twc); 
  id=(ts.wind>wind_th) & (ts.twc>twc_th) & (ts.vort>vort_th);
  ts.is_tc=((sum(id)*ts.delt)/86400 > nday);
  for i=1:ts.num-1
    if (ts.lon(i)>320 & ts.lon(i+1)<250)
      %sss=sprintf('%4d-%02d-%02d-%f-%f-%f',ts.year(i),ts.month(i),ts.day(i),ts.lat(i),ts.lon(i),ts.lon(i+1)); disp(sss)
      ts.lon(i+1)=ts.lon(i+1)+360; %disp([ts.lon(i) ts.lon(i+1)])
    elseif (ts.lon(i)<40 & ts.lon(i+1)>300)
      ts.lon(i+1)=ts.lon(i+1)-360; %ts.hur=2;
    end
  end
  idd = (ts.lat(1)>=lat1 & ts.lat(1)<=lat2 & ts.lon(1)>=lon1 & ts.lon(1)<=lon2);
  idd = idd & (ts.windmax>=wind_th) & (ts.yearmax==year);
  idd = idd & ts.is_tc;
% idd = idd & (ts.boxnumb==2 | ts.boxnumb==3)
  if (idd)
    plot(ts.lon,ts.lat,'k-','LineWidth',lw,'MarkerSize',ms1);hold on;
    for i=1:ts.num
      if (ts.twc(i)>=4)
	plot(ts.lon(i),ts.lat(i),'r.-','LineWidth',lw,'MarkerSize',ms1,'MarkerFaceColor','y');
	if (ts.wind(i)>33)
	  plot(ts.lon(i),ts.lat(i),'yo-','LineWidth',lw,'MarkerSize',ms2,'MarkerFaceColor','y');
	end
      end
    end
    plot(ts.lon(1),ts.lat(1),'ks','LineWidth',lw,'MarkerSize',ms1,'MarkerFaceColor','k');
    sss=sprintf('%4d-%02d-%02d',ts.year(1),ts.month(1),ts.day(1));
%    text(ts.lon(1),ts.lat(1),sss,'FontSize',fsize);
    no=no+1; vx.s(no).ts=ts;
    for i=1:ts.num
      if (ts.wind(i)>33)
	vx.s(no).wind1(i)=wind0+3.* (ts.wind(i)-wind0);
      else
	vx.s(no).wind1(i)=wind0+1.2*(ts.wind(i)-wind0);
      end
    end
    if (max(vx.s(no).wind1)>33); num1=num1+1; end;
    if (max(vx.s(no).wind1)>50); num3=num3+1; end;
    if (max(vx.s(no).wind1)>60); num4=num4+1; end;
    vx.maxwind (no)=max(ts.wind);
    vx.maxwind1(no)=max(vx.s(no).wind1(:));
  end
end
title(strcat('total TC number:',num2str(no)));
vx.no_cat0=no;
vx.no_cat1=num1;
vx.no_cat3=num3;
vx.no_cat4=num4;

axis([-10 370 -80 80]); set(gca,'FontSize',fsize); colormap(winter);

return
