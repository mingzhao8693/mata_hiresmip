function v=corrslop(x,y)
v.s=linortfit2(x,y); %v.s=polyfit(x,y,1); 
[r,p]=corrcoef(x,y);
v.r=[r(1,2) p(1,2)];
return
