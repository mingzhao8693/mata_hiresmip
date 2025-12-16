% Global Atmospheric River Detection
% Copyright (c) 2015-2016, Bin Guan. All rights reserved.
%
% Usage: global_ar_detect(ivtfile,islndfile,londef,latdef,pixelarea,timedef,undef,outfile,pixel_ivtpercentile_limit,universal_ivt_limit,length_limit,lenwidratio_limit)
%   ivtfile: full path to input IVT with two 3-d (nlon x nlat x ntime) variables named 'ivtx' and 'ivty' containing IVT in kg/m/s (e.g., 'ivt.nc')
%   islndfile: full path to input land mask with a 2-d (nlon x nlat) variable named 'islnd' containing 1's over land and 0's over ocean (e.g., 'islnd.nc')
%   londef: longitudinal grid
%     - geographic projection: [nlon,lons,dlon], indicating nlon pixels, starting from lons, spaced dlon degrees (e.g., [144,0,2.5])
%     - non-geographic projection (such as polar stereographic): 2-d array explicitly giving longitudes at all pixels
%   latdef: latitudinal grid
%     - geographic projection with evenly-spaced latitudes: [nlat,lats,dlat], indicating nlat pixels, starting from lats, spaced dlat degrees (e.g., [73,-90,2.5])
%     - geographic projection with unevenly-spaced latitudes (such as Gaussian): [lat1,lat2,lat3,lat4,...]
%     - non-geographic projection (such as polar stereographic): 2-d array explicitly giving latitudes at all pixels
%   pixelarea: pixel area in m^2 (only needed for non-geographic projection; use [] for geographic projection)
%   timedef: temporal grid
%     - regular calendar: [ntime,year,month,day,hour,dtime], indicating ntime steps, starting from year-month-day hour:00, at dtime-hour intervals (e.g., [100000,1948,2,1,0,6])
%     - 365-day calendar: [...,365]
%   undef: missing value flag (e.g., -9999)
%   outfile: full path to output (e.g., 'out.nc'); the following 3 files will be output
%     - *.nc: 4 3-d (nlon x nlat x ntime) variables containing AR shape, long axis, short axis, and landfall location (if landfalling)
%     - *.txt: selected attributes of each detected AR (year, month, day, hour, length, width, centroid longitude, centroid latitude, etc.)
%     - pixel_ivt_limit.nc (produced only if pixel_ivtpercentile_limit is numeric): 3-d (nlon x nlat x 12) variable named 'ivt' containing a given percentile in kg/m/s for each of the 12 months
%   pixel_ivtpercentile_limit: IVT percentile limit
%     - if numeric: i, for ith percentile (e.g., 85)
%     - if non-numeric: full path to input with a 3-d (nlon x nlat x 12) variable named 'ivt' containing a given percentile in kg/m/s for each of the 12 months (e.g., 'ivt85.nc')
%   universal_ivt_limit: IVT fixed limit in kg/m/s (e.g., 100)
%   length_limit: length limit in m (e.g., 2e6)
%   lenwidratio_limit: length/width ratio limit (e.g., 2)
%
% Notes on map projections:
%   1. geographic projection with evenly-spaced latitudes: fully supported
%   2. geographic projection with unevenly-spaced latitudes: fully supported
%   3. non-geographic projections: supported with a potential limitation: an AR artificially cut off by
%      the circular longitudinal boundary resulting in multiple pieces will be treated as separate ARs
%
% Example 1:
%   global_ar_detect('ivt.nc','islnd.nc',[144,0,2.5],[73,-90,2.5],[],[100000,1948,2,1,0,6],-9999,'out.nc',85,100,2e6,2) 
% Example 2: as Example 1 but with unevenly-spaced latitudes
%   global_ar_detect('ivt.nc','islnd.nc',[144,0,2.5],[-87.8638,-85.09653,-82.31291,...,87.8638],[],[100000,1948,2,1,0,6],-9999,'out.nc',85,100,2e6,2) 
% Example 3: as Example 1 but with non-geographic projection and pixel area of 250km x 250km
%   global_ar_detect('ivt.nc','islnd.nc',lon,lat,250e3^2,[100000,1948,2,1,0,6],-9999,'out.nc',85,100,2e6,2) % lon and lat are 2-d arrays of the same spatial size as IVT
% Example 4: as Example 1 but reading pre-calculated IVT 85th percentile values from an existing file
%   global_ar_detect('ivt.nc','islnd.nc',[144,0,2.5],[73,-90,2.5],[],[100000,1948,2,1,0,6],-9999,'out.nc','ivt85.nc',100,2e6,2) 
%
% Reference:
% Guan, B., and D. E. Waliser (2015), Detection of atmospheric rivers:
% Evaluation and application of an algorithm for global studies,
% J. Geophys. Res. Atmos., 120, 12514-12535, doi:10.1002/2015JD024257.
function ARdetect_miz(tpath,expn,syr,latdef,londef,timedef)
%tpath='/archive/Ming.Zhao/backup/ECMWF/';
%expn ='ERAI_6h_DATA'; yr=1979; 
%latdef = [241, -90, 0.75];
%londef = [480,  0,  0.75];
%timedef= [1460,yr,1,1,0,6];
%tpath='/archive/Ming.Zhao/awg/warsaw_201803/';
%expn ='c192L33_am4p0_amip_HIRESMIP_H8_newpp';
%latdef = [240,-89.625, 0.75]; 
%londef = [480, 0.375,  0.75]; syr='1979'
%timedef= [1460,syr,1,1,0,6];

software_version='1.0'; %syr=num2str(yr);
fext =strcat('/atmos_data/atmos.',syr,'010100-',syr,'123123.');
ivtxfile = strcat(tpath,expn,fext,'ivtx.nc');disp(ivtxfile);
ivtyfile = strcat(tpath,expn,fext,'ivty.nc');disp(ivtyfile);
outfile  = strcat('./',expn,'_','AR_',syr,'.nc'); disp(outfile);

islndfile = strcat(tpath,expn,'/atmos.static.nc'); disp(islndfile)
universal_ivt_limit = 100; length_limit = 2e6; lenwidratio_limit = 2;
pixelarea = []; undef = -9999; 
pixel_ivtpercentile_limit = 85; %'pixel_ivt_limit.nc';

[ivtxdir,ivtxmain,ivtxext]=fileparts(ivtxfile);
[ivtydir,ivtymain,ivtyext]=fileparts(ivtyfile);
[islnddir,islndmain,islndext]=fileparts(islndfile);
[outdir,outmain,outext]=fileparts(outfile);

% check out licenses
fprintf(1,'Obtaining licenses ');
while 1
  fprintf(1,'.');
  [status1,errmsg1]=license('checkout','image_toolbox');
  [status2,errmsg2]=license('checkout','map_toolbox');
  [status3,errmsg3]=license('checkout','statistics_toolbox');
  if status1 & status2 & status3
    break;
  else
    pause(60);
  end
end
fprintf(1,' done.\n');
disp('Program started.'); tic;
disp(' ');

% define internal constants/parameters
earth_radius=6.371e6; % [m]
degree_to_meter=1.1119e5; % degree-to-meter conversion coefficient (based on one degree longitude at equator)
landmass_area_limit=(2.5*degree_to_meter)^2; % [m^2]
object_ivty_limit=50; % [kg/m/s]
matrix_numel_limit=5e7; % based on experience - exceeding it will cause system to be less responsive

