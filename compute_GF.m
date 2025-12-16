function v=compute_GF(s, wei, R, p, p_thresh)
%wei=s.wei; R=s.R; p=s.p_R; p_thresh=0.05; 
R = R .* (p < p_thresh);
for m=1:12; m
  a=R(:,:,m); a=squeeze(a); a=wei*a'; v.gf(m,:,:)=a;
end

v.gf_ann=squeeze(mean(v.gf,1)); 

aa=reshape(s.aa',144*90,1); aa=repmat(aa,[1 144*90]);
var=aa.*v.gf_ann; 
a=squeeze(sum(var,2)); a=reshape(a,144,90); a=a';

v.gf_ann_g=a; v.gf_ann_g0=mean(mean(a.*s.aa));

a=squeeze(sum(var,1)); a=reshape(a,144,90); a=a';
v.gf_ann_u=a; v.gf_ann_u0=mean(mean(a.*s.aa));

return
