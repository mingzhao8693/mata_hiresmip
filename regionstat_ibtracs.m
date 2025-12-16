function v=regionstat_ibtracs(fn,opt)
path (path,'/home/miz/AM2p12b/analysis/miztstorm/mizscripts/matlab/')
latbnd=45; %opt='obs';

load(fn);v
if(strcmp(opt,'mod'))
  trtmp=v.tr; isobs=0; wind_th=16;
else
  trtmp=v.trobs; isobs=1; wind_th=17;
end

yr_beg=v.tr(1).year(1); yr_end=v.tr(end).year(1);
v.tyear=[yr_beg:1:yr_end]; v.nyr=length(v.tyear);
v.nbox =10;

v.c0num(1:v.nbox,1:v.nyr,1:12)=0;
v.c1num(1:v.nbox,1:v.nyr,1:12)=0; v.lfnum(1:v.nbox,1:v.nyr,1:12)=0;
v.c3num(1:v.nbox,1:v.nyr,1:12)=0;
v.c4num(1:v.nbox,1:v.nyr,1:12)=0;
v.c0pss(1:v.nbox,1:v.nyr,1:12)=0;
v.c1pss(1:v.nbox,1:v.nyr,1:12)=0;
v.c3pss(1:v.nbox,1:v.nyr,1:12)=0;
v.c4pss(1:v.nbox,1:v.nyr,1:12)=0;
v.c0ace(1:v.nbox,1:v.nyr,1:12)=0;
v.c1ace(1:v.nbox,1:v.nyr,1:12)=0;
v.c3ace(1:v.nbox,1:v.nyr,1:12)=0;
v.c4ace(1:v.nbox,1:v.nyr,1:12)=0;

psbin=[915:10:1005];
wdbin=[12.5 :5 :92.5]; 
vtbin=[1e-4:4e-4: 4e-3];
for m=1:v.nbox
  k=1;
  for t=1:yr_end-yr_beg+1
    year=yr_beg+t-1;
    n2=0; pres=0; wind=0;
    for j=1:12
      for i=1:length(trtmp)
	ts =trtmp(i);
	idd= (ts.lat(1)>-latbnd & ts.lat(1)<latbnd);
        idd= (idd | isobs); % & (ts.dur_norm>=3*86400.);
%	if ((ts.monthmax(1)==j & ts.yearmax==year & ts.boxnumb==m) & idd)
	if ((ts.month(1)==j    & ts.year(1)==year & ts.boxnumb==m) & idd)
	  sace = sum((ts.wind*1.9438).^2);
	  if (ts.hur>=1)
	    n1=n2+1; n2=n1+ts.num-1;
	    pres(n1:n2)=ts.pres;
	    wind(n1:n2)=ts.wind;
	    v.box(m).psmin(k)=ts.presmin;
	    v.box(m).wdmax(k)=ts.windmax;
	    v.box(m).name(k,:)=ts.boxname(:);
	    if(strcmp(opt,'mod'))
	    v.box(m).vtmax(k)=ts.vortmax;
	    end
	    k=k+1;
	  end
	  if (ts.hur>=0)
	    v.c0num(m,t,j)=v.c0num(m,t,j)+1;
	    v.c0pss(m,t,j)=v.c0pss(m,t,j)+ts.presmin;
	    v.c0ace(m,t,j)=v.c0ace(m,t,j)+sace;
	  end
	  if (ts.hur>=1)
	    v.c1num(m,t,j)=v.c1num(m,t,j)+1;
	    v.c1pss(m,t,j)=v.c1pss(m,t,j)+ts.presmin;
	    v.c1ace(m,t,j)=v.c1ace(m,t,j)+ts.windmax^2;
	    if (ts.landf==0)
	      v.lfnum(m,t,j)=v.lfnum(m,t,j)+1;
	    end
	  end
	  if (ts.hur>=3)
	    v.c3num(m,t,j)=v.c3num(m,t,j)+1;
	    v.c3pss(m,t,j)=v.c3pss(m,t,j)+ts.presmin;
	    v.c3ace(m,t,j)=v.c3ace(m,t,j)+ts.windmax^2;
	  end
	  if (ts.hur>=4)
	    v.c4num(m,t,j)=v.c4num(m,t,j)+1;
	    v.c4pss(m,t,j)=v.c4pss(m,t,j)+ts.presmin;
	    v.c4ace(m,t,j)=v.c4ace(m,t,j)+ts.windmax^2;
	  end
	end
      end
    end
    v.cat0num(m,t)=sum(v.c0num(m,t,:));
    v.cat1num(m,t)=sum(v.c1num(m,t,:));
    v.c1lfnum(m,t)=sum(v.lfnum(m,t,:));
    v.cat0ace(m,t)=sum(v.c0ace(m,t,:));
    v.cat1ace(m,t)=sum(v.c1ace(m,t,:));
    v.pres(m,t).pres=pres;
    v.wind(m,t).wind=wind;
    id = (pres~=-999);
    [a b]=hist(pres(id),psbin); v.fpres(m,t,:) = a; v.psbin = b;
    [a b]=hist(wind(id),wdbin); v.fwind(m,t,:) = a; v.wdbin = b;
  end
  v.fpres(m,:,:) = v.fpres(m,:,:)/sum(sum(v.fpres(m,:,:)))*sum(sum(v.c0num(m,:,:)));
  v.fwind(m,:,:) = v.fwind(m,:,:)/sum(sum(v.fwind(m,:,:)))*sum(sum(v.c0num(m,:,:)));
