function x=getfx_sig(vx,nn,opt);
if strcmp(opt,'wqt500')
  for i=1:nn; wphi(i)=vx.r(i).wqt500; end
elseif strcmp(opt,'whli500')
  for i=1:nn; wphi(i)=vx.r(i).whli500; end
elseif strcmp(opt,'wmse500')
  for i=1:nn; wphi(i)=vx.r(i).wmse500; end
elseif strcmp(opt,'wqt3km')
  for i=1:nn; wphi(i)=vx.r(i).wqt3km; end
elseif strcmp(opt,'whli3km')
  for i=1:nn; wphi(i)=vx.r(i).whli3km; end
elseif strcmp(opt,'wmse3km')
  for i=1:nn; wphi(i)=vx.r(i).wmse3km; end
elseif strcmp(opt,'wqt2km')
  for i=1:nn; wphi(i)=vx.r(i).wqt2km; end
elseif strcmp(opt,'whli2km')
  for i=1:nn; wphi(i)=vx.r(i).whli2km; end
elseif strcmp(opt,'wmse2km')
  for i=1:nn; wphi(i)=vx.r(i).wmse2km; end
end

i=1; a=wphi(i); 
x=get_fx_sigma(a);
flx_edd=x.fx_edd_avg;
flx_tot=x.fx_tot_avg;
pdf_sig=x.pdf_sigma;
sbin=x.sbin; nbin=x.nbin; binc=x.binc;
for i=2:nn
  a=wphi(i);
  x=get_fx_sigma(a);
  flx_edd=[flx_edd; x.fx_edd_avg];
  flx_tot=[flx_tot; x.fx_tot_avg];
  pdf_sig=[pdf_sig; x.pdf_sigma];
end
clear x
x.flx_edd=flx_edd;
x.flx_tot=flx_tot;
x.ratio=x.flx_edd./x.flx_tot;
x.pdf_sig=pdf_sig;
x.sbin=sbin; 
x.nbin=nbin; 
x.binc=binc;

return
