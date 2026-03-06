function [v]=clearvar(v,opt)
%remove field var except for certain variables
%e.g., tasmaxday twbday vpdday
%if opt==1 don't do anything
varlist={'tasmaxday','twbday','vpdday'}; varlist={'tasmaxday'};

if opt==0
  subnames = fieldnames(v);
  for i=1:length(subnames)
    id=false;
    for j=1:length(varlist)
      id = id | strcmp(subnames{i},varlist{j});
    end
    if (~id)
      if isfield(v, subnames{i})
	if isfield(v.(subnames{i}), 'var')
	  v.(subnames{i}).var=0;
	  disp(strcat(subnames{i},':var removed'));
	end
      end
    end
  end
end
return
