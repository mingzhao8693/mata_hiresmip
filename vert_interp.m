function [varo]=vert_interp(v,vari,zf,z0)
%interpolate vari(nt,nz,ny,nx) from zf to reference z0 
%var=rho; z0=v.zf.avg; 
for t=1:v.nt
  for j=1:v.ny
    for i=1:v.nx
      a=squeeze(var(t,:,j,i));
      z=squeeze(zf (t,:,j,i));
      b=interp1(z,a,z0);
      varo(t,:,j,i)=b(:);
    end
  end
end

return

figure; 
plot(vari(1,:,1,1),zf(1,:,1,1),'r*-'); hold on;
plot(vari(1,:,1,1),z0,'bs-');
plot(varo(1,:,1,1),z0,'kd-');

      
a=squeeze(var(1,:,:,:)); a=shiftdim(a,1);
z=squeeze(zf (1,:,:,:)); z=shiftdim(z,1);
[x,y,zi]=meshgrid(v.x,v.y,z0); %zi contain reference z defined by z0
b=interp3(x,y,z,a,x,y,zi); 
ai=shiftdim(b,-1);


