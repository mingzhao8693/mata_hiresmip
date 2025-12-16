function [x,y]=mizcorrcoef(x,y,ws)
f=ones(1,ws)/ws;
x=filter(f,1,x); 
y=filter(f,1,y);  
n=length(x);
k1=ws; k2=n-ws;
corrcoef(x(k1:k2),y(k1:k2))
