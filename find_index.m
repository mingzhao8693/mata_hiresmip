function x=find_index(a,N)
for i=1:N
  maxv(i)=max(max(a));
  [t(i),d(i)]=find(a==maxv(i));
  a(t,d)=0;
end
x.t=t; x.d=d; x.maxv=maxv;
return
  
  

