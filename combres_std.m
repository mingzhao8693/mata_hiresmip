function x=combres_std(wphi,nn,field)

if isfield(wphi(1).std,field);
  i=1; x=wphi(i).std.(field);
  for i=2:nn
    x =[x  wphi(i).std.(field)];
  end
else
  'field not exist'
end

return
