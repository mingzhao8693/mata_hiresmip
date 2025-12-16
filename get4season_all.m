function sea=get4season_all(all)
if (length(size(all))==3)
  sea(1,:,:)=squeeze(mean(all(1:12,:,:),1));
  sea(2,:,:)=squeeze(mean(all(3:5, :,:),1));
  sea(3,:,:)=squeeze(mean(all(6:8, :,:),1));
  sea(4,:,:)=squeeze(mean(all(9:11,:,:),1));
  sea(5,:,:)=squeeze((all(12,:,:)+all(1,:,:)+all(2,:,:))/3);
  sea(6,:,:)=squeeze((all(11,:,:)+all(12,:,:)+all(1,:,:)+all(2,:,:)+all(3,:,:))/5);%NDJFM
  sea(7,:,:)=squeeze(mean(all(5:9,:,:),1)); %MJJAS
elseif (length(size(all))==4)
  sea(:,1,:,:)=squeeze(mean(all(:,1:12,:,:),2));
  sea(:,2,:,:)=squeeze(mean(all(:,3:5, :,:),2));
  sea(:,3,:,:)=squeeze(mean(all(:,6:8, :,:),2));
  sea(:,4,:,:)=squeeze(mean(all(:,9:11,:,:),2));
  sea(:,5,:,:)=squeeze((all(:,12,:,:)+all(:,1,:,:)+all(:,2,:,:))/3);
  sea(:,6,:,:)=squeeze((all(:,11,:,:)+all(:,12,:,:)+all(:,1,:,:)+all(:,2,:,:)+all(:,3,:,:))/5);%NDJFM
  sea(:,7,:,:)=squeeze(mean(all(:,5:9,:,:),2)); %MJJAS
end

return
