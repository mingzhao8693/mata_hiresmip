%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn='/work/miz/mat_gf/dvar_final_new_20250111.mat'; load(fn);
gf.v0=v0; gf.vm=vm; z.gf=gf;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Figs for atmospheric circulation changes across various season%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p.let=["(a) ","(b) ","(c) ","(d) ","(e) ","(f) ","(g) ","(h) ","(i) ","(j) "...
     "(k) ","(l) ","(m) ","(n) ","(o) ","(p) ","(q) ","(r) ","(s) ","(t) "];
nsea={'ANN','MAM','JJA','SON','DJF'}; isea=5; %1-5=ANN,MAM,JJA,SON,DJF
p.vname='atm_patch'; p.vname=strcat('Fig_',nsea{isea},'_',p.vname);
 i1=1;  i2=2;  i3=3;  i4=4;  i5=5; 
 i1=3;  i2=4;  i3=5;  i4=6;  i5=7;   p.vname=strcat(p.vname,num2str(i1),'-',num2str(i5));
%i1=10; i2=11; i3=12; i4=13; i5=14; 
%i1=15; i2=16; i3=17; i4=18; i5=19; 
%i1=21; i2=22; i3=23; i4=24; i5=25; 
a='patch'; a1=strcat(a,num2str(i1)); a2=strcat(a,num2str(i2));
a3=strcat(a,num2str(i3)); a4=strcat(a,num2str(i4)); a5=strcat(a,num2str(i5));
del=' $\Delta$'; s0='Z500'''; s1='U200'; s2='U850'; s3='SLP';
p.s1 =strcat(a1,'~(',nsea{isea},');',del,s0); p.s2 =strcat(a2,'~(',nsea{isea},');',del,s0);
p.s3 =strcat(a3,'~(',nsea{isea},');',del,s0); p.s4 =strcat(a4,'~(',nsea{isea},');',del,s0);
p.s5 =strcat(a5,'~(',nsea{isea},');',del,s0); 
p.s6 =strcat(del,s1); p.s7 =strcat(del,s1); p.s8 =strcat(del,s1); p.s9 =strcat(del,s1); p.s10=strcat(del,s1); 
p.s11=strcat(del,s2); p.s12=strcat(del,s2); p.s13=strcat(del,s2); p.s14=strcat(del,s2); p.s15=strcat(del,s2); 
p.s16=strcat(del,s3); p.s17=strcat(del,s3); p.s18=strcat(del,s3); p.s19=strcat(del,s3); p.s20=strcat(del,s3); 
p.unit1='$\rm{m}$';                  p.unit1_bar='\rm{m}'; 
p.unit2='$\rm{\% K^{-1}}$';          p.unit2_bar='\rm{% K^{-1}}'; 
p.unit3='$\rm{mm day^{-1} K^{-1}}$'; p.unit3_bar='\rm{mm day^{-11 K^{-1}}'; 
p.unit4='$\rm{mm day^{-1} K^{-1}}$'; p.unit4_bar='\rm{mm day^{-1} K^{-1}}'; 

p.cmin1=-20.0; p.cmax1=20.0; p.cmin2=-5.0; p.cmax2=5.0;
p.cmin3=-3.0;  p.cmax3=3.0;  p.cmin4=-3.0; p.cmax4=3.0; 
p.do_add=1; p.show='off'; p.z1_co='c'; p.co='k'; p.xy=[280 360 0 90];
s=z.gf.v0.s; p.lon0=s.lon; p.lat0=s.lat; p.lm0=s.lm; aa=s.aa; aa0=aa;
p.lm=s.lm; aa0=s.aa; p.lon=s.lon; p.lat=s.lat; LV0=2.5E6;

