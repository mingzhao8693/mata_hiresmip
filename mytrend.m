function [slop]=mytrend(t,y)
%t=time; a(year)
%y=varb; b(year,mon)
y=circshift(y,[0 1]);%shift so that y(:,1:3) is DJF
nyr=length(y(:,1));
%m=1, m1:m2=1:3 (DJF); m=2, m1:m2=4:6  (MAM);
%m=3, m1:m2=7:9 (JJA); m=4, m1:m2=10:12(SON);
%trend(m+1): 2:DJF; 3:MAM; 4:JJA; 5:SON; 1:Allseason
for m=1:4 
  m1=(m-1)*3+1; m2=m1+2;
  b=mean(y(:,m1:m2),2);
  c=polyfit(t,b,1); 
  slop(m+1)=c(1);
end
m=1; %annual mean
b=mean(b,2);
c=polyfit(t,b,1); 
slop(m)=c(1);
return

