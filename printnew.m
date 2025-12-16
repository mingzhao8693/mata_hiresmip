function printnew(visfig,figpath,expn,vname)
fmt='-depsc2'; %fmt='-dpdf'; 
%fmt='-dpng';
if strcmp(visfig,'off')
  if strcmp(fmt,'-depsc2')
    ext='.eps';
  elseif strcmp(fmt,'-dpdf')
    ext='.pdf';
  elseif strcmp(fmt,'-dpng')
    ext='.png';
  end
  figname=strcat(figpath, expn, '_', vname, ext);figname
  %figname=strcat(figpath, vname, ext);figname
  %set(gcf,'PaperPositionMode','auto'); 
  %print(gcf, fmt, figname, '-r120');
  print(figname, fmt, '-painters'); 
end


