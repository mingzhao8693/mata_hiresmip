function x=gfsstp_slow(var, varp, p_thresh, g, optx)
%here is a slower way to compute GF reconstruction
%but it may allow more SST pattern manipulation and attribution
nlon=g.nlon; nlat=g.nlat; %(144 x 90)
%below is GF calculation
for m=1:12;
  a=var(:,:,m); a=squeeze(a); a=g.wei*a'; 
  x.gf(m,:,:)=a;
end
x.gf_ann=squeeze(mean(x.gf,1)); 
aa=reshape(g.aa',nlon*nlat,1); aa=repmat(aa,[1 nlon*nlat]);
varx=aa.*x.gf_ann;  
a=squeeze(sum(varx,2)); a=reshape(a,nlon,nlat); a=a';
x.gf_ann_g=a; x.gf_ann_g0=mean(mean(a.*g.aa));
a=squeeze(sum(varx,1)); a=reshape(a,nlon,nlat); a=a';
x.gf_ann_u=a; x.gf_ann_u0=mean(mean(a.*g.aa));

nt=length(g.sstp(1,1,:)); %time dimension

%using GF to do reconstruction
for m=1:12; m
  for t=1:nt;
    %Tp is SST anomaly
    Tp=squeeze(g.Tp(t,m,:));%this is SST anomaly data
    a=reshape(Tp,nlon,nlat); 
    
    a=squeeze(mean(a,1)); a=repmat(a,[nlon,1]);
    Tp_z=a; Tp_z=reshape(a,nlon*nlat,1);
    Tp_r=Tp-Tp_z;
    %figure; pcolor(a'); shading flat; colorbar; colormap(jet); caxis([-5 5]);
    
    %reconstruction by multiplying SSTA
    ssta=Tp;
    a=squeeze(x.gf(m,:,:)); a=a'*ssta;
    a=reshape(a,nlon,nlat); a=a'; %figure; pcolor(a'); shading flat;colorbar;colormap(jet)
    x.map_gf_mon(t,m,:,:)=a;
    x.ts_mon(t,m)=mean(mean(a.*g.aa));
    
    %reconstruction by multiplying SSTA
    ssta=Tp_z;
    a=squeeze(x.gf(m,:,:)); a=a'*ssta;
    a=reshape(a,nlon,nlat); a=a'; %figure; pcolor(a'); shading flat;colorbar;colormap(jet)
    x.map_gf_mon_z(t,m,:,:)=a;
    x.ts_mon_z(t,m)=mean(mean(a.*g.aa));
    
    %reconstruction by multiplying SSTA
    ssta=Tp_r;
    a=squeeze(x.gf(m,:,:)); a=a'*ssta;
    a=reshape(a,nlon,nlat); a=a'; %figure; pcolor(a'); shading flat;colorbar;colormap(jet)
    x.map_gf_mon_r(t,m,:,:)=a;
    x.ts_mon_r(t,m)=mean(mean(a.*g.aa));
  end
end
x.map_gf_ann=squeeze(mean(x.map_gf_mon,2)); 
x.ts_ann=squeeze(mean(x.ts_mon,2)); 

x.map_gf_ann_z=squeeze(mean(x.map_gf_mon_z,2)); 
x.ts_ann_z=squeeze(mean(x.ts_mon_z,2)); 

x.map_gf_ann_r=squeeze(mean(x.map_gf_mon_r,2)); 
x.ts_ann_r=squeeze(mean(x.ts_mon_r,2));

return