% define spatial grid
if isvector(latdef) & numel(latdef)==3 % geographic projection, evenly-spaced latitudes
  nlon=londef(1); lons=londef(2); dlon=londef(3);
  nlat=latdef(1); lats=latdef(2); dlat=latdef(3);
  if mod(nlon,1)~=0
    disp('[ERROR] Number of longitudes must be integer. Program stopped.');
    return
  end
  if mod(nlat,1)~=0
    disp('[ERROR] Number of latitudes must be integer. Program stopped.');
    return
  end
  if dlat<0
    disp('[ERROR] Latitudes must be in ascending order. Program stopped.');
    return
  end
  lone=lons+(nlon-1)*dlon;
  late=lats+(nlat-1)*dlat;
  lon=repmat([lons:dlon:lone]',[1,nlat]); % note: do NOT change range of lon; leave as-is
  lat=repmat(lats:dlat:late,[nlon,1]);
  pixelarea=reshape(areaquad(lat(:)-dlat/2,lon(:)-dlon/2,lat(:)+dlat/2,lon(:)+dlon/2,earth_radius),[nlon,nlat]); % [m^2]
  is_geographic=1;
  is_global_lon=nlon*dlon==360;
  is_global_lat=nlat*dlat>=180; % note: intentionally allow latitude range to be (slightly) over 180 to accomodate some commonly used grid with boundary pixels centered at -90 and 90 degrees
  is_even_lat=1;
elseif isvector(latdef) & numel(latdef)>3 % geographic projection, unevenly-spaced latitudes
  latdef=latdef(:)'; % convert to row vector if not already one
  nlon=londef(1); lons=londef(2); dlon=londef(3);
  nlat=numel(latdef); lats=latdef(1); dlat=mean(diff(latdef));
  if dlat<0
    disp('[ERROR] Latitudes must be in ascending order. Program stopped.');
    return
  end
  lone=lons+(nlon-1)*dlon;
  late=latdef(end);
  lon=repmat([lons:dlon:lone]',[1,nlat]); % note: do NOT change range of lon; leave as-is
  lat=repmat(latdef,[nlon,1]);
  pixelarea=reshape(areaquad(lat(:)-dlat/2,lon(:)-dlon/2,lat(:)+dlat/2,lon(:)+dlon/2,earth_radius),[nlon,nlat]); % [m^2]
  is_geographic=1;
  is_global_lon=nlon*dlon==360;
  is_global_lat=nlat*dlat>=180; % note: intentionally allow latitude range to be (slightly) over 180 to accomodate some commonly used grid with boundary pixels centered at -90 and 90 degrees
  is_even_lat=0;
else % any other projection
  lon=londef; % note: do NOT change range of lon; leave as-is
  lat=latdef;
  dlon=sqrt(pixelarea)/degree_to_meter; % nominal dlon
  dlat=dlon; % nominal dlat
  pixelarea=ones(size(lon))*pixelarea; % [m^2]
  is_geographic=0;
  is_global_lon=0;
  is_global_lat=0;
  is_even_lat=0;
end
[nrow,ncol]=size(lon);

% define temporal grid
year=[]; month=[]; day=[]; hour=[];
ntime=timedef(1);
year(1)=timedef(2);
month(1)=timedef(3);
day(1)=timedef(4);
hour(1)=timedef(5); % [integer hour]
dtime=timedef(6); % [integer hour]
if mod(ntime,1)~=0
  disp('[ERROR] Number of time steps must be integer. Program stopped.');
  return
end
if mod(hour(1),1)~=0
  disp('[ERROR] Starting hour must be integer. Program stopped.');
  return
end
if mod(dtime,1)~=0
  disp('[ERROR] Time interval must be integer. Program stopped.');
  return
end
if numel(timedef)==6
  cal='';
else
  if timedef(7)==365
    cal='365_day_calendar';
  else
    disp('[ERROR] Invalid calendar. Program stopped.');
    return
  end
end
thisyear=year(1);
thismonth=month(1);
thisday=day(1);
thishour=hour(1);
for tcnt=2:ntime
  thishour=thishour+dtime;
  if thishour>=24
    thisday=thisday+floor(thishour/24);
    thishour=mod(thishour,24);
  end
  if isempty(cal) & ((~mod(thisyear,4) & mod(thisyear,100)) | ~mod(thisyear,400))
    numdaythismonth=[31,29,31,30,31,30,31,31,30,31,30,31];
  else
    numdaythismonth=[31,28,31,30,31,30,31,31,30,31,30,31];
  end
  if thisday>numdaythismonth(thismonth)
    thismonth=thismonth+1;
    thisday=1;
  end
  if thismonth>12
    thisyear=thisyear+1;
    thismonth=1;
  end
  year(tcnt)=thisyear;
  month(tcnt)=thismonth;
  day(tcnt)=thisday;
  hour(tcnt)=thishour;
end
fprintf(1,'Time steps to process: %4i.%02i.%02i %02iZ to %4i.%02i.%02i %02iZ.\n',[year(1),month(1),day(1),hour(1),year(end),month(end),day(end),hour(end)]);

% process land mask and define coast (for landfall detection)
if ~strcmp(islndext,'.nc')
  islndfid=fopen(islndfile,'r');
  islnd=fread(islndfid,inf,'real*4');
  islnd=reshape(islnd,[nrow,ncol]);
  fclose(islndfid);
else
  islnd=ncread(islndfile,'land_mask'); %size(islnd)
  islnd(islnd>=0.5)=1; islnd(islnd<0.5)=0;
end
islnd=islnd==1; % 1's over land, 0's elsewhere
islnd=bwlabel(islnd);
if is_geographic & is_global_lon % when input grid is geographic with global longitudes (regardless of valid data coverage), rejoin objects artificially cut off by circular longitudinal boundary
  islnd=rejoin_object(islnd,lon,lat);
end
unique_val=unique(islnd(islnd~=0)); % unique non-zero values
for ucnt=1:numel(unique_val)
  if nansum(pixelarea(islnd==unique_val(ucnt)))<landmass_area_limit
    islnd(islnd==unique_val(ucnt))=0; % discard when area is too small
  end
end
islnd=islnd~=0; % 1's over land, 0's elsewhere
islnd_unfilled=islnd; % save for later
ishole=imfill(bwmorph(islnd,'bridge'),'holes')-bwmorph(islnd,'bridge'); % water bodies surrounded by land or nearly so
ishole=bwlabel(ishole);
unique_val=unique(ishole(ishole~=0)); % unique non-zero values
for ucnt=1:numel(unique_val)
  if nansum(pixelarea(ishole==unique_val(ucnt)))<landmass_area_limit*9
    ishole(ishole==unique_val(ucnt))=0; % discard when area is too small
  end
end
ishole=ishole~=0;
islnd=islnd | ishole;
islnd=imfill(islnd,'holes');
if is_geographic & is_global_lon
  islnd=[islnd(round(nrow/2)+1:end,:);islnd(1:round(nrow/2),:)]; % shift zonally
  ishole=imfill(bwmorph(islnd,'bridge'),'holes')-bwmorph(islnd,'bridge'); % water bodies surrounded by land or nearly so but artificially cut off by circular longitudinal boundary
  ishole=bwlabel(ishole);
  unique_val=unique(ishole(ishole~=0)); % unique non-zero values
  for ucnt=1:numel(unique_val)
    if nansum(pixelarea(ishole==unique_val(ucnt)))<landmass_area_limit*9
      ishole(ishole==unique_val(ucnt))=0; % discard when area is too small
    end
  end
  ishole=ishole~=0;
  islnd=islnd | ishole;
  islnd=imfill(islnd,'holes');
  islnd=[islnd(end-(round(nrow/2)-1):end,:);islnd(1:end-round(nrow/2),:)]; % shift back zonally
end
iscst=bwperim(islnd);
if is_geographic & is_global_lon
  islnd2=[islnd(round(nrow/2)+1:end,:);islnd(1:round(nrow/2),:)]; % shift zonally
  iscst2=bwperim(islnd2);
  iscst2=[iscst2(end-(round(nrow/2)-1):end,:);iscst2(1:end-round(nrow/2),:)]; % shift back zonally
  iscst=iscst & iscst2; % prevent circular longitudinal boundary or holes cut off by circular longitudinal boundary from being mistaken as coast
end
if is_geographic & is_global_lat
  iscst(lat==lats)=0; % prevent south pole from being mistaken as coast
end
islnd=islnd_unfilled;
iscst=iscst & islnd;

% output maps (.nc and .ctl)
month_abbr={'JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'};
if exist(outfile,'file')
  delete(outfile);
end
nccreate(outfile,'shape','dimensions',{'lon',nrow,'lat',ncol,'time',inf},'chunksize',[nrow,ncol,1],'datatype','int16','fillvalue',0,'format','netcdf4','deflatelevel',9);
nccreate(outfile,'axis','dimensions',{'lon',nrow,'lat',ncol,'time',inf},'chunksize',[nrow,ncol,1],'datatype','double','fillvalue',0,'format','netcdf4','deflatelevel',9);
nccreate(outfile,'lfloc','dimensions',{'lon',nrow,'lat',ncol,'time',inf},'chunksize',[nrow,ncol,1],'datatype','int16','fillvalue',0,'format','netcdf4','deflatelevel',9);
nccreate(outfile,'islnd','dimensions',{'lon',nrow,'lat',ncol},'chunksize',[nrow,ncol],'datatype','int16','fillvalue',0,'format','netcdf4','deflatelevel',9);
nccreate(outfile,'iscst','dimensions',{'lon',nrow,'lat',ncol},'chunksize',[nrow,ncol],'datatype','int16','fillvalue',0,'format','netcdf4','deflatelevel',9);
if is_geographic
  nccreate(outfile,'lon','dimensions',{'lon',nrow});
  nccreate(outfile,'lat','dimensions',{'lat',ncol});
else
  nccreate(outfile,'lon','dimensions',{'lon',nrow,'lat',ncol});
  nccreate(outfile,'lat','dimensions',{'lon',nrow,'lat',ncol});
end
nccreate(outfile,'time','dimensions',{'time',inf});
ncwrite(outfile,'islnd',int16(islnd));
ncwrite(outfile,'iscst',int16(iscst));
if is_geographic & is_even_lat
  ncwrite(outfile,'lon',lons:dlon:lone);
  ncwrite(outfile,'lat',lats:dlat:late);
elseif is_geographic & ~is_even_lat
  ncwrite(outfile,'lon',lons:dlon:lone);
  ncwrite(outfile,'lat',latdef);
else
  ncwrite(outfile,'lon',lon);
  ncwrite(outfile,'lat',lat);
end
ncwrite(outfile,'time',0:dtime:((ntime-1)*dtime));
ncwriteatt(outfile,'shape','long_name','Shape');
ncwriteatt(outfile,'axis','long_name','Long Axis');
ncwriteatt(outfile,'lfloc','long_name','Landfall Location');
ncwriteatt(outfile,'islnd','long_name','Is Land (Major Landmasses Only)');
ncwriteatt(outfile,'iscst','long_name','Is Coast (Major Landmasses Only; Inland Water Bodies Not Considered)');
ncwriteatt(outfile,'lon','units','degrees_east');
ncwriteatt(outfile,'lat','units','degrees_north');
ncwriteatt(outfile,'time','units',sprintf('hours since %04i-%02i-%02i %02i',year(1),month(1),day(1),hour(1)));
if(~isempty(cal))
  ncwriteatt(outfile,'time','calendar',cal);
end
ncwriteatt(outfile,'/','title','Global Atmospheric River Catalog');
ncwriteatt(outfile,'/','version',datestr(now,'yyyy.mm.dd'));
ncwriteatt(outfile,'/','creation_date',datestr(now));
ncwriteatt(outfile,'/','software_version',software_version);
ncwriteatt(outfile,'/','reference','Guan, B., and D. E. Waliser (2015), Detection of atmospheric rivers: Evaluation and application of an algorithm for global studies, J. Geophys. Res. Atmos., 120, 12514-12535, doi:10.1002/2015JD024257.');
ctlfid=fopen(fullfile(outdir,[outmain,'.ctl']),'w');
fprintf(ctlfid,'DSET ^%s\n',[outmain,outext]);
fprintf(ctlfid,'DTYPE netcdf\n');
fprintf(ctlfid,'UNDEF %g\n',0);
if(~isempty(cal))
  fprintf(ctlfid,'OPTIONS %s\n',cal);
end
if is_geographic & is_even_lat
  fprintf(ctlfid,'XDEF %i LINEAR %g %g\n',nlon,lons,dlon);
  fprintf(ctlfid,'YDEF %i LINEAR %g %g\n',nlat,lats,dlat);
elseif is_geographic & ~is_even_lat
  fprintf(ctlfid,'XDEF %i LINEAR %g %g\n',nlon,lons,dlon);
  fprintf(ctlfid,'YDEF %i LEVELS',nlat);
  fprintf(ctlfid,' %g',latdef);
  fprintf(ctlfid,'\n');
else
  fprintf(ctlfid,'XDEF %i LINEAR %g %g\n',nrow,0,0.01);
  fprintf(ctlfid,'YDEF %i LINEAR %g %g\n',ncol,0,0.01);
end
fprintf(ctlfid,'ZDEF %i LEVELS %g\n',1,1000);
fprintf(ctlfid,'TDEF %i LINEAR %02iZ%02i%s%04i %02ihr\n',ntime,hour(1),day(1),month_abbr{month(1)},year(1),dtime);
if is_geographic
  fprintf(ctlfid,'VARS %i\n',5);
else
  fprintf(ctlfid,'VARS %i\n',7);
end
fprintf(ctlfid,'shape=>shape 0 t,y,x Shape\n');
fprintf(ctlfid,'axis=>axis 0 t,y,x Long Axis\n');
fprintf(ctlfid,'lfloc=>lfloc 0 t,y,x Landfall Location\n');
fprintf(ctlfid,'islnd=>islnd 0 y,x Is Land (Major Landmasses Only)\n');
fprintf(ctlfid,'iscst=>iscst 0 y,x Is Coast (Major Landmasses Only; Inland Water Bodies Not Considered)\n');
if ~is_geographic
  fprintf(ctlfid,'lon=>truelon 0 y,x True Longitude\n');
  fprintf(ctlfid,'lat=>truelat 0 y,x True Latitude\n');
end
fprintf(ctlfid,'ENDVARS\n');
fclose(ctlfid);

if ~strcmp(ivtxext,'.nc')
  ivtxfid=fopen(ivtxfile,'r');
end
if ~strcmp(ivtyext,'.nc')
  ivtyfid=fopen(ivtyfile,'r');
end

statfid=fopen(fullfile(outdir,[outmain,'.txt']),'w'); %modify for .csv
fprintf(statfid,'Global Atmospheric River Catalog\n');
fprintf(statfid,['version: ',datestr(now,'yyyy.mm.dd'),'\n']);
fprintf(statfid,['creation_date: ',datestr(now),'\n']);
fprintf(statfid,['software_version: ',software_version,'\n']);
fprintf(statfid,'reference:\nGuan, B., and D. E. Waliser (2015), Detection of atmospheric rivers:\nEvaluation and application of an algorithm for global studies,\nJ. Geophys. Res. Atmos., 120, 12514-12535, doi:10.1002/2015JD024257.\n');
fprintf(statfid,'\n');
fprintf(statfid,'    |  |  |  |       |       |  C e n t r o i d|  Equatorward Tip|     Poleward Tip|      M  e  a  n   I  V  T|  IVT|Landfall Location|  IVT at Landfall Location\n');
fprintf(statfid,'Year|Mo|Dy|Hr| Length|  Width|-----------------|-----------------|-----------------|--------------------------|  Dir|-----------------|--------------------------\n');
fprintf(statfid,'    |  |  |  |     km|     km|     Lon|     Lat|     Lon|     Lat|     Lon|     Lat|   Zonal|   Merid|     Dir|  Coh|     Lon|     Lat|   Zonal|   Merid|     Dir\n');
fprintf(statfid,'=================================================================================================================================================================\n');

% calculate/output or read pixel_ivt_limit
if ~ischar(pixel_ivtpercentile_limit)
  % calculate pixel_ivt_limit
  fprintf(1,'Preprocessing ');
  num_block=ceil(nrow*ncol*ntime/matrix_numel_limit);
  block_numel=floor(nrow*ncol/num_block);
  block_start=1:block_numel:nrow*ncol;
  block_end=block_start+block_numel-1;
  block_end(block_end>nrow*ncol)=nrow*ncol;
  pixel_ivt_limit=[];
  for block_cnt=1:numel(block_start)
    fprintf(1,'.');
    ivt=[];
    for tcnt=1:ntime
      if ~strcmp(ivtxext,'.nc')
	data=fread(ivtxfid,nrow*ncol*2,'real*4');
	data=reshape(data,[nrow*ncol,2]);
	data(data==undef)=NaN;
	ivtx=data(block_start(block_cnt):block_end(block_cnt),1);
	ivty=data(block_start(block_cnt):block_end(block_cnt),2);
      else
	data1=ncread(ivtxfile,'ivtx',[1,1,tcnt],[inf,inf,1]);
	data1=data1(:);
	data1(data1==undef)=NaN;
	data2=ncread(ivtyfile,'ivty',[1,1,tcnt],[inf,inf,1]);
	data2=data2(:);
	data2(data2==undef)=NaN;
	ivtx=data1(block_start(block_cnt):block_end(block_cnt));
	ivty=data2(block_start(block_cnt):block_end(block_cnt));
      end
      ivt(:,tcnt)=sqrt(ivtx.^2+ivty.^2);
    end
    pixel_ivt_limit(block_start(block_cnt):block_end(block_cnt),11)=prctile(ivt(:,month>= 9 | month<=1),pixel_ivtpercentile_limit,2);
    pixel_ivt_limit(block_start(block_cnt):block_end(block_cnt),12)=prctile(ivt(:,month>=10 | month<=2),pixel_ivtpercentile_limit,2);
    pixel_ivt_limit(block_start(block_cnt):block_end(block_cnt), 1)=prctile(ivt(:,month>=11 | month<=3),pixel_ivtpercentile_limit,2);
    pixel_ivt_limit(block_start(block_cnt):block_end(block_cnt), 2)=prctile(ivt(:,month>=12 | month<=4),pixel_ivtpercentile_limit,2);
    for month_cnt=3:10
      pixel_ivt_limit(block_start(block_cnt):block_end(block_cnt),month_cnt)=prctile(ivt(:,month>=month_cnt-2 & month<=month_cnt+2),pixel_ivtpercentile_limit,2);
    end
    if ~strcmp(ivtxext,'.nc')
      frewind(ivtfid);
    end
  end
  fprintf(1,' done.\n');
  pixel_ivt_limit=reshape(pixel_ivt_limit,[nrow,ncol,12]);
  % output pixel_ivt_limit (.nc and .ctl)
  pixel_ivt_limit_out=pixel_ivt_limit;
  pixel_ivt_limit_out(isnan(pixel_ivt_limit_out))=undef;
  pixel_ivt_limit_outmain=strcat(expn,'_',syr,'_pixel_ivt_limit');
  if exist(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'file')
    delete(fullfile(outdir,[pixel_ivt_limit_outmain,outext]));
  end
  nccreate(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'ivt','dimensions',{'lon',nrow,'lat',ncol,'time',12},'chunksize',[nrow,ncol,1],'datatype','double','fillvalue',undef,'format','netcdf4','deflatelevel',9);
  if is_geographic
    nccreate(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'lon','dimensions',{'lon',nrow});
    nccreate(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'lat','dimensions',{'lat',ncol});
  else
    nccreate(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'lon','dimensions',{'lon',nrow,'lat',ncol});
    nccreate(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'lat','dimensions',{'lon',nrow,'lat',ncol});
  end
  nccreate(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'time','dimensions',{'time',12});
  ncwrite(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'ivt',pixel_ivt_limit_out);
  if is_geographic & is_even_lat
    ncwrite(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'lon',lons:dlon:lone);
    ncwrite(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'lat',lats:dlat:late);
  elseif is_geographic & ~is_even_lat
    ncwrite(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'lon',lons:dlon:lone);
    ncwrite(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'lat',latdef);
  else
    ncwrite(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'lon',lon);
    ncwrite(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'lat',lat);
  end
  ncwrite(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'time',(1:12)-1);
  ncwriteatt(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'ivt','long_name',sprintf('IVT %2ith Percentile',pixel_ivtpercentile_limit));
  ncwriteatt(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'ivt','units','kg m^-1 s^-1');
  ncwriteatt(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'lon','units','degrees_east');
  ncwriteatt(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'lat','units','degrees_north');
  ncwriteatt(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'time','units','months since 0001-01-01 00');
  if(~isempty(cal))
    ncwriteatt(fullfile(outdir,[pixel_ivt_limit_outmain,outext]),'time','calendar',cal);
  end
  ctlfid=fopen(fullfile(outdir,[pixel_ivt_limit_outmain,'.ctl']),'w');
  fprintf(ctlfid,'DSET ^%s\n',[pixel_ivt_limit_outmain,outext]);
  fprintf(ctlfid,'DTYPE netcdf\n');
  fprintf(ctlfid,'UNDEF %g\n',undef);
  if(~isempty(cal))
    fprintf(ctlfid,'OPTIONS %s\n',cal);
  end
  if is_geographic & is_even_lat
    fprintf(ctlfid,'XDEF %i LINEAR %g %g\n',nlon,lons,dlon);
    fprintf(ctlfid,'YDEF %i LINEAR %g %g\n',nlat,lats,dlat);
  elseif is_geographic & ~is_even_lat
    fprintf(ctlfid,'XDEF %i LINEAR %g %g\n',nlon,lons,dlon);
    fprintf(ctlfid,'YDEF %i LEVELS',nlat);
    fprintf(ctlfid,' %g',latdef);
    fprintf(ctlfid,'\n');
  else
    fprintf(ctlfid,'XDEF %i LINEAR %g %g\n',nrow,0,0.01);
    fprintf(ctlfid,'YDEF %i LINEAR %g %g\n',ncol,0,0.01);
  end
  fprintf(ctlfid,'ZDEF %i LEVELS %g\n',1,1000);
  fprintf(ctlfid,'TDEF 12 LINEAR 00Z01JAN0001 1mo\n');
  if is_geographic
    fprintf(ctlfid,'VARS %i\n',1);
  else
    fprintf(ctlfid,'VARS %i\n',3);
  end
  fprintf(ctlfid,'ivt=>ivt 0 t,y,x ivt\n');
  if ~is_geographic
    fprintf(ctlfid,'lon=>truelon 0 y,x True Longitude\n');
    fprintf(ctlfid,'lat=>truelat 0 y,x True Latitude\n');
  end
  fprintf(ctlfid,'ENDVARS\n');
  fclose(ctlfid);
else
  % read pre-calculated pixel_ivt_limit if pixel_ivtpercentile_limit is a string
  pixel_ivt_limit=ncread(pixel_ivtpercentile_limit,'ivt');
end

num_object_each_step_each_stage=[]; % potentially useful diagnostic

%
% loop over time: start
%
for tcnt=1:ntime
  fprintf(1,'Processing time step %i of %i ...\n',tcnt,ntime);

  if ~strcmp(ivtxext,'.nc')
    data=fread(ivtfid,nrow*ncol*2,'real*4');
    data=reshape(data,[nrow,ncol,2]);
    data(data==undef)=NaN;
    ivtx=data(:,:,1);
    ivty=data(:,:,2);
  else
    data1=ncread(ivtxfile,'ivtx',[1,1,tcnt],[inf,inf,1]);
    data1(data1==undef)=NaN;
    data2=ncread(ivtyfile,'ivty',[1,1,tcnt],[inf,inf,1]);
    data2(data2==undef)=NaN;
    ivtx=data1;
    ivty=data2;
  end

  ivt=sqrt(ivtx.^2+ivty.^2);

  outer_perim_ivt=bwperim(~isnan(ivt)); % IVT boundary, considering only those pixels with valid data (it may or may not be a rectangular, and can even contain holes when IVT itself contains holes)
  outer_perim_box=bwperim(ones(size(ivt))); % box boundary, considering all pixels regardless of valid/invalid data (it is always a rectangular)
  is_tight_outer_perim=isequal(outer_perim_ivt,outer_perim_box); % whether IVT boundary exactly matches box boundary

  % stage 1: filter based on pixel IVT
  shape_map=ivt>pixel_ivt_limit(:,:,month(tcnt)) & ivt>universal_ivt_limit; % 0's where IVT not meeting limit or where IVT simply being NaN, 1's elsewhere
  shape_map=bwlabel(shape_map);
  if is_geographic & is_global_lon % when input grid is geographic with global longitudes (regardless of valid data coverage), rejoin objects artificially cut off by circular longitudinal boundary
    shape_map=rejoin_object(shape_map,lon,lat);
  end
  for ocnt=unique(shape_map(shape_map~=0))'
    if nansum(pixelarea(shape_map==ocnt))<max(length_limit,3*dlon*degree_to_meter)*(3*dlon*degree_to_meter)/2 % assume a diamond shape
      shape_map(shape_map==ocnt)=0; % discard object when too small
    end
  end
  num_object_each_step_each_stage(tcnt,1)=numel(unique(shape_map(shape_map~=0)));

  % stage 2: filter based on consistency between pixel IVT directions and object-mean IVT direction
  object_IVTX=cell(0);
  object_IVTY=cell(0);
  object_IVTDIR=cell(0);
  object_IVTDIRCOHERENCE=cell(0);
  for ocnt=unique(shape_map(shape_map~=0))'
    object_ivtx=nansum(ivtx(shape_map==ocnt).*pixelarea(shape_map==ocnt))/nansum(pixelarea(shape_map==ocnt)); % area-weighted
    object_ivty=nansum(ivty(shape_map==ocnt).*pixelarea(shape_map==ocnt))/nansum(pixelarea(shape_map==ocnt)); % area-weighted
    object_ivtdir=mod(90-atan2(object_ivty,object_ivtx)/pi*180,360); % [0,360) [degree]; 0=IVT pointing northward, 90=eastward, etc. (i.e., increases clockwise); consistent with azimuth
    degree_diff=abs(mod(90-atan2(ivty,ivtx)/pi*180,360)-object_ivtdir);
    object_ivtdircoherence=nansum(pixelarea(shape_map==ocnt & (degree_diff<45 | degree_diff>360-45)).*ivt(shape_map==ocnt & (degree_diff<45 | degree_diff>360-45)))/nansum(pixelarea(shape_map==ocnt).*ivt(shape_map==ocnt)); % "mass" fraction
    object_IVTX{ocnt}=object_ivtx;
    object_IVTY{ocnt}=object_ivty;
    object_IVTDIR{ocnt}=object_ivtdir;
    object_IVTDIRCOHERENCE{ocnt}=object_ivtdircoherence;
    if object_IVTDIRCOHERENCE{ocnt}<0.5
      shape_map(shape_map==ocnt)=0; % discard object when too many pixels differ from object-mean IVT direction
    end
  end
  num_object_each_step_each_stage(tcnt,2)=numel(unique(shape_map(shape_map~=0)));

  % stage 3: filter based on object-mean meridional IVT direction
  centroid_LON=cell(0);
  centroid_LAT=cell(0);
  for ocnt=unique(shape_map(shape_map~=0))'
    is_straddling_equator=min(lat(shape_map==ocnt))*max(lat(shape_map==ocnt))<0;
    centroid_lon=angle(nansum(exp(i*lon(shape_map==ocnt)/180*pi).*pixelarea(shape_map==ocnt).*ivt(shape_map==ocnt))/nansum(pixelarea(shape_map==ocnt).*ivt(shape_map==ocnt)))/pi*180; % "mass"-weighted, with care taken to account for circularity of longitudes
    centroid_lat=nansum(lat(shape_map==ocnt).*pixelarea(shape_map==ocnt).*ivt(shape_map==ocnt))/nansum(pixelarea(shape_map==ocnt).*ivt(shape_map==ocnt)); % "mass"-weighted
    centroid_LON{ocnt}=centroid_lon;
    centroid_LAT{ocnt}=centroid_lat;
    if is_straddling_equator % object straddles equator
      shape_map(shape_map==ocnt)=0;
    else
      if centroid_LAT{ocnt}<0 % object south of equator
	if object_IVTY{ocnt}>-object_ivty_limit % area-weighted
	  shape_map(shape_map==ocnt)=0;
	end
      else % object north of equator
	if object_IVTY{ocnt}<object_ivty_limit % area-weighted
	  shape_map(shape_map==ocnt)=0;
	end
      end
    end
  end
  num_object_each_step_each_stage(tcnt,3)=numel(unique(shape_map(shape_map~=0)));

  % stage 4: filter based on consistency between object orientation and object-mean IVT direction
  prelimtip_map=zeros(nrow,ncol); % perimeter pixel pair with longest great-circle distance (which later determines prelimaxis but does not necessarily fall on axis)
  for ocnt=unique(shape_map(shape_map~=0))'
    object_perim_idx=find(bwperim(shape_map) & shape_map==ocnt); % note: IVT boundary is intentionally allowed to be considered
    random_pair_cnt=0;
    random_pair_p=[];
    random_pair_q=[];
    for p=1:numel(object_perim_idx)-1
      for q=p+1:numel(object_perim_idx)
	random_pair_cnt=random_pair_cnt+1;
	random_pair_p(random_pair_cnt)=p;
	random_pair_q(random_pair_cnt)=q;
      end
    end
    antipodal_idx=find(abs(lon(object_perim_idx(random_pair_p))-lon(object_perim_idx(random_pair_q)))==180 & lat(object_perim_idx(random_pair_p))==-lat(object_perim_idx(random_pair_q)));
    if numel(antipodal_idx)>0 % when geodesic calculations are problematic
      shape_map(shape_map==ocnt)=0;
    else
      [dummy,max_loc]=max(distance(lat(object_perim_idx(random_pair_p)),lon(object_perim_idx(random_pair_p)),lat(object_perim_idx(random_pair_q)),lon(object_perim_idx(random_pair_q)),earth_radius));
      prelimtip_map(object_perim_idx(random_pair_p(max_loc)))=ocnt;
      prelimtip_map(object_perim_idx(random_pair_q(max_loc)))=ocnt;
      [lat_tmp,lon_tmp]=track2(lat(find(prelimtip_map==ocnt,1,'first')),lon(find(prelimtip_map==ocnt,1,'first')),lat(find(prelimtip_map==ocnt,1,'last')),lon(find(prelimtip_map==ocnt,1,'last')),earth_radius,'degrees',3);
      lon_tmp=real(lon_tmp);
      lat_tmp=real(lat_tmp);
      [dummy,object_azimuth]=distance(lat_tmp(2),lon_tmp(2),lat(find(prelimtip_map==ocnt,1,'last')),lon(find(prelimtip_map==ocnt,1,'last'))); % azimuth of midpoint pointing to one end [degree]
%--------------------------------------notes for azimuth output from distance()--------------------------------------
% [0,360) [degree]; 0=northward (from point 1 to 2), 90=eastward, 315=northwestward, etc. (i.e., increases clockwise)
%--------------------------------------------------------------------------------------------------------------------
      degree_diff=abs(object_azimuth-object_IVTDIR{ocnt});
      if (degree_diff>90-45 & degree_diff<90+45) | (degree_diff>270-45 & degree_diff<270+45)
	shape_map(shape_map==ocnt)=0;
      end
    end
  end
  num_object_each_step_each_stage(tcnt,4)=numel(unique(shape_map(shape_map~=0)));
  
  % stage 5: find axis
  axis_map=zeros(nrow,ncol);
  axis_IDX=cell(0);
  for ocnt=unique(shape_map(shape_map~=0))'
    prelimaxis_length=distance(lat(find(prelimtip_map==ocnt,1,'first')),lon(find(prelimtip_map==ocnt,1,'first')),lat(find(prelimtip_map==ocnt,1,'last')),lon(find(prelimtip_map==ocnt,1,'last')),earth_radius); % [m]
    num_point_lon=round(abs(lon(find(prelimtip_map==ocnt,1,'first'))-lon(find(prelimtip_map==ocnt,1,'last')))/dlon);
    num_point_lat=round(abs(lat(find(prelimtip_map==ocnt,1,'first'))-lat(find(prelimtip_map==ocnt,1,'last')))/dlat);
    num_point=max([num_point_lon,num_point_lat,3]);
    [prelimaxis_lat,prelimaxis_lon]=track2(lat(find(prelimtip_map==ocnt,1,'first')),lon(find(prelimtip_map==ocnt,1,'first')),lat(find(prelimtip_map==ocnt,1,'last')),lon(find(prelimtip_map==ocnt,1,'last')),earth_radius,'degrees',num_point);
    prelimaxis_lon=real(prelimaxis_lon);
    prelimaxis_lat=real(prelimaxis_lat);
    [dummy,object_azimuth]=distance(prelimaxis_lat(1:end-1),prelimaxis_lon(1:end-1),prelimaxis_lat(2:end),prelimaxis_lon(2:end)); % azimuth between each two neighboring pixels at preliminary axis [degree]
    object_azimuth=[object_azimuth(1);object_azimuth]; % to match size
    search_length=ones(size(prelimaxis_lon))*prelimaxis_length;
    [crosstrack_LATend_half1,crosstrack_LONend_half1]=reckon(prelimaxis_lat,prelimaxis_lon,search_length,object_azimuth-90,earth_radius,'degrees');
    [crosstrack_LATend_half2,crosstrack_LONend_half2]=reckon(prelimaxis_lat,prelimaxis_lon,search_length,object_azimuth+90,earth_radius,'degrees');
    num_point_lon=round(abs(crosstrack_LONend_half1-crosstrack_LONend_half2)/dlon);
    num_point_lat=round(abs(crosstrack_LATend_half1-crosstrack_LATend_half2)/dlat);
    num_point=max([max(num_point_lon),max(num_point_lat),3]);
    [crosstrack_LAT_half1,crosstrack_LON_half1]=track1(prelimaxis_lat,prelimaxis_lon,object_azimuth-90,search_length,earth_radius,'degrees',num_point);
    [crosstrack_LAT_half2,crosstrack_LON_half2]=track1(prelimaxis_lat,prelimaxis_lon,object_azimuth+90,search_length,earth_radius,'degrees',num_point);
    crosstrack_LON=[flipud(crosstrack_LON_half1);crosstrack_LON_half2];
    crosstrack_LAT=[flipud(crosstrack_LAT_half1);crosstrack_LAT_half2];
    crosstrack_IDX=lonlat2idx(crosstrack_LON,crosstrack_LAT,lon,lat,is_geographic,is_even_lat,degree_to_meter); % each column is one crosstrack normal to preliminary axis
    axis_idx=NaN(size(prelimaxis_lon));
    for pcnt=1:numel(prelimaxis_lon) % loop through each pixel at preliminary axis
      crosstrack_idx=crosstrack_IDX(:,pcnt);
      crosstrack_idx(isnan(crosstrack_idx))=[];
      crosstrack_idx=unique(crosstrack_idx,'stable');
      crosstrack_idx(shape_map(crosstrack_idx)~=ocnt)=[]; % throw away indices that fall outside of object (which could make crosstrack_idx empty)
      if ~isempty(crosstrack_idx)
	[dummy,max_loc]=max(ivt(crosstrack_idx));
	condition1=is_geographic & is_global_lon & is_global_lat & is_tight_outer_perim; % input grid is geographic with global coverage of valid data
	condition2=~outer_perim_ivt(crosstrack_idx(max_loc)); % candidate axis pixel is not at IVT boundary
	if condition1 | condition2 % when an axis pixel is actually defined
	  axis_idx(pcnt)=crosstrack_idx(max_loc);
	end
      end
    end
    axis_idx(isnan(axis_idx))=[]; % axis_idx could now be empty (which could happen when condition1 and condition2 were never met)
    axis_idx=unique(axis_idx,'stable'); % unique values in original order
    dummy_map=zeros(nrow,ncol);
    dummy_map(axis_idx)=1;
    dummy_map=bwmorph(imfill(dummy_map,'holes'),'thin',inf);
    dummy_idx=find(dummy_map==1);
    axis_idx(~ismember(axis_idx,dummy_idx))=[]; % axis is thinned so that total length can be properly represented by summation of inter-pixel distances, and care is taken to maintain orginal order of elements in axis_idx
    if numel(axis_idx)>=2
      axis_IDX{ocnt}=axis_idx;
      axis_map(axis_IDX{ocnt})=ocnt+(1:numel(axis_IDX{ocnt}))/1e5; % note: axis_map is not integer
    else
      shape_map(shape_map==ocnt)=0; % discard object when too few axis pixels
    end
  end
  num_object_each_step_each_stage(tcnt,5)=numel(unique(shape_map(shape_map~=0)));

  % stage 6: filter based on length and length/width ratio
  object_LENGTH=cell(0);
  object_WIDTH=cell(0);
  for ocnt=unique(shape_map(shape_map~=0))'
    axis_idx=axis_IDX{ocnt};
    inter_pixel_distance=distance(lat(axis_idx(1:end-1)),lon(axis_idx(1:end-1)),lat(axis_idx(2:end)),lon(axis_idx(2:end)),earth_radius);
    inter_pixel_distance(inter_pixel_distance>sqrt(8)*dlon*degree_to_meter)=NaN; % "jumps" will not be counted toward total length
    object_length=nansum(inter_pixel_distance);
    object_width=nansum(pixelarea(shape_map==ocnt))/object_length;
    object_LENGTH{ocnt}=object_length;
    object_WIDTH{ocnt}=object_width;
    if object_LENGTH{ocnt}<length_limit | object_LENGTH{ocnt}/object_WIDTH{ocnt}<lenwidratio_limit
      shape_map(shape_map==ocnt)=0;
    end
  end
  num_object_each_step_each_stage(tcnt,6)=numel(unique(shape_map(shape_map~=0)));

  % stage 7: determine landfall occurrence/location
  lfloc_map=zeros(nrow,ncol);
  for ocnt=unique(shape_map(shape_map~=0))'
    intersect_idx=find(shape_map==ocnt & iscst & ~isnan(ivt));
    if ~isempty(intersect_idx)
      intersect_ivt_direction=mod(90-atan2(ivty(intersect_idx),ivtx(intersect_idx))/pi*180,360); % [0,360) [degree]; 0=IVT pointing northward, 90=eastward, etc. (i.e., increases clockwise); consistent with azimuth
%-------------------------------------land/sea type based on pixel IVT direction-------------------------------------
      [intersect_leeward_lat,intersect_leeward_lon]=reckon(lat(intersect_idx),lon(intersect_idx),dlon*degree_to_meter,intersect_ivt_direction,earth_radius,'degrees');
      intersect_leeward_idx=lonlat2idx(intersect_leeward_lon,intersect_leeward_lat,lon,lat,is_geographic,is_even_lat,degree_to_meter);
      intersect_leeward_islnd=zeros(size(intersect_leeward_idx));
      intersect_leeward_islnd(~isnan(intersect_leeward_idx))=islnd(intersect_leeward_idx(~isnan(intersect_leeward_idx)));
      [intersect_windward_lat,intersect_windward_lon]=reckon(lat(intersect_idx),lon(intersect_idx),dlon*degree_to_meter,intersect_ivt_direction-180,earth_radius,'degrees');
      intersect_windward_idx=lonlat2idx(intersect_windward_lon,intersect_windward_lat,lon,lat,is_geographic,is_even_lat,degree_to_meter);
      intersect_windward_isocn=zeros(size(intersect_windward_idx));
      intersect_windward_isocn(~isnan(intersect_windward_idx))=~islnd(intersect_windward_idx(~isnan(intersect_windward_idx)));
%--------------------------------------------------------------------------------------------------------------------
%----------------------------------land/sea type based on object-mean IVT direction----------------------------------
      [intersect_leeward2_lat,intersect_leeward2_lon]=reckon(lat(intersect_idx),lon(intersect_idx),dlon*degree_to_meter,object_IVTDIR{ocnt},earth_radius,'degrees');
      intersect_leeward2_idx=lonlat2idx(intersect_leeward2_lon,intersect_leeward2_lat,lon,lat,is_geographic,is_even_lat,degree_to_meter);
      intersect_leeward2_islnd=zeros(size(intersect_leeward2_idx));
      intersect_leeward2_islnd(~isnan(intersect_leeward2_idx))=islnd(intersect_leeward2_idx(~isnan(intersect_leeward2_idx)));
      [intersect_windward2_lat,intersect_windward2_lon]=reckon(lat(intersect_idx),lon(intersect_idx),dlon*degree_to_meter,object_IVTDIR{ocnt}-180,earth_radius,'degrees');
      intersect_windward2_idx=lonlat2idx(intersect_windward2_lon,intersect_windward2_lat,lon,lat,is_geographic,is_even_lat,degree_to_meter);
      intersect_windward2_isocn=zeros(size(intersect_windward2_idx));
      intersect_windward2_isocn(~isnan(intersect_windward2_idx))=~islnd(intersect_windward2_idx(~isnan(intersect_windward2_idx)));
%--------------------------------------------------------------------------------------------------------------------
%-----------------------------------------------tailside consideration-----------------------------------------------
      tailside_length=nan(size(intersect_idx));
      for icnt=1:numel(intersect_idx) 
	[dummy,intersect_to_axis_azimuth]=distance(lat(intersect_idx(icnt)),lon(intersect_idx(icnt)),lat(floor(axis_map)==ocnt),lon(floor(axis_map)==ocnt)); % azimuth of given intersect pixel pointing to axis pixels [degree]
	degree_diff2=abs(intersect_to_axis_azimuth-object_IVTDIR{ocnt});
	axis_idx=axis_IDX{ocnt};
	tailside_axis_idx=axis_idx(degree_diff2>90 & degree_diff2<270); % could be empty; note that for a=[], a can only be indexed by [], e.g., a(1) is invalid expression, but a(1:end-1) is valid and yields []
	inter_pixel_distance=distance(lat(tailside_axis_idx(1:end-1)),lon(tailside_axis_idx(1:end-1)),lat(tailside_axis_idx(2:end)),lon(tailside_axis_idx(2:end)),earth_radius);
	inter_pixel_distance(inter_pixel_distance>sqrt(8)*dlon*degree_to_meter)=NaN; % "jumps" will not be counted toward total length
	inter_pixel_distance(~((~islnd(tailside_axis_idx(1:end-1)) & ~islnd(tailside_axis_idx(2:end))) | (~islnd(tailside_axis_idx(1:end-1)) & iscst(tailside_axis_idx(2:end))) | (iscst(tailside_axis_idx(1:end-1)) & ~islnd(tailside_axis_idx(2:end)))))=NaN; % land segments will not be counted toward total length
	tailside_length(icnt)=nansum(inter_pixel_distance);
      end
%--------------------------------------------------------------------------------------------------------------------
      intersect_idx=intersect_idx(intersect_leeward_islnd & intersect_windward_isocn & intersect_leeward2_islnd & intersect_windward2_isocn & tailside_length>0.5*length_limit); % (1) IVT at landfall is directed onshore, (2) object-mean IVT is directed onshore, and (3) ocean part of tail has notable length
      if ~isempty(intersect_idx)
	[dummy,max_loc]=max(ivt(intersect_idx));
	lfloc_map(intersect_idx(max_loc))=ocnt;
      end
    end
  end
  num_object_each_step_each_stage(tcnt,7)=numel(unique(lfloc_map(lfloc_map~=0)));

  % prepare ("squeeze") data for possible file output
  unique_val=unique(shape_map(shape_map~=0)); % unique non-zero values
  prelimtip_map(~ismember(prelimtip_map,unique_val))=0;
  axis_map(~ismember(floor(axis_map),unique_val))=0;
  lfloc_map(~ismember(lfloc_map,unique_val))=0;
  unique_val=[unique_val(ismember(unique_val,lfloc_map));unique_val(~ismember(unique_val,lfloc_map))]; % put landfalling ARs in front of non-landfalling ARs
  shape_map_tmp=zeros(size(shape_map));
  prelimtip_map_tmp=zeros(size(prelimtip_map));
  axis_map_tmp=zeros(size(axis_map));
  lfloc_map_tmp=zeros(size(lfloc_map));
  for ucnt=1:numel(unique_val)
    shape_map_tmp(shape_map==unique_val(ucnt))=ucnt;
    prelimtip_map_tmp(prelimtip_map==unique_val(ucnt))=ucnt;
    axis_map_tmp(floor(axis_map)==unique_val(ucnt))=axis_map(floor(axis_map)==unique_val(ucnt))-floor(axis_map(floor(axis_map)==unique_val(ucnt)))+ucnt;
    lfloc_map_tmp(lfloc_map==unique_val(ucnt))=ucnt;
  end
  shape_map=shape_map_tmp;
  prelimtip_map=prelimtip_map_tmp;
  axis_map=axis_map_tmp;
  lfloc_map=lfloc_map_tmp;
  object_IVTX=object_IVTX(unique_val); % note: enclose indices in smooth parentheses, (), to refer to sets of cells
  object_IVTY=object_IVTY(unique_val);
  object_IVTDIR=object_IVTDIR(unique_val);
  object_IVTDIRCOHERENCE=object_IVTDIRCOHERENCE(unique_val);
  centroid_LON=centroid_LON(unique_val);
  centroid_LAT=centroid_LAT(unique_val);
  axis_IDX=axis_IDX(unique_val);
  object_LENGTH=object_LENGTH(unique_val);
  object_WIDTH=object_WIDTH(unique_val);

  % output maps (.nc)
  ncwrite(outfile,'shape',reshape(shape_map,[nrow,ncol,1]),[1,1,tcnt]); % note: shape_map is not a label matrix (same-valued pixels are not necessarily in a contiguous region)
  ncwrite(outfile,'axis',reshape(axis_map,[nrow,ncol,1]),[1,1,tcnt]); % note: floor(axis_map) is not a label matrix (same-valued pixels are not necessarily in a contiguous region)
  ncwrite(outfile,'lfloc',reshape(lfloc_map,[nrow,ncol,1]),[1,1,tcnt]); % note: lfloc_map is not a label matrix (same-valued pixels are not necessarily in a contiguous region)

  % output statistics (.txt)
  for ucnt=1:numel(unique_val) % note: use ucnt to index output below
    tip_LON=lon(axis_map==min(axis_map(floor(axis_map)==ucnt)) | axis_map==max(axis_map(floor(axis_map)==ucnt)));
    tip_LAT=lat(axis_map==min(axis_map(floor(axis_map)==ucnt)) | axis_map==max(axis_map(floor(axis_map)==ucnt)));
    if abs(tip_LAT(1))<abs(tip_LAT(2))
      equatorward_tip_lon=tip_LON(1);
      equatorward_tip_lat=tip_LAT(1);
      poleward_tip_lon=tip_LON(2);
      poleward_tip_lat=tip_LAT(2);
    else
      equatorward_tip_lon=tip_LON(2);
      equatorward_tip_lat=tip_LAT(2);
      poleward_tip_lon=tip_LON(1);
      poleward_tip_lat=tip_LAT(1);
    end
    lfloc_lon=lon(lfloc_map==ucnt);
    lfloc_lat=lat(lfloc_map==ucnt);
    lfloc_ivtx=ivtx(lfloc_map==ucnt);
    lfloc_ivty=ivty(lfloc_map==ucnt);
    lfloc_ivtdir=mod(90-atan2(lfloc_ivty,lfloc_ivtx)/pi*180,360); % [0,360) [degree]; 0=IVT pointing northward, 90=eastward, etc. (i.e., increases clockwise); consistent with azimuth
    if isempty(lfloc_lon)
      lfloc_lon=NaN;
      lfloc_lat=NaN;
      lfloc_ivtx=NaN;
      lfloc_ivty=NaN;
      lfloc_ivtdir=NaN;
    end
    line=[ ...
	year(tcnt), ...
	month(tcnt), ...
	day(tcnt), ...
	hour(tcnt), ...
	object_LENGTH{ucnt}/1e3, ...
	object_WIDTH{ucnt}/1e3, ...
	mod(centroid_LON{ucnt},360), ...
	centroid_LAT{ucnt}, ...
	mod(equatorward_tip_lon,360), ...
	equatorward_tip_lat, ...
	mod(poleward_tip_lon,360), ...
	poleward_tip_lat, ...
	object_IVTX{ucnt}, ...
	object_IVTY{ucnt}, ...
	object_IVTDIR{ucnt}, ...
	object_IVTDIRCOHERENCE{ucnt}, ...
	mod(lfloc_lon,360), ...
	lfloc_lat, ...
	lfloc_ivtx, ...
	lfloc_ivty, ...
	lfloc_ivtdir, ...
	 ]; % note: enclose indices in curly braces, {}, to refer to the text, numbers, or other data within individual cells
    fprintf(statfid,'%4i %2i %2i %2i %7.1f %7.1f %8.3f %8.3f %8.3f %8.3f %8.3f %8.3f %8.1f %8.1f %8.3f %5.3f %8.3f %8.3f %8.1f %8.1f %8.3f\n',line);
  end
  
end
%
% loop over time: end
%

if ~strcmp(ivtxext,'.nc')
  fclose(ivtfid);
end
fclose(statfid);

disp(' ');
wall_time=toc;
if wall_time<60
  fprintf(1,'Program successfully ended after %.1f second(s).\n',wall_time);
elseif wall_time<3600
  fprintf(1,'Program successfully ended after %.1f minute(s).\n',wall_time/60);
else
  fprintf(1,'Program successfully ended after %.1f hour(s).\n',wall_time/3600);
end

return

