function presmin=getpresmin(var,opt)
if strcmp(opt,'obs')
  id=(var~=-999);
  if sum(id)>0
    presmin=min(var(id));
  else
    presmin=1000.;
  end
else
  presmin=min(var);
end
