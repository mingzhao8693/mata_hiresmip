
function v=genesis_map(fn,opt)

%opt='obs';
%fn='/archive/Ming.Zhao/awg/2022.03/c192L33_am4p0_amip_HIRESMIP_HX/analysis/tropical_storms_wsfc/c192L33_am4p0_amip_HIRESMIP_HX_traj.mat';
latbnd=30;
path (path,'/home/miz/AM2p12b/analysis/miztstorm/mizscripts/matlab/')

load(fn);
if(strcmp(opt,'mod'))
  trtmp=v.tr; isobs=0;
else
  trtmp=v.trobs; isobs=1;
end

yr_beg=v.tr(1).year(1); yr_end=v.tr(end).year(1);
v.tyear=[yr_beg:1:yr_end]; v.nyr=length(v.tyear);

for t=1:v.nyr
  for mm=1:12
    i=1; 
    for n=1:length(trtmp)
      ts =trtmp(n); 
      idd= ((ts.lat(1)>-latbnd & ts.lat(1)<latbnd) | isobs);
      idt= (ts.month(1)==mm);
      idd= (idd & idt);% & (ts.dur_norm>=3*86400.);
      if ((ts.year(1) == v.tyear(t)) & idd)
	v.yr(t,mm).ts(i)=ts;
	i=i+1; 
      end
    end
  end
end

%frequency of occurrence for tracks and genesis==================
lonb=[0:  2.5:360]; nlon=length(lonb); v.lonfq=lonb(1:end-1);
latb=[-60:2:60 ];   nlat=length(latb); v.latfq=latb(1:end-1);
%lonb=[0:  1:360];   nlon=length(lonb); v.lonfq=lonb(1:end-1);
%latb=[-50:1:50 ];   nlat=length(latb); v.latfq=latb(1:end-1);

% $$$ latc= [-30.0836 -28.0780 -26.0724 -24.0669 -22.0613 -20.0557 -18.0501 ...
% $$$        -16.0446 -14.0390 -12.0334 -10.0279 -8.0223 -6.0167 -4.0111 ...
% $$$        -2.0056  0 2.0056 4.0111 6.0167 8.0223 10.0279 12.0334 14.0390 ...
% $$$        16.0446 18.0501 20.0557 22.0613 24.0669 26.0724 28.0780 30.0836];

%below is for 2.5x2 degree resolution 4-point average [-40 40]
% $$$ latc=[-40.1114 -38.1058 -36.1003 -34.0947 -32.0891 -30.0836 -28.0780 ...
% $$$       -26.0724 -24.0669 -22.0613 -20.0557 -18.0501 -16.0446 -14.0390 ...
% $$$       -12.0334 -10.0279 -8.0223 -6.0167 -4.0111 -2.0056 0 2.0056 ...
% $$$       4.0111 6.0167 8.0223 10.0279 12.0334 14.0390 16.0446 18.0501 ...
% $$$       20.0557 22.0613 24.0669 26.0724 28.0780 30.0836 32.0891 34.0947 ...
% $$$       36.1003 38.1058 40.1114];
% $$$ latb=(latc(1:end-1)+latc(2:end))/2; dlatb=(latb(2)-latb(1));
% $$$ latb(2:end+1)=latb; latb(1)=latb(2)-dlatb; latb(end+1)=latb(end)+dlatb;
% $$$ lonc=[1.25:2.5:358.75]; lonb=(lonc(1:end-1)+lonc(2:end))/2; 
% $$$ lonb(2:end+1)=lonb; lonb(1)=0; lonb(end+1)=360;

%below is for 5x4 degree resolution 8-point average [-50 50]
latc=[-48.1337 -44.1226 -40.1114 -36.1003 -32.0891 -28.0780 -24.0669 ...
      -20.0557 -16.0446 -12.0334 -8.0223  -4.0111    0        4.0111 ...
        8.0223  12.0334  16.0446 20.0557  24.0669   28.0780  32.0891 ...
        36.1003 40.1114  44.1226 48.1337];
latb=(latc(1:end-1)+latc(2:end))/2; dlatb=(latb(2)-latb(1));
latb(2:end+1)=latb; latb(1)=latb(2)-dlatb; latb(end+1)=latb(end)+dlatb;
lonc=[2.5:5:357.5]; lonb=(lonc(1:end-1)+lonc(2:end))/2; 
lonb(2:end+1)=lonb; lonb(1)=0; lonb(end+1)=360;

