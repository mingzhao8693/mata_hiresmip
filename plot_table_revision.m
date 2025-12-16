%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OBS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       all    non-precip precip   drizze  wet    nonstorm  storm    AR    TS     MCS     
frq   =[100     37.497    62.503  22.631   39.873  26.999  12.873  7.981  0.719   4.156 ]
pcp   =[2.876    0.013     2.863    0.123   2.740   1.234   1.506  0.707  0.113   0.694 ]
lwcf  =[25.844   4.431    21.413   4.201   17.212   8.948   8.265  3.919  0.543   3.767 ]
swcf  =[-45.261 -8.32    -36.941  -9.636  -27.305 -15.156 -12.14  -6.760 -0.728  -4.649 ]
ttcf  =[-19.417 -3.889   -15.528  -5.44   -10.093  -6.208  -3.884 -2.841 -0.185   -0.882]
nrad  =[  0.87  -0.12      0.99    0.71     0.28    0.81   -0.53  -2.64   0.42     1.69 ]
radc  =[ 20.287  3.769    16.518   6.15    10.373   7.018   3.354  0.201  0.605    2.572]
%       all    non-precip  precip  drizze  wet    nonstorm  storm    AR     TS      MCS   
pcp_a =[2.876     0.03     4.581    0.54   6.87    4.57     11.70    8.85   15.75  16.70 ]  
lwcf_a=[25.844   11.82     34.259  18.58   43.17  33.14     64.20   49.10   75.49  90.64 ]
swcf_a=[-45.261 -22.19    -59.103 -42.60  -68.48 -56.14    -94.37  -84.70 -101.19 -111.86]
ttcf_a=[-19.417 -10.37    -24.844 -24.02  -25.31 -22.99    -30.17  -35.60  -25.69 -21.22 ]
radc_a=[-19.417 -3.889   -15.528  -5.44   -10.093 -6.208    -3.884  -2.841 -0.185  -0.882]
nrad_a=[  0.87  -0.32      1.584   3.137    0.702  3.000    -4.117 -33.079 58.415  40.664]
radc_a =[ 20.287 10.052    26.428  27.175   26.015 25.994    26.055   2.519 84.145  61.886]

frq_r =frq/frq(1);   %frq_r (1)=frq_r (1)-frq_r (2);
pcp_r =pcp/pcp(1);   %pcp_r (1)=pcp_r (1)-pcp_r (2);
lwcf_r=lwcf/lwcf(1); %lwcf_r(1)=lwcf_r(1)-lwcf_r(2);
swcf_r=swcf/swcf(1); %swcf_r(1)=swcf_r(1)-swcf_r(2);
ttcf_r=ttcf/ttcf(1); %ttcf_r(1)=ttcf_r(1)-ttcf_r(2);
pcp_n =pcp_a /pcp_a (1);
lwcf_n=lwcf_a/lwcf_a(1);
swcf_n=swcf_a/swcf_a(1);
ttcf_n=ttcf_a/ttcf_a(1);
v.frq=frq; v.frq_r=frq_r;
v.pcp  =pcp;   v.lwcf  =lwcf;   v.swcf  =swcf;   v.ttcf  =ttcf;v.nrad=nrad;v.radc=radc;
v.pcp_r=pcp_r; v.lwcf_r=lwcf_r; v.swcf_r=swcf_r; v.ttcf_r=ttcf_r;
v.pcp_a=pcp_a; v.lwcf_a=lwcf_a; v.swcf_a=swcf_a; v.ttcf_a=ttcf_a;v.nrad_a=nrad_a;v.radc_a=radc_a;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Figure summary %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 2000, 1600]*0.5; fsize=12; lw=2; x=[1:10];
handle = figure('Position', pms,'visible','on');
subplot(2,1,1)
y=[frq;pcp*10;lwcf;swcf;ttcf]'; grid minor;
hb=bar(x,y); axis([0.5 10.6 -50 101]); grid minor;
legend('Freq (%)','Precip*10 (mm/10day)',...
       'LW CRE (W/m2)','SW CRE (W/m2)','net CRE (W/m2)');
