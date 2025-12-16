function y0=ltrd(y,opt)
t1=1; t2=length(y); 
x=[t1:t2]; 
c=polyfit(x,y,1); %x=[t1:t2+10];
y0=c(1)*x+c(2);
if (opt==1)
  y0=mean(y);
end

return


