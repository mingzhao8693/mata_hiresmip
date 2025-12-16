function v=get_trend_TSR_simple(g,a,xt,alpha)
%note xt must be column vector otherwise it returns with NaN
nlat=length(g.lat); nlon=length(g.lon);
for j=1:nlat
  for i=1:nlon
    y=squeeze(a(:,j,i));
    trend(j,i)=Theil_Sen_Regress(xt,y)*10; %K/decade
    %c=polyfit(xt,y,1); slope1(j,i)=c(1);
    [ht,pv]=Mann_Kendall(y,alpha);
    signif(j,i)=ht;
    pvalue(j,i)=pv;
  end
end
v.xt=xt; v.mean=squeeze(mean(a,1));
v.trend=trend; v.signif=signif; v.pvalue=pvalue;
return

var=a; %because a is overwritten
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
o=g; o.land_th=0.1; o.ice_th=0.5;
a=o.lm0; a(a>=o.land_th)=1; a(a<o.land_th)=0; lm=a; %land mask
a=o.imk; a(a>=o.ice_th) =1; a(a<=o.ice_th)=0; im=a; %ice mask
idm=lm|im; id=~idm;                             %land & ice mask
aa=o.aa; aa0=aa(id)/mean(aa(id));               %for open ocean area-weighting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lon=o.lon; lat=o.lat; rg.idm_all=idm; rg.id_all=id;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%rg.latlon_tpac=[140 270 -10 10]; a=rg.latlon_tpac; %rg:tropical Pacific region
rg.latlon_tpac=[110 280 -10 10]; a=rg.latlon_tpac; %rg:tropical Pacific region
lat1=a(3); lat2=a(4); lon1=a(1); lon2=a(2);
rg.tpac=[lon1 lat1 lon2-lon1 lat2-lat1];
rg.ys=min(find(lat(:)>=lat1)); rg.ye=max(find(lat(:)<=lat2));
rg.xs=min(find(lon(:)>=lon1)); rg.xe=max(find(lon(:)<=lon2));
a=id; a(:,:)=0; a(rg.ys:rg.ye,rg.xs:rg.xe)=1; rg.id=a; rg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rg.latlon_wpac=[110 180 -10  10];  %west pacific
rg.latlon_epac=[180 280 -10  10];  %east Pacific
rg.latlon_nhep=[180 280  5   10];
rg.latlon_shep=[180 280 -10  -5];
rg.latlon_equa=[180 280 -5    5];
%rg.latlon_wpac=[140 170 -3    3];  %west pacific
%rg.latlon_epac=[190 270 -3    3];  %east Pacific
%rg.latlon_nhep=[190 240  3    9];
%rg.latlon_shep=[190 240 -9   -3];
%rg.latlon_equa=[190 240 -3    3];
rg.latlon_darw=[130 132 -14 -12];
rg.latlon_tahi=[210 212 -18 -16];

rg.latlon_ipwp=[50  180 -30  30];
rg.latlon_trop=[0   360 -30  30];
rg.latlon_so  =[0   360 -75 -45];
rg.latlon_glob=[0   360 -90  90];
a=rg.latlon_ipwp; rg.ipwp=[a(1) a(3) a(2)-a(1) a(4)-a(3)];

