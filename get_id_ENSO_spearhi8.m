function [y]=get_id_ENSO_spearhi8(ssti,yr1,yr2,thresh,minlen)
%The modern standard: Niño 3.4 + thresholds (Latitude: 5°N to 5°S Longitude: 170°W to 120°W)
%Today, agencies like NOAA define events using:
%Sea surface temperature anomalies in the Niño 3.4 region
% A threshold (typically ±0.5°C) Sustained over 5 consecutive overlapping 3-month periods
%This index is called the Oceanic Niño Index.

%ssti=z.v0a.sfc.sst_nino3.al0; yr1=0101; yr2=0200; thresh=0.5; phas='pos'; season='NDJFM';
%ssti=z.v0b.sfc.sst_nino3.al0; yr1=1981; yr2=2020; thresh=0.5; phas='pos'; season='NDJFM';
%minlen=5;

[nyr,nmon]=size(ssti);
a=ssti; b=squeeze(mean(a,1)); b=repmat(b,[nyr 1]); a=a-b;
a=permute(a,[2 1]); a=reshape(a,nyr*nmon,1); a=movmean(a, 3);

y=id_from_index(yr1,yr2,a,thresh); time=y.time;

[el.id,el.ev]=findevents(a,time,thresh,minlen,0)

[la.id,la.ev]=findevents(a,time,-thresh,minlen,1)

y.el=el; y.la=la; y.ssti=a; y.yr1=yr1; y.yr2=yr2;

return

x=y.time;
figure; plot(x,y.ssti,'-k*'); hold on;
plot(x,y.el.id,'-rs'); plot(x,-y.la.id,'-bs');

			  %plot(x,y.id_pos_NDJFM,'r'); plot(x,id,'b');


if strcmp(phas,'pos')
  disp('pos............')
  if strcmp(season,'NDJFM')
    id=y.id_pos_NDJFM;
  elseif strcmp(season,'MJJAS')
    id=y.id_pos_MJJAS;   
  elseif strcmp(season,'DJF')
    id=y.id_pos_DJF;   
  elseif strcmp(season,'JJA')
    id=y.id_pos_JJA;   
  end
else
  disp('neg............')
  if strcmp(season,'NDJFM')
    id=y.id_neg_NDJFM;
  elseif strcmp(season,'MJJAS')
    id=y.id_neg_MJJAS;
  elseif strcmp(season,'DJF')
    id=y.id_neg_DJF;   
  elseif strcmp(season,'JJA')
    id=y.id_neg_JJA;   
  end
end
s=sprintf('sum(id)=%d',sum(id));
disp(s);
return

