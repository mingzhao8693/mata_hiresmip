function [pva, va, pdf, va_std, va_qtl]=sorter_new(var, var0, bin, opt, v)
%input variables
%var: variable to be sorted; var0: variable used to sort;
%bin: var0 bins used to sort; opt: dimension of var;
%v:   supply for other information needed

%output variables
%pdf: pdf of var0; va: sorted var; 
%pva: sorted var times its statistical weight
v.dlo
if (strcmp(opt,'3d')) % if var is a 3d variable in space
  ps0 =reshape(v.ps,  v.nt*v.nlat*v.nlon, 1);
  var0=reshape(var0,  v.nt*v.nlat*v.nlon, 1);
  lm0 =reshape(v.lm0, v.nt*v.nlat*v.nlon, 1); 
  %var0=var0.*~lm0; var0=var0(var0~=0); NO=length(var0);
  kdim=length(var(1,:,1,1));
  for k=1:kdim
    vx = squeeze(var(:,k,:,:)); 
    vx = reshape(vx, v.nt*v.nlat*v.nlon, 1);
    id = (var0~=-999) & (vx>=-1e10);
    if(strcmp(v.dlo,'do_ocean'))
      id = id & (lm0==0);
    end
    va0= var0(id); vx = vx(id);
    for i=1:length(bin)-1
      id = (va0 > bin(i)) & (va0 <= bin(i+1));
      tmp=vx(id==1);
      if (isempty(tmp));
	va(k,i)=0; no(k,i)=0;
      else
	va(k,i)=mean(tmp,1); no(k,i)=length(tmp);
      end
    end
    pva(k,:)=va(k,:).*no(k,:)/sum(no(k,:));
    pdf(k,:)=no(k,:)/sum(no(k,:));
  end

elseif (strcmp(opt,'2d')) % if var is a 2d variable in space
  
  var0=reshape(var0,  v.nt*v.nlat*v.nlon, 1);
  vx  =reshape(var,   v.nt*v.nlat*v.nlon, 1); 
  lm0 =reshape(v.lm0, v.nt*v.nlat*v.nlon, 1);
  id=(var0~=-999) & (vx>-1e6); %figure; hist(vx(id))
  if(strcmp(v.dlo,'do_ocean'))
    id = id & (lm0==0);
  end
  var0=var0(id); vx=vx(id);
  'min and max='; [min(vx) max(vx)]
  %var0=var0.*~lm0; var0=var0(var0~=0); 
  NO=length(var0);
  %vx(vx==0)=-999; vx=vx.*~lm0; vx=vx(vx~=0); vx(vx==-999)=0;

  for i=1:length(bin)-1
    id = (var0 > bin(i)) & (var0 <= bin(i+1));
    tmp=vx(id==1);
    if (isempty(tmp));
      va(i)=0; no(i)=0; va_std(i)=0; 
      va_qtl(i,1)=0; va_qtl(i,2)=0;
    else
      va(i)=mean(tmp,1); no(i)=length(tmp); va_std(i)=std(tmp,1);
      va_qtl(i,1)=quantile(tmp,0.25); 
      va_qtl(i,2)=quantile(tmp,0.75);
    end
  end
  pva=va.*no/sum(no);
  pdf=no/sum(no);
  s=sprintf('percentage: %d/%d=%6.2e',sum(no),NO,sum(no)/NO); disp(s); 

elseif (strcmp(opt,'1d')) % if var and v.om500 is already
                             % reshaped as a 1d variable old style
  vx =var; sum(sum(sum(sum(vx))))
  for i=1:length(bin)-1
    id = (var0 >= bin(i)) & (var0 < bin(i+1));
    tmp=vx(id==1);
    if (isempty(tmp));
      va(i)=0; no(i)=0; va_std(i)=0;
      va_qtl(i,1)=0; va_qtl(i,2)=0;
    else
      va(i)=mean(tmp,1); no(i)=length(tmp); va_std(i)=std(tmp,1);
      va_qtl(i,1)=quantile(tmp,0.25); 
      va_qtl(i,2)=quantile(tmp,0.75);
    end
  end
  pva=va.*no/sum(no);
  pdf=no/sum(no);
  NO=length(vx);
  s=sprintf('percentage: %d/%d=%6.2e',sum(no),NO,sum(no)/NO); disp(s); 

end 



return














figure
v.ombin=[-45:10:45]; fsize=14;
contourf(v.ombin,v.pf,va,10); shading flat; colorbar; 
xlabel('omega (hPa/day)','FontSize',fsize);
ylabel('Pressure (hPa)','FontSize',fsize);
set(gca,'YDir','reverse');

fmt='-dpng'; fmt='-djpeg90';
figpath='./figures/'; figname=strcat(figpath,'liq_om.jpg'); 
set(gcf,'PaperPositionMode','auto'); print(gcf,fmt, figname)
