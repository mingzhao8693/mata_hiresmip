function [var,time]=readallyear_mon_reg(v,exd,varn,exf1,exf2,exf3,m,opt,lev)
tpath=v.tpath; expn=v.expn; yr1=v.yr1; yr2=v.yr2; nyr=v.nyr;
if m==0
  dbeg=v.d_beg(1); dend=v.d_end(12);
else
  dbeg=v.d_beg(m); dend=v.d_end(m);
end
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
  varn
  fn=strcat(tpath,expn,exd,exf1,yr,exf2,yr,exf3,varn,'.nc');disp(fn);
  if (exist(fn,'file') == 2)
    a=ncread(fn,varn,[1 1 tbeg],[Inf Inf tcon]);
  end

  if (exist(fn,'file') == 2)
    time=ncread(fn,'time',tbeg,tcon); %b=ncread(fn,'lat');
  else
    time=[tbeg:tcon];
  end
  
  a=permute(a,[3 2 1]); size(a)

  if m==0
    for i=1:12
      tbeg=v.d_beg(i); 
      tend=v.d_end(i); 
      b=a(tbeg:tend,v.ys:v.ye,v.xs:v.xe);
      if (t==1)
	var(i).a=b;
      else
	var(i).a=cat(1,var(i).a,b);
      end
    end
  else
    b=a(1:tcon,v.ys:v.ye,v.xs:v.xe);
    if (t==1)
      var=b;
    else
      var=cat(1,var,b);
    end
  end
end

return
