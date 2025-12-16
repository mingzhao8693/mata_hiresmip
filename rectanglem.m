function rectanglem(reg);
%reg=[-155  15 40 20]; figure; axesm('MapProjection','robinson','origin',[0,0]); framem;
r.lon1=[reg(1)        reg(1)+reg(3)]; r.lat1=[reg(2)        reg(2)];
r.lon2=[reg(1)        reg(1)+reg(3)]; r.lat2=[reg(2)+reg(4) reg(2)+reg(4)];
r.lon3=[reg(1)        reg(1)       ]; r.lat3=[reg(2)        reg(2)+reg(4)];
r.lon4=[reg(1)+reg(3) reg(1)+reg(3)]; r.lat4=[reg(2)        reg(2)+reg(4)];

linem(r.lat1,r.lon1); hold on;
linem(r.lat2,r.lon2); hold on;
linem(r.lat3,r.lon3); hold on;
linem(r.lat4,r.lon4); hold on;
return

