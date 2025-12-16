function [z,plev]=vslice_1var(var,m)
%a=mv; var=v0.atm.om;
%plev={'1000', '925', '850','775','700','600','500','400','300','250','200','150','100','70','50'};

%m is for season
nlev=length(var);
for k=1:nlev
  y=squeeze(var(k).sea(m,:,:));
  z(k,:,:)=y;
end
  
return


%compute RMSE  
a=zb; b=zb;
for k=1:length(zb(:,1))
  a(k,:)=aa;
end
dp=dp./mean(dp);
for j=1:length(zb(1,:))
  b(:,j)=dp;
end

id=~isnan(zb);
e=zb(id).*a(id).*b(id);
rmse=sqrt(mean(e.*e));

return


