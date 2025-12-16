function v=read_GF_new(pname,opt)
%fn=strcat('/work/miz/mat_hiresmip/obs_global_to_c48.mat'); load(fn);
pp='/'; region='global'; dr=strcat('_',region,'_tsana_new.mat'); pname='A1p5';opt=0;
%tpath='/archive/Ming.Zhao/awg/xanadu/'; dr=strcat('_',region,'_tsana.mat'); 
%expn='c96L33_am4p0_2010climo';     fn=strcat(tpath,expn,pp,expn,dr);load(fn);c=v;
%expn='c96L33_am4p0_2010climo_p2K'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);w=v;
if (opt==0)
  tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
  %expn='c96L33_am4p0_longamip_1850rad'; fn=strcat(tpath,expn,'/',expn,dr);load(fn);
  expn='c96L33_am4p0_2010climo_GF_CTL'; fn=strcat(tpath,expn,'/',expn,dr);load(fn);c0=v;
  expn='c96L33_am4p0_2010climo_p2K';    fn=strcat(tpath,expn,'/',expn,dr);load(fn);w0=v;
  expn='c96L33_am4p0_2010climo_4xCO2';  fn=strcat(tpath,expn,'/',expn,dr);load(fn);g0=v;
elseif (opt==1)
  tpath='/archive/Ming.Zhao/awg/xanadu/'; dr=strcat('_',region,'_tsana_new.mat'); 
  expn='c96L33_am4p0_1850climo_CM4_piControl_C';      fn=strcat(tpath,expn,pp,expn,dr);load(fn);c0=v;
  expn='c96L33_am4p0_1850climo_CM4_piControl_C_2K';   fn=strcat(tpath,expn,pp,expn,dr);load(fn);w0=v;
  expn='c96L33_am4p0_1850climo_CM4_piControl_C_4xCO2';fn=strcat(tpath,expn,pp,expn,dr);load(fn);g0=v;
end
tpath='/archive/Ming.Zhao/awg/xanadu/'; dr=strcat('_',region,'_tsana_new.mat');
expn='c96L33_am4p0_1850climo_CM4_piControl_C';           fn=strcat(tpath,expn,pp,expn,dr);load(fn);c1=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_SICA_only'; fn=strcat(tpath,expn,pp,expn,dr);load(fn);i1=v;
expn='c96L33_am4p0_1850climo_CM4_piControl_C_static_veg';fn=strcat(tpath,expn,pp,expn,dr);load(fn);v1=v;

s=v.s; s.sfc=c0.sfc; s.toa=c0.toa; s.nlon=length(s.lon); s.nlat=length(s.lat);
%add response to sea ice 
%I=i1.sfc.ice; C=c1.sfc.ice; dsic=I.clm-C.clm; 
%dsic0=(I.clm_stat.mmen.all-C.clm_stat.mmen.all)./C.clm_stat.mmen.all; 
%a=dsic0'; dSIC0=repmat(a,[1 s.nlat s.nlon]);

c=c0.sfc.tsurf; w=w0.sfc.tsurf; g=g0.sfc.tsurf; d.CLM0=c.clm_stat.mmen.all;
d.clm_p2k=w.clm-c.clm; d.clm0_p2k=w.clm_stat.mmen.all-d.CLM0;
d.clm_co2=g.clm-c.clm; d.clm0_co2=g.clm_stat.mmen.all-d.CLM0;
%I=i1.sfc.tsurf; C=c1.sfc.tsurf; d.clm_sic=-(I.clm-C.clm)./dSIC0; 
s.d_tsurf=d; clear d;

