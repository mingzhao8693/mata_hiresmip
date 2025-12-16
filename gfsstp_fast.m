function x=gfsstp_fast(var, varp, p_thresh, g, optx)
%note: g.sstp=(wei'*sstp) (153,12,nt) 
%g.sstp: containing the projection of SST anomalies onto patches

%the line below retains only grid cells with difference significant at p-level=p_thresh
var=var .* (varp < p_thresh);                              

nt=length(g.sstp(1,1,:)); %time dimension

for m=1:12
  %gfx(m,:,:)=wei*A'; gf=squeeze(gf(m,:,:)); gf=gf';
  A=squeeze(var(:,:,m));
  for t=1:nt;
    ssta=squeeze(g.sstp(:,m,t));
    y=A*ssta; %y=gf*Tp;
    y=reshape(y,144,90); y=y'; 
    x.map_gf_mon(t,m,:,:)=y;
    x.ts_mon(t,m)=mean(mean(y.*g.aa));
  end
end
x.map_gf_ann=squeeze(mean(x.map_gf_mon,2)); 
x.ts_ann=squeeze(mean(x.ts_mon,2)); 

return
