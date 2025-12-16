function v=get_mjo_index(tpath, expn, yr1, yr2, latlon, varn)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath ='/archive/Ming.Zhao/awg/tikal_201403/';
expn='CM4_C192L48_FLOR_1990_ctrl';
latlon=[0 360 -15 15]; yr1='0001'; yr2='0020'; varn='olr';

epath ='/pp.lowres/daily/';
fext=strcat('atmos.',yr1,'-',yr2,'.',varn,'.nc'); 
fname=strcat(tpath,expn,epath,fext)
v=readts_grid(tpath,expn,fname, latlon);

fn=strcat(tpath,expn,epath,fext)
f=netcdf(fn,'nowrite'); 
varx=f{varn}(:,v.ys:v.ye,v.xs:v.xe); close(f);

v.nyr=20; v.nday=365; v.nt=v.nyr*v.nday;
var=varx(1:v.nt,:,:);
var=reshape(var,v.nday,v.nyr,v.nlat,v.nlon);
var_clm=squeeze(mean(var,2));
for d=1:v.nday
  for y=1:v.nyr
    var_ano(d,y,:,:)=squeeze(var(d,y,:,:))-squeeze(var_clm(d,:,:));
  end
end
var    =reshape(var,    v.nt,v.nlat,v.nlon); 
var_ano=reshape(var_ano,v.nt,v.nlat,v.nlon); 

dd1=20; dd2=100;
for j=1:v.nlat; v.lat(j)
  for i=1:v.nlon
    x=squeeze(var_ano(:,j,i));
    x=mybandpass(x,dd1,dd2);
    var_ano_iso(:,j,i)=x';
  end
end
%figure; plot(var_ano(:,1,1),'r-*'); hold on;plot(var_ano_iso(:,1,1),'b-s');

v.var_ano_iso=squeeze(mean(var_ano_iso,2)); %meridional average
v.var_ano    =squeeze(mean(var_ano,2));
v.var_clm    =squeeze(mean(var_clm,2));

id=(v.lon>75 & v.lon<100); %define central indian ocean
v.ind.var_clm    =mean(v.var_clm    (:,id),2);
v.ind.var_ano    =mean(v.var_ano    (:,id),2);
v.ind.var_ano_iso=mean(v.var_ano_iso(:,id),2);
%figure; plot(v.ind.var_ano,'r-*');hold on;plot(v.ind.var_ano_iso,'b-s');

%figure; v.vbin=[-0.8:0.1:0.8];
%[C,h]=contourf(v.lon,v.nd,v.corr0,v.vbin); colorbar;
%clabel(C,h)
return;

tpath ='/archive/Ming.Zhao/awg/tikal_201403/'; 
latlon=[0 360 -10 5]; yr1='0001'; yr2='0020';
expn='CM4_C192L48_FLOR_1990_ctrl';
varn='olr';          v.olr    =mjo_ana(tpath, expn, yr1, yr2, latlon, varn)
varn='precip';       v.pcp    =mjo_ana(tpath, expn, yr1, yr2, latlon, varn)
varn='hmint_uwc';    v.hmint  =mjo_ana(tpath, expn, yr1, yr2, latlon, varn)
varn='hm_tot0_uwc';  v.hm_tot0=mjo_ana(tpath, expn, yr1, yr2, latlon, varn)
varn='hm_total_uwc'; v.hm_tot1=mjo_ana(tpath, expn, yr1, yr2, latlon, varn)
varn='hm_hadv0_uwc'; v.hm_hadv=mjo_ana(tpath, expn, yr1, yr2, latlon, varn)

s=v.pcp; s=v.hmint; s=v.hm_tot0; s=v.hm_hadv;
s.vbin=[-0.8:0.1:0.8];
figure; [C,h]=contourf(s.lon,s.ndd,s.corr0,s.vbin); colorbar; clabel(C,h)

figure; 
plot(v.hm_tot0.olr_ano(:,50),'r*-'); hold on;
plot(v.hm_tot1.olr_ano(:,50),'bs-');
 
