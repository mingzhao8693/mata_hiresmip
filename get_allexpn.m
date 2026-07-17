function [v]=get_allexpn(opt,v)
if ~exist('v','var') %if varable v does not exist
  tpath='/archive/Ming.Zhao/awg/xanadu/'; expn0='c96L33_am4p0_2010climo';
  fn=strcat(tpath,expn0,'/',expn0,'_global_opt0.c96_tsana_gf_2_11.mat')
  load(fn); v.imk_clm=v.sfc.ice.clm; v.imk_sea=v.sfc.ice.sea; v.imk=v.imk_clm;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pexp='A1p5'; A=1.5; lon_w=40; lat_w1=15; lat_w2=20; area0=4*pi*(6371.0)^2.;

lat={'0.0'}; lon={'0.0' '40.0' '80.0' '120.0' '160.0' '200.0' '240.0' '280.0' '320.0'};
lat=string(lat); lon=string(lon); k=0; clear latc lonc;
for j=1:length(lat);
  for i=1:length(lon);
    k=k+1; expn1(k)=strcat(pexp,'.',lat(j),'_',lon(i));
    latc(k)=str2num(lat(j)); lonc(k)=str2num(lon(i));
  end;
end
[a,b,c,d]=compute_dsstp_ap(v,lon,lat,A,lon_w,15.0,15.0);
dsstp1=a; ap1=b; dsst1=c; dsstp_g1=d; latc1=latc; lonc1=lonc;
%figure; k=1; %test plotting
%pcolor(v.lon,v.lat,squeeze(dsst1(k,1,:,:))); hold on; shading flat; colorbar; colormap(jet);
%contour(v.lon,v.lat,v.lm0);

lat={'-7.5' '7.5'}; lon={'-20.0' '20.0' '60.0' '100.0' '140.0' '180.0' '220.0' '260.0' '300.0'};
lat=string(lat); lon=string(lon); k=0; clear latc lonc;
for j=1:length(lat);
  for i=1:length(lon);
    k=k+1; expn2(k)=strcat(pexp,'.',lat(j),'_',lon(i));
    latc(k)=str2num(lat(j)); lonc(k)=str2num(lon(i));
  end;
end
[a,b,c,d]=compute_dsstp_ap(v,lon,lat,A,lon_w,15.0,15.0);
dsstp2=a; ap2=b; dsst2=c; dsstp_g2=d; latc2=latc; lonc2=lonc;
  
lat={'-15.0' '15.0'};lon={'0.0' '40.0' '80.0' '120.0' '160.0' '200.0' '240.0' '280.0' '320.0'}; 
lat=string(lat); lon=string(lon); k=0; clear latc lonc;
for j=1:length(lat);
  for i=1:length(lon);
    k=k+1; expn3(k)=strcat(pexp,'.',lat(j),'_',lon(i));
    latc(k)=str2num(lat(j)); lonc(k)=str2num(lon(i));
  end;
end
[a,b,c,d]=compute_dsstp_ap(v,lon,lat,A,lon_w,15.0,15.0);
dsstp3=a; ap3=b; dsst3=c; dsstp_g3=d; latc3=latc; lonc3=lonc;

lat={'-22.5' '22.5'}; lon={'-20.0' '20.0' '60.0' '100.0' '140.0' '180.0' '220.0' '260.0' '300.0'}; 
lat=string(lat); lon=string(lon); k=0; clear latc lonc;
for j=1:length(lat);
  for i=1:length(lon);
    k=k+1; expn4(k)=strcat(pexp,'.',lat(j),'_',lon(i));
    latc(k)=str2num(lat(j)); lonc(k)=str2num(lon(i));
  end;
end
[a,b,c,d]=compute_dsstp_ap(v,lon,lat,A,lon_w,15.0,15.0);
dsstp4=a; ap4=b; dsst4=c; dsstp_g4=d; latc4=latc; lonc4=lonc;

lat={'-30.0' '30.0'}; lon={'0.0' '40.0' '80.0' '120.0' '160.0' '200.0' '240.0' '280.0' '320.0'};
lat=string(lat); lon=string(lon); k=0; clear latc lonc;
for j=1:length(lat);
  for i=1:length(lon);
    k=k+1; expn5(k)=strcat(pexp,'.',lat(j),'_',lon(i));
    latc(k)=str2num(lat(j)); lonc(k)=str2num(lon(i));
  end;
