tpath='/home/Ming.Zhao/AM2p12b/ulm/input_ulm/mata_ulm/CMIP5/amip/';
tpath='/home/Ming.Zhao/AM2p12b/ulm/input_ulm/mata_ulm/PMP-cmip5-amip-clims/';
fext='_2.5x2.5_esmf_linear_metrics.json'; N=30;
vn='pr';     fname=strcat(vn,fext); v.pr       =readjson_new(tpath,fname,N)
vn='rlut';   fname=strcat(vn,fext); v.olr      =readjson_new(tpath,fname,N)
vn='rst';    fname=strcat(vn,fext); v.swabs    =readjson_new(tpath,fname,N)
vn='rltcre'; fname=strcat(vn,fext); v.lwcf     =readjson_new(tpath,fname,N)
vn='rstcre'; fname=strcat(vn,fext); v.swcf     =readjson_new(tpath,fname,N)
vn='zg-500'; fname=strcat(vn,fext); v.z500=readjson_new(tpath,fname,N)
vn='tas';    fname=strcat(vn,fext); v.tas =readjson_new(tpath,fname,N)
vn='ta-200'; fname=strcat(vn,fext); v.t200=readjson_new(tpath,fname,N)
vn='ta-850'; fname=strcat(vn,fext); v.t850=readjson_new(tpath,fname,N)
vn='ua-200'; fname=strcat(vn,fext); v.u200=readjson_new(tpath,fname,N)
vn='ua-850'; fname=strcat(vn,fext); v.u850=readjson_new(tpath,fname,N)
vn='va-200'; fname=strcat(vn,fext); v.v200=readjson_new(tpath,fname,N)
vn='va-850'; fname=strcat(vn,fext); v.v850=readjson_new(tpath,fname,N)
% $$$ vn='prw';    fname=strcat(vn,fext); v.prw      =readjson_new(tpath,fname,N)
% $$$ vn='hus-850';fname=strcat(vn,fext); v.q850     =readjson_new(tpath,fname,N)
% $$$ vn='psl';    fname=strcat(vn,fext); v.psl =readjson_new(tpath,fname,N)
% $$$ vn='rlutcs'; fname=strcat(vn,fext); v.olr_clr  =readjson_new(tpath,fname,N)
% $$$ vn='rsut';   fname=strcat(vn,fext); v.swabs    =readjson_new(tpath,fname,N)
% $$$ vn='rsutcs'; fname=strcat(vn,fext); v.swabs_clr=readjson_new(tpath,fname,N)
% $$$ vn='uas';    fname=strcat(vn,fext); v.uas =readjson_new(tpath,fname,N)
% $$$ vn='vas';    fname=strcat(vn,fext); v.vas =readjson_new(tpath,fname,N)
fn=strcat('./cmip5_amip_json.mat');fn
save(fn,'v'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn=strcat('./cmip5_amip_json.mat');load(fn); vm=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%get model results%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tpath='/nbhome/miz/awg/warsaw/';
epath='/atmos_1980_2014/pcmdi_metrics_v1p1p1/metrics/';
expn='AM4.0'; v1=get_pcmdi(tpath,epath,expn,1)
expn='AM2.1'; v2=get_pcmdi(tpath,epath,expn,1)
expn='AM3';   v3=get_pcmdi(tpath,epath,expn,1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='olr'; varx=vm.olr; expn='AM4.0';
var1=v1.olr; var2=v2.olr; var3=v3.olr;
var4=[4.274 6.53 7.212 5.939 5.647];
pms=[ 0, 0, 1300, 900]*0.8; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=0.08; y0=0.55; wx=0.38; wy=0.38; dx=0.1; dy=0.05;
p1= [x0,          y0,         wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,         wx, wy];%position of first subplot
p3= [x0,          y0-(wy+dy), wx, wy];%position of first subplot
p4= [x0+wx+dx,    y0-(wy+dy), wx, wy];%position of first subplot
k=5; x=[1:k]; xmin=0.5; xmax=5.5; yl='RMSE (W/m^2)';
alist={'ANN','DJF','JJA','MAM','SON'}; noth={'','','','',''};
subplot('Position',p1); ymin=4; ymax=15;
boxplot(varx.glob(1:k,:)','whisker',5); hold on;
plot(x, var1.glob(1:k),'rp','MarkerSize',msize); hold on;
plot(x, var2.glob(1:k),'gs','MarkerSize',msize);
plot(x, var3.glob(1:k),'bd','MarkerSize',msize);
%plot(x, var4,          'k*','MarkerSize',msize);
legend('AM4.0','AM2.1','AM3',1);
mylabel([xmin xmax ymin ymax],2,'(a) global',fsize);
set(gca,'xtick',x); set(gca,'xticklabel',noth); 
set(gca,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
subplot('Position',p2); ymin=4; ymax=18.5;
boxplot(varx.trop(1:k,:)','whisker',5); hold on;
plot(x, var1.trop(1:k),'rp','MarkerSize',msize); hold on;
plot(x, var2.trop(1:k),'gs','MarkerSize',msize);
plot(x, var3.trop(1:k),'bd','MarkerSize',msize);
mylabel([xmin xmax ymin ymax],2,'(b) tropics',fsize);
set(gca,'xtick',x); set(gca,'xticklabel',noth);
set(gca,'FontSize',fsize); %ylabel(yl,'FontSize',fsize); 
subplot('Position',p3); ymin=2; ymax=13;
boxplot(varx.nhex(1:k,:)','whisker',5); hold on;
plot(x, var1.nhex(1:k),'rp','MarkerSize',msize); hold on;
plot(x, var2.nhex(1:k),'gs','MarkerSize',msize);
plot(x, var3.nhex(1:k),'bd','MarkerSize',msize);
mylabel([xmin xmax ymin ymax],2,'(c) NH extratropics',fsize);
set(gca,'xtick',x); set(gca,'xticklabel',alist);
set(gca,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
subplot('Position',p4); ymin=2; ymax=13;
boxplot(varx.shex(1:k,:)','whisker',5); hold on;
plot(x, var1.shex(1:k),'rp','MarkerSize',msize); hold on;
plot(x, var2.shex(1:k),'gs','MarkerSize',msize);
plot(x, var3.shex(1:k),'bd','MarkerSize',msize);
mylabel([xmin xmax ymin ymax],2,'(d) SH extratropics',fsize);
set(gca,'xtick',x); set(gca,'xticklabel',alist);
set(gca,'FontSize',fsize); %ylabel(yl,'FontSize',fsize); 
visfig='off'; figpath='./fig_am4/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='swabs'; varx=vm.swabs;  expn='AM4.0';
var1=v1.swabs; var2=v2.swabs; var3=v3.swabs;
var4=[7.627 10.597 12.172 9.219 9.795];
pms=[ 0, 0, 1300, 900]*0.8; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=0.08; y0=0.55; wx=0.38; wy=0.38; dx=0.1; dy=0.05;
p1= [x0,          y0,         wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,         wx, wy];%position of first subplot
p3= [x0,          y0-(wy+dy), wx, wy];%position of first subplot
p4= [x0+wx+dx,    y0-(wy+dy), wx, wy];%position of first subplot
k=5; x=[1:k]; xmin=0.5; xmax=5.5; yl='RMSE (W/m^2)';
alist={'ANN','DJF','JJA','MAM','SON'}; noth={'','','','',''};
subplot('Position',p1); ymin=5; ymax=25;
boxplot(varx.glob(1:k,:)','whisker',5); hold on;
plot(x, var1.glob(1:k),'rp','MarkerSize',msize); hold on;
plot(x, var2.glob(1:k),'gs','MarkerSize',msize);
plot(x, var3.glob(1:k),'bd','MarkerSize',msize);
%plot(x, var4,          'k*','MarkerSize',msize);
legend('AM4.0','AM2.1','AM3',1);
mylabel([xmin xmax ymin ymax],2,'(a) global',fsize);
set(gca,'xtick',x); set(gca,'xticklabel',noth); 
set(gca,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
subplot('Position',p2); ymin=8; ymax=30;
boxplot(varx.trop(1:k,:)','whisker',5); hold on;
plot(x, var1.trop(1:k),'rp','MarkerSize',msize); hold on;
plot(x, var2.trop(1:k),'gs','MarkerSize',msize);
plot(x, var3.trop(1:k),'bd','MarkerSize',msize);
mylabel([xmin xmax ymin ymax],2,'(b) tropics',fsize);
set(gca,'xtick',x); set(gca,'xticklabel',noth);
set(gca,'FontSize',fsize); %ylabel(yl,'FontSize',fsize); 
subplot('Position',p3); ymin=4; ymax=30;
boxplot(varx.nhex(1:k,:)','whisker',5); hold on;
plot(x, var1.nhex(1:k),'rp','MarkerSize',msize); hold on;
plot(x, var2.nhex(1:k),'gs','MarkerSize',msize);
plot(x, var3.nhex(1:k),'bd','MarkerSize',msize);
mylabel([xmin xmax ymin ymax],2,'(c) NH extratropics',fsize);
set(gca,'xtick',x); set(gca,'xticklabel',alist);
set(gca,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
subplot('Position',p4); ymin=2; ymax=30;
boxplot(varx.shex(1:k,:)','whisker',5); hold on;
plot(x, var1.shex(1:k),'rp','MarkerSize',msize); hold on;
plot(x, var2.shex(1:k),'gs','MarkerSize',msize);
plot(x, var3.shex(1:k),'bd','MarkerSize',msize);
mylabel([xmin xmax ymin ymax],2,'(d) SH extratropics',fsize);
set(gca,'xtick',x); set(gca,'xticklabel',alist);
set(gca,'FontSize',fsize); %ylabel(yl,'FontSize',fsize); 
visfig='off'; figpath='./fig_am4/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vname='pr'; a=86400/100000;%correct pcmdi error on precip
varx=vm.pr; expn='AM4.0'
var1=v1.pr; var2=v2.pr; var3=v3.pr;
var4=[0.845 1.066 1.277 0.897 1.101];
pms=[ 0, 0, 1300, 900]*0.8; fsize=12; lw=2; msize=8; 
handle = figure('Position', pms,'visible','on');
x0=0.08; y0=0.55; wx=0.38; wy=0.38; dx=0.1; dy=0.05;
p1= [x0,          y0,         wx, wy];%position of first subplot
p2= [x0+wx+dx,    y0,         wx, wy];%position of first subplot
p3= [x0,          y0-(wy+dy), wx, wy];%position of first subplot
p4= [x0+wx+dx,    y0-(wy+dy), wx, wy];%position of first subplot
k=5; x=[1:k]; xmin=0.5; xmax=5.5; yl='RMSE (mm/day)';
alist={'ANN','DJF','JJA','MAM','SON'}; noth={'','','','',''};
subplot('Position',p1); ymin=0.75; ymax=3;
boxplot((varx.glob(1:k,:)*a)','whisker',5); hold on;
plot(x, var1.glob(1:k)*a,'rp','MarkerSize',msize); hold on;
plot(x, var2.glob(1:k)*a,'gs','MarkerSize',msize);
plot(x, var3.glob(1:k)*a,'bd','MarkerSize',msize);
%plot(x, var4,            'k*','MarkerSize',msize); hold on;
legend('AM4.0','AM2.1','AM3',1);
mylabel([xmin xmax ymin ymax],2,'(a) global',fsize);
set(gca,'xtick',x); set(gca,'xticklabel',noth); 
set(gca,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
subplot('Position',p2); ymin=0.8; ymax=3.5;
boxplot((varx.trop(1:k,:)*a)','whisker',5); hold on;
plot(x, var1.trop(1:k)*a,'rp','MarkerSize',msize);
plot(x, var2.trop(1:k)*a,'gs','MarkerSize',msize);
plot(x, var3.trop(1:k)*a,'bd','MarkerSize',msize);
mylabel([xmin xmax ymin ymax],2,'(b) tropics',fsize);
set(gca,'xtick',x); set(gca,'xticklabel',noth);
set(gca,'FontSize',fsize); %ylabel(yl,'FontSize',fsize); 
subplot('Position',p3); ymin=0.2; ymax=2;
boxplot((varx.nhex(1:k,:)*a)','whisker',5); hold on;
plot(x, var1.nhex(1:k)*a,'rp','MarkerSize',msize);
plot(x, var2.nhex(1:k)*a,'gs','MarkerSize',msize);
plot(x, var3.nhex(1:k)*a,'bd','MarkerSize',msize);
mylabel([xmin xmax ymin ymax],2,'(c) NH extra-tropcs',fsize);
set(gca,'xtick',x); set(gca,'xticklabel',alist);
set(gca,'FontSize',fsize); ylabel(yl,'FontSize',fsize); 
subplot('Position',p4); ymin=0.2; ymax=2;
boxplot((varx.shex(1:k,:)*a)','whisker',5); hold on;
plot(x, var1.shex(1:k)*a,'rp','MarkerSize',msize);
plot(x, var2.shex(1:k)*a,'gs','MarkerSize',msize);
plot(x, var3.shex(1:k)*a,'bd','MarkerSize',msize);
mylabel([xmin xmax ymin ymax],2,'(d) SH extra-tropics',fsize);
set(gca,'xtick',x); set(gca,'xticklabel',alist);
set(gca,'FontSize',fsize); %ylabel(yl,'FontSize',fsize); 
visfig='off'; figpath='./fig_am4/';
printit(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





pms=[ 0, 0, 400, 1000]; fsize=12; lw=2; msize=12; 
handle = figure('Position', pms,'visible','on');
row=5; col=1; msize=10; prx=vm.pr; k=5; x=[1:k];
subplot(row,col,1); 

boxplot(prx.glob(1:k,:)','whisker',5); hold on;
plot(x, pr1.glob(1:k),'rp','MarkerSize',msize);
subplot(row,col,2); 
boxplot(prx.glob(1:k,:)','whisker',5); hold on;
plot(x, pr1.glob(1:k),'rp','MarkerSize',msize);
subplot(row,col,3); 
boxplot(prx.glob(1:k,:)','whisker',5); hold on;
plot(x, pr1.glob(1:k),'rp','MarkerSize',msize);
subplot(row,col,4); 
boxplot(prx.glob(1:k,:)','whisker',5); hold on;
plot(x, pr1.glob(1:k),'rp','MarkerSize',msize);
subplot(row,col,5); 
boxplot(prx.glob(1:k,:)','whisker',5); hold on;
plot(x, pr1.glob(1:k),'rp','MarkerSize',msize);



plot([1:5],pr1.glob(k),'rp','MarkerSize',msize);
plot(1,pr1.glob(k),'rp','MarkerSize',msize);
plot(1,pr1.glob(k),'rp','MarkerSize',msize);

plot(2,pr1.trop(k),'rp','MarkerSize',msize);
plot(3,pr1.nhex(k),'rp','MarkerSize',msize);
plot(4,pr1.shex(k),'rp','MarkerSize',msize);
axis([0 5 -0.5 3.25]);


tpath='/nbhome/miz/awg/verona/AM4.0/atmos_1981_2014/pcmdi_metrics/metrics/AM4.0/';
fext='_2.5x2.5_esmf_linear_metrics.json'; N=1;
vn='pr'; fname=strcat(vn,fext); v1.pr=readjson_new(tpath,fname,N)
