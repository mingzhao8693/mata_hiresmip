function [avg fav]=get_fa(v,i,nday,id);
if strcmp(id,'dn')
  if (nday==1)
    fav=v.r(i).w500_stat.dn.fav;
    avg=v.r(i).w500_stat.dn.avg;
  elseif (nday==2)
    fav=v.r(i).w500_stat2.dn.fav;
    avg=v.r(i).w500_stat2.dn.avg;
  elseif (nday==4)
    fav=v.r(i).w500_stat4.dn.fav;
    avg=v.r(i).w500_stat4.dn.avg;
  elseif (nday==8)
    fav=v.r(i).w500_stat8.dn.fav;
    avg=v.r(i).w500_stat8.dn.avg;
  end
elseif strcmp(id,'up')
  if (nday==1)
    fav=v.r(i).w500_stat.up.fav;
    avg=v.r(i).w500_stat.up.avg;
  elseif (nday==2)
    fav=v.r(i).w500_stat2.up.fav;
    avg=v.r(i).w500_stat2.up.avg;
  elseif (nday==4)
    fav=v.r(i).w500_stat4.up.fav;
    avg=v.r(i).w500_stat4.up.avg;
  elseif (nday==8)
    fav=v.r(i).w500_stat8.up.fav;
    avg=v.r(i).w500_stat8.up.avg;
  end
elseif strcmp(id,'cdn');
  if (nday==1)
    fav=v.r(i).w500_stat.cdn.fav;
    avg=v.r(i).w500_stat.cdn.avg;
  elseif (nday==2)
    fav=v.r(i).w500_stat2.cdn.fav;
    avg=v.r(i).w500_stat2.cdn.avg;
  elseif (nday==4)
    fav=v.r(i).w500_stat4.cdn.fav;
    avg=v.r(i).w500_stat4.cdn.avg;
  elseif (nday==8)
    fav=v.r(i).w500_stat8.cdn.fav;
    avg=v.r(i).w500_stat8.cdn.avg;
  end
elseif strcmp(id,'cup');
  if (nday==1)
    fav=v.r(i).w500_stat.cup.fav;
    avg=v.r(i).w500_stat.cup.avg;
  elseif (nday==2)
    fav=v.r(i).w500_stat2.cup.fav;
    avg=v.r(i).w500_stat2.cup.avg;
  elseif (nday==4)
    fav=v.r(i).w500_stat4.cup.fav;
    avg=v.r(i).w500_stat4.cup.avg;
  elseif (nday==8)
    fav=v.r(i).w500_stat8.cup.fav;
    avg=v.r(i).w500_stat8.cup.avg;
  end
elseif strcmp(id,'cld');
  if (nday==1)
    fav=v.r(i).w500_stat.cld.fav;
    avg=v.r(i).w500_stat.cld.avg;
  elseif (nday==2)
    fav=v.r(i).w500_stat2.cld.fav;
    avg=v.r(i).w500_stat2.cld.avg;
  elseif (nday==4)
    fav=v.r(i).w500_stat4.cld.fav;
    avg=v.r(i).w500_stat4.cld.avg;
  elseif (nday==8)
    fav=v.r(i).w500_stat8.cld.fav;
    avg=v.r(i).w500_stat8.cld.avg;
  end
elseif strcmp(id,'clr');
  if (nday==1)
    fav=v.r(i).w500_stat.clr.fav;
    avg=v.r(i).w500_stat.clr.avg;
  elseif (nday==2)
    fav=v.r(i).w500_stat2.clr.fav;
    avg=v.r(i).w500_stat2.clr.avg;
  elseif (nday==4)
    fav=v.r(i).w500_stat4.clr.fav;
    avg=v.r(i).w500_stat4.clr.avg;
  elseif (nday==8)
    fav=v.r(i).w500_stat8.clr.fav;
    avg=v.r(i).w500_stat8.clr.avg;
  end
elseif strcmp(id,'upmdn');
  if (nday==1)
    fav=v.r(i).w500_stat.upmdn.ts;
    avg=v.r(i).w500_stat.upmdn.avg;
  elseif (nday==2)
    fav=v.r(i).w500_stat2.upmdn.ts;
    avg=v.r(i).w500_stat2.upmdn.avg;
  elseif (nday==4)
    fav=v.r(i).w500_stat4.upmdn.ts;
    avg=v.r(i).w500_stat4.upmdn.avg;
  elseif (nday==8)
    fav=v.r(i).w500_stat8.upmdn.ts;
    avg=v.r(i).w500_stat8.upmdn.avg;
  end
 
end
 
return
