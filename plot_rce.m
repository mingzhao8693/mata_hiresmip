tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; zs=1;
t1=1; t2=12; expn='RCE_H064x008_L79_R48_new'; v1=rceana_mon(tpath,expn,t1,t2,zs);
t1=1; t2=12; expn='RCE_H128x016_L79_R24_new'; v2=rceana_mon(tpath,expn,t1,t2,zs);
t1=1; t2=12; expn='RCE_H256x032_L79_R12_new'; v3=rceana_mon(tpath,expn,t1,t2,zs);
t1=1; t2=12; expn='RCE_H512x064_L79_R06_new'; v4=rceana_mon(tpath,expn,t1,t2,zs);

t1=1; t2=12; expn='RCE_H064x008_L79_R48_new_295'; v1=rceana_mon(tpath,expn,t1,t2,zs);
t1=1; t2=12; expn='RCE_H128x016_L79_R24_new_295'; v2=rceana_mon(tpath,expn,t1,t2,zs);
t1=1; t2=12; expn='RCE_H256x032_L79_R12_new_295'; v3=rceana_mon(tpath,expn,t1,t2,zs);
t1=1; t2=12; expn='RCE_H512x064_L79_R06_new_295'; v4=rceana_mon(tpath,expn,t1,t2,zs);

t1=1; t2=12; expn='RCE_H064x008_L79_R48_new_305'; v1=rceana_mon(tpath,expn,t1,t2,zs);
t1=1; t2=12; expn='RCE_H128x016_L79_R24_new_305'; v2=rceana_mon(tpath,expn,t1,t2,zs);
t1=1; t2=12; expn='RCE_H256x032_L79_R12_new_305'; v3=rceana_mon(tpath,expn,t1,t2,zs);
t1=1; t2=12; expn='RCE_H512x064_L79_R06_new_305'; v4=rceana_mon(tpath,expn,t1,t2,zs);



t1=1; t2=12; expn='RCE_H128x128_L79_R01';       v0=rceana_mon(tpath,expn,t1,t2,zs);

figure; plot(v0.atm.neteng.ts); hold on; 
plot(v1.atm.neteng.ts(1:12),'r'); plot(v2.atm.neteng.ts(1:12),'g');

figure; plot(v0.atm.tm.ts); hold on; 
plot(v1.atm.tm.ts(1:12),'r'); plot(v2.atm.tm.ts(1:12),'g');

figure; plot(v0.atm.cape_dyn.ts); hold on; 
plot(v1.atm.cape_dyn.ts(1:12),'r'); plot(v2.atm.cape_dyn.ts(1:12),'g');


y0=v0.toa.netrad.ts;
y1=v1.toa.netrad.ts;
y2=v2.toa.netrad.ts;
figure; plot(y0,'b'); hold on; plot(y1,'r'); plot(y2,'g');

y0=v0.toa.netrad_clr.ts;
y1=v1.toa.netrad_clr.ts;
y2=v2.toa.netrad_clr.ts;
figure; plot(y0,'b'); hold on; plot(y1,'r'); plot(y2,'g');

y0=v0.toa.lwnet.ts;
y1=v1.toa.lwnet.ts;
y2=v2.toa.lwnet.ts;
figure; plot(y0,'b'); hold on; plot(y1,'r'); plot(y2,'g');

y0=v0.toa.lwnet_clr.ts;
y1=v1.toa.lwnet_clr.ts;
y2=v2.toa.lwnet_clr.ts;
figure; plot(y0,'b'); hold on; plot(y1,'r'); plot(y2,'g');

y0=v0.toa.lwcf.ts;
y1=v1.toa.lwcf.ts;
y2=v2.toa.lwcf.ts;
figure; plot(y0,'b'); hold on; plot(y1,'r'); plot(y2,'g');


y0=v0.toa.swnet.ts;
y1=v1.toa.swnet.ts;
y2=v2.toa.swnet.ts;
figure; plot(y0,'b'); hold on; plot(y1,'r'); plot(y2,'g');

y0=v0.toa.swnet_clr.ts;
y1=v1.toa.swnet_clr.ts;
y2=v2.toa.swnet_clr.ts;
figure; plot(y0,'b'); hold on; plot(y1,'r'); plot(y2,'g');

y0=v0.toa.swcf.ts;
y1=v1.toa.swcf.ts;
y2=v2.toa.swcf.ts;
figure; plot(y0,'b'); hold on; plot(y1,'r'); plot(y2,'g');

y0=v0.toa.ttcf.ts;
y1=v1.toa.ttcf.ts;
y2=v2.toa.ttcf.ts;
figure; plot(y0,'b'); hold on; plot(y1,'r'); plot(y2,'g');

y0=mean(v0.atm.qa_tot.ts(5:12,:),1);
y1=mean(v1.atm.qa_tot.ts(5:12,:),1);
y2=mean(v2.atm.qa_tot.ts(5:12,:),1);
figure; pf=v0.pf;
plot(y0,pf,'b'); hold on; plot(y1,pf,'r'); plot(y2,pf,'g');
set(gca,'YDir','reverse');

y0=mean(v0.atm.ta.ts(5:12,:),1);
y1=mean(v1.atm.ta.ts(5:12,:),1);
y2=mean(v2.atm.ta.ts(5:12,:),1);
figure; pf=v0.pf;
plot(y0,pf,'b'); hold on; plot(y1,pf,'r'); plot(y2,pf,'g');
set(gca,'YDir','reverse');



tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; zs=1;
t1=1; t2=11; expn='RCE_H1024x128_L79_R03'; v=rceana_mon(tpath,expn,t1,t2,zs);
t1=1; t2=12; expn='RCE_H128x128_L79_R01';      v=rceana_mon(tpath,expn,t1,t2,zs);


t1=1; t2=7; expn='RCE_H064x008_L79_R48_new5'; v=rceana_mon(tpath,expn,t1,t2,zs);
t1=1; t2=24; expn='RCE_H064x008_L79_R48_new7'; v=rceana_mon(tpath,expn,t1,t2,zs);

t1=1; t2=12; expn='RCE_H128x128_L79_R01';      v=rceana_mon(tpath,expn,t1,t2,zs);

tpath='/work/miz/mat_rce/'; 
expn='RCE_H064x008_L79_R48_new4'; fn=strcat(tpath,expn,'_RCE_mon1_7.mat'); load(fn);v0=v;

expn='RCE_H064x008_L79_R48_new9'; fn=strcat(tpath,expn,'_RCE_mon1_24.mat'); load(fn);v1=v;
expn='RCE_H064x008_L79_R48_new7'; fn=strcat(tpath,expn,'_RCE_mon1_10.mat'); load(fn);v0=v;
expn='RCE_H064x008_L79_R48_new3'; fn=strcat(tpath,expn,'_RCE_mon1_12.mat'); load(fn);v1=v;
expn='RCE_H064x008_L79_R48_new4'; fn=strcat(tpath,expn,'_RCE_mon1_12.mat'); load(fn);v2=v;


y1=v.atm.d_eng1.ts;
y2=v.atm.d_eng2.ts;
y3=v.atm.neteng.ts;
y4=y1-v.atm.d_pen1.ts-v.atm.d_ken1.ts;
y5=y2-v.atm.d_pen2.ts-v.atm.d_ken2.ts;
y6=y5-y4;
[y1 y2 y3 y4 y5 y6 y6-y3]

[y1 y2 y3 y2-y3 v.atm.d_pen2.ts v.atm.d_ken2.ts]

figure; 
plot(v0.atm.d_ken1.ts,'r'); hold on; 
plot(v0.atm.d_pen1.ts,'b');
plot(v0.atm.d_eng1.ts,'k');
plot(v0.atm.dmass1.ts,'c');

figure; 
plot(v1.atm.d_ken1.ts,'r'); hold on; 
plot(v1.atm.d_pen1.ts,'b');
plot(v1.atm.d_eng1.ts,'k');

figure; 
plot(v0.atm.d_ken2.ts,'r'); hold on; 
plot(v0.atm.d_pen2.ts,'b');
plot(v0.atm.d_eng2.ts,'k');


figure; 
plot(v0.atm.ke.ts,'k'); hold on; 
plot(v0.atm.ken_s.ts./v0.sfc.ps.ts*9.8,'r');

figure; %plot(v0.atm.te.ts-v1.atm.te.ts)
plot(v0.atm.te.ts,'k'); hold on; plot(v1.atm.te.ts,'r');

figure; 
plot(v0.atm.te.ts./v0.sfc.ps.ts,'k'); hold on; 
plot(v0.atm.eng_s.ts./v0.sfc.ps.ts*9.8,'r');


figure; %plot(v0.atm.te.ts-v1.atm.te.ts)
plot(v0.atm.te.ts,'k'); hold on; plot(v1.atm.te.ts,'r');

figure; 
plot(v0.atm.d_eng1.ts,'k'); hold on; plot(v1.atm.d_eng1.ts,'r');


plot(v1.atm.d_eng2.ts,'r'); hold on; plot(v1.atm.neteng.ts,'r--');
plot(v2.atm.d_eng2.ts,'b'); hold on; plot(v2.atm.neteng.ts,'b--');

