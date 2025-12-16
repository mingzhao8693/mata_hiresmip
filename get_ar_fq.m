function f=get_ar_fq(v,opt)
%frequency of occurrence for tracks and genesis==================
%below is for 5x4 degree resolution 8-point average [-50 50]
%latc=[-89:2:89]; lonc=[1:2:359];
latc=[-88:4:88]; lonc=[2:4:358];
latb=(latc(1:end-1)+latc(2:end))/2; dlatb=(latb(2)-latb(1));
latb(2:end+1)=latb; latb(1)=latb(2)-dlatb; latb(end+1)=latb(end)+dlatb;
lonb=(lonc(1:end-1)+lonc(2:end))/2; dlonb=(lonb(2)-lonb(1));
lonb(2:end+1)=lonb; lonb(1)=lonb(2)-dlonb; lonb(end+1)=lonb(end)+dlonb;

f.lat=latc; f.lon=lonc; f.latb=latb; f.lonb=lonb;
nlat=length(latc); nlon=length(lonc);
fq_ar   (1:12,1:v.nyr,1:nlat,1:nlon)=0;
fq_ar_lf(1:12,1:v.nyr,1:nlat,1:nlon)=0;

if (opt==0)
  for t=1:v.nyr
    artmp=v.yr(t).ar;
    for n=1:length(artmp)
      ar=artmp(n); id_in=0; disp(n)
      for j=1:nlat
	for i=1:nlon
	  id_in=0;
	  if (ar.clon>lonb(i) & ar.clon<=lonb(i+1) & ...
	      ar.clat>latb(j) & ar.clat<=latb(j+1))
	    id_in=1;
	    for m=1:12
	      if (ar.mmm==m)
		fq_ar(m,t,j,i)=fq_ar(m,t,j,i)+1; break;
	      end
	    end
	  end
	end
      end
    end
  end
else
  ar=v.ar;
  for t=1:v.nyr
    for m=1:12
      disp(strcat('year=',num2str(v.yrt(t)),';mon=', num2str(m)));
      for j=1:nlat
	for i=1:nlon
          id=(ar.yyy==v.yrt(t)) & (ar.mmm==m) & ...
	     (ar.clon>lonb(i) & ar.clon<=lonb(i+1)) &...
	     (ar.clat>latb(j) & ar.clat<=latb(j+1));
	  fq_ar(m,t,j,i)=fq_ar(m,t,j,i)+sum(id);
	  
          idl=(ar.yyy==v.yrt(t)) & (ar.mmm==m) & ...
	      (ar.llon>lonb(i) & ar.clon<=lonb(i+1)) &...
	      (ar.llat>latb(j) & ar.clat<=latb(j+1));
	  fq_ar_lf(m,t,j,i)=fq_ar_lf(m,t,j,i)+sum(idl);
	end
      end
    end
  end
end

fq_ar_clm   =squeeze(mean(fq_ar,2));
fq_ar_ann   =squeeze(sum(fq_ar_clm,1));
fq_ar_lf_clm=squeeze(mean(fq_ar_lf,2));
fq_ar_lf_ann=squeeze(sum(fq_ar_lf_clm,1));

f.fq_ar     = fq_ar;
f.fq_ar_clm = fq_ar_clm;
f.fq_ar_ann = fq_ar_ann;

f.fq_ar_lf     = fq_ar_lf;
f.fq_ar_clm_lf = fq_ar_lf_clm;
f.fq_ar_ann_lf = fq_ar_lf_ann;

return

figure; 
contourf(v.lonfq,v.latfq,v.fq_ar_ann,20); caxis([0 15]);
shading flat; colorbar; hold on;
contour(v.lon,v.lat,v.lm0,'k');