end

m=9; v.box(m).name='NH';
v.cat0num(m,:)=v.cat0num(2,:)+v.cat0num(4,:)+v.cat0num(5,:)+v.cat0num(6,:);
v.cat1num(m,:)=v.cat1num(2,:)+v.cat1num(4,:)+v.cat1num(5,:)+v.cat1num(6,:);
v.c1lfnum(m,:)=v.c1lfnum(2,:)+v.c1lfnum(4,:)+v.c1lfnum(5,:)+v.c1lfnum(6,:);
n1=1;    n2=n1-1+length(v.box(2).psmin); v.box(m).psmin(n1:n2)=v.box(2).psmin;
n1=n2+1; n2=n1-1+length(v.box(4).psmin); v.box(m).psmin(n1:n2)=v.box(4).psmin;
n1=n2+1; n2=n1-1+length(v.box(5).psmin); v.box(m).psmin(n1:n2)=v.box(5).psmin;
n1=n2+1; n2=n1-1+length(v.box(6).psmin); v.box(m).psmin(n1:n2)=v.box(6).psmin;
n1=1;    n2=n1-1+length(v.box(2).wdmax); v.box(m).wdmax(n1:n2)=v.box(2).wdmax;
n1=n2+1; n2=n1-1+length(v.box(4).wdmax); v.box(m).wdmax(n1:n2)=v.box(4).wdmax;
n1=n2+1; n2=n1-1+length(v.box(5).wdmax); v.box(m).wdmax(n1:n2)=v.box(5).wdmax;
n1=n2+1; n2=n1-1+length(v.box(6).wdmax); v.box(m).wdmax(n1:n2)=v.box(6).wdmax;
if(strcmp(opt,'mod'))
  n1=1;    n2=n1-1+length(v.box(2).vtmax); v.box(m).vtmax(n1:n2)=v.box(2).vtmax;
  n1=n2+1; n2=n1-1+length(v.box(4).vtmax); v.box(m).vtmax(n1:n2)=v.box(4).vtmax;
  n1=n2+1; n2=n1-1+length(v.box(5).vtmax); v.box(m).vtmax(n1:n2)=v.box(5).vtmax;
  n1=n2+1; n2=n1-1+length(v.box(6).vtmax); v.box(m).vtmax(n1:n2)=v.box(6).vtmax;
end

