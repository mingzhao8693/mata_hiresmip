function x_m=mybandpass(x,b1,b2)
%x=v.ind.olr_ano;
L=length(x); NFFT=L; 
Y=fft(x,NFFT)/L; 
%xi= ifft(Y*L); %figure; plot(x,'r*-'); hold on; plot(xi,'bs-');
hNFFT=floor(NFFT/2);
wno=[0:hNFFT]; wlen=L./wno; wlen(1)=hNFFT*2;
amp= 2*abs(Y(1:hNFFT+1)); %amp is amplitude of the wave
%figure; plot(wlen,amp,'-s'); axis([0 200 0 6]); grid on;

id=(wlen>=b1) & (wlen<=b2);
k1=min(find(id==1));
k2=max(find(id==1)); 
%figure; plot(id); figure; plot(wlen); figure; plot(wlen,id);

Y_m=Y*L;   %xi=ifft(Y_m);figure;plot(x,'r*-');hold on;plot(xi,'bs-');
a=zeros(length(Y),1);
a(k1+1:k2+1)=1; a(end-k2+1:end-k1+1)=1;
Y_m=Y_m.*a;

x_m=ifft(Y_m);%figure;plot(x,'r*-');hold on;plot(x_m,'bs-');
%x_m=real(x_m);

return



figure; plot(x,'r*-'); hold on; plot(real(x_m),'bs-');

Y_m  =fft(x_m,NFFT)/L; 
amp_m=2*abs(Y_m(1:NFFT/2+1)); 
figure; 
plot(wlen,amp,  '-r*'); hold on;
plot(wlen,amp_m,'-bs');

