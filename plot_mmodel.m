function plot_mmodel(vm, o, p)
c = jet; 
%BWR Colormap
%m=100; n=fix(0.5*m);
%r = [(0:1:n-1)/n,ones(1,n)]; g = [(0:n-1)/n, (n-1:-1:0)/n]; b = [ones(1,n),(n-1:-1:0)/n];
%c = [r(:), g(:), b(:)];

mod_num = length(o.shared_list);
lon=o.lon; lat=o.lat; co='k'; cmin=p.cmin; cmax=p.cmax;
m=p.mon; 

pms=[ 0, 0, p.xsize, p.ysize]*1.2; fsize=6; 
handle=figure('Position',pms,'visible','on'); 
row=7; col=5; a=o.lm0; a(a>=0.5)=1; a(a<0.5)=0; lm=a;
for i = 1:mod_num
  % Plotting Bias
  subplot(row, col, i); colormap(c);
  v=vm(i).v;
  if strcmp(p.vname,'pr_bias')
    a=squeeze(v.sfc.pr.clm(m,:,:)-o.sfc.pr.clm(m,:,:));
    obs=squeeze(o.sfc.pr.clm(m,:,:));
    grmse=v.pr.rmse.glob(m); trmse=v.pr.rmse.trop(m);
    gbias=v.pr.mavg.glob(m); tbias=v.pr.mavg.trop(m);
  elseif strcmp(p.vname,'ts_bias')
    a=squeeze(v.sfc.ts.clm(m,:,:)-o.sfc.ts.clm(m,:,:));
    obs=squeeze(o.sfc.ts.clm(m,:,:));
    grmse=v.ts.rmse.glob(m); trmse=v.ts.rmse.trop(m);
    gbias=v.ts.mavg.glob(m); tbias=v.ts.mavg.trop(m);
  end
  pcolor(lon,lat,a); hold on; 
  shading flat; caxis([cmin, cmax]);
  contour(lon,lat,lm,1,co);
  rectangle('Position',[240 -2  120  4],'LineStyle','--');
  rectangle('Position',[150 -20 90  40],'LineStyle','--');
  rectangle('Position',[240 -20 140 40],'LineStyle','--');
  rectangle('Position',[150 -2  90   4],'LineStyle','--');
  % Observational Data
  contour(lon,lat,obs,p.contour,'Color',[0.5 0.5 0.5]);
  set(gca,'FontSize',fsize); axis([p.x1 p.x2 p.y1 p.y2]);
  title(strcat(o.shared_list(i),' (',o.month(m),')'),'FontSize',fsize);
  if  p.y2==90
    s=" (G-Bias:"+sprintf("%5.2f", gbias); 
    s=s +"; G-RMSE: "+sprintf("%5.2f",grmse);
  else
    s=" (BIAS:"+sprintf("%5.2f", tbias); 
    s=s +"; RMSE: "+sprintf("%5.2f",trmse);
  end
end

%s="Monthly Climatological Precipitation Bias (CMIP6 "; s2=" Run)";
a=p.vname; a=strrep(a,'_',' '); %sgtitle(a);
cb = colorbar('FontSize',fsize+4,'Location','southoutside');
set(cb, 'Position', [.165 .04 .7 .03]); caxis([cmin, cmax]); 
c=colormap(jet); 
%if p.opt == "bias"; a=length(c); c(a/2-1:a/2+2,:)=1; colormap(c);end;
% cb.Position = [0.92 0.11 0.02 0.81]; full size right outside
%cb.Position = [0.92 0.45 0.02 0.41];

vname = p.vname+"_allmodels_"+o.month(m);
mod_name=p.mod_name; visfig='off'; figpath='./fig_cmip6/';
printnew(visfig,figpath,mod_name,vname);

return

