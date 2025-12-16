function [c]=get7season_all(ca)
nyr=length(ca)-1; c.nyr=nyr; %yr=197911-202012;
for t=1:nyr;
  c.year(t)=ca(t).year;
  a=[ca(t).frqday(11:12)      ca(t+1).frqday(1:12)];      c.frqday     (t,:)=get7season(a,0);
  a=[ca(t).prday_av(11:12)    ca(t+1).prday_av(1:12)];    c.prday_av   (t,:)=get7season(a,0);
  a=[ca(t).prday_idwei(11:12) ca(t+1).prday_idwei(1:12)]; c.prday_idwei(t,:)=get7season(a,0);
  a=[ca(t).prday_idavg(11:12) ca(t+1).prday_idavg(1:12)]; c.prday_idavg(t,:)=get7season(a,0);
  a=[ca(t).prday_idstd(11:12) ca(t+1).prday_idstd(1:12)]; c.prday_idstd(t,:)=get7season(a,0);
  a=[ca(t).prday_idmax(11:12) ca(t+1).prday_idmax(1:12)]; c.prday_idmax(t,:)=get7season(a,0);
end

return
