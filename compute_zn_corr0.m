function [r]=compute_zn_corr0(a,b,opt)
ny=length(a(1,:)); nt=length(a(:,1)); nyr=nt/365;
if (opt==1)    %interannual variation of daily zonal mean
  a=reshape(a,365,nt/365,ny); aclim=mean(a,2);
  b=reshape(b,365,nt/365,ny); bclim=mean(b,2);
  for t=1:nyr
    a(:,t,:)=a(:,t,:)-aclim(:,1,:);
    b(:,t,:)=b(:,t,:)-bclim(:,1,:);
  end
  a=reshape(a,nt,ny);
  b=reshape(b,nt,ny);
elseif(opt==2) %interannual variation of annual zonal mean
  a=reshape(a,365,nt/365,ny); a=squeeze(mean(a,1));
  b=reshape(b,365,nt/365,ny); b=squeeze(mean(b,1));
end

c=a-b; 
for j=1:ny
  x=corrcoef(a(:,j),b(:,j));  r.idwei(j)=x(1,2);
  x=corrcoef(a(:,j),c(:,j));  r.ndwei(j)=x(1,2);
  x=corrcoef(b(:,j),c(:,j));  r.inwei(j)=x(1,2);
end

return

figure; 
plot(r.al.prday.idwei,'r'); hold on;
plot(r.al.prday.ndwei,'g'); 
plot(r.al.prday.inwei,'b');

figure; 
plot(r.al.lwcf.idwei,'r'); hold on;
plot(r.al.lwcf.ndwei,'g'); 
plot(r.al.lwcf.inwei,'b');

figure; 
plot(r.al.swcf.idwei,'r'); hold on;
plot(r.al.swcf.ndwei,'g'); 
plot(r.al.swcf.inwei,'b');

figure; 
plot(r.al.ttcf.idwei,'r'); hold on;
plot(r.al.ttcf.ndwei,'g'); 
plot(r.al.ttcf.inwei,'b');
