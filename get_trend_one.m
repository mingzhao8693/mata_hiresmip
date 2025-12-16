function tr=get_trend_one(v1,yr1,yr2,Y,alpha)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Global SST trend analysis%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%note Y/xt/x in Theil_Sen_Regress in get_trend_TSR must be column vector
%otherwise it returns NaN, this is why Y cannot be [1950:2019];
%alpha=0.8; Y=v1.yr';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%yr1=1979; yr2=2020; 
t1=find(Y==yr1); t2=find(Y==yr2); xt=Y(t1:t2); tr.alpha=alpha;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for m=1:7;
  a=v1.ts(t1:t2,m,:,:); a=squeeze(a); v=get_trend_TSR(v1.s,a,xt,alpha); 
  v.ice_clim=squeeze(mean(v1.ice(t1:t2,m,:,:),1));
  tr.sst(m)=v;
  a=v1.pcp(t1:t2,m,:,:); a=squeeze(a); v=get_trend_TSR(v1.s,a,xt,alpha); 
  tr.pcp(m)=v;
  a=v1.slp(t1:t2,m,:,:); a=squeeze(a); v=get_trend_TSR(v1.s,a,xt,alpha); 
  tr.slp(m)=v;
  a=v1.z500(t1:t2,m,:,:); a=squeeze(a); v=get_trend_TSR(v1.s,a,xt,alpha); 
  tr.z500(m)=v;
end

return


m=7; %annual mean
a=v1.ts(t1:t2,m,:,:); a=squeeze(a); v=get_trend_TSR(v1.s,a,xt,alpha); 
v.ice_clim=squeeze(mean(v1.ice(t1:t2,m,:,:),1));
tr.sst_ann=v;
a=v1.pcp(t1:t2,m,:,:); a=squeeze(a); v=get_trend_TSR(v1.s,a,xt,alpha); 
tr.pcp_ann=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=1; %DJF
a=v1.ts(t1:t2,m,:,:); a=squeeze(a); v=get_trend_TSR(v1.s,a,xt,alpha); 
v.ice_clim=squeeze(mean(v1.ice(t1:t2,m,:,:),1));
tr.sst_djf=v;
a=v1.pcp(t1:t2,m,:,:); a=squeeze(a); v=get_trend_TSR(v1.s,a,xt,alpha); 
tr.pcp_djf=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=3; %JJA
a=v1.ts(t1:t2,m,:,:); a=squeeze(a); v=get_trend_TSR(v1.s,a,xt,alpha); 
v.ice_clim=squeeze(mean(v1.ice(t1:t2,m,:,:),1));
tr.sst_jja=v;
a=v1.pcp(t1:t2,m,:,:); a=squeeze(a); v=get_trend_TSR(v1.s,a,xt,alpha); 
tr.pcp_jja=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=5; %NDJFM
a=v1.ts(t1:t2,m,:,:); a=squeeze(a); v=get_trend_TSR(v1.s,a,xt,alpha); 
v.ice_clim=squeeze(mean(v1.ice(t1:t2,m,:,:),1));
tr.sst_ndjfm=v;
a=v1.pcp(t1:t2,m,:,:); a=squeeze(a); v=get_trend_TSR(v1.s,a,xt,alpha); 
tr.pcp_ndjfm=v;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=6; %MJJAS
a=v1.ts(t1:t2,m,:,:); a=squeeze(a); v=get_trend_TSR(v1.s,a,xt,alpha); 
v.ice_clim=squeeze(mean(v1.ice(t1:t2,m,:,:),1));
tr.sst_mjjas=v;
a=v1.pcp(t1:t2,m,:,:); a=squeeze(a); v=get_trend_TSR(v1.s,a,xt,alpha); 
tr.pcp_mjjas=v;

return
