function [v]=clearvar(v,opt)
%remove field var except for certain variables
%e.g., tasmaxday twbday vpdday
%if opt==1 don't do anything
if opt==0
  subnames = fieldnames(v)
  for i=1:length(subnames)
    if strcmp(subnames{i},'tasmaxday') | ...
       strcmp(subnames{i},'twbday')    | ...
       strcmp(subnames{i},'vpdday')
    else
      if isfield(v, subnames{i})
	if isfield(v.(subnames{i}), 'var')
	  v.(subnames{i}).var=0;
	end
      end
    end
  end
end
return
