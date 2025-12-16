function [a1]=compute_se(a1,s1,n1,num,opt)
%a1=squeeze(v1.tc.prday_idavg); 
%s1=squeeze(v1.tc.prday_idstd); 
%n1=squeeze(v1.tc.id_sum);      

c1  = s1.^2./n1;
se  = sqrt(c1);

id1= (n1<num); 
id2=abs(a1)<se;
%id=id1|id2;

if ~exist('opt')
  id=id1|id2;
elseif (opt==1)
  id=id1;
else
  id=id1; id(:,:)=0; 
  disp('not doing masking');
end
a1(id) =NaN;

return

