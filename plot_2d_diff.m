function plot_2d_diff(p)
%str=vname(end-2:end);
x1=p.x1; y1=p.y1; z0=p.z0; z1=p.z1; lm=p.lm; cs=p.cs; cs1=p.cs1;
s1=p.s1; s2=p.s2; s3=p.s3; str=p.str; a=p.a;

%compute statistics
id= isnan(z0) | isnan(z1); id=~id;
aa=a(id)/mean(a(id));
z0_mean=mean(z0(id).*aa);
z1_mean=mean(z1(id).*aa);
e=z1-z0; rmse=sqrt(mean(e(id).*e(id).*aa)); bias=mean(e(id).*aa); 
c=corrcoef(z1(id),z0(id)); corr=c(1,2); 
msg=sprintf('obsdmean=%f; modmean=%f; bias=%f; rmse=%f; corr=%f',z0_mean,z1_mean,bias,rmse,corr);
disp(msg);
%z0_mean=mean(mean(z0.*a)); z1_mean=mean(mean(z1.*a));
%e=z1-z0; rmse=sqrt(mean(mean(e.*e.*a))); bias=mean(mean(e.*a)); 
%c=corrcoef(z1,z0); corr=c(1,2); 
%msg=sprintf('obsdmean=%f; modmean=%f; bias=%f; rmse=%f; corr=%f',z0_mean,z1_mean,bias,rmse,corr);
%disp(msg);
%end of compute statistics

str=strcat(' (',str,')'); s1=strcat(s1,str); s2=strcat(s2,str); 
pms=[ 0, 0, 500, 900]*1; fsize=16; lw=2; row=3; col=1;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); xy=[0 360 -90 90]; xl='longitude'; yl='latitude';
pcolor(x1,y1,z0); hold on; shading flat; colorbar; caxis([cs]); 
contourf(x1,y1,lm/10,'w'); axis(xy); 
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
%s1=sprintf('%s (mean:%5.4f)',s1,z0_mean); 
title(s1,'FontSize',fsize); 

subplot(row,col,2);
pcolor(x1,y1,z1); hold on; shading flat; colorbar; caxis([cs]); 
contourf(x1,y1,lm/10,'w'); axis(xy); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); title(s2,'FontSize',fsize); 
%s2=sprintf('%s (mean:%5.4f)',s2,z1_mean); 
title(s2,'FontSize',fsize); 

subplot(row,col,3); %e=e./z0*100;
pcolor(x1,y1,e); hold on; shading flat; colorbar; caxis([cs1]);
contourf(x1,y1,lm/50,'w'); axis(xy); 
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize);
if strcmp(p.s2(end-5:end),'Future')
  s3=sprintf('%s (mean=%5.3f)',s3,bias);
else
  s3=sprintf('%s (RMSE=%5.3f; CORR=%4.2f)',s3,rmse,corr);
  %s=sprintf('Model minus ERAI (RMSE=%5.3f; CORR=%4.2f; BIAS=%4.3f)',rmse,corr,bias);
end
title(s3,'FontSize',fsize);
%subplot(row,col,4);
%pcolor(x1,y1,(z1-z0)./z0*100); hold on; shading flat; colorbar; axis(xy); 
%xlabel(xl,'FontSize',fsize); %ylabel(yl,'FontSize',fsize);
%contourf(x1,y1,lm,'w'); 
%set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,p.vname);
