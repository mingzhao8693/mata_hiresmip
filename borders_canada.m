function [latx,lonx] = borders_canada(place)
%v=shaperead('PROVINCE.SHP','UseGeoCoords',true);
%save('canadian_provice_border.mat','v');

load('canadian_provice_border.mat','v');

for i=1:13
  if strcmp(place,v(i).NAME)
    latx=v(i).Lat;
    lonx=v(i).Lon;
  end
end
lonx=360+lonx;

return

[bc.latx bc.lonx]=border_canada('British Columbia')
[yu.latx yu.lonx]=border_canada('Yukon Territory')

figure; 
plot(bc.lonx,bc.latx); hold on;
plot(yu.lonx,yu.latx); hold on;
