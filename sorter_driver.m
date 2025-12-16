function x=sorter_driver(var, omega, v, a)
omg_up=-15; omg_dn=15; %omg_up=-0; omg_dn=0;
[x.pavg,x.avg,x.ompdf,x.std,x.qtl]=sorter_new(a.*var,omega,v.obin,'2d',v);
id=(v.obinc<omg_up);  
b=sum(x.ompdf(id)); x.avg_up=sum(x.pavg(id))/b; x.pdf_up=b;
id=(v.obinc>=omg_up & v.obinc<=omg_dn); 
b=sum(x.ompdf(id)); x.avg_ne=sum(x.pavg(id))/b; x.pdf_ne=b;
id=(v.obinc>omg_dn);  
b=sum(x.ompdf(id)); x.avg_dn=sum(x.pavg(id))/b; x.pdf_dn=b;

b=sum(x.ompdf); x.avg_all=sum(x.pavg)/b; x.pdf_all=b;
