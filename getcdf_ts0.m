function c=getcdf_ts0(v,dowhat,mbox,opt)

latbnd=30;v
if strcmp(dowhat,'do_j2d')
  doid=0; season='J2D';
else
  doid=1; season='ALL';
end
%wdbin=[5:5:90];  windmin=10; windmax=90; 
wdbin=[13:2.5:90]; windmin=10; windmax=90; 
wdbin0=wdbin; wdbin0(end+1)=wdbin0(end)+wdbin0(end)-wdbin0(end-1);wdbin0=wdbin0(2:end);

psbin =[850:5:1000]; 
psbin0=psbin; psbin0(end+1)=psbin0(end)+psbin0(end)-psbin0(end-1);psbin0=psbin0(2:end);

dubin =[2:0.5:30]; 
dubin0=dubin; dubin0(end+1)=dubin0(end)+dubin0(end)-dubin0(end-1);dubin0=dubin0(2:end);

acbin =[13:2.5:90]; %[0:0.25:25]*10^4;
acbin0=acbin; acbin0(end+1)=acbin0(end)+acbin0(end)-acbin0(end-1);acbin0=acbin0(2:end);

pwbin =[13:2.5:90]; %[0:5:500]*10^4;
pwbin0=pwbin; pwbin0(end+1)=pwbin0(end)+pwbin0(end)-pwbin0(end-1);pwbin0=pwbin0(2:end);

pdbin =[0:5:500]*10^4;
pdbin0=pdbin; pdbin0(end+1)=pdbin0(end)+pdbin0(end)-pdbin0(end-1);pdbin0=pdbin0(2:end);

dwbin=[-20:0.5:20]; 
dwbin0=dwbin; dwbin0(end+1)=dwbin0(end)+dwbin0(end)-dwbin0(end-1);dwbin0=dwbin0(2:end);

if strcmp(opt,'obs')
  v.tr=v.trobs;
  idd_obs=1;
else
  idd_obs=0;
end

t=[1:length(v.tyear)]; icount=1; N=100; numb(1)=0
for j=1:length(t)
  k=1; wndall=0; preall=0; durall=0; aceall=0; pdwall=0; pdiall=0;
  wndaaa=0; n2=0; dwind=0; m2=0;
  for i=1:length(v.tr)
    ts =v.tr(i); 
    idd= (ts.lat(1)>-latbnd & ts.lat(1)<latbnd) | idd_obs; 
    idt= (ts.monthmax==7 |ts.monthmax==8 |ts.monthmax==9|...
	  ts.monthmax==10|ts.monthmax==11|ts.monthmax==12)|doid;
    idd= idd & idt;
    if (ts.yearmax==v.tyear(t(j)) & ts.boxnumb==mbox & idd)
      wndall(k)=ts.windmax; %ts.num
      preall(k)=getpresmin(ts.pres,opt);
      durall(k)=max(sum(ts.wind>=17),1);%one observed storm<17m/s
      aceall(k)=(ts.ace/durall(k))^(1/2);
      pdwall(k)=(ts.pdi/durall(k))^(1/3);
      pdiall(k)= ts.pdi;
      n1=n2+1; n2=n1+ts.num-1;
      wndaaa(n1:n2)=ts.wind;
      [tmp,wmax]=getdailydiff(ts.wind,opt); %wmax-wndall(k); wndall(k)=wmax;
      m1=m2+1; m2=m1+length(tmp)-1;
      dwind (m1:m2)=tmp;
      for n=1:N
	if n<=ts.num
	  tim(n)=(n-1)*6; 
	  wtm(n)=ts.wind(n);
	else
	  tim(n)=-inf;
	  wtm(n)=-inf;
	end
      end
      numb(j)=k;
      time(icount,:)=tim(:);
      wind(icount,:)=wtm(:);
      icount=icount+1; clear tim wtm
      k=k+1;
    end
  end
  wndaaa=wndaaa(wndaaa>=17); %aceall pdiall wndall
  durall=durall/4;
  if (isempty(wndaaa)); wndaaa=0; end;
  if (isempty(dwind));  dwind =0; end;
  [cdf,CDF]=mizcdf(wndaaa, wdbin,0);cdf_waaa(:,j)=cdf;CDF_waaa(:,j)=CDF;
  [cdf,CDF]=mizcdf(dwind,  dwbin,0);cdf_dwnd(:,j)=cdf;CDF_dwnd(:,j)=CDF;
  [cdf,CDF]=mizcdf(wndall, wdbin,0);cdf_wind(:,j)=cdf;CDF_wind(:,j)=CDF;
  [cdf,CDF]=mizcdf(preall, psbin,1);cdf_pres(:,j)=cdf;CDF_pres(:,j)=CDF;
  [cdf,CDF]=mizcdf(durall, dubin,0);cdf_dura(:,j)=cdf;CDF_dura(:,j)=CDF;
  [cdf,CDF]=mizcdf(aceall, acbin,0);cdf_acex(:,j)=cdf;CDF_acex(:,j)=CDF;
  [cdf,CDF]=mizcdf(pdwall, pwbin,0);cdf_pdwx(:,j)=cdf;CDF_pdwx(:,j)=CDF;
  [cdf,CDF]=mizcdf(pdiall, pdbin,0);cdf_pdix(:,j)=cdf;CDF_pdix(:,j)=CDF;
  if (j==1)
    wndall_tot=wndall;
    pdwall_tot=pdwall;
    durall_tot=durall;
    pdiall_tot=pdiall;
  else
    wndall_tot=[wndall_tot wndall]; %size(wndall_tot)
    pdwall_tot=[pdwall_tot pdwall]; %size(pdwall_tot)
    durall_tot=[durall_tot durall]; %size(durall_tot)
    pdiall_tot=[pdiall_tot pdiall]; %size(pdiall_tot)
  end
