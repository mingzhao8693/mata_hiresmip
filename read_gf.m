function v=read_gf()
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
tpath='/archive/Ming.Zhao/awg/warsaw/'; syr=1; nyr=10; myr=5;
latlon=[0 360 -90 90]; region='global'; opt='2'; 
expn='qcpi'; mod='c96';  yr1='0001'; yr2='0010';
fn=strcat('/work/miz/mat_cm4/obs_',region,'_to_c96.mat'); load(fn);

lonx=o.lon; latx =o.lat; anam='atmos_cmip'

fn1='/work/Bosong.Zhang/pattern/monthly_30yr/jaco_large/jaco.R_i_over_j_';
fn2='/work/Bosong.Zhang/pattern/monthly_30yr/jaco_large/jaco.T_i_over_j_';
varn='jaco'; 

for mon=1:12
  fname=sprintf('%s%02d%s',fn1,mon,'.nc')
  a=ncread(fname,varn); size(a)
  b=sum(a,1); b=reshape(b,288,180); bm(mon,:,:)=b';
  c=sum(a,2); c=reshape(c,288,180); cm(mon,:,:)=c';
  if mon==1
    avg=a/12;
  else
    avg=avg+a/12;
  end

end
v.bm=bm;   v.bm(13,:,:)=squeeze(mean(bm,1));
v.cm=cm;   v.cm(13,:,:)=squeeze(mean(cm,1));
v.lon=o.lon; v.lat=o.lat; v.aa=o.aa; v.lm=o.lm0; v.avg=avg;

fn=strcat('/work/miz/mat_gf/','gf.mat');
save(fn,'v','-v7.3'); %save very large files

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
%let=p.let; s1=p.s1; s2=p.s2; s3=p.s3; s4=p.s4; s5=p.s5; s6=p.s6;s7=p.s7; s8=p.s8;
lon=o.lon; lat=o.lat; lm=o.lm0; cmin1=-60; cmax1=60; %co=p.co;
p.tit='\DeltaN'; p.unit='W/m2'; aa=o.aa;
mon = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",...
       "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Ann"];
%cmin1=p.cmin1; cmax1=p.cmax1; cmin2=p.cmin2; cmax2=p.cmax2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 1800, 900]*1; fsize=7; row=4; col=4; co='k';
handle = figure('Position', pms,'visible','on'); i=1; var=v.bm;
nn=256;  cmap=bluewhitered_miz(nn); colormap(cmap); %colormap(jet); 
subplot(row,col,i); 
a=squeeze(var(i,:,:)); b=mean(mean(a.*aa)); sx=let(i)+mon(i); i=i+1; 
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); 
a=squeeze(var(i,:,:)); b=mean(mean(a.*aa)); sx=let(i)+mon(i); i=i+1; 
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); 
a=squeeze(var(i,:,:)); b=mean(mean(a.*aa)); sx=let(i)+mon(i); i=i+1; 
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);

subplot(row,col,i); 
a=squeeze(var(i,:,:)); b=mean(mean(a.*aa)); sx=let(i)+mon(i); i=i+1; 
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); 
a=squeeze(var(i,:,:)); b=mean(mean(a.*aa)); sx=let(i)+mon(i); i=i+1; 
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); 
a=squeeze(var(i,:,:)); b=mean(mean(a.*aa)); sx=let(i)+mon(i); i=i+1; 
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);

subplot(row,col,i); 
a=squeeze(var(i,:,:)); b=mean(mean(a.*aa)); sx=let(i)+mon(i); i=i+1; 
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); 
a=squeeze(var(i,:,:)); b=mean(mean(a.*aa)); sx=let(i)+mon(i); i=i+1; 
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); 
a=squeeze(var(i,:,:)); b=mean(mean(a.*aa)); sx=let(i)+mon(i); i=i+1; 
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);

subplot(row,col,i); 
a=squeeze(var(i,:,:)); b=mean(mean(a.*aa)); sx=let(i)+mon(i); i=i+1; 
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); 
a=squeeze(var(i,:,:)); b=mean(mean(a.*aa)); sx=let(i)+mon(i); i=i+1; 
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);
subplot(row,col,i); 
a=squeeze(var(i,:,:)); b=mean(mean(a.*aa)); sx=let(i)+mon(i); i=i+1; 
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);

subplot(row,col,i); 
a=squeeze(var(i,:,:)); b=mean(mean(a.*aa)); sx=let(i)+mon(i); i=i+1; 
pcolor(lon,lat,a); hold on; shading flat; colorbar; caxis([cmin1 cmax1]);
contour(lon,lat,lm,1,co);
s=sprintf('%s (%s=%4.2f%s)',sx,p.tit,b,p.unit); title(s,'FontSize',fsize);

vname = 'GF_dN'; mod_name='AM4'; figpath='./fig_cmip6/'; visfig='off'; 
printnew(visfig,figpath,mod_name,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


b=sum(avg,1); c=sum(avg,2);

d=reshape(b,288,180); d=d';
e=reshape(c,288,180); e=e';

map=bluewhitered_miz(128); colormap(cmap);
figure; pcolor(v.cm_avg); shading flat; colorbar; caxis([-60 60]);

m=6;figure; pcolor(squeeze(v.cm(m,:,:))); shading flat; colorbar; caxis([-60 60]);colormap(cmap);

figure; pcolor(e); shading flat; colorbar; caxis([-60 60]);
map=bluewhitered_miz(128); colormap(cmap);

figure; pcolor(d); shading flat; colorbar; caxis([-60 60]);
cmap=bluewhitered_miz(128); colormap(cmap);



%a=ncread(fn,varn,[1 1],[Inf Inf]); 


return

