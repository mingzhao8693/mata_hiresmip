function x=combres(wphi,nn,field)

if isfield(wphi(1).avg,field);
  i=1; x=wphi(i).avg.(field);
  for i=2:nn
    x =[x  wphi(i).avg.(field)];
  end
else
  'field not exist'
end

return
