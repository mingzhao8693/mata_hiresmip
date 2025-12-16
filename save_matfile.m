function save_matfile(v,tpath,expn,region,ext,opt);
%tpath='/work/miz/mat_aqua/'; 
disp('saving mat file ...'); 

v.aa=0; v.f=0; v.imk=0;
%v.time=[str2num(yr1):1:str2num(yr1)+nyr];
%n=length(v.time); n=floor(n/5);
%yr=str2num(yr1)-1; v.tpen=[2.5:5:n*5-2.5]+yr;

fn=strcat(tpath,expn,'_',region,'_opt',num2str(opt),'.',ext);fn
save(fn,'v','-v7.3'); %save very large files
%save(fn,'v');
return
