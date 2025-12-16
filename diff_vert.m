function [dthv]=diff_vert(thv,order,dim)
a=diff(thv,order,dim); dthv=thv;
dthv(:,2:end-1,:,:) = (a(:,1:end-1,:,:) + a(:,2:end,:,:))*0.5;
dthv(:,1,  :,:)=a(:,1,  :,:);
dthv(:,end,:,:)=a(:,end,:,:);
return
