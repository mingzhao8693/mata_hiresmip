function [maxMag]=findmaxmag(U1,V1,U2,V2,U3,V3)

  [n,m]=size(U1);
  u1=reshape(U1,n*m,1); v1=reshape(V1,n*m,1);
  u2=reshape(U2,n*m,1); v2=reshape(V2,n*m,1);
  u3=reshape(U3,n*m,1); v3=reshape(V3,n*m,1);

  maxMag = max([
		sqrt(u1(:).^2 + v1(:).^2);
		sqrt(u2(:).^2 + v2(:).^2);
		sqrt(u3(:).^2 + v3(:).^2)
		]);
 return
