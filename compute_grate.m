function g=compute_grate(v)
hf= v.io.hfint0.comp_iso_avg; a=86400; 
y0 =v.io.hdt_tot_int.comp_iso_avg;   
y1 =v.io.tdt_rad_int0.comp_iso_avg;  
y2a=v.io.tdt_dif_int0.comp_iso_avg; 
y2b=v.io.qvdt_dif_int0.comp_iso_avg;
y2 =y2a+y2b;                        
y3 =v.io.hdt_vadv_int0.comp_iso_avg;
y4a=v.io.hdt_hadv_int0.comp_iso_avg;
y4b=v.io.hdt_dgz_int0.comp_iso_avg; 
y4 =y4a+y4b;                        
y5a=v.io.hdp_dyn_int0.comp_iso_avg; 
y5b=v.io.hdt_ddp_int0.comp_iso_avg; 
y5c=v.io.hdt_adj_int0.comp_iso_avg; 
y5 =y5a+y5b+y5c;                    

id=(hf>0); hf0=sum(hf(id).*hf(id)); %hf0=1
z0=y0.*hf*a; Z0=sum(z0(id))/hf0; s0='total';
z1=y1.*hf*a; Z1=sum(z1(id))/hf0; s1='rad';
z2=y2.*hf*a; Z2=sum(z2(id))/hf0; s2='sfchflx';
z3=y3.*hf*a; Z3=sum(z3(id))/hf0; s3='vadv';
z4=y4.*hf*a; Z4=sum(z4(id))/hf0; s4='hadv';
z5=y5.*hf*a; Z5=sum(z5(id))/hf0; s5='mass';
g.rate=[Z0 Z1 Z2 Z3 Z4 Z5]; 
g.hf=hf;
return
pms=[ 0, 0, 1200, 900]*0.5; warning off all
handle = figure('Position', pms,'visible','on');
x=[1:6]; bar(x,Z); fsize=16;
set(gca,'xtick',x);
set(gca,'xticklabel',{s0,s1,s2,s3,s4,s5});
set(gca,'FontSize',fsize);
ylabel('Growth rate (day^{-1})','FontSize',fsize);
visfig='off'; figpath='./fig_mjo/'; vname='dmse2_io_iso_growthrate';
printit(visfig,figpath,expn,vname);