end
[a1,b1,c1,d1]=compute_dsstp_ap(v,lon,lat(1),A,lon_w,15.0,25.0);
[a2,b2,c2,d2]=compute_dsstp_ap(v,lon,lat(2),A,lon_w,25.0,15.0);
dsstp5=[a1;a2]; ap5=[b1;b2]; dsst5=[c1;c2]; dsstp_g5=[d1;d2];
latc5=latc; lonc5=lonc;

lat={'-37.5' '37.5'}; lon={'-20.0' '20.0' '60.0' '100.0' '140.0' '180.0' '220.0' '260.0' '300.0'};
lat=string(lat); lon=string(lon); k=0; clear latc lonc;
for j=1:length(lat);
  for i=1:length(lon);
    k=k+1; expn6(k)=strcat(pexp,'.',lat(j),'_',lon(i));
    latc(k)=str2num(lat(j)); lonc(k)=str2num(lon(i));
  end;
end
[a1,b1,c1,d1]=compute_dsstp_ap(v,lon,lat(1),A,lon_w,15.0,25.0);
[a2,b2,c2,d2]=compute_dsstp_ap(v,lon,lat(2),A,lon_w,25.0,15.0);
dsstp6=[a1;a2]; ap6=[b1;b2]; dsst6=[c1;c2]; dsstp_g6=[d1;d2];
latc6=latc; lonc6=lonc;

lat={'-50.0' '50.0'}; lon={'0.0' '40.0' '80.0' '120.0' '160.0' '200.0' '240.0' '280.0' '320.0'};
lat=string(lat); lon=string(lon); k=0; clear latc lonc;
for j=1:length(lat);
  for i=1:length(lon);
    k=k+1; expn7(k)=strcat(pexp,'.',lat(j),'_',lon(i));
    latc(k)=str2num(lat(j)); lonc(k)=str2num(lon(i));
  end;
end
[a1,b1,c1,d1]=compute_dsstp_ap(v,lon,lat(1),A,lon_w,15.0,25.0);
[a2,b2,c2,d2]=compute_dsstp_ap(v,lon,lat(2),A,lon_w,25.0,15.0);
dsstp7=[a1;a2]; ap7=[b1;b2]; dsst7=[c1;c2]; dsstp_g7=[d1;d2];
latc7=latc; lonc7=lonc;

lat={'-62.5' '62.5'}; lon={'-20.0' '20.0' '60.0' '100.0' '140.0' '180.0' '220.0' '260.0' '300.0'};
lat=string(lat); lon=string(lon); k=0; clear latc lonc;
for j=1:length(lat);
  for i=1:length(lon);
    k=k+1; expn8(k)=strcat(pexp,'.',lat(j),'_',lon(i));
    latc(k)=str2num(lat(j)); lonc(k)=str2num(lon(i));
  end;
end
[a,b,c,d]=compute_dsstp_ap(v,lon,lat,A,lon_w,25.0,25.0);
dsstp8=a; ap8=b; dsst8=c; dsstp_g8=d;
latc8=latc; lonc8=lonc;

lat ={'-75.0' '75.0'}; lon={'0.0' '40.0' '80.0' '120.0' '160.0' '200.0' '240.0' '280.0' '320.0'};
lat=string(lat); lon=string(lon); k=0; clear latc lonc;
for j=1:length(lat);
  for i=1:length(lon);
    k=k+1; expn9(k)=strcat(pexp,'.',lat(j),'_',lon(i));
    latc(k)=str2num(lat(j)); lonc(k)=str2num(lon(i));
  end;
end
[a,b,c,d]=compute_dsstp_ap(v,lon,lat,A,lon_w,25.0,25.0);
dsstp9=a; ap9=b; dsst9=c; dsstp_g9=d;
latc9=latc; lonc9=lonc;

%combine all patch experiments
expn=[expn1 expn2 expn3 expn4 expn5 expn6 expn7 expn8 expn9];
latc=[latc1 latc2 latc3 latc4 latc5 latc6 latc7 latc8 latc9];
lonc=[lonc1 lonc2 lonc3 lonc4 lonc5 lonc6 lonc7 lonc8 lonc9];
dsstp=[dsstp1;dsstp2;dsstp3;dsstp4;dsstp5;dsstp6;dsstp7;dsstp8;dsstp9]; 
ap=[ap1;ap2;ap3;ap4;ap5;ap6;ap7;ap8;ap9]; 
dsst=[dsst1;dsst2;dsst3;dsst4;dsst5;dsst6;dsst7;dsst8;dsst9];
dsstp_g=[dsstp_g1;dsstp_g2;dsstp_g3;dsstp_g4;dsstp_g5;dsstp_g6;dsstp_g7;dsstp_g8;dsstp_g9]; 

