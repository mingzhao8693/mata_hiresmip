function [dif_ocean dif_land]=getlat(diff,lat,lm0)
for j=1:length(lat)
  oid=(lm0(j,:)==0); lid=~oid;
  if (sum(oid)==0)
    dif_ocean(j)=0;
  else
    dif_ocean(j)=mean(diff(j,oid));
  end
  if (sum(lid)==0)
    dif_land(j)=0;
  else
    dif_land(j)=mean(diff(j,lid));
  end
end
