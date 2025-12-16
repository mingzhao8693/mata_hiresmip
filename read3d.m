function var=read3d(fname,varn,v,obs,myr,p)
%(k=1,     2,   3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13,14,15 for 
%  1000, 925, 850,775,700,600,500,400,300,250,200,150,100,70,50 hPa)
%varn='hght'; fname=strcat(tpath,expn,pp,fext,varn,'.nc')
for i=1:length(p.lev)
  k=p.lev(i);
  a=ncread(fname,varn,[1 1 k 1 ],[Inf Inf 1 Inf]); a=squeeze(a);
  a=permute(a,[3 2 1]); 
  tmp=a(v.ts:v.te,v.ys:v.ye,v.xs:v.xe);
  varx=extracts(tmp,v,obs(i),myr,0);
  varx.plev=p.plev(i); %varx.all=tmp;
  var(i)=varx;
end
return
