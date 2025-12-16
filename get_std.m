function [sdd avg]=get_std(fa)
nt=length(fa(:,1,1,1));
nz=length(fa(1,:,1,1));
for t=1:nt
  for k=1:nz
    a=squeeze(fa(t,k,:,:));
    id=(a>0); nn=sum(sum(id));
    if (nn>0) %coarse grid is labeled as updraft column if sigma=p.fa_w_sg>0
      avg(t,k)=mean(a(id));%sigma averaged over all updraft subdomain
      sdd(t,k)=std (a(id));%standard deviation of all updraft subdomain
    end
  end
end
