function tr=get_trend(t,y)
nlat=length(y(1,1,:,1));
nlon=length(y(1,1,1,:));
for j=1:nlat
  for i=1:nlon
    x=squeeze(y(:,:,j,i));
    tr(:,j,i)=mytrend(t,x);
  end
%  j
end

return

