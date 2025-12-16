function [x1 y1 z1]=smoothwk(x,y,z,wsize_x,wsize_y)
bx=ones(1,wsize_x)/wsize_x;
by=ones(1,wsize_y)/wsize_y;
x1=filter(bx,1,x);
y1=filter(by,1,y);
for i=1:length(z(:,1))
  z1(i,:)=filter(bx,1,z(i,:));
end
for i=1:length(z(1,:))
  z2(:,i)=filter(by,1,z1(:,i));
end
z1=z2;
return