%interpolate to lower resolution from 180x288 to 90x144
if opt == 1
  v0=v; expn_cntl=strcat(expn0,'_GF');
  fn=strcat(tpath,expn_cntl,'/',expn_cntl,'_global_opt2.c48_tsana_gf_2_31.mat')
%  fn='/archive/Ming.Zhao/awg/2023.04/c96L33_am4p0_2010climo/c96L33_am4p0_2010climo_global_opt2.c48_tsana_gf_2_101.mat'
  load(fn); s=v.s; %below intepolate everything to s.lat s.lon grid
  a=dsst; np=length(a(:,1,1,1)); nt=length(a(1,:,1,1));
  a=reshape(dsst,np*nt,v0.nlat,v0.nlon);
  dsst=interp_grid(a,s.lon,s.lat,v0.lon,v0.lat,1); %a=dsst;
  v.imk_clm=interp_grid(v.sfc.ice.clm,s.lon,s.lat,v.lon,v.lat,1);
  v.imk_sea=interp_grid(v.sfc.ice.sea,s.lon,s.lat,v.lon,v.lat,1);
end

%derive weight factor: wfact to be used to compute Green's Function
ngrid=v.nlat*v.nlon;
dsst_j=reshape(dsst,np,nt,ngrid); %dsst_j(152,12960)
a=sum(dsst_j,1); dsst_j_sum_p=repmat(a,[np 1 1]);
%dsst_j_norm=dsst_j./dsst_j_sum_p;

a=reshape(v.aa0,1,ngrid); a=a/sum(a)*area0;
aj=repmat(a,[nt 1]);
a_j(1,:,:)=aj; a_j=repmat(a_j,[np 1 1]);

a_p   =repmat(ap,   [1 1 ngrid]); 
dsst_p=repmat(dsstp,[1 1 ngrid]); 

%wfact = dsst_j_norm .* a_j ./ (a_p.*dsst_p);
wfact = dsst_j.* a_j ./ dsst_j_sum_p ./ (a_p.*dsst_p);

id=(dsst_j_sum_p==0); wfact(id)=0;

z.expn=expn; z.latc=latc; z.lonc=lonc; z.tpath=tpath; z.expn0=expn0; 
z.dsstp=dsstp; z.ap=ap; z.dsstp_g=dsstp_g;
z.wfact=wfact; z.dsst=reshape(dsst,np,nt,s.nlat,s.nlon);
v.patch=z;

return

%below are important tests, do not delete%%%%%%%%%%%%%%%%%%%%
%plotting all the patches to test if dsst is correct%%%%%%%%%
x=v.lon; y=v.lat; a=dsst; a=reshape(a,np,nt,v.nlat,v.nlon);
for k=1:152
  figure;  m=1; pcolor(x,y,squeeze(a(k,m,:,:)));shading flat; colorbar; %caxis([0 0.001]);
  colormap(jet);hold on; contour(x,y,v.lm0,1,'w');
end
%end of test%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%test plot of weight fact
%note wfact in current formulation included dsst_p term so it is defined differently
%from those in Bosong's calculation which does not include dsst_p
x=v.lon; y=v.lat; a=reshape(wfact,np,nt,v.nlat,v.nlon);

fn='/work/Bosong.Zhang/pattern/low_reso_A1p5/matrixb_npatch_times_j_01.nc'
b=ncread(fn,'dsst_j_times_a_j_over_a_p_over_sig_dsst_j',[1 1],[Inf Inf]);
b=b'; b=reshape(b,152,v.nlon,v.nlat); c=permute(b,[1 3 2]);

figure; k=6; pcolor(x,y,squeeze(a(k,1,:,:)));shading flat; colorbar; caxis([0 0.001]);colormap(jet);hold on; contour(x,y,v.lm0,1,'w');
figure; k=4; pcolor(x,y,squeeze(c(k,  :,:)));shading flat; colorbar; caxis([0 0.001]);colormap(jet);hold on; contour(x,y,v.lm0,1,'w');
%end of test%%%%%%%%%%%%%%%