xlist={'all','non-precip','precip','drizzle','wet','wet non-storm','storm','AR','TS','MCS'};
ylabel('global mean value','FontSize',fsize); 
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);xtickangle(30);
hb(1).FaceColor = 'y';
hb(2).FaceColor = 'g';
hb(3).FaceColor = 'r';
hb(4).FaceColor = 'b';
hb(5).FaceColor = 'k';
title('(a)','FontSize',fsize);
subplot(2,1,2)
y=[frq_r;pcp_r;lwcf_r;swcf_r;ttcf_r]'*100;
hb=bar(x,y); axis([0.5 10.6 0 101]); grid minor;
legend('Freq','Precip','LW CRE','SW CRE','net CRE');
xlist={'all','non-precip','precip','drizzle','wet','wet non-storm','storm','AR','TS','MCS'};
ylabel('percent of global mean','FontSize',fsize); 
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);xtickangle(30);
hb(1).FaceColor = 'y';
hb(2).FaceColor = 'g';
hb(3).FaceColor = 'r';
hb(4).FaceColor = 'b';
hb(5).FaceColor = 'k';
title('(b)','FontSize',fsize);
visfig='off'; figpath='./fig_cre/'; expn='c192'; vname='Fig4';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 2000, 1600]*0.5; fsize=12; lw=2; x=[1:10]
handle = figure('Position', pms,'visible','on');
subplot(2,1,1)
y=[pcp_a;lwcf_a;swcf_a;ttcf_a]';
hb=bar(x,y); axis([0.5 10.6 -115 115]); grid minor;
legend('Precip (mm/day)','LW CRE (W/m2)','SW CRE (W/m2)',...
       'net CRE (W/m2)','Location','northwest');
xlist={'all','non-precip','precip','drizzle','wet','wet non-storm','storm','AR','TS','MCS'};
ylabel('frequency-weighted global mean','FontSize',fsize); 
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);xtickangle(30);
hb(1).FaceColor = 'g';
hb(2).FaceColor = 'r';
hb(3).FaceColor = 'b';
hb(4).FaceColor = 'k';
title('(a)','FontSize',fsize);
subplot(2,1,2)
y=[pcp_n;lwcf_n;swcf_n;ttcf_n]';
hb=bar(x,y); axis([0.5 10.6 0 6]); grid minor;
legend('Precip','LW CRE','SW CRE','net CRE','Location','northwest');
xlist={'all','non-precip','precip','drizzle','wet','wet non-storm','storm','AR','TS','MCS'};
yl='normalized frequency-weighted mean';
ylabel(yl,'FontSize',fsize);
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize); xtickangle(30);
hb(1).FaceColor = 'g';
hb(2).FaceColor = 'r';
hb(3).FaceColor = 'b';
hb(4).FaceColor = 'k';
title('(b)','FontSize',fsize);
visfig='off'; figpath='./fig_cre/'; expn='c192'; vname='Fig5';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Model Bias%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Model ensemble mean%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%model ensemble mean
%       all    non-precip  precip  drizze  wet     non-storm  storm    AR      TS      MCS     
frq   =[  100     32.273    67.727   29.279  38.449  25.264   13.183   7.707  0.697   4.776]
pcp   =[  2.948    0.010     2.932    0.150   2.782   1.134    1.649   0.727  0.126   0.795]
lwcf  =[  23.839   3.608    20.231    4.802  15.429   6.8979   8.533   3.549  0.496   4.484]
swcf  =[ -47.238  -5.277   -41.961  -13.085 -28.876 -14.617  -14.250  -7.167 -0.783  -6.304]
ttcf  =[ -23.399  -1.669   -21.730   -8.288 -13.447  -7.720   -5.726  -3.617 -0.287  -1.820]
nrad  =[   2.142   0.632     1.510    2.759  -1.249  -0.541   -0.708  -3.197  0.394   2.091]
radc  =[  25.398   2.285    23.113   11.030  12.088   7.113    4.975   0.406  0.678   3.886]

