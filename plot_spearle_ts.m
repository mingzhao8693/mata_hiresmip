function [ts,ind]=plot_spearle_ts(vm, o, p)
land_th=o.land_th; ice_th=o.ice_th; 
a=o.lm0; a(a>=land_th)=1; a(a<land_th)=0; lm=a; %land mask
a=o.imk; a(a>=ice_th) =1; a(a<=ice_th)=0; im=a; %ice mask
idm=lm|im; id=~idm;                     %land & ice mask
aa=o.aa; aa0=aa(id)/mean(aa(id)); %for open ocean area-weighting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lon=o.lon; lat=o.lat; rg.idm_all=idm; rg.id_all=id;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rg.latlon_tpac=[140 270 -10 10]; a=rg.latlon_tpac; %rg:tropical Pacific region
rg.latlon_tpac=[110 280 -10 10]; a=rg.latlon_tpac; %rg:tropical Pacific region

lat1=a(3); lat2=a(4); lon1=a(1); lon2=a(2); rg.tpac=[lon1 lat1 lon2-lon1 lat2-lat1];
rg.ys=min(find(lat(:)>=lat1)); rg.ye=max(find(lat(:)<=lat2));
rg.xs=min(find(lon(:)>=lon1)); rg.xe=max(find(lon(:)<=lon2));
a=id; a(:,:)=0; a(rg.ys:rg.ye,rg.xs:rg.xe)=1; rg.id=a;
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
rg.latlon_ipwp=[50  180 -30  30];
rg.latlon_trop=[0   360 -30  30];
rg.latlon_so  =[0   360 -75 -45];
rg.latlon_glob=[0   360 -90  90];
a=rg.latlon_ipwp; rg.ipwp=[a(1) a(3) a(2)-a(1) a(4)-a(3)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%observed trend%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
obs=squeeze(vm(1).sst.hadisst.trend); a=obs; 
a0=mean(mean(a(id).*aa0)); 
if p.do_norm; 
  a=(a-a0)/a0; obs_norm=a; 
end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mod_num=30;  x=[1979:2020];
for i = 1:mod_num
  v=vm(i);
  if strcmp(p.vname,'sst_trend')|strcmp(p.vname,'sst_trend_norm')
    a=v.sst.mod.trend; mod_org(i,:,:)=a; 
    mod_all(i,:,:,:)=squeeze(mean(v.sst.mod.ts.sst,2));
    a0=mean(mean(a(id).*aa0)); mod_av(i)=a0;
    if p.do_norm
      a=(a-a0)/a0; mod_norm(i,:,:)=a;
      ts(i)=get_sst_indices(o,a,rg,obs_norm);
    else
      ts(i)=get_sst_indices(o,a,rg,obs);
    end
  end
  a=v.tsurf; b=get_sst_indices(o,a,rg);
  y=b.wpac-b.epac;            c=polyfit(x, y, 1); ts(i).we  =c(1)*10;ts(i).we_ts=y;
  y=(b.shep+b.nhep)/2-b.equa; c=polyfit(x, y, 1); ts(i).pe  =c(1)*10;ts(i).pe_ts=y;
  y=b.so;                     c=polyfit(x, y, 1); ts(i).so  =c(1)*10;ts(i).so_ts=y;
  y=b.ipwp;                   c=polyfit(x, y, 1); ts(i).ipwp=c(1)*10;ts(i).ipwp_ts=y;
  y=b.trop;                   c=polyfit(x, y, 1); ts(i).trop=c(1)*10;ts(i).trop_ts=y;
  y=b.glob;                   c=polyfit(x, y, 1); ts(i).glob=c(1)*10;ts(i).glob_ts=y;
  ts(i).rat_ipwp1=ts(i).ipwp/ts(i).trop;
  ts(i).rat_ipwp2=ts(i).ipwp/ts(i).glob;
  ts(i).rat_so1  =ts(i).so  /ts(i).trop;
  ts(i).rat_so2  =ts(i).so  /ts(i).glob;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%HadISST observed trend%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1; a0=mean(mean(obs(id).*aa0));
if p.do_norm; 
  a=obs_norm; 
else
  a=obs;
end
ts(i)=get_sst_indices(o,a,rg,obs);
corr_glob(i)=ts(i).corr_glob;
corr_tpac(i)=ts(i).corr_tpac;
%---------------------------
a=vm(1).sst.hadisst.ts.sst; a=squeeze(mean(a,2));
b=get_sst_indices(o,a,rg);
y=b.wpac-b.epac;            c=polyfit(x, y, 1); ts(i).we  =c(1)*10;ts(i).we_ts=y;
y=(b.shep+b.nhep)/2-b.equa; c=polyfit(x, y, 1); ts(i).pe  =c(1)*10;ts(i).pe_ts=y;
y=b.so;                     c=polyfit(x, y, 1); ts(i).so  =c(1)*10;ts(i).so_ts=y;
y=b.ipwp;                   c=polyfit(x, y, 1); ts(i).ipwp=c(1)*10;ts(i).ipwp_ts=y;
y=b.trop;                   c=polyfit(x, y, 1); ts(i).trop=c(1)*10;ts(i).trop_ts=y;
y=b.glob;                   c=polyfit(x, y, 1); ts(i).glob=c(1)*10;ts(i).glob_ts=y;
ts(i).rat_ipwp1=ts(i).ipwp/ts(i).trop;
ts(i).rat_ipwp2=ts(i).ipwp/ts(i).glob;
ts(i).rat_so1  =ts(i).so  /ts(i).trop;
ts(i).rat_so2  =ts(i).so  /ts(i).glob;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERSST observed trend%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1; a=squeeze(vm(1).sst.ersst.trend); 
idx=~isnan(a)&id; a0=o.aa; a0=a0(idx)/mean(a0(idx));
a0=mean(mean(a(idx).*a0));
if p.do_norm; a=(a-a0)/a0; end
ts(i)=get_sst_indices(o,a,rg,obs);
corr_glob(i)=ts(i).corr_glob;
corr_tpac(i)=ts(i).corr_tpac;
%---------------------------
a=vm(1).sst.ersst.ts.sst; a=squeeze(mean(a,2));
b=get_sst_indices(o,a,rg);
y=b.wpac-b.epac;            c=polyfit(x, y, 1); ts(i).we  =c(1)*10;ts(i).we_ts=y;
y=(b.shep+b.nhep)/2-b.equa; c=polyfit(x, y, 1); ts(i).pe  =c(1)*10;ts(i).pe_ts=y;
y=b.so;                     c=polyfit(x, y, 1); ts(i).so  =c(1)*10;ts(i).so_ts=y;
y=b.ipwp;                   c=polyfit(x, y, 1); ts(i).ipwp=c(1)*10;ts(i).ipwp_ts=y;
y=b.trop;                   c=polyfit(x, y, 1); ts(i).trop=c(1)*10;ts(i).trop_ts=y;
y=b.glob;                   c=polyfit(x, y, 1); ts(i).glob=c(1)*10;ts(i).glob_ts=y;
ts(i).rat_ipwp1=ts(i).ipwp/ts(i).trop;
ts(i).rat_ipwp2=ts(i).ipwp/ts(i).glob;
ts(i).rat_so1  =ts(i).so  /ts(i).trop;
ts(i).rat_so2  =ts(i).so  /ts(i).glob;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%COBESST observed trend%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1; a=squeeze(vm(1).sst.cobesst.trend);
idx=~isnan(a)&id; a0=o.aa; a0=a0(idx)/mean(a0(idx));
a0=mean(mean(a(idx).*a0));
if p.do_norm; a=(a-a0)/a0; end
ts(i)=get_sst_indices(o,a,rg,obs);
corr_glob(i)=ts(i).corr_glob;
corr_tpac(i)=ts(i).corr_tpac;
a=vm(1).sst.cobesst.ts.sst; a=squeeze(mean(a,2));
b=get_sst_indices(o,a,rg);
y=b.wpac-b.epac;            c=polyfit(x, y, 1); ts(i).we  =c(1)*10;ts(i).we_ts=y;
y=(b.shep+b.nhep)/2-b.equa; c=polyfit(x, y, 1); ts(i).pe  =c(1)*10;ts(i).pe_ts=y;
y=b.so;                     c=polyfit(x, y, 1); ts(i).so  =c(1)*10;ts(i).so_ts=y;
y=b.ipwp;                   c=polyfit(x, y, 1); ts(i).ipwp=c(1)*10;ts(i).ipwp_ts=y;
y=b.trop;                   c=polyfit(x, y, 1); ts(i).trop=c(1)*10;ts(i).trop_ts=y;
y=b.glob;                   c=polyfit(x, y, 1); ts(i).glob=c(1)*10;ts(i).glob_ts=y;
ts(i).rat_ipwp1=ts(i).ipwp/ts(i).trop;
ts(i).rat_ipwp2=ts(i).ipwp/ts(i).glob;
ts(i).rat_so1  =ts(i).so  /ts(i).trop;
ts(i).rat_so2  =ts(i).so  /ts(i).glob;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%COBE2SST observed trend%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1; a=squeeze(vm(1).sst.cobe2sst.trend);
idx=~isnan(a)&id; a0=o.aa; a0=a0(idx)/mean(a0(idx));
a0=mean(mean(a(idx).*a0));
if p.do_norm; a=(a-a0)/a0; end
ts(i)=get_sst_indices(o,a,rg,obs);
corr_glob(i)=ts(i).corr_glob;
corr_tpac(i)=ts(i).corr_tpac;
a=vm(1).sst.cobe2sst.ts.sst; a=squeeze(mean(a,2));
b=get_sst_indices(o,a,rg);
y=b.wpac-b.epac;            c=polyfit(x, y, 1); ts(i).we  =c(1)*10;ts(i).we_ts=y;
y=(b.shep+b.nhep)/2-b.equa; c=polyfit(x, y, 1); ts(i).pe  =c(1)*10;ts(i).pe_ts=y;
y=b.so;                     c=polyfit(x, y, 1); ts(i).so  =c(1)*10;ts(i).so_ts=y;
y=b.ipwp;                   c=polyfit(x, y, 1); ts(i).ipwp=c(1)*10;ts(i).ipwp_ts=y;
y=b.trop;                   c=polyfit(x, y, 1); ts(i).trop=c(1)*10;ts(i).trop_ts=y;
y=b.glob;                   c=polyfit(x, y, 1); ts(i).glob=c(1)*10;ts(i).glob_ts=y;
ts(i).rat_ipwp1=ts(i).ipwp/ts(i).trop;
ts(i).rat_ipwp2=ts(i).ipwp/ts(i).glob;
ts(i).rat_so1  =ts(i).so  /ts(i).trop;
ts(i).rat_so2  =ts(i).so  /ts(i).glob;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SPEAR LE ensemble mean%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1;
a=mod_org; a=squeeze(mean(a,1)); a0=mean(mean(a(id).*aa0));
if p.do_norm; 
  a=mod_norm; a=squeeze(mean(a,1)); ts(i)=get_sst_indices(o,a,rg,obs_norm);
else
  a=mod_org;  a=squeeze(mean(a,1)); ts(i)=get_sst_indices(o,a,rg,obs);
end
corr_glob(i)=ts(i).corr_glob;
corr_tpac(i)=ts(i).corr_tpac;
a=squeeze(mean(mod_all,1)); b=get_sst_indices(o,a,rg);
y=b.wpac-b.epac;            c=polyfit(x, y, 1); ts(i).we  =c(1)*10;ts(i).we_ts=y;
y=(b.shep+b.nhep)/2-b.equa; c=polyfit(x, y, 1); ts(i).pe  =c(1)*10;ts(i).pe_ts=y;
y=b.so;                     c=polyfit(x, y, 1); ts(i).so  =c(1)*10;ts(i).so_ts=y;
y=b.ipwp;                   c=polyfit(x, y, 1); ts(i).ipwp=c(1)*10;ts(i).ipwp_ts=y;
y=b.trop;                   c=polyfit(x, y, 1); ts(i).trop=c(1)*10;ts(i).trop_ts=y;
y=b.glob;                   c=polyfit(x, y, 1); ts(i).glob=c(1)*10;ts(i).glob_ts=y;
ts(i).rat_ipwp1=ts(i).ipwp/ts(i).trop;
ts(i).rat_ipwp2=ts(i).ipwp/ts(i).glob;
ts(i).rat_so1  =ts(i).so  /ts(i).trop;
ts(i).rat_so2  =ts(i).so  /ts(i).glob;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%simple indices%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:length(ts)
  a=ts(i); we(i)=a.we; pe(i)=a.pe; wme(i)=a.wme; pme(i)=a.pme; 
  ipwp(i)=a.ipwp; so(i)=a.so; trop(i)=a.trop; glob(i)=a.glob;
  rat_ipwp(i)=a.rat_ipwp2; rat_so(i)=a.rat_so2; 
  corr_glob(i)=a.corr_glob; %corr_trop(i)=a.corr_trop;
  corr_tpac(i)=a.corr_tpac;
end

ind.we=we; ind.pe=pe; 
ind.rat_ipwp=rat_ipwp; ind.rat_so=rat_so; ind.so=so;
ind.corr_glob=corr_glob; ind.corr_tpac=corr_tpac;
ind.ipwp=ipwp; ind.so=so; ind.trop=trop; ind.glob=glob;


return

pms=[ 0, 0, p.xsize, p.ysize+500]*1.2; fsize=6; 
handle=figure('Position',pms,'visible','on'); 
xt=[1979:2020];
for i=1:30
  y=-ts(i).we_ts; y=ts(i).nino34
  y=y-mean(y);
  plot(xt,y); hold on;
end
lw=2;
for i=31:35
  y=-ts(i).we_ts; y=y-mean(y);
  plot(xt,y,'LineWidth',lw); hold on;
end
legend('show'); grid on;

vname='index'; mod_name=p.mod_name; 
visfig='off'; figpath='./fig_cre/';
printnew(visfig,figpath,mod_name,vname);

return