v.latfq=latc; v.lonfq=lonc;
nlat=length(latb); nlon=length(lonb);
for t=1:v.nyr
  t
  for mm=1:12
    trtmp=v.yr(t,mm).ts;
    for j=1:nlat-1
      for i=1:nlon-1
	v.fq_stm(mm,t,j,i)=0;
	v.fq_hur(mm,t,j,i)=0;
	v.gs_stm(mm,t,j,i)=0;
	v.gs_hur(mm,t,j,i)=0;
	for n=1:length(trtmp)
	  ts =trtmp(n); id_in=0; idgs_in=0;
	  for m=1:ts.num
	    if (ts.lon(m)>lonb(i) & ts.lon(m)<=lonb(i+1) & ...
		ts.lat(m)>latb(j) & ts.lat(m)<=latb(j+1)) 
	      id_in=1; break;
	    end
	  end
	  if (ts.lon(1)>lonb(i) & ts.lon(1)<=lonb(i+1) & ...
	      ts.lat(1)>latb(j) & ts.lat(1)<=latb(j+1)) 
	    idgs_in=1;
	  end
	  if (id_in==1 & ts.hur>=0)
	    v.fq_stm(mm,t,j,i)=v.fq_stm(mm,t,j,i)+1;
	  end
	  if (id_in==1 & ts.hur>=1)
	    v.fq_hur(mm,t,j,i)=v.fq_hur(mm,t,j,i)+1;
	  end
	  if (idgs_in==1 & ts.hur>=0)
	    v.gs_stm(mm,t,j,i)=v.gs_stm(mm,t,j,i)+1;
	  end
	  if (idgs_in==1 & ts.hur>=1)
	    v.gs_hur(mm,t,j,i)=v.gs_hur(mm,t,j,i)+1;
	  end
	end
      end
    end
  end
end
v.fq_stm_ann=squeeze(sum(v.fq_stm,1));
v.fq_hur_ann=squeeze(sum(v.fq_hur,1));
v.gs_stm_ann=squeeze(sum(v.gs_stm,1));
v.gs_hur_ann=squeeze(sum(v.gs_hur,1));

v.fq_stm_clm=squeeze(mean(v.fq_stm,2));
v.fq_hur_clm=squeeze(mean(v.fq_hur,2));
v.gs_stm_clm=squeeze(mean(v.gs_stm,2));
v.gs_hur_clm=squeeze(mean(v.gs_hur,2));

v.fq_stm_ann0=squeeze(mean(v.fq_stm_ann,1));
v.fq_hur_ann0=squeeze(mean(v.fq_hur_ann,1));
v.gs_stm_ann0=squeeze(mean(v.gs_stm_ann,1));
v.gs_hur_ann0=squeeze(mean(v.gs_hur_ann,1));

return;

nlat=length(v.latfq); nlon=length(v.lonfq);
a=v.fq_stm_ann(32:end-2,:,:); xt=[1980:2018]'; alpha=0.05;
for j=1:nlat
  for i=1:nlon
    y=squeeze(a(:,j,i));
    trend(j,i)=Theil_Sen_Regress(xt,y)*10; %#/decade
    c=polyfit(xt,y,1); slope(j,i)=c(1)*10;
    [ht,pv]=Mann_Kendall(y,alpha);
    signif(j,i)=ht;
    pvalue(j,i)=pv;
  end
end

figure; pcolor(v.lonfq,v.latfq,signif); hold on; shading flat; colorbar; 
contour(v.lon,v.lat,v.lm); %caxis([0 0.2]); %caxis([1 0.1]);

figure; pcolor(v.lonfq,v.latfq,pvalue); hold on; shading flat; colorbar; 
contour(v.lon,v.lat,v.lm,'k'); caxis([0 0.05]); %caxis([1 0.1]);

figure; pcolor(v.lonfq,v.latfq,trend); hold on; shading flat; colorbar; 
contour(v.lon,v.lat,v.lm); caxis([0 4]); caxis([-0.15 0.15]);

figure; pcolor(v.lonfq,v.latfq,slope); hold on; shading flat; colorbar; 
contour(v.lon,v.lat,v.lm); caxis([0 4]); caxis([-0.15 0.15]);

figure;
pcolor(v.lonfq,v.latfq,squeeze(mean(v.fq_stm_ann(31:end,:,:),1))); hold on; shading flat; colorbar;
contour(v.lon,v.lat,v.lm); caxis([0 4]);

v.xt=xt; v.mean=squeeze(mean(a,1));
v.trend=trend; v.signif=signif; v.pvalue=pvalue;

return

for t=1:v.nyr
  figure; cmin=0; cmax=3; v.tyear(t); sum(sum(v.gs_stm_ann(t,:,:)))
  pcolor(v.lonfq,v.latfq,squeeze(v.gs_stm_ann(t,:,:))); caxis([cmin cmax]);
  shading flat; colorbar; hold on; 
end
for t=1:12
  figure; cmin=0; cmax=3; v.tyear(t); sum(sum(v.gs_stm_clm(t,:,:)))
  pcolor(v.lonfq,v.latfq,squeeze(v.gs_stm_clm(t,:,:))); caxis([cmin cmax]);
  shading flat; colorbar; hold on; 
end

return