pcp_a  =[  2.948   0.031     4.329    0.512   7.236    4.489   12.509   9.433   18.078   16.646]
lwcf_a =[ 23.839  11.180    29.871   16.401  40.129   27.303   64.727  46.049   71.162   93.886]
swcf_a =[-47.238 -16.351   -61.956  -44.691 -75.102  -57.857 -108.094 -92.993 -112.339 -131.993]
ttcf_a =[-23.399  -5.172   -32.085  -28.307 -34.974  -30.557  -43.435 -46.931  -41.177  -38.107]
nrad_a =[  2.142   1.958     2.230    9.423  -3.249   -2.141   -5.371 -41.482   56.528   43.781]
radc_a =[ 25.398   7.080    34.127   37.672  31.439   28.155   37.738   5.268   97.274   81.365]
%model ensemble bias
%        all   non-precip  precip drizze   wet  nonstorm  storm   AR     TS    MCS 
frq    =[0       -5.224   5.224   6.648  -1.424  -1.735   0.310 -0.274 -0.022  0.620 ]
pcp    =[0.072   -0.003   0.069   0.027   0.042  -0.100   0.143  0.020  0.013  0.101 ]
nrad   =[1.272    0.752   0.52    2.049  -1.529  -1.351  -0.178 -0.557 -0.026  0.401 ]
olr    =[-1.34  -13.992  12.652  17.501  -4.849  -4.213  -0.636 -0.933 -0.103  0.417 ]
swabs  =[-0.067 -13.239  13.172  19.55   -6.378  -5.563  -0.815 -1.490 -0.129  0.818 ]
lwcf   =[-2.005  -0.823  -1.182   0.601  -1.783  -2.051   0.268 -0.370 -0.047  0.717 ]
swcf   =[-1.977   3.043  -5.02   -3.449  -1.571   0.539  -2.110 -0.407 -0.055 -1.655 ]
ttcf   =[-3.982   2.22   -6.202  -2.848  -3.354  -1.512  -1.842 -0.776 -0.102 -0.938 ]
radc   =[ 5.111  -1.484   6.595   4.880   1.715   0.095   1.621  0.205  0.073  1.314 ]
%        all   non-precip  precip drizze  wet   nonstorm storm   AR     TS     MCS   
frq_a  =[0      -5.224    5.224   6.648  -1.424 -1.735   0.31  -0.274 -0.022   0.620 ]
pcp_a  =[0.072   0.01    -0.252  -0.02    0.36  -1.08    0.81   0.57   2.38   -0.06  ]  
nrad_a =[1.272   2.28    -4.388   5.80   -3.95  -8.31   -1.26  -8.41  -1.60    3.14  ]
olr_a  =[-1.34  -2.30     0       3.24   -4.33   3.48   -9.58  -4.62  -8.07  -15.32  ]
swabs_a=[-0.067 -0.02     0       9.03    8.28  -4.83  -10.84 -13.04  -9.66  -12.18  ]
lwcf_a =[-2.005 -0.64    -4.388  -2.17   -3.04 -10.80    0.52  -3.05  -4.22    3.25  ]
swcf_a =[-1.977  5.84    -2.853  -2.10   -6.62   3.00  -13.78  -8.29  -11.11 -20.14  ]
ttcf_a =[-3.982  5.20    -7.241  -4.27   -9.66  -7.81  -13.26 -11.34  -15.33 -16.88  ]
radc_a =[ 5.111 -2.972    7.699  10.497   5.424  2.161  11.68   2.749  13.13  19.48]
%5.111  1.627   -2.039  -6.17    0.965  1.785  -0.613  0.089   2.656 -8.033]
d.frq=frq; d.pcp =pcp; d.olr =olr; d.swabs=swabs;
d.lwcf =lwcf; d.swcf=swcf; d.ttcf =ttcf; d.radc=radc; d.nrad=nrad; 
d.frq_a=frq_a; d.pcp_a =pcp_a; d.olr_a =olr_a;  d.swabs_a=swabs_a; 
d.lwcf_a=lwcf_a; d.swcf_a=swcf_a; d.ttcf_a=ttcf_a; d.radc_a=radc_a; d.nrad_a=nrad_a; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 2000, 800]*0.6; fsize=12; lw=2; x=[1:10]
handle = figure('Position', pms,'visible','on');
%y=[d.frq;d.pcp*30;d.nrad;-d.olr;d.swabs;d.lwcf;d.swcf;d.ttcf;d.rclr]'
y=[d.frq;d.pcp*10;d.nrad;d.lwcf;d.swcf;d.ttcf;d.radc]'
hb=bar(x,y); grid minor; axis([0.5 10.6 -7 7]);
a=1;
if (a)
  legend('Freq (%)','Precip*10 (mm/10day)','net RAD (W/m2)',...
	 'LW CRE (W/m2)','SW CRE (W/m2)','net CRE (W/m2)',...
	 'clear-sky RAD','Location','northeast');
	 hb(1).FaceColor = 'y';
	 hb(2).FaceColor = 'g';
	 hb(3).FaceColor = 'c';
	 hb(4).FaceColor = 'r';
	 hb(5).FaceColor = 'b';
	 hb(6).FaceColor = 'k';
	 hb(7).FaceColor = [0.9 0.9 0.9];
