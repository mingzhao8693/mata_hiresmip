function v=get_ar_dis(v)
%frequency of occurrence for tracks and genesis==================
%below is for 5x4 degree resolution 8-point average [-50 50]
%latc=[-89:2:89]; lonc=[1:2:359];
latc=[-88:4:88]; lonc=[2:4:358];
latb=(latc(1:end-1)+latc(2:end))/2; dlatb=(latb(2)-latb(1));
latb(2:end+1)=latb; latb(1)=latb(2)-dlatb; latb(end+1)=latb(end)+dlatb;
lonb=(lonc(1:end-1)+lonc(2:end))/2; dlonb=(lonb(2)-lonb(1));
lonb(2:end+1)=lonb; lonb(1)=lonb(2)-dlonb; lonb(end+1)=lonb(end)+dlonb;

v.latfq=latc; v.lonfq=lonc;
nlat=length(latc); nlon=length(lonc);

fq_ar(1:12,1:v.nyr,1:nlat,1:nlon)=0;
for t=1:v.nyr
  artmp=v.yr(t).ar;
  for n=1:length(artmp)
    ar=artmp(n); id_in=0; disp(n)
    len(k)=ar.length
  end
end

return

figure; 
contourf(v.lonfq,v.latfq,v.fq_ar_ann,20); caxis([0 15]);
shading flat; colorbar; hold on;
contour(v.lon,v.lat,v.lm0,'k');

