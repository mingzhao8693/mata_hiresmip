function z=trend_ana(v)
x=v.sfc.tsurf;     ano.tsurf =getanom(x);
x=v.sfc.tref;      ano.tref  =getanom(x);
x=v.sfc.pcp;       ano.pcp   =getanom(x);
x=v.sfc.evap;      ano.evap  =getanom(x);
x=v.toa.lwcf;      ano.lwcf  =getanom(x);
x=v.toa.swcf;      ano.swcf  =getanom(x);
x=v.toa.ttcf;      ano.ttcf  =getanom(x); 
x=v.toa.netrad;    ano.netrad=getanom(x); 
x=v.toa.lwnet;     ano.lwnet =getanom(x); 
x=v.toa.swnet;     ano.swnet =getanom(x); 

%response of netrad/ttcf/swcf/lwcf/pcp to TUSRF/SST
v.nyr=length(v.sfc.tsurf.all(:,1,1,1));
t=[1:v.nyr]';

y=ano.tsurf.all;  z.tsurf =get_trend(t,y);
y=ano.tref.all;   z.tref  =get_trend(t,y);
y=ano.pcp.all;    z.pcp   =get_trend(t,y);
y=ano.evap.all;   z.evap  =get_trend(t,y);
y=ano.netrad.all; z.netrad=get_trend(t,y); 
y=ano.ttcf.all;   z.ttcf  =get_trend(t,y);
z.time=t;

return

lon=v.lon; lat=v.lat;
m=1; x=squeeze(z.tsurf(m,:,:));
figure; pcolor(x); shading flat; colorbar; caxis([-0.05 0.05]);

