function read_co2_gblannualdata
fnin='co2_gblannualdata';
fnout=strcat(fnin,'_4xco2');
  
fid=fopen(fnin,'r');
num=fscanf(fid,'%d',1);
for i=1:num
  yyy(i)  =fscanf(fid,'%f',1); 
  co2(i)  =fscanf(fid,'%f',1);
end
fclose(fid);

fout=fopen(fnout,'w');
fprintf(fout,'%11d\n',num);
for i=1:num
  fprintf(fout,'%12.4f %12.4f\n', yyy(i), 4*co2(i));
end
fclose(fout);

return

