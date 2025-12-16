function v1=plottraj_all(v1,year_s,year_e,opt)
pms=[ 0, 0, 1280, 500]*1.; warning off all; fac=20; fsize=16;
handle = figure('Position', pms,'visible','on'); 
latbnd=90; no=0; num3=0; num4=0; wind0=14;
iwho=0; lw=0.5; msize=1; fsize=16;
if(strcmp(opt,'mod'))
  trtmp=v1.tr; wind_th=29;
else
  trtmp=v1.trobs; wind_th=33;
end
contourf(v1.lon, v1.lat, v1.lm,'g'); hold on;
for k=1:length(trtmp)
  ts =trtmp(k); ts1=ts;
  if (ts.windmax>=wind_th); ts.hur=1; else ts.hur=0; end;
  for i=1:ts.num-1
    if (ts.lon(i)>320 & ts.lon(i+1)<250)
       ts.lon(i+1)=ts.lon(i+1)+360;
    elseif (ts.lon(i)<40 & ts.lon(i+1)>300)
      ts.lon(i+1)=ts.lon(i+1)-360; %ts.hur=2;
    elseif (ts.lon(i)<180 & ts.lon(i+1)>180 & ts.boxname=='WP')
      ts.boxname;
    end
  end
  %if ts.hur==2; disp(ts1.lon); disp(ts.lon);end;
  idd= (ts.lat(1)>-latbnd & ts.lat(1)<latbnd);
%  if (ts.hur>=iwho & ts.yearmax==year & (ts.boxnumb==2|ts.boxnumb==3)&idd)
  if (ts.hur>=iwho & ts.yearmax>=year_s & ts.yearmax<=year_e & idd)
%    plot(ts.lon,ts.lat,'r-','LineWidth',lw,'MarkerSize',msize);hold on;
    plot(ts.lon,ts.lat,'r-','LineWidth',lw);hold on;
    sss=sprintf('%4d%2d%2d',ts.year(1),ts.month(1),ts.day(1));
    %text(ts.lon(1),ts.lat(1),sss,'FontSize',fsize);
    no=no+1; v1.s(no).ts=ts;
    for i=1:ts.num
      if (ts.wind(i)>34)
	%plot(ts.lon(i),ts.lat(i),'yo-','LineWidth',lw,'MarkerSize',msize,'MarkerFaceColor','y');
	v1.s(no).wind1(i)=wind0+3.* (ts.wind(i)-wind0);
      else
	v1.s(no).wind1(i)=wind0+1.2*(ts.wind(i)-wind0);
      end
    end
    if (max(v1.s(no).wind1)>50)
      num3=num3+1;
    end
    if (max(v1.s(no).wind1)>60)
      num4=num4+1;
    end
    v1.maxwind (no)=max(ts.wind);
    v1.maxwind1(no)=max(v1.s(no).wind1(:));
  end
end
v1.no_cat0=no;
v1.no_cat3=num3;
v1.no_cat4=num4;

axis([-40 480 -80 80]); 
axis([0 360 -60 60]); 
set(gca,'FontSize',fsize);colormap(winter);
visfig='off'; figpath='./fig_TC/'; expn='C192AM4'; 
vname=strcat(opt,'_ts_traj_',num2str(year_s),'_',num2str(year_e));
printit(visfig,figpath,expn,vname);

return