figure
plot(v0.atm.d_eng1.ts,'k'); hold on; plot(v0.atm.d_dse1.ts,'k--');
plot(v1.atm.d_eng1.ts,'r'); hold on; plot(v1.atm.d_dse1.ts,'r--');
plot(v2.atm.d_eng1.ts,'b'); hold on; plot(v2.atm.d_dse1.ts,'b--');

figure;
plot(v0.atm.d_eng1.ts);

plot(v1.atm.dse_s.ts,'b'); hold on; plot(v2.atm.dse_s.ts,'b--');

figure; plot(v.atm.d_ken1.ts); hold on; plot(v.atm.neteng.ts,'r');


%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; zs=1;
t1=60; t2=260; expn='RCE_H128x128_L79_R01';     v=rceana(tpath,expn,t1,t2,zs);
t1=30; t2=230; expn='RCE_H128x128_L79_R01_295'; v=rceana(tpath,expn,t1,t2,zs);
t1=30; t2=230; expn='RCE_H128x128_L79_R01_305'; v=rceana(tpath,expn,t1,t2,zs);

tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; t1=60; t2=260; zs=1;
expn='RCE_H064x008_L79_R48';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H128x016_L79_R24';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H256x032_L79_R12_305';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H512x064_L79_R06';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H512x064_L79_R06_295';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H512x064_L79_R06_305';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H1024x128_L79_R03';  v=rceana(tpath,expn,t1,t2,zs);




expn='RCE_H064x008_L79_R48_uwconv';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H064x008_L79_R48';          v1=rceana(tpath,expn,t1,t2,zs);

expn='RCE_H064x008_L79_R48';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H128x016_L79_R24';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H256x032_L79_R12';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H512x064_L79_R06';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H1024x128_L79_R03';  v=rceana(tpath,expn,t1,t2,zs);

expn='RCE_H064x008_L79_R48_uwconv';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H128x016_L79_R24_uwconv';   v=rceana(tpath,expn,t1,t2,zs);

%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; t1=60; t2=260; zs=1;
expn='RCE_H128x016_L79_R24_295';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H256x032_L79_R12_295';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H512x064_L79_R06_295';   v=rceana(tpath,expn,t1,t2,zs);
%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; t1=60; t2=260; zs=1;
expn='RCE_H128x016_L79_R24_305';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H256x032_L79_R12_305';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H512x064_L79_R06_305';   v=rceana(tpath,expn,t1,t2,zs);t2=260
%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; t1=60; t2=260; zs=1;
expn='RCE_H128x016_L79_R24';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H256x032_L79_R12';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H512x064_L79_R06';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H1024x128_L79_R03';  v=rceana(tpath,expn,t1,t2,zs);
%%%%%%%%%%%%%%%%%%%%%%%%%%

expn='RCE_H064x032_L79_R12';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H128x064_L79_R06';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H256x128_L79_R03';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H256x128_L91_R03';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H64x32_L91_R12';     v=rceana(tpath,expn,t1,t2,zs);
%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; t1=120; t2=360; zs=25;
expn='RCE_H64x32_L91_R24';      v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H128x64_L91_R12';     v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H256x128_L91_R06';    v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H512x256_L91_R03';    v=rceana(tpath,expn,t1,t2,zs);
%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; t1=120; t2=360; zs=25;
expn='RCE_H64x32_L91_R24_305';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H128x64_L91_R12_305';  v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H256x128_L91_R06_305'; v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H512x256_L91_R03_305'; v=rceana(tpath,expn,t1,t2,zs);
%%%%%%%%%%%%%%%%%%%%%%%%%%


tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; t1=30; t2=300;
expn='RCE_H32x16_L91_R24';      v=rceana(tpath,expn,t1,t2);
expn='RCE_H64x32_L91_R12';      v=rceana(tpath,expn,t1,t2);
expn='RCE_H128x64_L91_R06';     v=rceana(tpath,expn,t1,t2);
expn='RCE_H256x128_L91_R03';    v=rceana(tpath,expn,t1,t2);

tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; t1=30; t2=300;
expn='RCE_H32x16_L91_R24';      v=rceana(tpath,expn,t1,t2);
expn='RCE_H64x32_L91_R24';      v=rceana(tpath,expn,t1,t2);
expn='RCE_H128x64_L91_R24';     v=rceana(tpath,expn,t1,t2);
expn='RCE_H256x128_L91_R24';    v=rceana(tpath,expn,t1,t2);

expn='RCE_H32x16_L91_R24';      v1=rceana(tpath,expn,t1,t2);
expn='RCE_H64x32_L91_R24';      v2=rceana(tpath,expn,t1,t2);
expn='RCE_H128x64_L91_R24';     v3=rceana(tpath,expn,t1,t2);
expn='RCE_H256x128_L91_R24';    v4=rceana(tpath,expn,t1,t2);

expn='RCE_H256x128_L91_R24';  v1=rceana(tpath,expn,t1,t2);
expn='RCE_H256x128_L91_R12';  v2=rceana(tpath,expn,t1,t2);
expn='RCE_H256x128_L91_R06';  v3=rceana(tpath,expn,t1,t2);
expn='RCE_H256x128_L91_R03';  v4=rceana(tpath,expn,t1,t2);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_rce/'; 
expn='RCE_H256x128_L91_R03'; fn=strcat(tpath,expn,'_RCE.mat'); load(fn);v1=v;
expn='RCE_H128x64_L91_R06';  fn=strcat(tpath,expn,'_RCE.mat'); load(fn);v2=v;
expn='RCE_H64x32_L91_R12';   fn=strcat(tpath,expn,'_RCE.mat'); load(fn);v3=v;
expn='RCE_H32x16_L91_R24';   fn=strcat(tpath,expn,'_RCE.mat'); load(fn);v4=v;
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_rce/'; 
expn='RCE_H64x32_L91_R24';   fn=strcat(tpath,expn,'_RCE_120_360.mat'); load(fn);v4=v;
expn='RCE_H128x64_L91_R12';  fn=strcat(tpath,expn,'_RCE_120_360.mat'); load(fn);v3=v;
expn='RCE_H256x128_L91_R06'; fn=strcat(tpath,expn,'_RCE_120_360.mat'); load(fn);v2=v;
expn='RCE_H512x256_L91_R03'; fn=strcat(tpath,expn,'_RCE_120_360.mat'); load(fn);v1=v;
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_rce/'; 
expn='RCE_H64x32_L91_R24_305';   fn=strcat(tpath,expn,'_RCE_120_360.mat'); load(fn);w4=v;
expn='RCE_H128x64_L91_R12_305';  fn=strcat(tpath,expn,'_RCE_120_360.mat'); load(fn);w3=v;
expn='RCE_H256x128_L91_R06_305'; fn=strcat(tpath,expn,'_RCE_120_360.mat'); load(fn);w2=v;
expn='RCE_H512x256_L91_R03_305'; fn=strcat(tpath,expn,'_RCE_120_360.mat'); load(fn);w1=v;
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_rce/'; 
expn='RCE_H64x32_L91_R12';  fn=strcat(tpath,expn,'_RCE_30_120.mat'); load(fn);v4=v;
expn='RCE_H064x032_L79_R12'; fn=strcat(tpath,expn,'_RCE_30_120.mat'); load(fn);v3=v;
expn='RCE_H128x064_L79_R06'; fn=strcat(tpath,expn,'_RCE_30_120.mat'); load(fn);v2=v;
expn='RCE_H256x128_L79_R03'; fn=strcat(tpath,expn,'_RCE_30_120.mat'); load(fn);v1=v;
%expn='RCE_H256x128_L91_R03'; fn=strcat(tpath,expn,'_RCE_30_120.mat'); load(fn);v1=v;
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/archive/Ming.Zhao/ndrce/warsaw_201710/'; t1=30; t2=130; zs=1;
expn='RCE_H128x016_L79_R24';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H256x032_L79_R12';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H512x064_L79_R06';   v=rceana(tpath,expn,t1,t2,zs);
expn='RCE_H1024x128_L79_R03';  v=rceana(tpath,expn,t1,t2,zs);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_rce/'; 
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_rce/'; 
expn='RCE_H064x008_L79_R48';        fn=strcat(tpath,expn,'_RCE_60_260.mat'); load(fn);v5=v;
expn='RCE_H128x016_L79_R24';        fn=strcat(tpath,expn,'_RCE_60_260.mat'); load(fn);v4=v;
expn='RCE_H256x032_L79_R12';        fn=strcat(tpath,expn,'_RCE_60_260.mat'); load(fn);v3=v;
expn='RCE_H512x064_L79_R06';        fn=strcat(tpath,expn,'_RCE_60_260.mat'); load(fn);v2=v;v1=v;
%expn='RCE_H1024x128_L79_R03';       fn=strcat(tpath,expn,'_RCE_60_260.mat'); load(fn);v1=v;

