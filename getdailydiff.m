function [ddiff,wmax]=getdailydiff(wind,opt)
dwind=diff(wind); ddiff(1)=0;
for i=1:length(dwind)/4
  j=4*(i-1)+1;
  ddiff(i)=dwind(j)+dwind(j+1)+dwind(j+2)+dwind(j+3);
end
wmax=0;
return
if strcmp(opt,'mod')
  for i=2:length(wind)
    wind(i)=wind(i-1)+dwind(i-1)*1.6233-0.1484;
  end
end
wmax=max(wind);

