function [vx]=csampone(varx,v,dim,id,opt)
pctile=v.pctile;
if (opt==0)
  a=varx; a(~id.up) =NaN; vx.up  = getavar_smart(a,v,dim,[0 1],pctile);
  a=varx; a(~id.dn) =NaN; vx.dn  = getavar_smart(a,v,dim,[0 1],pctile);
  a=varx;                 vx.all = getavar_smart(a,v,dim,[0 1],pctile);
else
  a=varx; a(~id.cup)=NaN; vx.cup = getavar_smart(a,v,dim,[0 1],pctile);
  a=varx; a(~id.cdn)=NaN; vx.cdn = getavar_smart(a,v,dim,[0 1],pctile);
  a=varx; a(~id.cld)=NaN; vx.cld = getavar_smart(a,v,dim,[0 1],pctile);
  a=varx; a(~id.clr)=NaN; vx.clr = getavar_smart(a,v,dim,[0 1],pctile);
  a=varx; a(~id.up) =NaN; vx.up  = getavar_smart(a,v,dim,[0 1],pctile);
  a=varx; a(~id.dn) =NaN; vx.dn  = getavar_smart(a,v,dim,[0 1],pctile);
  a=varx;                 vx.all = getavar_smart(a,v,dim,[0 1],pctile);
end

size(varx)
if strcmp(dim,'3d')
  vx.yavg=squeeze(mean(mean(varx,1),3));
else
  vx.yavg=squeeze(mean(mean(varx,1),2));
end
return
