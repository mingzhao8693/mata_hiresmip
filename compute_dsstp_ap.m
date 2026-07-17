function [dsstp,ap,dsst,dsstp_g]=compute_dsstp_ap(v,lon,lat,A,lon_w,lat_w_n,lat_w_s)
%A=1.5; lon_w=40; lat_w=15;
lonc=cellfun(@str2num,lon);
latc=cellfun(@str2num,lat);
k=1; area0=4*pi*(6371.22)^2.; 
for j=1:length(latc)
  for i=1:length(lonc)
    lat_p=latc(j); lon_p=lonc(i);
    sst0=squeeze(v.sfc.tsurf.sea(1,:,:));
    dsst0=sst0; dsst0(:,:)=0;
    for m=1:length(v.lat)
      for n=1:length(v.lon)
	x=v.lon(n); y=v.lat(m);
	dx = x-lon_p;
	dy = y-lat_p;
	if abs(dx-360)<=lon_w
	  dx=abs(dx-360);
	end
	if (abs(dx)<=lon_w)
	  if (dy>=0 & dy<=lat_w_n)    %north of lat_p
	    lat_w=lat_w_n;
 	    dsst0(m,n)=A*(cos(pi/2*(dy)/lat_w))^2*(cos(pi/2*(dx)/lon_w))^2;
	  elseif (dy<0 & dy>=-lat_w_s) %south of lat_p
	    lat_w=lat_w_s;
	    dsst0(m,n)=A*(cos(pi/2*(-dy)/lat_w))^2*(cos(pi/2*(dx)/lon_w))^2;
	  end
	end
      end
    end
    %figure; pcolor(v.lon,v.lat,dsst0); shading flat; colorbar; colormap(jet);
    land_th=0.15; ice_th=0.15; %match reasonable well with Bosong's result in weighting factor
    land_th=0.1;  ice_th=0.1;  %more strict condition for forcing grid cell
    for s=1:length(v.imk(:,1,1))
      imk=squeeze(v.imk(s,:,:));
      id=dsst0>0 & v.lm0<=land_th & imk<=ice_th; %this is considered as ocean grids
      dsstp(k,s)=sum(dsst0(id).*v.aa0(id))/sum(v.aa0(id));
      ap(k,s)=sum(v.aa0(id))/sum(sum(v.aa0))*area0;
      dsst0(~id)=0; dsstp_g(k,s)=mean(mean(dsst0.*v.aa0));
      dsst(k,s,:,:)=dsst0;
    end
    k=k+1;
  end
end
return

figure; k=6;
pcolor(v.lon,v.lat,squeeze(dsst(k,:,:))); hold on; shading flat; colorbar; colormap(jet);
contour(v.lon,v.lat,v.lm0);
  
