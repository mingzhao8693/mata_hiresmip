function v=spearhi8_mjo_lagreg(tpath,expn,yr1,yr2,nyr,io_latlon,latlon,lateq,region)
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%latlon=[38.75 181.25 -21.5 21.5]; region='iowpac';
latlon=[0     360    -10   10];   region='gtrop';
tpath ='/archive/Ming.Zhao/spear_hi_8_dev/'; lateq=6.5;
expn='SPEAR_c384_OM4p08_Control_1990_A13'; yr1=301; yr2=320; nyr=yr2-yr1+1; region='gtrop';
%define 3 important regions
%latlon   =[0  360 -10 10];  %definition of tropical analysis region
io_latlon=[75 100 -10 5];   %definition of IO
lat1=-lateq; lat2=lateq;    %definition of equatorial region
atmos_data_dir='atmos_data'; exd=strcat('/',atmos_data_dir,'/atmos_daily/'); varn='precip'; 
fext=strcat('atmos_daily.',yr1,'0101-',yr1,'1231.'); 
fname=strcat(tpath,expn,exd,fext,varn,'.nc')
v=readts_grid(tpath,expn,fname, latlon); v.fname=fname
v.yr1=yr1; v.yr2=yr2; v.nyr=nyr; v.tyr=[yr1:yr2]'; v.nday=365; v.nt=v.nyr*v.nday; v.ts=1; v.te=v.nt;
v.nt=v.te-v.ts+1; %v.nyr=20;
v.io_latlon=io_latlon; v.latlon=latlon; v.lateq=lateq; v.lgd_max=30;

yea=[365];                                 ddd=cumsum(yea); d.beg_yea=[0 ddd(1:end-1)]+1; d.end_yea=ddd;
hyr=[90 183 92];                           ddd=cumsum(hyr); d.beg_hyr=[0 ddd(1:end-1)]+1; d.end_hyr=ddd;
sea=[59 92 92 91 31];                      ddd=cumsum(sea); d.beg_sea=[0 ddd(1:end-1)]+1; d.end_sea=ddd;
mon=[31 28 31 30 31 30 31 31 30 31 30 31]; ddd=cumsum(mon); d.beg_mon=[0 ddd(1:end-1)]+1; d.end_mon=ddd;

v.do_yea=1; v.do_hyr=0; v.do_sea=0; v.do_mon=0;
if v.do_mon
  v.d_beg=d.beg_mon; v.d_end=d.end_mon; v.mon=mon;
elseif v.do_sea
  v.d_beg=d.beg_sea; v.d_end=d.end_sea; v.sea=sea;
elseif v.do_hyr
  v.d_beg=d.beg_hyr; v.d_end=d.end_hyr; v.hyr=hyr;
else
  v.d_beg=d.beg_yea; v.d_end=d.end_yea; v.yea=yea;
end

v.tpath=tpath; v.expn=expn; 
varn='precip'; ff='day'; exd=strcat('/',atmos_data_dir,'/atmos_daily/');
exf1='atmos_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
for k=1:length(var); var(k).a=var(k).a*86400; end; %unit:mm/day
varb=reshape(var.a,v.nday,v.nyr,v.nlat,v.nlon);
% $$$ a=mean(mean(varb,4),3); b=reshape(a,365*34,1); figure; plot(b(1:730));
% $$$ for n=1:33;
% $$$   t1(n)=n*10*30+1;         t2(n)=t1(n)+30*6; %Nov-to-Apr, 6mon after Nov 1
% $$$   t3(n)=(n-1)*365+10*30+1; t4(n)=t3(n)+30*6; %Nov-to-Apr, 6mon after Nov 1
% $$$   c1(n,:)=b(t1(n):t2(n));
% $$$   c2(n,:)=b(t3(n):t4(n));
% $$$ end
% $$$ figure; d1=1; d2=12000; d=[d1:1:d2];
% $$$ plot(d/365,b(d1:d2),'-b*'); hold on;
% $$$ for n=1:10
% $$$ % plot([t1(n):t2(n)]/365,c1(n,:),'-gs');
% $$$  plot([t3(n):t4(n)]/365,c2(n,:),'-rd');
% $$$ end
v.io.pcp=get_iso_reg(varb,v,io_latlon,0);
event=v.io.pcp.event; v.lgd=v.io.pcp.lgd; v.event=event;
v.io.pcp=get_iso_reg(varb,v,io_latlon,1,event);
v.pcp=lagregress(varb,v,latlon,lat1,lat2,v.io.pcp,0);
%figure; contourf(v.lon,v.lgd,v.pcp.lagslop.org_avg',20); shading flat; caxis([-3 3]);colorbar;
%figure; contourf(v.lon,v.lgd,v.pcp.lagcorr.iso_avg',20); shading flat; caxis([-0.8 0.8]);colorbar;colormap(jet);
%figure; plot(v.lgd,v.io.pcp.comp_iso_avg,'k-*');

varn='olr'; ff='day'; exd=strcat('/',atmos_data_dir,'/atmos_daily/');
exf1='atmos_daily.'; exf2='0101-'; exf3='1231.';
var=readallyear_reg(v,exd,varn,exf1,exf2,exf3,ff); 
varb=reshape(var.a,v.nday,v.nyr,v.nlat,v.nlon);

v.io.olr=get_iso_reg(varb,v,io_latlon,0);
v.olr=lagregress(varb,v,latlon,lat1,lat2,v.io.olr,0);

% $$$ varn='u200'; fn=strcat(tpath,expn,epath,fext,varn,'.nc'); 
% $$$ if (exist(fn,'file') == 2)
% $$$   varb=readvar(varn,fn,v,'2d','no');
% $$$ else
% $$$   varn='u250'; fn=strcat(tpath,expn,epath,fext,varn,'.nc')
% $$$   varb=readvar(varn,fn,v,'2d','no');
% $$$ end
% $$$ v.io.u200=get_iso_reg(varb,v,io_latlon,0);
% $$$ v.u200=lagregress(varb,v,latlon,lat1,lat2,v.io.u200,0);
% $$$ 
% $$$ varn='u850'; fn=strcat(tpath,expn,epath,fext,varn,'.nc');
% $$$ varb=readvar(varn,fn,v,'2d','no');
% $$$ v.io.u850=get_iso_reg(varb,v,io_latlon,0);
% $$$ v.u850=lagregress(varb,v,latlon,lat1,lat2,v.io.u850,0);

fn=strcat(tpath,expn,'/',expn,'_',region,'_lagreg.mat');fn
save(fn,'v','-v7.3'); 
return

