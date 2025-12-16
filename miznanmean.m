function z0_mean=miznanmean(z0,id,aa,opt)
%area weighted global/regional average over non NaN regions
%aa is area of each lat-lon grid
%z0 variable to be averaged
%id region over which to do average
if (opt==0)
  z0(z0==NaN)=0; 
end
a=z0; idx=~isnan(a)&id; no=num2str(sum(sum(~idx)));
disp(strcat('number of grid excluded in computing mean=',no));
disp(strcat('number of grid above  100=', num2str(sum(z0(idx)> 100))));
disp(strcat('number of grid below -100=', num2str(sum(z0(idx)<-100))));
a=aa(idx)/mean(aa(idx));
z0_mean=mean(z0(idx).*a);

