function v = get_mytrend(A,t)
%A(yr,mon,lat,lon)
A0=squeeze(mean(A,2));
v.mon=trend(A,t,1); 
v.ann=trend(A0,t,1);
return
