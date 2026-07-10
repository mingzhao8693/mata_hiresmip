function z0=obtain_anom(z0)
  subnames = fieldnames(z0);
  for i=1:length(subnames)
    nam=subnames{i};
    tmp=z0.(nam); 
    if length(size(tmp))==4
      nyr=length(tmp(:,1,1,1));
      a=z0.clm.(nam);
      a=repmat(reshape(a,[1,size(a)]),[nyr,1,1,1]);
      z0.(nam)=tmp-a;
    end
  end
  return
