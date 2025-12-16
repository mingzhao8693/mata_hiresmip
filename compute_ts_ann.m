function [ts]=compute_ts_ann(var,v)
var(var==v.missing_value)=NaN;
mm=12; nt=length(var(:,1,1)); nyr=nt/mm;

var_awei=var.*v.aa;
ts.org=squeeze(mean(mean(var_awei,3),2));
ts.mon=reshape(ts.org,nyr,mm);

a=reshape(var_awei,mm,nyr,v.nlat,v.nlon); 
ts.org_ann=squeeze(mean(mean(mean(a,1),3),4));

a=squeeze(mean(a,1));
id_nh=(v.lat>30); id_sh=(v.lat<-30); id_tr=(v.lat>=-30&v.lat<=30);
aa_nh=v.aa0(id_nh,:); 
aa_sh=v.aa0(id_sh,:); 
aa_tr=v.aa0(id_tr,:);
for t=1:nyr;
  gg=squeeze(a(t,:,:));
  nh=squeeze(a(t,id_nh,:));
  sh=squeeze(a(t,id_sh,:));
  tr=squeeze(a(t,id_tr,:));
  b=gg; id=~isnan(b); b=b(id); ts.org_ann_gg(t)=mean(b);
  b=nh; id=~isnan(b); b=b(id); ts.org_ann_nh(t)=mean(b)/mean(aa_nh(id));
  b=sh; id=~isnan(b); b=b(id); ts.org_ann_sh(t)=mean(b)/mean(aa_sh(id));
  b=tr; id=~isnan(b); b=b(id); ts.org_ann_tr(t)=mean(b)/mean(aa_tr(id));
end
wsize=1; b=ones(1,wsize)/wsize; 
a_f=filter(b,1,ts.org_ann);
a_f(1:wsize)=ts.org_ann(1:wsize); 
ts.org_ann_f=a_f;
return
