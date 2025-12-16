function [p]=getstatis(vmod,vobs,aa)
omen =mean(vobs.*aa);
ostd =sqrt(mean(vobs.*vobs.*aa)-omen*omen);%ostd=sqrt(mean((vobs-omen).*(vobs-omen).*aa));
mmen =mean(vmod.*aa);
mstd =sqrt(mean(vmod.*vmod.*aa)-mmen*mmen);%mstd=sqrt(mean((vmod-omen).*(vmod-omen).*aa));
vdif =(vmod-vobs).*(vmod-vobs);
corr =(mean(vmod.*vobs.*aa)-mmen*omen)/(mstd*ostd);%corr=corrcoef(vmod,vobs);
rmse =sqrt(mean(vdif.*aa));
rmsn =rmse/ostd;
bias =mean(vmod.*aa)-mean(vobs.*aa);
p.bias=bias;
p.rmse=rmse;
p.corr=corr;
p.mstd=mstd;
p.mmen=mmen;
p.omen=omen;
p.ostd=ostd;
return
