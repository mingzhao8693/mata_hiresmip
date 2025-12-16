function [corr]=mapcorrcoef(x,y,nlat,nlon)
if (length(size(x))==3)
  for j=1:nlat
    for i=1:nlon
      c=corrcoef(x(:,j,i),y(:));
      corr(j,i)=c(1,2);
    end
  end
else
  for j=1:nlat
    c=corrcoef(x(:,j),y(:,j));
    corr(j)=c(1,2);
  end
end
 
return
