function [y2]=mizsmooth(y,wsize)
b=ones(1,wsize)/wsize; 
y=reshape(y,length(y),1);
y1=filter(b,1,y);
nn=floor(wsize/2);
y2=circshift(y1,-nn);
y2(1:nn)=y(1:nn);
y2(end-nn:end)=y(end-nn:end);
return

dy1=y2;
figure; plot(dy,'r*'); hold on; plot(dy1,'bs-');
