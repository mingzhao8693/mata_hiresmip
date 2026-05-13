function [id,ev]=findevents(a,time,thresh,minlen,opt)
  if (opt==0);
    id=(a>=thresh);
  else
    id=(a<=thresh);
  end
  events = bwlabel(id);
  nE = max(events); 
  ev = struct([]);
  n=0;
  for i = 1:nE
    idx = (events == i);
    if sum(idx) >= minlen
      n=n+1;
      ev(n).t_beg = min(time(idx));
      ev(n).t_end = max(time(idx));
      ev(n).duration = sum(idx);
      ev(n).mean= mean(a(idx));
      ev(n).max = max (a(idx));
      id(idx)=1;
    else
      id(idx)=0;
    end
  end
  return

