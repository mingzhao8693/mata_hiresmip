function [p]=smoothp(p,npx,npy,s,e)
%npx=3; npy=3; s='omitnan'; e='shrink';
a=p.z1; p.z1=movmean(movmean(a,npy,1,s,'Endpoints',e),npx,2,s,'Endpoints',e);
a=p.z2; p.z2=movmean(movmean(a,npy,1,s,'Endpoints',e),npx,2,s,'Endpoints',e);
a=p.z3; p.z3=movmean(movmean(a,npy,1,s,'Endpoints',e),npx,2,s,'Endpoints',e);
a=p.z4; p.z4=movmean(movmean(a,npy,1,s,'Endpoints',e),npx,2,s,'Endpoints',e);
a=p.z5; p.z5=movmean(movmean(a,npy,1,s,'Endpoints',e),npx,2,s,'Endpoints',e);
a=p.z6; p.z6=movmean(movmean(a,npy,1,s,'Endpoints',e),npx,2,s,'Endpoints',e);
return
