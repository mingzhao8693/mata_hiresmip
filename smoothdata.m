function [z1]=smoothdata(z,wsize_x,wsize_y)
%wsize_x=1; wsize_y=1;
bx=ones(1,wsize_x)/wsize_x;
by=ones(1,wsize_y)/wsize_y;
bgx=floor((wsize_x+1)/2);
bgy=floor((wsize_y+1)/2);

z1=z;
for i=1:length(z(:,1))
  zx=filter(bx,1,z(i,:)); 
  z1(i,bgx:end-bgx+1)=zx(2*bgx-1:end);
end

for i=1:length(z1(1,:))
  zx=filter(by,1,z1(:,i));
  z1(bgy:end-bgy+1,i)=zx(2*bgy-1:end);
end

return

x=z1(1,:); wsize=3; b=ones(1,wsize)/wsize;
bgx=floor((wsize+1)/2);
y=filter(b,1,x); xn=x; xn(bgx:end-bgx+1)=y(2*bgx-1:end);
figure; plot(x,'r*-'); hold on; plot(y,'bs-'); plot(xn,'gd-');
