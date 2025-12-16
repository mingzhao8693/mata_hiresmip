function v=get_trop_stat(c,w,r);
%c=c2; w=w2;
xs=r.xs; xe=r.xe; ys=r.ys; ye=r.ye; a=r.aa(ys:ye,xs:xe);
for i=1:12; 
  aa(i,:,:)=a/mean(mean(a)); 
  lm(i,:,:)=r.lm(ys:ye,xs:xe);
end;

a=c(:,ys:ye,xs:xe); b=w(:,ys:ye,xs:xe); 
idall=~isnan(a) | (lm==0);
a=a(idall); b=b(idall); bma=b-a; aa=aa(idall);
x=[1 10 25 50 75 90 99];
for i=1:length(x)
  y(i)=prctile(a,x(i));
  id=a>=y(i); A=aa(id)/mean(aa(id)); v.warm(i)=mean(bma(id).*A);
  id=a< y(i); A=aa(id)/mean(aa(id)); v.cold(i)=mean(bma(id).*A);
end
v.prc=x;
v.val=y;


return
