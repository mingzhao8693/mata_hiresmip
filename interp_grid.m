function [varo]=interp_grid(vari,lonx,latx,lon,lat,opt)
%interpolate from lat lon to latx lonx
%nlon=length(lon); dlon=lon(2)-lon(1);
lon(1)  =min(lon(1),  lonx(1));
lon(end)=max(lon(end),lonx(end));
lat(1)  =min(lat(1),  latx(1));
lat(end)=max(lat(end),latx(end));
[latx lonx] = meshgrid(lonx, latx); 
[lat  lon]  = meshgrid(lon,  lat);
n=length(size(vari));
if (n==2)
  b=interp2(lat,lon,vari,latx,lonx); 
%  if (opt==1)
%    b(:,1)=b(:,2); b(:,end)=b(:,end-1); 
%    b(1,:)=b(2,:); b(end,:)=b(end-1,:);
%  end
  varo=b;
elseif (n==3)
   for t=1:length(vari(:,1,1))
    a=squeeze(vari(t,:,:)); 
    b=interp2(lat,lon,a,latx,lonx); 
%    if (opt==1)
%      b(:,1)=b(:,2); b(:,end)=b(:,end-1); 
%      b(1,:)=b(2,:); b(end,:)=b(end-1,:);
%    end
    varo(t,:,:)=b;
   end
elseif (n==4)
   for m=1:length(vari(:,1,1,1))
     for t=1:length(vari(1,:,1,1))
       a=squeeze(vari(m,t,:,:)); 
       b=interp2(lat,lon,a,latx,lonx); 
%    if (opt==1)
%      b(:,1)=b(:,2); b(:,end)=b(:,end-1); 
%      b(1,:)=b(2,:); b(end,:)=b(end-1,:);
%    end
       varo(t,m,:,:)=b;
     end
   end
end 
return
