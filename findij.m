function [s]=findij(latx,lonx,lat,lon)
%latx=-22.7500; lonx=192.8100
s.j1=max(find(lat(:)<= latx)); s.j2=min(find(lat(:)>=latx)); 
s.i1=max(find(lon(:)<= lonx)); s.i2=min(find(lon(:)>=lonx)); 
return
