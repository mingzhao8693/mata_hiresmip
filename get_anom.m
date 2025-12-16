function [varp]=get_anom(var)
a=squeeze(mean(mean(mean(var,4),3),1));
nz=length(a);
for k =1:nz
  varp(:,k,:,:)=var(:,k,:,:)-a(k);
end
return