else
  legend('Freq (%)','Precip*30 (mm/30day)',...
	 'net RAD (W/m2)','LW RAD (W/m2)','SW RAD (W/m2)',...
	 'LW CRE (W/m2)','SW CRE (W/m2)','net CRE (W/m2)',...
	 'clear-sky RAD (W/m2)','Location','northeast');
  hb(1).FaceColor = 'y';
  hb(2).FaceColor = [1.0 0.5 0.5];
  hb(3).FaceColor = 'k';
  hb(4).FaceColor = 'm';
  hb(5).FaceColor = 'c';
  hb(6).FaceColor = 'r';
  hb(7).FaceColor = 'b';
  hb(8).FaceColor = 'g';
  hb(9).FaceColor = [0.5 0.5 1.0];
end
xlist={'all','non-precip','precip','drizzle','wet','non-storm','storm','AR','TS','MCS'};
ylabel('model biases (model minus obs)','FontSize',fsize); 
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);xtickangle(0);
visfig='off'; figpath='./fig_cre/'; expn='c192'; vname='ens_m_obs_all_idwei';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pms=[ 0, 0, 2000, 800]*0.6; fsize=12; lw=2; x=[1:10]
handle = figure('Position', pms,'visible','on');
%y=[d.frq_a;d.pcp_a;d.nrad_a;-d.olr_a;d.swabs_a;d.lwcf_a;d.swcf_a;d.ttcf_a;d.rclr_a]'
y=[d.frq_a;d.pcp_a;d.nrad_a;d.lwcf_a;d.swcf_a;d.ttcf_a;d.radc_a]'
hb=bar(x,y); grid minor; axis([0.5 10.6 -21 21]);
a=1;
if (a)
  legend('Freq (%)','Precip (mm/day)','net RAD (W/m2)',...
	 'LW CRE (W/m2)','SW CRE (W/m2)','net CRE (W/m2)',...
         'clear-sky RAD','Location','southwest');
	 hb(1).FaceColor = 'y';
	 hb(2).FaceColor = 'g';
	 hb(3).FaceColor = 'c';
	 hb(4).FaceColor = 'r';
	 hb(5).FaceColor = 'b';
	 hb(6).FaceColor = 'k';
	 hb(7).FaceColor = [0.9 0.9 0.9];
else
  legend('Freq (%)','Precip (mm/day)','net RAD (W/m2)',...
	 'LW RAD (W/m2)','SW RAD (W/m2)',...
	 'LW CRE (W/m2)','SW CRE (W/m2)','net CRE (W/m2)',...
	 'clear-sky RAD (W/m2)','Location','northeast');
  hb(1).FaceColor = 'y';
  hb(2).FaceColor = [1.0 0.5 0.5];
  hb(3).FaceColor = 'k';
  hb(4).FaceColor = 'm';
  hb(5).FaceColor = 'c';
  hb(6).FaceColor = 'r';
  hb(7).FaceColor = 'b';
  hb(8).FaceColor = 'g';
  hb(9).FaceColor = [0.5 0.5 1.0];
end
xlist={'all','non-precip','precip','drizzle','wet','non-storm','storm','AR','TS','MCS'};
ylabel('model biases in global frequency-weighted mean','FontSize',fsize); 
set(gca,'xtick',x); set(gca,'xticklabel',xlist,'FontSize',fsize);xtickangle(0);
visfig='off'; figpath='./fig_cre/'; expn='c192'; vname='ens_m_obs_all_idavg';
printnew(visfig,figpath,expn,vname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


