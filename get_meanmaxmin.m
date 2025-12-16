function y=get_meanmaxmin(var,time)
%var(time,member)
nt=length(var(:,1)); y.time=time;
for t=1:nt
  y.mean(t)=mean(var(t,:));
  y.min(t) =min(var(t,:));
  y.max(t) =max(var(t,:));
end
