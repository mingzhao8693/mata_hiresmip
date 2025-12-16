function [ar]=readar_py(tpath,expn,yr,opt)
%tpath='/archive/Ming.Zhao/awg/warsaw_201710/';
%expn ='c192L33_am4p0_amip_HIRESMIP_H8'; yr=1950; opt=1;
fn=strcat(tpath,expn,'/AR_py/','AR_features_',num2str(yr),'.csv');disp(fn);
fid=fopen(fn,'r'); tmp=fscanf(fid,'%s',1); disp(tmp); 
n=1;
if (opt==0)
  while (1 > 0)
    yyy  =fscanf(fid,'%d',1);
    if isempty(yyy); break; end;
    ar(n).yyy  =yyy;                a=fscanf(fid,'%c',1);
    ar(n).mmm  =fscanf(fid,'%d',1); a=fscanf(fid,'%c',1);
    ar(n).ddd  =fscanf(fid,'%d',1); a=fscanf(fid,'%c',1);
    ar(n).hrs  =fscanf(fid,'%d',1); a=fscanf(fid,'%c',1); 
    ar(n).leng =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).widt =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).clon =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).clat =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).wlon =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).elat =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).elon =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).plat =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).ivtz =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).ivtm =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).ivtd =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).ivti =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).coh  =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).llon =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).llat =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).IVTZ =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).IVTM =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1); 
    ar(n).IVTD =fscanf(fid,'%f',1);
    n=n+1; %disp(n)
  end
else
  while (1 > 0)
    yyy  =fscanf(fid,'%d',1); %disp(yyy)
    if isempty(yyy); break; end;
    ar.yyy(n)  =yyy;                a=fscanf(fid,'%c',1);
    ar.mmm(n)  =fscanf(fid,'%d',1); a=fscanf(fid,'%c',1);
    ar.ddd(n)  =fscanf(fid,'%d',1); a=fscanf(fid,'%c',1);
    ar.hrs(n)  =fscanf(fid,'%d',1); a=fscanf(fid,'%c',1);
    ar.leng(n) =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.widt(n) =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.clon(n) =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.clat(n) =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.wlon(n) =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.elat(n) =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.elon(n) =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.plat(n) =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.ivtz(n) =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.ivtm(n) =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.ivtd(n) =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.ivti(n) =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.coh(n)  =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.llon(n) =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.llat(n) =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.IVTZ(n) =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.IVTM(n) =fscanf(fid,'%f',1); a=fscanf(fid,'%c',1);
    ar.IVTD(n) =fscanf(fid,'%f',1);
    n=n+1; %disp(n)
  end
end
fclose(fid);

return

