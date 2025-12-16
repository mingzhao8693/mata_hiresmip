function r=get_iso_reg_3d(varb,v,opt,event,dodiff)
%varb(day,yr,lat,lon);
%latlon=[75 100 -6.5 6.5]; latlon=[70 90  -6.5 6.5];
latlon=[75 85  -6.5 6.5]; s=strcat('dodiff=',dodiff);s
lat1=latlon(3); lat2=latlon(4); lon1=latlon(1); lon2=latlon(2);
ys=min(find(v.lat(:)>lat1)); ye=max(find(v.lat(:)< lat2));
xs=min(find(v.lon(:)>lon1)); xe=max(find(v.lon(:)< lon2));
xyavg=mean(mean(varb(:,:,:,ys:ye,xs:xe),5),4);%xyavg(day,year)
if strcmp(dodiff,'yes')
  tmp=diff(xyavg,1,3);xyavg(:,:,2:v.nz)=tmp;
end
%for i=1:v.nday
%  for n=1:v.nyr
%    xyavg(i,n,:)=xyavg(i,n,v.nz)-xyavg(i,n,:);
%  end
%end
%daily climatology averaged over all years
clm_day=squeeze(mean(xyavg,2)); %clm_day(nday)
tmp=xyavg;
for y=1:v.nyr
  tmp(:,y,:) = clm_day(:,:);
end
anom = xyavg-tmp;

%put xyavg and anom back to multiyear daily data 
org    =reshape(xyavg,v.nt,v.nz,1);
ano_org=reshape(anom, v.nt,v.nz,1); 
clm_org=reshape(tmp,  v.nt,v.nz,1); 

%band filtering of the time serie at each point
dd1=20; dd2=100;
for k=1:v.nz
  ano_iso(:,k)=mybandpass(ano_org(:,k),dd1,dd2);
end

%winter time TS: t1=Nov01; t2=Apr30
for n=1:v.nyr-1;
  %t1(n)=n*10*30+1; t2(n)=t1(n)+30*6; %Nov-to-Apr, 6mon after Nov 1
  t1(n)=(n-1)*365+10*30+1; t2(n)=t1(n)+30*6; %Nov-to-Apr, 6mon after Nov 1
  %IO winter time series r.ano_iso_win(yr,day)
  ano_org_win(n,:,:)=ano_org(t1(n):t2(n),:);
  ano_iso_win(n,:,:)=ano_iso(t1(n):t2(n),:);
  clm_org_win(n,:,:)=clm_org(t1(n):t2(n),:);
end
r.org     =org;
r.clm_day0=clm_day;       %daily climatology at each location
r.ano_org0=ano_org;       %IO all season daily TS
r.ano_iso0=ano_iso;       %IO all season daily TS
r.ano_iso_win=ano_iso_win;%IO winter daily TS (yr, Nov1:Nov1+6mon)
r.ano_org_win=ano_org_win;%IO winter daily TS (yr, Nov1:Nov1+6mon)
r.clm_org_win=clm_org_win;
r.t1=t1; 
r.t2=t2;
r.ano_iso_win_std =squeeze(std(ano_iso_win,0,2));
r.ano_org_win_std =squeeze(std(ano_org_win,0,2));
r.ano_iso_win_std0=squeeze(mean(r.ano_iso_win_std,1));
r.ano_org_win_std0=squeeze(mean(r.ano_org_win_std,1));
r.std_ratio=r.ano_iso_win_std0./r.ano_org_win_std0;
r.latlon=latlon;
lgd_max=30; lgd=[-lgd_max:lgd_max];
r.lgd=lgd;
ndw=length(r.ano_iso_win(1,:,1)); r.ndw=ndw;
if (opt==0)
  sig=r.ano_iso_win_std0;
  i=1;
  for n=1:v.nyr-1;
    x=r.ano_iso_win(n,:,:); 
    for t=lgd_max+1:ndw-lgd_max
      id0=x(t)>1.0*sig;
      id1=x(t)>x(t-1) & x(t)>x(t+1);
      id3=t > lgd_max & t < ndw-lgd_max;
      if (id0 & id1 & id3)
	r.event.yr(i)=n;
	r.event.ts(i)=t-lgd_max;
	r.event.te(i)=t+lgd_max;r
	r.event.var(i,:,:)=x(r.event.ts(i):r.event.te(i),:);
	i=i+1;
      end
    end
  end
  r.event.num=i-1;
elseif (opt==1)
  for i=1:event.num
    yr=event.yr(i);
    ts=event.ts(i);
    te=event.te(i);
    r.comp_iso(i,:,:)=r.ano_iso_win(yr,ts:te,:);
    r.comp_org(i,:,:)=r.ano_org_win(yr,ts:te,:);
    r.comp_clm(i,:,:)=r.clm_org_win(yr,ts:te,:);
  end
  r.comp_iso_avg=(squeeze(mean(r.comp_iso,1)))';
  r.comp_org_avg=(squeeze(mean(r.comp_org,1)))';
  r.comp_clm_avg=(squeeze(mean(r.comp_clm,1)))';
%  r.comp_iso_avg_n=r.comp_iso_avg/r.ano_iso_win_std0
%  r.comp_org_avg_n=r.comp_org_avg/r.ano_org_win_std0
end
return




