function v=rdlhtraj(tpath,expn,epath,fn)
path (path,'/home/miz/AM2p12b/analysis/miztstorm/mizscripts/matlab/')
%nc64startup;%%%%%% 
fnstatic='/home/miz/AM2p12b/analysis/miztstorm/scripts/atmos.static.nc';
f =netcdf(fnstatic,'nowrite');
ncvars = var(f); latname='lat'; lonname='lon';
v.lat =f{latname}(:); v.lon=f{lonname}(:); 
v.lm=f{'land_mask'}(:,:); v.lm(v.lm>=0.5)=1; v.lm(v.lm<0.5)=0;
v.nlat=length(v.lat); v.nlon=length(v.lon); v.ngrid=v.nlat*v.nlon;
close(f); 
%%%%%%%%%%%%%%%%%%%
%tpath='/archive/Ming.Zhao/awg/warsaw/'; expn='c96L33_am4p0'; 
%epath='/tc/track/output/';
%fn='ts.txt.z1y-warm.t14_5.TS.world.19800101-19810101.txt'; %trostorm
fnin=strcat(tpath,expn,epath,fn); fid=fopen(fnin,'r'); fnin

n=0; k=1; windspeed_hur=29.5;
while ~feof(fid)
 tem1  =fscanf(fid,'%s',1);
 if (~isempty(tem1))
   if (tem1(7)=='+')
     n = n + 1;
     i = 1;
     tem1  =fscanf(fid,'%s',1);
     tem2  =fscanf(fid,'%s',1);
     tem3  =fscanf(fid,'%d',1);
     tem4  =fscanf(fid,'%d',1);
   else
     yyy = str2num(strcat(tem1(1:4)));
     mmm = str2num(tem1(5:6));
     ddd = str2num(tem1(7:8));
     hhh = str2num(tem1(9:10));
     ts(n).day  (i) =ddd;
     ts(n).month(i) =mmm;
     ts(n).year (i) =yyy;
     ts(n).hour (i) =hhh;
     ts(n).lon  (i) =fscanf(fid,'%f',1);
     ts(n).lat  (i) =fscanf(fid,'%f',1);
     ts(n).pres (i) =fscanf(fid,'%f',1);
     ts(n).wind (i) =fscanf(fid,'%f',1);
     ts(n).idwc (i) =fscanf(fid,'%f',1);
     ts(n).land (i) =landfall(ts(n).lat(i),ts(n).lon(i),v);
     ts(n).vort (i) =0;
     i = i + 1;
   end  % read line by line
 end
end
size(ts)
for n=1:length(ts)
  ts(n).num=length(ts(n).lon);
  ts(n).landf=(max(ts(n).land)>0);
  ts(n).hur=0; 
  windmax  =max(ts(n).wind);
  presmin  =min(ts(n).pres);
  lentraj  =length(ts(n).wind);
  if (windmax >= windspeed_hur)
    ts(n).hur=1;
  end
end

v.tr = regions_ibtrac(ts,'mod');
fext='/analysis/tropical_storms_wsfc/';
savenam=strcat(tpath,expn,fext,expn,'_traj_lh.mat'); disp(savenam);
%save(savenam,'v');

return

tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
expn ='c192L33_am4p0_amip_HIRESMIP_H5/';
epath='/tc/lmh_tracker/'; 
fn='1980-1982.txt.z1y-noWC.allstorms.world.19800101-19830101.txt'
v=rdlhtraj(tpath,expn,epath,fn)
year=1980; plottraj_mlat(v, year); 


tpath='/archive/Ming.Zhao/awg/warsaw/'; expn='c96L33_am4p0'; 
epath='/tc/track/output/'; fn='ts.txt.z1y-warm.t14_5.TS.world.19800101-19810101.txt'
v=rdlhtraj(tpath,expn,epath,fn)
 
tpath='/archive/miz/awg/warsaw/';
epath='/analysis/tropical_storms_wsfc/';
expn ='c96L33_am4p0'; 

fn=strcat(tpath,expn,epath,expn,'_traj.mat');    vm0=regionstat_ibtracs(fn,'mod');
fn=strcat(tpath,expn,epath,expn,'_traj_lh.mat'); vm1=regionstat_ibtracs(fn,'mod');

v=regionstat_ibtracs_ih(fn,opt)
path (path,'/home/miz/AM2p12b/analysis/miztstorm/mizscripts/matlab/')
latbnd=45; opt='mod';

ts0=vm0.ts; ts1=vm1.ts; 
year=1980;
plottraj(vm0, year); 

plottraj(vm1, year); 

