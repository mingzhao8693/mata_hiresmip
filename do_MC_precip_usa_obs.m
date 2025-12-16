function v1=do_MC_precip_usa_obs(opt,yr1,yr2)
tpath='/work/miz/mat_hiresmip/'; 
expn='ERAI_6h_DATA'; s0='_readartcmcs_day_usa.mat'; 
opt='TC'; yr1=1979; yr2=2020; nyr=yr2-yr1+1;  %year=197901-202012
opt='MC'; yr1=1985; yr2=2008; nyr=yr2-yr1+1;  %year=198501-200812

ext=strcat(opt,'_diag0');
for t=1:nyr
  year(t)=yr1+t-1; a=num2str(year(t)); yrs=strcat('_',a,'_',a,'_');
  fext=strcat(yrs,ext,s0); fn=strcat(tpath,expn,fext); fn
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

epath='/work/miz/mat_pcp/obs/'; v=x;
fnmat=strcat(epath,'obs_TC_precip.mat'); disp(fnmat); %save(fnmat,'v'); 
save(fnmat,'v','-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('/work/miz/mat_pcp/obs/obs_TC_precip.mat');
lon=s.lon; lat=s.lat; lm=s.lm0; mon=[1:12]; n=10000;
s1='prday-av'; s2='prday-idwei'; s3='prday-idavg'; loc='northwest';
x1=0.5; x2=12.5; y1=0; y2=5; xy=[x1 x2 y1 y2];

pms=[ 0, 0, 1800, 1500]*1.5; row=3; col=3; fs=12;
handle=figure('Position',pms,'visible','on');
subplot(row,col,1); m1=8; m2=19; tit='NorthWest';
a=x.nwr.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.nwr.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.nwr.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location','north','FontSize',fs); title(tit,'FontSize',fs);
%y1=0; y2=3.5; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,2); m1=8; m2=19; tit='Upper Midwest';
a=x.umw.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.umw.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.umw.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
%y1=0.5; y2=4; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,3); m1=8; m2=19; tit='Northeast';
a=x.ner.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.ner.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.ner.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
%y1=2.2; y2=3.8; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,4); m1=8; m2=19; tit='West';
a=x.wwr.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.wwr.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.wwr.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location','north','FontSize',fs); title(tit,'FontSize',fs);
%y1=0; y2=2.5; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,5); m1=8; m2=19; tit='Northern Rockies and Plains';
a=x.nrp.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.nrp.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.nrp.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
%y1=0; y2=3; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,6); m1=8; m2=19; tit='Ohio Valley';
a=x.ovr.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.ovr.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.ovr.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'r'); a3=a; b3=b; 
errorbar(mon,a1,b1,b1,'b'); errorbar(mon,a2,b2,b2,'g'); errorbar(mon,a3,b3,b3,'r');  
legend(s1,s2,s3,'Location',loc,'FontSize',fs); title(tit,'FontSize',fs);
%y1=2; y2=4.5; xy=[x1 x2 y1 y2]; axis(xy); set(gca,'FontSize',fs);

subplot(row,col,7); m1=8; m2=19; tit='SouthWest';
a=x.swr.prday_av   (:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'b'); a1=a; b1=b; hold on;
a=x.swr.prday_idwei(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
a=mean(a,1); plot(mon,a,'g'); a2=a; b2=b; 
a=x.swr.prday_idavg(:,m1:m2); b=bootstrp(n,@(x)[mean(x)],a); b=std(b,1);
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
