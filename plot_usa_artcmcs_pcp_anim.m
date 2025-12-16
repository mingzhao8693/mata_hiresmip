function x=plot_usa_artcmcs_pcp_anim(yr1,yr2)
load('/work/miz/mat_hiresmip/obs/ERAI_6h_DATA_1979_1979_AR_diag0_readartcmcs_day_usa.mat');
lm=v.lm_org;

tpath='/archive/Ming.Zhao/backup/ECMWF/ERAI_6h_DATA/AR_allstorms_Tb_th_30/'; 
expn='ERAI_6h_DATA'; ext='_shape_day'; lw=3; fsize=16;
yr1=1985; yr2=2008; nyr=yr2-yr1+1; t=1;
for t=3:nyr;
  year(t)=yr1+t-1; a=num2str(year(t)); fext=strcat('_',a,'.shape.day.nc');
  fn=strcat(tpath,expn,fext); 
  lon=ncread(fn,'lon'); lat=ncread(fn,'lat'); time=ncread(fn,'time');
  shape_all=ncread(fn,'shape_all',[1 1 1],[Inf Inf 365]);
  shape_ar =ncread(fn,'shape_ar', [1 1 1],[Inf Inf 365]);
  shape_tc =ncread(fn,'shape_tc', [1 1 1],[Inf Inf 365]);
  shape_TBB=ncread(fn,'shape_TBB',[1 1 1],[Inf Inf 365]);
  pcp      =ncread(fn,'pcp',      [1 1 1],[Inf Inf 365]);
  TBB      =ncread(fn,'TBB',      [1 1 1],[Inf Inf 365]);
  ivtx     =ncread(fn,'ivtx',     [1 1 1],[Inf Inf 365]);
  ivty     =ncread(fn,'ivty',     [1 1 1],[Inf Inf 365]);
  prw      =ncread(fn,'prw',      [1 1 1],[Inf Inf 365]);
  ivt = sqrt(ivtx.*ivtx+ivty.*ivty);
  for i=1:365
    pms=[ 0, 0, 1900, 900]*0.8;
    handle=figure('Position',pms,'visible','on');
    a=squeeze(pcp      (:,:,i)); a=a';
    b=squeeze(shape_ar (:,:,i)); b=b';
    c=squeeze(shape_tc (:,:,i)); c=c';
    d=squeeze(shape_TBB(:,:,i)); d=d';
    e=squeeze(ivtx     (:,:,i)); e=e';
    f=squeeze(ivty     (:,:,i)); f=f';
    g=squeeze(ivt      (:,:,i)); g=g';
    pcolor(lon,lat,a); shading flat; colorbar; caxis([0 50]); hold on;
    cmap =bluewhitered(256); colormap(cmap); colormap(jet);
    contour(lon,lat,b, [0 0.5],'r','LineWidth',lw);
    contour(lon,lat,c, [0 0.1],'y','LineWidth',lw);
    contour(lon,lat,d, [0 0.5],'g','LineWidth',lw);
    n=3; quiver(lon(1:n:end),lat(1:n:end),e(1:n:end,1:n:end),f(1:n:end,1:n:end),'r');
    %[C,h]=contour(lon,lat,e, [200 400 600 800],'r-','LineWidth',0.5);
    %clabel(C,h,'Color','r');
    contour(lon,lat,lm,[0 0.5],'w','LineWidth',0.5);
    axis([180 360 0 80]); ddd=floor(time(i)/24)+1;
    [mm,dd]=ddd2mmdd(year(t),ddd);
    pdate=sprintf('%d%02d%02d',year(t),mm,dd); 
    title(pdate,'FontSize',fsize);
    vname=strcat('usa_precip_',pdate); 
    figpath='/work/miz/mat_hiresmip/obs/fig_USA/'; 
    figpath='./fig_USA/'; 
    expn1='obs'; visfig='off'; 
    printnew(visfig,figpath,expn1,vname);
    close(handle)
  end
end


a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location','north','FontSize',fs); title(tit,'FontSize',fs);
%y1=0.4; y2=1.8; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,8); m1=8; m2=19; tit='South';
a=x.ssr.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.ssr.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.ssr.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
%y1=1.5; y2=3.5; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,9); m1=8; m2=19; tit='Southeast';
a=x.ser.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.ser.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.ser.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
%y1=2; y2=5.5; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

visfig='off'; figpath='./fig_USA/'; 
printnew(visfig,figpath,p.expn,p.vname);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