end
c.wndall_tot=wndall_tot;
c.pdwall_tot=pdwall_tot;
c.durall_tot=durall_tot;
c.pdiall_tot=pdiall_tot;
c.wdbin=wdbin0; c.CDF_waaa=CDF_waaa;
c.dwbin=dwbin0; c.CDF_dwnd=CDF_dwnd;

c.wdbin=wdbin0; c.CDF_wind=CDF_wind;
c.psbin=psbin0; c.CDF_pres=CDF_pres;
c.dubin=dubin0; c.CDF_dura=CDF_dura;
c.acbin=acbin0; c.CDF_acex=CDF_acex;
c.pwbin=pwbin0; c.CDF_pdwx=CDF_pdwx;
c.pdbin=pdbin0; c.CDF_pdix=CDF_pdix;


c.CDF_waa=sum(CDF_waaa,2)/length(t);
if c.CDF_waa(1)~=0
  c.cdf_waa=c.CDF_waa/c.CDF_waa(1);
else
  c.cdf_waa=0;
end

c.CDF_dwd=sum(CDF_dwnd,2)/length(t);
if c.CDF_dwd(1)~=0
  c.cdf_dwd=c.CDF_dwd/c.CDF_dwd(1);
else
  c.cdf_dwd=0;
end

c.CDF_wnd=sum(CDF_wind,2)/length(t);
if c.CDF_wnd(1)~=0
  c.cdf_wnd=c.CDF_wnd/c.CDF_wnd(1);
else
  c.cdf_wnd=0;
end

c.CDF_pre=sum(CDF_pres,2)/length(t);
if c.CDF_pre(end)~=0
  c.cdf_pre=c.CDF_pre/c.CDF_pre(end);
else
  c.cdf_pre=0;
end

c.CDF_dur=sum(CDF_dura,2)/length(t);
if c.CDF_dur(1)~=0
  c.cdf_dur=c.CDF_dur/c.CDF_dur(1);
else
  c.cdf_dur=0;
end

c.CDF_ace=sum(CDF_acex,2)/length(t);
if c.CDF_ace(1)~=0
  c.cdf_ace=c.CDF_ace/c.CDF_ace(1);
else
  c.cdf_ace=0;
end

c.CDF_pdw=sum(CDF_pdwx,2)/length(t);
if c.CDF_pdw(1)~=0
  c.cdf_pdw=c.CDF_pdw/c.CDF_pdw(1);
else
  c.cdf_pdw=0;
end

c.CDF_pdi=sum(CDF_pdix,2)/length(t);
if c.CDF_pdi(1)~=0
  c.cdf_pdi=c.CDF_pdi/c.CDF_pdi(1);
else
  c.cdf_pdi=0;
end

if (length(numb)>1)
  c.wind=wind;
  c.time=time;
  c.numb=numb;
else
  c.wind=0;
  c.time=0;
  c.numb=0;
end

return




