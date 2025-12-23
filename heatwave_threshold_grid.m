function thresh = heatwave_threshold_grid(Tmax, time, pct, win)
% Tmax: day x lat x lon
% time: day array of length time
% pct: percentile (e.g., [90 95 99])
% win: ± days window (default 15)

if nargin < 3, pct = 90; end
if nargin < 4, win = 15; end

[nt, nlat, nlon] = size(Tmax); %doy=day(time,'dayofyear');
dofy=time; nday=365;
thresh = nan(nday, length(pct), nlat, nlon);

for d = 1:nday
    % circular window
    idx = abs(dofy - d) <= win | abs(dofy - d) >= nday - win;
    if any(idx)
    % percentile across time dimension for this window
      thresh(d,:,:,:) = prctile(Tmax(idx,:,:), pct, 1);
    end
end

return

var=v.tasmaxday.var(1);

Tmax=var.a; dofy=var.dofy; mofy=var.mofy; year=var.year; pct=[90 95]; win=15;

thresh=heatwave_threshold_grid(Tmax,dofy,pct,win);
thresh=squeeze(thresh(:,2,:,:));

[nt,nlat,nlon]=size(Tmax);
nday=365; nyr=floor(nt/nday);
thresh=repmat(thresh,nyr,1);

minlen =3; [hw2d,hwg,hwday]=detect_heatwaves_grid(Tmax,thresh,minlen,year,mofy,dofy);

figure; i=1; a=thresh(i,2,:,:); pcolor(squeeze(a)); shading flat;  colorbar; colormap(jet); caxis([-30 30]);

figure; i=150; a=thresh(i,2,:,:); pcolor(squeeze(a)); shading flat;  colorbar; colormap(jet); caxis([-30 30]);



m=6; a=squeeze(mean(hwg.freq   (:,m,:,:),1)); figure; pcolor(a); shading flat; colorbar;
m=6; a=squeeze(nanmean(hwg.freq(:,m,:,:),1)); figure; pcolor(a); shading flat; colorbar;

f=squeeze(sum(hwg.freq,1));

a=hwg.dura; a=squeeze(sum(a,1)); a=a./f; 
m=6; a=squeeze(a(m,:,:)); figure; pcolor(a); shading flat; caxis([3 7]); colorbar; colormap(jet);

a=hwg.maxI; a=squeeze(sum(a,1)); a=a./f; 
m=6; a=squeeze(a(m,:,:)); figure; pcolor(a); shading flat; caxis([1 5]); colorbar; colormap(jet);

a=hwg.maxI1; a=squeeze(sum(a,1)); a=a./f; 
m=6; a=squeeze(a(m,:,:)); figure; pcolor(a); shading flat; colorbar; colormap(jet);

a=hwg.meanI; a=squeeze(sum(a,1)); a=a./f; 
m=6; a=squeeze(a(m,:,:)); figure; pcolor(a); shading flat; caxis([1 5]); colorbar; colormap(jet);

a=hwg.meanI1; a=squeeze(sum(a,1)); a=a./f; 
m=6; a=squeeze(a(m,:,:)); figure; pcolor(a); shading flat; colorbar; colormap(jet);

