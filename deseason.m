function y=deseason(var,wsize)
%x cover time period 03/2000-12/2014; 178 months
%g=o.ceres_ts_global.toa.netrad.ts; %03/2000-02/2016; 192 months
%var=g(1:end-14);                   %03/2000-12/2014; 178 months

x=var(1:end-10); %03/2000-02/20; take only full chunks to compute climatology
nyr=length(x)/12; 
xc=reshape(x,12,nyr); xc=xc'; xc=mean(xc,1);
a=repmat(xc,1,nyr+1); a=a'; a=a(1:end-2);
y.anom=var-a;
b=ones(1,wsize)/wsize;
y.anom=filter(b,1,y.anom);
y.time=[2000+3/12:1/12:2015];
return
figure; 
plot(y.time,var,   'r'); hold on;
plot(y.time,a,     'g'); hold on;
plot(y.time,y.anom,'b'); hold on;
return