m=10; v.box(m).name='SH';
v.cat0num(m,:)=v.cat0num(7,:)+v.cat0num(8,:)+v.cat0num(3,:);
v.cat1num(m,:)=v.cat1num(7,:)+v.cat1num(8,:)+v.cat1num(3,:);
v.c1lfnum(m,:)=v.c1lfnum(7,:)+v.c1lfnum(8,:)+v.c1lfnum(3,:);
n1=1;    n2=n1-1+length(v.box(7).psmin);  v.box(m).psmin(n1:n2)=v.box(7).psmin;
n1=n2+1; n2=n1-1+length(v.box(8).psmin);  v.box(m).psmin(n1:n2)=v.box(8).psmin;
n1=n2+1; n2=n1-1+length(v.box(3).psmin);  v.box(m).psmin(n1:n2)=v.box(3).psmin;
n1=1;    n2=n1-1+length(v.box(7).wdmax);  v.box(m).wdmax(n1:n2)=v.box(7).wdmax;
n1=n2+1; n2=n1-1+length(v.box(8).wdmax);  v.box(m).wdmax(n1:n2)=v.box(8).wdmax;
n1=n2+1; n2=n1-1+length(v.box(3).wdmax);  v.box(m).wdmax(n1:n2)=v.box(3).wdmax;
if(strcmp(opt,'mod'))
  n1=1;    n2=n1-1+length(v.box(7).vtmax);  v.box(m).vtmax(n1:n2)=v.box(7).vtmax;
  n1=n2+1; n2=n1-1+length(v.box(8).vtmax);  v.box(m).vtmax(n1:n2)=v.box(8).vtmax;
  n1=n2+1; n2=n1-1+length(v.box(3).vtmax);  v.box(m).vtmax(n1:n2)=v.box(3).vtmax;
end

m=1; v.box(m).name='GG';
v.cat0num(m,:)=v.cat0num(9,:)+v.cat0num(10,:);
v.cat1num(m,:)=v.cat1num(9,:)+v.cat1num(10,:);
v.c1lfnum(m,:)=v.c1lfnum(9,:)+v.c1lfnum(10,:);
n1=1;    n2=n1-1+length(v.box(9).psmin);   v.box(m).psmin(n1:n2)=v.box(9).psmin;
n1=n2+1; n2=n1-1+length(v.box(10).psmin);  v.box(m).psmin(n1:n2)=v.box(10).psmin;
n1=1;    n2=n1-1+length(v.box(9).wdmax);   v.box(m).wdmax(n1:n2)=v.box(9).wdmax;
n1=n2+1; n2=n1-1+length(v.box(10).wdmax);  v.box(m).wdmax(n1:n2)=v.box(10).wdmax;
if(strcmp(opt,'mod'))
  n1=1;    n2=n1-1+length(v.box(9).vtmax);   v.box(m).vtmax(n1:n2)=v.box(9).vtmax;
  n1=n2+1; n2=n1-1+length(v.box(10).vtmax);  v.box(m).vtmax(n1:n2)=v.box(10).vtmax;
end

%compute seasonal cycle for each basin
for m=1:10
  v.cat0sea(m,:)=squeeze(mean(v.c0num(m,:,:),2));
  v.cat1sea(m,:)=squeeze(mean(v.c1num(m,:,:),2));
end

for m=1:v.nbox
  v.cat0num_avg(m)=sum(v.cat0num(m,:))/v.nyr;
  v.cat1num_avg(m)=sum(v.cat1num(m,:))/v.nyr;
end

for m=1:v.nbox
  tmp = (v.cat0num(m,:)-v.cat0num_avg(m));
  v.cat0num_std(m)=sqrt(mean(tmp.*tmp));
  tmp = (v.cat1num(m,:)-v.cat1num_avg(m));
  v.cat1num_std(m)=sqrt(mean(tmp.*tmp));
end

for m=1:v.nbox
  if (length(v.box(m).psmin)>0)
    wdmax0=17; id=(v.box(m).wdmax>wdmax0); num0=sum(id);v.box(m).num0=num0;
    [a b]=hist(v.box(m).psmin(id),psbin); v.box(m).fpsmin = a/(sum(a)); v.psbin = b;
    [a b]=hist(v.box(m).wdmax(id),wdbin); v.box(m).fwdmax = a/(sum(a)); v.wdbin = b;
%    [a b]=hist(v.box(m).psmin(id),psbin); v.box(m).fpsmin = a/sum(a)*num0/v.nyr; v.psbin = b;
%    [a b]=hist(v.box(m).wdmax(id),wdbin); v.box(m).fwdmax = a/sum(a)*num0/v.nyr; v.wdbin = b;
    if(strcmp(opt,'mod'))
      [a b]=hist(v.box(m).vtmax(id),vtbin);v.box(m).fvtmax= a/sum(a)*num0/v.nyr; v.vtbin = b;
    end
  end
