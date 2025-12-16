function v1=plottraj_mlat(v1, year)

pms=[ 0, 0, 1280, 800]*1.; warning off all; fac=20; fsize=16;
handle = figure('Position', pms,'visible','on'); 

latbnd=30; no=0; num3=0; num4=0;
iwho=1; lw=2; msize=3; fsize=16;
trtmp=v1.tr; wind0=14;
%contourf(v1.lon, v1.lat, v1.lm,'g'); hold on;
for k=1:length(trtmp)
  ts =trtmp(k); ts1=ts;
%  if (ts.windmax>25); ts.hur=1; end;
  for i=1:ts.num-1
    if (ts.lon(i)>320 & ts.lon(i+1)<250)
       ts.lon(i+1)=ts.lon(i+1)+360;
    elseif (ts.lon(i)<40 & ts.lon(i+1)>300)
      ts.lon(i+1)=ts.lon(i+1)-360; %ts.hur=2;
    end
  end
  %if ts.hur==2; disp(ts1.lon); disp(ts.lon);end;
  idd= (ts.lat(1)<-latbnd | ts.lat(1)>latbnd);
%  if (ts.hur>=iwho & ts.yearmax==year & (ts.boxnumb==2|ts.boxnumb==3)&idd)
  if (ts.year(1)==year &idd)
    plot(ts.lon,ts.lat,'r-','LineWidth',lw,'MarkerSize',msize);hold on;
    sss=sprintf('%4d%2d%2d',ts.year(1),ts.month(1),ts.day(1));
    %text(ts.lon(1),ts.lat(1),sss,'FontSize',fsize);
    no=no+1; v1.s(no).ts=ts;
    for i=1:ts.num
      if (ts.wind(i)>34)
	plot(ts.lon(i),ts.lat(i),'yo-','LineWidth',lw,'MarkerSize',msize,'MarkerFaceColor','y');
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
v1.no_cat1=no;
v1.no_cat3=num3;
v1.no_cat4=num4;

axis([-40 480 -80 80]); 
set(gca,'FontSize',fsize);colormap(winter);

return
