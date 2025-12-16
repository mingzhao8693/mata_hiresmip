function v=readjson_new(tpath,fname,N)
%tpath='/home/Ming.Zhao/AM2p12b/ulm/input_ulm/mata_ulm/PMP-cmip5-amip-clims/';
%fext='_2.5x2.5_esmf_linear_metrics.json'; N=30
%vn='pr';   fname=strcat(vn,fext); 
%vn='rlut'; fname=strcat(vn,fext);
%vn='rst';  fname=strcat(vn,fext);

fn=strcat(tpath,fname);fn
fid=fopen(fn,'r');
tline = fgets(fid);
tline = fgets(fid);
tline = fgets(fid);
for j=1:N
  tline = fgets(fid);j
  tline=strtrim(tline);
  if (length(tline)>7)
    id=find(tline=='"');
    nam =tline(id(1)+1:id(2)-1);
    v.modnam{j}=nam; v.modnam{j}
  else
    tline=sprintf('total number of models=%d',length(v.modnam));
    tline
    return
  end
  i=1;
  while (i<1000)
    tline= fgets(fid);
    tline=strtrim(tline);
    if (tline == -1); 
      return;
    elseif (length(tline)>7)
      id=find(tline=='"');
      nam =tline(id(1)+1:id(2)-1);
      if strcmp(nam,'InputRegionFileName')
	tline= fgets(fid); 'end of one model'
	break;
      elseif strcmp(nam,'RegionalMasking')
        for k=1:50
	  tline= fgets(fid);
	end
      elseif strcmp(nam,'global')
	for k=1:36
	  tline= fgets(fid);
	  tline=strtrim(tline);
	  id=find(tline=='"');
	  nam  =tline(id(1)+1:id(2)-1);
	  num  =tline(id(3)+1:id(4)-1);
	  if strcmp(nam,'rms_xy_ann')     %ANN
	    v.glob(1,j)=str2num(num);
	  elseif strcmp(nam,'rms_xy_djf') %MAM
	    v.glob(2,j)=str2num(num); 
	  elseif strcmp(nam,'rms_xy_jja') %JJA
	    v.glob(3,j)=str2num(num); 
	  elseif strcmp(nam,'rms_xy_mam') %SON
	    v.glob(4,j)=str2num(num); 
	  elseif strcmp(nam,'rms_xy_son') %DJF
	    v.glob(5,j)=str2num(num); 
	  elseif strcmp(nam,'rms_xyt_ann')%ALL
	    v.glob(6,j)=str2num(num);
	  end
	end
      elseif strcmp(nam,'TROPICS')
	for k=1:36
	  tline= fgets(fid);
	  tline=strtrim(tline);
	  id=find(tline=='"');
	  nam  =tline(id(1)+1:id(2)-1);
	  num  =tline(id(3)+1:id(4)-1);
	  if strcmp(nam,'rms_xy_ann')     %ANN
	    v.trop(1,j)=str2num(num);
	  elseif strcmp(nam,'rms_xy_djf') %MAM
	    v.trop(2,j)=str2num(num); 
	  elseif strcmp(nam,'rms_xy_jja') %JJA
	    v.trop(3,j)=str2num(num); 
	  elseif strcmp(nam,'rms_xy_mam') %SON
	    v.trop(4,j)=str2num(num); 
	  elseif strcmp(nam,'rms_xy_son') %DJF
	    v.trop(5,j)=str2num(num); 
	  elseif strcmp(nam,'rms_xyt_ann')%ALL
	    v.trop(6,j)=str2num(num);
	  end
	end
      elseif strcmp(nam,'NHEX')
	for k=1:36
	  tline= fgets(fid);
	  tline=strtrim(tline);
	  id=find(tline=='"');
	  nam  =tline(id(1)+1:id(2)-1);
	  num  =tline(id(3)+1:id(4)-1);
	  if strcmp(nam,'rms_xy_ann')     %ANN
	    v.nhex(1,j)=str2num(num);
	  elseif strcmp(nam,'rms_xy_djf') %MAM
	    v.nhex(2,j)=str2num(num); 
	  elseif strcmp(nam,'rms_xy_jja') %JJA
	    v.nhex(3,j)=str2num(num); 
	  elseif strcmp(nam,'rms_xy_mam') %SON
	    v.nhex(4,j)=str2num(num); 
	  elseif strcmp(nam,'rms_xy_son') %DJF
	    v.nhex(5,j)=str2num(num); 
	  elseif strcmp(nam,'rms_xyt_ann')%ALL
	    v.nhex(6,j)=str2num(num);
	  end
	end
      elseif strcmp(nam,'SHEX')
	for k=1:36
	  tline= fgets(fid);
	  tline=strtrim(tline);
	  id=find(tline=='"');
	  nam  =tline(id(1)+1:id(2)-1);
	  num  =tline(id(3)+1:id(4)-1);
	  if strcmp(nam,'rms_xy_ann')     %ANN
	    v.shex(1,j)=str2num(num);
	  elseif strcmp(nam,'rms_xy_djf') %MAM
	    v.shex(2,j)=str2num(num); 
	  elseif strcmp(nam,'rms_xy_jja') %JJA
	    v.shex(3,j)=str2num(num); 
	  elseif strcmp(nam,'rms_xy_mam') %SON
	    v.shex(4,j)=str2num(num); 
	  elseif strcmp(nam,'rms_xy_son') %DJF
	    v.shex(5,j)=str2num(num); 
	  elseif strcmp(nam,'rms_xyt_ann')%ALL
	    v.shex(6,j)=str2num(num);
	  end
	end
      end
    end
    i=i+1;
  end
  
end
fclose(fid); 
return



%tpath='/home/Ming.Zhao/AM2p12b/ulm/input_ulm/mata_ulm/CMIP5/amip/';
%tpath='/home/Ming.Zhao/AM2p12b/ulm/input_ulm/mata_ulm/CMIP5_new/PMP-cmip5-amip-clims/';
tpath='/home/Ming.Zhao/AM2p12b/ulm/input_ulm/mata_ulm/PMP-cmip5-amip-clims/';
fname='pr_2.5x2.5_esmf_linear_metrics.json'; N=30;
fname='rlut_2.5x2.5_esmf_linear_metrics.json'; N=30
fname='tas_2.5x2.5_esmf_linear_metrics.json'; N=30

vm=readjson_new(tpath,fname,30)

tpath='/home/Ming.Zhao/AM2p12b/ulm/input_ulm/mata_ulm/';
fname='pr_2.5x2.5_esmf_linear_metrics.json'
v1=readjson(tpath,fname,1)

figure;
x=[1:4]; msize=10
y=[vm.ann.glob; vm.ann.trop; vm.ann.nhex; vm.ann.shex]; y=y';
boxplot(y,'whisker',5); hold on;
plot(1,v1.ann.glob,'rp','MarkerSize',msize);
plot(2,v1.ann.trop,'rp','MarkerSize',msize);
plot(3,v1.ann.nhex,'rp','MarkerSize',msize);
plot(4,v1.ann.shex,'rp','MarkerSize',msize);
