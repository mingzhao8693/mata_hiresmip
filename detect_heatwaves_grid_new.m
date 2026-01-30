function [hw2d,hwg,hwday,hwtmx] = detect_heatwaves_grid_new(Tmax, thresh, minlen, year, mofy, dofy)
% Detect heatwaves on a grid and aggregate to year × month × lat × lon
% Tmax: [time × lat × lon]
% thresh: [time × lat × lon]
% minlen: minimum consecutive days (default = 3)
% year, mofy: precomputed datetime arrays per time step
% hw2d: structure array per grid cell with event details
% hwfreq_ym: 4D array [year × month × lat × lon]

if nargin < 3, minlen = 3; end

%minlen=3; thresh=squeeze(thresh(:,2,:,:));

hwg.thresh=thresh;
[nt, nlat, nlon] = size(Tmax);
nday=365; nyr=floor(nt/nday); yrs=[1:1:nyr];
thresh=repmat(thresh,nyr,1); %%Tmax= reshape(Tmax,nyr,nday,nlat,nlon);

is_hot = Tmax > thresh;   % logical array lat x lon x time
hw2d(nlat,nlon).hw = [];
hwday=Tmax; hwday(:,:,:)=0; 
hwtmx=Tmax; hwtmx(:,:,:)=0; 

% Loop only over grid points (cannot avoid this completely)
for i = 1:nlat
  disp(i);
  for j = 1:nlon
    seq = is_hot(:,i,j);
    events = bwlabel(seq);  % consecutive hot days
    nE = max(events); 
    hw = struct([]);
    n=0;
    for e = 1:nE
      idx = (events == e);
      if sum(idx) >= minlen
	n=n+1;
	hw(n).year=year(idx);
	hw(n).mofy=mofy(idx);
	hw(n).dofy=dofy(idx);
        hw(n).duration = sum(idx);
        hw(n).meanI = mean(Tmax(idx,i,j) - thresh(idx,i,j));
        hw(n).maxI  = max (Tmax(idx,i,j) - thresh(idx,i,j));
        hw(n).meanI1= mean(Tmax(idx,i,j));
        hw(n).maxI1 = max (Tmax(idx,i,j));
	hwday(idx,i,j)=1;
	hwtmx(idx,i,j)=Tmax(idx,i,j) - thresh(idx,i,j);
      end
    end
    if n > 0
      hw2d(i,j).hw=hw;
    else
      hw2d(i,j).hw=[]; 
    end
  end
end

nmon=12;
hwg.freq   = zeros(nyr,nmon,nlat,nlon,'uint16');
hwg.dura   = zeros(nyr,nmon,nlat,nlon,'single');
hwg.maxI   = zeros(nyr,nmon,nlat,nlon,'single');
hwg.meanI  = zeros(nyr,nmon,nlat,nlon,'single');
hwg.maxI1  = zeros(nyr,nmon,nlat,nlon,'single');
hwg.meanI1 = zeros(nyr,nmon,nlat,nlon,'single');

for i = 1:nlat
  disp(i);
  for j = 1:nlon
    hw=hw2d(i,j).hw;
    if isempty(hw)
      continue
    end
    for k = 1:numel(hw)
% Unique year–month bins touched by this event
      uym = unique(hw(k).year * 100 + hw(k).mofy);
      for m = 1:numel(uym)
        yy = floor(uym(m) / 100);
        mm = mod(uym(m), 100);
        iy = find(yrs == yy);
        hwg.freq  (iy,mm,i,j) = hwg.freq  (iy,mm,i,j) + 1;
        hwg.dura  (iy,mm,i,j) = hwg.dura  (iy,mm,i,j) + hw(k).duration;
        hwg.maxI  (iy,mm,i,j) = hwg.maxI  (iy,mm,i,j) + hw(k).maxI;
        hwg.meanI (iy,mm,i,j) = hwg.meanI (iy,mm,i,j) + hw(k).meanI;
        hwg.maxI1 (iy,mm,i,j) = hwg.maxI1 (iy,mm,i,j) + hw(k).maxI1;
        hwg.meanI1(iy,mm,i,j) = hwg.meanI1(iy,mm,i,j) + hw(k).meanI1;
      end
    end
  end
end
a = hwg.freq; id = a~=0; 
hwg.dura  (id) = hwg.dura  (id) ./  double(a(id));
hwg.maxI  (id) = hwg.maxI  (id) ./  double(a(id));
hwg.meanI (id) = hwg.meanI (id) ./  double(a(id));
hwg.maxI1 (id) = hwg.maxI1 (id) ./  double(a(id));
hwg.meanI1(id) = hwg.meanI1(id) ./  double(a(id));

return
	