gf=z.gf; id=aa; id(:,:)=1;
i=i1; a =gf.vm.tsurf.var(i,:,:,:); a=squeeze(mean(a,2)); p.dT1=mean(mean(a(id).*aa));
i=i2; a =gf.vm.tsurf.var(i,:,:,:); a=squeeze(mean(a,2)); p.dT2=mean(mean(a(id).*aa));
i=i3; a =gf.vm.tsurf.var(i,:,:,:); a=squeeze(mean(a,2)); p.dT3=mean(mean(a(id).*aa));
i=i4; a =gf.vm.tsurf.var(i,:,:,:); a=squeeze(mean(a,2)); p.dT4=mean(mean(a(id).*aa));
i=i5; a =gf.vm.tsurf.var(i,:,:,:); a=squeeze(mean(a,2)); p.dT5=mean(mean(a(id).*aa));
imk=gf.v0.sfc.ice.tavg0;  
id=p.lm; id(id<1)=0; id(id>=1)=1; p.id_lm=(id==1);
lat1= 15; lat2=85; lon1=190; lon2=344; p.xy=[280 360  0 90];
lat1=-90; lat2=90; lon1=0;   lon2=360; p.xy=[0   360 -90 90];
p.xy=[lon1 lon2 lat1 lat2];
p.ys=min(find(s.lat(:)>=lat1)); p.ye=max(find(s.lat(:)<=lat2));
p.xs=min(find(s.lon(:)>=lon1)); p.xe=max(find(s.lon(:)<=lon2));
a=id; a(:,:)=0; a(p.ys:p.ye,p.xs:p.xe)=1; id=a; %id=id.*a; 
id=(id==1); aa=aa0(id); aa=aa/mean(aa); nlon=length(p.lon);

%selected vertical levels k=1:5 (850, 700, 500, 300, 200hPa)
vm=z.gf.vm; k=3; m=5; %500hPa; DJF
a=vm.za; var=a.var; var0=a.var0; 
a=squeeze(var0(k,:,:,:));        a=get4season_all(a); a0  =squeeze(a(m,:,:));
i=i1; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.z1=squeeze(a(m,:,:)); p.dz1=mean(p.z1(id).*aa); 
i=i2; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.z2=squeeze(a(m,:,:)); p.dz2=mean(p.z2(id).*aa); 
i=i3; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.z3=squeeze(a(m,:,:)); p.dz3=mean(p.z3(id).*aa); 
i=i4; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.z4=squeeze(a(m,:,:)); p.dz4=mean(p.z4(id).*aa); 
i=i5; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.z5=squeeze(a(m,:,:)); p.dz5=mean(p.z5(id).*aa); 
p.z1_add=a0; p.z1_addbin=[0:50:150];
a=vm.ua; var=a.var; var0=a.var0; 
a=squeeze(var0(k,:,:,:));        a=get4season_all(a); a0  =squeeze(a(m,:,:)); 
i=i1; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.u1=squeeze(a(m,:,:)); p.du1=mean(p.u1(id).*aa); 
i=i2; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.u2=squeeze(a(m,:,:)); p.du2=mean(p.u2(id).*aa); 
i=i3; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.u3=squeeze(a(m,:,:)); p.du3=mean(p.u3(id).*aa); 
i=i4; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.u4=squeeze(a(m,:,:)); p.du4=mean(p.u4(id).*aa); 
i=i5; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.u5=squeeze(a(m,:,:)); p.du5=mean(p.u5(id).*aa); 
p.u1_add=a0; p.u1_addbin=[20:10:50];
a=vm.va; var=a.var; var0=a.var0; 
a=squeeze(var0(k,:,:,:));        a=get4season_all(a); a0  =squeeze(a(m,:,:)); 
i=i1; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.v1=squeeze(a(m,:,:)); p.dv1=mean(p.v1(id).*aa); 
i=i2; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.v2=squeeze(a(m,:,:)); p.dv2=mean(p.v2(id).*aa); 
i=i3; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.v3=squeeze(a(m,:,:)); p.dv3=mean(p.v3(id).*aa); 
i=i4; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.v4=squeeze(a(m,:,:)); p.dv4=mean(p.v4(id).*aa); 
i=i5; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.v5=squeeze(a(m,:,:)); p.dv5=mean(p.v5(id).*aa); 
p.v1_add=a0; p.v1_addbin=[20:10:50];

