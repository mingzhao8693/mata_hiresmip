function plot_arfqbias(x1,y1,z0,z1,lm,cs,cs1,s1,s2,s3,vname,str,a)
%str=vname(end-2:end);
do_NH=0; do_SH=0;
if do_NH
  id=(y1>0); aa=a(id,:); zz0=z0(id,:); zz1=z1(id,:);
  xy=[0 360   0 90]; pms=[ 0, 0, 500, 600]*1.2;
elseif (do_SH)
  id=(y1<0); aa=a(id,:); zz0=z0(id,:); zz1=z1(id,:);
  xy=[0 360  -90 0]; pms=[ 0, 0, 500, 600]*1.2;
else
  aa=a; zz0=z0; zz1=z1;
  xy=[0 360 -90 90]; pms=[ 0, 0, 500, 900]*1.2;
end

z0_mean=mean(mean(zz0.*aa));
z1_mean=mean(mean(zz1.*aa)); 
ee=zz1-zz0; rmse=sqrt(mean(mean(ee.*ee.*aa))); bias=mean(mean(ee.*aa)); 
c=corrcoef(zz1,zz0); corr=c(1,2); [z0_mean z1_mean rmse bias corr]

e=z1-z0;
str=strcat(' (',str,')'); s1=strcat(s1,str); s2=strcat(s2,str); 
fsize=12; lw=2; row=3; col=1;
handle = figure('Position', pms,'visible','on');
subplot(row,col,1); xl='longitude'; yl='latitude';
pcolor(x1,y1,z0); hold on; shading flat; colorbar; caxis([cs]); 
contourf(x1,y1,lm/10,'k'); axis(xy); %plot([0 360],[0 0],'w-','LineWidth',3);
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize);
%s1=sprintf('%s (mean:%5.4f)',s1,z0_mean); 
title(s1,'FontSize',fsize); 

subplot(row,col,2);
pcolor(x1,y1,z1); hold on; shading flat; colorbar; caxis([cs]); 
contourf(x1,y1,lm/10,'k'); axis(xy); %plot([0 360],[0 0],'w-','LineWidth',3);
ylabel(yl,'FontSize',fsize); set(gca,'FontSize',fsize); 
title(s2,'FontSize',fsize); 
%s2=sprintf('%s (mean:%5.4f)',s2,z1_mean); 
title(s2,'FontSize',fsize); 

subplot(row,col,3); %a=vm.aa;
pcolor(x1,y1,e); hold on; shading flat; colorbar; caxis([cs1]);
contourf(x1,y1,lm/10,'k'); axis(xy); %plot([0 360],[0 0],'w-','LineWidth',3);
xlabel(xl,'FontSize',fsize); ylabel(yl,'FontSize',fsize);
set(gca,'FontSize',fsize); 
s=sprintf('%s (RMSE=%5.3f; CORR=%4.2f)',s3,rmse,corr);
%s=sprintf('Model minus ERAI (RMSE=%5.3f; CORR=%4.2f; BIAS=%4.3f)',rmse,corr,bias);
title(s,'FontSize',fsize);
%subplot(row,col,4);
%pcolor(x1,y1,(z1-z0)./z0*100); hold on; shading flat; colorbar; axis(xy); 
%xlabel(xl,'FontSize',fsize); %ylabel(yl,'FontSize',fsize);
%contourf(x1,y1,lm,'w'); 
%set(gca,'FontSize',fsize);
visfig='off'; figpath='./fig_AR/'; expn='hiresmip'; 
printit(visfig,figpath,expn,vname);
