function zmean=zmeanwithmask(a,id)
nlon=length(a(1,:)); 
nlat=length(a(:,1));
for j=1:nlat
  id1=(id(j,:)==1);
  tmp=a(j,id1);
  if (isempty(tmp) | sum(id1)<0.4*nlon)
    zmean(j)=NaN;
  else
    zmean(j)=mean(tmp);
  end
end