%[phi psi] = flowfun(p.lon,p.lat,p.u1',p.v1');
%n=5; cfact=1; u=p.u1; v=p.v1;
%figure; pcolor(p.lon,p.lat,phi'); shading flat; colorbar; hold on;
%contour(p.lon,p.lat,psi',10,'k');hold on;
%quiver(p.lon(1:n:end),p.lat(1:n:end),u(1:n:end,1:n:end),v(1:n:end,1:n:end),cfact,'k');

vm=z.gf.vm; k=5; m=5; %200hPa; DJF
a=vm.za; var=a.var; var0=a.var0; 
a=squeeze(var0(k,:,:,:));        a=get4season_all(a); a0   =squeeze(a(m,:,:)); 
i=i1; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.z6 =squeeze(a(m,:,:)); p.dz6 =mean(p.z1(id).*aa); 
i=i2; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.z7 =squeeze(a(m,:,:)); p.dz7 =mean(p.z2(id).*aa); 
i=i3; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.z8 =squeeze(a(m,:,:)); p.dz8 =mean(p.z3(id).*aa); 
i=i4; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.z9 =squeeze(a(m,:,:)); p.dz9 =mean(p.z4(id).*aa); 
i=i5; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.z10=squeeze(a(m,:,:)); p.dz10=mean(p.z5(id).*aa); 
p.z6_add=a0; p.z6_addbin=[0:50:150];
a=vm.ua; var=a.var; var0=a.var0; 
a=squeeze(var0(k,:,:,:));        a=get4season_all(a); a0   =squeeze(a(m,:,:)); 
i=i1; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.u6 =squeeze(a(m,:,:)); p.du6 =mean(p.u1(id).*aa); 
i=i2; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.u7 =squeeze(a(m,:,:)); p.du7 =mean(p.u2(id).*aa); 
i=i3; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.u8 =squeeze(a(m,:,:)); p.du8 =mean(p.u3(id).*aa); 
i=i4; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.u9 =squeeze(a(m,:,:)); p.du9 =mean(p.u4(id).*aa); 
i=i5; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.u10=squeeze(a(m,:,:)); p.du10=mean(p.u5(id).*aa); 
p.u6_add=a0; p.u6_addbin=[20:10:50];
a=z.gf.vm.va; var=a.var; var0=a.var0; 
a=squeeze(var0(k,:,:,:));       a=get4season_all(a); a0   =squeeze(a(m,:,:)); 
i=i1; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.v6 =squeeze(a(m,:,:)); p.dv6 =mean(p.v1(id).*aa); 
i=i2; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.v7 =squeeze(a(m,:,:)); p.dv7 =mean(p.v2(id).*aa); 
i=i3; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.v8 =squeeze(a(m,:,:)); p.dv8 =mean(p.v3(id).*aa); 
i=i4; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.v9 =squeeze(a(m,:,:)); p.dv9 =mean(p.v4(id).*aa); 
i=i5; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.v10=squeeze(a(m,:,:)); p.dv10=mean(p.v5(id).*aa); 
p.v6_add=a0; p.v6_addbin=[20:10:50];

vm=z.gf.vm; k=1; m=5; %850hPa; DJF
a=vm.za; var=a.var; var0=a.var0; 
a=squeeze(var0(k,:,:,:));        a=get4season_all(a); a0   =squeeze(a(m,:,:)); 
i=i1; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.z11=squeeze(a(m,:,:)); p.dz11=mean(p.z1(id).*aa); 
i=i2; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.z12=squeeze(a(m,:,:)); p.dz12=mean(p.z2(id).*aa); 
i=i3; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.z13=squeeze(a(m,:,:)); p.dz13=mean(p.z3(id).*aa); 
i=i4; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.z14=squeeze(a(m,:,:)); p.dz14=mean(p.z4(id).*aa); 
i=i5; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.z15=squeeze(a(m,:,:)); p.dz15=mean(p.z5(id).*aa); 
p.z11_add=a0; p.z11_addbin=[0:50:150];
a=vm.ua; var=a.var; var0=a.var0; 
a=squeeze(var0(k,:,:,:));       a=get4season_all(a); a0   =squeeze(a(m,:,:)); 
i=i1; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.u11=squeeze(a(m,:,:)); p.du11=mean(p.u1(id).*aa); 
i=i2; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.u12=squeeze(a(m,:,:)); p.du12=mean(p.u2(id).*aa); 
i=i3; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.u13=squeeze(a(m,:,:)); p.du13=mean(p.u3(id).*aa); 
i=i4; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.u14=squeeze(a(m,:,:)); p.du14=mean(p.u4(id).*aa); 
i=i5; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.u15=squeeze(a(m,:,:)); p.du15=mean(p.u5(id).*aa); 
p.u11_add=a0; p.u11_addbin=[20:10:50];
a=z.gf.vm.va; var=a.var; var0=a.var0; 
a=squeeze(var0(k,:,:,:));        a=get4season_all(a); a0   =squeeze(a(m,:,:)); 
i=i1; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.v11=squeeze(a(m,:,:)); p.dv11=mean(p.v1(id).*aa); 
i=i2; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.v12=squeeze(a(m,:,:)); p.dv12=mean(p.v2(id).*aa); 
i=i3; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.v13=squeeze(a(m,:,:)); p.dv13=mean(p.v3(id).*aa); 
i=i4; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.v14=squeeze(a(m,:,:)); p.dv14=mean(p.v4(id).*aa); 
i=i5; a=squeeze(var(i,k,:,:,:)); a=get4season_all(a); p.v15=squeeze(a(m,:,:)); p.dv15=mean(p.v5(id).*aa); 
p.v11_add=a0; p.v11_addbin=[20:10:50];

vm=z.gf.vm; m=5; %SLP; DJF
a=vm.slp; var=a.var; var0=a.var0; 
a=var0;                        a=get4season_all(a); a0   =squeeze(a(m,:,:)); 
i=i1; a=squeeze(var(i,:,:,:)); a=get4season_all(a); p.z16=squeeze(a(m,:,:)); p.dz16=mean(p.z1(id).*aa); 
i=i2; a=squeeze(var(i,:,:,:)); a=get4season_all(a); p.z17=squeeze(a(m,:,:)); p.dz17=mean(p.z2(id).*aa); 
i=i3; a=squeeze(var(i,:,:,:)); a=get4season_all(a); p.z18=squeeze(a(m,:,:)); p.dz18=mean(p.z3(id).*aa); 
i=i4; a=squeeze(var(i,:,:,:)); a=get4season_all(a); p.z19=squeeze(a(m,:,:)); p.dz19=mean(p.z4(id).*aa); 
i=i5; a=squeeze(var(i,:,:,:)); a=get4season_all(a); p.z20=squeeze(a(m,:,:)); p.dz20=mean(p.z5(id).*aa); 
p.z16_add=a0; p.z16_addbin=[980:2:1020];
a=vm.tsurf; var=a.var; var0=a.var0; 
a=var0;                        a=get4season_all(a); a0   =squeeze(a(m,:,:)); 
i=i1; a=squeeze(var(i,:,:,:)); a=get4season_all(a); p.u16=squeeze(a(m,:,:)); p.du16=mean(p.u1(id).*aa); 
i=i2; a=squeeze(var(i,:,:,:)); a=get4season_all(a); p.u17=squeeze(a(m,:,:)); p.du17=mean(p.u2(id).*aa); 
i=i3; a=squeeze(var(i,:,:,:)); a=get4season_all(a); p.u18=squeeze(a(m,:,:)); p.du18=mean(p.u3(id).*aa); 
i=i4; a=squeeze(var(i,:,:,:)); a=get4season_all(a); p.u19=squeeze(a(m,:,:)); p.du19=mean(p.u4(id).*aa); 
i=i5; a=squeeze(var(i,:,:,:)); a=get4season_all(a); p.u20=squeeze(a(m,:,:)); p.du20=mean(p.u5(id).*aa); 
p.u16_add=a0; p.u16_addbin=[-2:0.1:2];
p.patch=squeeze(z.gf.v0.patch.dsst(:,1,:,:));
i=i1; a=squeeze(p.patch(i,:,:)); p.u16=a; p.du16=mean(a(id).*aa); 
i=i2; a=squeeze(p.patch(i,:,:)); p.u17=a; p.du17=mean(a(id).*aa); 
i=i3; a=squeeze(p.patch(i,:,:)); p.u18=a; p.du18=mean(a(id).*aa); 
i=i4; a=squeeze(p.patch(i,:,:)); p.u19=a; p.du19=mean(a(id).*aa); 
i=i5; a=squeeze(p.patch(i,:,:)); p.u20=a; p.du20=mean(a(id).*aa); 
p.u16_add=a0; p.u16_addbin=[-2:0.1:2];

p.xy=[0 360 -50 90]; p.z1_addbin=[0:100:500]; p.cfact=1;
p.phi_bin=[0:100:300]; p.phi_co='b';
p.patch=z.gf.v0.patch; plot_pattern_effect_Fig_atm_20panel(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
