function s=get_mon_stat_sim(a,id,opt)
%a(nt,nlat,nlon); id(nt,nlat,nlon); 
%b=a.*id;                   %conditional sampling of AR/id
%b_sum =sum(b,1);          %sum of all values of a with AR id=1
%id_sum=sum(id,1);         %sum of all AR id (occurrence)
%c=squeeze(b_sum./id_sum); %average of the value for AR
%c(isnan(c))=0;            %s.arfq =squeeze(mean(id,1)); s.arall=squeeze(mean(b,1));
%s.ar   =squeeze(c);
%s.armax1=squeeze(max(b,[],1));
%s.arfq =squeeze(mean(id,1)); s.arfqs=squeeze(sum (id,1));

pct  =[90 99 99.9];
s.av =squeeze(mean(a, 1));  %monthly average

if exist('opt')
  if (opt==0)
    b=a.*id; d=b; d(~id)=NaN;
    s.ar   =squeeze(mean   (b,1));
    s.aravg=squeeze(nanmean(d,1)); 
    s.armax=squeeze(nanmax(d,[],1)); 
  elseif (opt==1)
    s.pct=prctile(a,pct,1); s.pct_values=pct;
    b=a.*id; d=b; d(~id)=NaN;
    s.ar   =squeeze(mean   (b,1));
    s.aravg=squeeze(nanmean(d,1)); 
    s.armax=squeeze(nanmax(d,[],1)); 
    s.arpct=prctile(d,pct,1); 
  elseif (opt==2)
    s.pct=prctile(a,pct,1); s.pct_values=pct;
    b=a.*id; d=b; d(~id)=NaN;
    s.ar   =squeeze(mean   (b,1));
    s.aravg=squeeze(nanmean(d,1)); 
    s.armax=squeeze(nanmax(d,[],1)); 
    s.arpct=prctile(d,pct,1); 
    %compute frequency of absolute rain
    nnn=length(a(:,1,1));
    idx=(a>1);      s.f(1,:,:)=squeeze(sum(idx,1)/nnn); %precip>1mm/day: rain
    idx=(a>2.5*24); s.f(2,:,:)=squeeze(sum(idx,1)/nnn); %precip>60mm/day:moderate_rain
    idx=(a>7.6*24); s.f(3,:,:)=squeeze(sum(idx,1)/nnn); %precip>182.5mm/day:heavy_rain
    idx=(a>10.*24); s.f(4,:,:)=squeeze(sum(idx,1)/nnn); %precip>240mm/day:heavy_rain
    idx=(a>20.*24); s.f(5,:,:)=squeeze(sum(idx,1)/nnn); %precip>480mm/day:voilent_rain
    %compute fractional of a (rain) percentile rain contributed from AR
    nlat=length(a(1,:,1));
    nlon=length(a(1,1,:));
    npct=length(s.pct_values);
    for j=1:nlat
      for i=1:nlon
	for k=1:npct
	  pctx=s.pct(k,j,i); c=a(:,j,i);
	  idx=c>pctx; nnn=sum(idx);
	  arno=sum(id(idx,j,i),1);
	  s.fr_ar(k,j,i)=arno/nnn;
	end
      end
    end
    s.arfq =squeeze(mean(id,1)); 
    s.arfqs=squeeze(sum (id,1));
  elseif (opt==3)
    s.pct=prctile(a,pct,1); s.pct_values=pct;
    b=a.*id; d=b; d(~id)=NaN;
    s.ar   =squeeze(mean   (b,1));
    s.aravg=squeeze(nanmean(d,1)); 
    s.armax=squeeze(nanmax(d,[],1)); 
    s.arpct=prctile(d,pct,1);
    nnnn=length(a(:,1,1));
    nlat=length(a(1,:,1));
    nlon=length(a(1,1,:));
    npct=length(s.pct_values);
    for j=1:nlat
      for i=1:nlon
	for k=1:npct
	  pctx=s.pct(k,j,i); c=a(:,j,i);
	  idx=c>pctx; nnn=sum(idx); 
	  arno=sum(id(idx,j,i),1);
	  %if (arno>0)
	  %  disp(strcat('nnn=',num2str(nnn),';arno=',num2str(arno),';'num2str(nnnn)));
	  %end
	  s.frac_ar(k,j,i)=arno/nnn;
	end
      end
    end

  elseif (opt==-1)
    s.p01 =squeeze(prctile(a,1.0,1));   %1   percentile
    %s.p001=squeeze(prctile(a,0.1,1));  %0.1 percentile
  end
end

return
%a(nt,nlat,nlon); id(nt,nlat,nlon); 
b=a.*id;                   %conditional sampling of AR/id
%b_sum =sum(b,1);          %sum of all values of a with AR id=1
%id_sum=sum(id,1);         %sum of all AR id (occurrence)
%c=squeeze(b_sum./id_sum); %average of the value for AR
%c(isnan(c))=0;            %s.arfq =squeeze(mean(id,1)); s.arall=squeeze(mean(b,1));
%s.ar   =squeeze(c);
%s.armax1=squeeze(max(b,[],1));

d=b; d(~id)=NaN; %s.arpct=prctile(d,[90],1); 
s.ar   =squeeze(nanmean(d,1)); 
s.armax=squeeze(nanmax(d,[],1)); 
%s.arfq=squeeze(mean(id,1));

if exist('opt') 
  if (opt==1)
    s.av=squeeze(mean(a, 1));%monthly average
  elseif (opt==2)
    s.av  =squeeze(mean(a, 1));         %monthly average
    s.p85 =squeeze(prctile(a,85,1));    %85 percentile
    s.p99 =squeeze(prctile(a,99,1));    %99 percentile
    s.p999=squeeze(prctile(a,99.9,1));  %99.9 percentile
  elseif (opt==3)
    pct1 = [25 50 75 90 99 99.9];
    pct2 = [25 50 75 90 99];
    s.av   =squeeze(mean(a, 1));         %monthly average
    s.pct  =prctile(a,pct1,1);
    s.arpct=prctile(d,pct2,1); 
    s.arfq =squeeze(mean(id,1));
    %s.p90 =squeeze(prctile(a,90,1));    %90 percentile of 6h averaged pr
    %s.p99 =squeeze(prctile(a,99,1));    %99 percentile of 6h averaged pr
    %s.p999=squeeze(prctile(a,99.9,1));  %99.9 percentile of 6h averaged pr

    nnn=length(a(:,1,1));
    idx=(a>1);      s.f1=squeeze(sum(idx,1)/nnn); %precip>1mm/day: rain
    idx=(a>2.5*24); s.f2=squeeze(sum(idx,1)/nnn); %precip>60mm/day:moderate_rain
    idx=(a>7.6*24); s.f3=squeeze(sum(idx,1)/nnn); %precip>182.5mm/day:heavy_rain
    idx=(a>10.*24); s.f4=squeeze(sum(idx,1)/nnn); %precip>240mm/day:heavy_rain
    idx=(a>20.*24); s.f5=squeeze(sum(idx,1)/nnn); %precip>480mm/day:voilent_rain
  elseif (opt==-1)
    s.av  =squeeze(mean(a, 1));%monthly average
    s.p01 =squeeze(prctile(a,1.0,1));   %1   percentile
    %s.p001=squeeze(prctile(a,0.1,1));  %0.1 percentile
  end
else
  s.av  =squeeze(mean(a, 1));         %monthly average
  s.p99 =squeeze(prctile(a,99,1));    %99 percentile
  %s.p999=squeeze(prctile(a,99.9,1)); %99.9 percentile
end

return
