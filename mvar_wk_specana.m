function v=mvar_wk_specana(tpath,expn,yr1,yr2,yrs,nyr,latlon,region,cald)
opt=0;
varn='olr'; fext=strcat('atmos.',yr1,'0101-',yr2,'1231.');
fn  =strcat(tpath,expn,'/atmos_daily/',fext,varn,'.nc')
if (exist(fn,'file') == 2)
  v.olr=wk_specana(tpath,expn,yr1,yr2,yrs,nyr,latlon,region,varn,cald,opt);
end

varn='precip'; fext=strcat('atmos.',yr1,'0101-',yr2,'1231.');
fn  =strcat(tpath,expn,'/atmos_daily/',fext,varn,'.nc')
if (exist(fn,'file') == 2)
  v.pcp=wk_specana(tpath,expn,yr1,yr2,yrs,nyr,latlon,region,varn,cald,opt);
end

varn='u850'; fext=strcat('atmos.',yr1,'0101-',yr2,'1231.');
fn  =strcat(tpath,expn,'/atmos_daily/',fext,varn,'.nc')
if (exist(fn,'file') == 2)
  v.u850=wk_specana(tpath,expn,yr1,yr2,yrs,nyr,latlon,region,varn,cald,1);
end

varn='u200'; fext=strcat('atmos.',yr1,'0101-',yr2,'1231.');
fn  =strcat(tpath,expn,'/atmos_daily/',fext,varn,'.nc')
if (exist(fn,'file') == 2)
  v.u200=wk_specana(tpath,expn,yr1,yr2,yrs,nyr,latlon,region,varn,cald,opt);
else
  varn='u250';   fext=strcat('atmos.',yr1,'0101-',yr2,'1231.');
  fn  =strcat(tpath,expn,'/atmos_daily/',fext,varn,'.nc')
  if (exist(fn,'file') == 2)
    v.u200=wk_specana(tpath,expn,yr1,yr2,yrs,nyr,latlon,region,varn,cald,opt);
  end
end

fnout=strcat(tpath,expn,'/',expn,'_',region,'_wk')
fn=strcat(fnout,'.mat'); v.fn=fn; save(fn,'v');

