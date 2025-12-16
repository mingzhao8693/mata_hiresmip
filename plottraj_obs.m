function v1=plottraj_obs(v1,year,latbnd,iwho)

fac=20; fsize=16;lw=2; msize=3;
no=0; num0=0; num1=0; num3=0; num4=0; %iwho=0; %latbnd=90;
trtmp=v1.trobs; wind0=14;

pms=[ 0, 0, 1280, 800]*1; warning off all; 
handle = figure('Position', pms,'visible','on'); 
contourf(v1.lon, v1.lat, v1.lm,'g'); hold on;
for k=1:length(trtmp)
  ts =trtmp(k); ts1=ts; ts.hur=0;
  if (ts.windmax>=34 & ts.windmax<50); 
    ts.hur=1; 
  elseif (ts.windmax>=50 & ts.windmax<60)
    ts.hur=3;
  elseif (ts.windmax>=60)
    ts.hur=4;
  end;
% $$$  for i=1:ts.num-1
% $$$     if (ts.lon(i)>320 & ts.lon(i+1)<250)
% $$$        ts.lon(i+1)=ts.lon(i+1)+360;
% $$$     elseif (ts.lon(i)<40 & ts.lon(i+1)>300)
% $$$       ts.lon(i+1)=ts.lon(i+1)-360; %ts.hur=2;
% $$$     end
% $$$  end
  idd= (ts.lat(1)>-latbnd & ts.lat(1)<latbnd);
% idd= idd & (ts.boxnumb==2|ts.boxnumb==3);
  if (ts.hur>=iwho & ts.yearmax==year &idd)
    if (ts.hur==0)
      plot(ts.lon,ts.lat,'r-','LineWidth',lw,'MarkerSize',msize);hold on;
    elseif (ts.hur==1)
      plot(ts.lon,ts.lat,'m-','LineWidth',lw,'MarkerSize',msize);hold on;
    elseif (ts.hur==3)
      plot(ts.lon,ts.lat,'y-','LineWidth',lw,'MarkerSize',msize);hold on;
    elseif (ts.hur==4)
      plot(ts.lon,ts.lat,'*y-','LineWidth',lw,'MarkerSize',msize);hold on;
    end      
    sss=sprintf('%4d%2d%2d',ts.year(1),ts.month(1),ts.day(1));
    text(ts.lon(1),ts.lat(1),sss,'FontSize',fsize);
    no=no+1; v1.yr(no).ts=ts;
    if (ts.hur>=0); num0=num0+1; end;
    if (ts.hur>=1); num1=num1+1; end;
    if (ts.hur>=3); num3=num3+1; end;
    if (ts.hur>=4); num4=num4+1; end;
% $$$     for i=1:ts.num
% $$$       if (ts.wind(i)>34)
% $$$ 	plot(ts.lon(i),ts.lat(i),'yo-','LineWidth',lw,'MarkerSize',msize,'MarkerFaceColor','y');
% $$$ 	v1.yr(no).wind1(i)=wind0+3.* (ts.wind(i)-wind0);
% $$$       else
% $$$ 	v1.yr(no).wind1(i)=wind0+1.2*(ts.wind(i)-wind0);
% $$$       end
% $$$     end
% $$$     if (max(v1.s(no).wind1)>50)
% $$$       num3=num3+1;
% $$$     end
% $$$     if (max(v1.s(no).wind1)>60)
% $$$       num4=num4+1;
% $$$     end
% $$$     v1.maxwind (no)=max(ts.wind);
% $$$     v1.maxwind1(no)=max(v1.s(no).wind1(:));
  end
end
v1.no.no  =no;
v1.no.cat0=num0;
v1.no.cat1=num1;
v1.no.cat3=num3;
v1.no.cat4=num4;
s=sprintf('total TS=%3d; total hurricane=%3d; total major hurricanes=%3d',num0,num1,num3);
title(s,'FontSize',fsize); axis([0 360 -90 90]); 
set(gca,'FontSize',fsize);colormap(winter);

return
