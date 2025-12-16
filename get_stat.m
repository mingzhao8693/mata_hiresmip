function x=get_stat(a,opt)
if strcmp(opt,'2d')
  x.yavg =squeeze(mean(a,2));
  x.avg  =squeeze(mean(mean(a,2),1));
  x.avg0 =mean(x.avg);
else
  x.yavg =squeeze(mean(a,3));
  x.avg  =squeeze(mean(mean(a,3),1));
  x.avg0 =mean(x.avg,2);
end
