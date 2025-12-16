function sea=get7season(a,opt)
if (opt==0)
  %a(1,2,3,4,5,6,7,8,9,10,11,12,13,14]
  %a(N,D,J,F,M,A,M,J,J,Au,Se,Oc,No,De]
  sea(1)= nanmean(a(2:4));    %DJF
  sea(2)= nanmean(a(5:7));    %MAM
  sea(3)= nanmean(a(8:10));   %JJA
  sea(4)= nanmean(a(11:13));  %SON
  sea(5)= nanmean(a(1:5));    %NDJFM
  sea(6)= nanmean(a(7:11));   %MJJAS
  sea(7)= nanmean(a(3:14));   %ANN
  sea(8:8+12-1)=a(3:14);      %MON
elseif (opt==1)
  sea(1,:,:)=nanmean(a(2:4,  :,:),1); %DJF
  sea(2,:,:)=nanmean(a(5:7,  :,:),1); %MAM
  sea(3,:,:)=nanmean(a(8:10, :,:),1); %JJA
  sea(4,:,:)=nanmean(a(11:13,:,:),1); %SON
  sea(5,:,:)=nanmean(a(1:5,  :,:),1); %NDJFM
  sea(6,:,:)=nanmean(a(7:11, :,:),1); %MJJAS
  sea(7,:,:)=nanmean(a(3:14, :,:),1); %ANN
  sea(8:8+12-1,:,:) =a(3:14, :,:);    %MON
end
  
return
