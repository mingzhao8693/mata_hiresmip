function sea=get4season(clm)
sea(1,:,:)=squeeze(mean(clm(1:12,:,:)));
sea(2,:,:)=squeeze(mean(clm(3:5, :,:)));
sea(3,:,:)=squeeze(mean(clm(6:8, :,:)));
sea(4,:,:)=squeeze(mean(clm(9:11,:,:)));
sea(5,:,:)=squeeze((clm(12,:,:)+clm(1,:,:)+clm(2,:,:))/3);
sea(6,:,:)=squeeze((clm(11,:,:)+clm(12,:,:)+clm(1,:,:)+clm(2,:,:)+clm(3,:,:))/5);%NDJFM
sea(7,:,:)=squeeze(mean(clm(5:9,:,:))); %MJJAS
return
