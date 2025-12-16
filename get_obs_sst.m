function [obs]=get_obs_sst(s,a,b,Y,y1,y2,alpha)

i1=find(Y==y1); i2=find(Y==y2);
if isempty(i1) | isempty(i2)
  yr1=1979; yr2=2020;
  i1=find(Y==yr1); i2=find(Y==yr2);
end
obs.xt=Y(i1:i2);
a=a(i1:i2,:,:,:); 
b=b(i1:i2,:,:,:); 
obs.sst(:,1:12,:,:)=a;
obs.ice(:,1:12,:,:)=b;
obs.sst(:,13,:,:)=squeeze(mean(a,2));
obs.ice(:,13,:,:)=squeeze(mean(b,2));
obs.sst(:,14,:,:)=squeeze((a(:,12,:,:)+a(:,1,:,:)+a(:,2,:,:))/3);
obs.ice(:,14,:,:)=squeeze((b(:,12,:,:)+b(:,1,:,:)+b(:,2,:,:))/3);
obs.sst(:,15,:,:)=squeeze(mean(a(:,6:8,:,:),2));
obs.ice(:,15,:,:)=squeeze(mean(b(:,6:8,:,:),2));
for m=1:length(obs.sst(1,:,1,1))
  b=squeeze(obs.sst(:,m,:,:));
  x=get_trend_TSR_simple(s,b,obs.xt,alpha);
  obs.trend(m,:,:)=x.trend;
  obs.mean (m,:,:)=x.mean;
end
obs.sst_clm=squeeze(mean(obs.sst,1));
obs.ice_clm=squeeze(mean(obs.ice,1));
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
