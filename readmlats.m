function v=readmlats(tpath,expn,epath,fn)
%tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
%expn ='CM4_c192L33_am4p0_1950Control_new';
%epath='/midlats/track_0051_0099/'; 
%fn   ='mlats_storm_track.txt';
fname = strcat(tpath,expn,epath,fn)
fid=fopen(fname,'r');
n=1;
while (1 > 0)
  start=fscanf(fid,'%s',1);
  if (~strcmp(start,'start'))
    break;
  end
  num  =fscanf(fid,'%d',1);
  yyy  =fscanf(fid,'%d',1); 
  mmm  =fscanf(fid,'%d',1);
  ddd  =fscanf(fid,'%d',1);
  hrs  =fscanf(fid,'%d',1);
  ts(n).start = start;
  ts(n).num = num;
  ts(n).yyy = yyy;
  ts(n).mmm = mmm;
  ts(n).ddd = ddd;
  ts(n).hrs = hrs;
  for i=1:num
    ts(n).lon  (i) =fscanf(fid,'%f',1); 
    ts(n).lat  (i) =fscanf(fid,'%f',1); 
    ts(n).wind (i) =fscanf(fid,'%f',1); 
    ts(n).pres (i) =fscanf(fid,'%f',1); 
    ts(n).year (i) =fscanf(fid,'%f',1); 
    ts(n).month(i) =fscanf(fid,'%f',1); 
    ts(n).day  (i) =fscanf(fid,'%f',1); 
    ts(n).hour (i) =fscanf(fid,'%f',1); 
  end
  n=n+1; disp(n); disp(ts(n).year(1);
end
fclose(fid); v.tr=ts; %plottraj_mlat(v,1951); 
return; 

tpath='/archive/Ming.Zhao/CM4/warsaw_201710_om4_v1.0.1/';
expn ='CM4_c192L33_am4p0_1950Control_new';
epath='/midlats/track_0051_0099/'; 
fn   ='mlats_storm_track.txt.20181118';
v=readmlats(tpath,expn,epath,fn)
plottraj_mlat(v,1951); 
