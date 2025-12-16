function [rg id_rg]=get_var_state(v,sname,var)
s=v.s; a=s.lm0; aa=s.aa; lat=s.lat; lon=s.lon;
if strcmp(sname,'NWR')
  sname='Washington';     id_wa=get_reg_id(a,lat,lon,sname);
  sname='Oregon';         id_or=get_reg_id(a,lat,lon,sname);
  sname='Idaho';          id_id=get_reg_id(a,lat,lon,sname);
  id_rg=id_wa|id_or|id_id; 
elseif strcmp(sname,'WWR')
  sname='California';     id_ca=get_reg_id(a,lat,lon,sname);
  sname='Nevada';         id_nv=get_reg_id(a,lat,lon,sname);
  id_rg=id_ca|id_nv; 
elseif strcmp(sname,'SWR')
  sname='Arizona';        id_az=get_reg_id(a,lat,lon,sname);
  sname='Colorado';       id_co=get_reg_id(a,lat,lon,sname);
  sname='New Mexico';     id_nm=get_reg_id(a,lat,lon,sname);
  sname='Utah';           id_ut=get_reg_id(a,lat,lon,sname);
  id_rg=id_az|id_co|id_nm|id_ut;
elseif strcmp(sname,'SSR')
  sname='Arkansas';       id_ar=get_reg_id(a,lat,lon,sname);
  sname='Kansas';         id_ks=get_reg_id(a,lat,lon,sname);
  sname='Louisiana';      id_la=get_reg_id(a,lat,lon,sname);
  sname='Mississippi';    id_ms=get_reg_id(a,lat,lon,sname);
  sname='Oklahoma';       id_ok=get_reg_id(a,lat,lon,sname);
  sname='Texas';          id_tx=get_reg_id(a,lat,lon,sname);
  id_rg=id_ar|id_ks|id_la|id_ms|id_ok|id_tx;
elseif strcmp(sname,'NRP')
  sname='Montana';        id_mt=get_reg_id(a,lat,lon,sname);
  sname='Nebraska';       id_ne=get_reg_id(a,lat,lon,sname);
  sname='North Dakota';   id_nd=get_reg_id(a,lat,lon,sname);
  sname='South Dakota';   id_sd=get_reg_id(a,lat,lon,sname);
  sname='Wyoming';        id_wy=get_reg_id(a,lat,lon,sname);
  id_rg=id_mt|id_ne|id_nd|id_sd|id_wy;
elseif strcmp(sname,'SER')
  sname='Alabama';        id_al=get_reg_id(a,lat,lon,sname);
  sname='Florida';        id_fl=get_reg_id(a,lat,lon,sname);
  sname='Georgia.';       id_ga=get_reg_id(a,lat,lon,sname);
  sname='North Carolina'; id_nc=get_reg_id(a,lat,lon,sname);
  sname='South Carolina'; id_sc=get_reg_id(a,lat,lon,sname);
  sname='Virginia';       id_va=get_reg_id(a,lat,lon,sname);
  id_rg=id_al|id_fl|id_ga|id_nc|id_sc|id_va;
elseif strcmp(sname,'OVR')
  sname='Illinois';       id_il=get_reg_id(a,lat,lon,sname);
  sname='Indiana';        id_in=get_reg_id(a,lat,lon,sname);
  sname='Kentucky';       id_ky=get_reg_id(a,lat,lon,sname);
  sname='Missouri';       id_ms=get_reg_id(a,lat,lon,sname);
  sname='Ohio';           id_oh=get_reg_id(a,lat,lon,sname);
  sname='Tennessee';      id_tn=get_reg_id(a,lat,lon,sname);
  sname='West Virginia';  id_wv=get_reg_id(a,lat,lon,sname);
  id_rg=id_il|id_in|id_ky|id_ms|id_oh|id_tn|id_wv;
elseif strcmp(sname,'UMW')
  sname='Iowa';           id_ia=get_reg_id(a,lat,lon,sname);
  sname='Michigan';       id_mi=get_reg_id(a,lat,lon,sname);
  sname='Minnesota';      id_mn=get_reg_id(a,lat,lon,sname);
  sname='Wisconsin';      id_wi=get_reg_id(a,lat,lon,sname);
  id_rg=id_ia|id_mi|id_mn|id_wi;
elseif strcmp(sname,'NER')
  sname='Connecticut';    id_ct=get_reg_id(a,lat,lon,sname);
  sname='Delaware';       id_de=get_reg_id(a,lat,lon,sname);
  sname='Maine';          id_me=get_reg_id(a,lat,lon,sname);
  sname='Maryland';       id_md=get_reg_id(a,lat,lon,sname);
  sname='Massachusetts';  id_ma=get_reg_id(a,lat,lon,sname);
  sname='New Hampshire';  id_nh=get_reg_id(a,lat,lon,sname);
  sname='New Jersey';     id_nj=get_reg_id(a,lat,lon,sname);
  sname='New York';       id_ny=get_reg_id(a,lat,lon,sname);
  sname='Pennsylvania';   id_pa=get_reg_id(a,lat,lon,sname);
  sname='Rhode Island';   id_ri=get_reg_id(a,lat,lon,sname);
  sname='Vermont';        id_vt=get_reg_id(a,lat,lon,sname);
  id_rg=id_ct|id_de|id_me|id_md|id_ma|id_nh|id_nj|id_ny|id_pa|id_ri|id_vt;
else
  id_rg=get_reg_id(a,lat,lon,sname);
end
%figure; 
%a(id_rg==1)=1; a(id_rg==0)=0; pcolor(lon,lat,a); shading flat; hold on;
%contour(lon,lat,s.lm0,[0 0.5],'w'); shading flat; axis([220 300 20 60]);
for t=1:v.nyr
  for m=1:v.nseason;
    id0=(id_rg==1); a0=aa(id0); a0=a0/mean(a0);
    a=squeeze(var(t,m,:,:)); a=a(id0); id=~isnan(a);
    rg(t,m)=sum(a(id).*a0(id))./sum(a0(id));
  end
end

return