end

for m=1:v.nbox
  n2=0;
  for t=1:v.nyr
    num=length(v.pres(m,t).pres);
    n1=n2+1; n2=n1+num-1;
    v.box(m).presall(n1:n2)=v.pres(m,t).pres;
    v.box(m).windall(n1:n2)=v.wind(m,t).wind;
  end
  id=(v.box(m).presall~=0 & v.box(m).presall~=-999 & v.box(m).presall<1000);
  v.box(m).presall=v.box(m).presall(id);
  v.box(m).windall=v.box(m).windall(id);
  [a b]=hist(v.box(m).presall,psbin); v.box(m).fpsall = a/sum(a); v.psbin = b;
  [a b]=hist(v.box(m).windall,wdbin); v.box(m).fwdall = a/sum(a); v.wdbin = b;
end

% $$$ m=7;a=squeeze(v.c1num(m,:,:));b=reshape(a',25*12,1);c=b(7:end-6);
% $$$ v.cat1num_sh(m,1)=sum(b(1:6));
% $$$ for i=1:24; 
% $$$   v.cat1num_sh(m,i+1)=sum(c((i-1)*12+1:i*12));
% $$$ end
% $$$ m=8;a=squeeze(v.c1num(m,:,:));b=reshape(a',25*12,1);c=b(7:end-6);
% $$$ v.cat1num_sh(m,1)=sum(b(1:6));
% $$$ for i=1:24; 
% $$$   v.cat1num_sh(m,i+1)=sum(c((i-1)*12+1:i*12));
% $$$ end
% $$$ m=7; v.cat1num(m,:)=v.cat1num_sh(m,:);
% $$$ m=8; v.cat1num(m,:)=v.cat1num_sh(m,:);


%frequency of occurrence==================
lonb=[0:  5:360]; nlon=length(lonb); v.lonfq=lonb(1:end-1);
latb=[-60:4:60 ]; nlat=length(latb); v.latfq=latb(1:end-1);
for t=1:v.nyr
  i=1; na=1;
  for n=1:length(trtmp)
    ts =trtmp(n); 
    idd= ((ts.lat(1)>-latbnd & ts.lat(1)<latbnd) | isobs);
%    idt= (ts.month(1)==7 |ts.month(1)==8 |ts.month(1)==9|...
%	  ts.month(1)==10|ts.month(1)==11|ts.month(1)==12);
%    idd= (idd & idt);% & (ts.dur_norm>=3*86400.);
    if ((ts.year(1) == v.tyear(t)) & idd)
      v.yr(t).ts(i)=ts;
      i=i+1; 
    end
  end
  v.yr(t).na=na-1;
end

for t=1:v.nyr
  trtmp=v.yr(t).ts;
  for j=1:nlat-1
    for i=1:nlon-1
      v.fq_stm(t,j,i)=0;
      v.fq_hur(t,j,i)=0;
      v.gs_stm(t,j,i)=0;
      v.gs_hur(t,j,i)=0;
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
	  v.fq_stm(t,j,i)=v.fq_stm(t,j,i)+1;
	end
	if (id_in==1 & ts.hur>=1)
	  v.fq_hur(t,j,i)=v.fq_hur(t,j,i)+1;
	end
	if (idgs_in==1 & ts.hur>=0)
	  v.gs_stm(t,j,i)=v.gs_stm(t,j,i)+1;
	end
	if (idgs_in==1 & ts.hur>=1)
	  v.gs_hur(t,j,i)=v.gs_hur(t,j,i)+1;
	end
      end
    end
  end
%  figure; cmin=0; cmax=5; v.tyear(t); sum(sum(v.fq_hur(t,:,:)))
%  pcolor(v.lonfq,v.latfq,squeeze(v.fq_hur(t,:,:))); caxis([cmin cmax]);
%  shading flat; colorbar; hold on; 
end

%collect NA, EP, WP storms==========================
m1=7; m2=12; 
v.sn  =sum(v.c0num(:,:,m1:m2),3);
v.hn  =sum(v.c1num(:,:,m1:m2),3);
v.sace=sum(v.c0ace(:,:,m1:m2),3);

m=2; v.na.hn=v.hn(m,:); v.na.sn=v.sn(m,:); v.na.sace=v.sace(m,:);
m=5; v.ep.hn=v.hn(m,:); v.ep.sn=v.sn(m,:); v.ep.sace=v.sace(m,:);
m=4; v.wp.hn=v.hn(m,:); v.wp.sn=v.sn(m,:); v.wp.sace=v.sace(m,:);

return





%collect NA, EP, WP storms==========================
na_k1=1; na_k2=1; ep_k1=1; ep_k2=1; wp_k1=1; wp_k2=1; 
for i=1:length(trtmp)
  ts =trtmp(i);
  idd= (ts.lat(1)>-latbnd & ts.lat(1)<latbnd) | isobs;
  idt= ts.yearmax==yr_beg & (ts.monthmax==7|ts.monthmax==8|ts.monthmax==9|...
			     ts.monthmax==10|ts.monthmax==11|ts.monthmax==12);
  if (idd & idt & (ts.boxname=='NA'))
    if (ts.hur>=1)
      v.na.hur(na_k1).lon=ts.lon;
      v.na.hur(na_k1).lat=ts.lat;
      v.na.hur(na_k1).wnd=ts.wind;
      v.na.hur(na_k1).pre=ts.pres;
      v.na.hur(na_k1).mon=ts.month;
      v.na.hur(na_k1).day=ts.day;
      na_k1=na_k1+1;
    end
    if (ts.hur>=0)
      v.na.stm(na_k2).lon=ts.lon;
      v.na.stm(na_k2).lat=ts.lat;
      v.na.stm(na_k2).wnd=ts.wind;
      v.na.stm(na_k2).pre=ts.pres;
      v.na.stm(na_k2).mon=ts.month;
      v.na.stm(na_k2).day=ts.day;
      na_k2=na_k2+1;
    end
  end
  if (idd & idt & (ts.boxname=='EP'))
    if (ts.hur>=1)
      v.ep.hur(ep_k1).lon=ts.lon;
      v.ep.hur(ep_k1).lat=ts.lat;
      v.ep.hur(ep_k1).wnd=ts.wind;
      v.ep.hur(ep_k1).pre=ts.pres;
      v.ep.hur(ep_k1).mon=ts.month;
      v.ep.hur(ep_k1).day=ts.day;
      ep_k1=ep_k1+1;
    end
    if (ts.hur>=0)
      v.ep.stm(ep_k2).lon=ts.lon;
      v.ep.stm(ep_k2).lat=ts.lat;
      v.ep.stm(ep_k2).wnd=ts.wind;
      v.ep.stm(ep_k2).pre=ts.pres;
      v.ep.stm(ep_k2).mon=ts.month;
      v.ep.stm(ep_k2).day=ts.day;
      ep_k2=ep_k2+1;
    end
  end
  if (idd & idt & (ts.boxname=='WP'))
    if (ts.hur>=1)
      v.wp.hur(wp_k1).lon=ts.lon;
      v.wp.hur(wp_k1).lat=ts.lat;
      v.wp.hur(wp_k1).wnd=ts.wind;
      v.wp.hur(wp_k1).pre=ts.pres;
      v.wp.hur(wp_k1).mon=ts.month;
      v.wp.hur(wp_k1).day=ts.day;
      wp_k1=wp_k1+1;
    end
    if (ts.hur>=0)
      v.wp.stm(wp_k2).lon=ts.lon;
      v.wp.stm(wp_k2).lat=ts.lat;
      v.wp.stm(wp_k2).wnd=ts.wind;
      v.wp.stm(wp_k2).pre=ts.pres;
      v.wp.stm(wp_k2).mon=ts.month;
      v.wp.stm(wp_k2).day=ts.day;
      wp_k2=wp_k2+1;
    end
  end
  
end
v.na.hn=na_k1-1; v.na.sn=na_k2-1;
v.ep.hn=ep_k1-1; v.ep.sn=ep_k2-1;
v.wp.hn=wp_k1-1; v.wp.sn=wp_k2-1;

return

