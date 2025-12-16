function myidx=lonlat2idx(mylon,mylat,lon,lat,is_geographic,is_even_lat,degree_to_meter)
% convert arbitrary lon/lat coordinates to linear indices
[n,m]=size(mylon);
[nrow,ncol]=size(lon);
lons=lon(1,1); dlon=lon(2,1)-lon(1,1);
lats=lat(1,1); dlat=lat(1,2)-lat(1,1); latdef=lat(1,:);
mylon=mylon(:);
mylat=mylat(:);
lon=lon(:);
lat=lat(:);
mylon(mylon<min(lon))=mylon(mylon<min(lon))+360; % for consistency with range of lon 
mylon(mylon>=min(lon)+360)=mylon(mylon>=min(lon)+360)-360; % for consistency with range of lon; note that [mylat(?),mylon(?)] can still be outside of input grid when input grid is non-global or non-geographic - to be dealt with below
if is_geographic & is_even_lat % use a simple/fast method in this case
  myrow=round((mylon-lons)/dlon+1); myrow(myrow>360/dlon)=myrow(myrow>360/dlon)-360/dlon;
  mycol=round((mylat-lats)/dlat+1);
  myrow(myrow<1)=NaN; myrow(myrow>nrow)=NaN;
  mycol(mycol<1)=NaN; mycol(mycol>ncol)=NaN;
  myidx=sub2ind([nrow,ncol],myrow,mycol);
elseif is_geographic & ~is_even_lat % use an alternative/fast method in this case 
  myrow=round((mylon-lons)/dlon+1); myrow(myrow>360/dlon)=myrow(myrow>360/dlon)-360/dlon;
  edges=[latdef(1)-(latdef(2)-latdef(1))/2,(latdef(1:end-1)+latdef(2:end))/2,latdef(end)+(latdef(end)-latdef(end-1))/2];
  [null,mycol]=histc(mylat,edges);
  myrow(myrow<1)=NaN; myrow(myrow>nrow)=NaN;
  mycol(mycol<1)=NaN; mycol(mycol>ncol)=NaN;
  myidx=sub2ind([nrow,ncol],myrow,mycol);
else % only a slow method can be used in this case
  [myidx,nrst_dist]=knnsearch([lat,lon],[mylat,mylon],'k',1);
  myidx(nrst_dist>dlon*degree_to_meter)=NaN;
end
myidx=reshape(myidx,[n,m]);
return
