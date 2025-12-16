function x=gfsstp(var, varp, p_thresh, g, optx)
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

%below is a slower way to compute GF reconstruction
%but it may allow more SST pattern attribution
if (optx ==1) 
  %below is GF calculation
  for m=1:12; m
    a=var(:,:,m); a=squeeze(a); a=g.wei*a'; 
    x.gf(m,:,:)=a;
  end
  x.gf_ann=squeeze(mean(x.gf,1)); 
  aa=reshape(g.aa',144*90,1); aa=repmat(aa,[1 144*90]);
  varx=aa.*x.gf_ann;  
  a=squeeze(sum(varx,2)); a=reshape(a,144,90); a=a';
  x.gf_ann_g=a; x.gf_ann_g0=mean(mean(a.*g.aa));
  a=squeeze(sum(varx,1)); a=reshape(a,144,90); a=a';
  x.gf_ann_u=a; x.gf_ann_u0=mean(mean(a.*g.aa));
  
  %using GF to do reconstruction
  for m=1:12
    for t=1:nt;
      %Tp is SST anomaly
      Tp=squeeze(g.Tp(t,m,:));%this is SST anomaly data
      a =squeeze(x.gf(m,:,:));
      a = a'*Tp;
      a=reshape(a,144,90); %figure; pcolor(a'); shading flat;colorbar;colormap(jet)
      x.map_gf_mon1(t,m,:,:)=a';
    end
  end

end

return
