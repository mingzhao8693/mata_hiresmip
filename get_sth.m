function [v]=get_sth(c,m1,m2,m3)
v.sea.frqday     =mean(c.frqday        (:,m1:m2),1)*100; 
v.sea.prday_av   =mean(c.prday_av      (:,m1:m2),1); 
v.sea.prday_idwei=mean(c.prday_idwei   (:,m1:m2),1); 
v.sea.prday_idavg=nanmean(c.prday_idavg(:,m1:m2),1);
v.sea.prday_idstd=nanmean(c.prday_idstd(:,m1:m2),1);
v.sea.prday_idmax=nanmean(c.prday_idmax(:,m1:m2),1);

v.ts.frqday     =c.frqday     (:,m3)*100; 
v.ts.prday_av   =c.prday_av   (:,m3);
v.ts.prday_idwei=c.prday_idwei(:,m3);
v.ts.prday_idavg=c.prday_idavg(:,m3); 
v.ts.prday_idmax=c.prday_idmax(:,m3); 

return
