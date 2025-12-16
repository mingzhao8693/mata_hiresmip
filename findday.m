function [a]=findday(id,day0)
 a=id;
 for i=1:length(id(:,1,1))
   j=i+(365-day0); %j=mod(j,365)+1;
   a(i,:,:)=mod(j,365)+1;
 end
 a(~id)=NaN;
 return