a=var; b=get_sst_indices(o,a,rg); v.ind=b; b

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a=var; %put back a value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lm=g.lm0; lm(lm>=0.1)=1; lm(lm<0.1)=0; oc=~lm; 
%nt=length(a(:,1,1)); oc=repmat(oc,[1 1 nt]); oc=permute(oc,[3,1,2]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Nino3.4 SST%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear z;
latlon=[190 240 -5 5]; z.latlon=latlon;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
lat=g.lat; lon=g.lon;
ys=min(find(lat(:)>=lat1)); ye=max(find(lat(:)<= lat2));
xs=min(find(lon(:)>=lon1)); xe=max(find(lon(:)<= lon2));
y=squeeze(mean(mean(a(:,ys:ye,xs:xe),3),2));
z.trend=Theil_Sen_Regress(xt,y)*10; z.sst=y; 
v.nino34=z;
%Nino12 SST%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear z;
latlon=[270 280 -10 0]; z.latlon=latlon;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
lat=g.lat; lon=g.lon;
ys=min(find(lat(:)>=lat1)); ye=max(find(lat(:)<= lat2));
xs=min(find(lon(:)>=lon1)); xe=max(find(lon(:)<= lon2));
y=squeeze(mean(mean(a(:,ys:ye,xs:xe),3),2));
z.trend=Theil_Sen_Regress(xt,y)*10; z.sst=y; 
v.nino12=z;
%Nino3 SST%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear z;
latlon=[210 270 -5 5]; z.latlon=latlon;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
lat=g.lat; lon=g.lon;
ys=min(find(lat(:)>=lat1)); ye=max(find(lat(:)<= lat2));
xs=min(find(lon(:)>=lon1)); xe=max(find(lon(:)<= lon2));
y=squeeze(mean(mean(a(:,ys:ye,xs:xe),3),2));
z.trend=Theil_Sen_Regress(xt,y)*10; z.sst=y; 
v.nino3=z;
%Nino4 SST%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear z;
latlon=[160 210 -5 5]; z.latlon=latlon;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
lat=g.lat; lon=g.lon;
ys=min(find(lat(:)>=lat1)); ye=max(find(lat(:)<= lat2));
xs=min(find(lon(:)>=lon1)); xe=max(find(lon(:)<= lon2));
y=squeeze(mean(mean(a(:,ys:ye,xs:xe),3),2));
z.trend=Theil_Sen_Regress(xt,y)*10; z.sst=y; 
v.nino4=z; clear z;
%WPAC SST%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear z;
latlon=[110 180 -5 5]; z.latlon_wpac=latlon;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
lat=g.lat; lon=g.lon;
ys=min(find(lat(:)>=lat1)); ye=max(find(lat(:)<= lat2));
xs=min(find(lon(:)>=lon1)); xe=max(find(lon(:)<= lon2));
z.wpac=squeeze(mean(mean(a(:,ys:ye,xs:xe),3),2));
%EPAC SST%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
latlon=[180 280 -5 5]; z.latlon_epac=latlon;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
lat=g.lat; lon=g.lon;
ys=min(find(lat(:)>=lat1)); ye=max(find(lat(:)<= lat2));
xs=min(find(lon(:)>=lon1)); xe=max(find(lon(:)<= lon2));
z.epac=squeeze(mean(mean(a(:,ys:ye,xs:xe),3),2));
%dsst WPAC - EPAC SST%%%%%%%%%%%%%%%%%%%%%%
y=z.wpac - z.epac;
z.trend=Theil_Sen_Regress(xt,y)*10; z.var=y; 
v.delta_wepac=z;
%IPWP SST%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear z; 
latlon=[50 180 -30 30]; z.latlon=latlon;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
lat=g.lat; lon=g.lon;
ys=min(find(lat(:)>=lat1)); ye=max(find(lat(:)<= lat2));
xs=min(find(lon(:)>=lon1)); xe=max(find(lon(:)<= lon2));
for t=1:length(a(:,1,1))
  id=(oc(ys:ye,xs:xe)==1);
  y=squeeze(a(t,ys:ye,xs:xe));
  z.var(t)=mean(y(id));
end
z.trend=Theil_Sen_Regress(xt,z.var)*10; var_ipwp=z.var;
v.ipwp=z;
%Tropical mean SST%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear z;
latlon=[0 360 -30 30]; z.latlon=latlon;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
lat=g.lat; lon=g.lon;
ys=min(find(lat(:)>=lat1)); ye=max(find(lat(:)<= lat2));
xs=min(find(lon(:)>=lon1)); xe=max(find(lon(:)<= lon2));
for t=1:length(a(:,1,1))
  id=(oc(ys:ye,xs:xe)==1);
  y=squeeze(a(t,ys:ye,xs:xe));
  z.var(t)=mean(y(id));
end
z.trend=Theil_Sen_Regress(xt,z.var)*10; var_trop=z.var;
v.trop=z;

y=var_ipwp ./ var_trop;
z.trend=Theil_Sen_Regress(xt,y)*10; var_ratio=y; 
v.ipwp_o_trop=z;

%SO mean SST%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear z;
latlon=[0 360 -75 -45]; z.latlon=latlon;
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
lat=g.lat; lon=g.lon;
ys=min(find(lat(:)>=lat1)); ye=max(find(lat(:)<= lat2));
xs=min(find(lon(:)>=lon1)); xe=max(find(lon(:)<= lon2));
for t=1:length(a(:,1,1))
  id=(oc(ys:ye,xs:xe)==1);
  y=squeeze(a(t,ys:ye,xs:xe));
  z.var(t)=mean(y(id));
end
z.trend=Theil_Sen_Regress(xt,z.var)*10; 
v.so=z;

return
