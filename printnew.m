function printnew(visfig,figpath,expn,vname,fmt)
if strcmp(fmt,'eps');
  fmt='-depsc2'; %fmt='-dpdf';
else strcmp(fmt,'png');
  fmt='-dpng';
end

if strcmp(visfig,'off')
  if strcmp(fmt,'-depsc2')
    ext='.eps';
  elseif strcmp(fmt,'-dpdf')
    ext='.pdf';
  elseif strcmp(fmt,'-dpng')
    ext='.png';
  end
  figname=strcat(figpath, expn, '_', vname, ext); disp(figname);
  %figname=strcat(figpath, vname, ext);figname
  %set(gcf,'PaperPositionMode','auto'); 
  %print(gcf, fmt, figname, '-r120');
  print(figname, fmt, '-painters'); 
end


