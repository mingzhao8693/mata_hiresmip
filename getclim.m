function v=getclim(x)
nt=length(x); nyr=nt/365;
xx=reshape(x,365,nyr); 
v.clim=mean(xx,2);
v.ann =mean(xx,1);
for i=1:nt
  k=mod(i-1,365)+1;
  v.ano_day(i)=x(i)-v.clim(k);
end
v.ano_all =x     -mean(x);
v.ano_clim=v.clim-mean(v.clim);
v.ano_ann =v.ann -mean(v.ann);

v.std_day=std(v.ano_day);
v.std_ann=std(v.ano_ann);

v.ana_ann_prc =v.ano_ann/mean(v.ann)*100;

return

v.xa=xa;
v.xaa=xaa;
v.clim=x_clim
v.xa_clim=xa_clim
return

