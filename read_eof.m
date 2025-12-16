function w=read_eof(tpath,expn,fname,opt)
%tpath='/home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_hiresmip/';
%expn='ERA_interim'; fname='ERA_interim_1979_2014.EOF_z500.nc'; opt='obs';

expn=strcat('eof_',expn,'/');
fn=strcat(tpath,expn,fname); fn
if strcmp(opt,'obs');
  w.lat   =ncread(fn,'latitude');  w.lat=double(w.lat);
  w.lon   =ncread(fn,'longitude'); w.lon=double(w.lon);
else
  w.lat   =ncread(fn,'lat');  w.lat=double(w.lat);
  w.lon   =ncread(fn,'lon');  w.lon=double(w.lon);
end
w.time  =ncread(fn,'time');
w.EOF   =ncread(fn,'EOF');
w.EOF_TS=ncread(fn,'EOF_TS');
w.expvar=ncreadatt(fn,'EOF','pcvar');

w.pc_std=std(w.EOF_TS,[],1);
N=length(w.EOF(1,1,:));
for i=1:N
  w.eof(:,:,i) =w.EOF(:,:,i)*w.pc_std(i);
  w.eof_ts(:,i)=w.EOF_TS(:,i)/w.pc_std(i);
end

nt=length(w.EOF_TS(:,1));
for t=1:nt
  i=1;
  a=w.EOF(:,:,i)*w.EOF_TS(t,i);
  for i=2:N
    a=a+w.EOF(:,:,i)*w.EOF_TS(t,i);
  end
  w.data_recon(:,:,t)=a;
end

return


tpath='/home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_hiresmip/';
expn='ERA_interim'; fname='ERA_interim_1979_2014.EOF_z500.nc'; opt='obs';
w_obs=read_eof(tpath,expn,fname,opt);

tpath='/home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_hiresmip/';
expn='c192L33_am4p0_amip_HIRESMIP_H8'; 
fname='c192L33_am4p0_amip_HIRESMIP_H8_1979_2014.EOF_z500.nc'; opt='mod';
w_mod=read_eof(tpath,expn,fname,opt);

tpath='/home/Ming.Zhao/AM2p12b/warsaw/input_warsaw/mata_hiresmip/';
expn='c192L33_am4p0_amip_HIRESMIP_H8'; 
fname='c192L33_am4p0_amip_HIRESMIP_H8_1950_2014.EOF_z500.nc'; opt='mod';
w_mod=read_eof(tpath,expn,fname,opt);
