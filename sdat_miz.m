function [SI]=sdat_miz(s,a)
%  **********       *******                   ***              ************** 
%  **********       ********                  ***              ************** 
%   **              **   ****                *****                  ***
%    **             **     ****             *******                 ***
%     **            **       ****          *********                *** 
%      **           **        ****        ***    ****               ***
%       **          **        ****      ***       ****              *** 
%        **         **       ****      ****************             ***
%         **        **      ****      ******************            *** 
%          **       **    ****       ***              ***           *** 
%  **********       ********        ***                ***          ***
%  **********       *******        ***                 ****         ***

   
% Standardized Drought Analysis Toolbox (SDAT)
% This code can be used to generate standardized indicators such as:
% - SPI: Standardized Precipitation Index 
% - SSI: Standardized Soil Moisture Index
% - SRI: Standardized Runoff Index 
%   (also known as Standardized Streamflow Index, SSFI)
% - SRHI: Standardized Relative Humidity Index
% - SGI: Standardised Groundwater level Index
% - Standardized Surface Water Supply Index (SSWSI) 
% - Standardized Water Storage Index (SWSI)

% Input data should be a matrix of precipitation, soil moisture, etc.
% sc: scale of the index 

% Release 02/01/2015

%Refrences: 
%Farahmand A., AghaKouchak A., 2015, A Generalized Framework for Deriving Nonparametric Standardized Drought Indicators, Advances in Water Resources, 76, 140-145, doi: 10.1016/j.advwatres.2014.11.012
%download reference:  http://amir.eng.uci.edu/publications/15_Drought_Standardized_Index_AWR.pdf

%Hao Z., AghaKouchak A., Nakhjiri N., Farahmand A., 2014, Global Integrated Drought Monitoring and Prediction System, Scientific Data, 1:140001, 1-10, doi: 10.1038/sdata.2014.1. 
%download reference:  http


%% main code
%Input data: a matrix of precipitation data
%Note; for reliable drought assessment, at least 30 years of data is necessary

% sc: scale of the index (>1, e.g., 3-month SPI or SSI)
sc=3;
[p0,nlat,nlon]=size(a);
SI=zeros(p0,nlat,nlon); %a(nmon,nlat,nlon), e.g., a(1200,180,288)
%RK=zeros(p0,nlat,nlon); %a(nmon,nlat,nlon), e.g., a(1200,180,288)
% Compute the SPI for each grid from the prcp or smc data
for ii=1:nlat
  for jj=1:nlon
    td(:,1)=reshape(a(:,ii,jj),p0,1);%td contains monthly time series at a single gridcell
    %For some grid, no observation exist.
    if length(td(td>=0))/length(td)~=1
      SI(:,ii,jj)=nan;
    else
    % Obtain the prcp and smc for the specified time scale and
    % compute the standarized drought index (for SPI and SSI)
      SI(1:sc-1,ii,jj)=NaN;
      A1=[];
      for i=1:sc,  
        A1=[A1,td(i:length(td)-sc+i)];
      end
      Y=sum(A1,2);
      % Compute the SPI or SSI
      nn=length(Y);
      SI1=zeros(nn,1);
      %rnk=zeros(nn,1);
      for k=1:12
        d=Y(k:12:nn);
	nnn=length(d);   %nnn: sample size
        bp=zeros(nnn,1); %bp:the rank of non-zero precipitation data from the smallest
        for i=1:nnn
          bp(i,1)=sum(d(:,1)<=d(i,1));
        end
        y=(bp-0.44)./(nnn+0.12);
        SI1(k:12:nn,1)=y;
	%rnk(k:12:nn,1)=bp;
      end
      SI1(:,1)=norminv(SI1(:,1));
      %output to 3D array
      SI(sc:end,ii,jj)=SI1;
      %RK(sc:end,ii,jj)=rnk;
    end
  end
end

for ii=1:nlat
  for jj=1:nlon
    z=squeeze(SI(:,ii,jj));
    id=(z>=2);           b=sum(id); freq(1,ii,jj)=b;b
    id=(z>1.5 & z<=2);   b=sum(id); freq(2,ii,jj)=b;b
    id=(z>1   & z<=1.5); b=sum(id); freq(3,ii,jj)=b;b
    id=(z>1   & z<=1.5); b=sum(id); freq(4,ii,jj)=b;b
    id=(z>-1  & z<=1);   b=sum(id); freq(5,ii,jj)=b;b
 end
end

figure; pcolor(squeeze(freq(1,:,:))); shading flat; colorbar;

return
%sample output for one time step
%fig=figure(1);%imagesc(squeeze(SI(3,:,:)));
pms=[ 0, 0, 1500, 1200]; row=3; col=2;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); t1=30; z=squeeze(a(t1,:,:));
pcolor(s.lon,s.lat,z); hold on; shading flat; colorbar; caxis([0 20]);
contour(s.lon,s.lat,s.lm,[0 0.5],'w');
subplot(row,col,2); t2=89; z=squeeze(a(t2,:,:));
pcolor(s.lon,s.lat,z); hold on; shading flat; colorbar; caxis([0 20]);
contour(s.lon,s.lat,s.lm,[0 0.5],'w');
fig=subplot(row,col,3); z=squeeze(SI(t1,:,:)); 
pcolor(s.lon,s.lat,z); hold on; shading flat; colorbar;
contour(s.lon,s.lat,s.lm,[0 0.5],'w');
title('Standardized precipitation Index');
load('DroughtColormap','mycmap');
%set(fig,'Colormap',mycmap); colorbar; caxis([-3 3])
fig=subplot(row,col,4); z=squeeze(SI(t2,:,:)); 
pcolor(s.lon,s.lat,z); hold on; shading flat; colorbar;
contour(s.lon,s.lat,s.lm,[0 0.5],'w');
title('Standardized precipitation Index');
load('DroughtColormap','mycmap'); colormap(jet);
%set(fig,'Colormap',mycmap); colorbar; caxis([-3 3])
subplot(row,col,5); z=squeeze(RK(t1,:,:)); 
pcolor(s.lon,s.lat,z); hold on; shading flat; colorbar;
contour(s.lon,s.lat,s.lm,[0 0.5],'w');
%set(fig,'Colormap',mycmap); colorbar; caxis([-3 3])
subplot(row,col,6); z=squeeze(RK(t2,:,:)); 
pcolor(s.lon,s.lat,z); hold on; shading flat; colorbar;
contour(s.lon,s.lat,s.lm,[0 0.5],'w');
%set(fig,'Colormap',mycmap); colorbar; caxis([-3 3])
