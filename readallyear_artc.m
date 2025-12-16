function [var time]=readallyear_artc(v,exd,varn,exf1,exf2,exf3,m,opt,lev)
tpath=v.tpath; expn=v.expn; yr1=v.yr1; yr2=v.yr2; nyr=v.nyr;
dbeg=v.d_beg(m); dend=v.d_end(m);
%mon=[31 28 31 30 31 30 31 31 30 31 30 31]; m=mmm;
%ddd=cumsum(mon); d_beg=[1 ddd+1]; d_end=ddd; 

for t=1:nyr
  yrt=yr1+t-1; 
  if (yrt<10)
    yr=strcat('000',num2str(yrt));
  elseif (yrt<100)
    yr=strcat('00',num2str(yrt));
  elseif (yrt<1000)
    yr=strcat('0',num2str(yrt));
  else
    yr=num2str(yrt);
  end
  disp(strcat(yr,':mon=', num2str(m))); %dbeg=d_beg(m); dend=d_end(m);
  if strcmp(opt,'day')
    tbeg=dbeg; tend=dend;
  elseif strcmp(opt,'3hr')
    tbeg=(dbeg-1)*8+1; tend=dend*8; 
  else
    tbeg=(dbeg-1)*4+1; tend=dend*4; 
  end
  tcon=tend-tbeg+1; 
  
  days=strcat('days:',num2str(dbeg),'-',num2str(dend));
  disp(strcat(days,';',num2str(tbeg),':',num2str(tend),':',num2str(tcon)));
  
  if strcmp(varn,'AR')
    fn=strcat(tpath,expn,exd,expn,'_',yr,'.shape.nc');disp(fn);
    a=ncread(fn,'shape_ar',[1 1 tbeg],[Inf Inf tcon]); 
  elseif strcmp(varn,'TC')
    fn=strcat(tpath,expn,exd,expn,'_',yr,'.shape.nc');disp(fn);
    a=ncread(fn,'shape_tc',[1 1 tbeg],[Inf Inf tcon]); 
  elseif strcmp(varn,'TD')
    fn=strcat(tpath,expn,exd,expn,'_',yr,'.shape.nc');disp(fn);
    a=ncread(fn,'shape_td',[1 1 tbeg],[Inf Inf tcon]); 
  elseif strcmp(varn,'ET')
    fn=strcat(tpath,expn,exd,expn,'_',yr,'.shape.nc');disp(fn);
    a=ncread(fn,'shape_et',[1 1 tbeg],[Inf Inf tcon]); 
  elseif (length(varn)>6 & strcmp(varn(end-5:end),'_unmsk'))
    fn=strcat(tpath,expn,exd,exf1,yr,exf2,yr,exf3,varn,'.nc');disp(fn);
    a=ncread(fn,varn,[1 1 lev tbeg],[Inf Inf 1 tcon]);
    a=squeeze(a);
  else
    fn=strcat(tpath,expn,exd,exf1,yr,exf2,yr,exf3,varn,'.nc');disp(fn);
    a=ncread(fn,varn,[1 1 tbeg],[Inf Inf tcon]); 
  end

  time=ncread(fn,'time',tbeg,tcon); %b=ncread(fn,'lat');
  a=permute(a,[3 2 1]); 
  if (t==1)
    var=a(1:tcon,:,:);
  else
    var=cat(1,var,a(1:tcon,:,:));
  end
  
end
