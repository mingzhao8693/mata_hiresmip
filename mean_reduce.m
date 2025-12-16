function aa=mean_reduce(a)
nlat=length(a(1,:,1));
x=mean(a,3);
for j=1:nlat/2
  j1=2*j-1;
  j2=2*j;
  aa(:,j)=mean(x(:,j1:j2),2);
end
return