%SST
x0=compute_gocean_sst(c.clm,c0.sfc.ice.clm,c0.s.lm0,c0.s.aa);
x1=compute_gocean_sst(w.clm,w0.sfc.ice.clm,w0.s.lm0,w0.s.aa);
x2=compute_gocean_sst(g.clm,g0.sfc.ice.clm,g0.s.lm0,g0.s.aa);
d_sst.CLM0    =x0.clm0;
d_sst.clm_p2k =x1.clm -x0.clm;
d_sst.clm0_p2k=x1.clm0-x0.clm0;
d_sst.clm_co2 =x2.clm -x0.clm;
d_sst.clm0_co2=x2.clm0-x0.clm0;

s.d_sst=d_sst;
 
%TAS
c=c0.sfc.tref; w=w0.sfc.tref; g=g0.sfc.tref; d.CLM0=c.clm_stat.mmen.all;
d.clm_sst=(w.clm-c.clm)/2; d.clm0_sst=(w.clm_stat.mmen.all-d.CLM0)/2;
d.clm_co2=(g.clm-c.clm)/2; d.clm0_co2=(g.clm_stat.mmen.all-d.CLM0)/2;
%I=i1.sfc.tref; C=c1.sfc.tref; d.CLM1=C.clm_stat.mmen.all;
%d.clm_sic=(I.clm-C.clm)./(;     d.clm0_sic=I.clm_stat.mmen.all-d.CLM1;
s.d_tref=d;

%NETRAD
c=c0.toa.netrad; w=w0.toa.netrad; g=g0.toa.netrad; d.CLM0=c.clm_stat.mmen.all;
d.clm_sst=(w.clm-c.clm)/2; d.clm0_sst=(w.clm_stat.mmen.all-d.CLM0)/2;
d.clm_co2=(g.clm-c.clm)/2; d.clm0_co2=(g.clm_stat.mmen.all-d.CLM0)/2;
s.d_netrad=d;

%TTCF
c=c0.toa.ttcf; w=w0.toa.ttcf; g=g0.toa.ttcf; d.CLM0=c.clm_stat.mmen.all;
d.clm_sst=(w.clm-c.clm)/2; d.clm0_sst=(w.clm_stat.mmen.all-d.CLM0)/2;
d.clm_co2=(g.clm-c.clm)/2; d.clm0_co2=(g.clm_stat.mmen.all-d.CLM0)/2;
s.d_ttcf=d;

%LWCF
c=c0.toa.lwcf; w=w0.toa.lwcf; g=g0.toa.lwcf; d.CLM0=c.clm_stat.mmen.all;
d.clm_sst=(w.clm-c.clm)/2; d.clm0_sst=(w.clm_stat.mmen.all-d.CLM0)/2;
d.clm_co2=(g.clm-c.clm)/2; d.clm0_co2=(g.clm_stat.mmen.all-d.CLM0)/2;
s.d_lwcf=d;

%SWCF
c=c0.toa.swcf; w=w0.toa.swcf; g=g0.toa.swcf; d.CLM0=c.clm_stat.mmen.all;
d.clm_sst=(w.clm-c.clm)/2; d.clm0_sst=(w.clm_stat.mmen.all-d.CLM0)/2;
d.clm_co2=(g.clm-c.clm)/2; d.clm0_co2=(g.clm_stat.mmen.all-d.CLM0)/2;
s.d_swcf=d;

%clear-sky NETRAD
c=c0.toa.netrad_clr; w=w0.toa.netrad_clr; g=g0.toa.netrad_clr; d.CLM0=c.clm_stat.mmen.all;
d.clm_sst=(w.clm-c.clm)/2; d.clm0_sst=(w.clm_stat.mmen.all-d.CLM0)/2;
d.clm_co2=(g.clm-c.clm)/2; d.clm0_co2=(g.clm_stat.mmen.all-d.CLM0)/2;
s.d_netradclr=d;

%clear-sky SW
c=c0.toa.swnet_clr; w=w0.toa.swnet_clr; g=g0.toa.swnet_clr; d.CLM0=c.clm_stat.mmen.all;
d.clm_sst=(w.clm-c.clm)/2; d.clm0_sst=(w.clm_stat.mmen.all-d.CLM0)/2;
d.clm_co2=(g.clm-c.clm)/2; d.clm0_co2=(g.clm_stat.mmen.all-d.CLM0)/2;
s.d_swnetclr=d;

%clear-sky LW
c=c0.toa.lwnet_clr; w=w0.toa.lwnet_clr; g=g0.toa.lwnet_clr; d.CLM0=c.clm_stat.mmen.all;
d.clm_sst=(w.clm-c.clm)/2; d.clm0_sst=(w.clm_stat.mmen.all-d.CLM0)/2;
d.clm_co2=(g.clm-c.clm)/2; d.clm0_co2=(g.clm_stat.mmen.all-d.CLM0)/2;
s.d_lwnetclr=d;

%read in Green Function Jocobian matrices; pname='A4p0';
tpath='/archive/Ming.Zhao/backup/jaco_public/'
tpath=strcat(tpath,'low_reso_combined_',pname,'/'); 
fn=sprintf('%smatrix_b_4d.nc',tpath); s.fn=fn; disp(fn)
a=ncread(fn,'matrix_b_4d'); a=a(:,:,:,1); nexp=length(a(1,1,:));
s.wei=reshape(a,144*90,nexp);

varn='T.no_test';
fn=sprintf('%smatrix_a_4d.and.prob.%s.nc',tpath,varn); disp(fn);
a=ncread(fn,'matrix_a_4d'); s.T  =reshape(a,144*90,nexp,12);
a=ncread(fn,'prob');        s.p_T=reshape(a,144*90,nexp,12);

varn='R.no_test';
fn=sprintf('%smatrix_a_4d.and.prob.%s.nc',tpath,varn); disp(fn);
a=ncread(fn,'matrix_a_4d'); s.R  =reshape(a,144*90,nexp,12);
a=ncread(fn,'prob');        s.p_R=reshape(a,144*90,nexp,12);

varn='R_clr.no_test';
fn=sprintf('%smatrix_a_4d.and.prob.%s.nc',tpath,varn); disp(fn);
a=ncread(fn,'matrix_a_4d'); s.clr  =reshape(a,144*90,nexp,12);
a=ncread(fn,'prob');        s.p_clr=reshape(a,144*90,nexp,12);

varn='R_cre.no_test';
fn=sprintf('%smatrix_a_4d.and.prob.%s.nc',tpath,varn); disp(fn);
a=ncread(fn,'matrix_a_4d'); s.cre  =reshape(a,144*90,nexp,12);
a=ncread(fn,'prob');        s.p_cre=reshape(a,144*90,nexp,12);

varn='cre_lw.no_test';
fn=sprintf('%smatrix_a_4d.and.prob.%s.nc',tpath,varn); disp(fn);
a=ncread(fn,'matrix_a_4d'); s.lwcre  =reshape(a,144*90,nexp,12);
a=ncread(fn,'prob');        s.p_lwcre=reshape(a,144*90,nexp,12);

varn='cre_sw.no_test';
fn=sprintf('%smatrix_a_4d.and.prob.%s.nc',tpath,varn); disp(fn);
a=ncread(fn,'matrix_a_4d'); s.swcre  =reshape(a,144*90,nexp,12);
a=ncread(fn,'prob');        s.p_swcre=reshape(a,144*90,nexp,12);

vname=strcat('AM4_GF','_',pname,'_opt',num2str(opt),'.mat');
fn=strcat('/work/miz/mat_gf/',vname); fn
save(fn,'s','-v7.3');

return

pname='A4p0'; opt=0; read_GF_new(pname,opt);

pname='A4p0'; opt=1; read_GF_new(pname,opt);

pname='A1p5'; opt=0; read_GF_new(pname,opt);

pname='A1p5'; opt=1; read_GF_new(pname,opt);




p_thresh=1;
s.GF0.R=compute_GF(s, s.wei, s.R, s.p_R, p_thresh);
s.GF0.T=compute_GF(s, s.wei, s.T, s.p_T, p_thresh);

p_thresh=0.05;
s.GF1.R=compute_GF(s, s.wei, s.R, s.p_R, p_thresh);
s.GF1.T=compute_GF(s, s.wei, s.T, s.p_T, p_thresh);

vname=strcat('AM4_GF','_',pname,'.mat');
fn=strcat('/work/miz/mat_gf/',vname); fn
save(fn,'s','-v7.3');

% $$$ %read in GF
% $$$ pname='A4p0';
% $$$ tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/jaco_public/'
% $$$ tpath=strcat(tpath,'low_reso_',pname,'/');
% $$$ expn='jaco.'; ext='_i_over_j_'; 
% $$$ for m=1:12
% $$$   fn=sprintf('%s%s%s%s%02d.nc',tpath,expn,'R',ext,m); disp(fn)
% $$$   s.gf.rad(m,:,:)=ncread(fn,'jaco'); 
% $$$   fn=sprintf('%s%s%s%s%02d.nc',tpath,expn,'T',ext,m); disp(fn)
% $$$   s.gf.tas(m,:,:)=ncread(fn,'jaco'); 
% $$$ %  fn=sprintf('%s%s%s%s%02d.nc',tpath,expn,'P',ext,m); disp(fn)
% $$$ %  s.gf.pcp(m,:,:)=ncread(fn,'jaco'); 
% $$$ end
% $$$ s.gf.rad_ann=squeeze(mean(s.gf.rad,1));
% $$$ s.gf.tas_ann=squeeze(mean(s.gf.tas,1));
% $$$ aa=reshape(s.aa',144*90,1); aa=repmat(aa,[1 144*90]);
% $$$ var=aa.*s.gf.rad_ann; 
% $$$ a=squeeze(sum(var,2)); a=reshape(a,144,90); a=a';
% $$$ s.gf.rad_ann_g=a; s.gf.rad_ann_g0=mean(mean(a.*s.aa));
% $$$ a=squeeze(sum(var,1)); a=reshape(a,144,90); a=a';
% $$$ s.gf.rad_ann_u=a; s.gf.rad_ann_u0=mean(mean(a.*s.aa));
% $$$ var=aa.*s.gf.tas_ann; 
% $$$ a=squeeze(sum(var,2)); a=reshape(a,144,90); a=a';
% $$$ s.gf.tas_ann_g=a; s.gf.tas_ann_g0=mean(mean(a.*s.aa));
% $$$ a=squeeze(sum(var,1)); a=reshape(a,144,90); a=a';
% $$$ s.gf.tas_ann_u=a; s.gf.tas_ann_u0=mean(mean(a.*s.aa));
% $$$ var=aa.*s.gf.pcp_ann; 
% $$$ a=squeeze(sum(var,2)); a=reshape(a,144,90); a=a';
% $$$ s.gf.pcp_ann_g=a; s.gf.pcp_ann_g0=mean(mean(a.*s.aa));
% $$$ a=squeeze(sum(var,1)); a=reshape(a,144,90); a=a';
% $$$ s.gf.pcp_ann_u=a; s.gf.pcp_ann_u0=mean(mean(a.*s.aa));

return

v=read_GF_new('A4p0');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('/work/miz/mat_gf/','AM4_GF_AM4p0.mat'); load(fn);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t1=1; t2=145; gf=s.gf.netrad;
sst=s.sfc.tsurf.all(t1:t2,:,:,:); nt=length(sst(:,1,1,1));
nt_clm=30; sst_clm=squeeze(mean(sst(1:nt_clm,:,:,:),1));
a=repmat(sst_clm,[1 1 1 nt]); a=permute(a,[4,1,2,3]);
ssta=sst-a; %SST anomalies
lat=s.lat; lon=s.lon; aa=s.aa; lm=s.lm0;
im=s.sfc.ice.clm; im(im>=0.5)=1; im(im<0.5)=0;
for m=1:12
  b=squeeze(gf(m,:,:)); b=b'; m
  I=squeeze(im(m,:,:)); 
  for t=1:nt;
    a=squeeze(ssta(t,m,:,:));%figure; pcolor(a);shading flat;colorbar;caxis([-1 1]);colormap(jet);
    id=(lm>0.5)|I; 
    a(id)=0; %figure; pcolor(a); shading flat; colorbar; caxis([-1 1]);colormap(jet);
    a=reshape(a',90*144,1);
    c=b*a; c=reshape(c,144,90); c=c';
    netrad(t,m)=mean(mean(c.*aa));
  end
end
netrad_ts=squeeze(mean(netrad,2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot time series
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1200, 500]*1; fsize=9.5; lw=1; s0='(%4.2f)';
handle = figure('Position', pms,'visible','on'); row=1; col=1;
a=s.toa.netrad.ts.org_ann(t1:t2); y=a-mean(a(1:nt_clm));
x=1870+[t1:t2]-1; plot(x,netrad_ts,'r'); hold on; plot(x,y,'k');
axis([1870 2015 -2.5 2.5]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pms=[ 0, 0, 1200, 1000]*1; fsize=9.5; lw=1; s0='(%4.2f)';
handle = figure('Position', pms,'visible','on'); row=1; col=1;
pcolor(s.lon,s.lat,s.gf.netrad_ann_g); hold on;
shading flat; colorbar; colormap(jet); caxis([-20 20]);
contour(s.lon,s.lat,s.lm0,1,'k');

pms=[ 0, 0, 500, 1000]*1; fsize=9.5; lw=1; s0='(%4.2f)';
handle = figure('Position', pms,'visible','on'); row=3; col=1;
subplot(row,col,1); a1=s.gf.netrad_ann_u;
pcolor(s.lon,s.lat,a1); hold on;
shading flat; colorbar; colormap(jet); caxis([-20 20]);
contour(s.lon,s.lat,s.lm0,1,'k');
subplot(row,col,2); a2=(s.w.toa.netrad.tavg0-s.c.toa.netrad.tavg0)/2.;
pcolor(s.lon,s.lat,a2); hold on;
shading flat; colorbar; colormap(jet); caxis([-5 5]);
contour(s.lon,s.lat,s.lm0,1,'k');

figure; pcolor(s.lon,s.lat,s.gf.tas_ann_g); hold on;
shading flat; colorbar; colormap(jet); caxis([-8 8]);
contour(s.lon,s.lat,s.lm0,1,'k');

figure; pcolor(s.lon,s.lat,s.gf.tas_ann_u); hold on;
shading flat; colorbar; colormap(jet); caxis([-8 8]);
contour(s.lon,s.lat,s.lm0,1,'k');

figure; pcolor(s.lon,s.lat,s.gf.pcp_ann_g*86400); hold on;
shading flat; colorbar; colormap(jet); caxis([-1 1]);
contour(s.lon,s.lat,s.lm0,1,'k');

pms=[ 0, 0, 500, 1000]*1; fsize=9.5; lw=1; s0='(%4.2f)';
handle = figure('Position', pms,'visible','on'); row=3; col=1;
subplot(row,col,1); a1=s.gf.pcp_ann_u*86400;
pcolor(s.lon,s.lat,a1); hold on;
shading flat; colorbar; colormap(jet); caxis([-8 8]);
contour(s.lon,s.lat,s.lm0,1,'k');
subplot(row,col,2); a2=(s.w.sfc.pcp.tavg0-s.c.sfc.pcp.tavg0)/2.;
pcolor(s.lon,s.lat,a2); hold on;
shading flat; colorbar; colormap(jet); caxis([-1 1]);
contour(s.lon,s.lat,s.lm0,1,'k');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
