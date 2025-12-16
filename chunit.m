function t500=chunit(t500,a)
t500.clm  = t500.clm * a;
t500.ann  = t500.ann * a;
t500.sea  = t500.sea * a;
t500.latdis.sea = t500.latdis.sea * a;
if isfield(t500,'all')
  t500.all  = t500.all * a;
end
if isfield(t500,'al0')
  t500.al0  = t500.al0 * a;
end