expn='RCE_H064x008_L79_R48_305';    fn=strcat(tpath,expn,'_RCE_60_260.mat'); load(fn);w5=v;
expn='RCE_H128x016_L79_R24_305';    fn=strcat(tpath,expn,'_RCE_60_260.mat'); load(fn);w4=v;
expn='RCE_H256x032_L79_R12_305';    fn=strcat(tpath,expn,'_RCE_60_260.mat'); load(fn);w3=v;
expn='RCE_H512x064_L79_R06_305';    fn=strcat(tpath,expn,'_RCE_60_260.mat'); load(fn);w2=v;w1=v1;

expn='RCE_H064x008_L79_R48_295';    fn=strcat(tpath,expn,'_RCE_60_260.mat'); load(fn);c5=v;
expn='RCE_H128x016_L79_R24_295';    fn=strcat(tpath,expn,'_RCE_60_260.mat'); load(fn);c4=v;
expn='RCE_H256x032_L79_R12_295';    fn=strcat(tpath,expn,'_RCE_60_260.mat'); load(fn);c3=v;
expn='RCE_H512x064_L79_R06_295';    fn=strcat(tpath,expn,'_RCE_60_260.mat'); load(fn);c2=v;c1=v1;

expn='RCE_H128x016_L79_R24_uwconv'; fn=strcat(tpath,expn,'_RCE_60_260.mat'); load(fn);v4x=v;
expn='RCE_H064x008_L79_R48_uwconv'; fn=strcat(tpath,expn,'_RCE_60_260.mat'); load(fn);v5x=v;
[CPD,CPV,CL,RV,RD,LV0,G,ROWL,CPVMCL,EPS,EPSI,GINV,RDOCP,T0,HLF]=thermconst;
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%Sensitivity of convection
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qtflx'; pf=v1.pf; ph=v1.ph; xy=[-20 120 50 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24'; s5='R48';
m1='r'; m2='g'; m3='b'; m4='k'; m5='c'; 
l1='-'; l2='--'; l3='-.'; l4=':'; l5='-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1; 
a1=v1.qtflx_dyn.avg*LV0; plot(a1,ph,strcat(m1,l1),'LineWidth',lw); hold on;
b1=v1.qtflx_phy.avg*LV0; plot(-b1,ph,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.qtflx_dyn.avg*LV0; plot(a2,ph,strcat(m2,l1),'LineWidth',lw); hold on;
b2=v2.qtflx_phy.avg*LV0; plot(-b2,ph,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.qtflx_dyn.avg*LV0; plot(a3,ph,strcat(m3,l1),'LineWidth',lw); hold on;
b3=v3.qtflx_phy.avg*LV0; plot(-b3,ph,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.qtflx_dyn.avg*LV0; plot(a4,ph,strcat(m4,l1),'LineWidth',lw); hold on;
b4=v4.qtflx_phy.avg*LV0; plot(-b4,ph,strcat(m4,l2),'LineWidth',lw); hold on;
a5=v5.qtflx_dyn.avg*LV0; plot(a5,ph,strcat(m5,l1),'LineWidth',lw); hold on;
b5=v5.qtflx_phy.avg*LV0; plot(-b5,ph,strcat(m5,l2),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,s5,1); axis(xy);
xl='total water flux (W/m2)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/work/miz/mat_rce/'; 
expn='RCE_H128x128_L79_R01';     fn=strcat(tpath,expn,'_RCE_60_260.mat'); load(fn);v0=v;
expn='RCE_H128x128_L79_R01_295'; fn=strcat(tpath,expn,'_RCE_30_230.mat'); load(fn);c0=v;
expn='RCE_H128x128_L79_R01_305'; fn=strcat(tpath,expn,'_RCE_30_230.mat'); load(fn);w0=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%Cloud feedback
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa'; pf=v1.pf; xy=[0 0.5 50 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3='-.'; l4=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1; 
a1=v1.qa_tot.avg; plot(a1,pf,strcat(m1,l1),'LineWidth',lw); hold on;
b1=w1.qa_tot.avg; plot(b1,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.qa_tot.avg; plot(a2,pf,strcat(m2,l1),'LineWidth',lw); hold on;
b2=w2.qa_tot.avg; plot(b2,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.qa_tot.avg; plot(a3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
b3=w3.qa_tot.avg; plot(b3,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.qa_tot.avg; plot(a4,pf,strcat(m4,l1),'LineWidth',lw); hold on;
b4=w4.qa_tot.avg; plot(b4,pf,strcat(m4,l2),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy);
xl='Cloud fraction'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qa'; pf=v1.pf; xy=[0 0.5 180 310];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3='-.'; l4=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1; 
a1=v1.qa_tot.avg; ta=v1.ta.avg; plot(a1,ta,strcat(m1,l1),'LineWidth',lw); hold on;
b1=w1.qa_tot.avg; ta=w1.ta.avg; plot(b1,ta,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.qa_tot.avg; ta=v2.ta.avg; plot(a2,ta,strcat(m2,l1),'LineWidth',lw); hold on;
b2=w2.qa_tot.avg; ta=w2.ta.avg; plot(b2,ta,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.qa_tot.avg; ta=v3.ta.avg; plot(a3,ta,strcat(m3,l1),'LineWidth',lw); hold on;
b3=w3.qa_tot.avg; ta=w3.ta.avg; plot(b3,ta,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.qa_tot.avg; ta=v4.ta.avg; plot(a4,ta,strcat(m4,l1),'LineWidth',lw); hold on;
b4=w4.qa_tot.avg; ta=w4.ta.avg; plot(b4,ta,strcat(m4,l2),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy);
xl='Cloud fraction'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ql'; pf=v1.pf; xy=[0 100 50 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3='-.'; l4=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8; a=v4.rho.avg*1000000;
handle = figure('Position', pms,'visible','on'); n=1; 
a1=v1.ql.avg.*a; plot(a1,pf,strcat(m1,l1),'LineWidth',lw); hold on;
b1=w1.ql.avg.*a; plot(b1,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.ql.avg.*a; plot(a2,pf,strcat(m2,l1),'LineWidth',lw); hold on;
b2=w2.ql.avg.*a; plot(b2,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.ql.avg.*a; plot(a3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
b3=w3.ql.avg.*a; plot(b3,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.ql.avg.*a; plot(a4,pf,strcat(m4,l1),'LineWidth',lw); hold on;
b4=w4.ql.avg.*a; plot(b4,pf,strcat(m4,l2),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy);
xl='cloud liquid water (mg/m3)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fa'; pf=v1.pf; xy=[0 0.5 50 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3='-.'; l4=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8; a=v4.rho.avg*1000000;
handle = figure('Position', pms,'visible','on'); n=1; 
a1=v1.up.fa_avg(:,n); plot(a1,pf,strcat(m1,l1),'LineWidth',lw); hold on;
b1=w1.up.fa_avg(:,n); plot(b1,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.up.fa_avg(:,n); plot(a2,pf,strcat(m2,l1),'LineWidth',lw); hold on;
b2=w2.up.fa_avg(:,n); plot(b2,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.up.fa_avg(:,n); plot(a3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
b3=w3.up.fa_avg(:,n); plot(b3,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.up.fa_avg(:,n); plot(a4,pf,strcat(m4,l1),'LineWidth',lw); hold on;
b4=w4.up.fa_avg(:,n); plot(b4,pf,strcat(m4,l2),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy);
xl='fractional area'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='warm';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mf_up'; pf=v1.pf; xy=[0 0.03 50 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3='-.'; l4=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8; a=v4.rho.avg*1000000;
handle = figure('Position', pms,'visible','on'); n=1; 
a1=v1.up.mf_avg(:,n); plot(a1,pf,strcat(m1,l1),'LineWidth',lw); hold on;
b1=w1.up.mf_avg(:,n); plot(b1,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.up.mf_avg(:,n); plot(a2,pf,strcat(m2,l1),'LineWidth',lw); hold on;
b2=w2.up.mf_avg(:,n); plot(b2,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.up.mf_avg(:,n); plot(a3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
b3=w3.up.mf_avg(:,n); plot(b3,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.up.mf_avg(:,n); plot(a4,pf,strcat(m4,l1),'LineWidth',lw); hold on;
b4=w4.up.mf_avg(:,n); plot(b4,pf,strcat(m4,l2),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy);
xl='vertical mass flux'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='warm';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mf_dn'; pf=v1.pf; xy=[-0.03 0 50 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3='-.'; l4=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8; a=v4.rho.avg*1000000;
handle = figure('Position', pms,'visible','on'); n=1; 
a1=v1.dn.mf_avg(:,n); plot(a1,pf,strcat(m1,l1),'LineWidth',lw); hold on;
b1=w1.dn.mf_avg(:,n); plot(b1,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.dn.mf_avg(:,n); plot(a2,pf,strcat(m2,l1),'LineWidth',lw); hold on;
b2=w2.dn.mf_avg(:,n); plot(b2,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.dn.mf_avg(:,n); plot(a3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
b3=w3.dn.mf_avg(:,n); plot(b3,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.dn.mf_avg(:,n); plot(a4,pf,strcat(m4,l1),'LineWidth',lw); hold on;
b4=w4.dn.mf_avg(:,n); plot(b4,pf,strcat(m4,l2),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy);
xl='vertical mass flux'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='warm';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mf_cv'; pf=v1.pf; xy=[0 0.005 50 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3='-.'; l4=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8; a=v4.rho.avg*1000000;
handle = figure('Position', pms,'visible','on'); n=1; 
a1=v1.up.mf_avg(:,n)+v1.dn.mf_avg(:,n); plot(a1,pf,strcat(m1,l1),'LineWidth',lw); hold on;
b1=w1.up.mf_avg(:,n)+w1.dn.mf_avg(:,n); plot(b1,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.up.mf_avg(:,n)+v2.dn.mf_avg(:,n); plot(a2,pf,strcat(m2,l1),'LineWidth',lw); hold on;
b2=w2.up.mf_avg(:,n)+w2.dn.mf_avg(:,n); plot(b2,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.up.mf_avg(:,n)+v3.dn.mf_avg(:,n); plot(a3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
b3=w3.up.mf_avg(:,n)+w3.dn.mf_avg(:,n); plot(b3,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.up.mf_avg(:,n)+v4.dn.mf_avg(:,n); plot(a4,pf,strcat(m4,l1),'LineWidth',lw); hold on;
b4=w4.up.mf_avg(:,n)+w4.dn.mf_avg(:,n); plot(b4,pf,strcat(m4,l2),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy);
xl='vertical mass flux'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='warm';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ta'; pf=v1.pf; xy=[-5 5 50 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3='-.'; l4=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1; a0=v1.ta.avg;a0(1:18)=NaN;
a1=v1.up.ta_avg(:,n); plot(a1-a0,pf,strcat(m1,l1),'LineWidth',lw); hold on;
a2=v2.up.ta_avg(:,n); plot(a2-a0,pf,strcat(m2,l1),'LineWidth',lw); hold on;
a3=v3.up.ta_avg(:,n); plot(a3-a0,pf,strcat(m3,l1),'LineWidth',lw); hold on;
a4=v4.up.ta_avg(:,n); plot(a4-a0,pf,strcat(m4,l1),'LineWidth',lw); hold on;
a1=v1.up.ta_avg(:,4); plot(a1-a0,pf,strcat(m1,l4),'LineWidth',lw); hold on;
a2=v2.up.ta_avg(:,4); plot(a2-a0,pf,strcat(m2,l4),'LineWidth',lw); hold on;
a3=v3.up.ta_avg(:,4); plot(a3-a0,pf,strcat(m3,l4),'LineWidth',lw); hold on;
a4=v4.up.ta_avg(:,4); plot(a4-a0,pf,strcat(m4,l4),'LineWidth',lw); hold on;
a1=v1.dn.ta_avg(:,n); plot(a1-a0,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.dn.ta_avg(:,n); plot(a2-a0,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.dn.ta_avg(:,n); plot(a3-a0,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.dn.ta_avg(:,n); plot(a4-a0,pf,strcat(m4,l2),'LineWidth',lw); hold on;
a1=v1.en.ta_avg(:,n); plot(a1-a0,pf,strcat(m1,l3),'LineWidth',lw); hold on;
a2=v2.en.ta_avg(:,n); plot(a2-a0,pf,strcat(m2,l3),'LineWidth',lw); hold on;
a3=v3.en.ta_avg(:,n); plot(a3-a0,pf,strcat(m3,l3),'LineWidth',lw); hold on;
a4=v4.en.ta_avg(:,n); plot(a4-a0,pf,strcat(m4,l3),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy);
xl='specific humidity (kg/kg)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qv'; pf=v1.pf; xy=[0 0.016 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3='-.'; l4=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1;
a1=v1.up.qv_avg(:,n); plot(a1,pf,strcat(m1,l1),'LineWidth',lw); hold on;
a2=v2.up.qv_avg(:,n); plot(a2,pf,strcat(m2,l1),'LineWidth',lw); hold on;
a3=v3.up.qv_avg(:,n); plot(a3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
a4=v4.up.qv_avg(:,n); plot(a4,pf,strcat(m4,l1),'LineWidth',lw); hold on;
a1=v1.up.qv_avg(:,4); plot(a1,pf,strcat(m1,l4),'LineWidth',lw); hold on;
a2=v2.up.qv_avg(:,4); plot(a2,pf,strcat(m2,l4),'LineWidth',lw); hold on;
a3=v3.up.qv_avg(:,4); plot(a3,pf,strcat(m3,l4),'LineWidth',lw); hold on;
a4=v4.up.qv_avg(:,4); plot(a4,pf,strcat(m4,l4),'LineWidth',lw); hold on;
a1=v1.dn.qv_avg(:,n); plot(a1,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.dn.qv_avg(:,n); plot(a2,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.dn.qv_avg(:,n); plot(a3,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.dn.qv_avg(:,n); plot(a4,pf,strcat(m4,l2),'LineWidth',lw); hold on;
a1=v1.en.qv_avg(:,n); plot(a1,pf,strcat(m1,l3),'LineWidth',lw); hold on;
a2=v2.en.qv_avg(:,n); plot(a2,pf,strcat(m2,l3),'LineWidth',lw); hold on;
a3=v3.en.qv_avg(:,n); plot(a3,pf,strcat(m3,l3),'LineWidth',lw); hold on;
a4=v4.en.qv_avg(:,n); plot(a4,pf,strcat(m4,l3),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy);
xl='specific humidity (kg/kg)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ql'; pf=v1.pf; xy=[0 0.001 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3='-.'; l4=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1;
a1=v1.up.ql_avg(:,n); plot(a1,pf,strcat(m1,l1),'LineWidth',lw); hold on;
a2=v2.up.ql_avg(:,n); plot(a2,pf,strcat(m2,l1),'LineWidth',lw); hold on;
a3=v3.up.ql_avg(:,n); plot(a3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
a4=v4.up.ql_avg(:,n); plot(a4,pf,strcat(m4,l1),'LineWidth',lw); hold on;
a1=v1.up.ql_avg(:,4); plot(a1,pf,strcat(m1,l4),'LineWidth',lw); hold on;
a2=v2.up.ql_avg(:,4); plot(a2,pf,strcat(m2,l4),'LineWidth',lw); hold on;
a3=v3.up.ql_avg(:,4); plot(a3,pf,strcat(m3,l4),'LineWidth',lw); hold on;
a4=v4.up.ql_avg(:,4); plot(a4,pf,strcat(m4,l4),'LineWidth',lw); hold on;
a1=v1.dn.ql_avg(:,n); plot(a1,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.dn.ql_avg(:,n); plot(a2,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.dn.ql_avg(:,n); plot(a3,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.dn.ql_avg(:,n); plot(a4,pf,strcat(m4,l2),'LineWidth',lw); hold on;
a1=v1.en.ql_avg(:,n); plot(a1,pf,strcat(m1,l3),'LineWidth',lw); hold on;
a2=v2.en.ql_avg(:,n); plot(a2,pf,strcat(m2,l3),'LineWidth',lw); hold on;
a3=v3.en.ql_avg(:,n); plot(a3,pf,strcat(m3,l3),'LineWidth',lw); hold on;
a4=v4.en.ql_avg(:,n); plot(a4,pf,strcat(m4,l3),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy);
xl='liquid water content (kg/kg)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qi'; pf=v1.pf; xy=[0 0.0005 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3='-.'; l4=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1;
a1=v1.up.qi_avg(:,n); plot(a1,pf,strcat(m1,l1),'LineWidth',lw); hold on;
a2=v2.up.qi_avg(:,n); plot(a2,pf,strcat(m2,l1),'LineWidth',lw); hold on;
a3=v3.up.qi_avg(:,n); plot(a3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
a4=v4.up.qi_avg(:,n); plot(a4,pf,strcat(m4,l1),'LineWidth',lw); hold on;
a1=v1.up.qi_avg(:,4); plot(a1,pf,strcat(m1,l4),'LineWidth',lw); hold on;
a2=v2.up.qi_avg(:,4); plot(a2,pf,strcat(m2,l4),'LineWidth',lw); hold on;
a3=v3.up.qi_avg(:,4); plot(a3,pf,strcat(m3,l4),'LineWidth',lw); hold on;
a4=v4.up.qi_avg(:,4); plot(a4,pf,strcat(m4,l4),'LineWidth',lw); hold on;
a1=v1.dn.qi_avg(:,n); plot(a1,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.dn.qi_avg(:,n); plot(a2,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.dn.qi_avg(:,n); plot(a3,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.dn.qi_avg(:,n); plot(a4,pf,strcat(m4,l2),'LineWidth',lw); hold on;
a1=v1.en.qi_avg(:,n); plot(a1,pf,strcat(m1,l3),'LineWidth',lw); hold on;
a2=v2.en.qi_avg(:,n); plot(a2,pf,strcat(m2,l3),'LineWidth',lw); hold on;
a3=v3.en.qi_avg(:,n); plot(a3,pf,strcat(m3,l3),'LineWidth',lw); hold on;
a4=v4.en.qi_avg(:,n); plot(a4,pf,strcat(m4,l3),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy);
xl='ice water content (kg/kg)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh'; pf=v1.pf; xy=[0 120 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3='-.'; l4=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1;
a1=v1.up.rh_avg(:,n); plot(a1,pf,strcat(m1,l1),'LineWidth',lw); hold on;
a2=v2.up.rh_avg(:,n); plot(a2,pf,strcat(m2,l1),'LineWidth',lw); hold on;
a3=v3.up.rh_avg(:,n); plot(a3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
a4=v4.up.rh_avg(:,n); plot(a4,pf,strcat(m4,l1),'LineWidth',lw); hold on;
a1=v1.up.rh_avg(:,4); plot(a1,pf,strcat(m1,l4),'LineWidth',lw); hold on;
a2=v2.up.rh_avg(:,4); plot(a2,pf,strcat(m2,l4),'LineWidth',lw); hold on;
a3=v3.up.rh_avg(:,4); plot(a3,pf,strcat(m3,l4),'LineWidth',lw); hold on;
a4=v4.up.rh_avg(:,4); plot(a4,pf,strcat(m4,l4),'LineWidth',lw); hold on;
a1=v1.dn.rh_avg(:,n); plot(a1,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.dn.rh_avg(:,n); plot(a2,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.dn.rh_avg(:,n); plot(a3,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.dn.rh_avg(:,n); plot(a4,pf,strcat(m4,l2),'LineWidth',lw); hold on;
a1=v1.en.rh_avg(:,n); plot(a1,pf,strcat(m1,l3),'LineWidth',lw); hold on;
a2=v2.en.rh_avg(:,n); plot(a2,pf,strcat(m2,l3),'LineWidth',lw); hold on;
a3=v3.en.rh_avg(:,n); plot(a3,pf,strcat(m3,l3),'LineWidth',lw); hold on;
a4=v4.en.rh_avg(:,n); plot(a4,pf,strcat(m4,l3),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy);
xl='ice water content (kg/kg)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='fa'; pf=v1.pf; xy=[0 1 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3='-.'; l4=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1;
a1=v1.up.fa_avg(:,n); plot(a1,pf,strcat(m1,l1),'LineWidth',lw); hold on;
a2=v2.up.fa_avg(:,n); plot(a2,pf,strcat(m2,l1),'LineWidth',lw); hold on;
a3=v3.up.fa_avg(:,n); plot(a3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
a4=v4.up.fa_avg(:,n); plot(a4,pf,strcat(m4,l1),'LineWidth',lw); hold on;
a1=v1.up.fa_avg(:,4); plot(a1,pf,strcat(m1,l4),'LineWidth',lw); hold on;
a2=v2.up.fa_avg(:,4); plot(a2,pf,strcat(m2,l4),'LineWidth',lw); hold on;
a3=v3.up.fa_avg(:,4); plot(a3,pf,strcat(m3,l4),'LineWidth',lw); hold on;
a4=v4.up.fa_avg(:,4); plot(a4,pf,strcat(m4,l4),'LineWidth',lw); hold on;
a1=v1.dn.fa_avg(:,n); plot(a1,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.dn.fa_avg(:,n); plot(a2,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.dn.fa_avg(:,n); plot(a3,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.dn.fa_avg(:,n); plot(a4,pf,strcat(m4,l2),'LineWidth',lw); hold on;
a1=v1.en.fa_avg(:,n); plot(a1,pf,strcat(m1,l3),'LineWidth',lw); hold on;
a2=v2.en.fa_avg(:,n); plot(a2,pf,strcat(m2,l3),'LineWidth',lw); hold on;
a3=v3.en.fa_avg(:,n); plot(a3,pf,strcat(m3,l3),'LineWidth',lw); hold on;
a4=v4.en.fa_avg(:,n); plot(a4,pf,strcat(m4,l3),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,0); axis(xy);
xl='fractional area of cloud updraft downdraft and environment'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wa'; pf=v1.pf; xy=[-0.5 2 50 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3='-.'; l4=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1;
a1=v1.up.wa_avg(:,n); plot(a1,pf,strcat(m1,l1),'LineWidth',lw); hold on;
a2=v2.up.wa_avg(:,n); plot(a2,pf,strcat(m2,l1),'LineWidth',lw); hold on;
a3=v3.up.wa_avg(:,n); plot(a3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
a4=v4.up.wa_avg(:,n); plot(a4,pf,strcat(m4,l1),'LineWidth',lw); hold on;
a1=v1.up.wa_avg(:,4); plot(a1,pf,strcat(m1,l4),'LineWidth',lw); hold on;
a2=v2.up.wa_avg(:,4); plot(a2,pf,strcat(m2,l4),'LineWidth',lw); hold on;
a3=v3.up.wa_avg(:,4); plot(a3,pf,strcat(m3,l4),'LineWidth',lw); hold on;
a4=v4.up.wa_avg(:,4); plot(a4,pf,strcat(m4,l4),'LineWidth',lw); hold on;
a1=v1.dn.wa_avg(:,n); plot(a1,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.dn.wa_avg(:,n); plot(a2,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.dn.wa_avg(:,n); plot(a3,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.dn.wa_avg(:,n); plot(a4,pf,strcat(m4,l2),'LineWidth',lw); hold on;
a1=v1.en.wa_avg(:,n); plot(a1,pf,strcat(m1,l3),'LineWidth',lw); hold on;
a2=v2.en.wa_avg(:,n); plot(a2,pf,strcat(m2,l3),'LineWidth',lw); hold on;
a3=v3.en.wa_avg(:,n); plot(a3,pf,strcat(m3,l3),'LineWidth',lw); hold on;
a4=v4.en.wa_avg(:,n); plot(a4,pf,strcat(m4,l3),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy);
xl='vertical velocity'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mf'; pf=v1.pf; xy=[-0.03 0.03 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3='-.'; l4=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1;
a1=v1.up.mf_avg(:,n); plot(a1,pf,strcat(m1,l1),'LineWidth',lw); hold on;
a2=v2.up.mf_avg(:,n); plot(a2,pf,strcat(m2,l1),'LineWidth',lw); hold on;
a3=vx.up.mf_avg(:,n); plot(a3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
a4=v4.up.mf_avg(:,n); plot(a4,pf,strcat(m4,l1),'LineWidth',lw); hold on;
a1=v1.up.mf_avg(:,4); plot(a1,pf,strcat(m1,l4),'LineWidth',lw); hold on;
a2=v2.up.mf_avg(:,4); plot(a2,pf,strcat(m2,l4),'LineWidth',lw); hold on;
a3=vx.up.mf_avg(:,4); plot(a3,pf,strcat(m3,l4),'LineWidth',lw); hold on;
a4=v4.up.mf_avg(:,4); plot(a4,pf,strcat(m4,l4),'LineWidth',lw); hold on;
a1=v1.dn.mf_avg(:,n); plot(a1,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.dn.mf_avg(:,n); plot(a2,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=vx.dn.mf_avg(:,n); plot(a3,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.dn.mf_avg(:,n); plot(a4,pf,strcat(m4,l2),'LineWidth',lw); hold on;
a1=v1.en.mf_avg(:,n); plot(a1,pf,strcat(m1,l3),'LineWidth',lw); hold on;
a2=v2.en.mf_avg(:,n); plot(a2,pf,strcat(m2,l3),'LineWidth',lw); hold on;
a3=vx.en.mf_avg(:,n); plot(a3,pf,strcat(m3,l3),'LineWidth',lw); hold on;
a4=v4.en.mf_avg(:,n); plot(a4,pf,strcat(m4,l3),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy); grid on;
xl='vertical mass flux'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mf'; pf=v1.pf; xy=[-0.03 0.03 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3='-.'; l4=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on'); n=1;
a1=v1.up.mf_avg(:,n); plot(a1,pf,strcat(m1,l1),'LineWidth',lw); hold on;
a2=v2.up.mf_avg(:,n); plot(a2,pf,strcat(m2,l1),'LineWidth',lw); hold on;
a3=v3.up.mf_avg(:,n); plot(a3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
a4=v4.up.mf_avg(:,n); plot(a4,pf,strcat(m4,l1),'LineWidth',lw); hold on;
a1=v1.up.mf_avg(:,4); plot(a1,pf,strcat(m1,l4),'LineWidth',lw); hold on;
a2=v2.up.mf_avg(:,4); plot(a2,pf,strcat(m2,l4),'LineWidth',lw); hold on;
a3=v3.up.mf_avg(:,4); plot(a3,pf,strcat(m3,l4),'LineWidth',lw); hold on;
a4=v4.up.mf_avg(:,4); plot(a4,pf,strcat(m4,l4),'LineWidth',lw); hold on;
a1=v1.dn.mf_avg(:,n); plot(a1,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.dn.mf_avg(:,n); plot(a2,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.dn.mf_avg(:,n); plot(a3,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.dn.mf_avg(:,n); plot(a4,pf,strcat(m4,l2),'LineWidth',lw); hold on;
a1=v1.en.mf_avg(:,n); plot(a1,pf,strcat(m1,l3),'LineWidth',lw); hold on;
a2=v2.en.mf_avg(:,n); plot(a2,pf,strcat(m2,l3),'LineWidth',lw); hold on;
a3=v3.en.mf_avg(:,n); plot(a3,pf,strcat(m3,l3),'LineWidth',lw); hold on;
a4=v4.en.mf_avg(:,n); plot(a4,pf,strcat(m4,l3),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy); grid on;
xl='vertical mass flux'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wqt_net'; pf=v1.pf; xy=[0 0.0001 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on'); n=1; 
a2=v2.up.wqt_avg(:,n)+v2.dn.wqt_avg(:,n)+v2.en.wqt_avg(:,n);
plot(a2,pf,strcat(m2,l1),'LineWidth',lw); hold on; %plot(v2.wqt.avg,pf,'rs'); 
a3=v3.up.wqt_avg(:,n)+v3.dn.wqt_avg(:,n)+v3.en.wqt_avg(:,n);
plot(a3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
a4=v4.up.wqt_avg(:,n)+v4.dn.wqt_avg(:,n)+v4.en.wqt_avg(:,n);
plot(a4,pf,strcat(m4,l1),'LineWidth',lw); hold on; 
a5=v4x.up.wqt_avg(:,n)+v4x.dn.wqt_avg(:,n)+v4x.en.wqt_avg(:,n)+v4x.qtflx_uwc.avg;
plot(a5,pf,strcat(m4,l2),'LineWidth',lw); hold on; 
legend(s1,s2,s3,s4,1); axis(xy);
xl='net vertical flux of total water (kg/m2/s)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wqt'; pf=v1.pf; xy=[-0.01 0.02 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on'); n=1; 
a1=v1.up.wqt_avg(:,n);b1=v1.up.fa_avg(:,n); plot(a1,pf,strcat(m1,l1),'LineWidth',lw); hold on;
a2=v2.up.wqt_avg(:,n);b2=v2.up.fa_avg(:,n); plot(a2,pf,strcat(m2,l1),'LineWidth',lw); hold on;
a3=v3.up.wqt_avg(:,n);b3=v3.up.fa_avg(:,n); plot(a3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
a4=v4.up.wqt_avg(:,n);b4=v4.up.fa_avg(:,n); plot(a4,pf,strcat(m4,l1),'LineWidth',lw); hold on;
a1=v1.dn.wqt_avg(:,n);b1=v1.dn.fa_avg(:,n); plot(a1,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.dn.wqt_avg(:,n);b2=v2.dn.fa_avg(:,n); plot(a2,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.dn.wqt_avg(:,n);b3=v3.dn.fa_avg(:,n); plot(a3,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.dn.wqt_avg(:,n);b4=v4.dn.fa_avg(:,n); plot(a4,pf,strcat(m4,l2),'LineWidth',lw); hold on;
a1=v1.en.wqt_avg(:,n);b1=v1.en.fa_avg(:,n); plot(a1,pf,strcat(m1,l3),'LineWidth',lw); hold on;
a2=v2.en.wqt_avg(:,n);b2=v2.en.fa_avg(:,n); plot(a2,pf,strcat(m2,l3),'LineWidth',lw); hold on;
a3=v3.en.wqt_avg(:,n);b3=v3.en.fa_avg(:,n); plot(a3,pf,strcat(m3,l3),'LineWidth',lw); hold on;
a4=v4.en.wqt_avg(:,n);b4=v4.en.fa_avg(:,n); plot(a4,pf,strcat(m4,l3),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy);
xl='vertical flux of total water'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wqt'; pf=v1.pf; xy=[-0.01 0.02 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r'; m2='g'; m3='b'; m4='k'; l1='-'; l2='--'; l3=':';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on'); n=1; 
a1=v1.up.wqt_avg(:,n);b1=v1.up.fa_avg(:,n); plot(a1./b1,pf,strcat(m1,l1),'LineWidth',lw); hold on;
a2=v2.up.wqt_avg(:,n);b2=v2.up.fa_avg(:,n); plot(a2./b2,pf,strcat(m2,l1),'LineWidth',lw); hold on;
a3=v3.up.wqt_avg(:,n);b3=v3.up.fa_avg(:,n); plot(a3./b3,pf,strcat(m3,l1),'LineWidth',lw); hold on;
a4=v4.up.wqt_avg(:,n);b4=v4.up.fa_avg(:,n); plot(a4./b4,pf,strcat(m4,l1),'LineWidth',lw); hold on;
a1=v1.dn.wqt_avg(:,n);b1=v1.dn.fa_avg(:,n); plot(a1./b1,pf,strcat(m1,l2),'LineWidth',lw); hold on;
a2=v2.dn.wqt_avg(:,n);b2=v2.dn.fa_avg(:,n); plot(a2./b2,pf,strcat(m2,l2),'LineWidth',lw); hold on;
a3=v3.dn.wqt_avg(:,n);b3=v3.dn.fa_avg(:,n); plot(a3./b3,pf,strcat(m3,l2),'LineWidth',lw); hold on;
a4=v4.dn.wqt_avg(:,n);b4=v4.dn.fa_avg(:,n); plot(a4./b4,pf,strcat(m4,l2),'LineWidth',lw); hold on;
a1=v1.en.wqt_avg(:,n);b1=v1.en.fa_avg(:,n); plot(a1./b1,pf,strcat(m1,l3),'LineWidth',lw); hold on;
a2=v2.en.wqt_avg(:,n);b2=v2.en.fa_avg(:,n); plot(a2./b2,pf,strcat(m2,l3),'LineWidth',lw); hold on;
a3=v3.en.wqt_avg(:,n);b3=v3.en.fa_avg(:,n); plot(a3./b3,pf,strcat(m3,l3),'LineWidth',lw); hold on;
a4=v4.en.wqt_avg(:,n);b4=v4.en.fa_avg(:,n); plot(a4./b4,pf,strcat(m4,l3),'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy);
xl='vertical flux of total water'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='wmse'; pf=v1.pf; xy=[0 0.006 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
a1=v1.up.wmse_avg; plot(a1,pf,m1,'LineWidth',lw); hold on;
a2=v2.up.wmse_avg; plot(a2,pf,m2,'LineWidth',lw); hold on;
a3=v3.up.wmse_avg; plot(a3,pf,m3,'LineWidth',lw); hold on;
a4=v4.up.wmse_avg; plot(a4,pf,m4,'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,0); axis(xy);
xl='fractional coverage of updraft'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh'; pf=v1.pf; xy=[0 120 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
a1=v1.up.rh_avg; plot(a1,pf,m1,'LineWidth',lw); hold on;
a2=v2.up.rh_avg; plot(a2,pf,m2,'LineWidth',lw); hold on;
a3=v3.up.rh_avg; plot(a3,pf,m3,'LineWidth',lw); hold on;
a4=v4.up.rh_avg; plot(a4,pf,m4,'LineWidth',lw); hold on;
a1=v1.dn.rh_avg; plot(a1,pf,m1,'LineWidth',lw); hold on;
a2=v2.dn.rh_avg; plot(a2,pf,m2,'LineWidth',lw); hold on;
a3=v3.dn.rh_avg; plot(a3,pf,m3,'LineWidth',lw); hold on;
a4=v4.dn.rh_avg; plot(a4,pf,m4,'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,0); axis(xy);
xl='RH (%)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mse'; pf=v1.pf; xy=[3.15e5 3.4e5 100 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
a1=v1.up.mse_avg; plot(a1,pf,m1,'LineWidth',lw); hold on;
a2=v2.up.mse_avg; plot(a2,pf,m2,'LineWidth',lw); hold on;
a3=v3.up.mse_avg; plot(a3,pf,m3,'LineWidth',lw); hold on;
a4=v4.up.mse_avg; plot(a4,pf,m4,'LineWidth',lw); hold on;
a1=v1.dn.mse_avg; plot(a1,pf,m1,'LineWidth',lw); hold on;
a2=v2.dn.mse_avg; plot(a2,pf,m2,'LineWidth',lw); hold on;
a3=v3.dn.mse_avg; plot(a3,pf,m3,'LineWidth',lw); hold on;
a4=v4.dn.mse_avg; plot(a4,pf,m4,'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,0); axis(xy);
xl='RH (%)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='mse'; pf=v1.pf; xy=[3.15e5 3.4e5 100 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
a1=v1.up.mse_avg; plot(a1,pf,m1,'LineWidth',lw); hold on;
a2=v2.up.mse_avg; plot(a2,pf,m2,'LineWidth',lw); hold on;
a3=v3.up.mse_avg; plot(a3,pf,m3,'LineWidth',lw); hold on;
a4=v4.up.mse_avg; plot(a4,pf,m4,'LineWidth',lw); hold on;
a1=v1.dn.mse_avg; plot(a1,pf,m1,'LineWidth',lw); hold on;
a2=v2.dn.mse_avg; plot(a2,pf,m2,'LineWidth',lw); hold on;
a3=v3.dn.mse_avg; plot(a3,pf,m3,'LineWidth',lw); hold on;
a4=v4.dn.mse_avg; plot(a4,pf,m4,'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,0); axis(xy);
xl='RH (%)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; expn='rce';
printit(visfig,figpath,expn,vname);




%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='netrad_ts'; xy=[120 360 0 18];
s1='R03km'; s2='R06km'; s3='R12km'; s4='R24km';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
a=v1.netradtoa; plot(v1.t,a,m1,'LineWidth',lw); hold on;
a=v2.pcp.ts*b; plot(v2.t,a,m2,'LineWidth',lw); hold on;
a=v3.pcp.ts*b; plot(v3.t,a,m3,'LineWidth',lw); hold on;
a=v4.pcp.ts*b; plot(v4.t,a,m4,'LineWidth',lw); hold on;
xl='time (day)';           xlabel(xl,'FontSize',fsize);
yl='precipitation (W/m2)'; ylabel(yl,'FontSize',fsize);
legend(s1,s2,s3,s4,0); axis(xy);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/';
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pcp_ts'; xy=[120 360 0 10];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
b=86400/LV0; 
wsize=1;  f1 =ones(1,wsize)/wsize;
wsize=4;  f4 =ones(1,wsize)/wsize;
wsize=8;  f8 =ones(1,wsize)/wsize;
wsize=16; f16=ones(1,wsize)/wsize;
a1=v1.sfc.pcp.ts*b; a=filter(f1, 1,a1); plot(v1.t,a1,m1,'LineWidth',lw); hold on;
a2=v2.sfc.pcp.ts*b; a=filter(f4, 1,a2); plot(v2.t,a2,m2,'LineWidth',lw); hold on;
a3=v3.sfc.pcp.ts*b; a=filter(f8, 1,a3); plot(v3.t,a3,m3,'LineWidth',lw); hold on;
a4=v4.sfc.pcp.ts*b; a=filter(f16,1,a4); plot(v4.t,a4,m4,'LineWidth',lw); hold on;
s1=sprintf('%s (avg=%5.2f; std=%5.2f)',s1,mean(a1),std(a1));
s2=sprintf('%s (avg=%5.2f; std=%5.2f)',s2,mean(a2),std(a2));
s3=sprintf('%s (avg=%5.2f; std=%5.2f)',s3,mean(a3),std(a3));
s4=sprintf('%s (avg=%5.2f; std=%5.2f)',s4,mean(a4),std(a4));
xl='time (day)';             xlabel(xl,'FontSize',fsize);
yl='precipitation (mm/day)'; ylabel(yl,'FontSize',fsize);
legend(s1,s2,s3,s4,0); axis(xy);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='evp_ts'; xy=[120 360 0 10];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
b=86400/LV0; %b=1;
a1=v1.sfc.evp.ts*b; plot(v1.t,a1,m1,'LineWidth',lw); hold on;
a2=v2.sfc.evp.ts*b; plot(v2.t,a2,m2,'LineWidth',lw); hold on;
a3=v3.sfc.evp.ts*b; plot(v3.t,a3,m3,'LineWidth',lw); hold on;
a4=v4.sfc.evp.ts*b; plot(v4.t,a4,m4,'LineWidth',lw); hold on;
s1=sprintf('%s (avg=%5.2f; std=%5.2f)',s1,mean(a1),std(a1));
s2=sprintf('%s (avg=%5.2f; std=%5.2f)',s2,mean(a2),std(a2));
s3=sprintf('%s (avg=%5.2f; std=%5.2f)',s3,mean(a3),std(a3));
s4=sprintf('%s (avg=%5.2f; std=%5.2f)',s4,mean(a4),std(a4));

a1=w1.evp.ts*b; plot(v1.t,a1,m1,'LineWidth',lw); hold on;
a2=w2.evp.ts*b; plot(v2.t,a2,m2,'LineWidth',lw); hold on;
a3=w3.evp.ts*b; plot(v3.t,a3,m3,'LineWidth',lw); hold on;
a4=w4.evp.ts*b; plot(v4.t,a4,m4,'LineWidth',lw); hold on;
s1=sprintf('%s (avg=%5.2f; std=%5.2f)',s1,mean(a1),std(a1));
s2=sprintf('%s (avg=%5.2f; std=%5.2f)',s2,mean(a2),std(a2));
s3=sprintf('%s (avg=%5.2f; std=%5.2f)',s3,mean(a3),std(a3));
s4=sprintf('%s (avg=%5.2f; std=%5.2f)',s4,mean(a4),std(a4));

xl='time (day)';                 xlabel(xl,'FontSize',fsize);
yl='surface evaporation (W/m2)'; ylabel(yl,'FontSize',fsize);
legend(s1,s2,s3,s4,0); axis(xy);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='tm_ts'; xy=[120 360 245 255];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
a1=v1.tm.ts; plot(v1.t,a1,m1,'LineWidth',lw); hold on;
a2=v2.tm.ts; plot(v2.t,a2,m2,'LineWidth',lw); hold on;
a3=v3.tm.ts; plot(v3.t,a3,m3,'LineWidth',lw); hold on;
a4=v4.tm.ts; plot(v4.t,a4,m4,'LineWidth',lw); hold on;
s1=sprintf('%s (avg=%5.2f; std=%5.2f)',s1,mean(a1),std(a1));
s2=sprintf('%s (avg=%5.2f; std=%5.2f)',s2,mean(a2),std(a2));
s3=sprintf('%s (avg=%5.2f; std=%5.2f)',s3,mean(a3),std(a3));
s4=sprintf('%s (avg=%5.2f; std=%5.2f)',s4,mean(a4),std(a4));
xl='time (day)';                 xlabel(xl,'FontSize',fsize);
yl='300-500 hPa mean temperature (K)'; ylabel(yl,'FontSize',fsize);
legend(s1,s2,s3,s4,0); axis(xy);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='cape_ts'; xy=[120 360 0 1200];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
a=v1.cape_dyn.ts; plot(v1.t,a,m1,'LineWidth',lw); hold on;
a=v2.cape_dyn.ts; plot(v2.t,a,m2,'LineWidth',lw); hold on;
a=v3.cape_dyn.ts; plot(v3.t,a,m3,'LineWidth',lw); hold on;
a=v4.cape_dyn.ts; plot(v4.t,a,m4,'LineWidth',lw); hold on;
xl='time (day)';                 xlabel(xl,'FontSize',fsize);
yl='CAPE (J/kg)'; ylabel(yl,'FontSize',fsize);
legend(s1,s2,s3,s4,2); axis(xy);
set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ta_2d'; pf=v1.pf; xy=[-2 4 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r-'; m2='g-'; m3='b-'; m4='k-'; row=2; col=2;
xl='time (day)';  yl='pressure (hPa)'; vbin=[-2:0.5:2];
pms=[ 0, 0, 1300, 800]*1; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); a1=v1.ta.ts'; a0=a1; for t=1:v.nt; a0(:,t)=v1.ta.avg; end;
contourf(v.t,v.pf,a1-a0,vbin); shading flat; colorbar;
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse'); title(s1);
subplot(row,col,2); a2=v2.ta.ts'; for t=1:v.nt; a0(:,t)=v2.ta.avg; end;
contourf(v.t,v.pf,a2-a0,vbin); shading flat; colorbar;
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse'); title(s2);
subplot(row,col,3); a3=v3.ta.ts'; for t=1:v.nt; a0(:,t)=v3.ta.avg; end;
contourf(v.t,v.pf,a3-a0,vbin); shading flat; colorbar;
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse'); title(s3);
subplot(row,col,4); a4=v4.ta.ts'; for t=1:v.nt; a0(:,t)=v4.ta.avg; end;
contourf(v.t,v.pf,a4-a0,vbin); shading flat; colorbar;
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse'); title(s4);
visfig='off'; figpath='./fig_rce/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='rh_2d'; pf=v1.pf; xy=[-2 4 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r-'; m2='g-'; m3='b-'; m4='k-'; row=2; col=2;
xl='time (day)';  yl='pressure (hPa)'; vbin=[-10:1:10];
pms=[ 0, 0, 1300, 800]*1; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); a1=v1.rh.ts'; a0=a1; for t=1:v.nt; a0(:,t)=v1.rh.avg; end;
contourf(v.t,v.pf,a1-a0,vbin); shading flat; colorbar;
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse'); title(s1);
subplot(row,col,2); a2=v2.rh.ts'; for t=1:v.nt; a0(:,t)=v2.rh.avg; end;
contourf(v.t,v.pf,a2-a0,vbin); shading flat; colorbar;
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse'); title(s2);
subplot(row,col,3); a3=v3.rh.ts'; for t=1:v.nt; a0(:,t)=v3.rh.avg; end;
contourf(v.t,v.pf,a3-a0,vbin); shading flat; colorbar;
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse'); title(s3);
subplot(row,col,4); a4=v4.rh.ts'; for t=1:v.nt; a0(:,t)=v4.rh.avg; end;
contourf(v.t,v.pf,a4-a0,vbin); shading flat; colorbar;
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse'); title(s4);
visfig='off'; figpath='./fig_rce/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ql_2d'; pf=v1.pf; xy=[-2 4 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r-'; m2='g-'; m3='b-'; m4='k-'; row=2; col=2;
xl='time (day)';  yl='pressure (hPa)'; vbin=[-0.00001:0.000001:0.00001];
pms=[ 0, 0, 1300, 800]*1; fsize=16; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); a1=v1.ql.ts'; a0=a1; for t=1:v.nt; a0(:,t)=v1.ql.avg; end;
contourf(v.t,v.pf,a1-a0,vbin); shading flat; colorbar;
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse'); title(s1);
subplot(row,col,2); a2=v2.ql.ts'; for t=1:v.nt; a0(:,t)=v2.ql.avg; end;
contourf(v.t,v.pf,a2-a0,vbin); shading flat; colorbar;
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse'); title(s2);
subplot(row,col,3); a3=v3.ql.ts'; for t=1:v.nt; a0(:,t)=v3.ql.avg; end;
contourf(v.t,v.pf,a3-a0,vbin); shading flat; colorbar;
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse'); title(s3);
subplot(row,col,4); a4=v4.ql.ts'; for t=1:v.nt; a0(:,t)=v4.ql.avg; end;
contourf(v.t,v.pf,a4-a0,vbin); shading flat; colorbar;
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse'); title(s4);
visfig='off'; figpath='./fig_rce/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ta'; pf=v1.pf; xy=[-2 4 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
a1=v1.ta.avg; plot(a1-a1,pf,m1,'LineWidth',lw); hold on;
a2=v2.ta.avg; plot(a2-a1,pf,m2,'LineWidth',lw); hold on; a1=0;
a3=v3.ta.avg; plot(a3-a1,pf,m3,'LineWidth',lw); hold on;
a4=v4.ta.avg; plot(a4-a1,v4.pf,m4,'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,0); axis(xy);
xl='\Delta T (K)';   xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='RH'; pf=v1.pf; xy=[0 100 10 1000];
s1='R03'; s2='R06'; s3='R12'; s4='R24';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
a=v1.rh.avg; plot(a,pf,m1,'LineWidth',lw); hold on;
a=v2.rh.avg; plot(a,pf,m2,'LineWidth',lw); hold on;
a=v3.rh.avg; plot(a,pf,m3,'LineWidth',lw); hold on;
a=v4.rh.avg; plot(a,pf,m4,'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,0); axis(xy);
xl='RH (%)';         xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qv'; pf=v1.pf; xy=[-0.003 0.003 10 1000];
s1='R03km'; s2='R06km'; s3='R12km'; s4='R24km';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
a1=v1.qv.avg; plot(a1-a1,pf,m1,'LineWidth',lw); hold on;
a2=v2.qv.avg; plot(a2-a1,pf,m2,'LineWidth',lw); hold on;
a3=v3.qv.avg; plot(a3-a1,pf,m3,'LineWidth',lw); hold on;
a4=v4.qv.avg; plot(a4-a1,pf,m4,'LineWidth',lw); hold on;
legend(s1,s2,s3,s4,1); axis(xy);
xl='specific humidity (kg/kg)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qlqi'; pf=v1.pf; xy=[0 0.1 10 1000];
s1='R03km'; s2='R06km'; s3='R12km'; s4='R24km';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
a=v1.ql.avg*1000; plot(a,pf,m1,'LineWidth',lw); hold on;
a=v2.ql.avg*1000; plot(a,pf,m2,'LineWidth',lw); hold on;
a=v3.ql.avg*1000; plot(a,pf,m3,'LineWidth',lw); hold on;
a=v4.ql.avg*1000; plot(a,pf,m4,'LineWidth',lw); hold on;
a=v1.qi.avg*1000; plot(a,pf,'r--','LineWidth',lw); hold on;
a=v2.qi.avg*1000; plot(a,pf,'g--','LineWidth',lw); hold on;
a=v3.qi.avg*1000; plot(a,pf,'b--','LineWidth',lw); hold on;
a=v4.qi.avg*1000; plot(a,pf,'k--','LineWidth',lw); hold on;
legend(s1,s2,s3,s4,0); axis(xy);
xl='Cloud liquid or ice water content (g/kg)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='qrqsqg'; pf=v1.pf; xy=[0 0.012 10 1000];
s1='R03km'; s2='R06km'; s3='R12km'; s4='R24km';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
a=v1.qr.avg*1000; plot(a,pf,m1,'LineWidth',lw); hold on;
a=v2.qr.avg*1000; plot(a,pf,m2,'LineWidth',lw); hold on;
a=v3.qr.avg*1000; plot(a,pf,m3,'LineWidth',lw); hold on;
a=v4.qr.avg*1000; plot(a,pf,m4,'LineWidth',lw); hold on;
a=v1.qs.avg*1000; plot(a,pf,'r--','LineWidth',lw); hold on;
a=v2.qs.avg*1000; plot(a,pf,'g--','LineWidth',lw); hold on;
a=v3.qs.avg*1000; plot(a,pf,'b--','LineWidth',lw); hold on;
a=v4.qs.avg*1000; plot(a,pf,'k--','LineWidth',lw); hold on;
a=v1.qg.avg*1000; plot(a,pf,'r:','LineWidth',lw); hold on;
a=v2.qg.avg*1000; plot(a,pf,'g:','LineWidth',lw); hold on;
a=v3.qg.avg*1000; plot(a,pf,'b:','LineWidth',lw); hold on;
a=v4.qg.avg*1000; plot(a,pf,'k:','LineWidth',lw); hold on;
xl='rain, snow, and graupel (g/kg)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
legend(s1,s2,s3,s4,0); axis(xy);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='ua'; pf=v1.pf; xy=[-10 10 5 1000];
s1='R03km'; s2='R06km'; s3='R12km'; s4='R24km';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
a=v1.ua.avg; plot(a,pf,m1,'LineWidth',lw); hold on;
a=v2.ua.avg; plot(a,pf,m2,'LineWidth',lw); hold on;
a=v3.ua.avg; plot(a,pf,m3,'LineWidth',lw); hold on;
a=v4.ua.avg; plot(a,pf,m4,'LineWidth',lw); hold on;
xl='U (m/s)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
legend(s1,s2,s3,s4,0); axis(xy);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='va'; pf=v1.pf; xy=[-10 10 5 1000];
s1='R03km'; s2='R06km'; s3='R12km'; s4='R24km';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
a=v1.va.avg; plot(a,pf,m1,'LineWidth',lw); hold on;
a=v2.va.avg; plot(a,pf,m2,'LineWidth',lw); hold on;
a=v3.va.avg; plot(a,pf,m3,'LineWidth',lw); hold on;
a=v4.va.avg; plot(a,pf,m4,'LineWidth',lw); hold on;
xl='V (m/s)'; xlabel(xl,'FontSize',fsize);
yl='pressure (hPa)'; ylabel(yl,'FontSize',fsize);
legend(s1,s2,s3,s4,0); axis(xy);
set(gca,'FontSize',fsize); set(gca,'YDir','reverse');
visfig='off'; figpath='./fig_rce/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pdf_w500'; wbin=v1.w500.bin; bins=wbin(2)-wbin(1); xy=[-3 15 0 15];
s1='R03km'; s2='R06km'; s3='R12km'; s4='R24km';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
a=v1.w500.pdf; a=a./sum(a)/bins; semilogy(wbin,a,'r','LineWidth',lw); hold on;
a=v2.w500.pdf; a=a./sum(a)/bins; semilogy(wbin,a,'g','LineWidth',lw); hold on;
a=v3.w500.pdf; a=a./sum(a)/bins; semilogy(wbin,a,'b','LineWidth',lw); hold on;
a=v4.w500.pdf; a=a./sum(a)/bins; semilogy(wbin,a,'k','LineWidth',lw); hold on;
xl='w500 (m/s)'; xlabel(xl,'FontSize',fsize);
yl='PDF';        ylabel(yl,'FontSize',fsize);
legend(s1,s2,s3,s4,0); axis(xy); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pdf_pcp'; bin=v1.pcp.bin; bins=wbin(2)-wbin(1); xy=[-2 10 0 15];
s1='R03km'; s2='R06km'; s3='R12km'; s4='R24km';
m1='r-'; m2='g-'; m3='b-'; m4='k-';
pms=[ 0, 0, 1100, 800]*1; fsize=24; lw=2; msize=8;
handle = figure('Position', pms,'visible','on');
a=v1.pcp.pdf; a=a./sum(a)/bins; semilogy(bin,a,'r','LineWidth',lw); hold on;
a=v2.pcp.pdf; a=a./sum(a)/bins; semilogy(bin,a,'g','LineWidth',lw); hold on;
a=v3.pcp.pdf; a=a./sum(a)/bins; semilogy(bin,a,'b','LineWidth',lw); hold on;
a=v4.pcp.pdf; a=a./sum(a)/bins; semilogy(bin,a,'k','LineWidth',lw); hold on;
xl='precipitation (kg/m2/s)'; xlabel(xl,'FontSize',fsize);
yl='PDF';                     ylabel(yl,'FontSize',fsize);
legend(s1,s2,s3,s4,0); axis(xy); set(gca,'FontSize',fsize); 
visfig='off'; figpath='./fig_rce/'; 
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%



pms=[ 0, 0, 1100, 800]*1; fsize=10; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on'); 
plot(pcp_ts,'r'); hold on; plot(evp_ts,'b');


pms=[ 0, 0, 1100, 800]*1; fsize=10; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on'); 
plot(lwp_ts,'r'); hold on; plot(iwp_ts,'b');
