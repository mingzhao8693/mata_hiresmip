function [v]=do_AR_precip_usa_obs(tpath,expn,yr1,yr2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%tpath='/work/miz/mat_hiresmip/'; expn='ERAI_6h_DATA';
%tpath='/work/miz/mat_hiresmip/usa/'; expn='c192_era5'; yr1=2001; yr2=2010;
tpath='/work/miz/mat_hiresmip/usa/'; expn='c192L33_am4p0_amip_HIRESMIP_nudge_wind_1951_2020'; yr1=1979; yr2=1996;
d=2; s0='_readartcmcs_day_usa.mat'; nyr=yr2-yr1+1;
for t=1:nyr; %42; %year=197901-202012
  year(t)=yr1+t-1; a=num2str(year(t)); yrs=strcat('_',a,'_',a,'_');
  fext=strcat(yrs,'AR_diag0',s0); fn=strcat(tpath,expn,'/',expn,fext); fn
  load(fn); 
  frqday     (t,:,:,:) = v.frqday;
  prday_av   (t,:,:,:) = v.prday_av; 
  prday_idwei(t,:,:,:) = v.prday_idwei;
  prday_idavg(t,:,:,:) = v.prday_idavg;
  prday_idstd(t,:,:,:) = v.prday_idstd;
  prday_idmax(t,:,:,:) = v.prday_idmax;
end
x.yr=year; x.nyr=length(x.yr); x.v=v;
for t=1:x.nyr-1; %year=197911-201912;
  a=frqday;      a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.frqday(t,:,:,:)=get7season(a,1);
  a=prday_av;    a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.prday_av(t,:,:,:)=get7season(a,1);
  a=prday_idwei; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.prday_idwei(t,:,:,:)=get7season(a,1);
  a=prday_idavg; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.prday_idavg(t,:,:,:)=get7season(a,1);
  a=prday_idstd; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.prday_idstd(t,:,:,:)=get7season(a,1);
  a=prday_idmax; a=[a(t,11:12,:,:) a(t+1,1:12,:,:)]; a=squeeze(a);
  x.prday_idmax(t,:,:,:)=get7season(a,1);
end
t=x.nyr;
a=frqday;      a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
x.frqday(t,:,:,:)=get7season(a,1);
a=prday_av;    a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
x.prday_av(t,:,:,:)=get7season(a,1);
a=prday_idwei; a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
x.prday_idwei(t,:,:,:)=get7season(a,1);
a=prday_idavg; a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
x.prday_idavg(t,:,:,:)=get7season(a,1);
a=prday_idstd; a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
x.prday_idstd(t,:,:,:)=get7season(a,1);
a=prday_idmax; a=[a(t,11:12,:,:) a(t,1:12,:,:)]; a=squeeze(a);
x.prday_idmax(t,:,:,:)=get7season(a,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s.lat=v.lat; s.lon=v.lon; s.lm0=v.lm; s.aa=v.aa; x.s=s;
x.nseason=length(x.frqday(1,:,1,1)); x.season=[1:x.nseason];
sname='NWR';    [x.nwr.frqday x.id_nwr]=get_var_state(x,sname,x.frqday);
sname='NWR';    [x.nwr.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='NWR';    [x.nwr.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='NWR';    [x.nwr.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='NWR';    [x.nwr.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='UMW';    [x.umw.frqday x.id_umw]=get_var_state(x,sname,x.frqday);
sname='UMW';    [x.umw.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='UMW';    [x.umw.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='UMW';    [x.umw.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='UMW';    [x.umw.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='NER';    [x.ner.frqday x.id_ner]=get_var_state(x,sname,x.frqday);
sname='NER';    [x.ner.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='NER';    [x.ner.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='NER';    [x.ner.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='NER';    [x.ner.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='WWR';    [x.wwr.frqday x.id_wwr]=get_var_state(x,sname,x.frqday);
sname='WWR';    [x.wwr.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='WWR';    [x.wwr.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='WWR';    [x.wwr.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='WWR';    [x.wwr.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='NRP';    [x.nrp.frqday x.id_nrp]=get_var_state(x,sname,x.frqday);
sname='NRP';    [x.nrp.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='NRP';    [x.nrp.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='NRP';    [x.nrp.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='NRP';    [x.nrp.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='OVR';    [x.ovr.frqday x.id_ovr]=get_var_state(x,sname,x.frqday);
sname='OVR';    [x.ovr.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='OVR';    [x.ovr.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='OVR';    [x.ovr.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='OVR';    [x.ovr.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='SWR';    [x.swr.frqday x.id_swr]=get_var_state(x,sname,x.frqday);
sname='SWR';    [x.swr.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='SWR';    [x.swr.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='SWR';    [x.swr.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='SWR';    [x.swr.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='SSR';    [x.ssr.frqday x.id_ssr]=get_var_state(x,sname,x.frqday);
sname='SSR';    [x.ssr.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='SSR';    [x.ssr.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='SSR';    [x.ssr.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='SSR';    [x.ssr.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='SER';    [x.ser.frqday x.id_ser]=get_var_state(x,sname,x.frqday);
sname='SER';    [x.ser.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='SER';    [x.ser.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='SER';    [x.ser.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='SER';    [x.ser.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='Canada'; [x.can.frqday x.id_can]=get_var_state(x,sname,x.frqday);
sname='Canada'; [x.can.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='Canada'; [x.can.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='Canada'; [x.can.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='Canada'; [x.can.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

sname='Mexico'; [x.mex.frqday x.id_mex]=get_var_state(x,sname,x.frqday);
sname='Mexico'; [x.mex.prday_av]       =get_var_state(x,sname,x.prday_av);
sname='Mexico'; [x.mex.prday_idwei]    =get_var_state(x,sname,x.prday_idwei);
sname='Mexico'; [x.mex.prday_idavg]    =get_var_state(x,sname,x.prday_idavg);
sname='Mexico'; [x.mex.prday_idmax]    =get_var_state(x,sname,x.prday_idmax);

v=x; period=strcat('_',num2str(yr1),'_',num2str(yr2));
fnmat=strcat(tpath,expn,period,'_do_AR_precip_usa.mat'); disp(fnmat); %save(fnmat,'v'); 
save(fnmat,'v','-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
