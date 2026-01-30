function [var,time]=readallyear_reg_fwihw_all(v,exd,varn,exf1,exf2,exf3,opt,lev)
% this is smart file reading script to allow for
% regional, seasonal, and years selections

tpath=v.tpath; expn=v.expn; yr1=v.yr1; yr2=v.yr2; nyr=v.nyr;

dbeg=v.d_beg(1); dend=v.d_end(end); no=length(v.d_beg);

%varn=["ffmcday","dmcday","dcday","isiday","buiday","fwiday","dsrday",...
%"ffmcdaymax","dmcdaymax","dcdaymax","isidaymax","buidaymax","fwidaymax","dsrdaymax"];

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
  fn=strcat(tpath,expn,exd,exf1,yr,exf2,exf3,'.nc'); disp(fn); size(fn)

  if (exist(fn,'file') == 2)
    a=ncread(fn,varn(1),[1 1 tbeg],[Inf Inf tcon]); ffmc=permute(a,[3 2 1]);
    a=ncread(fn,varn(2),[1 1 tbeg],[Inf Inf tcon]); dmc =permute(a,[3 2 1]);
    a=ncread(fn,varn(3),[1 1 tbeg],[Inf Inf tcon]); dc  =permute(a,[3 2 1]);
    a=ncread(fn,varn(4),[1 1 tbeg],[Inf Inf tcon]); isi =permute(a,[3 2 1]);
    a=ncread(fn,varn(5),[1 1 tbeg],[Inf Inf tcon]); bui =permute(a,[3 2 1]);
    a=ncread(fn,varn(6),[1 1 tbeg],[Inf Inf tcon]); fwi =permute(a,[3 2 1]);
    a=ncread(fn,varn(7),[1 1 tbeg],[Inf Inf tcon]); dsr =permute(a,[3 2 1]);
    end

  if (exist(fn,'file') == 2)
    time=ncread(fn,'time',tbeg,tcon); %b=ncread(fn,'lat');
  else
    time=[tbeg:tcon];
  end

  if v.do_yea==1
    for i=1:no
      var(i).sname=i;
      tbeg=t_beg(i); var(i).tbeg=tbeg;
      tend=t_end(i); var(i).tend=tend;
      b1=ffmc(tbeg:tend,v.ys:v.ye,v.xs:v.xe);
      b2=dmc (tbeg:tend,v.ys:v.ye,v.xs:v.xe);
      b3=dc  (tbeg:tend,v.ys:v.ye,v.xs:v.xe);
      b4=isi (tbeg:tend,v.ys:v.ye,v.xs:v.xe);
      b5=bui (tbeg:tend,v.ys:v.ye,v.xs:v.xe);
      b6=fwi (tbeg:tend,v.ys:v.ye,v.xs:v.xe);
      b7=dsr (tbeg:tend,v.ys:v.ye,v.xs:v.xe);
      mbeg = floor(var(i).tbeg/(30*n))+1;
      mend = floor((var(i).tend+(2*n))/(30*n));
      nt=length(b1(:,1,1)); nt
      var(i).mbeg=mbeg;
      var(i).mend=mend;
      mofy=floor([mbeg:(mend-mbeg+1)/nt:mend+1]); mofy=mofy';
      dofy=[tbeg:1:tend+1]; dofy=dofy';
      year=dofy; year(:)=t;
      if (t==1)
	var(i).ffmc=b1;
	var(i).dmc =b2;
	var(i).dc  =b3;
	var(i).isi =b4;
	var(i).bui =b5;
	var(i).fwi =b6;
	var(i).dsr =b7;
	var(i).mofy=mofy(1:end-1);
	var(i).dofy=dofy(1:end-1);
	var(i).year=year(1:end-1);
	var(i).time=time;
      else
	var(i).ffmc=cat(1,var(i).ffmc,b1);
	var(i).dmc =cat(1,var(i).dmc, b2);
	var(i).dc  =cat(1,var(i).dc,  b3);
	var(i).isi =cat(1,var(i).isi, b4);
	var(i).bui =cat(1,var(i).bui, b5);
	var(i).fwi =cat(1,var(i).fwi, b6);
	var(i).dsr =cat(1,var(i).dsr, b7);
	var(i).mofy=cat(1,var(i).mofy,mofy(1:end-1));
	var(i).dofy=cat(1,var(i).dofy,dofy(1:end-1));
	var(i).year=cat(1,var(i).year,year(1:end-1));
	var(i).time=cat(1,var(i).time,time);
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
      b1=ffmc(tbeg:tend,v.ys:v.ye,v.xs:v.xe);
      b2=dmc (tbeg:tend,v.ys:v.ye,v.xs:v.xe);
      b3=dc  (tbeg:tend,v.ys:v.ye,v.xs:v.xe);
      b4=isi (tbeg:tend,v.ys:v.ye,v.xs:v.xe);
      b5=bui (tbeg:tend,v.ys:v.ye,v.xs:v.xe);
      b6=fwi (tbeg:tend,v.ys:v.ye,v.xs:v.xe);
      b7=dsr (tbeg:tend,v.ys:v.ye,v.xs:v.xe);
     if i==no
	var(1).ffmc=cat(1,var(1).ffmc,b1);
	var(1).dmc =cat(1,var(1).dmc, b2);
	var(1).dc  =cat(1,var(1).dc,  b3);
	var(1).isi =cat(1,var(1).isi, b4);
	var(1).bui =cat(1,var(1).bui, b5);
	var(1).fwi =cat(1,var(1).fwi, b6);
	var(1).dsr =cat(1,var(1).dsr, b7);
	var(1).tbeg=tbeg;
	%var(1).mbeg=floor(tbeg/30)+1;
      else
	var(i).sname=sname(i);
	var(i).tbeg=tbeg; var(i).tend=tend;
	if (t==1)
	  var(i).ffmc=b1;
	  var(i).dmc =b2;
	  var(i).dc  =b3;
	  var(i).isi =b4;
	  var(i).bui =b5;
	  var(i).fwi =b6;
	  var(i).dsr =b7;
	else
	  var(i).ffmc=cat(1,var(i).ffmc,b1);
	  var(i).dmc =cat(1,var(i).dmc, b2);
	  var(i).dc  =cat(1,var(i).dc,  b3);
	  var(i).isi =cat(1,var(i).isi, b4);
	  var(i).bui =cat(1,var(i).bui, b5);
	  var(i).fwi =cat(1,var(i).fwi, b6);
	  var(i).dsr =cat(1,var(i).dsr, b7);
	end
      end
    end
    for i=1:no-1
      mbeg = floor(var(i).tbeg/(30*n))+1;
      mend = floor((var(i).tend+(2*n))/(30*n));
      nt=length(var(i).ffmc(:,1,1)); nt
      var(i).mbeg=mbeg;
      var(i).mend=mend;
      if (mend>mbeg)
	a=floor([mbeg:(mend-mbeg+1)/nt:mend+1]);
	b=[mbeg:1:mend];
	c=b; c(:)=t;
      else
	mend=mend+12;
	a=floor([mbeg:(mend-mbeg+1)/nt:mend+1]);
	a=mod(a,12);
	a(a==0)=12;
	b=[mbeg:1:mend];
	c=b; c(:)=t;
      end
      var(i).mofy=a(1:end-1);
      var(i).dofy=b(1:end-1);
      var(i).year=c(1:end-1);
    end
  end
end

for i=1:length(var)
  var(i).ffmc=single(var(i).ffmc);
  var(i).dmc =single(var(i).dmc);
  var(i).dc  =single(var(i).dc);
  var(i).isi =single(var(i).isi);
  var(i).bui =single(var(i).bui);
  var(i).fwi =single(var(i).fwi);
  var(i).dsr =single(var(i).dsr);
  var(i).mofy=single(var(i).mofy);
  var(i).dofy=single(var(i).dofy);
  var(i).year=single(var(i).year);
end


return







for i=1:length(var)
  var(i).a=single(var(i).a);
  a=var(i).a;
  var(i).min=min(min(min(a)));
  var(i).max=max(max(max(a)));
  var(i).mean=mean(mean(mean(a)));
end

return

