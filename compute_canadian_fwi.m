function [v]=compute_canadian_fwi(v)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute Canadian FWI along with FFMC, DMC, DC, ISI, BUI, FWI and DSR
%using daily mean TAS and wind speed
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lat2d=repmat(v.lat,[1 v.nlon]); %latitude of the data
for k=1:length(v.prday.var)
  mn=v.prday.var (k).mofy;         %month of the day
  pr=v.prday.var (k).a;            %precip,            unit: mm per day
  ta=v.tasday.var(k).a;            %temperature,       unit: C
  rh=v.rhday.var (k).a;            %relative humidity, unit: %
  wm=v.wsdday.var(k).a*0.001*3600; %wind, unit changed from m/s to km/h
  a=fwi2D_vectorized(mn,ta,rh,pr,wm,lat2d,{'FFMC','DMC','DC','ISI','BUI','FWI','DSR'});
  var1(k).a=a;
end
n=length(var1); pct=v.pct; opt=v.opt; thresh=[100]; 
for k=1:n; var(k).a=var1(k).a.FFMC; end; v.fwiday.ffmc=extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.DMC;  end; v.fwiday.dmc =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.DC;   end; v.fwiday.dc  =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.ISI;  end; v.fwiday.isi =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.BUI;  end; v.fwiday.bui =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.FWI;  end; v.fwiday.fwi =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.DSR;  end; v.fwiday.dsr =extremes_ana(var,pct,thresh,opt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute Canadian FWI along with FFMC, DMC, DC, ISI, BUI, FWI and DSR
%using daily max TAS and wind speed, and daily min RH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lat2d=repmat(v.lat,[1 v.nlon]); %latitude of the data
for k=1:length(v.prday.var)
  mn=v.prday.var(k).mofy;          %month of the day
  pr=v.prday.var(k).a;             %daily mean precip,            unit: mm per day
  ta=v.tasmaxday.var(k).a;         %maximum daily temperature,       unit: C
  rh=v.rhminday.var(k).a;          %minimum daily relative humidity, unit: %
  wm=v.wsdmaxday.var(k).a*0.001*3600; %maximum windspeed, unit changed from m/s to km/h
  a=fwi2D_vectorized(mn,ta,rh,pr,wm,lat2d,{'FFMC','DMC','DC','ISI','BUI','FWI','DSR'});
  var1(k).a=a;
end
n=length(var); pct=v.pct; opt=v.opt; thresh=[100];
for k=1:n; var(k).a=var1(k).a.FFMC; end; v.fwidaymax.ffmc=extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.DMC;  end; v.fwidaymax.dmc =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.DC;   end; v.fwidaymax.dc  =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.ISI;  end; v.fwidaymax.isi =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.BUI;  end; v.fwidaymax.bui =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.FWI;  end; v.fwidaymax.fwi =extremes_ana(var,pct,thresh,opt);
for k=1:n; var(k).a=var1(k).a.DSR;  end; v.fwidaymax.dsr =extremes_ana(var,pct,thresh,opt);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%compute FWI using a statistical log-linear regression model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for k=1:length(og.prday)
%  pr=v.prday.var(k).a;  %unit: mm/day
%  ta=v.tasday.var(k).a; %unit: C
%  rh=v.rhday.var(k).a;  %unit: %
%  wm=v.wsdday.var(k).a*0.001*3600; %change unit from m/s to km/h
%  a=estimate_fwi_regression(ta,rh,wm,pr); var(k).a=a;
%end
%thresh=[1 10 20 30]; v.fwiday_stat=extremes_ana(var,pct,thresh,opt);
%compute FWIMAXDAY%%%%%%%%%%%%%
%for k=1:length(og.prday)
%  pr=v.prday.var(k).a;                 %daily precipitation
%  ta=v.tasmaxday.var(k).a;             %daily maximum SAT
%  rh=v.rhmaxday.var(k).a;              %daily maximum RH
%  wm=v.wsdmaxday.var(k).a*0.001*3600; %daily maximum 10m wind speed
%  a=estimate_fwi_regression(ta,rh,wm,pr); var(k).a=a;
%end
%thresh=[1 10 20 30]; v.fwimaxday_stat=extremes_ana(var,pct,thresh,opt);

return
