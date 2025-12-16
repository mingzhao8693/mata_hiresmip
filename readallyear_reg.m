function [var,time]=readallyear_reg(v,exd,varn,exf1,exf2,exf3,opt,lev)
tpath=v.tpath; expn=v.expn; yr1=v.yr1; yr2=v.yr2; nyr=v.nyr;

dbeg=v.d_beg(1); dend=v.d_end(end); no=length(v.d_beg);

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
%  disp(strcat(yr,':mon=', num2str(m))); %dbeg=d_beg(m); dend=d_end(m);
  if strcmp(opt,'day')
    n=1; %tbeg=dbeg; tend=dend;
  elseif strcmp(opt,'6hr')
    n=4; %tbeg=(dbeg-1)*4+1; tend=dend*4; %t_beg=(v.d_beg(:)-1)*4+1; t_end=(v.d_end(:)-1)*4+1;
  elseif strcmp(opt,'3hr')
    n=8; %tbeg=(dbeg-1)*8+1; tend=dend*8; %t_beg=(v.d_beg(:)-1)*8+1; t_end=(v.d_end(:)-1)*4+1;
  else
    n=1; %tbeg=(dbeg-1)*4+1; tend=dend*4; 
  end
  tbeg=(dbeg-1)*n+1; tend=dend*n; tcon=tend-tbeg+1; 
  t_beg=(v.d_beg(:)-1)*n+1;
  t_end=(v.d_end(:)-1)*n+1;
  
  days=strcat('dbeg=',num2str(dbeg),'; dend=',num2str(dend));
  disp(strcat(days,'; tbeg=',num2str(tbeg),'; tend=',num2str(tend),'; tcon=',num2str(tcon)));
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

  if v.do_yea==1
    for i=1:no
      var(i).sname=i;
      tbeg=t_beg(i); var(i).tbeg=tbeg;
      tend=t_end(i); var(i).tend=tend;
      b=a(tbeg:tend,v.ys:v.ye,v.xs:v.xe);
      mbeg = floor(var(i).tbeg/(30*n))+1;
      mend = floor((var(i).tend+(2*n))/(30*n));
      nt=length(b(:,1,1)); nt
      var(i).mbeg=mbeg;
      var(i).mend=mend;
      mmon=floor([mbeg:(mend-mbeg+1)/nt:mend+1]); mmon=mmon';
      if (t==1)
	var(i).a=b;
	var(i).mmon=mmon(1:end-1);
      else
	var(i).a=cat(1,var(i).a,b);
	var(i).mmon=cat(1,var(i).mmon,mmon(1:end-1));
      end
    end
  else
    if v.do_sea==1
      sname={'DJF','MAM','JJA','SON'}; %i=1-4: DJF, MAM, JJA, SON
    elseif v.do_hyr==1
      sname={'ONDJFM','AMMJJAS'}; %i=1-2: ONDJFM, AMMJJAS
    end
    sname
    t_beg
    t_end
    no
    for i=1:no 
      tbeg=t_beg(i);
      tend=t_end(i);
      b=a(tbeg:tend,v.ys:v.ye,v.xs:v.xe);
      if i==no
	var(1).a=cat(1,var(1).a,b);
	var(1).tbeg=tbeg;
	%var(1).mbeg=floor(tbeg/30)+1;
      else
	var(i).sname=sname(i);
	var(i).tbeg=tbeg; var(i).tend=tend;
	if (t==1)
	  var(i).a=b;
	else
	  var(i).a=cat(1,var(i).a,b);
	end
      end
    end
    for i=1:no-1
      mbeg = floor(var(i).tbeg/(30*n))+1;
      mend = floor((var(i).tend+(2*n))/(30*n));
      nt=length(var(i).a(:,1,1)); nt
      var(i).mbeg=mbeg;
      var(i).mend=mend;
      if (mend>mbeg)
	a=floor([mbeg:(mend-mbeg+1)/nt:mend+1]);
      else
	mend=mend+12;
	a=floor([mbeg:(mend-mbeg+1)/nt:mend+1]);
	a=mod(a,12);
	a(a==0)=12;
      end
      var(i).mmon=a(1:end-1);
    end
  end
end

for i=1:length(var)
  a=var(i).a;
  var(i).min=min(min(min(a)));
  var(i).max=max(max(max(a)));
  var(i).mean=mean(mean(mean(a)));
  
end

return

