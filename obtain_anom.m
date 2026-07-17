function z0=obtain_anom(z0)
  varlist={'ice'};
  subnames = fieldnames(z0);
  for i=1:length(subnames)
    nam=subnames{i};
    tmp=z0.(nam);
    id=false;
    for j=1:length(varlist)
      id = id | strcmp(nam,varlist{j});
    end
    if length(size(tmp))==4 & ~id;
      nyr=length(tmp(:,1,1,1));
      a=z0.clm.(nam);
      a=repmat(reshape(a,[1,size(a)]),[nyr,1,1,1]);
      z0.(nam)=tmp-a;
    end
  end
  return
