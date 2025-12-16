function v=get_pcmdi(tpath,epath,expn,N)
%tpath='/nbhome/miz/awg/warsaw/';
%epath='/atmos_1980_2014/pcmdi_metrics_v1p1p1/metrics/';
%expn='AM4.0'; N=1;
tpath=strcat(tpath,expn,epath)
fext='_2.5x2.5_esmf_linear_metrics.json'; 

vn='pr';     fname=strcat(vn,fext); v.pr   =readjson_new(tpath,fname,N)
vn='rlut';   fname=strcat(vn,fext); v.olr  =readjson_new(tpath,fname,N)
vn='rsut';   fname=strcat(vn,fext); v.swabs=readjson_new(tpath,fname,N)
vn='zg-500'; fname=strcat(vn,fext); v.z500=readjson_new(tpath,fname,N)
vn='psl';    fname=strcat(vn,fext); v.psl =readjson_new(tpath,fname,N)
vn='tas';    fname=strcat(vn,fext); v.tas =readjson_new(tpath,fname,N)
vn='ta-200'; fname=strcat(vn,fext); v.t200=readjson_new(tpath,fname,N)
vn='ta-850'; fname=strcat(vn,fext); v.t850=readjson_new(tpath,fname,N)
vn='ua-200'; fname=strcat(vn,fext); v.u200=readjson_new(tpath,fname,N)
vn='ua-850'; fname=strcat(vn,fext); v.u850=readjson_new(tpath,fname,N)
vn='va-200'; fname=strcat(vn,fext); v.v200=readjson_new(tpath,fname,N)
vn='va-850'; fname=strcat(vn,fext); v.v850=readjson_new(tpath,fname,N)
%vn='rltcre'; fname=strcat(vn,fext); v.lwcf=readjson_new(tpath,fname,N)
%vn='rstcre'; fname=strcat(vn,fext); v.swcf=readjson_new(tpath,fname,N)
%vn='rlutcs'; fname=strcat(vn,fext); v.olr_clr  =readjson_new(tpath,fname,N)
%vn='rsutcs'; fname=strcat(vn,fext); v.swabs_clr=readjson_new(tpath,fname,N)
%vn='uas';    fname=strcat(vn,fext); v.uas =readjson_new(tpath,fname,N)
%vn='vas';    fname=strcat(vn,fext); v.vas =readjson_new(tpath,fname,N)
%vn='prw';    fname=strcat(vn,fext); v.prw      =readjson_new(tpath,fname,N)
%vn='hus-850';fname=strcat(vn,fext); v.q850     =readjson_new(tpath,fname,N)
fn=strcat('/work/miz/mat_am4p0/',expn,'_json.mat');fn
save(fn,'v');
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fn=strcat('./cmip5_amip_json.mat');load(fn); vm=v;

tpath='/nbhome/miz/awg/verona/AM4.0/atmos_1981_2014/pcmdi_metrics/metrics/AM4.0/';
fext='_2.5x2.5_esmf_linear_metrics.json'; N=1;
vn='pr'; fname=strcat(vn,fext); v1.pr=readjson(tpath,fname,N)

v=vm.pr; pr=[v.ann.glob; v.ann.trop; v.ann.nhex; v.ann.shex]';
pr1=v1.pr;
figure; msize=10; 
boxplot(pr,'whisker',5); hold on;
plot(1,pr1.ann.glob,'rp','MarkerSize',msize);
plot(2,pr1.ann.trop,'rp','MarkerSize',msize);
plot(3,pr1.ann.nhex,'rp','MarkerSize',msize);
plot(4,pr1.ann.shex,'rp','MarkerSize',msize);
axis([0 5 -0.5 3.25]);
